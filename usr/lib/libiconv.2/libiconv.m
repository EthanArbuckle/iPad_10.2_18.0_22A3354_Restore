uint64_t __bsd_iconv_open(const char *a1, uint64_t a2)
{
  return __bsd___iconv_open(a1, a2, 0);
}

uint64_t __bsd___iconv_open(const char *a1, uint64_t a2, uint64_t *a3)
{
  int v4;
  int v5;
  int v6;
  uint64_t result;
  BOOL v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;

  v12 = a3;
  v4 = *__error();
  v5 = _citrus_iconv_open((void **)&v12);
  if (v5)
  {
    if (v5 == 2)
      v6 = 22;
    else
      v6 = v5;
    *__error() = v6;
    return -1;
  }
  else
  {
    *__error() = v4;
    v8 = strcasestr(a1, "//IGNORE") != 0;
    v9 = *v12;
    *(_BYTE *)(v9 + 72) = v8;
    *(_BYTE *)(v9 + 88) = 1;
    v10 = strcasestr(a1, "//TRANSLIT") != 0;
    result = (uint64_t)v12;
    v11 = *v12;
    *(_BYTE *)(v11 + 73) = v10;
    *(_QWORD *)(v11 + 80) = 0;
  }
  return result;
}

uint64_t __bsd_iconv_close(uint64_t *a1)
{
  if ((unint64_t)a1 + 1 > 1)
  {
    _citrus_iconv_close(a1);
    return 0;
  }
  else
  {
    *__error() = 9;
    return 0xFFFFFFFFLL;
  }
}

void _citrus_iconv_close(uint64_t *a1)
{
  if (a1)
  {
    (*(void (**)(void))(*(_QWORD *)*a1 + 24))();
    release_shared(*a1);
    free(a1);
  }
}

uint64_t release_shared(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  _QWORD *v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD);

  pthread_rwlock_wrlock(&ci_lock);
  v2 = *(_DWORD *)(a1 + 56) - 1;
  *(_DWORD *)(a1 + 56) = v2;
  if (!v2)
  {
    v3 = shared_num_unused;
    v4 = ++shared_num_unused;
    *(_QWORD *)(a1 + 32) = 0;
    v5 = (_QWORD *)qword_1EDB84B68;
    *(_QWORD *)(a1 + 40) = qword_1EDB84B68;
    *v5 = a1;
    qword_1EDB84B68 = a1 + 32;
    v6 = shared_max_reuse;
    if (v3 >= shared_max_reuse)
    {
      do
      {
        v7 = (_QWORD *)shared_unused;
        v8 = *(_QWORD *)(shared_unused + 32);
        v9 = *(_QWORD **)(shared_unused + 40);
        if (v8)
        {
          *(_QWORD *)(v8 + 40) = v9;
          v9 = (_QWORD *)v7[5];
        }
        else
        {
          qword_1EDB84B68 = *(_QWORD *)(shared_unused + 40);
        }
        *v9 = v8;
        v10 = v7[2];
        if (v10)
          *(_QWORD *)(v10 + 24) = v7[3];
        *(_QWORD *)v7[3] = v10;
        shared_num_unused = --v4;
        v11 = (void *)v7[6];
        if (v11)
        {
          v12 = (void (**)(_QWORD))*v7;
          if (*v7)
          {
            if (v7[1])
            {
              ((void (**)(_QWORD *))v12)[1](v7);
              v12 = (void (**)(_QWORD))*v7;
            }
            free(v12);
            v11 = (void *)v7[6];
          }
          _citrus_unload_module(v11);
          v4 = shared_num_unused;
          v6 = shared_max_reuse;
        }
        free(v7);
      }
      while (v4 > v6);
    }
  }
  return pthread_rwlock_unlock(&ci_lock);
}

uint64_t _citrus_iconv_open(void **a1)
{
  char *v2;
  char *v3;
  int v4;
  uint64_t module;
  char *v7;
  uint64_t *v8;
  uint64_t v9;
  const char *v10;
  size_t v11;
  _QWORD *v12;
  void **v13;
  void *v14;
  void *v15;
  uint64_t (**v16)(uint64_t, char *, char *);
  int v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  int v21;
  uint64_t (*getops)(void);
  uint64_t (*v23)(void);
  void *v24;
  uint64_t (**v25)(uint64_t, char *, char *);
  uint64_t (*v26)(uint64_t, char *, char *);
  _QWORD *v27;
  void *v28;
  _QWORD *v29;
  char __s1[1024];
  char __s[1024];
  char __str[1024];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  pthread_rwlock_wrlock(&ci_lock);
  if ((isinit & 1) == 0)
  {
    bzero(&shared_pool, 0x328uLL);
    shared_unused = 0;
    qword_1EDB84B68 = (uint64_t)&shared_unused;
    shared_max_reuse = -1;
    if (issetugid() || (v7 = getenv("ICONV_MAX_REUSE")) == 0)
    {
      if ((shared_max_reuse & 0x80000000) == 0)
      {
LABEL_5:
        isinit = 1;
        goto LABEL_6;
      }
    }
    else
    {
      shared_max_reuse = atoi(v7);
      if ((shared_max_reuse & 0x80000000) == 0)
        goto LABEL_5;
    }
    shared_max_reuse = 5;
    goto LABEL_5;
  }
LABEL_6:
  pthread_rwlock_unlock(&ci_lock);
  __strlcpy_chk();
  v2 = strstr(__s1, "//");
  if (v2)
    *v2 = 0;
  __strlcpy_chk();
  v3 = strstr(__s, "//");
  if (v3)
    *v3 = 0;
  if (!__s1[0] || !strcasecmp(__s1, "char"))
  {
    locale_charset();
    v4 = 0;
LABEL_15:
    __strlcpy_chk();
    goto LABEL_16;
  }
  if (!strcasecmp(__s1, "wchar_t"))
  {
    nl_langinfo(0);
    v4 = 1;
    goto LABEL_15;
  }
  v4 = 0;
LABEL_16:
  if (!__s[0] || !strcasecmp(__s, "char"))
  {
    locale_charset();
    goto LABEL_21;
  }
  if (!strcasecmp(__s, "wchar_t"))
  {
    v4 |= 2u;
    nl_langinfo(0);
LABEL_21:
    __strlcpy_chk();
  }
  if (strchr(__s1, 47) || strchr(__s, 47))
    return 22;
  snprintf(__str, 0x400uLL, "%s/%s", __s1, __s);
  pthread_rwlock_wrlock(&ci_lock);
  v8 = (uint64_t *)((char *)&shared_pool + 8 * (int)_string_hash_func(__str, 0x65u));
  v9 = *v8;
  if (*v8)
  {
    while (strcmp(*(const char **)(v9 + 64), __str))
    {
      v9 = *(_QWORD *)(v9 + 16);
      if (!v9)
        goto LABEL_33;
    }
    v17 = *(_DWORD *)(v9 + 56);
    if (!v17)
    {
      v18 = *(_QWORD *)(v9 + 32);
      v19 = *(_QWORD **)(v9 + 40);
      if (v18)
      {
        *(_QWORD *)(v18 + 40) = v19;
        v19 = *(_QWORD **)(v9 + 40);
      }
      else
      {
        qword_1EDB84B68 = *(_QWORD *)(v9 + 40);
      }
      *v19 = v18;
      --shared_num_unused;
    }
    v21 = v17 + 1;
    goto LABEL_68;
  }
LABEL_33:
  if (v4 == 3)
    v10 = "iconv_none";
  else
    v10 = "iconv_std";
  v11 = strlen(__str);
  v12 = malloc_type_malloc(v11 + 97, 0xDDD4E586uLL);
  if (v12)
  {
    v9 = (uint64_t)v12;
    v12[6] = 0;
    v13 = (void **)(v12 + 6);
    v14 = v12 + 12;
    *(_QWORD *)v9 = 0;
    *(_QWORD *)(v9 + 8) = 0;
    *(_QWORD *)(v9 + 64) = v14;
    memcpy(v14, __str, v11 + 1);
    module = _citrus_load_module(v13, v10);
    if (!(_DWORD)module)
    {
      getops = (uint64_t (*)(void))_citrus_find_getops(*v13, v10, "iconv");
      if (getops)
      {
        v23 = getops;
        v24 = malloc_type_malloc(0x28uLL, 0x800402FCC0CB6uLL);
        *(_QWORD *)v9 = v24;
        if (v24)
        {
          module = v23();
          if (!(_DWORD)module)
          {
            v25 = *(uint64_t (***)(uint64_t, char *, char *))v9;
            v26 = **(uint64_t (***)(uint64_t, char *, char *))v9;
            if (v26 && v25[1] && v25[2] && v25[3] && v25[4])
            {
              module = v26(v9, __s1, __s);
              if (!(_DWORD)module)
                goto LABEL_51;
            }
            else
            {
              module = 22;
            }
          }
        }
        else
        {
          module = *__error();
        }
      }
      else
      {
        module = 102;
      }
    }
    v15 = *v13;
    if (*v13)
    {
      v16 = *(uint64_t (***)(uint64_t, char *, char *))v9;
      if (*(_QWORD *)v9)
      {
        if (*(_QWORD *)(v9 + 8))
        {
          ((void (*)(uint64_t))v16[1])(v9);
          v16 = *(uint64_t (***)(uint64_t, char *, char *))v9;
        }
        free(v16);
        v15 = *v13;
      }
      _citrus_unload_module(v15);
    }
    free((void *)v9);
    if ((_DWORD)module)
      goto LABEL_45;
  }
  else
  {
    module = *__error();
    if ((_DWORD)module)
    {
LABEL_45:
      pthread_rwlock_unlock(&ci_lock);
      return module;
    }
  }
  v9 = 0;
LABEL_51:
  v20 = *v8;
  *(_QWORD *)(v9 + 16) = *v8;
  if (v20)
    *(_QWORD *)(v20 + 24) = v9 + 16;
  *v8 = v9;
  *(_QWORD *)(v9 + 24) = v8;
  v21 = 1;
LABEL_68:
  *(_DWORD *)(v9 + 56) = v21;
  pthread_rwlock_unlock(&ci_lock);
  v27 = *a1;
  if (*a1)
  {
    v28 = 0;
  }
  else
  {
    v29 = malloc_type_malloc(0x20uLL, 0x10A00409968B0C6uLL);
    if (!v29)
    {
      module = *__error();
      release_shared(v9);
      return module;
    }
    v27 = v29;
    *a1 = v29;
    v28 = v29;
  }
  *v27 = v9;
  module = (*(uint64_t (**)(_QWORD *))(*(_QWORD *)v9 + 16))(v27);
  v27[2] = 0;
  *((_DWORD *)v27 + 6) = v4;
  if ((_DWORD)module)
  {
    release_shared(v9);
    free(v28);
  }
  return module;
}

uint64_t _string_hash_func(const char *a1, unsigned int a2)
{
  _QWORD v4[2];

  v4[0] = a1;
  v4[1] = strlen(a1);
  return _citrus_db_hash_std((uint64_t)v4) % a2;
}

uint64_t _citrus_db_hash_std(uint64_t result)
{
  uint64_t v1;
  unsigned __int8 **v2;
  unsigned __int8 *v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned int v7;

  v1 = *(_QWORD *)(result + 8);
  if (!v1)
    return 0;
  v2 = (unsigned __int8 **)result;
  LODWORD(result) = 0;
  v3 = *v2;
  do
  {
    v5 = *v3++;
    v4 = v5;
    v6 = v5 + 32;
    if ((v5 - 91) >= 0xE6u)
      v4 = v6;
    v7 = 16 * result + v4;
    if ((v7 & 0xF0000000) != 0)
      result = v7 & 0xFFFFFFF ^ ((v7 & 0xF0000000) >> 24);
    else
      result = v7;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t __bsd_iconv(uint64_t a1)
{
  int v1;

  if ((unint64_t)(a1 + 1) > 1)
  {
    v1 = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 32))();
    if (!v1)
      return 0;
    *__error() = v1;
  }
  else
  {
    *__error() = 9;
  }
  return -1;
}

