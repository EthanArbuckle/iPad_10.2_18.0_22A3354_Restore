BOOL sub_1000029D8(uint64_t a1, uint64_t a2)
{
  const void **v4;
  unsigned __int8 **v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned __int8 *v11;
  int v12;
  int v13;

  if (*(_DWORD *)a1 > *(_DWORD *)a2)
    return 1;
  if (*(_DWORD *)a1 != *(_DWORD *)a2)
    return 0;
  v4 = (const void **)(a1 + 8);
  v5 = (unsigned __int8 **)(a2 + 8);
  if ((int)(sub_100002ADC((_QWORD *)(a1 + 8), (void **)(a2 + 8)) << 24) > 0)
    return 1;
  v7 = *(unsigned __int8 *)(a1 + 31);
  if ((v7 & 0x80u) == 0)
    v8 = *(unsigned __int8 *)(a1 + 31);
  else
    v8 = *(_QWORD *)(a1 + 16);
  v9 = *(unsigned __int8 *)(a2 + 31);
  v10 = (char)v9;
  if ((v9 & 0x80u) != 0)
    v9 = *(_QWORD *)(a2 + 16);
  if (v8 != v9)
    return 0;
  if (v10 >= 0)
    v11 = (unsigned __int8 *)v5;
  else
    v11 = *v5;
  if ((v7 & 0x80) != 0)
  {
    if (memcmp(*v4, v11, *(_QWORD *)(a1 + 16)))
      return 0;
  }
  else if (*(_BYTE *)(a1 + 31))
  {
    while (*(unsigned __int8 *)v4 == *v11)
    {
      v4 = (const void **)((char *)v4 + 1);
      ++v11;
      if (!--v7)
        goto LABEL_20;
    }
    return 0;
  }
LABEL_20:
  v12 = *(_DWORD *)(a1 + 32);
  v13 = *(_DWORD *)(a2 + 32);
  if (v12 > v13)
    return 1;
  if (v12 == v13)
    return *(_DWORD *)(a1 + 36) > *(_DWORD *)(a2 + 36);
  return 0;
}

uint64_t sub_100002ADC(_QWORD *a1, void **a2)
{
  size_t v2;
  size_t v3;
  int v4;
  void *v5;
  size_t v6;

  v2 = *((unsigned __int8 *)a1 + 23);
  v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (_QWORD *)*a1;
    v2 = v3;
  }
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = a2;
  else
    v5 = *a2;
  if (v4 >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  return sub_100006648(a1, v2, v5, v6);
}

BOOL sub_100002B14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const void **v8;
  unsigned __int8 *v9;

  if (*(_DWORD *)a1 != *(_DWORD *)a2)
    return 0;
  v4 = *(unsigned __int8 *)(a1 + 31);
  if ((v4 & 0x80u) == 0)
    v5 = *(unsigned __int8 *)(a1 + 31);
  else
    v5 = *(_QWORD *)(a1 + 16);
  v6 = *(unsigned __int8 *)(a2 + 31);
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *(_QWORD *)(a2 + 16);
  if (v5 != v6)
    return 0;
  v8 = (const void **)(a1 + 8);
  if (v7 >= 0)
    v9 = (unsigned __int8 *)(a2 + 8);
  else
    v9 = *(unsigned __int8 **)(a2 + 8);
  if ((v4 & 0x80) != 0)
  {
    if (memcmp(*v8, v9, *(_QWORD *)(a1 + 16)))
      return 0;
  }
  else if (*(_BYTE *)(a1 + 31))
  {
    while (*(unsigned __int8 *)v8 == *v9)
    {
      v8 = (const void **)((char *)v8 + 1);
      ++v9;
      if (!--v4)
        goto LABEL_17;
    }
    return 0;
  }
LABEL_17:
  if (*(_DWORD *)(a1 + 32) == *(_DWORD *)(a2 + 32))
    return *(_DWORD *)(a1 + 36) == *(_DWORD *)(a2 + 36);
  return 0;
}

void sub_100002BE8()
{
  std::locale v0;

  sub_100006A30(&v0, "([0-9]+)([a-z]+)(?:\\.([0-9]+))?(?:\\.([0-9]+))?", 0);
}

#error "1000030D4: call analysis failed (funcsize=51)"

std::logic_error *sub_10000315C(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100003180(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

double sub_100003190(uint64_t a1)
{
  double result;

  *(_DWORD *)a1 = -1;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  result = NAN;
  *(_QWORD *)(a1 + 32) = -1;
  return result;
}

void sub_1000031AC(_QWORD *a1)
{
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 0;
  sub_100002BE8();
}

void sub_1000031E4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void sub_100003204(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v4;
  void *v5[2];
  char v6;

  sub_10000328C((const std::__fs::filesystem::path *)a1, (uint64_t)v5);
  if ((v6 & 0x80000000) == 0)
  {
    if (v6)
      goto LABEL_3;
LABEL_6:
    sub_10000337C((const std::__fs::filesystem::path *)a1, a2);
    return;
  }
  v4 = v5[1];
  operator delete(v5[0]);
  if (!v4)
    goto LABEL_6;
LABEL_3:
  if (*(char *)(a1 + 23) < 0)
  {
    sub_1000067AC((_BYTE *)a2, *(void **)a1, *(_QWORD *)(a1 + 8));
  }
  else
  {
    *(_OWORD *)a2 = *(_OWORD *)a1;
    *(_QWORD *)(a2 + 16) = *(_QWORD *)(a1 + 16);
  }
}

double sub_10000328C@<D0>(const std::__fs::filesystem::path *a1@<X0>, uint64_t a2@<X8>)
{
  std::__fs::filesystem::path::__string_view v3;
  __int128 *p_dst;
  std::basic_string_view<_CharT, _Traits>::size_type v5;
  std::basic_string_view<_CharT, _Traits>::size_type v6;
  double result;
  __int128 __dst;
  unint64_t v9;

  v3 = std::__fs::filesystem::path::__filename(a1);
  if (v3.__size_ >= 0x7FFFFFFFFFFFFFF8)
    sub_1000066FC();
  if (v3.__size_ >= 0x17)
  {
    v5 = (v3.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3.__size_ | 7) != 0x17)
      v5 = v3.__size_ | 7;
    v6 = v5 + 1;
    p_dst = (__int128 *)operator new(v5 + 1);
    *((_QWORD *)&__dst + 1) = v3.__size_;
    v9 = v6 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
  }
  else
  {
    HIBYTE(v9) = v3.__size_;
    p_dst = &__dst;
    if (!v3.__size_)
      goto LABEL_9;
  }
  memmove(p_dst, v3.__data_, v3.__size_);
LABEL_9:
  *((_BYTE *)p_dst + v3.__size_) = 0;
  result = *(double *)&__dst;
  *(_OWORD *)a2 = __dst;
  *(_QWORD *)(a2 + 16) = v9;
  return result;
}

uint64_t sub_10000334C(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

double sub_10000337C@<D0>(const std::__fs::filesystem::path *a1@<X0>, uint64_t a2@<X8>)
{
  std::__fs::filesystem::path::__string_view v3;
  __int128 *p_dst;
  std::basic_string_view<_CharT, _Traits>::size_type v5;
  std::basic_string_view<_CharT, _Traits>::size_type v6;
  double result;
  __int128 __dst;
  unint64_t v9;

  v3 = std::__fs::filesystem::path::__parent_path(a1);
  if (v3.__size_ >= 0x7FFFFFFFFFFFFFF8)
    sub_1000066FC();
  if (v3.__size_ >= 0x17)
  {
    v5 = (v3.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3.__size_ | 7) != 0x17)
      v5 = v3.__size_ | 7;
    v6 = v5 + 1;
    p_dst = (__int128 *)operator new(v5 + 1);
    *((_QWORD *)&__dst + 1) = v3.__size_;
    v9 = v6 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
  }
  else
  {
    HIBYTE(v9) = v3.__size_;
    p_dst = &__dst;
    if (!v3.__size_)
      goto LABEL_9;
  }
  memmove(p_dst, v3.__data_, v3.__size_);
LABEL_9:
  *((_BYTE *)p_dst + v3.__size_) = 0;
  result = *(double *)&__dst;
  *(_OWORD *)a2 = __dst;
  *(_QWORD *)(a2 + 16) = v9;
  return result;
}

_QWORD *sub_10000343C(_QWORD *result)
{
  *result = &off_100014338;
  result[1] = 0;
  result[2] = 0;
  result[3] = 0;
  return result;
}

_QWORD *sub_100003450(_QWORD *a1, uint64_t a2)
{
  *a1 = &off_100014338;
  sub_100003204(a2, (uint64_t)(a1 + 1));
  return a1;
}

uint64_t sub_100003488(uint64_t a1)
{
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)a1 = off_100014358;
  sub_10001122C((std::string *)(a1 + 32), "/usr/share/zoneinfo.default");
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  sub_10000354C(a1);
  return a1;
}

void sub_1000034FC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void **v4;

  if (*(char *)(v1 + 79) < 0)
    operator delete(*v4);
  if (*(char *)(v1 + 55) < 0)
    operator delete(*v2);
  *(_QWORD *)v1 = &off_100014338;
  if (*(char *)(v1 + 31) < 0)
    operator delete(*v3);
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000354C(uint64_t a1)
{
  std::__fs::filesystem::path *p_p;
  std::__fs::filesystem::path v4;
  std::__fs::filesystem::path __p;
  void (__cdecl **v6[2])(std::ifstream *__hidden);
  uint64_t v7;
  uint64_t v8;

  sub_10001122C(&v4.__pn_, "+VERSION");
  sub_100003800(&v4, a1 + 32, &__p);
  if ((__p.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::__fs::filesystem::path *)__p.__pn_.__r_.__value_.__r.__words[0];
  sub_10001144C(v6, (uint64_t)p_p, 8);
  if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(v4.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v4.__pn_.__r_.__value_.__l.__data_);
  sub_100003874((uint64_t *)v6, a1 + 56);
  std::filebuf::~filebuf(&v7);
  return std::ios::~ios(&v8);
}

void sub_100003650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22)
{
  sub_100003AA0(&a22);
  _Unwind_Resume(a1);
}

uint64_t sub_1000036A0(uint64_t a1, uint64_t a2)
{
  void **v4;
  uint64_t v5;
  std::string __p;
  std::__fs::filesystem::path v8;

  *(_QWORD *)a1 = &off_100014338;
  sub_100003204(a2, a1 + 8);
  *(_QWORD *)a1 = off_100014358;
  *(_OWORD *)(a1 + 32) = 0u;
  v4 = (void **)(a1 + 32);
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  v5 = *(unsigned __int8 *)(a2 + 23);
  if ((v5 & 0x80u) != 0)
    v5 = *(_QWORD *)(a2 + 8);
  if (v5)
  {
    sub_10001122C(&__p, "zoneinfo");
    sub_100003800((std::__fs::filesystem::path *)&__p, a2, &v8);
    if (*(char *)(a1 + 55) < 0)
      operator delete(*v4);
    *(_OWORD *)v4 = *(_OWORD *)&v8.__pn_.__r_.__value_.__l.__data_;
    *(_QWORD *)(a1 + 48) = *((_QWORD *)&v8.__pn_.__r_.__value_.__l + 2);
    *((_BYTE *)&v8.__pn_.__r_.__value_.__s + 23) = 0;
    v8.__pn_.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    sub_1000113F8((std::string *)(a1 + 32), "/usr/share/zoneinfo.default");
  }
  sub_10000354C(a1);
  return a1;
}

void sub_1000037A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void **v14;
  uint64_t v15;
  void **v16;
  uint64_t v17;

  if (a14 < 0)
    operator delete(__p);
  if (*(char *)(v15 + 79) < 0)
    operator delete(*(void **)(v15 + 56));
  if (*(char *)(v15 + 55) < 0)
    operator delete(*v16);
  *(_QWORD *)v15 = v17;
  if (*(char *)(v15 + 31) < 0)
    operator delete(*v14);
  _Unwind_Resume(exception_object);
}

std::__fs::filesystem::path *sub_100003800@<X0>(std::__fs::filesystem::path *this@<X1>, uint64_t a2@<X0>, std::__fs::filesystem::path *a3@<X8>)
{
  if (*(char *)(a2 + 23) < 0)
  {
    sub_1000067AC(a3, *(void **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&a3->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a3->__pn_.__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 16);
  }
  return sub_1000052C4(a3, this);
}

void sub_100003854(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t *sub_100003874(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const std::locale::facet *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _BYTE *v12;
  int v13;
  _QWORD *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  std::locale v19;
  char v20;

  std::istream::sentry::sentry(&v20, a1, 0);
  if (!v20)
    return a1;
  if (*(char *)(a2 + 23) < 0)
  {
    **(_BYTE **)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  else
  {
    *(_BYTE *)a2 = 0;
    *(_BYTE *)(a2 + 23) = 0;
  }
  v4 = *(_QWORD *)(*a1 - 24);
  v5 = *(uint64_t *)((char *)a1 + v4 + 24);
  if (v5 <= 1)
    v6 = 1;
  else
    v6 = *(uint64_t *)((char *)a1 + v4 + 24);
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + v4));
  v7 = std::locale::use_facet(&v19, &std::ctype<char>::id);
  std::locale::~locale(&v19);
  v8 = 0;
  v9 = a1 + 5;
  if (v5 >= 1)
    v10 = v6;
  else
    v10 = 0x7FFFFFFFFFFFFFF7;
  while (1)
  {
    v11 = *(_QWORD **)((char *)v9 + *(_QWORD *)(*a1 - 24));
    v12 = (_BYTE *)v11[3];
    if (v12 == (_BYTE *)v11[4])
      break;
    LOBYTE(v13) = *v12;
LABEL_14:
    if ((v13 & 0x80) == 0 && (*((_DWORD *)&v7[1].~facet + v13) & 0x4000) != 0)
    {
      v16 = 0;
      goto LABEL_23;
    }
    std::string::push_back((std::string *)a2, v13);
    v14 = *(_QWORD **)((char *)v9 + *(_QWORD *)(*a1 - 24));
    v15 = v14[3];
    if (v15 == v14[4])
      (*(void (**)(_QWORD *))(*v14 + 80))(v14);
    else
      v14[3] = v15 + 1;
    if (v10 == ++v8)
    {
      v16 = 0;
      v17 = *a1;
      *(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 24) = 0;
      goto LABEL_25;
    }
  }
  v13 = (*(uint64_t (**)(_QWORD *))(*v11 + 72))(v11);
  if (v13 != -1)
    goto LABEL_14;
  v16 = 2;
LABEL_23:
  v17 = *a1;
  *(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 24) = 0;
  if (!v8)
    v16 |= 4u;
LABEL_25:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(v17 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(v17 - 24) + 32) | v16);
  return a1;
}

void sub_100003A28(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  _QWORD *v9;
  uint64_t v11;

  std::locale::~locale(&a9);
  __cxa_begin_catch(a1);
  v11 = *v9;
  *(_DWORD *)((char *)v9 + *(_QWORD *)(*v9 - 24) + 32) |= 1u;
  if ((*((_BYTE *)v9 + *(_QWORD *)(v11 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x1000039F4);
  }
  __cxa_rethrow();
}

void sub_100003A8C(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

_QWORD *sub_100003AA0(_QWORD *a1)
{
  uint64_t v2;

  std::filebuf::~filebuf(a1 + 2);
  std::ios::~ios(a1 + 53);
  return a1;
}

uint64_t sub_100003AF8()
{
  return 1;
}

char *sub_100003B00@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  if (result[79] < 0)
    return (char *)sub_1000067AC((_BYTE *)a2, *((void **)result + 7), *((_QWORD *)result + 8));
  *(_OWORD *)a2 = *(_OWORD *)(result + 56);
  *(_QWORD *)(a2 + 16) = *((_QWORD *)result + 9);
  return result;
}

void sub_100003B2C(uint64_t a1)
{
  std::__fs::filesystem::path __new_symlink;

  sub_10001122C(&__new_symlink.__pn_, "/var/db/timezone/zoneinfo");
  std::__fs::filesystem::__remove(&__new_symlink, 0);
  std::__fs::filesystem::__create_symlink((const std::__fs::filesystem::path *)(a1 + 32), &__new_symlink, 0);
  if (SHIBYTE(__new_symlink.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__new_symlink.__pn_.__r_.__value_.__l.__data_);
}

void sub_100003B90(void *a1)
{
  __cxa_begin_catch(a1);
  warn("Unlink of zoneinfo symlink failed");
  __cxa_end_catch();
  JUMPOUT(0x100003B60);
}

void sub_100003BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  __cxa_end_catch();
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t sub_100003BD4(uint64_t a1)
{
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)a1 = &off_100014378;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  sub_10001122C((std::string *)(a1 + 56), "/usr/share/icu");
  sub_100003C98(a1);
  return a1;
}

void sub_100003C48(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void **v4;

  if (*(char *)(v1 + 79) < 0)
    operator delete(*v2);
  if (*(char *)(v1 + 55) < 0)
    operator delete(*v4);
  *(_QWORD *)v1 = &off_100014338;
  if (*(char *)(v1 + 31) < 0)
    operator delete(*v3);
  _Unwind_Resume(exception_object);
}

uint64_t sub_100003C98(uint64_t a1)
{
  std::__fs::filesystem::path *v2;
  std::__fs::filesystem::path __p[2];
  std::string __dst;
  void *v6[2];
  __int128 v7;
  uint64_t v8;

  if (*(char *)(a1 + 31) < 0)
  {
    if (*(_QWORD *)(a1 + 16))
LABEL_3:
      sub_100006A30((std::locale *)__p, "icutz([0-9]+[lbe])", 0);
  }
  else if (*(_BYTE *)(a1 + 31))
  {
    goto LABEL_3;
  }
  sub_10001122C(&__dst, "icutzformat.txt");
  sub_100003800((std::__fs::filesystem::path *)&__dst, a1 + 56, __p);
  if ((__p[0].__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v2 = __p;
  else
    v2 = (std::__fs::filesystem::path *)__p[0].__pn_.__r_.__value_.__r.__words[0];
  sub_10001144C((void (__cdecl ***)(std::ifstream *__hidden))v6, (uint64_t)v2, 8);
  if (SHIBYTE(__p[0].__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p[0].__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  sub_100003874((uint64_t *)v6, a1 + 32);
  std::filebuf::~filebuf(&v7);
  return std::ios::~ios(&v8);
}

void sub_10000419C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23,uint64_t a24,char a25,uint64_t a26,char a27,uint64_t a28,std::locale a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40,uint64_t a41,int a42,__int16 a43,char a44,char a45,uint64_t a46,void *__p,uint64_t a48)
{
  if (__p)
  {
    a48 = (uint64_t)__p;
    operator delete(__p);
  }
  sub_1000066A4((uint64_t)&a37);
  std::locale::~locale(&a29);
  _Unwind_Resume(a1);
}

uint64_t sub_1000042A8(uint64_t a1, uint64_t a2)
{
  void **v4;
  uint64_t v5;
  std::string __p;
  std::__fs::filesystem::path v8;

  *(_QWORD *)a1 = &off_100014338;
  sub_100003204(a2, a1 + 8);
  *(_QWORD *)a1 = &off_100014378;
  *(_OWORD *)(a1 + 32) = 0u;
  v4 = (void **)(a1 + 56);
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  v5 = *(unsigned __int8 *)(a2 + 23);
  if ((v5 & 0x80u) != 0)
    v5 = *(_QWORD *)(a2 + 8);
  if (v5)
  {
    sub_10001122C(&__p, "icutz");
    sub_100003800((std::__fs::filesystem::path *)&__p, a2, &v8);
    if (*(char *)(a1 + 79) < 0)
      operator delete(*v4);
    *(_OWORD *)v4 = *(_OWORD *)&v8.__pn_.__r_.__value_.__l.__data_;
    *(_QWORD *)(a1 + 72) = *((_QWORD *)&v8.__pn_.__r_.__value_.__l + 2);
    *((_BYTE *)&v8.__pn_.__r_.__value_.__s + 23) = 0;
    v8.__pn_.__r_.__value_.__s.__data_[0] = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    sub_1000113F8((std::string *)(a1 + 56), "/usr/share/icu");
  }
  sub_100003C98(a1);
  return a1;
}

void sub_1000043B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void **v14;
  uint64_t v15;
  void **v16;
  uint64_t v17;
  void **v18;

  if (a14 < 0)
    operator delete(__p);
  if (*(char *)(v15 + 79) < 0)
    operator delete(*v16);
  if (*(char *)(v15 + 55) < 0)
    operator delete(*v18);
  *(_QWORD *)v15 = v17;
  if (*(char *)(v15 + 31) < 0)
    operator delete(*v14);
  _Unwind_Resume(exception_object);
}

BOOL sub_100004410(const std::__fs::filesystem::path *a1)
{
  int v1;
  unsigned __int8 v3;

  if (((1 << a1[3].__pn_.__r_.__value_.__s.__data_[1]) & 0x13) != 0)
  {
    std::__fs::filesystem::__status(a1, 0);
    v1 = v3;
  }
  else
  {
    v1 = a1[3].__pn_.__r_.__value_.__s.__data_[0];
  }
  return v1 == 1;
}

double sub_100004460@<D0>(const std::__fs::filesystem::path *a1@<X0>, uint64_t a2@<X8>)
{
  std::__fs::filesystem::path::__string_view v3;
  __int128 *p_dst;
  std::basic_string_view<_CharT, _Traits>::size_type v5;
  std::basic_string_view<_CharT, _Traits>::size_type v6;
  double result;
  __int128 __dst;
  unint64_t v9;

  v3 = std::__fs::filesystem::path::__stem(a1);
  if (v3.__size_ >= 0x7FFFFFFFFFFFFFF8)
    sub_1000066FC();
  if (v3.__size_ >= 0x17)
  {
    v5 = (v3.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3.__size_ | 7) != 0x17)
      v5 = v3.__size_ | 7;
    v6 = v5 + 1;
    p_dst = (__int128 *)operator new(v5 + 1);
    *((_QWORD *)&__dst + 1) = v3.__size_;
    v9 = v6 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
  }
  else
  {
    HIBYTE(v9) = v3.__size_;
    p_dst = &__dst;
    if (!v3.__size_)
      goto LABEL_9;
  }
  memmove(p_dst, v3.__data_, v3.__size_);
LABEL_9:
  *((_BYTE *)p_dst + v3.__size_) = 0;
  result = *(double *)&__dst;
  *(_OWORD *)a2 = __dst;
  *(_QWORD *)(a2 + 16) = v9;
  return result;
}

BOOL sub_100004520(const std::__fs::filesystem::path *a1, std::__fs::filesystem::path::__string_view a2)
{
  std::basic_string_view<_CharT, _Traits>::size_type v2;

  v2 = *((_QWORD *)a2.__data_ + 1);
  if (*((char *)a2.__data_ + 23) >= 0)
  {
    a2.__size_ = *((unsigned __int8 *)a2.__data_ + 23);
  }
  else
  {
    a2.__data_ = *(const std::string_view::value_type **)a2.__data_;
    a2.__size_ = v2;
  }
  return std::__fs::filesystem::path::__compare(a1, a2) == 0;
}

double sub_100004558@<D0>(const std::__fs::filesystem::path *a1@<X0>, uint64_t a2@<X8>)
{
  std::__fs::filesystem::path::__string_view v3;
  __int128 *p_dst;
  std::basic_string_view<_CharT, _Traits>::size_type v5;
  std::basic_string_view<_CharT, _Traits>::size_type v6;
  double result;
  __int128 __dst;
  unint64_t v9;

  v3 = std::__fs::filesystem::path::__extension(a1);
  if (v3.__size_ >= 0x7FFFFFFFFFFFFFF8)
    sub_1000066FC();
  if (v3.__size_ >= 0x17)
  {
    v5 = (v3.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3.__size_ | 7) != 0x17)
      v5 = v3.__size_ | 7;
    v6 = v5 + 1;
    p_dst = (__int128 *)operator new(v5 + 1);
    *((_QWORD *)&__dst + 1) = v3.__size_;
    v9 = v6 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
  }
  else
  {
    HIBYTE(v9) = v3.__size_;
    p_dst = &__dst;
    if (!v3.__size_)
      goto LABEL_9;
  }
  memmove(p_dst, v3.__data_, v3.__size_);
LABEL_9:
  *((_BYTE *)p_dst + v3.__size_) = 0;
  result = *(double *)&__dst;
  *(_OWORD *)a2 = __dst;
  *(_QWORD *)(a2 + 16) = v9;
  return result;
}

BOOL sub_100004618(uint64_t a1, void *lpsrc)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const void **v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  BOOL v19;
  _BOOL8 result;

  if (!v3)
  {
    warn("tzu_icu::compatible_schema: could not dynamic_cast other component");
    return 0;
  }
  v4 = *(unsigned __int8 *)(a1 + 55);
  if ((v4 & 0x80u) == 0)
    v5 = *(unsigned __int8 *)(a1 + 55);
  else
    v5 = *(_QWORD *)(a1 + 40);
  v6 = *((unsigned __int8 *)v3 + 55);
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = v3[5];
  if (v5 != v6)
    return 0;
  v8 = (const void **)(a1 + 32);
  v11 = (unsigned __int8 *)v3[4];
  v9 = (unsigned __int8 *)(v3 + 4);
  v10 = v11;
  if (v7 >= 0)
    v12 = v9;
  else
    v12 = v10;
  if ((v4 & 0x80) != 0)
    return memcmp(*v8, v12, *(_QWORD *)(a1 + 40)) == 0;
  if (!*(_BYTE *)(a1 + 55))
    return 1;
  v13 = v4 - 1;
  do
  {
    v15 = *(unsigned __int8 *)v8;
    v8 = (const void **)((char *)v8 + 1);
    v14 = v15;
    v17 = *v12++;
    v16 = v17;
    v19 = v13-- != 0;
    result = v14 == v16;
  }
  while (v14 == v16 && v19);
  return result;
}

void sub_1000046F4(uint64_t a1)
{
  std::string __p;
  std::__fs::filesystem::path __new_symlink;

  sub_10001122C(&__new_symlink.__pn_, "/var/db/timezone/icutz");
  sub_10001122C(&__p, "/var/db/icutz");
  std::__fs::filesystem::__remove(&__new_symlink, 0);
  std::__fs::filesystem::__remove((const std::__fs::filesystem::path *)&__p, 0);
  if (*(char *)(a1 + 31) < 0)
  {
    if (!*(_QWORD *)(a1 + 16))
      goto LABEL_6;
    goto LABEL_5;
  }
  if (*(_BYTE *)(a1 + 31))
LABEL_5:
    std::__fs::filesystem::__create_symlink((const std::__fs::filesystem::path *)(a1 + 56), &__new_symlink, 0);
LABEL_6:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(__new_symlink.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__new_symlink.__pn_.__r_.__value_.__l.__data_);
}

void sub_1000047A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_100004800(uint64_t a1)
{
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)a1 = -1;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = -1;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_QWORD *)(a1 + 104) = 0;
  sub_1000048A8();
}

void sub_10000486C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  uint64_t v10;
  void **v11;
  void **v12;

  a10 = (void **)(v10 + 88);
  sub_10000692C(&a10);
  if (*(char *)(v10 + 87) < 0)
    operator delete(*(void **)(v10 + 64));
  sub_100011B5C(v10, v12, v11);
  _Unwind_Resume(a1);
}

void sub_1000048A8()
{
  operator new();
}

void sub_100004D38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  void *v25;

  __cxa_free_exception(v25);
  _Unwind_Resume(a1);
}

void sub_100004DC4(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)a1 = -1;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = -1;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  sub_100003204(a2, a1 + 64);
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  sub_1000048A8();
}

