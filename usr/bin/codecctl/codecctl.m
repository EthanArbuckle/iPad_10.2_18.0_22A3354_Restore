unint64_t sub_100003094(FILE *a1, FILE *a2, unint64_t a3, unint64_t a4, int a5)
{
  unint64_t v10;
  unint64_t v11;
  char __str[32];

  do
  {
    do
    {
      printf("> ");
      fflush(__stdoutp);
      fgets(__str, 32, a1);
      v10 = strtoul(__str, 0, a5);
    }
    while (v10 < a3);
    v11 = v10;
  }
  while (v10 > a4);
  if (a2)
  {
    fprintf(a2, "%lu\n", v10);
    fflush(a2);
  }
  return v11;
}

uint64_t sub_100003184(char *__str, int __base)
{
  int v3;
  uint64_t result;
  char *v5;
  int v6;

  if (*__str != 48 || __str[1] != 98)
    return strtoul(__str, 0, __base);
  v3 = __str[2];
  if ((v3 & 0xFE) != 0x30)
    return 0;
  result = 0;
  v5 = __str + 3;
  do
  {
    result = (v3 == 49) | (unint64_t)(2 * result);
    v6 = *v5++;
    v3 = v6;
  }
  while ((v6 & 0xFE) == 0x30);
  return result;
}