uint64_t seq_lookup_db(uint64_t a1, const char *a2, _QWORD *a3)
{
  unsigned __int8 *v6;
  char *v7;

  *(_DWORD *)(a1 + 52) = 0;
  free(*(void **)(a1 + 56));
  v6 = (unsigned __int8 *)strdup(a2);
  v7 = (char *)v6;
  *(_QWORD *)(a1 + 56) = v6;
  if (*(_DWORD *)(a1 + 48))
  {
    _citrus_bcs_convert_to_lower(v6);
    v7 = *(char **)(a1 + 56);
  }
  *(_QWORD *)(a1 + 64) = strlen(v7);
  *(_DWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  return _citrus_db_lookup_by_string(*(uint64_t **)a1, v7, a3, a1 + 32);
}

void *seq_close_db(void **a1)
{
  uint64_t v1;

  v1 = (uint64_t)(a1 + 1);
  _citrus_db_close(*a1);
  return _citrus_unmap_file(v1);
}

uint64_t mapper_open(uint64_t a1, _QWORD *a2, const char *a3, const char *a4)
{
  char *v8;
  _QWORD *v9;
  void **v10;
  uint64_t module;
  uint64_t (*getops)(void);
  uint64_t (*v14)(void);
  void *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  size_t v19;

  v8 = (char *)malloc_type_malloc(0x48uLL, 0x10B0040655B139FuLL);
  if (!v8)
    return *__error();
  v9 = v8;
  *((_OWORD *)v8 + 1) = 0u;
  v10 = (void **)(v8 + 16);
  *((_DWORD *)v8 + 12) = 0;
  *((_QWORD *)v8 + 7) = 0;
  *((_DWORD *)v8 + 16) = 0;
  *(_OWORD *)v8 = 0u;
  module = _citrus_load_module((_QWORD *)v8 + 2, a3);
  if (!(_DWORD)module)
  {
    getops = (uint64_t (*)(void))_citrus_find_getops(*v10, a3, "mapper");
    if (!getops)
    {
      module = 102;
      goto LABEL_3;
    }
    v14 = getops;
    v15 = malloc_type_malloc(0x20uLL, 0x8004018A671A6uLL);
    *v9 = v15;
    if (v15)
    {
      module = v14();
      if ((_DWORD)module)
        goto LABEL_3;
      v16 = (_QWORD *)*v9;
      if (!*(_QWORD *)*v9 || !v16[1] || !v16[2] || !v16[3])
      {
        module = 22;
        goto LABEL_3;
      }
      v17 = malloc_type_malloc(0x18uLL, 0x1000040504FFAC1uLL);
      v9[3] = v17;
      if (v17)
      {
        v18 = v17;
        v19 = strlen(a4);
        module = (*(uint64_t (**)(uint64_t, _QWORD *, _QWORD, const char *, size_t, void *, uint64_t))*v9)(a1, v9, *(_QWORD *)(a1 + 808), a4, v19 + 1, v18, 24);
        if (!(_DWORD)module)
        {
          *a2 = v9;
          return module;
        }
        goto LABEL_3;
      }
    }
    module = *__error();
  }
LABEL_3:
  mapper_close(v9);
  return module;
}

void *_citrus_unmap_file(uint64_t a1)
{
  void *result;

  result = *(void **)a1;
  if (result)
  {
    result = (void *)munmap(result, *(_QWORD *)(a1 + 8));
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
  }
  return result;
}

uint64_t _citrus_stdenc_open(__int128 **a1, char *__s1, uint64_t a3, uint64_t a4)
{
  int v8;
  __int128 *v9;
  __int128 *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  void *v14;
  void *v15;
  uint64_t (*getops)(void *, uint64_t);
  uint64_t (*v17)(void *, uint64_t);
  void *v18;
  _QWORD *v19;
  void *v21;

  v21 = 0;
  v8 = strcmp(__s1, "NONE");
  v9 = (__int128 *)malloc_type_malloc(0x20uLL, 0xA00404900C826uLL);
  v10 = v9;
  if (!v8)
  {
    if (v9)
    {
      v13 = *(_OWORD *)algn_1F0465488;
      *v9 = _citrus_stdenc_default;
      v9[1] = v13;
      goto LABEL_7;
    }
LABEL_21:
    v12 = *__error();
    goto LABEL_22;
  }
  if (!v9)
    goto LABEL_21;
  *v9 = 0u;
  v9[1] = 0u;
  v11 = _citrus_load_module(&v21, __s1);
  if ((_DWORD)v11)
  {
LABEL_4:
    v12 = v11;
LABEL_22:
    _citrus_stdenc_close(v10);
    return v12;
  }
  v15 = v21;
  *((_QWORD *)v10 + 2) = v21;
  getops = (uint64_t (*)(void *, uint64_t))_citrus_find_getops(v15, __s1, "stdenc");
  if (!getops)
  {
LABEL_20:
    v12 = 22;
    goto LABEL_22;
  }
  v17 = getops;
  v18 = malloc_type_malloc(0x58uLL, 0x80040512DBC69uLL);
  *(_QWORD *)v10 = v18;
  if (!v18)
    goto LABEL_21;
  v11 = v17(v18, 88);
  if ((_DWORD)v11)
    goto LABEL_4;
  v19 = *(_QWORD **)v10;
  if (!**(_QWORD **)v10 || !v19[1] || !v19[3] || !v19[4] || !v19[5] || !v19[6] || !v19[8])
    goto LABEL_20;
LABEL_7:
  v14 = malloc_type_malloc(0x18uLL, 0x1000040504FFAC1uLL);
  *((_QWORD *)v10 + 3) = v14;
  if (!v14)
    goto LABEL_21;
  v12 = (**(uint64_t (***)(__int128 *, uint64_t, uint64_t, void *))v10)(v10, a3, a4, v14);
  if ((_DWORD)v12)
    goto LABEL_22;
  *a1 = v10;
  return v12;
}

uint64_t _citrus_mapper_set_persistent(uint64_t a1)
{
  pthread_rwlock_wrlock(&cm_lock);
  *(_DWORD *)(a1 + 48) = -1;
  return pthread_rwlock_unlock(&cm_lock);
}

uint64_t _citrus_mapper_create_area(_QWORD *a1, const char *a2)
{
  uint64_t v4;
  _QWORD *v6;
  _QWORD *v7;
  char *v8;
  stat v9;
  char __str[1024];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  memset(&v9, 0, sizeof(v9));
  pthread_rwlock_wrlock(&cm_lock);
  if (*a1)
  {
    v4 = 0;
  }
  else
  {
    snprintf(__str, 0x400uLL, "%s/%s", a2, "mapper.dir");
    v4 = stat(__str, &v9);
    if (!(_DWORD)v4)
    {
      v6 = malloc_type_malloc(0x330uLL, 0x30040220BCB0CuLL);
      if (v6)
      {
        v7 = v6;
        v8 = strdup(a2);
        v7[101] = v8;
        if (v8)
        {
          bzero(v7, 0x328uLL);
          v4 = 0;
          *a1 = v7;
        }
        else
        {
          v4 = *__error();
          free(v7);
        }
      }
      else
      {
        v4 = *__error();
      }
    }
  }
  pthread_rwlock_unlock(&cm_lock);
  return v4;
}

uint64_t _citrus_map_file(_QWORD *a1, char *a2)
{
  int v3;
  int v4;
  void *v5;
  uint64_t v6;
  off_t st_size;
  stat v9;

  memset(&v9, 0, sizeof(v9));
  *a1 = 0;
  a1[1] = 0;
  v3 = open(a2, 0x1000000, *(_OWORD *)&v9.st_dev, *(_OWORD *)&v9.st_uid, *(_OWORD *)&v9.st_atimespec, *(_OWORD *)&v9.st_mtimespec, *(_OWORD *)&v9.st_ctimespec, *(_OWORD *)&v9.st_birthtimespec);
  if (v3 != -1)
  {
    v4 = v3;
    if (fstat(v3, &v9) == -1)
      goto LABEL_7;
    if ((v9.st_mode & 0xF000) != 0x8000)
    {
      v6 = 102;
      goto LABEL_9;
    }
    v5 = mmap(0, v9.st_size, 1, 2, v4, 0);
    if (v5 == (void *)-1)
    {
LABEL_7:
      v6 = *__error();
    }
    else
    {
      v6 = 0;
      st_size = v9.st_size;
      *a1 = v5;
      a1[1] = st_size;
    }
LABEL_9:
    close(v4);
    return v6;
  }
  return *__error();
}

char *_citrus_lookup_simple(char *a1, uint64_t a2, char *a3, size_t a4, int a5)
{
  int v8;
  char *result;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  v11 = 0;
  v8 = _citrus_lookup_seq_open(&v13, a1, a5);
  result = 0;
  if (!v8)
  {
    v10 = v13;
    if ((*(unsigned int (**)(uint64_t, uint64_t, const char **))(v13 + 80))(v13, a2, &v11))
      a3 = 0;
    else
      snprintf(a3, a4, "%.*s", v12, v11);
    free(*(void **)(v10 + 56));
    (*(void (**)(uint64_t))(v10 + 96))(v10);
    free((void *)v10);
    return a3;
  }
  return result;
}

uint64_t _citrus_lookup_seq_open(_QWORD *a1, char *a2, int a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *(*v11)(void **);
  __int128 v13;
  char __str[1024];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = malloc_type_malloc(0x68uLL, 0x10B20404D61ED97uLL);
  if (!v6)
    return *__error();
  v7 = v6;
  v6[7] = 0;
  v6[8] = 0;
  *((_DWORD *)v6 + 12) = a3;
  v13 = 0uLL;
  snprintf(__str, 0x400uLL, "%s.db", a2);
  v8 = _citrus_map_file(&v13, __str);
  if (!(_DWORD)v8)
  {
    v9 = _citrus_db_open(v7, (uint64_t)&v13, "LOOKUP", (uint64_t)_citrus_db_hash_std, 0);
    if (!(_DWORD)v9)
    {
      *(_OWORD *)(v7 + 1) = v13;
      *((_DWORD *)v7 + 6) = _citrus_db_get_number_of_entries(*v7);
      *((_DWORD *)v7 + 7) = 0;
      *((_DWORD *)v7 + 13) = 1;
      v7[9] = seq_next_db;
      v7[10] = seq_lookup_db;
      v10 = seq_get_num_entries_db;
      v11 = seq_close_db;
      goto LABEL_11;
    }
    v8 = v9;
    _citrus_unmap_file((uint64_t)&v13);
  }
  if ((_DWORD)v8 == 2)
  {
    v8 = _citrus_map_file(v7, a2);
    if (!(_DWORD)v8)
    {
      *((_DWORD *)v7 + 13) = 1;
      v7[9] = seq_next_plain;
      v7[10] = seq_lookup_plain;
      v10 = seq_get_num_entries_plain;
      v11 = (void *(*)(void **))seq_close_plain;
LABEL_11:
      v7[11] = v10;
      v7[12] = v11;
      v8 = 0;
      *a1 = v7;
      return v8;
    }
  }
  free(v7);
  return v8;
}

uint64_t _citrus_load_module(_QWORD *a1, const char *a2)
{
  char *v4;
  const char *v5;
  unsigned int v6;
  uint64_t result;
  void *v8;
  void *v9;
  char *v10;
  char __str[1024];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!_pathI18nModule)
  {
    v4 = getenv("PATH_I18NMODULE");
    if (v4 && (v5 = v4, !issetugid()))
    {
      _pathI18nModule = (uint64_t)strdup(v5);
      if (!_pathI18nModule)
        return 12;
    }
    else
    {
      _pathI18nModule = (uint64_t)"/usr/lib/i18n";
    }
  }
  snprintf(__str, 0x400uLL, "lib%s", a2);
  _findshlib_path = 0;
  v6 = snprintf(&_findshlib_path, 0x400uLL, "%s/%s.dylib", (const char *)_pathI18nModule, __str);
  result = 22;
  if (v6 <= 0x3FF && _findshlib_path)
  {
    v8 = dlopen(&_findshlib_path, 1);
    if (v8)
    {
      v9 = v8;
      result = 0;
      *a1 = v9;
    }
    else
    {
      v10 = dlerror();
      printf("%s", v10);
      return 22;
    }
  }
  return result;
}

void *_citrus_find_getops(void *a1, const char *a2, const char *a3)
{
  char __str[1024];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  snprintf(__str, 0x400uLL, "_citrus_%s_%s_getops", a2, a3);
  return dlsym(a1, __str);
}

uint64_t _citrus_esdb_open(uint64_t a1, uint64_t a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  char *v8;
  int v9;
  char *v10;
  char *v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  char *v18;
  unsigned int v19;
  uint64_t v20;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  char *__s1;
  void *v25;
  char __str[1024];
  char v27[1024];
  char v28[1024];
  char __s[100];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v21[0] = 0;
  v21[1] = 0;
  snprintf(__str, 0x400uLL, "%s/%s", "/usr/share/i18n/esdb", "esdb.alias");
  v4 = _citrus_lookup_simple(__str, a2, v28, 0x400uLL, 1);
  if (v4)
    a2 = (uint64_t)v4;
  snprintf(__str, 0x400uLL, "%s/%s", "/usr/share/i18n/esdb", "esdb.dir");
  v5 = _citrus_lookup_simple(__str, a2, v27, 0x400uLL, 1);
  if (!v5)
    return 2;
  snprintf(__str, 0x400uLL, "%s/%s", "/usr/share/i18n/esdb", v5);
  v6 = _citrus_map_file(v21, __str);
  if (!(_DWORD)v6)
  {
    __s1 = 0;
    v25 = 0;
    v22 = 0;
    v23 = 0;
    v6 = _citrus_db_open(&v25, (uint64_t)v21, "ESDB", (uint64_t)_citrus_db_hash_std, 0);
    if (!(_DWORD)v6)
    {
      LODWORD(v6) = _citrus_db_lookup32_by_string((uint64_t *)v25, "version", &v22, 0);
      if ((_DWORD)v6)
        goto LABEL_7;
      if ((_DWORD)v22 == 1)
      {
        LODWORD(v6) = _citrus_db_lookup_string_by_string((uint64_t *)v25, "encoding", &__s1, 0);
        if ((_DWORD)v6)
          goto LABEL_7;
        v8 = strdup(__s1);
        *(_QWORD *)a1 = v8;
        if (!v8)
        {
          LODWORD(v6) = *__error();
          goto LABEL_7;
        }
        *(_QWORD *)(a1 + 8) = 0;
        *(_QWORD *)(a1 + 16) = 0;
        v9 = _citrus_db_lookup_string_by_string((uint64_t *)v25, "variable", &__s1, 0);
        if (v9 != 2)
        {
          LODWORD(v6) = v9;
          if (v9)
          {
LABEL_27:
            free(*(void **)a1);
LABEL_7:
            _citrus_db_close(v25);
            if ((_DWORD)v6 == 2)
              v6 = 79;
            else
              v6 = v6;
            goto LABEL_10;
          }
          v10 = __s1;
          *(_QWORD *)(a1 + 16) = strlen(__s1) + 1;
          v11 = strdup(v10);
          *(_QWORD *)(a1 + 8) = v11;
          if (!v11)
          {
            LODWORD(v6) = *__error();
            goto LABEL_27;
          }
        }
        LODWORD(v6) = _citrus_db_lookup32_by_string((uint64_t *)v25, "num_charsets", &v23, 0);
        if ((_DWORD)v6)
        {
LABEL_20:
          free(*(void **)(a1 + 8));
          goto LABEL_27;
        }
        *(_DWORD *)(a1 + 24) = v23;
        v12 = _citrus_db_lookup32_by_string((uint64_t *)v25, "invalid", (_DWORD *)&v22 + 1, 0);
        if (v12 == 2)
        {
          *(_DWORD *)(a1 + 40) = 0;
        }
        else
        {
          LODWORD(v6) = v12;
          if (v12)
            goto LABEL_20;
          v13 = HIDWORD(v22);
          *(_DWORD *)(a1 + 40) = 1;
          *(_DWORD *)(a1 + 44) = v13;
        }
        v14 = malloc_type_malloc(16 * v23, 0x101004082113244uLL);
        *(_QWORD *)(a1 + 32) = v14;
        if (!v14)
        {
          LODWORD(v6) = *__error();
          goto LABEL_20;
        }
        if ((_DWORD)v23)
        {
          v15 = 0;
          v16 = 0;
          while (1)
          {
            snprintf(__s, 0x64uLL, "csid_%d", v16);
            v17 = _citrus_db_lookup32_by_string((uint64_t *)v25, __s, (_DWORD *)&v23 + 1, 0);
            if (v17
              || (*(_DWORD *)(*(_QWORD *)(a1 + 32) + v15) = HIDWORD(v23),
                  snprintf(__s, 0x64uLL, "csname_%d", v16),
                  (v17 = _citrus_db_lookup_string_by_string((uint64_t *)v25, __s, &__s1, 0)) != 0))
            {
              LODWORD(v6) = v17;
              goto LABEL_40;
            }
            v18 = strdup(__s1);
            *(_QWORD *)(*(_QWORD *)(a1 + 32) + v15 + 8) = v18;
            if (!v18)
              break;
            ++v16;
            v15 += 16;
            if (v16 >= v23)
              goto LABEL_36;
          }
          LODWORD(v6) = *__error();
LABEL_40:
          if ((_DWORD)v16)
          {
            v19 = v16 - 1;
            do
            {
              v20 = v19;
              free(*(void **)(*(_QWORD *)(a1 + 32) + 16 * v19-- + 8));
            }
            while (v20);
          }
          free(*(void **)(a1 + 32));
          goto LABEL_20;
        }
LABEL_36:
        _citrus_db_close(v25);
        v6 = 0;
      }
      else
      {
        _citrus_db_close(v25);
        v6 = 79;
      }
    }
LABEL_10:
    _citrus_unmap_file((uint64_t)v21);
  }
  return v6;
}

void _citrus_esdb_close(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  if (*(int *)(a1 + 24) >= 1)
  {
    v2 = 0;
    v3 = 8;
    do
    {
      free(*(void **)(*(_QWORD *)(a1 + 32) + v3));
      ++v2;
      v3 += 16;
    }
    while (v2 < *(int *)(a1 + 24));
  }
  *(_DWORD *)(a1 + 24) = 0;
  free(*(void **)(a1 + 32));
  *(_QWORD *)(a1 + 32) = 0;
  free(*(void **)a1);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 16) = 0;
  free(*(void **)(a1 + 8));
  *(_QWORD *)(a1 + 8) = 0;
}

uint64_t _citrus_db_open(_QWORD *a1, uint64_t a2, char *__s2, uint64_t a4, uint64_t a5)
{
  const char *v5;
  unint64_t v6;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  uint64_t result;
  _QWORD *v17;
  _QWORD *v18;

  v5 = *(const char **)a2;
  v6 = *(_QWORD *)(a2 + 8);
  if (v6 < 0x10 || v5 == 0)
    return 79;
  if (strncmp(*(const char **)a2, __s2, 8uLL))
    return 79;
  v12 = bswap32(*((_DWORD *)v5 + 3));
  if (v6 <= v12)
    return 79;
  v13 = 24 * bswap32(*((_DWORD *)v5 + 2));
  v14 = v6 >= v12;
  v15 = v6 - v12;
  if (!v14)
    v15 = 0;
  if (v15 < v13)
    return 79;
  v17 = malloc_type_malloc(0x20uLL, 0x1080040EE4F9096uLL);
  if (!v17)
    return *__error();
  v18 = v17;
  result = 0;
  *(_OWORD *)v18 = *(_OWORD *)a2;
  v18[2] = a4;
  v18[3] = a5;
  *a1 = v18;
  return result;
}

uint64_t _citrus_db_lookup_string_by_string(uint64_t *a1, char *__s, _QWORD *a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v8 = 0;
  v9 = 0;
  v10[0] = __s;
  v10[1] = strlen(__s);
  result = _citrus_db_lookup(a1, (uint64_t)v10, &v8, a4);
  if (!(_DWORD)result)
  {
    if (v9 && !*(_BYTE *)(v8 + v9 - 1))
    {
      result = 0;
      if (a3)
        *a3 = v8;
    }
    else
    {
      return 79;
    }
  }
  return result;
}

