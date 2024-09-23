void sub_1A4D23274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __initR3_block_invoke()
{
  passwd *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];

  qword_1ECFF4504 = 0;
  v0 = getpwnam("mobile");
  if (v0)
  {
    qword_1ECFF4504 = *(_QWORD *)&v0->pw_uid;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v0->pw_dir);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("/Library/Logs/AppleSupport/"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)unk_1ECFF4510;
    unk_1ECFF4510 = v2;

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR unable to intialize data", v9, 2u);
  }
  endpwent();
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buildVersion");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)qword_1ECFF4518;
  qword_1ECFF4518 = v5;

  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E4DFEF00);
  v8 = (void *)qword_1ECFF4520;
  qword_1ECFF4520 = v7;

}

uint64_t openR3(uint64_t a1, int a2, double a3)
{
  void *v4;
  id v7;
  std::__fs::filesystem::path *v8;
  mode_t v9;
  uint64_t R3;
  int v11;
  uint64_t v12;
  ssize_t v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const std::__fs::filesystem::path *v21;
  std::error_code *v22;
  int v23;
  int v24;
  int *v25;
  char *v26;
  int v27;
  int *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  unsigned int v39;
  stat v40;
  uint8_t buf[4];
  _BYTE v42[14];
  _OWORD value[4];
  stat v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 16);
  if (v4)
  {
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("general.log"));
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (std::__fs::filesystem::path *)objc_msgSend(v7, "fileSystemRepresentation");
    memset(&v40, 0, sizeof(v40));
    v9 = umask(0);
    if (lstat((const char *)v8, &v40) < 0)
    {
      if (*__error() == 2)
      {
        R3 = createR3(a1, (char *)v8, a3, a3);
LABEL_30:
        umask(v9);

        return R3;
      }
    }
    else
    {
      R3 = 0xFFFFFFFFLL;
      if ((v40.st_mode & 0xF000) != 0x8000 || v40.st_nlink != 1 || v40.st_uid != *(_DWORD *)(a1 + 4))
        goto LABEL_30;
      v11 = v40.st_uid ? 384 : 420;
      if ((v40.st_mode & 0xFFF) != v11)
        goto LABEL_30;
      v12 = open((const char *)v8, 42);
      R3 = v12;
      if ((v12 & 0x80000000) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v27 = *__error();
          v28 = __error();
          v29 = strerror(*v28);
          v44.st_dev = 67109634;
          *(_DWORD *)&v44.st_mode = v27;
          LOWORD(v44.st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&v44.st_ino + 2) = (__darwin_ino64_t)v8;
          HIWORD(v44.st_uid) = 2080;
          *(_QWORD *)&v44.st_gid = v29;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR[%d] opening %s, %s", (uint8_t *)&v44, 0x1Cu);
        }
        goto LABEL_30;
      }
      memset(&v44, 0, sizeof(v44));
      if (!fstat(v12, &v44)
        || v44.st_nlink != v40.st_nlink
        || v44.st_uid != v40.st_uid
        || v44.st_mode != v40.st_mode
        || v44.st_ino != v40.st_ino
        || v44.st_dev != v40.st_dev)
      {
        value[0] = *(_OWORD *)"<legacy>";
        memset(&value[1], 0, 48);
        v39 = 0;
        v37 = a3;
        v38 = a3;
        v13 = fgetxattr(R3, "Version", value, 0x3FuLL, 0, 0);
        if (v13 >= 1)
          *((_BYTE *)value + v13) = 0;
        v14 = *(void **)(a1 + 24);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", value);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v14) = objc_msgSend(v14, "isEqualToString:", v15);

        fgetxattr(R3, "Day_Seq", &v39, 4uLL, 0, 0);
        fgetxattr(R3, "Install", &v38, 8uLL, 0, 0);
        if (!(_DWORD)v14 || (fgetxattr(R3, "Upgrade", &v37, 8uLL, 0, 0), v39 != *(_DWORD *)a1))
        {
          close(R3);
          v17 = *(void **)(a1 + 16);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("general-%d-%s.log"), v39, value);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringByAppendingPathComponent:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v42 = v19;
            _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: rolling log -> %@", buf, 0xCu);
          }
          v20 = objc_retainAutorelease(v19);
          v21 = (const std::__fs::filesystem::path *)objc_msgSend(v20, "fileSystemRepresentation");
          rename(v8, v21, v22);
          if (v23)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              v24 = *__error();
              v25 = __error();
              v26 = strerror(*v25);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v42 = v24;
              *(_WORD *)&v42[4] = 2080;
              *(_QWORD *)&v42[6] = v26;
              _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR[%d] rename failed, %s", buf, 0x12u);
            }
            unlink((const char *)v8);
          }
          R3 = createR3(a1, (char *)v8, v38, v37);

          goto LABEL_30;
        }
        if (!a2 || v44.st_size <= 307200)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            openR3_cold_1((uint64_t)v8, v30, v31, v32, v33, v34, v35, v36);
          goto LABEL_30;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "AppleCareSupport: WARN: limit exceeded, ignoring event", buf, 2u);
        }
      }
      close(R3);
    }
    R3 = 0xFFFFFFFFLL;
    goto LABEL_30;
  }
  return 0xFFFFFFFFLL;
}

void logForAppleCare(void *a1, double a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a1;
  v4 = (void *)MEMORY[0x1A85A7FC8]();
  if (objc_msgSend(v3, "count"))
  {
    initR3();
    v5 = (void *)qword_1ECFF4520;
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = openR3((uint64_t)&initR3_r3, objc_msgSend(v5, "containsObject:", v6), a2);

    if ((v7 & 0x80000000) == 0)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      OSADateFormat(0, a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%@,%@\n"), v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "dataUsingEncoding:allowLossyConversion:", 4, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = objc_retainAutorelease(v12);
        write(v7, (const void *)objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"));
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          logForAppleCare_cold_1(v3);
      }

    }
    close(v7);
  }
  objc_autoreleasePoolPop(v4);

}

uint64_t OSASafeOpenReadOnly(uint64_t a1, void *a2)
{
  return OSASafeOpen(a1, 0, 0, a2);
}

uint64_t OSASafeOpen(uint64_t a1, int a2, unsigned int a3, void *a4)
{
  void (**v7)(id, _QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[16];
  stat v29;

  v7 = a4;
  if (a1)
  {
    v8 = open((const char *)a1, a2 | 0x20000000, a3);
    if ((v8 & 0x80000000) == 0)
    {
      v9 = v8;
      memset(&v29, 0, sizeof(v29));
      if (fstat(v8, &v29))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          OSASafeOpen_cold_2(a1, v10, v11, v12, v13, v14, v15, v16);
      }
      else
      {
        v17 = v29.st_mode & 0xF000;
        v19 = v17 == 0x8000 && v29.st_nlink == 1;
        if (v17 == 0x4000 || v19)
        {
          if (v7)
          {
            v7[2](v7, v9);
            a1 = 1;
            goto LABEL_22;
          }
          a1 = 0;
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_22;
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Path was safe to open, but no block was provided", buf, 2u);
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          OSASafeOpen_cold_1(a1, v20, v21, v22, v23, v24, v25, v26);
        }
      }
      a1 = 0;
LABEL_22:
      close(v9);
      goto LABEL_23;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      OSASafeOpen_cold_3(a1);
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29.st_dev) = 0;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Skipping safe open because no path was provided", (uint8_t *)&v29, 2u);
LABEL_10:
    a1 = 0;
  }
LABEL_23:

  return a1;
}

BOOL OSASetOwnership(int a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  int v9;
  id v10;
  int v11;
  uid_t v12;
  gid_t v13;
  id v14;
  _BOOL8 v15;

  v7 = a3;
  v8 = a4;
  if (v7 && (v9 = *(_DWORD *)(a2 + 16), v9 != objc_msgSend(v7, "unsignedIntValue")))
  {
    v10 = v7;
    if (!v8)
      goto LABEL_7;
  }
  else
  {
    v10 = 0;
    if (!v8)
      goto LABEL_7;
  }
  v11 = *(_DWORD *)(a2 + 20);
  if (v11 != objc_msgSend(v8, "unsignedIntValue"))
  {
    v14 = v8;
    if (v10)
      v12 = objc_msgSend(v10, "unsignedIntValue");
    else
      v12 = -1;
    v13 = objc_msgSend(v14, "unsignedIntValue");

    goto LABEL_14;
  }
LABEL_7:
  if (v10)
  {
    v12 = objc_msgSend(v10, "unsignedIntValue");
    v13 = -1;
LABEL_14:
    v15 = fchown(a1, v12, v13) == 0;
    goto LABEL_15;
  }
  v15 = 1;
LABEL_15:

  return v15;
}

id getVolumes(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;
  statfs *v9;

  v2 = (void *)objc_opt_new();
  v9 = 0;
  v3 = getmntinfo(&v9, 2);
  if (v3 >= 1)
  {
    v4 = v3;
    v5 = 1112;
    do
    {
      if (((*((_BYTE *)v9 + v5 - 1047) & 0x10) == 0) != (_DWORD)a1)
      {
        v6 = *((_BYTE *)&v9->f_bsize + v5);
        *((_BYTE *)&v9->f_bsize + v5) = 0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", (char *)v9 + v5 - 1024);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *((_BYTE *)&v9->f_bsize + v5) = v6;
        if ((unint64_t)objc_msgSend(v7, "length") >= 2)
          objc_msgSend(v2, "addObject:", v7);

      }
      v5 += 2168;
      --v4;
    }
    while (v4);
  }
  objc_msgSend(v2, "sortUsingComparator:", &__block_literal_global_75);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    getVolumes_cold_1(a1, v2);
  return v2;
}

void sub_1A4D26E34(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A4D27428(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

id ns2xpc(void *a1)
{
  id v1;
  xpc_object_t v2;
  id v3;
  double v4;
  xpc_object_t v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  const char *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(v1), "UTF8String"));
LABEL_9:
    v5 = v2;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = xpc_int64_create(objc_msgSend(v1, "longLongValue"));
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_retainAutorelease(v1);
    v2 = xpc_data_create((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"));
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "timeIntervalSince1970");
    v2 = xpc_date_create((uint64_t)(v4 * 1000000000.0));
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    v7 = v1;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v27 != v10)
            objc_enumerationMutation(v7);
          v12 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i));
          v13 = (const char *)objc_msgSend(v12, "UTF8String");
          objc_msgSend(v7, "objectForKeyedSubscript:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          ns2xpc(v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          xpc_dictionary_set_value(v5, v13, v15);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      }
      while (v9);
    }
LABEL_28:

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = xpc_array_create(0, 0);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = v1;
    v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v7);
          ns2xpc(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          xpc_array_append_value(v5, v20);

        }
        v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
      }
      while (v17);
    }
    goto LABEL_28;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = (id)objc_opt_class();
    v21 = v31;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "ns2xpc: unrecognized class: %@", buf, 0xCu);

  }
  v5 = 0;
LABEL_10:

  return v5;
}

uint64_t __xpc2ns_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;

  xpc2ns(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  return 1;
}

id xpc2ns(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  size_t length;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD applier[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = MEMORY[0x1A85A8658]();
  if (v2 == MEMORY[0x1E0C81390])
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_string_get_string_ptr(v1));
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_15:
    v4 = (id)v5;
    goto LABEL_16;
  }
  v3 = v2;
  if (v2 == MEMORY[0x1E0C81328])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_int64_get_value(v1));
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v2 == MEMORY[0x1E0C812E8])
  {
    length = xpc_data_get_length(v1);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", xpc_data_get_bytes_ptr(v1), length);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v2 == MEMORY[0x1E0C812F0])
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)(xpc_date_get_value(v1) / 0x3B9ACA00uLL));
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v2 == MEMORY[0x1E0C812F8])
  {
    v8 = (void *)objc_opt_new();
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __xpc2ns_block_invoke;
    applier[3] = &unk_1E4DEE970;
    v4 = v8;
    v14 = v4;
    xpc_dictionary_apply(v1, applier);
    v9 = v14;
LABEL_19:

    goto LABEL_16;
  }
  if (v2 == MEMORY[0x1E0C812C8])
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", xpc_array_get_count(v1));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __xpc2ns_block_invoke_2;
    v11[3] = &unk_1E4DEE998;
    v4 = v10;
    v12 = v4;
    xpc_array_apply(v1, v11);
    v9 = v12;
    goto LABEL_19;
  }
  if (v2 == MEMORY[0x1E0C81320])
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = v3;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "xpc2ns: unrecognized type: %p", buf, 0xCu);
  }
  v4 = 0;
LABEL_16:

  return v4;
}

id OSASanitizePath(void *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t i;
  __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  int v24;
  int v25;
  char v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  id v43;
  int v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id obj;
  int v56;
  uint64_t v57;
  void (**v58)(_QWORD, _QWORD);
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD block[4];
  id v66;
  uint64_t *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  uint8_t v81[128];
  uint8_t buf[4];
  int v83;
  __int16 v84;
  id v85;
  __int16 v86;
  int v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  int v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v53 = a1;
  v3 = a2;
  if (OSASanitizePath_onceToken != -1)
    dispatch_once(&OSASanitizePath_onceToken, &__block_literal_global_3);
  v52 = v3;
  v54 = (id)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  if (!objc_msgSend(v53, "length"))
  {
    v37 = 0;
    goto LABEL_57;
  }
  v75 = 0;
  v76 = &v75;
  v77 = 0x3032000000;
  v78 = __Block_byref_object_copy__3;
  v79 = __Block_byref_object_dispose__3;
  v80 = v53;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__3;
  v73 = __Block_byref_object_dispose__3;
  v74 = 0;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("debug_block"));
  v58 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v4 = OSASanitizePath_domain_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __OSASanitizePath_block_invoke_33;
  block[3] = &unk_1E4DEDD98;
  v67 = &v75;
  v68 = &v69;
  v47 = v52;
  v66 = v47;
  dispatch_sync(v4, block);
  objc_msgSend((id)OSASanitizePath_domainInfos, "objectForKeyedSubscript:", v70[5]);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v76[5], "lastPathComponent");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v76[5], "stringByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("/"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = (void *)objc_opt_new();
  objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("MSK"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (v50)
    objc_msgSend(v59, "addObject:", v50);
  if (v58)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = v70[5];
    objc_msgSend(v59, "componentsJoinedByString:", CFSTR("/"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("  domain %@ => [%@]"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v58)[2](v58, v10);

  }
  getRuleForSpecifier((void *)v70[5]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  getRules(0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = shouldMaskFile(v12, 1);
  v48 = v12;
  getBundleTypes(v12, 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C81028];
  v14 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v42 = objc_msgSend(v6, "count");
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR("+"));
    v43 = (id)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v59, "count");
    objc_msgSend(v59, "componentsJoinedByString:", CFSTR("+"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110146;
    v83 = v42;
    v84 = 2112;
    v85 = v43;
    v86 = 1024;
    v87 = v44;
    v88 = 2112;
    v89 = v45;
    v90 = 1024;
    v91 = v56;
    _os_log_debug_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "parts %d (%@), new_parts %d (%@) mask %d", buf, 0x28u);

  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v6;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
  if (v15)
  {
    v57 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v62 != v57)
          objc_enumerationMutation(obj);
        v17 = *(__CFString **)(*((_QWORD *)&v61 + 1) + 8 * i);
        if (-[__CFString length](v17, "length"))
        {
          if (v11)
          {
            LOBYTE(v56) = shouldMaskFile(v11, v56 & 1);
            getBundleTypes(v11, v60);
            v18 = objc_claimAutoreleasedReturnValue();

            v60 = (void *)v18;
          }
          -[__CFString pathExtension](v17, "pathExtension");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "length")
            && (objc_msgSend(v60, "objectForKeyedSubscript:", v19),
                v20 = (void *)objc_claimAutoreleasedReturnValue(),
                (v21 = v20) != 0))
          {
            getRuleForSpecifier(v20);
            v22 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundle(%@)"), v19);
            v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v24 = 0;
          }
          else
          {
            v25 = objc_msgSend(v54, "containsObject:", v17);
            if (v11)
              v26 = v25;
            else
              v26 = 1;
            if (v25)
              v23 = CFSTR("keep       ");
            else
              v23 = CFSTR("none       ");
            if ((v26 & 1) != 0)
            {
              v22 = 0;
              v24 = v25 ^ 1;
            }
            else
            {
              getSubruleForSpecifier(v11, (uint64_t)v17);
              v22 = objc_claimAutoreleasedReturnValue();
              if (v22)
              {
                v24 = 0;
                v23 = CFSTR("explicit   ");
              }
              else
              {
                getSubruleForSpecifier(v11, (uint64_t)CFSTR("@mask"));
                v22 = objc_claimAutoreleasedReturnValue();
                if (v22)
                {
                  v24 = 1;
                  v23 = CFSTR("mask       ");
                }
                else
                {
                  getSubruleForSpecifier(v11, (uint64_t)CFSTR("@keep"));
                  v22 = objc_claimAutoreleasedReturnValue();
                  if (v22)
                  {
                    v24 = 0;
                    v23 = CFSTR("keep       ");
                  }
                  else
                  {
                    v24 = 1;
                    v23 = CFSTR("none       ");
                  }
                }
              }
            }
          }
          if (v58)
          {
            v27 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v59, "componentsJoinedByString:", CFSTR("/"));
            v28 = objc_claimAutoreleasedReturnValue();
            v29 = (void *)v28;
            v30 = &stru_1E4DEECB8;
            if (v24)
              v30 = CFSTR(" -> *");
            objc_msgSend(v27, "stringWithFormat:", CFSTR("    rule <%@> => %@[%@%@]"), v23, v28, v17, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *))v58)[2](v58, v31);

          }
          if (v24)
            v32 = CFSTR("*");
          else
            v32 = v17;
          objc_msgSend(v59, "addPart:", v32);

          v11 = (void *)v22;
        }
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
    }
    while (v15);
  }

  if (objc_msgSend(v51, "length"))
  {
    objc_msgSend(v47, "objectForKeyedSubscript:", OSASanitizeOptionKeepFilename);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v33, "BOOLValue") & 1) == 0)
    {
      if ((v56 & 1) != 0)
      {
        v35 = v51;
        objc_msgSend(v35, "pathExtension");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("*"), "stringByAppendingPathExtension:", v39);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v58)
          goto LABEL_53;
        v40 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v59, "componentsJoinedByString:", CFSTR("/"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringWithFormat:", CFSTR("    last <masking    > => %@[%@ -> %@]"), v36, v35, v51);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v58)[2](v58, v41);

      }
      else
      {
        if (!v58)
          goto LABEL_54;
        v46 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v59, "componentsJoinedByString:", CFSTR("/"));
        v35 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringWithFormat:", CFSTR("    last <keeping    > => %@[%@]"), v35, v51);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v58)[2](v58, v36);
      }
    }
    else
    {
      if (!v58)
      {
LABEL_54:
        objc_msgSend(v59, "addPart:", v51);

        goto LABEL_55;
      }
      v34 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v59, "componentsJoinedByString:", CFSTR("/"));
      v35 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", CFSTR("    last <option-keep> => %@[%@]"), v35, v51);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v58)[2](v58, v36);
    }

