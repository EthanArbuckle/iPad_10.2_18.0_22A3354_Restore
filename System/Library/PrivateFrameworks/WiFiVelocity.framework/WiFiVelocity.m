void sub_209C3D960(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, int a12, uint64_t a13, __int16 a14, uint64_t a15, __int16 a16, int a17, __int16 a18, uint64_t a19)
{
  NSObject *OSLog;

  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    OSLog = W5GetOSLog();
    if (os_log_type_enabled(OSLog, OS_LOG_TYPE_DEFAULT))
      _os_log_send_and_compose_impl();
    objc_end_catch();
    JUMPOUT(0x209C3D930);
  }
  _Unwind_Resume(exception_object);
}

void sub_209C3E5DC(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x2A0], 8);
  _Block_object_dispose(&STACK[0x2D0], 8);
  _Block_object_dispose(&STACK[0x2F0], 8);
  _Block_object_dispose(&STACK[0x310], 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_209C3EBE8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_209C3F0A8(void *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    objc_begin_catch(a1);
    JUMPOUT(0x209C3EFE0);
  }
  JUMPOUT(0x209C3F0D8);
}

void sub_209C3F8EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_209C3FBE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_209C3FEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t W5GetOSLog()
{
  if (qword_253D89D40 != -1)
    dispatch_once(&qword_253D89D40, &__block_literal_global);
  return _MergedGlobals;
}

uint64_t W5CreateTarball(void *a1, void *a2, _QWORD *a3)
{
  uint64_t v6;
  off_t st_size;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v28;
  uint64_t v29;
  stat v30;
  id v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  int v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  off_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v31 = 0;
  memset(&v30, 0, sizeof(v30));
  stat((const char *)objc_msgSend((id)objc_msgSend(a1, "path"), "UTF8String"), &v30);
  if (qword_253D89D40 != -1)
    dispatch_once(&qword_253D89D40, &__block_literal_global);
  if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(a1, "path");
    st_size = v30.st_size;
    v8 = objc_msgSend(a2, "path");
    v38 = 136316418;
    v39 = "W5CreateTarball";
    v40 = 2080;
    v41 = "W5MiscUtil.m";
    v42 = 1024;
    v43 = 388;
    v44 = 2114;
    v45 = v6;
    v46 = 2048;
    v47 = st_size;
    v48 = 2114;
    v49 = v8;
    LODWORD(v29) = 58;
    v28 = &v38;
    _os_log_send_and_compose_impl();
  }
  v9 = archive_write_new();
  if (!v9)
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD1128];
    v36 = *MEMORY[0x24BDD0FD8];
    v37 = CFSTR("ENOMEM");
    v16 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v17 = v14;
    v18 = v15;
    v19 = 12;
LABEL_17:
    v31 = (id)objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v19, v16, v28, v29);
    goto LABEL_18;
  }
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "fileExistsAtPath:", objc_msgSend(a1, "path")) & 1) == 0)
  {
    v20 = (void *)MEMORY[0x24BDD1540];
    v21 = *MEMORY[0x24BDD1128];
    v34 = *MEMORY[0x24BDD0FD8];
    v35 = CFSTR("ENOENT");
    v16 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v17 = v20;
    v18 = v21;
    v19 = 2;
    goto LABEL_17;
  }
  archive_write_add_filter_gzip();
  archive_write_set_format_pax();
  objc_msgSend((id)objc_msgSend(a2, "path"), "UTF8String");
  v10 = archive_write_open_filename();
  if (v10)
  {
    v22 = (void *)MEMORY[0x24BDD1540];
    v23 = *MEMORY[0x24BDD1128];
    v24 = v10;
    v32 = *MEMORY[0x24BDD0FD8];
    v33 = CFSTR("err");
    v16 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v17 = v22;
    v18 = v23;
    v19 = v24;
    goto LABEL_17;
  }
  if ((__W5ArchiveAddURLToArchive(v9, a1, (void *)objc_msgSend((id)objc_msgSend(a2, "lastPathComponent"), "stringByDeletingPathExtension"), &v31) & 1) != 0)
  {
    if (qword_253D89D40 != -1)
      dispatch_once(&qword_253D89D40, &__block_literal_global);
    if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(a1, "path");
      v12 = objc_msgSend(a2, "path");
      v38 = 136316162;
      v39 = "W5CreateTarball";
      v40 = 2080;
      v41 = "W5MiscUtil.m";
      v42 = 1024;
      v43 = 412;
      v44 = 2114;
      v45 = v11;
      v46 = 2114;
      v47 = v12;
      v13 = 1;
      _os_log_send_and_compose_impl();
    }
    else
    {
      v13 = 1;
    }
    goto LABEL_22;
  }
LABEL_18:
  if (qword_253D89D40 != -1)
    dispatch_once(&qword_253D89D40, &__block_literal_global);
  v13 = 0;
  if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEFAULT))
  {
    v25 = objc_msgSend(a2, "path");
    v26 = objc_msgSend(v31, "code");
    v39 = "W5CreateTarball";
    v40 = 2080;
    v38 = 136316162;
    v41 = "W5MiscUtil.m";
    v42 = 1024;
    v43 = 408;
    v44 = 2114;
    v45 = v25;
    v46 = 2048;
    v47 = v26;
    _os_log_send_and_compose_impl();
    v13 = 0;
  }
LABEL_22:
  if (a3 && v31)
    *a3 = v31;
  if (v9)
    archive_write_free();
  return v13;
}

uint64_t __W5ArchiveAddURLToArchive(uint64_t a1, void *a2, void *a3, id *a4)
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  id v40;
  _BYTE v41[128];
  _BYTE v42[12];
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  off_t st_size;
  stat v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v40 = 0;
  v8 = (void *)MEMORY[0x20BD17D48]();
  if (!objc_msgSend(a2, "checkResourceIsReachableAndReturnError:", &v40))
    goto LABEL_33;
  v39 = 0;
  if (!objc_msgSend(a2, "getResourceValue:forKey:error:", &v39, *MEMORY[0x24BDBCC60], &v40))
    goto LABEL_33;
  if (objc_msgSend(v39, "BOOLValue"))
  {
    memset(&v51, 0, sizeof(v51));
    stat((const char *)objc_msgSend((id)objc_msgSend(a2, "path"), "UTF8String"), &v51);
    if (qword_253D89D40 != -1)
      dispatch_once(&qword_253D89D40, &__block_literal_global);
    if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(a2, "path");
      *(_QWORD *)&v42[4] = "__W5ArchiveAddURLToArchive";
      v43 = 2080;
      *(_DWORD *)v42 = 136316162;
      v44 = "W5MiscUtil.m";
      v45 = 1024;
      v46 = 341;
      v47 = 2114;
      v48 = v9;
      v49 = 2048;
      st_size = v51.st_size;
      LODWORD(v30) = 48;
      v28 = v42;
      _os_log_send_and_compose_impl();
    }
    v10 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v28, v30), "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", a2, 0, 0, &v40);
    if (v10)
    {
      v11 = v10;
      v33 = a4;
      v12 = v8;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v36;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v36 != v15)
              objc_enumerationMutation(v11);
            v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v16);
            v34 = 0;
            if ((__W5ArchiveAddURLToArchive(a1, v17, objc_msgSend(a3, "stringByAppendingPathComponent:", objc_msgSend(v17, "lastPathComponent", v29, v31)), &v34) & 1) == 0)
            {
              if (qword_253D89D40 != -1)
                dispatch_once(&qword_253D89D40, &__block_literal_global);
              if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEFAULT))
              {
                v32 = objc_msgSend(a2, "path");
                v18 = objc_msgSend(v34, "code");
                *(_DWORD *)v42 = 136316162;
                *(_QWORD *)&v42[4] = "__W5ArchiveAddURLToArchive";
                v43 = 2080;
                v44 = "W5MiscUtil.m";
                v45 = 1024;
                v46 = 351;
                v47 = 2114;
                v48 = v32;
                v49 = 2048;
                st_size = v18;
                LODWORD(v31) = 48;
                v29 = v42;
                _os_log_send_and_compose_impl();
              }
            }
            ++v16;
          }
          while (v14 != v16);
          v19 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
          v14 = v19;
        }
        while (v19);
      }
      v20 = 1;
      v8 = v12;
      a4 = v33;
      goto LABEL_25;
    }
    if (qword_253D89D40 != -1)
      dispatch_once(&qword_253D89D40, &__block_literal_global);
    if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(a2, "path");
      v25 = objc_msgSend(v40, "code");
      *(_QWORD *)&v42[4] = "__W5ArchiveAddURLToArchive";
      v43 = 2080;
      *(_DWORD *)v42 = 136316162;
      v44 = "W5MiscUtil.m";
      v45 = 1024;
      v46 = 344;
      v47 = 2114;
      v48 = v24;
      v49 = 2048;
      st_size = v25;
      _os_log_send_and_compose_impl();
    }
LABEL_33:
    v20 = 0;
    goto LABEL_25;
  }
  *(_QWORD *)v42 = 0;
  if ((__W5ArchiveAddFileURLToArchive() & 1) == 0)
  {
    if (qword_253D89D40 != -1)
      dispatch_once(&qword_253D89D40, &__block_literal_global);
    if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_msgSend(a2, "path");
      v27 = objc_msgSend(*(id *)v42, "code");
      *(_QWORD *)&v51.st_mode = "__W5ArchiveAddURLToArchive";
      WORD2(v51.st_ino) = 2080;
      v51.st_dev = 136316162;
      *(__darwin_ino64_t *)((char *)&v51.st_ino + 6) = (__darwin_ino64_t)"W5MiscUtil.m";
      HIWORD(v51.st_gid) = 1024;
      v51.st_rdev = 359;
      *((_WORD *)&v51.st_rdev + 2) = 2114;
      *(_QWORD *)((char *)&v51.st_rdev + 6) = v26;
      HIWORD(v51.st_atimespec.tv_sec) = 2048;
      v51.st_atimespec.tv_nsec = v27;
      _os_log_send_and_compose_impl();
    }
  }
  v20 = 1;
LABEL_25:
  v21 = v40;
  objc_autoreleasePoolPop(v8);
  v22 = v40;
  if (a4 && v40)
    *a4 = v40;
  return v20;
}

uint64_t W5DescriptionForPeerDiscoveryFlags(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = v2;
  if ((a1 & 1) != 0)
    objc_msgSend(v2, "appendString:", CFSTR("Rapport "));
  if (objc_msgSend(v3, "length"))
    return objc_msgSend(v3, "substringWithRange:", 0, objc_msgSend(v3, "length") - 1);
  else
    return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%lu)"), a1);
}

uint64_t W5DescriptionForPeerControlFlags(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = v2;
  if ((a1 & 1) != 0)
    objc_msgSend(v2, "appendString:", CFSTR("ForceBLE "));
  if (objc_msgSend(v3, "length"))
    return objc_msgSend(v3, "substringWithRange:", 0, objc_msgSend(v3, "length") - 1);
  else
    return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%lu)"), a1);
}

uint64_t W5NSDateToISO8601Description(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD15D0], "stringFromDate:timeZone:formatOptions:", a1, objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone"), 1907);
}

uint64_t __W5ArchiveAddFileURLToArchive()
{
  uint64_t *v0;
  uint64_t *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t *v30;
  uint64_t v31;
  stat v32;
  _BYTE v33[8192];
  uint64_t v34;
  const __CFString *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  const __CFString *v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  _BYTE v43[24];
  __int16 v44;
  off_t st_size;
  uint64_t v46;

  MEMORY[0x24BDAC7A8]();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v46 = *MEMORY[0x24BDAC8D0];
  memset(&v32, 0, sizeof(v32));
  stat((const char *)objc_msgSend((id)objc_msgSend(v4, "path"), "UTF8String"), &v32);
  if (qword_253D89D40 != -1)
    dispatch_once(&qword_253D89D40, &__block_literal_global);
  if (os_log_type_enabled((os_log_t)_MergedGlobals, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(v5, "path");
    v41 = "__W5ArchiveAddFileURLToArchive";
    v42 = 2080;
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)v43 = "W5MiscUtil.m";
    *(_WORD *)&v43[8] = 1024;
    *(_DWORD *)&v43[10] = 276;
    *(_WORD *)&v43[14] = 2114;
    *(_QWORD *)&v43[16] = v6;
    v44 = 2048;
    st_size = v32.st_size;
    LODWORD(v31) = 48;
    v30 = buf;
    _os_log_send_and_compose_impl();
  }
  v7 = archive_entry_new();
  if (v7)
  {
    archive_entry_copy_stat();
    objc_msgSend(v3, "UTF8String");
    archive_entry_set_pathname();
    archive_entry_set_perm();
    v8 = archive_write_header();
    if (v8)
    {
      v20 = v8;
      v21 = *MEMORY[0x24BDD1128];
      v36 = *MEMORY[0x24BDD0FD8];
      v37 = CFSTR("err");
      v22 = objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", v21, v8, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1));
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v23 = objc_msgSend(v3, "UTF8String");
        v24 = archive_error_string();
        *(_DWORD *)buf = 136446722;
        v41 = (const char *)v23;
        v42 = 1026;
        *(_DWORD *)v43 = v20;
        *(_WORD *)&v43[4] = 2082;
        *(_QWORD *)&v43[6] = v24;
        _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] archive_write_header() FAILED for %{public}s, returned %{public}d (%{public}s)", buf, 0x1Cu);
      }
      goto LABEL_21;
    }
    v9 = open((const char *)objc_msgSend((id)objc_msgSend(v5, "path"), "UTF8String"), 0);
    if ((v9 & 0x80000000) == 0)
    {
      v10 = v9;
      if (read(v9, v33, 0x2000uLL) < 1)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          v29 = objc_msgSend(v3, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v41 = (const char *)v29;
          _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] Unexpected zero-length file encountered for %{public}s", buf, 0xCu);
        }
        v11 = 0;
      }
      else
      {
        v11 = 0;
        do
          v11 += archive_write_data();
        while (read(v10, v33, 0x2000uLL) > 0);
      }
      close(v10);
      if (v11 != v32.st_size && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v28 = objc_msgSend(v3, "UTF8String");
        *(_DWORD *)buf = 136446722;
        v41 = (const char *)v28;
        v42 = 2050;
        *(_QWORD *)v43 = v32.st_size;
        *(_WORD *)&v43[8] = 2050;
        *(_QWORD *)&v43[10] = v11;
        _os_log_error_impl(&dword_209C3B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[wifivelocity] Bytes written does not equal file size (file='%{public}s', size=%{public}lld, written=%{public}zd)", buf, 0x20u);
      }
      v12 = 1;
      goto LABEL_13;
    }
    v25 = (void *)MEMORY[0x24BDD1540];
    v26 = *MEMORY[0x24BDD1128];
    v27 = *__error();
    v34 = *MEMORY[0x24BDD0FD8];
    v35 = CFSTR("errno");
    v16 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v17 = v25;
    v18 = v26;
    v19 = v27;
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDD1540];
    v15 = *MEMORY[0x24BDD1128];
    v38 = *MEMORY[0x24BDD0FD8];
    v39 = CFSTR("ENOMEM");
    v16 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v17 = v14;
    v18 = v15;
    v19 = 12;
  }
  v22 = objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, v19, v16, v30, v31);
LABEL_21:
  v12 = 0;
  if (v1 && v22)
  {
    v12 = 0;
    *v1 = v22;
  }
LABEL_13:
  if (v7)
    archive_entry_free();
  return v12;
}

