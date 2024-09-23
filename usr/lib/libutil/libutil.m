uint64_t *ExtentManager::Init(ExtentManager *this, unsigned int a2, unsigned int a3, unint64_t a4)
{
  unint64_t v5;

  *(_QWORD *)this = a2;
  *((_QWORD *)this + 1) = a3;
  if (a4 % a2)
    v5 = a4 / a2 + 1;
  else
    v5 = a4 / a2;
  *((_QWORD *)this + 2) = a4;
  *((_QWORD *)this + 3) = v5;
  ExtentManager::AddBlockRangeExtent((uint64_t *)this, 0, 0);
  return ExtentManager::AddBlockRangeExtent((uint64_t *)this, *((_QWORD *)this + 3), 0);
}

uint64_t *ExtentManager::AddBlockRangeExtent(uint64_t *this, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;

  v3 = this[3];
  if (v3 >= a2)
  {
    v4 = a3 + a2;
    if (a3 + a2 >= 0)
    {
      v5 = this;
      if (a2 >= 0)
        v4 = a3;
      v6 = a2 & ~(a2 >> 63);
      if (v4 + v6 <= v3)
        v7 = v4;
      else
        v7 = v3 - v6;
      v8 = this + 4;
      v9 = (uint64_t *)this[5];
      if (v9 == this + 4)
      {
LABEL_13:
        v9 = this + 4;
      }
      else
      {
        v10 = v7 + v6;
        while (1)
        {
          v11 = v9[2];
          if (v10 < v11)
            break;
          v12 = v9[3] + v11;
          if (v12 >= v6)
          {
            if (v11 >= v6)
              v11 = a2 & ~(a2 >> 63);
            if (v10 <= v12)
              v10 = v12;
            v9[2] = v11;
            v9[3] = v10 - v11;
            goto LABEL_20;
          }
          v9 = (uint64_t *)v9[1];
          if (v9 == v8)
            goto LABEL_13;
        }
      }
      v13 = (uint64_t *)operator new(0x20uLL);
      v13[2] = v6;
      v13[3] = v7;
      v14 = *v9;
      *(_QWORD *)(v14 + 8) = v13;
      *v13 = v14;
      *v9 = (uint64_t)v13;
      v13[1] = (uint64_t)v9;
      ++v5[6];
      v9 = v13;
LABEL_20:
      this = (uint64_t *)v5[5];
      while (this != v8)
      {
        if (this == v9 || (v15 = this[2], v16 = this[3] + v15, v17 = v9[2], v16 < v17))
        {
          this = (uint64_t *)this[1];
        }
        else
        {
          v18 = v9[3] + v17;
          if (v18 < v15)
            return this;
          if (v17 < v15)
            v15 = v9[2];
          if (v16 <= v18)
            v16 = v9[3] + v17;
          v9[2] = v15;
          v9[3] = v16 - v15;
          v19 = *this;
          v20 = (uint64_t *)this[1];
          *(_QWORD *)(v19 + 8) = v20;
          *(_QWORD *)this[1] = v19;
          --v5[6];
          operator delete(this);
          this = v20;
        }
      }
    }
  }
  return this;
}

uint64_t *ExtentManager::RemoveBlockRangeExtent(ExtentManager *this, uint64_t a2, uint64_t a3)
{
  char *v4;
  uint64_t *result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;

  v4 = (char *)this + 32;
  result = (uint64_t *)*((_QWORD *)this + 5);
  if (result != (uint64_t *)v4)
  {
    v7 = a3 + a2;
    while (1)
    {
      v8 = result[2];
      v9 = result[3] + v8;
      if (v9 < a2)
        goto LABEL_11;
      if (v7 < v8)
        return result;
      v10 = __OFSUB__(a2, v8);
      v11 = a2 - v8;
      if ((v11 < 0) ^ v10 | (v11 == 0))
        break;
      v12 = v9 - v7;
      if (v9 <= v7)
        goto LABEL_10;
      result[3] = v11;
      v13 = (uint64_t *)result[1];
      v14 = operator new(0x20uLL);
      v14[2] = v7;
      v14[3] = v12;
      v15 = *v13;
      *(_QWORD *)(v15 + 8) = v14;
      *v14 = v15;
      *v13 = (uint64_t)v14;
      v14[1] = v13;
      ++*((_QWORD *)this + 6);
      result = (uint64_t *)v13[1];
LABEL_12:
      if (result == (uint64_t *)v4)
        return result;
    }
    v11 = v9 - v7;
    if (v9 <= v7)
    {
      v16 = *result;
      v17 = (uint64_t *)result[1];
      *(_QWORD *)(v16 + 8) = v17;
      *(_QWORD *)result[1] = v16;
      --*((_QWORD *)this + 6);
      operator delete(result);
      result = v17;
      goto LABEL_12;
    }
    result[2] = v7;
LABEL_10:
    result[3] = v11;
LABEL_11:
    result = (uint64_t *)result[1];
    goto LABEL_12;
  }
  return result;
}

uint64_t *ExtentManager::AddByteRangeExtent(ExtentManager *this, unint64_t a2, uint64_t a3)
{
  return ExtentManager::AddBlockRangeExtent((uint64_t *)this, a2 / *(_QWORD *)this, (a2 + a3 - 1) / *(_QWORD *)this - a2 / *(_QWORD *)this + 1);
}