uint64_t _citrus_db_lookup_by_string(uint64_t *a1, char *__s, _QWORD *a3, uint64_t a4)
{
  _QWORD v8[2];

  v8[0] = __s;
  v8[1] = strlen(__s);
  return _citrus_db_lookup(a1, (uint64_t)v8, a3, a4);
}

uint64_t _citrus_db_lookup32_by_string(uint64_t *a1, char *__s, _DWORD *a3, uint64_t a4)
{
  uint64_t result;
  unsigned int *v8;
  uint64_t v9;
  _QWORD v10[2];

  v8 = 0;
  v9 = 0;
  v10[0] = __s;
  v10[1] = strlen(__s);
  result = _citrus_db_lookup(a1, (uint64_t)v10, &v8, a4);
  if (!(_DWORD)result)
  {
    if (v9 == 4)
    {
      result = 0;
      if (a3)
        *a3 = bswap32(*v8);
    }
    else
    {
      return 79;
    }
  }
  return result;
}

uint64_t _citrus_db_lookup(uint64_t *a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v4;
  unsigned int v5;
  unint64_t v10;
  unint64_t v11;
  unsigned int v12;
  uint64_t result;
  unsigned int *v14;
  unsigned int v15;
  size_t v16;
  unint64_t v17;
  unint64_t v19;
  uint64_t v20;

  v4 = *a1;
  v5 = *(_DWORD *)(*a1 + 8);
  if (!v5)
    return 2;
  v10 = a1[1];
  if (a4)
  {
    v11 = *(_QWORD *)(a4 + 8);
    if (v11)
    {
      if (v11 < v10)
      {
        v12 = *(_DWORD *)a4;
        goto LABEL_8;
      }
      return 2;
    }
  }
  v12 = ((unsigned int (*)(uint64_t))a1[2])(a2) % bswap32(v5);
  v11 = bswap32(*(_DWORD *)(v4 + 12)) + 24 * v12;
  if (a4)
    *(_DWORD *)a4 = v12;
LABEL_8:
  while (1)
  {
    result = 79;
    if (v10 <= v11 || v11 + 24 > v10)
      break;
    v14 = (unsigned int *)(v4 + v11);
    v15 = *(_DWORD *)(v4 + v11 + 4);
    v11 = bswap32(v15);
    if (a4)
    {
      *(_QWORD *)(a4 + 8) = v11;
      if (!v15)
        *(_QWORD *)(a4 + 8) = a1[1];
    }
    if (bswap32(*v14) != v12)
      return 2;
    v16 = bswap32(v14[3]);
    if (*(_QWORD *)(a2 + 8) == v16)
    {
      v17 = bswap32(v14[2]);
      if (v10 <= v17 || v16 + v17 > v10)
        return result;
      if (!memcmp((const void *)(v4 + v17), *(const void **)a2, v16))
      {
        v19 = bswap32(v14[4]);
        if (v10 <= v19)
          return 79;
        v20 = bswap32(v14[5]);
        if (v20 + v19 > v10)
          return 79;
        result = 0;
        if (a3)
        {
          *a3 = v4 + v19;
          a3[1] = v20;
        }
        return result;
      }
    }
    if (!v15)
      return 2;
  }
  return result;
}

uint64_t _citrus_db_get_number_of_entries(uint64_t a1)
{
  return bswap32(*(_DWORD *)(*(_QWORD *)a1 + 8));
}

uint64_t _citrus_csmapper_open()
{
  uint64_t v0;
  _BYTE *v1;
  _BYTE *v2;
  unint64_t *v3;
  unint64_t *v4;
  char v5;
  char v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t *v11;
  uint64_t area;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int number_of_entries;
  int v24;
  unsigned int v25;
  uint64_t entry;
  unsigned int v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void *v36[2];
  void *v37;
  unsigned int *v38;
  uint64_t v39;
  void *v40;
  char v41[1024];
  char __str[1024];
  char v43[1024];
  char v44[1024];
  _OWORD v45[64];
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  _OWORD v49[64];
  unint64_t v50;
  uint64_t v51;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (uint64_t *)v0;
  v51 = *MEMORY[0x1E0C80C00];
  area = _citrus_mapper_create_area(&maparea, "/usr/share/i18n/csmapper");
  if ((_DWORD)area)
    return area;
  v14 = _citrus_lookup_simple("/usr/share/i18n/csmapper/charset.alias", (uint64_t)v10, v44, 0x400uLL, 1);
  if (v14)
    v10 = v14;
  v15 = _citrus_lookup_simple("/usr/share/i18n/csmapper/charset.alias", (uint64_t)v8, v43, 0x400uLL, 1);
  if (v15)
    v8 = v15;
  if (!strcmp(v10, v8))
  {
    v17 = maparea;
    pthread_rwlock_wrlock(&ma_lock);
    v18 = csm_none;
    if (!csm_none)
    {
      area = _citrus_mapper_open_direct(v17, &csm_none, "mapper_none", &unk_1DEF71B0E);
      if ((_DWORD)area)
        goto LABEL_20;
      _citrus_mapper_set_persistent(csm_none);
      v18 = csm_none;
    }
    area = 0;
    *v11 = v18;
LABEL_20:
    pthread_rwlock_unlock(&ma_lock);
    if (!v4 || (_DWORD)area)
    {
      if ((_DWORD)area)
        return area;
    }
    else
    {
      *v4 = 0;
    }
    area = 0;
    *v2 = 1;
    return area;
  }
  *v2 = 0;
  snprintf(__str, 0x400uLL, "%s/%s", v10, v8);
  v16 = _citrus_mapper_open(maparea, v11, __str);
  if ((_DWORD)v16 != 2)
  {
    area = v16;
    if (!(_DWORD)v16)
    {
      area = 0;
      if (v4)
        *v4 = 0;
    }
    return area;
  }
  if ((v6 & 1) != 0)
    return 2;
  v36[0] = 0;
  v39 = 0;
  v40 = 0;
  v37 = 0;
  v38 = 0;
  v49[0] = 0uLL;
  v48 = 0;
  v47 = 0;
  v19 = _citrus_map_file(v49, "/usr/share/i18n/csmapper/charset.pivot.pvdb");
  if ((_DWORD)v19 == 2)
  {
    v20 = 0;
LABEL_47:
    v36[1] = 0;
    v37 = 0;
    v36[0] = 0;
    memset(v49, 0, 512);
    v29 = _citrus_lookup_seq_open(&v37, "/usr/share/i18n/csmapper/charset.pivot", 1);
    if ((_DWORD)v29)
    {
      area = v29;
    }
    else
    {
      v30 = _citrus_lookup_seq_lookup((uint64_t)v37);
      if ((_DWORD)v30)
      {
        area = v30;
        v31 = -1;
      }
      else
      {
        v31 = -1;
LABEL_52:
        v32 = parse_line((uint64_t)v49, (uint64_t)v36);
        if ((_DWORD)v32
          || (v39 = 0,
              v40 = 0,
              v38 = 0,
              v32 = _citrus_lookup_seq_open(&v40, "/usr/share/i18n/csmapper/charset.pivot", 1),
              (_DWORD)v32))
        {
          area = v32;
        }
        else
        {
          v33 = _citrus_lookup_seq_lookup((uint64_t)v40);
          if (!(_DWORD)v33)
          {
            memset(v45, 0, 512);
            do
            {
              v33 = parse_line((uint64_t)v45, (uint64_t)&v38);
              if ((_DWORD)v33)
                break;
              if (!strcmp(v8, (const char *)v45))
              {
                v50 += v46;
                _citrus_lookup_seq_close((uint64_t)v40);
                v34 = v50;
                if (v50 < v31)
                {
                  __strlcpy_chk();
                  v31 = v34;
                }
                area = _citrus_lookup_seq_next((uint64_t)v37);
                if (!(_DWORD)area)
                  goto LABEL_52;
                goto LABEL_65;
              }
              v33 = _citrus_lookup_seq_next((uint64_t)v40);
            }
            while (!(_DWORD)v33);
          }
          area = v33;
          _citrus_lookup_seq_close((uint64_t)v40);
        }
      }
LABEL_65:
      _citrus_lookup_seq_close((uint64_t)v37);
      if ((_DWORD)area == 2)
      {
        if (v31 == -1)
        {
          area = 2;
        }
        else
        {
          __strlcpy_chk();
          area = 0;
          v20 = v31;
        }
      }
    }
LABEL_71:
    if (!(_DWORD)area)
      goto LABEL_72;
    return area;
  }
  area = v19;
  v20 = 0;
  if ((_DWORD)v19)
    goto LABEL_46;
  v21 = _citrus_db_open(v36, (uint64_t)v49, "CSPIVOT", (uint64_t)_citrus_db_hash_std, 0);
  if ((_DWORD)v21)
  {
    area = v21;
    _citrus_unmap_file((uint64_t)v49);
    v20 = 0;
    goto LABEL_46;
  }
  v22 = open_subdb(&v40, (uint64_t *)v36[0], v10);
  if ((_DWORD)v22)
  {
    area = v22;
    v20 = 0;
    goto LABEL_45;
  }
  number_of_entries = _citrus_db_get_number_of_entries((uint64_t)v40);
  if (number_of_entries < 1)
  {
    area = 0;
    v20 = -1;
    goto LABEL_44;
  }
  v24 = number_of_entries;
  v25 = 0;
  v20 = -1;
  while (1)
  {
    entry = _citrus_db_get_entry(v40, v25, &v47, &v38);
    if ((_DWORD)entry)
      goto LABEL_41;
    if (v39 != 4)
      goto LABEL_43;
    v27 = *v38;
    snprintf((char *)v45, 0x800uLL, "%.*s", v48, v47);
    entry = open_subdb(&v37, (uint64_t *)v36[0], (char *)v45);
    if ((_DWORD)entry)
    {
LABEL_41:
      area = entry;
      goto LABEL_44;
    }
    if (!_citrus_db_lookup_by_string((uint64_t *)v37, v8, &v38, 0))
      break;
LABEL_38:
    _citrus_db_close(v37);
    if (v24 == ++v25)
    {
      area = 0;
      goto LABEL_44;
    }
  }
  if (v39 == 4)
  {
    v28 = bswap32(*v38) + (unint64_t)bswap32(v27);
    if (v28 < v20)
    {
      __strlcpy_chk();
      v20 = v28;
    }
    goto LABEL_38;
  }
  _citrus_db_close(v37);
LABEL_43:
  area = 79;
LABEL_44:
  _citrus_db_close(v40);
LABEL_45:
  _citrus_db_close(v36[0]);
  _citrus_unmap_file((uint64_t)v49);
  if ((_DWORD)area)
  {
LABEL_46:
    if ((_DWORD)area == 102)
      goto LABEL_47;
    goto LABEL_71;
  }
  if (v20 == -1)
    return 2;
LABEL_72:
  v35 = open_serial_mapper(maparea, (uint64_t)v11, v10, v41, v8);
  area = v35;
  if (v4 && !(_DWORD)v35)
    *v4 = v20;
  return area;
}

unsigned __int8 *_citrus_bcs_convert_to_lower(unsigned __int8 *result)
{
  unsigned __int8 v1;
  unsigned __int8 *v2;
  int v3;

  v1 = *result;
  if (*result)
  {
    v2 = result + 1;
    do
    {
      if ((v1 - 91) >= 0xE6u)
        v1 += 32;
      *(v2 - 1) = v1;
      v3 = *v2++;
      v1 = v3;
    }
    while (v3);
  }
  return result;
}