void *W5XPCRequestDelegateInterface()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;

  v0 = (void *)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545B6BA0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_startBrowsingAndReply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_stopBrowsingAndReply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_startAdvertisingAndReply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_stopAdvertisingAndReply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_startMonitoringEvents_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_stopMonitoringEvents_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_queryPeerCacheAndReply_, 0, 1);
  v1 = (void *)MEMORY[0x24BDBCF20];
  v2 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0), sel_queryPeerCacheAndReply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_queryLocalPeerAndReply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_queryLocalPeerAndReply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_queryStatusForPeer_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_queryStatusForPeer_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_queryStatusForPeer_reply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_listFilesFromPeer_remoteDirPath_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_listFilesFromPeer_remoteDirPath_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_listFilesFromPeer_remoteDirPath_reply_, 0, 1);
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0), sel_listFilesFromPeer_remoteDirPath_reply_, 1, 1);
  v5 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), sel_runDiagnostics_configuration_uuid_reply_, 0, 0);
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0), sel_runDiagnostics_configuration_uuid_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_runDiagnostics_configuration_uuid_reply_, 2, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_runDiagnostics_configuration_uuid_reply_, 0, 1);
  v13 = (void *)MEMORY[0x24BDBCF20];
  v14 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0), sel_runDiagnostics_configuration_uuid_reply_, 1, 1);
  v15 = (void *)MEMORY[0x24BDBCF20];
  v16 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0), sel_runDiagnosticsForPeer_diagnostics_configuration_uuid_reply_, 0, 0);
  v17 = (void *)MEMORY[0x24BDBCF20];
  v18 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0), sel_runDiagnosticsForPeer_diagnostics_configuration_uuid_reply_, 1, 0);
  v19 = (void *)MEMORY[0x24BDBCF20];
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  v24 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v19, "setWithObjects:", v20, v21, v22, v23, v24, objc_opt_class(), 0), sel_runDiagnosticsForPeer_diagnostics_configuration_uuid_reply_, 2, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_runDiagnosticsForPeer_diagnostics_configuration_uuid_reply_, 3, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_runDiagnosticsForPeer_diagnostics_configuration_uuid_reply_, 0, 1);
  v25 = (void *)MEMORY[0x24BDBCF20];
  v26 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0), sel_runDiagnosticsForPeer_diagnostics_configuration_uuid_reply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_registerRemoteDiagnosticEventsForPeer_configuration_reply_, 0, 0);
  v27 = (void *)MEMORY[0x24BDBCF20];
  v28 = objc_opt_class();
  v29 = objc_opt_class();
  v30 = objc_opt_class();
  v31 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v27, "setWithObjects:", v28, v29, v30, v31, objc_opt_class(), 0), sel_registerRemoteDiagnosticEventsForPeer_configuration_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_registerRemoteDiagnosticEventsForPeer_configuration_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_unregisterRemoteDiagnosticEventsForPeer_configuration_reply_, 0, 0);
  v32 = (void *)MEMORY[0x24BDBCF20];
  v33 = objc_opt_class();
  v34 = objc_opt_class();
  v35 = objc_opt_class();
  v36 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v32, "setWithObjects:", v33, v34, v35, v36, objc_opt_class(), 0), sel_unregisterRemoteDiagnosticEventsForPeer_configuration_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_unregisterRemoteDiagnosticEventsForPeer_configuration_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_queryRegisteredDiagnosticsPeersWithReply_, 0, 1);
  v37 = (void *)MEMORY[0x24BDBCF20];
  v38 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0), sel_queryRegisteredDiagnosticsPeersWithReply_, 1, 1);
  v39 = (void *)MEMORY[0x24BDBCF20];
  v40 = objc_opt_class();
  v41 = objc_opt_class();
  v42 = objc_opt_class();
  v43 = objc_opt_class();
  v44 = objc_opt_class();
  v45 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v39, "setWithObjects:", v40, v41, v42, v43, v44, v45, objc_opt_class(), 0), sel_startDiagnosticsModeWithConfiguration_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_startDiagnosticsModeWithConfiguration_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_startDiagnosticsModeWithConfiguration_reply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_stopDiagnosticsModeWithUUID_info_reply_, 0, 0);
  v46 = (void *)MEMORY[0x24BDBCF20];
  v47 = objc_opt_class();
  v48 = objc_opt_class();
  v49 = objc_opt_class();
  v50 = objc_opt_class();
  v51 = objc_opt_class();
  v52 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v46, "setWithObjects:", v47, v48, v49, v50, v51, v52, objc_opt_class(), 0), sel_stopDiagnosticsModeWithUUID_info_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_stopDiagnosticsModeWithUUID_info_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_queryDiagnosticsModeForPeer_info_reply_, 0, 0);
  v53 = (void *)MEMORY[0x24BDBCF20];
  v54 = objc_opt_class();
  v55 = objc_opt_class();
  v56 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v53, "setWithObjects:", v54, v55, v56, objc_opt_class(), 0), sel_queryDiagnosticsModeForPeer_info_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_queryDiagnosticsModeForPeer_info_reply_, 0, 1);
  v57 = (void *)MEMORY[0x24BDBCF20];
  v58 = objc_opt_class();
  v59 = objc_opt_class();
  v60 = objc_opt_class();
  v61 = objc_opt_class();
  v62 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v57, "setWithObjects:", v58, v59, v60, v61, v62, objc_opt_class(), 0), sel_queryDiagnosticsModeForPeer_info_reply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_queryDebugConfigurationForPeer_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_queryDebugConfigurationForPeer_reply_, 0, 1);
  v63 = (void *)MEMORY[0x24BDBCF20];
  v64 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v63, "setWithObjects:", v64, objc_opt_class(), 0), sel_queryDebugConfigurationForPeer_reply_, 1, 1);
  v65 = (void *)MEMORY[0x24BDBCF20];
  v66 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v65, "setWithObjects:", v66, objc_opt_class(), 0), sel_setDebugConfiguration_peer_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_setDebugConfiguration_peer_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_setDebugConfiguration_peer_reply_, 0, 1);
  v67 = (void *)MEMORY[0x24BDBCF20];
  v68 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v67, "setWithObjects:", v68, objc_opt_class(), 0), sel_collectLogs_configuration_uuid_reply_, 0, 0);
  v69 = (void *)MEMORY[0x24BDBCF20];
  v70 = objc_opt_class();
  v71 = objc_opt_class();
  v72 = objc_opt_class();
  v73 = objc_opt_class();
  v74 = objc_opt_class();
  v75 = objc_opt_class();
  v76 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v69, "setWithObjects:", v70, v71, v72, v73, v74, v75, v76, objc_opt_class(), 0), sel_collectLogs_configuration_uuid_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_collectLogs_configuration_uuid_reply_, 2, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_collectLogs_configuration_uuid_reply_, 0, 1);
  v77 = (void *)MEMORY[0x24BDBCF20];
  v78 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v77, "setWithObjects:", v78, objc_opt_class(), 0), sel_collectLogs_configuration_uuid_reply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_collectLogs_configuration_uuid_reply_, 2, 1);
  v79 = (void *)MEMORY[0x24BDBCF20];
  v80 = objc_opt_class();
  v81 = objc_opt_class();
  v82 = objc_opt_class();
  v83 = objc_opt_class();
  v84 = objc_opt_class();
  v85 = objc_opt_class();
  v86 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v79, "setWithObjects:", v80, v81, v82, v83, v84, v85, v86, objc_opt_class(), 0), sel_collectLogsDiagnosticMode_uuid_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_collectLogsDiagnosticMode_uuid_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_collectLogsDiagnosticMode_uuid_reply_, 0, 1);
  v87 = (void *)MEMORY[0x24BDBCF20];
  v88 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v87, "setWithObjects:", v88, objc_opt_class(), 0), sel_collectLogsDiagnosticMode_uuid_reply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_collectLogsDiagnosticMode_uuid_reply_, 2, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_startPeerDiscoveryWithConfiguration_uuid_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_startPeerDiscoveryWithConfiguration_uuid_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_startPeerDiscoveryWithConfiguration_uuid_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_stopPeerDiscoveryWithUUID_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_stopPeerDiscoveryWithUUID_reply_, 0, 1);
  v89 = (void *)MEMORY[0x24BDBCF20];
  v90 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v89, "setWithObjects:", v90, objc_opt_class(), 0), sel_runWiFiSnifferOnChannels_duration_peer_uuid_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_runWiFiSnifferOnChannels_duration_peer_uuid_reply_, 2, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_runWiFiSnifferOnChannels_duration_peer_uuid_reply_, 3, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_runWiFiSnifferOnChannels_duration_peer_uuid_reply_, 0, 1);
  v91 = (void *)MEMORY[0x24BDBCF20];
  v92 = objc_opt_class();
  v93 = objc_opt_class();
  v94 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v91, "setWithObjects:", v92, v93, v94, objc_opt_class(), 0), sel_runWiFiSnifferOnChannels_duration_peer_uuid_reply_, 1, 1);
  v95 = (void *)MEMORY[0x24BDBCF20];
  v96 = objc_opt_class();
  v97 = objc_opt_class();
  v98 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v95, "setWithObjects:", v96, v97, v98, objc_opt_class(), 0), sel_runWiFiSnifferOnChannels_duration_peer_uuid_reply_, 2, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_runWiFiSnifferOnChannels_duration_peer_uuid_reply_, 3, 1);
  v99 = (void *)MEMORY[0x24BDBCF20];
  v100 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v99, "setWithObjects:", v100, objc_opt_class(), 0), sel_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_uuid_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_uuid_reply_, 2, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_uuid_reply_, 3, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_uuid_reply_, 0, 1);
  v101 = (void *)MEMORY[0x24BDBCF20];
  v102 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v101, "setWithObjects:", v102, objc_opt_class(), 0), sel_runWiFiSnifferWithTCPDumpOnChannels_duration_peer_uuid_reply_, 1, 1);
  v103 = (void *)MEMORY[0x24BDBCF20];
  v104 = objc_opt_class();
  v105 = objc_opt_class();
  v106 = objc_opt_class();
  v107 = objc_opt_class();
  v108 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v103, "setWithObjects:", v104, v105, v106, v107, v108, objc_opt_class(), 0), sel_runWiFiPerformanceLoggingWithConfiguration_uuid_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_runWiFiPerformanceLoggingWithConfiguration_uuid_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_runWiFiPerformanceLoggingWithConfiguration_uuid_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_cancelRequestWithUUID_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_cancelRequestWithUUID_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_cancelRequestWithUUID_OnPeer_OfType_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_cancelRequestWithUUID_OnPeer_OfType_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_cancelRequestWithUUID_OnPeer_OfType_reply_, 2, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_cancelRequestWithUUID_OnPeer_OfType_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_cancelAllRequestsAndReply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_log_timestamp_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_startMonitoringFaultEventsForPeer_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_startMonitoringFaultEventsForPeer_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_stopMonitoringFaultEventsForPeer_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_stopMonitoringFaultEventsForPeer_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_submitFaultEvent_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_submitFaultEvent_reply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_queryFaultEventCacheForPeer_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_queryFaultEventCacheForPeer_reply_, 0, 1);
  v109 = (void *)MEMORY[0x24BDBCF20];
  v110 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v109, "setWithObjects:", v110, objc_opt_class(), 0), sel_queryFaultEventCacheForPeer_reply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_queryDatabaseForPeer_fetch_reply_, 0, 0);
  v111 = (void *)MEMORY[0x24BDBCF20];
  v112 = objc_opt_class();
  v113 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v111, "setWithObjects:", v112, v113, objc_opt_class(), 0), sel_queryDatabaseForPeer_fetch_reply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_queryDatabaseForPeer_fetch_reply_, 0, 1);
  v114 = (void *)MEMORY[0x24BDBCF20];
  v115 = objc_opt_class();
  v116 = objc_opt_class();
  v117 = objc_opt_class();
  v118 = objc_opt_class();
  v119 = objc_opt_class();
  v120 = objc_opt_class();
  v121 = objc_opt_class();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v114, "setWithObjects:", v115, v116, v117, v118, v119, v120, v121, objc_opt_class(), 0), sel_queryDatabaseForPeer_fetch_reply_, 1, 1);
  return v0;
}

void *W5XPCEventDelegateInterface()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545B6C00);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_receivedEvent_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0), sel_receivedPeerDiscoveryEvent_, 0, 0);
  return v0;
}

id W5FormattedDescriptionForDebugConfiguration(void *a1)
{
  void *v2;
  unint64_t v3;
  __CFString *v4;
  unint64_t v5;
  __CFString *v6;
  unint64_t v7;
  __CFString *v8;
  unint64_t v9;
  __CFString *v10;
  unint64_t v11;
  __CFString *v12;
  unint64_t v13;
  __CFString *v14;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = objc_msgSend(a1, "wifi") + 1;
  if (v3 > 2)
    v4 = 0;
  else
    v4 = off_24C23C468[v3];
  objc_msgSend(v2, "appendFormat:", CFSTR("Wi-Fi                     : %s\n"), -[__CFString UTF8String](v4, "UTF8String"));
  v5 = objc_msgSend(a1, "megaWiFiProfile") + 1;
  if (v5 > 2)
    v6 = 0;
  else
    v6 = off_24C23C468[v5];
  objc_msgSend(v2, "appendFormat:", CFSTR("Wi-Fi Profile (Mega)      : %s\n"), -[__CFString UTF8String](v6, "UTF8String"));
  v7 = objc_msgSend(a1, "noLoggingWiFiProfile") + 1;
  if (v7 > 2)
    v8 = 0;
  else
    v8 = off_24C23C468[v7];
  objc_msgSend(v2, "appendFormat:", CFSTR("Wi-Fi Profile (NoLogging) : %s\n"), -[__CFString UTF8String](v8, "UTF8String"));
  v9 = objc_msgSend(a1, "eapol") + 1;
  if (v9 > 2)
    v10 = 0;
  else
    v10 = off_24C23C468[v9];
  objc_msgSend(v2, "appendFormat:", CFSTR("EAPOL                     : %s\n"), -[__CFString UTF8String](v10, "UTF8String"));
  v11 = objc_msgSend(a1, "bluetooth") + 1;
  if (v11 > 2)
    v12 = 0;
  else
    v12 = off_24C23C468[v11];
  objc_msgSend(v2, "appendFormat:", CFSTR("Bluetooth                 : %s\n"), -[__CFString UTF8String](v12, "UTF8String"));
  v13 = objc_msgSend(a1, "stbc") + 1;
  if (v13 > 2)
    v14 = 0;
  else
    v14 = off_24C23C468[v13];
  objc_msgSend(v2, "appendFormat:", CFSTR("STBC                      : %s\n"), -[__CFString UTF8String](v14, "UTF8String"));
  objc_msgSend(v2, "appendFormat:", CFSTR("Diagnostics               : %@\n"), objc_msgSend((id)objc_msgSend(a1, "diagnosticsMode"), "description"));
  return (id)objc_msgSend(v2, "copy");
}

__CFString *W5DescriptionForLogState(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 2)
    return 0;
  else
    return off_24C23C468[a1 + 1];
}