void sub_100004E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10)
{
  char *v10;
  void **v11;
  void **v12;
  void **v13;
  void **v14;
  void **v15;

  v15 = v11;
  a10 = v15;
  sub_10000692C(&a10);
  if (v10[87] < 0)
    operator delete(*v12);
  if (v10[63] < 0)
    operator delete(*v14);
  if (v10[31] < 0)
    operator delete(*v13);
  _Unwind_Resume(a1);
}

BOOL sub_100004EA4(uint64_t a1, uint64_t a2)
{
  return sub_1000029D8(a1, a2) || sub_100002B14(a1, a2);
}

BOOL sub_100004EE4(uint64_t a1, std::__fs::filesystem::path::__string_view a2)
{
  a2.__data_ += 64;
  return sub_100004520((const std::__fs::filesystem::path *)(a1 + 64), a2);
}

uint64_t sub_100004EF0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t result;
  _BOOL4 v11;

  v3 = *(_QWORD **)(a1 + 88);
  v2 = *(_QWORD **)(a1 + 96);
  v5 = *(_QWORD **)(a2 + 88);
  v4 = *(_QWORD **)(a2 + 96);
  if (v3 == v2 || v5 == v4)
  {
LABEL_11:
    v11 = v5 == v4;
    return v3 == v2 && v11;
  }
  else
  {
    while (1)
    {
      result = (**(uint64_t (***)(_QWORD, _QWORD))*v3)(*v3, *v5);
      if (!(_DWORD)result)
        break;
      v3 += 2;
      v5 += 2;
      v2 = *(_QWORD **)(a1 + 96);
      v4 = *(_QWORD **)(a2 + 96);
      if (v3 == v2 || v5 == v4)
        goto LABEL_11;
    }
  }
  return result;
}

uint64_t sub_100004F70(uint64_t result)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;

  v1 = *(uint64_t **)(result + 88);
  v2 = *(uint64_t **)(result + 96);
  while (v1 != v2)
  {
    v3 = *v1;
    v1 += 2;
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  }
  return result;
}

char *sub_100004FA8@<X0>(char *result@<X0>, uint64_t a2@<X8>)
{
  if (result[63] < 0)
    return (char *)sub_1000067AC((_BYTE *)a2, *((void **)result + 5), *((_QWORD *)result + 6));
  *(_OWORD *)a2 = *(_OWORD *)(result + 40);
  *(_QWORD *)(a2 + 16) = *((_QWORD *)result + 7);
  return result;
}