uint64_t __bsd_iconv_open_into(const char *a1, uint64_t a2, uint64_t *a3)
{
  if (__bsd___iconv_open(a1, a2, a3) == -1)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t __bsd___iconv(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  int v8;

  if ((unint64_t)(a1 + 1) > 1)
  {
    v8 = (*(uint64_t (**)(void))(**(_QWORD **)a1 + 32))();
    if (a7)
      *a7 = 0;
    if (!v8)
      return 0;
    *__error() = v8;
  }
  else
  {
    *__error() = 9;
  }
  return -1;
}

uint64_t __bsd___iconv_get_list(_QWORD *a1, uint64_t *a2, char a3)
{
  uint64_t result;

  result = _citrus_esdb_get_list(a1, a2, a3);
  if ((_DWORD)result)
  {
    *__error() = result;
    return 0xFFFFFFFFLL;
  }
  return result;
}

void __bsd_iconvlist(void (*a1)(uint64_t, char **, uint64_t), uint64_t a2)
{
  int list;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  char **v9;
  char **v10;
  char *v11;
  const char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  size_t v17;
  const char *v18;
  char *v19;
  void **v20;
  void *v21;
  uint64_t v22;
  void **v23;
  void *v24;
  unint64_t v25;
  void *v26;

  v25 = 0;
  v26 = 0;
  list = _citrus_esdb_get_list(&v26, (uint64_t *)&v25, 1);
  if (list)
  {
    *__error() = list;
  }
  else
  {
    qsort(v26, v25, 8uLL, (int (__cdecl *)(const void *, const void *))qsort_helper);
    v5 = v25;
    if (v25)
    {
      v6 = 0;
      v7 = 0;
      do
      {
        v8 = strchr(*((char **)v26 + v6), 47);
        v9 = (char **)malloc_type_malloc(8 * v5, 0x10040436913F5uLL);
        if (!v9)
          break;
        v10 = v9;
        v11 = strndup(*((const char **)v26 + v6), (size_t)&v8[-*((_QWORD *)v26 + v6)]);
        if (!v11)
        {
LABEL_25:
          free(v10);
          break;
        }
        v12 = v11;
        *v10 = v11;
        v13 = v25;
        if (v25 <= v7)
        {
          LODWORD(v15) = 1;
          a1(1, v10, a2);
        }
        else
        {
          v14 = v7;
          v15 = 1;
          while (1)
          {
            v16 = (char *)*((_QWORD *)v26 + v14);
            v17 = strlen(v12);
            if (strncmp(v12, v16, v17))
              break;
            v18 = strchr(v16, 47) + 1;
            if (strcmp(v12, v18))
            {
              v19 = strdup(v18);
              if (!v19)
              {
                if ((_DWORD)v15)
                {
                  v22 = v15;
                  v23 = (void **)v10;
                  do
                  {
                    v24 = *v23++;
                    free(v24);
                    --v22;
                  }
                  while (v22);
                }
                goto LABEL_25;
              }
              v10[v15] = v19;
              v15 = (v15 + 1);
            }
            v14 = (v7 + 1);
            v7 = v14;
            if (v13 <= v14)
              goto LABEL_17;
          }
          v14 = v7;
LABEL_17:
          a1(v15, v10, a2);
          v7 = v14;
          if (!(_DWORD)v15)
            goto LABEL_20;
        }
        v15 = v15;
        v20 = (void **)v10;
        do
        {
          v21 = *v20++;
          free(v21);
          --v15;
        }
        while (v15);
LABEL_20:
        free(v10);
        v6 = v7;
        v5 = v25;
      }
      while (v25 > v7);
    }
    if (v26)
      _citrus_esdb_free_list((void **)v26, v25);
  }
}

uint64_t qsort_helper(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

uint64_t __bsd_iconvctl(_QWORD *a1, int a2, __int128 *a3)
{
  int *v3;
  int v4;
  uint64_t result;
  char *v8;
  char *v9;
  size_t v10;
  const void *v11;
  int v12;
  _QWORD *v13;
  __int128 v14;
  __int128 v15;

  if ((unint64_t)a1 + 1 > 1)
  {
    switch(a2)
    {
      case 0:
        v8 = *(char **)(*a1 + 64);
        v9 = strchr(v8, 47);
        v10 = v9 - v8;
        v11 = v9 + 1;
        v12 = v9 - v8 == strlen(v9 + 1) && memcmp(v8, v11, v10) == 0;
        result = 0;
        goto LABEL_24;
      case 1:
        result = 0;
        v12 = *(unsigned __int8 *)(*a1 + 73);
        goto LABEL_24;
      case 2:
        result = 0;
        *(_BYTE *)(*a1 + 73) = *(_DWORD *)a3 != 0;
        return result;
      case 3:
        result = 0;
        v12 = *(unsigned __int8 *)(*a1 + 72);
        goto LABEL_24;
      case 4:
        result = 0;
        *(_BYTE *)(*a1 + 72) = *(_DWORD *)a3 != 0;
        return result;
      case 5:
        result = 0;
        *(_QWORD *)(*a1 + 80) = a3;
        return result;
      case 6:
        v13 = (_QWORD *)a1[2];
        if (!v13)
        {
          v13 = malloc_type_malloc(0x28uLL, 0x800402FCC0CB6uLL);
          a1[2] = v13;
          if (!v13)
            return 0xFFFFFFFFLL;
        }
        result = 0;
        v14 = *a3;
        v15 = a3[1];
        v13[4] = *((_QWORD *)a3 + 4);
        *(_OWORD *)v13 = v14;
        *((_OWORD *)v13 + 1) = v15;
        return result;
      default:
        if (a2 == 128)
        {
          result = 0;
          v12 = *(unsigned __int8 *)(*a1 + 88);
LABEL_24:
          *(_DWORD *)a3 = v12;
          return result;
        }
        if (a2 == 129)
        {
          result = 0;
          *(_BYTE *)(*a1 + 88) = *(_DWORD *)a3 != 0;
          return result;
        }
        v3 = __error();
        v4 = 22;
        break;
    }
  }
  else
  {
    v3 = __error();
    v4 = 9;
  }
  *v3 = v4;
  return 0xFFFFFFFFLL;
}

int64_t _citrus_bcs_strtol(unsigned __int8 *a1, unsigned __int8 **a2, int a3)
{
  unsigned __int8 **v3;
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  int *v6;
  int64_t result;
  unsigned int v8;
  unsigned int v9;
  _BOOL4 v10;
  uint64_t v11;
  unsigned __int8 v14;
  unsigned __int8 v15;
  int v16;
  _BOOL4 v17;
  int v18;
  int64_t v19;
  uint64_t v20;
  int64_t v21;
  int v22;
  _BOOL8 v23;
  int v24;
  int64_t v25;
  unsigned __int8 *i;
  int v27;
  int v28;
  unsigned __int8 v29;

  v3 = a2;
  v4 = a1;
  v5 = a1;
  if (a3)
  {
    v5 = a1;
    if ((a3 - 37) < 0xFFFFFFDD)
    {
      v6 = __error();
      result = 0;
      *v6 = 22;
      if (v3)
        goto LABEL_58;
      return result;
    }
  }
  do
  {
    v9 = *v5++;
    v8 = v9;
    v10 = v9 == 11;
    v11 = (1 << v9) & 0x100003600;
  }
  while (v9 <= 0x20 && v11 != 0 || v10);
  if (v8 == 43 || v8 == 45)
  {
    v15 = *v5++;
    v14 = v15;
  }
  else
  {
    v14 = v8;
  }
  if ((a3 & 0xFFFFFFEF) != 0 || v14 != 48)
  {
    v17 = a3 == 0;
    if (v14 != 48)
    {
      v16 = 10;
      goto LABEL_24;
    }
LABEL_23:
    v16 = 8;
LABEL_24:
    if (!v17)
      v16 = a3;
    goto LABEL_26;
  }
  if ((*v5 | 0x20) != 0x78)
  {
    v17 = a3 == 0;
    v14 = 48;
    goto LABEL_23;
  }
  v14 = v5[1];
  v5 += 2;
  v16 = 16;
LABEL_26:
  result = 0;
  v18 = 0;
  v19 = 0xFFFFFFFF80000000;
  if (v8 != 45)
    v19 = 0x7FFFFFFFLL;
  v20 = v16;
  v21 = v19 / v16;
  v22 = v19 % v16;
  if (v22 > 0)
  {
    v23 = v8 == 45;
  }
  else
  {
    v16 = 0;
    v23 = 0;
  }
  v24 = v16 - v22;
  v25 = v21 + v23;
  for (i = v5 - 1; ; ++i)
  {
    if ((v14 - 58) >= 0xF6u)
    {
      v28 = v14 - 48;
    }
    else
    {
      if (((v14 & 0xDF) - 91) < 0xE6u)
        break;
      v27 = (v14 - 91) >= 0xE6u ? -55 : -87;
      v28 = v27 + v14;
    }
    if (v28 >= (int)v20)
      break;
    if (v18 < 0)
    {
      v18 = -1;
      goto LABEL_54;
    }
    if (v8 == 45)
    {
      if (result < v25 || result == v25 && v28 > v24)
      {
        *__error() = 34;
        v18 = -1;
        result = 0xFFFFFFFF80000000;
        goto LABEL_54;
      }
      result = result * v20 - v28;
    }
    else
    {
      if (result > v25 || result == v25 && v28 > v22)
      {
        *__error() = 34;
        v18 = -1;
        result = 0x7FFFFFFFLL;
        goto LABEL_54;
      }
      result = result * v20 + v28;
    }
    v18 = 1;
LABEL_54:
    v29 = i[1];
    v14 = v29;
  }
  v3 = a2;
  if (a2)
  {
    if (v18)
      v4 = i;
LABEL_58:
    *v3 = v4;
  }
  return result;
}

unint64_t _citrus_bcs_strtoul(unsigned __int8 *a1, unsigned __int8 **a2, int a3)
{
  unsigned __int8 *v5;
  int *v6;
  unint64_t result;
  unsigned int v8;
  unsigned int v9;
  _BOOL4 v10;
  uint64_t v11;
  unsigned __int8 v14;
  unsigned __int8 v15;
  int v16;
  _BOOL4 v17;
  int v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  unsigned __int8 *i;
  int v25;
  int v26;
  unsigned __int8 v27;
  unsigned __int8 *v29;

  v5 = a1;
  if (a3)
  {
    v5 = a1;
    if ((a3 - 37) < 0xFFFFFFDD)
    {
      v6 = __error();
      result = 0;
      *v6 = 22;
      return result;
    }
  }
  do
  {
    v9 = *v5++;
    v8 = v9;
    v10 = v9 == 11;
    v11 = (1 << v9) & 0x100003600;
  }
  while (v9 <= 0x20 && v11 != 0 || v10);
  if (v8 == 43 || v8 == 45)
  {
    v15 = *v5++;
    v14 = v15;
  }
  else
  {
    v14 = v8;
  }
  if ((a3 & 0xFFFFFFEF) != 0 || v14 != 48)
  {
    v17 = a3 == 0;
    if (v14 != 48)
    {
      v18 = 10;
      goto LABEL_23;
    }
LABEL_22:
    v18 = 8;
LABEL_23:
    if (v17)
      v16 = v18;
    else
      v16 = a3;
    goto LABEL_26;
  }
  if ((*v5 | 0x20) != 0x78)
  {
    v17 = a3 == 0;
    v14 = 48;
    goto LABEL_22;
  }
  v14 = v5[1];
  v5 += 2;
  v16 = 16;
LABEL_26:
  v19 = 0;
  v20 = 0;
  v21 = v16;
  v22 = 0xFFFFFFFFuLL / v16;
  v23 = ~(v22 * v16);
  for (i = v5 - 1; ; ++i)
  {
    if ((v14 - 58) >= 0xF6u)
    {
      v26 = v14 - 48;
    }
    else
    {
      if (((v14 & 0xDF) - 91) < 0xE6u)
        break;
      v25 = (v14 - 91) >= 0xE6u ? -55 : -87;
      v26 = v25 + v14;
    }
    if (v26 >= (int)v21)
      break;
    if (v20 < 0)
      goto LABEL_40;
    if (v19 > v22 || v19 == v22 && v26 > v23)
    {
      *__error() = 34;
      v19 = 0xFFFFFFFFLL;
LABEL_40:
      v20 = -1;
      goto LABEL_41;
    }
    v19 = v19 * v21 + v26;
    v20 = 1;
LABEL_41:
    v27 = i[1];
    v14 = v27;
  }
  if (v20 > 0 && v8 == 45)
    result = -(uint64_t)v19;
  else
    result = v19;
  if (a2)
  {
    if (v20)
      v29 = i;
    else
      v29 = a1;
    *a2 = v29;
  }
  return result;
}

uint64_t _citrus_bcs_strcasecmp(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  unsigned __int8 v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  BOOL v8;
  BOOL v9;
  unsigned int v10;

  do
  {
    v3 = *a1++;
    v2 = v3;
    v4 = v3 - 32;
    if ((v3 - 123) >= 0xE6u)
      v2 = v4;
    v6 = *a2++;
    v5 = v6;
    v7 = v6 - 32;
    if ((v6 - 123) >= 0xE6u)
      v5 = v7;
    if (v2)
      v8 = v5 == 0;
    else
      v8 = 1;
  }
  while (!v8 && v2 == v5);
  v9 = v2 == v5;
  if (v2 > v5)
    v10 = 1;
  else
    v10 = -1;
  if (v9)
    return 0;
  else
    return v10;
}

uint64_t _citrus_bcs_strncasecmp(char *a1, char *a2, uint64_t a3)
{
  unsigned int v3;
  unsigned int v4;
  _BOOL4 v6;
  char v7;
  char v8;
  char v9;
  char v10;
  BOOL v12;
  unsigned int v13;

  v3 = 1;
  v4 = 1;
  do
  {
    v6 = a3-- != 0;
    if (v4 != v3 || !v6)
      break;
    v7 = *a1++;
    LOBYTE(v4) = v7;
    v8 = v7 - 32;
    if ((v7 - 123) >= 0xE6u)
      LOBYTE(v4) = v8;
    v4 = v4;
    v9 = *a2++;
    LOBYTE(v3) = v9;
    v10 = v9 - 32;
    if ((v9 - 123) >= 0xE6u)
      LOBYTE(v3) = v10;
    v3 = v3;
  }
  while ((_BYTE)v4 && v3 != 0);
  v12 = v4 == v3;
  if (v4 > v3)
    v13 = 1;
  else
    v13 = -1;
  if (v12)
    return 0;
  else
    return v13;
}

unsigned __int8 *_citrus_bcs_skip_ws(unsigned __int8 *result)
{
  int v1;

  while (1)
  {
    v1 = *result;
    if ((v1 - 9) >= 5 && v1 != 32)
      break;
    ++result;
  }
  return result;
}

unsigned __int8 *_citrus_bcs_skip_nonws(unsigned __int8 *result)
{
  unsigned int v1;
  BOOL v2;
  uint64_t v3;

  while (1)
  {
    v1 = *result;
    v2 = v1 > 0x20;
    v3 = (1 << v1) & 0x100003E01;
    if (!v2 && v3 != 0)
      break;
    ++result;
  }
  return result;
}

unsigned __int8 *_citrus_bcs_skip_ws_len(unsigned __int8 *result, uint64_t *a2)
{
  uint64_t v2;
  unsigned __int8 *v3;
  uint64_t v4;
  int v5;

  v2 = *a2;
  if (*a2)
  {
    v3 = &result[v2];
    v4 = v2 - 1;
    while (1)
    {
      v5 = *result;
      if ((v5 - 9) >= 5 && v5 != 32)
        break;
      ++result;
      *a2 = v4--;
      if (v4 == -1)
        return v3;
    }
  }
  return result;
}

unsigned __int8 *_citrus_bcs_skip_nonws_len(unsigned __int8 *result, uint64_t *a2)
{
  uint64_t v2;
  unsigned __int8 *v3;
  uint64_t v4;
  unsigned int v5;
  BOOL v6;
  uint64_t v7;

  v2 = *a2;
  if (*a2)
  {
    v3 = &result[v2];
    v4 = v2 - 1;
    while (1)
    {
      v5 = *result;
      v6 = v5 > 0x20;
      v7 = (1 << v5) & 0x100003E01;
      if (!v6 && v7 != 0)
        break;
      ++result;
      *a2 = v4--;
      if (v4 == -1)
        return v3;
    }
  }
  return result;
}

uint64_t _citrus_bcs_trunc_rws_len(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  int v3;

  if (*a2)
  {
    v2 = *a2 - 1;
    do
    {
      v3 = *(unsigned __int8 *)(result + v2);
      if ((v3 - 9) >= 5 && v3 != 32)
        break;
      *a2 = v2--;
    }
    while (v2 != -1);
  }
  return result;
}

unsigned __int8 *_citrus_bcs_convert_to_upper(unsigned __int8 *result)
{
  unsigned __int8 v1;
  unsigned __int8 *v2;
  int v3;

  v1 = *result;
  if (*result)
  {
    v2 = result + 1;
    do
    {
      if ((v1 - 123) >= 0xE6u)
        v1 -= 32;
      *(v2 - 1) = v1;
      v3 = *v2++;
      v1 = v3;
    }
    while (v3);
  }
  return result;
}

uint64_t open_serial_mapper(uint64_t a1, uint64_t a2, const char *a3, const char *a4, const char *a5)
{
  char __str[1024];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  snprintf(__str, 0x400uLL, "%s/%s,%s/%s", a3, a4, a4, a5);
  return _citrus_mapper_open_direct(a1, a2, "mapper_serial", __str);
}

uint64_t open_subdb(_QWORD *a1, uint64_t *a2, char *__s)
{
  uint64_t result;
  _QWORD v5[2];

  v5[0] = 0;
  v5[1] = 0;
  result = _citrus_db_lookup_by_string(a2, __s, v5, 0);
  if (!(_DWORD)result)
    return _citrus_db_open(a1, (uint64_t)v5, "CSPIVSUB", (uint64_t)_citrus_db_hash_std, 0);
  return result;
}

uint64_t parse_line(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  const char *v5;
  unsigned __int8 *v6;
  int v7;
  unsigned __int8 *v8;
  const char *v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t result;
  uint64_t v13;
  char __str[20];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = *(unsigned __int8 **)a2;
  v13 = *(_QWORD *)(a2 + 8);
  v4 = _citrus_bcs_skip_ws_len(v3, &v13);
  if (!v13)
    return 79;
  v5 = (const char *)v4;
  v6 = _citrus_bcs_skip_nonws_len(v4, &v13);
  if (!v13)
    return 79;
  v7 = (int)v6;
  v8 = _citrus_bcs_skip_ws_len(v6, &v13);
  if (!v13)
    return 79;
  v9 = (const char *)v8;
  v10 = _citrus_bcs_skip_nonws_len(v8, &v13);
  snprintf((char *)a1, 0x400uLL, "%.*s", v7 - (_DWORD)v5, v5);
  snprintf(__str, 0x14uLL, "%.*s", v10 - (_DWORD)v9, v9);
  v11 = _citrus_bcs_strtoul((unsigned __int8 *)__str, 0, 0);
  result = 0;
  *(_QWORD *)(a1 + 1024) = v11;
  return result;
}

uint64_t _citrus_db_lookup8_by_string(uint64_t *a1, char *__s, _BYTE *a3, uint64_t a4)
{
  uint64_t result;
  _BYTE *v8;
  uint64_t v9;
  _QWORD v10[2];

  v8 = 0;
  v9 = 0;
  v10[0] = __s;
  v10[1] = strlen(__s);
  result = _citrus_db_lookup(a1, (uint64_t)v10, &v8, a4);
  if (!(_DWORD)result)
  {
    if (v9 == 1)
    {
      result = 0;
      if (a3)
        *a3 = *v8;
    }
    else
    {
      return 79;
    }
  }
  return result;
}

uint64_t _citrus_db_lookup16_by_string(uint64_t *a1, char *__s, _WORD *a3, uint64_t a4)
{
  uint64_t result;
  unsigned __int16 *v8;
  uint64_t v9;
  _QWORD v10[2];

  v8 = 0;
  v9 = 0;
  v10[0] = __s;
  v10[1] = strlen(__s);
  result = _citrus_db_lookup(a1, (uint64_t)v10, &v8, a4);
  if (!(_DWORD)result)
  {
    if (v9 == 2)
    {
      result = 0;
      if (a3)
        *a3 = bswap32(*v8) >> 16;
    }
    else
    {
      return 79;
    }
  }
  return result;
}

uint64_t _citrus_db_get_entry(_QWORD *a1, unsigned int a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  result = 22;
  if ((a2 & 0x80000000) == 0)
  {
    v6 = *a1;
    if (bswap32(*(_DWORD *)(*a1 + 8)) > a2)
    {
      v7 = a1[1];
      v8 = bswap32(*(_DWORD *)(v6 + 12)) + 24 * a2;
      if (v7 <= v8 || v8 + 24 > v7)
        return 79;
      v10 = (unsigned int *)(v6 + v8);
      v11 = bswap32(v10[2]);
      if (v7 <= v11)
        return 79;
      v12 = bswap32(v10[3]);
      if (v12 + v11 > v7)
        return 79;
      if (a3)
      {
        *a3 = v6 + v11;
        a3[1] = v12;
      }
      v13 = bswap32(v10[4]);
      if (v7 <= v13)
        return 79;
      v14 = bswap32(v10[5]);
      if (v14 + v13 > v7)
      {
        return 79;
      }
      else
      {
        result = 0;
        if (a4)
        {
          *a4 = v6 + v13;
          a4[1] = v14;
        }
      }
    }
  }
  return result;
}

uint64_t _citrus_db_factory_create(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t result;

  v6 = malloc_type_malloc(0x38uLL, 0x10A00402683DD91uLL);
  if (!v6)
    return *__error();
  v7 = v6;
  result = 0;
  *v7 = 0;
  v7[1] = 0;
  v7[2] = v7 + 1;
  v7[3] = 0;
  v7[4] = 0;
  v7[5] = a2;
  v7[6] = a3;
  *a1 = v7;
  return result;
}

void _citrus_db_factory_free(void ***a1)
{
  void **v2;
  void ***v3;
  void *v4;

  v3 = a1 + 1;
  v2 = a1[1];
  if (v2)
  {
    do
    {
      v4 = *v2;
      *v3 = (void **)*v2;
      if (!v4)
        a1[2] = (void **)v3;
      if (*((_DWORD *)v2 + 10))
        free(v2[3]);
      if (*((_DWORD *)v2 + 16))
        free(v2[6]);
      free(v2);
      v2 = *v3;
    }
    while (*v3);
  }
  free(a1);
}

uint64_t _citrus_db_factory_add(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  _DWORD *v10;
  uint64_t v11;
  _DWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v10 = malloc_type_malloc(0x48uLL, 0x10A0040BA52E972uLL);
  v11 = 0xFFFFFFFFLL;
  if (v10)
  {
    v12 = v10;
    v10[4] = (*(uint64_t (**)(uint64_t))(a1 + 40))(a2);
    *(_OWORD *)(v12 + 6) = *(_OWORD *)a2;
    v12[10] = a3;
    *((_OWORD *)v12 + 3) = *(_OWORD *)a4;
    v12[16] = a5;
    v12[17] = -1;
    *(_QWORD *)v12 = 0;
    v13 = *(_QWORD *)(a1 + 24);
    **(_QWORD **)(a1 + 16) = v12;
    v14 = v13 + *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 16) = v12;
    *(_QWORD *)(a1 + 24) = v14;
    *(_QWORD *)(a1 + 32) += (*(_QWORD *)(a4 + 8) + 15) & 0xFFFFFFFFFFFFFFF0;
    ++*(_QWORD *)a1;
    return 0;
  }
  return v11;
}

uint64_t _citrus_db_factory_add_by_string(uint64_t a1, char *__s1, uint64_t a3, int a4)
{
  char *v8;
  _QWORD v10[2];

  v8 = strdup(__s1);
  if (!v8)
    return *__error();
  v10[0] = v8;
  v10[1] = strlen(__s1);
  return _citrus_db_factory_add(a1, (uint64_t)v10, 1, a3, a4);
}

uint64_t _citrus_db_factory_add8_by_string(uint64_t a1, char *a2, char a3)
{
  _BYTE *v6;
  _QWORD v8[2];

  v6 = malloc_type_malloc(1uLL, 0x100004077774924uLL);
  if (!v6)
    return *__error();
  *v6 = a3;
  v8[0] = v6;
  v8[1] = 1;
  return _citrus_db_factory_add_by_string(a1, a2, (uint64_t)v8, 1);
}

uint64_t _citrus_db_factory_add16_by_string(uint64_t a1, char *a2, unsigned int a3)
{
  _WORD *v6;
  _QWORD v8[2];

  v6 = malloc_type_malloc(2uLL, 0x1000040BDFB0063uLL);
  if (!v6)
    return *__error();
  *v6 = __rev16(a3);
  v8[0] = v6;
  v8[1] = 2;
  return _citrus_db_factory_add_by_string(a1, a2, (uint64_t)v8, 1);
}

uint64_t _citrus_db_factory_add32_by_string(uint64_t a1, char *a2, unsigned int a3)
{
  _DWORD *v6;
  _QWORD v8[2];

  v6 = malloc_type_malloc(4uLL, 0x100004052888210uLL);
  if (!v6)
    return *__error();
  *v6 = bswap32(a3);
  v8[0] = v6;
  v8[1] = 4;
  return _citrus_db_factory_add_by_string(a1, a2, (uint64_t)v8, 1);
}

uint64_t _citrus_db_factory_add_string_by_string(uint64_t a1, char *a2, char *__s1)
{
  char *v5;
  _QWORD v7[2];

  v5 = strdup(__s1);
  if (!v5)
    return *__error();
  v7[0] = v5;
  v7[1] = strlen(v5) + 1;
  return _citrus_db_factory_add_by_string(a1, a2, (uint64_t)v7, 1);
}

unint64_t _citrus_db_factory_calc_size(_QWORD *a1)
{
  return a1[4] + ((a1[3] + 15) & 0xFFFFFFFFFFFFFFF0) + ((24 * *a1 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
}

uint64_t _citrus_db_factory_serialize(size_t *a1, uint64_t a2, uint64_t a3)
{
  size_t v6;
  _QWORD *v7;
  _QWORD *v8;
  size_t v9;
  size_t v10;
  unint64_t v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  size_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t i;
  uint64_t result;
  unint64_t v34;
  unint64_t v35;

  v6 = *a1;
  if (v6)
  {
    v7 = malloc_type_calloc(v6, 8uLL, 0x2004093837F09uLL);
    if (v7)
    {
      v8 = v7;
      v9 = a1[1];
      if (v9)
      {
        v10 = *a1;
        do
        {
          v11 = *(unsigned int *)(v9 + 16) % v10;
          *(_DWORD *)(v9 + 16) = v11;
          *(_DWORD *)(v9 + 68) = -1;
          *(_QWORD *)(v9 + 8) = 0;
          if (!v7[v11])
          {
            v7[v11] = v9;
            *(_DWORD *)(v9 + 68) = v11;
          }
          v9 = *(_QWORD *)v9;
        }
        while (v9);
        v12 = a1[1];
        if (v12)
        {
          v13 = 0;
          do
          {
            if (*(_DWORD *)(v12 + 68) == -1)
            {
              v14 = v7[*(unsigned int *)(v12 + 16)];
              do
              {
                v15 = v14;
                v14 = *(_QWORD *)(v14 + 8);
              }
              while (v14);
              *(_QWORD *)(v15 + 8) = v12;
              while (v7[v13++])
                ;
              v7[--v13] = v12;
              *(_DWORD *)(v12 + 68) = v13;
            }
            v12 = *(_QWORD *)v12;
          }
          while (v12);
        }
      }
      v17 = 0;
      v18 = *a1;
      v19 = (24 * *a1 + 15) & 0xFFFFFFFFFFFFFFF0;
      v20 = (a1[3] + 15) & 0xFFFFFFFFFFFFFFF0;
      do
      {
        *(_BYTE *)(*(_QWORD *)a3 + v17) = *(_BYTE *)(a2 + v17);
        ++v17;
      }
      while (v17 != 8);
      if (HIDWORD(v18))
        _citrus_db_factory_serialize_cold_1();
      v21 = v19 + 16;
      *(_DWORD *)(*(_QWORD *)a3 + 8) = bswap32(v18);
      *(_DWORD *)(*(_QWORD *)a3 + 12) = 0x10000000;
      if (*a1)
      {
        v22 = 0;
        v23 = v21 + v20;
        v24 = 16;
        do
        {
          v25 = v8[v22];
          v26 = *(_QWORD *)(v25 + 8);
          if (v26)
          {
            v27 = *(_DWORD *)(v26 + 68);
            *(_DWORD *)(*(_QWORD *)a3 + v24) = bswap32(*(_DWORD *)(v25 + 16));
            if (v27 < 0)
              _citrus_db_factory_serialize_cold_6();
            LODWORD(v26) = 24 * v27 + 16;
          }
          else
          {
            *(_DWORD *)(*(_QWORD *)a3 + v24) = bswap32(*(_DWORD *)(v25 + 16));
          }
          *(_DWORD *)(*(_QWORD *)a3 + (v24 | 4)) = bswap32(v26);
          if (HIDWORD(v21))
            _citrus_db_factory_serialize_cold_2();
          *(_DWORD *)(v24 + *(_QWORD *)a3 + 8) = bswap32(v21);
          v28 = *(_QWORD *)(v25 + 32);
          if (HIDWORD(v28))
            _citrus_db_factory_serialize_cold_3();
          *(_DWORD *)(v24 + *(_QWORD *)a3 + 12) = bswap32(v28);
          if (HIDWORD(v23))
            _citrus_db_factory_serialize_cold_4();
          *(_DWORD *)(v24 + *(_QWORD *)a3 + 16) = bswap32(v23);
          v29 = *(_QWORD *)(v25 + 56);
          if (HIDWORD(v29))
            _citrus_db_factory_serialize_cold_5();
          *(_DWORD *)(v24 + *(_QWORD *)a3 + 20) = bswap32(v29);
          memcpy((void *)(*(_QWORD *)a3 + v21), *(const void **)(v25 + 24), *(_QWORD *)(v25 + 32));
          v30 = *(_QWORD *)(v25 + 32);
          memcpy((void *)(*(_QWORD *)a3 + v23), *(const void **)(v25 + 48), *(_QWORD *)(v25 + 56));
          v23 += *(_QWORD *)(v25 + 56);
          v31 = (v23 + 15) & 0xFFFFFFFFFFFFFFF0;
          while (v31 != v23)
            *(_BYTE *)(*(_QWORD *)a3 + v23++) = 0;
          v24 += 24;
          v21 += v30;
          ++v22;
        }
        while (v22 < *a1);
      }
      else
      {
        v24 = 16;
      }
      v34 = (v24 + 15) & 0xFFFFFFFFFFFFFFF0;
      while (v34 != v24)
        *(_BYTE *)(*(_QWORD *)a3 + v24++) = 0;
      v35 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
      while (v35 != v21)
        *(_BYTE *)(*(_QWORD *)a3 + v21++) = 0;
      free(v8);
      return 0;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    for (i = 0; i != 8; ++i)
      *(_BYTE *)(*(_QWORD *)a3 + i) = *(_BYTE *)(a2 + i);
    result = 0;
    *(_DWORD *)(*(_QWORD *)a3 + 8) = 0;
    *(_DWORD *)(*(_QWORD *)a3 + 12) = 0x10000000;
  }
  return result;
}

char *_citrus_esdb_alias(uint64_t a1, char *a2, size_t a3)
{
  char *result;

  result = _citrus_lookup_simple("/usr/share/i18n/esdb/esdb.alias", a1, a2, a3, 1);
  if (!result)
    return (char *)a1;
  return result;
}

void _citrus_esdb_free_list(void **a1, uint64_t a2)
{
  uint64_t v3;
  void **v4;
  void *v5;

  if (a2)
  {
    v3 = a2;
    v4 = a1;
    do
    {
      v5 = *v4++;
      free(v5);
      --v3;
    }
    while (v3);
  }
  free(a1);
}

uint64_t _citrus_esdb_get_list(_QWORD *a1, uint64_t *a2, char a3)
{
  uint64_t v6;
  int number_of_entries;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char __s[1024];
  char __str[1024];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = 0;
  v6 = _citrus_lookup_seq_open(&v21, "/usr/share/i18n/esdb/esdb.alias", 1);
  if ((_DWORD)v6)
    return v6;
  v6 = _citrus_lookup_seq_open(&v20, "/usr/share/i18n/esdb/esdb.dir", 1);
  if ((_DWORD)v6)
    goto LABEL_25;
  number_of_entries = _citrus_lookup_get_number_of_entries(v21);
  v8 = _citrus_lookup_get_number_of_entries(v20) + number_of_entries;
  _citrus_lookup_seq_rewind(v21);
  _citrus_lookup_seq_rewind(v20);
  v9 = malloc_type_malloc(8 * v8, 0x10040436913F5uLL);
  v10 = 0;
  if (!v9)
  {
LABEL_21:
    v6 = *__error();
LABEL_22:
    if (!(_DWORD)v6)
      goto LABEL_24;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = _citrus_lookup_seq_next(v21);
    if ((_DWORD)v11)
      break;
    snprintf(__str, 0x400uLL, "%.*s/%.*s", 0, 0, 0, 0);
    _citrus_bcs_convert_to_upper((unsigned __int8 *)__str);
    v12 = strdup(__str);
    v9[v10] = v12;
    if (!v12)
      goto LABEL_21;
    ++v10;
  }
  v6 = v11;
  if ((_DWORD)v11 != 2)
    goto LABEL_22;
  while (1)
  {
    v13 = _citrus_lookup_seq_next(v20);
    if ((_DWORD)v13)
      break;
    if ((a3 & 1) == 0)
    {
      snprintf(__str, 0x400uLL, "%.*s");
      goto LABEL_17;
    }
    snprintf(__s, 0x400uLL, "%.*s", 0, 0);
    v14 = strchr(__s, 47);
    if (v14)
    {
      strlen(v14);
      __memmove_chk();
    }
    v15 = strstr(__s, ".esdb");
    if (v15)
      *v15 = 0;
    if (!strchr(__s, 64))
    {
      snprintf(__str, 0x400uLL, "%s/%.*s");
LABEL_17:
      _citrus_bcs_convert_to_upper((unsigned __int8 *)__str);
      v16 = _citrus_lookup_seq_lookup(v21);
      if ((_DWORD)v16)
      {
        v6 = v16;
        if ((_DWORD)v16 != 2)
          goto LABEL_22;
        v17 = strdup(__str);
        v9[v10] = v17;
        if (!v17)
          goto LABEL_21;
        ++v10;
      }
    }
  }
  v6 = v13;
  if ((_DWORD)v13 != 2)
    goto LABEL_22;
  v19 = malloc_type_realloc(v9, 8 * v10, 0x10040436913F5uLL);
  if (!v19)
  {
    v6 = 12;
LABEL_23:
    _citrus_esdb_free_list((void **)v9, v10);
    goto LABEL_24;
  }
  v6 = 0;
  *a1 = v19;
  *a2 = v10;
LABEL_24:
  _citrus_lookup_seq_close(v20);
LABEL_25:
  _citrus_lookup_seq_close(v21);
  return v6;
}

char *_citrus_iconv_canonicalize(uint64_t a1)
{
  char *v2;

  v2 = (char *)malloc_type_calloc(0x400uLL, 1uLL, 0x100004077774924uLL);
  if (v2)
    _citrus_esdb_alias(a1, v2, 0x400uLL);
  return v2;
}

uint64_t _citrus_lookup_factory_convert()
{
  uint64_t v0;
  FILE *v1;
  FILE *v2;
  FILE *v3;
  uint64_t v4;
  char *v5;
  size_t *v6;
  unsigned __int8 *v7;
  _BYTE *v8;
  unsigned __int8 *v9;
  const char *v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  size_t v14;
  void *v15;
  size_t __n;
  const void *v18;
  size_t v19;
  void *v20;
  size_t v21;
  char __str[2048];
  char __s1[2048];
  uint64_t v24;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v3 = (FILE *)v0;
  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0;
  v20 = 0;
  __n = 0;
  v18 = 0;
  v4 = _citrus_db_factory_create(&v20, (uint64_t)_citrus_db_hash_std, 0);
  if (!(_DWORD)v4)
  {
    while (1)
    {
      v5 = fgetln(v2, &__n);
      v6 = (size_t *)v20;
      if (!v5)
        break;
      v7 = (unsigned __int8 *)v5;
      v21 = __n;
      v8 = memchr(v5, 35, __n);
      if (v8)
        v21 = v8 - v7;
      v9 = _citrus_bcs_skip_ws_len(v7, (uint64_t *)&v21);
      if (v21)
      {
        v10 = (const char *)v9;
        v11 = _citrus_bcs_skip_nonws_len(v9, (uint64_t *)&v21);
        if (v11 != (unsigned __int8 *)v10)
        {
          v12 = v11;
          snprintf(__str, 0x800uLL, "%.*s", (_DWORD)v11 - (_DWORD)v10, v10);
          _citrus_bcs_convert_to_lower((unsigned __int8 *)__str);
          v13 = _citrus_bcs_skip_ws_len(v12, (uint64_t *)&v21);
          _citrus_bcs_trunc_rws_len((uint64_t)v13, &v21);
          snprintf(__s1, 0x800uLL, "%.*s", v21, (const char *)v13);
          v4 = _citrus_db_factory_add_string_by_string((uint64_t)v6, __str, __s1);
          if ((_DWORD)v4)
          {
            _citrus_db_factory_free((void ***)v20);
            return v4;
          }
        }
      }
    }
    v14 = _citrus_db_factory_calc_size(v20);
    v15 = malloc_type_malloc(v14, 0x8366329DuLL);
    if (v15)
    {
      v18 = v15;
      v19 = v14;
      v4 = _citrus_db_factory_serialize(v6, (uint64_t)"LOOKUP", (uint64_t)&v18);
    }
    else
    {
      v4 = *__error();
    }
    _citrus_db_factory_free((void ***)v20);
    if (!(_DWORD)v4)
    {
      if (fwrite(v18, v19, 1uLL, v3) == 1)
        return 0;
      else
        return *__error();
    }
  }
  return v4;
}

void _citrus_lookup_seq_rewind(uint64_t a1)
{
  *(_DWORD *)(a1 + 52) = 1;
  free(*(void **)(a1 + 56));
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
}

uint64_t _citrus_lookup_seq_next(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 72))();
}

uint64_t _citrus_lookup_seq_lookup(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 80))();
}