LABEL_53:
    goto LABEL_54;
  }
LABEL_55:
  objc_msgSend(v59, "componentsJoinedByString:", CFSTR("/"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);

LABEL_57:
  return v37;
}

void sub_1A4D28858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

uint64_t __getVolumes_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "length");
  if (v6 <= objc_msgSend(v5, "length"))
  {
    v8 = objc_msgSend(v4, "length");
    v7 = v8 != objc_msgSend(v5, "length");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

uint64_t shouldMaskFile(void *a1, uint64_t a2)
{
  void *v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("@files"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    a2 = objc_msgSend(v3, "BOOLValue") ^ 1;

  return a2;
}

id getRuleForSpecifier(void *a1)
{
  id v1;
  unsigned int v2;
  uint64_t v3;
  void *v4;
  id v5;

  v1 = a1;
  if (v1)
  {
    v2 = 0;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        break;
      if (v2 > 0x1F)
        break;
      ++v2;
      getRules(v1);
      v3 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v3;
    }
    while (v3);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v1;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

id getRules(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if (getRules_onceToken != -1)
    dispatch_once(&getRules_onceToken, &__block_literal_global_77);
  if (v1)
  {
    objc_msgSend((id)getRules_rules, "objectForKeyedSubscript:", v1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (id)getRules_rules;
  }
  v3 = v2;

  return v3;
}

id getBundleTypes(void *a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;

  v3 = a2;
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("@bundles"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v6 = v4, (isKindOfClass & 1) == 0))
    v6 = v3;
  v7 = v6;

  return v7;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t OSAIsDebugEnabledForRSD()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addSuiteNamed:", CFSTR("com.apple.osanalytics"));
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "appleInternal"))
    v2 = objc_msgSend(v0, "BOOLForKey:", CFSTR("enableDebugProxySync"));
  else
    v2 = 0;

  return v2;
}

void sub_1A4D29B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

void sub_1A4D2B834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *OSADateFormat(unsigned int a1, double a2)
{
  double v4;
  tm *v5;
  uint64_t v6;
  const char *v7;
  uint8_t *v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  uint32_t v13;
  __CFString *v14;
  time_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  time_t v20;
  __int16 v21;
  int v22;
  uint8_t buf[4];
  time_t v24;
  char v25[72];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if ((a1 & 0x80000000) != 0 || a1 > 7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = a1;
      v10 = MEMORY[0x1E0C81028];
      v11 = "unrecognized date format %d";
      v12 = buf;
      v13 = 8;
LABEL_10:
      _os_log_impl(&dword_1A4D21000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, v13);
    }
  }
  else
  {
    v4 = (double)(uint64_t)floor(a2);
    v16 = (uint64_t)(*MEMORY[0x1E0C9ADF8] + v4);
    v5 = localtime(&v16);
    if (!v5)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      *(_DWORD *)buf = 134217984;
      v24 = v16;
      v10 = MEMORY[0x1E0C81028];
      v11 = "unable to convert localtime from %ld secs";
      v12 = buf;
      v13 = 12;
      goto LABEL_10;
    }
    v6 = a1;
    v7 = (&formatters)[2 * a1];
    if (strftime((char *)buf, 0x40uLL, v7, v5))
    {
      if (((0x69uLL >> v6) & 1) != 0)
      {
        v8 = buf;
      }
      else
      {
        v8 = (uint8_t *)v25;
        v9 = fmtcheck((const char *)buf, "unknown-%u");
        if (!snprintf(v25, 0x40uLL, v9, (int)((a2 - v4) * 1000000.0) / LODWORD((&formatters)[2 * v6 + 1])))goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v14;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315650;
      v18 = v7;
      v19 = 2048;
      v20 = v16;
      v21 = 1024;
      v22 = (int)((a2 - v4) * 1000000.0);
      v10 = MEMORY[0x1E0C81028];
      v11 = "unable to strftime with format '%s' from %lds+%dus}";
      v12 = (uint8_t *)&v17;
      v13 = 28;
      goto LABEL_10;
    }
  }
LABEL_11:
  v14 = CFSTR("recently");
  return v14;
}

uint64_t OSAIsRSDDevice()
{
  if (MGGetSInt32Answer() == 10)
    return 1;
  else
    return OSAIsDebugEnabledForRSD();
}

void initR3()
{
  initR3_r3 = (int)time(0) / 86400;
  if (initR3_onceToken != -1)
    dispatch_once(&initR3_onceToken, &__block_literal_global_10);
}

void __getRules_block_invoke()
{
  void *v0;

  v0 = (void *)getRules_rules;
  getRules_rules = (uint64_t)&unk_1E4DFED78;

}

id OSAnalyticsHelperServiceConnection()
{
  if (OSAnalyticsHelperServiceConnection_onceToken != -1)
    dispatch_once(&OSAnalyticsHelperServiceConnection_onceToken, &__block_literal_global_15);
  return (id)OSAnalyticsHelperServiceConnection_connection;
}

uint64_t OSARTCIsProcessOfInterest(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;

  v1 = OSARTCIsProcessOfInterest_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&OSARTCIsProcessOfInterest_onceToken, &__block_literal_global_12);
  v3 = objc_msgSend((id)OSARTCIsProcessOfInterest_processSet, "containsObject:", v2);

  return v3;
}

void sub_1A4D2DAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL SimulateCrash(int a1, uint64_t a2, void *a3)
{
  id v4;
  pid_t v5;

  v4 = a3;
  v5 = getpid();
  if (v5 == a1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      SimulateCrash_cold_1((uint64_t)v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    SimulateCrash_cold_2();
  }

  return v5 == a1;
}

BOOL WriteStackshotReport(void *a1, uint64_t a2)
{
  return _WriteStackshotReport(a1, a2, 0, 0, 0, 0);
}

BOOL _WriteStackshotReport(void *a1, uint64_t a2, int a3, int a4, unsigned int a5, void *a6)
{
  id v11;
  id v12;
  const char *v13;
  void *v14;
  _xpc_connection_s *v15;
  pid_t v16;
  xpc_object_t v17;
  const char *v18;
  _BOOL8 v19;
  xpc_object_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  id v26;
  const char *v27;
  id v28;
  xpc_object_t v29;
  int v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[16];
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = a6;
  v13 = getprogname();
  if (objc_msgSend(v11, "length"))
  {
    v14 = (void *)MEMORY[0x1A85A7FC8]();
    OSAnalyticsHelperServiceConnection();
    v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v33 = v14;
      *(_OWORD *)buf = 0u;
      v40 = 0u;
      if (!v13)
      {
        v16 = getpid();
        v13 = (const char *)buf;
        __sprintf_chk((char *)buf, 0, 0x20uLL, "%d", v16);
      }
      v17 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v17, "operation", 2uLL);
      xpc_dictionary_set_string(v17, "caller", v13);
      if (v11)
        v18 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
      else
        v18 = "(none)";
      xpc_dictionary_set_string(v17, "reason", v18);
      xpc_dictionary_set_uint64(v17, "exception_code", a2);
      xpc_dictionary_set_uint64(v17, "PID", a4);
      xpc_dictionary_set_uint64(v17, "flags", a5);
      if (v12)
      {
        v31 = a3;
        v20 = xpc_dictionary_create(0, 0, 0);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v32 = v12;
        v21 = v12;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v35 != v24)
                objc_enumerationMutation(v21);
              v26 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v34 + 1) + 8 * i));
              v27 = (const char *)objc_msgSend(v26, "UTF8String");
              objc_msgSend(v21, "objectForKeyedSubscript:", v26);
              v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              xpc_dictionary_set_string(v20, v27, (const char *)objc_msgSend(v28, "UTF8String"));

            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v23);
        }

        xpc_dictionary_set_value(v17, "additional_payload", v20);
        v12 = v32;
        a3 = v31;
      }
      if (a3)
      {
        xpc_connection_send_message(v15, v17);
        v19 = 1;
      }
      else
      {
        v29 = xpc_connection_send_message_with_reply_sync(v15, v17);
        v19 = xpc_dictionary_get_BOOL(v29, "result");

      }
      v14 = v33;
    }
    else
    {
      v19 = 0;
    }

    objc_autoreleasePoolPop(v14);
  }
  else
  {
    v19 = 0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Stackshot requires reason; ignoring request",
        buf,
        2u);
      v19 = 0;
    }
  }

  return v19;
}

BOOL WriteStackshotReport_async(void *a1, uint64_t a2)
{
  return _WriteStackshotReport(a1, a2, 1, 0, 0, 0);
}

BOOL WriteStackshotReportWithPID(void *a1, uint64_t a2, int a3)
{
  return _WriteStackshotReport(a1, a2, 0, a3, 0, 0);
}

BOOL WriteStackshotReportWithPayload(void *a1, uint64_t a2, int a3, void *a4)
{
  return _WriteStackshotReport(a1, a2, 0, a3, 0, a4);
}

BOOL WriteStackshotReportWithOptionsAndPayload(void *a1, uint64_t a2, int a3, unsigned int a4, void *a5)
{
  return _WriteStackshotReport(a1, a2, 0, a3, a4, a5);
}

BOOL WriteStackshotReportWithPID_async(void *a1, uint64_t a2, int a3)
{
  return _WriteStackshotReport(a1, a2, 1, a3, 0, 0);
}

BOOL WriteStackshotReportWithOptions(void *a1, uint64_t a2, int a3, unsigned int a4)
{
  return _WriteStackshotReport(a1, a2, 0, a3, a4, 0);
}

BOOL WriteStackshotReportWithOptions_async(void *a1, uint64_t a2, int a3, unsigned int a4)
{
  return _WriteStackshotReport(a1, a2, 1, a3, a4, 0);
}

BOOL WriteStackshotReport_stdc(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  _BOOL8 v6;

  v4 = (void *)MEMORY[0x1A85A7FC8]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _WriteStackshotReport(v5, a2, 0, 0, 0, 0);

  objc_autoreleasePoolPop(v4);
  return v6;
}

BOOL WriteCrashReportWithStackshot(int a1, unsigned int *a2, void *a3)
{
  return _WriteCrashReportWithStackshot(a1, a2, a3, 0, 0);
}

BOOL _WriteCrashReportWithStackshot(int a1, unsigned int *a2, void *a3, void *a4, int a5)
{
  id v9;
  id v10;
  void *v11;
  _xpc_connection_s *v12;
  xpc_object_t v13;
  const char *v14;
  _BOOL8 v15;
  xpc_object_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  const char *v23;
  id v24;
  xpc_object_t v25;
  int v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void *)MEMORY[0x1A85A7FC8]();
  OSAnalyticsHelperServiceConnection();
  v12 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v13, "operation", 3uLL);
    xpc_dictionary_set_uint64(v13, "PID", a1);
    xpc_dictionary_set_uint64(v13, "ers_namespace", *a2);
    xpc_dictionary_set_uint64(v13, "ers_code", *(_QWORD *)(a2 + 1));
    xpc_dictionary_set_uint64(v13, "ers_flags", *(_QWORD *)(a2 + 3));
    if (v9)
      v14 = (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    else
      v14 = "(none)";
    xpc_dictionary_set_string(v13, "reason", v14);
    if (v10)
    {
      v27 = a5;
      v28 = v11;
      v29 = v9;
      v16 = xpc_dictionary_create(0, 0, 0);
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v17 = v10;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v31 != v20)
              objc_enumerationMutation(v17);
            v22 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i));
            v23 = (const char *)objc_msgSend(v22, "UTF8String");
            objc_msgSend(v17, "objectForKeyedSubscript:", v22);
            v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            xpc_dictionary_set_string(v16, v23, (const char *)objc_msgSend(v24, "UTF8String"));

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v19);
      }

      xpc_dictionary_set_value(v13, "additional_payload", v16);
      v11 = v28;
      v9 = v29;
      a5 = v27;
    }
    if (a5)
    {
      xpc_connection_send_message(v12, v13);
      v15 = 1;
    }
    else
    {
      v25 = xpc_connection_send_message_with_reply_sync(v12, v13);
      v15 = xpc_dictionary_get_BOOL(v25, "result");

    }
  }
  else
  {
    v15 = 0;
  }

  objc_autoreleasePoolPop(v11);
  return v15;
}

BOOL WriteCrashReportWithStackshot_async(int a1, unsigned int *a2, void *a3)
{
  return _WriteCrashReportWithStackshot(a1, a2, a3, 0, 1);
}

BOOL WriteCrashReportWithStackshotWithPayload(int a1, unsigned int *a2, void *a3, void *a4)
{
  return _WriteCrashReportWithStackshot(a1, a2, a3, a4, 0);
}

BOOL WriteCrashReportWithStackshotWithPayload_async(int a1, unsigned int *a2, void *a3, void *a4)
{
  return _WriteCrashReportWithStackshot(a1, a2, a3, a4, 1);
}

BOOL WriteSystemMemoryResetReport(const char *a1, uint64_t a2, uint64_t a3)
{
  return WriteSystemMemoryResetReportWithPids(a1, a2, a3, 0, 0);
}

BOOL WriteSystemMemoryResetReportWithPids(const char *a1, uint64_t a2, uint64_t a3, int *a4, int a5)
{
  void *v9;
  _xpc_connection_s *v10;
  xpc_object_t v11;
  const char *v12;
  xpc_object_t v13;
  uint64_t v14;
  int64_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  _BOOL8 v18;

  v9 = (void *)MEMORY[0x1A85A7FC8]();
  OSAnalyticsHelperServiceConnection();
  v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v11, "operation", 4uLL);
    if (a1)
      v12 = a1;
    else
      v12 = "";
    xpc_dictionary_set_string(v11, "reason", v12);
    xpc_dictionary_set_uint64(v11, "event_code", a2);
    if (a4 && a5)
    {
      v13 = xpc_array_create(0, 0);
      if (a5 >= 1)
      {
        v14 = a5;
        do
        {
          v15 = *a4++;
          v16 = xpc_int64_create(v15);
          xpc_array_append_value(v13, v16);

          --v14;
        }
        while (v14);
      }
      xpc_dictionary_set_value(v11, "pids", v13);

    }
    v17 = xpc_connection_send_message_with_reply_sync(v10, v11);
    v18 = xpc_dictionary_get_BOOL(v17, "result");

  }
  else
  {
    v18 = 0;
  }

  objc_autoreleasePoolPop(v9);
  return v18;
}

