uint64_t sysdir_start_search_path_enumeration_private(int a1, int a2)
{
  return NSStartSearchPathEnumerationStatic(a1, a2, 0);
}

uint64_t _set_user_dir_suffix(char *__s)
{
  size_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  size_t v6;
  char *v7;
  int v8;

  if (qword_1ECD2BD00 == -1)
  {
    if (!__s)
    {
LABEL_30:
      if (!qword_1ECD2BD70)
        return 1;
      free((void *)qword_1ECD2BD70);
      qword_1ECD2BD70 = 0;
      if (!qword_1ECD2BD68 || !*(_BYTE *)qword_1ECD2BD68)
        return 1;
      v4 = 1;
      setenv("TMPDIR", (const char *)qword_1ECD2BD68, 1);
      return v4;
    }
  }
  else
  {
    _os_once();
    if (!__s)
      goto LABEL_30;
  }
  if (!*__s)
    goto LABEL_30;
  v2 = strlen(__s);
  if (strnstr(__s, "/../", v2))
  {
LABEL_5:
    if (_log_onceToken != -1)
      dispatch_once(&_log_onceToken, &__block_literal_global_9);
    v3 = _log_log;
    if (os_log_type_enabled((os_log_t)_log_log, OS_LOG_TYPE_ERROR))
      _set_user_dir_suffix_cold_1(v3);
    goto LABEL_9;
  }
  if (v2 == 2)
  {
    if (*__s == 46)
    {
      v5 = __s[1];
      goto LABEL_13;
    }
  }
  else if (v2 >= 3)
  {
    if (*__s == 46 && __s[1] == 46 && __s[2] == 47)
      goto LABEL_5;
    if (__s[v2 - 3] == 47 && __s[v2 - 2] == 46)
    {
      v5 = __s[v2 - 1];
LABEL_13:
      if (v5 == 46)
        goto LABEL_5;
    }
  }
  if (qword_1ECD2BD70)
  {
    free((void *)qword_1ECD2BD70);
    qword_1ECD2BD70 = 0;
  }
  v6 = strlen(__s) + 2;
  v4 = 1;
  v7 = (char *)malloc_type_calloc(v6, 1uLL, 0x100004077774924uLL);
  qword_1ECD2BD70 = (uint64_t)v7;
  if (__s[strlen(__s) - 1] == 47)
    v8 = snprintf(v7, v6, "%s");
  else
    v8 = snprintf(v7, v6, "%s/");
  if (v6 <= v8)
  {
    free((void *)qword_1ECD2BD70);
    qword_1ECD2BD70 = 0;
LABEL_9:
    v4 = 0;
    *__error() = 22;
  }
  return v4;
}

char *nextRoot_init()
{
  char *v0;
  char *result;

  if ((dyld_process_is_restricted() & 1) != 0)
    v0 = 0;
  else
    v0 = getenv("NEXT_ROOT");
  if (!v0)
    v0 = (char *)&unk_18A0EEB87;
  result = strdup(v0);
  qword_1ECD2BCF8 = (uint64_t)result;
  return result;
}

char *_dirhelper_relative(int a1)
{
  if (a1)
    abort();
  getuid();
  return _dirhelper_relative_internal();
}

uint64_t NSStartSearchPathEnumerationStatic(int a1, int a2, int a3)
{
  unsigned int v4;
  uint64_t result;
  int v6;
  int v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  BOOL v11;

  v4 = a1 - 1;
  if ((a1 - 1) < 0x16
    || (result = 0, (a1 & 0xFFFFFFFE) == 0x64) && (v4 = a1 - 78, ((a1 - 78) & 0x80000000) == 0))
  {
    v6 = a2 & ~a3 & 0x1FFF;
    v7 = 1032;
    if (v6 != 1032)
    {
      v7 = a2 & ~a3 & 0x1FFF;
      if ((a2 & ~a3 & 0x408) == 8)
      {
        if (_os_feature_enabled_impl())
        {
          v7 = v6 | 0x400;
        }
        else
        {
          if (LinkedAtLeastSydro_once != -1)
            dispatch_once(&LinkedAtLeastSydro_once, &__block_literal_global);
          if (LinkedAtLeastSydro_result)
            v7 = v6 | 0x4000;
          else
            v7 = v6;
        }
      }
      if ((~v7 & 0xA) == 0)
      {
        v8 = dirInfo[3 * v4 + 1];
        v9 = *(const char **)(v8 + 8);
        v10 = *(const char **)(v8 + 24);
        if (v9)
          v11 = v10 == 0;
        else
          v11 = 1;
        if (!v11 && (v9 == v10 || !strcmp(v9, v10)))
          v7 &= ~8u;
      }
    }
    return (v7 + (a1 << 24));
  }
  return result;
}