id W5FormattedDescriptionForStatus(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  unint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  __CFString *v28;
  uint64_t v29;
  const char *v30;
  const char *v31;
  const char *v32;
  unint64_t v33;
  const char *v34;
  const char *v35;
  unint64_t v36;
  const char *v37;
  const char *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __CFString *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  id v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  const char *v61;
  const char *v62;
  const char *v63;
  void *v64;
  void *v65;
  int v66;
  const char *v67;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t k;
  void *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const __CFString *v84;
  const __CFString *v85;
  uint64_t v86;
  const __CFString *v87;
  uint64_t m;
  void *v89;
  const char *v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  const __CFString *v97;
  const __CFString *v98;
  const __CFString *v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  const char *v103;
  const char *v104;
  void *v105;
  void *v106;
  const char *v107;
  const char *v108;
  unint64_t v109;
  __CFString *v110;
  const char *v111;
  int v112;
  const char *v113;
  const char *v114;
  const char *v115;
  unint64_t v116;
  const char *v117;
  const char *v118;
  __CFString *v119;
  unsigned int v120;
  const char *v121;
  uint64_t v122;
  unsigned int *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  unint64_t v132;
  __CFString *v133;
  unsigned int v134;
  __CFString *v135;
  void *v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t n;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t ii;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t jj;
  void *v158;
  uint64_t v160;
  void *v161;
  void *v162;
  void *v163;
  id obj;
  id obja;
  id objb;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  _OWORD v182[2];
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  uint64_t v187;

  v187 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  objc_msgSend(v2, "appendFormat:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v2, "appendFormat:", CFSTR("NETWORK\n"));
  v162 = v2;
  objc_msgSend(v2, "appendFormat:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v161 = a1;
  v3 = (void *)objc_msgSend(a1, "network");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (objc_msgSend(v3, "primaryIPv4InterfaceName"))
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("    Primary IPv4         : %s (%s / %s)\n"), objc_msgSend((id)objc_msgSend(v3, "primaryIPv4InterfaceName"), "UTF8String"), objc_msgSend((id)objc_msgSend(v3, "primaryIPv4ServiceName"), "UTF8String"), objc_msgSend((id)objc_msgSend(v3, "primaryIPv4ServiceID"), "UTF8String"));
    v5 = (void *)objc_msgSend(v3, "primaryIPv4Addresses");
    v171 = 0u;
    v172 = 0u;
    v173 = 0u;
    v174 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v171, &v175, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v172;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v172 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "appendFormat:", CFSTR("                         : %s\n"), objc_msgSend(*(id *)(*((_QWORD *)&v171 + 1) + 8 * i), "UTF8String"));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v171, &v175, 16);
      }
      while (v7);
    }
  }
  else
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("    Primary IPv4         : None\n"));
  }
  if (objc_msgSend(v3, "primaryIPv6InterfaceName"))
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("    Primary IPv6         : %s (%s / %s)\n"), objc_msgSend((id)objc_msgSend(v3, "primaryIPv6InterfaceName"), "UTF8String"), objc_msgSend((id)objc_msgSend(v3, "primaryIPv6ServiceName"), "UTF8String"), objc_msgSend((id)objc_msgSend(v3, "primaryIPv6ServiceID"), "UTF8String"));
    v10 = (void *)objc_msgSend(v3, "primaryIPv6Addresses");
    v167 = 0u;
    v168 = 0u;
    v169 = 0u;
    v170 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v167, &v183, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v168;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v168 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v4, "appendFormat:", CFSTR("                         : %s\n"), objc_msgSend(*(id *)(*((_QWORD *)&v167 + 1) + 8 * j), "UTF8String"));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v167, &v183, 16);
      }
      while (v12);
    }
  }
  else
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("    Primary IPv6         : None\n"));
  }
  v15 = (void *)objc_msgSend(v3, "primaryDNSAddresses");
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("    DNS Addresses        : %s\n"), objc_msgSend((id)objc_msgSend(v15, "firstObject"), "UTF8String"));
    if ((unint64_t)objc_msgSend(v15, "count") >= 2 && (unint64_t)objc_msgSend(v15, "count") >= 2)
    {
      v16 = 1;
      do
        objc_msgSend(v4, "appendFormat:", CFSTR("                         : %s\n"), objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", v16++), "UTF8String"));
      while (v16 < objc_msgSend(v15, "count"));
    }
  }
  else
  {
    objc_msgSend(v4, "appendFormat:", CFSTR("    DNS Addresses        : None\n"));
  }
  v17 = "Not Reachable";
  if ((objc_msgSend(v3, "isAppleReachable") & 2) != 0 && (objc_msgSend(v3, "isAppleReachable") & 4) == 0)
    v17 = "Reachable";
  v18 = objc_msgSend(v3, "isAppleReachable");
  v19 = " (WWAN)";
  if ((v18 & 0x40000) == 0)
    v19 = "";
  objc_msgSend(v4, "appendFormat:", CFSTR("    Apple                : %s%s\n"), v17, v19);
  objc_msgSend(v162, "appendString:", (id)objc_msgSend(v4, "copy"));
  objc_msgSend(v162, "appendFormat:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v162, "appendFormat:", CFSTR("WIFI\n"));
  objc_msgSend(v162, "appendFormat:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v20 = (void *)objc_msgSend(v161, "wifi");
  v21 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  objc_msgSend(v21, "appendFormat:", CFSTR("    MAC Address          : %s (hw=%s)\n"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "macAddress"), "redactedForWiFi"), "UTF8String"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "hardwareMACAddress"), "redactedForWiFi"), "UTF8String"));
  objc_msgSend(v21, "appendFormat:", CFSTR("    Interface Name       : %s\n"), objc_msgSend((id)objc_msgSend(v20, "interfaceName"), "UTF8String"));
  if (objc_msgSend(v20, "powerOn"))
    v22 = "On";
  else
    v22 = "Off";
  if (objc_msgSend((id)objc_msgSend(v20, "power"), "length") == 24)
    v23 = objc_msgSend((id)objc_msgSend(v20, "power"), "bytes");
  else
    v23 = 0;
  objc_msgSend(v21, "appendFormat:", CFSTR("    Power                : %s [%s]\n"), v22, objc_msgSend(W5DescriptionForPower(v23), "UTF8String"));
  objc_msgSend(v21, "appendFormat:", CFSTR("    Op Mode              : %s\n"), -[__CFString UTF8String]((id)W5DescriptionForOpMode(objc_msgSend(v20, "opMode")), "UTF8String"));
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "ssidString"), "redactedForWiFi"), "UTF8String"))
    v24 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "ssidString"), "redactedForWiFi"), "UTF8String");
  else
    v24 = "None";
  objc_msgSend(v21, "appendFormat:", CFSTR("    SSID                 : %s\n"), v24);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "bssid"), "redactedForWiFi"), "UTF8String"))
    v25 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "bssid"), "redactedForWiFi"), "UTF8String");
  else
    v25 = "None";
  objc_msgSend(v21, "appendFormat:", CFSTR("    BSSID                : %s\n"), v25);
  objc_msgSend(v21, "appendFormat:", CFSTR("    RSSI                 : %i dBm\n"), objc_msgSend(v20, "rssi"));
  objc_msgSend(v21, "appendFormat:", CFSTR("    CCA                  : %i %%\n"), objc_msgSend(v20, "cca"));
  objc_msgSend(v21, "appendFormat:", CFSTR("    Noise                : %i dBm\n"), objc_msgSend(v20, "noise"));
  objc_msgSend(v20, "txRate");
  objc_msgSend(v21, "appendFormat:", CFSTR("    Tx Rate              : %.1f Mbps\n"), v26);
  if (objc_msgSend(v20, "ssid"))
    objc_msgSend(v21, "appendFormat:", CFSTR("    Security             : %s\n"), -[__CFString UTF8String]((id)W5DescriptionForSecurity(objc_msgSend(v20, "security")), "UTF8String"));
  else
    objc_msgSend(v21, "appendFormat:", CFSTR("    Security             : None\n"), v160);
  if (objc_msgSend(v20, "security") == 12
    || objc_msgSend(v20, "security") == 11
    || objc_msgSend(v20, "security") == 9
    || objc_msgSend(v20, "security") == 10
    || objc_msgSend(v20, "security") == 8)
  {
    v27 = objc_msgSend(v20, "eapolControlMode");
    if (v27 >= 4)
      v28 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%d)"), v27);
    else
      v28 = off_24C23CD58[(int)v27];
    objc_msgSend(v21, "appendFormat:", CFSTR("    802.1X Mode          : %s\n"), -[__CFString UTF8String](v28, "UTF8String"));
    objc_msgSend(v21, "appendFormat:", CFSTR("    802.1X Supplicant    : %s\n"), -[__CFString UTF8String](W5DescriptionForEAPOLSupplicantState(objc_msgSend(v20, "eapolSupplicantState")), "UTF8String"));
  }
  objc_msgSend(v21, "appendFormat:", CFSTR("    PHY Mode             : %s\n"), -[__CFString UTF8String]((id)W5DescriptionForPHYMode(objc_msgSend(v20, "phyMode")), "UTF8String"));
  objc_msgSend(v21, "appendFormat:", CFSTR("    MCS Index            : %i\n"), objc_msgSend(v20, "mcsIndex"));
  v29 = objc_msgSend(v20, "ssid");
  if (v29)
    v29 = objc_msgSend(v20, "guardInterval");
  objc_msgSend(v21, "appendFormat:", CFSTR("    Guard Interval       : %i\n"), v29);
  objc_msgSend(v21, "appendFormat:", CFSTR("    NSS                  : %i\n"), objc_msgSend(v20, "numberOfSpacialStreams"));
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "channel"), "description"), "UTF8String"))
    v30 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "channel"), "description"), "UTF8String");
  else
    v30 = "None";
  objc_msgSend(v21, "appendFormat:", CFSTR("    Channel              : %s\n"), v30);
  objc_msgSend(v21, "appendFormat:", CFSTR("    Country Code         : %s\n"), objc_msgSend((id)objc_msgSend(v20, "countryCode"), "UTF8String"));
  objc_msgSend(v21, "appendFormat:", CFSTR("    Scan Cache Count     : %lu\n"), objc_msgSend((id)objc_msgSend(v20, "cachedScanResults"), "count"));
  if (objc_msgSend((id)objc_msgSend(v20, "networkServiceID"), "UTF8String"))
    v31 = (const char *)objc_msgSend((id)objc_msgSend(v20, "networkServiceID"), "UTF8String");
  else
    v31 = "None";
  objc_msgSend(v21, "appendFormat:", CFSTR("    NetworkServiceID     : %s\n"), v31);
  objc_msgSend(v21, "appendFormat:", CFSTR("    IPv4 Config Method   : %s\n"), -[__CFString UTF8String](W5DescriptionForIPv4ConfigMethod(objc_msgSend(v20, "ipv4ConfigMethod")), "UTF8String"));
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "ipv4Addresses"), "firstObject"), "UTF8String"))
    v32 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "ipv4Addresses"), "firstObject"), "UTF8String");
  else
    v32 = "None";
  objc_msgSend(v21, "appendFormat:", CFSTR("    IPv4 Address         : %s\n"), v32);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v20, "ipv4Addresses"), "count") >= 2)
  {
    v33 = 1;
    do
      objc_msgSend(v21, "appendFormat:", CFSTR("                         : %s\n"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "ipv4Addresses"), "objectAtIndexedSubscript:", v33++), "UTF8String"));
    while (v33 < objc_msgSend((id)objc_msgSend(v20, "ipv4Addresses"), "count"));
  }
  if (objc_msgSend((id)objc_msgSend(v20, "ipv4RouterAddress"), "UTF8String"))
    v34 = (const char *)objc_msgSend((id)objc_msgSend(v20, "ipv4RouterAddress"), "UTF8String");
  else
    v34 = "None";
  objc_msgSend(v21, "appendFormat:", CFSTR("    IPv4 Router          : %s\n"), v34);
  objc_msgSend(v21, "appendFormat:", CFSTR("    IPv6 Config Method   : %s\n"), -[__CFString UTF8String](W5DescriptionForIPv6ConfigMethod(objc_msgSend(v20, "ipv6ConfigMethod")), "UTF8String"));
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "ipv6Addresses"), "firstObject"), "UTF8String"))
    v35 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "ipv6Addresses"), "firstObject"), "UTF8String");
  else
    v35 = "None";
  objc_msgSend(v21, "appendFormat:", CFSTR("    IPv6 Address         : %s\n"), v35);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v20, "ipv6Addresses"), "count") >= 2)
  {
    v36 = 1;
    do
      objc_msgSend(v21, "appendFormat:", CFSTR("                         : %s\n"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "ipv6Addresses"), "objectAtIndexedSubscript:", v36++), "UTF8String"));
    while (v36 < objc_msgSend((id)objc_msgSend(v20, "ipv6Addresses"), "count"));
  }
  if (objc_msgSend((id)objc_msgSend(v20, "ipv6RouterAddress"), "UTF8String"))
    v37 = (const char *)objc_msgSend((id)objc_msgSend(v20, "ipv6RouterAddress"), "UTF8String");
  else
    v37 = "None";
  objc_msgSend(v21, "appendFormat:", CFSTR("    IPv6 Router          : %s\n"), v37);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "dnsAddresses"), "firstObject"), "UTF8String"))
    v38 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "dnsAddresses"), "firstObject"), "UTF8String");
  else
    v38 = "None";
  objc_msgSend(v21, "appendFormat:", CFSTR("    DNS                  : %s\n"), v38);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v20, "dnsAddresses"), "count") >= 2)
  {
    v39 = 1;
    do
      objc_msgSend(v21, "appendFormat:", CFSTR("                         : %s\n"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "dnsAddresses"), "objectAtIndexedSubscript:", v39++), "UTF8String"));
    while (v39 < objc_msgSend((id)objc_msgSend(v20, "dnsAddresses"), "count"));
  }
  objc_msgSend(v21, "appendFormat:", CFSTR("    BTC Mode             : %s\n"), objc_msgSend(W5DescriptionForBTCMode(objc_msgSend(v20, "btcMode")), "UTF8String"));
  if (objc_msgSend((id)objc_msgSend(v20, "desense"), "length") == 16)
    v40 = objc_msgSend((id)objc_msgSend(v20, "desense"), "bytes");
  else
    v40 = 0;
  if (objc_msgSend((id)objc_msgSend(v20, "desenseLevel"), "length") == 8)
    v41 = objc_msgSend((id)objc_msgSend(v20, "desenseLevel"), "bytes");
  else
    v41 = 0;
  objc_msgSend(v21, "appendFormat:", CFSTR("    Desense              : %s\n"), objc_msgSend(W5DescriptionForDesense(v40, v41), "UTF8String"));
  if (objc_msgSend((id)objc_msgSend(v20, "chainAck"), "length") == 24)
    v42 = objc_msgSend((id)objc_msgSend(v20, "chainAck"), "bytes");
  else
    v42 = 0;
  objc_msgSend(v21, "appendFormat:", CFSTR("    Chain Ack            : [%s]\n"), objc_msgSend(W5DescriptionForChainAck(v42), "UTF8String"));
  if (objc_msgSend(v20, "txChainPower"))
  {
    objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "length");
    if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "bytes") + 4))
    {
      objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "length");
      if (*(int *)(objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "bytes") + 4) >= 1)
      {
        v43 = 0;
        v44 = 0;
        do
        {
          objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "length");
          v45 = *(int *)(objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "bytes") + v43 + 8);
          if (v45 >= 3)
            v46 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), v45);
          else
            v46 = off_24C23CDE0[v45];
          objc_msgSend(v21, "appendFormat:", CFSTR("    Tx Power [%i]         : %s\n"), v44, -[__CFString UTF8String](v46, "UTF8String"));
          objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "length");
          if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "bytes") + v43 + 8) == 2)
          {
            objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "length");
            v47 = objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "bytes");
            v48 = *(unsigned int *)(v47 + v43 + 12);
            v49 = *(unsigned int *)(v47 + v43 + 16);
            v50 = *(unsigned int *)(v47 + v43 + 20);
            v51 = *(unsigned int *)(v47 + v43 + 24);
            v52 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
            objc_msgSend(v52, "appendFormat:", CFSTR("      Current            : %i\n"), v49);
            objc_msgSend(v52, "appendFormat:", CFSTR("      Offset             : %i\n"), v48);
            objc_msgSend(v52, "appendFormat:", CFSTR("      Min                : %i\n"), v50);
            objc_msgSend(v52, "appendFormat:", CFSTR("      Max                : %i\n"), v51);
            v53 = (id)objc_msgSend(v52, "copy");
          }
          ++v44;
          objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "length");
          v43 += 20;
        }
        while (v44 < *(int *)(objc_msgSend((id)objc_msgSend(v20, "txChainPower"), "bytes") + 4));
      }
    }
  }
  v54 = "Disabled";
  if (objc_msgSend(v20, "btcConfig"))
  {
    objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "length");
    if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "bytes") + 4))
      v54 = "Enabled";
  }
  objc_msgSend(v21, "appendFormat:", CFSTR("    BTC Profile 2.4GHz   : %s\n"), v54);
  if (objc_msgSend(v20, "btcConfig"))
  {
    objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "length");
    if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "bytes") + 4))
    {
      objc_msgSend((id)objc_msgSend(v20, "btcProfiles2GHz"), "length");
      if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v20, "btcProfiles2GHz"), "bytes") + 8))
      {
        if (objc_msgSend((id)objc_msgSend(v20, "btcProfiles2GHz"), "length") == 572)
          v55 = objc_msgSend((id)objc_msgSend(v20, "btcProfiles2GHz"), "bytes");
        else
          v55 = 0;
        objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "length");
        v56 = v55 + 140 * *(unsigned int *)(objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "bytes") + 8);
        v180 = *(_OWORD *)(v56 + 92);
        v181 = *(_OWORD *)(v56 + 108);
        v182[0] = *(_OWORD *)(v56 + 124);
        *(_OWORD *)((char *)v182 + 12) = *(_OWORD *)(v56 + 136);
        v176 = *(_OWORD *)(v56 + 28);
        v177 = *(_OWORD *)(v56 + 44);
        v178 = *(_OWORD *)(v56 + 60);
        v179 = *(_OWORD *)(v56 + 76);
        v175 = *(_OWORD *)(v56 + 12);
        __printBTCProfile((unsigned int *)&v175);
      }
    }
  }
  v57 = "Disabled";
  if (objc_msgSend(v20, "btcConfig"))
  {
    objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "length");
    if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "bytes") + 12))
      v57 = "Enabled";
  }
  objc_msgSend(v21, "appendFormat:", CFSTR("    BTC Profile 5GHz     : %s\n"), v57);
  if (objc_msgSend(v20, "btcConfig"))
  {
    objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "length");
    if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "bytes") + 12))
    {
      objc_msgSend((id)objc_msgSend(v20, "btcProfiles5GHz"), "length");
      if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v20, "btcProfiles5GHz"), "bytes") + 8))
      {
        if (objc_msgSend((id)objc_msgSend(v20, "btcProfiles5GHz"), "length") == 572)
          v58 = objc_msgSend((id)objc_msgSend(v20, "btcProfiles5GHz"), "bytes");
        else
          v58 = 0;
        objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "length");
        v59 = v58 + 140 * *(unsigned int *)(objc_msgSend((id)objc_msgSend(v20, "btcConfig"), "bytes") + 16);
        v180 = *(_OWORD *)(v59 + 92);
        v181 = *(_OWORD *)(v59 + 108);
        v182[0] = *(_OWORD *)(v59 + 124);
        *(_OWORD *)((char *)v182 + 12) = *(_OWORD *)(v59 + 136);
        v176 = *(_OWORD *)(v59 + 28);
        v177 = *(_OWORD *)(v59 + 44);
        v178 = *(_OWORD *)(v59 + 60);
        v179 = *(_OWORD *)(v59 + 76);
        v175 = *(_OWORD *)(v59 + 12);
        __printBTCProfile((unsigned int *)&v175);
      }
    }
  }
  v60 = objc_msgSend(v20, "isSnifferSupported");
  v61 = "NO";
  if (v60)
    v61 = "YES";
  objc_msgSend(v21, "appendFormat:", CFSTR("    Sniffer Supported    : %s\n"), v61);
  v62 = "Yes";
  if (objc_msgSend((id)objc_msgSend(v20, "capabilities"), "containsObject:", &unk_24C24E0E8))
    v63 = "Yes";
  else
    v63 = "No";
  objc_msgSend(v21, "appendFormat:", CFSTR("    Supports 6e          : %s\n"), v63);
  objc_msgSend(v21, "appendFormat:", CFSTR("    Supported Channels   : %s\n"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v20, "supportedChannels"), "componentsJoinedByString:", CFSTR(",")), "UTF8String"));
  objc_msgSend(v162, "appendString:", (id)objc_msgSend(v21, "copy"));
  objc_msgSend(v162, "appendFormat:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v162, "appendFormat:", CFSTR("BLUETOOTH\n"));
  objc_msgSend(v162, "appendFormat:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v64 = (void *)objc_msgSend(v161, "bluetooth");
  v65 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v66 = objc_msgSend(v64, "powerOn");
  v67 = "Off";
  if (v66)
    v67 = "On";
  objc_msgSend(v65, "appendFormat:", CFSTR("    Power                : %s\n"), v67);
  if (objc_msgSend((id)objc_msgSend(v64, "address"), "UTF8String"))
    v68 = (const char *)objc_msgSend((id)objc_msgSend(v64, "address"), "UTF8String");
  else
    v68 = "None";
  objc_msgSend(v65, "appendFormat:", CFSTR("    Address              : %s\n"), v68);
  if (objc_msgSend(v64, "isDiscoverable"))
    v69 = "Yes";
  else
    v69 = "No";
  objc_msgSend(v65, "appendFormat:", CFSTR("    Discoverable         : %s\n"), v69);
  if (objc_msgSend(v64, "isConnectable"))
    v70 = "Yes";
  else
    v70 = "No";
  objc_msgSend(v65, "appendFormat:", CFSTR("    Connectable          : %s\n"), v70);
  if (objc_msgSend(v64, "isScanning"))
    v71 = "Yes";
  else
    v71 = "No";
  objc_msgSend(v65, "appendFormat:", CFSTR("    Scanning             : %s\n"), v71);
  v173 = 0u;
  v174 = 0u;
  v171 = 0u;
  v172 = 0u;
  obj = v64;
  v72 = (void *)objc_msgSend(v64, "devices");
  v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v171, &v175, 16);
  if (v73)
  {
    v74 = v73;
    v75 = 0;
    v76 = 0;
    v77 = 0;
    v78 = *(_QWORD *)v172;
    do
    {
      for (k = 0; k != v74; ++k)
      {
        if (*(_QWORD *)v172 != v78)
          objc_enumerationMutation(v72);
        v80 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * k);
        v75 += objc_msgSend(v80, "isPaired");
        v76 += objc_msgSend(v80, "isCloudPaired");
        v77 += objc_msgSend(v80, "isConnected");
      }
      v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v171, &v175, 16);
    }
    while (v74);
  }
  else
  {
    v75 = 0;
    v76 = 0;
    v77 = 0;
  }
  objc_msgSend(v65, "appendFormat:", CFSTR("    Devices              : %lu (paired=%lu cloud=%lu connected=%lu)\n\n"), objc_msgSend((id)objc_msgSend(obj, "devices"), "count"), v75, v76, v77);
  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  obja = (id)objc_msgSend(obj, "devices");
  v81 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v167, &v183, 16);
  v82 = "No";
  if (v81)
  {
    v83 = v81;
    v84 = CFSTR("    %s\n");
    v85 = CFSTR("    Address          : %s\n");
    v86 = *(_QWORD *)v168;
    v87 = CFSTR("    Paired           : %s\n");
    v163 = v65;
    do
    {
      for (m = 0; m != v83; ++m)
      {
        if (*(_QWORD *)v168 != v86)
          objc_enumerationMutation(obja);
        v89 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * m);
        objc_msgSend(v65, "appendFormat:", v84, objc_msgSend((id)objc_msgSend(v89, "name"), "UTF8String"));
        objc_msgSend(v65, "appendFormat:", v85, objc_msgSend((id)objc_msgSend(v89, "address"), "UTF8String"));
        if (objc_msgSend(v89, "isPaired"))
          v90 = v62;
        else
          v90 = v82;
        objc_msgSend(v65, "appendFormat:", v87, v90);
        if (objc_msgSend(v89, "isCloudPaired"))
          v91 = v62;
        else
          v91 = v82;
        objc_msgSend(v65, "appendFormat:", CFSTR("    CloudPaired      : %s\n"), v91);
        if (objc_msgSend(v89, "isConnected"))
          v92 = v62;
        else
          v92 = v82;
        objc_msgSend(v65, "appendFormat:", CFSTR("    Connected        : %s\n"), v92);
        if (objc_msgSend(v89, "isConnected"))
        {
          v93 = v83;
          v94 = v82;
          v95 = v86;
          v96 = v62;
          v97 = v87;
          v98 = v85;
          v99 = v84;
          v100 = objc_msgSend(v89, "majorClass");
          v101 = objc_msgSend(v89, "minorClass");
          v102 = v100;
          v84 = v99;
          v85 = v98;
          v87 = v97;
          v62 = v96;
          v86 = v95;
          v82 = v94;
          v83 = v93;
          v65 = v163;
          objc_msgSend(v163, "appendFormat:", CFSTR("    Type             : %s\n"), objc_msgSend((id)W5DescriptionForBluetoothDeviceType(v102, v101), "UTF8String"));
          if (objc_msgSend(v89, "isLowEnergy"))
            v103 = v62;
          else
            v103 = v82;
          objc_msgSend(v163, "appendFormat:", CFSTR("    LE               : %s\n"), v103);
          if (objc_msgSend(v89, "isAppleDevice"))
            v104 = v62;
          else
            v104 = v82;
          objc_msgSend(v163, "appendFormat:", CFSTR("    Apple            : %s\n"), v104);
        }
        objc_msgSend(v65, "appendFormat:", CFSTR("\n"));
      }
      v83 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v167, &v183, 16);
    }
    while (v83);
  }
  objc_msgSend(v162, "appendString:", (id)objc_msgSend(v65, "copy"));
  objc_msgSend(v162, "appendFormat:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v162, "appendFormat:", CFSTR("AWDL\n"));
  objc_msgSend(v162, "appendFormat:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v105 = (void *)objc_msgSend(v161, "awdl");
  v106 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (objc_msgSend(v105, "power"))
    v107 = (const char *)objc_msgSend((id)objc_msgSend(v105, "macAddress"), "UTF8String");
  else
    v107 = "n/a";
  if (objc_msgSend(v105, "power"))
    v108 = (const char *)objc_msgSend((id)objc_msgSend(v105, "hardwareMACAddress"), "UTF8String");
  else
    v108 = "n/a";
  objc_msgSend(v106, "appendFormat:", CFSTR("    MAC Address            : %s (hw=%s)\n"), v107, v108);
  v109 = objc_msgSend(v105, "airDropDiscoverableMode");
  if (v109 >= 3)
    v110 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown (%ld)"), v109);
  else
    v110 = off_24C23C718[v109];
  objc_msgSend(v106, "appendFormat:", CFSTR("    AirDrop Disc Mode      : %s\n"), -[__CFString UTF8String](v110, "UTF8String"));
  if (objc_msgSend(v105, "awdlSyncEnabled"))
  {
    if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v105, "awdlSyncEnabled"), "bytes") + 8))
      v111 = v62;
    else
      v111 = v82;
  }
  else
  {
    v111 = "n/a";
  }
  objc_msgSend(v106, "appendFormat:", CFSTR("    AWDL Enabled           : %s\n"), v111);
  objc_msgSend(v106, "appendFormat:", CFSTR("    Interface Name         : %s\n"), objc_msgSend((id)objc_msgSend(v105, "interfaceName"), "UTF8String"));
  v112 = objc_msgSend(v105, "power");
  v113 = "Off";
  if (v112)
    v113 = "On";
  objc_msgSend(v106, "appendFormat:", CFSTR("    Power                  : %s\n"), v113);
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v105, "ipv6Addresses"), "firstObject"), "UTF8String"))
    v114 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v105, "ipv6Addresses"), "firstObject"), "UTF8String");
  else
    v114 = "None";
  objc_msgSend(v106, "appendFormat:", CFSTR("    IPv6 Address           : %s\n"), v114);
  if (objc_msgSend(v105, "awdlStrategy"))
    v115 = (const char *)-[__CFString UTF8String]((id)W5DescriptionForAWDLScheduleState(*(unsigned int *)(objc_msgSend((id)objc_msgSend(v105, "awdlStrategy"), "bytes")+ 8)), "UTF8String");
  else
    v115 = "n/a";
  objc_msgSend(v106, "appendFormat:", CFSTR("    Schedule State         : %s\n"), v115);
  if ((unint64_t)objc_msgSend((id)objc_msgSend(v105, "ipv6Addresses"), "count") >= 2)
  {
    v116 = 1;
    do
      objc_msgSend(v106, "appendFormat:", CFSTR("                           : %s\n"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(v105, "ipv6Addresses"), "objectAtIndexedSubscript:", v116++), "UTF8String"));
    while (v116 < objc_msgSend((id)objc_msgSend(v105, "ipv6Addresses"), "count"));
  }
  if (objc_msgSend(v105, "awdlSyncChannelSequence"))
    v117 = (const char *)objc_msgSend(W5DebugDescriptionForAWDLSyncChannelSequence(objc_msgSend((id)objc_msgSend(v105, "awdlSyncChannelSequence"), "bytes")), "UTF8String");
  else
    v117 = "n/a";
  objc_msgSend(v106, "appendFormat:", CFSTR("    Channel Sequence       : %s\n"), v117);
  if (objc_msgSend(v105, "awdlOpMode"))
  {
    if (*(_DWORD *)(objc_msgSend((id)objc_msgSend(v105, "awdlOpMode"), "bytes") + 4) <= 2u)
      v118 = off_24C23C430[*(unsigned int *)(objc_msgSend((id)objc_msgSend(v105, "awdlOpMode"), "bytes") + 4)];
    else
      v118 = "UNKNOWN";
  }
  else
  {
    v118 = "n/a";
  }
  objc_msgSend(v106, "appendFormat:", CFSTR("    Op Mode                : %s\n"), v118);
  if (objc_msgSend(v105, "awdlSyncState"))
  {
    v119 = (__CFString *)objc_msgSend((id)objc_msgSend(v105, "awdlSyncState"), "bytes");
    if (v119)
    {
      v120 = HIDWORD(v119->isa) - 1;
      if (v120 > 2)
        v119 = CFSTR("Stop");
      else
        v119 = off_24C23C700[v120];
    }
    v121 = (const char *)-[__CFString UTF8String](v119, "UTF8String");
  }
  else
  {
    v121 = "n/a";
  }
  objc_msgSend(v106, "appendFormat:", CFSTR("    Sync State             : %s\n"), v121);
  v122 = objc_msgSend((id)objc_msgSend(v105, "awdlSyncParameters"), "bytes");
  if (v122)
  {
    v123 = (unsigned int *)v122;
    objc_msgSend(v106, "appendFormat:", CFSTR("    Sync Params\n"));
    objc_msgSend(v106, "appendFormat:", CFSTR("      AW Period            : %d\n"), v123[2]);
    objc_msgSend(v106, "appendFormat:", CFSTR("      AW Length            : %d\n"), v123[1]);
    objc_msgSend(v106, "appendFormat:", CFSTR("      Extension Length     : %d\n"), v123[3]);
    objc_msgSend(v106, "appendFormat:", CFSTR("      Sync Frame Period    : %d (Non-Election Master=%d)\n"), v123[4], v123[5]);
  }
  else
  {
    objc_msgSend(v106, "appendString:", CFSTR("    Sync Params            : n/a\n"));
  }
  v124 = objc_msgSend((id)objc_msgSend(v105, "awdlMasterChannel"), "bytes");
  v125 = objc_msgSend((id)objc_msgSend(v105, "awdlSecondaryMasterChannel"), "bytes");
  if (v124 && v125)
    objc_msgSend(v106, "appendFormat:", CFSTR("    Master Channel         : %u/%u\n"), *(unsigned int *)(v124 + 4), *(unsigned int *)(v125 + 4));
  else
    objc_msgSend(v106, "appendString:", CFSTR("    Master Channel         : n/a\n"));
  v126 = objc_msgSend((id)objc_msgSend(v105, "awdlElectionParameters"), "bytes");
  if (v126)
  {
    v127 = v126;
    objc_msgSend(v106, "appendFormat:", CFSTR("    Election Params\n"));
    objc_msgSend(v106, "appendFormat:", CFSTR("      Election ID          : %u\n"), *(unsigned __int16 *)(v127 + 18));
    objc_msgSend(v106, "appendFormat:", CFSTR("      Self Metric          : %u\n"), *(unsigned int *)(v127 + 32));
    objc_msgSend(v106, "appendFormat:", CFSTR("      Flags                : 0x%x\n"), *(unsigned __int8 *)(v127 + 16));
    objc_msgSend(v106, "appendFormat:", CFSTR("      Top Master Metric    : %u\n"), *(unsigned int *)(v127 + 28));
    objc_msgSend(v106, "appendFormat:", CFSTR("      Distance From Top    : %u\n"), *(unsigned __int8 *)(v127 + 20));
    objc_msgSend(v106, "appendFormat:", CFSTR("      Top Master           : %02X:%02X:%02X:%02X:%02X:%02X\n"), *(unsigned __int8 *)(v127 + 22), *(unsigned __int8 *)(v127 + 23), *(unsigned __int8 *)(v127 + 24), *(unsigned __int8 *)(v127 + 25), *(unsigned __int8 *)(v127 + 26), *(unsigned __int8 *)(v127 + 27));
  }
  else
  {
    objc_msgSend(v106, "appendString:", CFSTR("    Election Params        : n/a\n"));
  }
  v128 = objc_msgSend((id)objc_msgSend(v105, "awdlPeerDatabase"), "bytes");
  if (v128)
    objc_msgSend(v106, "appendFormat:", CFSTR("      PeerDB Count         : %u\n"), *(unsigned int *)(v128 + 4));
  v129 = objc_msgSend((id)objc_msgSend(v105, "awdlSidecarDiagnostics"), "bytes");
  if (v129)
    objc_msgSend(v106, "appendFormat:", CFSTR("      Sidecar Tx Latency   : %ums\n"), *(unsigned int *)(v129 + 4));
  objc_msgSend(v162, "appendString:", (id)objc_msgSend(v106, "copy"));
  objc_msgSend(v162, "appendFormat:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v162, "appendFormat:", CFSTR("POWER\n"));
  objc_msgSend(v162, "appendFormat:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v130 = (void *)objc_msgSend(v161, "power");
  v131 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v132 = objc_msgSend(v130, "powerSourceType");
  if (v132 >= 4)
    v133 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), v132);
  else
    v133 = off_24C23CD20[v132];
  objc_msgSend(v131, "appendFormat:", CFSTR("    Power Source         : %s\n"), -[__CFString UTF8String](v133, "UTF8String"));
  v134 = objc_msgSend(v130, "batteryWarningLevel");
  if (v134 - 1 >= 3)
    v135 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), v134);
  else
    v135 = off_24C23CD40[v134 - 1];
  objc_msgSend(v131, "appendFormat:", CFSTR("    Battery Warning Level: %s\n"), -[__CFString UTF8String](v135, "UTF8String"));
  objc_msgSend(v130, "powerStateCaps");
  objc_msgSend(v131, "appendFormat:", CFSTR("    System Caps          : %s\n"), objc_msgSend((id)W5DescriptionForPowerStateCaps(), "UTF8String"));
  objc_msgSend(v162, "appendString:", (id)objc_msgSend(v131, "copy"));
  objc_msgSend(v162, "appendFormat:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v162, "appendFormat:", CFSTR("WIFI FAULTS LAST HOUR\n"));
  objc_msgSend(v162, "appendFormat:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v136 = (void *)objc_msgSend(v161, "lastHrFaults");
  v137 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (objc_msgSend(v136, "lastHrFaults")
    && (!objc_msgSend(v136, "lastHrFaults") || objc_msgSend((id)objc_msgSend(v136, "lastHrFaults"), "count")))
  {
    v185 = 0u;
    v186 = 0u;
    v183 = 0u;
    v184 = 0u;
    objb = (id)objc_msgSend(v136, "lastHrFaults");
    v138 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v183, &v175, 16);
    if (v138)
    {
      v139 = v138;
      v140 = *(_QWORD *)v184;
      do
      {
        for (n = 0; n != v139; ++n)
        {
          if (*(_QWORD *)v184 != v140)
            objc_enumerationMutation(objb);
          v142 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * n);
          objc_msgSend(v137, "appendFormat:", CFSTR("    Fault                : %s\n"), objc_msgSend((id)objc_msgSend(v142, "objectForKeyedSubscript:", CFSTR("type")), "UTF8String"));
          objc_msgSend(v137, "appendFormat:", CFSTR("%@"), __printDictionaryContents(v142, objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("date"), CFSTR("interface"), 0), 0));
        }
        v139 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v183, &v175, 16);
      }
      while (v139);
    }
  }
  else
  {
    objc_msgSend(v137, "appendFormat:", CFSTR("    None\n"));
  }
  objc_msgSend(v162, "appendString:", (id)objc_msgSend(v137, "copy"));
  objc_msgSend(v162, "appendFormat:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v162, "appendFormat:", CFSTR("WIFI RECOVERIES LAST HOUR\n"));
  objc_msgSend(v162, "appendFormat:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v143 = (void *)objc_msgSend(v161, "lastHrRecoveries");
  v144 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (objc_msgSend(v143, "lastHrRecoveries")
    && (!objc_msgSend(v143, "lastHrRecoveries") || objc_msgSend((id)objc_msgSend(v143, "lastHrRecoveries"), "count")))
  {
    v185 = 0u;
    v186 = 0u;
    v183 = 0u;
    v184 = 0u;
    v145 = (void *)objc_msgSend(v143, "lastHrRecoveries");
    v146 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v183, &v175, 16);
    if (v146)
    {
      v147 = v146;
      v148 = *(_QWORD *)v184;
      do
      {
        for (ii = 0; ii != v147; ++ii)
        {
          if (*(_QWORD *)v184 != v148)
            objc_enumerationMutation(v145);
          v150 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * ii);
          objc_msgSend(v144, "appendFormat:", CFSTR("    Reason               : %s\n"), objc_msgSend((id)objc_msgSend(v150, "objectForKeyedSubscript:", CFSTR("recoveryReason")), "UTF8String"));
          objc_msgSend(v144, "appendFormat:", CFSTR("%@"), __printDictionaryContents(v150, 0, objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("recoveryReason"), 0)));
        }
        v147 = objc_msgSend(v145, "countByEnumeratingWithState:objects:count:", &v183, &v175, 16);
      }
      while (v147);
    }
  }
  else
  {
    objc_msgSend(v144, "appendFormat:", CFSTR("    None\n"));
  }
  objc_msgSend(v162, "appendString:", (id)objc_msgSend(v144, "copy"));
  objc_msgSend(v162, "appendFormat:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v162, "appendFormat:", CFSTR("WIFI LINK TESTS LAST HOUR\n"));
  objc_msgSend(v162, "appendFormat:", CFSTR("————————————————————————————————————————————————————————————————————\n"));
  v151 = (void *)objc_msgSend(v161, "lastHrLinkTests");
  v152 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (objc_msgSend(v151, "lastHrLinkTests")
    && (!objc_msgSend(v151, "lastHrLinkTests") || objc_msgSend((id)objc_msgSend(v151, "lastHrLinkTests"), "count")))
  {
    v185 = 0u;
    v186 = 0u;
    v183 = 0u;
    v184 = 0u;
    v153 = (void *)objc_msgSend(v151, "lastHrLinkTests");
    v154 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v183, &v175, 16);
    if (v154)
    {
      v155 = v154;
      v156 = *(_QWORD *)v184;
      do
      {
        for (jj = 0; jj != v155; ++jj)
        {
          if (*(_QWORD *)v184 != v156)
            objc_enumerationMutation(v153);
          v158 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * jj);
          objc_msgSend(v152, "appendFormat:", CFSTR("    Reason               : %s\n"), objc_msgSend((id)objc_msgSend(v158, "objectForKeyedSubscript:", CFSTR("initiatingReason")), "UTF8String"));
          objc_msgSend(v152, "appendFormat:", CFSTR("%@"), __printDictionaryContents(v158, 0, objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("initiatingReason"), 0)));
        }
        v155 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v183, &v175, 16);
      }
      while (v155);
    }
  }
  else
  {
    objc_msgSend(v152, "appendFormat:", CFSTR("    None\n"));
  }
  objc_msgSend(v162, "appendString:", (id)objc_msgSend(v152, "copy"));
  return (id)objc_msgSend(v162, "copy");
}