uint64_t includeSection(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
    v5 = objc_msgSend(v3, "BOOLValue");

  return v5;
}

uint64_t excludeSection(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
    v5 = objc_msgSend(v3, "BOOLValue") ^ 1;

  return v5;
}

uint64_t kcdata_iter_size(uint64_t a1)
{
  int v1;
  unsigned int v4;
  BOOL v5;
  unsigned int v6;

  v1 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 & 0xFFFFFFF0) == 0x20)
    v1 = 17;
  if (v1 <= 2309)
  {
    if (v1 == 17 || v1 == 19)
      return *(unsigned int *)(a1 + 4);
LABEL_18:
    v4 = *(_DWORD *)(a1 + 4);
    goto LABEL_19;
  }
  if (v1 != 2310)
  {
    if (v1 == 2312)
    {
      v4 = *(_DWORD *)(a1 + 4);
      if (v4 == 32)
      {
        if ((*(_BYTE *)(a1 + 8) & 0x8F) == 0)
          return 24;
        v4 = 32;
      }
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  v4 = *(_DWORD *)(a1 + 4);
  if (v4 == 112)
  {
    if ((*(_BYTE *)(a1 + 8) & 0x8F) == 0)
      return 104;
    v4 = 112;
  }
LABEL_19:
  v5 = v4 >= (*(_DWORD *)(a1 + 8) & 0xFu);
  v6 = v4 - (*(_DWORD *)(a1 + 8) & 0xF);
  if (v5)
    return v6;
  else
    return 0;
}

__CFString *DecodeQOS(unsigned int a1)
{
  if (a1 < 7)
    return off_1E4DEDA10[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("QOS_CLASS_UNKNOWN (%u)"), (int)a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id DecodeThreadFlags(unint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t i;
  void *v6;
  uint64_t j;
  uint64_t k;
  __int128 v10;
  _BYTE __dst[512];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  memcpy(__dst, off_1E4DED800, sizeof(__dst));
  v10 = xmmword_1E4DEDA00;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 32; ++i)
  {
    if (((1 << i) & a1) != 0)
    {
      if (*(_QWORD *)&__dst[256 * a2 + 8 * i])
      {
        objc_msgSend(v4, "addObject:");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_0x%04X"), *(_QWORD *)&__dst[8 * a2 - 16], (1 << i));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v6);

      }
    }
  }
  for (j = 8; j != -8; j -= 8)

  for (k = 504; k != -8; k -= 8)
  return v4;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1A4D35FBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void __getOSADiagnosticsReporterClass_block_invoke(uint64_t a1)
{
  DiagnosticsReporterServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("OSADiagnosticsReporter");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getOSADiagnosticsReporterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getOSADiagnosticsReporterClass_block_invoke_cold_1();
    DiagnosticsReporterServicesLibrary();
  }
}

void DiagnosticsReporterServicesLibrary()
{
  void *v0;

  if (!DiagnosticsReporterServicesLibraryCore_frameworkLibrary)
    DiagnosticsReporterServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!DiagnosticsReporterServicesLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getDiagnosticsReporterLaunchOptionsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;
  id v5;
  id v6;
  id v7;
  id v8;

  DiagnosticsReporterServicesLibrary();
  result = objc_getClass("DiagnosticsReporterLaunchOptions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getDiagnosticsReporterLaunchOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getDiagnosticsReporterLaunchOptionsClass_block_invoke_cold_1();
    return (Class)+[OSATasking proxyTasking:taskId:usingConfig:fromBlob:](v3, v4, v5, v6, v7, v8);
  }
  return result;
}

void sub_1A4D37938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

id selectConfigFromBlob(uint64_t a1, _QWORD *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v34;
  _QWORD *v35;
  void *v36;
  void *v37;
  id v38;
  _BOOL4 matched;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint8_t buf[4];
  void *v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  const __CFString *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a1, 0, 0, &v44);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v44;
  v5 = v4;
  if (!v3)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0CB2D50];
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("blob failed to unserialize (error %@:%ld)"), v6, objc_msgSend(v5, "code"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("OSATasking"), 3, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PayloadContent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    v52 = CFSTR("blob missing payload");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("OSATasking"), 2, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_36;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PayloadType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("TaskingConfigurations"));

  if (!v13)
  {
    v27 = v6;
    goto LABEL_33;
  }
  v37 = v5;
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v36 = v6;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
  if (!v16)
  {
    v27 = 0;
    goto LABEL_30;
  }
  v17 = v16;
  v34 = v3;
  v35 = a2;
  v18 = *(_QWORD *)v41;
  v38 = v15;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v41 != v18)
        objc_enumerationMutation(v15);
      v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
      objc_msgSend(v14, "uiCountryCode");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!matchSelector((uint64_t)CFSTR("Country"), v21, v20))
        goto LABEL_22;
      objc_msgSend(v14, "buildVersion");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!matchSelector((uint64_t)CFSTR("OS Version"), v22, v20))
        goto LABEL_21;
      objc_msgSend(v14, "modelCode");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (!matchSelector((uint64_t)CFSTR("Product"), v23, v20))
        goto LABEL_20;
      objc_msgSend(v14, "releaseType");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!matchSelector((uint64_t)CFSTR("ReleaseType"), v24, v20))
      {

LABEL_20:
LABEL_21:

LABEL_22:
        continue;
      }
      objc_msgSend(v14, "productVersion");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      matched = matchSelector((uint64_t)CFSTR("ProductVersion"), v25, v20);

      v15 = v38;
      if (matched)
      {
        objc_msgSend(v20, "objectForKey:", CFSTR("ConfigurationContent"));
        v27 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
    }
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v55, 16);
  }
  while (v17);
  v27 = 0;
LABEL_28:
  v3 = v34;
  a2 = v35;
LABEL_30:

  v6 = v36;
  v5 = v37;
  if (!objc_msgSend(v27, "count"))
  {
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v53 = *MEMORY[0x1E0CB2D50];
    v54 = CFSTR("no matching configs");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("OSATasking"), 1, v29);
    v30 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v30;
  }

LABEL_33:
  if (v27 && (isConfigValid(v27) & 1) == 0)
  {
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0CB2D50];
    v48 = CFSTR("content invalid");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("OSATasking"), 4, v9);
    v11 = objc_claimAutoreleasedReturnValue();
    v6 = v27;
LABEL_36:

    v27 = 0;
    v5 = (void *)v11;
  }
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "localizedDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v46 = v32;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Tasking selection error: %@", buf, 0xCu);

    }
    if (a2)
      *a2 = objc_retainAutorelease(v5);
  }

  return v27;
}

BOOL matchSelector(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5 != 0;
  objc_msgSend(a3, "objectForKey:", a1);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5 && v7)
  {
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v7, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_msgSend(v9, "numberOfMatchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
      v6 = v10 != 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        matchSelector_cold_1(v10 != 0, (uint64_t)v5, (uint64_t)v8);
    }
    else
    {
      v6 = 0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v8;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Invalid regex '%@'", (uint8_t *)&v12, 0xCu);
        v6 = 0;
      }
    }

  }
  return v6;
}

uint64_t isConfigValid(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
  if (!v2)
  {
    v13 = 1;
    goto LABEL_36;
  }
  v3 = v2;
  v4 = *(_QWORD *)v16;
  v5 = MEMORY[0x1E0C81028];
  while (2)
  {
    for (i = 0; i != v3; ++i)
    {
      if (*(_QWORD *)v16 != v4)
        objc_enumerationMutation(v1);
      v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = 0;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_36;
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Invalid PayloadContent entry - expected dictionary", buf, 2u);
LABEL_35:
        v13 = 0;
        goto LABEL_36;
      }
      objc_msgSend(v7, "objectForKey:", CFSTR("User"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v8, "length"))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Missing or invalid 'User' key", buf, 2u);
        }
        goto LABEL_34;
      }
      objc_msgSend(v7, "objectForKey:", CFSTR("Domain"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v9, "length"))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Missing or invalid 'Domain' key", buf, 2u);
        }

LABEL_34:
        goto LABEL_35;
      }
      objc_msgSend(v7, "objectForKey:", CFSTR("Key"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "length"))
      {
        objc_msgSend(v7, "objectForKey:", CFSTR("Value"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138413058;
            v20 = v8;
            v21 = 2112;
            v22 = v9;
            v23 = 2112;
            v24 = v10;
            v25 = 2112;
            v26 = v11;
            _os_log_debug_impl(&dword_1A4D21000, v5, OS_LOG_TYPE_DEBUG, "validated %@@%@:%@=%@", buf, 0x2Au);
          }
          v12 = 0;
        }
        else
        {
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v20 = v8;
            v21 = 2112;
            v22 = v9;
            v23 = 2112;
            v24 = v10;
            _os_log_impl(&dword_1A4D21000, v5, OS_LOG_TYPE_DEFAULT, "Missing 'Value' key for %@ / %@ / %@", buf, 0x20u);
          }
          v12 = 1;
        }

      }
      else
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v20 = v8;
          v21 = 2112;
          v22 = v9;
          _os_log_impl(&dword_1A4D21000, v5, OS_LOG_TYPE_DEFAULT, "Missing or invalid 'Key' key for %@ / %@", buf, 0x16u);
        }
        v12 = 1;
      }

      if (v12)
        goto LABEL_35;
      v5 = MEMORY[0x1E0C81028];
    }
    v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v27, 16);
    v13 = 1;
    if (v3)
      continue;
    break;
  }
LABEL_36:

  return v13;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1A4D39388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4D39518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A4D3977C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1A4D3A800(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *processName()
{
  uint64_t v0;
  __int128 v1;
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;
  _OWORD v6[2];
  char v7;
  char v8;
  uint64_t v9;

  v0 = MEMORY[0x1E0C80A78]();
  v9 = *MEMORY[0x1E0C80C00];
  v1 = *(_OWORD *)(v0 + 20);
  v6[0] = *(_OWORD *)(v0 + 4);
  v6[1] = v1;
  v7 = *(_BYTE *)(v0 + 36);
  v8 = 0;
  if (LOBYTE(v6[0]))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("unknown");
  }
  v3 = CFSTR("(unprintable)");
  if (v2)
    v3 = v2;
  v4 = v3;

  return v4;
}

__CFString *killDescription(unint64_t a1)
{
  if (a1 < 0x10)
    return off_1E4DEDBE0[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown-%llu)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

const __CFString *freezeSkipReason(unsigned int a1)
{
  if (a1 > 0xA)
    return CFSTR("(unknown-reason)");
  else
    return off_1E4DEDC60[(char)a1];
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void sub_1A4D405A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getACAccountTypeIdentifierExchange()
{
  id *v0;
  void *v1;
  _Unwind_Exception *ACAccountTypeIdentifierExchange_cold_1;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getACAccountTypeIdentifierExchangeSymbolLoc_ptr;
  v7 = getACAccountTypeIdentifierExchangeSymbolLoc_ptr;
  if (!getACAccountTypeIdentifierExchangeSymbolLoc_ptr)
  {
    v1 = (void *)AccountsLibrary();
    v0 = (id *)dlsym(v1, "ACAccountTypeIdentifierExchange");
    v5[3] = (uint64_t)v0;
    getACAccountTypeIdentifierExchangeSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    ACAccountTypeIdentifierExchange_cold_1 = (_Unwind_Exception *)getACAccountTypeIdentifierExchange_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(ACAccountTypeIdentifierExchange_cold_1);
  }
  return *v0;
}

void sub_1A4D40B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

Class __getACAccountStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  AccountsLibrary();
  result = objc_getClass("ACAccountStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getACAccountStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getACAccountStoreClass_block_invoke_cold_1();
    return (Class)AccountsLibrary();
  }
  return result;
}

uint64_t AccountsLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AccountsLibraryCore_frameworkLibrary)
    AccountsLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AccountsLibraryCore_frameworkLibrary;
  if (!AccountsLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void *__getkDAAccountEmailAddressSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (DataAccessLibraryCore_frameworkLibrary)
  {
    v2 = (void *)DataAccessLibraryCore_frameworkLibrary;
  }
  else
  {
    DataAccessLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)DataAccessLibraryCore_frameworkLibrary;
    if (!DataAccessLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "kDAAccountEmailAddress");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getkDAAccountEmailAddressSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, v4, 0xCu);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

char *OUTLINED_FUNCTION_11(int *a1)
{
  return strerror(*a1);
}

int *OUTLINED_FUNCTION_13()
{
  return __error();
}

uint64_t OSAIsRSDHost()
{
  return 0;
}

BOOL OSAIsRSDDisplay()
{
  return MGGetSInt32Answer() == 10;
}

uint64_t OSASyncCrashReporter(uint64_t a1, _QWORD *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  mach_port_t *v9;
  NSObject *v10;
  uint64_t i;
  id v12;
  const char *v13;
  mach_error_t v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  _QWORD *v27;
  void *v28;
  mach_port_t sp;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint8_t buf[4];
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "addObject:", CFSTR("com.apple.ReportCrash"));
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v31;
    v9 = (mach_port_t *)MEMORY[0x1E0C81720];
    v10 = MEMORY[0x1E0C81028];
    v27 = a2;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v4);
        v12 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i));
        v13 = (const char *)objc_msgSend(v12, "UTF8String");
        sp = 0;
        if (bootstrap_look_up(*v9, v13, &sp) || sp + 1 < 2)
        {
          v17 = (void *)MEMORY[0x1E0CB35C8];
          v34 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unable to lookup port for %@"), v12);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v17;
          v21 = 1;
LABEL_19:
          objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("OSASyncCrashReporter"), v21, v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          a2 = v27;
          goto LABEL_20;
        }
        v28 = 0;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v12;
          _os_log_impl(&dword_1A4D21000, v10, OS_LOG_TYPE_DEFAULT, "sending sync request to %@", buf, 0xCu);
        }
        v14 = rc_sync_request(sp, 1, 0, &v28);
        if (v14)
        {
          v22 = (void *)MEMORY[0x1E0CB35C8];
          v36 = *MEMORY[0x1E0CB2D50];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sync request failed (mach ipc: %s)"), mach_error_string(v14));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v18;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v22;
          v21 = 2;
          goto LABEL_19;
        }
        v15 = (int)v28;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v39 = v28;
          _os_log_impl(&dword_1A4D21000, v10, OS_LOG_TYPE_DEFAULT, "synced after %lld total events", buf, 0xCu);
        }
        v7 += v15;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      v16 = 0;
      a2 = v27;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v16 = 0;
    v7 = 0;
  }
LABEL_20:

  if (a2)
  {
    v23 = objc_retainAutorelease(v16);
    *a2 = v23;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v23, "localizedDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v39 = v24;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "unable to lookup port for %@", buf, 0xCu);

    }
  }
  if (v16)
    v25 = 0xFFFFFFFFLL;
  else
    v25 = v7;

  return v25;
}

id getSubruleForSpecifier(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    getRuleForSpecifier(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __getLocalHomeDirectories_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "length");
  if (v6 <= objc_msgSend(v5, "length"))
  {
    v8 = objc_msgSend(v4, "length");
    v7 = v8 != objc_msgSend(v5, "length");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1A4D45A7C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A4D45A94(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x1A4D45C48);
}

void sub_1A4D45A9C(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  void *v9;
  id v10;
  void *v11;
  char v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;

  if (a2)
  {
    if (a2 == 2)
    {
      v10 = objc_begin_catch(exc_buf);
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB2A70]);

      if ((v12 & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(a9) = 138412290;
          *(_QWORD *)((char *)&a9 + 4) = v10;
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "C4.! payload writer exception: %@", (uint8_t *)&a9, 0xCu);
        }
        objc_exception_rethrow();
      }
      v13 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "reason");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(a9) = 138543362;
        *(_QWORD *)((char *)&a9 + 4) = v15;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error while writing file: %{public}@", (uint8_t *)&a9, 0xCu);

      }
      objc_msgSend(v10, "reason");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v9, "error_desc", (const char *)objc_msgSend(v16, "UTF8String"));

      xpc_dictionary_set_string(v9, "error_domain", "OSALog");
      xpc_dictionary_set_uint64(v9, "error_code", 0xAuLL);

      objc_end_catch();
    }
    else
    {
      objc_begin_catch(exc_buf);
    }
    JUMPOUT(0x1A4D45924);
  }
  _Unwind_Resume(exc_buf);
}

void sub_1A4D45C20(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1A4D45C30);
  }
  _Unwind_Resume(a1);
}