void _dirhelper_init(_BYTE *a1)
{
  char *v2;
  const char *v3;
  size_t v4;
  char *v5;
  int v6;
  uid_t v7;
  uid_t v8;
  const char *v9;
  passwd *v10;
  const char *pw_dir;
  size_t v12;
  size_t v13;
  int v14;
  char *v15;
  char *v16;
  const char *v17;

  if (qword_1ECD2BD08)
    bzero((void *)qword_1ECD2BD08, 0x400uLL);
  else
    qword_1ECD2BD08 = (uint64_t)malloc_type_calloc(0x400uLL, 1uLL, 0x100004077774924uLL);
  pthread_mutex_init(&stru_1ECD2BD10, 0);
  dword_1ECD2BD50 = 0;
  if (!qword_1ECD2BD68)
  {
    v2 = getenv("TMPDIR");
    if (v2)
    {
      v3 = v2;
      if (*v2)
      {
        v4 = strlen(v2) + 2;
        v5 = (char *)malloc_type_calloc(v4, 1uLL, 0x100004077774924uLL);
        qword_1ECD2BD68 = (uint64_t)v5;
        if (v3[strlen(v3) - 1] == 47)
          v6 = snprintf(v5, v4, "%s");
        else
          v6 = snprintf(v5, v4, "%s/");
        if (v4 <= v6)
        {
          free((void *)qword_1ECD2BD68);
          qword_1ECD2BD68 = 0;
        }
        else if (qword_1ECD2BD68)
        {
          return;
        }
      }
    }
    v7 = geteuid();
    v8 = v7;
    if (a1 && *a1)
    {
      if (v7 == -2)
      {
        v9 = "/var/tmp/";
        goto LABEL_30;
      }
      if (v7 >= 0x1F5)
      {
        v9 = "/var/mobile/tmp/";
LABEL_30:
        qword_1ECD2BD68 = (uint64_t)strdup(v9);
        if (qword_1ECD2BD68)
          return;
        goto LABEL_34;
      }
    }
    else if (v7 != -2 && v7 >= 0x1F5)
    {
      if (getpwuid(v7))
      {
        v10 = getpwuid(v8);
        pw_dir = v10->pw_dir;
        if (pw_dir)
        {
          if (*pw_dir)
          {
            v12 = strlen(v10->pw_dir);
            v13 = v12 + 7;
            v14 = pw_dir[v12 - 1];
            v15 = (char *)malloc_type_calloc(v12 + 7, 1uLL, 0x100004077774924uLL);
            v16 = v15;
            v17 = "/tmp/";
            if (v14 == 47)
              v17 = "tmp/";
            if (v13 > snprintf(v15, v13, "%s%s", pw_dir, v17))
            {
              qword_1ECD2BD68 = (uint64_t)v16;
              if (v16)
                return;
LABEL_34:
              qword_1ECD2BD68 = (uint64_t)strdup("/var/tmp/");
              return;
            }
            free(v16);
          }
        }
      }
    }
    if (qword_1ECD2BD68)
      return;
    goto LABEL_34;
  }
}

