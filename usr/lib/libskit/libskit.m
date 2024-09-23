float skit::entity_token_wgt(skit *this, float a2)
{
  return (float)((float)(a2 * 4.0) + -1.0) / (float)(a2 + (float)(a2 * a2));
}

float skit::entity_token_wgt(skit *this)
{
  if (this > 0x10)
    return (float)((float)((float)this * 4.0) + -1.0)
         / (float)((float)this + (float)((float)this * (float)this));
  else
}

_QWORD *skit::FieldSpanMatcherV3::FieldSpanMatcherV3(_QWORD *a1, uint64_t a2, __int128 **a3, char a4)
{
  char v6;

  v6 = a4;
  std::allocate_shared[abi:ne180100]<skit::internal::FieldSpanMatcherImpl,std::allocator<skit::internal::FieldSpanMatcherImpl>,std::basic_string<char16_t> &,skit::TokenStream &,BOOL &,void>(a1, a2, a3, &v6);
  return a1;
}

{
  char v6;

  v6 = a4;
  std::allocate_shared[abi:ne180100]<skit::internal::FieldSpanMatcherImpl,std::allocator<skit::internal::FieldSpanMatcherImpl>,std::basic_string<char16_t> &,skit::TokenStream &,BOOL &,void>(a1, a2, a3, &v6);
  return a1;
}

void std::allocate_shared[abi:ne180100]<skit::internal::FieldSpanMatcherImpl,std::allocator<skit::internal::FieldSpanMatcherImpl>,std::basic_string<char16_t> &,skit::TokenStream &,BOOL &,void>(_QWORD *a1, uint64_t a2, __int128 **a3, char *a4)
{
  char *v8;
  __int128 v9;
  __int128 *v10;
  __int128 *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  _DWORD *v22;
  std::basic_string<char16_t> *v23;
  std::basic_string<char16_t> *v24;
  int v25;
  const std::basic_string<char16_t>::value_type *v26;
  std::basic_string<char16_t>::size_type v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  uint64_t v33;
  unsigned int v34;
  unsigned int v35;
  BOOL v36;
  int v37;
  unsigned int v38;
  unsigned int i;
  unsigned int v40;
  int v41;
  _WORD *v42;
  _QWORD *v43;
  _OWORD v44[2];
  std::basic_string<char16_t> v45;
  _OWORD *v46;
  char v47;
  void **v48[3];
  char v49;
  uint64_t v50;
  uint64_t v51;

  v8 = (char *)operator new(0x5E8uLL);
  *((_QWORD *)v8 + 1) = 0;
  *((_QWORD *)v8 + 2) = 0;
  *(_QWORD *)v8 = &off_1E8687448;
  if (*(char *)(a2 + 23) < 0)
    std::basic_string<char16_t>::__init_copy_ctor_external(&v45, *(const std::basic_string<char16_t>::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    v45 = *(std::basic_string<char16_t> *)a2;
  v9 = 0uLL;
  memset(v44, 0, 24);
  v10 = *a3;
  v11 = a3[1];
  v46 = v44;
  v47 = 0;
  v12 = (char *)v11 - (char *)v10;
  if (v11 != v10)
  {
    v13 = 0xAAAAAAAAAAAAAAABLL * (v12 >> 4);
    if (v13 >= 0x555555555555556)
      std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
    *(_QWORD *)&v44[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<skit::Token>>(v13);
    *((_QWORD *)&v44[0] + 1) = *(_QWORD *)&v44[0];
    *(_QWORD *)&v44[1] = *(_QWORD *)&v44[0] + 48 * v14;
    v50 = *(_QWORD *)&v44[0];
    v51 = *(_QWORD *)&v44[0];
    v48[0] = (void **)&v44[1];
    v48[1] = (void **)&v50;
    v48[2] = (void **)&v51;
    v49 = 0;
    v15 = *(_QWORD *)&v44[0];
    do
    {
      if (*((char *)v10 + 23) < 0)
      {
        std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)v15, *(const std::basic_string<char16_t>::value_type **)v10, *((_QWORD *)v10 + 1));
        v17 = v51;
      }
      else
      {
        v16 = *v10;
        *(_QWORD *)(v15 + 16) = *((_QWORD *)v10 + 2);
        *(_OWORD *)v15 = v16;
        v17 = v15;
      }
      v18 = *(__int128 *)((char *)v10 + 24);
      *(_QWORD *)(v15 + 40) = *((_QWORD *)v10 + 5);
      *(_OWORD *)(v15 + 24) = v18;
      v10 += 3;
      v15 = v17 + 48;
      v51 = v17 + 48;
    }
    while (v10 != v11);
    v49 = 1;
    std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<skit::Token>,skit::Token*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v48);
    *((_QWORD *)&v44[0] + 1) = v15;
    v9 = v44[0];
    v12 = *(_QWORD *)&v44[1];
  }
  v19 = *a4;
  *(_OWORD *)(v8 + 24) = v9;
  *((_QWORD *)v8 + 12) = v8 + 112;
  *((_QWORD *)v8 + 5) = v12;
  memset(v44, 0, 24);
  *((std::basic_string<char16_t> *)v8 + 2) = v45;
  memset(&v45, 0, sizeof(v45));
  *((_QWORD *)v8 + 9) = 0;
  *((_OWORD *)v8 + 5) = 0u;
  *((_QWORD *)v8 + 13) = 0x8000000000;
  *((_WORD *)v8 + 312) = 0;
  v8[626] = v19;
  v8[632] = 0;
  *((_QWORD *)v8 + 80) = v8 + 656;
  *((_QWORD *)v8 + 81) = 0x800000000;
  *(_OWORD *)(v8 + 664) = 0u;
  *((_QWORD *)v8 + 85) = v8 + 696;
  *((_QWORD *)v8 + 86) = 0x200000000;
  *((_QWORD *)v8 + 97) = v8 + 792;
  *((_QWORD *)v8 + 98) = 0x400000000;
  *((_QWORD *)v8 + 151) = v8 + 1224;
  v20 = v9;
  *((_QWORD *)v8 + 152) = 0x400000000;
  v21 = *((_QWORD *)&v9 + 1);
  if ((_QWORD)v9 == *((_QWORD *)&v9 + 1))
  {
    LOBYTE(v28) = 0;
LABEL_22:
    LODWORD(v28) = v28;
    goto LABEL_24;
  }
  v22 = (_DWORD *)(v9 + 24);
  std::basic_string<char16_t>::reserve((std::basic_string<char16_t> *)v8 + 3, (*(_DWORD *)(*((_QWORD *)&v9 + 1) - 20) - *(_DWORD *)(v9 + 24)));
  v23 = (std::basic_string<char16_t> *)(v8 + 72);
  do
  {
    v24 = std::basic_string<char16_t>::append(v23, (*(_DWORD *)(v20 + 24) - *v22), 32);
    v25 = *(char *)(v20 + 23);
    if (v25 >= 0)
      v26 = (const std::basic_string<char16_t>::value_type *)v20;
    else
      v26 = *(const std::basic_string<char16_t>::value_type **)v20;
    if (v25 >= 0)
      v27 = *(unsigned __int8 *)(v20 + 23);
    else
      v27 = *(_QWORD *)(v20 + 8);
    v23 = std::basic_string<char16_t>::append(v24, v26, v27);
    v22 = (_DWORD *)(v20 + 28);
    v20 += 48;
  }
  while (v20 != v21);
  LODWORD(v28) = v8[95];
  if ((v28 & 0x80000000) == 0)
    goto LABEL_22;
  v28 = *((_QWORD *)v8 + 10);
LABEL_24:
  if (*((_DWORD *)v8 + 27) < (v28 + 1))
    skit::SmallVector<skit::internal::FieldSpanMatcherImpl::MapToken,128u,true>::_reserve_more((uint64_t)(v8 + 96), v28 + 1);
  v43 = a1;
  v29 = *((_QWORD *)v8 + 3);
  v30 = *((_QWORD *)v8 + 4);
  if (v29 == v30)
  {
    LOWORD(v48[0]) = 0;
  }
  else
  {
    v31 = 0;
    v32 = 0;
    *((_WORD *)v8 + 312) = *(_DWORD *)(v29 + 24);
    LOWORD(v48[0]) = 0;
    do
    {
      if (*(char *)(v29 + 23) < 0)
        v33 = *(_QWORD *)(v29 + 8);
      else
        LODWORD(v33) = *(unsigned __int8 *)(v29 + 23);
      v34 = *(_DWORD *)(v29 + 24) - v32;
      v35 = v34 + v33;
      if (v31)
        v36 = v35 > v34;
      else
        v36 = 0;
      v37 = v36;
      if (v36)
        v38 = v34 + 1;
      else
        v38 = v34;
      for (i = v38; i; --i)
        skit::SmallVector<skit::internal::FieldSpanMatcherImpl::MapToken,128u,true>::emplace_back<unsigned short &,unsigned short &>((size_t)(v8 + 96), v48, (__int16 *)v48);
      if (v38 < v35)
      {
        v40 = *((_DWORD *)v8 + 26);
        v41 = v33 - v37;
        do
        {
          if (v40 == *((_DWORD *)v8 + 27))
          {
            skit::SmallVector<skit::internal::FieldSpanMatcherImpl::MapToken,128u,true>::_reserve_more((uint64_t)(v8 + 96), v40 + (v40 >> 1) + 1);
            v40 = *((_DWORD *)v8 + 26);
          }
          v42 = (_WORD *)(*((_QWORD *)v8 + 12) + 4 * v40);
          *v42 = v31;
          v42[1] = v31 + 1;
          *((_DWORD *)v8 + 26) = ++v40;
          --v41;
        }
        while (v41);
      }
      LOWORD(v48[0]) = ++v31;
      v32 = *(_DWORD *)(v29 + 28);
      v29 += 48;
    }
    while (v29 != v30);
  }
  skit::SmallVector<skit::internal::FieldSpanMatcherImpl::MapToken,128u,true>::emplace_back<unsigned short &,unsigned short &>((size_t)(v8 + 96), v48, (__int16 *)v48);
  v48[0] = (void **)v44;
  std::vector<skit::Token>::__destroy_vector::operator()[abi:ne180100](v48);
  *v43 = v8 + 24;
  v43[1] = v8;
}

void sub_1CB7493E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, char *a13, void **a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,char a25,uint64_t a26,char *a27)
{
  uint64_t v27;
  void **v28;
  void *v30;
  void *v31;

  skit::SmallVector<skit::AliasSpanMatch,4u,true>::~SmallVector((uint64_t)(v28 + 139));
  skit::SmallVector<skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>,4u,true>::~SmallVector((uint64_t)(v28 + 85));
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)(v28 + 73));
  std::shared_ptr<skit::internal::AliasImpl>::~shared_ptr[abi:ne180100](a9);
  v30 = *(void **)(v27 + 640);
  if (v30 != a10)
    free(v30);
  if (*v28 != a11)
    free(*v28);
  if (*(char *)(v27 + 95) < 0)
    operator delete(*a14);
  if (*(char *)(v27 + 71) < 0)
    operator delete(*(v28 - 6));
  a27 = a13;
  std::vector<skit::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&a27);
  a27 = &a15;
  std::vector<skit::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&a27);
  std::__shared_weak_count::~__shared_weak_count((std::__shared_weak_count *)v27);
  operator delete(v31);
  _Unwind_Resume(a1);
}

void std::basic_string<char16_t>::__init_copy_ctor_external(std::basic_string<char16_t> *this, const std::basic_string<char16_t>::value_type *__s, std::basic_string<char16_t>::size_type __sz)
{
  std::basic_string<char16_t> *v5;
  std::basic_string<char16_t>::size_type v6;
  std::basic_string<char16_t> *v7;
  uint64_t v8;

  v5 = this;
  if (__sz > 0xA)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((__sz | 3) != 0xB)
      v6 = __sz | 3;
    v7 = (std::basic_string<char16_t> *)std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v8 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)v7;
    v5 = v7;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, 2 * __sz + 2);
}

void std::vector<skit::Token>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 25) < 0)
          operator delete(*(v4 - 6));
        v4 -= 6;
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<skit::Token>,skit::Token*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  uint64_t v3;
  uint64_t v4;

  if (!*(_BYTE *)(a1 + 24))
  {
    v3 = **(_QWORD **)(a1 + 16);
    v4 = **(_QWORD **)(a1 + 8);
    while (v3 != v4)
    {
      if (*(char *)(v3 - 25) < 0)
        operator delete(*(void **)(v3 - 48));
      v3 -= 48;
    }
  }
  return a1;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void std::vector<skit::Token>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<skit::Token>>(unint64_t a1)
{
  if (a1 >= 0x555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(48 * a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E8686E58, MEMORY[0x1E0DE42D0]);
}

void sub_1CB74970C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void std::basic_string<char16_t>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(uint64_t a1)
{
  if (a1 < 0)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(2 * a1);
}

void std::__shared_ptr_emplace<skit::internal::FieldSpanMatcherImpl>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E8687448;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<skit::internal::FieldSpanMatcherImpl>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E8687448;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D179DDB4);
}

void std::__shared_ptr_emplace<skit::internal::FieldSpanMatcherImpl>::__on_zero_shared(uint64_t a1)
{
  void *v2;
  void *v3;
  void **v4;

  skit::SmallVector<skit::AliasSpanMatch,4u,true>::~SmallVector(a1 + 1208);
  skit::SmallVector<skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>,4u,true>::~SmallVector(a1 + 776);
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector(a1 + 680);
  std::shared_ptr<skit::internal::AliasImpl>::~shared_ptr[abi:ne180100](a1 + 664);
  v2 = *(void **)(a1 + 640);
  if (v2 != (void *)(a1 + 656))
    free(v2);
  v3 = *(void **)(a1 + 96);
  if (v3 != (void *)(a1 + 112))
    free(v3);
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  if (*(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
  v4 = (void **)(a1 + 24);
  std::vector<skit::Token>::__destroy_vector::operator()[abi:ne180100](&v4);
}

uint64_t skit::SmallVector<skit::AliasSpanMatch,4u,true>::~SmallVector(uint64_t a1)
{
  skit::SmallVector<skit::AliasSpanMatch,4u,true>::_destroy(*(_QWORD *)a1, *(_DWORD *)(a1 + 8));
  if (*(_QWORD *)a1 != a1 + 16)
    free(*(void **)a1);
  return a1;
}

uint64_t skit::SmallVector<skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>,4u,true>::~SmallVector(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  uint64_t v4;

  v2 = *(void **)a1;
  v3 = *(_DWORD *)(a1 + 8);
  if (v3)
  {
    v4 = 104 * v3;
    do
    {
      v2 = (void *)(skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>::~AliasSpanMatchImpl((uint64_t)v2)
                  + 104);
      v4 -= 104;
    }
    while (v4);
    v2 = *(void **)a1;
  }
  if (v2 != (void *)(a1 + 16))
    free(v2);
  return a1;
}

uint64_t skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector(uint64_t a1)
{
  skit::SmallVector<skit::AliasMatch,2u,true>::_destroy(*(_QWORD *)a1, *(_DWORD *)(a1 + 8));
  if (*(_QWORD *)a1 != a1 + 16)
    free(*(void **)a1);
  return a1;
}

uint64_t std::shared_ptr<skit::internal::AliasImpl>::~shared_ptr[abi:ne180100](uint64_t a1)
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

void skit::SmallVector<skit::AliasMatch,2u,true>::_destroy(uint64_t a1, unsigned int a2)
{
  uint64_t v3;

  if (a2)
  {
    v3 = 40 * a2;
    do
    {
      if (*(char *)(a1 + 23) < 0)
        operator delete(*(void **)a1);
      a1 += 40;
      v3 -= 40;
    }
    while (v3);
  }
}

uint64_t skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>::~AliasSpanMatchImpl(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 72);
  if (v2 != (void *)(a1 + 88))
    free(v2);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

void skit::SmallVector<skit::AliasSpanMatch,4u,true>::_destroy(uint64_t a1, unsigned int a2)
{
  uint64_t v3;

  if (a2)
  {
    v3 = 72 * a2;
    do
    {
      if (*(char *)(a1 + 23) < 0)
        operator delete(*(void **)a1);
      a1 += 72;
      v3 -= 72;
    }
    while (v3);
  }
}

BOOL skit::FieldSpanMatcherV3::is_initialized(skit::FieldSpanMatcherV3 *this)
{
  return *(_QWORD *)this != 0;
}

uint64_t skit::FieldSpanMatcherV3::query_token_stream_begin(skit::FieldSpanMatcherV3 *this)
{
  if (*(_QWORD *)this)
    return **(_QWORD **)this;
  else
    return 0;
}

{
  if (*(_QWORD *)this)
    return **(_QWORD **)this;
  else
    return 0;
}

uint64_t skit::FieldSpanMatcherV3::query_token_stream_end(skit::FieldSpanMatcherV3 *this)
{
  if (*(_QWORD *)this)
    return *(_QWORD *)(*(_QWORD *)this + 8);
  else
    return 0;
}

{
  if (*(_QWORD *)this)
    return *(_QWORD *)(*(_QWORD *)this + 8);
  else
    return 0;
}

uint64_t skit::FieldSpanMatcherV3::alias_span_matcher(uint64_t *a1, __int128 *a2, char a3, uint64_t a4)
{
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v9;
  uint64_t v10[2];
  _QWORD v11[11];

  v11[10] = *MEMORY[0x1E0C80C00];
  v10[0] = (uint64_t)v11;
  v10[1] = 0x200000000;
  v9 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = skit::FieldSpanMatcherV3::alias_span_matcher(a1, (uint64_t)&v9, a3, a4, v10, 0);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
  if (*((_QWORD *)&v9 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)v10);
  return v4;
}

void sub_1CB749BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  std::shared_ptr<skit::internal::AliasImpl>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)&a12);
  _Unwind_Resume(a1);
}

uint64_t skit::FieldSpanMatcherV3::alias_span_matcher(uint64_t *a1, uint64_t a2, char a3, uint64_t a4, uint64_t *a5, int a6)
{
  uint64_t v6;
  uint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  __int128 v12;

  v6 = *a1;
  if (!v6)
    return 0xFFFFFFFFLL;
  v12 = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  v7 = skit::internal::FieldSpanMatcherImpl::alias_span_matcher(v6, &v12, a3, a4, a5, a6);
  v8 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
  if (*((_QWORD *)&v12 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return v7;
}

void sub_1CB749C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<skit::internal::AliasImpl>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void skit::FieldSpanMatcherV3::alias_filters(uint64_t **a1, char a2, uint64_t a3)
{
  uint64_t *v3;

  v3 = *a1;
  if (v3)
    skit::internal::FieldSpanMatcherImpl::alias_filters(v3, a2, a3);
}

void skit::FieldSpanMatcherV3::clear_alias_span_matcher(skit::internal::FieldSpanMatcherImpl **this)
{
  skit::internal::FieldSpanMatcherImpl *v1;

  v1 = *this;
  if (v1)
    skit::internal::FieldSpanMatcherImpl::clear_alias_span_matcher(v1);
}

uint64_t skit::FieldSpanMatcherV3::query_alias_matches_begin(skit::FieldSpanMatcherV3 *this)
{
  if (*(_QWORD *)this)
    return *(_QWORD *)(*(_QWORD *)this + 752);
  else
    return 0;
}

uint64_t skit::FieldSpanMatcherV3::query_alias_matches_end(skit::FieldSpanMatcherV3 *this)
{
  if (*(_QWORD *)this)
    return *(_QWORD *)(*(_QWORD *)this + 752) + 104 * *(unsigned int *)(*(_QWORD *)this + 760);
  else
    return 0;
}

uint64_t skit::FieldSpanMatcherV3::match(uint64_t *a1, uint64_t a2, uint64_t *a3, __int16 a4, unsigned int a5)
{
  uint64_t v5;
  uint64_t v7[2];
  _QWORD v8[11];

  v8[10] = *MEMORY[0x1E0C80C00];
  v7[0] = (uint64_t)v8;
  v7[1] = 0x200000000;
  v5 = *a1;
  if (v5)
    skit::internal::FieldSpanMatcherImpl::match(v5, a2, a3, v7, 0, a4, a5);
  return skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)v7);
}

void sub_1CB749D70(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)va);
  _Unwind_Resume(a1);
}

void skit::FieldSpanMatcherV3::match(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t *a4, int a5, __int16 a6, unsigned int a7)
{
  uint64_t v7;

  v7 = *a1;
  if (v7)
    skit::internal::FieldSpanMatcherImpl::match(v7, a2, a3, a4, a5, a6, a7);
}

uint64_t skit::FieldSpanMatcherV3::merge_field(uint64_t *a1, int32x4_t *a2, int32x4_t *a3, char a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  int32x4_t *v12;
  unsigned int v13;
  skit::SpanMatchV3 *v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void **v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unsigned int v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void **v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  _DWORD *v33;
  void **v34;
  char v36;
  uint64_t v37;
  uint64_t v38[2];

  v4 = *a1;
  if (!*a1)
    goto LABEL_10;
  if ((a4 & 1) == 0)
    *a2 = vaddq_s32(*a2, a3[2]);
  v7 = a3[3].u32[2];
  if (!(_DWORD)v7)
  {
LABEL_10:
    v11 = 0;
    return v11 & 1;
  }
  v8 = 24;
  if (*(_BYTE *)(v4 + 602))
  {
    v9 = v4 + 24;
  }
  else
  {
    v8 = 48;
    v9 = v4 + 48;
  }
  if (*(char *)(v9 + 23) < 0)
  {
    v10 = *(_QWORD *)(v9 + 8);
    v9 = *(_QWORD *)(v4 + v8);
  }
  else
  {
    v10 = *(unsigned __int8 *)(v9 + 23);
  }
  v12 = a2 + 1;
  v13 = a2[1].u32[2];
  v14 = (skit::SpanMatchV3 *)a3[3].i64[0];
  v15 = v7 << 6;
  v16 = v13;
  do
  {
    if (v16 == a2[1].i32[3])
    {
      skit::SmallVector<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,8u,true>::_reserve_more((char **)&a2[1], v16 + (v16 >> 1) + 1);
      v16 = a2[1].u32[2];
    }
    skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::MergedFieldMatchImpl((_QWORD *)(a2[1].i64[0] + 552 * v16), (uint64_t)a3, v14);
    v16 = a2[1].i32[2] + 1;
    a2[1].i32[2] = v16;
    v14 = (skit::SpanMatchV3 *)((char *)v14 + 64);
    v15 -= 64;
  }
  while (v15);
  if (v16 == v13)
  {
    v11 = 0;
    if (!v13)
      return v11 & 1;
  }
  else
  {
    v36 = 0;
    v17 = v12->i64[0];
    v18 = v12->i64[0] + 552 * v13;
    v19 = v17 + 552 * v16;
    v37 = v17;
    do
    {
      v20 = (void **)v19;
      v19 -= 552;
      if (v13)
      {
        v21 = 0;
        v22 = 552 * v13;
        v23 = v37;
        do
        {
          v24 = *(unsigned int *)(v23 + 492);
          v25 = *((_DWORD *)v20 - 16);
          if (v25 >= v24)
          {
            if (v25 == (_DWORD)v24)
              goto LABEL_28;
            v26 = v10 - v24;
            if (v10 < v24)
              std::__throw_out_of_range[abi:ne180100]("string_view::substr");
            v27 = v25 - v24;
            v28 = v9 + 2 * v24;
            if (v26 < v27)
              v27 = v26;
            v38[0] = v28;
            v38[1] = v27;
            if (!skit::is_significant(v38))
            {
LABEL_28:
              skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::merge((char **)v23, v19);
              v21 = 1;
            }
          }
          v23 += 552;
          v22 -= 552;
        }
        while (v22);
        if ((v21 & 1) != 0)
        {
          v29 = (void **)(a2[1].i64[0] + 552 * a2[1].u32[2]);
          std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>> *,skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>> *,skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>> *,0>(v20, v29, v19);
          skit::SmallVector<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,8u,true>::_destroy<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,(void *)0>((uint64_t)(v29 - 69));
          --a2[1].i32[2];
          v36 = 1;
        }
      }
    }
    while (v19 != v18);
    v13 = a2[1].u32[2];
    v12 = a2 + 1;
    v11 = v36;
    if (!v13)
      return v11 & 1;
  }
  v30 = 0;
  do
  {
    if (v30)
    {
      v31 = 0;
      v32 = v12->i64[0];
      v33 = (_DWORD *)(v12->i64[0] + 492);
      while (*(_DWORD *)(v12->i64[0] + 552 * v30 + 488) < *(v33 - 1)
           || *(_DWORD *)(v12->i64[0] + 552 * v30 + 492) > *v33)
      {
        ++v31;
        v33 += 138;
        if (v30 == v31)
        {
          LODWORD(v31) = v30;
          goto LABEL_43;
        }
      }
      v34 = (void **)(v32 + 552 * v13);
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>> *,skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>> *,skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>> *,0>((void **)(v32 + 552 * v30 + 552), v34, v32 + 552 * v30);
      skit::SmallVector<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,8u,true>::_destroy<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,(void *)0>((uint64_t)(v34 - 69));
      v13 = a2[1].i32[2] - 1;
      a2[1].i32[2] = v13;
    }
    else
    {
      LODWORD(v31) = 0;
    }
LABEL_43:
    if ((_DWORD)v31 == v30)
      ++v30;
  }
  while (v30 < v13);
  return v11 & 1;
}

void skit::FieldSpanMatcherV3::finalize(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _DWORD *v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  BOOL v11;
  uint64_t v12;

  v2 = *a1;
  if (*a1 && *(_DWORD *)(a2 + 44))
  {
    v4 = *(_QWORD *)v2;
    v5 = *(_QWORD *)(v2 + 8);
    if (*(_QWORD *)v2 == v5)
    {
      v6 = 0;
    }
    else
    {
      v6 = 0;
      do
      {
        v6 = *(_DWORD *)(v4 + 28) + v6 - *(_DWORD *)(v4 + 24);
        v4 += 48;
      }
      while (v4 != v5);
    }
    if (*(_DWORD *)(a2 + 56))
    {
      v12 = a2 + 48;
      v7 = *(_DWORD **)(a2 + 48);
      do
      {
        v8 = v7[1] - *v7;
        if (v8 < 0x34)
          v9 = 4;
        else
          v9 = 5;
        if (v8 < 0x18)
          v9 = 3;
        if (v8 < 0xB)
          v9 = 2;
        if (v8 < 5)
          v9 = 1;
        if (v8 >= 3)
          v10 = v9;
        else
          v10 = 0;
        skit::internal::FieldSpanMatcherImpl::final_align_and_score<skit::SpanMatchV3>(v2, (uint64_t)v7, *(_DWORD *)(a2 + 44), v6);
        v11 = v8 <= 2 && *(_BYTE *)(v2 + 602) == 0;
        if (v11 && v7[1] - *v7 > v8 && v7[2] > v10)
          skit::SmallVector<skit::SpanMatchV3,4u,true>::erase(v12, (uint64_t)v7);
        else
          v7 += 16;
      }
      while (v7 != (_DWORD *)(*(_QWORD *)(a2 + 48) + ((unint64_t)*(unsigned int *)(a2 + 56) << 6)));
    }
  }
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  int *v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  void **v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = *a1;
  if (*a1)
  {
    v4 = *(_QWORD *)v2;
    v5 = *(_QWORD *)(v2 + 8);
    if (*(_QWORD *)v2 == v5)
    {
      v6 = 0;
    }
    else
    {
      v6 = 0;
      do
      {
        v6 = *(_DWORD *)(v4 + 28) + v6 - *(_DWORD *)(v4 + 24);
        v4 += 48;
      }
      while (v4 != v5);
    }
    v7 = *(_DWORD *)(a2 + 24);
    if (v7)
    {
      v8 = *(_QWORD *)(a2 + 16);
      do
      {
        v9 = *(unsigned int *)(v8 + 8);
        if ((_DWORD)v9)
        {
          v10 = 0;
          v11 = 112 * v9;
          v12 = (int *)(*(_QWORD *)v8 + 44);
          do
          {
            v13 = *v12;
            v12 += 28;
            v10 += v13;
            v11 -= 112;
          }
          while (v11);
        }
        else
        {
          v10 = 0;
        }
        if (*(_DWORD *)(a2 + 12) <= v10)
          v14 = v10;
        else
          v14 = *(_DWORD *)(a2 + 12);
        if (v14)
        {
          v15 = *(_DWORD *)(v8 + 492) - *(_DWORD *)(v8 + 488);
          if (v15 < 0x34)
            v16 = 4;
          else
            v16 = 5;
          if (v15 < 0x18)
            v16 = 3;
          if (v15 < 0xB)
            v16 = 2;
          if (v15 < 5)
            v16 = 1;
          if (v15 >= 3)
            v17 = v16;
          else
            v17 = 0;
          skit::internal::FieldSpanMatcherImpl::final_align_and_score<skit::SpanMatchV3>(v2, v8 + 488, v14, v6);
          if (*(_BYTE *)(v2 + 602)
            || *(_DWORD *)(v8 + 492) - *(_DWORD *)(v8 + 488) <= v15
            || *(_DWORD *)(v8 + 496) <= v17)
          {
            v19 = *(unsigned int *)(v8 + 8);
            if ((_DWORD)v19)
            {
              v20 = 112 * v19;
              v21 = *(_QWORD *)v8 + 48;
              do
              {
                if (*(_DWORD *)(v21 - 16))
                  skit::internal::FieldSpanMatcherImpl::final_align_and_score<skit::SpanMatchV3>(v2, v21, *(_DWORD *)(v21 - 4), v6);
                v21 += 112;
                v20 -= 112;
              }
              while (v20);
            }
            v8 += 552;
            v7 = *(_DWORD *)(a2 + 24);
          }
          else
          {
            v18 = (void **)(*(_QWORD *)(a2 + 16) + 552 * *(unsigned int *)(a2 + 24));
            std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>> *,skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>> *,skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>> *,0>((void **)(v8 + 552), v18, v8);
            skit::SmallVector<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,8u,true>::_destroy<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,(void *)0>((uint64_t)(v18 - 69));
            v7 = *(_DWORD *)(a2 + 24) - 1;
            *(_DWORD *)(a2 + 24) = v7;
          }
        }
        else
        {
          *(_DWORD *)(v8 + 500) = 0;
          v8 += 552;
        }
      }
      while (v8 != *(_QWORD *)(a2 + 16) + 552 * v7);
    }
  }
}

uint64_t skit::internal::AliasImpl::span_match_alias(uint64_t a1, uint64_t a2, uint64_t *a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  _DWORD *v21;
  unsigned int v22;
  uint64_t v23;
  char *v24;
  char *v25;
  size_t v26;
  int v27;
  uint64_t v28;
  _WORD *v29;
  unint64_t v30;
  __int16 v31;
  uint64_t v32;
  void *v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned int *v39;
  unsigned int v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  __int128 *v44;
  uint64_t v45;
  char *v46;
  char *v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  uint64_t v55;
  unsigned int v56;
  uint64_t v57;
  void *__p;
  __int128 v63;
  _QWORD v64[2];
  _QWORD v65[3];

  v65[2] = *MEMORY[0x1E0C80C00];
  v55 = a4;
  v10 = *a3 + 48 * a4;
  if (*(char *)(v10 + 23) < 0)
  {
    v10 = *(_QWORD *)v10;
    v11 = *(_QWORD *)(*a3 + 48 * a4 + 8);
  }
  else
  {
    v11 = *(unsigned __int8 *)(v10 + 23);
  }
  v57 = 2 * v11;
  marisa::Agent::set_query((marisa::Agent *)a6, (const char *)v10);
  if (a5 <= a4 + 1)
    v12 = a4 + 1;
  else
    v12 = a5;
  v56 = v12;
LABEL_8:
  while (1)
  {
    result = marisa::Trie::predictive_search((marisa::Trie *)(a1 + 56), (marisa::Agent *)a6);
    if (!(_DWORD)result)
      return result;
    v14 = *(unsigned int *)(a6 + 32);
    if ((v14 & 1) != 0)
      continue;
    v15 = *(_QWORD *)(a6 + 24);
    v16 = (char *)(v15 + v57);
    v17 = *a3;
    v18 = v15 + v14;
    v19 = a4;
    while (1)
    {
      v20 = v19 + 1;
      if (v20 >= a5)
        break;
      if (!*(_WORD *)v16)
        goto LABEL_26;
      v21 = (_DWORD *)(v17 + 48 * v20);
      v22 = v21[6] - *(_DWORD *)(v17 + 48 * v19 + 28);
      if (v22)
      {
        v23 = 2 * v22;
        v24 = v16;
        while (*(_WORD *)v24 && *(_WORD *)v24 == 32)
        {
          v24 += 2;
          v23 -= 2;
          if (!v23)
            goto LABEL_18;
        }
        goto LABEL_8;
      }
LABEL_18:
      v25 = &v16[2 * v22];
      if (*((char *)v21 + 23) < 0)
      {
        v26 = 2 * *((_QWORD *)v21 + 1);
        if (v18 - (uint64_t)v25 < v26 + 6)
          goto LABEL_8;
        v21 = *(_DWORD **)v21;
      }
      else
      {
        v26 = 2 * *((unsigned __int8 *)v21 + 23);
        if (v18 - (uint64_t)v25 < v26 + 6)
          goto LABEL_8;
      }
      v27 = memcmp(v25, v21, v26);
      v16 = &v25[v26];
      v19 = v20;
      if (v27)
        goto LABEL_8;
    }
    v20 = v56;
    if (*(_WORD *)v16)
      continue;
LABEL_26:
    v28 = *(unsigned int *)(a2 + 8);
    v29 = v16 + 4;
    v30 = v15 + v14;
    if ((unint64_t)(v16 + 4) < v30)
    {
      v31 = *((_WORD *)v16 + 1);
      v32 = v55 | (v20 << 32);
      do
      {
        marisa::Agent::set_query((marisa::Agent *)a7);
        marisa::Trie::reverse_lookup((marisa::Trie *)(a1 + 48), (marisa::Agent *)a7);
        std::basic_string<char16_t>::basic_string[abi:ne180100](&__p, *(void **)(a7 + 24), (unint64_t)*(unsigned int *)(a7 + 32) >> 1);
        v33 = __p;
        v64[0] = v63;
        *(_QWORD *)((char *)v64 + 7) = *(_QWORD *)((char *)&v63 + 7);
        v34 = HIBYTE(v63);
        __p = 0;
        v63 = 0uLL;
        v35 = *(_DWORD *)(a2 + 8);
        if (v35 == *(_DWORD *)(a2 + 12))
        {
          skit::SmallVector<skit::AliasMatch,2u,true>::_reserve_more((__int128 **)a2, v35 + (v35 >> 1) + 1);
          v35 = *(_DWORD *)(a2 + 8);
        }
        v36 = *(_QWORD *)a2 + 40 * v35;
        v65[0] = v64[0];
        *(_QWORD *)((char *)v65 + 7) = *(_QWORD *)((char *)v64 + 7);
        v64[0] = 0;
        *(_QWORD *)((char *)v64 + 7) = 0;
        v37 = v65[0];
        *(_QWORD *)v36 = v33;
        *(_QWORD *)(v36 + 8) = v37;
        *(_QWORD *)(v36 + 15) = *(_QWORD *)((char *)v65 + 7);
        *(_BYTE *)(v36 + 23) = v34;
        *(_QWORD *)(v36 + 24) = v32;
        *(_WORD *)(v36 + 32) = v31;
        ++*(_DWORD *)(a2 + 8);
        if (SHIBYTE(v63) < 0)
          operator delete(__p);
        ++v29;
      }
      while ((unint64_t)v29 < v30);
    }
    if ((_DWORD)v28)
    {
      v38 = 0;
      v39 = (unsigned int *)(*(_QWORD *)a2 + 28);
      while (1)
      {
        v40 = *v39;
        v39 += 10;
        if (v40 > a4)
          break;
        if (v28 == ++v38)
          goto LABEL_8;
      }
      v41 = v38;
      while (1)
      {
        while (1)
        {
          LODWORD(v42) = *(_DWORD *)(a2 + 8);
          if (v28 < v42)
            break;
LABEL_58:
          if (++v41 >= (unint64_t)v28)
            goto LABEL_8;
        }
        v43 = v28;
        while (1)
        {
          while (1)
          {
            v44 = *(__int128 **)a2;
            v45 = *(_QWORD *)a2 + 40 * v43;
            if (*(unsigned __int16 *)(*(_QWORD *)a2 + 40 * v41 + 32) != *(unsigned __int16 *)(v45 + 32))
              goto LABEL_57;
            v46 = (char *)v44 + 40 * v41;
            v47 = (char *)v44 + 40 * v43;
            v48 = *((_DWORD *)v46 + 6);
            v49 = *((_DWORD *)v46 + 7);
            v51 = *((_DWORD *)v47 + 6);
            v50 = *((_DWORD *)v47 + 7);
            if (v48 == v51 && v49 == v50)
              goto LABEL_57;
            if (v51 < v48 || v50 > v49)
              break;
            skit::SmallVector<skit::AliasMatch,2u,true>::erase(a2, v45);
            v42 = *(unsigned int *)(a2 + 8);
            if (v43 >= v42)
              goto LABEL_58;
          }
          if (v48 >= v51 && v49 <= v50)
            break;
LABEL_57:
          if (++v43 >= v42)
            goto LABEL_58;
        }
        skit::SmallVector<skit::AliasMatch,2u,true>::erase(a2, (uint64_t)v44 + 40 * v41);
        v28 = (v28 - 1);
        if (v41 == v28)
          goto LABEL_8;
      }
    }
  }
}

void sub_1CB74A744(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  int v24;
  void *v25;

  if (v24 < 0)
    operator delete(v25);
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::basic_string<char16_t>::basic_string[abi:ne180100](_QWORD *__dst, void *__src, unint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 >= 0xB)
  {
    v7 = (a3 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((a3 | 3) != 0xB)
      v7 = a3 | 3;
    v6 = std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v7 + 1);
    __dst[1] = a3;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = a3;
    v6 = __dst;
    if (!a3)
      goto LABEL_8;
  }
  memmove(v6, __src, 2 * a3);
LABEL_8:
  *((_WORD *)v6 + a3) = 0;
  return __dst;
}

uint64_t skit::SmallVector<skit::AliasMatch,2u,true>::erase(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t i;
  void **v6;
  uint64_t v7;

  v4 = *(_QWORD *)a1 + 40 * *(unsigned int *)(a1 + 8);
  for (i = a2 + 40; i != v4; i += 40)
  {
    v6 = (void **)(i - 40);
    if (*(char *)(i - 17) < 0)
      operator delete(*v6);
    *(_OWORD *)v6 = *(_OWORD *)i;
    v7 = *(_QWORD *)(i + 24);
    *(_QWORD *)(i - 24) = *(_QWORD *)(i + 16);
    *(_BYTE *)(i + 23) = 0;
    *(_WORD *)i = 0;
    *(_QWORD *)(i - 16) = v7;
    *(_WORD *)(i - 8) = *(_WORD *)(i + 32);
  }
  if (*(char *)(v4 - 17) < 0)
    operator delete(*(void **)(v4 - 40));
  --*(_DWORD *)(a1 + 8);
  return a2;
}

size_t skit::SmallVector<skit::AliasMatch,2u,true>::_reserve_more(__int128 **a1, unsigned int a2)
{
  __int128 *v3;
  __int128 *v4;
  __int128 *v5;
  uint64_t v6;
  __int128 *v7;
  __int128 *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  size_t result;
  std::bad_alloc *exception;
  std::bad_alloc *v14;

  v3 = (__int128 *)malloc_type_malloc(40 * a2, 0x10120408116F198uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v14 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v14, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
  }
  v4 = v3;
  v5 = *a1;
  v6 = *((unsigned int *)a1 + 2);
  if ((_DWORD)v6)
  {
    v7 = v3;
    v8 = *a1;
    do
    {
      v9 = *v8;
      *((_QWORD *)v7 + 2) = *((_QWORD *)v8 + 2);
      *v7 = v9;
      *((_QWORD *)v8 + 1) = 0;
      *((_QWORD *)v8 + 2) = 0;
      *(_QWORD *)v8 = 0;
      v10 = *((_QWORD *)v8 + 3);
      *((_WORD *)v7 + 16) = *((_WORD *)v8 + 16);
      *((_QWORD *)v7 + 3) = v10;
      v8 = (__int128 *)((char *)v8 + 40);
      v7 = (__int128 *)((char *)v7 + 40);
    }
    while (v8 != (__int128 *)((char *)v5 + 40 * v6));
    v11 = 40 * v6;
    do
    {
      if (*((char *)v5 + 23) < 0)
        operator delete(*(void **)v5);
      v5 = (__int128 *)((char *)v5 + 40);
      v11 -= 40;
    }
    while (v11);
    v5 = *a1;
  }
  if (v5 != (__int128 *)(a1 + 2))
    free(v5);
  *a1 = v4;
  result = malloc_size(v4);
  *((_DWORD *)a1 + 3) = result / 0x28;
  return result;
}

size_t skit::SmallVector<std::tuple<std::basic_string<char16_t>,skit::GroupId>,2u,true>::_reserve_more(__int128 **a1, unsigned int a2)
{
  __int128 *v3;
  __int128 *v4;
  __int128 *v5;
  uint64_t v6;
  __int128 *v7;
  __int128 *v8;
  __int128 v9;
  uint64_t v10;
  size_t result;
  std::bad_alloc *exception;
  std::bad_alloc *v13;

  v3 = (__int128 *)malloc_type_malloc(32 * a2, 0x1012040F4512C97uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v13 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v13, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
  }
  v4 = v3;
  v5 = *a1;
  v6 = *((unsigned int *)a1 + 2);
  if ((_DWORD)v6)
  {
    v7 = v3;
    v8 = *a1;
    do
    {
      v9 = *v8;
      *((_QWORD *)v7 + 2) = *((_QWORD *)v8 + 2);
      *v7 = v9;
      *((_QWORD *)v8 + 1) = 0;
      *((_QWORD *)v8 + 2) = 0;
      *(_QWORD *)v8 = 0;
      *((_WORD *)v7 + 12) = *((_WORD *)v8 + 12);
      v8 += 2;
      v7 += 2;
    }
    while (v8 != &v5[2 * v6]);
    v10 = 32 * v6;
    do
    {
      if (*((char *)v5 + 23) < 0)
        operator delete(*(void **)v5);
      v5 += 2;
      v10 -= 32;
    }
    while (v10);
    v5 = *a1;
  }
  if (v5 != (__int128 *)(a1 + 2))
    free(v5);
  *a1 = v4;
  result = malloc_size(v4);
  *((_DWORD *)a1 + 3) = result >> 5;
  return result;
}

uint64_t skit::internal::BlobFile::flush_internal_cache(skit::internal::BlobFile *this)
{
  const void *v1;
  size_t v3;
  ssize_t v4;
  uint64_t result;
  NSObject *v6;
  skit::internal::BlobFile *v7;
  uint64_t v8;
  int v9;
  ssize_t v10;
  uint8_t buf[4];
  skit::internal::BlobFile *v12;
  __int16 v13;
  ssize_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v1 = (const void *)*((_QWORD *)this + 6);
  if (!v1)
    return 0;
  v3 = *((_QWORD *)this + 7);
  if (!v3)
    return 0;
  v4 = write(*((_DWORD *)this + 6), v1, v3);
  if (v4 == *((_QWORD *)this + 7))
  {
    result = 0;
    *((_QWORD *)this + 7) = 0;
  }
  else
  {
    v10 = v4;
    if (skit::internal::get_logging_context(void)::once != -1)
    v6 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      v7 = this;
      if (*((char *)this + 23) < 0)
        v7 = *(skit::internal::BlobFile **)this;
      v8 = *((_QWORD *)this + 7);
      v9 = *__error();
      *(_DWORD *)buf = 136446978;
      v12 = v7;
      v13 = 2048;
      v14 = v10;
      v15 = 2048;
      v16 = v8;
      v17 = 1024;
      v18 = v9;
      _os_log_error_impl(&dword_1CB748000, v6, OS_LOG_TYPE_ERROR, "BlobFile::write_internal_cache : blob write failed @ %{public}s : %li < %lu : %{darwin.errno}d", buf, 0x26u);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t skit::internal::BlobFile::open(skit::internal::BlobFile *this, int a2, int a3, unsigned int a4)
{
  skit::internal::BlobFile *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  skit::internal::BlobFile *v16;
  int v17;
  uint8_t buf[4];
  skit::internal::BlobFile *v19;
  __int16 v20;
  int v21;
  stat v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (*((_DWORD *)this + 6) != -1)
    return 0;
  v4 = this;
  if (*((char *)this + 23) < 0)
  {
    if (!*((_QWORD *)this + 1))
    {
LABEL_14:
      if (skit::internal::get_logging_context(void)::once != -1)
      v9 = skit::internal::get_logging_context(void)::logger;
      if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
        return 0xFFFFFFFFLL;
      LOWORD(v22.st_dev) = 0;
      v10 = "BlobFile::open : file path not set";
      v11 = v9;
      v12 = 2;
LABEL_29:
      _os_log_error_impl(&dword_1CB748000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v22, v12);
      return 0xFFFFFFFFLL;
    }
    this = *(skit::internal::BlobFile **)this;
  }
  else if (!*((_BYTE *)this + 23))
  {
    goto LABEL_14;
  }
  v5 = open_dprotected_np((const char *)this, a2, a3, 0, a4);
  *((_DWORD *)v4 + 6) = v5;
  if (v5 < 0)
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v13 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      return 0xFFFFFFFFLL;
    if (*((char *)v4 + 23) < 0)
      v4 = *(skit::internal::BlobFile **)v4;
    v15 = *__error();
    v22.st_dev = 136446466;
    *(_QWORD *)&v22.st_mode = v4;
    WORD2(v22.st_ino) = 1024;
    *(_DWORD *)((char *)&v22.st_ino + 6) = v15;
    v10 = "BlobFile::open : open blob file failed @ %{public}s : %{darwin.errno}d";
    v11 = v13;
    v12 = 18;
    goto LABEL_29;
  }
  memset(&v22, 0, sizeof(v22));
  if (fstat(v5, &v22))
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v14 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      v16 = v4;
      if (*((char *)v4 + 23) < 0)
        v16 = *(skit::internal::BlobFile **)v4;
      v17 = *__error();
      *(_DWORD *)buf = 136446466;
      v19 = v16;
      v20 = 1024;
      v21 = v17;
      _os_log_error_impl(&dword_1CB748000, v14, OS_LOG_TYPE_ERROR, "BlobFile::open : stat blob file failed @ %{public}s : %{darwin.errno}d", buf, 0x12u);
    }
    close(*((_DWORD *)v4 + 6));
    result = 0xFFFFFFFFLL;
    *((_DWORD *)v4 + 6) = -1;
  }
  else
  {
    if (*((_QWORD *)v4 + 8))
    {
      v6 = operator new[]();
      v7 = *((_QWORD *)v4 + 6);
      *((_QWORD *)v4 + 6) = v6;
      if (v7)
        MEMORY[0x1D179DD9C](v7, 0x1000C8077774924);
    }
    result = 0;
    *((_QWORD *)v4 + 4) = v22.st_size;
  }
  return result;
}

uint64_t skit::internal::BlobFile::close(skit::internal::BlobFile *this)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v5;
  skit::internal::BlobFile *v6;
  int v7;
  int v8;
  skit::internal::BlobFile *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((*((_DWORD *)this + 6) & 0x80000000) != 0)
    return 0;
  v2 = skit::internal::BlobFile::flush_internal_cache(this);
  if (close(*((_DWORD *)this + 6)))
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v5 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      v6 = this;
      if (*((char *)this + 23) < 0)
        v6 = *(skit::internal::BlobFile **)this;
      v7 = *__error();
      v8 = 136446466;
      v9 = v6;
      v10 = 1024;
      v11 = v7;
      _os_log_error_impl(&dword_1CB748000, v5, OS_LOG_TYPE_ERROR, "BlobFile::close : blob file close failed @ %{public}s : %{darwin.errno}d", (uint8_t *)&v8, 0x12u);
    }
    v2 = 0xFFFFFFFFLL;
  }
  v3 = *((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = 0;
  if (v3)
    MEMORY[0x1D179DD9C](v3, 0x1000C8077774924);
  *((_DWORD *)this + 6) = -1;
  *((_QWORD *)this + 4) = 0;
  if (*((char *)this + 23) < 0)
  {
    **(_BYTE **)this = 0;
    *((_QWORD *)this + 1) = 0;
  }
  else
  {
    *(_BYTE *)this = 0;
    *((_BYTE *)this + 23) = 0;
  }
  return v2;
}

uint64_t skit::internal::BlobFile::clear(skit::internal::BlobFile *this, std::error_code *a2)
{
  uint64_t result;

  result = *((unsigned int *)this + 6);
  if ((result & 0x80000000) == 0)
  {
    result = close(result);
    *((_DWORD *)this + 6) = -1;
    *((_QWORD *)this + 4) = 0;
  }
  if (*((char *)this + 23) < 0)
  {
    if (!*((_QWORD *)this + 1))
      return result;
    result = *(_QWORD *)this;
  }
  else
  {
    result = (uint64_t)this;
    if (!*((_BYTE *)this + 23))
      return result;
  }
  result = remove((const std::__fs::filesystem::path *)result, a2);
  if (*((char *)this + 23) < 0)
  {
    **(_BYTE **)this = 0;
    *((_QWORD *)this + 1) = 0;
  }
  else
  {
    *(_BYTE *)this = 0;
    *((_BYTE *)this + 23) = 0;
  }
  return result;
}

void skit::internal::BlobFile::append(skit::internal::BlobFile *this, const iovec *a2, iovec *a3, unsigned int a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  iovec *v10;
  size_t iov_len;
  char *iov_base;
  size_t v13;
  char *v14;
  size_t *p_iov_len;
  size_t v16;
  size_t v17;
  ssize_t v18;
  ssize_t v19;
  uint64_t v20;
  const iovec *v21;
  size_t v22;
  int v23;
  const char *v24;
  int v25;
  uint64_t v26;
  iovec *v27;
  size_t v28;
  size_t *v29;
  size_t *v30;
  size_t v31;
  size_t v32;
  ssize_t v33;
  char *v34;
  uint64_t v35;
  NSObject *v36;
  uint32_t v37;
  uint64_t v38;
  size_t v39;
  ssize_t v40;
  const iovec *v41;
  size_t v42;
  int v43;
  uint8_t buf[4];
  const iovec *v45;
  __int16 v46;
  ssize_t v47;
  __int16 v48;
  size_t v49;
  __int16 v50;
  int v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_DWORD *)this + 4) = -1;
  if (a3)
  {
    v7 = 0;
    v8 = 0;
    v9 = a4;
    do
    {
      if (!a3[v7].iov_base)
      {
        if (skit::internal::get_logging_context(void)::once != -1)
        v35 = skit::internal::get_logging_context(void)::logger;
        if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v24 = "BlobFile::append : invalid iov_base pointer";
          goto LABEL_35;
        }
        return;
      }
      v10 = &a3[v7];
      iov_len = a3[v7].iov_len;
      if (!iov_len)
      {
        if (skit::internal::get_logging_context(void)::once != -1)
        v38 = skit::internal::get_logging_context(void)::logger;
        if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
        {
          v39 = v10->iov_len;
          *(_DWORD *)buf = 134217984;
          v45 = (const iovec *)v39;
          v24 = "BlobFile::append : invalid iov_len : %lu";
          v36 = v38;
          v37 = 12;
          goto LABEL_40;
        }
        return;
      }
      v8 += iov_len;
      ++v7;
    }
    while (a4 != v7);
    if ((unint64_t)a2[2].iov_base + v8 > a2[2].iov_len)
      return;
    iov_base = (char *)a2[3].iov_base;
    if (iov_base)
    {
      v13 = a2[3].iov_len;
      if ((void *)(v13 + v8) < a2[4].iov_base)
      {
        v14 = &iov_base[v13];
        p_iov_len = &a3->iov_len;
        do
        {
          memcpy(v14, (const void *)*(p_iov_len - 1), *p_iov_len);
          v16 = *p_iov_len;
          p_iov_len += 2;
          v14 += v16;
          --v9;
        }
        while (v9);
        v17 = a2[3].iov_len + v8;
LABEL_28:
        a2[3].iov_len = v17;
LABEL_29:
        v34 = (char *)a2[2].iov_base;
        *(_QWORD *)this = v34;
        *((_QWORD *)this + 1) = v8;
        *((_DWORD *)this + 4) = 0;
        a2[2].iov_base = &v34[v8];
        return;
      }
      if (v13)
        v25 = a4 + 1;
      else
        v25 = a4;
      MEMORY[0x1E0C80A78]();
      v27 = (iovec *)&buf[-16 * v26];
      bzero(v27, v28);
      if (v13)
      {
        v27->iov_base = iov_base;
        v27->iov_len = v13;
      }
      v29 = &a3->iov_len;
      v30 = &v27[v13 != 0].iov_len;
      do
      {
        v31 = *(v29 - 1);
        v32 = *v29;
        v29 += 2;
        *(v30 - 1) = v31;
        *v30 = v32;
        v30 += 2;
        --v9;
      }
      while (v9);
      v33 = writev(a2[1].iov_len, v27, v25);
      if (v33 == a2[3].iov_len + v8)
      {
        v17 = 0;
        goto LABEL_28;
      }
      v40 = v33;
      if (skit::internal::get_logging_context(void)::once != -1)
      v20 = skit::internal::get_logging_context(void)::logger;
      if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      {
        v41 = a2;
        if (SHIBYTE(a2[1].iov_base) < 0)
          v41 = (const iovec *)a2->iov_base;
        v42 = a2[3].iov_len;
        v43 = *__error();
        *(_DWORD *)buf = 136446978;
        v45 = v41;
        v46 = 2048;
        v47 = v40;
        v48 = 2048;
        v49 = v42;
        v50 = 1024;
        v51 = v43;
        v24 = "BlobFile::append : blob write failed @ %{public}s : %li < %lu : %{darwin.errno}d";
LABEL_51:
        v36 = v20;
        v37 = 38;
        goto LABEL_40;
      }
    }
    else
    {
      v18 = writev(a2[1].iov_len, a3, a4);
      if (v18 == v8)
        goto LABEL_29;
      v19 = v18;
      if (skit::internal::get_logging_context(void)::once != -1)
      v20 = skit::internal::get_logging_context(void)::logger;
      if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      {
        v21 = a2;
        if (SHIBYTE(a2[1].iov_base) < 0)
          v21 = (const iovec *)a2->iov_base;
        v22 = a2[3].iov_len;
        v23 = *__error();
        *(_DWORD *)buf = 136446978;
        v45 = v21;
        v46 = 2048;
        v47 = v19;
        v48 = 2048;
        v49 = v22;
        v50 = 1024;
        v51 = v23;
        v24 = "BlobFile::append : blob write failed @ %{public}s : %li < %lu : %{darwin.errno}d";
        goto LABEL_51;
      }
    }
  }
  else
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v35 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "BlobFile::append : invalid iov pointer";
LABEL_35:
      v36 = v35;
      v37 = 2;
LABEL_40:
      _os_log_error_impl(&dword_1CB748000, v36, OS_LOG_TYPE_ERROR, v24, buf, v37);
    }
  }
}

uint64_t skit::internal::BlobFile::flush(skit::internal::BlobFile *this)
{
  uint64_t v3;
  const char *v4;
  uint8_t *v5;
  NSObject *v6;
  uint32_t v7;
  int v8;
  uint64_t v9;
  uint8_t buf[4];
  _WORD *v11;
  __int16 v12;
  int v13;
  _WORD v14[516];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((*((_DWORD *)this + 6) & 0x80000000) != 0)
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v3 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      return 0xFFFFFFFFLL;
    v14[0] = 0;
    v4 = "BlobFile::flush : file is not open";
    v5 = (uint8_t *)v14;
    v6 = v3;
    v7 = 2;
LABEL_16:
    _os_log_error_impl(&dword_1CB748000, v6, OS_LOG_TYPE_ERROR, v4, v5, v7);
    return 0xFFFFFFFFLL;
  }
  if (skit::internal::BlobFile::flush_internal_cache(this))
    return 0xFFFFFFFFLL;
  if (fsync(*((_DWORD *)this + 6)) < 0)
  {
    v8 = *__error();
    if (fcntl(*((_DWORD *)this + 6), 50, v14) == -1)
      LOBYTE(v14[0]) = 0;
    if (skit::internal::get_logging_context(void)::once != -1)
    v9 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      return 0xFFFFFFFFLL;
    *(_DWORD *)buf = 136446466;
    v11 = v14;
    v12 = 1024;
    v13 = v8;
    v4 = "BlobFile::flush : file sync failed @ %{public}s : %{darwin.errno}d";
    v5 = buf;
    v6 = v9;
    v7 = 18;
    goto LABEL_16;
  }
  return 0;
}

void skit::internal::BlobFile::resize(skit::internal::BlobFile *this, off_t a2)
{
  int v4;
  NSObject *v5;
  uint8_t buf[4];
  _BYTE *v7;
  __int16 v8;
  int v9;
  _BYTE v10[1024];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!skit::internal::BlobFile::flush_internal_cache(this))
  {
    if (ftruncate(*((_DWORD *)this + 6), a2))
    {
      v4 = *__error();
      if (fcntl(*((_DWORD *)this + 6), 50, v10) == -1)
        v10[0] = 0;
      if (skit::internal::get_logging_context(void)::once != -1)
      v5 = skit::internal::get_logging_context(void)::logger;
      if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        v7 = v10;
        v8 = 1024;
        v9 = v4;
        _os_log_error_impl(&dword_1CB748000, v5, OS_LOG_TYPE_ERROR, "BlobFile::resize : file truncate failed @ %{public}s : %{darwin.errno}d", buf, 0x12u);
      }
    }
    else
    {
      *((_QWORD *)this + 4) = a2;
    }
  }
}

float skit::SpanMatchV3::score(skit::SpanMatchV3 *this)
{
  return *((float *)this + 3);
}

uint64_t skit::SpanMatchV3::score(uint64_t this, float a2)
{
  *(float *)(this + 12) = a2;
  return this;
}

uint64_t skit::SpanMatchV3::token_cnt(skit::SpanMatchV3 *this)
{
  return *((unsigned int *)this + 4);
}

uint64_t skit::SpanMatchV3::token_cnt(uint64_t this, int a2)
{
  *(_DWORD *)(this + 16) = a2;
  return this;
}

uint64_t skit::SpanMatchV3::stop_word_cnt(skit::SpanMatchV3 *this)
{
  return *((unsigned int *)this + 5);
}

uint64_t skit::SpanMatchV3::stop_word_cnt(uint64_t this, int a2)
{
  *(_DWORD *)(this + 20) = a2;
  return this;
}

uint64_t skit::SpanMatchV3::alias_token_cnt(skit::SpanMatchV3 *this)
{
  return *((unsigned int *)this + 6);
}

uint64_t skit::SpanMatchV3::alias_token_cnt(uint64_t this, int a2)
{
  *(_DWORD *)(this + 24) = a2;
  return this;
}

uint64_t skit::SpanMatchV3::alias_ids(skit::SpanMatchV3 *this)
{
  return (uint64_t)this + 32;
}

size_t skit::SpanMatchV3::append_alias_id(size_t result, unsigned __int16 a2, int a3)
{
  size_t v3;
  unsigned __int16 *v5;
  uint64_t v6;
  unsigned __int16 *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned __int16 *v13;
  unsigned __int16 *v14;
  unsigned __int16 *v15;
  unsigned __int16 v16;
  unsigned __int16 *v17;
  _WORD *v18;
  __int16 v19;
  unsigned __int16 *v20;
  unsigned __int16 v21;

  v3 = result;
  *(_DWORD *)(result + 24) += a3;
  v5 = *(unsigned __int16 **)(result + 32);
  v6 = *(unsigned int *)(result + 40);
  v7 = &v5[v6];
  if ((_DWORD)v6)
  {
    v8 = 2 * v6;
    while (1)
    {
      v9 = *v5;
      if (v9 == a2)
        break;
      if (v9 > a2)
        goto LABEL_7;
      ++v5;
      v8 -= 2;
      if (!v8)
      {
        v5 = v7;
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    v10 = v6 + 1;
    if ((v6 + 1) <= *(_DWORD *)(result + 44))
    {
      if (v7 != v5)
      {
        v20 = v7;
        do
        {
          v21 = *--v20;
          *v7 = v21;
          v7 = v20;
        }
        while (v20 != v5);
        v7 = v5;
      }
    }
    else
    {
      v11 = v10 + (v6 >> 1);
      if (v11 <= v10)
        v12 = v10;
      else
        v12 = v11;
      v13 = (unsigned __int16 *)skit::SmallVector<skit::GroupId,4u,true>::allocate(v12);
      v14 = *(unsigned __int16 **)(v3 + 32);
      v15 = v5;
      v7 = v13;
      if (v14 != v5)
      {
        v7 = v13;
        do
        {
          v16 = *v14++;
          *v7++ = v16;
        }
        while (v14 != v5);
        v15 = *(unsigned __int16 **)(v3 + 32);
      }
      v17 = &v15[*(unsigned int *)(v3 + 40)];
      if (v17 != v5)
      {
        v18 = v7 + 1;
        do
        {
          v19 = *v5++;
          *v18++ = v19;
        }
        while (v5 != v17);
        v15 = *(unsigned __int16 **)(v3 + 32);
      }
      if (v15 != (unsigned __int16 *)(v3 + 48))
        free(v15);
      *(_QWORD *)(v3 + 32) = v13;
      result = malloc_size(v13);
      *(_DWORD *)(v3 + 44) = result >> 1;
    }
    *(_DWORD *)(v3 + 40) = v10;
    *v7 = a2;
  }
  return result;
}

void *skit::SmallVector<skit::GroupId,4u,true>::allocate(unsigned int a1)
{
  void *result;
  std::bad_alloc *exception;
  std::bad_alloc *v3;

  result = malloc_type_malloc(2 * a1, 0x1000040BDFB0063uLL);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v3 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v3, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
  }
  return result;
}

_QWORD *skit::SpanMatchV3::span(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t skit::SpanMatchV3::edit_dist(skit::SpanMatchV3 *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t skit::SpanMatchV3::edit_dist(uint64_t this, int a2)
{
  *(_DWORD *)(this + 8) = a2;
  return this;
}

BOOL skit::SpanMatchV3::is_subspan_of(skit::SpanMatchV3 *this, unsigned int a2, unsigned int a3)
{
  return *(_DWORD *)this >= a2 && *((_DWORD *)this + 1) <= a3;
}

BOOL skit::SpanMatchV3::is_subspan_of(skit::SpanMatchV3 *this, const skit::SpanMatchV3 *a2)
{
  return *(_DWORD *)this >= *(_DWORD *)a2 && *((_DWORD *)this + 1) <= *((_DWORD *)a2 + 1);
}

size_t skit::SpanMatchV3::merge(size_t this, int32x2_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  size_t v6;
  unsigned __int16 *v7;
  uint64_t v8;
  unsigned __int16 v9;
  __int16 *v10;
  unsigned int v11;
  char *v12;
  const void *v13;
  uint64_t i;
  void *v15;
  _WORD *v16;
  uint64_t v17;
  __int16 v18;

  LODWORD(v2) = *(_DWORD *)this;
  LODWORD(v3) = *(_DWORD *)(this + 4);
  v4 = a2->u32[1];
  if (a2->i32[0] >= *(_DWORD *)this)
    v2 = v2;
  else
    v2 = a2->u32[0];
  if (v3 <= v4)
    v3 = v4;
  else
    v3 = v3;
  *(_QWORD *)this = v2 | (v3 << 32);
  *(_DWORD *)(this + 8) += a2[1].i32[0];
  *(float *)(this + 12) = *(float *)&a2[1].i32[1] + *(float *)(this + 12);
  *(int32x2_t *)(this + 16) = vadd_s32(*(int32x2_t *)(this + 16), a2[2]);
  *(_DWORD *)(this + 24) += a2[3].i32[0];
  v5 = a2[5].u32[0];
  if ((_DWORD)v5)
  {
    v6 = this;
    if (*(_DWORD *)(this + 40))
    {
      v7 = (unsigned __int16 *)a2[4];
      v8 = 2 * v5;
      do
      {
        v9 = *v7++;
        this = skit::SpanMatchV3::append_alias_id(v6, v9, 0);
        v8 -= 2;
      }
      while (v8);
    }
    else if ((int32x2_t *)this != a2)
    {
      v10 = (__int16 *)a2[4];
      if (*(_DWORD *)(this + 44) >= v5)
      {
        v16 = *(_WORD **)(this + 32);
        v17 = 2 * v5;
        do
        {
          v18 = *v10++;
          *v16++ = v18;
          v17 -= 2;
        }
        while (v17);
      }
      else
      {
        if (v5 <= 1)
          v11 = 1;
        else
          v11 = a2[5].u32[0];
        v12 = (char *)skit::SmallVector<skit::GroupId,4u,true>::allocate(v11);
        v13 = v12;
        for (i = 0; i != v5; ++i)
          *(_WORD *)&v12[i * 2] = v10[i];
        v15 = *(void **)(v6 + 32);
        if (v15 != (void *)(v6 + 48))
          free(v15);
        *(_QWORD *)(v6 + 32) = v13;
        this = malloc_size(v13);
        *(_DWORD *)(v6 + 44) = this >> 1;
      }
      *(_DWORD *)(v6 + 40) = v5;
    }
  }
  return this;
}

double skit::SpanMatchV3::operator skit::SpanMatchV2@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  double result;

  v2 = *(_DWORD *)(a1 + 8);
  v3 = *(_DWORD *)(a1 + 12);
  *(_QWORD *)a2 = *(_QWORD *)a1;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = v3;
  result = *(double *)(a1 + 16);
  *(double *)(a2 + 16) = result;
  *(_QWORD *)(a2 + 24) = *(unsigned int *)(a1 + 24);
  return result;
}

BOOL skit::operator<(uint64_t a1, uint64_t a2)
{
  float v2;
  float v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;

  v2 = *(float *)(a1 + 12);
  v3 = *(float *)(a2 + 12);
  if (v2 < v3)
    return 1;
  if (v2 > v3)
    return 0;
  v4 = *(_DWORD *)(a1 + 24);
  v5 = *(_DWORD *)(a2 + 24);
  if (v4 > v5)
    return 1;
  if (v4 < v5)
    return 0;
  v6 = *(_DWORD *)(a1 + 8);
  v7 = *(_DWORD *)(a2 + 8);
  if (v6 > v7)
    return 1;
  return v6 >= v7 && *(_DWORD *)(a1 + 20) > *(_DWORD *)(a2 + 20);
}

_QWORD *skit::operator<<(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char v16;
  char v17;

  v4 = (_QWORD *)std::ostream::operator<<();
  v17 = 58;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)&v17, 1);
  v5 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)" (", 2);
  v6 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)") score=", 8);
  v7 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)" token_cnt=", 11);
  v8 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)" stop_word_cnt=", 15);
  v9 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)" alias_token_cnt=", 17);
  v10 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)" group_ids={ ", 13);
  v11 = *(unsigned int *)(a2 + 40);
  if ((_DWORD)v11)
  {
    v12 = *(_QWORD *)(a2 + 32);
    v13 = 2 * v11;
    do
    {
      v12 += 2;
      v14 = (_QWORD *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)", ", 2);
      v13 -= 2;
    }
    while (v13);
  }
  v16 = 125;
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)&v16, 1);
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  char *v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  size_t v16;
  std::locale::__imp *p_b;
  uint64_t v18;
  uint64_t v19;
  std::locale *v20;
  uint64_t v21;
  _BYTE v23[16];
  std::locale __b;
  size_t v25;
  int64_t v26;

  MEMORY[0x1D179DC88](v23, a1);
  if (v23[0])
  {
    v6 = (char *)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *((_QWORD *)v6 + 5);
    v8 = *((_DWORD *)v6 + 2);
    v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&__b, MEMORY[0x1E0DE4A90]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&__b);
      *((_DWORD *)v6 + 36) = v9;
    }
    v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20)
      v12 = a2 + a3;
    else
      v12 = a2;
    if (!v7)
      goto LABEL_29;
    v13 = *((_QWORD *)v6 + 3);
    v14 = v13 <= a3;
    v15 = v13 - a3;
    v16 = v14 ? 0 : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }
    if ((uint64_t)v16 >= 1)
    {
      if (v16 >= 0x7FFFFFFFFFFFFFF8)
        std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
      if (v16 >= 0x17)
      {
        v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17)
          v18 = v16 | 7;
        v19 = v18 + 1;
        p_b = (std::locale::__imp *)operator new(v18 + 1);
        v25 = v16;
        v26 = v19 | 0x8000000000000000;
        __b.__locale_ = p_b;
      }
      else
      {
        HIBYTE(v26) = v16;
        p_b = (std::locale::__imp *)&__b;
      }
      memset(p_b, v9, v16);
      *((_BYTE *)p_b + v16) = 0;
      v20 = v26 >= 0 ? &__b : (std::locale *)__b.__locale_;
      v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(_QWORD *)v7 + 96))(v7, v20, v16);
      if (SHIBYTE(v26) < 0)
        operator delete(__b.__locale_);
      if (v21 != v16)
        goto LABEL_29;
    }
    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v7 + 96))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((_QWORD *)v6 + 3) = 0;
    }
    else
    {
LABEL_29:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x1D179DC94](v23);
  return a1;
}

void sub_1CB74C06C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  _QWORD *v17;

  if (a17 < 0)
    operator delete(__p);
  MEMORY[0x1D179DC94](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(_QWORD *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1CB74C040);
}

void sub_1CB74C0CC(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
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
      std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
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

std::__fs::filesystem::path *std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>(std::__fs::filesystem::path *this, unint64_t *a2)
{
  if (a2[1] && *(_WORD *)*a2 == 47)
  {
    if (SHIBYTE(this->__pn_.__r_.__value_.__r.__words[2]) < 0)
    {
      *this->__pn_.__r_.__value_.__l.__data_ = 0;
      this->__pn_.__r_.__value_.__l.__size_ = 0;
    }
    else
    {
      this->__pn_.__r_.__value_.__s.__data_[0] = 0;
      *((_BYTE *)&this->__pn_.__r_.__value_.__s + 23) = 0;
    }
  }
  else if (std::__fs::filesystem::path::__filename(this).__size_)
  {
    std::string::push_back(&this->__pn_, 47);
  }
  std::__fs::filesystem::_PathCVT<char16_t>::__append_range[abi:ne180100](&this->__pn_, *a2, *a2 + 2 * a2[1]);
  return this;
}

uint64_t std::__fs::filesystem::_PathCVT<char16_t>::__append_range[abi:ne180100](std::string *a1, unint64_t a2, unint64_t a3)
{
  unint64_t v4;
  std::string::value_type *v7;
  _QWORD v9[2];
  unint64_t v10;
  unint64_t v11;
  _BYTE v12[32];
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9[0] = MEMORY[0x1E0DE4FC0] + 16;
  v9[1] = 0;
  if (a2 < a3)
  {
    v4 = a2;
    do
    {
      v10 = v4;
      if ((*(unsigned int (**)(_QWORD *, _BYTE *, unint64_t, unint64_t, unint64_t *, _BYTE *, _BYTE *, unint64_t *))(v9[0] + 24))(v9, v13, v4, a3, &v10, v12, v13, &v11) == 2|| v10 == v4)
      {
        std::__throw_runtime_error("locale not supported");
        __break(1u);
      }
      v4 = v10;
      if ((unint64_t)v12 < v11)
      {
        v7 = v12;
        do
          std::string::push_back(a1, *v7++);
        while ((unint64_t)v7 < v11);
        v4 = v10;
      }
    }
    while (v4 < a3);
  }
  return MEMORY[0x1D179DCD0](v9);
}

void sub_1CB74C30C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  MEMORY[0x1D179DCD0](va);
  _Unwind_Resume(a1);
}

std::string *std::string::append[abi:ne180100]<char const*,0>(std::string *this, std::string *a2, std::string *a3)
{
  std::string *v4;
  unint64_t v6;
  unint64_t v7;
  std::string::size_type size;
  std::string::size_type v9;
  std::string *v10;
  unint64_t v11;
  std::string::value_type *p_p;
  std::string *v13;
  std::string::value_type *v14;
  std::string::value_type v15;
  std::string::size_type v16;
  uint64_t v17;
  uint64_t v18;
  std::string::value_type v19;
  const std::string::value_type *v20;
  std::string::size_type v21;
  void *__p;
  std::string::size_type v24;
  int64_t v25;

  v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  v7 = (char *)a3 - (char *)a2;
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
  if (v10 > v4 || (std::string *)((char *)&v10->__r_.__value_.__l.__data_ + size + 1) <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
    }
    v13 = this;
    if ((v6 & 0x80) != 0)
      v13 = (std::string *)this->__r_.__value_.__r.__words[0];
    v14 = (char *)v13 + size;
    do
    {
      v15 = v4->__r_.__value_.__s.__data_[0];
      v4 = (std::string *)((char *)v4 + 1);
      *v14++ = v15;
    }
    while (v4 != a3);
    *v14 = 0;
    v16 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      this->__r_.__value_.__l.__size_ = v16;
    else
      *((_BYTE *)&this->__r_.__value_.__s + 23) = v16 & 0x7F;
  }
  else
  {
    if (v7 >= 0x7FFFFFFFFFFFFFF8)
      std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
    if (v7 > 0x16)
    {
      v17 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v7 | 7) != 0x17)
        v17 = v7 | 7;
      v18 = v17 + 1;
      p_p = (std::string::value_type *)operator new(v17 + 1);
      v24 = v7;
      v25 = v18 | 0x8000000000000000;
      __p = p_p;
    }
    else
    {
      HIBYTE(v25) = v7;
      p_p = (std::string::value_type *)&__p;
    }
    do
    {
      v19 = v4->__r_.__value_.__s.__data_[0];
      v4 = (std::string *)((char *)v4 + 1);
      *p_p++ = v19;
    }
    while (v4 != a3);
    *p_p = 0;
    if (v25 >= 0)
      v20 = (const std::string::value_type *)&__p;
    else
      v20 = (const std::string::value_type *)__p;
    if (v25 >= 0)
      v21 = HIBYTE(v25);
    else
      v21 = v24;
    std::string::append(this, v20, v21);
    if (SHIBYTE(v25) < 0)
      operator delete(__p);
  }
  return this;
}

void sub_1CB74C4C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<char [5],void>(std::string *this, std::string *a2)
{
  std::string *v3;
  int v4;

  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  v3 = (std::string *)((char *)a2 - 1);
  do
  {
    v4 = v3->__r_.__value_.__s.__data_[1];
    v3 = (std::string *)((char *)v3 + 1);
  }
  while (v4);
  std::string::append[abi:ne180100]<char const*,0>(this, a2, v3);
  return this;
}

void sub_1CB74C520(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void std::vector<std::__fs::filesystem::path>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 1) < 0)
          operator delete(*(v4 - 3));
        v4 -= 3;
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

double std::__fs::filesystem::path::extension[abi:ne180100](uint64_t a1, std::__fs::filesystem::path *this)
{
  std::__fs::filesystem::path::__string_view v3;
  __int128 *p_dst;
  std::basic_string_view<_CharT, _Traits>::size_type v5;
  std::basic_string_view<_CharT, _Traits>::size_type v6;
  double result;
  __int128 __dst;
  unint64_t v9;

  v3 = std::__fs::filesystem::path::__extension(this);
  if (v3.__size_ >= 0x7FFFFFFFFFFFFFF8)
    std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
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
  *(_OWORD *)a1 = __dst;
  *(_QWORD *)(a1 + 16) = v9;
  return result;
}

void **std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>> *,skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>> *,skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>> *,0>(void **result, void **a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void **v9;
  __int128 v10;
  __int128 v11;

  if (result != a2)
  {
    v5 = (uint64_t)result;
    do
    {
      v6 = *(void **)a3;
      v7 = *(unsigned int *)(a3 + 8);
      if ((_DWORD)v7)
      {
        v8 = 112 * v7;
        do
        {
          v6 = (void *)(skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>::~FieldMatchImpl((uint64_t)v6)
                      + 112);
          v8 -= 112;
        }
        while (v8);
        v6 = *(void **)a3;
      }
      if (v6 != (void *)(a3 + 16))
        free(v6);
      skit::SmallVector<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>,4u,true>::move(a3, v5);
      v9 = (void **)(a3 + 464);
      if (*(char *)(a3 + 487) < 0)
        operator delete(*v9);
      v10 = *(_OWORD *)(v5 + 464);
      *(_QWORD *)(a3 + 480) = *(_QWORD *)(v5 + 480);
      *(_OWORD *)v9 = v10;
      *(_BYTE *)(v5 + 487) = 0;
      *(_WORD *)(v5 + 464) = 0;
      v11 = *(_OWORD *)(v5 + 488);
      *(_OWORD *)(a3 + 500) = *(_OWORD *)(v5 + 500);
      *(_OWORD *)(a3 + 488) = v11;
      result = skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a3 + 520), v5 + 520);
      *(_DWORD *)(a3 + 544) = *(_DWORD *)(v5 + 544);
      v5 += 552;
      a3 += 552;
    }
    while ((void **)v5 != a2);
  }
  return result;
}

uint64_t skit::SmallVector<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,8u,true>::_destroy<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,(void *)0>(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 520);
  if (v2 != (void *)(a1 + 536))
    free(v2);
  if (*(char *)(a1 + 487) < 0)
    operator delete(*(void **)(a1 + 464));
  return skit::SmallVector<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>,4u,true>::~SmallVector(a1);
}

size_t skit::SmallVector<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,8u,true>::_reserve_more(char **a1, unsigned int a2)
{
  char *v3;
  char *v4;
  char *v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  size_t result;
  std::bad_alloc *exception;
  std::bad_alloc *v14;

  v3 = (char *)malloc_type_malloc(552 * a2, 0x1032040BBF17678uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v14 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v14, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
  }
  v4 = v3;
  v5 = *a1;
  v6 = *((_DWORD *)a1 + 2);
  if (v6)
  {
    v7 = (uint64_t)v3;
    v8 = (uint64_t)*a1;
    do
    {
      skit::SmallVector<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>,4u,true>::move(v7, v8);
      v9 = *(_OWORD *)(v8 + 464);
      *(_QWORD *)(v7 + 480) = *(_QWORD *)(v8 + 480);
      *(_OWORD *)(v7 + 464) = v9;
      *(_QWORD *)(v8 + 464) = 0;
      *(_QWORD *)(v8 + 472) = 0;
      *(_QWORD *)(v8 + 480) = 0;
      v10 = *(_OWORD *)(v8 + 488);
      *(_OWORD *)(v7 + 500) = *(_OWORD *)(v8 + 500);
      *(_OWORD *)(v7 + 488) = v10;
      skit::SmallVector<skit::GroupId,4u,true>::move(v7 + 520, v8 + 520);
      *(_DWORD *)(v7 + 544) = *(_DWORD *)(v8 + 544);
      v8 += 552;
      v7 += 552;
    }
    while ((char *)v8 != &v5[552 * v6]);
    v11 = 552 * v6;
    do
    {
      skit::SmallVector<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,8u,true>::_destroy<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,(void *)0>((uint64_t)v5);
      v5 += 552;
      v11 -= 552;
    }
    while (v11);
    v5 = *a1;
  }
  if (v5 != (char *)(a1 + 2))
    free(v5);
  *a1 = v4;
  result = malloc_size(v4);
  *((_DWORD *)a1 + 3) = result / 0x228;
  return result;
}

uint64_t skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>::~FieldMatchImpl(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 80);
  if (v2 != (void *)(a1 + 96))
    free(v2);
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return a1;
}

skit::SpanMatchV3 *skit::SpanMatchV3::SpanMatchV3(skit::SpanMatchV3 *this, const skit::SpanMatchV3 *a2)
{
  __int128 v4;
  __int16 *v5;
  uint64_t v6;
  void *v7;
  size_t v8;
  _WORD *v9;
  uint64_t v10;
  __int16 v11;

  v4 = *(_OWORD *)a2;
  *(_OWORD *)((char *)this + 12) = *(_OWORD *)((char *)a2 + 12);
  *(_OWORD *)this = v4;
  v5 = (__int16 *)*((_QWORD *)a2 + 4);
  v6 = *((unsigned int *)a2 + 10);
  if (v6 < 5)
  {
    v9 = (_WORD *)((char *)this + 48);
    *((_QWORD *)this + 4) = (char *)this + 48;
    *((_DWORD *)this + 10) = v6;
    *((_DWORD *)this + 11) = 4;
    if (!(_DWORD)v6)
      goto LABEL_6;
  }
  else
  {
    v7 = skit::SmallVector<skit::GroupId,4u,true>::allocate(*((_DWORD *)a2 + 10));
    *((_QWORD *)this + 4) = v7;
    v8 = malloc_size(v7);
    v9 = (_WORD *)*((_QWORD *)this + 4);
    *((_DWORD *)this + 10) = v6;
    *((_DWORD *)this + 11) = v8 >> 1;
  }
  v10 = 2 * v6;
  do
  {
    v11 = *v5++;
    *v9++ = v11;
    v10 -= 2;
  }
  while (v10);
LABEL_6:
  *((_DWORD *)this + 14) = *((_DWORD *)a2 + 14);
  return this;
}

uint64_t skit::SmallVector<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>,4u,true>::~SmallVector(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)a1;
  v3 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v3)
  {
    v4 = 112 * v3;
    do
    {
      v2 = (void *)(skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>::~FieldMatchImpl((uint64_t)v2)
                  + 112);
      v4 -= 112;
    }
    while (v4);
    v2 = *(void **)a1;
  }
  if (v2 != (void *)(a1 + 16))
    free(v2);
  return a1;
}

void *skit::SmallVector<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>,4u,true>::allocate(unsigned int a1)
{
  void *result;
  std::bad_alloc *exception;
  std::bad_alloc *v3;

  result = malloc_type_malloc(112 * a1, 0x1032040567AB6A7uLL);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v3 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v3, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
  }
  return result;
}

skit::SpanMatchV3 *std::uninitialized_copy[abi:ne180100]<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>> const*,skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>*>(skit::SpanMatchV3 *result, skit::SpanMatchV3 *a2, uint64_t a3)
{
  skit::SpanMatchV3 *v5;
  uint64_t v6;
  char *v7;
  std::basic_string<char16_t> *v8;
  const std::basic_string<char16_t>::value_type **v9;
  __int128 v10;

  if (result != a2)
  {
    v5 = result;
    v6 = 0;
    do
    {
      v7 = (char *)v5 + v6;
      *(_WORD *)(a3 + v6) = *(_WORD *)((char *)v5 + v6);
      v8 = (std::basic_string<char16_t> *)(a3 + v6 + 8);
      v9 = (const std::basic_string<char16_t>::value_type **)((char *)v5 + v6 + 8);
      if (*((char *)v5 + v6 + 31) < 0)
      {
        std::basic_string<char16_t>::__init_copy_ctor_external(v8, *v9, *((_QWORD *)v7 + 2));
      }
      else
      {
        v10 = *(_OWORD *)v9;
        *(_QWORD *)(a3 + v6 + 24) = *(_QWORD *)((char *)v5 + v6 + 24);
        *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v10;
      }
      *(_OWORD *)(a3 + v6 + 32) = *((_OWORD *)v7 + 2);
      result = skit::SpanMatchV3::SpanMatchV3((skit::SpanMatchV3 *)(a3 + v6 + 48), (skit::SpanMatchV3 *)((char *)v5 + v6 + 48));
      v6 += 112;
    }
    while (v7 + 112 != (char *)a2);
  }
  return result;
}

uint64_t skit::SmallVector<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>,4u,true>::move(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v3 = result;
  if (*(_QWORD *)a2 == a2 + 16)
  {
    v5 = result + 16;
    *(_QWORD *)result = result + 16;
    v6 = *(unsigned int *)(a2 + 8);
    if ((_DWORD)v6)
    {
      v7 = *(_QWORD *)a2;
      v8 = *(_QWORD *)a2 + 112 * v6;
      v9 = *(_QWORD *)a2;
      do
      {
        *(_WORD *)v5 = *(_WORD *)v9;
        v10 = *(_OWORD *)(v9 + 8);
        *(_QWORD *)(v5 + 24) = *(_QWORD *)(v9 + 24);
        *(_OWORD *)(v5 + 8) = v10;
        *(_QWORD *)(v9 + 16) = 0;
        *(_QWORD *)(v9 + 24) = 0;
        *(_QWORD *)(v9 + 8) = 0;
        *(_OWORD *)(v5 + 32) = *(_OWORD *)(v9 + 32);
        v11 = *(_OWORD *)(v9 + 48);
        *(_OWORD *)(v5 + 60) = *(_OWORD *)(v9 + 60);
        *(_OWORD *)(v5 + 48) = v11;
        skit::SmallVector<skit::GroupId,4u,true>::move(v5 + 80, v9 + 80);
        *(_DWORD *)(v5 + 104) = *(_DWORD *)(v9 + 104);
        v9 += 112;
        v5 += 112;
      }
      while (v9 != v8);
      v12 = 112 * v6;
      do
      {
        result = skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>::~FieldMatchImpl(v7);
        v7 += 112;
        v12 -= 112;
      }
      while (v12);
    }
    v4 = (_DWORD *)(v3 + 12);
  }
  else
  {
    *(_QWORD *)result = *(_QWORD *)a2;
    v4 = (_DWORD *)(a2 + 12);
    *(_DWORD *)(result + 12) = *(_DWORD *)(a2 + 12);
    *(_QWORD *)a2 = a2 + 16;
  }
  *v4 = 4;
  *(_DWORD *)(v3 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = 0;
  return result;
}

uint64_t skit::SmallVector<skit::GroupId,4u,true>::move(uint64_t result, uint64_t a2)
{
  _DWORD *v2;
  _WORD *v3;
  uint64_t v4;
  __int16 *v5;
  uint64_t v6;
  __int16 v7;

  if (*(_QWORD *)a2 == a2 + 16)
  {
    v3 = (_WORD *)(result + 16);
    *(_QWORD *)result = result + 16;
    v4 = *(unsigned int *)(a2 + 8);
    if ((_DWORD)v4)
    {
      v5 = *(__int16 **)a2;
      v6 = 2 * v4;
      do
      {
        v7 = *v5++;
        *v3++ = v7;
        v6 -= 2;
      }
      while (v6);
    }
    v2 = (_DWORD *)(result + 12);
  }
  else
  {
    *(_QWORD *)result = *(_QWORD *)a2;
    v2 = (_DWORD *)(a2 + 12);
    *(_DWORD *)(result + 12) = *(_DWORD *)(a2 + 12);
    *(_QWORD *)a2 = a2 + 16;
  }
  *v2 = 4;
  *(_DWORD *)(result + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = 0;
  return result;
}

void **skit::SmallVector<skit::GroupId,4u,true>::operator=(void **a1, uint64_t a2)
{
  _QWORD *v4;
  _QWORD *v5;

  v5 = a1 + 2;
  v4 = *a1;
  if (v4 != v5)
    free(v4);
  skit::SmallVector<skit::GroupId,4u,true>::move((uint64_t)a1, a2);
  return a1;
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E8686E60, MEMORY[0x1E0DE42E0]);
}

void sub_1CB74CD58(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_string<char16_t>::push_back(std::basic_string<char16_t> *this, std::basic_string<char16_t>::value_type __c)
{
  std::basic_string<char16_t>::size_type v2;
  std::basic_string<char16_t>::size_type v3;
  std::basic_string<char16_t> *v4;
  std::basic_string<char16_t>::size_type v5;
  std::basic_string<char16_t>::size_type size;

  v4 = this;
  if ((SHIBYTE(this->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*((_BYTE *)&this->__r_.__value_.__s + 23) != 10)
    {
      size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      *((_BYTE *)&this->__r_.__value_.__s + 23) = (*((_BYTE *)&this->__r_.__value_.__s + 23) + 1) & 0x7F;
      goto LABEL_8;
    }
    v5 = 10;
    goto LABEL_5;
  }
  size = this->__r_.__value_.__l.__size_;
  v5 = (this->__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
  if (size == v5)
  {
LABEL_5:
    std::basic_string<char16_t>::__grow_by(this, v5, 1uLL, v5, v5, v2, v3);
    size = v5;
  }
  v4->__r_.__value_.__l.__size_ = size + 1;
  v4 = (std::basic_string<char16_t> *)v4->__r_.__value_.__r.__words[0];
LABEL_8:
  *(_DWORD *)((char *)&v4->__r_.__value_.__l.__data_ + 2 * size) = 32;
}

std::basic_string<char16_t> *__cdecl std::basic_string<char16_t>::append(std::basic_string<char16_t> *this, const std::basic_string<char16_t>::value_type *__s, std::basic_string<char16_t>::size_type __n)
{
  std::basic_string<char16_t>::size_type v6;
  std::basic_string<char16_t>::size_type size;
  std::basic_string<char16_t> *v8;
  std::basic_string<char16_t>::size_type v9;

  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    size = this->__r_.__value_.__l.__size_;
    v6 = (this->__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
  }
  else
  {
    v6 = 10;
    size = HIBYTE(this->__r_.__value_.__r.__words[2]);
  }
  if (v6 - size >= __n)
  {
    if (__n)
    {
      v8 = this;
      if ((*((_BYTE *)&this->__r_.__value_.__s + 23) & 0x80) != 0)
        v8 = (std::basic_string<char16_t> *)this->__r_.__value_.__r.__words[0];
      memmove((char *)v8 + 2 * size, __s, 2 * __n);
      v9 = size + __n;
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
        this->__r_.__value_.__l.__size_ = v9;
      else
        *((_BYTE *)&this->__r_.__value_.__s + 23) = v9 & 0x7F;
      v8->__r_.__value_.__s.__data_[v9] = 0;
    }
  }
  else
  {
    std::basic_string<char16_t>::__grow_by_and_replace(this, v6, __n - v6 + size, size, size, 0, __n, __s);
  }
  return this;
}

void std::basic_string<char16_t>::__grow_by_and_replace(std::basic_string<char16_t> *this, std::basic_string<char16_t>::size_type __old_cap, std::basic_string<char16_t>::size_type __delta_cap, std::basic_string<char16_t>::size_type __old_sz, std::basic_string<char16_t>::size_type __n_copy, std::basic_string<char16_t>::size_type __n_del, std::basic_string<char16_t>::size_type __n_add, const std::basic_string<char16_t>::value_type *__p_new_stuff)
{
  std::basic_string<char16_t> *v15;
  std::basic_string<char16_t>::size_type v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  std::basic_string<char16_t>::size_type v21;
  uint64_t v22;
  uint64_t v23;
  std::basic_string<char16_t>::size_type v24;
  std::basic_string<char16_t>::size_type v25;

  if (0x7FFFFFFFFFFFFFF6 - __old_cap < __delta_cap)
    std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
  v15 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    v15 = (std::basic_string<char16_t> *)this->__r_.__value_.__r.__words[0];
  v16 = __delta_cap + __old_cap;
  if (__delta_cap + __old_cap <= 2 * __old_cap)
    v16 = 2 * __old_cap;
  v17 = (v16 & 0xFFFFFFFFFFFFFFFCLL) + 4;
  if ((v16 | 3) != 0xB)
    v17 = v16 | 3;
  if (v16 >= 0xB)
    v18 = v17 + 1;
  else
    v18 = 11;
  if (__old_cap > 0x3FFFFFFFFFFFFFF2)
    v19 = 0x7FFFFFFFFFFFFFF7;
  else
    v19 = v18;
  v20 = std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v19);
  v21 = (std::basic_string<char16_t>::size_type)v20;
  v23 = v22;
  if (__n_copy)
    memmove(v20, v15, 2 * __n_copy);
  if (__n_add)
    memmove((void *)(v21 + 2 * __n_copy), __p_new_stuff, 2 * __n_add);
  v24 = __old_sz - (__n_del + __n_copy);
  if (v24)
    memmove((void *)(v21 + 2 * __n_copy + 2 * __n_add), (char *)v15 + 2 * __n_copy + 2 * __n_del, 2 * v24);
  if (__old_cap != 10)
    operator delete(v15);
  v25 = __n_add + __n_copy + v24;
  this->__r_.__value_.__r.__words[0] = v21;
  this->__r_.__value_.__l.__size_ = v25;
  this->__r_.__value_.__r.__words[2] = v23 | 0x8000000000000000;
  *(_WORD *)(v21 + 2 * v25) = 0;
}

void std::basic_string<char16_t>::__grow_by(std::basic_string<char16_t> *this, std::basic_string<char16_t>::size_type __old_cap, std::basic_string<char16_t>::size_type __delta_cap, std::basic_string<char16_t>::size_type __old_sz, std::basic_string<char16_t>::size_type __n_copy, std::basic_string<char16_t>::size_type __n_del, std::basic_string<char16_t>::size_type __n_add)
{
  std::basic_string<char16_t> *v11;
  std::basic_string<char16_t>::size_type v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  std::basic_string<char16_t>::size_type v17;
  uint64_t v18;
  uint64_t v19;

  if (0x7FFFFFFFFFFFFFF7 - __old_cap < __delta_cap)
    std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
  v11 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
    v11 = (std::basic_string<char16_t> *)this->__r_.__value_.__r.__words[0];
  v12 = __delta_cap + __old_cap;
  if (__delta_cap + __old_cap <= 2 * __old_cap)
    v12 = 2 * __old_cap;
  v13 = (v12 & 0xFFFFFFFFFFFFFFFCLL) + 4;
  if ((v12 | 3) != 0xB)
    v13 = v12 | 3;
  if (v12 >= 0xB)
    v14 = v13 + 1;
  else
    v14 = 11;
  if (__old_cap <= 0x3FFFFFFFFFFFFFF2)
    v15 = v14;
  else
    v15 = 0x7FFFFFFFFFFFFFF7;
  v16 = std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v15);
  v17 = (std::basic_string<char16_t>::size_type)v16;
  v19 = v18;
  if (__n_copy)
    memmove(v16, v11, 2 * __n_copy);
  if (__old_sz != __n_copy)
    memmove((void *)(v17 + 2 * __n_copy), (char *)v11 + 2 * __n_copy, 2 * (__old_sz - __n_copy));
  if (__old_cap != 10)
    operator delete(v11);
  this->__r_.__value_.__r.__words[0] = v17;
  this->__r_.__value_.__r.__words[2] = v19 | 0x8000000000000000;
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5028] + 16);
  return result;
}

size_t skit::SmallVector<skit::MergedFieldMatchV2,8u,true>::_reserve_more(char **a1, unsigned int a2)
{
  char *v3;
  char *v4;
  char *v5;
  unsigned int v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  size_t result;
  std::bad_alloc *exception;
  std::bad_alloc *v14;

  v3 = (char *)malloc_type_malloc(392 * a2, 0x10320407C6195B8uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v14 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v14, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
  }
  v4 = v3;
  v5 = *a1;
  v6 = *((_DWORD *)a1 + 2);
  if (v6)
  {
    v7 = (uint64_t)v3;
    v8 = *a1;
    do
    {
      skit::SmallVector<skit::FieldMatchV2,4u,true>::move(v7, (uint64_t *)v8);
      v9 = *((_OWORD *)v8 + 21);
      *(_QWORD *)(v7 + 352) = *((_QWORD *)v8 + 44);
      *(_OWORD *)(v7 + 336) = v9;
      *((_QWORD *)v8 + 42) = 0;
      *((_QWORD *)v8 + 43) = 0;
      *((_QWORD *)v8 + 44) = 0;
      v10 = *(_OWORD *)(v8 + 376);
      *(_OWORD *)(v7 + 360) = *(_OWORD *)(v8 + 360);
      *(_OWORD *)(v7 + 376) = v10;
      v8 += 392;
      v7 += 392;
    }
    while (v8 != &v5[392 * v6]);
    v11 = 392 * v6;
    do
    {
      skit::SmallVector<skit::MergedFieldMatchV2,8u,true>::_destroy<skit::MergedFieldMatchV2,(void *)0>((uint64_t)v5);
      v5 += 392;
      v11 -= 392;
    }
    while (v11);
    v5 = *a1;
  }
  if (v5 != (char *)(a1 + 2))
    free(v5);
  *a1 = v4;
  result = malloc_size(v4);
  *((_DWORD *)a1 + 3) = result / 0x188;
  return result;
}

uint64_t skit::SmallVector<skit::FieldMatchV2,4u,true>::~SmallVector(uint64_t a1)
{
  skit::SmallVector<skit::FieldMatchV2,4u,true>::_destroy(*(_QWORD *)a1, *(_DWORD *)(a1 + 8));
  if (*(_QWORD *)a1 != a1 + 16)
    free(*(void **)a1);
  return a1;
}

void skit::SmallVector<skit::FieldMatchV2,4u,true>::_destroy(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  char *v3;

  if (a2)
  {
    v2 = 80 * a2;
    v3 = (char *)(a1 + 31);
    do
    {
      if (*v3 < 0)
        operator delete(*(void **)(v3 - 23));
      v3 += 80;
      v2 -= 80;
    }
    while (v2);
  }
}

__n128 std::uninitialized_copy[abi:ne180100]<skit::FieldMatchV2 const*,skit::FieldMatchV2*>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  std::basic_string<char16_t> *v8;
  const std::basic_string<char16_t>::value_type **v9;
  __int128 v10;
  uint64_t v11;
  __n128 result;
  __int128 v13;

  if (a1 != a2)
  {
    v6 = 0;
    do
    {
      v7 = a1 + v6;
      *(_WORD *)(a3 + v6) = *(_WORD *)(a1 + v6);
      v8 = (std::basic_string<char16_t> *)(a3 + v6 + 8);
      v9 = (const std::basic_string<char16_t>::value_type **)(a1 + v6 + 8);
      if (*(char *)(a1 + v6 + 31) < 0)
      {
        std::basic_string<char16_t>::__init_copy_ctor_external(v8, *v9, *(_QWORD *)(v7 + 16));
      }
      else
      {
        v10 = *(_OWORD *)v9;
        *(_QWORD *)(a3 + v6 + 24) = *(_QWORD *)(a1 + v6 + 24);
        *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v10;
      }
      v11 = a3 + v6;
      result = *(__n128 *)(v7 + 32);
      v13 = *(_OWORD *)(v7 + 64);
      *(_OWORD *)(v11 + 48) = *(_OWORD *)(v7 + 48);
      *(_OWORD *)(v11 + 64) = v13;
      *(__n128 *)(v11 + 32) = result;
      v6 += 80;
    }
    while (v7 + 80 != a2);
  }
  return result;
}

uint64_t skit::SmallVector<skit::MergedFieldMatchV2,8u,true>::_destroy<skit::MergedFieldMatchV2,(void *)0>(uint64_t a1)
{
  if (*(char *)(a1 + 359) < 0)
    operator delete(*(void **)(a1 + 336));
  return skit::SmallVector<skit::FieldMatchV2,4u,true>::~SmallVector(a1);
}

void skit::SmallVector<skit::FieldMatchV2,4u,true>::move(uint64_t a1, uint64_t *a2)
{
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  char *v13;
  uint64_t v14;

  if ((uint64_t *)*a2 == a2 + 2)
  {
    v5 = a1 + 16;
    *(_QWORD *)a1 = a1 + 16;
    v6 = *((unsigned int *)a2 + 2);
    if ((_DWORD)v6)
    {
      v7 = *a2;
      v8 = *a2 + 80 * v6;
      v9 = *a2;
      do
      {
        *(_WORD *)v5 = *(_WORD *)v9;
        v10 = *(_OWORD *)(v9 + 8);
        *(_QWORD *)(v5 + 24) = *(_QWORD *)(v9 + 24);
        *(_OWORD *)(v5 + 8) = v10;
        *(_QWORD *)(v9 + 16) = 0;
        *(_QWORD *)(v9 + 24) = 0;
        *(_QWORD *)(v9 + 8) = 0;
        v11 = *(_OWORD *)(v9 + 32);
        v12 = *(_OWORD *)(v9 + 64);
        *(_OWORD *)(v5 + 48) = *(_OWORD *)(v9 + 48);
        *(_OWORD *)(v5 + 64) = v12;
        *(_OWORD *)(v5 + 32) = v11;
        v9 += 80;
        v5 += 80;
      }
      while (v9 != v8);
      v13 = (char *)(v7 + 31);
      v14 = 80 * v6;
      do
      {
        if (*v13 < 0)
          operator delete(*(void **)(v13 - 23));
        v13 += 80;
        v14 -= 80;
      }
      while (v14);
    }
    v4 = (_DWORD *)(a1 + 12);
  }
  else
  {
    *(_QWORD *)a1 = *a2;
    v4 = (_DWORD *)a2 + 3;
    *(_DWORD *)(a1 + 12) = *((_DWORD *)a2 + 3);
    *a2 = (uint64_t)(a2 + 2);
  }
  *v4 = 4;
  *(_DWORD *)(a1 + 8) = *((_DWORD *)a2 + 2);
  *((_DWORD *)a2 + 2) = 0;
}

__n128 std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,skit::MergedFieldMatchV2 *,skit::MergedFieldMatchV2 *,skit::MergedFieldMatchV2 *,0>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void **v6;
  __int128 v7;
  __n128 result;
  __int128 v9;

  if (a1 != a2)
  {
    v5 = a1;
    do
    {
      skit::SmallVector<skit::FieldMatchV2,4u,true>::_destroy(*(_QWORD *)a3, *(_DWORD *)(a3 + 8));
      if (a3 + 16 != *(_QWORD *)a3)
        free(*(void **)a3);
      skit::SmallVector<skit::FieldMatchV2,4u,true>::move(a3, (uint64_t *)v5);
      v6 = (void **)(a3 + 336);
      if (*(char *)(a3 + 359) < 0)
        operator delete(*v6);
      v7 = *(_OWORD *)(v5 + 336);
      *(_QWORD *)(a3 + 352) = *(_QWORD *)(v5 + 352);
      *(_OWORD *)v6 = v7;
      *(_BYTE *)(v5 + 359) = 0;
      *(_WORD *)(v5 + 336) = 0;
      result = *(__n128 *)(v5 + 360);
      v9 = *(_OWORD *)(v5 + 376);
      *(__n128 *)(a3 + 360) = result;
      *(_OWORD *)(a3 + 376) = v9;
      a3 += 392;
      v5 += 392;
    }
    while (v5 != a2);
  }
  return result;
}

float skit::internal::FieldSpanMatcherImpl::final_align_and_score<skit::SpanMatchV2>(uint64_t a1, float *a2, int a3, int a4)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  BOOL v13;
  int v14;
  float result;

  if (!*(_BYTE *)(a1 + 602))
  {
    v4 = *(unsigned int *)a2;
    v5 = *(_DWORD *)(a1 + 80);
    if ((int)v4 + 1 < v5)
    {
      v6 = *((unsigned int *)a2 + 1);
      if (v6 < v5)
      {
        v7 = *((_DWORD *)a2 + 2);
        v8 = v6 - v4;
        v9 = *(_QWORD *)(a1 + 72);
        v10 = *(unsigned int *)(*(_QWORD *)a1 + 48 * *(unsigned __int16 *)(v9 + 4 * v4) + 24);
        v11 = *(unsigned int *)(*(_QWORD *)a1 + 48 * (*(unsigned __int16 *)(v9 + 4 * v6 + 2) - 1) + 28);
        v12 = v7;
        v13 = (int)v11 - (int)v10 >= v8;
        v14 = v11 - v10 - v8;
        if (v14 != 0 && v13)
        {
          v12 = v14 + v7;
          *((_DWORD *)a2 + 2) = v14 + v7;
        }
        *(_QWORD *)a2 = v10 | (v11 << 32);
        a2[3] = a2[3] + (float)(v12 - v7);
      }
    }
  }
  result = a2[3] / (float)(a4 + a3);
  a2[3] = result;
  return result;
}

float skit::internal::FieldSpanMatcherImpl::final_align_and_score<skit::SpanMatchV3>(uint64_t a1, uint64_t a2, int a3, int a4)
{
  unsigned int v7;
  unsigned int v8;
  int v9;
  float result;

  if (!*(_BYTE *)(a1 + 602))
  {
    v7 = *(_DWORD *)(a1 + 80);
    if (*(_DWORD *)a2 + 1 < v7)
    {
      v8 = *(_DWORD *)(a2 + 4);
      if (v8 < v7)
      {
        v9 = *(_DWORD *)(a2 + 8);
        skit::internal::FieldSpanMatcherImpl::align_to_token_boundaries<skit::SpanMatchV3>(*(_QWORD *)a1, *(_QWORD *)(a1 + 72), (unsigned int *)a2, v8 - *(_DWORD *)a2);
        *(float *)(a2 + 12) = *(float *)(a2 + 12) + (float)(*(_DWORD *)(a2 + 8) - v9);
      }
    }
  }
  result = *(float *)(a2 + 12) / (float)(a4 + a3);
  *(float *)(a2 + 12) = result;
  return result;
}

uint64_t skit::SmallVector<skit::SpanMatchV3,4u,true>::erase(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = *(_QWORD *)a1 + ((unint64_t)*(unsigned int *)(a1 + 8) << 6);
  if (a2 + 64 != v4)
  {
    v5 = a2 + 96;
    do
    {
      *(_OWORD *)(v5 - 96) = *(_OWORD *)(v5 - 32);
      *(_OWORD *)(v5 - 84) = *(_OWORD *)(v5 - 20);
      skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v5 - 64), v5);
      *(_DWORD *)(v5 - 40) = *(_DWORD *)(v5 + 24);
      v6 = v5 + 32;
      v5 += 64;
    }
    while (v6 != v4);
  }
  v7 = *(void **)(v4 - 32);
  if (v7 != (void *)(v4 - 16))
    free(v7);
  --*(_DWORD *)(a1 + 8);
  return a2;
}

uint64_t skit::internal::FieldSpanMatcherImpl::align_to_token_boundaries<skit::SpanMatchV3>(uint64_t result, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(unsigned int *)(result + 48 * *(unsigned __int16 *)(a2 + 4 * *a3) + 24);
  v5 = *(unsigned int *)(result + 48 * (*(unsigned __int16 *)(a2 + 4 * a3[1] + 2) - 1) + 28);
  if ((int)v5 - (int)v4 > a4)
    a3[2] += v5 - v4 - a4;
  *(_QWORD *)a3 = v4 | (v5 << 32);
  return result;
}

BOOL skit::internal::AliasFilter::select_by_group_id(unsigned __int8 *a1, unsigned __int8 a2, unsigned __int8 a3)
{
  _BOOL8 result;
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  int v7;

  if (a2 && *a1 && *a1 != a2)
    return 0;
  v4 = *((unsigned int *)a1 + 4);
  if (!(_DWORD)v4)
    return 1;
  v5 = (unsigned __int8 *)*((_QWORD *)a1 + 1);
  v6 = v4 - 1;
  do
  {
    v7 = *v5++;
    result = v7 == a3;
  }
  while (v7 != a3 && v6-- != 0);
  return result;
}

void _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_118merge_prefix_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Lb0EEEvT1_SM_SG_NS_15iterator_traitsISM_E15difference_typeEb(uint64_t a1, unsigned int *a2, uint64_t a3, char a4)
{
  unsigned int *i;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  __int128 v16;
  int *v17;
  uint64_t v18;
  __int16 *v19;
  uint64_t v20;
  uint64_t *v21;
  __int16 v22;
  unsigned int *k;
  unsigned int v24;
  unsigned int *m;
  unsigned int v26;
  unsigned int v27;
  unint64_t v28;
  unsigned int v29;
  unsigned int v30;
  BOOL v31;
  unsigned int v32;
  unsigned int *v33;
  __int128 v34;
  __int128 v35;
  BOOL matched;
  __int128 v37;
  int *v38;
  uint64_t v39;
  __int16 *v40;
  uint64_t v41;
  uint64_t *v42;
  __int16 v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  unint64_t j;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  BOOL v54;
  unsigned int v55;
  unsigned int *v56;
  __int128 v57;
  __int128 v58;
  unsigned int v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int *v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  __int128 v68;
  int *v69;
  uint64_t v70;
  __int16 *v71;
  uint64_t v72;
  uint64_t *v73;
  __int16 v74;
  uint64_t v75;
  uint64_t n;
  uint64_t v77;
  void **v78;
  unsigned int v79;
  unsigned int v80;
  uint64_t v81;
  __int128 v82;
  int64_t v83;
  int64_t v84;
  int64_t v85;
  uint64_t v86;
  uint64_t v87;
  unsigned int v88;
  uint64_t v89;
  __int128 v90;
  uint64_t v91;
  _WORD **v92;
  int *v93;
  int v94;
  unsigned int v95;
  unsigned int v96;
  uint64_t v97;
  __int16 *v98;
  uint64_t v99;
  uint64_t *v100;
  __int16 v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  void **v105;
  uint64_t v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int v110;
  __int128 v111;
  unsigned int v112;
  unsigned int v113;
  uint64_t v114;
  uint64_t v115;
  int *v116;
  uint64_t v117;
  __int16 *v118;
  uint64_t v119;
  uint64_t *v120;
  __int16 v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unsigned int v128;
  __int128 v129;
  unsigned int v130;
  unsigned int v131;
  unsigned int *v132;
  __int128 v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  unsigned int v137;
  unsigned int v138;
  __int128 v139;
  int *v140;
  uint64_t v141;
  __int16 *v142;
  uint64_t v143;
  uint64_t *v144;
  __int16 v145;
  uint64_t v146;
  __int128 v147;
  void **v148;
  unsigned int v149;
  __int128 v150;
  unsigned int v151;
  unsigned int v152;
  uint64_t ii;
  uint64_t v154;
  unsigned int v155;
  unsigned int v156;
  unsigned int v157;
  __int128 v158;
  int *v159;
  uint64_t v160;
  __int16 *v161;
  uint64_t v162;
  uint64_t *v163;
  __int16 v164;
  uint64_t v165;
  unsigned int v166;
  BOOL v167;
  unsigned int v168;
  __int128 v169;
  int *v170;
  _BYTE v171[28];
  void *v172;
  int v173;
  int v174;
  uint64_t v175;
  unsigned int v176;
  _BYTE v177[28];
  void *v178;
  int v179;
  int v180;
  uint64_t v181;
  unsigned int v182;
  uint64_t v183;

  v183 = *MEMORY[0x1E0C80C00];
LABEL_2:
  i = (unsigned int *)a1;
  while (2)
  {
    a1 = (uint64_t)i;
    v9 = (char *)a2 - (char *)i;
    v10 = v9 >> 6;
    switch(v10)
    {
      case 0:
      case 1:
        return;
      case 2:
        v60 = *(a2 - 16);
        if (v60 < *(_DWORD *)a1
          || v60 <= *(_DWORD *)a1
          && ((v151 = *(a2 - 15), v152 = *(_DWORD *)(a1 + 4), v151 > v152)
           || v151 >= v152 && *(a2 - 10) < *(_DWORD *)(a1 + 24)))
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>(a1, (uint64_t)(a2 - 16));
        }
        return;
      case 3:
        _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_((unsigned int *)a1, (unsigned int *)(a1 + 64), a2 - 16);
        return;
      case 4:
        _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEvT1_SM_SM_SM_SG_((unsigned int *)a1, (unsigned int *)(a1 + 64), (unsigned int *)(a1 + 128), a2 - 16);
        return;
      case 5:
        _ZNSt3__124__sort5_maybe_branchlessB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Li0EEEvT1_SM_SM_SM_SM_SG_((unsigned int *)a1, (unsigned int *)(a1 + 64), (unsigned int *)(a1 + 128), (unsigned int *)(a1 + 192), a2 - 16);
        return;
      default:
        if (v9 > 1535)
        {
          if (!a3)
          {
            if ((unsigned int *)a1 != a2)
            {
              v83 = (unint64_t)(v10 - 2) >> 1;
              v84 = v83;
              do
              {
                v85 = v84;
                if (v83 >= v84)
                {
                  v86 = (2 * v84) | 1;
                  v87 = a1 + (v86 << 6);
                  if (2 * v85 + 2 < v10)
                  {
                    v88 = *(_DWORD *)(v87 + 64);
                    if (*(_DWORD *)v87 < v88
                      || *(_DWORD *)v87 <= v88
                      && ((v112 = *(_DWORD *)(v87 + 4), v113 = *(_DWORD *)(v87 + 68), v112 > v113)
                       || v112 >= v113 && *(_DWORD *)(a1 + (v86 << 6) + 24) < *(_DWORD *)(v87 + 88)))
                    {
                      v87 += 64;
                      v86 = 2 * v85 + 2;
                    }
                  }
                  v89 = a1 + (v85 << 6);
                  if (*(_DWORD *)v87 >= *(_DWORD *)v89)
                  {
                    if (*(_DWORD *)v87 > *(_DWORD *)v89
                      || (v95 = *(_DWORD *)(v87 + 4), v96 = *(_DWORD *)(v89 + 4), v95 <= v96)
                      && (v95 < v96 || *(_DWORD *)(v87 + 24) >= *(_DWORD *)(a1 + (v85 << 6) + 24)))
                    {
                      v90 = *(_OWORD *)v89;
                      *(_OWORD *)&v177[12] = *(_OWORD *)(v89 + 12);
                      *(_OWORD *)v177 = v90;
                      v91 = a1 + (v85 << 6);
                      v92 = (_WORD **)(v91 + 32);
                      if (*(_QWORD *)(v91 + 32) == v91 + 48)
                      {
                        v178 = &v181;
                        v97 = *(unsigned int *)(v91 + 40);
                        v93 = &v180;
                        if ((_DWORD)v97)
                        {
                          v98 = *v92;
                          v99 = 2 * v97;
                          v100 = &v181;
                          do
                          {
                            v101 = *v98++;
                            *(_WORD *)v100 = v101;
                            v100 = (uint64_t *)((char *)v100 + 2);
                            v99 -= 2;
                          }
                          while (v99);
                          v93 = &v180;
                        }
                      }
                      else
                      {
                        v178 = *(void **)(v91 + 32);
                        v94 = *(_DWORD *)(v91 + 44);
                        v93 = (int *)(v91 + 44);
                        v180 = v94;
                        *v92 = v92 + 2;
                      }
                      *v93 = 4;
                      v102 = a1 + (v85 << 6);
                      v179 = *(_DWORD *)(v102 + 40);
                      *(_DWORD *)(v102 + 40) = 0;
                      v182 = *(_DWORD *)(v102 + 56);
                      while (1)
                      {
                        v103 = v87;
                        v104 = *(_OWORD *)v87;
                        *(_OWORD *)(v89 + 12) = *(_OWORD *)(v87 + 12);
                        *(_OWORD *)v89 = v104;
                        v105 = (void **)(v87 + 32);
                        skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v89 + 32), v87 + 32);
                        *(_DWORD *)(v89 + 56) = *(_DWORD *)(v103 + 56);
                        if (v83 < v86)
                          break;
                        v106 = (2 * v86) | 1;
                        v87 = a1 + (v106 << 6);
                        if (2 * v86 + 2 < v10)
                        {
                          v107 = *(_DWORD *)(v87 + 64);
                          if (*(_DWORD *)v87 < v107
                            || *(_DWORD *)v87 <= v107
                            && ((v108 = *(_DWORD *)(v87 + 4), v109 = *(_DWORD *)(v87 + 68), v108 > v109)
                             || v108 >= v109 && *(_DWORD *)(a1 + (v106 << 6) + 24) < *(_DWORD *)(v87 + 88)))
                          {
                            v87 += 64;
                            v106 = 2 * v86 + 2;
                          }
                        }
                        if (*(_DWORD *)v87 < *(_DWORD *)v177)
                          break;
                        v89 = v103;
                        v86 = v106;
                        if (*(_DWORD *)v87 <= *(_DWORD *)v177)
                        {
                          v110 = *(_DWORD *)(v87 + 4);
                          if (v110 > *(_DWORD *)&v177[4])
                            break;
                          v89 = v103;
                          v86 = v106;
                          if (v110 >= *(_DWORD *)&v177[4])
                          {
                            v89 = v103;
                            v86 = v106;
                            if (*(_DWORD *)(v87 + 24) < *(_DWORD *)&v177[24])
                              break;
                          }
                        }
                      }
                      v111 = *(_OWORD *)v177;
                      *(_OWORD *)(v103 + 12) = *(_OWORD *)&v177[12];
                      *(_OWORD *)v103 = v111;
                      skit::SmallVector<skit::GroupId,4u,true>::operator=(v105, (uint64_t)&v178);
                      *(_DWORD *)(v103 + 56) = v182;
                      if (v178 != &v181)
                        free(v178);
                    }
                  }
                }
                v84 = v85 - 1;
              }
              while (v85);
              v114 = (unint64_t)v9 >> 6;
              v115 = a1 + 48;
              v170 = (int *)(a1 + 44);
              do
              {
                *(_OWORD *)&v171[12] = *(_OWORD *)(a1 + 12);
                *(_OWORD *)v171 = *(_OWORD *)a1;
                if (*(_QWORD *)(a1 + 32) == v115)
                {
                  v172 = &v175;
                  v117 = *(unsigned int *)(a1 + 40);
                  v116 = &v174;
                  if ((_DWORD)v117)
                  {
                    v118 = *(__int16 **)(a1 + 32);
                    v119 = 2 * v117;
                    v120 = &v175;
                    do
                    {
                      v121 = *v118++;
                      *(_WORD *)v120 = v121;
                      v120 = (uint64_t *)((char *)v120 + 2);
                      v119 -= 2;
                    }
                    while (v119);
                    v116 = &v174;
                  }
                }
                else
                {
                  v172 = *(void **)(a1 + 32);
                  v174 = *(_DWORD *)(a1 + 44);
                  *(_QWORD *)(a1 + 32) = v115;
                  v116 = v170;
                }
                v122 = 0;
                *v116 = 4;
                v173 = *(_DWORD *)(a1 + 40);
                *(_DWORD *)(a1 + 40) = 0;
                v176 = *(_DWORD *)(a1 + 56);
                v123 = a1;
                do
                {
                  v124 = a1;
                  v125 = v122 + 1;
                  a1 += (v122 + 1) << 6;
                  v126 = 2 * v122;
                  v122 = (2 * v122) | 1;
                  v127 = v126 + 2;
                  if (v127 < v114)
                  {
                    v128 = *(_DWORD *)(a1 + 64);
                    if (*(_DWORD *)a1 < v128
                      || *(_DWORD *)a1 <= v128
                      && ((v130 = *(_DWORD *)(a1 + 4), v131 = *(_DWORD *)(a1 + 68), v130 > v131)
                       || v130 >= v131 && *(_DWORD *)(v124 + (v125 << 6) + 24) < *(_DWORD *)(a1 + 88)))
                    {
                      a1 += 64;
                      v122 = v127;
                    }
                  }
                  v129 = *(_OWORD *)a1;
                  *(_OWORD *)(v124 + 12) = *(_OWORD *)(a1 + 12);
                  *(_OWORD *)v124 = v129;
                  skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v124 + 32), a1 + 32);
                  *(_DWORD *)(v124 + 56) = *(_DWORD *)(a1 + 56);
                }
                while (v122 <= (uint64_t)((unint64_t)(v114 - 2) >> 1));
                v132 = a2 - 16;
                if ((unsigned int *)a1 == a2 - 16)
                {
                  *(_OWORD *)(a1 + 12) = *(_OWORD *)&v171[12];
                  *(_OWORD *)a1 = *(_OWORD *)v171;
                  skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), (uint64_t)&v172);
                  *(_DWORD *)(a1 + 56) = v176;
                }
                else
                {
                  v133 = *(_OWORD *)v132;
                  *(_OWORD *)(a1 + 12) = *(_OWORD *)(a2 - 13);
                  *(_OWORD *)a1 = v133;
                  skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), (uint64_t)(a2 - 8));
                  *(_DWORD *)(a1 + 56) = *(a2 - 2);
                  *(_OWORD *)(a2 - 13) = *(_OWORD *)&v171[12];
                  *(_OWORD *)v132 = *(_OWORD *)v171;
                  skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)a2 - 4, (uint64_t)&v172);
                  *(a2 - 2) = v176;
                  v134 = a1 - v123 + 64;
                  if (v134 >= 65)
                  {
                    v135 = (((unint64_t)v134 >> 6) - 2) >> 1;
                    v136 = v123 + (v135 << 6);
                    if (*(_DWORD *)v136 < *(_DWORD *)a1
                      || *(_DWORD *)v136 <= *(_DWORD *)a1
                      && ((v137 = *(_DWORD *)(v136 + 4), v138 = *(_DWORD *)(a1 + 4), v137 > v138)
                       || v137 >= v138 && *(_DWORD *)(v123 + (v135 << 6) + 24) < *(_DWORD *)(a1 + 24)))
                    {
                      v139 = *(_OWORD *)a1;
                      *(_OWORD *)&v177[12] = *(_OWORD *)(a1 + 12);
                      *(_OWORD *)v177 = v139;
                      if (*(_QWORD *)(a1 + 32) == a1 + 48)
                      {
                        v178 = &v181;
                        v141 = *(unsigned int *)(a1 + 40);
                        v140 = &v180;
                        if ((_DWORD)v141)
                        {
                          v142 = *(__int16 **)(a1 + 32);
                          v143 = 2 * v141;
                          v144 = &v181;
                          do
                          {
                            v145 = *v142++;
                            *(_WORD *)v144 = v145;
                            v144 = (uint64_t *)((char *)v144 + 2);
                            v143 -= 2;
                          }
                          while (v143);
                          v140 = &v180;
                        }
                      }
                      else
                      {
                        v178 = *(void **)(a1 + 32);
                        v140 = (int *)(a1 + 44);
                        v180 = *(_DWORD *)(a1 + 44);
                        *(_QWORD *)(a1 + 32) = a1 + 48;
                      }
                      *v140 = 4;
                      v179 = *(_DWORD *)(a1 + 40);
                      *(_DWORD *)(a1 + 40) = 0;
                      v182 = *(_DWORD *)(a1 + 56);
                      while (1)
                      {
                        v146 = v136;
                        v147 = *(_OWORD *)v136;
                        *(_OWORD *)(a1 + 12) = *(_OWORD *)(v136 + 12);
                        *(_OWORD *)a1 = v147;
                        v148 = (void **)(v136 + 32);
                        skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), v136 + 32);
                        *(_DWORD *)(a1 + 56) = *(_DWORD *)(v146 + 56);
                        if (!v135)
                          break;
                        v135 = (v135 - 1) >> 1;
                        v136 = v123 + (v135 << 6);
                        a1 = v146;
                        if (*(_DWORD *)v136 >= *(_DWORD *)v177)
                        {
                          if (*(_DWORD *)v136 > *(_DWORD *)v177)
                            break;
                          v149 = *(_DWORD *)(v136 + 4);
                          a1 = v146;
                          if (v149 <= *(_DWORD *)&v177[4])
                          {
                            if (v149 < *(_DWORD *)&v177[4])
                              break;
                            a1 = v146;
                            if (*(_DWORD *)(v123 + (v135 << 6) + 24) >= *(_DWORD *)&v177[24])
                              break;
                          }
                        }
                      }
                      v150 = *(_OWORD *)v177;
                      *(_OWORD *)(v146 + 12) = *(_OWORD *)&v177[12];
                      *(_OWORD *)v146 = v150;
                      skit::SmallVector<skit::GroupId,4u,true>::operator=(v148, (uint64_t)&v178);
                      *(_DWORD *)(v146 + 56) = v182;
                      if (v178 != &v181)
                        free(v178);
                    }
                  }
                }
                if (v172 != &v175)
                  free(v172);
                a2 = v132;
                v31 = v114-- <= 2;
                a1 = v123;
              }
              while (!v31);
            }
            return;
          }
          v11 = (unint64_t)v10 >> 1;
          v12 = (unsigned int *)(a1 + ((unint64_t)v10 >> 1 << 6));
          if ((unint64_t)v9 <= 0x2000)
          {
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_(v12, (unsigned int *)a1, a2 - 16);
          }
          else
          {
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_((unsigned int *)a1, v12, a2 - 16);
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_((unsigned int *)(a1 + 64), v12 - 16, a2 - 32);
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_((unsigned int *)(a1 + 128), (unsigned int *)(a1 + 64 + (v11 << 6)), a2 - 48);
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_(v12 - 16, v12, (unsigned int *)(a1 + 64 + (v11 << 6)));
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>(a1, (uint64_t)v12);
          }
          --a3;
          if ((a4 & 1) == 0)
          {
            v13 = *(_DWORD *)(a1 - 64);
            if (v13 >= *(_DWORD *)a1)
            {
              if (v13 > *(_DWORD *)a1
                || (v14 = *(_DWORD *)(a1 - 60), v15 = *(_DWORD *)(a1 + 4), v14 <= v15)
                && (v14 < v15 || *(_DWORD *)(a1 - 40) >= *(_DWORD *)(a1 + 24)))
              {
                v37 = *(_OWORD *)a1;
                *(_OWORD *)&v177[12] = *(_OWORD *)(a1 + 12);
                *(_OWORD *)v177 = v37;
                if (*(_QWORD *)(a1 + 32) == a1 + 48)
                {
                  v178 = &v181;
                  v39 = *(unsigned int *)(a1 + 40);
                  v38 = &v180;
                  if ((_DWORD)v39)
                  {
                    v40 = *(__int16 **)(a1 + 32);
                    v41 = 2 * v39;
                    v42 = &v181;
                    do
                    {
                      v43 = *v40++;
                      *(_WORD *)v42 = v43;
                      v42 = (uint64_t *)((char *)v42 + 2);
                      v41 -= 2;
                    }
                    while (v41);
                    v38 = &v180;
                  }
                }
                else
                {
                  v178 = *(void **)(a1 + 32);
                  v38 = (int *)(a1 + 44);
                  v180 = *(_DWORD *)(a1 + 44);
                  *(_QWORD *)(a1 + 32) = a1 + 48;
                }
                *v38 = 4;
                v179 = *(_DWORD *)(a1 + 40);
                *(_DWORD *)(a1 + 40) = 0;
                v182 = *(_DWORD *)(a1 + 56);
                v44 = *(a2 - 16);
                if (*(_DWORD *)v177 < v44)
                {
                  v45 = *(_DWORD *)&v177[4];
                  goto LABEL_76;
                }
                v45 = *(_DWORD *)&v177[4];
                if (*(_DWORD *)v177 > v44)
                {
LABEL_85:
                  v46 = *(_DWORD *)&v177[24];
                  goto LABEL_86;
                }
                v59 = *(a2 - 15);
                if (*(_DWORD *)&v177[4] > v59)
                {
LABEL_76:
                  v46 = *(_DWORD *)&v177[24];
                }
                else
                {
                  if (*(_DWORD *)&v177[4] < v59)
                    goto LABEL_85;
                  v46 = *(_DWORD *)&v177[24];
                  if (*(_DWORD *)&v177[24] >= *(a2 - 10))
                  {
LABEL_86:
                    for (i = (unsigned int *)(a1 + 64); i < a2; i += 16)
                    {
                      if (*(_DWORD *)v177 < *i)
                        break;
                      if (*(_DWORD *)v177 <= *i)
                      {
                        v48 = i[1];
                        if (*(_DWORD *)&v177[4] > v48 || *(_DWORD *)&v177[4] >= v48 && v46 < i[6])
                          break;
                      }
                    }
                    goto LABEL_94;
                  }
                }
                for (i = (unsigned int *)(a1 + 64); *(_DWORD *)v177 >= *i; i += 16)
                {
                  if (*(_DWORD *)v177 <= *i)
                  {
                    v47 = i[1];
                    if (v45 > v47 || v45 >= v47 && v46 < i[6])
                      break;
                  }
                }
LABEL_94:
                j = (unint64_t)a2;
                if (i < a2)
                {
                  for (j = (unint64_t)(a2 - 16); ; j -= 64)
                  {
                    if (*(_DWORD *)v177 >= v44)
                    {
                      if (*(_DWORD *)v177 > v44)
                        break;
                      v50 = *(_DWORD *)(j + 4);
                      if (v45 <= v50 && (v45 < v50 || v46 >= *(_DWORD *)(j + 24)))
                        break;
                    }
                    v51 = *(_DWORD *)(j - 64);
                    v44 = v51;
                  }
                }
                while ((unint64_t)i < j)
                {
                  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)i, j);
                  for (i += 16; *(_DWORD *)v177 >= *i; i += 16)
                  {
                    if (*(_DWORD *)v177 <= *i)
                    {
                      v52 = i[1];
                      if (*(_DWORD *)&v177[4] > v52 || *(_DWORD *)&v177[4] >= v52 && *(_DWORD *)&v177[24] < i[6])
                        break;
                    }
                  }
                  do
                  {
                    do
                    {
                      v53 = *(_DWORD *)(j - 64);
                      j -= 64;
                      v54 = *(_DWORD *)v177 > v53;
                    }
                    while (*(_DWORD *)v177 < v53);
                    if (v54)
                      break;
                    v55 = *(_DWORD *)(j + 4);
                  }
                  while (*(_DWORD *)&v177[4] > v55
                       || *(_DWORD *)&v177[4] >= v55 && *(_DWORD *)&v177[24] < *(_DWORD *)(j + 24));
                }
                v56 = i - 16;
                if (i - 16 != (unsigned int *)a1)
                {
                  v57 = *(_OWORD *)v56;
                  *(_OWORD *)(a1 + 12) = *(_OWORD *)(i - 13);
                  *(_OWORD *)a1 = v57;
                  skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), (uint64_t)(i - 8));
                  *(_DWORD *)(a1 + 56) = *(i - 2);
                }
                v58 = *(_OWORD *)v177;
                *(_OWORD *)(i - 13) = *(_OWORD *)&v177[12];
                *(_OWORD *)v56 = v58;
                skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)i - 4, (uint64_t)&v178);
                *(i - 2) = v182;
                if (v178 != &v181)
                  free(v178);
                goto LABEL_67;
              }
            }
          }
          v16 = *(_OWORD *)a1;
          *(_OWORD *)&v177[12] = *(_OWORD *)(a1 + 12);
          *(_OWORD *)v177 = v16;
          if (*(_QWORD *)(a1 + 32) == a1 + 48)
          {
            v178 = &v181;
            v18 = *(unsigned int *)(a1 + 40);
            v17 = &v180;
            if ((_DWORD)v18)
            {
              v19 = *(__int16 **)(a1 + 32);
              v20 = 2 * v18;
              v21 = &v181;
              do
              {
                v22 = *v19++;
                *(_WORD *)v21 = v22;
                v21 = (uint64_t *)((char *)v21 + 2);
                v20 -= 2;
              }
              while (v20);
              v17 = &v180;
            }
          }
          else
          {
            v178 = *(void **)(a1 + 32);
            v17 = (int *)(a1 + 44);
            v180 = *(_DWORD *)(a1 + 44);
            *(_QWORD *)(a1 + 32) = a1 + 48;
          }
          *v17 = 4;
          v179 = *(_DWORD *)(a1 + 40);
          *(_DWORD *)(a1 + 40) = 0;
          v182 = *(_DWORD *)(a1 + 56);
          for (k = (unsigned int *)(a1 + 64); ; k += 16)
          {
            if (*k >= *(_DWORD *)v177)
            {
              if (*k > *(_DWORD *)v177)
                break;
              v24 = k[1];
              if (v24 <= *(_DWORD *)&v177[4] && (v24 < *(_DWORD *)&v177[4] || k[6] >= *(_DWORD *)&v177[24]))
                break;
            }
          }
          m = a2 - 16;
          if (k - 16 == (unsigned int *)a1)
          {
            for (m = a2 - 16; k < m + 16; m -= 16)
            {
              if (*m < *(_DWORD *)v177)
                goto LABEL_44;
              if (*m <= *(_DWORD *)v177)
              {
                v27 = m[1];
                if (v27 > *(_DWORD *)&v177[4] || v27 >= *(_DWORD *)&v177[4] && m[6] < *(_DWORD *)&v177[24])
                  goto LABEL_44;
              }
            }
            m += 16;
          }
          else
          {
            while (*m >= *(_DWORD *)v177)
            {
              if (*m <= *(_DWORD *)v177)
              {
                v26 = m[1];
                if (v26 > *(_DWORD *)&v177[4] || v26 >= *(_DWORD *)&v177[4] && m[6] < *(_DWORD *)&v177[24])
                  break;
              }
              m -= 16;
            }
          }
LABEL_44:
          i = k;
          if (k < m)
          {
            i = k;
            v28 = (unint64_t)m;
            do
            {
              std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)i, v28);
              for (i += 16; ; i += 16)
              {
                if (*i >= *(_DWORD *)v177)
                {
                  if (*i > *(_DWORD *)v177)
                    break;
                  v29 = i[1];
                  if (v29 <= *(_DWORD *)&v177[4] && (v29 < *(_DWORD *)&v177[4] || i[6] >= *(_DWORD *)&v177[24]))
                    break;
                }
              }
              while (1)
              {
                v30 = *(_DWORD *)(v28 - 64);
                v28 -= 64;
                v31 = v30 > *(_DWORD *)v177;
                if (v30 < *(_DWORD *)v177)
                  break;
                if (!v31)
                {
                  v32 = *(_DWORD *)(v28 + 4);
                  if (v32 > *(_DWORD *)&v177[4]
                    || v32 >= *(_DWORD *)&v177[4] && *(_DWORD *)(v28 + 24) < *(_DWORD *)&v177[24])
                  {
                    break;
                  }
                }
              }
            }
            while ((unint64_t)i < v28);
          }
          v33 = i - 16;
          if (i - 16 != (unsigned int *)a1)
          {
            v34 = *(_OWORD *)v33;
            *(_OWORD *)(a1 + 12) = *(_OWORD *)(i - 13);
            *(_OWORD *)a1 = v34;
            skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), (uint64_t)(i - 8));
            *(_DWORD *)(a1 + 56) = *(i - 2);
          }
          v35 = *(_OWORD *)v177;
          *(_OWORD *)(i - 13) = *(_OWORD *)&v177[12];
          *(_OWORD *)v33 = v35;
          skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)i - 4, (uint64_t)&v178);
          *(i - 2) = v182;
          if (v178 != &v181)
            free(v178);
          if (k < m)
            goto LABEL_66;
          matched = _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_118merge_prefix_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEbT1_SM_SG_((unsigned int *)a1, i - 16);
          if (!_ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_118merge_prefix_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEbT1_SM_SG_(i, a2))
          {
            if (matched)
              continue;
LABEL_66:
            _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_118merge_prefix_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Lb0EEEvT1_SM_SG_NS_15iterator_traitsISM_E15difference_typeEb(a1, i - 16, a3, a4 & 1);
LABEL_67:
            a4 = 0;
            continue;
          }
          a2 = i - 16;
          if (matched)
            return;
          goto LABEL_2;
        }
        if ((a4 & 1) != 0)
        {
          if ((unsigned int *)a1 != a2)
          {
            v61 = a1 + 64;
            if ((unsigned int *)(a1 + 64) != a2)
            {
              v62 = 0;
              v63 = a1;
              do
              {
                v64 = (unsigned int *)v63;
                v63 = v61;
                v65 = v64[16];
                if (v65 < *v64
                  || v65 <= *v64
                  && ((v66 = *(_DWORD *)(v63 + 4), v67 = v64[1], v66 > v67)
                   || v66 >= v67 && *(_DWORD *)(v63 + 24) < v64[6]))
                {
                  v68 = *(_OWORD *)v63;
                  *(_OWORD *)&v177[12] = *(_OWORD *)(v63 + 12);
                  *(_OWORD *)v177 = v68;
                  if (*(_QWORD *)(v63 + 32) == v63 + 48)
                  {
                    v178 = &v181;
                    v70 = *(unsigned int *)(v63 + 40);
                    v69 = &v180;
                    if ((_DWORD)v70)
                    {
                      v71 = *(__int16 **)(v63 + 32);
                      v72 = 2 * v70;
                      v73 = &v181;
                      do
                      {
                        v74 = *v71++;
                        *(_WORD *)v73 = v74;
                        v73 = (uint64_t *)((char *)v73 + 2);
                        v72 -= 2;
                      }
                      while (v72);
                      v69 = &v180;
                    }
                  }
                  else
                  {
                    v178 = *(void **)(v63 + 32);
                    v69 = (int *)(v63 + 44);
                    v180 = *(_DWORD *)(v63 + 44);
                    *(_QWORD *)(v63 + 32) = v63 + 48;
                  }
                  v75 = a1;
                  *v69 = 4;
                  v179 = *(_DWORD *)(v63 + 40);
                  *(_DWORD *)(v63 + 40) = 0;
                  v182 = *(_DWORD *)(v63 + 56);
                  for (n = v62; ; n -= 64)
                  {
                    v77 = v75 + n;
                    *(_OWORD *)(v77 + 64) = *(_OWORD *)(v75 + n);
                    *(_OWORD *)(v77 + 76) = *(_OWORD *)(v75 + n + 12);
                    v78 = (void **)(v75 + n + 32);
                    skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v75 + n + 96), (uint64_t)v78);
                    *(_DWORD *)(v77 + 120) = *(_DWORD *)(v77 + 56);
                    if (!n)
                    {
                      v81 = v75;
                      goto LABEL_156;
                    }
                    v79 = *(_DWORD *)(v77 - 64);
                    if (*(_DWORD *)v177 >= v79)
                    {
                      if (*(_DWORD *)v177 > v79)
                        break;
                      v80 = *(_DWORD *)(v75 + n - 60);
                      if (*(_DWORD *)&v177[4] <= v80
                        && (*(_DWORD *)&v177[4] < v80 || *(_DWORD *)&v177[24] >= *(_DWORD *)(v75 + n - 40)))
                      {
                        break;
                      }
                    }
                  }
                  v81 = v75 + n;
                  v78 = (void **)(v81 + 32);
LABEL_156:
                  v82 = *(_OWORD *)v177;
                  *(_OWORD *)(v81 + 12) = *(_OWORD *)&v177[12];
                  *(_OWORD *)v81 = v82;
                  skit::SmallVector<skit::GroupId,4u,true>::operator=(v78, (uint64_t)&v178);
                  *(_DWORD *)(v81 + 56) = v182;
                  if (v178 != &v181)
                    free(v178);
                  a1 = v75;
                }
                v61 = v63 + 64;
                v62 += 64;
              }
              while ((unsigned int *)(v63 + 64) != a2);
            }
          }
        }
        else if ((unsigned int *)a1 != a2)
        {
          for (ii = a1 + 64; (unsigned int *)(a1 + 64) != a2; ii = a1 + 64)
          {
            v154 = a1;
            a1 = ii;
            v155 = *(_DWORD *)(v154 + 64);
            if (v155 >= *(_DWORD *)v154)
            {
              if (v155 > *(_DWORD *)v154)
                continue;
              v156 = *(_DWORD *)(a1 + 4);
              v157 = *(_DWORD *)(v154 + 4);
              if (v156 <= v157 && (v156 < v157 || *(_DWORD *)(a1 + 24) >= *(_DWORD *)(v154 + 24)))
                continue;
            }
            v158 = *(_OWORD *)a1;
            *(_OWORD *)&v177[12] = *(_OWORD *)(a1 + 12);
            *(_OWORD *)v177 = v158;
            if (*(_QWORD *)(a1 + 32) == a1 + 48)
            {
              v178 = &v181;
              v160 = *(unsigned int *)(a1 + 40);
              v159 = &v180;
              if ((_DWORD)v160)
              {
                v161 = *(__int16 **)(a1 + 32);
                v162 = 2 * v160;
                v163 = &v181;
                do
                {
                  v164 = *v161++;
                  *(_WORD *)v163 = v164;
                  v163 = (uint64_t *)((char *)v163 + 2);
                  v162 -= 2;
                }
                while (v162);
                v159 = &v180;
              }
            }
            else
            {
              v178 = *(void **)(a1 + 32);
              v159 = (int *)(a1 + 44);
              v180 = *(_DWORD *)(a1 + 44);
              *(_QWORD *)(a1 + 32) = a1 + 48;
            }
            *v159 = 4;
            v179 = *(_DWORD *)(a1 + 40);
            *(_DWORD *)(a1 + 40) = 0;
            v182 = *(_DWORD *)(a1 + 56);
            do
            {
              do
              {
                v165 = v154;
                *(_OWORD *)(v154 + 64) = *(_OWORD *)v154;
                *(_OWORD *)(v154 + 76) = *(_OWORD *)(v154 + 12);
                skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v154 + 96), v154 + 32);
                v166 = *(_DWORD *)(v154 - 64);
                v154 -= 64;
                *(_DWORD *)(v154 + 184) = *(_DWORD *)(v154 + 120);
                v167 = *(_DWORD *)v177 > v166;
              }
              while (*(_DWORD *)v177 < v166);
              if (v167)
                break;
              v168 = *(_DWORD *)(v165 - 60);
            }
            while (*(_DWORD *)&v177[4] > v168
                 || *(_DWORD *)&v177[4] >= v168 && *(_DWORD *)&v177[24] < *(_DWORD *)(v165 - 40));
            v169 = *(_OWORD *)v177;
            *(_OWORD *)(v165 + 12) = *(_OWORD *)&v177[12];
            *(_OWORD *)v165 = v169;
            skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v165 + 32), (uint64_t)&v178);
            *(_DWORD *)(v165 + 56) = v182;
            if (v178 != &v181)
              free(v178);
          }
        }
        return;
    }
  }
}

BOOL skit::internal::`anonymous namespace'::is_possessive_token(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  if ((HIDWORD(a3) - a3) < 3)
    return 0;
  v3 = a1 + 2 * HIDWORD(a3);
  return *(_DWORD *)(v3 - 4) == 7536679 || *(_DWORD *)(v3 - 4) == 7544857;
}

void skit::internal::`anonymous namespace'::merge_token_spans(uint64_t a1, unint64_t a2, uint64_t a3, unsigned int a4)
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v9;
  char v10;
  int32x2_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  unint64_t v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24[2];

  v5 = *(_DWORD *)(a3 + 8);
  if (a4)
  {
    v6 = a4;
    v9 = 0;
    do
    {
      if (v6 >= v5)
      {
LABEL_20:
        ++v9;
      }
      else
      {
        v10 = 0;
        v11 = (int32x2_t *)(*(_QWORD *)a3 + ((unint64_t)v9 << 6));
        v12 = v6;
LABEL_5:
        v23 = v10;
        v13 = v12 << 6;
        do
        {
          v14 = *(_QWORD *)a3;
          v15 = (int *)(*(_QWORD *)a3 + v13);
          if (v15[4] <= 1)
          {
            v16 = v11->u32[1];
            v17 = *v15;
            if (*v15 >= v16)
            {
              if (v17 == (_DWORD)v16)
                goto LABEL_16;
              v18 = a2 - v16;
              if (a2 < v16)
                std::__throw_out_of_range[abi:ne180100]("string_view::substr");
              v19 = (v17 - v16);
              v20 = a1 + 2 * v16;
              if (v18 < v19)
                v19 = v18;
              v24[0] = v20;
              v24[1] = v19;
              if (!skit::is_significant(v24))
              {
                v15 = (int *)(v14 + v13);
LABEL_16:
                skit::SpanMatchV3::merge((size_t)v15, v11);
                ++v12;
                v10 = 1;
                if (v5 != (_DWORD)v12)
                  goto LABEL_5;
                goto LABEL_19;
              }
            }
          }
          ++v12;
          v13 += 64;
        }
        while (v5 != (_DWORD)v12);
        if ((v23 & 1) == 0)
          goto LABEL_20;
LABEL_19:
        skit::SmallVector<skit::SpanMatchV3,4u,true>::erase(a3, *(_QWORD *)a3 + ((unint64_t)v9 << 6));
        --v6;
        --v5;
      }
    }
    while (v9 < v6);
    v5 = *(_DWORD *)(a3 + 8);
  }
  v21 = 126 - 2 * __clz(v5);
  if (v5)
    v22 = v21;
  else
    v22 = 0;
  _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Lb0EEEvT1_SM_SG_NS_15iterator_traitsISM_E15difference_typeEb(*(_QWORD *)a3, (unsigned int *)(*(_QWORD *)a3 + ((unint64_t)v5 << 6)), v22, 1);
}

char **skit::SmallVector<skit::SpanMatchV3,8u,true>::~SmallVector(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;

  v2 = *a1;
  v3 = *((unsigned int *)a1 + 2);
  if ((_DWORD)v3)
  {
    v4 = v3 << 6;
    v5 = v2 + 48;
    do
    {
      v6 = (char *)*((_QWORD *)v5 - 2);
      if (v5 != v6)
        free(v6);
      v5 += 64;
      v4 -= 64;
    }
    while (v4);
    v2 = *a1;
  }
  if (v2 != (char *)(a1 + 2))
    free(v2);
  return a1;
}

size_t skit::SmallVector<skit::SpanMatchV3,4u,true>::_reserve_more(char **a1, unsigned int a2)
{
  char *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  __int128 v9;
  uint64_t v10;
  char *v11;
  char *v12;
  size_t result;
  std::bad_alloc *exception;
  std::bad_alloc *v15;

  v3 = (char *)malloc_type_malloc((unint64_t)a2 << 6, 0x10200408C599F99uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v15 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v15, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
  }
  v4 = v3;
  v5 = *a1;
  v6 = *((unsigned int *)a1 + 2);
  if ((_DWORD)v6)
  {
    v7 = v3;
    v8 = *a1;
    do
    {
      v9 = *(_OWORD *)v8;
      *(_OWORD *)(v7 + 12) = *(_OWORD *)(v8 + 12);
      *(_OWORD *)v7 = v9;
      skit::SmallVector<skit::GroupId,4u,true>::move((uint64_t)(v7 + 32), (uint64_t)(v8 + 32));
      *((_DWORD *)v7 + 14) = *((_DWORD *)v8 + 14);
      v8 += 64;
      v7 += 64;
    }
    while (v8 != &v5[64 * v6]);
    v10 = v6 << 6;
    v11 = v5 + 48;
    do
    {
      v12 = (char *)*((_QWORD *)v11 - 2);
      if (v11 != v12)
        free(v12);
      v11 += 64;
      v10 -= 64;
    }
    while (v10);
    v5 = *a1;
  }
  if (v5 != (char *)(a1 + 2))
    free(v5);
  *a1 = v4;
  result = malloc_size(v4);
  *((_DWORD *)a1 + 3) = result >> 6;
  return result;
}

void _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Lb0EEEvT1_SM_SG_NS_15iterator_traitsISM_E15difference_typeEb(uint64_t a1, unsigned int *a2, uint64_t a3, char a4)
{
  unsigned int *i;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  __int128 v16;
  int *v17;
  uint64_t v18;
  __int16 *v19;
  uint64_t v20;
  uint64_t *v21;
  __int16 v22;
  unsigned int *k;
  unsigned int v24;
  unsigned int *m;
  unsigned int v26;
  unsigned int v27;
  unint64_t v28;
  unsigned int v29;
  unsigned int v30;
  BOOL v31;
  unsigned int v32;
  unsigned int *v33;
  __int128 v34;
  __int128 v35;
  BOOL matched;
  __int128 v37;
  int *v38;
  uint64_t v39;
  __int16 *v40;
  uint64_t v41;
  uint64_t *v42;
  __int16 v43;
  unsigned int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  unint64_t j;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  BOOL v54;
  unsigned int v55;
  unsigned int *v56;
  __int128 v57;
  __int128 v58;
  unsigned int v59;
  unsigned int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int *v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  __int128 v68;
  int *v69;
  uint64_t v70;
  __int16 *v71;
  uint64_t v72;
  uint64_t *v73;
  __int16 v74;
  uint64_t v75;
  uint64_t n;
  uint64_t v77;
  void **v78;
  unsigned int v79;
  unsigned int v80;
  uint64_t v81;
  __int128 v82;
  int64_t v83;
  int64_t v84;
  int64_t v85;
  uint64_t v86;
  uint64_t v87;
  unsigned int v88;
  uint64_t v89;
  __int128 v90;
  uint64_t v91;
  _WORD **v92;
  int *v93;
  int v94;
  unsigned int v95;
  unsigned int v96;
  uint64_t v97;
  __int16 *v98;
  uint64_t v99;
  uint64_t *v100;
  __int16 v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  void **v105;
  uint64_t v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int v110;
  __int128 v111;
  unsigned int v112;
  unsigned int v113;
  uint64_t v114;
  uint64_t v115;
  int *v116;
  uint64_t v117;
  __int16 *v118;
  uint64_t v119;
  uint64_t *v120;
  __int16 v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unsigned int v128;
  __int128 v129;
  unsigned int v130;
  unsigned int v131;
  unsigned int *v132;
  __int128 v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  unsigned int v137;
  unsigned int v138;
  __int128 v139;
  int *v140;
  uint64_t v141;
  __int16 *v142;
  uint64_t v143;
  uint64_t *v144;
  __int16 v145;
  uint64_t v146;
  __int128 v147;
  void **v148;
  unsigned int v149;
  __int128 v150;
  unsigned int v151;
  unsigned int v152;
  uint64_t ii;
  uint64_t v154;
  unsigned int v155;
  unsigned int v156;
  unsigned int v157;
  __int128 v158;
  int *v159;
  uint64_t v160;
  __int16 *v161;
  uint64_t v162;
  uint64_t *v163;
  __int16 v164;
  uint64_t v165;
  unsigned int v166;
  BOOL v167;
  unsigned int v168;
  __int128 v169;
  int *v170;
  _BYTE v171[28];
  void *v172;
  int v173;
  int v174;
  uint64_t v175;
  unsigned int v176;
  _BYTE v177[28];
  void *v178;
  int v179;
  int v180;
  uint64_t v181;
  unsigned int v182;
  uint64_t v183;

  v183 = *MEMORY[0x1E0C80C00];
LABEL_2:
  i = (unsigned int *)a1;
  while (2)
  {
    a1 = (uint64_t)i;
    v9 = (char *)a2 - (char *)i;
    v10 = v9 >> 6;
    switch(v10)
    {
      case 0:
      case 1:
        return;
      case 2:
        v60 = *(a2 - 16);
        if (v60 < *(_DWORD *)a1
          || v60 <= *(_DWORD *)a1
          && ((v151 = *(a2 - 15), v152 = *(_DWORD *)(a1 + 4), v151 > v152)
           || v151 >= v152 && *(a2 - 10) < *(_DWORD *)(a1 + 24)))
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>(a1, (uint64_t)(a2 - 16));
        }
        return;
      case 3:
        _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_((unsigned int *)a1, (unsigned int *)(a1 + 64), a2 - 16);
        return;
      case 4:
        _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEvT1_SM_SM_SM_SG_((unsigned int *)a1, (unsigned int *)(a1 + 64), (unsigned int *)(a1 + 128), a2 - 16);
        return;
      case 5:
        _ZNSt3__124__sort5_maybe_branchlessB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Li0EEEvT1_SM_SM_SM_SM_SG_((unsigned int *)a1, (unsigned int *)(a1 + 64), (unsigned int *)(a1 + 128), (unsigned int *)(a1 + 192), a2 - 16);
        return;
      default:
        if (v9 > 1535)
        {
          if (!a3)
          {
            if ((unsigned int *)a1 != a2)
            {
              v83 = (unint64_t)(v10 - 2) >> 1;
              v84 = v83;
              do
              {
                v85 = v84;
                if (v83 >= v84)
                {
                  v86 = (2 * v84) | 1;
                  v87 = a1 + (v86 << 6);
                  if (2 * v85 + 2 < v10)
                  {
                    v88 = *(_DWORD *)(v87 + 64);
                    if (*(_DWORD *)v87 < v88
                      || *(_DWORD *)v87 <= v88
                      && ((v112 = *(_DWORD *)(v87 + 4), v113 = *(_DWORD *)(v87 + 68), v112 > v113)
                       || v112 >= v113 && *(_DWORD *)(a1 + (v86 << 6) + 24) < *(_DWORD *)(v87 + 88)))
                    {
                      v87 += 64;
                      v86 = 2 * v85 + 2;
                    }
                  }
                  v89 = a1 + (v85 << 6);
                  if (*(_DWORD *)v87 >= *(_DWORD *)v89)
                  {
                    if (*(_DWORD *)v87 > *(_DWORD *)v89
                      || (v95 = *(_DWORD *)(v87 + 4), v96 = *(_DWORD *)(v89 + 4), v95 <= v96)
                      && (v95 < v96 || *(_DWORD *)(v87 + 24) >= *(_DWORD *)(a1 + (v85 << 6) + 24)))
                    {
                      v90 = *(_OWORD *)v89;
                      *(_OWORD *)&v177[12] = *(_OWORD *)(v89 + 12);
                      *(_OWORD *)v177 = v90;
                      v91 = a1 + (v85 << 6);
                      v92 = (_WORD **)(v91 + 32);
                      if (*(_QWORD *)(v91 + 32) == v91 + 48)
                      {
                        v178 = &v181;
                        v97 = *(unsigned int *)(v91 + 40);
                        v93 = &v180;
                        if ((_DWORD)v97)
                        {
                          v98 = *v92;
                          v99 = 2 * v97;
                          v100 = &v181;
                          do
                          {
                            v101 = *v98++;
                            *(_WORD *)v100 = v101;
                            v100 = (uint64_t *)((char *)v100 + 2);
                            v99 -= 2;
                          }
                          while (v99);
                          v93 = &v180;
                        }
                      }
                      else
                      {
                        v178 = *(void **)(v91 + 32);
                        v94 = *(_DWORD *)(v91 + 44);
                        v93 = (int *)(v91 + 44);
                        v180 = v94;
                        *v92 = v92 + 2;
                      }
                      *v93 = 4;
                      v102 = a1 + (v85 << 6);
                      v179 = *(_DWORD *)(v102 + 40);
                      *(_DWORD *)(v102 + 40) = 0;
                      v182 = *(_DWORD *)(v102 + 56);
                      while (1)
                      {
                        v103 = v87;
                        v104 = *(_OWORD *)v87;
                        *(_OWORD *)(v89 + 12) = *(_OWORD *)(v87 + 12);
                        *(_OWORD *)v89 = v104;
                        v105 = (void **)(v87 + 32);
                        skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v89 + 32), v87 + 32);
                        *(_DWORD *)(v89 + 56) = *(_DWORD *)(v103 + 56);
                        if (v83 < v86)
                          break;
                        v106 = (2 * v86) | 1;
                        v87 = a1 + (v106 << 6);
                        if (2 * v86 + 2 < v10)
                        {
                          v107 = *(_DWORD *)(v87 + 64);
                          if (*(_DWORD *)v87 < v107
                            || *(_DWORD *)v87 <= v107
                            && ((v108 = *(_DWORD *)(v87 + 4), v109 = *(_DWORD *)(v87 + 68), v108 > v109)
                             || v108 >= v109 && *(_DWORD *)(a1 + (v106 << 6) + 24) < *(_DWORD *)(v87 + 88)))
                          {
                            v87 += 64;
                            v106 = 2 * v86 + 2;
                          }
                        }
                        if (*(_DWORD *)v87 < *(_DWORD *)v177)
                          break;
                        v89 = v103;
                        v86 = v106;
                        if (*(_DWORD *)v87 <= *(_DWORD *)v177)
                        {
                          v110 = *(_DWORD *)(v87 + 4);
                          if (v110 > *(_DWORD *)&v177[4])
                            break;
                          v89 = v103;
                          v86 = v106;
                          if (v110 >= *(_DWORD *)&v177[4])
                          {
                            v89 = v103;
                            v86 = v106;
                            if (*(_DWORD *)(v87 + 24) < *(_DWORD *)&v177[24])
                              break;
                          }
                        }
                      }
                      v111 = *(_OWORD *)v177;
                      *(_OWORD *)(v103 + 12) = *(_OWORD *)&v177[12];
                      *(_OWORD *)v103 = v111;
                      skit::SmallVector<skit::GroupId,4u,true>::operator=(v105, (uint64_t)&v178);
                      *(_DWORD *)(v103 + 56) = v182;
                      if (v178 != &v181)
                        free(v178);
                    }
                  }
                }
                v84 = v85 - 1;
              }
              while (v85);
              v114 = (unint64_t)v9 >> 6;
              v115 = a1 + 48;
              v170 = (int *)(a1 + 44);
              do
              {
                *(_OWORD *)&v171[12] = *(_OWORD *)(a1 + 12);
                *(_OWORD *)v171 = *(_OWORD *)a1;
                if (*(_QWORD *)(a1 + 32) == v115)
                {
                  v172 = &v175;
                  v117 = *(unsigned int *)(a1 + 40);
                  v116 = &v174;
                  if ((_DWORD)v117)
                  {
                    v118 = *(__int16 **)(a1 + 32);
                    v119 = 2 * v117;
                    v120 = &v175;
                    do
                    {
                      v121 = *v118++;
                      *(_WORD *)v120 = v121;
                      v120 = (uint64_t *)((char *)v120 + 2);
                      v119 -= 2;
                    }
                    while (v119);
                    v116 = &v174;
                  }
                }
                else
                {
                  v172 = *(void **)(a1 + 32);
                  v174 = *(_DWORD *)(a1 + 44);
                  *(_QWORD *)(a1 + 32) = v115;
                  v116 = v170;
                }
                v122 = 0;
                *v116 = 4;
                v173 = *(_DWORD *)(a1 + 40);
                *(_DWORD *)(a1 + 40) = 0;
                v176 = *(_DWORD *)(a1 + 56);
                v123 = a1;
                do
                {
                  v124 = a1;
                  v125 = v122 + 1;
                  a1 += (v122 + 1) << 6;
                  v126 = 2 * v122;
                  v122 = (2 * v122) | 1;
                  v127 = v126 + 2;
                  if (v127 < v114)
                  {
                    v128 = *(_DWORD *)(a1 + 64);
                    if (*(_DWORD *)a1 < v128
                      || *(_DWORD *)a1 <= v128
                      && ((v130 = *(_DWORD *)(a1 + 4), v131 = *(_DWORD *)(a1 + 68), v130 > v131)
                       || v130 >= v131 && *(_DWORD *)(v124 + (v125 << 6) + 24) < *(_DWORD *)(a1 + 88)))
                    {
                      a1 += 64;
                      v122 = v127;
                    }
                  }
                  v129 = *(_OWORD *)a1;
                  *(_OWORD *)(v124 + 12) = *(_OWORD *)(a1 + 12);
                  *(_OWORD *)v124 = v129;
                  skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v124 + 32), a1 + 32);
                  *(_DWORD *)(v124 + 56) = *(_DWORD *)(a1 + 56);
                }
                while (v122 <= (uint64_t)((unint64_t)(v114 - 2) >> 1));
                v132 = a2 - 16;
                if ((unsigned int *)a1 == a2 - 16)
                {
                  *(_OWORD *)(a1 + 12) = *(_OWORD *)&v171[12];
                  *(_OWORD *)a1 = *(_OWORD *)v171;
                  skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), (uint64_t)&v172);
                  *(_DWORD *)(a1 + 56) = v176;
                }
                else
                {
                  v133 = *(_OWORD *)v132;
                  *(_OWORD *)(a1 + 12) = *(_OWORD *)(a2 - 13);
                  *(_OWORD *)a1 = v133;
                  skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), (uint64_t)(a2 - 8));
                  *(_DWORD *)(a1 + 56) = *(a2 - 2);
                  *(_OWORD *)(a2 - 13) = *(_OWORD *)&v171[12];
                  *(_OWORD *)v132 = *(_OWORD *)v171;
                  skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)a2 - 4, (uint64_t)&v172);
                  *(a2 - 2) = v176;
                  v134 = a1 - v123 + 64;
                  if (v134 >= 65)
                  {
                    v135 = (((unint64_t)v134 >> 6) - 2) >> 1;
                    v136 = v123 + (v135 << 6);
                    if (*(_DWORD *)v136 < *(_DWORD *)a1
                      || *(_DWORD *)v136 <= *(_DWORD *)a1
                      && ((v137 = *(_DWORD *)(v136 + 4), v138 = *(_DWORD *)(a1 + 4), v137 > v138)
                       || v137 >= v138 && *(_DWORD *)(v123 + (v135 << 6) + 24) < *(_DWORD *)(a1 + 24)))
                    {
                      v139 = *(_OWORD *)a1;
                      *(_OWORD *)&v177[12] = *(_OWORD *)(a1 + 12);
                      *(_OWORD *)v177 = v139;
                      if (*(_QWORD *)(a1 + 32) == a1 + 48)
                      {
                        v178 = &v181;
                        v141 = *(unsigned int *)(a1 + 40);
                        v140 = &v180;
                        if ((_DWORD)v141)
                        {
                          v142 = *(__int16 **)(a1 + 32);
                          v143 = 2 * v141;
                          v144 = &v181;
                          do
                          {
                            v145 = *v142++;
                            *(_WORD *)v144 = v145;
                            v144 = (uint64_t *)((char *)v144 + 2);
                            v143 -= 2;
                          }
                          while (v143);
                          v140 = &v180;
                        }
                      }
                      else
                      {
                        v178 = *(void **)(a1 + 32);
                        v140 = (int *)(a1 + 44);
                        v180 = *(_DWORD *)(a1 + 44);
                        *(_QWORD *)(a1 + 32) = a1 + 48;
                      }
                      *v140 = 4;
                      v179 = *(_DWORD *)(a1 + 40);
                      *(_DWORD *)(a1 + 40) = 0;
                      v182 = *(_DWORD *)(a1 + 56);
                      while (1)
                      {
                        v146 = v136;
                        v147 = *(_OWORD *)v136;
                        *(_OWORD *)(a1 + 12) = *(_OWORD *)(v136 + 12);
                        *(_OWORD *)a1 = v147;
                        v148 = (void **)(v136 + 32);
                        skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), v136 + 32);
                        *(_DWORD *)(a1 + 56) = *(_DWORD *)(v146 + 56);
                        if (!v135)
                          break;
                        v135 = (v135 - 1) >> 1;
                        v136 = v123 + (v135 << 6);
                        a1 = v146;
                        if (*(_DWORD *)v136 >= *(_DWORD *)v177)
                        {
                          if (*(_DWORD *)v136 > *(_DWORD *)v177)
                            break;
                          v149 = *(_DWORD *)(v136 + 4);
                          a1 = v146;
                          if (v149 <= *(_DWORD *)&v177[4])
                          {
                            if (v149 < *(_DWORD *)&v177[4])
                              break;
                            a1 = v146;
                            if (*(_DWORD *)(v123 + (v135 << 6) + 24) >= *(_DWORD *)&v177[24])
                              break;
                          }
                        }
                      }
                      v150 = *(_OWORD *)v177;
                      *(_OWORD *)(v146 + 12) = *(_OWORD *)&v177[12];
                      *(_OWORD *)v146 = v150;
                      skit::SmallVector<skit::GroupId,4u,true>::operator=(v148, (uint64_t)&v178);
                      *(_DWORD *)(v146 + 56) = v182;
                      if (v178 != &v181)
                        free(v178);
                    }
                  }
                }
                if (v172 != &v175)
                  free(v172);
                a2 = v132;
                v31 = v114-- <= 2;
                a1 = v123;
              }
              while (!v31);
            }
            return;
          }
          v11 = (unint64_t)v10 >> 1;
          v12 = (unsigned int *)(a1 + ((unint64_t)v10 >> 1 << 6));
          if ((unint64_t)v9 <= 0x2000)
          {
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_(v12, (unsigned int *)a1, a2 - 16);
          }
          else
          {
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_((unsigned int *)a1, v12, a2 - 16);
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_((unsigned int *)(a1 + 64), v12 - 16, a2 - 32);
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_((unsigned int *)(a1 + 128), (unsigned int *)(a1 + 64 + (v11 << 6)), a2 - 48);
            _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_(v12 - 16, v12, (unsigned int *)(a1 + 64 + (v11 << 6)));
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>(a1, (uint64_t)v12);
          }
          --a3;
          if ((a4 & 1) == 0)
          {
            v13 = *(_DWORD *)(a1 - 64);
            if (v13 >= *(_DWORD *)a1)
            {
              if (v13 > *(_DWORD *)a1
                || (v14 = *(_DWORD *)(a1 - 60), v15 = *(_DWORD *)(a1 + 4), v14 <= v15)
                && (v14 < v15 || *(_DWORD *)(a1 - 40) >= *(_DWORD *)(a1 + 24)))
              {
                v37 = *(_OWORD *)a1;
                *(_OWORD *)&v177[12] = *(_OWORD *)(a1 + 12);
                *(_OWORD *)v177 = v37;
                if (*(_QWORD *)(a1 + 32) == a1 + 48)
                {
                  v178 = &v181;
                  v39 = *(unsigned int *)(a1 + 40);
                  v38 = &v180;
                  if ((_DWORD)v39)
                  {
                    v40 = *(__int16 **)(a1 + 32);
                    v41 = 2 * v39;
                    v42 = &v181;
                    do
                    {
                      v43 = *v40++;
                      *(_WORD *)v42 = v43;
                      v42 = (uint64_t *)((char *)v42 + 2);
                      v41 -= 2;
                    }
                    while (v41);
                    v38 = &v180;
                  }
                }
                else
                {
                  v178 = *(void **)(a1 + 32);
                  v38 = (int *)(a1 + 44);
                  v180 = *(_DWORD *)(a1 + 44);
                  *(_QWORD *)(a1 + 32) = a1 + 48;
                }
                *v38 = 4;
                v179 = *(_DWORD *)(a1 + 40);
                *(_DWORD *)(a1 + 40) = 0;
                v182 = *(_DWORD *)(a1 + 56);
                v44 = *(a2 - 16);
                if (*(_DWORD *)v177 < v44)
                {
                  v45 = *(_DWORD *)&v177[4];
                  goto LABEL_76;
                }
                v45 = *(_DWORD *)&v177[4];
                if (*(_DWORD *)v177 > v44)
                {
LABEL_85:
                  v46 = *(_DWORD *)&v177[24];
                  goto LABEL_86;
                }
                v59 = *(a2 - 15);
                if (*(_DWORD *)&v177[4] > v59)
                {
LABEL_76:
                  v46 = *(_DWORD *)&v177[24];
                }
                else
                {
                  if (*(_DWORD *)&v177[4] < v59)
                    goto LABEL_85;
                  v46 = *(_DWORD *)&v177[24];
                  if (*(_DWORD *)&v177[24] >= *(a2 - 10))
                  {
LABEL_86:
                    for (i = (unsigned int *)(a1 + 64); i < a2; i += 16)
                    {
                      if (*(_DWORD *)v177 < *i)
                        break;
                      if (*(_DWORD *)v177 <= *i)
                      {
                        v48 = i[1];
                        if (*(_DWORD *)&v177[4] > v48 || *(_DWORD *)&v177[4] >= v48 && v46 < i[6])
                          break;
                      }
                    }
                    goto LABEL_94;
                  }
                }
                for (i = (unsigned int *)(a1 + 64); *(_DWORD *)v177 >= *i; i += 16)
                {
                  if (*(_DWORD *)v177 <= *i)
                  {
                    v47 = i[1];
                    if (v45 > v47 || v45 >= v47 && v46 < i[6])
                      break;
                  }
                }
LABEL_94:
                j = (unint64_t)a2;
                if (i < a2)
                {
                  for (j = (unint64_t)(a2 - 16); ; j -= 64)
                  {
                    if (*(_DWORD *)v177 >= v44)
                    {
                      if (*(_DWORD *)v177 > v44)
                        break;
                      v50 = *(_DWORD *)(j + 4);
                      if (v45 <= v50 && (v45 < v50 || v46 >= *(_DWORD *)(j + 24)))
                        break;
                    }
                    v51 = *(_DWORD *)(j - 64);
                    v44 = v51;
                  }
                }
                while ((unint64_t)i < j)
                {
                  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)i, j);
                  for (i += 16; *(_DWORD *)v177 >= *i; i += 16)
                  {
                    if (*(_DWORD *)v177 <= *i)
                    {
                      v52 = i[1];
                      if (*(_DWORD *)&v177[4] > v52 || *(_DWORD *)&v177[4] >= v52 && *(_DWORD *)&v177[24] < i[6])
                        break;
                    }
                  }
                  do
                  {
                    do
                    {
                      v53 = *(_DWORD *)(j - 64);
                      j -= 64;
                      v54 = *(_DWORD *)v177 > v53;
                    }
                    while (*(_DWORD *)v177 < v53);
                    if (v54)
                      break;
                    v55 = *(_DWORD *)(j + 4);
                  }
                  while (*(_DWORD *)&v177[4] > v55
                       || *(_DWORD *)&v177[4] >= v55 && *(_DWORD *)&v177[24] < *(_DWORD *)(j + 24));
                }
                v56 = i - 16;
                if (i - 16 != (unsigned int *)a1)
                {
                  v57 = *(_OWORD *)v56;
                  *(_OWORD *)(a1 + 12) = *(_OWORD *)(i - 13);
                  *(_OWORD *)a1 = v57;
                  skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), (uint64_t)(i - 8));
                  *(_DWORD *)(a1 + 56) = *(i - 2);
                }
                v58 = *(_OWORD *)v177;
                *(_OWORD *)(i - 13) = *(_OWORD *)&v177[12];
                *(_OWORD *)v56 = v58;
                skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)i - 4, (uint64_t)&v178);
                *(i - 2) = v182;
                if (v178 != &v181)
                  free(v178);
                goto LABEL_67;
              }
            }
          }
          v16 = *(_OWORD *)a1;
          *(_OWORD *)&v177[12] = *(_OWORD *)(a1 + 12);
          *(_OWORD *)v177 = v16;
          if (*(_QWORD *)(a1 + 32) == a1 + 48)
          {
            v178 = &v181;
            v18 = *(unsigned int *)(a1 + 40);
            v17 = &v180;
            if ((_DWORD)v18)
            {
              v19 = *(__int16 **)(a1 + 32);
              v20 = 2 * v18;
              v21 = &v181;
              do
              {
                v22 = *v19++;
                *(_WORD *)v21 = v22;
                v21 = (uint64_t *)((char *)v21 + 2);
                v20 -= 2;
              }
              while (v20);
              v17 = &v180;
            }
          }
          else
          {
            v178 = *(void **)(a1 + 32);
            v17 = (int *)(a1 + 44);
            v180 = *(_DWORD *)(a1 + 44);
            *(_QWORD *)(a1 + 32) = a1 + 48;
          }
          *v17 = 4;
          v179 = *(_DWORD *)(a1 + 40);
          *(_DWORD *)(a1 + 40) = 0;
          v182 = *(_DWORD *)(a1 + 56);
          for (k = (unsigned int *)(a1 + 64); ; k += 16)
          {
            if (*k >= *(_DWORD *)v177)
            {
              if (*k > *(_DWORD *)v177)
                break;
              v24 = k[1];
              if (v24 <= *(_DWORD *)&v177[4] && (v24 < *(_DWORD *)&v177[4] || k[6] >= *(_DWORD *)&v177[24]))
                break;
            }
          }
          m = a2 - 16;
          if (k - 16 == (unsigned int *)a1)
          {
            for (m = a2 - 16; k < m + 16; m -= 16)
            {
              if (*m < *(_DWORD *)v177)
                goto LABEL_44;
              if (*m <= *(_DWORD *)v177)
              {
                v27 = m[1];
                if (v27 > *(_DWORD *)&v177[4] || v27 >= *(_DWORD *)&v177[4] && m[6] < *(_DWORD *)&v177[24])
                  goto LABEL_44;
              }
            }
            m += 16;
          }
          else
          {
            while (*m >= *(_DWORD *)v177)
            {
              if (*m <= *(_DWORD *)v177)
              {
                v26 = m[1];
                if (v26 > *(_DWORD *)&v177[4] || v26 >= *(_DWORD *)&v177[4] && m[6] < *(_DWORD *)&v177[24])
                  break;
              }
              m -= 16;
            }
          }
LABEL_44:
          i = k;
          if (k < m)
          {
            i = k;
            v28 = (unint64_t)m;
            do
            {
              std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)i, v28);
              for (i += 16; ; i += 16)
              {
                if (*i >= *(_DWORD *)v177)
                {
                  if (*i > *(_DWORD *)v177)
                    break;
                  v29 = i[1];
                  if (v29 <= *(_DWORD *)&v177[4] && (v29 < *(_DWORD *)&v177[4] || i[6] >= *(_DWORD *)&v177[24]))
                    break;
                }
              }
              while (1)
              {
                v30 = *(_DWORD *)(v28 - 64);
                v28 -= 64;
                v31 = v30 > *(_DWORD *)v177;
                if (v30 < *(_DWORD *)v177)
                  break;
                if (!v31)
                {
                  v32 = *(_DWORD *)(v28 + 4);
                  if (v32 > *(_DWORD *)&v177[4]
                    || v32 >= *(_DWORD *)&v177[4] && *(_DWORD *)(v28 + 24) < *(_DWORD *)&v177[24])
                  {
                    break;
                  }
                }
              }
            }
            while ((unint64_t)i < v28);
          }
          v33 = i - 16;
          if (i - 16 != (unsigned int *)a1)
          {
            v34 = *(_OWORD *)v33;
            *(_OWORD *)(a1 + 12) = *(_OWORD *)(i - 13);
            *(_OWORD *)a1 = v34;
            skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), (uint64_t)(i - 8));
            *(_DWORD *)(a1 + 56) = *(i - 2);
          }
          v35 = *(_OWORD *)v177;
          *(_OWORD *)(i - 13) = *(_OWORD *)&v177[12];
          *(_OWORD *)v33 = v35;
          skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)i - 4, (uint64_t)&v178);
          *(i - 2) = v182;
          if (v178 != &v181)
            free(v178);
          if (k < m)
            goto LABEL_66;
          matched = _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEbT1_SM_SG_((unsigned int *)a1, i - 16);
          if (!_ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEbT1_SM_SG_(i, a2))
          {
            if (matched)
              continue;
LABEL_66:
            _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Lb0EEEvT1_SM_SG_NS_15iterator_traitsISM_E15difference_typeEb(a1, i - 16, a3, a4 & 1);
LABEL_67:
            a4 = 0;
            continue;
          }
          a2 = i - 16;
          if (matched)
            return;
          goto LABEL_2;
        }
        if ((a4 & 1) != 0)
        {
          if ((unsigned int *)a1 != a2)
          {
            v61 = a1 + 64;
            if ((unsigned int *)(a1 + 64) != a2)
            {
              v62 = 0;
              v63 = a1;
              do
              {
                v64 = (unsigned int *)v63;
                v63 = v61;
                v65 = v64[16];
                if (v65 < *v64
                  || v65 <= *v64
                  && ((v66 = *(_DWORD *)(v63 + 4), v67 = v64[1], v66 > v67)
                   || v66 >= v67 && *(_DWORD *)(v63 + 24) < v64[6]))
                {
                  v68 = *(_OWORD *)v63;
                  *(_OWORD *)&v177[12] = *(_OWORD *)(v63 + 12);
                  *(_OWORD *)v177 = v68;
                  if (*(_QWORD *)(v63 + 32) == v63 + 48)
                  {
                    v178 = &v181;
                    v70 = *(unsigned int *)(v63 + 40);
                    v69 = &v180;
                    if ((_DWORD)v70)
                    {
                      v71 = *(__int16 **)(v63 + 32);
                      v72 = 2 * v70;
                      v73 = &v181;
                      do
                      {
                        v74 = *v71++;
                        *(_WORD *)v73 = v74;
                        v73 = (uint64_t *)((char *)v73 + 2);
                        v72 -= 2;
                      }
                      while (v72);
                      v69 = &v180;
                    }
                  }
                  else
                  {
                    v178 = *(void **)(v63 + 32);
                    v69 = (int *)(v63 + 44);
                    v180 = *(_DWORD *)(v63 + 44);
                    *(_QWORD *)(v63 + 32) = v63 + 48;
                  }
                  v75 = a1;
                  *v69 = 4;
                  v179 = *(_DWORD *)(v63 + 40);
                  *(_DWORD *)(v63 + 40) = 0;
                  v182 = *(_DWORD *)(v63 + 56);
                  for (n = v62; ; n -= 64)
                  {
                    v77 = v75 + n;
                    *(_OWORD *)(v77 + 64) = *(_OWORD *)(v75 + n);
                    *(_OWORD *)(v77 + 76) = *(_OWORD *)(v75 + n + 12);
                    v78 = (void **)(v75 + n + 32);
                    skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v75 + n + 96), (uint64_t)v78);
                    *(_DWORD *)(v77 + 120) = *(_DWORD *)(v77 + 56);
                    if (!n)
                    {
                      v81 = v75;
                      goto LABEL_156;
                    }
                    v79 = *(_DWORD *)(v77 - 64);
                    if (*(_DWORD *)v177 >= v79)
                    {
                      if (*(_DWORD *)v177 > v79)
                        break;
                      v80 = *(_DWORD *)(v75 + n - 60);
                      if (*(_DWORD *)&v177[4] <= v80
                        && (*(_DWORD *)&v177[4] < v80 || *(_DWORD *)&v177[24] >= *(_DWORD *)(v75 + n - 40)))
                      {
                        break;
                      }
                    }
                  }
                  v81 = v75 + n;
                  v78 = (void **)(v81 + 32);
LABEL_156:
                  v82 = *(_OWORD *)v177;
                  *(_OWORD *)(v81 + 12) = *(_OWORD *)&v177[12];
                  *(_OWORD *)v81 = v82;
                  skit::SmallVector<skit::GroupId,4u,true>::operator=(v78, (uint64_t)&v178);
                  *(_DWORD *)(v81 + 56) = v182;
                  if (v178 != &v181)
                    free(v178);
                  a1 = v75;
                }
                v61 = v63 + 64;
                v62 += 64;
              }
              while ((unsigned int *)(v63 + 64) != a2);
            }
          }
        }
        else if ((unsigned int *)a1 != a2)
        {
          for (ii = a1 + 64; (unsigned int *)(a1 + 64) != a2; ii = a1 + 64)
          {
            v154 = a1;
            a1 = ii;
            v155 = *(_DWORD *)(v154 + 64);
            if (v155 >= *(_DWORD *)v154)
            {
              if (v155 > *(_DWORD *)v154)
                continue;
              v156 = *(_DWORD *)(a1 + 4);
              v157 = *(_DWORD *)(v154 + 4);
              if (v156 <= v157 && (v156 < v157 || *(_DWORD *)(a1 + 24) >= *(_DWORD *)(v154 + 24)))
                continue;
            }
            v158 = *(_OWORD *)a1;
            *(_OWORD *)&v177[12] = *(_OWORD *)(a1 + 12);
            *(_OWORD *)v177 = v158;
            if (*(_QWORD *)(a1 + 32) == a1 + 48)
            {
              v178 = &v181;
              v160 = *(unsigned int *)(a1 + 40);
              v159 = &v180;
              if ((_DWORD)v160)
              {
                v161 = *(__int16 **)(a1 + 32);
                v162 = 2 * v160;
                v163 = &v181;
                do
                {
                  v164 = *v161++;
                  *(_WORD *)v163 = v164;
                  v163 = (uint64_t *)((char *)v163 + 2);
                  v162 -= 2;
                }
                while (v162);
                v159 = &v180;
              }
            }
            else
            {
              v178 = *(void **)(a1 + 32);
              v159 = (int *)(a1 + 44);
              v180 = *(_DWORD *)(a1 + 44);
              *(_QWORD *)(a1 + 32) = a1 + 48;
            }
            *v159 = 4;
            v179 = *(_DWORD *)(a1 + 40);
            *(_DWORD *)(a1 + 40) = 0;
            v182 = *(_DWORD *)(a1 + 56);
            do
            {
              do
              {
                v165 = v154;
                *(_OWORD *)(v154 + 64) = *(_OWORD *)v154;
                *(_OWORD *)(v154 + 76) = *(_OWORD *)(v154 + 12);
                skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v154 + 96), v154 + 32);
                v166 = *(_DWORD *)(v154 - 64);
                v154 -= 64;
                *(_DWORD *)(v154 + 184) = *(_DWORD *)(v154 + 120);
                v167 = *(_DWORD *)v177 > v166;
              }
              while (*(_DWORD *)v177 < v166);
              if (v167)
                break;
              v168 = *(_DWORD *)(v165 - 60);
            }
            while (*(_DWORD *)&v177[4] > v168
                 || *(_DWORD *)&v177[4] >= v168 && *(_DWORD *)&v177[24] < *(_DWORD *)(v165 - 40));
            v169 = *(_OWORD *)v177;
            *(_OWORD *)(v165 + 12) = *(_OWORD *)&v177[12];
            *(_OWORD *)v165 = v169;
            skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v165 + 32), (uint64_t)&v178);
            *(_DWORD *)(v165 + 56) = v182;
            if (v178 != &v181)
              free(v178);
          }
        }
        return;
    }
  }
}

void std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>(uint64_t a1, uint64_t a2)
{
  void **v4;
  __int16 *v5;
  __int16 *v6;
  int *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int128 v13;
  _BYTE v14[28];
  void *v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)v14 = *(_OWORD *)a1;
  *(_OWORD *)&v14[12] = *(_OWORD *)(a1 + 12);
  v6 = *(__int16 **)(a1 + 32);
  v4 = (void **)(a1 + 32);
  v5 = v6;
  if (v6 == (__int16 *)(a1 + 48))
  {
    v9 = &v18;
    v15 = &v18;
    v8 = *(unsigned int *)(a1 + 40);
    if ((_DWORD)v8)
    {
      v10 = 2 * v8;
      do
      {
        v11 = *v5++;
        *(_WORD *)v9 = v11;
        v9 = (uint64_t *)((char *)v9 + 2);
        v10 -= 2;
      }
      while (v10);
    }
    v7 = &v17;
  }
  else
  {
    v15 = v5;
    v7 = (int *)(a1 + 44);
    v17 = *(_DWORD *)(a1 + 44);
    *(_QWORD *)(a1 + 32) = a1 + 48;
    LODWORD(v8) = *(_DWORD *)(a1 + 40);
  }
  *v7 = 4;
  *(_DWORD *)(a1 + 40) = 0;
  v12 = *(_DWORD *)(a1 + 56);
  v16 = v8;
  v19 = v12;
  v13 = *(_OWORD *)(a2 + 12);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 12) = v13;
  skit::SmallVector<skit::GroupId,4u,true>::operator=(v4, a2 + 32);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_OWORD *)a2 = *(_OWORD *)v14;
  *(_OWORD *)(a2 + 12) = *(_OWORD *)&v14[12];
  skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a2 + 32), (uint64_t)&v15);
  *(_DWORD *)(a2 + 56) = v19;
  if (v15 != &v18)
    free(v15);
}

void _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_(unsigned int *a1, unsigned int *a2, unsigned int *a3)
{
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  _BOOL4 v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;

  v5 = a1;
  v6 = *a2;
  if (*a2 < *a1)
    goto LABEL_4;
  if (v6 > *a1)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v7 = a2[1];
  v8 = a1[1];
  if (v7 <= v8)
  {
    if (v7 >= v8)
    {
      v9 = a2[6] < a1[6];
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_4:
  v9 = 1;
LABEL_7:
  if (*a3 < v6)
    goto LABEL_10;
  if (*a3 > v6)
    goto LABEL_13;
  v10 = a3[1];
  v11 = a2[1];
  if (v10 > v11)
  {
LABEL_10:
    v12 = 1;
    if (!v9)
      goto LABEL_24;
LABEL_14:
    if (!v12)
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a1, (uint64_t)a2);
      if (*a3 >= *a2)
      {
        if (*a3 > *a2)
          return;
        v13 = a3[1];
        v14 = a2[1];
        if (v13 <= v14 && (v13 < v14 || a3[6] >= a2[6]))
          return;
      }
      a1 = a2;
    }
    v15 = (uint64_t)a3;
LABEL_31:
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a1, v15);
    return;
  }
  if (v10 >= v11)
  {
    v12 = a3[6] < a2[6];
    if (v9)
      goto LABEL_14;
  }
  else
  {
LABEL_13:
    v12 = 0;
    if (v9)
      goto LABEL_14;
  }
LABEL_24:
  if (v12)
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a2, (uint64_t)a3);
    if (*a2 < *v5 || *a2 <= *v5 && ((v16 = a2[1], v17 = v5[1], v16 > v17) || v16 >= v17 && a2[6] < v5[6]))
    {
      a1 = v5;
      v15 = (uint64_t)a2;
      goto LABEL_31;
    }
  }
}

void _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEvT1_SM_SM_SM_SG_(unsigned int *a1, unsigned int *a2, unsigned int *a3, unsigned int *a4)
{
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;

  _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_(a1, a2, a3);
  if (*a4 < *a3 || *a4 <= *a3 && ((v8 = a4[1], v9 = a3[1], v8 > v9) || v8 >= v9 && a4[6] < a3[6]))
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a3, (uint64_t)a4);
    if (*a3 < *a2 || *a3 <= *a2 && ((v10 = a3[1], v11 = a2[1], v10 > v11) || v10 >= v11 && a3[6] < a2[6]))
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a2, (uint64_t)a3);
      if (*a2 < *a1 || *a2 <= *a1 && ((v12 = a2[1], v13 = a1[1], v12 > v13) || v12 >= v13 && a2[6] < a1[6]))
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a1, (uint64_t)a2);
    }
  }
}

void _ZNSt3__124__sort5_maybe_branchlessB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Li0EEEvT1_SM_SM_SM_SM_SG_(unsigned int *a1, unsigned int *a2, unsigned int *a3, unsigned int *a4, unsigned int *a5)
{
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;

  _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEvT1_SM_SM_SM_SG_(a1, a2, a3, a4);
  if (*a5 < *a4 || *a5 <= *a4 && ((v16 = a5[1], v17 = a4[1], v16 > v17) || v16 >= v17 && a5[6] < a4[6]))
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a4, (uint64_t)a5);
    if (*a4 < *a3 || *a4 <= *a3 && ((v10 = a4[1], v11 = a3[1], v10 > v11) || v10 >= v11 && a4[6] < a3[6]))
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a3, (uint64_t)a4);
      if (*a3 < *a2 || *a3 <= *a2 && ((v12 = a3[1], v13 = a2[1], v12 > v13) || v12 >= v13 && a3[6] < a2[6]))
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a2, (uint64_t)a3);
        if (*a2 < *a1 || *a2 <= *a1 && ((v14 = a2[1], v15 = a1[1], v14 > v15) || v14 >= v15 && a2[6] < a1[6]))
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a1, (uint64_t)a2);
      }
    }
  }
}

BOOL _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEbT1_SM_SG_(unsigned int *a1, unsigned int *a2)
{
  uint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  unsigned int v7;
  unsigned int *v8;
  unsigned int *v9;
  uint64_t v10;
  int v11;
  unsigned int *v12;
  unsigned int *v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t *v18;
  __int16 v19;
  unsigned int v20;
  uint64_t i;
  char *v22;
  void **v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  char *v27;
  unsigned int v28;
  unsigned int v29;
  _BYTE v30[28];
  void *v31;
  int v32;
  unsigned int v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = ((char *)a2 - (char *)a1) >> 6;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = (uint64_t)(a2 - 16);
      v7 = *(a2 - 16);
      if (v7 < *a1 || v7 <= *a1 && ((v28 = *(a2 - 15), v29 = a1[1], v28 > v29) || v28 >= v29 && *(a2 - 10) < a1[6]))
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a1, v6);
        return 1;
      }
      return result;
    case 3:
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_(a1, a1 + 16, a2 - 16);
      return 1;
    case 4:
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEvT1_SM_SM_SM_SG_(a1, a1 + 16, a1 + 32, a2 - 16);
      return 1;
    case 5:
      _ZNSt3__124__sort5_maybe_branchlessB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Li0EEEvT1_SM_SM_SM_SM_SG_(a1, a1 + 16, a1 + 32, a1 + 48, a2 - 16);
      return 1;
    default:
      v8 = a1 + 32;
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_(a1, a1 + 16, a1 + 32);
      v9 = a1 + 48;
      if (a1 + 48 == a2)
        return 1;
      v10 = 0;
      v11 = 0;
      break;
  }
  while (1)
  {
    if (*v9 < *v8 || *v9 <= *v8 && ((v15 = v9[1], v16 = v8[1], v15 > v16) || v15 >= v16 && v9[6] < v8[6]))
    {
      *(_OWORD *)v30 = *(_OWORD *)v9;
      *(_OWORD *)&v30[12] = *(_OWORD *)(v9 + 3);
      v12 = (unsigned int *)*((_QWORD *)v9 + 4);
      if (v12 == v9 + 12)
      {
        v31 = &v34;
        v14 = v9[10];
        if ((_DWORD)v14)
        {
          v17 = 2 * v14;
          v18 = &v34;
          do
          {
            v19 = *(_WORD *)v12;
            v12 = (unsigned int *)((char *)v12 + 2);
            *(_WORD *)v18 = v19;
            v18 = (uint64_t *)((char *)v18 + 2);
            v17 -= 2;
          }
          while (v17);
        }
        v13 = &v33;
      }
      else
      {
        v31 = (void *)*((_QWORD *)v9 + 4);
        v13 = v9 + 11;
        v33 = v9[11];
        *((_QWORD *)v9 + 4) = v9 + 12;
        LODWORD(v14) = v9[10];
      }
      *v13 = 4;
      v9[10] = 0;
      v20 = v9[14];
      v32 = v14;
      v35 = v20;
      for (i = v10; ; i -= 64)
      {
        v22 = (char *)a1 + i;
        *((_OWORD *)v22 + 12) = *(_OWORD *)((char *)a1 + i + 128);
        *(_OWORD *)(v22 + 204) = *(_OWORD *)((char *)a1 + i + 140);
        v23 = (void **)((char *)a1 + i + 160);
        skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)((char *)a1 + i + 224), (uint64_t)v23);
        *((_DWORD *)v22 + 62) = *((_DWORD *)v22 + 46);
        if (i == -128)
        {
          v26 = (uint64_t)a1;
          goto LABEL_28;
        }
        v24 = *((_DWORD *)v22 + 16);
        if (*(_DWORD *)v30 >= v24)
        {
          if (*(_DWORD *)v30 > v24)
            break;
          v25 = *(unsigned int *)((char *)a1 + i + 68);
          if (*(_DWORD *)&v30[4] <= v25
            && (*(_DWORD *)&v30[4] < v25 || *(_DWORD *)&v30[24] >= *(unsigned int *)((char *)a1 + i + 88)))
          {
            break;
          }
        }
      }
      v27 = (char *)a1 + i;
      v26 = (uint64_t)a1 + i + 128;
      v23 = (void **)(v27 + 160);
LABEL_28:
      *(_OWORD *)v26 = *(_OWORD *)v30;
      *(_OWORD *)(v26 + 12) = *(_OWORD *)&v30[12];
      skit::SmallVector<skit::GroupId,4u,true>::operator=(v23, (uint64_t)&v31);
      *(_DWORD *)(v26 + 56) = v35;
      if (v31 != &v34)
        free(v31);
      if (++v11 == 8)
        return v9 + 16 == a2;
    }
    v8 = v9;
    v10 += 64;
    v9 += 16;
    if (v9 == a2)
      return 1;
  }
}

BOOL _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_118merge_prefix_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEbT1_SM_SG_(unsigned int *a1, unsigned int *a2)
{
  uint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  unsigned int v7;
  unsigned int *v8;
  unsigned int *v9;
  uint64_t v10;
  int v11;
  unsigned int *v12;
  unsigned int *v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t *v18;
  __int16 v19;
  unsigned int v20;
  uint64_t i;
  char *v22;
  void **v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  char *v27;
  unsigned int v28;
  unsigned int v29;
  _BYTE v30[28];
  void *v31;
  int v32;
  unsigned int v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = ((char *)a2 - (char *)a1) >> 6;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = (uint64_t)(a2 - 16);
      v7 = *(a2 - 16);
      if (v7 < *a1 || v7 <= *a1 && ((v28 = *(a2 - 15), v29 = a1[1], v28 > v29) || v28 >= v29 && *(a2 - 10) < a1[6]))
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a1, v6);
        return 1;
      }
      return result;
    case 3:
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_(a1, a1 + 16, a2 - 16);
      return 1;
    case 4:
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEvT1_SM_SM_SM_SG_(a1, a1 + 16, a1 + 32, a2 - 16);
      return 1;
    case 5:
      _ZNSt3__124__sort5_maybe_branchlessB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Li0EEEvT1_SM_SM_SM_SM_SG_(a1, a1 + 16, a1 + 32, a1 + 48, a2 - 16);
      return 1;
    default:
      v8 = a1 + 32;
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_(a1, a1 + 16, a1 + 32);
      v9 = a1 + 48;
      if (a1 + 48 == a2)
        return 1;
      v10 = 0;
      v11 = 0;
      break;
  }
  while (1)
  {
    if (*v9 < *v8 || *v9 <= *v8 && ((v15 = v9[1], v16 = v8[1], v15 > v16) || v15 >= v16 && v9[6] < v8[6]))
    {
      *(_OWORD *)v30 = *(_OWORD *)v9;
      *(_OWORD *)&v30[12] = *(_OWORD *)(v9 + 3);
      v12 = (unsigned int *)*((_QWORD *)v9 + 4);
      if (v12 == v9 + 12)
      {
        v31 = &v34;
        v14 = v9[10];
        if ((_DWORD)v14)
        {
          v17 = 2 * v14;
          v18 = &v34;
          do
          {
            v19 = *(_WORD *)v12;
            v12 = (unsigned int *)((char *)v12 + 2);
            *(_WORD *)v18 = v19;
            v18 = (uint64_t *)((char *)v18 + 2);
            v17 -= 2;
          }
          while (v17);
        }
        v13 = &v33;
      }
      else
      {
        v31 = (void *)*((_QWORD *)v9 + 4);
        v13 = v9 + 11;
        v33 = v9[11];
        *((_QWORD *)v9 + 4) = v9 + 12;
        LODWORD(v14) = v9[10];
      }
      *v13 = 4;
      v9[10] = 0;
      v20 = v9[14];
      v32 = v14;
      v35 = v20;
      for (i = v10; ; i -= 64)
      {
        v22 = (char *)a1 + i;
        *((_OWORD *)v22 + 12) = *(_OWORD *)((char *)a1 + i + 128);
        *(_OWORD *)(v22 + 204) = *(_OWORD *)((char *)a1 + i + 140);
        v23 = (void **)((char *)a1 + i + 160);
        skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)((char *)a1 + i + 224), (uint64_t)v23);
        *((_DWORD *)v22 + 62) = *((_DWORD *)v22 + 46);
        if (i == -128)
        {
          v26 = (uint64_t)a1;
          goto LABEL_28;
        }
        v24 = *((_DWORD *)v22 + 16);
        if (*(_DWORD *)v30 >= v24)
        {
          if (*(_DWORD *)v30 > v24)
            break;
          v25 = *(unsigned int *)((char *)a1 + i + 68);
          if (*(_DWORD *)&v30[4] <= v25
            && (*(_DWORD *)&v30[4] < v25 || *(_DWORD *)&v30[24] >= *(unsigned int *)((char *)a1 + i + 88)))
          {
            break;
          }
        }
      }
      v27 = (char *)a1 + i;
      v26 = (uint64_t)a1 + i + 128;
      v23 = (void **)(v27 + 160);
LABEL_28:
      *(_OWORD *)v26 = *(_OWORD *)v30;
      *(_OWORD *)(v26 + 12) = *(_OWORD *)&v30[12];
      skit::SmallVector<skit::GroupId,4u,true>::operator=(v23, (uint64_t)&v31);
      *(_DWORD *)(v26 + 56) = v35;
      if (v31 != &v34)
        free(v31);
      if (++v11 == 8)
        return v9 + 16 == a2;
    }
    v8 = v9;
    v10 += 64;
    v9 += 16;
    if (v9 == a2)
      return 1;
  }
}

void std::basic_string<char16_t>::reserve(std::basic_string<char16_t> *this, std::basic_string<char16_t>::size_type __requested_capacity)
{
  unint64_t v3;
  std::basic_string<char16_t>::size_type v4;
  std::basic_string<char16_t>::size_type v5;
  unint64_t v6;
  unint64_t v7;
  std::basic_string<char16_t>::size_type v8;
  std::basic_string<char16_t>::size_type v9;
  uint64_t v10;
  uint64_t v11;
  std::basic_string<char16_t> *v12;
  int v13;
  void *v14;
  uint64_t v15;
  std::basic_string<char16_t>::size_type size;
  int v17;
  BOOL v18;
  std::basic_string<char16_t>::size_type v19;

  if (__requested_capacity >= 0x7FFFFFFFFFFFFFF8)
    std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
  LODWORD(v3) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v3 & 0x80000000) == 0)
  {
    if (__requested_capacity <= 0xA)
      return;
    v4 = HIBYTE(this->__r_.__value_.__r.__words[2]);
    if (v4 <= __requested_capacity)
      v5 = __requested_capacity;
    else
      v5 = HIBYTE(this->__r_.__value_.__r.__words[2]);
    if ((v5 | 3) != 0xB)
    {
      v11 = (v5 | 3) + 1;
      goto LABEL_24;
    }
    v6 = (v5 & 0xFFFFFFFFFFFFFFFCLL) + 4;
LABEL_20:
    v11 = v6 + 1;
    if (v6 < 0xB)
    {
      v12 = (std::basic_string<char16_t> *)this->__r_.__value_.__r.__words[0];
      v13 = 1;
      v14 = this;
      if ((v3 & 0x80) != 0)
        goto LABEL_28;
      goto LABEL_26;
    }
LABEL_24:
    v14 = std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v11);
    v11 = v15;
    LODWORD(v3) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
    if ((v3 & 0x80000000) != 0)
    {
      LOBYTE(v13) = 0;
      v12 = (std::basic_string<char16_t> *)this->__r_.__value_.__r.__words[0];
LABEL_28:
      size = this->__r_.__value_.__l.__size_;
      v17 = 1;
LABEL_29:
      v18 = __CFADD__(size, 1);
      v19 = size + 1;
      if (v18)
      {
        if (v17)
          goto LABEL_35;
      }
      else
      {
        memmove(v14, v12, 2 * v19);
        if (v17)
        {
LABEL_35:
          operator delete(v12);
          if ((v13 & 1) == 0)
            goto LABEL_36;
          goto LABEL_33;
        }
      }
      if ((v13 & 1) == 0)
      {
LABEL_36:
        this->__r_.__value_.__l.__size_ = v4;
        this->__r_.__value_.__r.__words[2] = v11 | 0x8000000000000000;
        this->__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)v14;
        return;
      }
LABEL_33:
      *((_BYTE *)&this->__r_.__value_.__s + 23) = v4 & 0x7F;
      return;
    }
    v13 = 0;
    v12 = this;
LABEL_26:
    size = v3;
    v17 = v13;
    goto LABEL_29;
  }
  v7 = this->__r_.__value_.__r.__words[2];
  v8 = (v7 & 0x7FFFFFFFFFFFFFFFLL) - 1;
  if (v8 < __requested_capacity)
  {
    v4 = this->__r_.__value_.__l.__size_;
    if (v4 <= __requested_capacity)
      v9 = __requested_capacity;
    else
      v9 = this->__r_.__value_.__l.__size_;
    v10 = (v9 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((v9 | 3) != 0xB)
      v10 = v9 | 3;
    v6 = v9 >= 0xB ? v10 : 10;
    if (v6 != v8)
    {
      v3 = HIBYTE(v7);
      goto LABEL_20;
    }
  }
}

void sub_1CB750A80(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

std::basic_string<char16_t> *__cdecl std::basic_string<char16_t>::append(std::basic_string<char16_t> *this, std::basic_string<char16_t>::size_type __n, std::basic_string<char16_t>::value_type __c)
{
  std::basic_string<char16_t>::size_type v3;
  std::basic_string<char16_t>::size_type v4;
  unint64_t v8;
  std::basic_string<char16_t>::size_type size;
  std::basic_string<char16_t>::size_type v10;
  unint64_t v11;
  std::basic_string<char16_t> *v12;
  std::basic_string<char16_t>::value_type *v13;
  std::basic_string<char16_t>::size_type v14;
  std::basic_string<char16_t>::size_type v15;

  if (__n)
  {
    LODWORD(v8) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
    if ((v8 & 0x80000000) != 0)
    {
      size = this->__r_.__value_.__l.__size_;
      v11 = this->__r_.__value_.__r.__words[2];
      v10 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
      v8 = HIBYTE(v11);
    }
    else
    {
      size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      v10 = 10;
    }
    if (v10 - size < __n)
    {
      std::basic_string<char16_t>::__grow_by(this, v10, __n - v10 + size, size, size, v3, v4);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v8) = *((_BYTE *)&this->__r_.__value_.__s + 23);
    }
    v12 = this;
    if ((v8 & 0x80) != 0)
      v12 = (std::basic_string<char16_t> *)this->__r_.__value_.__r.__words[0];
    v13 = (std::basic_string<char16_t>::value_type *)((char *)v12 + 2 * size);
    v14 = __n;
    do
    {
      *v13++ = __c;
      --v14;
    }
    while (v14);
    v15 = size + __n;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
      this->__r_.__value_.__l.__size_ = v15;
    else
      *((_BYTE *)&this->__r_.__value_.__s + 23) = v15 & 0x7F;
    v12->__r_.__value_.__s.__data_[v15] = 0;
  }
  return this;
}

size_t skit::SmallVector<skit::internal::FieldSpanMatcherImpl::MapToken,128u,true>::_reserve_more(uint64_t a1, unsigned int a2)
{
  _DWORD *v3;
  _DWORD *v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  int v9;
  size_t result;
  std::bad_alloc *exception;
  std::bad_alloc *v12;

  v3 = malloc_type_malloc(4 * a2, 0x100004052888210uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v12 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v12, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
  }
  v4 = v3;
  v5 = *(int **)a1;
  v6 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v6)
  {
    v7 = 4 * v6;
    v8 = v4;
    do
    {
      v9 = *v5++;
      *v8++ = v9;
      v7 -= 4;
    }
    while (v7);
    v5 = *(int **)a1;
  }
  if (v5 != (int *)(a1 + 16))
    free(v5);
  *(_QWORD *)a1 = v4;
  result = malloc_size(v4);
  *(_DWORD *)(a1 + 12) = result >> 2;
  return result;
}

size_t skit::SmallVector<skit::internal::FieldSpanMatcherImpl::MapToken,128u,true>::emplace_back<unsigned short &,unsigned short &>(size_t result, _WORD *a2, __int16 *a3)
{
  size_t v5;
  unsigned int v6;
  _WORD *v7;
  __int16 v8;

  v5 = result;
  v6 = *(_DWORD *)(result + 8);
  if (v6 == *(_DWORD *)(result + 12))
  {
    result = skit::SmallVector<skit::internal::FieldSpanMatcherImpl::MapToken,128u,true>::_reserve_more(result, v6 + (v6 >> 1) + 1);
    v6 = *(_DWORD *)(v5 + 8);
  }
  v7 = (_WORD *)(*(_QWORD *)v5 + 4 * v6);
  v8 = *a3;
  *v7 = *a2;
  v7[1] = v8;
  *(_DWORD *)(v5 + 8) = v6 + 1;
  return result;
}

void skit::internal::FieldSpanMatcherImpl::combine_alias_matches(uint64_t a1, uint64_t a2, uint64_t *a3, int a4, uint64_t a5, uint64_t *a6)
{
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;

  if (!a4)
    skit::Alias::match((uint64_t *)(a1 + 640), a5, a3);
  v9 = *(_DWORD *)(a5 + 8);
  v10 = *((_DWORD *)a6 + 2) + v9;
  if (v10)
  {
    if (*(_DWORD *)(a2 + 12) < v10)
    {
      skit::SmallVector<skit::AliasMatch const*,8u,false>::_reserve_more(a2, v10);
      v9 = *(_DWORD *)(a5 + 8);
    }
    if (v9)
    {
      v11 = *(_QWORD *)a5;
      v12 = v9;
      v13 = *(_DWORD *)(a2 + 8);
      v14 = 40 * v12;
      do
      {
        if (v13 == *(_DWORD *)(a2 + 12))
        {
          skit::SmallVector<skit::AliasMatch const*,8u,false>::_reserve_more(a2, v13 + (v13 >> 1) + 1);
          v13 = *(_DWORD *)(a2 + 8);
        }
        *(_QWORD *)(*(_QWORD *)a2 + 8 * v13++) = v11;
        *(_DWORD *)(a2 + 8) = v13;
        v11 += 40;
        v14 -= 40;
      }
      while (v14);
    }
    v15 = *((unsigned int *)a6 + 2);
    v16 = *(_DWORD *)(a2 + 8);
    if ((_DWORD)v15)
    {
      v17 = *a6;
      v18 = 40 * v15;
      do
      {
        if (v16 == *(_DWORD *)(a2 + 12))
        {
          skit::SmallVector<skit::AliasMatch const*,8u,false>::_reserve_more(a2, v16 + (v16 >> 1) + 1);
          v16 = *(_DWORD *)(a2 + 8);
        }
        *(_QWORD *)(*(_QWORD *)a2 + 8 * v16++) = v17;
        *(_DWORD *)(a2 + 8) = v16;
        v17 += 40;
        v18 -= 40;
      }
      while (v18);
    }
    v19 = 126 - 2 * __clz(v16);
    if (v16)
      v20 = v19;
    else
      v20 = 0;
  }
}

size_t skit::SmallVector<skit::AliasMatch const*,8u,false>::_reserve_more(uint64_t a1, unsigned int a2)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  size_t result;
  std::bad_alloc *exception;
  std::bad_alloc *v12;

  v3 = malloc_type_malloc(8 * a2, 0x6004044C4A2DFuLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v12 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v12, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
  }
  v4 = v3;
  v5 = *(uint64_t **)a1;
  v6 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v6)
  {
    v7 = 8 * v6;
    v8 = v4;
    do
    {
      v9 = *v5++;
      *v8++ = v9;
      v7 -= 8;
    }
    while (v7);
    v5 = *(uint64_t **)a1;
  }
  if (v5 != (uint64_t *)(a1 + 16))
    free(v5);
  *(_QWORD *)a1 = v4;
  result = malloc_size(v4);
  *(_DWORD *)(a1 + 12) = result >> 3;
  return result;
}

unint64_t std::__introsort<std::_ClassicAlgPolicy,skit::internal::`anonymous namespace'::AliasMatchLess &,skit::AliasMatch const**,false>(unint64_t result, uint64_t *a2, uint64_t a3, char a4)
{
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *i;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t *j;
  uint64_t v20;
  unsigned int v21;
  uint64_t *v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t *v32;
  unsigned int v33;
  uint64_t v34;
  unsigned int v35;
  BOOL v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t *v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  unsigned int v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  unsigned int v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  unsigned int v65;
  unsigned int v66;
  uint64_t v67;
  unsigned int v68;
  uint64_t v69;
  unsigned int v70;
  uint64_t *v71;
  BOOL v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  unsigned int v79;
  unsigned int v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  unsigned int v84;
  int64_t v85;
  int64_t v86;
  int64_t v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  unsigned int v91;
  uint64_t v92;
  uint64_t v93;
  unsigned int v94;
  unsigned int v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unsigned int v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unsigned int v111;
  uint64_t v112;
  unint64_t v113;
  unint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  unsigned int v117;
  unsigned int v118;
  unint64_t v119;
  uint64_t v120;
  unsigned int v121;
  uint64_t *v123;
  uint64_t v124;
  uint64_t v125;
  unsigned int v126;
  unsigned int v127;
  uint64_t *v128;
  uint64_t v129;
  unsigned int v130;

  v7 = (uint64_t *)result;
LABEL_2:
  v8 = a2 - 1;
  i = v7;
  while (2)
  {
    v7 = i;
    v10 = (char *)a2 - (char *)i;
    v11 = a2 - i;
    switch(v11)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v52 = *v8;
        v53 = *i;
        v54 = *(_DWORD *)(*v8 + 24);
        v55 = *(_DWORD *)(*i + 24);
        if (v54 < v55 || v54 <= v55 && *(_DWORD *)(v52 + 28) > *(_DWORD *)(v53 + 28))
        {
          *i = v52;
          *v8 = v53;
        }
        return result;
      case 3uLL:
      case 4uLL:
      case 5uLL:
        v56 = i + 1;
        v57 = i + 2;
        v58 = i + 3;
        v59 = *v8;
        v60 = i[3];
        v61 = *(_DWORD *)(*v8 + 24);
        v62 = *(_DWORD *)(v60 + 24);
        if (v61 < v62 || v61 <= v62 && *(_DWORD *)(v59 + 28) > *(_DWORD *)(v60 + 28))
        {
          *v58 = v59;
          *v8 = v60;
          v63 = *v58;
          v64 = *v57;
          v65 = *(_DWORD *)(*v58 + 24);
          v66 = *(_DWORD *)(*v57 + 24);
          if (v65 < v66 || v65 <= v66 && *(_DWORD *)(v63 + 28) > *(_DWORD *)(v64 + 28))
          {
            *v57 = v63;
            *v58 = v64;
            v67 = *v56;
            v68 = *(_DWORD *)(*v56 + 24);
            if (v65 < v68 || v65 <= v68 && *(_DWORD *)(v63 + 28) > *(_DWORD *)(v67 + 28))
            {
              i[1] = v63;
              i[2] = v67;
              v69 = *i;
              v70 = *(_DWORD *)(*i + 24);
              if (v65 < v70 || v65 <= v70 && *(_DWORD *)(v63 + 28) > *(_DWORD *)(v69 + 28))
              {
                *i = v63;
                i[1] = v69;
              }
            }
          }
        }
        return result;
      default:
        if (v10 <= 191)
        {
          v71 = i + 1;
          v73 = i == a2 || v71 == a2;
          if ((a4 & 1) != 0)
          {
            if (!v73)
            {
              v74 = 0;
              v75 = i;
              do
              {
                v76 = v75;
                v75 = v71;
                v78 = *v76;
                v77 = v76[1];
                v79 = *(_DWORD *)(v77 + 24);
                v80 = *(_DWORD *)(*v76 + 24);
                if (v79 < v80 || v79 <= v80 && *(_DWORD *)(v77 + 28) > *(_DWORD *)(v78 + 28))
                {
                  v76[1] = v78;
                  v81 = i;
                  if (v76 != i)
                  {
                    v82 = v74;
                    while (1)
                    {
                      v83 = *(uint64_t *)((char *)i + v82 - 8);
                      v84 = *(_DWORD *)(v83 + 24);
                      if (v79 >= v84)
                      {
                        if (v79 > v84)
                        {
                          v81 = (uint64_t *)((char *)i + v82);
                          goto LABEL_121;
                        }
                        if (*(_DWORD *)(v77 + 28) <= *(_DWORD *)(v83 + 28))
                          break;
                      }
                      --v76;
                      *(uint64_t *)((char *)i + v82) = v83;
                      v82 -= 8;
                      if (!v82)
                      {
                        v81 = i;
                        goto LABEL_121;
                      }
                    }
                    v81 = v76;
                  }
LABEL_121:
                  *v81 = v77;
                }
                v71 = v75 + 1;
                v74 += 8;
              }
              while (v75 + 1 != a2);
            }
          }
          else if (!v73)
          {
            do
            {
              v123 = v7;
              v7 = v71;
              v125 = *v123;
              v124 = v123[1];
              v126 = *(_DWORD *)(v124 + 24);
              v127 = *(_DWORD *)(*v123 + 24);
              if (v126 < v127 || v126 <= v127 && *(_DWORD *)(v124 + 28) > *(_DWORD *)(v125 + 28))
              {
                do
                {
                  do
                  {
                    v128 = v123;
                    v129 = *--v123;
                    v123[2] = v125;
                    v125 = v129;
                    v130 = *(_DWORD *)(v129 + 24);
                  }
                  while (v126 < v130);
                }
                while (v126 <= v130 && *(_DWORD *)(v124 + 28) > *(_DWORD *)(v125 + 28));
                *v128 = v124;
              }
              v71 = v7 + 1;
            }
            while (v7 + 1 != a2);
          }
          return result;
        }
        if (!a3)
        {
          if (i == a2)
            return result;
          v85 = (v11 - 2) >> 1;
          v86 = v85;
          do
          {
            v87 = v86;
            if (v85 >= v86)
            {
              v88 = (2 * v86) | 1;
              v89 = &i[v88];
              if (2 * v87 + 2 < (uint64_t)v11)
              {
                v90 = v89[1];
                result = *(unsigned int *)(*v89 + 24);
                v91 = *(_DWORD *)(v90 + 24);
                if (result < v91
                  || result <= v91 && *(_DWORD *)(*v89 + 28) > *(_DWORD *)(v90 + 28))
                {
                  ++v89;
                  v88 = 2 * v87 + 2;
                }
              }
              v92 = *v89;
              v93 = i[v87];
              v94 = *(_DWORD *)(*v89 + 24);
              v95 = *(_DWORD *)(v93 + 24);
              if (v94 >= v95)
              {
                if (v94 > v95 || (result = *(unsigned int *)(v93 + 28), *(_DWORD *)(v92 + 28) <= result))
                {
                  i[v87] = v92;
                  if (v85 >= v88)
                  {
                    while (1)
                    {
                      v97 = 2 * v88;
                      v88 = (2 * v88) | 1;
                      v96 = &i[v88];
                      v98 = v97 + 2;
                      if (v98 < (uint64_t)v11)
                      {
                        v99 = v96[1];
                        v100 = *(_DWORD *)(*v96 + 24);
                        v101 = *(_DWORD *)(v99 + 24);
                        if (v100 < v101 || v100 <= v101 && *(_DWORD *)(*v96 + 28) > *(_DWORD *)(v99 + 28))
                        {
                          ++v96;
                          v88 = v98;
                        }
                      }
                      v102 = *v96;
                      result = *(unsigned int *)(*v96 + 24);
                      if (result < v95)
                        break;
                      if (result <= v95)
                      {
                        result = *(unsigned int *)(v102 + 28);
                        if (result > *(_DWORD *)(v93 + 28))
                          break;
                      }
                      *v89 = v102;
                      v89 = v96;
                      if (v85 < v88)
                        goto LABEL_137;
                    }
                  }
                  v96 = v89;
LABEL_137:
                  *v96 = v93;
                }
              }
            }
            v86 = v87 - 1;
          }
          while (v87);
          v103 = (unint64_t)v10 >> 3;
          while (2)
          {
            v104 = 0;
            v105 = *i;
            v106 = i;
            do
            {
              v107 = v106;
              v106 += v104 + 1;
              v108 = 2 * v104;
              v104 = (2 * v104) | 1;
              v109 = v108 + 2;
              if (v109 < v103)
              {
                v110 = v106[1];
                result = *(unsigned int *)(*v106 + 24);
                v111 = *(_DWORD *)(v110 + 24);
                if (result < v111
                  || result <= v111 && *(_DWORD *)(*v106 + 28) > *(_DWORD *)(v110 + 28))
                {
                  ++v106;
                  v104 = v109;
                }
              }
              *v107 = *v106;
            }
            while (v104 <= (uint64_t)((unint64_t)(v103 - 2) >> 1));
            if (v106 == --a2)
            {
LABEL_168:
              *v106 = v105;
            }
            else
            {
              *v106 = *a2;
              *a2 = v105;
              v112 = (char *)v106 - (char *)i + 8;
              if (v112 >= 9)
              {
                v113 = ((unint64_t)v112 >> 3) - 2;
                v114 = v113 >> 1;
                v115 = &i[v113 >> 1];
                v116 = *v115;
                v105 = *v106;
                v117 = *(_DWORD *)(*v115 + 24);
                v118 = *(_DWORD *)(*v106 + 24);
                if (v117 < v118 || v117 <= v118 && *(_DWORD *)(v116 + 28) > *(_DWORD *)(v105 + 28))
                {
                  *v106 = v116;
                  if (v113 >= 2)
                  {
                    while (1)
                    {
                      v119 = v114 - 1;
                      v114 = (v114 - 1) >> 1;
                      v106 = &i[v114];
                      v120 = *v106;
                      v121 = *(_DWORD *)(*v106 + 24);
                      if (v121 >= v118 && (v121 > v118 || *(_DWORD *)(v120 + 28) <= *(_DWORD *)(v105 + 28)))
                        break;
                      *v115 = v120;
                      v115 = &i[v114];
                      if (v119 <= 1)
                        goto LABEL_168;
                    }
                  }
                  v106 = v115;
                  goto LABEL_168;
                }
              }
            }
            if (v103-- <= 2)
              return result;
            continue;
          }
        }
        v12 = v11 >> 1;
        v13 = &i[v11 >> 1];
        if ((unint64_t)v10 < 0x401)
        {
        }
        else
        {
          v14 = *v7;
          *v7 = *v13;
          *v13 = v14;
        }
        --a3;
        v15 = *v7;
        if ((a4 & 1) == 0)
        {
          v17 = *(v7 - 1);
          v18 = *(_DWORD *)(v17 + 24);
          v16 = *(_DWORD *)(v15 + 24);
          if (v18 < v16 || v18 <= v16 && *(_DWORD *)(v17 + 28) > *(_DWORD *)(v15 + 28))
            goto LABEL_14;
          v37 = *v8;
          v38 = *(_DWORD *)(*v8 + 24);
          if (v16 >= v38 && (v16 > v38 || *(_DWORD *)(v15 + 28) <= *(_DWORD *)(v37 + 28)))
          {
            for (i = v7 + 1; i < a2; ++i)
            {
              v51 = *(_DWORD *)(*i + 24);
              if (v16 < v51 || v16 <= v51 && *(_DWORD *)(v15 + 28) > *(_DWORD *)(*i + 28))
                break;
            }
          }
          else
          {
            i = v7;
            do
            {
              v40 = i[1];
              ++i;
              v39 = v40;
              v41 = *(_DWORD *)(v40 + 24);
            }
            while (v16 >= v41 && (v16 > v41 || *(_DWORD *)(v15 + 28) <= *(_DWORD *)(v39 + 28)));
          }
          v42 = a2;
          if (i < a2)
          {
            v42 = a2 - 1;
            while (v16 < v38 || v16 <= v38 && *(_DWORD *)(v15 + 28) > *(_DWORD *)(v37 + 28))
            {
              v43 = *--v42;
              v37 = v43;
              v38 = *(_DWORD *)(v43 + 24);
            }
          }
          if (i < v42)
          {
            v44 = *i;
            v45 = *v42;
            do
            {
              *i = v45;
              *v42 = v44;
              do
              {
                v46 = i[1];
                ++i;
                v44 = v46;
                v47 = *(_DWORD *)(v46 + 24);
              }
              while (v16 >= v47 && (v16 > v47 || *(_DWORD *)(v15 + 28) <= *(_DWORD *)(v44 + 28)));
              do
              {
                do
                {
                  v48 = *--v42;
                  v45 = v48;
                  v49 = *(_DWORD *)(v48 + 24);
                }
                while (v16 < v49);
              }
              while (v16 <= v49 && *(_DWORD *)(v15 + 28) > *(_DWORD *)(v45 + 28));
            }
            while (i < v42);
          }
          v50 = i - 1;
          if (i - 1 != v7)
            *v7 = *v50;
          a4 = 0;
          *v50 = v15;
          continue;
        }
        v16 = *(_DWORD *)(v15 + 24);
LABEL_14:
        for (j = v7 + 1; ; ++j)
        {
          v20 = *j;
          v21 = *(_DWORD *)(*j + 24);
          if (v21 >= v16 && (v21 > v16 || *(_DWORD *)(v20 + 28) <= *(_DWORD *)(v15 + 28)))
            break;
        }
        v22 = j - 1;
        if (j - 1 == v7)
        {
          v25 = a2;
          if (j < a2)
          {
            v27 = *v8;
            v28 = *(_DWORD *)(*v8 + 24);
            v25 = a2 - 1;
            if (v28 >= v16)
            {
              v25 = a2 - 1;
              do
              {
                if (v28 <= v16)
                {
                  if (j >= v25 || *(_DWORD *)(v27 + 28) > *(_DWORD *)(v15 + 28))
                    break;
                }
                else if (j >= v25)
                {
                  break;
                }
                v29 = *--v25;
                v27 = v29;
                v28 = *(_DWORD *)(v29 + 24);
              }
              while (v28 >= v16);
            }
          }
        }
        else
        {
          v23 = *v8;
          v24 = *(_DWORD *)(*v8 + 24);
          v25 = a2 - 1;
          if (v24 >= v16)
          {
            v25 = a2 - 1;
            do
            {
              if (v24 <= v16 && *(_DWORD *)(v23 + 28) > *(_DWORD *)(v15 + 28))
                break;
              v26 = *--v25;
              v23 = v26;
              v24 = *(_DWORD *)(v26 + 24);
            }
            while (v24 >= v16);
          }
        }
        if (j < v25)
        {
          v30 = *v25;
          v31 = (unint64_t)j;
          v32 = v25;
          do
          {
            *(_QWORD *)v31 = v30;
            v31 += 8;
            *v32 = v20;
            while (1)
            {
              v20 = *(_QWORD *)v31;
              v33 = *(_DWORD *)(*(_QWORD *)v31 + 24);
              if (v33 >= v16 && (v33 > v16 || *(_DWORD *)(v20 + 28) <= *(_DWORD *)(v15 + 28)))
                break;
              v31 += 8;
            }
            v22 = (uint64_t *)(v31 - 8);
            do
            {
              v34 = *--v32;
              v30 = v34;
              v35 = *(_DWORD *)(v34 + 24);
            }
            while (v35 >= v16 && (v35 > v16 || *(_DWORD *)(v30 + 28) <= *(_DWORD *)(v15 + 28)));
          }
          while (v31 < (unint64_t)v32);
        }
        if (v22 != v7)
          *v7 = *v22;
        *v22 = v15;
        if (j < v25)
        {
LABEL_52:
          a4 = 0;
          i = v22 + 1;
          continue;
        }
        i = v22 + 1;
        if (!(_DWORD)result)
        {
          if (v36)
            continue;
          goto LABEL_52;
        }
        a2 = v22;
        if (!v36)
          goto LABEL_2;
        return result;
    }
  }
}

uint64_t *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::internal::`anonymous namespace'::AliasMatchLess &,skit::AliasMatch const**>(uint64_t *result, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v16;

  v3 = *a2;
  v4 = *result;
  v5 = *(_DWORD *)(*a2 + 24);
  v6 = *(_DWORD *)(*result + 24);
  if (v5 >= v6 && (v5 > v6 || *(_DWORD *)(v3 + 28) <= *(_DWORD *)(v4 + 28)))
  {
    v9 = *a3;
    v10 = *(_DWORD *)(*a3 + 24);
    if (v10 < v5 || v10 <= v5 && *(_DWORD *)(v9 + 28) > *(_DWORD *)(v3 + 28))
    {
      *a2 = v9;
      *a3 = v3;
      v11 = *a2;
      v12 = *result;
      v13 = *(_DWORD *)(*a2 + 24);
      v14 = *(_DWORD *)(*result + 24);
      if (v13 < v14 || v13 <= v14 && *(_DWORD *)(v11 + 28) > *(_DWORD *)(v12 + 28))
      {
        *result = v11;
        *a2 = v12;
      }
    }
  }
  else
  {
    v7 = *a3;
    v8 = *(_DWORD *)(*a3 + 24);
    if (v8 < v5 || v8 <= v5 && *(_DWORD *)(v7 + 28) > *(_DWORD *)(v3 + 28))
    {
      *result = v7;
LABEL_17:
      *a3 = v4;
      return result;
    }
    *result = v3;
    *a2 = v4;
    v15 = *a3;
    v16 = *(_DWORD *)(*a3 + 24);
    if (v16 < v6 || v16 <= v6 && *(_DWORD *)(v15 + 28) > *(_DWORD *)(v4 + 28))
    {
      *a2 = v15;
      goto LABEL_17;
    }
  }
  return result;
}

uint64_t *std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,skit::internal::`anonymous namespace'::AliasMatchLess &,skit::AliasMatch const**>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t *result;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int v19;
  unsigned int v20;

  v9 = *a4;
  v10 = *a3;
  v11 = *(_DWORD *)(*a4 + 24);
  v12 = *(_DWORD *)(*a3 + 24);
  if (v11 < v12 || v11 <= v12 && *(_DWORD *)(v9 + 28) > *(_DWORD *)(v10 + 28))
  {
    *a3 = v9;
    *a4 = v10;
    v13 = *a3;
    v14 = *a2;
    v15 = *(_DWORD *)(*a3 + 24);
    v16 = *(_DWORD *)(*a2 + 24);
    if (v15 < v16 || v15 <= v16 && *(_DWORD *)(v13 + 28) > *(_DWORD *)(v14 + 28))
    {
      *a2 = v13;
      *a3 = v14;
      v17 = *a2;
      v18 = *a1;
      v19 = *(_DWORD *)(*a2 + 24);
      v20 = *(_DWORD *)(*a1 + 24);
      if (v19 < v20 || v19 <= v20 && *(_DWORD *)(v17 + 28) > *(_DWORD *)(v18 + 28))
      {
        *a1 = v17;
        *a2 = v18;
      }
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,skit::internal::`anonymous namespace'::AliasMatchLess &,skit::AliasMatch const**>(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  unsigned int v36;

  v4 = a2 - a1;
  result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v6 = *(a2 - 1);
      v7 = *a1;
      v8 = *(_DWORD *)(v6 + 24);
      v9 = *(_DWORD *)(*a1 + 24);
      if (v8 < v9 || v8 <= v9 && *(_DWORD *)(v6 + 28) > *(_DWORD *)(v7 + 28))
      {
        *a1 = v6;
        *(a2 - 1) = v7;
      }
      return result;
    case 3:
      return 1;
    case 4:
      return 1;
    case 5:
      v22 = a1 + 1;
      v23 = a1 + 2;
      v24 = a1 + 3;
      v25 = *(a2 - 1);
      v26 = a1[3];
      v27 = *(_DWORD *)(v25 + 24);
      v28 = *(_DWORD *)(v26 + 24);
      if (v27 < v28 || v27 <= v28 && *(_DWORD *)(v25 + 28) > *(_DWORD *)(v26 + 28))
      {
        *v24 = v25;
        *(a2 - 1) = v26;
        v29 = *v24;
        v30 = *v23;
        v31 = *(_DWORD *)(*v24 + 24);
        v32 = *(_DWORD *)(*v23 + 24);
        if (v31 < v32 || v31 <= v32 && *(_DWORD *)(v29 + 28) > *(_DWORD *)(v30 + 28))
        {
          *v23 = v29;
          *v24 = v30;
          v33 = *v22;
          v34 = *(_DWORD *)(*v22 + 24);
          if (v31 < v34 || v31 <= v34 && *(_DWORD *)(v29 + 28) > *(_DWORD *)(v33 + 28))
          {
            a1[1] = v29;
            a1[2] = v33;
            v35 = *a1;
            v36 = *(_DWORD *)(*a1 + 24);
            if (v31 < v36 || v31 <= v36 && *(_DWORD *)(v29 + 28) > *(_DWORD *)(v35 + 28))
            {
              *a1 = v29;
              a1[1] = v35;
            }
          }
        }
      }
      return 1;
    default:
      v10 = a1 + 2;
      v11 = a1 + 3;
      if (a1 + 3 == a2)
        return 1;
      v12 = 0;
      v13 = 0;
      break;
  }
  while (1)
  {
    v14 = *v11;
    v15 = *v10;
    v16 = *(_DWORD *)(*v11 + 24);
    v17 = *(_DWORD *)(*v10 + 24);
    if (v16 < v17 || v16 <= v17 && *(_DWORD *)(v14 + 28) > *(_DWORD *)(v15 + 28))
    {
      *v11 = v15;
      v18 = a1;
      if (v10 != a1)
      {
        v19 = v12;
        while (1)
        {
          v20 = *(uint64_t *)((char *)a1 + v19 + 8);
          v21 = *(_DWORD *)(v20 + 24);
          if (v16 >= v21)
          {
            if (v16 > v21)
            {
              v18 = v10;
              goto LABEL_18;
            }
            if (*(_DWORD *)(v14 + 28) <= *(_DWORD *)(v20 + 28))
              break;
          }
          --v10;
          *(uint64_t *)((char *)a1 + v19 + 16) = v20;
          v19 -= 8;
          if (v19 == -16)
          {
            v18 = a1;
            goto LABEL_18;
          }
        }
        v18 = (uint64_t *)((char *)a1 + v19 + 16);
      }
LABEL_18:
      *v18 = v14;
      if (++v13 == 8)
        return v11 + 1 == a2;
    }
    v10 = v11;
    v12 += 8;
    if (++v11 == a2)
      return 1;
  }
}

uint64_t skit::internal::FieldSpanMatcherImpl::alias_span_matcher(uint64_t a1, __int128 *a2, char a3, uint64_t a4, uint64_t *a5, int a6)
{
  uint64_t *v11;
  unsigned int v12;
  __int128 **v13;
  unsigned int v14;
  uint64_t v15;
  __int128 *v16;
  uint64_t v17;
  std::basic_string<char16_t> *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v23;
  uint8_t buf[8];
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[10];

  v29[8] = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)a2 && *(_BYTE *)(*(_QWORD *)a2 + 64))
  {
    std::shared_ptr<skit::internal::AliasImpl>::operator=[abi:ne180100](a1 + 640, a2);
    skit::SmallVector<skit::AliasMatch,2u,true>::_destroy(*(_QWORD *)(a1 + 656), *(_DWORD *)(a1 + 664));
    *(_DWORD *)(a1 + 664) = 0;
    v27 = v29;
    v28 = 0x800000000;
    *(_QWORD *)buf = &v26;
    v25 = 0x200000000;
    skit::internal::FieldSpanMatcherImpl::combine_alias_matches(a1, (uint64_t)&v27, (uint64_t *)a1, a6, (uint64_t)buf, a5);
    v11 = (uint64_t *)(a1 + 656);
    v12 = v28;
    if (*(_DWORD *)(a1 + 668) < v28)
    {
      skit::SmallVector<skit::AliasMatch,2u,true>::_reserve_more((__int128 **)(a1 + 656), v28);
      v12 = v28;
    }
    if (v12)
    {
      v13 = (__int128 **)v27;
      v14 = *(_DWORD *)(a1 + 664);
      v15 = 8 * v12;
      do
      {
        v16 = *v13;
        if (v14 == *(_DWORD *)(a1 + 668))
        {
          skit::SmallVector<skit::AliasMatch,2u,true>::_reserve_more((__int128 **)(a1 + 656), v14 + (v14 >> 1) + 1);
          v14 = *(_DWORD *)(a1 + 664);
        }
        v17 = *v11;
        v18 = (std::basic_string<char16_t> *)(*v11 + 40 * v14);
        if (*((char *)v16 + 23) < 0)
        {
          std::basic_string<char16_t>::__init_copy_ctor_external(v18, *(const std::basic_string<char16_t>::value_type **)v16, *((_QWORD *)v16 + 1));
        }
        else
        {
          v19 = *v16;
          v18->__r_.__value_.__r.__words[2] = *((_QWORD *)v16 + 2);
          *(_OWORD *)&v18->__r_.__value_.__l.__data_ = v19;
        }
        v20 = v17 + 40 * v14;
        v21 = *((_QWORD *)v16 + 3);
        *(_WORD *)(v20 + 32) = *((_WORD *)v16 + 16);
        *(_QWORD *)(v20 + 24) = v21;
        v14 = *(_DWORD *)(a1 + 664) + 1;
        *(_DWORD *)(a1 + 664) = v14;
        ++v13;
        v15 -= 8;
      }
      while (v15);
    }
    skit::internal::FieldSpanMatcherImpl::alias_filters((uint64_t *)a1, a3, a4);
    skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)buf);
    if (v27 != v29)
      free(v27);
    return 0;
  }
  else
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v23 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CB748000, v23, OS_LOG_TYPE_ERROR, "FieldSpanMatcherImpl::alias_span_matcher : Alias span matcher is not initialized", buf, 2u);
    }
    return 0xFFFFFFFFLL;
  }
}

void sub_1CB751F2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)&a11);
  if (a23 != a10)
    free(a23);
  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<skit::internal::AliasImpl>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
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
  return a1;
}

void skit::internal::FieldSpanMatcherImpl::alias_filters(uint64_t *a1, char a2, uint64_t a3)
{
  char *v4;
  uint64_t v5;
  int v6;
  size_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t *v11;
  _BYTE *v12;
  uint64_t v13;
  char v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  unsigned __int8 *v20;
  __int128 *v21;
  __int128 *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  float v31;
  unsigned __int16 *v32;
  unsigned int v33;
  int v34;
  unsigned int v35;
  __int128 *v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  int v40;
  int v41;
  uint64_t v42;
  unsigned int v43;
  char *v44;
  unsigned int v45;
  char *v46;
  __int128 v47;
  uint64_t v48;
  int v49;
  int *v50;
  uint64_t v51;
  _WORD *v52;
  __int16 *v53;
  __int16 v54;
  std::bad_alloc *exception;
  std::bad_alloc *v56;
  __int128 **v57;
  char **v58;
  std::basic_string<char16_t> v59;
  uint64_t v60;
  __int16 v61;
  _BYTE v62[28];
  void *v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  _BYTE v67[32];
  void *v68;
  int v69;
  int v70;
  _DWORD v71[4];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  *((_BYTE *)a1 + 608) = a2;
  if (a1 + 77 != (uint64_t *)a3)
  {
    v4 = *(char **)a3;
    v5 = *(unsigned int *)(a3 + 8);
    if (*((_DWORD *)a1 + 157) >= v5)
    {
      if ((_DWORD)v5)
      {
        v12 = (_BYTE *)a1[77];
        v13 = *(unsigned int *)(a3 + 8);
        do
        {
          v14 = *v4++;
          *v12++ = v14;
          --v13;
        }
        while (v13);
      }
    }
    else
    {
      v6 = *((_DWORD *)a1 + 156) + (*((_DWORD *)a1 + 156) >> 1);
      if (v6 + 1 > v5)
        v7 = (v6 + 1);
      else
        v7 = v5;
      v8 = malloc_type_malloc(v7, 0x100004077774924uLL);
      if (!v8)
      {
        exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
        v56 = std::bad_alloc::bad_alloc(exception);
        __cxa_throw(v56, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
      }
      v9 = v8;
      v10 = 0;
      do
      {
        *((_BYTE *)v8 + v10) = v4[v10];
        ++v10;
      }
      while (v5 != v10);
      v11 = (uint64_t *)a1[77];
      if (v11 != a1 + 79)
        free(v11);
      a1[77] = (uint64_t)v9;
      *((_DWORD *)a1 + 157) = malloc_size(v9);
    }
    *((_DWORD *)a1 + 156) = v5;
  }
  v15 = *((_DWORD *)a1 + 190);
  if (v15)
  {
    v16 = a1[94];
    v17 = 104 * v15;
    do
    {
      v16 = skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>::~AliasSpanMatchImpl(v16) + 104;
      v17 -= 104;
    }
    while (v17);
  }
  v58 = (char **)(a1 + 94);
  *((_DWORD *)a1 + 190) = 0;
  v18 = *((_DWORD *)a1 + 166);
  if (*((_DWORD *)a1 + 191) < v18)
    skit::SmallVector<skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>,4u,true>::_reserve_more(v58, v18);
  skit::SmallVector<skit::AliasSpanMatch,4u,true>::_destroy(a1[148], *((_DWORD *)a1 + 298));
  *((_DWORD *)a1 + 298) = 0;
  v19 = *((_DWORD *)a1 + 166);
  v57 = (__int128 **)(a1 + 148);
  if (*((_DWORD *)a1 + 299) < v19)
  {
    skit::SmallVector<skit::AliasSpanMatch,4u,true>::_reserve_more((__int128 **)a1 + 148, v19);
    v19 = *((_DWORD *)a1 + 166);
  }
  if (v19)
  {
    v20 = (unsigned __int8 *)(a1 + 76);
    v21 = (__int128 *)a1[82];
    v22 = (__int128 *)((char *)v21 + 40 * v19);
    do
    {
      if (skit::internal::AliasFilter::select_by_group_id(v20, *((_BYTE *)v21 + 32), *((_BYTE *)v21 + 33)))
      {
        v24 = (_QWORD *)v21 + 3;
        v23 = *((unsigned int *)v21 + 6);
        v25 = *a1;
        v26 = *((unsigned int *)v21 + 7);
        *(_DWORD *)v62 = *(_DWORD *)(*a1 + 48 * v23 + 24);
        *(_DWORD *)&v62[4] = *(_DWORD *)(*a1 + 48 * (v26 - 1) + 28);
        *(_DWORD *)&v62[8] = 0;
        *(_QWORD *)&v62[16] = 0;
        *(_DWORD *)&v62[24] = 0;
        v63 = &v65;
        v64 = 0x400000000;
        v66 = 0;
        if (v23 >= v26)
        {
          v28 = 0;
          v27 = 0;
          v31 = 0.0;
        }
        else
        {
          v27 = 0;
          v28 = 0;
          v29 = v26 - v23;
          v30 = v25 + 48 * v23 + 40;
          v31 = 0.0;
          v32 = (unsigned __int16 *)v30;
          do
          {
            v33 = *v32;
            v32 += 24;
            v34 = v28 + ((v33 >> 2) & 1);
            if ((v33 & 2) != 0)
            {
              v28 = v34;
              ++v27;
            }
            v31 = v31
                + (float)(*(float *)(v30 - 8) * (float)(*(_DWORD *)(v30 - 12) - *(_DWORD *)(v30 - 16)));
            v30 = (uint64_t)v32;
            --v29;
          }
          while (v29);
        }
        *(float *)&v62[12] = v31 * 0.85;
        *(_DWORD *)&v62[16] = v27;
        skit::SpanMatchV3::append_alias_id((size_t)v62, *((_WORD *)v21 + 16), v27);
        *(_DWORD *)&v62[20] = v28;
        v35 = *((_DWORD *)a1 + 298);
        if (v35 == *((_DWORD *)a1 + 299))
        {
          skit::SmallVector<skit::AliasSpanMatch,4u,true>::_reserve_more(v57, v35 + (v35 >> 1) + 1);
          v35 = *((_DWORD *)a1 + 298);
        }
        v36 = *v57;
        if (*((char *)v21 + 23) < 0)
        {
          std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)v67, *(const std::basic_string<char16_t>::value_type **)v21, *((_QWORD *)v21 + 1));
        }
        else
        {
          *(_OWORD *)v67 = *v21;
          *(_QWORD *)&v67[16] = *((_QWORD *)v21 + 2);
        }
        *(_QWORD *)&v67[24] = *v24;
        v37 = *(_QWORD *)&v67[24];
        LOWORD(v68) = *((_WORD *)v21 + 16);
        v38 = (__int16)v68;
        v39 = *(_QWORD *)v62;
        v40 = *(_DWORD *)&v62[8];
        v41 = *(_DWORD *)&v62[12];
        v42 = *(_QWORD *)&v62[16];
        v43 = *(_DWORD *)&v62[24];
        v44 = (char *)v36 + 72 * v35;
        *(_OWORD *)v44 = *(_OWORD *)v67;
        *((_QWORD *)v44 + 2) = *(_QWORD *)&v67[16];
        *((_QWORD *)v44 + 3) = v37;
        *((_WORD *)v44 + 16) = v38;
        *((_QWORD *)v44 + 5) = v39;
        *((_DWORD *)v44 + 12) = v40;
        *((_DWORD *)v44 + 13) = v41;
        *((_QWORD *)v44 + 7) = v42;
        *((_QWORD *)v44 + 8) = v43;
        ++*((_DWORD *)a1 + 298);
        v45 = *((_DWORD *)a1 + 190);
        if (v45 == *((_DWORD *)a1 + 191))
        {
          skit::SmallVector<skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>,4u,true>::_reserve_more(v58, v45 + (v45 >> 1) + 1);
          v45 = *((_DWORD *)a1 + 190);
        }
        v46 = *v58;
        if (*((char *)v21 + 23) < 0)
        {
          std::basic_string<char16_t>::__init_copy_ctor_external(&v59, *(const std::basic_string<char16_t>::value_type **)v21, *((_QWORD *)v21 + 1));
        }
        else
        {
          v47 = *v21;
          v59.__r_.__value_.__r.__words[2] = *((_QWORD *)v21 + 2);
          *(_OWORD *)&v59.__r_.__value_.__l.__data_ = v47;
        }
        v48 = *v24;
        v61 = *((_WORD *)v21 + 16);
        v60 = v48;
        *(_OWORD *)v67 = *(_OWORD *)v62;
        *(_OWORD *)&v67[12] = *(_OWORD *)&v62[12];
        if (v63 == &v65)
        {
          v68 = v71;
          v49 = v64;
          if ((_DWORD)v64)
          {
            v51 = 2 * v64;
            v52 = v71;
            v53 = (__int16 *)&v65;
            do
            {
              v54 = *v53++;
              *v52++ = v54;
              v51 -= 2;
            }
            while (v51);
          }
          v50 = &v70;
        }
        else
        {
          v68 = v63;
          v49 = v64;
          v70 = HIDWORD(v64);
          v63 = &v65;
          v50 = (int *)&v64 + 1;
        }
        *v50 = 4;
        LODWORD(v64) = 0;
        v69 = v49;
        v71[2] = v66;
        skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>::AliasSpanMatchImpl((uint64_t)&v46[104 * v45], (__int128 *)&v59, (size_t)v67);
        v20 = (unsigned __int8 *)(a1 + 76);
        if (v68 != v71)
          free(v68);
        if (SHIBYTE(v59.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v59.__r_.__value_.__l.__data_);
        ++*((_DWORD *)a1 + 190);
        if (v63 != &v65)
          free(v63);
      }
      v21 = (__int128 *)((char *)v21 + 40);
    }
    while (v21 != v22);
  }
}

void sub_1CB7524B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36)
{
  void *v36;
  void *v37;

  if (a36 != v36)
    free(a36);
  if (a20 < 0)
    operator delete(__p);
  if (a28 != v37)
    free(a28);
  _Unwind_Resume(exception_object);
}

size_t skit::SmallVector<skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>,4u,true>::_reserve_more(char **a1, unsigned int a2)
{
  char *v3;
  char *v4;
  char *v5;
  unsigned int v6;
  char *v7;
  char *v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  size_t result;
  std::bad_alloc *exception;
  std::bad_alloc *v15;

  v3 = (char *)malloc_type_malloc(104 * a2, 0x1032040E39E8272uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v15 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v15, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
  }
  v4 = v3;
  v5 = *a1;
  v6 = *((_DWORD *)a1 + 2);
  if (v6)
  {
    v7 = v3;
    v8 = *a1;
    do
    {
      v9 = *(_OWORD *)v8;
      *((_QWORD *)v7 + 2) = *((_QWORD *)v8 + 2);
      *(_OWORD *)v7 = v9;
      *((_QWORD *)v8 + 1) = 0;
      *((_QWORD *)v8 + 2) = 0;
      *(_QWORD *)v8 = 0;
      v10 = *((_QWORD *)v8 + 3);
      *((_WORD *)v7 + 16) = *((_WORD *)v8 + 16);
      *((_QWORD *)v7 + 3) = v10;
      v11 = *(_OWORD *)(v8 + 40);
      *(_OWORD *)(v7 + 52) = *(_OWORD *)(v8 + 52);
      *(_OWORD *)(v7 + 40) = v11;
      skit::SmallVector<skit::GroupId,4u,true>::move((uint64_t)(v7 + 72), (uint64_t)(v8 + 72));
      *((_DWORD *)v7 + 24) = *((_DWORD *)v8 + 24);
      v8 += 104;
      v7 += 104;
    }
    while (v8 != &v5[104 * v6]);
    v12 = 104 * v6;
    do
    {
      skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>::~AliasSpanMatchImpl((uint64_t)v5);
      v5 += 104;
      v12 -= 104;
    }
    while (v12);
    v5 = *a1;
  }
  if (v5 != (char *)(a1 + 2))
    free(v5);
  *a1 = v4;
  result = malloc_size(v4);
  *((_DWORD *)a1 + 3) = result / 0x68;
  return result;
}

size_t skit::SmallVector<skit::AliasSpanMatch,4u,true>::_reserve_more(__int128 **a1, unsigned int a2)
{
  char *v3;
  __int128 *v4;
  __int128 *v5;
  uint64_t v6;
  char *v7;
  __int128 *v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  size_t result;
  std::bad_alloc *exception;
  std::bad_alloc *v15;

  v3 = (char *)malloc_type_malloc(72 * a2, 0x101204049D86D5EuLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v15 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v15, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
  }
  v4 = (__int128 *)v3;
  v5 = *a1;
  v6 = *((unsigned int *)a1 + 2);
  if ((_DWORD)v6)
  {
    v7 = v3;
    v8 = *a1;
    do
    {
      v9 = *v8;
      *((_QWORD *)v7 + 2) = *((_QWORD *)v8 + 2);
      *(_OWORD *)v7 = v9;
      *((_QWORD *)v8 + 1) = 0;
      *((_QWORD *)v8 + 2) = 0;
      *(_QWORD *)v8 = 0;
      v10 = *((_QWORD *)v8 + 3);
      *((_WORD *)v7 + 16) = *((_WORD *)v8 + 16);
      *((_QWORD *)v7 + 3) = v10;
      v11 = *(__int128 *)((char *)v8 + 40);
      *(_OWORD *)(v7 + 56) = *(__int128 *)((char *)v8 + 56);
      *(_OWORD *)(v7 + 40) = v11;
      v8 = (__int128 *)((char *)v8 + 72);
      v7 += 72;
    }
    while (v8 != (__int128 *)((char *)v5 + 72 * v6));
    v12 = 72 * v6;
    do
    {
      if (*((char *)v5 + 23) < 0)
        operator delete(*(void **)v5);
      v5 = (__int128 *)((char *)v5 + 72);
      v12 -= 72;
    }
    while (v12);
    v5 = *a1;
  }
  if (v5 != (__int128 *)(a1 + 2))
    free(v5);
  *a1 = v4;
  result = malloc_size(v4);
  *((_DWORD *)a1 + 3) = result / 0x48;
  return result;
}

void skit::internal::FieldSpanMatcherImpl::clear_alias_span_matcher(skit::internal::FieldSpanMatcherImpl *this)
{
  std::__shared_weak_count *v2;
  unint64_t *v3;
  unint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  *((_BYTE *)this + 608) = 0;
  *((_DWORD *)this + 156) = 0;
  v8 = 0uLL;
  std::shared_ptr<skit::internal::AliasImpl>::operator=[abi:ne180100]((uint64_t)this + 640, &v8);
  v2 = (std::__shared_weak_count *)*((_QWORD *)&v8 + 1);
  if (*((_QWORD *)&v8 + 1))
  {
    v3 = (unint64_t *)(*((_QWORD *)&v8 + 1) + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  skit::SmallVector<skit::AliasMatch,2u,true>::_destroy(*((_QWORD *)this + 82), *((_DWORD *)this + 166));
  *((_DWORD *)this + 166) = 0;
  v5 = *((_DWORD *)this + 190);
  if (v5)
  {
    v6 = *((_QWORD *)this + 94);
    v7 = 104 * v5;
    do
    {
      v6 = skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>::~AliasSpanMatchImpl(v6) + 104;
      v7 -= 104;
    }
    while (v7);
  }
  *((_DWORD *)this + 190) = 0;
  skit::SmallVector<skit::AliasSpanMatch,4u,true>::_destroy(*((_QWORD *)this + 148), *((_DWORD *)this + 298));
  *((_DWORD *)this + 298) = 0;
}

void skit::internal::FieldSpanMatcherImpl::match(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, int a5, __int16 a6, unsigned int a7)
{
  uint64_t *v8;
  uint64_t v10;
  std::basic_string<char16_t>::value_type v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  char *v17;
  char *v18;
  std::basic_string<char16_t> *v19;
  float v20;
  __int16 v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  const std::basic_string<char16_t>::value_type *v25;
  std::basic_string<char16_t>::size_type v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  float v33;
  float v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL4 is_possessive_token;
  uint64_t v48;
  unsigned int v49;
  int v50;
  int v51;
  unsigned __int16 *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  BOOL v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _BYTE *v61;
  _BYTE *v62;
  uint64_t v63;
  unsigned int v64;
  int v65;
  int v66;
  uint64_t i;
  uint64_t v68;
  int v69;
  uint64_t v70;
  int v71;
  uint64_t v72;
  char *v73;
  char *v74;
  int v75;
  int v76;
  char *v77;
  char v78;
  char *v79;
  char *v80;
  uint64_t v81;
  int v82;
  uint64_t j;
  unint64_t v84;
  uint64_t v87;
  unsigned __int16 *v88;
  uint64_t v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  uint64_t v93;
  uint64_t v94;
  unsigned int v95;
  uint64_t v96;
  int v97;
  int v98;
  int v100;
  int v101;
  unsigned int v102;
  BOOL v103;
  uint64_t v104;
  unsigned __int16 *v105;
  unsigned int v106;
  unsigned int v107;
  uint64_t v109;
  __int16 v111;
  unsigned int v112;
  char *v113;
  char *v114;
  char *v115;
  char *v116;
  _DWORD *v117;
  _DWORD *v118;
  _DWORD *v119;
  _DWORD *v120;
  int v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  int v128;
  int v129;
  uint64_t v130;
  _DWORD *v131;
  uint64_t v132;
  uint64_t v133;
  _DWORD *v134;
  int v136;
  __int16 *v137;
  __int16 v138;
  uint64_t v139;
  unsigned int v140;
  uint64_t v141;
  uint64_t v142;
  __int16 v143;
  unsigned int v144;
  char *v145;
  uint64_t v146;
  uint64_t matched;
  unsigned int v148;
  __int128 *v149;
  __int128 *v150;
  __int128 v151;
  uint64_t v152;
  unsigned int v153;
  char *v154;
  char *v155;
  unsigned int v156;
  float v157;
  uint64_t v158;
  uint64_t v159;
  int v160;
  uint64_t v161;
  unsigned __int16 *v162;
  float *v163;
  float v164;
  unsigned int v165;
  unsigned int v166;
  uint64_t v167;
  int v168;
  char *v169;
  uint64_t v170;
  unint64_t v171;
  unint64_t v172;
  unsigned int v173;
  char *v174;
  char *v175;
  uint64_t v176;
  unsigned int v177;
  char v178;
  int32x2_t *v179;
  uint64_t v180;
  uint64_t v181;
  char *v182;
  char *v183;
  unint64_t v184;
  unsigned int v185;
  std::basic_string<char16_t>::size_type v186;
  std::basic_string<char16_t>::size_type v187;
  std::basic_string<char16_t>::size_type v188;
  unint64_t v189;
  unsigned int v190;
  std::basic_string<char16_t>::size_type v191;
  std::basic_string<char16_t>::size_type v192;
  std::basic_string<char16_t>::size_type v193;
  unint64_t v194;
  uint64_t v195;
  char *v196;
  char *v197;
  unsigned int v198;
  __int128 v199;
  unint64_t v200;
  unsigned int v201;
  unsigned int v202;
  uint64_t v203;
  char *v204;
  _DWORD *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t *v210;
  char **v211;
  uint64_t v212;
  uint64_t v213;
  int v214;
  uint64_t v215;
  unsigned int v216;
  char *v217;
  uint64_t v218;
  int v219;
  uint64_t v220;
  unsigned __int16 *v221;
  _DWORD *v222;
  unint64_t v223;
  uint64_t v224;
  unsigned __int8 *v225;
  uint64_t v226;
  char *v227;
  unsigned int v228;
  __int16 *v229;
  unint64_t v230;
  uint64_t v231;
  uint64_t v232;
  __int16 v233;
  uint64_t v234;
  _QWORD v235[2];
  uint64_t v236;
  void *v237;
  uint64_t v238;
  _BYTE v239[64];
  void *v240;
  uint64_t v241;
  _BYTE v242[64];
  char *v243;
  uint64_t v244;
  uint64_t v245;
  char *v246;
  uint64_t v247;
  uint64_t v248;
  std::basic_string<char16_t> v249;
  uint64_t v250;
  __int16 v251;
  unsigned int v252;
  unsigned int v253;
  uint64_t v254;

  v254 = *MEMORY[0x1E0C80C00];
  if (*a3 == a3[1])
    return;
  v8 = a3;
  v10 = a1;
  v237 = v239;
  v238 = 0x800000000;
  v235[0] = &v236;
  v235[1] = 0x200000000;
  if (*(_DWORD *)(a1 + 760))
    skit::internal::FieldSpanMatcherImpl::combine_alias_matches(a1, (uint64_t)&v237, a3, a5, (uint64_t)v235, a4);
  skit::internal::FieldMatchesImpl<skit::SpanMatchV3>::clear(a2);
  *(_WORD *)a2 = a6;
  v12 = *v8;
  v13 = v8[1];
  v222 = (_DWORD *)a2;
  v210 = v8;
  if (*v8 == v13)
  {
    v20 = 0.0;
    v29 = *v8;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v16 = a2;
    v17 = (char *)v237;
    v18 = (char *)v237 + 8 * v238;
    v19 = (std::basic_string<char16_t> *)(v16 + 8);
    v20 = 0.0;
    do
    {
      v21 = *(_WORD *)(v12 + 40);
      if ((v21 & 0xA) == 2)
      {
        ++v222[8];
        if (*(char *)(v12 + 23) < 0)
          v22 = *(_QWORD *)(v12 + 8);
        else
          LODWORD(v22) = *(unsigned __int8 *)(v12 + 23);
        v222[11] += v22;
        v23 = *(char *)(v12 + 23) < 0 ? *(_QWORD *)(v12 + 8) : *(unsigned __int8 *)(v12 + 23);
        v20 = v20 + (float)(*(float *)(v12 + 32) * (float)v23);
        if ((v21 & 4) != 0)
          ++v222[9];
      }
      if (v14 && (v21 & 8) == 0 && v14 < *(_DWORD *)(v12 + 24))
      {
        std::basic_string<char16_t>::push_back(v19, v11);
        v21 = *(_WORD *)(v12 + 40);
      }
      if ((v21 & 8) == 0)
      {
        v24 = *(char *)(v12 + 23);
        if (v24 >= 0)
          v25 = (const std::basic_string<char16_t>::value_type *)v12;
        else
          v25 = *(const std::basic_string<char16_t>::value_type **)v12;
        if (v24 >= 0)
          v26 = *(unsigned __int8 *)(v12 + 23);
        else
          v26 = *(_QWORD *)(v12 + 8);
        std::basic_string<char16_t>::append(v19, v25, v26);
      }
      v14 = *(_DWORD *)(v12 + 28);
      v27 = v18;
      if (v17 != v18)
      {
        while (1)
        {
          v28 = *(_QWORD *)v17;
          if (*(_DWORD *)(*(_QWORD *)v17 + 28) > v15)
          {
            if (*(_DWORD *)(v28 + 24) > v15)
              goto LABEL_34;
            if (skit::internal::AliasFilter::select_by_group_id((unsigned __int8 *)(v10 + 608), *(_BYTE *)(v28 + 32), *(_BYTE *)(v28 + 33)))
            {
              break;
            }
          }
          v17 += 8;
          if (v17 == v18)
          {
            v27 = v18;
            goto LABEL_35;
          }
        }
        v222[10] += (*(unsigned __int16 *)(v12 + 40) >> 1) & 1;
LABEL_34:
        v27 = v17;
      }
LABEL_35:
      ++v15;
      v12 += 48;
      v17 = v27;
    }
    while (v12 != v13);
    v8 = v210;
    v29 = *v210;
    v12 = v210[1];
    a2 = (uint64_t)v222;
  }
  v30 = *(_DWORD *)(a2 + 44);
  v240 = v242;
  v241 = 0x1000000000;
  v31 = -1431655765 * ((unint64_t)(v12 - v29) >> 4);
  if (v31 >= 0x11)
  {
    skit::SmallVector<float,16u,false>::_reserve_more((uint64_t)&v240, v31);
    v29 = *v8;
    v12 = v8[1];
  }
  if (v29 == v12)
  {
    v211 = (char **)(a2 + 48);
    goto LABEL_365;
  }
  v32 = v241;
  v33 = (float)v30 / v20;
  do
  {
    v34 = *(float *)(v29 + 32);
    if (v32 == HIDWORD(v241))
    {
      skit::SmallVector<float,16u,false>::_reserve_more((uint64_t)&v240, v32 + (v32 >> 1) + 1);
      v32 = v241;
    }
    *((float *)v240 + v32++) = v33 * v34;
    LODWORD(v241) = v32;
    v29 += 48;
  }
  while (v29 != v12);
  v35 = *v8;
  v36 = v8[1];
  v211 = (char **)(a2 + 48);
  if (*v8 != v36 && *(_QWORD *)v10 != *(_QWORD *)(v10 + 8))
  {
    if (*(char *)(v10 + 47) < 0)
    {
      if (!*(_QWORD *)(v10 + 32))
        goto LABEL_365;
    }
    else if (!*(_BYTE *)(v10 + 47))
    {
      goto LABEL_365;
    }
    if (*(char *)(v10 + 71) < 0)
    {
      if (!*(_QWORD *)(v10 + 56))
        goto LABEL_365;
    }
    else if (!*(_BYTE *)(v10 + 71))
    {
      goto LABEL_365;
    }
    v246 = (char *)&v248;
    v247 = 0x800000000;
    v243 = (char *)&v245;
    v244 = 0x800000000;
    v206 = v10 + 48;
    v207 = v10 + 24;
    if (*(_BYTE *)(v10 + 602))
      v37 = v10 + 24;
    else
      v37 = v10 + 48;
    if (*(char *)(v37 + 23) < 0)
    {
      v39 = v37;
      v37 = *(_QWORD *)v37;
      v38 = *(_QWORD *)(v39 + 8);
    }
    else
    {
      v38 = *(unsigned __int8 *)(v37 + 23);
    }
    v223 = v38;
    v208 = -1431655765 * ((unint64_t)(v36 - v35) >> 4);
    if (!(_DWORD)v208)
      goto LABEL_364;
    v40 = 0;
    v41 = (char *)v237;
    v227 = (char *)v237 + 8 * v238;
    v225 = (unsigned __int8 *)(v10 + 608);
    v226 = v10;
    v224 = v37;
LABEL_64:
    v42 = *v8;
    v231 = v40;
    v43 = *v8 + 48 * v40;
    v44 = *(unsigned __int8 *)(v43 + 23);
    if (*(char *)(v43 + 23) < 0)
    {
      if (!*(_QWORD *)(v43 + 8))
        goto LABEL_313;
    }
    else if (!*(_BYTE *)(v43 + 23))
    {
      goto LABEL_313;
    }
    v229 = (__int16 *)(v42 + 48 * v40 + 40);
    v233 = *v229;
    if ((*v229 & 6) == 2)
    {
      if ((v44 & 0x80u) == 0)
        v45 = *v8 + 48 * v40;
      else
        v45 = *(_QWORD *)v43;
      if ((v44 & 0x80u) == 0)
        v46 = *(unsigned __int8 *)(v43 + 23);
      else
        v46 = *(_QWORD *)(v43 + 8);
      if ((v44 & 0x80) == 0)
        goto LABEL_76;
    }
    else
    {
      is_possessive_token = 0;
      if ((v44 & 0x80) == 0)
      {
LABEL_76:
        LODWORD(v48) = v44;
LABEL_79:
        if (v48 >= 3)
        {
          if (v48 < 0x34)
            v50 = 4;
          else
            v50 = 5;
          if (v48 < 0x18)
            v50 = 3;
          if (v48 < 0xB)
            v50 = 2;
          if (v48 >= 5)
            v49 = v50;
          else
            v49 = 1;
        }
        else
        {
          v49 = 0;
        }
        v212 = v42;
        if (v49 <= 2)
          v51 = 2;
        else
          v51 = v49;
        if (is_possessive_token)
          v49 = v51;
        if ((v233 & 4) != 0)
          v49 = 0;
        if (v49 >= a7)
          v49 = a7;
        v228 = v49;
        v234 = v247;
        v216 = v244;
        if ((v44 & 0x80) != 0)
        {
          v52 = *(unsigned __int16 **)v43;
          v44 = *(unsigned int *)(v43 + 8);
        }
        else
        {
          v52 = (unsigned __int16 *)v43;
        }
        if (*(char *)(v10 + 71) < 0)
        {
          v55 = v10;
          v54 = *(_QWORD *)(v10 + 48);
          v53 = *(unsigned int *)(v55 + 56);
        }
        else
        {
          v53 = *(unsigned __int8 *)(v10 + 71);
          v54 = v206;
        }
        v56 = v247;
        v230 = v53;
        if (!(_DWORD)v53 || (v56 = v247, !v52) || ((_DWORD)v44 ? (v57 = v54 == 0) : (v57 = 1), v56 = v247, v57))
        {
LABEL_269:
          v10 = v226;
          if (!*(_DWORD *)(v226 + 760))
            goto LABEL_309;
          v145 = v227;
          if (v41 == v227)
            goto LABEL_308;
          while (1)
          {
            v146 = *(_QWORD *)v41;
            if (*(_DWORD *)(*(_QWORD *)v41 + 24) > v231)
              goto LABEL_307;
            matched = skit::internal::AliasFilter::select_by_group_id(v225, *(_BYTE *)(v146 + 32), *(_BYTE *)(v146 + 33));
            if ((_DWORD)matched)
            {
              v148 = *(_DWORD *)(v226 + 760);
              if (v148)
                break;
            }
LABEL_305:
            v41 += 8;
            if (v41 == v227)
            {
              v41 = v227;
LABEL_307:
              v10 = v226;
              v56 = v247;
              v145 = v41;
LABEL_308:
              v41 = v145;
LABEL_309:
              if (v234 < v56)
              if (v216 < v244)
LABEL_313:
              v40 = v231 + 1;
              if (v231 + 1 == v208)
              {
                v170 = v247;
                v171 = v244;
                if (!(_DWORD)v244)
                  goto LABEL_357;
                v172 = 0;
                v173 = v247;
                do
                {
                  v174 = &v243[64 * v172];
                  if ((_DWORD)v170)
                  {
                    v175 = v246 + 4;
                    v176 = v170;
                    while (*(_DWORD *)v174 != *((_DWORD *)v175 - 1) || *((_DWORD *)v174 + 1) != *(_DWORD *)v175)
                    {
                      v175 += 64;
                      if (!--v176)
                        goto LABEL_321;
                    }
                  }
                  else
                  {
LABEL_321:
                    if (v173 == HIDWORD(v247))
                    {
                      skit::SmallVector<skit::SpanMatchV3,4u,true>::_reserve_more(&v246, v173 + (v173 >> 1) + 1);
                      v173 = v247;
                    }
                    skit::SpanMatchV3::SpanMatchV3((skit::SpanMatchV3 *)&v246[64 * (unint64_t)v173], (const skit::SpanMatchV3 *)v174);
                    v173 = v247 + 1;
                    LODWORD(v247) = v247 + 1;
                    v171 = v244;
                  }
                  ++v172;
                }
                while (v172 < v171);
                if (v170 >= v173)
                {
                  LODWORD(v170) = v173;
                  if (!v173)
                    goto LABEL_364;
                }
                else
                {
                  if ((_DWORD)v170)
                  {
                    v177 = 0;
                    do
                    {
                      if (v170 >= v173)
                      {
LABEL_350:
                        ++v177;
                      }
                      else
                      {
                        v178 = 0;
                        v179 = (int32x2_t *)&v246[64 * (unint64_t)v177];
                        v180 = v170;
LABEL_330:
                        v181 = v180 << 6;
                        do
                        {
                          v182 = v246;
                          v183 = &v246[v181];
                          v184 = v179->u32[1];
                          v185 = *(_DWORD *)&v246[v181];
                          if (v185 == (_DWORD)v184)
                            goto LABEL_346;
                          if (v185 > v184)
                          {
                            v186 = v223 - v184;
                            if (v223 < v184)
                              goto LABEL_383;
                            v187 = v185 - v184;
                            v188 = v224 + 2 * v184;
                            if (v186 < v187)
                              v187 = v186;
                            v249.__r_.__value_.__r.__words[0] = v188;
                            v249.__r_.__value_.__l.__size_ = v187;
                            if (!skit::is_significant((uint64_t *)&v249))
                              goto LABEL_345;
                          }
                          v189 = *(unsigned int *)&v182[v181 + 4];
                          v190 = v179->i32[0];
                          if (v179->i32[0] == (_DWORD)v189)
                            goto LABEL_346;
                          if (v190 > v189)
                          {
                            v191 = v223 - v189;
                            if (v223 < v189)
LABEL_383:
                              std::__throw_out_of_range[abi:ne180100]("string_view::substr");
                            v192 = v190 - v189;
                            v193 = v224 + 2 * v189;
                            if (v191 < v192)
                              v192 = v191;
                            v249.__r_.__value_.__r.__words[0] = v193;
                            v249.__r_.__value_.__l.__size_ = v192;
                            if (!skit::is_significant((uint64_t *)&v249))
                            {
LABEL_345:
                              v183 = &v182[v181];
LABEL_346:
                              skit::SpanMatchV3::merge((size_t)v183, v179);
                              ++v180;
                              v178 = 1;
                              if (v173 != (_DWORD)v180)
                                goto LABEL_330;
                              goto LABEL_349;
                            }
                          }
                          ++v180;
                          v181 += 64;
                        }
                        while (v173 != (_DWORD)v180);
                        if ((v178 & 1) == 0)
                          goto LABEL_350;
LABEL_349:
                        skit::SmallVector<skit::SpanMatchV3,4u,true>::erase((uint64_t)&v246, (uint64_t)&v246[64 * (unint64_t)v177]);
                        LODWORD(v170) = v170 - 1;
                        --v173;
                      }
                    }
                    while (v177 < v170);
                    v173 = v247;
                    a2 = (uint64_t)v222;
                  }
                  v194 = 126 - 2 * __clz(v173);
                  if (v173)
                    v195 = v194;
                  else
                    v195 = 0;
                  _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_118merge_prefix_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Lb0EEEvT1_SM_SG_NS_15iterator_traitsISM_E15difference_typeEb((uint64_t)v246, (unsigned int *)&v246[64 * (unint64_t)v173], v195, 1);
                  LODWORD(v170) = v247;
LABEL_357:
                  if (!(_DWORD)v170)
                  {
LABEL_364:
                    skit::SmallVector<skit::SpanMatchV3,8u,true>::~SmallVector(&v243);
                    skit::SmallVector<skit::SpanMatchV3,8u,true>::~SmallVector(&v246);
                    goto LABEL_365;
                  }
                }
                v196 = v246;
                v197 = &v246[64 * (unint64_t)v170];
                v198 = *(_DWORD *)(a2 + 56);
                do
                {
                  if (v198 == *(_DWORD *)(a2 + 60))
                  {
                    skit::SmallVector<skit::SpanMatchV3,4u,true>::_reserve_more(v211, v198 + (v198 >> 1) + 1);
                    v198 = *(_DWORD *)(a2 + 56);
                  }
                  v199 = *(_OWORD *)v196;
                  v200 = *(_QWORD *)(a2 + 48) + ((unint64_t)v198 << 6);
                  *(_OWORD *)(v200 + 12) = *(_OWORD *)(v196 + 12);
                  *(_OWORD *)v200 = v199;
                  skit::SmallVector<skit::GroupId,4u,true>::move(v200 + 32, (uint64_t)(v196 + 32));
                  *(_DWORD *)(v200 + 56) = *((_DWORD *)v196 + 14);
                  v198 = *(_DWORD *)(a2 + 56) + 1;
                  *(_DWORD *)(a2 + 56) = v198;
                  v196 += 64;
                }
                while (v196 != v197);
                goto LABEL_364;
              }
              goto LABEL_64;
            }
          }
          v149 = *(__int128 **)(v226 + 752);
          v150 = (__int128 *)((char *)v149 + 104 * v148);
          while (1)
          {
            LODWORD(matched) = skit::AliasSpanMatchCompare::operator()(matched, (unsigned __int16 *)v149, (unsigned __int16 *)v146);
            if (!(_DWORD)matched)
              goto LABEL_304;
            if (*((char *)v149 + 23) < 0)
            {
              std::basic_string<char16_t>::__init_copy_ctor_external(&v249, *(const std::basic_string<char16_t>::value_type **)v149, *((_QWORD *)v149 + 1));
            }
            else
            {
              v151 = *v149;
              v249.__r_.__value_.__r.__words[2] = *((_QWORD *)v149 + 2);
              *(_OWORD *)&v249.__r_.__value_.__l.__data_ = v151;
            }
            v152 = *((_QWORD *)v149 + 3);
            v251 = *((_WORD *)v149 + 16);
            v250 = v152;
            skit::SpanMatchV3::SpanMatchV3((skit::SpanMatchV3 *)&v252, (const skit::SpanMatchV3 *)((char *)v149 + 40));
            v153 = v247;
            if (v247 > v234)
              break;
LABEL_295:
            skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>::~AliasSpanMatchImpl((uint64_t)&v249);
            v157 = *((float *)v149 + 13);
            v159 = *(unsigned int *)(v146 + 24);
            v158 = *(unsigned int *)(v146 + 28);
            if (v159 >= v158)
            {
              v160 = 0;
            }
            else
            {
              v160 = 0;
              v161 = v158 - v159;
              v162 = (unsigned __int16 *)(*v8 + 48 * v159 + 40);
              v163 = (float *)((char *)v240 + 4 * v159);
              do
              {
                v164 = *v163++;
                v157 = v157
                     + (float)((float)(v164 * (float)(*((_DWORD *)v162 - 3) - *((_DWORD *)v162 - 4)))
                             * 0.85);
                v165 = *v162;
                v162 += 24;
                v160 += (v165 >> 2) & 1;
                --v161;
              }
              while (v161);
            }
            v166 = v247;
            if ((_DWORD)v247 == HIDWORD(v247))
            {
              skit::SmallVector<skit::SpanMatchV3,4u,true>::_reserve_more(&v246, v247 + (v247 >> 1) + 1);
              v166 = v247;
            }
            matched = (uint64_t)skit::SpanMatchV3::SpanMatchV3((skit::SpanMatchV3 *)&v246[64 * (unint64_t)v166], (const skit::SpanMatchV3 *)((char *)v149 + 40));
            v167 = v247;
            LODWORD(v247) = v247 + 1;
            v168 = *(_DWORD *)(v146 + 28) - *(_DWORD *)(v146 + 24);
            v169 = &v246[64 * v167];
            *((_DWORD *)v169 + 4) = v168;
            *((_DWORD *)v169 + 5) = v160;
            *((_DWORD *)v169 + 6) = v168;
            *((float *)v169 + 3) = v157;
LABEL_304:
            v149 = (__int128 *)((char *)v149 + 104);
            if (v149 == v150)
              goto LABEL_305;
          }
          v154 = v246;
          v155 = &v246[64 * v234];
          while (1)
          {
            v156 = *(_DWORD *)v155;
            if (*(_DWORD *)v155 == v252 && *((_DWORD *)v155 + 1) == v253)
            {
              if (HIBYTE(v251) != 8 || !*((_DWORD *)v155 + 6) && !*((_DWORD *)v155 + 2))
                goto LABEL_303;
            }
            else
            {
              if ((v156 < v252 || *((_DWORD *)v155 + 1) > v253) && (v252 < v156 || v253 > *((_DWORD *)v155 + 1)))
                goto LABEL_294;
              if (HIBYTE(v251) != 8 || *((_DWORD *)v155 + 5))
              {
LABEL_303:
                matched = skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>::~AliasSpanMatchImpl((uint64_t)&v249);
                goto LABEL_304;
              }
            }
            skit::SmallVector<skit::SpanMatchV3,4u,true>::erase((uint64_t)&v246, (uint64_t)v155);
            v154 = v246;
            v153 = v247;
LABEL_294:
            v155 += 64;
            if (v155 >= &v154[64 * (unint64_t)v153])
              goto LABEL_295;
          }
        }
        v232 = v43;
        v217 = v41;
        v218 = v44;
        v58 = (v44 + 1);
        v59 = (v53 + 1);
        v60 = (v59 * v58);
        if ((_DWORD)v60)
        {
          v61 = operator new((v59 * v58));
          v62 = v61;
          v63 = 0;
          v64 = v234;
          do
            v61[v63++] = 0;
          while (v60 != v63);
        }
        else
        {
          v62 = 0;
          v64 = v247;
        }
        v65 = v218;
        if (v58 > 1)
        {
          v66 = v59;
          for (i = 1; i != v58; ++i)
          {
            v62[v66] = i;
            v66 += v59;
          }
          v68 = (v230 + 2);
          v69 = v230 + 2;
          v70 = 1;
          while (1)
          {
            v71 = v218;
            if (v59 >= 2)
            {
              v72 = 0;
              v73 = &v62[v69];
              v74 = &v62[(v59 * v70 + 1)];
              LOBYTE(v75) = *(v74 - 1);
              LOBYTE(v76) = v74[-v68];
              v77 = &v73[-v59];
              v71 = v218;
              do
              {
                v76 = (char)v76;
                v78 = v77[v72];
                if (v52[v70 - 1] != *(unsigned __int16 *)(v54 + 2 * v72))
                  v76 = (char)v76 + 1;
                if (v77[v72] + 1 >= (char)v75 + 1)
                  v75 = (char)v75 + 1;
                else
                  v75 = v77[v72] + 1;
                if (v76 < v75)
                  v75 = v76;
                v73[v72] = v75;
                if (v75 < v71)
                  v71 = v75;
                ++v72;
                LOBYTE(v76) = v78;
              }
              while (v72 - v59 != -1);
            }
            if (v71 > (int)v228)
              break;
            ++v70;
            v69 += v59;
            if (v70 == v58)
              goto LABEL_137;
          }
          v56 = v64;
          goto LABEL_218;
        }
        LODWORD(v68) = v230 + 2;
        v71 = v218;
LABEL_137:
        v56 = v64;
        if (v59 < 2)
        {
LABEL_218:
          if (v62)
          {
            operator delete(v62);
            v56 = v247;
          }
          a2 = (uint64_t)v222;
          v8 = v210;
          v41 = v217;
          if (v234 < v56)
          {
            v116 = &v246[64 * v234];
            v117 = (_DWORD *)(v212 + 48 * v231);
            v118 = v117 + 6;
            v119 = v117 + 7;
            v120 = v117 + 11;
            while (1)
            {
              v121 = *(unsigned __int16 *)(v226 + 600);
              LODWORD(v122) = *(_DWORD *)v116;
              if (*(_WORD *)(v226 + 600))
              {
                v122 = (v122 + v121);
                v123 = (*((_DWORD *)v116 + 1) + v121);
                *(_QWORD *)v116 = v122 | (v123 << 32);
              }
              else
              {
                LODWORD(v123) = *((_DWORD *)v116 + 1);
              }
              v124 = *(_QWORD *)(v226 + 72);
              v125 = *(unsigned __int16 *)(v124 + 4 * v122);
              v126 = *(unsigned __int16 *)(v124 + 4 * v123 + 2);
              if ((v233 & 4) != 0)
              {
                v127 = *(char *)(v232 + 23) < 0 ? *(_QWORD *)(v232 + 8) : *(unsigned __int8 *)(v232 + 23);
                if (v127 != (_DWORD)v123 - (_DWORD)v122)
                  goto LABEL_265;
              }
              v128 = *((_DWORD *)v116 + 2);
              if (v128)
              {
                if (v125 < v126)
                  goto LABEL_242;
              }
              else if (v125 < v126)
              {
                v129 = 0;
                v130 = *(_QWORD *)v226 + 48 * *(unsigned __int16 *)(v124 + 4 * v122);
                v131 = (_DWORD *)(v130 + 24);
                v132 = v126 - v125;
                v133 = v130 + 28;
                do
                {
                  v134 = (_DWORD *)v133;
                  LODWORD(v133) = *(char *)(v133 - 5);
                  if ((v133 & 0x80000000) != 0)
                    v133 = *(_QWORD *)(v134 - 5);
                  else
                    LODWORD(v133) = v133;
                  v129 = v129 - *v131 + v133 + *(v134 - 1);
                  v133 = (uint64_t)(v134 + 12);
                  v131 = v134;
                  --v132;
                }
                while (v132);
                if (v129 != (_DWORD)v123 - (_DWORD)v122 && v125 < v126)
                {
LABEL_242:
                  v136 = v126 - v125;
                  v137 = (__int16 *)(*(_QWORD *)v226 + 48 * v125 + 40);
                  do
                  {
                    v138 = *v137;
                    v137 += 24;
                    if ((v138 & 4) != 0)
                      goto LABEL_265;
                  }
                  while (--v136);
                }
              }
              if (*(_BYTE *)(v226 + 602))
              {
                if (*(char *)(v232 + 23) < 0)
                  v139 = *(_QWORD *)(v232 + 8);
                else
                  LODWORD(v139) = *(unsigned __int8 *)(v232 + 23);
                skit::internal::FieldSpanMatcherImpl::align_to_token_boundaries<skit::SpanMatchV3>(*(_QWORD *)v226, v124, (unsigned int *)v116, v139);
                v140 = *((_DWORD *)v116 + 2);
                if (v140 > v228)
                {
                  if (v140 - v128 != 2)
                    goto LABEL_265;
                  if (*(char *)(v226 + 47) < 0)
                  {
                    v142 = *(_QWORD *)(v226 + 24);
                    v141 = *(_QWORD *)(v226 + 32);
                  }
                  else
                  {
                    v141 = *(unsigned __int8 *)(v226 + 47);
                    v142 = v207;
                  }
                    goto LABEL_265;
                }
              }
              else
              {
                v140 = *((_DWORD *)v116 + 2);
              }
              v143 = *v229;
              if ((*v229 & 2) != 0)
              {
                *((_DWORD *)v116 + 4) = 1;
                if ((v233 & 4) != 0)
                  *((_DWORD *)v116 + 5) = 1;
              }
              *((float *)v116 + 3) = (float)((float)(*((_DWORD *)v116 + 1) - *(_DWORD *)v116)
                                           + (float)(*((float *)v240 + v231) * (float)(*v119 - *v118)))
                                   + (float)((float)v140 * -0.5);
              if ((v143 & 8) != 0)
              {
                if (!v140)
                {
                  *((_DWORD *)v116 + 14) = 1;
                  *((_DWORD *)v116 + 2) = *v120;
                  v144 = v244;
                  if ((_DWORD)v244 == HIDWORD(v244))
                  {
                    skit::SmallVector<skit::SpanMatchV3,4u,true>::_reserve_more(&v243, v244 + (v244 >> 1) + 1);
                    v144 = v244;
                  }
                  skit::SpanMatchV3::SpanMatchV3((skit::SpanMatchV3 *)&v243[64 * (unint64_t)v144], (const skit::SpanMatchV3 *)v116);
                  LODWORD(v244) = v244 + 1;
                }
LABEL_265:
                skit::SmallVector<skit::SpanMatchV3,4u,true>::erase((uint64_t)&v246, (uint64_t)v116);
                goto LABEL_266;
              }
              v116 += 64;
LABEL_266:
              v56 = v247;
              if (v116 >= &v246[64 * (unint64_t)v247])
              {
                v37 = v224;
                v41 = v217;
                goto LABEL_269;
              }
            }
          }
          goto LABEL_269;
        }
        v79 = &v62[v59];
        v80 = &v62[(v59 * v218)];
        v215 = (uint64_t)&v52[v71 + 1];
        v81 = (~v71 + (_DWORD)v218) & ~((~v71 + (int)v218) >> 31);
        v221 = &v52[v81];
        v82 = v218;
        for (j = 1; j != v59; ++j)
        {
          if (((j & 0xF800) != 0xD800 || (j & 0xFC00) == 0xD800) && v82 >= v80[j])
            v82 = v80[j];
        }
        v214 = v71 * v68;
        v213 = 2 * v71 + 2;
        v84 = 1;
        v56 = v234;
        v220 = 2 * v218 - 2 * v81;
        v219 = (~v71 + v218) & ~((~v71 + (int)v218) >> 31);
        while (1)
        {
          if (v82 == v80[v84])
          {
            if (v84 >= v230)
            {
              if ((_DWORD)v81 != v65)
                goto LABEL_154;
            }
            else if (((*(_WORD *)(v54 + 2 * v84) & 0xFC00) == 0xD800 || (*(_WORD *)(v54 + 2 * v84) & 0xF800) != 55296)
                   && (_DWORD)v81 != v65)
            {
LABEL_154:
              v87 = v220;
              v88 = v221;
              while (*(unsigned __int16 *)(v54 + 2 * v84 - 2) != *v88)
              {
                ++v88;
                v87 -= 2;
                if (!v87)
                  goto LABEL_212;
              }
              v89 = ((_DWORD)v84 - v65 + v82) & ~(((int)v84 - v65 + v82) >> 31);
              v90 = v89 + 1;
              if (v90 + v214 <= v90)
              {
                v91 = 0;
                v93 = v215;
                v94 = v213;
              }
              else
              {
                v91 = 0;
                v92 = v89 + 1;
                v93 = v215;
                v94 = v213;
                do
                {
                  v91 += v79[v92];
                  v92 += v68;
                }
                while (v92 < (int)v89 + 1 + v214);
              }
              v95 = (v84 - (v82 + v218)) & ~(((int)v84 - (v82 + (int)v218)) >> 31);
              if (v89 > v95)
              {
                v96 = v95 + 1;
                v97 = v89 + 1;
                do
                {
                  v98 = *(unsigned __int16 *)(v54 + 2 * (v97 - 2));
                  if ((v98 & 0xF800) != 0xD800 || (v98 & 0xFC00) == 55296)
                  {
                    v100 = v79[v89];
                    v101 = v79[v90];
                    if (v100 >= v101)
                    {
                      v103 = v100 != v101 || v93 == (_QWORD)v52;
                      v104 = v94;
                      v105 = v52;
                      if (!v103)
                      {
                        while (v98 != *v105)
                        {
                          ++v105;
                          v104 -= 2;
                          if (!v104)
                            goto LABEL_191;
                        }
                        if (v90 + v214 <= v90)
                        {
                          v106 = 0;
                        }
                        else
                        {
                          v106 = 0;
                          v107 = v90;
                          do
                          {
                            v106 += v79[v107];
                            v107 += v68;
                          }
                          while (v107 < v90 + v214);
                        }
                        if (v106 < v91)
                        {
                          v90 = v89;
                          v91 = v106;
                        }
                      }
                    }
                    else
                    {
                      if (v214 + (int)v89 <= v89)
                      {
                        v91 = 0;
                      }
                      else
                      {
                        v91 = 0;
                        v102 = v89;
                        do
                        {
                          v91 += v79[v102];
                          v102 += v68;
                        }
                        while (v102 < v214 + (int)v89);
                      }
                      v90 = v89;
                    }
                  }
LABEL_191:
                  v97 = v89;
                }
                while (v89-- > v96);
              }
              v109 = v90 - 1;
              if ((*(_WORD *)(v54 + 2 * v109) & 0xF800) != 0xD800
                || (*(_WORD *)(v54 + 2 * v109) & 0xFC00) == 55296)
              {
                if (v84 >= v230
                  || (v111 = *(_WORD *)(v54 + 2 * v84), (v111 & 0xF800) != 0xD800)
                  || (v111 & 0xFC00) == 0xD800)
                {
                  v112 = v234;
                  if ((_DWORD)v234 != v56)
                  {
                    v113 = v246;
                    v114 = &v246[64 * v234];
                    v112 = v56;
                    do
                    {
                      if (*(_DWORD *)v114 >= v109 && v84 >= *((unsigned int *)v114 + 1))
                      {
                        skit::SmallVector<skit::SpanMatchV3,4u,true>::erase((uint64_t)&v246, (uint64_t)v114);
                        LODWORD(v81) = v219;
                        v80 = &v62[(v59 * v218)];
                        v113 = v246;
                        v112 = v247;
                      }
                      else
                      {
                        v114 += 64;
                      }
                    }
                    while (v114 != &v113[64 * (unint64_t)v112]);
                  }
                  if (v112 == HIDWORD(v247))
                  {
                    skit::SmallVector<skit::SpanMatchV3,4u,true>::_reserve_more(&v246, v112 + (v112 >> 1) + 1);
                    v65 = v218;
                    v112 = v247;
                    LODWORD(v81) = v219;
                    v80 = &v62[(v59 * v218)];
                  }
                  else
                  {
                    v65 = v218;
                  }
                  v115 = &v246[64 * (unint64_t)v112];
                  *(_QWORD *)v115 = v109 | (v84 << 32);
                  *((_DWORD *)v115 + 2) = v82;
                  *((float *)v115 + 3) = (float)(v84 - (v109 + v82));
                  *((_QWORD *)v115 + 2) = 0;
                  *((_DWORD *)v115 + 6) = 0;
                  *((_QWORD *)v115 + 4) = v115 + 48;
                  *((_QWORD *)v115 + 5) = 0x400000000;
                  *((_DWORD *)v115 + 14) = 0;
                  v56 = v247 + 1;
                  LODWORD(v247) = v247 + 1;
                }
              }
              v37 = v224;
            }
          }
LABEL_212:
          if (++v84 == v59)
            goto LABEL_218;
        }
      }
    }
    v48 = *(_QWORD *)(v43 + 8);
    goto LABEL_79;
  }
LABEL_365:
  v201 = *(_DWORD *)(a2 + 56);
  if (v201)
  {
    v202 = 0;
    do
    {
      if (v202)
      {
        v203 = 0;
        v204 = &(*v211)[64 * (unint64_t)v202];
        v205 = *v211 + 4;
        while (*(_DWORD *)v204 < *(v205 - 1) || *((_DWORD *)v204 + 1) > *v205)
        {
          ++v203;
          v205 += 16;
          if (v202 == v203)
          {
            LODWORD(v203) = v202;
            goto LABEL_375;
          }
        }
        skit::SmallVector<skit::SpanMatchV3,4u,true>::erase((uint64_t)v211, (uint64_t)v204);
        v201 = *(_DWORD *)(a2 + 56);
      }
      else
      {
        LODWORD(v203) = 0;
      }
LABEL_375:
      if ((_DWORD)v203 == v202)
        ++v202;
    }
    while (v202 < v201);
  }
  if (v240 != v242)
    free(v240);
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)v235);
  if (v237 != v239)
    free(v237);
}

void sub_1CB753C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,void *a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void *a65;

  skit::SmallVector<skit::SpanMatchV3,8u,true>::~SmallVector((char **)&STACK[0x210]);
  skit::SmallVector<skit::SpanMatchV3,8u,true>::~SmallVector((char **)&STACK[0x420]);
  if (a65 != a9)
    free(a65);
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)&a43);
  if (a55 != a10)
    free(a55);
  _Unwind_Resume(a1);
}

size_t skit::SmallVector<float,16u,false>::_reserve_more(uint64_t a1, unsigned int a2)
{
  _DWORD *v3;
  _DWORD *v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  int *v9;
  int v10;
  size_t result;
  std::bad_alloc *exception;
  std::bad_alloc *v13;

  v3 = malloc_type_malloc(4 * a2, 0x100004052888210uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v13 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v13, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
  }
  v4 = v3;
  v5 = *(int **)a1;
  v6 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v6)
  {
    v7 = 4 * v6;
    v8 = v4;
    v9 = *(int **)a1;
    do
    {
      v10 = *v9++;
      *v8++ = v10;
      v7 -= 4;
    }
    while (v7);
  }
  if (v5 != (int *)(a1 + 16))
    free(v5);
  *(_QWORD *)a1 = v4;
  result = malloc_size(v4);
  *(_DWORD *)(a1 + 12) = result >> 2;
  return result;
}

uint64_t skit::internal::murmur_32_scramble(skit::internal *this)
{
  return 461845907 * ((380141568 * (_DWORD)this) | ((-862048943 * (_DWORD)this) >> 17));
}

uint64_t skit::internal::murmur3_32(skit::internal *this, unint64_t a2, int a3)
{
  unint64_t v3;
  skit::internal *v4;
  int v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  unsigned int v9;
  unsigned int v10;

  if (a2 >= 4)
  {
    v3 = a2 >> 2;
    v4 = this;
    do
    {
      v5 = *(_DWORD *)v4;
      v4 = (skit::internal *)((char *)v4 + 4);
      HIDWORD(v6) = (461845907 * ((380141568 * v5) | ((-862048943 * v5) >> 17))) ^ a3;
      LODWORD(v6) = HIDWORD(v6);
      a3 = 5 * (v6 >> 19) - 430675100;
      --v3;
    }
    while (v3);
    this = (skit::internal *)((char *)this + (a2 & 0xFFFFFFFFFFFFFFFCLL));
  }
  v7 = 0;
  v8 = a2 & 3;
  if ((a2 & 3) != 0)
  {
    do
      v7 = *((unsigned __int8 *)this + --v8) | (v7 << 8);
    while (v8);
  }
  v9 = a3 ^ a2 ^ (461845907 * ((380141568 * v7) | ((-862048943 * v7) >> 17)));
  v10 = -1028477387 * ((-2048144789 * (v9 ^ HIWORD(v9))) ^ ((-2048144789 * (v9 ^ HIWORD(v9))) >> 13));
  return v10 ^ HIWORD(v10);
}

_QWORD *skit::internal::IndexDiskImplV2::to_posting_list(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a2
    && (v2 = *(unsigned __int16 *)(a2 + 4), v3 = *(_DWORD *)a2 - 2 * v2 - 8, v3 >= 0x10)
    && (v4 = a2 + 6,
        v5 = a2 + 6 + 2 * v2,
        v6 = *(unsigned int *)(v5 + 10),
        (8 * v6) + (unint64_t)(6 * *(_DWORD *)(v5 + 14)) + 16 == v3))
  {
    v7 = v5 + 2;
    v8 = v5 + 18;
    v9 = v8 + 8 * v6;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v4 = 0;
    v2 = 0;
  }
  *result = v4;
  result[1] = v2;
  result[2] = v7;
  result[3] = v8;
  result[4] = v9;
  return result;
}

uint64_t skit::internal::IndexDiskImplV2::open(skit::internal::IndexDiskImplV2 *this)
{
  const char *v2;
  const std::string::value_type **v3;
  std::string::size_type v4;
  _QWORD *v5;
  std::string *v6;
  void *v7;
  void *v8;
  char v9;
  unint64_t v11;
  _DWORD *v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  const char **v16;
  const char *v17;
  uint64_t v18;
  _BOOL4 v19;
  size_t v20;
  const char *v21;
  int v22;
  int v23;
  _DWORD *mmap;
  std::error_code *v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  unsigned int v29;
  std::string *v30;
  NSObject *v31;
  const char *v32;
  int v33;
  int v34;
  _DWORD *v35;
  _DWORD *v36;
  unsigned int v37;
  int v38;
  unsigned int v39;
  unsigned int v40;
  int v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  int v48;
  int v49;
  uint64_t v50;
  const char *v51;
  NSObject *v52;
  uint32_t v53;
  NSObject *v54;
  stat *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  NSObject *v60;
  uint32_t v61;
  uint64_t v62;
  int v63;
  __darwin_ino64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  int v68;
  int v69;
  int v70;
  uint64_t v71;
  unsigned int v72;
  uint64_t v73;
  int v74;
  uid_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  NSObject *v79;
  int v80;
  char *v81;
  int *v82;
  char *v83;
  int v84;
  NSObject *v85;
  const std::__fs::filesystem::path *v86;
  NSObject *v87;
  stat *v88;
  NSObject *v89;
  NSObject *v90;
  char *v91;
  NSObject *v92;
  uint64_t v93;
  int v94;
  int v95;
  uint64_t v96;
  int v97;
  int v98;
  int v99;
  char *v100;
  int *v101;
  char *v102;
  int v103;
  int v104;
  char *v105;
  int *v106;
  char *v107;
  int v108;
  int v109;
  char *v110;
  int *v111;
  char *v112;
  int v113;
  char *v114;
  uint64_t v115;
  std::string v116;
  std::string v117;
  _DWORD *v118;
  off_t st_size;
  int v120;
  _BYTE buf[22];
  __int16 v122;
  uint64_t v123;
  stat v124;
  uint64_t v125;

  v125 = *MEMORY[0x1E0C80C00];
  if (!skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::open((uint64_t)this))
  {
    v3 = (const std::string::value_type **)((char *)this + 168);
    if (*((char *)this + 191) < 0)
    {
      v4 = *((_QWORD *)this + 22);
      if (!v4)
        goto LABEL_68;
      std::string::__init_copy_ctor_external((std::string *)&v124, *v3, v4);
    }
    else
    {
      if (!*((_BYTE *)this + 191))
        goto LABEL_68;
      *(_OWORD *)&v124.st_dev = *(_OWORD *)v3;
      *(_QWORD *)&v124.st_uid = *((_QWORD *)this + 23);
    }
    std::string::append[abi:ne180100]<char const*,0>((std::string *)&v124, (std::string *)".ms", (std::string *)"");
    if (SHIBYTE(v124.st_gid) < 0)
    {
      std::string::__init_copy_ctor_external(&v117, *(const std::string::value_type **)&v124.st_dev, v124.st_ino);
      if (SHIBYTE(v124.st_gid) < 0)
        operator delete(*(void **)&v124.st_dev);
    }
    else
    {
      *(_OWORD *)&v117.__r_.__value_.__l.__data_ = *(_OWORD *)&v124.st_dev;
      v117.__r_.__value_.__r.__words[2] = *(_QWORD *)&v124.st_uid;
    }
    if (*((char *)this + 191) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v124, *((const std::string::value_type **)this + 21), *((_QWORD *)this + 22));
    }
    else
    {
      *(_OWORD *)&v124.st_dev = *(_OWORD *)v3;
      *(_QWORD *)&v124.st_uid = *((_QWORD *)this + 23);
    }
    std::string::append[abi:ne180100]<char const*,0>((std::string *)&v124, (std::string *)".ids", (std::string *)"");
    if (SHIBYTE(v124.st_gid) < 0)
    {
      std::string::__init_copy_ctor_external(&v116, *(const std::string::value_type **)&v124.st_dev, v124.st_ino);
      if (SHIBYTE(v124.st_gid) < 0)
        operator delete(*(void **)&v124.st_dev);
    }
    else
    {
      *(_OWORD *)&v116.__r_.__value_.__l.__data_ = *(_OWORD *)&v124.st_dev;
      v116.__r_.__value_.__r.__words[2] = *(_QWORD *)&v124.st_uid;
    }
    v5 = (_QWORD *)((char *)this + 192);
    if ((v117.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v6 = &v117;
    else
      v6 = (std::string *)v117.__r_.__value_.__r.__words[0];
    if (skit::internal::MmapFile::open((size_t *)this + 24, (const char *)v6, 2, -1, 0, 0x1A0u, 3, 1025, 5, 0xFFFFFFFFFFFFFFFFLL, 0))goto LABEL_23;
    v11 = *((_QWORD *)this + 25);
    if (v11 > 0x2F)
    {
      v12 = (_DWORD *)*v5;
      if (*(_DWORD *)*v5 != 621942338)
      {
        if (skit::internal::get_logging_context(void)::once != -1)
        v59 = skit::internal::get_logging_context(void)::logger;
        if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
          goto LABEL_23;
        LOWORD(v124.st_dev) = 0;
        v58 = "MetaStoreHeader::validate_ms : meta store cookie is not magic";
        v60 = v59;
        v61 = 2;
        goto LABEL_153;
      }
      v13 = v12[3];
      if (*((_QWORD *)v12 + 5) - *((_QWORD *)v12 + 4) != v13)
      {
        if (skit::internal::get_logging_context(void)::once != -1)
        v62 = skit::internal::get_logging_context(void)::logger;
        if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
          goto LABEL_23;
        v63 = v12[3];
        v64 = *((_QWORD *)v12 + 4);
        v65 = *((_QWORD *)v12 + 5);
        v124.st_dev = 67109632;
        *(_DWORD *)&v124.st_mode = v63;
        LOWORD(v124.st_ino) = 2048;
        *(__darwin_ino64_t *)((char *)&v124.st_ino + 2) = v64;
        HIWORD(v124.st_uid) = 2048;
        *(_QWORD *)&v124.st_gid = v65;
        v58 = "MetaStoreHeader::validate : meta store delete count is greater than records count : %u != [%lli,%lli)";
        v60 = v62;
        v61 = 28;
        goto LABEL_153;
      }
      if (v12[4] > v13)
      {
        if (skit::internal::get_logging_context(void)::once != -1)
        v66 = skit::internal::get_logging_context(void)::logger;
        if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
          goto LABEL_23;
        v68 = v12[3];
        v67 = v12[4];
        v124.st_dev = 67109376;
        *(_DWORD *)&v124.st_mode = v67;
        LOWORD(v124.st_ino) = 1024;
        *(_DWORD *)((char *)&v124.st_ino + 2) = v68;
        v58 = "MetaStoreHeader::validate : meta store delete count is greater than records count : %u > %u";
      }
      else
      {
        v14 = v12[7];
        if (v14 <= v13)
        {
          if ((_DWORD)v13)
            v15 = 10 * v13 + 48;
          else
            v15 = 0;
          if (v11 == v15)
          {
            *((_QWORD *)this + 26) = v12 + 12;
            if (!v14)
              goto LABEL_59;
            v16 = (const char **)((char *)this + 240);
            v17 = (char *)this + 240;
            if (*((char *)this + 263) < 0)
              v17 = *v16;
            if (access(v17, 0))
            {
              if (*__error() == 2)
              {
                v18 = ((*((_QWORD *)this + 35) - 16) / 0x150uLL);
                v19 = (*((_QWORD *)this + 35) - 16) / 0x150uLL != 0;
                *((_DWORD *)this + 66) = 4;
                *((_WORD *)this + 134) = 416;
                if (v18)
                  v20 = 352;
                else
                  v20 = 16;
                if (*((char *)this + 263) >= 0)
                  v21 = (char *)this + 240;
                else
                  v21 = (const char *)*((_QWORD *)this + 30);
                v22 = open_dprotected_np(v21, 514, 4, 0, 416);
                v23 = v22;
                if (v22 < 0)
                {
                  if (skit::internal::get_logging_context(void)::once != -1)
                  v79 = skit::internal::get_logging_context(void)::logger;
                  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                  {
                    v80 = *((char *)this + 263);
                    v81 = (char *)*((_QWORD *)this + 30);
                    v82 = __error();
                    if (v80 >= 0)
                      v83 = (char *)this + 240;
                    else
                      v83 = v81;
                    v84 = *v82;
                    *(_DWORD *)buf = 136446466;
                    *(_QWORD *)&buf[4] = v83;
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = v84;
                    _os_log_error_impl(&dword_1CB748000, v79, OS_LOG_TYPE_ERROR, "FlatSetDisk::create_file : file open failed @ %{public}s : %{darwin.errno}d", buf, 0x12u);
                  }
                }
                else
                {
                  if (ftruncate(v22, v20))
                  {
                    if (skit::internal::get_logging_context(void)::once != -1)
                    v85 = skit::internal::get_logging_context(void)::logger;
                    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                    {
                      v99 = *((char *)this + 263);
                      v100 = (char *)*((_QWORD *)this + 30);
                      v101 = __error();
                      if (v99 >= 0)
                        v102 = (char *)this + 240;
                      else
                        v102 = v100;
                      v103 = *v101;
                      *(_DWORD *)buf = 136446466;
                      *(_QWORD *)&buf[4] = v102;
                      *(_WORD *)&buf[12] = 1024;
                      *(_DWORD *)&buf[14] = v103;
                      _os_log_error_impl(&dword_1CB748000, v85, OS_LOG_TYPE_ERROR, "FlatSetDisk::create_file : file resize failed @ %{public}s : %{darwin.errno}d", buf, 0x12u);
                    }
                    close(v23);
                  }
                  else
                  {
                    mmap = skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::create_mmap((uint64_t)this + 216, v23, v20);
                    v26 = (uint64_t)mmap;
                    if (mmap)
                    {
                      *mmap = (unint64_t)(mmap + 4) >> 12;
                      mmap[1] = v19;
                      *((_QWORD *)mmap + 1) = 0xF00000000;
                      v27 = 16 * (v18 != 0);
                      memset(mmap + 4, 128, v27);
                      *(_BYTE *)(v26 + 16 + v27 - 1) = -1;
                      *(_QWORD *)buf = 0;
                      *(_QWORD *)&buf[8] = v20;
                      *(_QWORD *)&v124.st_dev = v26;
                      v124.st_ino = v20;
                      v124.st_uid = 0;
                      std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)buf, 0);
                      *(_QWORD *)&v124.st_dev = 0;
                      std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)this + 224, v26);
                      *((_QWORD *)this + 29) = v20;
                      v28 = *((_QWORD *)this + 28);
                      std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)&v124, 0);
                      if (!v28)
                        goto LABEL_23;
LABEL_57:
                      v12 = (_DWORD *)*((_QWORD *)this + 24);
                      v29 = *(_DWORD *)(*((_QWORD *)this + 28) + 8);
                      if (v12[3] < v29 || v12[7] < v29)
                      {
LABEL_23:
                        v7 = (void *)*((_QWORD *)this + 36);
                        if (v7)
                          munmap(v7, *((_QWORD *)this + 37));
                        *((_QWORD *)this + 36) = 0;
                        *((_QWORD *)this + 37) = 0;
                        std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)this + 224, 0);
                        v8 = (void *)*((_QWORD *)this + 24);
                        if (v8)
                          munmap(v8, *((_QWORD *)this + 25));
                        v9 = 0;
                        *v5 = 0;
                        v5[1] = 0;
                        goto LABEL_28;
                      }
LABEL_59:
                      if (v12[6])
                      {
                        v30 = (v116.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                            ? &v116
                            : (std::string *)v116.__r_.__value_.__r.__words[0];
                        if ((skit::internal::MmapFile::open((size_t *)this + 36, (const char *)v30, 2, -1, 0, 0x1A0u, 3, 1025, 5, 0xFFFFFFFFFFFFFFFFLL, 0) & 0x80000000) != 0|| *((_QWORD *)this + 36)&& *((_QWORD *)this + 37) != *(_DWORD *)(*((_QWORD *)this + 24) + 24))
                        {
                          goto LABEL_23;
                        }
                      }
                      v9 = 1;
LABEL_28:
                      if (SHIBYTE(v116.__r_.__value_.__r.__words[2]) < 0)
                        operator delete(v116.__r_.__value_.__l.__data_);
                      if (SHIBYTE(v117.__r_.__value_.__r.__words[2]) < 0)
                      {
                        operator delete(v117.__r_.__value_.__l.__data_);
                        if ((v9 & 1) != 0)
                          return 0;
                      }
                      else if ((v9 & 1) != 0)
                      {
                        return 0;
                      }
LABEL_68:
                      v2 = "meta store";
                      goto LABEL_69;
                    }
                  }
                  if (*((char *)this + 263) >= 0)
                    v86 = (const std::__fs::filesystem::path *)((char *)this + 240);
                  else
                    v86 = (const std::__fs::filesystem::path *)*((_QWORD *)this + 30);
                  remove(v86, v25);
                }
                *(_QWORD *)buf = 0;
                *(_QWORD *)&buf[8] = 0;
                *(_OWORD *)&v124.st_dev = 0uLL;
                v124.st_uid = -1;
                std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)buf, 0);
                v55 = &v124;
                goto LABEL_116;
              }
              if (skit::internal::get_logging_context(void)::once != -1)
              v77 = skit::internal::get_logging_context(void)::logger;
              if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                goto LABEL_23;
              if (*((char *)this + 263) < 0)
                v16 = (const char **)*v16;
              v78 = *__error();
              v124.st_dev = 136446466;
              *(_QWORD *)&v124.st_mode = v16;
              WORD2(v124.st_ino) = 1024;
              *(_DWORD *)((char *)&v124.st_ino + 6) = v78;
              v58 = "FlatSetDisk::open : stat failed @ %{public}s : %{darwin.errno}d";
              v60 = v77;
              v61 = 18;
LABEL_153:
              _os_log_error_impl(&dword_1CB748000, v60, OS_LOG_TYPE_ERROR, v58, (uint8_t *)&v124, v61);
              goto LABEL_23;
            }
            if (*((char *)this + 263) >= 0)
              v32 = (char *)this + 240;
            else
              v32 = (const char *)*((_QWORD *)this + 30);
            v33 = open_dprotected_np(v32, 2, -1, 0);
            v34 = v33;
            if (v33 < 0)
            {
              if (skit::internal::get_logging_context(void)::once != -1)
              v87 = skit::internal::get_logging_context(void)::logger;
              if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
              {
                v104 = *((char *)this + 263);
                v105 = (char *)*((_QWORD *)this + 30);
                v106 = __error();
                if (v104 >= 0)
                  v107 = (char *)this + 240;
                else
                  v107 = v105;
                v108 = *v106;
                v124.st_dev = 136446466;
                *(_QWORD *)&v124.st_mode = v107;
                WORD2(v124.st_ino) = 1024;
                *(_DWORD *)((char *)&v124.st_ino + 6) = v108;
                _os_log_error_impl(&dword_1CB748000, v87, OS_LOG_TYPE_ERROR, "FlatSetDisk::open_existing_file : file open failed @ %{public}s : %{darwin.errno}d", (uint8_t *)&v124, 0x12u);
              }
              *(_OWORD *)&v124.st_dev = 0uLL;
              v118 = 0;
              st_size = 0;
              v120 = -1;
              v88 = &v124;
            }
            else
            {
              memset(&v124, 0, sizeof(v124));
              if (fstat(v33, &v124))
              {
                if (skit::internal::get_logging_context(void)::once != -1)
                v89 = skit::internal::get_logging_context(void)::logger;
                if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                {
                  v109 = *((char *)this + 263);
                  v110 = (char *)*((_QWORD *)this + 30);
                  v111 = __error();
                  if (v109 >= 0)
                    v112 = (char *)this + 240;
                  else
                    v112 = v110;
                  v113 = *v111;
                  *(_DWORD *)buf = 136446466;
                  *(_QWORD *)&buf[4] = v112;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = v113;
                  _os_log_error_impl(&dword_1CB748000, v89, OS_LOG_TYPE_ERROR, "FlatSetDisk::open_existing_file : fstat failed @ %{public}s : %{darwin.errno}d", buf, 0x12u);
                }
                close(v34);
              }
              else
              {
                *((_DWORD *)this + 66) = fcntl(v34, 63);
                *((_WORD *)this + 134) = v124.st_mode & 0x1FF;
                v35 = skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::create_mmap((uint64_t)this + 216, v34, v124.st_size);
                v36 = v35;
                if (v35)
                {
                  if (v124.st_size <= 351)
                  {
                    if (skit::internal::get_logging_context(void)::once != -1)
                    v90 = skit::internal::get_logging_context(void)::logger;
                    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                    {
                      if (*((char *)this + 263) >= 0)
                        v91 = (char *)this + 240;
                      else
                        v91 = (char *)*((_QWORD *)this + 30);
                      *(_DWORD *)buf = 136446722;
                      *(_QWORD *)&buf[4] = v91;
                      *(_WORD *)&buf[12] = 2048;
                      *(_QWORD *)&buf[14] = v124.st_size;
                      v122 = 2048;
                      v123 = 352;
                      _os_log_error_impl(&dword_1CB748000, v90, OS_LOG_TYPE_ERROR, "FlatSetDisk::open_existing_file : file size is too small @ %{public}s : %lli < %lli", buf, 0x20u);
                    }
                  }
                  else
                  {
                    if (v124.st_size == 336 * v35[1] + 16)
                    {
                      *(_QWORD *)buf = 0;
                      *(_QWORD *)&buf[8] = v124.st_size;
                      v118 = v35;
                      st_size = v124.st_size;
                      v120 = 0;
                      std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)buf, 0);
                      if ((v36[3] - 16) <= 0xFFFFFFF0)
                      {
                        if (skit::internal::get_logging_context(void)::once != -1)
                        v93 = skit::internal::get_logging_context(void)::logger;
                        if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_114;
                        v94 = v36[3];
                        *(_QWORD *)&v124.st_dev = 0xF04000200;
                        LOWORD(v124.st_ino) = 1024;
                        *(_DWORD *)((char *)&v124.st_ino + 2) = v94;
                        v51 = "FlatSetImpl::verify : invalid max load : [1,%u] %u";
                      }
                      else
                      {
                        v37 = v36[2];
                        v38 = 16 * v36[1];
                        v39 = v38 - 1;
                        if (v37 < v38 - 1)
                        {
                          if (*((unsigned __int8 *)v36 + v39 + 16) != 255)
                          {
                            if (skit::internal::get_logging_context(void)::once != -1)
                            v96 = skit::internal::get_logging_context(void)::logger;
                            if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_114;
                            v124.st_dev = 67109120;
                            *(_DWORD *)&v124.st_mode = v39;
                            v51 = "FlatSetImpl::verify : sentinel marker not found : %u";
                            v52 = v96;
                            v53 = 8;
                            goto LABEL_112;
                          }
                          v40 = 0;
                          v41 = 0;
                          v42 = 0;
                          v43 = 0;
                          v44 = -15 - (v38 - 16);
LABEL_86:
                          v45 = 0;
                          v46 = 16;
                          v47 = -1;
                          while (1)
                          {
                            v48 = *((char *)&v36[v40 / 4 + 4] + v45);
                            if (v48 == -128)
                            {
                              ++v41;
                              if ((int)v45 < v46)
                                v46 = v45;
                              goto LABEL_100;
                            }
                            if (v48 == -2)
                              break;
                            v49 = v40 + v45;
                            if (v48 != -1)
                            {
                              if (v48 < 0)
                              {
                                if (skit::internal::get_logging_context(void)::once != -1)
                                v50 = skit::internal::get_logging_context(void)::logger;
                                if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_114;
                                v124.st_dev = 67109376;
                                *(_DWORD *)&v124.st_mode = v49;
                                LOWORD(v124.st_ino) = 1024;
                                *(_DWORD *)((char *)&v124.st_ino + 2) = v39;
                                v51 = "FlatSetImpl::verify : invalid ctrl marker : %u of %u";
LABEL_110:
                                v52 = v50;
                                goto LABEL_111;
                              }
                              ++v43;
                              goto LABEL_98;
                            }
                            if (v44 + v40 + v45)
                            {
                              if (skit::internal::get_logging_context(void)::once != -1)
                              v50 = skit::internal::get_logging_context(void)::logger;
                              if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_114;
                              v124.st_dev = 67109376;
                              *(_DWORD *)&v124.st_mode = v49;
                              LOWORD(v124.st_ino) = 1024;
                              *(_DWORD *)((char *)&v124.st_ino + 2) = v39;
                              v51 = "FlatSetImpl::verify : bad sentinel marker found : %u of %u";
                              goto LABEL_110;
                            }
LABEL_100:
                            if (++v45 == 16)
                            {
                              if (v47 < v46)
                              {
                                v40 += 16;
                                if (v40 < v39)
                                  goto LABEL_86;
                                if (v43 == v37)
                                {
                                  if (v42 + v37 + v41 == v39)
                                  {
                                    v118 = 0;
                                    std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)this + 224, (uint64_t)v36);
                                    *((_QWORD *)this + 29) = st_size;
                                    std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)&v118, 0);
                                    goto LABEL_57;
                                  }
                                  v97 = v36[2];
                                  if (skit::internal::get_logging_context(void)::once != -1)
                                  v93 = skit::internal::get_logging_context(void)::logger;
                                  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                                  {
LABEL_217:
                                    v98 = v36[2];
                                    v124.st_dev = 67109376;
                                    *(_DWORD *)&v124.st_mode = v97;
                                    LOWORD(v124.st_ino) = 1024;
                                    *(_DWORD *)((char *)&v124.st_ino + 2) = v98;
                                    v51 = "FlatSetImpl::verify : invalid header entry count : %u != %u";
                                    goto LABEL_209;
                                  }
                                }
                                else
                                {
                                  v97 = v43;
                                  if (skit::internal::get_logging_context(void)::once != -1)
                                  v93 = skit::internal::get_logging_context(void)::logger;
                                  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                                  {
                                    goto LABEL_217;
                                  }
                                }
LABEL_114:
                                v54 = skit::internal::get_logging_context(void)::logger;
                                if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                                {
                                  if (*((char *)this + 263) < 0)
                                    v16 = (const char **)*v16;
                                  v124.st_dev = 136446210;
                                  *(_QWORD *)&v124.st_mode = v16;
                                  _os_log_error_impl(&dword_1CB748000, v54, OS_LOG_TYPE_ERROR, "FlatSetDisk::open : verification failed for @ %{public}s", (uint8_t *)&v124, 0xCu);
                                }
LABEL_115:
                                v55 = (stat *)&v118;
LABEL_116:
                                std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)v55, 0);
                                goto LABEL_23;
                              }
                              v74 = v47;
                              v75 = v46;
                              if (skit::internal::get_logging_context(void)::once != -1)
                              v76 = skit::internal::get_logging_context(void)::logger;
                              if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_114;
                              v124.st_dev = 67109632;
                              *(_DWORD *)&v124.st_mode = v40;
                              LOWORD(v124.st_ino) = 1024;
                              *(_DWORD *)((char *)&v124.st_ino + 2) = v74;
                              HIWORD(v124.st_ino) = 1024;
                              v124.st_uid = v75;
                              v51 = "FlatSetImpl::verify : invalid empty slot found in bucket %u : %u >= %u";
                              v52 = v76;
                              v53 = 20;
LABEL_112:
                              _os_log_error_impl(&dword_1CB748000, v52, OS_LOG_TYPE_ERROR, v51, (uint8_t *)&v124, v53);
                              if (skit::internal::get_logging_context(void)::once != -1)
                              goto LABEL_114;
                            }
                          }
                          ++v42;
LABEL_98:
                          if (v47 <= (int)v45)
                            v47 = v45;
                          goto LABEL_100;
                        }
                        if (skit::internal::get_logging_context(void)::once != -1)
                        v93 = skit::internal::get_logging_context(void)::logger;
                        if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_114;
                        v95 = v36[2];
                        v124.st_dev = 67109376;
                        *(_DWORD *)&v124.st_mode = v95;
                        LOWORD(v124.st_ino) = 1024;
                        *(_DWORD *)((char *)&v124.st_ino + 2) = v39;
                        v51 = "FlatSetImpl::verify : entry count is greater than available slots : %u > %u";
                      }
LABEL_209:
                      v52 = v93;
LABEL_111:
                      v53 = 14;
                      goto LABEL_112;
                    }
                    if (skit::internal::get_logging_context(void)::once != -1)
                    v92 = skit::internal::get_logging_context(void)::logger;
                    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                    {
                      if (*((char *)this + 263) >= 0)
                        v114 = (char *)this + 240;
                      else
                        v114 = (char *)*((_QWORD *)this + 30);
                      v115 = (336 * v36[1] + 16);
                      *(_DWORD *)buf = 136446722;
                      *(_QWORD *)&buf[4] = v114;
                      *(_WORD *)&buf[12] = 2048;
                      *(_QWORD *)&buf[14] = v124.st_size;
                      v122 = 2048;
                      v123 = v115;
                      _os_log_error_impl(&dword_1CB748000, v92, OS_LOG_TYPE_ERROR, "FlatSetDisk::open_existing_file : file size does not match expected file size @ %{public}s : %lli != %lu", buf, 0x20u);
                    }
                    munmap(v36, v124.st_size);
                  }
                }
              }
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = 0;
              v118 = 0;
              st_size = 0;
              v120 = -1;
              v88 = (stat *)buf;
            }
            std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)v88, 0);
            goto LABEL_115;
          }
          if (skit::internal::get_logging_context(void)::once != -1)
          v56 = skit::internal::get_logging_context(void)::logger;
          if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
            goto LABEL_23;
          v71 = *((_QWORD *)this + 25);
          v72 = *(_DWORD *)(*((_QWORD *)this + 24) + 12);
          if (v72)
            v73 = 10 * v72 + 48;
          else
            v73 = 0;
          v124.st_dev = 134218240;
          *(_QWORD *)&v124.st_mode = v71;
          WORD2(v124.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v124.st_ino + 6) = v73;
          v58 = "DiskMetaStore::open : meta store file size does not match the expected size : %lu != %lu";
LABEL_152:
          v60 = v56;
          v61 = 22;
          goto LABEL_153;
        }
        if (skit::internal::get_logging_context(void)::once != -1)
        v66 = skit::internal::get_logging_context(void)::logger;
        if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
          goto LABEL_23;
        v69 = v12[7];
        v70 = v12[3];
        v124.st_dev = 67109376;
        *(_DWORD *)&v124.st_mode = v69;
        LOWORD(v124.st_ino) = 1024;
        *(_DWORD *)((char *)&v124.st_ino + 2) = v70;
        v58 = "MetaStoreHeader::validate : meta store xid count is greater than records count : %u > %u";
      }
      v60 = v66;
      v61 = 14;
      goto LABEL_153;
    }
    if (skit::internal::get_logging_context(void)::once != -1)
    v56 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    v57 = *((_QWORD *)this + 25);
    v124.st_dev = 134218240;
    *(_QWORD *)&v124.st_mode = v57;
    WORD2(v124.st_ino) = 2048;
    *(__darwin_ino64_t *)((char *)&v124.st_ino + 6) = 48;
    v58 = "DiskMetaStore::open : meta store file is too small : %lu < %lu";
    goto LABEL_152;
  }
  v2 = "term index";
LABEL_69:
  if (skit::internal::get_logging_context(void)::once != -1)
  v31 = skit::internal::get_logging_context(void)::logger;
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    v124.st_dev = 136446210;
    *(_QWORD *)&v124.st_mode = v2;
    _os_log_error_impl(&dword_1CB748000, v31, OS_LOG_TYPE_ERROR, "IndexDiskImplV2::open : opening %{public}s failed", (uint8_t *)&v124, 0xCu);
  }
  return 0xFFFFFFFFLL;
}

void sub_1CB7552CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  if (a18 < 0)
    operator delete(__p);
  if (a25 < 0)
    operator delete(a20);
  _Unwind_Resume(exception_object);
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::open(uint64_t a1)
{
  uint64_t v1;
  std::__fs::filesystem::path *v3;
  std::__fs::filesystem::path *v4;
  const char *v5;
  int v6;
  const char *v7;
  int v8;
  int v9;
  _BOOL4 v10;
  const char *v11;
  int v12;
  int v13;
  off_t st_size;
  void *v15;
  _DWORD *v16;
  std::error_code *v17;
  void *v18;
  const std::__fs::filesystem::path *v19;
  uint64_t result;
  NSObject *v21;
  NSObject *v22;
  int v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  int v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  stat __replacement;
  stat v39;
  std::string pn;
  uint8_t buf[4];
  _BYTE v42[14];
  __int16 v43;
  off_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v1 = a1 + 24;
  if (!*(_QWORD *)(a1 + 24))
  {
    if (*(char *)(a1 + 23) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v39, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
    }
    else
    {
      *(_OWORD *)&v39.st_dev = *(_OWORD *)a1;
      *(_QWORD *)&v39.st_uid = *(_QWORD *)(a1 + 16);
    }
    std::__fs::filesystem::path::path[abi:ne180100]<char [5],void>((std::string *)&__replacement, (std::string *)".dat");
    v3 = std::__fs::filesystem::path::replace_extension((std::__fs::filesystem::path *)&v39, (const std::__fs::filesystem::path *)&__replacement);
    if (SHIBYTE(v3->__pn_.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&pn, v3->__pn_.__r_.__value_.__l.__data_, v3->__pn_.__r_.__value_.__l.__size_);
    else
      pn = v3->__pn_;
    v4 = (std::__fs::filesystem::path *)(a1 + 40);
    if (*(_DWORD *)(a1 + 64) == -1)
    {
      if (*(char *)(a1 + 63) < 0)
        operator delete(v4->__pn_.__r_.__value_.__l.__data_);
      *(_OWORD *)&v4->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&pn.__r_.__value_.__l.__data_;
      *(_QWORD *)(a1 + 56) = *((_QWORD *)&pn.__r_.__value_.__l + 2);
      *((_BYTE *)&pn.__r_.__value_.__s + 23) = 0;
      pn.__r_.__value_.__s.__data_[0] = 0;
    }
    else if (SHIBYTE(pn.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(pn.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__replacement.st_gid) < 0)
      operator delete(*(void **)&__replacement.st_dev);
    if (SHIBYTE(v39.st_gid) < 0)
      operator delete(*(void **)&v39.st_dev);
    memset(&v39, 0, sizeof(v39));
    memset(&__replacement, 0, sizeof(__replacement));
    v5 = (const char *)a1;
    if (*(char *)(a1 + 23) < 0)
      v5 = *(const char **)a1;
    v6 = access(v5, 0);
    v7 = (const char *)(a1 + 40);
    if (*(char *)(a1 + 63) < 0)
      v7 = (const char *)v4->__pn_.__r_.__value_.__r.__words[0];
    v8 = stat(v7, &__replacement);
    v9 = v8;
    if (v8)
      v10 = v6 == 0;
    else
      v10 = 0;
    if (v10)
    {
      if (skit::internal::get_logging_context(void)::once != -1)
      v34 = skit::internal::get_logging_context(void)::logger;
      if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
        return 0xFFFFFFFFLL;
      *(_WORD *)buf = 0;
      v35 = "KvStore::open : data file is missing";
    }
    else
    {
      if (v8)
        goto LABEL_29;
      if (v6)
      {
        if (skit::internal::get_logging_context(void)::once != -1)
        v34 = skit::internal::get_logging_context(void)::logger;
        if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
          return 0xFFFFFFFFLL;
        *(_WORD *)buf = 0;
        v35 = "KvStore::open : table file is missing";
      }
      else if ((__replacement.st_mode & 0x124) != 0)
      {
        if ((__replacement.st_mode & 0x92) != 0)
        {
          if ((__replacement.st_mode & 0x8000) != 0)
          {
LABEL_29:
            v11 = (const char *)a1;
            if (*(char *)(a1 + 23) < 0)
              v11 = *(const char **)a1;
            v12 = open_dprotected_np(v11, 514, *(_DWORD *)(a1 + 156), 0, *(unsigned __int16 *)(a1 + 160));
            v13 = v12;
            if (v12 == -1)
            {
              if (skit::internal::get_logging_context(void)::once != -1)
              v22 = skit::internal::get_logging_context(void)::logger;
              if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
              {
                v23 = *__error();
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v42 = v23;
                _os_log_error_impl(&dword_1CB748000, v22, OS_LOG_TYPE_ERROR, "KvStore::open : table file open failed : %{darwin.errno}d", buf, 8u);
              }
              goto LABEL_52;
            }
            if (fstat(v12, &v39) == -1)
            {
              if (skit::internal::get_logging_context(void)::once != -1)
              v24 = skit::internal::get_logging_context(void)::logger;
              if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                goto LABEL_151;
              *(_WORD *)buf = 0;
              v25 = "KvStore::open : failed to get table file stats";
            }
            else if ((v39.st_mode & 0x124) != 0)
            {
              if ((v39.st_mode & 0x92) != 0)
              {
                if ((v39.st_mode & 0x8000) != 0)
                {
                  if (!v6 && v39.st_size <= 39)
                  {
                    if (skit::internal::get_logging_context(void)::once != -1)
                    v26 = skit::internal::get_logging_context(void)::logger;
                    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_151;
                    *(_DWORD *)buf = 134217984;
                    *(_QWORD *)v42 = v39.st_size;
                    v25 = "KvStore::open : table file is too small, %lli";
                    v27 = v26;
                    v28 = 12;
                    goto LABEL_150;
                  }
                  if (v6)
                    st_size = 552;
                  else
                    st_size = v39.st_size;
                  *(_QWORD *)(a1 + 32) = st_size;
                  v15 = mmap(0, st_size, 3, *(_DWORD *)(a1 + 136) | 1u, v13, 0);
                  *(_QWORD *)(a1 + 24) = v15;
                  if (v15 == (void *)-1)
                  {
                    if (skit::internal::get_logging_context(void)::once != -1)
                    v29 = skit::internal::get_logging_context(void)::logger;
                    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_151;
                    v30 = *__error();
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v42 = v30;
                    v25 = "KvStore::open : mmap of table file failed : %{darwin.errno}d";
                    goto LABEL_115;
                  }
                  if (madvise(v15, *(_QWORD *)(a1 + 32), *(_DWORD *)(a1 + 140)))
                  {
                    if (skit::internal::get_logging_context(void)::once != -1)
                    v29 = skit::internal::get_logging_context(void)::logger;
                    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_151;
                    v31 = *__error();
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v42 = v31;
                    v25 = "KvStore::open : madvise for table file failed : %{darwin.errno}d";
                    goto LABEL_115;
                  }
                  if (v6)
                  {
                    if (!ftruncate(v13, *(_QWORD *)(a1 + 32)))
                    {
                      skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::KvTableImpl(*(_QWORD *)(a1 + 24), 1);
                      *(_BYTE *)(a1 + 162) = 1;
LABEL_49:
                      if (!close(v13))
                      {
                        if (skit::internal::BlobFile::open((skit::internal::BlobFile *)(a1 + 40), 514, *(_DWORD *)(a1 + 156), *(unsigned __int16 *)(a1 + 160))|| skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::mmap_data_file(a1))
                        {
                          goto LABEL_52;
                        }
                        if (v6)
                          skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::calculate_checksums(a1);
                        return 0;
                      }
                      if (skit::internal::get_logging_context(void)::once != -1)
                      v29 = skit::internal::get_logging_context(void)::logger;
                      if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                      {
LABEL_151:
                        close(v13);
LABEL_52:
                        if ((unint64_t)(*(_QWORD *)v1 + 1) >= 2)
                          munmap(*(void **)v1, *(_QWORD *)(a1 + 32));
                        *(_QWORD *)v1 = 0;
                        *(_QWORD *)(v1 + 8) = 0;
                        skit::internal::BlobFile::close((skit::internal::BlobFile *)(a1 + 40));
                        v18 = *(void **)(a1 + 112);
                        if ((unint64_t)v18 + 1 >= 2)
                          munmap(v18, *(_QWORD *)(a1 + 120));
                        *(_QWORD *)(a1 + 112) = 0;
                        *(_QWORD *)(a1 + 120) = 0;
                        if (v6)
                        {
                          v19 = (const std::__fs::filesystem::path *)a1;
                          if (*(char *)(a1 + 23) < 0)
                            v19 = *(const std::__fs::filesystem::path **)a1;
                          remove(v19, v17);
                        }
                        if (v9)
                        {
                          if (*(char *)(a1 + 63) < 0)
                            v4 = (std::__fs::filesystem::path *)v4->__pn_.__r_.__value_.__r.__words[0];
                          remove(v4, v17);
                        }
                        return 0xFFFFFFFFLL;
                      }
                      v32 = *__error();
                      *(_DWORD *)buf = 67109120;
                      *(_DWORD *)v42 = v32;
                      v25 = "KvStore::open : table file close failed : %{darwin.errno}d";
                      goto LABEL_115;
                    }
                    if (skit::internal::get_logging_context(void)::once != -1)
                    v29 = skit::internal::get_logging_context(void)::logger;
                    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_151;
                    v33 = *__error();
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v42 = v33;
                    v25 = "KvStore::open : ftruncate on table file failed : %{darwin.errno}d";
LABEL_115:
                    v27 = v29;
                    v28 = 8;
LABEL_150:
                    _os_log_error_impl(&dword_1CB748000, v27, OS_LOG_TYPE_ERROR, v25, buf, v28);
                    goto LABEL_151;
                  }
                  v16 = *(_DWORD **)v1;
                  if (**(_DWORD **)v1 == 410583828)
                  {
                    if ((((unint64_t)v16[4] << 9) | 0x28) != v39.st_size)
                    {
                      if (skit::internal::get_logging_context(void)::once != -1)
                      v36 = skit::internal::get_logging_context(void)::logger;
                      if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_151;
                      v37 = *(unsigned int *)(*(_QWORD *)v1 + 16);
                      *(_DWORD *)buf = 67109632;
                      *(_DWORD *)v42 = v37;
                      *(_WORD *)&v42[4] = 2048;
                      *(_QWORD *)&v42[6] = (v37 << 9) | 0x28;
                      v43 = 2048;
                      v44 = v39.st_size;
                      v25 = "KvStore::open : table file validation failed, bucket count does not match file size : bucket"
                            "_cnt=%u, expected_size=%lu, actual_size=%lli";
                      v27 = v36;
                      v28 = 28;
                      goto LABEL_150;
                    }
                    if (__replacement.st_size == v16[6])
                      goto LABEL_49;
                    if (skit::internal::get_logging_context(void)::once != -1)
                    v24 = skit::internal::get_logging_context(void)::logger;
                    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_151;
                    *(_WORD *)buf = 0;
                    v25 = "KvStore::open : table file validation failed, data file size mismatch";
                  }
                  else
                  {
                    if (skit::internal::get_logging_context(void)::once != -1)
                    v24 = skit::internal::get_logging_context(void)::logger;
                    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_151;
                    *(_WORD *)buf = 0;
                    v25 = "KvStore::open : table file validation failed, magic cookie not found";
                  }
                }
                else
                {
                  if (skit::internal::get_logging_context(void)::once != -1)
                  v24 = skit::internal::get_logging_context(void)::logger;
                  if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_151;
                  *(_WORD *)buf = 0;
                  v25 = "KvStore::open : table file is not a regular file";
                }
              }
              else
              {
                if (skit::internal::get_logging_context(void)::once != -1)
                v24 = skit::internal::get_logging_context(void)::logger;
                if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_151;
                *(_WORD *)buf = 0;
                v25 = "KvStore::open : table file does not have write permission";
              }
            }
            else
            {
              if (skit::internal::get_logging_context(void)::once != -1)
              v24 = skit::internal::get_logging_context(void)::logger;
              if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                goto LABEL_151;
              *(_WORD *)buf = 0;
              v25 = "KvStore::open : table file does not have read permission";
            }
            v27 = v24;
            v28 = 2;
            goto LABEL_150;
          }
          if (skit::internal::get_logging_context(void)::once != -1)
          v34 = skit::internal::get_logging_context(void)::logger;
          if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
            return 0xFFFFFFFFLL;
          *(_WORD *)buf = 0;
          v35 = "KvStore::open : data file is not a regular file";
        }
        else
        {
          if (skit::internal::get_logging_context(void)::once != -1)
          v34 = skit::internal::get_logging_context(void)::logger;
          if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
            return 0xFFFFFFFFLL;
          *(_WORD *)buf = 0;
          v35 = "KvStore::open : data file does not have write permission";
        }
      }
      else
      {
        if (skit::internal::get_logging_context(void)::once != -1)
        v34 = skit::internal::get_logging_context(void)::logger;
        if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
          return 0xFFFFFFFFLL;
        *(_WORD *)buf = 0;
        v35 = "KvStore::open : data file does not have read permission";
      }
    }
    _os_log_error_impl(&dword_1CB748000, v34, OS_LOG_TYPE_ERROR, v35, buf, 2u);
    return 0xFFFFFFFFLL;
  }
  if (skit::internal::get_logging_context(void)::once != -1)
  v21 = skit::internal::get_logging_context(void)::logger;
  result = os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_INFO);
  if ((_DWORD)result)
  {
    LOWORD(v39.st_dev) = 0;
    _os_log_impl(&dword_1CB748000, v21, OS_LOG_TYPE_INFO, "KvStore::open : already open", (uint8_t *)&v39, 2u);
    return 0;
  }
  return result;
}

void sub_1CB755F6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  if (a37 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::KvTableImpl(uint64_t a1, int a2)
{
  uint64_t v3;
  unsigned int *v4;

  *(_OWORD *)a1 = xmmword_1CB76D2B0;
  *(_DWORD *)(a1 + 16) = a2;
  *(_DWORD *)(a1 + 20) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 28) = 1064514355;
  *(_QWORD *)(a1 + 32) = time(0);
  v3 = *(unsigned int *)(a1 + 16);
  if ((_DWORD)v3)
  {
    v4 = (unsigned int *)(a1 + 40);
    do
    {
      atomic_store(0xFFFFFFFF, v4);
      v4 += 128;
      --v3;
    }
    while (v3);
  }
  return a1;
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::mmap_data_file(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  int v11;
  const char *v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 72);
  if (*(_QWORD *)(a1 + 120) == v1 || v1 == 0)
    return 0;
  if (skit::internal::BlobFile::flush_internal_cache((skit::internal::BlobFile *)(a1 + 40)))
    return 0xFFFFFFFFLL;
  v6 = mmap(0, *(_QWORD *)(a1 + 72), 1, *(_DWORD *)(a1 + 136) | 1u, *(_DWORD *)(a1 + 64), 0);
  v7 = v6;
  if (v6 == (void *)-1)
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v10 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v11 = *__error();
    v14 = 67109120;
    v15 = v11;
    v12 = "KvStore::mmap_data_file : mmap of data file failed %{darwin.errno}d";
    goto LABEL_24;
  }
  if (madvise(v6, *(_QWORD *)(a1 + 72), *(_DWORD *)(a1 + 140) | 1))
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v10 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    v13 = *__error();
    v14 = 67109120;
    v15 = v13;
    v12 = "KvStore::mmap_data_file : madvise for data file failed %{darwin.errno}d";
LABEL_24:
    _os_log_error_impl(&dword_1CB748000, v10, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 8u);
LABEL_21:
    if ((unint64_t)v7 + 1 >= 2)
      munmap(v7, *(_QWORD *)(a1 + 72));
    return 0xFFFFFFFFLL;
  }
  v8 = *(void **)(a1 + 112);
  if (v8)
    munmap(v8, *(_QWORD *)(a1 + 120));
  result = 0;
  v9 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 112) = v7;
  *(_QWORD *)(a1 + 120) = v9;
  return result;
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::calculate_checksums(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  BOOL v4;
  unint64_t v5;
  char *v6;
  unsigned int v7;
  char v8;
  int v9;
  char *v10;
  uint64_t v11;
  unsigned int v12;
  char v13;
  uint64_t v14;

  if (*(_BYTE *)(result + 162))
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 24);
    if (v2)
    {
      v3 = *(_QWORD *)(result + 32);
      v4 = v3 >= 0xC;
      v5 = v3 - 12;
      if (v4)
      {
        if (v5)
        {
          v6 = (char *)(v2 + 12);
          v7 = -1;
          do
          {
            v8 = *v6++;
            v7 = crc32_tab[(v8 ^ v7)] ^ (v7 >> 8);
            --v5;
          }
          while (v5);
          v9 = ~v7;
        }
        else
        {
          v9 = -1;
        }
        result = skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::mmap_data_file(result);
        if (!(_DWORD)result)
        {
          v10 = *(char **)(v1 + 112);
          if (v10)
          {
            v11 = *(_QWORD *)(v1 + 120);
            if (v11)
            {
              v12 = -1;
              do
              {
                v13 = *v10++;
                v12 = crc32_tab[(v13 ^ v12)] ^ (v12 >> 8);
                --v11;
              }
              while (v11);
              LODWORD(v10) = ~v12;
            }
            else
            {
              LODWORD(v10) = -1;
            }
          }
          v14 = *(_QWORD *)(v1 + 24);
          *(_DWORD *)(v14 + 4) = v9;
          *(_DWORD *)(v14 + 8) = (_DWORD)v10;
          *(_BYTE *)(v1 + 162) = 0;
        }
      }
    }
  }
  return result;
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::close(_QWORD *a1)
{
  void *v2;
  _QWORD *v3;
  int v4;
  int v5;
  void *v6;
  uint64_t result;

  v3 = a1 + 3;
  v2 = (void *)a1[3];
  if (v2 && a1[9])
  {
    skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::calculate_checksums((uint64_t)a1);
    v2 = (void *)a1[3];
  }
  if ((unint64_t)v2 + 1 >= 2)
    v4 = munmap(v2, a1[4]);
  else
    v4 = 0;
  *v3 = 0;
  v3[1] = 0;
  v5 = skit::internal::BlobFile::close((skit::internal::BlobFile *)(a1 + 5)) | v4;
  v6 = (void *)a1[14];
  if ((unint64_t)v6 + 1 >= 2)
    v5 |= munmap(v6, a1[15]);
  if (v5)
    result = 0xFFFFFFFFLL;
  else
    result = 0;
  a1[14] = 0;
  a1[15] = 0;
  return result;
}

_QWORD *skit::internal::Term::Term(_QWORD *a1, __int16 a2, void *__src, uint64_t a4)
{
  _WORD *v7;
  size_t v8;
  unsigned int v9;

  v7 = a1 + 2;
  *a1 = a1 + 2;
  a1[1] = 0x1800000000;
  v8 = 2 * a4;
  v9 = 2 * a4 + 2;
  if (v9 >= 0x19)
  {
    skit::SmallVector<std::byte,24u,false>::_reserve_more((uint64_t)a1, (2 * a4 + 2));
    v7 = (_WORD *)*a1;
  }
  *((_DWORD *)a1 + 2) = v9;
  *v7 = a2;
  memcpy((void *)(*a1 + 2), __src, v8);
  return a1;
}

void sub_1CB756408(_Unwind_Exception *exception_object)
{
  void **v1;
  void *v2;

  if (*v1 != v2)
    free(*v1);
  _Unwind_Resume(exception_object);
}

unint64_t std::__string_view_hash<char16_t>::operator()[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v78;
  unint64_t v79;

  v2 = 2 * a2;
  if ((unint64_t)(2 * a2) > 0x20)
  {
    if (v2 <= 0x40)
    {
      v6 = (char *)a1 + v2;
      v7 = *(uint64_t *)((char *)a1 + v2 - 16);
      v8 = *(uint64_t *)((char *)a1 + v2 - 8);
      v9 = *a1 - 0x3C5A37A36834CED9 * (v7 + v2);
      v11 = a1[2];
      v10 = a1[3];
      v12 = __ROR8__(v9 + v10, 52);
      v13 = __ROR8__(v9, 37);
      v14 = v9 + a1[1];
      v15 = __ROR8__(v14, 7);
      v16 = v14 + v11;
      v17 = v15 + v13;
      v18 = *((_QWORD *)v6 - 4) + v11;
      v19 = v8 + v10;
      v20 = __ROR8__(v19 + v18, 52);
      v21 = v17 + v12;
      v22 = __ROR8__(v18, 37);
      v23 = *((_QWORD *)v6 - 3) + v18;
      v24 = __ROR8__(v23, 7);
      v25 = v21 + __ROR8__(v16, 31);
      v26 = v23 + v7;
      v27 = v26 + v19;
      v28 = v16 + v10 + v22 + v24 + v20 + __ROR8__(v26, 31);
      v29 = 0x9AE16A3B2F90404FLL;
      v30 = v25
          - 0x3C5A37A36834CED9
          * ((0xC3A5C85C97CB3127 * (v27 + v25) - 0x651E95C4D06FBFB1 * v28) ^ ((0xC3A5C85C97CB3127 * (v27 + v25)
                                                                                 - 0x651E95C4D06FBFB1 * v28) >> 47));
      return (v30 ^ (v30 >> 47)) * v29;
    }
    v5 = 0x9DDFEA08EB382D69;
    v37 = *(uint64_t *)((char *)a1 + v2 - 48);
    v38 = *(uint64_t *)((char *)a1 + v2 - 40);
    v39 = *(uint64_t *)((char *)a1 + v2 - 24);
    v41 = *(uint64_t *)((char *)a1 + v2 - 64);
    v40 = *(uint64_t *)((char *)a1 + v2 - 56);
    v42 = *(uint64_t *)((char *)a1 + v2 - 16);
    v43 = *(uint64_t *)((char *)a1 + v2 - 8);
    v44 = v40 + v42;
    v45 = 0x9DDFEA08EB382D69
        * (v39 ^ ((0x9DDFEA08EB382D69 * (v39 ^ (v37 + v2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v39 ^ (v37 + v2))));
    v46 = 0x9DDFEA08EB382D69 * (v45 ^ (v45 >> 47));
    v47 = v41 + v2 + v40 + v37;
    v48 = v47 + v38;
    v49 = __ROR8__(v47, 44) + v41 + v2 + __ROR8__(v38 + v41 + v2 - 0x622015F714C7D297 * (v45 ^ (v45 >> 47)), 21);
    v50 = v40 + v42 + *(uint64_t *)((char *)a1 + v2 - 32) - 0x4B6D499041670D8DLL;
    v51 = v50 + v39 + v42;
    v52 = __ROR8__(v51, 44);
    v53 = v51 + v43;
    v54 = v52 + v50 + __ROR8__(v50 + v38 + v43, 21);
    v56 = *a1;
    v55 = a1 + 4;
    v57 = v56 - 0x4B6D499041670D8DLL * v38;
    v58 = -(uint64_t)((v2 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      v59 = *(v55 - 3);
      v60 = v57 + v48 + v44 + v59;
      v61 = v55[2];
      v62 = v55[3];
      v63 = v55[1];
      v44 = v63 + v48 - 0x4B6D499041670D8DLL * __ROR8__(v44 + v49 + v61, 42);
      v64 = v46 + v53;
      v65 = *(v55 - 2);
      v66 = *(v55 - 1);
      v67 = *(v55 - 4) - 0x4B6D499041670D8DLL * v49;
      v68 = v67 + v53 + v66;
      v69 = v67 + v59 + v65;
      v48 = v69 + v66;
      v70 = __ROR8__(v69, 44) + v67;
      v71 = (0xB492B66FBE98F273 * __ROR8__(v60, 37)) ^ v54;
      v57 = 0xB492B66FBE98F273 * __ROR8__(v64, 33);
      v49 = v70 + __ROR8__(v68 + v71, 21);
      v72 = v57 + v54 + *v55;
      v53 = v72 + v63 + v61 + v62;
      v54 = __ROR8__(v72 + v63 + v61, 44) + v72 + __ROR8__(v44 + v65 + v72 + v62, 21);
      v55 += 8;
      v46 = v71;
      v58 += 64;
    }
    while (v58);
    v73 = 0x9DDFEA08EB382D69
        * (v53 ^ ((0x9DDFEA08EB382D69 * (v53 ^ v48)) >> 47) ^ (0x9DDFEA08EB382D69 * (v53 ^ v48)));
    v74 = v71 - 0x4B6D499041670D8DLL * (v44 ^ (v44 >> 47)) - 0x622015F714C7D297 * (v73 ^ (v73 >> 47));
    v75 = v57
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v54 ^ ((0x9DDFEA08EB382D69 * (v54 ^ v49)) >> 47) ^ (0x9DDFEA08EB382D69 * (v54 ^ v49)))) ^ ((0x9DDFEA08EB382D69 * (v54 ^ ((0x9DDFEA08EB382D69 * (v54 ^ v49)) >> 47) ^ (0x9DDFEA08EB382D69 * (v54 ^ v49)))) >> 47));
    v76 = 0x9DDFEA08EB382D69
        * (v75 ^ ((0x9DDFEA08EB382D69 * (v75 ^ v74)) >> 47) ^ (0x9DDFEA08EB382D69 * (v75 ^ v74)));
    goto LABEL_13;
  }
  if (v2 > 0x10)
  {
    v31 = a1[1];
    v32 = 0xB492B66FBE98F273 * *a1;
    v33 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + v2 - 8), 30) + __ROR8__(v32 - v31, 43);
    v34 = v32 + v2 + __ROR8__(v31 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + v2 - 8);
    v35 = v34 ^ (v33 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a1 + v2 - 16));
    v29 = 0x9DDFEA08EB382D69;
    v36 = v34 ^ ((0x9DDFEA08EB382D69 * v35) >> 47) ^ (0x9DDFEA08EB382D69 * v35);
LABEL_8:
    v30 = 0x9DDFEA08EB382D69 * v36;
    return (v30 ^ (v30 >> 47)) * v29;
  }
  if (v2 < 9)
  {
    if (v2 >= 4)
    {
      v78 = *(unsigned int *)((char *)a1 + v2 - 4);
      v79 = (v2 + (8 * *(_DWORD *)a1)) ^ v78;
      v29 = 0x9DDFEA08EB382D69;
      v36 = v78 ^ ((0x9DDFEA08EB382D69 * v79) >> 47) ^ (0x9DDFEA08EB382D69 * v79);
      goto LABEL_8;
    }
    v5 = 0x9AE16A3B2F90404FLL;
    if (a1 == (uint64_t *)((char *)a1 + 2 * a2))
      return v5;
    v76 = (0xC949D7C7509E6557 * (v2 + 4 * *((unsigned __int8 *)a1 + v2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (v2 >> 1)) << 8)));
LABEL_13:
    v5 *= v76 ^ (v76 >> 47);
    return v5;
  }
  v3 = *(uint64_t *)((char *)a1 + v2 - 8);
  v4 = __ROR8__(v3 + v2, v2);
  return (0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a1)))) >> 47))) ^ v3;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<skit::internal::Term const,skit::internal::PostingListMemImplV2>,0>((uint64_t)v1 + 16);
    operator delete(v1);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<skit::internal::Term const,skit::internal::PostingListMemImplV2>,0>(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 104);
  if (v2)
  {
    *(_QWORD *)(a1 + 112) = v2;
    operator delete(v2);
  }
  v3 = *(void **)(a1 + 80);
  if (v3)
  {
    *(_QWORD *)(a1 + 88) = v3;
    operator delete(v3);
  }
  if (*(_QWORD *)a1 != a1 + 16)
    free(*(void **)a1);
}

void *skit::SmallVector<std::byte,24u,false>::allocate(size_t size)
{
  void *result;
  std::bad_alloc *exception;
  std::bad_alloc *v3;

  result = malloc_type_malloc(size, 0x100004077774924uLL);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    v3 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v3, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
  }
  return result;
}

size_t skit::SmallVector<std::byte,24u,false>::_reserve_more(uint64_t a1, size_t size)
{
  _BYTE *v3;
  char *v4;
  uint64_t v5;
  _BYTE *v6;
  char v7;
  size_t result;

  v3 = skit::SmallVector<std::byte,24u,false>::allocate(size);
  v4 = *(char **)a1;
  v5 = *(unsigned int *)(a1 + 8);
  if ((_DWORD)v5)
  {
    v6 = v3;
    do
    {
      v7 = *v4++;
      *v6++ = v7;
      --v5;
    }
    while (v5);
    v4 = *(char **)a1;
  }
  if (v4 != (char *)(a1 + 16))
    free(v4);
  *(_QWORD *)a1 = v3;
  result = malloc_size(v3);
  *(_DWORD *)(a1 + 12) = result;
  return result;
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvStore(uint64_t a1, __int128 *a2, uint64_t a3, uint64_t a4)
{
  __int128 v5;
  unint64_t v6;

  v5 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v5;
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  *(_QWORD *)a2 = 0;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 64) = -1;
  *(_OWORD *)(a1 + 72) = xmmword_1CB76D2C0;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 136) = a3;
  *(_QWORD *)(a1 + 144) = a4;
  *(_QWORD *)(a1 + 152) = 0xFFFFFFFF00000000;
  *(_WORD *)(a1 + 160) = 416;
  *(_BYTE *)(a1 + 162) = 0;
  std::string::append[abi:ne180100]<char const*,0>((std::string *)a1, (std::string *)".tbl", (std::string *)"");
  v6 = *(_QWORD *)(a1 + 144);
  if (v6 >= 0xA00000)
    v6 = 10485760;
  *(_QWORD *)(a1 + 144) = v6;
  *(_DWORD *)(a1 + 152) = (v6 + 0x1FFFFFFFFD8) >> 9;
  return a1;
}

void sub_1CB756A6C(_Unwind_Exception *a1)
{
  uint64_t v1;

  skit::internal::BlobFile::~BlobFile((skit::internal::BlobFile *)(v1 + 40));
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(a1);
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::rehash(uint64_t a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  std::string *v8;
  int v9;
  int v10;
  size_t v11;
  std::error_code *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t i;
  unsigned int v19;
  const std::__fs::filesystem::path *v20;
  std::error_code *v22;
  const std::__fs::filesystem::path *v23;
  const std::__fs::filesystem::path *v24;
  std::__fs::filesystem::path __replacement;
  std::string v26;
  int v27;
  unsigned int v28;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 24) + 16);
  if (a2 <= v2 << 6)
    return 0;
  v4 = *(_DWORD *)(a1 + 152);
  if (v2 >= v4)
    return 0xFFFFFFFFLL;
  v5 = (a2 + 63) >> 6;
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&v26, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    v26 = *(std::string *)a1;
  std::__fs::filesystem::path::path[abi:ne180100]<char [5],void>(&__replacement.__pn_, (std::string *)".tmp");
  std::__fs::filesystem::path::replace_extension((std::__fs::filesystem::path *)&v26, &__replacement);
  if (SHIBYTE(__replacement.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__replacement.__pn_.__r_.__value_.__l.__data_);
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v8 = &v26;
  else
    v8 = (std::string *)v26.__r_.__value_.__r.__words[0];
  v9 = open_dprotected_np((const char *)v8, 1538, *(_DWORD *)(a1 + 156), 0, *(unsigned __int16 *)(a1 + 160));
  v10 = v9;
  v11 = (v6 << 9) | 0x28;
  if (v9 == -1)
  {
    v13 = 0;
LABEL_32:
    close(v10);
    goto LABEL_33;
  }
  if (ftruncate(v9, (v6 << 9) | 0x28))
  {
    v13 = 0;
  }
  else
  {
    v14 = mmap(0, (v6 << 9) | 0x28, 3, *(_DWORD *)(a1 + 136) | 1u, v10, 0);
    v13 = (uint64_t)v14;
    if (v14 != (void *)-1 && !madvise(v14, (v6 << 9) | 0x28, 1))
    {
      skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::KvTableImpl(v13, v6);
      v15 = *(_QWORD *)(a1 + 24);
      if (*(_DWORD *)(v15 + 16))
      {
        v16 = 0;
        v17 = *(_QWORD *)(a1 + 24);
        do
        {
          for (i = 0; i != 256; i += 4)
          {
            v19 = *(_DWORD *)(v17 + i + 40);
            if (v19 != -2)
            {
              if (v19 == -1)
                break;
              __dmb(9u);
              v27 = *(_DWORD *)(v17 + i + 296);
              v28 = v19;
              __replacement.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)&v28;
              __replacement.__pn_.__r_.__value_.__l.__size_ = (std::string::size_type)&v27;
              skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::foreach_bucket<skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::insert_offset(int,unsigned int)::{lambda(skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvBucket &)#1}>(v13, v19, (unsigned int **)&__replacement);
            }
          }
          ++v16;
          v17 += 512;
        }
        while (v16 < *(unsigned int *)(v15 + 16));
        v15 = *(_QWORD *)(a1 + 24);
      }
      *(_DWORD *)(v13 + 12) = *(_DWORD *)(v15 + 12);
      *(_QWORD *)(v13 + 20) = *(_QWORD *)(v15 + 20);
      if (!close(v10))
      {
        munmap(*(void **)(a1 + 24), *(_QWORD *)(a1 + 32));
        if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v23 = (const std::__fs::filesystem::path *)&v26;
        else
          v23 = (const std::__fs::filesystem::path *)v26.__r_.__value_.__r.__words[0];
        v24 = (const std::__fs::filesystem::path *)a1;
        if (*(char *)(a1 + 23) < 0)
          v24 = *(const std::__fs::filesystem::path **)a1;
        rename(v23, v24, v22);
        v7 = 0;
        *(_QWORD *)(a1 + 24) = v13;
        *(_QWORD *)(a1 + 32) = v11;
        *(_BYTE *)(a1 + 162) = 1;
        goto LABEL_39;
      }
    }
  }
  if (v10)
    goto LABEL_32;
LABEL_33:
  if ((unint64_t)(v13 + 1) >= 2)
    munmap((void *)v13, v11);
  if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v20 = (const std::__fs::filesystem::path *)&v26;
  else
    v20 = (const std::__fs::filesystem::path *)v26.__r_.__value_.__r.__words[0];
  remove(v20, v12);
  v7 = 0xFFFFFFFFLL;
LABEL_39:
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
  return v7;
}

void sub_1CB756D40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::put(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t v3;
  unsigned int v7;
  uint64_t v8;
  size_t v9;
  _WORD *v10;
  void *v11;
  skit::internal *v12;
  int v13;
  uint64_t i;
  __int128 v15;
  int *v16;
  int v17;
  uint64_t v18;
  uint64_t result;
  int v20;
  uint64_t v21;
  _BYTE v22[8];
  uint64_t v23;
  int v24;
  unsigned int *v25[2];
  int v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 24);
  if (v3)
  {
    if ((v7 = *(_DWORD *)(v3 + 16) << 6) != 0
      && (float)(*(float *)(v3 + 28) * (float)v7) >= (float)(*(_DWORD *)(v3 + 20) + 1)
      || !skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::rehash(a1, (v7 + (v7 >> 1)) | 1))
    {
      v8 = *(_QWORD *)(a2 + 8);
      v9 = (2 * v8 + 8);
      ((void (*)(void))MEMORY[0x1E0C80A78])();
      v10 = &v22[-((v9 + 15) & 0x1FFFFFFF0) - 8];
      bzero(v10, v9);
      v12 = *(skit::internal **)a2;
      v10[2] = v8;
      v13 = 6;
      for (i = 8; i != 56; i += 16)
        v13 += *(_DWORD *)((char *)a3 + i);
      *(_DWORD *)v10 = 2 * v8 + v13 + 2;
      if (v8)
        v11 = memmove(v10 + 3, v12, 2 * v8);
      v10[v8 + 3] = 0;
      if (*(_QWORD *)(a1 + 72) + (unint64_t)*(unsigned int *)v10 <= *(_QWORD *)(a1 + 80))
      {
        MEMORY[0x1E0C80A78](v11, v12);
        *(&v21 - 8) = (uint64_t)v10;
        *(&v21 - 7) = v9;
        v15 = a3[1];
        *((_OWORD *)&v21 - 3) = *a3;
        *((_OWORD *)&v21 - 2) = v15;
        *((_OWORD *)&v21 - 1) = a3[2];
        skit::internal::BlobFile::append((skit::internal::BlobFile *)v22, (const iovec *)(a1 + 40), (iovec *)&v21 - 4, 4u);
        if (!v24)
        {
          v16 = *(int **)(a1 + 24);
          v17 = skit::internal::murmur3_32(*(skit::internal **)a2, 2 * *(_QWORD *)(a2 + 8), v16[3]);
          v18 = v23;
          v26 = v16[6];
          v27 = v17 & 0x7FFFFFFF;
          v25[0] = (unsigned int *)&v27;
          v25[1] = (unsigned int *)&v26;
          result = skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::foreach_bucket<skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::insert_offset(int,unsigned int)::{lambda(skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvBucket &)#1}>((uint64_t)v16, v17 & 0x7FFFFFFF, v25);
          if (!(_DWORD)result)
          {
            v20 = v16[6] + v18;
            ++v16[5];
            v16[6] = v20;
            *(_BYTE *)(a1 + 162) = 1;
            return result;
          }
          skit::internal::BlobFile::resize((skit::internal::BlobFile *)(a1 + 40), *(_QWORD *)(a1 + 72) - v18);
        }
      }
    }
  }
  return 0xFFFFFFFFLL;
}

void skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::clear(uint64_t a1)
{
  std::error_code *v2;
  const std::__fs::filesystem::path *v3;
  std::__fs::filesystem::path *v4;
  std::error_code *v5;
  std::__fs::filesystem::path __replacement;
  std::string v7;

  skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::close((_QWORD *)a1);
  v3 = (const std::__fs::filesystem::path *)a1;
  if (*(char *)(a1 + 23) < 0)
    v3 = *(const std::__fs::filesystem::path **)a1;
  remove(v3, v2);
  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&v7, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    v7 = *(std::string *)a1;
  std::__fs::filesystem::path::path[abi:ne180100]<char [5],void>(&__replacement.__pn_, (std::string *)".dat");
  v4 = std::__fs::filesystem::path::replace_extension((std::__fs::filesystem::path *)&v7, &__replacement);
  if ((v4->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v4 = (std::__fs::filesystem::path *)v4->__pn_.__r_.__value_.__r.__words[0];
  remove(v4, v5);
  if (SHIBYTE(__replacement.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__replacement.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v7.__r_.__value_.__l.__data_);
}

void sub_1CB757048(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::~KvStore(uint64_t a1)
{
  skit::internal::BlobFile::~BlobFile((skit::internal::BlobFile *)(a1 + 40));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

void **std::unique_ptr<skit::internal::IndexDiskImplV2>::reset[abi:ne180100](void ***a1)
{
  void **result;

  result = *a1;
  *a1 = 0;
  if (result)
  {
    skit::internal::IndexDiskImplV2::~IndexDiskImplV2(result);
    JUMPOUT(0x1D179DDB4);
  }
  return result;
}

void skit::internal::IndexDiskImplV2::~IndexDiskImplV2(void **this)
{
  const char *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::close(this))
  {
    v2 = "term index";
  }
  else
  {
    if (!skit::internal::DiskMetaStore::close((skit::internal::DiskMetaStore *)(this + 21)))
      goto LABEL_9;
    v2 = "meta store";
  }
  if (skit::internal::get_logging_context(void)::once != -1)
  v3 = skit::internal::get_logging_context(void)::logger;
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    v4 = 136446210;
    v5 = v2;
    _os_log_error_impl(&dword_1CB748000, v3, OS_LOG_TYPE_ERROR, "IndexDiskImplV2::close : %{public}s failed", (uint8_t *)&v4, 0xCu);
  }
LABEL_9:
  skit::internal::DiskMetaStore::close((skit::internal::DiskMetaStore *)(this + 21));
  skit::internal::MmapFile::~MmapFile((skit::internal::MmapFile *)(this + 36));
  if (*((char *)this + 263) < 0)
    operator delete(this[30]);
  std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)(this + 28), 0);
  skit::internal::MmapFile::~MmapFile((skit::internal::MmapFile *)(this + 24));
  if (*((char *)this + 191) < 0)
    operator delete(this[21]);
  skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::~KvStore((uint64_t)this);
}

void sub_1CB75723C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void skit::internal::MmapFile::~MmapFile(skit::internal::MmapFile *this)
{
  void *v2;

  v2 = *(void **)this;
  if (v2)
    munmap(v2, *((_QWORD *)this + 1));
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
}

void *std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *result;

  result = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (result)
    return (void *)munmap(result, *(_QWORD *)(a1 + 8));
  return result;
}

void skit::internal::BlobFile::~BlobFile(skit::internal::BlobFile *this)
{
  uint64_t v2;

  skit::internal::BlobFile::close(this);
  v2 = *((_QWORD *)this + 6);
  *((_QWORD *)this + 6) = 0;
  if (v2)
    MEMORY[0x1D179DD9C](v2, 0x1000C8077774924);
  if (*((char *)this + 23) < 0)
    operator delete(*(void **)this);
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::foreach_bucket<skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::insert_offset(int,unsigned int)::{lambda(skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvBucket &)#1}>(uint64_t a1, unsigned int a2, unsigned int **a3)
{
  unint64_t v3;
  unint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  BOOL v12;
  unsigned int v13;

  if (!*(_DWORD *)(a1 + 16))
    return 1;
  v3 = a2 - a2 / *(_DWORD *)(a1 + 16) * (unint64_t)*(unsigned int *)(a1 + 16);
  v4 = v3;
  while (1)
  {
    v5 = (unsigned int *)(a1 + (v4 << 9) + 40);
    v6 = **a3;
    v7 = *a3[1];
    v8 = atomic_load(v5);
    if ((v8 & 0x80000000) != 0)
      break;
    v9 = 0;
    while (v9 != 63)
    {
      v10 = v9 + 1;
      v11 = atomic_load((unsigned int *)(a1 + 44 + (v4 << 9) + 4 * v9++));
      if ((v11 & 0x80000000) != 0)
      {
        v12 = (unint64_t)(v10 - 1) < 0x3F;
        goto LABEL_9;
      }
    }
LABEL_13:
    v4 = (v4 + 1) % *(unsigned int *)(a1 + 16);
    if (v4 == v3)
      return 1;
  }
  v10 = 0;
  v12 = 1;
LABEL_9:
  v13 = atomic_load(&v5[v10]);
  if (v10 <= 0x3E && v13 == -1)
    v5[(v10 + 1)] = -1;
  *(_DWORD *)(a1 + (v4 << 9) + 4 * v10 + 296) = v7;
  __dmb(0xBu);
  v5[v10] = v6;
  if (!v12)
    goto LABEL_13;
  return 0;
}

uint64_t skit::internal::IndexWriterImpl::abort_txn(uint64_t this)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD *v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  _QWORD *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(this + 360))
  {
    v1 = this;
    if (skit::internal::get_logging_context(void)::once != -1)
    v2 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_INFO))
    {
      v3 = (_QWORD *)(v1 + 16);
      if (*(char *)(v1 + 39) < 0)
        v3 = (_QWORD *)*v3;
      v4[0] = 68289282;
      v4[1] = 16;
      v5 = 2098;
      v6 = v1;
      v7 = 2082;
      v8 = v3;
      _os_log_impl(&dword_1CB748000, v2, OS_LOG_TYPE_INFO, "IndexWriterImpl::abort_txn : aborting transaction %{public,uuid_t}.16P @ %{public}s", (uint8_t *)v4, 0x1Cu);
    }
    this = skit::internal::MultiIndexV2::clear((skit::internal::MultiIndexV2 *)(v1 + 40));
    *(_WORD *)(v1 + 360) = 0;
  }
  return this;
}

uint64_t skit::internal::get_logging_context(skit::internal *this)
{
  if (skit::internal::get_logging_context(void)::once != -1)
  return skit::internal::get_logging_context(void)::logger;
}

os_log_t skit::internal::`anonymous namespace'::initialize_logging_context(skit::internal::_anonymous_namespace_ *this, void *a2)
{
  os_log_t result;

  result = os_log_create("com.apple.skit", "SKIT");
  *(_QWORD *)this = result;
  return result;
}

uint64_t skit::internal::remove_all(const std::__fs::filesystem::path *this, const char *a2)
{
  uint64_t result;
  std::error_code *v4;

  if (!this)
    return 0xFFFFFFFFLL;
  if ((_DWORD)result == 20)
    return remove(this, v4);
  return result;
}

uint64_t skit::internal::`anonymous namespace'::remove_cb(skit::internal::_anonymous_namespace_ *this, const char *a2, const stat *a3, int a4, FTW *a5)
{
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  uint32_t v12;
  int v14;
  skit::internal::_anonymous_namespace_ *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((*((_WORD *)a2 + 2) & 0x92) != 0)
  {
    switch((int)a3)
    {
      case 0:
      case 5:
      case 6:
        if (unlink((const char *)this))
          goto LABEL_14;
        break;
      case 1:
        if (skit::internal::get_logging_context(void)::once != -1)
        v6 = skit::internal::get_logging_context(void)::logger;
        if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_FAULT))
        {
          v14 = 136446210;
          v15 = this;
          _os_log_fault_impl(&dword_1CB748000, v6, OS_LOG_TYPE_FAULT, "remove_all : visiting directory in pre-order traversal : %{public}s", (uint8_t *)&v14, 0xCu);
        }
        break;
      case 2:
        if (skit::internal::get_logging_context(void)::once != -1)
        v7 = skit::internal::get_logging_context(void)::logger;
        if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
        {
          v14 = 136446210;
          v15 = this;
          v8 = "remove_all : directory cannot be read, skipping removal : %{public}s";
          goto LABEL_24;
        }
        break;
      case 3:
        if (rmdir((const char *)this))
        {
LABEL_14:
          if (*__error() != 2)
          {
            if (skit::internal::get_logging_context(void)::once != -1)
            v9 = skit::internal::get_logging_context(void)::logger;
            if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
            {
              v10 = *__error();
              v14 = 136446466;
              v15 = this;
              v16 = 1024;
              v17 = v10;
              v8 = "remove_all : directory cannot be read, skipping removal : %{public}s : %{darwin.errno}d";
              v11 = v9;
              v12 = 18;
              goto LABEL_25;
            }
          }
        }
        break;
      case 4:
        if (skit::internal::get_logging_context(void)::once != -1)
        v7 = skit::internal::get_logging_context(void)::logger;
        if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
        {
          v14 = 136446210;
          v15 = this;
          v8 = "remove_all : directory cannot be read, skipping removal : %{public}s";
          goto LABEL_24;
        }
        break;
      default:
        return 0;
    }
  }
  else
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v7 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315138;
      v15 = this;
      v8 = "remove_all : file does not have write permission : %s";
LABEL_24:
      v11 = v7;
      v12 = 12;
LABEL_25:
      _os_log_error_impl(&dword_1CB748000, v11, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v14, v12);
    }
  }
  return 0;
}

uint64_t skit::internal::MmapFile::open(skit::internal::MmapFile *this, int a2, int a3, int a4, int a5, size_t a6, off_t a7)
{
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  int v15;
  NSObject *v16;
  uint64_t result;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  _BYTE *v23;
  __int16 v24;
  int v25;
  _BYTE v26[1024];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = mmap(0, a6, a3, a4, a2, a7);
  v12 = v11;
  if (v11 == (void *)-1)
  {
    v13 = 4;
    v14 = "mmap";
  }
  else
  {
    result = madvise(v11, a6, a5);
    if (!(_DWORD)result)
    {
      *(_QWORD *)this = v12;
      *((_QWORD *)this + 1) = a6;
      return result;
    }
    v13 = 7;
    v14 = "madvise";
  }
  v15 = *__error();
  if (fcntl(a2, 50, v26) == -1)
    v26[0] = 0;
  if (skit::internal::get_logging_context(void)::once != -1)
  v16 = skit::internal::get_logging_context(void)::logger;
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68158466;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v26;
    v24 = 1024;
    v25 = v15;
    _os_log_error_impl(&dword_1CB748000, v16, OS_LOG_TYPE_ERROR, "MmapFile::open : %{public}.*s failed @ %{public}s : %{darwin.errno}d", buf, 0x22u);
  }
  if (v12 != (void *)-1)
    munmap(v12, a6);
  return 0xFFFFFFFFLL;
}

uint64_t skit::internal::MmapFile::open(size_t *this, const char *a2, int a3, int a4, int a5, unsigned int a6, int a7, int a8, int a9, size_t a10, unint64_t a11)
{
  int v15;
  int v16;
  size_t v17;
  size_t v18;
  uint64_t result;
  int v20;
  const char *v21;
  NSObject *v22;
  int v23;
  stat v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  memset(&v24, 0, sizeof(v24));
  if (!a2)
  {
    v16 = -1;
    v20 = 10;
    v21 = "path check";
    goto LABEL_18;
  }
  v15 = open_dprotected_np(a2, a3, a4, a5, a6);
  v16 = v15;
  if (v15 < 0)
  {
    v20 = 4;
    v21 = "open";
    goto LABEL_18;
  }
  if (fstat(v15, &v24))
  {
    v20 = 5;
    v21 = "fstat";
    goto LABEL_18;
  }
  v17 = v24.st_size - a11;
  if (v24.st_size < a11)
    v17 = 0;
  if (a10 == -1)
    v18 = v17;
  else
    v18 = a10;
  if (skit::internal::MmapFile::open((skit::internal::MmapFile *)this, v16, a7, a8, a9, v18, a11))
  {
LABEL_10:
    close(v16);
    return 0xFFFFFFFFLL;
  }
  result = close(v16);
  if ((_DWORD)result)
  {
    v20 = 5;
    v21 = "close";
LABEL_18:
    if (skit::internal::get_logging_context(void)::once != -1)
    v22 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      v23 = *__error();
      *(_DWORD *)buf = 68158466;
      v26 = v20;
      v27 = 2082;
      v28 = v21;
      v29 = 2082;
      v30 = a2;
      v31 = 1024;
      v32 = v23;
      _os_log_error_impl(&dword_1CB748000, v22, OS_LOG_TYPE_ERROR, "MmapFile::open : %{public}.*s failed @ %{public}s : %{darwin.errno}d", buf, 0x22u);
    }
    if (*this)
      munmap((void *)*this, this[1]);
    *this = 0;
    this[1] = 0;
    if (v16 == -1)
      return 0xFFFFFFFFLL;
    goto LABEL_10;
  }
  return result;
}

uint64_t skit::internal::MmapFile::create(size_t *this, const char *a2, size_t a3, off_t a4, int a5, int a6, int a7, unsigned int a8, int a9, int a10, int a11)
{
  int v15;
  int v16;
  uint64_t result;
  int v18;
  const char *v19;
  NSObject *v20;
  int v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    v16 = -1;
    v18 = 10;
    v19 = "path check";
    goto LABEL_13;
  }
  v15 = open_dprotected_np(a2, a5, a6, a7, a8);
  v16 = v15;
  if (v15 < 0)
  {
    v18 = 4;
    v19 = "open";
    goto LABEL_13;
  }
  if (ftruncate(v15, a4 + a3))
  {
    v18 = 9;
    v19 = "ftruncate";
    goto LABEL_13;
  }
  if (skit::internal::MmapFile::open((skit::internal::MmapFile *)this, v16, a9, a10, a11, a3, a4))
  {
LABEL_5:
    close(v16);
    return 0xFFFFFFFFLL;
  }
  result = close(v16);
  if ((_DWORD)result)
  {
    v18 = 5;
    v19 = "close";
LABEL_13:
    if (skit::internal::get_logging_context(void)::once != -1)
    v20 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      v21 = *__error();
      *(_DWORD *)buf = 68158466;
      v23 = v18;
      v24 = 2082;
      v25 = v19;
      v26 = 2082;
      v27 = a2;
      v28 = 1024;
      v29 = v21;
      _os_log_error_impl(&dword_1CB748000, v20, OS_LOG_TYPE_ERROR, "MmapFile::create : %{public}.*s failed @ %{public}s : %{darwin.errno}d", buf, 0x22u);
    }
    if (*this)
      munmap((void *)*this, this[1]);
    *this = 0;
    this[1] = 0;
    if (v16 == -1)
      return 0xFFFFFFFFLL;
    goto LABEL_5;
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<skit::internal::CompressedMetaRecord>>(unint64_t a1)
{
  if (a1 >= 0x199999999999999ALL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(10 * a1);
}

void std::vector<skit::internal::CompressedMetaRecord>::resize(uint64_t a1, unint64_t a2)
{
  _WORD *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  size_t v15;
  char *v16;
  _WORD *v17;
  _WORD *v18;
  uint64_t v19;
  __int16 v20;
  _WORD *v21;
  size_t v22;

  v3 = *(_WORD **)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = 0xCCCCCCCCCCCCCCCDLL * ((v4 - *(_QWORD *)a1) >> 1);
  v6 = a2 - v5;
  if (a2 <= v5)
  {
    if (a2 >= v5)
      return;
    v21 = &v3[5 * a2];
    goto LABEL_17;
  }
  v7 = *(_QWORD *)(a1 + 16);
  if (0xCCCCCCCCCCCCCCCDLL * ((v7 - v4) >> 1) >= v6)
  {
    v22 = 10 * ((10 * v6 - 10) / 0xA) + 10;
    bzero(*(void **)(a1 + 8), v22);
    v21 = (_WORD *)(v4 + v22);
LABEL_17:
    *(_QWORD *)(a1 + 8) = v21;
    return;
  }
  if (a2 > 0x1999999999999999)
    std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
  v8 = 0xCCCCCCCCCCCCCCCDLL * ((v7 - (uint64_t)v3) >> 1);
  v9 = 2 * v8;
  if (2 * v8 <= a2)
    v9 = a2;
  if (v8 >= 0xCCCCCCCCCCCCCCCLL)
    v10 = 0x1999999999999999;
  else
    v10 = v9;
  v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::internal::CompressedMetaRecord>>(v10);
  v12 = &v11[10 * v5];
  v14 = &v11[10 * v13];
  v15 = 10 * ((10 * v6 - 10) / 0xA) + 10;
  bzero(v12, v15);
  v16 = &v12[v15];
  v18 = *(_WORD **)a1;
  v17 = *(_WORD **)(a1 + 8);
  if (v17 != *(_WORD **)a1)
  {
    do
    {
      v19 = *(_QWORD *)(v17 - 5);
      v17 -= 5;
      v20 = v17[4];
      *(_QWORD *)(v12 - 10) = v19;
      v12 -= 10;
      *((_WORD *)v12 + 4) = v20;
    }
    while (v17 != v18);
    v17 = *(_WORD **)a1;
  }
  *(_QWORD *)a1 = v12;
  *(_QWORD *)(a1 + 8) = v16;
  *(_QWORD *)(a1 + 16) = v14;
  if (v17)
    operator delete(v17);
}

uint64_t skit::FlatSet<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::rehash(uint64_t a1, unsigned int a2)
{
  uint64_t result;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  skit::internal *v13;
  unsigned int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  uint8_t v21[16];
  _DWORD *v22;
  void (*v23)(_DWORD *);
  uint8_t buf[4];
  unsigned int v25;
  __int16 v26;
  int v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(*(_QWORD *)(a1 + 16) + 4) > a2)
    return 0;
  v5 = *(_QWORD *)(a1 + 8);
  if (((v5 - 16) / 0x150uLL) < a2)
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v19 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_DWORD *)(*(_QWORD *)(a1 + 16) + 4);
      *(_DWORD *)buf = 67109376;
      v25 = a2;
      v26 = 1024;
      v27 = v20;
      _os_log_error_impl(&dword_1CB748000, v19, OS_LOG_TYPE_ERROR, "FlatSet::rehash : bucket count too large, %u > %u", buf, 0xEu);
    }
    return 0xFFFFFFFFLL;
  }
  skit::FlatSet<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::allocate_pimpl<>(&v22, v5, a2);
  v6 = v22;
  if (!v22)
    return 0xFFFFFFFFLL;
  v7 = *(_QWORD *)(a1 + 16);
  LODWORD(v8) = -1;
  do
    v8 = (v8 + 1);
  while (*(char *)(v7 + v8 + 16) < -1);
  v9 = 16 * *(_DWORD *)(v7 + 4);
  v10 = v9 - 1;
  if ((_DWORD)v8 == (_DWORD)v10)
  {
    *(_QWORD *)(a1 + 16) = v22;
  }
  else
  {
    v11 = v7 + 16 + v10;
    v12 = v7 + 16 + v8;
    v13 = (skit::internal *)(v7 + 16 + v9 + 20 * v8);
    do
    {
      v14 = skit::internal::murmur3_32(v13, 0x10uLL, 0);
      skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>::emplace<false,skit::FlatSet<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::rehash::{lambda(std::pair<skit::Uuid,unsigned int> const&)#1},std::pair<skit::Uuid,unsigned int>>((uint64_t)buf, v6, v14, v13, (__int128 *)v13);
      if (v28 <= 0)
      {
        if (skit::internal::get_logging_context(void)::once != -1)
        v18 = skit::internal::get_logging_context(void)::logger;
        if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v21 = 0;
          _os_log_error_impl(&dword_1CB748000, v18, OS_LOG_TYPE_ERROR, "FlatSet::rehash : failed to insert item into new hash table", v21, 2u);
        }
        v22 = 0;
        if (v6)
          v23(v6);
        return 0xFFFFFFFFLL;
      }
      v15 = v12;
      do
        v16 = *(char *)++v15;
      while (v16 < -1);
      v13 = (skit::internal *)((char *)v13 + 20 * (v15 - v12));
      v12 = v15;
    }
    while (v15 != v11);
    v17 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v6;
    if (!v17)
      goto LABEL_16;
  }
  (*(void (**)(void))(a1 + 24))();
LABEL_16:
  result = 0;
  *(_QWORD *)(a1 + 24) = v23;
  v22 = 0;
  return result;
}

void sub_1CB758308(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

void *skit::FlatSet<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::allocate_pimpl<>(_QWORD *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v4;
  int v5;
  _DWORD *v6;
  size_t v7;
  void *result;

  v4 = (a2 - 16) / 0x150uLL;
  if (v4 >= a3)
    LODWORD(v4) = a3;
  if (a3)
    v5 = v4;
  else
    v5 = 1;
  v6 = malloc_type_aligned_alloc(0x10uLL, (336 * v5 + 16), 0xCAC9F0E5uLL);
  *v6 = (unint64_t)(v6 + 4) >> 12;
  v6[1] = v5;
  *((_QWORD *)v6 + 1) = 0xF00000000;
  v7 = (16 * v5);
  result = memset(v6 + 4, 128, v7);
  *((_BYTE *)v6 + (v7 - 1) + 16) = -1;
  *a1 = v6;
  a1[1] = skit::FlatSet<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::allocate_pimpl<>const::{lambda(skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>*)#1}::__invoke;
  return result;
}

uint64_t skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>::emplace<false,skit::FlatSet<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::rehash(unsigned int)::{lambda(std::pair<skit::Uuid,unsigned int> const&)#1},std::pair<skit::Uuid,unsigned int>>(uint64_t result, _DWORD *a2, unsigned int a3, _QWORD *a4, __int128 *a5)
{
  unsigned int v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  unsigned int i;
  uint64_t v11;
  int v12;
  char *v13;
  char *v15;
  _BYTE *v16;
  int v17;
  __int128 v18;
  int v19;

  v5 = a2[1];
  v6 = a3 & 0x7F;
  v7 = 16 * ((*a2 ^ (a3 >> 7)) % v5);
  v8 = 16 * v5;
  v9 = (char *)&a2[v8 / 4 + 4];
  for (i = v7; ; i = ((int)v11 + 1) % v8)
  {
    v11 = i;
    v12 = *((unsigned __int8 *)a2 + i + 16);
    if (v12 == v6)
    {
      v13 = &v9[20 * i];
      if (*a4 == *(_QWORD *)v13 && a4[1] == *((_QWORD *)v13 + 1))
      {
        v19 = 0;
        goto LABEL_13;
      }
    }
    if (v12 == 128)
      break;
  }
  v15 = (char *)a2 + v7;
  v17 = v15[16];
  v16 = v15 + 16;
  if (v17 >= -1)
  {
    do
    {
      v7 = ((int)v7 + 1) % v8;
      v16 = (char *)a2 + v7 + 16;
    }
    while ((char)*v16 > -2);
  }
  v13 = &v9[20 * v7];
  v18 = *a5;
  *((_DWORD *)v13 + 4) = *((_DWORD *)a5 + 4);
  *(_OWORD *)v13 = v18;
  *v16 = v6;
  ++a2[2];
  v19 = 1;
  v11 = v7;
LABEL_13:
  *(_QWORD *)result = (char *)a2 + v11 + 16;
  *(_QWORD *)(result + 8) = v13;
  *(_DWORD *)(result + 16) = v19;
  return result;
}

BOOL skit::internal::MemMetaStore::set_doc_wgt(uint64_t a1, skit::internal *this, float a3)
{
  _DWORD *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 result;
  uint64_t v19;
  __int16 *v20;
  float v26;

  v6 = *(_DWORD **)(a1 + 88);
  v7 = skit::internal::murmur3_32(this, 0x10uLL, 0);
  v8 = v6[1];
  v9 = 16 * ((*v6 ^ (v7 >> 7)) % v8);
  v10 = 16 * v8;
  v11 = (uint64_t)&v6[v10 / 4 + 4];
  while (1)
  {
    v12 = v9;
    v13 = *((unsigned __int8 *)v6 + v9 + 16);
    if (v13 == (v7 & 0x7F))
    {
      v14 = (uint64_t *)(v11 + 20 * v12);
      v16 = *v14;
      v15 = v14[1];
      if (*(_QWORD *)this == v16 && *((_QWORD *)this + 1) == v15)
        break;
    }
    if (v13 == 128)
      return 0;
    v9 = ((int)v12 + 1) % v10;
  }
  v19 = (v10 - 1);
  result = v19 != v12;
  if (v19 != v12)
  {
    v20 = (__int16 *)(*(_QWORD *)(a1 + 48) + 10 * *(unsigned int *)(v11 + 20 * v12 + 16));
    _H0 = *v20;
    __asm { FCVT            S0, H0 }
    if (_S0 >= 0.00000011921)
    {
      v26 = 65504.0;
      if (a3 <= 65504.0)
        v26 = a3;
      _S0 = 0.0;
      if (a3 >= 0.0)
        _S0 = v26;
      if (_S0 < 0.00000011921)
      {
        ++*(_DWORD *)(a1 + 16);
        _S0 = 0.0;
      }
      __asm { FCVT            H0, S0 }
      *v20 = _H0;
    }
  }
  return result;
}

uint64_t skit::internal::MemMetaStore::write(skit::internal::MemMetaStore *this, std::__fs::filesystem::path *a2, int a3, unsigned int a4)
{
  std::__fs::filesystem::path *v6;
  uint64_t v8;
  std::error_code *v9;
  const char *v10;
  int v11;
  int v12;
  _DWORD *v13;
  size_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  std::string::size_type v18;
  int *v19;
  std::string::size_type v20;
  int v21;
  const char *v22;
  int v23;
  std::string::size_type v24;
  int *v25;
  std::string::size_type v26;
  int v27;
  int v28;
  std::string::size_type v29;
  int *v30;
  std::string::size_type v31;
  int v32;
  int v33;
  std::string::size_type v34;
  int *v35;
  std::string::size_type v36;
  int v37;
  std::error_code *v38;
  const char *v40;
  uint64_t v41;
  std::string pn;
  iovec v43;
  std::string::size_type v44;
  int v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  std::__fs::filesystem::path __replacement;
  iovec v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v6 = a2;
  v54 = *MEMORY[0x1E0C80C00];
  v51.iov_base = this;
  v51.iov_len = 48;
  v8 = *((_QWORD *)this + 7) - *((_QWORD *)this + 6);
  v52 = *((_QWORD *)this + 6);
  v53 = v8;
  std::string::append(&a2->__pn_, ".ms", 3uLL);
  if (SHIBYTE(v6->__pn_.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&pn, v6->__pn_.__r_.__value_.__l.__data_, v6->__pn_.__r_.__value_.__l.__size_);
  else
    pn = v6->__pn_;
  v43 = *(iovec *)&pn.__r_.__value_.__l.__data_;
  v44 = pn.__r_.__value_.__r.__words[2];
  memset(&pn, 0, sizeof(pn));
  v45 = -1;
  v46 = xmmword_1CB76D2C0;
  v48 = 0;
  v49 = 0;
  v47 = 0;
  if ((skit::internal::BlobFile::open((skit::internal::BlobFile *)&v43, 1538, a3, a4) & 0x80000000) != 0)
    goto LABEL_48;
  skit::internal::BlobFile::append((skit::internal::BlobFile *)&__replacement, &v43, &v51, 2u);
  if ((__replacement.__pn_.__r_.__value_.__r.__words[2] & 0x80000000) != 0
    || (skit::internal::BlobFile::flush((skit::internal::BlobFile *)&v43) & 0x80000000) != 0
    || (skit::internal::BlobFile::close((skit::internal::BlobFile *)&v43) & 0x80000000) != 0)
  {
    goto LABEL_48;
  }
  if (!*(_DWORD *)(*((_QWORD *)this + 11) + 8))
  {
LABEL_18:
    v15 = 0;
    goto LABEL_53;
  }
  v40 = ".xid";
  v41 = 4;
  std::__fs::filesystem::path::path[abi:ne180100]<std::string_view,void>(&__replacement.__pn_, (uint64_t)&v40);
  std::__fs::filesystem::path::replace_extension(v6, &__replacement);
  if (SHIBYTE(__replacement.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__replacement.__pn_.__r_.__value_.__l.__data_);
  if ((v6->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v10 = (const char *)v6;
  else
    v10 = (const char *)v6->__pn_.__r_.__value_.__r.__words[0];
  v11 = open_dprotected_np(v10, 1538, a3, 0, a4);
  v12 = v11;
  if (v11 < 0)
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v16 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    v17 = SHIBYTE(v6->__pn_.__r_.__value_.__r.__words[2]);
    v18 = v6->__pn_.__r_.__value_.__r.__words[0];
    v19 = __error();
    if (v17 >= 0)
      v20 = (std::string::size_type)v6;
    else
      v20 = v18;
    v21 = *v19;
    LODWORD(__replacement.__pn_.__r_.__value_.__l.__data_) = 136446466;
    *(std::string::size_type *)((char *)__replacement.__pn_.__r_.__value_.__r.__words + 4) = v20;
    WORD2(__replacement.__pn_.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&__replacement.__pn_.__r_.__value_.__r.__words[1] + 6) = v21;
    v22 = "FlatSet::write : file open failed @ %{public}s : %{darwin.errno}d";
    goto LABEL_47;
  }
  v13 = (_DWORD *)*((_QWORD *)this + 11);
  v14 = (336 * v13[1] + 16);
  if (write(v11, v13, v14) != v14)
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v16 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    v23 = SHIBYTE(v6->__pn_.__r_.__value_.__r.__words[2]);
    v24 = v6->__pn_.__r_.__value_.__r.__words[0];
    v25 = __error();
    if (v23 >= 0)
      v26 = (std::string::size_type)v6;
    else
      v26 = v24;
    v27 = *v25;
    LODWORD(__replacement.__pn_.__r_.__value_.__l.__data_) = 136446466;
    *(std::string::size_type *)((char *)__replacement.__pn_.__r_.__value_.__r.__words + 4) = v26;
    WORD2(__replacement.__pn_.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&__replacement.__pn_.__r_.__value_.__r.__words[1] + 6) = v27;
    v22 = "FlatSet::write : failed to write table to %{public}s : %{darwin.errno}d";
    goto LABEL_47;
  }
  if (fsync(v12))
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v16 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    v28 = SHIBYTE(v6->__pn_.__r_.__value_.__r.__words[2]);
    v29 = v6->__pn_.__r_.__value_.__r.__words[0];
    v30 = __error();
    if (v28 >= 0)
      v31 = (std::string::size_type)v6;
    else
      v31 = v29;
    v32 = *v30;
    LODWORD(__replacement.__pn_.__r_.__value_.__l.__data_) = 136446466;
    *(std::string::size_type *)((char *)__replacement.__pn_.__r_.__value_.__r.__words + 4) = v31;
    WORD2(__replacement.__pn_.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&__replacement.__pn_.__r_.__value_.__r.__words[1] + 6) = v32;
    v22 = "FlatSet::write : failed on file flush %{public}s : %{darwin.errno}d";
    goto LABEL_47;
  }
  if (!close(v12))
    goto LABEL_18;
  if (skit::internal::get_logging_context(void)::once != -1)
  v16 = skit::internal::get_logging_context(void)::logger;
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    v33 = SHIBYTE(v6->__pn_.__r_.__value_.__r.__words[2]);
    v34 = v6->__pn_.__r_.__value_.__r.__words[0];
    v35 = __error();
    if (v33 >= 0)
      v36 = (std::string::size_type)v6;
    else
      v36 = v34;
    v37 = *v35;
    LODWORD(__replacement.__pn_.__r_.__value_.__l.__data_) = 136446466;
    *(std::string::size_type *)((char *)__replacement.__pn_.__r_.__value_.__r.__words + 4) = v36;
    WORD2(__replacement.__pn_.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&__replacement.__pn_.__r_.__value_.__r.__words[1] + 6) = v37;
    v22 = "FlatSet::write : failed on file close %{public}s : %{darwin.errno}d";
LABEL_47:
    _os_log_error_impl(&dword_1CB748000, v16, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&__replacement, 0x12u);
  }
LABEL_48:
  skit::internal::BlobFile::clear((skit::internal::BlobFile *)&v43, v9);
  v40 = ".xid";
  v41 = 4;
  std::__fs::filesystem::path::path[abi:ne180100]<std::string_view,void>(&__replacement.__pn_, (uint64_t)&v40);
  std::__fs::filesystem::path::replace_extension(v6, &__replacement);
  if (SHIBYTE(__replacement.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__replacement.__pn_.__r_.__value_.__l.__data_);
  if (SHIBYTE(v6->__pn_.__r_.__value_.__r.__words[2]) < 0)
    v6 = (std::__fs::filesystem::path *)v6->__pn_.__r_.__value_.__r.__words[0];
  remove(v6, v38);
  v15 = 0xFFFFFFFFLL;
LABEL_53:
  skit::internal::BlobFile::~BlobFile((skit::internal::BlobFile *)&v43);
  return v15;
}

void sub_1CB758AB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  if (*(char *)(v9 - 89) < 0)
    operator delete(*(void **)(v9 - 112));
  skit::internal::BlobFile::~BlobFile((skit::internal::BlobFile *)va);
  _Unwind_Resume(a1);
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<std::string_view,void>(std::string *a1, uint64_t a2)
{
  a1->__r_.__value_.__r.__words[0] = 0;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  std::string::append[abi:ne180100]<char const*,0>(a1, *(std::string **)a2, (std::string *)(*(_QWORD *)a2 + *(_QWORD *)(a2 + 8)));
  return a1;
}

void sub_1CB758B40(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

unint64_t skit::internal::DiskMetaStore::get_doc_internal(skit::internal::DiskMetaStore *this, unsigned int a2)
{
  uint64_t v2;
  uint64_t v10;
  unint64_t v11;
  int *v12;
  unsigned int v13;
  unint64_t v15;
  NSObject *v17;
  int v18;
  int v19;
  uint64_t v20;
  _DWORD v21[2];
  __int16 v22;
  int v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *((_QWORD *)this + 5);
  _H0 = *(_WORD *)(v2 + 10 * a2);
  __asm { FCVT            S0, H0 }
  if (_S0 >= 0.00000011921)
  {
    v10 = v2 + 10 * a2;
    v13 = *(_DWORD *)(v10 + 2);
    v12 = (int *)(v10 + 2);
    v11 = v13;
    if (v13 != -1)
    {
      v15 = *((_QWORD *)this + 16);
      if (v15 > v11 && v15 >= (*(_DWORD *)(v2 + 10 * a2 + 6) + v11))
        return *((_QWORD *)this + 15) + v11;
      if (skit::internal::get_logging_context(void)::once != -1)
      v17 = skit::internal::get_logging_context(void)::logger;
      if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_FAULT))
      {
        v18 = *v12;
        v19 = *(_DWORD *)(v2 + 10 * a2 + 6);
        v20 = *((_QWORD *)this + 16);
        v21[0] = 67109632;
        v21[1] = v18;
        v22 = 1024;
        v23 = v19;
        v24 = 2048;
        v25 = v20;
        _os_log_fault_impl(&dword_1CB748000, v17, OS_LOG_TYPE_FAULT, "DiskMetaStore::populate_doc : Invalid record offset/size : record=(%u, %u), doc_store_file_size=%lu", (uint8_t *)v21, 0x18u);
      }
    }
  }
  return 0;
}

void *skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::create_mmap(uint64_t a1, int a2, size_t a3)
{
  void *v6;
  void *v7;
  NSObject *v9;
  _QWORD *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD *v14;
  int v15;
  _QWORD *v16;
  int v17;
  int v18;
  _QWORD *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = mmap(0, a3, 3, *(_DWORD *)(a1 + 56) | 1u, a2, 0);
  if (v6 == (void *)-1)
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v9 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      v10 = (_QWORD *)(a1 + 24);
      if (*(char *)(a1 + 47) < 0)
        v10 = (_QWORD *)*v10;
      v11 = *__error();
      v18 = 136446466;
      v19 = v10;
      v20 = 1024;
      v21 = v11;
      _os_log_error_impl(&dword_1CB748000, v9, OS_LOG_TYPE_ERROR, "FlatSetDisk::create_mmap : mmap failed @ %{public}s : %{darwin.errno}d", (uint8_t *)&v18, 0x12u);
    }
  }
  else
  {
    v7 = v6;
    if (!madvise(v6, a3, *(_DWORD *)(a1 + 60)))
      goto LABEL_3;
    if (skit::internal::get_logging_context(void)::once != -1)
    v13 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      v16 = (_QWORD *)(a1 + 24);
      if (*(char *)(a1 + 47) < 0)
        v16 = (_QWORD *)*v16;
      v17 = *__error();
      v18 = 136446466;
      v19 = v16;
      v20 = 1024;
      v21 = v17;
      _os_log_error_impl(&dword_1CB748000, v13, OS_LOG_TYPE_ERROR, "FlatSetDisk::create_mmap : madvise failed @ %{public}s : %{darwin.errno}d", (uint8_t *)&v18, 0x12u);
    }
    munmap(v7, a3);
  }
  v7 = 0;
LABEL_3:
  if (close(a2))
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v12 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      v14 = (_QWORD *)(a1 + 24);
      if (*(char *)(a1 + 47) < 0)
        v14 = (_QWORD *)*v14;
      v15 = *__error();
      v18 = 136446466;
      v19 = v14;
      v20 = 1024;
      v21 = v15;
      _os_log_error_impl(&dword_1CB748000, v12, OS_LOG_TYPE_ERROR, "FlatSetDisk::create_mmap : close failed @ %{public}s : %{darwin.errno}d", (uint8_t *)&v18, 0x12u);
    }
    munmap(v7, a3);
    return 0;
  }
  return v7;
}

uint64_t skit::internal::DiskMetaStore::close(skit::internal::DiskMetaStore *this)
{
  void *v2;
  _QWORD *v3;
  int v4;
  void *v5;
  uint64_t result;

  v3 = (_QWORD *)((char *)this + 24);
  v2 = (void *)*((_QWORD *)this + 3);
  if (v2)
    v4 = munmap(v2, *((_QWORD *)this + 4));
  else
    v4 = 0;
  *v3 = 0;
  v3[1] = 0;
  std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)this + 56, 0);
  v5 = (void *)*((_QWORD *)this + 15);
  if (v5)
    LODWORD(v5) = munmap(v5, *((_QWORD *)this + 16));
  *((_QWORD *)this + 15) = 0;
  *((_QWORD *)this + 16) = 0;
  result = v5 | v4;
  *((_QWORD *)this + 5) = 0;
  return result;
}

void skit::internal::DiskMetaStore::clear(std::string::size_type *this)
{
  std::error_code *v2;
  int v3;
  void *v4;
  const std::__fs::filesystem::path *v5;
  std::error_code *v6;
  int v7;
  void *v8;
  const std::__fs::filesystem::path *v9;
  std::error_code *v10;
  int v11;
  void *v12;
  const std::__fs::filesystem::path *v13;
  std::string __p;
  std::string v15;
  std::string v16;
  std::string v17;

  skit::internal::DiskMetaStore::close((skit::internal::DiskMetaStore *)this);
  if (*((char *)this + 23) < 0)
    std::string::__init_copy_ctor_external(&v16, (const std::string::value_type *)*this, this[1]);
  else
    v16 = *(std::string *)this;
  std::string::append[abi:ne180100]<char const*,0>(&v16, (std::string *)".ms", (std::string *)"");
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v17, v16.__r_.__value_.__l.__data_, v16.__r_.__value_.__l.__size_);
    if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v16.__r_.__value_.__l.__data_);
  }
  else
  {
    v17 = v16;
  }
  if (*((char *)this + 23) < 0)
    std::string::__init_copy_ctor_external(&v15, (const std::string::value_type *)*this, this[1]);
  else
    v15 = *(std::string *)this;
  std::string::append[abi:ne180100]<char const*,0>(&v15, (std::string *)".xid", (std::string *)"");
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v16, v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
    if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v15.__r_.__value_.__l.__data_);
  }
  else
  {
    v16 = v15;
  }
  if (*((char *)this + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)*this, this[1]);
  else
    __p = *(std::string *)this;
  std::string::append[abi:ne180100]<char const*,0>(&__p, (std::string *)".ids", (std::string *)"");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v15, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v15 = __p;
  }
  v3 = SHIBYTE(v17.__r_.__value_.__r.__words[2]);
  v4 = (void *)v17.__r_.__value_.__r.__words[0];
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v5 = (const std::__fs::filesystem::path *)&v17;
  else
    v5 = (const std::__fs::filesystem::path *)v17.__r_.__value_.__r.__words[0];
  remove(v5, v2);
  v7 = SHIBYTE(v16.__r_.__value_.__r.__words[2]);
  v8 = (void *)v16.__r_.__value_.__r.__words[0];
  if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v9 = (const std::__fs::filesystem::path *)&v16;
  else
    v9 = (const std::__fs::filesystem::path *)v16.__r_.__value_.__r.__words[0];
  remove(v9, v6);
  v11 = SHIBYTE(v15.__r_.__value_.__r.__words[2]);
  v12 = (void *)v15.__r_.__value_.__r.__words[0];
  if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v13 = (const std::__fs::filesystem::path *)&v15;
  else
    v13 = (const std::__fs::filesystem::path *)v15.__r_.__value_.__r.__words[0];
  remove(v13, v10);
  if (v11 < 0)
  {
    operator delete(v12);
    if ((v7 & 0x80000000) == 0)
    {
LABEL_33:
      if ((v3 & 0x80000000) == 0)
        return;
LABEL_37:
      operator delete(v4);
      return;
    }
  }
  else if ((v7 & 0x80000000) == 0)
  {
    goto LABEL_33;
  }
  operator delete(v8);
  if (v3 < 0)
    goto LABEL_37;
}

void sub_1CB759220(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  uint64_t v28;

  if (a28 < 0)
    operator delete(__p);
  if (*(char *)(v28 - 57) < 0)
    operator delete(*(void **)(v28 - 80));
  _Unwind_Resume(exception_object);
}

unint64_t skit::internal::DiskMetaStore::populate_doc(unint64_t this, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  skit::internal::DiskMetaStore *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  if (*(_QWORD *)(this + 120))
  {
    v4 = a2;
    if (a2 != a3)
    {
      v5 = (skit::internal::DiskMetaStore *)this;
      v6 = *(_QWORD *)(*(_QWORD *)(this + 24) + 32);
      do
      {
        v7 = *((_QWORD *)v5 + 3);
        v8 = *(_QWORD *)(v4 + 8);
        if (*(_QWORD *)(v7 + 32) <= v8 && *(_QWORD *)(v7 + 40) > v8)
        {
          this = skit::internal::DiskMetaStore::get_doc_internal(v5, (int)v8 - (int)v6);
          *(_QWORD *)(v4 + 24) = this;
          *(_DWORD *)(v4 + 32) = v9;
        }
        v4 += 40;
      }
      while (v4 != a3);
    }
  }
  return this;
}

uint64_t skit::internal::DiskMetaStore::set_doc_wgt(_QWORD *a1, skit::internal *this, float a3)
{
  _DWORD *v3;
  unsigned int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  int v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  __int16 *v19;
  float v25;
  uint64_t v27;

  v3 = (_DWORD *)a1[7];
  if (!v3)
    return 0;
  v7 = skit::internal::murmur3_32(this, 0x10uLL, 0);
  v8 = v3[1];
  v9 = v7 & 0x7F;
  v10 = 16 * ((*v3 ^ (v7 >> 7)) % v8);
  v11 = 16 * v8;
  v12 = (char *)&v3[v11 / 4 + 4];
  while (1)
  {
    v13 = v10;
    v14 = *((unsigned __int8 *)v3 + v10 + 16);
    if (v14 == v9)
    {
      v15 = &v12[20 * v13];
      v16 = *(_QWORD *)v15;
      v17 = *((_QWORD *)v15 + 1);
      if (*(_QWORD *)this == v16 && *((_QWORD *)this + 1) == v17)
        break;
    }
    if (v14 == 128)
      return 0;
    v10 = ((int)v13 + 1) % v11;
  }
  if ((_DWORD)v11 - 1 == v13)
    return 0;
  v19 = (__int16 *)(a1[5] + 10 * *(unsigned int *)&v12[20 * v13 + 16]);
  _H0 = *v19;
  __asm { FCVT            S0, H0 }
  if (_S0 >= 0.00000011921)
  {
    v25 = 65504.0;
    if (a3 <= 65504.0)
      v25 = a3;
    _S0 = 0.0;
    if (a3 >= 0.0)
      _S0 = v25;
    if (_S0 < 0.00000011921)
    {
      v27 = a1[3];
      ++*(_DWORD *)(v27 + 16);
      --*(_DWORD *)(v27 + 28);
      *((_BYTE *)v3 + v13 + 16) = -2;
      --v3[2];
      _S0 = 0.0;
    }
    __asm { FCVT            H0, S0 }
    *v19 = _H0;
  }
  return 1;
}

uint64_t skit::internal::MultiIndexV2::open(const std::__fs::filesystem::path *this)
{
  const std::__fs::filesystem::path *v1;
  uint64_t v3;
  std::string::size_type v4;
  std::string::size_type v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  const std::__fs::filesystem::path *v14;
  std::__fs::filesystem::path *v15;
  int v16;
  std::__fs::filesystem::path::__string_view v17;
  int v18;
  int v19;
  char v20;
  std::string *p_p;
  _OWORD *v22;
  __int128 v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  std::string *size;
  __int128 v31;
  char *v32;
  __int128 v33;
  int64x2_t v34;
  char *v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  std::__fs::filesystem::path::__string_view v42;
  std::basic_string_view<_CharT, _Traits>::size_type v43;
  std::__fs::filesystem::path *v44;
  std::__fs::filesystem::path *v45;
  skit::internal::IndexDiskImplV2 *v46;
  std::__fs::filesystem::path::__string_view v47;
  void *p_ec;
  std::basic_string_view<_CharT, _Traits>::size_type v49;
  std::basic_string_view<_CharT, _Traits>::size_type v50;
  unint64_t v51;
  _QWORD *v52;
  _QWORD *v53;
  std::string::pointer data;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  skit::internal::IndexDiskImplV2 **v60;
  unint64_t v61;
  skit::internal::IndexDiskImplV2 *v62;
  __int128 v63;
  char *v64;
  void *v65;
  const char *v66;
  std::string::size_type v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  std::__shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  void ***i;
  void ***v75;
  NSObject *v76;
  std::__fs::filesystem::path v77;
  std::string v78;
  std::string __p;
  uint64_t v80;
  std::__shared_weak_count *v81;
  __int128 v82;
  char *v83;
  std::string v84;
  std::string::size_type v85;
  std::__shared_weak_count *v86;
  int v87;
  const std::error_category *v88;
  std::string __ec;
  char *v90;
  std::string::size_type *v91;
  uint64_t v92;

  v1 = this;
  v92 = *MEMORY[0x1E0C80C00];
  std::__fs::filesystem::__status(this, 0);
  if (__ec.__r_.__value_.__s.__data_[0] == 255 || __ec.__r_.__value_.__s.__data_[0] == 0)
  {
    LODWORD(__ec.__r_.__value_.__l.__data_) = 0;
    __ec.__r_.__value_.__l.__size_ = (std::string::size_type)std::system_category();
    if (std::__fs::filesystem::__create_directories(v1, (std::error_code *)&__ec))
    {
      v3 = 0;
      v1[12].__pn_.__r_.__value_.__s.__data_[0] = 1;
      return v3;
    }
    return 0xFFFFFFFFLL;
  }
  LODWORD(__ec.__r_.__value_.__l.__data_) = 0;
  __ec.__r_.__value_.__l.__size_ = (std::string::size_type)std::system_category();
  std::__fs::filesystem::__status(v1, (std::error_code *)&__ec);
  if (v84.__r_.__value_.__s.__data_[0] != 2)
    return 0xFFFFFFFFLL;
  v87 = 0;
  v88 = std::system_category();
  MEMORY[0x1D179DD0C](&v85, v1, &v87, 2);
  if (!v87)
  {
    std::__fs::filesystem::path::path[abi:ne180100]<char [5],void>(&v84, (std::string *)".tbl");
    v82 = 0uLL;
    v83 = 0;
    v4 = v85;
    v5 = (std::string::size_type)v86;
    if (v86)
    {
      p_shared_owners = (unint64_t *)&v86->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
      v8 = v86;
      v77.__pn_.__r_.__value_.__r.__words[0] = v4;
      v77.__pn_.__r_.__value_.__l.__size_ = v5;
      if (v86)
      {
        v9 = (unint64_t *)&v86->__shared_owners_;
        do
          v10 = __ldxr(v9);
        while (__stxr(v10 + 1, v9));
        v80 = 0;
        v81 = 0;
        do
          v11 = __ldaxr(v9);
        while (__stlxr(v11 - 1, v9));
        if (!v11)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
LABEL_24:
        v13 = v80;
        while (v77.__pn_.__r_.__value_.__r.__words[0] != v13)
        {
          v14 = (const std::__fs::filesystem::path *)std::__fs::filesystem::directory_iterator::__dereference((const std::__fs::filesystem::directory_iterator *)&v77);
          v15 = (std::__fs::filesystem::path *)v14;
          if (((1 << v14[3].__pn_.__r_.__value_.__s.__data_[1]) & 0x13) != 0)
          {
            std::__fs::filesystem::__status(v14, 0);
            v16 = __ec.__r_.__value_.__s.__data_[0];
          }
          else
          {
            v16 = v14[3].__pn_.__r_.__value_.__s.__data_[0];
          }
          if (v16 == 1)
          {
            std::__fs::filesystem::path::extension[abi:ne180100]((uint64_t)&__ec, v15);
            if ((v84.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v17.__data_ = (const std::string_view::value_type *)&v84;
            else
              v17.__data_ = (const std::string_view::value_type *)v84.__r_.__value_.__r.__words[0];
            if ((v84.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v17.__size_ = HIBYTE(v84.__r_.__value_.__r.__words[2]);
            else
              v17.__size_ = v84.__r_.__value_.__l.__size_;
            v18 = std::__fs::filesystem::path::__compare((const std::__fs::filesystem::path *)&__ec, v17);
            v19 = v18;
            if (SHIBYTE(__ec.__r_.__value_.__r.__words[2]) < 0)
            {
              operator delete(__ec.__r_.__value_.__l.__data_);
              if (v19)
                goto LABEL_73;
            }
            else if (v18)
            {
              goto LABEL_73;
            }
            std::__fs::filesystem::path::stem[abi:ne180100]((uint64_t)&__p, v15);
            v20 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            {
              p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
              if (__p.__r_.__value_.__l.__size_ <= 6)
                goto LABEL_72;
            }
            else
            {
              if (HIBYTE(__p.__r_.__value_.__r.__words[2]) < 7u)
                goto LABEL_73;
              p_p = &__p;
            }
            if (strncmp((const char *)p_p, "index-", 6uLL))
            {
              if ((v20 & 0x80) == 0)
                goto LABEL_73;
LABEL_71:
              p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
LABEL_72:
              operator delete(p_p);
              goto LABEL_73;
            }
            v22 = (_OWORD *)*((_QWORD *)&v82 + 1);
            if (*((_QWORD *)&v82 + 1) >= (unint64_t)v83)
            {
              v24 = v82;
              v25 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v82 + 1) - v82) >> 3);
              v26 = v25 + 1;
              if (v25 + 1 > 0xAAAAAAAAAAAAAAALL)
                std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
              if (0x5555555555555556 * ((uint64_t)&v83[-v82] >> 3) > v26)
                v26 = 0x5555555555555556 * ((uint64_t)&v83[-v82] >> 3);
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v83[-v82] >> 3) >= 0x555555555555555)
                v27 = 0xAAAAAAAAAAAAAAALL;
              else
                v27 = v26;
              v91 = (std::string::size_type *)&v83;
              if (v27)
              {
                if (v27 > 0xAAAAAAAAAAAAAAALL)
                  std::__throw_bad_array_new_length[abi:ne180100]();
                v28 = (char *)operator new(24 * v27);
              }
              else
              {
                v28 = 0;
              }
              size = (std::string *)&v28[24 * v25];
              __ec.__r_.__value_.__r.__words[0] = (std::string::size_type)v28;
              __ec.__r_.__value_.__l.__size_ = (std::string::size_type)size;
              __ec.__r_.__value_.__r.__words[2] = (std::string::size_type)size;
              v90 = &v28[24 * v27];
              if (SHIBYTE(v15->__pn_.__r_.__value_.__r.__words[2]) < 0)
              {
                std::string::__init_copy_ctor_external(size, v15->__pn_.__r_.__value_.__l.__data_, v15->__pn_.__r_.__value_.__l.__size_);
                v22 = (_OWORD *)*((_QWORD *)&v82 + 1);
                v24 = v82;
                v32 = (char *)__ec.__r_.__value_.__r.__words[2];
                size = (std::string *)__ec.__r_.__value_.__l.__size_;
              }
              else
              {
                v31 = *(_OWORD *)&v15->__pn_.__r_.__value_.__l.__data_;
                size->__r_.__value_.__r.__words[2] = v15->__pn_.__r_.__value_.__r.__words[2];
                *(_OWORD *)&size->__r_.__value_.__l.__data_ = v31;
                v32 = &v28[24 * v25];
              }
              v29 = v32 + 24;
              __ec.__r_.__value_.__r.__words[2] = (std::string::size_type)(v32 + 24);
              if (v22 == (_OWORD *)v24)
              {
                v34 = vdupq_n_s64(v24);
              }
              else
              {
                do
                {
                  v33 = *(_OWORD *)((char *)v22 - 24);
                  size[-1].__r_.__value_.__r.__words[2] = *((_QWORD *)v22 - 1);
                  *(_OWORD *)&size[-1].__r_.__value_.__l.__data_ = v33;
                  --size;
                  *((_QWORD *)v22 - 2) = 0;
                  *((_QWORD *)v22 - 1) = 0;
                  *((_QWORD *)v22 - 3) = 0;
                  v22 = (_OWORD *)((char *)v22 - 24);
                }
                while (v22 != (_OWORD *)v24);
                v34 = (int64x2_t)v82;
                v29 = (char *)__ec.__r_.__value_.__r.__words[2];
              }
              *(_QWORD *)&v82 = size;
              *((_QWORD *)&v82 + 1) = v29;
              *(int64x2_t *)&__ec.__r_.__value_.__r.__words[1] = v34;
              v35 = v83;
              v83 = v90;
              v90 = v35;
              __ec.__r_.__value_.__r.__words[0] = v34.i64[0];
              std::__split_buffer<std::__fs::filesystem::path>::~__split_buffer((uint64_t)&__ec);
              v20 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
            }
            else
            {
              if (SHIBYTE(v15->__pn_.__r_.__value_.__r.__words[2]) < 0)
              {
                std::string::__init_copy_ctor_external(*((std::string **)&v82 + 1), v15->__pn_.__r_.__value_.__l.__data_, v15->__pn_.__r_.__value_.__l.__size_);
              }
              else
              {
                v23 = *(_OWORD *)&v15->__pn_.__r_.__value_.__l.__data_;
                *(_QWORD *)(*((_QWORD *)&v82 + 1) + 16) = *((_QWORD *)&v15->__pn_.__r_.__value_.__l + 2);
                *v22 = v23;
              }
              v29 = (char *)v22 + 24;
            }
            *((_QWORD *)&v82 + 1) = v29;
            if (v20 < 0)
              goto LABEL_71;
          }
LABEL_73:
          std::__fs::filesystem::directory_iterator::__increment((std::__fs::filesystem::directory_iterator *)&v77, 0);
        }
        v36 = v81;
        if (v81)
        {
          v37 = (unint64_t *)&v81->__shared_owners_;
          do
            v38 = __ldaxr(v37);
          while (__stlxr(v38 - 1, v37));
          if (!v38)
          {
            ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
            std::__shared_weak_count::__release_weak(v36);
          }
        }
        v39 = (std::__shared_weak_count *)v77.__pn_.__r_.__value_.__l.__size_;
        if (v77.__pn_.__r_.__value_.__l.__size_)
        {
          v40 = (unint64_t *)(v77.__pn_.__r_.__value_.__l.__size_ + 8);
          do
            v41 = __ldaxr(v40);
          while (__stlxr(v41 - 1, v40));
          if (!v41)
          {
            ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
            std::__shared_weak_count::__release_weak(v39);
          }
        }
        v42.__data_ = (const std::string_view::value_type *)*((_QWORD *)&v82 + 1);
        v43 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)&v82 + 1) - v82) >> 3));
        if (*((_QWORD *)&v82 + 1) == (_QWORD)v82)
          v42.__size_ = 0;
        else
          v42.__size_ = v43;
        std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *,false>(v82, v42, 1);
        v44 = (std::__fs::filesystem::path *)*((_QWORD *)&v82 + 1);
        v45 = (std::__fs::filesystem::path *)v82;
        if ((_QWORD)v82 != *((_QWORD *)&v82 + 1))
        {
          while (1)
          {
            v46 = (skit::internal::IndexDiskImplV2 *)operator new();
            v47 = std::__fs::filesystem::path::__parent_path(v45);
            if (v47.__size_ >= 0x7FFFFFFFFFFFFFF8)
              std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
            if (v47.__size_ >= 0x17)
            {
              v49 = (v47.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v47.__size_ | 7) != 0x17)
                v49 = v47.__size_ | 7;
              v50 = v49 + 1;
              p_ec = operator new(v49 + 1);
              __ec.__r_.__value_.__l.__size_ = v47.__size_;
              __ec.__r_.__value_.__r.__words[2] = v50 | 0x8000000000000000;
              __ec.__r_.__value_.__r.__words[0] = (std::string::size_type)p_ec;
            }
            else
            {
              *((_BYTE *)&__ec.__r_.__value_.__s + 23) = v47.__size_;
              p_ec = &__ec;
              if (!v47.__size_)
                goto LABEL_96;
            }
            memmove(p_ec, v47.__data_, v47.__size_);
LABEL_96:
            *((_BYTE *)p_ec + v47.__size_) = 0;
            __p = __ec;
            std::__fs::filesystem::path::stem[abi:ne180100]((uint64_t)&v77, v45);
            std::__fs::filesystem::operator/[abi:ne180100](&v78, (uint64_t)&__p, &v77);
            skit::internal::IndexDiskImplV2::IndexDiskImplV2(v46, (std::__fs::filesystem::path *)&v78);
            v52 = (_QWORD *)v1[1].__pn_.__r_.__value_.__l.__size_;
            v51 = v1[1].__pn_.__r_.__value_.__r.__words[2];
            if ((unint64_t)v52 >= v51)
            {
              data = v1[1].__pn_.__r_.__value_.__l.__data_;
              v55 = ((char *)v52 - data) >> 3;
              v56 = v55 + 1;
              if ((unint64_t)(v55 + 1) >> 61)
                std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
              v57 = v51 - (_QWORD)data;
              if (v57 >> 2 > v56)
                v56 = v57 >> 2;
              if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF8)
                v58 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v58 = v56;
              v91 = &v1[1].__pn_.__r_.__value_.__r.__words[2];
              if (v58)
              {
                v58 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<skit::internal::IndexDiskImplV2>>>(v58);
                data = v1[1].__pn_.__r_.__value_.__l.__data_;
                v52 = (_QWORD *)v1[1].__pn_.__r_.__value_.__l.__size_;
              }
              else
              {
                v59 = 0;
              }
              v60 = (skit::internal::IndexDiskImplV2 **)(v58 + 8 * v55);
              v61 = v58 + 8 * v59;
              v90 = (char *)v61;
              *v60 = v46;
              __ec.__r_.__value_.__r.__words[2] = (std::string::size_type)(v60 + 1);
              if (v52 == (_QWORD *)data)
              {
                v53 = v60 + 1;
              }
              else
              {
                do
                {
                  v62 = (skit::internal::IndexDiskImplV2 *)*--v52;
                  *v52 = 0;
                  *--v60 = v62;
                }
                while (v52 != (_QWORD *)data);
                v53 = (_QWORD *)__ec.__r_.__value_.__r.__words[2];
                v61 = (unint64_t)v90;
              }
              v63 = *(_OWORD *)&v1[1].__pn_.__r_.__value_.__l.__data_;
              v1[1].__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)v60;
              v1[1].__pn_.__r_.__value_.__l.__size_ = (std::string::size_type)v53;
              *(_OWORD *)&__ec.__r_.__value_.__r.__words[1] = v63;
              v64 = (char *)v1[1].__pn_.__r_.__value_.__r.__words[2];
              v1[1].__pn_.__r_.__value_.__r.__words[2] = v61;
              v90 = v64;
              __ec.__r_.__value_.__r.__words[0] = v63;
              std::__split_buffer<std::unique_ptr<skit::internal::IndexDiskImplV2>>::~__split_buffer((uint64_t)&__ec);
            }
            else
            {
              *v52 = v46;
              v53 = v52 + 1;
            }
            v1[1].__pn_.__r_.__value_.__l.__size_ = (std::string::size_type)v53;
            if (SHIBYTE(v78.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v78.__r_.__value_.__l.__data_);
            if (SHIBYTE(v77.__pn_.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v77.__pn_.__r_.__value_.__l.__data_);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            if ((skit::internal::IndexDiskImplV2::open(*(skit::internal::IndexDiskImplV2 **)(v1[1].__pn_.__r_.__value_.__l.__size_
                                                                                            - 8)) & 0x80000000) != 0)
            {
              v75 = (void ***)v1[1].__pn_.__r_.__value_.__l.__data_;
              for (i = (void ***)v1[1].__pn_.__r_.__value_.__l.__size_;
                    i != v75;
                    std::unique_ptr<skit::internal::IndexDiskImplV2>::reset[abi:ne180100](i))
              {
                --i;
              }
              v1[1].__pn_.__r_.__value_.__l.__size_ = (std::string::size_type)v75;
              v3 = 0xFFFFFFFFLL;
              goto LABEL_136;
            }
            if (++v45 == v44)
            {
              if ((_QWORD)v82 == *((_QWORD *)&v82 + 1))
                break;
              std::__fs::filesystem::path::stem[abi:ne180100]((uint64_t)&__p, (std::__fs::filesystem::path *)(*((_QWORD *)&v82 + 1) - 24));
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              {
                v65 = (void *)__p.__r_.__value_.__r.__words[0];
                std::string::__init_copy_ctor_external(&__ec, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
                operator delete(v65);
              }
              else
              {
                __ec = __p;
              }
              if ((*((_BYTE *)&__ec.__r_.__value_.__s + 23) & 0x80) == 0)
              {
                if (HIBYTE(__ec.__r_.__value_.__r.__words[2]) < 7u)
                  break;
                __p.__r_.__value_.__r.__words[0] = 0;
                v66 = &__ec.__r_.__value_.__s.__data_[6];
                goto LABEL_129;
              }
              if (__ec.__r_.__value_.__l.__size_ > 6)
              {
                __p.__r_.__value_.__r.__words[0] = 0;
                v66 = (const char *)(__ec.__r_.__value_.__r.__words[0] + 6);
LABEL_129:
                LODWORD(v1[11].__pn_.__r_.__value_.__r.__words[1]) = strtoul(v66, &__p.__r_.__value_.__l.__data_, 16)
                                                                   + 1;
                if ((SHIBYTE(__ec.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
                  break;
              }
              operator delete(__ec.__r_.__value_.__l.__data_);
              break;
            }
          }
        }
        v67 = v1[1].__pn_.__r_.__value_.__l.__size_;
        if (v1[1].__pn_.__r_.__value_.__r.__words[0] != v67)
        {
          v69 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)(v67 - 8) + 192) + 32);
          v68 = *v69;
          v70 = v69[1] - 1;
          if (v70 > *v69)
            v68 = v70;
          skit::internal::MetaStoreHeader::base_id((skit::internal::MetaStoreHeader *)&v1[4], v68 + 1);
        }
        v3 = 0;
        v1[12].__pn_.__r_.__value_.__s.__data_[0] = 1;
LABEL_136:
        __ec.__r_.__value_.__r.__words[0] = (std::string::size_type)&v82;
        std::vector<std::__fs::filesystem::path>::__destroy_vector::operator()[abi:ne180100]((void ***)&__ec);
        if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v84.__r_.__value_.__l.__data_);
        goto LABEL_138;
      }
    }
    else
    {
      *(_OWORD *)&v77.__pn_.__r_.__value_.__l.__data_ = v85;
    }
    v80 = 0;
    v81 = 0;
    goto LABEL_24;
  }
  if (skit::internal::get_logging_context(void)::once != -1)
  v76 = skit::internal::get_logging_context(void)::logger;
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    if (SHIBYTE(v1->__pn_.__r_.__value_.__r.__words[2]) < 0)
      v1 = (const std::__fs::filesystem::path *)v1->__pn_.__r_.__value_.__r.__words[0];
    LODWORD(__ec.__r_.__value_.__l.__data_) = 136446466;
    *(std::string::size_type *)((char *)__ec.__r_.__value_.__r.__words + 4) = (std::string::size_type)v1;
    WORD2(__ec.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&__ec.__r_.__value_.__r.__words[1] + 6) = v87;
    _os_log_error_impl(&dword_1CB748000, v76, OS_LOG_TYPE_ERROR, "MultiIndexV2::open : failed to construct directory iterator %{public}s : %{darwin.errno}d", (uint8_t *)&__ec, 0x12u);
  }
  v3 = 0xFFFFFFFFLL;
LABEL_138:
  v71 = v86;
  if (v86)
  {
    v72 = (unint64_t *)&v86->__shared_owners_;
    do
      v73 = __ldaxr(v72);
    while (__stlxr(v73 - 1, v72));
    if (!v73)
    {
      ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
      std::__shared_weak_count::__release_weak(v71);
    }
  }
  return v3;
}

void sub_1CB759DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,char *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,char a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40,char a41)
{
  void *v41;

  operator delete(v41);
  a23 = &a32;
  std::vector<std::__fs::filesystem::path>::__destroy_vector::operator()[abi:ne180100]((void ***)&a23);
  if (a40 < 0)
    operator delete(__p);
  std::shared_ptr<skit::internal::AliasImpl>::~shared_ptr[abi:ne180100]((uint64_t)&a41);
  _Unwind_Resume(a1);
}

void std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *,false>(uint64_t a1, std::__fs::filesystem::path::__string_view a2, char a3)
{
  std::basic_string_view<_CharT, _Traits>::size_type size;
  const std::string_view::value_type *data;
  std::__fs::filesystem::path *v7;
  std::basic_string_view<_CharT, _Traits>::size_type v8;
  std::__fs::filesystem::path *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  std::string_view::value_type *v14;
  std::__fs::filesystem::path::__string_view v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  const std::__fs::filesystem::path *v20;
  const std::__fs::filesystem::path *v21;
  const std::__fs::filesystem::path *v22;
  std::__fs::filesystem::path *v23;
  __int128 v24;
  std::string::size_type v25;
  std::string::size_type v26;
  std::__fs::filesystem::path *v27;
  __int128 v28;
  __int128 v29;
  BOOL v30;
  __int128 v31;
  const std::string_view::value_type *v32;
  int v33;
  std::string_view::value_type *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  std::__fs::filesystem::path *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  const std::__fs::filesystem::path *v44;
  BOOL v46;
  uint64_t v47;
  const std::__fs::filesystem::path *v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  void **v52;
  uint64_t v53;
  __int128 v54;
  int64_t v55;
  int64_t v56;
  int64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  __int128 v66;
  int64_t v67;
  const std::string_view::value_type *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  std::string::size_type v78;
  uint64_t v79;
  int64_t v80;
  unint64_t v81;
  unint64_t v82;
  __int128 v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  BOOL v88;
  char *v89;
  __int128 v90;
  char *v91;
  void **v92;
  char *v93;
  __int128 v94;
  uint64_t v95;
  std::basic_string_view<_CharT, _Traits>::size_type v96;
  char v97;
  const std::string_view::value_type *v98;
  std::__fs::filesystem::path v99;
  std::__fs::filesystem::path v100;
  uint64_t v101;
  std::__fs::filesystem::path::__string_view v102;
  std::__fs::filesystem::path::__string_view v103;
  std::__fs::filesystem::path::__string_view v104;
  std::__fs::filesystem::path::__string_view v105;
  std::__fs::filesystem::path::__string_view v106;
  std::__fs::filesystem::path::__string_view v107;
  std::__fs::filesystem::path::__string_view v108;
  std::__fs::filesystem::path::__string_view v109;
  std::__fs::filesystem::path::__string_view v110;

  size = a2.__size_;
  data = a2.__data_;
  v101 = *MEMORY[0x1E0C80C00];
LABEL_2:
  v7 = (std::__fs::filesystem::path *)(data - 24);
  v96 = (std::basic_string_view<_CharT, _Traits>::size_type)(data - 48);
  v98 = data;
  v8 = (std::basic_string_view<_CharT, _Traits>::size_type)(data - 72);
  v9 = (std::__fs::filesystem::path *)a1;
  while (2)
  {
    a1 = (uint64_t)v9;
    v10 = data - (const std::string_view::value_type *)v9;
    v11 = 0xAAAAAAAAAAAAAAABLL * (v10 >> 3);
    switch(v11)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        a2.__data_ = (const std::string_view::value_type *)a1;
        if (std::__fs::filesystem::operator<[abi:ne180100](v7, a2))
        {
          v41 = *(_OWORD *)a1;
          v99.__pn_.__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 16);
          *(_OWORD *)&v99.__pn_.__r_.__value_.__l.__data_ = v41;
          v42 = *(_OWORD *)&v7->__pn_.__r_.__value_.__l.__data_;
          *(_QWORD *)(a1 + 16) = *((_QWORD *)&v7->__pn_.__r_.__value_.__l + 2);
          *(_OWORD *)a1 = v42;
          v43 = *(_OWORD *)&v99.__pn_.__r_.__value_.__l.__data_;
          v7->__pn_.__r_.__value_.__r.__words[2] = v99.__pn_.__r_.__value_.__r.__words[2];
          *(_OWORD *)&v7->__pn_.__r_.__value_.__l.__data_ = v43;
        }
        return;
      case 3uLL:
        v108.__data_ = (const std::string_view::value_type *)(a1 + 24);
        v108.__size_ = (std::basic_string_view<_CharT, _Traits>::size_type)v7;
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((__int128 *)a1, v108);
        return;
      case 4uLL:
        v109.__data_ = (const std::string_view::value_type *)(a1 + 24);
        v109.__size_ = a1 + 48;
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>(a1, v109, v7);
        return;
      case 5uLL:
        v110.__data_ = (const std::string_view::value_type *)(a1 + 24);
        v110.__size_ = a1 + 48;
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>(a1, v110, (std::__fs::filesystem::path *)(a1 + 72), v7);
        return;
      default:
        if (v10 <= 575)
        {
          v44 = (const std::__fs::filesystem::path *)(a1 + 24);
          v46 = (const std::string_view::value_type *)a1 == data || v44 == (const std::__fs::filesystem::path *)data;
          if ((a3 & 1) != 0)
          {
            if (!v46)
            {
              v47 = 0;
              v48 = (const std::__fs::filesystem::path *)a1;
              do
              {
                a2.__data_ = (const std::string_view::value_type *)v48;
                v48 = v44;
                if (std::__fs::filesystem::operator<[abi:ne180100](v44, a2))
                {
                  v49 = *(_OWORD *)&v48->__pn_.__r_.__value_.__l.__data_;
                  v99.__pn_.__r_.__value_.__r.__words[2] = v48->__pn_.__r_.__value_.__r.__words[2];
                  *(_OWORD *)&v99.__pn_.__r_.__value_.__l.__data_ = v49;
                  v48->__pn_.__r_.__value_.__l.__size_ = 0;
                  v48->__pn_.__r_.__value_.__r.__words[2] = 0;
                  v48->__pn_.__r_.__value_.__r.__words[0] = 0;
                  v50 = v47;
                  do
                  {
                    v51 = a1 + v50;
                    v52 = (void **)(a1 + v50 + 24);
                    if (*(char *)(a1 + v50 + 47) < 0)
                      operator delete(*v52);
                    *(_OWORD *)v52 = *(_OWORD *)v51;
                    *(_QWORD *)(a1 + v50 + 40) = *(_QWORD *)(v51 + 16);
                    *(_BYTE *)(v51 + 23) = 0;
                    *(_BYTE *)v51 = 0;
                    if (!v50)
                    {
                      v53 = a1;
                      goto LABEL_83;
                    }
                    v50 -= 24;
                    a2.__data_ = (const std::string_view::value_type *)(a1 + v50);
                  }
                  while ((std::__fs::filesystem::operator<[abi:ne180100](&v99, a2) & 1) != 0);
                  v53 = a1 + v50 + 24;
                  if (*(char *)(a1 + v50 + 47) < 0)
                    operator delete(*(void **)v53);
LABEL_83:
                  data = v98;
                  v54 = *(_OWORD *)&v99.__pn_.__r_.__value_.__l.__data_;
                  *(_QWORD *)(v53 + 16) = *((_QWORD *)&v99.__pn_.__r_.__value_.__l + 2);
                  *(_OWORD *)v53 = v54;
                }
                v44 = v48 + 1;
                v47 += 24;
              }
              while (&v48[1] != (const std::__fs::filesystem::path *)data);
            }
          }
          else if (!v46)
          {
            v89 = (char *)(a1 + 47);
            do
            {
              a2.__data_ = (const std::string_view::value_type *)a1;
              a1 = (uint64_t)v44;
              if (std::__fs::filesystem::operator<[abi:ne180100](v44, a2))
              {
                v90 = *(_OWORD *)a1;
                v99.__pn_.__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 16);
                *(_OWORD *)&v99.__pn_.__r_.__value_.__l.__data_ = v90;
                *(_QWORD *)(a1 + 8) = 0;
                *(_QWORD *)(a1 + 16) = 0;
                *(_QWORD *)a1 = 0;
                v91 = v89;
                do
                {
                  v92 = (void **)(v91 - 23);
                  if (*v91 < 0)
                    operator delete(*v92);
                  *(_OWORD *)v92 = *(_OWORD *)(v91 - 47);
                  *(_QWORD *)(v91 - 7) = *(_QWORD *)(v91 - 31);
                  *(v91 - 47) = 0;
                  v93 = v91 - 47;
                  v93[23] = 0;
                  v91 -= 24;
                  a2.__data_ = v93 - 24;
                }
                while ((std::__fs::filesystem::operator<[abi:ne180100](&v99, a2) & 1) != 0);
                if (v93[23] < 0)
                  operator delete(*(void **)v93);
                v94 = *(_OWORD *)&v99.__pn_.__r_.__value_.__l.__data_;
                *((_QWORD *)v93 + 2) = *((_QWORD *)&v99.__pn_.__r_.__value_.__l + 2);
                *(_OWORD *)v93 = v94;
                data = v98;
              }
              v44 = (const std::__fs::filesystem::path *)(a1 + 24);
              v89 += 24;
            }
            while ((const std::string_view::value_type *)(a1 + 24) != data);
          }
          return;
        }
        if (!size)
        {
          if ((const std::string_view::value_type *)a1 != data)
          {
            v55 = (v11 - 2) >> 1;
            v56 = v55;
            do
            {
              v57 = v56;
              if (v55 >= v56)
              {
                v58 = (2 * v56) | 1;
                v59 = a1 + 24 * v58;
                if (2 * v56 + 2 < (uint64_t)v11)
                {
                  a2.__data_ = (const std::string_view::value_type *)(v59 + 24);
                  if (std::__fs::filesystem::operator<[abi:ne180100]((const std::__fs::filesystem::path *)(a1 + 24 * v58), a2))
                  {
                    v59 += 24;
                    v58 = 2 * v57 + 2;
                  }
                }
                v60 = a1 + 24 * v57;
                a2.__data_ = (const std::string_view::value_type *)v60;
                if ((std::__fs::filesystem::operator<[abi:ne180100]((const std::__fs::filesystem::path *)v59, a2) & 1) == 0)
                {
                  v61 = *(_OWORD *)v60;
                  v99.__pn_.__r_.__value_.__r.__words[2] = *(_QWORD *)(v60 + 16);
                  *(_OWORD *)&v99.__pn_.__r_.__value_.__l.__data_ = v61;
                  *(_QWORD *)(v60 + 8) = 0;
                  *(_QWORD *)(v60 + 16) = 0;
                  *(_QWORD *)v60 = 0;
                  while (1)
                  {
                    v62 = v59;
                    if (*(char *)(v60 + 23) < 0)
                      operator delete(*(void **)v60);
                    v63 = *(_OWORD *)v59;
                    *(_QWORD *)(v60 + 16) = *(_QWORD *)(v59 + 16);
                    *(_OWORD *)v60 = v63;
                    *(_BYTE *)(v59 + 23) = 0;
                    *(_BYTE *)v59 = 0;
                    if (v55 < v58)
                      break;
                    v64 = (2 * v58) | 1;
                    v59 = a1 + 24 * v64;
                    v65 = 2 * v58 + 2;
                    if (v65 < (uint64_t)v11)
                    {
                      a2.__data_ = (const std::string_view::value_type *)(v59 + 24);
                      if (std::__fs::filesystem::operator<[abi:ne180100]((const std::__fs::filesystem::path *)(a1 + 24 * v64), a2))
                      {
                        v59 += 24;
                        v64 = v65;
                      }
                    }
                    a2.__data_ = (const std::string_view::value_type *)&v99;
                    v60 = v62;
                    v58 = v64;
                    if (std::__fs::filesystem::operator<[abi:ne180100]((const std::__fs::filesystem::path *)v59, a2))
                    {
                      if (*(char *)(v62 + 23) < 0)
                        operator delete(*(void **)v62);
                      break;
                    }
                  }
                  v66 = *(_OWORD *)&v99.__pn_.__r_.__value_.__l.__data_;
                  *(_QWORD *)(v62 + 16) = *((_QWORD *)&v99.__pn_.__r_.__value_.__l + 2);
                  *(_OWORD *)v62 = v66;
                  data = v98;
                }
              }
              v56 = v57 - 1;
            }
            while (v57);
            v67 = v10 / 0x18uLL;
            do
            {
              v68 = data;
              v69 = 0;
              v95 = *(_QWORD *)a1;
              v100.__pn_.__r_.__value_.__r.__words[0] = *(_QWORD *)(a1 + 8);
              *(std::string::size_type *)((char *)v100.__pn_.__r_.__value_.__r.__words + 7) = *(_QWORD *)(a1 + 15);
              v97 = *(_BYTE *)(a1 + 23);
              *(_QWORD *)(a1 + 8) = 0;
              *(_QWORD *)(a1 + 16) = 0;
              *(_QWORD *)a1 = 0;
              v70 = v67 - 2;
              if (v67 < 2)
                v70 = v67 - 1;
              v71 = v70 >> 1;
              v72 = a1;
              do
              {
                v73 = v72 + 24 * v69 + 24;
                v74 = 2 * v69;
                v69 = (2 * v69) | 1;
                v75 = v74 + 2;
                if (v74 + 2 < v67)
                {
                  a2.__data_ = (const std::string_view::value_type *)(v73 + 24);
                  if (std::__fs::filesystem::operator<[abi:ne180100]((const std::__fs::filesystem::path *)v73, a2))
                  {
                    v73 += 24;
                    v69 = v75;
                  }
                }
                if (*(char *)(v72 + 23) < 0)
                  operator delete(*(void **)v72);
                v76 = *(_OWORD *)v73;
                *(_QWORD *)(v72 + 16) = *(_QWORD *)(v73 + 16);
                *(_OWORD *)v72 = v76;
                *(_BYTE *)(v73 + 23) = 0;
                *(_BYTE *)v73 = 0;
                v72 = v73;
              }
              while (v69 <= v71);
              data = v68 - 24;
              if ((const std::string_view::value_type *)v73 == v68 - 24)
              {
                *(_QWORD *)v73 = v95;
                v87 = *(std::string::size_type *)((char *)v100.__pn_.__r_.__value_.__r.__words + 7);
                *(_QWORD *)(v73 + 8) = v100.__pn_.__r_.__value_.__r.__words[0];
                *(_QWORD *)(v73 + 15) = v87;
                *(_BYTE *)(v73 + 23) = v97;
                v80 = v67 - 1;
              }
              else
              {
                v77 = *(_OWORD *)data;
                *(_QWORD *)(v73 + 16) = *((_QWORD *)v68 - 1);
                *(_OWORD *)v73 = v77;
                *((_QWORD *)v68 - 3) = v95;
                v78 = v100.__pn_.__r_.__value_.__r.__words[0];
                *(_QWORD *)(v68 - 9) = *(std::string::size_type *)((char *)v100.__pn_.__r_.__value_.__r.__words + 7);
                *((_QWORD *)v68 - 2) = v78;
                *((_BYTE *)v68 - 1) = v97;
                v79 = v73 - a1 + 24;
                v80 = v67 - 1;
                if (v79 >= 25)
                {
                  v81 = (unint64_t)(-2 - 0x5555555555555555 * (v79 >> 3)) >> 1;
                  v82 = a1 + 24 * v81;
                  a2.__data_ = (const std::string_view::value_type *)v73;
                  if (std::__fs::filesystem::operator<[abi:ne180100]((const std::__fs::filesystem::path *)v82, a2))
                  {
                    v83 = *(_OWORD *)v73;
                    v99.__pn_.__r_.__value_.__r.__words[2] = *(_QWORD *)(v73 + 16);
                    *(_OWORD *)&v99.__pn_.__r_.__value_.__l.__data_ = v83;
                    *(_QWORD *)(v73 + 8) = 0;
                    *(_QWORD *)(v73 + 16) = 0;
                    *(_QWORD *)v73 = 0;
                    while (1)
                    {
                      v84 = v82;
                      if (*(char *)(v73 + 23) < 0)
                        operator delete(*(void **)v73);
                      v85 = *(_OWORD *)v82;
                      *(_QWORD *)(v73 + 16) = *(_QWORD *)(v82 + 16);
                      *(_OWORD *)v73 = v85;
                      *(_BYTE *)(v82 + 23) = 0;
                      *(_BYTE *)v82 = 0;
                      if (!v81)
                        break;
                      v81 = (v81 - 1) >> 1;
                      v82 = a1 + 24 * v81;
                      a2.__data_ = (const std::string_view::value_type *)&v99;
                      v73 = v84;
                      if ((std::__fs::filesystem::operator<[abi:ne180100]((const std::__fs::filesystem::path *)v82, a2) & 1) == 0)
                      {
                        if (*(char *)(v84 + 23) < 0)
                          operator delete(*(void **)v84);
                        break;
                      }
                    }
                    v86 = *(_OWORD *)&v99.__pn_.__r_.__value_.__l.__data_;
                    *(_QWORD *)(v84 + 16) = *((_QWORD *)&v99.__pn_.__r_.__value_.__l + 2);
                    *(_OWORD *)v84 = v86;
                  }
                }
              }
              v88 = v67 <= 2;
              v67 = v80;
            }
            while (!v88);
          }
          return;
        }
        v12 = a1 + 24 * (v11 >> 1);
        if ((unint64_t)v10 < 0xC01)
        {
          v106.__data_ = (const std::string_view::value_type *)a1;
          v106.__size_ = (std::basic_string_view<_CharT, _Traits>::size_type)v7;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((__int128 *)(a1 + 24 * (v11 >> 1)), v106);
        }
        else
        {
          v102.__data_ = (const std::string_view::value_type *)(a1 + 24 * (v11 >> 1));
          v102.__size_ = (std::basic_string_view<_CharT, _Traits>::size_type)v7;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((__int128 *)a1, v102);
          v13 = 3 * (v11 >> 1);
          v14 = (std::string_view::value_type *)(a1 + 24 * (v11 >> 1) - 24);
          v103.__data_ = v14;
          v103.__size_ = v96;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((__int128 *)(a1 + 24), v103);
          v104.__data_ = (const std::string_view::value_type *)(a1 + 24 + 8 * v13);
          v104.__size_ = v8;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((__int128 *)(a1 + 48), v104);
          v105.__data_ = (const std::string_view::value_type *)v12;
          v105.__size_ = a1 + 24 + 8 * v13;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((__int128 *)v14, v105);
          v16 = *(_OWORD *)a1;
          v99.__pn_.__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 16);
          *(_OWORD *)&v99.__pn_.__r_.__value_.__l.__data_ = v16;
          v17 = *(_QWORD *)(v12 + 16);
          *(_OWORD *)a1 = *(_OWORD *)v12;
          *(_QWORD *)(a1 + 16) = v17;
          v18 = *(_OWORD *)&v99.__pn_.__r_.__value_.__l.__data_;
          *(_QWORD *)(v12 + 16) = *((_QWORD *)&v99.__pn_.__r_.__value_.__l + 2);
          *(_OWORD *)v12 = v18;
        }
        --size;
        data = v98;
        if ((a3 & 1) == 0)
        {
          v15.__data_ = (const std::string_view::value_type *)a1;
          if ((std::__fs::filesystem::operator<[abi:ne180100]((const std::__fs::filesystem::path *)(a1 - 24), v15) & 1) == 0)
          {
            v31 = *(_OWORD *)a1;
            v100.__pn_.__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 16);
            *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_ = v31;
            *(_QWORD *)(a1 + 8) = 0;
            *(_QWORD *)(a1 + 16) = 0;
            *(_QWORD *)a1 = 0;
            v15.__data_ = (const std::string_view::value_type *)v7;
            if ((std::__fs::filesystem::operator<[abi:ne180100](&v100, v15) & 1) != 0)
            {
              v9 = (std::__fs::filesystem::path *)a1;
              do
                a2.__data_ = (const std::string_view::value_type *)++v9;
              while ((std::__fs::filesystem::operator<[abi:ne180100](&v100, a2) & 1) == 0);
            }
            else
            {
              v32 = (const std::string_view::value_type *)(a1 + 24);
              do
              {
                v9 = (std::__fs::filesystem::path *)v32;
                if (v32 >= v98)
                  break;
                a2.__data_ = v32;
                v33 = std::__fs::filesystem::operator<[abi:ne180100](&v100, a2);
                v32 = (const std::string_view::value_type *)&v9[1];
              }
              while (!v33);
            }
            v34 = (std::string_view::value_type *)v98;
            if (v9 < (std::__fs::filesystem::path *)v98)
            {
              v34 = (std::string_view::value_type *)v98;
              do
              {
                v34 -= 24;
                a2.__data_ = v34;
              }
              while ((std::__fs::filesystem::operator<[abi:ne180100](&v100, a2) & 1) != 0);
            }
            while (v9 < (std::__fs::filesystem::path *)v34)
            {
              v35 = *(_OWORD *)&v9->__pn_.__r_.__value_.__l.__data_;
              v99.__pn_.__r_.__value_.__r.__words[2] = v9->__pn_.__r_.__value_.__r.__words[2];
              *(_OWORD *)&v99.__pn_.__r_.__value_.__l.__data_ = v35;
              v36 = *(_OWORD *)v34;
              v9->__pn_.__r_.__value_.__r.__words[2] = *((_QWORD *)v34 + 2);
              *(_OWORD *)&v9->__pn_.__r_.__value_.__l.__data_ = v36;
              v37 = *(_OWORD *)&v99.__pn_.__r_.__value_.__l.__data_;
              *((_QWORD *)v34 + 2) = *((_QWORD *)&v99.__pn_.__r_.__value_.__l + 2);
              *(_OWORD *)v34 = v37;
              do
                a2.__data_ = (const std::string_view::value_type *)++v9;
              while (!std::__fs::filesystem::operator<[abi:ne180100](&v100, a2));
              do
              {
                v34 -= 24;
                a2.__data_ = v34;
              }
              while ((std::__fs::filesystem::operator<[abi:ne180100](&v100, a2) & 1) != 0);
            }
            v38 = v9 - 1;
            if (&v9[-1] == (std::__fs::filesystem::path *)a1)
            {
              if (SHIBYTE(v9[-1].__pn_.__r_.__value_.__r.__words[2]) < 0)
                operator delete(*(void **)a1);
            }
            else
            {
              if (*(char *)(a1 + 23) < 0)
                operator delete(*(void **)a1);
              v39 = *(_OWORD *)&v38->__pn_.__r_.__value_.__l.__data_;
              *(_QWORD *)(a1 + 16) = *((_QWORD *)&v9[-1].__pn_.__r_.__value_.__l + 2);
              *(_OWORD *)a1 = v39;
              *((_BYTE *)&v9[-1].__pn_.__r_.__value_.__s + 23) = 0;
              v9[-1].__pn_.__r_.__value_.__s.__data_[0] = 0;
            }
            a3 = 0;
            v40 = *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_;
            v9[-1].__pn_.__r_.__value_.__r.__words[2] = v100.__pn_.__r_.__value_.__r.__words[2];
            *(_OWORD *)&v38->__pn_.__r_.__value_.__l.__data_ = v40;
            continue;
          }
        }
        v19 = *(_OWORD *)a1;
        v100.__pn_.__r_.__value_.__r.__words[2] = *(_QWORD *)(a1 + 16);
        *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_ = v19;
        *(_QWORD *)(a1 + 8) = 0;
        *(_QWORD *)(a1 + 16) = 0;
        *(_QWORD *)a1 = 0;
        v20 = (const std::__fs::filesystem::path *)a1;
        do
        {
          v21 = v20++;
          v15.__data_ = (const std::string_view::value_type *)&v100;
        }
        while ((std::__fs::filesystem::operator<[abi:ne180100](v20, v15) & 1) != 0);
        v22 = (const std::__fs::filesystem::path *)v98;
        if (v21 == (const std::__fs::filesystem::path *)a1)
        {
          v22 = (const std::__fs::filesystem::path *)v98;
          do
          {
            if (v20 >= v22)
              break;
            --v22;
            v15.__data_ = (const std::string_view::value_type *)&v100;
          }
          while ((std::__fs::filesystem::operator<[abi:ne180100](v22, v15) & 1) == 0);
        }
        else
        {
          do
          {
            --v22;
            v15.__data_ = (const std::string_view::value_type *)&v100;
          }
          while (!std::__fs::filesystem::operator<[abi:ne180100](v22, v15));
        }
        v9 = (std::__fs::filesystem::path *)v20;
        if (v20 < v22)
        {
          v23 = (std::__fs::filesystem::path *)v22;
          do
          {
            v99 = *v9;
            v24 = *(_OWORD *)&v99.__pn_.__r_.__value_.__l.__data_;
            v25 = v99.__pn_.__r_.__value_.__r.__words[2];
            v26 = v23->__pn_.__r_.__value_.__r.__words[2];
            *(_OWORD *)&v9->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&v23->__pn_.__r_.__value_.__l.__data_;
            v9->__pn_.__r_.__value_.__r.__words[2] = v26;
            v23->__pn_.__r_.__value_.__r.__words[2] = v25;
            *(_OWORD *)&v23->__pn_.__r_.__value_.__l.__data_ = v24;
            do
            {
              ++v9;
              v15.__data_ = (const std::string_view::value_type *)&v100;
            }
            while ((std::__fs::filesystem::operator<[abi:ne180100](v9, v15) & 1) != 0);
            do
            {
              --v23;
              v15.__data_ = (const std::string_view::value_type *)&v100;
            }
            while (!std::__fs::filesystem::operator<[abi:ne180100](v23, v15));
          }
          while (v9 < v23);
        }
        v27 = v9 - 1;
        if (&v9[-1] == (std::__fs::filesystem::path *)a1)
        {
          if (SHIBYTE(v9[-1].__pn_.__r_.__value_.__r.__words[2]) < 0)
            operator delete(*(void **)a1);
        }
        else
        {
          if (*(char *)(a1 + 23) < 0)
            operator delete(*(void **)a1);
          v28 = *(_OWORD *)&v27->__pn_.__r_.__value_.__l.__data_;
          *(_QWORD *)(a1 + 16) = *((_QWORD *)&v9[-1].__pn_.__r_.__value_.__l + 2);
          *(_OWORD *)a1 = v28;
          *((_BYTE *)&v9[-1].__pn_.__r_.__value_.__s + 23) = 0;
          v9[-1].__pn_.__r_.__value_.__s.__data_[0] = 0;
        }
        v29 = *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_;
        v9[-1].__pn_.__r_.__value_.__r.__words[2] = v100.__pn_.__r_.__value_.__r.__words[2];
        *(_OWORD *)&v27->__pn_.__r_.__value_.__l.__data_ = v29;
        if (v20 < v22)
        {
LABEL_34:
          std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *,false>(a1, &v9[-1], size, a3 & 1);
          a3 = 0;
          continue;
        }
        v15.__data_ = (const std::string_view::value_type *)&v9[-1];
        v30 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((std::__fs::filesystem::path *)a1, v15);
        v107.__data_ = v98;
        if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>(v9, v107))
        {
          if (v30)
            continue;
          goto LABEL_34;
        }
        data = (const std::string_view::value_type *)&v9[-1];
        if (!v30)
          goto LABEL_2;
        return;
    }
  }
}

double std::__fs::filesystem::path::stem[abi:ne180100](uint64_t a1, std::__fs::filesystem::path *this)
{
  std::__fs::filesystem::path::__string_view v3;
  __int128 *p_dst;
  std::basic_string_view<_CharT, _Traits>::size_type v5;
  std::basic_string_view<_CharT, _Traits>::size_type v6;
  double result;
  __int128 __dst;
  unint64_t v9;

  v3 = std::__fs::filesystem::path::__stem(this);
  if (v3.__size_ >= 0x7FFFFFFFFFFFFFF8)
    std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
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
  *(_OWORD *)a1 = __dst;
  *(_QWORD *)(a1 + 16) = v9;
  return result;
}

std::string *std::__fs::filesystem::operator/[abi:ne180100](std::string *this, uint64_t a2, std::__fs::filesystem::path *a3)
{
  int v6;
  std::__fs::filesystem::path *v7;
  std::string::size_type size;

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    *this = *(std::string *)a2;
  if (std::__fs::filesystem::path::__root_directory(a3).__size_)
    return std::string::operator=(this, &a3->__pn_);
  if (std::__fs::filesystem::path::__filename((const std::__fs::filesystem::path *)this).__size_)
    std::string::push_back(this, 47);
  v6 = SHIBYTE(a3->__pn_.__r_.__value_.__r.__words[2]);
  if (v6 >= 0)
    v7 = a3;
  else
    v7 = (std::__fs::filesystem::path *)a3->__pn_.__r_.__value_.__r.__words[0];
  if (v6 >= 0)
    size = HIBYTE(a3->__pn_.__r_.__value_.__r.__words[2]);
  else
    size = a3->__pn_.__r_.__value_.__l.__size_;
  return std::string::append(this, (const std::string::value_type *)v7, size);
}

void sub_1CB75AB10(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

skit::internal::IndexDiskImplV2 *skit::internal::IndexDiskImplV2::IndexDiskImplV2(skit::internal::IndexDiskImplV2 *this, std::__fs::filesystem::path *a2)
{
  const std::string::value_type *v4;
  uint64_t v5;
  int v6;
  _BOOL4 v7;
  std::string __p;
  std::string v10;
  std::string v11;
  _BYTE v12[15];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (SHIBYTE(a2->__pn_.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, a2->__pn_.__r_.__value_.__l.__data_, a2->__pn_.__r_.__value_.__l.__size_);
  else
    __p = a2->__pn_;
  skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvStore((uint64_t)this, (__int128 *)&__p, skit::default_kv_store_config, unk_1EF99BC30);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  *(_QWORD *)&v12[7] = *(std::string::size_type *)((char *)&a2->__pn_.__r_.__value_.__r.__words[1] + 7);
  v4 = (const std::string::value_type *)a2->__pn_.__r_.__value_.__r.__words[0];
  *(_QWORD *)v12 = a2->__pn_.__r_.__value_.__l.__size_;
  v5 = *(_QWORD *)v12;
  v6 = SHIBYTE(a2->__pn_.__r_.__value_.__r.__words[2]);
  a2->__pn_.__r_.__value_.__l.__size_ = 0;
  a2->__pn_.__r_.__value_.__r.__words[2] = 0;
  a2->__pn_.__r_.__value_.__r.__words[0] = 0;
  *((_QWORD *)this + 21) = v4;
  *((_QWORD *)this + 22) = v5;
  *(_QWORD *)((char *)this + 183) = *(_QWORD *)&v12[7];
  *((_BYTE *)this + 191) = v6;
  *((_QWORD *)this + 24) = 0;
  *((_QWORD *)this + 25) = 0;
  *((_QWORD *)this + 26) = 0;
  if (v6 < 0)
    std::string::__init_copy_ctor_external(&v10, v4, *((_QWORD *)this + 22));
  else
    v10 = *(std::string *)((_BYTE *)this + 7);
  std::string::append[abi:ne180100]<char const*,0>(&v10, (std::string *)".xid", (std::string *)"");
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v11, v10.__r_.__value_.__l.__data_, v10.__r_.__value_.__l.__size_);
    v7 = (v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0;
  }
  else
  {
    v7 = 0;
    v11 = v10;
  }
  *((_QWORD *)this + 28) = 0;
  *((_QWORD *)this + 29) = 0;
  *((std::string *)this + 10) = v11;
  *((_DWORD *)this + 66) = -1;
  *((_WORD *)this + 134) = 416;
  *((_QWORD *)this + 34) = 0x500000400;
  *((_QWORD *)this + 35) = 10485760;
  if (v7)
    operator delete(v10.__r_.__value_.__l.__data_);
  *((_QWORD *)this + 36) = 0;
  *((_QWORD *)this + 37) = 0;
  return this;
}

void sub_1CB75ACDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;
  skit::internal::MmapFile *v22;
  void **v23;

  skit::internal::MmapFile::~MmapFile(v22);
  if (*(char *)(v21 + 191) < 0)
    operator delete(*v23);
  skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::~KvStore(v21);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<skit::internal::IndexDiskImplV2>>>(unint64_t a1)
{
  if (a1 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a1);
}

uint64_t std::__split_buffer<std::unique_ptr<skit::internal::IndexDiskImplV2>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    std::unique_ptr<skit::internal::IndexDiskImplV2>::reset[abi:ne180100]((void ***)(i - 8));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void skit::internal::MetaStoreHeader::base_id(skit::internal::MetaStoreHeader *this, uint64_t a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if (*((_DWORD *)this + 3))
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v2 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_error_impl(&dword_1CB748000, v2, OS_LOG_TYPE_ERROR, "MetaStoreHeader::set_base_doc_id : cannot reset base doc ID to a non empty meta store", v3, 2u);
    }
  }
  else
  {
    *((_QWORD *)this + 4) = a2;
    *((_QWORD *)this + 5) = a2;
  }
}

uint64_t std::__split_buffer<std::__fs::filesystem::path>::~__split_buffer(uint64_t a1)
{
  void **v2;
  void **v3;
  void **v4;

  v3 = *(void ***)(a1 + 8);
  v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      v4 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v4);
        v4 = *(void ***)(a1 + 16);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::__fs::filesystem::operator<[abi:ne180100](const std::__fs::filesystem::path *a1, std::__fs::filesystem::path::__string_view a2)
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
  return std::__fs::filesystem::path::__compare(a1, a2) >> 31;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>(__int128 *a1, std::__fs::filesystem::path::__string_view a2)
{
  std::__fs::filesystem::path *size;
  std::__fs::filesystem::path *data;
  const std::__fs::filesystem::path *v5;
  char v6;
  uint64_t result;
  std::__fs::filesystem::path::__string_view v8;
  std::string::size_type v9;
  __int128 v10;
  std::string::size_type v11;
  std::string::size_type v12;
  __int128 v13;
  std::string::size_type v14;
  std::string::size_type v15;
  __int128 v16;
  std::string::size_type v17;
  std::string::size_type v18;
  __int128 v19;
  std::string::size_type v20;
  std::string::size_type v21;
  std::__fs::filesystem::path::__string_view v22;

  size = (std::__fs::filesystem::path *)a2.__size_;
  data = (std::__fs::filesystem::path *)a2.__data_;
  v5 = (const std::__fs::filesystem::path *)a2.__data_;
  a2.__data_ = (const std::string_view::value_type *)a1;
  v6 = std::__fs::filesystem::operator<[abi:ne180100](v5, a2);
  v22.__data_ = (const std::string_view::value_type *)data;
  result = std::__fs::filesystem::operator<[abi:ne180100](size, v22);
  if ((v6 & 1) != 0)
  {
    if ((_DWORD)result)
    {
      v9 = *((_QWORD *)a1 + 2);
      v10 = *a1;
      v11 = size->__pn_.__r_.__value_.__r.__words[2];
      *a1 = *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_;
      *((_QWORD *)a1 + 2) = v11;
    }
    else
    {
      v18 = *((_QWORD *)a1 + 2);
      v19 = *a1;
      v20 = data->__pn_.__r_.__value_.__r.__words[2];
      *a1 = *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_;
      *((_QWORD *)a1 + 2) = v20;
      *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_ = v19;
      data->__pn_.__r_.__value_.__r.__words[2] = v18;
      v8.__data_ = (const std::string_view::value_type *)data;
      result = std::__fs::filesystem::operator<[abi:ne180100](size, v8);
      if (!(_DWORD)result)
        return result;
      v9 = data->__pn_.__r_.__value_.__r.__words[2];
      v10 = *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_;
      v21 = size->__pn_.__r_.__value_.__r.__words[2];
      *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_;
      data->__pn_.__r_.__value_.__r.__words[2] = v21;
    }
    *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_ = v10;
    size->__pn_.__r_.__value_.__r.__words[2] = v9;
  }
  else if ((_DWORD)result)
  {
    v12 = data->__pn_.__r_.__value_.__r.__words[2];
    v13 = *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_;
    v14 = size->__pn_.__r_.__value_.__r.__words[2];
    *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_;
    data->__pn_.__r_.__value_.__r.__words[2] = v14;
    *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_ = v13;
    size->__pn_.__r_.__value_.__r.__words[2] = v12;
    v8.__data_ = (const std::string_view::value_type *)a1;
    result = std::__fs::filesystem::operator<[abi:ne180100](data, v8);
    if ((_DWORD)result)
    {
      v15 = *((_QWORD *)a1 + 2);
      v16 = *a1;
      v17 = data->__pn_.__r_.__value_.__r.__words[2];
      *a1 = *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_;
      *((_QWORD *)a1 + 2) = v17;
      *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_ = v16;
      data->__pn_.__r_.__value_.__r.__words[2] = v15;
    }
  }
  return result;
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>(uint64_t a1, std::__fs::filesystem::path::__string_view a2, std::__fs::filesystem::path *a3)
{
  std::__fs::filesystem::path *size;
  std::__fs::filesystem::path *data;
  std::__fs::filesystem::path::__string_view v7;
  __n128 result;
  std::string::size_type v9;
  __int128 v10;
  std::string::size_type v11;
  std::__fs::filesystem::path::__string_view v12;
  std::string::size_type v13;
  __int128 v14;
  std::string::size_type v15;
  std::string::size_type v16;
  std::string::size_type v17;
  std::__fs::filesystem::path::__string_view v18;

  size = (std::__fs::filesystem::path *)a2.__size_;
  data = (std::__fs::filesystem::path *)a2.__data_;
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((__int128 *)a1, a2);
  v18.__data_ = (const std::string_view::value_type *)size;
  if (std::__fs::filesystem::operator<[abi:ne180100](a3, v18))
  {
    v9 = size->__pn_.__r_.__value_.__r.__words[2];
    v10 = *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_;
    v11 = a3->__pn_.__r_.__value_.__r.__words[2];
    *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&a3->__pn_.__r_.__value_.__l.__data_;
    size->__pn_.__r_.__value_.__r.__words[2] = v11;
    *(_OWORD *)&a3->__pn_.__r_.__value_.__l.__data_ = v10;
    a3->__pn_.__r_.__value_.__r.__words[2] = v9;
    v7.__data_ = (const std::string_view::value_type *)data;
    if (std::__fs::filesystem::operator<[abi:ne180100](size, v7))
    {
      v13 = data->__pn_.__r_.__value_.__r.__words[2];
      v14 = *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_;
      v15 = size->__pn_.__r_.__value_.__r.__words[2];
      *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_;
      data->__pn_.__r_.__value_.__r.__words[2] = v15;
      *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_ = v14;
      size->__pn_.__r_.__value_.__r.__words[2] = v13;
      v12.__data_ = (const std::string_view::value_type *)a1;
      if (std::__fs::filesystem::operator<[abi:ne180100](data, v12))
      {
        v16 = *(_QWORD *)(a1 + 16);
        result = *(__n128 *)a1;
        v17 = data->__pn_.__r_.__value_.__r.__words[2];
        *(_OWORD *)a1 = *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_;
        *(_QWORD *)(a1 + 16) = v17;
        *(__n128 *)&data->__pn_.__r_.__value_.__l.__data_ = result;
        data->__pn_.__r_.__value_.__r.__words[2] = v16;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>(uint64_t a1, std::__fs::filesystem::path::__string_view a2, std::__fs::filesystem::path *a3, std::__fs::filesystem::path *a4)
{
  std::__fs::filesystem::path *size;
  std::__fs::filesystem::path *data;
  std::__fs::filesystem::path::__string_view v9;
  __n128 result;
  std::string::size_type v11;
  __int128 v12;
  std::string::size_type v13;
  std::__fs::filesystem::path::__string_view v14;
  std::string::size_type v15;
  __int128 v16;
  std::string::size_type v17;
  std::__fs::filesystem::path::__string_view v18;
  std::string::size_type v19;
  __int128 v20;
  std::string::size_type v21;
  std::string::size_type v22;
  std::string::size_type v23;
  std::__fs::filesystem::path::__string_view v24;

  size = (std::__fs::filesystem::path *)a2.__size_;
  data = (std::__fs::filesystem::path *)a2.__data_;
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>(a1, a2, a3);
  v24.__data_ = (const std::string_view::value_type *)a3;
  if (std::__fs::filesystem::operator<[abi:ne180100](a4, v24))
  {
    v11 = a3->__pn_.__r_.__value_.__r.__words[2];
    v12 = *(_OWORD *)&a3->__pn_.__r_.__value_.__l.__data_;
    v13 = a4->__pn_.__r_.__value_.__r.__words[2];
    *(_OWORD *)&a3->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&a4->__pn_.__r_.__value_.__l.__data_;
    a3->__pn_.__r_.__value_.__r.__words[2] = v13;
    *(_OWORD *)&a4->__pn_.__r_.__value_.__l.__data_ = v12;
    a4->__pn_.__r_.__value_.__r.__words[2] = v11;
    v9.__data_ = (const std::string_view::value_type *)size;
    if (std::__fs::filesystem::operator<[abi:ne180100](a3, v9))
    {
      v15 = size->__pn_.__r_.__value_.__r.__words[2];
      v16 = *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_;
      v17 = a3->__pn_.__r_.__value_.__r.__words[2];
      *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&a3->__pn_.__r_.__value_.__l.__data_;
      size->__pn_.__r_.__value_.__r.__words[2] = v17;
      *(_OWORD *)&a3->__pn_.__r_.__value_.__l.__data_ = v16;
      a3->__pn_.__r_.__value_.__r.__words[2] = v15;
      v14.__data_ = (const std::string_view::value_type *)data;
      if (std::__fs::filesystem::operator<[abi:ne180100](size, v14))
      {
        v19 = data->__pn_.__r_.__value_.__r.__words[2];
        v20 = *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_;
        v21 = size->__pn_.__r_.__value_.__r.__words[2];
        *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_;
        data->__pn_.__r_.__value_.__r.__words[2] = v21;
        *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_ = v20;
        size->__pn_.__r_.__value_.__r.__words[2] = v19;
        v18.__data_ = (const std::string_view::value_type *)a1;
        if (std::__fs::filesystem::operator<[abi:ne180100](data, v18))
        {
          v22 = *(_QWORD *)(a1 + 16);
          result = *(__n128 *)a1;
          v23 = data->__pn_.__r_.__value_.__r.__words[2];
          *(_OWORD *)a1 = *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_;
          *(_QWORD *)(a1 + 16) = v23;
          *(__n128 *)&data->__pn_.__r_.__value_.__l.__data_ = result;
          data->__pn_.__r_.__value_.__r.__words[2] = v22;
        }
      }
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>(std::__fs::filesystem::path *a1, std::__fs::filesystem::path::__string_view a2)
{
  const std::string_view::value_type *data;
  unint64_t v4;
  _BOOL8 result;
  std::string_view::value_type *v6;
  const std::__fs::filesystem::path *v7;
  std::string::size_type v8;
  __int128 v9;
  std::string::size_type v10;
  const std::string_view::value_type *v11;
  std::__fs::filesystem::path::__string_view v12;
  const std::__fs::filesystem::path *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  char *v17;
  void **v18;
  uint64_t v19;
  std::__fs::filesystem::path v20;
  std::__fs::filesystem::path::__string_view v21;
  std::__fs::filesystem::path::__string_view v22;
  std::__fs::filesystem::path::__string_view v23;
  std::__fs::filesystem::path::__string_view v24;

  data = a2.__data_;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a2.__data_ - (const std::string_view::value_type *)a1) >> 3);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = (std::string_view::value_type *)(a2.__data_ - 24);
      v7 = (const std::__fs::filesystem::path *)(a2.__data_ - 24);
      a2.__data_ = (const std::string_view::value_type *)a1;
      if (std::__fs::filesystem::operator<[abi:ne180100](v7, a2))
      {
        v8 = a1->__pn_.__r_.__value_.__r.__words[2];
        v9 = *(_OWORD *)&a1->__pn_.__r_.__value_.__l.__data_;
        v10 = *((_QWORD *)v6 + 2);
        *(_OWORD *)&a1->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)v6;
        a1->__pn_.__r_.__value_.__r.__words[2] = v10;
        *(_OWORD *)v6 = v9;
        *((_QWORD *)v6 + 2) = v8;
      }
      return 1;
    case 3uLL:
      v22.__data_ = (const std::string_view::value_type *)&a1[1];
      v22.__size_ = (std::basic_string_view<_CharT, _Traits>::size_type)(data - 24);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((__int128 *)a1, v22);
      return 1;
    case 4uLL:
      v24.__data_ = (const std::string_view::value_type *)&a1[1];
      v24.__size_ = (std::basic_string_view<_CharT, _Traits>::size_type)&a1[2];
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((uint64_t)a1, v24, (std::__fs::filesystem::path *)data - 1);
      return 1;
    case 5uLL:
      v23.__data_ = (const std::string_view::value_type *)&a1[1];
      v23.__size_ = (std::basic_string_view<_CharT, _Traits>::size_type)&a1[2];
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((uint64_t)a1, v23, a1 + 3, (std::__fs::filesystem::path *)data - 1);
      return 1;
    default:
      v11 = (const std::string_view::value_type *)&a1[2];
      v21.__data_ = (const std::string_view::value_type *)&a1[1];
      v21.__size_ = (std::basic_string_view<_CharT, _Traits>::size_type)&a1[2];
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((__int128 *)a1, v21);
      v13 = a1 + 3;
      if (&a1[3] == (std::__fs::filesystem::path *)data)
        return 1;
      v14 = 0;
      v15 = 0;
      break;
  }
  while (1)
  {
    v12.__data_ = v11;
    if (std::__fs::filesystem::operator<[abi:ne180100](v13, v12))
    {
      v20 = *v13;
      v13->__pn_.__r_.__value_.__l.__size_ = 0;
      v13->__pn_.__r_.__value_.__r.__words[2] = 0;
      v13->__pn_.__r_.__value_.__r.__words[0] = 0;
      v16 = v14;
      do
      {
        v17 = (char *)a1 + v16;
        v18 = (void **)((char *)&a1[3].__pn_.__r_.__value_.__l.__data_ + v16);
        if (*((char *)&a1[3].__pn_.__r_.__value_.__r.__words[2] + v16 + 7) < 0)
          operator delete(*v18);
        *(_OWORD *)v18 = *((_OWORD *)v17 + 3);
        *(std::string::size_type *)((char *)&a1[3].__pn_.__r_.__value_.__r.__words[2] + v16) = *((_QWORD *)v17 + 8);
        v17[71] = 0;
        v17[48] = 0;
        if (v16 == -48)
        {
          v19 = (uint64_t)a1;
          goto LABEL_15;
        }
        v12.__data_ = (char *)&a1[1] + v16;
        v16 -= 24;
      }
      while ((std::__fs::filesystem::operator<[abi:ne180100](&v20, v12) & 1) != 0);
      v19 = (uint64_t)&a1[3] + v16;
      if (*(char *)(v19 + 23) < 0)
        operator delete(*(void **)v19);
LABEL_15:
      *(std::__fs::filesystem::path *)v19 = v20;
      if (++v15 == 8)
        return &v13[1] == (const std::__fs::filesystem::path *)data;
    }
    v11 = (const std::string_view::value_type *)v13;
    v14 += 24;
    if (++v13 == (const std::__fs::filesystem::path *)data)
      return 1;
  }
}

uint64_t skit::internal::MultiIndexV2::close(void ****this)
{
  void ***i;
  void ***v3;
  uint64_t result;

  skit::internal::MultiIndexV2::flush((skit::internal::MultiIndexV2 *)this);
  v3 = this[3];
  for (i = this[4]; i != v3; std::unique_ptr<skit::internal::IndexDiskImplV2>::reset[abi:ne180100](i))
    --i;
  this[4] = v3;
  skit::internal::IndexMemImplV2::clear((skit::internal::IndexMemImplV2 *)(this + 6));
  *((_DWORD *)this + 68) = 0;
  result = std::vector<std::unique_ptr<skit::internal::IndexDiskImplV2>>::shrink_to_fit((uint64_t)(this + 3));
  *((_BYTE *)this + 288) = 0;
  return result;
}

uint64_t skit::internal::MultiIndexV2::flush(skit::internal::MultiIndexV2 *this)
{
  uint64_t v1;
  NSObject *v3;
  std::string *v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  NSObject *v8;
  float v9;
  unint64_t v10;
  const char *v11;
  char *v12;
  std::string::size_type v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  NSObject *v17;
  char v18;
  std::string::size_type *v19;
  int v20;
  unint64_t v21;
  std::string::size_type **v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  std::string::size_type **v29;
  float *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  std::string::size_type *v34;
  int64x2_t v35;
  float *v36;
  NSObject *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  std::string *v42;
  std::string *v43;
  NSObject *v44;
  NSObject *v45;
  int v46;
  std::string::size_type v47;
  int *v48;
  std::string *p_p;
  int v50;
  std::string v51;
  std::string v52;
  std::string v53;
  std::string v54;
  uint64_t v55;
  char __str[15];
  _BYTE buf[22];
  std::string v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  std::string __p;
  float *v63;
  size_t v64;
  _DWORD v65[16];
  uint64_t v66;
  int v67;
  __int16 v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (*((_DWORD *)this + 27) == *((_DWORD *)this + 28))
    return 0;
  snprintf(__str, 0xFuLL, "index-%08x", *((_DWORD *)this + 68));
  std::__fs::filesystem::path::path[abi:ne180100]<char [15],void>(&__p, (std::string *)__str);
  std::__fs::filesystem::operator/[abi:ne180100](&v53, (uint64_t)this, (std::__fs::filesystem::path *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (skit::internal::get_logging_context(void)::once != -1)
  v3 = skit::internal::get_logging_context(void)::logger;
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_INFO))
  {
    v4 = &v53;
    if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v4 = (std::string *)v53.__r_.__value_.__r.__words[0];
    LODWORD(__p.__r_.__value_.__l.__data_) = 136446210;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v4;
    _os_log_impl(&dword_1CB748000, v3, OS_LOG_TYPE_INFO, "MultiIndexV2::flush : flushing index segment @ %{public}s", (uint8_t *)&__p, 0xCu);
  }
  if (*((_DWORD *)this + 56) != -1
    && (skit::internal::BlobFile::flush((skit::internal::MultiIndexV2 *)((char *)this + 200))
     || skit::internal::BlobFile::close((skit::internal::MultiIndexV2 *)((char *)this + 200))))
  {
    goto LABEL_85;
  }
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v52, v53.__r_.__value_.__l.__data_, v53.__r_.__value_.__l.__size_);
  else
    v52 = v53;
  v5 = *((_DWORD *)this + 73);
  v6 = *((unsigned __int16 *)this + 148);
  v7 = *((_QWORD *)this + 38);
  if (skit::internal::get_logging_context(void)::once != -1)
  v8 = skit::internal::get_logging_context(void)::logger;
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_INFO))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1CB748000, v8, OS_LOG_TYPE_INFO, "IndexMemImplV2::make_disk_impl : writing index segment", (uint8_t *)&__p, 2u);
  }
  v55 = 0;
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v54, v52.__r_.__value_.__l.__data_, v52.__r_.__value_.__l.__size_);
  else
    v54 = v52;
  skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvStore((uint64_t)&__p, (__int128 *)&v54, skit::default_kv_store_config, unk_1EF99BC30);
  if (SHIBYTE(v54.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v54.__r_.__value_.__l.__data_);
  if ((v5 - 8) <= 0xFFFFFFF6)
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v44 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_FAULT))
    {
      LODWORD(v58.__r_.__value_.__l.__data_) = 67109120;
      HIDWORD(v58.__r_.__value_.__r.__words[0]) = v5;
      _os_log_fault_impl(&dword_1CB748000, v44, OS_LOG_TYPE_FAULT, "KvStore : invalid protection class %d", (uint8_t *)&v58, 8u);
    }
  }
  v67 = v5;
  v68 = v6 & 0x1FF;
  if (v65[6] == -1)
    v66 = v7;
  if (v63)
    v9 = v63[7];
  else
    v9 = *(float *)"33s?";
  v10 = *((_QWORD *)this + 9);
  if ((skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::open((uint64_t)&__p) & 0x80000000) != 0)
  {
    v11 = "open term index";
    goto LABEL_53;
  }
  if (skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::rehash((uint64_t)&__p, (float)(ceilf((float)v10 / v9) + 0.5)))
  {
    v11 = "KvStore resize";
    goto LABEL_53;
  }
  v12 = (char *)this + 64;
  v11 = "writing posting lists";
  while (1)
  {
    v12 = *(char **)v12;
    if (!v12)
      break;
    v13 = *((_QWORD *)v12 + 8);
    v58.__r_.__value_.__r.__words[0] = *((_QWORD *)v12 + 7);
    v58.__r_.__value_.__l.__size_ = 16;
    v58.__r_.__value_.__r.__words[2] = v13;
    v14 = *((_QWORD *)v12 + 9);
    v59 = 8 * *(unsigned int *)(v58.__r_.__value_.__r.__words[0] + 8);
    v60 = v14;
    v61 = 6 * *(unsigned int *)(v58.__r_.__value_.__r.__words[0] + 12);
    v15 = (unint64_t)*((unsigned int *)v12 + 6) >> 1;
    *(_QWORD *)buf = *((_QWORD *)v12 + 2);
    *(_QWORD *)&buf[8] = v15;
    if ((skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::put((uint64_t)&__p, (uint64_t)buf, &v58) & 0x80000000) != 0)goto LABEL_53;
  }
  if (!v63
    || (skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::calculate_checksums((uint64_t)&__p),
        !msync(v63, v64, 1)))
  {
    if (!skit::internal::BlobFile::flush((skit::internal::BlobFile *)v65))
    {
      if (skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::close(&__p))
      {
        v11 = "close term index";
      }
      else
      {
        if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&v58, v52.__r_.__value_.__l.__data_, v52.__r_.__value_.__l.__size_);
        else
          v58 = v52;
        v16 = skit::internal::MemMetaStore::write((skit::internal::MultiIndexV2 *)((char *)this + 96), (std::__fs::filesystem::path *)&v58, v5, v6);
        if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v58.__r_.__value_.__l.__data_);
        if (!v16)
        {
          v18 = 1;
          goto LABEL_57;
        }
        v11 = "writing meta store";
      }
      goto LABEL_53;
    }
    goto LABEL_43;
  }
  if (skit::internal::get_logging_context(void)::once != -1)
  v45 = skit::internal::get_logging_context(void)::logger;
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    v46 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    v47 = __p.__r_.__value_.__r.__words[0];
    v48 = __error();
    p_p = &__p;
    v50 = *v48;
    if (v46 < 0)
      p_p = (std::string *)v47;
    LODWORD(v58.__r_.__value_.__l.__data_) = 136446466;
    *(std::string::size_type *)((char *)v58.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_p;
    WORD2(v58.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&v58.__r_.__value_.__r.__words[1] + 6) = v50;
    _os_log_error_impl(&dword_1CB748000, v45, OS_LOG_TYPE_ERROR, "BlobFile::resize : msync for kv table file failed @ %{public}s : %{darwin.errno}d", (uint8_t *)&v58, 0x12u);
LABEL_43:
    v11 = "flush term index";
LABEL_53:
    if (skit::internal::get_logging_context(void)::once != -1)
    goto LABEL_55;
  }
  v11 = "flush term index";
LABEL_55:
  v17 = skit::internal::get_logging_context(void)::logger;
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    v43 = &v52;
    if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v43 = (std::string *)v52.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = v43;
    _os_log_error_impl(&dword_1CB748000, v17, OS_LOG_TYPE_ERROR, "IndexMemImplV2::make_disk_imp : %{public}s failed @ %{public}s", buf, 0x16u);
  }
  skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::clear((uint64_t)&__p);
  v18 = 0;
LABEL_57:
  skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::~KvStore((uint64_t)&__p);
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v52.__r_.__value_.__l.__data_);
    if ((v18 & 1) == 0)
      goto LABEL_85;
  }
  else if ((v18 & 1) == 0)
  {
    goto LABEL_85;
  }
  v19 = (std::string::size_type *)operator new();
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v51, v53.__r_.__value_.__l.__data_, v53.__r_.__value_.__l.__size_);
  else
    v51 = v53;
  skit::internal::IndexDiskImplV2::IndexDiskImplV2((skit::internal::IndexDiskImplV2 *)v19, (std::__fs::filesystem::path *)&v51);
  v58.__r_.__value_.__r.__words[0] = (std::string::size_type)v19;
  if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v51.__r_.__value_.__l.__data_);
  v20 = skit::internal::IndexDiskImplV2::open((skit::internal::IndexDiskImplV2 *)v19);
  if (v20)
  {
    skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::clear((uint64_t)v19);
    skit::internal::DiskMetaStore::clear(v19 + 21);
    v58.__r_.__value_.__r.__words[0] = 0;
  }
  else
  {
    v21 = *((_QWORD *)this + 5);
    v22 = (std::string::size_type **)*((_QWORD *)this + 4);
    if ((unint64_t)v22 < v21)
    {
      *v22 = v19;
      *((_QWORD *)this + 4) = v22 + 1;
LABEL_92:
      ++*((_DWORD *)this + 68);
      v39 = *((_QWORD *)this + 16);
      v40 = *((_QWORD *)this + 17);
      skit::internal::IndexMemImplV2::clear((skit::internal::MultiIndexV2 *)((char *)this + 48));
      v41 = v40 - 1;
      if (v40 - 1 <= v39)
        v41 = v39;
      skit::internal::MetaStoreHeader::base_id((skit::internal::MultiIndexV2 *)((char *)this + 96), v41 + 1);
      v1 = 0;
      goto LABEL_89;
    }
    v23 = *((_QWORD *)this + 3);
    v24 = ((uint64_t)v22 - v23) >> 3;
    v25 = v24 + 1;
    if ((unint64_t)(v24 + 1) >> 61)
      std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
    v26 = v21 - v23;
    if (v26 >> 2 > v25)
      v25 = v26 >> 2;
    if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF8)
      v27 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v27 = v25;
    v64 = (size_t)this + 40;
    if (v27)
      v27 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<skit::internal::IndexDiskImplV2>>>(v27);
    else
      v28 = 0;
    v29 = (std::string::size_type **)(v27 + 8 * v24);
    v30 = (float *)(v27 + 8 * v28);
    v63 = v30;
    v58.__r_.__value_.__r.__words[0] = 0;
    *v29 = v19;
    v31 = v29 + 1;
    __p.__r_.__value_.__r.__words[2] = (std::string::size_type)(v29 + 1);
    v33 = (_QWORD *)*((_QWORD *)this + 3);
    v32 = (_QWORD *)*((_QWORD *)this + 4);
    if (v32 == v33)
    {
      v19 = 0;
      v35 = vdupq_n_s64((unint64_t)v32);
    }
    else
    {
      do
      {
        v34 = (std::string::size_type *)*--v32;
        *v32 = 0;
        *--v29 = v34;
      }
      while (v32 != v33);
      v35 = *(int64x2_t *)((char *)this + 24);
      v31 = (_QWORD *)__p.__r_.__value_.__r.__words[2];
      v30 = v63;
      v19 = (std::string::size_type *)v58.__r_.__value_.__r.__words[0];
    }
    *((_QWORD *)this + 3) = v29;
    *((_QWORD *)this + 4) = v31;
    *(int64x2_t *)&__p.__r_.__value_.__r.__words[1] = v35;
    v36 = (float *)*((_QWORD *)this + 5);
    *((_QWORD *)this + 5) = v30;
    v63 = v36;
    __p.__r_.__value_.__r.__words[0] = v35.i64[0];
    std::__split_buffer<std::unique_ptr<skit::internal::IndexDiskImplV2>>::~__split_buffer((uint64_t)&__p);
    *((_QWORD *)this + 4) = v31;
    v58.__r_.__value_.__r.__words[0] = 0;
    if (!v19)
      goto LABEL_84;
  }
  skit::internal::IndexDiskImplV2::~IndexDiskImplV2((void **)v19);
  MEMORY[0x1D179DDB4]();
LABEL_84:
  if (!v20)
    goto LABEL_92;
LABEL_85:
  if (skit::internal::get_logging_context(void)::once != -1)
  v37 = skit::internal::get_logging_context(void)::logger;
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    v42 = &v53;
    if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v42 = (std::string *)v53.__r_.__value_.__r.__words[0];
    LODWORD(__p.__r_.__value_.__l.__data_) = 136446210;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v42;
    _os_log_error_impl(&dword_1CB748000, v37, OS_LOG_TYPE_ERROR, "MultiIndexV2::flush : flush failed @ %{public}s", (uint8_t *)&__p, 0xCu);
  }
  v1 = 0xFFFFFFFFLL;
LABEL_89:
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v53.__r_.__value_.__l.__data_);
  return v1;
}

void sub_1CB75BCE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,void **a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *a43,uint64_t a44,int a45,__int16 a46,char a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,__int16 a55,char a56,char a57)
{
  skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::~KvStore((uint64_t)&a52);
  std::unique_ptr<skit::internal::IndexDiskImplV2>::reset[abi:ne180100](&a36);
  if (a23 < 0)
    operator delete(__p);
  if (a29 < 0)
    operator delete(a24);
  _Unwind_Resume(a1);
}

uint64_t skit::internal::IndexMemImplV2::clear(skit::internal::IndexMemImplV2 *this)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  _WORD *v9;
  int64x2_t v10;
  int64x2_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  _WORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  __int16 v21;
  unsigned int *v22;
  uint64_t v23;
  std::error_code *v24;
  _QWORD *v25;
  uint64_t v26;
  void (*v27)(void);
  int v28;
  _QWORD v30[2];
  _QWORD v31[2];
  int v32;

  v2 = *(_QWORD *)this;
  v3 = *((_QWORD *)this + 1);
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  v30[0] = v2;
  v30[1] = v3;
  v5 = *((_QWORD *)this + 2);
  v4 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  v31[0] = v5;
  v31[1] = v4;
  v32 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = 1065353216;
  if (v4)
  {
    v6 = *(_QWORD *)(v5 + 8);
    if ((v3 & (v3 - 1)) != 0)
    {
      v8 = v6 >= v3;
      v7 = v6 % v3;
      if (!v8)
        v7 = v6;
    }
    else
    {
      v7 = (v3 - 1) & v6;
    }
    *(_QWORD *)(v2 + 8 * v7) = v31;
  }
  std::__hash_table<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::__unordered_map_hasher<skit::internal::Term,std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::hash<skit::internal::Term>,std::equal_to<skit::internal::Term>,true>,std::__unordered_map_equal<skit::internal::Term,std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::equal_to<skit::internal::Term>,std::hash<skit::internal::Term>,true>,std::allocator<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>>>::~__hash_table((uint64_t)v30);
  *((_QWORD *)this + 5) = 0;
  *((_DWORD *)this + 12) = 621942338;
  *(_QWORD *)((char *)this + 52) = 0;
  *(_QWORD *)((char *)this + 68) = 0;
  *(_QWORD *)((char *)this + 60) = 0;
  *((_DWORD *)this + 19) = 0;
  *((int64x2_t *)this + 5) = vdupq_n_s64(1uLL);
  v9 = (_WORD *)*((_QWORD *)this + 12);
  *((_QWORD *)this + 13) = v9;
  v10 = *(int64x2_t *)((char *)this + 104);
  v11 = vshrq_n_s64(vsubq_s64(v10, vdupq_n_s64((unint64_t)v9)), 1uLL);
  v12 = 0xCCCCCCCCCCCCCCCDLL * v11.i64[0];
  v13 = v12;
  if (0xCCCCCCCCCCCCCCCDLL * v11.i64[1] > v12)
  {
    if ((_WORD *)v10.i64[0] == v9)
    {
      v18 = 0;
      v16 = 10 * v12;
    }
    else
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::internal::CompressedMetaRecord>>(v12);
      v15 = (_WORD *)*((_QWORD *)this + 12);
      v9 = (_WORD *)*((_QWORD *)this + 13);
      v16 = (uint64_t)&v14[10 * v13];
      v18 = &v14[10 * v17];
      if (v9 != v15)
      {
        v19 = v16;
        do
        {
          v20 = *(_QWORD *)(v9 - 5);
          v9 -= 5;
          v21 = v9[4];
          *(_QWORD *)(v19 - 10) = v20;
          v19 -= 10;
          *(_WORD *)(v19 + 8) = v21;
        }
        while (v9 != v15);
        v9 = (_WORD *)*((_QWORD *)this + 12);
LABEL_15:
        *((_QWORD *)this + 12) = v19;
        *((_QWORD *)this + 13) = v16;
        *((_QWORD *)this + 14) = v18;
        if (v9)
          operator delete(v9);
        goto LABEL_17;
      }
    }
    v19 = v16;
    goto LABEL_15;
  }
LABEL_17:
  v22 = (unsigned int *)*((_QWORD *)this + 17);
  v23 = v22[1];
  if (v23 < 2)
  {
    v28 = 16 * v23;
    memset(v22 + 4, 128, 16 * v23);
    *((_BYTE *)v22 + (v28 - 1) + 16) = -1;
    v22[2] = 0;
  }
  else
  {
    v25 = malloc_type_aligned_alloc(0x10uLL, 0x160uLL, 0xCAC9F0E5uLL);
    v25[2] = 0x8080808080808080;
    *(_DWORD *)v25 = (unint64_t)(v25 + 2) >> 12;
    *((_DWORD *)v25 + 1) = 1;
    v25[1] = 0xF00000000;
    v25[3] = 0x8080808080808080;
    *((_BYTE *)v25 + 31) = -1;
    v26 = *((_QWORD *)this + 17);
    v27 = (void (*)(void))*((_QWORD *)this + 18);
    *((_WORD *)this + 60) = 0;
    *((_QWORD *)this + 16) = 0x40000000;
    *((_QWORD *)this + 17) = v25;
    *((_QWORD *)this + 18) = skit::FlatSet<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::allocate_pimpl<>const::{lambda(skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>*)#1}::__invoke;
    if (v26)
      v27();
  }
  return skit::internal::BlobFile::clear((skit::internal::IndexMemImplV2 *)((char *)this + 152), v24);
}

void sub_1CB75C020(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1CB75BF58);
}

uint64_t std::vector<std::unique_ptr<skit::internal::IndexDiskImplV2>>::shrink_to_fit(uint64_t result)
{
  _QWORD *v1;
  _QWORD *v2;
  unint64_t v3;
  _QWORD *v4;
  char *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v14[5];

  v1 = *(_QWORD **)result;
  v2 = *(_QWORD **)(result + 8);
  v3 = ((uint64_t)v2 - *(_QWORD *)result) >> 3;
  if (v3 < (uint64_t)(*(_QWORD *)(result + 16) - *(_QWORD *)result) >> 3)
  {
    v4 = (_QWORD *)result;
    v14[4] = result + 16;
    if (v2 == v1)
    {
      v9 = 0;
      v7 = 8 * v3;
    }
    else
    {
      v5 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<skit::internal::IndexDiskImplV2>>>(v3);
      v6 = (_QWORD *)*v4;
      v1 = (_QWORD *)v4[1];
      v7 = (uint64_t)&v5[8 * v3];
      v9 = &v5[8 * v8];
      if (v1 != (_QWORD *)*v4)
      {
        v10 = &v5[8 * v3];
        do
        {
          v11 = *--v1;
          *v1 = 0;
          *((_QWORD *)v10 - 1) = v11;
          v10 -= 8;
        }
        while (v1 != v6);
        v12 = (_QWORD *)*v4;
        v1 = (_QWORD *)v4[1];
        goto LABEL_9;
      }
    }
    v12 = v1;
    v10 = (char *)v7;
LABEL_9:
    *v4 = v10;
    v4[1] = v7;
    v13 = v4[2];
    v4[2] = v9;
    v14[2] = v1;
    v14[3] = v13;
    v14[0] = v12;
    v14[1] = v12;
    return std::__split_buffer<std::unique_ptr<skit::internal::IndexDiskImplV2>>::~__split_buffer((uint64_t)v14);
  }
  return result;
}

void sub_1CB75C0E8(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1CB75C0D8);
}

uint64_t std::__hash_table<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::__unordered_map_hasher<skit::internal::Term,std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::hash<skit::internal::Term>,std::equal_to<skit::internal::Term>,true>,std::__unordered_map_equal<skit::internal::Term,std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::equal_to<skit::internal::Term>,std::hash<skit::internal::Term>,true>,std::allocator<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>>>::~__hash_table(uint64_t a1)
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
      std::__destroy_at[abi:ne180100]<std::pair<skit::internal::Term const,skit::internal::PostingListMemImplV2>,0>((uint64_t)(v2 + 2));
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

std::string *std::__fs::filesystem::path::path[abi:ne180100]<char [15],void>(std::string *this, std::string *a2)
{
  std::string *v3;
  int v4;

  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  v3 = (std::string *)((char *)a2 - 1);
  do
  {
    v4 = v3->__r_.__value_.__s.__data_[1];
    v3 = (std::string *)((char *)v3 + 1);
  }
  while (v4);
  std::string::append[abi:ne180100]<char const*,0>(this, a2, v3);
  return this;
}

void sub_1CB75C190(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t skit::internal::MultiIndexV2::clear(skit::internal::MultiIndexV2 *this)
{
  const char *v2;
  void ***i;
  void ***v4;
  const std::__fs::filesystem::path *v5;
  uint64_t result;
  NSObject *v7;
  skit::internal::MultiIndexV2 *v8;
  int v9;
  int v10;
  skit::internal::MultiIndexV2 *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  skit::internal::IndexMemImplV2::clear((skit::internal::MultiIndexV2 *)((char *)this + 48));
  v4 = (void ***)*((_QWORD *)this + 3);
  for (i = (void ***)*((_QWORD *)this + 4);
        i != v4;
        std::unique_ptr<skit::internal::IndexDiskImplV2>::reset[abi:ne180100](i))
  {
    --i;
  }
  *((_QWORD *)this + 4) = v4;
  if (*((char *)this + 23) >= 0)
    v5 = (const std::__fs::filesystem::path *)this;
  else
    v5 = *(const std::__fs::filesystem::path **)this;
  if (skit::internal::remove_all(v5, v2))
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v7 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      v8 = this;
      if (*((char *)this + 23) < 0)
        v8 = *(skit::internal::MultiIndexV2 **)this;
      v9 = *__error();
      v10 = 136446466;
      v11 = v8;
      v12 = 1024;
      v13 = v9;
      _os_log_error_impl(&dword_1CB748000, v7, OS_LOG_TYPE_ERROR, "MultiIndexV2::clear : failed to remove transaction directory @ %{public}s : %{darwin.errno}d", (uint8_t *)&v10, 0x12u);
    }
  }
  result = std::vector<std::unique_ptr<skit::internal::IndexDiskImplV2>>::shrink_to_fit((uint64_t)this + 24);
  *((_DWORD *)this + 68) = 0;
  *((_BYTE *)this + 288) = 0;
  return result;
}

uint64_t skit::internal::MultiIndexV2::get_doc_freq(_QWORD *a1, uint64_t a2)
{
  _QWORD **v4;
  _QWORD **v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD v11[2];
  void *v12[2];
  _QWORD v13[7];

  v13[6] = *MEMORY[0x1E0C80C00];
  v4 = (_QWORD **)a1[3];
  v5 = (_QWORD **)a1[4];
  if (v4 == v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    do
    {
      v7 = *v4;
      v8 = (unint64_t)*(unsigned int *)(a2 + 8) >> 1;
      v11[0] = *(_QWORD *)a2;
      v11[1] = v8;
      v9 = skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::get(v7, (uint64_t)v11);
      skit::internal::IndexDiskImplV2::to_posting_list(v12, v9);
      if (v13[2])
        v6 += *(unsigned int *)(v13[0] + 12);
      ++v4;
    }
    while (v4 != v5);
  }
  skit::internal::IndexMemImplV2::get((uint64_t)v12, a1 + 6, a2);
  if (v13[5])
    v6 += *(unsigned int *)(v13[3] + 12);
  if (v12[0] != v13)
    free(v12[0]);
  return v6;
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::get(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  BOOL v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t result;
  uint64_t v17;
  unsigned __int16 *v18;
  skit::internal *v19;

  if (!a1[3])
    return 0;
  if (skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::mmap_data_file((uint64_t)a1))
    return 0;
  v4 = a1[3];
  v5 = skit::internal::murmur3_32(*(skit::internal **)a2, 2 * *(_QWORD *)(a2 + 8), *(_DWORD *)(v4 + 12));
  v6 = *(_DWORD *)(v4 + 16);
  if (!v6)
    return 0;
  v7 = 0;
  v8 = v5 & 0x7FFFFFFF;
  v9 = (v5 & 0x7FFFFFFFu) % v6;
  v10 = v9;
  do
  {
    v11 = 0;
    v12 = 1;
    do
    {
      v13 = *(_DWORD *)(v4 + ((unint64_t)v10 << 9) + 40 + 4 * v11);
      if (v13 == -1)
        break;
      if (v13 == v8)
      {
        __dmb(9u);
        v14 = *(unsigned int *)(v4 + ((unint64_t)v10 << 9) + 4 * v11 + 296);
        v15 = a1[15];
        if (v14 + 6 <= v15)
        {
          result = a1[14] + v14;
          if (v15 >= (*(_DWORD *)result + v14))
          {
            v17 = *(unsigned __int16 *)(result + 4);
            if (*(_QWORD *)(a2 + 8) == v17)
            {
              if (!*(_WORD *)(result + 4))
                goto LABEL_18;
              v18 = (unsigned __int16 *)(result + 6);
              v19 = *(skit::internal **)a2;
              while (*(unsigned __int16 *)v19 == *v18)
              {
                ++v18;
                v19 = (skit::internal *)((char *)v19 + 2);
                if (!--v17)
                  goto LABEL_18;
              }
            }
          }
        }
      }
      v12 = v11++ < 0x3F;
    }
    while (v11 != 64);
    result = v7;
LABEL_18:
    if (v12)
      break;
    v10 = (v10 + 1) % *(_DWORD *)(v4 + 16);
    v7 = result;
  }
  while (v10 != v9);
  return result;
}

__n128 skit::internal::IndexMemImplV2::get(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t *v5;
  size_t v6;
  unint64_t v7;
  int8x8_t v8;
  unint64_t v9;
  uint8x8_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t **v13;
  uint64_t *v14;
  unint64_t v15;
  char *v16;
  _DWORD *v17;
  __n128 result;
  char *v19;
  void *v20;
  void *v21;
  uint64_t i;
  size_t v23;
  _BYTE *v24;
  char v25;
  _BYTE *v26;
  size_t v27;
  char v28;
  __n128 v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[4];

  v33[3] = *MEMORY[0x1E0C80C00];
  v5 = *(uint64_t **)a3;
  v6 = *(unsigned int *)(a3 + 8);
  v7 = std::__string_view_hash<char16_t>::operator()[abi:ne180100](*(uint64_t **)a3, v6 >> 1);
  v8 = (int8x8_t)a2[1];
  if (!*(_QWORD *)&v8)
    goto LABEL_18;
  v9 = v7;
  v10 = (uint8x8_t)vcnt_s8(v8);
  v10.i16[0] = vaddlv_u8(v10);
  v11 = v10.u32[0];
  if (v10.u32[0] > 1uLL)
  {
    v12 = v7;
    if (v7 >= *(_QWORD *)&v8)
      v12 = v7 % *(_QWORD *)&v8;
  }
  else
  {
    v12 = (*(_QWORD *)&v8 - 1) & v7;
  }
  v13 = *(uint64_t ***)(*a2 + 8 * v12);
  if (!v13 || (v14 = *v13) == 0)
  {
LABEL_18:
    v29 = 0uLL;
    v30 = 0;
LABEL_19:
    LODWORD(v6) = 0;
    *(_QWORD *)a1 = a1 + 16;
    goto LABEL_20;
  }
  while (1)
  {
    v15 = v14[1];
    if (v9 == v15)
      break;
    if (v11 > 1)
    {
      if (v15 >= *(_QWORD *)&v8)
        v15 %= *(_QWORD *)&v8;
    }
    else
    {
      v15 &= *(_QWORD *)&v8 - 1;
    }
    if (v15 != v12)
      goto LABEL_18;
LABEL_17:
    v14 = (uint64_t *)*v14;
    if (!v14)
      goto LABEL_18;
  }
  if (*((_DWORD *)v14 + 6) != (_DWORD)v6)
    goto LABEL_17;
  v16 = (char *)v14[2];
  if (memcmp(v16, v5, v6))
    goto LABEL_17;
  v19 = (char *)v33;
  v31 = v33;
  v32 = 0x1800000000;
  if (&v31 == (void **)(v14 + 2))
  {
    v29 = *(__n128 *)(v14 + 7);
    v30 = v14[9];
    goto LABEL_19;
  }
  if (v6 < 0x19)
  {
    if ((_DWORD)v6)
    {
      v23 = v6;
      v24 = v33;
      do
      {
        v25 = *v16++;
        *v24++ = v25;
        --v23;
      }
      while (v23);
    }
  }
  else
  {
    v20 = skit::SmallVector<std::byte,24u,false>::allocate(v6);
    v21 = v20;
    for (i = 0; i != v6; ++i)
      *((_BYTE *)v20 + i) = v16[i];
    if (v31 != v33)
      free(v31);
    v31 = v21;
    HIDWORD(v32) = malloc_size(v21);
  }
  LODWORD(v32) = v6;
  v29 = *(__n128 *)(v14 + 7);
  v30 = v14[9];
  if (v31 != v33)
  {
    v17 = (_DWORD *)&v32 + 1;
    *(_QWORD *)a1 = v31;
    *(_DWORD *)(a1 + 12) = HIDWORD(v32);
    goto LABEL_21;
  }
  v26 = (_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = a1 + 16;
  if ((_DWORD)v6)
  {
    v27 = v6;
    do
    {
      v28 = *v19++;
      *v26++ = v28;
      --v27;
    }
    while (v27);
  }
LABEL_20:
  v17 = (_DWORD *)(a1 + 12);
LABEL_21:
  *v17 = 24;
  *(_DWORD *)(a1 + 8) = v6;
  result = v29;
  *(__n128 *)(a1 + 40) = v29;
  *(_QWORD *)(a1 + 56) = v30;
  return result;
}

void sub_1CB75C7C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  if (a13 != v13)
    free(a13);
  _Unwind_Resume(exception_object);
}

uint64_t skit::internal::MultiIndexV2::disk_index_size(skit::internal::IndexDiskImplV2 **this, skit::internal::MultiIndexV2 *a2)
{
  skit::internal::IndexDiskImplV2 **v3;
  uint64_t v4;

  if (this == (skit::internal::IndexDiskImplV2 **)a2)
    return 0;
  v3 = this;
  v4 = 0;
  do
  {
    if (*v3)
      v4 += skit::internal::IndexDiskImplV2::mem_size(*v3);
    ++v3;
  }
  while (v3 != (skit::internal::IndexDiskImplV2 **)a2);
  return v4;
}

uint64_t skit::internal::IndexDiskImplV2::mem_size(skit::internal::IndexDiskImplV2 *this)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *((_QWORD *)this + 3);
  if (v1)
    v1 = (*(_DWORD *)(v1 + 24) + (*(_DWORD *)(v1 + 16) << 9) + 40);
  v2 = *(_DWORD *)(*((_QWORD *)this + 24) + 12);
  v3 = *((_QWORD *)this + 28);
  if (v3)
    v3 = (336 * *(_DWORD *)(v3 + 4) + 16);
  if (v2)
    v4 = 10 * v2 + 48;
  else
    v4 = 0;
  return v4 + v1 + v3 + *((_QWORD *)this + 37);
}

uint64_t skit::internal::MultiIndexV2::index_count_threshold(skit::internal::IndexDiskImplV2 **this, skit::internal::MultiIndexV2 *a2, unint64_t a3)
{
  skit::internal::IndexDiskImplV2 **v5;
  uint64_t v6;

  if (this == (skit::internal::IndexDiskImplV2 **)a2)
    return 0;
  v5 = this;
  v6 = 0;
  do
  {
    if (*v5)
    {
      if (skit::internal::IndexDiskImplV2::mem_size(*v5) >= a3)
        v6 = v6;
      else
        v6 = (v6 + 1);
    }
    ++v5;
  }
  while (v5 != (skit::internal::IndexDiskImplV2 **)a2);
  return v6;
}

uint64_t skit::internal::MultiIndexV2::append(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, iovec *a6, int a7, int a8, float _S0)
{
  float v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  skit::internal::IndexMemImplV2 *v15;
  unint64_t v16;
  uint64_t v20;
  void *v21;
  char *v22;
  size_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint8x8_t v27;
  unint64_t v28;
  std::string::size_type *v29;
  std::string::size_type v30;
  unint64_t v31;
  char *v33;
  char *v34;
  void *v35;
  int v36;
  _BYTE *v37;
  char v38;
  _OWORD *v39;
  float v40;
  float v41;
  _BOOL8 v42;
  unint64_t v43;
  unint64_t v44;
  int8x8_t prime;
  void *v46;
  void *v47;
  uint64_t v48;
  _QWORD *v49;
  unint64_t v50;
  uint8x8_t v51;
  unint64_t v52;
  uint8x8_t v53;
  uint64_t v54;
  _QWORD *v55;
  unint64_t v56;
  std::string::size_type *v57;
  unint64_t v58;
  uint64_t v60;
  _QWORD *v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  float v77;
  char *v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  char *v86;
  char *v87;
  float v88;
  _WORD *v91;
  _WORD *v92;
  char *v93;
  int v94;
  __int16 v95;
  char *v96;
  uint64_t v97;
  unsigned int v98;
  uint64_t v102;
  unsigned int v103;
  uint64_t v107;
  void *v108;
  char v109;
  float v110;
  _QWORD *v112;
  unint64_t v113;
  unint64_t v114;
  char *v116;
  uint64_t v117;
  unint64_t v118;
  unint64_t v119;
  unint64_t v120;
  unint64_t v121;
  char *v122;
  char *v123;
  uint64_t v124;
  char *v125;
  _WORD *v127;
  _WORD *v128;
  uint64_t v129;
  __int16 v130;
  int v131;
  _DWORD *v132;
  int v133;
  float v134;
  uint64_t v135;
  unsigned int v136;
  _DWORD *v139;
  int v140;
  unsigned int v141;
  unsigned int v142;
  unsigned int v143;
  int v144;
  uint64_t v145;
  unint64_t v146;
  uint64_t v147;
  unsigned int i;
  unsigned int v149;
  int v150;
  uint64_t v151;
  char *v153;
  _BYTE *v154;
  int v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  unsigned int v160;
  iovec *v161;
  int v162;
  uint64_t v163;
  unsigned int v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v170;
  std::string::size_type v171;
  std::string::size_type v172;
  const char *v173;
  std::string::size_type v174;
  std::string::size_type v175;
  std::string *p_p;
  NSObject *v177;
  uint32_t v178;
  unint64_t v179;
  unsigned int v180;
  unsigned int v181;
  unsigned int v182;
  unsigned int v183;
  int v184;
  uint64_t v185;
  unsigned int v190;
  std::string::size_type *v191;
  int v193;
  std::string v194;
  std::string __p;
  char __str[15];
  unsigned __int8 uu[16];
  std::string buf;
  uint64_t v199;
  uint64_t v200;

  v200 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)uu = a4;
  *(_QWORD *)&uu[8] = a5;
  if (a2 == a3)
    return 0;
  v10 = _S0;
  v11 = a3;
  v12 = a2;
  v13 = a1;
  v14 = 0;
  v15 = (skit::internal::IndexMemImplV2 *)(a1 + 48);
  v16 = *(unsigned int *)(a1 + 108);
  v191 = (std::string::size_type *)(a1 + 64);
  __asm { FCVT            H9, S0 }
  v190 = *(_DWORD *)(a1 + 108);
  do
  {
    if ((*(_WORD *)(v12 + 40) & 1) == 0)
      goto LABEL_147;
    v193 = v14;
    if (*(char *)(v12 + 23) < 0)
    {
      v21 = *(void **)v12;
      v20 = *(_QWORD *)(v12 + 8);
    }
    else
    {
      v20 = *(unsigned __int8 *)(v12 + 23);
      v21 = (void *)v12;
    }
    skit::internal::Term::Term(&buf, *(_WORD *)(v12 + 36), v21, v20);
    v22 = (char *)buf.__r_.__value_.__r.__words[0];
    v23 = LODWORD(buf.__r_.__value_.__r.__words[1]);
    v24 = std::__string_view_hash<char16_t>::operator()[abi:ne180100]((uint64_t *)buf.__r_.__value_.__l.__data_, (unint64_t)LODWORD(buf.__r_.__value_.__r.__words[1]) >> 1);
    v25 = v24;
    v26 = *(_QWORD *)(v13 + 56);
    if (!v26)
      goto LABEL_25;
    v27 = (uint8x8_t)vcnt_s8((int8x8_t)v26);
    v27.i16[0] = vaddlv_u8(v27);
    v28 = v27.u32[0];
    if (v27.u32[0] > 1uLL)
    {
      v16 = v24;
      if (v24 >= v26)
        v16 = v24 % v26;
    }
    else
    {
      v16 = (v26 - 1) & v24;
    }
    v29 = *(std::string::size_type **)(*(_QWORD *)v15 + 8 * v16);
    if (!v29 || (v30 = *v29) == 0)
    {
LABEL_24:
      v13 = a1;
LABEL_25:
      v33 = (char *)operator new(0x90uLL);
      v34 = v33;
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v33;
      __p.__r_.__value_.__l.__size_ = (std::string::size_type)v191;
      __p.__r_.__value_.__s.__data_[16] = 0;
      *(_QWORD *)v33 = 0;
      *((_QWORD *)v33 + 1) = v25;
      if (v23 < 0x19)
      {
        v37 = v33 + 32;
        *((_QWORD *)v33 + 2) = v33 + 32;
        *((_DWORD *)v33 + 6) = v23;
        *((_DWORD *)v33 + 7) = 24;
        if (!(_DWORD)v23)
          goto LABEL_29;
      }
      else
      {
        v35 = skit::SmallVector<std::byte,24u,false>::allocate(v23);
        *((_QWORD *)v34 + 2) = v35;
        v36 = malloc_size(v35);
        v37 = (_BYTE *)*((_QWORD *)v34 + 2);
        *((_DWORD *)v34 + 6) = v23;
        *((_DWORD *)v34 + 7) = v36;
      }
      do
      {
        v38 = *v22++;
        *v37++ = v38;
        --v23;
      }
      while (v23);
LABEL_29:
      *((_OWORD *)v34 + 5) = 0u;
      v39 = v34 + 80;
      *((_QWORD *)v39 - 3) = v39;
      *(v39 - 1) = 0u;
      v39[1] = 0u;
      v39[2] = 0u;
      v39[3] = 0u;
      __p.__r_.__value_.__s.__data_[16] = 1;
      v40 = (float)(unint64_t)(*(_QWORD *)(v13 + 72) + 1);
      v41 = *(float *)(v13 + 80);
      if (v26 && (float)(v41 * (float)v26) >= v40)
      {
LABEL_75:
        v57 = *(std::string::size_type **)(*(_QWORD *)v15 + 8 * v16);
        v30 = __p.__r_.__value_.__r.__words[0];
        if (v57)
        {
          *(_QWORD *)__p.__r_.__value_.__l.__data_ = *v57;
          v16 = v190;
        }
        else
        {
          *(_QWORD *)__p.__r_.__value_.__l.__data_ = *v191;
          *v191 = v30;
          *(_QWORD *)(*(_QWORD *)v15 + 8 * v16) = v191;
          v16 = v190;
          if (!*(_QWORD *)v30)
          {
LABEL_84:
            __p.__r_.__value_.__r.__words[0] = 0;
            ++*(_QWORD *)(v13 + 72);
            std::unique_ptr<std::__hash_node<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,void *>>>>::reset[abi:ne180100]((uint64_t)&__p);
            v109 = 0;
            goto LABEL_85;
          }
          v58 = *(_QWORD *)(*(_QWORD *)v30 + 8);
          if ((v26 & (v26 - 1)) != 0)
          {
            if (v58 >= v26)
              v58 %= v26;
          }
          else
          {
            v58 &= v26 - 1;
          }
          v57 = (std::string::size_type *)(*(_QWORD *)v15 + 8 * v58);
        }
        *v57 = v30;
        goto LABEL_84;
      }
      v42 = (v26 & (v26 - 1)) != 0;
      if (v26 < 3)
        v42 = 1;
      v43 = v42 | (2 * v26);
      v44 = vcvtps_u32_f32(v40 / v41);
      if (v43 <= v44)
        prime = (int8x8_t)v44;
      else
        prime = (int8x8_t)v43;
      if (*(_QWORD *)&prime == 1)
      {
        prime = (int8x8_t)2;
      }
      else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
      {
        prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      }
      v26 = *(_QWORD *)(v13 + 56);
      if (*(_QWORD *)&prime > v26)
        goto LABEL_41;
      if (*(_QWORD *)&prime < v26)
      {
        v52 = vcvtps_u32_f32((float)*(unint64_t *)(v13 + 72) / *(float *)(v13 + 80));
        if (v26 < 3 || (v53 = (uint8x8_t)vcnt_s8((int8x8_t)v26), v53.i16[0] = vaddlv_u8(v53), v53.u32[0] > 1uLL))
        {
          v52 = std::__next_prime(v52);
        }
        else
        {
          v54 = 1 << -(char)__clz(v52 - 1);
          if (v52 >= 2)
            v52 = v54;
        }
        if (*(_QWORD *)&prime <= v52)
          prime = (int8x8_t)v52;
        if (*(_QWORD *)&prime >= v26)
        {
          v26 = *(_QWORD *)(v13 + 56);
        }
        else
        {
          if (prime)
          {
LABEL_41:
            if (*(_QWORD *)&prime >> 61)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v46 = operator new(8 * *(_QWORD *)&prime);
            v47 = *(void **)v15;
            *(_QWORD *)v15 = v46;
            if (v47)
              operator delete(v47);
            v48 = 0;
            *(int8x8_t *)(v13 + 56) = prime;
            do
              *(_QWORD *)(*(_QWORD *)v15 + 8 * v48++) = 0;
            while (*(_QWORD *)&prime != v48);
            v49 = (_QWORD *)*v191;
            if (*v191)
            {
              v50 = v49[1];
              v51 = (uint8x8_t)vcnt_s8(prime);
              v51.i16[0] = vaddlv_u8(v51);
              if (v51.u32[0] > 1uLL)
              {
                if (v50 >= *(_QWORD *)&prime)
                  v50 %= *(_QWORD *)&prime;
              }
              else
              {
                v50 &= *(_QWORD *)&prime - 1;
              }
              *(_QWORD *)(*(_QWORD *)v15 + 8 * v50) = v191;
              v55 = (_QWORD *)*v49;
              if (*v49)
              {
                do
                {
                  v56 = v55[1];
                  if (v51.u32[0] > 1uLL)
                  {
                    if (v56 >= *(_QWORD *)&prime)
                      v56 %= *(_QWORD *)&prime;
                  }
                  else
                  {
                    v56 &= *(_QWORD *)&prime - 1;
                  }
                  if (v56 != v50)
                  {
                    if (!*(_QWORD *)(*(_QWORD *)v15 + 8 * v56))
                    {
                      *(_QWORD *)(*(_QWORD *)v15 + 8 * v56) = v49;
                      goto LABEL_66;
                    }
                    *v49 = *v55;
                    *v55 = **(_QWORD **)(*(_QWORD *)v15 + 8 * v56);
                    **(_QWORD **)(*(_QWORD *)v15 + 8 * v56) = v55;
                    v55 = v49;
                  }
                  v56 = v50;
LABEL_66:
                  v49 = v55;
                  v55 = (_QWORD *)*v55;
                  v50 = v56;
                }
                while (v55);
              }
            }
            v26 = (unint64_t)prime;
            goto LABEL_70;
          }
          v108 = *(void **)v15;
          *(_QWORD *)v15 = 0;
          if (v108)
            operator delete(v108);
          v26 = 0;
          *(_QWORD *)(v13 + 56) = 0;
        }
      }
LABEL_70:
      if ((v26 & (v26 - 1)) != 0)
      {
        if (v25 >= v26)
          v16 = v25 % v26;
        else
          v16 = v25;
      }
      else
      {
        v16 = (v26 - 1) & v25;
      }
      goto LABEL_75;
    }
    while (1)
    {
      v31 = *(_QWORD *)(v30 + 8);
      if (v31 == v25)
        break;
      if (v28 > 1)
      {
        if (v31 >= v26)
          v31 %= v26;
      }
      else
      {
        v31 &= v26 - 1;
      }
      if (v31 != v16)
        goto LABEL_24;
LABEL_23:
      v30 = *(_QWORD *)v30;
      if (!v30)
        goto LABEL_24;
    }
    if (*(_DWORD *)(v30 + 24) != (_DWORD)v23 || memcmp(*(const void **)(v30 + 16), v22, v23))
      goto LABEL_23;
    v109 = 1;
    v13 = a1;
    v16 = v190;
LABEL_85:
    _S12 = *(float *)(v12 + 32);
    if (*(_DWORD *)(v30 + 80) >= v16 && *(_DWORD *)(v30 + 92))
    {
      v66 = 0;
    }
    else
    {
      v60 = *(_QWORD *)(v30 + 96);
      v61 = *(_QWORD **)(v30 + 104);
      v62 = ((uint64_t)v61 - v60) >> 3;
      v63 = *(_QWORD *)(v30 + 128);
      if (v62 >= (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v63 - *(_QWORD *)(v30 + 120)) >> 1) + 64) >> 6)
      {
        v66 = 6;
        goto LABEL_103;
      }
      v64 = *(_QWORD *)(v30 + 112);
      if ((unint64_t)v61 < v64)
      {
        *v61 = 0;
        v65 = v61 + 1;
        goto LABEL_102;
      }
      v67 = v64 - v60;
      v68 = v67 >> 2;
      if (v67 >> 2 <= v62 + 1)
        v68 = v62 + 1;
      if ((unint64_t)v67 >= 0x7FFFFFFFFFFFFFF8)
        v69 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v69 = v68;
      if (v69 >> 61)
        goto LABEL_262;
      v70 = (char *)operator new(8 * v69);
      v71 = &v70[8 * v62];
      *(_QWORD *)v71 = 0;
      v65 = v71 + 8;
      v73 = *(char **)(v30 + 96);
      v72 = *(char **)(v30 + 104);
      if (v72 != v73)
      {
        do
        {
          v74 = *((_QWORD *)v72 - 1);
          v72 -= 8;
          *((_QWORD *)v71 - 1) = v74;
          v71 -= 8;
        }
        while (v72 != v73);
        v72 = *(char **)(v30 + 96);
      }
      *(_QWORD *)(v30 + 96) = v71;
      *(_QWORD *)(v30 + 104) = v65;
      *(_QWORD *)(v30 + 112) = &v70[8 * v69];
      if (v72)
        operator delete(v72);
LABEL_102:
      *(_QWORD *)(v30 + 104) = v65;
      v75 = *(_QWORD *)(v30 + 96);
      *(_DWORD *)(v30 + 88) = ((unint64_t)v65 - v75) >> 3;
      *(_QWORD *)(v30 + 64) = v75;
      v63 = *(_QWORD *)(v30 + 128);
      v66 = 14;
LABEL_103:
      v76 = *(_QWORD *)(v30 + 136);
      if (v63 < v76)
      {
        *(_DWORD *)v63 = v16;
        if (_S12 <= 65504.0)
          v77 = _S12;
        else
          v77 = 65504.0;
        if (_S12 >= -65504.0)
          _S0 = v77;
        else
          _S0 = *(float *)"";
        __asm { FCVT            H0, S0 }
        *(_WORD *)(v63 + 4) = _H0;
        v80 = (char *)(v63 + 6);
        goto LABEL_129;
      }
      v81 = *(_QWORD *)(v30 + 120);
      v82 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v63 - v81) >> 1);
      v83 = v82 + 1;
      if (v82 + 1 > 0x2AAAAAAAAAAAAAAALL)
        std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
      v84 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v76 - v81) >> 1);
      if (2 * v84 > v83)
        v83 = 2 * v84;
      v85 = v84 >= 0x1555555555555555 ? 0x2AAAAAAAAAAAAAAALL : v83;
      if (v85 > 0x2AAAAAAAAAAAAAAALL)
LABEL_262:
        std::__throw_bad_array_new_length[abi:ne180100]();
      v86 = (char *)operator new(6 * v85);
      v87 = &v86[6 * v82];
      *(_DWORD *)v87 = v16;
      if (_S12 <= 65504.0)
        v88 = _S12;
      else
        v88 = 65504.0;
      if (_S12 >= -65504.0)
        _S0 = v88;
      else
        _S0 = *(float *)"";
      __asm { FCVT            H0, S0 }
      *((_WORD *)v87 + 2) = _H0;
      v92 = *(_WORD **)(v30 + 120);
      v91 = *(_WORD **)(v30 + 128);
      v93 = &v86[6 * v82];
      if (v91 != v92)
      {
        do
        {
          v94 = *(_DWORD *)(v91 - 3);
          v91 -= 3;
          v95 = v91[2];
          *(_DWORD *)(v93 - 6) = v94;
          v93 -= 6;
          *((_WORD *)v93 + 2) = v95;
        }
        while (v91 != v92);
        v91 = *(_WORD **)(v30 + 120);
      }
      v96 = &v86[6 * v85];
      v80 = v87 + 6;
      *(_QWORD *)(v30 + 120) = v93;
      *(_QWORD *)(v30 + 128) = v87 + 6;
      *(_QWORD *)(v30 + 136) = v96;
      if (v91)
        operator delete(v91);
LABEL_129:
      *(_QWORD *)(v30 + 128) = v80;
      v97 = *(_QWORD *)(v30 + 120);
      *(_DWORD *)(v30 + 92) = -1431655765 * ((unint64_t)&v80[-v97] >> 1);
      *(_QWORD *)(v30 + 72) = v97;
      v98 = *(_DWORD *)(v30 + 80);
      if (v98 <= v16)
        v98 = v16;
      *(_DWORD *)(v30 + 80) = v98;
      LOWORD(_S0) = *(_WORD *)(v30 + 84);
      __asm
      {
        FCVT            S1, H0
        FCVT            H2, S12
      }
      if (_S12 > _S1)
        _S0 = _S2;
      *(_WORD *)(v30 + 84) = _S0;
      LOWORD(_S0) = *(_WORD *)(v30 + 86);
      __asm { FCVT            S1, H0 }
      if (_S1 < v10)
        _S0 = _S9;
      *(_WORD *)(v30 + 86) = _S0;
      v102 = *(_QWORD *)(v30 + 104);
      v103 = *(_DWORD *)(v102 - 8);
      if (v103 <= v16)
        v103 = v16;
      *(_DWORD *)(v102 - 8) = v103;
      LOWORD(_S0) = *(_WORD *)(v102 - 4);
      __asm { FCVT            S1, H0 }
      if (_S12 > _S1)
        _S0 = _S2;
      *(_WORD *)(v102 - 4) = _S0;
      LOWORD(_S0) = *(_WORD *)(v102 - 2);
      __asm { FCVT            S1, H0 }
      if (_S1 < v10)
        _S0 = _S9;
      *(_WORD *)(v102 - 2) = _S0;
      v13 = a1;
    }
    v107 = *(_QWORD *)(v13 + 88) + v66;
    *(_QWORD *)(v13 + 88) = v107;
    if ((v109 & 1) == 0)
      *(_QWORD *)(v13 + 88) = v107 + LODWORD(buf.__r_.__value_.__r.__words[1]) + 22;
    v11 = a3;
    if ((std::string::size_type *)buf.__r_.__value_.__l.__data_ != &buf.__r_.__value_.__r.__words[2])
      free(buf.__r_.__value_.__l.__data_);
    v14 = v193 + 1;
LABEL_147:
    v12 += 48;
  }
  while (v12 != v11);
  if (!v14)
    return 0;
  if (v10 <= 65504.0)
    v110 = v10;
  else
    v110 = 65504.0;
  if (v10 >= 0.0)
    _S8 = v110;
  else
    _S8 = 0.0;
  v112 = (_QWORD *)(v13 + 144);
  v114 = *(_QWORD *)(v13 + 152);
  v113 = *(_QWORD *)(v13 + 160);
  if (v114 >= v113)
  {
    v118 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v114 - *v112) >> 1);
    v119 = v118 + 1;
    if (v118 + 1 > 0x1999999999999999)
      std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
    v120 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v113 - *v112) >> 1);
    if (2 * v120 > v119)
      v119 = 2 * v120;
    if (v120 >= 0xCCCCCCCCCCCCCCCLL)
      v121 = 0x1999999999999999;
    else
      v121 = v119;
    v122 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::internal::CompressedMetaRecord>>(v121);
    v123 = &v122[10 * v118];
    v125 = &v122[10 * v124];
    __asm { FCVT            H0, S8 }
    *(_WORD *)v123 = _H0;
    *(_QWORD *)(v123 + 2) = 0xFFFFFFFFLL;
    v116 = v123 + 10;
    v128 = *(_WORD **)(a1 + 144);
    v127 = *(_WORD **)(a1 + 152);
    if (v127 != v128)
    {
      do
      {
        v129 = *(_QWORD *)(v127 - 5);
        v127 -= 5;
        v130 = v127[4];
        *(_QWORD *)(v123 - 10) = v129;
        v123 -= 10;
        *((_WORD *)v123 + 4) = v130;
      }
      while (v127 != v128);
      v127 = (_WORD *)*v112;
    }
    *(_QWORD *)(a1 + 144) = v123;
    *(_QWORD *)(a1 + 152) = v116;
    *(_QWORD *)(a1 + 160) = v125;
    if (v127)
      operator delete(v127);
  }
  else
  {
    __asm { FCVT            H0, S8 }
    *(_WORD *)v114 = _H0;
    *(_QWORD *)(v114 + 2) = 0xFFFFFFFFLL;
    v116 = (char *)(v114 + 10);
  }
  v132 = (_DWORD *)(a1 + 112);
  v131 = *(_DWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 152) = v116;
  v133 = *(_DWORD *)(a1 + 108) + 1;
  v134 = *(float *)(a1 + 116);
  if (v134 < _S8)
    v134 = _S8;
  *(float *)(a1 + 116) = v134;
  if (_S8 < 0.00000011921)
    ++v131;
  *(_DWORD *)(a1 + 108) = v133;
  *v132 = v131;
  v117 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 136) = v117 + 1;
  if (v117 < 1)
    return v117;
  if (uuid_is_null(uu))
    goto LABEL_209;
  v135 = *(_QWORD *)(a1 + 128);
  v136 = v117 - v135;
  if (v117 < v135 || *(_QWORD *)(a1 + 136) <= v117)
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v170 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      return -1;
    v174 = *(_QWORD *)(a1 + 128);
    v175 = *(_QWORD *)(a1 + 136);
    LODWORD(buf.__r_.__value_.__l.__data_) = 134218496;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v174;
    WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v175;
    HIWORD(buf.__r_.__value_.__r.__words[2]) = 2048;
    v199 = v117;
    v173 = "MemMetaStore::set_external_id : invalid document id : [%lli, %lli], %lli";
    goto LABEL_244;
  }
  _H0 = *(_WORD *)(*v112 + 10 * v136);
  __asm { FCVT            S0, H0 }
  if (_S0 < 0.00000011921)
    goto LABEL_203;
  *(_OWORD *)&buf.__r_.__value_.__l.__data_ = *(_OWORD *)uu;
  LODWORD(buf.__r_.__value_.__r.__words[2]) = v117 - v135;
  v139 = *(_DWORD **)(a1 + 184);
  v141 = v139[1];
  v140 = v139[2];
  v142 = v139[3];
  if (v140 + 1 > v142 * v141 - 1)
  {
    v179 = (*(_QWORD *)(a1 + 176) - 16) / 0x150uLL;
    if (v141 != (_DWORD)v179)
    {
      v180 = v141 + (v141 >> 1);
      v181 = (v140 + v142) / v142;
      if (v180 + 1 < v179)
        v182 = v180 + 1;
      else
        v182 = (*(_QWORD *)(a1 + 176) - 16) / 0x150uLL;
      if (v180 + 1 >= v181)
        v183 = v182;
      else
        v183 = v181;
      if (!skit::FlatSet<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::rehash(a1 + 168, v183))
      {
        v139 = *(_DWORD **)(a1 + 184);
        v141 = v139[1];
        goto LABEL_190;
      }
      return -1;
    }
    if (skit::internal::get_logging_context(void)::once != -1)
    v185 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      return -1;
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    v173 = "FlatSetBase::ensure_capacity : required capacity exceeded the maximum";
    p_p = &__p;
    v177 = v185;
    v178 = 2;
    goto LABEL_245;
  }
LABEL_190:
  v143 = skit::internal::murmur3_32((skit::internal *)&buf, 0x10uLL, 0);
  v144 = v143 & 0x7F;
  LODWORD(v145) = 16 * ((*v139 ^ (v143 >> 7)) % v141);
  v146 = 16 * v141;
  v147 = (uint64_t)&v139[v146 / 4 + 4];
  for (i = v145; ; i = (v149 + 1) % v146)
  {
    v149 = i;
    v150 = *((unsigned __int8 *)v139 + i + 16);
    if (v150 == v144)
    {
      v151 = v147 + 20 * v149;
      _ZF = buf.__r_.__value_.__r.__words[0] == *(_QWORD *)v151
         && buf.__r_.__value_.__l.__size_ == *(_QWORD *)(v151 + 8);
      if (_ZF)
      {
        *(_DWORD *)(v151 + 16) = v136;
        goto LABEL_202;
      }
    }
    if (v150 == 128)
      break;
  }
  v153 = (char *)v139 + v145;
  v155 = v153[16];
  v154 = v153 + 16;
  if (v155 >= -1)
  {
    do
    {
      v145 = ((int)v145 + 1) % v146;
      v154 = (char *)v139 + v145 + 16;
    }
    while ((char)*v154 > -2);
  }
  v156 = v147 + 20 * v145;
  *(_OWORD *)v156 = *(_OWORD *)&buf.__r_.__value_.__l.__data_;
  *(_DWORD *)(v156 + 16) = buf.__r_.__value_.__r.__words[2];
  *v154 = v144;
  ++v139[2];
  v132 = (_DWORD *)(a1 + 124);
LABEL_202:
  ++*v132;
LABEL_203:
  if (a8)
  {
    v157 = *(_QWORD *)(a1 + 24);
    v158 = *(_QWORD *)(a1 + 32);
    if (v157 != v158)
    {
      v159 = v157 + 8;
      do
      {
        if ((skit::internal::DiskMetaStore::set_doc_wgt((_QWORD *)(*(_QWORD *)(v159 - 8) + 168), (skit::internal *)uu, 0.0) & 1) != 0)break;
        _ZF = v159 == v158;
        v159 += 8;
      }
      while (!_ZF);
    }
  }
LABEL_209:
  v160 = a7;
  v161 = a6;
  if (a6 && a7 >= 1)
  {
    if (*(_DWORD *)(a1 + 224) == -1)
    {
      snprintf(__str, 0xFuLL, "index-%08x", *(_DWORD *)(a1 + 272));
      std::__fs::filesystem::path::path[abi:ne180100]<char [15],void>(&__p, (std::string *)__str);
      std::__fs::filesystem::operator/[abi:ne180100](&buf, a1, (std::__fs::filesystem::path *)&__p);
      v161 = a6;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v194, buf.__r_.__value_.__l.__data_, buf.__r_.__value_.__l.__size_);
      else
        v194 = buf;
      v184 = skit::internal::IndexMemImplV2::open_doc_store(v15, (std::__fs::filesystem::path *)&v194, *(_DWORD *)(a1 + 292), *(unsigned __int16 *)(a1 + 296), *(_QWORD *)(a1 + 312));
      if (SHIBYTE(v194.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v194.__r_.__value_.__l.__data_);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);
      v160 = a7;
      if (v184)
        return -1;
    }
    if (*(_QWORD *)(a1 + 128) <= v117 && *(_QWORD *)(a1 + 136) > v117)
    {
      skit::internal::BlobFile::append((skit::internal::BlobFile *)&buf, (const iovec *)(a1 + 200), v161, v160);
      if ((buf.__r_.__value_.__r.__words[2] & 0x80000000) == 0)
      {
        v162 = buf.__r_.__value_.__r.__words[1];
        v163 = *(_QWORD *)(a1 + 144) + 10 * (v117 - *(_DWORD *)(a1 + 128));
        *(_DWORD *)(v163 + 2) = buf.__r_.__value_.__l.__data_;
        *(_DWORD *)(v163 + 6) = v162;
        *(_DWORD *)(a1 + 120) += v162;
        goto LABEL_216;
      }
      return -1;
    }
    if (skit::internal::get_logging_context(void)::once != -1)
    v170 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      return -1;
    v171 = *(_QWORD *)(a1 + 128);
    v172 = *(_QWORD *)(a1 + 136);
    LODWORD(buf.__r_.__value_.__l.__data_) = 134218496;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v171;
    WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v172;
    HIWORD(buf.__r_.__value_.__r.__words[2]) = 2048;
    v199 = v117;
    v173 = "MemMetaStore::set_document : invalid document id : [%lli, %lli], %lli";
LABEL_244:
    p_p = &buf;
    v177 = v170;
    v178 = 32;
LABEL_245:
    _os_log_error_impl(&dword_1CB748000, v177, OS_LOG_TYPE_ERROR, v173, (uint8_t *)p_p, v178);
    return -1;
  }
LABEL_216:
  v164 = *(_DWORD *)(a1 + 108);
  if (v164 == *(_DWORD *)(a1 + 112))
  {
    if (v164 != -2)
      return v117;
  }
  else
  {
    v165 = *(_QWORD *)(a1 + 184);
    if (*(_DWORD *)(v165 + 8))
      v166 = (336 * *(_DWORD *)(v165 + 4) + 16);
    else
      v166 = 0;
    v167 = 10 * v164 + 48;
    if (!v164)
      v167 = 0;
    if ((unint64_t)(*(_QWORD *)(a1 + 88) + 14 * *(_QWORD *)(a1 + 72) + v166 + *(_QWORD *)(a1 + 232) + v167 + 40) <= *(_QWORD *)(a1 + 280)
      && v164 != -2)
    {
      return v117;
    }
  }
  if ((skit::internal::MultiIndexV2::flush((skit::internal::MultiIndexV2 *)a1) & 0x80000000) != 0)
    return -1;
  return v117;
}

void sub_1CB75D8A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *__p,uint64_t a38,int a39,__int16 a40,char a41,char a42)
{
  if (a42 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t skit::internal::IndexMemImplV2::open_doc_store(skit::internal::IndexMemImplV2 *this, std::__fs::filesystem::path *a2, int a3, unsigned int a4, uint64_t a5)
{
  std::string::size_type v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  std::string __p;
  _QWORD buf[4];

  buf[3] = *MEMORY[0x1E0C80C00];
  if (SHIBYTE(a2->__pn_.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, a2->__pn_.__r_.__value_.__l.__data_, a2->__pn_.__r_.__value_.__l.__size_);
  else
    __p = a2->__pn_;
  std::string::append(&__p, ".ids", 4uLL);
  if (*((_DWORD *)this + 44) == -1)
  {
    *((_QWORD *)this + 27) = a5;
    buf[0] = __p.__r_.__value_.__l.__size_;
    v9 = __p.__r_.__value_.__r.__words[0];
    *(_QWORD *)((char *)buf + 7) = *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 7);
    v10 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    memset(&__p, 0, sizeof(__p));
    if (*((char *)this + 175) < 0)
      operator delete(*((void **)this + 19));
    v11 = buf[0];
    *((_QWORD *)this + 19) = v9;
    *((_QWORD *)this + 20) = v11;
    *(_QWORD *)((char *)this + 167) = *(_QWORD *)((char *)buf + 7);
    *((_BYTE *)this + 175) = v10;
    v12 = skit::internal::BlobFile::open((skit::internal::IndexMemImplV2 *)((char *)this + 152), 1538, a3, a4);
  }
  else
  {
    v12 = 0xFFFFFFFFLL;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v12;
}

uint64_t skit::internal::MultiIndexV2::search(_QWORD *a1, unint64_t *a2, _QWORD *a3, int a4, unsigned int a5, unsigned int a6, int a7, int a8, float a9)
{
  unint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  unint64_t v19;
  char *v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  size_t v25;
  size_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  float v53;
  uint64_t v54;
  float *v55;
  float v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  float v62;
  uint64_t v63;
  unint64_t v64;
  int *v65;
  _DWORD *v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  float v71;
  float *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t doc_freq;
  uint64_t v79;
  uint64_t v80;
  float v81;
  uint64_t v82;
  float *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  float *v90;
  _QWORD **v91;
  unsigned int v92;
  uint64_t v93;
  uint64_t v94;
  unsigned int v95;
  int *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  _BYTE *v104;
  char *v105;
  uint64_t v106;
  _BYTE *v107;
  int v108;
  unsigned int *v109;
  uint64_t v110;
  _QWORD *v119;
  uint64_t v120;
  unsigned int v121;
  _QWORD *v122;
  uint64_t v123;
  int *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  _BYTE *v130;
  uint64_t v131;
  _BYTE *v132;
  int v133;
  uint64_t *v134;
  uint64_t *v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t result;
  unsigned int *v139;
  uint64_t v140;
  _QWORD *v145;
  _BYTE v146[12];
  int v147;
  uint64_t v148;
  unint64_t v149;
  unsigned int v150;
  uint64_t v151;
  _BYTE *v152;
  _QWORD *v153;
  _QWORD **v154;
  uint64_t v155;
  uint64_t v156;
  unsigned int v157;
  unsigned int v158;
  uint64_t *v159;
  _BYTE *v160;
  _QWORD **v161;
  _BYTE *v162;
  char *v163;
  uint64_t v164;
  _BYTE *v165;
  _BYTE *v166;
  _QWORD *v167;
  _QWORD *v168;
  _QWORD *v169;
  float v170;
  _QWORD v171[2];
  _QWORD *buf;
  unsigned int buf_8;
  _QWORD v174[3];
  __int128 v175;
  uint64_t v176;
  char *v177;
  char v178;
  uint64_t v179;
  uint64_t v180;

  v169 = a3;
  v153 = a1;
  v180 = *MEMORY[0x1E0C80C00];
  v170 = a9;
  v158 = a6;
  v14 = a6 + 1;
  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a2[2] - *a2) >> 3) < v14)
  {
    v15 = (uint64_t)(a2[1] - *a2) / 40;
    v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::Hit>>(v14);
    v17 = &v16[40 * v15];
    v18 = &v16[40 * (_QWORD)a2];
    v19 = *a2;
    v14 = a2[1];
    v20 = v17;
    if (v14 != *a2)
    {
      do
      {
        v21 = *(_OWORD *)(v14 - 40);
        v22 = *(_OWORD *)(v14 - 24);
        *((_QWORD *)v20 - 1) = *(_QWORD *)(v14 - 8);
        *(_OWORD *)(v20 - 24) = v22;
        *(_OWORD *)(v20 - 40) = v21;
        v20 -= 40;
        v14 -= 40;
      }
      while (v14 != v19);
      v14 = *a2;
    }
    *a2 = (unint64_t)v20;
    a2[1] = (unint64_t)v17;
    a2[2] = (unint64_t)v18;
    if (v14)
      operator delete((void *)v14);
  }
  v150 = a5;
  if (a5 == 2)
  {
    a7 = 1;
  }
  else if (a5 == 3)
  {
    a7 = -1431655765 * ((v169[1] - *v169) >> 4);
  }
  v23 = *v169;
  v156 = v169[1];
  v155 = v23;
  v24 = v156 - v23;
  v25 = v24 >> 1;
  v149 = 0xAAAAAAAAAAAAAAABLL * (v24 >> 4);
  if (v149 > 0x3F)
  {
    v33 = operator new[]();
    v30 = (_BYTE *)(v33 + v25);
    v152 = (_BYTE *)(v33 + v25 + v25);
    v165 = (_BYTE *)v33;
  }
  else
  {
    v26 = 0xAAAAAAAAAAAAAAACLL * (v24 >> 4);
    MEMORY[0x1E0C80A78](v14, a2);
    v27 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0;
    v165 = &v146[-v27];
    bzero(&v146[-v27], v25);
    MEMORY[0x1E0C80A78](v28, v29);
    v30 = &v146[-v27];
    bzero(&v146[-v27], v25);
    MEMORY[0x1E0C80A78](v31, v32);
    v152 = &v146[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
    bzero(v152, v26);
    v33 = 0;
  }
  v157 = a7;
  v147 = a8;
  switch(a4)
  {
    case 0:
      v34 = v169[1] - *v169;
      if (v34)
      {
        v35 = v34 / 48;
        if (v35 <= 1)
          v35 = 1;
        memset_pattern16(v152, &unk_1CB76D300, 4 * v35);
      }
      break;
    case 1:
      v38 = *v169;
      v37 = v169[1];
      v39 = (uint64_t *)v153[3];
      v40 = (uint64_t *)v153[4];
      if (v39 == v40)
      {
        v41 = 0;
      }
      else
      {
        v41 = 0;
        do
        {
          v42 = *v39++;
          v41 += *(unsigned int *)(*(_QWORD *)(v42 + 192) + 12);
        }
        while (v39 != v40);
      }
      if (v37 != v38)
      {
        v68 = 0;
        v69 = (unsigned __int128)((v37 - v38) * (__int128)0x2AAAAAAAAAAAAAABLL) >> 64;
        v70 = (v69 >> 3) + ((unint64_t)v69 >> 63);
        v71 = (float)(v41 + (unint64_t)*((unsigned int *)v153 + 27));
        v72 = (float *)v152;
        do
        {
          v73 = *v169;
          v74 = *v169 + v68;
          if ((*(_WORD *)(v74 + 40) & 1) != 0)
          {
            if (*(char *)(v74 + 23) < 0)
            {
              v77 = v73 + v68;
              v76 = *(void **)v77;
              v75 = *(_QWORD *)(v77 + 8);
            }
            else
            {
              v75 = *(unsigned __int8 *)(v74 + 23);
              v76 = (void *)(v73 + v68);
            }
            skit::internal::Term::Term(&buf, *(_WORD *)(v74 + 36), v76, v75);
            doc_freq = skit::internal::MultiIndexV2::get_doc_freq(v153, (uint64_t)&buf);
            *v72 = log10f((float)(v71 / (float)(unint64_t)doc_freq) + 1.0);
            if (buf != v174)
              free(buf);
          }
          else
          {
            *v72 = 0.0;
          }
          ++v72;
          v68 += 48;
          --v70;
        }
        while (v70);
      }
      break;
    case 2:
      v44 = *v169;
      v43 = v169[1];
      v45 = (uint64_t *)v153[3];
      v46 = (uint64_t *)v153[4];
      if (v45 == v46)
      {
        v47 = 0;
      }
      else
      {
        v47 = 0;
        do
        {
          v48 = *v45++;
          v47 += *(unsigned int *)(*(_QWORD *)(v48 + 192) + 12);
        }
        while (v45 != v46);
      }
      if (v43 != v44)
      {
        v79 = 0;
        v80 = (unsigned __int128)((v43 - v44) * (__int128)0x2AAAAAAAAAAAAAABLL) >> 64;
        v81 = (float)(v47 + (unint64_t)*((unsigned int *)v153 + 27));
        v82 = (v80 >> 3) + ((unint64_t)v80 >> 63);
        v83 = (float *)v152;
        do
        {
          v84 = *v169;
          v85 = *v169 + v79;
          if ((*(_WORD *)(v85 + 40) & 1) != 0)
          {
            if (*(char *)(v85 + 23) < 0)
            {
              v88 = v84 + v79;
              v87 = *(void **)v88;
              v86 = *(_QWORD *)(v88 + 8);
            }
            else
            {
              v86 = *(unsigned __int8 *)(v85 + 23);
              v87 = (void *)(v84 + v79);
            }
            skit::internal::Term::Term(&buf, *(_WORD *)(v85 + 36), v87, v86);
            v89 = skit::internal::MultiIndexV2::get_doc_freq(v153, (uint64_t)&buf);
            *v83 = logf((float)((float)((float)(v81 - (float)(unint64_t)v89) + 0.5)/ (float)((float)(unint64_t)v89 + 0.5))+ 1.0);
            if (buf != v174)
              free(buf);
          }
          else
          {
            *v83 = 0.0;
          }
          ++v83;
          v79 += 48;
          --v82;
        }
        while (v82);
      }
      break;
    case 3:
      v50 = *v169;
      v49 = v169[1];
      v51 = (v49 - *v169) / 48;
      if (v49 == *v169)
      {
        v56 = 0.0;
        v53 = 0.0;
      }
      else
      {
        v52 = 0;
        v53 = 0.0;
        v54 = (v49 - *v169) / 48;
        v55 = (float *)v152;
        v56 = 0.0;
        do
        {
          v57 = *v169;
          v58 = *v169 + v52;
          if ((*(_WORD *)(v58 + 40) & 1) != 0)
          {
            if (*(char *)(v58 + 23) < 0)
            {
              v61 = v57 + v52;
              v60 = *(void **)v61;
              v59 = *(_QWORD *)(v61 + 8);
            }
            else
            {
              v59 = *(unsigned __int8 *)(v58 + 23);
              v60 = (void *)(v57 + v52);
            }
            skit::internal::Term::Term(&buf, *(_WORD *)(v58 + 36), v60, v59);
            v62 = (float)(unint64_t)skit::internal::MultiIndexV2::get_doc_freq(v153, (uint64_t)&buf);
            *v55 = v62;
            if (buf != v174)
              free(buf);
            v53 = v53 + 1.0;
            v56 = v56 + v62;
          }
          else
          {
            *v55 = 0.0;
          }
          ++v55;
          v52 += 48;
          --v54;
        }
        while (v54);
      }
      if (v49 != v50)
      {
        v90 = (float *)v152;
        do
        {
          *v90 = 1.0
               - (float)(*v90
                       * (float)((float)((float)((float)((float)(v53 * (float)(v53 * v53)) + (float)(v53 * -2.0)) + 1.0)
                                       * 0.5)
                               / (float)(v56 * (float)(v53 * (float)(v53 * v53)))));
          ++v90;
          --v51;
        }
        while (v51);
      }
      break;
    case 4:
      v63 = v169[1] - *v169;
      if (v63)
      {
        v64 = v63 / 48;
        if (v64 <= 1)
          v64 = 1;
        v65 = (int *)(*v169 + 32);
        v66 = v152;
        do
        {
          v67 = *v65;
          v65 += 12;
          *v66++ = v67;
          --v64;
        }
        while (v64);
      }
      break;
    default:
      if (skit::internal::get_logging_context(void)::once != -1)
      v36 = skit::internal::get_logging_context(void)::logger;
      if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf) = 0;
        _os_log_fault_impl(&dword_1CB748000, v36, OS_LOG_TYPE_FAULT, "MultiIndexV2::token_wgts : Unknown token weight method", (uint8_t *)&buf, 2u);
      }
      break;
  }
  v148 = v33;
  v91 = (_QWORD **)v153[4];
  v161 = (_QWORD **)v153[3];
  v154 = v91;
  v159 = (uint64_t *)a2;
  v92 = v158;
  if (v161 != v91)
  {
    v163 = &v178;
    v167 = v174;
    v166 = v30 + 8;
    v93 = v149;
    if (v149 <= 1)
      v93 = 1;
    v151 = v93;
    v162 = v30 + 24;
    v160 = v30 + 16;
    do
    {
      if (v156 != v155)
      {
        v94 = 0;
        v95 = 0;
        v168 = *v161;
        v96 = (int *)v152;
        v97 = v151;
        do
        {
          v98 = *v169;
          v99 = *v169 + v94;
          if ((*(_WORD *)(v99 + 40) & 1) != 0)
          {
            if (*(char *)(v99 + 23) < 0)
            {
              v102 = v98 + v94;
              v101 = *(void **)v102;
              v100 = *(_QWORD *)(v102 + 8);
            }
            else
            {
              v100 = *(unsigned __int8 *)(v99 + 23);
              v101 = (void *)(v98 + v94);
            }
            skit::internal::Term::Term(&buf, *(_WORD *)(v99 + 36), v101, v100);
            v171[0] = buf;
            v171[1] = (unint64_t)buf_8 >> 1;
            v103 = skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::get(v168, (uint64_t)v171);
            skit::internal::IndexDiskImplV2::to_posting_list(&v177, v103);
            if (v179)
            {
              v104 = &v165[24 * v95];
              v105 = v163;
              *(_OWORD *)v104 = *(_OWORD *)v163;
              v106 = *((_QWORD *)v105 + 2);
              *((_QWORD *)v104 + 2) = v106;
              v107 = &v30[24 * v95];
              v108 = *v96;
              *(_QWORD *)v107 = v104;
              *((_QWORD *)v107 + 1) = v106;
              *((_DWORD *)v107 + 4) = v108;
              ++v95;
            }
            if (buf != v167)
              free(buf);
          }
          ++v96;
          v94 += 48;
          --v97;
        }
        while (v97);
        if (v95 >= v157)
        {
          v164 = *(_QWORD *)(v168[24] + 32);
          if (v95 < 2)
          {
            if (v95 == 1)
            {
              v109 = (unsigned int *)*((_QWORD *)v30 + 1);
              if ((unint64_t)v109 < *(_QWORD *)(*(_QWORD *)v30 + 16)
                                          + 6 * (unint64_t)*(unsigned int *)(**(_QWORD **)v30 + 12))
              {
                do
                {
                  v110 = v164 + *v109;
                  _H0 = *((_WORD *)v109 + 2);
                  __asm { FCVT            S0, H0 }
                  _H1 = *(_WORD *)(v168[26] + 10 * (v110 - *(_DWORD *)(v168[24] + 32)));
                  __asm { FCVT            S1, H1 }
                  v119 = *(_QWORD **)v30;
                  v109 = (unsigned int *)(*((_QWORD *)v30 + 1) + 6);
                  *((_QWORD *)v30 + 1) = v109;
                }
                while ((unint64_t)v109 < v119[2] + 6 * (unint64_t)*(unsigned int *)(*v119 + 12));
              }
            }
          }
          else if (v150 <= 4)
          {
            __asm { BR              X9 }
          }
        }
      }
      ++v161;
    }
    while (v161 != v154);
  }
  if (v156 != v155)
  {
    v120 = 0;
    v121 = 0;
    v122 = v153 + 6;
    if (v149 <= 1)
      v123 = 1;
    else
      v123 = v149;
    v124 = (int *)v152;
    do
    {
      v125 = *v169;
      v126 = *v169 + v120;
      if ((*(_WORD *)(v126 + 40) & 1) != 0)
      {
        if (*(char *)(v126 + 23) < 0)
        {
          v129 = v125 + v120;
          v128 = *(void **)v129;
          v127 = *(_QWORD *)(v129 + 8);
        }
        else
        {
          v127 = *(unsigned __int8 *)(v126 + 23);
          v128 = (void *)(v125 + v120);
        }
        skit::internal::Term::Term(&v177, *(_WORD *)(v126 + 36), v128, v127);
        skit::internal::IndexMemImplV2::get((uint64_t)&buf, v122, (uint64_t)&v177);
        if (v176)
        {
          v130 = &v165[24 * v121];
          *(_OWORD *)v130 = v175;
          v131 = v176;
          *((_QWORD *)v130 + 2) = v176;
          v132 = &v30[24 * v121];
          v133 = *v124;
          *(_QWORD *)v132 = v130;
          *((_QWORD *)v132 + 1) = v131;
          *((_DWORD *)v132 + 4) = v133;
          ++v121;
        }
        if (buf != v174)
          free(buf);
        if (v177 != &v178)
          free(v177);
      }
      ++v124;
      v120 += 48;
      --v123;
    }
    while (v123);
    if (v121 >= v157)
    {
      v169 = (_QWORD *)v153[16];
      if (v121 < 2)
      {
        if (v121 == 1)
        {
          v139 = (unsigned int *)*((_QWORD *)v30 + 1);
          if ((unint64_t)v139 < *(_QWORD *)(*(_QWORD *)v30 + 16)
                                      + 6 * (unint64_t)*(unsigned int *)(**(_QWORD **)v30 + 12))
          {
            do
            {
              v140 = (uint64_t)v169 + *v139;
              _H0 = *((_WORD *)v139 + 2);
              __asm { FCVT            S0, H0 }
              _H1 = *(_WORD *)(v153[18] + 10 * (v140 - *((_DWORD *)v153 + 32)));
              __asm { FCVT            S1, H1 }
              v145 = *(_QWORD **)v30;
              v139 = (unsigned int *)(*((_QWORD *)v30 + 1) + 6);
              *((_QWORD *)v30 + 1) = v139;
            }
            while ((unint64_t)v139 < v145[2] + 6 * (unint64_t)*(unsigned int *)(*v145 + 12));
          }
        }
      }
      else if (v150 <= 4)
      {
        __asm { BR              X10 }
      }
    }
  }
  v134 = v159;
  if (v147)
  {
    v135 = (uint64_t *)v153[3];
    v136 = (uint64_t *)v153[4];
    while (v135 != v136)
    {
      v137 = *v135++;
      skit::internal::DiskMetaStore::populate_doc(v137 + 168, *v134, v134[1]);
    }
  }
  result = v148;
  if (v148)
    return MEMORY[0x1D179DD9C](v148, 0x1000C8077774924);
  return result;
}

void sub_1CB75FC10(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(_QWORD *)(v1 - 432))
    MEMORY[0x1D179DD9C](*(_QWORD *)(v1 - 432), 0x1000C8077774924);
  _Unwind_Resume(exception_object);
}

_QWORD *skit::internal::`anonymous namespace'::push_hit(_QWORD *result, float *a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6, float a7)
{
  uint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  float *v33;
  float *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  float v38;
  float v39;
  __int128 v40;
  __int128 v41;
  float *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  BOOL (*v48)(uint64_t, uint64_t);
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  if (a4 >= a6 && *a2 < a7)
  {
    v12 = result;
    v13 = result[1];
    v14 = result[2];
    if (v13 >= v14)
    {
      v16 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v13 - *result) >> 3);
      v17 = v16 + 1;
      if (v16 + 1 > 0x666666666666666)
        std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
      v18 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v14 - *result) >> 3);
      if (2 * v18 > v17)
        v17 = 2 * v18;
      if (v18 >= 0x333333333333333)
        v19 = 0x666666666666666;
      else
        v19 = v17;
      if (v19)
        v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::Hit>>(v19);
      else
        v20 = 0;
      v21 = v19 + 40 * v16;
      v22 = v19 + 40 * v20;
      *(_DWORD *)v21 = 0;
      *(_QWORD *)(v21 + 8) = a3;
      *(float *)(v21 + 16) = a7;
      *(_DWORD *)(v21 + 20) = a4;
      *(_QWORD *)(v21 + 24) = 0;
      *(_QWORD *)(v21 + 32) = 0;
      v15 = v21 + 40;
      v24 = (char *)*v12;
      v23 = (char *)v12[1];
      if (v23 != (char *)*v12)
      {
        do
        {
          v25 = *(_OWORD *)(v23 - 40);
          v26 = *(_OWORD *)(v23 - 24);
          *(_QWORD *)(v21 - 8) = *((_QWORD *)v23 - 1);
          *(_OWORD *)(v21 - 24) = v26;
          *(_OWORD *)(v21 - 40) = v25;
          v21 -= 40;
          v23 -= 40;
        }
        while (v23 != v24);
        v23 = (char *)*v12;
      }
      *v12 = v21;
      v12[1] = v15;
      v12[2] = v22;
      if (v23)
        operator delete(v23);
    }
    else
    {
      *(_DWORD *)v13 = 0;
      *(_QWORD *)(v13 + 8) = a3;
      *(float *)(v13 + 16) = a7;
      *(_DWORD *)(v13 + 20) = a4;
      v15 = v13 + 40;
      *(_QWORD *)(v13 + 24) = 0;
      *(_QWORD *)(v13 + 32) = 0;
    }
    v12[1] = v15;
    v27 = *v12;
    std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(skit::Hit const&,skit::Hit const&),std::__wrap_iter<skit::Hit*>>(v27, v15, (uint64_t (**)(__n128 *, __n128 *))&v49, 0xCCCCCCCCCCCCCCCDLL * ((v15 - v27) >> 3));
    result = (_QWORD *)*v12;
    v28 = v12[1];
    v29 = v28 - *v12;
    v30 = 0xCCCCCCCCCCCCCCCDLL * (v29 >> 3);
    if (v30 > a5)
    {
      if (v29 >= 41)
      {
        v31 = 0;
        v32 = *((_OWORD *)result + 1);
        v49 = *(_OWORD *)result;
        v50 = v32;
        v51 = result[4];
        v33 = (float *)result;
        do
        {
          v34 = v33;
          v35 = v31 + 1;
          v33 += 10 * v31 + 10;
          v36 = 2 * v31;
          v31 = (2 * v31) | 1;
          v37 = v36 + 2;
          if (v37 < (uint64_t)v30)
          {
            v38 = v34[10 * v35 + 4];
            v39 = v33[14];
            if (v38 > v39 || v38 >= v39 && *(_QWORD *)&v34[10 * v35 + 2] > *((_QWORD *)v33 + 6))
            {
              v33 += 10;
              v31 = v37;
            }
          }
          v40 = *(_OWORD *)v33;
          v41 = *((_OWORD *)v33 + 1);
          *((_QWORD *)v34 + 4) = *((_QWORD *)v33 + 4);
          *(_OWORD *)v34 = v40;
          *((_OWORD *)v34 + 1) = v41;
        }
        while (v31 <= (uint64_t)((v30 - 2) >> 1));
        v42 = (float *)(v28 - 40);
        if (v33 == v42)
        {
          v46 = v49;
          v47 = v50;
          *((_QWORD *)v33 + 4) = v51;
          *(_OWORD *)v33 = v46;
          *((_OWORD *)v33 + 1) = v47;
        }
        else
        {
          v43 = *(_OWORD *)v42;
          v44 = *((_OWORD *)v42 + 1);
          *((_QWORD *)v33 + 4) = *((_QWORD *)v42 + 4);
          *(_OWORD *)v33 = v43;
          *((_OWORD *)v33 + 1) = v44;
          v45 = v50;
          *(_OWORD *)v42 = v49;
          *((_OWORD *)v42 + 1) = v45;
          *((_QWORD *)v42 + 4) = v51;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(skit::Hit const&,skit::Hit const&),std::__wrap_iter<skit::Hit*>>((uint64_t)result, (uint64_t)(v33 + 10), (uint64_t (**)(__n128 *, __n128 *))&v48, 0xCCCCCCCCCCCCCCCDLL * (((char *)(v33 + 10) - (char *)result) >> 3));
        }
        result = (_QWORD *)*v12;
        v28 = v12[1];
      }
      v12[1] = v28 - 40;
      *a2 = *((float *)result + 4);
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<skit::Hit>>(unint64_t a1)
{
  if (a1 >= 0x666666666666667)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(40 * a1);
}

BOOL skit::internal::`anonymous namespace'::hit_score_cmp(uint64_t a1, uint64_t a2)
{
  float v2;
  float v3;

  v2 = *(float *)(a1 + 16);
  v3 = *(float *)(a2 + 16);
  if (v2 > v3)
    return 1;
  if (v2 < v3)
    return 0;
  return *(_QWORD *)(a1 + 8) > *(_QWORD *)(a2 + 8);
}

__n128 std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(skit::Hit const&,skit::Hit const&),std::__wrap_iter<skit::Hit*>>(uint64_t a1, uint64_t a2, uint64_t (**a3)(__n128 *, __n128 *), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v9;
  __n128 *v10;
  __n128 *v11;
  __n128 result;
  __n128 v13;
  __n128 v14;
  __n128 *v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a4 - 2;
  if (a4 >= 2)
  {
    v22 = v4;
    v23 = v5;
    v9 = v6 >> 1;
    v10 = (__n128 *)(a1 + 40 * (v6 >> 1));
    v11 = (__n128 *)(a2 - 40);
    if ((*a3)(v10, a2 - 40))
    {
      v13 = *v11;
      v14 = v11[1];
      v21 = v11[2].n128_i64[0];
      v19 = v13;
      v20 = v14;
      do
      {
        v15 = v10;
        v16 = *v10;
        v17 = v10[1];
        v11[2].n128_u64[0] = v10[2].n128_u64[0];
        *v11 = v16;
        v11[1] = v17;
        if (!v9)
          break;
        v9 = (v9 - 1) >> 1;
        v10 = (__n128 *)(a1 + 40 * v9);
        v11 = v15;
      }
      while (((*a3)(v10, &v19) & 1) != 0);
      result = v19;
      v18 = v20;
      v15[2].n128_u64[0] = v21;
      *v15 = result;
      v15[1] = v18;
    }
  }
  return result;
}

BOOL skit::internal::MultiIndexV2::should_merge(skit::internal::MultiIndexV2 *this, unint64_t a2)
{
  skit::internal::IndexDiskImplV2 **v3;
  skit::internal::MultiIndexV2 *v4;
  unsigned int v5;
  uint64_t v6;
  skit::internal::IndexDiskImplV2 **v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  skit::internal::IndexDiskImplV2 *v11;
  unint64_t v12;

  if (!*((_BYTE *)this + 288))
    return 0;
  v3 = (skit::internal::IndexDiskImplV2 **)*((_QWORD *)this + 3);
  v4 = (skit::internal::MultiIndexV2 *)*((_QWORD *)this + 4);
  v5 = skit::internal::MultiIndexV2::index_count_threshold(v3, v4, 3 * (a2 >> 2));
  if (v3 == (skit::internal::IndexDiskImplV2 **)v4)
  {
    v9 = 0;
    v12 = *((unsigned int *)this + 27);
    LODWORD(v10) = *((_DWORD *)this + 27);
  }
  else
  {
    v6 = 0;
    v7 = v3;
    do
    {
      v8 = (uint64_t)*v7++;
      v6 += *(unsigned int *)(*(_QWORD *)(v8 + 192) + 12);
    }
    while (v7 != (skit::internal::IndexDiskImplV2 **)v4);
    v9 = 0;
    v10 = *((unsigned int *)this + 27);
    do
    {
      v11 = *v3++;
      v9 += (*(_DWORD *)(*((_QWORD *)v11 + 24) + 12) - *(_DWORD *)(*((_QWORD *)v11 + 24) + 16));
    }
    while (v3 != (skit::internal::IndexDiskImplV2 **)v4);
    v12 = v6 + v10;
  }
  return v5 > 2 || v12 >= 0x65 && 10 * (v9 + (unint64_t)(v10 - *((_DWORD *)this + 28))) < 9 * v12;
}

uint64_t skit::internal::PostingListV2::seek_to_block(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int *v11;
  char *v12;
  unsigned int v13;
  uint64_t v14;

  v3 = a1[2];
  v4 = (a2 - v3) / 384;
  v5 = *(unsigned int *)(*a1 + 8);
  if (v4 == v5)
    goto LABEL_9;
  v6 = a1[1];
  v7 = (char *)(v6 + 8 * v5);
  v8 = (char *)(v6 + 8 * v4);
  v9 = (v7 - v8) >> 3;
  do
  {
    v10 = v9 >> 1;
    v11 = (unsigned int *)&v8[8 * (v9 >> 1)];
    v13 = *v11;
    v12 = (char *)(v11 + 2);
    v9 += ~(v9 >> 1);
    if (v13 < a3)
      v8 = v12;
    else
      v9 = v10;
  }
  while (v9);
  if (v8 == v7)
LABEL_9:
    v14 = *(unsigned int *)(*a1 + 12);
  else
    v14 = 8 * (_QWORD)&v8[-v6];
  return v3 + 6 * v14;
}

BOOL skit::AliasSpanMatchCompare::compare_locale(skit::AliasSpanMatchCompare *this, int a2)
{
  BOOL v2;

  if ((_DWORD)this)
    v2 = (_DWORD)this == a2;
  else
    v2 = 1;
  return v2 || a2 == 0;
}

BOOL skit::AliasSpanMatchCompare::compare_entity_type(skit::AliasSpanMatchCompare *this, int a2)
{
  return (_DWORD)this == a2;
}

BOOL skit::AliasSpanMatchCompare::compare_group_id(__int16 a1, __int16 a2)
{
  return (!(_BYTE)a2 || !(_BYTE)a1 || a1 == a2) && HIBYTE(a1) == HIBYTE(a2);
}

BOOL skit::AliasSpanMatchCompare::operator()(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  int v3;
  BOOL v4;
  BOOL v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned __int16 *v10;
  unsigned __int16 *v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  BOOL v18;
  _BOOL8 result;

  v3 = a2[16];
  if (a3[16])
    v4 = v3 == 0;
  else
    v4 = 1;
  v5 = v4 || v3 == a3[16];
  if (!v5 || HIBYTE(a2[16]) != HIBYTE(a3[16]))
    return 0;
  v6 = *((char *)a2 + 23);
  v7 = *((_QWORD *)a2 + 1);
  if (v6 >= 0)
    v7 = *((unsigned __int8 *)a2 + 23);
  v8 = *((unsigned __int8 *)a3 + 23);
  v9 = (char)v8;
  if ((v8 & 0x80u) != 0)
    v8 = *((_QWORD *)a3 + 1);
  if (v7 != v8)
    return 0;
  if (!v7)
    return 1;
  if (v9 >= 0)
    v10 = a3;
  else
    v10 = *(unsigned __int16 **)a3;
  if (v6 >= 0)
    v11 = a2;
  else
    v11 = *(unsigned __int16 **)a2;
  v12 = v7 - 1;
  do
  {
    v14 = *v11++;
    v13 = v14;
    v16 = *v10++;
    v15 = v16;
    v18 = v12-- != 0;
    result = v15 == v13;
  }
  while (v15 == v13 && v18);
  return result;
}

skit::Alias *skit::Alias::Alias(skit::Alias *this, std::__fs::filesystem::path *a2, std::__fs::filesystem::path *a3)
{
  std::allocate_shared[abi:ne180100]<skit::internal::AliasImpl,std::allocator<skit::internal::AliasImpl>,std::__fs::filesystem::path,std::__fs::filesystem::path,void>(this, (uint64_t *)a2, (uint64_t *)a3);
  return this;
}

{
  std::allocate_shared[abi:ne180100]<skit::internal::AliasImpl,std::allocator<skit::internal::AliasImpl>,std::__fs::filesystem::path,std::__fs::filesystem::path,void>(this, (uint64_t *)a2, (uint64_t *)a3);
  return this;
}

uint64_t std::allocate_shared[abi:ne180100]<skit::internal::AliasImpl,std::allocator<skit::internal::AliasImpl>,std::__fs::filesystem::path,std::__fs::filesystem::path,void>(_QWORD *a1, uint64_t *a2, uint64_t *a3)
{
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t result;
  __int128 v12;
  __int128 v13;

  v6 = (char *)operator new(0x60uLL);
  *(_OWORD *)(v6 + 8) = 0u;
  *(_QWORD *)v6 = &off_1E8687480;
  v7 = *a2;
  *(_QWORD *)&v13 = a2[1];
  *(_QWORD *)((char *)&v13 + 7) = *(uint64_t *)((char *)a2 + 15);
  v8 = *((_BYTE *)a2 + 23);
  a2[2] = 0;
  *(_OWORD *)a2 = 0u;
  v9 = *a3;
  *(_QWORD *)&v12 = a3[1];
  *(_QWORD *)((char *)&v12 + 7) = *(uint64_t *)((char *)a3 + 15);
  v10 = *((_BYTE *)a3 + 23);
  *(_OWORD *)a3 = 0u;
  a3[2] = 0;
  *((_QWORD *)v6 + 3) = v7;
  *(_QWORD *)(v6 + 39) = *(_QWORD *)((char *)&v13 + 7);
  *((_QWORD *)v6 + 4) = v13;
  v6[47] = v8;
  *(_QWORD *)(v6 + 63) = *(_QWORD *)((char *)&v12 + 7);
  *((_QWORD *)v6 + 6) = v9;
  *((_QWORD *)v6 + 7) = v12;
  v6[71] = v10;
  marisa::Trie::Trie((marisa::Trie *)(v6 + 72));
  result = marisa::Trie::Trie((marisa::Trie *)(v6 + 80));
  v6[88] = 0;
  *a1 = v6 + 24;
  a1[1] = v6;
  return result;
}

void std::__shared_ptr_emplace<skit::internal::AliasImpl>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E8687480;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<skit::internal::AliasImpl>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E8687480;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D179DDB4);
}

void std::__shared_ptr_emplace<skit::internal::AliasImpl>::__on_zero_shared(uint64_t a1)
{
  uint64_t v2;

  *(_BYTE *)(a1 + 88) = 0;
  v2 = a1 + 72;
  marisa::Trie::clear((marisa::Trie *)(a1 + 72));
  marisa::Trie::clear((marisa::Trie *)(a1 + 80));
  MEMORY[0x1D179DAC0](a1 + 80);
  MEMORY[0x1D179DAC0](v2);
  if (*(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
}

uint64_t skit::Alias::init(const char **this)
{
  const char *v1;
  const char *v2;
  const char *v3;
  uint64_t result;

  v1 = *this;
  if (!*this)
    return 0xFFFFFFFFLL;
  v2 = *this;
  if (v1[23] < 0)
    v2 = *(const char **)v1;
  marisa::Trie::mmap((marisa::Trie *)(v1 + 48), v2);
  v3 = v1 + 24;
  if (v1[47] < 0)
    v3 = *(const char **)v3;
  marisa::Trie::mmap((marisa::Trie *)(v1 + 56), v3);
  result = 0;
  *((_BYTE *)v1 + 64) = 1;
  return result;
}

uint64_t skit::Alias::close(skit::Alias *this)
{
  _BYTE *v1;

  v1 = *(_BYTE **)this;
  if (!*(_QWORD *)this)
    return 0xFFFFFFFFLL;
  v1[64] = 0;
  marisa::Trie::clear((marisa::Trie *)(v1 + 48));
  marisa::Trie::clear((marisa::Trie *)(v1 + 56));
  return 0;
}

BOOL skit::Alias::is_initialized(skit::Alias *this)
{
  return *(_QWORD *)this && *(_BYTE *)(*(_QWORD *)this + 64) != 0;
}

void skit::Alias::find(_QWORD *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  _BYTE *v4;
  uint64_t v8;
  marisa::Trie *v9;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  __int16 v15;
  void *v16;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  marisa::Trie *v22;
  _BYTE v23[24];
  uint64_t v24;
  unsigned int v25;
  void *__p;
  __int128 v27;
  _BYTE v28[24];
  void *__src;
  unsigned int v30;
  _QWORD v31[5];

  v31[2] = *MEMORY[0x1E0C80C00];
  v4 = (_BYTE *)*a1;
  if (*a1 && v4[64])
  {
    marisa::Agent::Agent((marisa::Agent *)v23);
    marisa::Agent::Agent((marisa::Agent *)v28);
    v8 = 2 * a3;
    marisa::Agent::set_query((marisa::Agent *)v23, a2);
    v21 = v8 + 6;
    v22 = (marisa::Trie *)(v4 + 56);
    v9 = (marisa::Trie *)(v4 + 48);
    while (marisa::Trie::predictive_search(v22, (marisa::Agent *)v23))
    {
      if (v21 > v25 || (v25 & 1) != 0)
        break;
      v11 = v24 + v8;
      if (*(_WORD *)(v24 + v8))
        break;
      v12 = v8;
      v13 = v11 + 4;
      v14 = v24 + v25;
      if (v11 + 4 < v14)
      {
        v15 = *(_WORD *)(v11 + 2);
        do
        {
          marisa::Agent::set_query((marisa::Agent *)v28);
          marisa::Trie::reverse_lookup(v9, (marisa::Agent *)v28);
          std::basic_string<char16_t>::basic_string[abi:ne180100](&__p, __src, (unint64_t)v30 >> 1);
          v16 = __p;
          v31[0] = v27;
          *(_QWORD *)((char *)v31 + 7) = *(_QWORD *)((char *)&v27 + 7);
          v17 = HIBYTE(v27);
          __p = 0;
          v27 = 0uLL;
          v18 = *(_DWORD *)(a4 + 8);
          if (v18 == *(_DWORD *)(a4 + 12))
          {
            skit::SmallVector<std::tuple<std::basic_string<char16_t>,skit::GroupId>,2u,true>::_reserve_more((__int128 **)a4, v18 + (v18 >> 1) + 1);
            v18 = *(_DWORD *)(a4 + 8);
          }
          v19 = *(_QWORD *)a4 + 32 * v18;
          v20 = v31[0];
          *(_QWORD *)v19 = v16;
          *(_QWORD *)(v19 + 8) = v20;
          *(_QWORD *)(v19 + 15) = *(_QWORD *)((char *)v31 + 7);
          *(_BYTE *)(v19 + 23) = v17;
          v31[0] = 0;
          *(_QWORD *)((char *)v31 + 7) = 0;
          *(_WORD *)(v19 + 24) = v15;
          ++*(_DWORD *)(a4 + 8);
          if (SHIBYTE(v27) < 0)
            operator delete(__p);
          v13 += 2;
        }
        while (v13 < v14);
      }
      v8 = v12;
    }
    marisa::Agent::~Agent((marisa::Agent *)v28);
    marisa::Agent::~Agent((marisa::Agent *)v23);
  }
}

void sub_1CB760A90(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,__int128 buf)
{
  void *v24;
  int v25;
  void *v28;
  NSObject *v29;
  uint64_t v30;

  if (v25 < 0)
    operator delete(v24);
  if (a23 < 0)
    operator delete(__p);
  marisa::Agent::~Agent((marisa::Agent *)&buf);
  marisa::Agent::~Agent((marisa::Agent *)&a12);
  if (a2 == 1)
  {
    v28 = __cxa_begin_catch(a1);
    if (skit::internal::get_logging_context(void)::once != -1)
    v29 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      v30 = (*(uint64_t (**)(void *))(*(_QWORD *)v28 + 16))(v28);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v30;
      _os_log_error_impl(&dword_1CB748000, v29, OS_LOG_TYPE_ERROR, "Alias::find : Exception thrown while searching Marisa Trie : %{public}s", (uint8_t *)&buf, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x1CB760A54);
  }
  _Unwind_Resume(a1);
}

void skit::Alias::match(uint64_t *a1, uint64_t a2, uint64_t *a3, unsigned int a4)
{
  uint64_t v4;
  unint64_t v8;
  _BYTE v9[48];
  _BYTE v10[56];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  if (*a1 && *(_BYTE *)(v4 + 64))
  {
    marisa::Agent::Agent((marisa::Agent *)v9);
    marisa::Agent::Agent((marisa::Agent *)v10);
    v8 = 0xAAAAAAAAAAAAAAABLL * ((a3[1] - *a3) >> 4);
    if (v8 > a4)
      skit::internal::AliasImpl::span_match_alias(v4, a2, a3, a4, v8, (uint64_t)v9, (uint64_t)v10);
    marisa::Agent::~Agent((marisa::Agent *)v10);
    marisa::Agent::~Agent((marisa::Agent *)v9);
  }
}

void sub_1CB760C80(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 buf)
{
  void *v17;
  NSObject *v18;
  uint64_t v19;

  marisa::Agent::~Agent((marisa::Agent *)&buf);
  marisa::Agent::~Agent((marisa::Agent *)&a9);
  if (a2 == 1)
  {
    v17 = __cxa_begin_catch(a1);
    if (skit::internal::get_logging_context(void)::once != -1)
    v18 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      v19 = (*(uint64_t (**)(void *))(*(_QWORD *)v17 + 16))(v17);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v19;
      _os_log_error_impl(&dword_1CB748000, v18, OS_LOG_TYPE_ERROR, "Alias::init : Exception thrown while loading Marisa Trie file : %{public}s", (uint8_t *)&buf, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x1CB760C50);
  }
  _Unwind_Resume(a1);
}

void skit::Alias::match(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  unsigned int v6;
  unsigned int i;
  _BYTE v8[48];
  _BYTE v9[56];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  if (*a1 && *(_BYTE *)(v3 + 64))
  {
    marisa::Agent::Agent((marisa::Agent *)v8);
    marisa::Agent::Agent((marisa::Agent *)v9);
    v6 = -1431655765 * ((unint64_t)(a3[1] - *a3) >> 4);
    if (v6)
    {
      for (i = 0; i != v6; ++i)
        skit::internal::AliasImpl::span_match_alias(v3, a2, a3, i, v6, (uint64_t)v8, (uint64_t)v9);
    }
    marisa::Agent::~Agent((marisa::Agent *)v9);
    marisa::Agent::~Agent((marisa::Agent *)v8);
  }
}

void sub_1CB760E4C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, __int128 buf)
{
  void *v17;
  NSObject *v18;
  uint64_t v19;

  marisa::Agent::~Agent((marisa::Agent *)&a9);
  if (a2 == 1)
  {
    v17 = __cxa_begin_catch(a1);
    if (skit::internal::get_logging_context(void)::once != -1)
    v18 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      v19 = (*(uint64_t (**)(void *))(*(_QWORD *)v17 + 16))(v17);
      LODWORD(buf) = 136446210;
      *(_QWORD *)((char *)&buf + 4) = v19;
      _os_log_error_impl(&dword_1CB748000, v18, OS_LOG_TYPE_ERROR, "Alias::span_match_alias : Exception thrown while searching for span matches : %{public}s", (uint8_t *)&buf, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x1CB760E18);
  }
  _Unwind_Resume(a1);
}

__n128 skit::Analyzer::dedup@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  unsigned __int16 *v5;
  unint64_t v6;
  uint64_t v7;
  unsigned __int16 **v8;
  uint64_t v9;
  unsigned __int16 **v10;
  unsigned __int16 **v11;
  unsigned __int16 **v12;
  unsigned __int16 *v13;
  int v14;
  unsigned __int16 *v15;
  int v16;
  unsigned __int16 *v17;
  unsigned __int16 *v18;
  unsigned __int16 **v19;
  unsigned __int16 *v20;
  unsigned __int16 *v21;
  int v22;
  unsigned __int16 *v23;
  int v24;
  unsigned __int16 *v25;
  unsigned __int16 *v26;
  unsigned __int16 *v27;
  float v28;
  int v29;
  unsigned __int16 *v30;
  unsigned __int16 *v31;
  int v32;
  unsigned __int16 *v33;
  unsigned __int16 *v34;
  void **v35;
  __int128 v36;
  __int128 v37;
  __n128 result;

  v4 = *a1;
  v5 = (unsigned __int16 *)a1[1];
  v6 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((uint64_t)v5 - v4) >> 4));
  if (v5 == (unsigned __int16 *)v4)
    v7 = 0;
  else
    v7 = v6;
  std::__introsort<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *,false>(v4, v5, v7, 1);
  v9 = *a1;
  v8 = (unsigned __int16 **)a1[1];
  v10 = (unsigned __int16 **)*a1;
  if ((unsigned __int16 **)*a1 == v8)
  {
LABEL_24:
    if (v10 != v8)
    {
      v19 = v10 + 6;
      if (v10 + 6 != v8)
      {
        v20 = (unsigned __int16 *)*((unsigned __int8 *)v10 + 23);
        v21 = v10[1];
LABEL_27:
        v22 = (char)v20;
        if ((char)v20 < 0)
          v20 = v21;
        while (1)
        {
          v23 = (unsigned __int16 *)*((unsigned __int8 *)v19 + 23);
          v24 = (char)v23;
          if ((char)v23 < 0)
            v23 = v19[1];
          if (v20 != v23)
            goto LABEL_45;
          if (v20)
            break;
LABEL_41:
          *((_WORD *)v10 + 19) += *((_WORD *)v19 + 19);
          v28 = *((float *)v10 + 8);
          if (v28 < *((float *)v19 + 8))
            v28 = *((float *)v19 + 8);
          *((float *)v10 + 8) = v28;
          *((_WORD *)v10 + 20) |= *((_WORD *)v19 + 20);
          v19 += 6;
          if (v19 == v8)
            goto LABEL_68;
        }
        if (v24 >= 0)
          v25 = (unsigned __int16 *)v19;
        else
          v25 = *v19;
        v26 = *v10;
        if (v22 >= 0)
          v26 = (unsigned __int16 *)v10;
        v27 = v20;
        while (*v25 == *v26)
        {
          ++v26;
          ++v25;
          v27 = (unsigned __int16 *)((char *)v27 - 1);
          if (!v27)
            goto LABEL_41;
        }
LABEL_45:
        if (v19 != v8)
        {
          while (1)
          {
            v29 = *((char *)v10 + 23);
            v20 = (unsigned __int16 *)*((unsigned __int8 *)v10 + 23);
            v21 = v10[1];
            if (v29 >= 0)
              v30 = (unsigned __int16 *)*((unsigned __int8 *)v10 + 23);
            else
              v30 = v10[1];
            v31 = (unsigned __int16 *)*((unsigned __int8 *)v19 + 23);
            v32 = (char)v31;
            if ((char)v31 < 0)
              v31 = v19[1];
            if (v30 == v31)
            {
              if (!v30)
              {
LABEL_66:
                v35 = (void **)v10;
                if (v19 == v8)
                {
LABEL_69:
                  v8 = (unsigned __int16 **)(v35 + 6);
                  v9 = *a1;
                  goto LABEL_70;
                }
                goto LABEL_27;
              }
              if (v32 >= 0)
                v33 = (unsigned __int16 *)v19;
              else
                v33 = *v19;
              if (v29 >= 0)
                v34 = (unsigned __int16 *)v10;
              else
                v34 = *v10;
              while (*v33 == *v34)
              {
                ++v34;
                ++v33;
                v30 = (unsigned __int16 *)((char *)v30 - 1);
                if (!v30)
                  goto LABEL_66;
              }
            }
            v35 = (void **)(v10 + 6);
            if (*((char *)v10 + 71) < 0)
              operator delete(*v35);
            v36 = *(_OWORD *)v19;
            v10[8] = v19[2];
            *(_OWORD *)v35 = v36;
            *((_BYTE *)v19 + 23) = 0;
            *(_WORD *)v19 = 0;
            v37 = *(_OWORD *)(v19 + 3);
            v10[11] = v19[5];
            *(_OWORD *)(v10 + 9) = v37;
            v19 += 6;
            v8 = (unsigned __int16 **)a1[1];
            v10 += 6;
            if (v19 == v8)
              goto LABEL_69;
          }
        }
      }
LABEL_68:
      v35 = (void **)v10;
      goto LABEL_69;
    }
  }
  else
  {
    v11 = (unsigned __int16 **)(v9 + 48);
    if ((unsigned __int16 **)(v9 + 48) != v8)
    {
      v10 = (unsigned __int16 **)*a1;
      do
      {
        v12 = v11;
        v13 = (unsigned __int16 *)*((unsigned __int8 *)v10 + 23);
        v14 = (char)v13;
        if ((char)v13 < 0)
          v13 = v10[1];
        v15 = (unsigned __int16 *)*((unsigned __int8 *)v10 + 71);
        v16 = (char)v15;
        if ((char)v15 < 0)
          v15 = v10[7];
        if (v13 == v15)
        {
          if (!v13)
            goto LABEL_24;
          if (v16 >= 0)
            v17 = (unsigned __int16 *)v12;
          else
            v17 = *v12;
          if (v14 >= 0)
            v18 = (unsigned __int16 *)v10;
          else
            v18 = *v10;
          while (*v17 == *v18)
          {
            ++v18;
            ++v17;
            v13 = (unsigned __int16 *)((char *)v13 - 1);
            if (!v13)
              goto LABEL_24;
          }
        }
        v11 = v12 + 6;
        v10 = v12;
      }
      while (v12 + 6 != v8);
    }
  }
LABEL_70:
  std::vector<skit::Token>::resize(a1, 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v8 - v9) >> 4));
  result = *(__n128 *)a1;
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_QWORD *)(a2 + 16) = a1[2];
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  return result;
}

void std::__introsort<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *,false>(uint64_t a1, unsigned __int16 *a2, uint64_t a3, char a4)
{
  __int128 *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  unsigned __int16 *v21;
  unsigned int v22;
  unsigned int v23;
  unint64_t v24;
  int v25;
  unint64_t v26;
  int v27;
  unint64_t v28;
  unsigned __int16 *v29;
  unsigned int v30;
  unsigned int v31;
  __int128 v32;
  uint64_t v33;
  unsigned int v34;
  unint64_t v35;
  unsigned __int16 *v36;
  uint64_t *v37;
  uint64_t *v38;
  unsigned int v39;
  unint64_t v40;
  int v41;
  unint64_t v42;
  unsigned __int16 *v43;
  unsigned __int16 *v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned __int16 *v48;
  unsigned __int16 *v49;
  unsigned __int16 *v50;
  unint64_t v51;
  int v52;
  unint64_t v53;
  unint64_t v54;
  unsigned __int16 *v55;
  unsigned __int16 *v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  unsigned __int16 *v60;
  unint64_t v61;
  int v62;
  unint64_t v63;
  unint64_t v64;
  unsigned __int16 *v65;
  unsigned __int16 *v66;
  unsigned int v67;
  unsigned int v68;
  _QWORD *v70;
  uint64_t *v71;
  unsigned int v72;
  unint64_t v73;
  int v74;
  unint64_t v75;
  unint64_t v76;
  unsigned __int16 *v77;
  unsigned __int16 *v78;
  unsigned int v79;
  unsigned int v80;
  uint64_t *v81;
  unsigned int v82;
  _QWORD *v83;
  unint64_t v84;
  int v85;
  unint64_t v86;
  unsigned __int16 *v87;
  unsigned __int16 *v88;
  unsigned int v89;
  unsigned int v90;
  void **v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  BOOL v96;
  __int128 v97;
  __int128 v98;
  unsigned int v99;
  unsigned int v100;
  unsigned int v101;
  unint64_t v102;
  unsigned __int16 *v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  int v107;
  unint64_t v108;
  unint64_t v109;
  unsigned __int16 *v110;
  unsigned __int16 *v111;
  unsigned int v112;
  unsigned int v113;
  unint64_t v114;
  int v115;
  unint64_t v116;
  unint64_t v117;
  unsigned __int16 *v118;
  unsigned __int16 *v119;
  unsigned int v120;
  unsigned int v121;
  unint64_t v122;
  unsigned __int16 *v123;
  uint64_t v124;
  unsigned int v125;
  unint64_t v126;
  int v127;
  unint64_t v128;
  unint64_t v129;
  unsigned __int16 *v130;
  unsigned __int16 *v131;
  unsigned int v132;
  unsigned int v133;
  __int128 *v134;
  uint64_t *v135;
  unint64_t v136;
  unsigned __int16 *v137;
  unsigned __int16 *i;
  unint64_t v139;
  int v140;
  unint64_t v141;
  unsigned __int16 *v142;
  unsigned __int16 *v143;
  unsigned int v144;
  unsigned int v145;
  unint64_t v146;
  unsigned __int16 *v147;
  uint64_t *v148;
  unsigned int v149;
  uint64_t *v150;
  unint64_t v151;
  int v152;
  uint64_t v153;
  unint64_t v154;
  unsigned __int16 *v155;
  unsigned __int16 *v156;
  unsigned int v157;
  unsigned int v158;
  uint64_t *v159;
  unsigned int v160;
  unint64_t v161;
  int v162;
  unint64_t v163;
  unint64_t v164;
  unsigned __int16 *v165;
  unsigned __int16 *v166;
  unsigned int v167;
  unsigned int v168;
  void **v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  unsigned int v174;
  unsigned int v175;
  uint64_t v176;
  unsigned __int16 *v177;
  unsigned __int16 *v178;
  unsigned int v179;
  unsigned int v180;
  unsigned __int16 *v181;
  __int128 v182;
  unsigned int v183;
  unint64_t v184;
  unsigned __int16 *v185;
  unsigned __int16 *v186;
  unsigned __int16 *v187;
  unsigned int v188;
  unint64_t v189;
  int v190;
  unint64_t v191;
  unsigned __int16 *v192;
  unsigned __int16 *v193;
  unsigned int v194;
  unsigned int v195;
  unint64_t v196;
  int v197;
  unint64_t v198;
  int v199;
  unint64_t v200;
  unsigned __int16 *v201;
  unsigned __int16 *v202;
  unsigned int v203;
  unsigned int v204;
  uint64_t v205;
  __int128 v206;
  __int128 v207;
  int64_t v208;
  int64_t v209;
  int64_t v210;
  uint64_t v211;
  unsigned __int16 *v212;
  unsigned int v213;
  unsigned int v214;
  unint64_t v215;
  int v216;
  unint64_t v217;
  int v218;
  unint64_t v219;
  unsigned __int16 *v220;
  unsigned __int16 *v221;
  unsigned int v222;
  unsigned int v223;
  unsigned int v224;
  unsigned int v225;
  unsigned __int16 **v226;
  unsigned __int16 *v227;
  int v228;
  unint64_t v229;
  int v230;
  unsigned __int16 *v231;
  unsigned __int16 *v232;
  unsigned __int16 *v233;
  unsigned int v234;
  unsigned int v235;
  __int128 v236;
  uint64_t v237;
  __int128 v238;
  unsigned __int16 **v239;
  __int128 v240;
  __int128 v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  unsigned int v245;
  unsigned int v246;
  unint64_t v247;
  int v248;
  unint64_t v249;
  int v250;
  unint64_t v251;
  unsigned __int16 *v252;
  unsigned __int16 *v253;
  unsigned int v254;
  unsigned int v255;
  unsigned int v256;
  unint64_t v257;
  unint64_t v258;
  int v259;
  unint64_t v260;
  unsigned __int16 *v261;
  unsigned __int16 *v262;
  unsigned int v263;
  unsigned int v264;
  __int128 v265;
  __int128 v266;
  int64_t v267;
  void **v268;
  uint64_t v269;
  uint64_t v270;
  char v271;
  __int128 v272;
  uint64_t v273;
  uint64_t v274;
  void **v275;
  uint64_t v276;
  int64_t v277;
  unsigned int v278;
  unsigned int v279;
  unint64_t v280;
  int v281;
  unint64_t v282;
  int v283;
  unint64_t v284;
  unsigned __int16 *v285;
  unsigned __int16 *v286;
  unsigned int v287;
  unsigned int v288;
  __int128 v289;
  __int128 v290;
  __int128 *v291;
  int v292;
  void **v293;
  __int128 v294;
  __int128 v295;
  void **v296;
  void *v297;
  __int128 v298;
  uint64_t v299;
  unint64_t v300;
  unsigned __int16 **v301;
  unsigned int v302;
  unsigned int v303;
  __int128 v304;
  uint64_t v305;
  unsigned int v306;
  unint64_t v307;
  unsigned __int16 *v308;
  unsigned __int16 *v309;
  __int128 v310;
  __int128 v311;
  unsigned int v312;
  unsigned __int16 *v313;
  int v314;
  unsigned __int16 *v315;
  unsigned __int16 *v316;
  unsigned __int16 *v317;
  unsigned int v318;
  unsigned int v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  unint64_t v324;
  int v325;
  unsigned __int16 *v326;
  int v327;
  unsigned __int16 *v328;
  unsigned __int16 *v329;
  unsigned __int16 *v330;
  unsigned int v331;
  unsigned int v332;
  unint64_t v333;
  int v334;
  unint64_t v335;
  int v336;
  unint64_t v337;
  unsigned __int16 *v338;
  unsigned __int16 *v339;
  unsigned int v340;
  unsigned int v341;
  uint64_t v342;
  unsigned __int16 *v343;
  unsigned int v344;
  unsigned int v345;
  unsigned __int16 *v346;
  __int128 v347;
  unsigned int v348;
  unint64_t v349;
  unsigned __int16 *v350;
  uint64_t v351;
  unsigned __int16 *v352;
  unsigned int v353;
  unint64_t v354;
  int v355;
  unint64_t v356;
  unsigned __int16 *v357;
  unsigned __int16 *v358;
  unsigned int v359;
  unsigned int v360;
  __int128 v361;
  __int128 v362;
  unint64_t v363;
  int v364;
  unint64_t v365;
  int v366;
  unint64_t v367;
  unsigned __int16 *v368;
  unsigned __int16 *v369;
  unsigned int v370;
  unsigned int v371;
  unsigned __int16 *v372;
  uint64_t v374;
  unsigned __int16 *v375;
  __int128 v376;
  uint64_t v377;
  __int128 v378;
  uint64_t v379;
  __int128 v380;
  void *v381;
  _QWORD v382[4];

  v382[2] = *MEMORY[0x1E0C80C00];
  v7 = &v378;
LABEL_2:
  v375 = a2 - 24;
  v8 = (uint64_t *)a1;
  while (2)
  {
    a1 = (uint64_t)v8;
    v9 = (char *)a2 - (char *)v8;
    v10 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v8) >> 4);
    switch(v10)
    {
      case 0:
      case 1:
        return;
      case 2:
        v174 = *(a2 - 6);
        v175 = *(unsigned __int16 *)(a1 + 36);
        if (v174 < v175)
          goto LABEL_287;
        if (v174 > v175)
          return;
        v333 = *(unsigned __int8 *)(a1 + 23);
        v334 = (char)v333;
        if ((v333 & 0x80u) != 0)
          v333 = *(_QWORD *)(a1 + 8);
        v335 = *((unsigned __int8 *)a2 - 25);
        v336 = (char)v335;
        if ((v335 & 0x80u) != 0)
          v335 = *((_QWORD *)a2 - 5);
        if (v333 >= v335)
          v337 = v335;
        else
          v337 = v333;
        if (!v337)
          goto LABEL_556;
        if (v336 >= 0)
          v338 = a2 - 24;
        else
          v338 = *(unsigned __int16 **)v375;
        if (v334 >= 0)
          v339 = (unsigned __int16 *)a1;
        else
          v339 = *(unsigned __int16 **)a1;
        do
        {
          v340 = *v338;
          v341 = *v339;
          if (v340 < v341)
            goto LABEL_287;
          if (v341 < v340)
            return;
          ++v338;
          ++v339;
          --v337;
        }
        while (v337);
LABEL_556:
        if (v335 < v333)
        {
LABEL_287:
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a1, (uint64_t)v375);
          return;
        }
        return;
      case 3:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((uint64_t *)a1, a1 + 48, (uint64_t)v375);
        return;
      case 4:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((uint64_t *)a1, a1 + 48, a1 + 96, (uint64_t)v375);
        return;
      case 5:
        std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *,0>((uint64_t *)a1, a1 + 48, a1 + 96, a1 + 144, (uint64_t)v375);
        return;
      default:
        if (v9 <= 1151)
        {
          if ((a4 & 1) != 0)
          {
            if ((unsigned __int16 *)a1 == a2)
              return;
            v176 = a1 + 48;
            if ((unsigned __int16 *)(a1 + 48) == a2)
              return;
            v177 = (unsigned __int16 *)a1;
            while (1)
            {
              v178 = v177;
              v177 = (unsigned __int16 *)v176;
              v179 = v178[42];
              v180 = v178[18];
              if (v179 >= v180)
              {
                if (v179 > v180)
                  goto LABEL_349;
                v196 = *((unsigned __int8 *)v178 + 23);
                v197 = (char)v196;
                if ((v196 & 0x80u) != 0)
                  v196 = *((_QWORD *)v178 + 1);
                v198 = *((unsigned __int8 *)v178 + 71);
                v199 = (char)v198;
                if ((v198 & 0x80u) != 0)
                  v198 = *((_QWORD *)v178 + 7);
                if (v196 >= v198)
                  v200 = v198;
                else
                  v200 = v196;
                if (v200)
                {
                  if (v199 >= 0)
                    v201 = v177;
                  else
                    v201 = *(unsigned __int16 **)v177;
                  if (v197 >= 0)
                    v202 = v178;
                  else
                    v202 = *(unsigned __int16 **)v178;
                  while (1)
                  {
                    v203 = *v201;
                    v204 = *v202;
                    if (v203 < v204)
                      break;
                    if (v204 < v203)
                      goto LABEL_349;
                    ++v201;
                    ++v202;
                    if (!--v200)
                      goto LABEL_342;
                  }
                }
                else
                {
LABEL_342:
                  if (v198 >= v196)
                    goto LABEL_349;
                }
              }
              v181 = a2;
              v182 = *(_OWORD *)v177;
              v377 = *((_QWORD *)v177 + 2);
              v376 = v182;
              *((_QWORD *)v177 + 1) = 0;
              *((_QWORD *)v177 + 2) = 0;
              *(_QWORD *)v177 = 0;
              v378 = *(_OWORD *)(v178 + 36);
              v379 = *((_QWORD *)v178 + 11);
              v183 = WORD6(v378);
              if (v377 >= 0)
                v184 = HIBYTE(v377);
              else
                v184 = *((_QWORD *)&v376 + 1);
              if (v377 >= 0)
                v185 = (unsigned __int16 *)&v376;
              else
                v185 = (unsigned __int16 *)v376;
              v186 = v177;
              while (1)
              {
                v187 = v178;
                if (*((char *)v186 + 23) < 0)
                  operator delete(*(void **)v186);
                *(_OWORD *)v186 = *(_OWORD *)v187;
                *((_QWORD *)v186 + 2) = *((_QWORD *)v187 + 2);
                *((_BYTE *)v187 + 23) = 0;
                *v187 = 0;
                *(_OWORD *)(v186 + 12) = *(_OWORD *)(v187 + 12);
                *((_QWORD *)v186 + 5) = *((_QWORD *)v187 + 5);
                if (v187 == (unsigned __int16 *)a1)
                  break;
                v178 = v187 - 24;
                v188 = *(v187 - 6);
                v186 = v187;
                if (v183 >= v188)
                {
                  if (v183 > v188)
                    goto LABEL_344;
                  v189 = *((unsigned __int8 *)v187 - 25);
                  v190 = (char)v189;
                  if ((v189 & 0x80u) != 0)
                    v189 = *((_QWORD *)v187 - 5);
                  if (v189 >= v184)
                    v191 = v184;
                  else
                    v191 = v189;
                  if (v191)
                  {
                    if (v190 >= 0)
                      v192 = v187 - 24;
                    else
                      v192 = *(unsigned __int16 **)v178;
                    v193 = v185;
                    while (1)
                    {
                      v194 = *v193;
                      v195 = *v192;
                      if (v194 < v195)
                        break;
                      if (v195 < v194)
                        goto LABEL_344;
                      ++v193;
                      ++v192;
                      if (!--v191)
                        goto LABEL_321;
                    }
                    v186 = v187;
                  }
                  else
                  {
LABEL_321:
                    v186 = v187;
                    if (v184 >= v189)
                    {
LABEL_344:
                      v205 = (uint64_t)v187;
                      goto LABEL_346;
                    }
                  }
                }
              }
              v205 = a1;
LABEL_346:
              if (*(char *)(v205 + 23) < 0)
                operator delete(*(void **)v205);
              v206 = v376;
              *(_QWORD *)(v205 + 16) = v377;
              *(_OWORD *)v205 = v206;
              v207 = v378;
              *((_QWORD *)v187 + 5) = v379;
              *(_OWORD *)(v187 + 12) = v207;
              a2 = v181;
LABEL_349:
              v176 = (uint64_t)(v177 + 24);
              if (v177 + 24 == a2)
                return;
            }
          }
          if ((unsigned __int16 *)a1 == a2)
            return;
          v342 = a1 + 48;
          if ((unsigned __int16 *)(a1 + 48) == a2)
            return;
          while (1)
          {
            v343 = (unsigned __int16 *)a1;
            a1 = v342;
            v344 = v343[42];
            v345 = v343[18];
            if (v344 >= v345)
            {
              if (v344 > v345)
                goto LABEL_610;
              v363 = *((unsigned __int8 *)v343 + 23);
              v364 = (char)v363;
              if ((v363 & 0x80u) != 0)
                v363 = *((_QWORD *)v343 + 1);
              v365 = *((unsigned __int8 *)v343 + 71);
              v366 = (char)v365;
              if ((v365 & 0x80u) != 0)
                v365 = *((_QWORD *)v343 + 7);
              if (v363 >= v365)
                v367 = v365;
              else
                v367 = v363;
              if (v367)
              {
                if (v366 >= 0)
                  v368 = (unsigned __int16 *)a1;
                else
                  v368 = *(unsigned __int16 **)a1;
                if (v364 >= 0)
                  v369 = v343;
                else
                  v369 = *(unsigned __int16 **)v343;
                while (1)
                {
                  v370 = *v368;
                  v371 = *v369;
                  if (v370 < v371)
                    break;
                  if (v371 < v370)
                    goto LABEL_610;
                  ++v368;
                  ++v369;
                  if (!--v367)
                    goto LABEL_609;
                }
              }
              else
              {
LABEL_609:
                if (v365 >= v363)
                  goto LABEL_610;
              }
            }
            v346 = a2;
            v347 = *(_OWORD *)a1;
            v377 = *(_QWORD *)(a1 + 16);
            v376 = v347;
            *(_QWORD *)(a1 + 8) = 0;
            *(_QWORD *)(a1 + 16) = 0;
            *(_QWORD *)a1 = 0;
            v378 = *(_OWORD *)(v343 + 36);
            v379 = *((_QWORD *)v343 + 11);
            v348 = WORD6(v378);
            if (v377 >= 0)
              v349 = HIBYTE(v377);
            else
              v349 = *((_QWORD *)&v376 + 1);
            if (v377 >= 0)
              v350 = (unsigned __int16 *)&v376;
            else
              v350 = (unsigned __int16 *)v376;
            v351 = a1;
            while (1)
            {
              do
              {
                v352 = v343;
                if (*(char *)(v351 + 23) < 0)
                  operator delete(*(void **)v351);
                *(_OWORD *)v351 = *(_OWORD *)v352;
                *(_QWORD *)(v351 + 16) = *((_QWORD *)v352 + 2);
                *((_BYTE *)v352 + 23) = 0;
                *v352 = 0;
                *(_OWORD *)(v351 + 24) = *(_OWORD *)(v352 + 12);
                *(_QWORD *)(v351 + 40) = *((_QWORD *)v352 + 5);
                v343 = v352 - 24;
                v353 = *(v352 - 6);
                v351 = (uint64_t)v352;
              }
              while (v348 < v353);
              if (v348 > v353)
                break;
              v354 = *((unsigned __int8 *)v352 - 25);
              v355 = (char)v354;
              if ((v354 & 0x80u) != 0)
                v354 = *((_QWORD *)v352 - 5);
              if (v354 >= v349)
                v356 = v349;
              else
                v356 = v354;
              if (v356)
              {
                if (v355 >= 0)
                  v357 = v352 - 24;
                else
                  v357 = *(unsigned __int16 **)v343;
                v358 = v350;
                while (1)
                {
                  v359 = *v358;
                  v360 = *v357;
                  if (v359 < v360)
                    break;
                  if (v360 < v359)
                    goto LABEL_588;
                  ++v358;
                  ++v357;
                  if (!--v356)
                    goto LABEL_585;
                }
                v351 = (uint64_t)v352;
              }
              else
              {
LABEL_585:
                v351 = (uint64_t)v352;
                if (v349 >= v354)
                  break;
              }
            }
LABEL_588:
            if (*((char *)v352 + 23) < 0)
              operator delete(*(void **)v352);
            v361 = v376;
            *((_QWORD *)v352 + 2) = v377;
            *(_OWORD *)v352 = v361;
            v362 = v378;
            *((_QWORD *)v352 + 5) = v379;
            *(_OWORD *)(v352 + 12) = v362;
            a2 = v346;
LABEL_610:
            v342 = a1 + 48;
            if ((unsigned __int16 *)(a1 + 48) == a2)
              return;
          }
        }
        if (!a3)
        {
          if ((unsigned __int16 *)a1 == a2)
            return;
          v372 = a2;
          v208 = (unint64_t)(v10 - 2) >> 1;
          v209 = v208;
          while (1)
          {
            v210 = v209;
            if (v208 < v209)
              goto LABEL_446;
            v211 = (2 * v209) | 1;
            v212 = (unsigned __int16 *)(a1 + 48 * v211);
            if (2 * v210 + 2 < v10)
            {
              v213 = *(unsigned __int16 *)(a1 + 48 * v211 + 36);
              v214 = v212[42];
              if (v213 < v214)
                goto LABEL_356;
              if (v213 <= v214)
              {
                v215 = *((unsigned __int8 *)v212 + 71);
                v216 = (char)v215;
                if ((v215 & 0x80u) != 0)
                  v215 = *((_QWORD *)v212 + 7);
                v217 = *((unsigned __int8 *)v212 + 23);
                v218 = (char)v217;
                if ((v217 & 0x80u) != 0)
                  v217 = *((_QWORD *)v212 + 1);
                if (v215 >= v217)
                  v219 = v217;
                else
                  v219 = v215;
                if (v219)
                {
                  if (v218 >= 0)
                    v220 = (unsigned __int16 *)(a1 + 48 * v211);
                  else
                    v220 = *(unsigned __int16 **)v212;
                  if (v216 >= 0)
                    v221 = v212 + 24;
                  else
                    v221 = (unsigned __int16 *)*((_QWORD *)v212 + 6);
                  while (1)
                  {
                    v222 = *v220;
                    v223 = *v221;
                    if (v222 < v223)
                      break;
                    if (v223 < v222)
                      goto LABEL_376;
                    ++v220;
                    ++v221;
                    if (!--v219)
                      goto LABEL_375;
                  }
LABEL_356:
                  v212 += 24;
                  v211 = 2 * v210 + 2;
                  goto LABEL_376;
                }
LABEL_375:
                if (v217 < v215)
                  goto LABEL_356;
              }
            }
LABEL_376:
            v224 = v212[18];
            v225 = *(unsigned __int16 *)(a1 + 48 * v210 + 36);
            if (v224 < v225)
              goto LABEL_446;
            v226 = (unsigned __int16 **)(a1 + 48 * v210);
            if (v224 <= v225)
            {
              v227 = (unsigned __int16 *)*((unsigned __int8 *)v226 + 23);
              v228 = (char)v227;
              if ((char)v227 < 0)
                v227 = v226[1];
              v229 = *((unsigned __int8 *)v212 + 23);
              v230 = (char)v229;
              if ((v229 & 0x80u) != 0)
                v229 = *((_QWORD *)v212 + 1);
              if ((unint64_t)v227 >= v229)
                v231 = (unsigned __int16 *)v229;
              else
                v231 = v227;
              if (v231)
              {
                if (v230 >= 0)
                  v232 = v212;
                else
                  v232 = *(unsigned __int16 **)v212;
                if (v228 >= 0)
                  v233 = (unsigned __int16 *)(a1 + 48 * v210);
                else
                  v233 = *v226;
                while (1)
                {
                  v234 = *v232;
                  v235 = *v233;
                  if (v234 < v235)
                    goto LABEL_446;
                  if (v235 < v234)
                    break;
                  ++v232;
                  ++v233;
                  v231 = (unsigned __int16 *)((char *)v231 - 1);
                  if (!v231)
                    goto LABEL_395;
                }
              }
              else
              {
LABEL_395:
                if (v229 < (unint64_t)v227)
                  goto LABEL_446;
              }
            }
            v236 = *(_OWORD *)v226;
            v377 = (uint64_t)v226[2];
            v376 = v236;
            v226[1] = 0;
            v226[2] = 0;
            *v226 = 0;
            v237 = a1 + 48 * v210;
            v238 = *(_OWORD *)(v237 + 24);
            v379 = *(_QWORD *)(v237 + 40);
            v378 = v238;
            while (1)
            {
              v239 = (unsigned __int16 **)v212;
              if (*((char *)v226 + 23) < 0)
                operator delete(*v226);
              v240 = *(_OWORD *)v239;
              v226[2] = v239[2];
              *(_OWORD *)v226 = v240;
              *((_BYTE *)v239 + 23) = 0;
              *(_WORD *)v239 = 0;
              v241 = *(_OWORD *)(v239 + 3);
              v226[5] = v239[5];
              *(_OWORD *)(v226 + 3) = v241;
              if (v208 < v211)
                break;
              v242 = 2 * v211;
              v243 = (2 * v211) | 1;
              v211 = v243;
              v212 = (unsigned __int16 *)(a1 + 48 * v243);
              v244 = v242 + 2;
              if (v244 < v10)
              {
                v245 = *(unsigned __int16 *)(a1 + 48 * v243 + 36);
                v246 = v212[42];
                if (v245 >= v246)
                {
                  if (v245 > v246)
                    goto LABEL_422;
                  v247 = *((unsigned __int8 *)v212 + 71);
                  v248 = (char)v247;
                  if ((v247 & 0x80u) != 0)
                    v247 = *((_QWORD *)v212 + 7);
                  v249 = *((unsigned __int8 *)v212 + 23);
                  v250 = (char)v249;
                  if ((v249 & 0x80u) != 0)
                    v249 = *((_QWORD *)v212 + 1);
                  if (v247 >= v249)
                    v251 = v249;
                  else
                    v251 = v247;
                  if (v251)
                  {
                    if (v250 >= 0)
                      v252 = v212;
                    else
                      v252 = *(unsigned __int16 **)v212;
                    if (v248 >= 0)
                      v253 = v212 + 24;
                    else
                      v253 = (unsigned __int16 *)*((_QWORD *)v212 + 6);
                    while (1)
                    {
                      v254 = *v252;
                      v255 = *v253;
                      if (v254 < v255)
                        break;
                      if (v255 < v254)
                        goto LABEL_422;
                      ++v252;
                      ++v253;
                      if (!--v251)
                        goto LABEL_421;
                    }
                  }
                  else
                  {
LABEL_421:
                    if (v249 >= v247)
                      goto LABEL_422;
                  }
                }
                v212 += 24;
                v211 = v244;
              }
LABEL_422:
              v256 = v212[18];
              if (v256 < WORD6(v378))
                break;
              v226 = v239;
              if (v256 <= WORD6(v378))
              {
                v257 = HIBYTE(v377);
                if (v377 < 0)
                  v257 = *((_QWORD *)&v376 + 1);
                v258 = *((unsigned __int8 *)v212 + 23);
                v259 = (char)v258;
                if ((v258 & 0x80u) != 0)
                  v258 = *((_QWORD *)v212 + 1);
                if (v257 >= v258)
                  v260 = v258;
                else
                  v260 = v257;
                if (v260)
                {
                  if (v259 >= 0)
                    v261 = v212;
                  else
                    v261 = *(unsigned __int16 **)v212;
                  v262 = (unsigned __int16 *)&v376;
                  if (v377 < 0)
                    v262 = (unsigned __int16 *)v376;
                  while (1)
                  {
                    v263 = *v261;
                    v264 = *v262;
                    if (v263 < v264)
                      goto LABEL_443;
                    if (v264 < v263)
                      break;
                    ++v261;
                    ++v262;
                    if (!--v260)
                      goto LABEL_440;
                  }
                  v226 = v239;
                }
                else
                {
LABEL_440:
                  v226 = v239;
                  if (v258 < v257)
                    break;
                }
              }
            }
LABEL_443:
            if (*((char *)v239 + 23) < 0)
              operator delete(*v239);
            v265 = v376;
            v239[2] = (unsigned __int16 *)v377;
            *(_OWORD *)v239 = v265;
            v266 = v378;
            v239[5] = (unsigned __int16 *)v379;
            *(_OWORD *)(v239 + 3) = v266;
LABEL_446:
            v209 = v210 - 1;
            if (!v210)
            {
              v267 = v9 / 0x30uLL;
              v268 = (void **)v372;
              while (1)
              {
                v269 = 0;
                v270 = *(_QWORD *)a1;
                v382[0] = *(_QWORD *)(a1 + 8);
                *(_QWORD *)((char *)v382 + 7) = *(_QWORD *)(a1 + 15);
                v271 = *(_BYTE *)(a1 + 23);
                *(_QWORD *)(a1 + 8) = 0;
                *(_QWORD *)(a1 + 16) = 0;
                *(_QWORD *)a1 = 0;
                v272 = *(_OWORD *)(a1 + 24);
                v381 = *(void **)(a1 + 40);
                v273 = a1;
                v380 = v272;
                do
                {
                  v274 = v269 + 1;
                  v275 = (void **)(v273 + 48 * (v269 + 1));
                  v276 = 2 * v269;
                  v269 = (2 * v269) | 1;
                  v277 = v276 + 2;
                  if (v277 >= v267)
                    goto LABEL_471;
                  v278 = *(unsigned __int16 *)(v273 + 48 * v274 + 36);
                  v279 = *((unsigned __int16 *)v275 + 42);
                  if (v278 < v279)
                    goto LABEL_451;
                  if (v278 <= v279)
                  {
                    v280 = *((unsigned __int8 *)v275 + 71);
                    v281 = (char)v280;
                    if ((v280 & 0x80u) != 0)
                      v280 = (unint64_t)v275[7];
                    v282 = *((unsigned __int8 *)v275 + 23);
                    v283 = (char)v282;
                    if ((v282 & 0x80u) != 0)
                      v282 = (unint64_t)v275[1];
                    if (v280 >= v282)
                      v284 = v282;
                    else
                      v284 = v280;
                    if (v284)
                    {
                      if (v283 >= 0)
                        v285 = (unsigned __int16 *)v275;
                      else
                        v285 = (unsigned __int16 *)*v275;
                      if (v281 >= 0)
                        v286 = (unsigned __int16 *)(v275 + 6);
                      else
                        v286 = (unsigned __int16 *)v275[6];
                      while (1)
                      {
                        v287 = *v285;
                        v288 = *v286;
                        if (v287 < v288)
                          break;
                        if (v288 < v287)
                          goto LABEL_471;
                        ++v285;
                        ++v286;
                        if (!--v284)
                          goto LABEL_470;
                      }
LABEL_451:
                      v275 += 6;
                      v269 = v277;
                      goto LABEL_471;
                    }
LABEL_470:
                    if (v282 < v280)
                      goto LABEL_451;
                  }
LABEL_471:
                  if (*(char *)(v273 + 23) < 0)
                    operator delete(*(void **)v273);
                  v289 = *(_OWORD *)v275;
                  *(_QWORD *)(v273 + 16) = v275[2];
                  *(_OWORD *)v273 = v289;
                  *((_BYTE *)v275 + 23) = 0;
                  *(_WORD *)v275 = 0;
                  v290 = *(_OWORD *)(v275 + 3);
                  *(_QWORD *)(v273 + 40) = v275[5];
                  *(_OWORD *)(v273 + 24) = v290;
                  v273 = (uint64_t)v275;
                }
                while (v269 <= (uint64_t)((unint64_t)(v267 - 2) >> 1));
                v291 = (__int128 *)(v275 + 3);
                v292 = *((char *)v275 + 23);
                v293 = v268 - 6;
                if (v275 == v268 - 6)
                {
                  if (v292 < 0)
                    operator delete(*v275);
                  *v275 = (void *)v270;
                  *(void **)((char *)v275 + 15) = *(void **)((char *)v382 + 7);
                  v275[1] = (void *)v382[0];
                  *((_BYTE *)v275 + 23) = v271;
                  v320 = v380;
                  v275[5] = v381;
                  *v291 = v320;
                  goto LABEL_514;
                }
                if (v292 < 0)
                  operator delete(*v275);
                v294 = *(_OWORD *)v293;
                v275[2] = *(v268 - 4);
                *(_OWORD *)v275 = v294;
                *((_BYTE *)v268 - 25) = 0;
                *((_WORD *)v268 - 24) = 0;
                v295 = *(_OWORD *)(v268 - 3);
                v275[5] = *(v268 - 1);
                *v291 = v295;
                if (*((char *)v268 - 25) < 0)
                  operator delete(*v293);
                v296 = v268 - 3;
                *(v268 - 6) = (void *)v270;
                v297 = (void *)v382[0];
                *(void **)((char *)v268 - 33) = *(void **)((char *)v382 + 7);
                *(v268 - 5) = v297;
                *((_BYTE *)v268 - 25) = v271;
                v298 = v380;
                v296[2] = v381;
                *(_OWORD *)v296 = v298;
                v299 = (uint64_t)v275 - a1 + 48;
                v268 -= 6;
                if (v299 >= 49)
                {
                  v300 = (v299 / 0x30uLL - 2) >> 1;
                  v301 = (unsigned __int16 **)(a1 + 48 * v300);
                  v302 = *((unsigned __int16 *)v301 + 18);
                  v303 = *((unsigned __int16 *)v275 + 18);
                  if (v302 < v303)
                    goto LABEL_481;
                  if (v302 <= v303)
                  {
                    v324 = *((unsigned __int8 *)v275 + 23);
                    v325 = (char)v324;
                    if ((v324 & 0x80u) != 0)
                      v324 = (unint64_t)v275[1];
                    v326 = (unsigned __int16 *)*((unsigned __int8 *)v301 + 23);
                    v327 = (char)v326;
                    if ((char)v326 < 0)
                      v326 = v301[1];
                    if (v324 >= (unint64_t)v326)
                      v328 = v326;
                    else
                      v328 = (unsigned __int16 *)v324;
                    if (v328)
                    {
                      if (v327 >= 0)
                        v329 = (unsigned __int16 *)(a1 + 48 * v300);
                      else
                        v329 = *v301;
                      if (v325 >= 0)
                        v330 = (unsigned __int16 *)v275;
                      else
                        v330 = (unsigned __int16 *)*v275;
                      while (1)
                      {
                        v331 = *v329;
                        v332 = *v330;
                        if (v331 < v332)
                          break;
                        if (v332 < v331)
                          goto LABEL_515;
                        ++v329;
                        ++v330;
                        v328 = (unsigned __int16 *)((char *)v328 - 1);
                        if (!v328)
                          goto LABEL_536;
                      }
LABEL_481:
                      v304 = *(_OWORD *)v275;
                      v377 = (uint64_t)v275[2];
                      v376 = v304;
                      v275[1] = 0;
                      v275[2] = 0;
                      *v275 = 0;
                      v305 = (uint64_t)v275[5];
                      v378 = *v291;
                      v379 = v305;
                      v306 = WORD6(v378);
                      if (v377 >= 0)
                        v307 = HIBYTE(v377);
                      else
                        v307 = *((_QWORD *)&v376 + 1);
                      if (v377 >= 0)
                        v308 = (unsigned __int16 *)&v376;
                      else
                        v308 = (unsigned __int16 *)v376;
                      while (1)
                      {
                        v309 = (unsigned __int16 *)v301;
                        if (*((char *)v275 + 23) < 0)
                          operator delete(*v275);
                        v310 = *(_OWORD *)v309;
                        v275[2] = (void *)*((_QWORD *)v309 + 2);
                        *(_OWORD *)v275 = v310;
                        *((_BYTE *)v309 + 23) = 0;
                        *v309 = 0;
                        v311 = *(_OWORD *)(v309 + 12);
                        v275[5] = (void *)*((_QWORD *)v309 + 5);
                        *(_OWORD *)(v275 + 3) = v311;
                        if (!v300)
                          break;
                        v300 = (v300 - 1) >> 1;
                        v301 = (unsigned __int16 **)(a1 + 48 * v300);
                        v312 = *((unsigned __int16 *)v301 + 18);
                        v275 = (void **)v309;
                        if (v312 >= v306)
                        {
                          if (v312 > v306)
                            break;
                          v313 = (unsigned __int16 *)*((unsigned __int8 *)v301 + 23);
                          v314 = (char)v313;
                          if ((char)v313 < 0)
                            v313 = v301[1];
                          if (v307 >= (unint64_t)v313)
                            v315 = v313;
                          else
                            v315 = (unsigned __int16 *)v307;
                          if (v315)
                          {
                            if (v314 >= 0)
                              v316 = (unsigned __int16 *)(a1 + 48 * v300);
                            else
                              v316 = *v301;
                            v317 = v308;
                            while (1)
                            {
                              v318 = *v316;
                              v319 = *v317;
                              if (v318 < v319)
                                break;
                              if (v319 < v318)
                                goto LABEL_511;
                              ++v316;
                              ++v317;
                              v315 = (unsigned __int16 *)((char *)v315 - 1);
                              if (!v315)
                                goto LABEL_505;
                            }
                            v275 = (void **)v309;
                          }
                          else
                          {
LABEL_505:
                            v275 = (void **)v309;
                            if ((unint64_t)v313 >= v307)
                              break;
                          }
                        }
                      }
LABEL_511:
                      if (*((char *)v309 + 23) < 0)
                        operator delete(*(void **)v309);
                      v321 = v376;
                      *((_QWORD *)v309 + 2) = v377;
                      *(_OWORD *)v309 = v321;
                      v322 = v378;
                      *((_QWORD *)v309 + 5) = v379;
                      *(_OWORD *)(v309 + 12) = v322;
LABEL_514:
                      v268 = v293;
                    }
                    else
                    {
LABEL_536:
                      if ((unint64_t)v326 < v324)
                        goto LABEL_481;
                    }
                  }
                }
LABEL_515:
                if (v267-- <= 2)
                  return;
              }
            }
          }
        }
        v11 = (unint64_t)v10 >> 1;
        v12 = a1 + 48 * ((unint64_t)v10 >> 1);
        if ((unint64_t)v9 < 0x1801)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((uint64_t *)v12, a1, (uint64_t)v375);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((uint64_t *)a1, v12, (uint64_t)v375);
          v13 = 3 * v11;
          v14 = a1 + 16 * v13;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((uint64_t *)(a1 + 48), v14 - 48, (uint64_t)(a2 - 48));
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((uint64_t *)(a1 + 96), a1 + 48 + 16 * v13, (uint64_t)(a2 - 72));
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((uint64_t *)(v14 - 48), v12, a1 + 48 + 16 * v13);
          v15 = *(_QWORD *)a1;
          v16 = *(_QWORD *)(a1 + 8);
          *(_QWORD *)((char *)&v380 + 7) = *(_QWORD *)(a1 + 15);
          *(_QWORD *)&v380 = v16;
          LOBYTE(v16) = *(_BYTE *)(a1 + 23);
          *(_QWORD *)(a1 + 8) = 0;
          *(_QWORD *)(a1 + 16) = 0;
          *(_QWORD *)a1 = 0;
          v377 = *(_QWORD *)(a1 + 40);
          v376 = *(_OWORD *)(a1 + 24);
          v17 = *(_OWORD *)v12;
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(v12 + 16);
          *(_OWORD *)a1 = v17;
          *(_BYTE *)(v12 + 23) = 0;
          v18 = *(_OWORD *)(v14 + 24);
          *(_QWORD *)(a1 + 40) = *(_QWORD *)(v14 + 40);
          *(_OWORD *)(a1 + 24) = v18;
          *(_QWORD *)v12 = v15;
          v19 = *(_QWORD *)((char *)&v380 + 7);
          *(_QWORD *)(v12 + 8) = v380;
          *(_QWORD *)(v12 + 15) = v19;
          *(_BYTE *)(v12 + 23) = v16;
          v20 = v376;
          *(_QWORD *)(v14 + 40) = v377;
          *(_OWORD *)(v14 + 24) = v20;
        }
        --a3;
        if ((a4 & 1) != 0)
          goto LABEL_29;
        v21 = (unsigned __int16 *)(a1 - 48);
        v22 = *(unsigned __int16 *)(a1 - 12);
        v23 = *(unsigned __int16 *)(a1 + 36);
        if (v22 < v23)
          goto LABEL_29;
        if (v22 > v23)
          goto LABEL_143;
        v24 = *(unsigned __int8 *)(a1 + 23);
        v25 = (char)v24;
        if ((v24 & 0x80u) != 0)
          v24 = *(_QWORD *)(a1 + 8);
        v26 = *(unsigned __int8 *)(a1 - 25);
        v27 = (char)v26;
        if ((v26 & 0x80u) != 0)
          v26 = *(_QWORD *)(a1 - 40);
        if (v24 >= v26)
          v28 = v26;
        else
          v28 = v24;
        if (!v28)
        {
LABEL_28:
          if (v26 < v24)
            goto LABEL_29;
LABEL_143:
          v97 = *(_OWORD *)a1;
          v377 = *(_QWORD *)(a1 + 16);
          v376 = v97;
          *(_QWORD *)(a1 + 8) = 0;
          *(_QWORD *)(a1 + 16) = 0;
          *(_QWORD *)a1 = 0;
          v98 = *(_OWORD *)(a1 + 24);
          *((_QWORD *)v7 + 2) = *(_QWORD *)(a1 + 40);
          *v7 = v98;
          v99 = WORD6(v378);
          v100 = *(a2 - 6);
          if (WORD6(v378) >= v100)
          {
            if (WORD6(v378) > v100)
              goto LABEL_185;
            v114 = *((unsigned __int8 *)a2 - 25);
            v115 = (char)v114;
            if ((v114 & 0x80u) != 0)
              v114 = *((_QWORD *)a2 - 5);
            v116 = HIBYTE(v377);
            if (v377 < 0)
              v116 = *((_QWORD *)&v376 + 1);
            if (v114 >= v116)
              v117 = v116;
            else
              v117 = v114;
            if (v117)
            {
              v118 = (unsigned __int16 *)&v376;
              if (v377 < 0)
                v118 = (unsigned __int16 *)v376;
              if (v115 >= 0)
                v119 = a2 - 24;
              else
                v119 = *(unsigned __int16 **)v375;
              while (1)
              {
                v120 = *v118;
                v121 = *v119;
                if (v120 < v121)
                  break;
                if (v121 < v120)
                  goto LABEL_185;
                ++v118;
                ++v119;
                if (!--v117)
                  goto LABEL_184;
              }
            }
            else
            {
LABEL_184:
              if (v116 >= v114)
              {
LABEL_185:
                v8 = (uint64_t *)(a1 + 48);
                if (a1 + 48 >= (unint64_t)a2)
                  goto LABEL_210;
                v122 = HIBYTE(v377);
                if (v377 < 0)
                  v122 = *((_QWORD *)&v376 + 1);
                v123 = (unsigned __int16 *)&v376;
                if (v377 < 0)
                  v123 = (unsigned __int16 *)v376;
                v104 = a1;
                while (1)
                {
                  v124 = v104;
                  v104 = (uint64_t)v8;
                  v125 = *(unsigned __int16 *)(v124 + 84);
                  if (WORD6(v378) < v125)
                    goto LABEL_209;
                  if (WORD6(v378) <= v125)
                  {
                    v126 = *(unsigned __int8 *)(v124 + 71);
                    v127 = (char)v126;
                    v128 = *(_QWORD *)(v124 + 56);
                    if ((v126 & 0x80u) == 0)
                      v128 = v126;
                    if (v128 >= v122)
                      v129 = v122;
                    else
                      v129 = v128;
                    if (v129)
                    {
                      if (v127 >= 0)
                        v130 = (unsigned __int16 *)v8;
                      else
                        v130 = (unsigned __int16 *)*v8;
                      v131 = v123;
                      while (1)
                      {
                        v132 = *v131;
                        v133 = *v130;
                        if (v132 < v133)
                          goto LABEL_209;
                        if (v133 < v132)
                          break;
                        ++v131;
                        ++v130;
                        if (!--v129)
                          goto LABEL_206;
                      }
                    }
                    else
                    {
LABEL_206:
                      if (v122 < v128)
                        goto LABEL_209;
                    }
                  }
                  v8 += 6;
                  if (v104 + 48 >= (unint64_t)a2)
                    goto LABEL_210;
                }
              }
            }
          }
          v8 = (uint64_t *)(a1 + 48);
          v101 = *(unsigned __int16 *)(a1 + 84);
          if (WORD6(v378) < v101)
            goto LABEL_210;
          v102 = HIBYTE(v377);
          if (v377 < 0)
            v102 = *((_QWORD *)&v376 + 1);
          v103 = (unsigned __int16 *)&v376;
          if (v377 < 0)
            v103 = (unsigned __int16 *)v376;
          v104 = a1;
          while (1)
          {
            v105 = v104;
            v104 = (uint64_t)v8;
            if (WORD6(v378) <= v101)
              break;
LABEL_165:
            v8 += 6;
            v101 = *(unsigned __int16 *)(v104 + 84);
            if (WORD6(v378) < v101)
              goto LABEL_210;
          }
          v106 = *(unsigned __int8 *)(v105 + 71);
          v107 = (char)v106;
          v108 = *(_QWORD *)(v105 + 56);
          if ((v106 & 0x80u) != 0)
            v106 = v108;
          if (v106 >= v102)
            v109 = v102;
          else
            v109 = v106;
          if (!v109)
          {
LABEL_164:
            if (v102 < v106)
              goto LABEL_209;
            goto LABEL_165;
          }
          if (v107 >= 0)
            v110 = (unsigned __int16 *)v8;
          else
            v110 = (unsigned __int16 *)*v8;
          v111 = v103;
          while (1)
          {
            v112 = *v111;
            v113 = *v110;
            if (v112 < v113)
              break;
            if (v113 < v112)
              goto LABEL_165;
            ++v111;
            ++v110;
            if (!--v109)
              goto LABEL_164;
          }
LABEL_209:
          v8 = (uint64_t *)v104;
LABEL_210:
          v134 = v7;
          v135 = (uint64_t *)a2;
          if (v8 < (uint64_t *)a2)
          {
            v136 = HIBYTE(v377);
            if (v377 < 0)
              v136 = *((_QWORD *)&v376 + 1);
            v137 = (unsigned __int16 *)&v376;
            if (v377 < 0)
              v137 = (unsigned __int16 *)v376;
            for (i = a2; ; i -= 24)
            {
              v135 = (uint64_t *)(i - 24);
              if (WORD6(v378) >= v100)
              {
                if (WORD6(v378) > v100)
                  break;
                v139 = *((unsigned __int8 *)i - 25);
                v140 = (char)v139;
                if ((v139 & 0x80u) != 0)
                  v139 = *((_QWORD *)i - 5);
                if (v139 >= v136)
                  v141 = v136;
                else
                  v141 = v139;
                if (v141)
                {
                  if (v140 >= 0)
                    v142 = i - 24;
                  else
                    v142 = (unsigned __int16 *)*v135;
                  v143 = v137;
                  while (1)
                  {
                    v144 = *v143;
                    v145 = *v142;
                    if (v144 < v145)
                      break;
                    if (v145 < v144)
                      goto LABEL_233;
                    ++v143;
                    ++v142;
                    if (!--v141)
                      goto LABEL_231;
                  }
                }
                else
                {
LABEL_231:
                  if (v136 >= v139)
                    break;
                }
              }
              v100 = *(i - 30);
            }
          }
LABEL_233:
          if (v8 >= v135)
            goto LABEL_275;
          if (v377 >= 0)
            v146 = HIBYTE(v377);
          else
            v146 = *((_QWORD *)&v376 + 1);
          if (v377 >= 0)
            v147 = (unsigned __int16 *)&v376;
          else
            v147 = (unsigned __int16 *)v376;
          while (2)
          {
            v148 = v8;
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>(v8, (uint64_t)v135);
            v8 += 6;
            while (2)
            {
              v149 = *((unsigned __int16 *)v148 + 42);
              if (v99 < v149)
                goto LABEL_258;
              v150 = v148;
              v148 = v8;
              if (v99 > v149)
                goto LABEL_257;
              v151 = *((unsigned __int8 *)v150 + 71);
              v152 = (char)v151;
              v153 = v150[7];
              if ((v151 & 0x80u) != 0)
                v151 = v153;
              if (v151 >= v146)
                v154 = v146;
              else
                v154 = v151;
              if (v154)
              {
                if (v152 >= 0)
                  v155 = (unsigned __int16 *)v8;
                else
                  v155 = (unsigned __int16 *)*v8;
                v156 = v147;
                do
                {
                  v157 = *v156;
                  v158 = *v155;
                  if (v157 < v158)
                    goto LABEL_258;
                  if (v158 < v157)
                    goto LABEL_257;
                  ++v156;
                  ++v155;
                }
                while (--v154);
              }
              if (v146 >= v151)
              {
LABEL_257:
                v8 += 6;
                continue;
              }
              break;
            }
            while (1)
            {
              do
              {
LABEL_258:
                v159 = v135;
                v135 -= 6;
                v160 = *((unsigned __int16 *)v159 - 6);
              }
              while (v99 < v160);
              if (v99 > v160)
                break;
              v161 = *((unsigned __int8 *)v159 - 25);
              v162 = (char)v161;
              v163 = *(v159 - 5);
              if ((v161 & 0x80u) == 0)
                v163 = v161;
              if (v163 >= v146)
                v164 = v146;
              else
                v164 = v163;
              if (v164)
              {
                if (v162 >= 0)
                  v165 = (unsigned __int16 *)v135;
                else
                  v165 = (unsigned __int16 *)*v135;
                v166 = v147;
                while (1)
                {
                  v167 = *v166;
                  v168 = *v165;
                  if (v167 < v168)
                    break;
                  if (v168 < v167)
                    goto LABEL_274;
                  ++v166;
                  ++v165;
                  if (!--v164)
                    goto LABEL_273;
                }
              }
              else
              {
LABEL_273:
                if (v146 >= v163)
                  break;
              }
            }
LABEL_274:
            if (v8 < v135)
              continue;
            break;
          }
LABEL_275:
          v169 = (void **)(v8 - 6);
          v7 = v134;
          if (v8 - 6 != (uint64_t *)a1)
          {
            if (*(char *)(a1 + 23) < 0)
              operator delete(*(void **)a1);
            v170 = *(_OWORD *)v169;
            *(_QWORD *)(a1 + 16) = *(v8 - 4);
            *(_OWORD *)a1 = v170;
            *((_BYTE *)v8 - 25) = 0;
            *((_WORD *)v8 - 24) = 0;
            v171 = *(_OWORD *)(v8 - 3);
            *(_QWORD *)(a1 + 40) = *(v8 - 1);
            *(_OWORD *)(a1 + 24) = v171;
          }
          if (*((char *)v8 - 25) < 0)
            operator delete(*v169);
          a4 = 0;
          v172 = v376;
          *(v8 - 4) = v377;
          *(_OWORD *)v169 = v172;
          v173 = *v134;
          *(v8 - 1) = *((_QWORD *)v134 + 2);
          *(_OWORD *)(v8 - 3) = v173;
          continue;
        }
        if (v27 < 0)
          v21 = *(unsigned __int16 **)(a1 - 48);
        if (v25 >= 0)
          v29 = (unsigned __int16 *)a1;
        else
          v29 = *(unsigned __int16 **)a1;
        while (1)
        {
          v30 = *v21;
          v31 = *v29;
          if (v30 < v31)
            break;
          if (v31 < v30)
            goto LABEL_143;
          ++v21;
          ++v29;
          if (!--v28)
            goto LABEL_28;
        }
LABEL_29:
        v374 = a3;
        v32 = *(_OWORD *)a1;
        v377 = *(_QWORD *)(a1 + 16);
        v376 = v32;
        *(_QWORD *)(a1 + 8) = 0;
        *(_QWORD *)(a1 + 16) = 0;
        *(_QWORD *)a1 = 0;
        v33 = *(_QWORD *)(a1 + 40);
        *v7 = *(_OWORD *)(a1 + 24);
        *((_QWORD *)v7 + 2) = v33;
        v34 = WORD6(v378);
        if (v377 >= 0)
          v35 = HIBYTE(v377);
        else
          v35 = *((_QWORD *)&v376 + 1);
        if (v377 >= 0)
          v36 = (unsigned __int16 *)&v376;
        else
          v36 = (unsigned __int16 *)v376;
        v37 = (uint64_t *)a1;
        while (1)
        {
          do
          {
            v38 = v37;
            v37 += 6;
            v39 = *((unsigned __int16 *)v38 + 42);
          }
          while (v39 < WORD6(v378));
          if (v39 > WORD6(v378))
            break;
          v40 = *((unsigned __int8 *)v38 + 71);
          v41 = (char)v40;
          if ((v40 & 0x80u) != 0)
            v40 = v38[7];
          if (v35 >= v40)
            v42 = v40;
          else
            v42 = v35;
          if (v42)
          {
            if (v41 >= 0)
              v43 = (unsigned __int16 *)v37;
            else
              v43 = (unsigned __int16 *)*v37;
            v44 = v36;
            while (1)
            {
              v45 = *v43;
              v46 = *v44;
              if (v45 < v46)
                break;
              if (v46 < v45)
                goto LABEL_52;
              ++v43;
              ++v44;
              if (!--v42)
                goto LABEL_51;
            }
          }
          else
          {
LABEL_51:
            if (v40 >= v35)
              break;
          }
        }
LABEL_52:
        if (v38 != (uint64_t *)a1)
        {
          v47 = *(a2 - 6);
          v48 = a2 - 24;
          v49 = a2;
          while (v47 >= WORD6(v378))
          {
            v50 = v49;
            v49 = v48;
            if (v47 <= WORD6(v378))
            {
              v51 = *((unsigned __int8 *)v50 - 25);
              v52 = (char)v51;
              v53 = *((_QWORD *)v50 - 5);
              if ((v51 & 0x80u) != 0)
                v51 = v53;
              if (v35 >= v51)
                v54 = v51;
              else
                v54 = v35;
              if (v54)
              {
                if (v52 >= 0)
                  v55 = v48;
                else
                  v55 = *(unsigned __int16 **)v48;
                v56 = v36;
                do
                {
                  v57 = *v55;
                  v58 = *v56;
                  if (v57 < v58)
                    goto LABEL_96;
                  if (v58 < v57)
                    goto LABEL_70;
                  ++v55;
                  ++v56;
                }
                while (--v54);
              }
              if (v51 < v35)
                goto LABEL_96;
            }
LABEL_70:
            v48 -= 24;
            v47 = *(v49 - 6);
          }
          goto LABEL_97;
        }
        v48 = a2;
        if (v37 >= (uint64_t *)a2)
          goto LABEL_97;
        v59 = *(a2 - 6);
        v48 = a2 - 24;
        if (v59 < WORD6(v378))
          goto LABEL_97;
        v48 = a2 - 24;
        v60 = a2;
        while (2)
        {
          v49 = v48;
          if (v59 > WORD6(v378))
          {
LABEL_75:
            if (v37 >= (uint64_t *)v48)
              goto LABEL_96;
LABEL_94:
            v48 -= 24;
            v59 = *(v49 - 6);
            v60 = v49;
            if (v59 < WORD6(v378))
              goto LABEL_97;
            continue;
          }
          break;
        }
        v61 = *((unsigned __int8 *)v60 - 25);
        v62 = (char)v61;
        v63 = *((_QWORD *)v60 - 5);
        if ((v61 & 0x80u) != 0)
          v61 = v63;
        if (v35 >= v61)
          v64 = v61;
        else
          v64 = v35;
        if (!v64)
        {
LABEL_90:
          if (v61 < v35 || v37 >= (uint64_t *)v48)
            goto LABEL_96;
          goto LABEL_94;
        }
        if (v62 >= 0)
          v65 = v48;
        else
          v65 = *(unsigned __int16 **)v48;
        v66 = v36;
        while (1)
        {
          v67 = *v65;
          v68 = *v66;
          if (v67 < v68)
            break;
          if (v68 < v67)
            goto LABEL_75;
          ++v65;
          ++v66;
          if (!--v64)
            goto LABEL_90;
        }
LABEL_96:
        v48 = v49;
LABEL_97:
        v8 = v37;
        if (v37 < (uint64_t *)v48)
        {
          v70 = v48;
          do
          {
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>(v8, (uint64_t)v70);
            while (1)
            {
              do
              {
                v71 = v8;
                v8 += 6;
                v72 = *((unsigned __int16 *)v71 + 42);
              }
              while (v72 < v34);
              if (v72 > v34)
                break;
              v73 = *((unsigned __int8 *)v71 + 71);
              v74 = (char)v73;
              v75 = v71[7];
              if ((v73 & 0x80u) == 0)
                v75 = v73;
              if (v35 >= v75)
                v76 = v75;
              else
                v76 = v35;
              if (v76)
              {
                if (v74 >= 0)
                  v77 = (unsigned __int16 *)v8;
                else
                  v77 = (unsigned __int16 *)*v8;
                v78 = v36;
                while (1)
                {
                  v79 = *v77;
                  v80 = *v78;
                  if (v79 < v80)
                    break;
                  if (v80 < v79)
                    goto LABEL_116;
                  ++v77;
                  ++v78;
                  if (!--v76)
                    goto LABEL_115;
                }
              }
              else
              {
LABEL_115:
                if (v75 >= v35)
                  break;
              }
            }
LABEL_116:
            while (1)
            {
              v81 = v70 - 6;
              v82 = *((unsigned __int16 *)v70 - 6);
              if (v82 < v34)
                break;
              v83 = v70;
              v70 -= 6;
              if (v82 <= v34)
              {
                v84 = *((unsigned __int8 *)v83 - 25);
                v85 = (char)v84;
                if ((v84 & 0x80u) != 0)
                  v84 = *(v83 - 5);
                if (v35 >= v84)
                  v86 = v84;
                else
                  v86 = v35;
                if (v86)
                {
                  v87 = (unsigned __int16 *)*v70;
                  if (v85 >= 0)
                    v87 = (unsigned __int16 *)v70;
                  v88 = v36;
                  while (1)
                  {
                    v89 = *v87;
                    v90 = *v88;
                    if (v89 < v90)
                      break;
                    if (v90 < v89)
                      goto LABEL_116;
                    ++v87;
                    ++v88;
                    if (!--v86)
                      goto LABEL_130;
                  }
LABEL_131:
                  v81 = v70;
                  break;
                }
LABEL_130:
                if (v84 < v35)
                  goto LABEL_131;
              }
            }
            v70 = v81;
          }
          while (v8 < v81);
        }
        v91 = (void **)(v8 - 6);
        a3 = v374;
        v7 = &v378;
        if (v8 - 6 != (uint64_t *)a1)
        {
          if (*(char *)(a1 + 23) < 0)
            operator delete(*(void **)a1);
          v92 = *(_OWORD *)v91;
          *(_QWORD *)(a1 + 16) = *(v8 - 4);
          *(_OWORD *)a1 = v92;
          *((_BYTE *)v8 - 25) = 0;
          *((_WORD *)v8 - 24) = 0;
          v93 = *(_OWORD *)(v8 - 3);
          *(_QWORD *)(a1 + 40) = *(v8 - 1);
          *(_OWORD *)(a1 + 24) = v93;
        }
        if (*((char *)v8 - 25) < 0)
          operator delete(*v91);
        v94 = v376;
        *(v8 - 4) = v377;
        *(_OWORD *)v91 = v94;
        v95 = v378;
        *(v8 - 1) = v379;
        *(_OWORD *)(v8 - 3) = v95;
        if (v37 < (uint64_t *)v48)
        {
LABEL_142:
          std::__introsort<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *,false>(a1, v8 - 6, v374, a4 & 1);
          a4 = 0;
          continue;
        }
        v96 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((unsigned __int16 *)a1, (unsigned __int16 *)v8 - 24);
        if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((unsigned __int16 *)v8, a2))
        {
          if (v96)
            continue;
          goto LABEL_142;
        }
        a2 = (unsigned __int16 *)(v8 - 6);
        if (!v96)
          goto LABEL_2;
        return;
    }
  }
}

void std::vector<skit::Token>::resize(uint64_t *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD v17[5];

  v4 = *a1;
  v5 = a1[1];
  v6 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 4);
  v7 = a2 - v6;
  if (a2 <= v6)
  {
    if (a2 < v6)
    {
      v15 = v4 + 48 * a2;
      while (v5 != v15)
      {
        if (*(char *)(v5 - 25) < 0)
          operator delete(*(void **)(v5 - 48));
        v5 -= 48;
      }
      a1[1] = v15;
    }
  }
  else
  {
    v8 = a1[2];
    if (0xAAAAAAAAAAAAAAABLL * ((v8 - v5) >> 4) >= v7)
    {
      v16 = v5 + 48 * v7;
      do
      {
        *(_OWORD *)(v5 + 16) = 0uLL;
        *(_OWORD *)(v5 + 32) = 0uLL;
        *(_OWORD *)v5 = 0uLL;
        *(_DWORD *)(v5 + 32) = 1065353216;
        *(_DWORD *)(v5 + 38) = 196609;
        v5 += 48;
      }
      while (v5 != v16);
      a1[1] = v16;
    }
    else
    {
      if (a2 > 0x555555555555555)
        std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
      v17[4] = a1 + 2;
      v9 = 0xAAAAAAAAAAAAAAABLL * ((v8 - v4) >> 4);
      v10 = 2 * v9;
      if (2 * v9 <= a2)
        v10 = a2;
      if (v9 >= 0x2AAAAAAAAAAAAAALL)
        v11 = 0x555555555555555;
      else
        v11 = v10;
      v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::Token>>(v11);
      v13 = &v12[48 * v6];
      v17[0] = v12;
      v17[1] = v13;
      v17[3] = &v12[48 * v14];
      do
      {
        *((_OWORD *)v13 + 1) = 0uLL;
        *((_OWORD *)v13 + 2) = 0uLL;
        *(_OWORD *)v13 = 0uLL;
        *((_DWORD *)v13 + 8) = 1065353216;
        *(_DWORD *)(v13 + 38) = 196609;
        v13 += 48;
      }
      while (v13 != &v12[48 * a2]);
      v17[2] = &v12[48 * a2];
      std::vector<skit::Token>::__swap_out_circular_buffer(a1, v17);
      std::__split_buffer<skit::Token>::~__split_buffer((uint64_t)v17);
    }
  }
}

uint64_t *std::vector<skit::Token>::__swap_out_circular_buffer(uint64_t *result, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *result;
  v3 = result[1];
  v4 = a2[1];
  if (v3 == *result)
  {
    v5 = a2[1];
  }
  else
  {
    do
    {
      v5 = v4 - 48;
      v6 = *(_OWORD *)(v3 - 48);
      *(_QWORD *)(v4 - 32) = *(_QWORD *)(v3 - 32);
      *(_OWORD *)(v4 - 48) = v6;
      *(_QWORD *)(v3 - 40) = 0;
      *(_QWORD *)(v3 - 32) = 0;
      *(_QWORD *)(v3 - 48) = 0;
      v7 = *(_OWORD *)(v3 - 24);
      *(_QWORD *)(v4 - 8) = *(_QWORD *)(v3 - 8);
      *(_OWORD *)(v4 - 24) = v7;
      v4 -= 48;
      v3 -= 48;
    }
    while (v3 != v2);
  }
  a2[1] = v5;
  v8 = *result;
  *result = v5;
  a2[1] = v8;
  v9 = result[1];
  result[1] = a2[2];
  a2[2] = v9;
  v10 = result[2];
  result[2] = a2[3];
  a2[3] = v10;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<skit::Token>::~__split_buffer(uint64_t a1)
{
  void **v2;
  void **v3;
  void **v4;

  v3 = *(void ***)(a1 + 8);
  v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      v4 = v2 - 6;
      *(_QWORD *)(a1 + 16) = v2 - 6;
      if (*((char *)v2 - 25) < 0)
      {
        operator delete(*v4);
        v4 = *(void ***)(a1 + 16);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

__n128 std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  __n128 *v6;
  uint64_t v7;
  __n128 result;
  __n128 v9;
  unint64_t v10;
  _BYTE v11[15];

  v3 = *a1;
  *(_QWORD *)v11 = a1[1];
  *(_QWORD *)&v11[7] = *(uint64_t *)((char *)a1 + 15);
  v4 = *((_BYTE *)a1 + 23);
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  v9 = *(__n128 *)(a1 + 3);
  v10 = a1[5];
  v5 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v5;
  *(_BYTE *)(a2 + 23) = 0;
  *(_WORD *)a2 = 0;
  v6 = (__n128 *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 24);
  a1[5] = v7;
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
  *(_QWORD *)a2 = v3;
  *(_QWORD *)(a2 + 8) = *(_QWORD *)v11;
  *(_QWORD *)(a2 + 15) = *(_QWORD *)&v11[7];
  *(_BYTE *)(a2 + 23) = v4;
  result = v9;
  *v6 = v9;
  v6[1].n128_u64[0] = v10;
  return result;
}

void std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  unsigned __int16 *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  unsigned __int16 *v14;
  unsigned __int16 *v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  unint64_t v22;
  int v23;
  unint64_t v24;
  int v25;
  unint64_t v26;
  unsigned __int16 *v27;
  unsigned __int16 *v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unint64_t v33;
  int v34;
  unint64_t v35;
  int v36;
  unint64_t v37;
  unsigned __int16 *v38;
  unsigned __int16 *v39;
  unsigned int v40;
  unsigned int v41;
  unint64_t v42;
  int v43;
  unint64_t v44;
  int v45;
  unint64_t v46;
  unsigned __int16 *v47;
  unsigned __int16 *v48;
  unsigned int v49;
  unsigned int v50;
  unint64_t v51;
  int v52;
  unint64_t v53;
  int v54;
  unint64_t v55;
  unsigned __int16 *v56;
  unsigned __int16 *v57;
  unsigned int v58;
  unsigned int v59;

  v5 = (unsigned __int16 *)a1;
  v6 = *(unsigned __int16 *)(a2 + 36);
  v7 = *((unsigned __int16 *)a1 + 18);
  if (v6 < v7)
    goto LABEL_2;
  if (v6 > v7)
  {
LABEL_23:
    v18 = *(unsigned __int16 *)(a3 + 36);
    if (v18 >= v6)
    {
      if (v18 > v6)
        return;
      v33 = *(unsigned __int8 *)(a2 + 23);
      v34 = (char)v33;
      if ((v33 & 0x80u) != 0)
        v33 = *(_QWORD *)(a2 + 8);
      v35 = *(unsigned __int8 *)(a3 + 23);
      v36 = (char)v35;
      if ((v35 & 0x80u) != 0)
        v35 = *(_QWORD *)(a3 + 8);
      if (v33 >= v35)
        v37 = v35;
      else
        v37 = v33;
      if (v37)
      {
        if (v36 >= 0)
          v38 = (unsigned __int16 *)a3;
        else
          v38 = *(unsigned __int16 **)a3;
        if (v34 >= 0)
          v39 = (unsigned __int16 *)a2;
        else
          v39 = *(unsigned __int16 **)a2;
        while (1)
        {
          v40 = *v38;
          v41 = *v39;
          if (v40 < v41)
            break;
          if (v41 < v40)
            return;
          ++v38;
          ++v39;
          if (!--v37)
            goto LABEL_67;
        }
      }
      else
      {
LABEL_67:
        if (v35 >= v33)
          return;
      }
    }
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a2, a3);
    v19 = *(unsigned __int16 *)(a2 + 36);
    v20 = v5[18];
    if (v19 >= v20)
    {
      if (v19 > v20)
        return;
      v42 = *((unsigned __int8 *)v5 + 23);
      v43 = (char)v42;
      if ((v42 & 0x80u) != 0)
        v42 = *((_QWORD *)v5 + 1);
      v44 = *(unsigned __int8 *)(a2 + 23);
      v45 = (char)v44;
      if ((v44 & 0x80u) != 0)
        v44 = *(_QWORD *)(a2 + 8);
      if (v42 >= v44)
        v46 = v44;
      else
        v46 = v42;
      if (v46)
      {
        if (v45 >= 0)
          v47 = (unsigned __int16 *)a2;
        else
          v47 = *(unsigned __int16 **)a2;
        if (v43 >= 0)
          v48 = v5;
        else
          v48 = *(unsigned __int16 **)v5;
        while (1)
        {
          v49 = *v47;
          v50 = *v48;
          if (v49 < v50)
            break;
          if (v50 < v49)
            return;
          ++v47;
          ++v48;
          if (!--v46)
            goto LABEL_87;
        }
      }
      else
      {
LABEL_87:
        if (v44 >= v42)
          return;
      }
    }
    a1 = (uint64_t *)v5;
    v21 = a2;
LABEL_48:
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>(a1, v21);
    return;
  }
  v9 = *((unsigned __int8 *)a1 + 23);
  v10 = (char)v9;
  if ((v9 & 0x80u) != 0)
    v9 = a1[1];
  v11 = *(unsigned __int8 *)(a2 + 23);
  v12 = (char)v11;
  if ((v11 & 0x80u) != 0)
    v11 = *(_QWORD *)(a2 + 8);
  if (v9 >= v11)
    v13 = v11;
  else
    v13 = v9;
  if (!v13)
  {
LABEL_22:
    if (v11 < v9)
      goto LABEL_2;
    goto LABEL_23;
  }
  if (v12 >= 0)
    v14 = (unsigned __int16 *)a2;
  else
    v14 = *(unsigned __int16 **)a2;
  if (v10 >= 0)
    v15 = (unsigned __int16 *)a1;
  else
    v15 = (unsigned __int16 *)*a1;
  while (1)
  {
    v16 = *v14;
    v17 = *v15;
    if (v16 < v17)
      break;
    if (v17 < v16)
      goto LABEL_23;
    ++v14;
    ++v15;
    if (!--v13)
      goto LABEL_22;
  }
LABEL_2:
  v8 = *(unsigned __int16 *)(a3 + 36);
  if (v8 < v6)
    goto LABEL_47;
  if (v8 <= v6)
  {
    v22 = *(unsigned __int8 *)(a2 + 23);
    v23 = (char)v22;
    if ((v22 & 0x80u) != 0)
      v22 = *(_QWORD *)(a2 + 8);
    v24 = *(unsigned __int8 *)(a3 + 23);
    v25 = (char)v24;
    if ((v24 & 0x80u) != 0)
      v24 = *(_QWORD *)(a3 + 8);
    if (v22 >= v24)
      v26 = v24;
    else
      v26 = v22;
    if (v26)
    {
      if (v25 >= 0)
        v27 = (unsigned __int16 *)a3;
      else
        v27 = *(unsigned __int16 **)a3;
      if (v23 >= 0)
        v28 = (unsigned __int16 *)a2;
      else
        v28 = *(unsigned __int16 **)a2;
      do
      {
        v29 = *v27;
        v30 = *v28;
        if (v29 < v30)
          goto LABEL_47;
        if (v30 < v29)
          goto LABEL_45;
        ++v27;
        ++v28;
      }
      while (--v26);
    }
    if (v24 < v22)
    {
LABEL_47:
      v21 = a3;
      goto LABEL_48;
    }
  }
LABEL_45:
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>(a1, a2);
  v31 = *(unsigned __int16 *)(a3 + 36);
  v32 = *(unsigned __int16 *)(a2 + 36);
  if (v31 < v32)
    goto LABEL_46;
  if (v31 <= v32)
  {
    v51 = *(unsigned __int8 *)(a2 + 23);
    v52 = (char)v51;
    if ((v51 & 0x80u) != 0)
      v51 = *(_QWORD *)(a2 + 8);
    v53 = *(unsigned __int8 *)(a3 + 23);
    v54 = (char)v53;
    if ((v53 & 0x80u) != 0)
      v53 = *(_QWORD *)(a3 + 8);
    if (v51 >= v53)
      v55 = v53;
    else
      v55 = v51;
    if (v55)
    {
      if (v54 >= 0)
        v56 = (unsigned __int16 *)a3;
      else
        v56 = *(unsigned __int16 **)a3;
      if (v52 >= 0)
        v57 = (unsigned __int16 *)a2;
      else
        v57 = *(unsigned __int16 **)a2;
      do
      {
        v58 = *v56;
        v59 = *v57;
        if (v58 < v59)
          goto LABEL_46;
        if (v59 < v58)
          return;
        ++v56;
        ++v57;
      }
      while (--v55);
    }
    if (v53 < v51)
    {
LABEL_46:
      a1 = (uint64_t *)a2;
      goto LABEL_47;
    }
  }
}

void std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unint64_t v14;
  int v15;
  unint64_t v16;
  int v17;
  unint64_t v18;
  unsigned __int16 *v19;
  unsigned __int16 *v20;
  unsigned int v21;
  unsigned int v22;
  unint64_t v23;
  int v24;
  unint64_t v25;
  int v26;
  unint64_t v27;
  unsigned __int16 *v28;
  unsigned __int16 *v29;
  unsigned int v30;
  unsigned int v31;
  unint64_t v32;
  int v33;
  unint64_t v34;
  int v35;
  unint64_t v36;
  unsigned __int16 *v37;
  unsigned __int16 *v38;
  unsigned int v39;
  unsigned int v40;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>(a1, a2, a3);
  v8 = *(unsigned __int16 *)(a4 + 36);
  v9 = *(unsigned __int16 *)(a3 + 36);
  if (v8 >= v9)
  {
    if (v8 > v9)
      return;
    v14 = *(unsigned __int8 *)(a3 + 23);
    v15 = (char)v14;
    if ((v14 & 0x80u) != 0)
      v14 = *(_QWORD *)(a3 + 8);
    v16 = *(unsigned __int8 *)(a4 + 23);
    v17 = (char)v16;
    if ((v16 & 0x80u) != 0)
      v16 = *(_QWORD *)(a4 + 8);
    if (v14 >= v16)
      v18 = v16;
    else
      v18 = v14;
    if (v18)
    {
      if (v17 >= 0)
        v19 = (unsigned __int16 *)a4;
      else
        v19 = *(unsigned __int16 **)a4;
      if (v15 >= 0)
        v20 = (unsigned __int16 *)a3;
      else
        v20 = *(unsigned __int16 **)a3;
      while (1)
      {
        v21 = *v19;
        v22 = *v20;
        if (v21 < v22)
          break;
        if (v22 < v21)
          return;
        ++v19;
        ++v20;
        if (!--v18)
          goto LABEL_23;
      }
    }
    else
    {
LABEL_23:
      if (v16 >= v14)
        return;
    }
  }
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a3, a4);
  v10 = *(unsigned __int16 *)(a3 + 36);
  v11 = *(unsigned __int16 *)(a2 + 36);
  if (v10 >= v11)
  {
    if (v10 > v11)
      return;
    v23 = *(unsigned __int8 *)(a2 + 23);
    v24 = (char)v23;
    if ((v23 & 0x80u) != 0)
      v23 = *(_QWORD *)(a2 + 8);
    v25 = *(unsigned __int8 *)(a3 + 23);
    v26 = (char)v25;
    if ((v25 & 0x80u) != 0)
      v25 = *(_QWORD *)(a3 + 8);
    if (v23 >= v25)
      v27 = v25;
    else
      v27 = v23;
    if (v27)
    {
      if (v26 >= 0)
        v28 = (unsigned __int16 *)a3;
      else
        v28 = *(unsigned __int16 **)a3;
      if (v24 >= 0)
        v29 = (unsigned __int16 *)a2;
      else
        v29 = *(unsigned __int16 **)a2;
      while (1)
      {
        v30 = *v28;
        v31 = *v29;
        if (v30 < v31)
          break;
        if (v31 < v30)
          return;
        ++v28;
        ++v29;
        if (!--v27)
          goto LABEL_43;
      }
    }
    else
    {
LABEL_43:
      if (v25 >= v23)
        return;
    }
  }
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a2, a3);
  v12 = *(unsigned __int16 *)(a2 + 36);
  v13 = *((unsigned __int16 *)a1 + 18);
  if (v12 < v13)
    goto LABEL_4;
  if (v12 <= v13)
  {
    v32 = *((unsigned __int8 *)a1 + 23);
    v33 = (char)v32;
    if ((v32 & 0x80u) != 0)
      v32 = a1[1];
    v34 = *(unsigned __int8 *)(a2 + 23);
    v35 = (char)v34;
    if ((v34 & 0x80u) != 0)
      v34 = *(_QWORD *)(a2 + 8);
    if (v32 >= v34)
      v36 = v34;
    else
      v36 = v32;
    if (v36)
    {
      if (v35 >= 0)
        v37 = (unsigned __int16 *)a2;
      else
        v37 = *(unsigned __int16 **)a2;
      if (v33 >= 0)
        v38 = (unsigned __int16 *)a1;
      else
        v38 = (unsigned __int16 *)*a1;
      do
      {
        v39 = *v37;
        v40 = *v38;
        if (v39 < v40)
          goto LABEL_4;
        if (v40 < v39)
          return;
        ++v37;
        ++v38;
      }
      while (--v36);
    }
    if (v34 < v32)
LABEL_4:
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>(a1, a2);
  }
}

void std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *,0>(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unint64_t v18;
  int v19;
  unint64_t v20;
  int v21;
  unint64_t v22;
  unsigned __int16 *v23;
  unsigned __int16 *v24;
  unsigned int v25;
  unsigned int v26;
  unint64_t v27;
  int v28;
  unint64_t v29;
  int v30;
  unint64_t v31;
  unsigned __int16 *v32;
  unsigned __int16 *v33;
  unsigned int v34;
  unsigned int v35;
  unint64_t v36;
  int v37;
  unint64_t v38;
  int v39;
  unint64_t v40;
  unsigned __int16 *v41;
  unsigned __int16 *v42;
  unsigned int v43;
  unsigned int v44;
  unint64_t v45;
  int v46;
  unint64_t v47;
  int v48;
  unint64_t v49;
  unsigned __int16 *v50;
  unsigned __int16 *v51;
  unsigned int v52;
  unsigned int v53;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>(a1, a2, a3, a4);
  v10 = *(unsigned __int16 *)(a5 + 36);
  v11 = *(unsigned __int16 *)(a4 + 36);
  if (v10 >= v11)
  {
    if (v10 > v11)
      return;
    v18 = *(unsigned __int8 *)(a4 + 23);
    v19 = (char)v18;
    if ((v18 & 0x80u) != 0)
      v18 = *(_QWORD *)(a4 + 8);
    v20 = *(unsigned __int8 *)(a5 + 23);
    v21 = (char)v20;
    if ((v20 & 0x80u) != 0)
      v20 = *(_QWORD *)(a5 + 8);
    if (v18 >= v20)
      v22 = v20;
    else
      v22 = v18;
    if (v22)
    {
      if (v21 >= 0)
        v23 = (unsigned __int16 *)a5;
      else
        v23 = *(unsigned __int16 **)a5;
      if (v19 >= 0)
        v24 = (unsigned __int16 *)a4;
      else
        v24 = *(unsigned __int16 **)a4;
      while (1)
      {
        v25 = *v23;
        v26 = *v24;
        if (v25 < v26)
          break;
        if (v26 < v25)
          return;
        ++v23;
        ++v24;
        if (!--v22)
          goto LABEL_24;
      }
    }
    else
    {
LABEL_24:
      if (v20 >= v18)
        return;
    }
  }
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a4, a5);
  v12 = *(unsigned __int16 *)(a4 + 36);
  v13 = *(unsigned __int16 *)(a3 + 36);
  if (v12 >= v13)
  {
    if (v12 > v13)
      return;
    v27 = *(unsigned __int8 *)(a3 + 23);
    v28 = (char)v27;
    if ((v27 & 0x80u) != 0)
      v27 = *(_QWORD *)(a3 + 8);
    v29 = *(unsigned __int8 *)(a4 + 23);
    v30 = (char)v29;
    if ((v29 & 0x80u) != 0)
      v29 = *(_QWORD *)(a4 + 8);
    if (v27 >= v29)
      v31 = v29;
    else
      v31 = v27;
    if (v31)
    {
      if (v30 >= 0)
        v32 = (unsigned __int16 *)a4;
      else
        v32 = *(unsigned __int16 **)a4;
      if (v28 >= 0)
        v33 = (unsigned __int16 *)a3;
      else
        v33 = *(unsigned __int16 **)a3;
      while (1)
      {
        v34 = *v32;
        v35 = *v33;
        if (v34 < v35)
          break;
        if (v35 < v34)
          return;
        ++v32;
        ++v33;
        if (!--v31)
          goto LABEL_44;
      }
    }
    else
    {
LABEL_44:
      if (v29 >= v27)
        return;
    }
  }
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a3, a4);
  v14 = *(unsigned __int16 *)(a3 + 36);
  v15 = *(unsigned __int16 *)(a2 + 36);
  if (v14 >= v15)
  {
    if (v14 > v15)
      return;
    v36 = *(unsigned __int8 *)(a2 + 23);
    v37 = (char)v36;
    if ((v36 & 0x80u) != 0)
      v36 = *(_QWORD *)(a2 + 8);
    v38 = *(unsigned __int8 *)(a3 + 23);
    v39 = (char)v38;
    if ((v38 & 0x80u) != 0)
      v38 = *(_QWORD *)(a3 + 8);
    if (v36 >= v38)
      v40 = v38;
    else
      v40 = v36;
    if (v40)
    {
      if (v39 >= 0)
        v41 = (unsigned __int16 *)a3;
      else
        v41 = *(unsigned __int16 **)a3;
      if (v37 >= 0)
        v42 = (unsigned __int16 *)a2;
      else
        v42 = *(unsigned __int16 **)a2;
      while (1)
      {
        v43 = *v41;
        v44 = *v42;
        if (v43 < v44)
          break;
        if (v44 < v43)
          return;
        ++v41;
        ++v42;
        if (!--v40)
          goto LABEL_64;
      }
    }
    else
    {
LABEL_64:
      if (v38 >= v36)
        return;
    }
  }
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a2, a3);
  v16 = *(unsigned __int16 *)(a2 + 36);
  v17 = *((unsigned __int16 *)a1 + 18);
  if (v16 < v17)
    goto LABEL_5;
  if (v16 <= v17)
  {
    v45 = *((unsigned __int8 *)a1 + 23);
    v46 = (char)v45;
    if ((v45 & 0x80u) != 0)
      v45 = a1[1];
    v47 = *(unsigned __int8 *)(a2 + 23);
    v48 = (char)v47;
    if ((v47 & 0x80u) != 0)
      v47 = *(_QWORD *)(a2 + 8);
    if (v45 >= v47)
      v49 = v47;
    else
      v49 = v45;
    if (v49)
    {
      if (v48 >= 0)
        v50 = (unsigned __int16 *)a2;
      else
        v50 = *(unsigned __int16 **)a2;
      if (v46 >= 0)
        v51 = (unsigned __int16 *)a1;
      else
        v51 = (unsigned __int16 *)*a1;
      do
      {
        v52 = *v50;
        v53 = *v51;
        if (v52 < v53)
          goto LABEL_5;
        if (v53 < v52)
          return;
        ++v50;
        ++v51;
      }
      while (--v49);
    }
    if (v47 < v45)
LABEL_5:
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>(a1, a2);
  }
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>(unsigned __int16 *a1, unsigned __int16 *a2)
{
  unint64_t v4;
  _BOOL8 result;
  unsigned __int16 **v6;
  unsigned int v7;
  unsigned int v8;
  unsigned __int16 *v9;
  unsigned __int16 *v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned __int16 *v14;
  unsigned __int16 *v15;
  unsigned int v16;
  unint64_t v17;
  int v18;
  unint64_t v19;
  unint64_t v20;
  unsigned __int16 *v21;
  unsigned __int16 *v22;
  unsigned int v23;
  unsigned int v24;
  unint64_t v25;
  int v26;
  unint64_t v27;
  int v28;
  unint64_t v29;
  unsigned __int16 *v30;
  unsigned __int16 *v31;
  unsigned int v32;
  unsigned int v33;
  unsigned __int16 *v34;
  __int128 v35;
  __int128 v36;
  unint64_t v37;
  int v38;
  unint64_t v39;
  int v40;
  unint64_t v41;
  unsigned __int16 *v42;
  unsigned __int16 *v43;
  unsigned int v44;
  unsigned int v45;
  __int128 v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;

  v4 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)a1) >> 4);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = (unsigned __int16 **)(a2 - 24);
      v7 = *(a2 - 6);
      v8 = a1[18];
      if (v7 < v8)
        goto LABEL_3;
      if (v7 > v8)
        return result;
      v37 = *((unsigned __int8 *)a1 + 23);
      v38 = (char)v37;
      if ((v37 & 0x80u) != 0)
        v37 = *((_QWORD *)a1 + 1);
      v39 = *((unsigned __int8 *)a2 - 25);
      v40 = (char)v39;
      if ((v39 & 0x80u) != 0)
        v39 = *((_QWORD *)a2 - 5);
      if (v37 >= v39)
        v41 = v39;
      else
        v41 = v37;
      if (!v41)
        goto LABEL_83;
      if (v40 >= 0)
        v42 = a2 - 24;
      else
        v42 = *v6;
      if (v38 >= 0)
        v43 = a1;
      else
        v43 = *(unsigned __int16 **)a1;
      do
      {
        v44 = *v42;
        v45 = *v43;
        if (v44 < v45)
          goto LABEL_3;
        if (v45 < v44)
          return 1;
        ++v42;
        ++v43;
        --v41;
      }
      while (v41);
LABEL_83:
      if (v39 < v37)
      {
LABEL_3:
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a1, (uint64_t)v6);
        return 1;
      }
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((uint64_t *)a1, (uint64_t)(a1 + 24), (uint64_t)(a2 - 24));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((uint64_t *)a1, (uint64_t)(a1 + 24), (uint64_t)(a1 + 48), (uint64_t)(a2 - 24));
      return 1;
    case 5uLL:
      std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *,0>((uint64_t *)a1, (uint64_t)(a1 + 24), (uint64_t)(a1 + 48), (uint64_t)(a1 + 72), (uint64_t)(a2 - 24));
      return 1;
    default:
      v9 = a1 + 48;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((uint64_t *)a1, (uint64_t)(a1 + 24), (uint64_t)(a1 + 48));
      v10 = a1 + 72;
      if (a1 + 72 == a2)
        return 1;
      v11 = 0;
      break;
  }
  while (1)
  {
    v12 = v10[18];
    v13 = v9[18];
    if (v12 < v13)
      break;
    if (v12 <= v13)
    {
      v25 = *((unsigned __int8 *)v9 + 23);
      v26 = (char)v25;
      if ((v25 & 0x80u) != 0)
        v25 = *((_QWORD *)v9 + 1);
      v27 = *((unsigned __int8 *)v10 + 23);
      v28 = (char)v27;
      if ((v27 & 0x80u) != 0)
        v27 = *((_QWORD *)v10 + 1);
      if (v25 >= v27)
        v29 = v27;
      else
        v29 = v25;
      if (v29)
      {
        if (v28 >= 0)
          v30 = v10;
        else
          v30 = *(unsigned __int16 **)v10;
        if (v26 >= 0)
          v31 = v9;
        else
          v31 = *(unsigned __int16 **)v9;
        do
        {
          v32 = *v30;
          v33 = *v31;
          if (v32 < v33)
            goto LABEL_7;
          if (v33 < v32)
            goto LABEL_58;
          ++v30;
          ++v31;
        }
        while (--v29);
      }
      if (v27 < v25)
        break;
    }
LABEL_58:
    v9 = v10;
    v10 += 24;
    if (v10 == a2)
      return 1;
  }
LABEL_7:
  v46 = *(_OWORD *)v10;
  v47 = *((_QWORD *)v10 + 2);
  *((_QWORD *)v10 + 1) = 0;
  *((_QWORD *)v10 + 2) = 0;
  *(_QWORD *)v10 = 0;
  v48 = *(_OWORD *)(v10 + 12);
  v14 = v10;
  v49 = *((_QWORD *)v10 + 5);
  while (1)
  {
    v15 = v9;
    if (*((char *)v14 + 23) < 0)
      operator delete(*(void **)v14);
    *(_OWORD *)v14 = *(_OWORD *)v9;
    *((_QWORD *)v14 + 2) = *((_QWORD *)v9 + 2);
    *((_BYTE *)v9 + 23) = 0;
    *v9 = 0;
    *(_OWORD *)(v14 + 12) = *(_OWORD *)(v9 + 12);
    *((_QWORD *)v14 + 5) = *((_QWORD *)v9 + 5);
    if (v9 == a1)
      break;
    v9 -= 24;
    v16 = *(v15 - 6);
    v14 = v15;
    if (WORD6(v48) >= v16)
    {
      if (WORD6(v48) > v16)
        goto LABEL_53;
      v17 = *((unsigned __int8 *)v15 - 25);
      v18 = (char)v17;
      if ((v17 & 0x80u) != 0)
        v17 = *((_QWORD *)v15 - 5);
      v19 = HIBYTE(v47);
      if (v47 < 0)
        v19 = *((_QWORD *)&v46 + 1);
      if (v17 >= v19)
        v20 = v19;
      else
        v20 = v17;
      if (v20)
      {
        if (v47 >= 0)
          v21 = (unsigned __int16 *)&v46;
        else
          v21 = (unsigned __int16 *)v46;
        if (v18 >= 0)
          v22 = v15 - 24;
        else
          v22 = *(unsigned __int16 **)v9;
        while (1)
        {
          v23 = *v21;
          v24 = *v22;
          if (v23 < v24)
            break;
          if (v24 < v23)
            goto LABEL_53;
          ++v21;
          ++v22;
          if (!--v20)
            goto LABEL_30;
        }
        v14 = v15;
      }
      else
      {
LABEL_30:
        v14 = v15;
        if (v19 >= v17)
        {
LABEL_53:
          v34 = v15;
          goto LABEL_55;
        }
      }
    }
  }
  v34 = a1;
LABEL_55:
  if (*((char *)v34 + 23) < 0)
    operator delete(*(void **)v34);
  v35 = v46;
  *((_QWORD *)v34 + 2) = v47;
  *(_OWORD *)v34 = v35;
  v36 = v48;
  *((_QWORD *)v15 + 5) = v49;
  *(_OWORD *)(v15 + 12) = v36;
  if (++v11 != 8)
    goto LABEL_58;
  return v10 + 24 == a2;
}

_QWORD *skit::ContextV2::ContextV2(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  std::allocate_shared[abi:ne180100]<skit::internal::ContextImpl,std::allocator<skit::internal::ContextImpl>,std::__fs::filesystem::path const&,std::basic_string<char16_t>,void>(a1, a2, a3);
  return a1;
}

{
  std::allocate_shared[abi:ne180100]<skit::internal::ContextImpl,std::allocator<skit::internal::ContextImpl>,std::__fs::filesystem::path const&,std::basic_string<char16_t>,void>(a1, a2, a3);
  return a1;
}

double std::allocate_shared[abi:ne180100]<skit::internal::ContextImpl,std::allocator<skit::internal::ContextImpl>,std::__fs::filesystem::path const&,std::basic_string<char16_t>,void>(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  char *v6;
  char *v7;
  _OWORD *v8;
  uint64_t v9;
  char v10;
  double result;
  _BYTE v12[15];

  v6 = (char *)operator new(0x90uLL);
  v7 = v6;
  *(_OWORD *)(v6 + 8) = 0u;
  *(_QWORD *)v6 = &off_1E86873D8;
  v8 = v6 + 24;
  v9 = *a3;
  *(_QWORD *)v12 = a3[1];
  *(_QWORD *)&v12[7] = *(uint64_t *)((char *)a3 + 15);
  v10 = *((_BYTE *)a3 + 23);
  a3[2] = 0;
  *(_OWORD *)a3 = 0u;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)v6 + 1, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *v8 = *(_OWORD *)a2;
    *((_QWORD *)v6 + 5) = *(_QWORD *)(a2 + 16);
  }
  *((_DWORD *)v7 + 12) = 0;
  *((_QWORD *)v7 + 7) = v9;
  *((_QWORD *)v7 + 8) = *(_QWORD *)v12;
  *(_QWORD *)(v7 + 71) = *(_QWORD *)&v12[7];
  v7[79] = v10;
  *((_QWORD *)v7 + 10) = 850045863;
  result = 0.0;
  *(_OWORD *)(v7 + 88) = 0u;
  *(_OWORD *)(v7 + 104) = 0u;
  *(_OWORD *)(v7 + 120) = 0u;
  *((_QWORD *)v7 + 17) = 0;
  *a1 = v8;
  a1[1] = v7;
  return result;
}

void sub_1CB763BD4(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v2;
  int v3;
  void *v5;

  if (v3 < 0)
    operator delete(v2);
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v5);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<skit::internal::ContextImpl>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E86873D8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<skit::internal::ContextImpl>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E86873D8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D179DDB4);
}

void std::__shared_ptr_emplace<skit::internal::ContextImpl>::__on_zero_shared(uint64_t a1)
{
  std::mutex::~mutex((std::mutex *)(a1 + 80));
  if (*(char *)(a1 + 79) < 0)
    operator delete(*(void **)(a1 + 56));
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
}

BOOL skit::ContextV2::is_initialized(skit::ContextV2 *this)
{
  return *(_QWORD *)this != 0;
}

void skit::ContextV2::index_reader(__int128 **a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  __int128 *v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  __int128 v9;
  std::string __p;
  std::string v11;
  unint64_t v12[2];
  unint64_t v13[2];

  *a4 = 0;
  a4[1] = 0;
  v5 = *a1;
  if (*a1)
  {
    if (*((char *)v5 + 55) < 0)
    {
      v6 = *((_QWORD *)v5 + 4);
      v7 = *((_QWORD *)v5 + 5);
    }
    else
    {
      v6 = (unint64_t)(v5 + 2);
      v7 = *((unsigned __int8 *)v5 + 55);
    }
    v13[0] = v6;
    v13[1] = v7;
    v12[0] = a2;
    v12[1] = a3;
    if (*((char *)v5 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)v5, *((_QWORD *)v5 + 1));
    }
    else
    {
      v8 = *v5;
      v11.__r_.__value_.__r.__words[2] = *((_QWORD *)v5 + 2);
      *(_OWORD *)&v11.__r_.__value_.__l.__data_ = v8;
    }
    std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v11, v13);
    std::string::append(&v11, ".ctx", 4uLL);
    std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v11, v12);
    std::string::append(&v11, ".idx", 4uLL);
    __p = v11;
    memset(&v11, 0, sizeof(v11));
    std::allocate_shared[abi:ne180100]<skit::internal::IndexReaderImpl,std::allocator<skit::internal::IndexReaderImpl>,std::__fs::filesystem::path,void>(&v9, (uint64_t)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v11.__r_.__value_.__l.__data_);
    skit::IndexReader::operator=((uint64_t)a4, &v9);
    skit::IndexReader::~IndexReader((skit::IndexReader *)&v9);
  }
}

void sub_1CB763DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  skit::IndexReader *v23;

  skit::IndexReader::~IndexReader(v23);
  _Unwind_Resume(a1);
}

void skit::ContextV2::index_writer(__int128 **a1@<X0>, uint64_t a2@<X1>, std::string::size_type a3@<X2>, uint64_t *a4@<X8>)
{
  __int128 *v5;
  unint64_t v8;
  unint64_t v9;
  __int128 v10;
  BOOL directories;
  BOOL v12;
  int v13;
  __int128 v14;
  char *v15;
  std::string *v16;
  std::string::size_type size;
  __int128 v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  std::string *v22;
  std::string *v23;
  uint64_t v24;
  int v25;
  std::string::size_type v26;
  int *v27;
  std::string *v28;
  int v29;
  const char *v30;
  NSObject *v31;
  std::string *v32;
  std::string *v33;
  uint8_t *v34;
  NSObject *v35;
  uint32_t v36;
  NSObject *v37;
  uint64_t v38;
  const std::string::value_type *v39;
  int v40;
  const std::string::value_type *v41;
  int *v42;
  const std::string::value_type *v43;
  int v44;
  uint64_t v45;
  std::string v46;
  int v47;
  unint64_t v48[2];
  unint64_t v49[2];
  char v50;
  std::string v51;
  _BYTE v52[24];
  stat v53;
  uuid_t out;
  __int128 v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  *a4 = 0;
  v5 = *a1;
  if (!*a1)
    return;
  if (*((char *)v5 + 55) < 0)
  {
    v8 = *((_QWORD *)v5 + 4);
    v9 = *((_QWORD *)v5 + 5);
  }
  else
  {
    v8 = (unint64_t)(v5 + 2);
    v9 = *((unsigned __int8 *)v5 + 55);
  }
  v49[0] = v8;
  v49[1] = v9;
  v48[0] = a2;
  v48[1] = a3;
  std::mutex::lock((std::mutex *)((char *)v5 + 56));
  *(_QWORD *)&v55 = v8;
  *((_QWORD *)&v55 + 1) = v9;
  *(_QWORD *)out = a2;
  *(_QWORD *)&out[8] = a3;
  if (*((char *)v5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v51, *(const std::string::value_type **)v5, *((_QWORD *)v5 + 1));
  }
  else
  {
    v10 = *v5;
    v51.__r_.__value_.__r.__words[2] = *((_QWORD *)v5 + 2);
    *(_OWORD *)&v51.__r_.__value_.__l.__data_ = v10;
  }
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v51, (unint64_t *)&v55);
  std::__fs::filesystem::_PathCVT<char16_t>::__append_range[abi:ne180100](&v51, (unint64_t)L".ctx", (unint64_t)L"");
  if (!*((_DWORD *)v5 + 6))
  {
    memset(&v53, 0, sizeof(v53));
    if (*((char *)v5 + 23) >= 0)
      v20 = (const char *)v5;
    else
      v20 = *(const char **)v5;
    if (stat(v20, &v53))
    {
      if (skit::internal::get_logging_context(void)::once != -1)
      v37 = skit::internal::get_logging_context(void)::logger;
      if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      {
        v40 = *((char *)v5 + 23);
        v41 = *(const std::string::value_type **)v5;
        v42 = __error();
        if (v40 >= 0)
          v43 = (const std::string::value_type *)v5;
        else
          v43 = v41;
        v44 = *v42;
        *(_DWORD *)v52 = 136446466;
        *(_QWORD *)&v52[4] = v43;
        *(_WORD *)&v52[12] = 1024;
        *(_DWORD *)&v52[14] = v44;
        _os_log_error_impl(&dword_1CB748000, v37, OS_LOG_TYPE_ERROR, "ContextImpl::make_path : stat failed for context parent directory @ %{public}s : %{darwin.errno}d", v52, 0x12u);
      }
      if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
      {
        *v51.__r_.__value_.__l.__data_ = 0;
        v51.__r_.__value_.__l.__size_ = 0;
      }
      else
      {
        v51.__r_.__value_.__s.__data_[0] = 0;
        *((_BYTE *)&v51.__r_.__value_.__s + 23) = 0;
      }
      goto LABEL_71;
    }
    if ((v53.st_mode & 0x4000) == 0)
    {
      if (skit::internal::get_logging_context(void)::once != -1)
      v38 = skit::internal::get_logging_context(void)::logger;
      if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
        goto LABEL_71;
      if (*((char *)v5 + 23) >= 0)
        v39 = (const std::string::value_type *)v5;
      else
        v39 = *(const std::string::value_type **)v5;
      *(_DWORD *)v52 = 136446210;
      *(_QWORD *)&v52[4] = v39;
      v30 = "ContextImpl::make_path : parent path is not a directory %{public}s";
      v34 = v52;
      v35 = v38;
      v36 = 12;
      goto LABEL_86;
    }
    *((_DWORD *)v5 + 6) = v53.st_mode & 0x1FF;
    if (skit::internal::get_logging_context(void)::once != -1)
    v21 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_INFO))
    {
      v22 = &v51;
      if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v22 = (std::string *)v51.__r_.__value_.__r.__words[0];
      v53.st_dev = 136446210;
      *(_QWORD *)&v53.st_mode = v22;
      _os_log_impl(&dword_1CB748000, v21, OS_LOG_TYPE_INFO, "ContextImpl::make_path : Creating context dir %{public}s", (uint8_t *)&v53, 0xCu);
    }
    v23 = (v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &v51
        : (std::string *)v51.__r_.__value_.__r.__words[0];
    if (mkdir((const char *)v23, *((_WORD *)v5 + 12)) && *__error() != 17)
    {
      if (skit::internal::get_logging_context(void)::once != -1)
      v24 = skit::internal::get_logging_context(void)::logger;
      if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
        goto LABEL_71;
      v25 = SHIBYTE(v51.__r_.__value_.__r.__words[2]);
      v26 = v51.__r_.__value_.__r.__words[0];
      v27 = __error();
      v28 = &v51;
      v29 = *v27;
      if (v25 < 0)
        v28 = (std::string *)v26;
      v53.st_dev = 136446466;
      *(_QWORD *)&v53.st_mode = v28;
      WORD2(v53.st_ino) = 1024;
      *(_DWORD *)((char *)&v53.st_ino + 6) = v29;
      v30 = "ContextImpl::make_path : mkdir for context directory failed @ %{public}s : %{darwin.errno}d";
      goto LABEL_85;
    }
  }
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v51, (unint64_t *)out);
  std::__fs::filesystem::_PathCVT<char16_t>::__append_range[abi:ne180100](&v51, (unint64_t)".", (unint64_t)L"");
  std::__fs::filesystem::__status((const std::__fs::filesystem::path *)&v51, 0);
  if (v50 == 2
    || ((*(_DWORD *)v52 = 0,
         *(_QWORD *)&v52[8] = std::system_category(),
         directories = std::__fs::filesystem::__create_directories((const std::__fs::filesystem::path *)&v51, (std::error_code *)v52), !*(_DWORD *)v52)? (v12 = directories): (v12 = 0), v12))
  {
    if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v46, v51.__r_.__value_.__l.__data_, v51.__r_.__value_.__l.__size_);
    else
      v46 = v51;
    v13 = 0;
    v47 = 0;
    goto LABEL_18;
  }
  if (skit::internal::get_logging_context(void)::once != -1)
  v24 = skit::internal::get_logging_context(void)::logger;
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    v33 = &v51;
    if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v33 = (std::string *)v51.__r_.__value_.__r.__words[0];
    v53.st_dev = 136446466;
    *(_QWORD *)&v53.st_mode = v33;
    WORD2(v53.st_ino) = 1024;
    *(_DWORD *)((char *)&v53.st_ino + 6) = *(_DWORD *)v52;
    v30 = "ContextImpl::make_pth : mkdir for component failed @ %{public}s : %{darwin.errno}d";
LABEL_85:
    v34 = (uint8_t *)&v53;
    v35 = v24;
    v36 = 18;
LABEL_86:
    _os_log_error_impl(&dword_1CB748000, v35, OS_LOG_TYPE_ERROR, v30, v34, v36);
  }
LABEL_71:
  memset(&v46, 0, sizeof(v46));
  v13 = -1;
  v47 = -1;
LABEL_18:
  if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v51.__r_.__value_.__l.__data_);
  memset(out, 0, sizeof(out));
  uuid_generate_random(out);
  if (*((char *)v5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)&v53, *(const std::string::value_type **)v5, *((_QWORD *)v5 + 1));
  }
  else
  {
    v14 = *v5;
    *(_QWORD *)&v53.st_uid = *((_QWORD *)v5 + 2);
    *(_OWORD *)&v53.st_dev = v14;
  }
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v53, v49);
  std::string::append((std::string *)&v53, ".ctx", 4uLL);
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v53, v48);
  std::string::push_back((std::string *)&v53, 95);
  v15 = (char *)operator new(0x28uLL);
  v51.__r_.__value_.__r.__words[0] = (std::string::size_type)v15;
  *(_OWORD *)&v51.__r_.__value_.__r.__words[1] = xmmword_1CB76D2D0;
  strcpy(v15, "00000000-0000-0000-0000-000000000000");
  uuid_unparse_lower(out, v15);
  if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v16 = &v51;
  else
    v16 = (std::string *)v51.__r_.__value_.__r.__words[0];
  if ((v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v51.__r_.__value_.__r.__words[2]);
  else
    size = v51.__r_.__value_.__l.__size_;
  std::string::append((std::string *)&v53, (const std::string::value_type *)v16, size);
  if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v51.__r_.__value_.__l.__data_);
  std::string::append((std::string *)&v53, ".idx.txn", 8uLL);
  if (v13)
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v31 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      memset(&v51, 0, sizeof(v51));
      skit::to_string(&v51, a2, a3);
      v32 = (v51.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
          ? &v51
          : (std::string *)v51.__r_.__value_.__r.__words[0];
      *(_DWORD *)v52 = 136446210;
      *(_QWORD *)&v52[4] = v32;
      _os_log_error_impl(&dword_1CB748000, v31, OS_LOG_TYPE_ERROR, "ContextImpl::index_writer : failed to create index path(s) for %{public}s index writer", v52, 0xCu);
      if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v51.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
    {
      *v46.__r_.__value_.__l.__data_ = 0;
      v46.__r_.__value_.__l.__size_ = 0;
    }
    else
    {
      v46.__r_.__value_.__s.__data_[0] = 0;
      *((_BYTE *)&v46.__r_.__value_.__s + 23) = 0;
    }
    if (SHIBYTE(v53.st_gid) < 0)
    {
      **(_BYTE **)&v53.st_dev = 0;
      v53.st_ino = 0;
    }
    else
    {
      LOBYTE(v53.st_dev) = 0;
      HIBYTE(v53.st_gid) = 0;
    }
    v18 = 0uLL;
    *(_OWORD *)out = 0u;
  }
  else
  {
    v18 = *(_OWORD *)out;
  }
  v51 = v46;
  memset(&v46, 0, sizeof(v46));
  *(_OWORD *)v52 = *(_OWORD *)&v53.st_dev;
  *(_QWORD *)&v52[16] = *(_QWORD *)&v53.st_uid;
  memset(&v53, 0, 24);
  v55 = v18;
  std::make_unique[abi:ne180100]<skit::internal::IndexWriterImpl,skit::Uuid,std::__fs::filesystem::path,std::__fs::filesystem::path>(&v45, &v55, (uint64_t *)&v51, (uint64_t)v52);
  if ((v52[23] & 0x80000000) != 0)
    operator delete(*(void **)v52);
  if (SHIBYTE(v51.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v51.__r_.__value_.__l.__data_);
  if (SHIBYTE(v53.st_gid) < 0)
    operator delete(*(void **)&v53.st_dev);
  std::mutex::unlock((std::mutex *)((char *)v5 + 56));
  v19 = v45;
  v45 = 0;
  std::unique_ptr<skit::internal::IndexWriterImpl>::reset[abi:ne180100](a4, v19);
  skit::IndexWriter::~IndexWriter((skit::IndexWriter *)&v45);
}

void sub_1CB764600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43)
{
  skit::IndexWriter *v43;
  std::mutex *v44;

  if (a29 < 0)
    operator delete(__p);
  std::mutex::unlock(v44);
  skit::IndexWriter::~IndexWriter(v43);
  _Unwind_Resume(a1);
}

BOOL skit::ContextV2::index_exists(__int128 **a1, unint64_t a2, unint64_t a3)
{
  __int128 *v3;
  unint64_t v4;
  unint64_t v5;
  __int128 v7;
  std::string *p_p;
  int v9;
  std::string __p;
  unint64_t v11[2];
  unint64_t v12[2];

  v3 = *a1;
  if (!*a1)
    return 0;
  if (*((char *)v3 + 55) < 0)
  {
    v4 = *((_QWORD *)v3 + 4);
    v5 = *((_QWORD *)v3 + 5);
  }
  else
  {
    v4 = (unint64_t)(v3 + 2);
    v5 = *((unsigned __int8 *)v3 + 55);
  }
  v12[0] = v4;
  v12[1] = v5;
  v11[0] = a2;
  v11[1] = a3;
  if (*((char *)v3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v3, *((_QWORD *)v3 + 1));
  }
  else
  {
    v7 = *v3;
    __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v3 + 2);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v7;
  }
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&__p, v12);
  std::string::append(&__p, ".ctx", 4uLL);
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&__p, v11);
  std::string::append(&__p, ".idx", 4uLL);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  v9 = access((const char *)p_p, 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v9 == 0;
}

void sub_1CB7647B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t skit::ContextV2::index_rename(__int128 **a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  __int128 *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  __int128 v9;
  std::mutex *v10;
  std::error_code *v11;
  const std::__fs::filesystem::path *p_p;
  const std::__fs::filesystem::path *v13;
  int v14;
  int v15;
  NSObject *v17;
  int v18;
  std::string::size_type v19;
  int v20;
  std::string::size_type v21;
  int *v22;
  std::string *v23;
  int v24;
  std::string *v25;
  std::string __p;
  std::string v27;
  unint64_t v28[2];
  unint64_t v29[2];
  unint64_t v30[2];
  uint8_t buf[4];
  std::string *v32;
  __int16 v33;
  std::string *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = *a1;
  if (!*a1)
    return 0xFFFFFFFFLL;
  if (*((char *)v5 + 55) < 0)
  {
    v6 = *((_QWORD *)v5 + 4);
    v7 = *((_QWORD *)v5 + 5);
  }
  else
  {
    v6 = (unint64_t)(v5 + 2);
    v7 = *((unsigned __int8 *)v5 + 55);
  }
  v30[0] = v6;
  v30[1] = v7;
  v29[0] = a2;
  v29[1] = a3;
  v28[0] = a4;
  v28[1] = a5;
  if (*((char *)v5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)v5, *((_QWORD *)v5 + 1));
  }
  else
  {
    v9 = *v5;
    v27.__r_.__value_.__r.__words[2] = *((_QWORD *)v5 + 2);
    *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v9;
  }
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v27, v30);
  std::string::append(&v27, ".ctx", 4uLL);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v27.__r_.__value_.__l.__data_, v27.__r_.__value_.__l.__size_);
  else
    __p = v27;
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v27, v28);
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&__p, v29);
  std::string::append(&v27, ".idx", 4uLL);
  std::string::append(&__p, ".idx", 4uLL);
  v10 = (std::mutex *)((char *)v5 + 56);
  std::mutex::lock(v10);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = (const std::__fs::filesystem::path *)&__p;
  else
    p_p = (const std::__fs::filesystem::path *)__p.__r_.__value_.__r.__words[0];
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v13 = (const std::__fs::filesystem::path *)&v27;
  else
    v13 = (const std::__fs::filesystem::path *)v27.__r_.__value_.__r.__words[0];
  rename(p_p, v13, v11);
  v15 = v14;
  std::mutex::unlock(v10);
  if (v15)
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v17 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      v18 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
      v19 = __p.__r_.__value_.__r.__words[0];
      v20 = SHIBYTE(v27.__r_.__value_.__r.__words[2]);
      v21 = v27.__r_.__value_.__r.__words[0];
      v22 = __error();
      v23 = &v27;
      v24 = *v22;
      if (v20 < 0)
        v23 = (std::string *)v21;
      *(_DWORD *)buf = 136446722;
      v25 = &__p;
      if (v18 < 0)
        v25 = (std::string *)v19;
      v32 = v25;
      v33 = 2082;
      v34 = v23;
      v35 = 1024;
      v36 = v24;
      _os_log_error_impl(&dword_1CB748000, v17, OS_LOG_TYPE_ERROR, "ContextImpl::rename_index : unable to rename index @  %{public}s  --->  %{public}s : %{darwin.errno}d", buf, 0x1Cu);
    }
    v8 = 0xFFFFFFFFLL;
  }
  else
  {
    v8 = 0;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v27.__r_.__value_.__l.__data_);
  return v8;
}

void sub_1CB764A50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a14 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

uint64_t skit::ContextV2::index_remove(__int128 **a1, uint64_t a2, std::string::size_type a3)
{
  __int128 *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  __int128 v9;
  std::mutex *v10;
  const char *v11;
  const std::__fs::filesystem::path *v12;
  NSObject *v14;
  int v15;
  std::string::size_type v16;
  int v17;
  std::string::size_type v18;
  int *v19;
  std::string *v20;
  int v21;
  std::string *p_p;
  std::string __p;
  std::string v24;
  unint64_t v25[2];
  unint64_t v26[2];
  uint8_t buf[4];
  std::string *v28;
  __int16 v29;
  std::string *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  if (!*a1)
    return 0xFFFFFFFFLL;
  if (*((char *)v3 + 55) < 0)
  {
    v6 = *((_QWORD *)v3 + 4);
    v7 = *((_QWORD *)v3 + 5);
  }
  else
  {
    v6 = (unint64_t)(v3 + 2);
    v7 = *((unsigned __int8 *)v3 + 55);
  }
  v26[0] = v6;
  v26[1] = v7;
  v25[0] = a2;
  v25[1] = a3;
  if (*((char *)v3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v24, *(const std::string::value_type **)v3, *((_QWORD *)v3 + 1));
  }
  else
  {
    v9 = *v3;
    v24.__r_.__value_.__r.__words[2] = *((_QWORD *)v3 + 2);
    *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v9;
  }
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v24, v26);
  std::string::append(&v24, ".ctx", 4uLL);
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v24, v25);
  std::string::append(&v24, ".idx", 4uLL);
  v10 = (std::mutex *)((char *)v3 + 56);
  std::mutex::lock(v10);
  if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v12 = (const std::__fs::filesystem::path *)&v24;
  else
    v12 = (const std::__fs::filesystem::path *)v24.__r_.__value_.__r.__words[0];
  if (skit::internal::remove_all(v12, v11) && *__error() != 2)
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v14 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      memset(&__p, 0, sizeof(__p));
      skit::to_string(&__p, a2, a3);
      v15 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
      v16 = __p.__r_.__value_.__r.__words[0];
      v17 = SHIBYTE(v24.__r_.__value_.__r.__words[2]);
      v18 = v24.__r_.__value_.__r.__words[0];
      v19 = __error();
      v20 = &v24;
      v21 = *v19;
      if (v17 < 0)
        v20 = (std::string *)v18;
      *(_DWORD *)buf = 136446722;
      p_p = &__p;
      if (v15 < 0)
        p_p = (std::string *)v16;
      v28 = p_p;
      v29 = 2082;
      v30 = v20;
      v31 = 1024;
      v32 = v21;
      _os_log_error_impl(&dword_1CB748000, v14, OS_LOG_TYPE_ERROR, "Context::remove_index : failed to remove index %{public}s @ %{public}s : %{darwin.errno}d", buf, 0x1Cu);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    v8 = 0xFFFFFFFFLL;
  }
  else
  {
    v8 = 0;
  }
  std::mutex::unlock(v10);
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v24.__r_.__value_.__l.__data_);
  return v8;
}

void sub_1CB764CE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  std::mutex *v21;

  if (a15 < 0)
    operator delete(__p);
  std::mutex::unlock(v21);
  if (a21 < 0)
    operator delete(a16);
  _Unwind_Resume(a1);
}

uint64_t skit::ContextV2::cleanup(__int128 **this)
{
  __int128 *v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  __int128 v5;
  std::mutex *v6;
  std::shared_ptr<std::__fs::filesystem::__dir_stream>::element_type *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  const std::__fs::filesystem::path *v15;
  std::__fs::filesystem::path *v16;
  int v17;
  std::__fs::filesystem::path::__string_view v18;
  int v19;
  const char *v20;
  int v21;
  const std::__fs::filesystem::path *v22;
  NSObject *v23;
  int v24;
  int v25;
  std::string::size_type v26;
  std::__shared_weak_count *cntrl;
  uint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  NSObject *v34;
  int v35;
  std::string::size_type v36;
  std::string *v37;
  std::string *p_p;
  std::string::size_type v39;
  std::__fs::filesystem::directory_iterator v40;
  std::string __p;
  std::shared_ptr<std::__fs::filesystem::__dir_stream>::element_type *v42;
  std::__shared_weak_count *v43;
  std::error_code v44;
  std::string v45;
  unint64_t v46[2];
  std::__fs::filesystem::path v47;
  uint8_t buf[24];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v1 = *this;
  if (!*this)
    return 0xFFFFFFFFLL;
  if (*((char *)v1 + 55) < 0)
  {
    v2 = *((_QWORD *)v1 + 4);
    v3 = *((_QWORD *)v1 + 5);
  }
  else
  {
    v2 = (unint64_t)(v1 + 2);
    v3 = *((unsigned __int8 *)v1 + 55);
  }
  v46[0] = v2;
  v46[1] = v3;
  if (*((char *)v1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v45, *(const std::string::value_type **)v1, *((_QWORD *)v1 + 1));
  }
  else
  {
    v5 = *v1;
    v45.__r_.__value_.__r.__words[2] = *((_QWORD *)v1 + 2);
    *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v5;
  }
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v45, v46);
  std::string::append(&v45, ".ctx", 4uLL);
  v6 = (std::mutex *)((char *)v1 + 56);
  std::mutex::lock(v6);
  v44.__val_ = 0;
  v44.__cat_ = std::system_category();
  MEMORY[0x1D179DD0C](&v42, &v45, &v44, 2);
  if (!v44.__val_)
  {
    std::__fs::filesystem::path::path[abi:ne180100]<char [5],void>(&__p, (std::string *)".txn");
    memset(buf, 0, sizeof(buf));
    v7 = v42;
    v8 = v43;
    if (v43)
    {
      p_shared_owners = (unint64_t *)&v43->__shared_owners_;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
      v11 = v43;
      v40.__imp_.__ptr_ = v7;
      v40.__imp_.__cntrl_ = v8;
      if (v43)
      {
        v12 = (unint64_t *)&v43->__shared_owners_;
        do
          v13 = __ldxr(v12);
        while (__stxr(v13 + 1, v12));
        do
          v14 = __ldaxr(v12);
        while (__stlxr(v14 - 1, v12));
        if (!v14)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
    }
    else
    {
      v40.__imp_.__ptr_ = v42;
      v40.__imp_.__cntrl_ = 0;
    }
    v4 = 0;
    while (1)
    {
      if (!v40.__imp_.__ptr_)
      {
        cntrl = v40.__imp_.__cntrl_;
        if (v40.__imp_.__cntrl_)
        {
          v28 = &v40.__imp_.__cntrl_->__shared_owners_;
          do
            v29 = __ldaxr((unint64_t *)v28);
          while (__stlxr(v29 - 1, (unint64_t *)v28));
          if (!v29)
          {
            ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
            std::__shared_weak_count::__release_weak(cntrl);
          }
        }
        v47.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)buf;
        std::vector<std::__fs::filesystem::path>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        goto LABEL_56;
      }
      v15 = (const std::__fs::filesystem::path *)std::__fs::filesystem::directory_iterator::__dereference(&v40);
      v16 = (std::__fs::filesystem::path *)v15;
      if (((1 << v15[3].__pn_.__r_.__value_.__s.__data_[1]) & 0x13) != 0)
      {
        std::__fs::filesystem::__status(v15, 0);
        v17 = v47.__pn_.__r_.__value_.__s.__data_[0];
      }
      else
      {
        v17 = v15[3].__pn_.__r_.__value_.__s.__data_[0];
      }
      if (v17 == 2)
      {
        std::__fs::filesystem::path::extension[abi:ne180100]((uint64_t)&v47, v16);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v18.__data_ = (const std::string_view::value_type *)&__p;
        else
          v18.__data_ = (const std::string_view::value_type *)__p.__r_.__value_.__r.__words[0];
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v18.__size_ = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        else
          v18.__size_ = __p.__r_.__value_.__l.__size_;
        v19 = std::__fs::filesystem::path::__compare(&v47, v18);
        v21 = v19;
        if (SHIBYTE(v47.__pn_.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v47.__pn_.__r_.__value_.__l.__data_);
          if (v21)
            goto LABEL_41;
        }
        else if (v19)
        {
          goto LABEL_41;
        }
        if ((v16->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v22 = v16;
        else
          v22 = (const std::__fs::filesystem::path *)v16->__pn_.__r_.__value_.__r.__words[0];
        if (skit::internal::remove_all(v22, v20) && *__error() != 2)
        {
          if (skit::internal::get_logging_context(void)::once != -1)
          v23 = skit::internal::get_logging_context(void)::logger;
          if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
          {
            v24 = SHIBYTE(v16->__pn_.__r_.__value_.__r.__words[2]);
            v39 = v16->__pn_.__r_.__value_.__r.__words[0];
            v25 = *__error();
            v26 = v39;
            if (v24 >= 0)
              v26 = (std::string::size_type)v16;
            LODWORD(v47.__pn_.__r_.__value_.__l.__data_) = 136446466;
            *(std::string::size_type *)((char *)v47.__pn_.__r_.__value_.__r.__words + 4) = v26;
            WORD2(v47.__pn_.__r_.__value_.__r.__words[1]) = 1024;
            *(_DWORD *)((char *)&v47.__pn_.__r_.__value_.__r.__words[1] + 6) = v25;
            _os_log_error_impl(&dword_1CB748000, v23, OS_LOG_TYPE_ERROR, "ContextImpl::cleanup : failed to remove transaction directory @ %{public}s : %{darwin.errno}d", (uint8_t *)&v47, 0x12u);
          }
          v4 = 0xFFFFFFFFLL;
        }
      }
LABEL_41:
      std::__fs::filesystem::directory_iterator::__increment(&v40, 0);
    }
  }
  if (skit::internal::get_logging_context(void)::once != -1)
  v34 = skit::internal::get_logging_context(void)::logger;
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    v35 = SHIBYTE(v45.__r_.__value_.__r.__words[2]);
    v36 = v45.__r_.__value_.__r.__words[0];
    std::error_code::message(&__p, &v44);
    v37 = &v45;
    if (v35 < 0)
      v37 = (std::string *)v36;
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v37;
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = p_p;
    _os_log_error_impl(&dword_1CB748000, v34, OS_LOG_TYPE_ERROR, "ContextImpl::cleanup : failed to construct directory iterator %{public}s : %{public}s", buf, 0x16u);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  v4 = 0xFFFFFFFFLL;
LABEL_56:
  v30 = v43;
  if (v43)
  {
    v31 = (unint64_t *)&v43->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
  std::mutex::unlock(v6);
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);
  return v4;
}

void sub_1CB765204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,std::__shared_weak_count *a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  std::mutex *v31;
  unint64_t *p_shared_owners;
  unint64_t v34;

  if (a23)
  {
    p_shared_owners = (unint64_t *)&a23->__shared_owners_;
    do
      v34 = __ldaxr(p_shared_owners);
    while (__stlxr(v34 - 1, p_shared_owners));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))a23->__on_zero_shared)(a23);
      std::__shared_weak_count::__release_weak(a23);
    }
  }
  std::mutex::unlock(v31);
  if (a31 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

_DWORD *skit::Document::Document(_DWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)a1 = *a2;
  v3 = *(_QWORD *)a1;
  if (!*(_QWORD *)a1)
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v9 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    LOWORD(v18) = 0;
    v10 = "initialized with an empty buffer";
    goto LABEL_16;
  }
  v4 = a1[2];
  if (v4 <= 0x17)
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v13 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v14 = a1[2];
    v18 = 67109120;
    v19 = v14;
    v10 = "buffer too small, %u bytes";
    v11 = v13;
    v12 = 8;
    goto LABEL_17;
  }
  v5 = *(unsigned int *)(v3 + 20);
  if ((_DWORD)v5 + 24 != v4)
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v15 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    v16 = *(_DWORD *)(*(_QWORD *)a1 + 20) + 24;
    v17 = a1[2];
    v18 = 67109376;
    v19 = v16;
    v20 = 1024;
    v21 = v17;
    v10 = "buffer size mismatch, %u != %u";
    v11 = v15;
    v12 = 14;
LABEL_17:
    _os_log_error_impl(&dword_1CB748000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v18, v12);
LABEL_14:
    *(_QWORD *)a1 = &skit::Document::empty_doc;
    a1[2] = 24;
    return a1;
  }
  if ((_DWORD)v5)
  {
    v6 = v3 + 24;
    v7 = v3 + 24 + v5;
    while (v6 <= v7)
    {
      if (v6)
        v6 += *(unsigned __int16 *)(v6 + 2) + 4;
      if (v6 == v7)
        return a1;
    }
    if (skit::internal::get_logging_context(void)::once != -1)
    v9 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    LOWORD(v18) = 0;
    v10 = "buffer iterator bounds check failed";
LABEL_16:
    v11 = v9;
    v12 = 2;
    goto LABEL_17;
  }
  return a1;
}

uint64_t skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>::AliasSpanMatchImpl(uint64_t a1, __int128 *a2, size_t a3)
{
  __int128 v6;
  uint64_t v7;
  __int128 v8;

  v6 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v6;
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  *(_QWORD *)a2 = 0;
  v7 = *((_QWORD *)a2 + 3);
  *(_WORD *)(a1 + 32) = *((_WORD *)a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = *(_OWORD *)a3;
  *(_OWORD *)(a1 + 52) = *(_OWORD *)(a3 + 12);
  *(_OWORD *)(a1 + 40) = v8;
  skit::SmallVector<skit::GroupId,4u,true>::move(a1 + 72, a3 + 32);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a3 + 56);
  skit::SpanMatchV3::append_alias_id(a3, *((_WORD *)a2 + 16), *((_DWORD *)a2 + 7) - *((_DWORD *)a2 + 6));
  return a1;
}

{
  return __ZN4skit8internal18AliasSpanMatchImplINS_10AliasMatchENS_11SpanMatchV3EEC2ES2_S3_(a1, a2, a3);
}

void sub_1CB765644(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + 72);
  if (v3 != (void *)(v1 + 88))
    free(v3);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void skit::EmojiFilter::~EmojiFilter(skit::EmojiFilter *this)
{
  JUMPOUT(0x1D179DDB4);
}

void skit::EmojiFilter::filter(skit::EmojiFilter *this, skit::TokenStream *a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v7;

  v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 1) - *(_QWORD *)a2) >> 4);
  v4 = v3 - a3;
  if (v3 > a3)
  {
    v7 = 48 * a3;
    do
    {
      skit::EmojiFilter::filter((uint64_t)this, (unsigned __int16 *)(*(_QWORD *)a2 + v7));
      v7 += 48;
      --v4;
    }
    while (v4);
  }
}

BOOL skit::EmojiFilter::filter(uint64_t a1, unsigned __int16 *a2, unint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned int v5;
  int v7;
  int v8;
  int v9;
  _BOOL8 result;
  int v11;
  int v12;

  if ((int)a3 >= 1)
  {
    v3 = 0;
    while (1)
    {
      v4 = v3 + 1;
      v5 = a2[v3];
      if ((v5 & 0xFC00) != 0xD800 || (_DWORD)v4 == (_DWORD)a3)
      {
        ++v3;
      }
      else
      {
        v7 = a2[v4];
        v8 = v7 & 0xFC00;
        v3 += 2;
        v9 = v7 + (v5 << 10) - 56613888;
        if (v8 == 56320)
          v5 = v9;
        else
          v3 = v4;
      }
      if (v5 - 48 <= 9)
        break;
      if (v5 >> 4 >= 0x20D)
      {
        if (a3 < 3)
        {
          if (a3 == 2 && (v5 == 8505 || v5 - 9398 <= 0x33))
          {
            if (*a2 != (unsigned __int16)v5)
              return 0;
            v11 = a2[1] & 0xFFFE;
            v12 = 65038;
            return v11 == v12;
          }
        }
        else
        {
          result = 0;
          if (v5 - 127344 <= 0xF && ((1 << (v5 - 112)) & 0xC003) != 0 || v5 == 8505)
            return result;
          if (v5 - 9398 < 0x34)
            return 0;
        }
        result = 1;
        if (v5 < 0x2E7F || v5 == 65039 || v5 - 126976 < 0xB00)
          return result;
      }
      if (v3 >= (int)a3)
        return 0;
    }
    if (a3 == 3 && *a2 == (unsigned __int16)v5 && (__int16)a2[1] == -497)
    {
      v11 = a2[2];
      v12 = 8419;
      return v11 == v12;
    }
  }
  return 0;
}

void `non-virtual thunk to'skit::EmojiFilter::~EmojiFilter(skit::EmojiFilter *this)
{
  JUMPOUT(0x1D179DDB4);
}

float skit::EmojiFilter::filter(uint64_t a1, unsigned __int16 *a2)
{
  float *v2;
  unint64_t v4;
  unint64_t v5;
  float result;

  v2 = (float *)a2;
  v4 = *((_QWORD *)a2 + 1);
  if (*((char *)a2 + 23) >= 0)
  {
    v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = *(unsigned __int16 **)a2;
    v5 = v4;
  }
  if (skit::EmojiFilter::filter(a1, a2, v5))
  {
    result = *(float *)(a1 + 16) * v2[8];
    v2[8] = result;
    *((_WORD *)v2 + 20) = (*((_WORD *)v2 + 20) | *(_WORD *)(a1 + 20) & 4) & (~*(_WORD *)(a1 + 20) | 0xFFFE);
  }
  return result;
}

void skit::FieldBundle::add(uint64_t a1, __int16 a2, const void *a3, unsigned int a4, int a5)
{
  void *v9;
  unint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  char *v32;
  int v33;
  char *v34;
  char *v35;
  __int128 v36;
  int v37;
  _QWORD v38[5];

  if (a5)
  {
    v9 = (void *)operator new[]();
    memcpy(v9, a3, a4);
    v10 = *(_QWORD *)(a1 + 64);
    v11 = *(_QWORD **)(a1 + 56);
    if ((unint64_t)v11 >= v10)
    {
      v13 = *(_QWORD *)(a1 + 48);
      v14 = ((uint64_t)v11 - v13) >> 3;
      if ((unint64_t)(v14 + 1) >> 61)
        std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
      v15 = v10 - v13;
      v16 = v15 >> 2;
      if (v15 >> 2 <= (unint64_t)(v14 + 1))
        v16 = v14 + 1;
      if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
        v17 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v17 = v16;
      v38[4] = a1 + 64;
      if (v17)
        v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<skit::internal::IndexDiskImplV2>>>(v17);
      else
        v18 = 0;
      v19 = (_QWORD *)(v17 + 8 * v14);
      v38[0] = v17;
      v38[1] = v19;
      v38[3] = v17 + 8 * v18;
      *v19 = v9;
      v38[2] = v19 + 1;
      std::vector<std::unique_ptr<std::byte []>>::__swap_out_circular_buffer((_QWORD *)(a1 + 48), v38);
      v12 = *(_QWORD **)(a1 + 56);
      std::__split_buffer<std::unique_ptr<std::byte []>>::~__split_buffer((uint64_t)v38);
    }
    else
    {
      *v11 = v9;
      v12 = v11 + 1;
      *(_QWORD *)(a1 + 56) = v12;
    }
    *(_QWORD *)(a1 + 56) = v12;
    a3 = (const void *)*(v12 - 1);
  }
  v20 = *(_QWORD *)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 40);
  if (v20 >= v21)
  {
    v24 = *(_QWORD *)(a1 + 24);
    v25 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v20 - v24) >> 3);
    v26 = v25 + 1;
    if (v25 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
    v27 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v21 - v24) >> 3);
    if (2 * v27 > v26)
      v26 = 2 * v27;
    if (v27 >= 0x555555555555555)
      v28 = 0xAAAAAAAAAAAAAAALL;
    else
      v28 = v26;
    v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::FieldBundle::FieldData>>(v28);
    v30 = &v29[24 * v25];
    v32 = &v29[24 * v31];
    if (a4 >= 0x200)
      v33 = 512;
    else
      v33 = a4;
    *(_WORD *)v30 = a2;
    *((_WORD *)v30 + 1) = v33;
    *((_QWORD *)v30 + 1) = a3;
    *((_DWORD *)v30 + 4) = v33;
    v23 = v30 + 24;
    v35 = *(char **)(a1 + 24);
    v34 = *(char **)(a1 + 32);
    if (v34 != v35)
    {
      do
      {
        v36 = *(_OWORD *)(v34 - 24);
        *((_QWORD *)v30 - 1) = *((_QWORD *)v34 - 1);
        *(_OWORD *)(v30 - 24) = v36;
        v30 -= 24;
        v34 -= 24;
      }
      while (v34 != v35);
      v34 = *(char **)(a1 + 24);
    }
    *(_QWORD *)(a1 + 24) = v30;
    *(_QWORD *)(a1 + 32) = v23;
    *(_QWORD *)(a1 + 40) = v32;
    if (v34)
      operator delete(v34);
  }
  else
  {
    *(_WORD *)v20 = a2;
    if (a4 >= 0x200)
      v22 = 512;
    else
      v22 = a4;
    *(_WORD *)(v20 + 2) = v22;
    *(_QWORD *)(v20 + 8) = a3;
    *(_DWORD *)(v20 + 16) = v22;
    v23 = (char *)(v20 + 24);
  }
  *(_QWORD *)(a1 + 32) = v23;
  v37 = a4 + *(_DWORD *)(a1 + 20) + 4;
  ++*(_DWORD *)(a1 + 16);
  *(_DWORD *)(a1 + 20) = v37;
}

void sub_1CB765B34(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179DD9C](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

_QWORD *std::vector<std::unique_ptr<std::byte []>>::__swap_out_circular_buffer(_QWORD *result, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (_QWORD *)*result;
  v2 = (_QWORD *)result[1];
  v4 = a2[1];
  while (v2 != v3)
  {
    v5 = *--v2;
    *v2 = 0;
    *(_QWORD *)(v4 - 8) = v5;
    v4 -= 8;
  }
  a2[1] = v4;
  v6 = (_QWORD *)*result;
  *result = v4;
  a2[1] = v6;
  v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__split_buffer<std::unique_ptr<std::byte []>>::~__split_buffer(uint64_t a1)
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
      MEMORY[0x1D179DD9C](v4, 0x1000C8077774924);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<skit::FieldBundle::FieldData>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a1);
}

void skit::FieldBundle::add(skit::FieldBundle *this, __int16 a2, const skit::TokenStream *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  byte *v9;
  unint64_t v10;
  byte **v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  byte **v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  int v34;
  char *v35;
  char *v36;
  __int128 v37;
  int v38;
  _QWORD v39[5];

  v6 = *(_QWORD *)a3;
  v7 = 2;
  while (v6 != *((_QWORD *)a3 + 1))
  {
    v8 = *(unsigned __int8 *)(v6 + 23);
    if ((v8 & 0x80u) != 0)
      v8 = *(_QWORD *)(v6 + 8);
    v7 += 2 * v8 + 18;
    v6 += 48;
  }
  v9 = (byte *)operator new[]();
  skit::TokenStream::serialize(a3, v9, v7);
  v10 = *((_QWORD *)this + 8);
  v11 = (byte **)*((_QWORD *)this + 7);
  if ((unint64_t)v11 >= v10)
  {
    v13 = *((_QWORD *)this + 6);
    v14 = ((uint64_t)v11 - v13) >> 3;
    if ((unint64_t)(v14 + 1) >> 61)
      std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
    v15 = v10 - v13;
    v16 = v15 >> 2;
    if (v15 >> 2 <= (unint64_t)(v14 + 1))
      v16 = v14 + 1;
    if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
      v17 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v17 = v16;
    v39[4] = (char *)this + 64;
    if (v17)
      v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<skit::internal::IndexDiskImplV2>>>(v17);
    else
      v18 = 0;
    v19 = (byte **)(v17 + 8 * v14);
    v39[0] = v17;
    v39[1] = v19;
    v39[3] = v17 + 8 * v18;
    *v19 = v9;
    v39[2] = v19 + 1;
    std::vector<std::unique_ptr<std::byte []>>::__swap_out_circular_buffer((_QWORD *)this + 6, v39);
    v12 = (_QWORD *)*((_QWORD *)this + 7);
    std::__split_buffer<std::unique_ptr<std::byte []>>::~__split_buffer((uint64_t)v39);
  }
  else
  {
    *v11 = v9;
    v12 = v11 + 1;
    *((_QWORD *)this + 7) = v12;
  }
  *((_QWORD *)this + 7) = v12;
  v20 = *(v12 - 1);
  v21 = *((_QWORD *)this + 4);
  v22 = *((_QWORD *)this + 5);
  if (v21 >= v22)
  {
    v25 = *((_QWORD *)this + 3);
    v26 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v21 - v25) >> 3);
    v27 = v26 + 1;
    if (v26 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
    v28 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v22 - v25) >> 3);
    if (2 * v28 > v27)
      v27 = 2 * v28;
    if (v28 >= 0x555555555555555)
      v29 = 0xAAAAAAAAAAAAAAALL;
    else
      v29 = v27;
    v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::FieldBundle::FieldData>>(v29);
    v31 = &v30[24 * v26];
    v33 = &v30[24 * v32];
    if (v7 >= 0x200)
      v34 = 512;
    else
      v34 = v7;
    *(_WORD *)v31 = a2;
    *((_WORD *)v31 + 1) = v34;
    *((_QWORD *)v31 + 1) = v20;
    *((_DWORD *)v31 + 4) = v34;
    v24 = v31 + 24;
    v36 = (char *)*((_QWORD *)this + 3);
    v35 = (char *)*((_QWORD *)this + 4);
    if (v35 != v36)
    {
      do
      {
        v37 = *(_OWORD *)(v35 - 24);
        *((_QWORD *)v31 - 1) = *((_QWORD *)v35 - 1);
        *(_OWORD *)(v31 - 24) = v37;
        v31 -= 24;
        v35 -= 24;
      }
      while (v35 != v36);
      v35 = (char *)*((_QWORD *)this + 3);
    }
    *((_QWORD *)this + 3) = v31;
    *((_QWORD *)this + 4) = v24;
    *((_QWORD *)this + 5) = v33;
    if (v35)
      operator delete(v35);
  }
  else
  {
    *(_WORD *)v21 = a2;
    if (v7 >= 0x200)
      v23 = 512;
    else
      v23 = v7;
    *(_WORD *)(v21 + 2) = v23;
    *(_QWORD *)(v21 + 8) = v20;
    *(_DWORD *)(v21 + 16) = v23;
    v24 = (char *)(v21 + 24);
  }
  *((_QWORD *)this + 4) = v24;
  v38 = v7 + *((_DWORD *)this + 5) + 4;
  ++*((_DWORD *)this + 4);
  *((_DWORD *)this + 5) = v38;
}

void sub_1CB765EC0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D179DD9C](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

void skit::FieldBundle::clear(skit::FieldBundle *this)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  uuid_clear((unsigned __int8 *)this);
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 4) = *((_QWORD *)this + 3);
  v2 = (_QWORD *)*((_QWORD *)this + 6);
  v3 = (_QWORD *)*((_QWORD *)this + 7);
  while (v3 != v2)
  {
    v5 = *--v3;
    v4 = v5;
    *v3 = 0;
    if (v5)
      MEMORY[0x1D179DD9C](v4, 0x1000C8077774924);
  }
  *((_QWORD *)this + 7) = v2;
}

void skit::FieldBundle::to_iovec(skit::FieldBundle *this@<X0>, char **a2@<X8>)
{
  char *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  unint64_t v34;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<iovec>>((2 * *((_DWORD *)this + 4)) | 1u);
  v6 = v4;
  *a2 = v4;
  a2[1] = v4;
  a2[2] = &v4[16 * v5];
  if (v5 < 1)
  {
    v8 = (16 * v5) >> 3;
    if (v8 <= 1)
      v8 = 1;
    if ((unint64_t)(16 * v5) >= 0x7FFFFFFFFFFFFFF0)
      v9 = 0xFFFFFFFFFFFFFFFLL;
    else
      v9 = v8;
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<iovec>>(v9);
    *(_QWORD *)v10 = this;
    *((_QWORD *)v10 + 1) = 24;
    v7 = v10 + 16;
    *a2 = v10;
    a2[1] = v10 + 16;
    a2[2] = &v10[16 * v11];
    if (v6)
      operator delete(v6);
  }
  else
  {
    *(_QWORD *)v4 = this;
    *((_QWORD *)v4 + 1) = 24;
    v7 = v4 + 16;
  }
  a2[1] = v7;
  v12 = *((_QWORD *)this + 3);
  v13 = *((_QWORD *)this + 4);
  if (v12 != v13)
  {
    while (1)
    {
      v14 = (unint64_t)a2[2];
      if ((unint64_t)v7 < v14)
      {
        *(_QWORD *)v7 = v12;
        *((_QWORD *)v7 + 1) = 4;
        v15 = v7 + 16;
        goto LABEL_28;
      }
      v16 = *a2;
      v17 = (v7 - *a2) >> 4;
      v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 60)
        goto LABEL_47;
      v19 = v14 - (_QWORD)v16;
      if (v19 >> 3 > v18)
        v18 = v19 >> 3;
      v20 = (char *)((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v18);
      if (v20)
        v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<iovec>>((unint64_t)v20);
      else
        v21 = 0;
      v22 = &v20[16 * v17];
      v23 = &v20[16 * v21];
      *(_QWORD *)v22 = v12;
      *((_QWORD *)v22 + 1) = 4;
      v15 = v22 + 16;
      if (v7 == v16)
        break;
      do
      {
        *((_OWORD *)v22 - 1) = *((_OWORD *)v7 - 1);
        v22 -= 16;
        v7 -= 16;
      }
      while (v7 != v16);
      v7 = *a2;
      *a2 = v22;
      a2[1] = v15;
      a2[2] = v23;
      if (v7)
        goto LABEL_27;
LABEL_28:
      a2[1] = v15;
      v24 = *(_QWORD *)(v12 + 8);
      v25 = *(unsigned int *)(v12 + 16);
      v26 = (unint64_t)a2[2];
      if ((unint64_t)v15 >= v26)
      {
        v27 = *a2;
        v28 = (v15 - *a2) >> 4;
        v29 = v28 + 1;
        if ((unint64_t)(v28 + 1) >> 60)
LABEL_47:
          std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
        v30 = v26 - (_QWORD)v27;
        if (v30 >> 3 > v29)
          v29 = v30 >> 3;
        if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF0)
          v31 = 0xFFFFFFFFFFFFFFFLL;
        else
          v31 = v29;
        if (v31)
          v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<iovec>>(v31);
        else
          v32 = 0;
        v33 = (char *)(v31 + 16 * v28);
        v34 = v31 + 16 * v32;
        *(_QWORD *)v33 = v24;
        *((_QWORD *)v33 + 1) = v25;
        v7 = v33 + 16;
        if (v15 == v27)
        {
          *a2 = v33;
          a2[1] = v7;
          a2[2] = (char *)v34;
        }
        else
        {
          do
          {
            *((_OWORD *)v33 - 1) = *((_OWORD *)v15 - 1);
            v33 -= 16;
            v15 -= 16;
          }
          while (v15 != v27);
          v15 = *a2;
          *a2 = v33;
          a2[1] = v7;
          a2[2] = (char *)v34;
          if (!v15)
            goto LABEL_45;
        }
        operator delete(v15);
      }
      else
      {
        *(_QWORD *)v15 = v24;
        *((_QWORD *)v15 + 1) = v25;
        v7 = v15 + 16;
      }
LABEL_45:
      a2[1] = v7;
      v12 += 24;
      if (v12 == v13)
        return;
    }
    *a2 = v22;
    a2[1] = v15;
    a2[2] = v23;
LABEL_27:
    operator delete(v7);
    goto LABEL_28;
  }
}

void sub_1CB7661B8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v2;

  if (v2)
  {
    *(_QWORD *)(v1 + 8) = v2;
    operator delete(v2);
  }
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<iovec>>(unint64_t a1)
{
  if (a1 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a1);
}

_QWORD *skit::FieldSpanMatcherV2::FieldSpanMatcherV2(_QWORD *a1, uint64_t a2, __int128 **a3, char a4)
{
  char v6;

  v6 = a4;
  std::allocate_shared[abi:ne180100]<skit::internal::FieldSpanMatcherImpl,std::allocator<skit::internal::FieldSpanMatcherImpl>,std::basic_string<char16_t> &,skit::TokenStream &,BOOL &,void>(a1, a2, a3, &v6);
  return a1;
}

{
  char v6;

  v6 = a4;
  std::allocate_shared[abi:ne180100]<skit::internal::FieldSpanMatcherImpl,std::allocator<skit::internal::FieldSpanMatcherImpl>,std::basic_string<char16_t> &,skit::TokenStream &,BOOL &,void>(a1, a2, a3, &v6);
  return a1;
}

BOOL skit::FieldSpanMatcherV2::is_initialized(skit::FieldSpanMatcherV2 *this)
{
  return *(_QWORD *)this != 0;
}

uint64_t skit::FieldSpanMatcherV2::query_token_stream_begin(skit::FieldSpanMatcherV2 *this)
{
  if (*(_QWORD *)this)
    return **(_QWORD **)this;
  else
    return 0;
}

{
  if (*(_QWORD *)this)
    return **(_QWORD **)this;
  else
    return 0;
}

uint64_t skit::FieldSpanMatcherV2::query_token_stream_end(skit::FieldSpanMatcherV2 *this)
{
  if (*(_QWORD *)this)
    return *(_QWORD *)(*(_QWORD *)this + 8);
  else
    return 0;
}

{
  if (*(_QWORD *)this)
    return *(_QWORD *)(*(_QWORD *)this + 8);
  else
    return 0;
}

uint64_t skit::FieldSpanMatcherV2::alias_span_matcher(uint64_t *a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __int128 v10;
  uint64_t v11[2];
  _QWORD v12[11];

  v12[10] = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  if (!v4)
    return 0xFFFFFFFFLL;
  v11[0] = (uint64_t)v12;
  v11[1] = 0x200000000;
  v10 = *(_OWORD *)a2;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  v5 = skit::internal::FieldSpanMatcherImpl::alias_span_matcher(v4, &v10, a3, a4, v11, 0);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&v10 + 1);
  if (*((_QWORD *)&v10 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)v11);
  return v5;
}

void sub_1CB7663C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  std::shared_ptr<skit::internal::AliasImpl>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)&a12);
  _Unwind_Resume(a1);
}

void skit::FieldSpanMatcherV2::alias_filters(uint64_t **a1, char a2, uint64_t a3)
{
  uint64_t *v3;

  v3 = *a1;
  if (v3)
    skit::internal::FieldSpanMatcherImpl::alias_filters(v3, a2, a3);
}

void skit::FieldSpanMatcherV2::clear_alias_span_matcher(skit::internal::FieldSpanMatcherImpl **this)
{
  skit::internal::FieldSpanMatcherImpl *v1;

  v1 = *this;
  if (v1)
    skit::internal::FieldSpanMatcherImpl::clear_alias_span_matcher(v1);
}

uint64_t skit::FieldSpanMatcherV2::query_alias_matches_begin(skit::FieldSpanMatcherV2 *this)
{
  if (*(_QWORD *)this)
    return *(_QWORD *)(*(_QWORD *)this + 1184);
  else
    return 0;
}

uint64_t skit::FieldSpanMatcherV2::query_alias_matches_end(skit::FieldSpanMatcherV2 *this)
{
  if (*(_QWORD *)this)
    return *(_QWORD *)(*(_QWORD *)this + 1184) + 72 * *(unsigned int *)(*(_QWORD *)this + 1192);
  else
    return 0;
}

void skit::FieldSpanMatcherV2::match(uint64_t *a1, uint64_t a2, uint64_t *a3, __int16 a4)
{
  skit::FieldSpanMatcherV2::match(a1, a2, a3, a4, 0xFFFFFFFF);
}

void skit::FieldSpanMatcherV2::match(uint64_t *a1, uint64_t a2, uint64_t *a3, __int16 a4, unsigned int a5)
{
  uint64_t v5;
  uint64_t v7[2];
  uint64_t v8;
  __int16 v9;
  void *__p[2];
  __int128 v11;
  uint64_t v12;
  char *v13[2];
  _QWORD v14[33];

  v14[32] = *MEMORY[0x1E0C80C00];
  v9 = 0;
  *(_OWORD *)__p = 0u;
  v11 = 0u;
  v12 = 0;
  v13[0] = (char *)v14;
  v13[1] = (char *)0x400000000;
  v7[0] = (uint64_t)&v8;
  v7[1] = 0x200000000;
  v5 = *a1;
  if (v5)
  {
    skit::internal::FieldSpanMatcherImpl::match(v5, (uint64_t)&v9, a3, v7, 0, a4, a5);
  }
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)v7);
  skit::SmallVector<skit::SpanMatchV3,8u,true>::~SmallVector(v13);
  if (SBYTE7(v11) < 0)
    operator delete(__p[0]);
}

void sub_1CB766524(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)va);
  skit::internal::FieldMatchesImpl<skit::SpanMatchV3>::~FieldMatchesImpl((uint64_t)va1);
  _Unwind_Resume(a1);
}

size_t skit::`anonymous namespace'::field_span_match_to_v2(uint64_t a1, uint64_t a2)
{
  size_t result;
  char v5;
  __int128 v6;
  const std::basic_string<char16_t>::value_type *v7;
  std::basic_string<char16_t>::size_type v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  void *v14;
  const void *v15;
  _DWORD *v16;
  int v17;
  int v18;
  unsigned int v19;
  void *v20;
  uint64_t v21;
  int v22;
  int v23;
  unsigned int v24;
  std::bad_alloc *exception;
  std::bad_alloc *v26;

  *(_WORD *)a1 = *(_WORD *)a2;
  result = a1 + 8;
  if (a1 != a2)
  {
    v5 = *(_BYTE *)(a2 + 31);
    if (*(char *)(a1 + 31) < 0)
    {
      if (v5 >= 0)
        v7 = (const std::basic_string<char16_t>::value_type *)(a2 + 8);
      else
        v7 = *(const std::basic_string<char16_t>::value_type **)(a2 + 8);
      if (v5 >= 0)
        v8 = *(unsigned __int8 *)(a2 + 31);
      else
        v8 = *(_QWORD *)(a2 + 16);
      result = (size_t)std::basic_string<char16_t>::__assign_no_alias<false>((std::basic_string<char16_t> *)result, v7, v8);
    }
    else if ((*(_BYTE *)(a2 + 31) & 0x80) != 0)
    {
      result = (size_t)std::basic_string<char16_t>::__assign_no_alias<true>((std::basic_string<char16_t> *)result, *(const std::basic_string<char16_t>::value_type **)(a2 + 8), *(_QWORD *)(a2 + 16));
    }
    else
    {
      v6 = *(_OWORD *)(a2 + 8);
      *(_QWORD *)(result + 16) = *(_QWORD *)(a2 + 24);
      *(_OWORD *)result = v6;
    }
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(unsigned int *)(a2 + 56);
  v11 = v9 + (v10 << 6);
  if (*(_DWORD *)(a1 + 60) >= v10)
  {
    if ((_DWORD)v10)
    {
      v21 = *(_QWORD *)(a1 + 48);
      do
      {
        v22 = *(_DWORD *)(v9 + 8);
        v23 = *(_DWORD *)(v9 + 12);
        *(_QWORD *)v21 = *(_QWORD *)v9;
        *(_DWORD *)(v21 + 8) = v22;
        *(_DWORD *)(v21 + 12) = v23;
        *(_QWORD *)(v21 + 16) = *(_QWORD *)(v9 + 16);
        v24 = *(_DWORD *)(v9 + 24);
        v9 += 64;
        *(_QWORD *)(v21 + 24) = v24;
        v21 += 32;
      }
      while (v9 != v11);
    }
  }
  else
  {
    v12 = *(_DWORD *)(a1 + 56) + (*(_DWORD *)(a1 + 56) >> 1);
    if (v12 + 1 > v10)
      v13 = v12 + 1;
    else
      v13 = *(_DWORD *)(a2 + 56);
    v14 = malloc_type_malloc(32 * v13, 0x1000040E0EAB150uLL);
    if (!v14)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      v26 = std::bad_alloc::bad_alloc(exception);
      __cxa_throw(v26, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
    }
    v15 = v14;
    v16 = v14;
    do
    {
      v17 = *(_DWORD *)(v9 + 8);
      v18 = *(_DWORD *)(v9 + 12);
      *(_QWORD *)v16 = *(_QWORD *)v9;
      v16[2] = v17;
      v16[3] = v18;
      *((_QWORD *)v16 + 2) = *(_QWORD *)(v9 + 16);
      v19 = *(_DWORD *)(v9 + 24);
      v9 += 64;
      *((_QWORD *)v16 + 3) = v19;
      v16 += 8;
    }
    while (v9 != v11);
    v20 = *(void **)(a1 + 48);
    if (v20 != (void *)(a1 + 64))
      free(v20);
    *(_QWORD *)(a1 + 48) = v15;
    result = malloc_size(v15);
    *(_DWORD *)(a1 + 60) = result >> 5;
  }
  *(_DWORD *)(a1 + 56) = v10;
  return result;
}

uint64_t skit::internal::FieldMatchesImpl<skit::SpanMatchV3>::~FieldMatchesImpl(uint64_t a1)
{
  skit::SmallVector<skit::SpanMatchV3,8u,true>::~SmallVector((char **)(a1 + 48));
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)(a1 + 8));
  return a1;
}

std::basic_string<char16_t> *std::basic_string<char16_t>::__assign_no_alias<true>(std::basic_string<char16_t> *__dst, const std::basic_string<char16_t>::value_type *__src, std::basic_string<char16_t>::size_type __n_add)
{
  BOOL v5;
  std::basic_string<char16_t>::size_type v6;

  v5 = __n_add > 0xA;
  v6 = __n_add - 10;
  if (v5)
  {
    std::basic_string<char16_t>::__grow_by_and_replace(__dst, 0xAuLL, v6, *((_BYTE *)&__dst->__r_.__value_.__s + 23) & 0x7F, 0, *((_BYTE *)&__dst->__r_.__value_.__s + 23) & 0x7F, __n_add, __src);
  }
  else
  {
    *((_BYTE *)&__dst->__r_.__value_.__s + 23) = __n_add;
    if (__n_add)
      memmove(__dst, __src, 2 * __n_add);
    __dst->__r_.__value_.__s.__data_[__n_add] = 0;
  }
  return __dst;
}

std::basic_string<char16_t> *std::basic_string<char16_t>::__assign_no_alias<false>(std::basic_string<char16_t> *this, const std::basic_string<char16_t>::value_type *__src, std::basic_string<char16_t>::size_type __n_add)
{
  std::basic_string<char16_t>::size_type v5;
  void *v6;

  v5 = this->__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL;
  if (v5 <= __n_add)
  {
    std::basic_string<char16_t>::__grow_by_and_replace(this, v5 - 1, __n_add - v5 + 1, this->__r_.__value_.__l.__size_, 0, this->__r_.__value_.__l.__size_, __n_add, __src);
  }
  else
  {
    v6 = (void *)this->__r_.__value_.__r.__words[0];
    this->__r_.__value_.__l.__size_ = __n_add;
    if (__n_add)
      memmove(v6, __src, 2 * __n_add);
    *((_WORD *)v6 + __n_add) = 0;
  }
  return this;
}

void skit::FieldSpanMatcherV2::match(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t *a4, __int16 a5, unsigned int a6)
{
  uint64_t v6;
  __int16 v8;
  void *__p[2];
  __int128 v10;
  uint64_t v11;
  char *v12[2];
  _QWORD v13[33];

  v13[32] = *MEMORY[0x1E0C80C00];
  v8 = 0;
  *(_OWORD *)__p = 0u;
  v10 = 0u;
  v11 = 0;
  v12[0] = (char *)v13;
  v12[1] = (char *)0x400000000;
  v6 = *a1;
  if (v6)
  {
    skit::internal::FieldSpanMatcherImpl::match(v6, (uint64_t)&v8, a3, a4, 1, a5, a6);
  }
  skit::SmallVector<skit::SpanMatchV3,8u,true>::~SmallVector(v12);
  if (SBYTE7(v10) < 0)
    operator delete(__p[0]);
}

void sub_1CB7668D8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  skit::internal::FieldMatchesImpl<skit::SpanMatchV3>::~FieldMatchesImpl((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t skit::FieldSpanMatcherV2::merge_field(uint64_t *a1, int32x4_t *a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  __int128 *v10;
  _OWORD *v11;
  unsigned int v12;
  char *v13;
  __int32 v14;
  int v15;
  __int128 v16;
  unsigned __int32 v17;
  uint32x2_t v18;
  uint32x2_t v19;
  char *v20;
  std::basic_string<char16_t> *v21;
  __int128 v22;
  char *v23;
  __int128 v24;
  __int128 v25;
  unsigned int v26;
  int32x4_t *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char *v31;
  unint64_t v32;
  unsigned int v33;
  std::basic_string<char16_t>::size_type v34;
  std::basic_string<char16_t>::size_type v35;
  uint64_t v36;
  unsigned int v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  void *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  const std::basic_string<char16_t>::value_type *v61;
  std::basic_string<char16_t>::size_type v62;
  uint64_t v63;
  unsigned int v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  unsigned int v68;
  uint64_t v69;
  char *v70;
  _DWORD *v71;
  uint64_t v72;
  std::bad_alloc *exception;
  std::bad_alloc *v75;
  int v76;
  uint64_t v77;
  char *v78;
  unsigned int v79;
  __int128 *v80;
  unsigned int *v81;
  int32x4_t *v82;
  char **v83;
  uint64_t *v84;
  unint64_t v85;
  uint64_t v86;
  std::basic_string<char16_t> __p;
  int v88;
  _BYTE v89[12];
  __int128 v90;
  __int128 v91;
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  if (!*a1)
    goto LABEL_10;
  if ((a4 & 1) == 0)
    *a2 = vaddq_s32(*a2, *(int32x4_t *)(a3 + 32));
  v6 = *(unsigned int *)(a3 + 56);
  if (!(_DWORD)v6)
  {
LABEL_10:
    LOBYTE(v9) = 0;
    return v9 & 1;
  }
  v7 = 24;
  if (*(_BYTE *)(v4 + 602))
  {
    v8 = v4 + 24;
  }
  else
  {
    v7 = 48;
    v8 = v4 + 48;
  }
  if (*(char *)(v8 + 23) < 0)
  {
    v85 = *(_QWORD *)(v8 + 8);
    v8 = *(_QWORD *)(v4 + v7);
  }
  else
  {
    v85 = *(unsigned __int8 *)(v8 + 23);
  }
  v10 = *(__int128 **)(a3 + 48);
  v80 = &v10[2 * v6];
  v11 = (_OWORD *)(a3 + 8);
  v83 = (char **)&a2[1];
  v79 = a2[1].u32[2];
  v12 = v79;
  v82 = a2;
  do
  {
    if (v12 == a2[1].i32[3])
    {
      skit::SmallVector<skit::MergedFieldMatchV2,8u,true>::_reserve_more(v83, v12 + (v12 >> 1) + 1);
      v12 = v82[1].u32[2];
    }
    v13 = *v83;
    LOWORD(v86) = *(_WORD *)a3;
    if (*(char *)(a3 + 31) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(&__p, *(const std::basic_string<char16_t>::value_type **)(a3 + 8), *(_QWORD *)(a3 + 16));
    }
    else
    {
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *v11;
      __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(a3 + 24);
    }
    v15 = *(_DWORD *)(a3 + 32);
    v14 = *(_DWORD *)(a3 + 36);
    v88 = v15;
    *(_QWORD *)&v89[4] = *(_QWORD *)(a3 + 40);
    v16 = v10[1];
    v90 = *v10;
    v91 = v16;
    v17 = *((_DWORD *)v10 + 6);
    if (*(_DWORD *)&v89[4] < v17)
      v88 = v17 + v15 - *(_DWORD *)&v89[4];
    v18 = (uint32x2_t)vdup_lane_s32(*(int32x2_t *)&v89[4], 0);
    v18.i32[0] = v14;
    v19.i32[0] = *((_DWORD *)v10 + 5);
    v19.i32[1] = v17;
    v20 = &v13[392 * v12];
    *(uint32x2_t *)v89 = vmax_u32(v18, v19);
    *(_QWORD *)v20 = v20 + 16;
    *((_QWORD *)v20 + 1) = 0x400000001;
    std::uninitialized_copy[abi:ne180100]<skit::FieldMatchV2 const*,skit::FieldMatchV2*>((uint64_t)&v86, (uint64_t)&v92, (uint64_t)(v20 + 16));
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    v21 = (std::basic_string<char16_t> *)&v13[392 * v12 + 336];
    if (*(char *)(a3 + 31) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(v21, *(const std::basic_string<char16_t>::value_type **)(a3 + 8), *(_QWORD *)(a3 + 16));
    }
    else
    {
      v22 = *v11;
      *(_QWORD *)&v13[392 * v12 + 352] = *(_QWORD *)(a3 + 24);
      *(_OWORD *)&v21->__r_.__value_.__l.__data_ = v22;
    }
    v23 = &v13[392 * v12 + 360];
    v24 = *v10;
    v25 = v10[1];
    v10 += 2;
    *(_OWORD *)v23 = v24;
    *((_OWORD *)v23 + 1) = v25;
    a2 = v82;
    v12 = v82[1].i32[2] + 1;
    v82[1].i32[2] = v12;
  }
  while (v10 != v80);
  v26 = v79;
  if (v12 == v79)
  {
    LOBYTE(v9) = 0;
    v27 = v82;
    if (!v79)
      return v9 & 1;
    goto LABEL_89;
  }
  v9 = 0;
  v28 = (uint64_t)&(*v83)[392 * v79];
  v78 = *v83;
  v29 = (uint64_t)&(*v83)[392 * v12];
  do
  {
    v84 = (uint64_t *)(v29 - 392);
    if (v26)
    {
      v30 = 0;
      v81 = (unsigned int *)(v29 - 384);
      v31 = v78;
      do
      {
        while (1)
        {
          v32 = *((unsigned int *)v31 + 91);
          v33 = *(_DWORD *)(v29 - 32);
          if (v33 < v32)
            break;
          if (v33 != (_DWORD)v32)
          {
            v34 = v85 - v32;
            if (v85 < v32)
              std::__throw_out_of_range[abi:ne180100]("string_view::substr");
            v35 = v33 - v32;
            v36 = v8 + 2 * v32;
            if (v34 < v35)
              v35 = v34;
            v86 = v36;
            __p.__r_.__value_.__r.__words[0] = v35;
            if (skit::is_significant(&v86))
              break;
          }
          v37 = *v81;
          if (*v81)
          {
            v38 = *((_DWORD *)v31 + 2);
            v39 = *(_QWORD *)v31 + 80 * v38;
            v40 = *v84;
            v41 = v38 + v37;
            if (v38 + v37 <= *((_DWORD *)v31 + 3))
            {
              v47 = *(_QWORD *)v31 + 80 * v38;
            }
            else
            {
              v77 = *v84;
              v42 = v38 + (v38 >> 1);
              if (v42 + 1 > v41)
                v43 = v42 + 1;
              else
                v43 = v41;
              v44 = malloc_type_malloc(80 * v43, 0x10120409E7384ACuLL);
              if (!v44)
              {
                exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
                v75 = std::bad_alloc::bad_alloc(exception);
                __cxa_throw(v75, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
              }
              v45 = *(char **)v31;
              v46 = (char *)v39;
              v47 = (uint64_t)v44;
              if (*(_QWORD *)v31 != v39)
              {
                v47 = (uint64_t)v44;
                do
                {
                  *(_WORD *)v47 = *(_WORD *)v45;
                  v48 = *(_OWORD *)(v45 + 8);
                  *(_QWORD *)(v47 + 24) = *((_QWORD *)v45 + 3);
                  *(_OWORD *)(v47 + 8) = v48;
                  *((_QWORD *)v45 + 2) = 0;
                  *((_QWORD *)v45 + 3) = 0;
                  *((_QWORD *)v45 + 1) = 0;
                  v49 = *((_OWORD *)v45 + 2);
                  v50 = *((_OWORD *)v45 + 4);
                  *(_OWORD *)(v47 + 48) = *((_OWORD *)v45 + 3);
                  *(_OWORD *)(v47 + 64) = v50;
                  *(_OWORD *)(v47 + 32) = v49;
                  v47 += 80;
                  v45 += 80;
                }
                while (v45 != (char *)v39);
                v46 = *(char **)v31;
              }
              v51 = *((unsigned int *)v31 + 2);
              v52 = &v46[80 * v51];
              if (v52 != (char *)v39)
              {
                v53 = v47 + 80 * v37;
                do
                {
                  *(_WORD *)v53 = *(_WORD *)v39;
                  v54 = *(_OWORD *)(v39 + 8);
                  *(_QWORD *)(v53 + 24) = *(_QWORD *)(v39 + 24);
                  *(_OWORD *)(v53 + 8) = v54;
                  *(_QWORD *)(v39 + 16) = 0;
                  *(_QWORD *)(v39 + 24) = 0;
                  *(_QWORD *)(v39 + 8) = 0;
                  v55 = *(_OWORD *)(v39 + 32);
                  v56 = *(_OWORD *)(v39 + 64);
                  *(_OWORD *)(v53 + 48) = *(_OWORD *)(v39 + 48);
                  *(_OWORD *)(v53 + 64) = v56;
                  *(_OWORD *)(v53 + 32) = v55;
                  v39 += 80;
                  v53 += 80;
                }
                while ((char *)v39 != v52);
                v46 = *(char **)v31;
                v51 = *((unsigned int *)v31 + 2);
              }
              if ((_DWORD)v51)
              {
                v76 = v9;
                v57 = v46 + 31;
                v58 = 80 * v51;
                do
                {
                  if (*v57 < 0)
                    operator delete(*(void **)(v57 - 23));
                  v57 += 80;
                  v58 -= 80;
                }
                while (v58);
                v46 = *(char **)v31;
                v9 = v76;
              }
              if (v46 != v31 + 16)
                free(v46);
              *(_QWORD *)v31 = v44;
              *((_DWORD *)v31 + 3) = malloc_size(v44) / 0x50;
              v40 = v77;
            }
            *((_DWORD *)v31 + 2) = v41;
            std::uninitialized_copy[abi:ne180100]<skit::FieldMatchV2 const*,skit::FieldMatchV2*>(v40, v40 + 80 * v37, v47);
          }
          if (v31[359] < 0)
            v59 = *((_QWORD *)v31 + 43);
          else
            v59 = v31[359];
          if (v59 && *((_DWORD *)v31 + 91) < *(_DWORD *)(v29 - 32))
            std::basic_string<char16_t>::push_back((std::basic_string<char16_t> *)v31 + 14, (std::basic_string<char16_t>::value_type)a2);
          v60 = *(_BYTE *)(v29 - 33);
          if (v60 >= 0)
            v61 = (const std::basic_string<char16_t>::value_type *)(v29 - 56);
          else
            v61 = *(const std::basic_string<char16_t>::value_type **)(v29 - 56);
          if (v60 >= 0)
            v62 = *(unsigned __int8 *)(v29 - 33);
          else
            v62 = *(_QWORD *)(v29 - 48);
          std::basic_string<char16_t>::append((std::basic_string<char16_t> *)v31 + 14, v61, v62);
          LODWORD(v63) = *((_DWORD *)v31 + 90);
          v64 = *(_DWORD *)(v29 - 32);
          v65 = *(_DWORD *)(v29 - 28);
          if (v64 >= v63)
            v63 = v63;
          else
            v63 = v64;
          LODWORD(v66) = *((_DWORD *)v31 + 91);
          if (v66 <= v65)
            v66 = v65;
          else
            v66 = v66;
          *((_QWORD *)v31 + 45) = v63 | (v66 << 32);
          *((_DWORD *)v31 + 92) += *(_DWORD *)(v29 - 24);
          *((float *)v31 + 93) = *(float *)(v29 - 20) + *((float *)v31 + 93);
          *((int32x2_t *)v31 + 47) = vadd_s32(*(int32x2_t *)(v31 + 376), *(int32x2_t *)(v29 - 16));
          *((_DWORD *)v31 + 96) += *(_DWORD *)(v29 - 8);
          v31 += 392;
          v30 = 1;
          if (v31 == (char *)v28)
            goto LABEL_86;
        }
        v31 += 392;
      }
      while (v31 != (char *)v28);
      if ((v30 & 1) == 0)
        goto LABEL_87;
LABEL_86:
      v67 = v82[1].i64[0] + 392 * v82[1].u32[2];
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,skit::MergedFieldMatchV2 *,skit::MergedFieldMatchV2 *,skit::MergedFieldMatchV2 *,0>(v29, v67, (uint64_t)v84);
      skit::SmallVector<skit::MergedFieldMatchV2,8u,true>::_destroy<skit::MergedFieldMatchV2,(void *)0>(v67 - 392);
      --v82[1].i32[2];
      v9 = 1;
    }
LABEL_87:
    v29 -= 392;
    v26 = v79;
  }
  while (v84 != (uint64_t *)v28);
  v27 = v82;
  v26 = v82[1].u32[2];
  if (v26)
  {
LABEL_89:
    v68 = 0;
    do
    {
      if (v68)
      {
        v69 = 0;
        v70 = *v83;
        v71 = *v83 + 364;
        while (*(_DWORD *)&(*v83)[392 * v68 + 360] < *(v71 - 1) || *(_DWORD *)&(*v83)[392 * v68 + 364] > *v71)
        {
          ++v69;
          v71 += 98;
          if (v68 == v69)
          {
            LODWORD(v69) = v68;
            goto LABEL_98;
          }
        }
        v72 = (uint64_t)&v70[392 * v26];
        std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,skit::MergedFieldMatchV2 *,skit::MergedFieldMatchV2 *,skit::MergedFieldMatchV2 *,0>((uint64_t)&v70[392 * v68 + 392], v72, (uint64_t)&v70[392 * v68]);
        skit::SmallVector<skit::MergedFieldMatchV2,8u,true>::_destroy<skit::MergedFieldMatchV2,(void *)0>(v72 - 392);
        v26 = v27[1].i32[2] - 1;
        v27[1].i32[2] = v26;
      }
      else
      {
        LODWORD(v69) = 0;
      }
LABEL_98:
      if ((_DWORD)v69 == v68)
        ++v68;
    }
    while (v68 < v26);
  }
  return v9 & 1;
}

void sub_1CB766FA4(_Unwind_Exception *a1)
{
  uint64_t v1;

  skit::SmallVector<skit::FieldMatchV2,4u,true>::~SmallVector(v1);
  _Unwind_Resume(a1);
}

void skit::FieldSpanMatcherV2::finalize(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;

  v2 = *a1;
  if (*a1 && *(_DWORD *)(a2 + 44))
  {
    v4 = *(_QWORD *)v2;
    v5 = *(_QWORD *)(v2 + 8);
    if (*(_QWORD *)v2 == v5)
    {
      v6 = 0;
    }
    else
    {
      v6 = 0;
      do
      {
        v6 = *(_DWORD *)(v4 + 28) + v6 - *(_DWORD *)(v4 + 24);
        v4 += 48;
      }
      while (v4 != v5);
    }
    if (*(_DWORD *)(a2 + 56))
    {
      v7 = *(_QWORD *)(a2 + 48);
      do
      {
        v8 = *(_DWORD *)(v7 + 4) - *(_DWORD *)v7;
        if (v8 < 0x34)
          v9 = 4;
        else
          v9 = 5;
        if (v8 < 0x18)
          v9 = 3;
        if (v8 < 0xB)
          v9 = 2;
        if (v8 < 5)
          v9 = 1;
        if (v8 >= 3)
          v10 = v9;
        else
          v10 = 0;
        skit::internal::FieldSpanMatcherImpl::final_align_and_score<skit::SpanMatchV2>(v2, (float *)v7, *(_DWORD *)(a2 + 44), v6);
        v11 = v8 <= 2 && *(_BYTE *)(v2 + 602) == 0;
        if (v11 && *(_DWORD *)(v7 + 4) - *(_DWORD *)v7 > v8 && *(_DWORD *)(v7 + 8) > v10)
        {
          v12 = *(unsigned int *)(a2 + 56);
          v13 = *(_QWORD *)(a2 + 48) + 32 * v12;
          if (v13 != v7 + 32)
          {
            memmove((void *)v7, (const void *)(v7 + 32), v13 - (v7 + 32));
            LODWORD(v12) = *(_DWORD *)(a2 + 56);
          }
          v14 = v12 - 1;
          *(_DWORD *)(a2 + 56) = v14;
        }
        else
        {
          v7 += 32;
          v14 = *(_DWORD *)(a2 + 56);
        }
      }
      while (v7 != *(_QWORD *)(a2 + 48) + 32 * v14);
    }
  }
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  int *v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float *v21;

  v2 = *a1;
  if (*a1)
  {
    v4 = *(_QWORD *)v2;
    v5 = *(_QWORD *)(v2 + 8);
    if (*(_QWORD *)v2 == v5)
    {
      v6 = 0;
    }
    else
    {
      v6 = 0;
      do
      {
        v6 = *(_DWORD *)(v4 + 28) + v6 - *(_DWORD *)(v4 + 24);
        v4 += 48;
      }
      while (v4 != v5);
    }
    v7 = *(_DWORD *)(a2 + 24);
    if (v7)
    {
      v8 = *(_QWORD *)(a2 + 16);
      do
      {
        v9 = *(unsigned int *)(v8 + 8);
        if ((_DWORD)v9)
        {
          v10 = 0;
          v11 = 80 * v9;
          v12 = (int *)(*(_QWORD *)v8 + 44);
          do
          {
            v13 = *v12;
            v12 += 20;
            v10 += v13;
            v11 -= 80;
          }
          while (v11);
        }
        else
        {
          v10 = 0;
        }
        if (*(_DWORD *)(a2 + 12) <= v10)
          v14 = v10;
        else
          v14 = *(_DWORD *)(a2 + 12);
        if (v14)
        {
          v15 = *(_DWORD *)(v8 + 364) - *(_DWORD *)(v8 + 360);
          if (v15 < 0x34)
            v16 = 4;
          else
            v16 = 5;
          if (v15 < 0x18)
            v16 = 3;
          if (v15 < 0xB)
            v16 = 2;
          if (v15 < 5)
            v16 = 1;
          if (v15 >= 3)
            v17 = v16;
          else
            v17 = 0;
          skit::internal::FieldSpanMatcherImpl::final_align_and_score<skit::SpanMatchV2>(v2, (float *)(v8 + 360), v14, v6);
          if (*(_BYTE *)(v2 + 602)
            || *(_DWORD *)(v8 + 364) - *(_DWORD *)(v8 + 360) <= v15
            || *(_DWORD *)(v8 + 368) <= v17)
          {
            v19 = *(unsigned int *)(v8 + 8);
            if ((_DWORD)v19)
            {
              v20 = 80 * v19;
              v21 = (float *)(*(_QWORD *)v8 + 48);
              do
              {
                if (*((_DWORD *)v21 - 4))
                  skit::internal::FieldSpanMatcherImpl::final_align_and_score<skit::SpanMatchV2>(v2, v21, *((_DWORD *)v21 - 1), v6);
                v21 += 20;
                v20 -= 80;
              }
              while (v20);
            }
            v8 += 392;
            v7 = *(_DWORD *)(a2 + 24);
          }
          else
          {
            v18 = *(_QWORD *)(a2 + 16) + 392 * *(unsigned int *)(a2 + 24);
            std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,skit::MergedFieldMatchV2 *,skit::MergedFieldMatchV2 *,skit::MergedFieldMatchV2 *,0>(v8 + 392, v18, v8);
            skit::SmallVector<skit::MergedFieldMatchV2,8u,true>::_destroy<skit::MergedFieldMatchV2,(void *)0>(v18 - 392);
            v7 = *(_DWORD *)(a2 + 24) - 1;
            *(_DWORD *)(a2 + 24) = v7;
          }
        }
        else
        {
          *(_DWORD *)(v8 + 372) = 0;
          v8 += 392;
        }
      }
      while (v8 != *(_QWORD *)(a2 + 16) + 392 * v7);
    }
  }
}

_QWORD *skit::IndexReader::IndexReader(_QWORD *this)
{
  *this = 0;
  this[1] = 0;
  return this;
}

{
  *this = 0;
  this[1] = 0;
  return this;
}

_QWORD *skit::IndexReader::IndexReader(_QWORD *this, const skit::IndexReader *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *((_QWORD *)a2 + 1);
  *this = *(_QWORD *)a2;
  this[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return this;
}

{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *((_QWORD *)a2 + 1);
  *this = *(_QWORD *)a2;
  this[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return this;
}

__n128 skit::IndexReader::IndexReader(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  return result;
}

{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  return result;
}

skit::IndexReader *skit::IndexReader::IndexReader(skit::IndexReader *this, std::__fs::filesystem::path *a2)
{
  std::allocate_shared[abi:ne180100]<skit::internal::IndexReaderImpl,std::allocator<skit::internal::IndexReaderImpl>,std::__fs::filesystem::path,void>(this, (uint64_t)a2);
  return this;
}

{
  std::allocate_shared[abi:ne180100]<skit::internal::IndexReaderImpl,std::allocator<skit::internal::IndexReaderImpl>,std::__fs::filesystem::path,void>(this, (uint64_t)a2);
  return this;
}

void std::allocate_shared[abi:ne180100]<skit::internal::IndexReaderImpl,std::allocator<skit::internal::IndexReaderImpl>,std::__fs::filesystem::path,void>(_QWORD *a1, uint64_t a2)
{
  char *v4;
  std::string::size_type v5;
  char v6;
  std::__fs::filesystem::path __p;
  _BYTE v8[15];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = (char *)operator new(0x158uLL);
  *(_OWORD *)(v4 + 8) = 0u;
  *(_QWORD *)v4 = &off_1E8687410;
  *(_QWORD *)&v8[7] = *(_QWORD *)(a2 + 15);
  v5 = *(_QWORD *)a2;
  *(_QWORD *)v8 = *(_QWORD *)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 23);
  *(_QWORD *)(a2 + 16) = 0;
  *(_OWORD *)a2 = 0u;
  __p.__pn_.__r_.__value_.__r.__words[0] = v5;
  __p.__pn_.__r_.__value_.__l.__size_ = *(_QWORD *)v8;
  *(std::string::size_type *)((char *)&__p.__pn_.__r_.__value_.__r.__words[1] + 7) = *(_QWORD *)&v8[7];
  *((_BYTE *)&__p.__pn_.__r_.__value_.__s + 23) = v6;
  skit::internal::MultiIndexV2::MultiIndexV2((skit::internal::MultiIndexV2 *)(v4 + 24), &__p);
  if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__pn_.__r_.__value_.__l.__data_);
  *a1 = v4 + 24;
  a1[1] = v4;
}

void sub_1CB76746C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  std::__shared_weak_count *v14;
  void *v16;

  if (a14 < 0)
    operator delete(__p);
  std::__shared_weak_count::~__shared_weak_count(v14);
  operator delete(v16);
  _Unwind_Resume(a1);
}

skit::internal::MultiIndexV2 *skit::internal::MultiIndexV2::MultiIndexV2(skit::internal::MultiIndexV2 *this, std::__fs::filesystem::path *a2)
{
  __int128 v3;

  v3 = *(_OWORD *)&a2->__pn_.__r_.__value_.__l.__data_;
  *((_QWORD *)this + 2) = *((_QWORD *)&a2->__pn_.__r_.__value_.__l + 2);
  *(_OWORD *)this = v3;
  *(_OWORD *)&a2->__pn_.__r_.__value_.__r.__words[1] = 0uLL;
  a2->__pn_.__r_.__value_.__r.__words[0] = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_DWORD *)this + 20) = 1065353216;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 248) = 0u;
  *((_QWORD *)this + 33) = 0;
  *(_OWORD *)((char *)this + 184) = 0u;
  *((_DWORD *)this + 24) = 621942338;
  *((_DWORD *)this + 31) = 0;
  *(_QWORD *)((char *)this + 108) = 0;
  *(_QWORD *)((char *)this + 100) = 0;
  *(_QWORD *)((char *)this + 116) = 0;
  *((_OWORD *)this + 9) = 0u;
  *((int64x2_t *)this + 8) = vdupq_n_s64(1uLL);
  *((_QWORD *)this + 24) = 0;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_QWORD *)this + 22) = 0x40000000;
  skit::FlatSet<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::allocate_pimpl<>((_QWORD *)this + 23, 0x40000000, 1u);
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *((_DWORD *)this + 56) = -1;
  *(_OWORD *)((char *)this + 232) = xmmword_1CB76D2C0;
  *((_QWORD *)this + 32) = 0;
  *((_QWORD *)this + 33) = 0;
  *((_QWORD *)this + 31) = 0;
  *((_DWORD *)this + 68) = 0;
  *((_QWORD *)this + 35) = 10485760;
  *((_BYTE *)this + 288) = 0;
  *((_DWORD *)this + 73) = 4;
  *((_WORD *)this + 148) = 416;
  *((_QWORD *)this + 38) = 0;
  *((_QWORD *)this + 39) = 0;
  return this;
}

void sub_1CB7675C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  void **v3;
  void **v4;
  void *v6;
  va_list va;

  va_start(va, a2);
  v4 = v3;
  v6 = *v4;
  if (*v4)
  {
    *(_QWORD *)(v2 + 152) = v6;
    operator delete(v6);
  }
  std::__hash_table<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::__unordered_map_hasher<skit::internal::Term,std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::hash<skit::internal::Term>,std::equal_to<skit::internal::Term>,true>,std::__unordered_map_equal<skit::internal::Term,std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::equal_to<skit::internal::Term>,std::hash<skit::internal::Term>,true>,std::allocator<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>>>::~__hash_table(v2 + 48);
  std::vector<std::unique_ptr<skit::internal::IndexDiskImplV2>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  if (*(char *)(v2 + 23) < 0)
    operator delete(*(void **)v2);
  _Unwind_Resume(a1);
}

void std::vector<std::unique_ptr<skit::internal::IndexDiskImplV2>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void ***v2;
  void ***v4;
  void *v5;

  v1 = *a1;
  v2 = (void ***)**a1;
  if (v2)
  {
    v4 = (void ***)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
        std::unique_ptr<skit::internal::IndexDiskImplV2>::reset[abi:ne180100](--v4);
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__shared_ptr_emplace<skit::internal::IndexReaderImpl>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_1E8687410;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<skit::internal::IndexReaderImpl>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_1E8687410;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1D179DDB4);
}

void std::__shared_ptr_emplace<skit::internal::IndexReaderImpl>::__on_zero_shared(uint64_t a1, std::error_code *a2)
{
  skit::internal::MultiIndexV2::~MultiIndexV2((skit::internal::MultiIndexV2 *)(a1 + 24), a2);
}

void skit::internal::MultiIndexV2::~MultiIndexV2(skit::internal::MultiIndexV2 *this, std::error_code *a2)
{
  skit::internal::BlobFile *v3;
  uint64_t v4;
  void *v5;
  void **v6;

  v3 = (skit::internal::MultiIndexV2 *)((char *)this + 200);
  skit::internal::BlobFile::clear((skit::internal::MultiIndexV2 *)((char *)this + 200), a2);
  skit::internal::BlobFile::~BlobFile(v3);
  v4 = *((_QWORD *)this + 23);
  *((_QWORD *)this + 23) = 0;
  if (v4)
    (*((void (**)(void))this + 24))();
  v5 = (void *)*((_QWORD *)this + 18);
  if (v5)
  {
    *((_QWORD *)this + 19) = v5;
    operator delete(v5);
  }
  std::__hash_table<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::__unordered_map_hasher<skit::internal::Term,std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::hash<skit::internal::Term>,std::equal_to<skit::internal::Term>,true>,std::__unordered_map_equal<skit::internal::Term,std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::equal_to<skit::internal::Term>,std::hash<skit::internal::Term>,true>,std::allocator<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>>>::~__hash_table((uint64_t)this + 48);
  v6 = (void **)((char *)this + 24);
  std::vector<std::unique_ptr<skit::internal::IndexDiskImplV2>>::__destroy_vector::operator()[abi:ne180100](&v6);
  if (*((char *)this + 23) < 0)
    operator delete(*(void **)this);
}

void skit::IndexReader::~IndexReader(skit::IndexReader *this)
{
  void ****v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  v2 = *(void *****)this;
  if (v2)
    skit::internal::MultiIndexV2::close(v2);
  v3 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
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
}

_QWORD *skit::IndexReader::operator=(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v4 = *a2;
  v3 = a2[1];
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return a1;
}

uint64_t skit::IndexReader::operator=(uint64_t a1, __int128 *a2)
{
  __int128 v3;
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;

  v3 = *a2;
  *(_QWORD *)a2 = 0;
  *((_QWORD *)a2 + 1) = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
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
  return a1;
}

uint64_t skit::IndexReader::exists(skit::IndexReader *this)
{
  uint64_t result;

  result = *(_QWORD *)this;
  if (result)
  {
    if (*(char *)(result + 23) < 0)
      result = *(_QWORD *)result;
    return access((const char *)result, 0) == 0;
  }
  return result;
}

BOOL skit::IndexReader::is_open(skit::IndexReader *this)
{
  return *(_QWORD *)this && *(_BYTE *)(*(_QWORD *)this + 288) != 0;
}

uint64_t skit::IndexReader::open(const char **this)
{
  const char *v1;
  const char *v2;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *this;
  if (*this)
  {
    v2 = *this;
    if (v1[23] < 0)
      v2 = *(const char **)v1;
    if (!access(v2, 0))
      return skit::internal::MultiIndexV2::open((const std::__fs::filesystem::path *)v1);
    if (skit::internal::get_logging_context(void)::once != -1)
    v4 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      if (v1[23] < 0)
        v1 = *(const char **)v1;
      v5 = 136446210;
      v6 = v1;
      _os_log_error_impl(&dword_1CB748000, v4, OS_LOG_TYPE_ERROR, "IndexReaderImpl::open : index does not exist @ %{public}s", (uint8_t *)&v5, 0xCu);
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t skit::IndexReader::close(void *****this)
{
  void ****v1;

  v1 = *this;
  if (!v1)
    return 0xFFFFFFFFLL;
  skit::internal::MultiIndexV2::close(v1);
  return 0;
}

uint64_t *skit::IndexReader::populate_docs(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *i;
  uint64_t v6;

  v2 = *result;
  if (*result)
  {
    v3 = *(uint64_t **)(v2 + 24);
    for (i = *(uint64_t **)(v2 + 32);
          v3 != i;
          result = (uint64_t *)skit::internal::DiskMetaStore::populate_doc(v6 + 168, *a2, a2[1]))
    {
      v6 = *v3++;
    }
  }
  return result;
}

unint64_t skit::IndexReader::get_doc(uint64_t a1, skit::internal *this)
{
  if (*(_QWORD *)a1)
    return skit::internal::MultiIndexV2::get_doc<skit::Uuid>(*(uint64_t **)(*(_QWORD *)a1 + 24), *(uint64_t **)(*(_QWORD *)a1 + 32), this);
  else
    return 0;
}

unint64_t skit::internal::MultiIndexV2::get_doc<skit::Uuid>(uint64_t *a1, uint64_t *a2, skit::internal *this)
{
  uint64_t *v5;
  uint64_t v6;
  _DWORD *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  if (a1 == a2)
    return 0;
  v5 = a1;
  while (1)
  {
    v6 = *v5;
    v7 = *(_DWORD **)(*v5 + 224);
    if (v7)
    {
      v8 = skit::internal::murmur3_32(this, 0x10uLL, 0);
      v9 = v7[1];
      v10 = 16 * ((*v7 ^ (v8 >> 7)) % v9);
      v11 = 16 * v9;
      v12 = (uint64_t)&v7[v11 / 4 + 4];
      while (1)
      {
        v13 = v10;
        v14 = *((unsigned __int8 *)v7 + v10 + 16);
        if (v14 == (v8 & 0x7F))
        {
          v15 = (uint64_t *)(v12 + 20 * v13);
          v17 = *v15;
          v16 = v15[1];
          if (*(_QWORD *)this == v17 && *((_QWORD *)this + 1) == v16)
            break;
        }
        if (v14 == 128)
          goto LABEL_13;
        v10 = ((int)v13 + 1) % v11;
      }
      if ((_DWORD)v11 - 1 != v13)
        break;
    }
LABEL_13:
    if (++v5 == a2)
      return 0;
  }
  if (!*(_QWORD *)(v6 + 288))
    return 0;
  return skit::internal::DiskMetaStore::get_doc_internal((skit::internal::DiskMetaStore *)(v6 + 168), *(_DWORD *)(v12 + 20 * v13 + 16));
}

unint64_t skit::IndexReader::get_doc(skit::IndexReader *this, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  if (*(_QWORD *)this)
    return skit::internal::MultiIndexV2::get_doc<long long>(*(uint64_t **)(*(_QWORD *)this + 24), *(uint64_t **)(*(_QWORD *)this + 32), &v3);
  else
    return 0;
}

unint64_t skit::internal::MultiIndexV2::get_doc<long long>(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a1 == a2)
    return 0;
  v3 = *a3;
  while (1)
  {
    v4 = *a1;
    v5 = *(_QWORD *)(*a1 + 192);
    v6 = *(_QWORD *)(v5 + 32);
    if (v3 >= v6 && *(_QWORD *)(v5 + 40) > v3)
      break;
    if (++a1 == a2)
      return 0;
  }
  if (!*(_QWORD *)(v4 + 288))
    return 0;
  return skit::internal::DiskMetaStore::get_doc_internal((skit::internal::DiskMetaStore *)(v4 + 168), (int)v3 - (int)v6);
}

void skit::IndexReader::search(_QWORD **a1, unint64_t *a2, _QWORD *a3, uint64_t a4)
{
  _QWORD *v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = *a1;
  if (v4)
  {
    skit::internal::MultiIndexV2::search(v4, a2, a3, *(_DWORD *)(a4 + 4), *(_DWORD *)(a4 + 8), *(_DWORD *)(a4 + 12), *(_DWORD *)(a4 + 16), *(unsigned __int8 *)(a4 + 24), *(float *)(a4 + 20));
  }
  else
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v5 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1CB748000, v5, OS_LOG_TYPE_ERROR, "IndexReader::search : reader is not initialized", v6, 2u);
    }
  }
}

uint64_t skit::IndexReader::segment_cnt(skit::IndexReader *this)
{
  if (*(_QWORD *)this)
    return (*(_QWORD *)(*(_QWORD *)this + 32) - *(_QWORD *)(*(_QWORD *)this + 24)) >> 3;
  else
    return 0;
}

uint64_t skit::IndexReader::size_bytes(skit::IndexReader *this)
{
  if (*(_QWORD *)this)
    return skit::internal::MultiIndexV2::disk_index_size(*(skit::internal::IndexDiskImplV2 ***)(*(_QWORD *)this + 24), *(skit::internal::MultiIndexV2 **)(*(_QWORD *)this + 32));
  else
    return 0;
}

uint64_t skit::IndexReader::size(skit::IndexReader *this)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)this;
  if (!*(_QWORD *)this)
    return 0;
  v2 = *(uint64_t **)(v1 + 24);
  v3 = *(uint64_t **)(v1 + 32);
  if (v2 == v3)
  {
    v4 = 0;
  }
  else
  {
    v4 = 0;
    do
    {
      v5 = *v2++;
      v4 += *(unsigned int *)(*(_QWORD *)(v5 + 192) + 12);
    }
    while (v2 != v3);
  }
  return v4 + *(unsigned int *)(v1 + 108);
}

uint64_t skit::IndexReader::record_cnt(skit::IndexReader *this)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)this;
  if (!*(_QWORD *)this)
    return 0;
  v2 = *(uint64_t **)(v1 + 24);
  v3 = *(uint64_t **)(v1 + 32);
  if (v2 == v3)
  {
    v4 = 0;
  }
  else
  {
    v4 = 0;
    do
    {
      v5 = *v2++;
      v4 += (*(_DWORD *)(*(_QWORD *)(v5 + 192) + 12) - *(_DWORD *)(*(_QWORD *)(v5 + 192) + 16));
    }
    while (v2 != v3);
  }
  return v4 + (*(_DWORD *)(v1 + 108) - *(_DWORD *)(v1 + 112));
}

uint64_t skit::IndexReader::last_ts(skit::IndexReader *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)this;
  if (!*(_QWORD *)this)
    return 0;
  v3 = *(_QWORD *)(v1 + 24);
  v2 = *(_QWORD *)(v1 + 32);
  if (v3 == v2)
    return -1;
  v4 = *(_QWORD *)(*(_QWORD *)(v2 - 8) + 24);
  if (!v4)
    return -1;
  else
    return *(_QWORD *)(v4 + 32);
}

uint64_t skit::IndexReader::index_count_threshold(skit::IndexReader *this, unint64_t a2)
{
  if (*(_QWORD *)this)
    return skit::internal::MultiIndexV2::index_count_threshold(*(skit::internal::IndexDiskImplV2 ***)(*(_QWORD *)this + 24), *(skit::internal::MultiIndexV2 **)(*(_QWORD *)this + 32), a2);
  else
    return 0;
}

skit::internal::MultiIndexV2 *skit::IndexReader::should_merge(skit::internal::MultiIndexV2 **this, unint64_t a2)
{
  skit::internal::MultiIndexV2 *result;

  result = *this;
  if (result)
    return (skit::internal::MultiIndexV2 *)skit::internal::MultiIndexV2::should_merge(result, a2);
  return result;
}

_QWORD *skit::IndexWriter::IndexWriter(_QWORD *this)
{
  *this = 0;
  return this;
}

{
  *this = 0;
  return this;
}

_QWORD *skit::IndexWriter::IndexWriter(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *a2 = 0;
  *result = v2;
  return result;
}

{
  uint64_t v2;

  v2 = *a2;
  *a2 = 0;
  *result = v2;
  return result;
}

uint64_t *skit::IndexWriter::IndexWriter(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v7 = a2;
  *((_QWORD *)&v7 + 1) = a3;
  std::make_unique[abi:ne180100]<skit::internal::IndexWriterImpl,skit::Uuid,std::__fs::filesystem::path,std::__fs::filesystem::path>(a1, &v7, a4, a5);
  return a1;
}

{
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v7 = a2;
  *((_QWORD *)&v7 + 1) = a3;
  std::make_unique[abi:ne180100]<skit::internal::IndexWriterImpl,skit::Uuid,std::__fs::filesystem::path,std::__fs::filesystem::path>(a1, &v7, a4, a5);
  return a1;
}

void std::make_unique[abi:ne180100]<skit::internal::IndexWriterImpl,skit::Uuid,std::__fs::filesystem::path,std::__fs::filesystem::path>(uint64_t *a1, __int128 *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  char v11;
  std::string::size_type v12;
  char v13;
  uint64_t v14;
  std::__fs::filesystem::path __p;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = operator new();
  v9 = *a2;
  v10 = *a3;
  v17[0] = a3[1];
  *(_QWORD *)((char *)v17 + 7) = *(uint64_t *)((char *)a3 + 15);
  v11 = *((_BYTE *)a3 + 23);
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  v12 = *(_QWORD *)a4;
  v16[0] = *(_QWORD *)(a4 + 8);
  *(_QWORD *)((char *)v16 + 7) = *(_QWORD *)(a4 + 15);
  v13 = *(_BYTE *)(a4 + 23);
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)a4 = 0;
  *(_OWORD *)v8 = v9;
  v14 = v17[0];
  *(_QWORD *)(v8 + 16) = v10;
  *(_QWORD *)(v8 + 24) = v14;
  *(_QWORD *)(v8 + 31) = *(_QWORD *)((char *)v17 + 7);
  *(_BYTE *)(v8 + 39) = v11;
  __p.__pn_.__r_.__value_.__r.__words[0] = v12;
  __p.__pn_.__r_.__value_.__l.__size_ = v16[0];
  *(std::string::size_type *)((char *)&__p.__pn_.__r_.__value_.__r.__words[1] + 7) = *(_QWORD *)((char *)v16 + 7);
  *((_BYTE *)&__p.__pn_.__r_.__value_.__s + 23) = v13;
  skit::internal::MultiIndexV2::MultiIndexV2((skit::internal::MultiIndexV2 *)(v8 + 40), &__p);
  if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__pn_.__r_.__value_.__l.__data_);
  *(_WORD *)(v8 + 360) = 0;
  *a1 = v8;
}

void sub_1CB76805C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;

  if (a14 < 0)
    operator delete(__p);
  if (*(char *)(v14 + 39) < 0)
    operator delete(*(void **)(v14 + 16));
  MEMORY[0x1D179DDB4](v14, 0x10B2C40BCEBC9ECLL);
  _Unwind_Resume(a1);
}

uint64_t *skit::IndexWriter::operator=(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  *a2 = 0;
  std::unique_ptr<skit::internal::IndexWriterImpl>::reset[abi:ne180100](a1, v3);
  return a1;
}

uint64_t *std::unique_ptr<skit::internal::IndexWriterImpl>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2;
  std::error_code *v3;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    skit::internal::IndexWriterImpl::abort_txn(v2);
    skit::internal::MultiIndexV2::~MultiIndexV2((skit::internal::MultiIndexV2 *)(v2 + 40), v3);
    if (*(char *)(v2 + 39) < 0)
      operator delete(*(void **)(v2 + 16));
    JUMPOUT(0x1D179DDB4);
  }
  return result;
}

void skit::IndexWriter::~IndexWriter(skit::IndexWriter *this)
{
  uint64_t v2;

  v2 = *(_QWORD *)this;
  if (v2)
    skit::internal::IndexWriterImpl::abort_txn(v2);
  std::unique_ptr<skit::internal::IndexWriterImpl>::reset[abi:ne180100]((uint64_t *)this, 0);
}

void *skit::IndexWriter::id(skit::IndexWriter *this)
{
  if (*(_QWORD *)this)
    return *(void **)this;
  else
}

uint64_t skit::IndexWriter::set_mode(uint64_t this, __int16 a2)
{
  if (*(_QWORD *)this)
    *(_WORD *)(*(_QWORD *)this + 336) = a2 & 0x1FF;
  return this;
}

void skit::IndexWriter::set_dp_class(skit::IndexWriter *this, int a2)
{
  uint64_t v2;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)this;
  if (*(_QWORD *)this)
  {
    if ((a2 - 8) <= 0xFFFFFFF6)
    {
      if (skit::internal::get_logging_context(void)::once != -1)
      v4 = skit::internal::get_logging_context(void)::logger;
      if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_FAULT))
      {
        v5[0] = 67109120;
        v5[1] = a2;
        _os_log_fault_impl(&dword_1CB748000, v4, OS_LOG_TYPE_FAULT, "MultiIndexV2 : invalid protection class %d", (uint8_t *)v5, 8u);
      }
    }
    *(_DWORD *)(v2 + 332) = a2;
  }
}

uint64_t skit::IndexWriter::set_term_index_write_cache(uint64_t this, uint64_t a2)
{
  if (*(_QWORD *)this)
    *(_QWORD *)(*(_QWORD *)this + 344) = a2;
  return this;
}

uint64_t skit::IndexWriter::set_doc_store_write_cache(uint64_t this, uint64_t a2)
{
  if (*(_QWORD *)this)
    *(_QWORD *)(*(_QWORD *)this + 352) = a2;
  return this;
}

BOOL skit::IndexWriter::is_active(skit::IndexWriter *this)
{
  return *(_QWORD *)this && *(_BYTE *)(*(_QWORD *)this + 360) != 0;
}

uint64_t skit::IndexWriter::start_txn(skit::IndexWriter *this)
{
  uint64_t v1;
  NSObject *v2;
  const char **v3;
  const char **v4;
  const char *v5;
  const char **v6;
  const char *v7;
  uint64_t result;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char **v20;
  __int16 v21;
  const char **v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)this;
  if (!*(_QWORD *)this)
    return 0xFFFFFFFFLL;
  if (skit::internal::get_logging_context(void)::once != -1)
  v2 = skit::internal::get_logging_context(void)::logger;
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_INFO))
  {
    v3 = (const char **)(v1 + 16);
    if (*(char *)(v1 + 39) < 0)
      v3 = (const char **)*v3;
    v15 = 68289282;
    v16 = 16;
    v17 = 2098;
    v18 = v1;
    v19 = 2082;
    v20 = v3;
    _os_log_impl(&dword_1CB748000, v2, OS_LOG_TYPE_INFO, "IndexWriterImpl::start_txn : starting transaction %{public,uuid_t}.16P @ %{public}s", (uint8_t *)&v15, 0x1Cu);
  }
  if (*(_BYTE *)(v1 + 360))
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v9 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_FAULT))
      return 0xFFFFFFFFLL;
    v15 = 68289026;
    v16 = 16;
    v17 = 2098;
    v18 = v1;
    v10 = "IndexWriterImpl::start_txn : transaction %{public,uuid_t}.16P has already been started";
    v11 = v9;
    v12 = 18;
LABEL_29:
    _os_log_fault_impl(&dword_1CB748000, v11, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v15, v12);
    return 0xFFFFFFFFLL;
  }
  v4 = (const char **)(v1 + 16);
  v5 = (const char *)(v1 + 16);
  if (*(char *)(v1 + 39) < 0)
    v5 = *v4;
  v6 = (const char **)(v1 + 40);
  v7 = (const char *)(v1 + 40);
  if (*(char *)(v1 + 63) < 0)
    v7 = *v6;
  if (copyfile(v5, v7, 0, 0x10E800Fu))
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v13 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_FAULT))
      return 0xFFFFFFFFLL;
    if (*(char *)(v1 + 39) < 0)
      v4 = (const char **)*v4;
    if (*(char *)(v1 + 63) < 0)
      v6 = (const char **)*v6;
    v14 = *__error();
    v15 = 68289794;
    v16 = 16;
    v17 = 2098;
    v18 = v1;
    v19 = 2082;
    v20 = v4;
    v21 = 2082;
    v22 = v6;
    v23 = 1024;
    v24 = v14;
    v10 = "IndexWriterImpl::start_txn : transaction %{public,uuid_t}.16P file clone failed @ %{public}s  ->  %{public}s :"
          " %{darwin.errno}d";
    v11 = v13;
    v12 = 44;
    goto LABEL_29;
  }
  result = skit::internal::MultiIndexV2::open((const std::__fs::filesystem::path *)(v1 + 40));
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  *(_BYTE *)(v1 + 360) = 1;
  return result;
}

uint64_t skit::IndexWriter::end_txn(skit::IndexWriter *this)
{
  uint64_t v1;
  const char **v2;
  const char *v3;
  const char *v4;
  const char **v5;
  const char *v6;
  const std::__fs::filesystem::path *v7;
  const char **v8;
  const char *v9;
  int v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t result;
  _QWORD *v16;
  const char *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  const char *v25;
  int v26;
  int v27;
  int v28;
  _BYTE v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)this;
  if (!*(_QWORD *)this)
    return 0xFFFFFFFFLL;
  if (!*(_BYTE *)(v1 + 360))
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v19 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_FAULT))
    {
      v28 = 68289026;
      *(_DWORD *)v29 = 16;
      *(_WORD *)&v29[4] = 2098;
      *(_QWORD *)&v29[6] = v1;
      _os_log_fault_impl(&dword_1CB748000, v19, OS_LOG_TYPE_FAULT, "IndexWriterImpl::end_txn : transaction %{public,uuid_t}.16P is not active", (uint8_t *)&v28, 0x12u);
    }
    return 0xFFFFFFFFLL;
  }
  v2 = (const char **)(v1 + 40);
  skit::internal::MultiIndexV2::close((void ****)(v1 + 40));
  if (*(_BYTE *)(v1 + 361))
  {
    v4 = (const char *)(v1 + 40);
    if (*(char *)(v1 + 63) < 0)
      v4 = *v2;
    v5 = (const char **)(v1 + 16);
    v6 = (const char *)(v1 + 16);
    if (*(char *)(v1 + 39) < 0)
      v6 = *v5;
    if (renamex_np(v4, v6, 2u))
    {
      if (skit::internal::get_logging_context(void)::once != -1)
      v22 = skit::internal::get_logging_context(void)::logger;
      if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      {
        if (*(char *)(v1 + 63) < 0)
          v2 = (const char **)*v2;
        if (*(char *)(v1 + 39) < 0)
          v5 = (const char **)*v5;
        v26 = *__error();
        v28 = 136446722;
        *(_QWORD *)v29 = v2;
        *(_WORD *)&v29[8] = 2082;
        *(_QWORD *)&v29[10] = v5;
        *(_WORD *)&v29[18] = 1024;
        *(_DWORD *)&v29[20] = v26;
        _os_log_error_impl(&dword_1CB748000, v22, OS_LOG_TYPE_ERROR, "IndexWriterImpl::end_txn : failed to move transaction directory @ %{public}s ->  %{public}s : %{darwin.errno}d", (uint8_t *)&v28, 0x1Cu);
      }
      skit::internal::IndexWriterImpl::abort_txn(v1);
      return 0xFFFFFFFFLL;
    }
  }
  v7 = (const std::__fs::filesystem::path *)(v1 + 40);
  if (*(char *)(v1 + 63) < 0)
    v7 = (const std::__fs::filesystem::path *)*v2;
  if (skit::internal::remove_all(v7, v3))
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v20 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      if (*(char *)(v1 + 63) < 0)
        v2 = (const char **)*v2;
      v21 = *__error();
      v28 = 136446466;
      *(_QWORD *)v29 = v2;
      *(_WORD *)&v29[8] = 1024;
      *(_DWORD *)&v29[10] = v21;
      _os_log_error_impl(&dword_1CB748000, v20, OS_LOG_TYPE_ERROR, "IndexWriterImpl::end_txn : failed to remove transaction directory @ %{public}s : %{darwin.errno}d", (uint8_t *)&v28, 0x12u);
    }
  }
  if (!*(_BYTE *)(v1 + 361))
    goto LABEL_21;
  v8 = (const char **)(v1 + 16);
  v9 = (const char *)(v1 + 16);
  if (*(char *)(v1 + 39) < 0)
    v9 = *v8;
  v10 = open(v9, 0);
  if (v10 < 0)
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v23 = skit::internal::get_logging_context(void)::logger;
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      goto LABEL_55;
    if (*(char *)(v1 + 39) < 0)
      v8 = (const char **)*v8;
    v24 = *__error();
    v28 = 136315394;
    *(_QWORD *)v29 = v8;
    *(_WORD *)&v29[8] = 1024;
    *(_DWORD *)&v29[10] = v24;
    v25 = "IndexWriterImpl::end_txn : failed to open index directory @ %s : %{darwin.errno}d";
LABEL_64:
    _os_log_error_impl(&dword_1CB748000, v23, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v28, 0x12u);
LABEL_21:
    v13 = skit::internal::get_logging_context(void)::once;
    *(_WORD *)(v1 + 360) = 0;
    if (v13 != -1)
    goto LABEL_23;
  }
  v11 = v10;
  if (fcntl(v10, 85))
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v12 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      v17 = (const char *)(v1 + 16);
      if (*(char *)(v1 + 39) < 0)
        v17 = *v8;
      v18 = *__error();
      v28 = 136315394;
      *(_QWORD *)v29 = v17;
      *(_WORD *)&v29[8] = 1024;
      *(_DWORD *)&v29[10] = v18;
      _os_log_error_impl(&dword_1CB748000, v12, OS_LOG_TYPE_ERROR, "IndexWriterImpl::end_txn : failed fcntl barrier @ %s : %{darwin.errno}d", (uint8_t *)&v28, 0x12u);
    }
  }
  if (!close(v11))
    goto LABEL_21;
  if (skit::internal::get_logging_context(void)::once != -1)
  v23 = skit::internal::get_logging_context(void)::logger;
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    if (*(char *)(v1 + 39) < 0)
      v8 = (const char **)*v8;
    v27 = *__error();
    v28 = 136315394;
    *(_QWORD *)v29 = v8;
    *(_WORD *)&v29[8] = 1024;
    *(_DWORD *)&v29[10] = v27;
    v25 = "IndexWriterImpl::end_txn : failed to close index directory @ %s : %{darwin.errno}d";
    goto LABEL_64;
  }
LABEL_55:
  *(_WORD *)(v1 + 360) = 0;
LABEL_23:
  v14 = skit::internal::get_logging_context(void)::logger;
  result = os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_INFO);
  if ((_DWORD)result)
  {
    v16 = (_QWORD *)(v1 + 16);
    if (*(char *)(v1 + 39) < 0)
      v16 = (_QWORD *)*v16;
    v28 = 68158210;
    *(_DWORD *)v29 = 16;
    *(_WORD *)&v29[4] = 2096;
    *(_QWORD *)&v29[6] = v1;
    *(_WORD *)&v29[14] = 2082;
    *(_QWORD *)&v29[16] = v16;
    _os_log_impl(&dword_1CB748000, v14, OS_LOG_TYPE_INFO, "IndexWriterImpl::end_txn : completed transaction %{uuid_t}.16P @ %{public}s", (uint8_t *)&v28, 0x1Cu);
    return 0;
  }
  return result;
}

uint64_t skit::IndexWriter::abort_txn(skit::IndexWriter *this)
{
  uint64_t v1;

  v1 = *(_QWORD *)this;
  if (!v1)
    return 0xFFFFFFFFLL;
  skit::internal::IndexWriterImpl::abort_txn(v1);
  return 0;
}

uint64_t skit::IndexWriter::append(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, iovec *a5, int a6, float a7)
{
  uint64_t v7;

  v7 = *a1;
  if (!*a1)
    return 0;
  *(_BYTE *)(v7 + 361) = 1;
  return skit::internal::MultiIndexV2::append(v7 + 40, *a2, a2[1], a3, a4, a5, a6, 1, a7);
}

uint64_t skit::IndexWriter::append(uint64_t *a1, unsigned __int8 *a2, uint64_t *a3, uint64_t a4, uint64_t a5, iovec *a6, int a7, float a8)
{
  uint64_t v8;
  int v9;

  v8 = *a1;
  if (!*a1)
    return 0;
  v9 = *a2;
  *(_BYTE *)(v8 + 361) = 1;
  return skit::internal::MultiIndexV2::append(v8 + 40, *a3, a3[1], a4, a5, a6, a7, v9, a8);
}

uint64_t skit::IndexWriter::clear(char **this)
{
  char *v1;
  int v2;
  NSObject *v4;
  _QWORD *v5;
  _DWORD v6[2];
  __int16 v7;
  char *v8;
  __int16 v9;
  _QWORD *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = *this;
  if (!*this || !v1[360])
    return 0xFFFFFFFFLL;
  v1[361] = 1;
  skit::internal::MultiIndexV2::clear((skit::internal::MultiIndexV2 *)(v1 + 40));
  v2 = skit::internal::MultiIndexV2::open((const std::__fs::filesystem::path *)(v1 + 40));
  if (v2)
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v4 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_INFO))
    {
      v5 = v1 + 16;
      if (v1[39] < 0)
        v5 = (_QWORD *)*v5;
      v6[0] = 68289282;
      v6[1] = 16;
      v7 = 2098;
      v8 = v1;
      v9 = 2082;
      v10 = v5;
      _os_log_impl(&dword_1CB748000, v4, OS_LOG_TYPE_INFO, "IndexWriterImpl::abort_txn : clear  transaction %{public,uuid_t}.16P @ %{public}s", (uint8_t *)v6, 0x1Cu);
    }
  }
  if (v2)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t skit::IndexWriter::flush(skit::IndexWriter *this)
{
  if (*(_QWORD *)this)
    return skit::internal::MultiIndexV2::flush((skit::internal::MultiIndexV2 *)(*(_QWORD *)this + 40));
  else
    return 0xFFFFFFFFLL;
}

uint64_t skit::IndexWriter::flush_threshold(skit::IndexWriter *this)
{
  if (*(_QWORD *)this)
    return *(_QWORD *)(*(_QWORD *)this + 320);
  else
    return 0;
}

uint64_t skit::IndexWriter::flush_threshold(uint64_t this, unint64_t a2)
{
  unint64_t v2;

  if (*(_QWORD *)this)
  {
    v2 = 100663296;
    if (a2 < 0x6000000)
      v2 = a2;
    if (v2 <= 0x100000)
      v2 = 0x100000;
    *(_QWORD *)(*(_QWORD *)this + 320) = v2;
  }
  return this;
}

uint64_t skit::IndexWriter::segment_cnt(skit::IndexWriter *this)
{
  if (*(_QWORD *)this)
    return (*(_QWORD *)(*(_QWORD *)this + 72) - *(_QWORD *)(*(_QWORD *)this + 64)) >> 3;
  else
    return 0;
}

uint64_t skit::IndexWriter::size_bytes(skit::IndexWriter *this)
{
  if (*(_QWORD *)this)
    return skit::internal::MultiIndexV2::disk_index_size(*(skit::internal::IndexDiskImplV2 ***)(*(_QWORD *)this + 64), *(skit::internal::MultiIndexV2 **)(*(_QWORD *)this + 72));
  else
    return 0;
}

uint64_t skit::IndexWriter::size(skit::IndexWriter *this)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)this;
  if (!*(_QWORD *)this)
    return 0;
  v2 = *(uint64_t **)(v1 + 64);
  v3 = *(uint64_t **)(v1 + 72);
  if (v2 == v3)
  {
    v4 = 0;
  }
  else
  {
    v4 = 0;
    do
    {
      v5 = *v2++;
      v4 += *(unsigned int *)(*(_QWORD *)(v5 + 192) + 12);
    }
    while (v2 != v3);
  }
  return v4 + *(unsigned int *)(v1 + 148);
}

uint64_t skit::IndexWriter::record_cnt(skit::IndexWriter *this)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)this;
  if (!*(_QWORD *)this)
    return 0;
  v2 = *(uint64_t **)(v1 + 64);
  v3 = *(uint64_t **)(v1 + 72);
  if (v2 == v3)
  {
    v4 = 0;
  }
  else
  {
    v4 = 0;
    do
    {
      v5 = *v2++;
      v4 += (*(_DWORD *)(*(_QWORD *)(v5 + 192) + 12) - *(_DWORD *)(*(_QWORD *)(v5 + 192) + 16));
    }
    while (v2 != v3);
  }
  return v4 + (*(_DWORD *)(v1 + 148) - *(_DWORD *)(v1 + 152));
}

uint64_t skit::IndexWriter::last_ts(skit::IndexWriter *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)this;
  if (!*(_QWORD *)this)
    return 0;
  v3 = *(_QWORD *)(v1 + 64);
  v2 = *(_QWORD *)(v1 + 72);
  if (v3 == v2)
    return -1;
  v4 = *(_QWORD *)(*(_QWORD *)(v2 - 8) + 24);
  if (!v4)
    return -1;
  else
    return *(_QWORD *)(v4 + 32);
}

uint64_t skit::IndexWriter::index_count_threshold(skit::IndexWriter *this, unint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)this;
  if (*(_QWORD *)this && *(_BYTE *)(v2 + 360))
    return skit::internal::MultiIndexV2::index_count_threshold(*(skit::internal::IndexDiskImplV2 ***)(v2 + 64), *(skit::internal::MultiIndexV2 **)(v2 + 72), a2);
  else
    return 0;
}

BOOL skit::IndexWriter::should_merge(skit::IndexWriter *this)
{
  uint64_t v1;

  v1 = *(_QWORD *)this;
  return *(_QWORD *)this
      && *(_BYTE *)(v1 + 360)
      && skit::internal::MultiIndexV2::should_merge((skit::internal::MultiIndexV2 *)(v1 + 40), *(_QWORD *)(v1 + 320));
}

uint64_t skit::IndexWriter::merge_indexes(skit::IndexWriter *this)
{
  if (*(_QWORD *)this)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

BOOL skit::IndexWriter::set_doc_wgt(uint64_t *a1, skit::internal *this, float a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  v3 = *a1;
  if (!*a1)
    return 0;
  *(_BYTE *)(v3 + 361) = 1;
  v6 = *(_QWORD *)(v3 + 64);
  v7 = *(_QWORD *)(v3 + 72);
  while (1)
  {
    if (v6 == v7)
      return skit::internal::MemMetaStore::set_doc_wgt(v3 + 136, this, a3);
    if ((skit::internal::DiskMetaStore::set_doc_wgt((_QWORD *)(*(_QWORD *)v6 + 168), this, a3) & 1) != 0)
      break;
    v6 += 8;
  }
  return 1;
}

unint64_t skit::IndexWriter::get_doc(uint64_t a1, skit::internal *this)
{
  if (*(_QWORD *)a1)
    return skit::internal::MultiIndexV2::get_doc<skit::Uuid>(*(uint64_t **)(*(_QWORD *)a1 + 64), *(uint64_t **)(*(_QWORD *)a1 + 72), this);
  else
    return 0;
}

unint64_t skit::IndexWriter::get_doc(skit::IndexWriter *this, uint64_t a2)
{
  uint64_t v3;

  v3 = a2;
  if (*(_QWORD *)this)
    return skit::internal::MultiIndexV2::get_doc<long long>(*(uint64_t **)(*(_QWORD *)this + 64), *(uint64_t **)(*(_QWORD *)this + 72), &v3);
  else
    return 0;
}

BOOL skit::IndexWriter::erase(uint64_t *a1, __int128 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  if (!*a1)
    return 0;
  *(_BYTE *)(v2 + 361) = 1;
  v6 = *a2;
  v3 = *(_QWORD *)(v2 + 64);
  v4 = *(_QWORD *)(v2 + 72);
  while (1)
  {
    if (v3 == v4)
      return skit::internal::MemMetaStore::set_doc_wgt(v2 + 136, (skit::internal *)&v6, 0.0);
    if ((skit::internal::DiskMetaStore::set_doc_wgt((_QWORD *)(*(_QWORD *)v3 + 168), (skit::internal *)&v6, 0.0) & 1) != 0)
      break;
    v3 += 8;
  }
  return 1;
}

void skit::NumberFilter::~NumberFilter(skit::NumberFilter *this)
{
  JUMPOUT(0x1D179DDB4);
}

void skit::NumberFilter::filter(skit::NumberFilter *this, skit::TokenStream *a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v7;

  v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 1) - *(_QWORD *)a2) >> 4);
  v4 = v3 - a3;
  if (v3 > a3)
  {
    v7 = 48 * a3;
    do
    {
      skit::NumberFilter::filter((uint64_t)this, (float *)(*(_QWORD *)a2 + v7));
      v7 += 48;
      --v4;
    }
    while (v4);
  }
}

BOOL skit::NumberFilter::filter(uint64_t a1, _WORD *a2, unint64_t a3)
{
  unint64_t v3;
  unsigned int v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  int v8;

  v3 = ((*a2 - 43) & 0xFFFD) == 0;
  if (a3 <= v3)
    return 0;
  v4 = 0;
  v5 = 0;
  v6 = v3 + 1;
  v7 = ((*a2 - 43) & 0xFFFD) == 0;
  do
  {
    v8 = (unsigned __int16)a2[v7];
    if (v8 == 46)
      ++v4;
    if ((v8 - 48) < 0xA)
      ++v5;
    v7 = v6;
  }
  while (a3 > v6++);
  return v4 <= 1 && v5 != 0 && a3 == v5 + (_DWORD)v3 + v4;
}

void `non-virtual thunk to'skit::NumberFilter::~NumberFilter(skit::NumberFilter *this)
{
  JUMPOUT(0x1D179DDB4);
}

float skit::NumberFilter::filter(uint64_t a1, float *a2)
{
  float *v2;
  unint64_t v4;
  unint64_t v5;
  float result;

  v2 = a2;
  v4 = *((_QWORD *)a2 + 1);
  if (*((char *)a2 + 23) >= 0)
  {
    v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = *(float **)a2;
    v5 = v4;
  }
  if (skit::NumberFilter::filter(a1, a2, v5))
  {
    result = *(float *)(a1 + 16) * v2[8];
    v2[8] = result;
    *((_WORD *)v2 + 20) = (*((_WORD *)v2 + 20) | *(_WORD *)(a1 + 20) & 4) & (~*(_WORD *)(a1 + 20) | 0xFFFE);
  }
  return result;
}

uint64_t skit::simil(skit *this, const char *a2, const char *a3)
{
  const char *v5;
  int v6;
  const char *v7;
  uint64_t result;

  v5 = (const char *)strlen((const char *)this);
  v7 = (const char *)strlen(a2);
  result = 0;
  if ((_DWORD)v5)
  {
    if ((_DWORD)v7)
      return ((int)(200 * skit::rsimil(this, v5, (uint64_t)a2, v7, 1, v6)) / ((int)v7 + (int)v5));
  }
  return result;
}

uint64_t skit::rsimil(skit *this, const char *a2, uint64_t a3, const char *a4, int a5, int a6)
{
  int v6;
  int v7;
  uint64_t v8;
  skit *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char *v15;
  __darwin_ct_rune_t v16;
  uint64_t v17;
  int v18;
  int v19;
  unint64_t v20;
  int v23;
  unsigned int v24;
  unsigned int v25;
  __darwin_ct_rune_t v26;
  __darwin_ct_rune_t v27;
  uint64_t v28;
  __darwin_ct_rune_t v29;
  __darwin_ct_rune_t v30;
  unint64_t v31;
  int v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  int v37;
  int v38;
  int v40;
  uint64_t v41;
  char *v42;
  int v43;
  uint64_t v45;
  char *v47;

  if ((int)a2 < 1)
    return 0;
  v6 = a5;
  v7 = (int)a4;
  v8 = a3;
  v9 = this;
  v10 = 0;
  v11 = 0;
  v47 = 0;
  v12 = (int)a4;
  v45 = a3 + 1;
  v42 = (char *)this + 1;
  v13 = a2;
  v43 = (int)a2;
  do
  {
    if (v11 < v7)
    {
      v14 = 0;
      v15 = &v42[v10];
      do
      {
        v16 = *((char *)v9 + v10);
        if (v6)
        {
          if (*(unsigned __int8 *)(v8 + v14) == v16
            && *((unsigned __int8 *)v9 + v11 + (uint64_t)(int)v10) == *(unsigned __int8 *)(v8 + v11 + (uint64_t)(int)v14))
          {
            v17 = 0;
            do
            {
              v18 = v15[v17];
              v19 = *(unsigned __int8 *)(v45 + v14 + v17++);
              v20 = v10 + v17;
            }
            while (v17 + v14 < v12 && v20 < v13 && v18 == v19);
            v23 = v17;
            if ((int)v17 > v11)
              v24 = v10;
            else
              v24 = v47;
            v25 = HIDWORD(v47);
            if (v23 > v11)
              v25 = v14;
            v47 = (char *)__PAIR64__(v25, v24);
            if (v23 > v11)
              v11 = v20 - v10;
          }
        }
        else
        {
          v26 = __tolower(v16);
          if (v26 == __tolower(*(char *)(v8 + v14)))
          {
            v27 = __tolower(*((char *)this + v11 + (uint64_t)(int)v10));
            v8 = a3;
            if (v27 == __tolower(*(char *)(a3 + v11 + (uint64_t)(int)v14)))
            {
              v28 = 0;
              do
              {
                v29 = __tolower(v15[v28]);
                v30 = __tolower(*(char *)(v45 + v14 + v28));
                v31 = v10 + v28 + 1;
                if (v31 >= v13)
                  break;
              }
              while (v29 == v30 && (int)v14 + (int)v28++ + 1 < v7);
              v33 = v31 - v10;
              if (v33 > v11)
                v34 = v10;
              else
                v34 = v47;
              v35 = HIDWORD(v47);
              if (v33 > v11)
                v35 = v14;
              v47 = (char *)__PAIR64__(v35, v34);
              if (v33 > v11)
                v11 = v33;
              v6 = a5;
              v8 = a3;
            }
          }
          v9 = this;
        }
        ++v14;
      }
      while (v14 < v7 - v11);
    }
    ++v10;
  }
  while (v10 < v43 - v11);
  if (!v11)
    return 0;
  v36 = 0;
  if ((_DWORD)v47)
  {
    v37 = HIDWORD(v47);
    if (HIDWORD(v47))
    {
      v38 = skit::rsimil(v9, (const char *)v47, v8, (const char *)HIDWORD(v47), v6, a6);
      v9 = this;
      v36 = v38;
    }
  }
  else
  {
    v37 = HIDWORD(v47);
  }
  v40 = 0;
  v41 = v11 + (uint64_t)(int)v47;
  if (v43 != (_DWORD)v41 && v7 != v11 + v37)
    v40 = skit::rsimil((skit *)((char *)v9 + v41), (const char *)(v43 - v41), (int)v8 + v11 + v37, (const char *)(v7 - (v11 + v37)), v6, a6);
  return (v36 + v11 + v40);
}

uint64_t skit::isimil(skit *this, const char *a2, const char *a3)
{
  const char *v5;
  int v6;
  const char *v7;
  uint64_t result;

  v5 = (const char *)strlen((const char *)this);
  v7 = (const char *)strlen(a2);
  result = 0;
  if ((_DWORD)v5)
  {
    if ((_DWORD)v7)
      return ((int)(200 * skit::rsimil(this, v5, (uint64_t)a2, v7, 0, v6)) / ((int)v7 + (int)v5));
  }
  return result;
}

uint64_t skit::internal::FieldMatchesImpl<skit::SpanMatchV3>::max_span_match(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  float *v4;
  uint64_t i;
  float v6;

  v1 = *(unsigned int *)(a1 + 56);
  v2 = *(_QWORD *)(a1 + 48);
  if (v1 < 2)
  {
    v3 = 0;
  }
  else
  {
    LODWORD(v3) = 0;
    v4 = (float *)(v2 + 76);
    for (i = 1; i != v1; ++i)
    {
      v6 = *v4;
      v4 += 16;
      if (v6 <= *(float *)(v2 + ((unint64_t)v3 << 6) + 12))
        v3 = v3;
      else
        v3 = i;
    }
  }
  return v2 + (v3 << 6);
}

void skit::internal::FieldMatchesImpl<skit::SpanMatchV3>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  *(_WORD *)a1 = 0;
  if (*(char *)(a1 + 31) < 0)
  {
    **(_WORD **)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
  else
  {
    *(_WORD *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 31) = 0;
  }
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  v2 = *(unsigned int *)(a1 + 56);
  if ((_DWORD)v2)
  {
    v3 = v2 << 6;
    v4 = *(_QWORD *)(a1 + 48) + 48;
    do
    {
      v5 = *(void **)(v4 - 16);
      if ((void *)v4 != v5)
        free(v5);
      v4 += 64;
      v3 -= 64;
    }
    while (v3);
  }
  *(_DWORD *)(a1 + 56) = 0;
}

{
  __ZN4skit8internal16FieldMatchesImplINS_11SpanMatchV3EE5clearEv(a1);
}

uint64_t skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>::FieldMatchImpl(uint64_t a1, uint64_t a2, skit::SpanMatchV3 *a3)
{
  std::basic_string<char16_t> *v6;
  __int128 v7;
  unsigned __int32 v8;
  unsigned __int32 v9;
  BOOL v10;
  unsigned __int32 v11;
  uint32x2_t v12;

  *(_WORD *)a1 = *(_WORD *)a2;
  v6 = (std::basic_string<char16_t> *)(a1 + 8);
  if (*(char *)(a2 + 31) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(v6, *(const std::basic_string<char16_t>::value_type **)(a2 + 8), *(_QWORD *)(a2 + 16));
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 8);
    v6->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 24);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  skit::SpanMatchV3::SpanMatchV3((skit::SpanMatchV3 *)(a1 + 48), a3);
  v8 = *((_DWORD *)a3 + 6);
  v9 = *(_DWORD *)(a2 + 40);
  v10 = v8 >= v9;
  v11 = v8 - v9;
  if (v11 != 0 && v10)
    *(_DWORD *)(a1 + 32) += v11;
  v12.i32[0] = *((_DWORD *)a3 + 5);
  v12.i32[1] = v8;
  *(uint32x2_t *)(a1 + 36) = vmax_u32(*(uint32x2_t *)(a1 + 36), v12);
  return a1;
}

{
  return __ZN4skit8internal14FieldMatchImplINS0_16FieldMatchesImplINS_11SpanMatchV3EEEEC2ERKS4_RKS3_(a1, a2, a3);
}

_QWORD *skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::MergedFieldMatchImpl(_QWORD *a1, uint64_t a2, skit::SpanMatchV3 *a3)
{
  std::basic_string<char16_t> *v6;
  __int128 v7;
  _BYTE v9[112];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>::FieldMatchImpl((uint64_t)v9, a2, a3);
  *a1 = a1 + 2;
  a1[1] = 0x400000001;
  std::uninitialized_copy[abi:ne180100]<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>> const*,skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>*>((skit::SpanMatchV3 *)v9, (skit::SpanMatchV3 *)&v10, (uint64_t)(a1 + 2));
  skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>::~FieldMatchImpl((uint64_t)v9);
  v6 = (std::basic_string<char16_t> *)(a1 + 58);
  if (*(char *)(a2 + 31) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(v6, *(const std::basic_string<char16_t>::value_type **)(a2 + 8), *(_QWORD *)(a2 + 16));
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 8);
    a1[60] = *(_QWORD *)(a2 + 24);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  skit::SpanMatchV3::SpanMatchV3((skit::SpanMatchV3 *)(a1 + 61), a3);
  return a1;
}

{
  return __ZN4skit8internal20MergedFieldMatchImplINS0_14FieldMatchImplINS0_16FieldMatchesImplINS_11SpanMatchV3EEEEEEC2ERKS5_RKS4_(a1, a2, a3);
}

void sub_1CB769810(_Unwind_Exception *a1)
{
  uint64_t v1;

  skit::SmallVector<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>,4u,true>::~SmallVector(v1);
  _Unwind_Resume(a1);
}

uint64_t skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::span(uint64_t a1)
{
  return a1 + 488;
}

float skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::score(uint64_t a1)
{
  return *(float *)(a1 + 500);
}

uint64_t skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::edit_dist(uint64_t a1)
{
  return *(unsigned int *)(a1 + 496);
}

uint64_t skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::max_token_cnt(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  int v6;

  v1 = *(unsigned int *)(result + 8);
  if (!(_DWORD)v1)
    return 0;
  v2 = (uint64_t *)result;
  LODWORD(result) = 0;
  v3 = *v2;
  v4 = 112 * v1;
  v5 = (int *)(v3 + 32);
  do
  {
    v6 = *v5;
    v5 += 28;
    result = (v6 + result);
    v4 -= 112;
  }
  while (v4);
  return result;
}

uint64_t skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::max_code_unit_cnt(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  int v6;

  v1 = *(unsigned int *)(result + 8);
  if (!(_DWORD)v1)
    return 0;
  v2 = (uint64_t *)result;
  LODWORD(result) = 0;
  v3 = *v2;
  v4 = 112 * v1;
  v5 = (int *)(v3 + 44);
  do
  {
    v6 = *v5;
    v5 += 28;
    result = (v6 + result);
    v4 -= 112;
  }
  while (v4);
  return result;
}

uint64_t skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::max_stop_word_cnt(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  int v6;

  v1 = *(unsigned int *)(result + 8);
  if (!(_DWORD)v1)
    return 0;
  v2 = (uint64_t *)result;
  LODWORD(result) = 0;
  v3 = *v2;
  v4 = 112 * v1;
  v5 = (int *)(v3 + 36);
  do
  {
    v6 = *v5;
    v5 += 28;
    result = (v6 + result);
    v4 -= 112;
  }
  while (v4);
  return result;
}

uint64_t skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::max_alias_token_cnt(uint64_t result)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  int v6;

  v1 = *(unsigned int *)(result + 8);
  if (!(_DWORD)v1)
    return 0;
  v2 = (uint64_t *)result;
  LODWORD(result) = 0;
  v3 = *v2;
  v4 = 112 * v1;
  v5 = (int *)(v3 + 40);
  do
  {
    v6 = *v5;
    v5 += 28;
    result = (v6 + result);
    v4 -= 112;
  }
  while (v4);
  return result;
}

size_t skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::merge(char **a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  skit::SpanMatchV3 *v7;
  skit::SpanMatchV3 *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  int v24;
  const std::basic_string<char16_t>::value_type *v25;
  std::basic_string<char16_t>::size_type v26;

  v4 = *(_DWORD *)(a2 + 8);
  if (v4)
  {
    v5 = *((_DWORD *)a1 + 2);
    v6 = (uint64_t)&(*a1)[112 * v5];
    v7 = *(skit::SpanMatchV3 **)a2;
    v8 = (skit::SpanMatchV3 *)(*(_QWORD *)a2 + 112 * v4);
    v9 = v5 + v4;
    if (v5 + v4 <= *((_DWORD *)a1 + 3))
    {
      v15 = (uint64_t)&(*a1)[112 * v5];
    }
    else
    {
      v10 = v5 + (v5 >> 1);
      if (v10 + 1 > v9)
        v11 = v10 + 1;
      else
        v11 = v9;
      v12 = (char *)skit::SmallVector<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>,4u,true>::allocate(v11);
      v13 = (uint64_t)*a1;
      v14 = (char *)v6;
      v15 = (uint64_t)v12;
      if (*a1 != (char *)v6)
      {
        v15 = (uint64_t)v12;
        do
        {
          *(_WORD *)v15 = *(_WORD *)v13;
          v16 = *(_OWORD *)(v13 + 8);
          *(_QWORD *)(v15 + 24) = *(_QWORD *)(v13 + 24);
          *(_OWORD *)(v15 + 8) = v16;
          *(_QWORD *)(v13 + 16) = 0;
          *(_QWORD *)(v13 + 24) = 0;
          *(_QWORD *)(v13 + 8) = 0;
          *(_OWORD *)(v15 + 32) = *(_OWORD *)(v13 + 32);
          v17 = *(_OWORD *)(v13 + 48);
          *(_OWORD *)(v15 + 60) = *(_OWORD *)(v13 + 60);
          *(_OWORD *)(v15 + 48) = v17;
          skit::SmallVector<skit::GroupId,4u,true>::move(v15 + 80, v13 + 80);
          *(_DWORD *)(v15 + 104) = *(_DWORD *)(v13 + 104);
          v15 += 112;
          v13 += 112;
        }
        while (v13 != v6);
        v14 = *a1;
      }
      v18 = *((unsigned int *)a1 + 2);
      v19 = &v14[112 * v18];
      if (v19 != (char *)v6)
      {
        v20 = v15 + 112 * v4;
        do
        {
          *(_WORD *)v20 = *(_WORD *)v6;
          v21 = *(_OWORD *)(v6 + 8);
          *(_QWORD *)(v20 + 24) = *(_QWORD *)(v6 + 24);
          *(_OWORD *)(v20 + 8) = v21;
          *(_QWORD *)(v6 + 16) = 0;
          *(_QWORD *)(v6 + 24) = 0;
          *(_QWORD *)(v6 + 8) = 0;
          *(_OWORD *)(v20 + 32) = *(_OWORD *)(v6 + 32);
          v22 = *(_OWORD *)(v6 + 48);
          *(_OWORD *)(v20 + 60) = *(_OWORD *)(v6 + 60);
          *(_OWORD *)(v20 + 48) = v22;
          skit::SmallVector<skit::GroupId,4u,true>::move(v20 + 80, v6 + 80);
          *(_DWORD *)(v20 + 104) = *(_DWORD *)(v6 + 104);
          v6 += 112;
          v20 += 112;
        }
        while ((char *)v6 != v19);
        v14 = *a1;
        v18 = *((unsigned int *)a1 + 2);
      }
      if ((_DWORD)v18)
      {
        v23 = 112 * v18;
        do
        {
          v14 = (char *)(skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>::~FieldMatchImpl((uint64_t)v14)
                       + 112);
          v23 -= 112;
        }
        while (v23);
        v14 = *a1;
      }
      if (v14 != (char *)(a1 + 2))
        free(v14);
      *a1 = v12;
      *((_DWORD *)a1 + 3) = ((malloc_size(v12) >> 4) * (unsigned __int128)0x2492492492492493uLL) >> 64;
    }
    *((_DWORD *)a1 + 2) = v9;
    std::uninitialized_copy[abi:ne180100]<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>> const*,skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>*>(v7, v8, v15);
  }
  if (*((char *)a1 + 487) < 0)
  {
    if (!a1[59])
      goto LABEL_29;
  }
  else if (!*((_BYTE *)a1 + 487))
  {
    goto LABEL_29;
  }
  if (*((_DWORD *)a1 + 123) < *(_DWORD *)(a2 + 488))
    std::basic_string<char16_t>::push_back((std::basic_string<char16_t> *)(a1 + 58), a2);
LABEL_29:
  v24 = *(char *)(a2 + 487);
  if (v24 >= 0)
    v25 = (const std::basic_string<char16_t>::value_type *)(a2 + 464);
  else
    v25 = *(const std::basic_string<char16_t>::value_type **)(a2 + 464);
  if (v24 >= 0)
    v26 = *(unsigned __int8 *)(a2 + 487);
  else
    v26 = *(_QWORD *)(a2 + 472);
  std::basic_string<char16_t>::append((std::basic_string<char16_t> *)(a1 + 58), v25, v26);
  return skit::SpanMatchV3::merge((size_t)(a1 + 61), (int32x2_t *)(a2 + 488));
}

{
  return __ZN4skit8internal20MergedFieldMatchImplINS0_14FieldMatchImplINS0_16FieldMatchesImplINS_11SpanMatchV3EEEEEE5mergeERKS7_(a1, a2);
}

uint64_t skit::internal::MergeStateImpl<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>>::clear(uint64_t result)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;

  v1 = result;
  *(_QWORD *)result = 0;
  *(_QWORD *)(result + 8) = 0;
  v2 = *(_DWORD *)(result + 24);
  if (v2)
  {
    v3 = *(_QWORD *)(result + 16);
    v4 = 552 * v2;
    do
    {
      result = skit::SmallVector<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,8u,true>::_destroy<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,(void *)0>(v3);
      v3 += 552;
      v4 -= 552;
    }
    while (v4);
  }
  *(_DWORD *)(v1 + 24) = 0;
  return result;
}

_QWORD *skit::MphStopWordFilter::MphStopWordFilter(_QWORD *this)
{
  *this = &off_1E8687388;
  this[1] = &skit::default_stop_word;
  return this;
}

{
  *this = &off_1E8687388;
  this[1] = &skit::default_stop_word;
  return this;
}

void skit::MphStopWordFilter::~MphStopWordFilter(skit::MphStopWordFilter *this)
{
  JUMPOUT(0x1D179DDB4);
}

float skit::MphStopWordFilter::filter(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  skit::internal *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int16 *v15;
  uint64_t v16;
  float result;

  v3 = *a2;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 4);
  if (v4 > a3)
  {
    v5 = a3;
    v6 = *(_QWORD *)(a1 + 8);
    v7 = *(_QWORD *)(v6 + 24);
    do
    {
      v8 = v3 + 48 * v5;
      v9 = *(char *)(v8 + 23);
      if (v9 >= 0)
        v10 = (skit::internal *)(v3 + 48 * v5);
      else
        v10 = *(skit::internal **)v8;
      if (v9 >= 0)
        v11 = *(unsigned __int8 *)(v8 + 23);
      else
        v11 = *(_QWORD *)(v8 + 8);
      v12 = v7;
      if (v11)
      {
        v13 = *(__int16 *)(*(_QWORD *)(v6 + 8)
                         + 2
                         * (*(_DWORD *)(v6 + 16) & skit::internal::murmur3_32(v10, 2 * v11, *(_DWORD *)(v6 + 20))));
        v12 = v7;
        if ((v13 & 0x8000000000000000) == 0)
        {
          v14 = *(_QWORD *)v6 + 24 * (int)v13;
          v12 = v7;
          if (*(_QWORD *)(v14 + 8) == v11)
          {
            v15 = *(unsigned __int16 **)v14;
            while (*(unsigned __int16 *)v10 == *v15)
            {
              ++v15;
              v10 = (skit::internal *)((char *)v10 + 2);
              if (!--v11)
              {
                v12 = *(_QWORD *)v6 + 24 * v13;
                goto LABEL_17;
              }
            }
            v12 = v7;
          }
        }
      }
LABEL_17:
      v16 = v3 + 48 * v5;
      result = *(float *)(v12 + 16) * *(float *)(v16 + 32);
      *(float *)(v16 + 32) = result;
      *(_WORD *)(v16 + 40) = (*(_WORD *)(v16 + 40) | *(_WORD *)(v12 + 20) & 4) & (*(_WORD *)(v12 + 20) | 0xFFFE);
      ++v5;
    }
    while (v5 != v4);
  }
  return result;
}

BOOL skit::is_significant(uint64_t *a1)
{
  uint64_t v2;
  BOOL v3;
  int v4;
  uint64_t v5;
  _BOOL8 result;
  uint64_t v7;
  uint64_t v8;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  int v14;

  if (skit::is_significant(std::u16string_view const&)::once != -1)
  v2 = a1[1];
  if (skit::is_significant(std::u16string_view const&)::significant_chars)
    v3 = v2 == 0;
  else
    v3 = 1;
  if (v3)
    return 0;
  v4 = 0;
  v5 = *a1;
  while (1)
  {
    result = v4 < (int)v2;
    if (v4 >= (int)v2)
      break;
    v7 = v4 + 1;
    v8 = *(unsigned __int16 *)(v5 + 2 * v4);
    if ((v8 & 0xFC00) == 0xD800 && (_DWORD)v7 != (_DWORD)v2)
    {
      v10 = *(unsigned __int16 *)(v5 + 2 * v7);
      v11 = v10 & 0xFC00;
      v12 = v4 + 2;
      v13 = v10 + ((_DWORD)v8 << 10) - 56613888;
      if (v11 == 56320)
        v8 = v13;
      else
        v8 = v8;
      if (v11 == 56320)
        LODWORD(v7) = v12;
    }
    v14 = MEMORY[0x1D179E0A8](skit::is_significant(std::u16string_view const&)::significant_chars, v8);
    v4 = v7;
    if (v14)
      return 1;
  }
  return result;
}

uint64_t skit::`anonymous namespace'::make_uset_significant_chars(skit::_anonymous_namespace_ *this, void *a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = uset_openPattern();
  result = MEMORY[0x1D179E0B4]();
  *(_QWORD *)this = v3;
  return result;
}

void skit::to_string(std::string *this, uint64_t a2, std::string::size_type __requested_capacity)
{
  int v3;
  int v6;
  uint64_t v7;
  unsigned int v8;
  std::string::size_type v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  std::string::value_type __s[4];
  char v15;

  v3 = __requested_capacity;
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
  std::string::reserve(this, __requested_capacity);
  v15 = 0;
  *(_DWORD *)__s = 0;
  if (v3 >= 1)
  {
    v6 = 0;
    while (1)
    {
      v7 = v6 + 1;
      v8 = *(unsigned __int16 *)(a2 + 2 * v6);
      if ((v8 & 0xFC00) == 0xD800 && (_DWORD)v7 != v3)
        break;
      if (v8 > 0x7F)
      {
        if (v8 <= 0x7FF)
        {
          __s[0] = (v8 >> 6) | 0xC0;
          v13 = 1;
LABEL_19:
          v10 = v13 + 1;
          __s[v13] = v8 & 0x3F | 0x80;
          goto LABEL_20;
        }
LABEL_17:
        __s[0] = (v8 >> 12) | 0xE0;
        v12 = 1;
LABEL_18:
        v13 = v12 + 1;
        *(_BYTE *)((unint64_t)__s | v12) = (v8 >> 6) & 0x3F | 0x80;
        goto LABEL_19;
      }
      __s[0] = *(_WORD *)(a2 + 2 * v6);
      v10 = 1;
LABEL_20:
      std::string::append(this, __s, v10);
      v6 = v7;
      if ((int)v7 >= v3)
        return;
    }
    v11 = *(unsigned __int16 *)(a2 + 2 * v7);
    if ((v11 & 0xFC00) != 0xDC00)
      goto LABEL_17;
    LODWORD(v7) = v6 + 2;
    v8 = v11 + (v8 << 10) - 56613888;
    __s[0] = (v8 >> 18) | 0xF0;
    __s[1] = (v8 >> 12) & 0x3F | 0x80;
    v12 = 2;
    goto LABEL_18;
  }
}

void skit::to_u16string(std::basic_string<char16_t> *this, uint64_t a2, std::basic_string<char16_t>::size_type __requested_capacity)
{
  int v3;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  std::basic_string<char16_t>::size_type v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  std::basic_string<char16_t>::value_type __s[2];
  __int16 v19;

  v3 = __requested_capacity;
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
  std::basic_string<char16_t>::reserve(this, __requested_capacity);
  v19 = 0;
  *(_DWORD *)__s = 0;
  if (v3 >= 1)
  {
    v6 = 0;
    do
    {
      v7 = v6;
      v8 = v6 + 1;
      v9 = *(char *)(a2 + v6);
      v10 = *(unsigned __int8 *)(a2 + v6);
      if (v9 < 0)
      {
        if ((_DWORD)v8 == v3)
          goto LABEL_9;
        if (v10 < 0xE0)
        {
          if (v10 < 0xC2)
            goto LABEL_26;
          v14 = v10 & 0x1F;
        }
        else
        {
          if (v10 > 0xEF)
          {
            if (v10 > 0xF4
              || (v17 = v10 - 240,
                  v12 = *(unsigned __int8 *)(a2 + v8),
                  ((byte_1CB76D230[v12 >> 4] >> v17) & 1) == 0))
            {
LABEL_26:
              v10 = -1;
              goto LABEL_27;
            }
            v8 = v7 + 2;
            if ((_DWORD)v7 + 2 == v3)
            {
LABEL_9:
              v10 = -1;
              LODWORD(v8) = v3;
LABEL_27:
              __s[0] = (v10 >> 10) - 10304;
              __s[1] = v10 & 0x3FF | 0xDC00;
              v11 = 2;
              goto LABEL_28;
            }
            v13 = *(unsigned __int8 *)(a2 + v8) ^ 0x80;
            if (v13 > 0x3F)
            {
              v10 = -1;
              goto LABEL_27;
            }
            LODWORD(v12) = v12 & 0x3F | (v17 << 6);
          }
          else
          {
            v12 = v9 & 0xF;
            if (((a00000000000000_0[v12] >> (*(_BYTE *)(a2 + v8) >> 5)) & 1) == 0)
              goto LABEL_26;
            v13 = *(_BYTE *)(a2 + v8) & 0x3F;
          }
          LODWORD(v8) = v8 + 1;
          if ((_DWORD)v8 == v3)
            goto LABEL_9;
          v14 = v13 | ((_DWORD)v12 << 6);
        }
        v15 = *(unsigned __int8 *)(a2 + (int)v8) ^ 0x80;
        if (v15 > 0x3F)
          goto LABEL_26;
        LODWORD(v8) = v8 + 1;
        v16 = (unsigned __int16)(v14 >> 10);
        v10 = v15 | (v14 << 6);
        if (v16)
          goto LABEL_27;
      }
      __s[0] = v10;
      v11 = 1;
LABEL_28:
      std::basic_string<char16_t>::append(this, __s, v11);
      v6 = v8;
    }
    while ((int)v8 < v3);
  }
}

uint64_t skit::codepoint_cnt(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  int v9;

  if (a2 < 1)
    return 0;
  result = 0;
  LODWORD(v4) = 0;
  while (1)
  {
    v5 = (int)v4;
    v6 = (int)v4 + 1;
    v7 = *(char *)(a1 + (int)v4);
    if ((v7 & 0x80000000) == 0 || (_DWORD)v6 == a2)
    {
LABEL_19:
      LODWORD(v4) = v6;
      goto LABEL_20;
    }
    v8 = v7;
    if (v7 < 0xE0u)
    {
      LODWORD(v4) = v6;
      if (v8 >= 0xC2)
        goto LABEL_11;
      goto LABEL_20;
    }
    if (v7 <= 0xEFu)
    {
      v9 = a00000000000000_0[v7 & 0xF] >> (*(_BYTE *)(a1 + v6) >> 5);
      LODWORD(v4) = v6;
      if ((v9 & 1) != 0)
        goto LABEL_8;
      goto LABEL_20;
    }
    if (v7 > 0xF4u)
      goto LABEL_19;
    LODWORD(v4) = v6;
    if (((byte_1CB76D230[(unint64_t)*(unsigned __int8 *)(a1 + v6) >> 4] >> (v8 + 16)) & 1) != 0)
      break;
LABEL_20:
    ++result;
    if ((int)v4 >= a2)
      return result;
  }
  v4 = v5 + 2;
  if ((_DWORD)v5 + 2 != a2)
  {
    LODWORD(v6) = v5 + 2;
    if (*(char *)(a1 + v4) <= -65)
    {
LABEL_8:
      LODWORD(v6) = v6 + 1;
      if ((_DWORD)v6 == a2)
        return ++result;
LABEL_11:
      if (*(char *)(a1 + (int)v6) >= -64)
        LODWORD(v4) = v6;
      else
        LODWORD(v4) = v6 + 1;
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  return ++result;
}

{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v6;

  if (a2 < 1)
    return 0;
  v2 = 0;
  v3 = 0;
  do
  {
    v4 = v3 + 1;
    if ((*(_WORD *)(a1 + 2 * v3) & 0xFC00) == 0xD800 && (_DWORD)v4 != a2)
    {
      v6 = v3 + 2;
      if ((*(_WORD *)(a1 + 2 * v4) & 0xFC00) == 0xDC00)
        LODWORD(v4) = v6;
    }
    ++v2;
    v3 = v4;
  }
  while ((int)v4 < a2);
  return v2;
}

unint64_t skit::levenshtein(skit *this, const char *a2, const char *a3)
{
  size_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  unint64_t *v21;
  skit *v22;
  uint64_t v23;
  unint64_t v24;
  int v25;
  unint64_t v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v5 = strlen((const char *)this);
  v6 = strlen(a2);
  v8 = MEMORY[0x1E0C80A78](v6, v7);
  v11 = (_QWORD *)((char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v5)
  {
    v12 = 2;
    if (v9 > 2)
      v12 = v9;
    for (i = 1; i != v12; ++i)
      v11[i] = i;
  }
  if (v8)
  {
    v14 = 2;
    if (v9 <= 2)
      v15 = 2;
    else
      v15 = v9;
    if ((unint64_t)(v8 + 1) > 2)
      v14 = v8 + 1;
    v16 = v15 - 1;
    v17 = 1;
    do
    {
      v18 = v17;
      if (v5)
      {
        v19 = v17 - 1;
        v20 = a2[v17 - 1];
        v21 = v11 + 1;
        v22 = this;
        v23 = v16;
        v24 = v18;
        do
        {
          v25 = *(unsigned __int8 *)v22;
          v22 = (skit *)((char *)v22 + 1);
          if (v25 != v20)
            ++v19;
          v26 = *v21;
          if (*v21 + 1 >= v24 + 1)
            ++v24;
          else
            v24 = *v21 + 1;
          if (v24 >= v19)
            v24 = v19;
          *v21++ = v24;
          v19 = v26;
          --v23;
        }
        while (v23);
      }
      v17 = v18 + 1;
    }
    while (v18 + 1 != v14);
    *v11 = v18;
  }
  return v11[v5];
}

uint64_t skit::Token::serialize(skit::Token *this, byte *a2, uint64_t a3)
{
  uint64_t v3;
  byte *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  skit::Token *v11;
  byte *v12;
  float v13;
  float v14;

  v3 = *((unsigned __int8 *)this + 23);
  if ((v3 & 0x80u) != 0)
    v3 = *((_QWORD *)this + 1);
  if (2 * v3 + 18 > a3)
    return -1;
  *(_WORD *)a2 = v3;
  v7 = a2 + 2;
  v8 = *((char *)this + 23);
  v9 = *((_QWORD *)this + 1);
  if (v8 >= 0)
    v9 = *((unsigned __int8 *)this + 23);
  v10 = 2 * v9;
  v11 = this;
  if (v8 < 0)
    v11 = *(skit::Token **)this;
  memcpy(v7, v11, 2 * v9);
  v12 = &a2[v10];
  *(_DWORD *)(v12 + 2) = *((_DWORD *)this + 6);
  *(_DWORD *)(v12 + 6) = *((_DWORD *)this + 7);
  v13 = *((float *)this + 8);
  v14 = 65504.0;
  if (v13 <= 65504.0)
    v14 = *((float *)this + 8);
  if (v13 >= -65504.0)
    _S0 = v14;
  else
    _S0 = *(float *)"";
  __asm { FCVT            H0, S0 }
  *((_WORD *)v12 + 5) = _H0;
  *((_WORD *)v12 + 6) = *((_WORD *)this + 18);
  *((_WORD *)v12 + 7) = *((_WORD *)this + 19);
  *((_WORD *)v12 + 8) = *((_WORD *)this + 20);
  return v10 + 18;
}

unint64_t skit::Token::deserialize(std::basic_string<char16_t> *this, const byte *a2, uint64_t a3)
{
  std::basic_string<char16_t>::size_type v5;
  uint64_t v6;
  unint64_t v7;
  std::basic_string<char16_t> *v8;

  if (a3 < 18)
    return -1;
  v5 = *(unsigned __int16 *)a2;
  v6 = 2 * v5;
  v7 = 2 * v5 + 18;
  if (v7 > a3)
    return -1;
  v8 = std::basic_string<char16_t>::__assign_external(this, (const std::basic_string<char16_t>::value_type *)a2 + 1, v5);
  v8[1].__r_.__value_.__r.__words[0] = *(_QWORD *)&a2[v6 + 2];
  _H0 = *(_WORD *)&a2[v6 + 10];
  __asm { FCVT            S0, H0 }
  LODWORD(v8[1].__r_.__value_.__r.__words[1]) = _S0;
  v8[1].__r_.__value_.__s.__data_[6] = *(_WORD *)&a2[v6 + 12];
  v8[1].__r_.__value_.__s.__data_[7] = *(_WORD *)&a2[v6 + 14];
  v8[1].__r_.__value_.__s.__data_[8] = *(_WORD *)&a2[v6 + 16];
  return v7;
}

std::basic_string<char16_t> *__cdecl std::basic_string<char16_t>::__assign_external(std::basic_string<char16_t> *this, const std::basic_string<char16_t>::value_type *__s, std::basic_string<char16_t>::size_type __n)
{
  unint64_t v6;
  std::basic_string<char16_t> *v7;
  std::basic_string<char16_t>::size_type size;
  unint64_t v9;
  unint64_t v10;

  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    v10 = this->__r_.__value_.__r.__words[2];
    v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __n)
    {
      size = this->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    v6 = HIBYTE(v10);
    v7 = (std::basic_string<char16_t> *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    v7 = this;
    if (__n > 0xA)
    {
      size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      v9 = 10;
LABEL_6:
      std::basic_string<char16_t>::__grow_by_and_replace(this, v9, __n - v9, size, 0, size, __n, __s);
      return this;
    }
  }
  if (__n)
  {
    memmove(v7, __s, 2 * __n);
    LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0)
    this->__r_.__value_.__l.__size_ = __n;
  else
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
  v7->__r_.__value_.__s.__data_[__n] = 0;
  return this;
}

uint64_t skit::TokenStream::serialize(skit::TokenStream *this, byte *a2, uint64_t a3)
{
  uint64_t v3;
  skit::Token *v5;
  skit::Token *v6;
  byte *v7;
  uint64_t v8;

  v3 = a3 - 2;
  if (a3 >= 2)
  {
    *(_WORD *)a2 = -21845 * ((*((_DWORD *)this + 2) - *(_DWORD *)this) >> 4);
    v5 = *(skit::Token **)this;
    v6 = (skit::Token *)*((_QWORD *)this + 1);
    if (*(skit::Token **)this == v6)
      return a3 - v3;
    v7 = a2 + 2;
    while (1)
    {
      v8 = skit::Token::serialize(v5, v7, v3);
      if (v8 < 1)
        break;
      v3 -= v8;
      v7 += v8;
      v5 = (skit::Token *)((char *)v5 + 48);
      if (v5 == v6)
        return a3 - v3;
    }
  }
  return -1;
}

uint64_t skit::TokenStream::deserialize(skit::TokenStream *this, const byte *a2, uint64_t a3)
{
  uint64_t v3;
  std::basic_string<char16_t> *v7;
  std::basic_string<char16_t> *v8;
  const byte *v9;
  int64_t v10;

  v3 = a3 - 2;
  if (a3 >= 2)
  {
    std::vector<skit::Token>::resize((uint64_t *)this, *(unsigned __int16 *)a2);
    v7 = *(std::basic_string<char16_t> **)this;
    v8 = (std::basic_string<char16_t> *)*((_QWORD *)this + 1);
    if (v7 == v8)
      return a3 - v3;
    v9 = a2 + 2;
    while (1)
    {
      v10 = skit::Token::deserialize(v7, v9, v3);
      if (v10 < 1)
        break;
      v3 -= v10;
      v9 += v10;
      v7 += 2;
      if (v7 == v8)
        return a3 - v3;
    }
  }
  return -1;
}

void skit::MultiNGram::tokenize_str(uint64_t a1, uint64_t *a2, void *__src, unint64_t a4)
{
  uint64_t v5;
  void (***v6)(_QWORD, char **, void *);
  char *v7;
  char *v8;
  char *v9;
  int v10;
  unsigned __int16 *v11;
  char *v12;
  unint64_t v13;
  void *v14;
  char v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int16 *v19;
  unint64_t v20;
  void *v21;
  char v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  char *v28;
  int v29;
  float v30;
  unsigned int v31;
  char *v32;
  float v33;
  unsigned __int16 *v34;
  int v35;
  uint64_t v36;
  float v37;
  float v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  char v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  void *v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  float v55;
  float v56;
  uint64_t v57;
  unint64_t i;
  int *v59;
  unsigned __int16 *v60;
  int v61;
  uint64_t v62;
  uint64_t v63;
  unsigned int v64;
  int v65;
  char *v66;
  char *v67;
  char *v68;
  void *__dst[3];
  void *__p[3];
  __int128 v71;
  uint64_t v72;
  _BYTE __srca[15];
  uint64_t v74;

  v5 = a1;
  v74 = *MEMORY[0x1E0C80C00];
  v6 = *(void (****)(_QWORD, char **, void *))(a1 + 16);
  if (v6)
  {
    v66 = 0;
    v67 = 0;
    v68 = 0;
    (**v6)(v6, &v66, __src);
  }
  else
  {
    skit::Token::Token(__p, __src, a4);
    v66 = 0;
    v67 = 0;
    v68 = 0;
    __dst[0] = &v66;
    LOBYTE(__dst[1]) = 0;
    v7 = (char *)operator new(0x30uLL);
    v8 = v7;
    v66 = v7;
    v67 = v7;
    v9 = v7 + 48;
    v68 = v7 + 48;
    if (SHIBYTE(__p[2]) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)v7, (const std::basic_string<char16_t>::value_type *)__p[0], (std::basic_string<char16_t>::size_type)__p[1]);
      v10 = SHIBYTE(__p[2]);
      *(_OWORD *)(v8 + 24) = v71;
      *((_QWORD *)v8 + 5) = v72;
      v67 = v9;
      if (v10 < 0)
        operator delete(__p[0]);
    }
    else
    {
      *(_OWORD *)v7 = *(_OWORD *)__p;
      *((void **)v7 + 2) = __p[2];
      *(_OWORD *)(v7 + 24) = v71;
      *((_QWORD *)v7 + 5) = v72;
      v67 = v7 + 48;
    }
  }
  v11 = (unsigned __int16 *)v66;
  v60 = (unsigned __int16 *)v67;
  if (v66 != v67)
  {
    v59 = (int *)(v5 + 28);
    do
    {
      if (*(_BYTE *)(v5 + 40))
      {
        strcpy(__srca, "^");
        v12 = (char *)v11;
        if (*((char *)v11 + 23) < 0)
          v12 = *(char **)v11;
        *(_DWORD *)&__srca[2] = *(unsigned __int16 *)v12;
        std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, __srca);
        v65 = 1065353216;
        v13 = a2[1];
        if (v13 >= a2[2])
        {
          v17 = std::vector<skit::Token>::__emplace_back_slow_path<std::basic_string<char16_t>,float,float const&>(a2, (uint64_t *)__p, (float *)&v65, v59);
        }
        else
        {
          v14 = __p[0];
          __dst[0] = __p[1];
          *(void **)((char *)__dst + 7) = *(void **)((char *)&__p[1] + 7);
          v15 = HIBYTE(__p[2]);
          memset(__p, 0, sizeof(__p));
          v16 = *v59;
          *(_QWORD *)v13 = v14;
          *(void **)(v13 + 15) = *(void **)((char *)__dst + 7);
          *(void **)(v13 + 8) = __dst[0];
          *(_BYTE *)(v13 + 23) = v15;
          *(_QWORD *)(v13 + 24) = 0;
          *(_DWORD *)(v13 + 32) = v16;
          *(_DWORD *)(v13 + 36) = 0x10000;
          *(_WORD *)(v13 + 40) = 3;
          v17 = v13 + 48;
          *(_DWORD *)(v13 + 44) = 0;
        }
        a2[1] = v17;
        if (SHIBYTE(__p[2]) < 0)
          operator delete(__p[0]);
        if (*(_BYTE *)(v5 + 40))
        {
          if (*((char *)v11 + 23) < 0)
          {
            v19 = *(unsigned __int16 **)v11;
            v18 = *((_QWORD *)v11 + 1);
          }
          else
          {
            v18 = *((unsigned __int8 *)v11 + 23);
            v19 = v11;
          }
          *(_WORD *)__srca = v19[v18 - 1];
          *(_DWORD *)&__srca[2] = 36;
          std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, __srca);
          v65 = 1065353216;
          v20 = a2[1];
          if (v20 >= a2[2])
          {
            v24 = std::vector<skit::Token>::__emplace_back_slow_path<std::basic_string<char16_t>,float,float const&>(a2, (uint64_t *)__p, (float *)&v65, v59);
          }
          else
          {
            v21 = __p[0];
            __dst[0] = __p[1];
            *(void **)((char *)__dst + 7) = *(void **)((char *)&__p[1] + 7);
            v22 = HIBYTE(__p[2]);
            memset(__p, 0, sizeof(__p));
            v23 = *v59;
            *(_QWORD *)v20 = v21;
            *(void **)(v20 + 15) = *(void **)((char *)__dst + 7);
            *(void **)(v20 + 8) = __dst[0];
            *(_BYTE *)(v20 + 23) = v22;
            *(_QWORD *)(v20 + 24) = 0;
            *(_DWORD *)(v20 + 32) = v23;
            *(_DWORD *)(v20 + 36) = 0x10000;
            *(_WORD *)(v20 + 40) = 3;
            v24 = v20 + 48;
            *(_DWORD *)(v20 + 44) = 0;
          }
          a2[1] = v24;
          if (SHIBYTE(__p[2]) < 0)
            operator delete(__p[0]);
        }
      }
      if (*((char *)v11 + 23) < 0)
        v25 = *((_QWORD *)v11 + 1);
      else
        LODWORD(v25) = *((unsigned __int8 *)v11 + 23);
      v26 = *(_DWORD *)(v5 + 8);
      if (*(_DWORD *)(v5 + 12) < v25)
        LODWORD(v25) = *(_DWORD *)(v5 + 12);
      v61 = v25;
      while (v26 <= v25)
      {
        if (*((char *)v11 + 23) < 0)
        {
          v28 = *(char **)v11;
          v27 = *((_QWORD *)v11 + 1);
        }
        else
        {
          LODWORD(v27) = *((unsigned __int8 *)v11 + 23);
          v28 = (char *)v11;
        }
        v29 = v27 - v26;
        v62 = *a2;
        v63 = a2[1];
        v30 = 0.0;
        v64 = v29 + 1;
        if (v29 != -1)
        {
          v31 = 0;
          v32 = v28;
          v33 = 0.0;
          do
          {
            std::basic_string<char16_t>::basic_string[abi:ne180100](__dst, v28, v26);
            v34 = v11;
            if (*((char *)v11 + 23) < 0)
              v34 = *(unsigned __int16 **)v11;
            v35 = *((_DWORD *)v11 + 6);
            v36 = v5;
            v37 = *(float *)(v5 + 36) * (float)v26;
            v38 = expf(v33) * v37;
            v39 = a2[1];
            v40 = a2[2];
            if (v39 >= v40)
            {
              v44 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v39 - *a2) >> 4);
              v45 = v44 + 1;
              if (v44 + 1 > 0x555555555555555)
                std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
              v46 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v40 - *a2) >> 4);
              if (2 * v46 > v45)
                v45 = 2 * v46;
              if (v46 >= 0x2AAAAAAAAAAAAAALL)
                v47 = 0x555555555555555;
              else
                v47 = v45;
              *((_QWORD *)&v71 + 1) = a2 + 2;
              v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::Token>>(v47);
              v49 = &v48[48 * v44];
              __p[0] = v48;
              __p[1] = v49;
              *(_QWORD *)&v71 = &v48[48 * v50];
              v51 = __dst[0];
              *(void **)&__srca[7] = *(void **)((char *)&__dst[1] + 7);
              *(void **)__srca = __dst[1];
              v52 = HIBYTE(__dst[2]);
              memset(__dst, 0, sizeof(__dst));
              v53 = *(_QWORD *)__srca;
              *(_QWORD *)v49 = v51;
              *((_QWORD *)v49 + 1) = v53;
              *(_QWORD *)(v49 + 15) = *(_QWORD *)&__srca[7];
              v49[23] = v52;
              *((_QWORD *)v49 + 3) = 0;
              *((float *)v49 + 8) = v38;
              *((_DWORD *)v49 + 9) = 0x10000;
              *((_WORD *)v49 + 20) = 3;
              *((_DWORD *)v49 + 11) = 0;
              __p[2] = v49 + 48;
              std::vector<skit::Token>::__swap_out_circular_buffer(a2, __p);
              v43 = a2[1];
              std::__split_buffer<skit::Token>::~__split_buffer((uint64_t)__p);
            }
            else
            {
              v41 = __dst[0];
              __p[0] = __dst[1];
              *(void **)((char *)__p + 7) = *(void **)((char *)&__dst[1] + 7);
              v42 = HIBYTE(__dst[2]);
              memset(__dst, 0, sizeof(__dst));
              *(_QWORD *)v39 = v41;
              *(void **)(v39 + 8) = __p[0];
              *(void **)(v39 + 15) = *(void **)((char *)__p + 7);
              *(_BYTE *)(v39 + 23) = v42;
              *(_QWORD *)(v39 + 24) = 0;
              *(float *)(v39 + 32) = v38;
              *(_DWORD *)(v39 + 36) = 0x10000;
              *(_WORD *)(v39 + 40) = 3;
              *(_DWORD *)(v39 + 44) = 0;
              v43 = v39 + 48;
            }
            a2[1] = v43;
            v54 = v35 + ((unint64_t)(v32 - (char *)v34) >> 1);
            *(_QWORD *)(v43 - 24) = v54 | ((unint64_t)(v54 + v26) << 32);
            v55 = *(float *)(a2[1] - 16);
            v5 = v36;
            v56 = *(float *)(v36 + 24);
            if (SHIBYTE(__dst[2]) < 0)
              operator delete(__dst[0]);
            v30 = v30 + v55;
            v33 = v33 - v56;
            ++v31;
            v28 += 2;
            v32 += 2;
          }
          while (v31 < v64);
        }
        if (*(_BYTE *)(v5 + 42))
        {
          v57 = a2[1];
          for (i = *a2 + 0xFFFFFFF000000010 * ((v63 - v62) >> 4); i != v57; i += 48)
            *(float *)(i + 32) = (float)(1.0 / v30) * *(float *)(i + 32);
        }
        ++v26;
        LODWORD(v25) = v61;
      }
      v11 += 24;
    }
    while (v11 != v60);
  }
  __p[0] = &v66;
  std::vector<skit::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
}

void sub_1CB76AE50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  std::vector<skit::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&a22);
  if (a33 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void skit::MultiNGram::~MultiNGram(skit::MultiNGram *this)
{
  uint64_t v2;

  *(_QWORD *)this = &off_1E8687288;
  v2 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
}

{
  uint64_t v2;

  *(_QWORD *)this = &off_1E8687288;
  v2 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
  JUMPOUT(0x1D179DDB4);
}

_QWORD *skit::Token::Token(_QWORD *__dst, void *__src, unint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if (a3 >= 0x7FFFFFFFFFFFFFF8)
    std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
  if (a3 >= 0xB)
  {
    v7 = (a3 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((a3 | 3) != 0xB)
      v7 = a3 | 3;
    v6 = std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v7 + 1);
    __dst[1] = a3;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((_BYTE *)__dst + 23) = a3;
    v6 = __dst;
    if (!a3)
      goto LABEL_9;
  }
  memmove(v6, __src, 2 * a3);
LABEL_9:
  *((_WORD *)v6 + a3) = 0;
  __dst[3] = 0;
  __dst[4] = 0x100003F800000;
  *((_WORD *)__dst + 20) = 3;
  *((_DWORD *)__dst + 11) = 0;
  return __dst;
}

_QWORD *std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(_QWORD *__dst, char *__src)
{
  unint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if (*(_WORD *)__src)
  {
    v4 = 0;
    do
      v5 = &__src[2 * v4++];
    while (*((_WORD *)v5 + 1));
    if (v4 >= 0x7FFFFFFFFFFFFFF8)
      std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
    if (v4 >= 0xB)
    {
      v7 = (v4 & 0xFFFFFFFFFFFFFFFCLL) + 4;
      if ((v4 | 3) != 0xB)
        v7 = v4 | 3;
      v6 = std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v7 + 1);
      __dst[1] = v4;
      __dst[2] = v8 | 0x8000000000000000;
      *__dst = v6;
    }
    else
    {
      *((_BYTE *)__dst + 23) = v4;
      v6 = __dst;
      if (!v4)
        goto LABEL_9;
    }
    memmove(v6, __src, 2 * v4);
    goto LABEL_14;
  }
  v4 = 0;
  *((_BYTE *)__dst + 23) = 0;
LABEL_9:
  v6 = __dst;
LABEL_14:
  *((_WORD *)v6 + v4) = 0;
  return __dst;
}

uint64_t std::vector<skit::Token>::__emplace_back_slow_path<std::basic_string<char16_t>,float,float const&>(uint64_t *a1, uint64_t *a2, float *a3, int *a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t *v10;
  unint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[5];
  _BYTE v23[15];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  v5 = v4 + 1;
  if (v4 + 1 > 0x555555555555555)
    std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
  v10 = a1 + 2;
  if (0x5555555555555556 * ((a1[2] - *a1) >> 4) > v5)
    v5 = 0x5555555555555556 * ((a1[2] - *a1) >> 4);
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 4) >= 0x2AAAAAAAAAAAAAALL)
    v11 = 0x555555555555555;
  else
    v11 = v5;
  v22[4] = v10;
  v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::Token>>(v11);
  v13 = &v12[48 * v4];
  v22[0] = v12;
  v22[1] = v13;
  v22[3] = &v12[48 * v14];
  *(_QWORD *)&v23[7] = *(uint64_t *)((char *)a2 + 15);
  v15 = *a2;
  *(_QWORD *)v23 = a2[1];
  v16 = *((_BYTE *)a2 + 23);
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  v17 = (int)*a3;
  v18 = *a4;
  v19 = *(_QWORD *)v23;
  *(_QWORD *)v13 = v15;
  *((_QWORD *)v13 + 1) = v19;
  *(_QWORD *)(v13 + 15) = *(_QWORD *)&v23[7];
  v13[23] = v16;
  *((_QWORD *)v13 + 3) = 0;
  *((_DWORD *)v13 + 8) = v18;
  *((_WORD *)v13 + 18) = 0;
  *((_WORD *)v13 + 19) = v17;
  *((_WORD *)v13 + 20) = 3;
  *((_DWORD *)v13 + 11) = 0;
  v22[2] = v13 + 48;
  std::vector<skit::Token>::__swap_out_circular_buffer(a1, v22);
  v20 = a1[1];
  std::__split_buffer<skit::Token>::~__split_buffer((uint64_t)v22);
  return v20;
}

unint64_t skit::WordDelimTokenizer::tokenize_str(unint64_t result, uint64_t *a2, unsigned __int16 *a3, unint64_t a4)
{
  unint64_t v4;
  unint64_t v7;
  unsigned __int16 *v8;
  unsigned __int16 *v9;
  unsigned __int16 *v10;
  uint64_t v11;
  unsigned __int16 *v12;
  BOOL v13;
  unint64_t v14;
  uint64_t v15;
  unsigned __int16 *v16;
  uint64_t v17;
  unsigned __int16 *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD v22[2];

  if (a4)
  {
    v4 = a4;
    v7 = result;
    v8 = (unsigned __int16 *)(result + 8);
    v9 = (unsigned __int16 *)(result + 32);
    v10 = a3;
    do
    {
      if (*(char *)(v7 + 31) < 0)
      {
        v12 = *(unsigned __int16 **)(v7 + 8);
        v11 = *(_QWORD *)(v7 + 16);
      }
      else
      {
        v11 = *(unsigned __int8 *)(v7 + 31);
        v12 = v8;
      }
      result = std::u16string_view::find[abi:ne180100](v10, v4, v12, v11);
      if (result == -1)
        break;
      v13 = v4 >= result;
      v14 = v4 - result;
      if (!v13)
        goto LABEL_25;
      v15 = *(unsigned __int8 *)(v7 + 55);
      if (*(char *)(v7 + 55) < 0)
      {
        v16 = *(unsigned __int16 **)(v7 + 32);
        v17 = *(_QWORD *)(v7 + 40);
      }
      else
      {
        v16 = v9;
        v17 = *(unsigned __int8 *)(v7 + 55);
      }
      v18 = &v10[result];
      result = std::u16string_view::find[abi:ne180100](v18, v14, v16, v17);
      if (result == -1)
        break;
      if ((v15 & 0x80) != 0)
        v15 = *(_QWORD *)(v7 + 40);
      v19 = v15 + result;
      if (v14 >= v15 + result)
        v20 = v15 + result;
      else
        v20 = v14;
      v22[0] = v18;
      v22[1] = v20;
      v21 = a2[1];
      if (v21 >= a2[2])
      {
        result = std::vector<skit::Token>::__emplace_back_slow_path<std::u16string_view &>(a2, (uint64_t)v22);
      }
      else
      {
        skit::Token::Token((_QWORD *)a2[1], v18, v20);
        result = v21 + 48;
        a2[1] = v21 + 48;
      }
      a2[1] = result;
      *(_QWORD *)(result - 24) = ((unint64_t)((char *)v18 - (char *)a3) >> 1) | ((unint64_t)(((unint64_t)((char *)v18 - (char *)a3) >> 1) + v20) << 32);
      v13 = v14 >= v19;
      v4 = v14 - v19;
      if (!v13)
LABEL_25:
        std::__throw_out_of_range[abi:ne180100]("string_view::substr");
      v10 = &v18[v19];
    }
    while (v4);
  }
  return result;
}

void sub_1CB76B3A0(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void skit::WordDelimTokenizer::~WordDelimTokenizer(void **this)
{
  skit::WordDelimTokenizer::~WordDelimTokenizer(this);
  JUMPOUT(0x1D179DDB4);
}

{
  *this = &off_1E86873B0;
  if (*((char *)this + 55) < 0)
    operator delete(this[4]);
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
}

uint64_t std::u16string_view::find[abi:ne180100](unsigned __int16 *a1, uint64_t a2, unsigned __int16 *a3, uint64_t a4)
{
  unsigned __int16 *v4;
  unsigned __int16 *v5;
  uint64_t v7;
  uint64_t v8;

  if (!a4)
    return 0;
  v4 = &a1[a2];
  if (a4 <= a2)
  {
    v5 = a1;
    do
    {
      if (a2 - a4 == -1)
        break;
      v7 = a2 + 1;
      while (*v5 != *a3)
      {
        ++v5;
        if (a4 == --v7)
          goto LABEL_3;
      }
      v8 = 0;
      while (a3[v8] == v5[v8])
      {
        if (a4 == ++v8)
          goto LABEL_4;
      }
      ++v5;
      a2 = v4 - v5;
    }
    while (a2 >= a4);
  }
LABEL_3:
  v5 = v4;
LABEL_4:
  if (v5 == v4)
    return -1;
  else
    return v5 - a1;
}

uint64_t std::vector<skit::Token>::__emplace_back_slow_path<std::u16string_view &>(uint64_t *a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t *v15;

  v2 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  v3 = v2 + 1;
  if (v2 + 1 > 0x555555555555555)
    std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
  v6 = a1 + 2;
  if (0x5555555555555556 * ((a1[2] - *a1) >> 4) > v3)
    v3 = 0x5555555555555556 * ((a1[2] - *a1) >> 4);
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 4) >= 0x2AAAAAAAAAAAAAALL)
    v7 = 0x555555555555555;
  else
    v7 = v3;
  v15 = v6;
  if (v7)
    v7 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::Token>>(v7);
  else
    v8 = 0;
  v11 = v7;
  v12 = (_QWORD *)(v7 + 48 * v2);
  v13 = v12;
  v14 = v7 + 48 * v8;
  skit::Token::Token(v12, *(void **)a2, *(_QWORD *)(a2 + 8));
  v13 = v12 + 6;
  std::vector<skit::Token>::__swap_out_circular_buffer(a1, &v11);
  v9 = a1[1];
  std::__split_buffer<skit::Token>::~__split_buffer((uint64_t)&v11);
  return v9;
}

void sub_1CB76B5AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<skit::Token>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *skit::MorphunTokenizer::MorphunTokenizer(_QWORD *a1)
{
  uint64_t Tokenizer;
  uint64_t v3;
  NSObject *v5;
  void *exception;
  uint8_t v7[16];

  *a1 = &off_1E8687360;
  a1[1] = 0;
  if (!MEMORY[0x1E0DE75F8])
  {
    if (skit::internal::get_logging_context(void)::once != -1)
    v5 = skit::internal::get_logging_context(void)::logger;
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v7 = 0;
      _os_log_error_impl(&dword_1CB748000, v5, OS_LOG_TYPE_ERROR, "Skit requires libmorphun.dylib to use the MorphunTokenizer", v7, 2u);
    }
    exception = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D179DC28](exception, "Skit requires libmorphun.dylib to use the MorphunTokenizer");
    __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
  }
  Tokenizer = morphun::TokenizerFactory::createTokenizer();
  v3 = a1[1];
  a1[1] = Tokenizer;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 16))(v3);
  return a1;
}

void sub_1CB76B6D0(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v4;

  __cxa_free_exception(v2);
  v4 = *(_QWORD *)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4);
  _Unwind_Resume(a1);
}

void skit::MorphunTokenizer::tokenize_str(uint64_t a1, uint64_t *a2, void *__src, unint64_t a4)
{
  void **v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  morphun::Token *v12;
  morphun::Token *v13;
  morphun::Token *v14;
  morphun::Token *v15;
  uint64_t Value;
  int v17;
  void *v18;
  unint64_t v19;
  morphun::Token *v20;
  uint64_t CleanValue;
  int v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  morphun::Token *v29;
  char isWhitespace;
  morphun::Token *v31;
  char isSignificant;
  char v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *__dst[2];
  unint64_t v38;
  __int128 v39;
  _QWORD v40[2];
  __int128 v41;

  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
  if (a4 >= 0xB)
  {
    v9 = (a4 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((a4 | 3) != 0xB)
      v9 = a4 | 3;
    v8 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v9 + 1);
    __dst[1] = (void *)a4;
    v38 = v10 | 0x8000000000000000;
    __dst[0] = v8;
  }
  else
  {
    HIBYTE(v38) = a4;
    v8 = __dst;
    if (!a4)
      goto LABEL_9;
  }
  memmove(v8, __src, 2 * a4);
LABEL_9:
  *((_WORD *)v8 + a4) = 0;
  v11 = (_QWORD *)(*(uint64_t (**)(_QWORD, void **))(**(_QWORD **)(a1 + 8) + 24))(*(_QWORD *)(a1 + 8), __dst);
  morphun::TokenIterator::TokenIterator();
  v39 = v41;
  while (1)
  {
    v12 = (morphun::Token *)v11[2];
    if (v12)
      morphun::Token::getNext(v12);
    morphun::TokenIterator::TokenIterator();
    if (!morphun::TokenIterator::operator!=())
      break;
    v13 = (morphun::Token *)morphun::TokenIterator::operator->();
    if ((morphun::Token::isHead(v13) & 1) == 0)
    {
      v14 = (morphun::Token *)morphun::TokenIterator::operator->();
      if ((morphun::Token::isTail(v14) & 1) == 0)
      {
        v15 = (morphun::Token *)morphun::TokenIterator::operator->();
        Value = morphun::Token::getValue(v15);
        v17 = *(char *)(Value + 23);
        v18 = v17 >= 0 ? (void *)Value : *(void **)Value;
        v19 = v17 >= 0 ? *(unsigned __int8 *)(Value + 23) : *(_QWORD *)(Value + 8);
        v20 = (morphun::Token *)morphun::TokenIterator::operator->();
        CleanValue = morphun::Token::getCleanValue(v20);
        v22 = *(char *)(CleanValue + 23);
        v23 = v22 >= 0 ? (void *)CleanValue : *(void **)CleanValue;
        v24 = v22 >= 0 ? *(unsigned __int8 *)(CleanValue + 23) : *(_QWORD *)(CleanValue + 8);
        v25 = morphun::TokenIterator::operator->();
        v26 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v25 + 24))(v25);
        v27 = morphun::TokenIterator::operator->();
        v28 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v27 + 32))(v27);
        v29 = (morphun::Token *)morphun::TokenIterator::operator->();
        isWhitespace = morphun::Token::isWhitespace(v29);
        v31 = (morphun::Token *)morphun::TokenIterator::operator->();
        isSignificant = morphun::Token::isSignificant(v31);
        *(_QWORD *)&v41 = v18;
        *((_QWORD *)&v41 + 1) = v19;
        v40[0] = v23;
        v40[1] = v24;
        if ((isWhitespace & 1) == 0)
        {
          v33 = isSignificant;
          v35 = a2[1];
          v34 = a2[2];
          if (v24)
          {
            if (v35 < v34)
            {
              skit::Token::Token((_QWORD *)a2[1], v23, v24);
              goto LABEL_33;
            }
            v36 = std::vector<skit::Token>::__emplace_back_slow_path<std::u16string_view &>(a2, (uint64_t)v40);
          }
          else if (v35 >= v34)
          {
            v36 = std::vector<skit::Token>::__emplace_back_slow_path<std::u16string_view &>(a2, (uint64_t)&v41);
          }
          else
          {
            skit::Token::Token((_QWORD *)a2[1], v18, v19);
LABEL_33:
            v36 = v35 + 48;
            a2[1] = v35 + 48;
          }
          a2[1] = v36;
          *(_QWORD *)(v36 - 24) = v26 | (unint64_t)(v28 << 32);
          if ((v33 & 1) == 0)
          {
            *(_WORD *)(v36 - 8) &= 0xFFFCu;
            *(_DWORD *)(v36 - 16) = 0;
          }
        }
      }
    }
    morphun::TokenIterator::operator++();
  }
  (*(void (**)(_QWORD *))(*v11 + 16))(v11);
  if (SHIBYTE(v38) < 0)
    operator delete(__dst[0]);
}

void sub_1CB76B99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  (*(void (**)(uint64_t))(*(_QWORD *)v15 + 16))(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void skit::MorphunTokenizer::~MorphunTokenizer(skit::MorphunTokenizer *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E8687360;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
}

{
  uint64_t v2;

  v2 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E8687360;
  *((_QWORD *)this + 1) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
  JUMPOUT(0x1D179DDB4);
}

uint64_t skit::strip_bidi(const __int16 *a1, uint64_t a2, int a3)
{
  uint64_t v3;
  __int16 *v4;
  uint64_t v5;
  const __int16 *v6;
  int16x8_t v7;
  uint64_t v8;
  unsigned int v9;
  int16x8_t v10;

  v3 = 0;
  if (a1 && a2)
  {
    v4 = (__int16 *)&a1[a2];
    v5 = 2 * a2 - 2;
    v6 = a1;
    while (1)
    {
      v7 = vld1q_dup_s16(v6);
      if ((vmaxvq_u16((uint16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v7, (int16x8_t)xmmword_1CB76D2E0), (int8x16_t)vceqq_s16(v7, (int16x8_t)xmmword_1CB76D2F0))) & 0x8000) != 0)break;
      ++v6;
      v5 -= 2;
      if (v6 == v4)
        goto LABEL_13;
    }
    if (v6 != v4 && v6 + 1 != v4)
    {
      v8 = 1;
      v4 = (__int16 *)v6;
      do
      {
        v9 = (unsigned __int16)v6[v8];
        v10 = vdupq_n_s16(v9);
        if ((vmaxvq_u16((uint16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v10, (int16x8_t)xmmword_1CB76D2E0), (int8x16_t)vceqq_s16(v10, (int16x8_t)xmmword_1CB76D2F0))) & 0x8000) == 0)*v4++ = v9;
        ++v8;
        v5 -= 2;
      }
      while (v5);
LABEL_13:
      if (!a3)
        return v4 - a1;
LABEL_14:
      *v4 = 0;
      return v4 - a1;
    }
    v4 = (__int16 *)v6;
    if (a3)
      goto LABEL_14;
    return v4 - a1;
  }
  return v3;
}

uint64_t skit::strip_bidi(_WORD *a1, unsigned __int16 *a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  _WORD *v6;
  unsigned int v7;
  int16x8_t v8;

  v4 = 0;
  if (a1 && a2 && a3)
  {
    v5 = 2 * a3;
    v6 = a1;
    do
    {
      v7 = *a2;
      v8 = vdupq_n_s16(v7);
      if ((vmaxvq_u16((uint16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v8, (int16x8_t)xmmword_1CB76D2E0), (int8x16_t)vceqq_s16(v8, (int16x8_t)xmmword_1CB76D2F0))) & 0x8000) == 0)*v6++ = v7;
      ++a2;
      v5 -= 2;
    }
    while (v5);
    if (a4)
      *v6 = 0;
    return v6 - a1;
  }
  return v4;
}

std::basic_string<char16_t>::size_type skit::strip_bidi(const __int16 *a1)
{
  std::basic_string<char16_t> *v1;
  uint64_t v2;
  uint64_t v3;
  std::basic_string<char16_t>::size_type result;
  unint64_t size;

  v1 = (std::basic_string<char16_t> *)a1;
  v2 = *((_QWORD *)a1 + 1);
  if (*((char *)a1 + 23) >= 0)
  {
    v3 = *((unsigned __int8 *)a1 + 23);
  }
  else
  {
    a1 = *(const __int16 **)a1;
    v3 = v2;
  }
  result = skit::strip_bidi(a1, v3, 0);
  if (SHIBYTE(v1->__r_.__value_.__r.__words[2]) < 0)
  {
    size = v1->__r_.__value_.__l.__size_;
    if (size >= result)
    {
      v1->__r_.__value_.__l.__size_ = result;
      v1 = (std::basic_string<char16_t> *)v1->__r_.__value_.__r.__words[0];
      goto LABEL_10;
    }
    return (std::basic_string<char16_t>::size_type)std::basic_string<char16_t>::append(v1, result - size, 0);
  }
  size = HIBYTE(v1->__r_.__value_.__r.__words[2]);
  if (result > size)
    return (std::basic_string<char16_t>::size_type)std::basic_string<char16_t>::append(v1, result - size, 0);
  *((_BYTE *)&v1->__r_.__value_.__s + 23) = result & 0x7F;
LABEL_10:
  v1->__r_.__value_.__s.__data_[result] = 0;
  return result;
}

std::basic_string<char16_t>::size_type skit::strip_bidi@<X0>(void *__src@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
  if (a2 >= 0xB)
  {
    v7 = (a2 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((a2 | 3) != 0xB)
      v7 = a2 | 3;
    v6 = std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v7 + 1);
    a3[1] = a2;
    a3[2] = v8 | 0x8000000000000000;
    *a3 = v6;
  }
  else
  {
    *((_BYTE *)a3 + 23) = a2;
    v6 = a3;
    if (!a2)
      goto LABEL_9;
  }
  memmove(v6, __src, 2 * a2);
LABEL_9:
  *((_WORD *)v6 + a2) = 0;
  return skit::strip_bidi((const __int16 *)a3);
}

void sub_1CB76BCEC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

__CFString *skitRemoveBidiCharacters(void *a1)
{
  const __CFString *v1;
  __CFString *v2;
  uint64_t Length;
  const UniChar *CharactersPtr;
  uint64_t v5;
  uint64_t v6;
  const __int16 *v7;
  int16x8_t v8;
  UniChar *v9;
  __int16 *v10;
  uint64_t v11;
  const __int16 *v12;
  int16x8_t v13;
  _BYTE *v14;
  _BYTE *v15;
  unsigned __int16 *v16;
  const __int16 *v17;
  char *v18;
  unsigned int v19;
  int16x8_t v20;
  __CFString *v21;
  uint64_t v22;
  unsigned int v23;
  int16x8_t v24;
  uint64_t v25;
  __CFString *v26;
  CFRange v28;

  v1 = a1;
  v2 = (__CFString *)v1;
  if (!v1)
    goto LABEL_34;
  Length = CFStringGetLength(v1);
  if (!Length)
    goto LABEL_31;
  CharactersPtr = CFStringGetCharactersPtr(v2);
  if (CharactersPtr)
  {
    if (Length >= 1)
    {
      v5 = 0;
      v6 = 2 * Length - 2;
      while (1)
      {
        v7 = (const __int16 *)&CharactersPtr[v5];
        v8 = vld1q_dup_s16(v7);
        if ((vmaxvq_u16((uint16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v8, (int16x8_t)xmmword_1CB76D2E0), (int8x16_t)vceqq_s16(v8, (int16x8_t)xmmword_1CB76D2F0))) & 0x8000) != 0)break;
        ++v5;
        v6 -= 2;
        if (Length == v5)
          goto LABEL_31;
      }
      v14 = malloc_type_malloc(2 * Length, 0x1000040BDFB0063uLL);
      v15 = v14;
      if (v14)
      {
        memcpy(v14, CharactersPtr, 2 * v5);
        v16 = (unsigned __int16 *)(v7 + 1);
        v17 = (const __int16 *)&CharactersPtr[Length];
        v18 = &v15[2 * v5];
        if (v7 + 1 != v17)
        {
          do
          {
            v19 = *v16;
            v20 = vdupq_n_s16(v19);
            if ((vmaxvq_u16((uint16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v20, (int16x8_t)xmmword_1CB76D2E0), (int8x16_t)vceqq_s16(v20, (int16x8_t)xmmword_1CB76D2F0))) & 0x8000) == 0)
            {
              *(_WORD *)v18 = v19;
              v18 += 2;
            }
            ++v16;
            v6 -= 2;
          }
          while (v6);
        }
        *(_WORD *)v18 = 0;
        v21 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharactersNoCopy:length:freeWhenDone:", v15, (v18 - v15) >> 1, 1);
        goto LABEL_32;
      }
LABEL_34:
      v26 = 0;
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  v9 = (UniChar *)malloc_type_malloc(2 * Length + 2, 0x1000040BDFB0063uLL);
  if (!v9)
    goto LABEL_34;
  v28.location = 0;
  v28.length = Length;
  CFStringGetCharacters(v2, v28, v9);
  v10 = (__int16 *)&v9[Length];
  v11 = 2 * Length - 2;
  v12 = (const __int16 *)v9;
  while (1)
  {
    v13 = vld1q_dup_s16(v12);
    if ((vmaxvq_u16((uint16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v13, (int16x8_t)xmmword_1CB76D2E0), (int8x16_t)vceqq_s16(v13, (int16x8_t)xmmword_1CB76D2F0))) & 0x8000) != 0)break;
    ++v12;
    v11 -= 2;
    if (v12 == v10)
      goto LABEL_28;
  }
  if (v12 == v10 || v12 + 1 == v10)
  {
    v10 = (__int16 *)v12;
  }
  else
  {
    v22 = 1;
    v10 = (__int16 *)v12;
    do
    {
      v23 = (unsigned __int16)v12[v22];
      v24 = vdupq_n_s16(v23);
      if ((vmaxvq_u16((uint16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v24, (int16x8_t)xmmword_1CB76D2E0), (int8x16_t)vceqq_s16(v24, (int16x8_t)xmmword_1CB76D2F0))) & 0x8000) == 0)*v10++ = v23;
      ++v22;
      v11 -= 2;
    }
    while (v11);
  }
LABEL_28:
  *v10 = 0;
  v25 = ((char *)v10 - (char *)v9) >> 1;
  if (v25 >= Length)
  {
    free(v9);
LABEL_31:
    v21 = v2;
    goto LABEL_32;
  }
  v21 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharactersNoCopy:length:freeWhenDone:", v9, v25, 1);
LABEL_32:
  v26 = v21;
LABEL_33:

  return v26;
}

void sub_1CB76BFA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t marisa::Trie::mmap(marisa::Trie *this, const char *a2)
{
  return MEMORY[0x1E0DE6D48](this, a2);
}

uint64_t marisa::Trie::clear(marisa::Trie *this)
{
  return MEMORY[0x1E0DE6D50](this);
}

uint64_t marisa::Trie::Trie(marisa::Trie *this)
{
  return MEMORY[0x1E0DE6D58](this);
}

void marisa::Trie::~Trie(marisa::Trie *this)
{
  MEMORY[0x1E0DE6D60](this);
}

uint64_t marisa::Agent::set_query(marisa::Agent *this, const char *a2)
{
  return MEMORY[0x1E0DE6D68](this, a2);
}

uint64_t marisa::Agent::set_query(marisa::Agent *this)
{
  return MEMORY[0x1E0DE6D70](this);
}

uint64_t marisa::Agent::Agent(marisa::Agent *this)
{
  return MEMORY[0x1E0DE6D78](this);
}

void marisa::Agent::~Agent(marisa::Agent *this)
{
  MEMORY[0x1E0DE6D80](this);
}

uint64_t morphun::TokenIterator::TokenIterator()
{
  return MEMORY[0x1E0DE7340]();
}

uint64_t morphun::TokenIterator::operator++()
{
  return MEMORY[0x1E0DE7348]();
}

uint64_t morphun::TokenizerFactory::createTokenizer()
{
  return MEMORY[0x1E0DE7350]();
}

uint64_t marisa::Trie::reverse_lookup(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x1E0DE6D88](this, a2);
}

uint64_t marisa::Trie::predictive_search(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x1E0DE6D90](this, a2);
}

uint64_t morphun::TokenIterator::operator!=()
{
  return MEMORY[0x1E0DE7530]();
}

uint64_t morphun::TokenIterator::operator->()
{
  return MEMORY[0x1E0DE7538]();
}

uint64_t morphun::Token::isWhitespace(morphun::Token *this)
{
  return MEMORY[0x1E0DE7578](this);
}

uint64_t morphun::Token::getCleanValue(morphun::Token *this)
{
  return MEMORY[0x1E0DE7580](this);
}

uint64_t morphun::Token::isSignificant(morphun::Token *this)
{
  return MEMORY[0x1E0DE7588](this);
}

uint64_t morphun::Token::isHead(morphun::Token *this)
{
  return MEMORY[0x1E0DE7590](this);
}

uint64_t morphun::Token::isTail(morphun::Token *this)
{
  return MEMORY[0x1E0DE7598](this);
}

uint64_t morphun::Token::getNext(morphun::Token *this)
{
  return MEMORY[0x1E0DE75A0](this);
}

uint64_t morphun::Token::getValue(morphun::Token *this)
{
  return MEMORY[0x1E0DE75A8](this);
}

std::string *__cdecl std::error_code::message(std::string *__return_ptr retstr, const std::error_code *this)
{
  return (std::string *)MEMORY[0x1E0DE41A0](retstr, this);
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::directory_iterator::__dereference(const std::__fs::filesystem::directory_iterator *this)
{
  return (const std::__fs::filesystem::directory_entry *)MEMORY[0x1E0DE41F8](this);
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4208](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__extension(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4210](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4218](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4220](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__stem(const std::__fs::filesystem::path *this)
{
  const std::string_view::value_type *v1;
  std::basic_string_view<_CharT, _Traits>::size_type v2;
  std::__fs::filesystem::path::__string_view result;

  v1 = (const std::string_view::value_type *)MEMORY[0x1E0DE4230](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

int std::__fs::filesystem::path::__compare(const std::__fs::filesystem::path *this, std::__fs::filesystem::path::__string_view a2)
{
  return MEMORY[0x1E0DE4238](this, a2.__data_, a2.__size_);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1E0DE4428](this, __s, __n);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x1E0DE44A8](this, __requested_capacity);
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
  MEMORY[0x1E0DE44B0](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1E0DE46F8]();
}

{
  return MEMORY[0x1E0DE4708]();
}

{
  return MEMORY[0x1E0DE4728]();
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x1E0DE4848]();
}

void std::__narrow_to_utf8<16ul>::~__narrow_to_utf8(std::__narrow_to_utf8<16> *this)
{
  MEMORY[0x1E0DE4850](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

void std::__throw_runtime_error(const char *a1)
{
  MEMORY[0x1E0DE4928](a1);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::__increment(std::__fs::filesystem::directory_iterator *this, std::error_code *__ec)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x1E0DE49F0](this, __ec);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::directory_iterator(std::__fs::filesystem::directory_iterator *this, const std::__fs::filesystem::path *a2, std::error_code *a3, std::__fs::filesystem::directory_options a4)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x1E0DE49F8](this, a2, a3, a4);
}

BOOL std::__fs::filesystem::__create_directories(const std::__fs::filesystem::path *a1, std::error_code *a2)
{
  return MEMORY[0x1E0DE4A00](a1, a2);
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::path::replace_extension(std::__fs::filesystem::path *this, const std::__fs::filesystem::path *__replacement)
{
  return (std::__fs::filesystem::path *)MEMORY[0x1E0DE4A20](this, __replacement);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x1E0DE4A48](a1, __ec);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA0](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x1E0DE4AA8](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x1E0DE4AB8](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1E0DE4DB0](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E8686EA0();
}

void operator delete(void *__p)
{
  off_1E8686EA8(__p);
}

uint64_t operator delete()
{
  return off_1E8686EB0();
}

uint64_t operator new[]()
{
  return off_1E8686EB8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E8686EC0(__sz);
}

uint64_t operator new()
{
  return off_1E8686EC8();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
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

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1E0C82B18](from, to, state, *(_QWORD *)&flags);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1E0C83578](*(_QWORD *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

float log10f(float a1)
{
  float result;

  MEMORY[0x1E0C83BC8](a1);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C83E60](a1, a2, *(_QWORD *)&a3);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_aligned_alloc(size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF0](alignment, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C84210](a1, a2, *(_QWORD *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

int nftw(const char *a1, int (__cdecl *a2)(const char *, const stat *, int, FTW *), int a3, int a4)
{
  return MEMORY[0x1E0C843C8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1E0C850B8](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x1E0C85118](a1, a2, *(_QWORD *)&a3);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1E0C85138](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

uint64_t uset_contains()
{
  return MEMORY[0x1E0DE6998]();
}

uint64_t uset_freeze()
{
  return MEMORY[0x1E0DE69A8]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x1E0DE69E0]();
}

void uuid_clear(uuid_t uu)
{
  MEMORY[0x1E0C85A00](uu);
}

void uuid_generate_random(uuid_t out)
{
  MEMORY[0x1E0C85A20](out);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C85A30](uu);
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A48](uu, out);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x1E0C85D48](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