void osa_scanDir(const char *a1, uint64_t a2, void *a3, void *a4)
{
  void (**v7)(id, const char *, _QWORD);
  unsigned int (**v8)(id, const char *, uint64_t);
  DIR *v9;
  DIR *v10;
  dirent *v11;
  dirent *v12;
  void *v13;
  char *d_name;
  int d_type;
  void *v16;
  unsigned int v17;
  int *v18;
  char *v19;
  void *v20;
  char __str[4];
  const char *v22;
  __int16 v23;
  char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = opendir(a1);
  if (v9)
  {
    v10 = v9;
    v11 = readdir(v9);
    if (v11)
    {
      v12 = v11;
      do
      {
        v13 = (void *)MEMORY[0x1A85A7FC8]();
        d_name = v12->d_name;
        if (v12->d_name[0] != 46)
        {
          bzero(__str, 0x400uLL);
          snprintf(__str, 0x400uLL, "%s/%s", a1, v12->d_name);
          d_type = v12->d_type;
          if (d_type == 4)
          {
            if ((a2 & 1) == 0 && (!v8 || v8[2](v8, a1, (uint64_t)v12->d_name)))
              osa_scanDir(__str, a2, v7, v8);
            goto LABEL_19;
          }
          if (d_type == 8)
          {
            if ((a2 & 0xC0) != 0)
            {
              objc_msgSend(v20, "lastPathComponent");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = ((a2 & 0x80) == 0) ^ objc_msgSend(v16, "isEqualToString:", CFSTR("Retired"));

              if ((a2 & 0x200) == 0 || (v17 & 1) == 0)
              {
                if (!v17)
                  goto LABEL_19;
LABEL_18:
                ((void (**)(id, const char *, char *))v7)[2](v7, a1, d_name);
                goto LABEL_19;
              }
            }
            else if ((a2 & 0x200) == 0)
            {
              goto LABEL_18;
            }
            if (getxattr(__str, (const char *)objc_msgSend(CFSTR("urgent"), "UTF8String"), 0, 0, 0, 0) > 0)
              goto LABEL_18;
          }
        }
LABEL_19:
        objc_autoreleasePoolPop(v13);
        v12 = readdir(v10);
      }
      while (v12);
    }
    closedir(v10);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v18 = __error();
    v19 = strerror(*v18);
    *(_DWORD *)__str = 136315394;
    v22 = a1;
    v23 = 2080;
    v24 = v19;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to open log directory '%s': %s", (uint8_t *)__str, 0x16u);
  }

}

void sub_1A4D47B00(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x250], 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1A4D49150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,id location,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a71;
  id *v71;

  objc_destroyWeak(v71);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a38, 8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a60, 8);
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

uint64_t checkMCFeature(const char *a1, id *a2)
{
  void *v4;
  id *v5;
  NSObject *v6;
  const char *v7;
  void *v8;
  _BOOL8 v9;
  int v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1A85A7FC8]();
  if (checkMCFeature_dylib_handle
    || (checkMCFeature_dylib_handle = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 4)) != 0)
  {
    if (!checkMCFeature_profileConnectionObj)
    {
      checkMCFeature_profileConnectionObj = (uint64_t)objc_getClass("MCProfileConnection");
      if (!checkMCFeature_profileConnectionObj && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unable to find class MCProfileConnection", (uint8_t *)&v11, 2u);
      }
    }
    if (*a2)
      goto LABEL_17;
    v5 = (id *)dlsym((void *)checkMCFeature_dylib_handle, a1);
    if (v5)
    {
      objc_storeStrong(a2, *v5);
      goto LABEL_17;
    }
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    v11 = 136315138;
    v12 = (char *)a1;
    v6 = MEMORY[0x1E0C81028];
    v7 = "Unable to load symbol %s";
LABEL_16:
    _os_log_impl(&dword_1A4D21000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, 0xCu);
    goto LABEL_17;
  }
  if (MGGetBoolAnswer() && !os_variant_is_recovery())
  {
    objc_autoreleasePoolPop(v4);
    return 1;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = dlerror();
    v6 = MEMORY[0x1E0C81028];
    v7 = "Unable to load ManagedConfiguration dylib ('%s')";
    goto LABEL_16;
  }
LABEL_17:
  objc_autoreleasePoolPop(v4);
  if (!checkMCFeature_profileConnectionObj || !*a2)
    return 0;
  objc_msgSend((id)checkMCFeature_profileConnectionObj, "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "effectiveBoolValueForSetting:", *a2) == 1;

  return v9;
}

uint64_t isInternal()
{
  return os_variant_has_internal_diagnostics();
}

uint64_t seedFeedbackPromptingEnabled()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  if ((_DWORD)result)
    return _os_feature_enabled_impl();
  return result;
}

uint64_t OSAIsACDCDevice()
{
  if (OSAIsACDCDevice_onceToken != -1)
    dispatch_once(&OSAIsACDCDevice_onceToken, &__block_literal_global_7);
  return OSAIsACDCDevice_isACDCDevice;
}

void sub_1A4D4C10C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void runCrashMoverService(void *a1)
{
  id v1;
  NSObject *v2;
  NSObject *v3;
  id v4;
  dispatch_time_t v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[16];

  v1 = a1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Gathering non-mobile logs via crash_mover", buf, 2u);
  }
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_group_create();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __runCrashMoverService_block_invoke;
  block[3] = &unk_1E4DED7B8;
  v4 = v1;
  v7 = v4;
  dispatch_group_async(v3, v2, block);
  v5 = dispatch_time(0, 5000000000);
  if (dispatch_group_wait(v3, v5) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "crash_mover is taking too long!", buf, 2u);
  }

}

void __runCrashMoverService_block_invoke(uint64_t a1)
{
  _xpc_connection_s *mach_service;
  _xpc_connection_s *v3;
  uint64_t v4;
  void *v5;
  xpc_object_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL4 value;
  const char *v11;
  NSObject *v12;
  const char *v13;
  uint32_t v14;
  const char *string;
  int v16;
  const char *v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  mach_service = xpc_connection_create_mach_service("com.apple.crash_mover", 0, 0);
  v3 = mach_service;
  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_9);
    xpc_connection_resume(v3);
    v18[0] = CFSTR("Extensions");
    v18[1] = CFSTR("options");
    v4 = *(_QWORD *)(a1 + 32);
    if (!v4)
      v4 = MEMORY[0x1E0C9AA60];
    v19[0] = &unk_1E4DFEEE8;
    v19[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    v6 = xpc_connection_send_message_with_reply_sync(v3, v5);
    v7 = MEMORY[0x1A85A8658]();
    if (v7 == MEMORY[0x1E0C81310])
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        string = xpc_dictionary_get_string(v6, (const char *)*MEMORY[0x1E0C81270]);
        v16 = 136315138;
        v17 = string;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "crash_mover service FAILED with XPC error: %s", (uint8_t *)&v16, 0xCu);
      }
      goto LABEL_19;
    }
    if (v7 != MEMORY[0x1E0C812F8])
    {
LABEL_19:

      goto LABEL_20;
    }
    xpc_dictionary_get_value(v6, "Success");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      value = xpc_BOOL_get_value(v8);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v11 = "FAILED";
        if (value)
          v11 = "succeeded";
        v16 = 136315138;
        v17 = v11;
        v12 = MEMORY[0x1E0C81028];
        v13 = "crash_mover service %s";
        v14 = 12;
        goto LABEL_17;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v12 = MEMORY[0x1E0C81028];
      v13 = "crash_mover service returned ambiguous response, assuming failure";
      v14 = 2;
LABEL_17:
      _os_log_impl(&dword_1A4D21000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, v14);
    }

    goto LABEL_19;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "crash_mover service FAILED to connect", (uint8_t *)&v16, 2u);
  }
LABEL_20:

}

void __runCrashMoverService_block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  const char *string;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (MEMORY[0x1A85A8658]() == MEMORY[0x1E0C81310]
    && v2 != (id)MEMORY[0x1E0C81260]
    && v2 != (id)MEMORY[0x1E0C81258]
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x1E0C81270]);
    v7 = 136315138;
    v8 = string;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "crash_mover service FAILED on setup: %s", (uint8_t *)&v7, 0xCu);
  }

}

uint64_t logEventForAppleCare(void *a1)
{
  id v1;
  double Current;

  v1 = a1;
  Current = CFAbsoluteTimeGetCurrent();
  logForAppleCare(v1, Current);

  return 0;
}

void logLineForAppleCare(uint64_t a1, uint64_t a2, double a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a1);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a2);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v7, v5, 0);
  logForAppleCare(v6, a3);

}

void rollAppleCareLogs()
{
  void *v0;
  double Current;
  int v2;
  int v3;
  int v4;
  uid_t v5;
  gid_t v6;
  __CFString *v7;
  id v8;
  id v9;

  v0 = (void *)MEMORY[0x1A85A7FC8]();
  initR3();
  v9 = 0;
  v4 = initR3_r3;
  v8 = (id)qword_1ECFF4518;
  v5 = getuid();
  v6 = getgid();
  v7 = CFSTR("/Library/Logs/AppleSupport/");

  Current = CFAbsoluteTimeGetCurrent();
  v2 = openR3((uint64_t)&initR3_r3, 0, Current);
  if ((v2 & 0x80000000) == 0)
    close(v2);
  if (!v5)
  {
    v3 = openR3((uint64_t)&v4, 0, Current);
    if ((v3 & 0x80000000) == 0)
      close(v3);
  }
  purgeR3Logs((uint64_t)&initR3_r3);
  if (!v5)
    purgeR3Logs((uint64_t)&v4);

  objc_autoreleasePoolPop(v0);
}

void sub_1A4D4D3D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  __destructor_8_s16_s24_s32((id *)va);
  _Unwind_Resume(a1);
}

void purgeR3Logs(uint64_t a1)
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  DIR *v11;
  DIR *v12;
  dirent *v13;
  __int128 v14;
  dirent *v15;
  char *d_name;
  void *v17;
  uint64_t v18;
  void *v20;
  void *v21;
  id v22;
  const char *v23;
  int v24;
  int v25;
  int *v26;
  char *v27;
  __int128 v28;
  int value;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  _BYTE v33[18];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    v3 = (const char *)objc_msgSend(v2, "fileSystemRepresentation");
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      purgeR3Logs_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    v11 = opendir(v3);
    if (v11)
    {
      v12 = v11;
      v13 = readdir(v11);
      if (v13)
      {
        v15 = v13;
        *(_QWORD *)&v14 = 67109634;
        v28 = v14;
        do
        {
          d_name = v15->d_name;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15->d_name, v28);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "rangeOfString:options:", CFSTR("general.*\\.log"), 1024);

          if (v15->d_type == 8 && v18 != 0x7FFFFFFFFFFFFFFFLL)
          {
            value = 0;
            v20 = *(void **)(a1 + 16);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15->d_name);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringByAppendingPathComponent:", v21);
            v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v23 = (const char *)objc_msgSend(v22, "fileSystemRepresentation");

            getxattr(v23, "Day_Seq", &value, 4uLL, 0, 0);
            if (value <= *(_DWORD *)a1 - 14)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                v24 = *(_DWORD *)a1 - value;
                if (v24 >= 365)
                  v24 = -1;
                *(_DWORD *)buf = v28;
                v31 = 14;
                v32 = 1024;
                *(_DWORD *)v33 = v24;
                *(_WORD *)&v33[4] = 2080;
                *(_QWORD *)&v33[6] = d_name;
                _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: purging old (limit %d vs actual %d) %s", buf, 0x18u);
              }
              unlink(v23);
            }
          }
          v15 = readdir(v12);
        }
        while (v15);
      }
      closedir(v12);
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v25 = *__error();
      v26 = __error();
      v27 = strerror(*v26);
      *(_DWORD *)buf = 67109634;
      v31 = v25;
      v32 = 2080;
      *(_QWORD *)v33 = v3;
      *(_WORD *)&v33[8] = 2080;
      *(_QWORD *)&v33[10] = v27;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR[%d] scanning '%s', %s", buf, 0x1Cu);
    }
  }
}

void __destructor_8_s16_s24_s32(id *a1)
{

}

uint64_t createR3(uint64_t a1, char *a2, double a3, double a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uid_t v9;
  const char *v10;
  const char *v11;
  size_t v12;
  int v13;
  int *v14;
  char *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  int v29;
  int *v30;
  char *v31;
  id v33;
  double v34;
  double value;
  _QWORD v36[7];
  _QWORD v37[7];
  uint8_t buf[4];
  _BYTE v39[14];
  __int16 v40;
  char *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v34 = a4;
  value = a3;
  v6 = 384;
  if (!*(_DWORD *)(a1 + 4))
    v6 = 420;
  v7 = open_dprotected_np(a2, 2594, 4, 0, v6);
  v8 = v7;
  if ((v7 & 0x80000000) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v29 = *__error();
      v30 = __error();
      v31 = strerror(*v30);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v39 = v29;
      *(_WORD *)&v39[4] = 2080;
      *(_QWORD *)&v39[6] = a2;
      v40 = 2080;
      v41 = v31;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR[%d] failed to create %s, %s", buf, 0x1Cu);
    }
  }
  else
  {
    v9 = *(_DWORD *)(a1 + 4);
    if (v9)
      fchown(v7, v9, *(_DWORD *)(a1 + 8));
    v10 = (const char *)objc_msgSend(*(id *)(a1 + 24), "UTF8String");
    if (!v10
      || (v11 = v10, !*v10)
      || (v12 = strlen(v10), fsetxattr(v8, "Version", v11, v12, 0, 0))
      || fsetxattr(v8, "Install", &value, 8uLL, 0, 0)
      || fsetxattr(v8, "Upgrade", &v34, 8uLL, 0, 0)
      || fsetxattr(v8, "Day_Seq", (const void *)a1, 4uLL, 0, 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v13 = *__error();
        v14 = __error();
        v15 = strerror(*v14);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v39 = v13;
        *(_WORD *)&v39[4] = 2080;
        *(_QWORD *)&v39[6] = a2;
        v40 = 2080;
        v41 = v15;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR[%d] setting xattrs on %s, %s", buf, 0x1Cu);
      }
    }
    v16 = (__CFString *)MGCopyAnswer();
    v36[0] = CFSTR("report");
    v36[1] = CFSTR("version");
    v37[0] = CFSTR("Device Software Diagnostic Log");
    v37[1] = &unk_1E4DFDC60;
    v36[2] = CFSTR("os_build");
    +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "productNameVersionBuildString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v18;
    v36[3] = CFSTR("model");
    +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "modelCode");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = CFSTR("<no_sn>");
    if (v16)
      v22 = v16;
    v37[3] = v20;
    v37[4] = v22;
    v36[4] = CFSTR("serial");
    v36[5] = CFSTR("installed");
    OSADateFormat(0, value);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v37[5] = v23;
    v36[6] = CFSTR("updated");
    OSADateFormat(0, v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v37[6] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 7);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v25, 0, &v33);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v33;
    v28 = objc_retainAutorelease(v26);
    write(v8, (const void *)objc_msgSend(v28, "bytes"), objc_msgSend(v28, "length"));
    write(v8, "\n", 1uLL);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v39 = a2;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: new %s", buf, 0xCu);
    }

  }
  return v8;
}

__CFString *OSACPUTypeToString(uint64_t a1)
{
  __CFString *v1;

  v1 = CFSTR("X86-64");
  if ((int)a1 <= 16777222)
  {
    if ((_DWORD)a1 != 7)
    {
      if ((_DWORD)a1 == 12)
        return CFSTR("ARM");
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%08X"), a1);
      v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else if ((_DWORD)a1 != 16777223)
  {
    if ((_DWORD)a1 == 16777228)
      return CFSTR("ARM-64");
    if ((_DWORD)a1 == 33554444)
      return CFSTR("ARM64_32");
    goto LABEL_10;
  }
  return v1;
}

uint64_t OSASafeRemoveFile(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __OSASafeRemoveFile_block_invoke;
  v4[3] = &unk_1E4DEE5F0;
  v4[4] = &v5;
  v4[5] = a2;
  OSASafeOpen(a1, 0, 0, v4);
  v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_1A4D4EC6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t OSASafeRemoveFileAtURL(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(v3, "URLByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isAllowed:forDomain:", v6, CFSTR("cleanup_paths"));

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "removeItemAtURL:error:", v3, a2);

  }
  else
  {
    objc_msgSend(v3, "lastPathComponent");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "fileSystemRepresentation");

    v12 = OSASafeRemoveFile(objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation"), v11);
    v9 = v12;
    if (a2 && (v12 & 1) == 0)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0CB2D50];
      v14 = (void *)MEMORY[0x1E0CB3940];
      v15 = __error();
      objc_msgSend(v14, "stringWithUTF8String:", strerror(*v15));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("OSAFileOperations"), 0, v17);
      *a2 = (id)objc_claimAutoreleasedReturnValue();

      v9 = 0;
    }
  }

  return v9;
}