void sub_1000031F0(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *sub_100003200(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_1000032B0();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_1000032B0()
{
  sub_1000032C4("basic_string");
}

void sub_1000032C4(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100003314(exception, a1);
}

void sub_100003300(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100003314(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100003338()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_100003360(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_1000032B0();
    v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17)
      v6 = a3 | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *v5 = v8;
    v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

_QWORD *sub_1000033EC(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  std::ostream::sentry::sentry(v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, &std::ctype<char>::id);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!sub_100003550(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  std::ostream::sentry::~sentry(v13);
  return a1;
}

void sub_1000034F4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  std::ostream::sentry::~sentry(&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1000034D4);
}

void sub_10000353C(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_100003550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      sub_10000368C(__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_100003670(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_10000368C(_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    sub_1000032B0();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

uint64_t *sub_100003734(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t sub_1000038CC(uint64_t a1)
{
  unsigned int v2;
  _BYTE v4[2];
  unsigned __int16 v5;

  *(_BYTE *)a1 = 1;
  *(_QWORD *)(a1 + 4) = 0x1000000001;
  *(_QWORD *)(a1 + 16) = __stdoutp;
  ioctl(0, 0x40087468uLL, v4);
  if (v5)
  {
    if (v5 < 0x11u)
      v2 = 1;
    else
      v2 = v5 / 0x11u;
    *(_DWORD *)(a1 + 4) = v2;
  }
  return a1;
}

uint64_t sub_100003954()
{
  _BYTE v1[2];
  unsigned __int16 v2;

  ioctl(0, 0x40087468uLL, v1);
  return v2;
}

FILE *sub_10000398C(uint64_t a1)
{
  FILE *result;
  BOOL v3;

  result = *(FILE **)(a1 + 16);
  if (result)
    v3 = result == __stdoutp;
  else
    v3 = 1;
  if (!v3 && result != __stderrp)
  {
    result = (FILE *)fclose(result);
    *(_QWORD *)(a1 + 16) = 0;
  }
  return result;
}

uint64_t sub_1000039DC(uint64_t a1)
{
  sub_10000398C(a1);
  return a1;
}

uint64_t sub_100003A00(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)(result + 4) = a2;
    *(_BYTE *)result = 0;
  }
  return result;
}

uint64_t sub_100003A10(uint64_t result, int a2)
{
  *(_DWORD *)(result + 8) = a2;
  return result;
}

uint64_t sub_100003A18(uint64_t a1, uint64_t a2)
{
  const char *v4;
  FILE *v5;
  FILE *v6;
  const char *v8;

  if (*(char *)(a2 + 23) < 0)
  {
    if (!*(_QWORD *)(a2 + 8))
      return 0;
    v4 = *(const char **)a2;
  }
  else
  {
    v4 = (const char *)a2;
    if (!*(_BYTE *)(a2 + 23))
      return 0;
  }
  v5 = fopen(v4, "w");
  if (v5)
  {
    v6 = v5;
    sub_10000398C(a1);
    *(_QWORD *)(a1 + 16) = v6;
    return 1;
  }
  if (*(char *)(a2 + 23) >= 0)
    v8 = (const char *)a2;
  else
    v8 = *(const char **)a2;
  fprintf(__stderrp, "Unable to open output file %s\n", v8);
  return 0;
}

uint64_t sub_100003AC0(uint64_t a1, uint64_t a2)
{
  FILE *v2;
  const char *v3;

  v2 = *(FILE **)(a1 + 16);
  if (*(char *)(a2 + 23) >= 0)
    v3 = (const char *)a2;
  else
    v3 = *(const char **)a2;
  return fprintf(v2, "%s\n", v3);
}

uint64_t sub_100003AFC(uint64_t result, int **a2, int a3, int a4)
{
  int *v4;
  uint64_t v7;
  unsigned int v8;
  double v9;
  double v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unint64_t v15;
  int v16;
  unint64_t v17;
  unsigned int v18;
  unint64_t v19;
  int *v20;

  v4 = *a2;
  v20 = a2[1];
  if (*a2 != v20)
  {
    v7 = result;
    do
    {
      v8 = *(_DWORD *)(v7 + 4);
      if (a3 == 4 && *(_BYTE *)v7)
      {
        v9 = (double)v8;
        if (*(_DWORD *)(v7 + 8) == 10)
          v10 = v9 / 1.8;
        else
          v10 = v9 / 1.5;
        v8 = v10;
      }
      if (v8 <= 1)
        v11 = 1;
      else
        v11 = v8;
      v12 = *((_QWORD *)v4 + 1);
      v13 = *((_QWORD *)v4 + 2) - v12;
      if (v13)
      {
        v14 = 0;
        LODWORD(v15) = 0;
        v16 = *v4;
        v17 = v13 >> 2;
        v18 = (v11 + ((unint64_t)(*((_QWORD *)v4 + 2) - v12) >> 2) - 1) / v11;
        do
        {
          v19 = v15 / v11 + v14 * v18;
          if (v17 > v19)
            sub_100003C80(v7, (v16 + v19 * a4), *(_DWORD *)(v12 + 4 * v19), a3, 0);
          if (v14 + 1 == v11 || v14 == -1)
            fputc(10, *(FILE **)(v7 + 16));
          else
            fwrite("  ", 2uLL, 1uLL, *(FILE **)(v7 + 16));
          v15 = (v15 + 1);
          v12 = *((_QWORD *)v4 + 1);
          v17 = (*((_QWORD *)v4 + 2) - v12) >> 2;
          v14 = v15 % v11;
        }
        while (v17 > v15 || v14);
      }
      result = fputc(10, *(FILE **)(v7 + 16));
      v4 += 8;
    }
    while (v4 != v20);
  }
  return result;
}

uint64_t sub_100003C80(uint64_t a1, uint64_t a2, unsigned int a3, int a4, int a5)
{
  int v9;
  uint64_t result;
  unint64_t v11;
  int v12;
  char __str[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  int v20;

  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  *(_OWORD *)__str = 0u;
  v15 = 0u;
  v9 = *(_DWORD *)(a1 + 8);
  if (v9 == 10)
  {
    switch(a4)
    {
      case 4:
        snprintf(__str, 0x64uLL, "R%012ud: %012d");
        break;
      case 2:
        snprintf(__str, 0x64uLL, "R%06ud: %06d");
        break;
      case 1:
        snprintf(__str, 0x64uLL, "R%06ud: %04d");
        break;
      default:
        fprintf(__stderrp, "Unexpected register width (%d).  Supported widths are 1 and 4\n");
        break;
    }
  }
  else if (v9 == 16)
  {
    switch(a4)
    {
      case 4:
        snprintf(__str, 0x64uLL, "%8Xh: 0x%08x");
        break;
      case 2:
        snprintf(__str, 0x64uLL, "%8Xh: 0x%04x");
        break;
      case 1:
        snprintf(__str, 0x64uLL, "%8Xh: 0x%02x");
        break;
      default:
        fprintf(__stderrp, "Unexpected register width (%d).  Supported widths are 1, 2, and 4\n");
        break;
    }
  }
  result = fputs(__str, *(FILE **)(a1 + 16));
  if (a5)
  {
    fwrite("    ", 4uLL, 1uLL, *(FILE **)(a1 + 16));
    v11 = (8 * a4);
    if ((_DWORD)v11)
    {
      do
      {
        if (((a3 >> (v11 - 1)) & 1) != 0)
          v12 = 49;
        else
          v12 = 48;
        fputc(v12, *(FILE **)(a1 + 16));
      }
      while (v11-- > 1);
    }
    return fputc(10, *(FILE **)(a1 + 16));
  }
  return result;
}

uint64_t sub_100003E80(uint64_t a1, unsigned int *a2, int a3)
{
  int v4;
  char __str[16];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  int v12;

  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  *(_OWORD *)__str = 0u;
  v7 = 0u;
  v4 = *(_DWORD *)(a1 + 8);
  if (v4 == 10)
  {
    snprintf(__str, 0x64uLL, "R%0*d: bitmask = %0*d, val = %0*d (patched count: %d)\n", (3 * a3));
  }
  else if (v4 == 16)
  {
    snprintf(__str, 0x64uLL, "%8Xh: bitmask = 0x%0*x, val = 0x%0*x (patched count: %d)\n", *a2);
  }
  return fputs(__str, *(FILE **)(a1 + 16));
}

double sub_100003F5C(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)a1 = a1 + 8;
  *(_DWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 56) = -1;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)&result = 16;
  *(_QWORD *)(a1 + 88) = 16;
  *(_WORD *)(a1 + 96) = 256;
  return result;
}

size_t sub_100003FA0(uint64_t a1, int a2)
{
  FILE *v3;
  const char *v4;
  size_t result;

  v3 = __stderrp;
  v4 = getprogname();
  fprintf(v3, "usage: %s [-d | -x] [-p] [-u] [-H val] [-c width] [-f file] [codec|index|default] [sequence...]\n", v4);
  fwrite("\t-d\tUse decimal register numbers\n", 0x21uLL, 1uLL, __stderrp);
  fwrite("\t-x\tUse hex register numbers\n", 0x1DuLL, 1uLL, __stderrp);
  fwrite("\t-H\tForce headphone detect: true/false\n", 0x27uLL, 1uLL, __stderrp);
  fwrite("\t-p\tPing codec (set exit status based on success)\n", 0x32uLL, 1uLL, __stderrp);
  fwrite("\t-u\tMatch codec on HAL UID rather than name\n", 0x2CuLL, 1uLL, __stderrp);
  fwrite("\t-c\tSet the column width (default is to expand to fit screen\n", 0x3DuLL, 1uLL, __stderrp);
  fwrite("\t-f\tDump output to file\n", 0x18uLL, 1uLL, __stderrp);
  fwrite("\t-a\tDump all codec settings then quit\n", 0x26uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  fwrite("Sequence options:", 0x11uLL, 1uLL, __stderrp);
  fwrite("\t<reg> <value> <sleep_ms> \tWrite register\n", 0x2AuLL, 1uLL, __stderrp);
  fwrite("\tdump                     \tRead all registers\n", 0x2EuLL, 1uLL, __stderrp);
  fwrite("\tread <reg>               \tRead single register\n", 0x30uLL, 1uLL, __stderrp);
  fwrite("\tread <reg>,<count>       \tRead register range\n", 0x2FuLL, 1uLL, __stderrp);
  fwrite("\twrite <reg> <value>      \tWrite single register\n", 0x31uLL, 1uLL, __stderrp);
  fwrite("\tmask <reg> <mask> <value>\tMask and write single register\n", 0x3AuLL, 1uLL, __stderrp);
  fwrite("\tpatch <reg> <mask> <value>\tThis command can patch a register bitmask value similar to above\n\t                          \t'mask' command format, but only by patching that bitmask value in driver.\n\t                          \tWhen the underlying driver write a bitmask value during the runtime,\n\t                          \tthe (address matched) bitmask patch will be applied. This can be used\n\t                          \tas driver tunable for some parameters, control logic register should\n\t                          \tnot be patched.\n", 0x213uLL, 1uLL, __stderrp);
  fwrite("\tpatch reset\t\t\tRemove all register bitmask patch, it will rest the underlying driver to its default behavior.\n", 0x6EuLL, 1uLL, __stderrp);
  fwrite("\tpatch list\t\t\tList all patched register bitmask list, it also show how many times underlying\n\t          \t\t\tdriver actually write the patched bitmask.\n", 0x96uLL, 1uLL, __stderrp);
  fputc(10, __stderrp);
  result = fwrite("Specify no sequence for interactive mode\n\n", 0x2AuLL, 1uLL, __stderrp);
  if (a2)
    exit(0);
  return result;
}

uint64_t sub_1000041DC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 97);
}

uint64_t sub_1000041E4(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t sub_1000041EC(uint64_t a1, std::string *this)
{
  int v4;
  std::string *v5;

  v4 = std::string::compare(this, "default");
  v5 = (std::string *)(a1 + 32);
  if (v4)
  {
    std::string::operator=(v5, this);
  }
  else
  {
    if (*(char *)(a1 + 55) < 0)
    {
      *(_QWORD *)(a1 + 40) = 5;
      v5 = *(std::string **)(a1 + 32);
    }
    else
    {
      *(_BYTE *)(a1 + 55) = 5;
    }
    strcpy((char *)v5, "Codec");
    *(_BYTE *)(a1 + 96) = 1;
  }
  return 1;
}

char *sub_100004274@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  if (result[55] < 0)
    return (char *)sub_100003360((_BYTE *)a2, *((void **)result + 4), *((_QWORD *)result + 5));
  *(_OWORD *)a2 = *((_OWORD *)result + 2);
  *(_QWORD *)(a2 + 16) = *((_QWORD *)result + 6);
  return result;
}

uint64_t sub_1000042A0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

BOOL sub_1000042A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (*(char *)(a2 + 23) >= 0)
    v2 = *(unsigned __int8 *)(a2 + 23);
  else
    v2 = *(_QWORD *)(a2 + 8);
  if (v2)
    std::string::operator=((std::string *)(a1 + 64), (const std::string *)a2);
  else
    fwrite("Empty output file name\n", 0x17uLL, 1uLL, __stderrp);
  return v2 != 0;
}

char *sub_10000430C@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  if (result[87] < 0)
    return (char *)sub_100003360((_BYTE *)a2, *((void **)result + 8), *((_QWORD *)result + 9));
  *(_OWORD *)a2 = *((_OWORD *)result + 4);
  *(_QWORD *)(a2 + 16) = *((_QWORD *)result + 10);
  return result;
}

uint64_t sub_100004338(uint64_t a1)
{
  return *(unsigned int *)(a1 + 88);
}

uint64_t sub_100004340(uint64_t a1)
{
  return *(unsigned int *)(a1 + 92);
}

uint64_t sub_100004348(uint64_t a1, int a2, char **a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char v17;
  char *v18;
  uint64_t v19;
  void *__p;
  char *v22;
  char *v23;

  while (2)
  {
    while (1)
    {
      v6 = getopt(a2, a3, "h?xdH:upc:f:a");
      if ((int)v6 <= 111)
        break;
      switch((_DWORD)v6)
      {
        case 'p':
          v7 = a1;
          v8 = 5;
LABEL_21:
          sub_1000046B8(v7, v8, 0);
          break;
        case 'u':
          *(_BYTE *)(a1 + 96) = 1;
          break;
        case 'x':
          *(_DWORD *)(a1 + 88) = 16;
          break;
        default:
          goto LABEL_33;
      }
    }
    switch((int)v6)
    {
      case 'a':
        v7 = a1;
        v8 = 4;
        goto LABEL_21;
      case 'b':
      case 'e':
        goto LABEL_33;
      case 'c':
        *(_DWORD *)(a1 + 92) = atoi(optarg);
        continue;
      case 'd':
        *(_DWORD *)(a1 + 88) = 10;
        continue;
      case 'f':
        sub_100003200(&__p, optarg);
        v6 = sub_1000042A8(a1, (uint64_t)&__p);
        v17 = v6;
        if (SHIBYTE(v23) < 0)
          operator delete(__p);
        if ((v17 & 1) == 0)
          goto LABEL_33;
        continue;
      default:
        if ((_DWORD)v6 == 72)
        {
          __p = 0;
          v22 = 0;
          v23 = 0;
          v9 = optarg;
          if (!strcmp(optarg, "true"))
          {
            v11 = (char *)sub_1000050D0((uint64_t)&v23, 1uLL);
            v12 = (char *)__p;
            v18 = v22;
            *(_QWORD *)v11 = 1;
            v14 = v11 + 8;
            v15 = v11;
            while (v18 != v12)
            {
              v19 = *((_QWORD *)v18 - 1);
              v18 -= 8;
              *((_QWORD *)v15 - 1) = v19;
              v15 -= 8;
            }
          }
          else
          {
            if (strcmp(v9, "false"))
              goto LABEL_29;
            v11 = (char *)sub_1000050D0((uint64_t)&v23, 1uLL);
            v12 = (char *)__p;
            v13 = v22;
            *(_QWORD *)v11 = 0;
            v14 = v11 + 8;
            v15 = v11;
            while (v13 != v12)
            {
              v16 = *((_QWORD *)v13 - 1);
              v13 -= 8;
              *((_QWORD *)v15 - 1) = v16;
              v15 -= 8;
            }
          }
          __p = v15;
          v22 = v14;
          v23 = &v11[8 * v10];
          if (v12)
            operator delete(v12);
          v22 = v14;
LABEL_29:
          sub_1000046B8(a1, 6, (uint64_t)&__p);
          if (__p)
          {
            v22 = (char *)__p;
            operator delete(__p);
          }
          continue;
        }
        if ((_DWORD)v6 == -1)
          return sub_100004768(a1, a2 - optind, (uint64_t)&a3[optind]);
LABEL_33:
        sub_100003FA0(v6, 0);
        return 0;
    }
  }
}

void sub_10000459C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1000045D4(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  uint64_t v16;

  v4 = a1 + 16;
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD **)(a1 + 8);
  if ((unint64_t)v6 >= v5)
  {
    v8 = *(_QWORD **)a1;
    v9 = ((uint64_t)v6 - *(_QWORD *)a1) >> 3;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61)
      sub_1000050BC();
    v11 = v5 - (_QWORD)v8;
    if (v11 >> 2 > v10)
      v10 = v11 >> 2;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v12 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      v13 = (char *)sub_1000050D0(v4, v12);
      v8 = *(_QWORD **)a1;
      v6 = *(_QWORD **)(a1 + 8);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[8 * v9];
    v15 = &v13[8 * v12];
    *(_QWORD *)v14 = *a2;
    v7 = v14 + 8;
    while (v6 != v8)
    {
      v16 = *--v6;
      *((_QWORD *)v14 - 1) = v16;
      v14 -= 8;
    }
    *(_QWORD *)a1 = v14;
    *(_QWORD *)(a1 + 8) = v7;
    *(_QWORD *)(a1 + 16) = v15;
    if (v8)
      operator delete(v8);
  }
  else
  {
    *v6 = *a2;
    v7 = v6 + 1;
  }
  *(_QWORD *)(a1 + 8) = v7;
}

uint64_t sub_1000046B8(uint64_t a1, int a2, uint64_t a3)
{
  char *v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  int v10;
  int *v11;

  v10 = a2;
  if (!a3)
  {
    v11 = &v10;
    v5 = (char *)(sub_10000524C((uint64_t **)a1, &v10, (uint64_t)&unk_10000BC60, &v11) + 5);
    v6 = 0;
    v7 = 0;
    v8 = 0;
    goto LABEL_5;
  }
  v11 = &v10;
  v5 = (char *)(sub_10000524C((uint64_t **)a1, &v10, (uint64_t)&unk_10000BC60, &v11) + 5);
  if (v5 != (char *)a3)
  {
    v6 = *(char **)a3;
    v7 = *(_QWORD *)(a3 + 8);
    v8 = (v7 - *(_QWORD *)a3) >> 3;
LABEL_5:
    sub_100005104(v5, v6, v7, v8);
  }
  *(_BYTE *)(a1 + 97) = 0;
  return 1;
}

uint64_t sub_100004768(uint64_t a1, unsigned int a2, uint64_t a3)
{
  char *v6;
  size_t v7;
  uint64_t v8;
  const char *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  std::string::size_type v13;
  std::string::size_type v14;
  int v15;
  char *v16;
  char *v17;
  char *v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  std::string::size_type v23;
  std::string::size_type v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  int64_t v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t result;
  uint64_t v33;
  uint64_t v34;
  std::string::size_type v35;
  std::string::size_type size;
  _QWORD *v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  int64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t *v44;
  std::string::size_type v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  std::string::size_type v49;
  std::string::size_type v50;
  void *v51;
  uint64_t v52;
  unint64_t v53;
  int64_t v54;
  unint64_t v55;
  char *v56;
  uint64_t *v57;
  std::string::size_type v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  unint64_t v62;
  int64_t v63;
  unint64_t v64;
  char *v65;
  const char *v66;
  uint64_t *v67;
  uint64_t v68;
  std::string::size_type v69;
  _QWORD *v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char *v75;
  unint64_t *v76;
  std::string::size_type v77;
  unint64_t v78;
  uint64_t *v79;
  std::string::size_type v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  std::string::size_type v84;
  std::string::size_type v85;
  void *v86;
  uint64_t v87;
  unint64_t v88;
  int64_t v89;
  unint64_t v90;
  char *v91;
  uint64_t *v92;
  std::string::size_type v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  std::string::size_type v97;
  void *v98;
  uint64_t v99;
  unint64_t v100;
  int64_t v101;
  unint64_t v102;
  char *v103;
  uint64_t *v104;
  std::string::size_type v105;
  uint64_t v106;
  int v107;
  uint64_t v108;
  std::string __p;

  if (a2)
  {
    v6 = *(char **)a3;
    v7 = strlen(*(const char **)a3);
    if (v7)
    {
      v8 = 0;
      while ((v6[v8] & 0x80000000) == 0 && (_DefaultRuneLocale.__runetype[v6[v8]] & 0x400) != 0)
      {
        if (v7 == ++v8)
          goto LABEL_7;
      }
      sub_100003200(&__p, v6);
      sub_1000041EC(a1, &__p);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
LABEL_7:
      *(_DWORD *)(a1 + 56) = atoi(v6) - 1;
    }
    if ((int)a2 >= 2)
    {
      v9 = *(const char **)(a3 + 8);
      if (!strcmp(v9, "dump"))
      {
        sub_1000046B8(a1, 1, 0);
        goto LABEL_148;
      }
      v10 = strcmp(v9, "write");
      if (a2 < 4 || v10)
      {
        v15 = strcmp(v9, "read");
        if (a2 >= 3 && !v15)
        {
          memset(&__p, 0, sizeof(__p));
          v16 = *(char **)(a3 + 16);
          v17 = strchr(v16, 44);
          if (v17)
          {
            v18 = v17;
            v19 = strtoul(v17 + 1, 0, 0);
            *v18 = 0;
            v16 = *(char **)(a3 + 16);
          }
          else
          {
            v19 = 1;
          }
          v33 = sub_100003184(v16, *(_DWORD *)(a1 + 88));
          v34 = v33;
          v35 = __p.__r_.__value_.__r.__words[2];
          size = __p.__r_.__value_.__l.__size_;
          if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
          {
            v38 = (void *)__p.__r_.__value_.__r.__words[0];
            v39 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
            v40 = v39 + 1;
            if ((unint64_t)(v39 + 1) >> 61)
              sub_1000050BC();
            v41 = __p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0];
            if ((uint64_t)(__p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0]) >> 2 > v40)
              v40 = v41 >> 2;
            if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF8)
              v42 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v42 = v40;
            if (v42)
            {
              v43 = (char *)sub_1000050D0((uint64_t)&__p.__r_.__value_.__r.__words[2], v42);
              size = __p.__r_.__value_.__l.__size_;
              v38 = (void *)__p.__r_.__value_.__r.__words[0];
            }
            else
            {
              v43 = 0;
            }
            v67 = (uint64_t *)&v43[8 * v39];
            v35 = (std::string::size_type)&v43[8 * v42];
            *v67 = v34;
            v37 = v67 + 1;
            while ((void *)size != v38)
            {
              v68 = *(_QWORD *)(size - 8);
              size -= 8;
              *--v67 = v68;
            }
            __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v67;
            __p.__r_.__value_.__l.__size_ = (std::string::size_type)v37;
            __p.__r_.__value_.__r.__words[2] = v35;
            if (v38)
            {
              operator delete(v38);
              v35 = __p.__r_.__value_.__r.__words[2];
            }
          }
          else
          {
            *(_QWORD *)__p.__r_.__value_.__l.__size_ = v33;
            v37 = (_QWORD *)(size + 8);
          }
          __p.__r_.__value_.__l.__size_ = (std::string::size_type)v37;
          if ((unint64_t)v37 >= v35)
          {
            v70 = (_QWORD *)__p.__r_.__value_.__r.__words[0];
            v71 = (uint64_t)((uint64_t)v37 - __p.__r_.__value_.__r.__words[0]) >> 3;
            v72 = v71 + 1;
            if ((unint64_t)(v71 + 1) >> 61)
              sub_1000050BC();
            v73 = v35 - __p.__r_.__value_.__r.__words[0];
            if (v73 >> 2 > v72)
              v72 = v73 >> 2;
            if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFF8)
              v74 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v74 = v72;
            if (v74)
            {
              v75 = (char *)sub_1000050D0((uint64_t)&__p.__r_.__value_.__r.__words[2], v74);
              v37 = (_QWORD *)__p.__r_.__value_.__l.__size_;
              v70 = (_QWORD *)__p.__r_.__value_.__r.__words[0];
            }
            else
            {
              v75 = 0;
            }
            v76 = (unint64_t *)&v75[8 * v71];
            v77 = (std::string::size_type)&v75[8 * v74];
            *v76 = v19;
            v69 = (std::string::size_type)(v76 + 1);
            while (v37 != v70)
            {
              v78 = *--v37;
              *--v76 = v78;
            }
            __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v76;
            __p.__r_.__value_.__l.__size_ = v69;
            __p.__r_.__value_.__r.__words[2] = v77;
            if (v70)
              operator delete(v70);
          }
          else
          {
            *v37 = v19;
            v69 = (std::string::size_type)(v37 + 1);
          }
          __p.__r_.__value_.__l.__size_ = v69;
          sub_1000046B8(a1, 0, (uint64_t)&__p);
          goto LABEL_146;
        }
        v20 = strcmp(v9, "mask");
        if (a2 < 5 || v20)
        {
          v31 = strcmp(v9, "patch");
          if ((_DWORD)v31)
          {
            sub_100003FA0(v31, 1);
            return 0;
          }
          memset(&__p, 0, sizeof(__p));
          v66 = *(const char **)(a3 + 16);
          if (!strcmp(v66, "reset"))
          {
            v108 = 1;
            sub_1000045D4((uint64_t)&__p, &v108);
          }
          else
          {
            if (!strcmp(v66, "list"))
            {
              v108 = 2;
            }
            else
            {
              v108 = 0;
              sub_1000045D4((uint64_t)&__p, &v108);
              v108 = sub_100003184(*(char **)(a3 + 16), *(_DWORD *)(a1 + 88));
              sub_1000045D4((uint64_t)&__p, &v108);
              v108 = sub_100003184(*(char **)(a3 + 32), *(_DWORD *)(a1 + 88));
              sub_1000045D4((uint64_t)&__p, &v108);
              v108 = sub_100003184(*(char **)(a3 + 24), *(_DWORD *)(a1 + 88));
            }
            sub_1000045D4((uint64_t)&__p, &v108);
          }
          sub_1000046B8(a1, 7, (uint64_t)&__p);
          goto LABEL_146;
        }
        memset(&__p, 0, sizeof(__p));
        v21 = sub_100003184(*(char **)(a3 + 16), *(_DWORD *)(a1 + 88));
        v22 = v21;
        v23 = __p.__r_.__value_.__l.__size_;
        if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
        {
          v60 = (void *)__p.__r_.__value_.__r.__words[0];
          v61 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
          v62 = v61 + 1;
          if ((unint64_t)(v61 + 1) >> 61)
            sub_1000050BC();
          v63 = __p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0];
          if ((uint64_t)(__p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0]) >> 2 > v62)
            v62 = v63 >> 2;
          if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFFF8)
            v64 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v64 = v62;
          if (v64)
          {
            v65 = (char *)sub_1000050D0((uint64_t)&__p.__r_.__value_.__r.__words[2], v64);
            v23 = __p.__r_.__value_.__l.__size_;
            v60 = (void *)__p.__r_.__value_.__r.__words[0];
          }
          else
          {
            v65 = 0;
          }
          v79 = (uint64_t *)&v65[8 * v61];
          v80 = (std::string::size_type)&v65[8 * v64];
          *v79 = v22;
          v24 = (std::string::size_type)(v79 + 1);
          while ((void *)v23 != v60)
          {
            v81 = *(_QWORD *)(v23 - 8);
            v23 -= 8;
            *--v79 = v81;
          }
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v79;
          __p.__r_.__value_.__l.__size_ = v24;
          __p.__r_.__value_.__r.__words[2] = v80;
          if (v60)
            operator delete(v60);
        }
        else
        {
          *(_QWORD *)__p.__r_.__value_.__l.__size_ = v21;
          v24 = v23 + 8;
        }
        __p.__r_.__value_.__l.__size_ = v24;
        v82 = sub_100003184(*(char **)(a3 + 32), *(_DWORD *)(a1 + 88));
        v83 = v82;
        v84 = __p.__r_.__value_.__l.__size_;
        if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
        {
          v86 = (void *)__p.__r_.__value_.__r.__words[0];
          v87 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
          v88 = v87 + 1;
          if ((unint64_t)(v87 + 1) >> 61)
            sub_1000050BC();
          v89 = __p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0];
          if ((uint64_t)(__p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0]) >> 2 > v88)
            v88 = v89 >> 2;
          if ((unint64_t)v89 >= 0x7FFFFFFFFFFFFFF8)
            v90 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v90 = v88;
          if (v90)
          {
            v91 = (char *)sub_1000050D0((uint64_t)&__p.__r_.__value_.__r.__words[2], v90);
            v84 = __p.__r_.__value_.__l.__size_;
            v86 = (void *)__p.__r_.__value_.__r.__words[0];
          }
          else
          {
            v91 = 0;
          }
          v92 = (uint64_t *)&v91[8 * v87];
          v93 = (std::string::size_type)&v91[8 * v90];
          *v92 = v83;
          v85 = (std::string::size_type)(v92 + 1);
          while ((void *)v84 != v86)
          {
            v94 = *(_QWORD *)(v84 - 8);
            v84 -= 8;
            *--v92 = v94;
          }
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v92;
          __p.__r_.__value_.__l.__size_ = v85;
          __p.__r_.__value_.__r.__words[2] = v93;
          if (v86)
            operator delete(v86);
        }
        else
        {
          *(_QWORD *)__p.__r_.__value_.__l.__size_ = v82;
          v85 = v84 + 8;
        }
        __p.__r_.__value_.__l.__size_ = v85;
        v95 = sub_100003184(*(char **)(a3 + 24), *(_DWORD *)(a1 + 88));
        v96 = v95;
        v97 = __p.__r_.__value_.__l.__size_;
        if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
        {
          v98 = (void *)__p.__r_.__value_.__r.__words[0];
          v99 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
          v100 = v99 + 1;
          if ((unint64_t)(v99 + 1) >> 61)
            sub_1000050BC();
          v101 = __p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0];
          if ((uint64_t)(__p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0]) >> 2 > v100)
            v100 = v101 >> 2;
          if ((unint64_t)v101 >= 0x7FFFFFFFFFFFFFF8)
            v102 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v102 = v100;
          if (v102)
          {
            v103 = (char *)sub_1000050D0((uint64_t)&__p.__r_.__value_.__r.__words[2], v102);
            v97 = __p.__r_.__value_.__l.__size_;
            v98 = (void *)__p.__r_.__value_.__r.__words[0];
          }
          else
          {
            v103 = 0;
          }
          v104 = (uint64_t *)&v103[8 * v99];
          v105 = (std::string::size_type)&v103[8 * v102];
          *v104 = v96;
          v50 = (std::string::size_type)(v104 + 1);
          while ((void *)v97 != v98)
          {
            v106 = *(_QWORD *)(v97 - 8);
            v97 -= 8;
            *--v104 = v106;
          }
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v104;
          __p.__r_.__value_.__l.__size_ = v50;
          __p.__r_.__value_.__r.__words[2] = v105;
          if (v98)
            operator delete(v98);
        }
        else
        {
          *(_QWORD *)__p.__r_.__value_.__l.__size_ = v95;
          v50 = v97 + 8;
        }
      }
      else
      {
        memset(&__p, 0, sizeof(__p));
        v11 = sub_100003184(*(char **)(a3 + 16), *(_DWORD *)(a1 + 88));
        v12 = v11;
        v13 = __p.__r_.__value_.__l.__size_;
        if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
        {
          v25 = (void *)__p.__r_.__value_.__r.__words[0];
          v26 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
          v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 61)
            sub_1000050BC();
          v28 = __p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0];
          if ((uint64_t)(__p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0]) >> 2 > v27)
            v27 = v28 >> 2;
          if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
            v29 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v29 = v27;
          if (v29)
          {
            v30 = (char *)sub_1000050D0((uint64_t)&__p.__r_.__value_.__r.__words[2], v29);
            v13 = __p.__r_.__value_.__l.__size_;
            v25 = (void *)__p.__r_.__value_.__r.__words[0];
          }
          else
          {
            v30 = 0;
          }
          v44 = (uint64_t *)&v30[8 * v26];
          v45 = (std::string::size_type)&v30[8 * v29];
          *v44 = v12;
          v14 = (std::string::size_type)(v44 + 1);
          while ((void *)v13 != v25)
          {
            v46 = *(_QWORD *)(v13 - 8);
            v13 -= 8;
            *--v44 = v46;
          }
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v44;
          __p.__r_.__value_.__l.__size_ = v14;
          __p.__r_.__value_.__r.__words[2] = v45;
          if (v25)
            operator delete(v25);
        }
        else
        {
          *(_QWORD *)__p.__r_.__value_.__l.__size_ = v11;
          v14 = v13 + 8;
        }
        __p.__r_.__value_.__l.__size_ = v14;
        v47 = sub_100003184(*(char **)(a3 + 24), *(_DWORD *)(a1 + 88));
        v48 = v47;
        v49 = __p.__r_.__value_.__l.__size_;
        if (__p.__r_.__value_.__l.__size_ >= __p.__r_.__value_.__r.__words[2])
        {
          v51 = (void *)__p.__r_.__value_.__r.__words[0];
          v52 = (uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3;
          v53 = v52 + 1;
          if ((unint64_t)(v52 + 1) >> 61)
            sub_1000050BC();
          v54 = __p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0];
          if ((uint64_t)(__p.__r_.__value_.__r.__words[2] - __p.__r_.__value_.__r.__words[0]) >> 2 > v53)
            v53 = v54 >> 2;
          if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFF8)
            v55 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v55 = v53;
          if (v55)
          {
            v56 = (char *)sub_1000050D0((uint64_t)&__p.__r_.__value_.__r.__words[2], v55);
            v49 = __p.__r_.__value_.__l.__size_;
            v51 = (void *)__p.__r_.__value_.__r.__words[0];
          }
          else
          {
            v56 = 0;
          }
          v57 = (uint64_t *)&v56[8 * v52];
          v58 = (std::string::size_type)&v56[8 * v55];
          *v57 = v48;
          v50 = (std::string::size_type)(v57 + 1);
          while ((void *)v49 != v51)
          {
            v59 = *(_QWORD *)(v49 - 8);
            v49 -= 8;
            *--v57 = v59;
          }
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v57;
          __p.__r_.__value_.__l.__size_ = v50;
          __p.__r_.__value_.__r.__words[2] = v58;
          if (v51)
            operator delete(v51);
        }
        else
        {
          *(_QWORD *)__p.__r_.__value_.__l.__size_ = v47;
          v50 = v49 + 8;
        }
      }
      __p.__r_.__value_.__l.__size_ = v50;
      sub_1000046B8(a1, 2, (uint64_t)&__p);