uint64_t _citrus_lookup_get_number_of_entries(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 88))();
}

void _citrus_lookup_seq_close(uint64_t a1)
{
  free(*(void **)(a1 + 56));
  (*(void (**)(uint64_t))(a1 + 96))(a1);
  free((void *)a1);
}

uint64_t seq_next_db(uint64_t a1, char **a2, _QWORD *a3)
{
  char *v6;
  char *v7;
  signed int v9;
  uint64_t *v10;

  v6 = *(char **)(a1 + 56);
  if (v6)
  {
    if (a2)
    {
      v7 = *(char **)(a1 + 64);
      *a2 = v6;
      a2[1] = v7;
    }
    return _citrus_db_lookup_by_string(*(uint64_t **)a1, v6, a3, a1 + 32);
  }
  else
  {
    if (*(_DWORD *)(a1 + 52))
    {
      v9 = 0;
      *(_DWORD *)(a1 + 28) = 0;
    }
    else
    {
      v9 = *(_DWORD *)(a1 + 28);
    }
    *(_DWORD *)(a1 + 52) = 0;
    if (v9 >= *(_DWORD *)(a1 + 24))
    {
      return 2;
    }
    else
    {
      v10 = *(uint64_t **)a1;
      *(_DWORD *)(a1 + 28) = v9 + 1;
      return _citrus_db_get_entry(v10, v9, a2, a3);
    }
  }
}