uint64_t OSASafeMoveItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __OSASafeMoveItem_block_invoke;
  v6[3] = &unk_1E4DEE640;
  v6[4] = &v7;
  v6[5] = a3;
  v6[6] = a2;
  v6[7] = a4;
  OSASafeOpen(a1, 0, 0, v6);
  v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_1A4D4EF24(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t OSASafeMoveItemAtURL(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a1;
  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = objc_msgSend(v7, "fileSystemRepresentation");

  objc_msgSend(v6, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v9);
  v11 = objc_msgSend(v10, "fileSystemRepresentation");

  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "fileSystemRepresentation");

  objc_msgSend(v5, "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_retainAutorelease(v14);
  v16 = objc_msgSend(v15, "fileSystemRepresentation");

  v17 = OSASafeMoveItem(v8, v11, v13, v16);
  v18 = v17;
  if (a3 && (v17 & 1) == 0)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0CB2D50];
    v20 = (void *)MEMORY[0x1E0CB3940];
    v21 = __error();
    objc_msgSend(v20, "stringWithUTF8String:", strerror(*v21));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("OSAFileOperations"), 0, v23);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

uint64_t OSASafeOpenWriteOnly(uint64_t a1, void *a2)
{
  return OSASafeOpen(a1, 513, 0x1A4u, a2);
}

BOOL OSASafeCreateDirectory(void *a1, int a2, void *a3, _QWORD *a4)
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  uint64_t v17;
  id v18;
  int v19;
  id v20;
  int v21;
  id v22;
  const char *v23;
  void *v24;
  void *v25;
  int v26;
  int v27;
  NSObject *v28;
  int v29;
  int v30;
  int v31;
  NSObject *v32;
  int st_mode;
  int *v34;
  char *v35;
  void *v36;
  int *v37;
  char *v38;
  void *v39;
  void *v40;
  _BOOL4 v41;
  dev_t v42;
  void *v43;
  int v44;
  gid_t st_gid;
  NSObject *v46;
  gid_t v47;
  char *v48;
  int *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  __CFString *v59;
  void *v60;
  void *v61;
  __CFString *v62;
  __CFString *v63;
  id v64;
  id v65;
  void *v66;
  int *v67;
  char *v68;
  void *v69;
  int *v70;
  char *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  int *v76;
  void *v77;
  void *v78;
  void *v79;
  _QWORD *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  int v86;
  void *v88;
  void *v89;
  __CFString *v90;
  __CFString *v91;
  stat v92;
  _QWORD v93[3];
  _QWORD v94[3];
  uint8_t v95[4];
  uint64_t v96;
  stat buf;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v6 = a1;
  v7 = a3;
  objc_msgSend(v6, "pathComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") < 2)
  {
    v16 = CFSTR("Too few path components");
    goto LABEL_69;
  }
  if (!objc_msgSend(v7, "createIntermediates"))
  {
    objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v8, "count");
    objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = open((const char *)objc_msgSend(v18, "fileSystemRepresentation"), 537919488);

    if ((v19 & 0x80000000) == 0)
    {
      v10 = v17 - 1;
LABEL_15:
      v20 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
      objc_msgSend(v20, "setUsesSignificantDigits:", 1);
      v85 = v20;
      objc_msgSend(v20, "setMaximumSignificantDigits:", 2);
      if (v10 >= objc_msgSend(v8, "count"))
      {
        v16 = 0;
      }
      else
      {
        v81 = a4;
        v82 = v6;
        v21 = a2;
        v83 = v8;
        v84 = v7;
        while (1)
        {
          objc_msgSend(v8, "objectAtIndex:", v10);
          v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v23 = (const char *)objc_msgSend(v22, "fileSystemRepresentation");

          v24 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v8, "subarrayWithRange:", 0, ++v10);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "fileURLWithPathComponents:", v25);
          v88 = (void *)objc_claimAutoreleasedReturnValue();

          if (mkdirat(v19, v23, a2 & 0x1B6))
          {
            v16 = CFSTR("Failed to create directory");
            goto LABEL_66;
          }
          v26 = openat(v19, v23, 537919488);
          if (v26 < 0)
            break;
          v27 = v26;
          close(v19);
          memset(&v92, 0, sizeof(v92));
          if (fstat(v27, &v92))
          {
            v28 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v82, "path");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = __error();
              v38 = strerror(*v37);
              buf.st_dev = 138543618;
              *(_QWORD *)&buf.st_mode = v36;
              WORD2(buf.st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v38;
              _os_log_error_impl(&dword_1A4D21000, v28, OS_LOG_TYPE_ERROR, "Failed to stat %{public}@ when checking group ownership: %s", (uint8_t *)&buf, 0x16u);

            }
            v29 = 0;
            v30 = 0;
          }
          else
          {
            v28 = MEMORY[0x1E0C81028];
            if (v92.st_mode == v21)
              goto LABEL_31;
            v31 = fchmod(v27, v21);
            if (v31 == -1 && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v82, "path");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v70 = __error();
              v71 = strerror(*v70);
              buf.st_dev = 138543618;
              *(_QWORD *)&buf.st_mode = v69;
              WORD2(buf.st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v71;
              _os_log_error_impl(&dword_1A4D21000, v28, OS_LOG_TYPE_ERROR, "Failed to modify permissions while creating %{public}@: %s", (uint8_t *)&buf, 0x16u);

            }
            if (v21 != 504)
            {
LABEL_31:
              v86 = 0;
            }
            else
            {
              v32 = v28;
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                st_mode = v92.st_mode;
                if (v31)
                {
                  v34 = __error();
                  v35 = strerror(*v34);
                }
                else
                {
                  v35 = "";
                }
                buf.st_dev = 138544386;
                *(_QWORD *)&buf.st_mode = v88;
                WORD2(buf.st_ino) = 1024;
                *(_DWORD *)((char *)&buf.st_ino + 6) = st_mode;
                HIWORD(buf.st_uid) = 1024;
                buf.st_gid = 504;
                LOWORD(buf.st_rdev) = 1024;
                *(dev_t *)((char *)&buf.st_rdev + 2) = v31 == 0;
                *((_WORD *)&buf.st_rdev + 3) = 2082;
                buf.st_atimespec.tv_sec = (__darwin_time_t)v35;
                _os_log_impl(&dword_1A4D21000, v28, OS_LOG_TYPE_DEFAULT, "=== Attempted change perms on new dir: %{public}@ from 0x%X to 0x%X with result %d %{public}s", (uint8_t *)&buf, 0x28u);
              }

              v86 = 1;
            }
            objc_msgSend(v7, "userID");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "groupID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            buf = v92;
            v41 = OSASetOwnership(v27, (uint64_t)&buf, v39, v40);

            v42 = v41;
            if (!v41 && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v82, "path");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = __error();
              v68 = strerror(*v67);
              buf.st_dev = 138543618;
              *(_QWORD *)&buf.st_mode = v66;
              WORD2(buf.st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v68;
              _os_log_error_impl(&dword_1A4D21000, v28, OS_LOG_TYPE_ERROR, "Failed to set ownership while creating %{public}@: %s", (uint8_t *)&buf, 0x16u);

            }
            objc_msgSend(v7, "groupID");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "unsignedIntValue");
            st_gid = v92.st_gid;

            v30 = 0;
            if (v44 == 250)
            {
              v29 = v86;
              if (st_gid != 250)
              {
                v46 = v28;
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  v47 = v92.st_gid;
                  v48 = "";
                  if ((v42 & 1) == 0)
                  {
                    v49 = __error();
                    v48 = strerror(*v49);
                  }
                  buf.st_dev = 138544386;
                  *(_QWORD *)&buf.st_mode = v88;
                  WORD2(buf.st_ino) = 1024;
                  *(_DWORD *)((char *)&buf.st_ino + 6) = v47;
                  HIWORD(buf.st_uid) = 1024;
                  buf.st_gid = 250;
                  LOWORD(buf.st_rdev) = 1024;
                  *(dev_t *)((char *)&buf.st_rdev + 2) = v42;
                  *((_WORD *)&buf.st_rdev + 3) = 2082;
                  buf.st_atimespec.tv_sec = (__darwin_time_t)v48;
                  _os_log_impl(&dword_1A4D21000, v28, OS_LOG_TYPE_DEFAULT, "=== Attempted change gid on new dir: %{public}@ from %d to _analyticsusers (%u) with result %d %{public}s", (uint8_t *)&buf, 0x28u);
                }

                v30 = 1;
              }
              v21 = a2;
            }
            else
            {
              v29 = v86;
              v21 = a2;
            }
          }
          if (objc_msgSend(v7, "fileProtectionNone")
            && fcntl(v27, 63) != 4
            && fcntl(v27, 64, 4) == -1
            && os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            OSASafeCreateDirectory_cold_1(v95, v82, &v96);
          }
          if ((v29 | v30) == 1)
          {
            getprogname();
            OSAGetBootTime();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (v50)
            {
              v51 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "timeIntervalSinceDate:", v50);
              objc_msgSend(v51, "numberWithDouble:");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "stringForObjectValue:", v53);
              v54 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v54 = CFSTR("-1");
            }
            OSAGetProcessUptime();
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (v55)
            {
              v56 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "timeIntervalSinceDate:", v55);
              objc_msgSend(v56, "numberWithDouble:");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "stringForObjectValue:", v58);
              v59 = (__CFString *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v59 = CFSTR("-1");
            }
            objc_msgSend(v11, "path");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "path");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = v59;
            v89 = v60;
            v90 = v54;
            v62 = v59;
            v63 = v54;
            v64 = v61;
            v65 = v60;
            AnalyticsSendEventLazy();

            v8 = v83;
            v7 = v84;
            v21 = a2;
          }

          v19 = v27;
          if (v10 >= objc_msgSend(v8, "count"))
          {
            v16 = 0;
            v19 = v27;
            goto LABEL_67;
          }
        }
        v16 = CFSTR("Failed to open newly created directory");
LABEL_66:

LABEL_67:
        v6 = v82;
        a4 = v81;
      }
      close(v19);

      goto LABEL_69;
    }
LABEL_13:

    v16 = CFSTR("Failed to find base path on which to create directories");
    goto LABEL_69;
  }
  v9 = objc_msgSend(v8, "count");
  v10 = v9 - 1;
  if (v9 == 1)
  {
LABEL_9:
    v11 = 0;
    goto LABEL_13;
  }
  v11 = 0;
  while (1)
  {
    v12 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v8, "subarrayWithRange:", 0, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileURLWithPathComponents:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_retainAutorelease(v14);
    v15 = open((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 537919488);
    if ((v15 & 0x80000000) == 0)
    {
      v19 = v15;
      goto LABEL_15;
    }
    if (*__error() != 2)
      break;
    if (!--v10)
    {

      goto LABEL_9;
    }
  }

  v16 = CFSTR("Failed to open intermediate path");
LABEL_69:
  if (a4 && v16)
  {
    v72 = (void *)MEMORY[0x1E0CB35C8];
    v73 = *MEMORY[0x1E0CB2D50];
    v94[0] = v16;
    v93[0] = v73;
    v93[1] = CFSTR("errno");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *__error());
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v94[1] = v74;
    v93[2] = CFSTR("errstr");
    v75 = (void *)MEMORY[0x1E0CB3940];
    v76 = __error();
    objc_msgSend(v75, "stringWithUTF8String:", strerror(*v76));
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v94[2] = v77;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 3);
    v78 = v8;
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "errorWithDomain:code:userInfo:", CFSTR("OSAFileOperations"), 2, v79);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    v8 = v78;
  }

  return v16 == 0;
}

void sub_1A4D538E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

id symbolicateSpeedTracer(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  dispatch_semaphore_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v29;
  void *v30;
  _QWORD v31[4];
  NSObject *v32;
  uint64_t *v33;
  _QWORD *v34;
  _QWORD v35[5];
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v3 = a1;
  v4 = a2;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__7;
  v41 = __Block_byref_object_dispose__7;
  v42 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__7;
  v35[4] = __Block_byref_object_dispose__7;
  v36 = 0;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", OSATransformOptionTracerURL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://speedtracer.apple.com/api/v2/trace?detail=full"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0CB37A8], "requestWithURL:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v4, "objectForKeyedSubscript:", OSATransformOptionTracerGroup);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (const __CFString *)v10;
    else
      v12 = CFSTR("osatool");
    objc_msgSend(v9, "setValue:forHTTPHeaderField:", v12, CFSTR("X-ST-GroupName"));
    v29 = v8;
    v30 = v6;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "globallyUniqueString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("--%@\r\nContent-Disposition: form-data; name=\"%@\"; filename=\"%@\"\r\nContent-Type: %@\r\n\r\n"),
      v14,
      CFSTR("log_content"),
      CFSTR("tmpname"),
      CFSTR("application/octet-stream"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dataUsingEncoding:", 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendData:", v17);

    objc_msgSend(v15, "appendData:", v3);
    objc_msgSend(CFSTR("\r\n"), "dataUsingEncoding:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendData:", v18);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("--%@--\r\n"), v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dataUsingEncoding:", 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appendData:", v20);

    objc_msgSend(v9, "setTimeoutInterval:", 120.0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("multipart/form-data; boundary=%@"), v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHTTPContentType:", v21);

    objc_msgSend(v9, "setHTTPBody:", v15);
    v22 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __symbolicateSpeedTracer_block_invoke;
    v31[3] = &unk_1E4DEE6B8;
    v33 = &v37;
    v34 = v35;
    v25 = v22;
    v32 = v25;
    objc_msgSend(v24, "dataTaskWithRequest:completionHandler:", v9, v31);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "resume");

    dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
  }
  v27 = (id)v38[5];
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(&v37, 8);
  return v27;
}

void sub_1A4D546DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 136), 8);
  _Unwind_Resume(a1);
}

void __symbolicateSpeedTracer_block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  id v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  _BYTE v32[14];
  __int16 v33;
  int v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v35 = OSATransformResultError;
    v36[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "localizedDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v32 = v14;
      v15 = MEMORY[0x1E0C81028];
      v16 = "speedtracer error response: %@";
LABEL_4:
      _os_log_impl(&dword_1A4D21000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v8;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_msgSend(v17, "statusCode");
        objc_msgSend(MEMORY[0x1E0CB3680], "localizedStringForStatusCode:", objc_msgSend(v17, "statusCode"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v32 = v18;
        *(_WORD *)&v32[4] = 2112;
        *(_QWORD *)&v32[6] = v19;
        v33 = 1024;
        v34 = objc_msgSend(v7, "length");
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "SpeedTracer response %d '%@' received %d bytes\n", buf, 0x18u);

      }
    }
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v20 + 40);
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, &obj);
    v21 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v20 + 40), obj);
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v23 = *(void **)(v22 + 40);
    *(_QWORD *)(v22 + 40) = v21;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (v24)
      {
        v29 = OSATransformResultError;
        v30 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v27 = *(void **)(v26 + 40);
        *(_QWORD *)(v26 + 40) = v25;

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "localizedDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v32 = v14;
          v15 = MEMORY[0x1E0C81028];
          v16 = "failed to extract JSON data from speedtracer result: %@";
          goto LABEL_4;
        }
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_1A4D556F8(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x220], 8);
  _Unwind_Resume(a1);
}