LABEL_146:
      if (__p.__r_.__value_.__r.__words[0])
      {
        __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
  }
LABEL_148:
  if ((*(char *)(a1 + 55) & 0x80000000) == 0)
  {
    if (*(_BYTE *)(a1 + 55))
      goto LABEL_150;
LABEL_153:
    if ((*(_DWORD *)(a1 + 56) & 0x80000000) != 0)
      return 1;
    v107 = 3;
LABEL_155:
    *(_DWORD *)(a1 + 24) = v107;
    return 1;
  }
  if (!*(_QWORD *)(a1 + 40))
    goto LABEL_153;
LABEL_150:
  if (*(_BYTE *)(a1 + 96))
  {
    v107 = 2;
    goto LABEL_155;
  }
  result = 1;
  *(_DWORD *)(a1 + 24) = 1;
  return result;
}

void sub_100004FD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL sub_100005048(uint64_t **a1, _DWORD *a2, char *a3)
{
  uint64_t *v3;
  uint64_t *v4;

  v4 = (uint64_t *)(a1 + 1);
  v3 = *a1;
  if (*a1 != (uint64_t *)(a1 + 1))
  {
    *a2 = *((_DWORD *)v3 + 8);
    if (v3 + 5 != (uint64_t *)a3)
      sub_100005104(a3, (char *)v3[5], v3[6], (v3[6] - v3[5]) >> 3);
    sub_100005364(a1, v3);
  }
  return v3 != v4;
}

void sub_1000050BC()
{
  sub_1000032C4("vector");
}

void *sub_1000050D0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    sub_100003338();
  return operator new(8 * a2);
}