char *_dirhelper_relative_internal()
{
  const char *v0;
  size_t v1;
  size_t v2;
  char *v3;
  char *v4;
  size_t v5;
  int v6;
  char *v7;
  const char *v8;
  statfs v10;
  char __source[1024];
  statfs v12;
  uint64_t v13;

  v0 = (const char *)MEMORY[0x1E0C86820]();
  v2 = v1;
  v4 = v3;
  v13 = *MEMORY[0x1E0C874D8];
  memset(&v12, 0, 512);
  if (!ministatfs(v0, &v12))
  {
    if ((v12.f_flags & 1) != 0)
    {
      v7 = 0;
      v6 = 30;
      goto LABEL_37;
    }
    if ((v12.f_flags & 0x1000) == 0)
    {
      v6 = 19;
      goto LABEL_40;
    }
    bzero(__source, 0x400uLL);
    if (_dirhelper(1, __source, 0x400uLL)
      && (memset(&v10, 0, 512), !ministatfs(__source, &v10))
      && *(_QWORD *)&v10.f_fsid == *(_QWORD *)&v12.f_fsid)
    {
      v5 = strlcpy(v4, __source, v2);
      v6 = 2 * (v5 >= v2);
      if (v5 >= v2)
        v7 = 0;
      else
        v7 = v4;
    }
    else
    {
      v6 = 0;
      v7 = 0;
    }
    if (v6 != 2 && !v7)
    {
      getpid();
      if (sandbox_check())
        v6 = 1;
    }
    if (v7 || v6)
      goto LABEL_24;
    if (_dirhelper_relative_internal_onceToken != -1)
      dispatch_once(&_dirhelper_relative_internal_onceToken, &__block_literal_global_18);
    if (*(_QWORD *)&v12.f_fsid == _dirhelper_relative_internal_userDataDevice_0)
    {
      v8 = "/var/mobile/tmp/";
    }
    else
    {
      if (*(_QWORD *)&v12.f_fsid != _dirhelper_relative_internal_sysDataDevice_0)
        goto LABEL_32;
      v8 = "/var/tmp/";
    }
    v7 = v4;
    if (strlcpy(v4, v8, v2) < v2)
    {
LABEL_24:
      if (v7)
      {
        if (!v6)
          return v7;
        goto LABEL_37;
      }
      if ((v6 & 1) != 0)
      {
        if (v6 == 1)
        {
          if (_dirhelper_relative_internal_onceToken_19 != -1)
            dispatch_once(&_dirhelper_relative_internal_onceToken_19, &__block_literal_global_22);
          v7 = 0;
          v6 = 1;
          goto LABEL_37;
        }
        v6 = 2;
LABEL_40:
        if (_log_onceToken != -1)
          dispatch_once(&_log_onceToken, &__block_literal_global_9);
        if (os_log_type_enabled((os_log_t)_log_log, OS_LOG_TYPE_ERROR))
          _dirhelper_relative_internal_cold_1();
        v7 = 0;
        goto LABEL_37;
      }
    }
LABEL_32:
    if (_log_onceToken != -1)
      dispatch_once(&_log_onceToken, &__block_literal_global_9);
    if (os_log_type_enabled((os_log_t)_log_log, OS_LOG_TYPE_DEBUG))
      _dirhelper_relative_internal_cold_2();
  }
  v7 = 0;
  v6 = 2;
LABEL_37:
  *__error() = v6;
  return v7;
}

uint64_t ministatfs(const char *a1, statfs *a2)
{
  uint64_t v4;
  uint32_t v5;
  uint32_t v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  _BYTE v11[24];
  _OWORD v12[2];
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
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C874D8];
  *(_OWORD *)v11 = xmmword_18A0EE9D8;
  *(_QWORD *)&v11[16] = 0;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  memset(v12, 0, sizeof(v12));
  v4 = getattrlist(a1, v11, v12, 0x83CuLL, 1u);
  if ((_DWORD)v4)
    goto LABEL_7;
  if (*(_OWORD *)&v11[4] != *(_OWORD *)((char *)v12 + 4))
    goto LABEL_7;
  if (*(_DWORD *)&v11[20] != DWORD1(v12[1]))
    goto LABEL_7;
  bzero(a2, 0x878uLL);
  a2->f_fsid = (fsid_t)*((_QWORD *)&v12[1] + 1);
  v5 = v13;
  a2->f_iosize = DWORD1(v13);
  v6 = v14;
  a2->f_type = v5;
  a2->f_flags = v6;
  v7 = __strlcpy_chk();
  v8 = __strlcpy_chk();
  if (v7 > 0x3FF)
    goto LABEL_7;
  if (v8 < 0x400)
    return 0;