uint64_t getmntoptstr(uint64_t a1, char *a2)
{
  const char **v3;
  const char *v4;
  uint64_t v6;
  const char **v7;

  v3 = *(const char ***)(a1 + 8);
  v4 = *v3;
  if (*v3)
  {
    v6 = 0;
    v7 = v3 + 3;
    while (strcasecmp(a2, v4))
    {
      v4 = v7[v6];
      v6 += 3;
      if (!v4)
        goto LABEL_5;
    }
    return *(_QWORD *)(*(_QWORD *)(a1 + 24) + 0x5555555555555558 * ((unint64_t)(v6 * 8) >> 3));
  }
  else
  {
LABEL_5:
    if (!getmnt_silent)
      errx(1, "-o %s: option not supported", a2);
    return 0;
  }
}

uint64_t getmntoptnum(uint64_t a1, char *a2)
{
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  int v6;
  void (*v7)(uint64_t, const char *, ...);
  _BOOL4 v9;
  void (*v10)(uint64_t, const char *, ...);
  char *__endptr;

  v3 = getmntoptstr(a1, a2);
  if (!v3)
  {
    if (!getmnt_silent)
      errx(1, "Missing %s argument", a2);
    return -1;
  }
  v4 = (const char *)v3;
  __endptr = 0;
  *__error() = 0;
  v5 = strtol(v4, &__endptr, 0);
  v6 = *__endptr;
  if (*__endptr)
    v7 = (void (*)(uint64_t, const char *, ...))MEMORY[0x1E0C83210];
  else
    v7 = 0;
  v9 = *__error() != 34 || (unint64_t)(v5 + 0x7FFFFFFFFFFFFFFFLL) < 0xFFFFFFFFFFFFFFFELL;
  v10 = (void (*)(uint64_t, const char *, ...))MEMORY[0x1E0C83208];
  if (v9)
    v10 = v7;
  if (!v9 || v6 != 0)
  {
    if (!getmnt_silent)
    {
      return v5;
    }
    return -1;
  }
  return v5;
}

void freemntopts(void **a1)
{
  free(a1[2]);
  free(a1[3]);
  free(a1);
}

_QWORD *getmntopts(const char *a1, _QWORD *a2, int *a3, int *a4)
{
  size_t v8;
  uint64_t *v9;
  uint64_t v10;
  _QWORD *v11;
  char *v12;
  void *v13;
  char *v14;
  char *v15;
  int v16;
  char *v17;
  char *v18;
  const char *v19;
  uint64_t v20;
  _QWORD *v21;
  int *v22;
  int v23;
  int v24;
  int v25;
  char *__lasts;

  __lasts = 0;
  if (*a2)
  {
    v8 = 0;
    v9 = a2 + 3;
    do
    {
      ++v8;
      v10 = *v9;
      v9 += 3;
    }
    while (v10);
  }
  else
  {
    v8 = 0;
  }
  v11 = malloc_type_malloc(0x20uLL, 0xF004090684456uLL);
  if (!v11)
    return v11;
  v12 = strdup(a1);
  v11[2] = v12;
  if (!v12)
  {
LABEL_32:
    free(v11);
    return 0;
  }
  v13 = malloc_type_calloc(v8, 8uLL, 0x10040436913F5uLL);
  v11[3] = v13;
  if (!v13)
  {
    free((void *)v11[2]);
    goto LABEL_32;
  }
  *v11 = a1;
  v11[1] = a2;
  v14 = strtok_r((char *)v11[2], ",", &__lasts);
  if (v14)
  {
    v15 = v14;
    do
    {
      if (*v15 == 110)
      {
        v16 = v15[1] == 111;
        v15 += 2 * (v15[1] == 111);
      }
      else
      {
        v16 = 0;
      }
      v17 = strchr(v15, 61);
      v18 = v17;
      if (v17)
      {
        *v17 = 0;
        v18 = v17 + 1;
      }
      v19 = (const char *)*a2;
      if (*a2)
      {
        v20 = 0;
        while (strcasecmp(v15, v19))
        {
          v19 = (const char *)a2[v20 + 3];
          v20 += 3;
          if (!v19)
            goto LABEL_20;
        }
        *(_QWORD *)(v11[3] + 0x5555555555555558 * ((unint64_t)(v20 * 8) >> 3)) = v18;
        v21 = &a2[v20];
        if (LODWORD(a2[v20 + 2]))
          v22 = a4;
        else
          v22 = a3;
        v24 = *((_DWORD *)v21 + 2);
        v23 = *((_DWORD *)v21 + 3);
        if (v16 == v24)
          v25 = *v22 | v23;
        else
          v25 = *v22 & ~v23;
        *v22 = v25;
      }
      else
      {
LABEL_20:
        if (!getmnt_silent)
          errx(1, "-o %s: option not supported", v15);
      }
      v15 = strtok_r(0, ",", &__lasts);
    }
    while (v15);
  }
  return v11;
}

