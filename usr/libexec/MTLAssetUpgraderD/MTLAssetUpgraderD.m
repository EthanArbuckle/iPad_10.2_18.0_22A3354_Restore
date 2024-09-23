void UsagePayload::UsagePayload(uint64_t a1, UsagePayload *this, int a3, int a4)
{
  std::string::size_type v6;
  uint64_t v7;
  char v8;

  *(_DWORD *)a1 = a3;
  *(_DWORD *)(a1 + 4) = a4;
  *(_QWORD *)(a1 + 1032) = 0;
  if (*((char *)this + 23) < 0)
  {
    v6 = *((_QWORD *)this + 1);
    if (v6 >= 0x401)
    {
      v8 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    v6 = *((unsigned __int8 *)this + 23);
  }
  std::string::copy((const std::string *)this, (std::string::value_type *)(a1 + 8), v6, 0);
  v7 = *((unsigned __int8 *)this + 23);
  if ((v7 & 0x80u) != 0)
    v7 = *((_QWORD *)this + 1);
  *(_QWORD *)(a1 + 1032) = v7;
  v8 = 1;
LABEL_8:
  *(_BYTE *)(a1 + 1040) = v8;
}

_QWORD *UsagePayload::UsagePayload(_QWORD *__dst, size_t __n, void *__src)
{
  __dst[129] = 0;
  *((_BYTE *)__dst + 1040) = 0;
  if (__n - 1033 >= 0xFFFFFFFFFFFFFBFFLL)
  {
    memcpy(__dst, __src, __n);
    __dst[129] = __n - 8;
    *((_BYTE *)__dst + 1040) = 1;
  }
  return __dst;
}

void UsagePayload::serialization(UsagePayload *this)
{
  operator new();
}

double UsagePayload::getArchiveArch@<D0>(UsagePayload *this@<X0>, uint64_t a2@<X8>)
{
  double result;
  __int128 __dst;
  uint64_t v6;

  std::string::basic_string[abi:ne180100](&__dst, (char *)this + 8, *((_QWORD *)this + 129));
  *(_OWORD *)a2 = __dst;
  *(_QWORD *)(a2 + 16) = v6;
  result = *(double *)this;
  *(_QWORD *)(a2 + 24) = *(_QWORD *)this;
  return result;
}

_QWORD **MTLArchiveUsageDB::MTLArchiveUsageDB(_QWORD **a1, uint64_t *a2)
{
  return MTLVersionedDB::MTLVersionedDB(a1, a2, 4, 1, 1);
}

void MTLArchiveUsageDB::store(MTLVersionedDB *a1, UsagePayload *a2, int a3, int a4, uint64_t a5)
{
  _QWORD v10[2];
  timeval v11;
  _BYTE v12[1032];

  gettimeofday(&v11, 0);
  v10[1] = v11.tv_sec - a5;
  UsagePayload::UsagePayload((uint64_t)v12, a2, a3, a4);
  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)v10, a1);
  if (v10[0])
    operator new();
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)v10);
}

void sub_1000044F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&a9);
  _Unwind_Resume(a1);
}

void MTLArchiveUsageDB::prune(MTLArchiveUsageDB *this, uint64_t a2)
{
  __darwin_time_t tv_sec;
  int v5;
  char *v6;
  uint64_t v7;
  int v8;
  unint64_t v9;
  _QWORD v10[2];
  uint64_t v11;
  uint64_t v12;
  timeval v13;
  _QWORD v14[3];

  gettimeofday(&v13, 0);
  tv_sec = v13.tv_sec;
  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v12, this);
  if (v12)
  {
    v11 = 0;
    v5 = mdb_cursor_open(v12, *((_DWORD *)this + 2), &v11);
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v6 = mdb_strerror(v5);
        MTLArchiveUsageDB::prune((uint64_t)v6, (uint64_t)v14, v7);
      }
    }
    else
    {
      v8 = mdb_cursor_get(v11, v14, v10, 0);
      v9 = tv_sec - a2;
      while (v8 != -30798)
      {
        if (*(_QWORD *)v14[1] < v9)
          mdb_cursor_del(v11, 32);
        v8 = mdb_cursor_get(v11, v14, v10, 11);
      }
    }
  }
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v12);
}

void sub_10000466C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)va);
  _Unwind_Resume(a1);
}

uint64_t MTLArchiveUsageDB::getPrioritizedList@<X0>(MTLArchiveUsageDB *this@<X0>, uint64_t *a2@<X8>)
{
  int v4;
  char *v5;
  uint64_t v6;
  int i;
  size_t v8;
  size_t v9;
  _DWORD *v10;
  unint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  __int128 *j;
  std::string::size_type size;
  std::string __p;
  std::string::size_type v19;
  size_t v20[2];
  uint64_t v21[2];
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  int v26;
  std::string v27;
  std::string __dst[43];
  size_t v29;
  char v30;

  v24 = 0u;
  v25 = 0u;
  v26 = 1065353216;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v23, this);
  if (v23)
  {
    v22 = 0;
    v4 = mdb_cursor_open(v23, *((_DWORD *)this + 2), &v22);
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v5 = mdb_strerror(v4);
        MTLArchiveUsageDB::prune((uint64_t)v5, (uint64_t)__dst, v6);
      }
    }
    else
    {
      for (i = mdb_cursor_get(v22, v21, v20, 0); i != -30798; i = mdb_cursor_get(v22, v21, v20, 8))
      {
        if (!MTLVersionedDB::isVersionEntry((uint64_t)this, v21[0], (char *)v21[1]))
        {
          v8 = 0;
          v9 = v20[0];
          v29 = 0;
          v30 = 0;
          if (v20[0] - 1033 >= 0xFFFFFFFFFFFFFBFFLL)
          {
            memcpy(__dst, (const void *)v20[1], v20[0]);
            v8 = v9 - 8;
            v29 = v9 - 8;
            v30 = 1;
          }
          std::string::basic_string[abi:ne180100](&v27, &__dst[0].__r_.__value_.__r.__words[1], v8);
          __p = v27;
          v19 = __dst[0].__r_.__value_.__r.__words[0];
          v27.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
          v10 = std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__emplace_unique_key_args<std::tuple<std::string,unsigned int,unsigned int>,std::piecewise_construct_t const&,std::tuple<std::tuple<std::string,unsigned int,unsigned int>&&>,std::tuple<>>((uint64_t)&v24, (uint64_t)&__p, (uint64_t)std::piecewise_construct, (__int128 **)&v27);
          ++v10[12];
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
        }
      }
      memset(&__p, 0, sizeof(__p));
      v11 = 0;
      if ((_QWORD)v25)
      {
        v12 = (_QWORD *)v25;
        do
        {
          ++v11;
          v12 = (_QWORD *)*v12;
        }
        while (v12);
      }
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__init_with_size[abi:ne180100]<std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>,std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>>(&__p, (uint64_t *)v25, 0, v11);
      v13 = 126
          - 2
          * __clz(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3));
      if (__p.__r_.__value_.__l.__size_ == __p.__r_.__value_.__r.__words[0])
        v14 = 0;
      else
        v14 = v13;
      std::__introsort<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *,false>((uint64_t)__p.__r_.__value_.__l.__data_, (_QWORD *)__p.__r_.__value_.__l.__size_, v14, 1);
      size = __p.__r_.__value_.__l.__size_;
      for (j = (__int128 *)__p.__r_.__value_.__r.__words[0]; j != (__int128 *)size; j = (__int128 *)((char *)j + 40))
      {
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,std::string,unsigned int,unsigned int>::__tuple_impl(__dst, j);
        std::vector<std::tuple<std::string,unsigned int,unsigned int>>::push_back[abi:ne180100](a2, (__int128 *)__dst);
        if (SHIBYTE(__dst[0].__r_.__value_.__r.__words[2]) < 0)
          operator delete(__dst[0].__r_.__value_.__l.__data_);
      }
      __dst[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__destroy_vector::operator()[abi:ne180100]((void ***)__dst);
    }
  }
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v23);
  return std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)&v24);
}

void sub_100004924(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  _Unwind_Resume(exception_object);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__dst, void *__src, size_t __len)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = __len;
    v6 = __dst;
    if (!__len)
      goto LABEL_9;
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __dst;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_100004AC0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__deallocate_node(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::vector<std::tuple<std::string,unsigned int,unsigned int>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::tuple<std::string,unsigned int,unsigned int>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::tuple<std::string,unsigned int,unsigned int>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 32)
  {
    if (*(char *)(i - 9) < 0)
      operator delete(*(void **)(i - 32));
  }
  a1[1] = v2;
}

void *std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__emplace_unique_key_args<std::tuple<std::string,unsigned int,unsigned int>,std::piecewise_construct_t const&,std::tuple<std::tuple<std::string,unsigned int,unsigned int>&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, __int128 **a4)
{
  uint64_t v4;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  void **v15;
  void *i;
  unint64_t v17;
  _QWORD *v18;
  __int128 *v19;
  __int128 v20;
  float v21;
  float v22;
  _BOOL8 v23;
  unint64_t v24;
  unint64_t v25;
  size_t v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  _BYTE v31[8];
  uint64_t v32;
  char v33;

  v8 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v31, a2);
  v9 = *(unsigned int *)(a2 + 28);
  v10 = v8 ^ (2 * *(unsigned int *)(a2 + 24));
  v11 = v10 ^ (4 * v9);
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      v4 = v10 ^ (4 * v9);
      if (v11 >= v12)
        v4 = v11 % v12;
    }
    else
    {
      v4 = v11 & (v12 - 1);
    }
    v15 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v15)
    {
      for (i = *v15; i; i = *(void **)i)
      {
        v17 = *((_QWORD *)i + 1);
        if (v17 == v11)
        {
          if (std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>>((uint64_t)v31, (unsigned __int8 *)i + 16, (unsigned __int8 *)a2)&& *((_DWORD *)i + 10) == *(_DWORD *)(a2 + 24)&& *((_DWORD *)i + 11) == *(_DWORD *)(a2 + 28))
          {
            return i;
          }
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12)
              v17 %= v12;
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4)
            break;
        }
      }
    }
  }
  v18 = (_QWORD *)(a1 + 16);
  i = operator new(0x38uLL);
  v32 = a1 + 16;
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v11;
  v19 = *a4;
  v20 = **a4;
  *((_QWORD *)i + 4) = *((_QWORD *)*a4 + 2);
  *((_OWORD *)i + 1) = v20;
  *((_QWORD *)v19 + 1) = 0;
  *((_QWORD *)v19 + 2) = 0;
  *(_QWORD *)v19 = 0;
  *((_DWORD *)i + 10) = *((_DWORD *)v19 + 6);
  *((_DWORD *)i + 11) = *((_DWORD *)v19 + 7);
  *((_DWORD *)i + 12) = 0;
  v33 = 1;
  v21 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    v23 = 1;
    if (v12 >= 3)
      v23 = (v12 & (v12 - 1)) != 0;
    v24 = v23 | (2 * v12);
    v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25)
      v26 = v25;
    else
      v26 = v24;
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>(a1, v26);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v4 = v11 % v12;
      else
        v4 = v11;
    }
    else
    {
      v4 = (v12 - 1) & v11;
    }
  }
  v27 = *(_QWORD *)a1;
  v28 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v28)
  {
    *(_QWORD *)i = *v28;
LABEL_40:
    *v28 = i;
    goto LABEL_41;
  }
  *(_QWORD *)i = *v18;
  *v18 = i;
  *(_QWORD *)(v27 + 8 * v4) = v18;
  if (*(_QWORD *)i)
  {
    v29 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v29 >= v12)
        v29 %= v12;
    }
    else
    {
      v29 &= v12 - 1;
    }
    v28 = (_QWORD *)(*(_QWORD *)a1 + 8 * v29);
    goto LABEL_40;
  }
LABEL_41:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_100004EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void **v10;
  uint64_t v11;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  char v5;

  v2 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      v11 = v7 + v9;
      v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v14 = v8 + a3 + v7 + v4;
      v15 = v14 + v5;
      v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v18 = v17 + v6 + v9;
      v19 = __ROR8__(v18, 44);
      v20 = v18 + v10;
      v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      v23 = *a2;
      v22 = a2 + 4;
      v24 = v23 - 0x4B6D499041670D8DLL * v5;
      v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v26 = *(v22 - 3);
        v27 = v24 + v15 + v11 + v26;
        v28 = v22[2];
        v29 = v22[3];
        v30 = v22[1];
        v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        v31 = v13 + v20;
        v32 = *(v22 - 2);
        v33 = *(v22 - 1);
        v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        v35 = v34 + v20 + v33;
        v36 = v34 + v26 + v32;
        v15 = v36 + v33;
        v37 = __ROR8__(v36, 44) + v34;
        v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        v16 = v37 + __ROR8__(v35 + v38, 21);
        v39 = v24 + v21 + *v22;
        v20 = v39 + v30 + v28 + v29;
        v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        v13 = v38;
        v25 += 64;
      }
      while (v25);
      v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (a2 < 9)
  {
    if (a2 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    v3 = *(_QWORD *)((char *)a1 + a2 - 8);
    v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = 0xB492B66FBE98F273 * *a1;
  v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8);
  v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v2 = *(_QWORD *)((char *)a1 + a2 - 16);
  v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  v5 = a1[2];
  v4 = a1[3];
  v6 = __ROR8__(v3 + v4, 52);
  v7 = v3 + a1[1];
  v8 = __ROR8__(v7, 7);
  v9 = v7 + v5;
  v10 = *(_QWORD *)((char *)a1 + a2 - 32) + v5;
  v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  v12 = *(_QWORD *)((char *)a1 + a2 - 24) + v10 + v2;
  v13 = 0xC3A5C85C97CB3127 * (v12 + *(_QWORD *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v14;
  uint64_t result;

  v3 = a3;
  v4 = a2[23];
  if ((v4 & 0x80u) == 0)
    v5 = a2[23];
  else
    v5 = *((_QWORD *)a2 + 1);
  v6 = a3[23];
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v5 != v6)
    return 0;
  if (v7 < 0)
    v3 = *(unsigned __int8 **)a3;
  if ((v4 & 0x80) != 0)
    return memcmp(*(const void **)a2, v3, *((_QWORD *)a2 + 1)) == 0;
  if (!a2[23])
    return 1;
  v8 = v4 - 1;
  do
  {
    v10 = *a2++;
    v9 = v10;
    v12 = *v3++;
    v11 = v12;
    v14 = v8-- != 0;
    result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
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
      std::__throw_bad_array_new_length[abi:ne180100]();
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

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0)
      operator delete(__p[2]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

std::string *std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__init_with_size[abi:ne180100]<std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>,std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>>(std::string *result, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  std::string *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>,std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_100005704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x666666666666667)
    std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

void std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(40 * a2);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>,std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>(uint64_t a1, uint64_t *a2, uint64_t *a3, std::string *this)
{
  std::string *v4;
  __int128 *v6;
  _QWORD v8[3];
  char v9;
  std::string *v10;
  std::string *v11;

  v4 = this;
  v10 = this;
  v11 = this;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  v9 = 0;
  if (a2 != a3)
  {
    v6 = (__int128 *)a2;
    do
    {
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,std::string,unsigned int,unsigned int>::__tuple_impl(v4, v6 + 1);
      LODWORD(v4[1].__r_.__value_.__r.__words[1]) = *((_DWORD *)v6 + 12);
      v6 = *(__int128 **)v6;
      v4 = (std::string *)((char *)v11 + 40);
      v11 = (std::string *)((char *)v11 + 40);
    }
    while (v6 != (__int128 *)a3);
  }
  v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_100005860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

std::string *std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,std::string,unsigned int,unsigned int>::__tuple_impl(std::string *this, __int128 *a2)
{
  __int128 v4;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  LODWORD(this[1].__r_.__value_.__l.__data_) = *((_DWORD *)a2 + 6);
  HIDWORD(this[1].__r_.__value_.__r.__words[0]) = *((_DWORD *)a2 + 7);
  return this;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 17) < 0)
      operator delete(*(void **)(v1 - 40));
    v1 -= 40;
  }
}

void std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 40)
  {
    if (*(char *)(i - 17) < 0)
      operator delete(*(void **)(i - 40));
  }
  a1[1] = v2;
}

void std::__introsort<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *,false>(uint64_t a1, _QWORD *a2, uint64_t a3, char a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  unsigned int v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unsigned int v25;
  unint64_t v26;
  unsigned int v27;
  unint64_t v28;
  __int128 v29;
  int v30;
  int v31;
  int v32;
  unsigned int v33;
  unsigned int v34;
  BOOL v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  unsigned int v39;
  unint64_t v40;
  unsigned int v41;
  unint64_t v42;
  unint64_t v43;
  unsigned int v44;
  uint64_t v45;
  __int128 v46;
  int v47;
  int v48;
  int v49;
  unsigned int v50;
  unsigned int v51;
  __int128 v52;
  int v53;
  int v54;
  int v55;
  _QWORD *v56;
  BOOL v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  unsigned int v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int64_t v69;
  int64_t v70;
  int64_t v71;
  uint64_t v72;
  __n128 *v73;
  unsigned __int32 v74;
  unsigned __int32 v75;
  unsigned __int32 v76;
  __n128 *v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unsigned __int32 v81;
  unsigned __int32 v82;
  int64_t v83;
  void **v84;
  uint64_t v85;
  void **v86;
  int v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unsigned int v94;
  unsigned int v95;
  uint64_t v96;
  unint64_t v97;
  unsigned int v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  unsigned int *v103;
  _QWORD *v104;
  unsigned int v105;
  uint64_t v106;
  char v107;
  uint64_t v108;
  unsigned int *v109;
  unsigned int *v110;
  unsigned int v111;
  __int128 *v112;
  __int128 *v113;
  __int128 *v114;
  unsigned __int8 v115;
  int v116;
  unint64_t v118;
  void *v119;
  unint64_t v120;
  char v121;
  char v122;
  _BYTE v123[15];
  _BYTE v124[15];
  _BYTE v125[15];
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _BYTE v130[15];
  _BYTE v131[15];
  _BYTE v132[15];
  _BYTE v133[15];
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;

LABEL_1:
  v113 = (__int128 *)(a2 - 10);
  v114 = (__int128 *)(a2 - 5);
  v112 = (__int128 *)(a2 - 15);
  v7 = a1;
  v120 = (unint64_t)a2;
  while (2)
  {
    a1 = v7;
    v8 = (uint64_t)a2 - v7;
    v9 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)((uint64_t)a2 - v7) >> 3);
    switch(v9)
    {
      case 0:
      case 1:
        return;
      case 2:
        if (*((_DWORD *)a2 - 2) > *(_DWORD *)(a1 + 32))
        {
          v137 = *(_QWORD *)(a1 + 16);
          v129 = *(_OWORD *)a1;
          v52 = *(_OWORD *)(a2 - 5);
          *(_QWORD *)(a1 + 16) = *(a2 - 3);
          *(_OWORD *)a1 = v52;
          *(a2 - 3) = v137;
          *(_OWORD *)(a2 - 5) = v129;
          v53 = *(_DWORD *)(a1 + 24);
          *(_DWORD *)(a1 + 24) = *((_DWORD *)a2 - 4);
          *((_DWORD *)a2 - 4) = v53;
          v54 = *(_DWORD *)(a1 + 28);
          *(_DWORD *)(a1 + 28) = *((_DWORD *)a2 - 3);
          *((_DWORD *)a2 - 3) = v54;
          v55 = *(_DWORD *)(a1 + 32);
          *(_DWORD *)(a1 + 32) = *((_DWORD *)a2 - 2);
          *((_DWORD *)a2 - 2) = v55;
        }
        return;
      case 3:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((__int128 *)a1, (__int128 *)(a1 + 40), v114);
        return;
      case 4:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>(a1, a1 + 40, a1 + 80, (uint64_t)v114);
        return;
      case 5:
        std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *,0>((__n128 *)a1, (__n128 *)(a1 + 40), (__n128 *)(a1 + 80), (__n128 *)(a1 + 120), (__n128 *)v114);
        return;
      default:
        if (v8 <= 959)
        {
          v56 = (_QWORD *)(a1 + 40);
          v58 = (_QWORD *)a1 == a2 || v56 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v58)
            {
              v59 = 0;
              v60 = a1;
              do
              {
                v61 = v56;
                v62 = *(_DWORD *)(v60 + 72);
                if (v62 > *(_DWORD *)(v60 + 32))
                {
                  v63 = *v56;
                  *(_QWORD *)v130 = *(_QWORD *)(v60 + 48);
                  *(_QWORD *)&v130[7] = *(_QWORD *)(v60 + 55);
                  v64 = *(_BYTE *)(v60 + 63);
                  v56[1] = 0;
                  v56[2] = 0;
                  *v56 = 0;
                  v65 = *(_QWORD *)(v60 + 64);
                  v66 = v59;
                  while (1)
                  {
                    v67 = a1 + v66;
                    std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>(a1 + v66 + 40, (__n128 *)(a1 + v66));
                    *(_DWORD *)(a1 + v66 + 72) = *(_DWORD *)(a1 + v66 + 32);
                    if (!v66)
                      break;
                    v66 -= 40;
                    if (v62 <= *(_DWORD *)(v67 - 8))
                    {
                      v68 = a1 + v66 + 40;
                      goto LABEL_79;
                    }
                  }
                  v68 = a1;
LABEL_79:
                  if (*(char *)(v68 + 23) < 0)
                    operator delete(*(void **)v68);
                  *(_QWORD *)v68 = v63;
                  *(_QWORD *)(v68 + 8) = *(_QWORD *)v130;
                  *(_QWORD *)(v68 + 15) = *(_QWORD *)&v130[7];
                  *(_BYTE *)(v68 + 23) = v64;
                  *(_QWORD *)(v68 + 24) = v65;
                  *(_DWORD *)(v68 + 32) = v62;
                }
                v56 = v61 + 5;
                v59 += 40;
                v60 = (uint64_t)v61;
              }
              while (v61 + 5 != (_QWORD *)v120);
            }
          }
          else if (!v58)
          {
            v103 = (unsigned int *)(a1 + 72);
            do
            {
              v104 = v56;
              v105 = *(_DWORD *)(a1 + 72);
              if (v105 > *(_DWORD *)(a1 + 32))
              {
                v106 = *v56;
                *(_QWORD *)v133 = *(_QWORD *)(a1 + 48);
                *(_QWORD *)&v133[7] = *(_QWORD *)(a1 + 55);
                v107 = *(_BYTE *)(a1 + 63);
                v56[1] = 0;
                v56[2] = 0;
                *v56 = 0;
                v108 = *(_QWORD *)(a1 + 64);
                v109 = v103;
                do
                {
                  v110 = v109;
                  std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>((uint64_t)(v109 - 8), (__n128 *)(v109 - 18));
                  v111 = *(v109 - 10);
                  v109 -= 10;
                  *v110 = v111;
                }
                while (v105 > *(v110 - 20));
                if (*((char *)v109 - 9) < 0)
                  operator delete(*((void **)v109 - 4));
                *((_QWORD *)v109 - 4) = v106;
                *(_QWORD *)((char *)v109 - 17) = *(_QWORD *)&v133[7];
                *((_QWORD *)v109 - 3) = *(_QWORD *)v133;
                *((_BYTE *)v109 - 9) = v107;
                *((_QWORD *)v109 - 1) = v108;
                *v109 = v105;
              }
              v56 = v104 + 5;
              v103 += 10;
              a1 = (uint64_t)v104;
            }
            while (v104 + 5 != (_QWORD *)v120);
          }
          return;
        }
        if (!a3)
        {
          if ((_QWORD *)a1 != a2)
          {
            v69 = (unint64_t)(v9 - 2) >> 1;
            v70 = v69;
            do
            {
              v71 = v70;
              if (v69 >= v70)
              {
                v72 = (2 * v70) | 1;
                v73 = (__n128 *)(a1 + 40 * v72);
                if (2 * v71 + 2 < v9)
                {
                  v74 = *(_DWORD *)(a1 + 40 * v72 + 32);
                  v75 = v73[4].n128_u32[2];
                  v73 = (__n128 *)((char *)v73 + 40 * (v74 > v75));
                  if (v74 > v75)
                    v72 = 2 * v71 + 2;
                }
                v76 = *(_DWORD *)(a1 + 40 * v71 + 32);
                if (v73[2].n128_u32[0] <= v76)
                {
                  v77 = (__n128 *)(a1 + 40 * v71);
                  v118 = v77->n128_u64[0];
                  *(_QWORD *)&v131[7] = *(unint64_t *)((char *)&v77->n128_u64[1] + 7);
                  *(_QWORD *)v131 = v77->n128_u64[1];
                  v115 = v77[1].n128_u8[7];
                  v77->n128_u64[0] = 0;
                  v77->n128_u64[1] = 0;
                  v77[1].n128_u64[0] = 0;
                  v78 = v77[1].n128_u64[1];
                  do
                  {
                    v79 = (uint64_t)v77;
                    v77 = v73;
                    std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>(v79, v73);
                    *(_DWORD *)(v79 + 32) = v77[2].n128_u32[0];
                    if (v69 < v72)
                      break;
                    v80 = (2 * v72) | 1;
                    v73 = (__n128 *)(a1 + 40 * v80);
                    if (2 * v72 + 2 < v9)
                    {
                      v81 = *(_DWORD *)(a1 + 40 * v80 + 32);
                      v82 = v73[4].n128_u32[2];
                      v73 = (__n128 *)((char *)v73 + 40 * (v81 > v82));
                      if (v81 > v82)
                        v80 = 2 * v72 + 2;
                    }
                    v72 = v80;
                  }
                  while (v73[2].n128_u32[0] <= v76);
                  if (v77[1].n128_i8[7] < 0)
                    operator delete((void *)v77->n128_u64[0]);
                  v77->n128_u64[0] = v118;
                  v77->n128_u64[1] = *(_QWORD *)v131;
                  *(unint64_t *)((char *)&v77->n128_u64[1] + 7) = *(_QWORD *)&v131[7];
                  v77[1].n128_u8[7] = v115;
                  v77[1].n128_u64[1] = v78;
                  v77[2].n128_u32[0] = v76;
                }
              }
              v70 = v71 - 1;
            }
            while (v71);
            v83 = v8 / 0x28uLL;
            v84 = (void **)v120;
            do
            {
              v85 = 0;
              v119 = *(void **)a1;
              v86 = v84;
              *(_QWORD *)v125 = *(_QWORD *)(a1 + 8);
              *(_QWORD *)&v125[7] = *(_QWORD *)(a1 + 15);
              v121 = *(_BYTE *)(a1 + 23);
              *(_QWORD *)(a1 + 8) = 0;
              *(_QWORD *)(a1 + 16) = 0;
              *(_QWORD *)a1 = 0;
              v87 = *(_DWORD *)(a1 + 24);
              v116 = *(_DWORD *)(a1 + 28);
              v88 = a1;
              v89 = *(_DWORD *)(a1 + 32);
              do
              {
                v90 = v85 + 1;
                v91 = v88 + 40 * (v85 + 1);
                v92 = (2 * v85) | 1;
                v93 = 2 * v85 + 2;
                if (v93 < v83)
                {
                  v94 = *(_DWORD *)(v88 + 40 * v90 + 32);
                  v95 = *(_DWORD *)(v91 + 72);
                  v91 += 40 * (v94 > v95);
                  if (v94 > v95)
                    v92 = v93;
                }
                std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>(v88, (__n128 *)v91);
                *(_DWORD *)(v88 + 32) = *(_DWORD *)(v91 + 32);
                v88 = v91;
                v85 = v92;
              }
              while (v92 <= (uint64_t)((unint64_t)(v83 - 2) >> 1));
              v84 -= 5;
              if ((void **)v91 == v86 - 5)
              {
                if (*(char *)(v91 + 23) < 0)
                  operator delete(*(void **)v91);
                *(_QWORD *)v91 = v119;
                *(_QWORD *)(v91 + 8) = *(_QWORD *)v125;
                *(_QWORD *)(v91 + 15) = *(_QWORD *)&v125[7];
                *(_BYTE *)(v91 + 23) = v121;
                *(_DWORD *)(v91 + 24) = v87;
                *(_DWORD *)(v91 + 28) = v116;
                *(_DWORD *)(v91 + 32) = v89;
              }
              else
              {
                std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>(v91, (__n128 *)(v86 - 5));
                *(_DWORD *)(v91 + 32) = *((_DWORD *)v86 - 2);
                if (*((char *)v86 - 17) < 0)
                  operator delete(*v84);
                *(v86 - 5) = v119;
                *(void **)((char *)v86 - 25) = *(void **)&v125[7];
                *(v86 - 4) = *(void **)v125;
                *((_BYTE *)v86 - 17) = v121;
                *((_DWORD *)v86 - 4) = v87;
                *((_DWORD *)v86 - 3) = v116;
                *((_DWORD *)v86 - 2) = v89;
                v96 = v91 + 40 - a1;
                if (v96 >= 41)
                {
                  v97 = (v96 / 0x28uLL - 2) >> 1;
                  v98 = *(_DWORD *)(v91 + 32);
                  if (*(_DWORD *)(a1 + 40 * v97 + 32) > v98)
                  {
                    v99 = *(void **)v91;
                    *(_QWORD *)v132 = *(_QWORD *)(v91 + 8);
                    *(_QWORD *)&v132[7] = *(_QWORD *)(v91 + 15);
                    v122 = *(_BYTE *)(v91 + 23);
                    *(_QWORD *)(v91 + 8) = 0;
                    *(_QWORD *)(v91 + 16) = 0;
                    *(_QWORD *)v91 = 0;
                    v100 = *(_QWORD *)(v91 + 24);
                    do
                    {
                      v101 = v91;
                      v91 = a1 + 40 * v97;
                      std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>(v101, (__n128 *)v91);
                      *(_DWORD *)(v101 + 32) = *(_DWORD *)(v91 + 32);
                      if (!v97)
                        break;
                      v97 = (v97 - 1) >> 1;
                    }
                    while (*(_DWORD *)(a1 + 40 * v97 + 32) > v98);
                    if (*(char *)(v91 + 23) < 0)
                      operator delete(*(void **)v91);
                    *(_QWORD *)v91 = v99;
                    *(_QWORD *)(v91 + 15) = *(_QWORD *)&v132[7];
                    *(_QWORD *)(v91 + 8) = *(_QWORD *)v132;
                    *(_BYTE *)(v91 + 23) = v122;
                    *(_QWORD *)(v91 + 24) = v100;
                    *(_DWORD *)(v91 + 32) = v98;
                  }
                }
              }
            }
            while (v83-- > 2);
          }
          return;
        }
        v10 = (unint64_t)v9 >> 1;
        v11 = a1 + 40 * ((unint64_t)v9 >> 1);
        if ((unint64_t)v8 < 0x1401)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((__int128 *)v11, (__int128 *)a1, v114);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((__int128 *)a1, (__int128 *)v11, v114);
          v12 = 5 * v10;
          v13 = a1 + 8 * v12;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((__int128 *)(a1 + 40), (__int128 *)(v13 - 40), v113);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((__int128 *)(a1 + 80), (__int128 *)(a1 + 40 + 8 * v12), v112);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((__int128 *)(v13 - 40), (__int128 *)v11, (__int128 *)(a1 + 40 + 8 * v12));
          v134 = *(_QWORD *)(a1 + 16);
          v126 = *(_OWORD *)a1;
          v14 = *(_QWORD *)(v11 + 16);
          *(_OWORD *)a1 = *(_OWORD *)v11;
          *(_QWORD *)(a1 + 16) = v14;
          *(_QWORD *)(v11 + 16) = v134;
          *(_OWORD *)v11 = v126;
          v15 = *(_QWORD *)(a1 + 24);
          *(_QWORD *)(a1 + 24) = *(_QWORD *)(v11 + 24);
          *(_QWORD *)(v11 + 24) = v15;
          LODWORD(v14) = *(_DWORD *)(a1 + 32);
          *(_DWORD *)(a1 + 32) = *(_DWORD *)(v13 + 32);
          *(_DWORD *)(v13 + 32) = v14;
        }
        --a3;
        a2 = (_QWORD *)v120;
        if ((a4 & 1) == 0)
        {
          v16 = *(_DWORD *)(a1 + 32);
          if (*(_DWORD *)(a1 - 8) > v16)
            goto LABEL_11;
          v36 = *(_QWORD *)a1;
          *(_QWORD *)v124 = *(_QWORD *)(a1 + 8);
          *(_QWORD *)&v124[7] = *(_QWORD *)(a1 + 15);
          v37 = *(_BYTE *)(a1 + 23);
          *(_QWORD *)(a1 + 8) = 0;
          *(_QWORD *)(a1 + 16) = 0;
          *(_QWORD *)a1 = 0;
          if (v16 <= *(_DWORD *)(v120 - 8))
          {
            v40 = a1 + 40;
            do
            {
              v7 = v40;
              if (v40 >= v120)
                break;
              v41 = *(_DWORD *)(v40 + 32);
              v40 += 40;
            }
            while (v16 <= v41);
          }
          else
          {
            v38 = a1;
            do
            {
              v7 = v38 + 40;
              v39 = *(_DWORD *)(v38 + 72);
              v38 += 40;
            }
            while (v16 <= v39);
          }
          v42 = v120;
          if (v7 < v120)
          {
            v43 = v120;
            do
            {
              v42 = v43 - 40;
              v44 = *(_DWORD *)(v43 - 8);
              v43 -= 40;
            }
            while (v16 > v44);
          }
          v45 = *(_QWORD *)(a1 + 24);
          while (v7 < v42)
          {
            v136 = *(_QWORD *)(v7 + 16);
            v128 = *(_OWORD *)v7;
            v46 = *(_OWORD *)v42;
            *(_QWORD *)(v7 + 16) = *(_QWORD *)(v42 + 16);
            *(_OWORD *)v7 = v46;
            *(_QWORD *)(v42 + 16) = v136;
            *(_OWORD *)v42 = v128;
            v47 = *(_DWORD *)(v7 + 24);
            *(_DWORD *)(v7 + 24) = *(_DWORD *)(v42 + 24);
            *(_DWORD *)(v42 + 24) = v47;
            v48 = *(_DWORD *)(v7 + 28);
            *(_DWORD *)(v7 + 28) = *(_DWORD *)(v42 + 28);
            *(_DWORD *)(v42 + 28) = v48;
            v49 = *(_DWORD *)(v7 + 32);
            *(_DWORD *)(v7 + 32) = *(_DWORD *)(v42 + 32);
            *(_DWORD *)(v42 + 32) = v49;
            do
            {
              v50 = *(_DWORD *)(v7 + 72);
              v7 += 40;
            }
            while (v16 <= v50);
            do
            {
              v51 = *(_DWORD *)(v42 - 8);
              v42 -= 40;
            }
            while (v16 > v51);
          }
          if (v7 - 40 != a1)
          {
            std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>(a1, (__n128 *)(v7 - 40));
            *(_DWORD *)(a1 + 32) = *(_DWORD *)(v7 - 8);
          }
          if (*(char *)(v7 - 17) < 0)
            operator delete(*(void **)(v7 - 40));
          a4 = 0;
          *(_QWORD *)(v7 - 40) = v36;
          *(_QWORD *)(v7 - 25) = *(_QWORD *)&v124[7];
          *(_QWORD *)(v7 - 32) = *(_QWORD *)v124;
          *(_BYTE *)(v7 - 17) = v37;
          *(_QWORD *)(v7 - 16) = v45;
          *(_DWORD *)(v7 - 8) = v16;
          continue;
        }
        v16 = *(_DWORD *)(a1 + 32);
LABEL_11:
        v17 = 0;
        v18 = *(_QWORD *)a1;
        *(_QWORD *)v123 = *(_QWORD *)(a1 + 8);
        *(_QWORD *)&v123[7] = *(_QWORD *)(a1 + 15);
        v19 = *(_BYTE *)(a1 + 23);
        *(_QWORD *)(a1 + 8) = 0;
        *(_QWORD *)(a1 + 16) = 0;
        *(_QWORD *)a1 = 0;
        v20 = *(_QWORD *)(a1 + 24);
        do
        {
          v21 = *(_DWORD *)(a1 + v17 + 72);
          v17 += 40;
        }
        while (v21 > v16);
        v22 = a1 + v17;
        v23 = v120;
        if (v17 == 40)
        {
          v26 = v120;
          while (v22 < v26)
          {
            v24 = v26 - 40;
            v27 = *(_DWORD *)(v26 - 8);
            v26 -= 40;
            if (v27 > v16)
              goto LABEL_21;
          }
          v24 = v26;
        }
        else
        {
          do
          {
            v24 = v23 - 40;
            v25 = *(_DWORD *)(v23 - 8);
            v23 -= 40;
          }
          while (v25 <= v16);
        }
LABEL_21:
        v7 = v22;
        if (v22 < v24)
        {
          v28 = v24;
          do
          {
            v135 = *(_QWORD *)(v7 + 16);
            v127 = *(_OWORD *)v7;
            v29 = *(_OWORD *)v28;
            *(_QWORD *)(v7 + 16) = *(_QWORD *)(v28 + 16);
            *(_OWORD *)v7 = v29;
            *(_QWORD *)(v28 + 16) = v135;
            *(_OWORD *)v28 = v127;
            v30 = *(_DWORD *)(v7 + 24);
            *(_DWORD *)(v7 + 24) = *(_DWORD *)(v28 + 24);
            *(_DWORD *)(v28 + 24) = v30;
            v31 = *(_DWORD *)(v7 + 28);
            *(_DWORD *)(v7 + 28) = *(_DWORD *)(v28 + 28);
            *(_DWORD *)(v28 + 28) = v31;
            v32 = *(_DWORD *)(v7 + 32);
            *(_DWORD *)(v7 + 32) = *(_DWORD *)(v28 + 32);
            *(_DWORD *)(v28 + 32) = v32;
            do
            {
              v33 = *(_DWORD *)(v7 + 72);
              v7 += 40;
            }
            while (v33 > v16);
            do
            {
              v34 = *(_DWORD *)(v28 - 8);
              v28 -= 40;
            }
            while (v34 <= v16);
          }
          while (v7 < v28);
        }
        if (v7 - 40 != a1)
        {
          std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>(a1, (__n128 *)(v7 - 40));
          *(_DWORD *)(a1 + 32) = *(_DWORD *)(v7 - 8);
        }
        if (*(char *)(v7 - 17) < 0)
          operator delete(*(void **)(v7 - 40));
        *(_QWORD *)(v7 - 40) = v18;
        *(_QWORD *)(v7 - 25) = *(_QWORD *)&v123[7];
        *(_QWORD *)(v7 - 32) = *(_QWORD *)v123;
        *(_BYTE *)(v7 - 17) = v19;
        *(_QWORD *)(v7 - 16) = v20;
        *(_DWORD *)(v7 - 8) = v16;
        if (v22 < v24)
        {
LABEL_34:
          std::__introsort<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *,false>(a1, v7 - 40, a3, a4 & 1);
          a4 = 0;
          continue;
        }
        v35 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>(a1, v7 - 40);
        if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>(v7, v120))
        {
          if (v35)
            continue;
          goto LABEL_34;
        }
        a2 = (_QWORD *)(v7 - 40);
        if (!v35)
          goto LABEL_1;
        return;
    }
  }
}

__n128 std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *,0>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5)
{
  __n128 result;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;

  result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4).n128_u64[0];
  if (a5[2].n128_u32[0] > a4[2].n128_u32[0])
  {
    v11 = a4[1].n128_u64[0];
    result = *a4;
    v12 = a5[1].n128_u64[0];
    *a4 = *a5;
    a4[1].n128_u64[0] = v12;
    *a5 = result;
    a5[1].n128_u64[0] = v11;
    LODWORD(v11) = a4[1].n128_u32[2];
    a4[1].n128_u32[2] = a5[1].n128_u32[2];
    a5[1].n128_u32[2] = v11;
    LODWORD(v11) = a4[1].n128_u32[3];
    a4[1].n128_u32[3] = a5[1].n128_u32[3];
    a5[1].n128_u32[3] = v11;
    LODWORD(v11) = a4[2].n128_u32[0];
    a4[2].n128_u32[0] = a5[2].n128_u32[0];
    a5[2].n128_u32[0] = v11;
    if (a4[2].n128_u32[0] > a3[2].n128_u32[0])
    {
      v13 = a3[1].n128_u64[0];
      result = *a3;
      v14 = a4[1].n128_u64[0];
      *a3 = *a4;
      a3[1].n128_u64[0] = v14;
      *a4 = result;
      a4[1].n128_u64[0] = v13;
      LODWORD(v13) = a3[1].n128_u32[2];
      a3[1].n128_u32[2] = a4[1].n128_u32[2];
      a4[1].n128_u32[2] = v13;
      LODWORD(v13) = a3[1].n128_u32[3];
      a3[1].n128_u32[3] = a4[1].n128_u32[3];
      a4[1].n128_u32[3] = v13;
      LODWORD(v13) = a3[2].n128_u32[0];
      a3[2].n128_u32[0] = a4[2].n128_u32[0];
      a4[2].n128_u32[0] = v13;
      if (a3[2].n128_u32[0] > a2[2].n128_u32[0])
      {
        v15 = a2[1].n128_u64[0];
        result = *a2;
        v16 = a3[1].n128_u64[0];
        *a2 = *a3;
        a2[1].n128_u64[0] = v16;
        *a3 = result;
        a3[1].n128_u64[0] = v15;
        LODWORD(v15) = a2[1].n128_u32[2];
        a2[1].n128_u32[2] = a3[1].n128_u32[2];
        a3[1].n128_u32[2] = v15;
        LODWORD(v15) = a2[1].n128_u32[3];
        a2[1].n128_u32[3] = a3[1].n128_u32[3];
        a3[1].n128_u32[3] = v15;
        LODWORD(v15) = a2[2].n128_u32[0];
        a2[2].n128_u32[0] = a3[2].n128_u32[0];
        a3[2].n128_u32[0] = v15;
        if (a2[2].n128_u32[0] > a1[2].n128_u32[0])
        {
          v17 = a1[1].n128_u64[0];
          result = *a1;
          v18 = a2[1].n128_u64[0];
          *a1 = *a2;
          a1[1].n128_u64[0] = v18;
          *a2 = result;
          a2[1].n128_u64[0] = v17;
          LODWORD(v17) = a1[1].n128_u32[2];
          a1[1].n128_u32[2] = a2[1].n128_u32[2];
          a2[1].n128_u32[2] = v17;
          LODWORD(v17) = a1[1].n128_u32[3];
          a1[1].n128_u32[3] = a2[1].n128_u32[3];
          a2[1].n128_u32[3] = v17;
          LODWORD(v17) = a1[2].n128_u32[0];
          a1[2].n128_u32[0] = a2[2].n128_u32[0];
          a2[2].n128_u32[0] = v17;
        }
      }
    }
  }
  return result;
}

__int128 *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>(__int128 *result, __int128 *a2, __int128 *a3)
{
  int *v3;
  unsigned int v4;
  int *v5;
  unsigned int v6;
  int *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  int v25;
  int v26;

  v3 = (int *)(a2 + 2);
  v4 = *((_DWORD *)a2 + 8);
  v5 = (int *)(result + 2);
  v6 = *((_DWORD *)a3 + 8);
  if (v4 > *((_DWORD *)result + 8))
  {
    if (v6 <= v4)
    {
      v18 = *((_QWORD *)result + 2);
      v19 = *result;
      v20 = *((_QWORD *)a2 + 2);
      *result = *a2;
      *((_QWORD *)result + 2) = v20;
      *a2 = v19;
      *((_QWORD *)a2 + 2) = v18;
      LODWORD(v18) = *((_DWORD *)result + 6);
      *((_DWORD *)result + 6) = *((_DWORD *)a2 + 6);
      *((_DWORD *)a2 + 6) = v18;
      v7 = (int *)a2 + 7;
      v21 = *((_DWORD *)result + 7);
      *((_DWORD *)result + 7) = *((_DWORD *)a2 + 7);
      *((_DWORD *)a2 + 7) = v21;
      LODWORD(v18) = *((_DWORD *)result + 8);
      *((_DWORD *)result + 8) = *((_DWORD *)a2 + 8);
      *((_DWORD *)a2 + 8) = v18;
      if (*((_DWORD *)a3 + 8) <= v18)
        return result;
      v22 = *((_QWORD *)a2 + 2);
      v23 = *a2;
      v24 = *((_QWORD *)a3 + 2);
      *a2 = *a3;
      *((_QWORD *)a2 + 2) = v24;
      *a3 = v23;
      *((_QWORD *)a3 + 2) = v22;
      LODWORD(v22) = *((_DWORD *)a2 + 6);
      *((_DWORD *)a2 + 6) = *((_DWORD *)a3 + 6);
      *((_DWORD *)a3 + 6) = v22;
      v11 = (int *)a3 + 7;
      v5 = (int *)(a2 + 2);
    }
    else
    {
      v7 = (int *)result + 7;
      v8 = *((_QWORD *)result + 2);
      v9 = *result;
      v10 = *((_QWORD *)a3 + 2);
      *result = *a3;
      *((_QWORD *)result + 2) = v10;
      *a3 = v9;
      *((_QWORD *)a3 + 2) = v8;
      LODWORD(v8) = *((_DWORD *)result + 6);
      *((_DWORD *)result + 6) = *((_DWORD *)a3 + 6);
      *((_DWORD *)a3 + 6) = v8;
      v11 = (int *)a3 + 7;
    }
    v3 = (int *)(a3 + 2);
    goto LABEL_10;
  }
  if (v6 > v4)
  {
    v12 = *((_QWORD *)a2 + 2);
    v13 = *a2;
    v14 = *((_QWORD *)a3 + 2);
    *a2 = *a3;
    *((_QWORD *)a2 + 2) = v14;
    *a3 = v13;
    *((_QWORD *)a3 + 2) = v12;
    LODWORD(v12) = *((_DWORD *)a2 + 6);
    *((_DWORD *)a2 + 6) = *((_DWORD *)a3 + 6);
    *((_DWORD *)a3 + 6) = v12;
    v11 = (int *)a2 + 7;
    LODWORD(v12) = *((_DWORD *)a2 + 7);
    *((_DWORD *)a2 + 7) = *((_DWORD *)a3 + 7);
    *((_DWORD *)a3 + 7) = v12;
    LODWORD(v12) = *((_DWORD *)a2 + 8);
    *((_DWORD *)a2 + 8) = *((_DWORD *)a3 + 8);
    *((_DWORD *)a3 + 8) = v12;
    if (*((_DWORD *)a2 + 8) > *v5)
    {
      v15 = *((_QWORD *)result + 2);
      v16 = *result;
      v17 = *((_QWORD *)a2 + 2);
      *result = *a2;
      *((_QWORD *)result + 2) = v17;
      *a2 = v16;
      *((_QWORD *)a2 + 2) = v15;
      LODWORD(v15) = *((_DWORD *)result + 6);
      *((_DWORD *)result + 6) = *((_DWORD *)a2 + 6);
      *((_DWORD *)a2 + 6) = v15;
      v7 = (int *)result + 7;
LABEL_10:
      v25 = *v7;
      *v7 = *v11;
      *v11 = v25;
      v26 = *v5;
      *v5 = *v3;
      *v3 = v26;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[15];

  v4 = 0xCCCCCCCCCCCCCCCDLL * ((a2 - a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      if (*(_DWORD *)(a2 - 8) > *(_DWORD *)(a1 + 32))
      {
        v6 = *(_QWORD *)(a1 + 16);
        v7 = *(_OWORD *)a1;
        v8 = *(_QWORD *)(a2 - 24);
        *(_OWORD *)a1 = *(_OWORD *)(a2 - 40);
        *(_QWORD *)(a1 + 16) = v8;
        *(_OWORD *)(a2 - 40) = v7;
        *(_QWORD *)(a2 - 24) = v6;
        LODWORD(v6) = *(_DWORD *)(a1 + 24);
        *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 - 16);
        *(_DWORD *)(a2 - 16) = v6;
        LODWORD(v6) = *(_DWORD *)(a1 + 28);
        *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 - 12);
        *(_DWORD *)(a2 - 12) = v6;
        LODWORD(v6) = *(_DWORD *)(a1 + 32);
        *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 - 8);
        *(_DWORD *)(a2 - 8) = v6;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((__int128 *)a1, (__int128 *)(a1 + 40), (__int128 *)(a2 - 40));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>(a1, a1 + 40, a1 + 80, a2 - 40);
      return 1;
    case 5uLL:
      std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *,0>((__n128 *)a1, (__n128 *)(a1 + 40), (__n128 *)(a1 + 80), (__n128 *)(a1 + 120), (__n128 *)(a2 - 40));
      return 1;
    default:
      v9 = a1 + 80;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((__int128 *)a1, (__int128 *)(a1 + 40), (__int128 *)(a1 + 80));
      v10 = a1 + 120;
      if (a1 + 120 == a2)
        return 1;
      v11 = 0;
      v12 = 0;
      break;
  }
  while (1)
  {
    v13 = *(_DWORD *)(v10 + 32);
    if (v13 > *(_DWORD *)(v9 + 32))
    {
      v14 = *(_QWORD *)v10;
      *(_QWORD *)v20 = *(_QWORD *)(v10 + 8);
      *(_QWORD *)&v20[7] = *(_QWORD *)(v10 + 15);
      v15 = *(_BYTE *)(v10 + 23);
      *(_QWORD *)(v10 + 8) = 0;
      *(_QWORD *)(v10 + 16) = 0;
      *(_QWORD *)v10 = 0;
      v16 = *(_QWORD *)(v10 + 24);
      v17 = v11;
      while (1)
      {
        v18 = a1 + v17;
        std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>(a1 + v17 + 120, (__n128 *)(a1 + v17 + 80));
        *(_DWORD *)(a1 + v17 + 152) = *(_DWORD *)(a1 + v17 + 112);
        if (v17 == -80)
          break;
        v17 -= 40;
        if (v13 <= *(_DWORD *)(v18 + 72))
        {
          v19 = a1 + v17 + 120;
          goto LABEL_12;
        }
      }
      v19 = a1;
LABEL_12:
      if (*(char *)(v19 + 23) < 0)
        operator delete(*(void **)v19);
      *(_QWORD *)v19 = v14;
      *(_QWORD *)(v19 + 8) = *(_QWORD *)v20;
      *(_QWORD *)(v19 + 15) = *(_QWORD *)&v20[7];
      *(_BYTE *)(v19 + 23) = v15;
      *(_QWORD *)(v19 + 24) = v16;
      *(_DWORD *)(v19 + 32) = v13;
      if (++v12 == 8)
        return v10 + 40 == a2;
    }
    v9 = v10;
    v11 += 40;
    v10 += 40;
    if (v10 == a2)
      return 1;
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __n128 result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((__int128 *)a1, (__int128 *)a2, (__int128 *)a3);
  if (*(_DWORD *)(a4 + 32) > *(_DWORD *)(a3 + 32))
  {
    v9 = *(_QWORD *)(a3 + 16);
    result = *(__n128 *)a3;
    v10 = *(_QWORD *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(_QWORD *)(a3 + 16) = v10;
    *(__n128 *)a4 = result;
    *(_QWORD *)(a4 + 16) = v9;
    LODWORD(v9) = *(_DWORD *)(a3 + 24);
    *(_DWORD *)(a3 + 24) = *(_DWORD *)(a4 + 24);
    *(_DWORD *)(a4 + 24) = v9;
    LODWORD(v9) = *(_DWORD *)(a3 + 28);
    *(_DWORD *)(a3 + 28) = *(_DWORD *)(a4 + 28);
    *(_DWORD *)(a4 + 28) = v9;
    LODWORD(v9) = *(_DWORD *)(a3 + 32);
    *(_DWORD *)(a3 + 32) = *(_DWORD *)(a4 + 32);
    *(_DWORD *)(a4 + 32) = v9;
    if (*(_DWORD *)(a3 + 32) > *(_DWORD *)(a2 + 32))
    {
      v11 = *(_QWORD *)(a2 + 16);
      result = *(__n128 *)a2;
      v12 = *(_QWORD *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(_QWORD *)(a2 + 16) = v12;
      *(__n128 *)a3 = result;
      *(_QWORD *)(a3 + 16) = v11;
      LODWORD(v11) = *(_DWORD *)(a2 + 24);
      *(_DWORD *)(a2 + 24) = *(_DWORD *)(a3 + 24);
      *(_DWORD *)(a3 + 24) = v11;
      LODWORD(v11) = *(_DWORD *)(a2 + 28);
      *(_DWORD *)(a2 + 28) = *(_DWORD *)(a3 + 28);
      *(_DWORD *)(a3 + 28) = v11;
      LODWORD(v11) = *(_DWORD *)(a2 + 32);
      *(_DWORD *)(a2 + 32) = *(_DWORD *)(a3 + 32);
      *(_DWORD *)(a3 + 32) = v11;
      if (*(_DWORD *)(a2 + 32) > *(_DWORD *)(a1 + 32))
      {
        v13 = *(_QWORD *)(a1 + 16);
        result = *(__n128 *)a1;
        v14 = *(_QWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_QWORD *)(a1 + 16) = v14;
        *(__n128 *)a2 = result;
        *(_QWORD *)(a2 + 16) = v13;
        LODWORD(v13) = *(_DWORD *)(a1 + 24);
        *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
        *(_DWORD *)(a2 + 24) = v13;
        LODWORD(v13) = *(_DWORD *)(a1 + 28);
        *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
        *(_DWORD *)(a2 + 28) = v13;
        LODWORD(v13) = *(_DWORD *)(a1 + 32);
        *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
        *(_DWORD *)(a2 + 32) = v13;
      }
    }
  }
  return result;
}

__n128 std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>(uint64_t a1, __n128 *a2)
{
  __n128 result;

  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  result = *a2;
  *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
  *(__n128 *)a1 = result;
  a2[1].n128_u8[7] = 0;
  a2->n128_u8[0] = 0;
  *(_DWORD *)(a1 + 24) = a2[1].n128_u32[2];
  *(_DWORD *)(a1 + 28) = a2[1].n128_u32[3];
  return result;
}

uint64_t std::vector<std::tuple<std::string,unsigned int,unsigned int>>::push_back[abi:ne180100](uint64_t *a1, __int128 *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  __int128 v16;
  _QWORD v17[5];

  v6 = a1[2];
  result = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD *)(result - 8);
  if (v7 >= v6)
  {
    v10 = (uint64_t)(v7 - *a1) >> 5;
    v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 59)
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
    v12 = v5 - *a1;
    if (v12 >> 4 > v11)
      v11 = v12 >> 4;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFE0)
      v13 = 0x7FFFFFFFFFFFFFFLL;
    else
      v13 = v11;
    v17[4] = result;
    if (v13)
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>>(result, v13);
    else
      v14 = 0;
    v15 = &v14[32 * v10];
    v17[0] = v14;
    v17[1] = v15;
    v17[3] = &v14[32 * v13];
    v16 = *a2;
    *((_QWORD *)v15 + 2) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v15 = v16;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    *((_DWORD *)v15 + 6) = *((_DWORD *)a2 + 6);
    *((_DWORD *)v15 + 7) = *((_DWORD *)a2 + 7);
    v17[2] = v15 + 32;
    std::vector<std::tuple<std::string,unsigned int,unsigned int>>::__swap_out_circular_buffer(a1, v17);
    v9 = a1[1];
    result = std::__split_buffer<std::tuple<std::string,unsigned int,unsigned int>>::~__split_buffer((uint64_t)v17);
  }
  else
  {
    v8 = *a2;
    *(_QWORD *)(v7 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v7 = v8;
    *((_QWORD *)a2 + 1) = 0;
    *((_QWORD *)a2 + 2) = 0;
    *(_QWORD *)a2 = 0;
    *(_DWORD *)(v7 + 24) = *((_DWORD *)a2 + 6);
    *(_DWORD *)(v7 + 28) = *((_DWORD *)a2 + 7);
    v9 = v7 + 32;
    a1[1] = v7 + 32;
  }
  a1[1] = v9;
  return result;
}

void sub_100006ECC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::tuple<std::string,unsigned int,unsigned int>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::tuple<std::string,unsigned int,unsigned int>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
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
  if (a3 == a5)
  {
    v10 = a6;
  }
  else
  {
    v8 = a7;
    do
    {
      v9 = *(_OWORD *)(a3 - 32);
      *(_QWORD *)(v8 - 16) = *(_QWORD *)(a3 - 16);
      *(_OWORD *)(v8 - 32) = v9;
      *(_QWORD *)(a3 - 24) = 0;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 32) = 0;
      *(_DWORD *)(v8 - 8) = *(_DWORD *)(a3 - 8);
      *(_DWORD *)(v8 - 4) = *(_DWORD *)(a3 - 4);
      v8 -= 32;
      v7 -= 32;
      a3 -= 32;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v8;
    v10 = v15;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 32;
  }
}

uint64_t std::__split_buffer<std::tuple<std::string,unsigned int,unsigned int>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::tuple<std::string,unsigned int,unsigned int>>::__destruct_at_end[abi:ne180100](a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::tuple<std::string,unsigned int,unsigned int>>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 4;
      *(_QWORD *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

const char *MTLAssetUpgraderD::archiveTypeToString(unsigned int a1)
{
  if (a1 > 4)
    return "Unknown";
  else
    return off_100020638[a1];
}

const char *MTLAssetUpgraderD::dynamicLibraryTypeToString(unsigned int a1)
{
  if (a1 > 4)
    return "Unknown";
  else
    return off_100020660[a1];
}

void MTLAssetUpgraderD::listPrioritizedAppLaunches(uint64_t a1@<X8>)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  std::string *v10;
  std::string *v11;
  id v12;
  uint64_t v13;
  void *i;
  unint64_t v15;
  unint64_t v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  std::string *v22;
  std::string *v23;
  __int128 v24;
  uint64_t v25;
  int v26;
  id v27;
  void *context;
  void *v29;
  void *__p[2];
  std::string::size_type v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _BYTE v40[128];
  std::__split_buffer<std::string> buf;

  context = objc_autoreleasePoolPush();
  v3 = BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "App"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "InFocus"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "publisher"));

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke_2;
  v38[3] = &unk_100020570;
  v7 = objc_alloc_init((Class)NSCountedSet);
  v39 = v7;
  v8 = objc_msgSend(v29, "sinkWithCompletion:receiveInput:", &__block_literal_global, v38);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allObjects"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke_3;
  v36[3] = &unk_100020598;
  v27 = v7;
  v37 = v27;
  v10 = (std::string *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sortedArrayUsingComparator:", v36));

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf.__first_) = 138412290;
    *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = v10;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "sorted: %@", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = v10;
  v12 = unk_1000247C8(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v11);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i)), "UTF8String"));
        v16 = *(_QWORD *)(a1 + 8);
        v15 = *(_QWORD *)(a1 + 16);
        if (v16 >= v15)
        {
          v18 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v16 - *(_QWORD *)a1) >> 3);
          v19 = v18 + 1;
          if (v18 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
          v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v15 - *(_QWORD *)a1) >> 3);
          if (2 * v20 > v19)
            v19 = 2 * v20;
          if (v20 >= 0x555555555555555)
            v21 = 0xAAAAAAAAAAAAAAALL;
          else
            v21 = v19;
          buf.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 16);
          if (v21)
            v22 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(a1 + 16, v21);
          else
            v22 = 0;
          v23 = v22 + v18;
          buf.__first_ = v22;
          buf.__begin_ = v23;
          buf.__end_cap_.__value_ = &v22[v21];
          v24 = *(_OWORD *)__p;
          v23->__r_.__value_.__r.__words[2] = v31;
          *(_OWORD *)&v23->__r_.__value_.__l.__data_ = v24;
          __p[1] = 0;
          v31 = 0;
          __p[0] = 0;
          buf.__end_ = v23 + 1;
          std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &buf);
          v25 = *(_QWORD *)(a1 + 8);
          std::__split_buffer<std::string>::~__split_buffer(&buf);
          v26 = SHIBYTE(v31);
          *(_QWORD *)(a1 + 8) = v25;
          if (v26 < 0)
            operator delete(__p[0]);
        }
        else
        {
          v17 = *(_OWORD *)__p;
          *(_QWORD *)(v16 + 16) = v31;
          *(_OWORD *)v16 = v17;
          *(_QWORD *)(a1 + 8) = v16 + 24;
        }
      }
      v12 = unk_1000247D0(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v12);
  }

  objc_autoreleasePoolPop(context);
}

void sub_100007520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37)
{
  void *v37;

  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

void sub_1000076A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  if (v3)
  {
    v10 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventBody"));
    if (!objc_msgSend(v4, "starting"))
    {
LABEL_5:

      v3 = v10;
      goto LABEL_6;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventBody"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bundleID"));
    v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("com.apple."));

    v3 = v10;
    if ((v7 & 1) == 0)
    {
      v8 = *(void **)(a1 + 32);
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventBody"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
      objc_msgSend(v8, "addObject:", v9);

      goto LABEL_5;
    }
  }
LABEL_6:

}

void sub_1000077A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v5);
  if (v7 >= objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v5);
    if (v9 <= objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6))
      v8 = 0;
    else
      v8 = -1;
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

void sub_10000787C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id MTLAssetUpgraderD::getArchiveType(uint64_t a1, uint64_t *a2, void *a3)
{
  id v4;
  uint64_t *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v11;

  v4 = a3;
  if (*((char *)a2 + 23) >= 0)
    v5 = a2;
  else
    v5 = (uint64_t *)*a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6));
  v11 = 0;
  v8 = +[_MTLBinaryArchive archiveTypeAtURL:device:error:](_MTLBinaryArchive, "archiveTypeAtURL:device:error:", v7, v4, &v11);
  v9 = v11;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    MTLAssetUpgraderD::getArchiveType();
    if (!v9)
      goto LABEL_8;
  }
  else if (!v9)
  {
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    MTLAssetUpgraderD::getArchiveType();
LABEL_8:

  return v8;
}

void sub_1000079B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id MTLAssetUpgraderD::getDynamicLibraryType(uint64_t a1, uint64_t *a2, void *a3)
{
  id v4;
  uint64_t *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v11;

  v4 = a3;
  if (*((char *)a2 + 23) >= 0)
    v5 = a2;
  else
    v5 = (uint64_t *)*a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6));
  v11 = 0;
  v8 = +[_MTLDynamicLibrary dynamicLibraryTypeAtURL:device:error:](_MTLDynamicLibrary, "dynamicLibraryTypeAtURL:device:error:", v7, v4, &v11);
  v9 = v11;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    MTLAssetUpgraderD::getDynamicLibraryType();
    if (!v9)
      goto LABEL_8;
  }
  else if (!v9)
  {
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    MTLAssetUpgraderD::getArchiveType();
LABEL_8:

  return v8;
}

void sub_100007AF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

uint64_t MTLAssetUpgraderD::addRecompilationWork(MTLAssetUpgraderD *a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7)
{
  id Device;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v14;
  id v15;
  void *v16;
  void *v17;
  id ArchiveType;
  int v19;
  unsigned int DynamicLibraryType;
  id CacheDirectory;
  void *v22;
  _BOOL4 v25;
  void *v26;
  _BOOL4 v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  _BOOL8 v32;
  id v33;
  int v34;
  unsigned int v35;
  uint64_t v38;
  _BYTE *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v44;
  uint64_t v45;
  int v46;
  id obj;
  id obja;
  uint64_t v49;
  uint8_t v50;
  char v51[15];
  unsigned int v52[4];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE __p[22];
  __int16 v58;
  uint64_t v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  _BYTE *v63;
  _BYTE v64[128];
  id v65;
  id v66;

  if (a7 | a6)
  {
    Device = MTLAssetUpgraderD::findDevice(a1, a6, a7);
    obj = (id)objc_claimAutoreleasedReturnValue(Device);
    v65 = obj;
    v11 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v65, 1));
  }
  else
  {
    obj = MTLCreateSystemDefaultDevice();
    v66 = obj;
    v11 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v66, 1));
  }
  v12 = (void *)v11;

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obja = v12;
  v13 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
  v15 = v13;
  if (v13)
  {
    v49 = *(_QWORD *)v54;
    *(_QWORD *)&v14 = 136315650;
    v44 = v14;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v54 != v49)
          objc_enumerationMutation(obja);
        v17 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v16);
        ArchiveType = MTLAssetUpgraderD::getArchiveType((uint64_t)v13, (uint64_t *)a4, v17);
        v19 = (int)ArchiveType;
        DynamicLibraryType = MTLAssetUpgraderD::getDynamicLibraryType((uint64_t)ArchiveType, (uint64_t *)a4, v17);
        if (a5 == 1 && v19 == 1)
        {
          CacheDirectory = MTLAssetUpgraderD::getCacheDirectory(3, (uint64_t *)a3);
          v22 = (void *)objc_claimAutoreleasedReturnValue(CacheDirectory);
          if (v22 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            v46 = *(char *)(a3 + 23);
            v45 = *(_QWORD *)a3;
            v40 = objc_msgSend(objc_retainAutorelease(v22), "fileSystemRepresentation");
            v41 = v45;
            if (v46 >= 0)
              v41 = a3;
            if (*(char *)(a4 + 23) >= 0)
              v42 = a4;
            else
              v42 = *(_QWORD *)a4;
            *(_DWORD *)__p = v44;
            *(_QWORD *)&__p[4] = v41;
            *(_WORD *)&__p[12] = 2080;
            *(_QWORD *)&__p[14] = v40;
            v58 = 2080;
            v59 = v42;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "addRecompilationWork: pruning (app = %s cache=%s archive=%s)", __p, 0x20u);
          }

        }
        v25 = v19 == 3 || DynamicLibraryType == 1 || DynamicLibraryType == 3;
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "targetDeviceArchitecture", v44));
        if (a5)
          v27 = 0;
        else
          v27 = v25;
        if (v27)
        {
          v28 = MTLAssetUpgraderD::getCacheDirectory(0, (uint64_t *)a3);
          v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "URLByAppendingPathComponent:", CFSTR("archiveMapping.db")));

          v31 = objc_retainAutorelease(v30);
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v31, "fileSystemRepresentation"));
          MTLArchiveMapDB::MTLArchiveMapDB((_QWORD **)v52, (uint64_t *)__p);
          if (SHIBYTE(v58) < 0)
            operator delete(*(void **)__p);
          objc_msgSend(v26, "cpuType");
          objc_msgSend(v26, "subType");
          MTLArchiveMapDB::read(v52, a4, __p);
          v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
          if (v32)
          {
            v39 = __p;
            if (v58 < 0)
              v39 = *(_BYTE **)__p;
            *(_DWORD *)buf = 138412546;
            v61 = v31;
            v62 = 2080;
            v63 = v39;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "addRecompilationWork: remap(%@) -> '%s'", buf, 0x16u);
          }
          if (SHIBYTE(v58) < 0)
          {
            if (!*(_QWORD *)&__p[8])
            {
              operator delete(*(void **)__p);
LABEL_49:
              MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v52);

LABEL_50:
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                MTLAssetUpgraderD::addRecompilationWork(&v50, v51, v38);
              RecompilationWork::RecompilationWork((uint64_t)__p, (__int128 *)a3, (__int128 *)a4, a5, (int)objc_msgSend(v26, "cpuType"), (int)objc_msgSend(v26, "subType"));
              RecompilationWork::serialize((RecompilationWork *)__p);
            }
          }
          else if (!HIBYTE(v58))
          {
            goto LABEL_49;
          }
          v33 = MTLAssetUpgraderD::getArchiveType(v32, (uint64_t *)__p, v17);
          v34 = (int)v33;
          v35 = MTLAssetUpgraderD::getDynamicLibraryType((uint64_t)v33, (uint64_t *)a4, v17);
          LOBYTE(v25) = v34 == 3 || v35 == 1 || v35 == 3;
          if (SHIBYTE(v58) < 0)
            operator delete(*(void **)__p);
          MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v52);

        }
        if (v25)
          goto LABEL_50;

        v16 = (char *)v16 + 1;
      }
      while (v15 != v16);
      v13 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v53, v64, 16);
      v15 = v13;
    }
    while (v13);
  }

  return 0;
}

void sub_100008004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{

  _Unwind_Resume(a1);
}

id MTLAssetUpgraderD::findDevice(MTLAssetUpgraderD *this, int a2, int a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  id v20;

  v5 = MTLCreateSystemDefaultDevice();
  v20 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "targetDeviceArchitecture", (_QWORD)v15));
        if (objc_msgSend(v12, "cpuType") == a2 && objc_msgSend(v12, "subType") == a3)
        {
          v13 = v11;

          goto LABEL_12;
        }

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_12:

  return v13;
}

void sub_100008240(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id MTLAssetUpgraderD::getCacheDirectory(int a1, uint64_t *a2)
{
  id v4;
  uint64_t *v5;
  void *v6;
  MTLAssetUpgraderD *v7;
  id v8;
  NSURL *v9;
  id v10;
  id v11;
  MTLAssetUpgraderD *v12;
  id v13;
  NSURL *v14;
  id v15;
  void *v16;
  id v17;
  NSURL *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unsigned __int8 v26;
  id v27;
  void *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  _QWORD v44[2];
  _QWORD v45[3];

  v4 = objc_alloc_init((Class)NSFileManager);
  if (*((char *)a2 + 23) >= 0)
    v5 = a2;
  else
    v5 = (uint64_t *)*a2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5));
  if (a1 == 2)
  {
    v39 = 0;
    v7 = (MTLAssetUpgraderD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v39));
    v8 = v39;
    v10 = MTLAssetUpgraderD::resolveFileURL(v7, v9);
    v11 = (id)objc_claimAutoreleasedReturnValue(v10);
  }
  else
  {
    v38 = 0;
    v7 = (MTLAssetUpgraderD *)objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, &v38);
    v8 = v38;
    if (v8)
    {
      v11 = 0;
    }
    else
    {
      v36 = 0;
      v37 = 0;
      -[MTLAssetUpgraderD getDataContainerURL:error:](v7, "getDataContainerURL:error:", &v37, &v36);
      v12 = (MTLAssetUpgraderD *)v37;
      v13 = v36;
      v8 = v13;
      if (v12)
      {
        v15 = MTLAssetUpgraderD::resolveFileURL(v12, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

        v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "URLByAppendingPathComponent:", CFSTR("Library/Caches/")));
      }
      else
      {
        v35 = v13;
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v35));
        v17 = v35;

        v19 = MTLAssetUpgraderD::resolveFileURL((MTLAssetUpgraderD *)v16, v18);
        v11 = (id)objc_claimAutoreleasedReturnValue(v19);
        v8 = v17;
      }

    }
  }

  if (v8 || !v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
      MTLAssetUpgraderD::getCacheDirectory();
    }
    v23 = 0;
  }
  else
  {
    switch(a1)
    {
      case 0:
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("com.apple.metalassetupgrader")));

        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URLByAppendingPathComponent:", CFSTR("recompiled")));
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "URLByAppendingPathComponent:", v6));
        goto LABEL_21;
      case 1:
        v45[0] = CFSTR("com.apple.metalassetupgrader");
        v45[1] = CFSTR("recompiled");
        v45[2] = v6;
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v45, 3));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v21));
        v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:", v24));

        v11 = (id)v25;
        goto LABEL_22;
      case 2:
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("com.apple.MTLAssetUpgraderD")));
        v21 = v11;
LABEL_21:
        v11 = (id)v22;
LABEL_22:

        goto LABEL_23;
      case 3:
        v44[0] = v6;
        v44[1] = CFSTR("com.apple.metal");
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 2));
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v29));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:", v30));

        v34 = 0;
        v32 = objc_msgSend(v31, "checkResourceIsReachableAndReturnError:", &v34);
        v8 = v34;
        if ((v32 & 1) != 0)
        {
          v11 = v31;
LABEL_24:
          v33 = v8;
          v26 = objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v33);
          v27 = v33;

          if ((v26 & 1) != 0)
          {
            v11 = v11;
            v8 = v27;
            v23 = v11;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v41 = v11;
              v42 = 2112;
              v43 = v27;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Failed to create cache directory '%@': %@", buf, 0x16u);
            }
            v23 = 0;
            v8 = v27;
          }
        }
        else
        {
          v23 = 0;
          v11 = v31;
        }
        break;
      default:
LABEL_23:
        v8 = 0;
        goto LABEL_24;
    }
  }

  return v23;
}

void sub_10000874C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void RecompilationWork::serialize(RecompilationWork *this)
{
  *((_QWORD *)this + 13) = *((_QWORD *)this + 3) + *((_QWORD *)this + 4) + 40;
  if (*((_QWORD *)this + 12))
    operator delete[]();
  operator new[]();
}

uint64_t MTLWorkQueue<RecompilationWork>::push(unsigned int *a1)
{
  int v2;
  char *v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int i;
  int v13;
  char *v14;
  _QWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20[3];

  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v18, (MTLVersionedDB *)a1);
  if (v18)
  {
    v17 = 0;
    v2 = mdb_cursor_open(v18, a1[2], &v17);
    if (v2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v3 = mdb_strerror(v2);
        MTLWorkQueue<RecompilationWork>::push((uint64_t)v3, (uint64_t)v20);
      }
    }
    else
    {
      for (i = mdb_cursor_get(v17, v20, v16, 0); !i; i = mdb_cursor_get(v17, v20, v16, 8))
      {
        if (!MTLVersionedDB::isVersionEntry((uint64_t)a1, v20[0], (char *)v20[1]))
          operator new();
      }
      v13 = mdb_cursor_get(v17, v20, v16, 6);
      if (!v13)
        v13 = mdb_cursor_get(v17, v20, v16, 12);
      if (v13 == -30798 || !v13)
        operator new();
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v14 = mdb_strerror(v13);
        MTLWorkQueue<RecompilationWork>::push((uint64_t)v14, (uint64_t)&v19);
      }
    }
  }
  else
  {
    v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v4)
      MTLWorkQueue<RecompilationWork>::push(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v18);
  return 0;
}

void sub_100008B60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)va);
  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::processAppEvent(MTLAssetUpgraderD *a1, uint64_t *a2, int a3)
{
  id AppBundleDirectory;
  id CacheDirectory;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  id v17;
  char v18;
  id v19;
  id v20;
  void *v21;
  void *v24[2];
  char v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD *v31[2];
  void *__p[2];
  void (*v33)(uint64_t, void *);
  void *v34;
  MTLAssetUpgraderD *v35;
  uint8_t v36[4];
  uint64_t v37;
  _BYTE v38[128];
  NSURLResourceKey v39;

  if (isValidAppName((char *)a2) && a3)
  {
    AppBundleDirectory = MTLAssetUpgraderD::getAppBundleDirectory(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue(AppBundleDirectory);
    if (v21)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        MTLAssetUpgraderD::processAppEvent();
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)&unk_10001C51B);
      CacheDirectory = MTLAssetUpgraderD::getCacheDirectory(2, (uint64_t *)__p);
      v6 = (void *)objc_claimAutoreleasedReturnValue(CacheDirectory);
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("upgraderWork.db")));

      if (SHIBYTE(v33) < 0)
        operator delete(__p[0]);
      v7 = v20;
      if (v20)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v20), "fileSystemRepresentation"));
        MTLVersionedDB::MTLVersionedDB(v31, (uint64_t *)__p, 5, 1, 0);
        if (SHIBYTE(v33) < 0)
          operator delete(__p[0]);
        v19 = objc_alloc_init((Class)NSFileManager);
        v39 = NSURLNameKey;
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v39, 1));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v21, v8, 0, 0));

        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
        if (v11)
        {
          v12 = 0;
          v13 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(_QWORD *)v28 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
              v16 = objc_autoreleasePoolPush();
              v26 = 0;
              objc_msgSend(v15, "getResourceValue:forKey:error:", &v26, NSURLNameKey, 0);
              v17 = v26;
              if (objc_msgSend(v17, "hasSuffix:", CFSTR(".metallib")))
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                  MTLAssetUpgraderD::processAppEvent(v36, (uint64_t)v15, &v37);
                if (objc_msgSend(v15, "getFileSystemRepresentation:maxLength:", __p, 1024))
                {
                  std::string::basic_string[abi:ne180100]<0>(v24, (char *)__p);
                  v18 = MTLAssetUpgraderD::addRecompilationWork(a1, (int)v31, (uint64_t)a2, (uint64_t)v24, 0, 0, 0);
                  if (v25 < 0)
                    operator delete(v24[0]);
                  v12 |= v18;
                }
              }

              objc_autoreleasePoolPop(v16);
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
          }
          while (v11);

          if ((v12 & 1) != 0)
          {
            __p[0] = _NSConcreteStackBlock;
            __p[1] = (void *)3221225472;
            v33 = ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke;
            v34 = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
            v35 = a1;
            xpc_activity_register("com.apple.MTLAssetUpgraderD.recompilationActivity", XPC_ACTIVITY_CHECK_IN, __p);
          }
        }
        else
        {

        }
        MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v31);
        v7 = v20;
      }

    }
  }
}

void sub_100008F8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  void *v39;

  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)&a32);
  _Unwind_Resume(a1);
}

BOOL isValidAppName(char *a1)
{
  uint64_t v1;
  BOOL v2;
  char *v3;
  char *v4;
  void *v5;
  char *v6;

  v1 = a1[23];
  v2 = (v1 & 0x80u) != 0;
  if ((v1 & 0x80u) != 0)
    v1 = *((_QWORD *)a1 + 1);
  if (v2)
    v3 = *(char **)a1;
  else
    v3 = a1;
  v4 = &v3[v1];
  if (v1 >= 10)
  {
    v5 = v3;
    do
    {
      v6 = (char *)memchr(v5, 99, v1 - 9);
      if (!v6)
        break;
      if (*(_QWORD *)v6 == 0x6C7070612E6D6F63 && *((_WORD *)v6 + 4) == 11877)
        return v6 == v4 || v6 != v3;
      v5 = v6 + 1;
      v1 = v4 - (_BYTE *)v5;
    }
    while (v4 - (_BYTE *)v5 > 9);
  }
  v6 = v4;
  return v6 == v4 || v6 != v3;
}

id MTLAssetUpgraderD::getAppBundleDirectory(uint64_t *a1)
{
  id v2;
  uint64_t *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v9;

  v2 = objc_alloc((Class)LSApplicationRecord);
  if (*((char *)a1 + 23) >= 0)
    v3 = a1;
  else
    v3 = (uint64_t *)*a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v3));
  v9 = 0;
  v5 = objc_msgSend(v2, "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, &v9);
  v6 = v9;

  if (v6)
    v7 = 0;
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URL"));

  return v7;
}

void sub_1000091C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::kickRecompilationActivity(MTLAssetUpgraderD *this)
{
  _QWORD handler[5];

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = this;
  xpc_activity_register("com.apple.MTLAssetUpgraderD.recompilationActivity", XPC_ACTIVITY_CHECK_IN, handler);
}

void MTLAssetUpgraderD::setupAppHandler(NSObject **this)
{
  NSObject *v1;
  _QWORD handler[5];

  v1 = *this;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = this;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", v1, handler);
}

void ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  MTLAssetUpgraderD *v4;
  char *v5;
  const char *string;
  const char *v7;
  int v8;
  xpc_object_t value;
  void *v10;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  xpc_object_t array;
  void *v31;
  size_t i;
  void *v33;
  char *v34;
  void *__p[2];
  char v36;

  v3 = a2;
  v4 = *(MTLAssetUpgraderD **)(a1 + 32);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v5 = xpc_copy_description(v3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_5();
    free(v5);
  }
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  v7 = string;
  if (string)
  {
    v8 = strcmp(string, "Application Installed");
    if (!v8 || !strcmp(v7, "Application Uninstalled"))
    {
      value = xpc_dictionary_get_value(v3, "UserInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue(value);
      v11 = v10;
      if (v10)
      {
        if (xpc_get_type(v10) == (xpc_type_t)&_xpc_type_dictionary)
        {
          v29 = xpc_dictionary_get_BOOL(v11, "isPlaceholder");
          array = xpc_dictionary_get_array(v11, "bundleIDs");
          v31 = (void *)objc_claimAutoreleasedReturnValue(array);
          if (!v29)
          {
            for (i = 0; i < xpc_array_get_count(v31); ++i)
            {
              v33 = objc_autoreleasePoolPush();
              v34 = (char *)xpc_array_get_string(v31, i);
              std::string::basic_string[abi:ne180100]<0>(__p, v34);
              MTLAssetUpgraderD::processAppEvent(v4, (uint64_t *)__p, v8 == 0);
              if (v36 < 0)
                operator delete(__p[0]);
              objc_autoreleasePoolPop(v33);
            }
          }

        }
        else
        {
          v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v12)
            ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_3(v12, v13, v14, v15, v16, v17, v18, v19);
        }
      }
      else
      {
        v21 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v21)
          ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_2(v21, v22, v23, v24, v25, v26, v27, v28);
      }

    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_4();
    }
  }
  else
  {
    v20 = xpc_copy_description(v3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_1();
    free(v20);
  }

}

void sub_1000094DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::generateArchiveName(const char *a1@<X0>, _QWORD *a2@<X8>)
{
  const char *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t *v8;
  id v9;
  id v10;
  uint64_t *v11;
  void *v12;
  id v13;
  id v14;

  v14 = objc_alloc_init((Class)NSFileManager);
  if (a1[23] >= 0)
    v4 = a1;
  else
    v4 = *(const char **)a1;
  mkdir(v4, 0x1EDu);
  do
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));

    v7 = a1[23];
    v8 = *(uint64_t **)a1;
    v9 = objc_retainAutorelease(v6);
    v10 = objc_msgSend(v9, "UTF8String");
    if (v7 >= 0)
      v11 = (uint64_t *)a1;
    else
      v11 = v8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s/%s.metallib"), v11, v10));
    if (objc_msgSend(v14, "fileExistsAtPath:", v12))
    {

      v12 = 0;
    }

  }
  while (!v12);
  v13 = objc_retainAutorelease(v12);
  std::string::basic_string[abi:ne180100]<0>(a2, (char *)objc_msgSend(v13, "UTF8String"));

}

void sub_100009660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

id MTLAssetUpgraderD::resolveFileURL(MTLAssetUpgraderD *this, NSURL *a2)
{
  MTLAssetUpgraderD *v2;
  MTLAssetUpgraderD *v3;
  char *v4;
  void *v5;
  void *v6;

  v2 = this;
  v3 = v2;
  if (v2
    && (-[MTLAssetUpgraderD isFileURL](v2, "isFileURL") & 1) != 0
    && (v4 = realpath_DARWIN_EXTSN((const char *)-[MTLAssetUpgraderD fileSystemRepresentation](objc_retainAutorelease(v3), "fileSystemRepresentation"), 0)) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v5));

    free(v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_100009740(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::processPrune(MTLAssetUpgraderD *this)
{
  __int128 *v1;
  __int128 *v2;
  __int128 v3;
  id CacheDirectory;
  void *v5;
  void *v6;
  id v7;
  void *__p[2];
  char v9;
  _QWORD *v10[2];
  std::string v11;
  __int128 *v12;
  __int128 *v13;

  MTLAssetUpgraderD::listPrioritizedAppLaunches((uint64_t)&v12);
  v1 = v12;
  v2 = v13;
  if (v12 != v13)
  {
    while (1)
    {
      if (*((char *)v1 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)v1, *((_QWORD *)v1 + 1));
      }
      else
      {
        v3 = *v1;
        v11.__r_.__value_.__r.__words[2] = *((_QWORD *)v1 + 2);
        *(_OWORD *)&v11.__r_.__value_.__l.__data_ = v3;
      }
      CacheDirectory = MTLAssetUpgraderD::getCacheDirectory(3, (uint64_t *)&v11);
      v5 = (void *)objc_claimAutoreleasedReturnValue(CacheDirectory);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("archiveUsage.db")));

      if (!v6)
        break;
      v7 = objc_retainAutorelease(v6);
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "fileSystemRepresentation"));
      MTLArchiveUsageDB::MTLArchiveUsageDB(v10, (uint64_t *)__p);
      if (v9 < 0)
        operator delete(__p[0]);
      MTLArchiveUsageDB::prune((MTLArchiveUsageDB *)v10, 2419200);
      MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v10);

      if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v11.__r_.__value_.__l.__data_);
      v1 = (__int128 *)((char *)v1 + 24);
      if (v1 == v2)
        goto LABEL_14;
    }
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v11.__r_.__value_.__l.__data_);
  }
LABEL_14:
  v11.__r_.__value_.__r.__words[0] = (std::string::size_type)&v12;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v11);
}

void sub_100009898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, char *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24)
{
  __p = &a24;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

uint64_t MTLAssetUpgraderD::getRecompilationType(void *a1, void *a2, uint64_t *a3)
{
  id v5;
  id v6;
  uint64_t *v7;
  void *v8;
  MTLAssetUpgraderD *v9;
  NSURL *v10;
  id v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  unsigned __int8 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  id v23;
  id v24;
  uint64_t v25;

  v5 = a1;
  v6 = a2;
  if (*((char *)a3 + 23) >= 0)
    v7 = a3;
  else
    v7 = (uint64_t *)*a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
  v9 = (MTLAssetUpgraderD *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v8));
  v11 = MTLAssetUpgraderD::resolveFileURL(v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v12)
  {
    v25 = 0;
    if (v6)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v24 = 0;
      v14 = objc_msgSend(v13, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v25, v6, v12, &v24);
      v15 = v24;

      if (v25)
        v16 = 0;
      else
        v16 = v14;
      if ((v16 & 1) != 0)
      {
        v17 = 1;
LABEL_21:

        goto LABEL_22;
      }
      v18 = v15;
      if (!v5)
        goto LABEL_19;
    }
    else
    {
      v18 = 0;
      if (!v5)
      {
LABEL_19:
        v15 = v18;
        goto LABEL_20;
      }
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v23 = v18;
    v20 = objc_msgSend(v19, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v25, v5, v12, &v23);
    v15 = v23;

    if (v25)
      v21 = 0;
    else
      v21 = v20;
    if ((v21 & 1) != 0)
    {
      v17 = 0;
      goto LABEL_21;
    }
LABEL_20:
    v17 = 2;
    goto LABEL_21;
  }
  v17 = 2;
LABEL_22:

  return v17;
}

void sub_100009A98(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

uint64_t MTLAssetUpgraderD::getRecompilationType(uint64_t *a1, uint64_t *a2)
{
  id AppBundleDirectory;
  void *v5;
  id CacheDirectory;
  void *v7;
  uint64_t RecompilationType;

  AppBundleDirectory = MTLAssetUpgraderD::getAppBundleDirectory(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(AppBundleDirectory);
  CacheDirectory = MTLAssetUpgraderD::getCacheDirectory(3, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(CacheDirectory);
  RecompilationType = MTLAssetUpgraderD::getRecompilationType(v5, v7, a2);

  return RecompilationType;
}

void sub_100009B60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::processOSUpdate(MTLAssetUpgraderD *this)
{
  id CacheDirectory;
  void *v2;
  __int128 *v3;
  __int128 v4;
  void *v5;
  id AppBundleDirectory;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  std::string *v14;
  __int128 *v15;
  uint64_t v16;
  void *v17;
  std::string *v18;
  void *v19;
  unsigned __int8 v20;
  std::string *v21;
  int RecompilationType;
  std::string *v23;
  std::string *v24;
  id v25;
  void *v26;
  id v27;
  __int128 *v28;
  int v30;
  std::string v31;
  uint64_t v32[3];
  _QWORD *v33[2];
  id v34;
  std::string v35;
  __int128 *v36;
  __int128 *v37;
  _QWORD *v38[2];
  uint8_t v39[4];
  std::string *v40;
  __int16 v41;
  std::string *v42;
  std::string buf;
  void *v44;
  MTLAssetUpgraderD *v45;

  std::string::basic_string[abi:ne180100]<0>(&buf, (char *)&unk_10001C51B);
  CacheDirectory = MTLAssetUpgraderD::getCacheDirectory(2, (uint64_t *)&buf);
  v26 = (void *)objc_claimAutoreleasedReturnValue(CacheDirectory);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "URLByAppendingPathComponent:", CFSTR("upgraderWork.db")));
  if (v2)
  {
    v25 = v2;
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(objc_retainAutorelease(v2), "fileSystemRepresentation"));
    MTLVersionedDB::MTLVersionedDB(v38, (uint64_t *)&buf, 5, 1, 0);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    MTLAssetUpgraderD::listPrioritizedAppLaunches((uint64_t)&v36);
    v3 = v36;
    v28 = v37;
    if (v36 != v37)
    {
      v30 = 0;
      do
      {
        if (*((char *)v3 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v35, *(const std::string::value_type **)v3, *((_QWORD *)v3 + 1));
        }
        else
        {
          v4 = *v3;
          v35.__r_.__value_.__r.__words[2] = *((_QWORD *)v3 + 2);
          *(_OWORD *)&v35.__r_.__value_.__l.__data_ = v4;
        }
        v5 = objc_autoreleasePoolPush();
        AppBundleDirectory = MTLAssetUpgraderD::getAppBundleDirectory((uint64_t *)&v35);
        v7 = (void *)objc_claimAutoreleasedReturnValue(AppBundleDirectory);
        v8 = MTLAssetUpgraderD::getCacheDirectory(3, (uint64_t *)&v35);
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("archiveUsage.db")));
        v11 = v10;
        if (v7 && v10)
        {
          v34 = 0;
          v12 = objc_msgSend(v10, "checkResourceIsReachableAndReturnError:", &v34);
          v13 = v34;
          if ((v12 & 1) != 0)
          {
            v27 = v13;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v14 = &v35;
              if ((v35.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                v14 = (std::string *)v35.__r_.__value_.__r.__words[0];
              LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
              *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v14;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "processOSUpdate: updating bundleID %s", (uint8_t *)&buf, 0xCu);
            }
            std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(objc_retainAutorelease(v11), "fileSystemRepresentation"));
            MTLArchiveUsageDB::MTLArchiveUsageDB(v33, (uint64_t *)&buf);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
              operator delete(buf.__r_.__value_.__l.__data_);
            MTLArchiveUsageDB::getPrioritizedList((MTLArchiveUsageDB *)v33, v32);
            v15 = (__int128 *)v32[0];
            v16 = v32[1];
            while (v15 != (__int128 *)v16)
            {
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,std::string,unsigned int,unsigned int>::__tuple_impl(&buf, v15);
              if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
                std::string::__init_copy_ctor_external(&v31, buf.__r_.__value_.__l.__data_, buf.__r_.__value_.__l.__size_);
              else
                v31 = buf;
              v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager", v25));
              if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v18 = &v31;
              else
                v18 = (std::string *)v31.__r_.__value_.__r.__words[0];
              v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v18));
              v20 = objc_msgSend(v17, "fileExistsAtPath:", v19);

              if ((v20 & 1) != 0)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  v21 = &v31;
                  if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                    v21 = (std::string *)v31.__r_.__value_.__r.__words[0];
                  *(_DWORD *)v39 = 136315138;
                  v40 = v21;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "processOSUpdate: updating archive %s", v39, 0xCu);
                }
                RecompilationType = MTLAssetUpgraderD::getRecompilationType(v7, v9, (uint64_t *)&v31);
                if (RecompilationType == 2)
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  {
                    v23 = &v35;
                    if ((v35.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                      v23 = (std::string *)v35.__r_.__value_.__r.__words[0];
                    v24 = &v31;
                    if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                      v24 = (std::string *)v31.__r_.__value_.__r.__words[0];
                    *(_DWORD *)v39 = 136315394;
                    v40 = v23;
                    v41 = 2080;
                    v42 = v24;
                    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "processOSUpdate: Invalid recompilation bundleID=%s archive=%s", v39, 0x16u);
                  }
                }
                else
                {
                  v30 |= MTLAssetUpgraderD::addRecompilationWork(this, (int)v38, (uint64_t)&v35, (uint64_t)&v31, RecompilationType, (int)v44, SHIDWORD(v44));
                }
              }
              if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v31.__r_.__value_.__l.__data_);
              if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
                operator delete(buf.__r_.__value_.__l.__data_);
              v15 += 2;
            }
            buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v32;
            std::vector<std::tuple<std::string,unsigned int,unsigned int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
            MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v33);
            v13 = v27;
          }

        }
        objc_autoreleasePoolPop(v5);
        if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v35.__r_.__value_.__l.__data_);
        v3 = (__int128 *)((char *)v3 + 24);
      }
      while (v3 != v28);
      if ((v30 & 1) != 0)
      {
        buf.__r_.__value_.__r.__words[0] = (std::string::size_type)_NSConcreteStackBlock;
        buf.__r_.__value_.__l.__size_ = 3221225472;
        buf.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke;
        v44 = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
        v45 = this;
        xpc_activity_register("com.apple.MTLAssetUpgraderD.recompilationActivity", XPC_ACTIVITY_CHECK_IN, &buf);
      }
    }
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v36;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
    MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v38);
    v2 = v25;
  }

}

void sub_10000A0A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,char *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39,char a40)
{
  uint64_t v40;

  __p = &a40;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)(v40 - 192));

  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::setupXPCActivityHandler(MTLAssetUpgraderD *this)
{
  _QWORD v2[5];
  _QWORD handler[5];

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = this;
  xpc_activity_register("com.apple.MTLAssetUpgraderD.os-update", XPC_ACTIVITY_CHECK_IN, handler);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke_72;
  v2[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v2[4] = this;
  xpc_activity_register("com.apple.MTLAssetUpgraderD.prune", XPC_ACTIVITY_CHECK_IN, v2);
}

void ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  MTLAssetUpgraderD *v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a2;
  v4 = *(MTLAssetUpgraderD **)(a1 + 32);
  v5 = objc_autoreleasePoolPush();
  v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v6)
    ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke_cold_1(v6, v7, v8);
  if (xpc_activity_get_state(v3))
    MTLAssetUpgraderD::processOSUpdate(v4);
  objc_autoreleasePoolPop(v5);

}

void sub_10000A328(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke_72(uint64_t a1, void *a2)
{
  _xpc_activity_s *v2;
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  MTLAssetUpgraderD *state;

  v2 = a2;
  v3 = objc_autoreleasePoolPush();
  v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v4)
    ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke_72_cold_1(v4, v5, v6);
  state = (MTLAssetUpgraderD *)xpc_activity_get_state(v2);
  if (state)
    MTLAssetUpgraderD::processPrune(state);
  objc_autoreleasePoolPop(v3);

}

void sub_10000A398(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::popCurrentWorkItem(MTLAssetUpgraderD *this)
{
  id CacheDirectory;
  void *v2;
  void *v3;
  unsigned int v4[4];
  void *__p[2];
  char v6;

  std::string::basic_string[abi:ne180100]<0>(__p, (char *)&unk_10001C51B);
  CacheDirectory = MTLAssetUpgraderD::getCacheDirectory(2, (uint64_t *)__p);
  v2 = (void *)objc_claimAutoreleasedReturnValue(CacheDirectory);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("upgraderWork.db")));

  if (v6 < 0)
  {
    operator delete(__p[0]);
    if (!v3)
      goto LABEL_8;
  }
  else if (!v3)
  {
    goto LABEL_8;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation"));
  MTLVersionedDB::MTLVersionedDB((_QWORD **)v4, (uint64_t *)__p, 5, 1, 0);
  if (v6 < 0)
    operator delete(__p[0]);
  MTLWorkQueue<RecompilationWork>::pop(v4);
  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v4);
LABEL_8:

}

void sub_10000A478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;

  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)&a10);

  _Unwind_Resume(a1);
}

void MTLWorkQueue<RecompilationWork>::pop(unsigned int *a1)
{
  int v2;
  char *v3;
  int v4;
  int v5;
  char *v6;
  char *v7;
  _QWORD v8[2];
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[16];
  uint64_t v12[3];

  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v10, (MTLVersionedDB *)a1);
  if (!v10)
    goto LABEL_15;
  v9 = 0;
  v2 = mdb_cursor_open(v10, a1[2], &v9);
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v3 = mdb_strerror(v2);
      MTLWorkQueue<RecompilationWork>::push((uint64_t)v3, (uint64_t)v12);
    }
    goto LABEL_15;
  }
  v4 = mdb_cursor_get(v9, v12, v8, 0);
  if (!v4)
  {
    if (!MTLVersionedDB::isVersionEntry((uint64_t)a1, v12[0], (char *)v12[1]))
    {
LABEL_10:
      v5 = mdb_cursor_del(v9, 0);
      if (v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v6 = mdb_strerror(v5);
        MTLWorkQueue<RecompilationWork>::pop((uint64_t)v6, (uint64_t)v11);
      }
      goto LABEL_15;
    }
    v4 = mdb_cursor_get(v9, v12, v8, 8);
  }
  if (v4 == -30798)
    goto LABEL_15;
  if (!v4)
    goto LABEL_10;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v7 = mdb_strerror(v4);
    MTLWorkQueue<RecompilationWork>::push((uint64_t)v7, (uint64_t)v11);
  }
LABEL_15:
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v10);
}

void sub_10000A634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)va);
  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::remapTemporary(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id CacheDirectory;
  uint64_t v6;
  void *v7;
  void **v8;
  const char *v9;
  void **v10;
  void **v11;
  int *v12;
  char *v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  std::string *v22;
  void *v23;
  int v24;
  std::string::size_type v25;
  std::string::size_type v26;
  void *v27;
  std::string *v28;
  id v29;
  unsigned int v30[4];
  void *__p[2];
  char v32;
  std::string v33;
  std::string v34;

  v4 = *(_QWORD *)(a1 + 8);
  if (*(char *)(v4 + 71) < 0)
    std::string::__init_copy_ctor_external(&v34, *(const std::string::value_type **)(v4 + 48), *(_QWORD *)(v4 + 56));
  else
    v34 = *(std::string *)(v4 + 48);
  CacheDirectory = MTLAssetUpgraderD::getCacheDirectory(1, (uint64_t *)&v34);
  v6 = objc_claimAutoreleasedReturnValue(CacheDirectory);
  v7 = (void *)v6;
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v34.__r_.__value_.__l.__data_);
    if (!v7)
      goto LABEL_70;
  }
  else if (!v6)
  {
    goto LABEL_70;
  }
  std::string::basic_string[abi:ne180100]<0>(&v34, (char *)objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation"));
  MTLAssetUpgraderD::generateArchiveName((const char *)&v34, __p);
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v34.__r_.__value_.__l.__data_);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v8 = __p;
    if (v32 < 0)
      v8 = (void **)__p[0];
    LODWORD(v34.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)v34.__r_.__value_.__r.__words + 4) = (std::string::size_type)v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: rename bundle temporary to %s", (uint8_t *)&v34, 0xCu);
  }
  if (*(char *)(a2 + 23) >= 0)
    v9 = (const char *)a2;
  else
    v9 = *(const char **)a2;
  if (v32 >= 0)
    v10 = __p;
  else
    v10 = (void **)__p[0];
  if (renamex_np(v9, (const char *)v10, 0x10u))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      if (v32 >= 0)
        v11 = __p;
      else
        v11 = (void **)__p[0];
      if (*(char *)(a2 + 23) < 0)
        a2 = *(_QWORD *)a2;
      v12 = __error();
      v13 = strerror(*v12);
      MTLAssetUpgraderD::remapTemporary((uint64_t)v13, (uint64_t)&v34, (uint64_t)v11, a2);
    }
    v14 = 0;
    goto LABEL_67;
  }
  v15 = *(_QWORD *)(a1 + 8);
  if (*(char *)(v15 + 71) < 0)
    std::string::__init_copy_ctor_external(&v34, *(const std::string::value_type **)(v15 + 48), *(_QWORD *)(v15 + 56));
  else
    v34 = *(std::string *)(v15 + 48);
  v16 = MTLAssetUpgraderD::getCacheDirectory(0, (uint64_t *)&v34);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "URLByAppendingPathComponent:", CFSTR("archiveMapping.db")));

  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v34.__r_.__value_.__l.__data_);
    if (v18)
    {
LABEL_34:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        LODWORD(v34.__r_.__value_.__l.__data_) = 138412290;
        *(std::string::size_type *)((char *)v34.__r_.__value_.__r.__words + 4) = (std::string::size_type)v18;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: storing bundle archive map %@", (uint8_t *)&v34, 0xCu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v34, (char *)objc_msgSend(objc_retainAutorelease(v18), "fileSystemRepresentation"));
      MTLArchiveMapDB::MTLArchiveMapDB((_QWORD **)v30, (uint64_t *)&v34);
      if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v34.__r_.__value_.__l.__data_);
      v19 = *(_QWORD *)(a1 + 8);
      if (*(char *)(v19 + 95) < 0)
        std::string::__init_copy_ctor_external(&v33, *(const std::string::value_type **)(v19 + 72), *(_QWORD *)(v19 + 80));
      else
        v33 = *(std::string *)(v19 + 72);
      MTLArchiveMapDB::read(v30, (uint64_t)&v33, &v34);
      if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v33.__r_.__value_.__l.__data_);
      v20 = *(_QWORD *)(a1 + 8);
      if (*(char *)(v20 + 95) < 0)
      {
        std::string::__init_copy_ctor_external(&v33, *(const std::string::value_type **)(v20 + 72), *(_QWORD *)(v20 + 80));
        v20 = *(_QWORD *)(a1 + 8);
      }
      else
      {
        v33 = *(std::string *)(v20 + 72);
      }
      MTLArchiveMapDB::store((MTLVersionedDB *)v30, (uint64_t)&v33, (uint64_t *)__p, *(_DWORD *)(v20 + 12), *(_DWORD *)(v20 + 16));
      if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v33.__r_.__value_.__l.__data_);
      if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
      {
        if (!v34.__r_.__value_.__l.__size_)
        {
          v14 = 0;
LABEL_63:
          if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v34.__r_.__value_.__l.__data_);
          goto LABEL_65;
        }
      }
      else if (!*((_BYTE *)&v34.__r_.__value_.__s + 23))
      {
        v14 = 0;
LABEL_65:
        MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v30);
        goto LABEL_66;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v22 = &v34;
      else
        v22 = (std::string *)v34.__r_.__value_.__r.__words[0];
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v22));
      v29 = 0;
      objc_msgSend(v21, "removeItemAtPath:error:", v23, &v29);
      v14 = v29;

      if (v14 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v24 = SHIBYTE(v34.__r_.__value_.__r.__words[2]);
        v25 = v34.__r_.__value_.__r.__words[0];
        v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userInfo"));
        v27 = (void *)v26;
        v28 = &v34;
        if (v24 < 0)
          v28 = (std::string *)v25;
        LODWORD(v33.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)v33.__r_.__value_.__r.__words + 4) = (std::string::size_type)v28;
        WORD2(v33.__r_.__value_.__r.__words[1]) = 2112;
        *(std::string::size_type *)((char *)&v33.__r_.__value_.__r.__words[1] + 6) = v26;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "recompilation: removal of replaced binary archive '%s' failed: %@", (uint8_t *)&v33, 0x16u);

      }
      goto LABEL_63;
    }
  }
  else if (v18)
  {
    goto LABEL_34;
  }
  v14 = 0;
LABEL_66:

LABEL_67:
  if (v32 < 0)
    operator delete(__p[0]);

LABEL_70:
}

void sub_10000AB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  void *v30;
  void *v31;
  void *v32;

  if (a30 < 0)
    operator delete(__p);
  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)&a10);

  if (a17 < 0)
    operator delete(a12);

  _Unwind_Resume(a1);
}

BOOL MTLAssetUpgraderD::recompileSingleStep(MTLAssetUpgraderD *this)
{
  id CacheDirectory;
  void *v3;
  void *v4;
  _BOOL8 v5;
  id v6;
  BOOL valid;
  BOOL v8;
  uint64_t v9;
  id v10;
  MTLAssetUpgraderD *RecompilationType;
  int v12;
  int v13;
  id Device;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  int v23;
  int v24;
  MTLBinaryArchiveDescriptor *v25;
  std::string *v26;
  void *v27;
  uint64_t v28;
  id v29;
  _BOOL8 v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;
  void **v36;
  void *v37;
  uint64_t v38;
  unsigned int v39;
  id v40;
  const char *v41;
  _BOOL8 v42;
  void *v43;
  uint64_t v44;
  stat *p_p;
  _BYTE *v46;
  void *v47;
  void *v48;
  id v49;
  _BOOL8 v50;
  void *v51;
  uint64_t v52;
  unsigned int v53;
  id v54;
  void *v55;
  const char *v56;
  void **v57;
  void *v58;
  void *v59;
  unsigned __int8 v60;
  uint64_t v61;
  int v62;
  void *v63;
  void *v64;
  void *v65;
  _BOOL8 v66;
  void *v67;
  void *v68;
  _BOOL8 v69;
  void *v70;
  void **v71;
  void *v72;
  void *v73;
  _BOOL8 v74;
  void **v75;
  _BOOL8 v76;
  void **v77;
  std::string *v78;
  void **v79;
  std::string *v80;
  _BOOL8 v81;
  std::string *v82;
  void **v83;
  int *v84;
  char *v85;
  int v86;
  MTLAssetUpgraderD *v87;
  int v88;
  std::string::size_type v89;
  uint64_t v90;
  void *v91;
  std::string *v92;
  std::string *v93;
  void *v94;
  void *v95;
  void *v96;
  _BOOL8 v97;
  id v98;
  id v99;
  uint64_t v100;
  void *i;
  char *v102;
  __int128 v103;
  void *v104;
  int v105;
  std::string::size_type v106;
  int v107;
  void **v108;
  uint64_t v109;
  void *v110;
  void **v111;
  std::string *v112;
  int v113;
  std::string::size_type v114;
  int v115;
  void **v116;
  uint64_t v117;
  void *v118;
  void **v119;
  std::string *v120;
  void *v121;
  id v122;
  id v123;
  MTLBinaryArchiveDescriptor *v124;
  id obj;
  id v126;
  void *v127;
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  id v133;
  std::string v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  void *v141[2];
  char v142;
  id v143;
  uint64_t v144;
  unsigned int v145[4];
  _BYTE v146[128];
  _BYTE v147[32];
  stat __p;
  std::string v149;

  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)&unk_10001C51B);
  CacheDirectory = MTLAssetUpgraderD::getCacheDirectory(2, (uint64_t *)&__p.st_dev);
  v3 = (void *)objc_claimAutoreleasedReturnValue(CacheDirectory);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("upgraderWork.db")));

  if (SHIBYTE(__p.st_gid) < 0)
  {
    operator delete(*(void **)&__p.st_dev);
    if (v4)
    {
LABEL_3:
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(objc_retainAutorelease(v4), "fileSystemRepresentation"));
      MTLVersionedDB::MTLVersionedDB((_QWORD **)v145, (uint64_t *)&__p.st_dev, 5, 1, 0);
      if (SHIBYTE(__p.st_gid) < 0)
        operator delete(*(void **)&__p.st_dev);
      MTLWorkQueue<RecompilationWork>::peek(v145, &v144);
      v5 = v144 != 0;
      if (!v144)
        goto LABEL_48;
      if (*(_DWORD *)(v144 + 40) == 1)
      {
        v6 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          if (*(char *)(v144 + 95) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)v147, *(const std::string::value_type **)(v144 + 72), *(_QWORD *)(v144 + 80));
          }
          else
          {
            *(_OWORD *)v147 = *(_OWORD *)(v144 + 72);
            *(_QWORD *)&v147[16] = *(_QWORD *)(v144 + 88);
          }
          MTLAssetUpgraderD::recompileSingleStep();
        }
LABEL_44:

LABEL_45:
        MTLWorkQueue<RecompilationWork>::pop(v145);
LABEL_46:
        v21 = v144;
        v144 = 0;
        if (v21)
          (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
LABEL_48:
        MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v145);
        goto LABEL_49;
      }
      MTLWorkQueue<RecompilationWork>::setState(v145);
      if (*(char *)(v144 + 71) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)&__p, *(const std::string::value_type **)(v144 + 48), *(_QWORD *)(v144 + 56));
      }
      else
      {
        *(_OWORD *)&__p.st_dev = *(_OWORD *)(v144 + 48);
        *(_QWORD *)&__p.st_uid = *(_QWORD *)(v144 + 64);
      }
      valid = isValidAppName((char *)&__p);
      v8 = valid;
      if (SHIBYTE(__p.st_gid) < 0)
      {
        operator delete(*(void **)&__p.st_dev);
        if (v8)
        {
LABEL_17:
          v9 = v144;
          if (*(char *)(v144 + 71) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)&__p, *(const std::string::value_type **)(v144 + 48), *(_QWORD *)(v144 + 56));
            v9 = v144;
          }
          else
          {
            *(_OWORD *)&__p.st_dev = *(_OWORD *)(v144 + 48);
            *(_QWORD *)&__p.st_uid = *(_QWORD *)(v144 + 64);
          }
          if (*(char *)(v9 + 95) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)v147, *(const std::string::value_type **)(v9 + 72), *(_QWORD *)(v9 + 80));
          }
          else
          {
            *(_OWORD *)v147 = *(_OWORD *)(v9 + 72);
            *(_QWORD *)&v147[16] = *(_QWORD *)(v9 + 88);
          }
          RecompilationType = (MTLAssetUpgraderD *)MTLAssetUpgraderD::getRecompilationType((uint64_t *)&__p.st_dev, (uint64_t *)v147);
          v12 = (int)RecompilationType;
          v13 = *(_DWORD *)(v144 + 8);
          if ((v147[23] & 0x80000000) != 0)
            operator delete(*(void **)v147);
          if (SHIBYTE(__p.st_gid) < 0)
            operator delete(*(void **)&__p.st_dev);
          if (v12 != v13)
          {
            v20 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              v44 = v144;
              if (*(char *)(v144 + 71) < 0)
              {
                std::string::__init_copy_ctor_external((std::string *)&__p, *(const std::string::value_type **)(v144 + 48), *(_QWORD *)(v144 + 56));
                v44 = v144;
              }
              else
              {
                *(_OWORD *)&__p.st_dev = *(_OWORD *)(v144 + 48);
                *(_QWORD *)&__p.st_uid = *(_QWORD *)(v144 + 64);
              }
              if ((__p.st_gid & 0x80000000) == 0)
                p_p = &__p;
              else
                p_p = *(stat **)&__p.st_dev;
              if (*(char *)(v44 + 95) < 0)
              {
                std::string::__init_copy_ctor_external((std::string *)v147, *(const std::string::value_type **)(v44 + 72), *(_QWORD *)(v44 + 80));
              }
              else
              {
                *(_OWORD *)v147 = *(_OWORD *)(v44 + 72);
                *(_QWORD *)&v147[16] = *(_QWORD *)(v44 + 88);
              }
              v46 = v147;
              if (v147[23] < 0)
                v46 = *(_BYTE **)v147;
              LODWORD(v149.__r_.__value_.__l.__data_) = 136315394;
              *(std::string::size_type *)((char *)v149.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_p;
              WORD2(v149.__r_.__value_.__r.__words[1]) = 2080;
              *(std::string::size_type *)((char *)&v149.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v46;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "recompilation: invalid archive for recompilation bundleID=%s archivePath=%s", (uint8_t *)&v149, 0x16u);
              if ((v147[23] & 0x80000000) != 0)
                operator delete(*(void **)v147);
              if (SHIBYTE(__p.st_gid) < 0)
                operator delete(*(void **)&__p.st_dev);
            }
            goto LABEL_44;
          }
          Device = MTLAssetUpgraderD::findDevice(RecompilationType, *(_DWORD *)(v144 + 12), *(_DWORD *)(v144 + 16));
          v15 = objc_claimAutoreleasedReturnValue(Device);
          v16 = (void *)*((_QWORD *)this + 2);
          *((_QWORD *)this + 2) = v15;

          if (!*((_QWORD *)this + 2))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              v24 = *(_DWORD *)(v144 + 12);
              v23 = *(_DWORD *)(v144 + 16);
              __p.st_dev = 67109376;
              *(_DWORD *)&__p.st_mode = v24;
              LOWORD(__p.st_ino) = 1024;
              *(_DWORD *)((char *)&__p.st_ino + 2) = v23;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: couldn't find device for (%08X %08X)", (uint8_t *)&__p, 0xEu);
            }
            goto LABEL_45;
          }
          v18 = (char *)this + 8;
          v17 = *((_QWORD *)this + 1);
          v19 = v144;
          v144 = 0;
          *((_QWORD *)this + 1) = v19;
          if (v17)
          {
            (*(void (**)(uint64_t))(*(_QWORD *)v17 + 8))(v17);
            v19 = *(_QWORD *)v18;
          }
          if (*(char *)(v19 + 95) < 0)
            std::string::__init_copy_ctor_external(&v149, *(const std::string::value_type **)(v19 + 72), *(_QWORD *)(v19 + 80));
          else
            v149 = *(std::string *)(v19 + 72);
          v25 = objc_opt_new(MTLBinaryArchiveDescriptor);
          if ((v149.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v26 = &v149;
          else
            v26 = (std::string *)v149.__r_.__value_.__r.__words[0];
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v26));
          v28 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v27));
          -[MTLBinaryArchiveDescriptor setUrl:](v25, "setUrl:", v28);

          -[MTLBinaryArchiveDescriptor setOptions:](v25, "setOptions:", (unint64_t)-[MTLBinaryArchiveDescriptor options](v25, "options") | 0x18);
          v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url")));
          LOBYTE(v28) = stat((const char *)objc_msgSend(v29, "fileSystemRepresentation"), &__p) == 0;

          if ((v28 & 1) == 0)
          {
            v30 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v30)
            {
              objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
              MTLAssetUpgraderD::recompileSingleStep();
            }
            MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v30);
            v31 = 0;
            goto LABEL_170;
          }
          std::string::basic_string[abi:ne180100]<0>(v147, (char *)&unk_10001C51B);
          v32 = MTLAssetUpgraderD::getCacheDirectory(2, (uint64_t *)v147);
          v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
          if ((v147[23] & 0x80000000) != 0)
            operator delete(*(void **)v147);
          v127 = v33;
          v128 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "URLByAppendingPathComponent:", CFSTR("temp")));
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          v143 = 0;
          v35 = objc_msgSend(v34, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v128, 1, 0, &v143);
          v31 = v143;

          if ((v35 & 1) == 0)
          {
            v42 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v42)
              MTLAssetUpgraderD::recompileSingleStep();
            v43 = v128;
            MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v42);
            goto LABEL_169;
          }
          std::string::basic_string[abi:ne180100]<0>(v147, (char *)objc_msgSend(objc_retainAutorelease(v128), "fileSystemRepresentation"));
          MTLAssetUpgraderD::generateArchiveName(v147, v141);
          if ((v147[23] & 0x80000000) != 0)
            operator delete(*(void **)v147);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            v36 = v141;
            if (v142 < 0)
              v36 = (void **)v141[0];
            *(_DWORD *)v147 = 136315138;
            *(_QWORD *)&v147[4] = v36;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: bundle temporary location %s", v147, 0xCu);
          }
          v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
          v38 = *((_QWORD *)this + 2);
          v140 = v31;
          v39 = +[_MTLBinaryArchive archiveTypeAtURL:device:error:](_MTLBinaryArchive, "archiveTypeAtURL:device:error:", v37, v38, &v140);
          v40 = v140;

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            if (v39 > 4)
              v41 = "Unknown";
            else
              v41 = off_100020638[v39];
            v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
            *(_DWORD *)v147 = 136315394;
            *(_QWORD *)&v147[4] = v41;
            *(_WORD *)&v147[12] = 2112;
            *(_QWORD *)&v147[14] = v47;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: %s - %@", v147, 0x16u);

          }
          if (v39 != 3)
          {
            v51 = (void *)objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
            v52 = *((_QWORD *)this + 2);
            v139 = v40;
            v53 = +[_MTLDynamicLibrary dynamicLibraryTypeAtURL:device:error:](_MTLDynamicLibrary, "dynamicLibraryTypeAtURL:device:error:", v51, v52, &v139);
            v54 = v139;

            v55 = v54;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              if (v53 > 4)
                v56 = "Unknown";
              else
                v56 = off_100020660[v53];
              v63 = (void *)objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
              *(_DWORD *)v147 = 136315394;
              *(_QWORD *)&v147[4] = v56;
              *(_WORD *)&v147[12] = 2112;
              *(_QWORD *)&v147[14] = v63;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: %s - %@", v147, 0x16u);

            }
            if ((v53 & 0xFFFFFFFD) != 1)
            {
              v69 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
              if (v69)
              {
                v70 = (void *)objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
                *(_DWORD *)v147 = 138412290;
                *(_QWORD *)&v147[4] = v70;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: %@ has unexpected dylib type", v147, 0xCu);

              }
              MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v69);
              goto LABEL_166;
            }

            v64 = (void *)*((_QWORD *)this + 2);
            v65 = (void *)objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
            v138 = 0;
            v126 = objc_msgSend(v64, "newDynamicLibraryWithURL:error:", v65, &v138);
            v49 = v138;

            if (v49)
            {
              v66 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v66)
              {
                v67 = (void *)objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
                v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "userInfo"));
                MTLAssetUpgraderD::recompileSingleStep(v67, v68, (uint64_t)v147);
              }
              MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v66);
              goto LABEL_165;
            }
            if (v142 >= 0)
              v71 = v141;
            else
              v71 = (void **)v141[0];
            v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v71));
            v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v72));
            v137 = 0;
            objc_msgSend(v126, "serializeToURL:error:", v73, &v137);
            v49 = v137;

            if (v49)
            {
              v74 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v74)
              {
                objc_claimAutoreleasedReturnValue(-[MTLBinaryArchiveDescriptor url](v25, "url"));
                MTLAssetUpgraderD::recompileSingleStep();
              }
              MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v74);
              goto LABEL_165;
            }
            MTLAssetUpgraderD::remapTemporary((uint64_t)this, (uint64_t)v141);
            goto LABEL_164;
          }
          v48 = (void *)*((_QWORD *)this + 2);
          v136 = v40;
          v126 = objc_msgSend(v48, "newBinaryArchiveWithDescriptor:error:", v25, &v136);
          v49 = v136;

          if (v49)
          {
            v50 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v50)
            {
              v88 = SHIBYTE(v149.__r_.__value_.__r.__words[2]);
              v89 = v149.__r_.__value_.__r.__words[0];
              v90 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "userInfo"));
              v91 = (void *)v90;
              v92 = &v149;
              if (v88 < 0)
                v92 = (std::string *)v89;
              *(_DWORD *)v147 = 136315394;
              *(_QWORD *)&v147[4] = v92;
              *(_WORD *)&v147[12] = 2112;
              *(_QWORD *)&v147[14] = v90;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "recompilation: failed open of archive '%s': %@", v147, 0x16u);

            }
            MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v50);
LABEL_165:

            v55 = v49;
            goto LABEL_166;
          }
          if (v142 >= 0)
            v57 = v141;
          else
            v57 = (void **)v141[0];
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v57));
          v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v58));
          v135 = 0;
          v60 = objc_msgSend(v126, "recompileToArchiveWithURL:error:", v59, &v135);
          v49 = v135;

          v61 = *(_QWORD *)v18;
          v62 = *(_DWORD *)(*(_QWORD *)v18 + 8);
          if (!v62)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              v75 = v141;
              if (v142 < 0)
                v75 = (void **)v141[0];
              *(_DWORD *)v147 = 136315138;
              *(_QWORD *)&v147[4] = v75;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: serialize bundle temporary %s", v147, 0xCu);
            }
            if ((v60 & 1) == 0)
            {
              v76 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v76)
              {
                v105 = SHIBYTE(v149.__r_.__value_.__r.__words[2]);
                v106 = v149.__r_.__value_.__r.__words[0];
                v107 = v142;
                v108 = (void **)v141[0];
                v109 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "userInfo"));
                v110 = (void *)v109;
                v111 = v141;
                if (v107 < 0)
                  v111 = v108;
                *(_DWORD *)v147 = 136315650;
                v112 = &v149;
                if (v105 < 0)
                  v112 = (std::string *)v106;
                *(_QWORD *)&v147[4] = v112;
                *(_WORD *)&v147[12] = 2080;
                *(_QWORD *)&v147[14] = v111;
                *(_WORD *)&v147[22] = 2112;
                *(_QWORD *)&v147[24] = v109;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "recompilation: recompilation failed for archive '%s' to '%s' : %@", v147, 0x20u);

              }
              MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v76);
              goto LABEL_165;
            }
            MTLAssetUpgraderD::remapTemporary((uint64_t)this, (uint64_t)v141);
            goto LABEL_164;
          }
          if (v62 != 1)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              MTLAssetUpgraderD::recompileSingleStep((uint64_t)this + 8);
            goto LABEL_164;
          }
          if (*(char *)(v61 + 95) < 0)
            std::string::__init_copy_ctor_external(&v134, *(const std::string::value_type **)(v61 + 72), *(_QWORD *)(v61 + 80));
          else
            v134 = *(std::string *)(v61 + 72);
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            v77 = v141;
            if (v142 < 0)
              v77 = (void **)v141[0];
            *(_DWORD *)v147 = 136315138;
            *(_QWORD *)&v147[4] = v77;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: serialize cache temporary %s", v147, 0xCu);
          }
          if ((v60 & 1) != 0)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              v78 = &v134;
              if ((v134.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                v78 = (std::string *)v134.__r_.__value_.__r.__words[0];
              *(_DWORD *)v147 = 136315138;
              *(_QWORD *)&v147[4] = v78;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: rename cache temporary to %s", v147, 0xCu);
            }
            if (v142 >= 0)
              v79 = v141;
            else
              v79 = (void **)v141[0];
            if ((v134.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v80 = &v134;
            else
              v80 = (std::string *)v134.__r_.__value_.__r.__words[0];
            if (!renamex_np((const char *)v79, (const char *)v80, 0x10u))
            {
              v124 = objc_opt_new(MTLBinaryArchiveDescriptor);
              if ((v134.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v93 = &v134;
              else
                v93 = (std::string *)v134.__r_.__value_.__r.__words[0];
              v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v93));
              v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v94));
              -[MTLBinaryArchiveDescriptor setUrl:](v124, "setUrl:", v95);

              v96 = (void *)*((_QWORD *)this + 2);
              v133 = v49;
              v122 = objc_msgSend(v96, "newBinaryArchiveWithDescriptor:error:", v124, &v133);
              v123 = v133;

              if (v123)
              {
                v97 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                if (v97)
                {
                  objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "userInfo"));
                  MTLAssetUpgraderD::recompileSingleStep();
                }
                MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v97);
                v86 = 1;
              }
              else
              {
                v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v122, "archiveFunctionIds"));
                v98 = objc_alloc_init((Class)NSMutableArray);
                v131 = 0u;
                v132 = 0u;
                v129 = 0u;
                v130 = 0u;
                obj = v121;
                v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v146, 16);
                if (v99)
                {
                  v100 = *(_QWORD *)v130;
                  do
                  {
                    for (i = 0; i != v99; i = (char *)i + 1)
                    {
                      if (*(_QWORD *)v130 != v100)
                        objc_enumerationMutation(obj);
                      v102 = (char *)objc_msgSend(*(id *)(*((_QWORD *)&v129 + 1) + 8 * (_QWORD)i), "pointerValue", v121);
                      v103 = *(_OWORD *)(v102 + 40);
                      *(_OWORD *)v147 = *(_OWORD *)(v102 + 24);
                      *(_OWORD *)&v147[16] = v103;
                      v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v147, 32));
                      objc_msgSend(v98, "addObject:", v104);

                    }
                    v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v129, v146, 16);
                  }
                  while (v99);
                }

                v86 = 2;
              }

              v49 = v123;
LABEL_161:
              if (SHIBYTE(v134.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v134.__r_.__value_.__l.__data_);
              if (v86 != 2)
                goto LABEL_165;
LABEL_164:

              MTLAssetUpgraderD::popCurrentWorkItem(v87);
              v55 = v49;
LABEL_166:
              if (v142 < 0)
                operator delete(v141[0]);
              v31 = v55;
              v43 = v128;
LABEL_169:

LABEL_170:
              if (SHIBYTE(v149.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v149.__r_.__value_.__l.__data_);
              goto LABEL_46;
            }
            v81 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v81)
            {
              if ((v134.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v82 = &v134;
              else
                v82 = (std::string *)v134.__r_.__value_.__r.__words[0];
              if (v142 >= 0)
                v83 = v141;
              else
                v83 = (void **)v141[0];
              v84 = __error();
              v85 = strerror(*v84);
              MTLAssetUpgraderD::remapTemporary((uint64_t)v85, (uint64_t)v147, (uint64_t)v82, (uint64_t)v83);
            }
          }
          else
          {
            v81 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v81)
            {
              v113 = SHIBYTE(v149.__r_.__value_.__r.__words[2]);
              v114 = v149.__r_.__value_.__r.__words[0];
              v115 = v142;
              v116 = (void **)v141[0];
              v117 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "userInfo"));
              v118 = (void *)v117;
              v119 = v141;
              if (v115 < 0)
                v119 = v116;
              *(_DWORD *)v147 = 136315650;
              v120 = &v149;
              if (v113 < 0)
                v120 = (std::string *)v114;
              *(_QWORD *)&v147[4] = v120;
              *(_WORD *)&v147[12] = 2080;
              *(_QWORD *)&v147[14] = v119;
              *(_WORD *)&v147[22] = 2112;
              *(_QWORD *)&v147[24] = v117;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "recompilation: recompilation failed for archive '%s' to '%s' : %@", v147, 0x20u);

            }
          }
          MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v81);
          v86 = 1;
          goto LABEL_161;
        }
      }
      else if (valid)
      {
        goto LABEL_17;
      }
      v10 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        if (*(char *)(v144 + 71) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)&__p, *(const std::string::value_type **)(v144 + 48), *(_QWORD *)(v144 + 56));
        }
        else
        {
          *(_OWORD *)&__p.st_dev = *(_OWORD *)(v144 + 48);
          *(_QWORD *)&__p.st_uid = *(_QWORD *)(v144 + 64);
        }
        MTLAssetUpgraderD::recompileSingleStep();
      }
      goto LABEL_44;
    }
  }
  else if (v4)
  {
    goto LABEL_3;
  }
  v5 = 0;
LABEL_49:

  return v5;
}

void sub_10000BE5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *__p,uint64_t a40,int a41,__int16 a42,char a43,char a44,uint64_t a45,uint64_t a46,char a47)
{
  void *v47;
  void *v48;
  uint64_t v49;

  if (a32 < 0)
    operator delete(a27);

  if (a44 < 0)
    operator delete(__p);

  if (*(char *)(v49 - 105) < 0)
    operator delete(*(void **)(v49 - 128));
  if (a46)
    (*(void (**)(uint64_t))(*(_QWORD *)a46 + 8))(a46);
  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)&a47);

  _Unwind_Resume(a1);
}

void MTLWorkQueue<RecompilationWork>::peek(unsigned int *a1@<X0>, _QWORD *a2@<X8>)
{
  int v4;
  char *v5;
  int v6;
  char *v7;
  _QWORD v8[2];
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[16];
  uint64_t v12[3];

  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v10, (MTLVersionedDB *)a1);
  if (!v10)
    goto LABEL_13;
  v9 = 0;
  v4 = mdb_cursor_open(v10, a1[2], &v9);
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v5 = mdb_strerror(v4);
      MTLWorkQueue<RecompilationWork>::push((uint64_t)v5, (uint64_t)v12);
    }
    goto LABEL_13;
  }
  v6 = mdb_cursor_get(v9, v12, v8, 0);
  if (!v6)
  {
    if (!MTLVersionedDB::isVersionEntry((uint64_t)a1, v12[0], (char *)v12[1]))
      goto LABEL_10;
    v6 = mdb_cursor_get(v9, v12, v8, 8);
  }
  if (v6 == -30798)
    goto LABEL_13;
  if (!v6)
LABEL_10:
    operator new();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v7 = mdb_strerror(v6);
    MTLWorkQueue<RecompilationWork>::push((uint64_t)v7, (uint64_t)v11);
  }
LABEL_13:
  *a2 = 0;
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v10);
}

void sub_10000C330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)va);
  _Unwind_Resume(a1);
}

void MTLWorkQueue<RecompilationWork>::setState(unsigned int *a1)
{
  int v2;
  char *v3;
  int v4;
  char *v5;
  _QWORD v6[2];
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10[3];

  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v8, (MTLVersionedDB *)a1);
  if (!v8)
    goto LABEL_13;
  v7 = 0;
  v2 = mdb_cursor_open(v8, a1[2], &v7);
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v3 = mdb_strerror(v2);
      MTLWorkQueue<RecompilationWork>::push((uint64_t)v3, (uint64_t)v10);
    }
    goto LABEL_13;
  }
  v4 = mdb_cursor_get(v7, v10, v6, 0);
  if (!v4)
  {
    if (!MTLVersionedDB::isVersionEntry((uint64_t)a1, v10[0], (char *)v10[1]))
      goto LABEL_10;
    v4 = mdb_cursor_get(v7, v10, v6, 8);
  }
  if (v4 == -30798)
    goto LABEL_13;
  if (!v4)
LABEL_10:
    operator new();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v5 = mdb_strerror(v4);
    MTLWorkQueue<RecompilationWork>::push((uint64_t)v5, (uint64_t)&v9);
  }
LABEL_13:
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v8);
}

void sub_10000C580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)va);
  _Unwind_Resume(a1);
}

void ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  MTLAssetUpgraderD *v4;
  int state;
  std::chrono::steady_clock::time_point v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  id CacheDirectory;
  void *v11;
  xpc_object_t empty;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21[4];
  void *__p[2];
  char v23;
  uint8_t buf[8];

  v3 = a2;
  v4 = *(MTLAssetUpgraderD **)(a1 + 32);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    state = xpc_activity_get_state(v3);
    ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke_cold_3(state, buf);
  }
  if (xpc_activity_get_state(v3))
  {
    v6.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    do
    {
      if (!MTLAssetUpgraderD::recompileSingleStep(v4))
        goto LABEL_22;
    }
    while (std::chrono::steady_clock::now().__d_.__rep_ - v6.__d_.__rep_ < 2501000000
         || !xpc_activity_should_defer(v3));
    v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v7)
      ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke_cold_2(v7, v8, v9);
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)&unk_10001C51B);
    CacheDirectory = MTLAssetUpgraderD::getCacheDirectory(2, (uint64_t *)__p);
    v11 = (void *)objc_claimAutoreleasedReturnValue(CacheDirectory);
    empty = (xpc_object_t)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("upgraderWork.db")));

    if (v23 < 0)
    {
      operator delete(__p[0]);
      if (!empty)
      {
LABEL_18:
        if (!xpc_activity_set_state(v3, 3))
        {
          v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v13)
            ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke_cold_1(v13, v14, v15, v16, v17, v18, v19, v20);
        }
        goto LABEL_21;
      }
    }
    else if (!empty)
    {
      goto LABEL_18;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(empty), "fileSystemRepresentation"));
    MTLVersionedDB::MTLVersionedDB((_QWORD **)v21, (uint64_t *)__p, 5, 1, 0);
    if (v23 < 0)
      operator delete(__p[0]);
    MTLWorkQueue<RecompilationWork>::setState(v21);
    MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v21);
    goto LABEL_18;
  }
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(empty, XPC_ACTIVITY_DELAY, 5);
  xpc_activity_set_criteria(v3, empty);
LABEL_21:

LABEL_22:
}

void sub_10000C800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;
  void *v18;

  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)&a10);

  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::run(id *this)
{
  objc_storeStrong(this, &_dispatch_main_q);
  MTLAssetUpgraderD::setupAppHandler((NSObject **)this);
  MTLAssetUpgraderD::setupXPCActivityHandler((MTLAssetUpgraderD *)this);
  MTLAssetUpgraderD::kickRecompilationActivity((MTLAssetUpgraderD *)this);
  dispatch_main();
}

int main(int argc, const char **argv, const char **envp)
{
  id v3[4];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v3[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "MTLAssetUpgraderD startup", (uint8_t *)v3, 2u);
  }
  memset(v3, 0, 24);
  MTLAssetUpgraderD::run(v3);
}

void sub_10000C934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  MTLAssetUpgraderD::~MTLAssetUpgraderD(&a9);
  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::~MTLAssetUpgraderD(id *this)
{
  id v2;

  v2 = this[1];
  this[1] = 0;
  if (v2)
    (*(void (**)(id))(*(_QWORD *)v2 + 8))(v2);

}

uint64_t RecompilationWork::RecompilationWork(uint64_t a1, __int128 *a2, __int128 *a3, int a4, int a5, int a6)
{
  __int128 v9;
  std::string *v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)a1 = off_1000205E8;
  *(_DWORD *)(a1 + 8) = a4;
  *(_DWORD *)(a1 + 12) = a5;
  *(_DWORD *)(a1 + 16) = a6;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 37) = 0;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 48), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v9 = *a2;
    *(_QWORD *)(a1 + 64) = *((_QWORD *)a2 + 2);
    *(_OWORD *)(a1 + 48) = v9;
  }
  v10 = (std::string *)(a1 + 72);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v11 = *a3;
    *(_QWORD *)(a1 + 88) = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  }
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = 0;
  v12 = *((unsigned __int8 *)a2 + 23);
  if ((v12 & 0x80u) != 0)
    v12 = *((_QWORD *)a2 + 1);
  *(_QWORD *)(a1 + 24) = v12;
  v13 = *((unsigned __int8 *)a3 + 23);
  if ((v13 & 0x80u) != 0)
    v13 = *((_QWORD *)a3 + 1);
  *(_QWORD *)(a1 + 32) = v13;
  return a1;
}

void sub_10000CA64(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 71) < 0)
    operator delete(*v2);
  _Unwind_Resume(exception_object);
}

void RecompilationWork::~RecompilationWork(RecompilationWork *this)
{
  RecompilationWork::~RecompilationWork(this);
  operator delete();
}

{
  *(_QWORD *)this = off_1000205E8;
  if (*((_QWORD *)this + 12))
    operator delete[]();
  if (*((char *)this + 95) < 0)
    operator delete(*((void **)this + 9));
  if (*((char *)this + 71) < 0)
    operator delete(*((void **)this + 6));
}

double RecompilationWork::deserialize(uint64_t a1, _QWORD *a2)
{
  __int128 *v4;
  __int128 v5;
  __int128 v6;
  size_t v7;
  void **v8;
  void **v9;
  __int128 __dst;
  uint64_t v12;

  if (*a2 >= 0x28uLL)
  {
    v4 = (__int128 *)a2[1];
    v5 = *v4;
    v6 = v4[1];
    *(_QWORD *)(a1 + 40) = *((_QWORD *)v4 + 4);
    *(_OWORD *)(a1 + 24) = v6;
    *(_OWORD *)(a1 + 8) = v5;
    v7 = *(_QWORD *)(a1 + 24);
    if (*a2 == v7 + *(_QWORD *)(a1 + 32) + 40)
    {
      std::string::basic_string[abi:ne180100](&__dst, (void *)(a2[1] + 40), v7);
      v8 = (void **)(a1 + 48);
      if (*(char *)(a1 + 71) < 0)
        operator delete(*v8);
      *(_OWORD *)v8 = __dst;
      *(_QWORD *)(a1 + 64) = v12;
      std::string::basic_string[abi:ne180100](&__dst, (void *)(a2[1] + *(_QWORD *)(a1 + 24) + 40), *(_QWORD *)(a1 + 32));
      v9 = (void **)(a1 + 72);
      if (*(char *)(a1 + 95) < 0)
        operator delete(*v9);
      *(_QWORD *)&v5 = __dst;
      *(_OWORD *)v9 = __dst;
      *(_QWORD *)(a1 + 88) = v12;
    }
  }
  return *(double *)&v5;
}

void RecompilationWork::serialization(RecompilationWork *this)
{
  operator new();
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
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

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
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

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::string *v4;
  std::string *begin;
  std::string *end;
  std::string *value;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
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

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100]((uint64_t)this, (void **)&this->__begin_->__r_.__value_.__l.__data_);
  if (this->__first_)
    operator delete(this->__first_);
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
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

uint64_t operator==(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  const void **v8;
  unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const void **v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  BOOL v25;
  uint64_t result;

  if (*(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 8)
    || *(_DWORD *)(a1 + 12) != *(_DWORD *)(a2 + 12)
    || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16))
  {
    return 0;
  }
  v4 = *(unsigned __int8 *)(a1 + 71);
  if ((v4 & 0x80u) == 0)
    v5 = *(unsigned __int8 *)(a1 + 71);
  else
    v5 = *(_QWORD *)(a1 + 56);
  v6 = *(unsigned __int8 *)(a2 + 71);
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *(_QWORD *)(a2 + 56);
  if (v5 != v6)
    return 0;
  v8 = (const void **)(a1 + 48);
  if (v7 >= 0)
    v9 = (unsigned __int8 *)(a2 + 48);
  else
    v9 = *(unsigned __int8 **)(a2 + 48);
  if ((v4 & 0x80) != 0)
  {
    if (memcmp(*v8, v9, *(_QWORD *)(a1 + 56)))
      return 0;
  }
  else if (*(_BYTE *)(a1 + 71))
  {
    while (*(unsigned __int8 *)v8 == *v9)
    {
      v8 = (const void **)((char *)v8 + 1);
      ++v9;
      if (!--v4)
        goto LABEL_19;
    }
    return 0;
  }
LABEL_19:
  v10 = *(unsigned __int8 *)(a1 + 95);
  if ((v10 & 0x80u) == 0)
    v11 = *(unsigned __int8 *)(a1 + 95);
  else
    v11 = *(_QWORD *)(a1 + 80);
  v12 = *(unsigned __int8 *)(a2 + 95);
  v13 = (char)v12;
  if ((v12 & 0x80u) != 0)
    v12 = *(_QWORD *)(a2 + 80);
  if (v11 != v12)
    return 0;
  v14 = (const void **)(a1 + 72);
  v17 = *(unsigned __int8 **)(a2 + 72);
  v16 = (unsigned __int8 *)(a2 + 72);
  v15 = v17;
  if (v13 >= 0)
    v18 = v16;
  else
    v18 = v15;
  if ((v10 & 0x80) != 0)
    return memcmp(*v14, v18, *(_QWORD *)(a1 + 80)) == 0;
  if (!*(_BYTE *)(a1 + 95))
    return 1;
  v19 = v10 - 1;
  do
  {
    v21 = *(unsigned __int8 *)v14;
    v14 = (const void **)((char *)v14 + 1);
    v20 = v21;
    v23 = *v18++;
    v22 = v23;
    v25 = v19-- != 0;
    result = v20 == v22;
  }
  while (v20 == v22 && v25);
  return result;
}

uint64_t OUTLINED_FUNCTION_1(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_7(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, float a5)
{
  *(float *)a2 = a5;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2080;
  *(_QWORD *)(a2 + 14) = a4;
  *(_WORD *)(a2 + 22) = 2080;
  *(_QWORD *)(a2 + 24) = result;
  return result;
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_12(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_15(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void FileSignature::FileSignature(FileSignature *this)
{
  *(_DWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 4) = 0;
}

uint64_t FileSignature::FileSignature(uint64_t a1, uint64_t a2)
{
  const char *v4;
  const char *v5;
  _BYTE v7[4];
  int v8;
  __int128 v9;
  uint64_t v10;
  stat v11;

  *(_DWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  if (*(char *)(a2 + 23) >= 0)
    v4 = (const char *)a2;
  else
    v4 = *(const char **)a2;
  if (!stat(v4, &v11))
  {
    *(_DWORD *)a1 = v11.st_dev;
    *(_QWORD *)(a1 + 8) = v11.st_ino;
  }
  v10 = 0;
  v9 = xmmword_10001B8B0;
  if (*(char *)(a2 + 23) >= 0)
    v5 = (const char *)a2;
  else
    v5 = *(const char **)a2;
  if (!getattrlist(v5, &v9, v7, 8uLL, 0x20u))
    *(_DWORD *)(a1 + 16) = v8;
  return a1;
}

BOOL operator==(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 != *(_DWORD *)a2)
    return 0;
  return *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8)
      && *(_DWORD *)(a1 + 16) == (unint64_t)*(unsigned int *)(a2 + 16);
}

{
  BOOL v2;

  if (*(_BYTE *)(a1 + 1088))
    v2 = *(_BYTE *)(a2 + 1088) == 0;
  else
    v2 = 1;
  return !v2
      && *(_DWORD *)(a1 + 8) == *(_DWORD *)(a2 + 8)
      && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16)
      && *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24)
      && *(_DWORD *)(a1 + 32) == *(_DWORD *)(a2 + 32)
      && *(_QWORD *)(a1 + 40) == *(_QWORD *)(a2 + 40)
      && *(_DWORD *)(a1 + 48) == *(_DWORD *)(a2 + 48);
}

BOOL operator!=(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)a1 != *(_DWORD *)a2
      || *(_QWORD *)(a1 + 8) != *(_QWORD *)(a2 + 8)
      || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16);
}

uint64_t ArchivePayload::ArchivePayload(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  std::string::size_type v7;
  uint64_t v8;
  char v9;

  *(_DWORD *)a1 = a4;
  *(_DWORD *)(a1 + 4) = a5;
  FileSignature::FileSignature(a1 + 8, a2);
  FileSignature::FileSignature(a1 + 32, a3);
  *(_QWORD *)(a1 + 1080) = 0;
  if (*(char *)(a3 + 23) < 0)
  {
    v7 = *(_QWORD *)(a3 + 8);
    if (v7 >= 0x401)
    {
      v9 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    v7 = *(unsigned __int8 *)(a3 + 23);
  }
  std::string::copy((const std::string *)a3, (std::string::value_type *)(a1 + 56), v7, 0);
  v8 = *(unsigned __int8 *)(a3 + 23);
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a3 + 8);
  *(_QWORD *)(a1 + 1080) = v8;
  v9 = 1;
LABEL_8:
  *(_BYTE *)(a1 + 1088) = v9;
  return a1;
}

_DWORD *ArchivePayload::ArchivePayload(_DWORD *__dst, size_t __n, void *__src)
{
  __dst[2] = 0;
  *((_QWORD *)__dst + 2) = 0;
  __dst[6] = 0;
  __dst[8] = 0;
  *((_QWORD *)__dst + 5) = 0;
  __dst[12] = 0;
  *((_QWORD *)__dst + 135) = 0;
  *((_BYTE *)__dst + 1088) = 0;
  if (__n - 1081 >= 0xFFFFFFFFFFFFFBFFLL)
  {
    memcpy(__dst, __src, __n);
    *((_QWORD *)__dst + 135) = __n - 56;
    *((_BYTE *)__dst + 1088) = 1;
  }
  return __dst;
}

void ArchivePayload::serialization(ArchivePayload *this)
{
  operator new();
}

_QWORD *ArchivePayload::getRecompiledArchive@<X0>(ArchivePayload *this@<X0>, _QWORD *a2@<X8>)
{
  return std::string::basic_string[abi:ne180100](a2, (char *)this + 56, *((_QWORD *)this + 135));
}

uint64_t ArchivePayload::isValid(ArchivePayload *this)
{
  return *((unsigned __int8 *)this + 1088);
}

BOOL ArchivePayload::matchesCurrent(uint64_t a1, uint64_t a2)
{
  void *__p[2];
  char v6;
  _BYTE v7[1096];

  if (!*(_BYTE *)(a1 + 1088))
    return 0;
  std::string::basic_string[abi:ne180100](__p, (void *)(a1 + 56), *(_QWORD *)(a1 + 1080));
  ArchivePayload::ArchivePayload((uint64_t)v7, a2, (uint64_t)__p, 0, 0);
  if (v6 < 0)
    operator delete(__p[0]);
  return operator==((uint64_t)v7, a1);
}

void sub_10000D568(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD **MTLArchiveMapDB::MTLArchiveMapDB(_QWORD **a1, uint64_t *a2)
{
  return MTLVersionedDB::MTLVersionedDB(a1, a2, 3, 0, 1);
}

void MTLArchiveMapDB::remove(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  std::string v9;
  std::string v10;
  _BYTE v11[24];

  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    v9 = *(std::string *)a3;
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v10, v9.__r_.__value_.__l.__data_, v9.__r_.__value_.__l.__size_);
    if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v9.__r_.__value_.__l.__data_);
  }
  else
  {
    v10 = v9;
  }
  v8 = 0;
  v5 = mdb_cursor_open(a2, *(_DWORD *)(a1 + 8), &v8);
  if (!v5)
    operator new();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v6 = mdb_strerror(v5);
    MTLArchiveUsageDB::prune((uint64_t)v6, (uint64_t)v11, v7);
  }
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v10.__r_.__value_.__l.__data_);
}

void sub_10000D974()
{
  operator delete();
}

void MTLArchiveMapDB::read(unsigned int *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  int v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  std::string v10;
  std::string v11;
  uint64_t v12;
  _BYTE v13[24];

  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v12, (MTLVersionedDB *)a1);
  if (v12)
  {
    if (*(char *)(a2 + 23) < 0)
      std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
    else
      v10 = *(std::string *)a2;
    if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&v11, v10.__r_.__value_.__l.__data_, v10.__r_.__value_.__l.__size_);
      if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v10.__r_.__value_.__l.__data_);
    }
    else
    {
      v11 = v10;
    }
    v9 = 0;
    v6 = mdb_cursor_open(v12, a1[2], &v9);
    if (!v6)
      operator new();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v7 = mdb_strerror(v6);
      MTLArchiveUsageDB::prune((uint64_t)v7, (uint64_t)v13, v8);
    }
    std::string::basic_string[abi:ne180100]<0>(a3, (char *)&unk_10001C51B);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v11.__r_.__value_.__l.__data_);
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a3, (char *)&unk_10001C51B);
  }
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v12);
}

void sub_10000DDF8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,char a26)
{
  operator delete();
}

void MTLArchiveMapDB::store(MTLVersionedDB *a1, uint64_t a2, uint64_t *a3, int a4, int a5)
{
  std::string __p;
  std::string v11;
  uint64_t v12;
  _BYTE v13[1096];

  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v12, a1);
  if (v12)
  {
    if (*(char *)(a2 + 23) < 0)
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
    else
      __p = *(std::string *)a2;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&v11, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      v11 = __p;
    }
    ArchivePayload::ArchivePayload((uint64_t)v13, a2, (uint64_t)a3, a4, a5);
    if (v13[1088])
    {
      MTLArchiveMapDB::remove((uint64_t)a1, v12, a2);
      operator new();
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      MTLArchiveMapDB::store((char *)(a2 + 23), (_QWORD *)a2, a3);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v11.__r_.__value_.__l.__data_);
  }
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v12);
}

void sub_10000E104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
  if (a21 < 0)
    operator delete(__p);
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&a22);
  _Unwind_Resume(a1);
}

BOOL MTLVersionedDB::isVersionEntry(uint64_t a1, uint64_t a2, char *__s1)
{
  if (*(_BYTE *)(a1 + 12))
  {
    if (a2 == 8)
      return *(_QWORD *)__s1 == 0xFFFFFFFFLL;
    return 0;
  }
  if (a2 != 12)
    return 0;
  return strncmp(__s1, "_DB_VERSION_", 0xCuLL) == 0;
}

void MTLVersionedDB::getOrSetVersion(MTLVersionedDB *this, int a2)
{
  std::string __p;
  std::string v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  int v8;

  v8 = a2;
  v6 = 4;
  v7 = &v8;
  v5 = 0xFFFFFFFFLL;
  std::string::basic_string[abi:ne180100]<0>(&__p, "_DB_VERSION_");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v4, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v4 = __p;
  }
  if (*((_BYTE *)this + 12))
    operator new();
  operator new();
}

void sub_10000E3D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&a9);
  operator delete();
}

void MTLVersionedDB::openDB(uint64_t *a1, uint64_t a2, int a3, _BYTE *a4, _BYTE *a5)
{
  int v9;
  int v10;
  const char *v11;
  const char *v12;
  int v13;
  int v14;

  *a4 = 1;
  *a5 = 1;
  v9 = mdb_env_create(a1);
  if (v9)
  {
    v10 = v9;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      MTLVersionedDB::openDB(v10);
  }
  else
  {
    if (*(char *)(a2 + 23) >= 0)
      v11 = (const char *)a2;
    else
      v11 = *(const char **)a2;
    mkdir(v11, 0x1EDu);
    if (*(char *)(a2 + 23) >= 0)
      v12 = (const char *)a2;
    else
      v12 = *(const char **)a2;
    v13 = mdb_env_open(*a1, v12, 0, 0x1A4u);
    if (!v13)
      MTLVersionedDB::getOrSetVersion((MTLVersionedDB *)a1, a3);
    v14 = v13;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      MTLVersionedDB::openDB((char *)(a2 + 23), (_QWORD *)a2, v14);
    mdb_env_close((_QWORD *)*a1);
    *a4 = 0;
  }
  *a1 = 0;
}

_QWORD **MTLVersionedDB::MTLVersionedDB(_QWORD **a1, uint64_t *a2, int a3, char a4, char a5)
{
  BOOL v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  __int16 v14;

  *a1 = 0;
  *((_DWORD *)a1 + 2) = 0;
  *((_BYTE *)a1 + 12) = a4;
  *((_BYTE *)a1 + 13) = a5;
  v14 = 0;
  MTLVersionedDB::openDB((uint64_t *)a1, (uint64_t)a2, a3, (_BYTE *)&v14 + 1, &v14);
  if (HIBYTE(v14))
    v8 = v14 == 0;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      MTLVersionedDB::MTLVersionedDB();
    if (*a1)
    {
      MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v13, (MTLVersionedDB *)a1);
      if (v13)
      {
        mdb_drop(v13, *((_DWORD *)a1 + 2), 0);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        MTLVersionedDB::MTLVersionedDB(a2, v10, v11);
      }
      MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v13);
      v9 = *a1;
    }
    else
    {
      v9 = 0;
    }
    mdb_env_close(v9);
    MTLVersionedDB::openDB((uint64_t *)a1, (uint64_t)a2, a3, (_BYTE *)&v14 + 1, &v14);
    if (!HIBYTE(v14) || !(_BYTE)v14)
    {
      if (*a1)
        mdb_env_close(*a1);
      *a1 = 0;
    }
  }
  return a1;
}

void sub_10000E6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&a9);
  _Unwind_Resume(a1);
}

MTLVersionedDB::Transaction *MTLVersionedDB::Transaction::Transaction(MTLVersionedDB::Transaction *this, MTLVersionedDB *a2)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;

  *(_QWORD *)this = 0;
  if (*(_QWORD *)a2)
  {
    v4 = mdb_txn_begin(*(_QWORD *)a2, 0, 0, (uint64_t *)this);
    if (v4)
    {
      v5 = v4;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        MTLVersionedDB::Transaction::Transaction(v5);
LABEL_12:
      *(_QWORD *)this = 0;
      return this;
    }
    if (*((_BYTE *)a2 + 12))
      v6 = 262152;
    else
      v6 = 0x40000;
    v7 = mdb_dbi_open(*(_QWORD *)this, 0, v6 | (4 * *((unsigned __int8 *)a2 + 13)), (unsigned int *)a2 + 2);
    if (v7)
    {
      v8 = v7;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        MTLVersionedDB::Transaction::Transaction(v8);
      mdb_txn_abort(*(_QWORD *)this);
      goto LABEL_12;
    }
  }
  return this;
}

void MTLVersionedDB::Transaction::~Transaction(MTLVersionedDB::Transaction *this)
{
  uint64_t v1;
  int v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)this;
  if (v1)
  {
    v2 = mdb_txn_commit(v1);
    if (v2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v3 = mdb_strerror(v2);
        MTLVersionedDB::Transaction::~Transaction((uint64_t)v3, (uint64_t)&v5, v4);
      }
    }
  }
}

void sub_10000E830(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void MTLVersionedDB::~MTLVersionedDB(MTLVersionedDB *this)
{
  uint64_t v2;

  v2 = *(_QWORD *)this;
  if (v2)
  {
    mdb_dbi_close(v2, *((_DWORD *)this + 2));
    mdb_env_close(*(_QWORD **)this);
  }
}

void MTLVersionedDB::dumpTable(MTLVersionedDB *this)
{
  int v2;
  char *v3;
  uint64_t v4;
  int v5;
  int v6;
  _QWORD v7[2];
  _QWORD v8[2];
  uint64_t v9;
  uint64_t v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;

  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v10, this);
  if (v10)
  {
    v9 = 0;
    v2 = mdb_cursor_open(v10, *((_DWORD *)this + 2), &v9);
    if (v2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v3 = mdb_strerror(v2);
        MTLArchiveUsageDB::prune((uint64_t)v3, (uint64_t)buf, v4);
      }
    }
    else
    {
      v5 = mdb_cursor_get(v9, v8, v7, 0);
      v6 = 0;
      while (v5 != -30798)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67110144;
          v12 = v6;
          v13 = 2048;
          v14 = v8[0];
          v15 = 2048;
          v16 = v8[1];
          v17 = 2048;
          v18 = v7[0];
          v19 = 2048;
          v20 = v7[1];
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d: key(%zu,%p) data(%zu,%p)", buf, 0x30u);
          ++v6;
        }
        v5 = mdb_cursor_get(v9, v8, v7, 8);
      }
    }
  }
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v10);
}

void sub_10000EA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)va);
  _Unwind_Resume(a1);
}

char *OUTLINED_FUNCTION_2_0@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 8) = a2;
  return mdb_strerror(a1);
}

char *mdb_strerror(int a1)
{
  if (!a1)
    return "Successful return: 0";
  if ((a1 + 30799) > 0x14)
    return strerror(a1);
  return mdb_errstr[a1 + 30799];
}

uint64_t mdb_cmp(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 80) + 48 * a2 + 16))(a3, a4);
}

uint64_t mdb_dcmp(uint64_t a1, unsigned int a2, _QWORD *a3, uint64_t a4)
{
  uint64_t (*v4)(uint64_t, uint64_t);

  v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 80) + 48 * a2 + 24);
  if (v4 == mdb_cmp_int)
  {
    if (*a3 == 8)
      return mdb_cmp_cint(a3, a4);
    v4 = mdb_cmp_int;
  }
  return v4((uint64_t)a3, a4);
}

uint64_t mdb_cmp_int(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  unsigned int v3;
  BOOL v4;
  _BOOL4 v5;

  v2 = **(_DWORD **)(a1 + 8);
  v3 = **(_DWORD **)(a2 + 8);
  v4 = v2 >= v3;
  v5 = v2 > v3;
  if (v4)
    return v5;
  else
    return 0xFFFFFFFFLL;
}

uint64_t mdb_cmp_cint(_QWORD *a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  unsigned __int16 *v4;
  unsigned __int16 *v5;
  unsigned __int16 *v6;
  int v7;
  int v8;
  int v9;
  uint64_t result;
  BOOL v11;

  v2 = a1[1];
  v3 = *a1 - 2;
  v4 = (unsigned __int16 *)(v2 + v3);
  v5 = (unsigned __int16 *)(*(_QWORD *)(a2 + 8) + v3);
  v6 = v4;
  do
  {
    v8 = *v6--;
    v7 = v8;
    v9 = *v5--;
    result = (v7 - v9);
    v11 = v7 == v9 && (unint64_t)v4 > v2;
    v4 = v6;
  }
  while (v11);
  return result;
}

uint64_t mdb_env_sync0(uint64_t a1, int a2, uint64_t a3)
{
  int v3;
  uint64_t result;
  int v5;

  v3 = *(_DWORD *)(a1 + 12);
  if ((v3 & 0x20000) != 0)
    return 13;
  if (!a2 && (v3 & 0x10000) != 0)
    return 0;
  if ((v3 & 0x80000) == 0)
  {
    result = fsync(*(_DWORD *)a1);
    if (!(_DWORD)result)
      return result;
    return *__error();
  }
  if (((a2 == 0) & ((v3 & 0x100000u) >> 20)) != 0)
    v5 = 1;
  else
    v5 = 16;
  result = msync(*(void **)(a1 + 56), *(unsigned int *)(a1 + 16) * a3, v5);
  if ((_DWORD)result)
    return *__error();
  return result;
}

uint64_t mdb_env_sync(uint64_t a1, int a2)
{
  return mdb_env_sync0(a1, a2, *(_QWORD *)(*(_QWORD *)(a1+ 72+ 8* ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(_QWORD *)(*(_QWORD *)(a1 + 72)+ 128) < *(_QWORD *)(*(_QWORD *)(a1 + 80) + 128))))+ 120)+ 1);
}

uint64_t mdb_txn_renew(uint64_t a1)
{
  if (!a1 || (~*(_DWORD *)(a1 + 124) & 0x20001) != 0)
    return 22;
  else
    return mdb_txn_renew0(a1);
}

uint64_t mdb_txn_renew0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  int v11;
  int v12;
  pthread_t v13;
  uint64_t v14;
  pthread_mutex_t *v15;
  int v16;
  unsigned int v17;
  int *v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  unint64_t v29;
  uint64_t v30;
  int v31;
  char v32;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 64);
  v4 = *(_DWORD *)(a1 + 124);
  if ((v4 & 0x20000) == 0)
  {
    if (v3)
    {
      v5 = pthread_mutex_lock((pthread_mutex_t *)(v3 + 128));
      if ((_DWORD)v5)
        return v5;
      v6 = *(_QWORD *)(v3 + 8);
      v7 = *(_QWORD *)(v2 + 8 * (v6 & 1) + 72);
    }
    else
    {
      v7 = *(_QWORD *)(v2
                     + 72
                     + 8
                     * ((*(_DWORD *)(v2 + 12) >> 25) & 1 ^ (*(_QWORD *)(*(_QWORD *)(v2 + 72) + 128) < *(_QWORD *)(*(_QWORD *)(v2 + 80) + 128))));
      v6 = *(_QWORD *)(v7 + 128);
    }
    *(_QWORD *)(a1 + 24) = v6 + 1;
    *(_QWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 56) = 0;
    *(_DWORD *)(a1 + 128) = 0x1FFFF;
    v9 = *(_QWORD **)(v2 + 208);
    *(_QWORD *)(a1 + 72) = v9;
    *v9 = 0;
    v10 = *(_QWORD **)(v2 + 200);
    *(_QWORD *)(a1 + 40) = v10;
    *(_QWORD *)(a1 + 48) = 0;
    *v10 = 0;
    *(_QWORD *)(a1 + 64) = 0;
    *(_QWORD *)(v2 + 96) = a1;
    memcpy(*(void **)(a1 + 96), *(const void **)(v2 + 152), 4 * *(unsigned int *)(v2 + 36));
    v11 = 0;
    goto LABEL_35;
  }
  if (!v3)
  {
    v11 = 0;
    v7 = *(_QWORD *)(v2
                   + 72
                   + 8
                   * ((*(_DWORD *)(v2 + 12) >> 25) & 1 ^ (*(_QWORD *)(*(_QWORD *)(v2 + 72) + 128) < *(_QWORD *)(*(_QWORD *)(v2 + 80) + 128))));
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(v7 + 128);
    *(_QWORD *)(a1 + 72) = 0;
LABEL_35:
    v24 = *(_OWORD **)(a1 + 88);
    v25 = *(_OWORD *)(v7 + 40);
    *v24 = *(_OWORD *)(v7 + 24);
    v24[1] = v25;
    v26 = *(_OWORD *)(v7 + 56);
    v27 = *(_OWORD *)(v7 + 72);
    v28 = *(_OWORD *)(v7 + 104);
    v24[4] = *(_OWORD *)(v7 + 88);
    v24[5] = v28;
    v24[2] = v26;
    v24[3] = v27;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(v7 + 120) + 1;
    LODWORD(v24) = *(_DWORD *)(v2 + 32);
    *(_DWORD *)(a1 + 120) = (_DWORD)v24;
    *(_DWORD *)(a1 + 124) = v4 & 0x20000;
    if (v24 >= 3)
    {
      v29 = 2;
      v30 = 100;
      do
      {
        v31 = *(__int16 *)(*(_QWORD *)(v2 + 144) + 2 * v29);
        *(_WORD *)(*(_QWORD *)(a1 + 88) + v30) = *(_WORD *)(*(_QWORD *)(v2 + 144) + 2 * v29) & 0x7FFF;
        if (v31 < 0)
          v32 = 26;
        else
          v32 = 0;
        *(_BYTE *)(*(_QWORD *)(a1 + 112) + v29++) = v32;
        v30 += 48;
      }
      while (v29 < *(unsigned int *)(a1 + 120));
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 112) + 1) = 24;
    **(_BYTE **)(a1 + 112) = 8;
    if ((*(_DWORD *)(v2 + 12) & 0x80000000) != 0)
    {
      v5 = 4294936501;
    }
    else
    {
      if (*(_QWORD *)(v2 + 128) >= *(_QWORD *)(a1 + 16))
        return 0;
      v5 = 4294936511;
    }
    mdb_txn_end((unsigned int *)a1, v11 | 5);
    return v5;
  }
  if ((*(_BYTE *)(v2 + 14) & 0x20) != 0)
  {
    v8 = *(_DWORD **)(a1 + 72);
    if (v8)
      goto LABEL_8;
  }
  else
  {
    v8 = pthread_getspecific(*(_QWORD *)(v2 + 160));
    if (v8)
    {
LABEL_8:
      if (v8[2] != *(_DWORD *)(v2 + 40) || *(_QWORD *)v8 != -1)
        return 4294936513;
      goto LABEL_32;
    }
  }
  v12 = *(_DWORD *)(v2 + 40);
  v13 = pthread_self();
  v14 = *(_QWORD *)(v2 + 64);
  if (!*(_DWORD *)(v2 + 224))
  {
    v5 = mdb_reader_pid(v2, 8, v12);
    if ((_DWORD)v5)
      return v5;
    *(_DWORD *)(v2 + 224) = 1;
  }
  v15 = (pthread_mutex_t *)(v14 + 24);
  v5 = pthread_mutex_lock((pthread_mutex_t *)(v14 + 24));
  if (!(_DWORD)v5)
  {
    v16 = *(_DWORD *)(v3 + 16);
    if (v16)
    {
      v17 = 0;
      v18 = (int *)(v3 + 200);
      while (1)
      {
        v19 = *v18;
        v18 += 16;
        if (!v19)
          break;
        if (v16 == ++v17)
        {
          v17 = *(_DWORD *)(v3 + 16);
          break;
        }
      }
    }
    else
    {
      v17 = 0;
    }
    if (v17 == *(_DWORD *)(v2 + 24))
    {
      pthread_mutex_unlock((pthread_mutex_t *)(v14 + 24));
      return 4294936506;
    }
    v20 = v3 + ((unint64_t)v17 << 6);
    *(_DWORD *)(v20 + 200) = 0;
    *(_QWORD *)(v20 + 192) = -1;
    v8 = (_DWORD *)(v20 + 192);
    *((_QWORD *)v8 + 2) = v13;
    if (v17 == v16)
      *(_DWORD *)(v3 + 16) = ++v16;
    *(_DWORD *)(v2 + 28) = v16;
    v8[2] = v12;
    pthread_mutex_unlock(v15);
    v21 = *(_DWORD *)(v2 + 12);
    if ((v21 & 0x200000) != 0)
    {
      v11 = v21 & 0x200000;
      goto LABEL_33;
    }
    v22 = pthread_setspecific(*(_QWORD *)(v2 + 160), v8);
    if ((_DWORD)v22)
    {
      v5 = v22;
      v8[2] = 0;
      return v5;
    }
LABEL_32:
    v11 = 0;
    do
LABEL_33:
      *(_QWORD *)v8 = *(_QWORD *)(v3 + 8);
    while (*(_QWORD *)v8 != *(_QWORD *)(v3 + 8));
    v23 = *(_QWORD *)v8;
    *(_QWORD *)(a1 + 24) = *(_QWORD *)v8;
    *(_QWORD *)(a1 + 72) = v8;
    v7 = *(_QWORD *)(v2 + 8 * (v23 & 1) + 72);
    goto LABEL_35;
  }
  return v5;
}

uint64_t mdb_txn_begin(uint64_t a1, uint64_t a2, int a3, uint64_t *a4)
{
  int v4;
  uint64_t v5;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  size_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  int *v23;
  int v24;
  _QWORD *v25;

  v4 = *(_DWORD *)(a1 + 12);
  if ((v4 & ~a3 & 0x20000) != 0)
    return 13;
  v10 = v4 & 0x80000 | a3 & 0x70000;
  if (a2)
  {
    v11 = *(_DWORD *)(a2 + 124);
    v10 |= v11;
    if ((v10 & 0xA0013) != 0)
    {
      if ((v11 & 0x20000) != 0)
        return 22;
      else
        return 4294936514;
    }
    v13 = 152;
    v14 = 57;
    v15 = 19;
  }
  else
  {
    if ((a3 & 0x20000) == 0)
    {
      v12 = *(_QWORD *)(a1 + 104);
      goto LABEL_28;
    }
    v15 = 17;
    v14 = 49;
    v13 = 136;
  }
  v16 = v13 + *(_DWORD *)(a1 + 36) * v14;
  v17 = malloc_type_calloc(1uLL, v16, 0xC111C8FuLL);
  if (!v17)
    return 12;
  v12 = (uint64_t)v17;
  v17[10] = *(_QWORD *)(a1 + 136);
  v17[11] = &v17[v15];
  v18 = *(unsigned int *)(a1 + 36);
  v17[14] = (char *)v17 + v16 - v18;
  *((_DWORD *)v17 + 31) = v10;
  v17[4] = a1;
  if (a2)
  {
    v17[12] = *(_QWORD *)(a2 + 96);
    v17[13] = &v17[6 * v18 + v15];
    v19 = malloc_type_malloc(0x200000uLL, 0x108004057E67DB5uLL);
    *(_QWORD *)(v12 + 72) = v19;
    if (v19)
    {
      v20 = mdb_midl_alloc(0x1FFFF);
      *(_QWORD *)(v12 + 40) = v20;
      v19 = *(_QWORD **)(v12 + 72);
      if (v20)
      {
        *(_DWORD *)(v12 + 128) = *(_DWORD *)(a2 + 128);
        *v19 = 0;
        *(_QWORD *)(v12 + 64) = 0;
        *(_OWORD *)(v12 + 16) = *(_OWORD *)(a2 + 16);
        v21 = *(unsigned int *)(a2 + 120);
        *(_DWORD *)(a2 + 124) |= 0x10u;
        *(_QWORD *)(a2 + 8) = v12;
        *(_QWORD *)v12 = a2;
        *(_DWORD *)(v12 + 120) = v21;
        memcpy(*(void **)(v12 + 88), *(const void **)(a2 + 88), 48 * v21);
        if (*(_DWORD *)(v12 + 120))
        {
          v22 = 0;
          do
          {
            *(_BYTE *)(*(_QWORD *)(v12 + 112) + v22) = *(_BYTE *)(*(_QWORD *)(a2 + 112) + v22) & 0xFB;
            ++v22;
          }
          while (v22 < *(unsigned int *)(v12 + 120));
        }
        *(_OWORD *)(v12 + 136) = *(_OWORD *)(a1 + 176);
        v23 = *(int **)(a1 + 176);
        if (v23)
        {
          v24 = *v23;
          v25 = mdb_midl_alloc(*v23);
          *(_QWORD *)(a1 + 176) = v25;
          if (!v25)
          {
            v5 = 12;
LABEL_31:
            mdb_txn_end((unsigned int *)v12, 6);
            goto LABEL_32;
          }
          memcpy(v25, *(const void **)(v12 + 136), 8 * v24 + 8);
        }
        v5 = mdb_cursor_shadow(a2, (_QWORD *)v12);
        if (!(_DWORD)v5)
          goto LABEL_29;
        goto LABEL_31;
      }
    }
    free(v19);
    free((void *)v12);
    return 12;
  }
  v17[12] = *(_QWORD *)(a1 + 152);
LABEL_28:
  v5 = mdb_txn_renew0(v12);
  if (!(_DWORD)v5)
  {
LABEL_29:
    v5 = 0;
    *(_DWORD *)(v12 + 124) |= v10;
    *a4 = v12;
    return v5;
  }
LABEL_32:
  if (v12 != *(_QWORD *)(a1 + 104))
    free((void *)v12);
  return v5;
}

uint64_t mdb_cursor_shadow(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  size_t v7;
  _QWORD **v8;
  _QWORD **v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(unsigned int *)(a1 + 120);
  if ((int)v2 < 1)
    return 0;
  while (1)
  {
    v5 = *(_QWORD **)(*(_QWORD *)(a1 + 104) + 8 * (v2 - 1));
    if (v5)
      break;
LABEL_10:
    if (v2-- <= 1)
      return 0;
  }
  v6 = (v2 - 1);
  if (v5[2])
    v7 = 888;
  else
    v7 = 392;
  while (1)
  {
    v8 = (_QWORD **)malloc_type_malloc(v7, 0xC8AE77B4uLL);
    if (!v8)
      return 12;
    v9 = v8;
    memcpy(v8, v5, 0x188uLL);
    v5[1] = v9;
    v5[5] = a2[11] + 48 * (v2 - 1);
    v5[3] = a2;
    v5[7] = a2[14] + v6;
    v10 = v5[2];
    if (v10)
    {
      memcpy(v9 + 49, (const void *)v5[2], 0x1F0uLL);
      *(_QWORD *)(v10 + 24) = a2;
    }
    v11 = a2[13];
    *v5 = *(_QWORD *)(v11 + 8 * v6);
    *(_QWORD *)(v11 + 8 * v6) = v5;
    v5 = *v9;
    if (!*v9)
      goto LABEL_10;
  }
}

void mdb_txn_end(unsigned int *a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  _OWORD *v15;
  unsigned int *v16;
  unsigned int v17;
  uint64_t v18;
  unsigned int v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  int v23;
  pthread_mutex_t *v24;

  v4 = *((_QWORD *)a1 + 4);
  v5 = a1[30];
  if ((int)v5 >= 3)
  {
    v6 = *((_QWORD *)a1 + 14);
    v7 = v5 + 1;
    do
    {
      v8 = (v7 - 2);
      if ((*(_BYTE *)(v6 + v8) & 4) != 0)
      {
        if ((a2 & 0x10) != 0)
        {
          *(_WORD *)(*(_QWORD *)(v4 + 144) + 2 * v8) = *(_WORD *)(*((_QWORD *)a1 + 11) + 48 * v8 + 4) | 0x8000;
        }
        else
        {
          v9 = *(_QWORD *)(v4 + 136);
          v10 = *(void **)(v9 + 48 * v8 + 8);
          if (v10)
          {
            v11 = (_QWORD *)(v9 + 48 * v8);
            *v11 = 0;
            v11[1] = 0;
            v12 = *(_QWORD *)(v4 + 152);
            *(_WORD *)(*(_QWORD *)(v4 + 144) + 2 * v8) = 0;
            ++*(_DWORD *)(v12 + 4 * v8);
            free(v10);
          }
        }
      }
      --v7;
    }
    while (v7 > 3);
  }
  if ((a2 & 0x10) != 0 && *(_DWORD *)(v4 + 32) < v5)
    *(_DWORD *)(v4 + 32) = v5;
  v13 = a1[31];
  if ((v13 & 0x20000) != 0)
  {
    v22 = (_QWORD *)*((_QWORD *)a1 + 9);
    if (v22)
    {
      *v22 = -1;
      if ((*(_BYTE *)(v4 + 14) & 0x20) == 0)
      {
LABEL_31:
        *((_QWORD *)a1 + 9) = 0;
        goto LABEL_32;
      }
      if ((a2 & 0x200000) != 0)
      {
        *(_DWORD *)(*((_QWORD *)a1 + 9) + 8) = 0;
        goto LABEL_31;
      }
    }
LABEL_32:
    v23 = a1[31] | 1;
    a1[30] = 0;
    a1[31] = v23;
    goto LABEL_33;
  }
  if ((v13 & 1) == 0)
  {
    v15 = (_OWORD *)(v4 + 176);
    v14 = *(_QWORD *)(v4 + 176);
    if ((a2 & 0x10) == 0)
      mdb_cursors_close((uint64_t)a1, 0);
    if ((*(_BYTE *)(v4 + 14) & 8) == 0)
    {
      v16 = (unsigned int *)*((_QWORD *)a1 + 9);
      v17 = *v16;
      if (*v16)
      {
        v18 = *((_QWORD *)a1 + 4);
        v19 = 1;
        do
        {
          v20 = *(_QWORD **)&v16[4 * v19 + 2];
          if ((*((_WORD *)v20 + 5) & 4) != 0 && *((_DWORD *)v20 + 3) != 1)
          {
            free(v20);
          }
          else
          {
            *v20 = *(_QWORD *)(v18 + 192);
            *(_QWORD *)(v18 + 192) = v20;
          }
          ++v19;
        }
        while (v19 <= v17);
      }
      *(_QWORD *)v16 = 0;
    }
    *((_QWORD *)a1 + 15) = &_mh_execute_header;
    v21 = *(_QWORD *)a1;
    if (*(_QWORD *)a1)
    {
      *(_QWORD *)(v21 + 8) = 0;
      *(_DWORD *)(v21 + 124) &= ~0x10u;
      *v15 = *(_OWORD *)(a1 + 34);
      mdb_midl_free(*((_QWORD *)a1 + 5));
      free(*((void **)a1 + 9));
    }
    else
    {
      mdb_midl_shrink((uint64_t *)a1 + 5);
      *(_QWORD *)(v4 + 200) = *((_QWORD *)a1 + 5);
      *(_QWORD *)(v4 + 96) = 0;
      *(_QWORD *)v15 = 0;
      *(_QWORD *)(v4 + 184) = 0;
      v24 = *(pthread_mutex_t **)(v4 + 64);
      if (v24)
        pthread_mutex_unlock(v24 + 2);
      LOBYTE(a2) = 0;
    }
    mdb_midl_free(*((_QWORD *)a1 + 8));
    mdb_midl_free(v14);
    if ((a2 & 0x20) != 0)
      goto LABEL_39;
    return;
  }
LABEL_33:
  if ((a2 & 0x20) != 0)
LABEL_39:
    free(a1);
}

uint64_t mdb_txn_env(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

uint64_t mdb_txn_id(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

void mdb_txn_reset(uint64_t a1)
{
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 126) & 2) != 0)
      mdb_txn_end((unsigned int *)a1, 3);
  }
}

void mdb_txn_abort(uint64_t a1)
{
  if (a1)
  {
    if (*(_QWORD *)(a1 + 8))
      mdb_txn_abort();
    mdb_txn_end((unsigned int *)a1, 2097186);
  }
}

uint64_t mdb_txn_commit(uint64_t a1)
{
  uint64_t appended;
  int v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int *v7;
  int **v8;
  unsigned int *v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  unint64_t v17;
  int v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  unsigned int i;
  uint64_t v29;
  unint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unsigned int v34;
  unint64_t v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v39;
  unsigned int v40;
  int v41;
  int v42;
  int v44;
  unint64_t v45;
  int v46;
  unint64_t v47;
  int v48;
  uint64_t v49;
  unsigned int v50;
  unsigned int *v51;
  unint64_t v52;
  unsigned int *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t v59;
  __int128 v60;
  _OWORD v61[24];
  uint64_t v62;

  if (!a1)
    return 22;
  if (*(_QWORD *)(a1 + 8))
  {
    appended = mdb_txn_commit();
    if ((_DWORD)appended)
      goto LABEL_9;
  }
  v3 = 2097201;
  v4 = *(_DWORD *)(a1 + 124);
  if ((v4 & 0x20000) != 0)
    goto LABEL_53;
  v5 = *(_QWORD *)a1;
  if ((v4 & 3) != 0)
  {
    if (v5)
      *(_DWORD *)(v5 + 124) |= 2u;
    appended = 4294936514;
LABEL_9:
    mdb_txn_abort(a1);
    return appended;
  }
  if (!v5)
  {
    v20 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v20 + 96) != a1)
    {
      appended = 22;
      goto LABEL_9;
    }
    mdb_cursors_close(a1, 0);
    if (**(_QWORD **)(a1 + 72) || (*(_BYTE *)(a1 + 124) & 0xC) != 0)
    {
      if (*(_DWORD *)(a1 + 120) >= 3u)
      {
        v62 = 0;
        memset(v61, 0, sizeof(v61));
        v60 = xmmword_10001B8E0;
        mdb_cursor_init((uint64_t)v61, a1, 1u, 0);
        v21 = *(unsigned int *)(a1 + 120);
        if (v21 >= 3)
        {
          v22 = 2;
          v23 = 96;
          do
          {
            if ((*(_BYTE *)(*(_QWORD *)(a1 + 112) + v22) & 1) != 0)
            {
              if (*(_DWORD *)(*(_QWORD *)(a1 + 96) + 4 * v22) != *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152)
                                                                            + 4 * v22))
              {
                appended = 4294936516;
                goto LABEL_9;
              }
              v24 = *(_QWORD *)(a1 + 80);
              *((_QWORD *)&v60 + 1) = *(_QWORD *)(a1 + 88) + v23;
              v25 = mdb_cursor_put((uint64_t)v61, (size_t *)(v24 + v23), (uint64_t)&v60, 2);
              if ((_DWORD)v25)
              {
                appended = v25;
                goto LABEL_9;
              }
              v21 = *(unsigned int *)(a1 + 120);
            }
            ++v22;
            v23 += 48;
          }
          while (v22 < v21);
        }
      }
      appended = mdb_freelist_save(a1);
      if ((_DWORD)appended)
        goto LABEL_9;
      mdb_midl_free(*(_QWORD *)(v20 + 176));
      *(_QWORD *)(v20 + 176) = 0;
      mdb_midl_shrink((uint64_t *)(a1 + 40));
      appended = mdb_page_flush(a1, 0);
      if ((_DWORD)appended)
        goto LABEL_9;
      if ((*(_BYTE *)(a1 + 126) & 1) == 0)
      {
        appended = mdb_env_sync0(v20, 0, *(_QWORD *)(a1 + 16));
        if ((_DWORD)appended)
          goto LABEL_9;
      }
      appended = mdb_env_write_meta(a1);
      if ((_DWORD)appended)
        goto LABEL_9;
      v26 = *(_DWORD *)(v20 + 12);
      if ((v26 & 0x2000000) != 0)
      {
        if ((v26 & 0x400000) == 0)
        {
          appended = mdb_env_share_locks(v20, (int *)v61);
          if ((_DWORD)appended)
            goto LABEL_9;
          v26 = *(_DWORD *)(v20 + 12);
        }
        *(_DWORD *)(v20 + 12) = v26 ^ 0x2000000;
      }
      v3 = 16;
    }
LABEL_53:
    mdb_txn_end((unsigned int *)a1, v3);
    return 0;
  }
  appended = mdb_midl_append_list((uint64_t **)(v5 + 40), *(uint64_t **)(a1 + 40));
  if ((_DWORD)appended)
    goto LABEL_9;
  mdb_midl_free(*(_QWORD *)(a1 + 40));
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(a1 + 16);
  *(_DWORD *)(v5 + 124) = *(_DWORD *)(a1 + 124);
  mdb_cursors_close(a1, 1);
  memcpy(*(void **)(v5 + 88), *(const void **)(a1 + 88), 48 * *(unsigned int *)(a1 + 120));
  *(_DWORD *)(v5 + 120) = *(_DWORD *)(a1 + 120);
  **(_BYTE **)(v5 + 112) = **(_BYTE **)(a1 + 112);
  *(_BYTE *)(*(_QWORD *)(v5 + 112) + 1) = *(_BYTE *)(*(_QWORD *)(a1 + 112) + 1);
  if (*(_DWORD *)(a1 + 120) >= 3u)
  {
    v6 = 2;
    do
    {
      *(_BYTE *)(*(_QWORD *)(v5 + 112) + v6) = *(_BYTE *)(*(_QWORD *)(a1 + 112) + v6) | *(_BYTE *)(*(_QWORD *)(v5 + 112)
                                                                                                 + v6) & 4;
      ++v6;
    }
    while (v6 < *(unsigned int *)(a1 + 120));
  }
  v7 = *(unsigned int **)(v5 + 64);
  v9 = *(unsigned int **)(v5 + 72);
  v8 = (int **)(v5 + 64);
  v10 = *(unsigned int **)(a1 + 72);
  if (v7)
  {
    v11 = *v7;
    if (*v7)
    {
      *(_QWORD *)v7 = -1;
      v12 = *v10;
      if (*v10)
      {
        if (v12 + 1 > 2)
          v13 = v12 + 1;
        else
          v13 = 2;
        v14 = 1;
        v15 = v11;
        v16 = v11;
        do
        {
          v17 = 2 * *(_QWORD *)&v10[4 * v14];
          do
          {
            v18 = v16;
            v19 = *(_QWORD *)&v7[2 * v16--];
          }
          while (v17 > v19);
          if (v17 == v19)
          {
            *(_QWORD *)&v7[2 * v18] = 1;
            v15 = v16;
          }
          else
          {
            ++v16;
          }
          ++v14;
        }
        while (v14 != v13);
      }
      else
      {
        v15 = v11;
      }
      for (i = v15 + 1; i <= v11; ++i)
      {
        v29 = *(_QWORD *)&v7[2 * i];
        if ((v29 & 1) == 0)
          *(_QWORD *)&v7[2 * ++v15] = v29;
      }
      *(_QWORD *)v7 = v15;
    }
  }
  v30 = *(unint64_t **)(a1 + 64);
  if (v30 && *v30)
  {
    v31 = 1;
    do
    {
      v32 = v30[v31];
      if ((v32 & 1) == 0)
      {
        v33 = v32 >> 1;
        v34 = mdb_mid2l_search(v9, v32 >> 1);
        if (*(_QWORD *)v9 >= (unint64_t)v34)
        {
          v35 = v34;
          if (*(_QWORD *)&v9[4 * v34] == v33)
          {
            free(*(void **)&v9[4 * v34 + 2]);
            v36 = *(_QWORD *)v9;
            if (*(_QWORD *)v9 > v35)
            {
              v37 = v35 + 1;
              do
              {
                *(_OWORD *)&v9[4 * v35] = *(_OWORD *)&v9[4 * v37];
                v35 = v37;
                v36 = *(_QWORD *)v9;
              }
              while (*(_QWORD *)v9 > (unint64_t)v37++);
            }
            *(_QWORD *)v9 = v36 - 1;
          }
        }
      }
      v31 = (v31 + 1);
      v30 = *(unint64_t **)(a1 + 64);
    }
    while (*v30 >= v31);
  }
  v39 = *(_QWORD *)v9;
  *(_QWORD *)v9 = 0;
  if (*(_QWORD *)v5)
  {
    v40 = *v10 + v39;
    v41 = mdb_mid2l_search(v10, *(_QWORD *)&v9[4 * v39] + 1);
    v42 = v41 - 1;
    if (v41 != 1 && (_DWORD)v39 != 0)
    {
      v44 = v39;
      do
      {
        v45 = *(_QWORD *)&v10[4 * v42];
        v46 = v44 + 1;
        do
          v47 = *(_QWORD *)&v9[4 * --v46];
        while (v45 < v47);
        v48 = v45 == v47;
        v40 -= v48;
        if (!--v42)
          break;
        v44 = v46 - v48;
      }
      while (v44);
    }
  }
  else
  {
    v40 = 0x1FFFF - *(_DWORD *)(a1 + 128);
  }
  v49 = *v10;
  if (*v10)
  {
    v50 = v40;
    do
    {
      v51 = &v10[4 * v49];
      v52 = *(_QWORD *)v51;
      v53 = &v9[4 * v39];
      v54 = *(_QWORD *)v53;
      if (*(_QWORD *)v51 >= *(_QWORD *)v53)
      {
        v55 = v39;
      }
      else
      {
        do
        {
          *(_OWORD *)&v9[4 * v50--] = *(_OWORD *)v53;
          v39 = (v39 - 1);
          v53 = &v9[4 * v39];
          v54 = *(_QWORD *)v53;
        }
        while (v52 < *(_QWORD *)v53);
        v55 = v39;
      }
      if (v52 == v54)
      {
        LODWORD(v39) = v39 - 1;
        free(*(void **)&v9[4 * v55 + 2]);
      }
      *(_OWORD *)&v9[4 * v50--] = *(_OWORD *)v51;
      --v49;
    }
    while ((_DWORD)v49);
  }
  *(_QWORD *)v9 = v40;
  free(*(void **)(a1 + 72));
  *(_DWORD *)(v5 + 128) = *(_DWORD *)(a1 + 128);
  v56 = *(uint64_t **)(a1 + 64);
  if (v56)
  {
    if (*v8)
    {
      appended = mdb_midl_append_list((uint64_t **)(v5 + 64), v56);
      if ((_DWORD)appended)
        *(_DWORD *)(v5 + 124) |= 2u;
      mdb_midl_free(*(_QWORD *)(a1 + 64));
      mdb_midl_sort(*v8);
    }
    else
    {
      appended = 0;
      *v8 = (int *)v56;
    }
  }
  else
  {
    appended = 0;
  }
  v57 = (_QWORD *)(v5 + 48);
  do
  {
    v58 = v57;
    v59 = *v57;
    v57 = (_QWORD *)(*v57 + 48);
  }
  while (v59);
  *v58 = *(_QWORD *)(a1 + 48);
  *(_DWORD *)(v5 + 56) += *(_DWORD *)(a1 + 56);
  *(_QWORD *)(v5 + 8) = 0;
  mdb_midl_free(*(_QWORD *)(a1 + 136));
  free((void *)a1);
  return appended;
}

void mdb_cursors_close(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;

  v2 = *(unsigned int *)(a1 + 120);
  if ((int)v2 >= 1)
  {
    v4 = *(_QWORD *)(a1 + 104);
    do
    {
      v5 = *(_QWORD **)(v4 + 8 * (v2 - 1));
      while (v5)
      {
        v6 = v5;
        v5 = (_QWORD *)*v5;
        v7 = (_QWORD *)v6[1];
        if (v7)
        {
          if (a2)
          {
            *(_OWORD *)v6 = *(_OWORD *)v7;
            v6[3] = v7[3];
            v6[5] = v7[5];
            v6[7] = v7[7];
            v8 = v6[2];
            if (v8)
              *(_QWORD *)(v8 + 24) = v7[3];
          }
          else
          {
            memcpy(v6, (const void *)v6[1], 0x188uLL);
            v9 = (void *)v6[2];
            if (v9)
              memcpy(v9, v7 + 49, 0x1F0uLL);
          }
        }
        else
        {
          v7 = v6;
        }
        free(v7);
      }
      *(_QWORD *)(v4 + 8 * (v2 - 1)) = 0;
    }
    while (v2-- > 1);
  }
}

uint64_t mdb_cursor_init(uint64_t result, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)result = 0;
  *(_QWORD *)(result + 8) = 0;
  *(_DWORD *)(result + 32) = a3;
  *(_QWORD *)(result + 24) = a2;
  v4 = *(_QWORD *)(a2 + 80) + 48 * a3;
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 88) + 48 * a3;
  *(_QWORD *)(result + 48) = v4;
  v5 = (_BYTE *)(*(_QWORD *)(a2 + 112) + a3);
  *(_QWORD *)(result + 56) = v5;
  *(_DWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 72) = 0;
  *(_WORD *)(result + 328) = 0;
  v6 = *(_DWORD *)(a2 + 124) & 0xA0000;
  *(_DWORD *)(result + 68) = v6;
  if ((*(_BYTE *)(*(_QWORD *)(a2 + 88) + 48 * a3 + 4) & 4) != 0)
  {
    *(_QWORD *)(result + 16) = a4;
    *(_QWORD *)(a4 + 16) = 0;
    *(_QWORD *)(a4 + 24) = a2;
    *(_QWORD *)(a4 + 40) = a4 + 392;
    *(_QWORD *)(a4 + 48) = a4 + 440;
    *(_DWORD *)(a4 + 32) = a3;
    *(_QWORD *)(a4 + 56) = a4 + 488;
    *(_DWORD *)(a4 + 64) = 0;
    *(_DWORD *)(a4 + 68) = v6 | 4;
    *(_QWORD *)(a4 + 440) = 0;
    *(_QWORD *)(a4 + 448) = 0;
    v7 = *(_QWORD *)(result + 48);
    v5 = *(_BYTE **)(result + 56);
    v9 = *(_QWORD *)(v7 + 24);
    v8 = *(_QWORD *)(v7 + 32);
    *(_QWORD *)(a4 + 456) = v9;
    *(_QWORD *)(a4 + 464) = 0;
    *(_QWORD *)(a4 + 472) = v8;
  }
  else
  {
    *(_QWORD *)(result + 16) = 0;
  }
  if ((*v5 & 2) != 0)
    return mdb_page_search(result, 0, 2);
  return result;
}

uint64_t mdb_cursor_put(uint64_t a1, size_t *a2, uint64_t a3, int a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  char *v25;
  __int16 v26;
  uint64_t v27;
  size_t *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int *v31;
  uint64_t v32;
  size_t v33;
  void *v34;
  const void *v35;
  uint64_t v36;
  int v37;
  __int16 v38;
  unsigned int *v39;
  char *v40;
  __int16 v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  size_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  int v49;
  size_t v50;
  char *v51;
  const void *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  int v57;
  char *v58;
  uint64_t v59;
  size_t v60;
  size_t v61;
  unsigned int v62;
  uint64_t v63;
  __int16 v64;
  int v65;
  unsigned __int16 v66;
  unint64_t v67;
  uint64_t v68;
  _WORD *v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  int v73;
  int v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  _QWORD *v79;
  char *v80;
  unsigned int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unsigned int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  char *v102;
  size_t v103;
  int v104;
  char *v105;
  unsigned int v106;
  int v107;
  unsigned int v108;
  char *v109;
  int v110;
  uint64_t v111;
  int v112;
  int v113;
  unsigned int v114;
  char *v115[2];
  __int128 v116;
  int v117;
  _OWORD v118[2];
  __int128 v119;
  size_t v120;
  char *v121;
  size_t v122;
  char *v123;
  uint64_t v124;
  char *v125;
  char *v126;

  v126 = 0;
  result = 22;
  if (!a1 || !a2)
    return result;
  v124 = 0;
  v125 = 0;
  v122 = 0;
  v123 = 0;
  v120 = 0;
  v121 = 0;
  v119 = 0u;
  memset(v118, 0, sizeof(v118));
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(v9 + 32);
  if ((a4 & 0x80000) != 0)
  {
    v11 = *(_DWORD *)(a3 + 16);
    *(_QWORD *)(a3 + 16) = 0;
    if ((*(_WORD *)(*(_QWORD *)(a1 + 40) + 4) & 0x10) == 0)
      return 4294936512;
  }
  else
  {
    v11 = 0;
  }
  v12 = *(_DWORD *)(v9 + 124);
  if ((v12 & 0x20013) != 0)
  {
    if ((v12 & 0x20000) != 0)
      return 13;
    else
      return 4294936514;
  }
  if (*a2 - 512 < 0xFFFFFFFFFFFFFE01)
    return 4294936515;
  v13 = *(_QWORD *)(a1 + 40);
  v14 = 511;
  if ((*(_WORD *)(v13 + 4) & 4) == 0)
    v14 = 0xFFFFFFFFLL;
  if (*(_QWORD *)a3 > v14)
    return 4294936515;
  v122 = 0;
  if ((a4 & 0x40) != 0)
  {
    v17 = *(_DWORD *)(a1 + 68);
    if ((v17 & 1) == 0)
      return result;
    LODWORD(v16) = 0;
  }
  else if (*(_QWORD *)(v13 + 40) == -1)
  {
    v17 = *(_DWORD *)(a1 + 68) & 0xFFFFFFFE;
    *(_DWORD *)(a1 + 64) = 0;
    *(_DWORD *)(a1 + 68) = v17;
    LODWORD(v16) = -30769;
  }
  else
  {
    v117 = 0;
    v116 = 0uLL;
    if ((a4 & 0x20000) != 0)
    {
      v115[0] = 0;
      v115[1] = 0;
      v16 = mdb_cursor_last(a1, v115, &v116);
      if (!(_DWORD)v16)
      {
        if ((*(int (**)(size_t *, char **))(*(_QWORD *)(a1 + 48) + 16))(a2, v115) < 1)
        {
          v16 = 4294936497;
        }
        else
        {
          v18 = a1 + 2 * *(unsigned __int16 *)(a1 + 66);
          ++*(_WORD *)(v18 + 328);
          v16 = 4294936498;
        }
      }
    }
    else
    {
      v15 = mdb_cursor_set(a1, a2, &v116, 15, &v117);
      v16 = v15;
      if ((a4 & 0x10) != 0 && !(_DWORD)v15)
      {
        *(_OWORD *)a3 = v116;
        return 4294936497;
      }
    }
    if ((_DWORD)v16 != -30798 && (_DWORD)v16)
      return v16;
    v17 = *(_DWORD *)(a1 + 68);
  }
  if ((v17 & 8) != 0)
    *(_DWORD *)(a1 + 68) = v17 ^ 8;
  if ((a4 & 0x8000) == 0)
  {
    v19 = (uint64_t *)a3;
    if ((a4 & 0x80000) != 0)
    {
      v124 = *(_QWORD *)a3 * v11;
      v19 = &v124;
    }
    result = mdb_page_spill(a1, a2, v19);
    if ((_DWORD)result)
      return result;
  }
  v20 = a4 & 0xFFFF7FFF;
  if ((_DWORD)v16 == -30769)
  {
    *(_QWORD *)&v116 = 0;
    result = mdb_page_new(a1, 2, 1, (char **)&v116);
    if ((_DWORD)result)
      return result;
    v21 = v116;
    v22 = *(unsigned __int16 *)(a1 + 64);
    if (v22 < 0x20)
    {
      *(_WORD *)(a1 + 64) = v22 + 1;
      *(_WORD *)(a1 + 66) = v22;
      *(_QWORD *)(a1 + 8 * v22 + 72) = v21;
      *(_WORD *)(a1 + 2 * v22 + 328) = 0;
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 24) + 124) |= 2u;
    }
    v24 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(v24 + 40) = *(_QWORD *)v21;
    ++*(_WORD *)(v24 + 6);
    **(_BYTE **)(a1 + 56) |= 1u;
    v23 = *(_WORD *)(*(_QWORD *)(a1 + 40) + 4);
    if ((v23 & 0x14) == 0x10)
      *(_WORD *)(v21 + 10) |= 0x20u;
    *(_DWORD *)(a1 + 68) |= 1u;
LABEL_51:
    if ((v23 & 4) == 0 || *a2 + *(_QWORD *)a3 + 8 <= *(unsigned int *)(v10 + 220))
    {
      v109 = 0;
      v110 = 0;
      v27 = 0;
      v28 = (size_t *)a3;
      goto LABEL_128;
    }
    v112 = v16;
    v110 = 0;
    v25 = *(char **)(v10 + 88);
    *((_WORD *)v25 + 4) = *(_QWORD *)a3;
    *((_DWORD *)v25 + 3) = 1048592;
    v120 = 16;
    v26 = 18;
    goto LABEL_111;
  }
  result = mdb_cursor_touch(a1);
  if ((_DWORD)result)
    return result;
  if ((_DWORD)v16)
  {
    v23 = *(_WORD *)(*(_QWORD *)(a1 + 40) + 4);
    goto LABEL_51;
  }
  v29 = *(unsigned __int16 *)(a1 + 66);
  v30 = *(_QWORD *)(a1 + 8 * v29 + 72);
  v31 = *(unsigned int **)(a1 + 40);
  if ((*(_WORD *)(v30 + 10) & 0x20) != 0)
  {
    v32 = *v31;
    v33 = *a2;
    if (*a2 == v32)
    {
      v34 = (void *)(v30 + v32 * *(unsigned __int16 *)(a1 + 2 * v29 + 328) + 16);
      v35 = (const void *)a2[1];
LABEL_59:
      memcpy(v34, v35, v33);
      v36 = *(unsigned __int16 *)(a1 + 66);
      if (*(_WORD *)(a1 + 66) && !*(_WORD *)(a1 + 2 * v36 + 328))
      {
        v37 = v36 - 1;
        *(_WORD *)(a1 + 66) = v36 - 1;
        if ((_WORD)v36 == 1)
        {
          LOWORD(v37) = 0;
          LOWORD(v36) = 1;
        }
        else
        {
          v38 = 1;
          while (!*(_WORD *)(a1 + 2 * (unsigned __int16)v37 + 328))
          {
            *(_WORD *)(a1 + 66) = --v37;
            ++v38;
            if (!(_WORD)v37)
            {
              LOWORD(v37) = 0;
              goto LABEL_68;
            }
          }
          LOWORD(v36) = v38;
        }
LABEL_68:
        if (*(_WORD *)(a1 + 2 * (unsigned __int16)v37 + 328))
        {
          result = mdb_update_key(a1, (uint64_t)a2);
          *(_WORD *)(a1 + 66) += v36;
          if ((_DWORD)result)
            return result;
        }
        else
        {
          *(_WORD *)(a1 + 66) = v37 + v36;
        }
      }
      return 0;
    }
    return 4294936515;
  }
  v114 = a4 & 0xFFFF7FFF;
  v109 = 0;
  v110 = 0;
  v27 = 0;
  while (1)
  {
    v39 = (unsigned int *)(v30 + *(unsigned __int16 *)(v30 + 2 * *(unsigned __int16 *)(a1 + 2 * v29 + 328) + 16));
    v120 = *v39;
    v121 = (char *)v39 + *((unsigned __int16 *)v39 + 3) + 8;
    if ((v31[1] & 4) != 0)
    {
      v40 = *(char **)(v10 + 88);
      v125 = v40;
      v126 = v40;
      *(_QWORD *)v40 = *(_QWORD *)v30;
      v41 = *((_WORD *)v39 + 2);
      if ((v41 & 4) != 0)
      {
        if ((v41 & 2) != 0)
        {
          v108 = v27;
          v113 = 0;
          v20 = v114 | 6;
          goto LABEL_161;
        }
        v25 = v121;
        if (v114 == 64)
          goto LABEL_201;
        if ((*(_WORD *)(*(_QWORD *)(a1 + 40) + 4) & 0x10) != 0)
        {
          v62 = *((unsigned __int16 *)v121 + 4);
          if (v62 <= (unsigned __int16)(*((_WORD *)v121 + 7) - *((_WORD *)v121 + 6)))
          {
LABEL_201:
            v108 = v27;
            v113 = 0;
            *((_WORD *)v121 + 5) |= 0x10u;
            *(_WORD *)v25 = *(_WORD *)v40;
            *((_WORD *)v25 + 1) = *((_WORD *)v40 + 1);
            *((_WORD *)v25 + 2) = *((_WORD *)v40 + 2);
            *((_WORD *)v25 + 3) = *((_WORD *)v40 + 3);
            *(_QWORD *)(*(_QWORD *)(a1 + 16) + 72) = v25;
            v20 = v114 | 4;
            goto LABEL_161;
          }
          v48 = 4 * v62;
        }
        else
        {
          v48 = (*(_DWORD *)a3 + 11) & 0xFFFFFFFE;
        }
        v60 = v120;
        v61 = v120 + v48;
        v124 = v61;
        v26 = *((_WORD *)v121 + 5);
        goto LABEL_109;
      }
      if (v114 != 64)
      {
        v42 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 24);
        if (v120 == 8 && v42 == mdb_cmp_int)
          v42 = (uint64_t (*)(uint64_t, uint64_t))mdb_cmp_cint;
        if (v42(a3, (uint64_t)&v120))
        {
          v44 = v120;
          v122 = v120;
          memcpy(v40 + 24, v121, v120);
          v123 = v40 + 24;
          *((_WORD *)v40 + 5) = 82;
          *((_WORD *)v40 + 6) = 16;
          v45 = *(_QWORD *)a3;
          v46 = v44 + *(_QWORD *)a3 + 16;
          if ((*(_BYTE *)(*(_QWORD *)(a1 + 40) + 4) & 0x10) != 0)
          {
            v26 = 114;
            *((_WORD *)v40 + 5) = 114;
            *((_WORD *)v40 + 4) = v45;
            v47 = 2 * v45;
          }
          else
          {
            v47 = ((*(_QWORD *)a3 & 1) + (v44 & 1)) | 0x14;
            v26 = 82;
          }
          LOWORD(v48) = 0;
          v60 = v47 + v46;
          v124 = v60;
          *((_WORD *)v40 + 7) = v60;
          v120 = v60;
          v61 = v60;
          v25 = v40;
LABEL_109:
          v112 = 0;
          if (*((unsigned __int16 *)v39 + 3) + v61 + 8 <= *(unsigned int *)(v10 + 220))
          {
            v65 = v114;
          }
          else
          {
            v112 = 0;
            v26 &= ~0x40u;
            v20 = v114;
LABEL_111:
            v63 = *(_QWORD *)(a1 + 40);
            if ((*(_WORD *)(v63 + 4) & 0x10) != 0)
            {
              v26 |= 0x20u;
              LODWORD(v118[0]) = *((unsigned __int16 *)v25 + 4);
              WORD2(v118[0]) = 16;
              if ((*(_WORD *)(v63 + 4) & 0x20) != 0)
                v64 = 24;
              else
                v64 = 16;
              WORD2(v118[0]) = v64;
            }
            else
            {
              LODWORD(v118[0]) = 0;
              WORD2(v118[0]) = 0;
            }
            WORD3(v118[0]) = 1;
            *(_OWORD *)((char *)v118 + 8) = xmmword_10001B8F0;
            *((_QWORD *)&v118[1] + 1) = 0;
            *(_QWORD *)&v119 = (*((unsigned __int16 *)v25 + 6) - 16) >> 1;
            v124 = 48;
            v125 = (char *)v118;
            result = mdb_page_alloc(a1, 1, &v126);
            if ((_DWORD)result)
              return result;
            v60 = v120;
            v48 = *(_DWORD *)(v10 + 16) - v120;
            v65 = v20 | 6;
            v40 = v126;
            *((_QWORD *)&v119 + 1) = *(_QWORD *)v126;
            v109 = v126;
          }
          if (v40 != v25)
          {
            *((_WORD *)v40 + 5) = v26 | 0x10;
            *((_WORD *)v40 + 4) = *((_WORD *)v25 + 4);
            *((_WORD *)v40 + 6) = *((_WORD *)v25 + 6);
            v66 = *((_WORD *)v25 + 7) + v48;
            *((_WORD *)v40 + 7) = v66;
            if ((v26 & 0x20) != 0)
            {
              memcpy(v40 + 16, v25 + 16, ((*((unsigned __int16 *)v25 + 6) - 16) >> 1) * *((unsigned __int16 *)v25 + 4));
            }
            else
            {
              memcpy(&v40[v66], &v25[*((unsigned __int16 *)v25 + 7)], v60 - *((unsigned __int16 *)v25 + 7));
              memcpy(v40 + 16, v25 + 16, (*((unsigned __int16 *)v25 + 6) - 16) & 0xFFFFFFFE);
              if ((*((_WORD *)v25 + 6) & 0xFFFE) != 0x10)
              {
                v67 = 0;
                do
                  *(_WORD *)&v40[2 * v67++ + 16] += v48;
                while (v67 < (*((unsigned __int16 *)v25 + 6) - 16) >> 1);
              }
            }
          }
          v20 = v65 | 4;
          v27 = 1;
          v28 = (size_t *)&v124;
          LODWORD(v16) = v112;
          if (!v112)
          {
            mdb_node_del((_QWORD *)a1, 0);
            v28 = (size_t *)&v124;
          }
          goto LABEL_128;
        }
        if ((v114 & 0x40020) != 0)
          return 4294936497;
      }
    }
    v49 = *((unsigned __int16 *)v39 + 2);
    if (((v114 ^ v49) & 2) != 0)
      return 4294936512;
    if ((v49 & 1) == 0)
    {
      v50 = *(_QWORD *)a3;
      if (*(_QWORD *)a3 == v120)
      {
        if ((v114 & 0x10000) != 0)
        {
          result = 0;
          v105 = v121;
LABEL_216:
          *(_QWORD *)(a3 + 8) = v105;
          return result;
        }
        if ((*(_BYTE *)(a1 + 68) & 4) != 0)
        {
          v33 = *a2;
          v35 = (const void *)a2[1];
          v34 = v39 + 2;
          goto LABEL_59;
        }
        v51 = v121;
        v52 = *(const void **)(a3 + 8);
        goto LABEL_219;
      }
      goto LABEL_103;
    }
    v53 = v27;
    v115[0] = 0;
    v117 = 0;
    v54 = *(_QWORD *)a3;
    v55 = *(unsigned int *)(v10 + 16);
    v56 = *(_QWORD *)v121;
    result = mdb_page_get(a1, *(_QWORD *)v121, (unint64_t *)v115, &v117);
    if ((_DWORD)result)
      return result;
    v57 = (v54 + 15) / v55 + 1;
    v58 = v115[0];
    v59 = *((int *)v115[0] + 3);
    if ((int)v59 >= v57)
    {
      if ((*((_WORD *)v115[0] + 5) & 0x10) != 0)
        break;
      if (v117 || (*(_BYTE *)(v10 + 14) & 8) != 0)
      {
        result = mdb_page_unspill(*(_QWORD *)(a1 + 24), (uint64_t)v115[0], v115);
        if ((_DWORD)result)
          return result;
        v117 = 0;
        v58 = v115[0];
        if ((*((_WORD *)v115[0] + 5) & 0x10) != 0)
          break;
      }
    }
    result = mdb_ovpage_free(a1, (uint64_t)v58);
    v27 = v53;
    if ((_DWORD)result)
      return result;
LABEL_103:
    mdb_node_del((_QWORD *)a1, 0);
    LODWORD(v16) = 0;
    v28 = (size_t *)a3;
    v20 = v114;
LABEL_128:
    v68 = *(unsigned __int16 *)(a1 + 66);
    v69 = *(_WORD **)(a1 + 8 * v68 + 72);
    v70 = *a2;
    if ((v69[5] & 0x20) == 0)
    {
      v71 = v70 + *v28 + 8;
      v72 = 8 - *v28;
      if (v71 <= *(unsigned int *)(v10 + 220))
        v72 = 0;
      v70 = (v71 + v72 + 3) & 0xFFFFFFFFFFFFFFFELL;
    }
    if (v70 <= (unsigned __int16)(v69[7] - v69[6]))
    {
      result = mdb_node_add(a1, *(unsigned __int16 *)(a1 + 2 * v68 + 328), (const void **)a2, v28, 0, v20 & 0x30006);
      if ((_DWORD)result)
        goto LABEL_206;
      v75 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
      if (v75)
      {
        v76 = *(unsigned __int16 *)(a1 + 66);
        v77 = *(_QWORD *)(a1 + 8 * v76 + 72);
        v78 = *(_DWORD *)(a1 + 68);
        do
        {
          v79 = v75;
          if ((v78 & 4) != 0)
            v79 = (_QWORD *)v75[2];
          if (v79 != (_QWORD *)a1
            && *((unsigned __int16 *)v79 + 32) >= *(unsigned __int16 *)(a1 + 64)
            && v79[v76 + 9] == v77)
          {
            v80 = (char *)v79 + 2 * v76;
            v81 = *((unsigned __int16 *)v80 + 164);
            if ((_DWORD)v16 && v81 >= *(unsigned __int16 *)(a1 + 2 * v76 + 328))
            {
              LOWORD(v81) = v81 + 1;
              *((_WORD *)v80 + 164) = v81;
            }
            v82 = v79[2];
            if (v82)
            {
              if ((*(_BYTE *)(v82 + 68) & 1) != 0
                && (*(unsigned __int16 *)(v77 + 12) - 16) >> 1 > (unsigned __int16)v81)
              {
                v83 = v77 + *(unsigned __int16 *)(v77 + 2 * (unsigned __int16)v81 + 16);
                if ((*(_WORD *)(v83 + 4) & 6) == 4)
                  *(_QWORD *)(v82 + 72) = v83 + *(unsigned __int16 *)(v83 + 6) + 8;
              }
            }
          }
          v75 = (_QWORD *)*v75;
        }
        while (v75);
      }
    }
    else
    {
      if ((v20 & 6) == 4)
        v73 = v20 & 0x10006;
      else
        v73 = v20 & 0x30006;
      if ((_DWORD)v16)
        v74 = v73;
      else
        v74 = v73 | 0x40000;
      result = mdb_page_split(a1, (uint64_t)a2, v28, 0xFFFFFFFFFFFFFFFFLL, v74);
      if ((_DWORD)result)
        goto LABEL_206;
    }
    if (!(_DWORD)v27)
    {
      result = 0;
      v98 = v16;
      goto LABEL_192;
    }
    v113 = v16;
    v108 = 1;
LABEL_161:
    v124 = 0;
    v125 = (char *)&unk_10001C51B;
    v111 = *(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72)
         + *(unsigned __int16 *)(*(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72)
                               + 2 * *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328)
                               + 16);
    v84 = 32832;
    if ((v20 & 0x40040) != 0x40)
    {
      mdb_xcursor_init1(a1, v111);
      if ((v20 & 0x20) != 0)
        v84 = 32784;
      else
        v84 = 0x8000;
    }
    if (v109)
      *(_QWORD *)(*(_QWORD *)(a1 + 16) + 72) = v109;
    v107 = v122;
    if (v122)
    {
      LODWORD(result) = mdb_cursor_put(*(_QWORD *)(a1 + 16), &v122, &v124, v84);
      if ((_DWORD)result)
        goto LABEL_203;
      v122 = 0;
    }
    if (v109 || (*(_WORD *)(v111 + 4) & 2) == 0)
    {
      v85 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
      if (v85)
      {
        v86 = *(_QWORD *)(a1 + 16);
        v87 = *(unsigned __int16 *)(a1 + 66);
        v88 = *(_QWORD *)(a1 + 8 * v87 + 72);
        do
        {
          if (v85 != a1
            && *(unsigned __int16 *)(v85 + 64) >= *(unsigned __int16 *)(a1 + 64)
            && (*(_BYTE *)(v85 + 68) & 1) != 0
            && *(_QWORD *)(v85 + 8 * v87 + 72) == v88)
          {
            v89 = *(unsigned __int16 *)(v85 + 2 * v87 + 328);
            if (v89 == *(unsigned __int16 *)(a1 + 2 * v87 + 328))
            {
              v106 = v11;
              v90 = v84;
              v91 = v88;
              mdb_xcursor_init2(v85, v86, v107);
              v88 = v91;
              v84 = v90;
              v11 = v106;
            }
            else if (!v113)
            {
              v92 = *(_QWORD *)(v85 + 16);
              if (v92)
              {
                if ((*(_BYTE *)(v92 + 68) & 1) != 0 && v89 < (*(unsigned __int16 *)(v88 + 12) - 16) >> 1)
                {
                  v93 = v88 + *(unsigned __int16 *)(v88 + 2 * *(unsigned __int16 *)(v85 + 2 * v87 + 328) + 16);
                  if ((*(_WORD *)(v93 + 4) & 6) == 4)
                    *(_QWORD *)(v92 + 72) = v93 + *(unsigned __int16 *)(v93 + 6) + 8;
                }
              }
            }
          }
          v85 = *(_QWORD *)v85;
        }
        while (v85);
      }
    }
    v94 = *(_QWORD *)(a1 + 16);
    v16 = *(_QWORD *)(v94 + 424);
    result = mdb_cursor_put(v94, a3, &v124, v84 | (v20 >> 1) & 0x20000);
    if ((v20 & 2) != 0)
    {
      v95 = v111 + *(unsigned __int16 *)(v111 + 6);
      v97 = *(_OWORD *)(*(_QWORD *)(a1 + 16) + 408);
      v96 = *(_OWORD *)(*(_QWORD *)(a1 + 16) + 424);
      *(_OWORD *)(v95 + 8) = *(_OWORD *)(*(_QWORD *)(a1 + 16) + 392);
      *(_OWORD *)(v95 + 24) = v97;
      *(_OWORD *)(v95 + 40) = v96;
    }
    v98 = *(_DWORD *)(*(_QWORD *)(a1 + 16) + 424) - v16;
    LODWORD(v16) = v113;
    v27 = v108;
LABEL_192:
    if (v98)
      ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
    if ((_DWORD)v16)
    {
      if ((_DWORD)result)
      {
LABEL_203:
        if ((_DWORD)result == -30799)
          result = 4294936517;
        else
          result = result;
LABEL_206:
        *(_DWORD *)(*(_QWORD *)(a1 + 24) + 124) |= 2u;
        return result;
      }
      *(_DWORD *)(a1 + 68) |= 1u;
    }
    if ((v20 & 0x80000) == 0 || (_DWORD)result)
      return result;
    v99 = (v110 + 1);
    *(_QWORD *)(a3 + 16) = v99;
    if (v99 >= v11)
      return 0;
    ++v110;
    v114 = v20;
    *(_QWORD *)(a3 + 8) += *(_QWORD *)a3;
    v29 = *(unsigned __int16 *)(a1 + 66);
    v30 = *(_QWORD *)(a1 + 8 * v29 + 72);
    v31 = *(unsigned int **)(a1 + 40);
  }
  if (v117 <= 1)
  {
    v104 = v114 & 0x10000;
    v102 = v58;
    goto LABEL_214;
  }
  v100 = *(unsigned int *)(v10 + 16);
  v101 = mdb_page_malloc(*(_QWORD *)(a1 + 24), v59);
  if (v101)
  {
    v102 = v101;
    v103 = v100 * v59;
    *(_QWORD *)&v116 = v56;
    *((_QWORD *)&v116 + 1) = v101;
    mdb_mid2l_insert(*(unsigned int **)(*(_QWORD *)(a1 + 24) + 72), (unint64_t *)&v116);
    v104 = v114 & 0x10000;
    if ((v114 & 0x10000) == 0)
    {
      memcpy(&v102[(*(_QWORD *)a3 & 0xFFFFFFFFFFFFFFF8) + 16], &v58[(*(_QWORD *)a3 & 0xFFFFFFFFFFFFFFF8) + 16], v103 - ((*(_QWORD *)a3 & 0xFFFFFFFFFFFFFFF8) + 16));
      v103 = 16;
    }
    memcpy(v102, v58, v103);
LABEL_214:
    v50 = *(_QWORD *)a3;
    *v39 = *(_QWORD *)a3;
    v105 = v102 + 16;
    if (v104)
    {
      result = 0;
      goto LABEL_216;
    }
    v52 = *(const void **)(a3 + 8);
    v51 = v102 + 16;
LABEL_219:
    memcpy(v51, v52, v50);
    return 0;
  }
  return 12;
}

uint64_t mdb_freelist_save(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t **v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  BOOL v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  int *v39;
  unsigned int v40;
  unsigned int v41;
  int64_t *v42;
  int64_t v43;
  int64_t v44;
  int v45;
  unint64_t v46;
  size_t v47;
  int64_t *v48;
  size_t v49;
  unint64_t *v50;
  unint64_t v51;
  _OWORD v52[24];
  uint64_t v53;

  v53 = 0;
  memset(v52, 0, sizeof(v52));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(int *)(v2 + 216);
  v51 = 0;
  mdb_cursor_init((uint64_t)v52, a1, 0, 0);
  v4 = (uint64_t **)(v2 + 176);
  if (!*(_QWORD *)(v2 + 176))
    goto LABEL_95;
  result = mdb_page_search((uint64_t)v52, 0, 5);
  if ((_DWORD)result && (_DWORD)result != -30798)
    return result;
  if (!*v4)
  {
LABEL_95:
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 72);
      result = mdb_midl_need((_DWORD **)(a1 + 40), *(_DWORD *)(a1 + 56));
      if ((_DWORD)result)
        return result;
      do
      {
        v8 = *(uint64_t **)(a1 + 40);
        v9 = *v8 + 1;
        *v8 = v9;
        v8[v9] = *(_QWORD *)v6;
        if ((*(_BYTE *)(a1 + 126) & 8) != 0)
        {
          if (*(_QWORD *)v7)
          {
            v10 = 1;
            do
            {
              if (*(_QWORD *)(v7 + 16 * v10) == *(_QWORD *)v6)
                break;
              v10 = (v10 + 1);
            }
            while (*(_QWORD *)v7 >= v10);
          }
          else
          {
            LODWORD(v10) = 1;
          }
        }
        else
        {
          LODWORD(v10) = mdb_mid2l_search((unsigned int *)v7, *(_QWORD *)v6);
          if ((*(_WORD *)(v6 + 10) & 4) != 0 && *(_DWORD *)(v6 + 12) != 1)
          {
            free((void *)v6);
          }
          else
          {
            *(_QWORD *)v6 = *(_QWORD *)(v2 + 192);
            *(_QWORD *)(v2 + 192) = v6;
          }
        }
        *(_QWORD *)(v7 + 16 * v10 + 8) = 0;
        v6 = *(_QWORD *)(v6 + 48);
      }
      while (v6);
      v11 = *(_QWORD *)v7;
      if (*(_QWORD *)(v7 + 24))
      {
        v12 = 1;
        while (v11 >= v12)
        {
          v12 = (v12 + 1);
          v13 = v12;
          if (!*(_QWORD *)(v7 + 16 * v12 + 8))
            goto LABEL_27;
        }
        v13 = v12;
      }
      else
      {
        v13 = 1;
        v12 = 1;
      }
LABEL_27:
      if (v11 >= v12)
      {
        LODWORD(v15) = v13;
        while (1)
        {
          do
          {
            v15 = (v15 + 1);
            if (*(_QWORD *)(v7 + 16 * v15 + 8))
              v16 = 0;
            else
              v16 = v11 >= v15;
          }
          while (v16);
          if (v11 < v15)
            break;
          *(_OWORD *)(v7 + 16 * v13++) = *(_OWORD *)(v7 + 16 * v15);
          v11 = *(_QWORD *)v7;
        }
        v14 = v13 - 1;
      }
      else
      {
        v14 = 0;
      }
      *(_QWORD *)v7 = v14;
      *(_QWORD *)(a1 + 48) = 0;
      *(_DWORD *)(a1 + 56) = 0;
    }
  }
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = *(_DWORD *)(v2 + 12) & 0x1080000;
  v45 = 1;
  while (1)
  {
LABEL_39:
    v49 = 0;
    v50 = 0;
    v47 = 0;
    v48 = 0;
    if (v17 < *(_QWORD *)(v2 + 184))
    {
      while (1)
      {
        result = mdb_cursor_first((uint64_t)v52, &v49, 0);
        if ((_DWORD)result)
          return result;
        v17 = *v50;
        v51 = *v50;
        result = mdb_cursor_del((uint64_t)v52, 0);
        if ((_DWORD)result)
          return result;
        if (v17 >= *(_QWORD *)(v2 + 184))
        {
          v19 = 0;
          v20 = 0;
          break;
        }
      }
    }
    if (v18 < **(_QWORD **)(a1 + 40))
    {
      if (v18 || (result = mdb_page_search((uint64_t)v52, 0, 9), !(_DWORD)result) || (_DWORD)result == -30798)
      {
        v22 = *(unint64_t **)(a1 + 40);
        v49 = 8;
        v50 = (unint64_t *)(a1 + 24);
        v23 = *v22;
        while (1)
        {
          v18 = v23;
          v47 = 8 * v23 + 8;
          result = mdb_cursor_put((uint64_t)v52, &v49, (uint64_t)&v47, 0x10000);
          if ((_DWORD)result)
            break;
          v24 = *(unint64_t **)(a1 + 40);
          v23 = *v24;
          if (v18 >= *v24)
          {
            mdb_midl_sort(*(int **)(a1 + 40));
            memcpy(v48, v24, v47);
            goto LABEL_39;
          }
        }
      }
      return result;
    }
    v25 = *v4;
    v26 = v21;
    v27 = *v4 ? *v25 : 0;
    v28 = *(int *)(a1 + 56);
    v29 = v27 + v28;
    if (v20 >= v27 + v28)
      break;
    v30 = v51;
    if (v19 >= v3 && v51 >= 2)
    {
      v19 = 0;
      v30 = --v51;
    }
LABEL_64:
    v32 = v20 - v19;
    v33 = v29 - (v20 - v19);
    if (v33 > v3 && v30 >= 2)
      v19 = v3 + (uint64_t)(v33 / v30) / ((int)v3 + 1) * ((int)v3 + 1);
    else
      v19 = v33 & ~(v33 >> 63);
    v21 = v26;
    v49 = 8;
    v50 = &v51;
    v47 = 8 * v19 + 8;
    result = mdb_cursor_put((uint64_t)v52, &v49, (uint64_t)&v47, 0x10000);
    if ((_DWORD)result)
      return result;
    if (v19 > v3 && (_DWORD)v21 == 0)
      v36 = v19;
    else
      v36 = 0;
    bzero(&v48[v36 & (v36 >> 63)], 8 * (v36 - (v36 & (v36 >> 63))) + 8);
    v20 = v19 + v32;
  }
  if (v20 != v27 + v28 && v45 >= 1)
  {
    --v45;
    v30 = v51;
    goto LABEL_64;
  }
  v37 = *(_QWORD **)(a1 + 48);
  if (v37)
  {
    v38 = *(unsigned int *)(a1 + 56);
    result = mdb_midl_need((_DWORD **)(v2 + 176), (2 * v28) | 1);
    if ((_DWORD)result)
      return result;
    v25 = *v4;
    v39 = (int *)&(*v4)[*(*v4 - 1) - v38];
    v40 = 1;
    do
    {
      v41 = v40;
      *(_QWORD *)&v39[2 * v40] = *v37;
      v37 = (_QWORD *)v37[6];
      ++v40;
    }
    while (v37);
    *(_QWORD *)v39 = v41;
    mdb_midl_sort(v39);
    mdb_midl_xmerge(v25, (uint64_t *)v39);
    *(_QWORD *)(a1 + 48) = 0;
    *(_DWORD *)(a1 + 56) = 0;
    v29 = *v25;
  }
  if (!v29)
    return 0;
  v49 = 0;
  v50 = 0;
  v47 = 0;
  v48 = 0;
  result = mdb_cursor_first((uint64_t)v52, &v49, &v47);
  if (!(_DWORD)result)
  {
    v42 = &v25[v29];
    do
    {
      v46 = 0;
      v46 = *v50;
      v43 = (v47 >> 3) - 1;
      v50 = &v46;
      if (v43 > v29)
      {
        v47 = 8 * v29 + 8;
        v43 = v29;
      }
      v42 -= v43;
      v48 = v42;
      v44 = *v42;
      *v42 = v43;
      result = mdb_cursor_put((uint64_t)v52, &v49, (uint64_t)&v47, 64);
      *v42 = v44;
      if ((_DWORD)result)
        break;
      v29 -= v43;
      if (!v29)
        break;
      result = mdb_cursor_next((uint64_t)v52, &v49, &v47, 8);
    }
    while (!(_DWORD)result);
  }
  return result;
}

uint64_t mdb_page_flush(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  off_t v7;
  uint64_t v8;
  size_t v9;
  off_t v10;
  int v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  unsigned int v18;
  _BOOL4 v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  ssize_t v24;
  uint64_t result;
  iovec *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  _QWORD *v32;
  int v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t *v36;
  int v37;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t v42;
  uint64_t *v43;
  int v44;
  uint64_t v45;
  iovec __buf[64];

  v2 = a1;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(uint64_t **)(a1 + 72);
  v5 = *v4;
  if ((*(_BYTE *)(v3 + 14) & 8) == 0)
  {
    v39 = *(_QWORD *)(a1 + 32);
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = *(unsigned int *)(v3 + 16);
    v13 = *(_DWORD *)v3;
    v45 = (int)v5;
    v40 = v5 + 1;
    v14 = 1;
    v41 = 1 - v5;
    v42 = *v4;
    v37 = a2;
    v15 = a2;
    v43 = *(uint64_t **)(a1 + 72);
    while (1)
    {
      if (v15 >= (int)v5)
      {
        v19 = 0;
        v20 = v15++;
      }
      else
      {
        v16 = v15 + 1;
        v17 = &v4[2 * v16];
        v8 = v17[1];
        v18 = *(unsigned __int16 *)(v8 + 10);
        if (v18 >= 0x4000)
        {
          v16 = 0;
          while (1)
          {
            *(_WORD *)(v8 + 10) = v18 & 0x7FFF;
            *v17 = 0;
            if (!(v41 + v15 + (_DWORD)v16))
              break;
            v8 = v17[3];
            v18 = *(unsigned __int16 *)(v8 + 10);
            v17 += 2;
            ++v16;
            if (v18 < 0x4000)
            {
              v21 = v15 + v16;
              v19 = v21 < v45;
              v20 = v15 + v16;
              LODWORD(v16) = v21 + 1;
              goto LABEL_11;
            }
          }
          v19 = v15 + v16 + 1 < v45;
          v20 = v15 + v16 + 1;
          v15 = v40;
        }
        else
        {
          v19 = 1;
          v20 = v15;
LABEL_11:
          v15 = v16;
          v22 = *v17;
          *(_WORD *)(v8 + 10) = v18 & 0x3FEF;
          v7 = v22 * v12;
          if ((v18 & 4) != 0)
            v6 = *(unsigned int *)(v8 + 12) * (unint64_t)v12;
          else
            v6 = v12;
        }
      }
      if (v7 != v14 || v11 == 64 || v6 + v9 >= 0x40000001)
      {
        v44 = v20;
        if (v11)
        {
          v23 = v12;
          while (1)
          {
            if (v11 == 1)
            {
              v24 = pwrite(v13, __buf[0].iov_base, v9, v10);
            }
            else
            {
              while (lseek(v13, v10, 0) == -1)
              {
                result = *__error();
                if ((_DWORD)result != 4)
                  return result;
              }
              v24 = writev(v13, __buf, v11);
            }
            LODWORD(v5) = v42;
            v4 = v43;
            v12 = v23;
            if (v24 == v9)
              break;
            if ((v24 & 0x8000000000000000) == 0)
              return 5;
            result = *__error();
            if ((_DWORD)result != 4)
              return result;
          }
        }
        if (!v19)
        {
          if ((*(_BYTE *)(v39 + 14) & 8) != 0)
          {
            v27 = v37;
            a2 = v44;
          }
          else
          {
            a2 = v37;
            if ((int)v5 <= v37)
            {
              v27 = v37;
            }
            else
            {
              v27 = v37;
              v32 = v4 + 2;
              v33 = v37;
              do
              {
                v34 = v33;
                v35 = &v32[2 * v33];
                while (1)
                {
                  v36 = (uint64_t *)v35[1];
                  if (!*v35)
                    break;
                  if ((*((_WORD *)v36 + 5) & 4) != 0 && *((_DWORD *)v36 + 3) != 1)
                  {
                    free(v36);
                    LODWORD(v5) = v42;
                    v4 = v43;
                  }
                  else
                  {
                    *v36 = *(_QWORD *)(v39 + 192);
                    *(_QWORD *)(v39 + 192) = v36;
                  }
                  ++v34;
                  v35 += 2;
                  if (v34 >= v45)
                  {
                    a2 = v34;
                    goto LABEL_59;
                  }
                }
                v33 = v34 + 1;
                *(_OWORD *)&v4[2 * ++v27] = *(_OWORD *)v35;
                v4[2 * v27] = *v36;
              }
              while ((int)v34 + 1 < (int)v5);
              a2 = v34 + 1;
            }
          }
LABEL_59:
          v2 = a1;
          goto LABEL_41;
        }
        v9 = 0;
        v11 = 0;
        v10 = v7;
      }
      v26 = &__buf[v11];
      v26->iov_base = (void *)v8;
      v26->iov_len = v6;
      v14 = v7 + v6;
      v9 += v6;
      ++v11;
    }
  }
  if ((int)v5 <= a2)
  {
    v27 = a2;
  }
  else
  {
    v27 = a2;
    do
    {
      v28 = a2;
      v29 = (uint64_t)&v4[2 * a2 + 3];
      while (1)
      {
        v30 = *(_QWORD *)v29;
        v31 = *(unsigned __int16 *)(*(_QWORD *)v29 + 10);
        if (v31 >= 0x4000)
          break;
        ++v28;
        *(_WORD *)(v30 + 10) = v31 & 0xFFEF;
        v29 += 16;
        if (v28 >= (int)v5)
        {
          a2 = v28;
          goto LABEL_41;
        }
      }
      a2 = v28 + 1;
      *(_WORD *)(v30 + 10) = v31 & 0x7FFF;
      *(_OWORD *)&v4[2 * ++v27] = *(_OWORD *)(v29 - 8);
    }
    while ((int)v28 + 1 < (int)v5);
  }
LABEL_41:
  result = 0;
  *(_DWORD *)(v2 + 128) += a2 - v27;
  *v4 = v27;
  return result;
}

uint64_t mdb_env_write_meta(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  __int128 *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  off_t v13;
  int v14;
  int v15;
  uint64_t v16;
  __int128 *v17;
  __int128 v18;
  __int128 v19;
  _OWORD *v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  int v26;
  uint64_t v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(v3 + 12) | *(_DWORD *)(a1 + 124);
  v5 = *(_QWORD *)(v3 + 72 + 8 * (v2 & 1));
  v6 = *(_QWORD *)(*(_QWORD *)(v3 + 72 + 8 * !(v2 & 1)) + 16);
  if (v6 <= *(_QWORD *)(v3 + 112))
    v6 = *(_QWORD *)(v3 + 112);
  if ((v4 & 0x80000) == 0)
  {
    v28 = *(_QWORD *)(v5 + 128);
    v7 = *(_QWORD *)(v5 + 120);
    v29 = v6;
    v8 = *(__int128 **)(a1 + 88);
    v9 = *v8;
    v10 = v8[2];
    v31 = v8[1];
    v32 = v10;
    v30 = v9;
    v12 = v8[4];
    v11 = v8[5];
    v33 = v8[3];
    v34 = v12;
    v35 = v11;
    v36 = *(_QWORD *)(a1 + 16) - 1;
    v37 = v2;
    v13 = v5 - *(_QWORD *)(v3 + 56) + 16;
    v14 = *(_DWORD *)(v3 + 8 * ((v4 & 0x50000) == 0));
    while (1)
    {
      v15 = pwrite(v14, &v29, 0x78uLL, v13);
      if (v15 == 120)
        goto LABEL_10;
      if ((v15 & 0x80000000) == 0)
      {
        v16 = 5;
LABEL_19:
        v36 = v7;
        v37 = v28;
        pwrite(*(_DWORD *)v3, &v29, 0x78uLL, v13);
        goto LABEL_20;
      }
      v16 = *__error();
      if ((_DWORD)v16 != 4)
        goto LABEL_19;
    }
  }
  *(_QWORD *)(v5 + 16) = v6;
  v17 = *(__int128 **)(a1 + 88);
  v18 = *v17;
  v19 = v17[1];
  *(_OWORD *)(v5 + 56) = v17[2];
  *(_OWORD *)(v5 + 40) = v19;
  *(_OWORD *)(v5 + 24) = v18;
  v20 = *(_OWORD **)(a1 + 88);
  v21 = v20[3];
  v22 = v20[4];
  *(_OWORD *)(v5 + 104) = v20[5];
  *(_OWORD *)(v5 + 88) = v22;
  *(_OWORD *)(v5 + 72) = v21;
  *(_QWORD *)(v5 + 120) = *(_QWORD *)(a1 + 16) - 1;
  *(_QWORD *)(v5 + 128) = *(_QWORD *)(a1 + 24);
  if ((v4 & 0x50000) != 0
    || ((*(_DWORD *)(v3 + 12) & 0x100000) != 0 ? (v24 = 1) : (v24 = 16),
        v25 = v5 - 16,
        v26 = (*(_DWORD *)(v3 + 20) - 1) & (v25 - *(_DWORD *)(v3 + 56)),
        !msync((void *)(v25 - v26), (v26 + *(_DWORD *)(v3 + 16)), v24)))
  {
LABEL_10:
    v23 = *(_QWORD *)(v3 + 64);
    v16 = 0;
    if (v23)
      *(_QWORD *)(v23 + 8) = *(_QWORD *)(a1 + 24);
    return v16;
  }
  v16 = *__error();
LABEL_20:
  *(_DWORD *)(v3 + 12) |= 0x80000000;
  return v16;
}

uint64_t mdb_cmp_long(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v4;
  _BOOL4 v5;

  v2 = **(_QWORD **)(a1 + 8);
  v3 = **(_QWORD **)(a2 + 8);
  v4 = v2 >= v3;
  v5 = v2 > v3;
  if (v4)
    return v5;
  else
    return 0xFFFFFFFFLL;
}

uint64_t mdb_get(uint64_t a1, unsigned int a2, _QWORD *a3, _QWORD *a4)
{
  uint64_t result;
  int v9;
  _OWORD v10[31];
  _BYTE v11[384];
  uint64_t v12;

  v9 = 0;
  result = 22;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        if (*(_DWORD *)(a1 + 120) > a2)
        {
          v12 = 0;
          memset(v11, 0, sizeof(v11));
          memset(v10, 0, sizeof(v10));
          if ((*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 0x10) != 0)
          {
            if ((*(_BYTE *)(a1 + 124) & 0x13) != 0)
            {
              return 4294936514;
            }
            else
            {
              mdb_cursor_init((uint64_t)v11, a1, a2, (uint64_t)v10);
              return mdb_cursor_set((uint64_t)v11, a3, a4, 15, &v9);
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t mdb_cursor_set(uint64_t a1, _QWORD *a2, _QWORD *a3, int a4, int *a5)
{
  uint64_t v10;
  uint64_t result;
  _WORD *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _WORD *v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  int v27;
  _BOOL4 v29;
  uint64_t v30;
  __int128 *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;

  if (!*a2)
    return 4294936515;
  v10 = *(_QWORD *)(a1 + 16);
  if (v10)
    *(_DWORD *)(v10 + 68) &= 0xFFFFFFFC;
  if ((*(_BYTE *)(a1 + 68) & 1) == 0)
  {
    *(_QWORD *)(a1 + 72) = 0;
LABEL_6:
    result = mdb_page_search(a1, a2, 0);
    if ((_DWORD)result)
      return result;
    v12 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    goto LABEL_8;
  }
  v35 = 0uLL;
  v15 = *(unsigned __int16 *)(a1 + 66);
  v12 = *(_WORD **)(a1 + 8 * v15 + 72);
  if ((v12[6] & 0xFFFE) == 0x10)
  {
    *(_WORD *)(a1 + 2 * v15 + 328) = 0;
    return 4294936498;
  }
  if ((v12[5] & 0x20) != 0)
  {
    v14 = 0;
    v16 = **(unsigned int **)(a1 + 40);
    v17 = v12 + 8;
  }
  else
  {
    v14 = (uint64_t)v12 + (unsigned __int16)v12[8];
    v16 = *(unsigned __int16 *)(v14 + 6);
    v17 = (_WORD *)(v14 + 8);
  }
  *(_QWORD *)&v35 = v16;
  *((_QWORD *)&v35 + 1) = v17;
  v18 = (*(uint64_t (**)(_QWORD *, __int128 *))(*(_QWORD *)(a1 + 48) + 16))(a2, &v35);
  if (!v18)
  {
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = 0;
    goto LABEL_27;
  }
  if (v18 <= 0)
  {
    LODWORD(v22) = *(unsigned __int16 *)(a1 + 66);
    goto LABEL_41;
  }
  v19 = (unsigned __int16)v12[6] - 16;
  v20 = v19 >> 1;
  if (v19 < 4)
  {
LABEL_33:
    v22 = *(unsigned __int16 *)(a1 + 66);
    if (*(_WORD *)(a1 + 66))
    {
      v24 = 0;
      while (((*(unsigned __int16 *)(*(_QWORD *)(a1 + 328 + 8 * v24 - 256) + 12) - 16) >> 1) - 1 <= *(unsigned __int16 *)(a1 + 328 + 2 * v24))
      {
        if (v22 == ++v24)
          goto LABEL_40;
      }
    }
    else
    {
      LODWORD(v24) = 0;
    }
    if ((_DWORD)v24 == (_DWORD)v22)
    {
LABEL_40:
      *(_WORD *)(a1 + 2 * v22 + 328) = v20;
      return 4294936498;
    }
LABEL_41:
    if (!(_DWORD)v22)
    {
      *(_WORD *)(a1 + 328) = 0;
      if (a4 != 17 || a5)
        return 4294936498;
      goto LABEL_46;
    }
    goto LABEL_6;
  }
  if ((v12[5] & 0x20) != 0)
  {
    v21 = (uint64_t)v12 + v35 * (v20 - 1) + 16;
  }
  else
  {
    v14 = (uint64_t)v12 + (unsigned __int16)v12[v20 + 7];
    *(_QWORD *)&v35 = *(unsigned __int16 *)(v14 + 6);
    v21 = v14 + 8;
  }
  *((_QWORD *)&v35 + 1) = v21;
  v23 = (*(uint64_t (**)(_QWORD *, __int128 *))(*(_QWORD *)(a1 + 48) + 16))(a2, &v35);
  if (!v23)
  {
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v20 - 1;
    goto LABEL_27;
  }
  if ((v23 & 0x80000000) == 0)
    goto LABEL_33;
  v33 = *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328);
  if (v33 < ((unsigned __int16)v12[6] - 16) >> 1)
  {
    if ((v12[5] & 0x20) != 0)
    {
      v34 = (uint64_t)v12 + v35 * v33 + 16;
    }
    else
    {
      v14 = (uint64_t)v12 + (unsigned __int16)v12[v33 + 8];
      *(_QWORD *)&v35 = *(unsigned __int16 *)(v14 + 6);
      v34 = v14 + 8;
    }
    *((_QWORD *)&v35 + 1) = v34;
    if (!(*(unsigned int (**)(_QWORD *, __int128 *))(*(_QWORD *)(a1 + 48) + 16))(a2, &v35))
    {
LABEL_27:
      if (a5)
        *a5 = 1;
      goto LABEL_46;
    }
  }
  *(_DWORD *)(a1 + 68) &= ~2u;
LABEL_8:
  v13 = mdb_node_search(a1, a2, a5);
  v14 = (uint64_t)v13;
  if (a5 && !*a5)
    return 4294936498;
  if (!v13)
  {
    result = mdb_cursor_sibling(a1, 1);
    if ((_DWORD)result)
    {
      *(_DWORD *)(a1 + 68) |= 2u;
      return result;
    }
    v12 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    v14 = (uint64_t)v12 + (unsigned __int16)v12[8];
  }
LABEL_46:
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a1 + 68) & 0xFFFFFFFC | 1;
  if ((v12[5] & 0x20) != 0)
  {
    result = 0;
    if ((a4 & 0xFFFFFFFE) == 0x10)
    {
      v30 = **(unsigned int **)(a1 + 40);
      *a2 = v30;
      a2[1] = (char *)v12
            + *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328)
            * (unint64_t)v30
            + 16;
    }
    return result;
  }
  if ((*(_WORD *)(v14 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v14);
    if ((a4 - 15) > 2)
    {
      LODWORD(v35) = 0;
      if (a4 == 2)
        v31 = &v35;
      else
        v31 = 0;
      result = mdb_cursor_set(*(_QWORD *)(a1 + 16), a3, 0, 17, v31);
      if (!(_DWORD)result)
        goto LABEL_79;
      return result;
    }
    result = mdb_cursor_first(*(_QWORD *)(a1 + 16), a3, 0);
LABEL_79:
    if ((a4 & 0xFFFFFFFE) == 0x10)
    {
      *a2 = *(unsigned __int16 *)(v14 + 6);
      a2[1] = v14 + 8;
    }
    return result;
  }
  if (!a3)
  {
    result = 0;
    goto LABEL_79;
  }
  if ((a4 & 0xFFFFFFFE) == 2)
  {
    v35 = 0uLL;
    result = mdb_node_read(a1, (unsigned int *)v14, &v35);
    if ((_DWORD)result)
      return result;
    v25 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 24);
    if ((_QWORD)v35 == 8 && v25 == mdb_cmp_int)
      v25 = (uint64_t (*)(uint64_t, uint64_t))mdb_cmp_cint;
    v27 = v25((uint64_t)a3, (uint64_t)&v35);
    v29 = a4 == 2 || v27 > 0;
    if (!v27 || !v29)
    {
      result = 0;
      *(_OWORD *)a3 = v35;
      goto LABEL_79;
    }
    return 4294936498;
  }
  v32 = *(_QWORD *)(a1 + 16);
  if (v32)
    *(_DWORD *)(v32 + 68) &= 0xFFFFFFFC;
  result = mdb_node_read(a1, (unsigned int *)v14, a3);
  if (!(_DWORD)result)
    goto LABEL_79;
  return result;
}

uint64_t mdb_cursor_get(uint64_t a1, _QWORD *a2, _QWORD *a3, int a4)
{
  uint64_t result;
  uint64_t (*v7)(uint64_t, _QWORD *, _QWORD *);
  int *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;

  v29 = 0;
  if (!a1)
    return 22;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 24) + 124) & 0x13) != 0)
    return 4294936514;
  v7 = mdb_cursor_first;
  switch(a4)
  {
    case 0:
      result = mdb_cursor_first(a1, a2, a3);
      break;
    case 1:
      goto LABEL_32;
    case 2:
    case 3:
      if (!a3)
        goto LABEL_58;
      if (!*(_QWORD *)(a1 + 16))
        goto LABEL_47;
LABEL_10:
      if (!a2)
        goto LABEL_58;
      if (a4 == 17)
        v8 = 0;
      else
        v8 = &v29;
      result = mdb_cursor_set(a1, a2, a3, a4, v8);
      break;
    case 4:
      if ((*(_BYTE *)(a1 + 68) & 1) == 0)
        goto LABEL_58;
      v9 = *(unsigned __int16 *)(a1 + 66);
      v10 = *(_QWORD *)(a1 + 8 * v9 + 72);
      v11 = *(unsigned __int16 *)(v10 + 12) - 16;
      v12 = v11 >> 1;
      if (v11 < 2 || (v13 = *(unsigned __int16 *)(a1 + 2 * v9 + 328), v12 <= v13))
      {
        *(_WORD *)(a1 + 2 * v9 + 328) = v12;
        goto LABEL_56;
      }
      if ((*(_WORD *)(v10 + 10) & 0x20) != 0)
      {
        result = 0;
        v28 = **(unsigned int **)(a1 + 40);
        *a2 = v28;
        a2[1] = v10 + v28 * (unint64_t)v13 + 16;
      }
      else
      {
        v14 = v10 + *(unsigned __int16 *)(v10 + 2 * v13 + 16);
        if (a2)
        {
          *a2 = *(unsigned __int16 *)(v14 + 6);
          a2[1] = v14 + 8;
        }
        if (a3)
        {
          if ((*(_WORD *)(v14 + 4) & 4) == 0)
            goto LABEL_39;
          result = mdb_cursor_get(*(_QWORD *)(a1 + 16), a3, 0, 4);
        }
        else
        {
LABEL_29:
          result = 0;
        }
      }
      break;
    case 5:
      if (!a3 || (*(_BYTE *)(a1 + 68) & 1) == 0)
        goto LABEL_58;
      if ((*(_WORD *)(*(_QWORD *)(a1 + 40) + 4) & 0x10) == 0)
        goto LABEL_47;
      v15 = *(_QWORD *)(a1 + 16);
      if ((*(_DWORD *)(v15 + 68) & 3) != 1)
        goto LABEL_29;
      goto LABEL_54;
    case 6:
      result = mdb_cursor_last(a1, a2, a3);
      break;
    case 7:
      v7 = mdb_cursor_last;
LABEL_32:
      if (!a3)
        goto LABEL_58;
      v16 = *(_DWORD *)(a1 + 68);
      if ((v16 & 1) == 0)
        goto LABEL_58;
      v17 = *(_QWORD *)(a1 + 16);
      if (!v17)
        goto LABEL_47;
      v18 = *(unsigned __int16 *)(a1 + 66);
      v19 = a1 + 2 * v18;
      v20 = *(unsigned __int16 *)(v19 + 328);
      v21 = *(_QWORD *)(a1 + 8 * v18 + 72);
      v22 = *(unsigned __int16 *)(v21 + 12) - 16;
      if (v20 >= v22 >> 1)
      {
        *(_WORD *)(v19 + 328) = v22 >> 1;
        goto LABEL_56;
      }
      *(_DWORD *)(a1 + 68) = v16 & 0xFFFFFFFD;
      v14 = v21 + *(unsigned __int16 *)(v21 + 2 * v20 + 16);
      if ((*(_WORD *)(v14 + 4) & 4) != 0)
      {
        if ((*(_BYTE *)(v17 + 68) & 1) != 0)
          result = v7(v17, a3, 0);
        else
LABEL_58:
          result = 22;
      }
      else
      {
        if (a2)
        {
          *a2 = *(unsigned __int16 *)(v14 + 6);
          a2[1] = v14 + 8;
        }
LABEL_39:
        result = mdb_node_read(a1, (unsigned int *)v14, a3);
      }
      break;
    case 8:
    case 9:
    case 11:
      result = mdb_cursor_next(a1, a2, a3, a4);
      break;
    case 10:
      if (!a3)
        goto LABEL_58;
      if ((*(_WORD *)(*(_QWORD *)(a1 + 40) + 4) & 0x10) == 0)
        goto LABEL_47;
      result = mdb_cursor_next(a1, a2, a3, 9);
      if ((_DWORD)result)
        break;
      v15 = *(_QWORD *)(a1 + 16);
      if ((*(_BYTE *)(v15 + 68) & 1) == 0)
        goto LABEL_56;
      goto LABEL_54;
    case 12:
    case 13:
    case 14:
      result = mdb_cursor_prev(a1, a2, a3, a4);
      break;
    case 15:
    case 16:
    case 17:
      goto LABEL_10;
    case 18:
      if (!a3)
        goto LABEL_58;
      if ((*(_WORD *)(*(_QWORD *)(a1 + 40) + 4) & 0x10) != 0)
      {
        if ((*(_BYTE *)(a1 + 68) & 1) != 0 || (result = mdb_cursor_last(a1, a2, a3), !(_DWORD)result))
        {
          v23 = *(_QWORD *)(a1 + 16);
          if ((*(_BYTE *)(v23 + 68) & 1) != 0)
          {
            result = mdb_cursor_sibling(v23, 0);
            if (!(_DWORD)result)
            {
              v15 = *(_QWORD *)(a1 + 16);
LABEL_54:
              result = 0;
              v24 = *(unsigned __int16 *)(v15 + 66);
              v25 = v15 + 8 * v24;
              v26 = *(_QWORD *)(v25 + 72);
              *a3 = ((*(unsigned __int16 *)(v26 + 12) - 16) >> 1) * **(_DWORD **)(v15 + 40);
              a3[1] = v26 + 16;
              *(_WORD *)(v15 + 2 * v24 + 328) = ((*(unsigned __int16 *)(*(_QWORD *)(v25 + 72) + 12)
                                                + 131056) >> 1)
                                              - 1;
            }
          }
          else
          {
LABEL_56:
            result = 4294936498;
          }
        }
      }
      else
      {
LABEL_47:
        result = 4294936512;
      }
      break;
    default:
      goto LABEL_58;
  }
  v27 = *(_DWORD *)(a1 + 68);
  if ((v27 & 8) != 0)
    *(_DWORD *)(a1 + 68) = v27 ^ 8;
  return result;
}

uint64_t mdb_node_read(uint64_t a1, unsigned int *a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t result;
  unint64_t v6;

  if ((a2[1] & 1) != 0)
  {
    v6 = 0;
    *a3 = *a2;
    result = mdb_page_get(a1, *(_QWORD *)((char *)a2 + *((unsigned __int16 *)a2 + 3) + 8), &v6, 0);
    if ((_DWORD)result)
      return result;
    v4 = v6 + 16;
  }
  else
  {
    *a3 = *a2;
    v4 = (uint64_t)a2 + *((unsigned __int16 *)a2 + 3) + 8;
  }
  result = 0;
  a3[1] = v4;
  return result;
}

uint64_t mdb_cursor_next(uint64_t a1, _QWORD *a2, _QWORD *a3, int a4)
{
  int v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v8 = *(_DWORD *)(a1 + 68);
  if (a4 == 9 && (v8 & 8) != 0)
    return 4294936498;
  if ((v8 & 1) == 0)
    return mdb_cursor_first(a1, a2, a3);
  v10 = *(unsigned __int16 *)(a1 + 66);
  v11 = *(_QWORD *)(a1 + 8 * v10 + 72);
  if ((v8 & 2) != 0)
  {
    if (((*(unsigned __int16 *)(v11 + 12) - 16) >> 1) - 1 <= *(unsigned __int16 *)(a1 + 2 * v10 + 328))
      return 4294936498;
    *(_DWORD *)(a1 + 68) = v8 ^ 2;
  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 40) + 4) & 4) != 0)
  {
    v12 = v11 + *(unsigned __int16 *)(v11 + 2 * *(unsigned __int16 *)(a1 + 2 * v10 + 328) + 16);
    if ((*(_WORD *)(v12 + 4) & 4) == 0)
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 16) + 68) &= 0xFFFFFFFC;
      if (a4 != 9)
        goto LABEL_17;
      return 4294936498;
    }
    if ((a4 & 0xFFFFFFFE) == 8)
    {
      result = mdb_cursor_next(*(_QWORD *)(a1 + 16), a3, 0, 8);
      if (a4 != 8 || (_DWORD)result != -30798)
      {
        if (a2 && !(_DWORD)result)
        {
          v17 = *(unsigned __int16 *)(v12 + 6);
          v18 = v12 + 8;
          goto LABEL_36;
        }
        return result;
      }
    }
  }
LABEL_17:
  v13 = *(_DWORD *)(a1 + 68);
  if ((v13 & 8) != 0)
  {
    *(_DWORD *)(a1 + 68) = v13 ^ 8;
  }
  else
  {
    v14 = a1 + 2 * *(unsigned __int16 *)(a1 + 66);
    v15 = *(unsigned __int16 *)(v14 + 328) + 1;
    if (v15 >= (*(unsigned __int16 *)(v11 + 12) - 16) >> 1)
    {
      result = mdb_cursor_sibling(a1, 1);
      if ((_DWORD)result)
      {
        *(_DWORD *)(a1 + 68) |= 2u;
        return result;
      }
      v11 = *(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    }
    else
    {
      *(_WORD *)(v14 + 328) = v15;
    }
  }
  if ((*(_WORD *)(v11 + 10) & 0x20) != 0)
  {
    result = 0;
    v17 = **(unsigned int **)(a1 + 40);
    v18 = v11
        + *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) * (unint64_t)v17
        + 16;
LABEL_36:
    *a2 = v17;
    a2[1] = v18;
    return result;
  }
  v16 = v11
      + *(unsigned __int16 *)(v11 + 2 * *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) + 16);
  if ((*(_WORD *)(v16 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v11+ *(unsigned __int16 *)(v11 + 2 * *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) + 16));
    result = mdb_cursor_first(*(_QWORD *)(a1 + 16), a3, 0);
    if ((_DWORD)result)
      return result;
  }
  else if (a3)
  {
    result = mdb_node_read(a1, (unsigned int *)(v11+ *(unsigned __int16 *)(v11+ 2* *(unsigned __int16 *)(a1+ 2 * *(unsigned __int16 *)(a1 + 66)+ 328)+ 16)), a3);
    if ((_DWORD)result)
      return result;
  }
  result = 0;
  if (a2)
  {
    v17 = *(unsigned __int16 *)(v16 + 6);
    v18 = v16 + 8;
    goto LABEL_36;
  }
  return result;
}

uint64_t mdb_cursor_last(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  int v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
    *(_DWORD *)(v6 + 68) &= 0xFFFFFFFC;
  v7 = *(_DWORD *)(a1 + 68);
  if ((v7 & 1) != 0 && !*(_WORD *)(a1 + 66))
  {
    v9 = 0;
  }
  else
  {
    result = mdb_page_search(a1, 0, 8);
    if ((_DWORD)result)
      return result;
    v9 = *(unsigned __int16 *)(a1 + 66);
    v7 = *(_DWORD *)(a1 + 68);
  }
  v10 = *(_QWORD *)(a1 + 8 * v9 + 72);
  v11 = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
  *(_WORD *)(a1 + 2 * v9 + 328) = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
  *(_DWORD *)(a1 + 68) = v7 | 3;
  if ((*(_BYTE *)(v10 + 10) & 0x20) != 0)
  {
    if (a2)
    {
      v13 = **(unsigned int **)(a1 + 40);
      *a2 = v13;
      v14 = v10 + v13 * (unint64_t)(unsigned __int16)v11 + 16;
LABEL_18:
      result = 0;
      a2[1] = v14;
      return result;
    }
    return 0;
  }
  v12 = v10 + *(unsigned __int16 *)(v10 + 2 * (unsigned __int16)v11 + 16);
  if ((*(_WORD *)(v12 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v12);
    result = mdb_cursor_last(*(_QWORD *)(a1 + 16), a3, 0);
    if ((_DWORD)result)
      return result;
LABEL_16:
    if (a2)
    {
      *a2 = *(unsigned __int16 *)(v12 + 6);
      v14 = v12 + 8;
      goto LABEL_18;
    }
    return 0;
  }
  if (!a3)
    goto LABEL_16;
  result = mdb_node_read(a1, (unsigned int *)v12, a3);
  if (!(_DWORD)result)
    goto LABEL_16;
  return result;
}

uint64_t mdb_cursor_sibling(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t result;
  int v4;
  unsigned __int16 v6;
  uint64_t v7;
  _WORD *v8;
  int v9;
  unsigned int *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v2 = *(unsigned __int16 *)(a1 + 64);
  if (v2 < 2)
    return 4294936498;
  v4 = a2;
  *(_WORD *)(a1 + 64) = v2 - 1;
  v6 = *(_WORD *)(a1 + 66) - 1;
  *(_WORD *)(a1 + 66) = v6;
  v7 = v6;
  v8 = (_WORD *)(a1 + 2 * v6 + 328);
  v9 = (unsigned __int16)*v8;
  if ((_DWORD)a2)
  {
    if (++v9 >= (*(unsigned __int16 *)(*(_QWORD *)(a1 + 8 * v7 + 72) + 12) - 16) >> 1)
      goto LABEL_9;
LABEL_8:
    *v8 = v9;
    goto LABEL_12;
  }
  if (*v8)
  {
    LOWORD(v9) = v9 - 1;
    goto LABEL_8;
  }
LABEL_9:
  result = mdb_cursor_sibling(a1, a2);
  v7 = *(unsigned __int16 *)(a1 + 66);
  if ((_DWORD)result)
  {
    *(_WORD *)(a1 + 66) = v7 + 1;
    ++*(_WORD *)(a1 + 64);
    return result;
  }
  LOWORD(v9) = *(_WORD *)(a1 + 2 * v7 + 328);
LABEL_12:
  v13 = 0;
  v10 = (unsigned int *)(*(_QWORD *)(a1 + 8 * v7 + 72)
                       + *(unsigned __int16 *)(*(_QWORD *)(a1 + 8 * v7 + 72) + 2 * (unsigned __int16)v9 + 16));
  result = mdb_page_get(a1, *v10 | ((unint64_t)*((unsigned __int16 *)v10 + 2) << 32), &v13, 0);
  if ((_DWORD)result)
  {
    *(_DWORD *)(a1 + 68) &= 0xFFFFFFFC;
  }
  else
  {
    v11 = v13;
    v12 = *(unsigned __int16 *)(a1 + 64);
    if (v12 < 0x20)
    {
      *(_WORD *)(a1 + 64) = v12 + 1;
      *(_WORD *)(a1 + 66) = v12;
      *(_QWORD *)(a1 + 8 * v12 + 72) = v11;
      *(_WORD *)(a1 + 2 * v12 + 328) = 0;
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 24) + 124) |= 2u;
    }
    result = 0;
    if (!v4)
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = ((*(unsigned __int16 *)(v11 + 12)
                                                                    + 131056) >> 1)
                                                                  - 1;
  }
  return result;
}

uint64_t mdb_cursor_prev(uint64_t a1, _QWORD *a2, _QWORD *a3, int a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int16 v14;
  _WORD *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if ((*(_BYTE *)(a1 + 68) & 1) != 0)
  {
    v9 = *(unsigned __int16 *)(a1 + 66);
  }
  else
  {
    result = mdb_cursor_last(a1, a2, a3);
    if ((_DWORD)result)
      return result;
    v9 = *(unsigned __int16 *)(a1 + 66);
    ++*(_WORD *)(a1 + 2 * v9 + 328);
  }
  v10 = *(_QWORD *)(a1 + 8 * v9 + 72);
  if ((*(_WORD *)(*(_QWORD *)(a1 + 40) + 4) & 4) != 0)
  {
    v11 = *(unsigned __int16 *)(a1 + 2 * v9 + 328);
    if (v11 < (*(unsigned __int16 *)(v10 + 12) - 16) >> 1)
    {
      v12 = v10 + *(unsigned __int16 *)(v10 + 2 * v11 + 16);
      if ((*(_WORD *)(v12 + 4) & 4) != 0)
      {
        if ((a4 & 0xFFFFFFFE) == 0xC)
        {
          result = mdb_cursor_prev(*(_QWORD *)(a1 + 16), a3, 0, 12);
          if (a4 != 12 || (_DWORD)result != -30798)
          {
            if (!(_DWORD)result)
            {
              if (a2)
              {
                *a2 = *(unsigned __int16 *)(v12 + 6);
                a2[1] = v12 + 8;
              }
              result = 0;
              *(_DWORD *)(a1 + 68) &= ~2u;
            }
            return result;
          }
          v9 = *(unsigned __int16 *)(a1 + 66);
        }
      }
      else
      {
        *(_DWORD *)(*(_QWORD *)(a1 + 16) + 68) &= 0xFFFFFFFC;
        if (a4 == 13)
          return 4294936498;
      }
    }
  }
  *(_DWORD *)(a1 + 68) &= 0xFFFFFFF5;
  v13 = a1 + 2 * v9;
  v14 = *(_WORD *)(v13 + 328);
  if (v14)
  {
    v15 = (_WORD *)(v13 + 328);
    LOWORD(v13) = v14 - 1;
    *v15 = v14 - 1;
  }
  else
  {
    result = mdb_cursor_sibling(a1, 0);
    if ((_DWORD)result)
      return result;
    v18 = *(unsigned __int16 *)(a1 + 66);
    v10 = *(_QWORD *)(a1 + 8 * v18 + 72);
    LODWORD(v13) = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
    *(_WORD *)(a1 + 2 * v18 + 328) = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
  }
  v16 = *(_WORD *)(v10 + 10);
  if ((v16 & 2) == 0)
    return 4294936500;
  if ((v16 & 0x20) != 0)
  {
    result = 0;
    v19 = **(unsigned int **)(a1 + 40);
    *a2 = v19;
    a2[1] = v10 + (unsigned __int16)v13 * (unint64_t)v19 + 16;
    return result;
  }
  v17 = v10 + *(unsigned __int16 *)(v10 + 2 * (unsigned __int16)v13 + 16);
  if ((*(_WORD *)(v17 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v17);
    result = mdb_cursor_last(*(_QWORD *)(a1 + 16), a3, 0);
    if ((_DWORD)result)
      return result;
    goto LABEL_27;
  }
  if (!a3 || (result = mdb_node_read(a1, (unsigned int *)v17, a3), !(_DWORD)result))
  {
LABEL_27:
    result = 0;
    if (a2)
    {
      *a2 = *(unsigned __int16 *)(v17 + 6);
      a2[1] = v17 + 8;
    }
  }
  return result;
}

uint64_t mdb_cursor_first(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  int v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(_QWORD *)(a1 + 16);
  if (v6)
    *(_DWORD *)(v6 + 68) &= 0xFFFFFFFC;
  v7 = *(_DWORD *)(a1 + 68);
  if ((v7 & 1) != 0 && !*(_WORD *)(a1 + 66))
  {
    v9 = 0;
  }
  else
  {
    result = mdb_page_search(a1, 0, 4);
    if ((_DWORD)result)
      return result;
    v9 = *(unsigned __int16 *)(a1 + 66);
    v7 = *(_DWORD *)(a1 + 68);
  }
  v10 = *(_QWORD *)(a1 + 8 * v9 + 72);
  v11 = v10 + 16;
  v12 = *(unsigned __int16 *)(v10 + 16);
  *(_DWORD *)(a1 + 68) = v7 & 0xFFFFFFFC | 1;
  *(_WORD *)(a1 + 2 * v9 + 328) = 0;
  if ((*(_BYTE *)(v10 + 10) & 0x20) != 0)
  {
    if (a2)
    {
      *a2 = **(unsigned int **)(a1 + 40);
LABEL_18:
      result = 0;
      a2[1] = v11;
      return result;
    }
    return 0;
  }
  v13 = v10 + v12;
  if ((*(_WORD *)(v10 + v12 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v10 + v12);
    result = mdb_cursor_first(*(_QWORD *)(a1 + 16), a3, 0);
    if ((_DWORD)result)
      return result;
LABEL_16:
    if (a2)
    {
      *a2 = *(unsigned __int16 *)(v13 + 6);
      v11 = v13 + 8;
      goto LABEL_18;
    }
    return 0;
  }
  if (!a3)
    goto LABEL_16;
  result = mdb_node_read(a1, (unsigned int *)(v10 + v12), a3);
  if (!(_DWORD)result)
    goto LABEL_16;
  return result;
}

uint64_t mdb_page_spill(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v4;
  int v5;
  unint64_t v6;
  uint64_t result;
  _DWORD *v8;
  _DWORD *v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  int v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  unsigned int *v24;
  unsigned int v25;
  _QWORD *v26;
  int v27;

  if ((*(_BYTE *)(a1 + 68) & 4) != 0)
    return 0;
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(unsigned __int16 *)(*(_QWORD *)(a1 + 40) + 6);
  if (*(_DWORD *)(a1 + 32) >= 2u)
    v5 += *(unsigned __int16 *)(*(_QWORD *)(v4 + 88) + 54);
  if (a2)
  {
    v6 = *(unsigned int *)(*(_QWORD *)(v4 + 32) + 16);
    v5 += (*a2 + *a3 + v6 + 8) / v6;
  }
  if (*(_DWORD *)(v4 + 128) > (2 * v5))
    return 0;
  v8 = *(_DWORD **)(v4 + 72);
  v9 = *(_DWORD **)(v4 + 64);
  if (v9)
  {
    v10 = *v9;
    if (*v9)
    {
      v11 = 0;
      if ((v10 + 1) > 2)
        v12 = (v10 + 1);
      else
        v12 = 2;
      v13 = (uint64_t *)(v9 + 2);
      v14 = v12 - 1;
      do
      {
        v16 = *v13++;
        v15 = v16;
        if ((v16 & 1) == 0)
          *(_QWORD *)&v9[2 * ++v11] = v15;
        --v14;
      }
      while (v14);
    }
    else
    {
      v11 = 0;
    }
    *(_QWORD *)v9 = v11;
  }
  else
  {
    v17 = mdb_midl_alloc(0x1FFFF);
    *(_QWORD *)(v4 + 64) = v17;
    if (!v17)
      return 12;
  }
  result = mdb_pages_xkeep(a1, 16, 1);
  if (!(_DWORD)result)
  {
    v18 = *v8;
    if (*v8)
    {
      if ((2 * v5) < 0x4000)
        v19 = 0x3FFF;
      else
        v19 = 2 * v5;
      do
      {
        v20 = &v8[4 * v18];
        v21 = v20[1];
        if ((*(_WORD *)(v21 + 10) & 0xC000) == 0)
        {
          v22 = 2 * *v20;
          v23 = *(_QWORD **)v4;
          if (*(_QWORD *)v4)
          {
            while (1)
            {
              v24 = (unsigned int *)v23[8];
              if (v24)
              {
                v25 = mdb_midl_search(v24, v22);
                v26 = (_QWORD *)v23[8];
                if (*v26 >= (unint64_t)v25 && v26[v25] == v22)
                  break;
              }
              v23 = (_QWORD *)*v23;
              if (!v23)
                goto LABEL_33;
            }
            *(_WORD *)(v21 + 10) |= 0x8000u;
          }
          else
          {
LABEL_33:
            result = mdb_midl_append((unint64_t **)(v4 + 64), v22);
            if ((_DWORD)result)
              goto LABEL_41;
            --v19;
          }
        }
        --v18;
      }
      while ((_DWORD)v18 && v19);
    }
    mdb_midl_sort(*(int **)(v4 + 64));
    result = mdb_page_flush(v4, v18);
    if (!(_DWORD)result)
      result = mdb_pages_xkeep(a1, 32784, v18);
  }
LABEL_41:
  if ((_DWORD)result)
    v27 = 2;
  else
    v27 = 8;
  *(_DWORD *)(v4 + 124) |= v27;
  return result;
}

uint64_t mdb_page_new(uint64_t a1, __int16 a2, signed int a3, char **a4)
{
  uint64_t result;
  char *v9;
  char *v10;

  v10 = 0;
  result = mdb_page_alloc(a1, a3, &v10);
  if (!(_DWORD)result)
  {
    v9 = v10;
    *((_WORD *)v10 + 5) = a2 | 0x10;
    *((_WORD *)v9 + 6) = 16;
    *((_WORD *)v9 + 7) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 32) + 16);
    if ((a2 & 1) != 0)
    {
      ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    }
    else if ((a2 & 2) != 0)
    {
      ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
    }
    else if ((a2 & 4) != 0)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) += a3;
      *((_DWORD *)v9 + 3) = a3;
    }
    *a4 = v9;
  }
  return result;
}

uint64_t mdb_cursor_touch(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  unsigned int v4;
  unsigned __int16 v5;
  uint64_t v6;
  _OWORD v7[31];
  _OWORD v8[24];
  uint64_t v9;

  v2 = *(unsigned int *)(a1 + 32);
  if (v2 >= 2 && (**(_BYTE **)(a1 + 56) & 0x21) == 0)
  {
    v9 = 0;
    memset(v8, 0, sizeof(v8));
    memset(v7, 0, sizeof(v7));
    v6 = *(_QWORD *)(a1 + 24);
    if (*(_DWORD *)(*(_QWORD *)(v6 + 96) + 4 * v2) != *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 152) + 4 * v2))
      return 4294936516;
    mdb_cursor_init((uint64_t)v8, v6, 1u, (uint64_t)v7);
    result = mdb_page_search((uint64_t)v8, *(_QWORD **)(a1 + 48), 1);
    if ((_DWORD)result)
      return result;
    **(_BYTE **)(a1 + 56) |= 1u;
  }
  *(_WORD *)(a1 + 66) = 0;
  if (!*(_WORD *)(a1 + 64))
    return 0;
  do
  {
    result = mdb_page_touch(a1);
    v4 = *(unsigned __int16 *)(a1 + 64);
    if ((_DWORD)result)
      break;
    v5 = *(_WORD *)(a1 + 66) + 1;
    *(_WORD *)(a1 + 66) = v5;
  }
  while (v4 > v5);
  *(_WORD *)(a1 + 66) = v4 - 1;
  return result;
}

uint64_t mdb_update_key(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned __int16 *v4;
  unsigned __int16 *v5;
  uint64_t v6;
  unsigned __int16 *v7;
  unsigned int v8;
  unsigned __int16 *v9;
  size_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  size_t v17;
  uint64_t v19;
  _WORD *v20;
  unsigned int v21;

  v3 = *(unsigned __int16 *)(a1 + 66);
  v4 = *(unsigned __int16 **)(a1 + 8 * v3 + 72);
  v5 = &v4[*(unsigned __int16 *)(a1 + 2 * v3 + 328)];
  v8 = v5[8];
  v7 = v5 + 8;
  v6 = v8;
  v9 = (unsigned __int16 *)((char *)v4 + v8);
  v10 = *(_QWORD *)a2;
  v11 = (*(_QWORD *)a2 + 1) & 0xFFFFFFFE;
  v12 = v9[3];
  v13 = (v12 + 1) & 0x1FFFE;
  v14 = v11 - v13;
  if (v11 != v13)
  {
    if (v14 <= 0)
    {
      v15 = v4[6];
    }
    else
    {
      v15 = v4[6];
      if (v14 > (unsigned __int16)(v4[7] - v15))
      {
        v17 = *(unsigned int *)v9 | ((unint64_t)v9[2] << 32);
        mdb_node_del((_QWORD *)a1, 0);
        return mdb_page_split(a1, a2, 0, v17, 0x40000);
      }
    }
    v19 = (unsigned __int16)((v15 + 131056) >> 1);
    if ((unsigned __int16)((v15 + 131056) >> 1))
    {
      v20 = v4 + 8;
      do
      {
        v21 = (unsigned __int16)*v20;
        if (v21 <= v6)
          *v20 = v21 - v14;
        ++v20;
        --v19;
      }
      while (v19);
    }
    memmove((char *)v4 + v4[7] - v14, (char *)v4 + v4[7], v6 - v4[7] + 8);
    v4[7] -= v14;
    v9 = (unsigned __int16 *)((char *)v4 + *v7);
    v12 = v9[3];
    v10 = *(_QWORD *)a2;
  }
  if (v10 != v12)
    v9[3] = v10;
  if (v10)
    memcpy(v9 + 4, *(const void **)(a2 + 8), v10);
  return 0;
}

uint64_t mdb_page_alloc(uint64_t a1, signed int a2, char **a3)
{
  signed int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t **v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  unint64_t oldest;
  int v13;
  char v14;
  int v15;
  uint64_t **v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  BOOL v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t *v24;
  char *v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t *v29;
  unsigned int v30;
  void (*v31)(_QWORD, uint64_t *);
  int v33;
  int v35;
  uint64_t v36;
  int *v37;
  _OWORD v38[24];
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(v4 + 32);
  v7 = (uint64_t **)(v5 + 176);
  v6 = *(uint64_t **)(v5 + 176);
  if (v6)
    v8 = *(_DWORD *)v6;
  else
    v8 = 0;
  v40 = 0;
  v39 = 0;
  memset(v38, 0, sizeof(v38));
  v9 = (a2 - 1);
  if (a2 == 1 && (v10 = *(_QWORD *)(v4 + 48)) != 0)
  {
    result = 0;
    *(_QWORD *)(v4 + 48) = *(_QWORD *)(v10 + 48);
    --*(_DWORD *)(v4 + 56);
    *a3 = (char *)v10;
  }
  else
  {
    *a3 = 0;
    if (*(_DWORD *)(v4 + 128))
    {
      oldest = 0;
      v13 = 0;
      v35 = 0;
      v14 = 1;
      v15 = 1 - a2;
      v33 = 60 * a2;
      while (1)
      {
        v41 = 0;
        v42 = 0;
        v36 = 0;
        v37 = 0;
        if (v8 > v9)
        {
          v16 = v7;
          v17 = v8;
          v18 = v8;
          while (1)
          {
            v19 = v6[v18];
            if (v6[v15 + v18] == v19 + v9)
              goto LABEL_41;
            if (--v18 <= v9)
            {
              v3 = a2;
              v20 = v33-- < 1;
              v8 = v17;
              if (v20)
                goto LABEL_39;
              v7 = v16;
              break;
            }
          }
        }
        if ((v14 & 1) != 0)
        {
          v40 = *(_QWORD *)(v5 + 184);
          oldest = *(_QWORD *)(v5 + 168);
          mdb_cursor_init(v38, v4, 0, 0);
          v21 = v40;
          if (v40)
          {
            v42 = (char *)&v40;
            v41 = 8;
            v13 = 17;
          }
          else
          {
            v13 = 0;
          }
        }
        else
        {
          v21 = v40;
        }
        v22 = v21 + 1;
        v40 = v22;
        if (oldest <= v22)
        {
          if (!v35)
          {
            oldest = mdb_find_oldest(v4);
            *(_QWORD *)(v5 + 168) = oldest;
            v22 = v40;
          }
          if (oldest <= v22)
            goto LABEL_39;
          v35 = 1;
        }
        result = mdb_cursor_get((uint64_t)v38, &v41, 0, v13);
        if ((_DWORD)result)
          break;
        v23 = *(_QWORD *)v42;
        v40 = v23;
        if (oldest <= v23)
        {
          if (!v35)
          {
            oldest = mdb_find_oldest(v4);
            *(_QWORD *)(v5 + 168) = oldest;
            v23 = v40;
          }
          if (oldest <= v23)
            goto LABEL_39;
          v35 = 1;
        }
        result = mdb_node_read((uint64_t)v38, (unsigned int *)(*((_QWORD *)&v38[4] + WORD1(v38[4]) + 1)+ *(unsigned __int16 *)(*((_QWORD *)&v38[4] + WORD1(v38[4]) + 1)+ 2 * *((unsigned __int16 *)&v38[20] + WORD1(v38[4]) + 4)+ 16)), &v36);
        if ((_DWORD)result)
          goto LABEL_55;
        v24 = (uint64_t *)v37;
        if (v6)
        {
          result = mdb_midl_need((_DWORD **)v7, *v37);
          if ((_DWORD)result)
            goto LABEL_55;
          v6 = *v7;
        }
        else
        {
          v6 = mdb_midl_alloc(*v37);
          *v7 = v6;
          if (!v6)
            goto LABEL_43;
        }
        *(_QWORD *)(v5 + 184) = v40;
        mdb_midl_xmerge(v6, v24);
        v14 = 0;
        v8 = *(_DWORD *)v6;
        v13 = 8;
      }
      if ((_DWORD)result != -30798)
        goto LABEL_55;
LABEL_39:
      v17 = v8;
      v19 = *(_QWORD *)(v4 + 16);
      if ((unint64_t)(v19 + v3) >= *(_QWORD *)(v5 + 128))
      {
        result = 4294936504;
        goto LABEL_55;
      }
      v18 = 0;
LABEL_41:
      if ((*(_BYTE *)(v5 + 14) & 8) != 0)
      {
        v25 = (char *)(*(_QWORD *)(v5 + 56) + v19 * *(unsigned int *)(v5 + 16));
      }
      else
      {
        v25 = mdb_page_malloc(v4, a2);
        if (!v25)
        {
LABEL_43:
          result = 12;
          goto LABEL_55;
        }
      }
      if (v18)
      {
        v26 = v17 - a2;
        *v6 = v26;
        v27 = v18 - a2;
        if (v18 - a2 < v26)
        {
          v28 = v26 - v27;
          v29 = &v6[v27 + 1];
          v30 = v18 + 1;
          do
          {
            *v29++ = v6[v30++];
            --v28;
          }
          while (v28);
        }
      }
      else
      {
        *(_QWORD *)(v4 + 16) = v19 + a2;
      }
      *(_QWORD *)v25 = v19;
      v31 = (void (*)(_QWORD, uint64_t *))mdb_mid2l_append;
      if ((*(_DWORD *)(v4 + 124) & 0x80000) == 0)
        v31 = (void (*)(_QWORD, uint64_t *))mdb_mid2l_insert;
      v41 = v19;
      v42 = v25;
      v31(*(_QWORD *)(v4 + 72), &v41);
      result = 0;
      --*(_DWORD *)(v4 + 128);
      *a3 = v25;
    }
    else
    {
      result = 4294936508;
LABEL_55:
      *(_DWORD *)(v4 + 124) |= 2u;
    }
  }
  return result;
}

_QWORD *mdb_node_del(_QWORD *result, int a2)
{
  uint64_t v2;
  _WORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __int16 v7;
  uint64_t v8;
  char *v9;
  int v10;
  int v11;
  __int16 v12;
  int v13;
  char *v14;
  _WORD *v15;
  unsigned int v16;
  __int16 v17;
  __int16 v18;
  uint64_t v19;
  unsigned __int16 v20;
  unsigned __int16 *v21;
  __int16 v22;
  _WORD *v23;
  _WORD *v24;

  v2 = *((unsigned __int16 *)result + 33);
  v3 = (_WORD *)result[v2 + 9];
  v4 = *((unsigned __int16 *)result + v2 + 164);
  v5 = (unsigned __int16)v3[6];
  v6 = v5 + 131056;
  v7 = v3[5];
  if ((v7 & 0x20) != 0)
  {
    v12 = a2;
    v13 = ~(_DWORD)v4 + (unsigned __int16)(v6 >> 1);
    if (v13)
    {
      v14 = (char *)v3 + (int)v4 * (uint64_t)a2 + 16;
      result = memmove(v14, &v14[a2], v13 * a2);
      LOWORD(v5) = v3[6];
    }
    v17 = v3[7];
    v15 = v3 + 7;
    LOWORD(v16) = v17;
    *(v15 - 1) = v5 - 2;
    v18 = v12 - 2;
  }
  else
  {
    v8 = (unsigned __int16)v3[v4 + 8];
    v9 = (char *)v3 + v8;
    v10 = *(unsigned __int16 *)((char *)v3 + v8 + 6);
    v11 = v10 + 8;
    if ((v7 & 2) != 0)
    {
      if ((*((_WORD *)v9 + 2) & 1) != 0)
        v11 = v10 + 16;
      else
        v11 += *(_DWORD *)v9;
    }
    v16 = (v11 + 1) & 0xFFFFFFFE;
    v19 = (unsigned __int16)(v6 >> 1);
    if ((_DWORD)v19)
    {
      v20 = 0;
      v21 = v3 + 8;
      do
      {
        if (v4)
        {
          v22 = *v21;
          v23 = &v3[v20];
          v23[8] = *v21;
          v24 = v23 + 8;
          if (*v21 < v8)
            *v24 = v22 + v16;
          ++v20;
        }
        ++v21;
        --v4;
        --v19;
      }
      while (v19);
    }
    result = memmove((char *)v3 + (unsigned __int16)v3[7] + v16, (char *)v3 + (unsigned __int16)v3[7], v8 - (unsigned __int16)v3[7]);
    v3[6] -= 2;
    v18 = v3[7];
    v15 = v3 + 7;
  }
  *v15 = v18 + v16;
  return result;
}

uint64_t mdb_page_get(uint64_t a1, unint64_t a2, unint64_t *a3, int *a4)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  _QWORD *v10;
  unsigned int *v11;
  unsigned int *v12;
  unsigned int v13;
  _QWORD *v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t result;

  v7 = *(_QWORD *)(a1 + 24);
  if ((*(_BYTE *)(a1 + 70) & 0xA) != 0)
  {
LABEL_10:
    if (*(_QWORD *)(v7 + 16) <= a2)
    {
      *(_DWORD *)(v7 + 124) |= 2u;
      return 4294936499;
    }
    v9 = 0;
  }
  else
  {
    v8 = 2 * a2;
    v9 = 1;
    v10 = *(_QWORD **)(a1 + 24);
    while (1)
    {
      v11 = (unsigned int *)v10[8];
      v12 = (unsigned int *)v10[9];
      if (v11)
      {
        v13 = mdb_midl_search(v11, 2 * a2);
        v14 = (_QWORD *)v10[8];
        if (*v14 >= (unint64_t)v13 && v14[v13] == v8)
          break;
      }
      if (*(_QWORD *)v12)
      {
        v15 = mdb_mid2l_search(v12, a2);
        if (*(_QWORD *)v12 >= (unint64_t)v15 && *(_QWORD *)&v12[4 * v15] == a2)
        {
          v16 = *(_QWORD *)&v12[4 * v15 + 2];
          goto LABEL_13;
        }
      }
      ++v9;
      v10 = (_QWORD *)*v10;
      if (!v10)
        goto LABEL_10;
    }
  }
  v16 = *(_QWORD *)(*(_QWORD *)(v7 + 32) + 56) + *(unsigned int *)(*(_QWORD *)(v7 + 32) + 16) * a2;
LABEL_13:
  *a3 = v16;
  result = 0;
  if (a4)
    *a4 = v9;
  return result;
}

uint64_t mdb_page_unspill(uint64_t a1, uint64_t a2, char **a3)
{
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  unsigned int *v9;
  unsigned int v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t result;
  signed int v14;
  char *v15;
  char *v16;
  int v17;
  _QWORD *v18;
  void *v19;
  _QWORD v20[2];

  v6 = *(_QWORD *)(a1 + 32);
  v7 = 2 * *(_QWORD *)a2;
  v8 = (_QWORD *)a1;
  while (1)
  {
    v9 = (unsigned int *)v8[8];
    if (v9)
    {
      v10 = mdb_midl_search(v9, v7);
      v11 = (_QWORD *)v8[8];
      if (*v11 >= (unint64_t)v10)
      {
        v12 = v10;
        if (v11[v10] == v7)
          break;
      }
    }
    v8 = (_QWORD *)*v8;
    if (!v8)
      return 0;
  }
  if (!*(_DWORD *)(a1 + 128))
    return 4294936508;
  if ((*(_WORD *)(a2 + 10) & 4) != 0)
    v14 = *(_DWORD *)(a2 + 12);
  else
    v14 = 1;
  if ((*(_BYTE *)(v6 + 14) & 8) != 0)
  {
    v16 = (char *)a2;
  }
  else
  {
    v15 = mdb_page_malloc(a1, v14);
    if (!v15)
      return 12;
    v16 = v15;
    v17 = *(_DWORD *)(v6 + 16);
    if (v14 < 2)
      mdb_page_copy(v15, (_WORD *)a2, v17);
    else
      memcpy(v15, (const void *)a2, (v17 * v14));
  }
  if (v8 == (_QWORD *)a1)
  {
    v18 = *(_QWORD **)(a1 + 64);
    if (*v18 == v12)
      *v18 = v12 - 1;
    else
      v18[v12] |= 1uLL;
  }
  if ((*(_DWORD *)(a1 + 124) & 0x80000) != 0)
    v19 = mdb_mid2l_append;
  else
    v19 = mdb_mid2l_insert;
  v20[0] = *(_QWORD *)v16;
  v20[1] = v16;
  ((void (*)(_QWORD, _QWORD *))v19)(*(_QWORD *)(a1 + 72), v20);
  result = 0;
  --*(_DWORD *)(a1 + 128);
  *((_WORD *)v16 + 5) |= 0x10u;
  *a3 = v16;
  return result;
}

char *mdb_page_malloc(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  size_t v4;
  char *v5;
  uint64_t v6;
  size_t v7;
  char *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(unsigned int *)(v3 + 16);
  if (a2 == 1)
  {
    v5 = *(char **)(v3 + 192);
    if (v5)
    {
      *(_QWORD *)(v3 + 192) = *(_QWORD *)v5;
      return v5;
    }
    v7 = v4 - 16;
    v6 = 16;
  }
  else
  {
    v6 = v4 * (unint64_t)a2 - v4;
    v7 = *(unsigned int *)(v3 + 16);
    v4 = v4 * (unint64_t)a2;
  }
  v8 = (char *)malloc_type_malloc(v4, 0x19F3F053uLL);
  v5 = v8;
  if (v8)
  {
    if ((*(_BYTE *)(v3 + 15) & 1) == 0)
    {
      bzero(&v8[v6], v7);
      *((_WORD *)v5 + 4) = 0;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 124) |= 2u;
  }
  return v5;
}

uint64_t mdb_ovpage_free(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int **v7;
  uint64_t result;
  _QWORD *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int *v23;
  unsigned int v24;
  unsigned int v25;
  unint64_t v26;
  unsigned int *v27;
  uint64_t v28;
  uint64_t *v29;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)a2;
  v5 = *(unsigned int *)(a2 + 12);
  v6 = *(_QWORD *)(v3 + 32);
  v7 = (unsigned int **)(v6 + 176);
  if (!*(_QWORD *)(v6 + 176) || *(_QWORD *)v3)
  {
LABEL_3:
    result = mdb_midl_append_range((uint64_t **)(v3 + 40), v4, v5);
    if ((_DWORD)result)
      return result;
    goto LABEL_4;
  }
  v10 = *(_QWORD **)(v3 + 64);
  if ((*(_WORD *)(a2 + 10) & 0x10) != 0)
  {
    v12 = 0;
  }
  else
  {
    if (!v10)
      goto LABEL_3;
    v11 = mdb_midl_search(*(unsigned int **)(v3 + 64), 2 * v4);
    if (*v10 < (unint64_t)v11)
      goto LABEL_3;
    v12 = v11;
    if (v10[v11] != 2 * v4)
      goto LABEL_3;
  }
  result = mdb_midl_need(v7, v5);
  if (!(_DWORD)result)
  {
    if ((*(_WORD *)(a2 + 10) & 0x10) == 0)
    {
      if (*v10 == v12)
        *v10 = v12 - 1;
      else
        v10[v12] |= 1uLL;
LABEL_23:
      v23 = *v7;
      v24 = **v7;
      if (v24)
      {
        while (1)
        {
          v25 = v5 + v24;
          v26 = *(_QWORD *)&v23[2 * v24];
          if (v26 >= v4)
            break;
          *(_QWORD *)&v23[2 * v25] = v26;
          if (!--v24)
          {
            v25 = v5;
            break;
          }
        }
      }
      else
      {
        v25 = v5;
      }
      if (v25 > v24)
      {
        v27 = &v23[2 * v25];
        do
        {
          *(_QWORD *)v27 = v4;
          v27 -= 2;
          ++v4;
          --v25;
        }
        while (v24 < v25);
      }
      *(_QWORD *)v23 += v5;
LABEL_4:
      result = 0;
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) -= v5;
      return result;
    }
    v13 = *(uint64_t **)(v3 + 72);
    v14 = (*v13)--;
    v15 = &v13[2 * v14];
    v16 = v15[1];
    if (v16 == a2)
    {
LABEL_20:
      ++*(_DWORD *)(v3 + 128);
      if ((*(_BYTE *)(v6 + 14) & 8) == 0)
        mdb_dpage_free(v6, (_QWORD *)a2);
      goto LABEL_23;
    }
    v17 = v14;
    v18 = *v15;
    v19 = v17 + 1;
    v20 = &v13[2 * v17 - 1];
    while ((unint64_t)--v19 >= 2)
    {
      v21 = *(v20 - 1);
      v22 = *v20;
      *(v20 - 1) = v18;
      *v20 = v16;
      v20 -= 2;
      v16 = v22;
      v18 = v21;
      if (v22 == a2)
        goto LABEL_20;
    }
    v28 = *v13 + 1;
    *v13 = v28;
    v29 = &v13[2 * v28];
    *v29 = v18;
    v29[1] = v16;
    *(_DWORD *)(v3 + 124) |= 2u;
    return 4294936517;
  }
  return result;
}

uint64_t mdb_page_split(uint64_t a1, uint64_t a2, size_t *a3, size_t a4, int a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t result;
  int v17;
  int v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  size_t *v23;
  char *v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  _WORD *v34;
  _QWORD *v35;
  _WORD *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  char *v42;
  size_t v43;
  signed int v44;
  int v45;
  int v46;
  int v47;
  uint64_t v48;
  size_t v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  char *v55;
  void *v56;
  char *v57;
  int v58;
  char *v59;
  int v60;
  int v61;
  unsigned int v62;
  _BOOL4 v63;
  size_t *v64;
  unsigned int v65;
  int v66;
  uint64_t v67;
  __int16 *v68;
  uint64_t v69;
  char *v70;
  __int16 v71;
  char *v72;
  int v73;
  int v74;
  int v75;
  uint64_t v76;
  signed int v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  int v81;
  uint64_t v82;
  int v83;
  size_t v84;
  uint64_t v85;
  uint64_t v86;
  unsigned __int16 v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  __int128 *v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  size_t v99;
  const void **v100;
  unint64_t v101;
  uint64_t v102;
  _WORD *v103;
  size_t v104;
  int v105;
  size_t *v106;
  signed int v107;
  unsigned int *v108;
  __int16 v109;
  uint64_t v110;
  unsigned int *v111;
  char *v112;
  uint64_t v113;
  unsigned int v114;
  unsigned int v115;
  unsigned __int16 v116;
  uint64_t v117;
  __int16 *v118;
  _WORD *v119;
  __int16 v120;
  uint64_t v121;
  unsigned int v122;
  uint64_t v123;
  uint64_t v124;
  unsigned __int16 v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unsigned __int16 v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t *v134;
  unsigned int v135;
  unsigned int v136;
  int v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t *v141;
  _WORD *v142;
  _QWORD *v143;
  uint64_t v144;
  _WORD *v145;
  _QWORD *v146;
  __int16 v147;
  uint64_t v148;
  unsigned __int16 v150;
  uint64_t v151;
  uint64_t v152;
  unsigned int v153;
  uint64_t v154;
  unsigned int v155;
  unint64_t v156;
  uint64_t *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  char *v165;
  unsigned int v166;
  unsigned __int16 v167;
  unint64_t v168;
  unsigned int v169;
  size_t v170;
  unsigned int v171;
  signed int v172;
  size_t *v173;
  unsigned int v174;
  uint64_t v175;
  signed int v176;
  char *v177;
  uint64_t v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  uint64_t v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  _OWORD v208[20];
  uint64_t v209;
  char *v210;
  char *v211;
  uint64_t v212;
  char *v213;
  size_t v214;
  unsigned int *v215;
  _OWORD v216[2];

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 24) + 32);
  v216[0] = 0uLL;
  v214 = 0;
  v215 = 0;
  v212 = 0;
  v213 = 0;
  v210 = 0;
  v211 = 0;
  v209 = 0;
  memset(v208, 0, sizeof(v208));
  v206 = 0u;
  v207 = 0u;
  v204 = 0u;
  v205 = 0u;
  v11 = *(unsigned __int16 *)(a1 + 66);
  v12 = *(_QWORD *)(a1 + 8 * v11 + 72);
  v13 = (void *)(a1 + 328);
  v14 = *(unsigned __int16 *)(a1 + 328 + 2 * v11);
  v15 = *(unsigned __int16 *)(v12 + 12);
  result = mdb_page_new(a1, *(_WORD *)(v12 + 10), 1, &v211);
  if ((_DWORD)result)
    return result;
  v173 = a3;
  v177 = v211;
  v178 = a2;
  *((_WORD *)v211 + 4) = *(_WORD *)(v12 + 8);
  v17 = *(unsigned __int16 *)(a1 + 66);
  if (*(_WORD *)(a1 + 66))
  {
    v170 = a4;
    v18 = a5;
    v19 = v10;
    v175 = v14;
    v20 = 0;
    v21 = v17 - 1;
  }
  else
  {
    result = mdb_page_new(a1, 1, 1, &v210);
    if ((_DWORD)result)
      goto LABEL_177;
    v170 = a4;
    v31 = *(unsigned __int16 *)(a1 + 64);
    if (*(_WORD *)(a1 + 64))
    {
      v32 = v31 + 1;
      v33 = (_QWORD *)(a1 + 8 * v31 + 72);
      v34 = (_WORD *)(a1 + 2 * v31 + 328);
      v35 = v33;
      v36 = v34;
      do
      {
        v37 = *--v35;
        *v33 = v37;
        LOWORD(v37) = *--v36;
        *v34 = v37;
        --v32;
        v34 = v36;
        v33 = v35;
      }
      while (v32 > 1);
    }
    v38 = v210;
    *(_QWORD *)(a1 + 72) = v210;
    *(_WORD *)(a1 + 328) = 0;
    v39 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(v39 + 40) = *(_QWORD *)v38;
    v20 = *(unsigned __int16 *)(v39 + 6);
    *(_WORD *)(v39 + 6) = v20 + 1;
    result = mdb_node_add(a1, 0, 0, 0, *(_QWORD *)v12, 0);
    if ((_DWORD)result)
    {
      *(_QWORD *)(a1 + 72) = *(_QWORD *)(a1 + 80);
      *(_WORD *)(a1 + 328) = *(_WORD *)(a1 + 330);
      v40 = *(_QWORD *)(a1 + 40);
      *(_QWORD *)(v40 + 40) = *(_QWORD *)v12;
      --*(_WORD *)(v40 + 6);
      goto LABEL_177;
    }
    v18 = a5;
    v19 = v10;
    v175 = v14;
    v21 = 0;
    ++*(_WORD *)(a1 + 64);
    LOWORD(v17) = *(_WORD *)(a1 + 66) + 1;
    *(_WORD *)(a1 + 66) = v17;
  }
  mdb_cursor_copy(a1, (uint64_t)&v204);
  *(_QWORD *)&v205 = 0;
  v22 = WORD1(v208[0]);
  v23 = (size_t *)v177;
  *((_QWORD *)v208 + WORD1(v208[0]) + 1) = v177;
  v24 = (char *)&v204 + 2 * v21;
  *((_WORD *)v24 + 164) = *(_WORD *)(a1 + 2 * v21 + 328) + 1;
  v171 = v21;
  v169 = v20;
  if ((v18 & 0x20000) != 0)
  {
    v41 = v21;
    v174 = 0;
    v42 = 0;
    *((_WORD *)&v208[16] + v22 + 4) = 0;
    v216[0] = *(_OWORD *)v178;
    v43 = *(_QWORD *)&v216[0];
    v44 = v175;
    v172 = v175;
    v28 = v19;
    v45 = v18;
    goto LABEL_71;
  }
  v25 = v15 - 16;
  v26 = v25 >> 1;
  v27 = ((v25 >> 1) + 1) >> 1;
  v28 = v19;
  v174 = v25 >> 1;
  v165 = v24;
  if ((*((_WORD *)v177 + 5) & 0x20) == 0)
  {
    v29 = (v26 + 1) >> 1;
    if ((*(_WORD *)(v12 + 10) & 2) != 0)
    {
      v53 = *(_QWORD *)v178 + *v173 + 8;
      v54 = 8 - *v173;
      if (v53 <= *(unsigned int *)(v28 + 220))
        LODWORD(v54) = 0;
      LODWORD(v30) = (v53 + v54 + 3) & 0xFFFFFFFE;
    }
    else if (v178)
    {
      v30 = *(_QWORD *)v178 + 10;
    }
    else
    {
      LODWORD(v30) = 10;
    }
    v58 = *(_DWORD *)(v28 + 16);
    v59 = mdb_page_malloc(*(_QWORD *)(a1 + 24), 1u);
    if (v59)
    {
      v42 = v59;
      v60 = v58 - 16;
      v61 = (v30 + 1) & 0xFFFFFFFE;
      *(_QWORD *)v59 = *(_QWORD *)v12;
      *((_WORD *)v59 + 5) = *(_WORD *)(v12 + 10);
      *((_WORD *)v59 + 6) = 16;
      *((_WORD *)v59 + 7) = *(_DWORD *)(v28 + 16);
      if (v25 > 1)
      {
        v66 = 0;
        v62 = v25 >> 1;
        if (v174 <= 1)
          v67 = 1;
        else
          v67 = v174;
        v68 = (__int16 *)(v12 + 16);
        v44 = v175;
        v69 = v175;
        v65 = v29;
        do
        {
          if (!v69)
          {
            v70 = &v59[2 * v66++];
            *((_WORD *)v70 + 8) = 0;
          }
          v71 = *v68++;
          v72 = &v59[2 * v66++];
          *((_WORD *)v72 + 8) = v71;
          --v69;
          --v67;
        }
        while (v67);
        if (v60 >= 0)
          v73 = v58 - 16;
        else
          v73 = v58 - 1;
        v63 = v174 > v175;
        v41 = v171;
        v23 = (size_t *)v177;
        v64 = (size_t *)v178;
        if (v25 >= 0x40 && v61 <= v73 >> 4 && v174 > v175)
        {
          v45 = v18;
          goto LABEL_68;
        }
      }
      else
      {
        v44 = v175;
        v23 = (size_t *)v177;
        v62 = v25 >> 1;
        v63 = v174 > v175;
        v41 = v171;
        v64 = (size_t *)v178;
        v65 = v29;
      }
      if (v65 < v44 && v63)
      {
        v74 = v65 - 1;
        v75 = -1;
        v63 = 1;
        LODWORD(v76) = v62;
      }
      else
      {
        if (v63)
        {
          v63 = 0;
          LODWORD(v76) = 0;
          v74 = v65 + ((*(unsigned __int16 *)(v12 + 10) >> 1) & 1) + 1;
          v75 = 1;
          v45 = v18;
          goto LABEL_54;
        }
        LODWORD(v76) = 0;
        v75 = 1;
        v74 = v62;
      }
      v45 = v18;
      if ((_DWORD)v76 != v74)
      {
LABEL_54:
        v77 = 0;
        v78 = v75;
        v79 = v74 - v75;
        v80 = -(int)v76;
        v81 = -v74;
        v76 = v76;
        while (1)
        {
          if (v44 == v76)
          {
            v77 += v61;
          }
          else
          {
            v82 = v12 + *(unsigned __int16 *)&v42[2 * v76 + 16];
            v83 = v77 + *(unsigned __int16 *)(v82 + 6) + 10;
            if ((*(_WORD *)(v12 + 10) & 2) != 0)
            {
              if ((*(_WORD *)(v82 + 4) & 1) != 0)
                v83 += 8;
              else
                v83 += *(_DWORD *)v82;
            }
            v77 = (v83 + 1) & 0xFFFFFFFE;
          }
          if (v77 > v60 || v79 == v76)
            break;
          v76 += v78;
          v80 -= v78;
          if (v81 == v80)
            goto LABEL_67;
        }
        v65 = v63 - v80;
LABEL_67:
        v23 = (size_t *)v177;
      }
LABEL_68:
      v24 = v165;
      if (v65 == v44)
      {
        v43 = *v64;
        v84 = v64[1];
        *(_QWORD *)&v216[0] = *v64;
        *((_QWORD *)&v216[0] + 1) = v84;
        v172 = v44;
      }
      else
      {
        v172 = v65;
        v85 = v12 + *(unsigned __int16 *)&v42[2 * v65 + 16];
        v43 = *(unsigned __int16 *)(v85 + 6);
        *(_QWORD *)&v216[0] = v43;
        *((_QWORD *)&v216[0] + 1) = v85 + 8;
      }
      goto LABEL_71;
    }
    result = 12;
LABEL_177:
    *(_DWORD *)(*(_QWORD *)(a1 + 24) + 124) |= 2u;
    return result;
  }
  v46 = *(unsigned __int16 *)(a1 + 2 * (unsigned __int16)v17 + 328);
  v47 = v46 - v27;
  v43 = **(unsigned int **)(a1 + 40);
  v48 = v12 + 16 + v43 * v27;
  v49 = v43 * (v26 - v27);
  *(_WORD *)(v12 + 12) -= 2 * (v26 - v27);
  *((_WORD *)v177 + 6) += 2 * (v26 - v27);
  v50 = v43 * (v26 - v27) - 2 * (v26 - v27);
  *(_WORD *)(v12 + 14) += v50;
  *((_WORD *)v177 + 7) -= v50;
  *(_QWORD *)&v216[0] = v43;
  v51 = v48;
  if (v27 == (_DWORD)v175)
    v51 = *(_QWORD *)(v178 + 8);
  *((_QWORD *)&v216[0] + 1) = v51;
  v163 = v28;
  v172 = ((v25 >> 1) + 1) >> 1;
  if (v47 < 0)
  {
    v55 = (char *)(v12 + 16 + v43 * *(unsigned __int16 *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66)));
    memcpy(v177 + 16, (const void *)(v12 + 16 + v43 * v27), v49);
    *((_QWORD *)&v216[0] + 1) = v177 + 16;
    memmove(&v55[v43], v55, ((((v25 >> 1) + 1) >> 1) - *(unsigned __int16 *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66)))* v43);
    v56 = v55;
    v28 = v163;
    memcpy(v56, *(const void **)(v178 + 8), v43);
    v44 = v175;
    v23 = (size_t *)v177;
    v41 = v171;
    v42 = 0;
    *(_WORD *)(v12 + 12) += 2;
    *(_WORD *)(v12 + 14) = *(_WORD *)(v12 + 14) - v43 + 2;
    v45 = v18;
    v24 = v165;
  }
  else
  {
    v52 = (v47 * v43);
    if (v46 != v27)
    {
      memcpy(v177 + 16, (const void *)(v12 + 16 + v43 * v27), (v47 * v43));
      v23 = (size_t *)v177;
    }
    v57 = (char *)v23 + v52 + 16;
    memcpy(v57, *(const void **)(v178 + 8), v43);
    memcpy(&v57[v43], (const void *)(v48 + v52), (v49 - v52));
    v23 = (size_t *)v177;
    v42 = 0;
    *((_WORD *)v177 + 6) += 2;
    *((_WORD *)v177 + 7) = *((_WORD *)v177 + 7) - v43 + 2;
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v47;
    v28 = v163;
    v24 = v165;
    v45 = v18;
    v44 = v175;
    v41 = v171;
  }
LABEL_71:
  v86 = *((_QWORD *)v208 + v41 + 1);
  v87 = *(_WORD *)(v86 + 14) - *(_WORD *)(v86 + 12);
  v168 = v43 + 10;
  if (v43 + 10 <= v87)
  {
    v167 = *(_WORD *)(v86 + 14) - *(_WORD *)(v86 + 12);
    --WORD1(v208[0]);
    LODWORD(result) = mdb_node_add((uint64_t)&v204, *((unsigned __int16 *)v24 + 164), (const void **)v216, 0, *v23, 0);
    ++WORD1(v208[0]);
    v99 = v170;
    v100 = (const void **)v178;
    if (!(_DWORD)result)
      goto LABEL_91;
    goto LABEL_82;
  }
  v176 = v44;
  v88 = v28;
  v166 = *(unsigned __int16 *)(a1 + 64);
  --LOWORD(v208[0]);
  --WORD1(v208[0]);
  v203 = 0;
  v201 = 0u;
  v202 = 0u;
  v199 = 0u;
  v200 = 0u;
  v197 = 0u;
  v198 = 0u;
  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  v187 = 0u;
  v188 = 0u;
  v185 = 0u;
  v186 = 0u;
  v183 = 0u;
  v184 = 0u;
  v181 = 0u;
  v182 = 0u;
  v179 = 0u;
  v180 = 0u;
  v89 = *(_QWORD *)(*((_QWORD *)&v205 + 1) + 104);
  v90 = v206;
  v91 = &v204;
  if ((BYTE4(v208[0]) & 4) != 0)
  {
    DWORD1(v183) = 1;
    *(_QWORD *)&v180 = &v204;
    v91 = &v179;
  }
  *(_QWORD *)v91 = *(_QWORD *)(v89 + 8 * v206);
  *(_QWORD *)(v89 + 8 * v90) = v91;
  result = mdb_page_split(&v204, v216, 0, *v23, 0);
  *(_QWORD *)(v89 + 8 * v90) = *(_QWORD *)v91;
  v28 = v88;
  if ((_DWORD)result)
    goto LABEL_174;
  v167 = v87;
  if (*(unsigned __int16 *)(a1 + 64) <= v166)
    v92 = v171;
  else
    v92 = v171 + 1;
  v93 = *((_QWORD *)v208 + v92 + 1);
  v94 = a1 + 8 * v92;
  v97 = *(_QWORD *)(v94 + 72);
  v95 = (_QWORD *)(v94 + 72);
  v96 = v97;
  v171 = v92;
  if (v93 == v97)
  {
    v44 = v176;
    v99 = v170;
    v100 = (const void **)v178;
    goto LABEL_91;
  }
  v98 = a1 + 2 * v92;
  v99 = v170;
  v100 = (const void **)v178;
  if (*(unsigned __int16 *)(v98 + 328) < (*(unsigned __int16 *)(v96 + 12) - 16) >> 1)
  {
    v44 = v176;
    goto LABEL_91;
  }
  if ((int)v92 >= 1)
  {
    v101 = 0;
    v102 = a1 + 328;
    do
    {
      *(_QWORD *)(v102 + 8 * v101 - 256) = *((_QWORD *)v208 + v101 + 1);
      *(_WORD *)(v102 + 2 * v101) = *((_WORD *)&v208[16] + v101 + 4);
      ++v101;
    }
    while (v101 < v92);
  }
  v103 = (_WORD *)(v98 + 328);
  *v95 = v93;
  v44 = v176;
  if (*((_WORD *)&v208[16] + v92 + 4))
  {
    *v103 = *((_WORD *)&v208[16] + v92 + 4) - 1;
    goto LABEL_91;
  }
  *v103 = 0;
  LODWORD(result) = mdb_cursor_sibling(a1, 0);
  if ((_DWORD)result)
  {
LABEL_82:
    if ((_DWORD)result == -30798)
      result = 4294936517;
    else
      result = result;
    goto LABEL_174;
  }
LABEL_91:
  if ((v45 & 0x20000) != 0)
  {
    v123 = *(unsigned __int16 *)(a1 + 66);
    *(_QWORD *)(a1 + 8 * v123 + 72) = v177;
    *(_WORD *)(a1 + 2 * v123 + 328) = 0;
    result = mdb_node_add(a1, 0, v100, v173, v99, v45);
    v116 = v167;
    if ((_DWORD)result)
      goto LABEL_174;
    v115 = v169;
    v122 = v171;
    if (*(_WORD *)(a1 + 66))
    {
      memcpy(v13, (char *)&v208[16] + 8, 2 * *(unsigned __int16 *)(a1 + 66));
      v122 = v171;
    }
    goto LABEL_139;
  }
  if ((*(_WORD *)(v12 + 10) & 0x20) != 0)
  {
    v115 = v169;
    v122 = v171;
    v116 = v167;
    if (v172 <= v44)
    {
      *(_QWORD *)(a1 + 72 + 8 * *(unsigned __int16 *)(a1 + 66)) = v177;
      v124 = a1 + 2 * v171;
      v125 = *(_WORD *)(v124 + 328) + 1;
      *(_WORD *)(v124 + 328) = v125;
      v126 = *(_QWORD *)(a1 + 72 + 8 * v171);
      if (*((_QWORD *)v208 + v171 + 1) != v126
        && (*(unsigned __int16 *)(v126 + 12) - 16) >> 1 <= v125
        && (v171 & 0x80000000) == 0)
      {
        v127 = 0;
        do
        {
          *(_QWORD *)(a1 + 8 * v127 + 72) = *((_QWORD *)v208 + v127 + 1);
          *(_WORD *)(a1 + 2 * v127 + 328) = *((_WORD *)&v208[16] + v127 + 4);
          ++v127;
        }
        while (v171 + 1 != v127);
      }
    }
LABEL_139:
    v134 = *(uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
    if (!v134)
    {
LABEL_173:
      result = 0;
      goto LABEL_174;
    }
    v135 = *(unsigned __int16 *)(v12 + 12) - 16;
    v136 = v135 >> 1;
    v137 = *(_DWORD *)(a1 + 68);
    v138 = v211;
    v139 = 2 * v115 + 330;
    v140 = 8 * v115 + 80;
    while (1)
    {
      v141 = v134;
      if ((v137 & 4) != 0)
        v141 = (uint64_t *)v134[2];
      if (v141 == (uint64_t *)a1 || (*((_DWORD *)v134 + 17) & *((_DWORD *)v141 + 17) & 1) == 0)
        goto LABEL_172;
      if (!v115)
        break;
      if (v141[9] == v12)
      {
        v142 = (_WORD *)((char *)v141 + v139);
        v143 = (uint64_t *)((char *)v141 + v140);
        v144 = v115 + 1;
        v145 = (_WORD *)((char *)v141 + v139);
        v146 = (uint64_t *)((char *)v141 + v140);
        do
        {
          v147 = *--v145;
          *v142 = v147;
          v148 = *--v146;
          *v143 = v148;
          v143 = v146;
          v142 = v145;
        }
        while (v144-- > 1);
        *((_WORD *)v141 + 164) = v136 <= *((unsigned __int16 *)v141 + 164);
        v141[9] = *(_QWORD *)(a1 + 72);
        ++*((_WORD *)v141 + 32);
        v150 = *((_WORD *)v141 + 33) + 1;
        *((_WORD *)v141 + 33) = v150;
        goto LABEL_152;
      }
LABEL_172:
      v134 = (uint64_t *)*v134;
      if (!v134)
        goto LABEL_173;
    }
    v150 = *((_WORD *)v141 + 33);
LABEL_152:
    v151 = *(unsigned __int16 *)(a1 + 66);
    if (v151 <= v150 && v141[v151 + 9] == v12)
    {
      v154 = (uint64_t)v141 + 2 * v151;
      v155 = *(unsigned __int16 *)(v154 + 328);
      if ((v45 & 0x40000) == 0 && v155 >= v44)
      {
        *(_WORD *)(v154 + 328) = v155 + 1;
        v151 = *(unsigned __int16 *)(a1 + 66);
        v155 = *((unsigned __int16 *)v141 + v151 + 164);
      }
      if (v136 <= v155)
      {
        v141[v151 + 9] = (uint64_t)v138;
        *((_WORD *)v141 + v151 + 164) = v155 - (v135 >> 1);
        if (*(_WORD *)(a1 + 66))
        {
          v156 = 0;
          v157 = v141 + 41;
          do
          {
            *((_WORD *)v157 + v156) = *((_WORD *)&v208[16] + v156 + 4);
            v157[v156 - 32] = *((_QWORD *)v208 + v156 + 1);
            ++v156;
          }
          while (v156 < *(unsigned __int16 *)(a1 + 66));
        }
      }
    }
    else if (v168 <= v116 && (int)v122 <= v150 && v141[v122 + 9] == *(_QWORD *)(a1 + 8 * v122 + 72))
    {
      v152 = (uint64_t)v141 + 2 * v122;
      v153 = *(unsigned __int16 *)(v152 + 328);
      if (v153 >= *(unsigned __int16 *)(a1 + 2 * v122 + 328))
        *(_WORD *)(v152 + 328) = v153 + 1;
    }
    if ((*(_WORD *)(v12 + 10) & 2) != 0)
    {
      v158 = v141[2];
      if (v158)
      {
        if ((*(_BYTE *)(v158 + 68) & 1) != 0)
        {
          v159 = *(unsigned __int16 *)(a1 + 66);
          v160 = v141[v159 + 9];
          v161 = *((unsigned __int16 *)v141 + v159 + 164);
          if (v161 < (*(unsigned __int16 *)(v160 + 12) - 16) >> 1)
          {
            v162 = v160 + *(unsigned __int16 *)(v160 + 2 * v161 + 16);
            if ((*(_WORD *)(v162 + 4) & 6) == 4)
              *(_QWORD *)(v158 + 72) = v162 + *(unsigned __int16 *)(v162 + 6) + 8;
          }
        }
      }
    }
    goto LABEL_172;
  }
  v164 = v28;
  v104 = 0;
  v105 = 0;
  *(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) = v177;
  v106 = (size_t *)&v212;
  v107 = v172;
  while (1)
  {
    if (v107 == v44)
    {
      v108 = *(unsigned int **)(v178 + 8);
      v214 = *(_QWORD *)v178;
      v215 = v108;
      if ((*(_WORD *)(v12 + 10) & 2) != 0)
        v106 = v173;
      else
        v104 = v99;
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v105;
      v109 = *(_WORD *)(v12 + 10);
      LODWORD(v110) = v45;
    }
    else
    {
      v111 = (unsigned int *)(v12 + *(unsigned __int16 *)&v42[2 * v107 + 16]);
      v215 = v111 + 2;
      v112 = (char *)*((unsigned __int16 *)v111 + 3);
      v214 = (size_t)v112;
      v109 = *(_WORD *)(v12 + 10);
      if ((v109 & 2) != 0)
      {
        v212 = *v111;
        v213 = &v112[(_QWORD)(v111 + 2)];
        LODWORD(v110) = *((unsigned __int16 *)v111 + 2);
        v106 = (size_t *)&v212;
      }
      else
      {
        v110 = *((unsigned __int16 *)v111 + 2);
        v104 = *v111 | (unint64_t)(v110 << 32);
      }
    }
    if (!(v109 & 2 | v105))
      v214 = 0;
    result = mdb_node_add(a1, (unsigned __int16)v105, (const void **)&v214, v106, v104, v110);
    if ((_DWORD)result)
      break;
    if (v107 == v174)
    {
      v107 = 0;
      v105 = 0;
      *(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) = v42;
    }
    else
    {
      ++v107;
      ++v105;
    }
    if (v107 == v172)
    {
      LODWORD(v113) = *((unsigned __int16 *)v42 + 6);
      v114 = (v113 - 16) >> 1;
      v28 = v164;
      v115 = v169;
      v116 = v167;
      if ((v113 - 16) >= 2)
      {
        if (v114 <= 1)
          v117 = 1;
        else
          v117 = v114;
        v118 = (__int16 *)(v42 + 16);
        v119 = (_WORD *)(v12 + 16);
        do
        {
          v120 = *v118++;
          *v119++ = v120;
          --v117;
        }
        while (v117);
        v113 = *((unsigned __int16 *)v42 + 6);
      }
      *(_WORD *)(v12 + 12) = v113;
      *(_WORD *)(v12 + 14) = *((_WORD *)v42 + 7);
      memcpy((void *)(v12 + *(unsigned __int16 *)(v12 + 2 * v114 - 2 + 16)), &v42[*(unsigned __int16 *)&v42[2 * v114 + 14]], *(_DWORD *)(v164 + 16) - *((unsigned __int16 *)v42 + 7));
      if (v172 <= v44)
      {
        v121 = *(unsigned __int16 *)(a1 + 66);
        *(_QWORD *)(a1 + 72 + 8 * v121) = v211;
        v122 = v171;
        v128 = a1 + 2 * v171;
        v129 = *(_WORD *)(v128 + 328) + 1;
        *(_WORD *)(v128 + 328) = v129;
        v130 = *(_QWORD *)(a1 + 72 + 8 * v171);
        if (*((_QWORD *)v208 + v171 + 1) != v130
          && (*(unsigned __int16 *)(v130 + 12) - 16) >> 1 <= v129
          && (v171 & 0x80000000) == 0)
        {
          v131 = 0;
          do
          {
            *(_QWORD *)(a1 + 8 * v131 + 72) = *((_QWORD *)v208 + v131 + 1);
            *(_WORD *)(a1 + 2 * v131 + 328) = *((_WORD *)&v208[16] + v131 + 4);
            ++v131;
          }
          while (v171 + 1 != v131);
        }
      }
      else
      {
        v121 = *(unsigned __int16 *)(a1 + 66);
        *(_QWORD *)(a1 + 8 * v121 + 72) = v12;
        v122 = v171;
      }
      if ((v45 & 0x10000) != 0)
      {
        v132 = *(_QWORD *)(a1 + 8 * v121 + 72);
        v133 = v132
             + *(unsigned __int16 *)(v132 + 2 * *(unsigned __int16 *)(a1 + 2 * v121 + 328) + 16);
        if ((*(_WORD *)(v133 + 4) & 1) == 0)
          v173[1] = v133 + *(unsigned __int16 *)(v133 + 6) + 8;
      }
      goto LABEL_139;
    }
  }
  v28 = v164;
LABEL_174:
  if (v42)
  {
    *(_QWORD *)v42 = *(_QWORD *)(v28 + 192);
    *(_QWORD *)(v28 + 192) = v42;
  }
  if ((_DWORD)result)
    goto LABEL_177;
  return result;
}

uint64_t mdb_node_add(uint64_t a1, int a2, const void **a3, size_t *a4, size_t a5, int a6)
{
  _WORD *v8;
  __int16 v9;
  int v10;
  int v13;
  uint64_t v14;
  size_t v15;
  int v16;
  uint64_t result;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  unsigned int v23;
  _WORD *v24;
  __int16 *v25;
  __int16 v26;
  unsigned __int16 v27;
  char *v28;
  unsigned __int16 v29;
  char *v30;
  char *v31;
  const void *v32;
  size_t v33;
  char *v34;
  char *v35;

  v8 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  v35 = 0;
  v9 = v8[5];
  if ((v9 & 0x20) != 0)
  {
    v15 = **(int **)(a1 + 40);
    v16 = (((unsigned __int16)v8[6] - 16) >> 1) - a2;
    if (v16 >= 1)
      memmove((char *)v8 + (int)v15 * (uint64_t)a2 + v15 + 16, (char *)v8 + (int)v15 * (uint64_t)a2 + 16, v16 * (int)v15);
    memcpy((char *)v8 + (int)v15 * (uint64_t)a2 + 16, a3[1], v15);
    result = 0;
    v8[6] += 2;
    v8[7] = v8[7] - v15 + 2;
    return result;
  }
  v10 = a6;
  v13 = (unsigned __int16)v8[6];
  if (a3)
    v14 = (uint64_t)*a3 + 8;
  else
    v14 = 8;
  v18 = (unsigned __int16)(v8[7] - v13) - 2;
  if ((v9 & 2) == 0)
  {
    v19 = v14;
    goto LABEL_16;
  }
  if ((a6 & 1) != 0)
  {
    v19 = v14 + 8;
LABEL_16:
    v22 = (v19 + 1) & 0xFFFFFFFFFFFFFFFELL;
    if (v22 > v18)
    {
      v20 = *(_QWORD *)(a1 + 24);
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v19 = *a4 + v14;
  v20 = *(_QWORD *)(a1 + 24);
  v21 = *(_QWORD *)(v20 + 32);
  if (v19 <= *(unsigned int *)(v21 + 220))
    goto LABEL_16;
  v22 = (v14 + 9) & 0xFFFFFFFFFFFFFFFELL;
  if (v22 > v18)
  {
LABEL_18:
    *(_DWORD *)(v20 + 124) |= 2u;
    return 4294936510;
  }
  result = mdb_page_new(a1, 4, ((*a4 + 15) / *(unsigned int *)(v21 + 16)) + 1, &v35);
  if ((_DWORD)result)
    return result;
  v10 |= 1u;
  v13 = (unsigned __int16)v8[6];
LABEL_19:
  v23 = (v13 - 16) >> 1;
  if (v23 > a2)
  {
    v24 = &v8[v23 + 8];
    v25 = &v8[v23 + 7];
    do
    {
      --v23;
      v26 = *v25--;
      *v24-- = v26;
    }
    while (v23 > a2);
    LOWORD(v13) = v8[6];
  }
  v27 = v8[7] - v22;
  v8[a2 + 8] = v27;
  v8[7] = v27;
  v8[6] = v13 + 2;
  v28 = (char *)v8 + v27;
  if (a3)
    v29 = *(_WORD *)a3;
  else
    v29 = 0;
  *((_WORD *)v28 + 3) = v29;
  *((_WORD *)v28 + 2) = v10;
  if ((v8[5] & 2) != 0)
    a5 = *a4;
  else
    *((_WORD *)v28 + 2) = WORD2(a5);
  *(_DWORD *)v28 = a5;
  if (a3)
    memcpy(v28 + 8, a3[1], (size_t)*a3);
  if ((v8[5] & 2) != 0)
  {
    v30 = &v28[v29 + 8];
    if (v35)
    {
      v31 = v35 + 16;
      *(_QWORD *)v30 = *(_QWORD *)v35;
      if ((v10 & 0x10000) != 0)
      {
        result = 0;
        a4[1] = (size_t)v31;
        return result;
      }
      v33 = *a4;
      v32 = (const void *)a4[1];
      v34 = v31;
    }
    else
    {
      if ((v10 & 1) != 0)
      {
        result = 0;
        *(_QWORD *)v30 = *(_QWORD *)a4[1];
        return result;
      }
      if ((v10 & 0x10000) != 0)
      {
        result = 0;
        a4[1] = (size_t)v30;
        return result;
      }
      v33 = *a4;
      v32 = (const void *)a4[1];
      v34 = &v28[v29 + 8];
    }
    memcpy(v34, v32, v33);
  }
  return 0;
}

uint64_t mdb_xcursor_init1(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  _WORD *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;

  v2 = *(_QWORD *)(result + 16);
  v3 = *(_DWORD *)(v2 + 68) & 0xA0004;
  *(_DWORD *)(v2 + 68) = v3;
  if ((*(_BYTE *)(a2 + 4) & 2) != 0)
  {
    v8 = a2 + *(unsigned __int16 *)(a2 + 6);
    v9 = *(_OWORD *)(v8 + 8);
    v10 = *(_OWORD *)(v8 + 40);
    *(_OWORD *)(v2 + 408) = *(_OWORD *)(v8 + 24);
    *(_OWORD *)(v2 + 424) = v10;
    *(_OWORD *)(v2 + 392) = v9;
    *(_QWORD *)(v2 + 72) = 0;
    *(_DWORD *)(v2 + 64) = 0;
  }
  else
  {
    v4 = a2 + *(unsigned __int16 *)(a2 + 6);
    *(_QWORD *)(v2 + 392) = 0x1000000000000;
    v6 = *(_WORD *)(v4 + 8);
    v5 = (_WORD *)(v4 + 8);
    *(_OWORD *)(v2 + 400) = xmmword_10001B8F0;
    *(_QWORD *)(v2 + 416) = 0;
    *(_QWORD *)(v2 + 424) = ((unsigned __int16)v5[6] - 16) >> 1;
    *(_WORD *)(v2 + 432) = v6;
    *(_WORD *)(v2 + 434) = v5[1];
    *(_WORD *)(v2 + 436) = v5[2];
    *(_WORD *)(v2 + 438) = v5[3];
    *(_DWORD *)(v2 + 64) = 1;
    *(_DWORD *)(v2 + 68) = v3 | 1;
    *(_QWORD *)(v2 + 72) = v5;
    *(_WORD *)(v2 + 328) = 0;
    v7 = *(_QWORD *)(result + 40);
    if ((*(_BYTE *)(v7 + 4) & 0x10) != 0)
    {
      *(_WORD *)(v2 + 396) = 16;
      *(_DWORD *)(v2 + 392) = (unsigned __int16)v5[4];
      if ((*(_BYTE *)(v7 + 4) & 0x20) != 0)
        *(_WORD *)(v2 + 396) = 24;
    }
  }
  *(_BYTE *)(v2 + 488) = 56;
  if (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 456) == mdb_cmp_int && *(_DWORD *)(v2 + 392) == 8)
    *(_QWORD *)(v2 + 456) = mdb_cmp_cint;
  return result;
}

__n128 mdb_xcursor_init2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int v4;
  __n128 result;
  __int128 v6;

  v3 = *(_QWORD *)(a1 + 16);
  if (a3)
  {
    v4 = *(_DWORD *)(v3 + 68) | 1;
    *(_DWORD *)(v3 + 64) = 1;
    *(_DWORD *)(v3 + 68) = v4;
    *(_WORD *)(v3 + 328) = 0;
    *(_BYTE *)(v3 + 488) = 56;
    *(_QWORD *)(v3 + 456) = *(_QWORD *)(a2 + 456);
  }
  else if ((*(_BYTE *)(v3 + 68) & 1) == 0)
  {
    return result;
  }
  result = *(__n128 *)(a2 + 392);
  v6 = *(_OWORD *)(a2 + 424);
  *(_OWORD *)(v3 + 408) = *(_OWORD *)(a2 + 408);
  *(_OWORD *)(v3 + 424) = v6;
  *(__n128 *)(v3 + 392) = result;
  *(_QWORD *)(v3 + 72) = *(_QWORD *)(a2 + 72);
  return result;
}

uint64_t mdb_cursor_del(uint64_t a1, int a2)
{
  int v2;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + 124);
  if ((v2 & 0x20013) != 0)
  {
    if ((v2 & 0x20000) != 0)
      return 13;
    else
      return 4294936514;
  }
  if ((*(_BYTE *)(a1 + 68) & 1) == 0)
    return 22;
  if (*(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) >= (*(unsigned __int16 *)(*(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) + 12)
                                                                                - 16) >> 1)
    return 4294936498;
  if ((a2 & 0x8000) != 0 || (result = mdb_page_spill(a1, 0, 0), !(_DWORD)result))
  {
    result = mdb_cursor_touch(a1);
    if (!(_DWORD)result)
    {
      v6 = *(unsigned __int16 *)(a1 + 66);
      v7 = *(_QWORD *)(a1 + 8 * v6 + 72);
      v8 = *(_WORD *)(v7 + 10);
      if ((v8 & 2) == 0)
        return 4294936500;
      if ((v8 & 0x20) != 0)
        return mdb_cursor_del0(a1);
      v9 = v7 + *(unsigned __int16 *)(v7 + 2 * *(unsigned __int16 *)(a1 + 2 * v6 + 328) + 16);
      v10 = *(unsigned __int16 *)(v9 + 4);
      if ((v10 & 4) == 0)
      {
        if (((v10 ^ a2) & 2) != 0)
        {
          result = 4294936512;
LABEL_45:
          *(_DWORD *)(*(_QWORD *)(a1 + 24) + 124) |= 2u;
          return result;
        }
        goto LABEL_41;
      }
      if ((a2 & 0x20) != 0)
      {
        v11 = *(_QWORD *)(a1 + 16);
        *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32)
                                                 - *(_QWORD *)(v11 + 424)
                                                 + 1;
        *(_DWORD *)(v11 + 68) &= ~1u;
        if ((v10 & 2) == 0)
          goto LABEL_41;
        goto LABEL_38;
      }
      if ((v10 & 2) == 0)
        *(_QWORD *)(*(_QWORD *)(a1 + 16) + 72) = v9 + *(unsigned __int16 *)(v9 + 6) + 8;
      result = mdb_cursor_del(*(_QWORD *)(a1 + 16), 0x8000);
      if (!(_DWORD)result)
      {
        v11 = *(_QWORD *)(a1 + 16);
        if (*(_QWORD *)(v11 + 424))
        {
          if ((*(_WORD *)(v9 + 4) & 2) != 0)
          {
            v18 = v9 + *(unsigned __int16 *)(v9 + 6);
            v20 = *(_OWORD *)(v11 + 408);
            v19 = *(_OWORD *)(v11 + 424);
            *(_OWORD *)(v18 + 8) = *(_OWORD *)(v11 + 392);
            *(_OWORD *)(v18 + 24) = v20;
            *(_OWORD *)(v18 + 40) = v19;
          }
          else
          {
            mdb_node_shrink((char *)v7, *(unsigned __int16 *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66)));
            v12 = *(unsigned __int16 *)(a1 + 66);
            v13 = v7 + *(unsigned __int16 *)(v7 + 2 * *(unsigned __int16 *)(a1 + 328 + 2 * v12) + 16);
            *(_QWORD *)(*(_QWORD *)(a1 + 16) + 72) = v13 + *(unsigned __int16 *)(v13 + 6) + 8;
            for (i = *(uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
                  i;
                  i = (uint64_t *)*i)
            {
              if (i != (uint64_t *)a1
                && *((unsigned __int16 *)i + 32) >= *(unsigned __int16 *)(a1 + 64)
                && (*((_BYTE *)i + 68) & 1) != 0
                && i[v12 + 9] == v7)
              {
                v15 = i[2];
                if (v15)
                {
                  if ((*(_BYTE *)(v15 + 68) & 1) != 0)
                  {
                    v16 = *((unsigned __int16 *)i + v12 + 164);
                    if (v16 < (*(unsigned __int16 *)(v7 + 12) - 16) >> 1)
                    {
                      v17 = v7 + *(unsigned __int16 *)(v7 + 2 * v16 + 16);
                      if ((*(_WORD *)(v17 + 4) & 6) == 4)
                        *(_QWORD *)(v15 + 72) = v17 + *(unsigned __int16 *)(v17 + 6) + 8;
                    }
                  }
                }
              }
            }
          }
          result = 0;
          --*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
          return result;
        }
        *(_DWORD *)(v11 + 68) &= ~1u;
        LOWORD(v10) = *(_WORD *)(v9 + 4);
        if ((v10 & 2) == 0)
        {
LABEL_41:
          if ((v10 & 1) != 0)
          {
            v21 = 0;
            result = mdb_page_get(a1, *(_QWORD *)(v9 + *(unsigned __int16 *)(v9 + 6) + 8), (unint64_t *)&v21, 0);
            if ((_DWORD)result)
              goto LABEL_45;
            result = mdb_ovpage_free(a1, v21);
            if ((_DWORD)result)
              goto LABEL_45;
          }
          return mdb_cursor_del0(a1);
        }
LABEL_38:
        result = mdb_drop0(v11, 0);
        if ((_DWORD)result)
          goto LABEL_45;
        LOWORD(v10) = *(_WORD *)(v9 + 4);
        goto LABEL_41;
      }
    }
  }
  return result;
}

char *mdb_node_shrink(char *result, int a2)
{
  char *v2;
  char *v3;
  unsigned __int16 *v4;
  int v5;
  char *v6;
  char *v7;
  _WORD *v8;
  int v9;
  unsigned __int16 v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;
  char *v18;
  _WORD *v19;
  __int16 v20;
  unsigned int v21;

  v2 = result;
  v3 = &result[2 * a2];
  v5 = *((unsigned __int16 *)v3 + 8);
  v4 = (unsigned __int16 *)(v3 + 16);
  v6 = &result[v5];
  v7 = &v6[*((unsigned __int16 *)v6 + 3)];
  v8 = v7 + 8;
  v9 = *((unsigned __int16 *)v7 + 10);
  v10 = *((_WORD *)v7 + 11) - v9;
  v11 = *(_WORD *)v6 - v10;
  if ((*((_WORD *)v7 + 9) & 0x20) != 0)
  {
    if ((v11 & 1) != 0)
      return result;
    v12 = (unsigned __int16)(*((_WORD *)v7 + 11) - v9);
    v13 = (unsigned __int16)(*(_WORD *)v6 - v10);
  }
  else
  {
    v12 = (unsigned __int16)(*((_WORD *)v7 + 11) - v9);
    if ((v9 - 16) >= 2)
    {
      v14 = ((v9 - 16) >> 1) + 1;
      v13 = 16;
      do
      {
        *(_WORD *)((char *)&v8[(v14 - 2) + 8] + v10) = v8[(v14 - 2) + 8] - v10;
        --v14;
      }
      while (v14 > 1);
    }
    else
    {
      v13 = 16;
    }
  }
  v8[7] = v9;
  *(_QWORD *)v8 = *(_QWORD *)result;
  *(_WORD *)v6 = v11;
  *((_WORD *)v6 + 1) = 0;
  result = (char *)memmove(&result[*((unsigned __int16 *)result + 7) + v12], &result[*((unsigned __int16 *)result + 7)], (char *)v8 + v13 - &result[*((unsigned __int16 *)result + 7)]);
  v15 = *((unsigned __int16 *)v2 + 6) - 16;
  if (v15 >= 2)
  {
    v16 = *v4;
    v17 = (v15 >> 1) + 1;
    do
    {
      v18 = &v2[2 * (v17 - 2)];
      v21 = *((unsigned __int16 *)v18 + 8);
      v19 = v18 + 16;
      v20 = v21;
      if (v21 <= v16)
        *v19 = v20 + v10;
      --v17;
    }
    while (v17 > 1);
  }
  *((_WORD *)v2 + 7) += v10;
  return result;
}

uint64_t mdb_drop0(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  _WORD *v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int16 v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  unsigned __int16 *v22;
  unsigned int v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  __int16 v27;
  unsigned __int16 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t **v32;
  unint64_t v33;
  _OWORD v34[5];
  _OWORD v35[19];
  uint64_t v36;

  LODWORD(result) = mdb_page_search(a1, 0, 4);
  if ((_DWORD)result)
  {
    if ((_DWORD)result == -30798)
      result = 0;
    else
      result = result;
    goto LABEL_61;
  }
  v5 = *(_QWORD *)(a1 + 24);
  v36 = 0;
  memset(v35, 0, sizeof(v35));
  memset(v34, 0, sizeof(v34));
  v6 = *(_DWORD *)(a1 + 68);
  if (((v6 & 4) != 0 || !a2 && !*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24)) && *(_WORD *)(a1 + 64))
  {
    v7 = *(_WORD *)(a1 + 64) - 1;
    *(_WORD *)(a1 + 64) = v7;
    if (v7)
      --*(_WORD *)(a1 + 66);
    else
      *(_DWORD *)(a1 + 68) = v6 & 0xFFFFFFFE;
  }
  mdb_cursor_copy(a1, (uint64_t)v34);
  if (!*(_WORD *)(a1 + 64))
    goto LABEL_58;
  v31 = v5;
  v32 = (uint64_t **)(v5 + 40);
  v8 = a1 + 330;
  while (1)
  {
    v9 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    v10 = (unsigned __int16)v9[6] - 16;
    v11 = v10 >> 1;
    if ((v9[5] & 2) != 0)
    {
      if (v10 >= 2)
      {
        v13 = 0;
        if (v11 <= 1)
          v12 = 1;
        else
          v12 = v11;
        do
        {
          v14 = (uint64_t)v9 + (unsigned __int16)v9[v13 + 8];
          v15 = *(_WORD *)(v14 + 4);
          if ((v15 & 1) != 0)
          {
            v33 = 0;
            v16 = *(_QWORD *)(v14 + *(unsigned __int16 *)(v14 + 6) + 8);
            result = mdb_page_get(a1, v16, &v33, 0);
            if ((_DWORD)result
              || (v17 = v33, result = mdb_midl_append_range(v32, v16, *(_DWORD *)(v33 + 12)), (_DWORD)result))
            {
LABEL_55:
              v5 = v31;
              goto LABEL_60;
            }
            v18 = *(_QWORD *)(a1 + 40);
            v19 = *(_QWORD *)(v18 + 24) - *(unsigned int *)(v17 + 12);
            *(_QWORD *)(v18 + 24) = v19;
            if (!a2 && !v19)
            {
              v5 = v31;
              goto LABEL_47;
            }
          }
          else if (a2)
          {
            if ((v15 & 2) != 0)
            {
              mdb_xcursor_init1(a1, v14);
              result = mdb_drop0(*(_QWORD *)(a1 + 16), 0);
              if ((_DWORD)result)
                goto LABEL_55;
            }
          }
          ++v13;
        }
        while (v12 != v13);
        v5 = v31;
        if (a2)
          goto LABEL_42;
LABEL_35:
        if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24))
          goto LABEL_47;
        goto LABEL_42;
      }
      LOWORD(v12) = 0;
      if (!a2)
        goto LABEL_35;
    }
    else
    {
      result = mdb_midl_need((_DWORD **)v32, v10 >> 1);
      if ((_DWORD)result)
        goto LABEL_60;
      if (v10 >= 2)
      {
        v20 = *v32;
        v21 = v11 <= 1 ? 1 : v11;
        LOWORD(v12) = v21;
        v22 = v9 + 8;
        do
        {
          v23 = *v22++;
          v24 = *(unsigned int *)((char *)v9 + v23) | ((unint64_t)*(unsigned __int16 *)((char *)v9 + v23 + 4) << 32);
          v25 = *v20 + 1;
          *v20 = v25;
          v20[v25] = v24;
          --v21;
        }
        while (v21);
      }
      else
      {
        LOWORD(v12) = 0;
      }
    }
LABEL_42:
    if (!*(_WORD *)(a1 + 66))
      goto LABEL_58;
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v12;
    result = mdb_cursor_sibling(a1, 1);
    if ((_DWORD)result != -30798)
    {
      if ((_DWORD)result)
        goto LABEL_59;
      v26 = *(unsigned __int16 *)(a1 + 64);
      goto LABEL_53;
    }
LABEL_47:
    v27 = *(_WORD *)(a1 + 64);
    if (!v27)
      goto LABEL_57;
    v28 = v27 - 1;
    *(_WORD *)(a1 + 64) = v27 - 1;
    if (v27 == 1)
      break;
    --*(_WORD *)(a1 + 66);
    *(_WORD *)(a1 + 328) = 0;
    v26 = (unsigned __int16)(v27 - 1);
    if (v28 != 1)
    {
      v29 = 0;
      v30 = v28 - 1;
      do
      {
        *(_WORD *)(v8 + 2 * v29) = 0;
        *(_QWORD *)(v8 + 8 * v29 - 250) = *((_QWORD *)v35 + v29);
        ++v29;
      }
      while (v30 != v29);
      v26 = 1;
    }
LABEL_53:
    if (!v26)
      goto LABEL_58;
  }
  *(_DWORD *)(a1 + 68) &= ~1u;
LABEL_57:
  *(_WORD *)(a1 + 328) = 0;
LABEL_58:
  result = mdb_midl_append((unint64_t **)(v5 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
LABEL_59:
  if ((_DWORD)result)
LABEL_60:
    *(_DWORD *)(v5 + 124) |= 2u;
LABEL_61:
  *(_DWORD *)(a1 + 68) &= ~1u;
  return result;
}

uint64_t mdb_cursor_del0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t *i;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _DWORD *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  __int16 v27;
  int v28;

  v2 = *(unsigned int *)(a1 + 32);
  v3 = *(unsigned __int16 *)(a1 + 66);
  v4 = *(unsigned __int16 *)(a1 + 2 * v3 + 328);
  v5 = *(_QWORD *)(a1 + 8 * v3 + 72);
  mdb_node_del((_QWORD *)a1, **(_DWORD **)(a1 + 40));
  --*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32);
  for (i = *(uint64_t **)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 104) + 8 * v2); i; i = (uint64_t *)*i)
  {
    v7 = i;
    if ((*(_BYTE *)(a1 + 68) & 4) != 0)
      v7 = (uint64_t *)i[2];
    if (v7 != (uint64_t *)a1)
    {
      v8 = *((_DWORD *)v7 + 17);
      if ((*((_DWORD *)i + 17) & v8 & 1) != 0
        && *((unsigned __int16 *)v7 + 32) >= *(unsigned __int16 *)(a1 + 64))
      {
        v9 = *(unsigned __int16 *)(a1 + 66);
        if (v7[v9 + 9] == v5)
        {
          v10 = (uint64_t)v7 + 2 * v9;
          v11 = *(unsigned __int16 *)(v10 + 328);
          if (v11 == v4)
          {
            *((_DWORD *)v7 + 17) = v8 | 8;
            if ((*(_WORD *)(*(_QWORD *)(a1 + 40) + 4) & 4) != 0)
              *(_DWORD *)(v7[2] + 68) &= 0xFFFFFFFC;
          }
          else
          {
            if (v11 > v4)
              *(_WORD *)(v10 + 328) = v11 - 1;
            v12 = v7[2];
            if (v12)
            {
              if ((*(_BYTE *)(v12 + 68) & 1) != 0)
              {
                v13 = *((unsigned __int16 *)v7 + *(unsigned __int16 *)(a1 + 66) + 164);
                if (v13 < (*(unsigned __int16 *)(v5 + 12) - 16) >> 1)
                {
                  v14 = v5 + *(unsigned __int16 *)(v5 + 2 * v13 + 16);
                  if ((*(_WORD *)(v14 + 4) & 6) == 4)
                    *(_QWORD *)(v12 + 72) = v14 + *(unsigned __int16 *)(v14 + 6) + 8;
                }
              }
            }
          }
        }
      }
    }
  }
  result = mdb_rebalance(a1);
  if (!(_DWORD)result)
  {
    if (!*(_WORD *)(a1 + 64))
    {
      result = 0;
      v16 = (_DWORD *)(a1 + 68);
      goto LABEL_22;
    }
    v18 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 104) + 8 * v2);
    if (!v18)
    {
LABEL_47:
      result = 0;
      v16 = (_DWORD *)(a1 + 68);
      v17 = 8;
      goto LABEL_48;
    }
    v19 = *(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    v20 = (*(unsigned __int16 *)(v19 + 12) - 16) >> 1;
    while (1)
    {
      v21 = v18;
      if ((*(_BYTE *)(a1 + 68) & 4) != 0)
        v21 = *(_QWORD *)(v18 + 16);
      v22 = (_BYTE *)(v21 + 68);
      if ((*(_DWORD *)(v18 + 68) & *(_DWORD *)(v21 + 68) & 1) == 0)
        goto LABEL_46;
      if (*(unsigned __int16 *)(v21 + 64) < *(unsigned __int16 *)(a1 + 64))
        goto LABEL_46;
      v23 = *(unsigned __int16 *)(a1 + 66);
      if (*(_QWORD *)(v21 + 8 * v23 + 72) != v19)
        goto LABEL_46;
      v24 = *(unsigned __int16 *)(v21 + 2 * v23 + 328);
      if (v24 < *(unsigned __int16 *)(a1 + 2 * v23 + 328))
        goto LABEL_46;
      if (v20 <= v24)
      {
        result = mdb_cursor_sibling(v21, 1);
        if ((_DWORD)result == -30798)
        {
          v28 = 2;
          goto LABEL_45;
        }
        if ((_DWORD)result)
          break;
      }
      v25 = *(_QWORD *)(v21 + 16);
      if (!v25 || (*v22 & 2) != 0)
        goto LABEL_46;
      v26 = *(_QWORD *)(v21 + 8 * *(unsigned __int16 *)(v21 + 66) + 72)
          + *(unsigned __int16 *)(*(_QWORD *)(v21 + 8 * *(unsigned __int16 *)(v21 + 66) + 72)
                                + 2 * *(unsigned __int16 *)(v21 + 2 * *(unsigned __int16 *)(v21 + 66) + 328)
                                + 16);
      v27 = *(_WORD *)(v26 + 4);
      if ((v27 & 4) != 0)
      {
        if ((*(_BYTE *)(v25 + 68) & 1) != 0)
        {
          if ((v27 & 2) == 0)
            *(_QWORD *)(v25 + 72) = v26 + *(unsigned __int16 *)(v26 + 6) + 8;
        }
        else
        {
          mdb_xcursor_init1(v21, v26);
          result = mdb_cursor_first(*(_QWORD *)(v21 + 16), 0, 0);
          if ((_DWORD)result)
            break;
        }
      }
      v22 = (_BYTE *)(*(_QWORD *)(v21 + 16) + 68);
      v28 = 8;
LABEL_45:
      *(_DWORD *)v22 |= v28;
LABEL_46:
      v18 = *(_QWORD *)v18;
      if (!v18)
        goto LABEL_47;
    }
  }
  v16 = (_DWORD *)(*(_QWORD *)(a1 + 24) + 124);
LABEL_22:
  v17 = 2;
LABEL_48:
  *v16 |= v17;
  return result;
}

uint64_t mdb_cursor_open(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  uint64_t result;
  int v7;
  size_t v8;
  _DWORD *v9;
  _DWORD *v10;
  uint64_t v11;

  result = 22;
  if (a1 && a3 && *(_DWORD *)(a1 + 120) > a2 && (*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 8) != 0)
  {
    v7 = *(_DWORD *)(a1 + 124);
    if ((v7 & 0x13) != 0)
    {
      return 4294936514;
    }
    else if (v7 & 0x20000 | a2)
    {
      if ((*(_WORD *)(*(_QWORD *)(a1 + 88) + 48 * a2 + 4) & 4) != 0)
        v8 = 888;
      else
        v8 = 392;
      v9 = malloc_type_malloc(v8, 0xBC8215E7uLL);
      if (v9)
      {
        v10 = v9;
        mdb_cursor_init((uint64_t)v9, a1, a2, (uint64_t)(v9 + 98));
        v11 = *(_QWORD *)(a1 + 104);
        if (v11)
        {
          *(_QWORD *)v10 = *(_QWORD *)(v11 + 8 * a2);
          *(_QWORD *)(v11 + 8 * a2) = v10;
          v10[17] |= 0x40u;
        }
        result = 0;
        *a3 = v10;
      }
      else
      {
        return 12;
      }
    }
  }
  return result;
}

uint64_t mdb_cursor_renew(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  result = 22;
  if (a1 && a2)
  {
    v4 = *(unsigned int *)(a2 + 32);
    if (v4 >= *(_DWORD *)(a1 + 120)
      || (*(_BYTE *)(*(_QWORD *)(a1 + 112) + v4) & 8) == 0
      || (*(_BYTE *)(a2 + 68) & 0x40) != 0
      || *(_QWORD *)(a1 + 104))
    {
      return 22;
    }
    else if ((*(_BYTE *)(a1 + 124) & 0x13) != 0)
    {
      return 4294936514;
    }
    else
    {
      mdb_cursor_init(a2, a1, v4, *(_QWORD *)(a2 + 16));
      return 0;
    }
  }
  return result;
}

uint64_t mdb_cursor_count(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;

  v2 = 22;
  if (a1 && a2)
  {
    v3 = *(_QWORD *)(a1 + 16);
    if (!v3)
      return 4294936512;
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 24) + 124) & 0x13) != 0)
      return 4294936514;
    v4 = *(_DWORD *)(a1 + 68);
    if ((v4 & 1) == 0)
      return 22;
    if (*(_WORD *)(a1 + 64))
    {
      v5 = *(unsigned __int16 *)(a1 + 66);
      if ((v4 & 2) == 0)
      {
        v6 = *(_QWORD *)(a1 + 8 * v5 + 72);
        v7 = *(unsigned __int16 *)(a1 + 2 * v5 + 328);
        goto LABEL_14;
      }
      v7 = *(unsigned __int16 *)(a1 + 2 * v5 + 328);
      v6 = *(_QWORD *)(a1 + 8 * v5 + 72);
      if (v7 < (*(unsigned __int16 *)(v6 + 12) - 16) >> 1)
      {
        *(_DWORD *)(a1 + 68) = v4 ^ 2;
LABEL_14:
        if ((*(_WORD *)(v6 + *(unsigned __int16 *)(v6 + 2 * v7 + 16) + 4) & 4) != 0)
        {
          if ((*(_BYTE *)(v3 + 68) & 1) == 0)
            return 22;
          v8 = *(_QWORD *)(v3 + 424);
        }
        else
        {
          v8 = 1;
        }
        v2 = 0;
        *a2 = v8;
        return v2;
      }
    }
    return 4294936498;
  }
  return v2;
}

void mdb_cursor_close(void *a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  BOOL v4;

  if (a1 && !*((_QWORD *)a1 + 1))
  {
    if ((*((_BYTE *)a1 + 68) & 0x40) != 0)
    {
      v1 = *(_QWORD *)(*((_QWORD *)a1 + 3) + 104);
      if (v1)
      {
        v2 = (_QWORD *)(v1 + 8 * *((unsigned int *)a1 + 8));
        do
        {
          v3 = v2;
          v2 = (_QWORD *)*v2;
          if (v2)
            v4 = v2 == a1;
          else
            v4 = 1;
        }
        while (!v4);
        if (v2 == a1)
          *v3 = *(_QWORD *)a1;
      }
    }
    free(a1);
  }
}

uint64_t mdb_cursor_dbi(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t mdb_del(uint64_t a1, unsigned int a2, _QWORD *a3, __int128 *a4)
{
  uint64_t v4;
  int v6;

  v4 = 22;
  if (!a1 || !a3)
    return v4;
  if (*(_DWORD *)(a1 + 120) <= a2 || (*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 0x10) == 0)
    return 22;
  v6 = *(_DWORD *)(a1 + 124);
  if ((v6 & 0x20013) != 0)
  {
    if ((v6 & 0x20000) != 0)
      return 13;
    else
      return 4294936514;
  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 88) + 48 * a2 + 4) & 4) == 0)
    a4 = 0;
  return mdb_del0(a1, a2, a3, a4, 0);
}

uint64_t mdb_del0(uint64_t a1, unsigned int a2, _QWORD *a3, __int128 *a4, int a5)
{
  __int128 *v10;
  int v11;
  uint64_t result;
  uint64_t v13;
  int v14;
  __int128 v15;
  _OWORD v16[31];
  _QWORD v17[50];

  memset(v17, 0, 392);
  memset(v16, 0, sizeof(v16));
  v15 = 0uLL;
  v14 = 0;
  mdb_cursor_init((uint64_t)v17, a1, a2, (uint64_t)v16);
  if (a4)
  {
    v15 = *a4;
    v10 = &v15;
    v11 = 2;
  }
  else
  {
    v10 = 0;
    a5 |= 0x20u;
    v11 = 15;
  }
  result = mdb_cursor_set((uint64_t)v17, a3, v10, v11, &v14);
  if (!(_DWORD)result)
  {
    v13 = *(_QWORD *)(a1 + 104);
    v17[0] = *(_QWORD *)(v13 + 8 * a2);
    *(_QWORD *)(v13 + 8 * a2) = v17;
    result = mdb_cursor_del((uint64_t)v17, a5);
    *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8 * a2) = v17[0];
  }
  return result;
}

uint64_t mdb_put(uint64_t a1, unsigned int a2, size_t *a3, uint64_t a4, int a5)
{
  uint64_t result;
  int v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD v13[31];
  _OWORD v14[24];
  uint64_t v15;

  result = 22;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        if (*(_DWORD *)(a1 + 120) > a2)
        {
          v15 = 0;
          memset(v14, 0, sizeof(v14));
          memset(v13, 0, sizeof(v13));
          if ((a5 & 0xFFF8FFCF) == 0 && (*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 0x10) != 0)
          {
            v10 = *(_DWORD *)(a1 + 124);
            if ((v10 & 0x20013) != 0)
            {
              if ((v10 & 0x20000) != 0)
                return 13;
              else
                return 4294936514;
            }
            else
            {
              v11 = a2;
              mdb_cursor_init((uint64_t)v14, a1, a2, (uint64_t)v13);
              v12 = *(_QWORD *)(a1 + 104);
              *(_QWORD *)&v14[0] = *(_QWORD *)(v12 + 8 * v11);
              *(_QWORD *)(v12 + 8 * v11) = v14;
              result = mdb_cursor_put((uint64_t)v14, a3, a4, a5);
              *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8 * v11) = *(_QWORD *)&v14[0];
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t mdb_dbi_open(uint64_t a1, char *__s, int a3, unsigned int *a4)
{
  uint64_t v4;
  size_t v10;
  uint64_t v11;
  unsigned int v12;
  const char **v13;
  uint64_t i;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char v23;
  size_t *v24;
  uint64_t v25;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
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
  uint64_t v58;
  int v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _OWORD v67[20];
  uint64_t v68;
  uint64_t v69;
  __int128 *v70;
  size_t v71[3];

  if ((a3 & 0xFFFBFF81) != 0)
    return 22;
  if ((*(_BYTE *)(a1 + 124) & 0x13) != 0)
    return 4294936514;
  v68 = 0;
  memset(v67, 0, sizeof(v67));
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  if (!__s)
  {
    *a4 = 1;
    if ((a3 & 0x7FFF) != 0)
    {
      v17 = *(_QWORD *)(a1 + 88);
      v18 = *(unsigned __int16 *)(v17 + 52);
      v19 = a3 & 0x7FFF | v18;
      if (v19 != v18)
      {
        *(_WORD *)(v17 + 52) = v19;
        *(_DWORD *)(a1 + 124) |= 4u;
      }
    }
    mdb_default_cmp(a1, 1u);
    return 0;
  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 80) + 64))
    mdb_default_cmp(a1, 1u);
  v69 = 0;
  v70 = 0;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v10 = strlen(__s);
  v11 = *(unsigned int *)(a1 + 120);
  if (v11 < 3)
    goto LABEL_20;
  v12 = 0;
  v13 = (const char **)(*(_QWORD *)(a1 + 80) + 104);
  for (i = 2; i != v11; ++i)
  {
    v15 = (uint64_t)*(v13 - 1);
    if (v15)
    {
      if (v10 == v15 && !strncmp(__s, *v13, v10))
      {
        v4 = 0;
        *a4 = i;
        return v4;
      }
    }
    else if (!v12)
    {
      v12 = i;
    }
    v13 += 6;
  }
  if (v12)
  {
    v16 = 0;
  }
  else
  {
LABEL_20:
    if (v11 >= *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36))
      return 4294936505;
    v12 = 0;
    v16 = 1;
  }
  if ((*(_WORD *)(*(_QWORD *)(a1 + 88) + 52) & 0xC) == 0)
  {
    v59 = 0;
    v71[0] = v10;
    v71[1] = (size_t)__s;
    mdb_cursor_init((uint64_t)&v63, a1, 1u, 0);
    v20 = mdb_cursor_set((uint64_t)&v63, v71, &v69, 15, &v59);
    if ((_DWORD)v20 == -30798)
    {
      if ((a3 & 0x40000) == 0)
        return 4294936498;
      if ((*(_BYTE *)(a1 + 126) & 2) != 0)
        return 13;
      v29 = strdup(__s);
      if (v29)
      {
        v22 = v29;
        v69 = 48;
        v70 = &v60;
        v60 = 0u;
        v61 = 0u;
        *(_QWORD *)&v62 = 0;
        *((_QWORD *)&v62 + 1) = -1;
        WORD2(v60) = a3 & 0x7FFF;
        v58 = 0;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v30 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 104);
        v31 = v65;
        v32 = &v63;
        if ((BYTE4(v67[0]) & 4) != 0)
        {
          DWORD1(v38) = 1;
          *(_QWORD *)&v35 = &v63;
          v32 = &v34;
        }
        *(_QWORD *)v32 = *(_QWORD *)(v30 + 8 * v65);
        *(_QWORD *)(v30 + 8 * v31) = v32;
        v33 = mdb_cursor_put((uint64_t)&v63, v71, (uint64_t)&v69, 2);
        *(_QWORD *)(v30 + 8 * v31) = *(_QWORD *)v32;
        if ((_DWORD)v33)
        {
          v4 = v33;
          free(v22);
          return v4;
        }
        v23 = 29;
        if (!v16)
        {
LABEL_38:
          v24 = (size_t *)(*(_QWORD *)(a1 + 80) + 48 * v12);
          *v24 = v10;
          v24[1] = (size_t)v22;
          v24[4] = 0;
          *(_BYTE *)(*(_QWORD *)(a1 + 112) + v12) = v23;
          v25 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152);
          LODWORD(v24) = *(_DWORD *)(v25 + 4 * v12) + 1;
          *(_DWORD *)(v25 + 4 * v12) = (_DWORD)v24;
          *(_DWORD *)(*(_QWORD *)(a1 + 96) + 4 * v12) = (_DWORD)v24;
          v26 = (_OWORD *)(*(_QWORD *)(a1 + 88) + 48 * v12);
          v27 = *v70;
          v28 = v70[2];
          v26[1] = v70[1];
          v26[2] = v28;
          *v26 = v27;
          *a4 = v12;
          mdb_default_cmp(a1, v12);
          if (v16)
          {
            v4 = 0;
            ++*(_DWORD *)(a1 + 120);
            return v4;
          }
          return 0;
        }
LABEL_37:
        v12 = *(_DWORD *)(a1 + 120);
        goto LABEL_38;
      }
    }
    else
    {
      v4 = v20;
      if ((_DWORD)v20)
        return v4;
      if ((*(_WORD *)(*((_QWORD *)v67 + WORD1(v67[0]) + 1)
                     + *(unsigned __int16 *)(*((_QWORD *)v67 + WORD1(v67[0]) + 1)
                                           + 2 * *((unsigned __int16 *)&v67[16] + WORD1(v67[0]) + 4)
                                           + 16)
                     + 4) & 6) != 2)
        return 4294936512;
      v21 = strdup(__s);
      if (v21)
      {
        v22 = v21;
        v23 = 28;
        if (!v16)
          goto LABEL_38;
        goto LABEL_37;
      }
    }
    return 12;
  }
  if ((a3 & 0x40000) != 0)
    return 4294936512;
  else
    return 4294936498;
}

uint64_t mdb_default_cmp(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  void *v3;
  __int16 v4;
  void *v5;
  uint64_t (*v6)(_QWORD *, _QWORD *);

  v2 = *(_QWORD *)(result + 80);
  v3 = mdb_cmp_cint;
  v4 = *(_WORD *)(*(_QWORD *)(result + 88) + 48 * a2 + 4);
  if ((v4 & 8) != 0)
    v5 = mdb_cmp_cint;
  else
    v5 = mdb_cmp_memn;
  if ((v4 & 2) != 0)
    v5 = mdb_cmp_memnr;
  *(_QWORD *)(v2 + 48 * a2 + 16) = v5;
  if ((v4 & 0x40) != 0)
    v6 = mdb_cmp_memnr;
  else
    v6 = mdb_cmp_memn;
  if ((v4 & 0x10) != 0)
    v3 = mdb_cmp_int;
  if ((v4 & 0x20) != 0)
    v6 = (uint64_t (*)(_QWORD *, _QWORD *))v3;
  if ((v4 & 4) == 0)
    v6 = 0;
  *(_QWORD *)(v2 + 48 * a2 + 24) = v6;
  return result;
}

void mdb_dbi_close(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;

  if (a2 >= 2 && *(_DWORD *)(a1 + 36) > a2)
  {
    v2 = *(_QWORD *)(a1 + 136);
    v3 = *(void **)(v2 + 48 * a2 + 8);
    if (v3)
    {
      v4 = (_QWORD *)(v2 + 48 * a2);
      *v4 = 0;
      v4[1] = 0;
      v5 = *(_QWORD *)(a1 + 152);
      *(_WORD *)(*(_QWORD *)(a1 + 144) + 2 * a2) = 0;
      ++*(_DWORD *)(v5 + 4 * a2);
      free(v3);
    }
  }
}

uint64_t mdb_dbi_flags(uint64_t a1, unsigned int a2, int *a3)
{
  uint64_t result;

  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 0x10) == 0)
    return 22;
  result = 0;
  *a3 = *(_WORD *)(*(_QWORD *)(a1 + 88) + 48 * a2 + 4) & 0x7FFF;
  return result;
}

uint64_t mdb_drop(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t *i;
  int v9;
  uint64_t v10;
  _QWORD *v12;

  v3 = 22;
  if (a1)
  {
    if (a3 <= 1 && *(_DWORD *)(a1 + 120) > a2)
    {
      v12 = 0;
      if ((*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 0x10) != 0)
      {
        if ((*(_BYTE *)(a1 + 126) & 2) != 0)
        {
          return 13;
        }
        else if (*(_DWORD *)(*(_QWORD *)(a1 + 96) + 4 * a2) == *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 152)
                                                                            + 4 * a2))
        {
          v3 = mdb_cursor_open(a1, a2, &v12);
          if (!(_DWORD)v3)
          {
            v7 = mdb_drop0((uint64_t)v12, *(_WORD *)(v12[5] + 4) & 4);
            v3 = v7;
            for (i = *(uint64_t **)(*(_QWORD *)(a1 + 104) + 8 * a2); i; i = (uint64_t *)*i)
              *((_DWORD *)i + 17) &= 0xFFFFFFFC;
            if ((_DWORD)v7)
              goto LABEL_20;
            if (a2 >= 2 && a3)
            {
              v3 = mdb_del0(a1, 1u, (_QWORD *)v12[6], 0, 2);
              if (!(_DWORD)v3)
              {
                *(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) = 2;
                mdb_dbi_close(*(_QWORD *)(a1 + 32), a2);
                goto LABEL_20;
              }
              v9 = *(_DWORD *)(a1 + 124) | 2;
            }
            else
            {
              v3 = 0;
              *(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) |= 1u;
              v10 = *(_QWORD *)(a1 + 88) + 48 * a2;
              *(_WORD *)(v10 + 38) = 0;
              *(_OWORD *)(v10 + 22) = 0u;
              *(_OWORD *)(v10 + 6) = 0u;
              *(_QWORD *)(v10 + 40) = -1;
              v9 = *(_DWORD *)(a1 + 124) | 4;
            }
            *(_DWORD *)(a1 + 124) = v9;
LABEL_20:
            mdb_cursor_close(v12);
          }
        }
        else
        {
          return 4294936516;
        }
      }
    }
  }
  return v3;
}

uint64_t mdb_set_compare(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t result;

  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 0x10) == 0)
    return 22;
  result = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 80) + 48 * a2 + 16) = a3;
  return result;
}

uint64_t mdb_set_dupsort(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t result;

  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 0x10) == 0)
    return 22;
  result = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 80) + 48 * a2 + 24) = a3;
  return result;
}

uint64_t mdb_set_relfunc(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t result;

  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 0x10) == 0)
    return 22;
  result = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 80) + 48 * a2 + 32) = a3;
  return result;
}

uint64_t mdb_set_relctx(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t result;

  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 0x10) == 0)
    return 22;
  result = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 80) + 48 * a2 + 40) = a3;
  return result;
}

uint64_t mdb_reader_pid(uint64_t a1, int a2, int a3)
{
  uint64_t v5;
  int i;
  uint64_t result;
  int v9;
  uint64_t v10;
  __int128 v11;

  v5 = a3;
  v10 = a3;
  v11 = xmmword_10001B910;
  WORD6(v11) = 3;
  for (i = fcntl(*(_DWORD *)(a1 + 4), a2, &v10); i; i = fcntl(*(_DWORD *)(a1 + 4), a2, &v10))
  {
    result = *__error();
    if ((_DWORD)result != 4)
      return result;
    v10 = v5;
    v11 = xmmword_10001B910;
    WORD6(v11) = 3;
  }
  v9 = a2 == 7 && WORD6(v11) != 2;
  return (v9 << 31 >> 31);
}

void mdb_dpage_free(uint64_t a1, _QWORD *a2)
{
  if ((*((_WORD *)a2 + 5) & 4) != 0 && *((_DWORD *)a2 + 3) != 1)
  {
    free(a2);
  }
  else
  {
    *a2 = *(_QWORD *)(a1 + 192);
    *(_QWORD *)(a1 + 192) = a2;
  }
}

uint64_t mdb_page_search(uint64_t a1, _QWORD *a2, char a3)
{
  uint64_t v4;
  uint64_t result;
  unint64_t v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  int v14;
  uint64_t v15;
  __int128 *v16;
  _OWORD v17[24];
  uint64_t v18;

  v4 = *(_QWORD *)(a1 + 24);
  if ((*(_BYTE *)(v4 + 124) & 0x13) != 0)
    return 4294936514;
  if ((**(_BYTE **)(a1 + 56) & 2) == 0)
    goto LABEL_5;
  v18 = 0;
  memset(v17, 0, sizeof(v17));
  if (*(_DWORD *)(*(_QWORD *)(v4 + 96) + 4 * *(unsigned int *)(a1 + 32)) != *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 152)
                                                                                         + 4
                                                                                         * *(unsigned int *)(a1 + 32)))
    return 4294936516;
  mdb_cursor_init(v17, v4, 1, 0);
  result = mdb_page_search(v17, *(_QWORD *)(a1 + 48), 0);
  if (!(_DWORD)result)
  {
    v15 = 0;
    v16 = 0;
    v14 = 0;
    v10 = mdb_node_search((uint64_t)v17, *(_QWORD **)(a1 + 48), &v14);
    if (!v14)
      return 4294936498;
    if ((*((_WORD *)v10 + 2) & 6) != 2)
      return 4294936512;
    result = mdb_node_read((uint64_t)v17, (unsigned int *)v10, &v15);
    if ((_DWORD)result)
      return result;
    v11 = *(_QWORD *)(a1 + 40);
    if ((*(_WORD *)(v11 + 4) & 0x7FFF) != *((_WORD *)v16 + 2))
      return 4294936512;
    v12 = *v16;
    v13 = v16[2];
    *(_OWORD *)(v11 + 16) = v16[1];
    *(_OWORD *)(v11 + 32) = v13;
    *(_OWORD *)v11 = v12;
    **(_BYTE **)(a1 + 56) &= ~2u;
LABEL_5:
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40);
    if (v8 != -1)
    {
      v9 = *(_QWORD **)(a1 + 72);
      if (v9 && *v9 == v8 || (result = mdb_page_get(a1, v8, (unint64_t *)(a1 + 72), 0), !(_DWORD)result))
      {
        *(_DWORD *)(a1 + 64) = 1;
        if ((a3 & 1) == 0 || (result = mdb_page_touch(a1), !(_DWORD)result))
        {
          if ((a3 & 2) != 0)
            return 0;
          else
            return mdb_page_search_root(a1, a2, a3);
        }
      }
      return result;
    }
    return 4294936498;
  }
  return result;
}

char *mdb_node_search(uint64_t a1, _QWORD *a2, int *a3)
{
  unsigned __int16 *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  uint64_t (*v11)(_QWORD *, uint64_t);
  int *v12;
  uint64_t v13;
  char *v14;
  int v15;
  int v16;
  int *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v5 = *(unsigned __int16 **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  v20 = 0;
  v21 = 0;
  v6 = v5[6] - 16;
  v7 = v6 >> 1;
  v8 = v5[5];
  v9 = ((v8 >> 1) & 1) == 0;
  v10 = (v6 >> 1) - 1;
  v11 = *(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(a1 + 48) + 16);
  if (v11 == mdb_cmp_cint)
  {
    if ((v8 & 1) != 0)
    {
      if (*(unsigned __int16 *)((char *)v5 + v5[9] + 6) == 8)
        v11 = (uint64_t (*)(_QWORD *, uint64_t))mdb_cmp_long;
      else
        v11 = (uint64_t (*)(_QWORD *, uint64_t))mdb_cmp_int;
      if ((v8 & 0x20) == 0)
        goto LABEL_3;
    }
    else
    {
      v11 = mdb_cmp_cint;
      if ((v8 & 0x20) == 0)
        goto LABEL_3;
    }
  }
  else if ((v8 & 0x20) == 0)
  {
LABEL_3:
    if (v9 < v7)
    {
      v19 = v5[6] - 16;
      v12 = a3;
      while (1)
      {
        LODWORD(v13) = (int)(v10 + v9) >> 1;
        v14 = (char *)v5 + v5[v13 + 8];
        v20 = *((unsigned __int16 *)v14 + 3);
        v21 = (uint64_t)(v14 + 8);
        v15 = v11(a2, (uint64_t)&v20);
        if (!v15)
          break;
        if (v15 <= 0)
          v10 = v13 - 1;
        else
          v9 = v13 + 1;
        if ((int)v9 > v10)
        {
          a3 = v12;
          goto LABEL_27;
        }
      }
      v16 = 1;
      a3 = v12;
LABEL_43:
      v6 = v19;
      if (!a3)
        goto LABEL_36;
LABEL_33:
      if (v6 <= 1)
        v16 = 0;
      *a3 = v16;
      goto LABEL_36;
    }
    LODWORD(v13) = 0;
    v14 = 0;
LABEL_32:
    v16 = 1;
    if (!a3)
      goto LABEL_36;
    goto LABEL_33;
  }
  v20 = **(unsigned int **)(a1 + 40);
  v14 = (char *)v5 + v5[8];
  if (v9 >= v7)
  {
    LODWORD(v13) = 0;
    goto LABEL_32;
  }
  v19 = v6;
  v18 = a3;
  do
  {
    v13 = ((int)(v10 + v9) >> 1);
    v21 = (uint64_t)v5 + v20 * v13 + 16;
    v15 = v11(a2, (uint64_t)&v20);
    if (!v15)
    {
      v16 = 1;
      a3 = v18;
      goto LABEL_43;
    }
    if (v15 <= 0)
      v10 = v13 - 1;
    else
      v9 = v13 + 1;
  }
  while ((int)v9 <= v10);
  a3 = v18;
LABEL_27:
  v6 = v19;
  if (v15 < 1 || (LODWORD(v13) = v13 + 1, (v5[5] & 0x20) != 0))
  {
    v16 = 0;
    if (a3)
      goto LABEL_33;
  }
  else
  {
    v16 = 0;
    v14 = (char *)v5 + v5[v13 + 8];
    if (a3)
      goto LABEL_33;
  }
LABEL_36:
  *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v13;
  if (v13 >= v7)
    return 0;
  else
    return v14;
}

uint64_t mdb_page_touch(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __int16 v4;
  uint64_t **v5;
  uint64_t result;
  char *v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  char *v16;
  uint64_t v17;
  uint64_t *v18;
  unsigned int v19;
  uint64_t *v20;
  char **v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  char **v29;
  uint64_t v30;
  unint64_t v31[2];
  void *__dst;

  v2 = *(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  __dst = 0;
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_WORD *)(v2 + 10);
  if ((v4 & 0x10) == 0)
  {
    if ((*(_BYTE *)(v3 + 124) & 8) != 0)
    {
      result = mdb_page_unspill(*(_QWORD *)(a1 + 24), v2, (char **)&__dst);
      if ((_DWORD)result)
        goto LABEL_15;
      v7 = (char *)__dst;
      if (__dst)
      {
LABEL_20:
        v17 = *(unsigned __int16 *)(a1 + 66);
        *(_QWORD *)(a1 + 8 * v17 + 72) = v7;
        v18 = *(uint64_t **)(*(_QWORD *)(v3 + 104) + 8 * *(unsigned int *)(a1 + 32));
        if ((*(_BYTE *)(a1 + 68) & 4) != 0)
        {
          if (v18)
          {
            v26 = *(unsigned __int16 *)(a1 + 64);
            do
            {
              v27 = v18[2];
              if (*(unsigned __int16 *)(v27 + 64) >= v26)
              {
                v28 = v27 + 8 * v17;
                v30 = *(_QWORD *)(v28 + 72);
                v29 = (char **)(v28 + 72);
                if (v30 == v2)
                  *v29 = v7;
              }
              v18 = (uint64_t *)*v18;
            }
            while (v18);
          }
        }
        else if (v18)
        {
          v19 = *(unsigned __int16 *)(a1 + 64);
          do
          {
            if (v18 != (uint64_t *)a1 && *((unsigned __int16 *)v18 + 32) >= v19)
            {
              v20 = &v18[v17];
              v22 = v20[9];
              v21 = (char **)(v20 + 9);
              if (v22 == v2)
              {
                *v21 = v7;
                if ((*((_WORD *)v7 + 5) & 2) != 0)
                {
                  v23 = v18[2];
                  if (v23)
                  {
                    if ((*(_BYTE *)(v23 + 68) & 1) != 0)
                    {
                      v24 = *((unsigned __int16 *)v18 + v17 + 164);
                      if (v24 < (*((unsigned __int16 *)v7 + 6) - 16) >> 1)
                      {
                        v25 = &v7[*(unsigned __int16 *)&v7[2 * v24 + 16]];
                        if ((*((_WORD *)v25 + 2) & 6) == 4)
                          *(_QWORD *)(v23 + 72) = &v25[*((unsigned __int16 *)v25 + 3) + 8];
                      }
                    }
                  }
                }
              }
            }
            v18 = (uint64_t *)*v18;
          }
          while (v18);
        }
        return 0;
      }
    }
    v5 = (uint64_t **)(v3 + 40);
    result = mdb_midl_need((_DWORD **)(v3 + 40), 1);
    if (!(_DWORD)result)
    {
      result = mdb_page_alloc(a1, 1, (char **)&__dst);
      if (!(_DWORD)result)
      {
        v7 = (char *)__dst;
        v8 = *(_QWORD *)__dst;
        v9 = *v5;
        v10 = **v5 + 1;
        *v9 = v10;
        v9[v10] = *(_QWORD *)v2;
        if (*(_WORD *)(a1 + 66))
        {
          v11 = *(unsigned __int16 *)(a1 + 66) - 1;
          v12 = *(_QWORD *)(a1 + 8 * v11 + 72);
          v13 = v12 + *(unsigned __int16 *)(v12 + 2 * *(unsigned __int16 *)(a1 + 2 * v11 + 328) + 16);
          *(_DWORD *)v13 = v8;
          *(_WORD *)(v13 + 4) = WORD2(v8);
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = v8;
        }
        goto LABEL_18;
      }
    }
LABEL_15:
    *(_DWORD *)(v3 + 124) |= 2u;
    return result;
  }
  result = 0;
  if ((v4 & 0x40) == 0 && *(_QWORD *)v3)
  {
    v14 = *(unsigned int **)(v3 + 72);
    v8 = *(_QWORD *)v2;
    if (*(_QWORD *)v14)
    {
      v15 = mdb_mid2l_search(*(unsigned int **)(v3 + 72), *(_QWORD *)v2);
      if (*(_QWORD *)v14 >= (unint64_t)v15 && *(_QWORD *)&v14[4 * v15] == v8)
      {
        if (v2 != *(_QWORD *)&v14[4 * v15 + 2])
        {
          *(_DWORD *)(a1 + 68) &= 0xFFFFFFFC;
          *(_DWORD *)(v3 + 124) |= 2u;
          return 4294936517;
        }
        return 0;
      }
    }
    v16 = mdb_page_malloc(v3, 1u);
    if (v16)
    {
      v7 = v16;
      v31[0] = v8;
      v31[1] = (unint64_t)v16;
      mdb_mid2l_insert(v14, v31);
LABEL_18:
      mdb_page_copy(v7, (_WORD *)v2, *(_DWORD *)(*(_QWORD *)(v3 + 32) + 16));
      *(_QWORD *)v7 = v8;
      *((_WORD *)v7 + 5) |= 0x10u;
      goto LABEL_20;
    }
    return 12;
  }
  return result;
}

uint64_t mdb_page_search_root(uint64_t a1, _QWORD *a2, char a3)
{
  unint64_t v4;
  unint64_t v5;
  __int16 v6;
  int v9;
  unsigned int v10;
  unsigned int *v11;
  uint64_t result;
  int v13;
  unint64_t v14;

  v4 = *(unsigned __int16 *)(a1 + 66);
  v5 = *(_QWORD *)(a1 + 8 * v4 + 72);
  v14 = v5;
  v6 = *(_WORD *)(v5 + 10);
  if ((v6 & 1) != 0)
  {
    v9 = a3 & 0xC;
    do
    {
      if (v9)
      {
        if ((a3 & 8) != 0)
        {
          v10 = ((*(unsigned __int16 *)(v5 + 12) + 131056) >> 1) - 1;
          if ((*(_BYTE *)(a1 + 68) & 1) != 0
            && *(unsigned __int16 *)(a1 + 2 * (unsigned __int16)v4 + 328) == (unsigned __int16)v10)
          {
            v4 = *(unsigned __int16 *)(a1 + 64);
            *(_WORD *)(a1 + 64) = v4 + 1;
            *(_WORD *)(a1 + 66) = v4;
            v5 = *(_QWORD *)(a1 + 8 * v4 + 72);
            v14 = v5;
            if ((a3 & 1) != 0)
              goto LABEL_16;
            goto LABEL_18;
          }
        }
        else
        {
          LOWORD(v10) = 0;
        }
      }
      else
      {
        v13 = 0;
        if (mdb_node_search(a1, a2, &v13))
          LOWORD(v10) = *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) - (v13 == 0);
        else
          v10 = ((*(unsigned __int16 *)(v5 + 12) + 131056) >> 1) - 1;
      }
      v11 = (unsigned int *)(v5 + *(unsigned __int16 *)(v5 + 2 * (unsigned __int16)v10 + 16));
      result = mdb_page_get(a1, *v11 | ((unint64_t)*((unsigned __int16 *)v11 + 2) << 32), &v14, 0);
      if ((_DWORD)result)
        return result;
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v10;
      v4 = *(unsigned __int16 *)(a1 + 64);
      if (v4 > 0x1F)
      {
        *(_DWORD *)(*(_QWORD *)(a1 + 24) + 124) |= 2u;
        return 4294936509;
      }
      v5 = v14;
      *(_WORD *)(a1 + 64) = v4 + 1;
      *(_WORD *)(a1 + 66) = v4;
      *(_QWORD *)(a1 + 8 * v4 + 72) = v5;
      *(_WORD *)(a1 + 2 * v4 + 328) = 0;
      if ((a3 & 1) != 0)
      {
LABEL_16:
        result = mdb_page_touch(a1);
        if ((_DWORD)result)
          return result;
        v4 = *(unsigned __int16 *)(a1 + 66);
        v5 = *(_QWORD *)(a1 + 8 * v4 + 72);
        v14 = v5;
      }
LABEL_18:
      v6 = *(_WORD *)(v5 + 10);
    }
    while ((v6 & 1) != 0);
  }
  if ((v6 & 2) != 0)
  {
    result = 0;
    *(_DWORD *)(a1 + 68) = *(_DWORD *)(a1 + 68) & 0xFFFFFFFC | 1;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 24) + 124) |= 2u;
    return 4294936500;
  }
  return result;
}

void *mdb_page_copy(char *__dst, _WORD *__src, int a3)
{
  _WORD *v4;
  char *v5;
  unsigned __int16 v6;
  int v7;
  uint64_t v8;
  size_t v9;

  v4 = __src;
  v5 = __dst;
  v6 = __src[7];
  v7 = (unsigned __int16)__src[6];
  if (((v6 - (_WORD)v7) & 0xFFF8) == 0 || (__src[5] & 0x20) != 0)
  {
    v9 = a3 - ((v6 - (_WORD)v7) & 0xFFF8u);
  }
  else
  {
    v8 = v6 & 0xFFF8;
    memcpy(__dst, __src, (v7 + 7) & 0x1FFF8);
    __dst = &v5[v8];
    __src = (_WORD *)((char *)v4 + v8);
    v9 = (a3 - v8);
  }
  return memcpy(__dst, __src, v9);
}

uint64_t mdb_env_reader_dest(uint64_t a1)
{
  int v2;
  uint64_t result;

  v2 = *(_DWORD *)(a1 + 8);
  result = getpid();
  if (v2 == (_DWORD)result)
    *(_DWORD *)(a1 + 8) = 0;
  return result;
}

uint64_t mdb_pages_xkeep(uint64_t a1, int a2, int a3)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  unsigned int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t result;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  __int16 v24;
  int v26;
  unint64_t v27;

  v5 = *(_QWORD *)(a1 + 24);
  v27 = 0;
  v26 = 0;
  v6 = *(_DWORD *)(v5 + 120);
  v7 = a1;
  v8 = v6;
  do
  {
LABEL_2:
    if ((*(_BYTE *)(v7 + 68) & 1) != 0)
    {
      v12 = v7;
      do
      {
        v13 = *(unsigned __int16 *)(v12 + 64);
        if (*(_WORD *)(v12 + 64))
        {
          v14 = 0;
          do
          {
            v15 = *(_QWORD *)(v12 + 72 + 8 * v14);
            v16 = *(_WORD *)(v15 + 10);
            if ((v16 & 0xC050) == a2)
              *(_WORD *)(v15 + 10) = v16 ^ 0x8000;
            ++v14;
          }
          while (v13 != v14);
          v17 = v14 - 1;
        }
        else
        {
          v15 = 0;
          v17 = -1;
        }
        v18 = *(_QWORD *)(v12 + 16);
        if (!v18)
          break;
        if (!v15)
          break;
        if ((*(_DWORD *)(v18 + 68) & 1) == 0)
          break;
        if ((*(_WORD *)(v15 + 10) & 2) == 0)
          break;
        v19 = *(_WORD *)(v15 + *(unsigned __int16 *)(v15 + 2 * *(unsigned __int16 *)(v12 + 2 * v17 + 328) + 16) + 4);
        v12 = *(_QWORD *)(v12 + 16);
      }
      while ((v19 & 2) != 0);
    }
    v7 = *(_QWORD *)v7;
    if (v7)
      v9 = v7 == a1;
    else
      v9 = 1;
  }
  while (!v9);
  v10 = 8 * v8 - 8;
  while (v10 != -8)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(v5 + 104) + v10);
    v10 -= 8;
    --v8;
    if (v7)
      v11 = v7 == a1;
    else
      v11 = 1;
    if (!v11)
      goto LABEL_2;
  }
  result = 0;
  if (a3 && v6)
  {
    v21 = 0;
    v22 = 40;
    do
    {
      if ((*(_BYTE *)(*(_QWORD *)(v5 + 112) + v21) & 1) != 0)
      {
        v23 = *(_QWORD *)(*(_QWORD *)(v5 + 88) + v22);
        if (v23 != -1)
        {
          result = mdb_page_get(a1, v23, &v27, &v26);
          if ((_DWORD)result)
            return result;
          v24 = *(_WORD *)(v27 + 10);
          if ((v24 & 0xC050) == a2 && v26 <= 1)
            *(_WORD *)(v27 + 10) = v24 ^ 0x8000;
        }
      }
      ++v21;
      v22 += 48;
    }
    while (v21 < *(unsigned int *)(v5 + 120));
    return 0;
  }
  return result;
}

unint64_t mdb_find_oldest(uint64_t a1)
{
  uint64_t v1;
  unint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v1 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD *)(a1 + 24) - 1;
  v3 = *(_QWORD *)(v1 + 64);
  if (v3)
  {
    v4 = *(unsigned int *)(v3 + 16);
    if ((int)v4 >= 1)
    {
      v5 = v3 + 192;
      v6 = v4 + 1;
      do
      {
        v7 = v5 + ((unint64_t)(v6 - 2) << 6);
        if (*(_DWORD *)(v7 + 8))
        {
          v8 = *(_QWORD *)v7;
          if (result >= v8)
            result = v8;
        }
        --v6;
      }
      while (v6 > 1);
    }
  }
  return result;
}

uint64_t mdb_rebalance(uint64_t a1)
{
  unint64_t *v2;
  uint64_t v3;
  _WORD *v4;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int16 v9;
  int v10;
  unint64_t v11;
  __int16 v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t updated;
  unsigned int v16;
  _QWORD *v17;
  _QWORD *v18;
  int v19;
  int v20;
  int v21;
  unsigned __int16 *v22;
  unsigned __int16 v23;
  _QWORD *v24;
  unsigned __int16 v25;
  unsigned int *v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int v29;
  unsigned __int16 v30;
  unsigned int *v31;
  unint64_t v32;
  __int16 v33;
  int v34;
  uint64_t v35;
  __int16 v36;
  unsigned int *v37;
  uint64_t v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unsigned int *v44;
  __int128 *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  _QWORD *v52;
  int v53;
  _QWORD *v54;
  unint64_t v55;
  size_t v56;
  unint64_t v57;
  int64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 *v61;
  uint64_t v62;
  char v63;
  __int128 *v64;
  char *v65;
  unsigned int v66;
  _QWORD *v67;
  _QWORD *v68;
  uint64_t v69;
  char *v70;
  _WORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  __int128 *v79;
  char v80;
  __int128 *v81;
  _QWORD *v82;
  _QWORD *v83;
  uint64_t v84;
  __int16 *v85;
  __int16 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v97;
  uint64_t v98;
  unsigned int *v99;
  __int16 v100;
  uint64_t v101;
  uint64_t v102;
  unsigned int *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  __int128 *v108;
  uint64_t v109;
  uint64_t v110;
  __int16 v111;
  __int128 *v112;
  uint64_t v113;
  uint64_t v114;
  __int16 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _OWORD v120[20];
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  uint64_t v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  uint64_t v171;
  size_t v172;
  uint64_t v173;
  unint64_t v174;
  unsigned int *v175;

  v121 = 0;
  memset(v120, 0, sizeof(v120));
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v2 = (unint64_t *)(a1 + 72);
  v3 = *(unsigned __int16 *)(a1 + 66);
  v4 = *(_WORD **)(a1 + 72 + 8 * v3);
  if ((v4[5] & 1) != 0)
    v5 = 2;
  else
    v5 = 1;
  if ((v4[5] & 1) != 0)
    v6 = 1;
  else
    v6 = 250;
  v7 = *(_QWORD *)(a1 + 24);
  v8 = (*(_DWORD *)(*(_QWORD *)(v7 + 32) + 16) - 16);
  v9 = v4[7];
  v10 = (unsigned __int16)v4[6];
  if (1000 * (unint64_t)(v8 - (unsigned __int16)(v9 - v10)) / v8 >= v6
    && v5 <= (v10 - 16) >> 1)
  {
    return 0;
  }
  if (*(unsigned __int16 *)(a1 + 64) > 1u)
  {
    mdb_cursor_copy(a1, (uint64_t)&v116);
    v20 = *(unsigned __int16 *)(a1 + 328 + 2 * v3);
    v21 = *(unsigned __int16 *)(a1 + 328 + 2 * (v3 - 1));
    *(_QWORD *)&v117 = 0;
    v22 = (unsigned __int16 *)&v120[16] + (v3 - 1) + 4;
    v23 = *v22;
    v24 = (_QWORD *)(a1 + 8 * (v3 - 1) + 72);
    if (v21)
    {
      v25 = v23 - 1;
      *v22 = v25;
      v26 = (unsigned int *)(*v24 + *(unsigned __int16 *)(*v24 + 2 * v25 + 16));
      updated = mdb_page_get(a1, *v26 | ((unint64_t)*((unsigned __int16 *)v26 + 2) << 32), (unint64_t *)v120 + WORD1(v120[0]) + 1, 0);
      if ((_DWORD)updated)
        return updated;
      v27 = WORD1(v120[0]);
      v28 = *((_QWORD *)v120 + WORD1(v120[0]) + 1);
      v29 = ((*(unsigned __int16 *)(v28 + 12) + 131056) >> 1) - 1;
      *((_WORD *)&v120[16] + WORD1(v120[0]) + 4) = ((*(unsigned __int16 *)(v28 + 12) + 131056) >> 1) - 1;
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = 0;
    }
    else
    {
      v30 = v23 + 1;
      *v22 = v30;
      v31 = (unsigned int *)(*v24 + *(unsigned __int16 *)(*v24 + 2 * v30 + 16));
      updated = mdb_page_get(a1, *v31 | ((unint64_t)*((unsigned __int16 *)v31 + 2) << 32), (unint64_t *)v120 + WORD1(v120[0]) + 1, 0);
      if ((_DWORD)updated)
        return updated;
      LOWORD(v29) = 0;
      v27 = WORD1(v120[0]);
      *((_WORD *)&v120[16] + WORD1(v120[0]) + 4) = 0;
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = (*(unsigned __int16 *)(*(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) + 12)
                                                                   + 131056) >> 1;
      v28 = *((_QWORD *)v120 + v27 + 1);
    }
    v32 = (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 32) + 16) - 16);
    v33 = *(_WORD *)(v28 + 14);
    v34 = *(unsigned __int16 *)(v28 + 12);
    if (1000 * (unint64_t)(v32 - (unsigned __int16)(v33 - v34)) / v32 < v6
      || v5 >= (v34 - 16) >> 1)
    {
      if (v21)
      {
        v45 = &v116;
        *((_WORD *)&v120[16] + v27 + 4) = *(_WORD *)(a1 + 2 * v27 + 328) + v29 + 1;
        v171 = 0;
        v170 = 0u;
        v169 = 0u;
        v20 += (v34 + 131056) >> 1;
        v168 = 0u;
        v167 = 0u;
        v166 = 0u;
        v165 = 0u;
        v164 = 0u;
        v163 = 0u;
        v162 = 0u;
        v160 = 0u;
        v161 = 0u;
        v158 = 0u;
        v159 = 0u;
        v156 = 0u;
        v157 = 0u;
        v154 = 0u;
        v155 = 0u;
        v152 = 0u;
        v153 = 0u;
        v150 = 0u;
        v151 = 0u;
        v148 = 0u;
        v149 = 0u;
        v147 = 0u;
        v46 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 104);
        v47 = v118;
        if ((BYTE4(v120[0]) & 4) != 0)
        {
          DWORD1(v151) = 1;
          *(_QWORD *)&v148 = &v116;
          v45 = &v147;
        }
        *(_QWORD *)v45 = *(_QWORD *)(v46 + 8 * v118);
        *(_QWORD *)(v46 + 8 * v47) = v45;
        updated = mdb_page_merge(a1, (uint64_t)&v116);
        *(_QWORD *)(v46 + 8 * v47) = *(_QWORD *)v45;
        mdb_cursor_copy((uint64_t)&v116, a1);
      }
      else
      {
        updated = mdb_page_merge((uint64_t)&v116, a1);
      }
      *(_DWORD *)(a1 + 68) &= ~2u;
      goto LABEL_119;
    }
    updated = mdb_page_touch((uint64_t)&v116);
    if ((_DWORD)updated)
      goto LABEL_117;
    updated = mdb_page_touch(a1);
    if ((_DWORD)updated)
      goto LABEL_117;
    v174 = 0;
    v175 = 0;
    v147 = 0u;
    v148 = 0u;
    v149 = 0u;
    v150 = 0u;
    v151 = 0u;
    v152 = 0u;
    v153 = 0u;
    v154 = 0u;
    v155 = 0u;
    v156 = 0u;
    v157 = 0u;
    v158 = 0u;
    v159 = 0u;
    v160 = 0u;
    v161 = 0u;
    v162 = 0u;
    v163 = 0u;
    v164 = 0u;
    v165 = 0u;
    v166 = 0u;
    v167 = 0u;
    v168 = 0u;
    v169 = 0u;
    v170 = 0u;
    v171 = 0;
    v35 = *((_QWORD *)v120 + WORD1(v120[0]) + 1);
    v36 = *(_WORD *)(v35 + 10);
    if ((v36 & 0x20) != 0)
    {
      v56 = 0;
      LODWORD(v39) = 0;
      v57 = v35
          + *((unsigned __int16 *)&v120[16] + WORD1(v120[0]) + 4)
          * (unint64_t)**((_DWORD **)&v118 + 1)
          + 16;
      v174 = **((_DWORD **)&v118 + 1);
      v175 = (unsigned int *)v57;
      v172 = 0;
      v173 = 0;
    }
    else
    {
      v37 = (unsigned int *)(v35
                           + *(unsigned __int16 *)(v35 + 2 * *((unsigned __int16 *)&v120[16] + WORD1(v120[0]) + 4) + 16));
      v38 = *v37;
      v39 = *((unsigned __int16 *)v37 + 2);
      if ((v36 & 1) == 0 || *((_WORD *)&v120[16] + WORD1(v120[0]) + 4))
      {
        v58 = *((unsigned __int16 *)v37 + 3);
        v174 = v58;
        v175 = v37 + 2;
      }
      else
      {
        v40 = v120[0];
        updated = mdb_page_search_lowest((uint64_t)&v116);
        if ((_DWORD)updated)
          goto LABEL_117;
        v41 = *((_QWORD *)v120 + WORD1(v120[0]) + 1);
        if ((*(_WORD *)(v41 + 10) & 0x20) != 0)
        {
          v43 = **((_DWORD **)&v118 + 1);
          v44 = (unsigned int *)(v41 + 16);
        }
        else
        {
          v42 = v41 + *(unsigned __int16 *)(v41 + 16);
          v43 = *(unsigned __int16 *)(v42 + 6);
          v44 = (unsigned int *)(v42 + 8);
        }
        v174 = v43;
        v175 = v44;
        LOWORD(v120[0]) = v40;
        WORD1(v120[0]) = v40 - 1;
        v58 = *((unsigned __int16 *)v37 + 3);
      }
      v56 = v38 | (v39 << 32);
      v172 = *v37;
      v173 = (uint64_t)v37 + v58 + 8;
    }
    *(_QWORD *)&v148 = 0;
    v59 = *(unsigned __int16 *)(a1 + 66);
    if ((*(_WORD *)(*(_QWORD *)(a1 + 8 * v59 + 72) + 10) & 1) != 0 && !*(_WORD *)(a1 + 2 * v59 + 328))
    {
      v77 = *(unsigned __int16 *)(a1 + 64);
      v122 = 0uLL;
      mdb_cursor_copy(a1, (uint64_t)&v147);
      v78 = mdb_page_search_lowest((uint64_t)&v147);
      if ((_DWORD)v78)
      {
        updated = v78;
        goto LABEL_117;
      }
      v104 = *((_QWORD *)&v151 + WORD1(v151) + 1);
      if ((*(_WORD *)(v104 + 10) & 0x20) != 0)
      {
        v106 = **((_DWORD **)&v149 + 1);
        v107 = v104 + 16;
      }
      else
      {
        v105 = v104 + *(unsigned __int16 *)(v104 + 16);
        v106 = *(unsigned __int16 *)(v105 + 6);
        v107 = v105 + 8;
      }
      *(_QWORD *)&v122 = v106;
      *((_QWORD *)&v122 + 1) = v107;
      LOWORD(v151) = v77;
      WORD1(v151) = v77 - 1;
      *((_WORD *)&v167 + (v77 - 1) + 4) = 0;
      updated = mdb_update_key((uint64_t)&v147, (uint64_t)&v122);
      if ((_DWORD)updated)
      {
LABEL_117:
        if (v21)
          LOWORD(v20) = v20 + 1;
LABEL_119:
        *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v20;
        return updated;
      }
      v59 = *(unsigned __int16 *)(a1 + 66);
    }
    updated = mdb_node_add(a1, *(unsigned __int16 *)(a1 + 2 * v59 + 328), (const void **)&v174, &v172, v56, v39);
    if (!(_DWORD)updated)
    {
      mdb_node_del(&v116, v174);
      v60 = *((_QWORD *)v120 + WORD1(v120[0]) + 1);
      if (v21)
      {
        v61 = *(__int128 **)(*(_QWORD *)(*((_QWORD *)&v117 + 1) + 104) + 8 * v118);
        if (v61)
        {
          v62 = *(_QWORD *)(a1 + 8 * WORD1(v120[0]) + 72);
          v63 = BYTE4(v120[0]);
          do
          {
            v64 = v61;
            if ((v63 & 4) != 0)
              v64 = (__int128 *)*((_QWORD *)v61 + 2);
            if ((*((_BYTE *)v64 + 68) & 1) != 0 && *((unsigned __int16 *)v64 + 33) >= WORD1(v120[0]))
            {
              if (v64 != (__int128 *)a1 && *((_QWORD *)v64 + WORD1(v120[0]) + 9) == v62)
              {
                v65 = (char *)v64 + 2 * WORD1(v120[0]);
                v66 = *((unsigned __int16 *)v65 + 164);
                if (v66 >= *(unsigned __int16 *)(a1 + 2 * WORD1(v120[0]) + 328))
                  *((_WORD *)v65 + 164) = v66 + 1;
              }
              if (v64 != &v116)
              {
                v67 = (_QWORD *)v64 + WORD1(v120[0]);
                v69 = v67[9];
                v68 = v67 + 9;
                if (v69 == v60)
                {
                  v70 = (char *)v64 + 2 * WORD1(v120[0]);
                  if (*((unsigned __int16 *)v70 + 164) == *((unsigned __int16 *)&v120[16] + WORD1(v120[0]) + 4))
                  {
                    v71 = v70 + 328;
                    v72 = *(unsigned __int16 *)(a1 + 66);
                    *v68 = *(_QWORD *)(a1 + 8 * v72 + 72);
                    *v71 = *(_WORD *)(a1 + 2 * v72 + 328);
                    ++*((_WORD *)v64 + WORD1(v120[0]) + 163);
                  }
                }
              }
              if ((*(_WORD *)(v60 + 10) & 2) != 0)
              {
                v73 = *((_QWORD *)v64 + 2);
                if (v73)
                {
                  if ((*(_BYTE *)(v73 + 68) & 1) != 0)
                  {
                    v74 = *((_QWORD *)v64 + WORD1(v120[0]) + 9);
                    v75 = *((unsigned __int16 *)v64 + WORD1(v120[0]) + 164);
                    if (v75 < (*(unsigned __int16 *)(v74 + 12) - 16) >> 1)
                    {
                      v76 = v74 + *(unsigned __int16 *)(v74 + 2 * v75 + 16);
                      if ((*(_WORD *)(v76 + 4) & 6) == 4)
                        *(_QWORD *)(v73 + 72) = v76 + *(unsigned __int16 *)(v76 + 6) + 8;
                    }
                  }
                }
              }
            }
            v61 = *(__int128 **)v61;
          }
          while (v61);
        }
      }
      else
      {
        v79 = *(__int128 **)(*(_QWORD *)(*((_QWORD *)&v117 + 1) + 104) + 8 * v118);
        if (v79)
        {
          v80 = BYTE4(v120[0]);
          do
          {
            v81 = v79;
            if ((v80 & 4) != 0)
              v81 = (__int128 *)*((_QWORD *)v79 + 2);
            if (v81 != &v116
              && (*((_BYTE *)v81 + 68) & 1) != 0
              && *((unsigned __int16 *)v81 + 33) >= WORD1(v120[0]))
            {
              v82 = (_QWORD *)v81 + WORD1(v120[0]);
              v84 = v82[9];
              v83 = v82 + 9;
              if (v84 == v60)
              {
                v85 = (__int16 *)v81 + WORD1(v120[0]) + 164;
                v86 = *v85;
                if (!*v85)
                {
                  v87 = *(unsigned __int16 *)(a1 + 66);
                  *v83 = *(_QWORD *)(a1 + 8 * v87 + 72);
                  *v85 = *(_WORD *)(a1 + 2 * v87 + 328);
                  v85 = (__int16 *)v81 + WORD1(v120[0]) + 163;
                  v86 = *v85;
                }
                *v85 = v86 - 1;
                if ((*(_WORD *)(v60 + 10) & 2) != 0)
                {
                  v88 = *((_QWORD *)v81 + 2);
                  if (v88)
                  {
                    if ((*(_BYTE *)(v88 + 68) & 1) != 0)
                    {
                      v89 = *((_QWORD *)v81 + WORD1(v120[0]) + 9);
                      v90 = *((unsigned __int16 *)v81 + WORD1(v120[0]) + 164);
                      if (v90 < (*(unsigned __int16 *)(v89 + 12) - 16) >> 1)
                      {
                        v91 = v89 + *(unsigned __int16 *)(v89 + 2 * v90 + 16);
                        if ((*(_WORD *)(v91 + 4) & 6) == 4)
                          *(_QWORD *)(v88 + 72) = v91 + *(unsigned __int16 *)(v91 + 6) + 8;
                      }
                    }
                  }
                }
              }
            }
            v79 = *(__int128 **)v79;
          }
          while (v79);
        }
      }
      v92 = WORD1(v120[0]);
      v93 = (char *)&v116 + 2 * WORD1(v120[0]);
      if (!*((_WORD *)v93 + 164))
      {
        if (*((_WORD *)v93 + 163))
        {
          v97 = *((_QWORD *)v120 + WORD1(v120[0]) + 1);
          if ((*(_WORD *)(v97 + 10) & 0x20) != 0)
          {
            v99 = (unsigned int *)(v97 + 16);
          }
          else
          {
            v98 = v97 + *(unsigned __int16 *)(v97 + 16);
            v174 = *(unsigned __int16 *)(v98 + 6);
            v99 = (unsigned int *)(v98 + 8);
          }
          v175 = v99;
          v108 = &v147;
          mdb_cursor_copy((uint64_t)&v116, (uint64_t)&v147);
          LOWORD(v151) = v151 - 1;
          --WORD1(v151);
          v146 = 0;
          v144 = 0u;
          v145 = 0u;
          v142 = 0u;
          v143 = 0u;
          v140 = 0u;
          v141 = 0u;
          v138 = 0u;
          v139 = 0u;
          v136 = 0u;
          v137 = 0u;
          v134 = 0u;
          v135 = 0u;
          v132 = 0u;
          v133 = 0u;
          v130 = 0u;
          v131 = 0u;
          v128 = 0u;
          v129 = 0u;
          v126 = 0u;
          v127 = 0u;
          v124 = 0u;
          v125 = 0u;
          v122 = 0u;
          v123 = 0u;
          v109 = *(_QWORD *)(*((_QWORD *)&v148 + 1) + 104);
          v110 = v149;
          if ((BYTE4(v151) & 4) != 0)
          {
            DWORD1(v126) = 1;
            *(_QWORD *)&v123 = &v147;
            v108 = &v122;
          }
          *(_QWORD *)v108 = *(_QWORD *)(v109 + 8 * v149);
          *(_QWORD *)(v109 + 8 * v110) = v108;
          updated = mdb_update_key((uint64_t)&v147, (uint64_t)&v174);
          *(_QWORD *)(v109 + 8 * v110) = *(_QWORD *)v108;
          if ((_DWORD)updated)
            goto LABEL_117;
          v92 = WORD1(v120[0]);
        }
        if ((*(_WORD *)(*((_QWORD *)v120 + v92 + 1) + 10) & 1) != 0)
        {
          v111 = *((_WORD *)&v120[16] + v92 + 4);
          v122 = 0uLL;
          *((_WORD *)&v120[16] + v92 + 4) = 0;
          mdb_update_key((uint64_t)&v116, (uint64_t)&v122);
          LODWORD(v92) = WORD1(v120[0]);
          *((_WORD *)&v120[16] + WORD1(v120[0]) + 4) = v111;
        }
      }
      v94 = *(unsigned __int16 *)(a1 + 66);
      v95 = a1 + 2 * v94;
      if (*(_WORD *)(v95 + 328))
        goto LABEL_116;
      if (*(_WORD *)(v95 + 326))
      {
        v100 = *(_WORD *)(*((_QWORD *)v120 + v92 + 1) + 10);
        v101 = *(_QWORD *)(a1 + 8 * v94 + 72);
        if ((v100 & 0x20) != 0)
        {
          v103 = (unsigned int *)(v101 + 16);
        }
        else
        {
          v102 = v101 + *(unsigned __int16 *)(v101 + 16);
          v174 = *(unsigned __int16 *)(v102 + 6);
          v103 = (unsigned int *)(v102 + 8);
        }
        v175 = v103;
        v112 = &v147;
        mdb_cursor_copy(a1, (uint64_t)&v147);
        LOWORD(v151) = v151 - 1;
        --WORD1(v151);
        v146 = 0;
        v144 = 0u;
        v145 = 0u;
        v142 = 0u;
        v143 = 0u;
        v140 = 0u;
        v141 = 0u;
        v138 = 0u;
        v139 = 0u;
        v136 = 0u;
        v137 = 0u;
        v134 = 0u;
        v135 = 0u;
        v132 = 0u;
        v133 = 0u;
        v130 = 0u;
        v131 = 0u;
        v128 = 0u;
        v129 = 0u;
        v126 = 0u;
        v127 = 0u;
        v124 = 0u;
        v125 = 0u;
        v122 = 0u;
        v123 = 0u;
        v113 = *(_QWORD *)(*((_QWORD *)&v148 + 1) + 104);
        v114 = v149;
        if ((BYTE4(v151) & 4) != 0)
        {
          DWORD1(v126) = 1;
          *(_QWORD *)&v123 = &v147;
          v112 = &v122;
        }
        *(_QWORD *)v112 = *(_QWORD *)(v113 + 8 * v149);
        *(_QWORD *)(v113 + 8 * v114) = v112;
        updated = mdb_update_key((uint64_t)&v147, (uint64_t)&v174);
        *(_QWORD *)(v113 + 8 * v114) = *(_QWORD *)v112;
        if ((_DWORD)updated)
          goto LABEL_117;
        v94 = *(unsigned __int16 *)(a1 + 66);
      }
      if ((*(_WORD *)(*(_QWORD *)(a1 + 8 * v94 + 72) + 10) & 1) == 0)
      {
LABEL_116:
        updated = 0;
      }
      else
      {
        v115 = *(_WORD *)(a1 + 328 + 2 * v94);
        v122 = 0uLL;
        *(_WORD *)(a1 + 328 + 2 * v94) = 0;
        mdb_update_key(a1, (uint64_t)&v122);
        updated = 0;
        *(_WORD *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66)) = v115;
      }
    }
    goto LABEL_117;
  }
  v11 = *v2;
  v12 = *(_WORD *)(*v2 + 10);
  if ((v12 & 0x40) != 0)
    return 0;
  v13 = *(unsigned __int16 *)(v11 + 12) - 16;
  if (v13 <= 1)
  {
    v14 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(v14 + 40) = -1;
    *(_WORD *)(v14 + 6) = 0;
    *(_QWORD *)(v14 + 16) = 0;
    updated = mdb_midl_append((unint64_t **)(v7 + 40), *(_QWORD *)v11);
    if ((_DWORD)updated)
      return updated;
    v16 = *(_DWORD *)(a1 + 68) & 0xFFFFFFFE;
    *(_DWORD *)(a1 + 64) = 0;
    *(_DWORD *)(a1 + 68) = v16;
    v17 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
    if (v17)
    {
      do
      {
        v18 = v17;
        if ((*(_BYTE *)(a1 + 68) & 4) != 0)
          v18 = (_QWORD *)v17[2];
        v19 = *((_DWORD *)v18 + 17);
        if ((v19 & 1) != 0
          && *((unsigned __int16 *)v18 + 32) >= *(unsigned __int16 *)(a1 + 64)
          && v18[9] == v11)
        {
          *((_DWORD *)v18 + 16) = 0;
          *((_DWORD *)v18 + 17) = v19 & 0xFFFFFFFE;
        }
        updated = 0;
        v17 = (_QWORD *)*v17;
      }
      while (v17);
      return updated;
    }
    return 0;
  }
  updated = 0;
  if ((v12 & 1) == 0)
    return updated;
  if ((v13 & 0xFFFFFFFE) != 2)
    return updated;
  updated = mdb_midl_append((unint64_t **)(v7 + 40), *(_QWORD *)v11);
  if ((_DWORD)updated)
    return updated;
  v48 = *(unsigned int *)(v11 + *(unsigned __int16 *)(v11 + 16)) | ((unint64_t)*(unsigned __int16 *)(v11 + *(unsigned __int16 *)(v11 + 16) + 4) << 32);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = v48;
  updated = mdb_page_get(a1, v48, v2, 0);
  if ((_DWORD)updated)
    return updated;
  v49 = *(_QWORD *)(a1 + 40);
  --*(_WORD *)(v49 + 6);
  --*(_QWORD *)(v49 + 8);
  *(_WORD *)(a1 + 328) = *(_WORD *)(a1 + 330);
  if (*(unsigned __int16 *)(v49 + 6) >= 2u)
  {
    v50 = 0;
    do
    {
      *(_QWORD *)(a1 + 8 * v50 + 80) = *(_QWORD *)(a1 + 8 * v50 + 88);
      *(_WORD *)(a1 + 2 * v50 + 330) = *(_WORD *)(a1 + 2 * v50 + 332);
      v51 = v50 + 2;
      ++v50;
    }
    while (v51 < *(unsigned __int16 *)(v49 + 6));
  }
  v52 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
  if (!v52)
    return 0;
  v53 = *(_DWORD *)(a1 + 68);
  do
  {
    v54 = v52;
    if ((v53 & 4) != 0)
      v54 = (_QWORD *)v52[2];
    if (v54 != (_QWORD *)a1 && (*((_BYTE *)v54 + 68) & 1) != 0 && v54[9] == v11)
    {
      if (*(_WORD *)(v49 + 6))
      {
        v55 = 0;
        do
        {
          v54[v55 + 9] = v54[v55 + 10];
          *((_WORD *)v54 + v55 + 164) = *((_WORD *)v54 + v55 + 165);
          v49 = *(_QWORD *)(a1 + 40);
          ++v55;
        }
        while (v55 < *(unsigned __int16 *)(v49 + 6));
      }
      --*((_WORD *)v54 + 32);
      --*((_WORD *)v54 + 33);
    }
    updated = 0;
    v52 = (_QWORD *)*v52;
  }
  while (v52);
  return updated;
}

uint64_t mdb_cursor_copy(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int16 v5;

  *(_QWORD *)(a2 + 24) = *(_QWORD *)(result + 24);
  *(_DWORD *)(a2 + 32) = *(_DWORD *)(result + 32);
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(result + 40);
  *(_DWORD *)(a2 + 64) = *(_DWORD *)(result + 64);
  *(_DWORD *)(a2 + 68) = *(_DWORD *)(result + 68);
  if (*(_WORD *)(result + 64))
  {
    v2 = 0;
    v3 = result + 328;
    v4 = a2 + 328;
    do
    {
      v5 = *(_WORD *)(v3 + 2 * v2);
      *(_QWORD *)(v4 + 8 * v2 - 256) = *(_QWORD *)(v3 + 8 * v2 - 256);
      *(_WORD *)(v4 + 2 * v2++) = v5;
    }
    while (v2 < *(unsigned __int16 *)(result + 64));
  }
  return result;
}

uint64_t mdb_page_merge(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  unsigned int v7;
  unsigned __int16 v8;
  unsigned int v9;
  unsigned int *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  unsigned __int16 v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  __int16 v22;
  _QWORD *v23;
  unsigned int v24;
  __int16 v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  char *v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int16 v42;
  __int16 v43;
  __int16 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _OWORD v49[20];
  uint64_t v50;
  size_t v51;
  uint64_t v52;
  unint64_t v53;
  unsigned int *v54;

  v51 = 0;
  v52 = 0;
  v4 = *(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  result = mdb_page_touch(a2);
  if ((_DWORD)result)
    return result;
  v53 = 0;
  v54 = 0;
  v6 = *(_QWORD *)(a2 + 8 * *(unsigned __int16 *)(a2 + 66) + 72);
  v7 = *(unsigned __int16 *)(v6 + 12) + 131056;
  if ((*(_BYTE *)(v4 + 10) & 0x20) == 0)
  {
    if ((*(_WORD *)(v4 + 12) & 0xFFFE) != 0x10)
    {
      v8 = 0;
      v9 = v7 >> 1;
      do
      {
        v10 = (unsigned int *)(v4 + *(unsigned __int16 *)(v4 + 2 * v8 + 16));
        if (!v8 && (*(_WORD *)(v4 + 10) & 1) != 0)
        {
          v50 = 0;
          memset(v49, 0, sizeof(v49));
          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          mdb_cursor_copy(a1, (uint64_t)&v45);
          *(_QWORD *)&v46 = 0;
          result = mdb_page_search_lowest((uint64_t)&v45);
          if ((_DWORD)result)
            return result;
          v12 = *((_QWORD *)v49 + WORD1(v49[0]) + 1);
          if ((*(_WORD *)(v12 + 10) & 0x20) != 0)
          {
            v53 = **((_DWORD **)&v47 + 1);
            v14 = (unsigned int *)(v12 + 16);
          }
          else
          {
            v13 = v12 + *(unsigned __int16 *)(v12 + 16);
            v53 = *(unsigned __int16 *)(v13 + 6);
            v14 = (unsigned int *)(v13 + 8);
          }
          v54 = v14;
          v11 = *((unsigned __int16 *)v10 + 3);
        }
        else
        {
          v11 = *((unsigned __int16 *)v10 + 3);
          v53 = v11;
          v54 = v10 + 2;
        }
        v51 = *v10;
        v52 = (uint64_t)v10 + v11 + 8;
        result = mdb_node_add(a2, (unsigned __int16)v9, (const void **)&v53, &v51, v51 | ((unint64_t)*((unsigned __int16 *)v10 + 2) << 32), *((unsigned __int16 *)v10 + 2));
        if ((_DWORD)result)
          return result;
        ++v8;
        LOWORD(v9) = v9 + 1;
      }
      while ((*(unsigned __int16 *)(v4 + 12) - 16) >> 1 > v8);
    }
LABEL_21:
    --*(_WORD *)(a1 + 66);
    mdb_node_del((_QWORD *)a1, 0);
    v17 = *(unsigned __int16 *)(a1 + 66);
    if (!*(_WORD *)(a1 + 2 * v17 + 328))
    {
      v53 = 0;
      result = mdb_update_key(a1, (uint64_t)&v53);
      LOWORD(v17) = *(_WORD *)(a1 + 66);
      if ((_DWORD)result)
      {
        *(_WORD *)(a1 + 66) = v17 + 1;
        return result;
      }
    }
    v18 = v17 + 1;
    *(_WORD *)(a1 + 66) = v18;
    v19 = *(_QWORD *)(a1 + 8 * v18 + 72);
    v20 = *(_QWORD *)v19;
    v21 = *(_QWORD *)(a1 + 24);
    v22 = *(_WORD *)(v19 + 10);
    if ((v22 & 0x10) != 0 && *(_DWORD *)(a1 + 32))
    {
      if (!*(_QWORD *)v21)
      {
LABEL_35:
        *(_QWORD *)(v19 + 48) = *(_QWORD *)(v21 + 48);
        *(_QWORD *)(v21 + 48) = v19;
        ++*(_DWORD *)(v21 + 56);
        v25 = v22 | 0x4000;
        *(_WORD *)(v19 + 10) = v25;
LABEL_36:
        v26 = (v25 & 2) == 0;
        v27 = 16;
        if (v26)
          v27 = 8;
        --*(_QWORD *)(*(_QWORD *)(a1 + 40) + v27);
        v28 = *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
        if (v28)
        {
          v29 = *(unsigned __int16 *)(a1 + 66);
          v30 = *(_DWORD *)(a1 + 68);
          v31 = (v29 - 1);
          do
          {
            v32 = v28;
            if ((v30 & 4) != 0)
              v32 = (_QWORD *)v28[2];
            if (v32 != (_QWORD *)a1 && *((unsigned __int16 *)v32 + 32) >= *(unsigned __int16 *)(a1 + 64))
            {
              v33 = &v32[v29];
              v36 = v33[9];
              v35 = v33 + 9;
              v34 = v36;
              if (v36 == v19)
              {
                *v35 = v6;
                *((_WORD *)v32 + v29 + 164) += v7 >> 1;
                *((_WORD *)v32 + v31 + 164) = *(_WORD *)(a2 + 2 * v31 + 328);
                v34 = v6;
              }
              else if (v32[v31 + 9] == *(_QWORD *)(a1 + 8 * v31 + 72))
              {
                v37 = (char *)v32 + 2 * v31;
                v38 = *((unsigned __int16 *)v37 + 164);
                if (v38 > *(unsigned __int16 *)(a1 + 2 * v31 + 328))
                  *((_WORD *)v37 + 164) = v38 - 1;
              }
              if ((*(_WORD *)(v19 + 10) & 2) != 0)
              {
                v39 = v32[2];
                if (v39)
                {
                  if ((*(_BYTE *)(v39 + 68) & 1) != 0)
                  {
                    v40 = *((unsigned __int16 *)v32 + v29 + 164);
                    if (v40 < (*(unsigned __int16 *)(v34 + 12) - 16) >> 1)
                    {
                      v41 = v34 + *(unsigned __int16 *)(v34 + 2 * v40 + 16);
                      if ((*(_WORD *)(v41 + 4) & 6) == 4)
                        *(_QWORD *)(v39 + 72) = v41 + *(unsigned __int16 *)(v41 + 6) + 8;
                    }
                  }
                }
              }
            }
            v28 = (_QWORD *)*v28;
          }
          while (v28);
        }
        v42 = *(_WORD *)(a2 + 64);
        v43 = *(_WORD *)(*(_QWORD *)(a2 + 40) + 6);
        if (v42)
        {
          *(_WORD *)(a2 + 64) = v42 - 1;
          if (v42 == 1)
            *(_DWORD *)(a2 + 68) &= ~1u;
          else
            --*(_WORD *)(a2 + 66);
        }
        result = mdb_rebalance(a2);
        v44 = *(_WORD *)(*(_QWORD *)(a2 + 40) + 6) - v43 + v42;
        *(_WORD *)(a2 + 64) = v44;
        *(_WORD *)(a2 + 66) = v44 - 1;
        return result;
      }
      v23 = *(_QWORD **)(v21 + 72);
      if (*v23)
      {
        v24 = mdb_mid2l_search(*(unsigned int **)(v21 + 72), *(_QWORD *)v19);
        if (*v23 >= (unint64_t)v24 && v23[2 * v24] == v20)
        {
          if (v23[2 * v24 + 1] != v19)
          {
            *(_DWORD *)(a1 + 68) &= 0xFFFFFFFC;
            *(_DWORD *)(v21 + 124) |= 2u;
            return 4294936517;
          }
          v22 = *(_WORD *)(v19 + 10);
          goto LABEL_35;
        }
      }
    }
    result = mdb_midl_append((unint64_t **)(v21 + 40), v20);
    if ((_DWORD)result)
      return result;
    v25 = *(_WORD *)(v19 + 10);
    goto LABEL_36;
  }
  v53 = **(unsigned int **)(a1 + 40);
  v54 = (unsigned int *)(v4 + 16);
  if ((*(_WORD *)(v4 + 12) & 0xFFFE) == 0x10)
    goto LABEL_21;
  v15 = 0;
  v16 = v7 >> 1;
  while (1)
  {
    result = mdb_node_add(a2, (unsigned __int16)v16, (const void **)&v53, 0, 0, 0);
    if ((_DWORD)result)
      return result;
    v54 = (unsigned int *)((char *)v54 + v53);
    ++v15;
    LOWORD(v16) = v16 + 1;
    if ((*(unsigned __int16 *)(v4 + 12) - 16) >> 1 <= (unsigned __int16)v15)
      goto LABEL_21;
  }
}

uint64_t mdb_page_search_lowest(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v5 = *(_QWORD *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  result = mdb_page_get(a1, *(unsigned int *)(v5 + *(unsigned __int16 *)(v5 + 16)) | ((unint64_t)*(unsigned __int16 *)(v5 + *(unsigned __int16 *)(v5 + 16) + 4) << 32), &v5, 0);
  if (!(_DWORD)result)
  {
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = 0;
    v3 = *(unsigned __int16 *)(a1 + 64);
    if (v3 < 0x20)
    {
      v4 = v5;
      *(_WORD *)(a1 + 64) = v3 + 1;
      *(_WORD *)(a1 + 66) = v3;
      *(_QWORD *)(a1 + 8 * v3 + 72) = v4;
      *(_WORD *)(a1 + 2 * v3 + 328) = 0;
      return mdb_page_search_root(a1, 0, 4);
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 24) + 124) |= 2u;
      return 4294936509;
    }
  }
  return result;
}

uint64_t mdb_cmp_memnr(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  int v8;
  int v9;
  int v10;
  uint64_t result;

  v2 = a1[1];
  v3 = v2 + *a1;
  v4 = *a1 - *a2;
  v5 = v2 + (v4 & ~(v4 >> 63));
  if (v4 >= 1)
    v6 = 1;
  else
    v6 = *a1 - *a2;
  v7 = (unsigned __int8 *)(*a2 + a2[1] - 1);
  while (v3 > v5)
  {
    v9 = *(unsigned __int8 *)--v3;
    v8 = v9;
    v10 = *v7--;
    result = (v8 - v10);
    if (v8 != v10)
      return result;
  }
  if (v6 < 0)
    return -1;
  else
    return v6;
}

uint64_t mdb_cmp_memn(uint64_t *a1, uint64_t *a2)
{
  const void *v2;
  uint64_t v3;
  const void *v4;
  uint64_t v5;
  BOOL v6;
  int v7;
  unsigned int v8;
  uint64_t result;

  v3 = *a1;
  v2 = (const void *)a1[1];
  v5 = *a2;
  v4 = (const void *)a2[1];
  v7 = v3 - v5;
  v6 = v3 <= v5;
  if (v3 < v5)
    v7 = -1;
  if (v3 > v5)
    LODWORD(v3) = v5;
  if (v6)
    v8 = v7;
  else
    v8 = 1;
  LODWORD(result) = memcmp(v2, v4, v3);
  if ((_DWORD)result)
    return result;
  else
    return v8;
}

uint64_t mdb_midl_search(unsigned int *a1, unint64_t a2)
{
  unsigned int v2;
  int v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *a1;
  if (!*a1)
    return 1;
  v3 = 0;
  do
  {
    v4 = v2 >> 1;
    v5 = v3 + (v2 >> 1) + 1;
    v6 = *(_QWORD *)&a1[2 * v5];
    if (v6 >= a2)
    {
      if (v6 <= a2)
        return v5;
      v4 = v2 + ~v4;
      v3 += (v2 >> 1) + 1;
    }
    v2 = v4;
  }
  while (v4);
  if (v6 <= a2)
    return v5;
  else
    return (v5 + 1);
}

_QWORD *mdb_midl_alloc(int a1)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = malloc_type_malloc(8 * (a1 + 2), 0x100004000313F17uLL);
  if (!v2)
    return 0;
  v2[1] = 0;
  v3 = v2 + 1;
  *v2 = a1;
  return v3;
}

void mdb_midl_free(uint64_t a1)
{
  if (a1)
    free((void *)(a1 - 8));
}

_QWORD *mdb_midl_shrink(uint64_t *a1)
{
  uint64_t v2;
  _QWORD *result;
  unint64_t v4;

  v2 = *a1;
  v4 = *(_QWORD *)(v2 - 8);
  result = (_QWORD *)(v2 - 8);
  if (v4 >= 0x20000)
  {
    result = malloc_type_realloc(result, 0x100008uLL, 0x100004000313F17uLL);
    if (result)
    {
      *result++ = 0x1FFFFLL;
      *a1 = (uint64_t)result;
    }
  }
  return result;
}

uint64_t mdb_midl_need(_DWORD **a1, int a2)
{
  _DWORD *v3;
  unint64_t v4;
  _DWORD *v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t result;

  v3 = *a1;
  v4 = (*v3 + a2);
  v6 = *((_QWORD *)v3 - 1);
  v5 = v3 - 2;
  if (v6 >= v4)
    return 0;
  v7 = ((_DWORD)v4 + (v4 >> 2) + 258) & 0xFFFFFF00;
  v8 = malloc_type_realloc(v5, 8 * v7, 0x100004000313F17uLL);
  if (!v8)
    return 12;
  v9 = v8;
  result = 0;
  *v9 = (v7 - 2);
  *a1 = v9 + 1;
  return result;
}

uint64_t mdb_midl_append(unint64_t **a1, unint64_t a2)
{
  unint64_t *v3;
  unint64_t v4;
  uint64_t result;
  unint64_t v7;

  v3 = *a1;
  v4 = **a1;
  if (v4 >= *(*a1 - 1))
  {
    if (mdb_midl_grow(a1, 0x1FFFF))
      return 12;
    v3 = *a1;
    v4 = **a1;
  }
  result = 0;
  v7 = v4 + 1;
  *v3 = v7;
  v3[v7] = a2;
  return result;
}

uint64_t mdb_midl_grow(_QWORD *a1, int a2)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t result;

  v4 = malloc_type_realloc((void *)(*a1 - 8), 8 * (*(_QWORD *)(*a1 - 8) + a2) + 16, 0x100004000313F17uLL);
  if (!v4)
    return 12;
  v5 = v4;
  result = 0;
  *v5 += a2;
  *a1 = v5 + 1;
  return result;
}

uint64_t mdb_midl_append_list(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v3 = *a1;
  v4 = **a1;
  v5 = *a2;
  if (v5 + v4 >= (unint64_t)*(*a1 - 1))
  {
    if (mdb_midl_grow(a1, v5))
      return 12;
    v3 = *a1;
    v4 = **a1;
    v5 = *a2;
  }
  memcpy(&v3[v4 + 1], a2 + 1, 8 * v5);
  result = 0;
  *v3 += *a2;
  return result;
}

uint64_t mdb_midl_append_range(uint64_t **a1, uint64_t a2, unsigned int a3)
{
  uint64_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v10;
  uint64_t *v11;

  v5 = *a1;
  v6 = **a1;
  v7 = v6 + a3;
  if (v7 > *(*a1 - 1))
  {
    if (mdb_midl_grow(a1, a3 | 0x1FFFF))
      return 12;
    v5 = *a1;
  }
  *v5 = v7;
  if (a3)
  {
    v10 = a3;
    v11 = &v5[v6];
    do
      v11[v10--] = a2++;
    while ((_DWORD)v10);
  }
  return 0;
}

uint64_t *mdb_midl_xmerge(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = *a2;
  v3 = *result;
  v4 = *result + *a2;
  *result = -1;
  if (v2)
  {
    v5 = result[v3];
    v6 = v4;
    do
    {
      v7 = a2[v2];
      if (v5 >= v7)
      {
        v9 = v3;
        v8 = v6;
      }
      else
      {
        do
        {
          v8 = v6 - 1;
          result[v6] = v5;
          v9 = v3 - 1;
          v5 = result[v3 - 1];
          --v6;
          --v3;
        }
        while (v5 < v7);
      }
      v6 = v8 - 1;
      result[v8] = v7;
      v3 = v9;
      --v2;
    }
    while (v2);
  }
  *result = v4;
  return result;
}

int *mdb_midl_sort(int *result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  int v11;
  int *v12;
  unint64_t v13;
  unint64_t v14;
  int *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;
  _DWORD v23[64];

  LODWORD(v1) = 0;
  v2 = *result;
  LODWORD(v3) = 1;
LABEL_2:
  while (2)
  {
    v4 = (int)v3 + 1;
    while (v2 - (int)v3 > 7)
    {
      v5 = (v2 + (int)v3) >> 1;
      v6 = *(_QWORD *)&result[2 * v5];
      *(_QWORD *)&result[2 * v5] = *(_QWORD *)&result[2 * v4];
      *(_QWORD *)&result[2 * v4] = v6;
      v7 = *(_QWORD *)&result[2 * (int)v3];
      v8 = *(_QWORD *)&result[2 * v2];
      if (v7 < v8)
      {
        *(_QWORD *)&result[2 * (int)v3] = v8;
        *(_QWORD *)&result[2 * v2] = v7;
        v6 = *(_QWORD *)&result[2 * v4];
        v8 = v7;
      }
      if (v6 < v8)
      {
        *(_QWORD *)&result[2 * v4] = v8;
        *(_QWORD *)&result[2 * v2] = v6;
        v6 = *(_QWORD *)&result[2 * v4];
      }
      v9 = *(_QWORD *)&result[2 * (int)v3];
      if (v9 < v6)
      {
        *(_QWORD *)&result[2 * (int)v3] = v6;
        *(_QWORD *)&result[2 * v4] = v9;
        v6 = v9;
      }
      v10 = v3 + 1;
      v11 = v2;
      while (1)
      {
        v12 = &result[2 * v10 + 2];
        do
        {
          v14 = *(_QWORD *)v12;
          v12 += 2;
          v13 = v14;
          ++v10;
        }
        while (v14 > v6);
        v15 = &result[2 * v11];
        do
        {
          v17 = *((_QWORD *)v15 - 1);
          v15 -= 2;
          v16 = v17;
          --v11;
        }
        while (v17 < v6);
        if (v11 + 1 <= v10)
          break;
        *((_QWORD *)v12 - 1) = v16;
        *(_QWORD *)v15 = v13;
      }
      *(_QWORD *)&result[2 * v4] = v16;
      *(_QWORD *)v15 = v6;
      v18 = (int)v1;
      v1 = (int)v1 + 2;
      if (v2 - v10 + 1 < v11 - (int)v3)
      {
        v23[(int)v1] = v11 - 1;
        v23[v18 + 1] = v3;
        LODWORD(v3) = v10;
        goto LABEL_2;
      }
      v23[v1] = v2;
      v23[v18 + 1] = v10;
      v2 = v11 - 1;
    }
    if (v2 > (int)v3)
    {
      v3 = (int)v3;
      do
      {
        v19 = v3++;
        v20 = *(_QWORD *)&result[2 * v3];
        if (v19 >= 1)
        {
          while (1)
          {
            v21 = *(_QWORD *)&result[2 * v19];
            if (v21 >= v20)
              break;
            *(_QWORD *)&result[2 * (v19 + 1)] = v21;
            v22 = __OFSUB__((_DWORD)v19, 1);
            LODWORD(v19) = v19 - 1;
            if (((int)v19 < 0) ^ v22 | ((_DWORD)v19 == 0))
            {
              LODWORD(v19) = 0;
              break;
            }
          }
        }
        *(_QWORD *)&result[2 * (int)v19 + 2] = v20;
      }
      while (v3 != v2);
    }
    if ((_DWORD)v1)
    {
      LODWORD(v3) = v23[(int)v1 - 1];
      v2 = v23[(int)v1];
      LODWORD(v1) = v1 - 2;
      continue;
    }
    return result;
  }
}

uint64_t mdb_mid2l_search(unsigned int *a1, unint64_t a2)
{
  unsigned int v2;
  int v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *a1;
  if (!*a1)
    return 1;
  v3 = 0;
  do
  {
    v4 = v2 >> 1;
    v5 = v3 + (v2 >> 1) + 1;
    v6 = *(_QWORD *)&a1[4 * v5];
    if (v6 <= a2)
    {
      if (v6 >= a2)
        return v5;
      v4 = v2 + ~v4;
      v3 += (v2 >> 1) + 1;
    }
    v2 = v4;
  }
  while (v4);
  if (v6 >= a2)
    return v5;
  else
    return (v5 + 1);
}

__n128 mdb_mid2l_insert(unsigned int *a1, unint64_t *a2)
{
  unint64_t v4;
  unsigned int v5;
  __n128 result;
  unint64_t v7;
  unsigned int v8;
  unsigned int *v9;
  unsigned int *v10;
  __int128 v11;

  v4 = *a2;
  v5 = mdb_mid2l_search(a1, *a2);
  if (v5)
  {
    v7 = *(_QWORD *)a1;
    if ((*(_QWORD *)a1 < (unint64_t)v5 || *(_QWORD *)&a1[4 * v5] != v4) && v7 <= 0x1FFFE)
    {
      v8 = v7 + 1;
      *(_QWORD *)a1 = v7 + 1;
      if (v5 < (int)v7 + 1)
      {
        v9 = &a1[4 * v7 + 4];
        v10 = &a1[4 * v7];
        do
        {
          v11 = *(_OWORD *)v10;
          v10 -= 4;
          *(_OWORD *)v9 = v11;
          v9 -= 4;
          --v8;
        }
        while (v5 < v8);
      }
      result = *(__n128 *)a2;
      *(_OWORD *)&a1[4 * v5] = *(_OWORD *)a2;
    }
  }
  return result;
}

__n128 mdb_mid2l_append(uint64_t *a1, __n128 *a2)
{
  uint64_t v2;
  __n128 result;

  if ((unint64_t)*a1 <= 0x1FFFE)
  {
    v2 = *a1 + 1;
    *a1 = v2;
    result = *a2;
    *(__n128 *)&a1[2 * v2] = *a2;
  }
  return result;
}

void MTLArchiveUsageDB::store(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, a3, "mdb_put error: %s", (uint8_t *)a2);
}

void MTLArchiveUsageDB::prune(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, a3, "mdb_cursor_open error: %s", (uint8_t *)a2);
}

void ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke_cold_1(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  uint8_t *v7;

  OUTLINED_FUNCTION_1(a1, a2, 4.8149e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v6, "appLaunch iteration error: %s\n", v7);

  OUTLINED_FUNCTION_5();
}

void MTLAssetUpgraderD::getArchiveType()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;

  OUTLINED_FUNCTION_12(__stack_chk_guard);
  v2 = 136315138;
  v3 = v0;
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v1, "addRecompilationWork: failed to get archive type of '%s'", (uint8_t *)&v2);
  OUTLINED_FUNCTION_4();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13((void *)&_mh_execute_header, &_os_log_default, v0, "addRecompilationWork: %s - %s", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void MTLAssetUpgraderD::getDynamicLibraryType()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13((void *)&_mh_execute_header, &_os_log_default, v0, "addRecompilationWork: %s - %s", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_4();
}

void MTLAssetUpgraderD::addRecompilationWork(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, &_os_log_default, a3, "addRecompilationWork: queued recompilation", a1);
}

void MTLAssetUpgraderD::getCacheDirectory()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v3, "Cache directory identification failed: %@", v4);

  OUTLINED_FUNCTION_5();
}

void MTLWorkQueue<RecompilationWork>::push(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, &_os_log_default, a3, "failed to add item to work queue", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

{
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, &_os_log_default, a3, "skipping adding duplicate item to work queue", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void MTLWorkQueue<RecompilationWork>::push(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2, 4.8149e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v2, "mdb_cursor_get failure: %s", v3);
}

{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2, 4.8149e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v2, "mdb_put error: %s", v3);
}

{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2, 4.8149e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v2, "mdb_cursor_open error: %s", v3);
}

void MTLAssetUpgraderD::processAppEvent(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, &_os_log_default, (uint64_t)a3, "processAppEvent: metallib: %@", a1);
}

void MTLAssetUpgraderD::processAppEvent()
{
  uint64_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, &_os_log_default, v0, "processAppEvent: bundleURL %@", v1);
  OUTLINED_FUNCTION_4();
}

void ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_1()
{
  uint64_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v0, "App handler event with no name: %s", v1);
  OUTLINED_FUNCTION_4();
}

void ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, &_os_log_default, a3, "Didn't get any user info from event", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, &_os_log_default, a3, "User info was not a dictionary", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_4()
{
  uint64_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v0, "Unexpected distnoted event: %s", v1);
  OUTLINED_FUNCTION_4();
}

void ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_5()
{
  uint64_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_9((void *)&_mh_execute_header, &_os_log_default, v0, "App handler executed event: %s", v1);
  OUTLINED_FUNCTION_4();
}

void ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, &_os_log_default, a3, "xpc activity os-update: entered", v3);
  OUTLINED_FUNCTION_3();
}

void ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke_72_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, &_os_log_default, a3, "xpc activity prune: entered", v3);
  OUTLINED_FUNCTION_3();
}

void MTLWorkQueue<RecompilationWork>::pop(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2, 4.8149e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v2, "mdb_cursor_del error: %s", v3);
}

void MTLAssetUpgraderD::remapTemporary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_7(a1, a2, a3, a4, 4.8152e-34);
  OUTLINED_FUNCTION_15((void *)&_mh_execute_header, &_os_log_default, v4, "recompilation: replacement of '%s' with '%s' failed - %s", v5);
}

void MTLAssetUpgraderD::recompileSingleStep()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_8();
  v2 = *(_DWORD *)(v1 + 12);
  v3 = *(_DWORD *)(v1 + 16);
  *(_DWORD *)v4 = 136315650;
  *(_QWORD *)(v4 + 4) = v5;
  *(_WORD *)(v4 + 12) = 1024;
  *(_DWORD *)(v4 + 14) = v2;
  *(_WORD *)(v4 + 18) = 1024;
  *(_DWORD *)(v4 + 20) = v3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "recompilation: detected crash for work item (%s, %08X %08X) - skipping", v6, 0x18u);
  if (*(char *)(v0 + 23) < 0)
    operator delete(*(void **)v0);
  OUTLINED_FUNCTION_5();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v3, "recompilation: creation of target archive failed': %@", v4);

  OUTLINED_FUNCTION_5();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v3, "recompilation: serialization of dynamic library %@ failed", v4);

  OUTLINED_FUNCTION_5();
}

{
  uint64_t v0;
  uint64_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_11();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_14((void *)&_mh_execute_header, &_os_log_default, v1, "recompilation: temp directory unavailable '%@': %@", v2);
  OUTLINED_FUNCTION_4();
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v3, "recompilation: not on filesystem - archive %@ ", v4);

  OUTLINED_FUNCTION_5();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_8();
  *(_DWORD *)v1 = 136315138;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v3, "recompilation: invalid app for recompilation bundleID=%s", v4);
  if (*(char *)(v0 + 23) < 0)
    operator delete(*(void **)v0);
  OUTLINED_FUNCTION_5();
}

void MTLAssetUpgraderD::recompileSingleStep(uint64_t a1)
{
  int v1;
  _DWORD v2[2];

  v1 = *(_DWORD *)(*(_QWORD *)a1 + 8);
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "recompilation: unknown recompilation work type %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_3();
}

void MTLAssetUpgraderD::recompileSingleStep(void *a1, void *a2, uint64_t a3)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_14((void *)&_mh_execute_header, &_os_log_default, a3, "recompilation: open/rebuild of dynamic library %@ failed: %@", (uint8_t *)a3);

  OUTLINED_FUNCTION_5();
}

void MTLWorkQueue<RecompilationWork>::setState(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2, 4.8149e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v2, "mdb_cursor_put error: %s", v3);
}

void ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, &_os_log_default, a3, "com.apple.MTLAssetUpgraderD.recompilationActivity: activity defer failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_6((void *)&_mh_execute_header, &_os_log_default, a3, "com.apple.MTLAssetUpgraderD.recompilationActivity: defer", v3);
  OUTLINED_FUNCTION_3();
}

void ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke_cold_3(int a1, uint8_t *buf)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "com.apple.MTLAssetUpgraderD.recompilationActivity: entered state %d", buf, 8u);
}

void MTLArchiveMapDB::store(char *a1, _QWORD *a2, uint64_t *a3)
{
  _QWORD *v3;
  uint64_t *v4;
  int v5;
  _QWORD *v6;
  __int16 v7;
  uint64_t *v8;

  if (*a1 >= 0)
    v3 = a2;
  else
    v3 = (_QWORD *)*a2;
  if (*((char *)a3 + 23) >= 0)
    v4 = a3;
  else
    v4 = (uint64_t *)*a3;
  v5 = 136315394;
  v6 = v3;
  v7 = 2080;
  v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "storeArchive('%s', '%s') invalid payload", (uint8_t *)&v5, 0x16u);
}

void MTLVersionedDB::openDB(int a1, int a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;

  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "db version mismatch: file %u, current %u", (uint8_t *)v2, 0xEu);
  OUTLINED_FUNCTION_4();
}

void MTLVersionedDB::openDB(char *a1, _QWORD *a2, int a3)
{
  _QWORD *v3;
  int v4;
  _QWORD *v5;
  __int16 v6;
  char *v7;

  if (*a1 >= 0)
    v3 = a2;
  else
    v3 = (_QWORD *)*a2;
  v4 = 136315394;
  v5 = v3;
  v6 = 2080;
  v7 = mdb_strerror(a3);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "mdb_env_open(\"%s\") error: %s", (uint8_t *)&v4, 0x16u);
}

void MTLVersionedDB::openDB(int a1)
{
  uint64_t v1;
  int v2;
  char *v3;

  v2 = 136315138;
  v3 = OUTLINED_FUNCTION_2_0(a1, __stack_chk_guard);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v1, "mdb_env_create error: %s", (uint8_t *)&v2);
  OUTLINED_FUNCTION_4();
}

void MTLVersionedDB::MTLVersionedDB(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t *v5;

  if (*((char *)a1 + 23) >= 0)
    v3 = a1;
  else
    v3 = (uint64_t *)*a1;
  v4 = 136315138;
  v5 = v3;
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, a3, "Failed to drop database %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_4();
}

void MTLVersionedDB::MTLVersionedDB()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Database invalid - resetting", v0, 2u);
}

void MTLVersionedDB::Transaction::Transaction(int a1)
{
  uint64_t v1;
  int v2;
  char *v3;

  v2 = 136315138;
  v3 = OUTLINED_FUNCTION_2_0(a1, __stack_chk_guard);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v1, "mdb_dbi_open error: %s", (uint8_t *)&v2);
  OUTLINED_FUNCTION_4();
}

{
  uint64_t v1;
  int v2;
  char *v3;

  v2 = 136315138;
  v3 = OUTLINED_FUNCTION_2_0(a1, __stack_chk_guard);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v1, "mdb_txn_begin error: %s", (uint8_t *)&v2);
  OUTLINED_FUNCTION_4();
}

void MTLVersionedDB::Transaction::~Transaction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 136315138;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, a3, "mdb_txn_commit error: %s", (uint8_t *)a2);
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

id objc_msgSend_App(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "App");
}

id objc_msgSend_InFocus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "InFocus");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_archiveFunctionIds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveFunctionIds");
}

id objc_msgSend_archiveTypeAtURL_device_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archiveTypeAtURL:device:error:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleID");
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkResourceIsReachableAndReturnError:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countForObject:");
}

id objc_msgSend_cpuType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cpuType");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dynamicLibraryTypeAtURL_device_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dynamicLibraryTypeAtURL:device:error:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventBody");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_getDataContainerURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDataContainerURL:error:");
}

id objc_msgSend_getFileSystemRepresentation_maxLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFileSystemRepresentation:maxLength:");
}

id objc_msgSend_getRelationship_ofDirectoryAtURL_toItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFileURL");
}

id objc_msgSend_newBinaryArchiveWithDescriptor_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newBinaryArchiveWithDescriptor:error:");
}

id objc_msgSend_newDynamicLibraryWithURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newDynamicLibraryWithURL:error:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "options");
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathWithComponents:");
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointerValue");
}

id objc_msgSend_publisher(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publisher");
}

id objc_msgSend_recompileToArchiveWithURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recompileToArchiveWithURL:error:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_serializeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializeToURL:error:");
}

id objc_msgSend_setOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOptions:");
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUrl:");
}

id objc_msgSend_sinkWithCompletion_receiveInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sinkWithCompletion:receiveInput:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_starting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "starting");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subType");
}

id objc_msgSend_targetDeviceArchitecture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetDeviceArchitecture");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

const char *mdb_version(_DWORD *a1, _DWORD *a2, _DWORD *a3)
{
  if (a1)
    *a1 = 0;
  if (a2)
    *a2 = 9;
  if (a3)
    *a3 = 70;
  return "LMDB 0.9.70: (December 19, 2015)";
}

uint64_t mdb_env_share_locks(uint64_t a1, int *a2)
{
  uint64_t result;
  int v5;
  __int128 v6;
  uint64_t v7;

  *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) = *(_QWORD *)(*(_QWORD *)(a1
                                                                  + 72
                                                                  + 8
                                                                  * ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(_QWORD *)(*(_QWORD *)(a1 + 72) + 128) < *(_QWORD *)(*(_QWORD *)(a1 + 80) + 128))))
                                                      + 128);
  v7 = 0x100000000;
  v6 = xmmword_10001B8F0;
  do
  {
    result = fcntl(*(_DWORD *)(a1 + 4), 8, &v6);
    if (!(_DWORD)result)
      break;
    result = *__error();
  }
  while ((_DWORD)result == 4);
  if ((_DWORD)result)
    v5 = -1;
  else
    v5 = 0;
  *a2 = v5;
  return result;
}

uint64_t mdb_env_create(_QWORD *a1)
{
  _DWORD *v2;
  _DWORD *v3;
  int v4;
  uint64_t result;

  v2 = malloc_type_calloc(1uLL, 0xF8uLL, 0x10B004020E85D84uLL);
  if (!v2)
    return 12;
  v3 = v2;
  v2[6] = 126;
  *((_QWORD *)v2 + 4) = 0x200000002;
  *(_QWORD *)v2 = -1;
  v2[2] = -1;
  v2[10] = getpid();
  v4 = sysconf(29);
  result = 0;
  v3[5] = v4;
  *a1 = v3;
  return result;
}

uint64_t mdb_env_set_mapsize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  void *v4;
  uint64_t result;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;

  v2 = a2;
  v4 = *(void **)(a1 + 56);
  if (!v4)
    goto LABEL_12;
  if (*(_QWORD *)(a1 + 96))
    return 22;
  v6 = *(_QWORD *)(a1
                 + 72
                 + 8
                 * ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(_QWORD *)(*(_QWORD *)(a1 + 72) + 128) < *(_QWORD *)(*(_QWORD *)(a1 + 80) + 128))));
  if (!a2)
    v2 = *(_QWORD *)(v6 + 16);
  v7 = *(unsigned int *)(a1 + 16) + *(unsigned int *)(a1 + 16) * *(_QWORD *)(v6 + 120);
  if (v2 <= v7)
    v2 = v7;
  munmap(v4, *(_QWORD *)(a1 + 112));
  *(_QWORD *)(a1 + 112) = v2;
  v8 = (*(_BYTE *)(a1 + 12) & 1) != 0 ? *(char **)(a1 + 56) : 0;
  result = mdb_env_map(a1, v8);
  if (!(_DWORD)result)
  {
LABEL_12:
    *(_QWORD *)(a1 + 112) = v2;
    v9 = *(unsigned int *)(a1 + 16);
    result = 0;
    if ((_DWORD)v9)
      *(_QWORD *)(a1 + 128) = v2 / v9;
  }
  return result;
}

uint64_t mdb_env_map(uint64_t a1, char *a2)
{
  int v4;
  int v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_DWORD *)(a1 + 12);
  if ((v4 & 0x80000) != 0)
  {
    if (ftruncate(*(_DWORD *)a1, *(_QWORD *)(a1 + 112)) < 0)
      return *__error();
    v5 = 3;
  }
  else
  {
    v5 = 1;
  }
  v6 = (char *)mmap(a2, *(_QWORD *)(a1 + 112), v5, 1, *(_DWORD *)a1, 0);
  *(_QWORD *)(a1 + 56) = v6;
  if (v6 == (char *)-1)
  {
    *(_QWORD *)(a1 + 56) = 0;
    return *__error();
  }
  if ((v4 & 0x800000) != 0)
  {
    madvise(v6, *(_QWORD *)(a1 + 112), 1);
    v6 = *(char **)(a1 + 56);
  }
  if (a2 && v6 != a2)
    return 16;
  v7 = 0;
  v8 = (uint64_t)&v6[*(unsigned int *)(a1 + 16) + 16];
  *(_QWORD *)(a1 + 72) = v6 + 16;
  *(_QWORD *)(a1 + 80) = v8;
  return v7;
}

uint64_t mdb_env_set_maxdbs(uint64_t a1, int a2)
{
  uint64_t result;

  if (*(_QWORD *)(a1 + 56))
    return 22;
  result = 0;
  *(_DWORD *)(a1 + 36) = a2 + 2;
  return result;
}

uint64_t mdb_env_set_maxreaders(uint64_t a1, int a2)
{
  uint64_t result;

  result = 22;
  if (a2)
  {
    if (!*(_QWORD *)(a1 + 56))
    {
      result = 0;
      *(_DWORD *)(a1 + 24) = a2;
    }
  }
  return result;
}

uint64_t mdb_env_get_maxreaders(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = 22;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *a2 = *(_DWORD *)(a1 + 24);
    }
  }
  return result;
}

uint64_t mdb_env_open(uint64_t a1, const char *a2, int a3, unsigned int a4)
{
  uint64_t v4;
  int v8;
  unsigned int v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  void *v25;
  int v26;

  v26 = -1;
  v4 = 22;
  if ((a3 & 0xFC00BFFE) != 0)
    return v4;
  if (*(_DWORD *)a1 != -1)
    return v4;
  v24 = 0;
  v25 = 0;
  v8 = *(_DWORD *)(a1 + 12) | a3;
  v4 = mdb_fname_init(a2, v8, (uint64_t)&v24);
  if ((_DWORD)v4)
    return v4;
  v9 = v8 | 0x20000000;
  if ((v8 & 0x20000) != 0)
  {
    v9 = v8 & 0xDFF7FFFF | 0x20000000;
  }
  else
  {
    v10 = mdb_midl_alloc(0x1FFFF);
    *(_QWORD *)(a1 + 200) = v10;
    if (!v10
      || (v11 = malloc_type_calloc(0x20000uLL, 0x10uLL, 0x108004057E67DB5uLL), (*(_QWORD *)(a1 + 208) = v11) == 0))
    {
      *(_DWORD *)(a1 + 12) = v9;
LABEL_35:
      v4 = 12;
      goto LABEL_36;
    }
  }
  *(_DWORD *)(a1 + 12) = v9;
  *(_QWORD *)(a1 + 48) = strdup(a2);
  *(_QWORD *)(a1 + 136) = malloc_type_calloc(*(unsigned int *)(a1 + 36), 0x30uLL, 0x1080040226B62D8uLL);
  *(_QWORD *)(a1 + 144) = malloc_type_calloc(*(unsigned int *)(a1 + 36), 2uLL, 0x1000040BDFB0063uLL);
  v12 = malloc_type_calloc(*(unsigned int *)(a1 + 36), 4uLL, 0x100004052888210uLL);
  *(_QWORD *)(a1 + 152) = v12;
  v13 = *(_QWORD *)(a1 + 136);
  if (!v13 || !*(_QWORD *)(a1 + 48))
    goto LABEL_35;
  v4 = 12;
  if (!*(_QWORD *)(a1 + 144) || !v12)
    goto LABEL_36;
  *(_QWORD *)(v13 + 16) = mdb_cmp_long;
  if ((v9 & 0x420000) == 0)
  {
    v4 = mdb_env_setup_locks(a1, (int *)&v24, a4, &v26);
    if ((_DWORD)v4)
      goto LABEL_36;
    if ((v9 & 0x2000000) != 0 && !v26)
    {
      v4 = 35;
      goto LABEL_36;
    }
  }
  v14 = v9 & 0x20000;
  if ((v9 & 0x20000) != 0)
    v15 = 0;
  else
    v15 = 514;
  v4 = mdb_fopen((unsigned int *)a1, (int *)&v24, v15, a4, (int *)a1);
  if ((_DWORD)v4)
    goto LABEL_36;
  if ((v9 & 0x420000) == 0x20000)
  {
    v4 = mdb_env_setup_locks(a1, (int *)&v24, a4, &v26);
    if ((_DWORD)v4)
      goto LABEL_36;
  }
  v4 = mdb_env_open2(a1, v9 & 0x2000000);
  if ((_DWORD)v4)
    goto LABEL_36;
  v4 = mdb_fopen((unsigned int *)a1, (int *)&v24, 20971521, a4, (int *)(a1 + 8));
  if ((_DWORD)v4)
    goto LABEL_36;
  if ((v9 & 0x2000000) != 0 || v26 < 1)
  {
    if (v14)
    {
      v4 = 0;
      goto LABEL_37;
    }
LABEL_32:
    v17 = *(_DWORD *)(a1 + 36);
    v18 = malloc_type_calloc(1uLL, *(unsigned int *)(a1 + 16), 0x78DA1B97uLL);
    *(_QWORD *)(a1 + 88) = v18;
    if (v18)
    {
      v19 = malloc_type_calloc(1uLL, 61 * v17 + 136, 0xC025CA4FuLL);
      if (v19)
      {
        v4 = 0;
        v19[11] = v19 + 17;
        v20 = *(unsigned int *)(a1 + 36);
        v21 = (uint64_t)&v19[6 * v20 + 17];
        v22 = v21 + 8 * v20;
        v19[12] = v22;
        v19[13] = v21;
        v19[14] = v22 + 4 * v20;
        v19[4] = a1;
        v19[10] = *(_QWORD *)(a1 + 136);
        *((_DWORD *)v19 + 31) = 1;
        *(_QWORD *)(a1 + 104) = v19;
        goto LABEL_37;
      }
    }
    goto LABEL_35;
  }
  v16 = mdb_env_share_locks(a1, &v26);
  if (!(v16 | v14))
    goto LABEL_32;
  v4 = v16;
  if ((_DWORD)v16)
LABEL_36:
    mdb_env_close1(a1);
LABEL_37:
  if (HIDWORD(v24))
    free(v25);
  return v4;
}

uint64_t mdb_fname_init(const char *a1, int a2, uint64_t a3)
{
  int v5;
  int v6;
  uint64_t result;
  char *v8;

  v5 = ~a2 & 0x404000;
  *(_DWORD *)(a3 + 4) = 0;
  v6 = strlen(a1);
  *(_DWORD *)a3 = v6;
  if (v5)
  {
    v8 = (char *)malloc_type_malloc(v6 + 10, 0x2E9E0525uLL);
    *(_QWORD *)(a3 + 8) = v8;
    if (v8)
    {
      *(_DWORD *)(a3 + 4) = 1;
      strcpy(v8, a1);
      return 0;
    }
    else
    {
      return 12;
    }
  }
  else
  {
    result = 0;
    *(_QWORD *)(a3 + 8) = a1;
  }
  return result;
}

uint64_t mdb_env_setup_locks(uint64_t a1, int *a2, unsigned __int16 a3, int *a4)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  off_t v10;
  int64_t v11;
  char *v12;
  _OWORD *v13;
  pthread_mutexattr_t v15;
  uint64_t v16;

  v6 = (int *)(a1 + 4);
  v7 = mdb_fopen((unsigned int *)a1, a2, 16777734, a3, (int *)(a1 + 4));
  if (!(_DWORD)v7)
  {
    if ((*(_BYTE *)(a1 + 14) & 0x20) == 0)
    {
      v8 = pthread_key_create((pthread_key_t *)(a1 + 160), (void (__cdecl *)(void *))mdb_env_reader_dest);
      if ((_DWORD)v8)
        return v8;
      *(_DWORD *)(a1 + 12) |= 0x10000000u;
    }
    v16 = 0x300000000;
    v15 = (pthread_mutexattr_t)xmmword_10001B8F0;
    do
    {
      if (!fcntl(*v6, 8, &v15))
        goto LABEL_12;
      v9 = *__error();
    }
    while (v9 == 4);
    if (v9)
    {
      WORD2(v16) = 1;
      do
      {
        if (!fcntl(*v6, 9, &v15))
        {
          LODWORD(v8) = 0;
          goto LABEL_13;
        }
        v8 = *__error();
      }
      while ((_DWORD)v8 == 4);
      if (!(_DWORD)v8)
        goto LABEL_13;
      return v8;
    }
LABEL_12:
    LODWORD(v8) = 1;
LABEL_13:
    *a4 = v8;
    v10 = lseek(*v6, 0, 2);
    if (v10 != -1)
    {
      v11 = ((unint64_t)(*(_DWORD *)(a1 + 24) - 1) << 6) + 256;
      if (v10 >= v11 || *a4 < 1)
      {
        *(_DWORD *)(a1 + 24) = ((unint64_t)(v10 + 0x3FFFFFFF00) >> 6) + 1;
        v11 = v10;
      }
      else if (ftruncate(*v6, ((unint64_t)(*(_DWORD *)(a1 + 24) - 1) << 6) + 256))
      {
        return *__error();
      }
      v12 = (char *)mmap(0, v11, 3, 1, *v6, 0);
      if (v12 != (char *)-1)
      {
        *(_QWORD *)(a1 + 64) = v12;
        if (*a4 < 1)
        {
          if (*(_DWORD *)v12 != -1091583778)
            return 4294936503;
          if (*((_DWORD *)v12 + 1) != 774479874)
            return 4294936502;
          v8 = *__error();
          if (v8 <= 0x23 && ((1 << v8) & 0x800002001) != 0)
            return 0;
        }
        else
        {
          v15.__sig = 0;
          *(_QWORD *)v15.__opaque = 0;
          *(_OWORD *)(v12 + 24) = 0u;
          *(_OWORD *)(v12 + 40) = 0u;
          *(_OWORD *)(v12 + 56) = 0u;
          *(_OWORD *)(v12 + 72) = 0u;
          v13 = *(_OWORD **)(a1 + 64);
          v13[8] = 0u;
          v13[9] = 0u;
          v13[10] = 0u;
          v13[11] = 0u;
          v8 = pthread_mutexattr_init(&v15);
          if (!(_DWORD)v8)
          {
            v8 = pthread_mutexattr_setpshared(&v15, 1);
            if ((_DWORD)v8
              || (v8 = pthread_mutex_init((pthread_mutex_t *)(*(_QWORD *)(a1 + 64) + 24), &v15), (_DWORD)v8))
            {
              pthread_mutexattr_destroy(&v15);
            }
            else
            {
              v8 = pthread_mutex_init((pthread_mutex_t *)(*(_QWORD *)(a1 + 64) + 128), &v15);
              pthread_mutexattr_destroy(&v15);
              if (!(_DWORD)v8)
              {
                **(_DWORD **)(a1 + 64) = -1091583778;
                *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4) = 774479874;
                *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) = 0;
                *(_DWORD *)(*(_QWORD *)(a1 + 64) + 16) = 0;
              }
            }
          }
        }
        return v8;
      }
    }
    return *__error();
  }
  v8 = v7;
  if ((_DWORD)v7 == 30)
  {
    if ((*(_BYTE *)(a1 + 14) & 2) == 0)
      return 30;
    return 0;
  }
  return v8;
}

uint64_t mdb_fopen(unsigned int *a1, int *a2, int a3, unsigned int a4, int *a5)
{
  int v10;
  int v11;
  uint64_t result;

  if (a2[1])
    strcpy((char *)(*((_QWORD *)a2 + 1) + *a2), (&(&mdb_suffixes)[2 * (a3 == 16777734)])[((unint64_t)a1[3] >> 14) & 1]);
  v10 = open(*((const char **)a2 + 1), a3 & 0x1400A03, a4);
  v11 = v10;
  if (v10 == -1)
  {
    result = *__error();
  }
  else
  {
    if (a3 == 16779777 && a1[4] >= a1[5])
      fcntl(v10, 48, 1);
    result = 0;
  }
  *a5 = v11;
  return result;
}

uint64_t mdb_env_open2(uint64_t a1, int a2)
{
  int v4;
  int v5;
  char v6;
  char v7;
  int v8;
  uint64_t result;
  unsigned int v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  char v15;
  char *v16;
  unint64_t v17;
  _OWORD v18[9];
  __int128 __buf;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  unint64_t v28;

  v4 = 0;
  v5 = *(_DWORD *)(a1 + 12);
  memset(v18, 0, 136);
  v28 = 0;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = 1;
  __buf = 0u;
  while (1)
  {
    v7 = v6;
    v8 = pread(*(_DWORD *)a1, &__buf, 0x98uLL, v4);
    if (v8 != 152)
      break;
    result = 4294936503;
    if ((BYTE10(__buf) & 8) == 0 || (_DWORD)v20 != -1091583778)
      goto LABEL_20;
    if (DWORD1(v20) != 1)
    {
      result = 4294936502;
      goto LABEL_20;
    }
    if (!v4)
      goto LABEL_9;
    if (!a2)
    {
      if (v28 <= *(_QWORD *)&v18[8])
        goto LABEL_10;
LABEL_9:
      v18[0] = v20;
      v18[4] = v24;
      v18[3] = v23;
      v18[2] = v22;
      v18[1] = v21;
      *(_QWORD *)&v18[8] = v28;
      v18[7] = v27;
      v18[6] = v26;
      v18[5] = v25;
      goto LABEL_10;
    }
    if (v28 < *(_QWORD *)&v18[8])
      goto LABEL_9;
LABEL_10:
    v6 = 0;
    v10 = DWORD2(v18[1]);
    v4 += DWORD2(v18[1]);
    if ((v7 & 1) == 0)
      goto LABEL_44;
  }
  if (!(v4 | v8))
  {
    result = 2;
    goto LABEL_20;
  }
  if ((v8 & 0x80000000) == 0)
  {
    result = 4294936503;
    goto LABEL_20;
  }
  result = *__error();
  if ((_DWORD)result)
  {
LABEL_20:
    if ((_DWORD)result != 2)
      return result;
    v11 = 0;
    v10 = *(_DWORD *)(a1 + 20);
    if (v10 >= 0x8000)
      v10 = 0x8000;
    *(_DWORD *)(a1 + 16) = v10;
    memset((char *)&v18[1] + 8, 0, 112);
    *(_OWORD *)((char *)v18 + 8) = 0u;
    *(_QWORD *)&v18[0] = 0x1BEEFC0DELL;
    WORD6(v18[1]) = *(_WORD *)(a1 + 12) | 8;
    *(_QWORD *)&v18[4] = -1;
    *(_QWORD *)&v18[1] = 0x100000;
    v12 = *(_QWORD *)(a1 + 112);
    DWORD2(v18[1]) = v10;
    v18[7] = xmmword_10001B900;
    if (!v12)
      goto LABEL_24;
  }
  else
  {
    v10 = DWORD2(v18[1]);
LABEL_44:
    *(_DWORD *)(a1 + 16) = v10;
    v12 = *(_QWORD *)(a1 + 112);
    v11 = 1;
    if (!v12)
    {
LABEL_24:
      v12 = *(_QWORD *)&v18[1];
      *(_QWORD *)(a1 + 112) = *(_QWORD *)&v18[1];
    }
  }
  v13 = v10 * *((_QWORD *)&v18[7] + 1) + v10;
  if (v12 < v13)
  {
    *(_QWORD *)(a1 + 112) = v13;
    v12 = v13;
  }
  *(_QWORD *)&v18[1] = v12;
  v14 = v5 & 1;
  if ((v11 & 1) != 0)
  {
LABEL_28:
    v15 = 1;
LABEL_33:
    if (v14)
      v16 = (char *)*((_QWORD *)&v18[0] + 1);
    else
      v16 = 0;
    result = mdb_env_map(a1, v16);
    if (!(_DWORD)result)
    {
      if ((v15 & 1) != 0)
        goto LABEL_41;
      if (v14)
        *((_QWORD *)&v18[0] + 1) = *(_QWORD *)(a1 + 56);
      result = mdb_env_init_meta(a1, (uint64_t)v18);
      if (!(_DWORD)result)
      {
LABEL_41:
        result = 0;
        v17 = *(unsigned int *)(a1 + 16);
        *(_DWORD *)(a1 + 216) = ((v17 - 16) >> 3) - 1;
        *(_DWORD *)(a1 + 220) = (((v17 - 16) >> 1) & 0x7FFFFFFE) - 2;
        *(_QWORD *)(a1 + 128) = *(_QWORD *)(a1 + 112) / v17;
      }
    }
  }
  else
  {
    if ((v5 & 1) != 0)
    {
      v15 = 0;
      v14 = 1;
      goto LABEL_33;
    }
    result = mdb_env_init_meta(a1, (uint64_t)v18);
    if (!(_DWORD)result)
    {
      v14 = 0;
      goto LABEL_28;
    }
  }
  return result;
}

uint64_t mdb_env_close1(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  void *v5;
  int v6;
  pid_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _DWORD *v11;
  int v12;

  if ((*(_BYTE *)(result + 15) & 0x20) != 0)
  {
    v1 = result;
    v2 = *(void **)(result + 136);
    if (v2)
    {
      v3 = *(unsigned int *)(v1 + 36);
      if ((int)v3 >= 3)
      {
        v4 = v3 + 1;
        do
          free(*(void **)(*(_QWORD *)(v1 + 136) + 48 * (v4-- - 2) + 8));
        while (v4 > 3);
        v2 = *(void **)(v1 + 136);
      }
      free(v2);
    }
    free(*(void **)(v1 + 88));
    free(*(void **)(v1 + 152));
    free(*(void **)(v1 + 144));
    free(*(void **)(v1 + 48));
    free(*(void **)(v1 + 208));
    free(*(void **)(v1 + 104));
    mdb_midl_free(*(_QWORD *)(v1 + 200));
    if ((*(_BYTE *)(v1 + 15) & 0x10) != 0)
      pthread_key_delete(*(_QWORD *)(v1 + 160));
    v5 = *(void **)(v1 + 56);
    if (v5)
      munmap(v5, *(_QWORD *)(v1 + 112));
    v6 = *(_DWORD *)(v1 + 8);
    if (v6 != -1)
      close(v6);
    if (*(_DWORD *)v1 != -1)
      close(*(_DWORD *)v1);
    if (*(_QWORD *)(v1 + 64))
    {
      v7 = getpid();
      v8 = *(unsigned int *)(v1 + 28);
      if ((int)v8 >= 1)
      {
        v9 = v8 + 1;
        do
        {
          v10 = *(_QWORD *)(v1 + 64) + ((unint64_t)(v9 - 2) << 6);
          v12 = *(_DWORD *)(v10 + 200);
          v11 = (_DWORD *)(v10 + 200);
          if (v12 == v7)
            *v11 = 0;
          --v9;
        }
        while (v9 > 1);
      }
      munmap(*(void **)(v1 + 64), ((unint64_t)(*(_DWORD *)(v1 + 24) - 1) << 6) + 256);
    }
    result = *(unsigned int *)(v1 + 4);
    if ((_DWORD)result != -1)
      result = close(result);
    *(_DWORD *)(v1 + 12) &= 0xCFFFFFFF;
  }
  return result;
}

void mdb_env_close(_QWORD *a1)
{
  _QWORD *v2;

  if (a1)
  {
    while (1)
    {
      v2 = (_QWORD *)a1[24];
      if (!v2)
        break;
      a1[24] = *v2;
      free(v2);
    }
    mdb_env_close1((uint64_t)a1);
    free(a1);
  }
}

size_t mdb_env_copyfd2(int *a1, int a2, char a3)
{
  size_t v5;
  void *v6;
  pthread_mutex_t *v7;
  uint64_t v8;
  size_t v9;
  int v10;
  uint64_t v11;
  char *v12;
  ssize_t v13;
  size_t v14;
  uint64_t v15;
  int v16;
  _QWORD *v17;
  uint64_t v19;
  uint64_t v20;
  int v21;
  off_t st_size;
  unint64_t v23;
  size_t v24;
  ssize_t v25;
  _WORD *v26;
  uint64_t v27;
  char *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD v45[2];
  stat memptr;
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
  uint64_t v62;
  unint64_t v63;
  pthread_t v64;
  _QWORD *v65;
  void *v66[2];
  pthread_mutex_t v67;
  pthread_cond_t v68;
  void *v69[2];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;

  if ((a3 & 1) != 0)
  {
    v73 = 0;
    v71 = 0u;
    v72 = 0u;
    *(_OWORD *)v69 = 0u;
    v70 = 0u;
    memset(&v68, 0, sizeof(v68));
    *(_OWORD *)v66 = 0u;
    memset(&v67, 0, sizeof(v67));
    v64 = 0;
    v65 = 0;
    v5 = pthread_mutex_init(&v67, 0);
    if ((_DWORD)v5)
      return v5;
    v9 = pthread_cond_init(&v68, 0);
    if ((_DWORD)v9)
    {
      v5 = v9;
      pthread_mutex_destroy(&v67);
      return v5;
    }
    *(_QWORD *)&memptr.st_dev = 0;
    v14 = malloc_type_posix_memalign((void **)&memptr, a1[5], 0x200000uLL, 0xA3EC04BCuLL);
    if ((_DWORD)v14)
    {
      v5 = v14;
      goto LABEL_59;
    }
    v15 = *(_QWORD *)&memptr.st_dev;
    v69[0] = *(void **)&memptr.st_dev;
    bzero(*(void **)&memptr.st_dev, 0x200000uLL);
    *(_QWORD *)&v72 = 2;
    v69[1] = (void *)(v15 + 0x100000);
    v66[0] = a1;
    DWORD2(v72) = a2;
    v5 = pthread_create(&v64, 0, (void *(__cdecl *)(void *))mdb_env_copythr, v66);
    if ((_DWORD)v5)
    {
LABEL_59:
      free(v69[0]);
      pthread_cond_destroy(&v68);
      pthread_mutex_destroy(&v67);
      if (!(_DWORD)v5)
        return HIDWORD(v73);
      return v5;
    }
    v63 = 0;
    v16 = mdb_txn_begin((uint64_t)a1, 0, 0x20000, (uint64_t *)&v65);
    if (v16)
    {
      v17 = v65;
      goto LABEL_57;
    }
    v26 = v69[0];
    bzero(v69[0], (2 * a1[4]));
    *(_QWORD *)v26 = 0;
    v26[5] = 8;
    *((_QWORD *)v26 + 2) = 0x1BEEFC0DELL;
    *((_QWORD *)v26 + 4) = *((_QWORD *)a1 + 14);
    v27 = a1[4];
    *((_DWORD *)v26 + 10) = v27;
    v26[22] = *((_WORD *)a1 + 6) | 8;
    *((_QWORD *)v26 + 10) = -1;
    *((_OWORD *)v26 + 8) = xmmword_10001B900;
    *((_QWORD *)v26 + 3) = *(_QWORD *)(*((_QWORD *)a1 + 9) + 8);
    v28 = (char *)v69[0] + v27;
    *(_QWORD *)v28 = 1;
    *((_WORD *)v28 + 5) = 8;
    *((_OWORD *)v28 + 1) = *((_OWORD *)v26 + 1);
    v29 = *((_OWORD *)v26 + 2);
    v30 = *((_OWORD *)v26 + 3);
    v31 = *((_OWORD *)v26 + 4);
    *((_OWORD *)v28 + 5) = *((_OWORD *)v26 + 5);
    *((_OWORD *)v28 + 4) = v31;
    *((_OWORD *)v28 + 3) = v30;
    *((_OWORD *)v28 + 2) = v29;
    v32 = *((_OWORD *)v26 + 6);
    v33 = *((_OWORD *)v26 + 7);
    v34 = *((_OWORD *)v26 + 8);
    *((_QWORD *)v28 + 18) = *((_QWORD *)v26 + 18);
    *((_OWORD *)v28 + 8) = v34;
    *((_OWORD *)v28 + 7) = v33;
    *((_OWORD *)v28 + 6) = v32;
    v17 = v65;
    v35 = v65[11];
    v63 = *(_QWORD *)(v35 + 88);
    if (v63 == -1)
    {
      v42 = *(unsigned __int16 *)(v35 + 52);
      *((_WORD *)v28 + 46) = v42;
      v38 = -1;
      if (!v42)
        goto LABEL_54;
    }
    else
    {
      v62 = 0;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v47 = 0u;
      memset(&memptr, 0, sizeof(memptr));
      v45[0] = 0;
      v45[1] = 0;
      v43 = 0;
      v44 = 0;
      mdb_cursor_init((uint64_t)&memptr, (uint64_t)v65, 0, 0);
      for (i = 0; ; i += *v44)
      {
        v16 = mdb_cursor_get((uint64_t)&memptr, v45, &v43, 8);
        if (v16)
          break;
      }
      if (v16 != -30798)
        goto LABEL_57;
      v37 = v17[11];
      v38 = v17[2] + ~(*(_QWORD *)(v37 + 8) + i + *(_QWORD *)(v37 + 16) + *(_QWORD *)(v37 + 24));
      *((_QWORD *)v28 + 17) = v38;
      v39 = *(_OWORD *)(v37 + 48);
      v40 = *(_OWORD *)(v37 + 64);
      v41 = *(_QWORD *)(v37 + 80);
      *(_OWORD *)(v28 + 104) = v40;
      *(_OWORD *)(v28 + 88) = v39;
      *((_QWORD *)v28 + 15) = v41;
      *((_QWORD *)v28 + 16) = v38;
    }
    *((_QWORD *)v28 + 18) = 1;
LABEL_54:
    LODWORD(v71) = 2 * a1[4];
    v66[1] = v17;
    v16 = mdb_env_cwalk((uint64_t)v66, &v63, 0);
    if (!v16)
    {
      if (v63 == v38)
      {
LABEL_58:
        mdb_env_cthr_toggle((uint64_t)v66, 17);
        v5 = pthread_join(v64, 0);
        mdb_txn_abort((uint64_t)v17);
        goto LABEL_59;
      }
      v16 = -30784;
    }
LABEL_57:
    HIDWORD(v73) = v16;
    goto LABEL_58;
  }
  v66[0] = 0;
  v5 = mdb_txn_begin((uint64_t)a1, 0, 0x20000, (uint64_t *)v66);
  if (!(_DWORD)v5)
  {
    if (*((_QWORD *)a1 + 8))
    {
      v6 = v66[0];
      mdb_txn_end((unsigned int *)v66[0], 4);
      v7 = (pthread_mutex_t *)(*((_QWORD *)a1 + 8) + 128);
      v5 = pthread_mutex_lock(v7);
      if ((_DWORD)v5)
      {
LABEL_28:
        mdb_txn_abort((uint64_t)v66[0]);
        return v5;
      }
      v8 = mdb_txn_renew0((uint64_t)v6);
      if ((_DWORD)v8)
      {
        v5 = v8;
        pthread_mutex_unlock(v7);
        goto LABEL_28;
      }
    }
    else
    {
      v7 = 0;
    }
    v10 = a1[4];
    v11 = (2 * v10);
    v12 = (char *)*((_QWORD *)a1 + 7);
    if ((_DWORD)v11)
    {
      v5 = (2 * v10);
      while (1)
      {
        v13 = write(a2, v12, v5);
        if (v13 < 0)
        {
          v5 = *__error();
          goto LABEL_25;
        }
        if (!v13)
          break;
        v12 += v13;
        v5 -= v13;
        if (!v5)
          goto LABEL_25;
      }
      v5 = 5;
    }
    else
    {
      v5 = 0;
    }
LABEL_25:
    if (v7)
      pthread_mutex_unlock(v7);
    if ((_DWORD)v5)
      goto LABEL_28;
    v19 = *((_QWORD *)v66[0] + 2);
    v20 = a1[4];
    v21 = *a1;
    memset(&memptr, 0, sizeof(memptr));
    if (fstat(v21, &memptr))
    {
      v5 = *__error();
      if ((_DWORD)v5)
        goto LABEL_28;
      st_size = 0;
    }
    else
    {
      st_size = v19 * v20;
      if ((unint64_t)(v19 * v20) >= memptr.st_size)
        st_size = memptr.st_size;
    }
    v23 = st_size - v11;
    if (st_size == v11)
    {
      v5 = 0;
    }
    else
    {
      while (1)
      {
        if (v23 >= 0x40000000)
          v24 = 0x40000000;
        else
          v24 = v23;
        v25 = write(a2, v12, v24);
        if (v25 < 0)
        {
          v5 = *__error();
          goto LABEL_28;
        }
        if (!v25)
          break;
        v5 = 0;
        v12 += v25;
        v23 -= v25;
        if (!v23)
          goto LABEL_28;
      }
      v5 = 5;
    }
    goto LABEL_28;
  }
  return v5;
}

size_t mdb_env_copyfd(int *a1, int a2)
{
  return mdb_env_copyfd2(a1, a2, 0);
}

size_t mdb_env_copy2(unsigned int *a1, const char *a2, char a3)
{
  size_t v5;
  int v6;
  int v8;
  uint64_t v9;
  void *v10;

  v9 = 0;
  v10 = 0;
  v8 = -1;
  v5 = mdb_fname_init(a2, a1[3] | 0x400000, (uint64_t)&v9);
  if (!(_DWORD)v5)
  {
    v5 = mdb_fopen(a1, (int *)&v9, 16779777, 0x1B6u, &v8);
    if (HIDWORD(v9))
      free(v10);
    if (!(_DWORD)v5)
    {
      v6 = v8;
      v5 = mdb_env_copyfd2((int *)a1, v8, a3);
      if (close(v6) < 0 && !(_DWORD)v5)
        return *__error();
    }
  }
  return v5;
}

size_t mdb_env_copy(unsigned int *a1, const char *a2)
{
  return mdb_env_copy2(a1, a2, 0);
}

uint64_t mdb_env_set_flags(uint64_t a1, int a2, int a3)
{
  uint64_t result;
  int v5;

  if ((a2 & 0xFEEAFFFF) != 0)
    return 22;
  result = 0;
  if (a3)
    v5 = *(_DWORD *)(a1 + 12) | a2;
  else
    v5 = *(_DWORD *)(a1 + 12) & ~a2;
  *(_DWORD *)(a1 + 12) = v5;
  return result;
}

uint64_t mdb_env_get_flags(uint64_t a1, int *a2)
{
  uint64_t result;

  result = 22;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *a2 = *(_DWORD *)(a1 + 12) & 0x3FF4001;
    }
  }
  return result;
}

uint64_t mdb_env_set_userctx(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (!a1)
    return 22;
  result = 0;
  *(_QWORD *)(a1 + 232) = a2;
  return result;
}

uint64_t mdb_env_get_userctx(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 232);
  return result;
}

uint64_t mdb_env_set_assert(uint64_t a1)
{
  if (a1)
    return 0;
  else
    return 22;
}

uint64_t mdb_env_get_path(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  result = 22;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *a2 = *(_QWORD *)(a1 + 48);
    }
  }
  return result;
}

uint64_t mdb_env_get_fd(_DWORD *a1, _DWORD *a2)
{
  uint64_t result;

  result = 22;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *a2 = *a1;
    }
  }
  return result;
}

__n128 mdb_env_stat(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  __n128 result;

  if (a1)
  {
    if (a2)
    {
      v2 = *(_QWORD *)(a1
                     + 72
                     + 8
                     * ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(_QWORD *)(*(_QWORD *)(a1 + 72) + 128) < *(_QWORD *)(*(_QWORD *)(a1 + 80) + 128))));
      v3 = *(unsigned __int16 *)(v2 + 78);
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 16);
      *(_DWORD *)(a2 + 4) = v3;
      *(_OWORD *)(a2 + 8) = *(_OWORD *)(v2 + 80);
      result = *(__n128 *)(v2 + 96);
      *(__n128 *)(a2 + 24) = result;
    }
  }
  return result;
}

uint64_t mdb_env_info(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  int v8;

  v2 = 22;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 72);
    v5 = *(_QWORD *)(a1 + 80);
    v3 = a1 + 72;
    v6 = *(_QWORD **)(v3
                    + 8
                    * ((*(_DWORD *)(v3 - 60) >> 25) & 1 ^ (*(_QWORD *)(v4 + 128) < *(_QWORD *)(v5 + 128))));
    *(_QWORD *)a2 = v6[1];
    *(_QWORD *)(a2 + 16) = v6[15];
    *(_QWORD *)(a2 + 24) = v6[16];
    *(_QWORD *)(a2 + 8) = *(_QWORD *)(v3 + 40);
    *(_DWORD *)(a2 + 32) = *(_DWORD *)(v3 - 48);
    v7 = *(_QWORD *)(v3 - 8);
    if (v7)
      v8 = *(_DWORD *)(v7 + 16);
    else
      v8 = 0;
    v2 = 0;
    *(_DWORD *)(a2 + 36) = v8;
  }
  return v2;
}

__n128 mdb_stat(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  __n128 result;
  _OWORD v9[31];
  _OWORD v10[24];
  uint64_t v11;

  if (a1
    && a3
    && *(_DWORD *)(a1 + 120) > a2
    && (*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 8) != 0
    && (*(_BYTE *)(a1 + 124) & 0x13) == 0)
  {
    if ((*(_BYTE *)(*(_QWORD *)(a1 + 112) + a2) & 2) != 0)
    {
      v11 = 0;
      memset(v10, 0, sizeof(v10));
      memset(v9, 0, sizeof(v9));
      mdb_cursor_init((uint64_t)v10, a1, a2, (uint64_t)v9);
    }
    v6 = *(_QWORD *)(a1 + 88);
    *(_DWORD *)a3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v7 = v6 + 48 * a2;
    *(_DWORD *)(a3 + 4) = *(unsigned __int16 *)(v7 + 6);
    *(_OWORD *)(a3 + 8) = *(_OWORD *)(v7 + 8);
    result = *(__n128 *)(v7 + 24);
    *(__n128 *)(a3 + 24) = result;
  }
  return result;
}

uint64_t mdb_env_get_maxkeysize()
{
  return 511;
}

uint64_t mdb_reader_list(uint64_t a1, uint64_t (*a2)(const char *, uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t (*v6)(const char *, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char __str[64];

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    v6 = a2;
    if (a2)
    {
      v7 = *(_QWORD *)(a1 + 64);
      if (v7)
      {
        v8 = *(unsigned int *)(v7 + 16);
        if (!(_DWORD)v8)
          return v6("(no active readers)\n", a3);
        result = 0;
        v9 = v7 + 208;
        v10 = 1;
        do
        {
          if (*(_DWORD *)(v9 - 8))
          {
            if (*(_QWORD *)(v9 - 16) == -1)
              snprintf(__str, 0x40uLL, "%10d %zx -\n");
            else
              snprintf(__str, 0x40uLL, "%10d %zx %zu\n");
            if (v10)
            {
              result = a2("    pid     thread     txnid\n", a3);
              if ((result & 0x80000000) != 0)
                return result;
            }
            result = a2(__str, a3);
            if ((result & 0x80000000) != 0)
              return result;
            v10 = 0;
            v6 = a2;
          }
          v9 += 64;
          --v8;
        }
        while (v8);
        if (v10)
          return v6("(no active readers)\n", a3);
      }
      else
      {
        return a2("(no reader locks)\n", a3);
      }
    }
  }
  return result;
}

uint64_t mdb_reader_check(uint64_t a1, _DWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int *v7;
  uint64_t v8;
  int v9;
  pthread_mutex_t *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  _DWORD *v26;
  uint64_t v27;
  uint64_t v29;

  if (!a1)
    return 22;
  if (a2)
    *a2 = 0;
  v4 = *(_QWORD *)(a1 + 64);
  if (!v4)
    return 0;
  v5 = *(unsigned int *)(v4 + 16);
  v6 = (unsigned int *)malloc_type_malloc(4 * (v5 + 1), 0x100004052888210uLL);
  if (!v6)
    return 12;
  v7 = v6;
  *v6 = 0;
  if ((_DWORD)v5)
  {
    v8 = 0;
    v9 = 0;
    v10 = (pthread_mutex_t *)(v4 + 24);
    v11 = *(_QWORD *)(a1 + 64);
    v12 = v11 + 192;
    v29 = v11 + 200;
    while (1)
    {
      v13 = *(_DWORD *)(v12 + (v8 << 6) + 8);
      if (v13 && v13 != *(_DWORD *)(a1 + 40))
      {
        v14 = *v7;
        if ((_DWORD)v14)
        {
          v15 = 0;
          v16 = *v7;
          do
          {
            while (1)
            {
              v17 = v16 >> 1;
              v18 = v15 + (v16 >> 1) + 1;
              v19 = v13 - v7[v18];
              if (v19 >= 0)
                break;
              v16 >>= 1;
              if (!v17)
                goto LABEL_17;
            }
            if (!v19)
              goto LABEL_36;
            v16 += ~v17;
            v15 = v18;
          }
          while (v16);
LABEL_17:
          v20 = v19 <= 0 ? v18 : v18 + 1;
        }
        else
        {
          v20 = 1;
        }
        v21 = (v14 + 1);
        *v7 = v21;
        if (v21 > v20)
        {
          v22 = v21;
          do
            v7[v22--] = v7[v14--];
          while (v20 < (int)v14 + 1);
          v21 = v14 + 1;
        }
        v7[v21] = v13;
        if (!mdb_reader_pid(a1, 7, v13))
        {
          v23 = pthread_mutex_lock(v10);
          if ((_DWORD)v23)
          {
            v27 = v23;
            goto LABEL_43;
          }
          if (mdb_reader_pid(a1, 7, v13))
            v24 = v5;
          else
            v24 = v8;
          if (v24 < v5)
          {
            v25 = v5 - v24;
            v26 = (_DWORD *)(v29 + (v24 << 6));
            do
            {
              if (*v26 == v13)
              {
                *v26 = 0;
                ++v9;
              }
              v26 += 16;
              --v25;
            }
            while (v25);
          }
          pthread_mutex_unlock(v10);
        }
      }
LABEL_36:
      if (++v8 == v5)
        goto LABEL_42;
    }
  }
  v9 = 0;
LABEL_42:
  v27 = 0;
LABEL_43:
  free(v7);
  if (a2)
    *a2 = v9;
  return v27;
}

uint64_t mdb_env_init_meta(uint64_t a1, uint64_t a2)
{
  size_t v4;
  char *v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  char *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  size_t v20;
  int v21;
  uint64_t v22;

  v4 = *(unsigned int *)(a1 + 16);
  v5 = (char *)malloc_type_calloc(2uLL, v4, 0xB4D7345BuLL);
  if (!v5)
    return 12;
  v6 = v5;
  *(_QWORD *)v5 = 0;
  *((_WORD *)v5 + 5) = 8;
  *((_OWORD *)v5 + 1) = *(_OWORD *)a2;
  v7 = *(_OWORD *)(a2 + 16);
  v8 = *(_OWORD *)(a2 + 32);
  v9 = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v5 + 5) = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v5 + 4) = v9;
  *((_OWORD *)v5 + 3) = v8;
  *((_OWORD *)v5 + 2) = v7;
  v10 = *(_OWORD *)(a2 + 80);
  v11 = *(_OWORD *)(a2 + 96);
  v12 = *(_OWORD *)(a2 + 112);
  *((_QWORD *)v5 + 18) = *(_QWORD *)(a2 + 128);
  *((_OWORD *)v5 + 8) = v12;
  *((_OWORD *)v5 + 7) = v11;
  *((_OWORD *)v5 + 6) = v10;
  v13 = &v5[v4];
  *(_QWORD *)v13 = 1;
  *((_WORD *)v13 + 5) = 8;
  *((_OWORD *)v13 + 1) = *(_OWORD *)a2;
  v14 = *(_OWORD *)(a2 + 16);
  v15 = *(_OWORD *)(a2 + 32);
  v16 = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v13 + 5) = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v13 + 4) = v16;
  *((_OWORD *)v13 + 3) = v15;
  *((_OWORD *)v13 + 2) = v14;
  v17 = *(_OWORD *)(a2 + 80);
  v18 = *(_OWORD *)(a2 + 96);
  v19 = *(_OWORD *)(a2 + 112);
  *((_QWORD *)v13 + 18) = *(_QWORD *)(a2 + 128);
  *((_OWORD *)v13 + 8) = v19;
  *((_OWORD *)v13 + 7) = v18;
  *((_OWORD *)v13 + 6) = v17;
  v20 = (2 * v4);
  while (1)
  {
    v21 = pwrite(*(_DWORD *)a1, v6, v20, 0);
    if (v21 != -1)
      break;
    if (*__error() != 4)
      goto LABEL_11;
  }
  if (v21 < 0)
  {
LABEL_11:
    v22 = *__error();
    goto LABEL_12;
  }
  if ((_DWORD)v20 == v21)
    v22 = 0;
  else
    v22 = 28;
LABEL_12:
  free(v6);
  return v22;
}

uint64_t mdb_env_copythr(uint64_t a1)
{
  int v2;
  uint64_t i;
  int v4;
  uint64_t v5;
  _DWORD *v6;
  int v7;
  int v8;
  uint64_t v9;
  char *v10;
  int *v11;
  const void **v12;
  unsigned int v13;
  BOOL v14;
  int v15;
  int v17;
  sigset_t v18;

  v18 = 4096;
  v2 = pthread_sigmask(1, &v18, 0);
  if (v2)
    *(_DWORD *)(a1 + 196) = v2;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  for (i = 0; ; i ^= 1uLL)
  {
    while (1)
    {
      v4 = *(_DWORD *)(a1 + 192);
      if (v4)
        break;
      pthread_cond_wait((pthread_cond_t *)(a1 + 80), (pthread_mutex_t *)(a1 + 16));
    }
    if (v4 == 16)
      break;
    v5 = a1 + 4 * i;
    v8 = *(_DWORD *)(v5 + 160);
    v6 = (_DWORD *)(v5 + 160);
    v7 = v8;
    v9 = a1 + 8 * i;
    v10 = *(char **)(v9 + 128);
    v11 = v6 + 2;
    v12 = (const void **)(v9 + 144);
    while (1)
    {
      if (v7 >= 1)
      {
        while (1)
        {
          if (*(_DWORD *)(a1 + 196))
            goto LABEL_20;
          v13 = write(*(_DWORD *)(a1 + 184), v10, v7);
          if ((v13 & 0x80000000) != 0)
            break;
          if (!v13)
          {
            v15 = 5;
LABEL_19:
            *(_DWORD *)(a1 + 196) = v15;
            goto LABEL_20;
          }
          v10 += v13;
          v14 = __OFSUB__(v7, v13);
          v7 -= v13;
          if ((v7 < 0) ^ v14 | (v7 == 0))
            goto LABEL_20;
        }
        v15 = *__error();
        if (!v15)
          goto LABEL_20;
        if (v15 == 32)
        {
          v17 = 0;
          sigwait(&v18, &v17);
          v15 = 32;
        }
        goto LABEL_19;
      }
LABEL_20:
      v7 = *v11;
      if (!*v11)
        break;
      v10 = (char *)*v12;
      *v11 = 0;
    }
    *v6 = 0;
    --*(_DWORD *)(a1 + 192);
    pthread_cond_signal((pthread_cond_t *)(a1 + 80));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  return 0;
}

uint64_t mdb_env_cwalk(uint64_t a1, unint64_t *a2, char a3)
{
  unint64_t v4;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int16 v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  int v15;
  _WORD *v16;
  unsigned int v17;
  unsigned int v18;
  __int16 v19;
  char *v20;
  unsigned __int16 v21;
  char *i;
  uint64_t v23;
  __int16 v24;
  char *v25;
  char **v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _WORD *v31;
  char *v32;
  __int16 v33;
  char *v34;
  __int128 v35;
  __int128 v36;
  char *v37;
  __int128 v38;
  __int128 v39;
  char *v40;
  unint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  unsigned int *v47;
  uint64_t v48;
  unsigned int v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  int v59;
  uint64_t v60;
  void *__src[2];
  __int128 v62;
  __int128 v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _OWORD v69[20];
  uint64_t v70;

  v70 = 0;
  memset(v69, 0, sizeof(v69));
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v4 = *a2;
  if (v4 == -1)
    return 0;
  LOWORD(v69[0]) = 1;
  *((_QWORD *)&v66 + 1) = *(_QWORD *)(a1 + 8);
  DWORD1(v69[0]) = *(_DWORD *)(*((_QWORD *)&v66 + 1) + 124) & 0xA0000;
  v7 = mdb_page_get((uint64_t)&v65, v4, (unint64_t *)v69 + 1, 0);
  if (!(_DWORD)v7)
  {
    v7 = mdb_page_search_root((uint64_t)&v65, 0, 4);
    if (!(_DWORD)v7)
    {
      v8 = malloc_type_malloc(*(_DWORD *)(*(_QWORD *)a1 + 16) * LOWORD(v69[0]), 0xFFCC827BuLL);
      if (v8)
      {
        v9 = v8;
        v10 = WORD1(v69[0]);
        if (WORD1(v69[0]))
        {
          v11 = 0;
          LODWORD(v12) = *(_DWORD *)(*(_QWORD *)a1 + 16);
          v13 = (char *)v8;
          do
          {
            mdb_page_copy(v13, *((_WORD **)v69 + v11 + 1), v12);
            *((_QWORD *)v69 + v11 + 1) = v13;
            v12 = *(unsigned int *)(*(_QWORD *)a1 + 16);
            v13 += v12;
            ++v11;
            v10 = WORD1(v69[0]);
          }
          while (v11 < WORD1(v69[0]));
        }
        else
        {
          v13 = (char *)v8;
        }
        if (LOWORD(v69[0]))
        {
          v58 = v9;
          v15 = *(_DWORD *)(a1 + 188);
          v59 = a3 & 4;
          while (1)
          {
            v16 = (_WORD *)*((_QWORD *)v69 + v10 + 1);
            v64 = v16;
            v17 = (unsigned __int16)v16[6] - 16;
            v18 = v17 >> 1;
            v19 = v16[5];
            if ((v19 & 2) != 0)
            {
              if (v19 & 0x20 | v59)
                v27 = 0;
              else
                v27 = v17 >= 2;
              if (v27)
              {
                if (v18 <= 1)
                  v28 = 1;
                else
                  v28 = v18;
                v29 = -v28;
                v30 = 8;
                v60 = -v28;
                do
                {
                  v31 = v64;
                  v32 = (char *)v64 + *((unsigned __int16 *)v64 + v30);
                  v33 = *((_WORD *)v32 + 2);
                  if ((v33 & 1) != 0)
                  {
                    __src[0] = 0;
                    if (v64 != v13)
                    {
                      *((_QWORD *)v69 + WORD1(v69[0]) + 1) = v13;
                      mdb_page_copy(v13, v31, *(_DWORD *)(*(_QWORD *)a1 + 16));
                      v64 = v13;
                      v32 = &v13[*(unsigned __int16 *)&v13[2 * v30]];
                    }
                    v40 = &v32[*((unsigned __int16 *)v32 + 3)];
                    v41 = *((_QWORD *)v40 + 1);
                    *((_QWORD *)v40 + 1) = *(_QWORD *)(a1 + 176);
                    v23 = mdb_page_get((uint64_t)&v65, v41, (unint64_t *)__src, 0);
                    if ((_DWORD)v23)
                      goto LABEL_59;
                    v42 = *(_DWORD *)(a1 + 4 * v15 + 160);
                    if (v42 < 0x100000)
                    {
                      v43 = v15;
                    }
                    else
                    {
                      v23 = mdb_env_cthr_toggle(a1, 1);
                      if ((_DWORD)v23)
                        goto LABEL_59;
                      v15 = *(_DWORD *)(a1 + 188);
                      v43 = v15;
                      v42 = *(_DWORD *)(a1 + 4 * v15 + 160);
                    }
                    v44 = a1 + 8 * v43;
                    v45 = a1 + 4 * v43;
                    v46 = (_QWORD *)(*(_QWORD *)(v44 + 128) + v42);
                    v47 = (unsigned int *)__src[0];
                    memcpy(v46, __src[0], *(unsigned int *)(*(_QWORD *)a1 + 16));
                    *v46 = *(_QWORD *)(a1 + 176);
                    *(_QWORD *)(a1 + 176) += v47[3];
                    v48 = *(_QWORD *)a1;
                    *(_DWORD *)(v45 + 160) += *(_DWORD *)(*(_QWORD *)a1 + 16);
                    v49 = v47[3];
                    if (v49 >= 2)
                    {
                      *(_DWORD *)(v45 + 168) = *(_DWORD *)(v48 + 16) * (v49 - 1);
                      *(_QWORD *)(v44 + 144) = (char *)v47 + *(unsigned int *)(v48 + 16);
                      v23 = mdb_env_cthr_toggle(a1, 1);
                      if ((_DWORD)v23)
                        goto LABEL_59;
                      v15 = *(_DWORD *)(a1 + 188);
                    }
                    v29 = v60;
                  }
                  else if ((v33 & 2) != 0)
                  {
                    v62 = 0u;
                    v63 = 0u;
                    *(_OWORD *)__src = 0u;
                    if (v64 != v13)
                    {
                      *((_QWORD *)v69 + WORD1(v69[0]) + 1) = v13;
                      mdb_page_copy(v13, v31, *(_DWORD *)(*(_QWORD *)a1 + 16));
                      v64 = v13;
                      v32 = &v13[*(unsigned __int16 *)&v13[2 * v30]];
                    }
                    v34 = &v32[*((unsigned __int16 *)v32 + 3) + 8];
                    v35 = *(_OWORD *)v34;
                    v36 = *((_OWORD *)v34 + 2);
                    v62 = *((_OWORD *)v34 + 1);
                    v63 = v36;
                    *(_OWORD *)__src = v35;
                    *(_DWORD *)(a1 + 188) = v15;
                    v23 = mdb_env_cwalk(a1, (char *)&v63 + 8, *((_WORD *)v32 + 2) & 4);
                    if ((_DWORD)v23)
                      goto LABEL_59;
                    v15 = *(_DWORD *)(a1 + 188);
                    v37 = &v32[*((unsigned __int16 *)v32 + 3) + 8];
                    v39 = v62;
                    v38 = v63;
                    *(_OWORD *)v37 = *(_OWORD *)__src;
                    *((_OWORD *)v37 + 1) = v39;
                    *((_OWORD *)v37 + 2) = v38;
                  }
                  ++v30;
                }
                while (v29 + v30 != 8);
              }
            }
            else
            {
              v20 = (char *)&v65 + 2 * v10;
              v21 = *((_WORD *)v20 + 164) + 1;
              *((_WORD *)v20 + 164) = v21;
              if (v18 > v21)
              {
                for (i = (char *)v16 + (unsigned __int16)v16[v21 + 8];
                      ;
                      i = &v25[*(unsigned __int16 *)&v25[2 * *((unsigned __int16 *)&v69[16] + WORD1(v69[0]) + 4) + 16]])
                {
                  v23 = mdb_page_get((uint64_t)&v65, *(unsigned int *)i | ((unint64_t)*((unsigned __int16 *)i + 2) << 32), (unint64_t *)&v64, 0);
                  if ((_DWORD)v23)
                    break;
                  v10 = WORD1(v69[0]) + 1;
                  WORD1(v69[0]) = v10;
                  v24 = ++LOWORD(v69[0]);
                  *((_WORD *)&v69[16] + v10 + 4) = 0;
                  v25 = (char *)v64;
                  v26 = (char **)v69 + v10 + 1;
                  if ((*((_BYTE *)v64 + 10) & 1) == 0)
                  {
                    *v26 = (char *)v64;
                    goto LABEL_56;
                  }
                  mdb_page_copy(*v26, v64, *(_DWORD *)(*(_QWORD *)a1 + 16));
                }
LABEL_59:
                v7 = v23;
                goto LABEL_60;
              }
            }
            v50 = *(_DWORD *)(a1 + 4 * v15 + 160);
            if (v50 < 0x100000)
            {
              v51 = v15;
            }
            else
            {
              v23 = mdb_env_cthr_toggle(a1, 1);
              if ((_DWORD)v23)
                goto LABEL_59;
              v15 = *(_DWORD *)(a1 + 188);
              v51 = v15;
              v50 = *(_DWORD *)(a1 + 4 * v15 + 160);
            }
            v52 = a1 + 4 * v51;
            v53 = *(_QWORD *)(a1 + 8 * v51 + 128) + v50;
            mdb_page_copy((char *)v53, v64, *(_DWORD *)(*(_QWORD *)a1 + 16));
            v54 = *(_QWORD *)(a1 + 176);
            *(_QWORD *)(a1 + 176) = v54 + 1;
            *(_QWORD *)v53 = v54;
            *(_DWORD *)(v52 + 160) += *(_DWORD *)(*(_QWORD *)a1 + 16);
            v55 = WORD1(v69[0]);
            if (!WORD1(v69[0]))
            {
              v7 = 0;
              *a2 = *(_QWORD *)v53;
              goto LABEL_60;
            }
            v56 = *((_QWORD *)v69 + WORD1(v69[0]));
            v57 = v56
                + *(unsigned __int16 *)(v56
                                      + 2 * *((unsigned __int16 *)&v69[16] + WORD1(v69[0]) + 3)
                                      + 16);
            *(_DWORD *)v57 = *(_QWORD *)v53;
            *(_WORD *)(v57 + 4) = *(_DWORD *)(v53 + 4);
            if (!LOWORD(v69[0]))
              goto LABEL_63;
            if (!--LOWORD(v69[0]))
              break;
            v10 = v55 - 1;
            WORD1(v69[0]) = v10;
            v24 = 1;
LABEL_56:
            if (!v24)
            {
LABEL_63:
              v7 = 0;
              goto LABEL_60;
            }
          }
          v7 = 0;
          DWORD1(v69[0]) &= ~1u;
LABEL_60:
          v9 = v58;
        }
        else
        {
          v7 = 0;
        }
        free(v9);
      }
      else
      {
        return 12;
      }
    }
  }
  return v7;
}

uint64_t mdb_env_cthr_toggle(uint64_t a1, int a2)
{
  pthread_mutex_t *v4;
  int v5;

  v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  *(_DWORD *)(a1 + 192) += a2;
  pthread_cond_signal((pthread_cond_t *)(a1 + 80));
  while ((*(_BYTE *)(a1 + 192) & 2) != 0)
    pthread_cond_wait((pthread_cond_t *)(a1 + 80), v4);
  pthread_mutex_unlock(v4);
  v5 = *(_DWORD *)(a1 + 188) ^ a2 & 1;
  *(_DWORD *)(a1 + 188) = v5;
  *(_DWORD *)(a1 + 4 * v5 + 160) = 0;
  return *(unsigned int *)(a1 + 196);
}