LABEL_7:
  if (*__error() != 2)
  {
    if (_log_onceToken != -1)
      dispatch_once(&_log_onceToken, &__block_literal_global_9);
    v9 = _log_log;
    if (os_log_type_enabled((os_log_t)_log_log, OS_LOG_TYPE_ERROR))
      ministatfs_cold_1((uint64_t)a1, v4, v9);
    return statfs(a1, a2);
  }
  return v4;
}

uint64_t NSGetNextSearchPathEnumerationStatic(unsigned int a1, char *a2)
{
  char *v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  int NextDomain;
  int v7;
  unsigned int v8;
  _QWORD *v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  const char *v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  const char **v18;
  uint64_t v19;
  const char *v20;
  int v21;
  uint64_t v24;
  size_t v25;
  char *v26;
  uid_t v27;
  uid_t v28;
  int v29;
  NSObject *v30;
  const char *v31;
  uint32_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  int v38;
  uid_t v39;
  uint64_t v40;
  passwd *v41;
  passwd v42;
  unsigned int v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  uid_t v47;
  __int16 v48;
  int v49;
  uint64_t v50;

  while (1)
  {
    v2 = a2;
    v3 = a1;
    v50 = *MEMORY[0x1E0C874D8];
    v4 = HIBYTE(a1);
    v43 = (unsigned __int16)a1;
    if ((a1 - 0x1000000) >> 25 > 0xA)
    {
      if (a1 >> 25 != 50)
        return 0;
      v5 = v4 - 78;
      if (((v4 - 78) & 0x80000000) != 0)
        return 0;
    }
    else
    {
      v5 = v4 - 1;
      if (((v4 - 1) & 0x80000000) != 0)
        return 0;
    }
    NextDomain = _getNextDomain(&v43);
    if (!NextDomain)
      return 0;
    v7 = NextDomain - 1;
    v8 = v5;
    v9 = &dirInfo[3 * v5];
    v10 = *(_DWORD *)v9;
    v11 = v9[1];
    if (*(_DWORD *)v9 == 1)
    {
      while (1)
      {
        v12 = v43 & ~(1 << v7);
        v43 = v12;
        v13 = *(const char **)(v11 + 8 * v7);
        if (v13)
          break;
        v14 = _getNextDomain(&v43);
        if (!v14)
          return 0;
        v7 = v14 - 1;
      }
      v18 = (const char **)&dirInfo[3 * v8 + 2];
      v19 = v12 + (v3 & 0xFF000000);
    }
    else
    {
      v15 = dirInfo[3 * v8 + 2];
      v16 = BYTE2(v3);
      if (BYTE2(v3) >= v10)
      {
        v43 &= ~(1 << v7);
        v17 = _getNextDomain(&v43);
        if (!v17)
          return 0;
        v16 = 0;
        v7 = v17 - 1;
      }
      v13 = *(const char **)(*(_QWORD *)(v11 + 8 * v7) + 8 * v16);
      v18 = (const char **)(v15 + 8 * v16);
      v19 = (v3 & 0xFF000000 | (v16 << 16)) + v43 + 0x10000;
    }
    v20 = *v18;
    v21 = *(unsigned __int8 *)v13;
    if (v21 == 47 || v21 == 0)
    {
      if (globals != -1)
        _os_once();
      if (!qword_1ECD2BCF8)
        return 0;
      strlcpy(v2, (const char *)qword_1ECD2BCF8, 0x400uLL);
    }
    else
    {
      *v2 = 0;
    }
    if (v7 == 4 && (_DWORD)v19)
    {
      memset(&v42, 0, sizeof(v42));
      v41 = 0;
      v24 = sysconf(71);
      if (v24 < 1)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT))
        {
          v38 = *__error();
          *(_DWORD *)buf = 136315394;
          v45 = "NSGetNextSearchPathEnumerationStatic";
          v46 = 1024;
          v47 = v38;
          _os_log_impl(&dword_18A0EC000, MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT, "%s: sysconf(_SC_GETPW_R_SIZE_MAX) error: %{errno}d", buf, 0x12u);
        }
        goto LABEL_50;
      }
      v25 = v24;
      v26 = (char *)&v40 - ((MEMORY[0x1E0C86820]() + 15) & 0xFFFFFFFFFFFFFFF0);
      v27 = getuid();
      if (getpwuid_r(v27, &v42, v26, v25, &v41))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT))
        {
          v28 = getuid();
          v29 = *__error();
          *(_DWORD *)buf = 136315650;
          v45 = "NSGetNextSearchPathEnumerationStatic";
          v46 = 1024;
          v47 = v28;
          v48 = 1024;
          v49 = v29;
          v30 = MEMORY[0x1E0C88E98];
          v31 = "%s: getpwuid_r(%d) error: %{errno}d";
          v32 = 24;
LABEL_33:
          _os_log_impl(&dword_18A0EC000, v30, OS_LOG_TYPE_DEFAULT, v31, buf, v32);
        }
      }
      else
      {
        if (v41)
        {
          strlcat(v2, v42.pw_dir, 0x400uLL);
          goto LABEL_54;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_DEFAULT))
        {
          v39 = getuid();
          *(_DWORD *)buf = 136315394;
          v45 = "NSGetNextSearchPathEnumerationStatic";
          v46 = 1024;
          v47 = v39;
          v30 = MEMORY[0x1E0C88E98];
          v31 = "%s: getpwuid_r returned no results for uid %d";
          v32 = 18;
          goto LABEL_33;
        }
      }
