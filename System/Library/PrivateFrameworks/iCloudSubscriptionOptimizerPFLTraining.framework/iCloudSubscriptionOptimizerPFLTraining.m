void sub_22D864448(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_22D864EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,uint64_t a26,uint64_t a27,void *a28,void *a29)
{
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  _Unwind_Resume(a1);
}

void sub_22D8653C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_22D865610(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22D865750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);

  _Unwind_Resume(a1);
}

void sub_22D8657E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_22D866704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54)
{
  void *v54;
  void *v55;

  std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::destroy((uint64_t)&a50, (_QWORD *)a51);
  std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::destroy((uint64_t)&a53, (_QWORD *)a54);

  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<Espresso::blob<float,2>>::operator=[abi:ne180100](_QWORD *a1, uint64_t *a2)
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

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<Espresso::blob<float,2>>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<Espresso::blob<float,2>>>,0>(uint64_t a1)
{
  std::shared_ptr<Espresso::blob<float,2>>::~shared_ptr[abi:ne180100](a1 + 24);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t std::shared_ptr<Espresso::blob<float,2>>::~shared_ptr[abi:ne180100](uint64_t a1)
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

_QWORD *std::allocate_shared[abi:ne180100]<Espresso::blob<float,2>,std::allocator<Espresso::blob<float,2>>,int &,int &,int &,int &,void>@<X0>(int *a1@<X1>, int *a2@<X2>, int *a3@<X3>, int *a4@<X4>, _QWORD *a5@<X8>)
{
  _QWORD *v10;
  _QWORD *result;

  v10 = operator new(0x58uLL);
  result = std::__shared_ptr_emplace<Espresso::blob<float,2>>::__shared_ptr_emplace[abi:ne180100]<int &,int &,int &,int &,std::allocator<Espresso::blob<float,2>>,0>(v10, a1, a2, a3, a4);
  *a5 = v10 + 3;
  a5[1] = v10;
  return result;
}

void sub_22D866CB4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<Espresso::blob<float,2>>::__shared_ptr_emplace[abi:ne180100]<int &,int &,int &,int &,std::allocator<Espresso::blob<float,2>>,0>(_QWORD *a1, int *a2, int *a3, int *a4, int *a5)
{
  char v7;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_24F9576A0;
  std::allocator<Espresso::blob<float,2>>::construct[abi:ne180100]<Espresso::blob<float,2>,int &,int &,int &,int &>((uint64_t)&v7, (uint64_t)(a1 + 3), a2, a3, a4, a5);
  return a1;
}

void sub_22D866D1C(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<Espresso::blob<float,2>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24F9576A0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<Espresso::blob<float,2>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24F9576A0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x22E318364);
}

uint64_t std::__shared_ptr_emplace<Espresso::blob<float,2>>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t std::allocator<Espresso::blob<float,2>>::construct[abi:ne180100]<Espresso::blob<float,2>,int &,int &,int &,int &>(uint64_t a1, uint64_t a2, int *a3, int *a4, int *a5, int *a6)
{
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v7 = *a3;
  v8 = *a4;
  v9 = *a5;
  v10 = *a6;
  *(_QWORD *)a2 = &off_24F9576F0;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_DWORD *)(a2 + 8) = v7;
  *(_DWORD *)(a2 + 12) = v8;
  result = Espresso::kern_alloc((Espresso *)(4 * v7 * (uint64_t)v8 * v9 * v10));
  *(_QWORD *)(a2 + 16) = result;
  *(_BYTE *)(a2 + 24) = 1;
  return result;
}

void sub_22D866DF4(_Unwind_Exception *a1)
{
  Espresso::blob_rtti_root *v1;
  uint64_t v2;

  std::shared_ptr<Espresso::blob<float,2>>::~shared_ptr[abi:ne180100]((uint64_t)v1 + 48);
  std::shared_ptr<Espresso::blob<float,2>>::~shared_ptr[abi:ne180100](v2);
  Espresso::blob_rtti_root::~blob_rtti_root(v1);
  _Unwind_Resume(a1);
}