void sub_100004FD4(std::__fs::filesystem::path *this@<X1>, const std::__fs::filesystem::path *a2@<X0>, std::__fs::filesystem::path *a3@<X8>)
{
  std::__fs::filesystem::path::__string_view v7;
  _BOOL4 v9;
  _BOOL4 v11;
  _BOOL4 v13;
  void *__p[2];
  std::string::size_type v15;
  std::__fs::filesystem::path __dst;
  std::__fs::filesystem::path::iterator v17;
  std::__fs::filesystem::path::iterator v18;
  std::__fs::filesystem::path::iterator v19;
  std::__fs::filesystem::path::iterator v20;

  a3->__pn_.__r_.__value_.__r.__words[0] = 0;
  a3->__pn_.__r_.__value_.__l.__size_ = 0;
  a3->__pn_.__r_.__value_.__r.__words[2] = 0;
  std::__fs::filesystem::path::begin(&v20, this);
  std::__fs::filesystem::path::begin(&v19, a2);
  while (1)
  {
    std::__fs::filesystem::path::end(&v18, a2);
    if (v19.__path_ptr_ == v18.__path_ptr_ && v19.__entry_.__data_ == v18.__entry_.__data_)
    {
      v9 = 0;
    }
    else
    {
      std::__fs::filesystem::path::end(&v17, this);
      if (v20.__path_ptr_ == v17.__path_ptr_ && v20.__entry_.__data_ == v17.__entry_.__data_)
      {
        v9 = 0;
      }
      else
      {
        if (SHIBYTE(v19.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
          sub_1000067AC(&__dst, v19.__stashed_elem_.__pn_.__r_.__value_.__l.__data_, v19.__stashed_elem_.__pn_.__r_.__value_.__l.__size_);
        else
          __dst = v19.__stashed_elem_;
        if (SHIBYTE(v20.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
        {
          sub_1000067AC(__p, v20.__stashed_elem_.__pn_.__r_.__value_.__l.__data_, v20.__stashed_elem_.__pn_.__r_.__value_.__l.__size_);
        }
        else
        {
          *(_OWORD *)__p = *(_OWORD *)&v20.__stashed_elem_.__pn_.__r_.__value_.__l.__data_;
          v15 = v20.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2];
        }
        v7.__data_ = (const std::string_view::value_type *)__p;
        v9 = sub_100004520(&__dst, v7);
        if (SHIBYTE(v15) < 0)
          operator delete(__p[0]);
        if (SHIBYTE(__dst.__pn_.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__dst.__pn_.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v17.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v17.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v18.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v18.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
    if (!v9)
      break;
    std::__fs::filesystem::path::iterator::__increment(&v19);
    std::__fs::filesystem::path::iterator::__increment(&v20);
  }
  std::__fs::filesystem::path::end(&v18, this);
  v11 = v20.__path_ptr_ == v18.__path_ptr_ && v20.__entry_.__data_ == v18.__entry_.__data_;
  if (SHIBYTE(v18.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v18.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
    if (!v11)
      goto LABEL_53;
  }
  else if (!v11)
  {
    goto LABEL_53;
  }
  while (1)
  {
    std::__fs::filesystem::path::end(&v18, a2);
    v13 = v19.__path_ptr_ != v18.__path_ptr_ || v19.__entry_.__data_ != v18.__entry_.__data_;
    if (SHIBYTE(v18.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v18.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
    if (!v13)
      break;
    if (SHIBYTE(v19.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
    {
      sub_1000067AC(&v18, v19.__stashed_elem_.__pn_.__r_.__value_.__l.__data_, v19.__stashed_elem_.__pn_.__r_.__value_.__l.__size_);
    }
    else
    {
      *(_OWORD *)&v18.__stashed_elem_.__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&v19.__stashed_elem_.__pn_.__r_.__value_.__l.__data_;
      v18.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2] = v19.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2];
    }
    sub_1000052C4(a3, &v18.__stashed_elem_);
    if (SHIBYTE(v18.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v18.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
    std::__fs::filesystem::path::iterator::__increment(&v19);
  }
LABEL_53:
  if (SHIBYTE(v19.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v19.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(v20.__stashed_elem_.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v20.__stashed_elem_.__pn_.__r_.__value_.__l.__data_);
}

void sub_100005218(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  uint64_t v34;
  uint64_t v35;

  if (*(char *)(v35 - 137) < 0)
    operator delete(*(void **)(v35 - 160));
  if (*(char *)(v35 - 81) < 0)
    operator delete(*(void **)(v35 - 104));
  if (*(char *)(v34 + 23) < 0)
    operator delete(*(void **)v34);
  _Unwind_Resume(exception_object);
}

std::__fs::filesystem::path *sub_1000052C4(std::__fs::filesystem::path *a1, std::__fs::filesystem::path *this)
{
  int v4;
  std::__fs::filesystem::path *v5;
  std::string::size_type size;

  if (std::__fs::filesystem::path::__root_directory(this).__size_)
  {
    std::string::operator=(&a1->__pn_, &this->__pn_);
  }
  else
  {
    if (std::__fs::filesystem::path::__filename(a1).__size_)
      std::string::push_back(&a1->__pn_, 47);
    v4 = SHIBYTE(this->__pn_.__r_.__value_.__r.__words[2]);
    if (v4 >= 0)
      v5 = this;
    else
      v5 = (std::__fs::filesystem::path *)this->__pn_.__r_.__value_.__r.__words[0];
    if (v4 >= 0)
      size = HIBYTE(this->__pn_.__r_.__value_.__r.__words[2]);
    else
      size = this->__pn_.__r_.__value_.__l.__size_;
    std::string::append(&a1->__pn_, (const std::string::value_type *)v5, size);
  }
  return a1;
}

void sub_100005338()
{
  _BYTE v0[8];

  sub_100004800((uint64_t)v0);
}

void sub_1000053D0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1000053E4((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_1000053E4(uint64_t a1)
{
  void **v3;

  v3 = (void **)(a1 + 88);
  sub_10000692C(&v3);
  if (*(char *)(a1 + 87) < 0)
    operator delete(*(void **)(a1 + 64));
  if (*(char *)(a1 + 63) < 0)
    operator delete(*(void **)(a1 + 40));
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return a1;
}

void sub_10000544C(std::__fs::filesystem::path *a1@<X8>)
{
  std::__fs::filesystem::path v2;

  sub_10001122C(&v2.__pn_, "/var/db/timezone/tz_latest");
  std::__fs::filesystem::__read_symlink(a1, &v2, 0);
  if (SHIBYTE(v2.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v2.__pn_.__r_.__value_.__l.__data_);
}

void sub_1000054A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1000054C0(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  _BOOL4 v4;
  _BOOL4 v5;
  BOOL v6;
  const char *v7;
  std::logic_error *exception;
  std::string __p;
  std::string __str;
  std::__fs::filesystem::path::__string_view v11;
  std::__fs::filesystem::path::__string_view v12;

  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  sub_100003204(a1, (uint64_t)&__p);
  sub_10000337C((const std::__fs::filesystem::path *)&__p, (uint64_t)&__str);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  sub_10000337C((const std::__fs::filesystem::path *)&__str, (uint64_t)&__p);
  v11.__data_ = (const std::string_view::value_type *)&unk_100018000;
  v4 = sub_100004520((const std::__fs::filesystem::path *)&__p, v11);
  v5 = v4;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v5)
      goto LABEL_5;
  }
  else if (v4)
  {
LABEL_5:
    std::string::operator=(a2, &__str);
    goto LABEL_10;
  }
  sub_10001122C(&__p, "/usr/share/zoneinfo.default");
  v12.__data_ = (const std::string_view::value_type *)&__p;
  v6 = sub_100004520((const std::__fs::filesystem::path *)a1, v12);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (!v6)
  {
    if (*(char *)(a1 + 23) >= 0)
      v7 = (const char *)a1;
    else
      v7 = *(const char **)a1;
    warn("Bad zoneinfo link %s", v7);
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::logic_error::logic_error(exception, "bad_zoneinfo_link");
  }
LABEL_10:
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
}

void sub_100005610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  uint64_t v22;
  void *v23;

  __cxa_free_exception(v23);
  if (a22 < 0)
    operator delete(__p);
  if (*(char *)(v22 + 23) < 0)
    operator delete(*(void **)v22);
  _Unwind_Resume(a1);
}

void sub_100005670(std::string *a1@<X8>)
{
  std::string __p;
  std::__fs::filesystem::path v3;

  sub_10001122C(&__p, "/var/db/timezone/zoneinfo");
  std::__fs::filesystem::__read_symlink(&v3, (const std::__fs::filesystem::path *)&__p, 0);
  sub_1000054C0((uint64_t)&v3, a1);
  if (SHIBYTE(v3.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v3.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_1000056E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  if (a14 < 0)
    operator delete(a9);
  _Unwind_Resume(exception_object);
}

void sub_100005718()
{
  _BOOL4 v0;
  std::string::size_type size;
  std::__fs::filesystem::path *p_to;
  std::error_code *v3;
  std::runtime_error *exception;
  std::string v5;
  std::string __p;
  std::__fs::filesystem::path v7;
  std::__fs::filesystem::path __to;
  char *v9;

  sub_10001122C(&v7.__pn_, "/var/db/timezone/localtime");
  std::__fs::filesystem::__read_symlink(&__to, &v7, 0);
  if (SHIBYTE(v7.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v7.__pn_.__r_.__value_.__l.__data_);
  sub_10001122C(&__p, "/var/db/timezone/zoneinfo");
  sub_100004FD4((std::__fs::filesystem::path *)&__p, &__to, &v7);
  if (SHIBYTE(v7.__pn_.__r_.__value_.__r.__words[2]) < 0)
  {
    v0 = v7.__pn_.__r_.__value_.__l.__size_ == 0;
    operator delete(v7.__pn_.__r_.__value_.__l.__data_);
  }
  else
  {
    v0 = SHIBYTE(v7.__pn_.__r_.__value_.__r.__words[2]) == 0;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v0)
  {
    sub_10001122C(&__p, "/usr/share/zoneinfo");
    sub_100004FD4((std::__fs::filesystem::path *)&__p, &__to, &v7);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    size = HIBYTE(v7.__pn_.__r_.__value_.__r.__words[2]);
    if ((v7.__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = v7.__pn_.__r_.__value_.__l.__size_;
    if (size)
    {
      sub_10001122C(&v5, "/var/db/timezone/zoneinfo");
      sub_100003800(&v7, (uint64_t)&v5, (std::__fs::filesystem::path *)&__p);
      sub_100011BB8((uint64_t)&__to, (__int128 *)&__p, (uint64_t)&v5, &v9);
      if (*v9 >= 0)
        p_to = &__to;
      else
        p_to = (std::__fs::filesystem::path *)__to.__pn_.__r_.__value_.__r.__words[0];
      warn("Correcting localtime link to %s", (const char *)p_to);
      std::__fs::filesystem::__status(&__to, 0);
      if (__p.__r_.__value_.__s.__data_[0] != 255 && __p.__r_.__value_.__s.__data_[0])
      {
        remove((const std::__fs::filesystem::path *)"/var/db/timezone/localtime", v3);
        sub_10001122C(&__p, "/var/db/timezone/localtime");
        std::__fs::filesystem::__create_symlink(&__to, (const std::__fs::filesystem::path *)&__p, 0);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        if (SHIBYTE(v7.__pn_.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v7.__pn_.__r_.__value_.__l.__data_);
        goto LABEL_9;
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "localtime_link_bad_zone");
    }
    else
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "localtime_link_invalid");
    }
  }
LABEL_9:
  if (SHIBYTE(__to.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__to.__pn_.__r_.__value_.__l.__data_);
}

#error "100005A10: call analysis failed (funcsize=48)"

void sub_100005A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;

  if (a21 < 0)
    operator delete(__p);
  if (*(char *)(v21 - 25) < 0)
    operator delete(*(void **)(v21 - 48));
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_100005AC8(const char *a1)
{
  uint64_t result;
  int v2;

  if (a1[23] < 0)
    a1 = *(const char **)a1;
  result = open(a1, 0x1000000);
  if ((_DWORD)result != -1)
  {
    v2 = result;
    fcntl(result, 64, 4);
    return close(v2);
  }
  return result;
}

void sub_100005B30()
{
  std::string __p;

  sub_10001122C(&__p, "/var/db/timezone/");
  sub_100005AC8((const char *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  sub_10001122C(&__p, "/var/db/timezone/tz/");
  sub_100005AC8((const char *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_100005BA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_100005BC8()
{
  std::__fs::filesystem::path __to;
  std::__fs::filesystem::path v1;
  std::__fs::filesystem::path __new_symlink;

  sub_10001122C(&__new_symlink.__pn_, "/var/db/timezone/icutz");
  sub_10001122C(&v1.__pn_, "/var/db/icutz");
  std::__fs::filesystem::__status(&v1, 0);
  if (__to.__pn_.__r_.__value_.__s.__data_[0] && __to.__pn_.__r_.__value_.__s.__data_[0] != 255)
    std::__fs::filesystem::__status(&__new_symlink, 0);
  std::__fs::filesystem::__status(&v1, 0);
  if (__to.__pn_.__r_.__value_.__s.__data_[0] && __to.__pn_.__r_.__value_.__s.__data_[0] != 255)
    std::__fs::filesystem::__remove(&v1, 0);
  if (SHIBYTE(v1.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v1.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(__new_symlink.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__new_symlink.__pn_.__r_.__value_.__l.__data_);
}

void sub_100005CCC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  __cxa_begin_catch(a1);
  warn("Could not migrate /var/db/icutz to /var/db/timezone/icutz");
  __cxa_end_catch();
  JUMPOUT(0x100005C70);
}

void sub_100005D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  uint64_t v18;

  __cxa_end_catch();
  if (a18 < 0)
    operator delete(__p);
  if (*(char *)(v18 - 17) < 0)
    operator delete(*(void **)(v18 - 40));
  _Unwind_Resume(a1);
}

void start()
{
  int v0;
  std::error_code *v1;
  _BYTE v2[8];

  v0 = setiopolicy_np(9, 0, 1);
  if (v0)
    warn("setiopolicy IOPOL_TYPE_VFS_ALLOW_LOW_SPACE_WRITES returned error code %d", v0);
  sub_100005B30();
  sub_100005BC8();
  remove((const std::__fs::filesystem::path *)"/var/db/icu", v1);
  sub_100004800((uint64_t)v2);
}

void sub_1000062A0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,void *a50,uint64_t a51,int a52,__int16 a53,char a54,char a55,void *a56,uint64_t a57,int a58,__int16 a59,char a60,char a61,char a62,uint64_t a63)
{
  void *a71;

  if (a2)
  {
    if (a20 < 0)
      operator delete(__p);
    sub_1000065F0(&a71);
    sub_1000053E4((uint64_t)&a22);
    sub_1000053E4((uint64_t)&a36);
    if (a55 < 0)
      operator delete(a50);
    if (a61 < 0)
      operator delete(a56);
    sub_1000053E4((uint64_t)&a62);
    __cxa_begin_catch(a1);
    warn("Unable to locate data; resetting to system partition");
    sub_100005338();
  }
  _Unwind_Resume(a1);
}

void (__cdecl ***sub_1000064E8(void (__cdecl ***a1)(std::ofstream *__hidden this), uint64_t a2, int a3))(std::ofstream *__hidden this)
{
  _QWORD *v6;
  void (__cdecl **v7)(std::ofstream *__hidden);
  void (__cdecl **v8)(std::ofstream *__hidden);
  std::ios_base *v9;

  v6 = a1 + 1;
  *a1 = v7;
  *(_QWORD *)((char *)*(v7 - 3) + (_QWORD)a1) = v8;
  v9 = (std::ios_base *)((char *)*(*a1 - 3) + (_QWORD)a1);
  std::ios_base::init(v9, a1 + 1);
  v9[1].__vftable = 0;
  v9[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf(v6);
  if (!std::filebuf::open(v6, a2, a3 | 0x10u))
    std::ios_base::clear((std::ios_base *)((char *)*(*a1 - 3) + (_QWORD)a1), *(_DWORD *)((char *)*(*a1 - 3) + (_QWORD)a1 + 32) | 4);
  return a1;
}

void sub_1000065B8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  std::ostream::~ostream(v1, v2 + 8);
  std::ios::~ios(v1 + 416);
  _Unwind_Resume(a1);
}

_QWORD *sub_1000065F0(_QWORD *a1)
{
  uint64_t v2;

  std::filebuf::~filebuf(a1 + 1);
  std::ios::~ios(a1 + 52);
  return a1;
}

uint64_t sub_100006648(const void *a1, size_t a2, void *__s2, size_t a4)
{
  size_t v7;
  int v8;

  if (a4 >= a2)
    v7 = a2;
  else
    v7 = a4;
  v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0)
      return 1;
  }
  else
  {
    if (a2 == a4)
      return 0;
    if (a2 >= a4)
      return 1;
  }
  return 255;
}

uint64_t sub_1000066A4(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

void sub_1000066FC()
{
  sub_100006710("basic_string");
}

void sub_100006710(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100006760(exception, a1);
}

void sub_10000674C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100006760(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100006784()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_1000067AC(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_1000066FC();
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

uint64_t sub_100006838(std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  const std::error_category *v5;
  std::string::value_type v7;

  if (((1 << a1[3].__pn_.__r_.__value_.__s.__data_[1]) & 0x13) != 0)
  {
    std::__fs::filesystem::__status(a1, __ec);
    return v7;
  }
  else
  {
    if (__ec)
    {
      if ((a1[3].__pn_.__r_.__value_.__s.__data_[0] + 1) > 1u)
      {
        __ec->__val_ = 0;
        v5 = std::system_category();
      }
      else
      {
        v5 = std::generic_category();
        *(_QWORD *)&__ec->__val_ = 2;
      }
      __ec->__cat_ = v5;
    }
    return a1[3].__pn_.__r_.__value_.__s.__data_[0];
  }
}

std::__fs::filesystem::file_status sub_1000068CC@<X0>(std::__fs::filesystem::path *a1@<X0>, std::error_code *a2@<X1>, uint64_t a3@<X8>)
{
  std::__fs::filesystem::file_status result;
  int v6;

  if (((1 << a1[3].__pn_.__r_.__value_.__s.__data_[1]) & 0x17) != 0)
    return std::__fs::filesystem::__status(a1, a2);
  result = (std::__fs::filesystem::file_status)sub_100006838(a1, a2);
  v6 = HIDWORD(a1[2].__pn_.__r_.__value_.__r.__words[2]);
  *(_BYTE *)a3 = result.__ft_;
  *(_DWORD *)(a3 + 4) = v6;
  return result;
}

void sub_10000692C(void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = v2;
    if ((void *)v4 != v2)
    {
      do
        v4 = sub_1000066A4(v4 - 16);
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_10000699C()
{
  sub_100006710("vector");
}

void *sub_1000069B0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    sub_100006784();
  return operator new(16 * a2);
}

uint64_t sub_1000069E4(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 16;
    sub_1000066A4(i - 16);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_100006A30(std::locale *a1, const char *a2, int a3)
{
  std::locale *v5;

  v5 = sub_100006AC0(a1);
  LODWORD(v5[3].__locale_) = a3;
  *(_OWORD *)((char *)&v5[3].__locale_ + 4) = 0u;
  *(_OWORD *)((char *)&v5[5].__locale_ + 4) = 0u;
  HIDWORD(v5[7].__locale_) = 0;
  strlen(a2);
  sub_100006B1C();
}

void sub_100006AA4(_Unwind_Exception *a1)
{
  std::locale *v1;

  sub_1000066A4((uint64_t)&v1[5]);
  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

std::locale *sub_100006AC0(std::locale *a1)
{
  std::locale *v2;

  v2 = std::locale::locale(a1);
  a1[1].__locale_ = (std::locale::__imp *)std::locale::use_facet(v2, &std::ctype<char>::id);
  a1[2].__locale_ = (std::locale::__imp *)std::locale::use_facet(a1, &std::collate<char>::id);
  return a1;
}

void sub_100006B08(_Unwind_Exception *a1)
{
  std::locale *v1;

  std::locale::~locale(v1);
  _Unwind_Resume(a1);
}

void sub_100006B1C()
{
  operator new();
}

void sub_100006C70(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void sub_100006C8C()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_parse);
}

void sub_100006CC4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100006CD8(uint64_t a1, uint64_t a2)
{
  __int128 v2;

  sub_1000073A4(&v2, a2);
}

char *sub_100006D48(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;

  v6 = a2;
  do
  {
    v7 = v6;
    v6 = sub_10000770C(a1, (char *)v6, a3);
  }
  while (v6 != v7);
  if (v7 == a2)
    operator new();
  if (v7 != (unsigned __int8 *)a3)
  {
    if (*v7 == 124)
    {
      v8 = v7 + 1;
      v9 = v7 + 1;
      do
      {
        v10 = v9;
        v9 = sub_10000770C(a1, (char *)v9, a3);
      }
      while (v9 != v10);
      if (v10 == v8)
        operator new();
      sub_10000762C();
    }
    return (char *)v7;
  }
  return a3;
}

unsigned __int8 *sub_100006E90(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  unsigned __int8 *v6;

  v3 = a2;
  if (a2 == a3)
    return a2;
  v4 = a3;
  if (*a2 == 94)
    operator new();
  if (a2 != a3)
  {
    do
    {
      v6 = v3;
      v3 = sub_10000E568(a1, v3, v4);
    }
    while (v3 != v6);
    if (v6 != v4)
    {
      if (v6 + 1 == v4 && *v6 == 36)
        operator new();
      sub_10000E51C();
    }
  }
  return v4;
}

unsigned __int8 *sub_100006FDC(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  unsigned __int8 *v6;

  v3 = a3;
  v6 = sub_10000EB60(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2)
LABEL_8:
    sub_10000E51C();
  if (v6 != (unsigned __int8 *)v3)
  {
    if (*v6 == 124)
    {
      if (sub_10000EB60(a1, (char *)v6 + 1, v3) != v6 + 1)
        sub_10000762C();
      goto LABEL_8;
    }
    return v6;
  }
  return (unsigned __int8 *)v3;
}

unsigned __int8 *sub_10000707C(uint64_t a1, unsigned __int8 *__s, unsigned __int8 *a3)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;

  v6 = (unsigned __int8 *)memchr(__s, 10, a3 - __s);
  if (v6)
    v7 = v6;
  else
    v7 = a3;
  if (v7 == __s)
    operator new();
  sub_100006E90(a1, __s, v7);
  if (v7 == a3)
    v8 = v7;
  else
    v8 = v7 + 1;
  if (v8 != a3)
  {
    v9 = (unsigned __int8 *)memchr(v8, 10, a3 - v8);
    if (v9)
      v10 = v9;
    else
      v10 = a3;
    if (v10 != v8)
    {
      sub_100006E90(a1, v8, v10);
      sub_10000762C();
    }
    operator new();
  }
  return a3;
}

char *sub_1000071D4(uint64_t a1, char *__s, char *a3)
{
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;

  v6 = (char *)memchr(__s, 10, a3 - __s);
  if (v6)
    v7 = v6;
  else
    v7 = a3;
  if (v7 == __s)
    operator new();
  sub_100006FDC(a1, __s, v7);
  if (v7 == a3)
    v8 = v7;
  else
    v8 = v7 + 1;
  if (v8 != a3)
  {
    v9 = (char *)memchr(v8, 10, a3 - v8);
    if (v9)
      v10 = v9;
    else
      v10 = a3;
    if (v10 != v8)
    {
      sub_100006FDC(a1, v8, v10);
      sub_10000762C();
    }
    operator new();
  }
  return a3;
}

void sub_10000732C()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_grammar);
}

void sub_100007364(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000737C()
{
  operator delete();
}

void sub_100007390(uint64_t a1, _DWORD *a2)
{
  *a2 = -1000;
}

void sub_1000073A4(_QWORD *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1000073FC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(exception_object);
}

void sub_100007420(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

uint64_t sub_100007444(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t sub_10000745C(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL sub_10000749C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

_QWORD *sub_1000074E8(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100014520;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_10000752C(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100014520;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_100007580(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

_QWORD *sub_100007594(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100014520;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_1000075D8(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100014520;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

void sub_10000762C()
{
  operator new();
}

unsigned __int8 *sub_10000770C(uint64_t a1, char *a2, char *a3)
{
  unsigned __int8 *result;
  unsigned __int8 *v7;

  result = (unsigned __int8 *)sub_1000077A0(a1, a2, a3);
  if (result == (unsigned __int8 *)a2)
  {
    v7 = sub_100007A48(a1, (unsigned __int8 *)a2, (unsigned __int8 *)a3);
    result = (unsigned __int8 *)a2;
    if (v7 != (unsigned __int8 *)a2)
      return sub_100007C50(a1, v7, (unsigned __int8 *)a3);
  }
  return result;
}

char *sub_1000077A0(uint64_t a1, char *a2, char *a3)
{
  int v6;
  char *v7;
  BOOL v8;
  char *v9;
  int v11;
  int v13;
  std::locale v14[3];
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  if (a2 != a3)
  {
    v6 = *a2;
    if (v6 > 91)
    {
      if (v6 == 92)
      {
        if (a2 + 1 != a3)
        {
          v13 = a2[1];
          if (v13 == 66 || v13 == 98)
            sub_100007F50();
        }
      }
      else if (v6 == 94)
      {
        operator new();
      }
    }
    else
    {
      if (v6 == 36)
        operator new();
      v8 = v6 == 40;
      v7 = a2 + 1;
      v8 = !v8 || v7 == a3;
      if (!v8)
      {
        v8 = *v7 == 63;
        v9 = a2 + 2;
        if (v8 && v9 != a3)
        {
          v11 = *v9;
          if (v11 == 33)
          {
            sub_100006AC0(v14);
            v15 = 0u;
            v17 = 0;
            v16 = 0u;
            LODWORD(v15) = *(_DWORD *)(a1 + 24);
            sub_100006B1C(v14, a2 + 3, a3);
            sub_100007FD4();
          }
          if (v11 == 61)
          {
            sub_100006AC0(v14);
            v15 = 0u;
            v17 = 0;
            v16 = 0u;
            LODWORD(v15) = *(_DWORD *)(a1 + 24);
            sub_100006B1C(v14, a2 + 3, a3);
            sub_100007FD4();
          }
        }
      }
    }
  }
  return a2;
}

void sub_100007A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  sub_1000066A4((uint64_t)&a14);
  std::locale::~locale(&a9);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_100007A48(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  int v6;
  _DWORD *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v6 = (char)*a2;
  if (v6 > 62)
  {
    if (v6 > 91)
    {
      if (v6 == 92)
        return sub_10000964C(a1, a2, a3);
      if (v6 != 123)
        return sub_100009928(a1, a2, a3);
    }
    else
    {
      if (v6 == 91)
        return sub_1000096EC(a1, a2, a3);
      if (v6 != 63)
        return sub_100009928(a1, a2, a3);
    }
LABEL_28:
    sub_1000098DC();
  }
  if (v6 == 40)
  {
    if (a2 + 1 == a3)
      goto LABEL_29;
    if (a2 + 2 != a3 && a2[1] == 63 && a2[2] == 58)
    {
      v8 = (_DWORD *)(a1 + 36);
      ++*(_DWORD *)(a1 + 36);
      v9 = (unsigned __int8 *)sub_100006D48(a1, a2 + 3, a3);
      if (v9 == a3)
        goto LABEL_29;
      v10 = v9;
      if (*v9 != 41)
        goto LABEL_29;
    }
    else
    {
      sub_1000097FC(a1);
      v8 = (_DWORD *)(a1 + 36);
      ++*(_DWORD *)(a1 + 36);
      v11 = (unsigned __int8 *)sub_100006D48(a1, v3 + 1, a3);
      if (v11 == a3 || (v10 = v11, *v11 != 41))
LABEL_29:
        sub_100008078();
      sub_100009870(a1);
    }
    --*v8;
    return v10 + 1;
  }
  if (v6 == 46)
    operator new();
  if ((v6 - 42) < 2)
    goto LABEL_28;
  return sub_100009928(a1, a2, a3);
}

unsigned __int8 *sub_100007C50(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  int v8;
  unsigned __int8 *v9;
  unsigned __int8 *v11;
  int v12;
  int v13;

  if (a2 == a3)
    return a2;
  v5 = (char)*a2;
  if (v5 <= 62)
  {
    if (v5 == 42 || v5 == 43)
LABEL_18:
      sub_10000DE40();
    return a2;
  }
  if (v5 == 63)
    goto LABEL_18;
  if (v5 == 123)
  {
    v6 = a2 + 1;
    v7 = sub_10000DF88(a1, a2 + 1, a3, &v13);
    if (v7 == v6)
      goto LABEL_23;
    if (v7 != a3)
    {
      v8 = (char)*v7;
      if (v8 != 44)
      {
        if (v8 == 125)
          goto LABEL_18;
LABEL_23:
        sub_10000E024();
      }
      v9 = v7 + 1;
      if (v7 + 1 == a3)
        goto LABEL_23;
      if (*v9 == 125)
        goto LABEL_18;
      v12 = -1;
      v11 = sub_10000DF88(a1, v9, a3, &v12);
      if (v11 != v9 && v11 != a3 && *v11 == 125)
      {
        if (v12 >= v13)
          goto LABEL_18;
        goto LABEL_23;
      }
    }
    sub_10000E070();
  }
  return a2;
}

void sub_100007F50()
{
  operator new();
}

void sub_100007FD4()
{
  operator new();
}

void sub_100008054()
{
  operator delete();
}

void sub_100008078()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_paren);
}

void sub_1000080B0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_1000080C4(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100014520;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_100008108(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100014520;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_10000815C(uint64_t result, uint64_t a2)
{
  int v2;
  uint64_t v4;

  if (*(_BYTE *)(a2 + 92))
  {
    if (*(_QWORD *)(a2 + 16) != *(_QWORD *)(a2 + 8) || (*(_BYTE *)(a2 + 88) & 1) != 0)
    {
LABEL_12:
      v4 = 0;
      *(_DWORD *)a2 = -993;
      goto LABEL_13;
    }
  }
  else
  {
    if (!*(_BYTE *)(result + 16))
      goto LABEL_12;
    v2 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 16) - 1);
    if (v2 != 13 && v2 != 10)
      goto LABEL_12;
  }
  *(_DWORD *)a2 = -994;
  v4 = *(_QWORD *)(result + 8);
LABEL_13:
  *(_QWORD *)(a2 + 80) = v4;
  return result;
}

_QWORD *sub_1000081BC(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100014520;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_100008200(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100014520;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_100008254(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  int v3;
  BOOL v4;
  uint64_t v5;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) && (*(_BYTE *)(a2 + 88) & 2) == 0
    || *(_BYTE *)(result + 16) && ((v3 = *v2, v3 != 13) ? (v4 = v3 == 10) : (v4 = 1), v4))
  {
    *(_DWORD *)a2 = -994;
    v5 = *(_QWORD *)(result + 8);
  }
  else
  {
    v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(_QWORD *)(a2 + 80) = v5;
  return result;
}

std::locale *sub_1000082A4(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_1000145E0;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100014520;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_1000082FC(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_1000145E0;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100014520;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete();
}

uint64_t sub_100008364(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;

  v2 = *(unsigned __int8 **)(a2 + 8);
  v3 = *(unsigned __int8 **)(a2 + 24);
  if (v2 == v3)
    goto LABEL_17;
  v4 = *(unsigned __int8 **)(a2 + 16);
  if (v4 == v3)
  {
    if ((*(_BYTE *)(a2 + 88) & 8) == 0)
    {
      v6 = *(v3 - 1);
      goto LABEL_13;
    }
LABEL_17:
    v10 = 0;
    goto LABEL_25;
  }
  if (v4 == v2)
  {
    v5 = *(_DWORD *)(a2 + 88);
    if ((v5 & 0x80) == 0)
    {
      if ((v5 & 4) == 0)
      {
        v6 = *v2;
LABEL_13:
        if (v6 == 95
          || (v6 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v6) & 0x500) != 0)
        {
          v10 = 1;
          goto LABEL_25;
        }
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }
  v7 = *(v4 - 1);
  v8 = *v4;
  v9 = v7 == 95 || (v7 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v7) & 0x500) != 0;
  v11 = (_DWORD)v8 == 95
     || (v8 & 0x80) == 0 && (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) + 16) + 4 * v8) & 0x500) != 0;
  v10 = v9 != v11;
LABEL_25:
  if (*(unsigned __int8 *)(result + 40) == v10)
  {
    v12 = 0;
    v13 = -993;
  }
  else
  {
    v12 = *(_QWORD *)(result + 8);
    v13 = -994;
  }
  *(_DWORD *)a2 = v13;
  *(_QWORD *)(a2 + 80) = v12;
  return result;
}

uint64_t sub_100008478(uint64_t a1, uint64_t a2, char a3, uint64_t a4, int a5)
{
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;

  *(_QWORD *)a1 = off_100014628;
  *(_QWORD *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 64) = v9;
  if (v9)
  {
    v10 = (unint64_t *)(v9 + 8);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 56);
  *(_DWORD *)(a1 + 80) = a5;
  *(_BYTE *)(a1 + 84) = a3;
  return a1;
}

std::locale *sub_100008504(std::locale *a1)
{
  std::locale *v2;
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100014628;
  v2 = a1 + 2;
  sub_1000066A4((uint64_t)&a1[7]);
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)off_100014520;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_10000856C(std::locale *a1)
{
  std::locale *v2;
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100014628;
  v2 = a1 + 2;
  sub_1000066A4((uint64_t)&a1[7]);
  std::locale::~locale(v2);
  a1->__locale_ = (std::locale::__imp *)off_100014520;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete();
}

void sub_1000085E4(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  char v9;
  char *v10;
  unint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  void *__p;
  char *v19;
  uint64_t v20;
  __int128 v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  char v27;
  char v28;
  uint64_t v29;

  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0uLL;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  __p = 0;
  v19 = 0;
  v4 = (*(_DWORD *)(a1 + 44) + 1);
  v6 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v20 = 0;
  *(_QWORD *)&v21 = v5;
  *((_QWORD *)&v21 + 1) = v5;
  v22 = 0;
  sub_100008BC4((char **)&__p, v4, &v21);
  v23 = v6;
  v24 = v6;
  v25 = 0;
  v26 = v21;
  v27 = v22;
  v29 = v6;
  v28 = 1;
  v7 = *(_QWORD *)(a2 + 16);
  if (*(_BYTE *)(a2 + 92))
    v8 = v7 == *(_QWORD *)(a2 + 8);
  else
    v8 = 0;
  v9 = v8;
  if (*(unsigned __int8 *)(a1 + 84) == sub_1000087DC(a1 + 16, v7, *(_QWORD *)(a2 + 24), (uint64_t *)&__p, *(_DWORD *)(a2 + 88) & 0xFBF | 0x40u, v9))
  {
    *(_DWORD *)a2 = -993;
    *(_QWORD *)(a2 + 80) = 0;
    v10 = (char *)__p;
    goto LABEL_13;
  }
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(a1 + 8);
  v10 = (char *)__p;
  v11 = 0xAAAAAAAAAAAAAAABLL * ((v19 - (_BYTE *)__p) >> 3);
  if (v11 < 2)
  {
LABEL_13:
    if (!v10)
      return;
    goto LABEL_14;
  }
  v12 = 0;
  v13 = *(_DWORD *)(a1 + 80);
  v14 = *(_QWORD *)(a2 + 32);
  v15 = 1;
  do
  {
    v16 = &v10[24 * v15];
    v17 = v14 + 24 * (v13 + v12);
    *(_OWORD *)v17 = *(_OWORD *)v16;
    *(_BYTE *)(v17 + 16) = v16[16];
    v15 = (v12 + 2);
    ++v12;
  }
  while (v11 > v15);
LABEL_14:
  v19 = v10;
  operator delete(v10);
}

void sub_10000874C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *sub_10000876C(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, char a5)
{
  _OWORD *v8;
  char *result;

  *(_QWORD *)(a1 + 24) = a4;
  v8 = (_OWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 32) = a4;
  *(_BYTE *)(a1 + 40) = 0;
  result = sub_100008BC4((char **)a1, a2, (__int128 *)(a1 + 24));
  *(_QWORD *)(a1 + 48) = a3;
  *(_QWORD *)(a1 + 56) = a3;
  *(_BYTE *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 72) = *v8;
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a1 + 40);
  if ((a5 & 1) == 0)
    *(_QWORD *)(a1 + 104) = a3;
  *(_BYTE *)(a1 + 96) = 1;
  return result;
}

uint64_t sub_1000087DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  _OWORD *v12;
  signed int v13;
  _OWORD *v14;
  unsigned int v15;
  uint64_t v16;
  _QWORD *v17;
  _OWORD *v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  uint64_t v22;
  _OWORD *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _BYTE *v31;
  unsigned int v32;
  uint64_t v33;
  char v34;
  uint64_t *v36;
  uint64_t v37;
  _BYTE v39[56];
  void *__p[2];
  _QWORD v41[4];
  __int128 v42;
  char v43;
  _OWORD *v44;
  _OWORD *v45;
  unint64_t v46;

  v44 = 0;
  v45 = 0;
  v46 = 0;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    *(_QWORD *)&v42 = a3;
    *((_QWORD *)&v42 + 1) = a3;
    v43 = 0;
    *(_DWORD *)v39 = 0;
    memset(&v39[8], 0, 48);
    *(_OWORD *)__p = 0u;
    memset(v41, 0, 21);
    v45 = (_OWORD *)sub_100008F10((uint64_t *)&v44, (uint64_t)v39);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(_QWORD *)&v39[32])
    {
      *(_QWORD *)&v39[40] = *(_QWORD *)&v39[32];
      operator delete(*(void **)&v39[32]);
    }
    v36 = a4;
    v12 = v45;
    *((_DWORD *)v45 - 24) = 0;
    *((_QWORD *)v12 - 11) = a2;
    *((_QWORD *)v12 - 10) = a2;
    *((_QWORD *)v12 - 9) = a3;
    sub_100008E0C((uint64_t)(v12 - 4), *(unsigned int *)(a1 + 28), &v42);
    sub_100008E48((uint64_t)v45 - 40, *(unsigned int *)(a1 + 32));
    v37 = a3;
    v13 = a3 - a2;
    v14 = v45;
    *((_QWORD *)v45 - 2) = v6;
    *((_DWORD *)v14 - 2) = a5;
    *((_BYTE *)v14 - 4) = a6;
    v15 = 1;
    while (2)
    {
      if ((v15 & 0xFFF) == 0 && (int)(v15 >> 12) >= v13)
        sub_100008E78();
      v17 = v14 - 1;
      v16 = *((_QWORD *)v14 - 2);
      v18 = v14 - 6;
      if (v16)
        (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v16 + 16))(v16, v14 - 6);
      switch(*(_DWORD *)v18)
      {
        case 0xFFFFFC18:
          v19 = *((_QWORD *)v14 - 10);
          if ((a5 & 0x20) != 0 && v19 == a2 || (a5 & 0x1000) != 0 && v19 != v37)
            goto LABEL_16;
          v27 = *v36;
          *(_QWORD *)v27 = a2;
          *(_QWORD *)(v27 + 8) = v19;
          *(_BYTE *)(v27 + 16) = 1;
          v28 = *((_QWORD *)v14 - 8);
          v29 = *((_QWORD *)v14 - 7) - v28;
          if (v29)
          {
            v30 = 0xAAAAAAAAAAAAAAABLL * (v29 >> 3);
            v31 = (_BYTE *)(v28 + 16);
            v32 = 1;
            do
            {
              v33 = v27 + 24 * v32;
              *(_OWORD *)v33 = *((_OWORD *)v31 - 1);
              v34 = *v31;
              v31 += 24;
              *(_BYTE *)(v33 + 16) = v34;
            }
            while (v30 > v32++);
          }
          v6 = 1;
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_23;
        case 0xFFFFFC1F:
LABEL_16:
          v20 = v45 - 6;
          sub_1000091A0((_QWORD *)v45 - 12);
          v45 = v20;
          goto LABEL_23;
        case 0xFFFFFC20:
          v21 = *(v14 - 5);
          *(_OWORD *)v39 = *v18;
          *(_OWORD *)&v39[16] = v21;
          memset(&v39[32], 0, 24);
          sub_1000094B0(&v39[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v41[0] = 0;
          sub_10000952C((char *)__p, *((__int128 **)v14 - 5), *((__int128 **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
          v22 = *v17;
          *(_QWORD *)((char *)&v41[1] + 5) = *(_QWORD *)((char *)v14 - 11);
          v41[1] = v22;
          (*(void (**)(_QWORD, uint64_t, _OWORD *))(*(_QWORD *)*v17 + 24))(*v17, 1, v14 - 6);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v41[1] + 24))(v41[1], 0, v39);
          v23 = v45;
          if ((unint64_t)v45 >= v46)
          {
            v45 = (_OWORD *)sub_100008F10((uint64_t *)&v44, (uint64_t)v39);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            v24 = *(_OWORD *)&v39[16];
            *v45 = *(_OWORD *)v39;
            v23[1] = v24;
            *((_QWORD *)v23 + 4) = 0;
            *((_QWORD *)v23 + 5) = 0;
            *((_QWORD *)v23 + 6) = 0;
            *((_QWORD *)v23 + 7) = 0;
            v23[2] = *(_OWORD *)&v39[32];
            *((_QWORD *)v23 + 6) = *(_QWORD *)&v39[48];
            memset(&v39[32], 0, 24);
            *((_QWORD *)v23 + 8) = 0;
            *((_QWORD *)v23 + 9) = 0;
            *(_OWORD *)((char *)v23 + 56) = *(_OWORD *)__p;
            *((_QWORD *)v23 + 9) = v41[0];
            __p[0] = 0;
            __p[1] = 0;
            v41[0] = 0;
            v25 = v41[1];
            *(_QWORD *)((char *)v23 + 85) = *(_QWORD *)((char *)&v41[1] + 5);
            *((_QWORD *)v23 + 10) = v25;
            v45 = v23 + 6;
          }
          if (*(_QWORD *)&v39[32])
          {
            *(_QWORD *)&v39[40] = *(_QWORD *)&v39[32];
            operator delete(*(void **)&v39[32]);
          }
LABEL_23:
          v14 = v45;
          ++v15;
          if (v44 != v45)
            continue;
          v6 = 0;
          break;
        default:
          sub_100008EC4();
      }
      break;
    }
  }
  *(_QWORD *)v39 = &v44;
  sub_1000095DC((void ***)v39);
  return v6;
}

void sub_100008B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  uint64_t v18;

  sub_100008DCC(&a13);
  a13 = v18 - 112;
  sub_1000095DC((void ***)&a13);
  _Unwind_Resume(a1);
}

char *sub_100008BC4(char **a1, unint64_t a2, __int128 *a3)
{
  uint64_t v6;
  char *result;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  __int128 v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  __int128 v21;

  v6 = (uint64_t)a1[2];
  result = *a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (uint64_t)result) >> 3) >= a2)
  {
    v15 = a1[1];
    v16 = (v15 - result) / 24;
    if (v16 >= a2)
      v17 = a2;
    else
      v17 = (v15 - result) / 24;
    if (v17)
    {
      v18 = result;
      do
      {
        *(_OWORD *)v18 = *a3;
        v18[16] = *((_BYTE *)a3 + 16);
        v18 += 24;
        --v17;
      }
      while (v17);
    }
    if (a2 <= v16)
    {
      a1[1] = &result[24 * a2];
    }
    else
    {
      v19 = &v15[24 * (a2 - v16)];
      v20 = 24 * a2 - 24 * v16;
      do
      {
        v21 = *a3;
        *((_QWORD *)v15 + 2) = *((_QWORD *)a3 + 2);
        *(_OWORD *)v15 = v21;
        v15 += 24;
        v20 -= 24;
      }
      while (v20);
      a1[1] = v19;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v6 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a2 > 0xAAAAAAAAAAAAAAALL)
      sub_10000699C();
    v8 = 0xAAAAAAAAAAAAAAABLL * (v6 >> 3);
    v9 = 2 * v8;
    if (2 * v8 <= a2)
      v9 = a2;
    if (v8 >= 0x555555555555555)
      v10 = 0xAAAAAAAAAAAAAAALL;
    else
      v10 = v9;
    result = sub_100008D38(a1, v10);
    v11 = a1[1];
    v12 = &v11[24 * a2];
    v13 = 24 * a2;
    do
    {
      v14 = *a3;
      *((_QWORD *)v11 + 2) = *((_QWORD *)a3 + 2);
      *(_OWORD *)v11 = v14;
      v11 += 24;
      v13 -= 24;
    }
    while (v13);
    a1[1] = v12;
  }
  return result;
}

char *sub_100008D38(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_10000699C();
  result = (char *)sub_100008D88((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *sub_100008D88(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    sub_100006784();
  return operator new(24 * a2);
}

_QWORD *sub_100008DCC(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  return a1;
}

void sub_100008E0C(uint64_t a1, unint64_t a2, __int128 *a3)
{
  unint64_t v3;
  BOOL v4;
  unint64_t v5;

  v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v4 = a2 >= v3;
  v5 = a2 - v3;
  if (v5 != 0 && v4)
  {
    sub_100009230((void **)a1, v5, a3);
  }
  else if (!v4)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 24 * a2;
  }
}

void sub_100008E48(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 16 * a2;
  }
  else
  {
    sub_1000093A4((void **)a1, a2 - v2);
  }
}

void sub_100008E78()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_complexity);
}

void sub_100008EB0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_100008EC4()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_unknown);
}

void sub_100008EFC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100008F10(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[5];

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 5);
  v5 = v4 + 1;
  if (v4 + 1 > 0x2AAAAAAAAAAAAAALL)
    sub_10000699C();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 5);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x155555555555555)
    v9 = 0x2AAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v16[4] = a1 + 2;
  if (v9)
    v10 = (char *)sub_1000090D0(v7, v9);
  else
    v10 = 0;
  v11 = &v10[96 * v4];
  v16[0] = v10;
  v16[1] = v11;
  v16[3] = &v10[96 * v9];
  v12 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v11 = *(_OWORD *)a2;
  *((_OWORD *)v11 + 1) = v12;
  *((_QWORD *)v11 + 5) = 0;
  *((_QWORD *)v11 + 6) = 0;
  *((_QWORD *)v11 + 4) = 0;
  *((_OWORD *)v11 + 2) = *(_OWORD *)(a2 + 32);
  *((_QWORD *)v11 + 6) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *((_QWORD *)v11 + 7) = 0;
  *((_QWORD *)v11 + 8) = 0;
  *((_QWORD *)v11 + 9) = 0;
  *(_OWORD *)(v11 + 56) = *(_OWORD *)(a2 + 56);
  *((_QWORD *)v11 + 9) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v13 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v11 + 85) = *(_QWORD *)(a2 + 85);
  *((_QWORD *)v11 + 10) = v13;
  v16[2] = v11 + 96;
  sub_10000905C(a1, v16);
  v14 = a1[1];
  sub_1000091E4((uint64_t)v16);
  return v14;
}

void sub_100009048(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_1000091E4((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_10000905C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100009114((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v4;
  v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

void *sub_1000090D0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2AAAAAAAAAAAAABLL)
    sub_100006784();
  return operator new(96 * a2);
}

__n128 sub_100009114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __n128 result;
  uint64_t v12;

  if (a3 != a5)
  {
    v7 = 0;
    do
    {
      v8 = a7 + v7;
      v9 = a3 + v7;
      v10 = *(_OWORD *)(a3 + v7 - 80);
      *(_OWORD *)(v8 - 96) = *(_OWORD *)(a3 + v7 - 96);
      *(_OWORD *)(v8 - 80) = v10;
      *(_QWORD *)(v8 - 56) = 0;
      *(_QWORD *)(v8 - 48) = 0;
      *(_QWORD *)(v8 - 64) = 0;
      *(_OWORD *)(v8 - 64) = *(_OWORD *)(a3 + v7 - 64);
      *(_QWORD *)(v8 - 48) = *(_QWORD *)(a3 + v7 - 48);
      *(_QWORD *)(v9 - 64) = 0;
      *(_QWORD *)(v9 - 56) = 0;
      *(_QWORD *)(v9 - 48) = 0;
      *(_QWORD *)(v8 - 40) = 0;
      *(_QWORD *)(v8 - 32) = 0;
      *(_QWORD *)(v8 - 24) = 0;
      result = *(__n128 *)(a3 + v7 - 40);
      *(__n128 *)(v8 - 40) = result;
      *(_QWORD *)(v8 - 24) = *(_QWORD *)(a3 + v7 - 24);
      *(_QWORD *)(v9 - 40) = 0;
      *(_QWORD *)(v9 - 32) = 0;
      *(_QWORD *)(v9 - 24) = 0;
      v12 = *(_QWORD *)(a3 + v7 - 16);
      *(_QWORD *)(v8 - 11) = *(_QWORD *)(a3 + v7 - 11);
      *(_QWORD *)(v8 - 16) = v12;
      v7 -= 96;
    }
    while (a3 + v7 != a5);
  }
  return result;
}

void sub_1000091A0(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
}

uint64_t sub_1000091E4(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 96;
    sub_1000091A0((_QWORD *)(i - 96));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_100009230(void **a1, unint64_t a2, __int128 *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  _QWORD *v15;
  uint64_t v16;
  __int128 v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  __int128 v22;
  char *v23;
  char *v24;
  char *v25;
  __int128 v26;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_QWORD **)(v6 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (_BYTE *)v9) >> 3) >= a2)
  {
    if (a2)
    {
      v15 = &v9[3 * a2];
      v16 = 24 * a2;
      do
      {
        v17 = *a3;
        v9[2] = *((_QWORD *)a3 + 2);
        *(_OWORD *)v9 = v17;
        v9 += 3;
        v16 -= 24;
      }
      while (v16);
      v9 = v15;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)v9 - (_BYTE *)*a1) >> 3);
    v11 = v10 + a2;
    if (v10 + a2 > 0xAAAAAAAAAAAAAAALL)
      sub_10000699C();
    v12 = 0xAAAAAAAAAAAAAAABLL * ((v7 - (_BYTE *)*a1) >> 3);
    if (2 * v12 > v11)
      v11 = 2 * v12;
    if (v12 >= 0x555555555555555)
      v13 = 0xAAAAAAAAAAAAAAALL;
    else
      v13 = v11;
    if (v13)
      v14 = (char *)sub_100008D88(v6, v13);
    else
      v14 = 0;
    v18 = &v14[24 * v10];
    v19 = &v18[24 * a2];
    v20 = 24 * a2;
    v21 = v18;
    do
    {
      v22 = *a3;
      *((_QWORD *)v21 + 2) = *((_QWORD *)a3 + 2);
      *(_OWORD *)v21 = v22;
      v21 += 24;
      v20 -= 24;
    }
    while (v20);
    v23 = &v14[24 * v13];
    v25 = (char *)*a1;
    v24 = (char *)a1[1];
    if (v24 != *a1)
    {
      do
      {
        v26 = *(_OWORD *)(v24 - 24);
        *((_QWORD *)v18 - 1) = *((_QWORD *)v24 - 1);
        *(_OWORD *)(v18 - 24) = v26;
        v18 -= 24;
        v24 -= 24;
      }
      while (v24 != v25);
      v24 = (char *)*a1;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v23;
    if (v24)
      operator delete(v24);
  }
}

void sub_1000093A4(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 4)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 16 * a2);
      v7 += 16 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = v7 - (_BYTE *)*a1;
    v9 = a2 + (v8 >> 4);
    if (v9 >> 60)
      sub_10000699C();
    v10 = v8 >> 4;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 3 > v9)
      v9 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)sub_1000069B0(v4, v12);
    else
      v13 = 0;
    v14 = &v13[16 * v10];
    v15 = &v13[16 * v12];
    bzero(v14, 16 * a2);
    v16 = &v14[16 * a2];
    v18 = (char *)*a1;
    v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v17 - 1);
        v14 -= 16;
        v17 -= 16;
      }
      while (v17 != v18);
      v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
      operator delete(v17);
  }
}

char *sub_1000094B0(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  uint64_t v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = sub_100008D38(result, a4);
    v7 = *((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2;
      *(_QWORD *)(v7 + 16) = *((_QWORD *)a2 + 2);
      *(_OWORD *)v7 = v8;
      v7 += 24;
      a2 = (__int128 *)((char *)a2 + 24);
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_100009510(_Unwind_Exception *exception_object)
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

char *sub_10000952C(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  _OWORD *v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = sub_10000959C(result, a4);
    v7 = (_OWORD *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2++;
      *v7++ = v8;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_100009580(_Unwind_Exception *exception_object)
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

char *sub_10000959C(_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    sub_10000699C();
  result = (char *)sub_1000069B0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void sub_1000095DC(void ***a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v4;
  void *v5;

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
        v4 -= 12;
        sub_1000091A0(v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

unsigned __int8 *sub_10000964C(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v5;
  unsigned __int8 *result;

  if (a2 == a3 || *a2 != 92)
    return a2;
  v5 = a2 + 1;
  if (a2 + 1 == a3)
    sub_100009A30();
  result = sub_100009A7C(a1, a2 + 1, a3);
  if (result == v5)
  {
    result = (unsigned __int8 *)sub_100009B38(a1, (char *)a2 + 1, (char *)a3);
    if (result == v5)
    {
      result = sub_100009C04(a1, a2 + 1, a3, 0);
      if (result == v5)
        return a2;
    }
  }
  return result;
}

_BYTE *sub_1000096EC(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  if (a2 != a3 && *a2 == 91)
  {
    if (a2 + 1 != a3)
      sub_10000AA50();
    sub_10000BDA4();
  }
  return a2;
}

uint64_t sub_1000097FC(uint64_t result)
{
  if ((*(_BYTE *)(result + 24) & 2) == 0)
    operator new();
  return result;
}

uint64_t sub_100009870(uint64_t result)
{
  if ((*(_BYTE *)(result + 24) & 2) == 0)
    operator new();
  return result;
}

void sub_1000098DC()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_badrepeat);
}

void sub_100009914(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_BYTE *sub_100009928(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  int v3;
  BOOL v4;

  if (a2 != a3)
  {
    v3 = (char)*a2;
    v4 = (v3 - 36) > 0x3A || ((1 << (*a2 - 36)) & 0x7800000080004F1) == 0;
    if (v4 && (v3 - 123) >= 3)
      sub_100009FD8(a1);
  }
  return a2;
}

_QWORD *sub_100009998(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100014520;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_1000099DC(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100014520;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

void sub_100009A30()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_escape);
}

void sub_100009A68(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_100009A7C(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v4;
  unsigned int v5;
  unsigned __int8 *v6;
  int v7;

  if (a2 != a3)
  {
    v4 = *a2;
    v5 = v4 - 48;
    if (v4 == 48)
      sub_100009FD8(a1);
    if ((v4 - 49) <= 8)
    {
      v6 = a2 + 1;
      if (a2 + 1 == a3)
        goto LABEL_12;
      do
      {
        v7 = *v6;
        if ((v7 - 48) > 9)
          break;
        if (v5 >= 0x19999999)
          goto LABEL_14;
        ++v6;
        v5 = v7 + 10 * v5 - 48;
      }
      while (v6 != a3);
      if (v5)
      {
LABEL_12:
        if (v5 <= *(_DWORD *)(a1 + 28))
          sub_10000A148(a1);
      }
LABEL_14:
      sub_10000A0FC();
    }
  }
  return a2;
}

char *sub_100009B38(uint64_t a1, char *a2, char *a3)
{
  int v3;

  if (a2 == a3)
    return a2;
  v3 = *a2;
  if (v3 > 99)
  {
    if (v3 == 119)
      goto LABEL_12;
    if (v3 == 115)
LABEL_13:
      sub_10000AA50();
    if (v3 != 100)
      return a2;
LABEL_10:
    sub_10000AA50();
  }
  switch(v3)
  {
    case 'D':
      goto LABEL_10;
    case 'S':
      goto LABEL_13;
    case 'W':
LABEL_12:
      sub_10000AA50();
  }
  return a2;
}

unsigned __int8 *sub_100009C04(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t *a4)
{
  unsigned __int8 *v4;
  uint64_t v5;
  char v6;
  int v7;
  int v8;
  char v9;
  int v10;
  char v11;
  int v12;
  char v13;
  char v14;
  unsigned __int8 v15;
  __int16 v16;

  v4 = a2;
  if (a2 == a3)
    return v4;
  v5 = *a2;
  if ((char)v5 > 109)
  {
    v6 = 0;
    switch((char)v5)
    {
      case 'n':
        if (!a4)
          goto LABEL_62;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v16 = 10;
        goto LABEL_74;
      case 'r':
        if (!a4)
          goto LABEL_62;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v16 = 13;
        goto LABEL_74;
      case 't':
        if (!a4)
          goto LABEL_62;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v16 = 9;
        goto LABEL_74;
      case 'u':
        if (a2 + 1 == a3)
          goto LABEL_83;
        v7 = a2[1];
        if ((v7 & 0xF8) != 0x30 && (v7 & 0xFE) != 0x38 && (v7 | 0x20u) - 97 >= 6)
          goto LABEL_83;
        v4 = a2 + 2;
        if (a2 + 2 == a3)
          goto LABEL_83;
        v8 = *v4;
        v9 = -48;
        if ((v8 & 0xF8) == 0x30 || (v8 & 0xFE) == 0x38)
          goto LABEL_28;
        v8 |= 0x20u;
        if ((v8 - 97) >= 6)
          goto LABEL_83;
        v9 = -87;
LABEL_28:
        v6 = 16 * (v9 + v8);
LABEL_29:
        if (v4 + 1 == a3)
          goto LABEL_83;
        v10 = v4[1];
        v11 = -48;
        if ((v10 & 0xF8) == 0x30 || (v10 & 0xFE) == 0x38)
          goto LABEL_34;
        v10 |= 0x20u;
        if ((v10 - 97) >= 6)
          goto LABEL_83;
        v11 = -87;
LABEL_34:
        if (v4 + 2 == a3)
          goto LABEL_83;
        v12 = v4[2];
        v13 = -48;
        if ((v12 & 0xF8) == 0x30 || (v12 & 0xFE) == 0x38)
          goto LABEL_39;
        v12 |= 0x20u;
        if ((v12 - 97) >= 6)
          goto LABEL_83;
        v13 = -87;
LABEL_39:
        v14 = v13 + v12 + 16 * (v11 + v10 + v6);
        if (!a4)
          sub_100009FD8(a1);
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        *(_BYTE *)a4 = v14;
        *((_BYTE *)a4 + 1) = 0;
        v4 += 3;
        break;
      case 'v':
        if (!a4)
          goto LABEL_62;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v16 = 11;
        goto LABEL_74;
      case 'x':
        goto LABEL_29;
      default:
        goto LABEL_53;
    }
    return v4;
  }
  if ((char)v5 == 48)
  {
    if (!a4)
      goto LABEL_62;
    if (*((char *)a4 + 23) < 0)
    {
      a4[1] = 1;
      a4 = (uint64_t *)*a4;
    }
    else
    {
      *((_BYTE *)a4 + 23) = 1;
    }
    *(_WORD *)a4 = 0;
    return a2 + 1;
  }
  if ((char)v5 != 99)
  {
    if ((char)v5 == 102)
    {
      if (a4)
      {
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v16 = 12;
LABEL_74:
        *(_WORD *)a4 = v16;
        return a2 + 1;
      }
LABEL_62:
      sub_100009FD8(a1);
    }
LABEL_53:
    if ((char)v5 != 95
      && ((char)v5 < 0 || (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 16) + 4 * v5) & 0x500) == 0))
    {
      if (!a4)
        goto LABEL_62;
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v5;
      *((_BYTE *)a4 + 1) = 0;
      return a2 + 1;
    }
LABEL_83:
    sub_100009A30();
  }
  if (a2 + 1 == a3)
    goto LABEL_83;
  v15 = a2[1];
  if (((v15 & 0xDF) - 65) > 0x19u)
    goto LABEL_83;
  if (!a4)
    sub_100009FD8(a1);
  if (*((char *)a4 + 23) < 0)
  {
    a4[1] = 1;
    a4 = (uint64_t *)*a4;
  }
  else
  {
    *((_BYTE *)a4 + 23) = 1;
  }
  *(_BYTE *)a4 = v15 & 0x1F;
  *((_BYTE *)a4 + 1) = 0;
  return a2 + 2;
}

void sub_100009FD8(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 24);
  if ((v1 & 1) == 0)
  {
    if ((v1 & 8) == 0)
      operator new();
    operator new();
  }
  operator new();
}

void sub_10000A0D8()
{
  operator delete();
}

void sub_10000A0FC()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_backref);
}

void sub_10000A134(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000A148(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 24);
  if ((v1 & 1) == 0)
  {
    if ((v1 & 8) == 0)
      operator new();
    operator new();
  }
  operator new();
}

uint64_t sub_10000A244(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(_QWORD *)a1 = off_1000146B8;
  *(_QWORD *)(a1 + 8) = a4;
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 40) = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a2 + 8) + 40))(*(_QWORD *)(a2 + 8), a3);
  return a1;
}

void sub_10000A2B0(_Unwind_Exception *a1)
{
  _QWORD *v1;
  std::locale *v2;
  uint64_t v4;

  std::locale::~locale(v2);
  *v1 = off_100014520;
  v4 = v1[1];
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  _Unwind_Resume(a1);
}

std::locale *sub_10000A2E8(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_1000146B8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100014520;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_10000A340(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_1000146B8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100014520;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete();
}

uint64_t sub_10000A3A8(uint64_t result, uint64_t a2)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(char **)(a2 + 16);
  if (v3 == *(char **)(a2 + 24)
    || (v4 = result,
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(result + 24) + 40))(*(_QWORD *)(result + 24), *v3), *(unsigned __int8 *)(v4 + 40) != result))
  {
    v5 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    ++*(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(v4 + 8);
  }
  *(_QWORD *)(a2 + 80) = v5;
  return result;
}

std::locale *sub_10000A420(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100014700;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100014520;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_10000A478(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100014700;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100014520;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete();
}

uint64_t sub_10000A4E0(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 40))
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

_QWORD *sub_10000A528(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100014520;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_10000A56C(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100014520;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_10000A5C0(uint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = *(unsigned __int8 **)(a2 + 16);
  if (v2 == *(unsigned __int8 **)(a2 + 24) || *v2 != *(unsigned __int8 *)(result + 16))
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

std::locale *sub_10000A608(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100014790;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100014520;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_10000A660(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_100014790;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100014520;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete();
}

uint64_t sub_10000A6C8(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v3 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 40) - 1);
  if (*(_BYTE *)(v3 + 16))
  {
    v4 = *(_QWORD *)(v3 + 8) - *(_QWORD *)v3;
    v5 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(a2 + 24) - v5 >= v4)
    {
      v7 = result;
      if (v4 < 1)
      {
LABEL_9:
        *(_DWORD *)a2 = -994;
        *(_QWORD *)(a2 + 16) = v5 + v4;
        v6 = *(_QWORD *)(v7 + 8);
        goto LABEL_10;
      }
      v8 = 0;
      while (1)
      {
        v9 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)(*(_QWORD *)v3 + v8));
        result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(v7 + 24) + 40))(*(_QWORD *)(v7 + 24), *(char *)(*(_QWORD *)(a2 + 16) + v8));
        if (v9 != (_DWORD)result)
          break;
        if (v4 == ++v8)
        {
          v5 = *(_QWORD *)(a2 + 16);
          goto LABEL_9;
        }
      }
    }
  }
  v6 = 0;
  *(_DWORD *)a2 = -993;
LABEL_10:
  *(_QWORD *)(a2 + 80) = v6;
  return result;
}

std::locale *sub_10000A7AC(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_1000147D8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100014520;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  return a1;
}

void sub_10000A804(std::locale *a1)
{
  std::locale::__imp *locale;

  a1->__locale_ = (std::locale::__imp *)off_1000147D8;
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100014520;
  locale = a1[1].__locale_;
  if (locale)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)locale + 8))(locale);
  operator delete();
}