LABEL_50:
      *v2 = 0;
      return NSGetNextSearchPathEnumerationStatic(v19, v2);
    }
    if (v7 == 5 && (_DWORD)v19)
    {
      if (NSGetNextSearchPathEnumerationStatic_containerizedUserPath)
        goto LABEL_40;
      v33 = container_create_or_lookup_path_for_current_user();
      if (v33)
      {
        v34 = (void *)v33;
        __strlcpy_chk();
        free(v34);
LABEL_40:
        v35 = &NSGetNextSearchPathEnumerationStatic_containerizedUserPath;
        goto LABEL_47;
      }
      goto LABEL_55;
    }
    if (v7 != 7 || !(_DWORD)v19)
    {
      strlcat(v2, v13, 0x400uLL);
      goto LABEL_54;
    }
    if (NSGetNextSearchPathEnumerationStatic_systemContainerPath)
      goto LABEL_46;
    v36 = container_system_path_for_identifier();
    if (v36)
      break;
LABEL_55:
    *v2 = 0;
    a1 = v19;
    a2 = v2;
  }
  v37 = (void *)v36;
  __strlcpy_chk();
  free(v37);
LABEL_46:
  v35 = &NSGetNextSearchPathEnumerationStatic_systemContainerPath;
LABEL_47:
  strlcpy(v2, v35, 0x400uLL);
LABEL_54:
  strlcat(v2, v20, 0x400uLL);
  return v19;
}

uint64_t _getNextDomain(unsigned int *a1)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t result;

  v2 = *a1;
  v3 = __clz(__rbit32(*a1));
  if (*a1)
    result = v3 + 1;
  else
    result = 0;
  if ((v2 & 0x400) != 0 && (_DWORD)result == 4)
    return 11;
  if ((v2 & 0x800) != 0 && (_DWORD)result == 4)
    return 12;
  if ((_DWORD)result == 15)
  {
    *a1 = v2 & 0xFFFFBBFF | 0x400;
    return 11;
  }
  return result;
}

char *_dirhelper(int a1, char *__dst, size_t __size)
{
  int *v5;
  char *result;
  int *v7;
  char *v8;

  if (a1 != 1)
    goto LABEL_14;
  if (qword_1ECD2BD00 != -1)
    _os_once();
  if (!qword_1ECD2BD68 || !*(_BYTE *)qword_1ECD2BD68 || strlcpy(__dst, (const char *)qword_1ECD2BD68, __size) >= __size)
    goto LABEL_14;
  if (!qword_1ECD2BD70 || !*(_BYTE *)qword_1ECD2BD70)
    return __dst;
  if (strlcat(__dst, (const char *)qword_1ECD2BD70, __size) >= __size)
  {
LABEL_14:
    v7 = __error();
    result = 0;
    *v7 = 22;
    return result;
  }
  if (!__makeDirectory(__dst))
  {
    if (!__dst)
      return 0;
    goto LABEL_17;
  }
  v5 = __error();
  result = 0;
  if (__dst && *v5 == 17)
  {
LABEL_17:
    v8 = getenv("TMPDIR");
    if (!v8 || strcmp(v8, __dst))
      setenv("TMPDIR", __dst, 1);
    return __dst;
  }
  return result;
}