void Espresso::blob<float,2>::~blob(uint64_t a1, void *a2)
{
  Espresso *v3;

  *(_QWORD *)a1 = &off_24F9576F0;
  if (*(_BYTE *)(a1 + 24))
  {
    v3 = *(Espresso **)(a1 + 16);
    if (v3)
      Espresso::kern_dealloc(v3, a2);
  }
  *(_QWORD *)(a1 + 16) = 0;
  std::shared_ptr<Espresso::blob<float,2>>::~shared_ptr[abi:ne180100](a1 + 48);
  std::shared_ptr<Espresso::blob<float,2>>::~shared_ptr[abi:ne180100](a1 + 32);
  Espresso::blob_rtti_root::~blob_rtti_root((Espresso::blob_rtti_root *)a1);
}

{
  Espresso *v3;

  *(_QWORD *)a1 = &off_24F9576F0;
  if (*(_BYTE *)(a1 + 24))
  {
    v3 = *(Espresso **)(a1 + 16);
    if (v3)
      Espresso::kern_dealloc(v3, a2);
  }
  *(_QWORD *)(a1 + 16) = 0;
  std::shared_ptr<Espresso::blob<float,2>>::~shared_ptr[abi:ne180100](a1 + 48);
  std::shared_ptr<Espresso::blob<float,2>>::~shared_ptr[abi:ne180100](a1 + 32);
  Espresso::blob_rtti_root::~blob_rtti_root((Espresso::blob_rtti_root *)a1);
  JUMPOUT(0x22E318364);
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

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24F957428, MEMORY[0x24BEDAAF0]);
}

void sub_22D866FDC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

_OWORD *std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, const void **a2, uint64_t a3, _OWORD **a4)
{
  void **v6;
  _OWORD *v7;
  uint64_t **v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v12[2];
  char v13;
  uint64_t v14;

  v6 = (void **)std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__find_equal<std::string>((uint64_t)a1, &v14, a2);
  v7 = *v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = operator new(0x48uLL);
    v12[1] = a1 + 1;
    v9 = *a4;
    v10 = *((_QWORD *)*a4 + 2);
    v7[2] = **a4;
    *((_QWORD *)v7 + 6) = v10;
    v9[1] = 0;
    v9[2] = 0;
    *v9 = 0;
    *((_QWORD *)v7 + 7) = 0;
    *((_QWORD *)v7 + 8) = 0;
    v13 = 1;
    std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__insert_node_at(a1, v14, v8, (uint64_t *)v7);
    v12[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v12, 0);
  }
  return v7;
}

_QWORD *std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, const void **a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;
  const void **v9;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
  {
    v7 = a1 + 16;
    do
    {
      while (1)
      {
        v8 = (_QWORD *)v4;
        v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32)))
          break;
        v4 = *v8;
        v5 = v8;
        if (!*v8)
          goto LABEL_10;
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3))
        break;
      v5 = v8 + 1;
      v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    v8 = (_QWORD *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

uint64_t *std::__tree<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

BOOL std::less<std::string>::operator()[abi:ne180100](uint64_t a1, const void **a2, const void **a3)
{
  int v3;
  int v4;
  size_t v5;
  const void *v6;
  size_t v7;
  const void *v8;
  size_t v9;
  int v10;

  v3 = *((char *)a3 + 23);
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a2 + 23);
  else
    v5 = (size_t)a2[1];
  if (v4 >= 0)
    v6 = a2;
  else
    v6 = *a2;
  if (v3 >= 0)
    v7 = *((unsigned __int8 *)a3 + 23);
  else
    v7 = (size_t)a3[1];
  if (v3 >= 0)
    v8 = a3;
  else
    v8 = *a3;
  if (v7 >= v5)
    v9 = v5;
  else
    v9 = v7;
  v10 = memcmp(v6, v8, v9);
  if (v10)
    return v10 < 0;
  else
    return v5 < v7;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
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

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<Espresso::blob<float,2>>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<Espresso::blob<float,2>>>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

_QWORD *std::allocate_shared[abi:ne180100]<Espresso::blob<float,1>,std::allocator<Espresso::blob<float,1>>,int &,int &,int &,int &,void>@<X0>(int *a1@<X1>, int *a2@<X2>, int *a3@<X3>, int *a4@<X4>, _QWORD *a5@<X8>)
{
  _QWORD *v10;
  _QWORD *result;

  v10 = operator new(0x58uLL);
  result = std::__shared_ptr_emplace<Espresso::blob<float,1>>::__shared_ptr_emplace[abi:ne180100]<int &,int &,int &,int &,std::allocator<Espresso::blob<float,1>>,0>(v10, a1, a2, a3, a4);
  *a5 = v10 + 3;
  a5[1] = v10;
  return result;
}

void sub_22D86746C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<Espresso::blob<float,1>>::__shared_ptr_emplace[abi:ne180100]<int &,int &,int &,int &,std::allocator<Espresso::blob<float,1>>,0>(_QWORD *a1, int *a2, int *a3, int *a4, int *a5)
{
  char v7;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = &off_24F957728;
  std::allocator<Espresso::blob<float,1>>::construct[abi:ne180100]<Espresso::blob<float,1>,int &,int &,int &,int &>((uint64_t)&v7, (uint64_t)(a1 + 3), a2, a3, a4, a5);
  return a1;
}

void sub_22D8674D4(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<Espresso::blob<float,1>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24F957728;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<Espresso::blob<float,1>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24F957728;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x22E318364);
}

