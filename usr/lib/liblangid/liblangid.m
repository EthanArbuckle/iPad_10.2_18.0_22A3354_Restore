uint64_t langid_dispose(void *a1)
{
  return _langid_dispose_internal(a1, 0);
}

_QWORD *langid_create()
{
  return _langid_create_with_datapath_internal(0, 0);
}

double langid_reset(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 8) = 0u;
  return result;
}

int **_langid_env_create(const char *a1)
{
  int **v2;
  int **v3;
  int v4;
  int v5;
  size_t st_size;
  _DWORD *v7;
  _DWORD *v8;
  off_t v9;
  int *v10;
  int *v11;
  uint64_t v12;
  unsigned __int8 *v13;
  uint64_t i;
  _QWORD *v16;
  int v17;
  int v18;
  FILE *v19;
  int v20;
  int *v21;
  char *v22;
  unint64_t v23;
  stat v25;

  v2 = (int **)malloc_type_calloc(0x168uLL, 1uLL, 0x6A2DBD6FuLL);
  if (!v2)
    _langid_env_create_cold_1();
  v3 = v2;
  memset(&v25, 0, sizeof(v25));
  if (stat(a1, &v25))
    _langid_env_create_cold_6();
  v4 = open(a1, 0);
  if (v4 < 0)
  {
    v19 = (FILE *)*MEMORY[0x1E0C80C10];
    v20 = *__error();
    v21 = __error();
    v22 = strerror(*v21);
    fprintf(v19, "LanguageIdentifier cannot open file: [%s], errno: %d error: [%s]\n", a1, v20, v22);
LABEL_19:
    free(v3);
    return 0;
  }
  v5 = v4;
  st_size = v25.st_size;
  *((_WORD *)v3 + 176) = 0;
  v7 = mmap(0, st_size, 1, 1, v4, 0);
  *((_WORD *)v3 + 176) = 1;
  if (v7 == (_DWORD *)-1)
    _langid_env_create_cold_2();
  v8 = v7;
  madvise(v7, st_size, 1);
  close(v5);
  v9 = v25.st_size;
  v3[37] = v8;
  v3[38] = (int *)v9;
  if (!v8)
    goto LABEL_19;
  if (v8[1] != 1)
    _langid_env_create_cold_5();
  v10 = (_DWORD *)((char *)v8 + v8[4]);
  v3[40] = v10;
  v11 = (int *)v8[5];
  v3[41] = v11;
  *((_DWORD *)v3 + 84) = 1234;
  v12 = v8[8];
  *(_DWORD *)v3 = v12;
  if ((int)v12 >= 37)
    _langid_env_create_cold_3();
  v13 = (unsigned __int8 *)(v8 + 9);
  v3[1] = v8 + 9;
  if ((int)v12 >= 2)
  {
    for (i = 1; i != v12; ++i)
    {
      while (*v13++)
        ;
      v3[i + 1] = (int *)v13;
    }
    v10 = v3[40];
  }
  v16 = malloc_type_malloc(0x58uLL, 0x10B0040A3C4D6A3uLL);
  if (!v16)
    _langid_env_create_cold_4((uint64_t)v3);
  v16[4] = 0;
  v16[5] = 0;
  *v16 = v10;
  *((_DWORD *)v16 + 20) = 0;
  if (v11 >= 0x10 && v10)
  {
    v17 = *v10;
    v16[1] = v10 + 4;
    if (v17 == 1953655141)
      v18 = v10[3];
    else
      v18 = 0;
    *((_DWORD *)v16 + 4) = v18;
    v23 = (unint64_t)(v11 - 4) >> 3;
  }
  else
  {
    v23 = 0;
    v16[1] = 0;
    *((_DWORD *)v16 + 4) = 0;
  }
  v16[3] = v23;
  v3[39] = (int *)v16;
  return v3;
}

uint64_t _langid_dispose_internal(void *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  BOOL v4;

  v2 = *(_QWORD **)a1;
  if (!*(_QWORD *)(*(_QWORD *)a1 + 344))
    _langid_dispose_internal_cold_1();
  if (!a2)
    free(a1);
  pthread_mutex_lock(&_env_mutex);
  v3 = v2[43] - 1;
  v2[43] = v3;
  if (v3)
    v4 = 1;
  else
    v4 = v2 == (_QWORD *)_env;
  if (!v4)
  {
    _langid_env_dispose(v2);
    if (v2 == (_QWORD *)_env)
      _env = 0;
  }
  return pthread_mutex_unlock(&_env_mutex);
}