uint64_t __makeDirectory(const char *a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  stat v8;

  v2 = mkdir(a1, 0x1C0u);
  if (!(_DWORD)v2)
  {
    if (_log_onceToken != -1)
      dispatch_once(&_log_onceToken, &__block_literal_global_9);
    v6 = _log_log;
    if (os_log_type_enabled((os_log_t)_log_log, OS_LOG_TYPE_DEBUG))
      __makeDirectory_cold_1((uint64_t)a1, v6);
    memset(&v8, 0, sizeof(v8));
    if (!lstat(a1, &v8) && (v8.st_mode & 0x1FF) != 0x1C0 && (v8.st_flags & 0x100000) == 0)
      chmod(a1, 0x1C0u);
    return 0;
  }
  v3 = v2;
  if (*__error() == 17)
    return 0;
  v4 = *__error();
  if (_log_onceToken != -1)
    dispatch_once(&_log_onceToken, &__block_literal_global_9);
  v5 = _log_log;
  if (os_log_type_enabled((os_log_t)_log_log, OS_LOG_TYPE_ERROR))
    __makeDirectory_cold_2((uint64_t)a1, v4, v5);
  *__error() = v4;
  return v3;
}

void _dirhelper_relative_internal_cold_1()
{
  os_log_t v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C874D8];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_18A0EC000, v0, OS_LOG_TYPE_ERROR, "%s: error for relativepath %s: %{errno}d", (uint8_t *)v1, 0x1Cu);
}

uint64_t NSStartSearchPathEnumerationPrivate(int a1, int a2)
{
  return NSStartSearchPathEnumerationStatic(a1, a2, 0);
}

uint64_t NSStartSearchPathEnumeration(int a1, int a2)
{
  return NSStartSearchPathEnumerationStatic(a1, a2, 8112);
}

sysdir_search_path_enumeration_state sysdir_start_search_path_enumeration(sysdir_search_path_directory_t dir, sysdir_search_path_domain_mask_t domainMask)
{
  return NSStartSearchPathEnumerationStatic(dir, domainMask, 8112);
}

char *__user_local_dirname(int a1, int a2, char *__dst, size_t __size)
{
  if (a2 != 1)
    goto LABEL_7;
  if (qword_1ECD2BD00 != -1)
    _os_once();
  if (!qword_1ECD2BD68 || !*(_BYTE *)qword_1ECD2BD68 || strlcpy(__dst, (const char *)qword_1ECD2BD68, __size) >= __size)
  {
LABEL_7:
    __dst = 0;
    *__error() = 22;
  }
  return __dst;
}

uint64_t _libcoreservices_fork_child()
{
  qword_1ECD2BD00 = 0;
  qword_1ECD2BD58 = 0;
  return _os_once();
}

char *_get_user_dir_suffix()
{
  char *result;

  if (qword_1ECD2BD00 != -1)
    _os_once();
  result = (char *)qword_1ECD2BD70;
  if (qword_1ECD2BD70)
    return strdup((const char *)qword_1ECD2BD70);
  return result;
}

void _append_relative_path_component()
{
  abort();
}

char *__user_relative_dirname(uint64_t a1, int a2)
{
  if (a2)
    abort();
  return _dirhelper_relative_internal();
}

void _dirhelper_relative_with_hints()
{
  abort();
}

void __user_relative_dirname_with_hints()
{
  abort();
}

os_log_t ___log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.libcoreservices", "default");
  _log_log = (uint64_t)result;
  return result;
}

uint64_t ___dirhelper_relative_internal_block_invoke()
{
  uint64_t result;
  statfs v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C874D8];
  memset(&v1, 0, 512);
  if (!ministatfs("/var/tmp/", &v1))
    _dirhelper_relative_internal_sysDataDevice_0 = (uint64_t)v1.f_fsid;
  result = ministatfs("/var/mobile/tmp/", &v1);
  if (!(_DWORD)result)
    _dirhelper_relative_internal_userDataDevice_0 = (uint64_t)v1.f_fsid;
  return result;
}