uint64_t humanize_number(char *a1, size_t a2, uint64_t a3, char *__s, unsigned int a5, int a6)
{
  char v6;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  size_t v18;
  int v19;
  unint64_t v20;
  uint64_t v21;
  BOOL v22;
  int v23;
  int v24;
  int v25;
  unint64_t v26;
  uint64_t v30;
  int v31;
  int v32;
  uint64_t v33;

  v6 = a6;
  if (a2)
    *a1 = 0;
  v10 = 0xFFFFFFFFLL;
  if (!a1 || !__s || (a5 & 0x80000000) != 0 || a5 >= 7 && (a5 & 0xFFFFFFCF) != 0 || (~a6 & 0x18) == 0)
    return v10;
  if ((a6 & 0x10) != 0)
  {
    v32 = 973;
    v11 = 2;
    goto LABEL_13;
  }
  if ((a6 & 8) == 0)
  {
    v32 = 973;
    v11 = 1;
LABEL_13:
    v33 = v11;
    v12 = 1024;
    goto LABEL_15;
  }
  v32 = 950;
  v33 = 1;
  v12 = 1000;
LABEL_15:
  if (a3 >= 0)
    v13 = a3;
  else
    v13 = -a3;
  if (a3 < 0)
    v14 = -1;
  else
    v14 = 1;
  v31 = v14;
  if (a3 >= 0)
    v15 = 1;
  else
    v15 = 2;
  v16 = strlen(__s);
  if ((v6 & 2) != 0)
    v17 = v15;
  else
    v17 = v15 + 1;
  v18 = v17 + v33 + v16;
  if (v18 + 1 > a2)
    return v10;
  if ((a5 & 0x30) == 0)
  {
    if (a5)
    {
      v23 = a5 - 1;
      if (a5 - 1 >= 5)
        v23 = 5;
      LODWORD(v10) = v23 + 1;
      v24 = v23 + 1;
      do
      {
        v25 = v13;
        v13 /= v12;
        --v24;
      }
      while (v24);
      v26 = (v25 - v13 * v12);
    }
    else
    {
      LODWORD(v10) = 0;
      v26 = 0;
    }
    goto LABEL_54;
  }
  v19 = a2 - v18;
  if (v19 < 1)
  {
    v21 = 1;
  }
  else
  {
    v20 = 1;
    do
    {
      v21 = 10 * v20;
      if (v19 < 2)
        break;
      --v19;
      v22 = v20 >= 0x147AE147AE147AFLL;
      v20 *= 10;
    }
    while (!v22);
  }
  v10 = 0;
  v26 = 0;
  while (1)
  {
    if (v13 < v21)
    {
      if (v13 != v21 - 1)
        goto LABEL_53;
      if ((int)v26 < v32)
        break;
    }
    if (v10 > 5)
      goto LABEL_53;
LABEL_50:
    v26 = (v13 % v12);
    v10 = (v10 + 1);
    v13 /= v12;
  }
  if (v12 >> 1 <= v26 && v10 < 6)
    goto LABEL_50;
  v13 = v21 - 1;
LABEL_53:
  if ((a5 & 0x10) != 0)
    return v10;
LABEL_54:
  if (v13 == 9)
  {
    if ((int)v26 < v32 && (_DWORD)v10 != 0)
      goto LABEL_66;
    return snprintf(a1, a2, "%lld%s%s%s");
  }
  else
  {
    if (v13 > 8 || (_DWORD)v10 == 0)
      return snprintf(a1, a2, "%lld%s%s%s");
LABEL_66:
    if ((v6 & 1) == 0)
      return snprintf(a1, a2, "%lld%s%s%s");
    v30 = v31 * (((10 * v26 + (v12 >> 1)) / v12 / 0xA) + v13);
    localeconv();
    return snprintf(a1, a2, "%d%s%d%s%s%s", v30);
  }
}

char *pidfile_open(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  char *v6;
  const char *v7;
  int v8;
  int v9;
  int *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  char *v15;
  int v16;
  stat v18;
  char *__endptr;
  char __str[16];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (char *)malloc_type_malloc(0x418uLL, 0x10000408CD2D07FuLL);
  if (v6)
  {
    if (a1)
    {
      __strlcpy_chk();
    }
    else
    {
      v7 = getprogname();
      snprintf(v6 + 4, 0x401uLL, "/var/run/%s.pid", v7);
    }
    memset(&v18, 0, sizeof(v18));
    if (strlen(v6 + 4) == 1024)
    {
      free(v6);
      v6 = 0;
      *__error() = 63;
    }
    else
    {
      v8 = open(v6 + 4, 1573, a2);
      if (v8 == -1)
      {
        v10 = __error();
        if (a3 && *v10 == 35)
        {
          v11 = open(v6 + 4, 0);
          if (v11 == -1)
          {
            v14 = *__error();
          }
          else
          {
            v12 = v11;
            v13 = read(v11, __str, 0xFuLL);
            v14 = *__error();
            close(v12);
            if (v13 != -1)
            {
              __endptr = 0;
              v15 = &__str[v13];
              *v15 = 0;
              *a3 = strtol(__str, &__endptr, 10);
              if (__endptr == v15)
                v14 = 0;
              else
                v14 = 22;
            }
          }
          *__error() = v14;
          if (!*__error())
            *__error() = 17;
        }
        free(v6);
        return 0;
      }
      else
      {
        v9 = v8;
        if (fstat(v8, &v18) == -1)
        {
          v16 = *__error();
          unlink(v6 + 4);
          close(v9);
          free(v6);
          v6 = 0;
          *__error() = v16;
        }
        else
        {
          *(_DWORD *)v6 = v9;
          *((_DWORD *)v6 + 258) = v18.st_dev;
          *((_QWORD *)v6 + 130) = v18.st_ino;
        }
      }
    }
  }
  return v6;
}

uint64_t pidfile_write(int *a1)
{
  int v2;
  int v3;
  pid_t v4;
  size_t v5;
  ssize_t v6;
  int v8;
  char __str[16];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = pidfile_verify((uint64_t)a1);
  *__error() = v2;
  if (!*__error())
  {
    v3 = *a1;
    if (ftruncate(*a1, 0) != -1)
    {
      v4 = getpid();
      snprintf(__str, 0x10uLL, "%u", v4);
      v5 = strlen(__str);
      v6 = pwrite(v3, __str, v5, 0);
      if (v6 == strlen(__str))
        return 0;
    }
    v8 = *__error();
    _pidfile_remove((uint64_t)a1, 0);
    *__error() = v8;
  }
  return 0xFFFFFFFFLL;
}