uint64_t seq_get_num_entries_db(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t seq_next_plain(uint64_t a1, unsigned __int8 **a2, unsigned __int8 **a3)
{
  unint64_t v6;
  void *v7;
  _BYTE *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  const void *v12;
  uint64_t result;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  size_t v16;
  size_t __n;

  if (*(_DWORD *)(a1 + 52))
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)a1;
    *(_QWORD *)(a1 + 32) = 0;
  }
  __n = 0;
  *(_DWORD *)(a1 + 52) = 0;
  v6 = _citrus_memory_stream_getln((_QWORD *)(a1 + 16), &__n);
  if (!v6)
    return 2;
  v7 = (void *)v6;
  while (1)
  {
    v8 = memchr(v7, 35, __n);
    if (v8)
      __n = v8 - (_BYTE *)v7;
    _citrus_bcs_trunc_rws_len((uint64_t)v7, &__n);
    v9 = _citrus_bcs_skip_ws_len((unsigned __int8 *)v7, (uint64_t *)&__n);
    v10 = _citrus_bcs_skip_nonws_len(v9, (uint64_t *)&__n);
    if (v9 != v10)
    {
      v11 = v10;
      v12 = *(const void **)(a1 + 56);
      if (!v12 || v10 - v9 == *(_QWORD *)(a1 + 64) && !memcmp(v9, v12, v10 - v9))
        break;
    }
    v7 = (void *)_citrus_memory_stream_getln((_QWORD *)(a1 + 16), &__n);
    if (!v7)
      return 2;
  }
  if (a2)
  {
    *a2 = v9;
    a2[1] = (unsigned __int8 *)(v11 - v9);
  }
  v14 = _citrus_bcs_skip_ws_len(v11, (uint64_t *)&__n);
  if (!a3)
    return 0;
  v15 = v14;
  result = 0;
  v16 = __n;
  if (!__n)
    v15 = 0;
  *a3 = v15;
  a3[1] = (unsigned __int8 *)v16;
  return result;
}

uint64_t seq_lookup_plain(uint64_t a1, const char *a2, _QWORD *a3)
{
  unsigned __int8 *v6;
  char *v7;
  void *v8;
  void *v9;
  uint64_t result;
  size_t v11;
  size_t v12;

  *(_DWORD *)(a1 + 52) = 0;
  free(*(void **)(a1 + 56));
  v6 = (unsigned __int8 *)strdup(a2);
  v7 = (char *)v6;
  *(_QWORD *)(a1 + 56) = v6;
  if (*(_DWORD *)(a1 + 48))
  {
    _citrus_bcs_convert_to_lower(v6);
    v7 = *(char **)(a1 + 56);
  }
  v12 = 0;
  *(_QWORD *)(a1 + 64) = strlen(v7);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)a1;
  *(_QWORD *)(a1 + 32) = 0;
  v8 = _citrus_memory_stream_matchline((_QWORD *)(a1 + 16), v7, &v12, 0);
  if (!v8)
    return 2;
  if (!a3)
    return 0;
  v9 = v8;
  result = 0;
  v11 = v12;
  *a3 = v9;
  a3[1] = v11;
  return result;
}

uint64_t seq_get_num_entries_plain(uint64_t a1)
{
  uint64_t v2;

  LODWORD(v2) = -1;
  do
    v2 = (v2 + 1);
  while (!seq_next_plain(a1, 0, 0));
  return v2;
}

uint64_t _citrus_mapper_get_mapdir_from_key(char *a1)
{
  uint64_t result;
  const char *v3;

  if (!strncmp(a1, "UCS:", 4uLL) || !strncmp(a1, "UCS/", 4uLL))
    return 1;
  result = (uint64_t)strchr(a1, 47);
  if (result)
  {
    v3 = (const char *)(result + 1);
    if (!strncmp((const char *)(result + 1), "UCS", 4uLL))
      return 2;
    else
      return 2 * (strncmp(v3, "UCS:", 4uLL) == 0);
  }
  return result;
}

uint64_t _citrus_mapper_open(uint64_t a1, uint64_t *a2, char *a3)
{
  uint64_t *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  char *v16;
  uint64_t v17;
  int mapdir_from_key;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  char v26[1024];
  char __str[1024];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  pthread_rwlock_wrlock(&cm_lock);
  v6 = (uint64_t *)(a1 + 8 * (int)_string_hash_func(a3, 0x65u));
  v7 = *v6;
  if (!*v6)
  {
LABEL_4:
    v21 = 0;
    v22 = 0;
    v8 = *(const char **)(a1 + 808);
    v25 = 0uLL;
    snprintf(__str, 0x400uLL, "%s/%s", v8, "mapper.dir");
    v9 = _citrus_map_file(&v25, __str);
    if ((_DWORD)v9)
    {
      v10 = v9;
      goto LABEL_20;
    }
    v23 = v25;
    v24 = 0;
    v11 = (unsigned __int8 *)_citrus_memory_stream_matchline(&v23, a3, (size_t *)&v22, 0);
    if (v11)
    {
      if ((unint64_t)(v22 - 1024) > 0xFFFFFFFFFFFFFC00)
      {
        v12 = v11;
        v13 = _citrus_bcs_skip_nonws_len(v11, &v22);
        v14 = v13 - v12 + 1;
        __strlcpy_chk();
        v15 = _citrus_bcs_skip_ws_len(v13, &v22);
        strlcpy(&v26[v14], (const char *)v15, v22 + 1);
        _citrus_unmap_file((uint64_t)&v25);
        pthread_rwlock_unlock(&cm_lock);
        v10 = mapper_open(a1, &v21, v26, &v26[v14]);
        pthread_rwlock_wrlock(&cm_lock);
        if (!(_DWORD)v10)
        {
          v16 = strdup(a3);
          v17 = v21;
          *(_QWORD *)(v21 + 56) = v16;
          if (v16)
          {
            *(_DWORD *)(v17 + 48) = 1;
            if (!*(_DWORD *)(v17 + 64))
            {
              mapdir_from_key = _citrus_mapper_get_mapdir_from_key(v16);
              *(_DWORD *)(v17 + 64) = mapdir_from_key;
              if (((mapdir_from_key + 3) & mapdir_from_key) != 0)
                _citrus_mapper_open_cold_1();
            }
            v19 = *v6;
            *(_QWORD *)(v17 + 32) = *v6;
            if (v19)
              *(_QWORD *)(v19 + 40) = v17 + 32;
            v10 = 0;
            *v6 = v17;
            *(_QWORD *)(v17 + 40) = v6;
            *a2 = v17;
          }
          else
          {
            v10 = *__error();
            _citrus_mapper_close(v17);
          }
        }
        goto LABEL_20;
      }
      v10 = 22;
    }
    else
    {
      v10 = 2;
    }
    _citrus_unmap_file((uint64_t)&v25);
    goto LABEL_20;
  }
  while (strcmp(*(const char **)(v7 + 56), a3))
  {
    v7 = *(_QWORD *)(v7 + 32);
    if (!v7)
      goto LABEL_4;
  }
  v10 = 0;
  ++*(_DWORD *)(v7 + 48);
  *a2 = v7;
LABEL_20:
  pthread_rwlock_unlock(&cm_lock);
  return v10;
}

void _citrus_mapper_close(uint64_t a1)
{
  int v2;
  BOOL v3;
  int v4;
  uint64_t v5;

  if (a1)
  {
    pthread_rwlock_wrlock(&cm_lock);
    v2 = *(_DWORD *)(a1 + 48);
    if (v2 != -1)
    {
      v3 = __OFSUB__(v2, 1);
      v4 = v2 - 1;
      if (v4 < 0 != v3)
      {
LABEL_8:
        pthread_rwlock_unlock(&cm_lock);
        mapper_close((void *)a1);
        return;
      }
      *(_DWORD *)(a1 + 48) = v4;
      if (!v4)
      {
        v5 = *(_QWORD *)(a1 + 32);
        if (v5)
          *(_QWORD *)(v5 + 40) = *(_QWORD *)(a1 + 40);
        **(_QWORD **)(a1 + 40) = v5;
        free(*(void **)(a1 + 56));
        goto LABEL_8;
      }
    }
    pthread_rwlock_unlock(&cm_lock);
  }
}

void mapper_close(void *a1)
{
  void *v2;
  void (**v3)(_QWORD);

  v2 = (void *)*((_QWORD *)a1 + 2);
  if (v2)
  {
    v3 = *(void (***)(_QWORD))a1;
    if (*(_QWORD *)a1)
    {
      if (*((_QWORD *)a1 + 1))
      {
        ((void (**)(void *))v3)[1](a1);
        v3 = *(void (***)(_QWORD))a1;
      }
      free(v3);
      v2 = (void *)*((_QWORD *)a1 + 2);
    }
    _citrus_unload_module(v2);
  }
  free(*((void **)a1 + 3));
  free(a1);
}

unint64_t _citrus_memory_stream_getln(_QWORD *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int v8;

  v3 = a1[1];
  v2 = a1[2];
  if (v3 <= v2)
    return 0;
  v4 = *a1 + v2;
  v5 = v3 - v2;
  if (v5)
  {
    v6 = 0;
    while (1)
    {
      v7 = v6 + 1;
      v8 = *(unsigned __int8 *)(v4 + v6);
      if (v8 == 10 || v8 == 13)
        break;
      v6 = v7;
      if (v5 == v7)
        goto LABEL_12;
    }
    v5 = v7;
  }
LABEL_12:
  a1[2] = v5 + v2;
  *a2 = v5;
  return v4;
}

void *_citrus_memory_stream_matchline(_QWORD *a1, char *__s, size_t *a3, int a4)
{
  size_t v8;
  void *result;
  void *v10;
  _BYTE *v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  size_t __n;

  __n = 0;
  v8 = strlen(__s);
  result = (void *)_citrus_memory_stream_getln(a1, &__n);
  if (result)
  {
    v10 = result;
    do
    {
      v11 = memchr(v10, 35, __n);
      if (v11)
        __n = v11 - (_BYTE *)v10;
      _citrus_bcs_trunc_rws_len((uint64_t)v10, &__n);
      if (__n)
      {
        v12 = _citrus_bcs_skip_ws_len((unsigned __int8 *)v10, (uint64_t *)&__n);
        v13 = _citrus_bcs_skip_nonws_len(v12, (uint64_t *)&__n);
        if (v13 - v12 == v8)
        {
          v14 = v13;
          if (a4)
          {
            if (!memcmp(__s, v12, v8))
              goto LABEL_13;
          }
          else if (!_citrus_bcs_strncasecmp(__s, (char *)v12, v8))
          {
LABEL_13:
            result = _citrus_bcs_skip_ws_len(v14, (uint64_t *)&__n);
            *a3 = __n;
            return result;
          }
        }
      }
      result = (void *)_citrus_memory_stream_getln(a1, &__n);
      v10 = result;
    }
    while (result);
  }
  return result;
}

char *_citrus_memory_stream_chr(_QWORD *a1, unint64_t *a2, int __c)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v7;
  BOOL v8;
  size_t v9;
  size_t v10;
  char *result;
  uint64_t v12;

  v3 = a1[1];
  v4 = a1[2];
  if (v4 >= v3)
    return 0;
  v7 = *a1 + v4;
  v8 = v3 >= v4;
  v9 = v3 - v4;
  if (v8)
    v10 = v9;
  else
    v10 = 0;
  result = (char *)memchr((void *)(*a1 + v4), __c, v10);
  *a2 = v7;
  if (result)
  {
    a2[1] = (unint64_t)&result[-v7];
    v12 = (uint64_t)&result[v4 - v7 + 1];
  }
  else
  {
    a2[1] = v10;
    v12 = a1[1];
  }
  a1[2] = v12;
  return result;
}

uint64_t *_citrus_memory_stream_skip_ws(uint64_t *result)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  int v4;

  v1 = result[1];
  v2 = result[2];
  if (v2 < v1)
  {
    v3 = *result;
    do
    {
      v4 = *(unsigned __int8 *)(v3 + v2);
      if ((v4 - 9) >= 5 && v4 != 32)
        break;
      result[2] = ++v2;
    }
    while (v1 != v2);
  }
  return result;
}

void *_citrus_unload_module(void *result)
{
  if (result)
  {
    if (result == (void *)-3)
      _citrus_unload_module_cold_1();
    return (void *)dlclose(result);
  }
  return result;
}