uint64_t sub_10000A86C(uint64_t result, uint64_t a2)
{
  unsigned int v2;
  uint64_t v3;
  unsigned __int8 **v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;

  v2 = *(_DWORD *)(result + 40) - 1;
  v3 = *(_QWORD *)(a2 + 32);
  if (*(_BYTE *)(v3 + 24 * v2 + 16))
  {
    v4 = (unsigned __int8 **)(v3 + 24 * v2);
    v5 = *v4;
    v6 = v4[1] - *v4;
    v7 = *(_QWORD *)(a2 + 16);
    if (*(_QWORD *)(a2 + 24) - v7 >= v6)
    {
      if (v6 < 1)
      {
LABEL_8:
        *(_DWORD *)a2 = -994;
        *(_QWORD *)(a2 + 16) = v7 + v6;
        v8 = *(_QWORD *)(result + 8);
        goto LABEL_9;
      }
      v9 = *(unsigned __int8 **)(a2 + 16);
      v10 = v6;
      while (1)
      {
        v12 = *v5++;
        v11 = v12;
        v13 = *v9++;
        if (v11 != v13)
          break;
        if (!--v10)
          goto LABEL_8;
      }
    }
  }
  v8 = 0;
  *(_DWORD *)a2 = -993;
LABEL_9:
  *(_QWORD *)(a2 + 80) = v8;
  return result;
}

_QWORD *sub_10000A8FC(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100014520;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_10000A940(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100014520;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

unsigned int *sub_10000A994(unsigned int *result, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned int v5;
  unsigned int *v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = result[4];
  v3 = *(_QWORD *)(a2 + 32);
  if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a2 + 40) - v3) >> 3) < v2)
    sub_10000A0FC();
  v5 = v2 - 1;
  if (*(_BYTE *)(v3 + 24 * v5 + 16)
    && (v6 = result,
        v7 = v3 + 24 * v5,
        result = *(unsigned int **)v7,
        v8 = *(_QWORD *)(v7 + 8) - *(_QWORD *)v7,
        v9 = *(_QWORD *)(a2 + 16),
        *(_QWORD *)(a2 + 24) - v9 >= v8)
    && (result = (unsigned int *)memcmp(result, *(const void **)(a2 + 16), v8), !(_DWORD)result))
  {
    *(_DWORD *)a2 = -994;
    *(_QWORD *)(a2 + 16) = v9 + v8;
    v10 = *((_QWORD *)v6 + 1);
  }
  else
  {
    v10 = 0;
    *(_DWORD *)a2 = -993;
  }
  *(_QWORD *)(a2 + 80) = v10;
  return result;
}

void sub_10000AA50()
{
  operator new();
}

void sub_10000AAC4()
{
  operator delete();
}

void sub_10000AAE8(uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  unint64_t *v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _BYTE *v22;
  char v23;
  unint64_t v24;
  _BYTE *v25;
  unint64_t v26;
  unint64_t v27;
  size_t v28;
  _BYTE *v29;
  char v30;
  _BYTE *v31;
  char v32;

  v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v5 = *(_BYTE **)(a1 + 48);
    v4 = *(_QWORD *)(a1 + 56);
    if ((unint64_t)v5 >= v4)
    {
      v6 = (unint64_t *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 40);
      v8 = &v5[-v7];
      v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        v10 = v4 - v7;
        if (2 * v10 > v9)
          v9 = 2 * v10;
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
          v11 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v11 = v9;
        if (v11)
          v12 = operator new(v11);
        else
          v12 = 0;
        v20 = &v8[(_QWORD)v12];
        v21 = (char *)v12 + v11;
        v8[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v8[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v7)
        {
          v22 = &v5[~v7];
          do
          {
            v23 = *--v5;
            (v22--)[(_QWORD)v12] = v23;
          }
          while (v5 != (_BYTE *)v7);
LABEL_45:
          v5 = (_BYTE *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      sub_10000699C();
    }
    goto LABEL_22;
  }
  v6 = (unint64_t *)(a1 + 40);
  v5 = *(_BYTE **)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 56);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      v24 = *v6;
      v25 = &v5[-*v6];
      v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        v27 = v13 - v24;
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL)
          v28 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
          v12 = operator new(v28);
        else
          v12 = 0;
        v20 = &v25[(_QWORD)v12];
        v21 = (char *)v12 + v28;
        v25[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v25[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          v31 = &v5[~v24];
          do
          {
            v32 = *--v5;
            (v31--)[(_QWORD)v12] = v32;
          }
          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *v5 = v2;
    v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13)
    goto LABEL_22;
  v14 = *v6;
  v15 = &v5[-*v6];
  v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0)
    goto LABEL_50;
  v17 = v13 - v14;
  if (2 * v17 > v16)
    v16 = 2 * v17;
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL)
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v18 = v16;
  if (v18)
    v12 = operator new(v18);
  else
    v12 = 0;
  v20 = &v15[(_QWORD)v12];
  v21 = (char *)v12 + v18;
  v15[(_QWORD)v12] = v2;
  v19 = (uint64_t)&v15[(_QWORD)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    v29 = &v5[~v14];
    do
    {
      v30 = *--v5;
      (v29--)[(_QWORD)v12] = v30;
    }
    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }
LABEL_46:
  v12 = v20;
LABEL_47:
  *(_QWORD *)(a1 + 40) = v12;
  *(_QWORD *)(a1 + 48) = v19;
  *(_QWORD *)(a1 + 56) = v21;
  if (v5)
    operator delete(v5);
LABEL_49:
  *(_QWORD *)(a1 + 48) = v19;
}

uint64_t sub_10000AD14(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6)
{
  const std::locale *v11;
  __int128 v12;
  std::string::size_type size;
  std::string *v14;
  BOOL v15;
  std::locale v17;
  std::string v18;

  *(_QWORD *)a1 = off_100014868;
  *(_QWORD *)(a1 + 8) = a3;
  v11 = (const std::locale *)(a1 + 16);
  std::locale::locale((std::locale *)(a1 + 16), (const std::locale *)a2);
  v12 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 24) = v12;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_BYTE *)(a1 + 168) = a4;
  *(_BYTE *)(a1 + 169) = a5;
  *(_BYTE *)(a1 + 170) = a6;
  std::locale::locale(&v17, v11);
  std::locale::name(&v18, &v17);
  size = HIBYTE(v18.__r_.__value_.__r.__words[2]);
  if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v18.__r_.__value_.__l.__size_;
  if (size == 1)
  {
    v14 = (std::string *)v18.__r_.__value_.__r.__words[0];
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v14 = &v18;
    v15 = v14->__r_.__value_.__s.__data_[0] != 67;
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_9;
  }
  else
  {
    v15 = 1;
    if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
LABEL_9:
      operator delete(v18.__r_.__value_.__l.__data_);
  }
  std::locale::~locale(&v17);
  *(_BYTE *)(a1 + 171) = v15;
  return a1;
}

void sub_10000AE28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _QWORD *a10)
{
  _QWORD *v10;
  std::locale *v11;
  void **v12;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  std::locale::~locale((std::locale *)&a9);
  a10 = v10 + 17;
  sub_10000B7B4((void ***)&a10);
  v14 = (void *)v10[14];
  if (v14)
  {
    v10[15] = v14;
    operator delete(v14);
  }
  sub_10000B840((void ***)&a10);
  v15 = (void *)v10[8];
  if (v15)
  {
    v10[9] = v15;
    operator delete(v15);
  }
  v16 = *v12;
  if (*v12)
  {
    v10[6] = v16;
    operator delete(v16);
  }
  std::locale::~locale(v11);
  *v10 = off_100014520;
  v17 = v10[1];
  if (v17)
    (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
  _Unwind_Resume(a1);
}

std::locale *sub_10000AEB4(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v7;

  a1->__locale_ = (std::locale::__imp *)off_100014868;
  v7 = a1 + 17;
  sub_10000B7B4((void ***)&v7);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v7 = a1 + 11;
  sub_10000B840((void ***)&v7);
  v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100014520;
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  return a1;
}

void sub_10000AF68(std::locale *a1)
{
  std::locale::__imp *locale;
  std::locale::__imp *v3;
  std::locale::__imp *v4;
  std::locale::__imp *v5;
  std::locale *v6;

  a1->__locale_ = (std::locale::__imp *)off_100014868;
  v6 = a1 + 17;
  sub_10000B7B4((void ***)&v6);
  locale = a1[14].__locale_;
  if (locale)
  {
    a1[15].__locale_ = locale;
    operator delete(locale);
  }
  v6 = a1 + 11;
  sub_10000B840((void ***)&v6);
  v3 = a1[8].__locale_;
  if (v3)
  {
    a1[9].__locale_ = v3;
    operator delete(v3);
  }
  v4 = a1[5].__locale_;
  if (v4)
  {
    a1[6].__locale_ = v4;
    operator delete(v4);
  }
  std::locale::~locale(a1 + 2);
  a1->__locale_ = (std::locale::__imp *)off_100014520;
  v5 = a1[1].__locale_;
  if (v5)
    (*(void (**)(std::locale::__imp *))(*(_QWORD *)v5 + 8))(v5);
  operator delete();
}

void sub_10000B030(uint64_t a1, uint64_t a2)
{
  signed __int8 *v4;
  signed __int8 *v5;
  signed __int8 v6;
  signed __int8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  size_t v19;
  unsigned __int8 v20;
  unsigned __int8 *v21;
  unint64_t v22;
  int v23;
  unsigned int v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  size_t v40;
  size_t v41;
  uint64_t v42;
  BOOL v43;
  unsigned __int8 **v44;
  unsigned __int8 *v45;
  int v46;
  unsigned __int8 *v47;
  void **v48;
  uint64_t v49;
  size_t v50;
  int v51;
  unsigned int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  size_t v59;
  void *v60;
  size_t v61;
  uint64_t v62;
  BOOL v63;
  unsigned __int8 **v64;
  unsigned __int8 *v65;
  int v66;
  unsigned __int8 *v67;
  void **p_p;
  uint64_t v69;
  int v70;
  int v71;
  uint64_t v72;
  int v73;
  int v74;
  int v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  int v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *__p;
  size_t v84;
  char v85;
  unsigned __int8 v86;
  unsigned __int8 v87;
  uint64_t v88;

  v4 = *(signed __int8 **)(a2 + 16);
  v5 = *(signed __int8 **)(a2 + 24);
  if (v4 == v5)
  {
    v18 = 0;
    v16 = *(unsigned __int8 *)(a1 + 168);
    goto LABEL_155;
  }
  if (!*(_BYTE *)(a1 + 171) || v4 + 1 == v5)
    goto LABEL_27;
  v6 = *v4;
  v86 = *v4;
  v7 = v4[1];
  v87 = v7;
  if (*(_BYTE *)(a1 + 169))
  {
    v86 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v6);
    v87 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v7);
  }
  sub_10000B9D0(a1 + 16, (char *)&v86, (char *)&v88, (uint64_t)&__p);
  if ((v85 & 0x80000000) == 0)
  {
    if (v85)
      goto LABEL_8;
LABEL_27:
    v16 = 0;
    v18 = 1;
    goto LABEL_28;
  }
  v19 = v84;
  operator delete(__p);
  if (!v19)
    goto LABEL_27;
LABEL_8:
  v8 = *(_QWORD *)(a1 + 112);
  v9 = *(_QWORD *)(a1 + 120) - v8;
  if (v9)
  {
    v10 = v9 >> 1;
    if ((unint64_t)(v9 >> 1) <= 1)
      v10 = 1;
    v11 = (_BYTE *)(v8 + 1);
    do
    {
      if (v86 == *(v11 - 1) && v87 == *v11)
        goto LABEL_152;
      v11 += 2;
      --v10;
    }
    while (v10);
  }
  if (!*(_BYTE *)(a1 + 170) || *(_QWORD *)(a1 + 88) == *(_QWORD *)(a1 + 96))
  {
    v16 = 0;
  }
  else
  {
    sub_10000B934(a1 + 16, (char *)&v86, (char *)&v88);
    v13 = *(_QWORD *)(a1 + 88);
    if (*(_QWORD *)(a1 + 96) == v13)
    {
LABEL_24:
      v16 = 0;
      v17 = 0;
    }
    else
    {
      v14 = 0;
      v15 = 0;
      while ((int)(sub_100002ADC((_QWORD *)(v13 + v14), &__p) << 24) > 0xFFFFFF
           || (int)(sub_100002ADC(&__p, (void **)(*(_QWORD *)(a1 + 88) + v14 + 24)) << 24) >= 0x1000000)
      {
        ++v15;
        v13 = *(_QWORD *)(a1 + 88);
        v14 += 48;
        if (v15 >= 0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a1 + 96) - v13) >> 4))
          goto LABEL_24;
      }
      v16 = 1;
      v17 = 5;
    }
    if (v85 < 0)
      operator delete(__p);
    if ((v16 & 1) != 0)
      goto LABEL_129;
  }
  if (*(_QWORD *)(a1 + 136) == *(_QWORD *)(a1 + 144))
    goto LABEL_134;
  sub_10000BC08(a1 + 16, (char *)&v86, (char *)&v88, (uint64_t)&__p);
  v54 = *(_QWORD *)(a1 + 136);
  v55 = v85;
  v56 = *(_QWORD *)(a1 + 144) - v54;
  if (v56)
  {
    v57 = 0;
    v58 = v56 / 24;
    v60 = __p;
    v59 = v84;
    if (v85 >= 0)
      v61 = v85;
    else
      v61 = v84;
    if (v58 <= 1)
      v62 = 1;
    else
      v62 = v56 / 24;
    v63 = 1;
    while (1)
    {
      v64 = (unsigned __int8 **)(v54 + 24 * v57);
      v65 = (unsigned __int8 *)*((unsigned __int8 *)v64 + 23);
      v66 = (char)v65;
      if ((char)v65 < 0)
        v65 = v64[1];
      if ((unsigned __int8 *)v61 == v65)
      {
        if (v66 >= 0)
          v67 = (unsigned __int8 *)(v54 + 24 * v57);
        else
          v67 = *v64;
        if ((v55 & 0x80) == 0)
        {
          if ((_DWORD)v55)
          {
            p_p = &__p;
            v69 = v55;
            do
            {
              if (*(unsigned __int8 *)p_p != *v67)
                goto LABEL_122;
              p_p = (void **)((char *)p_p + 1);
              ++v67;
              --v69;
            }
            while (v69);
            v16 = 1;
            v17 = 5;
            goto LABEL_126;
          }
          v16 = 1;
          if (v63)
            goto LABEL_154;
LABEL_134:
          if ((char)v86 < 0)
          {
            v74 = *(_DWORD *)(a1 + 164);
            goto LABEL_147;
          }
          v71 = *(_DWORD *)(a1 + 160);
          v72 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 16);
          v73 = *(_DWORD *)(v72 + 4 * v86);
          if ((v73 & v71) == 0 && (v86 != 95 || (v71 & 0x80) == 0)
            || (char)v87 < 0
            || (*(_DWORD *)(v72 + 4 * v87) & v71) == 0 && ((v71 & 0x80) == 0 || v87 != 95))
          {
            v74 = *(_DWORD *)(a1 + 164);
            if ((v73 & v74) != 0 || v86 == 95 && (v74 & 0x80) != 0)
            {
LABEL_151:
              v75 = v16;
              goto LABEL_153;
            }
LABEL_147:
            if (((char)v87 & 0x80000000) == 0)
            {
              if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) + 4 * v87) & v74) != 0)
                goto LABEL_151;
              v75 = 1;
              if (v87 == 95 && (v74 & 0x80) != 0)
                goto LABEL_151;
LABEL_153:
              v16 = v75;
LABEL_154:
              v18 = 2;
              goto LABEL_155;
            }
          }
LABEL_152:
          v75 = 1;
          goto LABEL_153;
        }
        v80 = v58;
        v82 = v55;
        v70 = memcmp(v60, v67, v59);
        v58 = v80;
        v55 = v82;
        if (!v70)
          break;
      }
LABEL_122:
      v63 = ++v57 < v58;
      if (v57 == v62)
        goto LABEL_125;
    }
    v17 = 5;
    v16 = 1;
    goto LABEL_127;
  }
  v63 = 0;
LABEL_125:
  v17 = 0;
LABEL_126:
  if ((v55 & 0x80) != 0)
LABEL_127:
    operator delete(__p);
  if (!v63)
    goto LABEL_134;
LABEL_129:
  if (v17)
    goto LABEL_154;
  v18 = 2;
LABEL_28:
  v20 = **(_BYTE **)(a2 + 16);
  v86 = v20;
  if (*(_BYTE *)(a1 + 169))
  {
    v20 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), (char)v20);
    v86 = v20;
  }
  v21 = *(unsigned __int8 **)(a1 + 40);
  v22 = *(_QWORD *)(a1 + 48) - (_QWORD)v21;
  if (v22)
  {
    if (v22 <= 1)
      v22 = 1;
    while (1)
    {
      v23 = *v21++;
      if (v23 == v20)
        break;
      if (!--v22)
        goto LABEL_35;
    }
LABEL_46:
    v16 = 1;
    goto LABEL_155;
  }
