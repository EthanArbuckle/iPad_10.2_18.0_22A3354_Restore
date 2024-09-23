uint64_t sub_1000015D4(uint64_t result)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v1 = result;
  v2 = *(std::__shared_weak_count **)(result + 8);
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
      return v1;
    }
  }
  return result;
}

void sub_10000163C()
{
  sub_100001650("basic_string");
}

void sub_100001650(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000016A0(exception, a1);
}

void sub_10000168C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1000016A0(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_1000016C4(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void *sub_1000016D4(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_10000163C();
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

_QWORD *sub_100001760(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _QWORD v13[2];
  std::locale v14;

  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  std::ostream::sentry::sentry(v13, a1);
  if (LOBYTE(v13[0]))
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
    if (!sub_1000018CC(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  std::ostream::sentry::~sentry(v13);
  return a1;
}

void sub_100001870(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  std::ostream::sentry::~sentry(&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x100001850);
}

void sub_1000018B8(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_1000018CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  size_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *__b[3];

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
    if ((uint64_t)v12 >= 1)
    {
      memset(__b, 170, sizeof(__b));
      if (v12 >= 0x7FFFFFFFFFFFFFF8)
        sub_10000163C();
      if (v12 >= 0x17)
      {
        v14 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17)
          v14 = v12 | 7;
        v15 = v14 + 1;
        v13 = (void **)operator new(v14 + 1);
        __b[1] = (void *)v12;
        __b[2] = (void *)(v15 | 0x8000000000000000);
        __b[0] = v13;
      }
      else
      {
        HIBYTE(__b[2]) = v12;
        v13 = __b;
      }
      memset(v13, __c, v12);
      *((_BYTE *)v13 + v12) = 0;
      if (SHIBYTE(__b[2]) >= 0)
        v16 = __b;
      else
        v16 = (void **)__b[0];
      v17 = (*(uint64_t (**)(uint64_t, void **, size_t))(*(_QWORD *)v6 + 96))(v6, v16, v12);
      v18 = v17;
      if (SHIBYTE(__b[2]) < 0)
      {
        operator delete(__b[0]);
        if (v18 != v12)
          return 0;
      }
      else if (v17 != v12)
      {
        return 0;
      }
    }
    v19 = a4 - a3;
    if (v19 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v19) == v19)
    {
      *(_QWORD *)(a5 + 24) = 0;
      return v6;
    }
    return 0;
  }
  return v6;
}

void sub_100001A60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_100001A7C()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void TraceCommand::GetTraceProperty(uint64_t *a1@<X0>, const char *a2@<X1>, const char *a3@<X2>, uint64_t a4@<X3>, int64_t a5@<X4>, uint64_t a6@<X8>)
{
  const char *v9;
  const char *v10;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  __int128 v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  const void *v25;
  size_t v26;
  size_t v27;
  __int128 *p_dst;
  uint64_t v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  xpc_object_t v34;
  xpc_object_t v35;
  xpc_object_t value;
  const char *v37;
  xpc_object_t v38;
  __int128 __dst;
  unint64_t v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  xpc_object_t object;

  if (!*a1)
    goto LABEL_13;
  v9 = a3;
  v10 = a2;
  if (a2[23] < 0)
  {
    if (!*((_QWORD *)a2 + 1))
      goto LABEL_13;
  }
  else if (!a2[23])
  {
    goto LABEL_13;
  }
  if (a3[23] < 0)
  {
    if (*((_QWORD *)a3 + 1))
      goto LABEL_8;
LABEL_13:
    *(_DWORD *)a6 = -534716414;
    *(_QWORD *)(a6 + 16) = 0;
    *(_QWORD *)(a6 + 24) = 0;
    *(_QWORD *)(a6 + 8) = 0;
    return;
  }
  if (!a3[23])
    goto LABEL_13;
LABEL_8:
  v12 = xpc_dictionary_create(0, 0, 0);
  if (v12 || (v12 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v12) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v12);
      v13 = v12;
    }
    else
    {
      v13 = xpc_null_create();
    }
  }
  else
  {
    v13 = xpc_null_create();
    v12 = 0;
  }
  xpc_release(v12);
  if (v10[23] < 0)
    v10 = *(const char **)v10;
  v14 = xpc_string_create(v10);
  if (!v14)
    v14 = xpc_null_create();
  xpc_dictionary_set_value(v13, abm::kKeyTraceName, v14);
  v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  if (v9[23] < 0)
    v9 = *(const char **)v9;
  v16 = xpc_string_create(v9);
  if (!v16)
    v16 = xpc_null_create();
  xpc_dictionary_set_value(v13, abm::kKeyTracePropertyName, v16);
  v17 = xpc_null_create();
  xpc_release(v16);
  xpc_release(v17);
  if (a5)
  {
    v18 = xpc_int64_create(a5);
    if (!v18)
      v18 = xpc_null_create();
    xpc_dictionary_set_value(v13, abm::kKeyTimeout, v18);
    v19 = xpc_null_create();
    xpc_release(v18);
    xpc_release(v19);
  }
  object = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v20 = xpc_null_create();
  *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a6 = v21;
  *(_OWORD *)(a6 + 16) = v21;
  v22 = (std::__shared_weak_count *)a1[1];
  v41 = *a1;
  v42 = v22;
  object = v20;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v24 = __ldxr(p_shared_owners);
    while (__stxr(v24 + 1, p_shared_owners));
  }
  v25 = (const void *)abm::kCommandGetTraceProperty;
  v26 = strlen(abm::kCommandGetTraceProperty);
  if (v26 >= 0x7FFFFFFFFFFFFFF8)
    sub_10000163C();
  v27 = v26;
  if (v26 >= 0x17)
  {
    v29 = (v26 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v26 | 7) != 0x17)
      v29 = v26 | 7;
    v30 = v29 + 1;
    p_dst = (__int128 *)operator new(v29 + 1);
    *((_QWORD *)&__dst + 1) = v27;
    v40 = v30 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_38;
  }
  HIBYTE(v40) = v26;
  p_dst = &__dst;
  if (v26)
LABEL_38:
    memmove(p_dst, v25, v27);
  *((_BYTE *)p_dst + v27) = 0;
  abm::client::PerformCommand(&v41, &__dst, v13, &object);
  if (SHIBYTE(v40) < 0)
    operator delete((void *)__dst);
  v31 = v42;
  if (!v42)
    goto LABEL_45;
  v32 = (unint64_t *)&v42->__shared_owners_;
  do
    v33 = __ldaxr(v32);
  while (__stlxr(v33 - 1, v32));
  if (!v33)
  {
    ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
    std::__shared_weak_count::__release_weak(v31);
    v34 = object;
    if (object)
    {
LABEL_49:
      if (xpc_get_type(v34) == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_retain(v34);
        v35 = v34;
      }
      else
      {
        v35 = xpc_null_create();
      }
      goto LABEL_52;
    }
  }
  else
  {
LABEL_45:
    v34 = object;
    if (object)
      goto LABEL_49;
  }
  v34 = xpc_null_create();
  if (v34)
    goto LABEL_49;
  v35 = xpc_null_create();
  v34 = 0;
LABEL_52:
  xpc_release(v34);
  if (!*(_DWORD *)a6 && xpc_get_type(v35) == (xpc_type_t)&_xpc_type_dictionary)
  {
    value = xpc_dictionary_get_value(v35, abm::kKeyTracePropertyValue);
    v38 = value;
    if (value)
      xpc_retain(value);
    else
      v38 = xpc_null_create();
    xpc::dyn_cast_or_default(&__dst, (xpc *)&v38, abm::kUnknown, v37);
    if (*(char *)(a4 + 23) < 0)
      operator delete(*(void **)a4);
    *(_OWORD *)a4 = __dst;
    *(_QWORD *)(a4 + 16) = v40;
    HIBYTE(v40) = 0;
    LOBYTE(__dst) = 0;
    xpc_release(v38);
  }
  xpc_release(v35);
  xpc_release(v13);
}

void sub_100001EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  uint64_t v17;
  void *v18;
  void *v19;

  xpc_release(object);
  xpc_release(v19);
  if (*(char *)(v17 + 31) < 0)
    operator delete(*(void **)(v17 + 8));
  xpc_release(v18);
  _Unwind_Resume(a1);
}

void **sub_100001FC8(void **a1)
{
  void **v2;
  void **v3;
  void *v4;

  v2 = (void **)*a1;
  if (*a1)
  {
    v3 = (void **)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        if (*((char *)v3 - 1) < 0)
          operator delete(*(v3 - 3));
        v3 -= 3;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void sub_100002038()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

char *sub_100002060(char **a1, uint64_t a2)
{
  char *v3;
  char *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  __int128 v12;
  char *v13;
  void **v14;
  char *v16;
  char *v17;
  char *v18;

  v3 = *a1;
  v4 = a1[1];
  v5 = 0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 3);
  v6 = v5 + 1;
  if (v5 + 1 > 0xAAAAAAAAAAAAAAALL)
    sub_100002298();
  if (0x5555555555555556 * ((a1[2] - v3) >> 3) > v6)
    v6 = 0x5555555555555556 * ((a1[2] - v3) >> 3);
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3) >= 0x555555555555555)
    v8 = 0xAAAAAAAAAAAAAAALL;
  else
    v8 = v6;
  if (v8)
  {
    if (v8 > 0xAAAAAAAAAAAAAAALL)
      sub_100002038();
    v9 = (char *)operator new(24 * v8);
  }
  else
  {
    v9 = 0;
  }
  v10 = &v9[24 * v5];
  v16 = v10;
  v17 = v10;
  v18 = &v9[24 * v8];
  if (*(char *)(a2 + 23) < 0)
  {
    sub_1000016D4(v10, *(void **)a2, *(_QWORD *)(a2 + 8));
    v3 = *a1;
    v4 = a1[1];
    v10 = v16;
    v11 = v17 + 24;
    if (v4 == *a1)
    {
LABEL_17:
      v13 = v3;
      goto LABEL_18;
    }
  }
  else
  {
    *(_OWORD *)v10 = *(_OWORD *)a2;
    *((_QWORD *)v10 + 2) = *(_QWORD *)(a2 + 16);
    v11 = v10 + 24;
    if (v4 == v3)
      goto LABEL_17;
  }
  do
  {
    v12 = *(_OWORD *)(v4 - 24);
    *((_QWORD *)v10 - 1) = *((_QWORD *)v4 - 1);
    *(_OWORD *)(v10 - 24) = v12;
    v10 -= 24;
    *((_QWORD *)v4 - 2) = 0;
    *((_QWORD *)v4 - 1) = 0;
    *((_QWORD *)v4 - 3) = 0;
    v4 -= 24;
  }
  while (v4 != v3);
  v13 = *a1;
  v3 = a1[1];
LABEL_18:
  *a1 = v10;
  a1[1] = v11;
  a1[2] = v18;
  if (v3 != v13)
  {
    v14 = (void **)(v3 - 24);
    do
    {
      if (*((char *)v14 + 23) < 0)
        operator delete(*v14);
      v14 -= 3;
    }
    while (v14 + 3 != (void **)v13);
    v3 = v13;
  }
  if (v3)
    operator delete(v3);
  return v11;
}

void sub_100002220(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_100002234((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_100002234(uint64_t a1)
{
  void **v2;
  void **v3;
  void **v5;

  v3 = *(void ***)(a1 + 8);
  v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
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
    while (v5 != v3);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void sub_100002298()
{
  sub_100001650("vector");
}

void sub_1000022AC()
{
  sub_1000022C0("basic_string");
}

void sub_1000022C0(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_100002310(exception, a1);
}

void sub_1000022FC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_100002310(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

_QWORD *sub_100002334(_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len > 0x16)
  {
    if (__len - 0x7FFFFFFFFFFFFFF7 <= 0x800000000000001ELL)
      sub_10000163C();
    v7 = 44;
    if (__len > 0x2C)
      v7 = __len;
    v8 = (v7 | 7) + 1;
    v6 = operator new(v8);
    memcpy(v6, __src, __len);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (__len)
    {
      memmove(__dst, __src, __len);
      v6 = __dst;
    }
  }
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

void **sub_1000023F8(void **a1, void *__src, size_t __len)
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  size_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v13;
  uint64_t v14;

  v6 = (unint64_t)a1[2];
  v7 = v6 & 0x7FFFFFFFFFFFFFFFLL;
  if ((v6 & 0x7FFFFFFFFFFFFFFFLL) > __len)
  {
    v8 = *a1;
    a1[1] = (void *)__len;
    if (__len)
      memmove(v8, __src, __len);
    goto LABEL_12;
  }
  v9 = 0x7FFFFFFFFFFFFFF7;
  if (0x7FFFFFFFFFFFFFF7 - v7 < __len - v7 + 1)
    sub_10000163C();
  v10 = v7 - 1;
  v11 = a1;
  if ((v6 & 0x8000000000000000) == 0)
  {
    if (v10 > 0x3FFFFFFFFFFFFFF2)
      goto LABEL_7;
LABEL_14:
    v13 = 2 * v10;
    if (__len > 2 * v10)
      v13 = __len;
    v14 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17)
      v14 = v13 | 7;
    if (v13 >= 0x17)
      v9 = v14 + 1;
    else
      v9 = 23;
    v8 = operator new(v9);
    if (!__len)
      goto LABEL_9;
    goto LABEL_8;
  }
  v11 = *a1;
  if (v10 <= 0x3FFFFFFFFFFFFFF2)
    goto LABEL_14;
LABEL_7:
  v8 = operator new(0x7FFFFFFFFFFFFFF7uLL);
  if (__len)
LABEL_8:
    memcpy(v8, __src, __len);
LABEL_9:
  if (v10 != 22)
    operator delete(v11);
  a1[1] = (void *)__len;
  a1[2] = (void *)(v9 | 0x8000000000000000);
  *a1 = v8;
LABEL_12:
  *((_BYTE *)v8 + __len) = 0;
  return a1;
}

_QWORD *sub_10000253C(_QWORD *a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v6;
  _QWORD *v7;
  _BYTE *v8;
  int v9;
  char v11;

  v11 = -86;
  std::istream::sentry::sentry(&v11, a1, 1);
  if (!v11)
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
  v6 = 0;
  while (1)
  {
    v7 = *(_QWORD **)((char *)a1 + *(_QWORD *)(*a1 - 24) + 40);
    v8 = (_BYTE *)v7[3];
    if (v8 != (_BYTE *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(_QWORD *))(*v7 + 80))(v7);
    if ((_DWORD)v7 == -1)
      break;
LABEL_9:
    if (v7 == a3)
    {
      v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(_QWORD *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6)
    v9 = 2;
  else
    v9 = 6;
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_100002670(void *a1)
{
  _QWORD *v1;
  uint64_t v2;

  __cxa_begin_catch(a1);
  v2 = *v1;
  *(_DWORD *)((char *)v1 + *(_QWORD *)(*v1 - 24) + 32) |= 1u;
  if ((*((_BYTE *)v1 + *(_QWORD *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x10000263CLL);
  }
  __cxa_rethrow();
}

void sub_1000026B4(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t config::hw::watch(config::hw *this)
{
  ctu::Gestalt *v1;
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  __int128 v13;

  v1 = (ctu::Gestalt *)pthread_mutex_lock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  v2 = off_100020278;
  if (!off_100020278)
  {
    ctu::Gestalt::create_default_global(v1);
    v3 = (std::__shared_weak_count *)*(&off_100020278 + 1);
    off_100020278 = v13;
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    v2 = off_100020278;
  }
  v6 = (std::__shared_weak_count *)*(&off_100020278 + 1);
  if (*(&off_100020278 + 1))
  {
    v7 = (unint64_t *)(*(&off_100020278 + 1) + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 144))(v2);
  v10 = result;
  if (v6)
  {
    v11 = (unint64_t *)&v6->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
      return v10;
    }
  }
  return result;
}

void sub_100002814(_Unwind_Exception *a1)
{
  pthread_mutex_unlock(&ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance);
  _Unwind_Resume(a1);
}

void sub_100002830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_1000015D4((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t sub_100002848(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;

  pthread_mutex_lock((pthread_mutex_t *)a1);
  v2 = *(std::__shared_weak_count **)(a1 + 72);
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)a1);
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
  v5 = *(std::__shared_weak_count **)(a1 + 72);
  if (!v5)
    return a1;
  v6 = (unint64_t *)&v5->__shared_owners_;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  if (v7)
    return a1;
  ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
  std::__shared_weak_count::__release_weak(v5);
  return a1;
}

void sub_100002900(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100002900(a1, *(_QWORD *)a2);
    sub_100002900(a1, *(_QWORD *)(a2 + 8));
    if (*(char *)(a2 + 79) < 0)
    {
      operator delete(*(void **)(a2 + 56));
      if ((*(char *)(a2 + 55) & 0x80000000) == 0)
        goto LABEL_4;
    }
    else if ((*(char *)(a2 + 55) & 0x80000000) == 0)
    {
LABEL_4:
      operator delete((void *)a2);
      return;
    }
    operator delete(*(void **)(a2 + 32));
    operator delete((void *)a2);
  }
}

uint64_t *sub_100002978(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 == result)
    return result;
  while (1)
  {
    v2 = a2[2];
    if (*(_BYTE *)(v2 + 24))
      return result;
    v3 = *(uint64_t **)(v2 + 16);
    v4 = *v3;
    if (*v3 != v2)
      break;
    v7 = v3[1];
    if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
    {
      if (*(uint64_t **)v2 == a2)
      {
        *(_BYTE *)(v2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v11 = *(_QWORD *)(v2 + 8);
        *v3 = v11;
        if (v11)
          goto LABEL_15;
      }
      else
      {
        v9 = *(uint64_t **)(v2 + 8);
        v10 = *v9;
        *(_QWORD *)(v2 + 8) = *v9;
        if (v10)
        {
          *(_QWORD *)(v10 + 16) = v2;
          v3 = *(uint64_t **)(v2 + 16);
        }
        v9[2] = (uint64_t)v3;
        *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8 * (**(_QWORD **)(v2 + 16) != v2)) = v9;
        *v9 = v2;
        *(_QWORD *)(v2 + 16) = v9;
        v3 = (uint64_t *)v9[2];
        v2 = *v3;
        *((_BYTE *)v9 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v11 = *(_QWORD *)(v2 + 8);
        *v3 = v11;
        if (v11)
LABEL_15:
          *(_QWORD *)(v11 + 16) = v3;
      }
      *(_QWORD *)(v2 + 16) = v3[2];
      *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
      *(_QWORD *)(v2 + 8) = v3;
      v3[2] = v2;
      return result;
    }
LABEL_3:
    *(_BYTE *)(v2 + 24) = 1;
    a2 = v3;
    *((_BYTE *)v3 + 24) = v3 == result;
    *v5 = 1;
    if (v3 == result)
      return result;
  }
  if (v4)
  {
    v6 = *(unsigned __int8 *)(v4 + 24);
    v5 = (_BYTE *)(v4 + 24);
    if (!v6)
      goto LABEL_3;
  }
  if (*(uint64_t **)v2 == a2)
  {
    v12 = a2[1];
    *(_QWORD *)v2 = v12;
    if (v12)
    {
      *(_QWORD *)(v12 + 16) = v2;
      v3 = *(uint64_t **)(v2 + 16);
    }
    a2[2] = (uint64_t)v3;
    *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8 * (**(_QWORD **)(v2 + 16) != v2)) = a2;
    a2[1] = v2;
    *(_QWORD *)(v2 + 16) = a2;
    v3 = (uint64_t *)a2[2];
  }
  else
  {
    a2 = (uint64_t *)a2[2];
  }
  *((_BYTE *)a2 + 24) = 1;
  *((_BYTE *)v3 + 24) = 0;
  v13 = (uint64_t *)v3[1];
  v14 = *v13;
  v3[1] = *v13;
  if (v14)
    *(_QWORD *)(v14 + 16) = v3;
  v13[2] = v3[2];
  *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v13;
  *v13 = (uint64_t)v3;
  v3[2] = (uint64_t)v13;
  return result;
}

uint64_t sub_100002B2C()
{
  uint64_t result;

  if ((byte_1000202A8 & 1) == 0)
  {
    byte_1000202A8 = 1;
    return __cxa_atexit((void (*)(void *))sub_100002848, &ctu::Singleton<ctu::Gestalt,ctu::Gestalt,ctu::PthreadMutexGuardPolicy<ctu::Gestalt>>::sInstance, (void *)&_mh_execute_header);
  }
  return result;
}

void sub_100003104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_10000311C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_100003134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_10000314C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_100003164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_100003180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_100003198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_1000031B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_1000031C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_1000031E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_1000031F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_100003210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_100003228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_100003240(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void sub_100003250(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_10000325C(uint64_t a1, uint64_t a2, void *a3)
{
  int v4;
  id v5;

  if (a3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315138;
      v5 = objc_msgSend(objc_msgSend(a3, "localizedDescription"), "UTF8String");
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not open: %s", (uint8_t *)&v4, 0xCu);
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_msgSend(objc_alloc((Class)OSLogEventStream), "initWithSource:", a2);
  }
}

void sub_10000333C(uint64_t a1, void *a2)
{
  void *v4;
  NSString *v5;
  NSString *v6;

  v4 = objc_autoreleasePoolPush();
  if (objc_msgSend(a2, "type") == (id)1024)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ 0x%05llx 0x%llx %d %@(%@):%@ [%@] %@\n"), +[NSDate dateWithTimeInterval:sinceDate:](NSDate, "dateWithTimeInterval:sinceDate:", objc_msgSend(a2, "date"), (double)(uint64_t)objc_msgSend(objc_msgSend(a2, "timeZone"), "secondsFromGMTForDate:", objc_msgSend(a2, "date"))), objc_msgSend(a2, "threadIdentifier"), objc_msgSend(a2, "activityIdentifier"), objc_msgSend(a2, "processIdentifier"), objc_msgSend(a2, "process"), objc_msgSend(a2, "sender"), objc_msgSend(a2, "subsystem"), objc_msgSend(a2, "category"), objc_msgSend(a2, "composedMessage"));
    if (v5)
    {
      v6 = v5;
      objc_msgSend(*(id *)(a1 + 32), "seekToEndOfFile");
      objc_msgSend(*(id *)(a1 + 32), "writeData:", -[NSString dataUsingEncoding:](v6, "dataUsingEncoding:", 4));
    }
  }
  objc_autoreleasePoolPop(v4);
}

void sub_1000034AC(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;

  if (a2 != 5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v4 = 134217984;
    v5 = a2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Invalid oslog stream: reason = %lu", (uint8_t *)&v4, 0xCu);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100003560(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  std::ios_base *v7;
  __int128 v8;

  v4 = a1 + 16;
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + *(_QWORD *)(v5 - 24)) = v6;
  *(_QWORD *)(a1 + 8) = 0;
  v7 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v7, (void *)(a1 + 16));
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  std::streambuf::basic_streambuf(v4);
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 112) = 8;
  if ((__int128 *)(a1 + 80) != a2)
  {
    if (*((char *)a2 + 23) < 0)
    {
      sub_100002334((_QWORD *)(a1 + 80), *(void **)a2, *((_QWORD *)a2 + 1));
    }
    else
    {
      v8 = *a2;
      *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 2);
      *(_OWORD *)(a1 + 80) = v8;
    }
  }
  sub_10000BCA8(v4);
  return a1;
}

void sub_100003668(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  std::istream::~istream(v2, v3 + 8);
  std::ios::~ios(v1);
  _Unwind_Resume(a1);
}

char *sub_1000036BC(char *a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v6;

  if (*((_QWORD *)a1 + 2))
  {
    v2 = *(_QWORD *)a1;
    v3 = (char *)*((_QWORD *)a1 + 1);
    v4 = *(_QWORD *)v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*(_QWORD *)a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    *((_QWORD *)a1 + 2) = 0;
    if (v3 != a1)
    {
      do
      {
        v6 = (char *)*((_QWORD *)v3 + 1);
        if (v3[39] < 0)
          operator delete(*((void **)v3 + 2));
        operator delete(v3);
        v3 = v6;
      }
      while (v6 != a1);
    }
  }
  return a1;
}

uint64_t sub_10000373C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v3 = a1 + 16;
  if (*(char *)(a1 + 103) < 0)
    operator delete(*(void **)(a1 + 80));
  std::streambuf::~streambuf(v3);
  std::ios::~ios(a1 + 120);
  return a1;
}

uint64_t sub_1000037C0(uint64_t a1)
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

double CommandShell::convertCmdArgsToList@<D0>(CommandShell *this@<X0>, const char **a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t i;
  const char *v7;
  size_t v8;
  size_t v9;
  __int128 *p_dst;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  double result;
  _QWORD *v15;
  uint64_t v16;
  __int128 __dst;
  unint64_t v18;

  *a3 = a3;
  a3[1] = a3;
  a3[2] = 0;
  if ((int)this >= 1)
  {
    for (i = this; i; --i)
    {
      v7 = *a2;
      v8 = strlen(*a2);
      if (v8 >= 0x7FFFFFFFFFFFFFF8)
        sub_10000163C();
      v9 = v8;
      if (v8 >= 0x17)
      {
        v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v8 | 7) != 0x17)
          v11 = v8 | 7;
        v12 = v11 + 1;
        p_dst = (__int128 *)operator new(v11 + 1);
        *((_QWORD *)&__dst + 1) = v9;
        v18 = v12 | 0x8000000000000000;
        *(_QWORD *)&__dst = p_dst;
      }
      else
      {
        HIBYTE(v18) = v8;
        p_dst = &__dst;
        if (!v8)
          goto LABEL_11;
      }
      memmove(p_dst, v7, v9);
LABEL_11:
      *((_BYTE *)p_dst + v9) = 0;
      v13 = operator new(0x28uLL);
      result = *(double *)&__dst;
      v13[1] = __dst;
      *((_QWORD *)v13 + 4) = v18;
      v15 = (_QWORD *)a3[1];
      *(_QWORD *)v13 = a3;
      *((_QWORD *)v13 + 1) = v15;
      *v15 = v13;
      v16 = a3[2] + 1;
      a3[1] = v13;
      a3[2] = v16;
      ++a2;
    }
  }
  return result;
}

void sub_10000395C(_Unwind_Exception *a1)
{
  char *v1;

  sub_1000036BC(v1);
  _Unwind_Resume(a1);
}

void sub_100003970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  char *v15;

  if (a15 < 0)
  {
    operator delete(__p);
    sub_1000036BC(v15);
    _Unwind_Resume(a1);
  }
  sub_1000036BC(v15);
  _Unwind_Resume(a1);
}

uint64_t *sub_1000039A8(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  unsigned __int8 *v11;
  unsigned __int8 v12;
  int v13;
  int v14;
  _BYTE *v15;
  size_t v16;
  uint64_t v17;
  size_t v18;
  unint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  _BYTE *v22;
  unsigned __int8 *v23;
  _QWORD *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  const std::locale::facet *v29;
  std::locale v30;
  char v31;

  v31 = -86;
  std::istream::sentry::sentry(&v31, a1, 0);
  if (!v31)
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
  v29 = std::locale::use_facet(&v30, &std::ctype<char>::id);
  std::locale::~locale(&v30);
  v7 = 0;
  v8 = a1 + 5;
  if (v5 >= 1)
    v9 = v6;
  else
    v9 = 0x7FFFFFFFFFFFFFF7;
  while (1)
  {
    v10 = *(_QWORD **)((char *)v8 + *(_QWORD *)(*a1 - 24));
    v11 = (unsigned __int8 *)v10[3];
    if (v11 == (unsigned __int8 *)v10[4])
      break;
    v12 = *v11;
LABEL_16:
    if ((v12 & 0x80) == 0 && (*((_DWORD *)&v29[1].~facet + v12) & 0x4000) != 0)
    {
      v26 = 0;
      goto LABEL_44;
    }
    v14 = *(char *)(a2 + 23);
    if (v14 < 0)
    {
      v17 = *(_QWORD *)(a2 + 16) & 0x7FFFFFFFFFFFFFFFLL;
      v16 = v17 - 1;
      if (*(_QWORD *)(a2 + 8) == v17 - 1)
      {
        if (v17 == 0x7FFFFFFFFFFFFFF8)
          sub_10000163C();
        v15 = *(_BYTE **)a2;
        v18 = 0x7FFFFFFFFFFFFFF7;
        if (v16 <= 0x3FFFFFFFFFFFFFF2)
        {
LABEL_24:
          if (v16 + 1 > 2 * v16)
            v19 = v16 + 1;
          else
            v19 = 2 * v16;
          v20 = (v19 & 0x7FFFFFFFFFFFFFF8) + 8;
          if ((v19 | 7) != 0x17)
            v20 = v19 | 7;
          if (v19 >= 0x17)
            v18 = v20 + 1;
          else
            v18 = 23;
        }
        v21 = operator new(v18);
        v22 = v21;
        if (!v16 || (memmove(v21, v15, v16), v16 != 22))
          operator delete(v15);
        *(_QWORD *)a2 = v22;
        *(_QWORD *)(a2 + 16) = v18 | 0x8000000000000000;
      }
      else
      {
        v22 = *(_BYTE **)a2;
        v16 = *(_QWORD *)(a2 + 8);
      }
      *(_QWORD *)(a2 + 8) = v16 + 1;
      goto LABEL_39;
    }
    if (*(_BYTE *)(a2 + 23) == 22)
    {
      v15 = (_BYTE *)a2;
      v16 = 22;
      goto LABEL_24;
    }
    v16 = *(unsigned __int8 *)(a2 + 23);
    *(_BYTE *)(a2 + 23) = (v14 + 1) & 0x7F;
    v22 = (_BYTE *)a2;
LABEL_39:
    v23 = &v22[v16];
    *v23 = v12;
    v23[1] = 0;
    v24 = *(_QWORD **)((char *)v8 + *(_QWORD *)(*a1 - 24));
    v25 = v24[3];
    if (v25 == v24[4])
      (*(void (**)(_QWORD *))(*v24 + 80))(v24);
    else
      v24[3] = v25 + 1;
    if (v9 == ++v7)
    {
      v26 = 0;
      v27 = *a1;
      *(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 24) = 0;
      goto LABEL_46;
    }
  }
  v13 = (*(uint64_t (**)(_QWORD *))(*v10 + 72))(v10);
  v12 = v13;
  if (v13 != -1)
    goto LABEL_16;
  v26 = 2;
LABEL_44:
  v27 = *a1;
  *(uint64_t *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 24) = 0;
  if (!v7)
    v26 |= 4u;
LABEL_46:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(v27 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(v27 - 24) + 32) | v26);
  return a1;
}

void sub_100003C74(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::locale a11)
{
  __break(1u);
}

void sub_100003CE0(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void sub_100003CF4(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  char *v5;
  _QWORD *v6;
  void *v7;
  int v8;
  void *v9;
  void **v10;
  char *v11;
  _BYTE *v12;
  uint64_t *v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  void *__p[3];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;

  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  v27 = (uint64_t)&v27;
  v28 = &v27;
  v29 = 0;
  v2 = a2[2];
  if (v2)
  {
    do
    {
      memset(__p, 170, sizeof(__p));
      v5 = (char *)*a2;
      if (*(char *)(*a2 + 39) < 0)
      {
        sub_1000016D4(__p, *((void **)v5 + 2), *((_QWORD *)v5 + 3));
        v5 = (char *)*a2;
        v2 = a2[2];
      }
      else
      {
        *(_OWORD *)__p = *((_OWORD *)v5 + 1);
        __p[2] = *((void **)v5 + 4);
      }
      v6 = *(_QWORD **)v5;
      v6[1] = *((_QWORD *)v5 + 1);
      **((_QWORD **)v5 + 1) = v6;
      a2[2] = v2 - 1;
      if (v5[39] < 0)
        operator delete(*((void **)v5 + 2));
      operator delete(v5);
      v7 = (void *)HIBYTE(__p[2]);
      v8 = SHIBYTE(__p[2]);
      v9 = __p[1];
      if (SHIBYTE(__p[2]) < 0)
        v7 = __p[1];
      if (v7 != (void *)2)
        goto LABEL_15;
      v10 = (void **)__p[0];
      if (SHIBYTE(__p[2]) >= 0)
        v10 = __p;
      if (*(_WORD *)v10 == 9766)
      {
        if (v29)
        {
          v14 = *(_QWORD *)(a1 + 8);
          if (v14 >= *(_QWORD *)(a1 + 16))
          {
            v15 = sub_100007C6C((void **)a1, (uint64_t)&v27);
          }
          else
          {
            sub_100007B3C(*(_QWORD **)(a1 + 8), (uint64_t)&v27);
            v15 = (char *)(v14 + 24);
            *(_QWORD *)(a1 + 8) = v14 + 24;
          }
          *(_QWORD *)(a1 + 8) = v15;
          if (v29)
          {
            v16 = v27;
            v17 = v28;
            v18 = *v28;
            *(_QWORD *)(v18 + 8) = *(_QWORD *)(v27 + 8);
            **(_QWORD **)(v16 + 8) = v18;
            v29 = 0;
            if (v17 != &v27)
            {
              do
              {
                v19 = (uint64_t *)v17[1];
                if (*((char *)v17 + 39) < 0)
                  operator delete((void *)v17[2]);
                operator delete(v17);
                v17 = v19;
              }
              while (v19 != &v27);
            }
          }
        }
      }
      else
      {
LABEL_15:
        v11 = (char *)operator new(0x28uLL);
        v12 = v11 + 16;
        *(_QWORD *)v11 = 0;
        *((_QWORD *)v11 + 1) = 0;
        if (v8 < 0)
        {
          sub_1000016D4(v12, __p[0], (unint64_t)v9);
        }
        else
        {
          *(_OWORD *)v12 = *(_OWORD *)__p;
          *((void **)v11 + 4) = __p[2];
        }
        v13 = v28;
        *(_QWORD *)v11 = &v27;
        *((_QWORD *)v11 + 1) = v13;
        *v13 = (uint64_t)v11;
        v28 = (uint64_t *)v11;
        ++v29;
      }
      if (SHIBYTE(__p[2]) < 0)
        operator delete(__p[0]);
      v2 = a2[2];
    }
    while (v2);
    if (v29)
    {
      v20 = *(_QWORD *)(a1 + 8);
      if (v20 >= *(_QWORD *)(a1 + 16))
      {
        v21 = sub_100007C6C((void **)a1, (uint64_t)&v27);
      }
      else
      {
        sub_100007B3C(*(_QWORD **)(a1 + 8), (uint64_t)&v27);
        v21 = (char *)(v20 + 24);
        *(_QWORD *)(a1 + 8) = v20 + 24;
      }
      *(_QWORD *)(a1 + 8) = v21;
      if (v29)
      {
        v22 = v27;
        v23 = v28;
        v24 = *v28;
        *(_QWORD *)(v24 + 8) = *(_QWORD *)(v27 + 8);
        **(_QWORD **)(v22 + 8) = v24;
        v29 = 0;
        if (v23 != &v27)
        {
          do
          {
            v25 = (uint64_t *)v23[1];
            if (*((char *)v23 + 39) < 0)
              operator delete((void *)v23[2]);
            operator delete(v23);
            v23 = v25;
          }
          while (v25 != &v27);
        }
      }
    }
  }
}

void sub_100003FA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  void **v15;

  sub_1000036BC(&a15);
  sub_100004030(v15);
  _Unwind_Resume(a1);
}

void **sub_100004030(void **a1)
{
  char *v2;
  char *v3;
  void *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;

  v2 = (char *)*a1;
  if (*a1)
  {
    v3 = (char *)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        v5 = v3 - 24;
        if (*((_QWORD *)v3 - 1))
        {
          v6 = *((_QWORD *)v3 - 3);
          v7 = (char *)*((_QWORD *)v3 - 2);
          v8 = *(_QWORD *)v7;
          *(_QWORD *)(v8 + 8) = *(_QWORD *)(v6 + 8);
          **(_QWORD **)(v6 + 8) = v8;
          *((_QWORD *)v3 - 1) = 0;
          if (v7 != v5)
          {
            do
            {
              v9 = (char *)*((_QWORD *)v7 + 1);
              if (v7[39] < 0)
                operator delete(*((void **)v7 + 2));
              operator delete(v7);
              v7 = v9;
            }
            while (v9 != v5);
          }
        }
        v3 = v5;
      }
      while (v5 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void CommandShell::~CommandShell(CommandShell *this)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;

  *(_QWORD *)this = off_10001C6F8;
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 8);
  if (!v2)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    v5 = (std::__shared_weak_count *)*((_QWORD *)this + 6);
    if (!v5)
      goto LABEL_11;
  }
  else
  {
LABEL_5:
    v5 = (std::__shared_weak_count *)*((_QWORD *)this + 6);
    if (!v5)
      goto LABEL_11;
  }
  v6 = (unint64_t *)&v5->__shared_owners_;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  if (!v7)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
LABEL_11:
  v8 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
  if (!v8)
    goto LABEL_15;
  v9 = (unint64_t *)&v8->__shared_owners_;
  do
    v10 = __ldaxr(v9);
  while (__stlxr(v10 - 1, v9));
  if (!v10)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
    v11 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (!v11)
      return;
  }
  else
  {
LABEL_15:
    v11 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    if (!v11)
      return;
  }
  v12 = (unint64_t *)&v11->__shared_owners_;
  do
    v13 = __ldaxr(v12);
  while (__stlxr(v13 - 1, v12));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
}

uint64_t CommandShell::run(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t *v31;
  unint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  int v40;
  _QWORD *v41;
  uint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  __int128 v45;
  unint64_t v46;
  _QWORD *v47;
  _BYTE *v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  void **v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  char v58;
  __int128 *v59;
  size_t v60;
  uint64_t *v61;
  int v62;
  uint64_t *v63;
  size_t v64;
  size_t v65;
  int v66;
  int v67;
  const void *v68;
  size_t v69;
  size_t v70;
  int v71;
  _QWORD *v72;
  int v73;
  int v74;
  int v75;
  uint64_t v76;
  void **v77;
  unint64_t v78;
  _QWORD *v79;
  __int128 v80;
  _QWORD *v81;
  _BYTE *v82;
  char v83;
  uint64_t *v84;
  char v85;
  void **v86;
  void *v87;
  _QWORD *v88;
  int v89;
  const void *v90;
  size_t v91;
  size_t v92;
  int v93;
  const void *v94;
  _QWORD *v95;
  const void *v96;
  int v97;
  const void *v98;
  size_t v99;
  size_t v100;
  int v101;
  _BOOL4 v102;
  size_t v103;
  void **v104;
  BOOL v105;
  void **v106;
  uint64_t v107;
  std::__shared_weak_count *v108;
  uint64_t v109;
  unint64_t *v110;
  unint64_t v111;
  std::__shared_weak_count *v112;
  std::__shared_weak_count *v113;
  unint64_t *v114;
  unint64_t v115;
  uint64_t v116;
  std::__shared_weak_count *v117;
  uint64_t v118;
  unint64_t *v119;
  unint64_t v120;
  std::__shared_weak_count *v121;
  uint64_t v122;
  std::__shared_weak_count *v123;
  void **v124;
  uint64_t v125;
  _QWORD *v126;
  __int128 v127;
  _QWORD *v128;
  _BYTE *v129;
  _QWORD *v130;
  _QWORD *v131;
  uint64_t v132;
  _QWORD *v133;
  std::__shared_weak_count *v134;
  unint64_t *v135;
  unint64_t v136;
  void **v137;
  BOOL v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t *v141;
  unint64_t v142;
  std::__shared_weak_count *v143;
  unint64_t *v144;
  unint64_t v145;
  uint64_t v146;
  int v147;
  int v148;
  uint64_t v149;
  void **v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t *v153;
  unint64_t v154;
  std::__shared_weak_count *v155;
  unint64_t *v156;
  unint64_t v157;
  std::__shared_weak_count *v158;
  uint64_t v159;
  int v160;
  __int128 v161;
  std::__shared_weak_count *v162;
  unint64_t *v163;
  unint64_t v164;
  std::__shared_weak_count *v165;
  unint64_t *v166;
  unint64_t v167;
  void **v168;
  uint64_t v169;
  std::__shared_weak_count *v170;
  uint64_t v171;
  unint64_t *p_shared_weak_owners;
  unint64_t v173;
  uint64_t v174;
  const char *v175;
  const char *v176;
  int v177;
  size_t v178;
  _BYTE *v179;
  BOOL v180;
  uint64_t v181;
  unint64_t *v182;
  unint64_t v183;
  std::__shared_weak_count *v184;
  unint64_t *v185;
  unint64_t v186;
  uint64_t v187;
  std::__shared_weak_count *v188;
  uint64_t v189;
  unint64_t *v190;
  unint64_t v191;
  std::__shared_weak_count *v192;
  uint64_t v193;
  std::__shared_weak_count *v194;
  unint64_t *v195;
  unint64_t v196;
  unsigned __int8 v197;
  char *v198;
  size_t v199;
  _BYTE *v200;
  std::__shared_weak_count *v201;
  uint64_t v202;
  uint64_t v203;
  unint64_t *v204;
  unint64_t v205;
  char *locale;
  std::locale::__imp *locale_high;
  char *v208;
  _BYTE *v209;
  unint64_t v210;
  int8x8_t v211;
  __int128 v212;
  int v213;
  _OWORD *v214;
  __int128 v215;
  void **v216;
  void **v217;
  char v218;
  __int128 v219;
  uint64_t v220;
  uint64_t *v221;
  size_t v222;
  __int128 *v223;
  size_t v224;
  uint64_t *v225;
  int v226;
  const void *v227;
  size_t v228;
  size_t v229;
  int v230;
  uint64_t *v231;
  uint64_t *v232;
  uint64_t *v233;
  int v234;
  uint64_t *v235;
  size_t v236;
  size_t v237;
  int v238;
  _BOOL4 v239;
  uint64_t v240;
  _WORD *v241;
  uint64_t v242;
  std::__shared_weak_count *v243;
  uint64_t v244;
  unint64_t *v245;
  unint64_t v246;
  std::__shared_weak_count *v247;
  std::__shared_weak_count *v248;
  unint64_t *v249;
  unint64_t v250;
  std::__shared_weak_count *v251;
  unint64_t *v252;
  unint64_t v253;
  unint64_t *v254;
  unint64_t v255;
  char v256;
  _BYTE *v257;
  uint64_t v258;
  uint64_t v259;
  unint64_t *v260;
  unint64_t v261;
  std::__shared_weak_count *v262;
  unint64_t *v263;
  unint64_t v264;
  uint64_t *v265;
  uint64_t *v266;
  uint64_t *v267;
  __int128 *v268;
  size_t v269;
  uint64_t *v270;
  int v271;
  const void *v272;
  size_t v273;
  size_t v274;
  int v275;
  int v276;
  const void *v277;
  size_t v278;
  size_t v279;
  int v280;
  uint64_t v281;
  __int128 v282;
  std::__shared_weak_count *v283;
  unint64_t *v284;
  unint64_t v285;
  std::__shared_weak_count *v286;
  unint64_t *v287;
  unint64_t v288;
  char v289;
  void **v290;
  uint64_t v291;
  std::__shared_weak_count *v292;
  unint64_t *v293;
  unint64_t v294;
  std::__shared_weak_count *v295;
  unint64_t *v296;
  unint64_t v297;
  uint64_t v298;
  uint64_t v299;
  unint64_t *v300;
  unint64_t v301;
  std::__shared_weak_count *v302;
  unint64_t *v303;
  unint64_t v304;
  std::__shared_weak_count *v305;
  char *v306;
  unint64_t *v307;
  unint64_t v308;
  _QWORD *v309;
  _QWORD *v310;
  uint64_t v311;
  _QWORD *v312;
  _QWORD *v313;
  const std::locale::facet *v314;
  uint64_t v315;
  _QWORD *v316;
  _QWORD *v317;
  int v318;
  char *v319;
  uint64_t v320;
  _QWORD *v321;
  _QWORD *v322;
  _QWORD *v323;
  _QWORD *v324;
  const std::locale::facet *v325;
  uint64_t v326;
  void **v327;
  void **v328;
  int v329;
  int v330;
  _QWORD *v332;
  void **v333;
  uint64_t v334;
  _QWORD *v335;
  _QWORD *v336;
  _QWORD *v337;
  const std::locale::facet *v338;
  uint64_t v339;
  int v340;
  HIST_ENTRY *v341;
  uint64_t *v342;
  uint64_t v343;
  const char *line;
  size_t v345;
  _QWORD *v346;
  const std::locale::facet *v347;
  uint64_t v348;
  unint64_t *v349;
  unint64_t v350;
  void **v351;
  _QWORD **v352;
  uint64_t v353;
  uint64_t *v354;
  uint64_t v355;
  uint64_t v356;
  unint64_t *v357;
  unint64_t v358;
  std::__shared_weak_count *v359;
  int v360;
  unint64_t *v361;
  unint64_t v362;
  void **v363;
  _QWORD **v364;
  uint64_t v365;
  void **v366;
  void **v367;
  uint64_t v368;
  uint64_t v369;
  unint64_t *v370;
  unint64_t v371;
  std::__shared_weak_count *v372;
  unint64_t *v373;
  unint64_t v374;
  uint64_t v375;
  std::string *v376;
  __int128 v377;
  std::string *v378;
  __int128 v379;
  uint64_t v380;
  uint64_t v381;
  unint64_t *v382;
  unint64_t v383;
  std::__shared_weak_count *v384;
  void **v385;
  char *v386;
  char *v387;
  __int128 v388;
  std::ios_base *v389;
  char v390;
  _QWORD *v391;
  _QWORD *v392;
  _BYTE *v393;
  int v394;
  int v395;
  uint64_t v396;
  const std::ios_base *v397;
  std::ios_base::fmtflags fmtflags;
  std::ios_base::fmtflags v399;
  std::ios_base::fmtflags v400;
  const std::locale::facet *v401;
  char v402;
  size_t v403;
  void **v404;
  char *v405;
  _QWORD *v406;
  _BYTE *v407;
  int v408;
  _QWORD *v409;
  char *v410;
  int v411;
  int v412;
  void **v413;
  size_t v414;
  unint64_t v415;
  uint64_t v416;
  void **v417;
  const std::locale::facet *v418;
  char *v419;
  _BYTE *v420;
  char v421;
  int64_t v422;
  char *v423;
  char *v424;
  void *v425;
  char *v426;
  char *v427;
  uint64_t v428;
  unsigned __int8 v429;
  char *v430;
  size_t v431;
  __int128 *v432;
  int v433;
  __int128 v434;
  uint64_t v435;
  uint64_t v436;
  _QWORD *v437;
  _QWORD *v438;
  _BYTE *v439;
  uint64_t v440;
  char *v441;
  _QWORD *v442;
  _BYTE *v443;
  __int128 v444;
  _QWORD *v445;
  _QWORD *v446;
  _QWORD *v447;
  _QWORD *v448;
  char *v449;
  _QWORD *v450;
  void *v451;
  char *v452;
  uint64_t v453;
  char *v454;
  uint64_t v455;
  char *v456;
  uint64_t v457;
  uint64_t *v458;
  uint64_t v459;
  void **v460;
  _QWORD **v461;
  uint64_t v462;
  uint64_t *v463;
  void **v464;
  uint64_t v465;
  uint64_t v466;
  char *v467;
  _QWORD *v468;
  void *v469;
  char *v470;
  uint64_t v471;
  char *v472;
  uint64_t v473;
  char *v474;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t *v487;
  unint64_t v488;
  _QWORD *v489;
  uint64_t *v490;
  int v491;
  uint64_t v492;
  char v493;
  int v494;
  uint64_t v495;
  _QWORD *v496;
  uint64_t v497;
  uint64_t *v498;
  uint64_t v499;
  void *v500[2];
  void *v501;
  void *v502[2];
  void *v503;
  void *v504[2];
  void *v505;
  _QWORD *v506;
  _QWORD *v507;
  uint64_t v508;
  __int128 v509;
  void *v510;
  __int128 v511;
  void *v512;
  __int128 v513;
  void *v514;
  _QWORD *v515;
  _QWORD *v516;
  unint64_t v517;
  void *v518[3];
  void *v519;
  void *v520;
  unint64_t v521;
  __int128 v522;
  uint64_t v523;
  uint64_t v524;
  void *__p;
  uint64_t v526;
  void *v527[4];
  void *v528[4];
  uint64_t v529;
  std::__shared_weak_count *v530;
  __int128 v531;
  uint64_t v532;
  __int128 v533;
  unint64_t v534;
  __int128 v535;
  _OWORD v536[4];
  __int128 v537;
  __int128 v538;
  _OWORD v539[10];
  std::locale v540[4];
  void *v541[4];
  _BYTE __dst[128];
  _OWORD v543[11];

  v3 = a1;
  (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)a1 + 16))(__dst);
  v4 = *(std::__shared_weak_count **)(v3 + 16);
  *(_OWORD *)(v3 + 8) = *(_OWORD *)__dst;
  v487 = (uint64_t *)(v3 + 8);
  *(_QWORD *)&__dst[8] = 0;
  *(_QWORD *)__dst = 0;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  v7 = *(std::__shared_weak_count **)&__dst[8];
  if (*(_QWORD *)&__dst[8])
  {
    v8 = (unint64_t *)(*(_QWORD *)&__dst[8] + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v11 = *(_QWORD *)(v3 + 8);
  v10 = *(_QWORD *)(v3 + 16);
  if (v10)
  {
    v12 = (unint64_t *)(v10 + 16);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  v14 = (std::__shared_weak_count *)qword_1000202B8;
  qword_1000202B0 = v11;
  qword_1000202B8 = v10;
  if (v14)
    std::__shared_weak_count::__release_weak(v14);
  v15 = *v487;
  if (!*v487)
    return v15 & 1;
  v16 = *(_QWORD *)(v3 + 16);
  if (v16)
  {
    v17 = (unint64_t *)(v16 + 8);
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }
  v19 = *(std::__shared_weak_count **)(v3 + 48);
  *(_QWORD *)(v3 + 40) = v15;
  *(_QWORD *)(v3 + 48) = v16;
  if (v19)
  {
    v20 = (unint64_t *)&v19->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
    v15 = *(_QWORD *)(v3 + 40);
    v16 = *(_QWORD *)(v3 + 48);
  }
  if (v16)
  {
    v22 = (unint64_t *)(v16 + 8);
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }
  v24 = *(std::__shared_weak_count **)(v3 + 64);
  *(_QWORD *)(v3 + 56) = v15;
  *(_QWORD *)(v3 + 64) = v16;
  if (v24)
  {
    v25 = (unint64_t *)&v24->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  v27 = *(uint64_t **)a2;
  v28 = **(_QWORD **)a2;
  *(_QWORD *)(v28 + 8) = *(_QWORD *)(*(_QWORD *)a2 + 8);
  *(_QWORD *)v27[1] = v28;
  --*(_QWORD *)(a2 + 16);
  if (*((char *)v27 + 39) < 0)
  {
    operator delete((void *)v27[2]);
    operator delete(v27);
    v492 = *(_QWORD *)(a2 + 16);
    if (!v492)
    {
LABEL_38:
      rl_bind_key(9, (rl_command_func_t *)&rl_complete);
      rl_completion_append_character = 0;
      rl_attempted_completion_function = (CPPFunction *)sub_100007F38;
      v30 = *(_QWORD *)(v3 + 8);
      v29 = *(_QWORD *)(v3 + 16);
      if (v29)
      {
        v31 = (unint64_t *)(v29 + 8);
        do
          v32 = __ldxr(v31);
        while (__stxr(v32 + 1, v31));
      }
      v33 = *(std::__shared_weak_count **)(v3 + 32);
      *(_QWORD *)(v3 + 24) = v30;
      *(_QWORD *)(v3 + 32) = v29;
      if (v33)
      {
        v34 = (unint64_t *)&v33->__shared_owners_;
        do
          v35 = __ldaxr(v34);
        while (__stlxr(v35 - 1, v34));
        if (!v35)
        {
          ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
          std::__shared_weak_count::__release_weak(v33);
        }
      }
    }
  }
  else
  {
    operator delete(v27);
    v492 = *(_QWORD *)(a2 + 16);
    if (!v492)
      goto LABEL_38;
  }
  memset(v527, 170, 24);
  sub_100007B3C(&v524, a2);
  sub_100003CF4((uint64_t)v527, &v524);
  if (v526)
  {
    v36 = (char *)__p;
    v37 = v524;
    v38 = *(_QWORD *)__p;
    *(_QWORD *)(v38 + 8) = *(_QWORD *)(v524 + 8);
    **(_QWORD **)(v37 + 8) = v38;
    v526 = 0;
    if (v36 != (char *)&v524)
    {
      do
      {
        v39 = (char *)*((_QWORD *)v36 + 1);
        if (v36[39] < 0)
          operator delete(*((void **)v36 + 2));
        operator delete(v36);
        v36 = v39;
      }
      while (v39 != (char *)&v524);
    }
  }
  v490 = (uint64_t *)(v3 + 24);
  v522 = 0uLL;
  v523 = 0;
  v491 = 1;
  v495 = v3;
  while (2)
  {
    v41 = v527[0];
    v489 = v527[1];
    if (v527[0] != v527[1])
    {
      v494 = 1;
      do
      {
        v519 = &v519;
        v520 = &v519;
        v521 = 0;
        v42 = v41[1];
        if ((_QWORD *)v42 == v41)
          goto LABEL_679;
        v43 = 0;
        v44 = &v519;
        do
        {
          v47 = operator new(0x28uLL);
          v48 = v47 + 2;
          *v47 = 0;
          v47[1] = 0;
          if (*(char *)(v42 + 39) < 0)
          {
            sub_1000016D4(v48, *(void **)(v42 + 16), *(_QWORD *)(v42 + 24));
            v44 = v519;
            v46 = v521;
          }
          else
          {
            v45 = *(_OWORD *)(v42 + 16);
            v47[4] = *(_QWORD *)(v42 + 32);
            *(_OWORD *)v48 = v45;
            v46 = v43;
          }
          *v47 = v44;
          v47[1] = &v519;
          v44[1] = v47;
          v43 = v46 + 1;
          v519 = v47;
          v521 = v46 + 1;
          v42 = *(_QWORD *)(v42 + 8);
          v44 = v47;
        }
        while ((_QWORD *)v42 != v41);
        v488 = v46;
        v496 = v41;
        if (v46 == -1)
          goto LABEL_679;
        while (2)
        {
          memset(v518, 170, sizeof(v518));
          v49 = (char *)v519;
          if (*((char *)v519 + 39) < 0)
          {
            sub_1000016D4(v518, *((void **)v519 + 2), *((_QWORD *)v519 + 3));
            v49 = (char *)v519;
            v43 = v521;
          }
          else
          {
            *(_OWORD *)v518 = *((_OWORD *)v519 + 1);
            v518[2] = *((void **)v519 + 4);
          }
          v50 = *(_QWORD *)v49;
          *(_QWORD *)(v50 + 8) = *((_QWORD *)v49 + 1);
          **((_QWORD **)v49 + 1) = v50;
          v521 = v43 - 1;
          if (v49[39] < 0)
            operator delete(*((void **)v49 + 2));
          operator delete(v49);
          v51 = v521;
          v52 = (void *)HIBYTE(v518[2]);
          if (SHIBYTE(v518[2]) < 0)
            v52 = v518[1];
          if (v52 == (void *)2)
          {
            v53 = (void **)v518[0];
            if (SHIBYTE(v518[2]) >= 0)
              v53 = v518;
            if (*(_WORD *)v53 == 25699)
            {
              v515 = &v515;
              v516 = &v515;
              v517 = 0;
              v77 = (void **)v520;
              if (v520 == &v519)
              {
                v78 = 0;
                v81 = &v515;
              }
              else
              {
                v78 = 0;
                v79 = &v515;
                do
                {
                  v81 = operator new(0x28uLL);
                  v82 = v81 + 2;
                  *v81 = 0;
                  v81[1] = 0;
                  if (*((char *)v77 + 39) < 0)
                  {
                    sub_1000016D4(v82, v77[2], (unint64_t)v77[3]);
                    v79 = v515;
                    v78 = v517;
                  }
                  else
                  {
                    v80 = *((_OWORD *)v77 + 1);
                    v81[4] = v77[4];
                    *(_OWORD *)v82 = v80;
                  }
                  *v81 = v79;
                  v81[1] = &v515;
                  v79[1] = v81;
                  ++v78;
                  v515 = v81;
                  v517 = v78;
                  v77 = (void **)v77[1];
                  v79 = v81;
                }
                while (v77 != &v519);
                if (v78 >= 2)
                {
                  v83 = 0;
LABEL_610:
                  v309 = v515;
                  v310 = v516;
                  v311 = *v516;
                  *(_QWORD *)(v311 + 8) = v515[1];
                  *(_QWORD *)v309[1] = v311;
                  v517 = 0;
                  if (v310 != &v515)
                  {
                    do
                    {
                      v316 = (_QWORD *)v310[1];
                      if (*((char *)v310 + 39) < 0)
                        operator delete((void *)v310[2]);
                      operator delete(v310);
                      v310 = v316;
                    }
                    while (v316 != &v515);
                  }
                  goto LABEL_611;
                }
              }
              v134 = *(std::__shared_weak_count **)(v3 + 48);
              v529 = *(_QWORD *)(v3 + 40);
              v530 = v134;
              if (v134)
              {
                v135 = (unint64_t *)&v134->__shared_owners_;
                do
                  v136 = __ldxr(v135);
                while (__stxr(v136 + 1, v135));
                v78 = v517;
              }
              if (!v78)
              {
                v140 = *(_QWORD *)(v3 + 8);
                v139 = *(_QWORD *)(v3 + 16);
                if (v139)
                {
                  v141 = (unint64_t *)(v139 + 8);
                  do
                    v142 = __ldxr(v141);
                  while (__stxr(v142 + 1, v141));
                }
                v143 = *(std::__shared_weak_count **)(v3 + 48);
                *(_QWORD *)(v3 + 40) = v140;
                *(_QWORD *)(v3 + 48) = v139;
                if (v143)
                {
                  v144 = (unint64_t *)&v143->__shared_owners_;
                  do
                    v145 = __ldaxr(v144);
                  while (__stlxr(v145 - 1, v144));
                  if (!v145)
                  {
                    ((void (*)(std::__shared_weak_count *))v143->__on_zero_shared)(v143);
                    std::__shared_weak_count::__release_weak(v143);
                  }
                }
                goto LABEL_571;
              }
              memset(v541, 170, 24);
              if (*((char *)v81 + 39) < 0)
              {
                sub_1000016D4(v541, (void *)v81[2], v81[3]);
                v81 = v515;
                v78 = v517;
              }
              else
              {
                *(_OWORD *)v541 = *((_OWORD *)v81 + 1);
                v541[2] = *((void **)v81 + 4);
              }
              v159 = *v81;
              *(_QWORD *)(v159 + 8) = v81[1];
              *(_QWORD *)v81[1] = v159;
              v517 = v78 - 1;
              if (*((char *)v81 + 39) < 0)
                operator delete((void *)v81[2]);
              operator delete(v81);
              memset(v540, 170, 24);
              if (SHIBYTE(v541[2]) < 0)
              {
                sub_1000016D4(v540, v541[0], (unint64_t)v541[1]);
                if (SHIBYTE(v541[2]) < 0)
                {
                  v160 = 1;
                  if (!v541[1])
                    goto LABEL_915;
                }
                else
                {
                  v160 = 0;
                  if (!HIBYTE(v541[2]))
LABEL_915:
                    sub_1000022AC();
                }
              }
              else
              {
                v160 = 0;
                *(_OWORD *)&v540[0].__locale_ = *(_OWORD *)v541;
                v540[2] = (std::locale)v541[2];
                if (!HIBYTE(v541[2]))
                  goto LABEL_915;
              }
              v105 = v160 == 0;
              v168 = v541;
              if (!v105)
                v168 = (void **)v541[0];
              if (*(_BYTE *)v168 != 47)
                goto LABEL_375;
              v169 = *(_QWORD *)(v3 + 40);
              v170 = *(std::__shared_weak_count **)(v169 + 32);
              if (!v170)
              {
                v535 = 0uLL;
                goto LABEL_354;
              }
              v171 = *(_QWORD *)(v169 + 24);
              p_shared_weak_owners = (unint64_t *)&v170->__shared_weak_owners_;
              do
                v173 = __ldxr(p_shared_weak_owners);
              while (__stxr(v173 + 1, p_shared_weak_owners));
              *(_QWORD *)&v535 = 0;
              *((_QWORD *)&v535 + 1) = std::__shared_weak_count::lock(v170);
              if (!*((_QWORD *)&v535 + 1))
              {
                std::__shared_weak_count::__release_weak(v170);
                v197 = HIBYTE(v541[2]);
                if (SHIBYTE(v541[2]) < 0)
                  goto LABEL_359;
LABEL_355:
                v198 = (char *)v541 + 1;
                if (v197)
                {
                  v199 = v197 - 1;
                  if (v199 <= 0x7FFFFFFFFFFFFFF7)
                    goto LABEL_361;
                  goto LABEL_917;
                }
LABEL_916:
                sub_1000022AC();
              }
              *(_QWORD *)&v535 = v171;
              std::__shared_weak_count::__release_weak(v170);
              if (!v171)
              {
LABEL_354:
                v197 = HIBYTE(v541[2]);
                if ((SHIBYTE(v541[2]) & 0x80000000) == 0)
                  goto LABEL_355;
LABEL_359:
                if (v541[1])
                {
                  v198 = (char *)v541[0] + 1;
                  v199 = (size_t)v541[1] - 1;
                  if ((unint64_t)v541[1] - 1 <= 0x7FFFFFFFFFFFFFF7)
                  {
LABEL_361:
                    if (v199 >= 0x17)
                    {
                      v202 = (v199 & 0xFFFFFFFFFFFFFFF8) + 8;
                      if ((v199 | 7) != 0x17)
                        v202 = v199 | 7;
                      v203 = v202 + 1;
                      v200 = operator new(v202 + 1);
                      *(_QWORD *)&__dst[16] = v203 | 0x8000000000000000;
                      *(_QWORD *)__dst = v200;
                      *(_QWORD *)&__dst[8] = v199;
                    }
                    else
                    {
                      __dst[23] = v199;
                      v200 = __dst;
                      if (!v199)
                      {
                        v41 = v496;
                        __dst[0] = 0;
                        if ((SHIBYTE(v540[2].__locale_) & 0x80000000) == 0)
                          goto LABEL_364;
LABEL_370:
                        operator delete(v540[0].__locale_);
                        *(_OWORD *)&v540[0].__locale_ = *(_OWORD *)__dst;
                        v540[2] = *(std::locale *)&__dst[16];
                        v201 = (std::__shared_weak_count *)*((_QWORD *)&v535 + 1);
                        if (*((_QWORD *)&v535 + 1))
                          goto LABEL_371;
                        goto LABEL_375;
                      }
                    }
                    memmove(v200, v198, v199);
                    v41 = v496;
                    v200[v199] = 0;
                    if (SHIBYTE(v540[2].__locale_) < 0)
                      goto LABEL_370;
LABEL_364:
                    *(_OWORD *)&v540[0].__locale_ = *(_OWORD *)__dst;
                    v540[2] = *(std::locale *)&__dst[16];
                    v201 = (std::__shared_weak_count *)*((_QWORD *)&v535 + 1);
                    if (*((_QWORD *)&v535 + 1))
                    {
LABEL_371:
                      v204 = (unint64_t *)&v201->__shared_owners_;
                      do
                        v205 = __ldaxr(v204);
                      while (__stlxr(v205 - 1, v204));
                      if (!v205)
                      {
                        ((void (*)(std::__shared_weak_count *))v201->__on_zero_shared)(v201);
                        std::__shared_weak_count::__release_weak(v201);
                      }
                    }
LABEL_375:
                    v533 = 0uLL;
                    v534 = 0;
                    locale = (char *)v540;
                    if (SHIBYTE(v540[2].__locale_) >= 0)
                    {
                      locale_high = (std::locale::__imp *)HIBYTE(v540[2].__locale_);
                    }
                    else
                    {
                      locale = (char *)v540[0].__locale_;
                      locale_high = v540[1].__locale_;
                    }
                    if (!locale_high)
                      goto LABEL_400;
                    v208 = locale;
                    if ((unint64_t)locale_high < 8)
                      goto LABEL_591;
                    v208 = &locale[(unint64_t)locale_high & 0xFFFFFFFFFFFFFFF8];
                    v209 = locale + 3;
                    v210 = (unint64_t)locale_high & 0xFFFFFFFFFFFFFFF8;
                    while (2)
                    {
                      v211 = vceq_s8(*(int8x8_t *)(v209 - 3), (int8x8_t)0x2F2F2F2F2F2F2F2FLL);
                      if ((v211.i8[0] & 1) != 0)
                      {
                        *(v209 - 3) = 32;
                        if ((v211.i8[1] & 1) == 0)
                          goto LABEL_384;
LABEL_392:
                        *(v209 - 2) = 32;
                        if ((v211.i8[2] & 1) == 0)
                          goto LABEL_393;
LABEL_385:
                        *(v209 - 1) = 32;
                        if ((v211.i8[3] & 1) == 0)
                          goto LABEL_386;
LABEL_394:
                        *v209 = 32;
                        if ((v211.i8[4] & 1) == 0)
                          goto LABEL_395;
LABEL_387:
                        v209[1] = 32;
                        if ((v211.i8[5] & 1) == 0)
                          goto LABEL_388;
LABEL_396:
                        v209[2] = 32;
                        if ((v211.i8[6] & 1) == 0)
                          goto LABEL_397;
LABEL_389:
                        v209[3] = 32;
                        if ((v211.i8[7] & 1) != 0)
                          goto LABEL_398;
                      }
                      else
                      {
                        if ((v211.i8[1] & 1) != 0)
                          goto LABEL_392;
LABEL_384:
                        if ((v211.i8[2] & 1) != 0)
                          goto LABEL_385;
LABEL_393:
                        if ((v211.i8[3] & 1) != 0)
                          goto LABEL_394;
LABEL_386:
                        if ((v211.i8[4] & 1) != 0)
                          goto LABEL_387;
LABEL_395:
                        if ((v211.i8[5] & 1) != 0)
                          goto LABEL_396;
LABEL_388:
                        if ((v211.i8[6] & 1) != 0)
                          goto LABEL_389;
LABEL_397:
                        if ((v211.i8[7] & 1) != 0)
LABEL_398:
                          v209[4] = 32;
                      }
                      v209 += 8;
                      v210 -= 8;
                      if (!v210)
                      {
                        if (locale_high == (std::locale::__imp *)((unint64_t)locale_high & 0xFFFFFFFFFFFFFFF8))
                          goto LABEL_400;
LABEL_591:
                        v306 = (char *)locale_high + (_QWORD)locale;
                        do
                        {
                          if (*v208 == 47)
                            *v208 = 32;
                          ++v208;
                        }
                        while (v208 != v306);
LABEL_400:
                        *(_QWORD *)&v212 = 0xAAAAAAAAAAAAAAAALL;
                        *((_QWORD *)&v212 + 1) = 0xAAAAAAAAAAAAAAAALL;
                        v543[7] = v212;
                        v543[8] = v212;
                        v543[5] = v212;
                        v543[6] = v212;
                        v543[3] = v212;
                        v543[4] = v212;
                        v543[1] = v212;
                        v543[2] = v212;
                        *(_OWORD *)&__dst[112] = v212;
                        v543[0] = v212;
                        *(_OWORD *)&__dst[80] = v212;
                        *(_OWORD *)&__dst[96] = v212;
                        *(_OWORD *)&__dst[48] = v212;
                        *(_OWORD *)&__dst[64] = v212;
                        *(_OWORD *)&__dst[16] = v212;
                        *(_OWORD *)&__dst[32] = v212;
                        *(_OWORD *)__dst = v212;
                        sub_100003560((uint64_t)__dst, (__int128 *)v540);
                        while (2)
                        {
                          v535 = 0uLL;
                          *(_QWORD *)&v536[0] = 0;
                          sub_1000039A8((uint64_t *)__dst, (uint64_t)&v535);
                          v213 = *(_DWORD *)&__dst[*(_QWORD *)(*(_QWORD *)__dst - 24) + 32] & 5;
                          if (v213)
                          {
                            if (SBYTE7(v536[0]) < 0)
                              goto LABEL_410;
                          }
                          else
                          {
                            v214 = (_OWORD *)*((_QWORD *)&v533 + 1);
                            if (*((_QWORD *)&v533 + 1) < v534)
                            {
                              if (SBYTE7(v536[0]) < 0)
                              {
                                sub_1000016D4(*((_BYTE **)&v533 + 1), (void *)v535, *((unint64_t *)&v535 + 1));
                                *((_QWORD *)&v533 + 1) = (char *)v214 + 24;
                                if ((SBYTE7(v536[0]) & 0x80000000) == 0)
                                  goto LABEL_401;
                              }
                              else
                              {
                                v215 = v535;
                                *(_QWORD *)(*((_QWORD *)&v533 + 1) + 16) = *(_QWORD *)&v536[0];
                                *v214 = v215;
                                *((_QWORD *)&v533 + 1) = (char *)v214 + 24;
                                if ((SBYTE7(v536[0]) & 0x80000000) == 0)
                                  goto LABEL_401;
                              }
LABEL_410:
                              operator delete((void *)v535);
                              goto LABEL_401;
                            }
                            *((_QWORD *)&v533 + 1) = sub_100002060((char **)&v533, (uint64_t)&v535);
                            if (SBYTE7(v536[0]) < 0)
                              goto LABEL_410;
                          }
LABEL_401:
                          if (v213)
                          {
                            *(_QWORD *)__dst = v486;
                            *(_QWORD *)&__dst[*(_QWORD *)(v486 - 24)] = v485;
                            if ((__dst[103] & 0x80000000) != 0)
                              operator delete(*(void **)&__dst[80]);
                            std::streambuf::~streambuf(&__dst[16]);
                            std::ios::~ios(&__dst[120]);
                            v216 = (void **)*((_QWORD *)&v533 + 1);
                            v217 = (void **)v533;
                            if ((_QWORD)v533 == *((_QWORD *)&v533 + 1))
                            {
                              v289 = 1;
                              if (!(_QWORD)v533)
                                goto LABEL_598;
LABEL_567:
                              v290 = (void **)*((_QWORD *)&v533 + 1);
                              if (*((void ***)&v533 + 1) == v217)
                              {
                                *((_QWORD *)&v533 + 1) = v217;
                                operator delete(v217);
                                if ((SHIBYTE(v540[2].__locale_) & 0x80000000) == 0)
                                  goto LABEL_599;
                              }
                              else
                              {
                                do
                                {
                                  if (*((char *)v290 - 1) < 0)
                                    operator delete(*(v290 - 3));
                                  v290 -= 3;
                                }
                                while (v290 != v217);
                                *((_QWORD *)&v533 + 1) = v217;
                                operator delete((void *)v533);
                                if ((SHIBYTE(v540[2].__locale_) & 0x80000000) == 0)
                                  goto LABEL_599;
                              }
                              goto LABEL_569;
                            }
                            v493 = 1;
LABEL_422:
                            memset(__dst, 170, 24);
                            if (*((char *)v217 + 23) < 0)
                            {
                              sub_1000016D4(__dst, *v217, (unint64_t)v217[1]);
                            }
                            else
                            {
                              v219 = *(_OWORD *)v217;
                              *(_QWORD *)&__dst[16] = v217[2];
                              *(_OWORD *)__dst = v219;
                            }
                            v220 = *(_QWORD *)(v3 + 40);
                            if ((__dst[23] & 0x80000000) != 0)
                            {
                              sub_1000016D4(&v531, *(void **)__dst, *(unint64_t *)&__dst[8]);
                            }
                            else
                            {
                              v531 = *(_OWORD *)__dst;
                              v532 = *(_QWORD *)&__dst[16];
                            }
                            v221 = *(uint64_t **)(v220 + 168);
                            v222 = HIBYTE(v532);
                            if (!v221)
                              goto LABEL_508;
                            if (v532 >= 0)
                              v223 = &v531;
                            else
                              v223 = (__int128 *)v531;
                            if (v532 >= 0)
                              v224 = HIBYTE(v532);
                            else
                              v224 = *((_QWORD *)&v531 + 1);
                            v225 = (uint64_t *)(v220 + 168);
                            while (1)
                            {
                              v226 = *((char *)v221 + 55);
                              if (v226 >= 0)
                                v227 = v221 + 4;
                              else
                                v227 = (const void *)v221[4];
                              if (v226 >= 0)
                                v228 = *((unsigned __int8 *)v221 + 55);
                              else
                                v228 = v221[5];
                              if (v224 >= v228)
                                v229 = v228;
                              else
                                v229 = v224;
                              v230 = memcmp(v227, v223, v229);
                              if (v230)
                              {
                                if (v230 < 0)
                                  goto LABEL_436;
                              }
                              else if (v228 < v224)
                              {
LABEL_436:
                                v221 = (uint64_t *)v221[1];
                                if (!v221)
                                  goto LABEL_451;
                                continue;
                              }
                              v225 = v221;
                              v221 = (uint64_t *)*v221;
                              if (!v221)
                              {
LABEL_451:
                                if (v225 != (uint64_t *)(v220 + 168))
                                {
                                  v233 = (uint64_t *)v225[4];
                                  v232 = v225 + 4;
                                  v231 = v233;
                                  v234 = *((char *)v232 + 23);
                                  if (v234 >= 0)
                                    v235 = v232;
                                  else
                                    v235 = v231;
                                  if (v234 >= 0)
                                    v236 = *((unsigned __int8 *)v232 + 23);
                                  else
                                    v236 = v232[1];
                                  if (v236 >= v224)
                                    v237 = v224;
                                  else
                                    v237 = v236;
                                  v238 = memcmp(v223, v235, v237);
                                  if (v238)
                                  {
                                    if ((v238 & 0x80000000) == 0)
                                    {
LABEL_463:
                                      v239 = 1;
                                      v3 = v495;
                                      if ((v222 & 0x80) == 0)
                                        goto LABEL_545;
                                      goto LABEL_464;
                                    }
                                  }
                                  else if (v224 >= v236)
                                  {
                                    goto LABEL_463;
                                  }
                                }
LABEL_508:
                                v267 = *(uint64_t **)(v220 + 192);
                                v266 = (uint64_t *)(v220 + 192);
                                v265 = v267;
                                if (!v267)
                                  goto LABEL_543;
                                if ((v222 & 0x80u) == 0)
                                  v268 = &v531;
                                else
                                  v268 = (__int128 *)v531;
                                if ((v222 & 0x80u) == 0)
                                  v269 = v222;
                                else
                                  v269 = *((_QWORD *)&v531 + 1);
                                v270 = v266;
                                while (2)
                                {
                                  while (2)
                                  {
                                    v271 = *((char *)v265 + 55);
                                    if (v271 >= 0)
                                      v272 = v265 + 4;
                                    else
                                      v272 = (const void *)v265[4];
                                    if (v271 >= 0)
                                      v273 = *((unsigned __int8 *)v265 + 55);
                                    else
                                      v273 = v265[5];
                                    if (v269 >= v273)
                                      v274 = v273;
                                    else
                                      v274 = v269;
                                    v275 = memcmp(v272, v268, v274);
                                    if (v275)
                                    {
                                      if ((v275 & 0x80000000) == 0)
                                        break;
                                      goto LABEL_516;
                                    }
                                    if (v273 < v269)
                                    {
LABEL_516:
                                      v265 = (uint64_t *)v265[1];
                                      if (!v265)
                                        goto LABEL_531;
                                      continue;
                                    }
                                    break;
                                  }
                                  v270 = v265;
                                  v265 = (uint64_t *)*v265;
                                  if (v265)
                                    continue;
                                  break;
                                }
LABEL_531:
                                if (v270 == v266)
                                  goto LABEL_543;
                                v276 = *((char *)v270 + 55);
                                if (v276 >= 0)
                                  v277 = v270 + 4;
                                else
                                  v277 = (const void *)v270[4];
                                if (v276 >= 0)
                                  v278 = *((unsigned __int8 *)v270 + 55);
                                else
                                  v278 = v270[5];
                                if (v278 >= v269)
                                  v279 = v269;
                                else
                                  v279 = v278;
                                v280 = memcmp(v268, v277, v279);
                                if (v280)
                                {
                                  if (v280 < 0)
                                    goto LABEL_543;
                                }
                                else if (v269 < v278)
                                {
LABEL_543:
                                  v270 = v266;
                                }
                                v239 = v266 != v270;
                                v3 = v495;
                                if ((v222 & 0x80) == 0)
                                {
LABEL_545:
                                  v41 = v496;
                                  if (!v239)
                                    goto LABEL_465;
LABEL_546:
                                  v281 = *(_QWORD *)(v3 + 40);
                                  if ((__dst[23] & 0x80000000) != 0)
                                  {
                                    sub_1000016D4(v528, *(void **)__dst, *(unint64_t *)&__dst[8]);
                                  }
                                  else
                                  {
                                    *(_OWORD *)v528 = *(_OWORD *)__dst;
                                    v528[2] = *(void **)&__dst[16];
                                  }
                                  CommandBase::getSubCommandObj(v281, (uint64_t)v528, (uint64_t **)&v535);
                                  v282 = v535;
                                  v535 = 0uLL;
                                  v283 = *(std::__shared_weak_count **)(v3 + 48);
                                  *(_OWORD *)(v3 + 40) = v282;
                                  if (!v283)
                                    goto LABEL_553;
                                  v284 = (unint64_t *)&v283->__shared_owners_;
                                  do
                                    v285 = __ldaxr(v284);
                                  while (__stlxr(v285 - 1, v284));
                                  if (!v285)
                                  {
                                    ((void (*)(std::__shared_weak_count *))v283->__on_zero_shared)(v283);
                                    std::__shared_weak_count::__release_weak(v283);
                                    v286 = (std::__shared_weak_count *)*((_QWORD *)&v535 + 1);
                                    if (*((_QWORD *)&v535 + 1))
                                    {
LABEL_554:
                                      v287 = (unint64_t *)&v286->__shared_owners_;
                                      do
                                        v288 = __ldaxr(v287);
                                      while (__stlxr(v288 - 1, v287));
                                      if (!v288)
                                      {
                                        ((void (*)(std::__shared_weak_count *))v286->__on_zero_shared)(v286);
                                        std::__shared_weak_count::__release_weak(v286);
                                      }
                                    }
                                  }
                                  else
                                  {
LABEL_553:
                                    v286 = (std::__shared_weak_count *)*((_QWORD *)&v535 + 1);
                                    if (*((_QWORD *)&v535 + 1))
                                      goto LABEL_554;
                                  }
                                  if (SHIBYTE(v528[2]) < 0)
                                  {
                                    operator delete(v528[0]);
                                    v256 = 1;
                                    if ((__dst[23] & 0x80) == 0)
                                      goto LABEL_418;
                                    goto LABEL_417;
                                  }
LABEL_560:
                                  v256 = 1;
                                  if ((__dst[23] & 0x80) != 0)
                                    goto LABEL_417;
LABEL_418:
                                  v217 += 3;
                                  if (v217 == v216)
                                    v218 = 0;
                                  else
                                    v218 = v256;
                                  if ((v218 & 1) == 0)
                                  {
                                    v217 = (void **)v533;
                                    v289 = v493;
                                    if ((_QWORD)v533)
                                      goto LABEL_567;
LABEL_598:
                                    if ((SHIBYTE(v540[2].__locale_) & 0x80000000) == 0)
                                    {
LABEL_599:
                                      if ((SHIBYTE(v541[2]) & 0x80000000) == 0)
                                      {
LABEL_600:
                                        if ((v289 & 1) == 0)
                                        {
LABEL_601:
                                          v83 = 0;
                                          v305 = v530;
                                          if (!v530)
                                            goto LABEL_609;
LABEL_606:
                                          v307 = (unint64_t *)&v305->__shared_owners_;
                                          do
                                            v308 = __ldaxr(v307);
                                          while (__stlxr(v308 - 1, v307));
                                          if (v308)
                                          {
LABEL_609:
                                            if (v517)
                                              goto LABEL_610;
                                          }
                                          else
                                          {
                                            ((void (*)(std::__shared_weak_count *))v305->__on_zero_shared)(v305);
                                            std::__shared_weak_count::__release_weak(v305);
                                            if (v517)
                                              goto LABEL_610;
                                          }
LABEL_611:
                                          if ((v83 & 1) != 0)
                                            goto LABEL_653;
                                          if (v521 >= 2)
                                          {
                                            v312 = sub_100001760(&std::cout, (uint64_t)"error:", 6);
                                            v313 = sub_100001760(v312, (uint64_t)" switch command takes only one argument", 39);
                                            std::ios_base::getloc((const std::ios_base *)((char *)v313
                                                                                        + *(_QWORD *)(*v313 - 24)));
                                            v314 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
                                            v315 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v314->__vftable[2].~facet_0)(v314, 10);
                                            std::locale::~locale((std::locale *)__dst);
                                            std::ostream::put(v313, v315);
                                            std::ostream::flush(v313);
                                            goto LABEL_653;
                                          }
                                          if (v521)
                                          {
                                            v317 = sub_100001760(&std::cout, (uint64_t)"Invalid sub-command '", 21);
                                            v318 = *((char *)v519 + 39);
                                            if (v318 >= 0)
                                              v319 = (char *)v519 + 16;
                                            else
                                              v319 = (char *)*((_QWORD *)v519 + 2);
                                            if (v318 >= 0)
                                              v320 = *((unsigned __int8 *)v519 + 39);
                                            else
                                              v320 = *((_QWORD *)v519 + 3);
                                            v321 = sub_100001760(v317, (uint64_t)v319, v320);
                                            sub_100001760(v321, (uint64_t)"'.", 2);
                                          }
                                          v322 = sub_100001760(&std::cout, (uint64_t)" See '", 6);
                                          v323 = sub_100001760(v322, (uint64_t)"help", 4);
                                          v324 = sub_100001760(v323, (uint64_t)"' for usage.", 12);
                                          std::ios_base::getloc((const std::ios_base *)((char *)v324
                                                                                      + *(_QWORD *)(*v324 - 24)));
                                          v325 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
                                          v326 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v325->__vftable[2].~facet_0)(v325, 10);
                                          std::locale::~locale((std::locale *)__dst);
                                          std::ostream::put(v324, v326);
                                          goto LABEL_651;
                                        }
LABEL_571:
                                        if (*v490)
                                        {
                                          v291 = v529;
                                          v292 = v530;
                                          if (v530)
                                          {
                                            v293 = (unint64_t *)&v530->__shared_owners_;
                                            do
                                              v294 = __ldxr(v293);
                                            while (__stxr(v294 + 1, v293));
                                          }
                                          v295 = *(std::__shared_weak_count **)(v3 + 64);
                                          *(_QWORD *)(v3 + 56) = v291;
                                          *(_QWORD *)(v3 + 64) = v292;
                                          if (!v295)
                                            goto LABEL_579;
                                          v296 = (unint64_t *)&v295->__shared_owners_;
                                          do
                                            v297 = __ldaxr(v296);
                                          while (__stlxr(v297 - 1, v296));
                                          if (!v297)
                                          {
                                            ((void (*)(std::__shared_weak_count *))v295->__on_zero_shared)(v295);
                                            std::__shared_weak_count::__release_weak(v295);
                                            v299 = *(_QWORD *)(v3 + 40);
                                            v298 = *(_QWORD *)(v3 + 48);
                                            if (v298)
                                              goto LABEL_580;
                                          }
                                          else
                                          {
LABEL_579:
                                            v299 = *(_QWORD *)(v3 + 40);
                                            v298 = *(_QWORD *)(v3 + 48);
                                            if (v298)
                                            {
LABEL_580:
                                              v300 = (unint64_t *)(v298 + 8);
                                              do
                                                v301 = __ldxr(v300);
                                              while (__stxr(v301 + 1, v300));
                                            }
                                          }
                                          v302 = *(std::__shared_weak_count **)(v3 + 32);
                                          *(_QWORD *)(v3 + 24) = v299;
                                          *(_QWORD *)(v3 + 32) = v298;
                                          if (v302)
                                          {
                                            v303 = (unint64_t *)&v302->__shared_owners_;
                                            do
                                              v304 = __ldaxr(v303);
                                            while (__stlxr(v304 - 1, v303));
                                            if (!v304)
                                            {
                                              ((void (*)(std::__shared_weak_count *))v302->__on_zero_shared)(v302);
                                              std::__shared_weak_count::__release_weak(v302);
                                              v83 = 1;
                                              v305 = v530;
                                              if (!v530)
                                                goto LABEL_609;
                                              goto LABEL_606;
                                            }
                                          }
                                        }
                                        v83 = 1;
                                        v305 = v530;
                                        if (!v530)
                                          goto LABEL_609;
                                        goto LABEL_606;
                                      }
LABEL_570:
                                      operator delete(v541[0]);
                                      if ((v289 & 1) == 0)
                                        goto LABEL_601;
                                      goto LABEL_571;
                                    }
LABEL_569:
                                    operator delete(v540[0].__locale_);
                                    if ((SHIBYTE(v541[2]) & 0x80000000) == 0)
                                      goto LABEL_600;
                                    goto LABEL_570;
                                  }
                                  goto LABEL_422;
                                }
LABEL_464:
                                operator delete((void *)v531);
                                v41 = v496;
                                if (v239)
                                  goto LABEL_546;
LABEL_465:
                                v240 = __dst[23];
                                if (__dst[23] < 0)
                                  v240 = *(_QWORD *)&__dst[8];
                                if (v240 == 1)
                                {
                                  v257 = __dst;
                                  if (__dst[23] < 0)
                                    v257 = *(_BYTE **)__dst;
                                  if (*v257 == 45)
                                  {
                                    v259 = *(_QWORD *)(v3 + 56);
                                    v258 = *(_QWORD *)(v3 + 64);
                                    if (v258)
                                    {
                                      v260 = (unint64_t *)(v258 + 8);
                                      do
                                        v261 = __ldxr(v260);
                                      while (__stxr(v261 + 1, v260));
                                    }
                                    v262 = *(std::__shared_weak_count **)(v3 + 48);
                                    *(_QWORD *)(v3 + 40) = v259;
                                    *(_QWORD *)(v3 + 48) = v258;
                                    if (!v262)
                                      goto LABEL_560;
                                    v263 = (unint64_t *)&v262->__shared_owners_;
                                    do
                                      v264 = __ldaxr(v263);
                                    while (__stlxr(v264 - 1, v263));
                                    if (v264)
                                      goto LABEL_560;
                                    ((void (*)(std::__shared_weak_count *))v262->__on_zero_shared)(v262);
                                    std::__shared_weak_count::__release_weak(v262);
                                    v256 = 1;
                                    if ((__dst[23] & 0x80) == 0)
                                      goto LABEL_418;
LABEL_417:
                                    operator delete(*(void **)__dst);
                                    goto LABEL_418;
                                  }
                                }
                                else
                                {
                                  if (v240 != 2)
                                  {
                                    v493 = 0;
                                    v256 = 0;
                                    if ((__dst[23] & 0x80) != 0)
                                      goto LABEL_417;
                                    goto LABEL_418;
                                  }
                                  v241 = __dst;
                                  if (__dst[23] < 0)
                                    v241 = *(_WORD **)__dst;
                                  if (*v241 == 11822)
                                  {
                                    v242 = *(_QWORD *)(v3 + 40);
                                    v243 = *(std::__shared_weak_count **)(v242 + 32);
                                    if (v243)
                                    {
                                      v244 = *(_QWORD *)(v242 + 24);
                                      v245 = (unint64_t *)&v243->__shared_weak_owners_;
                                      do
                                        v246 = __ldxr(v245);
                                      while (__stxr(v246 + 1, v245));
                                      v247 = std::__shared_weak_count::lock(v243);
                                      if (v247)
                                      {
                                        v248 = v247;
                                        if (v244)
                                        {
                                          v249 = (unint64_t *)&v247->__shared_owners_;
                                          do
                                            v250 = __ldxr(v249);
                                          while (__stxr(v250 + 1, v249));
                                          v251 = *(std::__shared_weak_count **)(v3 + 48);
                                          *(_QWORD *)(v3 + 40) = v244;
                                          *(_QWORD *)(v3 + 48) = v247;
                                          if (v251)
                                          {
                                            v252 = (unint64_t *)&v251->__shared_owners_;
                                            do
                                              v253 = __ldaxr(v252);
                                            while (__stlxr(v253 - 1, v252));
                                            if (!v253)
                                            {
                                              ((void (*)(std::__shared_weak_count *))v251->__on_zero_shared)(v251);
                                              std::__shared_weak_count::__release_weak(v251);
                                            }
                                          }
                                        }
                                        v254 = (unint64_t *)&v248->__shared_owners_;
                                        do
                                          v255 = __ldaxr(v254);
                                        while (__stlxr(v255 - 1, v254));
                                        if (!v255)
                                        {
                                          ((void (*)(std::__shared_weak_count *))v248->__on_zero_shared)(v248);
                                          std::__shared_weak_count::__release_weak(v248);
                                        }
                                      }
                                      std::__shared_weak_count::__release_weak(v243);
                                    }
                                    v256 = 1;
                                    v41 = v496;
                                    if ((__dst[23] & 0x80) == 0)
                                      goto LABEL_418;
                                    goto LABEL_417;
                                  }
                                }
                                v493 = 0;
                                v256 = 0;
                                if ((__dst[23] & 0x80) != 0)
                                  goto LABEL_417;
                                goto LABEL_418;
                              }
                            }
                          }
                          continue;
                        }
                      }
                      continue;
                    }
                  }
LABEL_917:
                  sub_10000163C();
                }
                goto LABEL_916;
              }
              while (2)
              {
                v174 = *(_QWORD *)(v3 + 40);
                if (*(char *)(v174 + 63) < 0)
                {
                  sub_1000016D4(__dst, *(void **)(v174 + 40), *(_QWORD *)(v174 + 48));
                }
                else
                {
                  *(_OWORD *)__dst = *(_OWORD *)(v174 + 40);
                  *(_QWORD *)&__dst[16] = *(_QWORD *)(v174 + 56);
                }
                v175 = getprogname();
                v176 = v175;
                v177 = __dst[23];
                if (__dst[23] >= 0)
                  v178 = __dst[23];
                else
                  v178 = *(_QWORD *)&__dst[8];
                if (v178 == strlen(v175))
                {
                  if (__dst[23] >= 0)
                    v179 = __dst;
                  else
                    v179 = *(_BYTE **)__dst;
                  v180 = memcmp(v179, v176, v178) == 0;
                  if (v177 < 0)
LABEL_329:
                    operator delete(*(void **)__dst);
                }
                else
                {
                  v180 = 0;
                  if ((__dst[23] & 0x80000000) != 0)
                    goto LABEL_329;
                }
                if (v180)
                  goto LABEL_354;
                v181 = *((_QWORD *)&v535 + 1);
                if (*((_QWORD *)&v535 + 1))
                {
                  v182 = (unint64_t *)(*((_QWORD *)&v535 + 1) + 8);
                  do
                    v183 = __ldxr(v182);
                  while (__stxr(v183 + 1, v182));
                }
                v184 = *(std::__shared_weak_count **)(v3 + 48);
                *(_QWORD *)(v3 + 40) = v171;
                *(_QWORD *)(v3 + 48) = v181;
                if (!v184)
                  goto LABEL_338;
                v185 = (unint64_t *)&v184->__shared_owners_;
                do
                  v186 = __ldaxr(v185);
                while (__stlxr(v186 - 1, v185));
                if (!v186)
                {
                  ((void (*)(std::__shared_weak_count *))v184->__on_zero_shared)(v184);
                  std::__shared_weak_count::__release_weak(v184);
                  v187 = *(_QWORD *)(v3 + 40);
                  v188 = *(std::__shared_weak_count **)(v187 + 32);
                  if (v188)
                    goto LABEL_339;
                }
                else
                {
LABEL_338:
                  v187 = *(_QWORD *)(v3 + 40);
                  v188 = *(std::__shared_weak_count **)(v187 + 32);
                  if (v188)
                  {
LABEL_339:
                    v189 = *(_QWORD *)(v187 + 24);
                    v190 = (unint64_t *)&v188->__shared_weak_owners_;
                    do
                      v191 = __ldxr(v190);
                    while (__stxr(v191 + 1, v190));
                    v192 = std::__shared_weak_count::lock(v188);
                    if (v192)
                      v193 = v189;
                    else
                      v193 = 0;
                    v194 = (std::__shared_weak_count *)*((_QWORD *)&v535 + 1);
                    *(_QWORD *)&v535 = v193;
                    *((_QWORD *)&v535 + 1) = v192;
                    if (!v194)
                    {
LABEL_313:
                      if (v188)
                        goto LABEL_314;
                      goto LABEL_315;
                    }
LABEL_348:
                    v195 = (unint64_t *)&v194->__shared_owners_;
                    do
                      v196 = __ldaxr(v195);
                    while (__stlxr(v196 - 1, v195));
                    if (v196)
                      goto LABEL_313;
                    ((void (*)(std::__shared_weak_count *))v194->__on_zero_shared)(v194);
                    std::__shared_weak_count::__release_weak(v194);
                    if (v188)
LABEL_314:
                      std::__shared_weak_count::__release_weak(v188);
LABEL_315:
                    v171 = v535;
                    if (!(_QWORD)v535)
                      goto LABEL_354;
                    continue;
                  }
                }
                break;
              }
              v194 = (std::__shared_weak_count *)*((_QWORD *)&v535 + 1);
              v535 = 0uLL;
              if (!v194)
                goto LABEL_313;
              goto LABEL_348;
            }
          }
          v54 = *(_QWORD *)(v3 + 40);
          if (SHIBYTE(v518[2]) < 0)
          {
            sub_1000016D4(&v513, v518[0], (unint64_t)v518[1]);
          }
          else
          {
            v513 = *(_OWORD *)v518;
            v514 = v518[2];
          }
          v57 = *(uint64_t **)(v54 + 96);
          v56 = (uint64_t *)(v54 + 96);
          v55 = v57;
          v58 = HIBYTE(v514);
          if (!v57)
            goto LABEL_132;
          if (SHIBYTE(v514) >= 0)
            v59 = &v513;
          else
            v59 = (__int128 *)v513;
          if (SHIBYTE(v514) >= 0)
            v60 = HIBYTE(v514);
          else
            v60 = *((_QWORD *)&v513 + 1);
          v61 = v56;
          do
          {
            while (1)
            {
              v62 = *((char *)v55 + 55);
              v63 = v62 >= 0 ? v55 + 4 : (uint64_t *)v55[4];
              v64 = v62 >= 0 ? *((unsigned __int8 *)v55 + 55) : v55[5];
              v65 = v60 >= v64 ? v64 : v60;
              v66 = memcmp(v63, v59, v65);
              if (v66)
                break;
              if (v64 >= v60)
                goto LABEL_99;
LABEL_85:
              v55 = (uint64_t *)v55[1];
              if (!v55)
                goto LABEL_100;
            }
            if (v66 < 0)
              goto LABEL_85;
LABEL_99:
            v61 = v55;
            v55 = (uint64_t *)*v55;
          }
          while (v55);
LABEL_100:
          if (v61 == v56)
            goto LABEL_132;
          v67 = *((char *)v61 + 55);
          if (v67 >= 0)
            v68 = v61 + 4;
          else
            v68 = (const void *)v61[4];
          if (v67 >= 0)
            v69 = *((unsigned __int8 *)v61 + 55);
          else
            v69 = v61[5];
          if (v69 >= v60)
            v70 = v60;
          else
            v70 = v69;
          v71 = memcmp(v59, v68, v70);
          if (!v71)
          {
            if (v60 < v69)
              goto LABEL_132;
LABEL_112:
            if (v58 < 0)
              goto LABEL_133;
LABEL_113:
            v72 = *(_QWORD **)(v3 + 40);
            v73 = SHIBYTE(v518[2]);
            if (v56 == v61)
              goto LABEL_134;
            goto LABEL_114;
          }
          if ((v71 & 0x80000000) == 0)
            goto LABEL_112;
LABEL_132:
          v61 = v56;
          if ((v58 & 0x80) == 0)
            goto LABEL_113;
LABEL_133:
          operator delete((void *)v513);
          v72 = *(_QWORD **)(v3 + 40);
          v73 = SHIBYTE(v518[2]);
          if (v56 == v61)
          {
LABEL_134:
            if (v73 < 0)
            {
              sub_1000016D4(v504, v518[0], (unint64_t)v518[1]);
            }
            else
            {
              *(_OWORD *)v504 = *(_OWORD *)v518;
              v505 = v518[2];
            }
            v84 = (uint64_t *)v72[21];
            if (!v84)
              goto LABEL_253;
            v85 = HIBYTE(v505);
            if (SHIBYTE(v505) >= 0)
              v86 = v504;
            else
              v86 = (void **)v504[0];
            if (SHIBYTE(v505) >= 0)
              v87 = (void *)HIBYTE(v505);
            else
              v87 = v504[1];
            v88 = v72 + 21;
            while (1)
            {
              v89 = *((char *)v84 + 55);
              if (v89 >= 0)
                v90 = v84 + 4;
              else
                v90 = (const void *)v84[4];
              if (v89 >= 0)
                v91 = *((unsigned __int8 *)v84 + 55);
              else
                v91 = v84[5];
              if ((unint64_t)v87 >= v91)
                v92 = v91;
              else
                v92 = (size_t)v87;
              v93 = memcmp(v90, v86, v92);
              if (v93)
              {
                if (v93 < 0)
                  goto LABEL_147;
              }
              else if (v91 < (unint64_t)v87)
              {
LABEL_147:
                v84 = (uint64_t *)v84[1];
                if (!v84)
                  goto LABEL_162;
                continue;
              }
              v88 = v84;
              v84 = (uint64_t *)*v84;
              if (!v84)
              {
LABEL_162:
                v3 = v495;
                if (v88 == v72 + 21)
                  goto LABEL_253;
                v96 = (const void *)v88[4];
                v95 = v88 + 4;
                v94 = v96;
                v97 = *((char *)v95 + 23);
                if (v97 >= 0)
                  v98 = v95;
                else
                  v98 = v94;
                if (v97 >= 0)
                  v99 = *((unsigned __int8 *)v95 + 23);
                else
                  v99 = v95[1];
                if (v99 >= (unint64_t)v87)
                  v100 = (size_t)v87;
                else
                  v100 = v99;
                v101 = memcmp(v86, v98, v100);
                if (v101)
                {
                  if ((v101 & 0x80000000) == 0)
                    goto LABEL_174;
LABEL_253:
                  v102 = v72 + 24 != sub_1000101B4((uint64_t)(v72 + 23), (const void **)v504);
                  if ((HIBYTE(v505) & 0x80) == 0)
                  {
LABEL_254:
                    v41 = v496;
                    if (v102)
                    {
LABEL_255:
                      v146 = *(_QWORD *)(v3 + 40);
                      if (SHIBYTE(v518[2]) < 0)
                      {
                        sub_1000016D4(v502, v518[0], (unint64_t)v518[1]);
                      }
                      else
                      {
                        *(_OWORD *)v502 = *(_OWORD *)v518;
                        v503 = v518[2];
                      }
                      v147 = (*(uint64_t (**)(uint64_t, void **))(*(_QWORD *)v146 + 32))(v146, v502);
                      v148 = v147;
                      if (SHIBYTE(v503) < 0)
                      {
                        operator delete(v502[0]);
                        if (!v148)
                          goto LABEL_652;
                      }
                      else if (!v147)
                      {
LABEL_652:
                        v494 = 0;
                        goto LABEL_653;
                      }
                      v149 = *(_QWORD *)(v3 + 40);
                      if (SHIBYTE(v518[2]) < 0)
                      {
                        sub_1000016D4(v500, v518[0], (unint64_t)v518[1]);
                      }
                      else
                      {
                        *(_OWORD *)v500 = *(_OWORD *)v518;
                        v501 = v518[2];
                      }
                      CommandBase::getSubCommandObj(v149, (uint64_t)v500, (uint64_t **)__dst);
                      v161 = *(_OWORD *)__dst;
                      *(_QWORD *)&__dst[8] = 0;
                      *(_QWORD *)__dst = 0;
                      v162 = *(std::__shared_weak_count **)(v3 + 48);
                      *(_OWORD *)(v3 + 40) = v161;
                      if (!v162)
                        goto LABEL_291;
                      v163 = (unint64_t *)&v162->__shared_owners_;
                      do
                        v164 = __ldaxr(v163);
                      while (__stlxr(v164 - 1, v163));
                      if (!v164)
                      {
                        ((void (*)(std::__shared_weak_count *))v162->__on_zero_shared)(v162);
                        std::__shared_weak_count::__release_weak(v162);
                        v165 = *(std::__shared_weak_count **)&__dst[8];
                        if (*(_QWORD *)&__dst[8])
                        {
LABEL_292:
                          v166 = (unint64_t *)&v165->__shared_owners_;
                          do
                            v167 = __ldaxr(v166);
                          while (__stlxr(v167 - 1, v166));
                          if (!v167)
                          {
                            ((void (*)(std::__shared_weak_count *))v165->__on_zero_shared)(v165);
                            std::__shared_weak_count::__release_weak(v165);
                          }
                        }
                      }
                      else
                      {
LABEL_291:
                        v165 = *(std::__shared_weak_count **)&__dst[8];
                        if (*(_QWORD *)&__dst[8])
                          goto LABEL_292;
                      }
                      if (SHIBYTE(v501) < 0)
                      {
                        operator delete(v500[0]);
                        if (v51)
                          goto LABEL_299;
                      }
                      else if (v51)
                      {
LABEL_299:
                        v40 = 0;
LABEL_300:
                        v494 = 1;
                        goto LABEL_654;
                      }
                      (*(void (**)(_QWORD, BOOL))(**(_QWORD **)(v3 + 40) + 24))(*(_QWORD *)(v3 + 40), v492 == 0);
                      goto LABEL_652;
                    }
LABEL_176:
                    if (SHIBYTE(v518[2]) >= 0)
                      v103 = HIBYTE(v518[2]);
                    else
                      v103 = (size_t)v518[1];
                    if (v103 != 6)
                    {
                      if (v103 != 4)
                        goto LABEL_187;
                      v104 = (void **)v518[0];
                      if (SHIBYTE(v518[2]) >= 0)
                        v104 = v518;
                      v105 = *(_DWORD *)v104 == 1886152040 && v51 == 0;
                      if (!v105)
                        goto LABEL_187;
LABEL_243:
                      (*(void (**)(_QWORD, BOOL))(**(_QWORD **)(v3 + 40) + 24))(*(_QWORD *)(v3 + 40), v492 == 0);
                      goto LABEL_653;
                    }
                    v137 = (void **)v518[0];
                    if (SHIBYTE(v518[2]) >= 0)
                      v137 = v518;
                    if (*(_DWORD *)v137 ^ 0x65682D2D | *((unsigned __int16 *)v137 + 2) ^ 0x706C)
                      v138 = 0;
                    else
                      v138 = v51 == 0;
                    if (v138)
                      goto LABEL_243;
LABEL_187:
                    if (!v488)
                    {
                      switch(v103)
                      {
                        case 1uLL:
                          goto LABEL_265;
                        case 2uLL:
                          if (SHIBYTE(v518[2]) >= 0)
                            v106 = v518;
                          else
                            v106 = (void **)v518[0];
                          if (*(_WORD *)v106 != 29548)
                            goto LABEL_193;
                          CommandBase::list(*(CommandBase **)(v3 + 40));
                          goto LABEL_667;
                        case 4uLL:
                          v327 = v518;
                          if (SHIBYTE(v518[2]) < 0)
                            v327 = (void **)v518[0];
                          if (*(_DWORD *)v327 != 1953068401 && *(_DWORD *)v327 != 1953069157)
                            goto LABEL_644;
                          v40 = 8;
                          v491 = 1;
                          goto LABEL_300;
                        case 7uLL:
                          v328 = v518;
                          if (SHIBYTE(v518[2]) < 0)
                            v328 = (void **)v518[0];
                          v329 = *(_DWORD *)v328;
                          v330 = *(_DWORD *)((char *)v328 + 3);
                          if (v329 != 1953720680 || v330 != 2037542772)
                            goto LABEL_644;
                          v40 = 0;
                          if (v492 || history_length < 1)
                            goto LABEL_654;
                          v340 = 0;
                          do
                          {
                            v341 = history_get(v340 + history_base);
                            if (v341)
                            {
                              __dst[0] = 9;
                              v342 = sub_100001760(&std::cout, (uint64_t)__dst, 1);
                              v343 = *v342;
                              *(uint64_t *)((char *)v342 + *(_QWORD *)(*v342 - 24) + 24) = 4;
                              *(_DWORD *)((char *)v342 + *(_QWORD *)(v343 - 24) + 8) = *(_DWORD *)((_BYTE *)v342
                                                                                                 + *(_QWORD *)(v343 - 24)
                                                                                                 + 8) & 0xFFFFFF4F | 0x80;
                              line = v341->line;
                              v345 = strlen(line);
                              v346 = sub_100001760(v342, (uint64_t)line, v345);
                              std::ios_base::getloc((const std::ios_base *)((char *)v346 + *(_QWORD *)(*v346 - 24)));
                              v347 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
                              v348 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v347->__vftable[2].~facet_0)(v347, 10);
                              std::locale::~locale((std::locale *)__dst);
                              std::ostream::put(v346, v348);
                              std::ostream::flush(v346);
                            }
                            ++v340;
                          }
                          while (v340 < history_length);
                          break;
                        default:
                          goto LABEL_644;
                      }
                      goto LABEL_667;
                    }
                    if (v103 == 1)
                    {
LABEL_265:
                      if (SHIBYTE(v518[2]) >= 0)
                        v150 = v518;
                      else
                        v150 = (void **)v518[0];
                      if (!memcmp(v150, "/", v103))
                      {
                        v152 = *(_QWORD *)(v3 + 8);
                        v151 = *(_QWORD *)(v3 + 16);
                        if (v151)
                        {
                          v153 = (unint64_t *)(v151 + 8);
                          do
                            v154 = __ldxr(v153);
                          while (__stxr(v154 + 1, v153));
                        }
                        v155 = *(std::__shared_weak_count **)(v3 + 48);
                        *(_QWORD *)(v3 + 40) = v152;
                        *(_QWORD *)(v3 + 48) = v151;
                        if (v155)
                        {
                          v156 = (unint64_t *)&v155->__shared_owners_;
                          do
                            v157 = __ldaxr(v156);
                          while (__stlxr(v157 - 1, v156));
                          if (!v157)
                          {
                            ((void (*)(std::__shared_weak_count *))v155->__on_zero_shared)(v155);
                            v158 = v155;
                            goto LABEL_666;
                          }
                        }
LABEL_667:
                        v40 = 0;
                        goto LABEL_654;
                      }
                    }
                    else if (v103 == 2)
                    {
                      v106 = SHIBYTE(v518[2]) >= 0 ? v518 : (void **)v518[0];
LABEL_193:
                      if (!memcmp(v106, "..", v103))
                      {
                        v107 = *(_QWORD *)(v3 + 40);
                        v108 = *(std::__shared_weak_count **)(v107 + 32);
                        if (v108)
                        {
                          v109 = *(_QWORD *)(v107 + 24);
                          v110 = (unint64_t *)&v108->__shared_weak_owners_;
                          do
                            v111 = __ldxr(v110);
                          while (__stxr(v111 + 1, v110));
                          v112 = std::__shared_weak_count::lock(v108);
                          if (v112)
                          {
                            v113 = v112;
                            v114 = (unint64_t *)&v112->__shared_owners_;
                            do
                              v115 = __ldaxr(v114);
                            while (__stlxr(v115 - 1, v114));
                            if (!v115)
                            {
                              ((void (*)(std::__shared_weak_count *))v112->__on_zero_shared)(v112);
                              std::__shared_weak_count::__release_weak(v113);
                            }
                            std::__shared_weak_count::__release_weak(v108);
                            if (v109)
                            {
                              v116 = *(_QWORD *)(v3 + 40);
                              v117 = *(std::__shared_weak_count **)(v116 + 32);
                              if (v117)
                              {
                                v118 = *(_QWORD *)(v116 + 24);
                                v119 = (unint64_t *)&v117->__shared_weak_owners_;
                                do
                                  v120 = __ldxr(v119);
                                while (__stxr(v120 + 1, v119));
                                v121 = std::__shared_weak_count::lock(v117);
                                if (v121)
                                  v122 = v118;
                                else
                                  v122 = 0;
                                v123 = *(std::__shared_weak_count **)(v3 + 48);
                                *(_QWORD *)(v3 + 40) = v122;
                                *(_QWORD *)(v3 + 48) = v121;
                                if (!v123)
                                  goto LABEL_673;
LABEL_669:
                                v349 = (unint64_t *)&v123->__shared_owners_;
                                do
                                  v350 = __ldaxr(v349);
                                while (__stlxr(v350 - 1, v349));
                                if (!v350)
                                {
                                  ((void (*)(std::__shared_weak_count *))v123->__on_zero_shared)(v123);
                                  std::__shared_weak_count::__release_weak(v123);
                                }
                              }
                              else
                              {
                                v123 = *(std::__shared_weak_count **)(v3 + 48);
                                *(_QWORD *)(v3 + 40) = 0;
                                *(_QWORD *)(v3 + 48) = 0;
                                if (v123)
                                  goto LABEL_669;
                              }
LABEL_673:
                              if (v117)
                                std::__shared_weak_count::__release_weak(v117);
                            }
                            v40 = 0;
                            v41 = v496;
                            goto LABEL_654;
                          }
                          v158 = v108;
LABEL_666:
                          std::__shared_weak_count::__release_weak(v158);
                        }
                        goto LABEL_667;
                      }
                    }
LABEL_644:
                    v332 = sub_100001760(&std::cout, (uint64_t)"Invalid command '", 17);
                    if (SHIBYTE(v518[2]) >= 0)
                      v333 = v518;
                    else
                      v333 = (void **)v518[0];
                    if (SHIBYTE(v518[2]) >= 0)
                      v334 = HIBYTE(v518[2]);
                    else
                      v334 = (uint64_t)v518[1];
                    v335 = sub_100001760(v332, (uint64_t)v333, v334);
                    sub_100001760(v335, (uint64_t)"'.", 2);
                    v336 = sub_100001760(&std::cout, (uint64_t)" See '", 6);
                    v337 = sub_100001760(v336, (uint64_t)"help", 4);
                    v324 = sub_100001760(v337, (uint64_t)"' for usage.", 12);
                    std::ios_base::getloc((const std::ios_base *)((char *)v324 + *(_QWORD *)(*v324 - 24)));
                    v338 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
                    v339 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v338->__vftable[2].~facet_0)(v338, 10);
                    std::locale::~locale((std::locale *)__dst);
                    std::ostream::put(v324, v339);
LABEL_651:
                    std::ostream::flush(v324);
                    goto LABEL_652;
                  }
                }
                else
                {
                  if ((unint64_t)v87 < v99)
                    goto LABEL_253;
LABEL_174:
                  v102 = 1;
                  if ((v85 & 0x80) == 0)
                    goto LABEL_254;
                }
                operator delete(v504[0]);
                v41 = v496;
                if (v102)
                  goto LABEL_255;
                goto LABEL_176;
              }
            }
          }
LABEL_114:
          v41 = v496;
          if (v73 < 0)
          {
            sub_1000016D4(&v511, v518[0], (unint64_t)v518[1]);
          }
          else
          {
            v511 = *(_OWORD *)v518;
            v512 = v518[2];
          }
          v74 = (*(uint64_t (**)(_QWORD *, __int128 *))(*v72 + 32))(v72, &v511);
          v75 = v74;
          if (SHIBYTE(v512) < 0)
          {
            operator delete((void *)v511);
            if (!v75)
              goto LABEL_652;
          }
          else if (!v74)
          {
            goto LABEL_652;
          }
          if (!v492)
            rl_bind_key(9, 0);
          v76 = *(_QWORD *)(v3 + 40);
          if (SHIBYTE(v518[2]) < 0)
          {
            sub_1000016D4(&v509, v518[0], (unint64_t)v518[1]);
          }
          else
          {
            v509 = *(_OWORD *)v518;
            v510 = v518[2];
          }
          v506 = &v506;
          v507 = &v506;
          v508 = 0;
          v124 = (void **)v520;
          if (v520 != &v519)
          {
            v125 = 0;
            v126 = &v506;
            do
            {
              v128 = operator new(0x28uLL);
              v129 = v128 + 2;
              *v128 = 0;
              v128[1] = 0;
              if (*((char *)v124 + 39) < 0)
              {
                sub_1000016D4(v129, v124[2], (unint64_t)v124[3]);
                v126 = v506;
                v125 = v508;
              }
              else
              {
                v127 = *((_OWORD *)v124 + 1);
                v128[4] = v124[4];
                *(_OWORD *)v129 = v127;
              }
              *v128 = v126;
              v128[1] = &v506;
              v126[1] = v128;
              ++v125;
              v506 = v128;
              v508 = v125;
              v124 = (void **)v124[1];
              v126 = v128;
            }
            while (v124 != &v519);
          }
          v494 = (*(uint64_t (**)(uint64_t, __int128 *, _QWORD **))(*(_QWORD *)v76 + 40))(v76, &v509, &v506);
          if (v508)
          {
            v130 = v506;
            v131 = v507;
            v132 = *v507;
            *(_QWORD *)(v132 + 8) = v506[1];
            *(_QWORD *)v130[1] = v132;
            v508 = 0;
            if (v131 != &v506)
            {
              do
              {
                v133 = (_QWORD *)v131[1];
                if (*((char *)v131 + 39) < 0)
                  operator delete((void *)v131[2]);
                operator delete(v131);
                v131 = v133;
              }
              while (v133 != &v506);
            }
          }
          if (SHIBYTE(v510) < 0)
          {
            operator delete((void *)v509);
            v41 = v496;
            if (v492)
              goto LABEL_653;
          }
          else
          {
            v41 = v496;
            if (v492)
              goto LABEL_653;
          }
          rl_bind_key(9, (rl_command_func_t *)&rl_complete);
          rl_completion_append_character = 0;
          rl_attempted_completion_function = (CPPFunction *)sub_100007F38;
LABEL_653:
          v40 = 7;
LABEL_654:
          if (SHIBYTE(v518[2]) < 0)
            operator delete(v518[0]);
          if (!v40)
          {
            v43 = v521;
            if (!v521)
              goto LABEL_679;
            continue;
          }
          break;
        }
        if (v40 == 7)
        {
          if (v521)
          {
            v351 = (void **)v520;
            v352 = (_QWORD **)v519;
            v353 = *(_QWORD *)v520;
            *(_QWORD *)(v353 + 8) = *((_QWORD *)v519 + 1);
            *v352[1] = v353;
            v521 = 0;
            if (v351 != &v519)
            {
              do
              {
                v367 = (void **)v351[1];
                if (*((char *)v351 + 39) < 0)
                  operator delete(v351[2]);
                operator delete(v351);
                v351 = v367;
              }
              while (v367 != &v519);
            }
          }
LABEL_679:
          v354 = v487;
          if (*v490)
            v354 = v490;
          v356 = *v354;
          v355 = v354[1];
          if (v355)
          {
            v357 = (unint64_t *)(v355 + 8);
            do
              v358 = __ldxr(v357);
            while (__stxr(v358 + 1, v357));
          }
          v359 = *(std::__shared_weak_count **)(v3 + 48);
          *(_QWORD *)(v3 + 40) = v356;
          *(_QWORD *)(v3 + 48) = v355;
          v360 = v491;
          if (v359)
          {
            v361 = (unint64_t *)&v359->__shared_owners_;
            do
              v362 = __ldaxr(v361);
            while (__stlxr(v362 - 1, v361));
            if (!v362)
            {
              ((void (*)(std::__shared_weak_count *))v359->__on_zero_shared)(v359);
              std::__shared_weak_count::__release_weak(v359);
            }
          }
          v491 &= v494;
          if ((v360 & v494 & 1) != 0)
            v40 = 0;
          else
            v40 = 4;
        }
        if (v521)
        {
          v363 = (void **)v520;
          v364 = (_QWORD **)v519;
          v365 = *(_QWORD *)v520;
          *(_QWORD *)(v365 + 8) = *((_QWORD *)v519 + 1);
          *v364[1] = v365;
          v521 = 0;
          if (v363 != &v519)
          {
            do
            {
              v366 = (void **)v363[1];
              if (*((char *)v363 + 39) < 0)
                operator delete(v363[2]);
              operator delete(v363);
              v363 = v366;
            }
            while (v366 != &v519);
          }
        }
        if (v40)
        {
          if (v40 != 4)
            goto LABEL_53;
          break;
        }
        v41 += 3;
      }
      while (v41 != v489);
    }
    v368 = *v490;
    if (!*v490)
      break;
    v369 = *(_QWORD *)(v3 + 32);
    if (v369)
    {
      v370 = (unint64_t *)(v369 + 8);
      do
        v371 = __ldxr(v370);
      while (__stxr(v371 + 1, v370));
    }
    v372 = *(std::__shared_weak_count **)(v3 + 48);
    *(_QWORD *)(v3 + 40) = v368;
    *(_QWORD *)(v3 + 48) = v369;
    if (v372)
    {
      v373 = (unint64_t *)&v372->__shared_owners_;
      do
        v374 = __ldaxr(v373);
      while (__stlxr(v374 - 1, v373));
      if (!v374)
      {
        ((void (*)(std::__shared_weak_count *))v372->__on_zero_shared)(v372);
        std::__shared_weak_count::__release_weak(v372);
      }
    }
    memset(v528, 170, 24);
    v375 = *(_QWORD *)(v3 + 40);
    if (*(char *)(v375 + 87) < 0)
    {
      sub_1000016D4(&v535, *(void **)(v375 + 64), *(_QWORD *)(v375 + 72));
    }
    else
    {
      v535 = *(_OWORD *)(v375 + 64);
      *(_QWORD *)&v536[0] = *(_QWORD *)(v375 + 80);
    }
    v376 = std::string::insert((std::string *)&v535, 0, "(", 1uLL);
    v377 = *(_OWORD *)&v376->__r_.__value_.__l.__data_;
    *(_QWORD *)&__dst[16] = *((_QWORD *)&v376->__r_.__value_.__l + 2);
    *(_OWORD *)__dst = v377;
    v376->__r_.__value_.__l.__size_ = 0;
    v376->__r_.__value_.__r.__words[2] = 0;
    v376->__r_.__value_.__r.__words[0] = 0;
    v378 = std::string::append((std::string *)__dst, ")>> ", 4uLL);
    v379 = *(_OWORD *)&v378->__r_.__value_.__l.__data_;
    v528[2] = (void *)v378->__r_.__value_.__r.__words[2];
    *(_OWORD *)v528 = v379;
    v378->__r_.__value_.__l.__size_ = 0;
    v378->__r_.__value_.__r.__words[2] = 0;
    v378->__r_.__value_.__r.__words[0] = 0;
    if ((__dst[23] & 0x80000000) != 0)
    {
      operator delete(*(void **)__dst);
      if ((SBYTE7(v536[0]) & 0x80000000) == 0)
      {
LABEL_718:
        if ((SHIBYTE(v523) & 0x80000000) == 0)
          goto LABEL_719;
        goto LABEL_723;
      }
    }
    else if ((SBYTE7(v536[0]) & 0x80000000) == 0)
    {
      goto LABEL_718;
    }
    operator delete((void *)v535);
    if ((SHIBYTE(v523) & 0x80000000) == 0)
    {
LABEL_719:
      LOBYTE(v522) = 0;
      HIBYTE(v523) = 0;
      v381 = *(_QWORD *)(v3 + 40);
      v380 = *(_QWORD *)(v3 + 48);
      if (!v380)
        goto LABEL_726;
      goto LABEL_724;
    }
LABEL_723:
    *(_BYTE *)v522 = 0;
    *((_QWORD *)&v522 + 1) = 0;
    v381 = *(_QWORD *)(v3 + 40);
    v380 = *(_QWORD *)(v3 + 48);
    if (!v380)
      goto LABEL_726;
LABEL_724:
    v382 = (unint64_t *)(v380 + 16);
    do
      v383 = __ldxr(v382);
    while (__stxr(v383 + 1, v382));
LABEL_726:
    v384 = (std::__shared_weak_count *)qword_1000202C8;
    qword_1000202C0 = v381;
    qword_1000202C8 = v380;
    if (v384)
      std::__shared_weak_count::__release_weak(v384);
    if (!v492)
    {
      if (SHIBYTE(v528[2]) >= 0)
        v385 = v528;
      else
        v385 = (void **)v528[0];
      v386 = readline((const char *)v385);
      v387 = v386;
      if (!v386)
      {
        v40 = 3;
        if ((SHIBYTE(v528[2]) & 0x80000000) == 0)
          goto LABEL_53;
        goto LABEL_832;
      }
      if (*v386)
        add_history(v386);
      sub_10000BC74((void **)&v522, v387);
      free(v387);
    }
    v519 = &v519;
    v520 = &v519;
    v521 = 0;
    *(_QWORD *)&v388 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v388 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)((char *)&v543[7] + 8) = v388;
    *(_OWORD *)((char *)&v543[8] + 8) = v388;
    *(_OWORD *)((char *)&v543[5] + 8) = v388;
    *(_OWORD *)((char *)&v543[6] + 8) = v388;
    *(_OWORD *)((char *)&v543[3] + 8) = v388;
    *(_OWORD *)((char *)&v543[4] + 8) = v388;
    *(_OWORD *)((char *)&v543[1] + 8) = v388;
    *(_OWORD *)((char *)&v543[2] + 8) = v388;
    *(_QWORD *)&__dst[120] = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)((char *)v543 + 8) = v388;
    *(_OWORD *)&__dst[88] = v388;
    *(_OWORD *)&__dst[104] = v388;
    *(_OWORD *)&__dst[56] = v388;
    *(_OWORD *)&__dst[72] = v388;
    *(_OWORD *)&__dst[24] = v388;
    *(_OWORD *)&__dst[40] = v388;
    *(_QWORD *)&__dst[8] = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)__dst = v484;
    *(_QWORD *)&__dst[*(_QWORD *)(v484 - 24)] = v483;
    *(_QWORD *)&__dst[8] = 0;
    v389 = (std::ios_base *)&__dst[*(_QWORD *)(*(_QWORD *)__dst - 24)];
    std::ios_base::init(v389, &__dst[24]);
    v389[1].__vftable = 0;
    v389[1].__fmtflags_ = -1;
    *(_QWORD *)&__dst[16] = v482;
    *(_QWORD *)&__dst[*(_QWORD *)(v482 - 24) + 16] = v481;
    *(_QWORD *)__dst = v479;
    *(_QWORD *)&__dst[*(_QWORD *)(v479 - 24)] = v480;
    std::streambuf::basic_streambuf(&__dst[24]);
    memset(&__dst[88], 0, 32);
    *(_DWORD *)&__dst[120] = 24;
    if (SHIBYTE(v523) < 0)
    {
      sub_100002334(&__dst[88], (void *)v522, *((size_t *)&v522 + 1));
    }
    else
    {
      *(_OWORD *)&__dst[88] = v522;
      *(_QWORD *)&__dst[104] = v523;
    }
    sub_10000BCA8((uint64_t)&__dst[24]);
    v390 = 0;
    memset(v541, 0, 24);
    while (2)
    {
      if (v390 < 0)
      {
        *(_BYTE *)v541[0] = 0;
        v541[1] = 0;
      }
      else
      {
        LOBYTE(v541[0]) = 0;
        HIBYTE(v541[2]) = 0;
      }
      LOBYTE(v535) = -86;
      std::istream::sentry::sentry(&v535, __dst, 0);
      if (!(_BYTE)v535)
      {
        if ((__dst[*(_QWORD *)(*(_QWORD *)__dst - 24) + 32] & 5) != 0)
          goto LABEL_805;
LABEL_756:
        std::istream::unget(__dst);
        sub_1000039A8((uint64_t *)__dst, (uint64_t)v541);
        goto LABEL_805;
      }
      v392 = *(_QWORD **)&__dst[*(_QWORD *)(*(_QWORD *)__dst - 24) + 40];
      v393 = (_BYTE *)v392[3];
      if (v393 != (_BYTE *)v392[4])
      {
        v392[3] = v393 + 1;
        LOBYTE(v392) = *v393;
LABEL_751:
        v394 = 0;
        v395 = v392;
        goto LABEL_752;
      }
      LODWORD(v392) = (*(uint64_t (**)(_QWORD *))(*v392 + 80))(v392);
      if ((_DWORD)v392 != -1)
        goto LABEL_751;
      v394 = 6;
      v395 = 170;
LABEL_752:
      std::ios_base::clear((std::ios_base *)&__dst[*(_QWORD *)(*(_QWORD *)__dst - 24)], *(_DWORD *)&__dst[*(_QWORD *)(*(_QWORD *)__dst - 24) + 32] | v394);
      v396 = *(_QWORD *)(*(_QWORD *)__dst - 24);
      v397 = (const std::ios_base *)&__dst[v396];
      if ((__dst[v396 + 32] & 5) != 0)
        goto LABEL_805;
      if (v395 != 34)
        goto LABEL_756;
      *((_QWORD *)&v535 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v535 = &__dst[v396];
      fmtflags = v397->__fmtflags_;
      DWORD2(v535) = fmtflags;
      v399 = v397[1].__fmtflags_;
      if (v399 == -1)
      {
        std::ios_base::getloc(v397);
        v401 = std::locale::use_facet(v540, &std::ctype<char>::id);
        v399 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v401->__vftable[2].~facet_0)(v401, 32);
        std::locale::~locale(v540);
        v397[1].__fmtflags_ = v399;
        v396 = *(_QWORD *)(*(_QWORD *)__dst - 24);
        v400 = *(_DWORD *)&__dst[v396 + 8];
      }
      else
      {
        v400 = fmtflags;
      }
      BYTE12(v535) = v399;
      *(_DWORD *)&__dst[v396 + 8] = v400 & 0xFFFFEFFF;
      v402 = 34;
      while (1)
      {
        LOBYTE(v540[0].__locale_) = -86;
        std::istream::sentry::sentry(v540, __dst, 0);
        if (!LOBYTE(v540[0].__locale_))
          goto LABEL_768;
        v406 = *(_QWORD **)&__dst[*(_QWORD *)(*(_QWORD *)__dst - 24) + 40];
        v407 = (_BYTE *)v406[3];
        if (v407 == (_BYTE *)v406[4])
        {
          LODWORD(v406) = (*(uint64_t (**)(_QWORD *))(*v406 + 80))(v406);
          if ((_DWORD)v406 == -1)
          {
            v408 = 6;
            goto LABEL_767;
          }
        }
        else
        {
          v406[3] = v407 + 1;
          LOBYTE(v406) = *v407;
        }
        v408 = 0;
        v402 = (char)v406;
LABEL_767:
        std::ios_base::clear((std::ios_base *)&__dst[*(_QWORD *)(*(_QWORD *)__dst - 24)], *(_DWORD *)&__dst[*(_QWORD *)(*(_QWORD *)__dst - 24) + 32] | v408);
LABEL_768:
        if ((__dst[*(_QWORD *)(*(_QWORD *)__dst - 24) + 32] & 5) != 0)
          goto LABEL_802;
        if (v402 == 92)
          break;
        if (v402 == 34)
          goto LABEL_802;
LABEL_780:
        if ((SHIBYTE(v541[2]) & 0x80000000) == 0)
        {
          if (HIBYTE(v541[2]) != 22)
          {
            v403 = HIBYTE(v541[2]);
            HIBYTE(v541[2]) = (HIBYTE(v541[2]) + 1) & 0x7F;
            v404 = v541;
            goto LABEL_761;
          }
          v413 = v541;
          v403 = 22;
LABEL_786:
          if (v403 + 1 > 2 * v403)
            v415 = v403 + 1;
          else
            v415 = 2 * v403;
          v416 = (v415 & 0x7FFFFFFFFFFFFFF8) + 8;
          if ((v415 | 7) != 0x17)
            v416 = v415 | 7;
          if (v415 >= 0x17)
            v414 = v416 + 1;
          else
            v414 = 23;
LABEL_794:
          v417 = (void **)operator new(v414);
          v404 = v417;
          if (!v403 || (memmove(v417, v413, v403), v403 != 22))
            operator delete(v413);
          v541[0] = v404;
          v541[2] = (void *)(v414 | 0x8000000000000000);
          goto LABEL_799;
        }
        v403 = ((unint64_t)v541[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
        if (v541[1] == (void *)v403)
        {
          if (((unint64_t)v541[2] & 0x7FFFFFFFFFFFFFFFLL) == 0x7FFFFFFFFFFFFFF8)
            sub_10000163C();
          v413 = (void **)v541[0];
          v414 = 0x7FFFFFFFFFFFFFF7;
          if (v403 <= 0x3FFFFFFFFFFFFFF2)
            goto LABEL_786;
          goto LABEL_794;
        }
        v404 = (void **)v541[0];
        v403 = (size_t)v541[1];
LABEL_799:
        v541[1] = (void *)(v403 + 1);
LABEL_761:
        v405 = (char *)v404 + v403;
        *v405 = v402;
        v405[1] = 0;
      }
      LOBYTE(v540[0].__locale_) = -86;
      std::istream::sentry::sentry(v540, __dst, 0);
      if (LOBYTE(v540[0].__locale_))
      {
        v409 = *(_QWORD **)&__dst[*(_QWORD *)(*(_QWORD *)__dst - 24) + 40];
        v410 = (char *)v409[3];
        if (v410 != (char *)v409[4])
        {
          v409[3] = v410 + 1;
          v402 = *v410;
          goto LABEL_777;
        }
        v411 = (*(uint64_t (**)(_QWORD *))(*v409 + 80))(v409);
        v402 = v411;
        if (v411 == -1)
        {
          v412 = 6;
          v402 = 92;
        }
        else
        {
LABEL_777:
          v412 = 0;
        }
        std::ios_base::clear((std::ios_base *)&__dst[*(_QWORD *)(*(_QWORD *)__dst - 24)], *(_DWORD *)&__dst[*(_QWORD *)(*(_QWORD *)__dst - 24) + 32] | v412);
      }
      else
      {
        v402 = 92;
      }
      if ((__dst[*(_QWORD *)(*(_QWORD *)__dst - 24) + 32] & 5) == 0)
        goto LABEL_780;
LABEL_802:
      v397->__fmtflags_ = fmtflags;
      v3 = v495;
      if (v397[1].__fmtflags_ == -1)
      {
        std::ios_base::getloc(v397);
        v418 = std::locale::use_facet(v540, &std::ctype<char>::id);
        ((void (*)(const std::locale::facet *, uint64_t))v418->__vftable[2].~facet_0)(v418, 32);
        std::locale::~locale(v540);
      }
      v397[1].__fmtflags_ = (char)v399;
LABEL_805:
      if ((__dst[*(_QWORD *)(*(_QWORD *)__dst - 24) + 32] & 5) == 0)
      {
        v419 = (char *)operator new(0x28uLL);
        v420 = v419 + 16;
        *(_QWORD *)v419 = 0;
        *((_QWORD *)v419 + 1) = 0;
        if (SHIBYTE(v541[2]) < 0)
        {
          sub_1000016D4(v420, v541[0], (unint64_t)v541[1]);
        }
        else
        {
          *(_OWORD *)v420 = *(_OWORD *)v541;
          *((void **)v419 + 4) = v541[2];
        }
        v391 = v520;
        *(_QWORD *)v419 = &v519;
        *((_QWORD *)v419 + 1) = v391;
        *v391 = v419;
        v520 = v419;
        ++v521;
        v390 = HIBYTE(v541[2]);
        continue;
      }
      break;
    }
    memset(v540, 170, 24);
    if (*((char *)v519 + 39) < 0)
    {
      sub_1000016D4(v540, *((void **)v519 + 2), *((_QWORD *)v519 + 3));
    }
    else
    {
      *(_OWORD *)&v540[0].__locale_ = *((_OWORD *)v519 + 1);
      v540[2] = *(std::locale *)((char *)v519 + 32);
    }
    v421 = HIBYTE(v540[2].__locale_);
    if (SHIBYTE(v540[2].__locale_) >= 0)
      v422 = HIBYTE(v540[2].__locale_);
    else
      v422 = (int64_t)v540[1].__locale_;
    if (SHIBYTE(v540[2].__locale_) >= 0)
      v423 = (char *)v540;
    else
      v423 = (char *)v540[0].__locale_;
    if (v422 < 1)
      goto LABEL_862;
    v424 = &v423[v422];
    v425 = v423;
    while (1)
    {
      v426 = (char *)memchr(v425, 47, v422);
      if (!v426)
        goto LABEL_862;
      if (*v426 == 47)
        break;
      v425 = v426 + 1;
      v422 = v424 - (_BYTE *)v425;
      if (v424 - (_BYTE *)v425 < 1)
        goto LABEL_862;
    }
    if (v426 == v424 || v426 - v423 == -1)
      goto LABEL_862;
    v427 = (char *)v519;
    v428 = *(_QWORD *)v519;
    *(_QWORD *)(v428 + 8) = *((_QWORD *)v519 + 1);
    **((_QWORD **)v427 + 1) = v428;
    --v521;
    if (v427[39] < 0)
    {
      operator delete(*((void **)v427 + 2));
      operator delete(v427);
      v429 = HIBYTE(v540[2].__locale_);
      if (SHIBYTE(v540[2].__locale_) < 0)
        goto LABEL_834;
LABEL_827:
      if (v429)
      {
        if (LOBYTE(v540[0].__locale_) == 47)
        {
          v430 = (char *)&v540[0].__locale_ + 1;
          v431 = v429 - 1;
          if (v431 <= 0x7FFFFFFFFFFFFFF7)
            goto LABEL_837;
LABEL_919:
          sub_10000163C();
        }
LABEL_841:
        v433 = 0;
        goto LABEL_842;
      }
LABEL_918:
      sub_1000022AC();
    }
    operator delete(v427);
    v429 = HIBYTE(v540[2].__locale_);
    if ((SHIBYTE(v540[2].__locale_) & 0x80000000) == 0)
      goto LABEL_827;
LABEL_834:
    if (!v540[1].__locale_)
      goto LABEL_918;
    if (*(_BYTE *)v540[0].__locale_ != 47)
      goto LABEL_841;
    v430 = (char *)v540[0].__locale_ + 1;
    v431 = (size_t)v540[1].__locale_ - 1;
    if ((unint64_t)v540[1].__locale_ - 1 > 0x7FFFFFFFFFFFFFF7)
      goto LABEL_919;
LABEL_837:
    if (v431 >= 0x17)
    {
      v465 = (v431 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v431 | 7) != 0x17)
        v465 = v431 | 7;
      v466 = v465 + 1;
      v432 = (__int128 *)operator new(v465 + 1);
      *(_QWORD *)&v536[0] = v466 | 0x8000000000000000;
      *(_QWORD *)&v535 = v432;
      *((_QWORD *)&v535 + 1) = v431;
LABEL_894:
      memmove(v432, v430, v431);
      *((_BYTE *)v432 + v431) = 0;
      if (SHIBYTE(v540[2].__locale_) < 0)
        goto LABEL_895;
      goto LABEL_840;
    }
    BYTE7(v536[0]) = v431;
    v432 = &v535;
    if (v431)
      goto LABEL_894;
    LOBYTE(v535) = 0;
    if ((SHIBYTE(v540[2].__locale_) & 0x80000000) == 0)
      goto LABEL_840;
LABEL_895:
    operator delete(v540[0].__locale_);
LABEL_840:
    *(_OWORD *)&v540[0].__locale_ = v535;
    v540[2] = *(std::locale *)&v536[0];
    v433 = 1;
LABEL_842:
    *(_QWORD *)&v434 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v434 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v539[8] = v434;
    v539[9] = v434;
    v539[6] = v434;
    v539[7] = v434;
    v539[4] = v434;
    v539[5] = v434;
    v539[2] = v434;
    v539[3] = v434;
    v539[0] = v434;
    v539[1] = v434;
    v537 = v434;
    v538 = v434;
    v536[2] = v434;
    v536[3] = v434;
    v536[0] = v434;
    v536[1] = v434;
    v535 = v434;
    sub_100003560((uint64_t)&v535, (__int128 *)v540);
    v435 = 0;
    v533 = 0uLL;
    v534 = 0;
    *(_QWORD *)&v531 = &v531;
    *((_QWORD *)&v531 + 1) = &v531;
    while (1)
    {
      v532 = v435;
      v437 = sub_10000253C(&v535, (uint64_t)&v533, 0x2Fu);
      if ((*((_BYTE *)v437 + *(_QWORD *)(*v437 - 24) + 32) & 5) != 0)
        break;
      v438 = operator new(0x28uLL);
      v439 = v438 + 2;
      *v438 = 0;
      v438[1] = 0;
      if (SHIBYTE(v534) < 0)
      {
        sub_1000016D4(v439, (void *)v533, *((unint64_t *)&v533 + 1));
      }
      else
      {
        *(_OWORD *)v439 = v533;
        v438[4] = v534;
      }
      v436 = v531;
      *v438 = v531;
      v438[1] = &v531;
      *(_QWORD *)(v436 + 8) = v438;
      *(_QWORD *)&v531 = v438;
      v435 = v532 + 1;
    }
    while (1)
    {
      v440 = v532;
      if (!v532)
        break;
      v441 = (char *)v531;
      v442 = operator new(0x28uLL);
      v443 = v442 + 2;
      *v442 = 0;
      v442[1] = 0;
      if (v441[39] < 0)
      {
        sub_1000016D4(v443, *((void **)v441 + 2), *((_QWORD *)v441 + 3));
        v441 = (char *)v531;
        v440 = v532;
      }
      else
      {
        v444 = *((_OWORD *)v441 + 1);
        v442[4] = *((_QWORD *)v441 + 4);
        *(_OWORD *)v443 = v444;
      }
      v445 = v519;
      *v442 = v519;
      v442[1] = &v519;
      v445[1] = v442;
      v519 = v442;
      ++v521;
      v446 = *(_QWORD **)v441;
      v446[1] = *((_QWORD *)v441 + 1);
      **((_QWORD **)v441 + 1) = v446;
      v532 = v440 - 1;
      if (v441[39] < 0)
        operator delete(*((void **)v441 + 2));
      operator delete(v441);
    }
    if (v433)
    {
      v447 = operator new(0x28uLL);
      v447[2] = 47;
      *((_BYTE *)v447 + 39) = 1;
      v448 = v519;
      *v447 = v519;
      v447[1] = &v519;
      v448[1] = v447;
      v519 = v447;
      ++v521;
    }
    if (SHIBYTE(v534) < 0)
      operator delete((void *)v533);
    *(_QWORD *)&v535 = v486;
    *(_QWORD *)((char *)&v536[-1] + *(_QWORD *)(v486 - 24)) = v485;
    if (SBYTE7(v538) < 0)
      operator delete((void *)v537);
    std::streambuf::~streambuf(v536);
    std::ios::~ios((char *)v539 + 8);
    v421 = HIBYTE(v540[2].__locale_);
LABEL_862:
    if (v421 < 0)
    {
      operator delete(v540[0].__locale_);
      if (SHIBYTE(v541[2]) < 0)
        goto LABEL_890;
    }
    else
    {
      if ((SHIBYTE(v541[2]) & 0x80000000) == 0)
        goto LABEL_864;
LABEL_890:
      operator delete(v541[0]);
    }
LABEL_864:
    *(_QWORD *)__dst = v478;
    *(_QWORD *)&__dst[*(_QWORD *)(v478 - 24)] = v477;
    *(_QWORD *)&__dst[16] = v476;
    if ((__dst[111] & 0x80000000) != 0)
      operator delete(*(void **)&__dst[88]);
    std::streambuf::~streambuf(&__dst[24]);
    std::ios::~ios(v543);
    sub_100007B3C(&v497, (uint64_t)&v519);
    sub_100003CF4((uint64_t)__dst, &v497);
    v449 = (char *)v527[0];
    if (v527[0])
    {
      v450 = v527[1];
      v451 = v527[0];
      if (v527[1] != v527[0])
      {
        do
        {
          v452 = (char *)(v450 - 3);
          if (*(v450 - 1))
          {
            v453 = *(v450 - 3);
            v454 = (char *)*(v450 - 2);
            v455 = *(_QWORD *)v454;
            *(_QWORD *)(v455 + 8) = *(_QWORD *)(v453 + 8);
            **(_QWORD **)(v453 + 8) = v455;
            *(v450 - 1) = 0;
            if (v454 != v452)
            {
              do
              {
                v456 = (char *)*((_QWORD *)v454 + 1);
                if (v454[39] < 0)
                  operator delete(*((void **)v454 + 2));
                operator delete(v454);
                v454 = v456;
              }
              while (v456 != v452);
            }
          }
          v450 = v452;
        }
        while (v452 != v449);
        v451 = v527[0];
      }
      v527[1] = v449;
      operator delete(v451);
    }
    *(_OWORD *)v527 = *(_OWORD *)__dst;
    v527[2] = *(void **)&__dst[16];
    memset(__dst, 0, 24);
    if (v499)
    {
      v457 = v497;
      v458 = v498;
      v459 = *v498;
      *(_QWORD *)(v459 + 8) = *(_QWORD *)(v497 + 8);
      **(_QWORD **)(v457 + 8) = v459;
      v499 = 0;
      if (v458 != &v497)
      {
        do
        {
          v463 = (uint64_t *)v458[1];
          if (*((char *)v458 + 39) < 0)
            operator delete((void *)v458[2]);
          operator delete(v458);
          v458 = v463;
        }
        while (v463 != &v497);
      }
    }
    if (v521)
    {
      v460 = (void **)v520;
      v461 = (_QWORD **)v519;
      v462 = *(_QWORD *)v520;
      *(_QWORD *)(v462 + 8) = *((_QWORD *)v519 + 1);
      *v461[1] = v462;
      v521 = 0;
      if (v460 != &v519)
      {
        do
        {
          v464 = (void **)v460[1];
          if (*((char *)v460 + 39) < 0)
            operator delete(v460[2]);
          operator delete(v460);
          v460 = v464;
        }
        while (v464 != &v519);
      }
    }
    v40 = 0;
    if (SHIBYTE(v528[2]) < 0)
LABEL_832:
      operator delete(v528[0]);
LABEL_53:
    if (!v40)
      continue;
    break;
  }
  if (!v492)
    rl_bind_key(9, 0);
  if (SHIBYTE(v523) < 0)
    operator delete((void *)v522);
  v467 = (char *)v527[0];
  if (v527[0])
  {
    v468 = v527[1];
    v469 = v527[0];
    if (v527[1] != v527[0])
    {
      do
      {
        v470 = (char *)(v468 - 3);
        if (*(v468 - 1))
        {
          v471 = *(v468 - 3);
          v472 = (char *)*(v468 - 2);
          v473 = *(_QWORD *)v472;
          *(_QWORD *)(v473 + 8) = *(_QWORD *)(v471 + 8);
          **(_QWORD **)(v471 + 8) = v473;
          *(v468 - 1) = 0;
          if (v472 != v470)
          {
            do
            {
              v474 = (char *)*((_QWORD *)v472 + 1);
              if (v472[39] < 0)
                operator delete(*((void **)v472 + 2));
              operator delete(v472);
              v472 = v474;
            }
            while (v474 != v470);
          }
        }
        v468 = v470;
      }
      while (v470 != v467);
      v469 = v527[0];
    }
    v527[1] = v467;
    operator delete(v469);
  }
  LOBYTE(v15) = v491;
  return v15 & 1;
}

void sub_100007628(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  if (SLOBYTE(STACK[0x437]) < 0)
    operator delete((void *)STACK[0x420]);
  sub_1000037C0((uint64_t)&STACK[0x440]);
  sub_1000036BC((char *)&STACK[0x228]);
  if (SLOBYTE(STACK[0x2A7]) < 0)
    operator delete((void *)STACK[0x290]);
  if (SLOBYTE(STACK[0x257]) < 0)
    operator delete((void *)STACK[0x240]);
  sub_100004030((void **)&STACK[0x270]);
  _Unwind_Resume(a1);
}

_QWORD *sub_100007B3C(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;
  _QWORD *v6;
  __int128 v7;
  _QWORD *v8;
  _BYTE *v9;

  *a1 = a1;
  a1[1] = a1;
  a1[2] = 0;
  v3 = *(_QWORD *)(a2 + 8);
  if (v3 != a2)
  {
    v5 = 0;
    v6 = a1;
    do
    {
      v8 = operator new(0x28uLL);
      v9 = v8 + 2;
      *v8 = 0;
      v8[1] = 0;
      if (*(char *)(v3 + 39) < 0)
      {
        sub_1000016D4(v9, *(void **)(v3 + 16), *(_QWORD *)(v3 + 24));
        v6 = (_QWORD *)*a1;
        v5 = a1[2];
      }
      else
      {
        v7 = *(_OWORD *)(v3 + 16);
        v8[4] = *(_QWORD *)(v3 + 32);
        *(_OWORD *)v9 = v7;
      }
      *v8 = v6;
      v8[1] = a1;
      v6[1] = v8;
      *a1 = v8;
      a1[2] = ++v5;
      v3 = *(_QWORD *)(v3 + 8);
      v6 = v8;
    }
    while (v3 != a2);
  }
  return a1;
}

void sub_100007BF8(_Unwind_Exception *a1)
{
  char *v1;
  void *v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;

  operator delete(v2);
  if (*((_QWORD *)v1 + 2))
  {
    v4 = *(_QWORD *)v1;
    v5 = (char *)*((_QWORD *)v1 + 1);
    v6 = *(_QWORD *)v5;
    *(_QWORD *)(v6 + 8) = *(_QWORD *)(*(_QWORD *)v1 + 8);
    **(_QWORD **)(v4 + 8) = v6;
    *((_QWORD *)v1 + 2) = 0;
    if (v5 != v1)
    {
      do
      {
        v7 = (char *)*((_QWORD *)v5 + 1);
        if (v5[39] < 0)
          operator delete(*((void **)v5 + 2));
        operator delete(v5);
        v5 = v7;
      }
      while (v7 != v1);
    }
  }
  _Unwind_Resume(a1);
}

char *sub_100007C6C(void **a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v6;
  char *v7;
  _QWORD *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v24;
  char *v25;

  v2 = 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[1] - (_BYTE *)*a1) >> 3);
  v3 = v2 + 1;
  if (v2 + 1 > 0xAAAAAAAAAAAAAAALL)
    sub_100002298();
  if (0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) > v3)
    v3 = 0x5555555555555556 * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3);
  if (0xAAAAAAAAAAAAAAABLL * (((_BYTE *)a1[2] - (_BYTE *)*a1) >> 3) >= 0x555555555555555)
    v6 = 0xAAAAAAAAAAAAAAALL;
  else
    v6 = v3;
  if (v6)
  {
    if (v6 > 0xAAAAAAAAAAAAAAALL)
      sub_100002038();
    v7 = (char *)operator new(24 * v6);
  }
  else
  {
    v7 = 0;
  }
  v24 = &v7[24 * v2];
  v25 = &v7[24 * v6];
  sub_100007B3C(v24, a2);
  v8 = v24 + 24;
  v9 = (char *)*a1;
  v10 = (char *)a1[1];
  if (v10 == *a1)
  {
    *a1 = v24;
    a1[1] = v8;
    a1[2] = v25;
  }
  else
  {
    v11 = v24 - 24;
    do
    {
      *(_QWORD *)v11 = v11;
      *((_QWORD *)v11 + 1) = v11;
      *((_QWORD *)v11 + 2) = 0;
      v12 = *((_QWORD *)v10 - 1);
      if (v12)
      {
        v14 = *((_QWORD *)v10 - 3);
        v13 = (uint64_t *)*((_QWORD *)v10 - 2);
        v15 = *v13;
        *(_QWORD *)(v15 + 8) = *(_QWORD *)(v14 + 8);
        **(_QWORD **)(v14 + 8) = v15;
        v16 = *(_QWORD *)v11;
        *(_QWORD *)(v16 + 8) = v13;
        *v13 = v16;
        *(_QWORD *)v11 = v14;
        *(_QWORD *)(v14 + 8) = v11;
        *((_QWORD *)v11 + 2) = v12;
        *((_QWORD *)v10 - 1) = 0;
      }
      v10 -= 24;
      v11 -= 24;
    }
    while (v10 != v9);
    v10 = (char *)*a1;
    v17 = (char *)a1[1];
    *a1 = v11 + 24;
    a1[1] = v8;
    a1[2] = v25;
    if (v17 != v10)
    {
      do
      {
        v18 = v17 - 24;
        if (*((_QWORD *)v17 - 1))
        {
          v19 = *((_QWORD *)v17 - 3);
          v20 = (char *)*((_QWORD *)v17 - 2);
          v21 = *(_QWORD *)v20;
          *(_QWORD *)(v21 + 8) = *(_QWORD *)(v19 + 8);
          **(_QWORD **)(v19 + 8) = v21;
          *((_QWORD *)v17 - 1) = 0;
          if (v20 != v18)
          {
            do
            {
              v22 = (char *)*((_QWORD *)v20 + 1);
              if (v20[39] < 0)
                operator delete(*((void **)v20 + 2));
              operator delete(v20);
              v20 = v22;
            }
            while (v22 != v18);
          }
        }
        v17 = v18;
      }
      while (v18 != v10);
    }
  }
  if (v10)
    operator delete(v10);
  return v24 + 24;
}

void sub_100007E68(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_100007E7C((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_100007E7C(uint64_t a1)
{
  char *v2;
  char *v3;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;

  v3 = *(char **)(a1 + 8);
  v2 = *(char **)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      v5 = v2 - 24;
      *(_QWORD *)(a1 + 16) = v2 - 24;
      if (*((_QWORD *)v2 - 1))
      {
        v6 = *((_QWORD *)v2 - 3);
        v7 = (char *)*((_QWORD *)v2 - 2);
        v8 = *(_QWORD *)v7;
        *(_QWORD *)(v8 + 8) = *(_QWORD *)(v6 + 8);
        **(_QWORD **)(v6 + 8) = v8;
        *((_QWORD *)v2 - 1) = 0;
        if (v7 != v5)
        {
          do
          {
            v9 = (char *)*((_QWORD *)v7 + 1);
            if (v7[39] < 0)
              operator delete(*((void **)v7 + 2));
            operator delete(v7);
            v7 = v9;
          }
          while (v9 != v5);
          v5 = *(char **)(a1 + 16);
        }
      }
      v2 = v5;
    }
    while (v5 != v3);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

char **sub_100007F38(const char *a1)
{
  char **result;

  rl_attempted_completion_over = 0;
  result = rl_completion_matches(a1, (rl_compentry_func_t *)sub_100007F78);
  if (!result)
    rl_completion_append_character = 0;
  return result;
}

char *sub_100007F78(char *a1, int a2)
{
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  char *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  uint64_t v9;
  std::string *v10;
  void ***v11;
  void **v12;
  std::string::size_type v13;
  uint64_t v14;
  std::string *v15;
  size_t size;
  void **v17;
  void **v18;
  __int128 v19;
  char v20;
  __int128 *v21;
  size_t v22;
  void **v23;
  __int128 v24;
  __int128 *v25;
  size_t v26;
  void **v27;
  __int128 v28;
  __int128 *v29;
  size_t v30;
  void **v31;
  __int128 v32;
  __int128 *p_p;
  size_t v34;
  void **v35;
  _QWORD *v36;
  void ***v37;
  _QWORD *v38;
  _BYTE *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  void **v43;
  const void **v44;
  const void **v45;
  const void ***v46;
  uint64_t *v47;
  _QWORD *v48;
  _BYTE *v49;
  __int128 v50;
  void **v51;
  char *v52;
  char **v53;
  const void **v54;
  const void **v55;
  const void ***v56;
  uint64_t *v57;
  _QWORD *v58;
  _BYTE *v59;
  __int128 v60;
  void **v61;
  uint64_t *v62;
  uint64_t *v63;
  __objc2_class_ro *v64;
  uint64_t ivar_lyt;
  uint64_t v66;
  char *v67;
  size_t v68;
  char *v69;
  char *v70;
  unint64_t v71;
  size_t v72;
  _BYTE *v73;
  char *v74;
  char *v75;
  uint64_t v76;
  size_t v77;
  void *v78;
  void **v79;
  std::string *v80;
  _QWORD *v81;
  std::string *v83;
  _BYTE *v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  size_t v89;
  std::string::size_type v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  char *v95;
  void *v96;
  void **v97;
  unint64_t v98;
  char *v99;
  uint64_t v100;
  char *v101;
  int64_t v102;
  char *v103;
  void *v104;
  char *v105;
  void **v106;
  void ***v107;
  void **v108;
  std::__shared_weak_count *v109;
  void ***v110;
  _QWORD *v111;
  std::__shared_weak_count *v112;
  CommandBase *v113;
  const char *v114;
  unint64_t *v115;
  unint64_t v116;
  size_t v117;
  std::string::size_type v118;
  _BYTE *v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  char *v123;
  uint64_t v124;
  void *v125;
  void **v126;
  size_t v127;
  void *v128;
  size_t v129;
  std::string::size_type v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  std::string *v134;
  char *v135;
  char *v136;
  size_t v137;
  void *v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  void **v142;
  uint64_t v143;
  char v144;
  void *v145;
  size_t v146;
  CommandBase *v147;
  const void **v148;
  const void ***v149;
  void *v150;
  std::string::size_type v151;
  std::string::size_type v152;
  const void **v153;
  const void ***v154;
  std::string *v155;
  std::string::size_type v156;
  void **v157;
  void **v158;
  int v159;
  const void *v160;
  size_t v161;
  size_t v162;
  int v163;
  void **v164;
  void **v165;
  void **v166;
  int v167;
  void **v168;
  size_t v169;
  size_t v170;
  int v171;
  std::string::size_type v172;
  std::string *v173;
  std::__shared_weak_count *v174;
  uint64_t v175;
  unint64_t *p_shared_weak_owners;
  unint64_t v177;
  std::__shared_weak_count *v178;
  std::__shared_weak_count *v179;
  unint64_t *v180;
  unint64_t v181;
  CommandBase *v182;
  unint64_t *v183;
  unint64_t v184;
  std::__shared_weak_count *v185;
  CommandBase *v186;
  uint64_t **v187;
  uint64_t *v188;
  CommandBase *v189;
  unint64_t *v190;
  unint64_t v191;
  unint64_t *v192;
  unint64_t v193;
  std::__shared_weak_count *v194;
  unint64_t *v195;
  unint64_t v196;
  int v197;
  size_t v198;
  unint64_t v199;
  CommandBase *v200;
  uint64_t v201;
  uint64_t v202;
  std::string *v203;
  CommandBase **v204;
  std::string::size_type v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  _BYTE *v209;
  uint64_t v210;
  void **v211;
  std::string *v212;
  std::string::size_type v213;
  void **v214;
  int v215;
  const void *v216;
  size_t v217;
  size_t v218;
  int v219;
  void **v220;
  void **v221;
  void **v222;
  int v223;
  void **v224;
  size_t v225;
  size_t v226;
  int v227;
  std::string::size_type i;
  _BYTE *v229;
  __int128 v230;
  void **v231;
  _QWORD *v232;
  _BYTE *v233;
  std::string::size_type v234;
  std::string::size_type v235;
  uint64_t v236;
  std::string *v237;
  void **v238;
  int v239;
  size_t v240;
  int v241;
  size_t v242;
  unint64_t v243;
  char *v244;
  uint64_t v245;
  uint64_t v246;
  std::string *v247;
  char *v248;
  const void *v249;
  std::string *v250;
  std::string::size_type v251;
  char v252;
  _QWORD *v253;
  std::string::size_type v254;
  void **v255;
  void **v256;
  void **v257;
  std::string::size_type v258;
  int v259;
  size_t v260;
  int v261;
  size_t v262;
  unint64_t v263;
  char *v264;
  uint64_t v265;
  uint64_t v266;
  std::string *v267;
  char *v268;
  const void *v269;
  std::string *v270;
  std::string::size_type v271;
  char v272;
  _QWORD *v273;
  uint64_t v274;
  void **v275;
  std::string *v276;
  std::string *v277;
  std::__shared_weak_count *v278;
  unint64_t *v279;
  unint64_t v280;
  char *v281;
  char **v282;
  uint64_t v283;
  char *v284;
  int v285;
  char *v286;
  int v287;
  void **v288;
  void ***v289;
  void **v290;
  _QWORD *v291;
  const void **v292;
  const void ***v293;
  const void **v294;
  const void ***v295;
  void ***v296;
  std::string::size_type v297;
  char v298;
  char *v299;
  size_t v300;
  std::string *v301;
  int v302;
  const void *v303;
  size_t v304;
  size_t v305;
  int v306;
  size_t *v307;
  size_t *v308;
  std::string::size_type v309;
  int v310;
  size_t *v311;
  size_t v312;
  size_t v313;
  int v314;
  const void **v315;
  const void **v316;
  const void ***v317;
  char *v318;
  char v319;
  char *v320;
  size_t v321;
  std::string *v322;
  std::string::size_type v323;
  int v324;
  const void *v325;
  size_t v326;
  size_t v327;
  int v328;
  size_t *v329;
  size_t *v330;
  std::string::size_type v331;
  int v332;
  size_t *v333;
  size_t v334;
  size_t v335;
  int v336;
  uint64_t **v337;
  std::__shared_weak_count *v338;
  uint64_t *v339;
  unint64_t *v340;
  unint64_t v341;
  std::__shared_weak_count *v342;
  unint64_t *v343;
  unint64_t v344;
  uint64_t v345;
  const void **v346;
  const void ***v347;
  const void **v348;
  const void ***v349;
  void **v350;
  const void **v351;
  const void **v352;
  const void **v353;
  const void **v354;
  _QWORD *v355;
  _BYTE *v356;
  __int128 v357;
  void **v358;
  void **v359;
  void **v360;
  void **v361;
  char *v362;
  uint64_t v363;
  char v364;
  _QWORD *v365;
  _BYTE *v366;
  __int128 v367;
  void **v368;
  void **v369;
  void **v370;
  std::string::size_type v371;
  uint64_t v372;
  void **v373;
  void ***v374;
  void **v375;
  CommandBase *v376;
  void ***v377;
  char *v378;
  size_t v379;
  std::string::size_type v380;
  _BYTE *v381;
  uint64_t v382;
  uint64_t v383;
  void ***k;
  char *v385;
  std::string::size_type v386;
  std::string::size_type v387;
  std::string::size_type v388;
  std::string::size_type v389;
  size_t v390;
  void **v391;
  std::string *v392;
  int v393;
  BOOL v394;
  _OWORD *v395;
  __int128 v396;
  char *v397;
  char *v398;
  char **v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  char *v403;
  std::__shared_weak_count *v404;
  unint64_t *v405;
  unint64_t v406;
  void **v407;
  void ***v408;
  void **v409;
  void ***v411;
  std::string::size_type j;
  __int128 v413;
  void **v414;
  _QWORD *v415;
  _BYTE *v416;
  std::string::size_type v417;
  std::string::size_type v418;
  uint64_t v419;
  std::string *v420;
  _QWORD *v421;
  CommandBase *v422;
  CommandBase *v423;
  const char *v424;
  unint64_t *v425;
  unint64_t v426;
  size_t v427;
  std::string::size_type v428;
  _BYTE *v429;
  uint64_t v430;
  uint64_t v431;
  unint64_t v432;
  char *v433;
  uint64_t v434;
  std::string::size_type v435;
  std::string *v436;
  size_t v437;
  char *v438;
  size_t v439;
  std::string::size_type v440;
  void *v441;
  uint64_t v442;
  uint64_t v443;
  std::string *v444;
  char *v445;
  char *v446;
  size_t v447;
  size_t v448;
  _BYTE *v449;
  uint64_t v450;
  uint64_t v451;
  _OWORD *v452;
  std::string::size_type v453;
  CommandBase *v454;
  _QWORD *v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  const void *v459;
  size_t v460;
  _BYTE *v461;
  uint64_t *v462;
  int v463;
  uint64_t *v464;
  size_t v465;
  size_t v466;
  int v467;
  size_t *v468;
  size_t *v469;
  size_t *v470;
  int v471;
  size_t *v472;
  size_t v473;
  size_t v474;
  int v475;
  uint64_t v476;
  _WORD *v477;
  std::__shared_weak_count *v478;
  uint64_t v479;
  unint64_t *v480;
  unint64_t v481;
  std::__shared_weak_count *v482;
  std::__shared_weak_count *v483;
  unint64_t *v484;
  unint64_t v485;
  CommandBase *v486;
  unint64_t *v487;
  unint64_t v488;
  CommandBase *v489;
  CommandBase *v490;
  uint64_t **v491;
  CommandBase *v492;
  CommandBase *v493;
  unint64_t *v494;
  unint64_t v495;
  unint64_t *v496;
  unint64_t v497;
  std::__shared_weak_count *v498;
  unint64_t *v499;
  unint64_t v500;
  std::string::size_type v501;
  int v502;
  size_t v503;
  unint64_t v504;
  char *v505;
  uint64_t v506;
  uint64_t v507;
  const void *v508;
  void **v509;
  std::string::size_type v510;
  std::string::size_type v511;
  uint64_t v512;
  std::string::size_type v513;
  std::string::size_type v514;
  uint64_t v515;
  std::string::size_type v516;
  std::string::size_type *p_size;
  void **v518;
  CommandBase *v519;
  int v520;
  size_t v521;
  int v522;
  size_t v523;
  unint64_t v524;
  char *v525;
  std::string::size_type *v526;
  uint64_t v527;
  uint64_t v528;
  std::string *v529;
  char *v530;
  const void *v531;
  void **v532;
  std::string::size_type *v533;
  std::string::size_type *v534;
  std::string *v535;
  std::__shared_weak_count *v536;
  unint64_t *v537;
  unint64_t v538;
  char *v539;
  char **v540;
  uint64_t v541;
  char *v542;
  std::string::size_type v543;
  CommandBase *v544;
  CommandBase *v545;
  CommandBase *v546;
  int v547;
  char *__s;
  void *__dst[3];
  char *__str;
  char *v551;
  char *v552;
  char *v553;
  void *v554;
  unint64_t v555;
  uint64_t *v556;
  uint64_t v557[2];
  char **v558;
  char *v559[2];
  uint64_t v560;
  std::__shared_weak_count *v561;
  void **v562;
  void ***v563;
  CommandBase *v564;
  CommandBase *v565[3];
  CommandBase *v566;
  std::__shared_weak_count *v567;
  void *v568[3];
  std::string v569;
  void *v570[4];
  std::string v571;
  std::string v572;
  __int128 v573;
  void *v574;
  __int128 v575;
  void *v576;
  __int128 v577;
  void *v578;
  __int128 __p;
  void *v580;
  _BYTE v581[24];
  std::string v582;

  v562 = (void **)&v562;
  v563 = &v562;
  v564 = 0;
  if (!qword_1000202C8)
    return 0;
  v4 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_1000202C8);
  if (v4)
  {
    v5 = v4;
    v6 = (char *)qword_1000202C0;
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (v8)
    {
      if (!v6)
        goto LABEL_798;
LABEL_11:
      v560 = 0;
      v561 = 0;
      if (qword_1000202C8
        && (v561 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_1000202C8)) != 0)
      {
        v9 = qword_1000202C0;
        v560 = qword_1000202C0;
      }
      else
      {
        v9 = 0;
      }
      *((_BYTE *)&v572.__r_.__value_.__s + 23) = 2;
      strcpy((char *)&v572, "cd");
      HIBYTE(v574) = 2;
      strcpy((char *)&v573, "ls");
      HIBYTE(v576) = 7;
      strcpy((char *)&v575, "history");
      HIBYTE(v578) = 4;
      strcpy((char *)&v577, "help");
      HIBYTE(v580) = 4;
      strcpy((char *)&__p, "quit");
      v10 = &v572;
      v11 = v563;
      __s = a1;
      if (v563 == &v562)
      {
        v14 = 0;
      }
      else
      {
        v12 = (void **)(v563 + 2);
        if (v563 + 2 != (void ***)&v572)
        {
          if (*((char *)v563 + 39) < 0)
          {
            if ((v572.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v15 = &v572;
            else
              v15 = (std::string *)v572.__r_.__value_.__r.__words[0];
            if ((v572.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              size = HIBYTE(v572.__r_.__value_.__r.__words[2]);
            else
              size = v572.__r_.__value_.__l.__size_;
            sub_1000023F8(v12, v15, size);
          }
          else
          {
            v13 = v572.__r_.__value_.__r.__words[2];
            *(_OWORD *)v12 = *(_OWORD *)&v572.__r_.__value_.__l.__data_;
            v11[4] = (void **)v13;
          }
        }
        v17 = v11[1];
        if (v17 == (void **)&v562)
        {
          v20 = 0;
          v14 = 1;
        }
        else
        {
          v18 = v17 + 2;
          if (v17 + 2 != (void **)&v573)
          {
            if (*((char *)v17 + 39) < 0)
            {
              if (SHIBYTE(v574) >= 0)
                v21 = &v573;
              else
                v21 = (__int128 *)v573;
              if (SHIBYTE(v574) >= 0)
                v22 = HIBYTE(v574);
              else
                v22 = *((_QWORD *)&v573 + 1);
              sub_1000023F8(v18, v21, v22);
            }
            else if ((HIBYTE(v574) & 0x80) != 0)
            {
              sub_100002334(v18, (void *)v573, *((size_t *)&v573 + 1));
            }
            else
            {
              v19 = v573;
              v17[4] = v574;
              *(_OWORD *)v18 = v19;
            }
          }
          v17 = (void **)v17[1];
          if (v17 == (void **)&v562)
          {
            v20 = 0;
            v14 = 2;
          }
          else
          {
            v23 = v17 + 2;
            if (v17 + 2 != (void **)&v575)
            {
              if (*((char *)v17 + 39) < 0)
              {
                if (SHIBYTE(v576) >= 0)
                  v25 = &v575;
                else
                  v25 = (__int128 *)v575;
                if (SHIBYTE(v576) >= 0)
                  v26 = HIBYTE(v576);
                else
                  v26 = *((_QWORD *)&v575 + 1);
                sub_1000023F8(v23, v25, v26);
              }
              else if ((HIBYTE(v576) & 0x80) != 0)
              {
                sub_100002334(v23, (void *)v575, *((size_t *)&v575 + 1));
              }
              else
              {
                v24 = v575;
                v17[4] = v576;
                *(_OWORD *)v23 = v24;
              }
            }
            v17 = (void **)v17[1];
            if (v17 == (void **)&v562)
            {
              v20 = 0;
              v14 = 3;
            }
            else
            {
              v27 = v17 + 2;
              if (v17 + 2 != (void **)&v577)
              {
                if (*((char *)v17 + 39) < 0)
                {
                  if (SHIBYTE(v578) >= 0)
                    v29 = &v577;
                  else
                    v29 = (__int128 *)v577;
                  if (SHIBYTE(v578) >= 0)
                    v30 = HIBYTE(v578);
                  else
                    v30 = *((_QWORD *)&v577 + 1);
                  sub_1000023F8(v27, v29, v30);
                }
                else if ((HIBYTE(v578) & 0x80) != 0)
                {
                  sub_100002334(v27, (void *)v577, *((size_t *)&v577 + 1));
                }
                else
                {
                  v28 = v577;
                  v17[4] = v578;
                  *(_OWORD *)v27 = v28;
                }
              }
              v17 = (void **)v17[1];
              if (v17 == (void **)&v562)
              {
                v20 = 0;
                v14 = 4;
              }
              else
              {
                v31 = v17 + 2;
                if (v17 + 2 != (void **)&__p)
                {
                  if (*((char *)v17 + 39) < 0)
                  {
                    if (SHIBYTE(v580) >= 0)
                      p_p = &__p;
                    else
                      p_p = (__int128 *)__p;
                    if (SHIBYTE(v580) >= 0)
                      v34 = HIBYTE(v580);
                    else
                      v34 = *((_QWORD *)&__p + 1);
                    sub_1000023F8(v31, p_p, v34);
                  }
                  else if ((HIBYTE(v580) & 0x80) != 0)
                  {
                    sub_100002334(v31, (void *)__p, *((size_t *)&__p + 1));
                  }
                  else
                  {
                    v32 = __p;
                    v17[4] = v580;
                    *(_OWORD *)v31 = v32;
                  }
                }
                v17 = (void **)v17[1];
                v20 = 1;
                v14 = 5;
              }
            }
          }
        }
        if (v17 != (void **)&v562)
        {
          v35 = v562;
          v36 = *v17;
          v36[1] = v562[1];
          *(_QWORD *)v35[1] = v36;
          do
          {
            v37 = (void ***)v17[1];
            v564 = (CommandBase *)((char *)v564 - 1);
            if (*((char *)v17 + 39) < 0)
              operator delete(v17[2]);
            operator delete(v17);
            v17 = (void **)v37;
          }
          while (v37 != &v562);
LABEL_97:
          if (SHIBYTE(v580) < 0)
          {
            operator delete((void *)__p);
            if ((SHIBYTE(v578) & 0x80000000) == 0)
            {
LABEL_99:
              if ((SHIBYTE(v576) & 0x80000000) == 0)
                goto LABEL_100;
              goto LABEL_152;
            }
          }
          else if ((SHIBYTE(v578) & 0x80000000) == 0)
          {
            goto LABEL_99;
          }
          operator delete((void *)v577);
          if ((SHIBYTE(v576) & 0x80000000) == 0)
          {
LABEL_100:
            if ((SHIBYTE(v574) & 0x80000000) == 0)
              goto LABEL_101;
            goto LABEL_153;
          }
LABEL_152:
          operator delete((void *)v575);
          if ((SHIBYTE(v574) & 0x80000000) == 0)
          {
LABEL_101:
            if ((SHIBYTE(v572.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            {
LABEL_102:
              v559[0] = 0;
              v559[1] = 0;
              v558 = v559;
              v44 = *(const void ***)(v9 + 88);
              if (v44 != (const void **)(v9 + 96))
              {
                do
                {
                  sub_1000102CC((uint64_t **)&v558, (uint64_t *)v559, v44 + 4, (uint64_t)(v44 + 4));
                  v45 = (const void **)v44[1];
                  if (v45)
                  {
                    do
                    {
                      v46 = (const void ***)v45;
                      v45 = (const void **)*v45;
                    }
                    while (v45);
                  }
                  else
                  {
                    do
                    {
                      v46 = (const void ***)v44[2];
                      v394 = *v46 == v44;
                      v44 = (const void **)v46;
                    }
                    while (!v394);
                  }
                  v44 = (const void **)v46;
                }
                while (v46 != (const void ***)(v9 + 96));
                v47 = (uint64_t *)v558;
                if (v558 != v559)
                {
                  do
                  {
                    v48 = operator new(0x28uLL);
                    v49 = v48 + 2;
                    *v48 = 0;
                    v48[1] = 0;
                    if (*((char *)v47 + 55) < 0)
                    {
                      sub_1000016D4(v49, (void *)v47[4], v47[5]);
                    }
                    else
                    {
                      v50 = *((_OWORD *)v47 + 2);
                      v48[4] = v47[6];
                      *(_OWORD *)v49 = v50;
                    }
                    v51 = v562;
                    *v48 = v562;
                    v48[1] = &v562;
                    v51[1] = v48;
                    v562 = (void **)v48;
                    v564 = (CommandBase *)((char *)v564 + 1);
                    v52 = (char *)v47[1];
                    if (v52)
                    {
                      do
                      {
                        v53 = (char **)v52;
                        v52 = *(char **)v52;
                      }
                      while (v52);
                    }
                    else
                    {
                      do
                      {
                        v53 = (char **)v47[2];
                        v394 = *v53 == (char *)v47;
                        v47 = (uint64_t *)v53;
                      }
                      while (!v394);
                    }
                    v47 = (uint64_t *)v53;
                  }
                  while (v53 != v559);
                }
              }
              v557[0] = 0;
              v557[1] = 0;
              v556 = v557;
              v54 = *(const void ***)(v9 + 160);
              if (v54 != (const void **)(v9 + 168))
              {
                do
                {
                  sub_100010770(&v556, v557, v54 + 4, (uint64_t)(v54 + 4));
                  v55 = (const void **)v54[1];
                  if (v55)
                  {
                    do
                    {
                      v56 = (const void ***)v55;
                      v55 = (const void **)*v55;
                    }
                    while (v55);
                  }
                  else
                  {
                    do
                    {
                      v56 = (const void ***)v54[2];
                      v394 = *v56 == v54;
                      v54 = (const void **)v56;
                    }
                    while (!v394);
                  }
                  v54 = (const void **)v56;
                }
                while (v56 != (const void ***)(v9 + 168));
                v57 = v556;
                if (v556 != v557)
                {
                  do
                  {
                    v58 = operator new(0x28uLL);
                    v59 = v58 + 2;
                    *v58 = 0;
                    v58[1] = 0;
                    if (*((char *)v57 + 55) < 0)
                    {
                      sub_1000016D4(v59, (void *)v57[4], v57[5]);
                    }
                    else
                    {
                      v60 = *((_OWORD *)v57 + 2);
                      v58[4] = v57[6];
                      *(_OWORD *)v59 = v60;
                    }
                    v61 = v562;
                    *v58 = v562;
                    v58[1] = &v562;
                    v61[1] = v58;
                    v562 = (void **)v58;
                    v564 = (CommandBase *)((char *)v564 + 1);
                    v62 = (uint64_t *)v57[1];
                    if (v62)
                    {
                      do
                      {
                        v63 = v62;
                        v62 = (uint64_t *)*v62;
                      }
                      while (v62);
                    }
                    else
                    {
                      do
                      {
                        v63 = (uint64_t *)v57[2];
                        v394 = *v63 == (_QWORD)v57;
                        v57 = v63;
                      }
                      while (!v394);
                    }
                    v57 = v63;
                  }
                  while (v63 != v557);
                }
              }
              v64 = &OsLogStream__metaData;
              ivar_lyt = qword_1000202E0;
              if (a2)
                goto LABEL_785;
              rl_completion_append_character = 32;
              v66 = qword_1000202D8;
              while (ivar_lyt != v66)
              {
                if (*(char *)(ivar_lyt - 1) < 0)
                  operator delete(*(void **)(ivar_lyt - 24));
                ivar_lyt -= 24;
              }
              qword_1000202E0 = v66;
              qword_1000202D0 = 0;
              v553 = (char *)&v553;
              v554 = &v553;
              v555 = 0;
              v67 = rl_line_buffer;
              v68 = rl_end;
              v551 = 0;
              v552 = 0;
              __str = 0;
              if (rl_end)
              {
                if (rl_end < 0)
                  sub_100002298();
                v69 = (char *)operator new(rl_end);
                __str = v69;
                v70 = &v69[v68];
                v552 = &v69[v68];
                memcpy(v69, v67, v68);
                v551 = &v69[v68];
                v71 = v68 + 1;
                if ((uint64_t)(v68 + 1) < 0)
                  sub_100002298();
              }
              else
              {
                v69 = 0;
                v70 = 0;
                v68 = 0;
                v71 = 1;
              }
              if (2 * v68 > v71)
                v71 = 2 * v68;
              if (v68 >= 0x3FFFFFFFFFFFFFFFLL)
                v72 = 0x7FFFFFFFFFFFFFFFLL;
              else
                v72 = v71;
              if (v72)
              {
                v73 = operator new(v72);
                v74 = &v73[v68];
                v75 = &v73[v72];
                v73[v68] = 0;
                v76 = (uint64_t)&v73[v68 + 1];
                if (v70 != v69)
                  goto LABEL_165;
              }
              else
              {
                v73 = 0;
                v74 = (char *)v68;
                v75 = 0;
                *(_BYTE *)v68 = 0;
                v76 = v68 + 1;
                if (v70 != v69)
                {
LABEL_165:
                  memcpy(v73, v69, v68);
                  __str = v73;
                  v551 = (char *)v76;
                  v552 = v75;
                  if (!v69)
                    goto LABEL_167;
                  goto LABEL_166;
                }
              }
              v73 = v74;
              __str = v74;
              v551 = (char *)v76;
              v552 = v75;
              if (!v69)
              {
LABEL_167:
                v551 = (char *)v76;
                memset(__dst, 170, sizeof(__dst));
                v77 = strlen(v73);
                if (v77 > 0x7FFFFFFFFFFFFFF7)
                  sub_10000163C();
                v78 = (void *)v77;
                if (v77 >= 0x17)
                {
                  v85 = (v77 & 0xFFFFFFFFFFFFFFF8) + 8;
                  if ((v77 | 7) != 0x17)
                    v85 = v77 | 7;
                  v86 = v85 + 1;
                  v79 = (void **)operator new(v85 + 1);
                  __dst[1] = v78;
                  __dst[2] = (void *)(v86 | 0x8000000000000000);
                  __dst[0] = v79;
                }
                else
                {
                  HIBYTE(__dst[2]) = v77;
                  v79 = __dst;
                  if (!v77)
                  {
LABEL_180:
                    *((_BYTE *)v78 + (_QWORD)v79) = 0;
                    v87 = strtok(__str, " ");
                    if (v87)
                    {
                      v88 = v87;
                      do
                      {
                        v89 = strlen(v88);
                        if (v89 > 0x7FFFFFFFFFFFFFF7)
                          sub_10000163C();
                        v90 = v89;
                        if (v89 >= 0x17)
                        {
                          v92 = (v89 & 0xFFFFFFFFFFFFFFF8) + 8;
                          if ((v89 | 7) != 0x17)
                            v92 = v89 | 7;
                          v93 = v92 + 1;
                          v91 = operator new(v92 + 1);
                          v572.__r_.__value_.__l.__size_ = v90;
                          v572.__r_.__value_.__r.__words[2] = v93 | 0x8000000000000000;
                          v572.__r_.__value_.__r.__words[0] = (std::string::size_type)v91;
                        }
                        else
                        {
                          *((_BYTE *)&v572.__r_.__value_.__s + 23) = v89;
                          v91 = &v572;
                          if (!v89)
                            goto LABEL_190;
                        }
                        memmove(v91, v88, v90);
LABEL_190:
                        *((_BYTE *)v91 + v90) = 0;
                        v94 = (char *)operator new(0x28uLL);
                        *(std::string *)(v94 + 16) = v572;
                        v95 = v553;
                        *(_QWORD *)v94 = v553;
                        *((_QWORD *)v94 + 1) = &v553;
                        *((_QWORD *)v95 + 1) = v94;
                        v553 = v94;
                        ++v555;
                        v88 = strtok(0, " ");
                      }
                      while (v88);
                    }
                    if (SHIBYTE(__dst[2]) < 0)
                    {
                      v96 = __dst[1];
                      if (__dst[1])
                      {
LABEL_200:
                        v97 = __dst;
                        if (SHIBYTE(__dst[2]) < 0)
                          v97 = (void **)__dst[0];
                        v547 = *((unsigned __int8 *)v97 + (_QWORD)v96 - 1) == 32;
                        v98 = v555;
                        if (!v555)
                          goto LABEL_736;
LABEL_205:
                        v99 = (char *)v554;
                        LODWORD(v100) = *((char *)v554 + 39);
                        if ((v100 & 0x80000000) != 0)
                        {
                          v101 = (char *)*((_QWORD *)v554 + 2);
                          v102 = *((_QWORD *)v554 + 3);
                          if (v102 < 1)
                            goto LABEL_554;
                        }
                        else
                        {
                          v101 = (char *)v554 + 16;
                          v102 = *((unsigned __int8 *)v554 + 39);
                          if (!*((_BYTE *)v554 + 39))
                            goto LABEL_554;
                        }
                        v103 = &v101[v102];
                        v104 = v101;
                        while (1)
                        {
                          v105 = (char *)memchr(v104, 47, v102);
                          if (!v105)
                            goto LABEL_552;
                          if (*v105 == 47)
                            break;
                          v104 = v105 + 1;
                          v102 = v103 - (_BYTE *)v104;
                          if (v103 - (_BYTE *)v104 < 1)
                            goto LABEL_552;
                        }
                        if (v105 != v103 && v105 - v101 != -1)
                        {
                          if (v564)
                          {
                            v106 = v562;
                            v107 = v563;
                            v108 = *v563;
                            v108[1] = v562[1];
                            *(_QWORD *)v106[1] = v108;
                            v564 = 0;
                            if (v107 != &v562)
                            {
                              do
                              {
                                v110 = (void ***)v107[1];
                                if (*((char *)v107 + 39) < 0)
                                  operator delete(v107[2]);
                                operator delete(v107);
                                v107 = v110;
                              }
                              while (v110 != &v562);
                            }
                          }
                          rl_completion_append_character = 0;
                          rl_attempted_completion_over = 1;
                          v566 = 0;
                          v567 = 0;
                          if (qword_1000202C8)
                          {
                            v109 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_1000202C8);
                            v567 = v109;
                            if (v109)
                              v566 = (CommandBase *)qword_1000202C0;
                          }
                          else
                          {
                            v109 = 0;
                          }
                          v111 = (char *)v554 + 16;
                          if (*((char *)v554 + 39) < 0)
                          {
                            if (!*((_QWORD *)v554 + 3))
                              goto LABEL_235;
                            v111 = (_QWORD *)*v111;
                          }
                          else if (!*((_BYTE *)v554 + 39))
                          {
                            goto LABEL_235;
                          }
                          if (*(_BYTE *)v111 == 47)
                          {
                            v112 = (std::__shared_weak_count *)qword_1000202B8;
                            if (qword_1000202B8)
                            {
                              v112 = std::__shared_weak_count::lock((std::__shared_weak_count *)qword_1000202B8);
                              v113 = (CommandBase *)qword_1000202B0;
                              if (!v112)
                                v113 = 0;
                            }
                            else
                            {
                              v113 = 0;
                            }
                            v566 = v113;
                            v567 = v112;
                            if (v109)
                            {
                              v115 = (unint64_t *)&v109->__shared_owners_;
                              do
                                v116 = __ldaxr(v115);
                              while (__stlxr(v116 - 1, v115));
                              if (!v116)
                              {
                                ((void (*)(std::__shared_weak_count *))v109->__on_zero_shared)(v109);
                                std::__shared_weak_count::__release_weak(v109);
                              }
                            }
                            v114 = "/";
LABEL_243:
                            memset(&v572, 0, sizeof(v572));
                            memset(&v571, 170, sizeof(v571));
                            v117 = strlen(v114);
                            if (v117 > 0x7FFFFFFFFFFFFFF7)
                              sub_10000163C();
                            v118 = v117;
                            if (v117 >= 0x17)
                            {
                              v120 = (v117 & 0xFFFFFFFFFFFFFFF8) + 8;
                              if ((v117 | 7) != 0x17)
                                v120 = v117 | 7;
                              v121 = v120 + 1;
                              v119 = operator new(v120 + 1);
                              v571.__r_.__value_.__l.__size_ = v118;
                              v571.__r_.__value_.__r.__words[2] = v121 | 0x8000000000000000;
                              v571.__r_.__value_.__r.__words[0] = (std::string::size_type)v119;
                            }
                            else
                            {
                              *((_BYTE *)&v571.__r_.__value_.__s + 23) = v117;
                              v119 = &v571;
                              if (!v117)
                              {
LABEL_251:
                                v119[v118] = 0;
                                v122 = v555;
                                if (!v555)
                                  goto LABEL_416;
                                memset(v570, 170, 24);
                                v123 = (char *)v554;
                                if (*((char *)v554 + 39) < 0)
                                {
                                  sub_1000016D4(v570, *((void **)v554 + 2), *((_QWORD *)v554 + 3));
                                  v123 = (char *)v554;
                                  v122 = v555;
                                }
                                else
                                {
                                  *(_OWORD *)v570 = *((_OWORD *)v554 + 1);
                                  v570[2] = *((void **)v554 + 4);
                                }
                                v124 = *(_QWORD *)v123;
                                *(_QWORD *)(v124 + 8) = *((_QWORD *)v123 + 1);
                                **((_QWORD **)v123 + 1) = v124;
                                v555 = v122 - 1;
                                if (v123[39] < 0)
                                  operator delete(*((void **)v123 + 2));
                                operator delete(v123);
                                if (SHIBYTE(v570[2]) < 0)
                                {
                                  v126 = (void **)v570[0];
                                  v125 = v570[1];
                                }
                                else
                                {
                                  v125 = (void *)HIBYTE(v570[2]);
                                  v126 = v570;
                                }
                                memset(&v569, 0, sizeof(v569));
                                v127 = (size_t)v125 + 1;
                                if ((uint64_t)v125 + 1 < 0)
                                  sub_100002298();
                                v128 = operator new((size_t)v125 + 1);
                                v569.__r_.__value_.__r.__words[0] = (std::string::size_type)v128;
                                v569.__r_.__value_.__r.__words[2] = (std::string::size_type)v128 + v127;
                                memcpy(v128, v126, v127);
                                v569.__r_.__value_.__l.__size_ = (std::string::size_type)v128 + v127;
                                memset(&v582, 170, sizeof(v582));
                                v129 = strlen((const char *)v128);
                                if (v129 > 0x7FFFFFFFFFFFFFF7)
                                  sub_10000163C();
                                v130 = v129;
                                if (v129 >= 0x17)
                                {
                                  v132 = (v129 & 0xFFFFFFFFFFFFFFF8) + 8;
                                  if ((v129 | 7) != 0x17)
                                    v132 = v129 | 7;
                                  v133 = v132 + 1;
                                  v131 = operator new(v132 + 1);
                                  v582.__r_.__value_.__l.__size_ = v130;
                                  v582.__r_.__value_.__r.__words[2] = v133 | 0x8000000000000000;
                                  v582.__r_.__value_.__r.__words[0] = (std::string::size_type)v131;
                                }
                                else
                                {
                                  *((_BYTE *)&v582.__r_.__value_.__s + 23) = v129;
                                  v131 = &v582;
                                  if (!v129)
                                    goto LABEL_269;
                                }
                                memcpy(v131, v128, v130);
LABEL_269:
                                *((_BYTE *)v131 + v130) = 0;
                                *(_QWORD *)v581 = v581;
                                *(_QWORD *)&v581[8] = v581;
                                *(_QWORD *)&v581[16] = 0;
                                if ((v582.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                                  v134 = &v582;
                                else
                                  v134 = (std::string *)v582.__r_.__value_.__r.__words[0];
                                v135 = strtok((char *)v134, "/");
                                if (v135)
                                {
                                  v136 = v135;
                                  do
                                  {
                                    v137 = strlen(v136);
                                    if (v137 > 0x7FFFFFFFFFFFFFF7)
                                      sub_10000163C();
                                    v138 = (void *)v137;
                                    if (v137 >= 0x17)
                                    {
                                      v140 = (v137 & 0xFFFFFFFFFFFFFFF8) + 8;
                                      if ((v137 | 7) != 0x17)
                                        v140 = v137 | 7;
                                      v141 = v140 + 1;
                                      v139 = operator new(v140 + 1);
                                      v568[1] = v138;
                                      v568[2] = (void *)(v141 | 0x8000000000000000);
                                      v568[0] = v139;
                                    }
                                    else
                                    {
                                      HIBYTE(v568[2]) = v137;
                                      v139 = v568;
                                      if (!v137)
                                        goto LABEL_282;
                                    }
                                    memmove(v139, v136, (size_t)v138);
LABEL_282:
                                    *((_BYTE *)v138 + (_QWORD)v139) = 0;
                                    v142 = (void **)operator new(0x28uLL);
                                    *((_OWORD *)v142 + 1) = *(_OWORD *)v568;
                                    v142[4] = v568[2];
                                    v143 = *(_QWORD *)v581;
                                    *v142 = *(void **)v581;
                                    v142[1] = v581;
                                    *(_QWORD *)(v143 + 8) = v142;
                                    *(_QWORD *)v581 = v142;
                                    ++*(_QWORD *)&v581[16];
                                    v136 = strtok(0, "/");
                                  }
                                  while (v136);
                                }
                                if (!*(_QWORD *)&v581[16])
                                  goto LABEL_410;
                                while (1)
                                {
                                  if (&v572 != (std::string *)(*(_QWORD *)&v581[8] + 16))
                                  {
                                    v144 = *(_BYTE *)(*(_QWORD *)&v581[8] + 39);
                                    if (SHIBYTE(v572.__r_.__value_.__r.__words[2]) < 0)
                                    {
                                      if (v144 >= 0)
                                        v145 = (void *)(*(_QWORD *)&v581[8] + 16);
                                      else
                                        v145 = *(void **)(*(_QWORD *)&v581[8] + 16);
                                      if (v144 >= 0)
                                        v146 = *(unsigned __int8 *)(*(_QWORD *)&v581[8] + 39);
                                      else
                                        v146 = *(_QWORD *)(*(_QWORD *)&v581[8] + 24);
                                      sub_1000023F8((void **)&v572.__r_.__value_.__l.__data_, v145, v146);
                                    }
                                    else if ((*(_BYTE *)(*(_QWORD *)&v581[8] + 39) & 0x80) != 0)
                                    {
                                      sub_100002334(&v572, *(void **)(*(_QWORD *)&v581[8] + 16), *(_QWORD *)(*(_QWORD *)&v581[8] + 24));
                                    }
                                    else
                                    {
                                      v572 = *(std::string *)(*(_QWORD *)&v581[8] + 16);
                                    }
                                  }
                                  v147 = v566;
                                  v568[1] = 0;
                                  v568[2] = 0;
                                  v568[0] = &v568[1];
                                  v148 = (const void **)*((_QWORD *)v566 + 20);
                                  v149 = (const void ***)((char *)v566 + 168);
                                  if (v148 == (const void **)((char *)v566 + 168))
                                  {
                                    v150 = 0;
                                    v151 = HIBYTE(v572.__r_.__value_.__r.__words[2]);
                                    v152 = v572.__r_.__value_.__l.__size_;
                                    goto LABEL_345;
                                  }
                                  do
                                  {
                                    sub_100010770((uint64_t **)v568, (uint64_t *)&v568[1], v148 + 4, (uint64_t)(v148 + 4));
                                    v153 = (const void **)v148[1];
                                    if (v153)
                                    {
                                      do
                                      {
                                        v154 = (const void ***)v153;
                                        v153 = (const void **)*v153;
                                      }
                                      while (v153);
                                    }
                                    else
                                    {
                                      do
                                      {
                                        v154 = (const void ***)v148[2];
                                        v394 = *v154 == v148;
                                        v148 = (const void **)v154;
                                      }
                                      while (!v394);
                                    }
                                    v148 = (const void **)v154;
                                  }
                                  while (v154 != v149);
                                  v150 = v568[1];
                                  v151 = HIBYTE(v572.__r_.__value_.__r.__words[2]);
                                  v152 = v572.__r_.__value_.__l.__size_;
                                  if (v568[1])
                                  {
                                    if ((v572.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                                      v155 = &v572;
                                    else
                                      v155 = (std::string *)v572.__r_.__value_.__r.__words[0];
                                    if ((v572.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                                      v156 = HIBYTE(v572.__r_.__value_.__r.__words[2]);
                                    else
                                      v156 = v572.__r_.__value_.__l.__size_;
                                    v157 = &v568[1];
                                    v158 = (void **)v568[1];
                                    while (1)
                                    {
                                      v159 = *((char *)v158 + 55);
                                      if (v159 >= 0)
                                        v160 = v158 + 4;
                                      else
                                        v160 = v158[4];
                                      if (v159 >= 0)
                                        v161 = *((unsigned __int8 *)v158 + 55);
                                      else
                                        v161 = (size_t)v158[5];
                                      if (v156 >= v161)
                                        v162 = v161;
                                      else
                                        v162 = v156;
                                      v163 = memcmp(v160, v155, v162);
                                      if (v163)
                                      {
                                        if (v163 < 0)
                                          goto LABEL_315;
LABEL_329:
                                        v157 = v158;
                                        v158 = (void **)*v158;
                                        if (!v158)
                                        {
LABEL_330:
                                          if (v157 == &v568[1])
                                          {
                                            v64 = &OsLogStream__metaData;
                                            break;
                                          }
                                          v166 = (void **)v157[4];
                                          v165 = v157 + 4;
                                          v164 = v166;
                                          v167 = *((char *)v165 + 23);
                                          if (v167 >= 0)
                                            v168 = v165;
                                          else
                                            v168 = v164;
                                          if (v167 >= 0)
                                            v169 = *((unsigned __int8 *)v165 + 23);
                                          else
                                            v169 = (size_t)v165[1];
                                          if (v169 >= v156)
                                            v170 = v156;
                                          else
                                            v170 = v169;
                                          v171 = memcmp(v155, v168, v170);
                                          v64 = &OsLogStream__metaData;
                                          if (v171)
                                          {
                                            if (v171 < 0)
                                              break;
                                          }
                                          else if (v156 < v169)
                                          {
                                            break;
                                          }
                                          v565[0] = (CommandBase *)&v572;
                                          v187 = sub_10000B88C((uint64_t **)v568, (const void **)&v572.__r_.__value_.__l.__data_, (uint64_t)&std::piecewise_construct, (__int128 **)v565);
                                          v189 = (CommandBase *)v187[7];
                                          v188 = v187[8];
                                          if (v188)
                                          {
                                            v190 = (unint64_t *)(v188 + 1);
                                            do
                                              v191 = __ldxr(v190);
                                            while (__stxr(v191 + 1, v190));
                                          }
                                          v174 = v567;
                                          v566 = v189;
                                          v567 = (std::__shared_weak_count *)v188;
                                          if (v174)
                                          {
                                            v192 = (unint64_t *)&v174->__shared_owners_;
                                            do
                                              v193 = __ldaxr(v192);
                                            while (__stlxr(v193 - 1, v192));
                                            if (!v193)
                                            {
                                              ((void (*)(std::__shared_weak_count *))v174->__on_zero_shared)(v174);
                                              goto LABEL_383;
                                            }
                                          }
                                          goto LABEL_384;
                                        }
                                      }
                                      else
                                      {
                                        if (v161 >= v156)
                                          goto LABEL_329;
LABEL_315:
                                        v158 = (void **)v158[1];
                                        if (!v158)
                                          goto LABEL_330;
                                      }
                                    }
                                  }
LABEL_345:
                                  if ((v151 & 0x80u) == 0)
                                    v172 = v151;
                                  else
                                    v172 = v152;
                                  if (v172 != 2
                                    || ((v151 & 0x80u) == 0
                                      ? (v173 = &v572)
                                      : (v173 = (std::string *)v572.__r_.__value_.__r.__words[0]),
                                        LOWORD(v173->__r_.__value_.__l.__data_) != 11822))
                                  {
                                    sub_10000BA78((uint64_t)v568, (uint64_t)v150);
                                    if (*(_QWORD *)&v581[16])
                                    {
                                      v208 = *(_QWORD *)v581;
                                      v209 = *(_BYTE **)&v581[8];
                                      v210 = **(_QWORD **)&v581[8];
                                      *(_QWORD *)(v210 + 8) = *(_QWORD *)(*(_QWORD *)v581 + 8);
                                      **(_QWORD **)(v208 + 8) = v210;
                                      *(_QWORD *)&v581[16] = 0;
                                      if (v209 != v581)
                                      {
                                        do
                                        {
                                          v229 = (_BYTE *)*((_QWORD *)v209 + 1);
                                          if ((char)v209[39] < 0)
                                            operator delete(*((void **)v209 + 2));
                                          operator delete(v209);
                                          v209 = v229;
                                        }
                                        while (v229 != v581);
                                      }
                                    }
LABEL_410:
                                    if (SHIBYTE(v582.__r_.__value_.__r.__words[2]) < 0)
                                      operator delete(v582.__r_.__value_.__l.__data_);
                                    if (v569.__r_.__value_.__r.__words[0])
                                    {
                                      v569.__r_.__value_.__l.__size_ = v569.__r_.__value_.__r.__words[0];
                                      operator delete(v569.__r_.__value_.__l.__data_);
                                    }
                                    if (SHIBYTE(v570[2]) < 0)
                                      operator delete(v570[0]);
LABEL_416:
                                    memset(v570, 170, 24);
                                    v544 = v566;
                                    CommandBase::getCommandSet(v566, (uint64_t)v570);
                                    if (((v555 == 0) & ~v547) != 0)
                                      goto LABEL_468;
                                    v211 = (void **)v570[1];
                                    if (!v570[1])
                                      goto LABEL_468;
                                    if ((v572.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                                      v212 = &v572;
                                    else
                                      v212 = (std::string *)v572.__r_.__value_.__r.__words[0];
                                    if ((v572.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                                      v213 = HIBYTE(v572.__r_.__value_.__r.__words[2]);
                                    else
                                      v213 = v572.__r_.__value_.__l.__size_;
                                    v214 = &v570[1];
                                    while (1)
                                    {
                                      v215 = *((char *)v211 + 55);
                                      if (v215 >= 0)
                                        v216 = v211 + 4;
                                      else
                                        v216 = v211[4];
                                      if (v215 >= 0)
                                        v217 = *((unsigned __int8 *)v211 + 55);
                                      else
                                        v217 = (size_t)v211[5];
                                      if (v213 >= v217)
                                        v218 = v217;
                                      else
                                        v218 = v213;
                                      v219 = memcmp(v216, v212, v218);
                                      if (v219)
                                      {
                                        if (v219 < 0)
                                          goto LABEL_425;
                                      }
                                      else if (v217 < v213)
                                      {
LABEL_425:
                                        v211 = (void **)v211[1];
                                        if (!v211)
                                          goto LABEL_440;
                                        continue;
                                      }
                                      v214 = v211;
                                      v211 = (void **)*v211;
                                      if (!v211)
                                      {
LABEL_440:
                                        if (v214 == &v570[1])
                                          goto LABEL_468;
                                        v222 = (void **)v214[4];
                                        v221 = v214 + 4;
                                        v220 = v222;
                                        v223 = *((char *)v221 + 23);
                                        if (v223 >= 0)
                                          v224 = v221;
                                        else
                                          v224 = v220;
                                        if (v223 >= 0)
                                          v225 = *((unsigned __int8 *)v221 + 23);
                                        else
                                          v225 = (size_t)v221[1];
                                        if (v225 >= v213)
                                          v226 = v213;
                                        else
                                          v226 = v225;
                                        v227 = memcmp(v212, v224, v226);
                                        if (v227)
                                        {
                                          if ((v227 & 0x80000000) == 0)
                                            goto LABEL_452;
LABEL_468:
                                          v238 = (void **)v570[0];
                                          if (v570[0] != &v570[1])
                                          {
                                            do
                                            {
                                              v239 = SHIBYTE(v571.__r_.__value_.__r.__words[2]);
                                              if ((v571.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                                                v240 = HIBYTE(v571.__r_.__value_.__r.__words[2]);
                                              else
                                                v240 = v571.__r_.__value_.__l.__size_;
                                              v241 = *((char *)v238 + 55);
                                              if (v241 >= 0)
                                                v242 = *((unsigned __int8 *)v238 + 55);
                                              else
                                                v242 = (size_t)v238[5];
                                              v243 = v242 + v240;
                                              memset(&v569, 170, sizeof(v569));
                                              if (v242 + v240 > 0x7FFFFFFFFFFFFFF7)
                                                sub_10000163C();
                                              if (v243 > 0x16)
                                              {
                                                v245 = (v243 & 0xFFFFFFFFFFFFFFF8) + 8;
                                                if ((v243 | 7) != 0x17)
                                                  v245 = v243 | 7;
                                                v246 = v245 + 1;
                                                v244 = (char *)operator new(v245 + 1);
                                                v569.__r_.__value_.__l.__size_ = v242 + v240;
                                                v569.__r_.__value_.__r.__words[2] = v246 | 0x8000000000000000;
                                                v569.__r_.__value_.__r.__words[0] = (std::string::size_type)v244;
                                              }
                                              else
                                              {
                                                memset(&v569, 0, sizeof(v569));
                                                v244 = (char *)&v569;
                                                *((_BYTE *)&v569.__r_.__value_.__s + 23) = v242 + v240;
                                              }
                                              v64 = &OsLogStream__metaData;
                                              if (v240)
                                              {
                                                if (v239 >= 0)
                                                  v247 = &v571;
                                                else
                                                  v247 = (std::string *)v571.__r_.__value_.__r.__words[0];
                                                memmove(v244, v247, v240);
                                              }
                                              v248 = &v244[v240];
                                              if (v242)
                                              {
                                                if (v241 >= 0)
                                                  v249 = v238 + 4;
                                                else
                                                  v249 = v238[4];
                                                memmove(v248, v249, v242);
                                              }
                                              v248[v242] = 0;
                                              v250 = std::string::append(&v569, " ", 1uLL);
                                              v251 = v250->__r_.__value_.__r.__words[0];
                                              v582.__r_.__value_.__r.__words[0] = v250->__r_.__value_.__l.__size_;
                                              *(std::string::size_type *)((char *)v582.__r_.__value_.__r.__words + 7) = *(std::string::size_type *)((char *)&v250->__r_.__value_.__r.__words[1] + 7);
                                              v252 = HIBYTE(v250->__r_.__value_.__r.__words[2]);
                                              v250->__r_.__value_.__l.__size_ = 0;
                                              v250->__r_.__value_.__r.__words[2] = 0;
                                              v250->__r_.__value_.__r.__words[0] = 0;
                                              v253 = operator new(0x28uLL);
                                              v254 = v582.__r_.__value_.__r.__words[0];
                                              v253[2] = v251;
                                              v253[3] = v254;
                                              *(_QWORD *)((char *)v253 + 31) = *(std::string::size_type *)((char *)v582.__r_.__value_.__r.__words + 7);
                                              *((_BYTE *)v253 + 39) = v252;
                                              v255 = v562;
                                              *v253 = v562;
                                              v253[1] = &v562;
                                              v255[1] = v253;
                                              v562 = (void **)v253;
                                              v564 = (CommandBase *)((char *)v564 + 1);
                                              if (SHIBYTE(v569.__r_.__value_.__r.__words[2]) < 0)
                                                operator delete(v569.__r_.__value_.__l.__data_);
                                              v256 = (void **)v238[1];
                                              if (v256)
                                              {
                                                do
                                                {
                                                  v257 = v256;
                                                  v256 = (void **)*v256;
                                                }
                                                while (v256);
                                              }
                                              else
                                              {
                                                do
                                                {
                                                  v257 = (void **)v238[2];
                                                  v394 = *v257 == v238;
                                                  v238 = v257;
                                                }
                                                while (!v394);
                                              }
                                              v238 = v257;
                                            }
                                            while (v257 != &v570[1]);
                                          }
                                          CommandBase::getSubCommandMap(v544, (uint64_t)&v569);
                                          v258 = v569.__r_.__value_.__r.__words[0];
                                          if ((std::string::size_type *)v569.__r_.__value_.__l.__data_ != &v569.__r_.__value_.__r.__words[1])
                                          {
                                            do
                                            {
                                              v259 = SHIBYTE(v571.__r_.__value_.__r.__words[2]);
                                              if ((v571.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                                                v260 = HIBYTE(v571.__r_.__value_.__r.__words[2]);
                                              else
                                                v260 = v571.__r_.__value_.__l.__size_;
                                              v261 = *(char *)(v258 + 55);
                                              if (v261 >= 0)
                                                v262 = *(unsigned __int8 *)(v258 + 55);
                                              else
                                                v262 = *(_QWORD *)(v258 + 40);
                                              v263 = v262 + v260;
                                              memset(&v582, 170, sizeof(v582));
                                              if (v262 + v260 > 0x7FFFFFFFFFFFFFF7)
                                                sub_10000163C();
                                              if (v263 > 0x16)
                                              {
                                                v265 = (v263 & 0xFFFFFFFFFFFFFFF8) + 8;
                                                if ((v263 | 7) != 0x17)
                                                  v265 = v263 | 7;
                                                v266 = v265 + 1;
                                                v264 = (char *)operator new(v265 + 1);
                                                v582.__r_.__value_.__l.__size_ = v262 + v260;
                                                v582.__r_.__value_.__r.__words[2] = v266 | 0x8000000000000000;
                                                v582.__r_.__value_.__r.__words[0] = (std::string::size_type)v264;
                                              }
                                              else
                                              {
                                                memset(&v582, 0, sizeof(v582));
                                                v264 = (char *)&v582;
                                                *((_BYTE *)&v582.__r_.__value_.__s + 23) = v262 + v260;
                                              }
                                              v64 = &OsLogStream__metaData;
                                              if (v260)
                                              {
                                                if (v259 >= 0)
                                                  v267 = &v571;
                                                else
                                                  v267 = (std::string *)v571.__r_.__value_.__r.__words[0];
                                                memmove(v264, v267, v260);
                                              }
                                              v268 = &v264[v260];
                                              if (v262)
                                              {
                                                if (v261 >= 0)
                                                  v269 = (const void *)(v258 + 32);
                                                else
                                                  v269 = *(const void **)(v258 + 32);
                                                memmove(v268, v269, v262);
                                              }
                                              v268[v262] = 0;
                                              v270 = std::string::append(&v582, "/", 1uLL);
                                              v271 = v270->__r_.__value_.__r.__words[0];
                                              *(_QWORD *)v581 = v270->__r_.__value_.__l.__size_;
                                              *(_QWORD *)&v581[7] = *(std::string::size_type *)((char *)&v270->__r_.__value_.__r.__words[1]
                                                                                              + 7);
                                              v272 = HIBYTE(v270->__r_.__value_.__r.__words[2]);
                                              v270->__r_.__value_.__l.__size_ = 0;
                                              v270->__r_.__value_.__r.__words[2] = 0;
                                              v270->__r_.__value_.__r.__words[0] = 0;
                                              v273 = operator new(0x28uLL);
                                              v274 = *(_QWORD *)v581;
                                              v273[2] = v271;
                                              v273[3] = v274;
                                              *(_QWORD *)((char *)v273 + 31) = *(_QWORD *)&v581[7];
                                              *((_BYTE *)v273 + 39) = v272;
                                              v275 = v562;
                                              *v273 = v562;
                                              v273[1] = &v562;
                                              v275[1] = v273;
                                              v562 = (void **)v273;
                                              v564 = (CommandBase *)((char *)v564 + 1);
                                              if (SHIBYTE(v582.__r_.__value_.__r.__words[2]) < 0)
                                                operator delete(v582.__r_.__value_.__l.__data_);
                                              v276 = *(std::string **)(v258 + 8);
                                              if (v276)
                                              {
                                                do
                                                {
                                                  v277 = v276;
                                                  v276 = (std::string *)v276->__r_.__value_.__r.__words[0];
                                                }
                                                while (v276);
                                              }
                                              else
                                              {
                                                do
                                                {
                                                  v277 = *(std::string **)(v258 + 16);
                                                  v394 = v277->__r_.__value_.__r.__words[0] == v258;
                                                  v258 = (std::string::size_type)v277;
                                                }
                                                while (!v394);
                                              }
                                              v258 = (std::string::size_type)v277;
                                            }
                                            while (v277 != (std::string *)&v569.__r_.__value_.__r.__words[1]);
                                          }
                                          sub_10000BA78((uint64_t)&v569, v569.__r_.__value_.__l.__size_);
                                        }
                                        else
                                        {
                                          if (v213 < v225)
                                            goto LABEL_468;
LABEL_452:
                                          rl_completion_append_character = 32;
                                          (*(void (**)(std::string *__return_ptr, CommandBase *, std::string *))(*(_QWORD *)v544 + 48))(&v569, v544, &v572);
                                          for (i = v569.__r_.__value_.__l.__size_;
                                                (std::string *)i != &v569;
                                                i = *(_QWORD *)(i + 8))
                                          {
                                            v232 = operator new(0x28uLL);
                                            v233 = v232 + 2;
                                            *v232 = 0;
                                            v232[1] = 0;
                                            if (*(char *)(i + 39) < 0)
                                            {
                                              sub_1000016D4(v233, *(void **)(i + 16), *(_QWORD *)(i + 24));
                                            }
                                            else
                                            {
                                              v230 = *(_OWORD *)(i + 16);
                                              v232[4] = *(_QWORD *)(i + 32);
                                              *(_OWORD *)v233 = v230;
                                            }
                                            v231 = v562;
                                            *v232 = v562;
                                            v232[1] = &v562;
                                            v231[1] = v232;
                                            v562 = (void **)v232;
                                            v564 = (CommandBase *)((char *)v564 + 1);
                                          }
                                          if (v569.__r_.__value_.__r.__words[2])
                                          {
                                            v235 = v569.__r_.__value_.__l.__size_;
                                            v234 = v569.__r_.__value_.__r.__words[0];
                                            v236 = *(_QWORD *)v569.__r_.__value_.__l.__size_;
                                            *(_QWORD *)(v236 + 8) = *(_QWORD *)(v569.__r_.__value_.__r.__words[0] + 8);
                                            **(_QWORD **)(v234 + 8) = v236;
                                            v569.__r_.__value_.__r.__words[2] = 0;
                                            if ((std::string *)v235 != &v569)
                                            {
                                              do
                                              {
                                                v237 = *(std::string **)(v235 + 8);
                                                if (*(char *)(v235 + 39) < 0)
                                                  operator delete(*(void **)(v235 + 16));
                                                operator delete((void *)v235);
                                                v235 = (std::string::size_type)v237;
                                              }
                                              while (v237 != &v569);
                                            }
                                          }
                                        }
                                        sub_10000BA18((uint64_t)v570, (char *)v570[1]);
                                        if (SHIBYTE(v571.__r_.__value_.__r.__words[2]) < 0)
                                        {
                                          operator delete(v571.__r_.__value_.__l.__data_);
                                          if (SHIBYTE(v572.__r_.__value_.__r.__words[2]) < 0)
                                            goto LABEL_540;
LABEL_537:
                                          v278 = v567;
                                          if (v567)
                                          {
LABEL_541:
                                            v279 = (unint64_t *)&v278->__shared_owners_;
                                            do
                                              v280 = __ldaxr(v279);
                                            while (__stlxr(v280 - 1, v279));
                                            if (!v280)
                                            {
                                              ((void (*)(std::__shared_weak_count *))v278->__on_zero_shared)(v278);
                                              std::__shared_weak_count::__release_weak(v278);
                                            }
                                          }
                                        }
                                        else
                                        {
                                          if ((SHIBYTE(v572.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                                            goto LABEL_537;
LABEL_540:
                                          operator delete(v572.__r_.__value_.__l.__data_);
                                          v278 = v567;
                                          if (v567)
                                            goto LABEL_541;
                                        }
                                        if (!v555)
                                          goto LABEL_736;
                                        v281 = v553;
                                        v282 = (char **)v554;
                                        v283 = *(_QWORD *)v554;
                                        *(_QWORD *)(v283 + 8) = *((_QWORD *)v553 + 1);
                                        **((_QWORD **)v281 + 1) = v283;
                                        v555 = 0;
                                        if (v282 == &v553)
                                          goto LABEL_736;
                                        do
                                        {
                                          v284 = v282[1];
                                          if (*((char *)v282 + 39) < 0)
                                            operator delete(v282[2]);
                                          operator delete(v282);
                                          v282 = (char **)v284;
                                        }
                                        while (v284 != (char *)&v553);
                                        v98 = v555;
                                        goto LABEL_552;
                                      }
                                    }
                                  }
                                  v174 = (std::__shared_weak_count *)*((_QWORD *)v147 + 4);
                                  if (v174)
                                  {
                                    v175 = *((_QWORD *)v147 + 3);
                                    p_shared_weak_owners = (unint64_t *)&v174->__shared_weak_owners_;
                                    do
                                      v177 = __ldxr(p_shared_weak_owners);
                                    while (__stxr(v177 + 1, p_shared_weak_owners));
                                    v178 = std::__shared_weak_count::lock(v174);
                                    if (!v178)
                                      goto LABEL_383;
                                    v179 = v178;
                                    v180 = (unint64_t *)&v178->__shared_owners_;
                                    do
                                      v181 = __ldaxr(v180);
                                    while (__stlxr(v181 - 1, v180));
                                    if (!v181)
                                    {
                                      ((void (*)(std::__shared_weak_count *))v178->__on_zero_shared)(v178);
                                      std::__shared_weak_count::__release_weak(v179);
                                    }
                                    std::__shared_weak_count::__release_weak(v174);
                                    if (v175)
                                    {
                                      v174 = (std::__shared_weak_count *)*((_QWORD *)v566 + 4);
                                      if (v174)
                                      {
                                        v182 = (CommandBase *)*((_QWORD *)v566 + 3);
                                        v183 = (unint64_t *)&v174->__shared_weak_owners_;
                                        do
                                          v184 = __ldxr(v183);
                                        while (__stxr(v184 + 1, v183));
                                        v185 = std::__shared_weak_count::lock(v174);
                                        if (v185)
                                          v186 = v182;
                                        else
                                          v186 = 0;
                                      }
                                      else
                                      {
                                        v185 = 0;
                                        v186 = 0;
                                      }
                                      v194 = v567;
                                      v566 = v186;
                                      v567 = v185;
                                      if (v194)
                                      {
                                        v195 = (unint64_t *)&v194->__shared_owners_;
                                        do
                                          v196 = __ldaxr(v195);
                                        while (__stlxr(v196 - 1, v195));
                                        if (!v196)
                                        {
                                          ((void (*)(std::__shared_weak_count *))v194->__on_zero_shared)(v194);
                                          std::__shared_weak_count::__release_weak(v194);
                                        }
                                      }
                                      if (v174)
LABEL_383:
                                        std::__shared_weak_count::__release_weak(v174);
                                    }
                                  }
LABEL_384:
                                  v197 = SHIBYTE(v572.__r_.__value_.__r.__words[2]);
                                  if ((v572.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                                    v198 = HIBYTE(v572.__r_.__value_.__r.__words[2]);
                                  else
                                    v198 = v572.__r_.__value_.__l.__size_;
                                  v199 = v198 + 1;
                                  memset(v565, 170, sizeof(v565));
                                  if (v198 + 1 > 0x7FFFFFFFFFFFFFF7)
                                    sub_10000163C();
                                  if (v199 >= 0x17)
                                    break;
                                  memset(v565, 0, sizeof(v565));
                                  v200 = (CommandBase *)v565;
                                  HIBYTE(v565[2]) = v198 + 1;
                                  if (v198)
                                    goto LABEL_394;
LABEL_398:
                                  *(_WORD *)((char *)v200 + v198) = 47;
                                  if (SHIBYTE(v565[2]) >= 0)
                                    v204 = v565;
                                  else
                                    v204 = (CommandBase **)v565[0];
                                  if (SHIBYTE(v565[2]) >= 0)
                                    v205 = HIBYTE(v565[2]);
                                  else
                                    v205 = (std::string::size_type)v565[1];
                                  std::string::append(&v571, (const std::string::value_type *)v204, v205);
                                  if (SHIBYTE(v565[2]) < 0)
                                    operator delete(v565[0]);
                                  v206 = *(_QWORD *)&v581[8];
                                  v207 = **(_QWORD **)&v581[8];
                                  *(_QWORD *)(v207 + 8) = *(_QWORD *)(*(_QWORD *)&v581[8] + 8);
                                  **(_QWORD **)(v206 + 8) = v207;
                                  --*(_QWORD *)&v581[16];
                                  if (*(char *)(v206 + 39) < 0)
                                    operator delete(*(void **)(v206 + 16));
                                  operator delete((void *)v206);
                                  sub_10000BA78((uint64_t)v568, (uint64_t)v568[1]);
                                  if (!*(_QWORD *)&v581[16])
                                    goto LABEL_410;
                                }
                                v201 = (v199 & 0xFFFFFFFFFFFFFFF8) + 8;
                                if ((v199 | 7) != 0x17)
                                  v201 = v199 | 7;
                                v202 = v201 + 1;
                                v200 = (CommandBase *)operator new(v201 + 1);
                                v565[1] = (CommandBase *)(v198 + 1);
                                v565[2] = (CommandBase *)(v202 | 0x8000000000000000);
                                v565[0] = v200;
LABEL_394:
                                if (v197 >= 0)
                                  v203 = &v572;
                                else
                                  v203 = (std::string *)v572.__r_.__value_.__r.__words[0];
                                memmove(v200, v203, v198);
                                goto LABEL_398;
                              }
                            }
                            memcpy(v119, v114, v118);
                            goto LABEL_251;
                          }
LABEL_235:
                          v114 = (const char *)&unk_10001ABDB;
                          goto LABEL_243;
                        }
LABEL_552:
                        if (!v98)
                          goto LABEL_736;
                        v99 = (char *)v554;
                        LOBYTE(v100) = *((_BYTE *)v554 + 39);
LABEL_554:
                        v285 = (char)v100;
                        v100 = v100;
                        if ((v100 & 0x80u) != 0)
                          v100 = *((_QWORD *)v99 + 3);
                        if (v100 != 2)
                          goto LABEL_561;
                        v286 = v285 >= 0 ? v99 + 16 : (char *)*((_QWORD *)v99 + 2);
                        if (*(_WORD *)v286 != 25699)
                          goto LABEL_561;
                        rl_attempted_completion_over = 1;
                        if (v98 < 2)
                        {
                          if (!v547)
                          {
                            v98 = 1;
                            goto LABEL_561;
                          }
                        }
                        else if ((v547 & 1) != 0)
                        {
                          goto LABEL_561;
                        }
                        v372 = *(_QWORD *)v99;
                        *(_QWORD *)(v372 + 8) = *((_QWORD *)v99 + 1);
                        **((_QWORD **)v99 + 1) = v372;
                        v555 = v98 - 1;
                        if (v99[39] < 0)
                          operator delete(*((void **)v99 + 2));
                        operator delete(v99);
                        if (v564)
                        {
                          v373 = v562;
                          v374 = v563;
                          v375 = *v563;
                          v375[1] = v562[1];
                          *(_QWORD *)v373[1] = v375;
                          v564 = 0;
                          if (v374 != &v562)
                          {
                            do
                            {
                              v377 = (void ***)v374[1];
                              if (*((char *)v374 + 39) < 0)
                                operator delete(v374[2]);
                              operator delete(v374);
                              v374 = v377;
                            }
                            while (v377 != &v562);
                          }
                        }
                        rl_completion_append_character = 47;
                        rl_attempted_completion_over = 1;
                        if (v555 > 1)
                          goto LABEL_1034;
                        v565[0] = 0;
                        v565[1] = 0;
                        if (qword_1000202C8)
                        {
                          v376 = (CommandBase *)std::__shared_weak_count::lock((std::__shared_weak_count *)qword_1000202C8);
                          v565[1] = v376;
                          if (v376)
                            v565[0] = (CommandBase *)qword_1000202C0;
                        }
                        else
                        {
                          v376 = 0;
                        }
                        v421 = (char *)v554 + 16;
                        if (*((char *)v554 + 39) < 0)
                        {
                          if (!*((_QWORD *)v554 + 3))
                            goto LABEL_831;
                          v421 = (_QWORD *)*v421;
                        }
                        else if (!*((_BYTE *)v554 + 39))
                        {
                          goto LABEL_831;
                        }
                        if (*(_BYTE *)v421 == 47)
                        {
                          v422 = (CommandBase *)qword_1000202B8;
                          if (qword_1000202B8)
                          {
                            v422 = (CommandBase *)std::__shared_weak_count::lock((std::__shared_weak_count *)qword_1000202B8);
                            v423 = (CommandBase *)qword_1000202B0;
                            if (!v422)
                              v423 = 0;
                          }
                          else
                          {
                            v423 = 0;
                          }
                          v565[0] = v423;
                          v565[1] = v422;
                          if (v376)
                          {
                            v425 = (unint64_t *)((char *)v376 + 8);
                            do
                              v426 = __ldaxr(v425);
                            while (__stlxr(v426 - 1, v425));
                            if (!v426)
                            {
                              (*(void (**)(CommandBase *))(*(_QWORD *)v376 + 16))(v376);
                              std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v376);
                            }
                          }
                          v424 = "/";
LABEL_839:
                          memset(&v572, 170, sizeof(v572));
                          v427 = strlen(v424);
                          if (v427 > 0x7FFFFFFFFFFFFFF7)
                            sub_10000163C();
                          v428 = v427;
                          if (v427 >= 0x17)
                          {
                            v430 = (v427 & 0xFFFFFFFFFFFFFFF8) + 8;
                            if ((v427 | 7) != 0x17)
                              v430 = v427 | 7;
                            v431 = v430 + 1;
                            v429 = operator new(v430 + 1);
                            v572.__r_.__value_.__l.__size_ = v428;
                            v572.__r_.__value_.__r.__words[2] = v431 | 0x8000000000000000;
                            v572.__r_.__value_.__r.__words[0] = (std::string::size_type)v429;
                          }
                          else
                          {
                            *((_BYTE *)&v572.__r_.__value_.__s + 23) = v427;
                            v429 = &v572;
                            if (!v427)
                            {
LABEL_847:
                              v429[v428] = 0;
                              v432 = v555;
                              if (!v555)
                                goto LABEL_992;
                              memset(&v571, 170, sizeof(v571));
                              v433 = (char *)v554;
                              if (*((char *)v554 + 39) < 0)
                              {
                                sub_1000016D4(&v571, *((void **)v554 + 2), *((_QWORD *)v554 + 3));
                                v433 = (char *)v554;
                                v432 = v555;
                              }
                              else
                              {
                                v571 = *(std::string *)((char *)v554 + 16);
                              }
                              v434 = *(_QWORD *)v433;
                              *(_QWORD *)(v434 + 8) = *((_QWORD *)v433 + 1);
                              **((_QWORD **)v433 + 1) = v434;
                              v555 = v432 - 1;
                              if (v433[39] < 0)
                                operator delete(*((void **)v433 + 2));
                              operator delete(v433);
                              if (SHIBYTE(v571.__r_.__value_.__r.__words[2]) < 0)
                              {
                                v435 = v571.__r_.__value_.__l.__size_;
                                v436 = (std::string *)v571.__r_.__value_.__r.__words[0];
                              }
                              else
                              {
                                v435 = HIBYTE(v571.__r_.__value_.__r.__words[2]);
                                v436 = &v571;
                              }
                              memset(v570, 0, 24);
                              v437 = v435 + 1;
                              if ((uint64_t)(v435 + 1) < 0)
                                sub_100002298();
                              v438 = (char *)operator new(v435 + 1);
                              v570[0] = v438;
                              v570[2] = &v438[v437];
                              memcpy(v438, v436, v437);
                              v570[1] = &v438[v437];
                              memset(&v569, 170, sizeof(v569));
                              v439 = strlen(v438);
                              if (v439 > 0x7FFFFFFFFFFFFFF7)
                                sub_10000163C();
                              v440 = v439;
                              if (v439 >= 0x17)
                              {
                                v442 = (v439 & 0xFFFFFFFFFFFFFFF8) + 8;
                                if ((v439 | 7) != 0x17)
                                  v442 = v439 | 7;
                                v443 = v442 + 1;
                                v441 = operator new(v442 + 1);
                                v569.__r_.__value_.__l.__size_ = v440;
                                v569.__r_.__value_.__r.__words[2] = v443 | 0x8000000000000000;
                                v569.__r_.__value_.__r.__words[0] = (std::string::size_type)v441;
                              }
                              else
                              {
                                *((_BYTE *)&v569.__r_.__value_.__s + 23) = v439;
                                v441 = &v569;
                                if (!v439)
                                  goto LABEL_865;
                              }
                              memcpy(v441, v438, v440);
LABEL_865:
                              *((_BYTE *)v441 + v440) = 0;
                              v582.__r_.__value_.__r.__words[0] = (std::string::size_type)&v582;
                              v582.__r_.__value_.__l.__size_ = (std::string::size_type)&v582;
                              v582.__r_.__value_.__r.__words[2] = 0;
                              if ((v569.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                                v444 = &v569;
                              else
                                v444 = (std::string *)v569.__r_.__value_.__r.__words[0];
                              v445 = strtok((char *)v444, "/");
                              if (v445)
                              {
                                v446 = v445;
                                do
                                {
                                  v447 = strlen(v446);
                                  if (v447 > 0x7FFFFFFFFFFFFFF7)
                                    sub_10000163C();
                                  v448 = v447;
                                  if (v447 >= 0x17)
                                  {
                                    v450 = (v447 & 0xFFFFFFFFFFFFFFF8) + 8;
                                    if ((v447 | 7) != 0x17)
                                      v450 = v447 | 7;
                                    v451 = v450 + 1;
                                    v449 = operator new(v450 + 1);
                                    *(_QWORD *)&v581[8] = v448;
                                    *(_QWORD *)&v581[16] = v451 | 0x8000000000000000;
                                    *(_QWORD *)v581 = v449;
                                  }
                                  else
                                  {
                                    v581[23] = v447;
                                    v449 = v581;
                                    if (!v447)
                                      goto LABEL_878;
                                  }
                                  memmove(v449, v446, v448);
LABEL_878:
                                  v449[v448] = 0;
                                  v452 = operator new(0x28uLL);
                                  v452[1] = *(_OWORD *)v581;
                                  *((_QWORD *)v452 + 4) = *(_QWORD *)&v581[16];
                                  v453 = v582.__r_.__value_.__r.__words[0];
                                  *(_QWORD *)v452 = v582.__r_.__value_.__r.__words[0];
                                  *((_QWORD *)v452 + 1) = &v582;
                                  *(_QWORD *)(v453 + 8) = v452;
                                  v582.__r_.__value_.__r.__words[0] = (std::string::size_type)v452;
                                  ++v582.__r_.__value_.__r.__words[2];
                                  v446 = strtok(0, "/");
                                }
                                while (v446);
                              }
                              if (!v582.__r_.__value_.__r.__words[2])
                                goto LABEL_986;
LABEL_882:
                              memset(v581, 170, sizeof(v581));
                              v454 = v565[0];
                              CommandBase::getSubCommandMap((_QWORD *)v565[0], (uint64_t)v581);
                              v455 = (_QWORD *)(v582.__r_.__value_.__l.__size_ + 16);
                              v456 = *(_QWORD *)&v581[8];
                              v457 = *(unsigned __int8 *)(v582.__r_.__value_.__l.__size_ + 39);
                              if (!*(_QWORD *)&v581[8])
                              {
                                v458 = *(_QWORD *)(v582.__r_.__value_.__l.__size_ + 24);
                                goto LABEL_921;
                              }
                              v458 = *(_QWORD *)(v582.__r_.__value_.__l.__size_ + 24);
                              if ((v457 & 0x80u) == 0)
                                v459 = (const void *)(v582.__r_.__value_.__l.__size_ + 16);
                              else
                                v459 = *(const void **)(v582.__r_.__value_.__l.__size_ + 16);
                              if ((v457 & 0x80u) == 0)
                                v460 = *(unsigned __int8 *)(v582.__r_.__value_.__l.__size_ + 39);
                              else
                                v460 = *(_QWORD *)(v582.__r_.__value_.__l.__size_ + 24);
                              v461 = &v581[8];
                              v462 = *(uint64_t **)&v581[8];
                              while (1)
                              {
                                v463 = *((char *)v462 + 55);
                                v464 = v463 >= 0 ? v462 + 4 : (uint64_t *)v462[4];
                                v465 = v463 >= 0 ? *((unsigned __int8 *)v462 + 55) : v462[5];
                                v466 = v460 >= v465 ? v465 : v460;
                                v467 = memcmp(v464, v459, v466);
                                if (v467)
                                  break;
                                if (v465 < v460)
                                {
LABEL_890:
                                  v462 = (uint64_t *)v462[1];
                                  if (!v462)
                                    goto LABEL_905;
                                }
                                else
                                {
LABEL_904:
                                  v461 = v462;
                                  v462 = (uint64_t *)*v462;
                                  if (!v462)
                                  {
LABEL_905:
                                    if (v461 != &v581[8])
                                    {
                                      v470 = (size_t *)*((_QWORD *)v461 + 4);
                                      v469 = (size_t *)(v461 + 32);
                                      v468 = v470;
                                      v471 = *((char *)v469 + 23);
                                      if (v471 >= 0)
                                        v472 = v469;
                                      else
                                        v472 = v468;
                                      if (v471 >= 0)
                                        v473 = *((unsigned __int8 *)v469 + 23);
                                      else
                                        v473 = v469[1];
                                      if (v473 >= v460)
                                        v474 = v460;
                                      else
                                        v474 = v473;
                                      v475 = memcmp(v459, v472, v474);
                                      if (v475)
                                      {
                                        if (v475 < 0)
                                          goto LABEL_921;
                                      }
                                      else if (v460 < v473)
                                      {
                                        goto LABEL_921;
                                      }
                                      v568[0] = v455;
                                      v491 = sub_10000B88C((uint64_t **)v581, (const void **)v455, (uint64_t)&std::piecewise_construct, (__int128 **)v568);
                                      v493 = (CommandBase *)v491[7];
                                      v492 = (CommandBase *)v491[8];
                                      if (v492)
                                      {
                                        v494 = (unint64_t *)((char *)v492 + 8);
                                        do
                                          v495 = __ldxr(v494);
                                        while (__stxr(v495 + 1, v494));
                                      }
                                      v478 = (std::__shared_weak_count *)v565[1];
                                      v565[0] = v493;
                                      v565[1] = v492;
                                      if (v478)
                                      {
                                        v496 = (unint64_t *)&v478->__shared_owners_;
                                        do
                                          v497 = __ldaxr(v496);
                                        while (__stlxr(v497 - 1, v496));
                                        if (!v497)
                                        {
                                          ((void (*)(std::__shared_weak_count *))v478->__on_zero_shared)(v478);
                                          goto LABEL_959;
                                        }
                                      }
                                      goto LABEL_960;
                                    }
LABEL_921:
                                    if ((v457 & 0x80u) == 0)
                                      v476 = v457;
                                    else
                                      v476 = v458;
                                    if (v476 == 2)
                                    {
                                      v477 = (v457 & 0x80u) == 0 ? v455 : (_WORD *)*v455;
                                      if (*v477 == 11822)
                                      {
                                        v478 = (std::__shared_weak_count *)*((_QWORD *)v454 + 4);
                                        if (v478)
                                        {
                                          v479 = *((_QWORD *)v454 + 3);
                                          v480 = (unint64_t *)&v478->__shared_weak_owners_;
                                          do
                                            v481 = __ldxr(v480);
                                          while (__stxr(v481 + 1, v480));
                                          v482 = std::__shared_weak_count::lock(v478);
                                          if (!v482)
                                            goto LABEL_959;
                                          v483 = v482;
                                          v484 = (unint64_t *)&v482->__shared_owners_;
                                          do
                                            v485 = __ldaxr(v484);
                                          while (__stlxr(v485 - 1, v484));
                                          if (!v485)
                                          {
                                            ((void (*)(std::__shared_weak_count *))v482->__on_zero_shared)(v482);
                                            std::__shared_weak_count::__release_weak(v483);
                                          }
                                          std::__shared_weak_count::__release_weak(v478);
                                          if (v479)
                                          {
                                            v478 = (std::__shared_weak_count *)*((_QWORD *)v565[0] + 4);
                                            if (v478)
                                            {
                                              v486 = (CommandBase *)*((_QWORD *)v565[0] + 3);
                                              v487 = (unint64_t *)&v478->__shared_weak_owners_;
                                              do
                                                v488 = __ldxr(v487);
                                              while (__stxr(v488 + 1, v487));
                                              v489 = (CommandBase *)std::__shared_weak_count::lock(v478);
                                              if (v489)
                                                v490 = v486;
                                              else
                                                v490 = 0;
                                            }
                                            else
                                            {
                                              v490 = 0;
                                              v489 = 0;
                                            }
                                            v498 = (std::__shared_weak_count *)v565[1];
                                            v565[0] = v490;
                                            v565[1] = v489;
                                            if (v498)
                                            {
                                              v499 = (unint64_t *)&v498->__shared_owners_;
                                              do
                                                v500 = __ldaxr(v499);
                                              while (__stlxr(v500 - 1, v499));
                                              if (!v500)
                                              {
                                                ((void (*)(std::__shared_weak_count *))v498->__on_zero_shared)(v498);
                                                std::__shared_weak_count::__release_weak(v498);
                                              }
                                            }
                                            if (v478)
LABEL_959:
                                              std::__shared_weak_count::__release_weak(v478);
                                          }
                                        }
LABEL_960:
                                        v501 = v582.__r_.__value_.__l.__size_;
                                        v502 = *(char *)(v582.__r_.__value_.__l.__size_ + 39);
                                        if (v502 >= 0)
                                          v503 = *(unsigned __int8 *)(v582.__r_.__value_.__l.__size_ + 39);
                                        else
                                          v503 = *(_QWORD *)(v582.__r_.__value_.__l.__size_ + 24);
                                        v504 = v503 + 1;
                                        memset(v568, 170, sizeof(v568));
                                        if (v503 + 1 > 0x7FFFFFFFFFFFFFF7)
                                          sub_10000163C();
                                        if (v504 >= 0x17)
                                        {
                                          v506 = (v504 & 0xFFFFFFFFFFFFFFF8) + 8;
                                          if ((v504 | 7) != 0x17)
                                            v506 = v504 | 7;
                                          v507 = v506 + 1;
                                          v505 = (char *)operator new(v506 + 1);
                                          v568[1] = (void *)(v503 + 1);
                                          v568[2] = (void *)(v507 | 0x8000000000000000);
                                          v568[0] = v505;
                                        }
                                        else
                                        {
                                          memset(v568, 0, sizeof(v568));
                                          v505 = (char *)v568;
                                          HIBYTE(v568[2]) = v503 + 1;
                                          if (!v503)
                                            goto LABEL_974;
                                        }
                                        if (v502 >= 0)
                                          v508 = (const void *)(v501 + 16);
                                        else
                                          v508 = *(const void **)(v501 + 16);
                                        memmove(v505, v508, v503);
LABEL_974:
                                        *(_WORD *)&v505[v503] = 47;
                                        if (SHIBYTE(v568[2]) >= 0)
                                          v509 = v568;
                                        else
                                          v509 = (void **)v568[0];
                                        if (SHIBYTE(v568[2]) >= 0)
                                          v510 = HIBYTE(v568[2]);
                                        else
                                          v510 = (std::string::size_type)v568[1];
                                        std::string::append(&v572, (const std::string::value_type *)v509, v510);
                                        if (SHIBYTE(v568[2]) < 0)
                                          operator delete(v568[0]);
                                        v511 = v582.__r_.__value_.__l.__size_;
                                        v512 = *(_QWORD *)v582.__r_.__value_.__l.__size_;
                                        *(_QWORD *)(v512 + 8) = *(_QWORD *)(v582.__r_.__value_.__l.__size_ + 8);
                                        **(_QWORD **)(v511 + 8) = v512;
                                        --v582.__r_.__value_.__r.__words[2];
                                        if (*(char *)(v511 + 39) < 0)
                                          operator delete(*(void **)(v511 + 16));
                                        operator delete((void *)v511);
                                        sub_10000BA78((uint64_t)v581, *(uint64_t *)&v581[8]);
                                        if (!v582.__r_.__value_.__r.__words[2])
                                          goto LABEL_986;
                                        goto LABEL_882;
                                      }
                                    }
                                    sub_10000BA78((uint64_t)v581, v456);
                                    if (v582.__r_.__value_.__r.__words[2])
                                    {
                                      v514 = v582.__r_.__value_.__l.__size_;
                                      v513 = v582.__r_.__value_.__r.__words[0];
                                      v515 = *(_QWORD *)v582.__r_.__value_.__l.__size_;
                                      *(_QWORD *)(v515 + 8) = *(_QWORD *)(v582.__r_.__value_.__r.__words[0] + 8);
                                      **(_QWORD **)(v513 + 8) = v515;
                                      v582.__r_.__value_.__r.__words[2] = 0;
                                      if ((std::string *)v514 != &v582)
                                      {
                                        do
                                        {
                                          v535 = *(std::string **)(v514 + 8);
                                          if (*(char *)(v514 + 39) < 0)
                                            operator delete(*(void **)(v514 + 16));
                                          operator delete((void *)v514);
                                          v514 = (std::string::size_type)v535;
                                        }
                                        while (v535 != &v582);
                                      }
                                    }
LABEL_986:
                                    if (SHIBYTE(v569.__r_.__value_.__r.__words[2]) < 0)
                                      operator delete(v569.__r_.__value_.__l.__data_);
                                    if (v570[0])
                                    {
                                      v570[1] = v570[0];
                                      operator delete(v570[0]);
                                    }
                                    if (SHIBYTE(v571.__r_.__value_.__r.__words[2]) < 0)
                                      operator delete(v571.__r_.__value_.__l.__data_);
LABEL_992:
                                    CommandBase::getSubCommandMap((_QWORD *)v565[0], (uint64_t)&v571);
                                    v516 = v571.__r_.__value_.__r.__words[0];
                                    p_size = &v571.__r_.__value_.__l.__size_;
                                    if ((std::string::size_type *)v571.__r_.__value_.__l.__data_ != &v571.__r_.__value_.__r.__words[1])
                                    {
                                      v543 = v572.__r_.__value_.__r.__words[0];
                                      v518 = v562;
                                      v519 = v564;
                                      do
                                      {
                                        v520 = SHIBYTE(v572.__r_.__value_.__r.__words[2]);
                                        if ((v572.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                                          v521 = HIBYTE(v572.__r_.__value_.__r.__words[2]);
                                        else
                                          v521 = v572.__r_.__value_.__l.__size_;
                                        v522 = *(char *)(v516 + 55);
                                        if (v522 >= 0)
                                          v523 = *(unsigned __int8 *)(v516 + 55);
                                        else
                                          v523 = *(_QWORD *)(v516 + 40);
                                        v524 = v523 + v521;
                                        memset(v570, 170, 24);
                                        if (v523 + v521 > 0x7FFFFFFFFFFFFFF7)
                                          sub_10000163C();
                                        v546 = v519;
                                        if (v524 > 0x16)
                                        {
                                          v526 = p_size;
                                          v527 = (v524 & 0xFFFFFFFFFFFFFFF8) + 8;
                                          if ((v524 | 7) != 0x17)
                                            v527 = v524 | 7;
                                          v528 = v527 + 1;
                                          v525 = (char *)operator new(v527 + 1);
                                          v570[1] = (void *)(v523 + v521);
                                          v570[2] = (void *)(v528 | 0x8000000000000000);
                                          v570[0] = v525;
                                          p_size = v526;
                                        }
                                        else
                                        {
                                          memset(v570, 0, 24);
                                          v525 = (char *)v570;
                                          HIBYTE(v570[2]) = v523 + v521;
                                        }
                                        if (v521)
                                        {
                                          if (v520 >= 0)
                                            v529 = &v572;
                                          else
                                            v529 = (std::string *)v543;
                                          memmove(v525, v529, v521);
                                        }
                                        v530 = &v525[v521];
                                        if (v523)
                                        {
                                          if (v522 >= 0)
                                            v531 = (const void *)(v516 + 32);
                                          else
                                            v531 = *(const void **)(v516 + 32);
                                          memmove(v530, v531, v523);
                                        }
                                        v530[v523] = 0;
                                        v532 = (void **)operator new(0x28uLL);
                                        *((_OWORD *)v532 + 1) = *(_OWORD *)v570;
                                        v532[4] = v570[2];
                                        *v532 = v518;
                                        v532[1] = &v562;
                                        v518[1] = v532;
                                        v519 = (CommandBase *)((char *)v546 + 1);
                                        v562 = v532;
                                        v564 = (CommandBase *)((char *)v546 + 1);
                                        v533 = *(std::string::size_type **)(v516 + 8);
                                        if (v533)
                                        {
                                          do
                                          {
                                            v534 = v533;
                                            v533 = (std::string::size_type *)*v533;
                                          }
                                          while (v533);
                                        }
                                        else
                                        {
                                          do
                                          {
                                            v534 = *(std::string::size_type **)(v516 + 16);
                                            v394 = *v534 == v516;
                                            v516 = (std::string::size_type)v534;
                                          }
                                          while (!v394);
                                        }
                                        v518 = v532;
                                        v516 = (std::string::size_type)v534;
                                      }
                                      while (v534 != p_size);
                                    }
                                    sub_10000BA78((uint64_t)&v571, v571.__r_.__value_.__l.__size_);
                                    if (SHIBYTE(v572.__r_.__value_.__r.__words[2]) < 0)
                                      operator delete(v572.__r_.__value_.__l.__data_);
                                    v536 = (std::__shared_weak_count *)v565[1];
                                    v64 = &OsLogStream__metaData;
                                    if (v565[1])
                                    {
                                      v537 = (unint64_t *)((char *)v565[1] + 8);
                                      do
                                        v538 = __ldaxr(v537);
                                      while (__stlxr(v538 - 1, v537));
                                      if (!v538)
                                      {
                                        ((void (*)(std::__shared_weak_count *))v536->__on_zero_shared)(v536);
                                        std::__shared_weak_count::__release_weak(v536);
                                      }
                                    }
                                    if (!v555)
                                      goto LABEL_736;
LABEL_1034:
                                    v539 = v553;
                                    v540 = (char **)v554;
                                    v541 = *(_QWORD *)v554;
                                    *(_QWORD *)(v541 + 8) = *((_QWORD *)v553 + 1);
                                    **((_QWORD **)v539 + 1) = v541;
                                    v555 = 0;
                                    if (v540 == &v553)
                                      goto LABEL_736;
                                    do
                                    {
                                      v542 = v540[1];
                                      if (*((char *)v540 + 39) < 0)
                                        operator delete(v540[2]);
                                      operator delete(v540);
                                      v540 = (char **)v542;
                                    }
                                    while (v542 != (char *)&v553);
                                    v98 = v555;
LABEL_561:
                                    v287 = v547;
                                    if (v98 != 1)
                                      v287 = 1;
                                    if (!v98 || !v287)
                                      goto LABEL_736;
                                    while (2)
                                    {
                                      if (v564)
                                      {
                                        v288 = v562;
                                        v289 = v563;
                                        v290 = *v563;
                                        v290[1] = v562[1];
                                        *(_QWORD *)v288[1] = v290;
                                        v564 = 0;
                                        if (v289 != &v562)
                                        {
                                          do
                                          {
                                            v296 = (void ***)v289[1];
                                            if (*((char *)v289 + 39) < 0)
                                              operator delete(v289[2]);
                                            operator delete(v289);
                                            v289 = v296;
                                          }
                                          while (v296 != &v562);
                                        }
                                      }
                                      v291 = (_QWORD *)v560;
                                      *(_OWORD *)&v572.__r_.__value_.__r.__words[1] = 0uLL;
                                      v572.__r_.__value_.__r.__words[0] = (std::string::size_type)&v572.__r_.__value_.__l.__size_;
                                      v292 = *(const void ***)(v560 + 88);
                                      v293 = (const void ***)(v560 + 96);
                                      if (v292 == (const void **)(v560 + 96))
                                        goto LABEL_616;
                                      do
                                      {
                                        sub_1000102CC((uint64_t **)&v572, (uint64_t *)&v572.__r_.__value_.__l.__size_, v292 + 4, (uint64_t)(v292 + 4));
                                        v294 = (const void **)v292[1];
                                        if (v294)
                                        {
                                          do
                                          {
                                            v295 = (const void ***)v294;
                                            v294 = (const void **)*v294;
                                          }
                                          while (v294);
                                        }
                                        else
                                        {
                                          do
                                          {
                                            v295 = (const void ***)v292[2];
                                            v394 = *v295 == v292;
                                            v292 = (const void **)v295;
                                          }
                                          while (!v394);
                                        }
                                        v292 = (const void **)v295;
                                      }
                                      while (v295 != v293);
                                      v297 = v572.__r_.__value_.__l.__size_;
                                      if (!v572.__r_.__value_.__l.__size_)
                                        goto LABEL_616;
                                      v298 = *((_BYTE *)v554 + 39);
                                      v545 = (CommandBase *)((char *)v554 + 16);
                                      if (v298 >= 0)
                                        v299 = (char *)v554 + 16;
                                      else
                                        v299 = (char *)*((_QWORD *)v554 + 2);
                                      if (v298 >= 0)
                                        v300 = *((unsigned __int8 *)v554 + 39);
                                      else
                                        v300 = *((_QWORD *)v554 + 3);
                                      v301 = (std::string *)&v572.__r_.__value_.__r.__words[1];
                                      while (2)
                                      {
                                        while (2)
                                        {
                                          v302 = *(char *)(v297 + 55);
                                          if (v302 >= 0)
                                            v303 = (const void *)(v297 + 32);
                                          else
                                            v303 = *(const void **)(v297 + 32);
                                          if (v302 >= 0)
                                            v304 = *(unsigned __int8 *)(v297 + 55);
                                          else
                                            v304 = *(_QWORD *)(v297 + 40);
                                          if (v300 >= v304)
                                            v305 = v304;
                                          else
                                            v305 = v300;
                                          v306 = memcmp(v303, v299, v305);
                                          if (v306)
                                          {
                                            if ((v306 & 0x80000000) == 0)
                                              break;
                                            goto LABEL_587;
                                          }
                                          if (v304 < v300)
                                          {
LABEL_587:
                                            v297 = *(_QWORD *)(v297 + 8);
                                            if (!v297)
                                              goto LABEL_602;
                                            continue;
                                          }
                                          break;
                                        }
                                        v301 = (std::string *)v297;
                                        v297 = *(_QWORD *)v297;
                                        if (v297)
                                          continue;
                                        break;
                                      }
LABEL_602:
                                      if (v301 != (std::string *)&v572.__r_.__value_.__r.__words[1])
                                      {
                                        v309 = v301[1].__r_.__value_.__l.__size_;
                                        v308 = &v301[1].__r_.__value_.__l.__size_;
                                        v307 = (size_t *)v309;
                                        v310 = *((char *)v308 + 23);
                                        if (v310 >= 0)
                                          v311 = v308;
                                        else
                                          v311 = v307;
                                        if (v310 >= 0)
                                          v312 = *((unsigned __int8 *)v308 + 23);
                                        else
                                          v312 = v308[1];
                                        if (v312 >= v300)
                                          v313 = v300;
                                        else
                                          v313 = v312;
                                        v314 = memcmp(v299, v311, v313);
                                        if (v314)
                                        {
                                          if ((v314 & 0x80000000) == 0)
                                          {
LABEL_808:
                                            (*(void (**)(std::string *__return_ptr, _QWORD *, CommandBase *))(*v291 + 48))(&v571, v291, v545);
                                            for (j = v571.__r_.__value_.__l.__size_;
                                                  (std::string *)j != &v571;
                                                  j = *(_QWORD *)(j + 8))
                                            {
                                              v415 = operator new(0x28uLL);
                                              v416 = v415 + 2;
                                              *v415 = 0;
                                              v415[1] = 0;
                                              if (*(char *)(j + 39) < 0)
                                              {
                                                sub_1000016D4(v416, *(void **)(j + 16), *(_QWORD *)(j + 24));
                                              }
                                              else
                                              {
                                                v413 = *(_OWORD *)(j + 16);
                                                v415[4] = *(_QWORD *)(j + 32);
                                                *(_OWORD *)v416 = v413;
                                              }
                                              v414 = v562;
                                              *v415 = v562;
                                              v415[1] = &v562;
                                              v414[1] = v415;
                                              v562 = (void **)v415;
                                              v564 = (CommandBase *)((char *)v564 + 1);
                                            }
                                            if (v571.__r_.__value_.__r.__words[2])
                                            {
                                              v418 = v571.__r_.__value_.__l.__size_;
                                              v417 = v571.__r_.__value_.__r.__words[0];
                                              v419 = *(_QWORD *)v571.__r_.__value_.__l.__size_;
                                              *(_QWORD *)(v419 + 8) = *(_QWORD *)(v571.__r_.__value_.__r.__words[0] + 8);
                                              **(_QWORD **)(v417 + 8) = v419;
                                              v571.__r_.__value_.__r.__words[2] = 0;
                                              if ((std::string *)v418 != &v571)
                                              {
                                                do
                                                {
                                                  v420 = *(std::string **)(v418 + 8);
                                                  if (*(char *)(v418 + 39) < 0)
                                                    operator delete(*(void **)(v418 + 16));
                                                  operator delete((void *)v418);
                                                  v418 = (std::string::size_type)v420;
                                                }
                                                while (v420 != &v571);
                                              }
                                            }
                                            goto LABEL_735;
                                          }
                                        }
                                        else if (v300 >= v312)
                                        {
                                          goto LABEL_808;
                                        }
                                      }
LABEL_616:
                                      *(_OWORD *)&v571.__r_.__value_.__r.__words[1] = 0uLL;
                                      v571.__r_.__value_.__r.__words[0] = (std::string::size_type)&v571.__r_.__value_.__l.__size_;
                                      v315 = (const void **)v291[20];
                                      if (v315 == v291 + 21)
                                      {
                                        v371 = 0;
                                        goto LABEL_734;
                                      }
                                      do
                                      {
                                        sub_100010770((uint64_t **)&v571, (uint64_t *)&v571.__r_.__value_.__l.__size_, v315 + 4, (uint64_t)(v315 + 4));
                                        v316 = (const void **)v315[1];
                                        if (v316)
                                        {
                                          do
                                          {
                                            v317 = (const void ***)v316;
                                            v316 = (const void **)*v316;
                                          }
                                          while (v316);
                                        }
                                        else
                                        {
                                          do
                                          {
                                            v317 = (const void ***)v315[2];
                                            v394 = *v317 == v315;
                                            v315 = (const void **)v317;
                                          }
                                          while (!v394);
                                        }
                                        v315 = (const void **)v317;
                                      }
                                      while (v317 != v291 + 21);
                                      v371 = v571.__r_.__value_.__l.__size_;
                                      if (!v571.__r_.__value_.__l.__size_)
                                      {
LABEL_734:
                                        sub_10000BA78((uint64_t)&v571, v371);
LABEL_735:
                                        sub_10000BA18((uint64_t)&v572, (char *)v572.__r_.__value_.__l.__size_);
                                        break;
                                      }
                                      v318 = (char *)v554 + 16;
                                      v319 = *((_BYTE *)v554 + 39);
                                      if (v319 >= 0)
                                        v320 = (char *)v554 + 16;
                                      else
                                        v320 = (char *)*((_QWORD *)v554 + 2);
                                      if (v319 >= 0)
                                        v321 = *((unsigned __int8 *)v554 + 39);
                                      else
                                        v321 = *((_QWORD *)v554 + 3);
                                      v322 = (std::string *)&v571.__r_.__value_.__r.__words[1];
                                      v323 = v571.__r_.__value_.__l.__size_;
                                      while (2)
                                      {
                                        while (2)
                                        {
                                          v324 = *(char *)(v323 + 55);
                                          if (v324 >= 0)
                                            v325 = (const void *)(v323 + 32);
                                          else
                                            v325 = *(const void **)(v323 + 32);
                                          if (v324 >= 0)
                                            v326 = *(unsigned __int8 *)(v323 + 55);
                                          else
                                            v326 = *(_QWORD *)(v323 + 40);
                                          if (v321 >= v326)
                                            v327 = v326;
                                          else
                                            v327 = v321;
                                          v328 = memcmp(v325, v320, v327);
                                          if (v328)
                                          {
                                            if ((v328 & 0x80000000) == 0)
                                              break;
                                            goto LABEL_633;
                                          }
                                          if (v326 < v321)
                                          {
LABEL_633:
                                            v323 = *(_QWORD *)(v323 + 8);
                                            if (!v323)
                                              goto LABEL_648;
                                            continue;
                                          }
                                          break;
                                        }
                                        v322 = (std::string *)v323;
                                        v323 = *(_QWORD *)v323;
                                        if (v323)
                                          continue;
                                        break;
                                      }
LABEL_648:
                                      if (v322 == (std::string *)&v571.__r_.__value_.__r.__words[1])
                                      {
                                        v64 = &OsLogStream__metaData;
                                        goto LABEL_734;
                                      }
                                      v331 = v322[1].__r_.__value_.__l.__size_;
                                      v330 = &v322[1].__r_.__value_.__l.__size_;
                                      v329 = (size_t *)v331;
                                      v332 = *((char *)v330 + 23);
                                      if (v332 >= 0)
                                        v333 = v330;
                                      else
                                        v333 = v329;
                                      if (v332 >= 0)
                                        v334 = *((unsigned __int8 *)v330 + 23);
                                      else
                                        v334 = v330[1];
                                      if (v334 >= v321)
                                        v335 = v321;
                                      else
                                        v335 = v334;
                                      v336 = memcmp(v320, v333, v335);
                                      v64 = &OsLogStream__metaData;
                                      if (v336)
                                      {
                                        if (v336 < 0)
                                          goto LABEL_734;
                                      }
                                      else if (v321 < v334)
                                      {
                                        goto LABEL_734;
                                      }
                                      v570[0] = v318;
                                      v337 = sub_10000B88C((uint64_t **)&v571, (const void **)v318, (uint64_t)&std::piecewise_construct, (__int128 **)v570);
                                      v339 = v337[7];
                                      v338 = (std::__shared_weak_count *)v337[8];
                                      if (v338)
                                      {
                                        v340 = (unint64_t *)&v338->__shared_owners_;
                                        do
                                          v341 = __ldxr(v340);
                                        while (__stxr(v341 + 1, v340));
                                      }
                                      v342 = v561;
                                      v560 = (uint64_t)v339;
                                      v561 = v338;
                                      if (v342)
                                      {
                                        v343 = (unint64_t *)&v342->__shared_owners_;
                                        do
                                          v344 = __ldaxr(v343);
                                        while (__stlxr(v344 - 1, v343));
                                        if (!v344)
                                        {
                                          ((void (*)(std::__shared_weak_count *))v342->__on_zero_shared)(v342);
                                          std::__shared_weak_count::__release_weak(v342);
                                        }
                                      }
                                      v345 = v560;
                                      v570[1] = 0;
                                      v570[2] = 0;
                                      v570[0] = &v570[1];
                                      v346 = *(const void ***)(v560 + 88);
                                      v347 = (const void ***)(v560 + 96);
                                      if (v346 != (const void **)(v560 + 96))
                                      {
                                        do
                                        {
                                          sub_1000102CC((uint64_t **)v570, (uint64_t *)&v570[1], v346 + 4, (uint64_t)(v346 + 4));
                                          v348 = (const void **)v346[1];
                                          if (v348)
                                          {
                                            do
                                            {
                                              v349 = (const void ***)v348;
                                              v348 = (const void **)*v348;
                                            }
                                            while (v348);
                                          }
                                          else
                                          {
                                            do
                                            {
                                              v349 = (const void ***)v346[2];
                                              v394 = *v349 == v346;
                                              v346 = (const void **)v349;
                                            }
                                            while (!v394);
                                          }
                                          v346 = (const void **)v349;
                                        }
                                        while (v349 != v347);
                                        v350 = (void **)v570[0];
                                        if (v570[0] != &v570[1])
                                        {
                                          do
                                          {
                                            v355 = operator new(0x28uLL);
                                            v356 = v355 + 2;
                                            *v355 = 0;
                                            v355[1] = 0;
                                            if (*((char *)v350 + 55) < 0)
                                            {
                                              sub_1000016D4(v356, v350[4], (unint64_t)v350[5]);
                                            }
                                            else
                                            {
                                              v357 = *((_OWORD *)v350 + 2);
                                              v355[4] = v350[6];
                                              *(_OWORD *)v356 = v357;
                                            }
                                            v358 = v562;
                                            *v355 = v562;
                                            v355[1] = &v562;
                                            v358[1] = v355;
                                            v562 = (void **)v355;
                                            v564 = (CommandBase *)((char *)v564 + 1);
                                            v359 = (void **)v350[1];
                                            if (v359)
                                            {
                                              do
                                              {
                                                v360 = v359;
                                                v359 = (void **)*v359;
                                              }
                                              while (v359);
                                            }
                                            else
                                            {
                                              do
                                              {
                                                v360 = (void **)v350[2];
                                                v394 = *v360 == v350;
                                                v350 = v360;
                                              }
                                              while (!v394);
                                            }
                                            v350 = v360;
                                          }
                                          while (v360 != &v570[1]);
                                        }
                                      }
                                      sub_10000BA18((uint64_t)v570, (char *)v570[1]);
                                      v570[1] = 0;
                                      v570[2] = 0;
                                      v570[0] = &v570[1];
                                      v351 = *(const void ***)(v345 + 160);
                                      v352 = (const void **)(v345 + 168);
                                      if (v351 != v352)
                                      {
                                        do
                                        {
                                          sub_100010770((uint64_t **)v570, (uint64_t *)&v570[1], v351 + 4, (uint64_t)(v351 + 4));
                                          v353 = (const void **)v351[1];
                                          if (v353)
                                          {
                                            do
                                            {
                                              v354 = v353;
                                              v353 = (const void **)*v353;
                                            }
                                            while (v353);
                                          }
                                          else
                                          {
                                            do
                                            {
                                              v354 = (const void **)v351[2];
                                              v394 = *v354 == v351;
                                              v351 = v354;
                                            }
                                            while (!v394);
                                          }
                                          v351 = v354;
                                        }
                                        while (v354 != v352);
                                        v361 = (void **)v570[0];
                                        if (v570[0] != &v570[1])
                                        {
                                          do
                                          {
                                            v365 = operator new(0x28uLL);
                                            v366 = v365 + 2;
                                            *v365 = 0;
                                            v365[1] = 0;
                                            if (*((char *)v361 + 55) < 0)
                                            {
                                              sub_1000016D4(v366, v361[4], (unint64_t)v361[5]);
                                            }
                                            else
                                            {
                                              v367 = *((_OWORD *)v361 + 2);
                                              v365[4] = v361[6];
                                              *(_OWORD *)v366 = v367;
                                            }
                                            v368 = v562;
                                            *v365 = v562;
                                            v365[1] = &v562;
                                            v368[1] = v365;
                                            v562 = (void **)v365;
                                            v564 = (CommandBase *)((char *)v564 + 1);
                                            v369 = (void **)v361[1];
                                            if (v369)
                                            {
                                              do
                                              {
                                                v370 = v369;
                                                v369 = (void **)*v369;
                                              }
                                              while (v369);
                                            }
                                            else
                                            {
                                              do
                                              {
                                                v370 = (void **)v361[2];
                                                v394 = *v370 == v361;
                                                v361 = v370;
                                              }
                                              while (!v394);
                                            }
                                            v361 = v370;
                                          }
                                          while (v370 != &v570[1]);
                                        }
                                      }
                                      sub_10000BA78((uint64_t)v570, (uint64_t)v570[1]);
                                      v362 = (char *)v554;
                                      v363 = *(_QWORD *)v554;
                                      *(_QWORD *)(v363 + 8) = *((_QWORD *)v554 + 1);
                                      **((_QWORD **)v362 + 1) = v363;
                                      --v555;
                                      if (v362[39] < 0)
                                        operator delete(*((void **)v362 + 2));
                                      operator delete(v362);
                                      sub_10000BA78((uint64_t)&v571, v571.__r_.__value_.__l.__size_);
                                      sub_10000BA18((uint64_t)&v572, (char *)v572.__r_.__value_.__l.__size_);
                                      v364 = v547;
                                      if (v555 != 1)
                                        v364 = 1;
                                      if (v555 && (v364 & 1) != 0)
                                        continue;
                                      break;
                                    }
LABEL_736:
                                    memset(&v572, 170, sizeof(v572));
                                    v378 = __s;
                                    v379 = strlen(__s);
                                    if (v379 > 0x7FFFFFFFFFFFFFF7)
                                      sub_10000163C();
                                    v380 = v379;
                                    if (v379 >= 0x17)
                                    {
                                      v382 = (v379 & 0xFFFFFFFFFFFFFFF8) + 8;
                                      if ((v379 | 7) != 0x17)
                                        v382 = v379 | 7;
                                      v383 = v382 + 1;
                                      v381 = operator new(v382 + 1);
                                      v572.__r_.__value_.__l.__size_ = v380;
                                      v572.__r_.__value_.__r.__words[2] = v383 | 0x8000000000000000;
                                      v572.__r_.__value_.__r.__words[0] = (std::string::size_type)v381;
                                    }
                                    else
                                    {
                                      *((_BYTE *)&v572.__r_.__value_.__s + 23) = v379;
                                      v381 = &v572;
                                      if (!v379)
                                      {
LABEL_744:
                                        v381[v380] = 0;
                                        for (k = v563; k != &v562; k = (void ***)k[1])
                                        {
                                          v386 = *((unsigned __int8 *)k + 39);
                                          if (*((char *)k + 39) < 0)
                                          {
                                            v387 = (std::string::size_type)k[3];
                                            v388 = HIBYTE(v572.__r_.__value_.__r.__words[2]);
                                            if ((SHIBYTE(v572.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                                            {
LABEL_751:
                                              v389 = v388;
                                              if (v387 < v388)
                                                continue;
                                              goto LABEL_755;
                                            }
                                          }
                                          else
                                          {
                                            v387 = *((unsigned __int8 *)k + 39);
                                            v388 = HIBYTE(v572.__r_.__value_.__r.__words[2]);
                                            if ((SHIBYTE(v572.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                                              goto LABEL_751;
                                          }
                                          v389 = v572.__r_.__value_.__l.__size_;
                                          if (v387 < v572.__r_.__value_.__l.__size_)
                                            continue;
LABEL_755:
                                          if ((v386 & 0x80) != 0)
                                          {
                                            if (v389 == -1)
LABEL_1041:
                                              sub_1000022AC();
                                            v391 = k[2];
                                            if ((unint64_t)k[3] >= v389)
                                              v390 = v389;
                                            else
                                              v390 = (size_t)k[3];
                                          }
                                          else
                                          {
                                            if (v389 == -1)
                                              goto LABEL_1041;
                                            if (v386 >= v389)
                                              v390 = v389;
                                            else
                                              v390 = *((unsigned __int8 *)k + 39);
                                            v391 = (void **)(k + 2);
                                          }
                                          if ((v388 & 0x80u) == 0)
                                            v392 = &v572;
                                          else
                                            v392 = (std::string *)v572.__r_.__value_.__r.__words[0];
                                          v393 = memcmp(v391, v392, v390);
                                          v394 = v390 == v389 && v393 == 0;
                                          if (v394)
                                          {
                                            v395 = (_OWORD *)qword_1000202E0;
                                            if ((unint64_t)qword_1000202E0 >= *(_QWORD *)algn_1000202E8)
                                            {
                                              v385 = sub_100002060((char **)&qword_1000202D8, (uint64_t)(k + 2));
                                            }
                                            else
                                            {
                                              if ((v386 & 0x80) != 0)
                                              {
                                                sub_1000016D4((_BYTE *)qword_1000202E0, k[2], (unint64_t)k[3]);
                                              }
                                              else
                                              {
                                                v396 = *((_OWORD *)k + 1);
                                                *(_QWORD *)(qword_1000202E0 + 16) = k[4];
                                                *v395 = v396;
                                              }
                                              v385 = (char *)v395 + 24;
                                              v64[10].ivar_lyt = (char *)v395 + 24;
                                            }
                                            v64[10].ivar_lyt = v385;
                                          }
                                        }
                                        if ((SHIBYTE(v572.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                                        {
                                          if ((SHIBYTE(__dst[2]) & 0x80000000) == 0)
                                            goto LABEL_780;
LABEL_805:
                                          operator delete(__dst[0]);
                                          v397 = __str;
                                          if (!__str)
                                            goto LABEL_782;
LABEL_781:
                                          v551 = v397;
                                          operator delete(v397);
                                          goto LABEL_782;
                                        }
                                        operator delete(v572.__r_.__value_.__l.__data_);
                                        if (SHIBYTE(__dst[2]) < 0)
                                          goto LABEL_805;
LABEL_780:
                                        v397 = __str;
                                        if (__str)
                                          goto LABEL_781;
LABEL_782:
                                        if (v555)
                                        {
                                          v398 = v553;
                                          v399 = (char **)v554;
                                          v400 = *(_QWORD *)v554;
                                          *(_QWORD *)(v400 + 8) = *((_QWORD *)v553 + 1);
                                          **((_QWORD **)v398 + 1) = v400;
                                          v555 = 0;
                                          if (v399 != &v553)
                                          {
                                            do
                                            {
                                              v403 = v399[1];
                                              if (*((char *)v399 + 39) < 0)
                                                operator delete(v399[2]);
                                              operator delete(v399);
                                              v399 = (char **)v403;
                                            }
                                            while (v403 != (char *)&v553);
                                          }
                                        }
                                        ivar_lyt = (uint64_t)v64[10].ivar_lyt;
LABEL_785:
                                        v401 = qword_1000202D0;
                                        if (qword_1000202D0 >= 0xAAAAAAAAAAAAAAABLL
                                                              * ((ivar_lyt - qword_1000202D8) >> 3))
                                        {
                                          v6 = 0;
                                        }
                                        else
                                        {
                                          ++qword_1000202D0;
                                          v402 = qword_1000202D8 + 24 * v401;
                                          if (*(char *)(v402 + 23) < 0)
                                            v402 = *(_QWORD *)v402;
                                          v6 = strdup((const char *)v402);
                                        }
                                        sub_10000BA78((uint64_t)&v556, v557[0]);
                                        sub_10000BA18((uint64_t)&v558, v559[0]);
                                        v404 = v561;
                                        if (v561)
                                        {
                                          v405 = (unint64_t *)&v561->__shared_owners_;
                                          do
                                            v406 = __ldaxr(v405);
                                          while (__stlxr(v406 - 1, v405));
                                          if (!v406)
                                          {
                                            ((void (*)(std::__shared_weak_count *))v404->__on_zero_shared)(v404);
                                            std::__shared_weak_count::__release_weak(v404);
                                          }
                                        }
                                        goto LABEL_798;
                                      }
                                    }
                                    memcpy(v381, v378, v380);
                                    goto LABEL_744;
                                  }
                                }
                              }
                              if (v467 < 0)
                                goto LABEL_890;
                              goto LABEL_904;
                            }
                          }
                          memcpy(v429, v424, v428);
                          goto LABEL_847;
                        }
LABEL_831:
                        v424 = (const char *)&unk_10001ABDB;
                        goto LABEL_839;
                      }
                    }
                    else if (HIBYTE(__dst[2]))
                    {
                      v96 = (void *)HIBYTE(__dst[2]);
                      goto LABEL_200;
                    }
                    v547 = 0;
                    v98 = v555;
                    if (!v555)
                      goto LABEL_736;
                    goto LABEL_205;
                  }
                }
                memmove(v79, v73, (size_t)v78);
                goto LABEL_180;
              }
LABEL_166:
              operator delete(v69);
              v73 = __str;
              goto LABEL_167;
            }
LABEL_154:
            operator delete(v572.__r_.__value_.__l.__data_);
            goto LABEL_102;
          }
LABEL_153:
          operator delete((void *)v573);
          if ((SHIBYTE(v572.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
            goto LABEL_102;
          goto LABEL_154;
        }
        if ((v20 & 1) != 0)
          goto LABEL_97;
        v10 = &v572 + v14;
      }
      v38 = operator new(0x28uLL);
      v39 = v38 + 2;
      *v38 = 0;
      v38[1] = 0;
      if (SHIBYTE(v10->__r_.__value_.__r.__words[2]) < 0)
      {
        sub_1000016D4(v39, v10->__r_.__value_.__l.__data_, v10->__r_.__value_.__l.__size_);
      }
      else
      {
        *(_OWORD *)v39 = *(_OWORD *)&v10->__r_.__value_.__l.__data_;
        v38[4] = *((_QWORD *)&v10->__r_.__value_.__l + 2);
      }
      v40 = v14 - 4;
      if (v14 == 4)
      {
        v41 = 1;
        v42 = v38;
      }
      else
      {
        v41 = 5 - v14;
        v80 = &v572 + v14 + 1;
        v81 = v38;
        do
        {
          v83 = v80;
          v42 = operator new(0x28uLL);
          *v42 = v81;
          v42[1] = 0;
          v84 = v42 + 2;
          if (SHIBYTE(v10[1].__r_.__value_.__r.__words[2]) < 0)
          {
            sub_1000016D4(v84, v83->__r_.__value_.__l.__data_, v10[1].__r_.__value_.__l.__size_);
          }
          else
          {
            *(_OWORD *)v84 = *(_OWORD *)&v83->__r_.__value_.__l.__data_;
            v42[4] = *((_QWORD *)&v83->__r_.__value_.__l + 2);
          }
          v81[1] = v42;
          v80 = v83 + 1;
          v10 = v83;
          v81 = v42;
        }
        while (!__CFADD__(v40++, 1));
      }
      v43 = v562;
      v562[1] = v38;
      *v38 = v43;
      v42[1] = &v562;
      v562 = (void **)v42;
      v564 = (CommandBase *)((char *)v564 + v41);
      goto LABEL_97;
    }
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v5);
    if (v6)
      goto LABEL_11;
  }
  else
  {
    v6 = 0;
  }
LABEL_798:
  if (v564)
  {
    v407 = v562;
    v408 = v563;
    v409 = *v563;
    v409[1] = v562[1];
    *(_QWORD *)v407[1] = v409;
    v564 = 0;
    if (v408 != &v562)
    {
      do
      {
        v411 = (void ***)v408[1];
        if (*((char *)v408 + 39) < 0)
          operator delete(v408[2]);
        operator delete(v408);
        v408 = v411;
      }
      while (v411 != &v562);
    }
  }
  return v6;
}

void sub_10000B214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42,uint64_t a43,uint64_t a44,void *a45,uint64_t a46,uint64_t a47,void *a48,uint64_t a49,uint64_t a50,uint64_t a51,void *a52,uint64_t a53,uint64_t a54,uint64_t a55,void *__p,uint64_t a57,int a58,__int16 a59,char a60,char a61)
{
  void *v62;

  if (a61 < 0)
    operator delete(__p);
  sub_1000015D4((uint64_t)&a36);
  if (a18 < 0)
  {
    operator delete(a13);
    v62 = a19;
    if (!a19)
    {
LABEL_8:
      sub_1000036BC(&a22);
      sub_10000BA78((uint64_t)&a25, a26);
      sub_10000BA18((uint64_t)&a28, (char *)a29);
      sub_1000015D4((uint64_t)&a31);
      sub_1000036BC(&a33);
      _Unwind_Resume(a1);
    }
  }
  else
  {
    v62 = a19;
    if (!a19)
      goto LABEL_8;
  }
  operator delete(v62);
  goto LABEL_8;
}

void sub_10000B700(uint64_t a1, int a2)
{
  if (a2)
    JUMPOUT(0x10000B708);
  JUMPOUT(0x10000B87CLL);
}

void sub_10000B744()
{
  __cxa_end_catch();
  JUMPOUT(0x10000B74CLL);
}

void sub_10000B7C4(void *a1, int a2)
{
  if (a2)
    sub_1000016C4(a1);
  JUMPOUT(0x10000B87CLL);
}

void sub_10000B7FC()
{
  JUMPOUT(0x10000B820);
}

void sub_10000B808()
{
  JUMPOUT(0x10000B860);
}

void sub_10000B884()
{
  JUMPOUT(0x10000B860);
}

uint64_t **sub_10000B88C(uint64_t **a1, const void **a2, uint64_t a3, __int128 **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  int v8;
  const void *v9;
  size_t v10;
  uint64_t **v11;
  _QWORD *v12;
  const void *v13;
  const void *v14;
  int v15;
  const void *v16;
  size_t v17;
  size_t v18;
  int v19;
  int v20;
  _QWORD *v21;
  _BYTE *v22;
  __int128 *v23;
  __int128 v24;
  uint64_t *v25;
  uint64_t *v26;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *((char *)a2 + 23);
    if (v8 >= 0)
      v9 = a2;
    else
      v9 = *a2;
    if (v8 >= 0)
      v10 = *((unsigned __int8 *)a2 + 23);
    else
      v10 = (size_t)a2[1];
    while (1)
    {
      v11 = (uint64_t **)v6;
      v14 = (const void *)v6[4];
      v12 = v6 + 4;
      v13 = v14;
      v15 = *((char *)v12 + 23);
      if (v15 >= 0)
        v16 = v12;
      else
        v16 = v13;
      if (v15 >= 0)
        v17 = *((unsigned __int8 *)v12 + 23);
      else
        v17 = v12[1];
      if (v17 >= v10)
        v18 = v10;
      else
        v18 = v17;
      v19 = memcmp(v9, v16, v18);
      if (v19)
      {
        if (v19 < 0)
          goto LABEL_8;
LABEL_22:
        v20 = memcmp(v16, v9, v18);
        if (v20)
        {
          if ((v20 & 0x80000000) == 0)
            return v11;
        }
        else if (v17 >= v10)
        {
          return v11;
        }
        v6 = v11[1];
        if (!v6)
        {
          v7 = v11 + 1;
          goto LABEL_29;
        }
      }
      else
      {
        if (v10 >= v17)
          goto LABEL_22;
LABEL_8:
        v6 = *v11;
        v7 = v11;
        if (!*v11)
          goto LABEL_29;
      }
    }
  }
  v11 = a1 + 1;
LABEL_29:
  v21 = operator new(0x48uLL);
  v22 = v21 + 4;
  v23 = *a4;
  if (*((char *)*a4 + 23) < 0)
  {
    sub_1000016D4(v22, *(void **)v23, *((_QWORD *)v23 + 1));
  }
  else
  {
    v24 = *v23;
    v21[6] = *((_QWORD *)v23 + 2);
    *(_OWORD *)v22 = v24;
  }
  v21[7] = 0;
  v21[8] = 0;
  *v21 = 0;
  v21[1] = 0;
  v21[2] = v11;
  *v7 = v21;
  v25 = (uint64_t *)**a1;
  v26 = v21;
  if (v25)
  {
    *a1 = v25;
    v26 = *v7;
  }
  sub_100002978(a1[1], v26);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return (uint64_t **)v21;
}

void sub_10000BA04(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_10000BA18(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_10000BA18(a1, *(_QWORD *)a2);
    sub_10000BA18(a1, *((_QWORD *)a2 + 1));
    if (a2[55] < 0)
      operator delete(*((void **)a2 + 4));
    operator delete(a2);
  }
}

void sub_10000BA78(uint64_t a1, uint64_t a2)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  if (a2)
  {
    sub_10000BA78(a1, *(_QWORD *)a2);
    sub_10000BA78(a1, *(_QWORD *)(a2 + 8));
    v4 = *(std::__shared_weak_count **)(a2 + 64);
    if (!v4)
      goto LABEL_6;
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
      if ((*(char *)(a2 + 55) & 0x80000000) == 0)
        goto LABEL_7;
    }
    else
    {
LABEL_6:
      if ((*(char *)(a2 + 55) & 0x80000000) == 0)
      {
LABEL_7:
        operator delete((void *)a2);
        return;
      }
    }
    operator delete(*(void **)(a2 + 32));
    operator delete((void *)a2);
  }
}

void **sub_10000BB18(void **__dst, void *__src, size_t __len)
{
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  size_t v11;
  unint64_t v12;
  uint64_t v13;

  LODWORD(v6) = *((char *)__dst + 23);
  if ((v6 & 0x80000000) != 0)
  {
    v10 = (unint64_t)__dst[2];
    v8 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (__len > v8)
    {
      v11 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - (v10 & 0x7FFFFFFFFFFFFFFFLL) >= __len - v8)
      {
        v9 = *__dst;
        if (v8 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          v7 = operator new(v11);
          memcpy(v7, __src, __len);
          if (v8 != 22)
            operator delete(v9);
          __dst[2] = (void *)(v11 | 0x8000000000000000);
          *__dst = v7;
LABEL_23:
          __dst[1] = (void *)__len;
          goto LABEL_24;
        }
LABEL_8:
        v12 = 2 * v8;
        if (__len > 2 * v8)
          v12 = __len;
        v13 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17)
          v13 = v12 | 7;
        if (v12 >= 0x17)
          v11 = v13 + 1;
        else
          v11 = 23;
        goto LABEL_15;
      }
LABEL_25:
      sub_10000163C();
    }
    v6 = HIBYTE(v10);
    v7 = *__dst;
  }
  else
  {
    v7 = __dst;
    if (__len > 0x16)
    {
      if (__len - 0x7FFFFFFFFFFFFFF7 >= 0x800000000000001FLL)
      {
        v8 = 22;
        v9 = __dst;
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  if (__len)
  {
    memmove(v7, __src, __len);
    LOBYTE(v6) = *((_BYTE *)__dst + 23);
  }
  if ((v6 & 0x80) != 0)
    goto LABEL_23;
  *((_BYTE *)__dst + 23) = __len & 0x7F;
LABEL_24:
  *((_BYTE *)v7 + __len) = 0;
  return __dst;
}

void **sub_10000BC74(void **a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return sub_10000BB18(a1, __s, v4);
}

std::string *sub_10000BCA8(uint64_t a1)
{
  std::string *result;
  unint64_t v3;
  std::string *v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  int v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;

  *(_QWORD *)(a1 + 88) = 0;
  result = (std::string *)(a1 + 64);
  v3 = *(unsigned __int8 *)(a1 + 87);
  if ((*(char *)(a1 + 87) & 0x80000000) == 0)
  {
    v4 = result;
    v5 = *(unsigned __int8 *)(a1 + 87);
    v6 = *(_DWORD *)(a1 + 96);
    if ((v6 & 8) == 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = *(std::string **)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
LABEL_3:
    *(_QWORD *)(a1 + 88) = (char *)v4 + v5;
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = (char *)v4 + v5;
  }
LABEL_4:
  if ((v6 & 0x10) == 0)
    return result;
  *(_QWORD *)(a1 + 88) = (char *)v4 + v5;
  if ((v3 & 0x80) == 0)
  {
    v7 = 22;
    if (v3 > 0x15)
    {
      *(_BYTE *)(a1 + 87) = 22;
      goto LABEL_15;
    }
LABEL_11:
    result = std::string::append(result, v7 - v3, 0);
    v8 = *(char *)(a1 + 87);
    if (v8 < 0)
      goto LABEL_16;
    goto LABEL_12;
  }
  v3 = *(_QWORD *)(a1 + 72);
  v7 = (*(_QWORD *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1;
  if (v3 < v7)
    goto LABEL_11;
  result = *(std::string **)(a1 + 64);
  *(_QWORD *)(a1 + 72) = v7;
LABEL_15:
  result->__r_.__value_.__s.__data_[v7] = 0;
  v8 = *(char *)(a1 + 87);
  if (v8 < 0)
  {
LABEL_16:
    v9 = (char *)v4 + *(_QWORD *)(a1 + 72);
    *(_QWORD *)(a1 + 40) = v4;
    *(_QWORD *)(a1 + 48) = v4;
    *(_QWORD *)(a1 + 56) = v9;
    if ((*(_BYTE *)(a1 + 96) & 3) == 0)
      return result;
    goto LABEL_17;
  }
LABEL_12:
  *(_QWORD *)(a1 + 40) = v4;
  *(_QWORD *)(a1 + 48) = v4;
  *(_QWORD *)(a1 + 56) = (char *)v4 + v8;
  if ((*(_BYTE *)(a1 + 96) & 3) == 0)
    return result;
LABEL_17:
  if (v5 >> 31)
  {
    v10 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
    v11 = 0x7FFFFFFF * ((v10 + ((v5 - 0x80000000 - v10) >> 1)) >> 30);
    v4 = (std::string *)((char *)v4 + v11 + 0x7FFFFFFF);
    v5 = v5 - v11 - 0x7FFFFFFF;
    *(_QWORD *)(a1 + 48) = v4;
  }
  if (v5)
    *(_QWORD *)(a1 + 48) = (char *)v4 + v5;
  return result;
}

uint64_t sub_10000BE10(uint64_t a1)
{
  const std::ios_base *v2;
  std::ios_base::fmtflags v3;
  const std::locale::facet *v4;
  std::locale v6;

  v2 = *(const std::ios_base **)a1;
  v2->__fmtflags_ = *(_DWORD *)(a1 + 8);
  v3 = *(char *)(a1 + 12);
  if (v2[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v2);
    v4 = std::locale::use_facet(&v6, &std::ctype<char>::id);
    ((void (*)(const std::locale::facet *, uint64_t))v4->__vftable[2].~facet_0)(v4, 32);
    std::locale::~locale(&v6);
  }
  v2[1].__fmtflags_ = v3;
  return a1;
}

void sub_10000BE98(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  sub_1000016C4(a1);
}

uint64_t sub_10000BEAC(uint64_t a1)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;

  *(_QWORD *)a1 = off_10001C798;
  sub_10000BA78(a1 + 184, *(_QWORD *)(a1 + 192));
  sub_10000BA78(a1 + 160, *(_QWORD *)(a1 + 168));
  sub_100002900(a1 + 136, *(_QWORD *)(a1 + 144));
  sub_10000BF68(a1 + 112, *(char **)(a1 + 120));
  sub_10000BA18(a1 + 88, *(char **)(a1 + 96));
  if (*(char *)(a1 + 87) < 0)
  {
    operator delete(*(void **)(a1 + 64));
    if ((*(char *)(a1 + 63) & 0x80000000) == 0)
    {
LABEL_3:
      v2 = *(std::__shared_weak_count **)(a1 + 32);
      if (!v2)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(char *)(a1 + 63) & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(*(void **)(a1 + 40));
  v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2)
LABEL_4:
    std::__shared_weak_count::__release_weak(v2);
LABEL_5:
  v3 = *(std::__shared_weak_count **)(a1 + 16);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
  return a1;
}

void sub_10000BF68(uint64_t a1, char *a2)
{
  const void *v4;

  if (a2)
  {
    sub_10000BF68(a1, *(_QWORD *)a2);
    sub_10000BF68(a1, *((_QWORD *)a2 + 1));
    v4 = (const void *)*((_QWORD *)a2 + 7);
    if (v4)
      _Block_release(v4);
    if (a2[55] < 0)
      operator delete(*((void **)a2 + 4));
    operator delete(a2);
  }
}

uint64_t CommandBase::CommandBase(uint64_t a1, char *__s, _QWORD *a3)
{
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  void *v8;
  size_t v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = off_10001C798;
  v5 = a3[1];
  *(_QWORD *)(a1 + 24) = *a3;
  *(_QWORD *)(a1 + 32) = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 16);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = (void *)(a1 + 40);
  v9 = strlen(__s);
  if (v9 >= 0x7FFFFFFFFFFFFFF8)
    sub_10000163C();
  v10 = v9;
  if (v9 >= 0x17)
  {
    v11 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17)
      v11 = v9 | 7;
    v12 = v11 + 1;
    v8 = operator new(v11 + 1);
    *(_QWORD *)(a1 + 48) = v10;
    *(_QWORD *)(a1 + 56) = v12 | 0x8000000000000000;
    *(_QWORD *)(a1 + 40) = v8;
  }
  else
  {
    *(_BYTE *)(a1 + 63) = v9;
    if (!v9)
      goto LABEL_12;
  }
  memmove(v8, __s, v10);
LABEL_12:
  *((_BYTE *)v8 + v10) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = a1 + 96;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = a1 + 120;
  *(_QWORD *)(a1 + 144) = 0;
  *(_QWORD *)(a1 + 128) = 0;
  *(_QWORD *)(a1 + 136) = a1 + 144;
  *(_QWORD *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 152) = 0;
  *(_QWORD *)(a1 + 160) = a1 + 168;
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 192) = 0;
  *(_QWORD *)(a1 + 176) = 0;
  *(_QWORD *)(a1 + 184) = a1 + 192;
  return a1;
}

void sub_10000C108(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;

  v3 = *(std::__shared_weak_count **)(v1 + 32);
  if (v3)
  {
    std::__shared_weak_count::__release_weak(v3);
    v4 = *(std::__shared_weak_count **)(v1 + 16);
    if (!v4)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else
  {
    v4 = *(std::__shared_weak_count **)(v1 + 16);
    if (!v4)
      goto LABEL_3;
  }
  std::__shared_weak_count::__release_weak(v4);
  _Unwind_Resume(exception_object);
}

void CommandBase::init(CommandBase *this)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  __int128 *v4;
  void **v5;
  size_t v6;
  __int128 v7;
  size_t v8;
  __int128 *v9;
  __int128 *v10;
  size_t v11;
  int v12;
  size_t v13;
  unint64_t v14;
  void **v15;
  std::string *p_p;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int v20;
  const std::string::value_type *v21;
  std::string::size_type v22;
  std::string *v23;
  std::string::size_type v24;
  char v25;
  std::__shared_weak_count *v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  std::string __p;
  uint64_t v30;
  std::__shared_weak_count *v31;
  _QWORD v32[2];

  v30 = 0;
  v31 = 0;
  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 4);
  if (v2)
  {
    v31 = std::__shared_weak_count::lock(v2);
    if (v31)
    {
      v3 = *((_QWORD *)this + 3);
      v30 = v3;
      if (v3)
      {
        if ((CommandBase *)v3 != this)
        {
          v4 = (__int128 *)(v3 + 64);
          v5 = (void **)((char *)this + 64);
          v6 = *(unsigned __int8 *)(v3 + 87);
          if (*((char *)this + 87) < 0)
          {
            v9 = *(__int128 **)(v3 + 64);
            v8 = *(_QWORD *)(v3 + 72);
            if ((v6 & 0x80u) == 0)
              v10 = v4;
            else
              v10 = v9;
            if ((v6 & 0x80u) == 0)
              v11 = v6;
            else
              v11 = v8;
            sub_1000023F8(v5, v10, v11);
          }
          else if ((v6 & 0x80) != 0)
          {
            sub_100002334(v5, *(void **)(v3 + 64), *(_QWORD *)(v3 + 72));
          }
          else
          {
            v7 = *v4;
            *((_QWORD *)this + 10) = *(_QWORD *)(v3 + 80);
            *(_OWORD *)v5 = v7;
          }
        }
      }
    }
  }
  v12 = *((char *)this + 87);
  if (v12 >= 0)
    v13 = *((unsigned __int8 *)this + 87);
  else
    v13 = *((_QWORD *)this + 9);
  v14 = v13 + 1;
  memset(&__p, 170, sizeof(__p));
  if (v13 + 1 >= 0x7FFFFFFFFFFFFFF8)
    sub_10000163C();
  v15 = (void **)((char *)this + 64);
  if (v14 >= 0x17)
  {
    v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v17 = v14 | 7;
    v18 = v17 + 1;
    p_p = (std::string *)operator new(v17 + 1);
    __p.__r_.__value_.__l.__size_ = v13 + 1;
    __p.__r_.__value_.__r.__words[2] = v18 | 0x8000000000000000;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)p_p;
  }
  else
  {
    memset(&__p, 0, sizeof(__p));
    p_p = &__p;
    *((_BYTE *)&__p.__r_.__value_.__s + 23) = v13 + 1;
    if (!v13)
      goto LABEL_30;
  }
  if (v12 >= 0)
    v19 = (char *)this + 64;
  else
    v19 = (char *)*v15;
  memmove(p_p, v19, v13);
LABEL_30:
  *(_WORD *)((char *)&p_p->__r_.__value_.__l.__data_ + v13) = 47;
  v20 = *((char *)this + 63);
  if (v20 >= 0)
    v21 = (char *)this + 40;
  else
    v21 = (const std::string::value_type *)*((_QWORD *)this + 5);
  if (v20 >= 0)
    v22 = *((unsigned __int8 *)this + 63);
  else
    v22 = *((_QWORD *)this + 6);
  v23 = std::string::append(&__p, v21, v22);
  v24 = v23->__r_.__value_.__r.__words[0];
  v32[0] = v23->__r_.__value_.__l.__size_;
  *(_QWORD *)((char *)v32 + 7) = *(std::string::size_type *)((char *)&v23->__r_.__value_.__r.__words[1] + 7);
  v25 = HIBYTE(v23->__r_.__value_.__r.__words[2]);
  v23->__r_.__value_.__l.__size_ = 0;
  v23->__r_.__value_.__r.__words[2] = 0;
  v23->__r_.__value_.__r.__words[0] = 0;
  if (*((char *)this + 87) < 0)
    operator delete(*v15);
  *((_QWORD *)this + 8) = v24;
  *((_QWORD *)this + 9) = v32[0];
  *(_QWORD *)((char *)this + 79) = *(_QWORD *)((char *)v32 + 7);
  *((_BYTE *)this + 87) = v25;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  (*(void (**)(CommandBase *))(*(_QWORD *)this + 56))(this);
  v26 = v31;
  if (v31)
  {
    p_shared_owners = (unint64_t *)&v31->__shared_owners_;
    do
      v28 = __ldaxr(p_shared_owners);
    while (__stlxr(v28 - 1, p_shared_owners));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
}

void sub_10000C398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  if (a14 < 0)
  {
    operator delete(__p);
    sub_1000015D4((uint64_t)&a15);
    _Unwind_Resume(a1);
  }
  sub_1000015D4((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void CommandBase::list(CommandBase *this)
{
  _QWORD *v1;
  char *v2;
  uint64_t *v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _QWORD *v7;
  const std::locale::facet *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  BOOL v12;
  CommandBase *v13;
  __int128 v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  _QWORD *v22;
  const std::locale::facet *v23;
  uint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  CommandBase *v28;
  CommandBase *v29;
  _BYTE __p[32];
  unint64_t v32;
  std::locale v33;

  v1 = (_QWORD *)*((_QWORD *)this + 11);
  v2 = (char *)this + 96;
  if (v1 != (_QWORD *)((char *)this + 96))
  {
    do
    {
      memset(__p, 170, 24);
      if (*((char *)v1 + 55) < 0)
      {
        sub_1000016D4(__p, (void *)v1[4], v1[5]);
      }
      else
      {
        *(_OWORD *)__p = *((_OWORD *)v1 + 2);
        *(_QWORD *)&__p[16] = v1[6];
      }
      v3 = sub_100001760(&std::cout, (uint64_t)"\t", 1);
      v4 = *v3;
      *(uint64_t *)((char *)v3 + *(_QWORD *)(*v3 - 24) + 24) = 4;
      *(_DWORD *)((char *)v3 + *(_QWORD *)(v4 - 24) + 8) = *(_DWORD *)((_BYTE *)v3 + *(_QWORD *)(v4 - 24) + 8) & 0xFFFFFF4F | 0x80;
      if (__p[23] >= 0)
        v5 = __p;
      else
        v5 = *(_BYTE **)__p;
      if (__p[23] >= 0)
        v6 = __p[23];
      else
        v6 = *(_QWORD *)&__p[8];
      v7 = sub_100001760(v3, (uint64_t)v5, v6);
      std::ios_base::getloc((const std::ios_base *)((char *)v7 + *(_QWORD *)(*v7 - 24)));
      v8 = std::locale::use_facet(&v33, &std::ctype<char>::id);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
      std::locale::~locale(&v33);
      std::ostream::put(v7, v9);
      std::ostream::flush(v7);
      if ((__p[23] & 0x80000000) != 0)
      {
        operator delete(*(void **)__p);
        v10 = (char *)v1[1];
        if (v10)
        {
          do
          {
LABEL_17:
            v11 = v10;
            v10 = *(char **)v10;
          }
          while (v10);
          goto LABEL_3;
        }
      }
      else
      {
        v10 = (char *)v1[1];
        if (v10)
          goto LABEL_17;
      }
      do
      {
        v11 = (char *)v1[2];
        v12 = *(_QWORD *)v11 == (_QWORD)v1;
        v1 = v11;
      }
      while (!v12);
LABEL_3:
      v1 = v11;
    }
    while (v11 != v2);
  }
  v13 = (CommandBase *)*((_QWORD *)this + 20);
  if (v13 != (CommandBase *)((char *)this + 168))
  {
    do
    {
      v32 = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)__p = v14;
      *(_OWORD *)&__p[16] = v14;
      if (*((char *)v13 + 55) < 0)
      {
        sub_1000016D4(__p, *((void **)v13 + 4), *((_QWORD *)v13 + 5));
        v15 = *((_QWORD *)v13 + 8);
        *(_QWORD *)&__p[24] = *((_QWORD *)v13 + 7);
        v32 = v15;
        if (v15)
        {
LABEL_29:
          v16 = (unint64_t *)(v15 + 8);
          do
            v17 = __ldxr(v16);
          while (__stxr(v17 + 1, v16));
        }
      }
      else
      {
        *(_OWORD *)__p = *((_OWORD *)v13 + 2);
        *(_QWORD *)&__p[16] = *((_QWORD *)v13 + 6);
        v15 = *((_QWORD *)v13 + 8);
        *(_QWORD *)&__p[24] = *((_QWORD *)v13 + 7);
        v32 = v15;
        if (v15)
          goto LABEL_29;
      }
      v18 = sub_100001760(&std::cout, (uint64_t)"\t", 1);
      v19 = *v18;
      *(uint64_t *)((char *)v18 + *(_QWORD *)(*v18 - 24) + 24) = 4;
      *(_DWORD *)((char *)v18 + *(_QWORD *)(v19 - 24) + 8) = *(_DWORD *)((_BYTE *)v18 + *(_QWORD *)(v19 - 24) + 8) & 0xFFFFFF4F | 0x80;
      if (__p[23] >= 0)
        v20 = __p;
      else
        v20 = *(_BYTE **)__p;
      if (__p[23] >= 0)
        v21 = __p[23];
      else
        v21 = *(_QWORD *)&__p[8];
      v22 = sub_100001760(v18, (uint64_t)v20, v21);
      std::ios_base::getloc((const std::ios_base *)((char *)v22 + *(_QWORD *)(*v22 - 24)));
      v23 = std::locale::use_facet(&v33, &std::ctype<char>::id);
      v24 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v23->__vftable[2].~facet_0)(v23, 10);
      std::locale::~locale(&v33);
      std::ostream::put(v22, v24);
      std::ostream::flush(v22);
      v25 = (std::__shared_weak_count *)v32;
      if (!v32)
        goto LABEL_41;
      v26 = (unint64_t *)(v32 + 8);
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
        if ((__p[23] & 0x80000000) == 0)
        {
LABEL_42:
          v28 = (CommandBase *)*((_QWORD *)v13 + 1);
          if (v28)
            goto LABEL_46;
          goto LABEL_48;
        }
      }
      else
      {
LABEL_41:
        if ((__p[23] & 0x80000000) == 0)
          goto LABEL_42;
      }
      operator delete(*(void **)__p);
      v28 = (CommandBase *)*((_QWORD *)v13 + 1);
      if (v28)
      {
        do
        {
LABEL_46:
          v29 = v28;
          v28 = *(CommandBase **)v28;
        }
        while (v28);
        goto LABEL_24;
      }
      do
      {
LABEL_48:
        v29 = (CommandBase *)*((_QWORD *)v13 + 2);
        v12 = *(_QWORD *)v29 == (_QWORD)v13;
        v13 = v29;
      }
      while (!v12);
LABEL_24:
      v13 = v29;
    }
    while (v29 != (CommandBase *)((char *)this + 168));
  }
}

void sub_10000C774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, std::locale a19)
{
  sub_10000C7CC((uint64_t)&__p);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C7CC(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (!v2)
    goto LABEL_5;
  p_shared_owners = (unint64_t *)&v2->__shared_owners_;
  do
    v4 = __ldaxr(p_shared_owners);
  while (__stlxr(v4 - 1, p_shared_owners));
  if (!v4)
  {
    ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
    std::__shared_weak_count::__release_weak(v2);
    if ((*(char *)(a1 + 23) & 0x80000000) == 0)
      return a1;
  }
  else
  {
LABEL_5:
    if ((*(char *)(a1 + 23) & 0x80000000) == 0)
      return a1;
  }
  operator delete(*(void **)a1);
  return a1;
}

uint64_t CommandBase::displayHelp(CommandBase *this, int a2)
{
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v4;
  const std::locale::facet *v5;
  uint64_t v6;
  std::locale *v7;
  char **v8;
  std::ostream *v9;
  const char *v10;
  char *v11;
  const char *v12;
  std::ostream *v13;
  const void *locale;
  std::locale::__imp *locale_high;
  char **v16;
  int v17;
  char *v18;
  std::locale::__imp *v19;
  size_t v20;
  int v21;
  char *v22;
  char *v23;
  char *v24;
  int v25;
  char *v26;
  size_t v27;
  size_t v28;
  int v29;
  uint64_t *v30;
  char v31;
  void *v32;
  size_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  void **v41;
  uint64_t v42;
  _QWORD *v43;
  const std::locale::facet *v44;
  uint64_t v45;
  std::locale *v46;
  std::locale *v47;
  BOOL v48;
  const std::locale::facet *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  _QWORD *v53;
  const std::locale::facet *v54;
  uint64_t v55;
  char *v56;
  __int128 v57;
  _QWORD *v58;
  unint64_t v59;
  unint64_t *v60;
  unint64_t v61;
  unint64_t *v62;
  unint64_t v63;
  const void **v64;
  const void ***v65;
  const void **v66;
  const void ***v67;
  uint64_t *v68;
  const void **v69;
  char *v70;
  _BYTE *v71;
  __int128 v72;
  std::locale::__imp *v73;
  char *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  _BYTE *v78;
  int v79;
  uint64_t v80;
  int v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  const void ***v85;
  char **v86;
  char *v87;
  uint64_t v88;
  uint64_t *v89;
  const void **v90;
  char *v91;
  _BYTE *v92;
  __int128 v93;
  char *v94;
  unint64_t *v95;
  unint64_t v96;
  std::locale::__imp *v97;
  uint64_t v98;
  uint64_t v99;
  _BYTE *v100;
  uint64_t v101;
  _BYTE *v102;
  int v103;
  uint64_t v104;
  int v105;
  uint64_t *v106;
  uint64_t v107;
  uint64_t v108;
  const void ***v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t v112;
  _QWORD *v113;
  __int128 v114;
  std::locale *v115;
  const std::locale::facet *v116;
  uint64_t v117;
  uint64_t *v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  __int128 v123;
  uint64_t *v124;
  size_t v125;
  _BYTE *v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  uint64_t *v130;
  int v131;
  const void *v132;
  size_t v133;
  int v134;
  const void *v135;
  size_t v136;
  size_t v137;
  int v138;
  uint64_t *v139;
  uint64_t *v140;
  int v141;
  const void *v142;
  size_t v143;
  size_t v144;
  int v145;
  int v146;
  uint64_t **v147;
  _QWORD *v148;
  char *v149;
  char *v150;
  __int128 v151;
  _BYTE *v152;
  __int128 v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  _BYTE *v158;
  int v159;
  uint64_t v160;
  int v161;
  uint64_t *v162;
  uint64_t v163;
  uint64_t v164;
  _QWORD *v165;
  uint64_t *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t *v169;
  uint64_t v170;
  void **v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t *v174;
  uint64_t *v175;
  void **v176;
  void *v177;
  uint64_t v178;
  const void *v179;
  const void *v180;
  int v181;
  const void *v182;
  size_t v183;
  size_t v184;
  int v185;
  int v186;
  char *v187;
  uint64_t *v188;
  void **v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t *v192;
  uint64_t v193;
  uint64_t *v194;
  _BYTE *v195;
  int v196;
  uint64_t v197;
  int v198;
  uint64_t **v199;
  uint64_t *v200;
  uint64_t v201;
  int v202;
  uint64_t v203;
  uint64_t *v204;
  uint64_t v205;
  _QWORD *v206;
  uint64_t v207;
  uint64_t *v208;
  uint64_t *v209;
  void **v210;
  void *v211;
  uint64_t v212;
  const void *v213;
  const void *v214;
  int v215;
  const void *v216;
  size_t v217;
  size_t v218;
  int v219;
  int v220;
  _QWORD *v221;
  uint64_t *v222;
  void **v223;
  uint64_t *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  _BYTE *v229;
  int v230;
  uint64_t v231;
  int v232;
  uint64_t *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t *v236;
  uint64_t v237;
  _QWORD *v238;
  uint64_t v239;
  int v240;
  uint64_t v241;
  uint64_t v242;
  const std::locale::facet *v243;
  uint64_t v244;
  char *v245;
  char **v246;
  uint64_t v247;
  uint64_t v248;
  __int128 v249;
  unint64_t v250;
  unint64_t *v251;
  unint64_t v252;
  _BYTE *v253;
  uint64_t v254;
  _QWORD *v255;
  std::__shared_weak_count *v256;
  unint64_t *v257;
  unint64_t v258;
  uint64_t *v259;
  uint64_t *v260;
  uint64_t v261;
  const void **v262;
  const void *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  _BYTE *v267;
  _BYTE *v268;
  uint64_t v269;
  _QWORD *v270;
  const std::locale::facet *v271;
  uint64_t v272;
  uint64_t *v273;
  uint64_t v274;
  int v275;
  uint64_t v276;
  uint64_t v277;
  _QWORD *v278;
  _QWORD *v279;
  size_t v280;
  void *v281;
  uint64_t v282;
  const void **v283;
  const void *v284;
  uint64_t v285;
  uint64_t v286;
  void **v287;
  uint64_t v288;
  _QWORD *v289;
  const std::locale::facet *v290;
  uint64_t v291;
  std::__shared_weak_count *v292;
  unint64_t *p_shared_owners;
  unint64_t v294;
  std::__shared_weak_count *v295;
  unint64_t *v296;
  unint64_t v297;
  char *v298;
  char *v299;
  char *v300;
  uint64_t *v301;
  uint64_t v302;
  _QWORD *v303;
  uint64_t *v304;
  uint64_t v305;
  _QWORD *v306;
  const std::locale::facet *v307;
  uint64_t v308;
  const std::locale::facet *v309;
  uint64_t v310;
  uint64_t *v311;
  uint64_t v312;
  _QWORD *v313;
  const std::locale::facet *v314;
  uint64_t v315;
  uint64_t *v316;
  uint64_t v317;
  _QWORD *v318;
  uint64_t *v319;
  uint64_t v320;
  _QWORD *v321;
  const std::locale::facet *v322;
  uint64_t v323;
  uint64_t *v324;
  uint64_t v325;
  _QWORD *v326;
  uint64_t *v327;
  uint64_t v328;
  _QWORD *v329;
  const std::locale::facet *v330;
  uint64_t v331;
  uint64_t *v332;
  uint64_t v333;
  _QWORD *v334;
  uint64_t *v335;
  uint64_t v336;
  _QWORD *v337;
  const std::locale::facet *v338;
  uint64_t v339;
  uint64_t *v340;
  uint64_t v341;
  _QWORD *v342;
  uint64_t *v343;
  uint64_t v344;
  _QWORD *v345;
  const std::locale::facet *v346;
  uint64_t v347;
  const std::locale::facet *v348;
  uint64_t v349;
  char *v352;
  void *v353;
  void *v354;
  void *v355;
  char *v356;
  _QWORD *v358;
  std::locale *v359;
  _BYTE __dst[32];
  unint64_t v361;
  void *__p[4];
  __int128 v363;
  __int128 v364;
  __int128 v365;
  void *v366[2];
  __int128 v367;
  __int128 v368;
  _OWORD v369[9];
  unint64_t v370;
  std::locale v371[4];
  __int128 v372;
  __int128 v373;
  __int128 v374;
  void *v375[2];
  __int128 v376;
  __int128 v377;
  _OWORD v378[9];
  unint64_t v379;
  uint64_t *v380;
  char *v381;
  uint64_t v382;
  uint64_t **v383;
  char *v384;
  uint64_t v385;
  uint64_t **v386;
  char *v387;
  uint64_t v388;
  _QWORD *v389;
  std::__shared_weak_count *v390;
  std::locale v391[2];
  __int128 v392;
  unint64_t v393;
  std::locale v394;

  if (*((_QWORD *)this + 13))
  {
    v2 = sub_100001760(&std::cout, (uint64_t)"\t", 1);
    v3 = *v2;
    *(uint64_t *)((char *)v2 + *(_QWORD *)(*v2 - 24) + 24) = 4;
    *(_DWORD *)((char *)v2 + *(_QWORD *)(v3 - 24) + 8) = *(_DWORD *)((_BYTE *)v2 + *(_QWORD *)(v3 - 24) + 8) & 0xFFFFFF4F | 0x80;
    v4 = sub_100001760(v2, (uint64_t)"Commands:", 9);
    std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(_QWORD *)(*v4 - 24)));
    v5 = std::locale::use_facet(v371, &std::ctype<char>::id);
    v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 10);
    std::locale::~locale(v371);
    std::ostream::put(v4, v6);
    std::ostream::flush(v4);
    v7 = (std::locale *)*((_QWORD *)this + 11);
    v359 = (std::locale *)((char *)this + 96);
    if (v7 != (std::locale *)((char *)this + 96))
    {
      v8 = (char **)((char *)this + 144);
      v9 = &std::cout;
      v10 = "\t";
      do
      {
        memset(v371, 170, 24);
        if (SHIBYTE(v7[6].__locale_) < 0)
        {
          sub_1000016D4(v371, v7[4].__locale_, (unint64_t)v7[5].__locale_);
        }
        else
        {
          *(_OWORD *)&v371[0].__locale_ = *(_OWORD *)&v7[4].__locale_;
          v371[2] = v7[6];
        }
        __p[1] = (void *)0xAAAAAAAAAAAAAAAALL;
        __p[2] = (void *)0x3AAAAAAAAAAAAAALL;
        __p[0] = (void *)0xAAAAAAAA002E2E2ELL;
        v11 = *v8;
        if (!*v8)
          goto LABEL_59;
        v12 = v10;
        v13 = v9;
        if (SHIBYTE(v371[2].__locale_) >= 0)
          locale = v371;
        else
          locale = v371[0].__locale_;
        if (SHIBYTE(v371[2].__locale_) >= 0)
          locale_high = (std::locale::__imp *)HIBYTE(v371[2].__locale_);
        else
          locale_high = v371[1].__locale_;
        v16 = (char **)((char *)this + 144);
        do
        {
          while (1)
          {
            v17 = v11[55];
            v18 = v17 >= 0 ? v11 + 32 : (char *)*((_QWORD *)v11 + 4);
            v19 = v17 >= 0 ? (std::locale::__imp *)v11[55] : (std::locale::__imp *)*((_QWORD *)v11 + 5);
            v20 = (size_t)(locale_high >= v19 ? v19 : locale_high);
            v21 = memcmp(v18, locale, v20);
            if (v21)
              break;
            if (v19 < locale_high)
              goto LABEL_18;
LABEL_16:
            v16 = (char **)v11;
            v11 = *(char **)v11;
            if (!v11)
              goto LABEL_33;
          }
          if ((v21 & 0x80000000) == 0)
            goto LABEL_16;
LABEL_18:
          v11 = (char *)*((_QWORD *)v11 + 1);
        }
        while (v11);
LABEL_33:
        v9 = v13;
        v10 = v12;
        if (v16 == v8)
          goto LABEL_59;
        v24 = v16[4];
        v23 = (char *)(v16 + 4);
        v22 = v24;
        v25 = v23[23];
        if (v25 >= 0)
          v26 = v23;
        else
          v26 = v22;
        if (v25 >= 0)
          v27 = v23[23];
        else
          v27 = *((_QWORD *)v23 + 1);
        if (v27 >= (unint64_t)locale_high)
          v28 = (size_t)locale_high;
        else
          v28 = v27;
        v29 = memcmp(locale, v26, v28);
        if (v29)
        {
          if (v29 < 0)
            goto LABEL_59;
        }
        else if ((unint64_t)locale_high < v27)
        {
          goto LABEL_59;
        }
        v30 = sub_10000FCDC((uint64_t **)this + 17, (const void **)&v371[0].__locale_, (uint64_t)v371);
        if (__p != (void **)(v30 + 7))
        {
          v31 = *((_BYTE *)v30 + 79);
          if (SHIBYTE(__p[2]) < 0)
          {
            if (v31 >= 0)
              v32 = v30 + 7;
            else
              v32 = (void *)v30[7];
            if (v31 >= 0)
              v33 = *((unsigned __int8 *)v30 + 79);
            else
              v33 = v30[8];
            sub_1000023F8(__p, v32, v33);
          }
          else if ((*((_BYTE *)v30 + 79) & 0x80) != 0)
          {
            sub_100002334(__p, (void *)v30[7], v30[8]);
          }
          else
          {
            *(_OWORD *)__p = *(_OWORD *)(v30 + 7);
            __p[2] = (void *)v30[9];
          }
        }
LABEL_59:
        v34 = sub_100001760(v9, (uint64_t)v10, 1);
        v35 = *v34;
        *(uint64_t *)((char *)v34 + *(_QWORD *)(*v34 - 24) + 24) = 16;
        *(_DWORD *)((char *)v34 + *(_QWORD *)(v35 - 24) + 8) = *(_DWORD *)((_BYTE *)v34 + *(_QWORD *)(v35 - 24) + 8) & 0xFFFFFF4F | 0x80;
        if (SHIBYTE(v371[2].__locale_) >= 0)
          v36 = v371;
        else
          v36 = v371[0].__locale_;
        if (SHIBYTE(v371[2].__locale_) >= 0)
          v37 = HIBYTE(v371[2].__locale_);
        else
          v37 = (uint64_t)v371[1].__locale_;
        v38 = sub_100001760(v34, (uint64_t)v36, v37);
        sub_100001760(v38, (uint64_t)":", 1);
        v39 = sub_100001760(v9, (uint64_t)v10, 1);
        v40 = *v39;
        *(uint64_t *)((char *)v39 + *(_QWORD *)(*v39 - 24) + 24) = 20;
        *(_DWORD *)((char *)v39 + *(_QWORD *)(v40 - 24) + 8) = *(_DWORD *)((_BYTE *)v39 + *(_QWORD *)(v40 - 24) + 8) & 0xFFFFFF4F | 0x20;
        if (SHIBYTE(__p[2]) >= 0)
          v41 = __p;
        else
          v41 = (void **)__p[0];
        if (SHIBYTE(__p[2]) >= 0)
          v42 = HIBYTE(__p[2]);
        else
          v42 = (uint64_t)__p[1];
        v43 = sub_100001760(v39, (uint64_t)v41, v42);
        std::ios_base::getloc((const std::ios_base *)((char *)v43 + *(_QWORD *)(*v43 - 24)));
        v44 = std::locale::use_facet(v391, &std::ctype<char>::id);
        v45 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v44->__vftable[2].~facet_0)(v44, 10);
        std::locale::~locale(v391);
        std::ostream::put(v43, v45);
        std::ostream::flush(v43);
        if (SHIBYTE(__p[2]) < 0)
        {
          operator delete(__p[0]);
          if (SHIBYTE(v371[2].__locale_) < 0)
            goto LABEL_76;
LABEL_73:
          v46 = (std::locale *)v7[1].__locale_;
          if (!v46)
            goto LABEL_79;
          do
          {
LABEL_77:
            v47 = v46;
            v46 = (std::locale *)v46->__locale_;
          }
          while (v46);
        }
        else
        {
          if ((SHIBYTE(v371[2].__locale_) & 0x80000000) == 0)
            goto LABEL_73;
LABEL_76:
          operator delete(v371[0].__locale_);
          v46 = (std::locale *)v7[1].__locale_;
          if (v46)
            goto LABEL_77;
          do
          {
LABEL_79:
            v47 = (std::locale *)v7[2].__locale_;
            v48 = v47->__locale_ == (std::locale::__imp *)v7;
            v7 = v47;
          }
          while (!v48);
        }
        v7 = v47;
      }
      while (v47 != v359);
    }
  }
  if (*((_QWORD *)this + 22))
  {
    std::ios_base::getloc((const std::ios_base *)((char *)&std::cout
                                                + (unint64_t)std::cout.__vftable[-2].~basic_ostream_0));
    v49 = std::locale::use_facet(v371, &std::ctype<char>::id);
    v50 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v49->__vftable[2].~facet_0)(v49, 10);
    std::locale::~locale(v371);
    std::ostream::put(&std::cout, v50);
    std::ostream::flush(&std::cout);
    v51 = sub_100001760(&std::cout, (uint64_t)"\t", 1);
    v52 = *v51;
    *(uint64_t *)((char *)v51 + *(_QWORD *)(*v51 - 24) + 24) = 4;
    *(_DWORD *)((char *)v51 + *(_QWORD *)(v52 - 24) + 8) = *(_DWORD *)((_BYTE *)v51 + *(_QWORD *)(v52 - 24) + 8) & 0xFFFFFF4F | 0x80;
    v53 = sub_100001760(v51, (uint64_t)"Sub-commands:", 13);
    std::ios_base::getloc((const std::ios_base *)((char *)v53 + *(_QWORD *)(*v53 - 24)));
    v54 = std::locale::use_facet(v371, &std::ctype<char>::id);
    v55 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v54->__vftable[2].~facet_0)(v54, 10);
    std::locale::~locale(v371);
    std::ostream::put(v53, v55);
    std::ostream::flush(v53);
    v56 = (char *)*((_QWORD *)this + 20);
    v352 = (char *)this + 168;
    if (v56 != (char *)this + 168)
    {
      v359 = &v371[2];
      while (1)
      {
        v393 = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v57 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v57 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v391[0].__locale_ = v57;
        v392 = v57;
        v356 = v56;
        if (v56[55] < 0)
        {
          sub_1000016D4(v391, *((void **)v56 + 4), *((_QWORD *)v56 + 5));
          v58 = (_QWORD *)*((_QWORD *)v356 + 7);
          v59 = *((_QWORD *)v356 + 8);
          *((_QWORD *)&v392 + 1) = v58;
          v393 = v59;
          if (!v59)
          {
LABEL_96:
            v389 = v58;
            v390 = 0;
            v387 = 0;
            v388 = 0;
            v386 = (uint64_t **)&v387;
            v64 = (const void **)v58[11];
            v65 = (const void ***)(v58 + 12);
            if (v64 != v58 + 12)
              break;
            goto LABEL_97;
          }
        }
        else
        {
          *(_OWORD *)&v391[0].__locale_ = *((_OWORD *)v56 + 2);
          *(_QWORD *)&v392 = *((_QWORD *)v56 + 6);
          v58 = (_QWORD *)*((_QWORD *)v56 + 7);
          v59 = *((_QWORD *)v56 + 8);
          *((_QWORD *)&v392 + 1) = v58;
          v393 = v59;
          if (!v59)
            goto LABEL_96;
        }
        v60 = (unint64_t *)(v59 + 8);
        do
          v61 = __ldxr(v60);
        while (__stxr(v61 + 1, v60));
        v58 = (_QWORD *)*((_QWORD *)&v392 + 1);
        v389 = (_QWORD *)*((_QWORD *)&v392 + 1);
        v390 = (std::__shared_weak_count *)v393;
        if (v393)
        {
          v62 = (unint64_t *)(v393 + 8);
          do
            v63 = __ldxr(v62);
          while (__stxr(v63 + 1, v62));
        }
        v387 = 0;
        v388 = 0;
        v386 = (uint64_t **)&v387;
        v64 = (const void **)v58[11];
        v65 = (const void ***)(v58 + 12);
        if (v64 != v58 + 12)
          break;
LABEL_97:
        v384 = 0;
        v385 = 0;
        v383 = (uint64_t **)&v384;
        v66 = (const void **)v58[20];
        v67 = (const void ***)(v58 + 21);
        if (v66 != v58 + 21)
          goto LABEL_143;
LABEL_187:
        v381 = 0;
        v382 = 0;
        v380 = (uint64_t *)&v381;
        v113 = (_QWORD *)v58[17];
        v358 = v58 + 18;
        if (v113 == v58 + 18)
          goto LABEL_188;
        while (2)
        {
          v127 = (uint64_t)v381;
          v128 = (uint64_t *)&v381;
          if (v380 == (uint64_t *)&v381)
          {
LABEL_240:
            if (v127)
              v140 = v128;
            else
              v140 = (uint64_t *)&v381;
            v147 = &v380;
            if (v127)
            {
              v147 = (uint64_t **)v128;
              v139 = v128 + 1;
            }
            else
            {
              v139 = (uint64_t *)&v381;
            }
            if (v147[1])
            {
LABEL_247:
              v148 = (_QWORD *)v113[1];
              if (!v148)
                goto LABEL_280;
              goto LABEL_274;
            }
            goto LABEL_249;
          }
          v129 = (uint64_t)v381;
          v130 = (uint64_t *)&v381;
          if (v381)
          {
            do
            {
              v128 = (uint64_t *)v129;
              v129 = *(_QWORD *)(v129 + 8);
            }
            while (v129);
          }
          else
          {
            do
            {
              v128 = (uint64_t *)v130[2];
              v48 = *v128 == (_QWORD)v130;
              v130 = v128;
            }
            while (v48);
          }
          v131 = *((char *)v128 + 55);
          if (v131 >= 0)
            v132 = v128 + 4;
          else
            v132 = (const void *)v128[4];
          if (v131 >= 0)
            v133 = *((unsigned __int8 *)v128 + 55);
          else
            v133 = v128[5];
          v134 = *((char *)v113 + 55);
          if (v134 >= 0)
            v135 = v113 + 4;
          else
            v135 = (const void *)v113[4];
          if (v134 >= 0)
            v136 = *((unsigned __int8 *)v113 + 55);
          else
            v136 = v113[5];
          if (v136 >= v133)
            v137 = v133;
          else
            v137 = v136;
          v138 = memcmp(v132, v135, v137);
          if (v138)
          {
            if (v138 < 0)
              goto LABEL_240;
          }
          else if (v133 < v136)
          {
            goto LABEL_240;
          }
          v139 = (uint64_t *)&v381;
          v140 = (uint64_t *)&v381;
          if (v127)
          {
            while (1)
            {
              v140 = (uint64_t *)v127;
              v141 = *(char *)(v127 + 55);
              if (v141 >= 0)
                v142 = (const void *)(v127 + 32);
              else
                v142 = *(const void **)(v127 + 32);
              if (v141 >= 0)
                v143 = *(unsigned __int8 *)(v127 + 55);
              else
                v143 = *(_QWORD *)(v127 + 40);
              if (v143 >= v136)
                v144 = v136;
              else
                v144 = v143;
              v145 = memcmp(v135, v142, v144);
              if (v145)
              {
                if (v145 < 0)
                  goto LABEL_219;
LABEL_233:
                v146 = memcmp(v142, v135, v144);
                if (v146)
                {
                  if ((v146 & 0x80000000) == 0)
                    goto LABEL_247;
                }
                else if (v143 >= v136)
                {
                  goto LABEL_247;
                }
                v127 = v140[1];
                if (!v127)
                {
                  v139 = v140 + 1;
                  break;
                }
              }
              else
              {
                if (v136 >= v143)
                  goto LABEL_233;
LABEL_219:
                v127 = *v140;
                v139 = v140;
                if (!*v140)
                  break;
              }
            }
          }
LABEL_249:
          v149 = (char *)operator new(0x50uLL);
          v150 = v149;
          if (*((char *)v113 + 55) < 0)
          {
            sub_1000016D4(v149 + 32, (void *)v113[4], v113[5]);
          }
          else
          {
            v151 = *((_OWORD *)v113 + 2);
            *((_QWORD *)v149 + 6) = v113[6];
            *((_OWORD *)v149 + 2) = v151;
          }
          v152 = v150 + 56;
          if (*((char *)v113 + 79) < 0)
          {
            sub_1000016D4(v152, (void *)v113[7], v113[8]);
          }
          else
          {
            v153 = *(_OWORD *)(v113 + 7);
            *((_QWORD *)v150 + 9) = v113[9];
            *(_OWORD *)v152 = v153;
          }
          *(_QWORD *)v150 = 0;
          *((_QWORD *)v150 + 1) = 0;
          *((_QWORD *)v150 + 2) = v140;
          *v139 = (uint64_t)v150;
          if (*v380)
          {
            v380 = (uint64_t *)*v380;
            v150 = (char *)*v139;
          }
          v154 = (uint64_t)v381;
          v150[24] = v150 == v381;
          if (v150 == (char *)v154)
          {
LABEL_273:
            ++v382;
            v148 = (_QWORD *)v113[1];
            if (!v148)
              goto LABEL_280;
            goto LABEL_274;
          }
          while (1)
          {
            v155 = *((_QWORD *)v150 + 2);
            if (*(_BYTE *)(v155 + 24))
              goto LABEL_273;
            v156 = *(char **)(v155 + 16);
            v157 = *(_QWORD *)v156;
            if (*(_QWORD *)v156 != v155)
              break;
            v160 = *((_QWORD *)v156 + 1);
            if (!v160 || (v161 = *(unsigned __int8 *)(v160 + 24), v158 = (_BYTE *)(v160 + 24), v161))
            {
              if (*(char **)v155 == v150)
              {
                *(_BYTE *)(v155 + 24) = 1;
                v156[24] = 0;
                v164 = *(_QWORD *)(v155 + 8);
                *(_QWORD *)v156 = v164;
                if (v164)
                  goto LABEL_271;
              }
              else
              {
                v162 = *(uint64_t **)(v155 + 8);
                v163 = *v162;
                *(_QWORD *)(v155 + 8) = *v162;
                if (v163)
                {
                  *(_QWORD *)(v163 + 16) = v155;
                  v156 = *(char **)(v155 + 16);
                }
                v162[2] = (uint64_t)v156;
                *(_QWORD *)(*(_QWORD *)(v155 + 16) + 8 * (**(_QWORD **)(v155 + 16) != v155)) = v162;
                *v162 = v155;
                *(_QWORD *)(v155 + 16) = v162;
                v156 = (char *)v162[2];
                v155 = *(_QWORD *)v156;
                *((_BYTE *)v162 + 24) = 1;
                v156[24] = 0;
                v164 = *(_QWORD *)(v155 + 8);
                *(_QWORD *)v156 = v164;
                if (v164)
LABEL_271:
                  *(_QWORD *)(v164 + 16) = v156;
              }
              *(_QWORD *)(v155 + 16) = *((_QWORD *)v156 + 2);
              *(_QWORD *)(*((_QWORD *)v156 + 2) + 8 * (**((_QWORD **)v156 + 2) != (_QWORD)v156)) = v155;
              *(_QWORD *)(v155 + 8) = v156;
              *((_QWORD *)v156 + 2) = v155;
              goto LABEL_273;
            }
LABEL_259:
            *(_BYTE *)(v155 + 24) = 1;
            v150 = v156;
            v156[24] = v156 == (char *)v154;
            *v158 = 1;
            if (v156 == (char *)v154)
              goto LABEL_273;
          }
          if (v157)
          {
            v159 = *(unsigned __int8 *)(v157 + 24);
            v158 = (_BYTE *)(v157 + 24);
            if (!v159)
              goto LABEL_259;
          }
          if (*(char **)v155 == v150)
          {
            v168 = *((_QWORD *)v150 + 1);
            *(_QWORD *)v155 = v168;
            if (v168)
            {
              *(_QWORD *)(v168 + 16) = v155;
              v156 = *(char **)(v155 + 16);
            }
            *((_QWORD *)v150 + 2) = v156;
            *(_QWORD *)(*(_QWORD *)(v155 + 16) + 8 * (**(_QWORD **)(v155 + 16) != v155)) = v150;
            *((_QWORD *)v150 + 1) = v155;
            *(_QWORD *)(v155 + 16) = v150;
            v156 = (char *)*((_QWORD *)v150 + 2);
            v150[24] = 1;
            v156[24] = 0;
            v166 = (uint64_t *)*((_QWORD *)v156 + 1);
            v167 = *v166;
            *((_QWORD *)v156 + 1) = *v166;
            if (v167)
LABEL_278:
              *(_QWORD *)(v167 + 16) = v156;
          }
          else
          {
            *(_BYTE *)(v155 + 24) = 1;
            v156[24] = 0;
            v166 = (uint64_t *)*((_QWORD *)v156 + 1);
            v167 = *v166;
            *((_QWORD *)v156 + 1) = *v166;
            if (v167)
              goto LABEL_278;
          }
          v166[2] = *((_QWORD *)v156 + 2);
          *(_QWORD *)(*((_QWORD *)v156 + 2) + 8 * (**((_QWORD **)v156 + 2) != (_QWORD)v156)) = v166;
          *v166 = (uint64_t)v156;
          *((_QWORD *)v156 + 2) = v166;
          ++v382;
          v148 = (_QWORD *)v113[1];
          if (v148)
          {
            do
            {
LABEL_274:
              v165 = v148;
              v148 = (_QWORD *)*v148;
            }
            while (v148);
            goto LABEL_194;
          }
          do
          {
LABEL_280:
            v165 = (_QWORD *)v113[2];
            v48 = *v165 == (_QWORD)v113;
            v113 = v165;
          }
          while (!v48);
LABEL_194:
          v113 = v165;
          if (v165 != v358)
            continue;
          break;
        }
LABEL_188:
        v379 = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v114 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v114 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v378[7] = v114;
        v378[8] = v114;
        v378[5] = v114;
        v378[6] = v114;
        v378[3] = v114;
        v378[4] = v114;
        v378[1] = v114;
        v378[2] = v114;
        v377 = v114;
        v378[0] = v114;
        *(_OWORD *)v375 = v114;
        v376 = v114;
        v373 = v114;
        v374 = v114;
        *(_OWORD *)&v371[2].__locale_ = v114;
        v372 = v114;
        *(_OWORD *)&v371[0].__locale_ = v114;
        sub_10000F3E0((uint64_t)v371);
        v115 = v359;
        std::ios_base::getloc((const std::ios_base *)((char *)v359 + *((_QWORD *)v371[2].__locale_ - 3)));
        v116 = std::locale::use_facet((const std::locale *)__p, &std::ctype<char>::id);
        v117 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v116->__vftable[2].~facet_0)(v116, 10);
        std::locale::~locale((std::locale *)__p);
        std::ostream::put(v115, v117);
        std::ostream::flush(v115);
        v118 = (uint64_t *)v386;
        if (v386 != (uint64_t **)&v387)
        {
LABEL_290:
          memset(__p, 170, 24);
          if (*((char *)v118 + 55) < 0)
          {
            sub_1000016D4(__p, (void *)v118[4], v118[5]);
          }
          else
          {
            *(_OWORD *)__p = *((_OWORD *)v118 + 2);
            __p[2] = (void *)v118[6];
          }
          v169 = sub_100001760(v115, (uint64_t)"\t\t\t\t", 4);
          v170 = *v169;
          *(uint64_t *)((char *)v169 + *(_QWORD *)(*v169 - 24) + 24) = 20;
          *(_DWORD *)((char *)v169 + *(_QWORD *)(v170 - 24) + 8) = *(_DWORD *)((_BYTE *)v169 + *(_QWORD *)(v170 - 24)
                                                                                             + 8) & 0xFFFFFF4F | 0x20;
          if (SHIBYTE(__p[2]) >= 0)
            v171 = __p;
          else
            v171 = (void **)__p[0];
          if (SHIBYTE(__p[2]) >= 0)
            v172 = HIBYTE(__p[2]);
          else
            v172 = (uint64_t)__p[1];
          sub_100001760(v169, (uint64_t)v171, v172);
          v173 = (uint64_t)v381;
          v174 = (uint64_t *)&v381;
          v175 = (uint64_t *)&v381;
          if (!v381)
          {
LABEL_326:
            v187 = (char *)operator new(0x50uLL);
            v115 = v359;
            v188 = (uint64_t *)v187;
            v189 = (void **)(v187 + 32);
            if (SHIBYTE(__p[2]) < 0)
            {
              sub_1000016D4(v189, __p[0], (unint64_t)__p[1]);
            }
            else
            {
              *(_OWORD *)v189 = *(_OWORD *)__p;
              v189[2] = __p[2];
            }
            v188[7] = 0;
            v188[8] = 0;
            v188[9] = 0;
            *v188 = 0;
            v188[1] = 0;
            v188[2] = (uint64_t)v175;
            *v174 = (uint64_t)v188;
            v190 = (uint64_t)v188;
            if (*v380)
            {
              v380 = (uint64_t *)*v380;
              v190 = *v174;
            }
            v191 = (uint64_t)v381;
            *(_BYTE *)(v190 + 24) = v190 == (_QWORD)v381;
            if (v190 != v191)
            {
              do
              {
                v192 = *(uint64_t **)(v190 + 16);
                if (*((_BYTE *)v192 + 24))
                  break;
                v193 = v192[2];
                v194 = *(uint64_t **)v193;
                if (*(uint64_t **)v193 == v192)
                {
                  v197 = *(_QWORD *)(v193 + 8);
                  if (!v197 || (v198 = *(unsigned __int8 *)(v197 + 24), v195 = (_BYTE *)(v197 + 24), v198))
                  {
                    if (*v192 == v190)
                    {
                      *((_BYTE *)v192 + 24) = 1;
                      *(_BYTE *)(v193 + 24) = 0;
                      v201 = v192[1];
                      *(_QWORD *)v193 = v201;
                      if (v201)
                        goto LABEL_345;
                    }
                    else
                    {
                      v199 = (uint64_t **)v192[1];
                      v200 = *v199;
                      v192[1] = (uint64_t)*v199;
                      if (v200)
                      {
                        v200[2] = (uint64_t)v192;
                        v193 = v192[2];
                      }
                      v199[2] = (uint64_t *)v193;
                      *(_QWORD *)(v192[2] + 8 * (*(_QWORD *)v192[2] != (_QWORD)v192)) = v199;
                      *v199 = v192;
                      v192[2] = (uint64_t)v199;
                      v193 = (uint64_t)v199[2];
                      v192 = *(uint64_t **)v193;
                      *((_BYTE *)v199 + 24) = 1;
                      *(_BYTE *)(v193 + 24) = 0;
                      v201 = v192[1];
                      *(_QWORD *)v193 = v201;
                      if (v201)
LABEL_345:
                        *(_QWORD *)(v201 + 16) = v193;
                    }
                    v192[2] = *(_QWORD *)(v193 + 16);
                    *(_QWORD *)(*(_QWORD *)(v193 + 16) + 8 * (**(_QWORD **)(v193 + 16) != v193)) = v192;
                    v192[1] = v193;
LABEL_354:
                    *(_QWORD *)(v193 + 16) = v192;
                    break;
                  }
                }
                else if (!v194 || (v196 = *((unsigned __int8 *)v194 + 24), v195 = v194 + 3, v196))
                {
                  if (*v192 == v190)
                  {
                    v247 = *(_QWORD *)(v190 + 8);
                    *v192 = v247;
                    if (v247)
                    {
                      *(_QWORD *)(v247 + 16) = v192;
                      v193 = v192[2];
                    }
                    *(_QWORD *)(v190 + 16) = v193;
                    *(_QWORD *)(v192[2] + 8 * (*(_QWORD *)v192[2] != (_QWORD)v192)) = v190;
                    *(_QWORD *)(v190 + 8) = v192;
                    v192[2] = v190;
                    v193 = *(_QWORD *)(v190 + 16);
                    *(_BYTE *)(v190 + 24) = 1;
                    *(_BYTE *)(v193 + 24) = 0;
                    v192 = *(uint64_t **)(v193 + 8);
                    v203 = *v192;
                    *(_QWORD *)(v193 + 8) = *v192;
                    if (v203)
LABEL_352:
                      *(_QWORD *)(v203 + 16) = v193;
                  }
                  else
                  {
                    *((_BYTE *)v192 + 24) = 1;
                    *(_BYTE *)(v193 + 24) = 0;
                    v192 = *(uint64_t **)(v193 + 8);
                    v203 = *v192;
                    *(_QWORD *)(v193 + 8) = *v192;
                    if (v203)
                      goto LABEL_352;
                  }
                  v192[2] = *(_QWORD *)(v193 + 16);
                  *(_QWORD *)(*(_QWORD *)(v193 + 16) + 8 * (**(_QWORD **)(v193 + 16) != v193)) = v192;
                  *v192 = v193;
                  goto LABEL_354;
                }
                *((_BYTE *)v192 + 24) = 1;
                v190 = v193;
                *(_BYTE *)(v193 + 24) = v193 == v191;
                *v195 = 1;
              }
              while (v193 != v191);
            }
            ++v382;
            v202 = *((char *)v188 + 79);
            if ((v202 & 0x80000000) == 0)
              goto LABEL_356;
LABEL_348:
            if (!v188[8])
              goto LABEL_419;
LABEL_357:
            v204 = sub_100001760(v115, (uint64_t)"\t", 1);
            v205 = *v204;
            *(uint64_t *)((char *)v204 + *(_QWORD *)(*v204 - 24) + 24) = 16;
            *(_DWORD *)((char *)v204 + *(_QWORD *)(v205 - 24) + 8) = *(_DWORD *)((_BYTE *)v204
                                                                               + *(_QWORD *)(v205 - 24)
                                                                               + 8) & 0xFFFFFF4F | 0x80;
            v206 = sub_100001760(v204, (uint64_t)"- ", 2);
            v207 = (uint64_t)v381;
            v208 = (uint64_t *)&v381;
            v209 = (uint64_t *)&v381;
            if (!v381)
            {
LABEL_384:
              v221 = operator new(0x50uLL);
              v115 = v359;
              v222 = v221;
              v223 = (void **)(v221 + 4);
              if (SHIBYTE(__p[2]) < 0)
              {
                sub_1000016D4(v223, __p[0], (unint64_t)__p[1]);
              }
              else
              {
                *(_OWORD *)v223 = *(_OWORD *)__p;
                v223[2] = __p[2];
              }
              v222[7] = 0;
              v222[8] = 0;
              v222[9] = 0;
              *v222 = 0;
              v222[1] = 0;
              v222[2] = (uint64_t)v209;
              *v208 = (uint64_t)v222;
              v224 = v222;
              if (*v380)
              {
                v380 = (uint64_t *)*v380;
                v224 = (uint64_t *)*v208;
              }
              v225 = (uint64_t)v381;
              *((_BYTE *)v224 + 24) = v224 == (uint64_t *)v381;
              if (v224 != (uint64_t *)v225)
              {
                do
                {
                  v226 = v224[2];
                  if (*(_BYTE *)(v226 + 24))
                    break;
                  v227 = *(_QWORD *)(v226 + 16);
                  v228 = *(_QWORD *)v227;
                  if (*(_QWORD *)v227 == v226)
                  {
                    v231 = *(_QWORD *)(v227 + 8);
                    if (!v231 || (v232 = *(unsigned __int8 *)(v231 + 24), v229 = (_BYTE *)(v231 + 24), v232))
                    {
                      if (*(uint64_t **)v226 == v224)
                      {
                        *(_BYTE *)(v226 + 24) = 1;
                        *(_BYTE *)(v227 + 24) = 0;
                        v235 = *(_QWORD *)(v226 + 8);
                        *(_QWORD *)v227 = v235;
                        if (v235)
                          goto LABEL_403;
                      }
                      else
                      {
                        v233 = *(uint64_t **)(v226 + 8);
                        v234 = *v233;
                        *(_QWORD *)(v226 + 8) = *v233;
                        if (v234)
                        {
                          *(_QWORD *)(v234 + 16) = v226;
                          v227 = *(_QWORD *)(v226 + 16);
                        }
                        v233[2] = v227;
                        *(_QWORD *)(*(_QWORD *)(v226 + 16) + 8 * (**(_QWORD **)(v226 + 16) != v226)) = v233;
                        *v233 = v226;
                        *(_QWORD *)(v226 + 16) = v233;
                        v227 = v233[2];
                        v226 = *(_QWORD *)v227;
                        *((_BYTE *)v233 + 24) = 1;
                        *(_BYTE *)(v227 + 24) = 0;
                        v235 = *(_QWORD *)(v226 + 8);
                        *(_QWORD *)v227 = v235;
                        if (v235)
LABEL_403:
                          *(_QWORD *)(v235 + 16) = v227;
                      }
                      *(_QWORD *)(v226 + 16) = *(_QWORD *)(v227 + 16);
                      *(_QWORD *)(*(_QWORD *)(v227 + 16) + 8 * (**(_QWORD **)(v227 + 16) != v227)) = v226;
                      *(_QWORD *)(v226 + 8) = v227;
LABEL_410:
                      *(_QWORD *)(v227 + 16) = v226;
                      break;
                    }
                  }
                  else if (!v228 || (v230 = *(unsigned __int8 *)(v228 + 24), v229 = (_BYTE *)(v228 + 24), v230))
                  {
                    if (*(uint64_t **)v226 == v224)
                    {
                      v248 = v224[1];
                      *(_QWORD *)v226 = v248;
                      if (v248)
                      {
                        *(_QWORD *)(v248 + 16) = v226;
                        v227 = *(_QWORD *)(v226 + 16);
                      }
                      v224[2] = v227;
                      *(_QWORD *)(*(_QWORD *)(v226 + 16) + 8 * (**(_QWORD **)(v226 + 16) != v226)) = v224;
                      v224[1] = v226;
                      *(_QWORD *)(v226 + 16) = v224;
                      v227 = v224[2];
                      *((_BYTE *)v224 + 24) = 1;
                      *(_BYTE *)(v227 + 24) = 0;
                      v226 = *(_QWORD *)(v227 + 8);
                      v236 = *(uint64_t **)v226;
                      *(_QWORD *)(v227 + 8) = *(_QWORD *)v226;
                      if (v236)
LABEL_408:
                        v236[2] = v227;
                    }
                    else
                    {
                      *(_BYTE *)(v226 + 24) = 1;
                      *(_BYTE *)(v227 + 24) = 0;
                      v226 = *(_QWORD *)(v227 + 8);
                      v236 = *(uint64_t **)v226;
                      *(_QWORD *)(v227 + 8) = *(_QWORD *)v226;
                      if (v236)
                        goto LABEL_408;
                    }
                    *(_QWORD *)(v226 + 16) = *(_QWORD *)(v227 + 16);
                    *(_QWORD *)(*(_QWORD *)(v227 + 16) + 8 * (**(_QWORD **)(v227 + 16) != v227)) = v226;
                    *(_QWORD *)v226 = v227;
                    goto LABEL_410;
                  }
                  *(_BYTE *)(v226 + 24) = 1;
                  v224 = (uint64_t *)v227;
                  *(_BYTE *)(v227 + 24) = v227 == v225;
                  *v229 = 1;
                }
                while (v227 != v225);
              }
              ++v382;
LABEL_412:
              v239 = v222[7];
              v238 = v222 + 7;
              v237 = v239;
              v240 = *((char *)v238 + 23);
              if (v240 >= 0)
                v241 = (uint64_t)v238;
              else
                v241 = v237;
              if (v240 >= 0)
                v242 = *((unsigned __int8 *)v238 + 23);
              else
                v242 = v238[1];
              sub_100001760(v206, v241, v242);
              goto LABEL_419;
            }
            if (SHIBYTE(__p[2]) >= 0)
              v210 = __p;
            else
              v210 = (void **)__p[0];
            if (SHIBYTE(__p[2]) >= 0)
              v211 = (void *)HIBYTE(__p[2]);
            else
              v211 = __p[1];
            while (1)
            {
              v209 = (uint64_t *)v207;
              v214 = *(const void **)(v207 + 32);
              v212 = v207 + 32;
              v213 = v214;
              v215 = *(char *)(v212 + 23);
              if (v215 >= 0)
                v216 = (const void *)v212;
              else
                v216 = v213;
              if (v215 >= 0)
                v217 = *(unsigned __int8 *)(v212 + 23);
              else
                v217 = *(_QWORD *)(v212 + 8);
              if (v217 >= (unint64_t)v211)
                v218 = (size_t)v211;
              else
                v218 = v217;
              v219 = memcmp(v210, v216, v218);
              if (v219)
              {
                if (v219 < 0)
                  goto LABEL_364;
              }
              else if ((unint64_t)v211 < v217)
              {
LABEL_364:
                v207 = *v209;
                v208 = v209;
                if (!*v209)
                  goto LABEL_384;
                continue;
              }
              v220 = memcmp(v216, v210, v218);
              if (v220)
              {
                if ((v220 & 0x80000000) == 0)
                  goto LABEL_405;
              }
              else if (v217 >= (unint64_t)v211)
              {
LABEL_405:
                v222 = v209;
                v115 = v359;
                goto LABEL_412;
              }
              v207 = v209[1];
              if (!v207)
              {
                v208 = v209 + 1;
                goto LABEL_384;
              }
            }
          }
          if (SHIBYTE(__p[2]) >= 0)
            v176 = __p;
          else
            v176 = (void **)__p[0];
          if (SHIBYTE(__p[2]) >= 0)
            v177 = (void *)HIBYTE(__p[2]);
          else
            v177 = __p[1];
          while (1)
          {
            v175 = (uint64_t *)v173;
            v180 = *(const void **)(v173 + 32);
            v178 = v173 + 32;
            v179 = v180;
            v181 = *(char *)(v178 + 23);
            if (v181 >= 0)
              v182 = (const void *)v178;
            else
              v182 = v179;
            if (v181 >= 0)
              v183 = *(unsigned __int8 *)(v178 + 23);
            else
              v183 = *(_QWORD *)(v178 + 8);
            if (v183 >= (unint64_t)v177)
              v184 = (size_t)v177;
            else
              v184 = v183;
            v185 = memcmp(v176, v182, v184);
            if (v185)
            {
              if (v185 < 0)
                goto LABEL_306;
LABEL_320:
              v186 = memcmp(v182, v176, v184);
              if (v186)
              {
                if ((v186 & 0x80000000) == 0)
                  goto LABEL_347;
              }
              else if (v183 >= (unint64_t)v177)
              {
LABEL_347:
                v188 = v175;
                v115 = v359;
                v202 = *((char *)v175 + 79);
                if (v202 < 0)
                  goto LABEL_348;
LABEL_356:
                if ((_BYTE)v202)
                  goto LABEL_357;
LABEL_419:
                std::ios_base::getloc((const std::ios_base *)((char *)v115 + *((_QWORD *)v371[2].__locale_ - 3)));
                v243 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
                v244 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v243->__vftable[2].~facet_0)(v243, 10);
                std::locale::~locale((std::locale *)__dst);
                std::ostream::put(v115, v244);
                std::ostream::flush(v115);
                if (SHIBYTE(__p[2]) < 0)
                {
                  operator delete(__p[0]);
                  v245 = (char *)v118[1];
                  if (v245)
                    goto LABEL_423;
                  do
                  {
LABEL_425:
                    v246 = (char **)v118[2];
                    v48 = *v246 == (char *)v118;
                    v118 = (uint64_t *)v246;
                  }
                  while (!v48);
                }
                else
                {
                  v245 = (char *)v118[1];
                  if (!v245)
                    goto LABEL_425;
                  do
                  {
LABEL_423:
                    v246 = (char **)v245;
                    v245 = *(char **)v245;
                  }
                  while (v245);
                }
                v118 = (uint64_t *)v246;
                if (v246 == &v387)
                  break;
                goto LABEL_290;
              }
              v173 = v175[1];
              if (!v173)
              {
                v174 = v175 + 1;
                goto LABEL_326;
              }
            }
            else
            {
              if ((unint64_t)v177 >= v183)
                goto LABEL_320;
LABEL_306:
              v173 = *v175;
              v174 = v175;
              if (!*v175)
                goto LABEL_326;
            }
          }
        }
        if (!v385)
          goto LABEL_492;
        v119 = sub_100001760(v115, (uint64_t)"\t\t\t\t", 4);
        v120 = *v119;
        *(uint64_t *)((char *)v119 + *(_QWORD *)(*v119 - 24) + 24) = 20;
        *(_DWORD *)((char *)v119 + *(_QWORD *)(v120 - 24) + 8) = *(_DWORD *)((_BYTE *)v119 + *(_QWORD *)(v120 - 24) + 8) & 0xFFFFFF4F | 0x20;
        sub_100001760(v119, (uint64_t)"sub-commands", 12);
        v121 = sub_100001760(v115, (uint64_t)"\t", 1);
        v122 = *v121;
        *(uint64_t *)((char *)v121 + *(_QWORD *)(*v121 - 24) + 24) = 16;
        *(_DWORD *)((char *)v121 + *(_QWORD *)(v122 - 24) + 8) = *(_DWORD *)((_BYTE *)v121 + *(_QWORD *)(v122 - 24) + 8) & 0xFFFFFF4F | 0x80;
        sub_100001760(v121, (uint64_t)"- ", 2);
        v370 = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v123 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v123 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v369[7] = v123;
        v369[8] = v123;
        v369[5] = v123;
        v369[6] = v123;
        v369[3] = v123;
        v369[4] = v123;
        v369[1] = v123;
        v369[2] = v123;
        v368 = v123;
        v369[0] = v123;
        *(_OWORD *)v366 = v123;
        v367 = v123;
        v364 = v123;
        v365 = v123;
        *(_OWORD *)&__p[2] = v123;
        v363 = v123;
        *(_OWORD *)__p = v123;
        sub_10000F3E0((uint64_t)__p);
        sub_100001760(&__p[2], (uint64_t)"[ ", 2);
        v124 = (uint64_t *)v383;
        if (v383 != (uint64_t **)&v384)
        {
          do
          {
            v361 = 0xAAAAAAAAAAAAAAAALL;
            *(_QWORD *)&v249 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v249 + 1) = 0xAAAAAAAAAAAAAAAALL;
            *(_OWORD *)__dst = v249;
            *(_OWORD *)&__dst[16] = v249;
            if (*((char *)v124 + 55) < 0)
            {
              sub_1000016D4(__dst, (void *)v124[4], v124[5]);
            }
            else
            {
              *(_OWORD *)__dst = *((_OWORD *)v124 + 2);
              *(_QWORD *)&__dst[16] = v124[6];
            }
            v250 = v124[8];
            *(_QWORD *)&__dst[24] = v124[7];
            v361 = v250;
            if (v250)
            {
              v251 = (unint64_t *)(v250 + 8);
              do
                v252 = __ldxr(v251);
              while (__stxr(v252 + 1, v251));
            }
            if (__dst[23] >= 0)
              v253 = __dst;
            else
              v253 = *(_BYTE **)__dst;
            if (__dst[23] >= 0)
              v254 = __dst[23];
            else
              v254 = *(_QWORD *)&__dst[8];
            v255 = sub_100001760(&__p[2], (uint64_t)v253, v254);
            sub_100001760(v255, (uint64_t)" | ", 3);
            v256 = (std::__shared_weak_count *)v361;
            if (!v361)
              goto LABEL_457;
            v257 = (unint64_t *)(v361 + 8);
            do
              v258 = __ldaxr(v257);
            while (__stlxr(v258 - 1, v257));
            if (!v258)
            {
              ((void (*)(std::__shared_weak_count *))v256->__on_zero_shared)(v256);
              std::__shared_weak_count::__release_weak(v256);
              if ((__dst[23] & 0x80000000) == 0)
              {
LABEL_458:
                v259 = (uint64_t *)v124[1];
                if (v259)
                  goto LABEL_462;
                goto LABEL_464;
              }
            }
            else
            {
LABEL_457:
              if ((__dst[23] & 0x80000000) == 0)
                goto LABEL_458;
            }
            operator delete(*(void **)__dst);
            v259 = (uint64_t *)v124[1];
            if (v259)
            {
              do
              {
LABEL_462:
                v260 = v259;
                v259 = (uint64_t *)*v259;
              }
              while (v259);
              goto LABEL_440;
            }
            do
            {
LABEL_464:
              v260 = (uint64_t *)v124[2];
              v48 = *v260 == (_QWORD)v124;
              v124 = v260;
            }
            while (!v48);
LABEL_440:
            v124 = v260;
          }
          while (v260 != (uint64_t *)&v384);
        }
        memset(__dst, 170, 24);
        if ((BYTE8(v368) & 0x10) != 0)
        {
          v261 = v368;
          v262 = (const void **)&v365;
          if ((unint64_t)v368 < *((_QWORD *)&v365 + 1))
          {
            *(_QWORD *)&v368 = *((_QWORD *)&v365 + 1);
            v261 = *((_QWORD *)&v365 + 1);
            v262 = (const void **)&v365;
          }
        }
        else
        {
          if ((BYTE8(v368) & 8) == 0)
          {
            v125 = 0;
            __dst[23] = 0;
            v126 = __dst;
            goto LABEL_478;
          }
          v261 = *((_QWORD *)&v364 + 1);
          v262 = (const void **)&v363 + 1;
        }
        v263 = *v262;
        v125 = v261 - (_QWORD)*v262;
        if (v125 > 0x7FFFFFFFFFFFFFF7)
          sub_10000163C();
        if (v125 >= 0x17)
        {
          v264 = (v125 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v125 | 7) != 0x17)
            v264 = v125 | 7;
          v265 = v264 + 1;
          v126 = operator new(v264 + 1);
          *(_QWORD *)&__dst[8] = v125;
          *(_QWORD *)&__dst[16] = v265 | 0x8000000000000000;
          *(_QWORD *)__dst = v126;
          goto LABEL_477;
        }
        __dst[23] = v261 - *(_BYTE *)v262;
        v126 = __dst;
        if (v125)
LABEL_477:
          memmove(v126, v263, v125);
LABEL_478:
        v126[v125] = 0;
        v266 = __dst[23];
        if (__dst[23] >= 0)
        {
          v267 = __dst;
        }
        else
        {
          v266 = *(_QWORD *)&__dst[8];
          v267 = *(_BYTE **)__dst;
        }
        v267[v266 - 2] = 93;
        if (__dst[23] >= 0)
          v268 = __dst;
        else
          v268 = *(_BYTE **)__dst;
        if (__dst[23] >= 0)
          v269 = __dst[23];
        else
          v269 = *(_QWORD *)&__dst[8];
        v270 = sub_100001760(v359, (uint64_t)v268, v269);
        std::ios_base::getloc((const std::ios_base *)((char *)v270 + *(_QWORD *)(*v270 - 24)));
        v271 = std::locale::use_facet(&v394, &std::ctype<char>::id);
        v272 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v271->__vftable[2].~facet_0)(v271, 10);
        std::locale::~locale(&v394);
        std::ostream::put(v270, v272);
        std::ostream::flush(v270);
        if ((__dst[23] & 0x80000000) != 0)
          operator delete(*(void **)__dst);
        __p[0] = v355;
        *(void **)((char *)__p + *((_QWORD *)v355 - 3)) = v354;
        __p[2] = v353;
        if (SHIBYTE(v367) < 0)
          operator delete(v366[1]);
        std::streambuf::~streambuf(&__p[3]);
        std::ios::~ios(v369);
LABEL_492:
        v273 = sub_100001760(&std::cout, (uint64_t)"\t", 1);
        v274 = *v273;
        *(uint64_t *)((char *)v273 + *(_QWORD *)(*v273 - 24) + 24) = 16;
        *(_DWORD *)((char *)v273 + *(_QWORD *)(v274 - 24) + 8) = *(_DWORD *)((_BYTE *)v273 + *(_QWORD *)(v274 - 24) + 8) & 0xFFFFFF4F | 0x80;
        v275 = *((char *)v389 + 63);
        if (v275 >= 0)
          v276 = (uint64_t)(v389 + 5);
        else
          v276 = v389[5];
        if (v275 >= 0)
          v277 = *((unsigned __int8 *)v389 + 63);
        else
          v277 = v389[6];
        v278 = sub_100001760(v273, v276, v277);
        v279 = sub_100001760(v278, (uint64_t)":", 1);
        if ((BYTE8(v377) & 0x10) != 0)
        {
          v282 = v377;
          v283 = (const void **)&v374;
          if ((unint64_t)v377 < *((_QWORD *)&v374 + 1))
          {
            *(_QWORD *)&v377 = *((_QWORD *)&v374 + 1);
            v282 = *((_QWORD *)&v374 + 1);
            v283 = (const void **)&v374;
          }
        }
        else
        {
          if ((BYTE8(v377) & 8) == 0)
          {
            v280 = 0;
            HIBYTE(__p[2]) = 0;
            v281 = __p;
            goto LABEL_512;
          }
          v282 = *((_QWORD *)&v373 + 1);
          v283 = (const void **)&v372 + 1;
        }
        v284 = *v283;
        v280 = v282 - (_QWORD)*v283;
        if (v280 > 0x7FFFFFFFFFFFFFF7)
          sub_10000163C();
        if (v280 >= 0x17)
        {
          v285 = (v280 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v280 | 7) != 0x17)
            v285 = v280 | 7;
          v286 = v285 + 1;
          v281 = operator new(v285 + 1);
          __p[1] = (void *)v280;
          __p[2] = (void *)(v286 | 0x8000000000000000);
          __p[0] = v281;
          goto LABEL_511;
        }
        HIBYTE(__p[2]) = v282 - *(_BYTE *)v283;
        v281 = __p;
        if (v280)
LABEL_511:
          memmove(v281, v284, v280);
LABEL_512:
        *((_BYTE *)v281 + v280) = 0;
        if (SHIBYTE(__p[2]) >= 0)
          v287 = __p;
        else
          v287 = (void **)__p[0];
        if (SHIBYTE(__p[2]) >= 0)
          v288 = HIBYTE(__p[2]);
        else
          v288 = (uint64_t)__p[1];
        v289 = sub_100001760(v279, (uint64_t)v287, v288);
        std::ios_base::getloc((const std::ios_base *)((char *)v289 + *(_QWORD *)(*v289 - 24)));
        v290 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
        v291 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v290->__vftable[2].~facet_0)(v290, 10);
        std::locale::~locale((std::locale *)__dst);
        std::ostream::put(v289, v291);
        std::ostream::flush(v289);
        if (SHIBYTE(__p[2]) < 0)
          operator delete(__p[0]);
        v371[0].__locale_ = (std::locale::__imp *)v355;
        *(std::locale::__imp **)((char *)&v371[0].__locale_ + *((_QWORD *)v355 - 3)) = (std::locale::__imp *)v354;
        v371[2].__locale_ = (std::locale::__imp *)v353;
        if (SHIBYTE(v376) < 0)
          operator delete(v375[1]);
        std::streambuf::~streambuf(&v371[3]);
        std::ios::~ios(v378);
        sub_100002900((uint64_t)&v380, (uint64_t)v381);
        sub_10000BA78((uint64_t)&v383, (uint64_t)v384);
        sub_10000BA18((uint64_t)&v386, v387);
        v292 = v390;
        if (!v390)
          goto LABEL_526;
        p_shared_owners = (unint64_t *)&v390->__shared_owners_;
        do
          v294 = __ldaxr(p_shared_owners);
        while (__stlxr(v294 - 1, p_shared_owners));
        if (!v294)
        {
          ((void (*)(std::__shared_weak_count *))v292->__on_zero_shared)(v292);
          std::__shared_weak_count::__release_weak(v292);
          v295 = (std::__shared_weak_count *)v393;
          if (v393)
          {
LABEL_527:
            v296 = (unint64_t *)&v295->__shared_owners_;
            do
              v297 = __ldaxr(v296);
            while (__stlxr(v297 - 1, v296));
            if (!v297)
            {
              ((void (*)(std::__shared_weak_count *))v295->__on_zero_shared)(v295);
              std::__shared_weak_count::__release_weak(v295);
            }
          }
        }
        else
        {
LABEL_526:
          v295 = (std::__shared_weak_count *)v393;
          if (v393)
            goto LABEL_527;
        }
        if (SBYTE7(v392) < 0)
        {
          operator delete(v391[0].__locale_);
          v298 = v356;
          v299 = (char *)*((_QWORD *)v356 + 1);
          if (v299)
            goto LABEL_536;
          do
          {
LABEL_538:
            v300 = (char *)*((_QWORD *)v298 + 2);
            v48 = *(_QWORD *)v300 == (_QWORD)v298;
            v298 = v300;
          }
          while (!v48);
        }
        else
        {
          v298 = v356;
          v299 = (char *)*((_QWORD *)v356 + 1);
          if (!v299)
            goto LABEL_538;
          do
          {
LABEL_536:
            v300 = v299;
            v299 = *(char **)v299;
          }
          while (v299);
        }
        v56 = v300;
        if (v300 == v352)
          goto LABEL_541;
      }
LABEL_100:
      v371[0].__locale_ = (std::locale::__imp *)0xAAAAAAAAAAAAAAAALL;
      __p[0] = (void *)0xAAAAAAAAAAAAAAAALL;
      v68 = sub_1000103C8((uint64_t **)&v386, (uint64_t *)&v387, (uint64_t **)v371, (uint64_t **)__p, v64 + 4);
      if (*v68)
      {
        v69 = (const void **)v64[1];
        if (!v69)
          goto LABEL_131;
        goto LABEL_125;
      }
      v70 = (char *)operator new(0x38uLL);
      v71 = v70 + 32;
      if (*((char *)v64 + 55) < 0)
      {
        sub_1000016D4(v71, (void *)v64[4], (unint64_t)v64[5]);
      }
      else
      {
        v72 = *((_OWORD *)v64 + 2);
        *((_QWORD *)v70 + 6) = v64[6];
        *(_OWORD *)v71 = v72;
      }
      v73 = v371[0].__locale_;
      *(_QWORD *)v70 = 0;
      *((_QWORD *)v70 + 1) = 0;
      *((_QWORD *)v70 + 2) = v73;
      *v68 = (uint64_t)v70;
      if (*v386)
      {
        v386 = (uint64_t **)*v386;
        v70 = (char *)*v68;
      }
      v74 = v387;
      v70[24] = v70 == v387;
      if (v70 == v74)
      {
LABEL_124:
        ++v388;
        v69 = (const void **)v64[1];
        if (!v69)
          goto LABEL_131;
        goto LABEL_125;
      }
      while (1)
      {
        v75 = *((_QWORD *)v70 + 2);
        if (*(_BYTE *)(v75 + 24))
          goto LABEL_124;
        v76 = *(char **)(v75 + 16);
        v77 = *(_QWORD *)v76;
        if (*(_QWORD *)v76 == v75)
        {
          v80 = *((_QWORD *)v76 + 1);
          if (!v80 || (v81 = *(unsigned __int8 *)(v80 + 24), v78 = (_BYTE *)(v80 + 24), v81))
          {
            if (*(char **)v75 == v70)
            {
              *(_BYTE *)(v75 + 24) = 1;
              v76[24] = 0;
              v84 = *(_QWORD *)(v75 + 8);
              *(_QWORD *)v76 = v84;
              if (v84)
                goto LABEL_122;
            }
            else
            {
              v82 = *(uint64_t **)(v75 + 8);
              v83 = *v82;
              *(_QWORD *)(v75 + 8) = *v82;
              if (v83)
              {
                *(_QWORD *)(v83 + 16) = v75;
                v76 = *(char **)(v75 + 16);
              }
              v82[2] = (uint64_t)v76;
              *(_QWORD *)(*(_QWORD *)(v75 + 16) + 8 * (**(_QWORD **)(v75 + 16) != v75)) = v82;
              *v82 = v75;
              *(_QWORD *)(v75 + 16) = v82;
              v76 = (char *)v82[2];
              v75 = *(_QWORD *)v76;
              *((_BYTE *)v82 + 24) = 1;
              v76[24] = 0;
              v84 = *(_QWORD *)(v75 + 8);
              *(_QWORD *)v76 = v84;
              if (v84)
LABEL_122:
                *(_QWORD *)(v84 + 16) = v76;
            }
            *(_QWORD *)(v75 + 16) = *((_QWORD *)v76 + 2);
            *(_QWORD *)(*((_QWORD *)v76 + 2) + 8 * (**((_QWORD **)v76 + 2) != (_QWORD)v76)) = v75;
            *(_QWORD *)(v75 + 8) = v76;
            *((_QWORD *)v76 + 2) = v75;
            goto LABEL_124;
          }
        }
        else if (!v77 || (v79 = *(unsigned __int8 *)(v77 + 24), v78 = (_BYTE *)(v77 + 24), v79))
        {
          if (*(char **)v75 == v70)
          {
            v88 = *((_QWORD *)v70 + 1);
            *(_QWORD *)v75 = v88;
            if (v88)
            {
              *(_QWORD *)(v88 + 16) = v75;
              v76 = *(char **)(v75 + 16);
            }
            *((_QWORD *)v70 + 2) = v76;
            *(_QWORD *)(*(_QWORD *)(v75 + 16) + 8 * (**(_QWORD **)(v75 + 16) != v75)) = v70;
            *((_QWORD *)v70 + 1) = v75;
            *(_QWORD *)(v75 + 16) = v70;
            v76 = (char *)*((_QWORD *)v70 + 2);
            v70[24] = 1;
            v76[24] = 0;
            v86 = (char **)*((_QWORD *)v76 + 1);
            v87 = *v86;
            *((_QWORD *)v76 + 1) = *v86;
            if (v87)
LABEL_129:
              *((_QWORD *)v87 + 2) = v76;
          }
          else
          {
            *(_BYTE *)(v75 + 24) = 1;
            v76[24] = 0;
            v86 = (char **)*((_QWORD *)v76 + 1);
            v87 = *v86;
            *((_QWORD *)v76 + 1) = *v86;
            if (v87)
              goto LABEL_129;
          }
          v86[2] = (char *)*((_QWORD *)v76 + 2);
          *(_QWORD *)(*((_QWORD *)v76 + 2) + 8 * (**((_QWORD **)v76 + 2) != (_QWORD)v76)) = v86;
          *v86 = v76;
          *((_QWORD *)v76 + 2) = v86;
          ++v388;
          v69 = (const void **)v64[1];
          if (!v69)
          {
            do
            {
LABEL_131:
              v85 = (const void ***)v64[2];
              v48 = *v85 == v64;
              v64 = (const void **)v85;
            }
            while (!v48);
            goto LABEL_99;
          }
          do
          {
LABEL_125:
            v85 = (const void ***)v69;
            v69 = (const void **)*v69;
          }
          while (v69);
LABEL_99:
          v64 = (const void **)v85;
          if (v85 == v65)
          {
            v58 = v389;
            v384 = 0;
            v385 = 0;
            v383 = (uint64_t **)&v384;
            v66 = (const void **)v389[20];
            v67 = (const void ***)(v389 + 21);
            if (v66 == v389 + 21)
              goto LABEL_187;
LABEL_143:
            v371[0].__locale_ = (std::locale::__imp *)0xAAAAAAAAAAAAAAAALL;
            __p[0] = (void *)0xAAAAAAAAAAAAAAAALL;
            v89 = sub_1000103C8((uint64_t **)&v383, (uint64_t *)&v384, (uint64_t **)v371, (uint64_t **)__p, v66 + 4);
            if (*v89)
            {
              v90 = (const void **)v66[1];
              if (!v90)
                goto LABEL_177;
              goto LABEL_171;
            }
            v91 = (char *)operator new(0x48uLL);
            v92 = v91 + 32;
            if (*((char *)v66 + 55) < 0)
            {
              sub_1000016D4(v92, (void *)v66[4], (unint64_t)v66[5]);
            }
            else
            {
              v93 = *((_OWORD *)v66 + 2);
              *((_QWORD *)v91 + 6) = v66[6];
              *(_OWORD *)v92 = v93;
            }
            *((_QWORD *)v91 + 7) = v66[7];
            v94 = (char *)v66[8];
            *((_QWORD *)v91 + 8) = v94;
            if (v94)
            {
              v95 = (unint64_t *)(v94 + 8);
              do
                v96 = __ldxr(v95);
              while (__stxr(v96 + 1, v95));
            }
            v97 = v371[0].__locale_;
            *(_QWORD *)v91 = 0;
            *((_QWORD *)v91 + 1) = 0;
            *((_QWORD *)v91 + 2) = v97;
            *v89 = (uint64_t)v91;
            if (*v383)
            {
              v383 = (uint64_t **)*v383;
              v91 = (char *)*v89;
            }
            v98 = (uint64_t)v384;
            v91[24] = v91 == v384;
            if (v91 == (char *)v98)
            {
LABEL_170:
              ++v385;
              v90 = (const void **)v66[1];
              if (!v90)
                goto LABEL_177;
              goto LABEL_171;
            }
            while (1)
            {
              v99 = *((_QWORD *)v91 + 2);
              if (*(_BYTE *)(v99 + 24))
                goto LABEL_170;
              v100 = *(_BYTE **)(v99 + 16);
              v101 = *(_QWORD *)v100;
              if (*(_QWORD *)v100 == v99)
              {
                v104 = *((_QWORD *)v100 + 1);
                if (!v104 || (v105 = *(unsigned __int8 *)(v104 + 24), v102 = (_BYTE *)(v104 + 24), v105))
                {
                  if (*(char **)v99 == v91)
                  {
                    *(_BYTE *)(v99 + 24) = 1;
                    v100[24] = 0;
                    v108 = *(_QWORD *)(v99 + 8);
                    *(_QWORD *)v100 = v108;
                    if (v108)
                      goto LABEL_168;
                  }
                  else
                  {
                    v106 = *(uint64_t **)(v99 + 8);
                    v107 = *v106;
                    *(_QWORD *)(v99 + 8) = *v106;
                    if (v107)
                    {
                      *(_QWORD *)(v107 + 16) = v99;
                      v100 = *(_BYTE **)(v99 + 16);
                    }
                    v106[2] = (uint64_t)v100;
                    *(_QWORD *)(*(_QWORD *)(v99 + 16) + 8 * (**(_QWORD **)(v99 + 16) != v99)) = v106;
                    *v106 = v99;
                    *(_QWORD *)(v99 + 16) = v106;
                    v100 = (_BYTE *)v106[2];
                    v99 = *(_QWORD *)v100;
                    *((_BYTE *)v106 + 24) = 1;
                    v100[24] = 0;
                    v108 = *(_QWORD *)(v99 + 8);
                    *(_QWORD *)v100 = v108;
                    if (v108)
LABEL_168:
                      *(_QWORD *)(v108 + 16) = v100;
                  }
                  *(_QWORD *)(v99 + 16) = *((_QWORD *)v100 + 2);
                  *(_QWORD *)(*((_QWORD *)v100 + 2) + 8 * (**((_QWORD **)v100 + 2) != (_QWORD)v100)) = v99;
                  *(_QWORD *)(v99 + 8) = v100;
                  *((_QWORD *)v100 + 2) = v99;
                  goto LABEL_170;
                }
              }
              else if (!v101 || (v103 = *(unsigned __int8 *)(v101 + 24), v102 = (_BYTE *)(v101 + 24), v103))
              {
                if (*(char **)v99 == v91)
                {
                  v112 = *((_QWORD *)v91 + 1);
                  *(_QWORD *)v99 = v112;
                  if (v112)
                  {
                    *(_QWORD *)(v112 + 16) = v99;
                    v100 = *(_BYTE **)(v99 + 16);
                  }
                  *((_QWORD *)v91 + 2) = v100;
                  *(_QWORD *)(*(_QWORD *)(v99 + 16) + 8 * (**(_QWORD **)(v99 + 16) != v99)) = v91;
                  *((_QWORD *)v91 + 1) = v99;
                  *(_QWORD *)(v99 + 16) = v91;
                  v100 = (_BYTE *)*((_QWORD *)v91 + 2);
                  v91[24] = 1;
                  v100[24] = 0;
                  v110 = (uint64_t *)*((_QWORD *)v100 + 1);
                  v111 = *v110;
                  *((_QWORD *)v100 + 1) = *v110;
                  if (v111)
LABEL_175:
                    *(_QWORD *)(v111 + 16) = v100;
                }
                else
                {
                  *(_BYTE *)(v99 + 24) = 1;
                  v100[24] = 0;
                  v110 = (uint64_t *)*((_QWORD *)v100 + 1);
                  v111 = *v110;
                  *((_QWORD *)v100 + 1) = *v110;
                  if (v111)
                    goto LABEL_175;
                }
                v110[2] = *((_QWORD *)v100 + 2);
                *(_QWORD *)(*((_QWORD *)v100 + 2) + 8 * (**((_QWORD **)v100 + 2) != (_QWORD)v100)) = v110;
                *v110 = (uint64_t)v100;
                *((_QWORD *)v100 + 2) = v110;
                ++v385;
                v90 = (const void **)v66[1];
                if (!v90)
                {
                  do
                  {
LABEL_177:
                    v109 = (const void ***)v66[2];
                    v48 = *v109 == v66;
                    v66 = (const void **)v109;
                  }
                  while (!v48);
                  goto LABEL_142;
                }
                do
                {
LABEL_171:
                  v109 = (const void ***)v90;
                  v90 = (const void **)*v90;
                }
                while (v90);
LABEL_142:
                v66 = (const void **)v109;
                if (v109 == v67)
                {
                  v58 = v389;
                  goto LABEL_187;
                }
                goto LABEL_143;
              }
              *(_BYTE *)(v99 + 24) = 1;
              v91 = v100;
              v100[24] = v100 == (_BYTE *)v98;
              *v102 = 1;
              if (v100 == (_BYTE *)v98)
                goto LABEL_170;
            }
          }
          goto LABEL_100;
        }
        *(_BYTE *)(v75 + 24) = 1;
        v70 = v76;
        v76[24] = v76 == v74;
        *v78 = 1;
        if (v76 == v74)
          goto LABEL_124;
      }
    }
  }
LABEL_541:
  v301 = sub_100001760(&std::cout, (uint64_t)"\t", 1);
  v302 = *v301;
  *(uint64_t *)((char *)v301 + *(_QWORD *)(*v301 - 24) + 24) = 16;
  *(_DWORD *)((char *)v301 + *(_QWORD *)(v302 - 24) + 8) = *(_DWORD *)((_BYTE *)v301 + *(_QWORD *)(v302 - 24) + 8) & 0xFFFFFF4F | 0x80;
  v303 = sub_100001760(v301, (uint64_t)"help", 4);
  sub_100001760(v303, (uint64_t)":", 1);
  v304 = sub_100001760(&std::cout, (uint64_t)"\t", 1);
  v305 = *v304;
  *(uint64_t *)((char *)v304 + *(_QWORD *)(*v304 - 24) + 24) = 20;
  *(_DWORD *)((char *)v304 + *(_QWORD *)(v305 - 24) + 8) = *(_DWORD *)((_BYTE *)v304 + *(_QWORD *)(v305 - 24) + 8) & 0xFFFFFF4F | 0x20;
  v306 = sub_100001760(v304, (uint64_t)"print this help message", 23);
  std::ios_base::getloc((const std::ios_base *)((char *)v306 + *(_QWORD *)(*v306 - 24)));
  v307 = std::locale::use_facet(v371, &std::ctype<char>::id);
  v308 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v307->__vftable[2].~facet_0)(v307, 10);
  std::locale::~locale(v371);
  std::ostream::put(v306, v308);
  std::ostream::flush(v306);
  if (a2)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)&std::cout
                                                + (unint64_t)std::cout.__vftable[-2].~basic_ostream_0));
    v309 = std::locale::use_facet(v371, &std::ctype<char>::id);
    v310 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v309->__vftable[2].~facet_0)(v309, 10);
    std::locale::~locale(v371);
    std::ostream::put(&std::cout, v310);
    std::ostream::flush(&std::cout);
    v311 = sub_100001760(&std::cout, (uint64_t)"\t", 1);
    v312 = *v311;
    *(uint64_t *)((char *)v311 + *(_QWORD *)(*v311 - 24) + 24) = 4;
    *(_DWORD *)((char *)v311 + *(_QWORD *)(v312 - 24) + 8) = *(_DWORD *)((_BYTE *)v311 + *(_QWORD *)(v312 - 24) + 8) & 0xFFFFFF4F | 0x80;
    v313 = sub_100001760(v311, (uint64_t)"Shell commands:", 15);
    std::ios_base::getloc((const std::ios_base *)((char *)v313 + *(_QWORD *)(*v313 - 24)));
    v314 = std::locale::use_facet(v371, &std::ctype<char>::id);
    v315 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v314->__vftable[2].~facet_0)(v314, 10);
    std::locale::~locale(v371);
    std::ostream::put(v313, v315);
    std::ostream::flush(v313);
    v316 = sub_100001760(&std::cout, (uint64_t)"\t", 1);
    v317 = *v316;
    *(uint64_t *)((char *)v316 + *(_QWORD *)(*v316 - 24) + 24) = 16;
    *(_DWORD *)((char *)v316 + *(_QWORD *)(v317 - 24) + 8) = *(_DWORD *)((_BYTE *)v316 + *(_QWORD *)(v317 - 24) + 8) & 0xFFFFFF4F | 0x80;
    v318 = sub_100001760(v316, (uint64_t)"cd", 2);
    sub_100001760(v318, (uint64_t)":", 1);
    v319 = sub_100001760(&std::cout, (uint64_t)"\t", 1);
    v320 = *v319;
    *(uint64_t *)((char *)v319 + *(_QWORD *)(*v319 - 24) + 24) = 20;
    *(_DWORD *)((char *)v319 + *(_QWORD *)(v320 - 24) + 8) = *(_DWORD *)((_BYTE *)v319 + *(_QWORD *)(v320 - 24) + 8) & 0xFFFFFF4F | 0x20;
    v321 = sub_100001760(v319, (uint64_t)"switch to <path>", 16);
    std::ios_base::getloc((const std::ios_base *)((char *)v321 + *(_QWORD *)(*v321 - 24)));
    v322 = std::locale::use_facet(v371, &std::ctype<char>::id);
    v323 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v322->__vftable[2].~facet_0)(v322, 10);
    std::locale::~locale(v371);
    std::ostream::put(v321, v323);
    std::ostream::flush(v321);
    v324 = sub_100001760(&std::cout, (uint64_t)"\t", 1);
    v325 = *v324;
    *(uint64_t *)((char *)v324 + *(_QWORD *)(*v324 - 24) + 24) = 16;
    *(_DWORD *)((char *)v324 + *(_QWORD *)(v325 - 24) + 8) = *(_DWORD *)((_BYTE *)v324 + *(_QWORD *)(v325 - 24) + 8) & 0xFFFFFF4F | 0x80;
    v326 = sub_100001760(v324, (uint64_t)"ls", 2);
    sub_100001760(v326, (uint64_t)":", 1);
    v327 = sub_100001760(&std::cout, (uint64_t)"\t", 1);
    v328 = *v327;
    *(uint64_t *)((char *)v327 + *(_QWORD *)(*v327 - 24) + 24) = 20;
    *(_DWORD *)((char *)v327 + *(_QWORD *)(v328 - 24) + 8) = *(_DWORD *)((_BYTE *)v327 + *(_QWORD *)(v328 - 24) + 8) & 0xFFFFFF4F | 0x20;
    v329 = sub_100001760(v327, (uint64_t)"list commands in current path", 29);
    std::ios_base::getloc((const std::ios_base *)((char *)v329 + *(_QWORD *)(*v329 - 24)));
    v330 = std::locale::use_facet(v371, &std::ctype<char>::id);
    v331 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v330->__vftable[2].~facet_0)(v330, 10);
    std::locale::~locale(v371);
    std::ostream::put(v329, v331);
    std::ostream::flush(v329);
    v332 = sub_100001760(&std::cout, (uint64_t)"\t", 1);
    v333 = *v332;
    *(uint64_t *)((char *)v332 + *(_QWORD *)(*v332 - 24) + 24) = 16;
    *(_DWORD *)((char *)v332 + *(_QWORD *)(v333 - 24) + 8) = *(_DWORD *)((_BYTE *)v332 + *(_QWORD *)(v333 - 24) + 8) & 0xFFFFFF4F | 0x80;
    v334 = sub_100001760(v332, (uint64_t)"history", 7);
    sub_100001760(v334, (uint64_t)":", 1);
    v335 = sub_100001760(&std::cout, (uint64_t)"\t", 1);
    v336 = *v335;
    *(uint64_t *)((char *)v335 + *(_QWORD *)(*v335 - 24) + 24) = 20;
    *(_DWORD *)((char *)v335 + *(_QWORD *)(v336 - 24) + 8) = *(_DWORD *)((_BYTE *)v335 + *(_QWORD *)(v336 - 24) + 8) & 0xFFFFFF4F | 0x20;
    v337 = sub_100001760(v335, (uint64_t)"print command history", 21);
    std::ios_base::getloc((const std::ios_base *)((char *)v337 + *(_QWORD *)(*v337 - 24)));
    v338 = std::locale::use_facet(v371, &std::ctype<char>::id);
    v339 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v338->__vftable[2].~facet_0)(v338, 10);
    std::locale::~locale(v371);
    std::ostream::put(v337, v339);
    std::ostream::flush(v337);
    v340 = sub_100001760(&std::cout, (uint64_t)"\t", 1);
    v341 = *v340;
    *(uint64_t *)((char *)v340 + *(_QWORD *)(*v340 - 24) + 24) = 16;
    *(_DWORD *)((char *)v340 + *(_QWORD *)(v341 - 24) + 8) = *(_DWORD *)((_BYTE *)v340 + *(_QWORD *)(v341 - 24) + 8) & 0xFFFFFF4F | 0x80;
    v342 = sub_100001760(v340, (uint64_t)"quit", 4);
    sub_100001760(v342, (uint64_t)":", 1);
    v343 = sub_100001760(&std::cout, (uint64_t)"\t", 1);
    v344 = *v343;
    *(uint64_t *)((char *)v343 + *(_QWORD *)(*v343 - 24) + 24) = 20;
    *(_DWORD *)((char *)v343 + *(_QWORD *)(v344 - 24) + 8) = *(_DWORD *)((_BYTE *)v343 + *(_QWORD *)(v344 - 24) + 8) & 0xFFFFFF4F | 0x20;
    v345 = sub_100001760(v343, (uint64_t)"quit the application", 20);
    std::ios_base::getloc((const std::ios_base *)((char *)v345 + *(_QWORD *)(*v345 - 24)));
    v346 = std::locale::use_facet(v371, &std::ctype<char>::id);
    v347 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v346->__vftable[2].~facet_0)(v346, 10);
    std::locale::~locale(v371);
    std::ostream::put(v345, v347);
    std::ostream::flush(v345);
  }
  std::ios_base::getloc((const std::ios_base *)((char *)&std::cout
                                              + (unint64_t)std::cout.__vftable[-2].~basic_ostream_0));
  v348 = std::locale::use_facet(v371, &std::ctype<char>::id);
  v349 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v348->__vftable[2].~facet_0)(v348, 10);
  std::locale::~locale(v371);
  std::ostream::put(&std::cout, v349);
  return std::ostream::flush(&std::cout);
}

void sub_10000EFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale a71;

  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_10000EFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale a71;

  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_10000EFD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale a71;

  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_10000EFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale a71;

  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_10000EFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale a71;

  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_10000F010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale a71;

  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_10000F024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale a71;

  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_10000F038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale a71;

  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_10000F04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale a71;

  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_10000F060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale a71;

  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_10000F074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  std::locale a71;

  std::locale::~locale(&a71);
  _Unwind_Resume(a1);
}

void sub_10000F088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,std::locale a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void *a71;
  uint64_t v71;

  sub_1000037C0((uint64_t)&a35);
  sub_1000037C0((uint64_t)&a71);
  sub_100002900(v71 - 232, *(_QWORD *)(v71 - 224));
  sub_10000BA78(v71 - 208, *(_QWORD *)(v71 - 200));
  sub_10000BA18(v71 - 184, *(char **)(v71 - 176));
  sub_1000015D4(v71 - 160);
  sub_10000C7CC(v71 - 144);
  _Unwind_Resume(a1);
}

_QWORD *CommandBase::getCommandSet@<X0>(_QWORD *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  const void **v3;
  const void ***v4;
  const void **v6;
  const void ***v7;
  BOOL v8;

  *(_QWORD *)(a2 + 8) = 0;
  v2 = (uint64_t *)(a2 + 8);
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = a2 + 8;
  v3 = (const void **)this[11];
  v4 = (const void ***)(this + 12);
  if (v3 != this + 12)
  {
    do
    {
      this = sub_1000102CC((uint64_t **)a2, v2, v3 + 4, (uint64_t)(v3 + 4));
      v6 = (const void **)v3[1];
      if (v6)
      {
        do
        {
          v7 = (const void ***)v6;
          v6 = (const void **)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          v7 = (const void ***)v3[2];
          v8 = *v7 == v3;
          v3 = (const void **)v7;
        }
        while (!v8);
      }
      v3 = (const void **)v7;
    }
    while (v7 != v4);
  }
  return this;
}

void sub_10000F318(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_10000BA18(v1, *(char **)(v1 + 8));
  _Unwind_Resume(a1);
}

_QWORD *CommandBase::getSubCommandMap@<X0>(_QWORD *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  const void **v3;
  const void ***v4;
  const void **v6;
  const void ***v7;
  BOOL v8;

  *(_QWORD *)(a2 + 8) = 0;
  v2 = (uint64_t *)(a2 + 8);
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = a2 + 8;
  v3 = (const void **)this[20];
  v4 = (const void ***)(this + 21);
  if (v3 != this + 21)
  {
    do
    {
      this = sub_100010770((uint64_t **)a2, v2, v3 + 4, (uint64_t)(v3 + 4));
      v6 = (const void **)v3[1];
      if (v6)
      {
        do
        {
          v7 = (const void ***)v6;
          v6 = (const void **)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          v7 = (const void ***)v3[2];
          v8 = *v7 == v3;
          v3 = (const void **)v7;
        }
        while (!v8);
      }
      v3 = (const void **)v7;
    }
    while (v7 != v4);
  }
  return this;
}

void sub_10000F3C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_10000BA78(v1, *(_QWORD *)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t sub_10000F3E0(uint64_t a1)
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

void sub_10000F4E4(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  std::iostream::~basic_iostream(v2, v3 + 8);
  std::ios::~ios(v1);
  _Unwind_Resume(a1);
}

void sub_10000F504(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ios::~ios(v1);
  _Unwind_Resume(a1);
}

uint64_t CommandBase::execCommand(uint64_t a1, const void **a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  BOOL v15;
  uint64_t *v16;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  dispatch_object_t object;

  v6 = dispatch_group_create();
  v7 = sub_10000FE74((uint64_t **)(a1 + 112), a2, (uint64_t)a2)[7];
  object = v6;
  if (v6)
    dispatch_retain(v6);
  sub_100007B3C(&v18, a3);
  v8 = (*(uint64_t (**)(uint64_t, dispatch_object_t *, uint64_t *))(v7 + 16))(v7, &object, &v18);
  if (v20)
  {
    v9 = v18;
    v10 = v19;
    v11 = *v19;
    *(_QWORD *)(v11 + 8) = *(_QWORD *)(v18 + 8);
    **(_QWORD **)(v9 + 8) = v11;
    v20 = 0;
    if (v10 != &v18)
    {
      do
      {
        v16 = (uint64_t *)v10[1];
        if (*((char *)v10 + 39) < 0)
          operator delete((void *)v10[2]);
        operator delete(v10);
        v10 = v16;
      }
      while (v16 != &v18);
    }
  }
  if (object)
    dispatch_release(object);
  dispatch_group_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v12 = off_100020288;
  if (off_100020288 != &qword_100020290)
  {
    do
    {
      signal(*((_DWORD *)v12 + 8), 0);
      v13 = (uint64_t *)v12[1];
      if (v13)
      {
        do
        {
          v14 = v13;
          v13 = (uint64_t *)*v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          v14 = (uint64_t *)v12[2];
          v15 = *v14 == (_QWORD)v12;
          v12 = v14;
        }
        while (!v15);
      }
      v12 = v14;
    }
    while (v14 != &qword_100020290);
  }
  sub_100010008((_QWORD *)qword_100020290);
  off_100020288 = &qword_100020290;
  qword_100020298 = 0;
  qword_100020290 = 0;
  if (v6)
    dispatch_release(v6);
  return v8;
}

void sub_10000F6AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, dispatch_object_t object)
{
  NSObject *v12;

  sub_1000036BC((char *)&a9);
  if (object)
  {
    dispatch_release(object);
    if (!v12)
LABEL_3:
      _Unwind_Resume(a1);
  }
  else if (!v12)
  {
    goto LABEL_3;
  }
  dispatch_release(v12);
  _Unwind_Resume(a1);
}

void CommandBase::addCommandHandler(uint64_t a1, uint64_t a2, const void **a3, uint64_t a4)
{
  uint64_t *v8;
  uint64_t *v9;
  int v10;
  const void *v11;
  size_t v12;
  uint64_t *v13;
  int v14;
  uint64_t *v15;
  size_t v16;
  size_t v17;
  int v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  int v22;
  uint64_t *v23;
  size_t v24;
  size_t v25;
  int v26;
  void *v27;
  uint64_t *v28;
  const void *v29;
  _QWORD **v30;
  uint64_t *v31;
  uint64_t **v32;
  uint64_t *v33;
  void **v34;
  void *v35;
  uint64_t **v36;
  uint64_t *v37;
  _QWORD *v38;
  const void *v39;
  const void *v40;
  int v41;
  const void *v42;
  size_t v43;
  size_t v44;
  int v45;
  int v46;
  uint64_t *v47;
  _BYTE *v48;
  _QWORD *v49;
  uint64_t *v50;
  void **v51;
  void **v52;
  size_t v53;
  void *__p[2];
  uint64_t v55;
  void *__dst[2];
  uint64_t v57;

  v8 = (uint64_t *)(a1 + 120);
  v9 = *(uint64_t **)(a1 + 120);
  if (!v9)
    goto LABEL_36;
  v10 = *(char *)(a2 + 23);
  if (v10 >= 0)
    v11 = (const void *)a2;
  else
    v11 = *(const void **)a2;
  if (v10 >= 0)
    v12 = *(unsigned __int8 *)(a2 + 23);
  else
    v12 = *(_QWORD *)(a2 + 8);
  v13 = (uint64_t *)(a1 + 120);
  do
  {
    while (1)
    {
      v14 = *((char *)v9 + 55);
      v15 = v14 >= 0 ? v9 + 4 : (uint64_t *)v9[4];
      v16 = v14 >= 0 ? *((unsigned __int8 *)v9 + 55) : v9[5];
      v17 = v12 >= v16 ? v16 : v12;
      v18 = memcmp(v15, v11, v17);
      if (v18)
        break;
      if (v16 >= v12)
        goto LABEL_23;
LABEL_9:
      v9 = (uint64_t *)v9[1];
      if (!v9)
        goto LABEL_24;
    }
    if (v18 < 0)
      goto LABEL_9;
LABEL_23:
    v13 = v9;
    v9 = (uint64_t *)*v9;
  }
  while (v9);
LABEL_24:
  if (v13 == v8)
    goto LABEL_36;
  v21 = (uint64_t *)v13[4];
  v20 = v13 + 4;
  v19 = v21;
  v22 = *((char *)v20 + 23);
  if (v22 >= 0)
    v23 = v20;
  else
    v23 = v19;
  if (v22 >= 0)
    v24 = *((unsigned __int8 *)v20 + 23);
  else
    v24 = v20[1];
  if (v24 >= v12)
    v25 = v12;
  else
    v25 = v24;
  v26 = memcmp(v11, v23, v25);
  if (v26)
  {
    if (v26 < 0)
      goto LABEL_36;
LABEL_84:
    __cxa_rethrow();
  }
  if (v12 >= v24)
    goto LABEL_84;
LABEL_36:
  if (!*a3)
    return;
  v27 = _Block_copy(*a3);
  v28 = sub_10000FE74((uint64_t **)v8 - 1, (const void **)a2, a2);
  v29 = (const void *)v28[7];
  v28[7] = (uint64_t)v27;
  if (v29)
    _Block_release(v29);
  if (*(char *)(a2 + 23) < 0)
  {
    sub_1000016D4(__dst, *(void **)a2, *(_QWORD *)(a2 + 8));
    if (*(char *)(a4 + 23) < 0)
      goto LABEL_43;
LABEL_41:
    *(_OWORD *)__p = *(_OWORD *)a4;
    v55 = *(_QWORD *)(a4 + 16);
  }
  else
  {
    *(_OWORD *)__dst = *(_OWORD *)a2;
    v57 = *(_QWORD *)(a2 + 16);
    if ((*(char *)(a4 + 23) & 0x80000000) == 0)
      goto LABEL_41;
LABEL_43:
    sub_1000016D4(__p, *(void **)a4, *(_QWORD *)(a4 + 8));
  }
  v30 = (_QWORD **)(a1 + 88);
  v31 = sub_1000101B4(a1 + 88, (const void **)__dst);
  v32 = (uint64_t **)v31;
  if ((uint64_t *)(a1 + 96) != v31)
    __cxa_rethrow();
  v33 = (uint64_t *)*v31;
  if (!*v31)
  {
    v36 = (uint64_t **)v31;
    v37 = v31;
    goto LABEL_73;
  }
  if (v57 >= 0)
    v34 = __dst;
  else
    v34 = (void **)__dst[0];
  if (v57 >= 0)
    v35 = (void *)HIBYTE(v57);
  else
    v35 = __dst[1];
  do
  {
    while (2)
    {
      v37 = v33;
      v40 = (const void *)v33[4];
      v38 = v33 + 4;
      v39 = v40;
      v41 = *((char *)v38 + 23);
      if (v41 >= 0)
        v42 = v38;
      else
        v42 = v39;
      if (v41 >= 0)
        v43 = *((unsigned __int8 *)v38 + 23);
      else
        v43 = v38[1];
      if (v43 >= (unint64_t)v35)
        v44 = (size_t)v35;
      else
        v44 = v43;
      v45 = memcmp(v34, v42, v44);
      if (v45)
      {
        if (v45 < 0)
          goto LABEL_52;
      }
      else if ((unint64_t)v35 < v43)
      {
LABEL_52:
        v33 = (uint64_t *)*v37;
        v36 = (uint64_t **)v37;
        if (!*v37)
          goto LABEL_73;
        continue;
      }
      break;
    }
    v46 = memcmp(v42, v34, v44);
    if (v46)
    {
      if ((v46 & 0x80000000) == 0)
        goto LABEL_79;
    }
    else if (v43 >= (unint64_t)v35)
    {
      goto LABEL_79;
    }
    v33 = (uint64_t *)v37[1];
  }
  while (v33);
  v36 = (uint64_t **)(v37 + 1);
LABEL_73:
  v47 = (uint64_t *)operator new(0x38uLL);
  v48 = v47 + 4;
  if (SHIBYTE(v57) < 0)
  {
    sub_1000016D4(v48, __dst[0], (unint64_t)__dst[1]);
  }
  else
  {
    *(_OWORD *)v48 = *(_OWORD *)__dst;
    v47[6] = v57;
  }
  *v47 = 0;
  v47[1] = 0;
  v47[2] = (uint64_t)v37;
  *v36 = v47;
  v49 = (_QWORD *)**v30;
  if (v49)
  {
    *v30 = v49;
    v47 = *v36;
  }
  sub_100002978(*v32, v47);
  ++*(_QWORD *)(a1 + 104);
LABEL_79:
  v50 = sub_10000FCDC((uint64_t **)(a1 + 136), (const void **)__dst, (uint64_t)__dst);
  v51 = (void **)(v50 + 7);
  if (v50 + 7 != (uint64_t *)__p)
  {
    if (*((char *)v50 + 79) < 0)
    {
      if (v55 >= 0)
        v52 = __p;
      else
        v52 = (void **)__p[0];
      if (v55 >= 0)
        v53 = HIBYTE(v55);
      else
        v53 = (size_t)__p[1];
      sub_1000023F8(v51, v52, v53);
    }
    else if (v55 < 0)
    {
      sub_100002334(v51, __p[0], (size_t)__p[1]);
    }
    else
    {
      *(_OWORD *)v51 = *(_OWORD *)__p;
      v50[9] = v55;
    }
  }
  if ((SHIBYTE(v55) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v57) & 0x80000000) == 0)
      return;
LABEL_97:
    operator delete(__dst[0]);
    return;
  }
  operator delete(__p[0]);
  if (SHIBYTE(v57) < 0)
    goto LABEL_97;
}

void sub_10000FA94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;

  operator delete(v21);
  if (a14 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  _Unwind_Resume(a1);
}

void CommandBase::getSubCommandObj(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t **a3@<X8>)
{
  _BOOL4 v6;
  uint64_t **v7;
  uint64_t *v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint64_t **v12;
  uint64_t *v13;
  uint64_t *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  void *__p[2];
  uint64_t v20;
  __int128 *v21;

  *a3 = 0;
  a3[1] = 0;
  if (*(char *)(a2 + 23) < 0)
  {
    sub_1000016D4(__p, *(void **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)__p = *(_OWORD *)a2;
    v20 = *(_QWORD *)(a2 + 16);
  }
  if ((uint64_t *)(a1 + 168) != sub_1000101B4(a1 + 160, (const void **)__p))
  {
    v6 = 1;
    if ((SHIBYTE(v20) & 0x80000000) == 0)
      goto LABEL_6;
LABEL_9:
    operator delete(__p[0]);
    if (!v6)
      return;
    goto LABEL_10;
  }
  v6 = a1 + 192 != (_QWORD)sub_1000101B4(a1 + 184, (const void **)__p);
  if (SHIBYTE(v20) < 0)
    goto LABEL_9;
LABEL_6:
  if (!v6)
    return;
LABEL_10:
  v21 = (__int128 *)a2;
  v7 = sub_10000B88C((uint64_t **)(a1 + 160), (const void **)a2, (uint64_t)&std::piecewise_construct, &v21);
  v8 = v7[7];
  v9 = (std::__shared_weak_count *)v7[8];
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  *a3 = v8;
  a3[1] = (uint64_t *)v9;
  if (!v8)
  {
    v21 = (__int128 *)a2;
    v12 = sub_10000B88C((uint64_t **)(a1 + 184), (const void **)a2, (uint64_t)&std::piecewise_construct, &v21);
    v14 = v12[7];
    v13 = v12[8];
    if (v13)
    {
      v15 = (unint64_t *)(v13 + 1);
      do
        v16 = __ldxr(v15);
      while (__stxr(v16 + 1, v15));
    }
    *a3 = v14;
    a3[1] = v13;
    if (v9)
    {
      v17 = (unint64_t *)&v9->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
  }
}

void sub_10000FC88(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1000015D4(v1);
  _Unwind_Resume(a1);
}

void sub_10000FC9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;

  if (a14 < 0)
    operator delete(__p);
  sub_1000015D4(v14);
  _Unwind_Resume(a1);
}

void CommandBase::getCommandOptions(_QWORD *a1@<X8>)
{
  *a1 = a1;
  a1[1] = a1;
  a1[2] = 0;
}

uint64_t CommandBase::isAllowed()
{
  return 1;
}

uint64_t *sub_10000FCDC(uint64_t **a1, const void **a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t **v6;
  int v7;
  const void *v8;
  size_t v9;
  uint64_t **v10;
  _QWORD *v11;
  const void *v12;
  const void *v13;
  int v14;
  const void *v15;
  size_t v16;
  size_t v17;
  int v18;
  int v19;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t *v23;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *((char *)a2 + 23);
    if (v7 >= 0)
      v8 = a2;
    else
      v8 = *a2;
    if (v7 >= 0)
      v9 = *((unsigned __int8 *)a2 + 23);
    else
      v9 = (size_t)a2[1];
    while (1)
    {
      v10 = (uint64_t **)v5;
      v13 = (const void *)v5[4];
      v11 = v5 + 4;
      v12 = v13;
      v14 = *((char *)v11 + 23);
      if (v14 >= 0)
        v15 = v11;
      else
        v15 = v12;
      if (v14 >= 0)
        v16 = *((unsigned __int8 *)v11 + 23);
      else
        v16 = v11[1];
      if (v16 >= v9)
        v17 = v9;
      else
        v17 = v16;
      v18 = memcmp(v8, v15, v17);
      if (v18)
      {
        if (v18 < 0)
          goto LABEL_8;
LABEL_22:
        v19 = memcmp(v15, v8, v17);
        if (v19)
        {
          if ((v19 & 0x80000000) == 0)
            return (uint64_t *)v10;
        }
        else if (v16 >= v9)
        {
          return (uint64_t *)v10;
        }
        v5 = v10[1];
        if (!v5)
        {
          v6 = v10 + 1;
LABEL_28:
          v20 = (uint64_t *)operator new(0x50uLL);
          v21 = v20 + 4;
          if (*(char *)(a3 + 23) < 0)
            goto LABEL_31;
LABEL_29:
          *(_OWORD *)v21 = *(_OWORD *)a3;
          v21[2] = *(_QWORD *)(a3 + 16);
          goto LABEL_32;
        }
      }
      else
      {
        if (v9 >= v16)
          goto LABEL_22;
LABEL_8:
        v5 = *v10;
        v6 = v10;
        if (!*v10)
          goto LABEL_28;
      }
    }
  }
  v10 = a1 + 1;
  v20 = (uint64_t *)operator new(0x50uLL);
  v21 = v20 + 4;
  if ((*(char *)(a3 + 23) & 0x80000000) == 0)
    goto LABEL_29;
LABEL_31:
  sub_1000016D4(v21, *(void **)a3, *(_QWORD *)(a3 + 8));
LABEL_32:
  v20[7] = 0;
  v20[8] = 0;
  v20[9] = 0;
  *v20 = 0;
  v20[1] = 0;
  v20[2] = (uint64_t)v10;
  *v6 = v20;
  v22 = (uint64_t *)**a1;
  v23 = v20;
  if (v22)
  {
    *a1 = v22;
    v23 = *v6;
  }
  sub_100002978(a1[1], v23);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return v20;
}

void sub_10000FE60(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_10000FE74(uint64_t **a1, const void **a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t **v6;
  int v7;
  const void *v8;
  size_t v9;
  uint64_t **v10;
  _QWORD *v11;
  const void *v12;
  const void *v13;
  int v14;
  const void *v15;
  size_t v16;
  size_t v17;
  int v18;
  int v19;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t *v23;

  v6 = a1 + 1;
  v5 = a1[1];
  if (v5)
  {
    v7 = *((char *)a2 + 23);
    if (v7 >= 0)
      v8 = a2;
    else
      v8 = *a2;
    if (v7 >= 0)
      v9 = *((unsigned __int8 *)a2 + 23);
    else
      v9 = (size_t)a2[1];
    while (1)
    {
      v10 = (uint64_t **)v5;
      v13 = (const void *)v5[4];
      v11 = v5 + 4;
      v12 = v13;
      v14 = *((char *)v11 + 23);
      if (v14 >= 0)
        v15 = v11;
      else
        v15 = v12;
      if (v14 >= 0)
        v16 = *((unsigned __int8 *)v11 + 23);
      else
        v16 = v11[1];
      if (v16 >= v9)
        v17 = v9;
      else
        v17 = v16;
      v18 = memcmp(v8, v15, v17);
      if (v18)
      {
        if (v18 < 0)
          goto LABEL_8;
LABEL_22:
        v19 = memcmp(v15, v8, v17);
        if (v19)
        {
          if ((v19 & 0x80000000) == 0)
            return (uint64_t *)v10;
        }
        else if (v16 >= v9)
        {
          return (uint64_t *)v10;
        }
        v5 = v10[1];
        if (!v5)
        {
          v6 = v10 + 1;
LABEL_28:
          v20 = (uint64_t *)operator new(0x40uLL);
          v21 = v20 + 4;
          if (*(char *)(a3 + 23) < 0)
            goto LABEL_31;
LABEL_29:
          *(_OWORD *)v21 = *(_OWORD *)a3;
          v21[2] = *(_QWORD *)(a3 + 16);
          goto LABEL_32;
        }
      }
      else
      {
        if (v9 >= v16)
          goto LABEL_22;
LABEL_8:
        v5 = *v10;
        v6 = v10;
        if (!*v10)
          goto LABEL_28;
      }
    }
  }
  v10 = a1 + 1;
  v20 = (uint64_t *)operator new(0x40uLL);
  v21 = v20 + 4;
  if ((*(char *)(a3 + 23) & 0x80000000) == 0)
    goto LABEL_29;
LABEL_31:
  sub_1000016D4(v21, *(void **)a3, *(_QWORD *)(a3 + 8));
LABEL_32:
  v20[7] = 0;
  *v20 = 0;
  v20[1] = 0;
  v20[2] = (uint64_t)v10;
  *v6 = v20;
  v22 = (uint64_t *)**a1;
  v23 = v20;
  if (v22)
  {
    *a1 = v22;
    v23 = *v6;
  }
  sub_100002978(a1[1], v23);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return v20;
}

void sub_10000FFF4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_100010008(_QWORD *a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  if (!a1)
    return;
  sub_100010008(*a1);
  sub_100010008(a1[1]);
  v2 = (void **)a1[6];
  v3 = (void **)a1[7];
  if (v3 == v2)
  {
    v3 = (void **)a1[6];
    a1[10] = 0;
    v12 = 0;
    goto LABEL_17;
  }
  v4 = a1[9];
  v5 = &v2[v4 >> 7];
  v6 = (uint64_t)*v5;
  v7 = (uint64_t)*v5 + 32 * (v4 & 0x7F);
  v8 = *(uint64_t *)((char *)v2 + (((a1[10] + v4) >> 4) & 0xFFFFFFFFFFFFFF8)) + 32 * ((a1[10] + v4) & 0x7F);
  if (v7 == v8)
    goto LABEL_15;
  do
  {
    v9 = *(_QWORD **)(v7 + 24);
    if (v9 == (_QWORD *)v7)
    {
      v9 = (_QWORD *)v7;
      v10 = 4;
    }
    else
    {
      if (!v9)
        goto LABEL_11;
      v10 = 5;
    }
    (*(void (**)(void))(*v9 + 8 * v10))();
    v6 = (uint64_t)*v5;
LABEL_11:
    v7 += 32;
    if (v7 - v6 == 4096)
    {
      v11 = (uint64_t)v5[1];
      ++v5;
      v6 = v11;
      v7 = v11;
    }
  }
  while (v7 != v8);
  v2 = (void **)a1[6];
  v3 = (void **)a1[7];
LABEL_15:
  a1[10] = 0;
  v12 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = (void **)a1[7];
      v2 = (void **)(a1[6] + 8);
      a1[6] = v2;
      v12 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
LABEL_17:
  v13 = v12 >> 3;
  if (v13 == 1)
  {
    v14 = 64;
LABEL_22:
    a1[9] = v14;
  }
  else if (v13 == 2)
  {
    v14 = 128;
    goto LABEL_22;
  }
  if (v2 != v3)
  {
    do
    {
      v15 = *v2++;
      operator delete(v15);
    }
    while (v2 != v3);
    v17 = a1[6];
    v16 = a1[7];
    if (v16 != v17)
      a1[7] = v16 + ((v17 - v16 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  v18 = (void *)a1[5];
  if (v18)
    operator delete(v18);
  operator delete(a1);
}

uint64_t *sub_1000101B4(uint64_t a1, const void **a2)
{
  uint64_t *v2;
  uint64_t *v3;
  int v4;
  const void *v5;
  size_t v6;
  uint64_t *v7;
  int v8;
  uint64_t *v9;
  size_t v10;
  size_t v11;
  int v12;
  int v13;
  const void *v14;
  size_t v15;
  size_t v16;
  int v17;

  v2 = (uint64_t *)(a1 + 8);
  v3 = *(uint64_t **)(a1 + 8);
  if (!v3)
    return v2;
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = a2;
  else
    v5 = *a2;
  if (v4 >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  v7 = (uint64_t *)(a1 + 8);
  do
  {
    while (1)
    {
      v8 = *((char *)v3 + 55);
      v9 = v8 >= 0 ? v3 + 4 : (uint64_t *)v3[4];
      v10 = v8 >= 0 ? *((unsigned __int8 *)v3 + 55) : v3[5];
      v11 = v6 >= v10 ? v10 : v6;
      v12 = memcmp(v9, v5, v11);
      if (v12)
        break;
      if (v10 >= v6)
        goto LABEL_23;
LABEL_9:
      v3 = (uint64_t *)v3[1];
      if (!v3)
        goto LABEL_24;
    }
    if (v12 < 0)
      goto LABEL_9;
LABEL_23:
    v7 = v3;
    v3 = (uint64_t *)*v3;
  }
  while (v3);
LABEL_24:
  if (v7 == v2)
    return v2;
  v13 = *((char *)v7 + 55);
  if (v13 >= 0)
    v14 = v7 + 4;
  else
    v14 = (const void *)v7[4];
  if (v13 >= 0)
    v15 = *((unsigned __int8 *)v7 + 55);
  else
    v15 = v7[5];
  if (v15 >= v6)
    v16 = v6;
  else
    v16 = v15;
  v17 = memcmp(v5, v14, v16);
  if (v17)
  {
    if ((v17 & 0x80000000) == 0)
      return v7;
    return v2;
  }
  else
  {
    if (v6 < v15)
      return v2;
    return v7;
  }
}

_QWORD *sub_1000102CC(uint64_t **a1, uint64_t *a2, const void **a3, uint64_t a4)
{
  uint64_t *v6;
  uint64_t *v8;
  _QWORD *v9;
  _BYTE *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;

  v14 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  v15 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  v6 = sub_1000103C8(a1, a2, &v15, &v14, a3);
  if (*v6)
    return (_QWORD *)*v6;
  v8 = v6;
  v9 = operator new(0x38uLL);
  v10 = v9 + 4;
  if (*(char *)(a4 + 23) < 0)
  {
    sub_1000016D4(v10, *(void **)a4, *(_QWORD *)(a4 + 8));
  }
  else
  {
    *(_OWORD *)v10 = *(_OWORD *)a4;
    v9[6] = *(_QWORD *)(a4 + 16);
  }
  v11 = v15;
  *v9 = 0;
  v9[1] = 0;
  v9[2] = v11;
  *v8 = (uint64_t)v9;
  v12 = (uint64_t *)**a1;
  v13 = v9;
  if (v12)
  {
    *a1 = v12;
    v13 = (uint64_t *)*v8;
  }
  sub_100002978(a1[1], v13);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return v9;
}

void sub_1000103B4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_1000103C8(uint64_t **a1, uint64_t *a2, uint64_t **a3, uint64_t **a4, const void **a5)
{
  uint64_t **v8;
  int v10;
  const void *v11;
  size_t v12;
  int v13;
  const void *v14;
  size_t v15;
  size_t v16;
  int v17;
  int v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  BOOL v23;
  int v24;
  const void *v25;
  size_t v26;
  int v27;
  const void *v28;
  size_t v29;
  size_t v30;
  int v31;
  uint64_t *v32;
  uint64_t **v33;
  _QWORD *v34;
  const void *v35;
  const void *v36;
  int v37;
  const void *v38;
  size_t v39;
  size_t v40;
  int v41;
  int v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t *v45;
  int v46;
  uint64_t *v47;
  size_t v48;
  size_t v49;
  int v50;
  uint64_t *v51;
  uint64_t **v52;
  uint64_t **v53;
  _QWORD *v54;
  const void *v55;
  const void *v56;
  int v57;
  const void *v58;
  size_t v59;
  size_t v60;
  int v61;
  int v62;

  v8 = a1 + 1;
  if (a1 + 1 == (uint64_t **)a2)
    goto LABEL_23;
  v10 = *((char *)a5 + 23);
  if (v10 >= 0)
    v11 = a5;
  else
    v11 = *a5;
  if (v10 >= 0)
    v12 = *((unsigned __int8 *)a5 + 23);
  else
    v12 = (size_t)a5[1];
  v13 = *((char *)a2 + 55);
  if (v13 >= 0)
    v14 = a2 + 4;
  else
    v14 = (const void *)a2[4];
  if (v13 >= 0)
    v15 = *((unsigned __int8 *)a2 + 55);
  else
    v15 = a2[5];
  if (v15 >= v12)
    v16 = v12;
  else
    v16 = v15;
  v17 = memcmp(v11, v14, v16);
  if (!v17)
  {
    if (v12 >= v15)
      goto LABEL_19;
LABEL_23:
    v19 = (uint64_t *)*a2;
    if (*a1 == a2)
    {
      v21 = a2;
    }
    else
    {
      if (v19)
      {
        v20 = (uint64_t *)*a2;
        do
        {
          v21 = v20;
          v20 = (uint64_t *)v20[1];
        }
        while (v20);
      }
      else
      {
        v22 = a2;
        do
        {
          v21 = (uint64_t *)v22[2];
          v23 = *v21 == (_QWORD)v22;
          v22 = v21;
        }
        while (v23);
      }
      v24 = *((char *)v21 + 55);
      if (v24 >= 0)
        v25 = v21 + 4;
      else
        v25 = (const void *)v21[4];
      if (v24 >= 0)
        v26 = *((unsigned __int8 *)v21 + 55);
      else
        v26 = v21[5];
      v27 = *((char *)a5 + 23);
      if (v27 >= 0)
        v28 = a5;
      else
        v28 = *a5;
      if (v27 >= 0)
        v29 = *((unsigned __int8 *)a5 + 23);
      else
        v29 = (size_t)a5[1];
      if (v29 >= v26)
        v30 = v26;
      else
        v30 = v29;
      v31 = memcmp(v25, v28, v30);
      if (v31)
      {
        if ((v31 & 0x80000000) == 0)
          goto LABEL_48;
      }
      else if (v26 >= v29)
      {
LABEL_48:
        v32 = *v8;
        if (!*v8)
        {
          v33 = v8;
LABEL_69:
          *a3 = (uint64_t *)v33;
          return (uint64_t *)v8;
        }
        while (1)
        {
          v33 = (uint64_t **)v32;
          v36 = (const void *)v32[4];
          v34 = v32 + 4;
          v35 = v36;
          v37 = *((char *)v34 + 23);
          if (v37 >= 0)
            v38 = v34;
          else
            v38 = v35;
          if (v37 >= 0)
            v39 = *((unsigned __int8 *)v34 + 23);
          else
            v39 = v34[1];
          if (v39 >= v29)
            v40 = v29;
          else
            v40 = v39;
          v41 = memcmp(v28, v38, v40);
          if (v41)
          {
            if (v41 < 0)
              goto LABEL_50;
LABEL_64:
            v42 = memcmp(v38, v28, v40);
            if (v42)
            {
              if ((v42 & 0x80000000) == 0)
                goto LABEL_69;
            }
            else if (v39 >= v29)
            {
              goto LABEL_69;
            }
            v8 = v33 + 1;
            v32 = v33[1];
            if (!v32)
              goto LABEL_69;
          }
          else
          {
            if (v29 >= v39)
              goto LABEL_64;
LABEL_50:
            v32 = *v33;
            v8 = v33;
            if (!*v33)
              goto LABEL_69;
          }
        }
      }
    }
    if (v19)
    {
      *a3 = v21;
      return v21 + 1;
    }
    else
    {
      *a3 = a2;
      return a2;
    }
  }
  if (v17 < 0)
    goto LABEL_23;
LABEL_19:
  v18 = memcmp(v14, v11, v16);
  if (v18)
  {
    if ((v18 & 0x80000000) == 0)
    {
LABEL_21:
      *a3 = a2;
      *a4 = a2;
      return (uint64_t *)a4;
    }
  }
  else if (v15 >= v12)
  {
    goto LABEL_21;
  }
  v43 = a2[1];
  if (v43)
  {
    v44 = (uint64_t *)a2[1];
    do
    {
      a4 = (uint64_t **)v44;
      v44 = (uint64_t *)*v44;
    }
    while (v44);
  }
  else
  {
    v45 = a2;
    do
    {
      a4 = (uint64_t **)v45[2];
      v23 = *a4 == v45;
      v45 = (uint64_t *)a4;
    }
    while (!v23);
  }
  if (a4 != v8)
  {
    v46 = *((char *)a4 + 55);
    if (v46 >= 0)
      v47 = (uint64_t *)(a4 + 4);
    else
      v47 = a4[4];
    if (v46 >= 0)
      v48 = *((unsigned __int8 *)a4 + 55);
    else
      v48 = (size_t)a4[5];
    if (v48 >= v12)
      v49 = v12;
    else
      v49 = v48;
    v50 = memcmp(v11, v47, v49);
    if (v50)
    {
      if ((v50 & 0x80000000) == 0)
      {
LABEL_95:
        v51 = *v8;
        if (*v8)
        {
          v52 = a3;
          while (1)
          {
            v53 = (uint64_t **)v51;
            v56 = (const void *)v51[4];
            v54 = v51 + 4;
            v55 = v56;
            v57 = *((char *)v54 + 23);
            if (v57 >= 0)
              v58 = v54;
            else
              v58 = v55;
            if (v57 >= 0)
              v59 = *((unsigned __int8 *)v54 + 23);
            else
              v59 = v54[1];
            if (v59 >= v12)
              v60 = v12;
            else
              v60 = v59;
            v61 = memcmp(v11, v58, v60);
            if (v61)
            {
              if (v61 < 0)
                goto LABEL_97;
LABEL_111:
              v62 = memcmp(v58, v11, v60);
              if (v62)
              {
                if ((v62 & 0x80000000) == 0)
                  goto LABEL_123;
              }
              else if (v59 >= v12)
              {
                goto LABEL_123;
              }
              v8 = v53 + 1;
              v51 = v53[1];
              if (!v51)
                goto LABEL_123;
            }
            else
            {
              if (v12 >= v59)
                goto LABEL_111;
LABEL_97:
              v51 = *v53;
              v8 = v53;
              if (!*v53)
                goto LABEL_123;
            }
          }
        }
        v53 = v8;
        v52 = a3;
LABEL_123:
        *v52 = (uint64_t *)v53;
        return (uint64_t *)v8;
      }
    }
    else if (v12 >= v48)
    {
      goto LABEL_95;
    }
  }
  if (v43)
  {
    *a3 = (uint64_t *)a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return (uint64_t *)a4;
}

_QWORD *sub_100010770(uint64_t **a1, uint64_t *a2, const void **a3, uint64_t a4)
{
  uint64_t *v6;
  uint64_t *v8;
  _QWORD *v9;
  _BYTE *v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;

  v17 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  v18 = (uint64_t *)0xAAAAAAAAAAAAAAAALL;
  v6 = sub_1000103C8(a1, a2, &v18, &v17, a3);
  if (*v6)
    return (_QWORD *)*v6;
  v8 = v6;
  v9 = operator new(0x48uLL);
  v10 = v9 + 4;
  if (*(char *)(a4 + 23) < 0)
  {
    sub_1000016D4(v10, *(void **)a4, *(_QWORD *)(a4 + 8));
  }
  else
  {
    *(_OWORD *)v10 = *(_OWORD *)a4;
    v9[6] = *(_QWORD *)(a4 + 16);
  }
  v11 = *(_QWORD *)(a4 + 32);
  v9[7] = *(_QWORD *)(a4 + 24);
  v9[8] = v11;
  if (v11)
  {
    v12 = (unint64_t *)(v11 + 8);
    do
      v13 = __ldxr(v12);
    while (__stxr(v13 + 1, v12));
  }
  v14 = v18;
  *v9 = 0;
  v9[1] = 0;
  v9[2] = v14;
  *v8 = (uint64_t)v9;
  v15 = (uint64_t *)**a1;
  v16 = v9;
  if (v15)
  {
    *a1 = v15;
    v16 = (uint64_t *)*v8;
  }
  sub_100002978(a1[1], v16);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return v9;
}

void sub_100010878(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_100010890(CommandShell *a1)
{
  void *v1;

  CommandShell::~CommandShell(a1);
  operator delete(v1);
}

void sub_1000108A4(std::__shared_weak_count_vtbl **a1@<X8>)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  unint64_t *v5;
  unint64_t v6;
  const void *v7;
  size_t v8;
  void *v9;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  dispatch_time_t v31;
  char *v32;
  unint64_t *v33;
  unint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  dispatch_object_t object;
  void (__cdecl *v42)(std::__shared_weak_count *__hidden);
  std::__shared_weak_count *v43;
  uint64_t v44;
  std::__shared_weak_count *v45;
  void (__cdecl *v46)(std::__shared_weak_count *__hidden);
  std::__shared_weak_count *v47;
  void (__cdecl *v48)(std::__shared_weak_count *__hidden);
  std::__shared_weak_count *v49;
  _QWORD v50[5];
  std::__shared_weak_count *v51;
  dispatch_group_t group;
  void (__cdecl *v53)(std::__shared_weak_count *__hidden);
  std::__shared_weak_count *v54;
  void *__dst[2];
  unint64_t v56;
  void (__cdecl *v57)(std::__shared_weak_count *__hidden);
  unint64_t v58;

  v2 = dispatch_queue_create("abmtool.queue", 0);
  v57 = (void (__cdecl *)(std::__shared_weak_count *__hidden))0xAAAAAAAAAAAAAAAALL;
  v58 = 0xAAAAAAAAAAAAAAAALL;
  HIBYTE(v56) = 7;
  strcpy((char *)__dst, "abmtool");
  abm::client::CreateManager(&v57, __dst, v2);
  if (SHIBYTE(v56) < 0)
    operator delete(__dst[0]);
  v3 = dispatch_group_create();
  v4 = v3;
  if (v3)
  {
    dispatch_retain(v3);
    dispatch_group_enter(v4);
  }
  v53 = v57;
  v54 = (std::__shared_weak_count *)v58;
  if (v58)
  {
    v5 = (unint64_t *)(v58 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (const void *)abm::kEventServerStateChange;
  v8 = strlen(abm::kEventServerStateChange);
  if (v8 >= 0x7FFFFFFFFFFFFFF8)
    sub_10000163C();
  v9 = (void *)v8;
  if (v8 >= 0x17)
  {
    v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17)
      v11 = v8 | 7;
    v12 = v11 + 1;
    v10 = (void **)operator new(v11 + 1);
    __dst[1] = v9;
    v56 = v12 | 0x8000000000000000;
    __dst[0] = v10;
    goto LABEL_15;
  }
  HIBYTE(v56) = v8;
  v10 = __dst;
  if (v8)
LABEL_15:
    memmove(v10, v7, (size_t)v9);
  *((_BYTE *)v9 + (_QWORD)v10) = 0;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 1174405120;
  v50[2] = sub_100010E30;
  v50[3] = &unk_10001C838;
  v50[4] = v57;
  v51 = (std::__shared_weak_count *)v58;
  if (v58)
  {
    v13 = (unint64_t *)(v58 + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  group = v4;
  if (v4)
  {
    dispatch_retain(v4);
    dispatch_group_enter(group);
  }
  abm::client::RegisterEventHandler(&v53, __dst, v50);
  if (SHIBYTE(v56) < 0)
    operator delete(__dst[0]);
  v15 = v54;
  if (v54)
  {
    p_shared_owners = (unint64_t *)&v54->__shared_owners_;
    do
      v17 = __ldaxr(p_shared_owners);
    while (__stlxr(v17 - 1, p_shared_owners));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v48 = v57;
  v49 = (std::__shared_weak_count *)v58;
  if (v58)
  {
    v18 = (unint64_t *)(v58 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  abm::client::EventsOff(&v48);
  v20 = v49;
  if (v49)
  {
    v21 = (unint64_t *)&v49->__shared_owners_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v46 = v57;
  v47 = (std::__shared_weak_count *)v58;
  if (v58)
  {
    v23 = (unint64_t *)(v58 + 8);
    do
      v24 = __ldxr(v23);
    while (__stxr(v24 + 1, v23));
  }
  abm::client::EventsOn(&v46);
  v25 = v47;
  if (v47)
  {
    v26 = (unint64_t *)&v47->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  if (group)
  {
    dispatch_group_leave(group);
    if (group)
      dispatch_release(group);
  }
  v28 = v51;
  if (v51)
  {
    v29 = (unint64_t *)&v51->__shared_owners_;
    do
      v30 = __ldaxr(v29);
    while (__stlxr(v30 - 1, v29));
    if (!v30)
    {
      ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
      std::__shared_weak_count::__release_weak(v28);
    }
  }
  if (v4)
  {
    dispatch_group_leave(v4);
    dispatch_release(v4);
  }
  v31 = dispatch_time(0, 500000000);
  dispatch_group_wait(v4, v31);
  v32 = (char *)getprogname();
  v44 = 0;
  v45 = 0;
  v42 = v57;
  v43 = (std::__shared_weak_count *)v58;
  if (v58)
  {
    v33 = (unint64_t *)(v58 + 8);
    do
      v34 = __ldxr(v33);
    while (__stxr(v34 + 1, v33));
  }
  object = v2;
  if (v2)
    dispatch_retain(v2);
  ABMCommand::create(v32, &v44, &v42, &object, a1);
  if (object)
    dispatch_release(object);
  v35 = v43;
  if (v43)
  {
    v36 = (unint64_t *)&v43->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
      std::__shared_weak_count::__release_weak(v35);
    }
  }
  if (v45)
    std::__shared_weak_count::__release_weak(v45);
  if (v4)
    dispatch_release(v4);
  v38 = (std::__shared_weak_count *)v58;
  if (v58)
  {
    v39 = (unint64_t *)(v58 + 8);
    do
      v40 = __ldaxr(v39);
    while (__stlxr(v40 - 1, v39));
    if (!v40)
    {
      ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
      std::__shared_weak_count::__release_weak(v38);
    }
  }
  if (v2)
    dispatch_release(v2);
}

void sub_100010D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, dispatch_object_t object, char a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14, char a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,dispatch_group_t group)
{
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  std::__shared_weak_count *v29;

  if (object)
  {
    dispatch_release(object);
    sub_1000015D4((uint64_t)&a11);
    v29 = a14;
    if (!a14)
    {
LABEL_3:
      if (!v26)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else
  {
    sub_1000015D4((uint64_t)&a11);
    v29 = a14;
    if (!a14)
      goto LABEL_3;
  }
  std::__shared_weak_count::__release_weak(v29);
  if (!v26)
  {
LABEL_10:
    sub_1000015D4(v27 - 80);
    if (v25)
    {
      dispatch_release(v25);
      _Unwind_Resume(a1);
    }
    _Unwind_Resume(a1);
  }
LABEL_9:
  dispatch_release(v26);
  goto LABEL_10;
}

void sub_100010E30(int a1, xpc_object_t object)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t value;
  int v5;
  size_t v6;
  void **v7;
  xpc_object_t objecta;
  void *v9[3];
  void *__p[2];
  uint64_t v11;

  if (object)
  {
    v2 = object;
    xpc_retain(object);
    goto LABEL_4;
  }
  v2 = xpc_null_create();
  if (v2)
  {
LABEL_4:
    if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v2);
      v3 = v2;
    }
    else
    {
      v3 = xpc_null_create();
    }
    goto LABEL_8;
  }
  v3 = xpc_null_create();
  v2 = 0;
LABEL_8:
  xpc_release(v2);
  memset(v9, 170, sizeof(v9));
  value = xpc_dictionary_get_value(v3, abm::kKeyServerState);
  objecta = value;
  if (value)
    xpc_retain(value);
  else
    objecta = xpc_null_create();
  __p[0] = 0;
  __p[1] = 0;
  v11 = 0;
  xpc::dyn_cast_or_default(v9, &objecta, __p);
  if (SHIBYTE(v11) < 0)
    operator delete(__p[0]);
  xpc_release(objecta);
  v5 = SHIBYTE(v9[2]);
  if (SHIBYTE(v9[2]) >= 0)
    v6 = HIBYTE(v9[2]);
  else
    v6 = (size_t)v9[1];
  if (v6 == strlen(abm::kServerStateStarted))
  {
    if (SHIBYTE(v9[2]) >= 0)
      v7 = v9;
    else
      v7 = (void **)v9[0];
    byte_1000202F0 = memcmp(v7, abm::kServerStateStarted, v6) == 0;
    if (v5 < 0)
      goto LABEL_23;
  }
  else
  {
    byte_1000202F0 = 0;
    if (SHIBYTE(v9[2]) < 0)
LABEL_23:
      operator delete(v9[0]);
  }
  xpc_release(v3);
}

void sub_100010FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  void *v19;

  if (a19 < 0)
    operator delete(__p);
  xpc_release(object);
  xpc_release(v19);
  _Unwind_Resume(a1);
}

void sub_100011000(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;

  v3 = a2[5];
  a1[4] = a2[4];
  a1[5] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  v6 = a2[6];
  a1[6] = v6;
  if (v6)
  {
    dispatch_retain(v6);
    v7 = a1[6];
    if (v7)
      dispatch_group_enter(v7);
  }
}

void sub_100011060(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v2 = *(NSObject **)(a1 + 48);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 48);
    if (v3)
      dispatch_release(v3);
  }
  v4 = *(std::__shared_weak_count **)(a1 + 40);
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

int main(int argc, const char **argv, const char **envp)
{
  capabilities::radio *v3;
  _QWORD *v4;
  const std::locale::facet *v5;
  uint64_t v6;
  int v7;
  config::hw *isProcessRunning;
  int v9;
  char v10;
  char v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v16;
  const std::locale::facet *v17;
  uint64_t v18;
  void *__p[2];
  char v20;
  _QWORD v21[3];

  memset(v21, 170, sizeof(v21));
  CommandShell::convertCmdArgsToList(*(CommandShell **)&argc, argv, v21);
  if (capabilities::radio::radioUnknown(v3))
  {
    v4 = sub_100001760(&std::cout, (uint64_t)"'abmtool' is not supported on this product.", 43);
    std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(_QWORD *)(*v4 - 24)));
    v5 = std::locale::use_facet((const std::locale *)__p, &std::ctype<char>::id);
    v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 10);
    std::locale::~locale((std::locale *)__p);
    std::ostream::put(v4, v6);
    goto LABEL_3;
  }
  v20 = 10;
  strcpy((char *)__p, "CommCenter");
  isProcessRunning = (config::hw *)ctu::isProcessRunning(__p);
  v9 = (int)isProcessRunning;
  if (v20 < 0)
    operator delete(__p[0]);
  if (((config::hw::watch(isProcessRunning) | v9) & 1) != 0)
    goto LABEL_10;
  v20 = 9;
  strcpy((char *)__p, "basebandd");
  v10 = ctu::isProcessRunning(__p);
  v11 = v10;
  if (v20 < 0)
  {
    operator delete(__p[0]);
    if ((v11 & 1) == 0)
      goto LABEL_17;
LABEL_10:
    __p[0] = (void *)0xAAAAAAAAAAAAAAAALL;
    pthread_create((pthread_t *)__p, 0, (void *(__cdecl *)(void *))sub_10001137C, v21);
    CFRunLoopRun();
    v7 = 0;
    if (!v21[2])
      return v7;
    goto LABEL_11;
  }
  if ((v10 & 1) != 0)
    goto LABEL_10;
LABEL_17:
  v4 = sub_100001760(&std::cout, (uint64_t)"CommCenter process is not running. Please run/load CommCenter (or basebandd) and try again.", 91);
  std::ios_base::getloc((const std::ios_base *)((char *)v4 + *(_QWORD *)(*v4 - 24)));
  v17 = std::locale::use_facet((const std::locale *)__p, &std::ctype<char>::id);
  v18 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v17->__vftable[2].~facet_0)(v17, 10);
  std::locale::~locale((std::locale *)__p);
  std::ostream::put(v4, v18);
LABEL_3:
  std::ostream::flush(v4);
  v7 = -1;
  if (!v21[2])
    return v7;
LABEL_11:
  v12 = v21[0];
  v13 = (_QWORD *)v21[1];
  v14 = *(_QWORD *)v21[1];
  *(_QWORD *)(v14 + 8) = *(_QWORD *)(v21[0] + 8);
  **(_QWORD **)(v12 + 8) = v14;
  v21[2] = 0;
  if (v13 != v21)
  {
    do
    {
      v16 = (_QWORD *)v13[1];
      if (*((char *)v13 + 39) < 0)
        operator delete((void *)v13[2]);
      operator delete(v13);
      v13 = v16;
    }
    while (v16 != v21);
  }
  return v7;
}

void sub_10001131C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  std::locale::~locale((std::locale *)&__p);
  sub_1000036BC(&a15);
  _Unwind_Resume(a1);
}

void sub_10001137C(uint64_t a1)
{
  char *v1;
  _QWORD *v2;
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  _QWORD v11[3];

  memset(v11, 170, sizeof(v11));
  sub_100007B3C(v11, a1);
  v1 = (char *)operator new(0x48uLL);
  *(_OWORD *)(v1 + 56) = 0u;
  *(_OWORD *)(v1 + 40) = 0u;
  *(_OWORD *)(v1 + 24) = 0u;
  *(_OWORD *)(v1 + 8) = 0u;
  *(_QWORD *)v1 = &off_10001C820;
  v2 = operator new(0x20uLL);
  v2[1] = 0;
  *v2 = &off_10001C890;
  v2[2] = 0;
  v2[3] = v1;
  sub_100007B3C(&v8, (uint64_t)v11);
  v3 = CommandShell::run((uint64_t)v1, (uint64_t)&v8);
  if (v10)
  {
    v4 = v8;
    v5 = v9;
    v6 = *v9;
    *(_QWORD *)(v6 + 8) = *(_QWORD *)(v8 + 8);
    **(_QWORD **)(v4 + 8) = v6;
    v10 = 0;
    if (v5 != &v8)
    {
      do
      {
        v7 = (uint64_t *)v5[1];
        if (*((char *)v5 + 39) < 0)
          operator delete((void *)v5[2]);
        operator delete(v5);
        v5 = v7;
      }
      while (v7 != &v8);
    }
  }
  exit(v3 ^ 1);
}

void sub_100011480(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t *a10, uint64_t a11, uint64_t a12, uint64_t *a13, uint64_t a14)
{
  std::__shared_weak_count *v14;
  unint64_t *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;

  if (a11)
  {
    v17 = a9;
    v18 = (uint64_t)a10;
    v19 = *a10;
    *(_QWORD *)(v19 + 8) = *(_QWORD *)(a9 + 8);
    **(_QWORD **)(v17 + 8) = v19;
    a11 = 0;
    if ((uint64_t *)v18 != &a9)
    {
      do
      {
        v20 = *(uint64_t **)(v18 + 8);
        if (*(char *)(v18 + 39) < 0)
          operator delete(*(void **)(v18 + 16));
        operator delete((void *)v18);
        v18 = (uint64_t)v20;
      }
      while (v20 != &a9);
    }
  }
  do
    v21 = __ldaxr(v15);
  while (__stlxr(v21 - 1, v15));
  if (!v21)
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
  }
  if (a14)
  {
    v22 = a12;
    v23 = (uint64_t)a13;
    v24 = *a13;
    *(_QWORD *)(v24 + 8) = *(_QWORD *)(a12 + 8);
    **(_QWORD **)(v22 + 8) = v24;
    a14 = 0;
    if ((uint64_t *)v23 != &a12)
    {
      do
      {
        v25 = *(uint64_t **)(v23 + 8);
        if (*(char *)(v23 + 39) < 0)
          operator delete(*(void **)(v23 + 16));
        operator delete((void *)v23);
        v23 = (uint64_t)v25;
      }
      while (v25 != &a12);
    }
  }
  _Unwind_Resume(exception_object);
}

void sub_100011598(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_1000115AC(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t sub_1000115C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000010001B53DLL)
    return a1 + 24;
  if (((v3 & 0x800000010001B53DLL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000010001B53DLL))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000010001B53DLL & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void sub_100011644(uint64_t a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_weak_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  NSObject *v10;
  uint64_t **v11;
  uint64_t *v12;
  std::__shared_weak_count_vtbl *v13;
  unint64_t *v14;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  dispatch_object_t object;
  void (__cdecl *v29)(std::__shared_weak_count *__hidden);
  std::__shared_weak_count *v30;
  uint64_t v31;
  std::__shared_weak_count *v32;
  uint64_t v33;
  std::__shared_weak_count *v34;
  std::__shared_weak_count_vtbl *v35;
  std::__shared_weak_count *v36;
  const void *v37[2];
  char v38;
  const void **v39;

  v38 = 7;
  strcpy((char *)v37, "logdump");
  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(std::__shared_weak_count **)(a1 + 16);
  v31 = v3;
  if (!v2 || (v4 = std::__shared_weak_count::lock(v2), (v32 = v4) == 0))
    sub_100001A7C();
  v33 = v3;
  v34 = v4;
  p_shared_weak_owners = (unint64_t *)&v4->__shared_weak_owners_;
  do
    v6 = __ldxr(p_shared_weak_owners);
  while (__stxr(v6 + 1, p_shared_weak_owners));
  v7 = *(std::__shared_weak_count **)(a1 + 216);
  v29 = *(void (__cdecl **)(std::__shared_weak_count *__hidden))(a1 + 208);
  v30 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v10 = *(NSObject **)(a1 + 224);
  object = v10;
  if (v10)
    dispatch_retain(v10);
  LogdumpCommand::create("logdump", &v33, &v29, &object, &v35);
  if (v35)
  {
    if ((uint64_t *)(a1 + 168) != sub_1000101B4(a1 + 160, v37))
      __cxa_rethrow();
    v39 = v37;
    v11 = sub_10000B88C((uint64_t **)(a1 + 160), v37, (uint64_t)&std::piecewise_construct, (__int128 **)&v39);
    v13 = v35;
    v12 = (uint64_t *)v36;
    if (v36)
    {
      v14 = (unint64_t *)&v36->__shared_owners_;
      do
        v15 = __ldxr(v14);
      while (__stxr(v15 + 1, v14));
    }
    v16 = (std::__shared_weak_count *)v11[8];
    v11[7] = (uint64_t *)v13;
    v11[8] = v12;
    if (v16)
    {
      v17 = (unint64_t *)&v16->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
  }
  v19 = v36;
  if (v36)
  {
    v20 = (unint64_t *)&v36->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  if (object)
    dispatch_release(object);
  v22 = v30;
  if (v30)
  {
    v23 = (unint64_t *)&v30->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  if (v34)
    std::__shared_weak_count::__release_weak(v34);
  v25 = v32;
  if (!v32)
    goto LABEL_38;
  v26 = (unint64_t *)&v32->__shared_owners_;
  do
    v27 = __ldaxr(v26);
  while (__stlxr(v27 - 1, v26));
  if (v27)
  {
LABEL_38:
    if ((v38 & 0x80000000) == 0)
      return;
LABEL_41:
    operator delete((void *)v37[0]);
    return;
  }
  ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
  std::__shared_weak_count::__release_weak(v25);
  if (v38 < 0)
    goto LABEL_41;
}

void sub_10001189C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, dispatch_object_t object, char a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, char a16)
{
  uint64_t v16;
  std::__shared_weak_count *v18;

  if (object)
  {
    dispatch_release(object);
    sub_1000015D4((uint64_t)&a10);
    v18 = a15;
    if (!a15)
    {
LABEL_3:
      sub_1000015D4((uint64_t)&a12);
      if ((*(char *)(v16 - 33) & 0x80000000) == 0)
        goto LABEL_4;
      goto LABEL_7;
    }
  }
  else
  {
    sub_1000015D4((uint64_t)&a10);
    v18 = a15;
    if (!a15)
      goto LABEL_3;
  }
  std::__shared_weak_count::__release_weak(v18);
  sub_1000015D4((uint64_t)&a12);
  if ((*(char *)(v16 - 33) & 0x80000000) == 0)
LABEL_4:
    _Unwind_Resume(a1);
LABEL_7:
  operator delete(*(void **)(v16 - 56));
  _Unwind_Resume(a1);
}

uint64_t ABMCommand::create@<X0>(char *a1@<X0>, uint64_t *a2@<X1>, void (__cdecl **a3)(std::__shared_weak_count *__hidden this)@<X2>, NSObject **a4@<X3>, std::__shared_weak_count_vtbl **a5@<X8>)
{
  std::__shared_weak_count_vtbl *v10;
  std::__shared_weak_count *v11;
  uint64_t v12;
  unint64_t *p_shared_weak_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  void (__cdecl *v16)(std::__shared_weak_count *__hidden);
  unint64_t *p_shared_owners;
  unint64_t v18;
  NSObject *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  std::__shared_weak_count *on_zero_shared;
  unint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t *v40;
  unint64_t v41;
  std::__shared_weak_count *v43;
  uint64_t v44;
  std::__shared_weak_count *v45;

  *a5 = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  a5[1] = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  v10 = (std::__shared_weak_count_vtbl *)operator new(0xE8uLL);
  v12 = *a2;
  v11 = (std::__shared_weak_count *)a2[1];
  if (v11)
  {
    p_shared_weak_owners = (unint64_t *)&v11->__shared_weak_owners_;
    do
      v14 = __ldxr(p_shared_weak_owners);
    while (__stxr(v14 + 1, p_shared_weak_owners));
  }
  v16 = *a3;
  v15 = (std::__shared_weak_count *)a3[1];
  v43 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v18 = __ldxr(p_shared_owners);
    while (__stxr(v18 + 1, p_shared_owners));
  }
  v19 = *a4;
  if (v19)
    dispatch_retain(v19);
  if (v11)
  {
    v20 = (unint64_t *)&v11->__shared_weak_owners_;
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }
  if (v15)
  {
    v22 = (unint64_t *)&v15->__shared_owners_;
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }
  if (v19)
    dispatch_retain(v19);
  v44 = v12;
  v45 = v11;
  if (v11)
  {
    v24 = (unint64_t *)&v11->__shared_weak_owners_;
    do
      v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }
  CommandBase::CommandBase((uint64_t)v10, a1, &v44);
  if (v45)
    std::__shared_weak_count::__release_weak(v45);
  v10->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))off_10001C730;
  v10[5].~__shared_weak_count_0 = v16;
  v10[5].__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v15;
  if (v15)
  {
    v26 = (unint64_t *)&v15->__shared_owners_;
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
  }
  v10[5].__get_deleter = (const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *))v19;
  if (v19)
  {
    dispatch_retain(v19);
    dispatch_release(v19);
  }
  if (v15)
  {
    v28 = (unint64_t *)&v15->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  if (v11)
    std::__shared_weak_count::__release_weak(v11);
  v10->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))off_10001C8E0;
  *a5 = v10;
  v30 = (std::__shared_weak_count *)operator new(0x20uLL);
  v30->__shared_owners_ = 0;
  v31 = (unint64_t *)&v30->__shared_owners_;
  v30->__vftable = (std::__shared_weak_count_vtbl *)&off_10001C948;
  v30->__shared_weak_owners_ = 0;
  v30[1].__vftable = v10;
  a5[1] = (std::__shared_weak_count_vtbl *)v30;
  on_zero_shared = (std::__shared_weak_count *)v10->__on_zero_shared;
  if (on_zero_shared)
  {
    if (on_zero_shared->__shared_owners_ != -1)
      goto LABEL_47;
    do
      v33 = __ldxr(v31);
    while (__stxr(v33 + 1, v31));
    v34 = (unint64_t *)&v30->__shared_weak_owners_;
    do
      v35 = __ldxr(v34);
    while (__stxr(v35 + 1, v34));
    v10->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v10;
    v10->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v30;
    std::__shared_weak_count::__release_weak(on_zero_shared);
  }
  else
  {
    do
      v36 = __ldxr(v31);
    while (__stxr(v36 + 1, v31));
    v37 = (unint64_t *)&v30->__shared_weak_owners_;
    do
      v38 = __ldxr(v37);
    while (__stxr(v38 + 1, v37));
    v10->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v10;
    v10->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v30;
  }
  do
    v39 = __ldaxr(v31);
  while (__stlxr(v39 - 1, v31));
  if (!v39)
  {
    ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
    std::__shared_weak_count::__release_weak(v30);
  }
LABEL_47:
  if (v19)
    dispatch_release(v19);
  if (v43)
  {
    v40 = (unint64_t *)&v43->__shared_owners_;
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }
  if (v11)
    std::__shared_weak_count::__release_weak(v11);
  return (*((uint64_t (**)(std::__shared_weak_count_vtbl *))(*a5)->~__shared_weak_count + 2))(*a5);
}

void sub_100011BF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1000015D4(v1);
  _Unwind_Resume(a1);
}

void sub_100011C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  std::__shared_weak_count *v14;
  _QWORD *v15;
  NSObject *v16;

  sub_100011D30(v15);
  if (v16)
  {
    dispatch_release(v16);
    sub_1000015D4((uint64_t)&a9);
    if (!v14)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else
  {
    sub_1000015D4((uint64_t)&a9);
    if (!v14)
      goto LABEL_6;
  }
  std::__shared_weak_count::__release_weak(v14);
  goto LABEL_6;
}

uint64_t sub_100011CAC(_QWORD *a1)
{
  NSObject *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  *a1 = off_10001C730;
  v2 = a1[28];
  if (v2)
    dispatch_release(v2);
  v3 = (std::__shared_weak_count *)a1[27];
  if (!v3)
    return sub_10000BEAC((uint64_t)a1);
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  do
    v5 = __ldaxr(p_shared_owners);
  while (__stlxr(v5 - 1, p_shared_owners));
  if (v5)
    return sub_10000BEAC((uint64_t)a1);
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return sub_10000BEAC((uint64_t)a1);
}

void sub_100011D30(_QWORD *a1)
{
  NSObject *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  void *v6;

  *a1 = off_10001C730;
  v2 = a1[28];
  if (v2)
    dispatch_release(v2);
  v3 = (std::__shared_weak_count *)a1[27];
  if (!v3)
    goto LABEL_7;
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  do
    v5 = __ldaxr(p_shared_owners);
  while (__stlxr(v5 - 1, p_shared_owners));
  if (!v5)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    v6 = (void *)sub_10000BEAC((uint64_t)a1);
  }
  else
  {
LABEL_7:
    v6 = (void *)sub_10000BEAC((uint64_t)a1);
  }
  operator delete(v6);
}

void sub_100011DC0(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_100011DD4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t sub_100011DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000010001B61FLL)
    return a1 + 24;
  if (((v3 & 0x800000010001B61FLL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000010001B61FLL))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000010001B61FLL & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

uint64_t sub_100011E6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  _WORD *v4;
  size_t v6;
  _QWORD *v7;
  const std::locale::facet *v8;
  uint64_t v9;
  std::locale v10;

  v2 = *(unsigned __int8 *)(a2 + 23);
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = *(_QWORD *)(a2 + 8);
  if (v2 == 2)
  {
    v4 = v3 >= 0 ? (_WORD *)a2 : *(_WORD **)a2;
    if (*v4 == 25186)
      return 1;
  }
  if ((byte_1000202F0 & 1) != 0)
    return 1;
  v6 = strlen(kServerDownErrorPrint);
  v7 = sub_100001760(&std::cerr, (uint64_t)kServerDownErrorPrint, v6);
  std::ios_base::getloc((const std::ios_base *)((char *)v7 + *(_QWORD *)(*v7 - 24)));
  v8 = std::locale::use_facet(&v10, &std::ctype<char>::id);
  v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
  std::locale::~locale(&v10);
  std::ostream::put(v7, v9);
  std::ostream::flush(v7);
  return 0;
}

void sub_100011F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

_QWORD *sub_100011F7C(_QWORD *a1)
{
  const std::locale::facet *v2;
  uint64_t v3;
  std::locale v5;

  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
  v2 = std::locale::use_facet(&v5, &std::ctype<char>::id);
  v3 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10);
  std::locale::~locale(&v5);
  std::ostream::put(a1, v3);
  std::ostream::flush(a1);
  return a1;
}

void sub_100011FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

void sub_10001200C(uint64_t a1, std::__shared_weak_count *a2, _DWORD *a3)
{
  __int128 v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  const void *v7;
  size_t v8;
  void *v9;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  size_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  _QWORD *v22;
  const std::locale::facet *v23;
  uint64_t v24;
  char v25;
  char v26;
  char v27;
  char v28;
  char v29;
  char v30;
  _QWORD *v31;
  void **v32;
  uint64_t v33;
  _QWORD *v34;
  const std::locale::facet *v35;
  uint64_t v36;
  std::string v37;
  void *__p[2];
  unint64_t v39;
  void *__dst[2];
  unint64_t v41;
  uint64_t v42;
  std::__shared_weak_count *v43;
  void *v44[2];
  __int128 v45;
  void **v46;
  uint64_t v47;
  uint64_t v48;

  v46 = 0;
  v47 = 0;
  v48 = 0;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)v44 = v4;
  v45 = v4;
  v42 = a1;
  v43 = a2;
  if (a2)
  {
    p_shared_owners = (unint64_t *)&a2->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  v7 = (const void *)abm::kTraceCompression;
  v8 = strlen(abm::kTraceCompression);
  if (v8 > 0x7FFFFFFFFFFFFFF7)
    sub_10000163C();
  v9 = (void *)v8;
  if (v8 >= 0x17)
  {
    v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17)
      v11 = v8 | 7;
    v12 = v11 + 1;
    v10 = (void **)operator new(v11 + 1);
    __dst[1] = v9;
    v41 = v12 | 0x8000000000000000;
    __dst[0] = v10;
    goto LABEL_11;
  }
  HIBYTE(v41) = v8;
  v10 = __dst;
  if (v8)
LABEL_11:
    memmove(v10, v7, (size_t)v9);
  *((_BYTE *)v9 + (_QWORD)v10) = 0;
  v13 = (const void *)abm::helper::kKeyMode;
  v14 = strlen(abm::helper::kKeyMode);
  if (v14 > 0x7FFFFFFFFFFFFFF7)
    sub_10000163C();
  v15 = (void *)v14;
  if (v14 >= 0x17)
  {
    v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v17 = v14 | 7;
    v18 = v17 + 1;
    v16 = operator new(v17 + 1);
    __p[1] = v15;
    v39 = v18 | 0x8000000000000000;
    __p[0] = v16;
    goto LABEL_19;
  }
  HIBYTE(v39) = v14;
  v16 = __p;
  if (v14)
LABEL_19:
    memmove(v16, v13, (size_t)v15);
  *((_BYTE *)v15 + (_QWORD)v16) = 0;
  TraceCommand::GetTraceProperty(&v42, (const char *)__dst, (const char *)__p, (uint64_t)&v46, 0, (uint64_t)v44);
  if (SHIBYTE(v39) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v41) & 0x80000000) == 0)
    {
LABEL_22:
      v19 = v43;
      if (!v43)
        goto LABEL_29;
      goto LABEL_26;
    }
  }
  else if ((SHIBYTE(v41) & 0x80000000) == 0)
  {
    goto LABEL_22;
  }
  operator delete(__dst[0]);
  v19 = v43;
  if (!v43)
    goto LABEL_29;
LABEL_26:
  v20 = (unint64_t *)&v19->__shared_owners_;
  do
    v21 = __ldaxr(v20);
  while (__stlxr(v21 - 1, v20));
  if (!v21)
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
    if (LODWORD(v44[0]))
      goto LABEL_30;
    goto LABEL_33;
  }
LABEL_29:
  if (LODWORD(v44[0]))
  {
LABEL_30:
    v22 = sub_100001760(&std::cout, (uint64_t)"Unable to get compression mode", 30);
    std::ios_base::getloc((const std::ios_base *)((char *)v22 + *(_QWORD *)(*v22 - 24)));
    v23 = std::locale::use_facet((const std::locale *)&v37, &std::ctype<char>::id);
    v24 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v23->__vftable[2].~facet_0)(v23, 10);
    std::locale::~locale((std::locale *)&v37);
    std::ostream::put(v22, v24);
LABEL_31:
    std::ostream::flush(v22);
    goto LABEL_41;
  }
LABEL_33:
  std::to_string(&v37, 0);
  v25 = util::equal_nocase(&v46, &v37);
  v26 = v25;
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v37.__r_.__value_.__l.__data_);
    if ((v26 & 1) != 0)
    {
LABEL_35:
      *a3 = 0;
      if ((SHIBYTE(v45) & 0x80000000) == 0)
        goto LABEL_42;
      goto LABEL_48;
    }
  }
  else if ((v25 & 1) != 0)
  {
    goto LABEL_35;
  }
  std::to_string(&v37, 1);
  v27 = util::equal_nocase(&v46, &v37);
  v28 = v27;
  if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v37.__r_.__value_.__l.__data_);
    if ((v28 & 1) != 0)
      goto LABEL_40;
  }
  else if ((v27 & 1) != 0)
  {
LABEL_40:
    *a3 = 1;
LABEL_41:
    if ((SHIBYTE(v45) & 0x80000000) == 0)
      goto LABEL_42;
    goto LABEL_48;
  }
  std::to_string(&v37, 2);
  v29 = util::equal_nocase(&v46, &v37);
  v30 = v29;
  if ((SHIBYTE(v37.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((v29 & 1) != 0)
      goto LABEL_47;
LABEL_51:
    v31 = sub_100001760(&std::cout, (uint64_t)"Invalid trace mode ", 19);
    if (v48 >= 0)
      v32 = (void **)&v46;
    else
      v32 = v46;
    if (v48 >= 0)
      v33 = HIBYTE(v48);
    else
      v33 = v47;
    v34 = sub_100001760(v31, (uint64_t)v32, v33);
    v22 = sub_100001760(v34, (uint64_t)" received", 9);
    std::ios_base::getloc((const std::ios_base *)((char *)v22 + *(_QWORD *)(*v22 - 24)));
    v35 = std::locale::use_facet((const std::locale *)&v37, &std::ctype<char>::id);
    v36 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v35->__vftable[2].~facet_0)(v35, 10);
    std::locale::~locale((std::locale *)&v37);
    std::ostream::put(v22, v36);
    goto LABEL_31;
  }
  operator delete(v37.__r_.__value_.__l.__data_);
  if ((v30 & 1) == 0)
    goto LABEL_51;
LABEL_47:
  *a3 = 2;
  if ((SHIBYTE(v45) & 0x80000000) == 0)
  {
LABEL_42:
    if ((SHIBYTE(v48) & 0x80000000) == 0)
      return;
LABEL_49:
    operator delete(v46);
    return;
  }
LABEL_48:
  operator delete(v44[1]);
  if (SHIBYTE(v48) < 0)
    goto LABEL_49;
}

void sub_100012434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28,uint64_t a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  uint64_t v36;

  std::locale::~locale(&a10);
  if (a36 < 0)
  {
    operator delete(__p);
    if (*(char *)(v36 - 49) < 0)
    {
LABEL_6:
      operator delete(*(void **)(v36 - 72));
      _Unwind_Resume(a1);
    }
  }
  else if (*(char *)(v36 - 49) < 0)
  {
    goto LABEL_6;
  }
  _Unwind_Resume(a1);
}

_QWORD *sub_100012510(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_10000163C();
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

void sub_1000125C0(uint64_t a1, std::__shared_weak_count *a2, BOOL *a3)
{
  __int128 v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  const void *v7;
  size_t v8;
  void *v9;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  size_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  _QWORD *v22;
  const std::locale::facet *v23;
  uint64_t v24;
  void *__p[2];
  unint64_t v26;
  void *__dst[2];
  unint64_t v28;
  uint64_t v29;
  std::__shared_weak_count *v30;
  void *v31[2];
  __int128 v32;
  std::string v33;
  std::locale v34;

  memset(&v33, 0, sizeof(v33));
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)v31 = v4;
  v32 = v4;
  v29 = a1;
  v30 = a2;
  if (a2)
  {
    p_shared_owners = (unint64_t *)&a2->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  v7 = (const void *)abm::kTraceCompression;
  v8 = strlen(abm::kTraceCompression);
  if (v8 > 0x7FFFFFFFFFFFFFF7)
    sub_10000163C();
  v9 = (void *)v8;
  if (v8 >= 0x17)
  {
    v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17)
      v11 = v8 | 7;
    v12 = v11 + 1;
    v10 = (void **)operator new(v11 + 1);
    __dst[1] = v9;
    v28 = v12 | 0x8000000000000000;
    __dst[0] = v10;
    goto LABEL_11;
  }
  HIBYTE(v28) = v8;
  v10 = __dst;
  if (v8)
LABEL_11:
    memmove(v10, v7, (size_t)v9);
  *((_BYTE *)v9 + (_QWORD)v10) = 0;
  v13 = (const void *)abm::helper::kKeySplitArchive;
  v14 = strlen(abm::helper::kKeySplitArchive);
  if (v14 > 0x7FFFFFFFFFFFFFF7)
    sub_10000163C();
  v15 = (void *)v14;
  if (v14 >= 0x17)
  {
    v17 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v17 = v14 | 7;
    v18 = v17 + 1;
    v16 = operator new(v17 + 1);
    __p[1] = v15;
    v26 = v18 | 0x8000000000000000;
    __p[0] = v16;
    goto LABEL_19;
  }
  HIBYTE(v26) = v14;
  v16 = __p;
  if (v14)
LABEL_19:
    memmove(v16, v13, (size_t)v15);
  *((_BYTE *)v15 + (_QWORD)v16) = 0;
  TraceCommand::GetTraceProperty(&v29, (const char *)__dst, (const char *)__p, (uint64_t)&v33, 0, (uint64_t)v31);
  if (SHIBYTE(v26) < 0)
  {
    operator delete(__p[0]);
    if ((SHIBYTE(v28) & 0x80000000) == 0)
    {
LABEL_22:
      v19 = v30;
      if (!v30)
        goto LABEL_29;
      goto LABEL_26;
    }
  }
  else if ((SHIBYTE(v28) & 0x80000000) == 0)
  {
    goto LABEL_22;
  }
  operator delete(__dst[0]);
  v19 = v30;
  if (!v30)
    goto LABEL_29;
LABEL_26:
  v20 = (unint64_t *)&v19->__shared_owners_;
  do
    v21 = __ldaxr(v20);
  while (__stlxr(v21 - 1, v20));
  if (!v21)
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
    if (LODWORD(v31[0]))
      goto LABEL_33;
    goto LABEL_30;
  }
LABEL_29:
  if (LODWORD(v31[0]))
  {
LABEL_33:
    v22 = sub_100001760(&std::cout, (uint64_t)"Unable to get 'Split Archive' property", 38);
    std::ios_base::getloc((const std::ios_base *)((char *)v22 + *(_QWORD *)(*v22 - 24)));
    v23 = std::locale::use_facet(&v34, &std::ctype<char>::id);
    v24 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v23->__vftable[2].~facet_0)(v23, 10);
    std::locale::~locale(&v34);
    std::ostream::put(v22, v24);
    std::ostream::flush(v22);
    goto LABEL_34;
  }
LABEL_30:
  if ((sub_100012928(&v33, a3) & 1) == 0)
    goto LABEL_33;
LABEL_34:
  if ((SHIBYTE(v32) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v33.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return;
LABEL_38:
    operator delete(v33.__r_.__value_.__l.__data_);
    return;
  }
  operator delete(v31[1]);
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_38;
}

void sub_100012894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  uint64_t v29;

  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  sub_1000015D4((uint64_t)&a21);
  if ((*(char *)(v29 - 57) & 0x80000000) == 0)
    _Unwind_Resume(a1);
  operator delete(*(void **)(v29 - 80));
  _Unwind_Resume(a1);
}

uint64_t sub_100012928(const std::string *a1, BOOL *a2)
{
  const char *v4;
  unint64_t v5;
  uint64_t v6;
  std::string::size_type size;
  size_t __idx;

  if (SHIBYTE(a1->__r_.__value_.__r.__words[2]) < 0)
  {
    v4 = (const char *)a1->__r_.__value_.__r.__words[0];
    if (strcasecmp(a1->__r_.__value_.__l.__data_, "false") && strcasecmp(v4, "off") && strcasecmp(v4, "no"))
    {
      if (!strcasecmp(v4, "true")
        || !strcasecmp(v4, "on")
        || !strcasecmp(v4, "yes")
        || !strcasecmp(v4, "full")
        || !strcasecmp(v4, "streaming")
        || !strcasecmp(v4, "lite"))
      {
        goto LABEL_28;
      }
      goto LABEL_21;
    }
LABEL_27:
    v5 = 0;
LABEL_29:
    *a2 = v5 != 0;
    return 1;
  }
  if (!strcasecmp((const char *)a1, "false")
    || !strcasecmp((const char *)a1, "off")
    || !strcasecmp((const char *)a1, "no"))
  {
    goto LABEL_27;
  }
  if (!strcasecmp((const char *)a1, "true"))
    goto LABEL_28;
  if (!strcasecmp((const char *)a1, "on"))
    goto LABEL_28;
  if (!strcasecmp((const char *)a1, "yes"))
    goto LABEL_28;
  if (!strcasecmp((const char *)a1, "full"))
    goto LABEL_28;
  if (!strcasecmp((const char *)a1, "streaming"))
    goto LABEL_28;
  v4 = (const char *)a1;
  if (!strcasecmp((const char *)a1, "lite"))
    goto LABEL_28;
LABEL_21:
  if (!strcasecmp(v4, "background"))
  {
LABEL_28:
    v5 = 1;
    goto LABEL_29;
  }
  __idx = 0xAAAAAAAAAAAAAAAALL;
  v5 = std::stol(a1, &__idx, 0);
  v6 = 0;
  size = HIBYTE(a1->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0)
    size = a1->__r_.__value_.__l.__size_;
  if (__idx == size && v5 < 2)
    goto LABEL_29;
  return v6;
}

uint64_t sub_100012B50(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  return 0;
}

void sub_100012B74(uint64_t a1)
{
  const void *v2;
  const void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  void *v9[2];
  char v10;
  void *v11;
  __int128 v12;
  _QWORD v13[5];
  void *v14;
  void *v15[2];
  char v16;
  void *__p;
  __int128 v18;
  _QWORD v19[5];
  void *v20;
  void *v21[2];
  char v22;
  char *v23;
  __int128 v24;
  _QWORD aBlock[5];
  void *v26;
  void *v27;
  char v28;

  v28 = 3;
  LODWORD(v27) = 7103860;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_100013020;
  aBlock[3] = &unk_10001CA08;
  aBlock[4] = a1;
  v26 = _Block_copy(aBlock);
  v23 = (char *)operator new(0x70uLL);
  v24 = xmmword_10001B680;
  strcpy(v23, "[nocompress|tar.gz|tar] [no-split-archive|split-archive] [nonui] [clear] [REASON] collect telephony logs");
  CommandBase::addCommandHandler(a1, (uint64_t)&v27, (const void **)&v26, (uint64_t)&v23);
  if (SHIBYTE(v24) < 0)
  {
    operator delete(v23);
    v2 = v26;
    if (!v26)
      goto LABEL_6;
    goto LABEL_5;
  }
  v2 = v26;
  if (v26)
LABEL_5:
    _Block_release(v2);
LABEL_6:
  if (v28 < 0)
    operator delete(v27);
  v22 = 4;
  strcpy((char *)v21, "core");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100014FEC;
  v19[3] = &unk_10001CA08;
  v19[4] = a1;
  v20 = _Block_copy(v19);
  __p = operator new(0x70uLL);
  v18 = xmmword_10001B690;
  strcpy((char *)__p, "[nocompress|tar.gz|tar] [no-split-archive|split-archive] [nonui] [REASON] collect telephony logs with coredump");
  CommandBase::addCommandHandler(a1, (uint64_t)v21, (const void **)&v20, (uint64_t)&__p);
  if (SHIBYTE(v18) < 0)
  {
    operator delete(__p);
    v3 = v20;
    if (!v20)
      goto LABEL_13;
    goto LABEL_12;
  }
  v3 = v20;
  if (v20)
LABEL_12:
    _Block_release(v3);
LABEL_13:
  if (v22 < 0)
    operator delete(v21[0]);
  v16 = 2;
  strcpy((char *)v15, "bb");
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100015EB0;
  v13[3] = &unk_10001CA08;
  v13[4] = a1;
  v14 = _Block_copy(v13);
  v11 = operator new(0x60uLL);
  v12 = xmmword_10001B6A0;
  strcpy((char *)v11, "[nocompress|tar.gz|tar] [no-split-archive|split-archive] [REASON] collect baseband logs only");
  CommandBase::addCommandHandler(a1, (uint64_t)v15, (const void **)&v14, (uint64_t)&v11);
  if (SHIBYTE(v12) < 0)
  {
    operator delete(v11);
    v4 = v14;
    if (!v14)
      goto LABEL_20;
    goto LABEL_19;
  }
  v4 = v14;
  if (v14)
LABEL_19:
    _Block_release(v4);
LABEL_20:
  if (v16 < 0)
    operator delete(v15[0]);
  v10 = 5;
  strcpy((char *)v9, "oslog");
  v8 = _Block_copy(&stru_10001CA78);
  v6 = operator new(0x78uLL);
  v7 = xmmword_10001B6B0;
  strcpy((char *)v6, "[history size] [output txt file path] -p <process1 process2..> -i <imagePath1 imagePath2..> collect oslog to txt");
  CommandBase::addCommandHandler(a1, (uint64_t)v9, (const void **)&v8, (uint64_t)&v6);
  if (SHIBYTE(v7) < 0)
  {
    operator delete(v6);
    v5 = v8;
    if (!v8)
      goto LABEL_27;
    goto LABEL_26;
  }
  v5 = v8;
  if (v8)
LABEL_26:
    _Block_release(v5);
LABEL_27:
  if (v10 < 0)
    operator delete(v9[0]);
}

void sub_100012F04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *aBlock, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,char a35,uint64_t a36,int a37,__int16 a38,char a39,char a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46)
{
  if (a15 < 0)
    operator delete(__p);
  if (aBlock)
    _Block_release(aBlock);
  if (a22 < 0)
    operator delete(a17);
  _Unwind_Resume(exception_object);
}

uint64_t sub_100013020(defaults::compression *a1, NSObject **a2, uint64_t a3)
{
  uint64_t v5;
  defaults::compression *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;
  xpc_object_t v11;
  xpc_object_t v12;
  uint64_t *v13;
  xpc_object_t v14;
  xpc_object_t v15;
  const char *v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  xpc_object_t v24;
  xpc_object_t v25;
  xpc_object_t v26;
  NSObject *v27;
  std::__shared_weak_count *v28;
  unint64_t *p_shared_owners;
  unint64_t v30;
  const void *v31;
  size_t v32;
  void *v33;
  void **v34;
  uint64_t v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  _QWORD v41[5];
  dispatch_group_t group;
  int v43;
  char v44;
  BOOL v45;
  void *__dst[2];
  unint64_t v47;
  uint64_t v48;
  std::__shared_weak_count *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  void *v53[2];
  uint64_t v54;
  __int16 v55;
  BOOL v56;
  int v57;

  v5 = *((_QWORD *)a1 + 4);
  v57 = defaults::compression::mode(a1);
  sub_10001200C(*(_QWORD *)(v5 + 208), *(std::__shared_weak_count **)(v5 + 216), &v57);
  v56 = defaults::compression::splitArchive(v6);
  sub_1000125C0(*(_QWORD *)(v5 + 208), *(std::__shared_weak_count **)(v5 + 216), &v56);
  v55 = 0;
  v53[0] = 0;
  v53[1] = 0;
  v54 = 0;
  sub_100007B3C(&v50, a3);
  sub_10001367C(&v50, &v57, &v56, (_BYTE *)&v55 + 1, &v55, v53);
  if (v52)
  {
    v7 = v50;
    v8 = v51;
    v9 = *v51;
    *(_QWORD *)(v9 + 8) = *(_QWORD *)(v50 + 8);
    **(_QWORD **)(v7 + 8) = v9;
    v52 = 0;
    if (v8 != &v50)
    {
      do
      {
        v13 = (uint64_t *)v8[1];
        if (*((char *)v8 + 39) < 0)
          operator delete((void *)v8[2]);
        operator delete(v8);
        v8 = v13;
      }
      while (v13 != &v50);
    }
  }
  if (sub_100013BA4(v5))
    v10 = 0;
  else
    v10 = v57;
  v57 = v10;
  if (!v10)
    v56 = 0;
  v11 = xpc_dictionary_create(0, 0, 0);
  if (v11 || (v11 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v11) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v11);
      v12 = v11;
    }
    else
    {
      v12 = xpc_null_create();
    }
  }
  else
  {
    v12 = xpc_null_create();
    v11 = 0;
  }
  xpc_release(v11);
  v14 = xpc_string_create(abm::kCollectTelephonyLogs);
  if (!v14)
    v14 = xpc_null_create();
  xpc_dictionary_set_value(v12, abm::kKeyTraceAction, v14);
  v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  if (v54 >= 0)
    v16 = (const char *)v53;
  else
    v16 = (const char *)v53[0];
  v17 = xpc_string_create(v16);
  if (!v17)
    v17 = xpc_null_create();
  xpc_dictionary_set_value(v12, abm::kKeyTraceDumpStateReason, v17);
  v18 = xpc_null_create();
  xpc_release(v17);
  xpc_release(v18);
  v19 = xpc_int64_create(v10);
  if (!v19)
    v19 = xpc_null_create();
  xpc_dictionary_set_value(v12, abm::kKeyTraceDumpStatePerformCompression, v19);
  v20 = xpc_null_create();
  xpc_release(v19);
  xpc_release(v20);
  v21 = xpc_BOOL_create(v56);
  if (!v21)
    v21 = xpc_null_create();
  xpc_dictionary_set_value(v12, abm::kKeyTraceDumpStateSplitArchive, v21);
  v22 = xpc_null_create();
  xpc_release(v21);
  xpc_release(v22);
  if (HIBYTE(v55))
  {
    v23 = xpc_BOOL_create(0);
    if (!v23)
      v23 = xpc_null_create();
    xpc_dictionary_set_value(v12, abm::kKeyTraceUserConfirmation, v23);
    v24 = xpc_null_create();
    xpc_release(v23);
    xpc_release(v24);
  }
  if ((_BYTE)v55)
  {
    v25 = xpc_BOOL_create(1);
    if (!v25)
      v25 = xpc_null_create();
    xpc_dictionary_set_value(v12, abm::kKeyTraceClear, v25);
    v26 = xpc_null_create();
    xpc_release(v25);
    xpc_release(v26);
  }
  v27 = *a2;
  if (v27)
  {
    dispatch_retain(v27);
    dispatch_group_enter(v27);
  }
  v48 = *(_QWORD *)(v5 + 208);
  v28 = *(std::__shared_weak_count **)(v5 + 216);
  v49 = v28;
  if (v28)
  {
    p_shared_owners = (unint64_t *)&v28->__shared_owners_;
    do
      v30 = __ldxr(p_shared_owners);
    while (__stxr(v30 + 1, p_shared_owners));
  }
  v31 = (const void *)abm::kCommandTraceDumpState;
  v32 = strlen(abm::kCommandTraceDumpState);
  if (v32 >= 0x7FFFFFFFFFFFFFF8)
    sub_10000163C();
  v33 = (void *)v32;
  if (v32 >= 0x17)
  {
    v35 = (v32 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v32 | 7) != 0x17)
      v35 = v32 | 7;
    v36 = v35 + 1;
    v34 = (void **)operator new(v35 + 1);
    __dst[1] = v33;
    v47 = v36 | 0x8000000000000000;
    __dst[0] = v34;
    goto LABEL_48;
  }
  HIBYTE(v47) = v32;
  v34 = __dst;
  if (v32)
LABEL_48:
    memmove(v34, v31, (size_t)v33);
  *((_BYTE *)v33 + (_QWORD)v34) = 0;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3321888768;
  v41[2] = sub_100014208;
  v41[3] = &unk_10001C9D8;
  v41[4] = v5;
  group = v27;
  if (v27)
  {
    dispatch_retain(v27);
    dispatch_group_enter(v27);
  }
  v44 = v55;
  v45 = v56;
  v43 = v57;
  abm::client::PerformCommand(&v48, __dst, v41, v12);
  if (SHIBYTE(v47) < 0)
    operator delete(__dst[0]);
  v37 = v49;
  if (v49)
  {
    v38 = (unint64_t *)&v49->__shared_owners_;
    do
      v39 = __ldaxr(v38);
    while (__stlxr(v39 - 1, v38));
    if (!v39)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }
  if (group)
  {
    dispatch_group_leave(group);
    if (group)
      dispatch_release(group);
  }
  if (v27)
  {
    dispatch_group_leave(v27);
    dispatch_release(v27);
  }
  xpc_release(v12);
  if (SHIBYTE(v54) < 0)
    operator delete(v53[0]);
  return 1;
}

void sub_100013594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, dispatch_group_t group, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23,uint64_t a24,char a25)
{
  void *v25;
  NSObject *v26;
  uint64_t v27;

  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  if (a22 < 0)
    operator delete(__p);
  sub_1000015D4((uint64_t)&a23);
  if (v26)
  {
    dispatch_group_leave(v26);
    dispatch_release(v26);
  }
  xpc_release(v25);
  if (*(char *)(v27 - 73) < 0)
    operator delete(*(void **)(v27 - 96));
  _Unwind_Resume(a1);
}

void sub_10001367C(_QWORD *a1, _DWORD *a2, _BYTE *a3, _BYTE *a4, _BYTE *a5, void **__dst)
{
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  int v11;
  int v12;
  char v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  void *v26;
  int v27;
  unint64_t v28;
  size_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  void **v34;
  void **v35;
  int v36;
  size_t v37;
  void *__p[4];
  void *__dsta[4];

  sub_10000BB18(__dst, "[abmtool] User triggered", 0x18uLL);
  do
  {
    v8 = a1[2];
    if (!v8)
      break;
    memset(__dsta, 170, 24);
    v9 = (char *)*a1;
    if (*(char *)(*a1 + 39) < 0)
    {
      sub_1000016D4(__dsta, *((void **)v9 + 2), *((_QWORD *)v9 + 3));
      v9 = (char *)*a1;
      v8 = a1[2];
    }
    else
    {
      *(_OWORD *)__dsta = *((_OWORD *)v9 + 1);
      __dsta[2] = *((void **)v9 + 4);
    }
    v10 = *(_QWORD **)v9;
    v10[1] = *((_QWORD *)v9 + 1);
    **((_QWORD **)v9 + 1) = v10;
    a1[2] = v8 - 1;
    if (v9[39] < 0)
      operator delete(*((void **)v9 + 2));
    operator delete(v9);
    HIBYTE(__p[2]) = 10;
    strcpy((char *)__p, "nocompress");
    v11 = util::equal_nocase(__dsta, __p);
    v12 = v11;
    if (SHIBYTE(__p[2]) < 0)
    {
      operator delete(__p[0]);
      if (v12)
      {
LABEL_11:
        *a2 = 0;
        v13 = 1;
        if (SHIBYTE(__dsta[2]) < 0)
          goto LABEL_60;
        continue;
      }
    }
    else if (v11)
    {
      goto LABEL_11;
    }
    HIBYTE(__p[2]) = 6;
    strcpy((char *)__p, "tar.gz");
    v14 = util::equal_nocase(__dsta, __p);
    v15 = v14;
    if (SHIBYTE(__p[2]) < 0)
    {
      operator delete(__p[0]);
      if (v15)
      {
LABEL_16:
        v13 = 1;
        *a2 = 1;
        if (SHIBYTE(__dsta[2]) < 0)
          goto LABEL_60;
        continue;
      }
    }
    else if (v14)
    {
      goto LABEL_16;
    }
    HIBYTE(__p[2]) = 3;
    LODWORD(__p[0]) = 7496052;
    v16 = util::equal_nocase(__dsta, __p);
    v17 = v16;
    if (SHIBYTE(__p[2]) < 0)
    {
      operator delete(__p[0]);
      if (v17)
      {
LABEL_21:
        *a2 = 2;
        v13 = 1;
        if (SHIBYTE(__dsta[2]) < 0)
          goto LABEL_60;
        continue;
      }
    }
    else if (v16)
    {
      goto LABEL_21;
    }
    HIBYTE(__p[2]) = 5;
    strcpy((char *)__p, "nonui");
    v18 = util::equal_nocase(__dsta, __p);
    v19 = v18;
    if (SHIBYTE(__p[2]) < 0)
    {
      operator delete(__p[0]);
      if (v19)
      {
LABEL_26:
        v13 = 1;
        *a4 = 1;
        if (SHIBYTE(__dsta[2]) < 0)
          goto LABEL_60;
        continue;
      }
    }
    else if (v18)
    {
      goto LABEL_26;
    }
    HIBYTE(__p[2]) = 5;
    strcpy((char *)__p, "clear");
    v20 = util::equal_nocase(__dsta, __p);
    v21 = v20;
    if (SHIBYTE(__p[2]) < 0)
    {
      operator delete(__p[0]);
      if (v21)
      {
LABEL_31:
        v13 = 1;
        *a5 = 1;
        if (SHIBYTE(__dsta[2]) < 0)
          goto LABEL_60;
        continue;
      }
    }
    else if (v20)
    {
      goto LABEL_31;
    }
    HIBYTE(__p[2]) = 13;
    strcpy((char *)__p, "split-archive");
    v22 = util::equal_nocase(__dsta, __p);
    v23 = v22;
    if (SHIBYTE(__p[2]) < 0)
    {
      operator delete(__p[0]);
      if (v23)
      {
LABEL_36:
        v13 = 1;
        *a3 = 1;
        if (SHIBYTE(__dsta[2]) < 0)
          goto LABEL_60;
        continue;
      }
    }
    else if (v22)
    {
      goto LABEL_36;
    }
    HIBYTE(__p[2]) = 16;
    strcpy((char *)__p, "no-split-archive");
    v24 = util::equal_nocase(__dsta, __p);
    v25 = v24;
    if (SHIBYTE(__p[2]) < 0)
    {
      operator delete(__p[0]);
      if (!v25)
      {
LABEL_44:
        v26 = (void *)HIBYTE(__dsta[2]);
        v27 = SHIBYTE(__dsta[2]);
        if (SHIBYTE(__dsta[2]) < 0)
          v26 = __dsta[1];
        v37 = (size_t)v26;
        v28 = (unint64_t)v26 + 10;
        memset(__p, 170, 24);
        if ((unint64_t)v26 + 10 >= 0x7FFFFFFFFFFFFFF8)
          sub_10000163C();
        if (v28 >= 0x17)
        {
          v36 = SHIBYTE(__dsta[2]);
          v31 = (v28 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v28 | 7) != 0x17)
            v31 = v28 | 7;
          v32 = v31 + 1;
          v33 = (char *)operator new(v31 + 1);
          __p[1] = (void *)v28;
          __p[2] = (void *)(v32 | 0x8000000000000000);
          __p[0] = v33;
          *((_WORD *)v33 + 4) = 8285;
          *(_QWORD *)v33 = *(_QWORD *)"[abmtool] ";
          v30 = v33 + 10;
          v29 = v37;
          v27 = v36;
        }
        else
        {
          __p[1] = (void *)8285;
          __p[2] = 0;
          HIBYTE(__p[2]) = (_BYTE)v26 + 10;
          __p[0] = *(void **)"[abmtool] ";
          v29 = (size_t)v26;
          v30 = (char *)&__p[1] + 2;
          if (!v26)
            goto LABEL_57;
        }
        if (v27 >= 0)
          v34 = __dsta;
        else
          v34 = (void **)__dsta[0];
        memmove(v30, v34, v29);
LABEL_57:
        v30[v29] = 0;
        v35 = __dst;
        if (*((char *)__dst + 23) < 0)
        {
          operator delete(*__dst);
          v35 = __dst;
        }
        v13 = 0;
        *(_OWORD *)v35 = *(_OWORD *)__p;
        v35[2] = __p[2];
        if ((SHIBYTE(__dsta[2]) & 0x80000000) == 0)
          continue;
LABEL_60:
        operator delete(__dsta[0]);
        continue;
      }
    }
    else if (!v24)
    {
      goto LABEL_44;
    }
    *a3 = 0;
    v13 = 1;
    if (SHIBYTE(__dsta[2]) < 0)
      goto LABEL_60;
  }
  while ((v13 & 1) != 0);
  if (!*a2)
    *a3 = 0;
}

void sub_100013B3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if ((a29 & 0x80000000) == 0)
    _Unwind_Resume(exception_object);
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t sub_100013BA4(uint64_t a1)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  __int128 v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  const void *v12;
  size_t v13;
  std::string::size_type v14;
  std::string *p_dst;
  uint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t value;
  const char *v24;
  char v25;
  std::string *v26;
  uint64_t v27;
  int v28;
  std::string::size_type size;
  unsigned int v30;
  std::string __dst;
  uint64_t v33;
  std::__shared_weak_count *v34;
  void *__p[2];
  __int128 v36;
  xpc_object_t v37;
  size_t __idx;

  v2 = xpc_dictionary_create(0, 0, 0);
  if (v2 || (v2 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v2);
      v3 = v2;
    }
    else
    {
      v3 = xpc_null_create();
    }
  }
  else
  {
    v3 = xpc_null_create();
    v2 = 0;
  }
  xpc_release(v2);
  v4 = xpc_string_create(abm::kTraceSystemLogs);
  if (!v4)
    v4 = xpc_null_create();
  xpc_dictionary_set_value(v3, abm::kKeyTraceName, v4);
  v5 = xpc_null_create();
  xpc_release(v4);
  xpc_release(v5);
  v6 = xpc_string_create(abm::kKeyTraceMode);
  if (!v6)
    v6 = xpc_null_create();
  xpc_dictionary_set_value(v3, abm::kKeyTracePropertyName, v6);
  v7 = xpc_null_create();
  xpc_release(v6);
  xpc_release(v7);
  v37 = xpc_null_create();
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)__p = v8;
  v36 = v8;
  v9 = *(std::__shared_weak_count **)(a1 + 216);
  v33 = *(_QWORD *)(a1 + 208);
  v34 = v9;
  if (v9)
  {
    p_shared_owners = (unint64_t *)&v9->__shared_owners_;
    do
      v11 = __ldxr(p_shared_owners);
    while (__stxr(v11 + 1, p_shared_owners));
  }
  v12 = (const void *)abm::kCommandGetTraceProperty;
  v13 = strlen(abm::kCommandGetTraceProperty);
  if (v13 >= 0x7FFFFFFFFFFFFFF8)
    sub_10000163C();
  v14 = v13;
  if (v13 >= 0x17)
  {
    v16 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17)
      v16 = v13 | 7;
    v17 = v16 + 1;
    p_dst = (std::string *)operator new(v16 + 1);
    __dst.__r_.__value_.__l.__size_ = v14;
    __dst.__r_.__value_.__r.__words[2] = v17 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    goto LABEL_21;
  }
  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = v13;
  p_dst = &__dst;
  if (v13)
LABEL_21:
    memmove(p_dst, v12, v14);
  p_dst->__r_.__value_.__s.__data_[v14] = 0;
  abm::client::PerformCommand(&v33, &__dst, v3, &v37);
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__dst.__r_.__value_.__l.__data_);
    v18 = v34;
    if (!v34)
      goto LABEL_29;
  }
  else
  {
    v18 = v34;
    if (!v34)
      goto LABEL_29;
  }
  v19 = (unint64_t *)&v18->__shared_owners_;
  do
    v20 = __ldaxr(v19);
  while (__stlxr(v20 - 1, v19));
  if (v20)
  {
LABEL_29:
    v21 = v37;
    if (v37)
      goto LABEL_33;
    goto LABEL_30;
  }
  ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
  std::__shared_weak_count::__release_weak(v18);
  v21 = v37;
  if (v37)
  {
LABEL_33:
    if (xpc_get_type(v21) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v21);
      v22 = v21;
    }
    else
    {
      v22 = xpc_null_create();
    }
    goto LABEL_36;
  }
LABEL_30:
  v21 = xpc_null_create();
  if (v21)
    goto LABEL_33;
  v22 = xpc_null_create();
  v21 = 0;
LABEL_36:
  xpc_release(v21);
  memset(&__dst, 170, sizeof(__dst));
  value = xpc_dictionary_get_value(v22, abm::kKeyTracePropertyValue);
  __idx = (size_t)value;
  if (value)
    xpc_retain(value);
  else
    __idx = (size_t)xpc_null_create();
  xpc::dyn_cast_or_default(&__dst, (xpc *)&__idx, (const object *)&unk_10001ABDB, v24);
  xpc_release((xpc_object_t)__idx);
  v25 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
  if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (strcasecmp((const char *)&__dst, "false")
      && strcasecmp((const char *)&__dst, "off")
      && strcasecmp((const char *)&__dst, "no"))
    {
      if (strcasecmp((const char *)&__dst, "true")
        && strcasecmp((const char *)&__dst, "on")
        && strcasecmp((const char *)&__dst, "yes")
        && strcasecmp((const char *)&__dst, "full")
        && strcasecmp((const char *)&__dst, "streaming"))
      {
        v26 = &__dst;
        if (!strcasecmp((const char *)&__dst, "lite"))
          goto LABEL_76;
        goto LABEL_59;
      }
LABEL_67:
      v28 = 1;
      goto LABEL_68;
    }
LABEL_66:
    v28 = 0;
    goto LABEL_68;
  }
  v26 = (std::string *)__dst.__r_.__value_.__r.__words[0];
  if (!strcasecmp(__dst.__r_.__value_.__l.__data_, "false")
    || !strcasecmp((const char *)v26, "off")
    || !strcasecmp((const char *)v26, "no"))
  {
    goto LABEL_66;
  }
  if (!strcasecmp((const char *)v26, "true")
    || !strcasecmp((const char *)v26, "on")
    || !strcasecmp((const char *)v26, "yes")
    || !strcasecmp((const char *)v26, "full")
    || !strcasecmp((const char *)v26, "streaming"))
  {
    goto LABEL_67;
  }
  if (!strcasecmp((const char *)v26, "lite"))
  {
LABEL_76:
    v28 = 2;
    goto LABEL_68;
  }
LABEL_59:
  if (!strcasecmp((const char *)v26, "background"))
    goto LABEL_76;
  __idx = 0xAAAAAAAAAAAAAAAALL;
  v27 = std::stol(&__dst, &__idx, 0);
  v28 = -1431655766;
  size = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
  v25 = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = __dst.__r_.__value_.__l.__size_;
  if (__idx == size && v27 >= (uint64_t)0xFFFFFFFF80000000 && v27 <= 0x7FFFFFFF)
  {
    v28 = v27;
LABEL_68:
    v30 = 1;
    goto LABEL_69;
  }
  v30 = 0;
LABEL_69:
  if (v25 < 0)
    operator delete(__dst.__r_.__value_.__l.__data_);
  xpc_release(v22);
  if (SHIBYTE(v36) < 0)
    operator delete(__p[1]);
  xpc_release(v3);
  if (v28 == 2)
    return v30;
  else
    return 0;
}

void sub_100014104(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x10001409CLL);
}

void sub_10001411C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  void *v24;
  void *v25;

  if (a15 < 0)
    operator delete(__p);
  xpc_release(v25);
  if (a24 < 0)
    operator delete(a19);
  xpc_release(v24);
  _Unwind_Resume(a1);
}

void sub_100014208(uint64_t a1, _DWORD *a2, xpc_object_t a3)
{
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  _QWORD *v7;
  const std::locale::facet *v8;
  uint64_t v9;
  _QWORD *v12;
  const char *v13;
  uint64_t v14;
  _QWORD *v15;
  const std::locale::facet *v16;
  uint64_t v17;
  xpc_object_t v18;
  _QWORD *v19;
  const char *v20;
  xpc_object_t value;
  _QWORD *v22;
  xpc_object_t v23;
  int v24;
  std::string *v25;
  std::string::size_type size;
  _QWORD *v27;
  const std::locale::facet *v28;
  uint64_t v29;
  _QWORD *v30;
  xpc_object_t v31;
  int v32;
  std::string *v33;
  std::string::size_type v34;
  _QWORD *v35;
  const std::locale::facet *v36;
  uint64_t v37;
  int v38;
  std::string *v39;
  std::string::size_type v40;
  _QWORD *v41;
  const std::locale::facet *v42;
  uint64_t v43;
  char v44[24];
  void *v45[2];
  char v46;
  char v47[24];
  void *__p[2];
  char v49;
  char v50[24];
  xpc_object_t object;
  void *v52[2];
  char v53;
  std::string v54;
  std::locale v55;
  uint64_t v56;
  uint64_t v57;

  if (*(_BYTE *)(a1 + 52))
  {
    v4 = sub_100001760(&std::cout, (uint64_t)"Telephony log clear: ", 21);
    if (*a2)
      v5 = "Failed";
    else
      v5 = "Success";
    if (*a2)
      v6 = 6;
    else
      v6 = 7;
    v7 = sub_100001760(v4, (uint64_t)v5, v6);
    std::ios_base::getloc((const std::ios_base *)((char *)v7 + *(_QWORD *)(*v7 - 24)));
    v8 = std::locale::use_facet(&v55, &std::ctype<char>::id);
    v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v8->__vftable[2].~facet_0)(v8, 10);
    std::locale::~locale(&v55);
    std::ostream::put(v7, v9);
    std::ostream::flush(v7);
    return;
  }
  v12 = sub_100001760(&std::cout, (uint64_t)"Telephony log collection: ", 26);
  if (*a2)
    v13 = "Failed";
  else
    v13 = "Success";
  if (*a2)
    v14 = 6;
  else
    v14 = 7;
  v15 = sub_100001760(v12, (uint64_t)v13, v14);
  std::ios_base::getloc((const std::ios_base *)((char *)v15 + *(_QWORD *)(*v15 - 24)));
  v16 = std::locale::use_facet(&v55, &std::ctype<char>::id);
  v17 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v16->__vftable[2].~facet_0)(v16, 10);
  std::locale::~locale(&v55);
  std::ostream::put(v15, v17);
  std::ostream::flush(v15);
  if (!*a2)
  {
    if (a3)
    {
      xpc_retain(a3);
    }
    else
    {
      a3 = xpc_null_create();
      if (!a3)
      {
        v18 = xpc_null_create();
        a3 = 0;
LABEL_23:
        xpc_release(a3);
        if (xpc_get_type(v18) == (xpc_type_t)&_xpc_type_dictionary)
        {
          if (*(_BYTE *)(a1 + 53))
          {
            v19 = sub_100001760(&std::cout, (uint64_t)"Main archive path = ", 20);
            v20 = (const char *)abm::kKeyTimestampString;
            value = xpc_dictionary_get_value(v18, abm::kKeyTimestampString);
            object = value;
            if (value)
              xpc_retain(value);
            else
              object = xpc_null_create();
            v55.__locale_ = 0;
            v56 = 0;
            v57 = 0;
            xpc::dyn_cast_or_default(v52, &object, &v55);
            if (SHIBYTE(v57) < 0)
              operator delete(v55.__locale_);
            v24 = *(_DWORD *)(a1 + 48);
            v50[23] = 2;
            strcpy(v50, "-*");
            sub_100014968(&v54, (uint64_t)v52, v24, 0, (uint64_t)v50);
            if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v25 = &v54;
            else
              v25 = (std::string *)v54.__r_.__value_.__r.__words[0];
            if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              size = HIBYTE(v54.__r_.__value_.__r.__words[2]);
            else
              size = v54.__r_.__value_.__l.__size_;
            v27 = sub_100001760(v19, (uint64_t)v25, size);
            std::ios_base::getloc((const std::ios_base *)((char *)v27 + *(_QWORD *)(*v27 - 24)));
            v28 = std::locale::use_facet(&v55, &std::ctype<char>::id);
            v29 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v28->__vftable[2].~facet_0)(v28, 10);
            std::locale::~locale(&v55);
            std::ostream::put(v27, v29);
            std::ostream::flush(v27);
            if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v54.__r_.__value_.__l.__data_);
            if (v53 < 0)
              operator delete(v52[0]);
            xpc_release(object);
            v30 = sub_100001760(&std::cout, (uint64_t)"Lite archive path = ", 20);
            v31 = xpc_dictionary_get_value(v18, v20);
            object = v31;
            if (v31)
              xpc_retain(v31);
            else
              object = xpc_null_create();
            v55.__locale_ = 0;
            v56 = 0;
            v57 = 0;
            xpc::dyn_cast_or_default(__p, &object, &v55);
            if (SHIBYTE(v57) < 0)
              operator delete(v55.__locale_);
            v32 = *(_DWORD *)(a1 + 48);
            v47[23] = 2;
            strcpy(v47, "-*");
            sub_100014968(&v54, (uint64_t)__p, v32, 1, (uint64_t)v47);
            if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v33 = &v54;
            else
              v33 = (std::string *)v54.__r_.__value_.__r.__words[0];
            if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v34 = HIBYTE(v54.__r_.__value_.__r.__words[2]);
            else
              v34 = v54.__r_.__value_.__l.__size_;
            v35 = sub_100001760(v30, (uint64_t)v33, v34);
            std::ios_base::getloc((const std::ios_base *)((char *)v35 + *(_QWORD *)(*v35 - 24)));
            v36 = std::locale::use_facet(&v55, &std::ctype<char>::id);
            v37 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v36->__vftable[2].~facet_0)(v36, 10);
            std::locale::~locale(&v55);
            std::ostream::put(v35, v37);
            std::ostream::flush(v35);
            if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v54.__r_.__value_.__l.__data_);
            if (v49 < 0)
              operator delete(__p[0]);
            xpc_release(object);
          }
          else
          {
            v22 = sub_100001760(&std::cout, (uint64_t)"Path = ", 7);
            v23 = xpc_dictionary_get_value(v18, abm::kKeyTimestampString);
            object = v23;
            if (v23)
              xpc_retain(v23);
            else
              object = xpc_null_create();
            v55.__locale_ = 0;
            v56 = 0;
            v57 = 0;
            xpc::dyn_cast_or_default(v45, &object, &v55);
            if (SHIBYTE(v57) < 0)
              operator delete(v55.__locale_);
            v38 = *(_DWORD *)(a1 + 48);
            v44[23] = 2;
            strcpy(v44, "-*");
            sub_100014968(&v54, (uint64_t)v45, v38, 0, (uint64_t)v44);
            if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v39 = &v54;
            else
              v39 = (std::string *)v54.__r_.__value_.__r.__words[0];
            if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v40 = HIBYTE(v54.__r_.__value_.__r.__words[2]);
            else
              v40 = v54.__r_.__value_.__l.__size_;
            v41 = sub_100001760(v22, (uint64_t)v39, v40);
            std::ios_base::getloc((const std::ios_base *)((char *)v41 + *(_QWORD *)(*v41 - 24)));
            v42 = std::locale::use_facet(&v55, &std::ctype<char>::id);
            v43 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v42->__vftable[2].~facet_0)(v42, 10);
            std::locale::~locale(&v55);
            std::ostream::put(v41, v43);
            std::ostream::flush(v41);
            if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v54.__r_.__value_.__l.__data_);
            if (v46 < 0)
              operator delete(v45[0]);
            xpc_release(object);
          }
        }
        xpc_release(v18);
        return;
      }
    }
    if (xpc_get_type(a3) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(a3);
      v18 = a3;
    }
    else
    {
      v18 = xpc_null_create();
    }
    goto LABEL_23;
  }
}

void sub_1000147D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,xpc_object_t object)
{
  void *v31;

  if (a18 < 0)
    operator delete(__p);
  xpc_release(object);
  xpc_release(v31);
  _Unwind_Resume(a1);
}

void sub_100014940(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::locale::~locale((std::locale *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_100014954(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::locale::~locale((std::locale *)(v1 - 72));
  _Unwind_Resume(a1);
}

void sub_100014968(std::string *a1, uint64_t a2, int a3, int a4, uint64_t a5)
{
  size_t v9;
  std::string *v10;
  size_t v11;
  std::string::size_type v12;
  char v13;
  const void *v14;
  size_t v15;
  int v16;
  size_t size;
  std::string::size_type v18;
  size_t v19;
  char *p_dst;
  char *v21;
  std::string *p_p;
  const void *v23;
  size_t v24;
  std::string::size_type v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  const void *v29;
  size_t v30;
  size_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  const std::string::value_type *v35;
  std::string::size_type v36;
  std::string *v37;
  __int128 v38;
  int v39;
  const std::string::value_type *v40;
  std::string::size_type v41;
  std::string *v42;
  __int128 v43;
  std::string *v44;
  std::string::size_type v45;
  std::string *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  size_t v50;
  int64_t v51;
  std::string v52;
  std::string __dst;
  std::string __p;
  std::string v55;

  memset(&__p, 170, sizeof(__p));
  if (*(char *)(a5 + 23) < 0)
    sub_1000016D4(&__p, *(void **)a5, *(_QWORD *)(a5 + 8));
  else
    __p = *(std::string *)a5;
  if (a3 == 2)
  {
    *((_BYTE *)&__dst.__r_.__value_.__s + 23) = 1;
    LOWORD(__dst.__r_.__value_.__l.__data_) = 46;
    v11 = strlen(abm::trace::kLogTarExtension);
    v10 = std::string::append(&__dst, abm::trace::kLogTarExtension, v11);
  }
  else
  {
    if (a3 != 1)
      goto LABEL_11;
    *((_BYTE *)&__dst.__r_.__value_.__s + 23) = 1;
    LOWORD(__dst.__r_.__value_.__l.__data_) = 46;
    v9 = strlen(abm::trace::kLogTarGzExtension);
    v10 = std::string::append(&__dst, abm::trace::kLogTarGzExtension, v9);
  }
  v12 = v10->__r_.__value_.__r.__words[0];
  v55.__r_.__value_.__r.__words[0] = v10->__r_.__value_.__l.__size_;
  *(std::string::size_type *)((char *)v55.__r_.__value_.__r.__words + 7) = *(std::string::size_type *)((char *)&v10->__r_.__value_.__r.__words[1] + 7);
  v13 = HIBYTE(v10->__r_.__value_.__r.__words[2]);
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  v10->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  __p.__r_.__value_.__r.__words[0] = v12;
  __p.__r_.__value_.__l.__size_ = v55.__r_.__value_.__r.__words[0];
  *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 7) = *(std::string::size_type *)((char *)v55.__r_.__value_.__r.__words + 7);
  *((_BYTE *)&__p.__r_.__value_.__s + 23) = v13;
  if ((SHIBYTE(__dst.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_11:
    if (a4 != 1)
      goto LABEL_28;
    goto LABEL_12;
  }
  operator delete(__dst.__r_.__value_.__l.__data_);
  if (a4 != 1)
    goto LABEL_28;
LABEL_12:
  v14 = (const void *)abm::trace::kLiteDirectorySuffix;
  v15 = strlen(abm::trace::kLiteDirectorySuffix);
  v16 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    size = __p.__r_.__value_.__l.__size_;
  v18 = size + v15;
  memset(&__dst, 170, sizeof(__dst));
  if (size + v15 > 0x7FFFFFFFFFFFFFF7)
    sub_10000163C();
  v19 = v15;
  if (v18 > 0x16)
  {
    v47 = (v18 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v18 | 7) != 0x17)
      v47 = v18 | 7;
    v48 = v47 + 1;
    p_dst = (char *)operator new(v47 + 1);
    __dst.__r_.__value_.__l.__size_ = v18;
    __dst.__r_.__value_.__r.__words[2] = v48 | 0x8000000000000000;
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)p_dst;
    if (!v19)
      goto LABEL_19;
    goto LABEL_18;
  }
  memset(&__dst, 0, sizeof(__dst));
  p_dst = (char *)&__dst;
  *((_BYTE *)&__dst.__r_.__value_.__s + 23) = size + v15;
  if (v15)
LABEL_18:
    memcpy(p_dst, v14, v19);
LABEL_19:
  v21 = &p_dst[v19];
  if (size)
  {
    if (v16 >= 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    memmove(v21, p_p, size);
  }
  v21[size] = 0;
  if (v16 < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  __p = __dst;
LABEL_28:
  v23 = (const void *)abm::trace::kSnapshotFolder;
  v24 = strlen(abm::trace::kSnapshotFolder);
  if (v24 > 0x7FFFFFFFFFFFFFF7)
    sub_10000163C();
  v25 = v24;
  if (v24 >= 0x17)
  {
    v27 = (v24 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v24 | 7) != 0x17)
      v27 = v24 | 7;
    v28 = v27 + 1;
    v26 = operator new(v27 + 1);
    v52.__r_.__value_.__l.__size_ = v25;
    v52.__r_.__value_.__r.__words[2] = v28 | 0x8000000000000000;
    v52.__r_.__value_.__r.__words[0] = (std::string::size_type)v26;
    goto LABEL_35;
  }
  *((_BYTE *)&v52.__r_.__value_.__s + 23) = v24;
  v26 = &v52;
  if (v24)
LABEL_35:
    memmove(v26, v23, v25);
  *((_BYTE *)v26 + v25) = 0;
  v29 = (const void *)abm::trace::kLogDirPrefix;
  v30 = strlen(abm::trace::kLogDirPrefix);
  if (v30 > 0x7FFFFFFFFFFFFFF7)
    sub_10000163C();
  v31 = v30;
  if (v30 >= 0x17)
  {
    v33 = (v30 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v30 | 7) != 0x17)
      v33 = v30 | 7;
    v34 = v33 + 1;
    v32 = operator new(v33 + 1);
    v50 = v31;
    v51 = v34 | 0x8000000000000000;
    v49 = v32;
    goto LABEL_43;
  }
  HIBYTE(v51) = v30;
  v32 = &v49;
  if (v30)
LABEL_43:
    memmove(v32, v29, v31);
  *((_BYTE *)v32 + v31) = 0;
  if (v51 >= 0)
    v35 = (const std::string::value_type *)&v49;
  else
    v35 = (const std::string::value_type *)v49;
  if (v51 >= 0)
    v36 = HIBYTE(v51);
  else
    v36 = v50;
  v37 = std::string::append(&v52, v35, v36);
  v38 = *(_OWORD *)&v37->__r_.__value_.__l.__data_;
  v55.__r_.__value_.__r.__words[2] = v37->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v55.__r_.__value_.__l.__data_ = v38;
  v37->__r_.__value_.__l.__size_ = 0;
  v37->__r_.__value_.__r.__words[2] = 0;
  v37->__r_.__value_.__r.__words[0] = 0;
  v39 = *(char *)(a2 + 23);
  if (v39 >= 0)
    v40 = (const std::string::value_type *)a2;
  else
    v40 = *(const std::string::value_type **)a2;
  if (v39 >= 0)
    v41 = *(unsigned __int8 *)(a2 + 23);
  else
    v41 = *(_QWORD *)(a2 + 8);
  v42 = std::string::append(&v55, v40, v41);
  v43 = *(_OWORD *)&v42->__r_.__value_.__l.__data_;
  __dst.__r_.__value_.__r.__words[2] = v42->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__dst.__r_.__value_.__l.__data_ = v43;
  v42->__r_.__value_.__l.__size_ = 0;
  v42->__r_.__value_.__r.__words[2] = 0;
  v42->__r_.__value_.__r.__words[0] = 0;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v44 = &__p;
  else
    v44 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v45 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v45 = __p.__r_.__value_.__l.__size_;
  v46 = std::string::append(&__dst, (const std::string::value_type *)v44, v45);
  *a1 = *v46;
  v46->__r_.__value_.__l.__size_ = 0;
  v46->__r_.__value_.__r.__words[2] = 0;
  v46->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__dst.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v55.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_64:
      if ((SHIBYTE(v51) & 0x80000000) == 0)
        goto LABEL_65;
      goto LABEL_70;
    }
  }
  else if ((SHIBYTE(v55.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_64;
  }
  operator delete(v55.__r_.__value_.__l.__data_);
  if ((SHIBYTE(v51) & 0x80000000) == 0)
  {
LABEL_65:
    if ((SHIBYTE(v52.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_66;
    goto LABEL_71;
  }
LABEL_70:
  operator delete(v49);
  if ((SHIBYTE(v52.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_66:
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      return;
LABEL_72:
    operator delete(__p.__r_.__value_.__l.__data_);
    return;
  }
LABEL_71:
  operator delete(v52.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_72;
}

void sub_100014E54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  if (a26 < 0)
    operator delete(__p);
  if (a33 < 0)
    operator delete(a28);
  _Unwind_Resume(exception_object);
}

xpc_object_t sub_100014F24(_QWORD *a1, xpc_object_t xdict, char *key)
{
  xpc_object_t value;
  xpc_object_t result;

  value = xpc_dictionary_get_value(xdict, key);
  *a1 = value;
  if (value)
    return xpc_retain(value);
  result = xpc_null_create();
  *a1 = result;
  return result;
}

void sub_100014F70(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;

  v3 = *(NSObject **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v3;
  if (v3)
  {
    dispatch_retain(v3);
    v4 = *(NSObject **)(a1 + 40);
    if (v4)
      dispatch_group_enter(v4);
  }
}

void sub_100014FB0(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  v2 = *(NSObject **)(a1 + 40);
  if (v2)
  {
    dispatch_group_leave(v2);
    v3 = *(NSObject **)(a1 + 40);
    if (v3)
      dispatch_release(v3);
  }
}

uint64_t sub_100014FEC(defaults::compression *a1, NSObject **a2, uint64_t a3)
{
  uint64_t v5;
  defaults::compression *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int64_t v10;
  xpc_object_t v11;
  xpc_object_t v12;
  uint64_t *v13;
  xpc_object_t v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  const char *v20;
  xpc_object_t v21;
  xpc_object_t v22;
  const char *v23;
  xpc_object_t v24;
  xpc_object_t v25;
  xpc_object_t v26;
  xpc_object_t v27;
  xpc_object_t v28;
  xpc_object_t v29;
  xpc_object_t v30;
  xpc_object_t v31;
  NSObject *v32;
  std::__shared_weak_count *v33;
  unint64_t *p_shared_owners;
  unint64_t v35;
  const void *v36;
  size_t v37;
  void *v38;
  void **v39;
  uint64_t v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  _QWORD v46[5];
  dispatch_group_t group;
  int v48;
  BOOL v49;
  void *__dst[2];
  unint64_t v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  void *v57[2];
  uint64_t v58;
  __int16 v59;
  BOOL v60;
  int v61;

  v5 = *((_QWORD *)a1 + 4);
  v61 = defaults::compression::mode(a1);
  sub_10001200C(*(_QWORD *)(v5 + 208), *(std::__shared_weak_count **)(v5 + 216), &v61);
  v60 = defaults::compression::splitArchive(v6);
  sub_1000125C0(*(_QWORD *)(v5 + 208), *(std::__shared_weak_count **)(v5 + 216), &v60);
  v59 = 0;
  v57[0] = 0;
  v57[1] = 0;
  v58 = 0;
  sub_100007B3C(&v54, a3);
  sub_10001367C(&v54, &v61, &v60, (_BYTE *)&v59 + 1, &v59, v57);
  if (v56)
  {
    v7 = v54;
    v8 = v55;
    v9 = *v55;
    *(_QWORD *)(v9 + 8) = *(_QWORD *)(v54 + 8);
    **(_QWORD **)(v7 + 8) = v9;
    v56 = 0;
    if (v8 != &v54)
    {
      do
      {
        v13 = (uint64_t *)v8[1];
        if (*((char *)v8 + 39) < 0)
          operator delete((void *)v8[2]);
        operator delete(v8);
        v8 = v13;
      }
      while (v13 != &v54);
    }
  }
  v10 = v61;
  if (!v61)
    v60 = 0;
  v11 = xpc_dictionary_create(0, 0, 0);
  if (v11 || (v11 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v11) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v11);
      v12 = v11;
    }
    else
    {
      v12 = xpc_null_create();
    }
  }
  else
  {
    v12 = xpc_null_create();
    v11 = 0;
  }
  xpc_release(v11);
  v14 = xpc_string_create(abm::kBasebandResetTypeHard);
  if (!v14)
    v14 = xpc_null_create();
  xpc_dictionary_set_value(v12, abm::kKeyBasebandResetType, v14);
  v15 = xpc_null_create();
  xpc_release(v14);
  xpc_release(v15);
  v16 = xpc_string_create(abm::kBasebandResetSubTypeOtherErrors);
  if (!v16)
    v16 = xpc_null_create();
  xpc_dictionary_set_value(v12, abm::kKeyBasebandResetSubType, v16);
  v17 = xpc_null_create();
  xpc_release(v16);
  xpc_release(v17);
  v18 = xpc_string_create(abm::kCollectTelephonyLogsWithCoredump);
  if (!v18)
    v18 = xpc_null_create();
  xpc_dictionary_set_value(v12, abm::kKeyTraceAction, v18);
  v19 = xpc_null_create();
  xpc_release(v18);
  xpc_release(v19);
  if (v58 >= 0)
    v20 = (const char *)v57;
  else
    v20 = (const char *)v57[0];
  v21 = xpc_string_create(v20);
  if (!v21)
    v21 = xpc_null_create();
  xpc_dictionary_set_value(v12, abm::kKeyBasebandResetReason, v21);
  v22 = xpc_null_create();
  xpc_release(v21);
  xpc_release(v22);
  if (v58 >= 0)
    v23 = (const char *)v57;
  else
    v23 = (const char *)v57[0];
  v24 = xpc_string_create(v23);
  if (!v24)
    v24 = xpc_null_create();
  xpc_dictionary_set_value(v12, abm::kKeyTraceDumpStateReason, v24);
  v25 = xpc_null_create();
  xpc_release(v24);
  xpc_release(v25);
  v26 = xpc_int64_create(v10);
  if (!v26)
    v26 = xpc_null_create();
  xpc_dictionary_set_value(v12, abm::kKeyTraceDumpStatePerformCompression, v26);
  v27 = xpc_null_create();
  xpc_release(v26);
  xpc_release(v27);
  v28 = xpc_BOOL_create(v60);
  if (!v28)
    v28 = xpc_null_create();
  xpc_dictionary_set_value(v12, abm::kKeyTraceDumpStateSplitArchive, v28);
  v29 = xpc_null_create();
  xpc_release(v28);
  xpc_release(v29);
  if (HIBYTE(v59))
  {
    v30 = xpc_BOOL_create(0);
    if (!v30)
      v30 = xpc_null_create();
    xpc_dictionary_set_value(v12, abm::kKeyTraceUserConfirmation, v30);
    v31 = xpc_null_create();
    xpc_release(v30);
    xpc_release(v31);
  }
  v32 = *a2;
  if (v32)
  {
    dispatch_retain(v32);
    dispatch_group_enter(v32);
  }
  v52 = *(_QWORD *)(v5 + 208);
  v33 = *(std::__shared_weak_count **)(v5 + 216);
  v53 = v33;
  if (v33)
  {
    p_shared_owners = (unint64_t *)&v33->__shared_owners_;
    do
      v35 = __ldxr(p_shared_owners);
    while (__stxr(v35 + 1, p_shared_owners));
  }
  v36 = (const void *)abm::kCommandTraceDumpState;
  v37 = strlen(abm::kCommandTraceDumpState);
  if (v37 >= 0x7FFFFFFFFFFFFFF8)
    sub_10000163C();
  v38 = (void *)v37;
  if (v37 >= 0x17)
  {
    v40 = (v37 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v37 | 7) != 0x17)
      v40 = v37 | 7;
    v41 = v40 + 1;
    v39 = (void **)operator new(v40 + 1);
    __dst[1] = v38;
    v51 = v41 | 0x8000000000000000;
    __dst[0] = v39;
    goto LABEL_50;
  }
  HIBYTE(v51) = v37;
  v39 = __dst;
  if (v37)
LABEL_50:
    memmove(v39, v36, (size_t)v38);
  *((_BYTE *)v38 + (_QWORD)v39) = 0;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3321888768;
  v46[2] = sub_100015704;
  v46[3] = &unk_10001CA28;
  v46[4] = v5;
  group = v32;
  if (v32)
  {
    dispatch_retain(v32);
    dispatch_group_enter(v32);
  }
  v49 = v60;
  v48 = v61;
  abm::client::PerformCommand(&v52, __dst, v46, v12);
  if (SHIBYTE(v51) < 0)
    operator delete(__dst[0]);
  v42 = v53;
  if (v53)
  {
    v43 = (unint64_t *)&v53->__shared_owners_;
    do
      v44 = __ldaxr(v43);
    while (__stlxr(v44 - 1, v43));
    if (!v44)
    {
      ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
      std::__shared_weak_count::__release_weak(v42);
    }
  }
  if (group)
  {
    dispatch_group_leave(group);
    if (group)
      dispatch_release(group);
  }
  if (v32)
  {
    dispatch_group_leave(v32);
    dispatch_release(v32);
  }
  xpc_release(v12);
  if (SHIBYTE(v58) < 0)
    operator delete(v57[0]);
  return 1;
}

void sub_1000155E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, dispatch_group_t group, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23,uint64_t a24,char a25)
{
  void *v25;
  NSObject *v26;
  uint64_t v27;

  if (group)
  {
    dispatch_group_leave(group);
    dispatch_release(group);
  }
  if (a22 < 0)
    operator delete(__p);
  sub_1000015D4((uint64_t)&a23);
  if (v26)
  {
    dispatch_group_leave(v26);
    dispatch_release(v26);
  }
  xpc_release(v25);
  if (*(char *)(v27 - 73) < 0)
    operator delete(*(void **)(v27 - 96));
  _Unwind_Resume(a1);
}

void sub_100015704(uint64_t a1, _DWORD *a2, xpc_object_t a3)
{
  _QWORD *v6;
  const char *v7;
  uint64_t v8;
  _QWORD *v9;
  const std::locale::facet *v10;
  uint64_t v11;
  xpc_object_t v12;
  _QWORD *v13;
  const char *v14;
  xpc_object_t value;
  _QWORD *v16;
  xpc_object_t v17;
  abm::trace *v18;
  int v19;
  std::string *v20;
  std::string::size_type size;
  _QWORD *v22;
  const std::locale::facet *v23;
  uint64_t v24;
  _QWORD *v25;
  xpc_object_t v26;
  abm::trace *v27;
  int v28;
  std::string *v29;
  std::string::size_type v30;
  _QWORD *v31;
  const std::locale::facet *v32;
  uint64_t v33;
  abm::trace *v34;
  int v35;
  std::string *v36;
  std::string::size_type v37;
  _QWORD *v38;
  const std::locale::facet *v39;
  uint64_t v40;
  void *v41;
  char v42;
  void *v43[2];
  char v44;
  void *v45;
  char v46;
  void *v47[2];
  char v48;
  void *__p;
  char v50;
  xpc_object_t object;
  void *v52[2];
  char v53;
  std::string v54;
  std::locale v55;
  uint64_t v56;
  uint64_t v57;

  v6 = sub_100001760(&std::cout, (uint64_t)"Telephony log collection with Coredump: ", 40);
  if (*a2)
    v7 = "Failed";
  else
    v7 = "Success";
  if (*a2)
    v8 = 6;
  else
    v8 = 7;
  v9 = sub_100001760(v6, (uint64_t)v7, v8);
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(_QWORD *)(*v9 - 24)));
  v10 = std::locale::use_facet(&v55, &std::ctype<char>::id);
  v11 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
  std::locale::~locale(&v55);
  std::ostream::put(v9, v11);
  std::ostream::flush(v9);
  if (!*a2)
  {
    if (a3)
    {
      xpc_retain(a3);
    }
    else
    {
      a3 = xpc_null_create();
      if (!a3)
      {
        v12 = xpc_null_create();
        a3 = 0;
        goto LABEL_15;
      }
    }
    if (xpc_get_type(a3) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(a3);
      v12 = a3;
    }
    else
    {
      v12 = xpc_null_create();
    }
LABEL_15:
    xpc_release(a3);
    if (xpc_get_type(v12) != (xpc_type_t)&_xpc_type_dictionary)
    {
LABEL_67:
      xpc_release(v12);
      return;
    }
    if (*(_BYTE *)(a1 + 52))
    {
      v13 = sub_100001760(&std::cout, (uint64_t)"Main archive path = ", 20);
      v14 = (const char *)abm::kKeyTimestampString;
      value = xpc_dictionary_get_value(v12, abm::kKeyTimestampString);
      object = value;
      if (value)
        xpc_retain(value);
      else
        object = xpc_null_create();
      v55.__locale_ = 0;
      v56 = 0;
      v57 = 0;
      v18 = (abm::trace *)xpc::dyn_cast_or_default(v52, &object, &v55);
      if (SHIBYTE(v57) < 0)
        operator delete(v55.__locale_);
      v19 = *(_DWORD *)(a1 + 48);
      abm::trace::getCoreDumpDirSuffix(v18);
      sub_100014968(&v54, (uint64_t)v52, v19, 0, (uint64_t)&__p);
      if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v20 = &v54;
      else
        v20 = (std::string *)v54.__r_.__value_.__r.__words[0];
      if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v54.__r_.__value_.__r.__words[2]);
      else
        size = v54.__r_.__value_.__l.__size_;
      v22 = sub_100001760(v13, (uint64_t)v20, size);
      std::ios_base::getloc((const std::ios_base *)((char *)v22 + *(_QWORD *)(*v22 - 24)));
      v23 = std::locale::use_facet(&v55, &std::ctype<char>::id);
      v24 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v23->__vftable[2].~facet_0)(v23, 10);
      std::locale::~locale(&v55);
      std::ostream::put(v22, v24);
      std::ostream::flush(v22);
      if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v54.__r_.__value_.__l.__data_);
        if ((v50 & 0x80000000) == 0)
        {
LABEL_32:
          if ((v53 & 0x80000000) == 0)
            goto LABEL_33;
LABEL_37:
          operator delete(v52[0]);
LABEL_33:
          xpc_release(object);
          v25 = sub_100001760(&std::cout, (uint64_t)"Lite archive path = ", 20);
          v26 = xpc_dictionary_get_value(v12, v14);
          object = v26;
          if (v26)
            xpc_retain(v26);
          else
            object = xpc_null_create();
          v55.__locale_ = 0;
          v56 = 0;
          v57 = 0;
          v27 = (abm::trace *)xpc::dyn_cast_or_default(v47, &object, &v55);
          if (SHIBYTE(v57) < 0)
            operator delete(v55.__locale_);
          v28 = *(_DWORD *)(a1 + 48);
          abm::trace::getCoreDumpDirSuffix(v27);
          sub_100014968(&v54, (uint64_t)v47, v28, 1, (uint64_t)&v45);
          if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v29 = &v54;
          else
            v29 = (std::string *)v54.__r_.__value_.__r.__words[0];
          if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v30 = HIBYTE(v54.__r_.__value_.__r.__words[2]);
          else
            v30 = v54.__r_.__value_.__l.__size_;
          v31 = sub_100001760(v25, (uint64_t)v29, v30);
          std::ios_base::getloc((const std::ios_base *)((char *)v31 + *(_QWORD *)(*v31 - 24)));
          v32 = std::locale::use_facet(&v55, &std::ctype<char>::id);
          v33 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v32->__vftable[2].~facet_0)(v32, 10);
          std::locale::~locale(&v55);
          std::ostream::put(v31, v33);
          std::ostream::flush(v31);
          if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
          {
            operator delete(v54.__r_.__value_.__l.__data_);
            if ((v46 & 0x80000000) == 0)
            {
LABEL_49:
              if ((v48 & 0x80000000) == 0)
              {
LABEL_50:
                xpc_release(object);
                goto LABEL_67;
              }
LABEL_53:
              operator delete(v47[0]);
              goto LABEL_50;
            }
          }
          else if ((v46 & 0x80000000) == 0)
          {
            goto LABEL_49;
          }
          operator delete(v45);
          if ((v48 & 0x80000000) == 0)
            goto LABEL_50;
          goto LABEL_53;
        }
      }
      else if ((v50 & 0x80000000) == 0)
      {
        goto LABEL_32;
      }
      operator delete(__p);
      if ((v53 & 0x80000000) == 0)
        goto LABEL_33;
      goto LABEL_37;
    }
    v16 = sub_100001760(&std::cout, (uint64_t)"Path = ", 7);
    v17 = xpc_dictionary_get_value(v12, abm::kKeyTimestampString);
    object = v17;
    if (v17)
      xpc_retain(v17);
    else
      object = xpc_null_create();
    v55.__locale_ = 0;
    v56 = 0;
    v57 = 0;
    v34 = (abm::trace *)xpc::dyn_cast_or_default(v43, &object, &v55);
    if (SHIBYTE(v57) < 0)
      operator delete(v55.__locale_);
    v35 = *(_DWORD *)(a1 + 48);
    abm::trace::getCoreDumpDirSuffix(v34);
    sub_100014968(&v54, (uint64_t)v43, v35, 0, (uint64_t)&v41);
    if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v36 = &v54;
    else
      v36 = (std::string *)v54.__r_.__value_.__r.__words[0];
    if ((v54.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v37 = HIBYTE(v54.__r_.__value_.__r.__words[2]);
    else
      v37 = v54.__r_.__value_.__l.__size_;
    v38 = sub_100001760(v16, (uint64_t)v36, v37);
    std::ios_base::getloc((const std::ios_base *)((char *)v38 + *(_QWORD *)(*v38 - 24)));
    v39 = std::locale::use_facet(&v55, &std::ctype<char>::id);
    v40 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v39->__vftable[2].~facet_0)(v39, 10);
    std::locale::~locale(&v55);
    std::ostream::put(v38, v40);
    std::ostream::flush(v38);
    if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v54.__r_.__value_.__l.__data_);
      if ((v42 & 0x80000000) == 0)
      {
LABEL_65:
        if ((v44 & 0x80000000) == 0)
        {
LABEL_66:
          xpc_release(object);
          goto LABEL_67;
        }
LABEL_71:
        operator delete(v43[0]);
        goto LABEL_66;
      }
    }
    else if ((v42 & 0x80000000) == 0)
    {
      goto LABEL_65;
    }
    operator delete(v41);
    if ((v44 & 0x80000000) == 0)
      goto LABEL_66;
    goto LABEL_71;
  }
}

void sub_100015C84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,xpc_object_t object,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46)
{
  void *v46;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0)
      goto LABEL_6;
  }
  else if ((a21 & 0x80000000) == 0)
  {
LABEL_6:
    xpc_release(object);
    xpc_release(v46);
    _Unwind_Resume(a1);
  }
  operator delete(a16);
  goto LABEL_6;
}

BOOL sub_100015EB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t v9;
  const char *v10;
  xpc_object_t v11;
  __int128 v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  const void *v16;
  size_t v17;
  size_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  xpc_object_t v25;
  xpc_object_t v26;
  _QWORD *v27;
  const std::locale::facet *v28;
  uint64_t v29;
  xpc_object_t v30;
  int v31;
  char *v33;
  xpc_object_t v34;
  const char *v35;
  const object *v36;
  capabilities::diag *v37;
  defaults::compression *type;
  xpc_object_t v39;
  xpc_object_t v40;
  __int128 v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  size_t v45;
  void *v46;
  void *v47;
  _QWORD *v48;
  const std::locale::facet *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  xpc_object_t v56;
  xpc_object_t v57;
  const char *v58;
  defaults::compression *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t *v65;
  xpc_object_t v66;
  xpc_object_t v67;
  void **v68;
  xpc_object_t v69;
  xpc_object_t v70;
  xpc_object_t v71;
  xpc_object_t v72;
  xpc_object_t v73;
  xpc_object_t v74;
  xpc_object_t v75;
  xpc_object_t v76;
  __int128 v77;
  std::__shared_weak_count *v78;
  unint64_t *v79;
  unint64_t v80;
  const void *v81;
  size_t v82;
  size_t v83;
  _BYTE *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  std::__shared_weak_count *v88;
  unint64_t *v89;
  unint64_t v90;
  _QWORD *v91;
  const std::locale::facet *v92;
  uint64_t v93;
  xpc_object_t v94;
  xpc_object_t v95;
  std::__shared_weak_count *v96;
  unint64_t *v97;
  unint64_t v98;
  xpc_object_t v99;
  xpc_object_t v100;
  _QWORD *v101;
  const std::locale::facet *v102;
  uint64_t v103;
  xpc_object_t v104;
  _QWORD *v105;
  const char *v106;
  xpc_object_t v107;
  _QWORD *v108;
  xpc_object_t v109;
  BOOL v110;
  int v111;
  std::string *v112;
  std::string::size_type size;
  _QWORD *v114;
  const std::locale::facet *v115;
  uint64_t v116;
  _QWORD *v117;
  xpc_object_t v118;
  BOOL v119;
  std::string *v120;
  std::string::size_type v121;
  _QWORD *v122;
  const std::locale::facet *v123;
  uint64_t v124;
  BOOL v125;
  int v126;
  std::string *v127;
  std::string::size_type v128;
  _QWORD *v129;
  const std::locale::facet *v130;
  uint64_t v131;
  xpc_object_t v132;
  xpc_object_t v133;
  xpc_object_t v134;
  xpc_object_t v135;
  __int128 v136;
  unint64_t v137;
  xpc_object_t v138;
  const char *v139;
  std::__shared_weak_count *v140;
  unint64_t *v141;
  unint64_t v142;
  std::string::size_type v143;
  _QWORD *v144;
  _QWORD *v145;
  size_t v146;
  _QWORD *v147;
  size_t v148;
  _QWORD *v149;
  std::string *v150;
  std::string::size_type v151;
  _QWORD *v152;
  BOOL v153;
  _BYTE *v154;
  uint64_t v155;
  _QWORD *v156;
  char *v157;
  _QWORD *v158;
  _QWORD *v159;
  size_t v160;
  _QWORD *v161;
  _BYTE *v162;
  uint64_t v163;
  _QWORD *v164;
  std::string v165;
  void *v166[2];
  char v167;
  void *v168[2];
  char v169;
  void *v170[2];
  char v171;
  void *v172[2];
  char v173;
  void *v174[2];
  char v175;
  void *v176[2];
  char v177;
  uint64_t v178;
  std::__shared_weak_count *v179;
  void *__p[2];
  __int128 v181;
  xpc_object_t object;
  uint64_t v183;
  uint64_t *v184;
  uint64_t v185;
  void *v186[2];
  uint64_t v187;
  char v188;
  char v189;
  BOOL value;
  int v191;
  uint64_t v192;
  std::__shared_weak_count *v193;
  BOOL v194;
  std::string v195;
  uint64_t v196;
  std::__shared_weak_count *v197;
  __int128 v198;
  __int128 v199;
  xpc_object_t v200;
  BOOL v201;
  xpc_object_t v202;
  std::string v203;
  xpc_object_t v204;
  _BYTE __dst[32];
  xpc_object_t v206;
  uint64_t v207;
  std::__shared_weak_count *v208;
  unint64_t v209;
  unint64_t v210;

  v4 = *(_QWORD *)(a1 + 32);
  v201 = 0;
  v5 = xpc_dictionary_create(0, 0, 0);
  if (v5 || (v5 = xpc_null_create()) != 0)
  {
    if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
    {
      xpc_retain(v5);
      v6 = v5;
    }
    else
    {
      v6 = xpc_null_create();
    }
  }
  else
  {
    v6 = xpc_null_create();
    v5 = 0;
  }
  xpc_release(v5);
  v7 = xpc_string_create(abm::kTraceBaseband);
  if (!v7)
    v7 = xpc_null_create();
  xpc_dictionary_set_value(v6, abm::kKeyTraceName, v7);
  v8 = xpc_null_create();
  xpc_release(v7);
  xpc_release(v8);
  v9 = xpc_string_create(abm::kKeyTraceEnabled);
  if (!v9)
    v9 = xpc_null_create();
  v10 = (const char *)abm::kKeyTracePropertyName;
  xpc_dictionary_set_value(v6, abm::kKeyTracePropertyName, v9);
  v11 = xpc_null_create();
  xpc_release(v9);
  xpc_release(v11);
  v200 = xpc_null_create();
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v198 = v12;
  v199 = v12;
  v196 = *(_QWORD *)(v4 + 208);
  v13 = *(std::__shared_weak_count **)(v4 + 216);
  v197 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  v16 = (const void *)abm::kCommandGetTraceProperty;
  v17 = strlen(abm::kCommandGetTraceProperty);
  if (v17 > 0x7FFFFFFFFFFFFFF7)
    sub_10000163C();
  v18 = v17;
  if (v17 >= 0x17)
  {
    v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17)
      v20 = v17 | 7;
    v21 = v20 + 1;
    v19 = operator new(v20 + 1);
    *(_QWORD *)&__dst[8] = v18;
    *(_QWORD *)&__dst[16] = v21 | 0x8000000000000000;
    *(_QWORD *)__dst = v19;
    goto LABEL_21;
  }
  __dst[23] = v17;
  v19 = __dst;
  if (v17)
LABEL_21:
    memmove(v19, v16, v18);
  v19[v18] = 0;
  abm::client::PerformCommand(&v196, __dst, v6, &v200);
  if ((__dst[23] & 0x80000000) != 0)
  {
    operator delete(*(void **)__dst);
    v22 = v197;
    if (!v197)
      goto LABEL_29;
  }
  else
  {
    v22 = v197;
    if (!v197)
      goto LABEL_29;
  }
  v23 = (unint64_t *)&v22->__shared_owners_;
  do
    v24 = __ldaxr(v23);
  while (__stlxr(v24 - 1, v23));
  if (!v24)
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v22);
    v25 = v200;
    if (v200)
      goto LABEL_33;
    goto LABEL_30;
  }
LABEL_29:
  v25 = v200;
  if (v200)
    goto LABEL_33;
LABEL_30:
  v25 = xpc_null_create();
  if (!v25)
  {
    v26 = xpc_null_create();
    v25 = 0;
    goto LABEL_36;
  }
LABEL_33:
  if (xpc_get_type(v25) == (xpc_type_t)&_xpc_type_dictionary)
  {
    xpc_retain(v25);
    v26 = v25;
  }
  else
  {
    v26 = xpc_null_create();
  }
LABEL_36:
  xpc_release(v25);
  if ((_DWORD)v198 || xpc_get_type(v26) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v27 = sub_100001760(&std::cout, (uint64_t)"Baseband log collection: Failed", 31);
    std::ios_base::getloc((const std::ios_base *)((char *)v27 + *(_QWORD *)(*v27 - 24)));
    v28 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
    v29 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v28->__vftable[2].~facet_0)(v28, 10);
    std::locale::~locale((std::locale *)__dst);
    std::ostream::put(v27, v29);
    std::ostream::flush(v27);
    v30 = v26;
    goto LABEL_39;
  }
  memset(&v195, 170, sizeof(v195));
  v33 = (char *)abm::kKeyTracePropertyValue;
  v34 = xpc_dictionary_get_value(v26, abm::kKeyTracePropertyValue);
  *(_QWORD *)__dst = v34;
  if (v34)
    xpc_retain(v34);
  else
    *(_QWORD *)__dst = xpc_null_create();
  v36 = (const object *)abm::kUnknown;
  xpc::dyn_cast_or_default(&v195, (xpc *)__dst, abm::kUnknown, v35);
  xpc_release(*(xpc_object_t *)__dst);
  v37 = (capabilities::diag *)sub_100012928(&v195, &v201);
  if (v201)
  {
    v194 = 0;
    type = (defaults::compression *)capabilities::diag::supportsQDSS(v37);
    if (!(_DWORD)type)
    {
      v30 = v26;
      goto LABEL_82;
    }
    v39 = xpc_string_create(abm::kKeyTraceHighTput);
    if (!v39)
      v39 = xpc_null_create();
    xpc_dictionary_set_value(v6, v10, v39);
    v40 = xpc_null_create();
    xpc_release(v39);
    xpc_release(v40);
    v200 = xpc_null_create();
    *(_QWORD *)&v41 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v41 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__dst = v41;
    *(_OWORD *)&__dst[16] = v41;
    v192 = *(_QWORD *)(v4 + 208);
    v42 = *(std::__shared_weak_count **)(v4 + 216);
    v193 = v42;
    if (v42)
    {
      v43 = (unint64_t *)&v42->__shared_owners_;
      do
        v44 = __ldxr(v43);
      while (__stxr(v44 + 1, v43));
    }
    v45 = strlen((const char *)v16);
    if (v45 > 0x7FFFFFFFFFFFFFF7)
      sub_10000163C();
    v46 = (void *)v45;
    if (v45 >= 0x17)
    {
      v51 = (v45 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v45 | 7) != 0x17)
        v51 = v45 | 7;
      v52 = v51 + 1;
      v47 = operator new(v51 + 1);
      __p[1] = v46;
      *(_QWORD *)&v181 = v52 | 0x8000000000000000;
      __p[0] = v47;
    }
    else
    {
      BYTE7(v181) = v45;
      v47 = __p;
      if (!v45)
        goto LABEL_62;
    }
    memmove(v47, v16, (size_t)v46);
LABEL_62:
    *((_BYTE *)v46 + (_QWORD)v47) = 0;
    abm::client::PerformCommand(&v192, __p, v6, &v200);
    if (SBYTE7(v181) < 0)
      operator delete(__p[0]);
    v53 = v193;
    if (v193)
    {
      v54 = (unint64_t *)&v193->__shared_owners_;
      do
        v55 = __ldaxr(v54);
      while (__stlxr(v55 - 1, v54));
      if (!v55)
      {
        ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
        std::__shared_weak_count::__release_weak(v53);
      }
    }
    v56 = v200;
    if (v200 || (v56 = xpc_null_create()) != 0)
    {
      if (xpc_get_type(v56) == (xpc_type_t)&_xpc_type_dictionary)
      {
        xpc_retain(v56);
        v30 = v56;
      }
      else
      {
        v30 = xpc_null_create();
      }
    }
    else
    {
      v30 = xpc_null_create();
      v56 = 0;
    }
    v57 = xpc_null_create();
    xpc_release(v26);
    xpc_release(v57);
    xpc_release(v56);
    if (!*(_DWORD *)__dst)
    {
      type = xpc_get_type(v30);
      if (type == (defaults::compression *)&_xpc_type_dictionary)
      {
        sub_100014F24(&v203, v30, v33);
        xpc::dyn_cast_or_default(__p, (xpc *)&v203, v36, v58);
        if (SHIBYTE(v195.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v195.__r_.__value_.__l.__data_);
        *(_OWORD *)&v195.__r_.__value_.__l.__data_ = *(_OWORD *)__p;
        v195.__r_.__value_.__r.__words[2] = v181;
        BYTE7(v181) = 0;
        LOBYTE(__p[0]) = 0;
        xpc_release(v203.__r_.__value_.__l.__data_);
        type = (defaults::compression *)sub_100012928(&v195, &v194);
      }
    }
    if ((__dst[31] & 0x80000000) != 0)
      operator delete(*(void **)&__dst[8]);
LABEL_82:
    v191 = defaults::compression::mode(type);
    sub_10001200C(*(_QWORD *)(v4 + 208), *(std::__shared_weak_count **)(v4 + 216), &v191);
    value = defaults::compression::splitArchive(v59);
    sub_1000125C0(*(_QWORD *)(v4 + 208), *(std::__shared_weak_count **)(v4 + 216), &value);
    v189 = 0;
    v188 = 0;
    v186[0] = 0;
    v186[1] = 0;
    v187 = 0;
    sub_100007B3C(&v183, a3);
    sub_10001367C(&v183, &v191, &value, &v189, &v188, v186);
    if (v185)
    {
      v60 = v183;
      v61 = v184;
      v62 = *v184;
      *(_QWORD *)(v62 + 8) = *(_QWORD *)(v183 + 8);
      **(_QWORD **)(v60 + 8) = v62;
      v185 = 0;
      if (v61 != &v183)
      {
        do
        {
          v65 = (uint64_t *)v61[1];
          if (*((char *)v61 + 39) < 0)
            operator delete((void *)v61[2]);
          operator delete(v61);
          v61 = v65;
        }
        while (v65 != &v183);
      }
    }
    v63 = sub_100013BA4(v4);
    if ((v63 & 1) != 0 || (defaults::compression::supported((defaults::compression *)v63) & 1) == 0)
    {
      v191 = 0;
    }
    else
    {
      v64 = v191;
      if (v191)
      {
LABEL_93:
        v66 = xpc_dictionary_create(0, 0, 0);
        if (v66 || (v66 = xpc_null_create()) != 0)
        {
          if (xpc_get_type(v66) == (xpc_type_t)&_xpc_type_dictionary)
          {
            xpc_retain(v66);
            v67 = v66;
          }
          else
          {
            v67 = xpc_null_create();
          }
        }
        else
        {
          v67 = xpc_null_create();
          v66 = 0;
        }
        xpc_release(v66);
        if (v187 >= 0)
          v68 = v186;
        else
          v68 = (void **)v186[0];
        v69 = xpc_string_create((const char *)v68);
        if (!v69)
          v69 = xpc_null_create();
        xpc_dictionary_set_value(v67, abm::kKeyTraceDumpStateReason, v69);
        v70 = xpc_null_create();
        xpc_release(v69);
        xpc_release(v70);
        v71 = xpc_string_create(abm::kCollectBasebandLogs);
        if (!v71)
          v71 = xpc_null_create();
        xpc_dictionary_set_value(v67, abm::kKeyTraceAction, v71);
        v72 = xpc_null_create();
        xpc_release(v71);
        xpc_release(v72);
        v73 = xpc_int64_create(v64);
        if (!v73)
          v73 = xpc_null_create();
        xpc_dictionary_set_value(v67, abm::kKeyTraceDumpStatePerformCompression, v73);
        v74 = xpc_null_create();
        xpc_release(v73);
        xpc_release(v74);
        v75 = xpc_BOOL_create(value);
        if (!v75)
          v75 = xpc_null_create();
        xpc_dictionary_set_value(v67, abm::kKeyTraceDumpStateSplitArchive, v75);
        v76 = xpc_null_create();
        xpc_release(v75);
        xpc_release(v76);
        object = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
        object = xpc_null_create();
        *(_QWORD *)&v77 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v77 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)__p = v77;
        v181 = v77;
        v178 = *(_QWORD *)(v4 + 208);
        v78 = *(std::__shared_weak_count **)(v4 + 216);
        v179 = v78;
        if (v78)
        {
          v79 = (unint64_t *)&v78->__shared_owners_;
          do
            v80 = __ldxr(v79);
          while (__stxr(v80 + 1, v79));
        }
        v81 = (const void *)abm::kCommandTraceDumpState;
        v82 = strlen(abm::kCommandTraceDumpState);
        if (v82 > 0x7FFFFFFFFFFFFFF7)
          sub_10000163C();
        v83 = v82;
        if (v82 >= 0x17)
        {
          v85 = (v82 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v82 | 7) != 0x17)
            v85 = v82 | 7;
          v86 = v85 + 1;
          v84 = operator new(v85 + 1);
          *(_QWORD *)&__dst[8] = v83;
          *(_QWORD *)&__dst[16] = v86 | 0x8000000000000000;
          *(_QWORD *)__dst = v84;
        }
        else
        {
          __dst[23] = v82;
          v84 = __dst;
          if (!v82)
          {
LABEL_121:
            v84[v83] = 0;
            v87 = abm::client::PerformCommand(&v178, __dst, v67, &object);
            if ((__dst[23] & 0x80000000) != 0)
              operator delete(*(void **)__dst);
            v88 = v179;
            if (v179)
            {
              v89 = (unint64_t *)&v179->__shared_owners_;
              do
                v90 = __ldaxr(v89);
              while (__stlxr(v90 - 1, v89));
              if (!v90)
              {
                ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
                std::__shared_weak_count::__release_weak(v88);
              }
            }
            if (LODWORD(__p[0]) != -534716415)
            {
              if (LODWORD(__p[0]))
              {
                v101 = sub_100001760(&std::cout, (uint64_t)"Baseband log collection: Failed", 31);
                std::ios_base::getloc((const std::ios_base *)((char *)v101 + *(_QWORD *)(*v101 - 24)));
                v102 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
                v103 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v102->__vftable[2].~facet_0)(v102, 10);
                std::locale::~locale((std::locale *)__dst);
                std::ostream::put(v101, v103);
                std::ostream::flush(v101);
LABEL_262:
                if (SHIBYTE(v181) < 0)
                  operator delete(__p[1]);
                xpc_release(v67);
                if (SHIBYTE(v187) < 0)
                  operator delete(v186[0]);
                goto LABEL_266;
              }
              v91 = sub_100001760(&std::cout, (uint64_t)"Baseband log collection: Success (ABM running)", 46);
              std::ios_base::getloc((const std::ios_base *)((char *)v91 + *(_QWORD *)(*v91 - 24)));
              v92 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
              v93 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v92->__vftable[2].~facet_0)(v92, 10);
              std::locale::~locale((std::locale *)__dst);
              std::ostream::put(v91, v93);
              std::ostream::flush(v91);
              v94 = object;
              if (object || (v94 = xpc_null_create()) != 0)
              {
                if (xpc_get_type(v94) == (xpc_type_t)&_xpc_type_dictionary)
                {
                  xpc_retain(v94);
                  v95 = v94;
                }
                else
                {
                  v95 = xpc_null_create();
                }
              }
              else
              {
                v95 = xpc_null_create();
                v94 = 0;
              }
              xpc_release(v94);
              if (value)
              {
                v105 = sub_100001760(&std::cout, (uint64_t)"Main archive path = ", 20);
                v106 = (const char *)abm::kKeyTimestampString;
                v107 = xpc_dictionary_get_value(v95, abm::kKeyTimestampString);
                v165.__r_.__value_.__r.__words[0] = (std::string::size_type)v107;
                if (v107)
                  xpc_retain(v107);
                else
                  v165.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
                memset(__dst, 0, 24);
                xpc::dyn_cast_or_default(v176, &v165, __dst);
                if ((__dst[23] & 0x80000000) != 0)
                  operator delete(*(void **)__dst);
                v111 = v191;
                abm::trace::getBasebandTraceDirSuffix(v174, (abm::trace *)v194, v110);
                sub_100014968(&v203, (uint64_t)v176, v111, 0, (uint64_t)v174);
                if ((v203.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v112 = &v203;
                else
                  v112 = (std::string *)v203.__r_.__value_.__r.__words[0];
                if ((v203.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  size = HIBYTE(v203.__r_.__value_.__r.__words[2]);
                else
                  size = v203.__r_.__value_.__l.__size_;
                v114 = sub_100001760(v105, (uint64_t)v112, size);
                std::ios_base::getloc((const std::ios_base *)((char *)v114 + *(_QWORD *)(*v114 - 24)));
                v115 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
                v116 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v115->__vftable[2].~facet_0)(v115, 10);
                std::locale::~locale((std::locale *)__dst);
                std::ostream::put(v114, v116);
                std::ostream::flush(v114);
                if (SHIBYTE(v203.__r_.__value_.__r.__words[2]) < 0)
                {
                  operator delete(v203.__r_.__value_.__l.__data_);
                  if ((v175 & 0x80000000) == 0)
                  {
LABEL_166:
                    if ((v177 & 0x80000000) == 0)
                      goto LABEL_167;
LABEL_171:
                    operator delete(v176[0]);
LABEL_167:
                    xpc_release(v165.__r_.__value_.__l.__data_);
                    v117 = sub_100001760(&std::cout, (uint64_t)"Lite archive path = ", 20);
                    v118 = xpc_dictionary_get_value(v95, v106);
                    v165.__r_.__value_.__r.__words[0] = (std::string::size_type)v118;
                    if (v118)
                      xpc_retain(v118);
                    else
                      v165.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
                    memset(__dst, 0, 24);
                    xpc::dyn_cast_or_default(v172, &v165, __dst);
                    if ((__dst[23] & 0x80000000) != 0)
                      operator delete(*(void **)__dst);
                    abm::trace::getBasebandTraceDirSuffix(v170, (abm::trace *)v194, v119);
                    sub_100014968(&v203, (uint64_t)v172, v111, 1, (uint64_t)v170);
                    if ((v203.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                      v120 = &v203;
                    else
                      v120 = (std::string *)v203.__r_.__value_.__r.__words[0];
                    if ((v203.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                      v121 = HIBYTE(v203.__r_.__value_.__r.__words[2]);
                    else
                      v121 = v203.__r_.__value_.__l.__size_;
                    v122 = sub_100001760(v117, (uint64_t)v120, v121);
                    std::ios_base::getloc((const std::ios_base *)((char *)v122 + *(_QWORD *)(*v122 - 24)));
                    v123 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
                    v124 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v123->__vftable[2].~facet_0)(v123, 10);
                    std::locale::~locale((std::locale *)__dst);
                    std::ostream::put(v122, v124);
                    std::ostream::flush(v122);
                    if (SHIBYTE(v203.__r_.__value_.__r.__words[2]) < 0)
                    {
                      operator delete(v203.__r_.__value_.__l.__data_);
                      if ((v171 & 0x80000000) == 0)
                      {
LABEL_183:
                        if ((v173 & 0x80000000) == 0)
                          goto LABEL_200;
                        goto LABEL_187;
                      }
                    }
                    else if ((v171 & 0x80000000) == 0)
                    {
                      goto LABEL_183;
                    }
                    operator delete(v170[0]);
                    if ((v173 & 0x80000000) == 0)
                      goto LABEL_200;
LABEL_187:
                    operator delete(v172[0]);
LABEL_200:
                    xpc_release(v165.__r_.__value_.__l.__data_);
                    xpc_release(v95);
                    goto LABEL_262;
                  }
                }
                else if ((v175 & 0x80000000) == 0)
                {
                  goto LABEL_166;
                }
                operator delete(v174[0]);
                if ((v177 & 0x80000000) == 0)
                  goto LABEL_167;
                goto LABEL_171;
              }
              v108 = sub_100001760(&std::cout, (uint64_t)"Path = ", 7);
              v109 = xpc_dictionary_get_value(v95, abm::kKeyTimestampString);
              v165.__r_.__value_.__r.__words[0] = (std::string::size_type)v109;
              if (v109)
                xpc_retain(v109);
              else
                v165.__r_.__value_.__r.__words[0] = (std::string::size_type)xpc_null_create();
              memset(__dst, 0, 24);
              xpc::dyn_cast_or_default(v168, &v165, __dst);
              if ((__dst[23] & 0x80000000) != 0)
                operator delete(*(void **)__dst);
              v126 = v191;
              abm::trace::getBasebandTraceDirSuffix(v166, (abm::trace *)v194, v125);
              sub_100014968(&v203, (uint64_t)v168, v126, 0, (uint64_t)v166);
              if ((v203.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v127 = &v203;
              else
                v127 = (std::string *)v203.__r_.__value_.__r.__words[0];
              if ((v203.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v128 = HIBYTE(v203.__r_.__value_.__r.__words[2]);
              else
                v128 = v203.__r_.__value_.__l.__size_;
              v129 = sub_100001760(v108, (uint64_t)v127, v128);
              std::ios_base::getloc((const std::ios_base *)((char *)v129 + *(_QWORD *)(*v129 - 24)));
              v130 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
              v131 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v130->__vftable[2].~facet_0)(v130, 10);
              std::locale::~locale((std::locale *)__dst);
              std::ostream::put(v129, v131);
              std::ostream::flush(v129);
              if (SHIBYTE(v203.__r_.__value_.__r.__words[2]) < 0)
              {
                operator delete(v203.__r_.__value_.__l.__data_);
                if ((v167 & 0x80000000) == 0)
                {
LABEL_199:
                  if ((v169 & 0x80000000) == 0)
                    goto LABEL_200;
LABEL_203:
                  operator delete(v168[0]);
                  goto LABEL_200;
                }
              }
              else if ((v167 & 0x80000000) == 0)
              {
                goto LABEL_199;
              }
              operator delete(v166[0]);
              if ((v169 & 0x80000000) == 0)
                goto LABEL_200;
              goto LABEL_203;
            }
            v165.__r_.__value_.__l.__size_ = 0xAAAAAAAAAAAAAAAALL;
            v165.__r_.__value_.__r.__words[2] = 0xAAAAAAAAAAAAAALL;
            v165.__r_.__value_.__r.__words[0] = 0xAAAAAAAAAAAAAA00;
            if ((TelephonyUtilIsInternalBuild(v87) & 1) == 0 && !TelephonyUtilIsCarrierBuild())
            {
LABEL_232:
              v143 = HIBYTE(v165.__r_.__value_.__r.__words[2]);
              if ((v165.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                v143 = v165.__r_.__value_.__l.__size_;
              if (v143)
              {
                v144 = sub_100001760(&std::cout, (uint64_t)"Baseband log collection: Success (ABM not running)", 50);
                sub_100011F7C(v144);
                v145 = sub_100001760(&std::cout, (uint64_t)"Path = ", 7);
                v146 = strlen(abm::trace::kSnapshotFolder);
                v147 = sub_100001760(v145, abm::trace::kSnapshotFolder, v146);
                v148 = strlen(abm::trace::kLogDirPrefix);
                v149 = sub_100001760(v147, abm::trace::kLogDirPrefix, v148);
                if ((v165.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v150 = &v165;
                else
                  v150 = (std::string *)v165.__r_.__value_.__r.__words[0];
                if ((v165.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v151 = HIBYTE(v165.__r_.__value_.__r.__words[2]);
                else
                  v151 = v165.__r_.__value_.__l.__size_;
                v152 = sub_100001760(v149, (uint64_t)v150, v151);
                abm::trace::getBasebandTraceDirSuffix(__dst, (abm::trace *)v194, v153);
                if (__dst[23] >= 0)
                  v154 = __dst;
                else
                  v154 = *(_BYTE **)__dst;
                if (__dst[23] >= 0)
                  v155 = __dst[23];
                else
                  v155 = *(_QWORD *)&__dst[8];
                v156 = sub_100001760(v152, (uint64_t)v154, v155);
                sub_100011F7C(v156);
              }
              else
              {
                memset(__dst, 170, 24);
                if (v194)
                  v157 = "QDSS.scratch";
                else
                  v157 = "DIAG.scratch";
                sub_100012510(__dst, v157);
                v158 = sub_100001760(&std::cout, (uint64_t)"Baseband log collection: Success (ABM not running)", 50);
                sub_100011F7C(v158);
                v159 = sub_100001760(&std::cout, (uint64_t)"Path = ", 7);
                v160 = strlen(abm::trace::kScratchFolder);
                v161 = sub_100001760(v159, abm::trace::kScratchFolder, v160);
                if (__dst[23] >= 0)
                  v162 = __dst;
                else
                  v162 = *(_BYTE **)__dst;
                if (__dst[23] >= 0)
                  v163 = __dst[23];
                else
                  v163 = *(_QWORD *)&__dst[8];
                v164 = sub_100001760(v161, (uint64_t)v162, v163);
                sub_100011F7C(v164);
              }
              if ((__dst[23] & 0x80000000) != 0)
                operator delete(*(void **)__dst);
              if (SHIBYTE(v165.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v165.__r_.__value_.__l.__data_);
              goto LABEL_262;
            }
            v209 = 0xAAAAAAAAAAAAAAAALL;
            v210 = 0xAAAAAAAAAAAAAAAALL;
            v207 = 0;
            v208 = 0;
            abm::HelperClient::create(&v209, "logdump.helper", &v207);
            v96 = v208;
            if (v208)
            {
              v97 = (unint64_t *)&v208->__shared_owners_;
              do
                v98 = __ldaxr(v97);
              while (__stlxr(v98 - 1, v97));
              if (!v98)
              {
                ((void (*)(std::__shared_weak_count *))v96->__on_zero_shared)(v96);
                std::__shared_weak_count::__release_weak(v96);
              }
            }
            v206 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
            v99 = xpc_dictionary_create(0, 0, 0);
            v100 = v99;
            if (v99)
            {
              v206 = v99;
            }
            else
            {
              v100 = xpc_null_create();
              v206 = v100;
              if (!v100)
              {
                v104 = xpc_null_create();
                v100 = 0;
                goto LABEL_205;
              }
            }
            if (xpc_get_type(v100) == (xpc_type_t)&_xpc_type_dictionary)
            {
              xpc_retain(v100);
              goto LABEL_206;
            }
            v104 = xpc_null_create();
LABEL_205:
            v206 = v104;
LABEL_206:
            xpc_release(v100);
            v132 = xpc_dictionary_create(0, 0, 0);
            if (v132 || (v132 = xpc_null_create()) != 0)
            {
              if (xpc_get_type(v132) == (xpc_type_t)&_xpc_type_dictionary)
              {
                xpc_retain(v132);
                v133 = v132;
              }
              else
              {
                v133 = xpc_null_create();
              }
            }
            else
            {
              v133 = xpc_null_create();
              v132 = 0;
            }
            xpc_release(v132);
            v134 = xpc_int64_create(1500);
            if (!v134)
              v134 = xpc_null_create();
            xpc_dictionary_set_value(v133, abm::helper::kKeyTimeout, v134);
            v135 = xpc_null_create();
            xpc_release(v134);
            xpc_release(v135);
            *(_QWORD *)&v136 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v136 + 1) = 0xAAAAAAAAAAAAAAAALL;
            *(_OWORD *)__dst = v136;
            *(_OWORD *)&__dst[16] = v136;
            v137 = v209;
            v204 = v133;
            if (v133)
              xpc_retain(v133);
            else
              v204 = xpc_null_create();
            abm::HelperClient::perform(__dst, v137, 4, abm::helper::kCommandSysdiagnoseStatus, &v204, &v206);
            xpc_release(v204);
            v204 = 0;
            if (!*(_DWORD *)__dst && xpc_get_type(v206) == (xpc_type_t)&_xpc_type_dictionary)
            {
              v138 = xpc_dictionary_get_value(v206, abm::helper::kKeyTimestampString);
              v202 = v138;
              if (v138)
                xpc_retain(v138);
              else
                v202 = xpc_null_create();
              xpc::dyn_cast_or_default(&v203, (xpc *)&v202, (const object *)&unk_10001ABDB, v139);
              if (SHIBYTE(v165.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v165.__r_.__value_.__l.__data_);
              v165 = v203;
              *((_BYTE *)&v203.__r_.__value_.__s + 23) = 0;
              v203.__r_.__value_.__s.__data_[0] = 0;
              xpc_release(v202);
            }
            if ((__dst[31] & 0x80000000) != 0)
              operator delete(*(void **)&__dst[8]);
            xpc_release(v133);
            xpc_release(v206);
            v140 = (std::__shared_weak_count *)v210;
            if (v210)
            {
              v141 = (unint64_t *)(v210 + 8);
              do
                v142 = __ldaxr(v141);
              while (__stlxr(v142 - 1, v141));
              if (!v142)
              {
                ((void (*)(std::__shared_weak_count *))v140->__on_zero_shared)(v140);
                std::__shared_weak_count::__release_weak(v140);
              }
            }
            goto LABEL_232;
          }
        }
        memmove(v84, v81, v83);
        goto LABEL_121;
      }
    }
    v64 = 0;
    value = 0;
    goto LABEL_93;
  }
  v48 = sub_100001760(&std::cout, (uint64_t)"Baseband logs are not enabled", 29);
  std::ios_base::getloc((const std::ios_base *)((char *)v48 + *(_QWORD *)(*v48 - 24)));
  v49 = std::locale::use_facet((const std::locale *)__dst, &std::ctype<char>::id);
  v50 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v49->__vftable[2].~facet_0)(v49, 10);
  std::locale::~locale((std::locale *)__dst);
  std::ostream::put(v48, v50);
  std::ostream::flush(v48);
  v30 = v26;
LABEL_266:
  if (SHIBYTE(v195.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v195.__r_.__value_.__l.__data_);
LABEL_39:
  v31 = v198;
  xpc_release(v30);
  if (SHIBYTE(v199) < 0)
    operator delete(*((void **)&v198 + 1));
  xpc_release(v6);
  return v31 == 0;
}

void sub_1000173C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,void *a48,uint64_t a49,int a50,__int16 a51,char a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,void *a58,uint64_t a59,int a60,__int16 a61,char a62,char a63)
{
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;

  xpc_release(*(xpc_object_t *)(v67 - 200));
  if (*(char *)(v67 - 129) < 0)
    operator delete(*(void **)(v67 - 152));
  xpc_release(v66);
  xpc_release(*(xpc_object_t *)(v67 - 128));
  sub_1000015D4(v67 - 104);
  if (a14 < 0)
    operator delete(__p);
  if (a42 < 0)
    operator delete(a37);
  xpc_release(v65);
  if (a53 < 0)
    operator delete(a48);
  if (a63 < 0)
    operator delete(a58);
  xpc_release(v64);
  if (*(char *)(v67 - 225) < 0)
    operator delete(*(void **)(v67 - 248));
  xpc_release(v63);
  _Unwind_Resume(a1);
}

BOOL sub_100017998(id a1, group *a2, list<std::string, std::allocator<std::string>> *a3)
{
  char *gr_name;
  unint64_t var0;
  char *v6;
  void **v7;
  _QWORD *v8;
  const std::locale::facet *v9;
  uint64_t v10;
  BOOL v11;
  void **v12;
  int v13;
  _QWORD *v14;
  _QWORD *v15;
  NSString *v16;
  char *v17;
  uint64_t v18;
  id v19;
  id v20;
  int v21;
  unsigned __int8 *v22;
  void **v23;
  size_t v24;
  size_t v25;
  char *v26;
  char *v27;
  size_t v28;
  void *v29;
  void *v30;
  size_t v31;
  void **v32;
  int v33;
  NSString *v35;
  void *v36;
  char *v37;
  uint64_t v38;
  size_t v39;
  int v41;
  NSString *v44;
  char *v45;
  void *__p[2];
  void *v47;
  std::locale v48;

  gr_name = a2->gr_name;
  if (a2->gr_name)
  {
    dispatch_retain((dispatch_object_t)a2->gr_name);
    dispatch_group_enter((dispatch_group_t)gr_name);
  }
  __p[0] = 0;
  __p[1] = 0;
  v47 = 0;
  var0 = a3->var1.var0;
  if (var0 < 2)
  {
    v8 = sub_100001760(&std::cout, (uint64_t)"os log collection: Failed", 25);
    std::ios_base::getloc((const std::ios_base *)((char *)v8 + *(_QWORD *)(*v8 - 24)));
    v9 = std::locale::use_facet(&v48, &std::ctype<char>::id);
    v10 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v9->__vftable[2].~facet_0)(v9, 10);
    std::locale::~locale(&v48);
    std::ostream::put(v8, v10);
    std::ostream::flush(v8);
    v11 = 0;
  }
  else
  {
    v6 = (char *)a3->var0.var0;
    v7 = (void **)((char *)a3->var0.var0 + 16);
    if (__p != v7)
    {
      if (v6[39] < 0)
      {
        sub_100002334(__p, *((void **)v6 + 2), *((_QWORD *)v6 + 3));
        v6 = (char *)a3->var0.var0;
        var0 = a3->var1.var0;
      }
      else
      {
        *(_OWORD *)__p = *(_OWORD *)v7;
        v47 = v7[2];
      }
    }
    if (SHIBYTE(v47) >= 0)
      v12 = __p;
    else
      v12 = (void **)__p[0];
    v13 = atoi((const char *)v12);
    v14 = *(_QWORD **)v6;
    v14[1] = *((_QWORD *)v6 + 1);
    **((_QWORD **)v6 + 1) = v14;
    a3->var1.var0 = var0 - 1;
    if (v6[39] < 0)
      operator delete(*((void **)v6 + 2));
    operator delete(v6);
    v15 = (char *)a3->var0.var0 + 16;
    if (*((char *)a3->var0.var0 + 39) < 0)
      v15 = (_QWORD *)*v15;
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v15);
    v17 = (char *)a3->var0.var0;
    v18 = *(_QWORD *)a3->var0.var0;
    *(_QWORD *)(v18 + 8) = *((_QWORD *)a3->var0.var0 + 1);
    **((_QWORD **)v17 + 1) = v18;
    --a3->var1.var0;
    if (v17[39] < 0)
    {
      operator delete(*((void **)v17 + 2));
      operator delete(v17);
      if (a3->var1.var0)
        goto LABEL_18;
    }
    else
    {
      operator delete(v17);
      if (a3->var1.var0)
      {
LABEL_18:
        v19 = objc_alloc_init((Class)NSMutableArray);
        v20 = objc_alloc_init((Class)NSMutableArray);
        if (!a3->var1.var0)
          goto LABEL_69;
        v44 = v16;
        v45 = gr_name;
        v21 = 0;
        while (1)
        {
          v22 = (unsigned __int8 *)a3->var0.var0;
          v23 = (void **)((char *)a3->var0.var0 + 16);
          if (__p != v23)
          {
            v24 = v22[39];
            if (SHIBYTE(v47) < 0)
            {
              v26 = (char *)*((_QWORD *)v22 + 2);
              v25 = *((_QWORD *)v22 + 3);
              if ((v24 & 0x80u) == 0)
                v27 = (char *)a3->var0.var0 + 16;
              else
                v27 = v26;
              if ((v24 & 0x80u) == 0)
                v28 = v24;
              else
                v28 = v25;
              sub_1000023F8(__p, v27, v28);
            }
            else if ((v24 & 0x80) != 0)
            {
              sub_100002334(__p, *((void **)v22 + 2), *((_QWORD *)v22 + 3));
            }
            else
            {
              *(_OWORD *)__p = *(_OWORD *)v23;
              v47 = v23[2];
            }
          }
          v29 = (void *)HIBYTE(v47);
          v30 = __p[1];
          if (SHIBYTE(v47) >= 0)
            v31 = HIBYTE(v47) != 0;
          else
            v31 = __p[1] != 0;
          if (SHIBYTE(v47) >= 0)
            v32 = __p;
          else
            v32 = (void **)__p[0];
          v33 = memcmp(v32, "-", v31);
          if ((_DWORD)v31 == 1 && v33 == 0)
          {
            if ((char)v29 >= 0)
              v30 = v29;
            if ((unint64_t)v30 >= 2)
              v39 = 2;
            else
              v39 = (size_t)v30;
            if (!memcmp(v32, "-p", v39) && v30 == (void *)2)
            {
              v21 = 112;
            }
            else
            {
              v41 = memcmp(v32, "-i", v39);
              if (v30 == (void *)2 && v41 == 0)
                v21 = 105;
              else
                v21 = 0;
            }
            goto LABEL_48;
          }
          if (v21 == 105)
            break;
          if (v21 == 112)
          {
            v35 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v32);
            v36 = v19;
LABEL_47:
            objc_msgSend(v36, "addObject:", v35);
          }
LABEL_48:
          v37 = (char *)a3->var0.var0;
          v38 = *(_QWORD *)a3->var0.var0;
          *(_QWORD *)(v38 + 8) = *((_QWORD *)a3->var0.var0 + 1);
          **((_QWORD **)v37 + 1) = v38;
          --a3->var1.var0;
          if (v37[39] < 0)
            operator delete(*((void **)v37 + 2));
          operator delete(v37);
          if (!a3->var1.var0)
          {
            gr_name = v45;
            v16 = v44;
            goto LABEL_69;
          }
        }
        v35 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v32);
        v36 = v20;
        goto LABEL_47;
      }
    }
    v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", CFSTR("CommCenter"), CFSTR("CommCenterMobileHelper"), CFSTR("CommCenterRootHelper"), CFSTR("abm-helper"), CFSTR("WirelessRadioManagerd"), CFSTR("com.apple.DiagnosticExtensions.Cellular"), CFSTR("powerd"), 0);
    v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", CFSTR("AppleBaseband"), 0);
LABEL_69:
    v11 = +[OsLogStream putOsLogStreamToFile:process:imagePath:history:](OsLogStream, "putOsLogStreamToFile:process:imagePath:history:", v16, v19, v20, (double)v13);

  }
  if (SHIBYTE(v47) < 0)
    operator delete(__p[0]);
  if (gr_name)
  {
    dispatch_group_leave((dispatch_group_t)gr_name);
    dispatch_release((dispatch_object_t)gr_name);
  }
  return v11;
}

void sub_100017E34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, dispatch_group_t group, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  NSObject *v24;

  if (a24 < 0)
  {
    operator delete(__p);
    if (!v24)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if (!v24)
  {
    goto LABEL_3;
  }
  dispatch_group_leave(v24);
  dispatch_release(v24);
  _Unwind_Resume(exception_object);
}

uint64_t LogdumpCommand::create@<X0>(char *a1@<X0>, uint64_t *a2@<X1>, void (__cdecl **a3)(std::__shared_weak_count *__hidden this)@<X2>, NSObject **a4@<X3>, std::__shared_weak_count_vtbl **a5@<X8>)
{
  std::__shared_weak_count_vtbl *v10;
  std::__shared_weak_count *v11;
  uint64_t v12;
  unint64_t *p_shared_weak_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  void (__cdecl *v16)(std::__shared_weak_count *__hidden);
  unint64_t *p_shared_owners;
  unint64_t v18;
  NSObject *v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  unint64_t *v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  std::__shared_weak_count *on_zero_shared;
  unint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t *v40;
  unint64_t v41;
  std::__shared_weak_count *v43;
  uint64_t v44;
  std::__shared_weak_count *v45;

  *a5 = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  a5[1] = (std::__shared_weak_count_vtbl *)0xAAAAAAAAAAAAAAAALL;
  v10 = (std::__shared_weak_count_vtbl *)operator new(0xE8uLL);
  v12 = *a2;
  v11 = (std::__shared_weak_count *)a2[1];
  if (v11)
  {
    p_shared_weak_owners = (unint64_t *)&v11->__shared_weak_owners_;
    do
      v14 = __ldxr(p_shared_weak_owners);
    while (__stxr(v14 + 1, p_shared_weak_owners));
  }
  v16 = *a3;
  v15 = (std::__shared_weak_count *)a3[1];
  v43 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v18 = __ldxr(p_shared_owners);
    while (__stxr(v18 + 1, p_shared_owners));
  }
  v19 = *a4;
  if (v19)
    dispatch_retain(v19);
  if (v11)
  {
    v20 = (unint64_t *)&v11->__shared_weak_owners_;
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }
  if (v15)
  {
    v22 = (unint64_t *)&v15->__shared_owners_;
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }
  if (v19)
    dispatch_retain(v19);
  v44 = v12;
  v45 = v11;
  if (v11)
  {
    v24 = (unint64_t *)&v11->__shared_weak_owners_;
    do
      v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }
  CommandBase::CommandBase((uint64_t)v10, a1, &v44);
  if (v45)
    std::__shared_weak_count::__release_weak(v45);
  v10->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))off_10001C730;
  v10[5].~__shared_weak_count_0 = v16;
  v10[5].__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v15;
  if (v15)
  {
    v26 = (unint64_t *)&v15->__shared_owners_;
    do
      v27 = __ldxr(v26);
    while (__stxr(v27 + 1, v26));
  }
  v10[5].__get_deleter = (const void *(__cdecl *)(const std::__shared_weak_count *__hidden, const std::type_info *))v19;
  if (v19)
  {
    dispatch_retain(v19);
    dispatch_release(v19);
  }
  if (v15)
  {
    v28 = (unint64_t *)&v15->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  if (v11)
    std::__shared_weak_count::__release_weak(v11);
  v10->~__shared_weak_count = (void (__cdecl *)(std::__shared_weak_count *__hidden))off_10001C998;
  *a5 = v10;
  v30 = (std::__shared_weak_count *)operator new(0x20uLL);
  v30->__shared_owners_ = 0;
  v31 = (unint64_t *)&v30->__shared_owners_;
  v30->__vftable = (std::__shared_weak_count_vtbl *)&off_10001CAC0;
  v30->__shared_weak_owners_ = 0;
  v30[1].__vftable = v10;
  a5[1] = (std::__shared_weak_count_vtbl *)v30;
  on_zero_shared = (std::__shared_weak_count *)v10->__on_zero_shared;
  if (on_zero_shared)
  {
    if (on_zero_shared->__shared_owners_ != -1)
      goto LABEL_47;
    do
      v33 = __ldxr(v31);
    while (__stxr(v33 + 1, v31));
    v34 = (unint64_t *)&v30->__shared_weak_owners_;
    do
      v35 = __ldxr(v34);
    while (__stxr(v35 + 1, v34));
    v10->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v10;
    v10->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v30;
    std::__shared_weak_count::__release_weak(on_zero_shared);
  }
  else
  {
    do
      v36 = __ldxr(v31);
    while (__stxr(v36 + 1, v31));
    v37 = (unint64_t *)&v30->__shared_weak_owners_;
    do
      v38 = __ldxr(v37);
    while (__stxr(v38 + 1, v37));
    v10->~__shared_weak_count_0 = (void (__cdecl *)(std::__shared_weak_count *__hidden))v10;
    v10->__on_zero_shared = (void (__cdecl *)(std::__shared_count *__hidden))v30;
  }
  do
    v39 = __ldaxr(v31);
  while (__stlxr(v39 - 1, v31));
  if (!v39)
  {
    ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
    std::__shared_weak_count::__release_weak(v30);
  }
LABEL_47:
  if (v19)
    dispatch_release(v19);
  if (v43)
  {
    v40 = (unint64_t *)&v43->__shared_owners_;
    do
      v41 = __ldaxr(v40);
    while (__stlxr(v41 - 1, v40));
    if (!v41)
    {
      ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
      std::__shared_weak_count::__release_weak(v43);
    }
  }
  if (v11)
    std::__shared_weak_count::__release_weak(v11);
  return (*((uint64_t (**)(std::__shared_weak_count_vtbl *))(*a5)->~__shared_weak_count + 2))(*a5);
}

void sub_100018190(_Unwind_Exception *a1)
{
  uint64_t v1;

  sub_1000015D4(v1);
  _Unwind_Resume(a1);
}

void sub_1000181A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, std::__shared_weak_count *a14)
{
  std::__shared_weak_count *v14;
  _QWORD *v15;
  NSObject *v16;

  sub_1000182D0(v15);
  if (v16)
  {
    dispatch_release(v16);
    sub_1000015D4((uint64_t)&a9);
    if (!v14)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else
  {
    sub_1000015D4((uint64_t)&a9);
    if (!v14)
      goto LABEL_6;
  }
  std::__shared_weak_count::__release_weak(v14);
  goto LABEL_6;
}

uint64_t sub_10001824C(_QWORD *a1)
{
  NSObject *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  *a1 = off_10001C730;
  v2 = a1[28];
  if (v2)
    dispatch_release(v2);
  v3 = (std::__shared_weak_count *)a1[27];
  if (!v3)
    return sub_10000BEAC((uint64_t)a1);
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  do
    v5 = __ldaxr(p_shared_owners);
  while (__stlxr(v5 - 1, p_shared_owners));
  if (v5)
    return sub_10000BEAC((uint64_t)a1);
  ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
  std::__shared_weak_count::__release_weak(v3);
  return sub_10000BEAC((uint64_t)a1);
}

void sub_1000182D0(_QWORD *a1)
{
  NSObject *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  void *v6;

  *a1 = off_10001C730;
  v2 = a1[28];
  if (v2)
    dispatch_release(v2);
  v3 = (std::__shared_weak_count *)a1[27];
  if (!v3)
    goto LABEL_7;
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  do
    v5 = __ldaxr(p_shared_owners);
  while (__stlxr(v5 - 1, p_shared_owners));
  if (!v5)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
    v6 = (void *)sub_10000BEAC((uint64_t)a1);
  }
  else
  {
LABEL_7:
    v6 = (void *)sub_10000BEAC((uint64_t)a1);
  }
  operator delete(v6);
}

void sub_100018360(std::__shared_weak_count *a1)
{
  void *v1;

  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_100018374(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t sub_10001838C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 == 0x800000010001B75ALL)
    return a1 + 24;
  if (((v3 & 0x800000010001B75ALL & 0x8000000000000000) != 0) == __OFSUB__(v3, 0x800000010001B75ALL))
    return 0;
  if (!strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x800000010001B75ALL & 0x7FFFFFFFFFFFFFFFLL)))
    return a1 + 24;
  return 0;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_activateStreamFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateStreamFromDate:");
}

id objc_msgSend_activityIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityIdentifier");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "category");
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "closeFile");
}

id objc_msgSend_composedMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "composedMessage");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createFileAtPath:contents:attributes:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeInterval:sinceDate:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_fileHandleForWritingAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandleForWritingAtPath:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSource:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_localStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localStore");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orPredicateWithSubpredicates:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_prepareWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareWithCompletionHandler:");
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "process");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_putOsLogStreamToFile_process_imagePath_history_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "putOsLogStreamToFile:process:imagePath:history:");
}

id objc_msgSend_secondsFromGMTForDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondsFromGMTForDate:");
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seekToEndOfFile");
}

id objc_msgSend_sender(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sender");
}

id objc_msgSend_setEventHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventHandler:");
}

id objc_msgSend_setFilterPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilterPredicate:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subsystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subsystem");
}

id objc_msgSend_threadIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "threadIdentifier");
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZone");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:");
}
