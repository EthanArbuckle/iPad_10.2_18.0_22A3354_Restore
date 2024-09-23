__int32 *__cdecl wcsrchr(__int32 *__s, __int32 __c)
{
  __int32 *result;
  __int32 *v4;
  __int32 v5;
  __int32 v6;

  result = 0;
  v4 = __s;
  do
  {
    v6 = *v4++;
    v5 = v6;
    if (v6 == __c)
      result = __s;
    __s = v4;
  }
  while (v5);
  return result;
}

size_t wcsspn(const __int32 *a1, const __int32 *a2)
{
  __int32 v2;
  const __int32 *v3;
  const __int32 *v4;
  __int32 v5;
  __int32 v6;
  const __int32 *v7;
  __int32 v8;
  __int32 v9;
  __int32 v10;

  v2 = *a1;
  v3 = a1;
  if (*a1)
  {
    v6 = *a2;
    v4 = a2 + 1;
    v5 = v6;
    v3 = a1;
    while (1)
    {
      v7 = v4;
      v8 = v5;
      if (!v5)
        break;
      while (v2 != v8)
      {
        v9 = *v7++;
        v8 = v9;
        if (!v9)
          return v3 - a1;
      }
      v10 = v3[1];
      ++v3;
      v2 = v10;
      if (!v10)
        return v3 - a1;
    }
    v3 = a1;
  }
  return v3 - a1;
}

FILE *__cdecl fmemopen(void *__buf, size_t __size, const char *__mode)
{
  FILE *v3;
  int *v6;
  void **v8;
  void **v9;
  void *v10;
  int v11;
  uint64_t v12;
  int (__cdecl *v13)(void *, char *, int);
  FILE *v14;
  int v15;

  v3 = (FILE *)__size;
  v15 = 0;
  if (!__size)
  {
    v6 = __error();
    goto LABEL_7;
  }
  if (!__sflags((char *)__mode, &v15) || !__buf && (v15 & 2) == 0)
  {
    v6 = __error();
    v3 = 0;
LABEL_7:
    *v6 = 22;
    return v3;
  }
  v8 = (void **)malloc_type_malloc(0x28uLL, 0x10100402BFFC1BCuLL);
  if (!v8)
    return 0;
  v9 = v8;
  v8[4] = 0;
  v8[2] = v3;
  *v8 = __buf;
  *((_BYTE *)v8 + 8) = __buf == 0;
  if (!__buf)
  {
    v10 = malloc_type_malloc((size_t)v3, 0x10A053D1uLL);
    *v9 = v10;
    if (!v10)
    {
LABEL_31:
      free(v9);
      return 0;
    }
    __buf = v10;
    if (*((_BYTE *)v9 + 8))
      goto LABEL_15;
  }
  if (*__mode == 119)
LABEL_15:
    *(_BYTE *)__buf = 0;
  *((_BYTE *)v9 + 9) = _platform_strchr() != 0;
  v11 = *__mode;
  switch(v11)
  {
    case 'w':
      v9[3] = 0;
      break;
    case 'r':
      v9[3] = v3;
      break;
    case 'a':
      v12 = _platform_strnlen();
      v9[3] = (void *)v12;
      v9[4] = (void *)v12;
      break;
  }
  if ((v15 & 1) != 0)
    v13 = 0;
  else
    v13 = (int (__cdecl *)(void *, char *, int))fmemopen_read;
  v14 = funopen(v9, v13, (int (__cdecl *)(void *, const char *, int))fmemopen_write, (fpos_t (__cdecl *)(void *, fpos_t, int))fmemopen_seek, (int (__cdecl *)(void *))fmemopen_close);
  if (!v14)
  {
    if (*((_BYTE *)v9 + 8))
      free(*v9);
    goto LABEL_31;
  }
  v3 = v14;
  if (*__mode == 97)
    v14->_flags |= 0x100u;
  setvbuf(v14, 0, 2, 0);
  return v3;
}

uint64_t fmemopen_read(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 32);
  if (v3 >= (int)a3)
    v4 = a3;
  else
    v4 = v3;
  if ((_DWORD)v4)
  {
    _platform_memmove();
    *(_QWORD *)(a1 + 32) += (int)v4;
  }
  return v4;
}

uint64_t fmemopen_write(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;

  v3 = *(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 32);
  if (v3 >= (int)a3)
    v4 = a3;
  else
    v4 = v3;
  if ((_DWORD)v4)
  {
    _platform_memmove();
    v6 = *(_QWORD *)(a1 + 24);
    v7 = *(_QWORD *)(a1 + 32) + (int)v4;
    *(_QWORD *)(a1 + 32) = v7;
    if (v7 > v6)
      *(_QWORD *)(a1 + 24) = v7;
    if (!*(_BYTE *)(a1 + 9) && v7 < *(_QWORD *)(a1 + 16) && *(_BYTE *)(v7 + *(_QWORD *)a1 - 1))
      *(_BYTE *)(*(_QWORD *)a1 + v7) = 0;
  }
  return v4;
}

uint64_t fmemopen_seek(_QWORD *a1, uint64_t a2, int a3)
{
  unint64_t v3;

  if (a3 == 2)
  {
    if (a2 > 0)
      goto LABEL_10;
    v3 = a1[3];
    if (v3 < -a2)
      goto LABEL_10;
    a2 += v3;
    goto LABEL_11;
  }
  if (a3 == 1)
  {
    a2 += a1[4];
    if ((unint64_t)a2 > a1[2])
      goto LABEL_10;
LABEL_11:
    a1[4] = a2;
    return a2;
  }
  if (!a3 && a1[2] >= (unint64_t)a2)
    goto LABEL_11;
LABEL_10:
  *__error() = 22;
  return -1;
}

uint64_t fmemopen_close(void **a1)
{
  if (*((_BYTE *)a1 + 8))
    free(*a1);
  free(a1);
  return 0;
}

__int32 *__cdecl wcsstr(__int32 *__s1, const __int32 *__s2)
{
  __int32 *v2;
  const __int32 *v3;
  __int32 v4;
  size_t v5;
  __int32 v6;
  __int32 *v7;

  v2 = __s1;
  v3 = __s2 + 1;
  v4 = *__s2;
  if (!*__s2)
    return __s1;
  v5 = wcslen(__s2 + 1);
  while (1)
  {
    v6 = *v2;
    if (!*v2)
      break;
    v7 = v2++;
    if (v6 == v4 && !wcsncmp(v2, v3, v5))
      return v7;
  }
  return 0;
}

__int32 *__cdecl wcstok(__int32 *result, const __int32 *a2, __int32 **a3)
{
  __int32 *v3;
  __int32 v4;
  __int32 v5;
  const __int32 *v6;
  __int32 v7;
  __int32 *v8;
  __int32 v9;
  __int32 v10;
  const __int32 *v11;
  __int32 v12;

  if (result || (result = *a3) != 0)
  {
    v3 = result;
LABEL_4:
    v5 = *v3++;
    v4 = v5;
    v6 = a2;
    while (1)
    {
      v7 = *v6;
      if (!*v6)
        break;
      ++v6;
      if (v4 == v7)
      {
        result = v3;
        goto LABEL_4;
      }
    }
    if (v4)
    {
      v8 = v3;
LABEL_10:
      v10 = *v8++;
      v9 = v10;
      v11 = a2;
      while (1)
      {
        v12 = *v11;
        if (*v11 == v9)
          break;
        ++v11;
        if (!v12)
        {
          v3 = v8;
          goto LABEL_10;
        }
      }
      if (v9)
        *v3 = 0;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
      result = 0;
    }
    *a3 = v8;
  }
  return result;
}

int wcswidth_l(const __int32 *a1, size_t a2, locale_t a3)
{
  locale_t v3;
  _xlocale *v4;
  size_t v5;
  int v7;
  int v8;

  v3 = (locale_t)&__global_locale;
  if (a3 != (locale_t)-1)
    v3 = a3;
  if (a3)
    v4 = v3;
  else
    v4 = (_xlocale *)&__c_locale;
  if (!a2)
    return 0;
  v5 = a2;
  v7 = 0;
  while (*a1)
  {
    v8 = wcwidth_l(*a1, v4);
    if (v8 < 0)
      return -1;
    v7 += v8;
    ++a1;
    if (!--v5)
      return v7;
  }
  return v7;
}

int wcswidth(const __int32 *a1, size_t a2)
{
  uint64_t v2;
  _xlocale *v3;
  _xlocale *v4;

  v2 = __locale_key;
  v3 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v2);
  if (v3)
    v4 = v3;
  else
    v4 = (_xlocale *)&__global_locale;
  return wcswidth_l(a1, a2, v4);
}

size_t wcsxfrm_l(__int32 *a1, const __int32 *a2, size_t a3, locale_t a4)
{
  size_t v4;
  __int32 *v5;
  locale_t v7;
  locale_t v8;
  size_t v9;
  size_t v10;
  int *v11;
  char *v12;
  __int32 *v13;
  int v14;
  size_t v15;
  uint64_t v16;
  int v17;
  int v18;
  void *v20[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v4 = a3;
  v5 = a1;
  if (*a2)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    *(_OWORD *)v20 = 0u;
    v7 = (locale_t)&__global_locale;
    if (a4 != (locale_t)-1)
      v7 = a4;
    if (a4)
      v8 = v7;
    else
      v8 = (locale_t)&__c_locale;
    if (*(_BYTE *)(*((_QWORD *)v8 + 165) + 64))
    {
      v9 = wcslen(a2);
      v10 = v9;
      if (v4)
      {
        if (v9 >= v4)
        {
          v15 = v4 - 1;
          wcsncpy(v5, a2, v15);
          v5[v15] = 0;
        }
        else
        {
          wcscpy(v5, a2);
        }
      }
    }
    else
    {
      __collate_xfrm((__int32 *)a2, v20, (uint64_t)v8);
      v11 = (int *)v20[0];
      v10 = wcslen((const __int32 *)v20[0]);
      v12 = (char *)v20[1];
      if (v20[1])
        v10 += wcslen((const __int32 *)v20[1]) + 1;
      if (v4)
      {
        if (v4 != 1)
        {
          v13 = v5 + 1;
          while (1)
          {
            v14 = *v11;
            if (!*v11)
              break;
            ++v11;
            *(v13 - 1) = v14 + 1;
            --v4;
            ++v13;
            if (v4 <= 1)
            {
              v5 = v13 - 1;
              goto LABEL_27;
            }
          }
          v5 = v13 - 1;
          if (v12)
          {
            v16 = 0;
            *v5 = 1;
            do
            {
              v17 = *(_DWORD *)&v12[v16 * 4];
              if (!v17)
                break;
              v13[v16] = v17 + 1;
              --v4;
              ++v16;
            }
            while (v4 > 1);
            v5 = &v13[v16];
          }
        }
LABEL_27:
        *v5 = 0;
      }
      v18 = *__error();
      free(v20[0]);
      free(v20[1]);
      *__error() = v18;
    }
  }
  else
  {
    v10 = 0;
    if (a3)
      *a1 = 0;
  }
  return v10;
}

size_t wcsxfrm(__int32 *a1, const __int32 *a2, size_t a3)
{
  uint64_t v3;
  _xlocale *v4;
  _xlocale *v5;

  v3 = __locale_key;
  v4 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v3);
  if (v4)
    v5 = v4;
  else
    v5 = (_xlocale *)&__global_locale;
  return wcsxfrm_l(a1, a2, a3, v5);
}

__int32 *__cdecl wmemchr(__int32 *__s, __int32 __c, size_t __n)
{
  if (!__n)
    return 0;
  while (*__s != __c)
  {
    ++__s;
    if (!--__n)
      return 0;
  }
  return __s;
}

int wmemcmp(const __int32 *a1, const __int32 *a2, size_t a3)
{
  if (!a3)
    return 0;
  while (*a1 == *a2)
  {
    ++a1;
    ++a2;
    if (!--a3)
      return 0;
  }
  if (*a1 > *a2)
    return 1;
  else
    return -1;
}

__int32 *__cdecl wmemcpy(__int32 *a1, const __int32 *a2, size_t a3)
{
  return (__int32 *)_platform_memmove();
}

__int32 *__cdecl wmemmove(__int32 *a1, const __int32 *a2, size_t a3)
{
  return (__int32 *)_platform_memmove();
}

__int32 *__cdecl wmemset(__int32 *result, __int32 a2, size_t a3)
{
  __int32 *v3;

  if (a3)
  {
    v3 = result;
    do
    {
      *v3++ = a2;
      --a3;
    }
    while (a3);
  }
  return result;
}

uint64_t _UTF2_init(_QWORD *a1)
{
  a1[9] = _UTF2_mbrtowc;
  a1[10] = _UTF2_mbsinit;
  a1[11] = _UTF2_mbsnrtowcs;
  a1[12] = _UTF2_wcrtomb;
  a1[13] = _UTF2_wcsnrtombs;
  a1[8] = 0x8000000003;
  return 0;
}

uint64_t _UTF2_mbrtowc(int *a1, const char *a2, unint64_t a3, int *a4)
{
  unsigned int v4;
  int *v5;
  int v6;
  uint64_t result;
  const char *v8;
  int *v10;
  int v11;
  int v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char v17;
  int v18;
  int v19;

  v4 = a4[1];
  if (v4 >= 7)
  {
    v5 = __error();
    v6 = 22;
LABEL_3:
    *v5 = v6;
    return -1;
  }
  if (a2)
    v8 = a2;
  else
    v8 = "";
  if (!a2)
    a3 = 1;
  if (a2)
    v10 = a1;
  else
    v10 = 0;
  if (!a3)
    return -2;
  if (v4)
  {
    v11 = a4[2];
    v12 = *a4;
    v13 = a4[1];
  }
  else
  {
    v18 = *(unsigned __int8 *)v8;
    if ((*v8 & 0x80000000) == 0)
    {
      if (v10)
        *v10 = v18;
      return v18 != 0;
    }
    if ((v18 & 0xE0) == 0xC0)
    {
      v11 = 128;
      v13 = 2;
      v19 = 31;
    }
    else
    {
      if ((v18 & 0xF0) != 0xE0)
        goto LABEL_30;
      v11 = 2048;
      v13 = 3;
      v19 = 15;
    }
    ++v8;
    v12 = v19 & v18;
  }
  v14 = v4 == 0;
  v15 = v13;
  if (a3 < v13)
    v15 = a3;
  v16 = v15 - v14;
  if (v15 > v14)
  {
    while (1)
    {
      v17 = *v8;
      if ((*v8 & 0xC0) != 0x80)
        goto LABEL_30;
      ++v8;
      v12 = v17 & 0x3F | (v12 << 6);
      if (!--v16)
      {
        LODWORD(v14) = v15;
        break;
      }
    }
  }
  if (v13 > (int)v14)
  {
    a4[1] = v13 - v14;
    a4[2] = v11;
    result = -2;
    *a4 = v12;
    return result;
  }
  if (v12 < v11)
  {
LABEL_30:
    v5 = __error();
    v6 = 92;
    goto LABEL_3;
  }
  if (v10)
    *v10 = v12;
  a4[1] = 0;
  if (v12)
    return v13;
  else
    return 0;
}

uint64_t _UTF2_wcrtomb(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  int *v3;
  int v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  unint64_t v8;

  if (*(_DWORD *)(a3 + 4))
  {
    v3 = __error();
    v4 = 22;
LABEL_3:
    *v3 = v4;
    return -1;
  }
  if (!a1)
    return 1;
  if (a2 <= 0x7F)
  {
    *a1 = a2;
    return 1;
  }
  if (a2 >= 0x800)
  {
    if (a2 >= 0x10000)
    {
      v3 = __error();
      v4 = 92;
      goto LABEL_3;
    }
    v6 = -32;
    v5 = 3;
  }
  else
  {
    v6 = -64;
    v5 = 2;
  }
  v7 = v5 - 1;
  do
  {
    a1[v7] = a2 & 0x3F | 0x80;
    a2 = (int)a2 >> 6;
    v8 = v7-- + 1;
  }
  while (v8 > 2);
  *a1 = a2 | v6;
  return v5;
}

BOOL _UTF2_mbsinit(uint64_t a1)
{
  return !a1 || *(_DWORD *)(a1 + 4) == 0;
}

uint64_t _UTF2_mbsnrtowcs(int *a1, const char **a2, unint64_t a3, uint64_t a4, int *a5)
{
  unint64_t v6;
  const char *v7;
  uint64_t v8;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v16;

  v6 = a3;
  v16 = 0;
  v7 = *a2;
  if (a1)
  {
    v8 = a4;
    v10 = a1;
    if (!a3 || !a4)
    {
      if (!a4)
      {
LABEL_20:
        *a2 = v7;
        return v8;
      }
      goto LABEL_12;
    }
    if (a5[1] < 1 || *v7 < 1)
    {
LABEL_12:
      v11 = 0;
      v12 = -a4;
      while (1)
      {
        if (v6 && *v7 >= 1)
        {
          *v10 = *(unsigned __int8 *)v7;
          v13 = 1;
        }
        else
        {
          v13 = _UTF2_mbrtowc(v10, v7, v6, a5);
          switch(v13)
          {
            case -2:
              *a2 = &v7[v6];
              return -v11;
            case 0:
              *a2 = 0;
              return -v11;
            case -1:
              *a2 = v7;
              return -1;
          }
        }
        v7 += v13;
        v6 -= v13;
        ++v10;
        if (v12 == --v11)
          goto LABEL_20;
      }
    }
LABEL_10:
    *__error() = 92;
    return -1;
  }
  if (a3 && a5[1] >= 1 && *v7 >= 1)
    goto LABEL_10;
  v8 = 0;
  if (!a3)
    goto LABEL_24;
LABEL_22:
  if (*v7 > 0)
  {
    v14 = 1;
    goto LABEL_27;
  }
LABEL_24:
  while (1)
  {
    v14 = _UTF2_mbrtowc(&v16, v7, v6, a5);
    switch(v14)
    {
      case -2:
        return v8;
      case -1:
        return -1;
      case 0:
        return v8;
    }
LABEL_27:
    v7 += v14;
    v6 -= v14;
    ++v8;
    if (v6)
      goto LABEL_22;
  }
}

uint64_t _UTF2_wcsnrtombs(_BYTE *a1, unsigned int **a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _BYTE *v9;
  unsigned int *v10;
  unint64_t v11;
  unsigned int v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v19[6];

  if (*(_DWORD *)(a5 + 4))
  {
    *__error() = 22;
    return -1;
  }
  else
  {
    v9 = a1;
    v10 = *a2;
    v5 = 0;
    if (a1)
    {
      v11 = a4;
      if (a4)
      {
        while (a3)
        {
          v12 = *v10;
          if (*v10 > 0x7F)
          {
            if (v11 < 4)
            {
              v14 = _UTF2_wcrtomb(v19, v12, a5);
              if (v14 == -1)
              {
LABEL_30:
                *a2 = v10;
                return -1;
              }
              v13 = v14;
              if (v14 > v11)
                break;
              _platform_memmove();
            }
            else
            {
              v13 = _UTF2_wcrtomb(v9, v12, a5);
              if (v13 == -1)
                goto LABEL_30;
            }
          }
          else
          {
            *v9 = v12;
            v13 = 1;
          }
          if (!*v10)
          {
            *a2 = 0;
            v17 = v5 + v13;
            return v17 - 1;
          }
          ++v10;
          v9 += v13;
          v5 += v13;
          --a3;
          v11 -= v13;
          if (!v11)
            break;
        }
      }
      *a2 = v10;
    }
    else
    {
      while (a3)
      {
        v15 = *v10;
        if (*v10 >= 0x80)
        {
          v16 = _UTF2_wcrtomb(v19, v15, a5);
          if (v16 == -1)
            return -1;
          if (!*v10)
          {
LABEL_27:
            v17 = v5 + v16;
            return v17 - 1;
          }
        }
        else
        {
          v16 = 1;
          if (!v15)
            goto LABEL_27;
        }
        ++v10;
        v5 += v16;
        --a3;
      }
    }
  }
  return v5;
}

uint64_t a64l(const char *a1)
{
  char v1;
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  BOOL v6;

  if (a1)
  {
    v1 = *a1;
    if (*a1)
    {
      v2 = 0;
      v3 = 0;
      v4 = 0;
      do
      {
        v5 = -46;
        if ((v1 & 0xFE) != 0x2E && (v1 - 48) >= 0xAu)
        {
          if ((v1 - 65) >= 0x1A)
          {
            if ((v1 - 97) >= 0x1A)
              goto LABEL_16;
            v5 = -59;
          }
          else
          {
            v5 = -53;
          }
        }
        v4 |= (v5 + v1) << v3;
        v3 += 6;
        v1 = a1[v2 + 1];
        if (v1)
          v6 = v2 >= 5;
        else
          v6 = 1;
        ++v2;
      }
      while (!v6);
      return v4;
    }
    else
    {
      return 0;
    }
  }
  else
  {
LABEL_16:
    *__error() = 22;
    return -1;
  }
}

void _Exit(int a1)
{
  __exit();
}

long double abs(long double __lcpp_x)
{
  return __lcpp_x;
}

int atoi_l(const char *a1, locale_t a2)
{
  return strtol_l(a1, 0, 10, a2);
}

uint64_t atol_l(const char *a1, locale_t a2)
{
  return strtol_l(a1, 0, 10, a2);
}

uint64_t atoll_l(const char *a1, locale_t a2)
{
  return strtoll_l(a1, 0, 10, a2);
}

void __environ_lock_fork_child()
{
  __environ_lock_obj = 0;
}

_BYTE *_getenvp(_BYTE *a1, char **a2)
{
  _BYTE *v4;
  int v6;

  os_unfair_lock_lock_with_options();
  v4 = __findenv_locked(a1, &v6, *a2);
  os_unfair_lock_unlock((os_unfair_lock_t)&__environ_lock_obj);
  return v4;
}

int getopt(int a1, char *const a2[], const char *a3)
{
  char *v6;
  char *v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;

  if (!optreset)
  {
    v9 = *getopt_place;
    if (*getopt_place)
    {
      v7 = ++getopt_place;
      optopt = v9;
LABEL_12:
      if (v9 == 58)
        goto LABEL_21;
      goto LABEL_16;
    }
  }
  optreset = 0;
  if (optind < a1 && (v6 = a2[optind], *v6 == 45))
  {
    v7 = v6 + 2;
    getopt_place = v6 + 2;
    v8 = v6[1];
    v9 = (char)v8;
    optopt = (char)v8;
    if (v8)
    {
      if (v8 != 45)
        goto LABEL_12;
      if (*v7)
      {
        v9 = 45;
        goto LABEL_16;
      }
      ++optind;
      getopt_place = &EMSG;
    }
    else
    {
      getopt_place = &EMSG;
      v9 = 45;
      if (_platform_strchr())
      {
        optopt = 45;
        v7 = &EMSG;
LABEL_16:
        v10 = _platform_strchr();
        if (v10)
        {
          if (*(_BYTE *)(v10 + 1) == 58)
          {
            if (!*v7)
            {
              if (*(_BYTE *)(v10 + 2) == 58)
              {
                v7 = 0;
              }
              else
              {
                v11 = optind;
                v12 = optind + 1;
                optind = v12;
                if (v12 >= a1)
                {
                  optind = v11 + 2;
                  optarg = 0;
                  getopt_place = &EMSG;
                  if (*a3 == 58)
                    return 58;
                  if (opterr)
                    fprintf(__stderrp, "%s: option requires an argument -- %c\n");
                  return 63;
                }
                v7 = a2[v12];
              }
            }
            optarg = v7;
            getopt_place = &EMSG;
          }
          else
          {
            optarg = 0;
            if (*v7)
              return v9;
          }
          ++optind;
          return v9;
        }
LABEL_21:
        if (!*v7)
          ++optind;
        if (opterr && *a3 != 58)
          fprintf(__stderrp, "%s: illegal option -- %c\n");
        return 63;
      }
    }
  }
  else
  {
    getopt_place = &EMSG;
  }
  return -1;
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return getopt_internal(*(uint64_t *)&a1, (uint64_t)a2, (unsigned __int8 *)a3, a4, a5, 1u);
}

uint64_t permute_args(uint64_t result, int a2, int a3, uint64_t a4)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  int v14;

  v4 = (a2 - (int)result) % (a3 - a2);
  if (v4)
  {
    v5 = a3 - a2;
    do
    {
      v6 = v4;
      v4 = v5 % v4;
      v5 = v6;
    }
    while (v4);
  }
  else
  {
    v6 = a3 - a2;
  }
  if (v6 >= 1)
  {
    v7 = 0;
    v8 = result - a2;
    v9 = v6;
    v10 = (a3 - (int)result) / v6;
    do
    {
      if (v10 >= 1)
      {
        v11 = *(_QWORD *)(a4 + 8 * (v7 + a2));
        v12 = v10;
        v13 = v7 + a2;
        do
        {
          if (v13 >= a2)
            v14 = v8;
          else
            v14 = a3 - a2;
          v13 += v14;
          result = *(_QWORD *)(a4 + 8 * v13);
          *(_QWORD *)(a4 + 8 * v13) = v11;
          *(_QWORD *)(a4 + 8 * (v7 + a2)) = result;
          v11 = result;
          --v12;
        }
        while (v12);
      }
      ++v7;
    }
    while (v7 != v9);
  }
  return result;
}

uint64_t parse_long_options(uint64_t a1, _BYTE *a2, _QWORD *a3, int *a4, int a5, char a6)
{
  const char *v9;
  const char *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  BOOL v17;
  char v18;
  _QWORD *v19;
  int v20;
  _QWORD *v21;
  uint64_t v22;
  const char *v23;
  _QWORD *v24;
  int *v25;
  int v26;
  int v27;
  BOOL v28;
  uint64_t result;
  _QWORD *v30;
  int v31;
  _QWORD *v32;
  int v33;
  _QWORD *v34;
  _DWORD *v35;
  int v36;
  const char *v37;
  int v38;
  _BYTE *v41;
  char *v42;

  v9 = place;
  if (dash_prefix > 2)
    v10 = "";
  else
    v10 = off_1E1E9D6A0[dash_prefix];
  v11 = optind++;
  v12 = optind;
  v13 = _platform_strchr();
  v38 = v12;
  if (v13)
  {
    v14 = v13 - (_QWORD)v9;
    v42 = (char *)(v13 + 1);
  }
  else
  {
    v14 = _platform_strlen();
    v42 = 0;
  }
  if (!*a3)
  {
LABEL_40:
    if (a5)
    {
      optind = v11;
      return 0xFFFFFFFFLL;
    }
    if (opterr && *a2 != 58)
LABEL_45:
    optopt = 0;
    return 63;
  }
  v36 = v11;
  v37 = v10;
  v41 = a2;
  v15 = 0;
  v16 = 0;
  if (a5)
    v17 = v14 == 1;
  else
    v17 = 0;
  v18 = v17;
  v19 = a3 + 4;
  v20 = -1;
  do
  {
    if (!_platform_strncmp())
    {
      if (_platform_strlen() == v14)
      {
        v20 = v15;
        a2 = v41;
        v23 = v37;
        goto LABEL_32;
      }
      if ((v18 & 1) == 0)
      {
        if (v20 == -1)
        {
          v20 = v15;
        }
        else if ((a6 & 4) != 0
               || (v21 = &a3[4 * v20], *((_DWORD *)v19 - 6) != *((_DWORD *)v21 + 2))
               || *(v19 - 2) != v21[2]
               || *((_DWORD *)v19 - 2) != LODWORD(a3[4 * v20 + 3]))
        {
          v16 = 1;
        }
      }
    }
    v22 = *v19;
    v19 += 4;
    ++v15;
  }
  while (v22);
  if (v16)
  {
    if (opterr)
    {
      if (*v41 != 58)
    }
    goto LABEL_45;
  }
  a2 = v41;
  v23 = v37;
  v11 = v36;
  if (v20 == -1)
    goto LABEL_40;
LABEL_32:
  v24 = &a3[4 * v20];
  v27 = *((_DWORD *)v24 + 2);
  v25 = (int *)(v24 + 1);
  v26 = v27;
  if (v27)
    v28 = 1;
  else
    v28 = v42 == 0;
  if (!v28)
  {
    if (opterr && *a2 != 58)
    v30 = &a3[4 * v20];
    if (v30[2])
      v31 = 0;
    else
      v31 = *((_DWORD *)v30 + 6);
    optopt = v31;
    return 63;
  }
  if ((v26 - 1) > 1)
    goto LABEL_64;
  if (v42)
  {
    optarg = v42;
  }
  else
  {
    if (v26 != 1)
      goto LABEL_64;
    optind = v36 + 2;
    optarg = *(char **)(a1 + 8 * v38);
    v26 = *v25;
  }
  if (v26 == 1 && !optarg)
  {
    if (opterr && *a2 != 58)
    v32 = &a3[4 * v20];
    if (v32[2])
      v33 = 0;
    else
      v33 = *((_DWORD *)v32 + 6);
    optopt = v33;
    --optind;
    if (*a2 == 58)
      return 58;
    else
      return 63;
  }
LABEL_64:
  if (a4)
    *a4 = v20;
  v34 = &a3[4 * v20];
  v35 = (_DWORD *)v34[2];
  result = *((unsigned int *)v34 + 6);
  if (v35)
  {
    *v35 = result;
    return 0;
  }
  return result;
}

int getsubopt(char **a1, char *const *a2, char **a3)
{
  char *v3;
  unsigned int v4;
  char *v5;
  int v6;
  int v7;
  char *i;
  unsigned int v9;
  uint64_t v10;
  char *const *v11;
  unsigned int v14;
  BOOL v15;
  uint64_t v16;

  *a3 = 0;
  suboptarg = 0;
  if (!a1)
    goto LABEL_32;
  v3 = *a1;
  if (!*a1)
    goto LABEL_32;
  while (1)
  {
    v4 = *v3;
    if (v4 <= 0x1F)
      break;
    if (v4 != 44 && v4 != 32)
      goto LABEL_11;
LABEL_8:
    ++v3;
  }
  if (v4 == 9)
    goto LABEL_8;
  if (!*v3)
  {
    *a1 = v3;
    goto LABEL_32;
  }
LABEL_11:
  suboptarg = v3;
  v5 = v3 + 1;
  do
  {
    while (1)
    {
      v7 = *v5++;
      v6 = v7;
      if (v7 <= 31)
        break;
      if (v6 == 32 || v6 == 44)
        goto LABEL_19;
      if (v6 == 61)
      {
        *(v5 - 1) = 0;
        *a3 = v5;
        for (i = v5; ; ++i)
        {
          v9 = *i;
          if (v9 > 0x1F)
          {
            if (v9 == 32 || v9 == 44)
              goto LABEL_34;
          }
          else
          {
            if (!*i)
              goto LABEL_36;
            if (v9 == 9)
            {
LABEL_34:
              v5 = i + 1;
              goto LABEL_35;
            }
          }
        }
      }
    }
    if (!v6)
    {
      i = v5 - 1;
      goto LABEL_28;
    }
  }
  while (v6 != 9);
LABEL_19:
  i = v5 - 1;
LABEL_35:
  *i = 0;
  i = v5;
LABEL_36:
  while (1)
  {
    v14 = *i;
    v15 = v14 > 0x2C;
    v16 = (1 << v14) & 0x100100000200;
    if (v15 || v16 == 0)
      break;
    ++i;
  }
LABEL_28:
  *a1 = i;
  if (!*a2)
  {
LABEL_32:
    LODWORD(v10) = -1;
    return v10;
  }
  v10 = 0;
  v11 = a2 + 1;
  while (_platform_strcmp())
  {
    if (!v11[v10++])
      goto LABEL_32;
  }
  return v10;
}

int hcreate(size_t a1)
{
  int *v1;
  int result;
  int v3;
  size_t v4;
  char v5;
  BOOL v6;

  if (htable)
  {
    v1 = __error();
    result = 0;
    v3 = 22;
LABEL_3:
    *v1 = v3;
    return result;
  }
  v4 = 16;
  if (a1 > 0x10)
    v4 = a1;
  if (v4 >= 0x400000000000000)
    v4 = 0x400000000000000;
  if ((v4 & (v4 - 1)) != 0)
  {
    v5 = -1;
    do
    {
      ++v5;
      v6 = v4 > 1;
      v4 >>= 1;
    }
    while (v6);
    v4 = 2 << v5;
  }
  htablesize = v4;
  htable = (uint64_t)malloc_type_malloc(8 * v4, 0x2004093837F09uLL);
  if (!htable)
  {
    v1 = __error();
    result = 0;
    v3 = 12;
    goto LABEL_3;
  }
  if (htablesize)
    _platform_bzero();
  return 1;
}

void hdestroy_0(void)
{
  _QWORD *v0;
  unint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  void *v4;

  v0 = (_QWORD *)htable;
  if (htable)
  {
    v1 = htablesize;
    if (htablesize)
    {
      v2 = 0;
      do
      {
        v3 = (_QWORD *)v0[v2];
        if (v3)
        {
          do
          {
            v4 = (void *)v3[1];
            v0[v2] = *v3;
            free(v4);
            free(v3);
            v3 = (_QWORD *)v0[v2];
          }
          while (v3);
          v1 = htablesize;
        }
        ++v2;
      }
      while (v2 < v1);
    }
    free(v0);
    htable = 0;
  }
}

ENTRY *__cdecl hsearch(ENTRY a1, ACTION a2)
{
  char *data;
  char *key;
  uint64_t v5;
  char **v6;
  char **v7;
  ENTRY *result;
  ENTRY *v9;

  data = (char *)a1.data;
  key = a1.key;
  v5 = _platform_strlen();
  v6 = (char **)(htable
               + 8
               * (((_DWORD)htablesize - 1) & ((unsigned int (*)(uint64_t, uint64_t))__default_hash[0])((uint64_t)key, v5)));
  v7 = v6;
  while (1)
  {
    v7 = (char **)*v7;
    if (!v7)
      break;
    if (!_platform_strcmp())
      return (ENTRY *)(v7 + 1);
  }
  if (a2 == FIND)
    return 0;
  result = (ENTRY *)malloc_type_malloc(0x18uLL, 0xB00404D7CA56CuLL);
  if (result)
  {
    v9 = result;
    result->data = key;
    result = (ENTRY *)((char *)result + 8);
    v9[1].key = data;
    v9->key = *v6;
    *v6 = (char *)v9;
  }
  return result;
}

intmax_t imaxabs(intmax_t j)
{
  if (j < 0)
    return -j;
  return j;
}

imaxdiv_t imaxdiv(intmax_t __numer, intmax_t __denom)
{
  intmax_t v2;
  uint64_t v3;
  intmax_t v4;
  intmax_t v5;
  intmax_t v6;
  imaxdiv_t result;

  v2 = __numer / __denom;
  v3 = (__numer >= 0) & (__numer % __denom < 0);
  if (__numer >= 0 && __numer % __denom < 0)
    v4 = __denom;
  else
    v4 = 0;
  v5 = __numer % __denom - v4;
  v6 = v2 + v3;
  result.rem = v5;
  result.quot = v6;
  return result;
}

void insque(void *a1, void *a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = *(_QWORD *)a2;
    if (*(_QWORD *)a2)
      *(_QWORD *)(v2 + 8) = a1;
    *(_QWORD *)a2 = a1;
    *(_QWORD *)a1 = v2;
    *((_QWORD *)a1 + 1) = a2;
  }
  else
  {
    *(_QWORD *)a1 = 0;
    *((_QWORD *)a1 + 1) = 0;
  }
}

uint64_t labs(uint64_t result)
{
  if (result < 0)
    return -result;
  return result;
}

uint64_t llabs(uint64_t result)
{
  if (result < 0)
    return -result;
  return result;
}

void *__cdecl lsearch(const void *a1, void *a2, size_t *a3, size_t a4, int (__cdecl *a5)(const void *, const void *))
{
  int64_t v8;
  char *v9;
  char *v11;

  v8 = *a3 * a4;
  v9 = (char *)a2 + v8;
  if (v8 < 1)
  {
LABEL_5:
    _platform_memmove();
    ++*a3;
    return v9;
  }
  else
  {
    v11 = (char *)a2;
    while (((unsigned int (*)(const void *, char *))a5)(a1, v11))
    {
      v11 += a4;
      if (v11 >= v9)
        goto LABEL_5;
    }
  }
  return v11;
}

void *__cdecl lfind(const void *a1, const void *a2, size_t *a3, size_t a4, int (__cdecl *a5)(const void *, const void *))
{
  int64_t v5;
  char *v8;
  char *v10;

  v5 = *a3 * a4;
  if (v5 < 1)
    return 0;
  v8 = (char *)a2;
  v10 = (char *)a2 + v5;
  while (((unsigned int (*)(const void *, char *))a5)(a1, v8))
  {
    v8 += a4;
    if (v8 >= v10)
      return 0;
  }
  return v8;
}

uint64_t _putenvp(unsigned __int8 *a1, char **a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  environ_lock_np();
  if (__init__env_owned_locked(1))
  {
    v6 = 0xFFFFFFFFLL;
  }
  else
  {
    if (a3)
      v7 = a3;
    else
      v7 = __env_owned;
    v6 = __setenv_locked(a1, 0, 1, 0, a2, v7);
  }
  environ_unlock_np();
  return v6;
}

int putenv(char *a1)
{
  char **v3;
  int v4;

  if (!a1 || !*a1 || !_platform_strchr())
  {
    *__error() = 22;
    return -1;
  }
  environ_lock_np();
  if (__init__env_owned_locked(1))
  {
    environ_unlock_np();
    return -1;
  }
  v3 = (char **)_NSGetEnviron();
  v4 = __setenv_locked((unsigned __int8 *)a1, 0, 1, 0, v3, __env_owned);
  environ_unlock_np();
  return v4;
}

int radixsort(const unsigned __int8 **__base, int __nel, const unsigned __int8 *__table, unsigned int __endbyte)
{
  const unsigned __int8 *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[256];

  if (!__table)
  {
    if (__endbyte)
    {
      v7 = 0;
      v8 = __endbyte;
      do
      {
        v10[v7] = v7 + 1;
        ++v7;
      }
      while (__endbyte != v7);
      v4 = v10;
      v10[__endbyte] = 0;
      if (__endbyte > 0xFE)
        goto LABEL_12;
    }
    else
    {
      v8 = 0;
      v10[0] = 0;
    }
    v9 = v8 + 1;
    do
    {
      v4 = v10;
      v10[v9] = v9;
      ++v9;
    }
    while (v9 != 256);
LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  v4 = __table;
  v5 = __table[__endbyte];
  if ((v5 - 1) <= 0xFD)
  {
    *__error() = 22;
    return -1;
  }
LABEL_13:
  r_sort_a(__base, *(_QWORD *)&__nel, 0, v4, v5);
  return 0;
}

#error "18A0CF148: call analysis failed (funcsize=254)"

int sradixsort(const unsigned __int8 **__base, int __nel, const unsigned __int8 *__table, unsigned int __endbyte)
{
  uint64_t v4;
  const unsigned __int8 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const unsigned __int8 **v11;
  const unsigned __int8 *v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  unsigned int v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  int v21;
  BOOL v22;
  void *v23;
  void *v24;
  _BYTE v26[256];

  v4 = *(_QWORD *)&__nel;
  if (!__table)
  {
    if (__endbyte)
    {
      v8 = 0;
      v9 = __endbyte;
      do
      {
        v26[v8] = v8 + 1;
        ++v8;
      }
      while (__endbyte != v8);
      v6 = v26;
      v26[__endbyte] = 0;
      if (__endbyte > 0xFE)
        goto LABEL_12;
    }
    else
    {
      v9 = 0;
      v26[0] = 0;
    }
    v10 = v9 + 1;
    do
    {
      v6 = v26;
      v26[v10] = v10;
      ++v10;
    }
    while (v10 != 256);
LABEL_12:
    v7 = 0;
LABEL_13:
    if (__nel > 19)
    {
      v23 = malloc_type_malloc(8 * __nel, 0x80040B8603338uLL);
      if (!v23)
        return -1;
      v24 = v23;
      r_sort_b(__base, v23, v4, 0, v6, v7);
      free(v24);
    }
    else if (__nel >= 2)
    {
      v11 = __base;
      do
      {
        if (++v11 > __base)
        {
          v12 = *v11;
          v13 = (uint64_t)(*v11 + 1);
          v14 = v11;
          v15 = (unint64_t)v11;
          do
          {
            v17 = *(unsigned __int8 **)(v15 - 8);
            v15 -= 8;
            v16 = v17;
            v18 = v6[*v12];
            if ((_DWORD)v7 == v18)
            {
              v19 = v16;
            }
            else
            {
              v20 = (unsigned __int8 *)v13;
              v19 = v16;
              do
              {
                if (v18 != v6[*v19])
                  break;
                ++v19;
                v21 = *v20++;
                v18 = v6[v21];
              }
              while ((_DWORD)v7 != v18);
            }
            if (v18 >= v6[*v19])
              break;
            *(v14 - 1) = v12;
            *v14 = v16;
            v14 = (_QWORD *)v15;
          }
          while (v15 > (unint64_t)__base);
        }
        v22 = (int)v4 <= 2;
        LODWORD(v4) = v4 - 1;
      }
      while (!v22);
    }
    return 0;
  }
  v6 = __table;
  v7 = __table[__endbyte];
  if ((v7 - 1) > 0xFD)
    goto LABEL_13;
  *__error() = 22;
  return -1;
}

#error "18A0CF56C: call analysis failed (funcsize=223)"

void *r_sort_count_allocate()
{
  void *result;

  r_sort_a_count = (uint64_t)malloc_type_calloc(0x100uLL, 4uLL, 0x100004052888210uLL);
  result = malloc_type_calloc(0x100uLL, 4uLL, 0x100004052888210uLL);
  r_sort_b_count = (uint64_t)result;
  return result;
}

char *__cdecl initstate(unsigned int a1, char *a2, size_t a3)
{
  char *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;

  v5 = (char *)(state - 1);
  if (rand_type)
    v6 = 5 * ((unint64_t)((char *)rptr[0] - (char *)state) >> 2) + rand_type;
  else
    v6 = 0;
  *(_DWORD *)v5 = v6;
  if (a3 > 7)
  {
    if (a3 >= 0x20)
    {
      v9 = 3;
      if (a3 >= 0x40)
      {
        if (a3 < 0x100)
          v11 = 3;
        else
          v11 = 4;
        v12 = 63;
        if (a3 >= 0x100)
          v13 = 63;
        else
          v13 = 31;
        if (a3 >= 0x100)
          v9 = 1;
        else
          v9 = 3;
        if (a3 < 0x100)
          v12 = 31;
        if (a3 >= 0x80)
          v7 = v11;
        else
          v7 = 2;
        if (a3 >= 0x80)
          v8 = v13;
        else
          v8 = 15;
        if (a3 >= 0x80)
        {
          v10 = v12;
        }
        else
        {
          v9 = 1;
          v10 = 15;
        }
      }
      else
      {
        v8 = 7;
        v7 = 1;
        v10 = 7;
      }
    }
    else
    {
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
    }
    rand_type = v7;
    rand_deg = v8;
    rand_sep = v9;
    state = (int *)(a2 + 4);
    end_ptr = (uint64_t)&a2[4 * v10 + 4];
    srandom(a1);
    if (a3 >= 0x20)
      v14 = 5 * ((unint64_t)((char *)rptr[0] - (a2 + 4)) >> 2) + v7;
    else
      v14 = 0;
    *(_DWORD *)a2 = v14;
  }
  else
  {
    fprintf(__stderrp, "random: not enough state (%ld bytes); ignored.\n", a3);
    return 0;
  }
  return v5;
}

char *__cdecl setstate(const char *a1)
{
  unsigned int v2;
  unsigned int v3;
  char *result;
  int v5;
  uint64_t v6;
  int v7;
  int *v8;

  v2 = *(_DWORD *)a1 / 5u;
  v3 = *(_DWORD *)a1 % 5u;
  result = (char *)(state - 1);
  if (rand_type)
    v5 = 5 * ((unint64_t)((char *)rptr[0] - (char *)state) >> 2) + rand_type;
  else
    v5 = 0;
  *(_DWORD *)result = v5;
  rand_type = v3;
  v6 = degrees[v3];
  rand_deg = degrees[v3];
  v7 = seps[v3];
  rand_sep = v7;
  v8 = (int *)(a1 + 4);
  state = v8;
  if (v3)
  {
    rptr[0] = &v8[v2];
    fptr = &v8[(v7 + v2) % v6];
  }
  end_ptr = (uint64_t)&v8[v6];
  return result;
}

void remque(void *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = *(_QWORD *)a1;
  v1 = (_QWORD *)*((_QWORD *)a1 + 1);
  if (v1)
    *v1 = v2;
  if (v2)
    *(_QWORD *)(v2 + 8) = v1;
}

uint64_t _do_nothing()
{
  return 0;
}

uint64_t __init__env_owned_locked(int a1)
{
  uint64_t result;
  int v3;
  _QWORD *v4;

  if (__env_owned)
    return 0;
  if (a1)
    v3 = 0;
  else
    v3 = *__error();
  v4 = _owned_ptr_alloc();
  __env_owned = (uint64_t)v4;
  if (v4)
    result = 0;
  else
    result = 0xFFFFFFFFLL;
  if (!a1 && !v4)
  {
    *__error() = v3;
    return 0xFFFFFFFFLL;
  }
  return result;
}

void *_copyenv(_QWORD *a1)
{
  size_t v1;
  _QWORD *v3;
  void *v4;

  if (a1)
  {
    if (*a1)
    {
      v1 = 1;
      while (a1[v1++])
        ;
    }
    else
    {
      v1 = 1;
    }
    v4 = malloc_type_malloc(v1 * 8, 0x467D4C97uLL);
    if (v4)
      _platform_memmove();
  }
  else
  {
    v3 = malloc_type_malloc(8uLL, 0x467D4C97uLL);
    v4 = v3;
    if (v3)
      *v3 = 0;
  }
  return v4;
}

uint64_t _deallocenvstate(void **a1)
{
  if (!a1 || (void **)__env_owned == a1)
  {
    *__error() = 22;
    return 0xFFFFFFFFLL;
  }
  else
  {
    free(*a1);
    free(a1);
    return 0;
  }
}

uint64_t _setenvp(unsigned __int8 *a1, unsigned __int8 *a2, int a3, char **a4, uint64_t a5)
{
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  environ_lock_np();
  v10 = (_QWORD *)__env_owned;
  if (__env_owned || (v10 = _owned_ptr_alloc(), (__env_owned = (uint64_t)v10) != 0))
  {
    if (a5)
      v11 = a5;
    else
      v11 = (uint64_t)v10;
    v12 = __setenv_locked(a1, a2, a3, 1, a4, v11);
  }
  else
  {
    v12 = 0xFFFFFFFFLL;
  }
  environ_unlock_np();
  return v12;
}

uint64_t _unsetenvp(_BYTE *a1, char **a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  environ_lock_np();
  v6 = (_QWORD *)__env_owned;
  if (__env_owned || (v6 = _owned_ptr_alloc(), (__env_owned = (uint64_t)v6) != 0))
  {
    if (a3)
      v7 = a3;
    else
      v7 = (uint64_t)v6;
    __unsetenv_locked(a1, *a2, v7);
    v8 = 0;
  }
  else
  {
    v8 = 0xFFFFFFFFLL;
  }
  environ_unlock_np();
  return v8;
}

hash_table *__cdecl hash_create(int size)
{
  uint64_t v1;
  hash_table *v2;
  hash_table *result;
  uint64_t i;

  LODWORD(v1) = size;
  v2 = (hash_table *)malloc_type_malloc(0x10uLL, 0x10800407411B482uLL);
  result = 0;
  if ((v1 & 0x80000000) == 0 && v2)
  {
    if ((_DWORD)v1)
      v1 = v1;
    else
      v1 = 97;
    result = (hash_table *)malloc_type_malloc(8 * v1, 0x2004093837F09uLL);
    v2->buckets = (hash_node **)result;
    if (result)
    {
      for (i = 0; i != v1; ++i)
        v2->buckets[i] = 0;
      v2->size = v1;
      return v2;
    }
  }
  return result;
}

void hash_destroy(hash_table *table, char *key, void (__cdecl *nukefunc)(char *, void *))
{
  int v4;
  unsigned int v5;
  char *v6;
  int v7;
  hash_node **p_next;
  hash_node *v9;
  hash_node *v10;

  v4 = *key;
  if (*key)
  {
    v5 = 0;
    v6 = key + 1;
    do
    {
      v5 ^= v4 ^ (2 * v5);
      v7 = *v6++;
      v4 = v7;
    }
    while (v7);
  }
  else
  {
    v5 = 0;
  }
  p_next = &table->buckets[v5 % table->size];
  v9 = *p_next;
  if (*p_next)
  {
    if (_platform_strcmp())
    {
      while (1)
      {
        v10 = v9;
        v9 = v9->next;
        if (!v9)
          break;
        if (!_platform_strcmp())
        {
          p_next = &v10->next;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      *p_next = v9->next;
      if (nukefunc)
        ((void (*)(char *, void *))nukefunc)(v9->key, v9->data);
      free(v9);
    }
  }
}

void *__cdecl hash_search(hash_table *table, char *key, void *datum, void (__cdecl *replace_func)(void *))
{
  unsigned int size;
  int v9;
  unsigned int v10;
  char *v11;
  int v12;
  int v13;
  hash_node *v14;
  hash_node *data;
  uint64_t v16;
  char *v17;
  hash_node **buckets;

  size = table->size;
  v9 = *key;
  if (*key)
  {
    v10 = 0;
    v11 = key + 1;
    do
    {
      v10 ^= v9 ^ (2 * v10);
      v12 = *v11++;
      v9 = v12;
    }
    while (v12);
  }
  else
  {
    v10 = 0;
  }
  v13 = v10 % size;
  v14 = table->buckets[v10 % size];
  if (!v14)
  {
LABEL_9:
    if (datum)
    {
      data = (hash_node *)malloc_type_malloc(0x18uLL, 0xB0040E10B54BDuLL);
      if (!data)
        return data;
      v16 = _platform_strlen();
      v17 = (char *)malloc_type_malloc(v16 + 1, 0xE3A9D695uLL);
      data->key = v17;
      if (v17)
      {
        *v17 = 0;
        strcat(data->key, key);
        data->data = datum;
        buckets = table->buckets;
        data->next = buckets[v13];
        buckets[v13] = data;
        return data;
      }
    }
    return 0;
  }
  while (_platform_strcmp())
  {
    v14 = v14->next;
    if (!v14)
      goto LABEL_9;
  }
  data = (hash_node *)v14->data;
  if (replace_func)
  {
    ((void (*)(void *))replace_func)(v14->data);
    data = 0;
    v14->data = datum;
  }
  return data;
}

void hash_traverse(hash_table *table, int (__cdecl *func)(char *, void *, void *), void *arg)
{
  uint64_t size;
  uint64_t v7;
  hash_node *v8;

  if (func)
  {
    size = table->size;
    if ((int)size >= 1)
    {
      v7 = 0;
      while (1)
      {
        v8 = table->buckets[v7];
        if (v8)
          break;
LABEL_7:
        if (++v7 == size)
          return;
      }
      while (((unsigned int (*)(char *, void *, void *))func)(v8->key, v8->data, arg))
      {
        v8 = v8->next;
        if (!v8)
          goto LABEL_7;
      }
    }
  }
}

void hash_purge(hash_table *table, void (__cdecl *purge_func)(char *, void *))
{
  uint64_t size;
  uint64_t i;
  hash_node *v6;
  _node *next;

  size = table->size;
  if ((int)size >= 1)
  {
    for (i = 0; i != size; ++i)
    {
      v6 = table->buckets[i];
      if (v6)
      {
        do
        {
          if (purge_func)
            ((void (*)(char *, void *))purge_func)(v6->key, v6->data);
          next = v6->next;
          free(v6);
          v6 = next;
        }
        while (next);
        table->buckets[i] = 0;
      }
    }
  }
}

uint64_t hash_stats(int *a1, int a2)
{
  uint64_t v3;
  _DWORD *v4;
  _DWORD *v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  char v13;
  int v14;
  const char *v15;
  uint64_t result;
  uint64_t v18;
  int v19;
  int v20;

  v3 = *a1;
  v4 = malloc_type_malloc(4 * v3, 0x100004052888210uLL);
  if (!v4)
  {
    fwrite("malloc returns 0\n", 0x11uLL, 1uLL, __stderrp);
    exit(1);
  }
  v18 = v3;
  if ((int)v3 <= 0)
  {
    putchar(10);
    return printf("%d element%s in storage.\n");
  }
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  do
  {
    v19 = v7;
    v20 = v8;
    v11 = *(_QWORD *)(*((_QWORD *)a1 + 1) + 8 * v6);
    v5[v6] = 0;
    v12 = 0;
    if (v11)
    {
      v13 = 1;
      do
      {
        if ((v13 & 1) != 0)
        {
          ++v9;
          if (a2)
          {
            printf("bucket %2d: ", v6);
LABEL_10:
            printf(" %s", *(const char **)v11);
            v12 = v5[v6];
          }
        }
        else if (a2)
        {
          goto LABEL_10;
        }
        v13 = 0;
        v5[v6] = ++v12;
        v11 = *(_QWORD *)(v11 + 16);
      }
      while (v11);
    }
    if (v12 == v8)
      v14 = v19 + 1;
    else
      v14 = v19;
    if (v12 > v8)
      v8 = v12;
    if (v12 > v20)
      v7 = 1;
    else
      v7 = v14;
    if (a2 && v12)
      printf(" (%d)\n", v12);
    v10 += v12;
    ++v6;
  }
  while (v6 != v18);
  putchar(10);
  v15 = "s";
  if (v10 == 1)
    v15 = "";
  result = printf("%d element%s in storage.\n", v10, v15);
  if (v10)
  {
    printf("%d of %d (%.2f%%) buckets are in use\n", v9, v18, (double)v9 * 100.0 / (double)(int)v18);
    printf("the maximum number of elements in a bucket is %d (%d times)\n", v8, v7);
    printf("average per bucket is %f\n", (double)v10 / (double)v9);
    return printf("optimal would be %f\n");
  }
  return result;
}

intmax_t strtoimax(const char *__nptr, char **__endptr, int __base)
{
  uint64_t v3;
  _xlocale *v4;
  _xlocale *v5;

  v3 = __locale_key;
  v4 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v3);
  if (v4)
    v5 = v4;
  else
    v5 = (_xlocale *)&__global_locale;
  return strtoimax_l(__nptr, __endptr, __base, v5);
}

uintmax_t strtoumax(const char *__nptr, char **__endptr, int __base)
{
  uint64_t v3;
  _xlocale *v4;
  _xlocale *v5;

  v3 = __locale_key;
  v4 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v3);
  if (v4)
    v5 = v4;
  else
    v5 = (_xlocale *)&__global_locale;
  return strtoumax_l(__nptr, __endptr, __base, v5);
}

char *system_NOCANCEL(char *result)
{
  int v1;
  __int16 v2;
  sigset_t v3;
  char ***v4;
  int v5;
  pid_t v6;
  pid_t v7;
  posix_spawnattr_t v8;
  sigset_t v9;
  sigset_t v10[2];
  sigaction v11;
  sigaction v12;
  sigaction v13;
  pid_t v14[2];
  char *__argv[4];

  __argv[0] = "sh";
  __argv[1] = "-c";
  __argv[2] = result;
  __argv[3] = 0;
  if (!*MEMORY[0x1E0C88C20])
    *MEMORY[0x1E0C88C20] = 1;
  if (result)
  {
    *(_QWORD *)v14 = 0;
    v13.__sigaction_u.__sa_handler = 0;
    *(_QWORD *)&v13.sa_mask = 0;
    v12.__sigaction_u.__sa_handler = 0;
    *(_QWORD *)&v12.sa_mask = 0;
    v11.__sigaction_u.__sa_handler = 0;
    *(_QWORD *)&v11.sa_mask = 0;
    *(_QWORD *)v10 = 0;
    v8 = 0;
    v1 = posix_spawnattr_init(&v8);
    if (v1)
    {
      *__error() = v1;
      return (char *)0xFFFFFFFFLL;
    }
    v9 = 0;
    pthread_mutex_lock(&__systemfn_mutex);
    v13.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
    *(_QWORD *)&v13.sa_mask = 0;
    sigaction(2, &v13, &v12);
    if (v12.__sigaction_u.__sa_handler == (void (__cdecl *)(int))1)
    {
      v2 = 8;
      v3 = 4;
    }
    else
    {
      v9 = 2;
      v2 = 12;
      v3 = 6;
    }
    sigaction(3, &v13, &v11);
    if (v11.__sigaction_u.__sa_handler != (void (__cdecl *)(int))1)
    {
      v9 = v3;
      v2 = 12;
    }
    v10[1] = 0x80000;
    sigprocmask(1, &v10[1], v10);
    posix_spawnattr_setsigmask(&v8, v10);
    if ((v2 & 4) != 0)
      posix_spawnattr_setsigdefault(&v8, &v9);
    posix_spawnattr_setflags(&v8, v2);
    v4 = _NSGetEnviron();
    v5 = posix_spawn(&v14[1], "/bin/sh", 0, &v8, __argv, *v4);
    posix_spawnattr_destroy(&v8);
    if (v5 == 35 || v5 == 12)
    {
      v7 = -1;
    }
    else
    {
      if (!v5)
      {
        v6 = v14[1];
        while (1)
        {
          v14[1] = wait4(v6, v14, 0, 0);
          if (v14[1] != -1)
            goto LABEL_24;
          if (*__error() != 4)
          {
            v7 = v14[1];
            if (v14[1] != -1)
              goto LABEL_24;
            goto LABEL_23;
          }
        }
      }
      v7 = 32512;
    }
LABEL_23:
    v14[0] = v7;
LABEL_24:
    sigaction(2, &v12, 0);
    sigaction(3, &v11, 0);
    sigprocmask(3, v10, 0);
    pthread_mutex_unlock(&__systemfn_mutex);
    return (char *)v14[0];
  }
  return result;
}

void *__cdecl tdelete(const void *a1, void **a2, int (__cdecl *a3)(const void *, const void *))
{
  void **v3;
  _QWORD *v4;
  int i;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;

  if (!a2)
    return 0;
  v3 = a2;
  v4 = *a2;
  if (*a2)
  {
    for (i = ((uint64_t (*)(const void *, _QWORD))a3)(a1, *v4);
          i;
          i = ((uint64_t (*)(const void *, _QWORD))a3)(a1, *v9))
    {
      v4 = *v3;
      v8 = i >= 0 ? 16 : 8;
      v3 = (void **)(i >= 0 ? (char *)*v3 + 16 : (char *)*v3 + 8);
      v9 = *(_QWORD **)((char *)v4 + v8);
      if (!v9)
        return 0;
    }
    v10 = *((_QWORD *)*v3 + 1);
    v11 = (_QWORD *)*((_QWORD *)*v3 + 2);
    if (v10)
    {
      if (v11)
      {
        v12 = (_QWORD *)v11[1];
        if (v12)
        {
          do
          {
            v13 = v11;
            v11 = v12;
            v12 = (_QWORD *)v12[1];
          }
          while (v12);
          v13[1] = v11[2];
          v11[1] = *((_QWORD *)*v3 + 1);
          v11[2] = *((_QWORD *)*v3 + 2);
        }
        else
        {
          v11[1] = v10;
        }
      }
      else
      {
        v11 = (_QWORD *)*((_QWORD *)*v3 + 1);
      }
    }
    free(*v3);
    *v3 = v11;
  }
  return v4;
}

void *__cdecl tfind(const void *a1, void *const *a2, int (__cdecl *a3)(const void *, const void *))
{
  void *const *v3;
  _QWORD *v4;
  int v7;
  char *v8;
  uint64_t v9;

  if (!a2)
    return 0;
  v3 = a2;
  v4 = *a2;
  if (!*a2)
    return 0;
  while (1)
  {
    v7 = ((uint64_t (*)(const void *, _QWORD))a3)(a1, *v4);
    if (!v7)
      break;
    v8 = (char *)*v3;
    if (v7 >= 0)
      v9 = 16;
    else
      v9 = 8;
    if (v7 >= 0)
      v3 = (void *const *)((char *)*v3 + 16);
    else
      v3 = (void *const *)((char *)*v3 + 8);
    v4 = *(_QWORD **)&v8[v9];
    if (!v4)
      return 0;
  }
  return *v3;
}

void *__cdecl tsearch(const void *a1, void **a2, int (__cdecl *a3)(const void *, const void *))
{
  void **v3;
  _QWORD *v5;
  int v7;
  char *v8;
  uint64_t v9;
  void *result;

  if (!a2)
    return 0;
  v3 = a2;
  v5 = *a2;
  if (*a2)
  {
    while (1)
    {
      v7 = ((uint64_t (*)(const void *, _QWORD))a3)(a1, *v5);
      if (!v7)
        return *v3;
      v8 = (char *)*v3;
      if (v7 >= 0)
        v9 = 16;
      else
        v9 = 8;
      if (v7 >= 0)
        v3 = (void **)((char *)*v3 + 16);
      else
        v3 = (void **)((char *)*v3 + 8);
      v5 = *(_QWORD **)&v8[v9];
      if (!v5)
        goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    result = malloc_type_malloc(0x18uLL, 0x30040D3A788E3uLL);
    if (result)
    {
      *v3 = result;
      *((_QWORD *)result + 1) = 0;
      *((_QWORD *)result + 2) = 0;
      *(_QWORD *)result = a1;
    }
  }
  return result;
}

void twalk(const void *a1, void (__cdecl *a2)(const void *, VISIT, int))
{
  if (a1)
  {
    if (a2)
      trecurse((uint64_t)a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t))a2, 0);
  }
}

uint64_t trecurse(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t), uint64_t a3)
{
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  if (*(_QWORD *)(a1 + 8) || *(_QWORD *)(a1 + 16))
  {
    a2(a1, 0, a3);
    v6 = *(_QWORD *)(a1 + 8);
    if (v6)
      trecurse(v6, a2, (a3 + 1));
    a2(a1, 1, a3);
    v7 = *(_QWORD *)(a1 + 16);
    if (v7)
      trecurse(v7, a2, (a3 + 1));
    v8 = 2;
    v4 = a2;
  }
  else
  {
    v8 = 3;
  }
  return v4(a1, v8, a3);
}

int posix_openpt(int a1)
{
  int result;

  result = open_NOCANCEL();
  if (result < 0)
    return -1;
  return result;
}

int grantpt(int a1)
{
  return ioctl(a1, 0x20007454uLL);
}

char *__cdecl ptsname(int a1)
{
  char *v2;
  char *v3;

  if (ptsname_once != -1)
    _os_once();
  v2 = (char *)pthread_getspecific(ptsname_buffer_specific_key);
  if (!v2)
  {
    v3 = (char *)malloc_type_malloc(0x80uLL, 0x9A601A37uLL);
    if (!v3)
      ptsname_cold_1();
    v2 = v3;
    if (pthread_setspecific(ptsname_buffer_specific_key, v3))
      ptsname_cold_2();
  }
  if (ptsname_r(a1, v2, 0x80uLL))
    return 0;
  else
    return v2;
}

uint64_t ptsname_once_init()
{
  uint64_t result;

  result = pthread_key_create((pthread_key_t *)&ptsname_buffer_specific_key, (void (__cdecl *)(void *))MEMORY[0x1E0C88920]);
  if ((_DWORD)result)
    ptsname_cold_2();
  return result;
}

int ptsname_r(int fildes, char *buffer, size_t buflen)
{
  int *v4;
  int v5;
  stat v7;
  char v8[128];

  memset(&v7, 0, sizeof(v7));
  if (buffer)
  {
    if (ioctl(fildes, 0x40807453uLL, v8) || stat(v8, &v7))
      return -1;
    if (_platform_strlen() + 1 <= buflen)
    {
      _platform_memmove();
      return 0;
    }
    v4 = __error();
    v5 = 34;
  }
  else
  {
    v4 = __error();
    v5 = 22;
  }
  *v4 = v5;
  return -1;
}

int unlockpt(int a1)
{
  return ioctl(a1, 0x20007452uLL);
}

char *__cdecl ecvt(double a1, int a2, int *a3, int *a4)
{
  return __cvt(a2, a3, a4, 0, a1);
}

char *__cvt(int a1, int *a2, _DWORD *a3, int a4, double a5)
{
  int v10;
  size_t v11;
  char *result;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  int v17;
  int v18;
  char *v19;

  if (!a1)
  {
    *a3 = a5 < 0.0;
    *a2 = 0;
    return "";
  }
  if (__cvt_s)
  {
    free((void *)__cvt_s);
    __cvt_s = 0;
  }
  v19 = 0;
  if (a1 >= 0)
    v10 = a1;
  else
    v10 = -a1;
  v11 = (v10 + 1);
  if (a5 == 0.0)
  {
    *a2 = 1 - a4;
    *a3 = 0;
    result = (char *)malloc_type_malloc(v11, 0xDC031092uLL);
    __cvt_s = (uint64_t)result;
    if (!result)
      return result;
    v13 = result + 1;
    v19 = result + 1;
    *(_WORD *)result = 48;
  }
  else
  {
    result = __dtoa(a4 + 2, a1, a2, a3, &v19, a5);
    if (!result)
      return result;
    v16 = (uint64_t)result;
    v17 = *a2;
    if (*a2 == 9999)
    {
      *a2 = 0;
      v18 = *result;
      __freedtoa((uint64_t)result);
      if (v18 == 73)
        return "inf";
      else
        return "nan";
    }
    if (!a4)
      v17 = 0;
    v11 += v17;
    __cvt_s = (uint64_t)malloc_type_malloc(v11, 0x97679A8FuLL);
    if (!__cvt_s)
    {
      __freedtoa(v16);
      return 0;
    }
    _platform_strlcpy();
    v19 = &v19[__cvt_s - v16];
    __freedtoa(v16);
    v13 = v19;
    result = (char *)__cvt_s;
  }
  v14 = (uint64_t)&result[v11 - (_QWORD)v13 - 1];
  if (&result[v11 - (_QWORD)v13] != (char *)1)
  {
    do
    {
      v15 = v19++;
      *v15 = 48;
      --v14;
    }
    while (v14);
    v13 = v19;
  }
  *v13 = 0;
  return (char *)__cvt_s;
}

char *__cdecl fcvt(double a1, int a2, int *a3, int *a4)
{
  return __cvt(a2, a3, a4, 1, a1);
}

char *__cdecl gcvt(double a1, int a2, char *a3)
{
  lconv *v6;
  const char **p_decimal_point;
  char *v8;
  char *v9;
  int v10;
  const char *v11;
  const char *v12;
  char *v13;
  char *v14;
  int v15;
  BOOL v16;
  int v17;
  BOOL v18;
  int v19;
  _BOOL4 v20;
  char *v21;
  char v22;
  unsigned __int8 *v23;
  int v24;
  char v25;
  int v26;
  _BYTE *v27;
  unsigned int v28;
  int v29;
  int v30;
  char v31;
  char *v32;
  int v33;
  unint64_t v35;

  v6 = localeconv();
  if (a2)
  {
    p_decimal_point = (const char **)&v6->decimal_point;
    v35 = 0;
    v8 = __dtoa(2u, a2, (_DWORD *)&v35 + 1, &v35, 0, a1);
    if (v8)
    {
      v9 = v8;
      v10 = HIDWORD(v35);
      if (HIDWORD(v35) == 9999)
      {
        v11 = "-";
        if (!(_DWORD)v35)
          v11 = "";
        if (*v8 == 73)
          v12 = "inf";
        else
          v12 = "nan";
        snprintf(a3, a2 + 1, "%s%s", v11, v12);
      }
      else
      {
        v13 = a3;
        if ((_DWORD)v35)
        {
          *a3 = 45;
          v13 = a3 + 1;
        }
        if (v10 < 0 || v10 > a2)
        {
          v17 = 1 - v10;
          v18 = __OFSUB__(v10, 1);
          v19 = v10 - 1;
          v20 = v19 < 0 != v18;
          if (v19 < 0 != v18)
            v19 = v17;
          v35 = __PAIR64__(v19, v20);
          *v13 = *v9;
          v21 = stpcpy(v13 + 1, *p_decimal_point);
          v22 = v9[1];
          if (v22)
          {
            v23 = (unsigned __int8 *)(v9 + 2);
            do
            {
              *v21++ = v22;
              v24 = *v23++;
              v22 = v24;
            }
            while (v24);
          }
          *v21 = 101;
          if ((_DWORD)v35)
            v25 = 45;
          else
            v25 = 43;
          v21[1] = v25;
          v26 = HIDWORD(v35);
          if (SHIDWORD(v35) >= 10)
          {
            v27 = v21 + 1;
            do
            {
              v28 = v26 + 9;
              v26 /= 10;
              ++v27;
            }
            while (v28 > 0x12);
            LODWORD(v35) = v26;
            v27[1] = 0;
            v29 = HIDWORD(v35);
            if (HIDWORD(v35))
            {
              do
              {
                *v27-- = v29 - 10 * (((unint64_t)(1717986919 * v29) >> 34) + (1717986919 * v29 < 0)) + 48;
                v30 = HIDWORD(v35);
                v29 = SHIDWORD(v35) / 10;
                SHIDWORD(v35) /= 10;
              }
              while ((v30 + 9) >= 0x13);
            }
            goto LABEL_50;
          }
          v21[2] = 48;
          v13 = v21 + 4;
          v21[3] = BYTE4(v35) + 48;
        }
        else
        {
          if (v10)
          {
            v14 = v9;
            do
            {
              v15 = *v14;
              v16 = v15 == 0;
              if (!*v14)
                LOBYTE(v15) = 48;
              if (!v16)
                ++v14;
              *v13++ = v15;
              --v10;
            }
            while (v10);
          }
          else
          {
            v14 = v9;
          }
          if (*v14)
          {
            if (v14 == v9)
              *v13++ = 48;
            v13 = stpcpy(v13, *p_decimal_point);
            v31 = v9[SHIDWORD(v35)];
            if (v31)
            {
              v32 = &v9[SHIDWORD(v35) + 1];
              do
              {
                *v13++ = v31;
                v33 = *v32++;
                v31 = v33;
              }
              while (v33);
            }
          }
        }
        *v13 = 0;
      }
LABEL_50:
      __freedtoa((uint64_t)v9);
      return a3;
    }
    return 0;
  }
  else
  {
    *a3 = 0;
  }
  return a3;
}

int heapsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  size_t v7;
  _BYTE *v9;
  _BYTE *v10;
  char *v11;
  size_t v12;
  unint64_t v13;
  size_t v14;
  char *v15;
  int v16;
  unint64_t v17;
  char *v18;
  size_t v19;
  char v20;
  char *i;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  int v29;
  unint64_t v30;
  char *v31;
  size_t v32;
  char v33;
  char *v34;
  int v35;
  size_t v36;
  char *v37;
  char v38;
  uint64_t v39;
  char *v40;
  size_t v41;
  uint64_t (**v42)(void *, size_t, size_t);

  if (__nel < 2)
    return 0;
  if (!__width)
  {
    *__error() = 22;
    return -1;
  }
  v7 = __nel;
  v9 = malloc_type_malloc(__width, 0x62098E6BuLL);
  if (!v9)
    return -1;
  v10 = v9;
  v40 = (char *)__base;
  v11 = (char *)__base - __width;
  v12 = v7 >> 1;
  do
  {
    v41 = v12;
    v13 = 2 * v12;
    if (2 * v12 <= v7)
    {
      v14 = v12;
      do
      {
        v15 = &v11[v13 * __width];
        if (v13 >= v7)
        {
          v17 = v13;
        }
        else
        {
          v16 = (*((uint64_t (**)(void *, char *, char *))__compar + 2))(__compar, &v11[v13 * __width], &v15[__width]);
          v17 = v13 | (v16 >> 31);
          if (v16 < 0)
            v15 += __width;
        }
        v18 = &v11[v14 * __width];
        if ((*((int (**)(void *, char *, char *))__compar + 2))(__compar, v15, v18) < 1)
          break;
        v19 = __width;
        do
        {
          v20 = *v18;
          *v18++ = *v15;
          *v15++ = v20;
          --v19;
        }
        while (v19);
        v13 = 2 * v17;
        v14 = v17;
      }
      while (2 * v17 <= v7);
    }
    v12 = v41 - 1;
  }
  while (v41 != 1);
  i = v40;
  v22 = &v40[__width * (v7 - 1)];
  v42 = (uint64_t (**)(void *, size_t, size_t))__compar;
  do
  {
    v23 = 0;
    do
    {
      v10[v23] = v22[v23];
      ++v23;
    }
    while (__width != v23);
    v24 = 0;
    do
    {
      v22[v24] = i[v24];
      ++v24;
    }
    while (__width != v24);
    --v7;
    v25 = i;
    if (v7 >= 2)
    {
      v26 = 2;
      v27 = 1;
      do
      {
        v28 = &v11[v26 * __width];
        if (v26 >= v7)
        {
          v30 = v26;
        }
        else
        {
          v29 = v42[2](v42, (size_t)&v11[v26 * __width], (size_t)&v28[__width]);
          v30 = v26 | (v29 >> 31);
          if (v29 < 0)
            v28 += __width;
        }
        v31 = &v11[v27 * __width];
        v32 = __width;
        do
        {
          v33 = *v28++;
          *v31++ = v33;
          --v32;
        }
        while (v32);
        v26 = 2 * v30;
        v27 = v30;
      }
      while (2 * v30 <= v7);
      v25 = &v11[v30 * __width];
      v34 = v25;
      for (i = v40; v30 != 1; v25 = &v11[v30 * __width])
      {
        v25 = v34;
        v30 >>= 1;
        v34 = &v11[v30 * __width];
        v35 = v42[2](v42, (size_t)v10, (size_t)v34);
        v36 = __width;
        v37 = v34;
        if (v35 < 0)
          break;
        do
        {
          v38 = *v37++;
          *v25++ = v38;
          --v36;
        }
        while (v36);
      }
    }
    v39 = 0;
    do
    {
      v25[v39] = v10[v39];
      ++v39;
    }
    while (__width != v39);
    v22 -= __width;
  }
  while (v7 > 1);
  free(v10);
  return 0;
}

char *__ldtoa(double *a1, unsigned int a2, int a3, _DWORD *a4, _DWORD *a5, char **a6)
{
  char *result;

  result = __dtoa(a2, a3, a4, a5, a6, *a1);
  if (*a4 == 9999)
    *a4 = 0x7FFFFFFF;
  return result;
}

char *_Read_RuneMagi(FILE *a1)
{
  int v2;
  size_t st_size;
  int *v4;
  char *v5;
  int v6;
  int v7;
  _DWORD *v8;
  char *v9;
  unint64_t v10;
  int *v11;
  int *v12;
  int v13;
  signed int v14;
  signed int v15;
  uint64_t v16;
  signed int v17;
  signed int v18;
  int8x8_t *v19;
  int8x8_t *v20;
  int8x8_t *v21;
  int v22;
  unsigned int *v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  int v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  int v34;
  int v35;
  _DWORD *v36;
  uint64_t v37;
  int v38;
  int v39;
  unint64_t v40;
  uint64_t v41;
  int v42;
  int v44;
  char *v45;
  char *v46;
  char *v47;
  __int128 v48;
  uint64_t v49;
  char *v50;
  int v51;
  int v52;
  char *v53;
  int v54;
  char *v55;
  char *v56;
  char *v57;
  unint64_t v58;
  uint64_t j;
  uint64_t v60;
  char *v61;
  int32x2_t v62;
  unsigned __int32 v63;
  unint64_t v64;
  char *v65;
  int v66;
  char *v67;
  int *v68;
  int v69;
  uint64_t v70;
  int *v71;
  int *v72;
  int v73;
  int v74;
  int v75;
  char *v76;
  char *v77;
  uint64_t v78;
  char *v79;
  __int128 v80;
  char *v81;
  int v82;
  int v83;
  char *v84;
  int v85;
  char *v86;
  char *v87;
  char *v88;
  int8x8_t *v89;
  uint64_t i;
  uint64_t v91;
  char *v92;
  int32x2_t v93;
  unsigned __int32 v94;
  int8x8_t *v95;
  int v96;
  char *v97;
  unsigned int *v98;
  unsigned int v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  char *v106;
  int v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  int8x8_t *v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  uint64_t v116;
  char *v117;
  int8x8_t *v118;
  int v119;
  unint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  stat v124;

  memset(&v124, 0, sizeof(v124));
  v2 = fileno(a1);
  if (fstat(v2, &v124) < 0)
    return 0;
  st_size = v124.st_size;
  if (v124.st_size <= 0xC3BuLL)
  {
LABEL_3:
    v4 = __error();
    v5 = 0;
    v6 = 79;
LABEL_10:
    *v4 = v6;
    return v5;
  }
  v7 = fileno(a1);
  v8 = mmap(0, st_size, 3, 2, v7, 0);
  if (v8 == (_DWORD *)-1)
  {
    v4 = __error();
    v5 = 0;
    v6 = 22;
    goto LABEL_10;
  }
  v9 = (char *)v8;
  v10 = (unint64_t)v8 + v124.st_size;
  if (*(_QWORD *)v8 == 0x4167614D656E7552)
  {
    if (v124.st_size <= 0xC5BuLL)
      goto LABEL_3;
    v8[12] = bswap32(v8[12]);
    v14 = bswap32(v8[788]);
    v8[788] = v14;
    v15 = bswap32(v8[789]);
    v8[789] = v15;
    v16 = bswap32(v8[781]);
    v8[781] = v16;
    v17 = bswap32(v8[783]);
    v8[783] = v17;
    v18 = bswap32(v8[785]);
    v8[785] = v18;
    v19 = (int8x8_t *)&v8[4 * (int)v16 + 791];
    if ((unint64_t)v19 > v10)
      goto LABEL_56;
    v20 = &v19[2 * v17];
    if ((unint64_t)v20 > v10)
      goto LABEL_56;
    v21 = &v20[2 * v18];
    if ((unint64_t)v21 > v10)
      goto LABEL_56;
    if ((int)v16 < 1)
    {
      v22 = 0;
    }
    else
    {
      v22 = 0;
      v23 = v8 + 793;
      v24 = v16;
      do
      {
        v25 = bswap32(*(v23 - 2));
        v26 = bswap32(*(v23 - 1));
        *(v23 - 2) = v25;
        *(v23 - 1) = v26;
        v27 = *v23;
        *v23 = bswap32(*v23);
        if (!v27)
        {
          v28 = v26 - v25 + 1;
          v21 = (int8x8_t *)((char *)v21 + 4 * v28);
          if ((unint64_t)v21 > v10)
            goto LABEL_56;
          v22 += v28;
        }
        v23 += 4;
        --v24;
      }
      while (v24);
    }
    if ((unint64_t)v21 + 20 * v15 + v14 > v10)
    {
LABEL_56:
      v71 = __error();
      v5 = 0;
      v72 = 0;
LABEL_57:
      *v71 = 22;
LABEL_58:
      v73 = *__error();
      free(v72);
      free(v5);
      v5 = 0;
      *__error() = v73;
LABEL_59:
      v74 = *__error();
      munmap(v9, v124.st_size);
      if (!v5)
        *__error() = v74;
      return v5;
    }
    v75 = v14 + 20 * v15 + 24 * (v17 + v16 + v18) + 4 * v22 + 128;
    v76 = (char *)malloc_type_calloc(1uLL, v14 + 20 * v15 + 24 * (v17 + (int)v16 + v18) + 4 * v22 + 128, 0x3D73B203uLL);
    v5 = v76;
    if (!v76)
    {
      v72 = 0;
      goto LABEL_58;
    }
    *(_DWORD *)v76 = 1;
    *((_QWORD *)v76 + 1) = destruct_ctype;
    v77 = (char *)malloc_type_calloc(1uLL, 0xC88uLL, 0x10A0040C89F755AuLL);
    v72 = (int *)v77;
    *((_QWORD *)v5 + 15) = v77;
    if (!v77)
    {
      free(v5);
      goto LABEL_58;
    }
    v78 = 0;
    v79 = v5 + 128;
    *((_QWORD *)v77 + 398) = v5 + 128;
    *(_QWORD *)v77 = 0x4167614D656E7552;
    v80 = *(_OWORD *)(v9 + 8);
    *(_OWORD *)(v77 + 24) = *(_OWORD *)(v9 + 24);
    *(_OWORD *)(v77 + 8) = v80;
    *((_DWORD *)v77 + 14) = *((_DWORD *)v9 + 12);
    *((_DWORD *)v77 + 784) = *((_DWORD *)v9 + 781);
    *((_DWORD *)v77 + 788) = *((_DWORD *)v9 + 783);
    *((_DWORD *)v77 + 792) = *((_DWORD *)v9 + 785);
    *((_QWORD *)v77 + 399) = *((_QWORD *)v9 + 394);
    do
    {
      v81 = &v77[v78];
      *((_DWORD *)v81 + 15) = bswap32(*(_DWORD *)&v9[v78 + 52]);
      *((_DWORD *)v81 + 271) = bswap32(*(_DWORD *)&v9[v78 + 1076]);
      *((_DWORD *)v81 + 527) = bswap32(*(_DWORD *)&v9[v78 + 2100]);
      v78 += 4;
    }
    while (v78 != 1024);
    *((_QWORD *)v77 + 393) = v79;
    v82 = *((_DWORD *)v77 + 784);
    v83 = v82;
    v84 = &v79[24 * v82];
    *((_QWORD *)v77 + 395) = v84;
    v85 = *((_DWORD *)v77 + 788);
    v86 = &v84[24 * v85];
    *((_QWORD *)v77 + 397) = v86;
    v87 = &v86[24 * *((int *)v77 + 792)];
    *((_QWORD *)v77 + 400) = v87;
    v88 = &v87[20 * *((int *)v77 + 799)];
    *((_QWORD *)v72 + 398) = v88;
    v89 = &v20[2 * *((int *)v9 + 785)];
    if (v82 < 1)
    {
      LODWORD(v100) = v85;
    }
    else
    {
      for (i = 0; i < v82; ++i)
      {
        v91 = (uint64_t)&v9[16 * i + 3164];
        v92 = &v79[24 * i];
        v93 = *(int32x2_t *)v91;
        *(_QWORD *)v92 = *(_QWORD *)v91;
        LODWORD(v91) = *(_DWORD *)(v91 + 8);
        *((_DWORD *)v92 + 2) = v91;
        if ((_DWORD)v91)
        {
          *(_QWORD *)&v79[24 * i + 16] = 0;
        }
        else
        {
          v94 = vsub_s32(vdup_lane_s32(v93, 1), v93).u32[0];
          v95 = (int8x8_t *)((char *)v89 + 4 * (int)(v94 + 1));
          *(_QWORD *)&v79[24 * i + 16] = v88;
          *((_QWORD *)v72 + 398) = &v88[4 * (v94 + 1)];
          if ((v94 & 0x80000000) == 0)
          {
            v96 = v94 + 2;
            v97 = &v88[4 * v94];
            v98 = (unsigned int *)v89 + v94;
            do
            {
              v99 = *v98--;
              *(_DWORD *)v97 = bswap32(v99);
              v97 -= 4;
              --v96;
            }
            while (v96 > 1);
            v82 = v72[784];
          }
          v88 += 4 * (int)(v94 + 1);
          v89 = v95;
        }
      }
      LODWORD(v100) = v72[788];
    }
    if ((int)v100 >= 1)
    {
      v100 = v100;
      v112 = (int8x8_t *)&v5[24 * v83 + 136];
      do
      {
        v112[-1] = vrev32_s8(*v19);
        v112->i32[0] = bswap32(v19[1].u32[0]);
        v112 += 3;
        v19 += 2;
        --v100;
      }
      while (v100);
    }
    v113 = *((unsigned int *)v9 + 785);
    if ((int)v113 >= 1)
    {
      v114 = 0;
      v115 = v85;
      v116 = 24 * v113;
      v117 = &v5[24 * v115 + 24 * v83];
      do
      {
        v118 = (int8x8_t *)&v117[v114];
        v118[16] = vrev32_s8(*v20);
        v118[17].i32[0] = bswap32(v20[1].u32[0]);
        v114 += 24;
        v20 += 2;
      }
      while (v116 != v114);
    }
    v119 = *((_DWORD *)v9 + 789);
    if (v119 >= 1)
    {
      if ((unint64_t)v89 + 20 * v119 > v10)
      {
        v71 = __error();
        goto LABEL_57;
      }
      v120 = 0;
      v121 = 0;
      *((_QWORD *)v72 + 400) = v88;
      *((_QWORD *)v72 + 398) = &v88[20 * v72[799]];
      do
      {
        v122 = &v88[v120];
        v123 = *(uint64_t *)((char *)v89 + v120);
        *(int8x8_t *)(v122 + 6) = *(int8x8_t *)((char *)v89 + v120 + 6);
        *(_QWORD *)v122 = v123;
        v88 = (char *)*((_QWORD *)v72 + 400);
        *(_DWORD *)&v88[v120 + 16] = bswap32(v89[2].u32[v120 / 4]);
        ++v121;
        v120 += 20;
      }
      while (v121 < *((int *)v9 + 789));
    }
    _platform_memmove();
    if (!v72[798])
      *((_QWORD *)v72 + 398) = 0;
    if (!v72[784])
      *((_QWORD *)v72 + 393) = 0;
    if (!v72[788])
      *((_QWORD *)v72 + 395) = 0;
    if (!v72[792])
      *((_QWORD *)v72 + 397) = 0;
    *((_DWORD *)v5 + 28) = v75;
    goto LABEL_59;
  }
  if (*(_QWORD *)v8 != 0x4267614D656E7552)
  {
    v11 = __error();
    v5 = 0;
    v12 = 0;
    v13 = 79;
LABEL_36:
    *v11 = v13;
LABEL_37:
    v42 = *__error();
    munmap(v9, v124.st_size);
    free(v12);
    free(v5);
    v5 = 0;
    *__error() = v42;
    return v5;
  }
  v29 = (unint64_t)&v8[3 * v8[778] + 783];
  if (v29 > v10)
    goto LABEL_34;
  v30 = (int)v8[779];
  v31 = v29 + 12 * (int)v30;
  if (v31 > v10)
    goto LABEL_34;
  v32 = (int)v8[780];
  v33 = v31 + 12 * (int)v32;
  if (v33 > v10)
    goto LABEL_34;
  v34 = v8[778];
  if (v34 < 1)
  {
    v35 = 0;
  }
  else
  {
    v35 = 0;
    v36 = v8 + 785;
    v37 = v8[778];
    do
    {
      if (!*v36)
      {
        v38 = *(v36 - 1) - *(v36 - 2) + 1;
        v33 += 4 * v38;
        if (v33 > v10)
          goto LABEL_34;
        v35 += v38;
      }
      v36 += 3;
      --v37;
    }
    while (v37);
  }
  v39 = v8[782];
  v40 = v33 + 20 * v39;
  v41 = (int)v8[781];
  if (v40 + v41 > v10)
  {
LABEL_34:
    v11 = __error();
    v5 = 0;
    v12 = 0;
LABEL_35:
    v13 = 22;
    goto LABEL_36;
  }
  v44 = 20 * v39 + 4 * v35 + v41 + 24 * (v30 + v34 + v32) + 128;
  v45 = (char *)malloc_type_calloc(1uLL, 20 * v39 + 4 * v35 + v41 + 24 * (v30 + v34 + v32) + 128, 0xEAC7157EuLL);
  v5 = v45;
  if (!v45)
  {
    v12 = 0;
    goto LABEL_37;
  }
  *(_DWORD *)v45 = 1;
  *((_QWORD *)v45 + 1) = destruct_ctype;
  v46 = (char *)malloc_type_calloc(1uLL, 0xC88uLL, 0x10A0040C89F755AuLL);
  v12 = (int *)v46;
  *((_QWORD *)v5 + 15) = v46;
  if (!v46)
  {
    free(v5);
    goto LABEL_37;
  }
  v47 = v5 + 128;
  *((_QWORD *)v46 + 398) = v5 + 128;
  *(_QWORD *)v46 = 0x4167614D656E7552;
  v48 = *(_OWORD *)(v9 + 8);
  *(_OWORD *)(v46 + 24) = *(_OWORD *)(v9 + 24);
  *(_OWORD *)(v46 + 8) = v48;
  *((_DWORD *)v46 + 14) = 0;
  *((_DWORD *)v46 + 784) = *((_DWORD *)v9 + 778);
  *((_DWORD *)v46 + 788) = *((_DWORD *)v9 + 779);
  *((_DWORD *)v46 + 792) = *((_DWORD *)v9 + 780);
  *((_QWORD *)v46 + 399) = *(_QWORD *)(v9 + 3124);
  v49 = -1024;
  do
  {
    v50 = &v46[v49];
    *((_DWORD *)v50 + 271) = *(_DWORD *)&v9[v49 + 1064];
    *((_DWORD *)v50 + 527) = *(_DWORD *)&v9[v49 + 2088];
    *((_DWORD *)v50 + 783) = *(_DWORD *)&v9[v49 + 3112];
    v49 += 4;
  }
  while (v49);
  *((_QWORD *)v46 + 393) = v47;
  v51 = *((_DWORD *)v46 + 784);
  v52 = v51;
  v53 = &v47[24 * v51];
  *((_QWORD *)v46 + 395) = v53;
  v54 = *((_DWORD *)v46 + 788);
  v55 = &v53[24 * v54];
  *((_QWORD *)v46 + 397) = v55;
  v56 = &v55[24 * *((int *)v46 + 792)];
  *((_QWORD *)v46 + 400) = v56;
  v57 = &v56[20 * *((int *)v46 + 799)];
  *((_QWORD *)v12 + 398) = v57;
  v58 = v31 + 12 * *((int *)v9 + 780);
  if (v51 < 1)
  {
    LODWORD(v70) = v54;
  }
  else
  {
    for (j = 0; j < v51; ++j)
    {
      v60 = (uint64_t)&v9[12 * j + 3132];
      v61 = &v47[24 * j];
      v62 = *(int32x2_t *)v60;
      *(_QWORD *)v61 = *(_QWORD *)v60;
      LODWORD(v60) = *(_DWORD *)(v60 + 8);
      *((_DWORD *)v61 + 2) = v60;
      if ((_DWORD)v60)
      {
        *(_QWORD *)&v47[24 * j + 16] = 0;
      }
      else
      {
        v63 = vsub_s32(vdup_lane_s32(v62, 1), v62).u32[0];
        v64 = v58 + 4 * (int)(v63 + 1);
        *(_QWORD *)&v47[24 * j + 16] = v57;
        v65 = &v57[4 * (v63 + 1)];
        *((_QWORD *)v12 + 398) = v65;
        if ((v63 & 0x80000000) == 0)
        {
          v66 = v63 + 2;
          v67 = &v57[4 * v63];
          v68 = (int *)(v58 + 4 * v63);
          do
          {
            v69 = *v68--;
            *(_DWORD *)v67 = v69;
            v67 -= 4;
            --v66;
          }
          while (v66 > 1);
          v51 = v12[784];
        }
        v57 = v65;
        v58 = v64;
      }
    }
    LODWORD(v70) = v12[788];
  }
  if ((int)v70 >= 1)
  {
    v70 = v70;
    v101 = &v5[24 * v52 + 136];
    do
    {
      *((_QWORD *)v101 - 1) = *(_QWORD *)v29;
      *(_DWORD *)v101 = *(_DWORD *)(v29 + 8);
      v101 += 24;
      v29 += 12;
      --v70;
    }
    while (v70);
  }
  v102 = *((unsigned int *)v9 + 780);
  if ((int)v102 >= 1)
  {
    v103 = 0;
    v104 = &v5[24 * v54 + 24 * v52];
    v105 = 24 * v102;
    do
    {
      v106 = &v104[v103];
      *((_QWORD *)v106 + 16) = *(_QWORD *)v31;
      *((_DWORD *)v106 + 34) = *(_DWORD *)(v31 + 8);
      v103 += 24;
      v31 += 12;
    }
    while (v105 != v103);
  }
  v107 = *((_DWORD *)v9 + 782);
  if (v107 >= 1)
  {
    if (v58 + 20 * v107 > v10)
    {
      v11 = __error();
      goto LABEL_35;
    }
    v108 = 0;
    v109 = 0;
    *((_QWORD *)v12 + 400) = v57;
    *((_QWORD *)v12 + 398) = &v57[20 * v12[799]];
    do
    {
      v110 = &v57[v108];
      v111 = *(_QWORD *)(v58 + v108);
      *(_QWORD *)(v110 + 6) = *(_QWORD *)(v58 + v108 + 6);
      *(_QWORD *)v110 = v111;
      v57 = (char *)*((_QWORD *)v12 + 400);
      *(_DWORD *)&v57[v108 + 16] = *(_DWORD *)(v58 + v108 + 16);
      ++v109;
      v108 += 20;
    }
    while (v109 < *((int *)v9 + 782));
  }
  _platform_memmove();
  munmap(v9, v124.st_size);
  if (!v12[798])
    *((_QWORD *)v12 + 398) = 0;
  if (!v12[784])
    *((_QWORD *)v12 + 393) = 0;
  if (!v12[788])
    *((_QWORD *)v12 + 395) = 0;
  if (!v12[792])
    *((_QWORD *)v12 + 397) = 0;
  *((_DWORD *)v5 + 28) = v44;
  return v5;
}

void destruct_ctype(_QWORD *a1)
{
  _RuneLocale *v2;

  v2 = (_RuneLocale *)a1[15];
  if (v2 != &_DefaultRuneLocale)
    free(v2);
  free(a1);
}

_QWORD *getargs(uint64_t a1)
{
  os_unfair_lock_s *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  unsigned int i;

  v2 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  v3 = *(_QWORD **)(a1 + 8);
  if (!v3)
  {
    v4 = mmap(0, 0x1000uLL, 3, 4098, -1, 0);
    if (!v4)
      return 0;
    v5 = 0;
    *v4 = *(_QWORD *)(a1 + 16);
    v3 = v4 - 3;
    *(_QWORD *)(a1 + 16) = v4;
    v6 = v4 + 1;
    for (i = 128; i > 1; --i)
    {
      v3[4] = v5;
      v3 += 4;
      v5 = v6;
      v6 += 4;
    }
    *(_QWORD *)(a1 + 8) = v3;
  }
  *(_QWORD *)(a1 + 8) = *v3;
  os_unfair_lock_unlock(v2);
  return v3;
}

void _psort_parallel(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)a1;
  _psort(*(char **)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(v2 + 32), *(int (__cdecl **)(const void *, const void *))(v2 + 24), *(_DWORD *)(a1 + 24), v2);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 64));
  *(_QWORD *)a1 = *(_QWORD *)(v2 + 8);
  *(_QWORD *)(v2 + 8) = a1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 64));
}

void _psort(char *a1, size_t a2, unint64_t a3, int (__cdecl *a4)(const void *, const void *), int a5, uint64_t a6)
{
  int64_t v7;
  int v10;
  uint64_t v11;
  int v12;
  int64_t v13;
  char *v14;
  char *v15;
  size_t v16;
  int v17;
  int v18;
  char *v19;
  char *v20;
  int v21;
  int v22;
  char *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  char *v29;
  char v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  int v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  int64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  char v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  unint64_t v71;
  int64_t v72;
  char *v73;
  uint64_t v74;
  char v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  _QWORD *v80;
  char *v81;
  unint64_t v82;
  unint64_t v83;
  _QWORD *v84;
  _QWORD *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  _QWORD *v96;
  _QWORD *v97;
  char *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  _BOOL4 v111;
  unint64_t v112;
  int64_t v113;
  int v114;
  unsigned int v115;
  char *v116;
  _QWORD *v117;
  char *v118;
  char *v119;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  int v124;

  v7 = a3;
  if (a5 < 1)
  {
LABEL_136:
    heapsort(a1, a2, v7, a4);
    return;
  }
  v10 = a5;
  v11 = -(uint64_t)a3;
  v111 = a3 != 8;
  v108 = (int)a3;
  v109 = (unint64_t)(int)a3 >> 3;
  v121 = (int)a3 + 1;
  while (1)
  {
    v123 = (a1 | v7) & 7;
    v12 = v111;
    if (((a1 | v7) & 7) != 0)
      v12 = 2;
    v124 = v12;
    v13 = a2 * v7;
    if (a2 <= 6)
    {
      if (v13 > v7)
      {
        v122 = &a1[v13];
        v95 = &a1[a3];
        v96 = a1;
        do
        {
          if (v95 > a1)
          {
            v97 = v96;
            v98 = v95;
            do
            {
              v99 = v98;
              v98 += v11;
              if (((int (*)(char *, char *))a4)(v98, v99) < 1)
                break;
              if (v124)
              {
                v100 = v123;
                if (v123)
                {
                  v101 = 0;
                  v102 = v108 + 1;
                  do
                  {
                    v103 = v99[v101];
                    v99[v101] = *((_BYTE *)v97 + v101);
                    *((_BYTE *)v97 + v101) = v103;
                    --v102;
                    ++v101;
                  }
                  while (v102 > 1);
                }
                else
                {
                  v105 = (uint64_t)v97 + a3;
                  v106 = v109 + 1;
                  do
                  {
                    v107 = *(_QWORD *)(v105 + v100);
                    *(_QWORD *)(v105 + v100) = *(_QWORD *)((char *)v97 + v100);
                    *(_QWORD *)((char *)v97 + v100) = v107;
                    v100 += 8;
                    --v106;
                  }
                  while (v106 > 1);
                }
              }
              else
              {
                v104 = *(_QWORD *)v99;
                *(_QWORD *)v99 = *(_QWORD *)v98;
                *(_QWORD *)v98 = v104;
              }
              v97 = (_QWORD *)((char *)v97 + v11);
            }
            while (v98 > a1);
          }
          v95 += a3;
          v96 = (_QWORD *)((char *)v96 + a3);
        }
        while (v95 < v122);
      }
      return;
    }
    v14 = &a1[(a2 >> 1) * v7];
    v114 = v10;
    v113 = a2 * v7;
    if (a2 != 7)
    {
      v15 = &a1[(a2 - 1) * v7];
      if (a2 < 0x29)
      {
        v20 = a1;
LABEL_38:
        v26 = ((uint64_t (*)(char *, char *))a4)(v20, v14);
        v27 = ((uint64_t (*)(char *, char *))a4)(v14, v15);
        if (v26 < 0)
        {
          v7 = a3;
          if ((v27 & 0x80000000) == 0)
          {
            if (((int (*)(char *, char *))a4)(v20, v15) >= 0)
              v14 = v20;
            else
              v14 = v15;
          }
        }
        else
        {
          v7 = a3;
          if (v27 <= 0)
          {
            if (((int (*)(char *, char *))a4)(v20, v15) >= 0)
              v14 = v15;
            else
              v14 = v20;
          }
        }
        goto LABEL_47;
      }
      v116 = &a1[(a2 - 1) * v7];
      v16 = (a2 >> 3) * v7;
      v17 = ((uint64_t (*)(char *, char *))a4)(a1, &a1[v16]);
      v118 = &a1[v16];
      v18 = ((uint64_t (*)(char *, char *))a4)(&a1[v16], &a1[2 * v16]);
      if (v17 < 0)
      {
        if ((v18 & 0x80000000) == 0)
        {
          if (((int (*)(char *, char *))a4)(a1, &a1[2 * v16]) >= 0)
            v19 = a1;
          else
            v19 = &a1[2 * v16];
          goto LABEL_18;
        }
      }
      else if (v18 <= 0)
      {
        if (((int (*)(char *, char *))a4)(a1, &a1[2 * v16]) >= 0)
          v19 = &a1[2 * v16];
        else
          v19 = a1;
LABEL_18:
        v118 = v19;
      }
      v21 = ((uint64_t (*)(char *, char *))a4)(&v14[-v16], v14);
      v22 = ((uint64_t (*)(char *, char *))a4)(v14, &v14[v16]);
      if (v21 < 0)
      {
        if ((v22 & 0x80000000) == 0)
        {
          if (((int (*)(char *, char *))a4)(&v14[-v16], &v14[v16]) >= 0)
            v14 -= v16;
          else
            v14 += v16;
        }
      }
      else if (v22 <= 0)
      {
        if (((int (*)(char *, char *))a4)(&v14[-v16], &v14[v16]) >= 0)
          v14 += v16;
        else
          v14 -= v16;
      }
      v23 = &v116[-2 * v16];
      v15 = &v116[-v16];
      v24 = ((uint64_t (*)(char *, char *))a4)(v23, &v116[-v16]);
      v25 = ((uint64_t (*)(char *, char *))a4)(&v116[-v16], v116);
      if (v24 < 0)
      {
        v20 = v118;
        if ((v25 & 0x80000000) == 0)
        {
          if (((int (*)(char *, char *))a4)(v23, v116) >= 0)
            v15 = v23;
          else
            v15 = v116;
        }
      }
      else
      {
        v20 = v118;
        if (v25 <= 0)
        {
          if (((int (*)(char *, char *))a4)(v23, v116) >= 0)
            v15 = v116;
          else
            v15 = v23;
        }
      }
      v10 = v114;
      goto LABEL_38;
    }
LABEL_47:
    if (v124)
    {
      if (v123)
      {
        v28 = v121;
        v29 = a1;
        do
        {
          v30 = *v29;
          *v29++ = *v14;
          *v14++ = v30;
          --v28;
        }
        while (v28 > 1);
      }
      else
      {
        v32 = v109 + 1;
        v33 = a1;
        do
        {
          v34 = *(_QWORD *)v33;
          *(_QWORD *)v33 = *(_QWORD *)v14;
          v33 += 8;
          *(_QWORD *)v14 = v34;
          v14 += 8;
          --v32;
        }
        while (v32 > 1);
      }
    }
    else
    {
      v31 = *(_QWORD *)a1;
      *(_QWORD *)a1 = *(_QWORD *)v14;
      *(_QWORD *)v14 = v31;
    }
    v35 = 0;
    v115 = v10 - 1;
    v36 = &a1[v7];
    v37 = &a1[(a2 - 1) * v7];
    v38 = v37;
    v39 = &a1[v7];
LABEL_56:
    while (v39 <= v38)
    {
      v40 = ((uint64_t (*)(char *, char *))a4)(v39, a1);
      if (v40 > 0)
        break;
      if (!v40)
      {
        if (v124)
        {
          v41 = v123;
          if (v123)
          {
            v42 = 0;
            v43 = v121;
            do
            {
              v44 = v36[v42];
              v36[v42] = v39[v42];
              v39[v42] = v44;
              --v43;
              ++v42;
            }
            while (v43 > 1);
          }
          else
          {
            v58 = v109 + 1;
            do
            {
              v59 = *(_QWORD *)&v36[v41];
              *(_QWORD *)&v36[v41] = *(_QWORD *)&v39[v41];
              *(_QWORD *)&v39[v41] = v59;
              v41 += 8;
              --v58;
            }
            while (v58 > 1);
          }
        }
        else
        {
          v57 = *(_QWORD *)v36;
          *(_QWORD *)v36 = *(_QWORD *)v39;
          *(_QWORD *)v39 = v57;
        }
        v36 += v7;
        v35 = 1;
      }
      v39 += v7;
    }
    while (v39 <= v38)
    {
      v52 = ((uint64_t (*)(char *, char *))a4)(v38, a1);
      if (v52 < 0)
      {
        if (v124)
        {
          v53 = v123;
          if (v123)
          {
            v54 = 0;
            v55 = v121;
            do
            {
              v56 = v39[v54];
              v39[v54] = v38[v54];
              v38[v54] = v56;
              --v55;
              ++v54;
            }
            while (v55 > 1);
          }
          else
          {
            v61 = v109 + 1;
            do
            {
              v62 = *(_QWORD *)&v39[v53];
              *(_QWORD *)&v39[v53] = *(_QWORD *)&v38[v53];
              *(_QWORD *)&v38[v53] = v62;
              v53 += 8;
              --v61;
            }
            while (v61 > 1);
          }
        }
        else
        {
          v60 = *(_QWORD *)v39;
          *(_QWORD *)v39 = *(_QWORD *)v38;
          *(_QWORD *)v38 = v60;
        }
        v39 += v7;
        v38 += v11;
        v35 = 1;
        goto LABEL_56;
      }
      if (!v52)
      {
        if (v124)
        {
          v45 = v123;
          if (v123)
          {
            v46 = 0;
            v47 = v121;
            do
            {
              v48 = v38[v46];
              v38[v46] = v37[v46];
              v37[v46] = v48;
              --v47;
              ++v46;
            }
            while (v47 > 1);
          }
          else
          {
            v50 = v109 + 1;
            do
            {
              v51 = *(_QWORD *)&v38[v45];
              *(_QWORD *)&v38[v45] = *(_QWORD *)&v37[v45];
              *(_QWORD *)&v37[v45] = v51;
              v45 += 8;
              --v50;
            }
            while (v50 > 1);
          }
        }
        else
        {
          v49 = *(_QWORD *)v38;
          *(_QWORD *)v38 = *(_QWORD *)v37;
          *(_QWORD *)v37 = v49;
        }
        v37 += v11;
        v35 = 1;
      }
      v38 += v11;
    }
    v63 = v39 - v36;
    v112 = v39 - v36;
    if (v36 - a1 < v39 - v36)
      v63 = v36 - a1;
    if (v63)
    {
      v64 = &v39[-v63];
      if (v123)
      {
        v65 = (int)v63 + 1;
        v66 = a1;
        do
        {
          v67 = *v66;
          *v66++ = *v64;
          *v64++ = v67;
          --v65;
        }
        while (v65 > 1);
      }
      else
      {
        v68 = ((unint64_t)(int)v63 >> 3) + 1;
        v69 = a1;
        do
        {
          v70 = *(_QWORD *)v69;
          *(_QWORD *)v69 = *(_QWORD *)v64;
          v69 += 8;
          *(_QWORD *)v64 = v70;
          v64 += 8;
          --v68;
        }
        while (v68 > 1);
      }
    }
    v71 = v37 - v38;
    v119 = &a1[v113];
    if (v71 >= &a1[v113] - &v37[v7])
      v72 = &a1[v113] - &v37[v7];
    else
      v72 = v71;
    if (v72)
    {
      v73 = &v119[-v72];
      if (v123)
      {
        v74 = (int)v72 + 1;
        do
        {
          v75 = *v39;
          *v39++ = *v73;
          *v73++ = v75;
          --v74;
        }
        while (v74 > 1);
      }
      else
      {
        v76 = ((unint64_t)(int)v72 >> 3) + 1;
        do
        {
          v77 = *(_QWORD *)v39;
          *(_QWORD *)v39 = *(_QWORD *)v73;
          v39 += 8;
          *(_QWORD *)v73 = v77;
          v73 += 8;
          --v76;
        }
        while (v76 > 1);
      }
    }
    if (!v35)
      break;
LABEL_111:
    v78 = a3;
    if (v112 > a3)
    {
      v79 = v112 / a3;
      if (a6 && v79 > *(_QWORD *)(a6 + 40))
      {
        v80 = getargs(a6);
        if (!v80)
          _psort_cold_1();
        *v80 = a6;
        v80[1] = a1;
        v80[2] = v79;
        *((_DWORD *)v80 + 6) = v115;
        dispatch_group_async_f(*(dispatch_group_t *)(a6 + 56), *(dispatch_queue_t *)(a6 + 48), v80, (dispatch_function_t)_psort_parallel);
        v78 = a3;
      }
      else
      {
        v78 = a3;
        _psort(a1, v112 / a3, a3, a4, v115, 0);
      }
    }
    if (v71 <= v78)
      return;
    a1 = &v119[-v71];
    v7 = a3;
    a2 = v71 / a3;
    v10 = v115;
    if (v114 < 2)
      goto LABEL_136;
  }
  v81 = &a1[v7];
  if (v113 > (uint64_t)a3)
  {
    LODWORD(v82) = 0;
    v83 = (a2 >> 2) + 1;
    v84 = a1;
    do
    {
      v82 = (int)v82;
      v85 = v84;
      v117 = v81;
      while (v81 > a1)
      {
        v86 = v81;
        v81 += v11;
        if (((int (*)(char *, char *))a4)(v81, v86) < 1)
          break;
        if (v124)
        {
          v87 = v123;
          if (v123)
          {
            v88 = 0;
            v89 = v121;
            do
            {
              v90 = v86[v88];
              v86[v88] = *((_BYTE *)v85 + v88);
              *((_BYTE *)v85 + v88) = v90;
              --v89;
              ++v88;
            }
            while (v89 > 1);
          }
          else
          {
            v92 = v109 + 1;
            v93 = (uint64_t)v85 + a3;
            do
            {
              v94 = *(_QWORD *)(v93 + v87);
              *(_QWORD *)(v93 + v87) = *(_QWORD *)((char *)v85 + v87);
              *(_QWORD *)((char *)v85 + v87) = v94;
              v87 += 8;
              --v92;
            }
            while (v92 > 1);
          }
        }
        else
        {
          v91 = *(_QWORD *)v86;
          *(_QWORD *)v86 = *(_QWORD *)v81;
          *(_QWORD *)v81 = v91;
        }
        ++v82;
        v85 = (_QWORD *)((char *)v85 + v11);
        if (v83 < v82)
          goto LABEL_111;
      }
      v81 = (char *)v117 + a3;
      v84 = (_QWORD *)((char *)v84 + a3);
    }
    while ((char *)v117 + a3 < v119);
  }
}

void _psort_parallel_0(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)a1;
  _psort_0(*(char **)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(v2 + 32), *(int (***)(_QWORD, _QWORD, _QWORD))(v2 + 24), *(_DWORD *)(a1 + 24), v2);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 64));
  *(_QWORD *)a1 = *(_QWORD *)(v2 + 8);
  *(_QWORD *)(v2 + 8) = a1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 64));
}

void _psort_0(char *a1, size_t a2, unint64_t a3, int (**a4)(_QWORD, _QWORD, _QWORD), int a5, uint64_t a6)
{
  int64_t v7;
  int v10;
  uint64_t v11;
  int v12;
  int64_t v13;
  char *v14;
  char *v15;
  size_t v16;
  int v17;
  int v18;
  char *v19;
  char *v20;
  int v21;
  int v22;
  char *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  char *v29;
  char v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  int v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  int64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  char v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  unint64_t v71;
  int64_t v72;
  char *v73;
  uint64_t v74;
  char v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  _QWORD *v80;
  char *v81;
  unint64_t v82;
  unint64_t v83;
  _QWORD *v84;
  _QWORD *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  _QWORD *v96;
  _QWORD *v97;
  char *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  _BOOL4 v111;
  unint64_t v112;
  int64_t v113;
  int v114;
  unsigned int v115;
  char *v116;
  _QWORD *v117;
  char *v118;
  char *v119;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  int v124;

  v7 = a3;
  if (a5 < 1)
  {
LABEL_136:
    heapsort_b(a1, a2, v7, a4);
    return;
  }
  v10 = a5;
  v11 = -(uint64_t)a3;
  v111 = a3 != 8;
  v108 = (int)a3;
  v109 = (unint64_t)(int)a3 >> 3;
  v121 = (int)a3 + 1;
  while (1)
  {
    v123 = (a1 | v7) & 7;
    v12 = v111;
    if (((a1 | v7) & 7) != 0)
      v12 = 2;
    v124 = v12;
    v13 = a2 * v7;
    if (a2 <= 6)
    {
      if (v13 > v7)
      {
        v122 = &a1[v13];
        v95 = &a1[a3];
        v96 = a1;
        do
        {
          if (v95 > a1)
          {
            v97 = v96;
            v98 = v95;
            do
            {
              v99 = v98;
              v98 += v11;
              if (((int (**)(_QWORD, char *, char *))a4)[2](a4, v98, v99) < 1)
                break;
              if (v124)
              {
                v100 = v123;
                if (v123)
                {
                  v101 = 0;
                  v102 = v108 + 1;
                  do
                  {
                    v103 = v99[v101];
                    v99[v101] = *((_BYTE *)v97 + v101);
                    *((_BYTE *)v97 + v101) = v103;
                    --v102;
                    ++v101;
                  }
                  while (v102 > 1);
                }
                else
                {
                  v105 = (uint64_t)v97 + a3;
                  v106 = v109 + 1;
                  do
                  {
                    v107 = *(_QWORD *)(v105 + v100);
                    *(_QWORD *)(v105 + v100) = *(_QWORD *)((char *)v97 + v100);
                    *(_QWORD *)((char *)v97 + v100) = v107;
                    v100 += 8;
                    --v106;
                  }
                  while (v106 > 1);
                }
              }
              else
              {
                v104 = *(_QWORD *)v99;
                *(_QWORD *)v99 = *(_QWORD *)v98;
                *(_QWORD *)v98 = v104;
              }
              v97 = (_QWORD *)((char *)v97 + v11);
            }
            while (v98 > a1);
          }
          v95 += a3;
          v96 = (_QWORD *)((char *)v96 + a3);
        }
        while (v95 < v122);
      }
      return;
    }
    v14 = &a1[(a2 >> 1) * v7];
    v114 = v10;
    v113 = a2 * v7;
    if (a2 != 7)
    {
      v15 = &a1[(a2 - 1) * v7];
      if (a2 < 0x29)
      {
        v20 = a1;
LABEL_38:
        v26 = ((int (**)(_QWORD, char *, char *))a4)[2](a4, v20, v14);
        v27 = ((int (**)(_QWORD, char *, char *))a4)[2](a4, v14, v15);
        if (v26 < 0)
        {
          v7 = a3;
          if ((v27 & 0x80000000) == 0)
          {
            if (((int (**)(_QWORD, char *, char *))a4)[2](a4, v20, v15) >= 0)
              v14 = v20;
            else
              v14 = v15;
          }
        }
        else
        {
          v7 = a3;
          if (v27 <= 0)
          {
            if (((int (**)(_QWORD, char *, char *))a4)[2](a4, v20, v15) >= 0)
              v14 = v15;
            else
              v14 = v20;
          }
        }
        goto LABEL_47;
      }
      v116 = &a1[(a2 - 1) * v7];
      v16 = (a2 >> 3) * v7;
      v17 = ((int (**)(_QWORD, char *, char *))a4)[2](a4, a1, &a1[v16]);
      v118 = &a1[v16];
      v18 = ((int (**)(_QWORD, char *, char *))a4)[2](a4, &a1[v16], &a1[2 * v16]);
      if (v17 < 0)
      {
        if ((v18 & 0x80000000) == 0)
        {
          if (((int (**)(_QWORD, char *, char *))a4)[2](a4, a1, &a1[2 * v16]) >= 0)
            v19 = a1;
          else
            v19 = &a1[2 * v16];
          goto LABEL_18;
        }
      }
      else if (v18 <= 0)
      {
        if (((int (**)(_QWORD, char *, char *))a4)[2](a4, a1, &a1[2 * v16]) >= 0)
          v19 = &a1[2 * v16];
        else
          v19 = a1;
LABEL_18:
        v118 = v19;
      }
      v21 = ((int (**)(_QWORD, char *, char *))a4)[2](a4, &v14[-v16], v14);
      v22 = ((int (**)(_QWORD, char *, char *))a4)[2](a4, v14, &v14[v16]);
      if (v21 < 0)
      {
        if ((v22 & 0x80000000) == 0)
        {
          if (((int (**)(_QWORD, char *, char *))a4)[2](a4, &v14[-v16], &v14[v16]) >= 0)
            v14 -= v16;
          else
            v14 += v16;
        }
      }
      else if (v22 <= 0)
      {
        if (((int (**)(_QWORD, char *, char *))a4)[2](a4, &v14[-v16], &v14[v16]) >= 0)
          v14 += v16;
        else
          v14 -= v16;
      }
      v23 = &v116[-2 * v16];
      v15 = &v116[-v16];
      v24 = ((int (**)(_QWORD, char *, char *))a4)[2](a4, v23, &v116[-v16]);
      v25 = ((int (**)(_QWORD, char *, char *))a4)[2](a4, &v116[-v16], v116);
      if (v24 < 0)
      {
        v20 = v118;
        if ((v25 & 0x80000000) == 0)
        {
          if (((int (**)(_QWORD, char *, char *))a4)[2](a4, v23, v116) >= 0)
            v15 = v23;
          else
            v15 = v116;
        }
      }
      else
      {
        v20 = v118;
        if (v25 <= 0)
        {
          if (((int (**)(_QWORD, char *, char *))a4)[2](a4, v23, v116) >= 0)
            v15 = v116;
          else
            v15 = v23;
        }
      }
      v10 = v114;
      goto LABEL_38;
    }
LABEL_47:
    if (v124)
    {
      if (v123)
      {
        v28 = v121;
        v29 = a1;
        do
        {
          v30 = *v29;
          *v29++ = *v14;
          *v14++ = v30;
          --v28;
        }
        while (v28 > 1);
      }
      else
      {
        v32 = v109 + 1;
        v33 = a1;
        do
        {
          v34 = *(_QWORD *)v33;
          *(_QWORD *)v33 = *(_QWORD *)v14;
          v33 += 8;
          *(_QWORD *)v14 = v34;
          v14 += 8;
          --v32;
        }
        while (v32 > 1);
      }
    }
    else
    {
      v31 = *(_QWORD *)a1;
      *(_QWORD *)a1 = *(_QWORD *)v14;
      *(_QWORD *)v14 = v31;
    }
    v35 = 0;
    v115 = v10 - 1;
    v36 = &a1[v7];
    v37 = &a1[(a2 - 1) * v7];
    v38 = v37;
    v39 = &a1[v7];
LABEL_56:
    while (v39 <= v38)
    {
      v40 = ((int (**)(_QWORD, char *, char *))a4)[2](a4, v39, a1);
      if (v40 > 0)
        break;
      if (!v40)
      {
        if (v124)
        {
          v41 = v123;
          if (v123)
          {
            v42 = 0;
            v43 = v121;
            do
            {
              v44 = v36[v42];
              v36[v42] = v39[v42];
              v39[v42] = v44;
              --v43;
              ++v42;
            }
            while (v43 > 1);
          }
          else
          {
            v58 = v109 + 1;
            do
            {
              v59 = *(_QWORD *)&v36[v41];
              *(_QWORD *)&v36[v41] = *(_QWORD *)&v39[v41];
              *(_QWORD *)&v39[v41] = v59;
              v41 += 8;
              --v58;
            }
            while (v58 > 1);
          }
        }
        else
        {
          v57 = *(_QWORD *)v36;
          *(_QWORD *)v36 = *(_QWORD *)v39;
          *(_QWORD *)v39 = v57;
        }
        v36 += v7;
        v35 = 1;
      }
      v39 += v7;
    }
    while (v39 <= v38)
    {
      v52 = ((int (**)(_QWORD, char *, char *))a4)[2](a4, v38, a1);
      if (v52 < 0)
      {
        if (v124)
        {
          v53 = v123;
          if (v123)
          {
            v54 = 0;
            v55 = v121;
            do
            {
              v56 = v39[v54];
              v39[v54] = v38[v54];
              v38[v54] = v56;
              --v55;
              ++v54;
            }
            while (v55 > 1);
          }
          else
          {
            v61 = v109 + 1;
            do
            {
              v62 = *(_QWORD *)&v39[v53];
              *(_QWORD *)&v39[v53] = *(_QWORD *)&v38[v53];
              *(_QWORD *)&v38[v53] = v62;
              v53 += 8;
              --v61;
            }
            while (v61 > 1);
          }
        }
        else
        {
          v60 = *(_QWORD *)v39;
          *(_QWORD *)v39 = *(_QWORD *)v38;
          *(_QWORD *)v38 = v60;
        }
        v39 += v7;
        v38 += v11;
        v35 = 1;
        goto LABEL_56;
      }
      if (!v52)
      {
        if (v124)
        {
          v45 = v123;
          if (v123)
          {
            v46 = 0;
            v47 = v121;
            do
            {
              v48 = v38[v46];
              v38[v46] = v37[v46];
              v37[v46] = v48;
              --v47;
              ++v46;
            }
            while (v47 > 1);
          }
          else
          {
            v50 = v109 + 1;
            do
            {
              v51 = *(_QWORD *)&v38[v45];
              *(_QWORD *)&v38[v45] = *(_QWORD *)&v37[v45];
              *(_QWORD *)&v37[v45] = v51;
              v45 += 8;
              --v50;
            }
            while (v50 > 1);
          }
        }
        else
        {
          v49 = *(_QWORD *)v38;
          *(_QWORD *)v38 = *(_QWORD *)v37;
          *(_QWORD *)v37 = v49;
        }
        v37 += v11;
        v35 = 1;
      }
      v38 += v11;
    }
    v63 = v39 - v36;
    v112 = v39 - v36;
    if (v36 - a1 < v39 - v36)
      v63 = v36 - a1;
    if (v63)
    {
      v64 = &v39[-v63];
      if (v123)
      {
        v65 = (int)v63 + 1;
        v66 = a1;
        do
        {
          v67 = *v66;
          *v66++ = *v64;
          *v64++ = v67;
          --v65;
        }
        while (v65 > 1);
      }
      else
      {
        v68 = ((unint64_t)(int)v63 >> 3) + 1;
        v69 = a1;
        do
        {
          v70 = *(_QWORD *)v69;
          *(_QWORD *)v69 = *(_QWORD *)v64;
          v69 += 8;
          *(_QWORD *)v64 = v70;
          v64 += 8;
          --v68;
        }
        while (v68 > 1);
      }
    }
    v71 = v37 - v38;
    v119 = &a1[v113];
    if (v71 >= &a1[v113] - &v37[v7])
      v72 = &a1[v113] - &v37[v7];
    else
      v72 = v71;
    if (v72)
    {
      v73 = &v119[-v72];
      if (v123)
      {
        v74 = (int)v72 + 1;
        do
        {
          v75 = *v39;
          *v39++ = *v73;
          *v73++ = v75;
          --v74;
        }
        while (v74 > 1);
      }
      else
      {
        v76 = ((unint64_t)(int)v72 >> 3) + 1;
        do
        {
          v77 = *(_QWORD *)v39;
          *(_QWORD *)v39 = *(_QWORD *)v73;
          v39 += 8;
          *(_QWORD *)v73 = v77;
          v73 += 8;
          --v76;
        }
        while (v76 > 1);
      }
    }
    if (!v35)
      break;
LABEL_111:
    v78 = a3;
    if (v112 > a3)
    {
      v79 = v112 / a3;
      if (a6 && v79 > *(_QWORD *)(a6 + 40))
      {
        v80 = getargs(a6);
        if (!v80)
          _psort_cold_1_0();
        *v80 = a6;
        v80[1] = a1;
        v80[2] = v79;
        *((_DWORD *)v80 + 6) = v115;
        dispatch_group_async_f(*(dispatch_group_t *)(a6 + 56), *(dispatch_queue_t *)(a6 + 48), v80, (dispatch_function_t)_psort_parallel_0);
        v78 = a3;
      }
      else
      {
        v78 = a3;
        _psort_0(a1, v112 / a3, a3, a4, v115, 0);
      }
    }
    if (v71 <= v78)
      return;
    a1 = &v119[-v71];
    v7 = a3;
    a2 = v71 / a3;
    v10 = v115;
    if (v114 < 2)
      goto LABEL_136;
  }
  v81 = &a1[v7];
  if (v113 > (uint64_t)a3)
  {
    LODWORD(v82) = 0;
    v83 = (a2 >> 2) + 1;
    v84 = a1;
    do
    {
      v82 = (int)v82;
      v85 = v84;
      v117 = v81;
      while (v81 > a1)
      {
        v86 = v81;
        v81 += v11;
        if (((int (**)(_QWORD, char *, char *))a4)[2](a4, v81, v86) < 1)
          break;
        if (v124)
        {
          v87 = v123;
          if (v123)
          {
            v88 = 0;
            v89 = v121;
            do
            {
              v90 = v86[v88];
              v86[v88] = *((_BYTE *)v85 + v88);
              *((_BYTE *)v85 + v88) = v90;
              --v89;
              ++v88;
            }
            while (v89 > 1);
          }
          else
          {
            v92 = v109 + 1;
            v93 = (uint64_t)v85 + a3;
            do
            {
              v94 = *(_QWORD *)(v93 + v87);
              *(_QWORD *)(v93 + v87) = *(_QWORD *)((char *)v85 + v87);
              *(_QWORD *)((char *)v85 + v87) = v94;
              v87 += 8;
              --v92;
            }
            while (v92 > 1);
          }
        }
        else
        {
          v91 = *(_QWORD *)v86;
          *(_QWORD *)v86 = *(_QWORD *)v81;
          *(_QWORD *)v81 = v91;
        }
        ++v82;
        v85 = (_QWORD *)((char *)v85 + v11);
        if (v83 < v82)
          goto LABEL_111;
      }
      v81 = (char *)v117 + a3;
      v84 = (_QWORD *)((char *)v84 + a3);
    }
    while ((char *)v117 + a3 < v119);
  }
}

void psort_r(void *__base, size_t __nel, size_t __width, void *a4, int (__cdecl *__compar)(void *, const void *, const void *))
{
  _QWORD *v10;
  uint64_t v11;
  int v12;
  int v13;
  _QWORD *v14;
  _QWORD *v15;
  __int128 v16;
  void *v17[2];
  __int128 v18;
  __int128 v19;
  dispatch_group_t group[2];

  if (__nel >= 0x7D0
    && (_get_cpu_capabilities() & 0xFE0000) != 0
    && (v19 = 0u, *(_OWORD *)group = 0u,
                  *(_OWORD *)v17 = 0u,
                  v18 = 0u,
                  v16 = 0u,
                  (v10 = getargs_0((uint64_t)&v16)) != 0))
  {
    v11 = (uint64_t)v10;
    *(_QWORD *)&v16 = "psort_r";
    v17[1] = a4;
    *(_QWORD *)&v18 = __compar;
    *((_QWORD *)&v18 + 1) = __width;
    *((_QWORD *)&v19 + 1) = dispatch_get_global_queue(0, 0);
    group[0] = dispatch_group_create();
    *(_QWORD *)(v11 + 8) = __base;
    *(_QWORD *)(v11 + 16) = __nel;
    *(_DWORD *)(v11 + 24) = 2 * flsl(__nel) - 2;
    *(_QWORD *)v11 = &v16;
    v12 = flsl(__nel);
    if (v12 >= 0)
      v13 = v12;
    else
      v13 = v12 + 1;
    *(_QWORD *)&v19 = ((1 << (v13 >> 1)) + (__nel >> (v13 >> 1))) >> 1;
    _psort_parallel_1(v11);
    dispatch_group_wait(group[0], 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(group[0]);
    v14 = v17[0];
    if (v17[0])
    {
      do
      {
        v15 = (_QWORD *)*v14;
        munmap(v14, 0x1000uLL);
        v14 = v15;
      }
      while (v15);
    }
  }
  else
  {
    qsort_r(__base, __nel, __width, a4, __compar);
  }
}

_QWORD *getargs_0(uint64_t a1)
{
  os_unfair_lock_s *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  unsigned int i;

  v2 = (os_unfair_lock_s *)(a1 + 72);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  v3 = *(_QWORD **)(a1 + 8);
  if (!v3)
  {
    v4 = mmap(0, 0x1000uLL, 3, 4098, -1, 0);
    if (!v4)
      return 0;
    v5 = 0;
    *v4 = *(_QWORD *)(a1 + 16);
    v3 = v4 - 3;
    *(_QWORD *)(a1 + 16) = v4;
    v6 = v4 + 1;
    for (i = 128; i > 1; --i)
    {
      v3[4] = v5;
      v3 += 4;
      v5 = v6;
      v6 += 4;
    }
    *(_QWORD *)(a1 + 8) = v3;
  }
  *(_QWORD *)(a1 + 8) = *v3;
  os_unfair_lock_unlock(v2);
  return v3;
}

void _psort_parallel_1(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)a1;
  _psort_1(*(char **)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 24), *(uint64_t (**)(uint64_t, char *, char *))(v2 + 32), *(_DWORD *)(a1 + 24), v2);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 72));
  *(_QWORD *)a1 = *(_QWORD *)(v2 + 8);
  *(_QWORD *)(v2 + 8) = a1;
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 72));
}

void _psort_1(char *a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, char *, char *), int a6, uint64_t a7)
{
  int64_t v9;
  int v12;
  uint64_t v13;
  int v14;
  char *v15;
  char *v16;
  unint64_t v17;
  char *v18;
  char *v19;
  int v20;
  int v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  int v26;
  int v27;
  char *v28;
  int v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  char *v34;
  char v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  int v40;
  char *v41;
  char *v42;
  char *v43;
  char *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  int64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  char v72;
  unint64_t v73;
  char *v74;
  uint64_t v75;
  int64_t v76;
  char *v77;
  uint64_t v78;
  char v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  _QWORD *v83;
  char *v84;
  unint64_t v85;
  char *v86;
  char *v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  unint64_t v94;
  char *v95;
  uint64_t v96;
  char *v97;
  char *v98;
  char *v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  unint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  _BOOL4 v113;
  unint64_t v114;
  int64_t v115;
  int v116;
  unsigned int v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  char *v121;
  char *v122;
  char *v123;
  char *v124;
  uint64_t v126;
  uint64_t v127;
  int v128;

  v9 = a3;
  if (a6 < 1)
  {
LABEL_135:
    __heapsort_r(a1, a2, v9, a4, a5);
    return;
  }
  v12 = a6;
  v13 = -(uint64_t)a3;
  v113 = a3 != 8;
  v110 = (int)a3;
  v111 = (unint64_t)(int)a3 >> 3;
  v126 = (int)a3 + 1;
  while (1)
  {
    v127 = (a1 | v9) & 7;
    v14 = v113;
    if (((a1 | v9) & 7) != 0)
      v14 = 2;
    v128 = v14;
    v115 = a2 * v9;
    if (a2 <= 6)
    {
      if (v115 > v9)
      {
        v97 = &a1[a3];
        v98 = a1;
        do
        {
          if (v97 > a1)
          {
            v99 = v98;
            v100 = v97;
            do
            {
              v101 = v100;
              v100 += v13;
              if ((int)a5(a4, v100, v101) < 1)
                break;
              if (v128)
              {
                v102 = v127;
                if (v127)
                {
                  v103 = 0;
                  v104 = v110 + 1;
                  do
                  {
                    v105 = v101[v103];
                    v101[v103] = v99[v103];
                    v99[v103] = v105;
                    --v104;
                    ++v103;
                  }
                  while (v104 > 1);
                }
                else
                {
                  v107 = v111 + 1;
                  v108 = &v99[a3];
                  do
                  {
                    v109 = *(_QWORD *)&v108[v102];
                    *(_QWORD *)&v108[v102] = *(_QWORD *)&v99[v102];
                    *(_QWORD *)&v99[v102] = v109;
                    v102 += 8;
                    --v107;
                  }
                  while (v107 > 1);
                }
              }
              else
              {
                v106 = *(_QWORD *)v101;
                *(_QWORD *)v101 = *(_QWORD *)v100;
                *(_QWORD *)v100 = v106;
              }
              v99 += v13;
            }
            while (v100 > a1);
          }
          v97 += a3;
          v98 += a3;
        }
        while (v97 < &a1[v115]);
      }
      return;
    }
    v15 = &a1[(a2 >> 1) * v9];
    v116 = v12;
    v118 = a2;
    if (a2 != 7)
    {
      v16 = &a1[(a2 - 1) * v9];
      if (a2 < 0x29)
      {
        v23 = a1;
LABEL_38:
        v31 = a5(a4, v23, v15);
        v32 = a5(a4, v15, v16);
        if (v31 < 0)
        {
          a2 = v118;
          if ((v32 & 0x80000000) == 0)
          {
            if ((int)a5(a4, v23, v16) >= 0)
              v15 = v23;
            else
              v15 = v16;
          }
        }
        else
        {
          a2 = v118;
          if (v32 <= 0)
          {
            if ((int)a5(a4, v23, v16) >= 0)
              v15 = v16;
            else
              v15 = v23;
          }
        }
        goto LABEL_47;
      }
      v123 = &a1[(a2 - 1) * v9];
      v17 = (a2 >> 3) * v9;
      v18 = &a1[v17];
      v119 = v17;
      v19 = &a1[2 * v17];
      v20 = a5(a4, a1, &a1[v17]);
      v121 = v18;
      v21 = a5(a4, v18, v19);
      if (v20 < 0)
      {
        if ((v21 & 0x80000000) == 0)
        {
          if ((int)a5(a4, a1, v19) >= 0)
            v22 = a1;
          else
            v22 = v19;
          goto LABEL_18;
        }
      }
      else if (v21 <= 0)
      {
        if ((int)a5(a4, a1, v19) >= 0)
          v22 = v19;
        else
          v22 = a1;
LABEL_18:
        v121 = v22;
      }
      v24 = &v15[-v119];
      v25 = &v15[v119];
      v26 = a5(a4, &v15[-v119], &a1[(a2 >> 1) * v9]);
      v27 = a5(a4, v15, &v15[v119]);
      if (v26 < 0)
      {
        if ((v27 & 0x80000000) == 0)
        {
          if ((int)a5(a4, v24, v25) >= 0)
            v15 -= v119;
          else
            v15 += v119;
        }
      }
      else if (v27 <= 0)
      {
        if ((int)a5(a4, v24, v25) >= 0)
          v15 += v119;
        else
          v15 -= v119;
      }
      v28 = &v123[-2 * v119];
      v16 = &v123[-v119];
      v29 = a5(a4, v28, &v123[-v119]);
      v30 = a5(a4, &v123[-v119], v123);
      if (v29 < 0)
      {
        v23 = v121;
        if ((v30 & 0x80000000) == 0)
        {
          if ((int)a5(a4, v28, v123) >= 0)
            v16 = &v123[-2 * v119];
          else
            v16 = v123;
        }
      }
      else
      {
        v23 = v121;
        if (v30 <= 0)
        {
          if ((int)a5(a4, v28, v123) >= 0)
            v16 = v123;
          else
            v16 = &v123[-2 * v119];
        }
      }
      v12 = v116;
      goto LABEL_38;
    }
LABEL_47:
    if (v128)
    {
      if (((a1 | v9) & 7) != 0)
      {
        v33 = v126;
        v34 = a1;
        do
        {
          v35 = *v34;
          *v34++ = *v15;
          *v15++ = v35;
          --v33;
        }
        while (v33 > 1);
      }
      else
      {
        v37 = v111 + 1;
        v38 = a1;
        do
        {
          v39 = *(_QWORD *)v38;
          *(_QWORD *)v38 = *(_QWORD *)v15;
          v38 += 8;
          *(_QWORD *)v15 = v39;
          v15 += 8;
          --v37;
        }
        while (v37 > 1);
      }
    }
    else
    {
      v36 = *(_QWORD *)a1;
      *(_QWORD *)a1 = *(_QWORD *)v15;
      *(_QWORD *)v15 = v36;
    }
    v40 = 0;
    v117 = v12 - 1;
    v41 = &a1[v9];
    v42 = &a1[(a2 - 1) * v9];
    v43 = v42;
    v44 = &a1[v9];
LABEL_56:
    while (v44 <= v43)
    {
      v45 = a5(a4, v44, a1);
      if (v45 > 0)
        break;
      if (!v45)
      {
        if (v128)
        {
          v46 = (a1 | v9) & 7;
          if (((a1 | v9) & 7) != 0)
          {
            v47 = 0;
            v48 = v126;
            do
            {
              v49 = v41[v47];
              v41[v47] = v44[v47];
              v44[v47] = v49;
              --v48;
              ++v47;
            }
            while (v48 > 1);
          }
          else
          {
            v63 = v111 + 1;
            do
            {
              v64 = *(_QWORD *)&v41[v46];
              *(_QWORD *)&v41[v46] = *(_QWORD *)&v44[v46];
              *(_QWORD *)&v44[v46] = v64;
              v46 += 8;
              --v63;
            }
            while (v63 > 1);
          }
        }
        else
        {
          v62 = *(_QWORD *)v41;
          *(_QWORD *)v41 = *(_QWORD *)v44;
          *(_QWORD *)v44 = v62;
        }
        v41 += v9;
        v40 = 1;
      }
      v44 += v9;
    }
    while (v44 <= v43)
    {
      v57 = a5(a4, v43, a1);
      if (v57 < 0)
      {
        if (v128)
        {
          v58 = (a1 | v9) & 7;
          if (((a1 | v9) & 7) != 0)
          {
            v59 = 0;
            v60 = v126;
            do
            {
              v61 = v44[v59];
              v44[v59] = v43[v59];
              v43[v59] = v61;
              --v60;
              ++v59;
            }
            while (v60 > 1);
          }
          else
          {
            v66 = v111 + 1;
            do
            {
              v67 = *(_QWORD *)&v44[v58];
              *(_QWORD *)&v44[v58] = *(_QWORD *)&v43[v58];
              *(_QWORD *)&v43[v58] = v67;
              v58 += 8;
              --v66;
            }
            while (v66 > 1);
          }
        }
        else
        {
          v65 = *(_QWORD *)v44;
          *(_QWORD *)v44 = *(_QWORD *)v43;
          *(_QWORD *)v43 = v65;
        }
        v44 += v9;
        v43 += v13;
        v40 = 1;
        goto LABEL_56;
      }
      if (!v57)
      {
        if (v128)
        {
          v50 = (a1 | v9) & 7;
          if (((a1 | v9) & 7) != 0)
          {
            v51 = 0;
            v52 = v126;
            do
            {
              v53 = v43[v51];
              v43[v51] = v42[v51];
              v42[v51] = v53;
              --v52;
              ++v51;
            }
            while (v52 > 1);
          }
          else
          {
            v55 = v111 + 1;
            do
            {
              v56 = *(_QWORD *)&v43[v50];
              *(_QWORD *)&v43[v50] = *(_QWORD *)&v42[v50];
              *(_QWORD *)&v42[v50] = v56;
              v50 += 8;
              --v55;
            }
            while (v55 > 1);
          }
        }
        else
        {
          v54 = *(_QWORD *)v43;
          *(_QWORD *)v43 = *(_QWORD *)v42;
          *(_QWORD *)v42 = v54;
        }
        v42 += v13;
        v40 = 1;
      }
      v43 += v13;
    }
    v68 = v44 - v41;
    v114 = v44 - v41;
    if (v41 - a1 < v44 - v41)
      v68 = v41 - a1;
    if (v68)
    {
      v69 = &v44[-v68];
      if (((a1 | v9) & 7) != 0)
      {
        v70 = (int)v68 + 1;
        v71 = a1;
        do
        {
          v72 = *v71;
          *v71++ = *v69;
          *v69++ = v72;
          --v70;
        }
        while (v70 > 1);
      }
      else
      {
        v73 = ((unint64_t)(int)v68 >> 3) + 1;
        v74 = a1;
        do
        {
          v75 = *(_QWORD *)v74;
          *(_QWORD *)v74 = *(_QWORD *)v69;
          v74 += 8;
          *(_QWORD *)v69 = v75;
          v69 += 8;
          --v73;
        }
        while (v73 > 1);
      }
    }
    v76 = v42 - v43;
    v124 = &a1[v115];
    v120 = v42 - v43;
    if (v42 - v43 >= (unint64_t)(&a1[v115] - &v42[v9]))
      v76 = &a1[v115] - &v42[v9];
    if (v76)
    {
      v77 = &v124[-v76];
      if (((a1 | v9) & 7) != 0)
      {
        v78 = (int)v76 + 1;
        do
        {
          v79 = *v44;
          *v44++ = *v77;
          *v77++ = v79;
          --v78;
        }
        while (v78 > 1);
      }
      else
      {
        v80 = ((unint64_t)(int)v76 >> 3) + 1;
        do
        {
          v81 = *(_QWORD *)v44;
          *(_QWORD *)v44 = *(_QWORD *)v77;
          v44 += 8;
          *(_QWORD *)v77 = v81;
          v77 += 8;
          --v80;
        }
        while (v80 > 1);
      }
    }
    if (!v40)
      break;
LABEL_110:
    if (v114 > a3)
    {
      v82 = v114 / a3;
      if (a7 && v82 > *(_QWORD *)(a7 + 48))
      {
        v83 = getargs_0(a7);
        if (!v83)
          _psort_cold_1_1();
        *v83 = a7;
        v83[1] = a1;
        v83[2] = v82;
        *((_DWORD *)v83 + 6) = v117;
        dispatch_group_async_f(*(dispatch_group_t *)(a7 + 64), *(dispatch_queue_t *)(a7 + 56), v83, (dispatch_function_t)_psort_parallel_1);
      }
      else
      {
        _psort_1(a1, v114 / a3, a3, a4, a5, v117, 0);
      }
    }
    if (v120 <= a3)
      return;
    a1 = &v124[-v120];
    v9 = a3;
    a2 = v120 / a3;
    v12 = v117;
    if (v116 < 2)
      goto LABEL_135;
  }
  v84 = &a1[v9];
  if (v115 > (uint64_t)a3)
  {
    LODWORD(v85) = 0;
    v86 = a1;
    do
    {
      v85 = (int)v85;
      v87 = v86;
      v122 = v84;
      while (v84 > a1)
      {
        v88 = v84;
        v84 += v13;
        if ((int)a5(a4, v84, v88) < 1)
          break;
        if (v128)
        {
          v89 = v127;
          if (v127)
          {
            v90 = 0;
            v91 = v126;
            do
            {
              v92 = v88[v90];
              v88[v90] = v87[v90];
              v87[v90] = v92;
              --v91;
              ++v90;
            }
            while (v91 > 1);
          }
          else
          {
            v94 = v111 + 1;
            v95 = &v87[a3];
            do
            {
              v96 = *(_QWORD *)&v95[v89];
              *(_QWORD *)&v95[v89] = *(_QWORD *)&v87[v89];
              *(_QWORD *)&v87[v89] = v96;
              v89 += 8;
              --v94;
            }
            while (v94 > 1);
          }
        }
        else
        {
          v93 = *(_QWORD *)v88;
          *(_QWORD *)v88 = *(_QWORD *)v84;
          *(_QWORD *)v84 = v93;
        }
        ++v85;
        v87 += v13;
        if ((v118 >> 2) + 1 < v85)
          goto LABEL_110;
      }
      v84 = &v122[a3];
      v86 += a3;
    }
    while (&v122[a3] < v124);
  }
}

int scandir_b(const char *a1, dirent ***a2, void *a3, void *a4)
{
  DIR *v7;
  DIR *v8;
  void *v9;
  size_t v10;
  uint64_t v11;
  unint64_t v12;
  dirent *v13;
  dirent *v14;
  _QWORD *v15;
  void *v16;
  void *v17;

  v7 = opendir(a1);
  if (!v7)
    goto LABEL_20;
  v8 = v7;
  v9 = malloc_type_malloc(0x100uLL, 0x2004093837F09uLL);
  if (!v9)
  {
LABEL_19:
    free(v9);
    closedir(v8);
LABEL_20:
    LODWORD(v10) = -1;
    return v10;
  }
  v10 = 0;
  v11 = -1;
  v12 = 32;
  while (1)
  {
    v13 = readdir(v8);
    if (!v13)
      break;
    v14 = v13;
    if (!a3 || (*((unsigned int (**)(void *, dirent *))a3 + 2))(a3, v13))
    {
      v15 = malloc_type_malloc(((v14->d_namlen + 4) & 0x1FFFC) + 24, 0xD5DB3AF2uLL);
      if (!v15)
        goto LABEL_17;
      v16 = v15;
      *v15 = v14->d_ino;
      *((_BYTE *)v15 + 20) = v14->d_type;
      *((_WORD *)v15 + 8) = v14->d_reclen;
      *((_WORD *)v15 + 9) = v14->d_namlen;
      _platform_memmove();
      if (v10 >= v12)
      {
        v17 = malloc_type_realloc(v9, 16 * v12, 0x2004093837F09uLL);
        if (!v17)
        {
          free(v16);
LABEL_17:
          if (v10)
          {
            do
              free(*((void **)v9 + v11--));
            while (v11 != -1);
          }
          goto LABEL_19;
        }
        v12 *= 2;
        v9 = v17;
      }
      *((_QWORD *)v9 + v10++) = v16;
      ++v11;
    }
  }
  closedir(v8);
  if (a4 && v10)
    qsort_b(v9, v10, 8uLL, a4);
  *a2 = (dirent **)v9;
  return v10;
}

uint64_t __printf_arginfo_errno(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!a2)
    __printf_arginfo_errno_cold_1();
  *a3 = 1;
  return 1;
}

uint64_t __printf_render_errno(uint64_t *a1, uint64_t a2, int **a3)
{
  int v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  char v11[64];

  v5 = **a3;
  if (v5 < 0 || v5 >= 107)
  {
    sprintf(v11, "errno=%d/0x%x", **a3, v5);
    v9 = _platform_strlen();
    v10 = __printf_out((uint64_t)a1, a2, (uint64_t)v11, v9);
    __printf_flush(a1);
    return v10;
  }
  else
  {
    v6 = strerror(v5);
    v7 = _platform_strlen();
    return __printf_out((uint64_t)a1, a2, (uint64_t)v6, v7);
  }
}

uint64_t __printf_arginfo_float(uint64_t a1, uint64_t a2, int *a3)
{
  int v3;

  if (!a2)
    __printf_arginfo_float_cold_1();
  if (*(__int16 *)(a1 + 40) < 0)
  {
    v3 = 256;
  }
  else
  {
    *a3 = 128;
    if ((*(_WORD *)(a1 + 40) & 1) != 0)
      v3 = 65664;
    else
      v3 = 128;
  }
  *a3 = v3;
  return 1;
}

uint64_t __printf_render_float(uint64_t *a1, uint64_t a2, double **a3)
{
  int v6;
  _BYTE *fixed;
  uint64_t result;
  lconv *v9;
  char *decimal_point;
  uint64_t v11;
  int v12;
  int v13;
  BOOL v14;
  char v15;
  void *v16;
  uint64_t v17;
  char *v18;
  int v19;
  unsigned int v20;
  char *v21;
  unsigned int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  unsigned int v30;
  char v31;
  char *v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  _BYTE *v36;
  int v37;
  int v38;
  int v39;
  int v41;
  int v42;
  int v43;
  uint64_t v44;
  int v45;
  int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  BOOL v51;
  int v52;
  int v53;
  uint64_t v54;
  int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  int v62;
  int v63;
  char *v64;
  uint64_t v65;
  char *thousands_sep;
  char v67;
  char v68;
  double v69;
  char v70;
  char *v71;
  int v72;
  int v73;
  _BYTE v74[98];
  _BYTE v76[2];
  char v77;
  _BYTE v78[5];
  uint64_t vars0;

  if (*(__int16 *)(a2 + 40) < 0)
    return __xprintf_vector(a1, a2, (_DWORD **)a3);
  v6 = *(_DWORD *)(a2 + 20);
  v68 = 0;
  v70 = *(_DWORD *)(a2 + 36);
  thousands_sep = localeconv_l(*(locale_t *)(a2 + 8))->thousands_sep;
  v65 = _platform_strlen();
  if ((*(_WORD *)(a2 + 40) & 0x100) != 0)
  {
    v9 = localeconv_l(*(locale_t *)(a2 + 8));
    fixed = __fix_nogrouping(v9->grouping);
  }
  else
  {
    fixed = 0;
  }
  v72 = 0;
  v73 = 0;
  v71 = 0;
  v69 = 0.0;
  decimal_point = localeconv_l(*(locale_t *)(a2 + 8))->decimal_point;
  v11 = _platform_strlen();
  LOBYTE(v12) = 0;
  v13 = *(_DWORD *)(a2 + 28);
  v59 = (uint64_t)decimal_point;
  v60 = v11;
  switch(v13)
  {
    case 'A':
LABEL_9:
      v14 = v13 == 97;
      if (v13 == 97)
        v15 = 120;
      else
        v15 = 88;
      if (v14)
        LOBYTE(v12) = 112;
      else
        LOBYTE(v12) = 80;
      if (v14)
        v16 = &__lowercase_hex;
      else
        v16 = &__uppercase_hex;
      v68 = v15;
      v17 = v6 + (v6 >= 0);
      if ((*(_WORD *)(a2 + 40) & 1) != 0)
      {
        v69 = **a3;
        v18 = (char *)__hldtoa(v16, v17, &v73, &v72, &v71);
      }
      else
      {
        v18 = (char *)__hdtoa((uint64_t)v16, v17, &v73, &v72, &v71, **a3);
      }
      v21 = v18;
      if ((int)v17 >= 0)
        v19 = v17;
      else
        v19 = (_DWORD)v71 - (_DWORD)v18;
      if (v73 == 0x7FFFFFFF)
        v68 = 0;
      goto LABEL_45;
    case 'B':
    case 'C':
    case 'D':
LABEL_176:
      __printf_render_float_cold_1();
    case 'E':
LABEL_20:
      if (v6 >= 0)
        ++v6;
      else
        v6 = 7;
      v12 = *(_DWORD *)(a2 + 28);
      goto LABEL_26;
    case 'F':
      goto LABEL_26;
    case 'G':
LABEL_24:
      LOBYTE(v12) = v13 - 2;
      if (v6 <= 1)
        v6 = 1;
LABEL_26:
      if (v6 >= 0)
        v19 = v6;
      else
        v19 = 6;
      if ((*(_WORD *)(a2 + 40) & 1) != 0)
      {
        v69 = **a3;
        if ((_BYTE)v12)
          v22 = 2;
        else
          v22 = 3;
        v21 = __ldtoa(&v69, v22, v19, &v73, &v72, &v71);
      }
      else
      {
        if ((_BYTE)v12)
          v20 = 2;
        else
          v20 = 3;
        v21 = __dtoa(v20, v19, &v73, &v72, &v71, **a3);
        if (v73 == 9999)
          v73 = 0x7FFFFFFF;
      }
LABEL_45:
      if (v72)
        v70 = 45;
      v23 = v73;
      v64 = v21;
      if (v73 == 0x7FFFFFFF)
      {
        v61 = v12;
        v24 = *(_DWORD *)(a2 + 28);
        if (*v21 == 78)
        {
          v58 = 0;
          v25 = 0;
          v26 = 0;
          v27 = 0;
          if (v24 <= 96)
            v21 = "NAN";
          else
            v21 = "nan";
          v70 = 0;
        }
        else
        {
          v58 = 0;
          v25 = 0;
          v26 = 0;
          v27 = 0;
          if (v24 <= 96)
            v21 = "INF";
          else
            v21 = "inf";
        }
        v29 = 3;
        v62 = v19;
        goto LABEL_112;
      }
      LODWORD(v58) = (_DWORD)v71 - (_DWORD)v21;
      if ((*(_DWORD *)(a2 + 28) | 0x20) == 0x67)
      {
        if ((*(_WORD *)(a2 + 40) & 0x10) != 0)
          v28 = v19;
        else
          v28 = (_DWORD)v71 - (_DWORD)v21;
        if (v73 >= -3 && v73 <= v19)
        {
          v28 = (v28 - v73) & ~((v28 - v73) >> 31);
LABEL_79:
          if (v73 <= 0)
            v29 = 1;
          else
            v29 = v73;
          if (v28 || (*(_WORD *)(a2 + 40) & 0x10) != 0)
            v29 = (v29 + v28 + 1);
          v26 = 0;
          v62 = v28;
          if (fixed && v73 >= 1)
          {
            v25 = 0;
            v39 = (char)*fixed;
            if (v39 == 127 || v73 <= v39)
            {
              v26 = 0;
              v27 = v73;
            }
            else
            {
              v26 = 0;
              v25 = 0;
              v27 = v73;
              do
              {
                v27 -= v39;
                if (fixed[1])
                  ++v25;
                else
                  ++v26;
                if (fixed[1])
                  ++fixed;
                v39 = (char)*fixed;
              }
              while (v39 != 127 && v27 > v39);
            }
            v61 = 0;
            HIDWORD(v58) = 0;
            v29 = (v25 + v29 + v26);
          }
          else
          {
            HIDWORD(v58) = 0;
            v25 = 0;
            v61 = 0;
            v27 = v73;
          }
          goto LABEL_112;
        }
      }
      else
      {
        v28 = v19;
      }
      if (!(_BYTE)v12)
        goto LABEL_79;
      v30 = v73 - 1;
      v76[0] = v12;
      if (v73 >= 1)
        v31 = 43;
      else
        v31 = 45;
      if (v73 - 1 < 0)
        v30 = 1 - v73;
      v32 = &v77;
      v76[1] = v31;
      if (v30 < 0xA)
      {
        if ((v12 & 0xDF) == 0x45)
        {
          v32 = v78;
          v77 = 48;
        }
        *v32 = v30 + 48;
        LODWORD(v32) = (_DWORD)v32 + 1;
      }
      else
      {
        v33 = 0;
        do
        {
          v34 = v30;
          v30 /= 0xAu;
          v74[v33-- + 5] = (v34 - 10 * v30) | 0x30;
        }
        while (v34 > 0x63);
        v35 = v33 + 5;
        v74[v33 + 5] = v30 + 48;
        if (v33 + 7 <= 7)
        {
          v36 = &v76[-v33 - 2];
          v37 = v28;
          _platform_memmove();
          if (v35 <= 5)
            v38 = 5;
          else
            v38 = v35;
          v28 = v37;
          LODWORD(v32) = (_DWORD)v36 + v38;
        }
      }
      HIDWORD(v58) = (_DWORD)v32 - (&vars0 - 104);
      v29 = (v28 + HIDWORD(v58));
      v62 = v28;
      if (v28 > 1 || (*(_WORD *)(a2 + 40) & 0x10) != 0)
      {
        v25 = 0;
        v26 = 0;
        v27 = 0;
        v29 = (v29 + 1);
      }
      else
      {
        v25 = 0;
        v26 = 0;
        v27 = 0;
      }
      v61 = 1;
LABEL_112:
      if ((int)v29 < 0)
        v41 = -1;
      else
        v41 = v29;
      if (v70)
        ++v41;
      if (v68)
        v41 += 2;
      v63 = v41;
      if (*(_DWORD *)(a2 + 32) == 48 || (*(_WORD *)(a2 + 40) & 0x40) != 0)
      {
        v42 = 0;
        if (!v70)
          goto LABEL_125;
      }
      else
      {
        v42 = __printf_pad((uint64_t)a1, (*(_DWORD *)(a2 + 24) - v41), 0);
        if (!v70)
          goto LABEL_125;
      }
      v42 += __printf_puts((uint64_t)a1, (uint64_t)&v70, 1);
LABEL_125:
      if (v68)
      {
        v67 = 48;
        v42 += __printf_puts((uint64_t)a1, (uint64_t)&v67, 2);
      }
      if (*(_DWORD *)(a2 + 32) == 48 && (*(_WORD *)(a2 + 40) & 0x40) == 0)
        v42 += __printf_pad((uint64_t)a1, (*(_DWORD *)(a2 + 24) - v63), 1);
      v43 = __printf_pad((uint64_t)a1, ~(_DWORD)v29, 1) + v42;
      if (v23 == 0x7FFFFFFF)
      {
        v44 = __printf_puts((uint64_t)a1, (uint64_t)v21, v29) + v43;
LABEL_138:
        v48 = (uint64_t)v64;
        goto LABEL_139;
      }
      if (v61)
      {
        if (v62 > 1 || (*(_WORD *)(a2 + 40) & 0x10) != 0)
        {
          v74[0] = *v21;
          _platform_memmove();
          v46 = __printf_puts((uint64_t)a1, (uint64_t)v74, (v60 + 1));
          v47 = v46 + __printf_puts((uint64_t)a1, (uint64_t)(v21 + 1), (v58 - 1));
          v45 = v47 + __printf_pad((uint64_t)a1, (v62 - v58), 1) + v43;
        }
        else
        {
          v45 = __printf_puts((uint64_t)a1, (uint64_t)v21, 1) + v43;
        }
        v44 = __printf_puts((uint64_t)a1, (uint64_t)v76, HIDWORD(v58)) + v45;
        goto LABEL_138;
      }
      if (v73 <= 0)
      {
        v56 = __printf_puts((uint64_t)a1, (uint64_t)"0", 1) + v43;
        if (v62 || (*(_WORD *)(a2 + 40) & 0x10) != 0)
          v56 += __printf_puts((uint64_t)a1, v59, v60);
        v50 = __printf_pad((uint64_t)a1, -v73, 1) + v56;
        v55 = v73 + v62;
      }
      else
      {
        if (v27 >= (int)v71 - (int)v21)
          v49 = ((_DWORD)v71 - (_DWORD)v21);
        else
          v49 = v27;
        if ((int)v49 >= 1)
          v43 += __printf_puts((uint64_t)a1, (uint64_t)v21, v49);
        v50 = __printf_pad((uint64_t)a1, v27 - (v49 & ~((int)v49 >> 31)), 1) + v43;
        v21 += v27;
        if (fixed)
        {
          v51 = v26 > 0;
          if (v25 > 0 || v26 >= 1)
          {
            do
            {
              fixed -= !v51;
              v52 = __printf_puts((uint64_t)a1, (uint64_t)thousands_sep, v65) + v50;
              v53 = (char)*fixed;
              if ((int)v71 - (int)v21 >= v53)
                v54 = v53;
              else
                v54 = ((_DWORD)v71 - (_DWORD)v21);
              if ((int)v54 >= 1)
              {
                v52 += __printf_puts((uint64_t)a1, (uint64_t)v21, v54);
                v53 = (char)*fixed;
              }
              v25 -= !v51;
              v26 -= v51;
              v50 = __printf_pad((uint64_t)a1, v53 - (v54 & ~((int)v54 >> 31)), 1) + v52;
              v21 += (char)*fixed;
              v51 = v26 > 0;
            }
            while (v25 > 0 || v26 > 0);
          }
          if (v21 > v71)
            v21 = v71;
        }
        v55 = v62;
        if (v62 || (*(_WORD *)(a2 + 40) & 0x10) != 0)
          v50 += __printf_puts((uint64_t)a1, v59, v60);
        else
          v55 = 0;
      }
      if (v55 >= (int)v71 - (int)v21)
        v57 = ((_DWORD)v71 - (_DWORD)v21);
      else
        v57 = v55;
      if ((int)v57 >= 1)
        v50 += __printf_puts((uint64_t)a1, (uint64_t)v21, v57);
      v48 = (uint64_t)v64;
      v44 = __printf_pad((uint64_t)a1, v55 - (v57 & ~((int)v57 >> 31)), 1) + v50;
LABEL_139:
      if ((*(_WORD *)(a2 + 40) & 0x40) != 0)
        v44 = __printf_pad((uint64_t)a1, (*(_DWORD *)(a2 + 24) - v63), 0) + v44;
      __printf_flush(a1);
      if (v48)
        __freedtoa(v48);
      result = v44;
      break;
    default:
      switch(v13)
      {
        case 'a':
          goto LABEL_9;
        case 'e':
          goto LABEL_20;
        case 'f':
          goto LABEL_26;
        case 'g':
          goto LABEL_24;
        default:
          goto LABEL_176;
      }
  }
  return result;
}

uint64_t __printf_arginfo_hexdump(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  if (a2 <= 1)
    __printf_arginfo_hexdump_cold_1();
  *a3 = 0x100000020;
  return 2;
}

uint64_t __printf_render_hexdump(uint64_t *a1, uint64_t a2, unsigned __int8 ***a3)
{
  int v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned __int8 *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  int v15;
  int v16;
  char *v17;
  uint64_t v18;
  unsigned __int8 *v19;
  char v20;
  int v21;
  unsigned int v23;
  unsigned int v24;
  unsigned int v26;
  char v27;
  _BYTE v28[99];

  v3 = *(_DWORD *)(a2 + 24);
  v4 = v3 - 1;
  if ((v3 - 1) >= 0xF)
    v3 = 16;
  v26 = v3;
  v5 = *(_DWORD *)a3[1];
  if (!v5)
    return 0;
  v6 = a2;
  LODWORD(v7) = 0;
  v8 = 0;
  v9 = **a3;
  if (v4 >= 0xF)
    v4 = 15;
  v24 = v4;
  v23 = v4 + 1;
  do
  {
    if ((*(_WORD *)(v6 + 40) & 0x80) != 0)
      v10 = &v28[sprintf(&v27, " %04x", v8) - 1];
    else
      v10 = &v27;
    v11 = v6;
    if (v26 >= v5)
      v12 = v5;
    else
      v12 = v26;
    if ((_DWORD)v12)
    {
      v13 = v12;
      v14 = v9;
      do
      {
        v15 = *v14++;
        v10 += sprintf(v10, " %02x", v15);
        --v13;
      }
      while (v13);
    }
    v6 = v11;
    if ((*(_WORD *)(v11 + 40) & 0x10) != 0)
    {
      if (v26 > v5)
      {
        v16 = v23 - v12;
        do
        {
          *(_DWORD *)v10 = 2105376;
          v10 += 3;
          --v16;
        }
        while (v16);
      }
      *(_DWORD *)v10 = 8134688;
      v17 = v10 + 3;
      if ((_DWORD)v12)
      {
        v18 = v12;
        v19 = v9;
        do
        {
          v21 = *v19++;
          v20 = v21;
          if ((v21 - 127) < 0xFFFFFFA1)
            v20 = 46;
          *v17++ = v20;
          --v18;
        }
        while (v18);
      }
      if (v26 > v5)
      {
        _platform_memset();
        v17 += v24 - v12 + 1;
      }
      *v17 = 124;
      v10 = v17 + 1;
    }
    v5 -= v12;
    if (v5)
    {
      *v10 = 10;
      LODWORD(v10) = (_DWORD)v10 + 1;
    }
    v9 += v12;
    v8 += v12;
    v7 = __printf_puts((uint64_t)a1, (uint64_t)v28, v10 - v28)
       + v7;
    __printf_flush(a1);
  }
  while (v5);
  return v7;
}

uint64_t __printf_arginfo_int(uint64_t a1, uint64_t a2, int *a3)
{
  __int16 v3;
  int v4;

  if (!a2)
    __printf_arginfo_int_cold_1();
  *a3 = 1;
  if (*(__int16 *)(a1 + 40) < 0)
  {
    v4 = 256;
    goto LABEL_19;
  }
  v3 = *(_WORD *)(a1 + 40);
  v4 = 65537;
  if ((v3 & 0x2000) != 0)
  {
    v4 = 8388609;
    goto LABEL_19;
  }
  if ((*(_WORD *)(a1 + 40) & 0x4000) != 0)
  {
    v4 = 4194305;
    goto LABEL_19;
  }
  if ((v3 & 8) != 0)
  {
    v4 = 131073;
    goto LABEL_19;
  }
  if ((*(_WORD *)(a1 + 40) & 0x1000) != 0)
  {
    v4 = 2097153;
    goto LABEL_19;
  }
  if ((*(_WORD *)(a1 + 40) & 0x800) != 0)
  {
    v4 = 1048577;
    goto LABEL_19;
  }
  if ((v3 & 1) != 0)
  {
LABEL_19:
    *a3 = v4;
    return 1;
  }
  if ((v3 & 4) != 0)
  {
    v4 = 262145;
    goto LABEL_19;
  }
  if ((v3 & 2) != 0)
  {
    v4 = 2;
    goto LABEL_19;
  }
  return 1;
}

uint64_t __printf_render_int(uint64_t *a1, uint64_t a2, unint64_t **a3)
{
  int v6;
  __int16 v7;
  int v8;
  _BYTE *fixed;
  lconv *v11;
  uint64_t v12;
  int v13;
  _BYTE *v14;
  int v15;
  int v16;
  unint64_t *v17;
  __int16 v18;
  unsigned int v19;
  unint64_t v20;
  unint64_t *v21;
  __int16 v22;
  unint64_t v23;
  char *v24;
  BOOL v25;
  unint64_t v26;
  const char *v27;
  int v28;
  int v29;
  uint64_t v30;
  BOOL v31;
  _BYTE *v32;
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL4 v37;
  uint64_t v39;
  int v40;
  BOOL v41;
  int v42;
  int v43;
  int v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  int v53;
  unsigned int v54;
  int v55;
  int v56;
  char v57;
  _BYTE v58[126];
  char v59;
  char v60;

  v6 = *(__int16 *)(a2 + 40);
  if (v6 < 0)
    return __xprintf_vector(a1, a2, a3);
  v7 = *(_WORD *)(a2 + 40);
  v57 = 0;
  if ((v6 & 0x100) != 0)
  {
    localeconv_l(*(locale_t *)(a2 + 8));
    v8 = _platform_strlen();
    v11 = localeconv_l(*(locale_t *)(a2 + 8));
    fixed = __fix_nogrouping(v11->grouping);
  }
  else
  {
    v8 = 0;
    fixed = 0;
  }
  v12 = *(unsigned int *)(a2 + 28);
  if ((int)v12 > 104)
  {
    if ((int)v12 <= 116)
    {
      if ((_DWORD)v12 != 105)
      {
        if ((_DWORD)v12 != 111)
          goto LABEL_137;
        goto LABEL_14;
      }
LABEL_17:
      v17 = *a3;
      v57 = *(_DWORD *)(a2 + 36);
      v18 = *(_WORD *)(a2 + 40);
      if ((v18 & 0x7801) != 0 || (v18 & 8) != 0)
      {
        v20 = *v17;
        if ((*v17 & 0x8000000000000000) == 0)
        {
          v13 = 0;
          v16 = 0;
          goto LABEL_47;
        }
        v13 = 0;
        v16 = 0;
        v20 = -(uint64_t)v20;
      }
      else if ((v18 & 4) != 0)
      {
        v54 = *(_DWORD *)v17;
        v13 = 0;
        v16 = 0;
        if (((v54 << 16) & 0x80000000) == 0)
        {
          v19 = (unsigned __int16)v54;
          v15 = 10;
          v14 = &__lowercase_hex;
          goto LABEL_129;
        }
        v20 = -(__int16)v54;
      }
      else
      {
        v19 = *(_DWORD *)v17;
        if ((v18 & 2) != 0)
        {
          if (((v19 << 24) & 0x80000000) == 0)
          {
            v16 = 0;
            v13 = 0;
            v14 = &__lowercase_hex;
            v15 = 10;
            goto LABEL_35;
          }
          v13 = 0;
          v16 = 0;
          v20 = -(char)v19;
        }
        else
        {
          if ((v19 & 0x80000000) == 0)
          {
            v16 = 0;
            v13 = 0;
            v14 = &__lowercase_hex;
            v15 = 10;
            goto LABEL_129;
          }
          v13 = 0;
          v16 = 0;
          v20 = -v19;
        }
      }
      v57 = 45;
      goto LABEL_47;
    }
    if ((_DWORD)v12 == 117)
    {
LABEL_26:
      v16 = 0;
      v13 = 0;
      v14 = &__lowercase_hex;
      v15 = 10;
      goto LABEL_31;
    }
    if ((_DWORD)v12 != 120)
      goto LABEL_137;
    v16 = 0;
    v14 = &__lowercase_hex;
LABEL_30:
    v15 = 16;
    v13 = 1;
    goto LABEL_31;
  }
  if ((int)v12 > 87)
  {
    if ((_DWORD)v12 != 88)
    {
      if ((_DWORD)v12 != 100)
        goto LABEL_137;
      goto LABEL_17;
    }
    v16 = 0;
    v14 = &__uppercase_hex;
    goto LABEL_30;
  }
  if ((_DWORD)v12 != 79)
  {
    if ((_DWORD)v12 != 85)
LABEL_137:
      __printf_render_int_cold_1(v12);
    goto LABEL_26;
  }
LABEL_14:
  v13 = 0;
  v14 = &__lowercase_hex;
  v15 = 8;
  v16 = 1;
LABEL_31:
  v21 = *a3;
  v22 = *(_WORD *)(a2 + 40);
  if ((v22 & 0x7801) != 0 || (v22 & 8) != 0)
  {
    v20 = *v21;
    goto LABEL_37;
  }
  if ((v22 & 4) != 0)
  {
    v19 = *(unsigned __int16 *)v21;
    goto LABEL_129;
  }
  v19 = *(_DWORD *)v21;
  if ((v22 & 2) == 0)
  {
LABEL_129:
    v20 = v19;
    goto LABEL_37;
  }
LABEL_35:
  v20 = v19;
LABEL_37:
  if (v15 == 8)
  {
    v26 = v20;
    v24 = &v60;
    do
    {
      *--v24 = v26 & 7 | 0x30;
      v25 = v26 >= 8;
      v26 >>= 3;
    }
    while (v25);
    goto LABEL_49;
  }
  if (v15 != 10)
  {
    v23 = v20;
    v24 = &v60;
    do
    {
      *--v24 = v14[v23 & 0xF];
      v25 = v23 >= 0x10;
      v23 >>= 4;
    }
    while (v25);
    goto LABEL_49;
  }
LABEL_47:
  if (v20 > 9)
  {
    v55 = v16;
    v56 = v13;
    if ((v20 & 0x8000000000000000) != 0)
    {
      v24 = &v59;
      v59 = (v20 % 0xA) | 0x30;
      v29 = 1;
      v20 /= 0xAuLL;
    }
    else
    {
      v29 = 0;
      v24 = &v60;
    }
    v30 = -(uint64_t)v8;
    do
    {
      *--v24 = (v20 % 0xA) | 0x30;
      ++v29;
      if ((v7 & 0x100) != 0 && v29 == (char)*fixed)
      {
        v31 = *fixed == 127 || (uint64_t)v20 < 10;
        if (!v31)
        {
          v24 += v30;
          _platform_memmove();
          v29 = 0;
          if (fixed[1])
            ++fixed;
        }
      }
      v25 = v20 >= 0xA;
      v20 /= 0xAuLL;
    }
    while (v25);
    v16 = v55;
    v13 = v56;
LABEL_50:
    if ((*(_WORD *)(a2 + 40) & 0x10) != 0)
    {
      if (v16)
        *--v24 = 48;
      if (v13)
      {
        if (*(_DWORD *)(a2 + 28) == 120)
          v27 = "0x";
        else
          v27 = "0X";
        v28 = 2;
        goto LABEL_74;
      }
    }
LABEL_73:
    v28 = 0;
    v27 = 0;
    goto LABEL_74;
  }
  v24 = &v59;
  v59 = v20 + 48;
LABEL_49:
  if (v20)
    goto LABEL_50;
  if (*(_DWORD *)(a2 + 20))
    goto LABEL_73;
  v28 = 0;
  v27 = 0;
  if ((v16 & ((*(_WORD *)(a2 + 40) & 0x10) >> 4)) == 0)
    v24 = &v60;
LABEL_74:
  v32 = (_BYTE *)(&v60 - v24);
  v33 = &v60 - (_DWORD)v24 + v28;
  if (v57)
    v34 = v33 + 1;
  else
    v34 = v33;
  v35 = *(int *)(a2 + 20);
  if ((uint64_t)v32 >= v35)
  {
    if ((_DWORD)v35 != -1
      || *(_DWORD *)(a2 + 32) != 48
      || (v40 = *(_DWORD *)(a2 + 24), v41 = __OFSUB__(v40, v34), v42 = v40 - v34, (v42 < 0) ^ v41 | (v42 == 0)))
    {
      v36 = 0;
      v37 = 0;
      goto LABEL_94;
    }
    if ((*(_WORD *)(a2 + 40) & 0x40) != 0)
      v36 = 0;
    else
      v36 = v42;
  }
  else
  {
    v36 = (v35 - (_DWORD)v32);
  }
  v34 += v36;
  v37 = (int)v36 > 0;
  if (v24 > v58 && (int)v36 >= 1)
  {
    _platform_memset();
    do
    {
      --v24;
      v39 = (v36 - 1);
      v37 = v36 > 1;
      if (v24 <= v58)
        break;
      v31 = v36 > 1;
      LODWORD(v36) = v36 - 1;
    }
    while (v31);
    v36 = v39;
  }
LABEL_94:
  if (v34 > 127)
  {
    if ((*(_WORD *)(a2 + 40) & 0x40) != 0 || (v43 = *(_DWORD *)(a2 + 24), v43 <= v34))
      v44 = 0;
    else
      v44 = __printf_pad((uint64_t)a1, (v43 - v34), 0);
    if (v57)
    {
      v45 = &v57;
      v46 = (uint64_t)a1;
      v47 = 1;
    }
    else
    {
      if (!v27)
        goto LABEL_119;
      v46 = (uint64_t)a1;
      v45 = (char *)v27;
      v47 = 2;
    }
    v44 += __printf_puts(v46, (uint64_t)v45, v47);
LABEL_119:
    if (v37)
      v44 += __printf_pad((uint64_t)a1, v36, 1);
    goto LABEL_121;
  }
  if (v57)
  {
    *--v24 = v57;
  }
  else if (v27)
  {
    *(v24 - 1) = v27[1];
    *(v24 - 2) = *v27;
    v24 -= 2;
  }
  v48 = *(int *)(a2 + 24);
  if (&v60 - v24 >= v48 || (*(_WORD *)(a2 + 40) & 0x40) != 0)
    goto LABEL_115;
  v49 = v48 - (&v60 - (_DWORD)v24);
  if (v24 > v58 && (int)v49 >= 1)
  {
    v50 = (_DWORD)v48 + (_DWORD)v24 - v58 - 128;
    if ((unint64_t)&v24[~(unint64_t)v58] >= v50)
      v51 = (_DWORD)v48 + (_DWORD)v24 - v58 - 128;
    else
      v51 = (unint64_t)&v24[~(unint64_t)v58];
    v24 += ~v51;
    _platform_memset();
    v49 = (v50 - v51);
  }
  if (!(_DWORD)v49)
LABEL_115:
    v44 = 0;
  else
    v44 = __printf_pad((uint64_t)a1, v49, 0);
LABEL_121:
  v52 = __printf_puts((uint64_t)a1, (uint64_t)v24, &v60 - v24) + v44;
  v53 = *(_DWORD *)(a2 + 24);
  if (v53 > (int)v52 && (*(_WORD *)(a2 + 40) & 0x40) != 0)
    v52 = __printf_pad((uint64_t)a1, (v53 - v52), 0) + v52;
  __printf_flush(a1);
  return v52;
}

uint64_t __printf_arginfo_ptr(uint64_t a1, uint64_t a2, int *a3)
{
  int v3;

  if (!a2)
    __printf_arginfo_ptr_cold_1();
  if (*(__int16 *)(a1 + 40) < 0)
    v3 = 256;
  else
    v3 = 32;
  *a3 = v3;
  return 1;
}

uint64_t __printf_render_ptr(uint64_t *a1, __int128 *a2, uint64_t **a3)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  unint64_t *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  if (*((__int16 *)a2 + 20) < 0)
    return __xprintf_vector(a1, a2, a3);
  v3 = **a3;
  v4 = a2[3];
  v11 = a2[2];
  v12 = v4;
  v13 = a2[4];
  v14 = *((_QWORD *)a2 + 10);
  v5 = a2[1];
  v9 = *a2;
  v10 = v5;
  HIDWORD(v10) = 120;
  WORD4(v11) |= 0x11u;
  v7 = (unint64_t *)&v8;
  v8 = v3;
  return __printf_render_int(a1, (uint64_t)&v9, &v7);
}

uint64_t __printf_arginfo_quote(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!a2)
    __printf_arginfo_quote_cold_1();
  *a3 = 32;
  return 1;
}

uint64_t __printf_render_quote(uint64_t a1, uint64_t a2, unsigned __int8 ***a3)
{
  uint64_t v3;
  uint64_t *v4;
  unsigned __int8 *v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  __uint32_t v10;
  int v11;
  int v12;
  char v13;
  unsigned __int8 *v14;
  int v15;
  char *v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  const char *v22;
  uint64_t v23;
  int v24;
  char v25[5];

  v3 = a2;
  v4 = (uint64_t *)a1;
  v5 = **a3;
  if (!v5)
  {
    v22 = "\"(null)\"";
    v23 = 8;
    return __printf_out(a1, a2, (uint64_t)v22, v23);
  }
  LOBYTE(v6) = *v5;
  if (!*v5)
  {
    v22 = "\"\"";
    v23 = 2;
    return __printf_out(a1, a2, (uint64_t)v22, v23);
  }
  v7 = 0;
  v8 = 1;
  do
  {
    v9 = (char)v6;
    if ((v6 & 0x80) != 0)
      v10 = ___runetype((char)v6);
    else
      v10 = _DefaultRuneLocale.__runetype[(char)v6];
    v11 = (v10 >> 14) & 1;
    if (v9 == 92)
      v11 = 1;
    if (v9 == 34)
      v11 = 1;
    v7 += v11;
    v6 = v5[v8++];
  }
  while (v6);
  if (!v7)
  {
    v23 = _platform_strlen();
    a1 = (uint64_t)v4;
    a2 = v3;
    v22 = (const char *)v5;
    return __printf_out(a1, a2, (uint64_t)v22, v23);
  }
  v12 = __printf_out((uint64_t)v4, v3, (uint64_t)"\"", 1);
  v13 = *v5;
  if (!*v5)
    goto LABEL_38;
  v14 = v5 + 1;
  v15 = (int)v5;
  do
  {
    if (v13 <= 0x1Fu)
    {
      switch(v13)
      {
        case 9:
          v16 = "\\t";
          goto LABEL_32;
        case 10:
          v16 = "\\n";
          goto LABEL_32;
        case 13:
          v16 = "\\r";
          goto LABEL_32;
      }
LABEL_23:
      v17 = v13;
      if (v13 < 0)
      {
        if ((___runetype(v13) & 0x4000) == 0)
          goto LABEL_35;
      }
      else if ((_DefaultRuneLocale.__runetype[v13] & 0x4000) == 0)
      {
        goto LABEL_35;
      }
      v24 = v17;
      v16 = v25;
      sprintf(v25, "\\%03o", v24);
      goto LABEL_32;
    }
    if (v13 == 32)
    {
      v16 = " ";
      goto LABEL_32;
    }
    if (v13 == 34)
    {
      v16 = "\\\"";
      goto LABEL_32;
    }
    v16 = "\\\\";
    if (v13 != 92)
      goto LABEL_23;
LABEL_32:
    if (v14 - 1 != v5)
      v12 += __printf_out((uint64_t)v4, v3, (uint64_t)v5, (v15 - (_DWORD)v5));
    v18 = _platform_strlen();
    v12 += __printf_out((uint64_t)v4, v3, (uint64_t)v16, v18);
    v5 = v14;
LABEL_35:
    v19 = *v14++;
    v13 = v19;
    ++v15;
  }
  while (v19);
  if (v14 - 1 != v5)
    v12 += __printf_out((uint64_t)v4, v3, (uint64_t)v5, (v15 - (_DWORD)v5));
LABEL_38:
  v20 = __printf_out((uint64_t)v4, v3, (uint64_t)"\"", 1) + v12;
  __printf_flush(v4);
  return v20;
}

uint64_t __printf_arginfo_str(uint64_t a1, uint64_t a2, int *a3)
{
  int v3;

  if (!a2)
    __printf_arginfo_str_cold_1();
  v3 = 16;
  if ((*(_WORD *)(a1 + 40) & 8) == 0)
  {
    if (*(_DWORD *)(a1 + 28) == 67)
      v3 = 16;
    else
      v3 = 8;
  }
  *a3 = v3;
  return 1;
}

uint64_t __printf_render_str(uint64_t a1, uint64_t a2, const __int32 ***a3)
{
  uint64_t v3;
  uint64_t *v4;
  const __int32 *v5;
  size_t v6;
  _xlocale *v7;
  size_t v8;
  const __int32 *v9;
  int v10;
  int v11;
  uint64_t v13;
  const char *v14;
  size_t v16;
  __int32 v17;
  size_t v18;
  char *v20;
  char *v21;
  size_t v22;
  uint64_t v23;
  uint64_t v24;
  __int32 *v25;
  char v26[6];
  mbstate_t v27;

  v3 = a2;
  v4 = (uint64_t *)a1;
  if ((*(_WORD *)(a2 + 40) & 8) == 0 && *(_DWORD *)(a2 + 28) != 83)
  {
    v9 = **a3;
    if (v9)
    {
      v10 = _platform_strlen();
      v11 = *(_DWORD *)(v3 + 20);
      if (v11 >= v10 || v11 <= -1)
        v13 = v10;
      else
        v13 = v11;
      a1 = (uint64_t)v4;
      a2 = v3;
      v14 = (const char *)v9;
      return __printf_out(a1, a2, (uint64_t)v14, v13);
    }
LABEL_15:
    v14 = "(null)";
    v13 = 6;
    return __printf_out(a1, a2, (uint64_t)v14, v13);
  }
  v5 = **a3;
  if (!v5)
    goto LABEL_15;
  v6 = *(unsigned int *)(a2 + 20);
  v7 = *(_xlocale **)(a2 + 8);
  memset(&v27, 0, sizeof(v27));
  v25 = 0;
  if ((v6 & 0x80000000) != 0)
  {
    v25 = (__int32 *)v5;
    memset(&v27, 0, sizeof(v27));
    v8 = wcsrtombs_l(0, (const __int32 **)&v25, 0, &v27, v7);
    if (v8 == -1)
      return 0xFFFFFFFFLL;
  }
  else if (v6 > 0x7F)
  {
    v16 = 0;
    v25 = (__int32 *)v5;
    memset(&v27, 0, sizeof(v27));
    do
    {
      v8 = v16;
      v17 = *v25++;
      v18 = wcrtomb_l(v26, v17, &v27, v7);
      v16 = v18 + v8;
    }
    while (v18 + 1 >= 2 && (int)v6 >= (int)v16);
  }
  else
  {
    v8 = v6;
  }
  v20 = (char *)malloc_type_malloc(v8 + 1, 0xD1E79035uLL);
  if (!v20)
    return 0xFFFFFFFFLL;
  v21 = v20;
  v25 = (__int32 *)v5;
  memset(&v27, 0, sizeof(v27));
  v22 = wcsrtombs_l(v20, (const __int32 **)&v25, v8, &v27, v7);
  if (v22 == -1)
  {
    free(v21);
    return 0xFFFFFFFFLL;
  }
  v21[v22] = 0;
  v23 = _platform_strlen();
  v24 = __printf_out((uint64_t)v4, v3, (uint64_t)v21, v23);
  __printf_flush(v4);
  free(v21);
  return v24;
}

uint64_t __printf_arginfo_chr(uint64_t a1, uint64_t a2, int *a3)
{
  int v3;

  if (!a2)
    __printf_arginfo_chr_cold_1();
  if (*(__int16 *)(a1 + 40) < 0)
  {
    v3 = 256;
  }
  else
  {
    v3 = 4;
    if ((*(_WORD *)(a1 + 40) & 8) == 0)
    {
      if (*(_DWORD *)(a1 + 28) == 67)
        v3 = 4;
      else
        v3 = 1;
    }
  }
  *a3 = v3;
  return 1;
}

uint64_t __printf_render_chr(uint64_t *a1, uint64_t a2)
{
  __int32 **v4;
  __int128 v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  int v9;
  __int32 v10;
  size_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;
  char v19;
  mbstate_t v20;

  v19 = 0;
  memset(&v20, 0, sizeof(v20));
  MEMORY[0x1E0C86820](a1, a2);
  v7 = (char *)&v18 - ((v6 + 15) & 0x1FFFFFFF0);
  v9 = *(__int16 *)(v8 + 40);
  if (v9 < 0)
    return __xprintf_vector(a1, a2, v4);
  if ((v9 & 8) == 0 && *(_DWORD *)(a2 + 28) != 67)
  {
    v19 = **v4;
    v15 = &v19;
    v13 = (uint64_t)a1;
    v14 = a2;
    v12 = 1;
    goto LABEL_9;
  }
  v10 = **v4;
  *(_OWORD *)v20.__mbstate8 = v5;
  *((_OWORD *)&v20._mbstateL + 1) = v5;
  *((_OWORD *)&v20._mbstateL + 2) = v5;
  *((_OWORD *)&v20._mbstateL + 3) = v5;
  *((_OWORD *)&v20._mbstateL + 4) = v5;
  *((_OWORD *)&v20._mbstateL + 5) = v5;
  *((_OWORD *)&v20._mbstateL + 6) = v5;
  *((_OWORD *)&v20._mbstateL + 7) = v5;
  v11 = wcrtomb_l(v7, v10, &v20, *(locale_t *)(a2 + 8));
  if (v11 != -1)
  {
    v12 = v11;
    v13 = (uint64_t)a1;
    v14 = a2;
    v15 = v7;
LABEL_9:
    v16 = __printf_out(v13, v14, (uint64_t)v15, v12);
    __printf_flush(a1);
    return v16;
  }
  return 0xFFFFFFFFLL;
}

uint64_t __printf_arginfo_time(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!a2)
    __printf_arginfo_time_cold_1();
  *a3 = 32;
  return 1;
}

uint64_t __printf_render_time(uint64_t *a1, uint64_t a2, uint64_t **a3)
{
  __int16 v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  int v16;
  uint64_t v18;
  char v20[100];

  v5 = *(_WORD *)(a2 + 40);
  if ((v5 & 8) != 0)
  {
    v9 = **a3;
    v8 = 1000 * *(_DWORD *)(v9 + 8);
    v10 = *(_QWORD *)v9;
    v7 = 6;
  }
  else
  {
    v6 = **a3;
    if ((v5 & 1) != 0)
    {
      v8 = *(_DWORD *)(v6 + 8);
      v7 = 9;
    }
    else
    {
      v7 = 0;
      v8 = 0;
    }
    v10 = *(_QWORD *)v6;
    if ((v5 & 9) == 0)
      goto LABEL_11;
  }
  if (*(int *)(a2 + 20) >= 0)
    v7 = *(_DWORD *)(a2 + 20);
  if (!v7)
    v8 = 0;
LABEL_11:
  if ((v5 & 0x10) == 0)
  {
    v11 = v20;
    v12 = sprintf(v20, "%jd");
    goto LABEL_34;
  }
  if (v10 <= 31535999)
  {
    v11 = v20;
    LODWORD(v13) = v10;
    if (v10 <= 86399)
    {
      if (v10 <= 3599)
      {
        v14 = v10;
        if (v10 <= 59)
          goto LABEL_27;
        goto LABEL_26;
      }
      goto LABEL_22;
    }
    goto LABEL_18;
  }
  v11 = &v20[sprintf(v20, "%jdy", v10 / 0x1E13380uLL)];
  v13 = v10 % 0x1E13380uLL;
  if (v7 || v13)
  {
LABEL_18:
    v11 += sprintf(v11, "%jdd", v13 / 0x15180uLL);
    v13 = v13 % 0x15180;
    if (v7)
      goto LABEL_22;
  }
  if (!v13)
  {
LABEL_23:
    if (!v13)
    {
      v14 = 0;
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_22:
  v11 += sprintf(v11, "%jdh", v13 / 0xE10uLL);
  v13 = v13 % 0xE10;
  if (!v7)
    goto LABEL_23;
LABEL_26:
  v11 += sprintf(v11, "%jdm", (unsigned __int16)v13 / 0x3Cu);
  v14 = (unsigned __int16)v13 % 0x3Cu;
LABEL_27:
  if (!v7 && !v14 && v10 != 0)
    goto LABEL_40;
  v12 = sprintf(v11, "%jds");
LABEL_34:
  v11 += v12;
  if (v7)
  {
    if (v7 <= 8)
    {
      v16 = v7 - 9;
      do
        v8 /= 10;
      while (!__CFADD__(v16++, 1));
    }
    LODWORD(v11) = (_DWORD)v11 + sprintf(v11, ".%.*d", v7, v8);
  }
LABEL_40:
  v18 = __printf_out((uint64_t)a1, a2, (uint64_t)v20, v11 - v20);
  __printf_flush(a1);
  return v18;
}

uint64_t __printf_arginfo_vis(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!a2)
    __printf_arginfo_vis_cold_1();
  *a3 = 32;
  return 1;
}

uint64_t __printf_render_vis(uint64_t *a1, uint64_t a2, const char ***a3)
{
  const char *v5;
  unsigned int v6;
  char *v7;
  char *v8;
  __int16 v9;
  size_t v10;
  const char *v11;
  int v12;
  uint64_t v14;
  uint64_t v15;

  v5 = **a3;
  if (!v5)
    return __printf_out((uint64_t)a1, a2, (uint64_t)"(null)", 6);
  v6 = *(_DWORD *)(a2 + 20);
  if ((v6 & 0x80000000) != 0)
    v6 = _platform_strlen();
  v7 = (char *)malloc_type_malloc((4 * v6) | 1, 0x67A33A66uLL);
  if (!v7)
    return 0xFFFFFFFFLL;
  v8 = v7;
  v9 = *(_WORD *)(a2 + 40);
  if ((v9 & 0x80) != 0)
  {
    v10 = v6;
    v11 = v5;
    v12 = 156;
  }
  else if (*(_DWORD *)(a2 + 32) == 48)
  {
    v10 = v6;
    v11 = v5;
    v12 = 29;
  }
  else
  {
    v10 = v6;
    v11 = v5;
    if ((v9 & 0x10) != 0)
      v12 = 28;
    else
      v12 = 31;
  }
  v15 = strvisx(v7, v11, v10, v12);
  v14 = __printf_out((uint64_t)a1, a2, (uint64_t)v8, v15) + v15;
  __printf_flush(a1);
  free(v8);
  return v14;
}

uint64_t __printf_flush(uint64_t *a1)
{
  uint64_t result;

  result = __sfvwrite(*a1, (uint64_t)(a1 + 1));
  a1[19] = (uint64_t)(a1 + 3);
  a1[1] = (uint64_t)(a1 + 3);
  a1[2] = 0;
  return result;
}

uint64_t __printf_puts(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  int v6;
  int v7;

  if ((_DWORD)a3)
  {
    v5 = *(_QWORD **)(a1 + 152);
    *v5 = a2;
    v5[1] = (int)a3;
    v6 = *(_DWORD *)(a1 + 16);
    v7 = *(_DWORD *)(a1 + 20) + a3;
    *(_QWORD *)(a1 + 152) = v5 + 2;
    *(_DWORD *)(a1 + 16) = v6 + 1;
    *(_DWORD *)(a1 + 20) = v7;
    if (v6 >= 7)
    {
      __sfvwrite(*(_QWORD *)a1, a1 + 8);
      *(_QWORD *)(a1 + 152) = a1 + 24;
      *(_QWORD *)(a1 + 8) = a1 + 24;
      *(_QWORD *)(a1 + 16) = 0;
    }
  }
  return a3;
}

uint64_t __printf_pad(uint64_t a1, uint64_t a2, int a3)
{
  void *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  int v8;

  if (a3)
    v3 = &zeroes_1;
  else
    v3 = &blanks_1;
  if ((int)a2 < 1)
    return 0;
  v4 = a2;
  if (a2 < 0x11)
  {
    v8 = 0;
  }
  else
  {
    v6 = 0;
    do
    {
      __printf_puts(a1, (uint64_t)v3, 16);
      v6 -= 16;
      v7 = (v4 + v6);
    }
    while ((v7 + 16) > 0x20);
    v8 = -v6;
    v4 = v7;
  }
  __printf_puts(a1, (uint64_t)v3, v4);
  return (v8 + v4);
}

uint64_t __printf_out(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8;
  int v9;
  uint64_t v10;
  int v11;

  if ((*(_WORD *)(a2 + 40) & 0x40) != 0 || (v8 = *(_DWORD *)(a2 + 24), v8 <= (int)a4))
    v9 = 0;
  else
    v9 = __printf_pad(a1, (v8 - a4), *(_DWORD *)(a2 + 32) == 48);
  __printf_puts(a1, a3, a4);
  v10 = (v9 + a4);
  if ((*(_WORD *)(a2 + 40) & 0x40) != 0)
  {
    v11 = *(_DWORD *)(a2 + 24);
    if (v11 > (int)a4)
      return __printf_pad(a1, (v11 - a4), *(_DWORD *)(a2 + 32) == 48) + v10;
  }
  return v10;
}

uint64_t __printf_arginfo_pct()
{
  return 0;
}

uint64_t __printf_render_pct(uint64_t a1)
{
  return __printf_puts(a1, (uint64_t)"%", 1);
}

uint64_t __printf_arginfo_n(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!a2)
    __printf_arginfo_n_cold_1();
  *a3 = 32;
  return 1;
}

uint64_t __printf_render_n(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _BYTE *v3;
  __int16 v4;
  uint64_t v5;
  int v6;
  int v7;

  v3 = (_BYTE *)*a3;
  v4 = *(_WORD *)(a2 + 40);
  if ((v4 & 2) != 0)
  {
    v6 = *(_DWORD *)(a2 + 44);
    if (off_1EDF54E20)
      off_1EDF54E20(*a3, 1);
    *v3 = v6;
  }
  else if ((v4 & 4) != 0)
  {
    v7 = *(_DWORD *)(a2 + 44);
    if (off_1EDF54E20)
      off_1EDF54E20(*a3, 2);
    *(_WORD *)v3 = v7;
  }
  else
  {
    if ((v4 & 8) != 0
      || (v4 & 1) != 0
      || (*(_WORD *)(a2 + 40) & 0x1000) != 0
      || (*(_WORD *)(a2 + 40) & 0x2000) != 0
      || (*(_WORD *)(a2 + 40) & 0x800) != 0)
    {
      v5 = *(int *)(a2 + 44);
    }
    else
    {
      LODWORD(v5) = *(_DWORD *)(a2 + 44);
      if ((*(_WORD *)(a2 + 40) & 0x4000) == 0)
      {
        if (off_1EDF54E20)
          off_1EDF54E20(*a3, 4);
        *(_DWORD *)v3 = v5;
        return 0;
      }
      v5 = (int)v5;
    }
    if (off_1EDF54E20)
      off_1EDF54E20(*a3, 8);
    *(_QWORD *)v3 = v5;
  }
  return 0;
}

uint64_t __printf_comp(uint64_t a1, uint64_t a2)
{
  _BYTE *v4;
  void *v5;
  void *v6;
  char *v7;
  char *v8;
  int v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  char *v17;
  __int16 v18;
  __int16 v19;
  int v20;
  char *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  char v28;
  int v29;
  unsigned int v30;
  int v31;
  __int16 v32;
  int v33;
  int v34;
  int v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(char *, uint64_t, char *);
  char *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t result;
  int v53;
  uint64_t v54;
  void *v55[2];
  void *v56[2];

  v4 = *(_BYTE **)(a1 + 64);
  v5 = malloc_type_calloc(8uLL, 0x58uLL, 0x34914BBAuLL);
  v56[0] = v5;
  if (!v5)
    return 0xFFFFFFFFLL;
  v6 = v5;
  v56[1] = (void *)0x800000058;
  v55[0] = malloc_type_calloc(8uLL, 4uLL, 0x34914BBAuLL);
  if (!v55[0])
  {
    v45 = v6;
    goto LABEL_110;
  }
  v54 = a2;
  v55[1] = (void *)0x800000004;
  v7 = arrayget(v56, 0);
  if (!v7)
    goto LABEL_109;
  v8 = v7;
  v9 = 0;
  v53 = 0;
  v10 = 1;
LABEL_5:
  if (!*v4)
    goto LABEL_97;
  *((_DWORD *)v8 + 8) = 32;
  *((_QWORD *)v8 + 2) = -4294967208;
  v11 = v4 + 1;
  *((_QWORD *)v8 + 7) = v4;
  for (*((_QWORD *)v8 + 8) = v4; ; *((_QWORD *)v8 + 8) = v11++)
  {
    if (!*(v11 - 1))
    {
      v8 += 88;
LABEL_97:
      if ((int)v10 <= v9)
        v46 = v9;
      else
        v46 = v10;
      v47 = v55[0];
      *(_QWORD *)(a1 + 96) = v8;
      *(_QWORD *)(a1 + 104) = v47;
      v48 = (char *)v56[0];
      *(void **)(a1 + 88) = v56[0];
      *(_DWORD *)(a1 + 120) = v46;
      if (v46 <= 1)
        v46 = 1;
      v49 = (char *)malloc_type_malloc(16 * v46, 0x1092040C99D0F4CuLL);
      *(_QWORD *)(a1 + 112) = v49;
      if (!v49)
        goto LABEL_109;
      while (v48 < v8)
      {
        v50 = *((_QWORD *)v48 + 9);
        if (v50)
          *((_QWORD *)v48 + 9) = &v49[16 * v50];
        v51 = *((_QWORD *)v48 + 10);
        if (v51)
          *((_QWORD *)v48 + 10) = &v49[16 * v51];
        v48 += 88;
      }
      result = 0;
      *(_QWORD *)(a1 + 72) = v54;
      return result;
    }
    if (*(v11 - 1) == 37)
      break;
  }
  while (2)
  {
    while (1)
    {
      v12 = *v11;
      *((_DWORD *)v8 + 7) = v12;
      if ((int)v12 > 94)
        break;
      switch((int)v12)
      {
        case ' ':
          v19 = *((_WORD *)v8 + 20);
          if ((v19 & 0x80) != 0)
            goto LABEL_59;
          *((_WORD *)v8 + 20) = v19 | 0x20;
          v20 = 32;
          goto LABEL_56;
        case '#':
          v18 = *((_WORD *)v8 + 20) | 0x10;
          goto LABEL_58;
        case '\'':
          v18 = *((_WORD *)v8 + 20) | 0x100;
          goto LABEL_58;
        case '*':
          v21 = v11 + 1;
          v22 = v11[1];
          if (!v11[1])
            goto LABEL_73;
          v23 = v22 - 48;
          if ((v22 - 48) > 9)
          {
            v24 = 0;
            v26 = v11[1];
          }
          else
          {
            v24 = 0;
            v21 = v11 + 2;
            do
            {
              v25 = *v21;
              if (!*v21)
                goto LABEL_73;
              v24 = v23 + 10 * v24;
              v23 = v25 - 48;
              ++v21;
            }
            while ((v25 - 48) <= 9);
            v26 = v25;
            v11 = v21 - 2;
            --v21;
          }
          if (v26 != 36)
          {
LABEL_73:
            v36 = (v10 + 1);
            v11 = v21;
            goto LABEL_74;
          }
          if (v24 >= v9)
            v9 = v24 + 1;
          v11 += 2;
          v36 = v10;
          LODWORD(v10) = v24;
LABEL_74:
          *((_DWORD *)v8 + 12) = v10;
          goto LABEL_83;
        case '+':
          *((_WORD *)v8 + 20) |= 0x80u;
          v20 = 43;
LABEL_56:
          *((_DWORD *)v8 + 9) = v20;
          goto LABEL_59;
        case ',':
        case ':':
        case ';':
          goto LABEL_30;
        case '-':
          v18 = *((_WORD *)v8 + 20) | 0x40;
          goto LABEL_58;
        case '.':
          *((_DWORD *)v8 + 5) = 0;
          v17 = v11 + 1;
          v27 = v11[1];
          if (v27 == 42)
          {
            v28 = v11[2];
            if (v28)
            {
              v29 = 0;
              v11 += 3;
              while (1)
              {
                v30 = v28 - 48;
                if (v30 > 9)
                  break;
                v29 = v30 + 10 * v29;
                v31 = *v11++;
                v28 = v31;
                if (!v31)
                  goto LABEL_80;
              }
              if (v28 != 36)
              {
LABEL_80:
                --v11;
                goto LABEL_81;
              }
              if (v29 >= v9)
                v9 = v29 + 1;
              v36 = v10;
              LODWORD(v10) = v29;
            }
            else
            {
              v11 += 2;
LABEL_81:
              v36 = (v10 + 1);
            }
            *((_DWORD *)v8 + 13) = v10;
LABEL_83:
            v37 = arrayget(v55, v10);
            if (!v37)
              goto LABEL_109;
            *(_DWORD *)v37 = 1;
            v10 = v36;
          }
          else
          {
            ++v11;
            if ((v27 - 48) <= 9)
            {
              v33 = 0;
              do
              {
                v34 = 5 * v33;
                *((_DWORD *)v8 + 5) = 2 * v34;
                v33 = *v17 + 2 * v34 - 48;
                *((_DWORD *)v8 + 5) = v33;
                v35 = *++v17;
              }
              while ((v35 - 48) < 0xA);
LABEL_63:
              v11 = v17;
            }
          }
          continue;
        case '0':
          *((_DWORD *)v8 + 8) = 48;
          goto LABEL_59;
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
        case '8':
        case '9':
          v13 = *v11;
          if (!*v11)
          {
            LODWORD(v14) = 0;
LABEL_26:
            *((_DWORD *)v8 + 6) = v14;
            continue;
          }
          v14 = 0;
          ++v11;
          while (1)
          {
            v15 = v13 - 48;
            if (v15 > 9)
              break;
            v14 = v15 + 10 * (_DWORD)v14;
            v16 = *v11++;
            v13 = v16;
            if (!v16)
              goto LABEL_25;
          }
          if (v13 != 36)
          {
LABEL_25:
            --v11;
            goto LABEL_26;
          }
          if ((int)v10 > v9)
            v9 = v10;
          v10 = v14;
          break;
        case 'L':
          v18 = *((_WORD *)v8 + 20) | 1;
          goto LABEL_58;
        default:
          goto LABEL_85;
      }
    }
    switch((int)v12)
    {
      case 'h':
        v17 = v11 + 1;
        if (v11[1] == 104)
        {
          v11 += 2;
          *((_WORD *)v8 + 20) |= 2u;
          continue;
        }
        v32 = *((_WORD *)v8 + 20) | 4;
        goto LABEL_62;
      case 'i':
      case 'k':
      case 'm':
      case 'n':
      case 'o':
      case 'p':
      case 'r':
      case 's':
      case 'u':
        goto LABEL_85;
      case 'j':
        v18 = *((_WORD *)v8 + 20) | 0x1000;
        goto LABEL_58;
      case 'l':
        v17 = v11 + 1;
        if (v11[1] == 108)
        {
          v11 += 2;
          *((_WORD *)v8 + 20) = *((_WORD *)v8 + 20) & 0xF7FE | 1;
          continue;
        }
        v32 = *((_WORD *)v8 + 20) & 0xF7F7 | 8;
LABEL_62:
        *((_WORD *)v8 + 20) = v32;
        goto LABEL_63;
      case 'q':
        v18 = *((_WORD *)v8 + 20) & 0xF7F7 | 0x800;
        goto LABEL_58;
      case 't':
        v18 = *((_WORD *)v8 + 20) | 0x2000;
        goto LABEL_58;
      case 'v':
        v18 = *((_WORD *)v8 + 20) | 0x8000;
        goto LABEL_58;
      default:
        if ((_DWORD)v12 == 95)
        {
LABEL_30:
          *((_DWORD *)v8 + 4) = v12;
          goto LABEL_59;
        }
        if ((_DWORD)v12 == 122)
        {
          v18 = *((_WORD *)v8 + 20) | 0x4000;
LABEL_58:
          *((_WORD *)v8 + 20) = v18;
LABEL_59:
          ++v11;
          continue;
        }
LABEL_85:
        v38 = (v12 - 33);
        if (v38 > 0x5D)
          goto LABEL_93;
        v39 = *(char *)(a2 + v38 + 200);
        if ((v39 - 1) < 2)
        {
          if (arrayget(v55, (int)v10 + 1))
          {
            v40 = a2 + 24 * *((int *)v8 + 7) - 792;
            v41 = *(_QWORD *)(a1 + 80);
            *(_QWORD *)v8 = *(_QWORD *)(a2 + 24 * *((int *)v8 + 7) - 480);
            *((_QWORD *)v8 + 1) = v41;
            v42 = *(uint64_t (**)(char *, uint64_t, char *))(v40 + 296);
            v43 = arrayget(v55, v10);
            v44 = v42(v8, 2, v43);
            if (v44 >= 1)
            {
              *((_QWORD *)v8 + 9) = (int)v10;
              if (v44 != 1)
                *((_QWORD *)v8 + 10) = (int)v10 + 1;
            }
            v10 = (v44 + v10);
            goto LABEL_93;
          }
          goto LABEL_109;
        }
        if (v39 == 3)
          errx(1, "Unexpected flag: %c", v12);
LABEL_93:
        v4 = v11 + 1;
        v8 = arrayget(v56, ++v53);
        if (v8)
          goto LABEL_5;
LABEL_109:
        free(v56[0]);
        v45 = v55[0];
LABEL_110:
        free(v45);
        return 0xFFFFFFFFLL;
    }
  }
}

char *arrayget(void **a1, int a2)
{
  char *v4;
  int v5;
  char *result;

  v4 = (char *)*a1;
  if (*((_DWORD *)a1 + 3) <= a2)
  {
    v5 = a2 + 8;
    result = (char *)malloc_type_realloc(*a1, *((_DWORD *)a1 + 2) * (a2 + 8), 0x58E55244uLL);
    if (!result)
      return result;
    v4 = result;
    _platform_bzero();
    *a1 = v4;
    *((_DWORD *)a1 + 3) = v5;
  }
  return &v4[*((int *)a1 + 2) * (uint64_t)a2];
}

uint64_t __printf_exec(uint64_t a1, uint64_t a2, __int16 *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int *v9;
  int v10;
  int v11;
  __int16 *v12;
  _OWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  char *v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  int v31;
  int v32;
  char v34;
  uint64_t v35;
  _OWORD *v36;
  uint64_t v37;
  _OWORD v38[8];
  _OWORD *v39;
  __int16 *v40;

  memset(v38, 0, sizeof(v38));
  v39 = v38;
  v40 = a3;
  v36 = v38;
  v37 = 0;
  v35 = a2;
  if (*(int *)(a1 + 120) >= 2)
  {
    v5 = 1;
    v6 = 16;
    v7 = *(_QWORD *)(a1 + 104);
    do
    {
      v8 = *(_DWORD *)(v7 + 4 * v5);
      if (v8 > 0x10000)
      {
        if (v8 > 0x100000)
        {
          if (v8 > 0x400000)
          {
            if (v8 != 4194305)
            {
              v11 = 8388609;
LABEL_27:
              if (v8 != v11)
LABEL_60:
                errx(1, "argtype = %x (fmt = \"%s\")\n", *(_DWORD *)(v7 + 4 * v5), *(const char **)(a1 + 64));
            }
          }
          else if (v8 != 1048577)
          {
            v11 = 2097153;
            goto LABEL_27;
          }
        }
        else if (v8 > 0x20000)
        {
          if (v8 != 131073)
          {
            if (v8 != 262145)
              goto LABEL_60;
            v12 = v40;
            v40 += 4;
            v10 = *v12;
LABEL_31:
            *(_DWORD *)(*(_QWORD *)(a1 + 112) + v6) = v10;
            goto LABEL_35;
          }
        }
        else if (v8 != 65537)
        {
          if (v8 != 65664)
            goto LABEL_60;
LABEL_29:
          v15 = v40;
          v40 += 4;
          *(_QWORD *)(*(_QWORD *)(a1 + 112) + v6) = *v15;
          goto LABEL_35;
        }
      }
      else
      {
        if (v8 <= 15)
        {
          switch(v8)
          {
            case 1:
            case 4:
              v9 = (int *)v40;
              v40 += 4;
              v10 = *v9;
              goto LABEL_31;
            case 2:
              v16 = (char *)v40;
              v40 += 4;
              v10 = *v16;
              goto LABEL_31;
            case 8:
              v17 = (uint64_t *)v40;
              v40 += 4;
              v18 = *v17;
              v19 = (void (*)(uint64_t))off_1EDF54E10;
              if (off_1EDF54E10)
                goto LABEL_33;
              goto LABEL_34;
            default:
              goto LABEL_60;
          }
        }
        if (v8 > 127)
        {
          if (v8 != 128)
          {
            if (v8 != 256)
              goto LABEL_60;
            v13 = (_OWORD *)(((unint64_t)v40 + 15) & 0xFFFFFFFFFFFFFFF0);
            v40 = (__int16 *)(v13 + 1);
            *(_OWORD *)(*(_QWORD *)(a1 + 112) + v6) = *v13;
            goto LABEL_35;
          }
          goto LABEL_29;
        }
        if (v8 == 16)
        {
          v20 = (uint64_t *)v40;
          v40 += 4;
          v18 = *v20;
          v19 = (void (*)(uint64_t))qword_1EDF54E18;
          if (qword_1EDF54E18)
LABEL_33:
            v19(v18);
LABEL_34:
          *(_QWORD *)(*(_QWORD *)(a1 + 112) + v6) = v18;
          goto LABEL_35;
        }
        if (v8 != 32)
          goto LABEL_60;
      }
      v14 = v40;
      v40 += 4;
      *(_QWORD *)(*(_QWORD *)(a1 + 112) + v6) = *v14;
LABEL_35:
      ++v5;
      v6 += 16;
    }
    while (v5 < *(int *)(a1 + 120));
  }
  v21 = *(_QWORD *)(a1 + 88);
  if (v21 < *(_QWORD *)(a1 + 96))
  {
    LODWORD(v22) = 0;
    while (1)
    {
      v23 = *(unsigned int *)(v21 + 48);
      if ((_DWORD)v23)
      {
        v24 = *(_DWORD *)(*(_QWORD *)(a1 + 112) + 16 * v23);
        *(_DWORD *)(v21 + 24) = v24;
        if (v24 < 0)
        {
          *(_WORD *)(v21 + 40) |= 0x40u;
          *(_DWORD *)(v21 + 24) = -v24;
        }
      }
      v25 = *(unsigned int *)(v21 + 52);
      if ((_DWORD)v25)
        *(_DWORD *)(v21 + 20) = *(_DWORD *)(*(_QWORD *)(a1 + 112) + 16 * v25);
      v26 = *(_QWORD *)(v21 + 56);
      v27 = *(_DWORD *)(v21 + 64) - v26;
      __printf_puts((uint64_t)&v35, v26, v27);
      v22 = v22 + v27;
      v28 = *(_DWORD *)(v21 + 28);
      if (!v28)
        goto LABEL_53;
      v29 = v28 - 33;
      if ((v28 - 33) > 0x5D)
        break;
      v30 = *(_QWORD *)(a1 + 72);
      v31 = *(char *)(v30 + v29 + 200);
      if (v31 == 2)
      {
        *(_DWORD *)(v21 + 44) = v22;
        v32 = (*(uint64_t (**)(uint64_t *, unint64_t, unint64_t))(v30 + 24 * v29 + 304))(&v35, v21, v21 + 72);
        if (v32 < 0)
        {
          *(_WORD *)(v35 + 16) |= 0x40u;
          goto LABEL_53;
        }
        goto LABEL_52;
      }
      if (v31 == 1)
      {
        __sfvwrite(v35, (uint64_t)&v36);
        v39 = v38;
        v36 = v38;
        v37 = 0;
        *(_DWORD *)(v21 + 44) = v22;
        v32 = (*(uint64_t (**)(uint64_t, unint64_t, unint64_t))(v30
                                                                                     + 24 * *(int *)(v21 + 28)
                                                                                     - 488))(a2, v21, v21 + 72);
        goto LABEL_52;
      }
      if (!*(_BYTE *)(v30 + v29 + 200))
        break;
LABEL_53:
      v21 += 88;
      if (v21 >= *(_QWORD *)(a1 + 96))
        goto LABEL_59;
    }
    v34 = *(_DWORD *)(v21 + 28);
    v32 = __printf_out((uint64_t)&v35, v21, (uint64_t)&v34, 1);
LABEL_52:
    v22 = (v32 + v22);
    goto LABEL_53;
  }
  v22 = 0;
LABEL_59:
  __sfvwrite(v35, (uint64_t)&v36);
  return v22;
}

uint64_t __xprintf_vector(uint64_t *a1, uint64_t a2, _DWORD **a3)
{
  __int128 v4;
  __int128 v5;
  _DWORD *v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ii;
  int v13;
  uint64_t i;
  int v15;
  uint64_t k;
  int v17;
  uint64_t j;
  int v19;
  uint64_t m;
  int v21;
  uint64_t kk;
  int v23;
  uint64_t jj;
  int v26;
  uint64_t n;
  int v28;
  unint64_t *v29;
  unint64_t v30;
  __int128 v31[2];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  char v36;
  uint64_t v37;

  v4 = *(_OWORD *)(a2 + 48);
  v32 = *(_OWORD *)(a2 + 32);
  v33 = v4;
  v34 = *(_OWORD *)(a2 + 64);
  v35 = *(_QWORD *)(a2 + 80);
  v5 = *(_OWORD *)(a2 + 16);
  v31[0] = *(_OWORD *)a2;
  v31[1] = v5;
  v6 = *a3;
  v36 = *(_DWORD *)(a2 + 16);
  if (v36 == 88)
  {
    if (*(_DWORD *)(a2 + 28) == 99)
    {
      v36 = 0;
      *((_QWORD *)&v33 + 1) = &v36;
      *(_QWORD *)&v34 = &v36;
      goto LABEL_8;
    }
    v36 = 32;
    *((_QWORD *)&v33 + 1) = &v36;
    goto LABEL_7;
  }
  *((_QWORD *)&v33 + 1) = &v36;
  *(_QWORD *)&v34 = &v36;
  if (v36)
LABEL_7:
    *(_QWORD *)&v34 = &v37;
LABEL_8:
  v7 = WORD4(v32);
  v8 = WORD4(v32) & 0x7FFF;
  WORD4(v32) &= ~0x8000u;
  v9 = *(_WORD *)(a2 + 40);
  if ((v9 & 4) != 0)
  {
    if (*(_DWORD *)(a2 + 28) == 112)
    {
      v30 = *(unsigned __int16 *)v6;
      v29 = &v30;
      LODWORD(v11) = __printf_render_ptr(a1, v31, (uint64_t **)&v29);
      for (i = 2; i != 16; i += 2)
      {
        v15 = v34 - DWORD2(v33);
        __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
        v30 = *(unsigned __int16 *)((char *)v6 + i);
        v11 = v11 + __printf_render_ptr(a1, v31, (uint64_t **)&v29) + v15;
      }
    }
    else
    {
      LODWORD(v29) = *(unsigned __int16 *)v6;
      *(double *)&v30 = COERCE_DOUBLE(&v29);
      LODWORD(v11) = __printf_render_int(a1, (uint64_t)v31, (unint64_t **)&v30);
      for (j = 2; j != 16; j += 2)
      {
        v19 = v34 - DWORD2(v33);
        __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
        LODWORD(v29) = *(unsigned __int16 *)((char *)v6 + j);
        v11 = v11 + __printf_render_int(a1, (uint64_t)v31, (unint64_t **)&v30) + v19;
      }
    }
  }
  else if ((v9 & 8) != 0)
  {
    WORD4(v32) = v7 & 0x7FF7;
    if (*(_DWORD *)(a2 + 28) == 112)
    {
      v30 = *v6;
      v29 = &v30;
      LODWORD(v11) = __printf_render_ptr(a1, v31, (uint64_t **)&v29);
      for (k = 1; k != 4; ++k)
      {
        v17 = v34 - DWORD2(v33);
        __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
        v30 = v6[k];
        v11 = v11 + __printf_render_ptr(a1, v31, (uint64_t **)&v29) + v17;
      }
    }
    else
    {
      LODWORD(v29) = *v6;
      *(double *)&v30 = COERCE_DOUBLE(&v29);
      LODWORD(v11) = __printf_render_int(a1, (uint64_t)v31, (unint64_t **)&v30);
      for (m = 1; m != 4; ++m)
      {
        v21 = v34 - DWORD2(v33);
        __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
        LODWORD(v29) = v6[m];
        v11 = v11 + __printf_render_int(a1, (uint64_t)v31, (unint64_t **)&v30) + v21;
      }
    }
  }
  else
  {
    v10 = (*(_DWORD *)(a2 + 28) - 65);
    if (v10 > 0x37)
    {
LABEL_37:
      v30 = *(unsigned __int8 *)v6;
      v29 = &v30;
      LODWORD(v11) = __printf_render_ptr(a1, v31, (uint64_t **)&v29);
      for (n = 1; n != 16; ++n)
      {
        v28 = v34 - DWORD2(v33);
        __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
        v30 = *((unsigned __int8 *)v6 + n);
        v11 = v11 + __printf_render_ptr(a1, v31, (uint64_t **)&v29) + v28;
      }
      return v11;
    }
    if (((1 << (*(_BYTE *)(a2 + 28) - 65)) & 0x7100000051) == 0)
    {
      if (((1 << (*(_BYTE *)(a2 + 28) - 65)) & 0x90410800800000) != 0)
      {
        WORD4(v32) = v8 | 2;
        LODWORD(v29) = *(unsigned __int8 *)v6;
        *(double *)&v30 = COERCE_DOUBLE(&v29);
        LODWORD(v11) = __printf_render_int(a1, (uint64_t)v31, (unint64_t **)&v30);
        for (ii = 1; ii != 16; ++ii)
        {
          v13 = v34 - DWORD2(v33);
          __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
          LODWORD(v29) = *((unsigned __int8 *)v6 + ii);
          v11 = v11 + __printf_render_int(a1, (uint64_t)v31, (unint64_t **)&v30) + v13;
        }
        return v11;
      }
      if (v10 == 34)
      {
        LODWORD(v29) = *(unsigned __int8 *)v6;
        *(double *)&v30 = COERCE_DOUBLE(&v29);
        LODWORD(v11) = __printf_render_chr(a1, (uint64_t)v31);
        for (jj = 1; jj != 16; ++jj)
        {
          v26 = v34 - DWORD2(v33);
          __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
          LODWORD(v29) = *((unsigned __int8 *)v6 + jj);
          v11 = v11 + __printf_render_chr(a1, (uint64_t)v31) + v26;
        }
        return v11;
      }
      goto LABEL_37;
    }
    *(double *)&v30 = *(float *)v6;
    v29 = &v30;
    LODWORD(v11) = __printf_render_float(a1, v31, &v29);
    for (kk = 1; kk != 4; ++kk)
    {
      v23 = v34 - DWORD2(v33);
      __printf_puts((uint64_t)a1, *((uint64_t *)&v33 + 1), (v34 - DWORD2(v33)));
      *(double *)&v30 = *(float *)&v6[kk];
      v11 = v11 + __printf_render_float(a1, v31, &v29) + v23;
    }
  }
  return v11;
}

uint64_t at_quick_exit(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v6;
  int v7;

  v2 = (uint64_t *)malloc_type_calloc(1uLL, 0x10uLL, 0xA0040AFF93C70uLL);
  if (!v2)
    return 0xFFFFFFFFLL;
  v2[1] = a1;
  v3 = *v2;
  while (1)
  {
    v4 = __ldaxr(&handlers);
    if (v4 != v3)
      break;
    if (!__stlxr((unint64_t)v2, &handlers))
      return 0;
  }
  __clrex();
  do
  {
    *v2 = v4;
    while (1)
    {
      v6 = __ldaxr(&handlers);
      if (v6 != v4)
        break;
      if (!__stlxr((unint64_t)v2, &handlers))
      {
        v7 = 1;
        goto LABEL_13;
      }
    }
    v7 = 0;
    __clrex();
LABEL_13:
    v4 = v6;
  }
  while (!v7);
  return 0;
}

void quick_exit(int a1)
{
  unint64_t i;

  for (i = atomic_load(&handlers); i; i = *(_QWORD *)i)
    (*(void (**)(void))(i + 8))();
  _Exit(a1);
}

uint64_t __default_utx()
{
  pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
  return __utx__;
}

uint64_t __default_utx_init()
{
  char *v0;
  uint64_t result;
  uint64_t v2;

  v0 = (char *)malloc_type_calloc(1uLL, 0x2E0uLL, 0x10300404E040BDAuLL);
  __utx__ = (uint64_t)v0;
  *(_QWORD *)v0 = 0x17600787475;
  result = pthread_mutex_init((pthread_mutex_t *)(v0 + 648), 0);
  v2 = __utx__;
  *(_QWORD *)(__utx__ + 712) = "/var/run/utmpx";
  *(_BYTE *)(v2 + 728) |= 1u;
  return result;
}

uint64_t _setutxent(uint64_t a1)
{
  FILE *v2;

  if (!a1)
    _setutxent_cold_1();
  if (*(_QWORD *)a1 != 0x17600787475)
    _setutxent_cold_2();
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
  _platform_bzero();
  v2 = *(FILE **)(a1 + 720);
  if (v2)
    fseeko(v2, 628, 0);
  return pthread_mutex_unlock((pthread_mutex_t *)(a1 + 648));
}

void setutxent(void)
{
  pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
  _setutxent(__utx__);
}

_DWORD *__endutxent(uint64_t a1)
{
  _DWORD *result;
  int v3;

  result = (_DWORD *)_platform_bzero();
  if (*(_QWORD *)(a1 + 720))
  {
    v3 = *__error();
    fclose(*(FILE **)(a1 + 720));
    result = __error();
    *result = v3;
    *(_QWORD *)(a1 + 720) = 0;
    *(_BYTE *)(a1 + 728) &= ~2u;
  }
  return result;
}

uint64_t _endutxent(uint64_t a1)
{
  if (!a1)
    _endutxent_cold_1();
  if (*(_QWORD *)a1 != 0x17600787475)
    _endutxent_cold_2();
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
  __endutxent(a1);
  return pthread_mutex_unlock((pthread_mutex_t *)(a1 + 648));
}

void endutxent(void)
{
  pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
  _endutxent(__utx__);
}

uint64_t __getutxent(uint64_t a1)
{
  FILE *v2;
  uint64_t v3;
  FILE *v4;
  int v5;
  int v6;
  stat v8;
  _OWORD __ptr[18];
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
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  memset(__ptr, 0, sizeof(__ptr));
  v2 = *(FILE **)(a1 + 720);
  if (!v2)
  {
    memset(&v8, 0, sizeof(v8));
    v4 = fopen(*(const char **)(a1 + 712), "r+");
    *(_QWORD *)(a1 + 720) = v4;
    if (!v4)
    {
      v4 = fopen(*(const char **)(a1 + 712), "w+");
      *(_QWORD *)(a1 + 720) = v4;
      if (!v4)
      {
        v4 = fopen(*(const char **)(a1 + 712), "r");
        *(_QWORD *)(a1 + 720) = v4;
        if (!v4)
          goto LABEL_17;
        *(_BYTE *)(a1 + 728) |= 2u;
      }
    }
    fileno(v4);
    fcntl_NOCANCEL();
    v5 = fileno(*(FILE **)(a1 + 720));
    if (fstat(v5, &v8) != -1)
    {
      if (!v8.st_size)
      {
        _platform_bzero();
        WORD4(v10) = 10;
        strcpy((char *)__ptr, "utmpx-1.00");
        if (fwrite(__ptr, 0x274uLL, 1uLL, *(FILE **)(a1 + 720)) != 1)
          goto LABEL_16;
        goto LABEL_15;
      }
      if (fread(__ptr, 0x274uLL, 1uLL, *(FILE **)(a1 + 720)) == 1)
      {
        if (*(_QWORD *)&__ptr[0] ^ 0x2E312D78706D7475 | *(_QWORD *)((char *)__ptr + 3) ^ 0x30302E312D7870
          || WORD4(v10) != 10)
        {
          *__error() = 22;
          goto LABEL_16;
        }
LABEL_15:
        v2 = *(FILE **)(a1 + 720);
        goto LABEL_2;
      }
    }
LABEL_16:
    v6 = *__error();
    fclose(*(FILE **)(a1 + 720));
    *__error() = v6;
    *(_QWORD *)(a1 + 720) = 0;
    goto LABEL_17;
  }
LABEL_2:
  if (fread(__ptr, 0x274uLL, 1uLL, v2) != 1)
  {
LABEL_17:
    _platform_bzero();
    return 0;
  }
  v3 = a1 + 8;
  _utmpx32_64((uint64_t)__ptr, v3);
  return v3;
}

uint64_t _getutxent(uint64_t a1)
{
  pthread_mutex_t *v2;
  uint64_t v3;

  if (!a1)
    _getutxent_cold_1();
  if (*(_QWORD *)a1 != 0x17600787475)
    _getutxent_cold_2();
  v2 = (pthread_mutex_t *)(a1 + 648);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
  v3 = __getutxent(a1);
  pthread_mutex_unlock(v2);
  return v3;
}

utmpx *getutxent(void)
{
  pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
  return (utmpx *)_getutxent(__utx__);
}

uint64_t _getutxid(uint64_t a1, uint64_t a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD v8[40];

  if (!*(_WORD *)(a2 + 296))
    return 0;
  if (!a1)
    _getutxid_cold_1();
  if (*(_QWORD *)a1 != 0x17600787475)
    _getutxid_cold_2();
  v4 = (pthread_mutex_t *)(a1 + 648);
  memset(v8, 0, 512);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
  v5 = _utmpx_working_copy(a2, (uint64_t)v8, 1);
  if (v5)
    v6 = __getutxid(a1, v5);
  else
    v6 = 0;
  pthread_mutex_unlock(v4);
  return v6;
}

uint64_t __getutxid(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t result;

  while (1)
  {
    v4 = *(__int16 *)(a1 + 304);
    if (!*(_WORD *)(a1 + 304))
      goto LABEL_8;
    v5 = *(__int16 *)(a2 + 296);
    if ((v5 - 5) >= 4)
      break;
    if ((v4 - 5) <= 3 && *(_DWORD *)(a1 + 264) == *(_DWORD *)(a2 + 256))
      return a1 + 8;
LABEL_8:
    result = __getutxent(a1);
    if (!result)
      return result;
  }
  if ((v5 - 1) <= 3)
  {
    if (*(unsigned __int16 *)(a2 + 296) == (unsigned __int16)v4)
      return a1 + 8;
    goto LABEL_8;
  }
  return 0;
}

utmpx *__cdecl getutxid(const utmpx *a1)
{
  pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
  return (utmpx *)_getutxid(__utx__, (uint64_t)a1);
}

uint64_t _getutxline(uint64_t a1)
{
  uint64_t v2;

  if (!a1)
    _getutxline_cold_1();
  if (*(_QWORD *)a1 != 0x17600787475)
    _getutxline_cold_2();
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
  v2 = a1 + 8;
  while ((*(_WORD *)(a1 + 304) & 0xFFFE) != 6 || _platform_strncmp())
  {
    if (!__getutxent(a1))
    {
      v2 = 0;
      break;
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 648));
  return v2;
}

utmpx *__cdecl getutxline(const utmpx *a1)
{
  pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
  return (utmpx *)_getutxline(__utx__);
}

uint64_t _pututxline(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  pthread_mutex_t *v3;

  v2 = a2;
  if (a2)
  {
    if (!a1)
      _pututxline_cold_1();
    if (*(_QWORD *)a1 != 0x17600787475)
      _pututxline_cold_2();
    v3 = (pthread_mutex_t *)(a1 + 648);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
    pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
    v2 = __pututxline(__utx__, v2);
    if (v2)
    {
      pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
      if ((*(_BYTE *)(__utx__ + 728) & 1) != 0)
        _utmpx_asl(v2);
    }
    pthread_mutex_unlock(v3);
  }
  else
  {
    *__error() = 22;
  }
  return v2;
}

uint64_t __pututxline(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  FILE *v8;
  uint64_t v9;
  int v10;
  int *v11;
  int v12;
  int v13;
  int v14;
  off_t v16;
  _OWORD __ptr[40];
  _BYTE v18[648];

  memset(v18, 0, 512);
  memset(__ptr, 0, 512);
  v16 = -1;
  if ((*(_BYTE *)(a1 + 728) & 1) != 0
    && ((v4 = *(_QWORD *)(a1 + 720), (*(_BYTE *)(a1 + 728) & 2) != 0) && v4 || !v4 && geteuid())
    || !*(_QWORD *)(a1 + 720) && ((__getutxent(a1), !*(_QWORD *)(a1 + 720)) || (*(_BYTE *)(a1 + 728) & 2) != 0))
  {
    v11 = __error();
    v9 = 0;
    v12 = 1;
LABEL_28:
    *v11 = v12;
    return v9;
  }
  v5 = _utmpx_working_copy(a2, (uint64_t)v18, 0);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = __getutxid(a1, v5);
  if (v7)
    goto LABEL_11;
  _platform_bzero();
  v8 = *(FILE **)(a1 + 720);
  if (v8)
    fseeko(v8, 628, 0);
  v7 = __getutxid(a1, v6);
  if (v7)
    goto LABEL_11;
  if (*(_WORD *)(v6 + 296) == 8 && (*(_WORD *)(a2 + 296) & 0x4000) != 0)
    goto LABEL_37;
  v13 = fileno(*(FILE **)(a1 + 720));
  v16 = lseek(v13, 0, 1);
  if (v16 < 0)
    return 0;
  fileno(*(FILE **)(a1 + 720));
  if (fcntl_NOCANCEL() == -1)
    return 0;
  v14 = fseeko(*(FILE **)(a1 + 720), 0, 2);
  v7 = 0;
  v9 = 0;
  if (v14 != -1)
  {
LABEL_11:
    if ((v16 & 0x8000000000000000) == 0)
    {
LABEL_16:
      _utmpx64_32(v6, (uint64_t)__ptr);
      if (fwrite(__ptr, 0x274uLL, 1uLL, *(FILE **)(a1 + 720)) != 1 || fflush(*(FILE **)(a1 + 720)) == -1)
      {
        v9 = 0;
      }
      else
      {
        v9 = a1 + 8;
        _platform_memmove();
        notify_post("com.apple.system.utmpx");
      }
      goto LABEL_23;
    }
    if (*(_WORD *)(v6 + 296) != 8 || (*(_WORD *)(a2 + 296) & 0x4000) == 0 || *(_WORD *)(v7 + 296) == 7)
    {
      if (fseeko(*(FILE **)(a1 + 720), -628, 1) == -1)
        return 0;
      goto LABEL_16;
    }
LABEL_37:
    v11 = __error();
    v9 = 0;
    v12 = 22;
    goto LABEL_28;
  }
LABEL_23:
  if ((v16 & 0x8000000000000000) == 0)
  {
    v10 = *__error();
    fileno(*(FILE **)(a1 + 720));
    if (fcntl_NOCANCEL() != -1)
    {
      *__error() = v10;
      return v9;
    }
    return 0;
  }
  return v9;
}

utmpx *__cdecl pututxline(const utmpx *a1)
{
  pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
  return (utmpx *)_pututxline(__utx__, (uint64_t)a1);
}

uint64_t __utmpxname(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  char v5;
  void *v6;
  uint64_t result;
  char v8;

  if (!a2)
  {
    v8 = *(_BYTE *)(a1 + 728);
    if ((v8 & 1) == 0)
    {
      free(*(void **)(a1 + 712));
      v8 = *(_BYTE *)(a1 + 728);
    }
    *(_QWORD *)(a1 + 712) = "/var/run/utmpx";
    *(_BYTE *)(a1 + 728) = v8 | 1;
    goto LABEL_13;
  }
  v4 = _platform_strlen();
  if (v4 > 0x3FF || *(_BYTE *)(v4 + a2 - 1) != 120)
    return 0;
  v5 = *(_BYTE *)(a1 + 728);
  if ((v5 & 1) != 0)
  {
    v6 = 0;
    *(_QWORD *)(a1 + 712) = 0;
  }
  else
  {
    v6 = *(void **)(a1 + 712);
  }
  *(_BYTE *)(a1 + 728) = v5 & 0xFE;
  result = (uint64_t)reallocf(v6, v4 + 1);
  *(_QWORD *)(a1 + 712) = result;
  if (result)
  {
    _platform_strcpy();
LABEL_13:
    __endutxent(a1);
    return 1;
  }
  return result;
}

uint64_t _utmpxname(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (!a1)
    _utmpxname_cold_1();
  if (*(_QWORD *)a1 != 0x17600787475)
    _utmpxname_cold_2();
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 648));
  v4 = __utmpxname(a1, a2);
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 648));
  return v4;
}

int utmpxname(const char *a1)
{
  pthread_once(&__default_utx_once, (void (*)(void))__default_utx_init);
  return _utmpxname(__utx__, (uint64_t)a1);
}

ssize_t strfmon(char *a1, size_t a2, const char *a3, ...)
{
  uint64_t v4;
  _xlocale *v5;
  _xlocale *v6;
  va_list va;

  va_start(va, a3);
  v4 = __locale_key;
  v5 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v4);
  if (v5)
    v6 = v5;
  else
    v6 = (_xlocale *)&__global_locale;
  return _strfmon(a1, a2, v6, (unsigned __int8 *)a3, (double *)va);
}

uint64_t _strfmon(_BYTE *a1, unint64_t a2, locale_t a3, unsigned __int8 *a4, double *a5)
{
  lconv *v9;
  _BYTE *v10;
  int v11;
  _BYTE *v12;
  _BYTE *v13;
  locale_t v14;
  locale_t v15;
  unint64_t v16;
  int v17;
  uint64_t v18;
  _BYTE *i;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  unsigned __int8 v24;
  _RuneLocale *v25;
  int v26;
  _RuneLocale *v27;
  unsigned __int8 v28;
  int v29;
  _RuneLocale *v30;
  int v31;
  _RuneLocale *v32;
  unsigned __int8 v33;
  int v34;
  _RuneLocale *v35;
  uint64_t v36;
  _RuneLocale *v37;
  unsigned __int8 v38;
  uint64_t v39;
  unsigned int v40;
  void *v41;
  int v42;
  char *v43;
  double *v44;
  double v45;
  uint64_t v46;
  double v47;
  int v48;
  unsigned __int8 *fixed;
  char v50;
  _BYTE *v51;
  int v52;
  uint64_t v53;
  int v54;
  int v55;
  unsigned __int8 v56;
  uint64_t v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  size_t v63;
  _BYTE *v64;
  uint64_t v65;
  int v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  int v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unsigned int v76;
  uint64_t v77;
  unsigned int v78;
  int v79;
  uint64_t v80;
  int v81;
  unsigned int v82;
  int v83;
  BOOL v84;
  BOOL v85;
  char v86;
  const char *v87;
  int v88;
  int v89;
  uint64_t v90;
  char v91;
  const char *v92;
  int v93;
  char v94;
  const char *v95;
  int v96;
  int v97;
  uint64_t v98;
  char v99;
  const char *v100;
  int v101;
  BOOL v102;
  int v103;
  uint64_t v104;
  int v105;
  char v106;
  const char *v107;
  int v108;
  char v109;
  const char *v110;
  int v111;
  char v112;
  int v113;
  _xlocale *v114;
  _BYTE *v115;
  int v117;
  int v118;
  char v119;
  unsigned int v120;
  int v121;
  char *v122;
  _xlocale *v123;
  int v124;
  int v125;
  uint64_t v126;
  int v127;
  uint64_t v128;
  _BYTE *v129;
  _BYTE *v130;
  int v131;
  unsigned int v132;
  _BYTE *v133;
  unint64_t v134;
  _xlocale *v135;
  const char *v136;
  unsigned __int8 v137;
  __int16 v138;
  double *v139;
  char *v140;
  char v141[32];

  v139 = a5;
  v138 = 0;
  v137 = 0;
  v136 = 0;
  v9 = localeconv_l(a3);
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v134 = a2;
  v13 = &a1[a2];
  v14 = (locale_t)&__global_locale;
  if (a3 != (locale_t)-1)
    v14 = a3;
  v135 = a3;
  if (a3)
    v15 = v14;
  else
    v15 = (locale_t)&__c_locale;
  v16 = (unint64_t)a1;
  v17 = 32;
LABEL_7:
  while (2)
  {
    while (2)
    {
      v18 = -(uint64_t)v16;
      for (i = (_BYTE *)v16; ; ++i)
      {
        v20 = *a4;
        if (v20 == 37)
          break;
        if (!*a4)
        {
          if (i < v13)
          {
            *i = 0;
            free(v10);
            free(v12);
            return i - a1;
          }
          goto LABEL_256;
        }
LABEL_13:
        if (i >= v13)
          goto LABEL_256;
        ++a4;
        *i = v20;
        --v18;
      }
      if (a4[1] == 37)
      {
        ++a4;
        goto LABEL_13;
      }
      v133 = a1;
      v21 = 5;
      while (2)
      {
        while (2)
        {
          while (2)
          {
            ++a4;
            while (1)
            {
              v22 = *a4;
              if ((_DWORD)v22 != 61)
                break;
              v23 = a4[1];
              a4 += 2;
              if (!v23)
                goto LABEL_263;
            }
            v24 = *a4;
            if ((char)v22 > 42)
            {
              if ((char)v22 != 43)
              {
                if ((char)v22 == 45)
                {
                  v21 |= 0x20u;
                  continue;
                }
                if ((char)v22 == 94)
                {
                  v21 &= ~1u;
                  continue;
                }
                goto LABEL_33;
              }
              if ((v21 & 2) == 0)
              {
                v21 |= 6u;
                continue;
              }
LABEL_263:
              v117 = 22;
              goto LABEL_257;
            }
            break;
          }
          if ((char)v22 == 33)
          {
            v21 |= 0x10u;
            continue;
          }
          break;
        }
        if ((char)v22 == 40)
        {
          if ((v21 & 2) == 0)
          {
            v21 |= 0xAu;
            continue;
          }
          goto LABEL_263;
        }
        break;
      }
LABEL_33:
      v25 = &_DefaultRuneLocale;
      if ((char)v22 < 0)
        v25 = *(_RuneLocale **)(*((_QWORD *)v15 + 166) + 120);
      if ((v25->__runetype[v22] & 0x400) == 0)
      {
        v26 = -1;
        goto LABEL_44;
      }
      v26 = 0;
      while (1)
      {
        v27 = &_DefaultRuneLocale;
        if ((v24 & 0x80) != 0)
          v27 = *(_RuneLocale **)(*((_QWORD *)v15 + 166) + 120);
        if ((v27->__runetype[v24] & 0x400) == 0)
          break;
        v26 = 10 * v26 + (char)v24 - 48;
        if (v26 > 0xFFFFFF)
          goto LABEL_256;
        v28 = *++a4;
        v24 = v28;
      }
      if (i - v133 + v26 >= v134)
        goto LABEL_256;
LABEL_44:
      if (v24 == 35)
      {
        v29 = (char)*++a4;
        v24 = v29;
        v30 = &_DefaultRuneLocale;
        if (v29 < 0)
          v30 = *(_RuneLocale **)(*((_QWORD *)v15 + 166) + 120);
        if ((v30->__runetype[v24] & 0x400) == 0)
          goto LABEL_263;
        v31 = 0;
        while (1)
        {
          v32 = &_DefaultRuneLocale;
          if ((v24 & 0x80) != 0)
            v32 = *(_RuneLocale **)(*((_QWORD *)v15 + 166) + 120);
          if ((v32->__runetype[v24] & 0x400) == 0)
            break;
          v31 = 10 * v31 + (char)v24 - 48;
          if (v31 > 0xFFFFFF)
            goto LABEL_256;
          v33 = *++a4;
          v24 = v33;
        }
      }
      else
      {
        v31 = -1;
      }
      if (v24 == 46)
      {
        v34 = (char)*++a4;
        v24 = v34;
        v35 = &_DefaultRuneLocale;
        if (v34 < 0)
          v35 = *(_RuneLocale **)(*((_QWORD *)v15 + 166) + 120);
        if ((v35->__runetype[v24] & 0x400) == 0)
          goto LABEL_263;
        v36 = 0;
        while (1)
        {
          v37 = &_DefaultRuneLocale;
          if ((v24 & 0x80) != 0)
            v37 = *(_RuneLocale **)(*((_QWORD *)v15 + 166) + 120);
          if ((v37->__runetype[v24] & 0x400) == 0)
            break;
          v36 = (10 * v36 + (char)v24 - 48);
          if ((int)v36 > 0xFFFFFF)
            goto LABEL_256;
          v38 = *++a4;
          v24 = v38;
        }
      }
      else
      {
        v36 = 0xFFFFFFFFLL;
      }
      v127 = v31;
      v129 = v10;
      v123 = v15;
      v125 = v11;
      if (v24 == 110)
      {
        v39 = (uint64_t)v9;
        v40 = v21 & 0xFFFFFFBF;
      }
      else
      {
        if (v24 != 105)
          goto LABEL_263;
        v39 = (uint64_t)v9;
        v40 = v21 | 0x40;
      }
      if (v12)
      {
        v41 = v12;
        v42 = v17;
        free(v41);
        v17 = v42;
      }
      if ((v40 & 0x40) != 0)
      {
        v43 = strdup(*(const char **)(v39 + 24));
        if (!v43)
          goto LABEL_264;
        v124 = v43[3];
        v43[3] = 0;
      }
      else
      {
        v124 = v17;
        v43 = strdup(*(const char **)(v39 + 32));
        if (!v43)
        {
LABEL_264:
          v12 = 0;
          v10 = v129;
          goto LABEL_258;
        }
      }
      v128 = (uint64_t)v43;
      v44 = v139++;
      v45 = *v44;
      if (*v44 >= 0.0)
        v46 = v40;
      else
        v46 = v40 | 0x80;
      if (v45 >= 0.0)
        v47 = *v44;
      else
        v47 = -v45;
      if ((v127 & 0x80000000) == 0)
      {
        v131 = __calc_left_pad(v46 ^ 0x80, (uint64_t)v43, v39);
        v48 = __calc_left_pad(v46, v128, v39);
        v125 = (v131 - v48) & ~((v131 - v48) >> 31);
      }
      v132 = v46;
      v140 = 0;
      fixed = __fix_nogrouping(*(_BYTE **)(v39 + 56));
      v50 = **(_BYTE **)(v39 + 40);
      if (!v50)
        v50 = **(_BYTE **)v39;
      v51 = *(_BYTE **)(v39 + 48);
      v52 = *v51;
      v53 = 80;
      v12 = (_BYTE *)v128;
      if (!*v51)
        v52 = **(unsigned __int8 **)(v39 + 8);
      if (v127 == -1)
        v54 = 0;
      else
        v54 = v127;
      if ((_DWORD)v36 == -1)
      {
        if ((v132 & 0x40) == 0)
          v53 = 81;
        v55 = *(unsigned __int8 *)(v39 + v53);
        if (v55 == 127)
          LOBYTE(v55) = 2;
        v36 = (char)v55;
      }
      v126 = v39;
      v122 = (char *)fixed;
      v121 = v52;
      v119 = v50;
      if ((v132 & 1) != 0)
      {
        v56 = *fixed;
        if ((*fixed - 127) >= 0x82u)
        {
          v57 = 0;
          v58 = v54;
          while (v58 > (char)v56)
          {
            v59 = fixed[++v57];
            if (v59 == 127)
              break;
            v60 = (char)v56;
            v58 -= (char)v56;
            v56 = v59;
            if (!v59)
            {
              LODWORD(v57) = (v58 - 1) / v60 + v57;
              break;
            }
          }
        }
        else
        {
          LODWORD(v57) = 0;
        }
        v54 += v57;
      }
      snprintf_l(v141, 0x20uLL, v135, "%%%d.%df", (v36 + v54 + 1), v36);
      v61 = asprintf_l(&v140, v135, v141, *(_QWORD *)&v47);
      if (v61 < 0)
      {
LABEL_266:
        v118 = *__error();
        goto LABEL_261;
      }
      v62 = v61;
      v63 = (2 * _platform_strlen()) | 1;
      v64 = malloc_type_malloc(v63, 0x11D53FB7uLL);
      if (!v64)
      {
        free(v140);
        goto LABEL_266;
      }
      v130 = v64;
      _platform_bzero();
      if (*v140 == 32)
      {
        v65 = 0;
        do
          v66 = v140[++v65];
        while (v66 == 32);
        v62 -= v65;
        v67 = v65;
      }
      else
      {
        v67 = 0;
        v65 = 0;
      }
      v120 = v67;
      v68 = (uint64_t)&v130[v63 - 1];
      if ((int)v36 >= 1)
      {
        v69 = v68 - v36;
        _platform_memmove();
        *(_BYTE *)(v69 - 1) = v119;
        v68 = v69 - 1;
        v62 += ~(_DWORD)v36;
      }
      v70 = v122;
      if ((v132 & 1) != 0 && v121 && (v71 = *v122, (v71 - 1) <= 0x7D))
      {
        if (v62 <= v71)
        {
          v72 = 0;
          v74 = v132;
        }
        else
        {
          v72 = 0;
          v73 = v65 - 1;
          v74 = v132;
          do
          {
            if (v71 >= 1)
            {
              v75 = v73 + v62;
              v76 = v71 + 1;
              v62 -= v71;
              do
              {
                *(_BYTE *)--v68 = v140[v75--];
                --v76;
              }
              while (v76 > 1);
            }
            *(_BYTE *)--v68 = v121;
            ++v72;
            v71 = v70[1];
            if (v70[1])
            {
              if (v71 == 127)
                break;
              v71 = (char)v71;
              ++v70;
            }
            else
            {
              while (1)
              {
                v71 = *v70;
                if (v62 <= v71)
                  break;
                if (v71 >= 1)
                {
                  v77 = v73 + v62;
                  v78 = v71 + 1;
                  v62 -= v71;
                  do
                  {
                    *(_BYTE *)--v68 = v140[v77--];
                    --v78;
                  }
                  while (v78 > 1);
                }
                *(_BYTE *)--v68 = v121;
                ++v72;
              }
            }
          }
          while (v62 > v71);
        }
        if (v62 < 1)
        {
          v12 = (_BYTE *)v128;
          v10 = v130;
          v82 = v120;
        }
        else
        {
          v80 = v65 + v62 - 1;
          v81 = v62 + 1;
          v12 = (_BYTE *)v128;
          v10 = v130;
          v82 = v120;
          do
          {
            *(_BYTE *)--v68 = v140[v80--];
            --v81;
          }
          while (v81 > 1);
        }
        v79 = v82 - v72;
      }
      else
      {
        _platform_memmove();
        v79 = (__PAIR64__(v120, v36) - 1) >> 32;
        v12 = (_BYTE *)v128;
        v10 = v130;
        v74 = v132;
      }
      if (v79 >= 1)
        _platform_memset();
      a1 = v133;
      _platform_memmove();
      free(v140);
      __setup_vars(v74, (_BYTE *)&v138 + 1, &v138, &v137, &v136, v126);
      v83 = v125;
      v16 = (unint64_t)i;
      if (v125 >= 1)
      {
        v9 = (lconv *)v126;
        v15 = v123;
        v17 = v124;
        while (v16 < (unint64_t)v13)
        {
          *(_BYTE *)v16++ = 32;
          v84 = __OFSUB__(v83--, 1);
          if ((v83 < 0) ^ v84 | (v83 == 0))
          {
            v11 = v83 - 1;
            goto LABEL_151;
          }
        }
        goto LABEL_256;
      }
      v11 = v125 - 1;
      v9 = (lconv *)v126;
      v15 = v123;
      v17 = v124;
LABEL_151:
      if (v137)
        v85 = 1;
      else
        v85 = (v74 & 0x80) == 0;
      if (!v85)
      {
        if (v16 >= (unint64_t)v13)
          goto LABEL_256;
        *(_BYTE *)v16++ = 40;
      }
      if (HIBYTE(v138) != 1)
      {
        if (v137 != 1)
          goto LABEL_193;
        v94 = *v136;
        if (*v136)
        {
          v95 = v136 + 1;
          while (v16 < (unint64_t)v13)
          {
            *(_BYTE *)v16++ = v94;
            v96 = *(unsigned __int8 *)v95++;
            v94 = v96;
            if (!v96)
              goto LABEL_187;
          }
          goto LABEL_256;
        }
LABEL_187:
        if (v138 != 2)
          goto LABEL_193;
LABEL_188:
        if (v16 >= (unint64_t)v13)
          goto LABEL_256;
        *(_BYTE *)v16++ = 32;
        goto LABEL_193;
      }
      if ((v137 & 0xFD) == 1)
      {
        v86 = *v136;
        if (*v136)
        {
          v87 = v136 + 1;
          while (v16 < (unint64_t)v13)
          {
            *(_BYTE *)v16++ = v86;
            v88 = *(unsigned __int8 *)v87++;
            v86 = v88;
            if (!v88)
              goto LABEL_163;
          }
          goto LABEL_256;
        }
LABEL_163:
        if (v138 == 2)
        {
          if (v16 >= (unint64_t)v13)
            goto LABEL_256;
          *(_BYTE *)v16++ = 32;
        }
      }
      if ((v74 & 0x10) == 0)
      {
        LOBYTE(v89) = *v12;
        if (*v12)
        {
          v90 = 0;
          while (v16 + v90 < (unint64_t)v13)
          {
            *(_BYTE *)(v16 + v90) = v89;
            v89 = v12[++v90];
            if (!v89)
            {
              v16 += v90;
              goto LABEL_172;
            }
          }
          goto LABEL_256;
        }
LABEL_172:
        if (v137 != 4)
        {
          if (v138 == 1)
          {
            if (v16 >= (unint64_t)v13)
              goto LABEL_256;
            *(_BYTE *)v16++ = v17;
          }
          goto LABEL_193;
        }
        if (v138 == 2)
        {
          if (v16 >= (unint64_t)v13)
            goto LABEL_256;
          *(_BYTE *)v16++ = v17;
        }
        v91 = *v136;
        if (*v136)
        {
          v92 = v136 + 1;
          while (v16 < (unint64_t)v13)
          {
            *(_BYTE *)v16++ = v91;
            v93 = *(unsigned __int8 *)v92++;
            v91 = v93;
            if (!v93)
              goto LABEL_180;
          }
          goto LABEL_256;
        }
LABEL_180:
        if (v138 == 1)
          goto LABEL_188;
      }
LABEL_193:
      LOBYTE(v97) = *v10;
      if (*v10)
      {
        v98 = 0;
        while (v16 + v98 < (unint64_t)v13)
        {
          *(_BYTE *)(v16 + v98) = v97;
          v97 = v10[++v98];
          if (!v97)
          {
            v16 += v98;
            goto LABEL_198;
          }
        }
        goto LABEL_256;
      }
LABEL_198:
      if (HIBYTE(v138))
        goto LABEL_230;
      if (v137 == 3)
      {
        if (v138 == 1)
        {
          if (v16 >= (unint64_t)v13)
            goto LABEL_256;
          *(_BYTE *)v16++ = 32;
        }
        v99 = *v136;
        if (*v136)
        {
          v100 = v136 + 1;
          while (v16 < (unint64_t)v13)
          {
            *(_BYTE *)v16++ = v99;
            v101 = *(unsigned __int8 *)v100++;
            v99 = v101;
            if (!v101)
              goto LABEL_207;
          }
          goto LABEL_256;
        }
      }
LABEL_207:
      if ((v74 & 0x10) != 0)
      {
LABEL_230:
        v105 = v137;
      }
      else
      {
        v102 = v137 == 3 && v138 == 2;
        if (v102 || v138 == 1 && v137 <= 4u && v137 != 3)
        {
          if (v16 >= (unint64_t)v13)
            goto LABEL_256;
          *(_BYTE *)v16++ = v17;
        }
        LOBYTE(v103) = *v12;
        if (*v12)
        {
          v104 = 0;
          while (v16 + v104 < (unint64_t)v13)
          {
            *(_BYTE *)(v16 + v104) = v103;
            v103 = v12[++v104];
            if (!v103)
            {
              v16 += v104;
              goto LABEL_222;
            }
          }
          goto LABEL_256;
        }
LABEL_222:
        v105 = v137;
        if (v137 == 4)
        {
          if (v138 == 2)
          {
            if (v16 >= (unint64_t)v13)
              goto LABEL_256;
            *(_BYTE *)v16++ = 32;
          }
          v106 = *v136;
          if (*v136)
          {
            v107 = v136 + 1;
            while (v16 < (unint64_t)v13)
            {
              *(_BYTE *)v16++ = v106;
              v108 = *(unsigned __int8 *)v107++;
              v106 = v108;
              if (!v108)
                goto LABEL_230;
            }
            goto LABEL_256;
          }
          goto LABEL_230;
        }
      }
      if (v105 == 2)
      {
        if (v138 == 2)
        {
          if (v16 >= (unint64_t)v13)
            goto LABEL_256;
          *(_BYTE *)v16++ = 32;
        }
        v109 = *v136;
        if (*v136)
        {
          v110 = v136 + 1;
          while (v16 < (unint64_t)v13)
          {
            *(_BYTE *)v16++ = v109;
            v111 = *(unsigned __int8 *)v110++;
            v109 = v111;
            if (!v111)
              goto LABEL_239;
          }
          goto LABEL_256;
        }
      }
LABEL_239:
      if (!v137)
      {
        if ((v74 & 0x80) != 0)
        {
          if (v16 >= (unint64_t)v13)
            goto LABEL_256;
          v112 = 41;
LABEL_246:
          *(_BYTE *)v16++ = v112;
        }
        else if ((v127 & 0x80000000) == 0)
        {
          if (v16 >= (unint64_t)v13)
            goto LABEL_256;
          v112 = 32;
          goto LABEL_246;
        }
      }
      ++a4;
      v113 = v16 - (_DWORD)i;
      if ((uint64_t)(v16 - (_QWORD)i) >= v26)
        continue;
      break;
    }
    if ((v132 & 0x20) == 0)
    {
      v114 = v15;
      _platform_memmove();
      _platform_memset();
      v17 = v124;
      v15 = v114;
      v9 = (lconv *)v126;
      v16 += v26 - (uint64_t)v113;
      v10 = v130;
      v11 = v113;
      continue;
    }
    break;
  }
  v115 = (_BYTE *)(v16 + v18);
  while (v16 < (unint64_t)v13)
  {
    *(_BYTE *)v16++ = 32;
    if ((uint64_t)++v115 >= v26)
      goto LABEL_7;
  }
LABEL_256:
  v117 = 7;
LABEL_257:
  *__error() = v117;
LABEL_258:
  v118 = *__error();
  if (v10)
    free(v10);
  if (v12)
LABEL_261:
    free(v12);
  *__error() = v118;
  return -1;
}

ssize_t strfmon_l(char *a1, size_t a2, locale_t a3, const char *a4, ...)
{
  locale_t v4;
  _xlocale *v5;
  va_list va;

  va_start(va, a4);
  v4 = (locale_t)&__global_locale;
  if (a3 != (locale_t)-1)
    v4 = a3;
  if (a3)
    v5 = v4;
  else
    v5 = (_xlocale *)&__c_locale;
  return _strfmon(a1, a2, v5, (unsigned __int8 *)a4, (double *)va);
}

uint64_t __calc_left_pad(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  int v4;
  unsigned int v5;
  uint64_t v6;
  const char *v8;
  char v9;
  __int16 v10;

  v3 = a1;
  v10 = 0;
  v9 = 0;
  v8 = 0;
  __setup_vars(a1, (_BYTE *)&v10 + 1, &v10, &v9, &v8, a3);
  v4 = HIBYTE(v10);
  if (HIBYTE(v10))
  {
    v5 = _platform_strlen();
    if ((_BYTE)v10)
      v6 = v5 + 1;
    else
      v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  if ((v9 - 3) < 2)
  {
    if (!v4)
      return v6;
    return v6 + _platform_strlen();
  }
  if (v9 == 1)
    return v6 + _platform_strlen();
  if (v9)
    return v6;
  else
    return v6 + ((v3 >> 7) & 1);
}

uint64_t __setup_vars(uint64_t result, _BYTE *a2, _BYTE *a3, _BYTE *a4, const char **a5, uint64_t a6)
{
  char v6;
  char v7;
  const char *v8;

  if ((~(_DWORD)result & 0xC0) == 0)
  {
    *a2 = *(_BYTE *)(a6 + 89);
    *a3 = *(_BYTE *)(a6 + 91);
    if ((result & 8) == 0)
    {
      v6 = *(_BYTE *)(a6 + 93);
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if ((result & 0x40) != 0)
  {
    *a2 = *(_BYTE *)(a6 + 88);
    *a3 = *(_BYTE *)(a6 + 90);
    if ((result & 8) == 0)
    {
      v7 = *(_BYTE *)(a6 + 92);
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  if ((result & 0x80) == 0)
  {
    *a2 = *(_BYTE *)(a6 + 82);
    *a3 = *(_BYTE *)(a6 + 83);
    if ((result & 8) == 0)
    {
      v7 = *(_BYTE *)(a6 + 86);
LABEL_11:
      *a4 = v7;
      v8 = *(const char **)(a6 + 64);
      goto LABEL_17;
    }
    goto LABEL_10;
  }
  *a2 = *(_BYTE *)(a6 + 84);
  *a3 = *(_BYTE *)(a6 + 85);
  if ((result & 8) == 0)
  {
    v6 = *(_BYTE *)(a6 + 87);
    goto LABEL_15;
  }
LABEL_14:
  v6 = 0;
LABEL_15:
  *a4 = v6;
  v8 = *(const char **)(a6 + 72);
  if (!*v8)
    v8 = "-";
LABEL_17:
  *a5 = v8;
  if (*a2)
    *a2 = 1;
  if (*a3 == 127)
    *a3 = 0;
  if (*a4 == 127)
    *a4 = 0;
  return result;
}

void *__cdecl rb_tree_find_node_geq(rb_tree_t *a1, const void *a2)
{
  _QWORD *v2;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)(_QWORD, char *, const void *);
  char *v7;
  int v8;

  v2 = a1->opaque[0];
  if (!a1->opaque[0])
    return 0;
  v4 = 0;
  v5 = a1->opaque[1];
  v6 = (uint64_t (*)(_QWORD, char *, const void *))v5[1];
  while (1)
  {
    v7 = (char *)v2 - v5[2];
    v8 = v6(v5[3], v7, a2);
    if (!v8)
      break;
    if (v8 > 0)
      v4 = v2;
    v2 = (_QWORD *)v2[v8 >> 31];
    if (!v2)
    {
      if (!v4)
        return 0;
      return (char *)v4 - v5[2];
    }
  }
  return v7;
}

void *__cdecl rb_tree_find_node_leq(rb_tree_t *a1, const void *a2)
{
  _QWORD *v2;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)(_QWORD, char *, const void *);
  char *v7;
  int v8;

  v2 = a1->opaque[0];
  if (!a1->opaque[0])
    return 0;
  v4 = 0;
  v5 = a1->opaque[1];
  v6 = (uint64_t (*)(_QWORD, char *, const void *))v5[1];
  while (1)
  {
    v7 = (char *)v2 - v5[2];
    v8 = v6(v5[3], v7, a2);
    if (!v8)
      break;
    if (v8 < 0)
      v4 = v2;
    v2 = (_QWORD *)v2[v8 >> 31];
    if (!v2)
    {
      if (!v4)
        return 0;
      return (char *)v4 - v5[2];
    }
  }
  return v7;
}

int regncomp_l(regex_t *a1, const char *a2, size_t a3, int a4, locale_t a5)
{
  unint64_t v7;
  _BYTE *v10;
  _BYTE *v11;
  locale_t v12;
  _xlocale *v13;
  uint64_t v14;
  int v15;
  __int32 *v16;
  size_t v17;
  mbstate_t v19;

  v7 = a3;
  v10 = malloc_type_malloc(4 * a3 + 4, 0x100004052888210uLL);
  if (!v10)
    return 12;
  v11 = v10;
  v12 = (locale_t)&__global_locale;
  if (a5 != (locale_t)-1)
    v12 = a5;
  if (a5)
    v13 = v12;
  else
    v13 = (_xlocale *)&__c_locale;
  if (*(_DWORD *)(*((_QWORD *)v13 + 166) + 64) == 1)
  {
    if (v7)
    {
      v14 = 0;
      do
      {
        *(_DWORD *)&v10[4 * v14] = a2[v14];
        ++v14;
      }
      while (v7 > v14);
    }
    goto LABEL_22;
  }
  v16 = (__int32 *)v10;
  memset(&v19, 0, sizeof(v19));
  if (!v7)
  {
LABEL_21:
    v7 = ((char *)v16 - v11) >> 2;
LABEL_22:
    *(_DWORD *)&v11[4 * v7] = 0;
    v15 = tre_compile((uint64_t)a1, (uint64_t)v11, v7, a4, (size_t)v13);
    goto LABEL_23;
  }
  v16 = (__int32 *)v10;
  while (1)
  {
    v17 = mbrtowc_l(v16, a2, v7, &v19, v13);
    if (!v17)
      break;
    if (v17 >= 0xFFFFFFFFFFFFFFFELL)
    {
      v15 = 17;
      goto LABEL_23;
    }
LABEL_20:
    a2 += v17;
    ++v16;
    v7 -= v17;
    if (!v7)
      goto LABEL_21;
  }
  if (!*a2)
  {
    v17 = 1;
    goto LABEL_20;
  }
  v15 = 2;
LABEL_23:
  free(v11);
  return v15;
}

int regncomp(regex_t *a1, const char *a2, size_t a3, int a4)
{
  uint64_t v4;
  _xlocale *v5;
  _xlocale *v6;

  v4 = __locale_key;
  v5 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v4);
  if (v5)
    v6 = v5;
  else
    v6 = (_xlocale *)&__global_locale;
  return regncomp_l(a1, a2, a3, a4, v6);
}

int regcomp_l(regex_t *a1, const char *a2, int a3, locale_t a4)
{
  size_t v8;
  const char *re_endp;

  if ((a3 & 0x20) != 0)
  {
    re_endp = a1->re_endp;
    v8 = re_endp - a2;
    if (re_endp < a2)
      return 16;
  }
  else
  {
    v8 = _platform_strlen();
  }
  return regncomp_l(a1, a2, v8, a3, a4);
}

int regcomp(regex_t *a1, const char *a2, int a3)
{
  uint64_t v3;
  _xlocale *v4;
  _xlocale *v5;

  v3 = __locale_key;
  v4 = *(_xlocale **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v3);
  if (v4)
    v5 = v4;
  else
    v5 = (_xlocale *)&__global_locale;
  return regcomp_l(a1, a2, a3, v5);
}

uint64_t regwncomp_l(uint64_t a1, uint64_t a2, int a3, unsigned int a4, void *a5)
{
  void *v5;
  void *v6;

  v5 = &__global_locale;
  if (a5 != (void *)-1)
    v5 = a5;
  if (a5)
    v6 = v5;
  else
    v6 = &__c_locale;
  return tre_compile(a1, a2, a3, a4, (size_t)v6);
}

int regwncomp(regex_t *a1, const __int32 *a2, size_t a3, int a4)
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = __locale_key;
  v5 = *(void **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v4);
  if (v5)
    v6 = v5;
  else
    v6 = &__global_locale;
  return tre_compile((uint64_t)a1, (uint64_t)a2, a3, a4, (size_t)v6);
}

int regwcomp_l(regex_t *a1, const __int32 *a2, int a3, locale_t a4)
{
  locale_t v7;
  locale_t v8;
  int v9;

  v7 = (locale_t)&__global_locale;
  if (a4 != (locale_t)-1)
    v7 = a4;
  if (a4)
    v8 = v7;
  else
    v8 = (locale_t)&__c_locale;
  v9 = wcslen(a2);
  return tre_compile((uint64_t)a1, (uint64_t)a2, v9, a3, (size_t)v8);
}

int regwcomp(regex_t *a1, const __int32 *a2, int a3)
{
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v6 = wcslen(a2);
  v7 = __locale_key;
  v8 = *(void **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8 * v7);
  if (v8)
    v9 = v8;
  else
    v9 = &__global_locale;
  return tre_compile((uint64_t)a1, (uint64_t)a2, v6, a3, (size_t)v9);
}

uint64_t tre_fill_pmatch(unint64_t a1, _QWORD *a2, char a3, uint64_t a4, _DWORD *a5, unsigned int a6)
{
  unsigned int v9;
  uint64_t v12;
  _DWORD *v13;
  _DWORD *v14;
  int v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  int *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unsigned int v26;
  _QWORD *v27;

  if ((a3 & 4) != 0)
    return 0;
  v9 = 0;
  if (a5 && (a6 & 0x80000000) == 0)
  {
    v12 = *(_QWORD *)(a4 + 48);
    v13 = a5;
    if (v12)
    {
      v13 = a5;
      if (*(int *)(v12 + 16) >= 1)
      {
        v14 = malloc_type_malloc(16 * *(int *)(a4 + 80), 0x1000040451B5BE8uLL);
        if (!v14)
          return 12;
        v13 = v14;
        _platform_memmove();
        tre_reset_last_matched_branches((uint64_t)v13, *(int **)(*(_QWORD *)(a4 + 48) + 8), *(_DWORD *)(*(_QWORD *)(a4 + 48) + 16), 0, 0);
      }
    }
    v9 = 0;
    v15 = *(_DWORD *)(a4 + 72);
    if (v15 && a1)
    {
      v16 = *(_DWORD *)(a4 + 88);
      v17 = (v15 - 1);
      if (a1 - 1 < v17)
        v17 = a1 - 1;
      v18 = v17 + 1;
      v19 = (int *)(*(_QWORD *)(a4 + 24) + 4);
      v20 = a2;
      do
      {
        v21 = *(v19 - 1);
        v22 = a6;
        if ((_DWORD)v21 != v16)
        {
          if ((int)v13[4 * v21] < 1)
            LODWORD(v22) = -1;
          else
            LODWORD(v22) = v13[4 * v21 + 2];
          v22 = (int)v22;
        }
        *v20 = v22;
        v23 = *v19;
        v24 = a6;
        if ((_DWORD)v23 != v16)
        {
          if ((int)v13[4 * v23] < 1)
            LODWORD(v24) = -1;
          else
            LODWORD(v24) = v13[4 * v23 + 2];
          v24 = (int)v24;
        }
        v20[1] = v24;
        if (v22 == -1 || v24 == -1)
        {
          *v20 = -1;
          v20[1] = -1;
        }
        v20 += 2;
        v19 += 2;
        --v18;
      }
      while (v18);
      v9 = v17 + 1;
    }
    if (v13 != a5)
      free(v13);
  }
  v25 = v9;
  if (v9 < a1)
  {
    v26 = v9 + 1;
    do
    {
      v27 = &a2[2 * v25];
      v25 = v26;
      *v27 = -1;
      v27[1] = -1;
      ++v26;
    }
    while (v25 < a1);
  }
  return 0;
}

uint64_t tre_reset_last_matched_branches(uint64_t result, int *a2, int a3, int a4, int a5)
{
  int v7;
  uint64_t v9;
  int v10;
  _DWORD *v11;
  int v12;
  int **v13;
  int v14;
  int *v15;
  unsigned int v16;
  uint64_t v17;
  int *v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  int **v22;
  int v23;
  int *v24;
  unsigned int v25;
  uint64_t v26;
  BOOL v27;

  if (a3 >= 1)
  {
    v7 = a3;
    v9 = result;
    v10 = 0;
    v11 = (_DWORD *)(result + 16 * a4 + 12);
    do
    {
      v12 = a2[2];
      if (v12 == 1)
      {
        v13 = *(int ***)a2;
        if (a4 >= 1 && (a5 || *(_DWORD *)(v9 + 16 * *((int *)v13 + 5) + 12) < *v11))
        {
          v14 = *((_DWORD *)v13 + 6);
          if (v14 >= 1)
          {
            v15 = *v13;
            v16 = v14 + 1;
            do
            {
              v17 = *v15++;
              *(_DWORD *)(v9 + 16 * v17) = 0;
              --v16;
            }
            while (v16 > 1);
          }
        }
        if (*((int *)v13 + 4) >= 1)
          result = tre_reset_last_matched_branches(v9, v13[1]);
      }
      else
      {
        if (a5)
          goto LABEL_17;
        if (v12 >= 1)
        {
          v10 = 0;
          v18 = (int *)(*(_QWORD *)a2 + 20);
          v19 = v12 + 1;
          do
          {
            v20 = *v18;
            v18 += 8;
            v21 = *(_DWORD *)(v9 + 16 * v20 + 12);
            if (v21 > v10)
              v10 = v21;
            --v19;
          }
          while (v19 > 1);
LABEL_17:
          if (v12 >= 1)
          {
            v22 = *(int ***)a2;
            do
            {
              if (a5 || *(_DWORD *)(v9 + 16 * *((int *)v22 + 5) + 12) < v10)
              {
                v23 = *((_DWORD *)v22 + 6);
                if (v23 >= 1)
                {
                  v24 = *v22;
                  v25 = v23 + 1;
                  do
                  {
                    v26 = *v24++;
                    *(_DWORD *)(v9 + 16 * v26) = 0;
                    --v25;
                  }
                  while (v25 > 1);
                }
              }
              if (*((int *)v22 + 4) >= 1)
                result = tre_reset_last_matched_branches(v9, v22[1]);
              v22 += 4;
              v27 = __OFSUB__(v12--, 1);
            }
            while (!((v12 < 0) ^ v27 | (v12 == 0)));
          }
          goto LABEL_32;
        }
        v10 = 0;
      }
LABEL_32:
      a2 += 4;
    }
    while (v7-- > 1);
  }
  return result;
}

int regwnexec(const regex_t *a1, const __int32 *a2, size_t a3, size_t a4, regmatch_t __pmatch[], int a6)
{
  if (a1->re_magic == 62053)
    return tre_match((unsigned int *)a1->re_g, (uint64_t)a2, a3, 0, a4, &__pmatch->rm_so, a6);
  else
    return 2;
}

int regwexec(const regex_t *a1, const __int32 *a2, size_t a3, regmatch_t __pmatch[], int a5)
{
  if (a1->re_magic == 62053)
    return tre_match((unsigned int *)a1->re_g, (uint64_t)a2, -1, 0, a3, &__pmatch->rm_so, a5);
  else
    return 2;
}

char *tre_ast_new_node(uint64_t a1, int a2, size_t a3)
{
  char *v6;
  char *v7;

  v6 = tre_mem_alloc_impl(a1, 0, 0, 1, 0x48uLL);
  if (v6)
  {
    v7 = tre_mem_alloc_impl(a1, 0, 0, 1, a3);
    *(_QWORD *)v6 = v7;
    if (v7)
    {
      *((_WORD *)v6 + 32) = -1;
      *((_DWORD *)v6 + 12) = a2;
      *((_DWORD *)v6 + 13) = -1;
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

char *tre_ast_new_literal(uint64_t a1, int a2, int a3, int a4)
{
  char *result;
  _DWORD *v8;

  result = tre_ast_new_node(a1, 0, 0x18uLL);
  if (result)
  {
    v8 = *(_DWORD **)result;
    *v8 = a2;
    v8[1] = a3;
    v8[2] = a4;
  }
  return result;
}

char *tre_ast_new_iter(uint64_t a1, uint64_t a2, int a3, int a4, char a5)
{
  char *result;
  uint64_t v10;

  result = tre_ast_new_node(a1, 2, 0x20uLL);
  if (result)
  {
    v10 = *(_QWORD *)result;
    *(_QWORD *)v10 = a2;
    *(_DWORD *)(v10 + 8) = a3;
    *(_DWORD *)(v10 + 12) = a4;
    *(_BYTE *)(v10 + 16) = *(_BYTE *)(v10 + 16) & 0xFE | a5 & 1;
    *((_DWORD *)result + 14) = *(_DWORD *)(a2 + 56);
  }
  return result;
}

char *tre_ast_new_union(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *result;
  _QWORD *v6;

  result = tre_ast_new_node(a1, 3, 0x18uLL);
  if (result)
  {
    v6 = *(_QWORD **)result;
    *v6 = a2;
    v6[1] = a3;
    *((_DWORD *)result + 14) = *(_DWORD *)(a3 + 56) + *(_DWORD *)(a2 + 56);
  }
  return result;
}

char *tre_ast_new_catenation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *result;
  _QWORD *v6;

  result = tre_ast_new_node(a1, 1, 0x10uLL);
  if (result)
  {
    v6 = *(_QWORD **)result;
    *v6 = a2;
    v6[1] = a3;
    *((_DWORD *)result + 14) = *(_DWORD *)(a3 + 56) + *(_DWORD *)(a2 + 56);
  }
  return result;
}

uint64_t tre_compile(uint64_t a1, uint64_t a2, int a3, unsigned int a4, size_t a5)
{
  void **v10;
  void **v11;
  uint64_t *v12;
  uint64_t *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int *v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  _DWORD *v23;
  int v24;
  int v25;
  uint64_t v26;
  int v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  char *v37;
  uint64_t v38;
  _DWORD *v39;
  _QWORD *v41;
  uint64_t v42;
  _DWORD *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  int v47;
  char *v48;
  int v49;
  int v50;
  uint64_t v53;
  unsigned int v54;
  int *v55;
  size_t v56;
  int v57;
  unsigned int *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  char *v62;
  _QWORD *v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  void *v68;
  _QWORD *v69;
  _QWORD *v70;
  _DWORD *v71;
  __int128 *v72;
  __int128 v73;
  __int128 v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int *v77;
  unsigned int v78;
  char *v79;
  _QWORD *v80;
  _QWORD *v81;
  uint64_t v82;
  _QWORD v83[2];
  uint64_t v84;
  uint64_t v85;
  __int128 v86;
  size_t count[2];
  _OWORD v88[4];

  v10 = (void **)tre_stack_new(512, 10240, 128);
  if (!v10)
    return 12;
  v11 = v10;
  v12 = (uint64_t *)tre_mem_new_impl(0, 0);
  if (!v12)
  {
    tre_stack_destroy(v11);
    return 12;
  }
  v13 = v12;
  *(_OWORD *)count = 0u;
  memset(v88, 0, sizeof(v88));
  v84 = 0;
  v86 = 0u;
  v83[0] = v12;
  v83[1] = v11;
  v85 = a2;
  if ((~a4 & 0x101) != 0)
    v14 = a4 & 0xFFFFFFBF;
  else
    v14 = a4;
  DWORD1(v88[1]) = v14;
  DWORD2(v88[0]) = -1;
  count[0] = a5;
  LODWORD(count[1]) = a3;
  LODWORD(v88[0]) = 0x40000000;
  v15 = tre_parse((uint64_t)v83);
  if ((_DWORD)v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = 0;
    v19 = 0;
LABEL_48:
    tre_mem_destroy(v13);
    tre_stack_destroy(v11);
    if (v17)
      free(v17);
    if (v18)
      free(v18);
    *(_QWORD *)(a1 + 24) = v19;
    if (v19)
      *(_QWORD *)(v19 + 56) = 0;
    tre_free(a1);
    return v16;
  }
  v20 = HIDWORD(count[1]);
  v21 = DWORD2(v88[0]);
  *(_QWORD *)(a1 + 8) = SHIDWORD(count[1]) - 1;
  v22 = v84;
  if ((v21 & 0x80000000) == 0 && LODWORD(v88[1]))
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v16 = 2;
    goto LABEL_48;
  }
  if (v21 >= v20)
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v16 = 6;
    goto LABEL_48;
  }
  v23 = malloc_type_calloc(1uLL, 0x78uLL, 0x1030040C46BC5F1uLL);
  v19 = (uint64_t)v23;
  if (!v23)
    goto LABEL_45;
  v23[25] = (DWORD2(v88[0]) & 0x80000000) == 0;
  v24 = LODWORD(v88[0]) - 0x40000000;
  v23[18] = HIDWORD(count[1]);
  v23[19] = v24;
  v25 = HIDWORD(v88[0]);
  *((_QWORD *)v23 + 13) = *(_QWORD *)((char *)v88 + 12);
  *((_QWORD *)v23 + 7) = count[0];
  if ((v14 & 4) != 0 && v25 < 1)
  {
    v17 = 0;
  }
  else
  {
    v26 = tre_add_tags(0, (int *)v11, v22, (uint64_t)v23);
    if ((_DWORD)v26)
      goto LABEL_33;
    v34 = *(unsigned int *)(v19 + 80);
    if ((int)v34 < 1)
    {
      v17 = 0;
    }
    else
    {
      v35 = malloc_type_malloc(4 * v34 + 4, 0x100004052888210uLL);
      v17 = v35;
      if (!v35)
        goto LABEL_46;
      *(_QWORD *)(v19 + 32) = v35;
      _platform_memset();
      LODWORD(v34) = *(_DWORD *)(v19 + 80);
    }
    v36 = malloc_type_calloc((2 * v34 + 3), 4uLL, 0x100004052888210uLL);
    *(_QWORD *)(v19 + 40) = v36;
    if (!v36)
      goto LABEL_45;
    v37 = (char *)malloc_type_calloc(HIDWORD(count[1]), 8uLL, 0x100004000313F17uLL);
    if (!v37)
      goto LABEL_45;
    v38 = HIDWORD(count[1]);
    if (SHIDWORD(count[1]) >= 1)
    {
      v39 = v37 + 4;
      do
      {
        *v39 = -1;
        v39 += 2;
        --v38;
      }
      while (v38);
    }
    *(_QWORD *)(v19 + 24) = v37;
    v26 = tre_add_tags((uint64_t)v13, (int *)v11, v22, v19);
    if ((_DWORD)v26)
      goto LABEL_33;
  }
  v26 = tre_expand_ast((uint64_t)v13, (int *)v11, v22, (int *)v88 + 1, (uint64_t)v17);
  if ((_DWORD)v26)
  {
LABEL_33:
    v16 = v26;
    v17 = 0;
    v18 = 0;
    goto LABEL_48;
  }
  v27 = DWORD1(v88[0])++;
  v28 = tre_ast_new_literal((uint64_t)v13, 0, 0, v27);
  if (!v28 || (v29 = tre_ast_new_catenation((uint64_t)v13, v22, (uint64_t)v28)) == 0)
  {
LABEL_45:
    v17 = 0;
    goto LABEL_46;
  }
  v30 = v29;
  v26 = tre_compute_nfl((uint64_t)v13, (int *)v11, (uint64_t)v29);
  if ((_DWORD)v26)
    goto LABEL_33;
  v17 = malloc_type_malloc(4 * SDWORD1(v88[0]), 0x100004052888210uLL);
  if (!v17)
  {
LABEL_46:
    v18 = 0;
LABEL_47:
    v16 = 12;
    goto LABEL_48;
  }
  v18 = (int *)malloc_type_malloc(4 * SDWORD1(v88[0]), 0x100004052888210uLL);
  if (!v18)
    goto LABEL_47;
  if (SDWORD1(v88[0]) >= 1)
  {
    v31 = 0;
    do
      *((_DWORD *)v17 + v31++) = 0;
    while (v31 < SDWORD1(v88[0]));
  }
  tre_ast_to_tnfa(v30, 0, (uint64_t)v17, 0);
  if (SDWORD1(v88[0]) < 1)
  {
    v33 = 0;
  }
  else
  {
    v32 = 0;
    v33 = 0;
    do
    {
      v18[v32] = v33;
      v33 += *((_DWORD *)v17 + v32) + 1;
      *((_DWORD *)v17 + v32++) = 0;
    }
    while (v32 < SDWORD1(v88[0]));
  }
  v41 = malloc_type_calloc((v33 + 1), 0x38uLL, 0x1032040B21D0138uLL);
  if (!v41)
    goto LABEL_47;
  *(_QWORD *)v19 = v41;
  *(_DWORD *)(v19 + 64) = v33;
  v81 = v41;
  v42 = tre_ast_to_tnfa(v30, (uint64_t)v41, (uint64_t)v17, (uint64_t)v18);
  if ((_DWORD)v42)
  {
    v16 = v42;
    goto LABEL_48;
  }
  *(_DWORD *)(v19 + 68) = -1;
  v79 = v30;
  v43 = (_DWORD *)*((_QWORD *)v30 + 3);
  if (*(_WORD *)(v22 + 64))
    goto LABEL_77;
  v44 = *v43;
  if ((v44 & 0x80000000) != 0)
    goto LABEL_77;
  v45 = -1;
  v46 = *((_QWORD *)v30 + 3);
  do
  {
    v47 = v18[v44];
    if (v81[7 * v47 + 1])
    {
      v48 = (char *)&v81[7 * v47];
      do
      {
        v49 = *(_DWORD *)v48;
        v50 = *((_DWORD *)v48 + 1);
        if (*(_DWORD *)v48 <= v50)
        {
          if (v49 == -1 || v50 != v49 || v45 != -1)
          {
            *(_DWORD *)(v19 + 68) = -1;
            goto LABEL_77;
          }
          *(_DWORD *)(v19 + 68) = v49;
          v45 = v49;
        }
        v53 = *((_QWORD *)v48 + 8);
        v48 += 56;
      }
      while (v53);
    }
    v54 = *(_DWORD *)(v46 + 64);
    v46 += 64;
    v44 = v54;
  }
  while ((v54 & 0x80000000) == 0);
LABEL_77:
  if ((*v43 & 0x80000000) != 0)
  {
    v56 = 1;
  }
  else
  {
    v55 = v43 + 16;
    v56 = 1;
    do
    {
      v57 = *v55;
      v55 += 16;
      ++v56;
    }
    while ((v57 & 0x80000000) == 0);
  }
  v80 = malloc_type_calloc(v56, 0x38uLL, 0x1032040B21D0138uLL);
  if (!v80)
    goto LABEL_47;
  *(_QWORD *)(v19 + 8) = v80;
  v58 = (unsigned int *)*((_QWORD *)v30 + 3);
  v59 = *v58;
  if ((v59 & 0x80000000) != 0)
  {
    v76 = 0;
  }
  else
  {
    v60 = 0;
    v61 = v80;
    do
    {
      v62 = (char *)&v81[7 * v18[v59]];
      v63 = &v61[7 * v60];
      v63[3] = 0;
      v64 = v63 + 3;
      *(v64 - 2) = v62;
      *((_DWORD *)v64 - 2) = v59;
      v65 = *((_QWORD *)v58 + 2);
      v82 = v60;
      if (v65)
      {
        v66 = 0;
        do
        {
          v67 = *(_DWORD *)(v65 + v66);
          v66 += 4;
        }
        while ((v67 & 0x80000000) == 0);
        v68 = malloc_type_malloc(v66 & 0x3FFFFFFFCLL, 0x100004052888210uLL);
        *v64 = v68;
        if (!v68)
          goto LABEL_47;
        _platform_memmove();
        v61 = v80;
        v60 = v82;
      }
      v69 = &v61[7 * v60];
      v69[4] = 0;
      v70 = v69 + 4;
      if (*((_QWORD *)v58 + 6))
      {
        v71 = malloc_type_malloc(0x24uLL, 0x100004052888210uLL);
        *v70 = v71;
        if (!v71)
          goto LABEL_47;
        v72 = (__int128 *)*((_QWORD *)v58 + 6);
        v73 = *v72;
        v74 = v72[1];
        v71[8] = *((_DWORD *)v72 + 8);
        *(_OWORD *)v71 = v73;
        *((_OWORD *)v71 + 1) = v74;
        v60 = v82;
        v61 = v80;
      }
      v75 = v58[16];
      v58 += 16;
      v59 = v75;
      LODWORD(v61[7 * v60++ + 5]) = *(v58 - 10);
    }
    while ((v75 & 0x80000000) == 0);
    v76 = v60;
  }
  v80[7 * v76 + 1] = 0;
  *(_DWORD *)(v19 + 64) = v33;
  *(_QWORD *)(v19 + 16) = &v81[7 * v18[**((int **)v79 + 4)]];
  *(_DWORD *)(v19 + 92) = DWORD1(v88[0]);
  *(_DWORD *)(v19 + 96) = v14;
  tre_mem_destroy(v13);
  tre_stack_destroy(v11);
  free(v17);
  free(v18);
  *(_DWORD *)a1 = 62053;
  *(_QWORD *)(a1 + 24) = v19;
  v77 = *(unsigned int **)(v19 + 56);
  if (!v77)
    return 0;
  v16 = 0;
  do
    v78 = __ldaxr(v77);
  while (__stlxr(v78 + 1, v77));
  return v16;
}

uint64_t tre_add_tags(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  _DWORD *v8;
  void *v9;
  unsigned int *v10;
  signed int *v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  unsigned int *v15;
  char v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  int *v22;
  int v23;
  BOOL v24;
  int v25;
  unsigned int v26;
  unsigned int *v27;
  signed int *v28;
  unsigned int v29;
  int v30;
  signed int *v31;
  signed int v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE **v35;
  _BYTE *v36;
  int v37;
  int v38;
  uint64_t v39;
  _DWORD *v40;
  uint64_t v41;
  unsigned __int8 *v42;
  unsigned int v43;
  unsigned int v44;
  char *v45;
  int v46;
  int v47;
  int v48;
  int v49;
  char *v50;
  char *v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  _DWORD **v55;
  _DWORD *v56;
  int v57;
  uint64_t v58;
  int32x2_t *v59;
  int32x2_t v60;
  int32x2_t *v61;
  int32x2_t v62;
  int v63;
  uint64_t v64;
  int v65;
  signed int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unsigned int v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  unsigned int v79;
  int v80;
  unsigned int *v81;
  signed int *v82;
  unsigned int v83;
  uint64_t v84;
  int v85;
  char *v86;
  uint64_t v87;
  int v88;
  int v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  unsigned int v95;
  uint64_t *v96;
  int v97;
  unsigned int v98;
  unsigned int *v99;
  signed int *v100;
  unsigned int v101;
  uint64_t v102;
  int v103;
  int v104;
  int v105;
  uint64_t v106;
  char v107;
  int v108;
  int v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  int *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  int32x2_t *v119;
  int32x2_t v120;
  int32x2_t *v121;
  int v122;
  int v123;
  __int32 v124;
  uint64_t v126;
  int v127;
  char *v128;
  int32x2_t v129;
  int32x2_t v130;
  int v131;
  int v132;
  int32x2_t v133;
  int v134;
  unsigned int v135;
  unsigned int *v136;
  signed int *v137;
  unsigned int v138;
  int v139;
  unsigned int v140;
  unsigned int *v141;
  signed int *v142;
  unsigned int v143;
  uint64_t v144;
  uint64_t v145;
  unsigned int *v146;
  int v147;
  int v148;
  uint64_t v149;
  int *v150;
  int v151;
  unsigned int v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  int *v157;
  int v158;
  void *v159;
  void *v160;
  uint64_t v161;
  unsigned int *v162;
  uint64_t v163;
  unsigned int *v164;
  unsigned int v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t *v168;
  uint64_t v169;
  int *v170;
  char *v171;
  char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  char *v176;
  char *v177;
  unsigned int *v178;
  int v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  int v184;
  unsigned int v185;
  uint64_t v186;
  uint64_t v187;
  int v188;
  _QWORD *v189;
  uint64_t v190;
  signed int v192;
  void *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  unsigned int *v197;
  int v198;
  signed int *v199;
  int v200;
  int v201;
  uint64_t v202;
  int v203;
  signed int v204;
  int v205;
  char *v206;
  int v207;

  v207 = tre_stack_num_objects((uint64_t)a2);
  if (a1)
  {
    *(_DWORD *)(a4 + 88) = 0;
    **(_DWORD **)(a4 + 40) = -1;
  }
  v8 = malloc_type_malloc(4 * (2 * (*(_DWORD *)(a4 + 76) + *(_DWORD *)(a4 + 72)) + 2), 0x100004052888210uLL);
  if (v8)
  {
    v9 = v8;
    *v8 = -1;
    if (a1)
    {
      v10 = (unsigned int *)malloc_type_malloc(4 * (*(_DWORD *)(a4 + 80) + 2 * *(_DWORD *)(a4 + 104) + 1), 0x100004052888210uLL);
      if (!v10)
      {
        v12 = 12;
LABEL_382:
        free(v9);
        return v12;
      }
      v11 = (signed int *)v10;
      v196 = (uint64_t)&v10[2 * *(int *)(a4 + 104) + 1];
    }
    else
    {
      v11 = 0;
      v196 = 0;
    }
    v194 = a3;
    tre_stack_push_voidptr(a2, a3);
    v12 = tre_stack_push_int(a2, 0);
    v13 = tre_stack_num_objects((uint64_t)a2);
    v14 = (_DWORD)v12 != 0;
    v200 = 2;
    LODWORD(v202) = 0;
    v15 = (unsigned int *)v9;
    if (v13 <= v207)
    {
      v198 = 0;
      v204 = 0;
      v199 = v11;
    }
    else
    {
      v198 = 0;
      v204 = 0;
      v199 = v11;
      if (!(_DWORD)v12)
      {
        v204 = 0;
        v205 = 0;
        v198 = 0;
        v202 = 0;
        v199 = v11;
        v203 = -1;
        v200 = 2;
        v201 = 1;
        v15 = (unsigned int *)v9;
        v197 = (unsigned int *)v11;
        v195 = a4;
        v193 = v9;
        while (1)
        {
          v16 = 1;
          switch(tre_stack_pop_int((uint64_t)a2))
          {
            case 0u:
              v16 = 0;
              goto LABEL_14;
            case 1u:
LABEL_14:
              v17 = tre_stack_pop_voidptr((uint64_t)a2);
              v18 = *(_DWORD *)(v17 + 52);
              if ((v18 & 0x80000000) == 0)
              {
                v19 = 0;
                do
                  v20 = v15[v19++];
                while (v20 != -1);
                v15[v19 - 1] = 2 * v18;
                v15[v19] = -1;
                v205 |= 1u;
                tre_stack_push_voidptr(a2, v17);
                v21 = tre_stack_push_int(a2, v18);
                if ((_DWORD)v21)
                  goto LABEL_214;
                v21 = tre_stack_push_int(a2, 7u);
                if ((_DWORD)v21)
                  goto LABEL_214;
              }
              break;
            case 2u:
              v33 = tre_stack_pop_voidptr((uint64_t)a2);
              v34 = v33;
              v35 = *(_BYTE ***)(v33 + 40);
              if (!v35)
                v35 = (_BYTE **)v33;
              v36 = *v35;
              v37 = tre_stack_pop_int((uint64_t)a2);
              v38 = v203;
              if ((v36[16] & 1) != 0)
                v38 = v37;
              v203 = v38;
              v39 = *(_QWORD *)v36;
              if (!a1)
              {
                v88 = *(_DWORD *)(v39 + 60);
                v12 = 0;
                *(_DWORD *)(v34 + 60) = tre_stack_pop_int((uint64_t)a2) + v88;
                goto LABEL_215;
              }
              v40 = *(_DWORD **)(v39 + 8);
              if (v40 && (int)v40[6] >= 1)
              {
                if ((v202 & 0x80000000) != 0)
                {
LABEL_56:
                  LODWORD(v41) = -1;
                }
                else
                {
                  v41 = 0;
                  v42 = (unsigned __int8 *)(v40 + 10);
                  while (1)
                  {
                    v44 = *v42++;
                    v43 = v44;
                    if (v44)
                      break;
                    v41 += 8;
                    if ((v202 & 0xFFFFFFF8) + 8 == v41)
                      goto LABEL_56;
                  }
                  if ((v43 & 1) == 0)
                  {
                    do
                    {
                      v107 = v43;
                      LODWORD(v41) = v41 + 1;
                      v43 >>= 1;
                    }
                    while ((v107 & 2) == 0);
                  }
                }
                v40[5] = v41;
                v45 = tre_mem_alloc_impl(a1, 0, 0, 1, ((*(_DWORD *)(a4 + 80) + 7) >> 3) + 80);
                if (!v45)
                  goto LABEL_102;
                *((_QWORD *)v45 + 1) = v40;
                v46 = v40[5];
                *((_DWORD *)v45 + 4) = 1;
                *((_DWORD *)v45 + 5) = v46;
                v47 = v40[7];
                v48 = v40[8] + 1;
                *((_DWORD *)v45 + 6) = v47;
                *((_DWORD *)v45 + 7) = v48;
                v49 = v40[9];
                *((_DWORD *)v45 + 8) = v49;
                *((_QWORD *)v45 + 6) = v45;
                *((_DWORD *)v45 + 14) = 1;
                *((_DWORD *)v45 + 17) = v47 + 1;
                *((_DWORD *)v45 + 18) = v48;
                *((_DWORD *)v45 + 19) = v49;
                v39 = *(_QWORD *)v36;
                *(_QWORD *)(*(_QWORD *)v36 + 8) = v45 + 40;
              }
              v21 = tre_merge_branches(a1, v34, v39, 0, *(_DWORD *)(a4 + 80));
              if ((_DWORD)v21)
                goto LABEL_214;
              if ((v36[16] & 1) == 0)
                goto LABEL_109;
              if (!*((_DWORD *)v36 + 2) && *((int *)v36 + 3) <= 1)
              {
                v50 = tre_ast_new_literal(a1, -1, -1, -1);
                if (v50)
                {
                  v51 = tre_ast_new_union(a1, (uint64_t)v50, *(_QWORD *)v36);
                  if (v51)
                  {
                    v200 = 0;
                    v12 = 0;
                    *(_QWORD *)v36 = v51;
                    goto LABEL_215;
                  }
                }
LABEL_102:
                v12 = 12;
                goto LABEL_215;
              }
              v200 = 0;
              goto LABEL_158;
            case 3u:
              --v15;
              do
              {
                v52 = v15[1];
                ++v15;
              }
              while (v52 != -1);
LABEL_68:
              v205 = 0;
              goto LABEL_158;
            case 4u:
              v53 = tre_stack_pop_voidptr((uint64_t)a2);
              v54 = v53;
              v55 = *(_DWORD ***)(v53 + 40);
              if (!v55)
                v55 = (_DWORD **)v53;
              v56 = *v55;
              v57 = tre_stack_pop_int((uint64_t)a2);
              if (!a1)
              {
                v89 = *(_DWORD *)(*(_QWORD *)v56 + 60) + v57 + *(_DWORD *)(*((_QWORD *)v56 + 1) + 60);
                *(_DWORD *)(v54 + 60) = v89;
                if ((int)v56[4] >= 1)
                  *(_DWORD *)(v54 + 60) = ++v89;
                if ((int)v56[5] >= 1)
                  *(_DWORD *)(v54 + 60) = v89 + 1;
                v15 = (unsigned int *)tre_stack_pop_voidptr((uint64_t)a2);
LABEL_109:
                v12 = 0;
                v90 = 1;
LABEL_110:
                v200 = v90;
                goto LABEL_215;
              }
              v15 = (unsigned int *)tre_stack_pop_voidptr((uint64_t)a2);
              if (!*(_WORD *)(v54 + 66))
                goto LABEL_109;
              v58 = *((_QWORD *)v56 + 1);
              v60 = *(int32x2_t *)(*(_QWORD *)v56 + 8);
              v59 = *(int32x2_t **)(*(_QWORD *)v56 + 16);
              v62 = *(int32x2_t *)(v58 + 8);
              v61 = *(int32x2_t **)(v58 + 16);
              v63 = v56[4];
              if (v63 >= 1)
              {
                v64 = tre_add_tag_right(a1, *(_QWORD *)v56, v63);
                if ((_DWORD)v64)
                  goto LABEL_75;
                *(_DWORD *)(*(_QWORD *)(v195 + 32) + 4 * (int)v56[4]) = 1;
                if (!*(_QWORD *)&v60)
                {
                  v64 = tre_merge_branches(a1, *(_QWORD *)v56, 0, -1, *(_DWORD *)(v195 + 80));
                  if ((_DWORD)v64)
                  {
LABEL_75:
                    v12 = v64;
                    v9 = v193;
                    goto LABEL_76;
                  }
                  v60 = *(int32x2_t *)(*(_QWORD *)v56 + 8);
                }
                *(_DWORD *)(*(_QWORD *)&v60 + 20) = v56[4];
                a4 = v195;
              }
              v105 = v56[5];
              if (v105 < 1)
                goto LABEL_194;
              v106 = tre_add_tag_right(a1, *((_QWORD *)v56 + 1), v105);
              if ((_DWORD)v106)
              {
                v12 = v106;
                v9 = v193;
                v11 = (signed int *)v197;
                goto LABEL_156;
              }
              *(_DWORD *)(*(_QWORD *)(v195 + 32) + 4 * (int)v56[5]) = 1;
              a4 = v195;
              if (v62)
                goto LABEL_193;
              v126 = tre_merge_branches(a1, *((_QWORD *)v56 + 1), 0, -1, *(_DWORD *)(v195 + 80));
              if ((_DWORD)v126)
              {
                v12 = v126;
              }
              else
              {
                v62 = *(int32x2_t *)(*((_QWORD *)v56 + 1) + 8);
LABEL_193:
                *(_DWORD *)(*(_QWORD *)&v62 + 20) = v56[5];
LABEL_194:
                if (v59)
                {
                  if (v61)
                  {
                    v119 = (int32x2_t *)v59[1];
                    v120 = v61[1];
                    v9 = v193;
                    if (v119)
                    {
                      if (v120)
                      {
                        do
                        {
                          v121 = v119;
                          v119 = (int32x2_t *)*v119;
                        }
                        while (v119);
                        *v121 = v120;
                        v122 = v59[2].i32[0] + v61[2].i32[0];
LABEL_230:
                        v59[2].i32[0] = v122;
                      }
                    }
                    else if (v120)
                    {
                      v59[1] = v120;
                      v122 = v61[2].i32[0];
                      goto LABEL_230;
                    }
                    v127 = v61[3].i32[1] + v59[3].i32[1] - 1;
                    v59[3].i32[0] += v61[3].i32[0];
                    v59[3].i32[1] = v127;
                    v124 = v61[4].i32[0];
                  }
                  else
                  {
                    v9 = v193;
                    if (!*(_QWORD *)&v62)
                      goto LABEL_233;
                    **(int32x2_t **)&v62 = v59[1];
                    v59[1] = v62;
                    ++v59[2].i32[0];
                    v59[3] = vadd_s32(v59[3], *(int32x2_t *)(*(_QWORD *)&v62 + 28));
                    v124 = *(_DWORD *)(*(_QWORD *)&v62 + 36);
                  }
                  v59[4].i32[0] += v124;
                  goto LABEL_233;
                }
                if (v61)
                {
                  if (v60)
                  {
                    **(int32x2_t **)&v60 = v61[1];
                    v61[1] = v60;
                    ++v61[2].i32[0];
                    v61[3] = vadd_s32(v61[3], *(int32x2_t *)(*(_QWORD *)&v60 + 28));
                    v61[4].i32[0] += *(_DWORD *)(*(_QWORD *)&v60 + 36);
                  }
                  v59 = v61;
                  goto LABEL_204;
                }
                v128 = tre_mem_alloc_impl(a1, 0, 0, 1, 0x28uLL);
                if (v128)
                {
                  v59 = (int32x2_t *)v128;
                  *((_DWORD *)v128 + 7) = 1;
                  if (v60)
                  {
                    *((int32x2_t *)v128 + 1) = v60;
                    *((_DWORD *)v128 + 4) = 1;
                    v129.i32[1] = 1;
                    v129.i32[0] = *((_DWORD *)v128 + 6);
                    v130 = vadd_s32(*(int32x2_t *)(*(_QWORD *)&v60 + 28), v129);
                    *((int32x2_t *)v128 + 3) = v130;
                    v131 = *((_DWORD *)v128 + 8) + *(_DWORD *)(*(_QWORD *)&v60 + 36);
                    *((_DWORD *)v128 + 8) = v131;
                    if (v62)
                    {
                      **(int32x2_t **)&v60 = v62;
                      *((_DWORD *)v128 + 4) = 2;
                      *((int32x2_t *)v128 + 3) = vadd_s32(*(int32x2_t *)(*(_QWORD *)&v62 + 28), v130);
                      v132 = *(_DWORD *)(*(_QWORD *)&v62 + 36);
                      goto LABEL_243;
                    }
                  }
                  else if (v62)
                  {
                    *((int32x2_t *)v128 + 1) = v62;
                    *((_DWORD *)v128 + 4) = 1;
                    v133.i32[1] = 1;
                    v133.i32[0] = *((_DWORD *)v128 + 6);
                    *((int32x2_t *)v128 + 3) = vadd_s32(*(int32x2_t *)(*(_QWORD *)&v62 + 28), v133);
                    v131 = *(_DWORD *)(*(_QWORD *)&v62 + 36);
                    v132 = *((_DWORD *)v128 + 8);
LABEL_243:
                    *((_DWORD *)v128 + 8) = v132 + v131;
                  }
LABEL_204:
                  v9 = v193;
LABEL_233:
                  v12 = 0;
                  *(_QWORD *)(v54 + 16) = v59;
                  v200 = 1;
                  goto LABEL_251;
                }
                v12 = 12;
              }
              v9 = v193;
              goto LABEL_251;
            case 5u:
              v65 = tre_stack_pop_int((uint64_t)a2);
              v201 = tre_stack_pop_int((uint64_t)a2);
              v12 = 0;
              v66 = v204;
              if (v65 >= 0)
                v66 = v65;
              v204 = v66;
              goto LABEL_215;
            case 6u:
              v67 = tre_stack_pop_voidptr((uint64_t)a2);
              v68 = v67;
              v69 = *(uint64_t **)v67;
              v70 = **(_QWORD **)v67;
              if (!a1)
              {
                v12 = 0;
                *(_DWORD *)(v67 + 60) = *(_DWORD *)(v69[1] + 60) + *(_DWORD *)(v70 + 60);
                goto LABEL_215;
              }
              v21 = tre_merge_branches(a1, v70, v69[1], 0, *(_DWORD *)(a4 + 80));
              if (!(_DWORD)v21)
                v21 = tre_merge_branches(a1, v68, *v69, 0, *(_DWORD *)(a4 + 80));
              goto LABEL_214;
            case 7u:
              v71 = tre_stack_pop_int((uint64_t)a2);
              v72 = tre_stack_pop_voidptr((uint64_t)a2);
              v73 = v72;
              v74 = 0;
              do
                v75 = v15[v74++];
              while (v75 != -1);
              v15[v74 - 1] = (2 * v71) | 1;
              v15[v74] = -1;
              v205 |= 2u;
              if (v203 < 0)
                goto LABEL_158;
              if (a1)
              {
                v21 = tre_merge_branches(a1, v72, 0, v204, *(_DWORD *)(a4 + 80));
                if ((_DWORD)v21)
                  goto LABEL_214;
                v21 = tre_add_tag_right(a1, v73, v204);
                if ((_DWORD)v21)
                  goto LABEL_214;
                v76 = 0;
                *(_DWORD *)(*(_QWORD *)(a4 + 32) + 4 * v204) = 0;
                v77 = *(_QWORD *)(a4 + 40);
                do
                  v78 = *(_DWORD *)(v77 + 4 * v76++);
                while ((v78 & 0x80000000) == 0);
                *(_DWORD *)(v77 + 4 * v76 - 4) = v204;
                *(_DWORD *)(v77 + 4 * v76) = v203;
                *(_DWORD *)(v77 + 4 * (v76 + 1)) = -1;
                *v199 = v204;
                v199[1] = v203;
                ++v198;
                v79 = *v15;
                v80 = v202;
                if (*v15 != -1)
                {
                  v81 = v15 + 1;
                  do
                  {
                    if ((v79 & 0x80000000) == 0)
                    {
                      if ((v79 & 1) != 0)
                        v82 = (signed int *)(*(_QWORD *)(a4 + 24) + 8 * (v79 >> 1) + 4);
                      else
                        v82 = (signed int *)(*(_QWORD *)(a4 + 24) + 8 * (v79 >> 1));
                      *v82 = v204;
                    }
                    v83 = *v81++;
                    v79 = v83;
                  }
                  while (v83 != -1);
                }
                v199 += 2;
              }
              else
              {
                ++*(_DWORD *)(v72 + 60);
                v80 = v202;
              }
              v205 = 0;
              v12 = 0;
              v203 = -1;
              *v15 = -1;
              v202 = (v80 + 1);
LABEL_114:
              v204 = v201++;
              goto LABEL_215;
            case 0xAu:
              v84 = tre_stack_pop_voidptr((uint64_t)a2);
              v85 = tre_stack_pop_int((uint64_t)a2);
              v86 = tre_mem_alloc_impl(a1, 0, 0, 1, ((*(_DWORD *)(a4 + 80) + 7) >> 3) + 40);
              if (!v86)
                goto LABEL_102;
              v12 = 0;
              v87 = *(_QWORD *)(v84 + 16);
              *(_DWORD *)(v87 + 20) = v85;
              *((_DWORD *)v86 + 7) = *(_DWORD *)(v87 + 24) + 1;
              *((_QWORD *)v86 + 4) = *(_QWORD *)(v87 + 28);
              *((_QWORD *)v86 + 1) = v87;
              *((_DWORD *)v86 + 4) = 1;
              *(_QWORD *)(v84 + 8) = v86;
              *(_QWORD *)(v84 + 16) = 0;
              goto LABEL_215;
            default:
              goto LABEL_158;
          }
          switch(*(_DWORD *)(v17 + 48))
          {
            case 0:
              v22 = *(int **)v17;
              v23 = **(_DWORD **)v17;
              if ((v23 & 0x80000000) == 0 || (v23 != -4 ? (v24 = v23 == -1) : (v24 = 1), v24))
              {
                if (!v205)
                  goto LABEL_68;
              }
              else if (v23 != -2 || v205 == 0)
              {
LABEL_158:
                v12 = 0;
                goto LABEL_215;
              }
              if (!a1)
              {
                *(_DWORD *)(v17 + 60) = 1;
                v30 = v202;
LABEL_206:
                v205 = 0;
                v12 = 0;
                *v15 = -1;
                v202 = (v30 + 1);
                goto LABEL_114;
              }
              v21 = tre_merge_branches(a1, v17, 0, v204, *(_DWORD *)(a4 + 80));
              if ((_DWORD)v21)
                goto LABEL_214;
              v21 = tre_add_tag_left(a1, v17, v204);
              if ((_DWORD)v21)
                goto LABEL_214;
              if (v205 == 1)
                v25 = 2;
              else
                v25 = v200;
              *(_DWORD *)(*(_QWORD *)(a4 + 32) + 4 * v204) = v25;
              v26 = *v15;
              if (*v15 != -1)
              {
                v27 = v15 + 1;
                do
                {
                  if ((v26 & 0x80000000) == 0)
                  {
                    if ((v26 & 1) != 0)
                      v28 = (signed int *)(*(_QWORD *)(a4 + 24) + 8 * (v26 >> 1) + 4);
                    else
                      v28 = (signed int *)(*(_QWORD *)(a4 + 24) + 8 * (v26 >> 1));
                    *v28 = v204;
                  }
                  v29 = *v27++;
                  v26 = v29;
                }
                while (v29 != -1);
              }
              *v15 = -1;
              v30 = v202;
              if (*v22 != -4)
                goto LABEL_206;
              v31 = (signed int *)(*(_QWORD *)(a4 + 24) + 8 * v22[1]);
              if ((v31[1] & 0x80000000) == 0)
              {
                v32 = *v31;
                if (v32 < v204)
                {
                  *v199 = v204;
                  v199[1] = v32 - (v32 > 0);
                  v199 += 2;
                }
                goto LABEL_206;
              }
              v12 = 6;
              goto LABEL_215;
            case 1:
              v92 = **(_QWORD **)v17;
              v91 = *(_QWORD *)(*(_QWORD *)v17 + 8);
              v93 = tre_stack_push_voidptr(a2, v17);
              if (!(_DWORD)v93)
              {
                v93 = tre_stack_push_int(a2, 6u);
                if (!(_DWORD)v93)
                {
                  v93 = tre_stack_push_voidptr(a2, v91);
                  if (!(_DWORD)v93)
                  {
                    v93 = tre_stack_push_int(a2, 0);
                    if (!(_DWORD)v93)
                    {
                      v93 = tre_stack_push_int(a2, *(_DWORD *)(v92 + 60) + v201);
                      if (!(_DWORD)v93)
                      {
                        if (*(int *)(v92 + 60) < 1)
                        {
                          v95 = -1;
                        }
                        else
                        {
                          v94 = v201;
                          if (*(int *)(v91 + 60) <= 0)
                            v95 = -1;
                          else
                            v95 = v201;
                          if (*(int *)(v91 + 60) > 0)
                            v94 = v201 + 1;
                          v201 = v94;
                        }
                        v93 = tre_stack_push_int(a2, v95);
                        if (!(_DWORD)v93)
                        {
                          v93 = tre_stack_push_int(a2, 5u);
                          if (!(_DWORD)v93)
                          {
                            v93 = tre_stack_push_voidptr(a2, v92);
                            if (!(_DWORD)v93)
                              v93 = tre_stack_push_int(a2, 0);
                          }
                        }
                      }
                    }
                  }
                }
              }
              goto LABEL_250;
            case 2:
              v96 = *(uint64_t **)v17;
              if (!a1)
              {
                v21 = tre_stack_push_int(a2, v205 != 0);
                if ((_DWORD)v21)
                  goto LABEL_214;
              }
              v21 = tre_stack_push_int(a2, v204);
              if ((_DWORD)v21)
                goto LABEL_214;
              v21 = tre_stack_push_voidptr(a2, v17);
              if ((_DWORD)v21)
                goto LABEL_214;
              v21 = tre_stack_push_int(a2, 2u);
              if ((_DWORD)v21)
                goto LABEL_214;
              v21 = tre_stack_push_voidptr(a2, *v96);
              if ((_DWORD)v21)
                goto LABEL_214;
              v21 = tre_stack_push_int(a2, 0);
              if ((_DWORD)v21)
                goto LABEL_214;
              if (!v205)
              {
                v205 = 0;
                v12 = 0;
                v90 = 2;
                goto LABEL_110;
              }
              v97 = v202;
              if (!a1)
                goto LABEL_148;
              v21 = tre_merge_branches(a1, v17, 0, v204, *(_DWORD *)(a4 + 80));
              if (!(_DWORD)v21)
              {
                v21 = tre_add_tag_left(a1, v17, v204);
                if (!(_DWORD)v21)
                {
                  if (v205 == 1 && v204)
                    v200 = ~(2 * *((unsigned __int8 *)v96 + 16)) & 2;
                  a4 = v195;
                  *(_DWORD *)(*(_QWORD *)(v195 + 32) + 4 * v204) = v200;
                  v98 = *v15;
                  v11 = (signed int *)v197;
                  v97 = v202;
                  if (*v15 != -1)
                  {
                    v99 = v15 + 1;
                    do
                    {
                      if ((v98 & 0x80000000) == 0)
                      {
                        if ((v98 & 1) != 0)
                          v100 = (signed int *)(*(_QWORD *)(v195 + 24) + 8 * (v98 >> 1) + 4);
                        else
                          v100 = (signed int *)(*(_QWORD *)(v195 + 24) + 8 * (v98 >> 1));
                        *v100 = v204;
                      }
                      v101 = *v99++;
                      v98 = v101;
                    }
                    while (v101 != -1);
                  }
LABEL_148:
                  v12 = 0;
                  *v15 = -1;
                  v202 = (v97 + 1);
                  v204 = v201;
                  v205 = 0;
                  v200 = 2;
                  ++v201;
                  goto LABEL_215;
                }
              }
              goto LABEL_214;
            case 3:
              if (v205)
              {
                v102 = (v202 + 1);
                v103 = v201++;
                v104 = v204;
              }
              else
              {
                v104 = -1;
                v103 = v204;
                v102 = v202;
              }
              v202 = v102;
              v192 = v104;
              if ((v16 & 1) != 0
                || (int)((__PAIR64__(*(_DWORD *)(v17 + 56), *(_DWORD *)(v17 + 52) >> 30) - 1) >> 32) < 1)
              {
                v204 = v103;
              }
              else
              {
                v108 = tre_stack_num_objects((uint64_t)a2);
                tre_stack_push_voidptr(a2, v17);
                tre_stack_push_int(a2, 8u);
                if ((int)tre_stack_num_objects((uint64_t)a2) > v108)
                {
                  v204 = v103;
                  while (1)
                  {
                    v109 = tre_stack_pop_int((uint64_t)a2);
                    if (v109 == 9)
                      break;
                    if (v109 == 8)
                    {
                      v110 = tre_stack_pop_voidptr((uint64_t)a2);
                      v111 = *(uint64_t **)v110;
                      v112 = **(_QWORD **)v110;
                      *(_WORD *)(v110 + 66) = 1;
                      tre_stack_push_voidptr(a2, v110);
                      tre_stack_push_int(a2, 9u);
                      if (*(_DWORD *)(v112 + 48) != 3)
                      {
                        *((_DWORD *)v111 + 4) = v204;
LABEL_178:
                        v202 = (v202 + 1);
                        v204 = v201++;
                        goto LABEL_179;
                      }
                      v113 = a2;
                      v114 = v112;
LABEL_175:
                      tre_stack_push_voidptr(v113, v114);
                      tre_stack_push_int(a2, 8u);
                    }
LABEL_179:
                    if ((int)tre_stack_num_objects((uint64_t)a2) <= v108)
                      goto LABEL_210;
                  }
                  v115 = tre_stack_pop_voidptr((uint64_t)a2);
                  v114 = *(_QWORD *)(*(_QWORD *)v115 + 8);
                  if (*(_DWORD *)(v114 + 48) != 3)
                  {
                    *(_DWORD *)(*(_QWORD *)v115 + 20) = v204;
                    goto LABEL_178;
                  }
                  v113 = a2;
                  goto LABEL_175;
                }
                v204 = v103;
LABEL_210:
                if (a1)
                {
                  v21 = tre_stack_push_int(a2, v192);
                  if ((_DWORD)v21
                    || (v21 = tre_stack_push_voidptr(a2, v17), (_DWORD)v21)
                    || (v21 = tre_stack_push_int(a2, 0xAu), (_DWORD)v21))
                  {
LABEL_214:
                    v12 = v21;
                    goto LABEL_215;
                  }
                }
              }
              v117 = **(_QWORD **)v17;
              v116 = *(_QWORD *)(*(_QWORD *)v17 + 8);
              v93 = tre_stack_push_voidptr(a2, v15);
              if (!(_DWORD)v93)
              {
                v93 = tre_stack_push_int(a2, v205 != 0);
                if (!(_DWORD)v93)
                {
                  v93 = tre_stack_push_voidptr(a2, v17);
                  if (!(_DWORD)v93)
                  {
                    v93 = tre_stack_push_int(a2, 4u);
                    if (!(_DWORD)v93)
                    {
                      v93 = tre_stack_push_voidptr(a2, v116);
                      if (!(_DWORD)v93)
                      {
                        v93 = tre_stack_push_int(a2, 1u);
                        if (!(_DWORD)v93)
                        {
                          v93 = tre_stack_push_int(a2, 3u);
                          if (!(_DWORD)v93)
                          {
                            v93 = tre_stack_push_voidptr(a2, v117);
                            if (!(_DWORD)v93)
                            {
                              v118 = tre_stack_push_int(a2, 1u);
                              if ((_DWORD)v118)
                                goto LABEL_191;
                              if (v205)
                              {
                                if (a1)
                                {
                                  v118 = tre_merge_branches(a1, v17, 0, v192, *(_DWORD *)(v195 + 80));
                                  if ((_DWORD)v118 || (v118 = tre_add_tag_left(a1, v17, v192), (_DWORD)v118))
                                  {
LABEL_191:
                                    v12 = v118;
                                    goto LABEL_76;
                                  }
                                  if (v205 == 1)
                                    v134 = 2;
                                  else
                                    v134 = v200;
                                  *(_DWORD *)(*(_QWORD *)(v195 + 32) + 4 * v192) = v134;
                                  v135 = *v15;
                                  if (*v15 != -1)
                                  {
                                    v136 = v15 + 1;
                                    do
                                    {
                                      if ((v135 & 0x80000000) == 0)
                                      {
                                        if ((v135 & 1) != 0)
                                          v137 = (signed int *)(*(_QWORD *)(v195 + 24) + 8 * (v135 >> 1) + 4);
                                        else
                                          v137 = (signed int *)(*(_QWORD *)(v195 + 24) + 8 * (v135 >> 1));
                                        *v137 = v192;
                                      }
                                      v138 = *v136++;
                                      v135 = v138;
                                    }
                                    while (v138 != -1);
                                  }
                                }
                                v205 = 0;
                                v12 = 0;
                                *v15 = -1;
                              }
                              else
                              {
                                v205 = 0;
                                v12 = 0;
                              }
LABEL_76:
                              v11 = (signed int *)v197;
LABEL_156:
                              a4 = v195;
                              goto LABEL_215;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
LABEL_250:
              v12 = v93;
LABEL_251:
              v11 = (signed int *)v197;
LABEL_215:
              v123 = tre_stack_num_objects((uint64_t)a2);
              v14 = (_DWORD)v12 != 0;
              if (v123 <= v207 || (_DWORD)v12)
                goto LABEL_272;
              break;
            default:
              goto LABEL_158;
          }
        }
      }
    }
LABEL_272:
    if (v14)
    {
LABEL_381:
      free(v11);
      goto LABEL_382;
    }
    v139 = v202;
    if (a1)
    {
      if ((_DWORD)v202 != *(_DWORD *)(a4 + 80))
        goto LABEL_284;
      v140 = *v15;
      if (*v15 != -1)
      {
        v141 = v15 + 1;
        do
        {
          if ((v140 & 0x80000000) == 0)
          {
            if ((v140 & 1) != 0)
              v142 = (signed int *)(*(_QWORD *)(a4 + 24) + 8 * (v140 >> 1) + 4);
            else
              v142 = (signed int *)(*(_QWORD *)(a4 + 24) + 8 * (v140 >> 1));
            *v142 = v204;
          }
          v143 = *v141++;
          v140 = v143;
        }
        while (v143 != -1);
      }
      *v15 = -1;
      *(_DWORD *)(*(_QWORD *)(a4 + 32) + 4 * (int)v202) = v200;
      if (v199 > &v11[2 * *(int *)(a4 + 104)])
      {
LABEL_284:
        v12 = 2;
        goto LABEL_381;
      }
      *v199 = -1;
      if ((int)v202 >= 1)
      {
        v144 = 0;
        do
        {
          *(_DWORD *)(v196 + 4 * v144) = v144;
          ++v144;
        }
        while (v202 != v144);
      }
      v145 = *v11;
      if ((v145 & 0x80000000) == 0)
      {
        v146 = (unsigned int *)v11;
        do
        {
          if ((int)v145 < (int)v202)
          {
            v147 = *(_DWORD *)(v196 + 4 * v145);
            v148 = *(_DWORD *)(v196 + 4 * (int)v146[1]);
            if (v148 <= v147)
            {
              if ((int)v202 >= 1)
              {
                v149 = v202;
                v150 = (int *)v196;
                do
                {
                  v151 = *v150;
                  if (*v150 > v148 && v151 < v147)
                    *v150 = v151 + 1;
                  ++v150;
                  --v149;
                }
                while (v149);
              }
              *(_DWORD *)(v196 + 4 * v145) = v148 + 1;
            }
          }
          v153 = v146[2];
          v146 += 2;
          v145 = v153;
        }
        while ((v153 & 0x80000000) == 0);
      }
      if ((int)v202 < 1)
      {
LABEL_307:
        free(v11);
        v139 = v202;
        v11 = 0;
        goto LABEL_335;
      }
      v154 = 0;
      while (v154 == *(_DWORD *)(v196 + 4 * v154))
      {
        if (v202 == ++v154)
          goto LABEL_307;
      }
    }
    if (v11)
    {
      v155 = *(unsigned int *)(a4 + 72);
      v156 = v194;
      if ((int)v155 >= 1)
      {
        v157 = (int *)(*(_QWORD *)(a4 + 24) + 4);
        do
        {
          v158 = *v157;
          *(v157 - 1) = *(_DWORD *)(v196 + 4 * *(v157 - 1));
          if (v158 < (int)v202)
            v158 = *(_DWORD *)(v196 + 4 * v158);
          *v157 = v158;
          v157 += 2;
          --v155;
        }
        while (v155);
      }
      v159 = malloc_type_malloc(4 * (int)v202, 0x100004052888210uLL);
      if (!v159)
        goto LABEL_340;
      v160 = v159;
      if ((int)v202 >= 1)
      {
        v161 = 0;
        do
        {
          *((_DWORD *)v159 + *(int *)(v196 + v161)) = *(_DWORD *)(*(_QWORD *)(a4 + 32) + v161);
          v161 += 4;
        }
        while (4 * v202 != v161);
      }
      _platform_memmove();
      free(v160);
      v162 = *(unsigned int **)(a4 + 40);
      v163 = *v162;
      if ((v163 & 0x80000000) == 0)
      {
        v164 = v162 + 1;
        do
        {
          if ((int)v163 < (int)v202)
            LODWORD(v163) = *(_DWORD *)(v196 + 4 * v163);
          *(v164 - 1) = v163;
          v165 = *v164++;
          v163 = v165;
        }
        while ((v165 & 0x80000000) == 0);
      }
      v166 = tre_stack_push_voidptr(a2, v194);
      if ((_DWORD)v166)
        goto LABEL_339;
      while ((int)tre_stack_num_objects((uint64_t)a2) > v207)
      {
        v167 = tre_stack_pop_voidptr((uint64_t)a2);
        switch(*(_DWORD *)(v167 + 48))
        {
          case 0:
            if (**(_DWORD **)v167 != -3)
              goto LABEL_330;
            v12 = 0;
            *(_DWORD *)(*(_QWORD *)v167 + 4) = *(_DWORD *)(v196 + 4 * *(int *)(*(_QWORD *)v167 + 4));
            break;
          case 1:
          case 3:
            v168 = *(uint64_t **)v167;
            v166 = tre_stack_push_voidptr(a2, *(_QWORD *)(*(_QWORD *)v167 + 8));
            if ((_DWORD)v166)
              goto LABEL_339;
            v169 = *v168;
LABEL_332:
            v12 = tre_stack_push_voidptr(a2, v169);
            break;
          case 2:
            v169 = **(_QWORD **)v167;
            goto LABEL_332;
          default:
LABEL_330:
            v12 = 0;
            break;
        }
        if ((_DWORD)v12)
          goto LABEL_381;
      }
      v139 = v202;
      if (!a1)
        goto LABEL_380;
LABEL_336:
      v170 = *(int **)(v156 + 8);
      if (v170)
      {
        v171 = (char *)malloc_type_calloc(1uLL, 32 * v170[7] + 16 * v170[8] + 4 * v170[9], 0x3E577DE0uLL);
        if (v171)
        {
          v172 = v171;
          v173 = *(_QWORD *)(v156 + 8);
          v175 = *(int *)(v173 + 28);
          v174 = *(int *)(v173 + 32);
          tre_stack_push_voidptr(a2, v173);
          tre_stack_push_int(a2, 1u);
          v166 = tre_stack_push_int(a2, 0);
          if (!(_DWORD)v166)
          {
            v176 = &v172[32 * v175];
            v177 = &v176[16 * v174];
            v206 = v172;
            v178 = (unsigned int *)v11;
            while (2)
            {
              if ((int)tre_stack_num_objects((uint64_t)a2) > v207)
              {
                switch(tre_stack_pop_int((uint64_t)a2))
                {
                  case 0u:
                    v179 = tre_stack_pop_int((uint64_t)a2);
                    v166 = tre_stack_push_voidptr(a2, v206);
                    if ((_DWORD)v166)
                      goto LABEL_339;
                    v12 = tre_stack_push_int(a2, 1u);
                    if (!(_DWORD)v12)
                    {
                      v206 += 32 * v179;
                      goto LABEL_375;
                    }
                    goto LABEL_381;
                  case 1u:
                    v180 = v9;
                    v181 = tre_stack_pop_voidptr((uint64_t)a2);
                    v182 = tre_stack_pop_voidptr((uint64_t)a2);
                    v183 = v182;
                    *(_QWORD *)(v181 + 16) = *(_QWORD *)(v182 + 16);
                    v184 = *(_DWORD *)(v182 + 24);
                    if (v184 < 1)
                      goto LABEL_355;
                    *(_DWORD *)(v181 + 24) = v184;
                    *(_QWORD *)v181 = v177;
                    if ((int)v202 < 1)
                      goto LABEL_355;
                    v185 = 0;
                    do
                    {
                      if (((*(unsigned __int8 *)(v182 + (v185 >> 3) + 40) >> (v185 & 7)) & 1) != 0)
                      {
                        *(_DWORD *)v177 = v185;
                        v177 += 4;
                        if (v184 < 2)
                          break;
                        --v184;
                      }
                      ++v185;
                    }
                    while ((_DWORD)v202 != v185);
LABEL_355:
                    if (*(_QWORD *)v182)
                    {
                      v186 = tre_stack_push_voidptr(a2, *(_QWORD *)v182);
                      if ((_DWORD)v186)
                        goto LABEL_385;
                      v186 = tre_stack_push_voidptr(a2, v181 + 32);
                      if ((_DWORD)v186)
                        goto LABEL_385;
                      v186 = tre_stack_push_int(a2, 1u);
                      if ((_DWORD)v186)
                        goto LABEL_385;
                    }
                    if (*(int *)(v183 + 16) < 1)
                    {
                      v12 = 0;
                      v9 = v180;
                    }
                    else
                    {
                      *(_QWORD *)(v181 + 8) = v176;
                      v186 = tre_stack_push_voidptr(a2, *(_QWORD *)(v183 + 8));
                      if ((_DWORD)v186)
                      {
LABEL_385:
                        v12 = v186;
                        v9 = v180;
LABEL_386:
                        v11 = (signed int *)v178;
                        goto LABEL_381;
                      }
                      v187 = tre_stack_push_int(a2, *(_DWORD *)(v183 + 16));
                      v9 = v180;
                      if ((_DWORD)v187)
                        goto LABEL_384;
                      v12 = tre_stack_push_int(a2, 2u);
                    }
                    v11 = (signed int *)v178;
                    goto LABEL_375;
                  case 2u:
                    v188 = tre_stack_pop_int((uint64_t)a2);
                    v166 = tre_stack_push_voidptr(a2, v176);
                    if ((_DWORD)v166)
                      goto LABEL_339;
                    v12 = tre_stack_push_int(a2, 3u);
                    if ((_DWORD)v12)
                      goto LABEL_381;
                    v176 += 16 * v188;
                    goto LABEL_375;
                  case 3u:
                    v189 = (_QWORD *)tre_stack_pop_voidptr((uint64_t)a2);
                    v190 = tre_stack_pop_voidptr((uint64_t)a2);
                    *v189 = v206;
                    v189[1] = *(_QWORD *)(v190 + 16);
                    if (*(_QWORD *)v190
                      && ((v187 = tre_stack_push_voidptr(a2, *(_QWORD *)v190), (_DWORD)v187)
                       || (v187 = tre_stack_push_voidptr(a2, v189 + 2), (_DWORD)v187)
                       || (v187 = tre_stack_push_int(a2, 3u), (_DWORD)v187))
                      || (v187 = tre_stack_push_voidptr(a2, *(_QWORD *)(v190 + 8)), (_DWORD)v187))
                    {
LABEL_384:
                      v12 = v187;
                      goto LABEL_386;
                    }
                    v166 = tre_stack_push_int(a2, *(_DWORD *)(v190 + 16));
                    v11 = (signed int *)v178;
                    if ((_DWORD)v166)
                      goto LABEL_339;
                    v12 = tre_stack_push_int(a2, 0);
LABEL_375:
                    if ((_DWORD)v12)
                      goto LABEL_381;
                    continue;
                  default:
                    v12 = 0;
                    goto LABEL_375;
                }
              }
              break;
            }
            *(_QWORD *)(a4 + 48) = v172;
            v139 = v202;
            goto LABEL_380;
          }
LABEL_339:
          v12 = v166;
          goto LABEL_381;
        }
LABEL_340:
        v12 = 12;
        goto LABEL_381;
      }
LABEL_380:
      v12 = 0;
      *(_DWORD *)(a4 + 80) = v139;
      *(_DWORD *)(a4 + 84) = v198;
      *(_DWORD *)(a4 + 88) = v139;
      goto LABEL_381;
    }
LABEL_335:
    v156 = v194;
    if (!a1)
      goto LABEL_380;
    goto LABEL_336;
  }
  return 12;
}

uint64_t tre_expand_ast(uint64_t a1, int *a2, uint64_t a3, int *a4, uint64_t a5)
{
  int v10;
  uint64_t result;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int *v18;
  int *v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  int v23;
  char *v24;
  int v25;
  char v26;
  unsigned int v27;
  int *v28;
  int v29;
  int *v30;
  char *v31;
  int v32;
  int v33;
  int v34;
  char *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  BOOL v41;
  int v42;
  uint64_t v43;
  int *v44;
  unsigned int v45;
  unsigned int v46;
  int v47;
  int v48;
  char *v49;
  char *v50;
  int v51;
  unsigned int v52;

  v10 = tre_stack_num_objects((uint64_t)a2);
  v51 = 0;
  result = tre_stack_push_voidptr(a2, a3);
  if ((_DWORD)result)
    return result;
  result = tre_stack_push_int(a2, 0);
  if ((_DWORD)result)
    return result;
  v44 = a4;
  v12 = 0;
  v13 = 0;
  v47 = v10;
  v48 = 0;
  v14 = 0;
  while (1)
  {
    while (1)
    {
      if ((int)tre_stack_num_objects((uint64_t)a2) <= v10)
      {
        result = 0;
LABEL_81:
        v42 = *v44 + v14;
        if (v51 > v42)
          v42 = v51;
        *v44 = v42;
        return result;
      }
      v15 = tre_stack_pop_int((uint64_t)a2);
      v16 = tre_stack_pop_voidptr((uint64_t)a2);
      v17 = v16;
      if (v15 == 1)
        break;
      if (!v15)
      {
        switch(*(_DWORD *)(v16 + 48))
        {
          case 0:
            v28 = *(int **)v16;
            v29 = **(_DWORD **)v16;
            if (v29 < 0 && v29 != -4)
              continue;
            v32 = v28[2] + v12;
            v28[2] = v32;
            v33 = v51;
            if (v32 > v51)
              v33 = v32;
            v51 = v33;
            goto LABEL_78;
          case 1:
          case 3:
            v18 = *(int **)v16;
            result = tre_stack_push_voidptr(a2, *(_QWORD *)(*(_QWORD *)v16 + 8));
            if ((_DWORD)result)
              goto LABEL_81;
            result = tre_stack_push_int(a2, 0);
            if ((_DWORD)result)
              goto LABEL_81;
            result = tre_stack_push_voidptr(a2, *(_QWORD *)v18);
            if ((_DWORD)result)
              goto LABEL_81;
            result = tre_stack_push_int(a2, 0);
            if ((_DWORD)result)
              goto LABEL_81;
            continue;
          case 2:
            v30 = *(int **)v16;
            result = tre_stack_push_int(a2, v13);
            if ((_DWORD)result)
              goto LABEL_81;
            result = tre_stack_push_voidptr(a2, v17);
            if ((_DWORD)result)
              goto LABEL_81;
            result = tre_stack_push_int(a2, 1u);
            if ((_DWORD)result)
              goto LABEL_81;
            result = tre_stack_push_voidptr(a2, *(_QWORD *)v30);
            if ((_DWORD)result)
              goto LABEL_81;
            result = tre_stack_push_int(a2, 0);
            if ((_DWORD)result)
              goto LABEL_81;
            if (v30[2] > 1 || v30[3] >= 2)
            {
              v12 = 0;
              v13 = 0;
              v52 = 0;
            }
            ++v48;
            continue;
          default:
            continue;
        }
      }
    }
    v19 = *(int **)v16;
    v20 = tre_stack_pop_int((uint64_t)a2);
    v21 = v20;
    v52 = v20;
    v22 = v19[2];
    if (!v22)
    {
      v23 = v19[3];
      if (v23)
      {
        if (v23 >= 2)
        {
          v24 = 0;
          v22 = 0;
          v50 = 0;
          goto LABEL_52;
        }
      }
      else
      {
        v31 = tre_ast_new_literal(a1, -1, -1, -1);
        if (!v31)
          return 12;
        *(_QWORD *)v17 = *(_QWORD *)v31;
        *(_DWORD *)(v17 + 48) = *((_DWORD *)v31 + 12);
      }
      goto LABEL_47;
    }
    if (v22 >= 2)
      break;
    if (v19[3] > 1)
    {
      v50 = 0;
      if (v22 >= 1)
        goto LABEL_22;
      v24 = 0;
LABEL_52:
      v27 = v20;
LABEL_53:
      v34 = v19[3];
      v46 = v21;
      if (v34 == -1)
      {
        v27 = v52;
        result = tre_copy_ast(a1, a2, *(_QWORD *)v19, 0, &v52, 0, &v50, &v51);
        v10 = v47;
        if ((_DWORD)result)
          return result;
        v40 = tre_ast_new_iter(a1, (uint64_t)v50, 0, -1, 0);
        v50 = v40;
        if (!v40)
          return 12;
        v35 = v40;
      }
      else
      {
        if (v22 < v34)
        {
          v35 = 0;
          v43 = a5;
          while (1)
          {
            v49 = 0;
            v27 = v52;
            result = tre_copy_ast(a1, a2, *(_QWORD *)v19, 0, &v52, 0, &v49, &v51);
            if ((_DWORD)result)
              return result;
            v36 = v14;
            v37 = v49;
            if (v35)
              v37 = tre_ast_new_catenation(a1, (uint64_t)v49, (uint64_t)v35);
            if (!v37)
              return 12;
            v38 = tre_ast_new_literal(a1, -1, -1, -1);
            if (!v38)
              return 12;
            v39 = tre_ast_new_union(a1, (uint64_t)v38, (uint64_t)v37);
            if (!v39)
              return 12;
            v35 = v39;
            ++v22;
            v14 = v36;
            a5 = v43;
            if (v22 >= v19[3])
              goto LABEL_68;
          }
        }
        v35 = 0;
LABEL_68:
        v50 = v35;
        v10 = v47;
      }
      if (v24)
      {
        if (v35)
        {
          v35 = tre_ast_new_catenation(a1, (uint64_t)v24, (uint64_t)v35);
          goto LABEL_72;
        }
      }
      else
      {
LABEL_72:
        v24 = v35;
        if (!v35)
          return 12;
      }
      *(_QWORD *)v17 = *(_QWORD *)v24;
      *(_DWORD *)(v17 + 48) = *((_DWORD *)v24 + 12);
      v21 = v46;
      goto LABEL_74;
    }
LABEL_47:
    v27 = v21;
    v10 = v47;
LABEL_74:
    v41 = v48-- == 1;
    v14 = v27 - v21 + v14;
    if (v41)
      v12 = v14;
    else
      v12 = v27;
    v52 = v12;
LABEL_78:
    v13 = v12;
  }
  v50 = 0;
LABEL_22:
  v45 = v20;
  v25 = 0;
  v24 = 0;
  while (1)
  {
    v49 = 0;
    v26 = ++v25 < v22 ? 1 : 2;
    v27 = v52;
    result = tre_copy_ast(a1, a2, *(_QWORD *)v19, v26, &v52, a5, &v49, &v51);
    if ((_DWORD)result)
      return result;
    if (v24)
      v24 = tre_ast_new_catenation(a1, (uint64_t)v24, (uint64_t)v49);
    else
      v24 = v49;
    if (!v24)
      return 12;
    v22 = v19[2];
    if (v25 >= v22)
    {
      v21 = v45;
      goto LABEL_53;
    }
  }
}

uint64_t tre_compute_nfl(uint64_t a1, int *a2, uint64_t a3)
{
  int v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  _QWORD *v10;
  int *v11;
  int v12;
  int v13;
  char *v14;
  int v15;
  int v16;
  _DWORD *v17;
  char *v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  __int16 v22;
  uint64_t *v23;
  uint64_t v24;
  __int16 v25;
  uint64_t matched;
  int *v27;
  int *v28;
  char *v29;
  uint64_t *v30;
  uint64_t v31;
  int *v32;
  char *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  int *v38;
  char *v39;
  int *v40;
  unsigned int v41;
  int *v42;
  unsigned int v43;
  int v44;
  int v45;
  char *v46;
  uint64_t v47;
  int v49;
  uint64_t v50;

  v6 = tre_stack_num_objects((uint64_t)a2);
  v7 = tre_stack_push_voidptr(a2, a3);
  if ((_DWORD)v7)
    return v7;
  v7 = tre_stack_push_int(a2, 0);
  if ((_DWORD)v7)
    return v7;
  if ((int)tre_stack_num_objects((uint64_t)a2) <= v6)
    return 0;
  while (2)
  {
    v8 = tre_stack_pop_int((uint64_t)a2);
    v9 = tre_stack_pop_voidptr((uint64_t)a2);
    v10 = (_QWORD *)v9;
    switch(v8)
    {
      case 0:
        switch(*(_DWORD *)(v9 + 48))
        {
          case 0:
            v11 = *(int **)v9;
            v12 = **(_DWORD **)v9;
            if (v12 != -4)
            {
              if (v12 < 0)
              {
                *(_WORD *)(v9 + 64) = 1;
                tre_set_empty(a1);
                v10[3] = v47;
                if (!v47)
                  return 12;
                tre_set_empty(a1);
              }
              else
              {
                *(_WORD *)(v9 + 64) = 0;
                v44 = v11[1];
                v45 = v11[2];
                v46 = tre_mem_alloc_impl(a1, 0, 0, 1, 0x80uLL);
                if (!v46)
                {
LABEL_80:
                  v10[3] = 0;
                  return 12;
                }
                *(_DWORD *)v46 = v45;
                *((_DWORD *)v46 + 1) = v12;
                *((_DWORD *)v46 + 2) = v44;
                *((_QWORD *)v46 + 4) = 0;
                *((_DWORD *)v46 + 10) = -1;
                *((_QWORD *)v46 + 8) = -1;
                *((_DWORD *)v46 + 18) = -1;
                v10[3] = v46;
                tre_set_one(a1, v11[2], *v11, v11[1], *((_QWORD *)v11 + 2), -1);
              }
LABEL_31:
              v10[4] = v35;
              if (!v35)
                return 12;
LABEL_68:
              v7 = 0;
              if ((int)tre_stack_num_objects((uint64_t)a2) <= v6)
                return v7;
              continue;
            }
            *(_WORD *)(v9 + 64) = 0;
            v13 = v11[2];
            v14 = tre_mem_alloc_impl(a1, 0, 0, 1, 0x80uLL);
            if (!v14)
              goto LABEL_80;
            *(_DWORD *)v14 = v13;
            *(_QWORD *)(v14 + 4) = 0x7FFFFFFF00000000;
            *((_QWORD *)v14 + 4) = 0;
            *((_DWORD *)v14 + 10) = -1;
            *((_QWORD *)v14 + 8) = -1;
            *((_DWORD *)v14 + 18) = -1;
            v10[3] = v14;
            v17 = v11 + 1;
            v15 = v11[1];
            v16 = v17[1];
            v18 = tre_mem_alloc_impl(a1, 0, 0, 1, 0x80uLL);
            if (v18)
            {
              *(_DWORD *)v18 = v16;
              *(_QWORD *)(v18 + 4) = 0x7FFFFFFF00000000;
              *((_QWORD *)v18 + 4) = 0;
              *((_DWORD *)v18 + 10) = v15;
              *((_QWORD *)v18 + 8) = -1;
              *((_DWORD *)v18 + 18) = -1;
              v10[4] = v18;
              goto LABEL_68;
            }
            v10[4] = 0;
            return 12;
          case 1:
            matched = tre_stack_push_voidptr(a2, v9);
            if ((_DWORD)matched)
              return matched;
            v40 = a2;
            v41 = 2;
            goto LABEL_56;
          case 2:
            matched = tre_stack_push_voidptr(a2, v9);
            if ((_DWORD)matched)
              return matched;
            v42 = a2;
            v43 = 3;
            goto LABEL_59;
          case 3:
            matched = tre_stack_push_voidptr(a2, v9);
            if ((_DWORD)matched)
              return matched;
            v40 = a2;
            v41 = 1;
LABEL_56:
            matched = tre_stack_push_int(v40, v41);
            if ((_DWORD)matched)
              return matched;
            matched = tre_stack_push_voidptr(a2, *(_QWORD *)(*v10 + 8));
            if ((_DWORD)matched)
              return matched;
            v42 = a2;
            v43 = 0;
LABEL_59:
            matched = tre_stack_push_int(v42, v43);
            if ((_DWORD)matched)
              return matched;
            matched = tre_stack_push_voidptr(a2, *(_QWORD *)*v10);
            if ((_DWORD)matched)
              return matched;
            matched = tre_stack_push_int(a2, 0);
            if ((_DWORD)matched)
              return matched;
            goto LABEL_68;
          default:
            goto LABEL_68;
        }
      case 1:
        v19 = *(int **)v9;
        v20 = **(_QWORD **)v9;
        v21 = *(_QWORD *)(*(_QWORD *)v9 + 8);
        if (*(_WORD *)(v20 + 64))
          v22 = 1;
        else
          v22 = *(_WORD *)(v21 + 64) != 0;
        *(_WORD *)(v9 + 64) = v22;
        v34 = tre_set_union(a1, *(int **)(v20 + 24), *(int **)(v21 + 24), 0, 0, 0);
        v10[3] = v34;
        if (!v34)
          return 12;
        v35 = tre_set_union(a1, *(int **)(*(_QWORD *)v19 + 32), *(int **)(*((_QWORD *)v19 + 1) + 32), 0, 0, 0);
        goto LABEL_31;
      case 2:
        v50 = 0;
        v49 = 0;
        v23 = *(uint64_t **)v9;
        v24 = **(_QWORD **)v9;
        v25 = *(_WORD *)(v24 + 64);
        if (v25)
          v25 = *(_WORD *)(v23[1] + 64) != 0;
        *(_WORD *)(v9 + 64) = v25;
        if (*(_WORD *)(v24 + 64))
        {
          matched = tre_match_empty((uint64_t)a2, v24, 0, 0, 0, (_DWORD *)&v50 + 1, &v49);
          if ((_DWORD)matched)
            return matched;
          v27 = (int *)malloc_type_malloc(4 * SHIDWORD(v50) + 4, 0x100004052888210uLL);
          if (!v27)
            return 12;
          v28 = v27;
          *v27 = -1;
          LODWORD(v50) = 0;
          if (v49)
          {
            v29 = tre_mem_alloc_impl(a1, 0, 0, 0, 0x24uLL);
            if (!v29)
              goto LABEL_78;
          }
          else
          {
            v29 = 0;
          }
          v36 = tre_match_empty((uint64_t)a2, *v23, v28, &v50, (uint64_t)v29, 0, 0);
          if ((_DWORD)v36)
            goto LABEL_77;
          v10[3] = tre_set_union(a1, *(int **)(v23[1] + 24), *(int **)(*v23 + 24), (unint64_t)v28, v50, v29);
          free(v28);
          if (!v10[3])
            return 12;
        }
        else
        {
          *(_QWORD *)(v9 + 24) = *(_QWORD *)(v24 + 24);
        }
        v37 = v23[1];
        if (*(_WORD *)(v37 + 64))
        {
          matched = tre_match_empty((uint64_t)a2, v37, 0, 0, 0, (_DWORD *)&v50 + 1, &v49);
          if ((_DWORD)matched)
            return matched;
          v38 = (int *)malloc_type_malloc(4 * SHIDWORD(v50) + 4, 0x100004052888210uLL);
          if (!v38)
            return 12;
          v28 = v38;
          *v38 = -1;
          LODWORD(v50) = 0;
          if (v49)
          {
            v39 = tre_mem_alloc_impl(a1, 0, 0, 0, 0x24uLL);
            if (!v39)
            {
LABEL_78:
              v7 = 12;
LABEL_79:
              free(v28);
              return v7;
            }
          }
          else
          {
            v39 = 0;
          }
          v36 = tre_match_empty((uint64_t)a2, v23[1], v28, &v50, (uint64_t)v39, 0, 0);
          if ((_DWORD)v36)
            goto LABEL_77;
          v10[4] = tre_set_union(a1, *(int **)(*v23 + 32), *(int **)(v23[1] + 32), (unint64_t)v28, v50, v39);
          free(v28);
          if (!v10[4])
            return 12;
        }
        else
        {
          v10[4] = *(_QWORD *)(v37 + 32);
        }
        goto LABEL_68;
      case 3:
        v50 = 0;
        v49 = 0;
        v30 = *(uint64_t **)v9;
        v31 = **(_QWORD **)v9;
        if (*(_DWORD *)(*(_QWORD *)v9 + 8) && !*(_WORD *)(v31 + 64))
        {
          *(_WORD *)(v9 + 64) = 0;
LABEL_35:
          *(_QWORD *)(v9 + 32) = *(_QWORD *)(v31 + 32);
          goto LABEL_67;
        }
        *(_WORD *)(v9 + 64) = 1;
        if (!*(_WORD *)(v31 + 64))
          goto LABEL_35;
        matched = tre_match_empty((uint64_t)a2, v31, 0, 0, 0, (_DWORD *)&v50 + 1, &v49);
        if ((_DWORD)matched)
          return matched;
        v32 = (int *)malloc_type_malloc(4 * SHIDWORD(v50) + 4, 0x100004052888210uLL);
        if (!v32)
          return 12;
        v28 = v32;
        *v32 = -1;
        LODWORD(v50) = 0;
        if (v49)
        {
          v33 = tre_mem_alloc_impl(a1, 0, 0, 0, 0x24uLL);
          if (!v33)
            goto LABEL_78;
        }
        else
        {
          v33 = 0;
        }
        v36 = tre_match_empty((uint64_t)a2, *v30, v28, &v50, (uint64_t)v33, 0, 0);
        if ((_DWORD)v36)
        {
LABEL_77:
          v7 = v36;
          goto LABEL_79;
        }
        v10[4] = tre_set_union(a1, *(int **)(*v30 + 32), *(int **)(*v30 + 32), (unint64_t)v28, v50, v33);
        free(v28);
        if (!v10[4])
          return 12;
        v31 = *v30;
LABEL_67:
        v10[3] = *(_QWORD *)(v31 + 24);
        goto LABEL_68;
      default:
        goto LABEL_68;
    }
  }
}

uint64_t tre_ast_to_tnfa(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  _QWORD *v11;

  while (1)
  {
    v7 = a1[12];
    if (v7 != 1)
      break;
    v11 = *(_QWORD **)a1;
    v10 = *(_QWORD *)a1 + 8;
    result = tre_make_trans(*(int **)(**(_QWORD **)a1 + 32), *(int **)(*(_QWORD *)v10 + 24), a2, a3, a4);
    if ((_DWORD)result)
      return result;
    result = tre_ast_to_tnfa(*v11, a2, a3, a4);
    if ((_DWORD)result)
      return result;
LABEL_11:
    a1 = *(_DWORD **)v10;
  }
  if (v7 == 2)
  {
    v10 = *(_QWORD *)a1;
    if (*(_DWORD *)(*(_QWORD *)a1 + 12) == -1)
    {
      result = tre_make_trans(*(int **)(*(_QWORD *)v10 + 32), *(int **)(*(_QWORD *)v10 + 24), a2, a3, a4);
      if ((_DWORD)result)
        return result;
    }
    goto LABEL_11;
  }
  if (v7 == 3)
  {
    v8 = *(_QWORD *)a1;
    result = tre_ast_to_tnfa(**(_QWORD **)a1, a2, a3, a4);
    if ((_DWORD)result)
      return result;
    v10 = v8 + 8;
    goto LABEL_11;
  }
  return 0;
}

void tre_free(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void **v8;
  void **v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  void (*v18)(void);
  void *v19;

  *(_DWORD *)a1 = 0;
  v1 = *(_QWORD *)(a1 + 24);
  if (v1)
  {
    *(_QWORD *)(a1 + 24) = 0;
    if (*(_DWORD *)(v1 + 64))
    {
      v2 = 0;
      v3 = 0;
      do
      {
        v4 = *(_BYTE **)v1;
        v5 = *(_QWORD *)v1 + v2;
        if (*(_QWORD *)(v5 + 8))
        {
          v6 = *(void **)(v5 + 24);
          if (v6)
          {
            free(v6);
            v4 = *(_BYTE **)v1;
          }
          if ((v4[v2 + 40] & 4) != 0)
          {
            free(*(void **)&v4[v2 + 48]);
            v4 = *(_BYTE **)v1;
          }
          v7 = *(void **)&v4[v2 + 32];
          if (v7)
            free(v7);
        }
        ++v3;
        v2 += 56;
      }
      while (v3 < *(unsigned int *)(v1 + 64));
    }
    if (*(_QWORD *)v1)
      free(*(void **)v1);
    v8 = *(void ***)(v1 + 8);
    if (v8)
    {
      if (v8[1])
      {
        v9 = v8 + 4;
        do
        {
          v10 = *(v9 - 1);
          if (v10)
            free(v10);
          if (*v9)
            free(*v9);
          v11 = v9[4];
          v9 += 7;
        }
        while (v11);
        v8 = *(void ***)(v1 + 8);
      }
      free(v8);
    }
    v12 = *(void **)(v1 + 24);
    if (v12)
      free(v12);
    v13 = *(void **)(v1 + 32);
    if (v13)
      free(v13);
    v14 = *(void **)(v1 + 40);
    if (v14)
      free(v14);
    v15 = *(_QWORD *)(v1 + 56);
    if (v15)
    {
      do
      {
        v16 = __ldaxr((unsigned int *)v15);
        v17 = v16 - 1;
      }
      while (__stlxr(v17, (unsigned int *)v15));
      if (!v17)
      {
        v18 = *(void (**)(void))(v15 + 8);
        if (v18)
          v18();
      }
    }
    v19 = *(void **)(v1 + 48);
    if (v19)
      free(v19);
    free((void *)v1);
  }
}

uint64_t tre_merge_branches(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  char *v8;
  uint64_t v9;
  char *v10;
  _BYTE *v11;
  unsigned int v12;
  char v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  int32x2_t v17;
  uint64_t v18;

  v8 = *(char **)(a2 + 8);
  if (a3)
  {
    v9 = *(_QWORD *)(a3 + 8);
    if (!v8)
    {
      v8 = *(char **)(a3 + 8);
      goto LABEL_18;
    }
    if (!v9)
      goto LABEL_18;
    if (a5 >= 1)
    {
      v10 = (char *)(v9 + 40);
      v11 = v8 + 40;
      v12 = ((a5 + 7) >> 3) + 1;
      do
      {
        v13 = *v10++;
        *v11++ |= v13;
        --v12;
      }
      while (v12 > 1);
    }
    *((_DWORD *)v8 + 6) += *(_DWORD *)(v9 + 24);
    *((_DWORD *)v8 + 9) += *(_DWORD *)(v9 + 36);
    v14 = (_QWORD *)*((_QWORD *)v8 + 1);
    v15 = *(_QWORD *)(v9 + 8);
    if (v14)
    {
      if (!v15)
        goto LABEL_18;
      do
      {
        v16 = v14;
        v14 = (_QWORD *)*v14;
      }
      while (v14);
      *v16 = v15;
      *((_DWORD *)v8 + 4) += *(_DWORD *)(v9 + 16);
      v17 = vadd_s32(*(int32x2_t *)(v8 + 28), *(int32x2_t *)(v9 + 28));
    }
    else
    {
      if (!v15)
        goto LABEL_18;
      *((_QWORD *)v8 + 1) = v15;
      *((_DWORD *)v8 + 4) = *(_DWORD *)(v9 + 16);
      v17 = *(int32x2_t *)(v9 + 28);
    }
    *(int32x2_t *)(v8 + 28) = v17;
  }
  else if (!v8)
  {
    if (a4)
      goto LABEL_20;
    v8 = 0;
    goto LABEL_24;
  }
LABEL_18:
  if (a4)
  {
    if (v8)
    {
LABEL_22:
      if (a4 >= 1)
      {
        v8[(a4 >> 3) + 40] |= 1 << (a4 & 7);
        ++*((_DWORD *)v8 + 6);
        ++*((_DWORD *)v8 + 9);
      }
      goto LABEL_24;
    }
LABEL_20:
    v8 = tre_mem_alloc_impl(a1, 0, 0, 1, ((a5 + 7) >> 3) + 40);
    if (!v8)
      return 12;
    *((_DWORD *)v8 + 7) = 1;
    goto LABEL_22;
  }
LABEL_24:
  v18 = 0;
  *(_QWORD *)(a2 + 8) = v8;
  return v18;
}

uint64_t tre_add_tag_right(uint64_t a1, uint64_t a2, int a3)
{
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t result;
  int v12;

  v6 = tre_mem_alloc_impl(a1, 0, 0, 0, 0x10uLL);
  if (!v6)
    return 12;
  v7 = v6;
  v8 = tre_ast_new_literal(a1, -3, a3, -1);
  v7[1] = v8;
  if (!v8)
    return 12;
  v9 = tre_mem_alloc_impl(a1, 0, 0, 1, 0x48uLL);
  *v7 = v9;
  if (!v9)
    return 12;
  v10 = v9;
  result = 0;
  v12 = *(_DWORD *)(a2 + 48);
  *(_OWORD *)v10 = *(_OWORD *)a2;
  *((_WORD *)v10 + 32) = -1;
  *((_DWORD *)v10 + 12) = v12;
  *((_DWORD *)v10 + 13) = -1;
  *(_QWORD *)a2 = v7;
  *(_DWORD *)(a2 + 48) = 1;
  *(_QWORD *)(a2 + 40) = v10;
  return result;
}

uint64_t tre_add_tag_left(uint64_t a1, uint64_t a2, int a3)
{
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t result;
  int v12;

  v6 = tre_mem_alloc_impl(a1, 0, 0, 0, 0x10uLL);
  if (!v6)
    return 12;
  v7 = v6;
  v8 = tre_ast_new_literal(a1, -3, a3, -1);
  *v7 = v8;
  if (!v8)
    return 12;
  v9 = tre_mem_alloc_impl(a1, 0, 0, 1, 0x48uLL);
  v7[1] = v9;
  if (!v9)
    return 12;
  v10 = v9;
  result = 0;
  v12 = *(_DWORD *)(a2 + 48);
  *(_OWORD *)v10 = *(_OWORD *)a2;
  *((_WORD *)v10 + 32) = -1;
  *((_DWORD *)v10 + 12) = v12;
  *((_DWORD *)v10 + 13) = -1;
  *(_QWORD *)a2 = v7;
  *(_DWORD *)(a2 + 48) = 1;
  *(_QWORD *)(a2 + 40) = v10;
  return result;
}

uint64_t tre_copy_ast(uint64_t a1, int *a2, uint64_t a3, char a4, _DWORD *a5, uint64_t a6, _QWORD *a7, int *a8)
{
  int v16;
  uint64_t result;
  int v18;
  int v19;
  int **v20;
  int *v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  uint64_t *v26;
  char *v27;
  _QWORD *v28;
  _QWORD *v29;
  int *v30;
  _QWORD *v31;
  uint64_t *v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  int v38;
  int *v39;

  v16 = tre_stack_num_objects((uint64_t)a2);
  tre_stack_push_voidptr(a2, a3);
  result = tre_stack_push_int(a2, 0);
  if ((_DWORD)result)
  {
    v18 = 0;
  }
  else
  {
    v39 = a8;
    v37 = a6;
    v18 = 0;
    v38 = 1;
    while ((int)tre_stack_num_objects((uint64_t)a2) > v16)
    {
      v19 = tre_stack_pop_int((uint64_t)a2);
      if (v19)
      {
        if (v19 == 1)
          a7 = (_QWORD *)tre_stack_pop_voidptr((uint64_t)a2);
LABEL_9:
        result = 0;
      }
      else
      {
        v20 = (int **)tre_stack_pop_voidptr((uint64_t)a2);
        switch(*((_DWORD *)v20 + 12))
        {
          case 0:
            v21 = *v20;
            v22 = (*v20)[1];
            v23 = (*v20)[2];
            v24 = **v20;
            if ((v24 & 0x80000000) == 0)
            {
              v25 = *((_QWORD *)v21 + 2);
LABEL_33:
              v23 += *a5;
              ++v18;
              goto LABEL_34;
            }
            if (v24 == -4)
            {
              v25 = 0;
              goto LABEL_33;
            }
            if ((a4 & 1) != 0 && v24 == -3)
            {
              v25 = 0;
              v23 = -1;
              v24 = -1;
              v22 = -1;
            }
            else if (v24 == -3)
            {
              v25 = 0;
              if ((a4 & 2) != 0 && v38)
              {
                v25 = 0;
                v38 = 0;
                if (*(_DWORD *)(v37 + 4 * v22) == 2)
                  *(_DWORD *)(v37 + 4 * v22) = 1;
                v24 = -3;
              }
            }
            else
            {
              v25 = 0;
            }
LABEL_34:
            v36 = tre_ast_new_literal(a1, v24, v22, v23);
            *a7 = v36;
            if (v36)
              result = 0;
            else
              result = 12;
            if (v23 > *v39)
              *v39 = v23;
            if ((*v21 & 0x80000000) == 0)
              *(_QWORD *)(*(_QWORD *)v36 + 16) = v25;
            break;
          case 1:
            v26 = (uint64_t *)*v20;
            v27 = tre_ast_new_catenation(a1, *(_QWORD *)*v20, *((_QWORD *)*v20 + 1));
            *a7 = v27;
            if (!v27)
              goto LABEL_52;
            a7 = *(_QWORD **)v27;
            v28 = *(_QWORD **)v27;
            v28[1] = 0;
            v29 = v28 + 1;
            *a7 = 0;
            result = tre_stack_push_voidptr(a2, v26[1]);
            if ((_DWORD)result)
              goto LABEL_3;
            result = tre_stack_push_int(a2, 0);
            if ((_DWORD)result)
              goto LABEL_3;
            v30 = a2;
            v31 = v29;
            goto LABEL_27;
          case 2:
            v32 = (uint64_t *)*v20;
            result = tre_stack_push_voidptr(a2, *(_QWORD *)*v20);
            if ((_DWORD)result)
              goto LABEL_3;
            result = tre_stack_push_int(a2, 0);
            if ((_DWORD)result)
              goto LABEL_3;
            v33 = tre_ast_new_iter(a1, *v32, *((_DWORD *)v32 + 2), *((_DWORD *)v32 + 3), v32[2] & 1);
            *a7 = v33;
            if (!v33)
            {
LABEL_52:
              result = 12;
              goto LABEL_3;
            }
            v34 = v33;
            result = 0;
            a7 = *(_QWORD **)v34;
            break;
          case 3:
            v26 = (uint64_t *)*v20;
            v35 = tre_ast_new_union(a1, *(_QWORD *)*v20, *((_QWORD *)*v20 + 1));
            *a7 = v35;
            if (!v35)
              goto LABEL_52;
            a7 = *(_QWORD **)v35;
            result = tre_stack_push_voidptr(a2, v26[1]);
            if ((_DWORD)result)
              goto LABEL_3;
            result = tre_stack_push_int(a2, 0);
            if ((_DWORD)result)
              goto LABEL_3;
            v31 = a7 + 1;
            v30 = a2;
LABEL_27:
            result = tre_stack_push_voidptr(v30, v31);
            if ((_DWORD)result)
              goto LABEL_3;
            result = tre_stack_push_int(a2, 1u);
            if ((_DWORD)result)
              goto LABEL_3;
            result = tre_stack_push_voidptr(a2, *v26);
            if ((_DWORD)result)
              goto LABEL_3;
            result = tre_stack_push_int(a2, 0);
            break;
          default:
            goto LABEL_9;
        }
      }
      if ((_DWORD)result)
        goto LABEL_3;
    }
    result = 0;
  }
LABEL_3:
  *a5 += v18;
  return result;
}

double tre_set_one(uint64_t a1, int a2, int a3, int a4, uint64_t a5, int a6)
{
  char *v11;
  double result;

  v11 = tre_mem_alloc_impl(a1, 0, 0, 1, 0x80uLL);
  if (v11)
  {
    *(_DWORD *)v11 = a2;
    *((_DWORD *)v11 + 1) = a3;
    *((_DWORD *)v11 + 2) = a4;
    *((_QWORD *)v11 + 4) = a5;
    *((_DWORD *)v11 + 10) = a6;
    result = NAN;
    *((_QWORD *)v11 + 8) = -1;
    *((_DWORD *)v11 + 18) = -1;
  }
  return result;
}

double tre_set_empty(uint64_t a1)
{
  char *v1;
  double result;

  v1 = tre_mem_alloc_impl(a1, 0, 0, 1, 0x40uLL);
  if (v1)
  {
    result = NAN;
    *(_QWORD *)v1 = -1;
    *((_DWORD *)v1 + 2) = -1;
  }
  return result;
}

char *tre_set_union(uint64_t a1, int *a2, int *a3, unint64_t a4, int a5, char *a6)
{
  unsigned int v10;
  int *v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int *v16;
  int v17;
  char *v18;
  int v19;
  uint64_t v20;
  int *v21;
  int *v22;
  _DWORD *v23;
  unint64_t v24;
  char *v25;
  char *v26;
  unsigned int v27;
  int v28;
  int *v29;
  uint64_t v30;
  char *v31;
  int v32;
  char *v33;
  uint64_t v34;
  int *v35;
  int v36;
  uint64_t v37;
  char *v38;
  char **v39;
  uint64_t v40;
  char *v41;
  uint64_t i;
  int v43;
  int *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  int *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  char *v56;
  int *v57;
  char *v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char **v63;
  uint64_t v64;
  char *v65;
  uint64_t j;
  int v67;
  int v69;

  if (a4)
  {
    v10 = -1;
    v11 = (int *)a4;
    do
    {
      v12 = *v11++;
      ++v10;
    }
    while ((v12 & 0x80000000) == 0);
  }
  else
  {
    v10 = 0;
  }
  v13 = 0;
  do
  {
    v14 = a2[v13];
    v13 += 16;
  }
  while ((v14 & 0x80000000) == 0);
  v15 = v13 * 4 - 64;
  v16 = a3;
  do
  {
    v17 = *v16;
    v16 += 16;
    v15 += 64;
  }
  while ((v17 & 0x80000000) == 0);
  v18 = tre_mem_alloc_impl(a1, 0, 0, 1, v15 & 0x3FFFFFFFC0);
  if (v18)
  {
    v19 = *a2;
    if ((*a2 & 0x80000000) == 0)
    {
      v20 = 0;
      v69 = a5;
      while (1)
      {
        v21 = &a2[16 * v20];
        v24 = *((_QWORD *)v21 + 2);
        v23 = v21 + 4;
        v22 = (int *)v24;
        v25 = &v18[64 * v20];
        *(_DWORD *)v25 = v19;
        *(_QWORD *)(v25 + 4) = *(_QWORD *)(v23 - 3);
        *((_DWORD *)v25 + 6) = v23[2] | a5;
        *((_QWORD *)v25 + 4) = *((_QWORD *)v23 + 2);
        *((_DWORD *)v25 + 10) = v23[6];
        if (a4 | v24)
        {
          if (v22)
          {
            v27 = -1;
            do
            {
              v28 = *v22++;
              ++v27;
            }
            while ((v28 & 0x80000000) == 0);
          }
          else
          {
            v27 = 0;
          }
          v26 = tre_mem_alloc_impl(a1, 0, 0, 0, 4 * (v10 + 1 + v27));
          if (!v26)
            return 0;
          if (v27)
          {
            v29 = *(int **)v23;
            v30 = v27;
            v31 = v26;
            do
            {
              v32 = *v29++;
              *(_DWORD *)v31 = v32;
              v31 += 4;
              --v30;
            }
            while (v30);
          }
          if (v10)
          {
            v33 = &v26[4 * v27];
            v34 = v10;
            v35 = (int *)a4;
            do
            {
              v36 = *v35++;
              *(_DWORD *)v33 = v36;
              v33 += 4;
              --v34;
            }
            while (v34);
          }
          *(_DWORD *)&v26[4 * v10 + 4 * v27] = -1;
          a5 = v69;
        }
        else
        {
          v26 = 0;
        }
        *((_QWORD *)v25 + 2) = v26;
        v37 = *(_QWORD *)&a2[16 * v20 + 12];
        if (v37)
          *(_QWORD *)&v18[64 * v20 + 48] = v37;
        if (a6)
        {
          v38 = &v18[64 * v20];
          v40 = *((_QWORD *)v38 + 6);
          v39 = (char **)(v38 + 48);
          if (v40)
          {
            v41 = tre_mem_alloc_impl(a1, 0, 0, 0, 0x24uLL);
            *v39 = v41;
            if (!v41)
              return 0;
            for (i = 0; i != 36; i += 4)
            {
              v43 = *(_DWORD *)&a6[i];
              if (v43 != -1)
                *(_DWORD *)&v41[i] = v43;
            }
          }
          else
          {
            *v39 = a6;
          }
        }
        v19 = a2[16 * ++v20];
        if (v19 < 0)
          goto LABEL_42;
      }
    }
    LODWORD(v20) = 0;
LABEL_42:
    v44 = a3;
    v45 = *a3;
    if (*a3 < 0)
    {
      LODWORD(v46) = 0;
    }
    else
    {
      v46 = 0;
      do
      {
        v47 = v46 + v20;
        v48 = &v18[64 * v47];
        *(_DWORD *)v48 = v45;
        v49 = &v44[16 * v46];
        v50 = *((_QWORD *)v49 + 2);
        *(_QWORD *)(v48 + 4) = *(_QWORD *)(v49 + 1);
        *((_DWORD *)v48 + 6) = v49[6];
        *((_QWORD *)v48 + 4) = *((_QWORD *)v49 + 4);
        *((_DWORD *)v48 + 10) = v49[10];
        if (v50)
        {
          v51 = 0;
          v52 = 0;
          v53 = -1;
          do
          {
            v54 = v51;
            v55 = *(_DWORD *)(v50 + v52);
            ++v53;
            v52 += 4;
            ++v51;
          }
          while ((v55 & 0x80000000) == 0);
          v56 = tre_mem_alloc_impl(a1, 0, 0, 0, v52 & 0x3FFFFFFFCLL);
          if (!v56)
            return 0;
          if (v53)
          {
            v57 = (int *)*((_QWORD *)v49 + 2);
            v58 = v56;
            do
            {
              v59 = *v57++;
              *(_DWORD *)v58 = v59;
              v58 += 4;
              --v54;
            }
            while (v54);
            v60 = v53;
          }
          else
          {
            v60 = 0;
          }
          v44 = a3;
          *(_DWORD *)&v56[4 * v60] = -1;
        }
        else
        {
          v56 = 0;
        }
        *((_QWORD *)v48 + 2) = v56;
        v61 = *((_QWORD *)v49 + 6);
        if (v61)
          *(_QWORD *)&v18[64 * v47 + 48] = v61;
        if (a6)
        {
          v62 = &v18[64 * v47];
          v64 = *((_QWORD *)v62 + 6);
          v63 = (char **)(v62 + 48);
          if (v64)
          {
            v65 = tre_mem_alloc_impl(a1, 0, 0, 0, 0x24uLL);
            *v63 = v65;
            if (!v65)
              return 0;
            for (j = 0; j != 36; j += 4)
            {
              v67 = *(_DWORD *)&a6[j];
              if (v67 != -1)
                *(_DWORD *)&v65[j] = v67;
            }
          }
          else
          {
            *v63 = a6;
          }
        }
        v45 = v44[16 * ++v46];
      }
      while ((v45 & 0x80000000) == 0);
    }
    *(_DWORD *)&v18[64 * (unint64_t)(v46 + v20)] = -1;
  }
  return v18;
}

uint64_t tre_match_empty(uint64_t a1, uint64_t a2, int *a3, _DWORD *a4, uint64_t a5, _DWORD *a6, _DWORD *a7)
{
  int v14;
  uint64_t result;
  int **v16;
  int *v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  uint64_t i;

  v14 = tre_stack_num_objects(a1);
  if (a6)
    *a6 = 0;
  if (a7)
    *a7 = 0;
  result = tre_stack_push_voidptr(a1, a2);
  if (!(_DWORD)result)
  {
    while ((int)tre_stack_num_objects(a1) > v14)
    {
      v16 = (int **)tre_stack_pop_voidptr(a1);
      switch(*((_DWORD *)v16 + 12))
      {
        case 0:
          v17 = *v16;
          v18 = **v16;
          switch(v18)
          {
            case -5:
              if (a5)
              {
                for (i = 0; i != 36; i += 4)
                  *(_DWORD *)(a5 + i) = *(_DWORD *)(*((_QWORD *)v17 + 2) + i);
              }
              if (a7)
                *a7 = 1;
              break;
            case -2:
              if (a4)
                *a4 |= v17[1];
              break;
            case -3:
              v19 = v17[1];
              if ((v19 & 0x80000000) == 0)
              {
                if (a3)
                {
                  v20 = *a3;
                  if (*a3 < 0)
                  {
                    v22 = 0;
LABEL_34:
                    a3[v22] = v19;
                    a3[(v22 + 1)] = -1;
                  }
                  else
                  {
                    v21 = 0;
                    while (v20 != v19)
                    {
                      v22 = v21 + 1;
                      v20 = a3[++v21];
                      if (v20 < 0)
                        goto LABEL_34;
                    }
                  }
                }
                if (a6)
                  ++*a6;
                continue;
              }
              break;
          }
          break;
        case 1:
          v23 = *v16;
          result = tre_stack_push_voidptr(a1, *(_QWORD *)*v16);
          if ((_DWORD)result)
            return result;
          v24 = *((_QWORD *)v23 + 1);
          goto LABEL_24;
        case 2:
          v24 = *(_QWORD *)*v16;
          goto LABEL_23;
        case 3:
          v24 = *(_QWORD *)*v16;
          if (*(_WORD *)(v24 + 64))
            goto LABEL_24;
          v24 = *((_QWORD *)*v16 + 1);
LABEL_23:
          if (!*(_WORD *)(v24 + 64))
            continue;
LABEL_24:
          result = tre_stack_push_voidptr(a1, v24);
          if ((_DWORD)result)
            return result;
          continue;
        default:
          continue;
      }
    }
    return 0;
  }
  return result;
}

uint64_t tre_make_trans(int *a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int *v6;
  int v7;
  int v10;
  int v11;
  int *v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  int v18;
  int v19;
  void *v20;
  int *v21;
  int v22;
  int v23;
  int *v24;
  int v25;
  int v26;
  void *v27;
  int *v28;
  int *v29;
  int v30;
  uint64_t v31;
  _DWORD *v32;
  int *v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  int *v38;
  int v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  int v45;
  void *v46;
  int v47;
  int *v48;
  int v49;
  int v50;
  uint64_t v52;

  v6 = a1;
  v7 = *a1;
  if (!a3)
  {
    if ((v7 & 0x80000000) == 0)
    {
      do
      {
        if ((*a2 & 0x80000000) == 0)
        {
          v48 = a2 + 16;
          do
          {
            ++*(_DWORD *)(a4 + 4 * *v6);
            v49 = *v48;
            v48 += 16;
          }
          while ((v49 & 0x80000000) == 0);
        }
        v50 = v6[16];
        v6 += 16;
      }
      while ((v50 & 0x80000000) == 0);
    }
    return 0;
  }
  if (v7 < 0)
    return 0;
  v52 = a3 - 56;
  while (1)
  {
    v10 = *a2;
    if ((*a2 & 0x80000000) == 0)
      break;
LABEL_65:
    v47 = v6[16];
    v6 += 16;
    if (v47 < 0)
      return 0;
  }
  v11 = -1;
  v12 = a2;
  while (1)
  {
    v13 = v11;
    v12 += 16;
    v11 = v10;
    while (v11 == v13)
    {
      v14 = *v12;
      v12 += 16;
      v11 = v14;
      if (v14 < 0)
        goto LABEL_65;
    }
    v15 = v52 + 56 * *(int *)(a5 + 4 * *v6);
    do
    {
      v16 = *(_QWORD *)(v15 + 64);
      v15 += 56;
    }
    while (v16);
    *(_QWORD *)(v15 + 64) = 0;
    *(_QWORD *)v15 = *(_QWORD *)(v6 + 1);
    *(_QWORD *)(v15 + 8) = a3 + 56 * *(int *)(a5 + 4 * v11);
    *(_DWORD *)(v15 + 16) = v11;
    v17 = (int *)*((_QWORD *)v6 + 4);
    v18 = *(v12 - 10) | v6[6] | (4 * (v17 != 0));
    *(_DWORD *)(v15 + 40) = v18;
    v19 = v6[10];
    if ((v19 & 0x80000000) == 0)
    {
      *(_DWORD *)(v15 + 48) = v19;
      *(_DWORD *)(v15 + 40) = v18 | 0x80;
      v17 = (int *)*((_QWORD *)v6 + 4);
    }
    if (v17)
    {
      v20 = malloc_type_malloc(8 * *v17 + 8, 0x85422E0AuLL);
      *(_QWORD *)(v15 + 48) = v20;
      if (!v20)
        return 12;
      _platform_memmove();
    }
    v21 = (int *)*((_QWORD *)v6 + 2);
    if (v21)
    {
      v22 = -1;
      do
      {
        v23 = *v21++;
        ++v22;
      }
      while ((v23 & 0x80000000) == 0);
    }
    else
    {
      v22 = 0;
    }
    v24 = (int *)*((_QWORD *)v12 - 6);
    if (v24)
    {
      v25 = -1;
      do
      {
        v26 = *v24++;
        ++v25;
      }
      while ((v26 & 0x80000000) == 0);
    }
    else
    {
      v25 = 0;
    }
    v27 = *(void **)(v15 + 24);
    if (v27)
      free(v27);
    *(_QWORD *)(v15 + 24) = 0;
    if (v25 + v22)
    {
      v28 = (int *)malloc_type_malloc(4 * (v25 + v22 + 1), 0x100004052888210uLL);
      *(_QWORD *)(v15 + 24) = v28;
      if (!v28)
        return 12;
      v29 = (int *)*((_QWORD *)v6 + 2);
      if (!v29 || (v30 = *v29, *v29 < 0))
      {
        LODWORD(v31) = 0;
      }
      else
      {
        v31 = 0;
        v32 = v29 + 1;
        do
        {
          v28[v31] = v30;
          v30 = v32[v31++];
        }
        while ((v30 & 0x80000000) == 0);
      }
      v33 = (int *)*((_QWORD *)v12 - 6);
      if (!v33 || (v34 = *v33, *v33 < 0))
      {
        v36 = v31;
      }
      else
      {
        v35 = 0;
        v36 = v31;
        do
        {
          v37 = v31;
          v38 = v28;
          if ((_DWORD)v31)
          {
            while (1)
            {
              v39 = *v38++;
              if (v39 == v34)
                break;
              if (!--v37)
                goto LABEL_43;
            }
          }
          else
          {
LABEL_43:
            v28[v36++] = v34;
          }
          v34 = v33[++v35];
        }
        while ((v34 & 0x80000000) == 0);
      }
      v28[v36] = -1;
    }
    if (!*((_QWORD *)v6 + 6) && !*((_QWORD *)v12 - 2))
    {
      v46 = *(void **)(v15 + 32);
      if (v46)
        free(v46);
      *(_QWORD *)(v15 + 32) = 0;
      goto LABEL_60;
    }
    v40 = *(char **)(v15 + 32);
    if (!v40)
    {
      v40 = (char *)malloc_type_malloc(0x24uLL, 0x100004052888210uLL);
      *(_QWORD *)(v15 + 32) = v40;
      if (!v40)
        return 12;
    }
    v41 = 0;
    v42 = *((_QWORD *)v6 + 6);
    v43 = *((_QWORD *)v12 - 2);
    do
    {
      *(_DWORD *)&v40[v41] = -1;
      if (v42)
      {
        v44 = *(_DWORD *)(v42 + v41);
        if (v44 != -1)
          *(_DWORD *)&v40[v41] = v44;
      }
      if (v43)
      {
        v45 = *(_DWORD *)(v43 + v41);
        if (v45 != -1)
          *(_DWORD *)&v40[v41] = v45;
      }
      v41 += 4;
    }
    while (v41 != 36);
LABEL_60:
    v10 = *v12;
    if (*v12 < 0)
      goto LABEL_65;
  }
}

uint64_t tre_tnfa_run_backtrack(uint64_t a1, char *a2, int a3, int a4, uint64_t a5, char a6, unsigned int *a7)
{
  uint64_t v10;
  unsigned int v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  char *v15;
  char *v16;
  int v17;
  uint64_t v18;
  _DWORD *v19;
  _DWORD *v20;
  uint64_t v21;
  int v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  signed int v28;
  const char *v29;
  int v30;
  size_t v31;
  uint64_t v32;
  __darwin_ct_rune_t v33;
  int v34;
  __darwin_ct_rune_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  unsigned int *v39;
  _BOOL4 v41;
  int v42;
  size_t v43;
  int v44;
  int v45;
  int v46;
  BOOL v47;
  int v48;
  unsigned int v49;
  _BOOL4 v50;
  __uint32_t v51;
  __uint32_t v52;
  _xlocale *v53;
  __uint32_t v54;
  _xlocale *v55;
  _QWORD *v56;
  _RuneLocale *v57;
  _xlocale *v58;
  __int16 v59;
  _QWORD *v60;
  _RuneLocale *v61;
  _xlocale *v62;
  __uint32_t v63;
  _QWORD *v64;
  _xlocale *v65;
  __uint32_t v66;
  _QWORD *v67;
  int v68;
  _RuneLocale *v69;
  _xlocale *v70;
  __uint32_t v71;
  _QWORD *v72;
  char *v73;
  char *v74;
  char *v75;
  __darwin_ct_rune_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  unsigned int *v81;
  uint64_t v82;
  uint64_t v83;
  unsigned int *v84;
  int v85;
  uint64_t v86;
  unsigned int v87;
  uint64_t v88;
  unsigned int v89;
  BOOL v90;
  __uint32_t v91;
  _xlocale *v92;
  __int16 v93;
  _QWORD *v94;
  _QWORD *v95;
  int v96;
  _RuneLocale *v97;
  _xlocale *v98;
  __uint32_t v99;
  _QWORD *v100;
  char v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  _DWORD *v105;
  unsigned int v106;
  const char *v107;
  int v108;
  size_t v109;
  unsigned int *v110;
  uint64_t v111;
  unsigned int *v112;
  uint64_t v113;
  int v114;
  unsigned int v115;
  uint64_t *v116;
  int v117;
  unsigned __int32 v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  const char *v130;
  size_t v131;
  uint64_t v132;
  __darwin_ct_rune_t v133;
  __darwin_ct_rune_t v134;
  int v135;
  uint64_t v136;
  _BOOL8 v138;
  int v139;
  char *v140;
  unsigned int *v141;
  uint64_t v142;
  int v143;
  int v144;
  int v145;
  int v146;
  unsigned int v147;
  _BOOL4 v148;
  int v149;
  int v150;
  _xlocale *v151;
  uint64_t v152;
  int v153;
  _xlocale *v154;
  uint64_t v155;
  _QWORD *v156;
  _RuneLocale *v157;
  _xlocale *v158;
  uint64_t v159;
  __int16 v160;
  _QWORD *v161;
  _RuneLocale *v162;
  _xlocale *v163;
  uint64_t v164;
  __uint32_t v165;
  _QWORD *v166;
  _xlocale *v167;
  uint64_t v168;
  __uint32_t v169;
  _QWORD *v170;
  int v171;
  _RuneLocale *v172;
  _xlocale *v173;
  uint64_t v174;
  __uint32_t v175;
  _QWORD *v176;
  char v177;
  unsigned int v178;
  BOOL v179;
  __darwin_ct_rune_t v180;
  int v181;
  _xlocale *v182;
  uint64_t v183;
  int v184;
  _xlocale *v185;
  uint64_t v186;
  __int16 v187;
  _QWORD *v188;
  __darwin_ct_rune_t v189;
  _QWORD *v190;
  _QWORD *v191;
  int v192;
  _RuneLocale *v193;
  _xlocale *v194;
  uint64_t v195;
  __uint32_t v196;
  _QWORD *v197;
  char v198;
  int v199;
  int v200;
  int v201;
  uint64_t v202;
  int v203;
  int v204;
  _DWORD *v205;
  int v206;
  _DWORD *v207;
  int v208;
  int v209;
  int v210;
  _xlocale *v211;
  uint64_t v212;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  int v217;
  uint64_t v218;
  uint64_t v219;
  int v220;
  uint64_t v221;
  int v222;
  int v223;
  int v224;
  int v226;
  _QWORD *v227;
  uint64_t v228;
  uint64_t v229;
  int v230;
  _xlocale *v231;
  int v232;
  _DWORD *v233;
  uint64_t v234;
  char *v235;
  char *v236;
  char *v237;
  __darwin_ct_rune_t v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  unsigned int *v243;
  uint64_t v244;
  uint64_t v245;
  unsigned int *v246;
  int v247;
  uint64_t v248;
  unsigned int v249;
  uint64_t v250;
  uint64_t v251;
  int v252;
  _DWORD *v253;
  int v254;
  const char *v255;
  unsigned int *v256;
  uint64_t v257;
  unsigned int *v258;
  uint64_t v259;
  int v260;
  int v261;
  unsigned int v262;
  int v263;
  uint64_t v264;
  uint64_t v265;
  int *v266;
  int *v267;
  int *v268;
  int v269;
  int v270;
  int v271;
  int v272;
  int v273;
  int v274;
  int v275;
  int v276;
  int v277;
  uint64_t v278;
  const char *v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  uint64_t *v287;
  void *v288;
  uint64_t v289;
  uint64_t *v290;
  _xlocale *v292;
  unsigned int *v293;
  int *v294;
  int *v295;
  int v296;
  int v297;
  int v298;
  int v299;
  int v300;
  int v301;
  char *v302;
  unsigned int v303;
  unsigned int v304;
  unsigned int v305;
  char *v306;
  __darwin_ct_rune_t v307;
  int v308;
  char v309;
  int v310;
  int v311;
  int v312;
  int v313;
  int v314;
  int v315;
  int v316;
  int v317;
  unsigned int v318;
  unsigned int v319;
  unsigned int v320;
  unsigned int v321;
  uint64_t v322;
  char *v323;
  _DWORD *v325;
  int v326;
  __darwin_ct_rune_t *v327;
  __darwin_ct_rune_t *v328;
  __darwin_ct_rune_t *v329;
  uint64_t *v330;
  char *v331;
  int *v332;
  int v334;
  uint64_t v335;
  unsigned int v336;
  int v337;
  size_t v339;
  int v340;
  int v341;
  __uint32_t *v342;
  __darwin_ct_rune_t *v343;
  size_t v344;
  uint64_t v345;
  __darwin_ct_rune_t v346[2];
  __darwin_ct_rune_t v347[2];
  __darwin_ct_rune_t v348[2];
  _BOOL4 v349;
  const char *v350;
  const char *v351;
  int v352;
  __darwin_ct_rune_t v353;
  __darwin_ct_rune_t v354;
  __darwin_ct_rune_t v355;
  __int32 v356[33];
  mbstate_t v357;

  v10 = a1;
  v353 = 0;
  v11 = *(_DWORD *)(a1 + 96);
  memset(&v356[1], 0, 128);
  v12 = (uint64_t *)tre_mem_new_impl(0, 0);
  v13 = *(int *)(v10 + 80);
  memset(&v357, 0, sizeof(v357));
  if (!v12)
    return 12;
  v14 = v12;
  v15 = tre_mem_alloc_impl((uint64_t)v12, 0, 0, 0, 0xC0uLL);
  if (!v15)
  {
    tre_mem_destroy(v14);
    return 12;
  }
  v16 = v15;
  v330 = v14;
  v340 = a3;
  *((_QWORD *)v15 + 22) = 0;
  *((_QWORD *)v15 + 23) = 0;
  v17 = *(_DWORD *)(v10 + 72);
  v18 = 4 * (int)v13;
  v19 = malloc_type_malloc((v18 * 4 + 16 * v17 + 4 * *(_DWORD *)(v10 + 92) + 14), 0xBA4DF49BuLL);
  if (!v19)
    return 12;
  v20 = v19;
  v293 = a7;
  v334 = a6 & 2;
  v21 = 16 * v13;
  v22 = 16 * v17;
  v23 = (char *)&v19[v18];
  v24 = 8 - ((unint64_t)&v19[v18] & 7);
  if (((unint64_t)&v19[v18] & 7) == 0)
    v24 = 0;
  v323 = &v23[v24];
  v25 = (uint64_t)&v23[v24 + v22];
  v26 = 8 - (v25 & 7);
  if ((v25 & 7) == 0)
    v26 = 0;
  v325 = (_DWORD *)(v25 + v26);
  v27 = (char *)v19 + v24 + v18 * 4 + v26 + v22;
  v294 = v19 + 2;
  v295 = (int *)(a5 + 8);
  v28 = -1;
  v336 = -1;
  v29 = a2;
  v329 = (__darwin_ct_rune_t *)a2;
  v352 = 1;
  LODWORD(v344) = 1;
  v345 = v10;
  v335 = a5;
  v30 = v340;
  v339 = v21;
  v303 = v11;
  v302 = v27;
LABEL_9:
  _platform_bzero();
  if (a5)
    _platform_bzero();
  v31 = v21;
  if (*(int *)(v10 + 92) >= 1)
  {
    v32 = 0;
    do
      *(_DWORD *)&v27[4 * v32++] = 0;
    while (v32 < *(int *)(v10 + 92));
  }
  *(_QWORD *)v346 = v353;
  if (!a4)
  {
    ++v28;
    if (v30 < 0 || v28 < v30)
    {
      v35 = *v329++;
      v307 = v35;
      v353 = v35;
      goto LABEL_30;
    }
    goto LABEL_22;
  }
  if (a4 != 2)
  {
    if (a4 != 1)
    {
      v307 = v353;
      goto LABEL_30;
    }
    ++v28;
    if (v30 < 0 || v28 < v30)
    {
      v33 = *(unsigned __int8 *)v29++;
      v307 = v33;
      v353 = v33;
      goto LABEL_30;
    }
LABEL_22:
    v307 = 0;
    v353 = 0;
    goto LABEL_30;
  }
  v28 += v344;
  if (v30 < 0 || v30 > v28)
  {
    v34 = *v29;
    if (v34 < 0)
    {
      v108 = v30 - v28;
      if (v30 < 0)
        v108 = 32;
      v109 = mbrtowc_l(&v353, v29, v108, &v357, *(locale_t *)(v10 + 56));
      if (v109 > 0xFFFFFFFFFFFFFFFDLL)
        return 17;
      if (v30 < 0 || v109)
      {
        v29 += v109;
        v307 = v353;
        LODWORD(v344) = v109;
      }
      else
      {
        v307 = 0;
        v353 = 0;
        ++v29;
        LODWORD(v344) = 1;
      }
      v10 = v345;
      v31 = v339;
      goto LABEL_30;
    }
    ++v29;
    v307 = v34;
    v353 = v34;
  }
  else
  {
    v307 = 0;
    v353 = 0;
  }
  LODWORD(v344) = 1;
LABEL_30:
  v331 = (char *)v29;
  *(mbstate_t *)&v356[1] = v357;
  v36 = *(_QWORD *)(v10 + 8);
  v37 = (_QWORD *)(v36 + 8);
  v326 = v28;
  v341 = (v11 >> 3) & 1;
  v38 = 0;
  v39 = 0;
  if (*(_QWORD *)(v36 + 8))
  {
    v41 = (a6 & 1) == 0 && v28 < 1;
    if (v346[0] == 10)
      v42 = (v11 >> 3) & 1;
    else
      v42 = 0;
    v342 = &_DefaultRuneLocale.__runetype[*(_QWORD *)v346];
    v43 = v31;
    v349 = v41;
    while (1)
    {
      v44 = *(_DWORD *)(v36 + 40);
      if (!v44)
        goto LABEL_126;
      v45 = (v44 & 1) == 0 || v41;
      if ((v45 | v42) != 1)
        goto LABEL_141;
      if ((v44 & 2) != 0)
      {
        v46 = v341;
        if (v353 != 10)
          v46 = 0;
        v47 = v353 | v334 && v46 == 0;
        if (v47)
          goto LABEL_141;
      }
      if ((v44 & 8) != 0)
      {
        if (v346[0] == 95)
          goto LABEL_141;
        if (v346[0] > 0x7Fu)
        {
          v53 = *(_xlocale **)(v345 + 56);
          if (v346[0] < 0x100u)
          {
            v56 = &__global_locale;
            if (v53 != (_xlocale *)-1)
              v56 = *(_QWORD **)(v345 + 56);
            if (!v53)
              v56 = &__c_locale;
            v51 = *(_DWORD *)(*(_QWORD *)(v56[166] + 120) + 4 * *(_QWORD *)v346 + 60);
          }
          else
          {
            LOWORD(v51) = ___runetype_l(v346[0], v53);
            v41 = v349;
          }
        }
        else
        {
          v51 = *v342;
        }
        if ((v51 & 0x500) != 0)
          goto LABEL_141;
        if (v353 != 95)
          break;
      }
LABEL_54:
      v48 = *(_DWORD *)(v36 + 40);
      if ((v48 & 0x10) != 0)
      {
        if (v346[0] != 95)
        {
          if (v346[0] > 0x7Fu)
          {
            v55 = *(_xlocale **)(v345 + 56);
            if (v346[0] < 0x100u)
            {
              v60 = &__global_locale;
              if (v55 != (_xlocale *)-1)
                v60 = *(_QWORD **)(v345 + 56);
              if (!v55)
                v60 = &__c_locale;
              v52 = *(_DWORD *)(*(_QWORD *)(v60[166] + 120) + 4 * *(_QWORD *)v346 + 60);
            }
            else
            {
              LOWORD(v52) = ___runetype_l(v346[0], v55);
              v41 = v349;
            }
          }
          else
          {
            v52 = *v342;
          }
          if ((v52 & 0x500) == 0)
            goto LABEL_141;
        }
        if (v353 == 95)
          goto LABEL_141;
        if (v353 <= 0x7F)
        {
          v61 = &_DefaultRuneLocale;
          goto LABEL_100;
        }
        v62 = *(_xlocale **)(v345 + 56);
        if (v353 < 0x100)
        {
          v64 = &__global_locale;
          if (v62 != (_xlocale *)-1)
            v64 = *(_QWORD **)(v345 + 56);
          if (!v62)
            v64 = &__c_locale;
          v61 = *(_RuneLocale **)(v64[166] + 120);
LABEL_100:
          v63 = v61->__runetype[v353];
        }
        else
        {
          LOWORD(v63) = ___runetype_l(v353, v62);
          v41 = v349;
        }
        if ((v63 & 0x500) != 0)
          goto LABEL_141;
        if ((*(_DWORD *)(v36 + 40) & 0x20) == 0)
          goto LABEL_125;
        goto LABEL_56;
      }
      if ((v48 & 0x20) == 0)
        goto LABEL_125;
LABEL_56:
      if (!v28)
        goto LABEL_125;
      v49 = v353;
      if (!v353)
        goto LABEL_125;
      if (v346[0] == 95)
      {
        if (v353 == 95)
          goto LABEL_141;
        v50 = 1;
LABEL_114:
        if (v49 <= 0x7F)
        {
          v69 = &_DefaultRuneLocale;
          goto LABEL_123;
        }
        v70 = *(_xlocale **)(v345 + 56);
        if (v49 < 0x100)
        {
          v72 = &__global_locale;
          if (v70 != (_xlocale *)-1)
            v72 = *(_QWORD **)(v345 + 56);
          if (!v70)
            v72 = &__c_locale;
          v69 = *(_RuneLocale **)(v72[166] + 120);
LABEL_123:
          v71 = v69->__runetype[v49];
        }
        else
        {
          LOWORD(v71) = ___runetype_l(v49, v70);
          v41 = v349;
        }
        v47 = v50 == ((v71 & 0x500) != 0);
        v28 = v326;
        if (v47)
          goto LABEL_141;
        goto LABEL_125;
      }
      if (v346[0] > 0x7Fu)
      {
        v58 = *(_xlocale **)(v345 + 56);
        if (v346[0] < 0x100u)
        {
          v67 = &__global_locale;
          if (v58 != (_xlocale *)-1)
            v67 = *(_QWORD **)(v345 + 56);
          if (!v58)
            v67 = &__c_locale;
          v54 = *(_DWORD *)(*(_QWORD *)(v67[166] + 120) + 4 * *(_QWORD *)v346 + 60);
        }
        else
        {
          v59 = ___runetype_l(v346[0], v58);
          v41 = v349;
          LOWORD(v54) = v59;
          v49 = v353;
        }
      }
      else
      {
        v54 = *v342;
      }
      v68 = v54 & 0x500;
      v50 = v68 != 0;
      if (v49 != 95)
        goto LABEL_114;
      v28 = v326;
      if (v68)
        goto LABEL_141;
LABEL_125:
      if ((*(_BYTE *)(v36 + 40) & 0x40) != 0)
      {
        if (!v28)
          goto LABEL_141;
        v89 = v353;
        if (!v353)
          goto LABEL_141;
        if (v346[0] != 95)
        {
          if (v346[0] > 0x7Fu)
          {
            v92 = *(_xlocale **)(v345 + 56);
            if (v346[0] < 0x100u)
            {
              v95 = &__global_locale;
              if (v92 != (_xlocale *)-1)
                v95 = *(_QWORD **)(v345 + 56);
              if (!v92)
                v95 = &__c_locale;
              v91 = *(_DWORD *)(*(_QWORD *)(v95[166] + 120) + 4 * *(_QWORD *)v346 + 60);
            }
            else
            {
              v93 = ___runetype_l(v346[0], v92);
              v41 = v349;
              LOWORD(v91) = v93;
              v89 = v353;
            }
          }
          else
          {
            v91 = *v342;
          }
          v96 = v91 & 0x500;
          v90 = v96 != 0;
          if (v89 == 95)
          {
            v28 = v326;
            if (!v96)
              goto LABEL_141;
            goto LABEL_126;
          }
LABEL_168:
          if (v89 <= 0x7F)
          {
            v97 = &_DefaultRuneLocale;
            goto LABEL_177;
          }
          v98 = *(_xlocale **)(v345 + 56);
          if (v89 < 0x100)
          {
            v100 = &__global_locale;
            if (v98 != (_xlocale *)-1)
              v100 = *(_QWORD **)(v345 + 56);
            if (!v98)
              v100 = &__c_locale;
            v97 = *(_RuneLocale **)(v100[166] + 120);
LABEL_177:
            v99 = v97->__runetype[v89];
          }
          else
          {
            LOWORD(v99) = ___runetype_l(v89, v98);
            v41 = v349;
          }
          v101 = v90 ^ ((v99 & 0x500) != 0);
          v28 = v326;
          if ((v101 & 1) != 0)
            goto LABEL_141;
          goto LABEL_126;
        }
        if (v353 != 95)
        {
          v90 = 1;
          goto LABEL_168;
        }
      }
LABEL_126:
      if (v38)
      {
        if (*((_QWORD *)v16 + 23))
        {
          v16 = (char *)*((_QWORD *)v16 + 23);
        }
        else
        {
          v73 = tre_mem_alloc_impl((uint64_t)v330, 0, 0, 0, 0xC0uLL);
          if (!v73)
          {
            v290 = v330;
LABEL_624:
            tre_mem_destroy(v290);
            v288 = v20;
            goto LABEL_625;
          }
          v74 = v73;
          *((_QWORD *)v73 + 22) = v16;
          *((_QWORD *)v73 + 23) = 0;
          v75 = tre_mem_alloc_impl((uint64_t)v330, 0, 0, 0, v339);
          *((_QWORD *)v74 + 5) = v75;
          if (!v75)
          {
            v290 = v330;
            goto LABEL_624;
          }
          *((_QWORD *)v16 + 23) = v74;
          v16 = v74;
          v43 = v339;
          v28 = v326;
        }
        *(_DWORD *)v16 = v28;
        *((_DWORD *)v16 + 1) = v344;
        *((_QWORD *)v16 + 1) = v29;
        *((_QWORD *)v16 + 2) = v329;
        *((_QWORD *)v16 + 3) = *v37;
        v76 = v353;
        *((_DWORD *)v16 + 8) = *(_DWORD *)(v36 + 16);
        *((_DWORD *)v16 + 9) = v76;
        _platform_memmove();
        v77 = *((_OWORD *)&v357._mbstateL + 3);
        *((_OWORD *)v16 + 5) = *((_OWORD *)&v357._mbstateL + 2);
        *((_OWORD *)v16 + 6) = v77;
        v78 = *((_OWORD *)&v357._mbstateL + 1);
        *((_OWORD *)v16 + 3) = *(_OWORD *)v357.__mbstate8;
        *((_OWORD *)v16 + 4) = v78;
        v79 = *((_OWORD *)&v357._mbstateL + 7);
        *((_OWORD *)v16 + 9) = *((_OWORD *)&v357._mbstateL + 6);
        *((_OWORD *)v16 + 10) = v79;
        v80 = *((_OWORD *)&v357._mbstateL + 5);
        *((_OWORD *)v16 + 7) = *((_OWORD *)&v357._mbstateL + 4);
        *((_OWORD *)v16 + 8) = v80;
        v81 = *(unsigned int **)(v36 + 24);
        if (v81)
        {
          v82 = *v81;
          if ((v82 & 0x80000000) == 0)
          {
            v83 = *((_QWORD *)v16 + 5);
            v84 = v81 + 1;
            do
            {
              v85 = *(_DWORD *)(v83 + 16 * v82);
              *(_DWORD *)(v83 + 16 * v82) = v85 + 1;
              if (!v85)
                *(_DWORD *)(v83 + 16 * v82 + 4) = v28;
              v86 = v83 + 16 * v82;
              *(_DWORD *)(v86 + 8) = v28;
              *(_DWORD *)(v86 + 12) = v352;
              v87 = *v84++;
              v82 = v87;
            }
            while ((v87 & 0x80000000) == 0);
          }
          ++v352;
        }
        v41 = v349;
      }
      else
      {
        v38 = *v37;
        v39 = *(unsigned int **)(v36 + 24);
      }
LABEL_141:
      v88 = *(_QWORD *)(v36 + 64);
      v37 = (_QWORD *)(v36 + 64);
      v36 += 56;
      if (!v88)
      {
        v102 = v335;
        if (v39)
        {
          v103 = *v39;
          v30 = v340;
          if ((v103 & 0x80000000) != 0)
          {
            v10 = v345;
          }
          else
          {
            v10 = v345;
            do
            {
              v104 = v20[4 * v103];
              v20[4 * v103] = v104 + 1;
              if (!v104)
                v20[4 * v103 + 1] = v28;
              v105 = &v20[4 * v103];
              v105[2] = v28;
              v105[3] = v352;
              v106 = v39[1];
              ++v39;
              v103 = v106;
            }
            while ((v106 & 0x80000000) == 0);
          }
          ++v352;
        }
        else
        {
          v30 = v340;
          v10 = v345;
        }
        goto LABEL_191;
      }
    }
    if (v353 > 0x7F)
    {
      v65 = *(_xlocale **)(v345 + 56);
      if (v353 >= 0x100)
      {
        LOWORD(v66) = ___runetype_l(v353, v65);
        v41 = v349;
        goto LABEL_158;
      }
      v94 = &__global_locale;
      if (v65 != (_xlocale *)-1)
        v94 = *(_QWORD **)(v345 + 56);
      if (!v65)
        v94 = &__c_locale;
      v57 = *(_RuneLocale **)(v94[166] + 120);
    }
    else
    {
      v57 = &_DefaultRuneLocale;
    }
    v66 = v57->__runetype[v353];
LABEL_158:
    if ((v66 & 0x500) == 0)
      goto LABEL_141;
    goto LABEL_54;
  }
  v102 = v335;
  v30 = v340;
  v43 = v31;
LABEL_191:
  v343 = v329;
  v107 = v29;
  if (v38)
    goto LABEL_202;
  while (1)
  {
    while (1)
    {
LABEL_598:
      if (!*((_QWORD *)v16 + 22))
      {
        v21 = v43;
        v11 = v303;
        v27 = v302;
        v29 = v331;
        if ((v336 & 0x80000000) == 0)
          goto LABEL_628;
        if (v28 == v326)
        {
          if (v30 < 0)
          {
            if (!v353)
            {
LABEL_628:
              v289 = v336 >> 31;
              *v293 = v336;
              goto LABEL_629;
            }
          }
          else if (v326 >= v30)
          {
            goto LABEL_628;
          }
        }
        v353 = v307;
        v357 = *(mbstate_t *)&v356[1];
        v28 = v326;
        a5 = v102;
        goto LABEL_9;
      }
      v278 = v102;
      v38 = *((_QWORD *)v16 + 3);
      if ((*(_BYTE *)(v38 + 40) & 0x80) != 0)
        v325[*((int *)v16 + 8)] = 0;
      v28 = *(_DWORD *)v16;
      v279 = (const char *)*((_QWORD *)v16 + 1);
      v343 = (__darwin_ct_rune_t *)*((_QWORD *)v16 + 2);
      LODWORD(v344) = *((_DWORD *)v16 + 1);
      v353 = *((_DWORD *)v16 + 9);
      _platform_memmove();
      v107 = v279;
      v280 = *((_OWORD *)v16 + 3);
      v281 = *((_OWORD *)v16 + 6);
      v282 = *((_OWORD *)v16 + 8);
      v283 = *((_OWORD *)v16 + 9);
      *((_OWORD *)&v357._mbstateL + 4) = *((_OWORD *)v16 + 7);
      *((_OWORD *)&v357._mbstateL + 5) = v282;
      v284 = *((_OWORD *)v16 + 10);
      *((_OWORD *)&v357._mbstateL + 6) = v283;
      *((_OWORD *)&v357._mbstateL + 7) = v284;
      v285 = *((_OWORD *)v16 + 4);
      v286 = *((_OWORD *)v16 + 5);
      *(_OWORD *)v357.__mbstate8 = v280;
      *((_OWORD *)&v357._mbstateL + 1) = v285;
      *((_OWORD *)&v357._mbstateL + 2) = v286;
      *((_OWORD *)&v357._mbstateL + 3) = v281;
      v16 = (char *)*((_QWORD *)v16 + 22);
      v102 = v278;
LABEL_202:
      if ((v336 & 0x80000000) != 0)
      {
        v30 = v340;
        if (v38 == *(_QWORD *)(v10 + 16))
          goto LABEL_565;
        break;
      }
      v30 = v340;
      if (!*(_DWORD *)(v10 + 84))
      {
        if (v38 == *(_QWORD *)(v10 + 16))
          goto LABEL_565;
        break;
      }
      v110 = *(unsigned int **)(v10 + 40);
      v111 = *v110;
      if ((v111 & 0x80000000) == 0)
      {
        v112 = v110 + 2;
        do
        {
          v113 = (int)*(v112 - 1);
          if (*(_DWORD *)(v102 + 16 * v113) && v20[4 * v113] && *(_DWORD *)(v102 + 16 * v113 + 8) == v20[4 * v113 + 2])
          {
            v114 = v20[4 * v111];
            if (*(_DWORD *)(v102 + 16 * v111))
            {
              if (!v114)
                goto LABEL_598;
LABEL_211:
              if (v20[4 * v111 + 2] > *(_DWORD *)(v102 + 16 * v111 + 8))
                goto LABEL_598;
              goto LABEL_214;
            }
            if (!v114)
              goto LABEL_211;
          }
LABEL_214:
          v115 = *v112;
          v112 += 2;
          v111 = v115;
        }
        while ((v115 & 0x80000000) == 0);
      }
      if (v38 != *(_QWORD *)(v10 + 16))
        break;
      v256 = *(unsigned int **)(v10 + 40);
      v257 = *v256;
      if ((v257 & 0x80000000) != 0)
      {
LABEL_565:
        v263 = v336;
        goto LABEL_566;
      }
      v258 = v256 + 2;
      while (1)
      {
        v259 = (int)*(v258 - 1);
        if (*(_DWORD *)(v102 + 16 * v259) && v20[4 * v259] && *(_DWORD *)(v102 + 16 * v259 + 8) == v20[4 * v259 + 2])
        {
          v260 = v20[4 * v257];
          if (*(_DWORD *)(v102 + 16 * v257))
          {
            if (!v260)
              goto LABEL_598;
          }
          else if (v260)
          {
            v263 = -1;
            goto LABEL_566;
          }
          v261 = v20[4 * v257 + 2] - *(_DWORD *)(v102 + 16 * v257 + 8);
          if (v261)
            break;
        }
        v262 = *v258;
        v258 += 2;
        v257 = v262;
        if ((v262 & 0x80000000) != 0)
          goto LABEL_565;
      }
      v263 = v336;
      if (v261 < 0)
        v263 = -1;
      if (v261 <= 0)
      {
LABEL_566:
        if (v263 < v28)
        {
          if (!v102)
            goto LABEL_569;
          goto LABEL_568;
        }
        if (v102 && v263 == v28)
        {
          v265 = *(unsigned int *)(v10 + 80);
          if ((int)v265 < 1)
            goto LABEL_569;
          v266 = *(int **)(v10 + 32);
          v267 = v294;
          v268 = v295;
          while (2)
          {
            v270 = *v266++;
            v269 = v270;
            if (v270 == 2)
            {
              v273 = *(v267 - 2);
              v274 = *(v268 - 2);
              if (v273)
              {
                if (!v274)
                  goto LABEL_568;
                v275 = *(v268 - 1);
                v276 = *(v267 - 1);
                goto LABEL_584;
              }
            }
            else
            {
              if (v269 != 1)
              {
                if (!v269)
                {
                  v271 = *v268;
                  v272 = *v267;
LABEL_588:
                  v277 = v271 - v272;
                  if (v277)
                    goto LABEL_610;
                }
                goto LABEL_594;
              }
              v273 = *(v267 - 2);
              v274 = *(v268 - 2);
              if (v273)
              {
                if (!v274)
                  goto LABEL_568;
                v275 = *(v267 - 1);
                v276 = *(v268 - 1);
LABEL_584:
                v277 = v275 - v276;
                if (v277)
                  goto LABEL_610;
                v277 = v274 - v273;
                if (v274 != v273)
                  goto LABEL_610;
                if (v273 != 1)
                {
                  v271 = *v267;
                  v272 = *v268;
                  goto LABEL_588;
                }
LABEL_594:
                v268 += 4;
                v267 += 4;
                if (!--v265)
                  goto LABEL_569;
                continue;
              }
            }
            break;
          }
          if (v274)
            v277 = -1;
          else
            v277 = 0;
          if (v277)
          {
LABEL_610:
            if (v277 < 1)
            {
LABEL_569:
              v336 = v28;
              continue;
            }
LABEL_568:
            v264 = v102;
            _platform_memmove();
            v102 = v264;
            goto LABEL_569;
          }
          goto LABEL_594;
        }
        v336 = v263;
      }
    }
    v116 = (uint64_t *)(v38 + 8);
    if (!*(_QWORD *)(v38 + 8) || (*(_BYTE *)(v38 + 40) & 0x80) == 0)
      break;
    v119 = v102;
    v350 = v107;
    v120 = *(int *)(v38 + 48);
    v121 = tre_fill_pmatch(v120 + 1, v323, *(_DWORD *)(v345 + 96) & 0xFB, v345, v20, v28);
    if ((_DWORD)v121)
    {
      v289 = v121;
LABEL_629:
      tre_mem_destroy(v330);
      free(v20);
      return v289;
    }
    v122 = &v323[16 * v120];
    v123 = *(_QWORD *)v122;
    if ((*(_QWORD *)v122 & 0x80000000) == 0)
    {
      v124 = *(_QWORD *)v122;
      v125 = *((_DWORD *)v122 + 2);
      v126 = v125 - v123;
      if (v340 < 0)
      {
        if (a4)
          v127 = _platform_strncmp();
        else
          v127 = wcsncmp((const __int32 *)&a2[4 * v124], v343 - 1, v126);
        v43 = v339;
      }
      else
      {
        if (v340 - v28 < v126)
        {
          v102 = v335;
          v30 = v340;
          v43 = v339;
          goto LABEL_553;
        }
        v43 = v339;
        if (a4)
          v127 = _platform_memcmp();
        else
          v127 = wmemcmp((const __int32 *)&a2[4 * v124], v343 - 1, v126);
      }
      if (v127 || (v132 = *(int *)(v38 + 16), v125 == (_DWORD)v123) && v325[v132])
      {
        v102 = v335;
        goto LABEL_552;
      }
      v325[v132] = v125 == v123;
      v107 = &v350[v126 - 1];
      v118 = v353;
      v343 += v126 - 1;
      if (a4)
      {
        if (a4 == 2)
        {
          v28 += v126 - 1 + v344;
          if (v340 < 0 || v340 > v28)
          {
            v128 = *v107;
            if (v128 < 0)
            {
              v254 = v340 - v28;
              if (v340 < 0)
                v254 = 32;
              v255 = &v350[v126 - 1];
              v344 = mbrtowc_l(&v353, v107, v254, &v357, *(locale_t *)(v345 + 56));
              if (v344 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                if (v340 < 0 || v344)
                {
                  v107 = &v255[v344];
                }
                else
                {
                  v353 = 0;
                  v107 = v255 + 1;
                  LODWORD(v344) = 1;
                }
                v135 = v341;
                v43 = v339;
                goto LABEL_276;
              }
              return 17;
            }
LABEL_272:
            ++v107;
            v353 = v128;
            goto LABEL_273;
          }
LABEL_540:
          v353 = 0;
          goto LABEL_273;
        }
        if (a4 != 1)
        {
          v28 += v126 - 1;
          goto LABEL_275;
        }
        v28 += v126;
        if ((v340 & 0x80000000) == 0 && v28 >= v340)
          goto LABEL_266;
LABEL_263:
        v134 = *(unsigned __int8 *)v107++;
        v133 = v134;
LABEL_268:
        v353 = v133;
        goto LABEL_275;
      }
      v28 += v126;
      if ((v340 & 0x80000000) == 0 && v28 >= v340)
        goto LABEL_266;
LABEL_267:
      v133 = *v343++;
      goto LABEL_268;
    }
    v30 = v340;
    v43 = v339;
    v10 = v345;
    v102 = v119;
  }
  if (v30 < 0)
  {
    v118 = v353;
    v117 = a4;
    if (!v353)
      goto LABEL_553;
  }
  else
  {
    v117 = a4;
    if (v30 <= v28)
      goto LABEL_553;
    v118 = v353;
  }
  switch(v117)
  {
    case 0:
      ++v28;
      if ((v30 & 0x80000000) == 0 && v28 >= v30)
        goto LABEL_266;
      goto LABEL_267;
    case 2:
      v28 += v344;
      if (v30 < 0 || v30 > v28)
      {
        v128 = *v107;
        if (v128 < 0)
        {
          v129 = v30 - v28;
          if (v30 < 0)
            v129 = 32;
          v130 = v107;
          v131 = mbrtowc_l(&v353, v107, v129, &v357, *(locale_t *)(v345 + 56));
          if (v131 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            if (v30 < 0 || v131)
            {
              v107 = &v130[v131];
              LODWORD(v344) = v131;
              break;
            }
            v353 = 0;
            v107 = v130 + 1;
LABEL_273:
            LODWORD(v344) = 1;
            break;
          }
          return 17;
        }
        goto LABEL_272;
      }
      goto LABEL_540;
    case 1:
      ++v28;
      if (v30 < 0 || v28 < v30)
        goto LABEL_263;
LABEL_266:
      v353 = 0;
      break;
  }
LABEL_275:
  v135 = v341;
LABEL_276:
  if (!*v116)
  {
    v136 = 0;
    v141 = v39;
    goto LABEL_531;
  }
  v136 = 0;
  v138 = (a6 & 1) == 0 && v28 < 1;
  if (v118 == 10)
    v139 = v135;
  else
    v139 = 0;
  v140 = &_DefaultRuneLocale.__magic[4 * v118];
  v332 = (int *)(v140 + 60);
  v327 = (__darwin_ct_rune_t *)(v140 + 1084);
  v328 = (__darwin_ct_rune_t *)(v140 + 2108);
  v141 = v39;
  v142 = v138;
  v351 = v107;
  v337 = v139;
LABEL_287:
  if (*(_DWORD *)v38 > (signed __int32)v118 || *(_DWORD *)(v38 + 4) < (signed __int32)v118)
    goto LABEL_526;
  v143 = *(_DWORD *)(v38 + 40);
  if (!v143)
    goto LABEL_512;
  if ((v143 & 1) != 0)
    v144 = v142;
  else
    v144 = 1;
  if ((v144 | v139) != 1)
    goto LABEL_526;
  if ((v143 & 2) != 0)
  {
    v145 = v341;
    if (v353 != 10)
      v145 = 0;
    if (v353 | v334 && !v145)
      goto LABEL_526;
  }
  if ((v143 & 8) != 0)
  {
    if (v118 == 95)
      goto LABEL_526;
    if (v118 > 0x7F)
    {
      v151 = *(_xlocale **)(v345 + 56);
      if (v118 < 0x100)
      {
        v156 = &__global_locale;
        if (v151 != (_xlocale *)-1)
          v156 = *(_QWORD **)(v345 + 56);
        if (!v151)
          v156 = &__c_locale;
        v149 = *(_DWORD *)(*(_QWORD *)(v156[166] + 120) + 4 * v118 + 60);
      }
      else
      {
        v152 = v136;
        LOWORD(v149) = ___runetype_l(v118, v151);
        v136 = v152;
        v139 = v337;
        v107 = v351;
      }
    }
    else
    {
      v149 = *v332;
    }
    if ((v149 & 0x500) != 0)
      goto LABEL_526;
    if (v353 != 95)
    {
      if (v353 <= 0x7F)
      {
        v157 = &_DefaultRuneLocale;
        goto LABEL_396;
      }
      v167 = *(_xlocale **)(v345 + 56);
      if (v353 < 0x100)
      {
        v188 = &__global_locale;
        if (v167 != (_xlocale *)-1)
          v188 = *(_QWORD **)(v345 + 56);
        if (!v167)
          v188 = &__c_locale;
        v157 = *(_RuneLocale **)(v188[166] + 120);
LABEL_396:
        v169 = v157->__runetype[v353];
      }
      else
      {
        v168 = v136;
        LOWORD(v169) = ___runetype_l(v353, v167);
        v136 = v168;
        v139 = v337;
        v107 = v351;
      }
      if ((v169 & 0x500) == 0)
        goto LABEL_526;
    }
  }
  v146 = *(_DWORD *)(v38 + 40);
  if ((v146 & 0x10) != 0)
  {
    if (v118 != 95)
    {
      if (v118 > 0x7F)
      {
        v154 = *(_xlocale **)(v345 + 56);
        if (v118 < 0x100)
        {
          v161 = &__global_locale;
          if (v154 != (_xlocale *)-1)
            v161 = *(_QWORD **)(v345 + 56);
          if (!v154)
            v161 = &__c_locale;
          v150 = *(_DWORD *)(*(_QWORD *)(v161[166] + 120) + 4 * v118 + 60);
        }
        else
        {
          v155 = v136;
          LOWORD(v150) = ___runetype_l(v118, v154);
          v136 = v155;
          v139 = v337;
          v107 = v351;
        }
      }
      else
      {
        v150 = *v332;
      }
      if ((v150 & 0x500) == 0)
        goto LABEL_526;
    }
    if (v353 == 95)
      goto LABEL_526;
    if (v353 > 0x7F)
    {
      v163 = *(_xlocale **)(v345 + 56);
      if (v353 >= 0x100)
      {
        v164 = v136;
        LOWORD(v165) = ___runetype_l(v353, v163);
        v136 = v164;
        v139 = v337;
        v107 = v351;
        goto LABEL_347;
      }
      v166 = &__global_locale;
      if (v163 != (_xlocale *)-1)
        v166 = *(_QWORD **)(v345 + 56);
      if (!v163)
        v166 = &__c_locale;
      v162 = *(_RuneLocale **)(v166[166] + 120);
    }
    else
    {
      v162 = &_DefaultRuneLocale;
    }
    v165 = v162->__runetype[v353];
LABEL_347:
    if ((v165 & 0x500) != 0)
      goto LABEL_526;
    if ((*(_DWORD *)(v38 + 40) & 0x20) == 0)
      goto LABEL_371;
LABEL_302:
    if (!v28)
      goto LABEL_371;
    v147 = v353;
    if (!v353)
      goto LABEL_371;
    if (v118 == 95)
    {
      if (v353 == 95)
        goto LABEL_526;
      v148 = 1;
    }
    else
    {
      if (v118 > 0x7F)
      {
        v158 = *(_xlocale **)(v345 + 56);
        if (v118 < 0x100)
        {
          v170 = &__global_locale;
          if (v158 != (_xlocale *)-1)
            v170 = *(_QWORD **)(v345 + 56);
          if (!v158)
            v170 = &__c_locale;
          v153 = *(_DWORD *)(*(_QWORD *)(v170[166] + 120) + 4 * v118 + 60);
        }
        else
        {
          v159 = v136;
          v160 = ___runetype_l(v118, v158);
          v136 = v159;
          v139 = v337;
          v107 = v351;
          LOWORD(v153) = v160;
          v147 = v353;
        }
      }
      else
      {
        v153 = *v332;
      }
      v171 = v153 & 0x500;
      v148 = v171 != 0;
      if (v147 == 95)
      {
        v43 = v339;
        if (v171)
          goto LABEL_526;
        goto LABEL_371;
      }
    }
    if (v147 > 0x7F)
    {
      v173 = *(_xlocale **)(v345 + 56);
      if (v147 >= 0x100)
      {
        v174 = v136;
        LOWORD(v175) = ___runetype_l(v147, v173);
        v136 = v174;
        v139 = v337;
        v107 = v351;
        goto LABEL_370;
      }
      v176 = &__global_locale;
      if (v173 != (_xlocale *)-1)
        v176 = *(_QWORD **)(v345 + 56);
      if (!v173)
        v176 = &__c_locale;
      v172 = *(_RuneLocale **)(v176[166] + 120);
    }
    else
    {
      v172 = &_DefaultRuneLocale;
    }
    v175 = v172->__runetype[v147];
LABEL_370:
    v47 = v148 == ((v175 & 0x500) != 0);
    v43 = v339;
    if (v47)
      goto LABEL_526;
    goto LABEL_371;
  }
  if ((v146 & 0x20) != 0)
    goto LABEL_302;
LABEL_371:
  if ((*(_BYTE *)(v38 + 40) & 0x40) != 0)
  {
    if (!v28)
      goto LABEL_526;
    v178 = v353;
    if (!v353)
      goto LABEL_526;
    if (v118 == 95)
    {
      if (v353 == 95)
        goto LABEL_372;
      v179 = 1;
    }
    else
    {
      if (v118 > 0x7F)
      {
        v185 = *(_xlocale **)(v345 + 56);
        if (v118 < 0x100)
        {
          v191 = &__global_locale;
          if (v185 != (_xlocale *)-1)
            v191 = *(_QWORD **)(v345 + 56);
          if (!v185)
            v191 = &__c_locale;
          v181 = *(_DWORD *)(*(_QWORD *)(v191[166] + 120) + 4 * v118 + 60);
        }
        else
        {
          v186 = v136;
          v187 = ___runetype_l(v118, v185);
          v136 = v186;
          v139 = v337;
          v107 = v351;
          LOWORD(v181) = v187;
          v178 = v353;
        }
      }
      else
      {
        v181 = *v332;
      }
      v192 = v181 & 0x500;
      v179 = v192 != 0;
      if (v178 == 95)
      {
        v43 = v339;
        if (!v192)
          goto LABEL_526;
        goto LABEL_372;
      }
    }
    if (v178 > 0x7F)
    {
      v194 = *(_xlocale **)(v345 + 56);
      if (v178 >= 0x100)
      {
        v195 = v136;
        LOWORD(v196) = ___runetype_l(v178, v194);
        v136 = v195;
        v139 = v337;
        v107 = v351;
        goto LABEL_427;
      }
      v197 = &__global_locale;
      if (v194 != (_xlocale *)-1)
        v197 = *(_QWORD **)(v345 + 56);
      if (!v194)
        v197 = &__c_locale;
      v193 = *(_RuneLocale **)(v197[166] + 120);
    }
    else
    {
      v193 = &_DefaultRuneLocale;
    }
    v196 = v193->__runetype[v178];
LABEL_427:
    v198 = v179 ^ ((v196 & 0x500) != 0);
    v43 = v339;
    if ((v198 & 1) != 0)
      goto LABEL_526;
  }
LABEL_372:
  if ((*(_BYTE *)(v38 + 40) & 4) == 0)
    goto LABEL_512;
  v322 = *(_QWORD *)(v38 + 48);
  v356[0] = v118;
  v355 = 0;
  v354 = 0;
  v301 = *(_DWORD *)(v345 + 96);
  if ((v301 & 2) == 0)
  {
LABEL_374:
    v177 = 1;
    goto LABEL_431;
  }
  if (v118 < 0x80)
  {
    if ((*v332 & 0x1000) == 0)
    {
      if ((*v332 & 0x8000) == 0)
        goto LABEL_374;
      v355 = v118;
      v180 = *v327;
LABEL_430:
      v177 = 0;
      v354 = v180;
      goto LABEL_431;
    }
    v354 = v118;
    v189 = *v328;
LABEL_408:
    v177 = 0;
    v355 = v189;
    goto LABEL_431;
  }
  v304 = v142;
  v182 = *(_xlocale **)(v345 + 56);
  v183 = v136;
  if (v118 < 0x100)
  {
    v190 = &__global_locale;
    if (v182 != (_xlocale *)-1)
      v190 = *(_QWORD **)(v345 + 56);
    if (!v182)
      v190 = &__c_locale;
    v184 = *(_DWORD *)(*(_QWORD *)(v190[166] + 120) + 4 * v118 + 60);
    if ((v184 & 0x1000) == 0)
      goto LABEL_405;
LABEL_407:
    v354 = v118;
    v189 = ___toupper_l(v118, v182);
    v107 = v351;
    v136 = v183;
    v142 = v304;
    v139 = v337;
    goto LABEL_408;
  }
  if ((___runetype_l(v118, *(locale_t *)(v345 + 56)) & 0x1000) != 0)
    goto LABEL_407;
  LOWORD(v184) = ___runetype_l(v118, v182);
LABEL_405:
  if ((v184 & 0x8000) != 0)
  {
    v355 = v118;
    v180 = ___tolower_l(v118, v182);
    v107 = v351;
    v136 = v183;
    v142 = v304;
    v139 = v337;
    goto LABEL_430;
  }
  v177 = 1;
  v107 = v351;
  v136 = v183;
  v142 = v304;
  v139 = v337;
LABEL_431:
  v199 = *(_DWORD *)v322;
  if (*(int *)v322 < 1)
  {
    v200 = 0;
    v232 = 1;
    goto LABEL_508;
  }
  v305 = v142;
  v200 = 0;
  v201 = 0;
  v202 = 0;
  v203 = 0;
  v204 = 0;
  v205 = (_DWORD *)(v322 + 8);
  v308 = *(_DWORD *)v322;
  v309 = v177;
  v306 = v16;
  *(_QWORD *)v347 = v136;
  while (2)
  {
    switch(*v205)
    {
      case 1:
        v206 = v205[1];
        if ((v177 & 1) != 0)
        {
          if (v206 != v356[0])
            goto LABEL_498;
          goto LABEL_501;
        }
        if (v206 == v355 || v206 == v354)
          goto LABEL_501;
        goto LABEL_498;
      case 2:
        if (++v204 >= v199)
          goto LABEL_499;
        v207 = v205 + 2;
        if (v205[2] != 3)
        {
          v200 = 0;
          v232 = 1;
          goto LABEL_506;
        }
        v208 = v205[1];
        v209 = v205[3];
        if (v200)
        {
          if ((v177 & 1) == 0)
          {
LABEL_474:
            if (v208 <= (int)v202 && (int)v202 <= v209)
            {
              v232 = 0;
              v200 = 1;
              goto LABEL_506;
            }
            v200 = 1;
            if (v208 <= v201 && v201 <= v209)
              goto LABEL_504;
            goto LABEL_478;
          }
        }
        else
        {
          v298 = v208;
          v218 = *(_QWORD *)(v345 + 56);
          if ((v177 & 1) == 0)
          {
            v316 = v203;
            v320 = __collate_equiv_value(v218, &v355, 1uLL);
            v226 = __collate_equiv_value(v218, &v354, 1uLL);
            v203 = v316;
            v202 = v320;
            v201 = v226;
            v136 = *(_QWORD *)v347;
            v107 = v351;
            v139 = v337;
            v199 = v308;
            v177 = v309;
            v208 = v298;
            goto LABEL_474;
          }
          v311 = v201;
          v219 = v202;
          v220 = __collate_equiv_value(*(_QWORD *)(v345 + 56), v356, 1uLL);
          v177 = v309;
          v201 = v311;
          v202 = v219;
          v203 = v220;
          v136 = *(_QWORD *)v347;
          v107 = v351;
          v139 = v337;
          v199 = v308;
          v208 = v298;
        }
        v200 = 1;
        if (v208 > v203 || v203 > v209)
        {
LABEL_478:
          v205 = v207;
          v16 = v306;
LABEL_498:
          ++v204;
          v205 += 2;
          if (v204 >= v199)
          {
LABEL_499:
            v200 = 0;
            v232 = 1;
            goto LABEL_507;
          }
          continue;
        }
LABEL_504:
        v232 = 0;
LABEL_506:
        v16 = v306;
LABEL_507:
        v43 = v339;
        v142 = v305;
LABEL_508:
        if ((*(_BYTE *)(v322 + 4) & 1) == 0)
        {
LABEL_511:
          if (!v200)
            goto LABEL_526;
          goto LABEL_512;
        }
        if ((v301 & 8) != 0)
        {
          v200 = v232;
          if (v356[0] != 10)
            goto LABEL_511;
LABEL_526:
          v250 = *(_QWORD *)(v38 + 64);
          v116 = (uint64_t *)(v38 + 64);
          v38 += 56;
          if (!v250)
          {
LABEL_531:
            v102 = v335;
            if (v136)
            {
              v39 = 0;
              v38 = v136;
              v10 = v345;
              if (v141)
              {
                v251 = *v141;
                if ((v251 & 0x80000000) != 0)
                {
                  v39 = v141;
                }
                else
                {
                  do
                  {
                    v252 = v20[4 * v251];
                    v20[4 * v251] = v252 + 1;
                    if (!v252)
                      v20[4 * v251 + 1] = v28;
                    v39 = v141 + 1;
                    v253 = &v20[4 * v251];
                    v253[2] = v28;
                    v253[3] = v352;
                    v251 = v141[1];
                    ++v141;
                  }
                  while ((v251 & 0x80000000) == 0);
                }
                ++v352;
                v38 = v136;
              }
              goto LABEL_202;
            }
            v39 = v141;
LABEL_552:
            v30 = v340;
LABEL_553:
            v10 = v345;
            goto LABEL_598;
          }
          goto LABEL_287;
        }
        if (!v232)
          goto LABEL_526;
LABEL_512:
        if (!v136)
        {
          v136 = *v116;
          v141 = *(unsigned int **)(v38 + 24);
          goto LABEL_526;
        }
        *(_QWORD *)v348 = v136;
        if (*((_QWORD *)v16 + 23))
        {
          v16 = (char *)*((_QWORD *)v16 + 23);
          goto LABEL_519;
        }
        v233 = v20;
        v234 = v142;
        v235 = tre_mem_alloc_impl((uint64_t)v330, 0, 0, 0, 0xC0uLL);
        if (v235)
        {
          v236 = v235;
          *((_QWORD *)v235 + 22) = v16;
          *((_QWORD *)v235 + 23) = 0;
          v237 = tre_mem_alloc_impl((uint64_t)v330, 0, 0, 0, v339);
          *((_QWORD *)v236 + 5) = v237;
          if (v237)
          {
            *((_QWORD *)v16 + 23) = v236;
            v16 = v236;
            v43 = v339;
            v107 = v351;
            v142 = v234;
            v20 = v233;
            v139 = v337;
LABEL_519:
            *(_DWORD *)v16 = v28;
            *((_DWORD *)v16 + 1) = v344;
            *((_QWORD *)v16 + 1) = v107;
            *((_QWORD *)v16 + 2) = v343;
            *((_QWORD *)v16 + 3) = *v116;
            v238 = v353;
            *((_DWORD *)v16 + 8) = *(_DWORD *)(v38 + 16);
            *((_DWORD *)v16 + 9) = v238;
            _platform_memmove();
            v239 = *((_OWORD *)&v357._mbstateL + 3);
            *((_OWORD *)v16 + 5) = *((_OWORD *)&v357._mbstateL + 2);
            *((_OWORD *)v16 + 6) = v239;
            v240 = *((_OWORD *)&v357._mbstateL + 1);
            *((_OWORD *)v16 + 3) = *(_OWORD *)v357.__mbstate8;
            *((_OWORD *)v16 + 4) = v240;
            v241 = *((_OWORD *)&v357._mbstateL + 7);
            *((_OWORD *)v16 + 9) = *((_OWORD *)&v357._mbstateL + 6);
            *((_OWORD *)v16 + 10) = v241;
            v242 = *((_OWORD *)&v357._mbstateL + 5);
            *((_OWORD *)v16 + 7) = *((_OWORD *)&v357._mbstateL + 4);
            *((_OWORD *)v16 + 8) = v242;
            v243 = *(unsigned int **)(v38 + 24);
            if (v243)
            {
              v244 = *v243;
              if ((v244 & 0x80000000) == 0)
              {
                v245 = *((_QWORD *)v16 + 5);
                v246 = v243 + 1;
                do
                {
                  v247 = *(_DWORD *)(v245 + 16 * v244);
                  *(_DWORD *)(v245 + 16 * v244) = v247 + 1;
                  if (!v247)
                    *(_DWORD *)(v245 + 16 * v244 + 4) = v28;
                  v248 = v245 + 16 * v244;
                  *(_DWORD *)(v248 + 8) = v28;
                  *(_DWORD *)(v248 + 12) = v352;
                  v249 = *v246++;
                  v244 = v249;
                }
                while ((v249 & 0x80000000) == 0);
              }
            }
            v107 = v351;
            ++v352;
            v136 = *(_QWORD *)v348;
            goto LABEL_526;
          }
          v287 = v330;
        }
        else
        {
          v287 = v330;
        }
        tre_mem_destroy(v287);
        v288 = v233;
LABEL_625:
        free(v288);
        free(v323);
        free(v325);
        return 12;
      case 4:
        v210 = v205[1];
        v211 = *(_xlocale **)(v345 + 56);
        if ((v177 & 1) != 0)
        {
          v212 = v356[0];
        }
        else
        {
          if (v355 > 0x7F)
          {
            if (v355 < 0x100)
            {
              v227 = &__global_locale;
              if (v211 != (_xlocale *)-1)
                v227 = *(_QWORD **)(v345 + 56);
              if (!v211)
                v227 = &__c_locale;
              v222 = *(_DWORD *)(*(_QWORD *)(v227[166] + 120) + 4 * v355 + 60);
            }
            else
            {
              v314 = v203;
              v318 = v202;
              v221 = v136;
              v296 = v205[1];
              v299 = v200;
              v312 = v201;
              v292 = *(_xlocale **)(v345 + 56);
              v222 = ___runetype_l(v355, v211);
              v211 = v292;
              v210 = v296;
              v200 = v299;
              v201 = v312;
              v203 = v314;
              v202 = v318;
              v199 = v308;
              v177 = v309;
              v136 = v221;
              v139 = v337;
              v107 = v351;
            }
            v214 = v222 & v210;
          }
          else
          {
            v214 = _DefaultRuneLocale.__runetype[v355] & v210;
          }
          if (v214)
          {
LABEL_501:
            v232 = 0;
            v200 = 1;
            goto LABEL_507;
          }
          v212 = v354;
        }
        if (v212 > 0x7F)
        {
          if (v212 < 0x100)
          {
            v231 = (_xlocale *)&__global_locale;
            if (v211 != (_xlocale *)-1)
              v231 = v211;
            if (!v211)
              v231 = (_xlocale *)&__c_locale;
            v230 = *(_DWORD *)(*(_QWORD *)(*((_QWORD *)v231 + 166) + 120) + 4 * v212 + 60);
          }
          else
          {
            v317 = v203;
            v321 = v202;
            v229 = v136;
            v297 = v210;
            v300 = v200;
            v313 = v201;
            v230 = ___runetype_l(v212, v211);
            v210 = v297;
            v200 = v300;
            v201 = v313;
            v203 = v317;
            v202 = v321;
            v199 = v308;
            v177 = v309;
            v136 = v229;
            v139 = v337;
            v107 = v351;
          }
          v228 = v230 & v210;
        }
        else
        {
          v228 = _DefaultRuneLocale.__runetype[v212] & v210;
        }
        if (v228)
          goto LABEL_501;
        goto LABEL_498;
      case 5:
        if (v200)
        {
          if ((v177 & 1) != 0)
            goto LABEL_457;
        }
        else
        {
          v215 = *(_QWORD *)(v345 + 56);
          if ((v177 & 1) != 0)
          {
            v310 = v201;
            v216 = v202;
            v217 = __collate_equiv_value(*(_QWORD *)(v345 + 56), v356, 1uLL);
            v177 = v309;
            v201 = v310;
            v202 = v216;
            v203 = v217;
            v136 = *(_QWORD *)v347;
            v107 = v351;
            v139 = v337;
            v199 = v308;
LABEL_457:
            v200 = 1;
            if (v205[1] == v203)
              goto LABEL_502;
            goto LABEL_498;
          }
          v315 = v203;
          v319 = __collate_equiv_value(v215, &v355, 1uLL);
          v223 = __collate_equiv_value(v215, &v354, 1uLL);
          v203 = v315;
          v202 = v319;
          v201 = v223;
          v136 = *(_QWORD *)v347;
          v107 = v351;
          v139 = v337;
          v199 = v308;
          v177 = v309;
        }
        v224 = v205[1];
        v200 = 1;
        if (v224 == (_DWORD)v202 || v224 == v201)
        {
LABEL_502:
          v232 = 0;
          goto LABEL_507;
        }
        goto LABEL_498;
      default:
        goto LABEL_498;
    }
  }
}

_OWORD *tre_mem_new_impl(int a1, _OWORD *a2)
{
  if (!a1)
    return malloc_type_calloc(1uLL, 0x30uLL, 0x10B0040729534FEuLL);
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return a2;
}

void tre_mem_destroy(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  if (*a1)
  {
    do
    {
      free(*(void **)v2);
      v3 = *(_QWORD *)(v2 + 8);
      free((void *)v2);
      v2 = v3;
    }
    while (v3);
  }
  free(a1);
}

char *tre_mem_alloc_impl(uint64_t a1, int a2, char *a3, int a4, size_t a5)
{
  char *v5;
  size_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  if (*(_DWORD *)(a1 + 32))
    return 0;
  v9 = *(_QWORD *)(a1 + 24);
  if (v9 >= a5)
  {
    v5 = *(char **)(a1 + 16);
    goto LABEL_8;
  }
  if (!a2)
  {
    if (8 * a5 <= 0x400)
      v9 = 1024;
    else
      v9 = 8 * a5;
    v11 = malloc_type_malloc(0x10uLL, 0xA0040BD48D6D6uLL);
    if (v11)
    {
      v12 = v11;
      v5 = (char *)malloc_type_malloc(v9, 0x12C1A002uLL);
      *v12 = v5;
      if (v5)
      {
        v12[1] = 0;
        v13 = *(_QWORD *)(a1 + 8);
        if (v13)
          *(_QWORD *)(v13 + 8) = v12;
        if (!*(_QWORD *)a1)
          *(_QWORD *)a1 = v12;
        *(_QWORD *)(a1 + 8) = v12;
        goto LABEL_8;
      }
      free(v12);
    }
    else
    {
      v5 = 0;
    }
LABEL_25:
    *(_DWORD *)(a1 + 32) = 1;
    return v5;
  }
  v5 = a3;
  if (!a3)
    goto LABEL_25;
  v9 = 1024;
LABEL_8:
  if ((((_BYTE)v5 + (_BYTE)a5) & 7) != 0)
    v10 = 8 - (((_BYTE)v5 + (_BYTE)a5) & 7);
  else
    v10 = 0;
  *(_QWORD *)(a1 + 16) = &v5[v10 + a5];
  *(_QWORD *)(a1 + 24) = v9 - (v10 + a5);
  if (a4)
    _platform_bzero();
  return v5;
}

uint64_t tre_parse(uint64_t a1)
{
  int *v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  int v13;
  uint64_t v14;
  int *v15;
  unsigned int v16;
  int v17;
  int *v18;
  unint64_t v19;
  unsigned int v20;
  int v21;
  int v22;
  int v23;
  char *v24;
  uint64_t v25;
  int v26;
  char *v27;
  char *v28;
  int v29;
  unsigned int v30;
  int *v31;
  unsigned int v32;
  unsigned int v33;
  int *v34;
  unint64_t v35;
  int v36;
  int v37;
  uint64_t v38;
  char *v39;
  int *v40;
  unint64_t v41;
  int v42;
  int v43;
  uint64_t v45;
  int *v46;
  unint64_t v47;
  unsigned int v48;
  int v49;
  char *v50;
  int *v52;
  int v53;
  _BOOL4 v54;
  int v55;
  _DWORD *v56;
  uint64_t v57;
  int v58;
  BOOL v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  int v63;
  int *v64;
  int *v65;
  int v66;
  unsigned int v67;
  int v68;
  int *v69;
  int v70;
  int *v71;
  int v72;
  int v73;
  _DWORD *v74;
  __int32 *v75;
  unint64_t v76;
  int v77;
  int v78;
  __int32 v79;
  __int32 v80;
  int *v81;
  int v82;
  __int32 *v83;
  uint64_t v84;
  uint64_t v85;
  __int32 *v86;
  uint64_t v87;
  int v88;
  int v89;
  int v90;
  int v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  __int32 *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  __int32 *v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  uint64_t v105;
  size_t v106;
  const __int32 *v107;
  size_t v108;
  wctype_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t *v113;
  char *v114;
  uint64_t v115;
  char *v116;
  int v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint64_t v122;
  int v123;
  uint64_t v124;
  int v125;
  uint64_t v126;
  uint64_t v127;
  _RuneLocale *v128;
  _xlocale *v129;
  __int16 v130;
  _QWORD *v131;
  uint64_t v132;
  _RuneLocale *v133;
  _xlocale *v134;
  __int16 v135;
  _QWORD *v136;
  uint64_t v137;
  uint64_t v138;
  __darwin_ct_rune_t v139;
  __darwin_ct_rune_t v140;
  char *v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  __darwin_ct_rune_t v146;
  __darwin_ct_rune_t v147;
  char *v148;
  char *v149;
  int v150;
  char *v151;
  int v152;
  int v153;
  uint64_t v154;
  int *v155;
  unsigned int v156;
  uint64_t *v157;
  char *v158;
  void *v159;
  uint64_t v160;
  int v161;
  int v162;
  int32x2_t v163;
  int v164;
  int v165;
  uint64_t *v166;
  _DWORD *v167;
  uint64_t v168;
  _BYTE *v169;
  char *v170;
  _DWORD *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  _DWORD *v178;
  uint64_t *v179;
  uint64_t v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  wint_t v185;
  int v186;
  wint_t *v187;
  wint_t v188;
  _DWORD *v189;
  char *v190;
  uint64_t v191;
  char *v192;
  wint_t *v193;
  uint64_t v194;
  int v195;
  const __int32 *v197;
  uint64_t v198;
  int v199;
  _BYTE v200[12];
  _QWORD *v201;
  uint64_t *ptr;
  int v203;
  unsigned int v204;
  int v205;
  void *v206;
  void *v207;
  char *v208;
  void *v209;
  __int32 *v210;
  __int32 v211;
  __int32 v212;
  int v213;
  mbstate_t v214;
  char __str[16];
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  char v223[64];

  v208 = 0;
  v2 = *(int **)(a1 + 8);
  v3 = tre_stack_num_objects((uint64_t)v2);
  if (*(int *)(a1 + 56) < 1)
    return 14;
  v4 = v3;
  if (!*(_DWORD *)(a1 + 88))
  {
    tre_stack_push_int(v2, *(_DWORD *)(a1 + 84));
    tre_stack_push_int(v2, *(_DWORD *)(a1 + 60));
    tre_stack_push_int(v2, 2u);
    ++*(_DWORD *)(a1 + 60);
  }
  tre_stack_push_int(v2, 0);
  v5 = tre_stack_push_int(v2, 0);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = v6 + 4 * *(int *)(a1 + 56);
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  if ((int)tre_stack_num_objects((uint64_t)v2) <= v4 || (_DWORD)v5 != 0)
  {
    if ((_DWORD)v5)
      return v5;
    goto LABEL_9;
  }
  v9 = 0;
  v10 = 0;
  v11 = &__c_locale;
LABEL_11:
  switch(tre_stack_pop_int((uint64_t)v2))
  {
    case 0u:
      v12 = tre_stack_pop_int((uint64_t)v2);
      v13 = *(_DWORD *)(a1 + 84);
      if ((v13 & 0x10) == 0 && (v13 & 0x101) != 0)
      {
        v14 = tre_stack_push_int(v2, 7u);
        if ((_DWORD)v14)
          goto LABEL_293;
      }
      v14 = tre_stack_push_int(v2, v12);
      if ((_DWORD)v14)
        goto LABEL_293;
      v15 = v2;
      v16 = 3;
      goto LABEL_46;
    case 1u:
      v17 = tre_stack_pop_int((uint64_t)v2);
      v18 = *(int **)(a1 + 24);
      v19 = *(_QWORD *)(a1 + 40);
      if ((unint64_t)v18 >= v19)
        goto LABEL_304;
      v20 = *(_DWORD *)(a1 + 84);
      if ((v20 & 0x10) != 0)
        goto LABEL_304;
      v21 = *v18;
      if (*v18 <= 45)
      {
        if (v21 == 36)
        {
          if ((v20 & 1) == 0)
          {
            if ((unint64_t)(v18 + 2) < v19 && v18[1] == 92)
            {
              if (v18[2] != 41 && v18 + 1 != (int *)v19)
                goto LABEL_304;
            }
            else if (v18 + 1 != (int *)v19)
            {
              goto LABEL_304;
            }
          }
          v57 = *(_QWORD *)a1;
          v58 = 2;
          goto LABEL_374;
        }
        if (v21 != 40)
        {
          if (v21 != 41 || (v20 & 1) == 0 || (int)v10 <= 0)
            goto LABEL_304;
LABEL_93:
          v208 = tre_ast_new_literal(*(_QWORD *)a1, -1, -1, -1);
          if (!v208)
            return 12;
          if ((*(_BYTE *)(a1 + 84) & 1) != 0)
            goto LABEL_379;
          goto LABEL_140;
        }
        if ((~v20 & 0x101) == 0 && v18[1] == 63)
        {
          v206 = v11;
          v64 = v18 + 2;
          v65 = v18 + 3;
          v66 = 1;
          v67 = *(_DWORD *)(a1 + 84);
          while (1)
          {
            v68 = *v64;
            if (*v64 > 84)
            {
              switch(v68)
              {
                case 'U':
                  v67 = v67 & 0xFFFFFFBF | ((v66 != 0) << 6);
                  break;
                case 'i':
                  v67 = v67 & 0xFFFFFFFD | (2 * (v66 != 0));
                  break;
                case 'n':
                  v67 = v67 & 0xFFFFFFF7 | (8 * (v66 != 0));
                  break;
                default:
                  goto LABEL_512;
              }
            }
            else
            {
              if (v68 <= 44)
              {
                if (v68 == 35)
                {
                  *(_QWORD *)(a1 + 24) = v64;
                  do
                  {
                    if ((unint64_t)(v65 - 1) >= v19)
                      return 2;
                    *(_QWORD *)(a1 + 24) = v65;
                    v162 = *v65++;
                  }
                  while (v162 != 41);
                  v64 = v65 - 1;
                  if ((unint64_t)(v65 - 1) >= v19)
                    return 2;
                }
                else
                {
                  if (v68 != 41)
                    goto LABEL_512;
                  *(_QWORD *)(a1 + 24) = v64;
                }
                *(_QWORD *)(a1 + 24) = v64 + 1;
                v154 = tre_stack_push_int(v2, 0);
                if ((_DWORD)v154)
                  goto LABEL_428;
                v155 = v2;
                v156 = 1;
LABEL_427:
                v154 = tre_stack_push_int(v155, v156);
                if ((_DWORD)v154)
                {
LABEL_428:
                  v5 = v154;
                }
                else
                {
                  v5 = 0;
                  *(_DWORD *)(a1 + 84) = v67;
                }
LABEL_429:
                v11 = v206;
LABEL_380:
                if ((int)tre_stack_num_objects((uint64_t)v2) <= v4 || (_DWORD)v5)
                {
                  if ((_DWORD)v5)
                    return v5;
                  if ((int)v10 > 0)
                    return 8;
LABEL_9:
                  v5 = 0;
                  *(_QWORD *)(a1 + 16) = v208;
                  return v5;
                }
                goto LABEL_11;
              }
              if (v68 != 45)
              {
                if (v68 == 58)
                {
                  *(_QWORD *)(a1 + 24) = v64 + 1;
                  v10 = (v10 + 1);
                  v154 = tre_stack_push_int(v2, v20);
                  if (!(_DWORD)v154)
                  {
                    v154 = tre_stack_push_int(v2, *(_DWORD *)(a1 + 64));
                    if (!(_DWORD)v154)
                    {
                      v154 = tre_stack_push_int(v2, 2u);
                      if (!(_DWORD)v154)
                      {
                        ++*(_DWORD *)(a1 + 64);
                        v154 = tre_stack_push_int(v2, 0);
                        if (!(_DWORD)v154)
                        {
                          v155 = v2;
                          v156 = 0;
                          goto LABEL_427;
                        }
                      }
                    }
                  }
                  goto LABEL_428;
                }
LABEL_512:
                *(_QWORD *)(a1 + 24) = v64;
                return 13;
              }
              v66 = 0;
            }
            ++v64;
            ++v65;
          }
        }
        if ((v20 & 1) == 0)
          goto LABEL_304;
        v69 = *(int **)(a1 + 24);
        goto LABEL_289;
      }
      if (v21 > 91)
      {
        if (v21 != 92)
        {
          if (v21 == 94 && (*(_DWORD *)(a1 + 84) & 1 | v17 || v18 == *(int **)(a1 + 32)))
          {
            v57 = *(_QWORD *)a1;
            v58 = 1;
LABEL_374:
            v208 = tre_ast_new_literal(v57, -2, v58, -1);
            if (!v208)
              return 12;
            v5 = 0;
            goto LABEL_367;
          }
LABEL_304:
          if (v9 && (unint64_t)(v18 + 1) < v19 && *v18 == 92 && v18[1] == 69)
          {
            *(_DWORD *)(a1 + 84) &= ~v9;
            *(_QWORD *)(a1 + 24) = v18 + 2;
            if ((unint64_t)(v18 + 2) >= v19)
            {
              v208 = tre_ast_new_literal(*(_QWORD *)a1, -1, -1, -1);
              if (!v208)
                return 12;
              v5 = 0;
            }
            else
            {
              v122 = tre_stack_push_int(v2, 0);
              if (!(_DWORD)v122)
                v122 = tre_stack_push_int(v2, 1u);
              v5 = v122;
            }
            v9 = 0;
            goto LABEL_380;
          }
          v123 = *(_DWORD *)(a1 + 84);
          if ((v123 & 0x10) != 0)
          {
LABEL_328:
            if ((v123 & 2) == 0)
              goto LABEL_329;
            v127 = *v18;
            if (v127 > 0x7F)
            {
              v129 = *(_xlocale **)(a1 + 48);
              if (v127 >= 0x100)
              {
                v130 = ___runetype_l(v127, v129);
                v18 = *(int **)(a1 + 24);
                if (v130 < 0)
                  goto LABEL_352;
LABEL_342:
                v132 = *v18;
                v133 = &_DefaultRuneLocale;
                if (v132 > 0x7F)
                {
                  v134 = *(_xlocale **)(a1 + 48);
                  if (v132 >= 0x100)
                  {
                    v135 = ___runetype_l(v132, v134);
                    v18 = *(int **)(a1 + 24);
                    if ((v135 & 0x1000) != 0)
                    {
LABEL_352:
                      v137 = *(_QWORD *)a1;
                      v138 = *v18;
                      if (v138 > 0x7F)
                      {
                        v139 = ___toupper_l(v138, *(locale_t *)(a1 + 48));
                        LODWORD(v138) = **(_DWORD **)(a1 + 24);
                        if (v138 > 0x7F)
                        {
                          v140 = ___toupper_l(v138, *(locale_t *)(a1 + 48));
LABEL_357:
                          v141 = tre_ast_new_literal(v137, v139, v140, *(_DWORD *)(a1 + 68));
                          if (!v141)
                            return 12;
                          v142 = (uint64_t)v141;
                          v143 = v11;
                          v144 = *(_QWORD *)a1;
                          v145 = **(unsigned int **)(a1 + 24);
                          if (v145 > 0x7F)
                          {
                            v146 = ___tolower_l(v145, *(locale_t *)(a1 + 48));
                            LODWORD(v145) = **(_DWORD **)(a1 + 24);
                            if (v145 > 0x7F)
                            {
                              v147 = ___tolower_l(v145, *(locale_t *)(a1 + 48));
                              goto LABEL_363;
                            }
                          }
                          else
                          {
                            v146 = _DefaultRuneLocale.__maplower[v145];
                          }
                          v147 = _DefaultRuneLocale.__maplower[v145];
LABEL_363:
                          v148 = tre_ast_new_literal(v144, v146, v147, *(_DWORD *)(a1 + 68));
                          if (!v148)
                            return 12;
                          v208 = tre_ast_new_union(*(_QWORD *)a1, v142, (uint64_t)v148);
                          v11 = v143;
                          if (!v208)
                            return 12;
LABEL_365:
                          v5 = 0;
                          v117 = *(_DWORD *)(a1 + 68) + 1;
LABEL_366:
                          *(_DWORD *)(a1 + 68) = v117;
LABEL_367:
                          v40 = *(int **)(a1 + 24);
LABEL_368:
                          v52 = v40 + 1;
                          goto LABEL_369;
                        }
                      }
                      else
                      {
                        v139 = _DefaultRuneLocale.__mapupper[v138];
                      }
                      v140 = _DefaultRuneLocale.__mapupper[v138];
                      goto LABEL_357;
                    }
LABEL_329:
                    v208 = tre_ast_new_literal(*(_QWORD *)a1, *v18, *v18, *(_DWORD *)(a1 + 68));
                    if (!v208)
                      return 12;
                    goto LABEL_365;
                  }
                  v136 = &__global_locale;
                  if (v134 != (_xlocale *)-1)
                    v136 = *(_QWORD **)(a1 + 48);
                  if (!v134)
                    v136 = v11;
                  v133 = *(_RuneLocale **)(v136[166] + 120);
                }
                if ((v133->__runetype[v132] & 0x1000) != 0)
                  goto LABEL_352;
                goto LABEL_329;
              }
              v131 = &__global_locale;
              if (v129 != (_xlocale *)-1)
                v131 = *(_QWORD **)(a1 + 48);
              if (!v129)
                v131 = v11;
              v128 = *(_RuneLocale **)(v131[166] + 120);
            }
            else
            {
              v128 = &_DefaultRuneLocale;
            }
            if ((v128->__runetype[v127] & 0x8000) != 0)
              goto LABEL_352;
            goto LABEL_342;
          }
          if ((unint64_t)v18 >= v19)
          {
            if ((int)v10 <= 0)
              return 14;
            else
              return 8;
          }
          if ((v123 & 1) == 0)
          {
            if ((unint64_t)(v18 + 1) >= v19 || *v18 != 92 || v18[1] != 123)
              goto LABEL_328;
            v124 = 2;
            goto LABEL_322;
          }
          v125 = *v18;
          if (*v18 <= 122)
          {
            if ((v125 - 42) < 2 || v125 == 63)
              return 13;
            goto LABEL_328;
          }
          if (v125 == 123)
          {
            v124 = 1;
LABEL_322:
            *(_QWORD *)(a1 + 24) = &v18[v124];
            v126 = tre_parse_bound(a1, 0);
            if ((_DWORD)v126 != 1)
            {
              v5 = v126;
              if ((_DWORD)v126)
                return v5;
              return 13;
            }
            v18 = (int *)(*(_QWORD *)(a1 + 24) - 4);
            *(_QWORD *)(a1 + 24) = v18;
            v123 = *(_DWORD *)(a1 + 84);
            goto LABEL_328;
          }
          if (v125 != 124)
            goto LABEL_328;
          return 14;
        }
        if ((v20 & 1) != 0 || (v69 = v18 + 1, (unint64_t)(v18 + 1) >= v19))
        {
LABEL_181:
          v206 = v11;
          v71 = v18 + 1;
          if ((unint64_t)(v18 + 1) >= v19)
            return 5;
          if ((v20 & 0x100) == 0)
          {
            *(_QWORD *)(a1 + 24) = v71;
LABEL_184:
            if ((v20 & 0x101) == 1
              || (v72 = iswdigit_l(*v71, *(locale_t *)(a1 + 48)), v71 = *(int **)(a1 + 24), !v72)
              || (v73 = *v71 - 48, *v71 == 48))
            {
              v24 = tre_ast_new_literal(*(_QWORD *)a1, *v71, *v71, *(_DWORD *)(a1 + 68));
              v208 = v24;
              ++*(_DWORD *)(a1 + 68);
            }
            else
            {
              v24 = tre_ast_new_literal(*(_QWORD *)a1, -4, *v71 - 48, *(_DWORD *)(a1 + 68));
              v208 = v24;
              if (!v24)
                return 12;
              v163 = *(int32x2_t *)(a1 + 64);
              *((_DWORD *)v24 + 13) = v163.i32[0];
              *(int32x2_t *)(a1 + 64) = vadd_s32(v163, (int32x2_t)0x100000001);
              v164 = *(_DWORD *)(a1 + 72);
              v165 = *(_DWORD *)(a1 + 76) + 1;
              if (v73 > v164)
                v164 = v73;
              *(_DWORD *)(a1 + 72) = v164;
              *(_DWORD *)(a1 + 76) = v165;
            }
            v11 = v206;
            v25 = *(_QWORD *)(a1 + 24) + 4;
LABEL_189:
            *(_QWORD *)(a1 + 24) = v25;
            goto LABEL_190;
          }
          tre_expand_macro(v18 + 1, v19, __str);
          if (*(_DWORD *)__str)
          {
            v118 = *(_OWORD *)(a1 + 80);
            *((_OWORD *)&v214._mbstateL + 4) = *(_OWORD *)(a1 + 64);
            *((_OWORD *)&v214._mbstateL + 5) = v118;
            v119 = *(_OWORD *)(a1 + 112);
            *((_OWORD *)&v214._mbstateL + 6) = *(_OWORD *)(a1 + 96);
            *((_OWORD *)&v214._mbstateL + 7) = v119;
            v120 = *(_OWORD *)(a1 + 16);
            *(_OWORD *)v214.__mbstate8 = *(_OWORD *)a1;
            *((_OWORD *)&v214._mbstateL + 1) = v120;
            v121 = *(_OWORD *)(a1 + 48);
            *((_OWORD *)&v214._mbstateL + 2) = *(_OWORD *)(a1 + 32);
            *((_OWORD *)&v214._mbstateL + 3) = v121;
            *(&v214._mbstateL + 3) = (uint64_t)__str;
            *((_DWORD *)&v214._mbstateL + 14) = wcslen((const __int32 *)__str);
            *((_DWORD *)&v214._mbstateL + 22) = 1;
            v5 = tre_parse(&v214);
            if ((_DWORD)v5)
              return v5;
            *(_QWORD *)(a1 + 24) += 8;
            *(_DWORD *)(a1 + 68) = *((_DWORD *)&v214._mbstateL + 17);
            v208 = (char *)*(&v214._mbstateL + 2);
            goto LABEL_429;
          }
          v153 = *v71;
          if (*v71 == 81)
          {
            *(_DWORD *)(a1 + 84) = v20 | 0x10;
            v9 |= 0x10u;
            *(_QWORD *)(a1 + 24) = v18 + 2;
            v154 = tre_stack_push_int(v2, 0);
            if (!(_DWORD)v154)
              v154 = tre_stack_push_int(v2, 1u);
            goto LABEL_428;
          }
          *(_QWORD *)(a1 + 24) = v71;
          if (v153 <= 65)
          {
            if (v153 == 60)
            {
              v160 = *(_QWORD *)a1;
              v161 = 8;
            }
            else
            {
              if (v153 != 62)
                goto LABEL_184;
              v160 = *(_QWORD *)a1;
              v161 = 16;
            }
          }
          else
          {
            switch(v153)
            {
              case 'B':
                v160 = *(_QWORD *)a1;
                v161 = 64;
                break;
              case 'x':
                v71 = v18 + 2;
                v185 = v18[2];
                *(_QWORD *)(a1 + 24) = v18 + 2;
                if (v185 == 123 || (unint64_t)v71 >= v19)
                {
                  if ((unint64_t)v71 >= v19)
                    goto LABEL_184;
                  v193 = v18 + 3;
                  *(_QWORD *)(a1 + 24) = v18 + 3;
                  if ((uint64_t)(v19 - (_QWORD)(v18 + 3)) < 0)
                  {
                    LODWORD(v194) = 0;
                  }
                  else
                  {
                    v194 = 0;
                    do
                    {
                      if (v194 == 32)
                        return 9;
                      if (*v193 == 125)
                        break;
                      if (!iswxdigit_l(*v193, *(locale_t *)(a1 + 48)))
                        return 9;
                      v71 = *(int **)(a1 + 24);
                      v193 = v71 + 1;
                      __str[v194++] = *v71;
                      *(_QWORD *)(a1 + 24) = v71 + 1;
                    }
                    while ((uint64_t)(*(_QWORD *)(a1 + 40) - (_QWORD)(v71 + 1)) >= 0);
                  }
                  *(_QWORD *)(a1 + 24) = v71 + 2;
                  __str[v194] = 0;
                }
                else
                {
                  __str[2] = 0;
                  *(_WORD *)__str = 0;
                  v186 = iswxdigit_l(v185, *(locale_t *)(a1 + 48));
                  v187 = *(wint_t **)(a1 + 24);
                  if (v186 && (unint64_t)v187 < *(_QWORD *)(a1 + 40))
                  {
                    v188 = *v187++;
                    __str[0] = v188;
                    *(_QWORD *)(a1 + 24) = v187;
                  }
                  if (iswxdigit_l(*v187, *(locale_t *)(a1 + 48)))
                  {
                    v189 = *(_DWORD **)(a1 + 24);
                    if ((unint64_t)v189 < *(_QWORD *)(a1 + 40))
                    {
                      __str[1] = *v189;
                      *(_QWORD *)(a1 + 24) = v189 + 1;
                    }
                  }
                }
                v195 = strtol(__str, 0, 16);
                v24 = tre_ast_new_literal(*(_QWORD *)a1, v195, v195, *(_DWORD *)(a1 + 68));
                v208 = v24;
                ++*(_DWORD *)(a1 + 68);
LABEL_471:
                v11 = v206;
LABEL_190:
                if (!v24)
                  return 12;
LABEL_379:
                v5 = 0;
                goto LABEL_380;
              case 'b':
                v160 = *(_QWORD *)a1;
                v161 = 32;
                break;
              default:
                goto LABEL_184;
            }
          }
          v24 = tre_ast_new_literal(v160, -2, v161, -1);
          v208 = v24;
          *(_QWORD *)(a1 + 24) += 4;
          goto LABEL_471;
        }
        v70 = *v69;
        if (*v69 != 40)
        {
          if (v70 != 41)
          {
            if (v70 == 123)
              goto LABEL_304;
            goto LABEL_181;
          }
          *(_QWORD *)(a1 + 24) = v69;
          if (!(_DWORD)v10)
            return 8;
          goto LABEL_93;
        }
LABEL_289:
        *(_QWORD *)(a1 + 24) = v69 + 1;
        v14 = tre_stack_push_int(v2, v20);
        if (!(_DWORD)v14)
        {
          v14 = tre_stack_push_int(v2, *(_DWORD *)(a1 + 60));
          if (!(_DWORD)v14)
          {
            v14 = tre_stack_push_int(v2, 2u);
            if (!(_DWORD)v14)
            {
              v14 = tre_stack_push_int(v2, (*(_DWORD *)(a1 + 84) & 1) == 0);
              if (!(_DWORD)v14)
              {
                v5 = tre_stack_push_int(v2, 0);
                if (!(_DWORD)v5)
                {
                  ++*(_DWORD *)(a1 + 60);
                  v10 = (v10 + 1);
                }
                goto LABEL_380;
              }
            }
          }
        }
LABEL_293:
        v5 = v14;
        goto LABEL_380;
      }
      if (v21 == 46)
      {
        v61 = *(_QWORD *)a1;
        v62 = *(_DWORD *)(a1 + 68);
        if ((v20 & 8) != 0)
        {
          v114 = tre_ast_new_literal(v61, 0, 9, v62);
          if (!v114)
            return 12;
          v115 = (uint64_t)v114;
          v116 = tre_ast_new_literal(*(_QWORD *)a1, 11, 0x7FFFFFFF, *(_DWORD *)(a1 + 68) + 1);
          if (!v116)
            return 12;
          v208 = tre_ast_new_union(*(_QWORD *)a1, v115, (uint64_t)v116);
          if (!v208)
            return 12;
          v63 = 2;
        }
        else
        {
          v208 = tre_ast_new_literal(v61, 0, 0x7FFFFFFF, v62);
          if (!v208)
            return 12;
          v63 = 1;
        }
        v5 = 0;
        v117 = *(_DWORD *)(a1 + 68) + v63;
        goto LABEL_366;
      }
      if (v21 != 91)
        goto LABEL_304;
      *(_QWORD *)(a1 + 24) = v18 + 1;
      if ((uint64_t)(v19 - (_QWORD)(v18 + 1)) >= 21 && v18[1] == 91 && v18[2] == 58)
      {
        v22 = v18[3];
        if ((v22 | 2) == 0x3E && v18[4] == 58 && v18[5] == 93 && v18[6] == 93)
        {
          if (v22 == 60)
            v23 = 8;
          else
            v23 = 16;
          v24 = tre_ast_new_literal(*(_QWORD *)a1, -2, v23, -1);
          v208 = v24;
          v25 = *(_QWORD *)(a1 + 24) + 24;
          goto LABEL_189;
        }
      }
      v74 = malloc_type_calloc(1uLL, 0x108uLL, 0xFFF5826CuLL);
      v209 = v74;
      if (!v74)
        return 12;
      v75 = *(__int32 **)(a1 + 24);
      if (*v75 == 94)
      {
        v74[1] |= 1u;
        *(_QWORD *)(a1 + 24) = ++v75;
      }
      v76 = *(_QWORD *)(a1 + 40);
      v213 = 32;
      v207 = v11;
      if ((unint64_t)v75 >= v76)
      {
        v5 = 7;
LABEL_411:
        v158 = 0;
        v159 = v209;
        goto LABEL_412;
      }
      v204 = v10;
      v205 = 0;
      v77 = 0;
      *(_DWORD *)&v200[8] = 0;
      v201 = 0;
      ptr = 0;
      v211 = 0;
      v212 = 0;
      *(_QWORD *)v200 = v74[1];
      v78 = -1;
      v203 = v9;
      while (1)
      {
        v79 = *v75;
        if (*v75 == 93)
          break;
        if (v79 != 91)
        {
          if (v79 != 45)
          {
            v211 = *v75;
            goto LABEL_222;
          }
          if (v75 != *(__int32 **)(a1 + 24))
          {
            if (v78 >= 1)
            {
              v211 = 45;
              goto LABEL_223;
            }
            if ((unint64_t)(v75 + 1) >= v76)
              goto LABEL_406;
            if (v75[1] != 93)
            {
              if (v78 < 0)
                goto LABEL_472;
              v78 = 1;
              goto LABEL_251;
            }
            v79 = 45;
            v211 = 45;
            goto LABEL_244;
          }
          v78 = 0;
          v80 = 45;
          goto LABEL_239;
        }
        v81 = v75 + 1;
        if ((unint64_t)(v75 + 1) >= v76)
          goto LABEL_406;
        v82 = *v81;
        if (*v81 == 61 || v82 == 58)
        {
          if (v78 > 0)
            goto LABEL_472;
          if (!(v78 | v205))
          {
            v93 = v77;
            v94 = tre_new_item(1, v212, &v213, (int **)&v209);
            v77 = v93;
            if ((_DWORD)v94)
            {
LABEL_480:
              v5 = v94;
              goto LABEL_407;
            }
          }
          v95 = v75 + 2;
          if ((unint64_t)(v75 + 2) >= v76)
            goto LABEL_389;
          v96 = 0;
          v97 = 0;
          v98 = 0;
          while (1)
          {
            if (v75[v98 + 2] == v82)
            {
              v99 = &v75[v98 + 3];
              if ((unint64_t)v99 >= v76)
                goto LABEL_389;
              if (*v99 == 93)
                break;
            }
            ++v98;
            v97 += 0x100000000;
            --v96;
            if ((unint64_t)&v75[v98 + 2] >= v76)
              goto LABEL_389;
          }
          if (!v96)
          {
LABEL_389:
            if (v82 == 61)
              v5 = 3;
            else
              v5 = 4;
LABEL_407:
            v157 = ptr;
LABEL_408:
            if (v157)
              free(v157);
LABEL_410:
            v10 = v204;
            goto LABEL_411;
          }
          v101 = v77;
          v75 = (__int32 *)((char *)v75 + v98 * 4 + 12);
          if (v82 != 61)
          {
            v10 = v204;
            if (!v205)
            {
              v105 = v97 >> 32;
              if ((unint64_t)(v98 * 4 + 8) >= 0x108)
                v106 = 63;
              else
                v106 = v105;
              v107 = v95;
              v108 = v106;
              wcsncpy((__int32 *)__str, v107, v106);
              *(_DWORD *)&__str[4 * v108] = 0;
              v210 = (__int32 *)__str;
              memset(&v214, 0, sizeof(v214));
              v223[(int)wcsrtombs_l(v223, (const __int32 **)&v210, 0x40uLL, &v214, *(locale_t *)(a1 + 48))] = 0;
              v109 = wctype_l(v223, *(locale_t *)(a1 + 48));
              if (!v109)
              {
                v5 = 4;
                goto LABEL_407;
              }
              v103 = v109;
              v104 = 4;
LABEL_272:
              v94 = tre_new_item(v104, v103, &v213, (int **)&v209);
              if ((_DWORD)v94)
                goto LABEL_480;
            }
LABEL_273:
            v77 = v101 + 1;
            v78 = -1;
            goto LABEL_251;
          }
          v198 = (v98 * 4) >> 2;
          v102 = __collate_equiv_value(*(_QWORD *)(a1 + 48), v95, (v98 * 4) >> 2);
          v10 = v204;
          if (v102 > 0)
          {
            if (!v205)
            {
              v103 = v102;
              v104 = 5;
              goto LABEL_272;
            }
            goto LABEL_273;
          }
          v79 = tre_search_cnames(v95, v198);
          v211 = v79;
          if (v79 == -1)
            goto LABEL_398;
          v77 = v101;
          if (v205)
            goto LABEL_245;
          goto LABEL_249;
        }
        if (v82 != 46)
        {
          v79 = 91;
          v211 = 91;
          v10 = v204;
          goto LABEL_222;
        }
        v83 = v75 + 2;
        v10 = v204;
        if ((unint64_t)(v75 + 2) >= v76)
          goto LABEL_398;
        v84 = 0;
        v85 = 0;
        while (1)
        {
          if (v75[v85 + 2] == 46)
          {
            v86 = &v75[v85 + 3];
            if ((unint64_t)v86 >= v76)
              goto LABEL_398;
            if (*v86 == 93)
              break;
          }
          ++v85;
          --v84;
          if ((unint64_t)&v75[v85 + 2] >= v76)
            goto LABEL_398;
        }
        v199 = v77;
        if (!v84)
        {
LABEL_398:
          v5 = 3;
          goto LABEL_407;
        }
        v75 = (__int32 *)((char *)v75 + v85 * 4 + 12);
        v197 = v83;
        v79 = tre_search_cnames(v83, (v85 * 4) >> 2);
        v211 = v79;
        if (v79 != -1)
          goto LABEL_265;
        if ((int)__collate_equiv_value(*(_QWORD *)(a1 + 48), v197, (v85 * 4) >> 2) < 1)
          goto LABEL_398;
        if (v85 == 1)
        {
          v79 = *v197;
          v211 = *v197;
LABEL_265:
          v77 = v199;
LABEL_222:
          if (v78 >= 1)
          {
LABEL_223:
            v87 = v10;
            v88 = v77;
            v89 = __collate_equiv_value(*(_QWORD *)(a1 + 48), &v212, 1uLL);
            v90 = __collate_equiv_value(*(_QWORD *)(a1 + 48), &v211, 1uLL);
            if (v90 < v89)
            {
              v5 = 11;
LABEL_458:
              v157 = ptr;
              v9 = v203;
              goto LABEL_408;
            }
            if (!v205)
            {
              v91 = v90;
              v92 = tre_new_item(2, v89, &v213, (int **)&v209);
              if ((_DWORD)v92 || (v92 = tre_new_item(3, v91, &v213, (int **)&v209), (_DWORD)v92))
              {
                v5 = v92;
                goto LABEL_458;
              }
            }
            v78 = -1;
            v77 = v88;
            v10 = v87;
            v9 = v203;
            goto LABEL_250;
          }
LABEL_244:
          if (v205)
          {
LABEL_245:
            v78 = 0;
            goto LABEL_250;
          }
          if (!v78)
          {
            v100 = v77;
            v94 = tre_new_item(1, v212, &v213, (int **)&v209);
            if ((_DWORD)v94)
              goto LABEL_480;
            v79 = v211;
            v77 = v100;
          }
LABEL_249:
          v78 = 0;
          v212 = v79;
          goto LABEL_250;
        }
        if ((v200[0] & 1) != 0)
          goto LABEL_398;
        if (v78 > 0)
        {
LABEL_472:
          v5 = 11;
          goto LABEL_407;
        }
        v110 = *(_QWORD *)&v200[4];
        v111 = (uint64_t)v201;
        if (!v201)
        {
          ptr = (uint64_t *)malloc_type_malloc(0x120uLL, 0x1050040DB1D6C16uLL);
          if (!ptr)
            goto LABEL_500;
          v111 = (uint64_t)(ptr + 2);
          v110 = 16;
        }
        v112 = (int)v110;
        if ((int)v110 >= (v111 - (uint64_t)ptr) >> 4)
        {
          *(_QWORD *)&v200[4] = v110;
        }
        else
        {
          *(_QWORD *)&v200[4] = (2 * v110);
          v113 = (uint64_t *)malloc_type_realloc(ptr, 16 * (*(_DWORD *)&v200[4] + 2), 0x1050040DB1D6C16uLL);
          if (!v113)
          {
            free(ptr);
LABEL_500:
            v5 = 12;
            goto LABEL_410;
          }
          v111 = (uint64_t)&v113[2 * v112 + 2];
          ptr = v113;
        }
        *(_QWORD *)v111 = v197;
        *(_DWORD *)(v111 + 8) = (unint64_t)(v85 * 4) >> 2;
        v201 = (_QWORD *)(v111 + 16);
        v205 = 1;
        v78 = -1;
        v10 = v204;
        v77 = v199;
LABEL_251:
        if ((unint64_t)++v75 >= v76)
        {
LABEL_406:
          v5 = 7;
          goto LABEL_407;
        }
      }
      if (v75 == *(__int32 **)(a1 + 24))
      {
        v78 = 0;
        v80 = 93;
LABEL_239:
        v212 = v80;
LABEL_250:
        ++v77;
        goto LABEL_251;
      }
      if (!v205)
      {
        v157 = ptr;
        if (!v78)
        {
          v5 = tre_new_item(1, v212, &v213, (int **)&v209);
          if ((_DWORD)v5)
            goto LABEL_408;
        }
        *(_QWORD *)(a1 + 24) = v75 + 1;
        v10 = v204;
        goto LABEL_477;
      }
      v166 = ptr;
      if (!ptr)
      {
LABEL_477:
        v190 = tre_ast_new_literal(*(_QWORD *)a1, 0, 0x7FFFFFFF, *(_DWORD *)(a1 + 68));
        v158 = v190;
        v159 = v209;
        if (v190
          && (v191 = *(_QWORD *)v190,
              v192 = tre_mem_alloc_impl(*(_QWORD *)a1, 0, 0, 0, 8 * *(int *)v209 + 8),
              (*(_QWORD *)(v191 + 16) = v192) != 0))
        {
          _platform_memmove();
          v5 = 0;
        }
        else
        {
          v5 = 12;
        }
LABEL_412:
        free(v159);
        ++*(_DWORD *)(a1 + 68);
        v208 = v158;
LABEL_413:
        v11 = v207;
        goto LABEL_414;
      }
      *ptr = (uint64_t)(v75 + 1);
      *((_DWORD *)ptr + 2) = v77;
      *v201 = 0;
      v221 = 0u;
      v222 = 0u;
      v219 = 0u;
      v220 = 0u;
      v217 = 0u;
      v218 = 0u;
      *(_OWORD *)__str = 0u;
      v216 = 0u;
      free(v209);
      v167 = malloc_type_malloc(*ptr - *(_QWORD *)(a1 + 24) + 8, 0x100004052888210uLL);
      if (!v167)
      {
        free(ptr);
        v5 = 12;
        goto LABEL_413;
      }
      v168 = v10;
      v169 = v167;
      v170 = (char *)v167;
      if (*((int *)ptr + 2) >= 1)
      {
        *v167 = 91;
        v171 = v167 + 1;
        v172 = *(_QWORD *)(a1 + 24);
        v173 = ptr[2];
        if (v173)
        {
          v174 = ptr + 4;
          do
          {
            if (v173 - v172 >= 9)
            {
              v175 = v173 - v172 - 8;
              _platform_memmove();
              v171 = (_DWORD *)((char *)v171 + v175);
              v173 = *(v174 - 2);
            }
            v172 = v173 + 4 * *((int *)v174 - 2) + 8;
            v176 = *v174;
            v174 += 2;
            v173 = v176;
          }
          while (v176);
        }
        v166 = ptr;
        v177 = *ptr - v172;
        _platform_memmove();
        v178 = (_DWORD *)((char *)v171 + v177);
        *v178 = 124;
        v170 = (char *)(v178 + 1);
      }
      if (v166[2])
      {
        v179 = v166 + 4;
        do
        {
          _platform_memmove();
          v170 += 4 * *((int *)v179 - 2);
          if (*v179)
          {
            *(_DWORD *)v170 = 124;
            v170 += 4;
          }
          v180 = *v179;
          v179 += 2;
        }
        while (v180);
      }
      *(_DWORD *)v170 = 0;
      v181 = *(_OWORD *)(a1 + 80);
      v219 = *(_OWORD *)(a1 + 64);
      v220 = v181;
      v182 = *(_OWORD *)(a1 + 112);
      v221 = *(_OWORD *)(a1 + 96);
      v222 = v182;
      v183 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)__str = *(_OWORD *)a1;
      v216 = v183;
      v184 = *(_OWORD *)(a1 + 48);
      v217 = *(_OWORD *)(a1 + 32);
      v218 = v184;
      *((_QWORD *)&v216 + 1) = v169;
      DWORD2(v220) = 1;
      DWORD2(v218) = (unint64_t)(v170 - v169) >> 2;
      DWORD1(v220) |= 1u;
      v5 = tre_parse(__str);
      free(v169);
      if ((_DWORD)v5)
      {
        free(ptr);
      }
      else
      {
        *(_QWORD *)(a1 + 24) = *ptr;
        *(_DWORD *)(a1 + 68) = DWORD1(v219);
        free(ptr);
        v208 = (char *)v216;
      }
      v10 = v168;
      v11 = v207;
      v9 = v203;
LABEL_414:
      if (!(_DWORD)v5)
        goto LABEL_380;
      return v5;
    case 2u:
      v26 = tre_stack_pop_int((uint64_t)v2);
      *(_DWORD *)(a1 + 84) = tre_stack_pop_int((uint64_t)v2);
      v27 = v208;
      if (*((_DWORD *)v208 + 13) >> 30)
      {
        *((_DWORD *)v208 + 13) = v26;
        if (v26 > 0x3FFFFFFF)
          goto LABEL_379;
        v29 = *((_DWORD *)v27 + 14);
      }
      else
      {
        if (v26 > 0x3FFFFFFF)
          goto LABEL_379;
        v28 = tre_ast_new_literal(*(_QWORD *)a1, -1, -1, -1);
        if (!v28)
          return 12;
        v27 = tre_ast_new_catenation(*(_QWORD *)a1, (uint64_t)v28, (uint64_t)v208);
        if (!v27)
          return 12;
        v29 = *((_DWORD *)v208 + 14);
        v208 = v27;
        *((_DWORD *)v27 + 13) = v26;
        *((_DWORD *)v27 + 14) = v29;
      }
      v5 = 0;
      *((_DWORD *)v27 + 14) = v29 + 1;
      goto LABEL_380;
    case 3u:
      v30 = tre_stack_pop_int((uint64_t)v2);
      v14 = tre_stack_push_int(v2, 5u);
      if ((_DWORD)v14)
        goto LABEL_293;
      v31 = v2;
      v32 = v30;
      goto LABEL_41;
    case 4u:
      v33 = tre_stack_pop_int((uint64_t)v2);
      v14 = tre_stack_push_int(v2, 9u);
      if ((_DWORD)v14)
        goto LABEL_293;
      v14 = tre_stack_push_int(v2, v33);
      if ((_DWORD)v14)
        goto LABEL_293;
      v15 = v2;
      v16 = 1;
      goto LABEL_46;
    case 5u:
      v34 = *(int **)(a1 + 24);
      v35 = *(_QWORD *)(a1 + 40);
      if ((unint64_t)v34 >= v35)
        goto LABEL_379;
      v36 = *(_DWORD *)(a1 + 84);
      if ((v36 & 0x10) != 0)
        goto LABEL_130;
      v37 = *v34;
      if ((v36 & 1) != 0 && v37 == 124)
        goto LABEL_379;
      if ((*(_DWORD *)(a1 + 84) & 0x101) == 0x100 && (unint64_t)(v34 + 1) < v35 && v37 == 92)
      {
        if (v34[1] == 124)
          goto LABEL_379;
      }
      else if ((v36 & 1) != 0 && v37 == 41 && (int)v10 > 0)
      {
        goto LABEL_109;
      }
      if ((v36 & 1) != 0 || (unint64_t)(v34 + 1) >= v35 || v37 != 92 || v34[1] != 41)
      {
LABEL_130:
        v14 = tre_stack_push_voidptr(v2, v208);
        if (!(_DWORD)v14)
        {
          v14 = tre_stack_push_int(v2, 6u);
          if (!(_DWORD)v14)
          {
            v14 = tre_stack_push_int(v2, 5u);
            if (!(_DWORD)v14)
            {
              v31 = v2;
              v32 = 0;
LABEL_41:
              v14 = tre_stack_push_int(v31, v32);
              if (!(_DWORD)v14)
              {
                v15 = v2;
                v16 = 4;
LABEL_46:
                v14 = tre_stack_push_int(v15, v16);
              }
            }
          }
        }
        goto LABEL_293;
      }
      if (!(_DWORD)v10)
        return 8;
LABEL_109:
      v10 = (v10 - 1);
      if ((v36 & 0x101) != 0)
        goto LABEL_379;
      v5 = 0;
      v52 = v34 + 2;
LABEL_369:
      *(_QWORD *)(a1 + 24) = v52;
      goto LABEL_380;
    case 6u:
      v38 = tre_stack_pop_voidptr((uint64_t)v2);
      v39 = tre_ast_new_catenation(*(_QWORD *)a1, v38, (uint64_t)v208);
      if (!v39)
        return 12;
      goto LABEL_77;
    case 7u:
      v40 = *(int **)(a1 + 24);
      v41 = *(_QWORD *)(a1 + 40);
      if ((unint64_t)v40 >= v41)
        goto LABEL_379;
      v42 = *(_DWORD *)(a1 + 84);
      if ((v42 & 0x10) != 0)
        goto LABEL_379;
      if ((v42 & 1) != 0)
        goto LABEL_66;
      v43 = *v40++;
      if (v43 != 92 || (unint64_t)v40 >= v41)
        goto LABEL_379;
      *(_QWORD *)(a1 + 24) = v40;
LABEL_66:
      if (*v40 == 41)
      {
        v5 = 0;
        goto LABEL_368;
      }
      if (*v40 != 124)
      {
        if ((v42 & 1) != 0)
          goto LABEL_379;
        v5 = 0;
        goto LABEL_141;
      }
      v14 = tre_stack_push_int(v2, 7u);
      if ((_DWORD)v14)
        goto LABEL_293;
      v14 = tre_stack_push_voidptr(v2, *(_QWORD *)(a1 + 24));
      if ((_DWORD)v14)
        goto LABEL_293;
      v14 = tre_stack_push_voidptr(v2, v208);
      if ((_DWORD)v14)
        goto LABEL_293;
      v14 = tre_stack_push_int(v2, 8u);
      if ((_DWORD)v14)
        goto LABEL_293;
      v14 = tre_stack_push_int(v2, (*(_DWORD *)(a1 + 84) & 0x101) == 256);
      if ((_DWORD)v14)
        goto LABEL_293;
      v5 = tre_stack_push_int(v2, 3u);
      if ((_DWORD)v5)
        goto LABEL_380;
      goto LABEL_367;
    case 8u:
      v45 = tre_stack_pop_voidptr((uint64_t)v2);
      if (tre_stack_pop_voidptr((uint64_t)v2) == *(_QWORD *)(a1 + 24) - 4)
        return 14;
      v39 = tre_ast_new_union(*(_QWORD *)a1, v45, (uint64_t)v208);
      if (!v39)
        return 12;
LABEL_77:
      v5 = 0;
      v208 = v39;
      goto LABEL_380;
    case 9u:
      v46 = *(int **)(a1 + 24);
      v47 = *(_QWORD *)(a1 + 40);
      if ((unint64_t)v46 >= v47)
        goto LABEL_379;
      v48 = *(_DWORD *)(a1 + 84);
      if ((v48 & 0x10) != 0)
        goto LABEL_379;
      v5 = 0;
      v49 = *v46;
      if (*v46 <= 62)
      {
        if (v49 != 42)
        {
          if (v49 != 43)
            goto LABEL_380;
LABEL_98:
          if ((v48 & 1) == 0)
            goto LABEL_379;
        }
LABEL_99:
        v50 = v208;
        if (!*((_DWORD *)v208 + 12) && (*((_DWORD *)v208 + 13) & 0x80000000) != 0 && **(_DWORD **)v208 == -2)
        {
          if ((v48 & 1) != 0)
            return 13;
          goto LABEL_379;
        }
        v53 = (v48 >> 6) & 1;
        v54 = v49 == 43;
        if (v49 == 63)
          v55 = 1;
        else
          v55 = -1;
        v56 = v46 + 1;
        if ((v48 & 1) != 0)
        {
          if ((unint64_t)v56 < v47)
          {
            if (*v56 == 63)
            {
              if ((v48 & 0x100) == 0)
                return 13;
              v53 = (v48 & 0x40) == 0;
              ++v46;
            }
            else if ((*v56 - 42) < 2)
            {
              return 13;
            }
          }
        }
        else if ((unint64_t)v56 < v47 && *v56 == 42
               || (unint64_t)(v46 + 2) < v47 && *v56 == 92 && v46[2] == 43)
        {
          return 13;
        }
        if (v53)
          ++*(_DWORD *)(a1 + 76);
        *(_QWORD *)(a1 + 24) = v46 + 1;
        v151 = tre_ast_new_iter(*(_QWORD *)a1, (uint64_t)v50, v54, v55, v53);
        if (v151)
        {
          v5 = 0;
          v208 = v151;
          v152 = *(_DWORD *)(a1 + 64);
          *(_DWORD *)(a1 + 64) = v152 + 1;
          *((_DWORD *)v151 + 13) = v152;
          goto LABEL_380;
        }
        return 12;
      }
      switch(v49)
      {
        case '{':
          if ((v48 & 1) == 0)
            goto LABEL_379;
          break;
        case '\\':
          if ((v48 & 1) != 0)
            goto LABEL_379;
          if ((unint64_t)++v46 >= v47)
            goto LABEL_379;
          v49 = *v46;
          if (*v46 == 43)
            goto LABEL_147;
          if (v49 != 123)
          {
            if (v49 != 63)
              goto LABEL_379;
LABEL_147:
            if ((v48 & 0x100) == 0)
              goto LABEL_379;
            *(_QWORD *)(a1 + 24) = v46;
            goto LABEL_99;
          }
          break;
        case '?':
          goto LABEL_98;
        default:
          goto LABEL_380;
      }
      v59 = !*((_DWORD *)v208 + 12) && (*((_DWORD *)v208 + 13) & 0x80000000) != 0 && **(_DWORD **)v208 == -2;
      *(_QWORD *)(a1 + 24) = v46 + 1;
      v60 = tre_parse_bound(a1, (uint64_t *)&v208);
      if (!(_DWORD)v60)
      {
        if (v59)
          return 13;
        v149 = v208;
        if (*((_DWORD *)v208 + 12) == 2)
        {
          v5 = 0;
          v150 = *(_DWORD *)(a1 + 64);
          *(_DWORD *)(a1 + 64) = v150 + 1;
          *((_DWORD *)v149 + 13) = v150;
          goto LABEL_380;
        }
        goto LABEL_379;
      }
      v5 = v60;
      if ((_DWORD)v60 != 1)
        return v5;
LABEL_140:
      v5 = 0;
      v40 = *(int **)(a1 + 24);
LABEL_141:
      v52 = v40 - 1;
      goto LABEL_369;
    default:
      goto LABEL_379;
  }
}

uint64_t tre_parse_bound(uint64_t a1, uint64_t *a2)
{
  _DWORD *v2;
  unsigned int v3;
  unint64_t v4;
  int v7;
  int v8;
  _DWORD *v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  BOOL v13;
  unsigned int v14;
  uint64_t result;
  _DWORD *v16;
  char *v17;

  v2 = *(_DWORD **)(a1 + 24);
  v3 = *(_DWORD *)(a1 + 84);
  v4 = *(_QWORD *)(a1 + 40);
  if ((unint64_t)v2 >= v4)
  {
    v13 = (*(_DWORD *)(a1 + 84) & 1) == 0;
    v14 = 9;
    goto LABEL_14;
  }
  if ((*v2 - 48) > 9)
  {
    v13 = (*(_DWORD *)(a1 + 84) & 1) == 0;
    v14 = 10;
LABEL_14:
    if (v13)
      return v14;
    else
      return 1;
  }
  v7 = (v3 >> 6) & 1;
  v8 = -1;
  v9 = *(_DWORD **)(a1 + 24);
  do
  {
    v10 = *v9 - 48;
    if (v10 > 9)
      break;
    v8 = v10 + 10 * (v8 & ~(v8 >> 31));
    ++v9;
  }
  while ((unint64_t)v9 < v4);
  if ((unint64_t)v9 < v4 && *v9 == 44)
  {
    ++v9;
    v11 = -1;
    if ((unint64_t)v9 >= v4)
      goto LABEL_24;
    do
    {
      v12 = *v9 - 48;
      if (v12 > 9)
        break;
      v11 = v12 + 10 * (v11 & ~(v11 >> 31));
      ++v9;
    }
    while ((unint64_t)v9 < v4);
  }
  else
  {
    v11 = v8;
  }
  if ((v11 & 0x80000000) == 0)
  {
    result = 10;
    if (v11 > 0xFF || v8 > 255 || v8 > v11)
      return result;
    goto LABEL_25;
  }
LABEL_24:
  if (v8 > 255)
    return 10;
LABEL_25:
  if ((unint64_t)v9 >= v4)
    return 9;
  if (v9 == v2)
    return 10;
  if ((v3 & 1) == 0)
  {
    if ((unint64_t)(v9 + 1) < v4 && *v9 == 92 && v9[1] == 125)
    {
      v16 = v9 + 2;
      if ((unint64_t)(v9 + 2) >= v4 || *v16 != 42)
        goto LABEL_43;
      return 13;
    }
    return 10;
  }
  if (*v9 != 125)
    return 10;
  v16 = v9 + 1;
  if ((unint64_t)(v9 + 1) < v4)
  {
    if ((*v16 - 42) < 2)
      return 13;
    if (*v16 == 63)
    {
      if ((v3 & 0x100) == 0)
        return 13;
      v7 = (v3 & 0x40) == 0;
      v16 = v9 + 2;
    }
  }
LABEL_43:
  if (v7)
    ++*(_DWORD *)(a1 + 76);
  if (a2)
  {
    v17 = tre_ast_new_iter(*(_QWORD *)a1, *a2, v8, v11, v7);
    *a2 = (uint64_t)v17;
    if (!v17)
      return 12;
  }
  result = 0;
  *(_QWORD *)(a1 + 24) = v16;
  return result;
}

_DWORD *tre_expand_macro(_DWORD *result, unint64_t a2, _DWORD *a3)
{
  uint64_t v3;
  _BYTE *v4;
  int v5;
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;

  *a3 = 0;
  if ((unint64_t)result < a2)
  {
    v3 = 0;
    while (*result != tre_macros[v3])
    {
      v3 += 16;
      if (v3 == 192)
        return result;
    }
    v4 = *(_BYTE **)&tre_macros[v3 + 8];
    LOBYTE(v5) = *v4;
    if (*v4)
    {
      v6 = 0;
      v7 = v4 + 1;
      do
      {
        a3[v6] = (char)v5;
        v8 = v6 + 1;
        if (v6 > 0x3E)
          break;
        v5 = v7[v6++];
      }
      while (v5);
    }
    else
    {
      v8 = 0;
    }
    a3[v8] = 0;
  }
  return result;
}

uint64_t tre_search_cnames(__int32 *a1, size_t a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  const __int32 *v7;
  int v8;

  v4 = 0;
  v5 = 95;
  while (1)
  {
    v6 = (v5 + v4) >> 1;
    v7 = (const __int32 *)*(&cnames + 2 * v6);
    v8 = wcsncmp(a1, v7, a2);
    if (!v8 && !v7[a2])
      break;
    if (v8 <= 0)
      v5 = v6 - 1;
    else
      v4 = v6 + 1;
    if (v4 > v5)
      return 0xFFFFFFFFLL;
  }
  return *((unsigned int *)&cnames + 4 * v6 + 2);
}

uint64_t tre_new_item(int a1, int a2, int *a3, int **a4)
{
  _DWORD *v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v11;
  _DWORD *v12;

  v6 = *a4;
  v7 = **a4;
  v8 = *a3;
  if (v7 >= (int)v8)
  {
    if ((int)v8 > 1023)
      return 12;
    *a3 = 2 * v8;
    v6 = malloc_type_realloc(v6, (16 * v8) | 8, 0x681DC935uLL);
    if (!v6)
      return 12;
    *a4 = v6;
    v9 = *v6;
  }
  else
  {
    v9 = **a4;
  }
  v11 = 0;
  v12 = &v6[2 * v7];
  v12[2] = a1;
  v12[3] = a2;
  *v6 = v9 + 1;
  return v11;
}

_QWORD *tre_stack_new(int a1, int a2, int a3)
{
  _QWORD *v6;
  void *v7;

  v6 = malloc_type_malloc(0x18uLL, 0x10200403ED2C137uLL);
  if (v6)
  {
    v7 = malloc_type_malloc(8 * a1, 0x108204023715A0EuLL);
    v6[2] = v7;
    if (v7)
    {
      *(_DWORD *)v6 = a1;
      *((_DWORD *)v6 + 1) = a2;
      *((_DWORD *)v6 + 2) = a3;
      *((_DWORD *)v6 + 3) = 0;
    }
    else
    {
      free(v6);
      return 0;
    }
  }
  return v6;
}

void tre_stack_destroy(void **a1)
{
  free(a1[2]);
  free(a1);
}

uint64_t tre_stack_num_objects(uint64_t a1)
{
  return *(unsigned int *)(a1 + 12);
}

uint64_t tre_stack_push_int(int *a1, unsigned int a2)
{
  return tre_stack_push(a1, a2);
}

uint64_t tre_stack_push(int *a1, uint64_t a2)
{
  int v4;
  int v5;
  BOOL v6;
  int v7;
  char v8;
  _QWORD *v9;
  unsigned int v10;

  v4 = a1[3];
  v5 = *a1;
  v6 = v4 >= *a1;
  if (v4 < *a1)
  {
    v9 = (_QWORD *)*((_QWORD *)a1 + 2);
LABEL_12:
    v10 = 0;
    v9[v4] = a2;
    ++a1[3];
    v8 = v6;
  }
  else
  {
    v7 = a1[1];
    if (v5 >= v7)
    {
      v8 = 0;
    }
    else
    {
      v8 = 0;
      do
      {
        if (a1[2] + v5 >= v7)
          v5 = v7;
        else
          v5 += a1[2];
        v9 = malloc_type_realloc(*((void **)a1 + 2), 8 * v5, 0x108204023715A0EuLL);
        if (!v9)
          break;
        *a1 = v5;
        *((_QWORD *)a1 + 2) = v9;
        v4 = a1[3];
        if (v4 < v5)
          goto LABEL_12;
        v7 = a1[1];
        v8 = 1;
      }
      while (v5 < v7);
    }
    v10 = 12;
  }
  if ((v8 & 1) != 0)
    return 0;
  else
    return v10;
}

uint64_t tre_stack_pop_int(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = *(int *)(a1 + 12) - 1;
  *(_DWORD *)(a1 + 12) = v2;
  return *(unsigned int *)(v1 + 8 * v2);
}

uint64_t tre_stack_pop_voidptr(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = *(int *)(a1 + 12) - 1;
  *(_DWORD *)(a1 + 12) = v2;
  return *(_QWORD *)(v1 + 8 * v2);
}

int creat(const char *a1, mode_t a2)
{
  return __open();
}

int sigpause(int a1)
{
  sigset_t v3;

  if (!*MEMORY[0x1E0C88C20])
    *MEMORY[0x1E0C88C20] = 1;
  v3 = 0;
  pthread_testcancel();
  if ((a1 - 32) > 0xFFFFFFE0)
  {
    if ((sigprocmask(1, 0, &v3) & 0x80000000) == 0)
    {
      v3 &= ~(1 << (a1 - 1));
      return sigsuspend_NOCANCEL();
    }
  }
  else
  {
    *__error() = 22;
  }
  return -1;
}

int lockf(int a1, int a2, off_t a3)
{
  int result;
  int *v4;
  int v5;

  switch(a2)
  {
    case 0:
    case 1:
    case 2:
      result = __fcntl();
      break;
    case 3:
      result = __fcntl();
      if (result != -1)
      {
        if (getpid())
        {
          v4 = __error();
          v5 = 35;
          goto LABEL_4;
        }
        result = 0;
      }
      break;
    default:
      v4 = __error();
      v5 = 22;
LABEL_4:
      *v4 = v5;
      result = -1;
      break;
  }
  return result;
}

int pause(void)
{
  sigset_t v1;

  v1 = 0;
  sigprocmask(0, 0, &v1);
  return sigsuspend(&v1);
}

unsigned int sleep(unsigned int a1)
{
  unsigned int v1;
  timespec v3;
  timespec __rqtp;

  v1 = a1;
  if ((a1 & 0x80000000) != 0)
    return a1 - 0x7FFFFFFF + sleep(0x7FFFFFFFu);
  v3.tv_sec = 0;
  v3.tv_nsec = 0;
  __rqtp.tv_sec = a1;
  __rqtp.tv_nsec = 0;
  if (nanosleep(&__rqtp, &v3) != -1)
    return 0;
  if (*__error() == 4)
  {
    if (v3.tv_nsec)
      return LODWORD(v3.tv_sec) + 1;
    else
      return v3.tv_sec;
  }
  return v1;
}

int tcdrain(int a1)
{
  pthread_testcancel();
  return ioctl(a1, 0x2000745EuLL, 0);
}

pid_t wait(int *a1)
{
  return __wait4();
}

int system(const char *a1)
{
  int v2;
  __int16 v4;
  sigset_t v5;
  char ***v6;
  int v7;
  pid_t v8;
  pid_t v9;
  posix_spawnattr_t v10;
  sigset_t v11;
  sigset_t v12[2];
  sigaction v13;
  sigaction v14;
  sigaction v15;
  pid_t v16[2];
  char *__argv[4];

  __argv[0] = "sh";
  __argv[1] = "-c";
  __argv[2] = (char *)a1;
  __argv[3] = 0;
  if (!*MEMORY[0x1E0C88C20])
    *MEMORY[0x1E0C88C20] = 1;
  pthread_testcancel();
  if (!a1)
    return 0;
  *(_QWORD *)v16 = 0;
  v15.__sigaction_u.__sa_handler = 0;
  *(_QWORD *)&v15.sa_mask = 0;
  v14.__sigaction_u.__sa_handler = 0;
  *(_QWORD *)&v14.sa_mask = 0;
  v13.__sigaction_u.__sa_handler = 0;
  *(_QWORD *)&v13.sa_mask = 0;
  *(_QWORD *)v12 = 0;
  v10 = 0;
  v2 = posix_spawnattr_init(&v10);
  if (v2)
  {
    *__error() = v2;
    return -1;
  }
  v11 = 0;
  pthread_mutex_lock(&__systemfn_mutex_0);
  v15.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  *(_QWORD *)&v15.sa_mask = 0;
  sigaction(2, &v15, &v14);
  if (v14.__sigaction_u.__sa_handler == (void (__cdecl *)(int))1)
  {
    v4 = 8;
    v5 = 4;
  }
  else
  {
    v11 = 2;
    v4 = 12;
    v5 = 6;
  }
  sigaction(3, &v15, &v13);
  if (v13.__sigaction_u.__sa_handler != (void (__cdecl *)(int))1)
  {
    v11 = v5;
    v4 = 12;
  }
  v12[1] = 0x80000;
  sigprocmask(1, &v12[1], v12);
  posix_spawnattr_setsigmask(&v10, v12);
  if ((v4 & 4) != 0)
    posix_spawnattr_setsigdefault(&v10, &v11);
  posix_spawnattr_setflags(&v10, v4);
  v6 = _NSGetEnviron();
  v7 = posix_spawn(&v16[1], "/bin/sh", 0, &v10, __argv, *v6);
  posix_spawnattr_destroy(&v10);
  if (v7 == 35 || v7 == 12)
  {
    v9 = -1;
  }
  else
  {
    if (!v7)
    {
      v8 = v16[1];
      while (1)
      {
        v16[1] = wait4(v8, v16, 0, 0);
        if (v16[1] != -1)
          goto LABEL_25;
        if (*__error() != 4)
        {
          v9 = v16[1];
          if (v16[1] != -1)
            goto LABEL_25;
          goto LABEL_24;
        }
      }
    }
    v9 = 32512;
  }
LABEL_24:
  v16[0] = v9;
LABEL_25:
  sigaction(2, &v14, 0);
  sigaction(3, &v13, 0);
  sigprocmask(3, v12, 0);
  pthread_mutex_unlock(&__systemfn_mutex_0);
  return v16[0];
}

FILE *popen_DARWIN_EXTSN(unint64_t a1, char *a2)
{
  int v4;
  int v5;
  FILE *v6;
  _QWORD *v7;
  _QWORD *v8;
  int v9;
  int v10;
  uint64_t i;
  char ***v13;
  int v14;
  int v16;
  posix_spawn_file_actions_t v17;
  pid_t v18;
  char *__argv[2];
  __int128 v20;
  int v21;
  int v22;

  if (off_1EDF54E10)
  {
    off_1EDF54E10(a1);
    if (off_1EDF54E10)
      off_1EDF54E10(a2);
  }
  v18 = 0;
  *(_OWORD *)__argv = 0u;
  v20 = 0u;
  v17 = 0;
  if (!a2)
    goto LABEL_9;
  v4 = _platform_strcmp();
  if (!v4)
  {
    if ((socketpair(1, 1, 0, &v21) & 0x80000000) == 0)
    {
      a2 = "r+";
      goto LABEL_13;
    }
    return 0;
  }
  v5 = *a2;
  if (v5 != 119 && v5 != 114 || a2[1])
  {
LABEL_9:
    v6 = 0;
    *__error() = 22;
    return v6;
  }
  if (pipe(&v21) < 0)
    return 0;
LABEL_13:
  if (*a2 == 114)
  {
    v6 = (FILE *)fdopen_DARWIN_EXTSN(v21, a2);
    if (v6)
      goto LABEL_15;
LABEL_19:
    close_NOCANCEL();
    close_NOCANCEL();
    return v6;
  }
  v6 = (FILE *)fdopen_DARWIN_EXTSN(v22, a2);
  if (!v6)
    goto LABEL_19;
LABEL_15:
  v7 = malloc_type_malloc(0x18uLL, 0x102004062D53EE8uLL);
  if (!v7)
  {
    fclose(v6);
    close_NOCANCEL();
    return 0;
  }
  v8 = v7;
  v9 = posix_spawn_file_actions_init(&v17);
  if (v9)
  {
    v10 = v9;
    fclose(v6);
    close_NOCANCEL();
    free(v8);
    v6 = 0;
    *__error() = v10;
  }
  else
  {
    if (*a2 == 114)
    {
      posix_spawn_file_actions_addclose(&v17, v21);
      if (v22 != 1)
      {
        posix_spawn_file_actions_adddup2(&v17, v22, 1);
        posix_spawn_file_actions_addclose(&v17, v22);
      }
      if (!v4)
        posix_spawn_file_actions_adddup2(&v17, 1, 0);
    }
    else
    {
      if (v21)
      {
        posix_spawn_file_actions_adddup2(&v17, v21, 0);
        posix_spawn_file_actions_addclose(&v17, v21);
      }
      posix_spawn_file_actions_addclose(&v17, v22);
    }
    pthread_mutex_lock(&__popen_pidlist_mutex);
    for (i = __popen_pidlist; i; i = *(_QWORD *)i)
      posix_spawn_file_actions_addclose(&v17, *(_DWORD *)(i + 16));
    __argv[0] = "sh";
    __argv[1] = "-c";
    v20 = a1;
    v13 = _NSGetEnviron();
    v14 = posix_spawn(&v18, "/bin/sh", &v17, 0, __argv, *v13);
    pthread_mutex_unlock(&__popen_pidlist_mutex);
    posix_spawn_file_actions_destroy(&v17);
    if (v14)
    {
      if (v14 == 35 || v14 == 12)
      {
        fclose(v6);
        close_NOCANCEL();
        free(v8);
        v6 = 0;
        *__error() = v14;
        return v6;
      }
      v18 = -1;
    }
    if (*a2 == 114)
      v16 = v21;
    else
      v16 = v22;
    *((_DWORD *)v8 + 4) = v16;
    close_NOCANCEL();
    v8[1] = v6;
    *((_DWORD *)v8 + 5) = v18;
    pthread_mutex_lock(&__popen_pidlist_mutex);
    *v8 = __popen_pidlist;
    __popen_pidlist = (uint64_t)v8;
    pthread_mutex_unlock(&__popen_pidlist_mutex);
    fwide(v6, -1);
  }
  return v6;
}

uint64_t fdopen_DARWIN_EXTSN(int a1, char *a2)
{
  int *v4;
  uint64_t result;
  int v6;
  int v7;
  __int16 v8;
  int v9;
  char v10;
  int v11;

  if (off_1EDF54E10)
    off_1EDF54E10(a2);
  v11 = 0;
  if (a1 >= 0x8000)
  {
    v4 = __error();
    result = 0;
    v6 = 24;
LABEL_5:
    *v4 = v6;
    return result;
  }
  v7 = __sflags(a2, &v11);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = fcntl_NOCANCEL();
  if (v9 < 0)
    return 0;
  v10 = v9;
  if ((v9 & 3) != 2 && (v9 & 3) != (v11 & 3))
  {
    v4 = __error();
    result = 0;
    v6 = 22;
    goto LABEL_5;
  }
  result = __sfp(0);
  if (result)
  {
    *(_WORD *)(result + 16) = v8;
    if ((v10 & 8) == 0 && (v11 & 8) != 0)
      *(_WORD *)(result + 16) = v8 | 0x100;
    *(_WORD *)(result + 18) = a1;
    *(_QWORD *)(result + 80) = __swrite;
    *(_QWORD *)(result + 64) = __sread;
    *(_QWORD *)(result + 72) = __sseek;
    *(_QWORD *)(result + 48) = result;
    *(_QWORD *)(result + 56) = __sclose;
  }
  return result;
}

uint64_t fopen_DARWIN_EXTSN(uint64_t a1, char *a2)
{
  int v3;
  __int16 v4;
  uint64_t v5;
  unsigned int v6;
  int v8;

  if (off_1EDF54E10)
  {
    off_1EDF54E10(a1);
    if (off_1EDF54E10)
      off_1EDF54E10(a2);
  }
  v8 = 0;
  v3 = __sflags(a2, &v8);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = __sfp(0);
  if (!v5)
    return v5;
  v6 = open_NOCANCEL();
  if ((v6 & 0x80000000) != 0)
  {
    __sfprelease(v5);
    return 0;
  }
  if (v6 < 0x8000)
  {
    *(_WORD *)(v5 + 18) = v6;
    *(_WORD *)(v5 + 16) = v4;
    *(_QWORD *)(v5 + 80) = __swrite;
    *(_QWORD *)(v5 + 64) = __sread;
    *(_QWORD *)(v5 + 72) = __sseek;
    *(_QWORD *)(v5 + 48) = v5;
    *(_QWORD *)(v5 + 56) = __sclose;
    if ((v8 & 8) != 0)
      _sseek(v5, 0, 2);
  }
  else
  {
    *(_WORD *)(v5 + 16) = 0;
    close_NOCANCEL();
    v5 = 0;
    *__error() = 24;
  }
  return v5;
}

uint64_t getgroups_DARWIN_EXTSN(unsigned int a1, uint64_t a2)
{
  uid_t v4;
  passwd *v5;
  uint64_t result;
  unsigned int v7;

  v4 = getuid();
  v5 = getpwuid(v4);
  if (v5)
  {
    if (a1)
    {
      v7 = a1;
      if ((MEMORY[0x18D767AF0](v5->pw_name, v5->pw_gid, a2, &v7) & 0x80000000) == 0)
        return v7;
    }
    else
    {
      result = getgroupcount();
      if ((_DWORD)result)
        return result;
    }
  }
  *__error() = 22;
  return 0xFFFFFFFFLL;
}

void __chk_fail_overflow()
{
  _os_crash((uint64_t)"detected buffer overflow");
  __break(1u);
}

void __chk_fail_overlap()
{
  _os_crash((uint64_t)"detected source and destination buffer overlap");
  __break(1u);
}

unint64_t __strncat_chk(unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = _platform_strlen();
  v8 = _platform_strnlen();
  v9 = v8 + v7;
  v10 = v8 + v7 + 1;
  if (v10 > a4)
    __chk_fail_overflow();
  if (__chk_assert_no_overlap)
    __chk_overlap(a1, v10, a2, v8 + 1);
  _platform_memmove();
  *(_BYTE *)(a1 + v9) = 0;
  return a1;
}

uint64_t __memccpy_chk(unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a5 < a4)
    __chk_fail_overflow();
  v8 = _platform_memccpy();
  v9 = v8;
  if (v8)
    v10 = v8 - a1;
  else
    v10 = a4;
  __chk_overlap(a1, v10, a2, v10);
  return v9;
}

uint64_t __snprintf_object_size_chk(char *a1, size_t a2, size_t __size, char *__format, ...)
{
  va_list va;

  va_start(va, __format);
  if (a2 < __size)
    __chk_fail_overflow();
  return vsnprintf(a1, __size, __format, va);
}

unint64_t __strcat_chk(unint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = _platform_strlen();
  v7 = _platform_strlen() + 1;
  if (v7 + v6 > a3)
    __chk_fail_overflow();
  if (__chk_assert_no_overlap)
    __chk_overlap(a1, v7 + v6, a2, v7);
  _platform_memmove();
  return a1;
}

int __vsprintf_chk(char *a1, int a2, size_t a3, const char *a4, va_list a5)
{
  int result;

  if (a3 >> 31)
    return vsprintf(a1, a4, a5);
  result = vsnprintf(a1, a3, a4, a5);
  if ((result & 0x80000000) == 0 && result >= a3)
    __chk_fail_overflow();
  return result;
}

uint64_t __sprintf_object_size_chk(char *a1, size_t a2, char *a3, ...)
{
  uint64_t result;
  va_list va;

  va_start(va, a3);
  if (a2 >> 31)
    return vsprintf(a1, a3, va);
  result = vsnprintf(a1, a2, a3, va);
  if ((result & 0x80000000) == 0 && (int)result >= a2)
    __chk_fail_overflow();
  return result;
}

char *__stpncpy_chk(char *a1, const char *a2, size_t a3, size_t a4)
{
  char *v7;
  char *v8;
  uint64_t v9;

  if (a4 < a3)
    __chk_fail_overflow();
  v7 = stpncpy(a1, a2, a3);
  v8 = v7;
  if (__chk_assert_no_overlap)
  {
    if (v7 - a1 == a3)
      v9 = v7 - a1;
    else
      v9 = v7 - a1 + 1;
    __chk_overlap((unint64_t)a1, v9, (unint64_t)a2, v9);
  }
  return v8;
}

int __vsnprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, va_list a6)
{
  if (a4 < a2)
    __chk_fail_overflow();
  return vsnprintf(a1, a2, a5, a6);
}

void _ffpp_strtoencf32_l_cold_1()
{
  __assert_rtn("_ffpp_strtoencf32_l", "strtofp.c", 2901, "normalizeDigits <= 4 || info.digitCount < 20");
}

void _ffpp_strtoencf32_l_cold_2()
{
  __assert_rtn("_ffpp_strtoencf32_l", "strtofp.c", 2919, "normalizeProduct <= 1");
}

void _ffpp_strtoencf64_l_cold_1()
{
  __assert_rtn("_ffpp_strtoencf64_l", "strtofp.c", 3156, "normalizeDigits <= 4 || info.digitCount < 20");
}

void _ffpp_strtoencf64_l_cold_2()
{
  __assert_rtn("_ffpp_strtoencf64_l", "strtofp.c", 3176, "normalizeProduct <= 2");
}

void _ffpp_strtoencf64_l_cold_3()
{
  __assert_rtn("_ffpp_strtoencf64_l", "strtofp.c", 3240, "0 < shift && shift < 64");
}

void generalSlowpath_cold_1()
{
  __assert_rtn("generalSlowpath", "strtofp.c", 1867, "heapAllocOK");
}

void generalSlowpath_cold_2()
{
  __assert_rtn("generalSlowpath", "strtofp.c", 1879, "(workMP.msw - workMP.lsw) <= totalWordsNeeded");
}

void generalSlowpath_cold_3()
{
  __assert_rtn("generalSlowpath", "strtofp.c", 1925, "heapAllocOK");
}

void generalSlowpath_cold_4()
{
  __assert_rtn("generalSlowpath", "strtofp.c", 1940, "(denominator.msw - denominator.lsw) <= denominatorWordsNeeded");
}

void generalSlowpath_cold_5()
{
  __assert_rtn("generalSlowpath", "strtofp.c", 1941, "denominator.msw[-1] != 0");
}

void generalSlowpath_cold_6()
{
  __assert_rtn("generalSlowpath", "strtofp.c", 1946, "numerator.msw[-1] != 0");
}

void generalSlowpath_cold_7()
{
  __assert_rtn("generalSlowpath", "strtofp.c", 1950, "numerator.msw[-1] != 0");
}

void generalSlowpath_cold_8()
{
  __assert_rtn("divideMPByMP", "strtofp.c", 1345, "numerator.msw[-1] != 0");
}

void generalSlowpath_cold_9()
{
  __assert_rtn("divideMPByMP", "strtofp.c", 1346, "denominator.msw[-1] != 0");
}

void generalSlowpath_cold_10()
{
  __assert_rtn("divideMPByMP", "strtofp.c", 1390, "(numerator.msw < denominator.lsw) || (denominator.msw < numerator.lsw)");
}

void generalSlowpath_cold_11()
{
  __assert_rtn("divideMPByMP", "strtofp.c", 1344, "denominator.msw > denominator.lsw");
}

void generalSlowpath_cold_12()
{
  __assert_rtn("divideMPByMP", "strtofp.c", 1343, "numerator.msw > numerator.lsw");
}

void generalSlowpath_cold_13()
{
  __assert_rtn("generalSlowpath", "strtofp.c", 1951, "(numerator.msw - numerator.lsw) < numeratorWordsNeeded");
}

void bitCountMP_cold_1()
{
  __assert_rtn("bitCountMP", "strtofp.c", 1056, "work.msw[-1] != 0");
}

void fts_build_cold_1()
{
  char *v0;

  v0 = OUTLINED_FUNCTION_0();
  _os_crash((uint64_t)v0);
  __break(1u);
}

uint64_t _os_debug_log_error_str(uint64_t a1)
{
  return _os_debug_log_write(3, a1);
}

void _os_debug_log(char *a1, ...)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  char *v5;
  char *v6;
  char v7;
  uint64_t v8;
  _QWORD *v9;
  char *v10;
  va_list va;

  va_start(va, a1);
  v2 = MEMORY[0x1E0C87FA0];
  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 192) == -1)
    v3 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 200);
  else
    v3 = _os_alloc_once();
  if ((*(_BYTE *)(v3 + 20) & 2) == 0)
  {
    v10 = 0;
    v4 = vasprintf(&v10, a1, va);
    v5 = v10;
    if (v10)
    {
      v6 = v10;
      if (v4 >= 0x15)
      {
        if ((*(_BYTE *)(v3 + 20) & 1) != 0)
        {
          v7 = v10[16];
          v8 = mach_absolute_time();
          if (*(_QWORD *)(v2 + 192) == -1)
            v9 = *(_QWORD **)(v2 + 200);
          else
            v9 = (_QWORD *)_os_alloc_once();
          snprintf(v5, 0x11uLL, "%16llu", v8 - *v9);
          v6 = v10;
          v10[16] = v7;
        }
        else
        {
          v6 = v10 + 20;
          v10 += 20;
        }
      }
      _os_debug_log_write(7, (uint64_t)v6);
      free(v5);
    }
  }
}

void __xprintf_domain_init_cold_1()
{
  abort_report_np((uint64_t)"%s:%s:%u: No memory");
}

void libc_set_introspection_hooks_cold_1()
{
  __assert_rtn("libc_set_introspection_hooks", "libc_hooks.c", 33, "size >= sizeof(libc_hooks_version)");
}

void libc_set_introspection_hooks_cold_2()
{
  __assert_rtn("libc_set_introspection_hooks", "libc_hooks.c", 50, "new_hooks->version >= libc_hooks_version");
}

void libc_set_introspection_hooks_cold_3()
{
  __assert_rtn("libc_set_introspection_hooks", "libc_hooks.c", 54, "size >= sizeof(libc_hooks)");
}

void libc_set_introspection_hooks_cold_4()
{
  __assert_rtn("libc_set_introspection_hooks", "libc_hooks.c", 37, "size >= sizeof(libc_hooks)");
}

uint64_t _os_crash(uint64_t result)
{
  qword_1EDF533C0 = result;
  if (_os_crash_callback)
    return _os_crash_callback();
  return result;
}

char *_os_assert_log()
{
  uint64_t v0;
  const void *v1;
  uint64_t v2;
  uint64_t v3;
  const char *dli_fname;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const mach_header_64 *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  Dl_info v38;
  uint64_t v39;
  unsigned __int8 uu[8];
  uint64_t v41;
  _BYTE v42[32];
  _BYTE v43[88];
  char out[40];

  memset(&v38, 0, sizeof(v38));
  memset(out, 0, 37);
  v2 = dladdr(v1, &v38);
  if ((_DWORD)v2)
  {
    *(_QWORD *)uu = 0;
    v41 = 0;
    _os_get_image_uuid((uint64_t)v38.dli_fbase, uu);
    uuid_unparse(uu, out);
    dli_fname = v38.dli_fname;
    OUTLINED_FUNCTION_9((char *)v38.dli_fname);
    OUTLINED_FUNCTION_8();
  }
  else
  {
    v0 = 0;
    dli_fname = 0;
  }
  v5 = OUTLINED_FUNCTION_1(v2, v3, "%s:%lu");
  OUTLINED_FUNCTION_5(v5, v6, "0x%llx");
  v7 = OUTLINED_FUNCTION_11();
  v14 = OUTLINED_FUNCTION_2(v7, v8, "assertion failed: %s: %s + %lu [%s]: %s", v9, v10, v11, v12, v13, (uint64_t)v42, (uint64_t)dli_fname, v0, (uint64_t)out, (uint64_t)v43, v37, (uint64_t)v38.dli_fname, (uint64_t)v38.dli_fbase, (uint64_t)v38.dli_sname, (uint64_t)v38.dli_saddr, v39,
          uu[0]);
  v22 = OUTLINED_FUNCTION_13(v14, v15, v16, v17, v18, v19, v20, v21, v31, v33, v35);
  if ((v22 & 1) == 0)
    OUTLINED_FUNCTION_12(v22, v23, v24, v25, v26, v27, v28, v29, v32, v34, v36);
  return strdup((const char *)uu);
}

char *_os_assert_log_ctx()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
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
  __int128 v53;
  char *v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char __s1[256];
  _BYTE v61[32];
  _BYTE v62[88];
  _BYTE v63[40];

  v1 = v0;
  v2 = OUTLINED_FUNCTION_3(__stack_chk_guard[0]);
  v10 = OUTLINED_FUNCTION_0_0(v2, v3, v4, v5, v6, v7, v8, v9, v37, v40, v43, v46, v49, v51, v53, v56);
  if ((_DWORD)v10)
  {
    OUTLINED_FUNCTION_4(v10, v11, v12, v13, v14, v15, v16, v17, v38, v41, v44, v47, v50, v52, (uint64_t)v54, v55);
    OUTLINED_FUNCTION_7();
    v18 = (uint64_t)v54;
    OUTLINED_FUNCTION_9(v54);
    OUTLINED_FUNCTION_6();
  }
  else
  {
    v1 = 0;
    v18 = 0;
  }
  v19 = OUTLINED_FUNCTION_1(v10, v11, "%s:%lu");
  OUTLINED_FUNCTION_5(v19, v20, "0x%llx");
  v21 = OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_2(v21, v22, "assertion failed: %s: %s + %lu [%s]: %s", v23, v24, v25, v26, v27, (uint64_t)v61, v18, v1, (uint64_t)v63, (uint64_t)v62, v52, (uint64_t)v54, v55, v57, v58, v59,
    __s1[0]);
  v28 = _simple_asl_msg_new();
  OUTLINED_FUNCTION_10(v28, v29, v30, v31, v32, v33, v34, v35, v39, v42, v45, v48);
  _simple_sfree();
  return strdup(__s1);
}

void _os_crash_fmt_cold_1()
{
  os_log_pack_send_and_compose();
  abort_with_payload();
  mpool_new_cold_1();
}

void mpool_new_cold_1()
{
  fwrite("mpool_new: page allocation overflow.\n", 0x25uLL, 1uLL, __stderrp);
  abort_report_np((uint64_t)"%s:%s:%u: page allocation overflow");
}

void arc4_init_cold_1(uint64_t *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg(*a1);
  __break(1u);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  if (a1)
  {
    if (a1 == (const char *)-1)
    {
      OUTLINED_FUNCTION_0_1();
      if (qword_1EDF533C0)
        goto LABEL_13;
      if (!_simple_salloc())
        goto LABEL_12;
    }
    else
    {
      OUTLINED_FUNCTION_0_1();
      if (qword_1EDF533C0)
        goto LABEL_13;
      if (!_simple_salloc())
      {
LABEL_12:
        qword_1EDF533C0 = (uint64_t)a4;
LABEL_13:
        abort();
      }
    }
  }
  else
  {
    OUTLINED_FUNCTION_0_1();
    if (qword_1EDF533C0)
      goto LABEL_13;
    if (!_simple_salloc())
      goto LABEL_12;
  }
  _simple_sprintf();
  a4 = (const char *)_simple_string();
  goto LABEL_12;
}

void err(int a1, const char *a2, ...)
{
  int *v4;
  char *v5;

  v4 = OUTLINED_FUNCTION_1_0();
  verrc(a1, *v4, a2, v5);
}

void verrc(int a1, int a2, const char *a3, __darwin_va_list a4)
{
  uint64_t v7;
  FILE *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  FILE *v12;
  char *v13;

  v7 = *(_QWORD *)&a1;
  v8 = (FILE *)_e_err_file;
  if (!_e_err_file)
  {
    v8 = __stderrp;
    _e_err_file = (uint64_t)__stderrp;
  }
  v9 = getprogname();
  fprintf(v8, "%s: ", v9);
  if (a3)
  {
    _e_visprintf((FILE *)_e_err_file, a3, a4);
    OUTLINED_FUNCTION_3_0(": ", v10, v11, (FILE *)_e_err_file);
  }
  v12 = (FILE *)_e_err_file;
  v13 = strerror(a2);
  fprintf(v12, "%s\n", v13);
  if (_e_err_exit)
  {
    if (_e_err_exit == 1)
      OUTLINED_FUNCTION_2_0((uint64_t)off_1EDF54DC0);
    else
      off_1EDF54DC0(v7);
  }
  exit(v7);
}

void verr(int a1, const char *a2, __darwin_va_list a3)
{
  int *v6;

  v6 = __error();
  verrc(a1, *v6, a2, a3);
}

void errc(int a1, int a2, const char *a3, ...)
{
  va_list va;

  va_start(va, a3);
  verrc(a1, a2, a3, va);
}

void errx(int a1, const char *a2, ...)
{
  va_list va;

  va_start(va, a2);
  verrx(a1, a2, va);
}

void verrx(int a1, const char *a2, __darwin_va_list a3)
{
  uint64_t v4;
  FILE *v5;
  const char *v6;

  v4 = *(_QWORD *)&a1;
  v5 = (FILE *)_e_err_file;
  if (!_e_err_file)
  {
    v5 = __stderrp;
    _e_err_file = (uint64_t)__stderrp;
  }
  v6 = getprogname();
  fprintf(v5, "%s: ", v6);
  if (a2)
    OUTLINED_FUNCTION_0_2();
  fputc(10, (FILE *)_e_err_file);
  if (_e_err_exit)
  {
    if (_e_err_exit == 1)
      OUTLINED_FUNCTION_2_0((uint64_t)off_1EDF54DC0);
    else
      off_1EDF54DC0(v4);
  }
  exit(v4);
}

void warn(const char *a1, ...)
{
  int *v2;
  char *v3;

  v2 = OUTLINED_FUNCTION_1_0();
  vwarnc(*v2, a1, v3);
}

void vwarnc(int a1, const char *a2, __darwin_va_list a3)
{
  FILE *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  FILE *v9;
  char *v10;

  v5 = (FILE *)_e_err_file;
  if (!_e_err_file)
  {
    v5 = __stderrp;
    _e_err_file = (uint64_t)__stderrp;
  }
  v6 = getprogname();
  fprintf(v5, "%s: ", v6);
  if (a2)
  {
    OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_3_0(": ", v7, v8, (FILE *)_e_err_file);
  }
  v9 = (FILE *)_e_err_file;
  v10 = strerror(a1);
  fprintf(v9, "%s\n", v10);
}

void vwarn(const char *a1, __darwin_va_list a2)
{
  int *v4;

  v4 = __error();
  vwarnc(*v4, a1, a2);
}

void warnc(int a1, const char *a2, ...)
{
  va_list va;

  va_start(va, a2);
  vwarnc(a1, a2, va);
}

void warnx(const char *a1, ...)
{
  va_list va;

  va_start(va, a1);
  vwarnx(a1, va);
}

void vwarnx(const char *a1, __darwin_va_list a2)
{
  FILE *v4;
  const char *v5;

  v4 = (FILE *)_e_err_file;
  if (!_e_err_file)
  {
    v4 = __stderrp;
    _e_err_file = (uint64_t)__stderrp;
  }
  v5 = getprogname();
  fprintf(v4, "%s: ", v5);
  if (a1)
    _e_visprintf((FILE *)_e_err_file, a1, a2);
  fputc(10, (FILE *)_e_err_file);
}

void sl_init_cold_1()
{
  err(1, "stringlist: %m");
}

void unvis_cold_1()
{
  __assert_rtn("unvis", "unvis.c", 210, "cp != ((void *)0)");
}

void unvis_cold_2()
{
  __assert_rtn("unvis", "unvis.c", 211, "astate != ((void *)0)");
}

void strnunvisx_cold_1()
{
  __assert_rtn("strnunvisx", "unvis.c", 504, "src != ((void *)0)");
}

void strnunvisx_cold_2()
{
  __assert_rtn("strnunvisx", "unvis.c", 505, "dst != ((void *)0)");
}

void strnunvisx_cold_3()
{
  __assert_rtn("strnunvisx", "unvis.c", 532, "0");
}

void istrsenvisx_cold_1()
{
  __assert_rtn("istrsenvisx", "vis.c", 394, "mbdstp != ((void *)0)");
}

void istrsenvisx_cold_2()
{
  __assert_rtn("istrsenvisx", "vis.c", 395, "mbsrc != ((void *)0) || mblength == 0");
}

void istrsenvisx_cold_3()
{
  __assert_rtn("istrsenvisx", "vis.c", 396, "mbextra != ((void *)0)");
}

void istrsenvisx_cold_4()
{
  __assert_rtn("istrsenvisx", "vis.c", 590, "olen + clen < maxolen");
}

void lookup_substsearch_cold_1()
{
  __assert_rtn("lookup_substsearch", "collate.c", 596, "p->val == key");
}

void localeconv_l_cold_2()
{
  _os_crash((uint64_t)"loc->decimal_point is NULL (nlocale changed)");
  __break(1u);
}

void memstream_update_cold_1()
{
  __assert_rtn("memstream_update", "open_memstream.c", 96, "ms->len >= 0 && ms->offset >= 0");
}

void memstream_seek_cold_1()
{
  __assert_rtn("memstream_seek", "open_memstream.c", 136, "pos >= 0");
}

void memstream_seek_cold_2()
{
  __assert_rtn("memstream_seek", "open_memstream.c", 141, "pos == 0");
}

void inet_net_pton_cold_1()
{
  __assert_rtn("inet_net_pton_ipv4", "inet_net_pton.c", 110, "n >= 0 && n <= 9");
}

void inet_net_pton_cold_2()
{
  __assert_rtn("inet_net_pton_ipv4", "inet_net_pton.c", 139, "n >= 0 && n <= 9");
}

void inet_net_pton_cold_3()
{
  __assert_rtn("inet_net_pton_ipv4", "inet_net_pton.c", 87, "n >= 0 && n <= 15");
}

void setipv4sourcefilter_cold_1()
{
  __assert_rtn("setipv4sourcefilter", "sourcefilter.c", 160, "s != -1");
}

void __inaddr_to_index_cold_1()
{
  __assert_rtn("__inaddr_to_index", "sourcefilter.c", 134, "ifindex != 0");
}

void getipv4sourcefilter_cold_1()
{
  __assert_rtn("getipv4sourcefilter", "sourcefilter.c", 229, "s != -1");
}

void getipv4sourcefilter_cold_2()
{
  __assert_rtn("getipv4sourcefilter", "sourcefilter.c", 230, "fmode != NULL");
}

void getipv4sourcefilter_cold_3()
{
  __assert_rtn("getipv4sourcefilter", "sourcefilter.c", 231, "numsrc != NULL");
}

void _mkstemp_dprotected_np_action_cold_1()
{
  __assert_rtn("_mkstemp_dprotected_np_action", "mktemp.c", 321, "dfd == AT_FDCWD");
}

void perror(const char *a1)
{
  char **v1;
  int *v2;
  uint64_t v3;
  _QWORD *v4;
  FILE *v5;
  _QWORD v6[4];
  uint64_t v7;
  char __strerrbuf[2048];

  if (a1)
  {
    v1 = (char **)v6;
    if (*a1)
    {
      v6[0] = a1;
      v6[1] = _platform_strlen();
      v6[2] = ": ";
      v6[3] = 2;
      v1 = (char **)&v7;
    }
  }
  else
  {
    v1 = (char **)v6;
  }
  v2 = __error();
  strerror_r(*v2, __strerrbuf, 0x800uLL);
  *v1 = __strerrbuf;
  v3 = _platform_strlen();
  v1[2] = "\n";
  v4 = v1 + 2;
  *(v4 - 1) = v3;
  v4[1] = 1;
  flockfile(__stderrp);
  __sflush((uint64_t)__stderrp);
  writev_NOCANCEL();
  v5 = __stderrp;
  __stderrp->_flags &= ~0x1000u;
  funlockfile(v5);
}

void __vfprintf_cold_1(uint64_t *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E0C88E98], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg(*a1);
  __break(1u);
}

void wmemstream_update_cold_1()
{
  __assert_rtn("wmemstream_update", "open_wmemstream.c", 86, "ms->len >= 0 && ms->offset >= 0");
}

void wmemstream_seek_cold_1()
{
  __assert_rtn("wmemstream_seek", "open_wmemstream.c", 183, "pos >= 0");
}

void wmemstream_seek_cold_2()
{
  __assert_rtn("wmemstream_seek", "open_wmemstream.c", 188, "pos == 0");
}

size_t regerror(int a1, const regex_t *a2, char *a3, size_t a4)
{
  char **v6;
  int *v7;
  int v8;
  int v9;
  BOOL v10;
  unint64_t v11;
  char v13[50];

  if (a1 == 255)
  {
    if (_platform_strcmp())
    {
      v6 = off_1E1E9D510;
      while (*((_DWORD *)v6 - 2))
      {
        v6 += 3;
        if (!_platform_strcmp())
          goto LABEL_16;
      }
    }
    else
    {
LABEL_16:
      sprintf(v13, "%d");
    }
  }
  else
  {
    v7 = &rerrs;
    do
    {
      v9 = *v7;
      v7 += 6;
      v8 = v9;
      if (v9)
        v10 = v8 == (a1 & 0xFFFFFEFF);
      else
        v10 = 1;
    }
    while (!v10);
    if ((a1 & 0x100) != 0)
    {
      if (v8)
        _platform_strcpy();
      else
        sprintf(v13, "REG_0x%x");
    }
  }
  v11 = _platform_strlen() + 1;
  if (a4)
  {
    if (v11 >= a4)
    {
      _platform_strncpy();
      a3[a4 - 1] = 0;
    }
    else
    {
      _platform_strcpy();
    }
  }
  return v11;
}

void abort(void)
{
  uint64_t v0;
  uint64_t v1;

  if (!qword_1EDF533C0)
    qword_1EDF533C0 = (uint64_t)"abort() called";
  pthread_self();
  if (__cleanup)
    _cleanup();
  OUTLINED_FUNCTION_0_3(-1569, v0, v1, HIDWORD(v1), 0, 0);
  __pthread_workqueue_setkill();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1();
  usleep_NOCANCEL(0x2710u);
  __abort();
}

void __abort()
{
  uint64_t v0;
  uint64_t v1;
  sigaction v2;

  if (!qword_1EDF533C0)
    qword_1EDF533C0 = (uint64_t)"__abort() called";
  pthread_self();
  v2.__sigaction_u.__sa_handler = 0;
  *(_QWORD *)&v2.sa_mask = 0xFFFFFFFFLL;
  sigaction(6, &v2, 0);
  OUTLINED_FUNCTION_0_3(v2.sa_mask & 0xFFFFFFDF, v0, v1, HIDWORD(v1), (uint64_t)v2.__sigaction_u.__sa_handler, v2.sa_mask);
  __pthread_workqueue_setkill();
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_1();
  usleep_NOCANCEL(0x2710u);
  v2.sa_mask = -25;
  sigprocmask(3, &v2.sa_mask, 0);
  __break(1u);
}

void abort_report_np(uint64_t a1)
{
  if (_simple_salloc())
  {
    _simple_vsprintf();
    a1 = _simple_string();
  }
  qword_1EDF533C0 = a1;
  abort();
}

void atexit_register_cold_1()
{
  __assert_rtn("atexit_register", "atexit.c", 115, "p");
}

void getopt_internal_cold_1()
{
  if (getopt_internal_posixly_correct)
    warnx("illegal option -- %c");
  else
    warnx("invalid option -- %c");
}

void ptsname_cold_1()
{
  char *v0;

  v0 = _os_assert_log();
  _os_crash((uint64_t)v0);
  __break(1u);
}

void ptsname_cold_2()
{
  char *v0;

  v0 = _os_assert_log();
  _os_crash((uint64_t)v0);
  __break(1u);
}

void _psort_cold_1()
{
  int *v0;

  v0 = __error();
  strerror(*v0);
  abort_report_np((uint64_t)"%s:%s:%u: %s: getargs: %s");
}

void _psort_cold_1_0()
{
  int *v0;

  v0 = __error();
  strerror(*v0);
  abort_report_np((uint64_t)"%s:%s:%u: %s: getargs: %s");
}

void _psort_cold_1_1()
{
  int *v0;

  v0 = __error();
  strerror(*v0);
  abort_report_np((uint64_t)"%s:%s:%u: %s: getargs: %s");
}

void __printf_arginfo_errno_cold_1()
{
  __assert_rtn("__printf_arginfo_errno", "xprintf_errno.c", 44, "n >= 1");
}

void __printf_arginfo_float_cold_1()
{
  __assert_rtn("__printf_arginfo_float", "xprintf_float.c", 130, "n > 0");
}

void __printf_render_float_cold_1()
{
  __assert_rtn("__printf_render_float", "xprintf_float.c", 263, "pi->spec == 'f'");
}

void __printf_arginfo_hexdump_cold_1()
{
  __assert_rtn("__printf_arginfo_hexdump", "xprintf_hexdump.c", 42, "n >= 2");
}

void __printf_arginfo_int_cold_1()
{
  __assert_rtn("__printf_arginfo_int", "xprintf_int.c", 240, "n > 0");
}

void __printf_render_int_cold_1(uint64_t a1)
{
  fprintf(__stderrp, "pi->spec = '%c'\n", a1);
  __assert_rtn("__printf_render_int", "xprintf_int.c", 328, "1 == 0");
}

void __printf_render_int_cold_2()
{
  __assert_rtn("__ultoa", "xprintf_int.c", 162, "base == 16");
}

void __printf_arginfo_ptr_cold_1()
{
  __assert_rtn("__printf_arginfo_ptr", "xprintf_int.c", 462, "n > 0");
}

void __printf_arginfo_quote_cold_1()
{
  __assert_rtn("__printf_arginfo_quote", "xprintf_quote.c", 45, "n >= 1");
}

void __printf_arginfo_str_cold_1()
{
  __assert_rtn("__printf_arginfo_str", "xprintf_str.c", 113, "n > 0");
}

void __printf_arginfo_chr_cold_1()
{
  __assert_rtn("__printf_arginfo_chr", "xprintf_str.c", 156, "n > 0");
}

void __printf_arginfo_time_cold_1()
{
  __assert_rtn("__printf_arginfo_time", "xprintf_time.c", 48, "n >= 1");
}

void __printf_arginfo_vis_cold_1()
{
  __assert_rtn("__printf_arginfo_vis", "xprintf_vis.c", 44, "n >= 1");
}

void __printf_arginfo_n_cold_1()
{
  __assert_rtn("__printf_arginfo_n", "xprintf.c", 233, "n >= 1");
}

void _setutxent_cold_1()
{
  abort_report_np((uint64_t)"%s:%s:%u: %s: NULL utmpx_t");
}

void _setutxent_cold_2()
{
  abort_report_np((uint64_t)"%s:%s:%u: %s: magic mismatch");
}

void _endutxent_cold_1()
{
  abort_report_np((uint64_t)"%s:%s:%u: %s: NULL utmpx_t");
}

void _endutxent_cold_2()
{
  abort_report_np((uint64_t)"%s:%s:%u: %s: magic mismatch");
}

void _getutxent_cold_1()
{
  abort_report_np((uint64_t)"%s:%s:%u: %s: NULL utmpx_t");
}

void _getutxent_cold_2()
{
  abort_report_np((uint64_t)"%s:%s:%u: %s: magic mismatch");
}

void _getutxid_cold_1()
{
  abort_report_np((uint64_t)"%s:%s:%u: %s: NULL utmpx_t");
}

void _getutxid_cold_2()
{
  abort_report_np((uint64_t)"%s:%s:%u: %s: magic mismatch");
}

void _getutxline_cold_1()
{
  abort_report_np((uint64_t)"%s:%s:%u: %s: NULL utmpx_t");
}

void _getutxline_cold_2()
{
  abort_report_np((uint64_t)"%s:%s:%u: %s: magic mismatch");
}

void _pututxline_cold_1()
{
  abort_report_np((uint64_t)"%s:%s:%u: %s: NULL utmpx_t");
}

void _pututxline_cold_2()
{
  abort_report_np((uint64_t)"%s:%s:%u: %s: magic mismatch");
}

void _utmpxname_cold_1()
{
  abort_report_np((uint64_t)"%s:%s:%u: %s: NULL utmpx_t");
}

void _utmpxname_cold_2()
{
  abort_report_np((uint64_t)"%s:%s:%u: %s: magic mismatch");
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C87428](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C87440](aBlock);
}

uint64_t __chmod_extended()
{
  return MEMORY[0x1E0C87D68]();
}

uint64_t __commpage_gettimeofday()
{
  return MEMORY[0x1E0C87D70]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C87D88]();
}

void __exit()
{
  MEMORY[0x1E0C87D90]();
}

uint64_t __fchmod_extended()
{
  return MEMORY[0x1E0C87D98]();
}

uint64_t __fcntl()
{
  return MEMORY[0x1E0C87DA0]();
}

uint64_t __fcntl_nocancel()
{
  return MEMORY[0x1E0C87DA8]();
}

uint64_t __fork()
{
  return MEMORY[0x1E0C87DB0]();
}

int __fpclassifyd(double a1)
{
  return MEMORY[0x1E0C88900](a1);
}

uint64_t __fstat64_extended()
{
  return MEMORY[0x1E0C87DB8]();
}

uint64_t __getdirentries64()
{
  return MEMORY[0x1E0C87DC0]();
}

uint64_t __getlogin()
{
  return MEMORY[0x1E0C87DC8]();
}

uint64_t __gettimeofday()
{
  return MEMORY[0x1E0C87DD0]();
}

uint64_t __kill()
{
  return MEMORY[0x1E0C87DE0]();
}

uint64_t __lstat64_extended()
{
  return MEMORY[0x1E0C87E00]();
}

uint64_t __mkdir_extended()
{
  return MEMORY[0x1E0C87E08]();
}

uint64_t __mkfifo_extended()
{
  return MEMORY[0x1E0C87E10]();
}

uint64_t __open()
{
  return MEMORY[0x1E0C87E18]();
}

uint64_t __open_extended()
{
  return MEMORY[0x1E0C87E20]();
}

uint64_t __open_nocancel()
{
  return MEMORY[0x1E0C87E28]();
}

uint64_t __os_log_simple_offset()
{
  return MEMORY[0x1E0C88A68]();
}

uint64_t __platform_sigaction()
{
  return MEMORY[0x1E0C88A78]();
}

uint64_t __pthread_workqueue_setkill()
{
  return MEMORY[0x1E0C88C18]();
}

uint64_t __recvfrom()
{
  return MEMORY[0x1E0C87EB0]();
}

uint64_t __recvfrom_nocancel()
{
  return MEMORY[0x1E0C87EB8]();
}

uint64_t __semwait_signal()
{
  return MEMORY[0x1E0C87EC8]();
}

uint64_t __semwait_signal_nocancel()
{
  return MEMORY[0x1E0C87ED0]();
}

uint64_t __sendto()
{
  return MEMORY[0x1E0C87ED8]();
}

uint64_t __sendto_nocancel()
{
  return MEMORY[0x1E0C87EE0]();
}

uint64_t __setlogin()
{
  return MEMORY[0x1E0C87EE8]();
}

uint64_t __settimeofday()
{
  return MEMORY[0x1E0C87EF0]();
}

uint64_t __sigaltstack()
{
  return MEMORY[0x1E0C87F00]();
}

uint64_t __stat64_extended()
{
  return MEMORY[0x1E0C87F18]();
}

uint64_t __sysctl()
{
  return MEMORY[0x1E0C87F28]();
}

uint64_t __thread_selfusage()
{
  return MEMORY[0x1E0C87F40]();
}

uint64_t __umask_extended()
{
  return MEMORY[0x1E0C87F60]();
}

uint64_t __wait4()
{
  return MEMORY[0x1E0C87F68]();
}

uint64_t __wait4_nocancel()
{
  return MEMORY[0x1E0C87F70]();
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x1E0C872D8]();
}

uint64_t _dyld_get_shared_cache_range()
{
  return MEMORY[0x1E0C872E8]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1E0C872F0]();
}

uint64_t _dyld_images_for_addresses()
{
  return MEMORY[0x1E0C87300]();
}

void _exit(int a1)
{
  MEMORY[0x1E0C87F90](*(_QWORD *)&a1);
}

uint64_t _get_cpu_capabilities()
{
  return MEMORY[0x1E0C87F98]();
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x1E0C88A80]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C88EC0]();
}

uint64_t _os_once()
{
  return MEMORY[0x1E0C88AA0]();
}

uint64_t _platform_bzero()
{
  return MEMORY[0x1E0C88AB8]();
}

uint64_t _platform_memccpy()
{
  return MEMORY[0x1E0C88AC0]();
}

uint64_t _platform_memchr()
{
  return MEMORY[0x1E0C88AC8]();
}

uint64_t _platform_memcmp()
{
  return MEMORY[0x1E0C88AD0]();
}

uint64_t _platform_memmove()
{
  return MEMORY[0x1E0C88AE0]();
}

uint64_t j___platform_memmove()
{
  return MEMORY[0x1E0C88AE0]();
}

uint64_t j___platform_memmove_0()
{
  return MEMORY[0x1E0C88AE0]();
}

uint64_t _platform_memset()
{
  return MEMORY[0x1E0C88AE8]();
}

uint64_t _platform_strchr()
{
  return MEMORY[0x1E0C88AF0]();
}

uint64_t j___platform_strchr()
{
  return MEMORY[0x1E0C88AF0]();
}

uint64_t _platform_strcmp()
{
  return MEMORY[0x1E0C88AF8]();
}

uint64_t _platform_strcpy()
{
  return MEMORY[0x1E0C88B00]();
}

uint64_t _platform_strlcat()
{
  return MEMORY[0x1E0C88B08]();
}

uint64_t _platform_strlcpy()
{
  return MEMORY[0x1E0C88B10]();
}

uint64_t _platform_strlen()
{
  return MEMORY[0x1E0C88B18]();
}

uint64_t _platform_strncmp()
{
  return MEMORY[0x1E0C88B20]();
}

uint64_t _platform_strncpy()
{
  return MEMORY[0x1E0C88B28]();
}

uint64_t _platform_strnlen()
{
  return MEMORY[0x1E0C88B30]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x1E0C88B40]();
}

uint64_t _simple_asl_log_prog()
{
  return MEMORY[0x1E0C88B48]();
}

uint64_t _simple_asl_msg_new()
{
  return MEMORY[0x1E0C88B50]();
}

uint64_t _simple_dprintf()
{
  return MEMORY[0x1E0C88B58]();
}

uint64_t _simple_getenv()
{
  return MEMORY[0x1E0C88B60]();
}

uint64_t _simple_salloc()
{
  return MEMORY[0x1E0C88B70]();
}

uint64_t _simple_sappend()
{
  return MEMORY[0x1E0C88B78]();
}

uint64_t _simple_sfree()
{
  return MEMORY[0x1E0C88B80]();
}

uint64_t _simple_sprintf()
{
  return MEMORY[0x1E0C88B88]();
}

uint64_t _simple_string()
{
  return MEMORY[0x1E0C88B98]();
}

uint64_t _simple_vsprintf()
{
  return MEMORY[0x1E0C88BA8]();
}

uint64_t _tlv_exit()
{
  return MEMORY[0x1E0C87330]();
}

uint64_t abort_with_payload()
{
  return MEMORY[0x1E0C87FB0]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C87FC8](a1, *(_QWORD *)&a2);
}

void asl_append(asl_object_t obj, asl_object_t obj_to_add)
{
  MEMORY[0x1E0C873C0](obj, obj_to_add);
}

const char *__cdecl asl_get(asl_object_t msg, const char *key)
{
  return (const char *)MEMORY[0x1E0C873C8](msg, key);
}

asl_object_t asl_match(asl_object_t data, asl_object_t querylist, size_t *last, size_t start, size_t count, uint32_t duration, int32_t direction)
{
  return (asl_object_t)MEMORY[0x1E0C873D0](data, querylist, last, start, count, *(_QWORD *)&duration, *(_QWORD *)&direction);
}

asl_object_t asl_new(uint32_t type)
{
  return (asl_object_t)MEMORY[0x1E0C873D8](*(_QWORD *)&type);
}

asl_object_t asl_next(asl_object_t obj)
{
  return (asl_object_t)MEMORY[0x1E0C873E0](obj);
}

asl_object_t asl_open(const char *ident, const char *facility, uint32_t opts)
{
  return (asl_object_t)MEMORY[0x1E0C873E8](ident, facility, *(_QWORD *)&opts);
}

void asl_release(asl_object_t obj)
{
  MEMORY[0x1E0C873F0](obj);
}

int asl_send(asl_object_t obj, asl_object_t msg)
{
  return MEMORY[0x1E0C873F8](obj, msg);
}

int asl_set(asl_object_t obj, const char *key, const char *value)
{
  return MEMORY[0x1E0C87400](obj, key, value);
}

int asl_set_query(asl_object_t msg, const char *key, const char *value, uint32_t op)
{
  return MEMORY[0x1E0C87410](msg, key, value, *(_QWORD *)&op);
}

kern_return_t bootstrap_parent(mach_port_t bp, mach_port_t *parent_port)
{
  return MEMORY[0x1E0C89040](*(_QWORD *)&bp, parent_port);
}

uint64_t ccrng()
{
  return MEMORY[0x1E0C86C18]();
}

uint64_t ccrng_uniform()
{
  return MEMORY[0x1E0C86C20]();
}

int chdir(const char *a1)
{
  return MEMORY[0x1E0C87FF0](a1);
}

kern_return_t clock_get_time(clock_serv_t clock_serv, mach_timespec_t *cur_time)
{
  return MEMORY[0x1E0C88008](*(_QWORD *)&clock_serv, cur_time);
}

uint64_t close_NOCANCEL()
{
  return MEMORY[0x1E0C88020]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C87028](identifier, flags);
}

void dispatch_group_async_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C87030](group, queue, context, work);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C87038]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C87050](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C87100](predicate, block);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C87148](object);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1E0C87338](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C87350](__path, *(_QWORD *)&__mode);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x1E0C88058](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t dyld_image_header_containing_address()
{
  return MEMORY[0x1E0C87370]();
}

int execve(const char *__file, char *const *__argv, char *const *__envp)
{
  return MEMORY[0x1E0C88060](__file, __argv, __envp);
}

int fchdir(int a1)
{
  return MEMORY[0x1E0C88068](*(_QWORD *)&a1);
}

int fchmodat(int a1, const char *a2, mode_t a3, int a4)
{
  return MEMORY[0x1E0C88080](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

uint64_t fcntl_NOCANCEL()
{
  return MEMORY[0x1E0C88098]();
}

int fegetenv(fenv_t *a1)
{
  return MEMORY[0x1E0C88908](a1);
}

int fegetround(void)
{
  return MEMORY[0x1E0C88910]();
}

int fesetenv(const fenv_t *a1)
{
  return MEMORY[0x1E0C88918](a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C880A0](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int flsl(uint64_t a1)
{
  return MEMORY[0x1E0C88BB8](a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C88920](a1);
}

void freeifaddrs(ifaddrs *a1)
{
  MEMORY[0x1E0C87CC0](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C880E8](a1, a2, a3, *(_QWORD *)&a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C88108](*(_QWORD *)&a1, a2);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return MEMORY[0x1E0C88110](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1E0C88118](*(_QWORD *)&a1, a2);
}

uint64_t fsync_NOCANCEL()
{
  return MEMORY[0x1E0C88128]();
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C88130](*(_QWORD *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C88138](a1, a2, a3, a4, *(_QWORD *)&a5);
}

int getattrlistbulk(int a1, void *a2, void *a3, size_t a4, uint64_t a5)
{
  return MEMORY[0x1E0C88140](*(_QWORD *)&a1, a2, a3, a4, a5);
}

int getdtablesize(void)
{
  return MEMORY[0x1E0C88148]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C88160]();
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x1E0C88168](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

group *__cdecl getgrgid(gid_t a1)
{
  return (group *)MEMORY[0x1E0C87CC8](*(_QWORD *)&a1);
}

group *__cdecl getgrnam(const char *a1)
{
  return (group *)MEMORY[0x1E0C87CD0](a1);
}

uint64_t getgroupcount()
{
  return MEMORY[0x1E0C87CD8]();
}

int getgrouplist(const char *a1, int a2, int *a3, int *a4)
{
  return MEMORY[0x1E0C87CE0](a1, *(_QWORD *)&a2, a3, a4);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1E0C87CE8](a1);
}

pid_t getpgrp(void)
{
  return MEMORY[0x1E0C88188]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C88190]();
}

int getpriority(int a1, id_t a2)
{
  return MEMORY[0x1E0C88198](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1E0C87CF0](a1);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1E0C87D00](*(_QWORD *)&a1);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1E0C87D08](*(_QWORD *)&a1, a2, a3, a4, a5);
}

int getrlimit(int a1, rlimit *a2)
{
  return MEMORY[0x1E0C881A0](*(_QWORD *)&a1, a2);
}

int getrusage(int a1, rusage *a2)
{
  return MEMORY[0x1E0C881A8](*(_QWORD *)&a1, a2);
}

uint8_t *__cdecl getsectiondata(const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1E0C873B0](mhp, segname, sectname, size);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1E0C881B8](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C881C0]();
}

kern_return_t host_get_clock_service(host_t host, clock_id_t clock_id, clock_serv_t *clock_serv)
{
  return MEMORY[0x1E0C881E8](*(_QWORD *)&host, *(_QWORD *)&clock_id, clock_serv);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1E0C87D10](a1);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1E0C88228](*(_QWORD *)&a1, a2);
}

int issetugid(void)
{
  return MEMORY[0x1E0C88230]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1E0C88258](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C882A0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C882A8](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C882B0]();
}

uint64_t mach_approximate_time(void)
{
  return MEMORY[0x1E0C882B8]();
}

uint64_t mach_boottime_usec()
{
  return MEMORY[0x1E0C882C0]();
}

uint64_t mach_continuous_approximate_time(void)
{
  return MEMORY[0x1E0C882C8]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C882D0]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C882D8](*(_QWORD *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C88328]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C88368](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C88400](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88970](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88978](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C88988](ptr, size, type_id);
}

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  return MEMORY[0x1E0C87D20](*(_QWORD *)&gid, uu);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return MEMORY[0x1E0C87D28](*(_QWORD *)&uid, uu);
}

int mbr_uuid_to_id(const uuid_t uu, id_t *uid_or_gid, int *id_type)
{
  return MEMORY[0x1E0C87D30](uu, uid_or_gid, id_type);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return MEMORY[0x1E0C884F8](*(_QWORD *)&a1, a2, a3);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C88500](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C88518](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C889D8](*(_QWORD *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1E0C889E0](*(_QWORD *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C889E8](*(_QWORD *)&token, state64);
}

uint64_t notify_monitor_file()
{
  return MEMORY[0x1E0C889F0]();
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C88A00](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C88A08](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C88A28](*(_QWORD *)&token, state64);
}

uint64_t open_NOCANCEL()
{
  return MEMORY[0x1E0C88530]();
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C88538](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

uint64_t openat_NOCANCEL()
{
  return MEMORY[0x1E0C88548]();
}

uint64_t os_log_pack_send_and_compose()
{
  return MEMORY[0x1E0C88F00]();
}

uint64_t os_log_simple_type_from_asl()
{
  return MEMORY[0x1E0C88BC0]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C88F18](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C88BD0](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C88BE0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C88BF0](lock);
}

uint64_t pathconf(const char *a1, int a2)
{
  return MEMORY[0x1E0C88560](a1, *(_QWORD *)&a2);
}

int pipe(int a1[2])
{
  return MEMORY[0x1E0C88570](a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1E0C88578](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x1E0C88580](a1, *(_QWORD *)&a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x1E0C88588](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1E0C88590](a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1E0C88598](a1);
}

int posix_spawnattr_destroy(posix_spawnattr_t *a1)
{
  return MEMORY[0x1E0C885A0](a1);
}

int posix_spawnattr_init(posix_spawnattr_t *a1)
{
  return MEMORY[0x1E0C885B0](a1);
}

int posix_spawnattr_setflags(posix_spawnattr_t *a1, __int16 a2)
{
  return MEMORY[0x1E0C885D0](a1, a2);
}

int posix_spawnattr_setsigdefault(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return MEMORY[0x1E0C885E0](a1, a2);
}

int posix_spawnattr_setsigmask(posix_spawnattr_t *a1, const sigset_t *a2)
{
  return MEMORY[0x1E0C885E8](a1, a2);
}

uint64_t pread_NOCANCEL()
{
  return MEMORY[0x1E0C885F8]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C88600](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

uint64_t pthread_fchdir_np()
{
  return MEMORY[0x1E0C88D10]();
}

void *__cdecl pthread_get_stackaddr_np(pthread_t a1)
{
  return (void *)MEMORY[0x1E0C88D18](a1);
}

size_t pthread_get_stacksize_np(pthread_t a1)
{
  return MEMORY[0x1E0C88D20](a1);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C88D28](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C88D40](a1, a2);
}

uint64_t pthread_key_init_np()
{
  return MEMORY[0x1E0C88D48]();
}

int pthread_kill(pthread_t a1, int a2)
{
  return MEMORY[0x1E0C88D50](a1, *(_QWORD *)&a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C88D60](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C88D68](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C88D70](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C88D78](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C88D80](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C88D88](a1, a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C88D98](a1);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C88DA0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C88DA8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C88DB0](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C88DB8]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C88DC8](a1, a2);
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x1E0C88DD0](*(_QWORD *)&a1, a2, a3);
}

uintptr_t pthread_stack_frame_decode_np(uintptr_t frame_addr, uintptr_t *return_addr)
{
  return MEMORY[0x1E0C88DD8](frame_addr, return_addr);
}

void pthread_testcancel(void)
{
  MEMORY[0x1E0C88DE0]();
}

uint64_t pwrite_NOCANCEL()
{
  return MEMORY[0x1E0C88638]();
}

uint64_t read_NOCANCEL()
{
  return MEMORY[0x1E0C88648]();
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C88650](a1, a2, a3);
}

uint64_t reallocarray_DARWIN_EXTSN()
{
  return MEMORY[0x1E0C889A8]();
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C889B0](__ptr, __size);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1E0C88668](a1);
}

uint64_t select_NOCANCEL()
{
  return MEMORY[0x1E0C88670]();
}

kern_return_t semaphore_create(task_t task, semaphore_t *semaphore, int policy, int value)
{
  return MEMORY[0x1E0C88678](*(_QWORD *)&task, semaphore, *(_QWORD *)&policy, *(_QWORD *)&value);
}

int setattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C886B0](a1, a2, a3, a4, *(_QWORD *)&a5);
}

int setitimer(int a1, const itimerval *a2, itimerval *a3)
{
  return MEMORY[0x1E0C886C0](*(_QWORD *)&a1, a2, a3);
}

int setpgid(pid_t a1, pid_t a2)
{
  return MEMORY[0x1E0C886C8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int setpriority(int a1, id_t a2, int a3)
{
  return MEMORY[0x1E0C886D0](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int setregid(gid_t a1, gid_t a2)
{
  return MEMORY[0x1E0C886D8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int setreuid(uid_t a1, uid_t a2)
{
  return MEMORY[0x1E0C886E0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int setrlimit(int a1, const rlimit *a2)
{
  return MEMORY[0x1E0C886E8](*(_QWORD *)&a1, a2);
}

pid_t setsid(void)
{
  return MEMORY[0x1E0C886F0]();
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1E0C886F8](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int sigprocmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x1E0C88710](*(_QWORD *)&a1, a2, a3);
}

int sigsuspend(const sigset_t *a1)
{
  return MEMORY[0x1E0C88718](a1);
}

uint64_t sigsuspend_NOCANCEL()
{
  return MEMORY[0x1E0C88720]();
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C88728](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int socketpair(int a1, int a2, int a3, int *a4)
{
  return MEMORY[0x1E0C88730](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C88738](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C88740](a1, a2);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C87418](*(_QWORD *)&a1, a2);
}

kern_return_t task_set_special_port(task_t task, int which_port, mach_port_t special_port)
{
  return MEMORY[0x1E0C88798](*(_QWORD *)&task, *(_QWORD *)&which_port, *(_QWORD *)&special_port);
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x1E0C887C8](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C887D0](a1);
}

int utimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x1E0C887D8](a1, a2);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1E0C887E0](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_region_64(vm_map_read_t target_task, vm_address_t *address, vm_size_t *size, vm_region_flavor_t flavor, vm_region_info_t info, mach_msg_type_number_t *infoCnt, mach_port_t *object_name)
{
  return MEMORY[0x1E0C88830](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flavor, info, infoCnt, object_name);
}

pid_t wait4(pid_t a1, int *a2, int a3, rusage *a4)
{
  return MEMORY[0x1E0C88848](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t write_NOCANCEL()
{
  return MEMORY[0x1E0C888E8]();
}

uint64_t writev_NOCANCEL()
{
  return MEMORY[0x1E0C888F8]();
}