id W5FormattedHeaderForDiagnosticsTestResults()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  objc_msgSend(v0, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v0, "appendString:", CFSTR("Timestamp    Name                          Duration    Result    Description                            \n"));
  objc_msgSend(v0, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————————————————————————————————————————\n"));
  return (id)objc_msgSend(v0, "copy");
}

id W5FormattedHeaderForDiagnosticsTestResults2()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  objc_msgSend(v0, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————————————————————————————————————————\n"));
  objc_msgSend(v0, "appendString:", CFSTR("Name                                       Duration    Result    Timestamp           Description        \n"));
  objc_msgSend(v0, "appendString:", CFSTR("————————————————————————————————————————————————————————————————————————————————————————————————————————\n"));
  return (id)objc_msgSend(v0, "copy");
}

id W5FormattedDescriptionForDiagnosticsTestResult2(void *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __CFString *v13;
  double v14;
  void *i;
  uint64_t v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t n;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t ii;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x24BDAC8D0];
  if (qword_253D89D60 != -1)
    dispatch_once(&qword_253D89D60, &__block_literal_global_1);
  v6 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(a1, "testStarted");
  v8 = objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
  objc_msgSend(a1, "testCompleted");
  v10 = v9;
  objc_msgSend(a1, "testStarted");
  v12 = v11;
  v13 = (__CFString *)objc_msgSend((id)objc_msgSend(a1, "configuration"), "objectForKeyedSubscript:", CFSTR("NameOverride"));
  if (!v13)
    v13 = W5DescriptionForDiagnosticsTestID(objc_msgSend(a1, "testID"));
  v14 = v10 - v12;
  for (i = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string"); a2; --a2)
    objc_msgSend(i, "appendString:", a3);
  v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), i, v13), "UTF8String");
  if (objc_msgSend(a1, "result"))
    v17 = "Yes";
  else
    v17 = "No";
  objc_msgSend(v6, "appendFormat:", CFSTR("%-43.43s%-12.3f%-10.10s%-20.12s%s\n"), v16, *(_QWORD *)&v14, v17, objc_msgSend((id)objc_msgSend((id)_MergedGlobals_1, "stringFromDate:", v8), "UTF8String"), -[__CFString UTF8String]((id)W5DescriptionForDiagnosticsTestResult(a1), "UTF8String"));
  if (objc_msgSend(a1, "testID") == 28)
  {
    v18 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("ScanResults"));
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v78;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v78 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(v6, "appendFormat:", CFSTR("                                                                                     '%s' — %s (%s)\n"), objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * j), "ssidString"), "UTF8String"), objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * j), "bssid"), "UTF8String"), objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * j), "countryCode"), "UTF8String"));
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
      }
      while (v20);
    }
  }
  else if (objc_msgSend(a1, "testID") == 24 || objc_msgSend(a1, "testID") == 23)
  {
    objc_msgSend(v6, "appendFormat:", CFSTR("                                                                                     Recommended 2.4GHz — %ld\n"), objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("2GHzChannel")), "channel"));
    v23 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("5GHzChannel"));
    v24 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("5GHzNonDFSChannel"));
    v25 = objc_msgSend(v23, "channel");
    v26 = objc_msgSend(v24, "channel");
    v27 = objc_msgSend(v23, "channel");
    if (v25 == v26)
      objc_msgSend(v6, "appendFormat:", CFSTR("                                                                                     Recommended 5GHz — %ld\n"), v27, v60);
    else
      objc_msgSend(v6, "appendFormat:", CFSTR("                                                                                     Recommended 5GHz — %ld,%ld\n"), v27, objc_msgSend(v24, "channel"));
  }
  else if (objc_msgSend(a1, "testID") == 29)
  {
    v29 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("ScanResults"));
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v74;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v74 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(v6, "appendFormat:", CFSTR("                                                                                     '%s' — %s\n"), objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * k), "ssidString"), "UTF8String"), objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * k), "bssid"), "UTF8String"));
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
      }
      while (v31);
    }
  }
  else if (objc_msgSend(a1, "testID") == 27)
  {
    v34 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("ScanResults"));
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v70;
      do
      {
        for (m = 0; m != v36; ++m)
        {
          if (*(_QWORD *)v70 != v37)
            objc_enumerationMutation(v34);
          objc_msgSend(v6, "appendFormat:", CFSTR("                                                                                     '%s' — %s (ch %ld)\n"), objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * m), "ssidString"), "UTF8String"), objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * m), "bssid"), "UTF8String"), objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * m), "channel"), "channel"));
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
      }
      while (v36);
    }
  }
  else if (objc_msgSend(a1, "testID") == 48)
  {
    v39 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("PreferredNetworks"));
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v66;
      do
      {
        for (n = 0; n != v41; ++n)
        {
          if (*(_QWORD *)v66 != v42)
            objc_enumerationMutation(v39);
          objc_msgSend(v6, "appendFormat:", CFSTR("                                                                                     '%s' — %s\n"), objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * n), "ssidString"), "UTF8String"), -[__CFString UTF8String]((id)W5DescriptionForSecurity(objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * n), "security")), "UTF8String"));
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
      }
      while (v41);
    }
  }
  else if (objc_msgSend(a1, "testID") == 4 || objc_msgSend(a1, "testID") == 5 || objc_msgSend(a1, "testID") == 6)
  {
    v44 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("PingResults"));
    if ((unint64_t)objc_msgSend(v44, "count") >= 2)
    {
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v62;
        do
        {
          for (ii = 0; ii != v46; ++ii)
          {
            if (*(_QWORD *)v62 != v47)
              objc_enumerationMutation(v44);
            v49 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * ii);
            v50 = objc_msgSend(v49, "address");
            objc_msgSend(v49, "min");
            v52 = v51;
            v53 = W5DescriptionForPingTrafficClass(objc_msgSend(v49, "trafficClass"));
            v54 = objc_msgSend(v49, "dataLength") + 64;
            objc_msgSend(v49, "interval");
            v56 = v55;
            objc_msgSend(v49, "wait");
            v58 = v57;
            objc_msgSend(v49, "timeout");
            objc_msgSend(v6, "appendFormat:", CFSTR("                                                                                     %@ / %.2fms / %@ / %ld bytes / i=%fs / W=%fs / t=%fs / c=%ld\n"), v50, v52, v53, v54, v56, v58, v59, objc_msgSend(v49, "count"));
          }
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
        }
        while (v46);
      }
    }
  }
  return (id)objc_msgSend(v6, "copy");
}