LABEL_35:
  v24 = *(_DWORD *)(a1 + 164);
  if (v24 || *(_QWORD *)(a1 + 64) != *(_QWORD *)(a1 + 72))
  {
    if ((v20 & 0x80) != 0 || (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) + 4 * v20) & v24) == 0)
      v25 = (v20 == 95) & (v24 >> 7);
    else
      LOBYTE(v25) = 1;
    v26 = *(void **)(a1 + 72);
    v27 = memchr(*(void **)(a1 + 64), (char)v20, (size_t)v26 - *(_QWORD *)(a1 + 64));
    v28 = v27 ? v27 : v26;
    if ((v25 & 1) == 0 && v28 == v26)
      goto LABEL_46;
  }
  v29 = *(_QWORD *)(a1 + 88);
  v30 = *(_QWORD *)(a1 + 96);
  if (v29 != v30)
  {
    if (*(_BYTE *)(a1 + 170))
    {
      sub_10000B934(a1 + 16, (char *)&v86, (char *)&v87);
      v29 = *(_QWORD *)(a1 + 88);
      v30 = *(_QWORD *)(a1 + 96);
    }
    else
    {
      v85 = 1;
      LOWORD(__p) = v20;
    }
    if (v30 == v29)
    {
LABEL_57:
      v33 = 0;
    }
    else
    {
      v31 = 0;
      v32 = 0;
      while ((int)(sub_100002ADC((_QWORD *)(v29 + v31), &__p) << 24) > 0xFFFFFF
           || (int)(sub_100002ADC(&__p, (void **)(*(_QWORD *)(a1 + 88) + v31 + 24)) << 24) >= 0x1000000)
      {
        ++v32;
        v29 = *(_QWORD *)(a1 + 88);
        v31 += 48;
        if (v32 >= 0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(a1 + 96) - v29) >> 4))
          goto LABEL_57;
      }
      v33 = 1;
      v16 = 1;
    }
    if (v85 < 0)
      operator delete(__p);
    if ((v33 & 1) != 0)
      goto LABEL_155;
  }
  if (*(_QWORD *)(a1 + 136) == *(_QWORD *)(a1 + 144))
    goto LABEL_90;
  sub_10000BC08(a1 + 16, (char *)&v86, (char *)&v87, (uint64_t)&__p);
  v34 = *(_QWORD *)(a1 + 136);
  v35 = v85;
  v36 = *(_QWORD *)(a1 + 144) - v34;
  if (v36)
  {
    v81 = v18;
    v37 = 0;
    v38 = v36 / 24;
    v39 = __p;
    v40 = v84;
    if (v85 >= 0)
      v41 = v85;
    else
      v41 = v84;
    if (v38 <= 1)
      v42 = 1;
    else
      v42 = v36 / 24;
    v43 = 1;
    while (1)
    {
      v44 = (unsigned __int8 **)(v34 + 24 * v37);
      v45 = (unsigned __int8 *)*((unsigned __int8 *)v44 + 23);
      v46 = (char)v45;
      if ((char)v45 < 0)
        v45 = v44[1];
      if ((unsigned __int8 *)v41 == v45)
      {
        if (v46 >= 0)
          v47 = (unsigned __int8 *)(v34 + 24 * v37);
        else
          v47 = *v44;
        if ((v35 & 0x80) != 0)
        {
          v79 = v16;
          v50 = v41;
          v78 = v34;
          v51 = memcmp(v39, v47, v40);
          v34 = v78;
          v41 = v50;
          v16 = v79;
          if (!v51)
          {
            v16 = 1;
            v18 = v81;
            goto LABEL_88;
          }
        }
        else
        {
          if (!(_DWORD)v35)
          {
            v16 = 1;
            v18 = v81;
            if (!v43)
              goto LABEL_90;
            goto LABEL_155;
          }
          v48 = &__p;
          v49 = v35;
          while (*(unsigned __int8 *)v48 == *v47)
          {
            v48 = (void **)((char *)v48 + 1);
            ++v47;
            if (!--v49)
            {
              v16 = 1;
              goto LABEL_85;
            }
          }
        }
      }
      v43 = ++v37 < v38;
      if (v37 == v42)
      {
LABEL_85:
        v18 = v81;
        if ((v35 & 0x80) == 0)
          goto LABEL_89;
        goto LABEL_88;
      }
    }
  }
  v43 = 0;
  if (v85 < 0)
LABEL_88:
    operator delete(__p);
LABEL_89:
  if (!v43)
  {
LABEL_90:
    if ((char)v86 < 0)
      goto LABEL_155;
    v52 = *(_DWORD *)(a1 + 160);
    if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 16) + 4 * v86) & v52) == 0)
    {
      v53 = (v52 >> 7) & 1;
      if (v86 != 95)
        v53 = 0;
      if (v53 != 1)
        goto LABEL_155;
    }
    goto LABEL_46;
  }
LABEL_155:
  if (v16 == *(unsigned __int8 *)(a1 + 168))
  {
    v76 = 0;
    v77 = -993;
  }
  else
  {
    *(_QWORD *)(a2 + 16) += v18;
    v76 = *(_QWORD *)(a1 + 8);
    v77 = -995;
  }
  *(_DWORD *)a2 = v77;
  *(_QWORD *)(a2 + 80) = v76;
}

void sub_10000B7B4(void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    sub_10000B7F4((uint64_t *)v2);
    operator delete(**a1);
  }
}

void sub_10000B7F4(uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

void sub_10000B840(void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        sub_10000B8B0(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void sub_10000B8B0(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t sub_10000B8F4(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

void sub_10000B934(uint64_t a1, char *a2, char *a3)
{
  unint64_t v4;
  void **v5;
  void *__p[2];
  unsigned __int8 v7;

  sub_10000BB64(__p, a2, a3, a3 - a2);
  v4 = v7;
  if ((v7 & 0x80u) == 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  if ((v7 & 0x80u) != 0)
    v4 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0)
    operator delete(__p[0]);
}

void sub_10000B9B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_10000B9D0(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string *p_s;
  unint64_t v7;
  unint64_t v8;
  std::string::size_type size;
  std::string *v10;
  int v11;
  uint64_t v12;
  std::string v13;
  std::string __s;

  sub_10000BB64(&__s, a2, a3, a3 - a2);
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_)
      goto LABEL_9;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((_BYTE *)&__s.__r_.__value_.__s + 23))
      return;
    p_s = &__s;
  }
  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  v7 = v13.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a4 + 16) = *((_QWORD *)&v13.__r_.__value_.__l + 2);
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8)
    goto LABEL_9;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    size = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3)
      goto LABEL_9;
    v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
      return;
    v10 = &__s;
  }
  (*(void (**)(std::string *__return_ptr, _QWORD, std::string *, char *))(**(_QWORD **)(a1 + 16) + 32))(&v13, *(_QWORD *)(a1 + 16), v10, (char *)v10 + size);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(std::string *)a4 = v13;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    v11 = *(unsigned __int8 *)(a4 + 23);
    if (v11 != 12 && v11 != 1)
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_25;
  }
  v12 = *(_QWORD *)(a4 + 8);
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(_BYTE **)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
}

void sub_10000BB30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
    operator delete(*(void **)v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_10000BB64(_QWORD *result, char *a2, char *a3, unint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    sub_1000066FC();
  if (a4 > 0x16)
  {
    v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17)
      v8 = a4 | 7;
    v9 = v8 + 1;
    result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *v4 = result;
    v4 = result;
  }
  else
  {
    *((_BYTE *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    v10 = *a2++;
    *(_BYTE *)v4 = v10;
    v4 = (_QWORD *)((char *)v4 + 1);
  }
  *(_BYTE *)v4 = 0;
  return result;
}

void sub_10000BC08(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  void **v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  void *__p[2];
  unsigned __int8 v12;

  sub_10000BB64(__p, a2, a3, a3 - a2);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v7, (char *)v7 + v6);
  v8 = *(unsigned __int8 *)(a4 + 23);
  v9 = (char)v8;
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0)
        v10 = (_BYTE *)a4;
      else
        v10 = *(_BYTE **)a4;
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(_BYTE **)a4 = 0;
      *(_QWORD *)(a4 + 8) = 0;
    }
    else
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0)
    operator delete(__p[0]);
}

void sub_10000BCE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_10000BCFC(_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    sub_1000066FC();
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

void sub_10000BDA4()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_brack);
}

void sub_10000BDDC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

char *sub_10000BDF0(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  char *v4;
  int v5;
  uint64_t v6;
  unsigned int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char v13;
  int v14;
  char *v15;
  int v16;
  char *v17;
  char *v18;
  __int128 *v19;
  int v20;
  _BYTE *v21;
  char *v22;
  uint64_t v24;
  void *__p[2];
  uint64_t v26;
  void *v27[2];
  uint64_t v28;
  void *v29[2];
  uint64_t v30;
  __int128 v31;
  uint64_t v32;

  v4 = a2;
  if (a2 == a3)
    return v4;
  v5 = *a2;
  if (v5 == 93)
    return v4;
  v6 = (uint64_t)a4;
  v9 = 0;
  v10 = 0;
  v31 = 0uLL;
  v32 = 0;
  if (a2 + 1 != a3 && v5 == 91)
  {
    v11 = a2[1];
    switch(v11)
    {
      case '.':
        v4 = (char *)sub_10000C454(a1, a2 + 2, a3, (uint64_t)&v31);
        v9 = HIBYTE(v32);
        v10 = *((_QWORD *)&v31 + 1);
        break;
      case ':':
        v12 = sub_10000C39C(a1, a2 + 2, a3, (uint64_t)a4);
        goto LABEL_11;
      case '=':
        v12 = sub_10000C1C0(a1, a2 + 2, a3, a4);
LABEL_11:
        v6 = v12;
        v13 = 0;
        goto LABEL_44;
      default:
        v10 = 0;
        v9 = 0;
        break;
    }
  }
  v14 = *(_DWORD *)(a1 + 24) & 0x1F0;
  if ((v9 & 0x80u) == 0)
    v10 = v9;
  if (v10)
  {
    v15 = v4;
    goto LABEL_28;
  }
  if ((*(_DWORD *)(a1 + 24) & 0x1B0 | 0x40) == 0x40)
  {
    v16 = *v4;
    if (v16 == 92)
    {
      v17 = v4 + 1;
      if (v14)
        v18 = sub_10000C6A4(a1, v17, a3, (uint64_t *)&v31);
      else
        v18 = (char *)sub_10000C540(a1, (unsigned __int8 *)v17, (unsigned __int8 *)a3, (uint64_t)&v31, v6);
      v15 = v18;
      goto LABEL_28;
    }
  }
  else
  {
    LOBYTE(v16) = *v4;
  }
  if ((v9 & 0x80) != 0)
  {
    v19 = (__int128 *)v31;
    *((_QWORD *)&v31 + 1) = 1;
  }
  else
  {
    HIBYTE(v32) = 1;
    v19 = &v31;
  }
  *(_BYTE *)v19 = v16;
  *((_BYTE *)v19 + 1) = 0;
  v15 = v4 + 1;
LABEL_28:
  if (v15 == a3
    || (v20 = *v15, v20 == 93)
    || (v21 = v15 + 1, v15 + 1 == a3)
    || v20 != 45
    || *v21 == 93)
  {
    if (SHIBYTE(v32) < 0)
    {
      if (*((_QWORD *)&v31 + 1))
      {
        if (*((_QWORD *)&v31 + 1) != 1)
        {
          v22 = (char *)v31;
LABEL_42:
          sub_10000CD54(v6, *v22, v22[1]);
          goto LABEL_43;
        }
        v22 = (char *)v31;
        goto LABEL_40;
      }
    }
    else if (HIBYTE(v32))
    {
      v22 = (char *)&v31;
      if (HIBYTE(v32) != 1)
        goto LABEL_42;
LABEL_40:
      sub_10000AAE8(v6, *v22);
    }
LABEL_43:
    v13 = 1;
    v4 = v15;
    goto LABEL_44;
  }
  v29[0] = 0;
  v29[1] = 0;
  v30 = 0;
  v4 = v15 + 2;
  if (v15 + 2 != a3 && *v21 == 91 && *v4 == 46)
  {
    v24 = sub_10000C454(a1, v15 + 3, a3, (uint64_t)v29);
LABEL_60:
    v4 = (char *)v24;
    goto LABEL_61;
  }
  if ((v14 | 0x40) == 0x40)
  {
    LODWORD(v21) = *v21;
    if ((_DWORD)v21 == 92)
    {
      if (v14)
        v24 = (uint64_t)sub_10000C6A4(a1, v15 + 2, a3, (uint64_t *)v29);
      else
        v24 = (uint64_t)sub_10000C540(a1, (unsigned __int8 *)v15 + 2, (unsigned __int8 *)a3, (uint64_t)v29, v6);
      goto LABEL_60;
    }
  }
  else
  {
    LOBYTE(v21) = *v21;
  }
  HIBYTE(v30) = 1;
  LOWORD(v29[0]) = v21;
LABEL_61:
  *(_OWORD *)v27 = v31;
  v28 = v32;
  v32 = 0;
  v31 = 0uLL;
  *(_OWORD *)__p = *(_OWORD *)v29;
  v26 = v30;
  v29[0] = 0;
  v29[1] = 0;
  v30 = 0;
  sub_10000C990(v6, (char *)v27, (char *)__p);
  if (SHIBYTE(v26) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v28) < 0)
    operator delete(v27[0]);
  if (SHIBYTE(v30) < 0)
    operator delete(v29[0]);
  v13 = 1;
LABEL_44:
  if (SHIBYTE(v32) < 0)
    operator delete((void *)v31);
  if ((v13 & 1) != 0)
    return v4;
  return (char *)v6;
}

void sub_10000C160(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  uint64_t v28;

  if (a28 < 0)
    operator delete(__p);
  if (*(char *)(v28 - 49) < 0)
    operator delete(*(void **)(v28 - 72));
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000C1C0(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  uint64_t i;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  void *__p[2];
  unsigned __int8 v16;
  void *v17;
  uint64_t v18;
  unsigned __int8 v19;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_33;
  for (i = 0; a2[i] != 61 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i)
      goto LABEL_33;
  }
  if (&a2[i] == a3)
LABEL_33:
    sub_10000BDA4();
  sub_10000D008(a1, a2, &a2[i], (uint64_t)&v17);
  if (((char)v19 & 0x80000000) == 0)
  {
    v8 = v19;
    if (v19)
    {
      v9 = (char *)&v17;
      goto LABEL_14;
    }
LABEL_34:
    sub_10000CF7C();
  }
  v8 = v18;
  if (!v18)
    goto LABEL_34;
  v9 = (char *)v17;
LABEL_14:
  sub_10000D19C(a1, v9, &v9[v8], (uint64_t)__p);
  v10 = v16;
  if ((v16 & 0x80u) != 0)
    v10 = (unint64_t)__p[1];
  if (v10)
  {
    sub_10000CFC8(a4, (__int128 *)__p);
  }
  else
  {
    v11 = v19;
    if ((v19 & 0x80u) != 0)
      v11 = v18;
    if (v11 == 2)
    {
      v13 = (char *)&v17;
      if ((v19 & 0x80u) != 0)
        v13 = (char *)v17;
      sub_10000CD54((uint64_t)a4, *v13, v13[1]);
    }
    else
    {
      if (v11 != 1)
        sub_10000CF7C();
      v12 = (char *)&v17;
      if ((v19 & 0x80u) != 0)
        v12 = (char *)v17;
      sub_10000AAE8((uint64_t)a4, *v12);
    }
  }
  if ((char)v16 < 0)
    operator delete(__p[0]);
  if ((char)v19 < 0)
    operator delete(v17);
  return (uint64_t)&a2[i + 2];
}

void sub_10000C364(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000C39C(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  uint64_t i;
  int v7;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_11;
  for (i = 0; a2[i] != 58 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i)
      goto LABEL_11;
  }
  if (&a2[i] == a3)
LABEL_11:
    sub_10000BDA4();
  v7 = sub_10000D668(a1, a2, &a2[i], *(_BYTE *)(a1 + 24) & 1);
  if (!v7)
    sub_10000D61C();
  *(_DWORD *)(a4 + 160) |= v7;
  return (uint64_t)&a2[i + 2];
}

uint64_t sub_10000C454(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  __int128 v10;
  unint64_t v11;

  if (a3 - a2 < 2 || a3 - 1 == a2)
    goto LABEL_15;
  for (i = 0; a2[i] != 46 || a2[i + 1] != 93; ++i)
  {
    if (a3 - a2 - 2 == i)
      goto LABEL_15;
  }
  if (&a2[i] == a3)
LABEL_15:
    sub_10000BDA4();
  sub_10000D008(a1, a2, &a2[i], (uint64_t)&v10);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(_OWORD *)a4 = v10;
  v7 = v11;
  *(_QWORD *)(a4 + 16) = v11;
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 - 1 >= 2)
    sub_10000CF7C();
  return (uint64_t)&a2[i + 2];
}

unsigned __int8 *sub_10000C540(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5)
{
  int v6;
  int v7;
  int v8;

  if (a2 == a3)
    sub_100009A30();
  v6 = (char)*a2;
  if (v6 > 97)
  {
    if (v6 > 114)
    {
      if (v6 != 115)
      {
        if (v6 != 119)
          return sub_100009C04(a1, a2, a3, (uint64_t *)a4);
        *(_DWORD *)(a5 + 160) |= 0x500u;
        sub_10000AAE8(a5, 95);
        return a2 + 1;
      }
      v8 = *(_DWORD *)(a5 + 160) | 0x4000;
    }
    else
    {
      if (v6 == 98)
      {
        if (*(char *)(a4 + 23) < 0)
        {
          *(_QWORD *)(a4 + 8) = 1;
          a4 = *(_QWORD *)a4;
        }
        else
        {
          *(_BYTE *)(a4 + 23) = 1;
        }
        *(_WORD *)a4 = 8;
        return a2 + 1;
      }
      if (v6 != 100)
        return sub_100009C04(a1, a2, a3, (uint64_t *)a4);
      v8 = *(_DWORD *)(a5 + 160) | 0x400;
    }
    *(_DWORD *)(a5 + 160) = v8;
    return a2 + 1;
  }
  if (v6 <= 82)
  {
    if (!*a2)
    {
      if (*(char *)(a4 + 23) < 0)
      {
        *(_QWORD *)(a4 + 8) = 1;
        a4 = *(_QWORD *)a4;
      }
      else
      {
        *(_BYTE *)(a4 + 23) = 1;
      }
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 1) = 0;
      return a2 + 1;
    }
    if (v6 == 68)
    {
      v7 = *(_DWORD *)(a5 + 164) | 0x400;
LABEL_22:
      *(_DWORD *)(a5 + 164) = v7;
      return a2 + 1;
    }
    return sub_100009C04(a1, a2, a3, (uint64_t *)a4);
  }
  if (v6 == 83)
  {
    v7 = *(_DWORD *)(a5 + 164) | 0x4000;
    goto LABEL_22;
  }
  if (v6 != 87)
    return sub_100009C04(a1, a2, a3, (uint64_t *)a4);
  *(_DWORD *)(a5 + 164) |= 0x500u;
  sub_10000D720(a5, 95);
  return a2 + 1;
}

char *sub_10000C6A4(uint64_t a1, char *a2, char *a3, uint64_t *a4)
{
  int v4;
  char v5;
  char v6;
  char *v7;
  char v8;
  int v9;
  char v10;
  __int16 v11;

  if (a2 == a3)
LABEL_78:
    sub_100009A30();
  v4 = *a2;
  v5 = *a2;
  if (v4 > 97)
  {
    switch(*a2)
    {
      case 'n':
        if (!a4)
          goto LABEL_60;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v11 = 10;
        goto LABEL_75;
      case 'o':
      case 'p':
      case 'q':
      case 's':
      case 'u':
        goto LABEL_25;
      case 'r':
        if (!a4)
          goto LABEL_60;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v11 = 13;
        goto LABEL_75;
      case 't':
        if (!a4)
          goto LABEL_60;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v11 = 9;
        goto LABEL_75;
      case 'v':
        if (!a4)
          goto LABEL_60;
        if (*((char *)a4 + 23) < 0)
        {
          a4[1] = 1;
          a4 = (uint64_t *)*a4;
        }
        else
        {
          *((_BYTE *)a4 + 23) = 1;
        }
        v11 = 11;
        goto LABEL_75;
      default:
        if (v4 == 98)
        {
          if (!a4)
            goto LABEL_60;
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }
          v11 = 8;
        }
        else
        {
          if (v4 != 102)
            goto LABEL_25;
          if (!a4)
            goto LABEL_60;
          if (*((char *)a4 + 23) < 0)
          {
            a4[1] = 1;
            a4 = (uint64_t *)*a4;
          }
          else
          {
            *((_BYTE *)a4 + 23) = 1;
          }
          v11 = 12;
        }
        break;
    }
    goto LABEL_75;
  }
  if (v4 > 91)
  {
    if (v4 == 92)
      goto LABEL_16;
    if (v4 != 97)
      goto LABEL_25;
    if (!a4)
      goto LABEL_60;
    if (*((char *)a4 + 23) < 0)
    {
      a4[1] = 1;
      a4 = (uint64_t *)*a4;
    }
    else
    {
      *((_BYTE *)a4 + 23) = 1;
    }
    v11 = 7;
LABEL_75:
    *(_WORD *)a4 = v11;
    return a2 + 1;
  }
  if (v4 == 34 || v4 == 47)
  {
LABEL_16:
    if (a4)
    {
      if (*((char *)a4 + 23) < 0)
      {
        a4[1] = 1;
        a4 = (uint64_t *)*a4;
      }
      else
      {
        *((_BYTE *)a4 + 23) = 1;
      }
      *(_BYTE *)a4 = v5;
      *((_BYTE *)a4 + 1) = 0;
      return a2 + 1;
    }
LABEL_60:
    sub_100009FD8(a1);
  }
LABEL_25:
  if ((v5 & 0xF8) != 0x30)
    goto LABEL_78;
  v6 = v4 - 48;
  v7 = a2 + 1;
  if (a2 + 1 == a3)
  {
LABEL_48:
    v7 = a3;
    goto LABEL_49;
  }
  if ((*v7 & 0xF8) == 0x30)
  {
    v6 = *v7 + 8 * v6 - 48;
    if (a2 + 2 != a3)
    {
      v8 = a2[2];
      v9 = v8 & 0xF8;
      v10 = v8 + 8 * v6 - 48;
      if (v9 == 48)
        v7 = a2 + 3;
      else
        v7 = a2 + 2;
      if (v9 == 48)
        v6 = v10;
      goto LABEL_49;
    }
    goto LABEL_48;
  }
LABEL_49:
  if (!a4)
    sub_100009FD8(a1);
  if (*((char *)a4 + 23) < 0)
  {
    a4[1] = 1;
    a4 = (uint64_t *)*a4;
  }
  else
  {
    *((_BYTE *)a4 + 23) = 1;
  }
  *(_BYTE *)a4 = v6;
  *((_BYTE *)a4 + 1) = 0;
  return v7;
}

void sub_10000C990(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  char *v4;
  unint64_t i;
  unint64_t v7;
  char *v8;
  char v9;
  char *v10;
  unint64_t j;
  unint64_t v12;
  char *v13;
  char v14;
  char *v15;
  uint64_t v16;
  unint64_t k;
  unint64_t v18;
  char *v19;
  char *v20;
  unint64_t m;
  unint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char v31;
  _BYTE *v32;
  char *v33;
  char v34;
  _BYTE *v35;
  void *v36[2];
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  void *v40[2];
  uint64_t v41;
  void *__p[2];
  uint64_t v43;

  v3 = a3;
  v4 = a2;
  if (*(_BYTE *)(a1 + 170))
  {
    if (*(_BYTE *)(a1 + 169))
    {
      for (i = 0; ; ++i)
      {
        v7 = v4[23] < 0 ? *((_QWORD *)v4 + 1) : v4[23];
        if (i >= v7)
          break;
        v8 = v4;
        if (v4[23] < 0)
          v8 = *(char **)v4;
        v9 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v8[i]);
        v10 = v4;
        if (v4[23] < 0)
          v10 = *(char **)v4;
        v10[i] = v9;
      }
      for (j = 0; ; ++j)
      {
        v12 = v3[23] < 0 ? *((_QWORD *)v3 + 1) : v3[23];
        if (j >= v12)
          break;
        v13 = v3;
        if (v3[23] < 0)
          v13 = *(char **)v3;
        v14 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), v13[j]);
        v15 = v3;
        if (v3[23] < 0)
          v15 = *(char **)v3;
        v15[j] = v14;
      }
    }
    else
    {
      for (k = 0; ; ++k)
      {
        v18 = a2[23] < 0 ? *((_QWORD *)a2 + 1) : a2[23];
        if (k >= v18)
          break;
        v19 = a2;
        if (a2[23] < 0)
          v19 = *(char **)a2;
        v20 = a2;
        if (a2[23] < 0)
          v20 = *(char **)a2;
        v20[k] = v19[k];
      }
      for (m = 0; ; ++m)
      {
        v22 = a3[23] < 0 ? *((_QWORD *)a3 + 1) : a3[23];
        if (m >= v22)
          break;
        v23 = a3;
        if (a3[23] < 0)
          v23 = *(char **)a3;
        v24 = a3;
        if (a3[23] < 0)
          v24 = *(char **)a3;
        v24[m] = v23[m];
      }
    }
    if (v4[23] < 0)
    {
      v26 = v4;
      v4 = *(char **)v4;
      v25 = *((_QWORD *)v26 + 1);
    }
    else
    {
      v25 = v4[23];
    }
    sub_10000DB00(a1 + 16, v4, &v4[v25]);
    if (v3[23] < 0)
    {
      v28 = v3;
      v3 = *(char **)v3;
      v27 = *((_QWORD *)v28 + 1);
    }
    else
    {
      v27 = v3[23];
    }
    sub_10000DB00(a1 + 16, v3, &v3[v27]);
    *(_OWORD *)v40 = v38;
    v41 = v39;
    *(_OWORD *)__p = *(_OWORD *)v36;
    v43 = v37;
    sub_10000D94C((char **)(a1 + 88), (__int128 *)v40);
    if (SHIBYTE(v43) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v41) < 0)
      operator delete(v40[0]);
  }
  else
  {
    if (a2[23] < 0)
      v16 = *((_QWORD *)a2 + 1);
    else
      v16 = a2[23];
    if (v16 != 1 || (a3[23] < 0 ? (v29 = *((_QWORD *)a3 + 1)) : (v29 = a3[23]), v29 != 1))
      sub_10000DB9C();
    if (*(_BYTE *)(a1 + 169))
    {
      v30 = a2;
      if (a2[23] < 0)
        v30 = *(char **)a2;
      v31 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *v30);
      v32 = v4;
      if (v4[23] < 0)
        v32 = *(_BYTE **)v4;
      *v32 = v31;
      v33 = v3;
      if (v3[23] < 0)
        v33 = *(char **)v3;
      v34 = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), *v33);
      v35 = v3;
      if (v3[23] < 0)
        v35 = *(_BYTE **)v3;
      *v35 = v34;
    }
    *(_OWORD *)v40 = *(_OWORD *)v4;
    v41 = *((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 1) = 0;
    *((_QWORD *)v4 + 2) = 0;
    *(_QWORD *)v4 = 0;
    *(_OWORD *)__p = *(_OWORD *)v3;
    v43 = *((_QWORD *)v3 + 2);
    *(_QWORD *)v3 = 0;
    *((_QWORD *)v3 + 1) = 0;
    *((_QWORD *)v3 + 2) = 0;
    sub_10000D94C((char **)(a1 + 88), (__int128 *)v40);
    if (SHIBYTE(v43) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v41) < 0)
      operator delete(v40[0]);
  }
}

void sub_10000CD08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  sub_10000B8F4((uint64_t)&a21);
  _Unwind_Resume(a1);
}