char *sub_100005104(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 3)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61)
      sub_1000050BC();
    v10 = v8 >> 2;
    if (v8 >> 2 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = sub_10000520C(v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 3;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

char *sub_10000520C(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    sub_1000050BC();
  result = (char *)sub_1000050D0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

uint64_t **sub_10000524C(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  int v8;
  uint64_t **v9;
  int v10;
  _DWORD *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = operator new(0x40uLL);
    v11[8] = **a4;
    *((_QWORD *)v11 + 6) = 0;
    *((_QWORD *)v11 + 7) = 0;
    *((_QWORD *)v11 + 5) = 0;
    sub_100005310(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t *sub_100005310(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = sub_100003734(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_100005364(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v3;
  void *v4;

  v3 = sub_1000053A4(a1, a2);
  v4 = (void *)a2[5];
  if (v4)
  {
    a2[6] = (uint64_t)v4;
    operator delete(v4);
  }
  operator delete(a2);
  return v3;
}

uint64_t *sub_1000053A4(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  sub_100005414(v6, a2);
  return v3;
}

uint64_t *sub_100005414(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

uint64_t start(int a1, char **a2)
{
  int v4;
  __int128 *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  void *v16;
  char v17;
  uint64_t *v18;
  unint64_t v19;
  void *v21[2];
  char v22;
  void *__p[2];
  char v24;
  void *v25;
  uint64_t *v26[6];
  char v27;
  void *v28;
  char v29;

  sub_100003F5C((uint64_t)v26);
  if ((sub_100004348((uint64_t)v26, a1, a2) & 1) == 0)
    exit(2);
  v25 = 0;
  v4 = sub_1000041E4((uint64_t)v26);
  if (v4 == 1)
  {
    sub_100004274((char *)v26, (uint64_t)__p);
    sub_100006F34((uint64_t)__p, v21);
  }
  else
  {
    if (v4 != 2)
    {
      if (v4 == 3)
      {
        v5 = sub_1000075DC();
        v6 = sub_1000042A0((uint64_t)v26);
        if ((v6 & 0x80000000) == 0)
        {
          v7 = *(_QWORD *)v5;
          if (v6 < (unint64_t)((uint64_t)(*((_QWORD *)v5 + 1) - *(_QWORD *)v5) >> 3))
          {
            v8 = *(void **)(v7 + 8 * v6);
            *(_QWORD *)(v7 + 8 * v6) = 0;
            v25 = v8;
            sub_100006944((uint64_t *)(*(_QWORD *)v5 + 8 * v6 + 8), *((uint64_t **)v5 + 1), (uint64_t *)(*(_QWORD *)v5 + 8 * v6));
            v10 = v9;
            v11 = (_QWORD *)*((_QWORD *)v5 + 1);
            while (v11 != v10)
            {
              v13 = *--v11;
              v12 = v13;
              *v11 = 0;
              if (v13)
                (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
            }
            *((_QWORD *)v5 + 1) = v10;
            goto LABEL_17;
          }
        }
        fprintf(__stdoutp, "There is no device at index %d\n", v6 + 1);
        sub_100005B4C((uint64_t *)v5);
      }
      v8 = 0;
      goto LABEL_17;
    }
    sub_100004274((char *)v26, (uint64_t)__p);
    sub_100007304((uint64_t)__p, v21);
  }
  v8 = v21[0];
  v25 = v21[0];
  v21[0] = 0;
  if (v24 < 0)
    operator delete(__p[0]);
LABEL_17:
  sub_100003988((uint64_t)__p);
  v14 = sub_100004340((uint64_t)v26);
  sub_100003A00((uint64_t)__p, v14);
  v15 = sub_100004338((uint64_t)v26);
  sub_100003A10((uint64_t)__p, v15);
  sub_10000430C((char *)v26, (uint64_t)v21);
  if (v22 < 0)
  {
    v16 = v21[1];
    operator delete(v21[0]);
    if (!v16)
      goto LABEL_24;
  }
  else if (!v22)
  {
    goto LABEL_24;
  }
  sub_10000430C((char *)v26, (uint64_t)v21);
  v17 = sub_100003A18((uint64_t)__p, (uint64_t)v21);
  if (v22 < 0)
    operator delete(v21[0]);
  if ((v17 & 1) == 0)
    exit(2);
LABEL_24:
  sub_100005C8C(v26, (uint64_t)__p, (uint64_t *)&v25);
  if (!sub_1000041DC((uint64_t)v26))
  {
    sub_1000039DC((uint64_t)__p);
    if (!v8)
      goto LABEL_30;
    goto LABEL_28;
  }
  if (v8)
  {
    sub_1000061FC((uint64_t)v26, (uint64_t)__p, (uint64_t *)&v25);
    sub_1000039DC((uint64_t)__p);
LABEL_28:
    (*(void (**)(void *))(*(_QWORD *)v8 + 8))(v8);
    goto LABEL_30;
  }
  v18 = (uint64_t *)sub_1000075DC();
  fwrite("Choose a device:\n\n", 0x12uLL, 1uLL, __stdoutp);
  sub_100005B4C(v18);
  v19 = sub_100003094(__stdinp, 0, 1uLL, (v18[1] - *v18) >> 3, 0);
  sub_1000061FC((uint64_t)v26, (uint64_t)__p, (uint64_t *)(*v18 + 8 * v19 - 8));
  sub_1000039DC((uint64_t)__p);
LABEL_30:
  if (v29 < 0)
    operator delete(v28);
  if (v27 < 0)
    operator delete(v26[4]);
  sub_1000069B4((uint64_t)v26, v26[1]);
  return 0;
}

void sub_100005AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,char a24)
{
  uint64_t v24;

  if (v24)
    (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
  sub_1000063C0((uint64_t)&a24);
  _Unwind_Resume(a1);
}

void sub_100005B4C(uint64_t *a1)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  FILE *v5;
  int v6;
  void **v7;
  void **v8;
  void **v9;
  void *__p[2];
  char v11;
  void *v12[2];
  char v13;

  fprintf(__stdoutp, "%4s %s\n", (const char *)&unk_10000BAA7, "NAME");
  v2 = *a1;
  if (a1[1] != *a1)
  {
    v3 = 0;
    v4 = 1;
    do
    {
      v5 = __stdoutp;
      sub_100007AC8(*(_QWORD *)(v2 + 8 * v3), v12);
      v6 = v13;
      v7 = (void **)v12[0];
      sub_100007B54(*(_QWORD *)(v2 + 8 * v3), __p);
      if (v6 >= 0)
        v8 = v12;
      else
        v8 = v7;
      if (v11 >= 0)
        v9 = __p;
      else
        v9 = (void **)__p[0];
      fprintf(v5, "[%2d]: %s (%s)\n", v4, (const char *)v8, (const char *)v9);
      if (v11 < 0)
        operator delete(__p[0]);
      if (v13 < 0)
        operator delete(v12[0]);
      v3 = v4;
      v2 = *a1;
      ++v4;
    }
    while (v3 < (a1[1] - *a1) >> 3);
  }
}

void sub_100005C70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL sub_100005C8C(uint64_t **a1, uint64_t a2, uint64_t *a3)
{
  _BOOL4 v6;
  _BYTE *v7;
  unsigned int v8;
  char v9;
  CFBooleanRef v10;
  uint64_t v11;
  BOOL v12;
  unsigned int *v13;
  unsigned int *v14;
  int v15;
  __int128 *v16;
  uint64_t *v17;
  uint64_t *v18;
  char v19;
  FILE *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  char v27;
  unsigned int *v28;
  unsigned int *v29;
  uint64_t v30;
  unsigned int v31;
  int v32;
  _BOOL8 v33;
  FILE *v34;
  const char *v35;
  size_t v36;
  FILE *v37;
  const char *p_p;
  int v40;
  const char *v41;
  void *__p;
  unsigned int *v43;
  uint64_t v44;
  void *v45;
  _BYTE *v46;
  uint64_t v47;
  int v48;

  v48 = 0;
  v45 = 0;
  v46 = 0;
  v47 = 0;
  while (2)
  {
    v6 = sub_100005048(a1, &v48, (char *)&v45);
    if (v6)
    {
      switch(v48)
      {
        case 0:
          v7 = v45;
          if (v45 == v46)
          {
            v33 = 0;
            goto LABEL_75;
          }
          if (!*a3)
            break;
          if ((unint64_t)(v46 - (_BYTE *)v45) < 9)
            v8 = 1;
          else
            v8 = *((_DWORD *)v45 + 2);
          v25 = *(_DWORD *)v45;
          sub_100006A04(&__p, v8);
          v26 = sub_100008768(*a3, v25, v8, (char **)&__p);
          v27 = v26;
          if (v26)
          {
            v29 = (unsigned int *)__p;
            v28 = v43;
            if (__p == v43)
              goto LABEL_55;
            do
            {
              v30 = *v29;
              v31 = v29[1];
              v32 = sub_100007E08(*a3, *v29);
              sub_100003C80(a2, v30, v31, v32, 1);
              v29 += 2;
            }
            while (v29 != v28);
          }
          else
          {
            fprintf(__stderrp, "Unable to find register address %x\n", v25);
          }
          v29 = (unsigned int *)__p;
LABEL_55:
          if (v29)
          {
            v43 = v29;
            operator delete(v29);
          }
          if ((v27 & 1) == 0)
            break;
          continue;
        case 1:
          if (!*a3)
            goto LABEL_58;
          if (sub_10000640C(a3, a2, 1))
            continue;
          v37 = __stderrp;
          sub_100007AC8(*a3, &__p);
          if (v44 >= 0)
            p_p = (const char *)&__p;
          else
            p_p = (const char *)__p;
          fprintf(v37, "Failed to dump registers for %s\n", p_p);
          if (SHIBYTE(v44) < 0)
            operator delete(__p);
          goto LABEL_73;
        case 2:
          if ((unint64_t)(v46 - (_BYTE *)v45) < 9)
            goto LABEL_58;
          if ((unint64_t)(v46 - (_BYTE *)v45) < 0x11)
            v9 = sub_100007CF8(*a3, *(_DWORD *)v45, *((_DWORD *)v45 + 2));
          else
            v9 = sub_100007BFC(*a3, *(_DWORD *)v45, *((_DWORD *)v45 + 4), *((_DWORD *)v45 + 2));
          if ((v9 & 1) != 0)
            continue;
          fprintf(__stderrp, "Unable to write to the register address %x\n");
          goto LABEL_73;
        case 4:
          v16 = sub_1000075DC();
          v17 = *(uint64_t **)v16;
          v18 = (uint64_t *)*((_QWORD *)v16 + 1);
          if (*(uint64_t **)v16 == v18)
            continue;
          v19 = 1;
          do
          {
            while (!sub_10000640C(v17, a2, 1))
            {
              v20 = __stderrp;
              sub_100007AC8(*v17, &__p);
              v21 = (const char *)&__p;
              if (v44 < 0)
                v21 = (const char *)__p;
              fprintf(v20, "Failed to dump registers for %s\n", v21);
              if (SHIBYTE(v44) < 0)
                operator delete(__p);
              v19 = 0;
              if (++v17 == v18)
                goto LABEL_58;
            }
            ++v17;
          }
          while (v17 != v18);
          if ((v19 & 1) == 0)
            goto LABEL_58;
          continue;
        case 5:
          __p = 0;
          if (!*a3 || !sub_100009638(*a3, &__p))
            goto LABEL_63;
          if (__p == kCFBooleanTrue)
          {
            v40 = 0;
            v41 = "Ping success\n";
          }
          else
          {
            if (__p != kCFBooleanFalse)
            {
LABEL_63:
              v34 = __stdoutp;
              v35 = "ping error\n";
              v36 = 11;
LABEL_72:
              fwrite(v35, v36, 1uLL, v34);
LABEL_73:
              v33 = 0;
              goto LABEL_74;
            }
            v40 = 1;
            v41 = "Ping failure\n";
          }
          fwrite(v41, 0xDuLL, 1uLL, __stdoutp);
          exit(v40);
        case 6:
          if (v45 == v46 || !*a3)
            continue;
          v10 = *(_QWORD *)v45 ? kCFBooleanTrue : kCFBooleanFalse;
          if ((sub_1000096C0(*a3, v10) & 1) != 0)
            continue;
          fprintf(__stderrp, "Unable to force headphone detect (%s)\n");
          goto LABEL_73;
        case 7:
          if (v46 == v45)
            goto LABEL_58;
          v11 = *(unsigned int *)v45;
          if (v11 == 2)
          {
            __p = 0;
            v43 = 0;
            v44 = 0;
            v12 = sub_1000083A8(*a3, (uint64_t)&__p);
            v14 = (unsigned int *)__p;
            v13 = v43;
            if (__p != v43)
            {
              do
              {
                v15 = sub_100007E08(*a3, *v14);
                sub_100003E80(a2, v14, v15);
                v14 += 4;
              }
              while (v14 != v13);
              v14 = (unsigned int *)__p;
            }
            if (v14)
            {
              v43 = v14;
              operator delete(v14);
            }
            if (!v12)
            {
LABEL_71:
              v34 = __stderrp;
              v35 = "Unable to patch the register\n";
              v36 = 29;
              goto LABEL_72;
            }
          }
          else
          {
            v22 = *((_QWORD *)v45 + 2);
            v23 = *((_QWORD *)v45 + 3);
            v24 = *a3;
            LODWORD(__p) = *((_QWORD *)v45 + 1);
            HIDWORD(__p) = v23;
            v43 = (unsigned int *)v22;
            if ((sub_1000082A0(v24, v11, (uint64_t *)&__p) & 1) == 0)
              goto LABEL_71;
          }
          continue;
        default:
          fprintf(__stdoutp, "Unhandled Standalone operation %d\n");
          goto LABEL_73;
      }
    }
    break;
  }
LABEL_58:
  v33 = !v6;
LABEL_74:
  v7 = v45;
LABEL_75:
  if (v7)
  {
    v46 = v7;
    operator delete(v7);
  }
  return v33;
}

void sub_100006198(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL sub_1000061FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  int v7;
  unsigned int v8;
  int v9;
  uint64_t v11;
  char __str[32];

  v3 = *a3;
  if (*a3)
  {
    v11 = *a3;
    while (1)
    {
      fputc(10, __stdoutp);
      sub_10000640C(a3, a2, 0);
      fputc(10, __stdoutp);
      fwrite("? ", 2uLL, 1uLL, __stdoutp);
      fflush(__stdoutp);
      if (!fgets(__str, 32, __stdinp))
        break;
      v7 = sub_100004338(a1);
      v8 = sub_100003184(__str, v7);
      if (sub_100008078(*a3, v8))
      {
        fwrite("new value? ", 0xBuLL, 1uLL, __stdoutp);
        fflush(__stdoutp);
        fgets(__str, 32, __stdinp);
        v9 = sub_100003184(__str, 16);
        if ((sub_100007CF8(*a3, v8, v9) & 1) == 0)
          fprintf(__stderrp, "Failed to write register to %x\n", v8);
      }
    }
    v3 = v11;
  }
  else
  {
    fwrite("Critical error!!! No device has been selected!!!\n", 0x31uLL, 1uLL, __stderrp);
  }
  return v3 != 0;
}

uint64_t sub_1000063C0(uint64_t a1)
{
  if (*(char *)(a1 + 87) < 0)
    operator delete(*(void **)(a1 + 64));
  if (*(char *)(a1 + 55) < 0)
    operator delete(*(void **)(a1 + 32));
  sub_1000069B4(a1, *(_QWORD **)(a1 + 8));
  return a1;
}

BOOL sub_10000640C(uint64_t *a1, uint64_t a2, int a3)
{
  uint64_t v4;
  unsigned int v6;
  void *p_p;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _BOOL8 v18;
  int v19;
  int v20;
  int *v22[3];
  int *v23[3];
  void *__p;
  uint64_t v25;
  unsigned __int8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[10];
  char v31;
  uint64_t v32;

  v4 = *a1;
  if (!v4)
    return 0;
  if (a3)
  {
    v6 = sub_100003954();
    sub_100006790((uint64_t)&v27);
    sub_10000368C(&__p, v6, 61);
    if ((v26 & 0x80u) == 0)
      p_p = &__p;
    else
      p_p = __p;
    if ((v26 & 0x80u) == 0)
      v8 = v26;
    else
      v8 = v25;
    v9 = sub_1000033EC(&v29, (uint64_t)p_p, v8);
    sub_1000033EC(v9, (uint64_t)"\n", 1);
    if ((char)v26 < 0)
      operator delete(__p);
    v10 = sub_1000033EC(&v29, (uint64_t)"NAME : [", 8);
    sub_100007AC8(*a1, &__p);
    if ((v26 & 0x80u) == 0)
      v11 = &__p;
    else
      v11 = __p;
    if ((v26 & 0x80u) == 0)
      v12 = v26;
    else
      v12 = v25;
    v13 = sub_1000033EC(v10, (uint64_t)v11, v12);
    sub_1000033EC(v13, (uint64_t)"]\n", 2);
    if ((char)v26 < 0)
      operator delete(__p);
    sub_10000368C(&__p, v6, 61);
    if ((v26 & 0x80u) == 0)
      v14 = &__p;
    else
      v14 = __p;
    if ((v26 & 0x80u) == 0)
      v15 = v26;
    else
      v15 = v25;
    v16 = sub_1000033EC(&v29, (uint64_t)v14, v15);
    sub_1000033EC(v16, (uint64_t)"\n", 1);
    if ((char)v26 < 0)
      operator delete(__p);
    sub_100006E18((uint64_t)v30, &__p);
    sub_100003AC0(a2, (uint64_t)&__p);
    if ((char)v26 < 0)
      operator delete(__p);
    *(uint64_t *)((char *)&v27
    v29 = v17;
    if (v31 < 0)
      operator delete((void *)v30[8]);
    std::streambuf::~streambuf(v30);
    std::ios::~ios(&v32);
    v4 = *a1;
  }
  v27 = 0;
  v28 = 0;
  v29 = 0;
  sub_100008BC0(v4);
  v18 = sub_100008950(*a1, &v27, 1);
  if (v18)
  {
    memset(v23, 0, sizeof(v23));
    sub_100006A78(v23, v27, v28, (v28 - v27) >> 5);
    v19 = sub_1000080B0(*a1);
    sub_100003AFC(a2, v23, 1, v19);
    __p = v23;
    sub_100006D8C((void ***)&__p);
  }
  if (sub_100008950(*a1, &v27, 3))
  {
    memset(v22, 0, sizeof(v22));
    sub_100006A78(v22, v27, v28, (v28 - v27) >> 5);
    v20 = sub_1000080B0(*a1);
    sub_100003AFC(a2, v22, 4, v20);
    __p = v22;
    sub_100006D8C((void ***)&__p);
  }
  else
  {
    v18 = 0;
  }
  sub_100008C30(*a1);
  __p = &v27;
  sub_100006D8C((void ***)&__p);
  return v18;
}

void sub_10000670C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
  if (a21 < 0)
    operator delete(__p);
  sub_1000068BC((uint64_t)&a22);
  _Unwind_Resume(a1);
}

uint64_t sub_100006790(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::ios_base *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1 + 16;
  v3 = a1 + 24;
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + *(_QWORD *)(v4 - 24)) = v5;
  *(_QWORD *)(a1 + 8) = 0;
  v6 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v6, (void *)(a1 + 24));
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *(_QWORD *)(a1 + 16) = v7;
  *(_QWORD *)(v2 + *(_QWORD *)(v7 - 24)) = v8;
  *(_QWORD *)a1 = v9;
  std::streambuf::basic_streambuf(v3);
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_100006894(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  std::iostream::~basic_iostream(v2, v3 + 8);
  std::ios::~ios(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000068BC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = a1 + 24;
  *(_QWORD *)(a1 + 16) = v3;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf(v4);
  std::ios::~ios(a1 + 128);
  return a1;
}

uint64_t *sub_100006944(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;

  v4 = a1;
  if (a1 != a2)
  {
    do
    {
      v6 = *v4;
      *v4 = 0;
      v7 = *a3;
      *a3 = v6;
      if (v7)
        (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
      ++v4;
      ++a3;
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

void sub_1000069B4(uint64_t a1, _QWORD *a2)
{
  void *v4;

  if (a2)
  {
    sub_1000069B4(a1, *a2);
    sub_1000069B4(a1, a2[1]);
    v4 = (void *)a2[5];
    if (v4)
    {
      a2[6] = v4;
      operator delete(v4);
    }
    operator delete(a2);
  }
}

_QWORD *sub_100006A04(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_10000520C(a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_100006A5C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *sub_100006A78(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    sub_100006AFC(result, a4);
    result = (_QWORD *)sub_100006B70((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_100006ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  sub_100006D8C(&a9);
  _Unwind_Resume(a1);
}

char *sub_100006AFC(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 59)
    sub_1000050BC();
  result = (char *)sub_100006B3C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void *sub_100006B3C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    sub_100003338();
  return operator new(32 * a2);
}

uint64_t sub_100006B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD v8[3];
  char v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a4;
  v10 = a4;
  v11 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      *(_DWORD *)v4 = *(_DWORD *)v6;
      *(_QWORD *)(v4 + 16) = 0;
      *(_QWORD *)(v4 + 24) = 0;
      *(_QWORD *)(v4 + 8) = 0;
      sub_100006C28((_QWORD *)(v4 + 8), *(const void **)(v6 + 8), *(_QWORD *)(v6 + 16), (uint64_t)(*(_QWORD *)(v6 + 16) - *(_QWORD *)(v6 + 8)) >> 2);
      v4 = v11 + 32;
      v11 += 32;
      v6 += 32;
    }
    while (v6 != a3);
  }
  v9 = 1;
  sub_100006D14((uint64_t)v8);
  return v4;
}

void sub_100006C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_100006D14((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *sub_100006C28(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = sub_100006CA0(result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_100006C84(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_100006CA0(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    sub_1000050BC();
  result = (char *)sub_100006CE0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *sub_100006CE0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    sub_100003338();
  return operator new(4 * a2);
}

uint64_t sub_100006D14(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_100006D48(a1);
  return a1;
}

void sub_100006D48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  while (v1 != v2)
  {
    v3 = *(void **)(v1 - 24);
    if (v3)
    {
      *(_QWORD *)(v1 - 16) = v3;
      operator delete(v3);
    }
    v1 -= 32;
  }
}

void sub_100006D8C(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    sub_100006DCC((uint64_t *)v2);
    operator delete(**a1);
  }
}

void sub_100006DCC(uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;
  void *v4;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 32)
  {
    v4 = *(void **)(i - 24);
    if (v4)
    {
      *(_QWORD *)(i - 16) = v4;
      operator delete(v4);
    }
  }
  a1[1] = v2;
}

uint64_t sub_100006E18@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;
  unint64_t v4;
  const void *v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  result = sub_100006EB4(a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_1000032B0();
  v5 = (const void *)result;
  v6 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v9 = operator new(v7 + 1);
    a2[1] = v6;
    a2[2] = v8 | 0x8000000000000000;
    *a2 = v9;
    a2 = v9;
  }
  else
  {
    *((_BYTE *)a2 + 23) = v4;
    if (!v4)
      goto LABEL_9;
  }
  result = (uint64_t)memmove(a2, v5, v6);
LABEL_9:
  *((_BYTE *)a2 + v6) = 0;
  return result;
}

uint64_t sub_100006EB4(uint64_t a1)
{
  int v1;
  unint64_t v3;

  v1 = *(_DWORD *)(a1 + 96);
  if ((v1 & 0x10) != 0)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 88) < v3)
      *(_QWORD *)(a1 + 88) = v3;
    return *(_QWORD *)(a1 + 40);
  }
  else if ((v1 & 8) != 0)
  {
    return *(_QWORD *)(a1 + 16);
  }
  else
  {
    return 0;
  }
}

void **sub_100006F00(void **a1)
{
  void **v3;

  v3 = a1;
  sub_10000972C(&v3);
  return a1;
}

void sub_100006F34(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  void *v10[2];
  char v11;
  std::string v12;
  void *__p[2];
  char v14;
  char v15;

  v3 = *(unsigned __int8 *)(a1 + 23);
  if ((v3 & 0x80u) != 0)
    v3 = *(_QWORD *)(a1 + 8);
  *a2 = 0;
  if (!v3)
    return;
  sub_100003200(__p, "IONameMatch");
  v5 = sub_100007120(a1, (const char *)__p);
  v6 = v5;
  if (v14 < 0)
  {
    operator delete(__p[0]);
    if (v6)
      goto LABEL_6;
  }
  else if (v5)
  {
    goto LABEL_6;
  }
  if (*(char *)(a1 + 23) < 0)
  {
    v7 = *(_QWORD *)(a1 + 8);
    if (!v7)
      return;
    v8 = *(_QWORD *)a1 + v7;
  }
  else
  {
    v7 = *(unsigned __int8 *)(a1 + 23);
    if (!*(_BYTE *)(a1 + 23))
      return;
    v8 = a1 + v7;
  }
  if (*(_BYTE *)(v8 - 1) == 69)
  {
    std::string::basic_string(&v12, (const std::string *)a1, 0, v7 - 1, (std::allocator<char> *)&v15);
    sub_100003200(v10, "IONameMatch");
    v9 = sub_100007120((uint64_t)&v12, (const char *)v10);
    if (v11 < 0)
      operator delete(v10[0]);
    if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v12.__r_.__value_.__l.__data_);
    if (v9)
LABEL_6:
      operator new();
  }
}

void sub_1000070A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  _QWORD *v26;

  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  *v26 = 0;
  _Unwind_Resume(exception_object);
}

CFMutableDictionaryRef sub_100007120(uint64_t a1, const char *a2)
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v5;
  const char *v6;
  CFStringRef v7;
  CFStringRef v8;
  CFStringRef v9;
  BOOL v10;
  CFMutableDictionaryRef v11;
  CFMutableDictionaryRef v13;

  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable)
    return 0;
  v5 = Mutable;
  if (*(char *)(a1 + 23) >= 0)
    v6 = (const char *)a1;
  else
    v6 = *(const char **)a1;
  v7 = CFStringCreateWithCString(kCFAllocatorDefault, v6, 0);
  if (a2[23] < 0)
    a2 = *(const char **)a2;
  v8 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0);
  v9 = v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    CFDictionarySetValue(v5, v8, v7);
    v13 = sub_100007424(v5, 0);
    v11 = v13;
    if (!(_DWORD)v13)
      v11 = sub_100007424(v5, "IOService");
LABEL_20:
    CFRelease(v7);
    if (!v9)
      goto LABEL_15;
    goto LABEL_14;
  }
  v11 = 0;
  if (v7)
    goto LABEL_20;
  if (v8)
LABEL_14:
    CFRelease(v9);
LABEL_15:
  CFRelease(v5);
  return v11;
}

uint64_t sub_100007234(uint64_t a1, char a2)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v4;
  const __CFNumber *v5;
  const __CFNumber *v6;
  int v8;
  int valuePtr;

  *(_BYTE *)(a1 + 12) = a2;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 8), CFSTR("CodecRegisterStartIndex"), kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    v4 = CFProperty;
    valuePtr = 0;
    if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr))
      *(_DWORD *)(a1 + 16) = valuePtr;
    CFRelease(v4);
  }
  if (*(_BYTE *)(a1 + 12))
  {
    v5 = (const __CFNumber *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 8), CFSTR("CodecExtendedRegisterStartIndex"), kCFAllocatorDefault, 0);
    if (v5)
    {
      v6 = v5;
      v8 = 0;
      if (CFNumberGetValue(v5, kCFNumberSInt32Type, &v8))
        *(_DWORD *)(a1 + 16) = v8;
      CFRelease(v6);
    }
  }
  return 1;
}