_QWORD *_langid_create_with_datapath_internal(const char *a1, uint64_t a2)
{
  _QWORD *v4;
  int **v5;
  char *v7;
  char *v8;

  if (a2)
  {
    *(_QWORD *)(a2 + 144) = 0;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 128) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    v4 = (_QWORD *)a2;
    *(_OWORD *)a2 = 0u;
  }
  else
  {
    v4 = malloc_type_calloc(0x98uLL, 1uLL, 0xF222CE70uLL);
    if (!v4)
      return v4;
  }
  pthread_mutex_lock(&_env_mutex);
  if (a1)
  {
    v5 = _langid_env_create(a1);
  }
  else
  {
    v5 = (int **)_env;
    if (_env)
      goto LABEL_11;
    v7 = getenv("APPLE_FRAMEWORKS_ROOT");
    if (v7 && (v8 = 0, asprintf(&v8, "%s/%s", v7, "/usr/share/langid/langid.inv"), v8))
    {
      _env = (uint64_t)_langid_env_create(v8);
      free(v8);
      v5 = (int **)_env;
    }
    else
    {
      v5 = _langid_env_create("/usr/share/langid/langid.inv");
      _env = (uint64_t)v5;
    }
  }
  if (v5)
  {
LABEL_11:
    v5[43] = (int *)((char *)v5[43] + 1);
    pthread_mutex_unlock(&_env_mutex);
    *v4 = v5;
    return v4;
  }
  pthread_mutex_unlock(&_env_mutex);
  if (!a2)
    free(v4);
  return 0;
}

const char *langid_languagecode(uint64_t *a1, int a2)
{
  uint64_t *v2;
  _DWORD *v3;

  v2 = &_env;
  if (a1)
    v2 = a1;
  v3 = (_DWORD *)*v2;
  if (*v3 <= a2)
    return 0;
  if ((a2 & 0x80000000) == 0)
    return *(const char **)&v3[2 * a2 + 2];
  if (a2 == -1)
    return "--";
  return 0;
}

uint64_t langid_highest_score(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t result;
  unsigned int v7;

  v2 = &_env;
  if (a1)
    v2 = a1;
  v3 = *(unsigned int *)*v2;
  if ((int)v3 < 1)
    return 0xFFFFFFFFLL;
  v4 = 0;
  v5 = 0;
  LODWORD(result) = -1;
  do
  {
    v7 = *(_DWORD *)(a2 + 4 * v4);
    if (v7 <= v5)
      result = result;
    else
      result = v4;
    if (v7 > v5)
      v5 = *(_DWORD *)(a2 + 4 * v4);
    ++v4;
  }
  while (v3 != v4);
  return result;
}

uint64_t *langid_consume_string(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD v22[8];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a4 && a3)
  {
    v4 = *a1;
    v5 = *(_QWORD *)(*a1 + 312);
    v6 = *(_QWORD *)(v5 + 24);
    v7 = 2 * a3;
    do
    {
      if (2 * a3 && v6 >= 2)
      {
        v8 = 0;
        v9 = 0;
        v10 = *(_QWORD *)(v5 + 8);
        LODWORD(v11) = *(_DWORD *)(v10 + 12);
        LODWORD(v12) = 1;
        do
        {
          v13 = v12;
          v12 = v11 + *(unsigned __int8 *)(a2 + v9) + 1;
          if (*(_DWORD *)(v10 + 8 * v12) != v13)
            break;
          v11 = *(unsigned int *)(v10 + 8 * v12 + 4);
          if (*(_DWORD *)(v10 + 8 * v11) == (_DWORD)v12)
          {
            v14 = *(_DWORD *)(v10 + 8 * v11 + 4);
            if (v14 <= 0)
            {
              v22[v8++] = -v14;
              if (v8 > 7)
                goto LABEL_13;
            }
          }
          ++v9;
        }
        while (v7 != v9);
        if (!v8)
          goto LABEL_18;
LABEL_13:
        v15 = 0;
        v16 = *(_QWORD *)(v4 + 296);
        v17 = *(_DWORD *)v4;
        v18 = v22;
        do
        {
          if (v17 >= 1)
          {
            v19 = 0;
            v20 = v16 + *v18;
            do
            {
              *((_DWORD *)a1 + v19 + 2) += *(unsigned __int8 *)(v20 + v19);
              v17 = *(_DWORD *)v4;
              ++v19;
            }
            while ((int)v19 < *(_DWORD *)v4);
          }
          ++v18;
          ++v15;
        }
        while (v15 != v8);
      }
LABEL_18:
      if (!--a4)
        break;
      a2 += 2;
      v7 -= 2;
      --a3;
    }
    while (a3);
  }
  return a1 + 1;
}

uint64_t textcat_Init()
{
  return 0;
}