__CFString *W5DescriptionForDiagnosticsTestID(unint64_t a1)
{
  if (a1 >= 0x40)
    return (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%li>"), a1);
  else
    return off_24C23C480[a1];
}

const __CFString *W5DescriptionForDiagnosticsTestResult(void *a1)
{
  uint64_t v2;
  const __CFString *result;
  void *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  float v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  const __CFString *v42;
  const __CFString *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  const __CFString *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const __CFString *v55;
  unint64_t v56;
  int v57;
  const __CFString *v58;
  unint64_t v59;
  int v60;
  uint64_t v61;
  int v62;
  const __CFString *v63;
  uint64_t v64;
  int v65;
  const __CFString *v66;
  uint64_t v67;
  int v68;
  const __CFString *v69;
  uint64_t v70;
  int v71;
  const __CFString *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const __CFString *v78;
  void *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const __CFString *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  float v89;
  const __CFString *v90;
  uint64_t v91;
  void *v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const __CFString *v101;
  unint64_t v102;
  int v103;
  uint64_t v104;
  int v105;
  const __CFString *v106;
  uint64_t v107;
  int v108;
  const __CFString *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  unsigned int v115;
  unint64_t v116;
  unint64_t v117;
  const __CFString *v118;
  void *v119;
  int v120;
  const __CFString *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  const __CFString *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  __CFString *v133;
  const __CFString *v134;
  uint64_t v135;
  const __CFString *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;

  v2 = objc_msgSend(a1, "testID");
  result = &stru_24C23DB48;
  switch(v2)
  {
    case 0:
    case 53:
    case 55:
    case 56:
    case 62:
      return result;
    case 1:
    case 2:
    case 3:
      v4 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("PingResult"));
      v5 = (void *)MEMORY[0x24BDD17C8];
      if (objc_msgSend(a1, "didPass"))
        v6 = "";
      else
        v6 = "not ";
      v7 = objc_msgSend(v4, "address");
      objc_msgSend(v4, "min");
      v9 = v8;
      v10 = W5DescriptionForPingTrafficClass(objc_msgSend(v4, "trafficClass"));
      v11 = objc_msgSend(v4, "dataLength") + 64;
      objc_msgSend(v4, "interval");
      v13 = v12;
      objc_msgSend(v4, "wait");
      v15 = v14;
      objc_msgSend(v4, "timeout");
      v17 = v16;
      v141 = objc_msgSend(v4, "count");
      v139 = v15;
      v140 = v17;
      v138 = v13;
      v136 = v10;
      v137 = v11;
      v135 = v9;
      v18 = CFSTR("Could %sping router (%@ / %.2fms / %@ / %ld bytes / i=%fs / W=%fs t=%fs / c=%ld)");
      goto LABEL_150;
    case 4:
    case 5:
    case 6:
      v19 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("PingResults"));
      if ((unint64_t)objc_msgSend(v19, "count") >= 2)
      {
        v20 = objc_msgSend(a1, "didPass");
        v21 = (void *)MEMORY[0x24BDD17C8];
        v133 = (__CFString *)objc_msgSend(v19, "count");
        if (v20)
          v18 = CFSTR("Could ping DNS server(s) (%ld)");
        else
          v18 = CFSTR("Could not ping DNS server(s) (%ld)");
        goto LABEL_157;
      }
      v30 = (void *)objc_msgSend(v19, "firstObject");
      v5 = (void *)MEMORY[0x24BDD17C8];
      if (objc_msgSend(a1, "didPass"))
        v6 = "";
      else
        v6 = "not ";
      v7 = objc_msgSend(v30, "address");
      objc_msgSend(v30, "min");
      v32 = v31;
      v33 = W5DescriptionForPingTrafficClass(objc_msgSend(v30, "trafficClass"));
      v34 = objc_msgSend(v30, "dataLength") + 64;
      objc_msgSend(v30, "interval");
      v36 = v35;
      objc_msgSend(v30, "wait");
      v38 = v37;
      objc_msgSend(v30, "timeout");
      v40 = v39;
      v141 = objc_msgSend(v30, "count");
      v139 = v38;
      v140 = v40;
      v138 = v36;
      v136 = v33;
      v137 = v34;
      v135 = v32;
      v18 = CFSTR("Could %sping DNS server (%@ / %.2fms / %@ / %ld bytes / i=%fs / W=%fs / t=%fs / c=%ld)");
      goto LABEL_150;
    case 7:
      v41 = objc_msgSend(a1, "didPass");
      v42 = CFSTR("Could not resolve 'captive.apple.com'");
      v43 = CFSTR("Could resolve 'captive.apple.com'");
      goto LABEL_107;
    case 8:
      v41 = objc_msgSend(a1, "didPass");
      v42 = CFSTR("Detected double NAT");
      v43 = CFSTR("Did not detect double NAT");
      goto LABEL_107;
    case 9:
      v41 = objc_msgSend(a1, "didPass");
      v42 = CFSTR("Could not reach 'www.apple.com'");
      v43 = CFSTR("Could reach 'www.apple.com'");
      goto LABEL_107;
    case 10:
      v41 = objc_msgSend(a1, "didPass");
      v42 = CFSTR("Could not retrieve 'https://captive.apple.com'");
      v43 = CFSTR("Could retrieve 'https://captive.apple.com'");
      goto LABEL_107;
    case 11:
      v41 = objc_msgSend(a1, "didPass");
      v42 = CFSTR("Could not retrieve 'https://captive.apple.com' over Wi-Fi");
      v43 = CFSTR("Could retrieve 'https://captive.apple.com' over Wi-Fi");
      goto LABEL_107;
    case 12:
      v44 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("IPv4Router"));
      v45 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("IPv4Addresses"));
      if (objc_msgSend(a1, "didPass"))
      {
        v21 = (void *)MEMORY[0x24BDD17C8];
        v133 = (__CFString *)v44;
        v134 = (const __CFString *)objc_msgSend(v45, "firstObject");
        v18 = CFSTR("Wi-Fi has IPv4 assigned (router=%@ ip=%@)");
        goto LABEL_157;
      }
      return CFSTR("Wi-Fi does not have IPv4 assigned");
    case 13:
      v91 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("IPv6Router"));
      v92 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("IPv6Addresses"));
      if (objc_msgSend(a1, "didPass"))
      {
        v21 = (void *)MEMORY[0x24BDD17C8];
        v133 = (__CFString *)v91;
        v134 = (const __CFString *)objc_msgSend(v92, "firstObject");
        v18 = CFSTR("Wi-Fi has IPv6 assigned (router=%@ ip=%@)");
        goto LABEL_157;
      }
      return CFSTR("Wi-Fi does not have IPv6 assigned");
    case 14:
      v93 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("IPv4ConfigMethod")), "integerValue");
      v21 = (void *)MEMORY[0x24BDD17C8];
      v133 = W5DescriptionForIPv4ConfigMethod(v93);
      v18 = CFSTR("Wi-Fi is using '%@' for IPv4");
      goto LABEL_157;
    case 15:
      v94 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("IPv6ConfigMethod")), "integerValue");
      v21 = (void *)MEMORY[0x24BDD17C8];
      v133 = W5DescriptionForIPv6ConfigMethod(v94);
      v18 = CFSTR("Wi-Fi is using '%@' for IPv6");
      goto LABEL_157;
    case 16:
      v41 = objc_msgSend(a1, "didPass");
      v42 = CFSTR("Detected custom DNS settings");
      v43 = CFSTR("Did not detect custom DNS settings");
      goto LABEL_107;
    case 17:
      v41 = objc_msgSend(a1, "didPass");
      v42 = CFSTR("Detected custom web proxy settings");
      v43 = CFSTR("Did not detect custom web proxy settings");
      goto LABEL_107;
    case 18:
      v95 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("BTPairedCount")), "integerValue");
      v74 = (void *)MEMORY[0x24BDD17C8];
      v133 = (__CFString *)v95;
      v18 = CFSTR("Paired Bluetooth device count (%ld)");
      goto LABEL_113;
    case 19:
      v96 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("BTConnectedCount")), "integerValue");
      v74 = (void *)MEMORY[0x24BDD17C8];
      v133 = (__CFString *)v96;
      v18 = CFSTR("Connected Bluetooth device count (%ld)");
      goto LABEL_113;
    case 20:
      v41 = objc_msgSend(a1, "didPass");
      v42 = CFSTR("Bluetooth coexistence is active");
      v43 = CFSTR("Bluetooth coexistence is not active");
      goto LABEL_107;
    case 21:
      v41 = objc_msgSend(a1, "didPass");
      v42 = CFSTR("AWDL is active");
      v43 = CFSTR("AWDL is not active");
      goto LABEL_107;
    case 22:
      v41 = objc_msgSend(a1, "didPass");
      v42 = CFSTR("AWDL real time mode is active");
      v43 = CFSTR("AWDL real time mode is not active");
      goto LABEL_107;
    case 23:
    case 24:
      v22 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("CCA"));
      v23 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("CurrentChannel"));
      v24 = objc_msgSend(a1, "didPass");
      v21 = (void *)MEMORY[0x24BDD17C8];
      v25 = objc_msgSend(v23, "channel");
      if (v24)
      {
        if (v22)
        {
          v26 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v22, "floatValue");
          v28 = (const __CFString *)objc_msgSend(v26, "stringWithFormat:", CFSTR("%.1f%%"), v27);
        }
        else
        {
          v28 = CFSTR("n/a");
        }
        v133 = (__CFString *)v25;
        v134 = v28;
        v18 = CFSTR("Current channel (%ld) is NOT congested (CCA = %@)");
      }
      else
      {
        if (v22)
        {
          v88 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v22, "floatValue");
          v90 = (const __CFString *)objc_msgSend(v88, "stringWithFormat:", CFSTR("%.1f%%"), v89);
        }
        else
        {
          v90 = CFSTR("n/a");
        }
        v133 = (__CFString *)v25;
        v134 = v90;
        v18 = CFSTR("Current channel (%ld) is congested (CCA = %@)");
      }
      goto LABEL_157;
    case 25:
      v41 = objc_msgSend(a1, "didPass");
      v42 = CFSTR("2.4GHz band is congested");
      v43 = CFSTR("2.4GHz band is not congested");
      goto LABEL_107;
    case 26:
      v41 = objc_msgSend(a1, "didPass");
      v42 = CFSTR("5GHz band is congested");
      v43 = CFSTR("5GHz band is not congested");
      goto LABEL_107;
    case 27:
      v41 = objc_msgSend(a1, "didPass");
      v42 = CFSTR("Found HT40 network(s) in 2.4GHz");
      v43 = CFSTR("Did not find HT40 network(s) in 2.4GHz");
      goto LABEL_107;
    case 28:
      v97 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("AdoptedCountryCode"));
      if (objc_msgSend(a1, "didPass"))
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Did not find conflicting country code(s) (%@)"), v97, v134, v135, v136, v137, v138, v139, v140, v141);
      else
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Found conflicting country code(s) (%@)"), v97, v134, v135, v136, v137, v138, v139, v140, v141);
    case 29:
      v41 = objc_msgSend(a1, "didPass");
      v42 = CFSTR("Found conflicting security types");
      v43 = CFSTR("Did not find conflicting security types");
      goto LABEL_107;
    case 30:
      v46 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("ScanResults"));
      if ((objc_msgSend(a1, "didPass") & 1) != 0)
        return CFSTR("Did not find any hidden networks");
      v21 = (void *)MEMORY[0x24BDD17C8];
      v133 = (__CFString *)objc_msgSend(v46, "count");
      v18 = CFSTR("Found %ld hidden network(s)");
      goto LABEL_157;
    case 31:
      v41 = objc_msgSend(a1, "didPass");
      v42 = CFSTR("No Wi-Fi networks are visible");
      v43 = CFSTR("Wi-Fi networks are visible");
      goto LABEL_107;
    case 32:
      v47 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("NetworkName"));
      v48 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("RSSI")), "integerValue");
      v49 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("Noise")), "integerValue");
      v50 = objc_msgSend(a1, "didPass");
      v51 = CFSTR("Current network");
      if (v47)
        v51 = (const __CFString *)v47;
      if (v50)
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ has good signal (RSSI=%lddBm, SNR=%lddB)"), v51, v48, v48 - v49, v136, v137, v138, v139, v140, v141);
      else
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ has poor signal (RSSI=%lddBm, SNR=%lddB)"), v51, v48, v48 - v49, v136, v137, v138, v139, v140, v141);
    case 33:
      v52 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("NetworkName"));
      v53 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("AirPortModelName"));
      if (objc_msgSend(a1, "didPass"))
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v53, v134, v135, v136, v137, v138, v139, v140, v141);
      v121 = CFSTR("Current network");
      if (v52)
        v121 = (const __CFString *)v52;
      return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is not an AirPort Base Station"), v121, v134, v135, v136, v137, v138, v139, v140, v141);
    case 34:
      v98 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("BeaconInterval")), "integerValue");
      v74 = (void *)MEMORY[0x24BDD17C8];
      v133 = (__CFString *)v98;
      v18 = CFSTR("Beacon interval is %ldms");
      goto LABEL_113;
    case 35:
      v99 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("BeaconInterval")), "integerValue");
      v74 = (void *)MEMORY[0x24BDD17C8];
      v133 = (__CFString *)v99;
      v18 = CFSTR("DTIM interval is %ldms");
      goto LABEL_113;
    case 36:
      v54 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("ScanResults"));
      if (objc_msgSend(a1, "didPass"))
      {
        v21 = (void *)MEMORY[0x24BDD17C8];
        v133 = (__CFString *)objc_msgSend(v54, "count");
        v18 = CFSTR("%ld PNL networks have conflicting PHY modes (802.11ac).");
        goto LABEL_157;
      }
      return CFSTR("No PNL networks have conflicting PHY modes (802.11ac).");
    case 37:
      v100 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("ScanResults"));
      if (objc_msgSend(a1, "didPass"))
      {
        v21 = (void *)MEMORY[0x24BDD17C8];
        v133 = (__CFString *)objc_msgSend(v100, "count");
        v18 = CFSTR("%ld PNL networks have conflicting PHY modes (802.11n).");
        goto LABEL_157;
      }
      return CFSTR("No PNL networks have conflicting PHY modes (802.11n).");
    case 38:
      v101 = (const __CFString *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("NetworkName"));
      v102 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("Security")), "integerValue");
      v103 = objc_msgSend(a1, "didPass");
      v21 = (void *)MEMORY[0x24BDD17C8];
      if (!v101)
        v101 = CFSTR("Current network");
      if (v103)
      {
        v133 = (__CFString *)v101;
        v134 = W5DescriptionForSecurity(v102);
        v18 = CFSTR("%@ does not use open security (%@)");
      }
      else
      {
        v133 = (__CFString *)v101;
        v18 = CFSTR("%@ uses open security");
      }
      goto LABEL_157;
    case 39:
      v55 = (const __CFString *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("NetworkName"));
      v56 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("Security")), "integerValue");
      v57 = objc_msgSend(a1, "didPass");
      v21 = (void *)MEMORY[0x24BDD17C8];
      if (!v55)
        v55 = CFSTR("Current network");
      if (v57)
      {
        v133 = (__CFString *)v55;
        v134 = W5DescriptionForSecurity(v56);
        v18 = CFSTR("%@ does not use WEP security (%@)");
      }
      else
      {
        v133 = (__CFString *)v55;
        v18 = CFSTR("%@ uses WEP security");
      }
      goto LABEL_157;
    case 40:
      v58 = (const __CFString *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("NetworkName"));
      v59 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("Security")), "integerValue");
      v60 = objc_msgSend(a1, "didPass");
      v21 = (void *)MEMORY[0x24BDD17C8];
      if (!v58)
        v58 = CFSTR("Current network");
      if (v60)
      {
        v133 = (__CFString *)v58;
        v134 = W5DescriptionForSecurity(v59);
        v18 = CFSTR("%@ does not use WPA security (%@)");
      }
      else
      {
        v133 = (__CFString *)v58;
        v18 = CFSTR("%@ uses WPA security");
      }
      goto LABEL_157;
    case 41:
      v104 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("NetworkName"));
      v105 = objc_msgSend(a1, "didPass");
      v106 = CFSTR("Current network");
      if (v104)
        v106 = (const __CFString *)v104;
      if (v105)
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is not using 802.11b"), v106, v134, v135, v136, v137, v138, v139, v140, v141);
      else
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is using 802.11b"), v106, v134, v135, v136, v137, v138, v139, v140, v141);
    case 42:
      v107 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("NetworkName"));
      v108 = objc_msgSend(a1, "didPass");
      v109 = CFSTR("Current network");
      if (v107)
        v109 = (const __CFString *)v107;
      if (v108)
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is not ambiguous"), v109, v134, v135, v136, v137, v138, v139, v140, v141);
      else
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is ambiguous"), v109, v134, v135, v136, v137, v138, v139, v140, v141);
    case 43:
      v61 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("NetworkName"));
      v62 = objc_msgSend(a1, "didPass");
      v63 = CFSTR("Current network");
      if (v61)
        v63 = (const __CFString *)v61;
      if (v62)
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is not marked as hidden"), v63, v134, v135, v136, v137, v138, v139, v140, v141);
      else
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is marked as hidden"), v63, v134, v135, v136, v137, v138, v139, v140, v141);
    case 44:
      v64 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("NetworkName"));
      v65 = objc_msgSend(a1, "didPass");
      v66 = CFSTR("Current network");
      if (v64)
        v66 = (const __CFString *)v64;
      if (v65)
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is not an iOS PH"), v66, v134, v135, v136, v137, v138, v139, v140, v141);
      else
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is an iOS PH"), v66, v134, v135, v136, v137, v138, v139, v140, v141);
    case 45:
      v67 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("NetworkName"));
      v68 = objc_msgSend(a1, "didPass");
      v69 = CFSTR("Current network");
      if (v67)
        v69 = (const __CFString *)v67;
      if (v68)
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is not Passpoint"), v69, v134, v135, v136, v137, v138, v139, v140, v141);
      else
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is Passpoint"), v69, v134, v135, v136, v137, v138, v139, v140, v141);
    case 46:
      v70 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("NetworkName"));
      v71 = objc_msgSend(a1, "didPass");
      v72 = CFSTR("Current network");
      if (v70)
        v72 = (const __CFString *)v70;
      if (v71)
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is not captive"), v72, v134, v135, v136, v137, v138, v139, v140, v141);
      else
        return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ is captive"), v72, v134, v135, v136, v137, v138, v139, v140, v141);
    case 47:
      v110 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("PNLCount")), "integerValue");
      v74 = (void *)MEMORY[0x24BDD17C8];
      v133 = (__CFString *)v110;
      v18 = CFSTR("Wi-Fi PNL count (%ld)");
      goto LABEL_113;
    case 48:
      v41 = objc_msgSend(a1, "didPass");
      v42 = CFSTR("PNL contains hidden networks");
      v43 = CFSTR("PNL does not contain hidden networks");
      goto LABEL_107;
    case 49:
    case 50:
      if (objc_msgSend(a1, "didPass"))
      {
        v29 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("Mbps"));
        v21 = (void *)MEMORY[0x24BDD17C8];
        v133 = (__CFString *)objc_msgSend(v29, "integerValue");
        v18 = CFSTR("Completed speed test (%ld Mbps)");
        goto LABEL_157;
      }
      return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to perform speed test"));
    case 51:
      v41 = objc_msgSend(a1, "didPass");
      v42 = CFSTR("Current network is 'leaky'");
      v43 = CFSTR("Current network is not 'leaky'");
      goto LABEL_107;
    case 52:
      if (objc_msgSend(a1, "didPass"))
      {
        v73 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("NetworkName"));
        v74 = (void *)MEMORY[0x24BDD17C8];
        v133 = (__CFString *)v73;
        v18 = CFSTR("Wi-Fi is associated to '%@'");
        goto LABEL_113;
      }
      return CFSTR("Wi-Fi is not associated");
    case 54:
      v41 = objc_msgSend(a1, "didPass");
      v42 = CFSTR("Could not curl 'https://captive.apple.com'");
      v43 = CFSTR("Could curl 'https://captive.apple.com'");