void sub_10000CD54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5;
  __int16 v6;
  unint64_t v7;
  __int16 v8;
  _WORD *v9;
  char **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  _WORD *v26;
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  __int16 v39;
  char *v40;
  __int16 v41;

  if (!*(_BYTE *)(a1 + 169))
  {
    v18 = a1 + 128;
    v19 = *(_QWORD *)(a1 + 128);
    v10 = (char **)(a1 + 112);
    v8 = a2 | (unsigned __int16)((_WORD)a3 << 8);
    v9 = *(_WORD **)(a1 + 120);
    if (*(_BYTE *)(a1 + 170))
    {
      if ((unint64_t)v9 < v19)
        goto LABEL_24;
      v20 = (char *)v9 - *v10;
      if (v20 > -3)
      {
        v21 = v20 >> 1;
        v22 = v19 - (_QWORD)*v10;
        if (v22 <= (v20 >> 1) + 1)
          v23 = v21 + 1;
        else
          v23 = v22;
        if (v22 >= 0x7FFFFFFFFFFFFFFELL)
          v24 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v24 = v23;
        if (v24)
          v25 = (char *)sub_10000DC78(v18, v24);
        else
          v25 = 0;
        v27 = &v25[2 * v21];
        v28 = &v25[2 * v24];
        *(_WORD *)v27 = v8;
        v26 = v27 + 2;
        v38 = *(char **)(a1 + 112);
        v29 = *(char **)(a1 + 120);
        if (v29 == v38)
          goto LABEL_46;
        do
        {
          v39 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v39;
          v27 -= 2;
        }
        while (v29 != v38);
        goto LABEL_45;
      }
    }
    else
    {
      if ((unint64_t)v9 < v19)
        goto LABEL_24;
      v32 = (char *)v9 - *v10;
      if (v32 > -3)
      {
        v33 = v32 >> 1;
        v34 = v19 - (_QWORD)*v10;
        if (v34 <= (v32 >> 1) + 1)
          v35 = v33 + 1;
        else
          v35 = v34;
        if (v34 >= 0x7FFFFFFFFFFFFFFELL)
          v36 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v36 = v35;
        if (v36)
          v37 = (char *)sub_10000DC78(v18, v36);
        else
          v37 = 0;
        v27 = &v37[2 * v33];
        v28 = &v37[2 * v36];
        *(_WORD *)v27 = v8;
        v26 = v27 + 2;
        v40 = *(char **)(a1 + 112);
        v29 = *(char **)(a1 + 120);
        if (v29 == v40)
          goto LABEL_46;
        do
        {
          v41 = *((_WORD *)v29 - 1);
          v29 -= 2;
          *((_WORD *)v27 - 1) = v41;
          v27 -= 2;
        }
        while (v29 != v40);
        goto LABEL_45;
      }
    }
LABEL_49:
    sub_10000699C();
  }
  v5 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
  v6 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a3);
  v7 = *(_QWORD *)(a1 + 128);
  v8 = v5 | (unsigned __int16)(v6 << 8);
  v9 = *(_WORD **)(a1 + 120);
  if ((unint64_t)v9 < v7)
  {
LABEL_24:
    *v9 = v8;
    v26 = v9 + 1;
    goto LABEL_48;
  }
  v10 = (char **)(a1 + 112);
  v11 = *(_QWORD *)(a1 + 112);
  v12 = (uint64_t)v9 - v11;
  if ((uint64_t)v9 - v11 <= -3)
    goto LABEL_49;
  v13 = v12 >> 1;
  v14 = v7 - v11;
  if (v14 <= (v12 >> 1) + 1)
    v15 = v13 + 1;
  else
    v15 = v14;
  if (v14 >= 0x7FFFFFFFFFFFFFFELL)
    v16 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v16 = v15;
  if (v16)
    v17 = (char *)sub_10000DC78(a1 + 128, v16);
  else
    v17 = 0;
  v27 = &v17[2 * v13];
  v28 = &v17[2 * v16];
  *(_WORD *)v27 = v8;
  v26 = v27 + 2;
  v30 = *(char **)(a1 + 112);
  v29 = *(char **)(a1 + 120);
  if (v29 == v30)
    goto LABEL_46;
  do
  {
    v31 = *((_WORD *)v29 - 1);
    v29 -= 2;
    *((_WORD *)v27 - 1) = v31;
    v27 -= 2;
  }
  while (v29 != v30);
LABEL_45:
  v29 = *v10;
LABEL_46:
  *(_QWORD *)(a1 + 112) = v27;
  *(_QWORD *)(a1 + 120) = v26;
  *(_QWORD *)(a1 + 128) = v28;
  if (v29)
    operator delete(v29);
LABEL_48:
  *(_QWORD *)(a1 + 120) = v26;
}

void sub_10000CF7C()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_collate);
}

void sub_10000CFB4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000CFC8(uint64_t *a1, __int128 *a2)
{
  uint64_t *v3;
  unint64_t v4;
  uint64_t result;

  v3 = a1 + 17;
  v4 = a1[18];
  if (v4 >= a1[19])
  {
    result = sub_10000D2EC(v3, a2);
  }
  else
  {
    sub_10000D290(v3, a2);
    result = v4 + 24;
  }
  a1[18] = result;
  return result;
}

void sub_10000D008(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  std::string *p_s;
  unint64_t v7;
  unint64_t v8;
  std::string::size_type size;
  std::string *v10;
  int v11;
  uint64_t v12;
  std::string v13;
  std::string __s;

  sub_10000BB64(&__s, a2, a3, a3 - a2);
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!__s.__r_.__value_.__l.__size_)
      goto LABEL_9;
    p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((_BYTE *)&__s.__r_.__value_.__s + 23))
      return;
    p_s = &__s;
  }
  std::__get_collation_name(&v13, (const char *)p_s);
  *(_OWORD *)a4 = *(_OWORD *)&v13.__r_.__value_.__l.__data_;
  v7 = v13.__r_.__value_.__r.__words[2];
  *(_QWORD *)(a4 + 16) = *((_QWORD *)&v13.__r_.__value_.__l + 2);
  v8 = HIBYTE(v7);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8)
    goto LABEL_9;
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
  {
    size = __s.__r_.__value_.__l.__size_;
    if (__s.__r_.__value_.__l.__size_ >= 3)
      goto LABEL_9;
    v10 = (std::string *)__s.__r_.__value_.__r.__words[0];
  }
  else
  {
    size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
    if (HIBYTE(__s.__r_.__value_.__r.__words[2]) >= 3u)
      return;
    v10 = &__s;
  }
  (*(void (**)(std::string *__return_ptr, _QWORD, std::string *, char *))(**(_QWORD **)(a1 + 16) + 32))(&v13, *(_QWORD *)(a1 + 16), v10, (char *)v10 + size);
  if (*(char *)(a4 + 23) < 0)
    operator delete(*(void **)a4);
  *(std::string *)a4 = v13;
  if ((*(char *)(a4 + 23) & 0x80000000) == 0)
  {
    v11 = *(unsigned __int8 *)(a4 + 23);
    if (v11 != 12 && v11 != 1)
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
      goto LABEL_9;
    }
    goto LABEL_25;
  }
  v12 = *(_QWORD *)(a4 + 8);
  if (v12 == 1 || v12 == 12)
  {
LABEL_25:
    std::string::operator=((std::string *)a4, &__s);
    goto LABEL_9;
  }
  **(_BYTE **)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
LABEL_9:
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
}

void sub_10000D168(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 + 23) < 0)
    operator delete(*(void **)v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_10000D19C(uint64_t a1@<X0>, char *a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v6;
  void **v7;
  uint64_t v8;
  int v9;
  _BYTE *v10;
  void *__p[2];
  unsigned __int8 v12;

  sub_10000BB64(__p, a2, a3, a3 - a2);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v7, (char *)v7 + v6);
  v8 = *(unsigned __int8 *)(a4 + 23);
  v9 = (char)v8;
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a4 + 8);
  if (v8 != 1)
  {
    if (v8 == 12)
    {
      if (v9 >= 0)
        v10 = (_BYTE *)a4;
      else
        v10 = *(_BYTE **)a4;
      v10[11] = v10[3];
    }
    else if (v9 < 0)
    {
      **(_BYTE **)a4 = 0;
      *(_QWORD *)(a4 + 8) = 0;
    }
    else
    {
      *(_BYTE *)a4 = 0;
      *(_BYTE *)(a4 + 23) = 0;
    }
  }
  if ((char)v12 < 0)
    operator delete(__p[0]);
}