void sub_100007304(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  unsigned int v5;
  unsigned int v6;
  void *__p[2];
  char v8;

  v3 = *(unsigned __int8 *)(a1 + 23);
  if ((v3 & 0x80u) != 0)
    v3 = *(_QWORD *)(a1 + 8);
  *a2 = 0;
  if (v3)
  {
    sub_100003200(__p, "CodecUID");
    v5 = sub_100007120(a1, (const char *)__p);
    v6 = v5;
    if (v8 < 0)
    {
      operator delete(__p[0]);
      if (!v6)
        return;
    }
    else if (!v5)
    {
      return;
    }
    operator new();
  }
}

void sub_1000073DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _QWORD *v15;
  uint64_t v16;

  *v15 = 0;
  (*(void (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  _Unwind_Resume(a1);
}

CFMutableDictionaryRef sub_100007424(const __CFDictionary *a1, const char *a2)
{
  const char *v3;
  CFMutableDictionaryRef result;
  __CFDictionary *v5;
  CFIndex Count;
  uint64_t i;
  void **values;
  void **v9;
  uint64_t v10;
  void **keys;
  void **v12;
  uint64_t v13;

  if (a2)
    v3 = a2;
  else
    v3 = "AppleEmbeddedAudio";
  result = IOServiceMatching(v3);
  if (result)
  {
    v5 = result;
    if (a1)
    {
      Count = CFDictionaryGetCount(a1);
      keys = 0;
      v12 = 0;
      v13 = 0;
      values = 0;
      v9 = 0;
      v10 = 0;
      sub_100007548((void **)&keys, Count);
      sub_100007548((void **)&values, Count);
      CFDictionaryGetKeysAndValues(a1, (const void **)keys, (const void **)values);
      if (Count >= 1)
      {
        for (i = 0; i != Count; ++i)
          CFDictionarySetValue(v5, keys[i], values[i]);
      }
      if (values)
      {
        v9 = values;
        operator delete(values);
      }
      if (keys)
      {
        v12 = keys;
        operator delete(keys);
      }
    }
    return (CFMutableDictionaryRef)IOServiceGetMatchingService(kIOMainPortDefault, v5);
  }
  return result;
}

void sub_100007518(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

void sub_100007548(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      sub_1000050BC();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)sub_1000050D0(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_QWORD *)v10 - 1);
        v10 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

__int128 *sub_1000075DC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  const __CFDictionary *v7;
  CFTypeRef v8;
  __int128 v9;
  __int128 v10;
  int v11;
  io_iterator_t existing[2];
  CFTypeRef *v13;
  __int128 v14;
  CFTypeRef v15;
  CFTypeRef cf;

  *(_QWORD *)existing = 0;
  v9 = 0u;
  v10 = 0u;
  v11 = 1065353216;
  v1 = (_QWORD *)*((_QWORD *)&xmmword_100010000 + 1);
  v0 = (_QWORD *)xmmword_100010000;
  while (v1 != v0)
  {
    v3 = *--v1;
    v2 = v3;
    *v1 = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  }
  *((_QWORD *)&xmmword_100010000 + 1) = v0;
  v4 = IOServiceMatching("AppleEmbeddedAudio");
  if (!IOServiceGetMatchingServices(kIOMainPortDefault, v4, &existing[1]))
  {
    while (1)
    {
      existing[0] = IOIteratorNext(existing[1]);
      if (!existing[0])
        break;
      sub_100009E70((uint64_t)&v9, existing, existing);
    }
  }
  if (existing[1])
    IOObjectRelease(existing[1]);
  LODWORD(v7) = 1;
  sub_10000A2C0((uint64_t)&v15, "AppleAudioHardwareInterface", (int *)&v7);
  v13 = &v15;
  *(_QWORD *)&v14 = 1;
  v8 = sub_1000097A8((uint64_t)&v13);
  if (cf)
    CFRelease(cf);
  if (v15)
    CFRelease(v15);
  sub_10000A480((uint64_t)&v15, "IOPropertyMatch", &v8);
  v13 = &v15;
  *(_QWORD *)&v14 = 1;
  v5 = sub_1000097A8((uint64_t)&v13);
  v7 = v5;
  if (cf)
    CFRelease(cf);
  if (v15)
    CFRelease(v15);
  v7 = 0;
  if (!IOServiceGetMatchingServices(kIOMainPortDefault, v5, &existing[1]))
  {
    while (1)
    {
      existing[0] = IOIteratorNext(existing[1]);
      if (!existing[0])
        break;
      sub_100009E70((uint64_t)&v9, existing, existing);
    }
  }
  if ((_QWORD)v10)
    operator new();
  if (existing[1])
    IOObjectRelease(existing[1]);
  if (v8)
    CFRelease(v8);
  sub_100009E28((uint64_t)&v9);
  return &xmmword_100010000;
}

void sub_100007940(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  if (a2)
    sub_1000031F0(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000079E0(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 8);
  if (v2)
    CFRelease(v2);
  if (*(_QWORD *)a1)
    CFRelease(*(CFTypeRef *)a1);
  return a1;
}

const void **sub_100007A20(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

uint64_t sub_100007A50(uint64_t a1)
{
  *(_QWORD *)a1 = off_10000C3C8;
  sub_10000A4C0(a1 + 24, *(_QWORD **)(a1 + 32));
  return a1;
}

void sub_100007A84(uint64_t a1)
{
  *(_QWORD *)a1 = off_10000C3C8;
  sub_10000A4C0(a1 + 24, *(_QWORD **)(a1 + 32));
  operator delete();
}

_QWORD *sub_100007AC8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  char *v3;
  _OWORD v5[8];

  memset(v5, 0, sizeof(v5));
  if (IORegistryEntryGetName(*(_DWORD *)(a1 + 8), (char *)v5))
    v3 = (char *)&unk_10000BAA7;
  else
    v3 = (char *)v5;
  return sub_100003200(a2, v3);
}

_QWORD *sub_100007B54@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  char *v3;
  io_registry_entry_t parent;
  char name[136];

  parent = 0;
  if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 8), "IOService", &parent)
    || (memset(name, 0, 128), IORegistryEntryGetName(parent, name)))
  {
    v3 = (char *)&unk_10000BAA7;
  }
  else
  {
    v3 = name;
  }
  return sub_100003200(a2, v3);
}