uint64_t pidfile_verify(uint64_t a1)
{
  int v2;
  uint64_t result;
  stat v4;

  if (!a1)
    return 22;
  v2 = *(_DWORD *)a1;
  if (v2 == -1)
    return 22;
  memset(&v4, 0, sizeof(v4));
  if (fstat(v2, &v4) == -1)
    return *__error();
  result = 22;
  if (v4.st_dev == *(_DWORD *)(a1 + 1032))
  {
    if (v4.st_ino == *(_QWORD *)(a1 + 1040))
      return 0;
    else
      return 22;
  }
  return result;
}

uint64_t _pidfile_remove(uint64_t a1, int a2)
{
  int v4;

  v4 = pidfile_verify(a1);
  if (v4)
    goto LABEL_16;
  if (unlink((const char *)(a1 + 4)) == -1)
    v4 = *__error();
  else
    v4 = 0;
  if (flock(*(_DWORD *)a1, 8) == -1 && v4 == 0)
    v4 = *__error();
  if (close(*(_DWORD *)a1) == -1 && !v4)
    v4 = *__error();
  if (a2)
  {
    free((void *)a1);
    if (v4)
    {
LABEL_16:
      *__error() = v4;
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
    *(_DWORD *)a1 = -1;
    if (v4)
      goto LABEL_16;
  }
  return 0;
}

uint64_t pidfile_close(_DWORD *a1)
{
  int v2;
  int v3;

  v2 = pidfile_verify((uint64_t)a1);
  if (v2)
  {
    v3 = v2;
LABEL_3:
    *__error() = v3;
    return 0xFFFFFFFFLL;
  }
  if (close(*a1) == -1)
  {
    v3 = *__error();
    free(a1);
    if (v3)
      goto LABEL_3;
  }
  else
  {
    free(a1);
  }
  return 0;
}

uint64_t pidfile_remove(uint64_t a1)
{
  return _pidfile_remove(a1, 1);
}

uint64_t expand_number(const char *a1, uintmax_t *a2)
{
  int v4;
  uintmax_t v5;
  __darwin_ct_rune_t v6;
  char v7;
  uint64_t result;
  int *v9;
  int v10;
  char *__endptr;

  __endptr = 0;
  v4 = *__error();
  *__error() = 0;
  v5 = strtoumax(a1, &__endptr, 0);
  if (!*__error())
  {
    *__error() = v4;
    v6 = __tolower(*__endptr);
    v7 = 60;
    switch(v6)
    {
      case 'b':
        goto LABEL_7;
      case 'c':
      case 'd':
      case 'f':
      case 'h':
      case 'i':
      case 'j':
      case 'l':
      case 'n':
      case 'o':
        goto LABEL_8;
      case 'e':
        goto LABEL_12;
      case 'g':
        v7 = 30;
        goto LABEL_12;
      case 'k':
        v7 = 10;
        goto LABEL_12;
      case 'm':
        v7 = 20;
        goto LABEL_12;
      case 'p':
        v7 = 50;
        goto LABEL_12;
      default:
        if (!v6)
        {
LABEL_7:
          result = 0;
          *a2 = v5;
          return result;
        }
        if (v6 == 116)
        {
          v7 = 40;
LABEL_12:
          if (v5 << v7 >> v7 == v5)
          {
            result = 0;
            *a2 = v5 << v7;
            return result;
          }
          v9 = __error();
          v10 = 34;
        }
        else
        {
LABEL_8:
          v9 = __error();
          v10 = 22;
        }
        *v9 = v10;
        break;
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t realhostname(char *a1, size_t a2, _DWORD *a3)
{
  uint64_t v6;
  hostent *v7;
  const char **p_h_name;
  size_t v9;
  hostent *v10;
  char **h_addr_list;
  char *v12;
  char **v13;
  char *v14;
  in_addr v15;
  char *v16;
  char __dst[256];
  char __s[256];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = 2;
  v7 = gethostbyaddr(a3, 4u, 2);
  if (!v7)
    goto LABEL_10;
  p_h_name = (const char **)&v7->h_name;
  __strlcpy_chk();
  v9 = strlen(__s);
  trimdomain((unint64_t)__s, v9);
  if (strlen(__s) > a2)
    goto LABEL_10;
  strncpy(__dst, *p_h_name, 0xFFuLL);
  __dst[255] = 0;
  v10 = gethostbyname(__dst);
  if (!v10)
  {
    v6 = 3;
    goto LABEL_10;
  }
  h_addr_list = v10->h_addr_list;
  v12 = *h_addr_list;
  if (!*h_addr_list)
  {
LABEL_8:
    v6 = 1;
LABEL_10:
    v15.s_addr = *a3;
    v16 = inet_ntoa(v15);
    strncpy(a1, v16, a2);
    return v6;
  }
  v13 = h_addr_list + 1;
  while (*(_DWORD *)v12 != *a3)
  {
    v10->h_addr_list = v13;
    v14 = *v13++;
    v12 = v14;
    if (!v14)
      goto LABEL_8;
  }
  strncpy(a1, __s, a2);
  return 0;
}

uint64_t realhostname_sa(char *a1, size_t a2, sockaddr *a3, socklen_t a4)
{
  uint64_t v8;
  int sa_family;
  addrinfo *v10;
  addrinfo *v11;
  sockaddr *ai_addr;
  size_t sa_len;
  addrinfo *v15;
  addrinfo v16;
  char __src[1025];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (getnameinfo(a3, a4, __src, 0x401u, 0, 0, 4))
  {
    v8 = 2;
  }
  else
  {
    v15 = 0;
    memset(&v16.ai_socktype, 0, 40);
    sa_family = a3->sa_family;
    v8 = 3;
    v16.ai_flags = 3;
    v16.ai_family = sa_family;
    v16.ai_socktype = 1;
    if (!getaddrinfo(__src, 0, &v16, &v15))
    {
      v10 = v15;
      if (v15)
      {
        v11 = v15;
        do
        {
          ai_addr = v11->ai_addr;
          if (!ai_addr)
            break;
          sa_len = ai_addr->sa_len;
          if (__PAIR64__(ai_addr->sa_family, sa_len) == __PAIR64__(a3->sa_family, a4))
          {
            *(_WORD *)ai_addr->sa_data = *(_WORD *)a3->sa_data;
            if (!memcmp(ai_addr, a3, sa_len))
            {
              if (!v10->ai_canonname
                || (__strlcpy_chk(), trimdomain((unint64_t)__src, a2), strlen(__src) > a2) && a3->sa_family == 2)
              {
                freeaddrinfo(v10);
                v8 = 0;
                goto LABEL_11;
              }
              strncpy(a1, __src, a2);
              freeaddrinfo(v10);
              return 0;
            }
          }
          v11 = v11->ai_next;
          v15 = v11;
        }
        while (v11);
      }
      freeaddrinfo(v10);
      v8 = 1;
    }
  }
LABEL_11:
  if (!getnameinfo(a3, a4, __src, 0x401u, 0, 0, 2))
    strncpy(a1, __src, a2);
  return v8;
}

uint64_t reexec_to_match_kernel()
{
  cpu_type_t v1;
  mach_header_64 *v2;

  if (getenv("REEXEC_TO_MATCH_KERNEL"))
    return 0;
  v1 = current_kernel_arch();
  v2 = _NSGetMachExecuteHeader();
  if (v1)
  {
    if (v1 == v2->cputype)
      return 0;
    return reexec(v1, "REEXEC_TO_MATCH_KERNEL");
  }
  else
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
}

uint64_t current_kernel_arch()
{
  host_t v0;
  integer_t v2;
  size_t v3;
  mach_msg_type_number_t host_info_outCnt;
  integer_t host_info_out[4];
  __int128 v6;
  __int128 v7;
  _OWORD v8[2];
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
  int v39[6];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  *(_OWORD *)host_info_out = 0u;
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
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  memset(v8, 0, sizeof(v8));
  host_info_outCnt = 12;
  v0 = MEMORY[0x1E0BFD430]();
  if (host_info(v0, 1, host_info_out, &host_info_outCnt))
    return 0;
  v2 = host_info_out[3];
  *(_OWORD *)v39 = xmmword_1DF2FBC30;
  v3 = 648;
  if (sysctl(v39, 4u, v8, &v3, 0, 0) == -1)
    return 0;
  else
    return ((_DWORD)v9 << 22) & 0x1000000 | v2;
}

uint64_t reexec(cpu_type_t a1, const char *a2)
{
  char **v3;
  char ***v4;
  uint64_t v5;
  char **v6;
  _QWORD *v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  int v14;
  uint32_t bufsize;
  size_t v16;
  posix_spawnattr_t v17;
  cpu_type_t v18;
  char __str[32];
  char buf[1025];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v18 = a1;
  v16 = 0;
  v17 = 0;
  v3 = *_NSGetArgv();
  v4 = _NSGetEnviron();
  v5 = 0;
  v6 = *v4;
  while (v6[v5++])
    ;
  v8 = malloc_type_calloc((v5 + 1), 8uLL, 0x10040436913F5uLL);
  v9 = v8;
  v10 = *v6;
  if (*v6)
  {
    v11 = 0;
    do
    {
      v8[v11] = v10;
      v10 = v6[++v11];
    }
    while (v10);
    v12 = (v11 + 1);
  }
  else
  {
    v11 = 0;
    v12 = 1;
  }
  snprintf(__str, 0x20uLL, "%s=1", a2);
  v9[v11] = __str;
  v9[v12] = 0;
  bufsize = 1025;
  if (_NSGetExecutablePath(buf, &bufsize)
    || posix_spawnattr_init(&v17)
    || posix_spawnattr_setflags(&v17, 64)
    || posix_spawnattr_setbinpref_np(&v17, 1uLL, &v18, &v16)
    || v16 != 1)
  {
    free(v9);
  }
  else
  {
    v14 = posix_spawn(0, buf, 0, &v17, v3, (char *const *)v9);
    free(v9);
    if (!v14)
      return 0;
    *__error() = v14;
  }
  return 0xFFFFFFFFLL;
}

uint64_t reexec_to_match_lp64ness(int a1)
{
  int32_t cputype;
  int v3;
  int v4;
  uint64_t result;
  unsigned int v6;
  int v7;
  cpu_type_t v8;

  if (getenv("REEXEC_TO_MATCH_LP64NESS"))
    return 0;
  cputype = _NSGetMachExecuteHeader()->cputype;
  if (a1 == (cputype & 0x1000000u) >> 24)
    return 0;
  v3 = current_kernel_arch();
  if (v3)
  {
    v4 = v3;
    result = 0;
    v6 = v4 & 0xFEFFFFFF;
    if (a1)
      v7 = 0x1000000;
    else
      v7 = 0;
    v8 = v6 | v7;
    if (v8 != cputype)
      return reexec(v8, "REEXEC_TO_MATCH_LP64NESS");
  }
  else
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  return result;
}

unint64_t trimdomain(unint64_t __s, uint64_t a2)
{
  void *v3;
  char *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  const char *v9;
  const char *v10;

  v3 = (void *)__s;
  if ((trimdomain_first & 1) == 0)
  {
    trimdomain_first = 1;
    if (gethostname(&trimdomain_domain, 0xFFuLL) || (v4 = strchr(&trimdomain_domain, 46)) == 0)
    {
      trimdomain_domain = 0;
    }
    else
    {
      strlen(v4 + 1);
      __memmove_chk();
    }
    __s = strlen(&trimdomain_domain);
    trimdomain_dlen = __s;
  }
  if (trimdomain_domain)
  {
    v5 = a2 + 1;
    __s = (unint64_t)memchr(v3, 46, a2 + 1);
    if (__s)
    {
      v6 = (_BYTE *)__s;
      v7 = trimdomain_dlen;
      __s = strncasecmp((const char *)(__s + 1), &trimdomain_domain, trimdomain_dlen);
      if (!(_DWORD)__s)
      {
        if (v6[v7 + 1] == 58)
        {
          v8 = &v6[v7];
          v9 = &v6[v7 + 2];
          __s = strspn(v9, "0123456789");
          if (__s)
          {
            if (!v9[__s] || v9[__s] == 46 && (v10 = &v9[__s + 1], (__s = strspn(v10, "0123456789")) != 0) && !v10[__s])
            {
              __s = strlen(v8 + 1);
              if (__s < (_BYTE *)v3 + v5 - v6)
                return (unint64_t)memmove(v6, v8 + 1, __s + 1);
            }
          }
        }
        else if (!v6[v7 + 1])
        {
          *v6 = 0;
        }
      }
    }
  }
  return __s;
}

uint64_t tzlink(const char *a1)
{
  _xpc_connection_s *mach_service;
  xpc_object_t v3;
  xpc_object_t v4;
  uint64_t uint64;

  if (!a1)
    return 22;
  mach_service = xpc_connection_create_mach_service("com.apple.tzlink", 0, 2uLL);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global);
  xpc_connection_resume(mach_service);
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "tz", a1);
  v4 = xpc_connection_send_message_with_reply_sync(mach_service, v3);
  if (MEMORY[0x1E0BFD610]() == MEMORY[0x1E0C812F8])
    uint64 = xpc_dictionary_get_uint64(v4, "error");
  else
    uint64 = 5;
  xpc_release(v4);
  xpc_release(v3);
  xpc_release(mach_service);
  return uint64;
}

uint64_t wipefs_alloc(int a1, uint64_t a2, uint64_t *a3)
{
  int v6;
  off_t st_size;
  char *v8;
  char *p_s;
  char *v10;
  const char *v11;
  char *v12;
  uint64_t v13;
  unsigned int st_blksize;
  uint64_t v15;
  uint64_t v16;
  ExtentManager *v17;
  _QWORD *v18;
  uint64_t v19;
  stat v21;
  unsigned int v22;
  off_t v23;
  char __s;
  _BYTE v25[1031];

  *(_QWORD *)&v25[1023] = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v22 = 0;
  memset(&v21, 0, sizeof(v21));
  *a3 = 0;
  fstat(a1, &v21);
  v6 = v21.st_mode & 0xF000;
  if (v6 != 0x2000)
  {
    if (v6 == 0x8000)
    {
      v12 = 0;
      st_blksize = v21.st_blksize;
      v22 = v21.st_blksize;
      st_size = v21.st_size;
      v23 = v21.st_size / v21.st_blksize;
      goto LABEL_23;
    }
    if (v6 != 24576)
    {
      v13 = 0;
      *__error() = 22;
      return v13;
    }
  }
  if (ioctl(a1, 0x40046418uLL, &v22) < 0 || ioctl(a1, 0x40086419uLL, &v23) < 0)
  {
    v13 = *__error();
    if (!(_DWORD)v13)
      return v13;
    goto LABEL_33;
  }
  st_size = v23 * v22;
  if (fcntl(a1, 50, &__s) == -1)
    goto LABEL_16;
  v8 = strrchr(&__s, 47);
  if (v8)
    p_s = v8 + 1;
  else
    p_s = &__s;
  v10 = v8 + 2;
  if (!v8)
    v10 = v25;
  v11 = *p_s == 114 ? v10 : p_s;
  if (!strncmp(v11, "disk", 4uLL))
    v12 = strdup(v11);
  else
LABEL_16:
    v12 = 0;
  st_blksize = v22;
LABEL_23:
  if (a2)
    v15 = a2;
  else
    v15 = st_blksize;
  v13 = 22;
  if (!v15 || !st_size)
  {
    if (v12)
      free(v12);
LABEL_33:
    wipefs_free(a3);
    return v13;
  }
  v16 = operator new();
  *(_QWORD *)(v16 + 8) = 0;
  v17 = (ExtentManager *)(v16 + 8);
  *(_QWORD *)(v16 + 24) = 0;
  v18 = (_QWORD *)(v16 + 24);
  *(_QWORD *)(v16 + 32) = 0;
  *(_QWORD *)(v16 + 40) = v16 + 40;
  *(_QWORD *)(v16 + 56) = 0;
  *(_QWORD *)(v16 + 64) = 0;
  *(_QWORD *)(v16 + 48) = v16 + 40;
  *a3 = v16;
  *(_DWORD *)v16 = a1;
  ExtentManager::Init((ExtentManager *)(v16 + 8), v15, v22, st_size);
  ExtentManager::AddByteRangeExtent((ExtentManager *)(v16 + 8), 0, 0x200000);
  ExtentManager::AddByteRangeExtent((ExtentManager *)(v16 + 8), *(_QWORD *)(v16 + 24) - 0x200000, 0x200000);
  ExtentManager::AddByteRangeExtent((ExtentManager *)(v16 + 8), 0, 1536);
  ExtentManager::AddByteRangeExtent((ExtentManager *)(v16 + 8), *(_QWORD *)(v16 + 24) - 1024, 1024);
  ExtentManager::AddByteRangeExtent((ExtentManager *)(v16 + 8), 0, 0x8000);
  ExtentManager::AddByteRangeExtent((ExtentManager *)(v16 + 8), 0, 0x8000);
  ExtentManager::AddByteRangeExtent((ExtentManager *)(v16 + 8), *(_QWORD *)(v16 + 24) - 0x8000, 0x8000);
  ExtentManager::AddByteRangeExtent((ExtentManager *)(v16 + 8), *(_QWORD *)(v16 + 24) / 2 - 0x8000, 0x10000);
  v19 = *(_QWORD *)(v16 + 32);
  ExtentManager::AddByteRangeExtent((ExtentManager *)(v16 + 8), 0x8000uLL, 14336);
  ExtentManager::AddBlockRangeExtent((uint64_t *)(v16 + 8), 256, 1);
  ExtentManager::AddBlockRangeExtent((uint64_t *)(v16 + 8), 512, 1);
  ExtentManager::AddBlockRangeExtent((uint64_t *)(v16 + 8), v19 - 1, 1);
  ExtentManager::AddBlockRangeExtent((uint64_t *)(v16 + 8), v19 - 257, 1);
  if (*(_QWORD *)(v16 + 8) != 2048)
  {
    ExtentManager::AddByteRangeExtent(v17, 0x80000uLL, 2048);
    ExtentManager::AddByteRangeExtent(v17, 0x100000uLL, 2048);
    ExtentManager::AddByteRangeExtent(v17, *v18 - 2048, 2048);
    ExtentManager::AddByteRangeExtent(v17, *v18 - 0x80000, 2048);
  }
  ExtentManager::AddByteRangeExtent(v17, 0x2000uLL, 0x2000);
  ExtentManager::AddByteRangeExtent(v17, 0, 0x80000);
  ExtentManager::AddByteRangeExtent(v17, *v18 - 0x80000, 0x80000);
  ExtentManager::AddByteRangeExtent(v17, 0, 17408);
  ExtentManager::AddByteRangeExtent(v17, *v18 - 16896, 16896);
  ExtentManager::AddByteRangeExtent(v17, 0, 512);
  ExtentManager::AddByteRangeExtent(v17, *v18 - 512, 512);
  v13 = 0;
  *(_QWORD *)(*a3 + 64) = v12;
  return v13;
}

void wipefs_free(uint64_t *a1)
{
  uint64_t v1;
  void *v3;

  v1 = *a1;
  if (*a1)
  {
    v3 = *(void **)(v1 + 64);
    if (!v3 || (free(v3), (v1 = *a1) != 0))
    {
      std::__list_imp<ExtentInfo>::clear((_QWORD *)(v1 + 40));
      MEMORY[0x1E0BFD2A4](v1, 0x1030C409164897FLL);
    }
    *a1 = 0;
  }
}

uint64_t wipefs_include_blocks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ExtentManager::AddBlockRangeExtent((uint64_t *)(a1 + 8), a2, a3);
  return 0;
}

void sub_1DF2FAFEC(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1DF2FAFE4);
}