uint64_t std::__shared_ptr_emplace<Espresso::blob<float,1>>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t std::allocator<Espresso::blob<float,1>>::construct[abi:ne180100]<Espresso::blob<float,1>,int &,int &,int &,int &>(uint64_t a1, uint64_t a2, int *a3, int *a4, int *a5, int *a6)
{
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v7 = *a3;
  v8 = *a4;
  v9 = *a5;
  v10 = *a6;
  *(_QWORD *)a2 = &off_24F957778;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_DWORD *)(a2 + 8) = v7;
  result = Espresso::kern_alloc((Espresso *)(4 * v7 * (uint64_t)v8 * v9 * v10));
  *(_QWORD *)(a2 + 16) = result;
  *(_BYTE *)(a2 + 24) = 1;
  return result;
}

void sub_22D8675AC(_Unwind_Exception *a1)
{
  Espresso::blob_rtti_root *v1;
  uint64_t v2;

  std::shared_ptr<Espresso::blob<float,2>>::~shared_ptr[abi:ne180100]((uint64_t)v1 + 48);
  std::shared_ptr<Espresso::blob<float,2>>::~shared_ptr[abi:ne180100](v2);
  Espresso::blob_rtti_root::~blob_rtti_root(v1);
  _Unwind_Resume(a1);
}

void Espresso::blob<float,1>::~blob(uint64_t a1, void *a2)
{
  Espresso *v3;

  *(_QWORD *)a1 = &off_24F957778;
  if (*(_BYTE *)(a1 + 24))
  {
    v3 = *(Espresso **)(a1 + 16);
    if (v3)
      Espresso::kern_dealloc(v3, a2);
  }
  *(_QWORD *)(a1 + 16) = 0;
  std::shared_ptr<Espresso::blob<float,2>>::~shared_ptr[abi:ne180100](a1 + 48);
  std::shared_ptr<Espresso::blob<float,2>>::~shared_ptr[abi:ne180100](a1 + 32);
  Espresso::blob_rtti_root::~blob_rtti_root((Espresso::blob_rtti_root *)a1);
}

{
  Espresso *v3;

  *(_QWORD *)a1 = &off_24F957778;
  if (*(_BYTE *)(a1 + 24))
  {
    v3 = *(Espresso **)(a1 + 16);
    if (v3)
      Espresso::kern_dealloc(v3, a2);
  }
  *(_QWORD *)(a1 + 16) = 0;
  std::shared_ptr<Espresso::blob<float,2>>::~shared_ptr[abi:ne180100](a1 + 48);
  std::shared_ptr<Espresso::blob<float,2>>::~shared_ptr[abi:ne180100](a1 + 32);
  Espresso::blob_rtti_root::~blob_rtti_root((Espresso::blob_rtti_root *)a1);
  JUMPOUT(0x22E318364);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_22D869128(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22D86974C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, void *a19)
{
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_22D869958(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22D8699A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_22D8699EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t Espresso::kern_alloc(Espresso *this)
{
  return MEMORY[0x24BE2F5D0](this);
}

uint64_t Espresso::kern_dealloc(Espresso *this, void *a2)
{
  return MEMORY[0x24BE2F5D8](this, a2);
}

void Espresso::blob_rtti_root::~blob_rtti_root(Espresso::blob_rtti_root *this)
{
  MEMORY[0x24BE2F5E0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24F957438(__p);
}

uint64_t operator delete()
{
  return off_24F957440();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24F957448(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

float expf(float a1)
{
  float result;

  MEMORY[0x24BDAE288](a1);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