uint64_t sub_100007BFC(uint64_t a1, int a2, unsigned int a3, int a4)
{
  uint64_t result;
  int v9;

  v9 = 0;
  result = sub_100007C70(a1, a2, &v9);
  if ((_DWORD)result)
    return sub_100007CF8(a1, a2, v9 & ~a3 | a4 & a3);
  return result;
}

uint64_t sub_100007C70(uint64_t a1, int a2, _DWORD *a3)
{
  uint64_t v4;
  char *v5;
  int v6;
  char *v8;
  char *v9;
  uint64_t v10;

  v8 = 0;
  v9 = 0;
  v10 = 0;
  v4 = sub_100008768(a1, a2, 1u, &v8);
  v5 = v8;
  if (v9 == v8)
    v6 = 0;
  else
    v6 = v4;
  if (v6 == 1)
  {
    *a3 = *((_DWORD *)v8 + 1);
LABEL_7:
    v9 = v5;
    operator delete(v5);
    return v4;
  }
  if (v8)
    goto LABEL_7;
  return v4;
}

void sub_100007CDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_100007CF8(uint64_t a1, int a2, int a3)
{
  CFMutableArrayRef Mutable;
  __CFArray *v5;
  CFNumberRef v6;
  CFNumberRef v7;
  CFNumberRef v8;
  CFNumberRef v9;
  CFArrayRef v10;
  CFArrayRef v11;
  uint64_t v12;
  CFTypeRef cf;
  int v15;
  int valuePtr;

  v15 = a3;
  valuePtr = a2;
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 3, &kCFTypeArrayCallBacks);
  cf = Mutable;
  if (!Mutable)
    return 0;
  v5 = Mutable;
  v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  if (v6)
  {
    v7 = v6;
    CFArrayAppendValue(v5, v6);
    CFRelease(v7);
  }
  v8 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v15);
  if (v8)
  {
    v9 = v8;
    CFArrayAppendValue(v5, v8);
    CFRelease(v9);
  }
  v10 = CFArrayCreate(kCFAllocatorDefault, &cf, 1, &kCFTypeArrayCallBacks);
  if (v10)
  {
    v11 = v10;
    v12 = sub_100008140(a1, CFSTR("CodecRegisterData"), v10);
    CFRelease(v11);
  }
  else
  {
    v12 = 0;
  }
  CFRelease(cf);
  return v12;
}

uint64_t sub_100007E08(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  uint64_t *v10;
  void *__p;
  void *v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 40))
  {
    __p = 0;
    v13 = 0;
    v14 = 0;
    sub_100007EC4(a1, (unint64_t **)&__p, 0);
    if (__p)
    {
      v13 = __p;
      operator delete(__p);
    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  v5 = a1 + 32;
  v4 = v6;
  if (!v6)
    return 0;
  v7 = v5;
  do
  {
    v8 = *(_DWORD *)(v4 + 28);
    v9 = v8 >= a2;
    if (v8 >= a2)
      v10 = (uint64_t *)v4;
    else
      v10 = (uint64_t *)(v4 + 8);
    if (v9)
      v7 = v4;
    v4 = *v10;
  }
  while (*v10);
  if (v7 != v5 && *(_DWORD *)(v7 + 28) <= a2)
    return *(unsigned int *)(v7 + 32);
  else
    return 0;
}

void sub_100007EA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL sub_100007EC4(uint64_t a1, unint64_t **a2, int a3)
{
  uint64_t v4;
  _QWORD *v5;
  int v6;
  int v7;
  unsigned int *v8;
  unsigned int *v9;
  int v10;
  int v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  unint64_t *v19;
  char *v20;
  char *v21;
  unint64_t v22;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void **v30;

  v27 = 0;
  v28 = 0;
  v29 = 0;
  v24 = sub_100008950(a1, &v27, a3);
  if (v24)
  {
    v4 = v27;
    v25 = v28;
    if (v27 != v28)
    {
      v5 = a2 + 2;
      do
      {
        v6 = *(_DWORD *)v4;
        v7 = sub_1000080B0(a1);
        v9 = *(unsigned int **)(v4 + 8);
        v8 = *(unsigned int **)(v4 + 16);
        if (v9 != v8)
        {
          v10 = v7;
          v11 = 0;
          v12 = a2[1];
          do
          {
            v13 = (v6 + v11 * v10) | ((unint64_t)*v9 << 32);
            if ((unint64_t)v12 >= *v5)
            {
              v14 = v12 - *a2;
              if ((unint64_t)(v14 + 1) >> 61)
                sub_1000050BC();
              v15 = *v5 - (_QWORD)*a2;
              v16 = v15 >> 2;
              if (v15 >> 2 <= (unint64_t)(v14 + 1))
                v16 = v14 + 1;
              if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
                v17 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v17 = v16;
              if (v17)
                v18 = (char *)sub_1000050D0((uint64_t)(a2 + 2), v17);
              else
                v18 = 0;
              v19 = (unint64_t *)&v18[8 * v14];
              *v19 = v13;
              v12 = v19 + 1;
              v21 = (char *)*a2;
              v20 = (char *)a2[1];
              if (v20 != (char *)*a2)
              {
                do
                {
                  v22 = *((_QWORD *)v20 - 1);
                  v20 -= 8;
                  *--v19 = v22;
                }
                while (v20 != v21);
                v20 = (char *)*a2;
              }
              *a2 = v19;
              a2[1] = v12;
              a2[2] = (unint64_t *)&v18[8 * v17];
              if (v20)
                operator delete(v20);
            }
            else
            {
              *v12++ = v13;
            }
            a2[1] = v12;
            ++v11;
            ++v9;
          }
          while (v9 != v8);
        }
        v4 += 32;
      }
      while (v4 != v25);
    }
  }
  v30 = (void **)&v27;
  sub_100006D8C(&v30);
  return v24;
}

void sub_100008050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void **a16)
{
  a16 = (void **)&a13;
  sub_100006D8C(&a16);
  _Unwind_Resume(a1);
}

uint64_t sub_100008078(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  uint64_t result;
  int v5;

  v3 = *(_DWORD *)(a1 + 16);
  LODWORD(result) = sub_100007C70(a1, a2, &v5);
  if (v3 <= a2)
    return result;
  else
    return 0;
}

uint64_t sub_1000080B0(uint64_t a1)
{
  const __CFNumber *CFProperty;
  const __CFNumber *v2;
  CFTypeID v3;
  uint64_t v4;
  int valuePtr;

  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 8), CFSTR("CodecRegisterAddressIncrement"), kCFAllocatorDefault, 0);
  if (!CFProperty)
    return 1;
  v2 = CFProperty;
  v3 = CFGetTypeID(CFProperty);
  if (v3 != CFNumberGetTypeID())
    return 1;
  valuePtr = 0;
  CFNumberGetValue(v2, kCFNumberSInt32Type, &valuePtr);
  if (valuePtr <= 1)
    v4 = 1;
  else
    v4 = valuePtr;
  CFRelease(v2);
  return v4;
}

uint64_t sub_100008140(uint64_t a1, const __CFString *a2, const void *a3)
{
  char *v5;
  void *__p;
  char name[136];

  if (IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 8), a2, a3))
  {
    memset(name, 0, 128);
    if (IORegistryEntryGetName(*(_DWORD *)(a1 + 8), name))
      v5 = (char *)&unk_10000BAA7;
    else
      v5 = name;
    sub_100003200(&__p, v5);
    sub_10000957C(a2, name);
  }
  return 1;
}

void sub_100008264(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0)
    operator delete(__p);
  if (a17 < 0)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000082A0(uint64_t a1, int a2, uint64_t *a3)
{
  CFMutableArrayRef Mutable;
  __CFArray *v5;
  uint64_t i;
  CFNumberRef v7;
  CFNumberRef v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  int v13;

  v11 = a2;
  v12 = *a3;
  v13 = *((_DWORD *)a3 + 2);
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 4, &kCFTypeArrayCallBacks);
  if (!Mutable)
    return 0;
  v5 = Mutable;
  for (i = 0; i != 16; i += 4)
  {
    v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&v11 + i);
    if (v7)
    {
      v8 = v7;
      CFArrayAppendValue(v5, v7);
      CFRelease(v8);
    }
  }
  v9 = sub_100008140(a1, CFSTR("CodecRegisterPatch"), v5);
  CFRelease(v5);
  return v9;
}

BOOL sub_1000083A8(uint64_t a1, uint64_t a2)
{
  const __CFString *v4;
  const __CFString *v5;
  _BOOL8 v6;
  const __CFArray *v7;
  CFTypeID v8;
  CFIndex v9;
  unsigned int v10;
  const __CFArray *ValueAtIndex;
  const __CFNumber *v12;
  int v13;
  const __CFNumber *v14;
  int v15;
  const __CFNumber *v16;
  int v17;
  const __CFNumber *v18;
  int v19;
  unint64_t v20;
  _DWORD *v21;
  _DWORD *v22;
  _DWORD *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  CFTypeRef cf;
  int valuePtr;

  v4 = CFStringCreateWithCString(kCFAllocatorDefault, "CodecRegisterPatch", 0);
  if (!v4)
    return 0;
  v5 = v4;
  cf = 0;
  v6 = sub_1000085F0(a1, v4, &cf);
  if (v6)
  {
    v7 = (const __CFArray *)cf;
    v8 = CFGetTypeID(cf);
    if (v8 == CFArrayGetTypeID() && CFArrayGetCount(v7) >= 1)
    {
      v9 = 0;
      v10 = 0;
      do
      {
        ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v7, v9);
        valuePtr = 0;
        v12 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
        CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr);
        v13 = valuePtr;
        valuePtr = 0;
        v14 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 1);
        CFNumberGetValue(v14, kCFNumberSInt32Type, &valuePtr);
        v15 = valuePtr;
        valuePtr = 0;
        v16 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 2);
        CFNumberGetValue(v16, kCFNumberSInt32Type, &valuePtr);
        v17 = valuePtr;
        valuePtr = 0;
        v18 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 3);
        CFNumberGetValue(v18, kCFNumberSInt32Type, &valuePtr);
        v19 = valuePtr;
        v21 = *(_DWORD **)(a2 + 8);
        v20 = *(_QWORD *)(a2 + 16);
        if ((unint64_t)v21 >= v20)
        {
          v23 = *(_DWORD **)a2;
          v24 = ((uint64_t)v21 - *(_QWORD *)a2) >> 4;
          v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 60)
            sub_1000050BC();
          v26 = v20 - (_QWORD)v23;
          if (v26 >> 3 > v25)
            v25 = v26 >> 3;
          if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0)
            v27 = 0xFFFFFFFFFFFFFFFLL;
          else
            v27 = v25;
          if (v27)
          {
            v28 = (char *)sub_100009B18(a2 + 16, v27);
            v23 = *(_DWORD **)a2;
            v21 = *(_DWORD **)(a2 + 8);
          }
          else
          {
            v28 = 0;
          }
          v29 = &v28[16 * v24];
          *(_DWORD *)v29 = v13;
          *((_DWORD *)v29 + 1) = v15;
          *((_DWORD *)v29 + 2) = v17;
          *((_DWORD *)v29 + 3) = v19;
          v30 = v29;
          if (v21 != v23)
          {
            do
            {
              *((_OWORD *)v30 - 1) = *((_OWORD *)v21 - 1);
              v30 -= 16;
              v21 -= 4;
            }
            while (v21 != v23);
            v23 = *(_DWORD **)a2;
          }
          v22 = v29 + 16;
          *(_QWORD *)a2 = v30;
          *(_QWORD *)(a2 + 8) = v29 + 16;
          *(_QWORD *)(a2 + 16) = &v28[16 * v27];
          if (v23)
            operator delete(v23);
        }
        else
        {
          *v21 = v13;
          v21[1] = v15;
          v22 = v21 + 4;
          v21[2] = v17;
          v21[3] = v19;
        }
        *(_QWORD *)(a2 + 8) = v22;
        v9 = ++v10;
      }
      while (CFArrayGetCount(v7) > v10);
    }
  }
  CFRelease(v5);
  return v6;
}

BOOL sub_1000085F0(uint64_t a1, const __CFString *a2, _QWORD *a3)
{
  CFTypeRef CFProperty;
  char *v7;
  void *__p;
  char name[136];

  CFProperty = IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 8), a2, kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    memset(name, 0, 128);
    if (IORegistryEntryGetName(*(_DWORD *)(a1 + 8), name))
      v7 = (char *)&unk_10000BAA7;
    else
      v7 = name;
    sub_100003200(&__p, v7);
    sub_10000957C(a2, name);
  }
  *a3 = CFProperty;
  return CFProperty != 0;
}

void sub_10000872C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a23 < 0)
    operator delete(__p);
  if (a17 < 0)
    operator delete(a12);
  _Unwind_Resume(exception_object);
}

uint64_t sub_100008768(uint64_t a1, int a2, unsigned int a3, char **a4)
{
  _BOOL4 v8;
  _DWORD *v9;
  _DWORD *v10;
  char v11;
  char *v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v25;
  void *__p;
  _DWORD *v28;
  uint64_t v29;

  if (!a3)
    return 1;
  a4[1] = *a4;
  __p = 0;
  v28 = 0;
  v29 = 0;
  v8 = sub_100007EC4(a1, (unint64_t **)&__p, 0);
  v9 = __p;
  if (!v8 || (v10 = v28, __p == v28))
  {
    v25 = 0;
    if (!__p)
      return v25;
LABEL_35:
    v28 = v9;
    operator delete(v9);
    return v25;
  }
  v11 = 0;
  do
  {
    if (*v9 == a2)
      v11 = 1;
    if ((v11 & 1) != 0)
    {
      if (a2 + sub_1000080B0(a1) * a3 <= *v9)
        break;
      v14 = a4[1];
      v13 = (unint64_t)a4[2];
      if ((unint64_t)v14 >= v13)
      {
        v15 = (v14 - *a4) >> 3;
        if ((unint64_t)(v15 + 1) >> 61)
          sub_1000050BC();
        v16 = v13 - (_QWORD)*a4;
        v17 = v16 >> 2;
        if (v16 >> 2 <= (unint64_t)(v15 + 1))
          v17 = v15 + 1;
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
          v18 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v18 = v17;
        if (v18)
          v19 = (char *)sub_1000050D0((uint64_t)(a4 + 2), v18);
        else
          v19 = 0;
        v20 = &v19[8 * v15];
        *(_QWORD *)v20 = *(_QWORD *)v9;
        v12 = v20 + 8;
        v22 = *a4;
        v21 = a4[1];
        if (v21 != *a4)
        {
          do
          {
            v23 = *((_QWORD *)v21 - 1);
            v21 -= 8;
            *((_QWORD *)v20 - 1) = v23;
            v20 -= 8;
          }
          while (v21 != v22);
          v21 = *a4;
        }
        *a4 = v20;
        a4[1] = v12;
        a4[2] = &v19[8 * v18];
        if (v21)
          operator delete(v21);
      }
      else
      {
        *(_QWORD *)v14 = *(_QWORD *)v9;
        v12 = v14 + 8;
      }
      a4[1] = v12;
    }
    else
    {
      v12 = a4[1];
    }
    v9 += 2;
  }
  while (a3 > (unint64_t)((v12 - *a4) >> 3) && v9 != v10);
  v9 = __p;
  v25 = v11 & 1;
  if (__p)
    goto LABEL_35;
  return v25;
}