void sub_10000D274(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_10000D290(_QWORD *result, __int128 *a2)
{
  _QWORD *v2;
  uint64_t v3;
  __int128 v4;

  v2 = result;
  v3 = result[1];
  if (*((char *)a2 + 23) < 0)
  {
    result = sub_1000067AC((_BYTE *)result[1], *(void **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    *(_QWORD *)(v3 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v3 = v4;
  }
  v2[1] = v3 + 24;
  return result;
}

void sub_10000D2E4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_10000D2EC(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v15[2];
  char *v16;
  char *v17;
  uint64_t *v18;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    sub_10000699C();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v18 = a1 + 2;
  if (v9)
    v10 = (char *)sub_100008D88(v7, v9);
  else
    v10 = 0;
  v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v16 = v11;
  v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_1000067AC(v11, *(void **)a2, *((_QWORD *)a2 + 1));
    v11 = v16;
  }
  else
  {
    v12 = *a2;
    *((_QWORD *)v11 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v11 = v12;
  }
  v16 = v11 + 24;
  sub_10000D40C(a1, v15);
  v13 = a1[1];
  sub_10000D594((uint64_t)v15);
  return v13;
}

void sub_10000D3F8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_10000D594((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D40C(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = sub_10000D480((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

uint64_t sub_10000D480(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v9;
  }
  v13 = 1;
  sub_10000D51C((uint64_t)v12);
  return a6;
}

uint64_t sub_10000D51C(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    sub_10000D550(a1);
  return a1;
}

void sub_10000D550(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 24;
  }
}

uint64_t sub_10000D594(uint64_t a1)
{
  sub_10000D5C8(a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_10000D5C8(uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

void sub_10000D61C()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_ctype);
}

void sub_10000D654(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D668(uint64_t a1, char *a2, char *a3, BOOL a4)
{
  unint64_t v6;
  void **v7;
  void **v8;
  uint64_t classname;
  void *__p[2];
  unsigned __int8 v12;

  sub_10000BB64(__p, a2, a3, a3 - a2);
  v6 = v12;
  if ((v12 & 0x80u) == 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  if ((v12 & 0x80u) != 0)
    v6 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 8) + 48))(*(_QWORD *)(a1 + 8), v7, (char *)v7 + v6);
  if ((v12 & 0x80u) == 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  classname = std::__get_classname((const char *)v8, a4);
  if ((char)v12 < 0)
    operator delete(__p[0]);
  return classname;
}

void sub_10000D704(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_10000D720(uint64_t a1, uint64_t a2)
{
  char v2;
  unint64_t v4;
  _BYTE *v5;
  unint64_t *v6;
  unint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  size_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  _BYTE *v22;
  char v23;
  unint64_t v24;
  _BYTE *v25;
  unint64_t v26;
  unint64_t v27;
  size_t v28;
  _BYTE *v29;
  char v30;
  _BYTE *v31;
  char v32;

  v2 = a2;
  if (*(_BYTE *)(a1 + 169))
  {
    v2 = (*(uint64_t (**)(_QWORD, uint64_t))(**(_QWORD **)(a1 + 24) + 40))(*(_QWORD *)(a1 + 24), a2);
    v5 = *(_BYTE **)(a1 + 72);
    v4 = *(_QWORD *)(a1 + 80);
    if ((unint64_t)v5 >= v4)
    {
      v6 = (unint64_t *)(a1 + 64);
      v7 = *(_QWORD *)(a1 + 64);
      v8 = &v5[-v7];
      v9 = (uint64_t)&v5[-v7 + 1];
      if (v9 >= 0)
      {
        v10 = v4 - v7;
        if (2 * v10 > v9)
          v9 = 2 * v10;
        if (v10 >= 0x3FFFFFFFFFFFFFFFLL)
          v11 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v11 = v9;
        if (v11)
          v12 = operator new(v11);
        else
          v12 = 0;
        v20 = &v8[(_QWORD)v12];
        v21 = (char *)v12 + v11;
        v8[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v8[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v7)
        {
          v22 = &v5[~v7];
          do
          {
            v23 = *--v5;
            (v22--)[(_QWORD)v12] = v23;
          }
          while (v5 != (_BYTE *)v7);
LABEL_45:
          v5 = (_BYTE *)*v6;
          goto LABEL_47;
        }
        goto LABEL_46;
      }
LABEL_50:
      sub_10000699C();
    }
    goto LABEL_22;
  }
  v6 = (unint64_t *)(a1 + 64);
  v5 = *(_BYTE **)(a1 + 72);
  v13 = *(_QWORD *)(a1 + 80);
  if (!*(_BYTE *)(a1 + 170))
  {
    if ((unint64_t)v5 >= v13)
    {
      v24 = *v6;
      v25 = &v5[-*v6];
      v26 = (unint64_t)(v25 + 1);
      if ((uint64_t)(v25 + 1) >= 0)
      {
        v27 = v13 - v24;
        if (2 * v27 > v26)
          v26 = 2 * v27;
        if (v27 >= 0x3FFFFFFFFFFFFFFFLL)
          v28 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
          v12 = operator new(v28);
        else
          v12 = 0;
        v20 = &v25[(_QWORD)v12];
        v21 = (char *)v12 + v28;
        v25[(_QWORD)v12] = v2;
        v19 = (uint64_t)&v25[(_QWORD)v12 + 1];
        if (v5 != (_BYTE *)v24)
        {
          v31 = &v5[~v24];
          do
          {
            v32 = *--v5;
            (v31--)[(_QWORD)v12] = v32;
          }
          while (v5 != (_BYTE *)v24);
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      goto LABEL_50;
    }
LABEL_22:
    *v5 = v2;
    v19 = (uint64_t)(v5 + 1);
    goto LABEL_49;
  }
  if ((unint64_t)v5 < v13)
    goto LABEL_22;
  v14 = *v6;
  v15 = &v5[-*v6];
  v16 = (unint64_t)(v15 + 1);
  if ((uint64_t)(v15 + 1) < 0)
    goto LABEL_50;
  v17 = v13 - v14;
  if (2 * v17 > v16)
    v16 = 2 * v17;
  if (v17 >= 0x3FFFFFFFFFFFFFFFLL)
    v18 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v18 = v16;
  if (v18)
    v12 = operator new(v18);
  else
    v12 = 0;
  v20 = &v15[(_QWORD)v12];
  v21 = (char *)v12 + v18;
  v15[(_QWORD)v12] = v2;
  v19 = (uint64_t)&v15[(_QWORD)v12 + 1];
  if (v5 != (_BYTE *)v14)
  {
    v29 = &v5[~v14];
    do
    {
      v30 = *--v5;
      (v29--)[(_QWORD)v12] = v30;
    }
    while (v5 != (_BYTE *)v14);
    goto LABEL_45;
  }
LABEL_46:
  v12 = v20;
LABEL_47:
  *(_QWORD *)(a1 + 64) = v12;
  *(_QWORD *)(a1 + 72) = v19;
  *(_QWORD *)(a1 + 80) = v21;
  if (v5)
    operator delete(v5);
LABEL_49:
  *(_QWORD *)(a1 + 72) = v19;
}

uint64_t sub_10000D94C(char **a1, __int128 *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  char *v20;
  char *v21;
  __int128 v22;
  __int128 v23;
  int64x2_t v24;
  char *v25;
  uint64_t v26;
  int64x2_t v27;
  char *v28;
  uint64_t v29;

  v6 = (unint64_t)a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(result - 8);
  if (v7 >= v6)
  {
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (_QWORD)*a1) >> 4);
    v12 = v11 + 1;
    if (v11 + 1 > 0x555555555555555)
      sub_10000699C();
    v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - (_QWORD)*a1) >> 4);
    if (2 * v13 > v12)
      v12 = 2 * v13;
    if (v13 >= 0x2AAAAAAAAAAAAAALL)
      v14 = 0x555555555555555;
    else
      v14 = v12;
    v29 = result;
    if (v14)
      v15 = (char *)sub_10000DBE8(result, v14);
    else
      v15 = 0;
    v16 = &v15[48 * v11];
    v17 = *a2;
    *((_QWORD *)v16 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v16 = v17;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v18 = *(__int128 *)((char *)a2 + 24);
    *((_QWORD *)v16 + 5) = *((_QWORD *)a2 + 5);
    *(_OWORD *)(v16 + 24) = v18;
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
    *((_QWORD *)a2 + 3) = 0;
    v20 = *a1;
    v19 = (unint64_t)a1[1];
    if ((char *)v19 == *a1)
    {
      v24 = vdupq_n_s64(v19);
      v21 = &v15[48 * v11];
    }
    else
    {
      v21 = &v15[48 * v11];
      do
      {
        v22 = *(_OWORD *)(v19 - 48);
        *((_QWORD *)v21 - 4) = *(_QWORD *)(v19 - 32);
        *((_OWORD *)v21 - 3) = v22;
        *(_QWORD *)(v19 - 40) = 0;
        *(_QWORD *)(v19 - 32) = 0;
        *(_QWORD *)(v19 - 48) = 0;
        v23 = *(_OWORD *)(v19 - 24);
        *((_QWORD *)v21 - 1) = *(_QWORD *)(v19 - 8);
        *(_OWORD *)(v21 - 24) = v23;
        v21 -= 48;
        *(_QWORD *)(v19 - 16) = 0;
        *(_QWORD *)(v19 - 8) = 0;
        *(_QWORD *)(v19 - 24) = 0;
        v19 -= 48;
      }
      while ((char *)v19 != v20);
      v24 = *(int64x2_t *)a1;
    }
    v10 = v16 + 48;
    *a1 = v21;
    a1[1] = v16 + 48;
    v27 = v24;
    v25 = a1[2];
    a1[2] = &v15[48 * v14];
    v28 = v25;
    v26 = v24.i64[0];
    result = sub_10000DC2C((uint64_t)&v26);
  }
  else
  {
    v8 = *a2;
    *(_QWORD *)(v7 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v7 = v8;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    v9 = *(__int128 *)((char *)a2 + 24);
    *(_QWORD *)(v7 + 40) = *((_QWORD *)a2 + 5);
    *(_OWORD *)(v7 + 24) = v9;
    *((_QWORD *)a2 + 4) = 0;
    *((_QWORD *)a2 + 5) = 0;
    *((_QWORD *)a2 + 3) = 0;
    v10 = (char *)(v7 + 48);
  }
  a1[1] = v10;
  return result;
}

void sub_10000DB00(uint64_t a1, char *a2, char *a3)
{
  unint64_t v4;
  void **v5;
  void *__p[2];
  unsigned __int8 v7;

  sub_10000BB64(__p, a2, a3, a3 - a2);
  v4 = v7;
  if ((v7 & 0x80u) == 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  if ((v7 & 0x80u) != 0)
    v4 = (unint64_t)__p[1];
  (*(void (**)(_QWORD, void **, char *))(**(_QWORD **)(a1 + 16) + 32))(*(_QWORD *)(a1 + 16), v5, (char *)v5 + v4);
  if ((char)v7 < 0)
    operator delete(__p[0]);
}

void sub_10000DB80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_10000DB9C()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_range);
}

void sub_10000DBD4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void *sub_10000DBE8(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    sub_100006784();
  return operator new(48 * a2);
}

uint64_t sub_10000DC2C(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 48;
    sub_10000B8B0(i - 48);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void *sub_10000DC78(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    sub_100006784();
  return operator new(2 * a2);
}

_QWORD *sub_10000DCA8(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100014520;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_10000DCEC(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100014520;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_10000DD40(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(*(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1)) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

_QWORD *sub_10000DD70(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100014520;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_10000DDB4(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100014520;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_10000DE08(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_DWORD *)a2 = -994;
  v2 = *(_QWORD *)(a2 + 32) + 24 * (*(_DWORD *)(result + 16) - 1);
  *(_QWORD *)(v2 + 8) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(v2 + 16) = 1;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void sub_10000DE40()
{
  operator new();
}

void sub_10000DF60(_Unwind_Exception *a1)
{
  uint64_t v1;

  (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_10000DF88(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, int *a4)
{
  int v4;
  int v5;
  int v6;

  if (a2 != a3)
  {
    v4 = *a2;
    if ((v4 & 0xF8) == 0x30 || (v4 & 0xFE) == 0x38)
    {
      v5 = v4 - 48;
      *a4 = v5;
      if (++a2 == a3)
      {
        return a3;
      }
      else
      {
        while (1)
        {
          v6 = *a2;
          if ((v6 & 0xF8) != 0x30 && (v6 & 0xFE) != 0x38)
            break;
          if (v5 >= 214748364)
            sub_10000E024();
          v5 = v6 + 10 * v5 - 48;
          *a4 = v5;
          if (++a2 == a3)
            return a3;
        }
      }
    }
  }
  return a2;
}

void sub_10000E024()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_badbrace);
}

void sub_10000E05C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_10000E070()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, error_brace);
}

void sub_10000E0A8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_10000E0BC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = off_1000149A0;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = off_100014520;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return a1;
}

void sub_10000E124(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = off_1000149A0;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = off_100014520;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  operator delete();
}

unsigned int *sub_10000E19C(unsigned int *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  uint64_t v10;

  v2 = result[10];
  v3 = a2[7];
  v4 = (unint64_t *)(v3 + 16 * v2);
  if (*(_DWORD *)a2 == -991)
  {
    v5 = *v4 + 1;
    *v4 = v5;
    v6 = *((_QWORD *)result + 3);
    v7 = *((_QWORD *)result + 4);
    v8 = v5 < v7;
    if (v5 < v7 && v5 >= v6)
    {
      v10 = *(_QWORD *)(v3 + 16 * v2 + 8);
      v8 = v5 < v7 && v10 != a2[2];
    }
    if (!v8 || v5 < v6)
    {
      *(_DWORD *)a2 = -994;
      if (!v8)
        goto LABEL_25;
LABEL_22:
      a2[10] = *((_QWORD *)result + 1);
      return sub_10000E360(result, a2);
    }
    goto LABEL_23;
  }
  *v4 = 0;
  if (*((_QWORD *)result + 4))
  {
    if (*((_QWORD *)result + 3))
    {
      *(_DWORD *)a2 = -994;
      goto LABEL_22;
    }
LABEL_23:
    *(_DWORD *)a2 = -992;
    return result;
  }
  *(_DWORD *)a2 = -994;
LABEL_25:
  a2[10] = *((_QWORD *)result + 2);
  return result;
}

unsigned int *sub_10000E250(unsigned int *result, int a2, _QWORD *a3)
{
  *(_DWORD *)a3 = -994;
  if (*((unsigned __int8 *)result + 52) == a2)
  {
    a3[10] = *((_QWORD *)result + 2);
  }
  else
  {
    a3[10] = *((_QWORD *)result + 1);
    return sub_10000E360(result, a3);
  }
  return result;
}

_QWORD *sub_10000E280(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = off_1000149A0;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = off_100014520;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return a1;
}

void sub_10000E2E8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = off_1000149A0;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = off_100014520;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  operator delete();
}

unsigned int *sub_10000E360(unsigned int *result, _QWORD *a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = result[11];
  *(_QWORD *)(a2[7] + 16 * result[10] + 8) = a2[2];
  v3 = result[12];
  if (v2 != v3)
  {
    v4 = v2 - 1;
    v5 = a2[3];
    v6 = v3 - 1 - v4;
    v7 = a2[4] + 24 * v4 + 8;
    do
    {
      *(_QWORD *)(v7 - 8) = v5;
      *(_QWORD *)v7 = v5;
      *(_BYTE *)(v7 + 8) = 0;
      v7 += 24;
      --v6;
    }
    while (v6);
  }
  return result;
}

void sub_10000E3B8()
{
  operator delete();
}

uint64_t sub_10000E3CC(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -991;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

_QWORD *sub_10000E3E0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = off_1000149A0;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = off_100014520;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  return a1;
}

void sub_10000E448(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = off_1000149A0;
  v2 = a1[2];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  *a1 = off_100014520;
  v3 = a1[1];
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  operator delete();
}

void sub_10000E4C0(uint64_t a1, _DWORD *a2)
{
  *a2 = -992;
}

uint64_t sub_10000E4CC(uint64_t result, int a2, uint64_t a3)
{
  uint64_t v3;

  *(_DWORD *)a3 = -994;
  v3 = 8;
  if (a2)
    v3 = 16;
  *(_QWORD *)(a3 + 80) = *(_QWORD *)(result + v3);
  return result;
}

void sub_10000E4F4()
{
  operator delete();
}

uint64_t sub_10000E508(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = -994;
  *(_QWORD *)(a2 + 80) = *(_QWORD *)(result + 8);
  return result;
}

void sub_10000E51C()
{
  std::regex_error *exception;

  exception = (std::regex_error *)__cxa_allocate_exception(0x18uLL);
  std::regex_error::regex_error(exception, __re_err_empty);
}

void sub_10000E554(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *sub_10000E568(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v6;

  if (a2 == a3)
    return a2;
  v6 = sub_10000E5F0(a1, a2, a3);
  if (v6 == a2)
    return a2;
  else
    return sub_10000E6FC(a1, v6, a3);
}

_BYTE *sub_10000E5F0(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  _BYTE *v6;
  _BYTE *v7;
  int v8;
  uint64_t v9;
  _BYTE *v10;
  int v12;
  uint64_t v13;

  v6 = sub_10000E89C(a1, a2, a3);
  v7 = v6;
  if (v6 == a2 && v6 != a3)
  {
    if (a2 + 1 == a3 || *a2 != 92)
    {
      return a2;
    }
    else
    {
      v8 = a2[1];
      if (v8 == 40)
      {
        v9 = (uint64_t)(a2 + 2);
        sub_1000097FC(a1);
        do
        {
          v10 = (_BYTE *)v9;
          v9 = sub_10000E568(a1, v9, a3);
        }
        while ((_BYTE *)v9 != v10);
        if (v10 == a3 || v10 + 1 == a3 || *v10 != 92 || v10[1] != 41)
          sub_100008078();
        v7 = v10 + 2;
        sub_100009870(a1);
      }
      else
      {
        v12 = sub_10000EB04(a1, v8);
        v13 = 2;
        if (!v12)
          v13 = 0;
        return &a2[v13];
      }
    }
  }
  return v7;
}

unsigned __int8 *sub_10000E6FC(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v4;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  int v9;
  unsigned __int8 *v10;
  int v12;
  int v13;

  if (a2 != a3)
  {
    v4 = *a2;
    if (v4 == 42)
      sub_10000DE40();
    if (a2 + 1 != a3 && v4 == 92 && a2[1] == 123)
    {
      v6 = a2 + 2;
      v13 = 0;
      v7 = sub_10000DF88(a1, a2 + 2, a3, &v13);
      if (v7 == v6)
        goto LABEL_16;
      if (v7 != a3)
      {
        v8 = v7 + 1;
        v9 = *v7;
        if (v9 == 44)
        {
          v12 = -1;
          v10 = sub_10000DF88(a1, v8, a3, &v12);
          if (v10 != a3 && v10 + 1 != a3 && *v10 == 92 && v10[1] == 125)
          {
            if (v12 != -1 && v12 < v13)
LABEL_16:
              sub_10000E024();
LABEL_20:
            sub_10000DE40();
          }
        }
        else if (v8 != a3 && v9 == 92 && *v8 == 125)
        {
          goto LABEL_20;
        }
      }
      sub_10000E070();
    }
  }
  return a2;
}

_BYTE *sub_10000E89C(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  int v6;
  _BYTE *result;

  if (a2 == a3)
  {
    result = sub_10000E9B4(a1, a2, a3);
    if (result != a2)
      return result;
    return sub_1000096EC(a1, a2, a3);
  }
  v6 = *a2;
  if ((a2 + 1 != a3 || v6 != 36)
    && ((v6 - 46) > 0x2E || ((1 << (v6 - 46)) & 0x600000000001) == 0))
  {
    sub_100009FD8(a1);
  }
  result = sub_10000E9B4(a1, a2, a3);
  if (result == a2)
  {
    if (*a2 == 46)
      operator new();
    return sub_1000096EC(a1, a2, a3);
  }
  return result;
}

_BYTE *sub_10000E9B4(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  if (a2 != a3
    && a2 + 1 != a3
    && *a2 == 92
    && ((char)a2[1] - 36) <= 0x3A
    && ((1 << (a2[1] - 36)) & 0x580000000000441) != 0)
  {
    sub_100009FD8(a1);
  }
  return a2;
}

_QWORD *sub_10000EA2C(_QWORD *a1)
{
  uint64_t v2;

  *a1 = off_100014520;
  v2 = a1[1];
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  return a1;
}

void sub_10000EA70(_QWORD *a1)
{
  uint64_t v1;

  *a1 = off_100014520;
  v1 = a1[1];
  if (v1)
    (*(void (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
  operator delete();
}

uint64_t sub_10000EAC4(uint64_t result, uint64_t a2)
{
  _BYTE *v2;
  uint64_t v3;

  v2 = *(_BYTE **)(a2 + 16);
  if (v2 == *(_BYTE **)(a2 + 24) || !*v2)
  {
    v3 = 0;
    *(_DWORD *)a2 = -993;
  }
  else
  {
    *(_DWORD *)a2 = -995;
    *(_QWORD *)(a2 + 16) = v2 + 1;
    v3 = *(_QWORD *)(result + 8);
  }
  *(_QWORD *)(a2 + 80) = v3;
  return result;
}

uint64_t sub_10000EB04(uint64_t a1, unsigned __int8 a2)
{
  if (((a2 & 0xF8) == 0x30 || (a2 & 0xFE) == 0x38) && a2 - 49 <= 8)
  {
    if (a2 - 48 <= *(_DWORD *)(a1 + 28))
      sub_10000A148(a1);
    sub_10000A0FC();
  }
  return 0;
}

unsigned __int8 *sub_10000EB60(uint64_t a1, char *a2, char *a3)
{
  unsigned __int8 *v6;
  unsigned __int8 *v7;

  v6 = sub_10000EBBC(a1, a2, a3);
  if (v6 == (unsigned __int8 *)a2)
    sub_10000E51C();
  do
  {
    v7 = v6;
    v6 = sub_10000EBBC(a1, (char *)v6, a3);
  }
  while (v6 != v7);
  return v7;
}

unsigned __int8 *sub_10000EBBC(uint64_t a1, char *a2, char *a3)
{
  char *v6;
  unsigned __int8 *v7;
  int v8;
  char *v9;
  char *v10;

  v6 = sub_10000ED6C(a1, a2, a3);
  v7 = (unsigned __int8 *)v6;
  if (v6 == a2 && v6 != a3)
  {
    v8 = *a2;
    if (v8 == 36)
      operator new();
    if (v8 != 40)
    {
      if (v8 == 94)
        operator new();
      return (unsigned __int8 *)a2;
    }
    sub_1000097FC(a1);
    ++*(_DWORD *)(a1 + 36);
    v9 = (char *)sub_100006FDC(a1, a2 + 1, a3);
    if (v9 == a3 || (v10 = v9, *v9 != 41))
      sub_100008078();
    sub_100009870(a1);
    --*(_DWORD *)(a1 + 36);
    v7 = (unsigned __int8 *)(v10 + 1);
  }
  if (v7 != (unsigned __int8 *)a2)
    return sub_100007C50(a1, v7, (unsigned __int8 *)a3);
  return (unsigned __int8 *)a2;
}

char *sub_10000ED6C(uint64_t a1, char *a2, char *a3)
{
  char *result;

  result = sub_10000EE34(a1, a2, a3);
  if (result == a2)
  {
    result = sub_10000EEBC(a1, a2, a3);
    if (result == a2)
    {
      if (a2 != a3 && *a2 == 46)
        operator new();
      return sub_1000096EC(a1, a2, a3);
    }
  }
  return result;
}

char *sub_10000EE34(uint64_t a1, char *a2, char *a3)
{
  int v3;
  uint64_t v4;

  if (a2 != a3)
  {
    v3 = *a2;
    v4 = (v3 - 36);
    if (v4 > 0x3A)
      goto LABEL_8;
    if (((1 << (v3 - 36)) & 0x5800000080004D1) != 0)
      return a2;
    if (v4 == 5)
    {
      if (*(_DWORD *)(a1 + 36))
        return a2;
    }
    else
    {
LABEL_8:
      if ((v3 - 123) < 2)
        return a2;
    }
    sub_100009FD8(a1);
  }
  return a2;
}

char *sub_10000EEBC(uint64_t a1, char *a2, char *a3)
{
  char *v3;
  unsigned __int8 *v4;
  int v5;
  BOOL v6;
  int v8;
  uint64_t v9;

  v3 = a2;
  if (a2 == a3)
    return v3;
  v4 = (unsigned __int8 *)(a2 + 1);
  if (v3 + 1 == a3 || *v3 != 92)
    return v3;
  v5 = (char)*v4;
  v6 = (v5 - 36) > 0x3A || ((1 << (*v4 - 36)) & 0x5800000080004F1) == 0;
  if (!v6 || (v5 - 123) < 3)
    sub_100009FD8(a1);
  if ((*(_DWORD *)(a1 + 24) & 0x1F0) != 0x40)
  {
    v8 = sub_10000EB04(a1, *v4);
    v9 = 2;
    if (!v8)
      v9 = 0;
    v3 += v9;
    return v3;
  }
  return sub_10000C6A4(a1, (char *)v4, a3, 0);
}

uint64_t sub_10000EF80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  __int16 v5;
  int v9;
  uint64_t result;
  void *__p[2];
  _BYTE v12[25];
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;

  v5 = a5;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  *(_OWORD *)__p = 0u;
  memset(v12, 0, sizeof(v12));
  v9 = sub_10000F074(a4, a1, a2, (uint64_t)__p, a5 | 0x1040u);
  sub_10000F24C(a3, a1, a2, (uint64_t *)__p, (v5 & 0x800) != 0);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (!v9)
    return 0;
  if (!*(_BYTE *)(a3 + 88))
    return 1;
  result = 0;
  *(_QWORD *)(a3 + 8) = *(_QWORD *)a3;
  return result;
}

void sub_10000F058(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000F074(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  if ((a5 & 0x80) != 0)
    v9 = a5 & 0xFFA;
  else
    v9 = a5;
  sub_10000876C(a4, *(_DWORD *)(a1 + 28) + 1, a2, a3, (unsigned __int16)(v9 & 0x800) >> 11);
  if (sub_10000F3D8(a1, a2, a3, (uint64_t *)a4, v9, (v9 & 0x800) == 0))
  {
    if (*(_QWORD *)(a4 + 8) == *(_QWORD *)a4)
      v10 = (uint64_t *)(a4 + 24);
    else
      v10 = *(uint64_t **)a4;
LABEL_8:
    v11 = *v10;
    *(_QWORD *)(a4 + 56) = *v10;
    *(_BYTE *)(a4 + 64) = *(_QWORD *)(a4 + 48) != v11;
    v12 = v10[1];
    *(_QWORD *)(a4 + 72) = v12;
    *(_BYTE *)(a4 + 88) = v12 != *(_QWORD *)(a4 + 80);
    return 1;
  }
  if (a2 != a3 && (v9 & 0x40) == 0)
  {
    v14 = v9 | 0x80;
    v15 = a2 + 1;
    if (v15 != a3)
    {
      while (1)
      {
        sub_100008BC4((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 3), (__int128 *)(a4 + 24));
        v16 = sub_10000F3D8(a1, v15, a3, (uint64_t *)a4, v14, 0);
        v18 = *(_QWORD *)a4;
        v17 = *(_QWORD *)(a4 + 8);
        if (v16)
          break;
        sub_100008BC4((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((v17 - v18) >> 3), (__int128 *)(a4 + 24));
        if (++v15 == a3)
          goto LABEL_14;
      }
      if (v17 == v18)
        v10 = (uint64_t *)(a4 + 24);
      else
        v10 = *(uint64_t **)a4;
      goto LABEL_8;
    }
LABEL_14:
    sub_100008BC4((char **)a4, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a4 + 8) - *(_QWORD *)a4) >> 3), (__int128 *)(a4 + 24));
    if (sub_10000F3D8(a1, a3, a3, (uint64_t *)a4, v14, 0))
    {
      if (*(_QWORD *)(a4 + 8) == *(_QWORD *)a4)
        v10 = (uint64_t *)(a4 + 24);
      else
        v10 = *(uint64_t **)a4;
      goto LABEL_8;
    }
  }
  result = 0;
  *(_QWORD *)(a4 + 8) = *(_QWORD *)a4;
  return result;
}

void sub_10000F24C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;

  v10 = a4[6];
  sub_100011088(a1, 0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3));
  v11 = *(_QWORD *)a1;
  if (*(_QWORD *)(a1 + 8) != *(_QWORD *)a1)
  {
    v12 = 0;
    v13 = 0;
    v15 = *a4;
    v14 = a4[1];
    do
    {
      v16 = 0xAAAAAAAAAAAAAAABLL * ((v14 - v15) >> 3);
      v17 = (_QWORD *)(v15 + v12);
      if (v16 <= v13)
        v18 = a4 + 3;
      else
        v18 = v17;
      *(_QWORD *)(v11 + v12) = a2 + *v18 - v10;
      if (0xAAAAAAAAAAAAAAABLL * ((a4[1] - *a4) >> 3) <= v13)
        v19 = a4 + 3;
      else
        v19 = (uint64_t *)(*a4 + v12);
      *(_QWORD *)(*(_QWORD *)a1 + v12 + 8) = a2 + v19[1] - v10;
      v15 = *a4;
      v14 = a4[1];
      if (0xAAAAAAAAAAAAAAABLL * ((v14 - *a4) >> 3) <= v13)
        v20 = a4 + 3;
      else
        v20 = (uint64_t *)(*a4 + v12);
      v21 = *((_BYTE *)v20 + 16);
      v11 = *(_QWORD *)a1;
      v22 = *(_QWORD *)(a1 + 8);
      *(_BYTE *)(*(_QWORD *)a1 + v12 + 16) = v21;
      ++v13;
      v12 += 24;
    }
    while (v13 < 0xAAAAAAAAAAAAAAABLL * ((v22 - v11) >> 3));
  }
  *(_QWORD *)(a1 + 24) = a3;
  *(_QWORD *)(a1 + 32) = a3;
  *(_BYTE *)(a1 + 40) = 0;
  v23 = a2 + a4[6] - v10;
  *(_QWORD *)(a1 + 48) = v23;
  *(_QWORD *)(a1 + 56) = a2 + a4[7] - v10;
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a4 + 64);
  *(_QWORD *)(a1 + 72) = a2 + a4[9] - v10;
  *(_QWORD *)(a1 + 80) = a2 + a4[10] - v10;
  *(_BYTE *)(a1 + 88) = *((_BYTE *)a4 + 88);
  if ((a5 & 1) == 0)
    *(_QWORD *)(a1 + 104) = v23;
  *(_BYTE *)(a1 + 96) = *((_BYTE *)a4 + 96);
}

uint64_t sub_10000F3D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  if ((*(_WORD *)(a1 + 24) & 0x1F0) == 0)
    return sub_1000087DC(a1, a2, a3, a4, a5, a6);
  if (*(_DWORD *)(a1 + 28))
    return sub_10000F918(a1, a2, a3, a4, a5, a6);
  return sub_10000F3F8(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_10000F3F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  BOOL v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  void **v39;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  unint64_t v43;
  _QWORD *v44;
  __int128 v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  _BYTE v57[40];
  __int128 v58;
  void *__p[2];
  _QWORD v60[3];
  __int128 v61;
  __int128 v62;
  __int128 v63;

  v62 = 0u;
  v63 = 0u;
  v61 = 0u;
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    *(_DWORD *)v57 = 0;
    memset(&v57[8], 0, 32);
    v58 = 0uLL;
    *(_OWORD *)__p = 0uLL;
    memset(v60, 0, 21);
    sub_10000FE60(&v61, (uint64_t)v57);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    v51 = a4;
    if (*(_QWORD *)&v57[32])
    {
      *(_QWORD *)&v58 = *(_QWORD *)&v57[32];
      operator delete(*(void **)&v57[32]);
    }
    v12 = *((_QWORD *)&v61 + 1);
    v13 = *((_QWORD *)&v63 + 1) + v63 - 1;
    v14 = v13 / 0x2A;
    v15 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (v13 / 0x2A));
    v16 = 3 * (v13 % 0x2A);
    v17 = v15 + 32 * v16;
    *(_DWORD *)v17 = 0;
    *(_QWORD *)(v17 + 8) = a2;
    *(_QWORD *)(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 16) = a2;
    *(_QWORD *)(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 24) = a3;
    sub_100008E48(*(_QWORD *)(v12 + 8 * v14) + 32 * v16 + 56, *(unsigned int *)(a1 + 32));
    v55 = 0;
    v18 = 0;
    v53 = 0;
    v54 = a2;
    v19 = *((_QWORD *)&v63 + 1);
    v20 = *((_QWORD *)&v61 + 1);
    v21 = *((_QWORD *)&v63 + 1) + v63 - 1;
    v22 = v21 / 0x2A;
    v23 = 3 * (v21 % 0x2A);
    *(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * v22) + 32 * v23 + 80) = v6;
    v24 = *(_QWORD *)(v20 + 8 * v22) + 32 * v23;
    v25 = a3 - a2;
    *(_DWORD *)(v24 + 88) = a5;
    *(_BYTE *)(v24 + 92) = a6;
    v52 = a3;
    while (2)
    {
      if ((++v18 & 0xFFF) == 0 && (int)(v18 >> 12) >= (int)v25)
        sub_100008E78();
      v27 = v19 + v63 - 1;
      v28 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (v27 / 0x2A));
      v29 = v27 % 0x2A;
      v30 = v28 + 96 * (v27 % 0x2A);
      v32 = (_QWORD *)(v30 + 80);
      v31 = *(_QWORD *)(v30 + 80);
      if (v31)
        (*(void (**)(uint64_t, unint64_t))(*(_QWORD *)v31 + 16))(v31, v28 + 96 * v29);
      switch(*(_DWORD *)v30)
      {
        case 0xFFFFFC18:
          v33 = *(_QWORD *)(v28 + 96 * v29 + 16);
          v35 = (a5 & 0x1000) == 0 || v33 == v52;
          v36 = v33 != v54 || (a5 & 0x20) == 0;
          if (!v36 || !v35)
            goto LABEL_37;
          v37 = v33 - *(_QWORD *)(v28 + 96 * v29 + 8);
          v38 = v53;
          if ((v55 & (v53 >= v37)) == 0)
            v38 = v37;
          if (v38 != v25)
          {
            v53 = v38;
            sub_10000FF60(&v61);
            v55 = 1;
            goto LABEL_38;
          }
          v39 = (void **)*((_QWORD *)&v61 + 1);
          v40 = v62;
          if ((_QWORD)v62 == *((_QWORD *)&v61 + 1))
          {
            v40 = *((_QWORD *)&v61 + 1);
          }
          else
          {
            v41 = (_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * ((unint64_t)v63 / 0x2A));
            v42 = (_QWORD *)(*v41 + 96 * ((unint64_t)v63 % 0x2A));
            v43 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * ((*((_QWORD *)&v63 + 1) + (_QWORD)v63) / 0x2AuLL))
                + 96 * ((*((_QWORD *)&v63 + 1) + (_QWORD)v63) % 0x2AuLL);
            if (v42 != (_QWORD *)v43)
            {
              do
              {
                sub_1000091A0(v42);
                v42 += 12;
                if ((_QWORD *)((char *)v42 - *v41) == (_QWORD *)4032)
                {
                  v44 = (_QWORD *)v41[1];
                  ++v41;
                  v42 = v44;
                }
              }
              while (v42 != (_QWORD *)v43);
              v39 = (void **)*((_QWORD *)&v61 + 1);
              v40 = v62;
            }
          }
          *((_QWORD *)&v63 + 1) = 0;
          v47 = v40 - (_QWORD)v39;
          if (v47 >= 0x11)
          {
            do
            {
              operator delete(*v39);
              v39 = (void **)(*((_QWORD *)&v61 + 1) + 8);
              *((_QWORD *)&v61 + 1) = v39;
              v47 = v62 - (_QWORD)v39;
            }
            while ((_QWORD)v62 - (_QWORD)v39 > 0x10uLL);
          }
          if (v47 >> 3 == 1)
          {
            v48 = 21;
          }
          else
          {
            if (v47 >> 3 != 2)
              goto LABEL_53;
            v48 = 42;
          }
          *(_QWORD *)&v63 = v48;
LABEL_53:
          v55 = 1;
          v53 = v25;
LABEL_38:
          v19 = *((_QWORD *)&v63 + 1);
          if (*((_QWORD *)&v63 + 1))
            continue;
          if ((v55 & 1) != 0)
          {
            v49 = *v51;
            *(_QWORD *)v49 = v54;
            *(_QWORD *)(v49 + 8) = v54 + v53;
            v6 = 1;
            *(_BYTE *)(v49 + 16) = 1;
          }
          else
          {
            v6 = 0;
          }
          break;
        case 0xFFFFFC19:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          goto LABEL_38;
        case 0xFFFFFC1D:
          sub_10000FFD4((uint64_t)&v61, v28 + 96 * v29);
          goto LABEL_37;
        case 0xFFFFFC1F:
LABEL_37:
          sub_10000FF60(&v61);
          goto LABEL_38;
        case 0xFFFFFC20:
          v45 = *(_OWORD *)(v30 + 16);
          *(_OWORD *)v57 = *(_OWORD *)v30;
          *(_OWORD *)&v57[16] = v45;
          v58 = 0uLL;
          *(_QWORD *)&v57[32] = 0;
          sub_1000094B0(&v57[32], *(__int128 **)(v28 + 96 * v29 + 32), *(__int128 **)(v28 + 96 * v29 + 40), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v28 + 96 * v29 + 40) - *(_QWORD *)(v28 + 96 * v29 + 32)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v60[0] = 0;
          sub_10000952C((char *)__p, *(__int128 **)(v28 + 96 * v29 + 56), *(__int128 **)(v28 + 96 * v29 + 64), (uint64_t)(*(_QWORD *)(v28 + 96 * v29 + 64) - *(_QWORD *)(v28 + 96 * v29 + 56)) >> 4);
          v46 = *v32;
          *(_QWORD *)((char *)&v60[1] + 5) = *(_QWORD *)(v30 + 85);
          v60[1] = v46;
          (*(void (**)(_QWORD, uint64_t, unint64_t))(*(_QWORD *)*v32 + 24))(*v32, 1, v28 + 96 * v29);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v60[1] + 24))(v60[1], 0, v57);
          sub_10000FE60(&v61, (uint64_t)v57);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          if (*(_QWORD *)&v57[32])
          {
            *(_QWORD *)&v58 = *(_QWORD *)&v57[32];
            operator delete(*(void **)&v57[32]);
          }
          goto LABEL_38;
        default:
          sub_100008EC4();
      }
      break;
    }
  }
  sub_100010BF4(&v61);
  return v6;
}

void sub_10000F8C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  sub_100010BF4(&a27);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, int a5, char a6)
{
  uint64_t v6;
  _OWORD *v11;
  unsigned int v12;
  uint64_t v13;
  _OWORD *v14;
  BOOL v15;
  uint64_t v16;
  _QWORD *v17;
  _BYTE *v18;
  uint64_t v19;
  _OWORD *v20;
  __int128 v21;
  void *v22;
  _OWORD *v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  void *v29;
  _QWORD *v30;
  uint64_t v31;
  _OWORD *v32;
  uint64_t v33;
  unint64_t v34;
  _BYTE *v35;
  unsigned int v36;
  uint64_t v37;
  char v38;
  uint64_t v40;
  uint64_t v41;
  char v42;
  _BYTE v45[56];
  void *__p[2];
  _QWORD v47[4];
  __int128 v48;
  char v49;
  _BYTE v50[40];
  __int128 v51;
  void *v52[6];
  _OWORD *v53;
  _OWORD *v54;
  unint64_t v55;

  v53 = 0;
  v54 = 0;
  v55 = 0;
  *(_DWORD *)v50 = 0;
  memset(&v50[8], 0, 32);
  v51 = 0u;
  memset(v52, 0, 37);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    *(_QWORD *)&v48 = a3;
    *((_QWORD *)&v48 + 1) = a3;
    v49 = 0;
    *(_DWORD *)v45 = 0;
    memset(&v45[8], 0, 48);
    *(_OWORD *)__p = 0uLL;
    memset(v47, 0, 21);
    v54 = (_OWORD *)sub_100008F10((uint64_t *)&v53, (uint64_t)v45);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (*(_QWORD *)&v45[32])
    {
      *(_QWORD *)&v45[40] = *(_QWORD *)&v45[32];
      operator delete(*(void **)&v45[32]);
    }
    v11 = v54;
    *((_DWORD *)v54 - 24) = 0;
    *((_QWORD *)v11 - 11) = a2;
    *((_QWORD *)v11 - 10) = a2;
    *((_QWORD *)v11 - 9) = a3;
    sub_100008E0C((uint64_t)(v11 - 4), *(unsigned int *)(a1 + 28), &v48);
    sub_100008E48((uint64_t)v54 - 40, *(unsigned int *)(a1 + 32));
    v40 = a3;
    v41 = 0;
    v42 = 0;
    v12 = 0;
    v13 = a3 - a2;
    v14 = v54;
    *((_QWORD *)v54 - 2) = v6;
    *((_DWORD *)v14 - 2) = a5;
    *((_BYTE *)v14 - 4) = a6;
    do
    {
      v15 = (++v12 & 0xFFF) != 0 || (int)(v12 >> 12) < (int)v13;
      if (!v15)
        sub_100008E78();
      v17 = v14 - 1;
      v16 = *((_QWORD *)v14 - 2);
      v18 = v14 - 6;
      if (v16)
        (*(void (**)(uint64_t, _OWORD *))(*(_QWORD *)v16 + 16))(v16, v14 - 6);
      switch(*(_DWORD *)v18)
      {
        case 0xFFFFFC18:
          v19 = *((_QWORD *)v14 - 10);
          if ((a5 & 0x20) != 0 && v19 == a2 || (a5 & 0x1000) != 0 && v19 != v40)
            goto LABEL_19;
          v26 = v19 - *((_QWORD *)v14 - 11);
          v27 = v41;
          if ((v42 & (v41 >= v26)) == 0)
          {
            v28 = *(v14 - 5);
            *(_OWORD *)v50 = *(_OWORD *)v18;
            *(_OWORD *)&v50[16] = v28;
            if (v50 != v18)
            {
              sub_100010D88(&v50[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
              sub_100010F3C(v52, *((uint64_t **)v14 - 5), *((uint64_t **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
            }
            v29 = (void *)*v17;
            *(void **)((char *)&v52[3] + 5) = *(void **)((char *)v14 - 11);
            v52[3] = v29;
            v27 = v26;
          }
          v30 = v54;
          if (v27 == v13)
          {
            v31 = (uint64_t)v53;
            while (v30 != (_QWORD *)v31)
            {
              v30 -= 12;
              sub_1000091A0(v30);
            }
            v54 = (_OWORD *)v31;
            v42 = 1;
            v41 = v13;
          }
          else
          {
            v41 = v27;
            v32 = v54 - 6;
            sub_1000091A0((_QWORD *)v54 - 12);
            v54 = v32;
            v42 = 1;
          }
          break;
        case 0xFFFFFC1D:
        case 0xFFFFFC1E:
        case 0xFFFFFC21:
          break;
        case 0xFFFFFC1F:
LABEL_19:
          v20 = v54 - 6;
          sub_1000091A0((_QWORD *)v54 - 12);
          v54 = v20;
          break;
        case 0xFFFFFC20:
          v21 = *(v14 - 5);
          *(_OWORD *)v45 = *(_OWORD *)v18;
          *(_OWORD *)&v45[16] = v21;
          memset(&v45[32], 0, 24);
          sub_1000094B0(&v45[32], *((__int128 **)v14 - 8), *((__int128 **)v14 - 7), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)v14 - 7) - *((_QWORD *)v14 - 8)) >> 3));
          __p[0] = 0;
          __p[1] = 0;
          v47[0] = 0;
          sub_10000952C((char *)__p, *((__int128 **)v14 - 5), *((__int128 **)v14 - 4), (uint64_t)(*((_QWORD *)v14 - 4) - *((_QWORD *)v14 - 5)) >> 4);
          v22 = (void *)*v17;
          *(_QWORD *)((char *)&v47[1] + 5) = *(_QWORD *)((char *)v14 - 11);
          v47[1] = v22;
          (*(void (**)(_QWORD, uint64_t, _OWORD *))(*(_QWORD *)*v17 + 24))(*v17, 1, v14 - 6);
          (*(void (**)(_QWORD, _QWORD, _BYTE *))(*(_QWORD *)v47[1] + 24))(v47[1], 0, v45);
          v23 = v54;
          if ((unint64_t)v54 >= v55)
          {
            v54 = (_OWORD *)sub_100008F10((uint64_t *)&v53, (uint64_t)v45);
            if (__p[0])
            {
              __p[1] = __p[0];
              operator delete(__p[0]);
            }
          }
          else
          {
            v24 = *(_OWORD *)&v45[16];
            *v54 = *(_OWORD *)v45;
            v23[1] = v24;
            *((_QWORD *)v23 + 4) = 0;
            *((_QWORD *)v23 + 5) = 0;
            *((_QWORD *)v23 + 6) = 0;
            *((_QWORD *)v23 + 7) = 0;
            v23[2] = *(_OWORD *)&v45[32];
            *((_QWORD *)v23 + 6) = *(_QWORD *)&v45[48];
            memset(&v45[32], 0, 24);
            *((_QWORD *)v23 + 8) = 0;
            *((_QWORD *)v23 + 9) = 0;
            *(_OWORD *)((char *)v23 + 56) = *(_OWORD *)__p;
            *((_QWORD *)v23 + 9) = v47[0];
            __p[0] = 0;
            __p[1] = 0;
            v47[0] = 0;
            v25 = v47[1];
            *(_QWORD *)((char *)v23 + 85) = *(_QWORD *)((char *)&v47[1] + 5);
            *((_QWORD *)v23 + 10) = v25;
            v54 = v23 + 6;
          }
          if (*(_QWORD *)&v45[32])
          {
            *(_QWORD *)&v45[40] = *(_QWORD *)&v45[32];
            operator delete(*(void **)&v45[32]);
          }
          break;
        default:
          sub_100008EC4();
      }
      v14 = v54;
    }
    while (v53 != v54);
    if ((v42 & 1) != 0)
    {
      v33 = *a4;
      *(_QWORD *)v33 = a2;
      *(_QWORD *)(v33 + 8) = a2 + v41;
      *(_BYTE *)(v33 + 16) = 1;
      if ((_QWORD)v51 != *(_QWORD *)&v50[32])
      {
        v34 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v51 - *(_QWORD *)&v50[32]) >> 3);
        v35 = (_BYTE *)(*(_QWORD *)&v50[32] + 16);
        v36 = 1;
        do
        {
          v37 = v33 + 24 * v36;
          *(_OWORD *)v37 = *((_OWORD *)v35 - 1);
          v38 = *v35;
          v35 += 24;
          *(_BYTE *)(v37 + 16) = v38;
          v15 = v34 > v36++;
        }
        while (v15);
      }
      v6 = 1;
    }
    else
    {
      v6 = 0;
    }
  }
  if (v52[0])
  {
    v52[1] = v52[0];
    operator delete(v52[0]);
  }
  if (*(_QWORD *)&v50[32])
  {
    *(_QWORD *)&v51 = *(_QWORD *)&v50[32];
    operator delete(*(void **)&v50[32]);
  }
  *(_QWORD *)v50 = &v53;
  sub_1000095DC((void ***)v50);
  return v6;
}