LABEL_107:
      if (v41)
        return v43;
      else
        return v42;
    case 57:
      v75 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("IPv4InterfaceName"));
      v76 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("IPv4ServiceName"));
      v77 = (void *)objc_msgSend(a1, "info");
      v78 = CFSTR("IPv4ServiceID");
      goto LABEL_111;
    case 58:
      v75 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("IPv6InterfaceName"));
      v76 = objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("IPv6ServiceName"));
      v77 = (void *)objc_msgSend(a1, "info");
      v78 = CFSTR("IPv6ServiceID");
LABEL_111:
      v111 = objc_msgSend(v77, "objectForKeyedSubscript:", v78);
      if (!v75)
        return CFSTR("None");
      v74 = (void *)MEMORY[0x24BDD17C8];
      v134 = (const __CFString *)v76;
      v135 = v111;
      v133 = (__CFString *)v75;
      v18 = CFSTR("%@ (%@ / %@)");
LABEL_113:
      v112 = v74;
      goto LABEL_158;
    case 59:
      v79 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("PingResult"));
      v80 = (void *)MEMORY[0x24BDD17C8];
      if (objc_msgSend(a1, "didPass"))
        v81 = "";
      else
        v81 = "not ";
      v82 = objc_msgSend(v79, "address");
      objc_msgSend(v79, "min");
      v84 = v83;
      v85 = W5DescriptionForPingTrafficClass(objc_msgSend(v79, "trafficClass"));
      v86 = objc_msgSend(v79, "dataLength") + 64;
      objc_msgSend(v79, "wait");
      return (const __CFString *)objc_msgSend(v80, "stringWithFormat:", CFSTR("Could %sping AWDL (%@ / %.2fms / %@ / %ld bytes / w=%fs / c=%ld)"), v81, v82, v84, v85, v86, v87, objc_msgSend(v79, "count"), v140, v141);
    case 60:
      if (objc_msgSend(a1, "result"))
      {
        v113 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("PeerDiagnosticsResults"));
        v21 = (void *)MEMORY[0x24BDD17C8];
        v133 = (__CFString *)objc_msgSend(v113, "count");
        v18 = CFSTR("Collected diagnostics from %lu device(s)");
        goto LABEL_157;
      }
      return CFSTR("No peers or no response");
    case 61:
      if (objc_msgSend(a1, "result"))
      {
        v114 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("PeerDevicesInfo"));
        v115 = objc_msgSend((id)objc_msgSend(v114, "objectForKey:", CFSTR("numberOfIOSDevices")), "unsignedIntValue");
        v116 = objc_msgSend((id)objc_msgSend(v114, "objectForKey:", CFSTR("numberOfTVOSDevices")), "unsignedIntValue")+ (unint64_t)v115;
        v117 = v116
             + objc_msgSend((id)objc_msgSend(v114, "objectForKey:", CFSTR("numberOfMacOSDevices")), "unsignedIntValue");
        v118 = (const __CFString *)(v117
                                  + objc_msgSend((id)objc_msgSend(v114, "objectForKey:", CFSTR("numberOfWatchOSDevices")), "unsignedIntValue"));
        v5 = (void *)MEMORY[0x24BDD17C8];
        v133 = (__CFString *)objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("DeviceModel"));
        v134 = v118;
        v18 = CFSTR("Collected peer device info from %@: found %lu devices");
        goto LABEL_151;
      }
      result = CFSTR("No response");
      break;
    case 63:
      v119 = (void *)objc_msgSend((id)objc_msgSend(a1, "info"), "objectForKeyedSubscript:", CFSTR("PingsReceived"));
      if ((unint64_t)objc_msgSend(v119, "count") < 2)
      {
        v122 = (void *)objc_msgSend(v119, "firstObject");
        v5 = (void *)MEMORY[0x24BDD17C8];
        if (objc_msgSend(a1, "didPass"))
          v6 = "";
        else
          v6 = "not ";
        v7 = objc_msgSend(v122, "address");
        objc_msgSend(v122, "min");
        v124 = v123;
        v125 = W5DescriptionForPingTrafficClass(objc_msgSend(v122, "trafficClass"));
        v126 = objc_msgSend(v122, "dataLength") + 64;
        objc_msgSend(v122, "interval");
        v128 = v127;
        objc_msgSend(v122, "wait");
        v130 = v129;
        objc_msgSend(v122, "timeout");
        v132 = v131;
        v141 = objc_msgSend(v122, "count");
        v139 = v130;
        v140 = v132;
        v138 = v128;
        v136 = v125;
        v137 = v126;
        v135 = v124;
        v18 = CFSTR("Could %sping IP address (%@ / %.2fms / %@ / %ld bytes / i=%fs / W=%fs / t=%fs / c=%ld)");
LABEL_150:
        v133 = (__CFString *)v6;
        v134 = (const __CFString *)v7;
LABEL_151:
        v112 = v5;
      }
      else
      {
        v120 = objc_msgSend(a1, "didPass");
        v21 = (void *)MEMORY[0x24BDD17C8];
        v133 = (__CFString *)objc_msgSend(v119, "count");
        if (v120)
          v18 = CFSTR("Could ping IP address(es) (%ld)");
        else
          v18 = CFSTR("Could not ping IP address(es) (%ld)");
LABEL_157:
        v112 = v21;
      }
LABEL_158:
      result = (const __CFString *)objc_msgSend(v112, "stringWithFormat:", v18, v133, v134, v135, v136, v137, v138, v139, v140, v141);
      break;
    default:
      v5 = (void *)MEMORY[0x24BDD17C8];
      v133 = (__CFString *)objc_msgSend(a1, "testID");
      v18 = CFSTR("<%li>");
      goto LABEL_151;
  }
  return result;
}

const __CFString *W5DescriptionForSecurity(unint64_t a1)
{
  if (a1 > 0xF)
    return CFSTR("?");
  else
    return off_24C23C680[a1];
}

const __CFString *W5DescriptionForPingTrafficClass(uint64_t a1)
{
  if (a1 > 499)
  {
    if (a1 <= 699)
    {
      if (a1 == 500)
        return CFSTR("RV");
      if (a1 == 600)
        return CFSTR("OAM");
    }
    else
    {
      switch(a1)
      {
        case 700:
          return CFSTR("VI");
        case 800:
          return CFSTR("VO");
        case 900:
          return CFSTR("CTL");
      }
    }
  }
  else if (a1 <= 199)
  {
    if (!a1)
      return CFSTR("BE");
    if (a1 == 100)
      return CFSTR("BK_SYS");
  }
  else
  {
    switch(a1)
    {
      case 200:
        return CFSTR("BK");
      case 300:
        return CFSTR("RD");
      case 400:
        return CFSTR("AV");
    }
  }
  return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%ld>"), a1);
}

id W5FormattedDescriptionForDiagnosticsTestResult(void *a1)
{
  return W5FormattedDescriptionForDiagnosticsTestResult2(a1, 0, 0);
}

const __CFString *W5MachineSerialNumber()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  CFTypeRef CFProperty;
  const void *v5;
  const __CFString *v6;

  v0 = *MEMORY[0x24BDD8B18];
  v1 = IOServiceMatching("IOPlatformExpertDevice");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  if (!MatchingService)
    return CFSTR("????????????");
  v3 = MatchingService;
  CFProperty = IORegistryEntryCreateCFProperty(MatchingService, CFSTR("IOPlatformSerialNumber"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    v6 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", CFProperty);
    CFRelease(v5);
  }
  else
  {
    v6 = CFSTR("????????????");
  }
  IOObjectRelease(v3);
  return v6;
}

BOOL W5IsSelfAssignedIPv4(void *a1)
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("."));
  return (unint64_t)objc_msgSend(v1, "count") >= 2
      && objc_msgSend((id)objc_msgSend(v1, "objectAtIndexedSubscript:", 0), "integerValue") == 169
      && objc_msgSend((id)objc_msgSend(v1, "objectAtIndexedSubscript:", 1), "integerValue") == 254;
}

uint64_t W5IsSelfAssignedIPv6(void *a1)
{
  void *v1;
  void *v2;
  uint64_t result;

  v1 = (void *)objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("::"));
  if ((unint64_t)objc_msgSend(v1, "count") < 2)
    return 0;
  v2 = (void *)objc_msgSend((id)objc_msgSend(v1, "objectAtIndexedSubscript:", 1), "componentsSeparatedByString:", CFSTR(":"));
  result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v1, "firstObject"), "lowercaseString"), "isEqualToString:", CFSTR("fe80"));
  if ((_DWORD)result)
    return objc_msgSend(v2, "count") == 4;
  return result;
}

id W5DescriptionForAWDLElectionParameters(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = v2;
  if (a1)
  {
    objc_msgSend(v2, "appendFormat:", CFSTR("  Election ID           %u\n"), *(unsigned __int16 *)(a1 + 18));
    objc_msgSend(v3, "appendFormat:", CFSTR("  Self Metric           0x%x\n"), *(unsigned int *)(a1 + 32));
    objc_msgSend(v3, "appendFormat:", CFSTR("  Flags                 0x%x\n"), *(unsigned __int8 *)(a1 + 16));
    objc_msgSend(v3, "appendFormat:", CFSTR("  Top Master Metric     0x%x\n"), *(unsigned int *)(a1 + 28));
    objc_msgSend(v3, "appendFormat:", CFSTR("  Distance From Top     %u\n"), *(unsigned __int8 *)(a1 + 20));
    objc_msgSend(v3, "appendFormat:", CFSTR("  Top Master            %02X:%02X:%02X:%02X:%02X:%02X\n"), *(unsigned __int8 *)(a1 + 22), *(unsigned __int8 *)(a1 + 23), *(unsigned __int8 *)(a1 + 24), *(unsigned __int8 *)(a1 + 25), *(unsigned __int8 *)(a1 + 26), *(unsigned __int8 *)(a1 + 27));
  }
  return (id)objc_msgSend(v3, "copy");
}

const __CFString *W5DescriptionForAWDLSyncState(const __CFString *result)
{
  unsigned int v1;

  if (result)
  {
    v1 = HIDWORD(result->isa) - 1;
    if (v1 > 2)
      return CFSTR("Stop");
    else
      return off_24C23C700[v1];
  }
  return result;
}

id W5DebugDescriptionForAWDLSyncState(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = v2;
  if (a1)
  {
    v4 = *(_DWORD *)(a1 + 4);
    switch(v4)
    {
      case 1:
        objc_msgSend(v2, "appendFormat:", CFSTR("master [%02X:%02X:%02X:%02X:%02X:%02X]"), *(unsigned __int8 *)(a1 + 8), *(unsigned __int8 *)(a1 + 9), *(unsigned __int8 *)(a1 + 10), *(unsigned __int8 *)(a1 + 11), *(unsigned __int8 *)(a1 + 12), *(unsigned __int8 *)(a1 + 13));
        break;
      case 2:
        objc_msgSend(v2, "appendFormat:", CFSTR("slave [%02X:%02X:%02X:%02X:%02X:%02X]"), *(unsigned __int8 *)(a1 + 8), *(unsigned __int8 *)(a1 + 9), *(unsigned __int8 *)(a1 + 10), *(unsigned __int8 *)(a1 + 11), *(unsigned __int8 *)(a1 + 12), *(unsigned __int8 *)(a1 + 13));
        break;
      case 3:
        objc_msgSend(v2, "appendFormat:", CFSTR("non-election master [%02X:%02X:%02X:%02X:%02X:%02X]"), *(unsigned __int8 *)(a1 + 8), *(unsigned __int8 *)(a1 + 9), *(unsigned __int8 *)(a1 + 10), *(unsigned __int8 *)(a1 + 11), *(unsigned __int8 *)(a1 + 12), *(unsigned __int8 *)(a1 + 13));
        break;
      default:
        objc_msgSend(v2, "appendString:", CFSTR("stop"));
        break;
    }
  }
  return (id)objc_msgSend(v3, "copy");
}

const __CFString *W5DescriptionForAWDLOpMode(uint64_t a1)
{
  uint64_t v1;
  const char *v2;

  if (!a1)
    return &stru_24C23DB48;
  v1 = *(unsigned int *)(a1 + 4);
  if (v1 <= 2)
    v2 = off_24C23C430[v1];
  else
    v2 = "UNKNOWN";
  return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AWDL OpMode: %s"), v2);
}

id W5DescriptionForAWDLSyncParameters(unsigned int *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  v3 = v2;
  if (a1)
  {
    objc_msgSend(v2, "appendFormat:", CFSTR("  AW Period             %d\n"), a1[2]);
    objc_msgSend(v3, "appendFormat:", CFSTR("  AW Length             %d\n"), a1[1]);
    objc_msgSend(v3, "appendFormat:", CFSTR("  Extension Length      %d\n"), a1[3]);
    objc_msgSend(v3, "appendFormat:", CFSTR("  Sync Frame Period     %d (NE Master=%d)\n"), a1[4], a1[5]);
  }
  return (id)objc_msgSend(v3, "copy");
}

id W5DebugDescriptionForAWDLSyncChannelSequence(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  unsigned int *i;
  unsigned int v5;
  const __CFString *v6;
  unint64_t v7;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (a1 && *(_BYTE *)(a1 + 5))
  {
    v3 = 0;
    for (i = (unsigned int *)(a1 + 16); ; i += 3)
    {
      objc_msgSend(v2, "appendFormat:", CFSTR("%u"), *i);
      if (*i)
      {
        v5 = i[1];
        v6 = CFSTR("++");
        if ((v5 & 0x400) != 0)
          goto LABEL_10;
        if ((v5 & 4) != 0)
          break;
      }
LABEL_11:
      ++v3;
      v7 = *(unsigned __int8 *)(a1 + 5);
      if (v3 < v7)
      {
        objc_msgSend(v2, "appendString:", CFSTR(" "));
        v7 = *(unsigned __int8 *)(a1 + 5);
      }
      if (v3 >= v7)
        return (id)objc_msgSend(v2, "copy");
    }
    if ((v5 & 0x200) != 0)
      v6 = CFSTR("+");
    else
      v6 = CFSTR("-");
LABEL_10:
    objc_msgSend(v2, "appendString:", v6);
    goto LABEL_11;
  }
  return (id)objc_msgSend(v2, "copy");
}

id W5DescriptionForAWDLSyncChannelSequence(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  const __CFString *v14;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (a1)
  {
    v3 = W5DebugDescriptionForAWDLSyncChannelSequence(a1);
    v4 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(" "));
    if (objc_msgSend(v5, "count"))
    {
      v6 = 0;
      v7 = 0;
      v8 = 1;
      do
      {
        v9 = v7;
        v10 = objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
        v7 = (void *)v10;
        if (!v9 || !v10)
          goto LABEL_11;
        if (objc_msgSend(v9, "isEqualToString:", v10))
        {
          v11 = ++v8;
          if (v6 != objc_msgSend(v5, "count") - 1)
            goto LABEL_11;
        }
        else
        {
          v11 = 1;
        }
        objc_msgSend(v4, "addObject:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@(%ld)"), v9, v8));
        v8 = v11;
LABEL_11:
        ++v6;
      }
      while (v6 < objc_msgSend(v5, "count"));
    }
    if (objc_msgSend(v4, "count"))
    {
      v12 = 0;
      do
      {
        v13 = objc_msgSend(v4, "objectAtIndexedSubscript:", v12);
        if (v12 >= objc_msgSend(v4, "count") - 1)
          v14 = CFSTR("%@");
        else
          v14 = CFSTR("%@ ");
        objc_msgSend(v2, "appendFormat:", v14, v13);
        ++v12;
      }
      while (v12 < objc_msgSend(v4, "count"));
    }
  }
  return (id)objc_msgSend(v2, "copy");
}