void sub_10000892C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL sub_100008950(uint64_t a1, uint64_t *a2, int a3)
{
  _BOOL8 v6;
  const void *v7;
  int v8;
  CFTypeID v9;
  CFIndex Count;
  uint64_t v11;
  uint64_t v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  const __CFNumber *ValueAtIndex;
  uint64_t v17;
  const __CFData *v18;
  uint64_t v19;
  uint64_t v20;
  CFIndex v21;
  uint64_t v22;
  BOOL v23;
  int v24;
  CFTypeID v25;
  unsigned int v26;
  CFIndex Length;
  int v28;
  uint64_t v29;
  uint64_t v31;
  unsigned int valuePtr;

  v6 = sub_100008BC0(a1);
  if (v6)
  {
    v7 = *(const void **)(a1 + 48);
    v31 = *(_QWORD *)(a1 + 40);
    v8 = *(unsigned __int8 *)(a1 + 12);
    v9 = CFGetTypeID(v7);
    if (v9 == CFArrayGetTypeID())
    {
      sub_100006DCC(a2);
      Count = CFArrayGetCount((CFArrayRef)v7);
      if (Count >= 0)
        v11 = Count;
      else
        v11 = Count + 1;
      sub_100008C74(a2, v11 >> 1);
      if (CFArrayGetCount((CFArrayRef)v7) >= 2)
      {
        v12 = 0;
        v13 = v8 != 0;
        v14 = 1;
        v15 = 1;
        while (1)
        {
          ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex((CFArrayRef)v7, v14 - 1);
          valuePtr = 0;
          if (ValueAtIndex && CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr))
          {
            v17 = valuePtr;
            v13 |= valuePtr < v12;
            v18 = (const __CFData *)CFArrayGetValueAtIndex((CFArrayRef)v7, v14);
            if ((v13 & 1) != 0)
            {
              if (a3 != 1)
              {
                v24 = 4;
                goto LABEL_23;
              }
              v13 = 1;
            }
            else
            {
              if (a3 != 3)
              {
                v24 = 1;
LABEL_23:
                if (!sub_100008D04(a1, (uint64_t)a2, v18, valuePtr, v24, v19, v31 == 0))
                  fprintf(__stderrp, "Error encountered while reading register data for register address %x\n", valuePtr);
                goto LABEL_14;
              }
              v13 = 0;
            }
          }
          else
          {
            v17 = v12;
          }
LABEL_14:
          v20 = v15;
          v21 = CFArrayGetCount((CFArrayRef)v7);
          if (v21 >= 0)
            v22 = v21;
          else
            v22 = v21 + 1;
          ++v15;
          v14 += 2;
          v23 = v20 < v22 >> 1;
          v12 = v17;
          if (!v23)
            goto LABEL_33;
        }
      }
      goto LABEL_33;
    }
    v25 = CFGetTypeID(v7);
    if (v25 != CFDataGetTypeID())
    {
LABEL_33:
      sub_100008C30(a1);
      return v6;
    }
    sub_100006DCC(a2);
    v26 = *(_DWORD *)(a1 + 16);
    if (v8)
    {
      if (a3 != 1)
      {
        Length = CFDataGetLength((CFDataRef)v7) / 4;
        v28 = 4;
        goto LABEL_31;
      }
    }
    else if (a3 != 3)
    {
      Length = CFDataGetLength((CFDataRef)v7);
      v28 = 2;
LABEL_31:
      sub_100008C74(a2, Length);
      if (!sub_100008D04(a1, (uint64_t)a2, (CFDataRef)v7, v26, v28, v29, v31 == 0))
        fprintf(__stderrp, "Error encountered while reading register data for register address %x\n", v26);
      goto LABEL_33;
    }
  }
  return v6;
}

BOOL sub_100008BC0(uint64_t a1)
{
  const void *v2;
  const __CFString *v4;
  CFTypeRef CFProperty;

  v2 = *(const void **)(a1 + 48);
  if (v2)
  {
    CFRetain(v2);
    return 1;
  }
  else
  {
    if (*(_BYTE *)(a1 + 12))
      v4 = CFSTR("CodecExtendedRegisterData");
    else
      v4 = CFSTR("CodecRegisterData");
    CFProperty = IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 8), v4, kCFAllocatorDefault, 0);
    *(_QWORD *)(a1 + 48) = CFProperty;
    return CFProperty != 0;
  }
}

uint64_t sub_100008C30(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 48);
  if (v1)
  {
    if (CFGetRetainCount(*(CFTypeRef *)(a1 + 48)) == 1)
      *(_QWORD *)(a1 + 48) = 0;
    CFRelease(v1);
  }
  return 1;
}

uint64_t sub_100008C74(uint64_t *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];

  v4 = a1[2];
  result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 5)
  {
    if (a2 >> 59)
      sub_1000050BC();
    v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = sub_100006B3C(result, a2);
    v7[1] = v7[0] + v5;
    v7[2] = v7[0] + v5;
    v7[3] = v7[0] + 32 * v6;
    sub_100009B4C(a1, v7);
    return sub_100009CE0((uint64_t)v7);
  }
  return result;
}

void sub_100008CF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_100009CE0((uint64_t)va);
  _Unwind_Resume(a1);
}

BOOL sub_100008D04(uint64_t a1, uint64_t a2, CFDataRef theData, unsigned int a4, int a5, uint64_t a6, int a7)
{
  unint64_t v12;
  const UInt8 *v13;
  const UInt8 *v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  _DWORD *v18;
  _DWORD *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  int v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  const UInt8 *v36;
  const UInt8 *v37;
  uint64_t v38;
  uint64_t **v39;
  uint64_t v40;
  int v41;
  _DWORD *v42;
  _DWORD *v43;
  _DWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  char *v50;
  int v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  CFIndex Length;
  const UInt8 *BytePtr;
  const UInt8 *v57;
  uint64_t v58;
  uint64_t **v59;
  int v60;
  _DWORD *v61;
  _DWORD *v62;
  _DWORD *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  char *v68;
  char *v69;
  int v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unsigned int *v74;
  unsigned int *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v80;
  unsigned int v81;
  void *v82[2];
  uint64_t v83;
  void *__p;
  _DWORD *v85;
  unint64_t v86;
  unsigned int *v87[5];

  if (!theData)
    return theData != 0;
  switch(a5)
  {
    case 1:
      Length = CFDataGetLength(theData);
      BytePtr = CFDataGetBytePtr(theData);
      if (!BytePtr)
        return theData != 0;
      v57 = BytePtr;
      v80 = a2;
      __p = 0;
      v85 = 0;
      v86 = 0;
      sub_1000094E8(&__p, Length);
      if (Length >= 1)
      {
        v58 = 0;
        v59 = (uint64_t **)(a1 + 24);
        do
        {
          v60 = v57[v58];
          v61 = v85;
          if ((unint64_t)v85 >= v86)
          {
            v63 = __p;
            v64 = ((char *)v85 - (_BYTE *)__p) >> 2;
            v65 = v64 + 1;
            if ((unint64_t)(v64 + 1) >> 62)
              sub_1000050BC();
            v66 = v86 - (_QWORD)__p;
            if ((uint64_t)(v86 - (_QWORD)__p) >> 1 > v65)
              v65 = v66 >> 1;
            if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFFCLL)
              v67 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v67 = v65;
            if (v67)
            {
              v68 = (char *)sub_100006CE0((uint64_t)&v86, v67);
              v63 = __p;
              v61 = v85;
            }
            else
            {
              v68 = 0;
            }
            v69 = &v68[4 * v64];
            *(_DWORD *)v69 = v60;
            v62 = v69 + 4;
            while (v61 != v63)
            {
              v70 = *--v61;
              *((_DWORD *)v69 - 1) = v70;
              v69 -= 4;
            }
            __p = v69;
            v85 = v62;
            v86 = (unint64_t)&v68[4 * v67];
            if (v63)
              operator delete(v63);
          }
          else
          {
            *v85 = v60;
            v62 = v61 + 1;
          }
          v85 = v62;
          if (a7)
          {
            v81 = v58 + a4;
            v87[0] = &v81;
            *((_DWORD *)sub_10000A500(v59, &v81, (uint64_t)&unk_10000BC60, v87) + 8) = 1;
          }
          ++v58;
        }
        while (v58 != Length);
      }
      v81 = a4;
      v82[1] = 0;
      v83 = 0;
      v82[0] = 0;
      sub_100006C28(v82, __p, (uint64_t)v85, ((char *)v85 - (_BYTE *)__p) >> 2);
      v27 = (uint64_t *)v80;
      v28 = v80 + 16;
      v71 = *(_QWORD *)(v80 + 16);
      v30 = *(_QWORD *)(v80 + 8);
      if (v30 >= v71)
      {
        v31 = (uint64_t)(v30 - *(_QWORD *)v80) >> 5;
        v72 = v31 + 1;
        if ((unint64_t)(v31 + 1) >> 59)
          sub_1000050BC();
        v73 = v71 - *(_QWORD *)v80;
        if (v73 >> 4 > v72)
          v72 = v73 >> 4;
        if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFE0)
          v34 = 0x7FFFFFFFFFFFFFFLL;
        else
          v34 = v72;
        goto LABEL_97;
      }
      break;
    case 2:
      v35 = CFDataGetLength(theData);
      v36 = CFDataGetBytePtr(theData);
      if (!v36)
        return theData != 0;
      v37 = v36;
      v80 = a2;
      __p = 0;
      v85 = 0;
      v86 = 0;
      sub_1000094E8(&__p, v35 >> 1);
      if (v35 >= 2)
      {
        v38 = 0;
        v39 = (uint64_t **)(a1 + 24);
        if (v35 >> 1 <= 1)
          v40 = 1;
        else
          v40 = v35 >> 1;
        do
        {
          v41 = *(unsigned __int16 *)&v37[2 * v38];
          v42 = v85;
          if ((unint64_t)v85 >= v86)
          {
            v44 = __p;
            v45 = ((char *)v85 - (_BYTE *)__p) >> 2;
            v46 = v45 + 1;
            if ((unint64_t)(v45 + 1) >> 62)
              sub_1000050BC();
            v47 = v86 - (_QWORD)__p;
            if ((uint64_t)(v86 - (_QWORD)__p) >> 1 > v46)
              v46 = v47 >> 1;
            if ((unint64_t)v47 >= 0x7FFFFFFFFFFFFFFCLL)
              v48 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v48 = v46;
            if (v48)
            {
              v49 = (char *)sub_100006CE0((uint64_t)&v86, v48);
              v44 = __p;
              v42 = v85;
            }
            else
            {
              v49 = 0;
            }
            v50 = &v49[4 * v45];
            *(_DWORD *)v50 = v41;
            v43 = v50 + 4;
            while (v42 != v44)
            {
              v51 = *--v42;
              *((_DWORD *)v50 - 1) = v51;
              v50 -= 4;
            }
            __p = v50;
            v85 = v43;
            v86 = (unint64_t)&v49[4 * v48];
            if (v44)
              operator delete(v44);
          }
          else
          {
            *v85 = v41;
            v43 = v42 + 1;
          }
          v85 = v43;
          if (a7)
          {
            v81 = v38 + a4;
            v87[0] = &v81;
            *((_DWORD *)sub_10000A500(v39, &v81, (uint64_t)&unk_10000BC60, v87) + 8) = 2;
          }
          ++v38;
        }
        while (v38 != v40);
      }
      v81 = a4;
      v82[1] = 0;
      v83 = 0;
      v82[0] = 0;
      sub_100006C28(v82, __p, (uint64_t)v85, ((char *)v85 - (_BYTE *)__p) >> 2);
      v27 = (uint64_t *)v80;
      v28 = v80 + 16;
      v52 = *(_QWORD *)(v80 + 16);
      v30 = *(_QWORD *)(v80 + 8);
      if (v30 >= v52)
      {
        v31 = (uint64_t)(v30 - *(_QWORD *)v80) >> 5;
        v53 = v31 + 1;
        if ((unint64_t)(v31 + 1) >> 59)
          sub_1000050BC();
        v54 = v52 - *(_QWORD *)v80;
        if (v54 >> 4 > v53)
          v53 = v54 >> 4;
        if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFE0)
          v34 = 0x7FFFFFFFFFFFFFFLL;
        else
          v34 = v53;
        goto LABEL_97;
      }
      break;
    case 4:
      v12 = CFDataGetLength(theData);
      v13 = CFDataGetBytePtr(theData);
      if (!v13)
        return theData != 0;
      v14 = v13;
      v80 = a2;
      __p = 0;
      v85 = 0;
      v86 = 0;
      sub_1000094E8(&__p, v12 >> 2);
      if (v12 >= 4)
      {
        v15 = 0;
        if (v12 >> 2 <= 1)
          v16 = 1;
        else
          v16 = v12 >> 2;
        do
        {
          v17 = v85;
          if ((unint64_t)v85 >= v86)
          {
            v19 = __p;
            v20 = ((char *)v85 - (_BYTE *)__p) >> 2;
            v21 = v20 + 1;
            if ((unint64_t)(v20 + 1) >> 62)
              sub_1000050BC();
            v22 = v86 - (_QWORD)__p;
            if ((uint64_t)(v86 - (_QWORD)__p) >> 1 > v21)
              v21 = v22 >> 1;
            if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFFCLL)
              v23 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v23 = v21;
            if (v23)
            {
              v24 = (char *)sub_100006CE0((uint64_t)&v86, v23);
              v19 = __p;
              v17 = v85;
            }
            else
            {
              v24 = 0;
            }
            v25 = &v24[4 * v20];
            *(_DWORD *)v25 = *(_DWORD *)&v14[4 * v15];
            v18 = v25 + 4;
            while (v17 != v19)
            {
              v26 = *--v17;
              *((_DWORD *)v25 - 1) = v26;
              v25 -= 4;
            }
            __p = v25;
            v85 = v18;
            v86 = (unint64_t)&v24[4 * v23];
            if (v19)
              operator delete(v19);
          }
          else
          {
            *v85 = *(_DWORD *)&v14[4 * v15];
            v18 = v17 + 1;
          }
          v85 = v18;
          if (a7)
          {
            v81 = 0;
            v81 = a4 + sub_1000080B0(a1) * v15;
            v87[0] = &v81;
            *((_DWORD *)sub_10000A500((uint64_t **)(a1 + 24), &v81, (uint64_t)&unk_10000BC60, v87) + 8) = 4;
          }
          ++v15;
        }
        while (v15 != v16);
      }
      v81 = a4;
      v82[1] = 0;
      v83 = 0;
      v82[0] = 0;
      sub_100006C28(v82, __p, (uint64_t)v85, ((char *)v85 - (_BYTE *)__p) >> 2);
      v27 = (uint64_t *)v80;
      v28 = v80 + 16;
      v29 = *(_QWORD *)(v80 + 16);
      v30 = *(_QWORD *)(v80 + 8);
      if (v30 >= v29)
      {
        v31 = (uint64_t)(v30 - *(_QWORD *)v80) >> 5;
        v32 = v31 + 1;
        if ((unint64_t)(v31 + 1) >> 59)
          sub_1000050BC();
        v33 = v29 - *(_QWORD *)v80;
        if (v33 >> 4 > v32)
          v32 = v33 >> 4;
        if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFE0)
          v34 = 0x7FFFFFFFFFFFFFFLL;
        else
          v34 = v32;