uint64_t _citrus_NONE_stdenc_init(uint64_t a1, char *a2, unint64_t a3, uint64_t a4)
{
  _DWORD *v8;
  _DWORD *i;
  char v10;
  uint64_t result;

  v8 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  if (!v8)
    return *__error();
  for (i = v8; a3; --a3)
  {
    v10 = *a2;
    if ((*a2 - 91) >= 0xE6u)
      v10 = *a2 + 32;
    if (a3 >= 4 && v10 == 55 && !_citrus_bcs_strncasecmp(a2, "7bit", 4))
    {
      *i = 2139062143;
      a2 += 4;
      a3 -= 4;
    }
    ++a2;
  }
  if (!*i)
    *i = -1;
  result = 0;
  *(_QWORD *)(a1 + 8) = i;
  *(_QWORD *)(a4 + 16) = 1;
  *(_OWORD *)a4 = xmmword_1DEF71A80;
  return result;
}

void _citrus_NONE_stdenc_uninit(uint64_t a1)
{
  free(*(void **)(a1 + 8));
}

uint64_t _citrus_NONE_stdenc_mbtocs(uint64_t a1, _DWORD *a2, _DWORD *a3, _QWORD *a4, uint64_t a5, uint64_t a6, _BOOL8 *a7, void (**a8)(void))
{
  _BYTE *v8;
  int v9;
  _BOOL8 v10;

  if (a5)
  {
    *a2 = 0;
    v8 = (_BYTE *)(*a4)++;
    v9 = *v8;
    v10 = *v8 != 0;
    *a3 = v9;
    *a7 = v10;
    if (a8 && *a8)
      (*a8)();
  }
  else
  {
    *a7 = -2;
  }
  return 0;
}

uint64_t _citrus_NONE_stdenc_cstomb(uint64_t a1, uint64_t a2, unint64_t a3, int a4, unsigned int a5, uint64_t a6, uint64_t *a7)
{
  uint64_t result;
  uint64_t v8;

  if (a4 != -1)
  {
    if (a4 || (a5 & ~**(_DWORD **)(a1 + 8)) != 0)
      return 92;
    if (a5 > 0xFF)
    {
      if (HIWORD(a5))
      {
        if (HIBYTE(a5))
        {
          if (a3 >= 4)
          {
            result = 0;
            *(_DWORD *)a2 = a5;
            v8 = 4;
            goto LABEL_6;
          }
        }
        else if (a3 >= 3)
        {
          result = 0;
          *(_WORD *)a2 = a5;
          *(_BYTE *)(a2 + 2) = BYTE2(a5);
          v8 = 3;
          goto LABEL_6;
        }
      }
      else if (a3 >= 2)
      {
        result = 0;
        *(_WORD *)a2 = a5;
        v8 = 2;
        goto LABEL_6;
      }
    }
    else if (a3)
    {
      result = 0;
      *(_BYTE *)a2 = a5;
      v8 = 1;
      goto LABEL_6;
    }
    result = 7;
    v8 = -1;
    goto LABEL_6;
  }
  v8 = 0;
  result = 0;
LABEL_6:
  *a7 = v8;
  return result;
}

uint64_t _citrus_NONE_stdenc_mbtowc(uint64_t a1, _DWORD *a2, _QWORD *a3, uint64_t a4, uint64_t a5, _QWORD *a6, uint64_t a7)
{
  int v7;
  void (*v8)(_QWORD, _QWORD);

  if (*a3)
  {
    if (a4)
    {
      v7 = *(unsigned __int8 *)*a3;
      if (a2)
        *a2 = v7;
      *a6 = v7 != 0;
      if (a7)
      {
        v8 = *(void (**)(_QWORD, _QWORD))(a7 + 8);
        if (v8)
          v8(*a2, *(_QWORD *)(a7 + 16));
      }
    }
    else
    {
      *a6 = -2;
    }
  }
  else
  {
    *a6 = 0;
  }
  return 0;
}

uint64_t _citrus_NONE_stdenc_wctomb(uint64_t a1, _BYTE *a2, uint64_t a3, unsigned int a4, uint64_t a5, _QWORD *a6)
{
  uint64_t result;

  if (a4 >= 0x100)
  {
    *a6 = -1;
    return 92;
  }
  else if (a3)
  {
    *a6 = 1;
    result = 0;
    if (a2)
      *a2 = a4;
  }
  else
  {
    *a6 = -1;
    return 7;
  }
  return result;
}

uint64_t _citrus_NONE_stdenc_put_state_reset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  *a5 = 0;
  return 0;
}

uint64_t _citrus_NONE_stdenc_get_state_desc(uint64_t a1, uint64_t a2, int a3, _DWORD *a4)
{
  uint64_t result;

  if (a3)
    return 102;
  result = 0;
  *a4 = 1;
  return result;
}

uint64_t _citrus_pivot_factory_convert()
{
  uint64_t v0;
  FILE *v1;
  FILE *v2;
  FILE *v3;
  char *v4;
  unsigned __int8 *v5;
  _BYTE *v6;
  unsigned __int8 *v7;
  const char *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  const char *v12;
  unsigned __int8 *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  void *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  size_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  size_t v29;
  void *v30;
  size_t __n;
  const void *v33;
  size_t v34;
  uint64_t v35;
  uint64_t *v36;
  char *__endptr;
  size_t v38;
  char v39[2048];
  char __str[8];
  void *v41;
  size_t v42;
  uint64_t v43;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v3 = (FILE *)v0;
  v43 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = 0;
  __n = 0;
  v35 = 0;
  v36 = &v35;
  while (1)
  {
    v4 = fgetln(v2, &__n);
    if (!v4)
      break;
    v5 = (unsigned __int8 *)v4;
    v38 = __n;
    v6 = memchr(v4, 35, __n);
    if (v6)
      v38 = v6 - v5;
    v7 = _citrus_bcs_skip_ws_len(v5, (uint64_t *)&v38);
    if (v38)
    {
      v8 = (const char *)v7;
      v9 = _citrus_bcs_skip_nonws_len(v7, (uint64_t *)&v38);
      if (v9 != (unsigned __int8 *)v8)
      {
        v10 = v9;
        snprintf((char *)&v41, 0x800uLL, "%.*s", (_DWORD)v9 - (_DWORD)v8, v8);
        v11 = _citrus_bcs_skip_ws_len(v10, (uint64_t *)&v38);
        if (v38)
        {
          v12 = (const char *)v11;
          v13 = _citrus_bcs_skip_nonws_len(v11, (uint64_t *)&v38);
          if (v13 != (unsigned __int8 *)v12)
          {
            v14 = v13;
            __endptr = 0;
            snprintf(__str, 0x800uLL, "%.*s", (_DWORD)v13 - (_DWORD)v12, v12);
            v15 = _citrus_bcs_skip_ws_len(v14, (uint64_t *)&v38);
            _citrus_bcs_trunc_rws_len((uint64_t)v15, &v38);
            snprintf(v39, 0x800uLL, "%.*s", v38, (const char *)v15);
            v16 = strtoul(v39, &__endptr, 0);
            if (*__endptr)
            {
              v22 = 79;
              goto LABEL_35;
            }
            v17 = v16;
            v18 = v35;
            if (v35)
            {
              while (_citrus_bcs_strcasecmp(*(unsigned __int8 **)v18, (unsigned __int8 *)&v41))
              {
                v18 = *(_QWORD *)(v18 + 16);
                if (!v18)
                  goto LABEL_13;
              }
            }
            else
            {
LABEL_13:
              v19 = malloc_type_malloc(0x18uLL, 0x30040D3A788E3uLL);
              if (!v19)
              {
                v22 = *__error();
                goto LABEL_35;
              }
              v18 = (uint64_t)v19;
              v20 = strdup((const char *)&v41);
              *(_QWORD *)v18 = v20;
              if (!v20)
              {
                v22 = *__error();
                goto LABEL_34;
              }
              v21 = _citrus_db_factory_create((_QWORD *)(v18 + 8), (uint64_t)_citrus_db_hash_std, 0);
              if ((_DWORD)v21)
              {
                v22 = v21;
                free(*(void **)v18);
LABEL_34:
                free((void *)v18);
LABEL_35:
                free_src(&v35);
                return v22;
              }
              *(_QWORD *)(v18 + 16) = 0;
              *v36 = v18;
              v36 = (uint64_t *)(v18 + 16);
            }
            v22 = _citrus_db_factory_add32_by_string(*(_QWORD *)(v18 + 8), __str, v17);
            if ((_DWORD)v22)
              goto LABEL_35;
          }
        }
      }
    }
  }
  *(_QWORD *)__str = 0;
  v42 = 0;
  v41 = 0;
  v23 = _citrus_db_factory_create(__str, (uint64_t)_citrus_db_hash_std, 0);
  if ((_DWORD)v23)
  {
    v22 = v23;
    goto LABEL_35;
  }
  v24 = v35;
  if (v35)
  {
    while (1)
    {
      v25 = _citrus_db_factory_calc_size(*(_QWORD **)(v24 + 8));
      v26 = malloc_type_malloc(v25, 0xECAF80FCuLL);
      v27 = v26;
      if (!v26)
        break;
      v41 = v26;
      v42 = v25;
      v28 = _citrus_db_factory_serialize(*(size_t **)(v24 + 8), (uint64_t)"CSPIVSUB", (uint64_t)&v41);
      if ((_DWORD)v28
        || (v28 = _citrus_db_factory_add_by_string(*(uint64_t *)__str, *(char **)v24, (uint64_t)&v41, 1), (_DWORD)v28))
      {
        v22 = v28;
        goto LABEL_39;
      }
      v24 = *(_QWORD *)(v24 + 16);
      if (!v24)
        goto LABEL_27;
    }
  }
  else
  {
LABEL_27:
    v29 = _citrus_db_factory_calc_size(*(_QWORD **)__str);
    v30 = malloc_type_malloc(v29, 0x8B0617E8uLL);
    if (v30)
    {
      v33 = v30;
      v34 = v29;
      v22 = _citrus_db_factory_serialize(*(size_t **)__str, (uint64_t)"CSPIVOT", (uint64_t)&v33);
      v27 = 0;
      goto LABEL_39;
    }
    v27 = 0;
  }
  v22 = 0;
LABEL_39:
  free(v27);
  _citrus_db_factory_free(*(void ****)__str);
  free_src(&v35);
  if (!(_DWORD)v22)
  {
    if (fwrite(v33, v34, 1uLL, v3) == 1)
      return 0;
    else
      return *__error();
  }
  return v22;
}

void free_src(uint64_t *a1)
{
  uint64_t i;
  uint64_t v3;

  for (i = *a1; *a1; i = *a1)
  {
    v3 = *(_QWORD *)(i + 16);
    *a1 = v3;
    if (!v3)
      a1[1] = (uint64_t)a1;
    _citrus_db_factory_free(*(void ****)(i + 8));
    free(*(void **)i);
    free((void *)i);
  }
}

uint64_t _citrus_prop_parse_variable(unsigned __int8 **a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v12;
  unsigned __int8 *v13;
  unsigned __int8 **v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t *, uint64_t *);
  uint64_t v19;
  unint64_t v20;
  int v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unsigned __int8 v32[256];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v26 = a4;
  v27 = 0;
  _citrus_memory_stream_skip_ws(&v25);
  v7 = v26;
  v6 = v27;
  if (v27 >= v26)
    return 0;
  do
  {
    v27 = v6 + 1;
    v8 = v25;
    if (!*(_BYTE *)(v25 + v6))
      return 0;
    v9 = 0;
    v27 = v6;
    v28 = 0;
    v30 = 0;
    v31 = 0;
    v29 = 0;
    do
    {
      if (v6 >= v7)
      {
        v10 = -1;
      }
      else
      {
        v27 = v6 + 1;
        v10 = *(unsigned __int8 *)(v8 + v6++);
        if (v10 == 95)
          goto LABEL_13;
      }
      if (v10 - 58 <= 0xFFFFFFF5 && (v10 & 0xDFu) - 91 < 0xFFFFFFE6)
        goto LABEL_21;
LABEL_13:
      v32[v9++] = v10;
    }
    while (v9 != 256);
    if (v6 < v7)
    {
      v27 = v6 + 1;
      v10 = *(unsigned __int8 *)(v8 + v6);
      if (v10 != 95)
      {
        ++v6;
        goto LABEL_18;
      }
      return 22;
    }
    v10 = -1;
LABEL_18:
    v12 = 22;
    if (v10 - 58 > 0xFFFFFFF5 || (v10 & 0xDFu) - 91 > 0xFFFFFFE5)
      return v12;
    v9 = 256;
LABEL_21:
    if (v10 != -1 && v6)
      v27 = v6 - 1;
    v32[v9] = 0;
    v13 = *a1;
    if (!*a1)
      return 22;
    v14 = a1 + 2;
    while (_citrus_bcs_strcasecmp(v32, v13))
    {
      v13 = v14[1];
      v14 += 3;
      if (!v13)
        return 22;
    }
    _citrus_memory_stream_skip_ws(&v25);
    v15 = v27;
    if (v27 < v26)
    {
      ++v27;
      v16 = *(unsigned __int8 *)(v25 + v15);
      if (v16 != 58 && v16 != 61)
        v27 = v15;
    }
    v17 = *((unsigned int *)v14 - 2);
    v18 = (uint64_t (*)(uint64_t *, uint64_t *))*(&readers + v17);
    while (2)
    {
      LODWORD(v30) = v17;
      v31 = 0;
      LODWORD(v28) = v17;
      v29 = 0;
      v19 = v18(&v25, &v30);
      if ((_DWORD)v19)
        return v19;
      _citrus_memory_stream_skip_ws(&v25);
      v20 = v27;
      if (v27 >= v26)
        goto LABEL_41;
      ++v27;
      v21 = *(unsigned __int8 *)(v25 + v20);
      if (v17 >= 2 && v21 == 45)
      {
        v19 = v18(&v25, &v28);
        if ((_DWORD)v19)
          return v19;
        _citrus_memory_stream_skip_ws(&v25);
        v22 = v27;
        if (v27 < v26)
        {
          ++v27;
          v21 = *(unsigned __int8 *)(v25 + v22);
          goto LABEL_42;
        }
LABEL_41:
        v21 = -1;
      }
LABEL_42:
      switch((int)v17)
      {
        case 0:
          v23 = ((uint64_t (*)(uint64_t, unsigned __int8 *, _QWORD))*v14)(a2, v13, v31);
          break;
        case 1:
          v23 = ((uint64_t (*)(uint64_t, unsigned __int8 *, void *))*v14)(a2, v13, v31);
          break;
        case 2:
          v23 = ((uint64_t (*)(uint64_t, unsigned __int8 *, _QWORD, _QWORD))*v14)(a2, v13, v31, v29);
          break;
        case 3:
          v23 = ((uint64_t (*)(uint64_t, unsigned __int8 *, void *, void *))*v14)(a2, v13, v31, v29);
          break;
        default:
          abort();
      }
      v12 = v23;
      if ((_DWORD)v30 == 1)
        free(v31);
      if ((_DWORD)v28 == 1)
        free(v29);
      if ((_DWORD)v12)
        return v12;
      if (v21 == 44)
        continue;
      break;
    }
    if (v21 != -1 && v21 != 59 && v27)
      --v27;
    _citrus_memory_stream_skip_ws(&v25);
    v12 = 0;
    v7 = v26;
    v6 = v27;
  }
  while (v27 < v26);
  return v12;
}