void ___dirhelper_relative_internal_block_invoke_20()
{
  NSObject *v0;
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C874D8];
  if (_log_onceToken != -1)
    dispatch_once(&_log_onceToken, &__block_literal_global_9);
  v0 = _log_log;
  if (os_log_type_enabled((os_log_t)_log_log, OS_LOG_TYPE_DEFAULT))
  {
    v1 = 136315138;
    v2 = "_dirhelper_relative_internal_block_invoke";
    _os_log_impl(&dword_18A0EC000, v0, OS_LOG_TYPE_DEFAULT, "%s: this process is sandboxed so will never return /var/tmp/ or /var/mobile/tmp. This message is only logged once per process.", (uint8_t *)&v1, 0xCu);
  }
}

void ministatfs_cold_1(uint64_t a1, int a2, NSObject *a3)
{
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C874D8];
  v6 = *__error();
  v7 = 136315906;
  v8 = "ministatfs";
  v9 = 1024;
  v10 = a2;
  v11 = 1024;
  v12 = v6;
  v13 = 2082;
  v14 = a1;
  _os_log_error_impl(&dword_18A0EC000, a3, OS_LOG_TYPE_ERROR, "%s: getattrlist result=%d, error=%{errno}d, calling statfs for '%{public}s'", (uint8_t *)&v7, 0x22u);
}

void __makeDirectory_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C874D8];
  v2 = 136315138;
  v3 = a1;
  _os_log_debug_impl(&dword_18A0EC000, a2, OS_LOG_TYPE_DEBUG, "__makeDirectory: created %s", (uint8_t *)&v2, 0xCu);
}

void __makeDirectory_cold_2(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C874D8];
  v3 = 136446722;
  v4 = a1;
  v5 = 1024;
  v6 = 448;
  v7 = 1024;
  v8 = a2;
  _os_log_error_impl(&dword_18A0EC000, log, OS_LOG_TYPE_ERROR, "mkdir: path=%{public}s mode= %{darwin.mode}d: %{darwin.errno}d", (uint8_t *)&v3, 0x18u);
}

void _set_user_dir_suffix_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18A0EC000, log, OS_LOG_TYPE_ERROR, "illegal path traversal (..) pattern found in user_dir_suffix", v1, 2u);
}

void _dirhelper_relative_internal_cold_2()
{
  os_log_t v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C874D8];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_18A0EC000, v0, OS_LOG_TYPE_DEBUG, "%s: no result for relativepath %s, err=%{errno}d", (uint8_t *)v1, 0x1Cu);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C87D88]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C87508]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C87CB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C88E90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C88EA8](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C88EB8](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_once()
{
  return MEMORY[0x1E0C88AA0]();
}

void abort(void)
{
  MEMORY[0x1E0C87558]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C87668](a1, a2);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C87FF8](a1, a2);
}

uint64_t container_create_or_lookup_path_for_current_user()
{
  return MEMORY[0x1E0C87C30]();
}

uint64_t container_system_path_for_identifier()
{
  return MEMORY[0x1E0C87C38]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C87100](predicate, block);
}

uint64_t dyld_process_is_restricted()
{
  return MEMORY[0x1E0C87380]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C87388]();
}

void free(void *a1)
{
  MEMORY[0x1E0C88920](a1);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C88138](a1, a2, a3, a4, *(_QWORD *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C877A8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C88160]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C88190]();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1E0C87D00](*(_QWORD *)&a1);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1E0C87D08](*(_QWORD *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C881C0]();
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C882A8](a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88970](count, size, type_id);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C884F0](a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C88EF8](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C88F18](oslog, type);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C88D68](a1, a2);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C88E18]();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return MEMORY[0x1E0C87918](__name, __value, *(_QWORD *)&__overwrite);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C87950](__str, __size, __format);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C88740](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C87990](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C879A8](__s1);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C879C8](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C879D0](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C879D8](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1E0C87A08](__big, __little, __len);
}