uint64_t wipefs_except_blocks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ExtentManager::RemoveBlockRangeExtent((ExtentManager *)(a1 + 8), a2, a3);
  return 0;
}

void sub_1DF2FB018(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1DF2FB010);
}

uint64_t wipefs_wipe(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  size_t v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  off_t v21;
  unint64_t v22;
  size_t v23;
  uint64_t v24;
  int v26;
  posix_spawn_file_actions_t v27;
  pid_t v28;
  _QWORD v29[2];
  char *__argv;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  char v34[16];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    v28 = 0;
    v27 = 0;
    v26 = 0;
    v33 = 0;
    strcpy(v34, "xartutil");
    strcpy((char *)v29, "--erase-disk");
    __argv = v34;
    v31 = v29;
    v32 = v2;
    if (posix_spawn_file_actions_init(&v27))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        wipefs_wipe_cold_7();
    }
    else
    {
      posix_spawn_file_actions_addopen(&v27, 1, "/dev/null", 1, 0);
      posix_spawn_file_actions_addopen(&v27, 2, "/dev/null", 1, 0);
      if (posix_spawn(&v28, "/usr/sbin/xartutil", &v27, 0, &__argv, 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          wipefs_wipe_cold_6();
      }
      else
      {
        do
        {
          if (waitpid(v28, &v26, 0) != -1)
          {
            v3 = v26;
            if ((v26 & 0x7F) == 0x7F)
            {
              v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
              if (v3 >> 8 == 19)
              {
                if (v4)
                  wipefs_wipe_cold_4();
              }
              else if (v4)
              {
                wipefs_wipe_cold_5(v3, v5, v6, v7, v8, v9, v10, v11);
              }
            }
            else if ((v26 & 0x7F) != 0)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                wipefs_wipe_cold_2();
            }
            else if (BYTE1(v26) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              wipefs_wipe_cold_3();
            }
            goto LABEL_24;
          }
        }
        while (*__error() == 4);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          wipefs_wipe_cold_1();
      }
LABEL_24:
      posix_spawn_file_actions_destroy(&v27);
    }
  }
  v12 = *(_QWORD **)(a1 + 24);
  __argv = 0;
  v31 = v12;
  v29[0] = &__argv;
  v29[1] = 0x100000001;
  ioctl(*(_DWORD *)a1, 0x8010641FuLL, v29);
  if (*(_QWORD *)(a1 + 16) <= 0x20000uLL)
    v13 = 0x20000;
  else
    v13 = *(_QWORD *)(a1 + 16);
  v14 = (void *)operator new[]();
  bzero(v14, v13);
  v15 = *(_QWORD **)(a1 + 48);
  if (v15 == (_QWORD *)(a1 + 40))
  {
LABEL_46:
    v24 = 0;
  }
  else
  {
    v16 = *(_QWORD *)(a1 + 8);
    v17 = *(_QWORD *)(a1 + 24);
    while (1)
    {
      v18 = v15[2] * v16;
      v19 = v15[3] * v16;
      v20 = *(_QWORD *)(a1 + 16);
      if (v18 % v20 || v19 % v20)
      {
        v21 = v18 - v18 % v20;
        v19 = v19 + v20 - 1 + v18 % v20 - (v19 + v18 + v20 - 1) % v20;
      }
      else
      {
        v21 = v15[2] * v16;
      }
      v22 = (uint64_t)(v21 + v19) <= v17 ? v19 : v17 - v21;
      if (v22)
        break;
LABEL_42:
      v15 = (_QWORD *)v15[1];
      if (v15 == (_QWORD *)(a1 + 40))
        goto LABEL_46;
    }
    while (1)
    {
      v23 = v13 >= v22 ? v22 : v13;
      if (pwrite(*(_DWORD *)a1, v14, v23, v21) != v23)
        break;
      v21 += v23;
      v22 -= v23;
      if (!v22)
        goto LABEL_42;
    }
    v24 = *__error();
  }
  ioctl(*(_DWORD *)a1, 0x20006416uLL);
  MEMORY[0x1E0BFD28C](v14, 0x1000C8077774924);
  return v24;
}