uint64_t OSA_OSX_Legacy_GetUserUUID()
{
  const void *v1;
  const __CFString *v3;
  const __CFString *v4;
  CFPropertyListRef v5;
  const void *v6;
  CFTypeID TypeID;
  const __CFAllocator *v8;
  const __CFUUID *v9;
  const __CFUUID *v10;

  if (!OSA_OSX_Legacy_GetUserUUID___uuid)
  {
    if (_CRGetAnonHostUUID_pred != -1)
      dispatch_once(&_CRGetAnonHostUUID_pred, &__block_literal_global_11);
    v1 = (const void *)_CRGetAnonHostUUID___uuid;
    if (_CRGetAnonHostUUID___uuid)
    {
      CFRetain((CFTypeRef)_CRGetAnonHostUUID___uuid);
      goto LABEL_7;
    }
    v3 = (const __CFString *)*MEMORY[0x1E0C9B260];
    v4 = (const __CFString *)*MEMORY[0x1E0C9B250];
    v5 = CFPreferencesCopyValue(CFSTR("userUUID"), CFSTR("com.apple.CrashReporter"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    if (v5)
    {
      v6 = v5;
      TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(v6))
      {
        v1 = CFRetain(v6);
        CFRelease(v6);
        if (v1)
          goto LABEL_7;
      }
      else
      {
        CFRelease(v6);
      }
    }
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v9 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    if (v9)
    {
      v10 = v9;
      v1 = CFUUIDCreateString(v8, v9);
      CFRelease(v10);
      if (v1)
      {
        CFPreferencesSetValue(CFSTR("userUUID"), v1, CFSTR("com.apple.CrashReporter"), v3, v4);
        CFPreferencesSynchronize(CFSTR("com.apple.CrashReporter"), v3, v4);
LABEL_7:
        while (!__ldaxr((unint64_t *)&OSA_OSX_Legacy_GetUserUUID___uuid))
        {
          if (!__stlxr((unint64_t)v1, (unint64_t *)&OSA_OSX_Legacy_GetUserUUID___uuid))
            return OSA_OSX_Legacy_GetUserUUID___uuid;
        }
        __clrex();
        CFRelease(v1);
      }
    }
  }
  return OSA_OSX_Legacy_GetUserUUID___uuid;
}

CFStringRef _CRCopyAnonHostUUIDPath()
{
  const __CFArray *v0;
  const __CFArray *v1;
  const __CFURL *ValueAtIndex;
  CFIndex v3;
  const __CFURL *v4;
  const __CFURL *v5;
  const __CFArray *v6;
  const __CFURL *v7;
  const __CFAllocator *v8;
  const __CFURL *v9;
  const __CFURL *v10;
  const __CFURL *v11;
  const __CFURL *v12;
  uint64_t v13;
  const __CFUUID *v14;
  const __CFUUID *v15;
  CFStringRef v16;
  CFStringRef v18;
  const __CFString *v20;
  const __CFString *v21;
  const __CFURL *v22;
  const __CFURL *v23;
  stat v24;
  CFUUIDBytes buffer[64];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v0 = (const __CFArray *)CFCopySearchPathForDirectoriesInDomains();
  if (!v0)
    return 0;
  v1 = v0;
  if (CFArrayGetCount(v0) <= 0)
  {
    v6 = v1;
LABEL_24:
    CFRelease(v6);
    return 0;
  }
  ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v1, 0);
  if (CFArrayGetCount(v1) < 1)
    goto LABEL_8;
  v3 = 0;
  while (1)
  {
    v4 = (const __CFURL *)CFArrayGetValueAtIndex(v1, v3);
    if (CFURLGetFileSystemRepresentation(v4, 0, &buffer[0].byte0, 1024))
    {
      memset(&v24, 0, sizeof(v24));
      if (!lstat((const char *)buffer, &v24))
        break;
    }
    if (CFArrayGetCount(v1) <= ++v3)
      goto LABEL_8;
  }
  v7 = (const __CFURL *)CFRetain(v4);
  if (v7)
  {
    v5 = v7;
    CFRelease(v1);
  }
  else
  {
LABEL_8:
    _CRMakeDirectory(ValueAtIndex, 493, 0);
    v5 = (const __CFURL *)CFRetain(ValueAtIndex);
    CFRelease(v1);
    if (!v5)
      return 0;
  }
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, CFSTR("Application Support"), 1u);
  if (!v9)
  {
LABEL_23:
    v6 = v5;
    goto LABEL_24;
  }
  v10 = v9;
  _CRMakeDirectory(v9, 509, 0);
  v11 = CFURLCreateCopyAppendingPathComponent(v8, v10, CFSTR("CrashReporter"), 1u);
  if (!v11)
  {
    CFRelease(v10);
    goto LABEL_23;
  }
  v12 = v11;
  _CRMakeDirectory(v11, 509, 1);
  CFRelease(v10);
  CFRelease(v5);
  v13 = CRGetHostUUID___hostUUIDString;
  if (!CRGetHostUUID___hostUUIDString)
  {
    *(_QWORD *)&buffer[0].byte0 = 0;
    *(_QWORD *)&buffer[0].byte8 = 0;
    *(_QWORD *)&v24.st_dev = 0;
    v24.st_ino = 0;
    if (gethostuuid(&buffer[0].byte0, (const timespec *)&v24) == -1)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        _CRCopyAnonHostUUIDPath_cold_1();
      v13 = 0;
    }
    else
    {
      v14 = CFUUIDCreateFromUUIDBytes(v8, buffer[0]);
      if (v14)
      {
        v15 = v14;
        v16 = CFUUIDCreateString(v8, v14);
        CFRelease(v15);
        while (!__ldaxr((unint64_t *)&CRGetHostUUID___hostUUIDString))
        {
          if (!__stlxr((unint64_t)v16, (unint64_t *)&CRGetHostUUID___hostUUIDString))
            goto LABEL_31;
        }
        __clrex();
        CFRelease(v16);
      }
LABEL_31:
      v13 = CRGetHostUUID___hostUUIDString;
    }
  }
  v20 = CFStringCreateWithFormat(v8, 0, CFSTR("AnonymousIdentifier_%@.plist"), v13);
  if (v20)
  {
    v21 = v20;
    v22 = CFURLCreateCopyAppendingPathComponent(v8, v12, v20, 0);
    if (v22)
    {
      v23 = v22;
      v18 = CFURLCopyFileSystemPath(v22, kCFURLPOSIXPathStyle);
      CFRelease(v23);
    }
    else
    {
      v18 = 0;
    }
    CFRelease(v21);
  }
  else
  {
    v18 = 0;
  }
  CFRelease(v12);
  return v18;
}

uint64_t _CRMakeDirectory(const __CFURL *a1, int a2, int a3)
{
  uint64_t result;
  mode_t v6;
  stat v9;
  UInt8 buffer[1024];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  result = CFURLGetFileSystemRepresentation(a1, 0, buffer, 1024);
  if ((_DWORD)result)
  {
    memset(&v9, 0, sizeof(v9));
    result = stat((const char *)buffer, &v9);
    if ((_DWORD)result)
    {
      v6 = umask(0);
      mkdir((const char *)buffer, a2);
      umask(v6);
      result = geteuid();
      if (a3)
      {
        if (!(_DWORD)result)
          return chown((const char *)buffer, 0xFFFFFFFF, 0x50u);
      }
    }
    else if ((v9.st_mode & 0xF000) == 0x4000 && a3 != 0 && (v9.st_mode & 0x1FF) != a2)
    {
      return chmod((const char *)buffer, a2);
    }
  }
  return result;
}

id OSAGetBootTime()
{
  int v0;
  void *v1;
  size_t v4;
  _QWORD v5[2];
  int v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v6 = 0x1500000001;
  v5[0] = 0;
  v5[1] = 0;
  v4 = 16;
  v0 = sysctl(v6, 2u, v5, &v4, 0, 0);
  v1 = 0;
  if (v0 != -1 && v5[0] != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v5[0]);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

id OSAGetProcessUptime()
{
  void *v0;
  size_t v2;
  _OWORD v3[40];
  int v4[2];
  int v5;
  pid_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v4 = 0xE00000001;
  v5 = 1;
  v6 = getpid();
  memset(v3, 0, 512);
  v2 = 648;
  if (sysctl(v4, 4u, v3, &v2, 0, 0) < 0)
  {
    v0 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)*(uint64_t *)&v3[0]);
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v0;
}

time_t OSADaysSinceEpoch()
{
  time_t result;

  result = time(0);
  if (result >= 0)
    return result / 0x15180uLL;
  return result;
}

BOOL OSARandomSelection(unint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getTaskingKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      a1 = objc_msgSend(v5, "integerValue");
  }
  v6 = a1 > arc4random_uniform(0x2710u);

  return v6;
}

__CFString *OSANSDateFormat(unsigned int a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "timeIntervalSinceReferenceDate");
  return OSADateFormat(a1, v3);
}

double OSATimeIntervalApproximate(double a1)
{
  return floor(a1 / 300.0) * 300.0;
}

void rtcsc_send_realtime(uint64_t a1, uint64_t a2, void *a3)
{
  rtcsc_send_base(a1, a2, a3, 1);
}

void rtcsc_send_base(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  id v7;
  __CFString *v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t v27[8];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[5];
  _QWORD v31[6];

  v31[5] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = CFSTR("osanalytics_logEr");
  switch((int)a1)
  {
    case 2001:
      +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "appleInternal");

      if (v10)
        goto LABEL_5;
      goto LABEL_30;
    case 2002:
      +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "appleInternal");

      if ((v12 & 1) != 0)
      {
LABEL_5:
        v8 = CFSTR("analyticsd_sub");
        if (a4)
          goto LABEL_18;
        goto LABEL_29;
      }
      goto LABEL_30;
    case 2003:
      goto LABEL_17;
    case 2004:
      v8 = CFSTR("osanalytics_jetsam");
      if (!a4)
        goto LABEL_29;
      goto LABEL_18;
    case 2005:
      v8 = CFSTR("osanalytics_crashes");
      if (!a4)
        goto LABEL_29;
      goto LABEL_18;
    case 2006:
      +[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "appleInternal");

      if ((v14 & 1) == 0)
        goto LABEL_30;
      v8 = CFSTR("osanalytics_monitor");
      if (a4)
      {
LABEL_18:
        v15 = v7;
        if (rtc_internal_realtime_onceToken != -1)
          dispatch_once(&rtc_internal_realtime_onceToken, &__block_literal_global_27);
        if (objc_opt_class())
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = getkRTCReportingSessionInfoClientType();
          v31[0] = &unk_1E4DFDD38;
          v30[1] = getkRTCReportingSessionInfoClientVersion();
          v31[1] = &unk_1E4DFDD50;
          v30[2] = getkRTCReportingSessionInfoBatchEvent();
          v31[2] = MEMORY[0x1E0C9AAA0];
          v30[3] = getkRTCReportingSessionInfoSessionID();
          v31[3] = v16;
          v30[4] = getkRTCReportingSessionInfoContainsRealtimeEvents();
          v31[4] = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 5);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v28[0] = getkRTCReportingUserInfoClientName();
          v29[0] = CFSTR("com.apple.CA");
          v28[1] = getkRTCReportingUserInfoServiceName();
          v29[1] = v8;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend((id)rtc_internal_realtime_RTCReportingClass, "sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:", v17, v18, a1, a2, v15, 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v27 = 0;
              _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "RTCReporting Realtime: sendOneMessageWithSessionInfo succeeded", v27, 2u);
            }
          }
          else
          {
            v19 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            if (v19)
              rtcsc_send_base_cold_1(v19, v20, v21, v22, v23, v24, v25, v26);
          }

        }
      }
      else
      {
LABEL_29:
        rtc_internal(0, v8, a1, a2, v7);
      }
LABEL_30:

      return;
    case 2007:
      v8 = CFSTR("osanalytics_monitor_ca_submission");
      if (!a4)
        goto LABEL_29;
      goto LABEL_18;
    case 2008:
      v8 = CFSTR("osanalytics_monitor_hb_diff");
LABEL_17:
      if (a4)
        goto LABEL_18;
      goto LABEL_29;
    case 2009:
      v8 = CFSTR("osanalytics_beacon");
      if (!a4)
        goto LABEL_29;
      goto LABEL_18;
    default:
      goto LABEL_30;
  }
}

void rtcsc_send(uint64_t a1, uint64_t a2, void *a3)
{
  rtcsc_send_base(a1, a2, a3, 0);
}

void rtc_internal(char a1, void *a2, __int16 a3, __int16 a4, void *a5)
{
  id v9;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  id v14;
  __int16 v15;
  __int16 v16;
  char v17;

  v9 = a2;
  v10 = a5;
  if (rtc_internal_onceToken != -1)
    dispatch_once(&rtc_internal_onceToken, &__block_literal_global_44);
  if (objc_opt_class())
  {
    v11 = rtc_internal_rtc_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __rtc_internal_block_invoke_47;
    block[3] = &unk_1E4DEE868;
    v13 = v10;
    v15 = a3;
    v16 = a4;
    v17 = a1;
    v14 = v9;
    dispatch_async(v11, block);

  }
}

void __rtc_internal_realtime_block_invoke()
{
  uint64_t v0;
  _BOOL4 v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (!RTCReportingLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E4DEE800;
    v3 = 0;
    RTCReportingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = RTCReportingLibraryCore_frameworkLibrary;
  v1 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v1)
    {
      LOWORD(v2) = 0;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "linking RTCReporting.framework", (uint8_t *)&v2, 2u);
    }
    rtc_internal_realtime_RTCReportingClass = (uint64_t)getRTCReportingClass();
  }
  else if (v1)
  {
    LOWORD(v2) = 0;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "RTCReporting.framework is unavailable", (uint8_t *)&v2, 2u);
  }
}

id getRTCReportingClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getRTCReportingClass_softClass;
  v7 = getRTCReportingClass_softClass;
  if (!getRTCReportingClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getRTCReportingClass_block_invoke;
    v3[3] = &unk_1E4DEDA88;
    v3[4] = &v4;
    __getRTCReportingClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A4D587E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getkRTCReportingSessionInfoClientType()
{
  void *v0;
  void *v1;
  _Unwind_Exception *ACAccountTypeIdentifierExchange_cold_1;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void *)getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr;
  v7 = getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr;
  if (!getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr)
  {
    v1 = (void *)RTCReportingLibrary();
    v0 = dlsym(v1, "kRTCReportingSessionInfoClientType");
    v5[3] = (uint64_t)v0;
    getkRTCReportingSessionInfoClientTypeSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    ACAccountTypeIdentifierExchange_cold_1 = (_Unwind_Exception *)getACAccountTypeIdentifierExchange_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(ACAccountTypeIdentifierExchange_cold_1);
  }
  return *(_QWORD *)v0;
}

uint64_t getkRTCReportingSessionInfoClientVersion()
{
  void *v0;
  void *v1;
  _Unwind_Exception *ACAccountTypeIdentifierExchange_cold_1;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void *)getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr;
  v7 = getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr;
  if (!getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr)
  {
    v1 = (void *)RTCReportingLibrary();
    v0 = dlsym(v1, "kRTCReportingSessionInfoClientVersion");
    v5[3] = (uint64_t)v0;
    getkRTCReportingSessionInfoClientVersionSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    ACAccountTypeIdentifierExchange_cold_1 = (_Unwind_Exception *)getACAccountTypeIdentifierExchange_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(ACAccountTypeIdentifierExchange_cold_1);
  }
  return *(_QWORD *)v0;
}

uint64_t getkRTCReportingSessionInfoBatchEvent()
{
  void *v0;
  void *v1;
  _Unwind_Exception *ACAccountTypeIdentifierExchange_cold_1;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void *)getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr;
  v7 = getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr;
  if (!getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr)
  {
    v1 = (void *)RTCReportingLibrary();
    v0 = dlsym(v1, "kRTCReportingSessionInfoBatchEvent");
    v5[3] = (uint64_t)v0;
    getkRTCReportingSessionInfoBatchEventSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    ACAccountTypeIdentifierExchange_cold_1 = (_Unwind_Exception *)getACAccountTypeIdentifierExchange_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(ACAccountTypeIdentifierExchange_cold_1);
  }
  return *(_QWORD *)v0;
}

uint64_t getkRTCReportingSessionInfoSessionID()
{
  void *v0;
  void *v1;
  _Unwind_Exception *ACAccountTypeIdentifierExchange_cold_1;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void *)getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr;
  v7 = getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr;
  if (!getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr)
  {
    v1 = (void *)RTCReportingLibrary();
    v0 = dlsym(v1, "kRTCReportingSessionInfoSessionID");
    v5[3] = (uint64_t)v0;
    getkRTCReportingSessionInfoSessionIDSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    ACAccountTypeIdentifierExchange_cold_1 = (_Unwind_Exception *)getACAccountTypeIdentifierExchange_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(ACAccountTypeIdentifierExchange_cold_1);
  }
  return *(_QWORD *)v0;
}

uint64_t getkRTCReportingSessionInfoContainsRealtimeEvents()
{
  void *v0;
  void *v1;
  _Unwind_Exception *ACAccountTypeIdentifierExchange_cold_1;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void *)getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr;
  v7 = getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr;
  if (!getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr)
  {
    v1 = (void *)RTCReportingLibrary();
    v0 = dlsym(v1, "kRTCReportingSessionInfoContainsRealtimeEvents");
    v5[3] = (uint64_t)v0;
    getkRTCReportingSessionInfoContainsRealtimeEventsSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    ACAccountTypeIdentifierExchange_cold_1 = (_Unwind_Exception *)getACAccountTypeIdentifierExchange_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(ACAccountTypeIdentifierExchange_cold_1);
  }
  return *(_QWORD *)v0;
}