uint64_t _citrus_prop_read_BOOL(uint64_t *a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;
  char v14;
  uint64_t result;

  _citrus_memory_stream_skip_ws(a1);
  v5 = a1[1];
  v4 = a1[2];
  if (v4 >= v5)
  {
    v6 = -1;
  }
  else
  {
    a1[2] = v4 + 1;
    v6 = *(_BYTE *)(*a1 + v4++);
  }
  if ((v6 - 91) >= 0xE6u)
    v6 += 32;
  if (v6 == 102)
  {
    if (v4 >= v5)
    {
      v8 = -1;
    }
    else
    {
      a1[2] = v4 + 1;
      v8 = *(_BYTE *)(*a1 + v4++);
    }
    if ((v8 - 91) >= 0xE6u)
      v8 += 32;
    if (v8 == 97)
    {
      if (v4 >= v5)
      {
        v10 = -1;
      }
      else
      {
        a1[2] = v4 + 1;
        v10 = *(_BYTE *)(*a1 + v4++);
      }
      if ((v10 - 91) >= 0xE6u)
        v10 += 32;
      if (v10 == 108)
      {
        if (v4 >= v5)
        {
          v12 = -1;
        }
        else
        {
          a1[2] = v4 + 1;
          v12 = *(_BYTE *)(*a1 + v4++);
        }
        if ((v12 - 91) >= 0xE6u)
          v12 += 32;
        if (v12 == 115)
        {
          if (v4 >= v5)
          {
            v14 = -1;
          }
          else
          {
            a1[2] = v4 + 1;
            v14 = *(_BYTE *)(*a1 + v4);
          }
          if ((v14 - 91) >= 0xE6u)
            v14 += 32;
          if (v14 == 101)
          {
            v13 = 0;
            goto LABEL_52;
          }
        }
      }
    }
  }
  else if (v6 == 116)
  {
    if (v4 >= v5)
    {
      v7 = -1;
    }
    else
    {
      a1[2] = v4 + 1;
      v7 = *(_BYTE *)(*a1 + v4++);
    }
    if ((v7 - 91) >= 0xE6u)
      v7 += 32;
    if (v7 == 114)
    {
      if (v4 >= v5)
      {
        v9 = -1;
      }
      else
      {
        a1[2] = v4 + 1;
        v9 = *(_BYTE *)(*a1 + v4++);
      }
      if ((v9 - 91) >= 0xE6u)
        v9 += 32;
      if (v9 == 117)
      {
        if (v4 >= v5)
        {
          v11 = -1;
        }
        else
        {
          a1[2] = v4 + 1;
          v11 = *(_BYTE *)(*a1 + v4);
        }
        if ((v11 - 91) >= 0xE6u)
          v11 += 32;
        if (v11 == 101)
        {
          v13 = 1;
LABEL_52:
          result = 0;
          *(_BYTE *)(a2 + 8) = v13;
          return result;
        }
      }
    }
  }
  return 22;
}

uint64_t _citrus_prop_read_str(uint64_t *a1, uint64_t a2)
{
  _BYTE *v4;
  _BYTE *v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  int v12;
  uint64_t result;
  int v14;

  v4 = malloc_type_malloc(0x200uLL, 0x9CC340E3uLL);
  if (!v4)
    return 12;
  v5 = v4;
  _citrus_memory_stream_skip_ws(a1);
  v6 = a1[2];
  if (v6 >= a1[1])
  {
    v7 = 0;
  }
  else
  {
    v7 = 0;
    a1[2] = v6 + 1;
    v8 = *(unsigned __int8 *)(*a1 + v6);
    v9 = 512;
    if (v8 != 34 && v8 != 39)
    {
      if (v8 == 92)
      {
        v7 = 0;
        a1[2] = v6;
        v8 = -1;
        v9 = 512;
      }
      else
      {
        *v5 = v8;
        v8 = -1;
        v7 = 1;
        v9 = 511;
      }
    }
    while (1)
    {
      v11 = a1[2];
      if (v11 >= a1[1])
      {
        v12 = -1;
      }
      else
      {
        a1[2] = v11 + 1;
        v12 = *(unsigned __int8 *)(*a1 + v11++);
      }
      v14 = v12;
      if (v8 == v12 || v8 == -1 && (v12 == 59 || v12 <= 0x20u && ((1 << v12) & 0x100003E00) != 0))
        break;
      if (v12 != -1)
      {
        if (v11)
          a1[2] = v11 - 1;
      }
      _citrus_prop_read_character_common(a1, &v14);
      v5[v7++] = v14;
      if (!--v9)
      {
        v10 = malloc_type_realloc(v5, v7 + 512, 0xCDD31E71uLL);
        if (!v10)
        {
          free(v5);
          return 12;
        }
        v5 = v10;
        v9 = 512;
      }
    }
  }
  result = 0;
  v5[v7] = 0;
  *(_QWORD *)(a2 + 8) = v5;
  return result;
}

uint64_t _citrus_prop_read_character(uint64_t *a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  unsigned int v17;
  int v18;

  _citrus_memory_stream_skip_ws(a1);
  v4 = a1[2];
  if (v4 < a1[1])
  {
    a1[2] = v4 + 1;
    v18 = *(unsigned __int8 *)(*a1 + v4);
    if (v18 == 39)
    {
      _citrus_prop_read_character_common(a1, &v18);
      *(_DWORD *)(a2 + 8) = v18;
      v5 = a1[2];
      result = 22;
      if (v5 < a1[1])
      {
        a1[2] = v5 + 1;
        if (*(_BYTE *)(*a1 + v5) == 39)
          return 0;
        else
          return 22;
      }
      return result;
    }
    a1[2] = v4;
  }
  _citrus_memory_stream_skip_ws(a1);
  v7 = a1[1];
  v8 = a1[2];
  if (v8 >= v7)
    return 22;
  v9 = 0;
  v10 = v8 + 1;
  a1[2] = v8 + 1;
  v11 = *a1;
  v12 = *(unsigned __int8 *)(*a1 + v8);
  if (v12 != 43)
  {
    if (v12 != 45)
      goto LABEL_14;
    v9 = 1;
  }
  if (v10 >= v7)
    return 22;
  v13 = v8 + 2;
  a1[2] = v13;
  v12 = *(unsigned __int8 *)(v11 + v10);
  v10 = v13;
LABEL_14:
  if (v12 != 48)
  {
    if ((v12 - 58) >= 0xFFFFFFF6)
    {
      v17 = 10;
      v14 = v10;
LABEL_31:
      a1[2] = v14 - 1;
      goto LABEL_32;
    }
    return 22;
  }
  if (v10 >= v7)
  {
    v17 = 8;
    goto LABEL_32;
  }
  v14 = v10 + 1;
  a1[2] = v10 + 1;
  if ((*(_BYTE *)(v11 + v10) & 0xDF) != 0x58)
  {
    v17 = 8;
    goto LABEL_31;
  }
  if (v14 >= v7)
  {
    v16 = -1;
  }
  else
  {
    v15 = v10 + 2;
    a1[2] = v10 + 2;
    v16 = *(unsigned __int8 *)(v11 + v14);
    v14 = v15;
  }
  if (v16 - 58 > 0xFFFFFFF5 || (v16 & 0xDFu) - 71 > 0xFFFFFFF9)
  {
    v17 = 16;
    if (v16 != -1)
      goto LABEL_31;
LABEL_32:
    _citrus_prop_read_chr_common(a1, (int *)(a2 + 8), v17, v9);
    return 0;
  }
  if (v16 != -1)
    a1[2] = v14 - 1;
  result = 0;
  *(_DWORD *)(a2 + 8) = 0;
  return result;
}

uint64_t _citrus_prop_read_num(uint64_t *a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  uint64_t result;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  int v19;
  unsigned __int8 v20;
  void *v21;
  int v22;
  unint64_t v24;
  int v25;
  uint64_t v26;

  _citrus_memory_stream_skip_ws(a1);
  v5 = a1[1];
  v4 = a1[2];
  if (v4 >= v5)
    return 22;
  v6 = 0;
  v7 = v4 + 1;
  a1[2] = v4 + 1;
  v8 = *a1;
  v9 = *(unsigned __int8 *)(*a1 + v4);
  if (v9 != 43)
  {
    if (v9 != 45)
      goto LABEL_7;
    v6 = 1;
  }
  if (v7 >= v5)
    return 22;
  v10 = v4 + 2;
  a1[2] = v10;
  v9 = *(unsigned __int8 *)(v8 + v7);
  v7 = v10;
LABEL_7:
  if (v9 != 48)
  {
    if ((v9 - 58) >= 0xFFFFFFF6)
    {
      v25 = v6;
      v26 = a2;
      v14 = 10;
LABEL_24:
      a1[2] = --v7;
      goto LABEL_25;
    }
    return 22;
  }
  v26 = a2;
  v25 = v6;
  if (v7 >= v5)
  {
    v14 = 8;
    goto LABEL_25;
  }
  v11 = v7 + 1;
  a1[2] = v7 + 1;
  if ((*(_BYTE *)(v8 + v7) & 0xDF) != 0x58)
  {
    v14 = 8;
    ++v7;
    goto LABEL_24;
  }
  if (v11 >= v5)
  {
    v12 = -1;
    ++v7;
  }
  else
  {
    v7 += 2;
    a1[2] = v7;
    v12 = *(unsigned __int8 *)(v8 + v11);
  }
  if (v12 - 58 <= 0xFFFFFFF5 && (v12 & 0xDFu) - 71 <= 0xFFFFFFF9)
  {
    if (v12 != -1)
      a1[2] = v7 - 1;
    result = 0;
    *(_QWORD *)(a2 + 8) = 0;
    return result;
  }
  v14 = 16;
  if (v12 != -1)
    goto LABEL_24;
LABEL_25:
  v15 = 0;
  v16 = v14;
  v17 = 0xFFFFFFFFFFFFFFFFLL / v14;
  v18 = ~(v17 * v14);
  while (1)
  {
    if (v7 >= v5)
    {
      v19 = -1;
    }
    else
    {
      v19 = *(unsigned __int8 *)(v8 + v7++);
      a1[2] = v7;
    }
    v20 = v19 - 123 >= 0xFFFFFFE6 ? v19 - 32 : v19;
    v21 = memchr("0123456789ABCDEF", v20, 0x11uLL);
    if (!v21)
      break;
    v22 = (_DWORD)v21 - "0123456789ABCDEF";
    if (v22 >= (int)v16 || v15 > v17)
      break;
    if (v15 == v17 && v22 > v18)
    {
      v15 = v17;
      break;
    }
    v15 = v15 * v16 + v22;
  }
  if (v19 != -1 && v7)
    a1[2] = v7 - 1;
  result = 0;
  if (v25)
    v24 = -(uint64_t)v15;
  else
    v24 = v15;
  *(_QWORD *)(v26 + 8) = v24;
  return result;
}

uint64_t *_citrus_prop_read_character_common(uint64_t *result, int *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  unsigned int v8;

  v3 = result[1];
  v2 = result[2];
  if (v2 >= v3)
  {
    v6 = -1;
    goto LABEL_9;
  }
  v4 = v2 + 1;
  result[2] = v2 + 1;
  v5 = *result;
  v6 = *(unsigned __int8 *)(*result + v2);
  if (v6 != 92)
  {
LABEL_9:
    *a2 = v6;
    return result;
  }
  if (v4 >= v3)
  {
    v7 = -1;
LABEL_11:
    *a2 = v7;
    return result;
  }
  result[2] = v2 + 2;
  v7 = *(unsigned __int8 *)(v5 + v4);
  if (v7 > 0x61)
  {
    v8 = 16;
    switch(*(_BYTE *)(v5 + v4))
    {
      case 'n':
        v7 = 10;
        goto LABEL_11;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
      case 'w':
        goto LABEL_11;
      case 'r':
        v7 = 13;
        goto LABEL_11;
      case 't':
        v7 = 9;
        goto LABEL_11;
      case 'v':
        v7 = 11;
        goto LABEL_11;
      case 'x':
        return (uint64_t *)_citrus_prop_read_chr_common(result, a2, v8, 0);
      default:
        if (v7 == 98)
        {
          v7 = 8;
        }
        else if (v7 == 102)
        {
          v7 = 12;
        }
        goto LABEL_11;
    }
  }
  if (v7 - 48 >= 8)
  {
    if (v7 == 97)
      v7 = 7;
    goto LABEL_11;
  }
  result[2] = v4;
  v8 = 8;
  return (uint64_t *)_citrus_prop_read_chr_common(result, a2, v8, 0);
}

void *_citrus_prop_read_chr_common(_QWORD *a1, int *a2, unsigned int a3, int a4)
{
  signed int v7;
  signed int v8;
  signed int v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  unsigned __int8 v13;
  void *result;
  signed int v15;
  int v17;

  v7 = 0;
  v8 = 0xFF / a3;
  v9 = 0xFF % a3;
  v11 = a1[1];
  v10 = a1[2];
  while (1)
  {
    if (v10 >= v11)
    {
      v12 = -1;
    }
    else
    {
      v12 = *(unsigned __int8 *)(*a1 + v10++);
      a1[2] = v10;
    }
    v13 = v12 - 123 >= 0xFFFFFFE6 ? v12 - 32 : v12;
    result = memchr("0123456789ABCDEF", v13, 0x11uLL);
    if (!result)
      break;
    v15 = (_DWORD)result - "0123456789ABCDEF";
    if (v15 >= (int)a3 || v7 > v8)
      break;
    if (v7 == v8 && v15 > v9)
    {
      v7 = v8;
      break;
    }
    v7 = v15 + v7 * a3;
  }
  if (v12 != -1 && v10)
    a1[2] = v10 - 1;
  if (a4)
    v17 = -v7;
  else
    v17 = v7;
  *a2 = v17;
  return result;
}

void _citrus_stdenc_close(__int128 *a1)
{
  uint64_t v2;
  _QWORD *v3;
  void (*v4)(__int128 *);
  uint64_t v5;
  void (*v6)(__int128 *);

  if (a1 != &_citrus_stdenc_default)
  {
    v2 = *((_QWORD *)a1 + 2);
    v3 = *(_QWORD **)a1;
    if (v2)
    {
      if (v3)
      {
        if (*((_QWORD *)a1 + 1))
        {
          v4 = (void (*)(__int128 *))v3[1];
          if (v4)
          {
            v4(a1);
            v3 = *(_QWORD **)a1;
          }
        }
        free(v3);
      }
      free(*((void **)a1 + 3));
      _citrus_unload_module(*((void **)a1 + 2));
    }
    else
    {
      v5 = *((_QWORD *)a1 + 1);
      if (v3)
      {
        if (v5)
        {
          v6 = (void (*)(__int128 *))v3[1];
          if (v6)
            v6(a1);
        }
        free(*((void **)a1 + 3));
      }
      else if (v5)
      {
        _citrus_stdenc_close_cold_1();
      }
    }
    free(a1);
  }
}

void _citrus_db_factory_serialize_cold_1()
{
  __assert_rtn("dump_header", "citrus_db_factory.c", 270, "_v <= UINT_MAX");
}

void _citrus_db_factory_serialize_cold_2()
{
  __assert_rtn("_citrus_db_factory_serialize", "citrus_db_factory.c", 339, "_v <= UINT_MAX");
}

void _citrus_db_factory_serialize_cold_3()
{
  __assert_rtn("_citrus_db_factory_serialize", "citrus_db_factory.c", 340, "_v <= UINT_MAX");
}

void _citrus_db_factory_serialize_cold_4()
{
  __assert_rtn("_citrus_db_factory_serialize", "citrus_db_factory.c", 341, "_v <= UINT_MAX");
}

void _citrus_db_factory_serialize_cold_5()
{
  __assert_rtn("_citrus_db_factory_serialize", "citrus_db_factory.c", 342, "_v <= UINT_MAX");
}

void _citrus_db_factory_serialize_cold_6()
{
  __assert_rtn("_citrus_db_factory_serialize", "citrus_db_factory.c", 338, "_v <= UINT_MAX");
}

void _citrus_mapper_open_cold_1()
{
  __assert_rtn("_citrus_mapper_open", "citrus_mapper.c", 428, "cm->cm_dir == 0 || powerof2(cm->cm_dir)");
}

void _citrus_unload_module_cold_1()
{
  __assert_rtn("_citrus_unload_module", "citrus_module.c", 390, "handle != RTLD_SELF");
}

void _citrus_stdenc_close_cold_1()
{
  __assert_rtn("_citrus_stdenc_close", "citrus_stdenc.c", 180, "ce->ce_closure == NULL");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1E0C80B70]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
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

char *__cdecl fgetln(FILE *a1, size_t *a2)
{
  return (char *)MEMORY[0x1E0C83390](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

int issetugid(void)
{
  return MEMORY[0x1E0C839B8]();
}

const char *locale_charset(void)
{
  return (const char *)MEMORY[0x1E0DE5260]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

char *__cdecl nl_langinfo(nl_item a1)
{
  return (char *)MEMORY[0x1E0C843D0](*(_QWORD *)&a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EC0](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1E0C85508](__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