__CFString *W5DescriptionForAirDropDiscoverableMode(unint64_t a1)
{
  if (a1 >= 3)
    return (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown (%ld)"), a1);
  else
    return off_24C23C718[a1];
}

const __CFString *W5DescriptionForAWDLScheduleState(uint64_t a1)
{
  const __CFString *result;
  int v3;

  v3 = a1;
  result = CFSTR("Discovery");
  switch(v3)
  {
    case 0:
      return result;
    case 1:
    case 2:
    case 6:
    case 7:
    case 8:
LABEL_10:
      result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown (%u)"), a1);
      break;
    case 3:
      result = CFSTR("Idle");
      break;
    case 4:
      result = CFSTR("Low Power");
      break;
    case 5:
      result = CFSTR("Data");
      break;
    case 9:
      result = CFSTR("RealTimeData");
      break;
    default:
      switch((int)a1)
      {
        case 24:
          result = CFSTR("Scan + Data");
          break;
        case 26:
          result = CFSTR("Scan + RealtimeData");
          break;
        case 28:
          result = CFSTR("Piggyback Scan + Data");
          break;
        case 29:
          result = CFSTR("Infra Priority");
          break;
        case 32:
          result = CFSTR("Forced");
          break;
        default:
          goto LABEL_10;
      }
      break;
  }
  return result;
}

__CFString *W5DescriptionForDiagnosticsState(unint64_t a1)
{
  if (a1 > 0xB)
    return 0;
  else
    return off_24C23C730[a1];
}

const __CFString *W5DescriptionForDiagnosticsRole(char a1)
{
  __CFString *v2;

  if ((a1 & 8) != 0)
    v2 = CFSTR("Controller");
  else
    v2 = &stru_24C23DB48;
  if ((a1 & 4) == 0)
  {
    if ((a1 & 1) == 0)
      goto LABEL_6;
LABEL_13:
    if (-[__CFString length](v2, "length"))
    {
      v2 = (__CFString *)-[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("/Primary"));
      if ((a1 & 2) != 0)
        goto LABEL_17;
    }
    else
    {
      v2 = CFSTR("Primary");
      if ((a1 & 2) != 0)
        goto LABEL_17;
    }
LABEL_7:
    if ((a1 & 0x10) == 0)
      return v2;
    goto LABEL_21;
  }
  if (-[__CFString length](v2, "length"))
  {
    v2 = (__CFString *)-[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("/Sniffer"));
    if ((a1 & 1) != 0)
      goto LABEL_13;
  }
  else
  {
    v2 = CFSTR("Sniffer");
    if ((a1 & 1) != 0)
      goto LABEL_13;
  }
LABEL_6:
  if ((a1 & 2) == 0)
    goto LABEL_7;
LABEL_17:
  if (-[__CFString length](v2, "length"))
  {
    v2 = (__CFString *)-[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("/Secondary"));
    if ((a1 & 0x10) == 0)
      return v2;
  }
  else
  {
    v2 = CFSTR("Secondary");
    if ((a1 & 0x10) == 0)
      return v2;
  }
LABEL_21:
  if (-[__CFString length](v2, "length"))
    return (const __CFString *)-[__CFString stringByAppendingString:](v2, "stringByAppendingString:", CFSTR("/RemoteListener"));
  return CFSTR("RemoteListener");
}

const __CFString *W5DescriptionForDiagnosticsFaultType(uint64_t a1)
{
  const __CFString *result;

  result = CFSTR("None");
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("Home Theather");
      break;
    case 2:
    case 6:
      result = CFSTR("Airplay Audio");
      break;
    case 3:
      result = CFSTR("Siri");
      break;
    case 4:
    case 5:
    case 7:
      goto LABEL_4;
    default:
      if (a1 == 0x7FFFFFFFFFFFFFFFLL)
LABEL_4:
        result = CFSTR("Unknown");
      else
        result = CFSTR("Unsupported");
      break;
  }
  return result;
}

__CFString *W5ExtendedDescriptionForDiagnosticsTestID(unint64_t a1)
{
  if (a1 >= 0x3F)
    return (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%li>"), a1);
  else
    return off_24C23C790[a1];
}

__CFString *W5DescriptionForIPv4ConfigMethod(unint64_t a1)
{
  if (a1 >= 8)
    return (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), a1);
  else
    return off_24C23C988[a1];
}

__CFString *W5DescriptionForIPv6ConfigMethod(unint64_t a1)
{
  if (a1 >= 6)
    return (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), a1);
  else
    return off_24C23C9C8[a1];
}

const __CFString *W5DescriptionForEventID(uint64_t a1)
{
  const __CFString *result;

  result = CFSTR("None");
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("WiFi Status Changed");
      break;
    case 2:
      result = CFSTR("AWDL Status Changed");
      break;
    case 3:
      result = CFSTR("Bluetooth Status Changed");
      break;
    case 4:
      result = CFSTR("Network Status Changed");
      break;
    case 5:
      result = CFSTR("Power Status Changed");
      break;
    case 6:
      result = CFSTR("Peer Updated");
      break;
    case 7:
      result = CFSTR("Upload Performance Test Updated");
      break;
    default:
      if (a1 == 38)
        result = CFSTR("Fault Detected");
      else
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), a1);
      break;
  }
  return result;
}

__CFString *W5DescriptionForLogItemID(unint64_t a1)
{
  if (a1 >= 0x5D)
    return (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%li>"), a1);
  else
    return off_24C23C9F8[a1];
}

id W5DescriptionForReachabilityFlags(int a1, uint64_t a2)
{
  void *v4;
  void *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  v5 = v4;
  if ((a1 & 1) != 0)
    v6 = "Yes";
  else
    v6 = "No";
  objc_msgSend(v4, "appendFormat:", CFSTR("%@TransientConnection: %s\n"), a2, v6);
  if ((a1 & 2) != 0)
    v7 = "Yes";
  else
    v7 = "No";
  objc_msgSend(v5, "appendFormat:", CFSTR("%@Reachable: %s\n"), a2, v7);
  if ((a1 & 4) != 0)
    v8 = "Yes";
  else
    v8 = "No";
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ConnectionRequired: %s\n"), a2, v8);
  if ((a1 & 8) != 0)
    v9 = "Yes";
  else
    v9 = "No";
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ConnectionOnTraffic: %s\n"), a2, v9);
  if ((a1 & 0x10) != 0)
    v10 = "Yes";
  else
    v10 = "No";
  objc_msgSend(v5, "appendFormat:", CFSTR("%@InterventionRequired: %s\n"), a2, v10);
  if ((a1 & 0x20) != 0)
    v11 = "Yes";
  else
    v11 = "No";
  objc_msgSend(v5, "appendFormat:", CFSTR("%@ConnectionOnDemand: %s\n"), a2, v11);
  if ((a1 & 0x10000) != 0)
    v12 = "Yes";
  else
    v12 = "No";
  objc_msgSend(v5, "appendFormat:", CFSTR("%@IsLocalAddress: %s\n"), a2, v12);
  if ((a1 & 0x20000) != 0)
    v13 = "Yes";
  else
    v13 = "No";
  objc_msgSend(v5, "appendFormat:", CFSTR("%@IsDirect: %s\n"), a2, v13);
  if ((a1 & 0x40000) != 0)
    v14 = "Yes";
  else
    v14 = "No";
  objc_msgSend(v5, "appendFormat:", CFSTR("%@IsWWAN: %s"), a2, v14);
  return (id)objc_msgSend(v5, "copy");
}

__CFString *W5DescriptionForDeviceType(unint64_t a1)
{
  __CFString *result;

  result = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%lu)"), a1);
  if (a1 <= 7)
    return off_24C23CCE0[a1];
  return result;
}

__CFString *W5DescriptionForPowerSourceType(unint64_t a1)
{
  if (a1 >= 4)
    return (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), a1);
  else
    return off_24C23CD20[a1];
}

__CFString *W5DescriptionForBatteryWarningLevel(unsigned int a1)
{
  if (a1 - 1 >= 3)
    return (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%ld)"), a1);
  else
    return off_24C23CD40[a1 - 1];
}

uint64_t W5DescriptionForPowerStateCaps()
{
  _BYTE v1[256];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  if (IOPMGetCapabilitiesDescription())
    return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v1);
  else
    return 0;
}

const __CFString *W5DescriptionForChannelWidth(void *a1)
{
  if ((objc_msgSend(a1, "flags") & 0x400) != 0)
    return CFSTR("80 MHz");
  if ((objc_msgSend(a1, "flags") & 4) != 0)
    return CFSTR("40 MHz");
  if ((objc_msgSend(a1, "flags") & 2) != 0)
    return CFSTR("20 MHz");
  return 0;
}

__CFString *W5DescriptionForEAPOLControlMode(uint64_t a1)
{
  if (a1 >= 4)
    return (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%d)"), a1);
  else
    return off_24C23CD58[(int)a1];
}

__CFString *W5DescriptionForEAPOLControlState(uint64_t a1)
{
  if (a1 >= 4)
    return (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%d)"), a1);
  else
    return off_24C23CD78[(int)a1];
}

__CFString *W5DescriptionForEAPOLSupplicantState(uint64_t a1)
{
  if (a1 >= 9)
    return (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (%d)"), a1);
  else
    return off_24C23CD98[(int)a1];
}

const __CFString *W5DescriptionForOpMode(uint64_t a1)
{
  if (!(_DWORD)a1)
    return CFSTR("None");
  if ((a1 & 0x10) != 0)
    return CFSTR("MONITOR");
  if ((a1 & 1) != 0)
    return CFSTR("STA");
  if ((a1 & 2) != 0)
    return CFSTR("IBSS");
  if ((a1 & 8) != 0)
    return CFSTR("HOSTAP");
  return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (0x%X)"), a1);
}

const __CFString *W5DescriptionForPHYMode(uint64_t a1)
{
  if (!(_DWORD)a1)
    return CFSTR("None");
  if ((a1 & 0x100) != 0)
    return CFSTR("11ax");
  if ((a1 & 0x80) != 0)
    return CFSTR("11ac");
  if ((a1 & 0x10) != 0)
    return CFSTR("11n");
  if ((a1 & 8) != 0)
    return CFSTR("11g");
  if ((a1 & 2) != 0)
    return CFSTR("11a");
  if ((a1 & 4) != 0)
    return CFSTR("11b");
  return (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("? (0x%X)"), a1);
}

id W5DescriptionForPower(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  unint64_t v4;
  void *v5;
  const __CFString *v6;
  unint64_t v7;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  if (a1)
  {
    v3 = *(_DWORD *)(a1 + 4);
    if (v3 >= 4)
      v3 = 4;
    if (v3)
    {
      v4 = 0;
      do
      {
        switch(*(_DWORD *)(a1 + 8 + 4 * v4))
        {
          case 0:
            v5 = v2;
            v6 = CFSTR("Off");
            goto LABEL_13;
          case 1:
            v5 = v2;
            v6 = CFSTR("On");
            goto LABEL_13;
          case 2:
            v5 = v2;
            v6 = CFSTR("Tx");
            goto LABEL_13;
          case 3:
            v5 = v2;
            v6 = CFSTR("Rx");
            goto LABEL_13;
          case 4:
            v5 = v2;
            v6 = CFSTR("Restricted");
LABEL_13:
            objc_msgSend(v5, "appendString:", v6);
            break;
          default:
            objc_msgSend(v2, "appendFormat:", CFSTR("%u"), *(unsigned int *)(a1 + 8 + 4 * v4));
            break;
        }
        LODWORD(v7) = *(_DWORD *)(a1 + 4);
        if (v4 < (v7 - 1))
        {
          objc_msgSend(v2, "appendFormat:", CFSTR(","));
          LODWORD(v7) = *(_DWORD *)(a1 + 4);
        }
        ++v4;
        if (v7 >= 4)
          v7 = 4;
        else
          v7 = v7;
      }
      while (v4 < v7);
    }
  }
  return (id)objc_msgSend(v2, "copy");
}

id W5DescriptionForChainAck(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  unint64_t i;
  int v5;
  void *v6;
  const __CFString *v7;
  unint64_t v8;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  if (a1)
  {
    v3 = *(_DWORD *)(a1 + 4);
    if (v3 >= 4)
      v3 = 4;
    if (v3)
    {
      for (i = 0; i < v8; ++i)
      {
        v5 = *(_DWORD *)(a1 + 8 + 4 * i);
        if (v5 == 1)
        {
          v6 = v2;
          v7 = CFSTR("On");
        }
        else
        {
          if (v5)
          {
            objc_msgSend(v2, "appendFormat:", CFSTR("%u"), *(unsigned int *)(a1 + 8 + 4 * i));
            goto LABEL_12;
          }
          v6 = v2;
          v7 = CFSTR("Off");
        }
        objc_msgSend(v6, "appendString:", v7);
LABEL_12:
        LODWORD(v8) = *(_DWORD *)(a1 + 4);
        if (i < (v8 - 1))
        {
          objc_msgSend(v2, "appendFormat:", CFSTR(","));
          LODWORD(v8) = *(_DWORD *)(a1 + 4);
        }
        if (v8 >= 4)
          v8 = 4;
        else
          v8 = v8;
      }
    }
  }
  return (id)objc_msgSend(v2, "copy");
}

__CFString *W5DescriptionForChainPowerState(uint64_t a1)
{
  if (a1 >= 3)
    return (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), a1);
  else
    return off_24C23CDE0[(int)a1];
}

id W5DescriptionForTxChainPower(unsigned int *a1, uint64_t a2)
{
  void *v4;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  objc_msgSend(v4, "appendFormat:", CFSTR("%@Current: %i\n"), a2, a1[2]);
  objc_msgSend(v4, "appendFormat:", CFSTR("%@Offset: %i\n"), a2, a1[1]);
  objc_msgSend(v4, "appendFormat:", CFSTR("%@Min: %i\n"), a2, a1[3]);
  objc_msgSend(v4, "appendFormat:", CFSTR("%@Max: %i\n"), a2, a1[4]);
  return (id)objc_msgSend(v4, "copy");
}

id W5DescriptionForDesense(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v8;
  uint64_t v9;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  v5 = v4;
  if (a1 && a2)
  {
    v6 = *(_DWORD *)(a1 + 4);
    if ((~v6 & 3) != 0)
    {
      if ((v6 & 1) != 0)
      {
        objc_msgSend(v4, "appendFormat:", CFSTR("2GHz[%i,%i] lvl %i"), *(__int16 *)(a1 + 8), *(__int16 *)(a1 + 10), *(unsigned int *)(a2 + 4), v8, v9);
      }
      else if ((v6 & 2) != 0)
      {
        objc_msgSend(v4, "appendFormat:", CFSTR("5GHz[%i,%i] lvl %i"), *(__int16 *)(a1 + 12), *(__int16 *)(a1 + 14), *(unsigned int *)(a2 + 4), v8, v9);
      }
      else
      {
        objc_msgSend(v4, "appendString:", CFSTR("None"));
      }
    }
    else
    {
      objc_msgSend(v4, "appendFormat:", CFSTR("2GHz[%i,%i] 5GHz[%i,%i] lvl %i"), *(__int16 *)(a1 + 8), *(__int16 *)(a1 + 10), *(__int16 *)(a1 + 12), *(__int16 *)(a1 + 14), *(unsigned int *)(a2 + 4));
    }
  }
  return (id)objc_msgSend(v5, "copy");
}

id W5DescriptionForDesenseFlags(int a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;
  const __CFString *v5;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  v3 = v2;
  v4 = CFSTR("5GHz");
  if ((a1 & 2) == 0)
    v4 = CFSTR("None");
  if ((a1 & 1) != 0)
    v4 = CFSTR("2GHz");
  if ((~a1 & 3) != 0)
    v5 = v4;
  else
    v5 = CFSTR("2GHz 5GHz");
  objc_msgSend(v2, "appendString:", v5);
  return (id)objc_msgSend(v3, "copy");
}

id W5DescriptionForBTCMode(uint64_t a1)
{
  void *v2;
  void *v3;
  const __CFString *v4;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  v3 = v2;
  switch((int)a1)
  {
    case 0:
      v4 = CFSTR("Off");
      goto LABEL_12;
    case 1:
      v4 = CFSTR("On");
      goto LABEL_12;
    case 2:
      v4 = CFSTR("Default");
      goto LABEL_12;
    case 3:
      v4 = CFSTR("Full TDM");
      goto LABEL_12;
    case 4:
      v4 = CFSTR("Full TDM Preempt");
      goto LABEL_12;
    case 5:
      v4 = CFSTR("Lightweight");
      goto LABEL_12;
    case 6:
      v4 = CFSTR("Unique Antennae");
      goto LABEL_12;
    case 7:
      v4 = CFSTR("Hybrid");
      goto LABEL_12;
    case 8:
      v4 = CFSTR("Hybrid (WLTX)");
LABEL_12:
      objc_msgSend(v2, "appendString:", v4);
      break;
    default:
      objc_msgSend(v2, "appendFormat:", CFSTR("? (%i)"), a1);
      break;
  }
  return (id)objc_msgSend(v3, "copy");
}

id W5DescriptionForBTCProfile(unsigned int *a1, uint64_t a2)
{
  void *v4;
  unint64_t v5;
  const char *v6;
  unsigned int v7;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unsigned int v13;

  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 0);
  objc_msgSend(v4, "appendFormat:", CFSTR("%@Mode: %@\n"), a2, W5DescriptionForBTCMode(*a1));
  objc_msgSend(v4, "appendFormat:", CFSTR("%@Desense: %@\n"), a2, W5DescriptionForDesenseFlags(a1[1]));
  objc_msgSend(v4, "appendFormat:", CFSTR("%@Desense Level: %i\n"), a2, a1[2]);
  objc_msgSend(v4, "appendFormat:", CFSTR("%@Desense Threshold: [%i,%i]\n"), a2, a1[4], a1[3]);
  objc_msgSend(v4, "appendFormat:", CFSTR("%@Chain Ack: ["), a2);
  if (a1[5])
  {
    v5 = 0;
    do
    {
      if (a1[v5 + 6] == 1)
        v6 = "On";
      else
        v6 = "Off";
      objc_msgSend(v4, "appendFormat:", CFSTR("%s"), v6);
      v7 = a1[5];
      if (v5 < v7 - 1)
      {
        objc_msgSend(v4, "appendString:", CFSTR(","));
        v7 = a1[5];
      }
      ++v5;
    }
    while (v5 < v7);
  }
  objc_msgSend(v4, "appendString:", CFSTR("]\n"));
  objc_msgSend(v4, "appendFormat:", CFSTR("%@Chain Tx Power Offset: ["), a2);
  if (a1[5])
  {
    v8 = 0;
    do
    {
      objc_msgSend(v4, "appendFormat:", CFSTR("%i"), a1[v8 + 10]);
      v9 = a1[5];
      if (v8 < v9 - 1)
      {
        objc_msgSend(v4, "appendString:", CFSTR(","));
        v9 = a1[5];
      }
      ++v8;
    }
    while (v8 < v9);
  }
  objc_msgSend(v4, "appendString:", CFSTR("]\n"));
  objc_msgSend(v4, "appendFormat:", CFSTR("%@WiFi RSSI Threshold / Hysteresis: %i/%i\n"), a2, a1[14], a1[15]);
  objc_msgSend(v4, "appendFormat:", CFSTR("%@BT RSSI Threshold / Hysteresis: %i/%i\n"), a2, a1[16], a1[17]);
  objc_msgSend(v4, "appendFormat:", CFSTR("%@SISO Resp Enable: ["), a2);
  if (a1[18])
  {
    v10 = 0;
    do
    {
      objc_msgSend(v4, "appendFormat:", CFSTR("%i"), a1[v10 + 19]);
      v11 = a1[18];
      if (v10 < v11 - 1)
      {
        objc_msgSend(v4, "appendString:", CFSTR(","));
        v11 = a1[18];
      }
      ++v10;
    }
    while (v10 < v11);
  }
  objc_msgSend(v4, "appendString:", CFSTR("]\n"));
  objc_msgSend(v4, "appendFormat:", CFSTR("%@Max SISO Resp Power: ["), a2);
  if (a1[18])
  {
    v12 = 0;
    do
    {
      objc_msgSend(v4, "appendFormat:", CFSTR("%i"), a1[v12 + 27]);
      v13 = a1[18];
      if (v12 < v13 - 1)
      {
        objc_msgSend(v4, "appendString:", CFSTR(","));
        v13 = a1[18];
      }
      ++v12;
    }
    while (v12 < v13);
  }
  objc_msgSend(v4, "appendString:", CFSTR("]\n"));
  return (id)objc_msgSend(v4, "copy");
}