const char *textcat_Classify(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unsigned int v3;

  v3 = langid_identify(a2, a3);
  if (*(_DWORD *)_env <= (signed int)v3)
    return 0;
  if ((v3 & 0x80000000) == 0)
    return *(const char **)(_env + 8 * v3 + 8);
  if (v3 == -1)
    return "--";
  return 0;
}

uint64_t langid_identify(uint64_t a1, unint64_t a2)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;

  v4 = _langid_create_with_datapath_internal(0, 0);
  if (!v4)
    return 0xFFFFFFFFLL;
  v5 = v4;
  if (a2 >= 0x190)
    v6 = 400;
  else
    v6 = a2;
  v7 = langid_consume_string(v4, a1, a2, v6);
  v8 = *(unsigned int *)*v5;
  if ((int)v8 < 1)
  {
    v11 = 0xFFFFFFFFLL;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    LODWORD(v11) = -1;
    do
    {
      v12 = *((_DWORD *)v7 + v9);
      if (v12 <= v10)
        v11 = v11;
      else
        v11 = v9;
      if (v12 > v10)
        v10 = *((_DWORD *)v7 + v9);
      ++v9;
    }
    while (v8 != v9);
  }
  _langid_dispose_internal(v5, 0);
  return v11;
}

uint64_t langid_identify_bufsize()
{
  return 152;
}

uint64_t langid_identify_withbuf(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;

  v6 = _langid_create_with_datapath_internal(0, a3);
  if (!v6)
    return 0xFFFFFFFFLL;
  v7 = v6;
  if (a2 >= 0x190)
    v8 = 400;
  else
    v8 = a2;
  v9 = langid_consume_string(v6, a1, a2, v8);
  v10 = *(unsigned int *)*v7;
  if ((int)v10 < 1)
  {
    v13 = 0xFFFFFFFFLL;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    LODWORD(v13) = -1;
    do
    {
      v14 = *((_DWORD *)v9 + v11);
      if (v14 <= v12)
        v13 = v13;
      else
        v13 = v11;
      if (v14 > v12)
        v12 = *((_DWORD *)v9 + v11);
      ++v11;
    }
    while (v10 != v11);
  }
  _langid_dispose_internal(v7, a3);
  return v13;
}

uint64_t langid_numlanguages(uint64_t *a1)
{
  uint64_t *v1;

  v1 = &_env;
  if (a1)
    v1 = a1;
  return *(unsigned int *)*v1;
}

_QWORD *langid_create_with_datapath(const char *a1)
{
  return _langid_create_with_datapath_internal(a1, 0);
}

uint64_t langid_global_dispose()
{
  pthread_mutex_lock(&_env_mutex);
  if (_env)
  {
    _langid_env_dispose((_QWORD *)_env);
    _env = 0;
  }
  return pthread_mutex_unlock(&_env_mutex);
}

void _langid_env_dispose(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  if (!a1)
    _langid_env_dispose_cold_1();
  v2 = a1[39];
  if (v2)
  {
    if (*(_DWORD *)(v2 + 80) && *(_QWORD *)v2)
      free(*(void **)v2);
    free((void *)v2);
  }
  v3 = (void *)a1[37];
  if (v3 && *((_WORD *)a1 + 176))
    munmap(v3, a1[38]);
  free(a1);
}

void _langid_dispose_internal_cold_1()
{
  __assert_rtn("_langid_dispose_internal", "LanguageIdentifier.c", 517, "env->objectCount>0");
}

void _langid_env_dispose_cold_1()
{
  __assert_rtn("_langid_env_dispose", "LanguageIdentifier.c", 502, "env");
}

void _langid_env_create_cold_1()
{
  __assert_rtn("_langid_env_create", "LanguageIdentifier.c", 437, "env");
}

void _langid_env_create_cold_2()
{
  __assert_rtn("_open_and_mmap_for_reading", "LanguageIdentifier.c", 657, "addr != MAP_FAILED");
}

void _langid_env_create_cold_3()
{
  __assert_rtn("_langid_env_create", "LanguageIdentifier.c", 478, "env->numLanguages<=kMaxVectorWidth");
}

void _langid_env_create_cold_4(uint64_t a1)
{
  *(_QWORD *)(a1 + 312) = 0;
  __assert_rtn("_langid_env_create", "LanguageIdentifier.c", 491, "env->trie");
}

void _langid_env_create_cold_5()
{
  __assert_rtn("_langid_env_create", "LanguageIdentifier.c", 463, "H(fileVersion)==1");
}

void _langid_env_create_cold_6()
{
  __assert_rtn("_open_and_mmap_for_reading", "LanguageIdentifier.c", 630, "stat(path, &stat_data) == 0");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C83E60](a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