LABEL_97:
        v87[4] = (unsigned int *)(v80 + 16);
        v74 = (unsigned int *)sub_100006B3C(v28, v34);
        v75 = &v74[8 * v31];
        v87[0] = v74;
        v87[1] = v75;
        v87[3] = &v74[8 * v76];
        *v75 = v81;
        *((_QWORD *)v75 + 2) = 0;
        *((_QWORD *)v75 + 3) = 0;
        *((_QWORD *)v75 + 1) = 0;
        *(_OWORD *)(v75 + 2) = *(_OWORD *)v82;
        *((_QWORD *)v75 + 3) = v83;
        v82[0] = 0;
        v82[1] = 0;
        v83 = 0;
        v87[2] = v75 + 8;
        sub_100009B4C(v27, v87);
        v77 = v27[1];
        sub_100009CE0((uint64_t)v87);
        v78 = v82[0];
        v27[1] = v77;
        if (v78)
        {
          v82[1] = v78;
          operator delete(v78);
        }
        goto LABEL_99;
      }
      break;
    default:
      return theData != 0;
  }
  *(_DWORD *)v30 = v81;
  *(_QWORD *)(v30 + 16) = 0;
  *(_QWORD *)(v30 + 24) = 0;
  *(_QWORD *)(v30 + 8) = 0;
  *(_OWORD *)(v30 + 8) = *(_OWORD *)v82;
  *(_QWORD *)(v30 + 24) = v83;
  v27[1] = v30 + 32;
LABEL_99:
  if (__p)
  {
    v85 = __p;
    operator delete(__p);
  }
  return theData != 0;
}

void sub_10000945C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  sub_100009CE0((uint64_t)&a18);
  if (__p)
    operator delete(__p);
  if (a14)
    operator delete(a14);
  _Unwind_Resume(a1);
}

void sub_1000094E8(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  int v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 2)
  {
    if (a2 >> 62)
      sub_1000050BC();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)sub_100006CE0(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    v9 = &v6[4 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void sub_10000957C(const __CFString *a1@<X0>, _QWORD *a2@<X8>)
{
  CFIndex Length;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  Length = CFStringGetLength(a1);
  CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  operator new[]();
}

void sub_10000961C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

BOOL sub_100009638(uint64_t a1, _QWORD *a2)
{
  const __CFString *v4;
  const __CFString *v5;
  _BOOL8 v6;
  uint64_t v8;

  v4 = CFStringCreateWithCString(kCFAllocatorDefault, "Ping", 0);
  if (!v4)
    return 0;
  v5 = v4;
  v8 = 0;
  v6 = sub_1000085F0(a1, v4, &v8);
  *a2 = v8;
  CFRelease(v5);
  return v6;
}

const __CFString *sub_1000096C0(uint64_t a1, const void *a2)
{
  const __CFString *result;
  const __CFString *v5;
  uint64_t v6;

  result = CFStringCreateWithCString(kCFAllocatorDefault, "HPDetect", 0);
  if (result)
  {
    v5 = result;
    v6 = sub_100008140(a1, result, a2);
    CFRelease(v5);
    return (const __CFString *)v6;
  }
  return result;
}

void sub_10000972C(void ***a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v7 = *--v4;
        v6 = v7;
        *v4 = 0;
        if (v7)
          (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

CFDictionaryRef sub_1000097A8(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  void *v6;
  void **v7;
  void **v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  void **v13;
  void **v14;
  void **v15;
  void *v16;
  void *v17;
  void **v18;
  void **v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  void **v24;
  void **v25;
  void **v26;
  void *v27;
  CFDictionaryRef v28;
  std::runtime_error *exception;
  void **values;
  void **v32;
  void **v33;
  void **keys;
  void **v35;
  void **v36;

  v2 = *(_QWORD *)(a1 + 8);
  keys = 0;
  v35 = 0;
  v36 = 0;
  sub_100007548((void **)&keys, v2);
  values = 0;
  v32 = 0;
  v33 = 0;
  sub_100007548((void **)&values, v2);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3)
  {
    v4 = *(void ***)a1;
    v5 = *(_QWORD *)a1 + 16 * v3;
    do
    {
      v6 = *v4;
      v7 = v35;
      if (v35 >= v36)
      {
        v9 = v35 - keys;
        if ((unint64_t)(v9 + 1) >> 61)
          sub_1000050BC();
        v10 = ((char *)v36 - (char *)keys) >> 2;
        if (v10 <= v9 + 1)
          v10 = v9 + 1;
        if ((unint64_t)((char *)v36 - (char *)keys) >= 0x7FFFFFFFFFFFFFF8)
          v11 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v11 = v10;
        if (v11)
          v12 = (char *)sub_1000050D0((uint64_t)&v36, v11);
        else
          v12 = 0;
        v13 = (void **)&v12[8 * v9];
        *v13 = v6;
        v8 = v13 + 1;
        v15 = keys;
        v14 = v35;
        if (v35 != keys)
        {
          do
          {
            v16 = *--v14;
            *--v13 = v16;
          }
          while (v14 != v15);
          v14 = keys;
        }
        keys = v13;
        v35 = v8;
        v36 = (void **)&v12[8 * v11];
        if (v14)
          operator delete(v14);
      }
      else
      {
        *v35 = v6;
        v8 = v7 + 1;
      }
      v35 = v8;
      v17 = v4[1];
      v18 = v32;
      if (v32 >= v33)
      {
        v20 = v32 - values;
        if ((unint64_t)(v20 + 1) >> 61)
          sub_1000050BC();
        v21 = ((char *)v33 - (char *)values) >> 2;
        if (v21 <= v20 + 1)
          v21 = v20 + 1;
        if ((unint64_t)((char *)v33 - (char *)values) >= 0x7FFFFFFFFFFFFFF8)
          v22 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v22 = v21;
        if (v22)
          v23 = (char *)sub_1000050D0((uint64_t)&v33, v22);
        else
          v23 = 0;
        v24 = (void **)&v23[8 * v20];
        *v24 = v17;
        v19 = v24 + 1;
        v26 = values;
        v25 = v32;
        if (v32 != values)
        {
          do
          {
            v27 = *--v25;
            *--v24 = v27;
          }
          while (v25 != v26);
          v25 = values;
        }
        values = v24;
        v32 = v19;
        v33 = (void **)&v23[8 * v22];
        if (v25)
          operator delete(v25);
      }
      else
      {
        *v32 = v17;
        v19 = v18 + 1;
      }
      v32 = v19;
      v4 += 2;
    }
    while (v4 != (void **)v5);
  }
  v28 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, v2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v28)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  if (values)
  {
    v32 = values;
    operator delete(values);
  }
  if (keys)
  {
    v35 = keys;
    operator delete(keys);
  }
  return v28;
}

void sub_100009A30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13)
{
  void *v13;

  __cxa_free_exception(v13);
  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  _Unwind_Resume(a1);
}

const void **sub_100009A88(const void **a1)
{
  const void *v2;

  v2 = *a1;
  if (v2)
    CFRelease(v2);
  return a1;
}

uint64_t sub_100009AB8(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    v4 = *(_QWORD *)(i - 8);
    *(_QWORD *)(i - 8) = 0;
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void *sub_100009B18(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    sub_100003338();
  return operator new(16 * a2);
}

uint64_t sub_100009B4C(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_100009BC0((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_100009BC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      v8 = *(_DWORD *)(a3 - 32);
      a3 -= 32;
      *(_DWORD *)(v7 - 32) = v8;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      *(_QWORD *)(v7 - 24) = 0;
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 + 8);
      *(_QWORD *)(v7 - 8) = *(_QWORD *)(a3 + 24);
      *(_QWORD *)(a3 + 8) = 0;
      *(_QWORD *)(a3 + 16) = 0;
      *(_QWORD *)(a3 + 24) = 0;
      v7 = *((_QWORD *)&v14 + 1) - 32;
      *((_QWORD *)&v14 + 1) -= 32;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  sub_100009C68((uint64_t)v11);
  return v9;
}

uint64_t sub_100009C68(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_100009C9C(a1);
  return a1;
}

void sub_100009C9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(void **)(v1 + 8);
    if (v3)
    {
      *(_QWORD *)(v1 + 16) = v3;
      operator delete(v3);
    }
    v1 += 32;
  }
}

uint64_t sub_100009CE0(uint64_t a1)
{
  sub_100009D14(a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_100009D14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    *(_QWORD *)(a1 + 16) = v2 - 32;
    v5 = *(void **)(v2 - 24);
    if (v5)
    {
      *(_QWORD *)(v2 - 16) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 32;
    }
  }
}

std::string *sub_100009D6C(std::string *__dst, const std::string::value_type *__src, size_t __len)
{
  unint64_t v6;
  std::string *v7;
  std::string::size_type size;
  std::string::size_type v9;
  unint64_t v10;

  LODWORD(v6) = SHIBYTE(__dst->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    v10 = __dst->__r_.__value_.__r.__words[2];
    v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __len)
    {
      size = __dst->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    v6 = HIBYTE(v10);
    v7 = (std::string *)__dst->__r_.__value_.__r.__words[0];
  }
  else
  {
    v7 = __dst;
    if (__len > 0x16)
    {
      size = HIBYTE(__dst->__r_.__value_.__r.__words[2]);
      v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(__dst, v9, __len - v9, size, 0, size, __len, __src);
      return __dst;
    }
  }
  if (__len)
  {
    memmove(v7, __src, __len);
    LOBYTE(v6) = *((_BYTE *)&__dst->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0)
    __dst->__r_.__value_.__l.__size_ = __len;
  else
    *((_BYTE *)&__dst->__r_.__value_.__s + 23) = __len & 0x7F;
  v7->__r_.__value_.__s.__data_[__len] = 0;
  return __dst;
}

uint64_t sub_100009E28(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

_QWORD *sub_100009E70(uint64_t a1, unsigned int *a2, _DWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  _QWORD *v10;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v7 <= v6)
        v3 = v6 % v7;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & v6;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == (_DWORD)v6)
              return v10;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7)
                v11 %= v7;
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
  v10 = operator new(0x18uLL);
  *v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *a3;
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    sub_10000A08C(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = ((_DWORD)v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *v10 = *v19;
LABEL_38:
    *v19 = v10;
    goto LABEL_39;
  }
  *v10 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    v20 = *(_QWORD *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v10;
}

void sub_10000A078(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_10000A08C(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      sub_10000A168(a1, prime);
  }
}

void sub_10000A168(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      sub_100003338();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

uint64_t sub_10000A2C0(uint64_t a1, char *a2, int *a3)
{
  CFNumberRef v5;
  std::runtime_error *exception;
  int valuePtr;

  sub_10000A388((CFStringRef *)a1, a2);
  valuePtr = *a3;
  v5 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *(_QWORD *)(a1 + 8) = v5;
  if (!v5)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  return a1;
}

void sub_10000A34C(_Unwind_Exception *a1)
{
  uint64_t v1;
  const void *v3;

  v3 = *(const void **)(v1 + 8);
  if (v3)
    CFRelease(v3);
  sub_100009A88((const void **)v1);
  _Unwind_Resume(a1);
}

CFStringRef *sub_10000A388(CFStringRef *a1, char *a2)
{
  void **v3;
  CFIndex v4;
  CFStringRef v5;
  std::runtime_error *exception;
  void *__p[2];
  unsigned __int8 v9;

  sub_100003200(__p, a2);
  if ((v9 & 0x80u) == 0)
    v3 = __p;
  else
    v3 = (void **)__p[0];
  if ((v9 & 0x80u) == 0)
    v4 = v9;
  else
    v4 = (CFIndex)__p[1];
  v5 = CFStringCreateWithBytes(0, (const UInt8 *)v3, v4, 0x8000100u, 0);
  *a1 = v5;
  if (!v5)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "Could not construct");
  }
  if ((char)v9 < 0)
    operator delete(__p[0]);
  return a1;
}

void sub_10000A43C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  CFTypeRef *v15;

  if (*v15)
    CFRelease(*v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000A480(uint64_t a1, char *a2, const void **a3)
{
  const void *v5;

  sub_10000A388((CFStringRef *)a1, a2);
  v5 = *a3;
  if (v5)
    CFRetain(v5);
  *(_QWORD *)(a1 + 8) = v5;
  return a1;
}

void sub_10000A4C0(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    sub_10000A4C0(a1, *a2);
    sub_10000A4C0(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *sub_10000A500(uint64_t **a1, unsigned int *a2, uint64_t a3, unsigned int **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  unsigned int v8;
  uint64_t **v9;
  unsigned int v10;
  uint64_t *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = *((_DWORD *)v6 + 7);
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v11 + 28) = **a4;
    sub_100005310(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t sub_10000A5BC()
{
  return __cxa_atexit((void (*)(void *))sub_100006F00, &xmmword_100010000, (void *)&_mh_execute_header);
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}