uint64_t W5DescriptionForBluetoothDeviceType(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v10;

  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%lx"), a1);
  v5 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("0x%lx"), a2);
  switch(a1)
  {
    case 0:
      v6 = CFSTR("Misc");
      break;
    case 1:
      if (a2 < 7)
        v5 = off_24C23CDF8[a2];
      v6 = CFSTR("Computer");
      break;
    case 2:
      if (a2 < 6)
        v5 = off_24C23CE30[a2];
      v6 = CFSTR("Phone");
      break;
    case 3:
      v6 = CFSTR("Access Point");
      break;
    case 4:
      if (a2 < 0x13 && ((0x5FFF7u >> a2) & 1) != 0)
        v5 = off_24C23CE60[a2];
      v6 = CFSTR("Audio");
      break;
    case 5:
      v7 = (a2 & 0xF) - 1;
      if (v7 >= 9)
      {
        v10 = a2 & 0x30;
        v6 = CFSTR("Peripheral");
        switch(v10)
        {
          case 0x30uLL:
            v5 = CFSTR("Combo");
            break;
          case 0x20uLL:
            v5 = CFSTR("Mouse");
            break;
          case 0x10uLL:
            v5 = CFSTR("Keyboard");
            v6 = CFSTR("Peripheral");
            break;
        }
      }
      else
      {
        v5 = off_24C23CEF8[v7];
        v6 = CFSTR("Peripheral");
      }
      break;
    case 6:
      v8 = __ROR8__(a2, 2);
      if (v8 < 9 && ((0x117u >> v8) & 1) != 0)
        v5 = off_24C23CF40[v8];
      v6 = CFSTR("Imaging");
      break;
    case 7:
      if (a2 - 1 < 5)
        v5 = off_24C23CF88[a2 - 1];
      v6 = CFSTR("Wearable");
      break;
    case 8:
      if (a2 - 1 < 5)
        v5 = off_24C23CFB0[a2 - 1];
      v6 = CFSTR("Toy");
      break;
    case 9:
      if (a2 < 8)
        v5 = off_24C23CFD8[a2];
      v6 = CFSTR("Health");
      break;
    default:
      if (a1 == 31)
        v6 = CFSTR("Unclassified");
      else
        v6 = (const __CFString *)v4;
      break;
  }
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ - %@"), v6, v5);
}

const __CFString *W5DescriptionForBluetoothDeviceManufacturer(uint64_t a1)
{
  const __CFString *result;

  result = CFSTR("Ericsson");
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("Nokia");
      break;
    case 2:
      result = CFSTR("Intel");
      break;
    case 3:
      result = CFSTR("IBM");
      break;
    case 4:
      result = CFSTR("Toshiba");
      break;
    case 5:
      result = CFSTR("3Com");
      break;
    case 6:
      result = CFSTR("Microsoft");
      break;
    case 7:
      result = CFSTR("Lucent");
      break;
    case 8:
      result = CFSTR("Motorola");
      break;
    case 9:
      result = CFSTR("Infineon");
      break;
    case 10:
      result = CFSTR("Cambridge");
      break;
    case 11:
      result = CFSTR("Silicon Wave");
      break;
    case 12:
      result = CFSTR("Digianswer");
      break;
    case 13:
      result = CFSTR("Texas Instruments");
      break;
    case 14:
      result = CFSTR("Parthus");
      break;
    case 15:
      result = CFSTR("Broadcom");
      break;
    case 16:
      result = CFSTR("Mitel");
      break;
    case 17:
      result = CFSTR("Widcomm");
      break;
    case 18:
      result = CFSTR("Zeevo");
      break;
    case 19:
      result = CFSTR("Atmel");
      break;
    case 20:
      result = CFSTR("Mitsubishi");
      break;
    case 21:
      result = CFSTR("RXT Telecom");
      break;
    case 22:
      result = CFSTR("KC Technology");
      break;
    case 23:
      result = CFSTR("New Logic");
      break;
    case 24:
      result = CFSTR("Transilica");
      break;
    case 25:
      result = CFSTR("Rohde and Schwarz");
      break;
    case 26:
      result = CFSTR("TTPCom");
      break;
    case 27:
      result = CFSTR("Signia");
      break;
    case 28:
      result = CFSTR("Conexant");
      break;
    case 29:
      result = CFSTR("Qualcomm");
      break;
    case 30:
      result = CFSTR("Inventel");
      break;
    case 31:
      result = CFSTR("AVM Berlin");
      break;
    case 32:
      result = CFSTR("Bandspeed");
      break;
    case 33:
      result = CFSTR("Mansella");
      break;
    case 34:
      result = CFSTR("NEC");
      break;
    case 35:
      result = CFSTR("Wave Plus");
      break;
    case 36:
      result = CFSTR("Alcatel");
      break;
    case 37:
      result = CFSTR("Philips");
      break;
    case 38:
      result = CFSTR("CTechnologies");
      break;
    case 39:
      result = CFSTR("Open Interface");
      break;
    case 40:
      result = CFSTR("RFC Micro");
      break;
    case 41:
      result = CFSTR("Hitachi");
      break;
    case 42:
      result = CFSTR("Symbol");
      break;
    case 43:
      result = CFSTR("Tenovis");
      break;
    case 44:
      result = CFSTR("Macronix");
      break;
    case 45:
      result = CFSTR("GCT Semi");
      break;
    case 46:
      result = CFSTR("Norwood");
      break;
    case 47:
      result = CFSTR("MewTel");
      break;
    case 48:
      result = CFSTR("ST Micro");
      break;
    case 49:
      result = CFSTR("Synopsys");
      break;
    case 50:
      result = CFSTR("Red M Comms");
      break;
    case 51:
      result = CFSTR("Commil");
      break;
    case 52:
      result = CFSTR("CATC");
      break;
    case 53:
      result = CFSTR("Eclipse");
      break;
    case 54:
      result = CFSTR("Renesas");
      break;
    case 55:
      result = CFSTR("Mobilian");
      break;
    case 56:
      result = CFSTR("Terax");
      break;
    case 57:
      result = CFSTR("Integrated System Solution");
      break;
    case 58:
      result = CFSTR("Matsushita");
      break;
    case 59:
      result = CFSTR("Gennum");
      break;
    case 60:
      result = CFSTR("RIM");
      break;
    case 61:
      result = CFSTR("IPextreme");
      break;
    case 62:
      result = CFSTR("System and Chips");
      break;
    case 63:
      result = CFSTR("Bluetooth SIG");
      break;
    case 64:
      result = CFSTR("Seiko Epson");
      break;
    case 65:
      result = CFSTR("Integrated Silicon Solution");
      break;
    case 66:
      result = CFSTR("CONWISE");
      break;
    case 67:
      result = CFSTR("Parrot");
      break;
    case 68:
      result = CFSTR("Socket Comms");
      break;
    case 69:
      result = CFSTR("Atheros Comms");
      break;
    case 70:
      result = CFSTR("MediaTek");
      break;
    case 71:
      result = CFSTR("Bluegiga");
      break;
    case 72:
      result = CFSTR("Marvell");
      break;
    case 73:
      result = CFSTR("3DSP");
      break;
    case 74:
      result = CFSTR("Accel Semi");
      break;
    case 75:
      result = CFSTR("Continental Auto");
      break;
    case 76:
      result = CFSTR("Apple");
      break;
    case 77:
      result = CFSTR("Staccato");
      break;
    case 78:
      result = CFSTR("Avago");
      break;
    case 79:
      result = CFSTR("APT");
      break;
    case 80:
      result = CFSTR("SiRF");
      break;
    case 81:
      result = CFSTR("TZero");
      break;
    case 82:
      result = CFSTR("JandM");
      break;
    case 83:
      result = CFSTR("Free2Move");
      break;
    case 84:
      result = CFSTR("3DiJoy");
      break;
    case 85:
      result = CFSTR("Plantronics");
      break;
    case 86:
      result = CFSTR("Sony Ericsson");
      break;
    case 87:
      result = CFSTR("Harmon");
      break;
    case 88:
      result = CFSTR("Visio");
      break;
    case 89:
      result = CFSTR("Nordic");
      break;
    case 90:
      result = CFSTR("EMMicro");
      break;
    default:
      if (a1 == 0xFFFF)
        result = CFSTR("Interop ID");
      else
        result = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%ld>"), a1);
      break;
  }
  return result;
}

__CFString *W5DescriptionForBluetoothDeviceRole(unint64_t a1)
{
  if (a1 >= 5)
    return (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%ld>"), a1);
  else
    return off_24C23D018[a1];
}

__CFString *W5DescriptionForBluetoothDeviceConnectionMode(unint64_t a1)
{
  if (a1 >= 5)
    return (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%ld>"), a1);
  else
    return off_24C23D040[a1];
}

__CFString *W5DescriptionForWiFiDropReason(unint64_t a1)
{
  if (a1 >= 7)
    return (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%ld>"), a1);
  else
    return off_24C23D068[a1];
}

id W5DescriptionForFaultsStatus(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (a1 && objc_msgSend(a1, "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(a1);
          v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          objc_msgSend(v2, "appendFormat:", CFSTR("    Fault                : %s\n"), objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("type")), "UTF8String"));
          objc_msgSend(v2, "appendFormat:", CFSTR("%@"), __printDictionaryContents(v7, objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("date"), CFSTR("interface"), 0), 0));
        }
        v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v4);
    }
  }
  else
  {
    objc_msgSend(v2, "appendFormat:", CFSTR("    None\n"));
  }
  return (id)objc_msgSend(v2, "copy");
}

id __printDictionaryContents(void *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  const __CFString *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  unsigned int v23;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (qword_253D89D70 != -1)
    dispatch_once(&qword_253D89D70, &__block_literal_global_1768);
  v6 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v7 = (void *)objc_msgSend(a1, "allKeys");
  v8 = objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  if (objc_msgSend(v7, "containsObject:", CFSTR("date")))
  {
    v9 = (id)objc_msgSend(MEMORY[0x24BDBCEE0], "orderedSetWithObject:", CFSTR("date"));
    v10 = v9;
  }
  else
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  }
  objc_msgSend(v9, "addObjectsFromArray:", v8);
  if (a2)
    objc_msgSend(v9, "intersectSet:", a2);
  if (a3)
    objc_msgSend(v9, "minusSet:", a3);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = CFSTR("date");
    v14 = *(_QWORD *)v30;
    v27 = *(_QWORD *)v30;
    do
    {
      v15 = 0;
      v28 = v12;
      do
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v15);
        v17 = (void *)objc_msgSend(a1, "valueForKey:", v16);
        if (objc_msgSend(v16, "containsString:", v13))
        {
          objc_msgSend(v17, "timeIntervalSinceNow");
          objc_msgSend(v6, "appendFormat:", CFSTR("    |> Age               : %02ld:%02ld:%02ld HH:MM:SS Ago\n"), (unint64_t)-v18 / 0xE10, (unint64_t)-v18 % 0xE10 / 0x3C, (unint64_t)-v18 % 0xE10 % 0x3C);
          v16 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), objc_msgSend((id)qword_253D89D68, "stringFromDate:", v17));
          v19 = CFSTR("    |> Date              : %s\n");
LABEL_25:
          objc_msgSend(v6, "appendFormat:", v19, objc_msgSend(v16, "UTF8String"));
          goto LABEL_26;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v20 = v13;
          v21 = a1;
          v22 = v9;
          objc_msgSend(v6, "appendFormat:", CFSTR("    |> %s"), objc_msgSend(v16, "UTF8String"));
          if ((unint64_t)objc_msgSend(v16, "length") <= 0x11)
          {
            if (objc_msgSend(v16, "length") != 18)
            {
              v23 = 1;
              do
                objc_msgSend(v6, "appendFormat:", CFSTR(" "));
              while (18 - objc_msgSend(v16, "length") > (unint64_t)v23++);
            }
          }
          else
          {
            objc_msgSend(v6, "appendFormat:", CFSTR(" "));
          }
          v16 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v17);
          v19 = CFSTR(": %s\n");
          v9 = v22;
          a1 = v21;
          v13 = v20;
          v14 = v27;
          v12 = v28;
          goto LABEL_25;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = CFSTR("    |> %s (NSDictionary not followed)");
          goto LABEL_25;
        }
        objc_opt_class();
        v19 = CFSTR("    |> %s (NSArray not followed)");
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_25;
LABEL_26:
        ++v15;
      }
      while (v15 != v12);
      v25 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      v12 = v25;
    }
    while (v25);
  }

  return (id)objc_msgSend(v6, "copy");
}

id W5DescriptionForLinkTestsStatus(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (a1 && objc_msgSend(a1, "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(a1);
          v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          objc_msgSend(v2, "appendFormat:", CFSTR("    Reason               : %s\n"), objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("initiatingReason")), "UTF8String"));
          objc_msgSend(v2, "appendFormat:", CFSTR("%@"), __printDictionaryContents(v7, 0, objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("initiatingReason"), 0)));
        }
        v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v4);
    }
  }
  else
  {
    objc_msgSend(v2, "appendFormat:", CFSTR("    None\n"));
  }
  return (id)objc_msgSend(v2, "copy");
}

id W5DescriptionForRecoveriesStatus(void *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  if (a1 && objc_msgSend(a1, "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(a1);
          v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
          objc_msgSend(v2, "appendFormat:", CFSTR("    Reason               : %s\n"), objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("recoveryReason")), "UTF8String"));
          objc_msgSend(v2, "appendFormat:", CFSTR("%@"), __printDictionaryContents(v7, 0, objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("recoveryReason"), 0)));
        }
        v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v4);
    }
  }
  else
  {
    objc_msgSend(v2, "appendFormat:", CFSTR("    None\n"));
  }
  return (id)objc_msgSend(v2, "copy");
}

id __printBTCProfile(unsigned int *a1)
{
  void *v2;
  unint64_t v3;
  const char *v4;
  unsigned int v5;
  unint64_t v6;
  unsigned int v7;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  unsigned int v11;

  v2 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  objc_msgSend(v2, "appendFormat:", CFSTR("      Mode                      : %s\n"), objc_msgSend(W5DescriptionForBTCMode(*a1), "UTF8String"));
  objc_msgSend(v2, "appendFormat:", CFSTR("      Desense                   : %s\n"), objc_msgSend(W5DescriptionForDesenseFlags(a1[1]), "UTF8String"));
  objc_msgSend(v2, "appendFormat:", CFSTR("      Desense Lvl               : %i\n"), a1[2]);
  objc_msgSend(v2, "appendFormat:", CFSTR("      Desense Thr               : [%i,%i]\n"), a1[4], a1[3]);
  objc_msgSend(v2, "appendFormat:", CFSTR("      Chain Ack                 : ["));
  if (a1[5])
  {
    v3 = 0;
    do
    {
      if (a1[v3 + 6] == 1)
        v4 = "On";
      else
        v4 = "Off";
      objc_msgSend(v2, "appendFormat:", CFSTR("%s"), v4);
      v5 = a1[5];
      if (v3 < v5 - 1)
      {
        objc_msgSend(v2, "appendFormat:", CFSTR(","));
        v5 = a1[5];
      }
      ++v3;
    }
    while (v3 < v5);
  }
  objc_msgSend(v2, "appendFormat:", CFSTR("]\n"));
  objc_msgSend(v2, "appendFormat:", CFSTR("      Chain Tx Power Offset     : ["));
  if (a1[5])
  {
    v6 = 0;
    do
    {
      objc_msgSend(v2, "appendFormat:", CFSTR("%i"), a1[v6 + 10]);
      v7 = a1[5];
      if (v6 < v7 - 1)
      {
        objc_msgSend(v2, "appendFormat:", CFSTR(","));
        v7 = a1[5];
      }
      ++v6;
    }
    while (v6 < v7);
  }
  objc_msgSend(v2, "appendFormat:", CFSTR("]\n"));
  objc_msgSend(v2, "appendFormat:", CFSTR("      WiFi RSSI Thresh / Hyst   : %i/%i\n"), a1[14], a1[15]);
  objc_msgSend(v2, "appendFormat:", CFSTR("      BT RSSI Thresh / Hyst     : %i/%i\n"), a1[16], a1[17]);
  objc_msgSend(v2, "appendFormat:", CFSTR("      SISO Resp Enable          : ["));
  if (a1[18])
  {
    v8 = 0;
    do
    {
      objc_msgSend(v2, "appendFormat:", CFSTR("%i"), a1[v8 + 19]);
      v9 = a1[18];
      if (v8 < v9 - 1)
      {
        objc_msgSend(v2, "appendFormat:", CFSTR(","));
        v9 = a1[18];
      }
      ++v8;
    }
    while (v8 < v9);
  }
  objc_msgSend(v2, "appendFormat:", CFSTR("]\n"));
  objc_msgSend(v2, "appendFormat:", CFSTR("      Max SISO Resp Power       : ["));
  if (a1[18])
  {
    v10 = 0;
    do
    {
      objc_msgSend(v2, "appendFormat:", CFSTR("%i"), a1[v10 + 27]);
      v11 = a1[18];
      if (v10 < v11 - 1)
      {
        objc_msgSend(v2, "appendFormat:", CFSTR(","));
        v11 = a1[18];
      }
      ++v10;
    }
    while (v10 < v11);
  }
  objc_msgSend(v2, "appendFormat:", CFSTR("]\n"));
  return (id)objc_msgSend(v2, "copy");
}

uint64_t ____printDictionaryContents_block_invoke()
{
  qword_253D89D68 = (uint64_t)objc_alloc_init(MEMORY[0x24BDD1500]);
  return objc_msgSend((id)qword_253D89D68, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd HH:mm:ss.SSS"));
}

void sub_209C598C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_209C59EDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_209C5ADB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_209C5B228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209C5B9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_209C5C074(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_209C5C314(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_209C5F794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_209C602EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_209C612A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_209C619DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_209C62064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209C630B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_209C633D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209C63604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_209C637C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

uint64_t IOPMGetCapabilitiesDescription()
{
  return MEMORY[0x24BDD8788]();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

uint64_t archive_entry_copy_stat()
{
  return MEMORY[0x24BEDA2F0]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x24BEDA320]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x24BEDA350]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x24BEDA3C8]();
}

uint64_t archive_entry_set_perm()
{
  return MEMORY[0x24BEDA3D8]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x24BEDA430]();
}

uint64_t archive_write_add_filter_gzip()
{
  return MEMORY[0x24BEDA578]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x24BEDA588]();
}

uint64_t archive_write_free()
{
  return MEMORY[0x24BEDA5C0]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x24BEDA5C8]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x24BEDA5D0]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x24BEDA5F0]();
}

uint64_t archive_write_set_format_pax()
{
  return MEMORY[0x24BEDA648]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void *__cdecl dispatch_get_context(dispatch_object_t object)
{
  return (void *)MEMORY[0x24BDADD98](object);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x24BDADDB0](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x24BDADEE0](queue);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x24BDADF40](object, context);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x24BDAE978](*(_QWORD *)&a1, *(_QWORD *)&a2);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

int openpty(int *a1, int *a2, char *a3, termios *a4, winsize *a5)
{
  return MEMORY[0x24BDAF268](a1, a2, a3, a4, a5);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

uint64_t os_transaction_get_description()
{
  return MEMORY[0x24BDAF440]();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

uint64_t xpc_transaction_try_exit_clean()
{
  return MEMORY[0x24BDB0BC8]();
}