void sub_10000FE00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35)
{
  uint64_t v35;

  sub_100008DCC(&a19);
  sub_100008DCC(&a35);
  a35 = v35 - 120;
  sub_1000095DC((void ***)&a35);
  _Unwind_Resume(a1);
}

__n128 sub_10000FE60(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  __n128 result;
  uint64_t v11;

  v4 = a1[2];
  v5 = a1[1];
  v6 = 42 * ((v4 - v5) >> 3) - 1;
  if (v4 == v5)
    v6 = 0;
  v7 = a1[5] + a1[4];
  if (v6 == v7)
  {
    sub_1000100C4(a1);
    v5 = a1[1];
    v7 = a1[5] + a1[4];
  }
  v8 = *(_QWORD *)(v5 + 8 * (v7 / 0x2A)) + 96 * (v7 % 0x2A);
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v8 = *(_OWORD *)a2;
  *(_OWORD *)(v8 + 16) = v9;
  *(_QWORD *)(v8 + 40) = 0;
  *(_QWORD *)(v8 + 48) = 0;
  *(_QWORD *)(v8 + 32) = 0;
  *(_OWORD *)(v8 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v8 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(v8 + 56) = 0;
  *(_QWORD *)(v8 + 64) = 0;
  *(_QWORD *)(v8 + 72) = 0;
  result = *(__n128 *)(a2 + 56);
  *(__n128 *)(v8 + 56) = result;
  *(_QWORD *)(v8 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v11 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v8 + 85) = *(_QWORD *)(a2 + 85);
  *(_QWORD *)(v8 + 80) = v11;
  ++a1[5];
  return result;
}

uint64_t sub_10000FF60(_QWORD *a1)
{
  unint64_t v2;

  v2 = a1[5] + a1[4] - 1;
  sub_1000091A0((_QWORD *)(*(_QWORD *)(a1[1] + 8 * (v2 / 0x2A)) + 96 * (v2 % 0x2A)));
  --a1[5];
  return sub_100010868(a1, 1);
}

int64x2_t sub_10000FFD4(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  int64x2_t result;

  v4 = *(_QWORD *)(a1 + 32);
  if (!v4)
  {
    sub_1000108DC((void **)a1);
    v4 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(_QWORD *)(a1 + 8);
  v6 = (_QWORD *)(v5 + 8 * (v4 / 0x2A));
  v7 = *v6 + 96 * (v4 % 0x2A);
  if (*(_QWORD *)(a1 + 16) == v5)
    v7 = 0;
  if (v7 == *v6)
    v7 = *(v6 - 1) + 4032;
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v7 - 96) = *(_OWORD *)a2;
  *(_OWORD *)(v7 - 80) = v8;
  *(_QWORD *)(v7 - 56) = 0;
  *(_QWORD *)(v7 - 48) = 0;
  *(_QWORD *)(v7 - 64) = 0;
  *(_OWORD *)(v7 - 64) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(v7 - 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(v7 - 40) = 0;
  *(_QWORD *)(v7 - 32) = 0;
  *(_QWORD *)(v7 - 24) = 0;
  *(_OWORD *)(v7 - 40) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(v7 - 24) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  v9 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(v7 - 11) = *(_QWORD *)(a2 + 85);
  *(_QWORD *)(v7 - 16) = v9;
  result = vaddq_s64(*(int64x2_t *)(a1 + 32), (int64x2_t)xmmword_100012740);
  *(int64x2_t *)(a1 + 32) = result;
  return result;
}

void sub_1000100C4(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x2A;
  v4 = v2 - 42;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)sub_100010834(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0xFC0uLL);
      sub_1000103D8(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0xFC0uLL);
    sub_1000104EC((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)sub_100010834((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = sub_100010834((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0xFC0uLL);
  sub_100010608(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    sub_10001071C((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_10001038C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_1000103D8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;

  v5 = (char *)a1[3];
  v4 = (uint64_t)(a1 + 3);
  v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    v7 = (char *)a1[1];
    v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1)
        v18 = 1;
      else
        v18 = (uint64_t)&v6[-*a1] >> 2;
      v19 = (char *)sub_100010834(v4, v18);
      v21 = &v19[8 * (v18 >> 2)];
      v22 = (uint64_t *)a1[1];
      v6 = v21;
      v23 = a1[2] - (_QWORD)v22;
      if (v23)
      {
        v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        v24 = 8 * (v23 >> 3);
        v25 = &v19[8 * (v18 >> 2)];
        do
        {
          v26 = *v22++;
          *(_QWORD *)v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        v6 = (char *)a1[2];
      }
    }
    else
    {
      v9 = v8 >> 3;
      v10 = v8 >> 3 < -1;
      v11 = (v8 >> 3) + 2;
      if (v10)
        v12 = v11;
      else
        v12 = v9 + 1;
      v13 = -(v12 >> 1);
      v14 = v12 >> 1;
      v15 = &v7[-8 * v14];
      v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        v6 = (char *)a1[1];
      }
      v17 = &v6[8 * v13];
      v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(_QWORD *)v6 = *a2;
  a1[2] += 8;
}

void sub_1000104EC(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = a1 + 24;
    v7 = *(_BYTE **)(a1 + 24);
    v8 = *(_BYTE **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4)
        v12 = 1;
      else
        v12 = (v7 - v4) >> 2;
      v13 = 2 * v12;
      v14 = (char *)sub_100010834(v6, v12);
      v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      v16 = *(uint64_t **)(a1 + 8);
      v17 = v5;
      v18 = *(_QWORD *)(a1 + 16) - (_QWORD)v16;
      if (v18)
      {
        v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        v19 = 8 * (v18 >> 3);
        v20 = v5;
        do
        {
          v21 = *v16++;
          *(_QWORD *)v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      v22 = *(char **)a1;
      *(_QWORD *)a1 = v14;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v17;
      *(_QWORD *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v9 = (v7 - v8) >> 3;
      if (v9 >= -1)
        v10 = v9 + 1;
      else
        v10 = v9 + 2;
      v11 = v10 >> 1;
      v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

void sub_100010608(_QWORD *a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    v5 = (char *)a1[1];
    v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1)
        v16 = 1;
      else
        v16 = (uint64_t)&v4[-*a1] >> 2;
      v17 = (char *)sub_100010834(a1[4], v16);
      v19 = &v17[8 * (v16 >> 2)];
      v20 = (uint64_t *)a1[1];
      v4 = v19;
      v21 = a1[2] - (_QWORD)v20;
      if (v21)
      {
        v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        v22 = 8 * (v21 >> 3);
        v23 = &v17[8 * (v16 >> 2)];
        do
        {
          v24 = *v20++;
          *(_QWORD *)v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        v4 = (char *)a1[2];
      }
    }
    else
    {
      v7 = v6 >> 3;
      v8 = v6 >> 3 < -1;
      v9 = (v6 >> 3) + 2;
      if (v8)
        v10 = v9;
      else
        v10 = v7 + 1;
      v11 = -(v10 >> 1);
      v12 = v10 >> 1;
      v13 = &v5[-8 * v12];
      v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        v4 = (char *)a1[1];
      }
      v15 = &v4[8 * v11];
      v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void sub_10001071C(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = *(_BYTE **)(a1 + 16);
    v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4)
        v11 = 1;
      else
        v11 = (v7 - v4) >> 2;
      v12 = 2 * v11;
      v13 = (char *)sub_100010834(*(_QWORD *)(a1 + 32), v11);
      v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      v15 = *(uint64_t **)(a1 + 8);
      v16 = v5;
      v17 = *(_QWORD *)(a1 + 16) - (_QWORD)v15;
      if (v17)
      {
        v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        v18 = 8 * (v17 >> 3);
        v19 = v5;
        do
        {
          v20 = *v15++;
          *(_QWORD *)v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      v21 = *(char **)a1;
      *(_QWORD *)a1 = v13;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v8 = (v7 - v6) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

void *sub_100010834(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    sub_100006784();
  return operator new(8 * a2);
}

uint64_t sub_100010868(_QWORD *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v7;

  v3 = a1[1];
  v2 = a1[2];
  if (v2 == v3)
    v4 = 0;
  else
    v4 = 42 * ((v2 - v3) >> 3) - 1;
  v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x2A)
    a2 = 1;
  if (v5 < 0x54)
    v7 = a2;
  else
    v7 = 0;
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8;
  }
  return v7 ^ 1u;
}

void sub_1000108DC(void **a1)
{
  _BYTE *v2;
  _BYTE *v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int64_t v21;
  char *v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  char *v37;
  char *v38;
  char *v39;
  uint64_t v40;
  void *v41;
  void *__p;
  char *v43;
  char *v44;
  char *v45;
  _QWORD *v46;

  v2 = a1[1];
  v3 = a1[2];
  v4 = (v3 - v2) >> 3;
  if (v3 == v2)
    v5 = 0;
  else
    v5 = 42 * v4 - 1;
  v6 = (char *)a1[4];
  if (v5 - (unint64_t)&v6[(_QWORD)a1[5]] < 0x2A)
  {
    v7 = (uint64_t)(a1 + 3);
    v8 = a1[3];
    v9 = *a1;
    v10 = v8 - (_BYTE *)*a1;
    if (v4 >= v10 >> 3)
    {
      if (v8 == v9)
        v11 = 1;
      else
        v11 = v10 >> 2;
      v46 = a1 + 3;
      __p = sub_100010834(v7, v11);
      v43 = (char *)__p;
      v44 = (char *)__p;
      v45 = (char *)__p + 8 * v12;
      v41 = operator new(0xFC0uLL);
      sub_100010608(&__p, &v41);
      v13 = (char *)a1[1];
      v14 = v44;
      if (v13 == a1[2])
      {
        v33 = (char *)a1[1];
      }
      else
      {
        do
        {
          if (v14 == v45)
          {
            v15 = v43 - (_BYTE *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p)
                v23 = 1;
              else
                v23 = (v14 - (_BYTE *)__p) >> 2;
              v24 = (char *)sub_100010834((uint64_t)v46, v23);
              v26 = v43;
              v14 = &v24[8 * (v23 >> 2)];
              v27 = v44 - v43;
              if (v44 != v43)
              {
                v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8)];
                v28 = 8 * (v27 >> 3);
                v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  v30 = *(_QWORD *)v26;
                  v26 += 8;
                  *(_QWORD *)v29 = v30;
                  v29 += 8;
                  v28 -= 8;
                }
                while (v28);
              }
              v31 = __p;
              __p = v24;
              v43 = &v24[8 * (v23 >> 2)];
              v44 = v14;
              v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                v14 = v44;
              }
            }
            else
            {
              v16 = v15 >> 3;
              v17 = v15 >> 3 < -1;
              v18 = (v15 >> 3) + 2;
              if (v17)
                v19 = v18;
              else
                v19 = v16 + 1;
              v20 = &v43[-8 * (v19 >> 1)];
              v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                v14 = v43;
              }
              v22 = &v14[-8 * (v19 >> 1)];
              v14 = &v20[v21];
              v43 = v22;
              v44 = &v20[v21];
            }
          }
          v32 = *(_QWORD *)v13;
          v13 += 8;
          *(_QWORD *)v14 = v32;
          v14 = v44 + 8;
          v44 += 8;
        }
        while (v13 != a1[2]);
        v33 = (char *)a1[1];
      }
      v36 = *a1;
      v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      __p = v36;
      v43 = v33;
      v38 = (char *)a1[3];
      v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      v44 = v13;
      v45 = v38;
      if (v14 - v37 == 8)
        v40 = 21;
      else
        v40 = (uint64_t)a1[4] + 42;
      a1[4] = (void *)v40;
      if (v13 != v33)
        v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8];
      if (v36)
        operator delete(v36);
    }
    else
    {
      if (v2 == v9)
      {
        __p = operator new(0xFC0uLL);
        sub_1000103D8(a1, &__p);
        v34 = a1[2];
        __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }
      else
      {
        __p = operator new(0xFC0uLL);
      }
      sub_1000104EC((uint64_t)a1, &__p);
      if ((_BYTE *)a1[2] - (_BYTE *)a1[1] == 8)
        v35 = 21;
      else
        v35 = (uint64_t)a1[4] + 42;
      a1[4] = (void *)v35;
    }
  }
  else
  {
    a1[4] = v6 + 42;
    __p = (void *)*((_QWORD *)v3 - 1);
    a1[2] = v3 - 8;
    sub_1000104EC((uint64_t)a1, &__p);
  }
}

void sub_100010BA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  void *v12;

  operator delete(v12);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t sub_100010BF4(_QWORD *a1)
{
  void **v2;
  void **v3;
  _QWORD *v4;
  unint64_t v5;
  void **v6;
  char *v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;

  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  if (v3 == v2)
  {
    v4 = a1 + 5;
    v3 = (void **)a1[1];
  }
  else
  {
    v4 = a1 + 5;
    v5 = a1[4];
    v6 = &v2[v5 / 0x2A];
    v7 = (char *)*v6 + 96 * (v5 % 0x2A);
    v8 = (unint64_t)v2[(a1[5] + v5) / 0x2A] + 96 * ((a1[5] + v5) % 0x2A);
    if (v7 != (char *)v8)
    {
      do
      {
        sub_1000091A0(v7);
        v7 += 96;
        if (v7 - (_BYTE *)*v6 == 4032)
        {
          v9 = (char *)v6[1];
          ++v6;
          v7 = v9;
        }
      }
      while (v7 != (char *)v8);
      v2 = (void **)a1[1];
      v3 = (void **)a1[2];
    }
  }
  *v4 = 0;
  v10 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = (void **)a1[2];
      v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      v10 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v11 = v10 >> 3;
  if (v11 == 1)
  {
    v12 = 21;
  }
  else
  {
    if (v11 != 2)
      goto LABEL_16;
    v12 = 42;
  }
  a1[4] = v12;
LABEL_16:
  while (v2 != v3)
  {
    v13 = *v2++;
    operator delete(v13);
  }
  return sub_100010D3C((uint64_t)a1);
}

uint64_t sub_100010D3C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != v3)
    *(_QWORD *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  v4 = *(void **)a1;
  if (*(_QWORD *)a1)
    operator delete(v4);
  return a1;
}

char *sub_100010D88(_QWORD *a1, __int128 *a2, __int128 *a3, unint64_t a4)
{
  __int128 *v6;
  uint64_t v8;
  char *result;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  char *v16;
  __int128 v17;
  int64_t v18;
  char *v19;
  unint64_t v20;
  __int128 *v21;
  char *v22;
  char *v23;
  __int128 v24;
  char *v25;
  char *v26;

  v6 = a2;
  v8 = a1[2];
  result = (char *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 3) >= a4)
  {
    v19 = (char *)a1[1];
    v14 = a1 + 1;
    v13 = v19;
    v20 = 0xAAAAAAAAAAAAAAABLL * ((v19 - result) >> 3);
    if (v20 >= a4)
    {
      v25 = result;
      if (a2 != a3)
      {
        v26 = result;
        do
        {
          *(_OWORD *)v26 = *v6;
          v26[16] = *((_BYTE *)v6 + 16);
          v25 += 24;
          v6 = (__int128 *)((char *)v6 + 24);
          v26 += 24;
        }
        while (v6 != a3);
      }
      v18 = v25 - result;
      v13 = result;
    }
    else
    {
      v21 = (__int128 *)((char *)a2 + 24 * v20);
      if (v13 != result)
      {
        do
        {
          *(_OWORD *)result = *v6;
          result[16] = *((_BYTE *)v6 + 16);
          v6 = (__int128 *)((char *)v6 + 24);
          result += 24;
        }
        while (v6 != v21);
      }
      v22 = v13;
      if (v21 != a3)
      {
        v23 = v13;
        do
        {
          v24 = *v21;
          *((_QWORD *)v23 + 2) = *((_QWORD *)v21 + 2);
          *(_OWORD *)v23 = v24;
          v23 += 24;
          v21 = (__int128 *)((char *)v21 + 24);
          v22 += 24;
        }
        while (v21 != a3);
      }
      v18 = v22 - v13;
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 > 0xAAAAAAAAAAAAAAALL)
      sub_10000699C();
    v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 3);
    v11 = 2 * v10;
    if (2 * v10 <= a4)
      v11 = a4;
    if (v10 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v11;
    result = sub_100008D38(a1, v12);
    v15 = (char *)a1[1];
    v14 = a1 + 1;
    v13 = v15;
    v16 = v15;
    if (v6 != a3)
    {
      v16 = v13;
      do
      {
        v17 = *v6;
        *((_QWORD *)v16 + 2) = *((_QWORD *)v6 + 2);
        *(_OWORD *)v16 = v17;
        v16 += 24;
        v6 = (__int128 *)((char *)v6 + 24);
      }
      while (v6 != a3);
    }
    v18 = v16 - v13;
  }
  *v14 = &v13[v18];
  return result;
}

char *sub_100010F3C(_QWORD *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t *v6;
  uint64_t v8;
  char *result;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  char *v15;
  __int128 v16;
  char *v17;
  char *v18;
  unint64_t v19;
  __int128 *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a2;
  v8 = a1[2];
  result = (char *)*a1;
  if (a4 <= (v8 - (uint64_t)result) >> 4)
  {
    v18 = (char *)a1[1];
    v13 = a1 + 1;
    v12 = v18;
    v19 = (v18 - result) >> 4;
    if (v19 >= a4)
    {
      v26 = result;
      if (a2 != a3)
      {
        v27 = result;
        do
        {
          v28 = *v6;
          v29 = v6[1];
          v6 += 2;
          *(_QWORD *)v27 = v28;
          *((_QWORD *)v27 + 1) = v29;
          v27 += 16;
          v26 += 16;
        }
        while (v6 != a3);
      }
      v17 = (char *)(v26 - result);
      v12 = result;
    }
    else
    {
      v20 = (__int128 *)&a2[2 * v19];
      if (v12 != result)
      {
        do
        {
          v21 = *v6;
          v22 = v6[1];
          v6 += 2;
          *(_QWORD *)result = v21;
          *((_QWORD *)result + 1) = v22;
          result += 16;
        }
        while (v6 != (uint64_t *)v20);
      }
      v23 = v12;
      if (v20 != (__int128 *)a3)
      {
        v24 = v12;
        do
        {
          v25 = *v20++;
          *(_OWORD *)v24 = v25;
          v24 += 16;
          v23 += 16;
        }
        while (v20 != (__int128 *)a3);
      }
      v17 = (char *)(v23 - v12);
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if (a4 >> 60)
      sub_10000699C();
    v10 = v8 >> 3;
    if (v8 >> 3 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
      v11 = 0xFFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = sub_10000959C(a1, v11);
    v14 = (char *)a1[1];
    v13 = a1 + 1;
    v12 = v14;
    v15 = v14;
    if (v6 != a3)
    {
      v15 = v12;
      do
      {
        v16 = *(_OWORD *)v6;
        v6 += 2;
        *(_OWORD *)v15 = v16;
        v15 += 16;
      }
      while (v6 != a3);
    }
    v17 = (char *)(v15 - v12);
  }
  *v13 = &v17[(_QWORD)v12];
  return result;
}

void sub_100011088(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3);
  v3 = a2 >= v2;
  v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_1000110C4((void **)a1, v4);
  }
  else if (!v3)
  {
    *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 24 * a2;
  }
}

void sub_1000110C4(void **a1, unint64_t a2)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  _QWORD *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  __int128 v22;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD **)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - (_BYTE *)v7) >> 3) >= a2)
  {
    if (a2)
    {
      v13 = &v7[3 * a2];
      v14 = 24 * a2;
      do
      {
        *v7 = 0;
        v7[1] = 0;
        *((_BYTE *)v7 + 16) = 0;
        v7 += 3;
        v14 -= 24;
      }
      while (v14);
      v7 = v13;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v7 - (_BYTE *)*a1) >> 3);
    v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL)
      sub_10000699C();
    v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - (_BYTE *)*a1) >> 3);
    if (2 * v10 > v9)
      v9 = 2 * v10;
    if (v10 >= 0x555555555555555)
      v11 = 0xAAAAAAAAAAAAAAALL;
    else
      v11 = v9;
    if (v11)
      v12 = (char *)sub_100008D88(v4, v11);
    else
      v12 = 0;
    v15 = &v12[24 * v8];
    v16 = &v15[24 * a2];
    v17 = 24 * a2;
    v18 = v15;
    do
    {
      *(_QWORD *)v18 = 0;
      *((_QWORD *)v18 + 1) = 0;
      v18[16] = 0;
      v18 += 24;
      v17 -= 24;
    }
    while (v17);
    v19 = &v12[24 * v11];
    v21 = (char *)*a1;
    v20 = (char *)a1[1];
    if (v20 != *a1)
    {
      do
      {
        v22 = *(_OWORD *)(v20 - 24);
        *((_QWORD *)v15 - 1) = *((_QWORD *)v20 - 1);
        *(_OWORD *)(v15 - 24) = v22;
        v15 -= 24;
        v20 -= 24;
      }
      while (v20 != v21);
      v20 = (char *)*a1;
    }
    *a1 = v15;
    a1[1] = v16;
    a1[2] = v19;
    if (v20)
      operator delete(v20);
  }
}

std::string *sub_10001122C(std::string *this, char *a2)
{
  char *v3;

  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  v3 = a2 - 1;
  while (*++v3)
    ;
  sub_100011284(this, a2, v3);
  return this;
}

void sub_100011268(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

std::string *sub_100011284(std::string *this, char *a2, char *a3)
{
  char *v4;
  unint64_t v6;
  unint64_t v7;
  std::string::size_type size;
  std::string::size_type v9;
  std::string *v10;
  unint64_t v11;
  void **v12;
  std::string::size_type v13;
  std::string *v14;
  _BYTE *i;
  char v16;
  std::string::size_type v17;
  void *__p[2];
  unsigned __int8 v20;

  v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2)
      return this;
    size = this->__r_.__value_.__l.__size_;
    v11 = this->__r_.__value_.__r.__words[2];
    v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2)
      return this;
    size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    v9 = 22;
    v10 = this;
  }
  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
    }
    v14 = this;
    if ((v6 & 0x80) != 0)
      v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    for (i = (char *)v14 + size; v4 != a3; ++i)
    {
      v16 = *v4++;
      *i = v16;
    }
    *i = 0;
    v17 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      this->__r_.__value_.__l.__size_ = v17;
    else
      *((_BYTE *)&this->__r_.__value_.__s + 23) = v17 & 0x7F;
  }
  else
  {
    sub_10000BB64(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    if ((v20 & 0x80u) == 0)
      v13 = v20;
    else
      v13 = (std::string::size_type)__p[1];
    std::string::append(this, (const std::string::value_type *)v12, v13);
    if ((char)v20 < 0)
      operator delete(__p[0]);
  }
  return this;
}

void sub_1000113DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::string *sub_1000113F8(std::string *this, char *a2)
{
  char *v3;

  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    *this->__r_.__value_.__l.__data_ = 0;
    this->__r_.__value_.__l.__size_ = 0;
  }
  else
  {
    this->__r_.__value_.__s.__data_[0] = 0;
    *((_BYTE *)&this->__r_.__value_.__s + 23) = 0;
  }
  v3 = a2 - 1;
  while (*++v3)
    ;
  sub_100011284(this, a2, v3);
  return this;
}

void (__cdecl ***sub_10001144C(void (__cdecl ***a1)(std::ifstream *__hidden this), uint64_t a2, int a3))(std::ifstream *__hidden this)
{
  _QWORD *v6;
  void (__cdecl **v7)(std::ifstream *__hidden);
  void (__cdecl **v8)(std::ifstream *__hidden);
  std::ios_base *v9;

  v6 = a1 + 2;
  *a1 = v7;
  *(_QWORD *)((char *)*(v7 - 3) + (_QWORD)a1) = v8;
  a1[1] = 0;
  v9 = (std::ios_base *)((char *)*(*a1 - 3) + (_QWORD)a1);
  std::ios_base::init(v9, a1 + 2);
  v9[1].__vftable = 0;
  v9[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf(v6);
  if (!std::filebuf::open(v6, a2, a3 | 8u))
    std::ios_base::clear((std::ios_base *)((char *)*(*a1 - 3) + (_QWORD)a1), *(_DWORD *)((char *)*(*a1 - 3) + (_QWORD)a1 + 32) | 4);
  return a1;
}

void sub_100011520(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  std::istream::~istream(v1, v2 + 8);
  std::ios::~ios(v1 + 424);
  _Unwind_Resume(a1);
}

void sub_100011558(_QWORD *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_1000115B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;

  a10 = 0;
  if (v10)
    sub_100011644((uint64_t)&a10, v10);
  _Unwind_Resume(exception_object);
}

void sub_1000115D8(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

void sub_1000115FC(uint64_t a1)
{
  sub_100011644(a1 + 24, *(_QWORD *)(a1 + 24));
}

uint64_t sub_100011604(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void sub_100011644(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    *(_QWORD *)a2 = off_100014358;
    if (*(char *)(a2 + 79) < 0)
      operator delete(*(void **)(a2 + 56));
    if (*(char *)(a2 + 55) < 0)
      operator delete(*(void **)(a2 + 32));
    *(_QWORD *)a2 = &off_100014338;
    if (*(char *)(a2 + 31) < 0)
      operator delete(*(void **)(a2 + 8));
    operator delete();
  }
}

void sub_1000116C4(_QWORD *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_100011720(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;

  a10 = 0;
  if (v10)
    sub_1000117B0((uint64_t)&a10, v10);
  _Unwind_Resume(exception_object);
}

void sub_100011744(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

void sub_100011768(uint64_t a1)
{
  sub_1000117B0(a1 + 24, *(_QWORD *)(a1 + 24));
}

uint64_t sub_100011770(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void sub_1000117B0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    *(_QWORD *)a2 = &off_100014378;
    if (*(char *)(a2 + 79) < 0)
      operator delete(*(void **)(a2 + 56));
    if (*(char *)(a2 + 55) < 0)
      operator delete(*(void **)(a2 + 32));
    *(_QWORD *)a2 = &off_100014338;
    if (*(char *)(a2 + 31) < 0)
      operator delete(*(void **)(a2 + 8));
    operator delete();
  }
}

_QWORD *sub_100011830(_QWORD *a1, uint64_t a2, uint64_t a3)
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
    if (!sub_100011994(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  std::ostream::sentry::~sentry(v13);
  return a1;
}

void sub_100011938(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  std::ostream::sentry::~sentry(&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x100011918);
}

void sub_100011980(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_100011994(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      sub_10000BCFC(__p, v12, __c);
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

void sub_100011AB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_100011AD0()
{
  std::string __p;

  sub_10001122C(&__p, "/var/db/timezone/tz/");
  sub_100003204((uint64_t)&__p, (uint64_t)&unk_100018000);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return __cxa_atexit((void (*)(void *))sub_10000334C, &unk_100018000, (void *)&_mh_execute_header);
}

void sub_100011B40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_100011B5C(uint64_t a1, void **a2, void **a3)
{
  if (*(char *)(a1 + 63) < 0)
    operator delete(*a2);
  if (*(char *)(a1 + 31) < 0)
    operator delete(*a3);
}

void sub_100011B9C(void *a1)
{
}

void sub_100011BB8(uint64_t a1, __int128 *a2, uint64_t a3, _QWORD *a4)
{
  __int128 v7;

  *a4 = a1 + 23;
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  v7 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v7;
  *((_BYTE *)a2 + 23) = 0;
  *(_BYTE *)a2 = 0;
  if (*(char *)(a3 + 23) < 0)
    operator delete(*(void **)a3);
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