_QWORD *std::__list_imp<ExtentInfo>::clear(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (result[2])
  {
    v1 = result;
    result = (_QWORD *)result[1];
    v2 = *v1;
    v3 = *result;
    *(_QWORD *)(v3 + 8) = *(_QWORD *)(*v1 + 8);
    **(_QWORD **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        v4 = (_QWORD *)result[1];
        operator delete(result);
        result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void wipefs_wipe_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __error();
  OUTLINED_FUNCTION_0(&dword_1DF2F8000, MEMORY[0x1E0C81028], v0, "Warning, unable to start xartutil, waitpid error: %d", v1, v2, v3, v4, 0);
  OUTLINED_FUNCTION_1();
}

void wipefs_wipe_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DF2F8000, MEMORY[0x1E0C81028], v0, "Warning, xartutil terminated by signal: %u", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void wipefs_wipe_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DF2F8000, MEMORY[0x1E0C81028], v0, "Warning, xartutil returned status %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void wipefs_wipe_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DF2F8000, MEMORY[0x1E0C81028], v0, "Warning, xartutil terminated abnormally, status 0x%x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void wipefs_wipe_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DF2F8000, MEMORY[0x1E0C81028], a3, "Warning, xartutil stopped by signal: %u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void wipefs_wipe_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DF2F8000, MEMORY[0x1E0C81028], v0, "Warning, unable to start xartutil, spawn error: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void wipefs_wipe_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DF2F8000, MEMORY[0x1E0C81028], v0, "Warning, init xartutil file actions error: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

char ***_NSGetArgv(void)
{
  return (char ***)MEMORY[0x1E0C809C8]();
}

char ***_NSGetEnviron(void)
{
  return (char ***)MEMORY[0x1E0C809D0]();
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return MEMORY[0x1E0C809D8](buf, bufsize);
}

mach_header_64 *_NSGetMachExecuteHeader(void)
{
  return (mach_header_64 *)MEMORY[0x1E0C809E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t operator delete[]()
{
  return off_1EA985A90();
}

void operator delete(void *__p)
{
  off_1EA985A98(__p);
}

uint64_t operator delete()
{
  return off_1EA985AA0();
}

uint64_t operator new[]()
{
  return off_1EA985AA8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1EA985AB0(__sz);
}

uint64_t operator new()
{
  return off_1EA985AB8();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
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

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void errx(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C83210](*(_QWORD *)&a1, a2);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1E0C83400](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void freeaddrinfo(addrinfo *a1)
{
  MEMORY[0x1E0C834C0](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x1E0C835F8](a1, a2, a3, a4);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

hostent *__cdecl gethostbyaddr(const void *a1, socklen_t a2, int a3)
{
  return (hostent *)MEMORY[0x1E0C836A8](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

hostent *__cdecl gethostbyname(const char *a1)
{
  return (hostent *)MEMORY[0x1E0C836B0](a1);
}

int gethostname(char *a1, size_t a2)
{
  return MEMORY[0x1E0C836B8](a1, a2);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x1E0C83708](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

kern_return_t host_info(host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1E0C838B8](*(_QWORD *)&host, *(_QWORD *)&flavor, host_info_out, host_info_outCnt);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return (char *)MEMORY[0x1E0C83960](*(_QWORD *)&a1.s_addr);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1E0C83980](*(_QWORD *)&a1, a2);
}

lconv *localeconv(void)
{
  return (lconv *)MEMORY[0x1E0C83B98]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C83C90]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1E0C84B38](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addopen(posix_spawn_file_actions_t *a1, int a2, const char *a3, int a4, mode_t a5)
{
  return MEMORY[0x1E0C84B58](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1E0C84B60](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1E0C84B68](a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x1E0C84B78](a1);
}

int posix_spawnattr_setbinpref_np(posix_spawnattr_t *a1, size_t a2, cpu_type_t *a3, size_t *a4)
{
  return MEMORY[0x1E0C84B88](a1, a2, a3, a4);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x1E0C84B90](a1, a2);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84F68](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1E0C85590](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1E0C85608](__s, __charset);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1E0C85650](__str, __sep, __lasts);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

uintmax_t strtoumax(const char *__nptr, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856B8](__nptr, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1E0C85BD0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