uint64_t getkRTCReportingUserInfoClientName()
{
  void *v0;
  void *v1;
  _Unwind_Exception *ACAccountTypeIdentifierExchange_cold_1;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void *)getkRTCReportingUserInfoClientNameSymbolLoc_ptr;
  v7 = getkRTCReportingUserInfoClientNameSymbolLoc_ptr;
  if (!getkRTCReportingUserInfoClientNameSymbolLoc_ptr)
  {
    v1 = (void *)RTCReportingLibrary();
    v0 = dlsym(v1, "kRTCReportingUserInfoClientName");
    v5[3] = (uint64_t)v0;
    getkRTCReportingUserInfoClientNameSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    ACAccountTypeIdentifierExchange_cold_1 = (_Unwind_Exception *)getACAccountTypeIdentifierExchange_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(ACAccountTypeIdentifierExchange_cold_1);
  }
  return *(_QWORD *)v0;
}

uint64_t getkRTCReportingUserInfoServiceName()
{
  void *v0;
  void *v1;
  _Unwind_Exception *ACAccountTypeIdentifierExchange_cold_1;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (void *)getkRTCReportingUserInfoServiceNameSymbolLoc_ptr;
  v7 = getkRTCReportingUserInfoServiceNameSymbolLoc_ptr;
  if (!getkRTCReportingUserInfoServiceNameSymbolLoc_ptr)
  {
    v1 = (void *)RTCReportingLibrary();
    v0 = dlsym(v1, "kRTCReportingUserInfoServiceName");
    v5[3] = (uint64_t)v0;
    getkRTCReportingUserInfoServiceNameSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    ACAccountTypeIdentifierExchange_cold_1 = (_Unwind_Exception *)getACAccountTypeIdentifierExchange_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(ACAccountTypeIdentifierExchange_cold_1);
  }
  return *(_QWORD *)v0;
}

Class __getRTCReportingClass_block_invoke(uint64_t a1)
{
  Class result;

  RTCReportingLibrary();
  result = objc_getClass("RTCReporting");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRTCReportingClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getRTCReportingClass_block_invoke_cold_1();
    return (Class)RTCReportingLibrary();
  }
  return result;
}

uint64_t RTCReportingLibrary()
{
  uint64_t v0;
  void *v2;

  if (!RTCReportingLibraryCore_frameworkLibrary)
    RTCReportingLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = RTCReportingLibraryCore_frameworkLibrary;
  if (!RTCReportingLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void __rtc_internal_block_invoke()
{
  uint64_t v0;
  _BOOL4 v1;
  NSObject *v2;
  dispatch_queue_t v3;
  void *v4;
  dispatch_semaphore_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!RTCReportingLibraryCore_frameworkLibrary)
  {
    v9 = xmmword_1E4DEE800;
    v10 = 0;
    RTCReportingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = RTCReportingLibraryCore_frameworkLibrary;
  v1 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v1)
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "linking RTCReporting.framework", (uint8_t *)&v9, 2u);
    }
    rtc_internal_RTCReportingClass = (uint64_t)getRTCReportingClass();
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = dispatch_queue_create("com.apple.OSAnalytics.RTCReporter", v2);
    v4 = (void *)rtc_internal_rtc_queue;
    rtc_internal_rtc_queue = (uint64_t)v3;

    v5 = dispatch_semaphore_create(1);
    v6 = (void *)rtc_internal_cfg_semaphore;
    rtc_internal_cfg_semaphore = (uint64_t)v5;

    v7 = objc_opt_new();
    v8 = (void *)rtc_internal_queued_events;
    rtc_internal_queued_events = v7;

  }
  else if (v1)
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "RTCReporting.framework is unavailable", (uint8_t *)&v9, 2u);
  }
}

void __rtc_internal_block_invoke_47(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __objc2_class *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int16 v17;
  void *v18;
  unsigned __int16 v19;
  void *v20;
  dispatch_time_t isa;
  void *v22;
  dispatch_time_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  _BOOL8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id obj;
  _QWORD v41[4];
  id v42;
  id v43;
  int v44;
  _QWORD block[4];
  id v46;
  uint8_t v47[16];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[5];
  _QWORD v55[5];
  uint8_t v56[128];
  uint8_t buf[4];
  uint64_t v58;
  _QWORD v59[5];

  v1 = a1;
  v59[3] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) && (unint64_t)objc_msgSend((id)rtc_internal_queued_events, "count") <= 0x63)
  {
    v2 = (void *)rtc_internal_queued_events;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(v1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = v3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)(v1 + 50));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(v1 + 32);
    v59[1] = v4;
    v59[2] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
  if (dispatch_semaphore_wait((dispatch_semaphore_t)rtc_internal_cfg_semaphore, 0))
  {
    if (*(_QWORD *)(v1 + 32))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        __rtc_internal_block_invoke_47_cold_3();
    }
  }
  else
  {
    v7 = rtc_internal_rtc_reporter;
    v8 = objc_msgSend((id)rtc_internal_queued_events, "count");
    if (v7)
    {
      v9 = OSADiagnosticsReporterSupport;
      if (v8)
      {
        v39 = v1;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v58 = objc_msgSend((id)rtc_internal_queued_events, "count");
          _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "processing %zu events from queue", buf, 0xCu);
        }
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        obj = (id)rtc_internal_queued_events;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v49;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v49 != v12)
                objc_enumerationMutation(obj);
              v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
              v15 = (void *)rtc_internal_rtc_reporter;
              objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "intValue");
              objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend(v18, "intValue");
              objc_msgSend(v14, "objectAtIndexedSubscript:", 2);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "sendMessageWithCategory:type:payload:error:", v17, v19, v20, 0);

              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                __rtc_internal_block_invoke_47_cold_2(buf, v14, &v58);
            }
            v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          }
          while (v11);
        }

        objc_msgSend((id)rtc_internal_queued_events, "removeAllObjects");
        v9 = OSADiagnosticsReporterSupport;
        rtc_internal_lastSend = dispatch_time(0, 0);
        v1 = v39;
      }
      if (*(_BYTE *)(v1 + 52))
      {
        rtc_internal_release_pending = 0;
        isa = (dispatch_time_t)v9[24].isa;
        if (isa <= dispatch_time(0, -10000000000))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v47 = 0;
            _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "releasing RTCReporting", v47, 2u);
          }
          v22 = (void *)rtc_internal_rtc_reporter;
          rtc_internal_rtc_reporter = 0;

        }
      }
      if (rtc_internal_rtc_reporter && (rtc_internal_release_pending & 1) == 0)
      {
        rtc_internal_release_pending = 1;
        v23 = dispatch_time((dispatch_time_t)v9[24].isa, 10000000000);
        v24 = rtc_internal_rtc_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __rtc_internal_block_invoke_49;
        block[3] = &unk_1E4DED7B8;
        v46 = *(id *)(v1 + 40);
        dispatch_after(v23, v24, block);

      }
      dispatch_semaphore_signal((dispatch_semaphore_t)rtc_internal_cfg_semaphore);
    }
    else if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "intializing RTCReporting...", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", arc4random());
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = getkRTCReportingSessionInfoClientType();
      v55[0] = &unk_1E4DFDD38;
      v54[1] = getkRTCReportingSessionInfoClientVersion();
      v55[1] = &unk_1E4DFDD50;
      v54[2] = getkRTCReportingSessionInfoBatchEvent();
      v55[2] = MEMORY[0x1E0C9AAB0];
      v54[3] = getkRTCReportingSessionInfoSessionID();
      v55[3] = v25;
      v54[4] = getkRTCReportingSessionInfoContainsRealtimeEvents();
      v55[4] = MEMORY[0x1E0C9AAA0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 5);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = getkRTCReportingUserInfoClientName();
      v53[0] = CFSTR("com.apple.CA");
      v52[1] = getkRTCReportingUserInfoServiceName();
      v53[1] = *(_QWORD *)(v1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(objc_alloc((Class)rtc_internal_RTCReportingClass), "initWithSessionInfo:userInfo:frameworksToCheck:", v26, v27, 0);
      v29 = (void *)rtc_internal_rtc_reporter;
      rtc_internal_rtc_reporter = v28;

      v30 = (void *)rtc_internal_rtc_reporter;
      if (rtc_internal_rtc_reporter)
      {
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __rtc_internal_block_invoke_50;
        v41[3] = &unk_1E4DEE840;
        v42 = v25;
        v43 = *(id *)(v1 + 40);
        v44 = *(_DWORD *)(v1 + 48);
        objc_msgSend(v30, "startConfigurationWithCompletionHandler:", v41);

      }
      else
      {
        v31 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v31)
          __rtc_internal_block_invoke_47_cold_1(v31, v32, v33, v34, v35, v36, v37, v38);
        dispatch_semaphore_signal((dispatch_semaphore_t)rtc_internal_cfg_semaphore);
      }

    }
  }
}

uint64_t __rtc_internal_block_invoke_49(uint64_t a1)
{
  return rtc_internal(1, *(_QWORD *)(a1 + 32), 0, 0, 0);
}

void __rtc_internal_block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "intValue");
      v14[0] = 67109120;
      v14[1] = v4;
      _os_log_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "configured RTCReporting with session id: %d", (uint8_t *)v14, 8u);
    }
    rtc_internal(0, *(_QWORD *)(a1 + 40), *(unsigned __int16 *)(a1 + 48), *(unsigned __int16 *)(a1 + 50), 0);
  }
  else
  {
    v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v5)
      __rtc_internal_block_invoke_50_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    v13 = (void *)rtc_internal_rtc_reporter;
    rtc_internal_rtc_reporter = 0;

  }
  dispatch_semaphore_signal((dispatch_semaphore_t)rtc_internal_cfg_semaphore);

}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1A4D599DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id OSASandboxExtensionForUserSubmissionDirectory(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v7;

  v1 = a1;
  objc_msgSend(CFSTR("~/Library/Logs/DiagnosticReports/"), "stringByExpandingTildeInPath");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (void *)objc_msgSend(v2, "UTF8String");

  if (v3)
  {
    v4 = sandbox_extension_issue_file();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      free(v5);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        OSASandboxExtensionForUserSubmissionDirectory_cold_1();
      if (*__error() == 1)
      {
        v7 = v1;
        AnalyticsSendEventLazy();

      }
      v3 = 0;
    }
  }

  return v3;
}

void OSASandboxConsumeExtension(void *a1, void *a2)
{
  void (**v3)(_QWORD);

  v3 = a2;
  if (!objc_msgSend(objc_retainAutorelease(a1), "UTF8String"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      OSASandboxConsumeExtension_cold_1();
    goto LABEL_10;
  }
  if (sandbox_extension_consume() < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      OSASandboxConsumeExtension_cold_2();
LABEL_10:
    v3[2](v3);
    goto LABEL_11;
  }
  v3[2](v3);
  if ((sandbox_extension_release() & 0x80000000) != 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    OSASandboxConsumeExtension_cold_3();
LABEL_11:

}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

int *OUTLINED_FUNCTION_3_0()
{
  return __error();
}

uint64_t __xpc2ns_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  xpc2ns(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  return 1;
}

uint64_t mach_exception_raise(mach_port_t a1, int a2, int a3, int a4, uint64_t a5, unsigned int a6)
{
  uint64_t v6;
  int v9;
  mach_port_t reply_port;
  uint64_t v11;
  mach_msg_header_t rcv_name;
  int v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v19 = 0;
  v18 = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  v14 = 2;
  v15 = a2;
  DWORD1(v16) = 1245184;
  DWORD2(v16) = a3;
  LODWORD(v17) = 1245184;
  *(_QWORD *)((char *)&v17 + 4) = *MEMORY[0x1E0C804E8];
  HIDWORD(v17) = a4;
  if (a6 > 2)
    return 4294966989;
  v9 = 8 * a6;
  __memcpy_chk();
  LODWORD(v18) = a6;
  reply_port = mig_get_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = reply_port;
  rcv_name.msgh_bits = -2147478253;
  *(_QWORD *)&rcv_name.msgh_voucher_port = 0x96500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&rcv_name);
    reply_port = rcv_name.msgh_local_port;
  }
  v11 = mach_msg(&rcv_name, 3, v9 + 68, 0x2Cu, reply_port, 0, 0);
  v6 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(rcv_name.msgh_local_port);
    return v6;
  }
  if ((_DWORD)v11)
  {
    mig_dealloc_reply_port(rcv_name.msgh_local_port);
    return v6;
  }
  if (rcv_name.msgh_id == 71)
  {
    v6 = 4294966988;
LABEL_19:
    mach_msg_destroy(&rcv_name);
    return v6;
  }
  if (rcv_name.msgh_id != 2505)
  {
    v6 = 4294966995;
    goto LABEL_19;
  }
  v6 = 4294966996;
  if ((rcv_name.msgh_bits & 0x80000000) != 0)
    goto LABEL_19;
  if (rcv_name.msgh_size != 36)
    goto LABEL_19;
  if (rcv_name.msgh_remote_port)
    goto LABEL_19;
  v6 = v16;
  if ((_DWORD)v16)
    goto LABEL_19;
  return v6;
}

uint64_t mach_exception_raise_state(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  mach_port_name_t v9;
  unsigned int v10;
  mach_port_name_t *v11;
  const void *v12;
  unsigned int v13;
  void *v14;
  int v15;
  void *v16;
  unsigned int v17;
  const void *v18;
  mach_port_name_t *v19;
  unsigned int v20;
  mach_port_name_t v21;
  uint64_t v22;
  mach_port_name_t *v23;
  uint64_t v24;
  char *v26;
  int v27;
  mach_port_name_t reply_port;
  uint64_t v29;
  BOOL v30;
  int v32;
  size_t v33;
  mach_port_name_t rcv_name[4];
  __int128 v35;
  _OWORD v36[326];

  v9 = MEMORY[0x1E0C80A78]();
  memset(v36, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v35 = 0u;
  *((_QWORD *)&v35 + 1) = *MEMORY[0x1E0C804E8];
  LODWORD(v36[0]) = v15;
  if (v10 <= 2)
  {
    v16 = v14;
    v17 = v13;
    v18 = v12;
    v19 = v11;
    v20 = v10;
    v21 = v9;
    v22 = 2 * v10;
    __memcpy_chk();
    DWORD1(v36[0]) = v20;
    v23 = &rcv_name[v22];
    rcv_name[v22 + 10] = *v19;
    if (v17 <= 0x510)
    {
      v26 = (char *)(v23 - 4);
      v27 = v22 * 4 + 4 * v17;
      memcpy(v23 + 12, v18, 4 * v17);
      *((_DWORD *)v26 + 15) = v17;
      reply_port = mig_get_reply_port();
      rcv_name[2] = v21;
      rcv_name[3] = reply_port;
      rcv_name[0] = 5395;
      *(_QWORD *)&v35 = 0x96600000000;
      if (MEMORY[0x1E0C85B60])
      {
        voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
        reply_port = rcv_name[3];
      }
      v29 = mach_msg((mach_msg_header_t *)rcv_name, 3, v27 + 48, 0x1474u, reply_port, 0, 0);
      v24 = v29;
      if ((v29 - 268435458) <= 0xE && ((1 << (v29 - 2)) & 0x4003) != 0)
      {
        mig_put_reply_port(rcv_name[3]);
        return v24;
      }
      if ((_DWORD)v29)
      {
        mig_dealloc_reply_port(rcv_name[3]);
        return v24;
      }
      if (DWORD1(v35) == 71)
      {
        v24 = 4294966988;
      }
      else if (DWORD1(v35) == 2506)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] - 5229 <= 0xFFFFEBBE)
          {
            if (rcv_name[2])
              v30 = 1;
            else
              v30 = LODWORD(v36[0]) == 0;
            if (!v30 && rcv_name[1] == 36)
              v24 = LODWORD(v36[0]);
            else
              v24 = 4294966996;
            goto LABEL_29;
          }
          if (!rcv_name[2])
          {
            v24 = LODWORD(v36[0]);
            if (LODWORD(v36[0]))
              goto LABEL_29;
            v32 = DWORD2(v36[0]);
            if (DWORD2(v36[0]) <= 0x510 && DWORD2(v36[0]) <= (rcv_name[1] - 44) >> 2)
            {
              v33 = 4 * DWORD2(v36[0]);
              if (rcv_name[1] == 4 * DWORD2(v36[0]) + 44)
              {
                *v19 = DWORD1(v36[0]);
                memcpy(v16, (char *)v36 + 12, v33);
                v24 = 0;
                *a9 = v32;
                return v24;
              }
            }
          }
        }
        v24 = 4294966996;
      }
      else
      {
        v24 = 4294966995;
      }
LABEL_29:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v24;
    }
  }
  return 4294966989;
}

uint64_t mach_exception_raise_state_identity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9, void *a10, _DWORD *a11)
{
  mach_port_t v11;
  unsigned int v12;
  _DWORD *v13;
  const void *v14;
  int v15;
  int v16;
  int v17;
  const void *v18;
  _DWORD *v19;
  unsigned int v20;
  mach_port_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v26;
  int v27;
  mach_port_t reply_port;
  uint64_t v29;
  BOOL v30;
  int v32;
  size_t v33;
  mach_msg_header_t rcv_name;
  int v35;
  int v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;

  v11 = MEMORY[0x1E0C80A78]();
  v67 = *MEMORY[0x1E0C80C00];
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  v35 = 2;
  v36 = v15;
  DWORD1(v37) = 1245184;
  DWORD2(v37) = v16;
  LODWORD(v38) = 1245184;
  *(_QWORD *)((char *)&v38 + 4) = *MEMORY[0x1E0C804E8];
  HIDWORD(v38) = v17;
  if (v12 <= 2)
  {
    v18 = v14;
    v19 = v13;
    v20 = v12;
    v21 = v11;
    v22 = 8 * v12;
    __memcpy_chk();
    LODWORD(v39) = v20;
    v23 = (char *)&rcv_name + v22;
    *(_DWORD *)((char *)&rcv_name + v22 + 68) = *v19;
    if (a9 <= 0x510)
    {
      v26 = v23 - 16;
      v27 = v22 + 4 * a9;
      memcpy(v23 + 76, v18, 4 * a9);
      *((_DWORD *)v26 + 22) = a9;
      reply_port = mig_get_reply_port();
      rcv_name.msgh_remote_port = v21;
      rcv_name.msgh_local_port = reply_port;
      rcv_name.msgh_bits = -2147478253;
      *(_QWORD *)&rcv_name.msgh_voucher_port = 0x96700000000;
      if (MEMORY[0x1E0C85B60])
      {
        voucher_mach_msg_set(&rcv_name);
        reply_port = rcv_name.msgh_local_port;
      }
      v29 = mach_msg(&rcv_name, 3, v27 + 76, 0x1474u, reply_port, 0, 0);
      v24 = v29;
      if ((v29 - 268435458) <= 0xE && ((1 << (v29 - 2)) & 0x4003) != 0)
      {
        mig_put_reply_port(rcv_name.msgh_local_port);
        return v24;
      }
      if ((_DWORD)v29)
      {
        mig_dealloc_reply_port(rcv_name.msgh_local_port);
        return v24;
      }
      if (rcv_name.msgh_id == 71)
      {
        v24 = 4294966988;
      }
      else if (rcv_name.msgh_id == 2507)
      {
        if ((rcv_name.msgh_bits & 0x80000000) == 0)
        {
          if (rcv_name.msgh_size - 5229 <= 0xFFFFEBBE)
          {
            if (rcv_name.msgh_remote_port)
              v30 = 1;
            else
              v30 = (_DWORD)v37 == 0;
            if (!v30 && rcv_name.msgh_size == 36)
              v24 = v37;
            else
              v24 = 4294966996;
            goto LABEL_29;
          }
          if (!rcv_name.msgh_remote_port)
          {
            v24 = v37;
            if ((_DWORD)v37)
              goto LABEL_29;
            v32 = DWORD2(v37);
            if (DWORD2(v37) <= 0x510 && DWORD2(v37) <= (rcv_name.msgh_size - 44) >> 2)
            {
              v33 = 4 * DWORD2(v37);
              if (rcv_name.msgh_size == 4 * DWORD2(v37) + 44)
              {
                *v19 = DWORD1(v37);
                memcpy(a10, (char *)&v37 + 12, v33);
                v24 = 0;
                *a11 = v32;
                return v24;
              }
            }
          }
        }
        v24 = 4294966996;
      }
      else
      {
        v24 = 4294966995;
      }
LABEL_29:
      mach_msg_destroy(&rcv_name);
      return v24;
    }
  }
  return 4294966989;
}

uint64_t rc_sync_request(int a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  mach_port_name_t reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int msg;
  _BYTE msg_4[48];

  memset(&msg_4[16], 0, 32);
  *(_OWORD *)msg_4 = 0u;
  *(_QWORD *)&msg_4[20] = *MEMORY[0x1E0C804E8];
  *(_QWORD *)&msg_4[28] = a2;
  *(_QWORD *)&msg_4[36] = a3;
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg_4[4] = a1;
  *(_DWORD *)&msg_4[8] = reply_port;
  msg = 5395;
  *(_QWORD *)&msg_4[12] = 0x96B00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    reply_port = *(_DWORD *)&msg_4[8];
  }
  v7 = mach_msg((mach_msg_header_t *)&msg, 3, 0x30u, 0x34u, reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v7)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg_4[8]);
      return v8;
    }
    if (*(_DWORD *)&msg_4[16] == 71)
    {
      v8 = 4294966988;
    }
    else if (*(_DWORD *)&msg_4[16] == 2511)
    {
      if ((msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)msg_4 == 44)
        {
          if (!*(_DWORD *)&msg_4[4])
          {
            v8 = *(unsigned int *)&msg_4[28];
            if (!*(_DWORD *)&msg_4[28])
            {
              *a4 = *(_QWORD *)&msg_4[32];
              return v8;
            }
            goto LABEL_23;
          }
        }
        else if (*(_DWORD *)msg_4 == 36)
        {
          if (*(_DWORD *)&msg_4[4])
            v9 = 1;
          else
            v9 = *(_DWORD *)&msg_4[28] == 0;
          if (v9)
            v8 = 4294966996;
          else
            v8 = *(unsigned int *)&msg_4[28];
          goto LABEL_23;
        }
      }
      v8 = 4294966996;
    }
    else
    {
      v8 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)&msg);
    return v8;
  }
  mig_put_reply_port(*(mach_port_t *)&msg_4[8]);
  return v8;
}

void SimulateCrash_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_fault_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v1, 0xCu);
}

void SimulateCrash_cold_2()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "SimulateCrash() on another process is not supported", v0, 2u);
}

uint64_t __getOSADiagnosticsReporterClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getDiagnosticsReporterLaunchOptionsClass_block_invoke_cold_1(v0);
}

uint64_t __getDiagnosticsReporterLaunchOptionsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return +[OSATasking applyTasking:taskId:fromBlob:].cold.1(v0);
}

void matchSelector_cold_1(char a1, uint64_t a2, uint64_t a3)
{
  const char *v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = " nope";
  v4 = 136315650;
  if ((a1 & 1) != 0)
    v3 = "MATCH";
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  v8 = 2112;
  v9 = a3;
  _os_log_debug_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s: %@ vs %@", (uint8_t *)&v4, 0x20u);
}

uint64_t getACAccountTypeIdentifierExchange_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __37__OSASystemConfiguration_internalKey__block_invoke_267_cold_2(v0);
}

void __getACAccountStoreClass_block_invoke_cold_1()
{
  void *v0;

  v0 = (void *)abort_report_np();
  __OSASanitizePath_block_invoke_cold_1(v0);
}

void getVolumes_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "componentsJoinedByString:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1A4D21000, MEMORY[0x1E0C81028], v2, "%@:\n%@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_2();
}

void logForAppleCare_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "componentsJoinedByString:", CFSTR(","));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2(&dword_1A4D21000, MEMORY[0x1E0C81028], v2, "AppleCareSupport: event \"%@\"", v3, v4, v5, v6, 2u);

}

void openR3_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "AppleCareSupport: existing log is valid, %s", a5, a6, a7, a8, 2u);
}

void purgeR3Logs_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "AppleCareSupport: scanning '%s'", a5, a6, a7, a8, 2u);
}

void OSASafeOpen_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "'%{public}s' is not safe because it has at least one hard link", a5, a6, a7, a8, 2u);
}

void OSASafeOpen_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "Failed to stat '%{public}s'", a5, a6, a7, a8, 2u);
}

void OSASafeOpen_cold_3(uint64_t a1)
{
  int *v2;
  char *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = __error();
  v3 = strerror(*v2);
  v4 = 136446466;
  v5 = a1;
  v6 = 2082;
  v7 = v3;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to safely open '%{public}s': %{public}s", (uint8_t *)&v4, 0x16u);
}

void OSASafeCreateDirectory_cold_1(uint8_t *a1, void *a2, _QWORD *a3)
{
  void *v5;

  objc_msgSend(a2, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a3 = v5;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to set file protection class while creating %{public}@", a1, 0xCu);

}

void _CRCopyAnonHostUUIDPath_cold_1()
{
  int v0;
  int *v1;
  char *v2;
  _DWORD v3[2];
  __int16 v4;
  char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v0 = *__error();
  v1 = __error();
  v2 = strerror(*v1);
  v3[0] = 67109378;
  v3[1] = v0;
  v4 = 2080;
  v5 = v2;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to determine UUID for host. Error: %d %s", (uint8_t *)v3, 0x12u);
}

void rtcsc_send_base_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "RTCReporting Realtime: sendOneMessageWithSessionInfo failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __getRTCReportingClass_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = abort_report_np();
  __rtc_internal_block_invoke_47_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

void __rtc_internal_block_invoke_47_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "error configuring RTCReporting; initWithSessionInfo failed",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_4();
}

void __rtc_internal_block_invoke_47_cold_2(uint8_t *a1, void *a2, _QWORD *a3)
{
  void *v5;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v5;
  _os_log_debug_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "sent RTCReporting %@", a1, 0xCu);

}

void __rtc_internal_block_invoke_47_cold_3()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "event queued pending RTCReporting intialization", v0, 2u);
  OUTLINED_FUNCTION_4();
}

void __rtc_internal_block_invoke_50_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "error configuring RTCReporting", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void OSASandboxExtensionForUserSubmissionDirectory_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  v0 = __error();
  OUTLINED_FUNCTION_11(v0);
  OUTLINED_FUNCTION_0_5(&dword_1A4D21000, MEMORY[0x1E0C81028], v1, "Error issuing sandbox extension: %i (%s)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void OSASandboxConsumeExtension_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1A4D21000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Sandbox extension token was missing.", v0, 2u);
}

void OSASandboxConsumeExtension_cold_2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  v0 = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11(v0);
  __error();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1A4D21000, MEMORY[0x1E0C81028], v1, "Failed to consume sandbox extension: %s (%i)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void OSASandboxConsumeExtension_cold_3()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  v0 = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11(v0);
  __error();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_5(&dword_1A4D21000, MEMORY[0x1E0C81028], v1, "Failed to release sandbox extension: %s (%i)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98000](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0C98180](bundle, key);
}

uint64_t CFCopySearchPathForDirectoriesInDomains()
{
  return MEMORY[0x1E0C98370]();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AE0](allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x1E0C98B10](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B48](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C990E0](string, buffer, maxBufLen);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x1E0C99128](string);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99380](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1E0C99530](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

uint64_t CSIsNull()
{
  return MEMORY[0x1E0D19FB8]();
}

uint64_t CSRelease()
{
  return MEMORY[0x1E0D1A018]();
}

uint64_t CSSymbolGetName()
{
  return MEMORY[0x1E0D1A088]();
}

uint64_t CSSymbolicatorCreateWithMachKernel()
{
  return MEMORY[0x1E0D1A200]();
}

uint64_t CSSymbolicatorGetSymbolWithAddressAtTime()
{
  return MEMORY[0x1E0D1A350]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x1E0CB3428]();
}

uint64_t OSKextCopyLoadedKextInfo()
{
  return MEMORY[0x1E0CBBA48]();
}

uint64_t OSThermalNotificationCurrentLevel()
{
  return MEMORY[0x1E0C80688]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1E0C99F70]();
}

uint64_t _CFBundleCreateWithExecutableURLIfLooksLikeBundle()
{
  return MEMORY[0x1E0C99FF8]();
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x1E0C9A0C8]();
}

uint64_t _CFPreferencesAppSynchronizeWithContainer()
{
  return MEMORY[0x1E0C9A300]();
}

uint64_t _CFPreferencesCopyAppValueWithContainer()
{
  return MEMORY[0x1E0C9A308]();
}

uint64_t _CFPreferencesGetUserIdentifierForUID()
{
  return MEMORY[0x1E0C9A340]();
}

uint64_t _CFPreferencesSetAppValueWithContainer()
{
  return MEMORY[0x1E0C9A378]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1E0C80BE8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t _dyld_process_info_create()
{
  return MEMORY[0x1E0C80EF8]();
}

uint64_t _dyld_process_info_for_each_image()
{
  return MEMORY[0x1E0C80F00]();
}

uint64_t _dyld_process_info_release()
{
  return MEMORY[0x1E0C80F40]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void arc4random_addrandom(unsigned __int8 *a1, int a2)
{
  MEMORY[0x1E0C81578](a1, *(_QWORD *)&a2);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C81580](__buf, __nbytes);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C82640](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1E0C82A90]();
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x1E0DE92B0](crc, buf, *(_QWORD *)&len);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1E0C83030](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_shared_cache_iterate_text()
{
  return MEMORY[0x1E0C831A0]();
}

void endpwent(void)
{
  MEMORY[0x1E0C831C8]();
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C832D0](*(_QWORD *)&a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C832E0](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1E0C83318](*(_QWORD *)&a1, a2);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C833A8](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
}

ssize_t flistxattr(int fd, char *namebuff, size_t size, int options)
{
  return MEMORY[0x1E0C833F8](*(_QWORD *)&fd, namebuff, size, *(_QWORD *)&options);
}

const char *__cdecl fmtcheck(const char *a1, const char *a2)
{
  return (const char *)MEMORY[0x1E0C83450](a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83548](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

gid_t getegid(void)
{
  return MEMORY[0x1E0C83658]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

gid_t getgid(void)
{
  return MEMORY[0x1E0C83678]();
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1E0C836C0](a1, a2);
}

int getmntinfo(statfs **a1, int a2)
{
  return MEMORY[0x1E0C836F8](a1, *(_QWORD *)&a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1E0C83790](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83840](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

kern_return_t host_check_multiuser_mode(host_t host, uint32_t *multiuser_mode)
{
  return MEMORY[0x1E0C83898](*(_QWORD *)&host, multiuser_mode);
}

kern_return_t host_statistics64(host_t host_priv, host_flavor_t flavor, host_info64_t host_info64_out, mach_msg_type_number_t *host_info64_outCnt)
{
  return MEMORY[0x1E0C838E0](*(_QWORD *)&host_priv, *(_QWORD *)&flavor, host_info64_out, host_info64_outCnt);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1E0C83BA8](a1);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C83C90]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1E0C83DD0](*(_QWORD *)&target, address, size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1E0C840A8]();
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C840E8](*(_QWORD *)&reply_port);
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C84100]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C84110](*(_QWORD *)&reply_port);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x1E0C84168](*(_QWORD *)&a1, a2, a3);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1E0C841A0](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1E0C844A0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1E0C84A08]();
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x1E0C84A10]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1E0C850B8](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int renameatx_np(int a1, const char *a2, int a3, const char *a4, unsigned int a5)
{
  return MEMORY[0x1E0C85110](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C853A0](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

uint64_t stackshot_capture_with_config()
{
  return MEMORY[0x1E0C854A8]();
}

uint64_t stackshot_config_create()
{
  return MEMORY[0x1E0C854B0]();
}

uint64_t stackshot_config_dealloc()
{
  return MEMORY[0x1E0C854B8]();
}

uint64_t stackshot_config_get_stackshot_buffer()
{
  return MEMORY[0x1E0C854C0]();
}

uint64_t stackshot_config_get_stackshot_size()
{
  return MEMORY[0x1E0C854C8]();
}

uint64_t stackshot_config_set_flags()
{
  return MEMORY[0x1E0C854D0]();
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

uint64_t task_read_for_pid()
{
  return MEMORY[0x1E0C85858]();
}

kern_return_t task_threads(task_inspect_t target_task, thread_act_array_t *act_list, mach_msg_type_number_t *act_listCnt)
{
  return MEMORY[0x1E0C858A0](*(_QWORD *)&target_task, act_list, act_listCnt);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1E0C858F8](*(_QWORD *)&target_act, *(_QWORD *)&flavor, thread_info_out, thread_info_outCnt);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x1E0C85998](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return MEMORY[0x1E0C859C0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int utimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x1E0C859F8](a1, a2);
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x1E0C85A00](uu);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C85A30](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A48](uu, out);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1E0C85F90](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

xpc_object_t xpc_date_create(int64_t interval)
{
  return (xpc_object_t)MEMORY[0x1E0C861B8](interval);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1E0C861D0](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86230](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x1E0C863F0](connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1E0C867C8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1E0C867D0]();
}

