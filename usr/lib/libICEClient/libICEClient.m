void std::__tree<unsigned int>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<unsigned int>::destroy(*a1);
    std::__tree<unsigned int>::destroy(a1[1]);
    operator delete(a1);
  }
}

uint64_t *std::__tree<unsigned int>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
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

void ice::registerClientSniffer(uint64_t a1, uint64_t a2)
{
  _anonymous_namespace_ *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  _QWORD *v8;
  char *v9;
  std::string *v10;
  _QWORD v11[2];
  unint64_t v12;

  if (*(char *)(a1 + 23) < 0)
  {
    if (!*(_QWORD *)(a1 + 8))
      return;
  }
  else if (!*(_BYTE *)(a1 + 23))
  {
    return;
  }
  if (*(_QWORD *)a2)
  {
    v5 = qword_253DA6920;
    if (qword_253DA6920)
    {
      v6 = &qword_253DA6920;
      while (1)
      {
        while (1)
        {
          v7 = (uint64_t *)v5;
          v8 = (_QWORD *)(v5 + 32);
          if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((_QWORD *)a1, (void **)(v5 + 32)) & 0x80) == 0)break;
          v5 = *v7;
          v6 = v7;
          if (!*v7)
            goto LABEL_16;
        }
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v8, (void **)a1) & 0x80) == 0)
          break;
        v6 = v7 + 1;
        v5 = v7[1];
        if (!v5)
          goto LABEL_16;
      }
      if (*v6)
        goto LABEL_22;
    }
    else
    {
      v6 = &qword_253DA6920;
      v7 = &qword_253DA6920;
    }
LABEL_16:
    v12 = 0xAAAAAAAAAAAAAA00;
    v9 = (char *)operator new(0x48uLL);
    v11[0] = v9;
    v11[1] = &qword_253DA6920;
    v10 = (std::string *)(v9 + 32);
    if (*(char *)(a1 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
    }
    else
    {
      *(_OWORD *)&v10->__r_.__value_.__l.__data_ = *(_OWORD *)a1;
      *((_QWORD *)v9 + 6) = *(_QWORD *)(a1 + 16);
    }
    *(_OWORD *)(v9 + 56) = *(_OWORD *)a2;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    LOBYTE(v12) = 1;
    *(_QWORD *)v9 = 0;
    *((_QWORD *)v9 + 1) = 0;
    *((_QWORD *)v9 + 2) = v7;
    *v6 = (uint64_t)v9;
    {
      v9 = (char *)*v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)qword_253DA6920, (uint64_t *)v9);
    ++qword_253DA6928;
    v11[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<ice::ClientSnifferDelegateBase>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<ice::ClientSnifferDelegateBase>>,void *>>>>::reset[abi:ne180100]((uint64_t)v11);
LABEL_22:
  }
}

void sub_2116497B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<ice::ClientSnifferDelegateBase>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<ice::ClientSnifferDelegateBase>>,void *>>>>::reset[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t *`anonymous namespace'::sGetMutex(_anonymous_namespace_ *this)
{
  unsigned __int8 v1;

  {
    unk_253DA68D8 = 0u;
    unk_253DA68E8 = 0u;
    unk_253DA68F8 = 0u;
    qword_253DA6908 = 0;
  }
}

uint64_t *`anonymous namespace'::sGetClientSniffers(_anonymous_namespace_ *this)
{
  unsigned __int8 v1;

  if ((v1 & 1) == 0
  {
    qword_253DA6928 = 0;
    qword_253DA6920 = 0;
  }
}

void ice::deregisterClientSniffer(_anonymous_namespace_ *a1)
{
  _anonymous_namespace_ *v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  BOOL v8;

  v4 = v3;
  if (v3 != &qword_253DA6920)
  {
    v5 = (uint64_t *)v3[1];
    if (v5)
    {
      do
      {
        v6 = v5;
        v5 = (uint64_t *)*v5;
      }
      while (v5);
    }
    else
    {
      v7 = v3;
      do
      {
        v6 = (uint64_t *)v7[2];
        v8 = *v6 == (_QWORD)v7;
        v7 = v6;
      }
      while (!v8);
    }
    --qword_253DA6928;
    std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)qword_253DA6920, v3);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<ice::ClientSnifferDelegateBase>>,0>((uint64_t)(v4 + 4));
    operator delete(v4);
  }
}

void sub_21164996C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ice::notifySnifferClientRegistered(_anonymous_namespace_ *a1)
{
  _anonymous_namespace_ *v2;
  void **v3;

  if (v3 != (void **)&qword_253DA6920)
    (*(void (**)(void *))(*(_QWORD *)v3[7] + 16))(v3[7]);
}

void sub_2116499F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ice::notifySnifferClientDeregistered(_anonymous_namespace_ *a1)
{
  _anonymous_namespace_ *v2;
  void **v3;

  if (v3 != (void **)&qword_253DA6920)
    (*(void (**)(void *))(*(_QWORD *)v3[7] + 24))(v3[7]);
}

void sub_211649A7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ice::notifySnifferIndicationRegistered(_anonymous_namespace_ *a1, uint64_t a2)
{
  _anonymous_namespace_ *v4;
  void **v5;

  if (v5 != (void **)&qword_253DA6920)
    (**(void (***)(void *, uint64_t))v5[7])(v5[7], a2);
}

void sub_211649B0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ice::notifySnifferIndicationCanWake(_anonymous_namespace_ *a1, uint64_t a2)
{
  _anonymous_namespace_ *v4;
  void **v5;

  if (v5 != (void **)&qword_253DA6920)
    (*(void (**)(void *, uint64_t))(*(_QWORD *)v5[7] + 8))(v5[7], a2);
}

void sub_211649B9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, void **a2)
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
  return std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(a1, v2, v5, v6);
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(const void *a1, size_t a2, void *__s2, size_t a4)
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

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24CC3E2D8, MEMORY[0x24BEDAAF0]);
}

void sub_211649D24(_Unwind_Exception *a1)
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

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::shared_ptr<ice::ClientSnifferDelegateBase>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::shared_ptr<ice::ClientSnifferDelegateBase>>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  void *v1;

  v1 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v1)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<ice::ClientSnifferDelegateBase>>,0>((uint64_t)v1 + 32);
    operator delete(v1);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<ice::ClientSnifferDelegateBase>>,0>(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 32);
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
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

void **std::__tree<std::__value_type<std::string,std::shared_ptr<ice::ClientSnifferDelegateBase>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<ice::ClientSnifferDelegateBase>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<ice::ClientSnifferDelegateBase>>>>::find<std::string>(uint64_t a1, void **a2)
{
  void **v2;
  _QWORD *v3;
  void **v5;
  char v6;
  _QWORD *v7;

  v2 = (void **)(a1 + 8);
  v3 = *(_QWORD **)(a1 + 8);
  if (!v3)
    return v2;
  v5 = (void **)(a1 + 8);
  do
  {
    v6 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v3 + 4, a2);
    if (v6 >= 0)
      v7 = v3;
    else
      v7 = v3 + 1;
    if (v6 >= 0)
      v5 = (void **)v3;
    v3 = (_QWORD *)*v7;
  }
  while (*v7);
  if (v5 == v2
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, v5 + 4) & 0x80) != 0)
  {
    return v2;
  }
  return v5;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
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
    if (*(uint64_t **)v12 != v7)
      break;
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
    if (v20 && !*((_BYTE *)v20 + 24))
    {
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
      goto LABEL_72;
    }
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
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
  if (!*v7 || *((_BYTE *)v15 + 24))
  {
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_59;
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
    goto LABEL_49;
  }
  v16 = (uint64_t *)v7[1];
  if (v16 && !*((_BYTE *)v16 + 24))
  {
LABEL_59:
    v15 = v7;
  }
  else
  {
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
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

uint64_t ice::AriMsgWrapper<void>::create@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v4;
  uint64_t result;

  v4 = operator new(0x60uLL);
  v4[1] = 0;
  v4[2] = 0;
  *v4 = &off_24CC3E3F8;
  result = MEMORY[0x212BDE520](v4 + 3, a1);
  *a2 = result;
  a2[1] = (uint64_t)v4;
  return result;
}

void sub_21164A3F4(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;
  void *v3;

  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v3);
  _Unwind_Resume(a1);
}

ice::ResponseContext *ice::ResponseContext::ResponseContext(ice::ResponseContext *this, const unsigned __int8 *a2, size_t __sz)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(this, a2, (uint64_t)&a2[__sz], __sz);
  *((_BYTE *)this + 24) = 0;
  return this;
}

{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(this, a2, (uint64_t)&a2[__sz], __sz);
  *((_BYTE *)this + 24) = 0;
  return this;
}

uint64_t ice::AutoSender::AutoSender(uint64_t a1, __int128 *a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return ice::AutoSender::operator=(a1, a2);
}

{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return ice::AutoSender::operator=(a1, a2);
}

uint64_t ice::AutoSender::operator=(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  __int128 v12;

  if ((__int128 *)a1 != a2)
  {
    std::shared_ptr<ice::detail::SendState>::operator=[abi:ne180100](a1, a2);
    v4 = (uint64_t)(a2 + 1);
    std::shared_ptr<ice::detail::SendState>::operator=[abi:ne180100](a1 + 16, a2 + 1);
    v12 = 0uLL;
    std::shared_ptr<ice::detail::SendState>::operator=[abi:ne180100]((uint64_t)a2, &v12);
    v5 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
    if (*((_QWORD *)&v12 + 1))
    {
      v6 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
      do
        v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
    v12 = 0uLL;
    std::shared_ptr<ice::detail::SendState>::operator=[abi:ne180100](v4, &v12);
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
  }
  return a1;
}

void ice::AutoSender::~AutoSender(ice::detail::SendState **this)
{
  ice::detail::SendState *v2;

  v2 = *this;
  if (v2)
    ice::detail::SendState::send(v2);
  std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100]((uint64_t)(this + 2));
  std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100]((uint64_t)this);
}

BOOL ice::detail::SendState::send(ice::detail::SendState *this)
{
  std::__shared_weak_count *v2;
  std::__shared_weak_count *v3;
  uint64_t v4;
  _BOOL8 v5;
  void *v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count_vtbl *v8;
  std::__shared_weak_count *v9;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  __int128 v20;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  __int128 v31;
  void *v32[2];
  unint64_t v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  __int128 v36;
  void (*v37)(uint64_t, const void *, size_t);
  void *v38;
  std::__shared_weak_count *v39;
  std::__shared_weak_count *v40;
  _QWORD aBlock[5];

  v2 = (std::__shared_weak_count *)*((_QWORD *)this + 3);
  if (!v2)
    return 0;
  v3 = std::__shared_weak_count::lock(v2);
  v35 = v3;
  if (!v3)
    return 0;
  v4 = *((_QWORD *)this + 2);
  v34 = v4;
  v5 = v4 != 0;
  if (v4)
  {
    v6 = (void *)*((_QWORD *)this + 4);
    v8 = *(std::__shared_weak_count_vtbl **)this;
    v7 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
    if (!v7 || (v9 = std::__shared_weak_count::lock(v7)) == 0)
      std::__throw_bad_weak_ptr[abi:ne180100]();
    v10 = v9;
    v11 = (std::__shared_weak_count *)operator new(0x28uLL);
    v11->__shared_owners_ = 0;
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    v11->__shared_weak_owners_ = 0;
    v11[1].__vftable = v8;
    v11->__vftable = (std::__shared_weak_count_vtbl *)&off_24CC3E478;
    v11[1].__shared_owners_ = (uint64_t)v10;
    v13 = MEMORY[0x24BDAC760];
    *(_QWORD *)&v36 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v36 + 1) = 1174405120;
    v37 = ___ZN3ice6detail12wrapCallbackIZNS0_9SendState4sendEvE3__0vEEN8dispatch5blockIU13block_pointerFiPhjEEENSt3__117integral_constantIiLi2EEEOT__block_invoke;
    v38 = &__block_descriptor_tmp;
    v39 = v11 + 1;
    v40 = v11;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
    aBlock[0] = v13;
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN3ice6detail12wrapCallbackIvEEN8dispatch5blockIU13block_pointerFiPhjEEENSt3__117integral_constantIiLi2EEEU13block_pointerFT_S4_jE_block_invoke;
    aBlock[3] = &unk_24CC3E4C0;
    aBlock[4] = &v36;
    v15 = _Block_copy(aBlock);
    v16 = v40;
    if (v40)
    {
      v17 = (unint64_t *)&v40->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
    }
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v32 = v20;
    v33 = 0xAAAAAAAAAAAAAAAALL;
    std::shared_ptr<ice::Client>::shared_ptr[abi:ne180100]<ice::Client,void>(&v36, (_QWORD *)(v4 + 8));
    v21 = v36;
    v31 = v36;
    if (*((_QWORD *)&v36 + 1))
    {
      v22 = (unint64_t *)(*((_QWORD *)&v36 + 1) + 8);
      do
        v23 = __ldxr(v22);
      while (__stxr(v23 + 1, v22));
      v24 = (std::__shared_weak_count *)*((_QWORD *)&v36 + 1);
      v32[0] = v6;
      v32[1] = 0;
      LODWORD(v33) = *(_DWORD *)(v21 + 72);
      if (*((_QWORD *)&v36 + 1))
      {
        v25 = (unint64_t *)(*((_QWORD *)&v36 + 1) + 8);
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }
      v32[1] = v15;
    }
    else
    {
      LODWORD(v33) = *(_DWORD *)(v36 + 72);
      v32[0] = v6;
      v32[1] = v15;
    }
    ice::SendMsgBaseProxy::~SendMsgBaseProxy((ice::SendMsgBaseProxy *)&v31);
    v27 = v35;
    if (!v35)
      return 1;
  }
  else
  {
    v27 = v3;
  }
  v28 = (unint64_t *)&v27->__shared_owners_;
  do
    v29 = __ldaxr(v28);
  while (__stlxr(v29 - 1, v28));
  if (!v29)
  {
    ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
    std::__shared_weak_count::__release_weak(v27);
  }
  return v5;
}

void sub_21164A894(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  const void *v16;

  if (v16)
    _Block_release(v16);
  std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t std::shared_ptr<ice::detail::SendState>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
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

BOOL ice::AutoSender::operator BOOL(_QWORD *a1)
{
  return *a1 != 0;
}

void ice::AutoSender::thenInternal(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  __int128 v11;

  v3 = a1 + 16;
  std::shared_ptr<ice::detail::SendState>::operator=[abi:ne180100](*(_QWORD *)(a1 + 16) + 80, a2);
  v4 = (uint64_t)(a2 + 1);
  std::shared_ptr<ice::detail::SendState>::operator=[abi:ne180100](v3, a2 + 1);
  v11 = 0uLL;
  std::shared_ptr<ice::detail::SendState>::operator=[abi:ne180100]((uint64_t)a2, &v11);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
  if (*((_QWORD *)&v11 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  v11 = 0uLL;
  std::shared_ptr<ice::detail::SendState>::operator=[abi:ne180100](v4, &v11);
  v8 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
  if (*((_QWORD *)&v11 + 1))
  {
    v9 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

uint64_t ice::AutoSender::then(uint64_t a1, __int128 *a2)
{
  ice::AutoSender::thenInternal(a1, a2);
  return a1;
}

{
  ice::AutoSender::thenInternal(a1, a2);
  return a1;
}

__n128 ice::detail::SendState::SendState(__n128 *a1, unint64_t *a2, __n128 *a3)
{
  unint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  __n128 result;

  a1->n128_u64[0] = 0;
  a1->n128_u64[1] = 0;
  v3 = a2[1];
  a1[1].n128_u64[0] = *a2;
  a1[1].n128_u64[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result = *a3;
  a1[2] = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  a1[4].n128_u64[1] = 0;
  a1[5].n128_u64[0] = 0;
  a1[5].n128_u64[1] = 0;
  return result;
}

{
  unint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  __n128 result;

  a1->n128_u64[0] = 0;
  a1->n128_u64[1] = 0;
  v3 = a2[1];
  a1[1].n128_u64[0] = *a2;
  a1[1].n128_u64[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result = *a3;
  a1[2] = *a3;
  a3->n128_u64[0] = 0;
  a3->n128_u64[1] = 0;
  a1[4].n128_u64[1] = 0;
  a1[5].n128_u64[0] = 0;
  a1[5].n128_u64[1] = 0;
  return result;
}

void ice::detail::SendState::operator()(uint64_t a1, const void *a2, size_t __sz)
{
  uint64_t v4;
  char v5;
  ice::detail::SendState *v6;
  void *__p;
  void *v8;
  uint64_t v9;
  unint64_t v10;

  if (*(_QWORD *)(a1 + 72))
  {
    v9 = 0;
    v10 = 0xAAAAAAAAAAAAAAAALL;
    __p = 0;
    v8 = 0;
    std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(&__p, a2, (uint64_t)a2 + __sz, __sz);
    v4 = *(_QWORD *)(a1 + 72);
    LOBYTE(v10) = *(_QWORD *)(a1 + 80) == 0;
    if (!v4)
      std::__throw_bad_function_call[abi:ne180100]();
    v5 = (*(uint64_t (**)(uint64_t, void **))(*(_QWORD *)v4 + 48))(v4, &__p);
    if (__p)
    {
      v8 = __p;
      operator delete(__p);
    }
    if ((v5 & 1) != 0)
    {
      v6 = *(ice::detail::SendState **)(a1 + 80);
      if (v6)
        ice::detail::SendState::send(v6);
    }
  }
}

void sub_21164ABA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (__sz)
  {
    v6 = result;
    result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_21164AC18(_Unwind_Exception *exception_object)
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

char *std::vector<unsigned char>::__vallocate[abi:ne180100](_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__shared_ptr_emplace<ice::AriMsgWrapper<void>::create(unsigned int)::make_shared_enabler,std::allocator<ice::AriMsgWrapper<void>::create(unsigned int)::make_shared_enabler>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24CC3E3F8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ice::AriMsgWrapper<void>::create(unsigned int)::make_shared_enabler,std::allocator<ice::AriMsgWrapper<void>::create(unsigned int)::make_shared_enabler>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24CC3E3F8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BDE70CLL);
}

void std::__shared_ptr_emplace<ice::AriMsgWrapper<void>::create(unsigned int)::make_shared_enabler,std::allocator<ice::AriMsgWrapper<void>::create(unsigned int)::make_shared_enabler>>::__on_zero_shared(uint64_t a1)
{
  AriMsg::~AriMsg((AriMsg *)(a1 + 24));
}

uint64_t std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100](uint64_t a1)
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

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB808] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB6D8], MEMORY[0x24BEDAC00]);
}

void ___ZN3ice6detail12wrapCallbackIZNS0_9SendState4sendEvE3__0vEEN8dispatch5blockIU13block_pointerFiPhjEEENSt3__117integral_constantIiLi2EEEOT__block_invoke(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t *v3;

  v3 = *(uint64_t **)(a1 + 32);
  if (v3)
    ice::detail::SendState::operator()(*v3, a2, a3);
}

uint64_t __copy_helper_block_e8_32c61_ZTSNSt3__110shared_ptrIZN3ice6detail9SendState4sendEvE3__0EE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(result + 40) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_32c61_ZTSNSt3__110shared_ptrIZN3ice6detail9SendState4sendEvE3__0EE(uint64_t a1)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  v1 = *(std::__shared_weak_count **)(a1 + 40);
  if (v1)
  {
    p_shared_owners = (unint64_t *)&v1->__shared_owners_;
    do
      v3 = __ldaxr(p_shared_owners);
    while (__stlxr(v3 - 1, p_shared_owners));
    if (!v3)
    {
      ((void (*)(std::__shared_weak_count *))v1->__on_zero_shared)(v1);
      std::__shared_weak_count::__release_weak(v1);
    }
  }
}

void std::__shared_ptr_emplace<ice::detail::SendState::send(void)::$_0,std::allocator<ice::detail::SendState::send(void)::$_0>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24CC3E478;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ice::detail::SendState::send(void)::$_0,std::allocator<ice::detail::SendState::send(void)::$_0>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24CC3E478;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BDE70CLL);
}

uint64_t std::__shared_ptr_emplace<ice::detail::SendState::send(void)::$_0,std::allocator<ice::detail::SendState::send(void)::$_0>>::__on_zero_shared(uint64_t a1)
{
  return std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100](a1 + 24);
}

uint64_t ___ZN3ice6detail12wrapCallbackIvEEN8dispatch5blockIU13block_pointerFiPhjEEENSt3__117integral_constantIiLi2EEEU13block_pointerFT_S4_jE_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 0;
}

_QWORD *std::shared_ptr<ice::Client>::shared_ptr[abi:ne180100]<ice::Client,void>(_QWORD *a1, _QWORD *a2)
{
  std::__shared_weak_count *v3;
  std::__shared_weak_count *v4;

  v3 = (std::__shared_weak_count *)a2[1];
  *a1 = *a2;
  if (!v3)
  {
    a1[1] = 0;
LABEL_5:
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  v4 = std::__shared_weak_count::lock(v3);
  a1[1] = v4;
  if (!v4)
    goto LABEL_5;
  return a1;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x212BDE70CLL);
}

const char *ice::getMsgName(ice *this)
{
  uint64_t v1;
  const char *result;
  uint64_t v3;

  v1 = Ari::MsgDefById((Ari *)(this >> 26));
  result = "Unknown";
  if (v1)
  {
    v3 = *(_QWORD *)(v1 + 48);
    if (v3)
      return (const char *)v3;
  }
  return result;
}

{
  uint64_t v1;
  const char *result;
  uint64_t v3;

  v1 = Ari::MsgDefById(this);
  result = "Unknown";
  if (v1)
  {
    v3 = *(_QWORD *)(v1 + 48);
    if (v3)
      return (const char *)v3;
  }
  return result;
}

uint64_t ice::isARIResponseValid(uint64_t a1, AriMsg *this, Ari *a3)
{
  uint64_t result;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  result = AriMsg::isValid(this);
  if ((_DWORD)result)
  {
    if (AriMsg::isValid(this))
    {
      v7 = *(NSObject **)(a1 + 40);
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (v8)
      {
        v9 = 136315138;
        v10 = Ari::MsgNameById(a3);
        _os_log_impl(&dword_211648000, v7, OS_LOG_TYPE_DEFAULT, "#N Response %s is invalid", (uint8_t *)&v9, 0xCu);
        return 0;
      }
    }
    else
    {
      return 1;
    }
  }
  return result;
}

BOOL ice::isARIResponseValid(ice *this, const AriSdk::MsgBase *a2)
{
  int v2;
  unint64_t GMID;
  int v4;

  v2 = (int)a2;
  GMID = AriSdk::MsgBase::getGMID(this);
  v4 = (GMID >> 17) & 0xFFFF8000 | ((_DWORD)GMID << 26);
  return v4 != 67600384 && v4 == v2;
}

void ice::Client::create(NSObject **a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _QWORD *a4@<X8>)
{
  std::string *v8;
  __int128 v9;
  int v10;
  const std::string::value_type *v11;
  std::string::size_type v12;
  std::string *v13;
  __int128 v14;
  std::string *v15;
  __int128 v16;
  void **v17;
  dispatch_queue_t v18;
  NSObject *v19;
  std::__shared_weak_count *v20;
  std::__shared_weak_count *v21;
  unint64_t *p_shared_owners;
  _QWORD *v23;
  std::__shared_weak_count *v24;
  char *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *shared_weak_owners;
  unint64_t v29;
  unint64_t *p_shared_weak_owners;
  unint64_t v31;
  unint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t v35;
  std::string v36;
  std::string v37;
  std::string v38;
  void *__p[2];
  int64_t v40;

  if (!*a1)
  {
    std::string::basic_string[abi:ne180100]<0>(&v36, "ice");
    v8 = std::string::append(&v36, ".", 1uLL);
    v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
    v37.__r_.__value_.__r.__words[2] = v8->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v9;
    v8->__r_.__value_.__l.__size_ = 0;
    v8->__r_.__value_.__r.__words[2] = 0;
    v8->__r_.__value_.__r.__words[0] = 0;
    v10 = *(char *)(a2 + 23);
    if (v10 >= 0)
      v11 = (const std::string::value_type *)a2;
    else
      v11 = *(const std::string::value_type **)a2;
    if (v10 >= 0)
      v12 = *(unsigned __int8 *)(a2 + 23);
    else
      v12 = *(_QWORD *)(a2 + 8);
    v13 = std::string::append(&v37, v11, v12);
    v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v38.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v38.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    v15 = std::string::append(&v38, ".queue", 6uLL);
    v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    v40 = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    if (v40 >= 0)
      v17 = __p;
    else
      v17 = (void **)__p[0];
    v18 = dispatch_queue_create((const char *)v17, 0);
    v19 = *a1;
    *a1 = v18;
    if (v19)
      dispatch_release(v19);
    if (SHIBYTE(v40) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v38.__r_.__value_.__l.__data_);
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v37.__r_.__value_.__l.__data_);
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v36.__r_.__value_.__l.__data_);
  }
  v20 = (std::__shared_weak_count *)operator new(0xC8uLL);
  v21 = v20;
  v20->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v20->__shared_owners_;
  v20->__shared_weak_owners_ = 0;
  v20->__vftable = (std::__shared_weak_count_vtbl *)&off_24CC3E678;
  v23 = &v20[1].__vftable;
  __p[0] = *a1;
  *a1 = 0;
  v24 = (std::__shared_weak_count *)a3[1];
  *a3 = 0;
  a3[1] = 0;
  if (*(char *)(a2 + 23) >= 0)
    v25 = (char *)a2;
  else
    v25 = *(char **)a2;
  ice::Client::Client((uint64_t)&v20[1], (NSObject **)__p, v25);
  if (v24)
  {
    v26 = (unint64_t *)&v24->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
      std::__shared_weak_count::__release_weak(v24);
    }
  }
  *v23 = &off_24CC3E6C8;
  if (__p[0])
    dispatch_release((dispatch_object_t)__p[0]);
  shared_weak_owners = (std::__shared_weak_count *)v21[1].__shared_weak_owners_;
  if (shared_weak_owners)
  {
    if (shared_weak_owners->__shared_owners_ != -1)
      goto LABEL_44;
    do
      v29 = __ldxr(p_shared_owners);
    while (__stxr(v29 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v21->__shared_weak_owners_;
    do
      v31 = __ldxr(p_shared_weak_owners);
    while (__stxr(v31 + 1, p_shared_weak_owners));
    v21[1].__shared_owners_ = (uint64_t)v23;
    v21[1].__shared_weak_owners_ = (uint64_t)v21;
    std::__shared_weak_count::__release_weak(shared_weak_owners);
  }
  else
  {
    do
      v32 = __ldxr(p_shared_owners);
    while (__stxr(v32 + 1, p_shared_owners));
    v33 = (unint64_t *)&v21->__shared_weak_owners_;
    do
      v34 = __ldxr(v33);
    while (__stxr(v34 + 1, v33));
    v21[1].__shared_owners_ = (uint64_t)v23;
    v21[1].__shared_weak_owners_ = (uint64_t)v21;
  }
  do
    v35 = __ldaxr(p_shared_owners);
  while (__stlxr(v35 - 1, p_shared_owners));
  if (!v35)
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
  }
LABEL_44:
  *a4 = v23;
  a4[1] = v21;
}

void sub_21164B32C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,dispatch_object_t object)
{
  if (a28 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

void ice::Client::create(NSObject **a1@<X0>, char *a2@<X1>, std::__shared_weak_count **a3@<X8>)
{
  std::string *v6;
  __int128 v7;
  size_t v8;
  std::string *v9;
  __int128 v10;
  std::string *v11;
  __int128 v12;
  void **v13;
  dispatch_queue_t v14;
  NSObject *v15;
  std::__shared_weak_count *v16;
  unint64_t *p_shared_owners;
  std::__shared_weak_count *v18;
  NSObject *v19;
  std::__shared_weak_count *shared_weak_owners;
  unint64_t v21;
  unint64_t *p_shared_weak_owners;
  unint64_t v23;
  unint64_t v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  std::string v28;
  std::string v29;
  std::string v30;
  void *__p[2];
  int64_t v32;

  if (!*a1)
  {
    std::string::basic_string[abi:ne180100]<0>(&v28, "ice");
    v6 = std::string::append(&v28, ".", 1uLL);
    v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
    v29.__r_.__value_.__r.__words[2] = v6->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v7;
    v6->__r_.__value_.__l.__size_ = 0;
    v6->__r_.__value_.__r.__words[2] = 0;
    v6->__r_.__value_.__r.__words[0] = 0;
    v8 = strlen(a2);
    v9 = std::string::append(&v29, a2, v8);
    v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
    v30.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v30.__r_.__value_.__l.__data_ = v10;
    v9->__r_.__value_.__l.__size_ = 0;
    v9->__r_.__value_.__r.__words[2] = 0;
    v9->__r_.__value_.__r.__words[0] = 0;
    v11 = std::string::append(&v30, ".queue", 6uLL);
    v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v32 = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    if (v32 >= 0)
      v13 = __p;
    else
      v13 = (void **)__p[0];
    v14 = dispatch_queue_create((const char *)v13, 0);
    v15 = *a1;
    *a1 = v14;
    if (v15)
      dispatch_release(v15);
    if (SHIBYTE(v32) < 0)
      operator delete(__p[0]);
    if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v30.__r_.__value_.__l.__data_);
    if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v29.__r_.__value_.__l.__data_);
    if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v28.__r_.__value_.__l.__data_);
  }
  v16 = (std::__shared_weak_count *)operator new(0xC8uLL);
  v16->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v16->__shared_owners_;
  v16->__shared_weak_owners_ = 0;
  v16->__vftable = (std::__shared_weak_count_vtbl *)&off_24CC3E700;
  v18 = v16 + 1;
  __p[0] = *a1;
  v19 = __p[0];
  *a1 = 0;
  ice::Client::Client((uint64_t)&v16[1], (NSObject **)__p, a2);
  v16[1].__vftable = (std::__shared_weak_count_vtbl *)&off_24CC3E750;
  if (v19)
    dispatch_release(v19);
  shared_weak_owners = (std::__shared_weak_count *)v16[1].__shared_weak_owners_;
  if (shared_weak_owners)
  {
    if (shared_weak_owners->__shared_owners_ != -1)
      goto LABEL_30;
    do
      v21 = __ldxr(p_shared_owners);
    while (__stxr(v21 + 1, p_shared_owners));
    p_shared_weak_owners = (unint64_t *)&v16->__shared_weak_owners_;
    do
      v23 = __ldxr(p_shared_weak_owners);
    while (__stxr(v23 + 1, p_shared_weak_owners));
    v16[1].__shared_owners_ = (uint64_t)v18;
    v16[1].__shared_weak_owners_ = (uint64_t)v16;
    std::__shared_weak_count::__release_weak(shared_weak_owners);
  }
  else
  {
    do
      v24 = __ldxr(p_shared_owners);
    while (__stxr(v24 + 1, p_shared_owners));
    v25 = (unint64_t *)&v16->__shared_weak_owners_;
    do
      v26 = __ldxr(v25);
    while (__stxr(v26 + 1, v25));
    v16[1].__shared_owners_ = (uint64_t)v18;
    v16[1].__shared_weak_owners_ = (uint64_t)v16;
  }
  do
    v27 = __ldaxr(p_shared_owners);
  while (__stlxr(v27 - 1, p_shared_owners));
  if (!v27)
  {
    ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
    std::__shared_weak_count::__release_weak(v16);
  }
LABEL_30:
  *a3 = v18;
  a3[1] = v16;
}

void sub_21164B614(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  if (a15 < 0)
    operator delete(a10);
  _Unwind_Resume(exception_object);
}

uint64_t ice::Client::Client(uint64_t a1, NSObject **a2, char *a3)
{
  NSObject *v6;
  _BYTE v8[16];
  _BYTE v9[8];

  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v8, "com.apple.ari.client", a3);
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  v6 = *a2;
  *(_QWORD *)(a1 + 24) = *a2;
  if (v6)
    dispatch_retain(v6);
  *(_QWORD *)(a1 + 32) = 0;
  ctu::OsLogLogger::OsLogLogger();
  ctu::OsLogLogger::OsLogLogger();
  MEMORY[0x212BDE4C0](v9);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v8);
  *(_QWORD *)a1 = &off_24CC3E530;
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)(a1 + 48), a3);
  *(_DWORD *)(a1 + 72) = -1;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 80) = a1 + 88;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 104) = a1 + 104;
  *(_QWORD *)(a1 + 112) = a1 + 104;
  *(_QWORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 128) = a1 + 128;
  *(_QWORD *)(a1 + 136) = a1 + 128;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  return a1;
}

{
  if (a3[23] < 0)
    a3 = *(char **)a3;
  return ice::Client::Client(a1, a2, a3);
}

{
  if (a3[23] < 0)
    a3 = *(char **)a3;
  return ice::Client::Client(a1, a2, a3);
}

uint64_t ice::Client::getClientId(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v4;

  v4 = *(_DWORD *)(a1 + 72);
  v2 = *(_QWORD *)(a2 + 24);
  if (!v2)
    std::__throw_bad_function_call[abi:ne180100]();
  return (*(uint64_t (**)(uint64_t, int *))(*(_QWORD *)v2 + 48))(v2, &v4);
}

void ice::Client::getClientId(ice::Client *this@<X0>, _QWORD *a2@<X8>)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  unint64_t *v12;
  unint64_t v13;
  unint64_t v14;
  std::exception_ptr v15;

  v4 = (std::__shared_weak_count *)operator new(0x20uLL);
  v4->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v4->__shared_owners_;
  v4->__shared_weak_owners_ = 0;
  v4->__vftable = (std::__shared_weak_count_vtbl *)&off_24CC3E788;
  v6 = operator new();
  v4[1].__vftable = (std::__shared_weak_count_vtbl *)v6;
  v7 = (uint64_t *)&v4[1];
  *(_QWORD *)(v6 + 24) = 850045863;
  *(_QWORD *)(v6 + 8) = 0;
  *(_QWORD *)(v6 + 16) = 0;
  *(_OWORD *)(v6 + 32) = 0u;
  *(_OWORD *)(v6 + 48) = 0u;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_QWORD *)(v6 + 80) = 0;
  *(_QWORD *)(v6 + 88) = 1018212795;
  *(_OWORD *)(v6 + 96) = 0u;
  *(_OWORD *)(v6 + 112) = 0u;
  *(_OWORD *)(v6 + 124) = 0u;
  *(_QWORD *)v6 = &off_24CC3E7D8;
  std::mutex::lock((std::mutex *)(v6 + 24));
  if ((*(_BYTE *)(v6 + 136) & 1) != 0
    || (v15.__ptr_ = 0, v8 = *(_QWORD *)(v6 + 16), std::exception_ptr::~exception_ptr(&v15), v8))
  {
    std::__throw_future_error[abi:ne180100](2u);
  }
  v9 = *((_DWORD *)this + 18);
  *(_DWORD *)(v6 + 136) |= 5u;
  *(_DWORD *)(v6 + 140) = v9;
  std::condition_variable::notify_all((std::condition_variable *)(v6 + 88));
  std::mutex::unlock((std::mutex *)(v6 + 24));
  v10 = *v7;
  if (!*v7)
    std::__throw_future_error[abi:ne180100](3u);
  *a2 = v10;
  std::mutex::lock((std::mutex *)(v10 + 24));
  v11 = *(_DWORD *)(v10 + 136);
  if ((v11 & 2) != 0)
    std::__throw_future_error[abi:ne180100](1u);
  v12 = (unint64_t *)(v10 + 8);
  do
    v13 = __ldxr(v12);
  while (__stxr(v13 + 1, v12));
  *(_DWORD *)(v10 + 136) = v11 | 2;
  std::mutex::unlock((std::mutex *)(v10 + 24));
  do
    v14 = __ldaxr(p_shared_owners);
  while (__stlxr(v14 - 1, p_shared_owners));
  if (!v14)
  {
    ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
    std::__shared_weak_count::__release_weak(v4);
  }
}

void sub_21164B9B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  std::mutex *v10;

  std::mutex::unlock(v10);
  std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  _Unwind_Resume(a1);
}

void ice::Client::start(ice::Client *this)
{
  const char *v2;
  unsigned int v3;
  NSObject *v4;
  AriHost **v5;
  int v6;
  AriHost *v7;
  int v8;
  NSObject *v9;
  int v10;
  int v11;
  uint64_t v12;
  unsigned int v13;
  const void *v14;
  void *v15;
  const void *v16;
  void *v17;
  const void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  Ari *v22;
  const void *v23;
  void *v24;
  const void *v25;
  void *v26;
  const void *v27;
  void *v28;
  char v29;
  NSObject *v30;
  uint64_t v31;
  unsigned int *v32;
  unsigned int *v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t *p_shared_owners;
  unint64_t v38;
  unint64_t *p_shared_weak_owners;
  unint64_t v40;
  NSObject *v41;
  const void *v42;
  const void *v43;
  std::string v44;
  uint8_t buf[24];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v2 = (char *)this + 72;
  v3 = *((_DWORD *)this + 18);
  if (v3 != -1)
  {
    v4 = *((_QWORD *)this + 5);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = (v3 >> 8) & 0x7F;
      _os_log_impl(&dword_211648000, v4, OS_LOG_TYPE_DEFAULT, "#I Already registered with ARI runtime as client %d", buf, 8u);
      v3 = *(_DWORD *)v2;
    }
    AriHost::ContinueTransactions((AriHost *)((v3 >> 8) & 0x7F));
    return;
  }
  v5 = (AriHost **)((char *)this + 48);
  v6 = *((char *)this + 71);
  v7 = (ice::Client *)((char *)this + 48);
  if (v6 < 0)
    v7 = *v5;
  v8 = AriHost::RegisterClient(v7, v2, *((int **)this + 3), (dispatch_queue_s *)0xFFFFFFFFLL);
  v9 = *((_QWORD *)this + 5);
  if (v8)
  {
    v10 = v8;
    if (os_log_type_enabled(*((os_log_t *)this + 5), OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = asString();
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v10;
      _os_log_error_impl(&dword_211648000, v9, OS_LOG_TYPE_ERROR, "Could not register ARI client: %s (%d)", buf, 0x12u);
    }
    return;
  }
  if (os_log_type_enabled(*((os_log_t *)this + 5), OS_LOG_TYPE_DEFAULT))
  {
    v11 = (*(_DWORD *)v2 >> 8) & 0x7F;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v11;
    _os_log_impl(&dword_211648000, v9, OS_LOG_TYPE_DEFAULT, "#I Registered with ARI runtime as client %d", buf, 8u);
  }
  if (*((char *)this + 71) < 0)
  {
    std::string::__init_copy_ctor_external(&v44, *((const std::string::value_type **)this + 6), *((_QWORD *)this + 7));
  }
  else
  {
    *(_OWORD *)&v44.__r_.__value_.__l.__data_ = *(_OWORD *)v5;
    v44.__r_.__value_.__r.__words[2] = *((_QWORD *)this + 8);
  }
  ice::notifySnifferClientRegistered((_anonymous_namespace_ *)&v44);
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v44.__r_.__value_.__l.__data_);
  v12 = *((_QWORD *)this + 14);
  if ((ice::Client *)v12 != (ice::Client *)((char *)this + 104))
  {
    while (1)
    {
      memset(buf, 170, 16);
      v13 = *(_DWORD *)(v12 + 16);
      v14 = *(const void **)(v12 + 24);
      *(_DWORD *)buf = v13;
      if (!v14)
        break;
      v15 = _Block_copy(v14);
      v16 = v15;
      *(_QWORD *)&buf[8] = v15;
      if (!v15)
      {
        v18 = 0;
LABEL_24:
        v19 = 0;
LABEL_25:
        v20 = 1;
        goto LABEL_26;
      }
      v17 = _Block_copy(v15);
      v18 = v17;
      if (!v17)
        goto LABEL_24;
      v19 = _Block_copy(v17);
      v20 = 0;
LABEL_26:
      v43 = v19;
      ice::Client::regEventHandlerInternal((uint64_t)this, v13, &v43);
      if (v19)
        _Block_release(v19);
      if ((v20 & 1) == 0)
        _Block_release(v18);
      if (v16)
        _Block_release(v16);
      v12 = *(_QWORD *)(v12 + 8);
      if ((ice::Client *)v12 == (ice::Client *)((char *)this + 104))
        goto LABEL_33;
    }
    v16 = 0;
    v18 = 0;
    v19 = 0;
    *(_QWORD *)&buf[8] = 0;
    goto LABEL_25;
  }
LABEL_33:
  std::__list_imp<std::pair<ice::Client::Event,dispatch::block<int({block_pointer})(dispatch_group_s *)>>>::clear((uint64_t *)this + 13);
  v21 = *((_QWORD *)this + 17);
  if ((ice::Client *)v21 != (ice::Client *)((char *)this + 128))
  {
    while (1)
    {
      memset(buf, 170, 16);
      v22 = (Ari *)*(unsigned int *)(v21 + 16);
      v23 = *(const void **)(v21 + 24);
      *(_DWORD *)buf = *(_DWORD *)(v21 + 16);
      if (!v23)
        break;
      v24 = _Block_copy(v23);
      v25 = v24;
      *(_QWORD *)&buf[8] = v24;
      if (!v24)
      {
        v27 = 0;
LABEL_40:
        v28 = 0;
LABEL_41:
        v29 = 1;
        goto LABEL_42;
      }
      v26 = _Block_copy(v24);
      v27 = v26;
      if (!v26)
        goto LABEL_40;
      v28 = _Block_copy(v26);
      v29 = 0;
LABEL_42:
      v42 = v28;
      ice::Client::regIndicationInternal((uint64_t)this, v22, &v42);
      if (v28)
        _Block_release(v28);
      if ((v29 & 1) == 0)
        _Block_release(v27);
      if (v25)
        _Block_release(v25);
      v21 = *(_QWORD *)(v21 + 8);
      if ((ice::Client *)v21 == (ice::Client *)((char *)this + 128))
        goto LABEL_49;
    }
    v25 = 0;
    v27 = 0;
    v28 = 0;
    *(_QWORD *)&buf[8] = 0;
    goto LABEL_41;
  }
LABEL_49:
  std::__list_imp<std::pair<unsigned int,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>>>::clear((uint64_t *)this + 16);
  v30 = *((_QWORD *)this + 5);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = (uint64_t)(*((_QWORD *)this + 20) - *((_QWORD *)this + 19)) >> 2;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v31;
    _os_log_impl(&dword_211648000, v30, OS_LOG_TYPE_DEFAULT, "#I Registering for %zu waking indications", buf, 0xCu);
  }
  v32 = (unsigned int *)*((_QWORD *)this + 19);
  v33 = (unsigned int *)*((_QWORD *)this + 20);
  if (v32 != v33)
  {
    do
      ice::Client::setIndShouldWake(this, (Ari *)*v32++, 1);
    while (v32 != v33);
    v32 = (unsigned int *)*((_QWORD *)this + 19);
  }
  *((_QWORD *)this + 20) = v32;
  std::shared_ptr<ice::Client>::shared_ptr[abi:ne180100]<ice::Client,void>(buf, (_QWORD *)this + 1);
  v34 = *(std::__shared_weak_count **)&buf[8];
  if (*(_QWORD *)&buf[8])
  {
    v35 = (unint64_t *)(*(_QWORD *)&buf[8] + 16);
    do
      v36 = __ldxr(v35);
    while (__stxr(v36 + 1, v35));
    p_shared_owners = (unint64_t *)&v34->__shared_owners_;
    do
      v38 = __ldaxr(p_shared_owners);
    while (__stlxr(v38 - 1, p_shared_owners));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
  if (v34)
  {
    p_shared_weak_owners = (unint64_t *)&v34->__shared_weak_owners_;
    do
      v40 = __ldxr(p_shared_weak_owners);
    while (__stxr(v40 + 1, p_shared_weak_owners));
  }
  if (AriHost::SetRTEventHandler())
  {
    v41 = *((_QWORD *)this + 5);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211648000, v41, OS_LOG_TYPE_DEFAULT, "#N Could not register for AriHost::ARI_RT_ERROR runtime event handler", buf, 2u);
    }
  }
  if (v34)
  {
    std::__shared_weak_count::__release_weak(v34);
    std::__shared_weak_count::__release_weak(v34);
  }
}

void sub_21164BF10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,char a26)
{
  std::__shared_weak_count *v26;

  if (a16)
    std::__shared_weak_count::__release_weak(a16);
  if (v26)
    std::__shared_weak_count::__release_weak(v26);
  _Unwind_Resume(exception_object);
}

void ice::Client::regEventHandlerInternal(uint64_t a1, unsigned int a2, const void **a3)
{
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  const char *v9;
  const void *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t *p_shared_owners;
  unint64_t v18;
  unint64_t *p_shared_weak_owners;
  unint64_t v20;
  void *v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  const char *v28;
  void *aBlock;
  int buf;
  _BYTE buf_4[12];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (*(_DWORD *)(a1 + 72) == -1)
  {
    v8 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (a2 > 3)
        v9 = "???";
      else
        v9 = off_24CC3E8A0[a2];
      buf = 136315138;
      *(_QWORD *)buf_4 = v9;
      _os_log_impl(&dword_211648000, v8, OS_LOG_TYPE_DEFAULT, "#I Client has not yet started, deferring %s event registration until it has", (uint8_t *)&buf, 0xCu);
    }
    v10 = *a3;
    v11 = operator new(0x20uLL);
    *v11 = 0;
    v11[1] = 0;
    *((_DWORD *)v11 + 4) = a2;
    if (v10)
      v12 = _Block_copy(v10);
    else
      v12 = 0;
    v11[3] = v12;
    v13 = *(_QWORD *)(a1 + 104);
    *v11 = v13;
    v11[1] = a1 + 104;
    *(_QWORD *)(v13 + 8) = v11;
    *(_QWORD *)(a1 + 104) = v11;
    ++*(_QWORD *)(a1 + 120);
  }
  else
  {
    v6 = *(NSObject **)(a1 + 40);
    if (a2 < 4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        if (a2 > 3)
          v7 = "???";
        else
          v7 = off_24CC3E8A0[a2];
        buf = 136315138;
        *(_QWORD *)buf_4 = v7;
        _os_log_impl(&dword_211648000, v6, OS_LOG_TYPE_DEFAULT, "#I Registering for event %s", (uint8_t *)&buf, 0xCu);
      }
      std::shared_ptr<ice::Client>::shared_ptr[abi:ne180100]<ice::Client,void>(&buf, (_QWORD *)(a1 + 8));
      v14 = *(std::__shared_weak_count **)&buf_4[4];
      if (*(_QWORD *)&buf_4[4])
      {
        v15 = (unint64_t *)(*(_QWORD *)&buf_4[4] + 16);
        do
          v16 = __ldxr(v15);
        while (__stxr(v16 + 1, v15));
        p_shared_owners = (unint64_t *)&v14->__shared_owners_;
        do
          v18 = __ldaxr(p_shared_owners);
        while (__stlxr(v18 - 1, p_shared_owners));
        if (!v18)
        {
          ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
          std::__shared_weak_count::__release_weak(v14);
        }
      }
      if (v14)
      {
        p_shared_weak_owners = (unint64_t *)&v14->__shared_weak_owners_;
        do
          v20 = __ldxr(p_shared_weak_owners);
        while (__stxr(v20 + 1, p_shared_weak_owners));
      }
      v21 = (void *)*a3;
      if (*a3)
        v21 = _Block_copy(v21);
      aBlock = v21;
      v22 = AriHost::SetRTEventHandler();
      v23 = *(NSObject **)(a1 + 40);
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v24)
        {
          buf = 67109120;
          *(_DWORD *)buf_4 = a2;
          v25 = "#N Could not register for %u runtime event handler";
          v26 = v23;
          v27 = 8;
LABEL_39:
          _os_log_impl(&dword_211648000, v26, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)&buf, v27);
        }
      }
      else if (v24)
      {
        if (a2 > 3)
          v28 = "???";
        else
          v28 = off_24CC3E8A0[a2];
        buf = 136315138;
        *(_QWORD *)buf_4 = v28;
        v25 = "#I Registered for %s successfully";
        v26 = v23;
        v27 = 12;
        goto LABEL_39;
      }
      if (aBlock)
        _Block_release(aBlock);
      if (v14)
      {
        std::__shared_weak_count::__release_weak(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
      return;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      buf = 136315138;
      *(_QWORD *)buf_4 = "???";
      _os_log_error_impl(&dword_211648000, v6, OS_LOG_TYPE_ERROR, "Unhandled event: %s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void sub_21164C374(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, std::__shared_weak_count *a16, void *aBlock)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<ice::Client::Event,dispatch::block<int({block_pointer})(dispatch_group_s *)>>::~pair(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 8);
  if (v2)
    _Block_release(v2);
  return a1;
}

void ice::Client::regIndicationInternal(uint64_t a1, Ari *a2, const void **a3)
{
  unsigned int v6;
  unsigned int v7;
  std::__shared_weak_count *v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  unint64_t *p_shared_weak_owners;
  unint64_t v15;
  void *v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  const void *v24;
  _QWORD *v25;
  void *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t **v29;
  unsigned int v30;
  uint64_t **v31;
  uint64_t v32;
  uint64_t *v33;
  std::string __p;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, ctu *, unsigned int);
  void *v38;
  uint64_t v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  void *aBlock;
  int v43;
  _BYTE buf[18];
  __int16 v45;
  unsigned int v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v6 = a2 >> 26;
  v7 = (a2 >> 15) & 0x3FF;
  if (*(_BYTE *)(Ari::MsgDefById((Ari *)(a2 >> 26)) + 8) == 2)
  {
    if (*(_DWORD *)(a1 + 72) == -1)
    {
      v23 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = Ari::MsgNameById(a2);
        _os_log_impl(&dword_211648000, v23, OS_LOG_TYPE_DEFAULT, "#I Client has not yet started, deferring [%s] indication registration until it has", buf, 0xCu);
      }
      v24 = *a3;
      v25 = operator new(0x20uLL);
      *v25 = 0;
      v25[1] = 0;
      *((_DWORD *)v25 + 4) = (_DWORD)a2;
      if (v24)
        v26 = _Block_copy(v24);
      else
        v26 = 0;
      v25[3] = v26;
      v32 = *(_QWORD *)(a1 + 128);
      *v25 = v32;
      v25[1] = a1 + 128;
      *(_QWORD *)(v32 + 8) = v25;
      *(_QWORD *)(a1 + 128) = v25;
      ++*(_QWORD *)(a1 + 144);
    }
    else
    {
      std::shared_ptr<ice::Client>::shared_ptr[abi:ne180100]<ice::Client,void>(buf, (_QWORD *)(a1 + 8));
      v9 = *(_QWORD *)buf;
      v8 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v10 = (unint64_t *)(*(_QWORD *)&buf[8] + 16);
        do
          v11 = __ldxr(v10);
        while (__stxr(v11 + 1, v10));
        p_shared_owners = (unint64_t *)&v8->__shared_owners_;
        do
          v13 = __ldaxr(p_shared_owners);
        while (__stlxr(v13 - 1, p_shared_owners));
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
      }
      v35 = MEMORY[0x24BDAC760];
      v36 = 1174405120;
      v37 = ___ZN3ice6Client21regIndicationInternalEjN8dispatch5blockIU13block_pointerFiPhjEEE_block_invoke;
      v38 = &__block_descriptor_tmp_6;
      v39 = a1;
      v40 = v9;
      v41 = v8;
      if (v8)
      {
        p_shared_weak_owners = (unint64_t *)&v8->__shared_weak_owners_;
        do
          v15 = __ldxr(p_shared_weak_owners);
        while (__stxr(v15 + 1, p_shared_weak_owners));
      }
      v43 = (int)a2;
      v16 = (void *)*a3;
      if (*a3)
        v16 = _Block_copy(v16);
      aBlock = v16;
      v17 = AriHost::RegIndication();
      v18 = *(NSObject **)(a1 + 40);
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      if (v17)
      {
        if (v19)
        {
          v20 = Ari::MsgNameById(a2);
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v20;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v6;
          v45 = 1024;
          v46 = v7;
          _os_log_impl(&dword_211648000, v18, OS_LOG_TYPE_DEFAULT, "#N Could not register indication: %s (%u, 0x%x)", buf, 0x18u);
        }
      }
      else
      {
        if (v19)
        {
          v27 = Ari::MsgNameById(a2);
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = v27;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v6;
          v45 = 1024;
          v46 = v7;
          _os_log_impl(&dword_211648000, v18, OS_LOG_TYPE_DEFAULT, "#I Successfully registered for indication: %s (%u, 0x%x)", buf, 0x18u);
        }
        v28 = *(uint64_t **)(a1 + 88);
        if (v28)
        {
          while (1)
          {
            while (1)
            {
              v29 = (uint64_t **)v28;
              v30 = *((_DWORD *)v28 + 7);
              if (v30 <= a2)
                break;
              v28 = *v29;
              v31 = v29;
              if (!*v29)
                goto LABEL_36;
            }
            if (v30 >= a2)
              break;
            v28 = v29[1];
            if (!v28)
            {
              v31 = v29 + 1;
              goto LABEL_36;
            }
          }
        }
        else
        {
          v31 = (uint64_t **)(a1 + 88);
          v29 = (uint64_t **)(a1 + 88);
LABEL_36:
          v33 = (uint64_t *)operator new(0x20uLL);
          *((_DWORD *)v33 + 7) = (_DWORD)a2;
          std::__tree<unsigned int>::__insert_node_at((uint64_t **)(a1 + 80), (uint64_t)v29, v31, v33);
        }
        if (*(char *)(a1 + 71) < 0)
          std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(a1 + 48), *(_QWORD *)(a1 + 56));
        else
          __p = *(std::string *)(a1 + 48);
        ice::notifySnifferIndicationRegistered((_anonymous_namespace_ *)&__p, (uint64_t)a2);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (aBlock)
        _Block_release(aBlock);
      if (v41)
        std::__shared_weak_count::__release_weak(v41);
      if (v8)
        std::__shared_weak_count::__release_weak(v8);
    }
  }
  else
  {
    v21 = Ari::MsgNameById(a2);
    v22 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v21;
      _os_log_error_impl(&dword_211648000, v22, OS_LOG_TYPE_ERROR, "%s is not an indication, not registering it", buf, 0xCu);
    }
  }
}

void sub_21164C7F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,std::__shared_weak_count *a21,void *aBlock)
{
  std::__shared_weak_count *v22;

  if (aBlock)
    _Block_release(aBlock);
  if (a21)
    std::__shared_weak_count::__release_weak(a21);
  if (v22)
    std::__shared_weak_count::__release_weak(v22);
  _Unwind_Resume(exception_object);
}

uint64_t std::pair<unsigned int,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>>::~pair(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 8);
  if (v2)
    _Block_release(v2);
  return a1;
}

BOOL ice::Client::setIndShouldWake(ice::Client *this, Ari *a2, int a3)
{
  int v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  char *v13;
  __int32 *v14;
  char *v15;
  NSObject *v16;
  unint64_t v17;
  _DWORD *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  NSObject *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  BOOL v27;
  unint64_t v28;
  uint64_t v29;
  _DWORD *v30;
  unint64_t v31;
  int v32;
  __int128 v34;
  __int128 v35;
  _BYTE v36[24];
  _BYTE *v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = *(unsigned __int8 *)(Ari::MsgDefById((Ari *)(a2 >> 26)) + 8);
  if (v6 == 2)
  {
    if (*((_DWORD *)this + 18) != -1)
    {
      std::shared_ptr<ice::Client>::shared_ptr[abi:ne180100]<ice::Client,void>(&v34, (_QWORD *)this + 1);
      LODWORD(v35) = (_DWORD)a2;
      *((_QWORD *)&v35 + 1) = this;
      v37 = 0;
      v7 = (char *)operator new(0x28uLL);
      *(_QWORD *)v7 = &off_24CC3E820;
      *(_OWORD *)(v7 + 8) = v34;
      v34 = 0uLL;
      *(_OWORD *)(v7 + 24) = v35;
      v37 = v7;
      AriHost::SetMsgWakeable();
      v8 = v37;
      if (v37 == v36)
      {
        v9 = 4;
        v8 = v36;
      }
      else
      {
        if (!v37)
        {
LABEL_18:
          v19 = (std::__shared_weak_count *)*((_QWORD *)&v34 + 1);
          if (*((_QWORD *)&v34 + 1))
          {
            v20 = (unint64_t *)(*((_QWORD *)&v34 + 1) + 8);
            do
              v21 = __ldaxr(v20);
            while (__stlxr(v21 - 1, v20));
            if (!v21)
            {
              ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
              std::__shared_weak_count::__release_weak(v19);
            }
          }
          return v6 == 2;
        }
        v9 = 5;
      }
      (*(void (**)(void))(*v8 + 8 * v9))();
      goto LABEL_18;
    }
    v12 = Ari::MsgNameById(a2);
    v13 = (char *)*((_QWORD *)this + 20);
    v14 = wmemchr(*((__int32 **)this + 19), (__int32)a2, (uint64_t)&v13[-*((_QWORD *)this + 19)] >> 2);
    if (v14)
      v13 = (char *)v14;
    v15 = (char *)*((_QWORD *)this + 20);
    if (a3)
    {
      if (v13 == v15)
      {
        v16 = *((_QWORD *)this + 5);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v39 = v12;
          v40 = 1024;
          v41 = (int)a2;
          _os_log_impl(&dword_211648000, v16, OS_LOG_TYPE_DEFAULT, "#I Client has not yet started, deferring indication %s (0x%x) from waking until it has", buf, 0x12u);
          v13 = (char *)*((_QWORD *)this + 20);
        }
        v17 = *((_QWORD *)this + 21);
        if ((unint64_t)v13 >= v17)
        {
          v23 = (char *)*((_QWORD *)this + 19);
          v24 = (v13 - v23) >> 2;
          v25 = v24 + 1;
          if ((unint64_t)(v24 + 1) >> 62)
            std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
          v26 = v17 - (_QWORD)v23;
          if (v26 >> 1 > v25)
            v25 = v26 >> 1;
          v27 = (unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL;
          v28 = 0x3FFFFFFFFFFFFFFFLL;
          if (!v27)
            v28 = v25;
          if (v28)
          {
            v28 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(v28);
            v23 = (char *)*((_QWORD *)this + 19);
            v13 = (char *)*((_QWORD *)this + 20);
          }
          else
          {
            v29 = 0;
          }
          v30 = (_DWORD *)(v28 + 4 * v24);
          v31 = v28 + 4 * v29;
          *v30 = (_DWORD)a2;
          v18 = v30 + 1;
          while (v13 != v23)
          {
            v32 = *((_DWORD *)v13 - 1);
            v13 -= 4;
            *--v30 = v32;
          }
          *((_QWORD *)this + 19) = v30;
          *((_QWORD *)this + 20) = v18;
          *((_QWORD *)this + 21) = v31;
          if (v23)
            operator delete(v23);
        }
        else
        {
          *(_DWORD *)v13 = (_DWORD)a2;
          v18 = v13 + 4;
        }
        *((_QWORD *)this + 20) = v18;
      }
    }
    else if (v13 != v15)
    {
      v22 = *((_QWORD *)this + 5);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v39 = v12;
        v40 = 1024;
        v41 = (int)a2;
        _os_log_impl(&dword_211648000, v22, OS_LOG_TYPE_DEFAULT, "#I Client has not yet started, removing previous wake request for %s (0x%x)", buf, 0x12u);
        v15 = (char *)*((_QWORD *)this + 20);
      }
      if (v15 != v13 + 4)
        memmove(v13, v13 + 4, v15 - (v13 + 4));
      *((_QWORD *)this + 20) = v15 - 4;
    }
  }
  else
  {
    v10 = Ari::MsgNameById(a2);
    v11 = *((_QWORD *)this + 5);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v39 = v10;
      _os_log_error_impl(&dword_211648000, v11, OS_LOG_TYPE_ERROR, "%s is not an indication, not registering it to wake AP", buf, 0xCu);
    }
  }
  return v6 == 2;
}

void sub_21164CC14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, char *a16)
{
  char *v16;
  char *v18;
  uint64_t v19;

  v18 = a16;
  if (a16 == v16)
  {
    v19 = 4;
    v18 = &a13;
  }
  else
  {
    if (!a16)
      goto LABEL_6;
    v19 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v18 + 8 * v19))();
LABEL_6:
  std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3ice6Client5startEv_block_invoke(_QWORD *a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint8_t v11[16];
  std::__shared_weak_count *v13;

  v2 = (std::__shared_weak_count *)a1[6];
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = a1[4];
  v4 = std::__shared_weak_count::lock(v2);
  v13 = v4;
  if (!v4)
    return 0xFFFFFFFFLL;
  v5 = v4;
  if (a1[5])
  {
    v6 = *(NSObject **)(v3 + 40);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_211648000, v6, OS_LOG_TYPE_DEFAULT, "#I Got AriHost::ARI_RT re-init", v11, 2u);
    }
    AriHost::ReRegisterClient();
    v7 = 0;
  }
  else
  {
    v7 = 0xFFFFFFFFLL;
  }
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  do
    v9 = __ldaxr(p_shared_owners);
  while (__stlxr(v9 - 1, p_shared_owners));
  if (!v9)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  return v7;
}

void sub_21164CD4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c36_ZTSNSt3__18weak_ptrIN3ice6ClientEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(result + 48) = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 16);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return result;
}

void __destroy_helper_block_e8_40c36_ZTSNSt3__18weak_ptrIN3ice6ClientEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1)
    std::__shared_weak_count::__release_weak(v1);
}

void ice::Client::~Client(ice::Client *this)
{
  AriHost *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  std::string __p;
  uint8_t buf[4];
  unsigned int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)this = &off_24CC3E530;
  v2 = (AriHost *)*((unsigned int *)this + 18);
  if ((_DWORD)v2 != -1)
  {
    v3 = (char *)*((_QWORD *)this + 10);
    v4 = (char *)this + 88;
    if (v3 != (char *)this + 88)
    {
      do
      {
        AriHost::DeregIndication((AriHost *)*((unsigned int *)v3 + 7));
        v5 = (char *)*((_QWORD *)v3 + 1);
        if (v5)
        {
          do
          {
            v6 = v5;
            v5 = *(char **)v5;
          }
          while (v5);
        }
        else
        {
          do
          {
            v6 = (char *)*((_QWORD *)v3 + 2);
            v7 = *(_QWORD *)v6 == (_QWORD)v3;
            v3 = v6;
          }
          while (!v7);
        }
        v3 = v6;
      }
      while (v6 != v4);
      v2 = (AriHost *)*((unsigned int *)this + 18);
    }
    v8 = *((_QWORD *)this + 5);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v12 = (v2 >> 8) & 0x7F;
      _os_log_impl(&dword_211648000, v8, OS_LOG_TYPE_DEFAULT, "#I Deregistering client %d", buf, 8u);
      v2 = (AriHost *)*((unsigned int *)this + 18);
    }
    AriHost::DeregisterClient(v2);
    if (*((char *)this + 71) < 0)
      std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)this + 6), *((_QWORD *)this + 7));
    else
      __p = *(std::string *)((_BYTE *)this + 2);
    ice::notifySnifferClientDeregistered((_anonymous_namespace_ *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  v9 = (void *)*((_QWORD *)this + 19);
  if (v9)
  {
    *((_QWORD *)this + 20) = v9;
    operator delete(v9);
  }
  std::__list_imp<std::pair<unsigned int,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>>>::clear((uint64_t *)this + 16);
  std::__list_imp<std::pair<ice::Client::Event,dispatch::block<int({block_pointer})(dispatch_group_s *)>>>::clear((uint64_t *)this + 13);
  std::__tree<unsigned int>::destroy(*((_QWORD **)this + 11));
  if (*((char *)this + 71) < 0)
    operator delete(*((void **)this + 6));
  MEMORY[0x212BDE4C0]((char *)this + 40);
  ctu::SharedSynchronizable<ice::Client>::~SharedSynchronizable((_QWORD *)this + 1);
}

{
  ice::Client::~Client(this);
  JUMPOUT(0x212BDE70CLL);
}

void sub_21164CF48(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

BOOL ice::Client::isIndication(ice::Client *this, unsigned int a2)
{
  return *(_BYTE *)(Ari::MsgDefById((Ari *)(a2 >> 26)) + 8) == 2;
}

uint64_t ___ZN3ice6Client21regIndicationInternalEjN8dispatch5blockIU13block_pointerFiPhjEEE_block_invoke(uint64_t a1, ctu *a2, unsigned int a3)
{
  std::__shared_weak_count *v4;
  uint64_t v7;
  std::__shared_weak_count *v8;
  std::__shared_weak_count *v9;
  NSObject *v10;
  uint64_t v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  unsigned int v15;
  void *p_p;
  uint64_t v17;
  uint64_t v18;
  void *__p;
  char v20;
  std::__shared_weak_count *v22;
  uint8_t buf[4];
  _BYTE v24[10];
  _WORD v25[9];

  *(_QWORD *)&v25[5] = *MEMORY[0x24BDAC8D0];
  v4 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v4)
    return 0;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = std::__shared_weak_count::lock(v4);
  v22 = v8;
  if (!v8)
    return 0;
  v9 = v8;
  if (*(_QWORD *)(a1 + 40))
  {
    v10 = *(NSObject **)(v7 + 40);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v15 = *(_DWORD *)(v7 + 72);
      ctu::to_rle(a2, (const void *)a3);
      if (v20 >= 0)
        p_p = &__p;
      else
        p_p = __p;
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v24 = (v15 >> 8) & 0x7F;
      *(_WORD *)&v24[4] = 1024;
      *(_DWORD *)&v24[6] = a3;
      v25[0] = 2080;
      *(_QWORD *)&v25[1] = p_p;
      _os_log_debug_impl(&dword_211648000, v10, OS_LOG_TYPE_DEBUG, "#D recv: ClientID:%d Length:%u [%s]", buf, 0x18u);
      if (v20 < 0)
        operator delete(__p);
      v10 = *(NSObject **)(v7 + 40);
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v17 = *(int *)(v7 + 72);
      v18 = Ari::MsgNameById((Ari *)*(unsigned int *)(a1 + 64));
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)v24 = v17;
      *(_WORD *)&v24[8] = 2080;
      *(_QWORD *)v25 = v18;
      _os_log_debug_impl(&dword_211648000, v10, OS_LOG_TYPE_DEBUG, "#D %lu: received %s", buf, 0x16u);
    }
    v11 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v11 = 0;
  }
  p_shared_owners = (unint64_t *)&v9->__shared_owners_;
  do
    v13 = __ldaxr(p_shared_owners);
  while (__stlxr(v13 - 1, p_shared_owners));
  if (!v13)
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
  }
  return v11;
}

void sub_21164D1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_40c36_ZTSNSt3__18weak_ptrIN3ice6ClientEEE56c45_ZTSN8dispatch5blockIU13block_pointerFiPhjEEE(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  void *result;

  v3 = a2[6];
  a1[5] = a2[5];
  a1[6] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result = (void *)a2[7];
  if (result)
    result = _Block_copy(result);
  a1[7] = result;
  return result;
}

void __destroy_helper_block_e8_40c36_ZTSNSt3__18weak_ptrIN3ice6ClientEEE56c45_ZTSN8dispatch5blockIU13block_pointerFiPhjEEE(uint64_t a1)
{
  const void *v2;
  std::__shared_weak_count *v3;

  v2 = *(const void **)(a1 + 56);
  if (v2)
    _Block_release(v2);
  v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
}

BOOL ice::Client::deregIndication(ice::Client *this, Ari *a2)
{
  uint64_t v4;
  int v5;
  NSObject *v6;
  _BOOL8 result;
  NSObject *v8;
  const char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  char *v14;
  char *v15;
  char *v16;
  unsigned int v17;
  BOOL v18;
  char **v19;
  char *v20;
  char *v21;
  unsigned int v22;
  BOOL v23;
  char **v24;
  char *v25;
  char *v26;
  NSObject *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  char *v31;
  BOOL v32;
  BOOL v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  _BYTE v41[24];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = Ari::MsgNameById(a2);
  if (*(_BYTE *)(Ari::MsgDefById((Ari *)(a2 >> 26)) + 8) != 2)
  {
    v8 = *((_QWORD *)this + 5);
    result = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    *(_DWORD *)v41 = 136315138;
    *(_QWORD *)&v41[4] = v4;
    v9 = "%s is not an indication, unable to deregister";
    goto LABEL_14;
  }
  if (*((_DWORD *)this + 18) == -1)
  {
    v10 = (char *)this + 128;
    v11 = (char *)*((_QWORD *)this + 17);
    if (v11 != (char *)this + 128)
    {
      v12 = *((_QWORD *)this + 17);
      while (*(_DWORD *)(v12 + 16) != (_DWORD)a2)
      {
        v12 = *(_QWORD *)(v12 + 8);
        if ((char *)v12 == v10)
          goto LABEL_12;
      }
      v27 = *((_QWORD *)this + 5);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v41 = 136315138;
        *(_QWORD *)&v41[4] = v4;
        _os_log_impl(&dword_211648000, v27, OS_LOG_TYPE_DEFAULT, "#I Client has not yet started. Removing queued registration for [%s] indication", v41, 0xCu);
        v11 = (char *)*((_QWORD *)this + 17);
      }
      *(_QWORD *)v41 = v41;
      *(_OWORD *)&v41[8] = (unint64_t)v41;
      if (v11 != v10)
      {
        v28 = 0;
        v29 = *(_DWORD *)(v12 + 16);
        do
        {
          v30 = *((_QWORD *)v11 + 3);
          v31 = (char *)*((_QWORD *)v11 + 1);
          v32 = *((_DWORD *)v11 + 4) == v29 && v30 == *(_QWORD *)(v12 + 24);
          if (v32)
          {
            if (v31 == v10)
            {
              v34 = 1;
LABEL_63:
              v31 = (char *)this + 128;
            }
            else
            {
              while (1)
              {
                v33 = *((_DWORD *)v31 + 4) == v29 && *((_QWORD *)v31 + 3) == v30;
                v34 = v33;
                if (!v33)
                  break;
                v31 = (char *)*((_QWORD *)v31 + 1);
                if (v31 == v10)
                  goto LABEL_63;
              }
            }
            if (v11 != v31)
            {
              v35 = *(_QWORD *)v31;
              if (v41 != v10)
              {
                v36 = 1;
                if ((char *)v35 != v11)
                {
                  v37 = v11;
                  do
                  {
                    v37 = (char *)*((_QWORD *)v37 + 1);
                    ++v36;
                  }
                  while (v37 != (char *)v35);
                }
                *((_QWORD *)this + 18) -= v36;
                v28 += v36;
                *(_QWORD *)&v41[16] = v28;
              }
              v38 = *(_QWORD *)v11;
              *(_QWORD *)(v38 + 8) = *(_QWORD *)(v35 + 8);
              **(_QWORD **)(v35 + 8) = v38;
              v39 = *(_QWORD *)v41;
              *(_QWORD *)(*(_QWORD *)v41 + 8) = v11;
              *(_QWORD *)v11 = v39;
              *(_QWORD *)v41 = v35;
              *(_QWORD *)(v35 + 8) = v41;
            }
            if ((v34 & 1) == 0)
              v31 = (char *)*((_QWORD *)v31 + 1);
          }
          v11 = v31;
        }
        while (v31 != v10);
      }
      std::__list_imp<std::pair<unsigned int,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>>>::clear((uint64_t *)v41);
      return 1;
    }
LABEL_12:
    v8 = *((_QWORD *)this + 5);
    result = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    *(_DWORD *)v41 = 136315138;
    *(_QWORD *)&v41[4] = v4;
    v9 = "Client has not yet started. Cannot deregister [%s] indication as there has been no attempt to register it.";
LABEL_14:
    _os_log_error_impl(&dword_211648000, v8, OS_LOG_TYPE_ERROR, v9, v41, 0xCu);
    return 0;
  }
  v5 = AriHost::DeregIndication(a2);
  v6 = *((_QWORD *)this + 5);
  result = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (!v5)
  {
    if (result)
    {
      *(_DWORD *)v41 = 136315650;
      *(_QWORD *)&v41[4] = v4;
      *(_WORD *)&v41[12] = 1024;
      *(_DWORD *)&v41[14] = a2 >> 26;
      *(_WORD *)&v41[18] = 1024;
      *(_DWORD *)&v41[20] = (a2 >> 15) & 0x3FF;
      _os_log_impl(&dword_211648000, v6, OS_LOG_TYPE_DEFAULT, "#I Successfully deregistered indication: %s (%u, 0x%x)", v41, 0x18u);
    }
    v14 = (char *)this + 88;
    v13 = (uint64_t *)*((_QWORD *)this + 11);
    if (v13)
    {
      v15 = (char *)this + 88;
      v16 = (char *)*((_QWORD *)this + 11);
      do
      {
        v17 = *((_DWORD *)v16 + 7);
        v18 = v17 >= a2;
        if (v17 >= a2)
          v19 = (char **)v16;
        else
          v19 = (char **)(v16 + 8);
        if (v18)
          v15 = v16;
        v16 = *v19;
      }
      while (*v19);
      if (v15 != v14 && *((_DWORD *)v15 + 7) <= a2)
      {
        v20 = (char *)this + 88;
        v21 = (char *)*((_QWORD *)this + 11);
        do
        {
          v22 = *((_DWORD *)v21 + 7);
          v23 = v22 >= a2;
          if (v22 >= a2)
            v24 = (char **)v21;
          else
            v24 = (char **)(v21 + 8);
          if (v23)
            v20 = v21;
          v21 = *v24;
        }
        while (*v24);
        if (v20 != v14 && *((_DWORD *)v20 + 7) <= a2)
        {
          v25 = (char *)*((_QWORD *)v20 + 1);
          if (v25)
          {
            do
            {
              v26 = v25;
              v25 = *(char **)v25;
            }
            while (v25);
          }
          else
          {
            v40 = v20;
            do
            {
              v26 = (char *)*((_QWORD *)v40 + 2);
              v32 = *(_QWORD *)v26 == (_QWORD)v40;
              v40 = v26;
            }
            while (!v32);
          }
          if (*((char **)this + 10) == v20)
            *((_QWORD *)this + 10) = v26;
          --*((_QWORD *)this + 12);
          std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v13, (uint64_t *)v20);
          operator delete(v20);
        }
      }
    }
    return 1;
  }
  if (result)
  {
    *(_DWORD *)v41 = 136315650;
    *(_QWORD *)&v41[4] = v4;
    *(_WORD *)&v41[12] = 1024;
    *(_DWORD *)&v41[14] = a2 >> 26;
    *(_WORD *)&v41[18] = 1024;
    *(_DWORD *)&v41[20] = (a2 >> 15) & 0x3FF;
    _os_log_impl(&dword_211648000, v6, OS_LOG_TYPE_DEFAULT, "#N Could not deregister indication: %s (%u, 0x%x)", v41, 0x18u);
    return 0;
  }
  return result;
}

const char *ice::asString(unsigned int a1)
{
  if (a1 > 3)
    return "???";
  else
    return off_24CC3E8A0[a1];
}

uint64_t ___ZN3ice6Client23regEventHandlerInternalENS0_5EventEN8dispatch5blockIU13block_pointerFiP16dispatch_group_sEEE_block_invoke(uint64_t a1)
{
  std::__shared_weak_count *v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = *(std::__shared_weak_count **)(a1 + 48);
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = std::__shared_weak_count::lock(v2);
  if (!v4)
    return 0xFFFFFFFFLL;
  v5 = v4;
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = *(NSObject **)(v3 + 40);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(int *)(a1 + 64);
      if (v7 > 3)
        v8 = "???";
      else
        v8 = off_24CC3E8A0[v7];
      *(_DWORD *)buf = 136315138;
      v14 = v8;
      _os_log_impl(&dword_211648000, v6, OS_LOG_TYPE_DEFAULT, "#I Got %s callback", buf, 0xCu);
    }
    v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v9 = 0xFFFFFFFFLL;
  }
  p_shared_owners = (unint64_t *)&v5->__shared_owners_;
  do
    v11 = __ldaxr(p_shared_owners);
  while (__stlxr(v11 - 1, p_shared_owners));
  if (!v11)
  {
    ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
    std::__shared_weak_count::__release_weak(v5);
  }
  return v9;
}

void sub_21164D7F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_40c36_ZTSNSt3__18weak_ptrIN3ice6ClientEEE56c61_ZTSN8dispatch5blockIU13block_pointerFiP16dispatch_group_sEEE(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  void *result;

  v3 = a2[6];
  a1[5] = a2[5];
  a1[6] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result = (void *)a2[7];
  if (result)
    result = _Block_copy(result);
  a1[7] = result;
  return result;
}

void __destroy_helper_block_e8_40c36_ZTSNSt3__18weak_ptrIN3ice6ClientEEE56c61_ZTSN8dispatch5blockIU13block_pointerFiP16dispatch_group_sEEE(uint64_t a1)
{
  const void *v2;
  std::__shared_weak_count *v3;

  v2 = *(const void **)(a1 + 56);
  if (v2)
    _Block_release(v2);
  v3 = *(std::__shared_weak_count **)(a1 + 48);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
}

void ice::Client::getRegisteredIndications(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  std::__shared_weak_count *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  NSObject *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD v22[3];
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v21 = a1;
  v3 = v22;
  v4 = (_QWORD *)a2[3];
  if (v4)
  {
    if (v4 == a2)
    {
      v23[0] = v22;
      (*(void (**)(_QWORD *, _QWORD *))(*a2 + 24))(a2, v22);
    }
    else
    {
      v23[0] = (*(uint64_t (**)(_QWORD *))(*v4 + 16))(v4);
    }
  }
  else
  {
    v23[0] = 0;
  }
  v5 = (std::__shared_weak_count *)a1[2];
  if (!v5 || (v6 = a1[1], (v7 = std::__shared_weak_count::lock(v5)) == 0))
    std::__throw_bad_weak_ptr[abi:ne180100]();
  v8 = v7;
  v9 = (_QWORD *)operator new();
  v10 = v9;
  v11 = (_QWORD *)v23[0];
  *v9 = v21;
  if (v11)
  {
    if (v11 == v22)
    {
      v9[4] = v9 + 1;
      (*(void (**)(_QWORD *))(v22[0] + 24))(v22);
      goto LABEL_14;
    }
    v12 = v23;
    v9[4] = v11;
  }
  else
  {
    v12 = v9 + 4;
  }
  *v12 = 0;
LABEL_14:
  v13 = a1[3];
  p_shared_owners = (unint64_t *)&v8->__shared_owners_;
  do
    v15 = __ldxr(p_shared_owners);
  while (__stxr(v15 + 1, p_shared_owners));
  v16 = (_QWORD *)operator new();
  *v16 = v10;
  v16[1] = v6;
  v16[2] = v8;
  v19 = 0;
  v20 = 0;
  dispatch_async_f(v13, v16, (dispatch_function_t)dispatch::async<void ctu::SharedSynchronizable<ice::Client>::execute_wrapped<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0>(ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0,std::default_delete<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0>>)::{lambda(void *)#1}::__invoke);
  std::unique_ptr<void ctu::SharedSynchronizable<ice::Client>::execute_wrapped<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0>(ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0 &&)::{lambda(void)#1},std::default_delete<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0 &&>>::~unique_ptr[abi:ne180100](&v19);
  std::unique_ptr<void ctu::SharedSynchronizable<ice::Client>::execute_wrapped<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0>(ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0 &&)::{lambda(void)#1},std::default_delete<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0 &&>>::~unique_ptr[abi:ne180100](&v20);
  do
    v17 = __ldaxr(p_shared_owners);
  while (__stlxr(v17 - 1, p_shared_owners));
  if (!v17)
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }
  if ((_QWORD *)v23[0] == v22)
  {
    v18 = 4;
  }
  else
  {
    if (!v23[0])
      return;
    v18 = 5;
    v3 = (_QWORD *)v23[0];
  }
  (*(void (**)(_QWORD *))(*v3 + 8 * v18))(v3);
}

void sub_21164DA8C(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

uint64_t ice::Client::stop(uint64_t this, group *a2, dispatch_group_s *a3)
{
  unsigned int v3;

  v3 = *(_DWORD *)(this + 72);
  if (v3 != -1)
    return AriHost::AbortTransactions((AriHost *)((v3 >> 8) & 0x7F), (uint64_t)a2->gr_name, a3);
  return this;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
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

_QWORD *ctu::SharedSynchronizable<ice::Client>::~SharedSynchronizable(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  std::__shared_weak_count *v4;

  v2 = a1[3];
  if (v2)
    dispatch_release(v2);
  v3 = a1[2];
  if (v3)
    dispatch_release(v3);
  v4 = (std::__shared_weak_count *)a1[1];
  if (v4)
    std::__shared_weak_count::__release_weak(v4);
  return a1;
}

void std::__list_imp<std::pair<unsigned int,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>>>::clear(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  const void *v6;

  if (a1[2])
  {
    v2 = *a1;
    v3 = (uint64_t *)a1[1];
    v4 = *v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        v5 = (uint64_t *)v3[1];
        v6 = (const void *)v3[3];
        if (v6)
          _Block_release(v6);
        operator delete(v3);
        v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void std::__list_imp<std::pair<ice::Client::Event,dispatch::block<int({block_pointer})(dispatch_group_s *)>>>::clear(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  const void *v6;

  if (a1[2])
  {
    v2 = *a1;
    v3 = (uint64_t *)a1[1];
    v4 = *v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        v5 = (uint64_t *)v3[1];
        v6 = (const void *)v3[3];
        if (v6)
          _Block_release(v6);
        operator delete(v3);
        v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>(unint64_t a1)
{
  if (a1 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a1);
}

void std::__shared_ptr_emplace<ice::Client::create(dispatch::queue,std::string const&,std::shared_ptr<ctu::LogServer>)::make_shared_enabler,std::allocator<ice::Client::create(dispatch::queue,std::string const&,std::shared_ptr<ctu::LogServer>)::make_shared_enabler>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24CC3E678;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ice::Client::create(dispatch::queue,std::string const&,std::shared_ptr<ctu::LogServer>)::make_shared_enabler,std::allocator<ice::Client::create(dispatch::queue,std::string const&,std::shared_ptr<ctu::LogServer>)::make_shared_enabler>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24CC3E678;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BDE70CLL);
}

uint64_t std::__shared_ptr_emplace<ice::Client::create(dispatch::queue,std::string const&,std::shared_ptr<ctu::LogServer>)::make_shared_enabler,std::allocator<ice::Client::create(dispatch::queue,std::string const&,std::shared_ptr<ctu::LogServer>)::make_shared_enabler>>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void ice::Client::create(dispatch::queue,std::string const&,std::shared_ptr<ctu::LogServer>)::make_shared_enabler::~make_shared_enabler(ice::Client *a1)
{
  ice::Client::~Client(a1);
  JUMPOUT(0x212BDE70CLL);
}

void std::__shared_ptr_emplace<ice::Client::create(dispatch::queue,char const*)::make_shared_enabler,std::allocator<ice::Client::create(dispatch::queue,char const*)::make_shared_enabler>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24CC3E700;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<ice::Client::create(dispatch::queue,char const*)::make_shared_enabler,std::allocator<ice::Client::create(dispatch::queue,char const*)::make_shared_enabler>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24CC3E700;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BDE70CLL);
}

uint64_t std::__shared_ptr_emplace<ice::Client::create(dispatch::queue,char const*)::make_shared_enabler,std::allocator<ice::Client::create(dispatch::queue,char const*)::make_shared_enabler>>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void ice::Client::create(dispatch::queue,char const*)::make_shared_enabler::~make_shared_enabler(ice::Client *a1)
{
  ice::Client::~Client(a1);
  JUMPOUT(0x212BDE70CLL);
}

void std::__shared_ptr_emplace<std::promise<int>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&off_24CC3E788;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::promise<int>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&off_24CC3E788;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BDE70CLL);
}

uint64_t std::__shared_ptr_emplace<std::promise<int>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  const std::error_category *v6;
  std::logic_error *exception;
  std::logic_error *v8;
  std::logic_error v9[2];

  result = *(_QWORD *)(a1 + 24);
  if (result)
  {
    if ((*(_BYTE *)(result + 136) & 1) == 0)
    {
      v9[0].__vftable = 0;
      v3 = *(_QWORD *)(result + 16);
      std::exception_ptr::~exception_ptr((std::exception_ptr *)v9);
      result = *(_QWORD *)(a1 + 24);
      if (!v3 && *(uint64_t *)(result + 8) >= 1)
      {
        v6 = std::future_category();
        MEMORY[0x212BDE640](v9, 4, v6);
        exception = (std::logic_error *)__cxa_allocate_exception(0x20uLL);
        v8 = std::logic_error::logic_error(exception, v9);
        v8->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB810] + 16);
        v8[1] = v9[1];
        __cxa_throw(v8, MEMORY[0x24BEDB6E0], (void (*)(void *))MEMORY[0x24BEDAD80]);
      }
    }
    v4 = (unint64_t *)(result + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  }
  return result;
}

void sub_21164DF08(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, std::__assoc_sub_state *a9, char a10)
{
  uint64_t v10;
  std::exception_ptr v11;

  __cxa_begin_catch(a1);
  std::current_exception();
  __cxa_end_catch();
  v11.__ptr_ = (void *)(v10 - 24);
  std::__assoc_sub_state::set_exception(a9, v11);
  std::exception_ptr::~exception_ptr((std::exception_ptr *)(v10 - 24));
  MEMORY[0x212BDE64C](&a10);
  JUMPOUT(0x21164DE7CLL);
}

void std::__assoc_state<int>::~__assoc_state(uint64_t a1)
{
  std::exception_ptr *v2;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
}

{
  std::exception_ptr *v2;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
  JUMPOUT(0x212BDE70CLL);
}

uint64_t std::__assoc_state<int>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
}

void std::__throw_future_error[abi:ne180100](unsigned int a1)
{
  void *exception;
  const std::error_category *v3;

  exception = __cxa_allocate_exception(0x20uLL);
  v3 = std::future_category();
  MEMORY[0x212BDE640](exception, a1, v3);
  __cxa_throw(exception, MEMORY[0x24BEDB6E0], (void (*)(void *))MEMORY[0x24BEDAD80]);
}

void sub_21164E048(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__function::__func<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0,std::allocator<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0>,void ()(int)>::~__func(_QWORD *a1)
{
  *a1 = &off_24CC3E820;
  std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  return a1;
}

void std::__function::__func<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0,std::allocator<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0>,void ()(int)>::~__func(_QWORD *a1)
{
  *a1 = &off_24CC3E820;
  std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100]((uint64_t)(a1 + 1));
  JUMPOUT(0x212BDE70CLL);
}

__n128 std::__function::__func<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0,std::allocator<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0>,void ()(int)>::__clone(uint64_t a1)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  __n128 result;

  v2 = (char *)operator new(0x28uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)v2 = &off_24CC3E820;
  *((_QWORD *)v2 + 1) = v4;
  *((_QWORD *)v2 + 2) = v3;
  if (v3)
  {
    v5 = (unint64_t *)(v3 + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

__n128 std::__function::__func<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0,std::allocator<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0>,void ()(int)>::__clone(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  __n128 result;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a2 = &off_24CC3E820;
  *(_QWORD *)(a2 + 8) = v3;
  *(_QWORD *)(a2 + 16) = v2;
  if (v2)
  {
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result = *(__n128 *)(a1 + 24);
  *(__n128 *)(a2 + 24) = result;
  return result;
}

uint64_t std::__function::__func<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0,std::allocator<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0>,void ()(int)>::destroy(uint64_t a1)
{
  return std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100](a1 + 8);
}

void std::__function::__func<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0,std::allocator<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0>,void ()(int)>::destroy_deallocate(void *a1)
{
  std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100]((uint64_t)a1 + 8);
  operator delete(a1);
}

void std::__function::__func<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0,std::allocator<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0>,void ()(int)>::operator()(uint64_t a1, int *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  std::string *v8;
  int v9;
  uint64_t v10;
  std::string v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = Ari::MsgNameById((Ari *)*(unsigned int *)(a1 + 24));
  v5 = *(_QWORD *)(a1 + 8);
  if (v3)
  {
    v6 = *(NSObject **)(v5 + 40);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      return;
    LODWORD(v11.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)v11.__r_.__value_.__r.__words + 4) = v4;
    v7 = "#N Setting indication %s to wake AP failed";
    v8 = &v11;
    goto LABEL_11;
  }
  if (*(char *)(v5 + 71) < 0)
    std::string::__init_copy_ctor_external(&v11, *(const std::string::value_type **)(v5 + 48), *(_QWORD *)(v5 + 56));
  else
    v11 = *(std::string *)(v5 + 48);
  ice::notifySnifferIndicationCanWake((_anonymous_namespace_ *)&v11, *(unsigned int *)(a1 + 24));
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
  v6 = *(NSObject **)(*(_QWORD *)(a1 + 8) + 40);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = v4;
    v7 = "#I Successfully registered indication %s to wake AP";
    v8 = (std::string *)&v9;
LABEL_11:
    _os_log_impl(&dword_211648000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)v8, 0xCu);
  }
}

void sub_21164E2C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  _Unwind_Resume(exception_object);
}

uint64_t std::__function::__func<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0,std::allocator<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0>,void ()(int)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0,std::allocator<ice::Client::setIndShouldWake(unsigned int,BOOL)::$_0>,void ()(int)>::target_type()
{
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
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

uint64_t *std::unique_ptr<void ctu::SharedSynchronizable<ice::Client>::execute_wrapped<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0>(ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0 &&)::{lambda(void)#1},std::default_delete<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0 &&>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    v3 = *(std::__shared_weak_count **)(v2 + 16);
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
    MEMORY[0x212BDE70C](v2, 0x60C40A44E5E0CLL);
  }
  return a1;
}

uint64_t *dispatch::async<void ctu::SharedSynchronizable<ice::Client>::execute_wrapped<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0>(ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0 &&)::{lambda(void)#1}>(dispatch_queue_s *,std::unique_ptr<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0,std::default_delete<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0>>)::{lambda(void *)#1}::__invoke(_QWORD **a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t *v5;
  uint64_t **v6;
  unsigned int v7;
  uint64_t **v8;
  uint64_t *v9;
  uint64_t **v10;
  BOOL v11;
  uint64_t **v12;
  uint64_t **v13;
  uint64_t *v14;
  unsigned int v15;
  _DWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD **v21;
  _QWORD *v22;
  uint64_t **v23;
  uint64_t *v24;
  uint64_t v25;

  v1 = *a1;
  v21 = a1;
  v22 = v1;
  v2 = *v1;
  v24 = 0;
  v25 = 0;
  v23 = &v24;
  v3 = *(_QWORD **)(v2 + 80);
  v4 = (_QWORD *)(v2 + 88);
  if (v3 != (_QWORD *)(v2 + 88))
  {
    v5 = 0;
    v6 = &v24;
    while (1)
    {
      v7 = *((_DWORD *)v3 + 7);
      v8 = &v24;
      if (v6 == &v24)
        break;
      v9 = v5;
      v10 = &v24;
      if (v5)
      {
        do
        {
          v8 = (uint64_t **)v9;
          v9 = (uint64_t *)v9[1];
        }
        while (v9);
      }
      else
      {
        do
        {
          v8 = (uint64_t **)v10[2];
          v11 = *v8 == (uint64_t *)v10;
          v10 = v8;
        }
        while (v11);
      }
      if (*((_DWORD *)v8 + 7) < v7)
        break;
      v13 = &v24;
      v12 = &v24;
      if (!v5)
        goto LABEL_25;
      v14 = v5;
      while (1)
      {
        while (1)
        {
          v12 = (uint64_t **)v14;
          v15 = *((_DWORD *)v14 + 7);
          if (v15 <= v7)
            break;
          v14 = *v12;
          v13 = v12;
          if (!*v12)
            goto LABEL_25;
        }
        if (v15 >= v7)
          break;
        v14 = v12[1];
        if (!v14)
        {
          v13 = v12 + 1;
          goto LABEL_25;
        }
      }
LABEL_28:
      v17 = (_QWORD *)v3[1];
      if (v17)
      {
        do
        {
          v18 = v17;
          v17 = (_QWORD *)*v17;
        }
        while (v17);
      }
      else
      {
        do
        {
          v18 = (_QWORD *)v3[2];
          v11 = *v18 == (_QWORD)v3;
          v3 = v18;
        }
        while (!v11);
      }
      if (v18 == v4)
        goto LABEL_35;
      v6 = v23;
      v5 = v24;
      v3 = v18;
    }
    if (v5)
      v12 = v8;
    else
      v12 = &v24;
    if (v5)
    {
      v13 = v8 + 1;
    }
    else
    {
      v8 = (uint64_t **)&v23;
      v13 = &v24;
    }
    if (v8[1])
      goto LABEL_28;
LABEL_25:
    v16 = operator new(0x20uLL);
    v16[7] = v7;
    *(_QWORD *)v16 = 0;
    *((_QWORD *)v16 + 1) = 0;
    *((_QWORD *)v16 + 2) = v12;
    *v13 = (uint64_t *)v16;
    if (*v23)
    {
      v23 = (uint64_t **)*v23;
      v16 = *v13;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v24, (uint64_t *)v16);
    ++v25;
    goto LABEL_28;
  }
LABEL_35:
  v19 = v1[4];
  if (!v19)
    std::__throw_bad_function_call[abi:ne180100]();
  (*(void (**)(uint64_t, uint64_t ***))(*(_QWORD *)v19 + 48))(v19, &v23);
  std::__tree<unsigned int>::destroy(v24);
  std::unique_ptr<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0,std::default_delete<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0>>::~unique_ptr[abi:ne180100]((uint64_t *)&v22);
  return std::unique_ptr<void ctu::SharedSynchronizable<ice::Client>::execute_wrapped<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0>(ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0 &&)::{lambda(void)#1},std::default_delete<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0 &&>>::~unique_ptr[abi:ne180100]((uint64_t *)&v21);
}

void sub_21164E5E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _QWORD *a13)
{
  std::__tree<unsigned int>::destroy(a13);
  std::unique_ptr<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0,std::default_delete<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0>>::~unique_ptr[abi:ne180100](&a11);
  std::unique_ptr<void ctu::SharedSynchronizable<ice::Client>::execute_wrapped<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0>(ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0 &&)::{lambda(void)#1},std::default_delete<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0 &&>>::~unique_ptr[abi:ne180100](&a10);
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0,std::default_delete<ice::Client::getRegisteredIndications(std::function<void ()(std::set<unsigned int>)>)::$_0>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    v3 = *(_QWORD **)(v2 + 32);
    if (v3 == (_QWORD *)(v2 + 8))
    {
      v4 = 4;
      v3 = (_QWORD *)(v2 + 8);
    }
    else
    {
      if (!v3)
      {
LABEL_7:
        MEMORY[0x212BDE70C](v2, 0x1060C40C8AF3C64);
        return a1;
      }
      v4 = 5;
    }
    (*(void (**)(void))(*v3 + 8 * v4))();
    goto LABEL_7;
  }
  return a1;
}

uint64_t ice::SendProxy::SendProxy(uint64_t result, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = a2[1];
  *(_QWORD *)result = *a2;
  *(_QWORD *)(result + 8) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  *(_QWORD *)(result + 16) = a3;
  *(_QWORD *)(result + 24) = 0;
  *(_DWORD *)(result + 32) = *(_DWORD *)(*a2 + 72);
  *(_BYTE *)(result + 36) = 0;
  return result;
}

{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = a2[1];
  *(_QWORD *)result = *a2;
  *(_QWORD *)(result + 8) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  *(_QWORD *)(result + 16) = a3;
  *(_QWORD *)(result + 24) = 0;
  *(_DWORD *)(result + 32) = *(_DWORD *)(*a2 + 72);
  *(_BYTE *)(result + 36) = 0;
  return result;
}

__n128 ice::SendProxy::SendProxy(__n128 *a1, __n128 *a2)
{
  unint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  __n128 result;

  v2 = a2->n128_u64[1];
  a1->n128_u64[0] = a2->n128_u64[0];
  a1->n128_u64[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  result = a2[1];
  a1[1] = result;
  a2[1].n128_u64[1] = 0;
  a1[2].n128_u32[0] = a2[2].n128_u32[0];
  a1[2].n128_u8[4] = a2[2].n128_u8[4];
  return result;
}

{
  unint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  __n128 result;

  v2 = a2->n128_u64[1];
  a1->n128_u64[0] = a2->n128_u64[0];
  a1->n128_u64[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  result = a2[1];
  a1[1] = result;
  a2[1].n128_u64[1] = 0;
  a1[2].n128_u32[0] = a2[2].n128_u32[0];
  a1[2].n128_u8[4] = a2[2].n128_u8[4];
  return result;
}

void ice::SendProxy::~SendProxy(ice::SendProxy *this)
{
  const void *v2;

  ice::SendProxy::send(this);
  v2 = (const void *)*((_QWORD *)this + 3);
  if (v2)
    _Block_release(v2);
  std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100]((uint64_t)this);
}

void ice::SendProxy::send(ice::SendProxy *this)
{
  AriMsg *v1;
  std::__shared_weak_count *v3;
  AriMsg *v4;
  unint64_t *v5;
  unint64_t v6;
  Ari *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  const char **v12;
  int v13;
  NSObject *v14;
  unsigned int v15;
  NSObject *v16;
  uint64_t Gmid;
  std::__shared_weak_count *v18;
  AriMsg *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  const void *v22;
  void *v23;
  NSObject *v24;
  unint64_t *v25;
  unint64_t v26;
  AriMsg *v27;
  uint64_t v28;
  AriMsg *v29;
  unint64_t *v30;
  unint64_t v31;
  const void *v32;
  void *v33;
  unsigned int v34;
  uint64_t v35;
  AriMsg *v36;
  unint64_t *v37;
  unint64_t v38;
  const void *v39;
  void *v40;
  unint64_t *v41;
  unint64_t v42;
  unint64_t *v43;
  unsigned int v44;
  unsigned int v45;
  NSObject *v46;
  uint64_t v47;
  std::__shared_weak_count *v48;
  AriMsg *v49;
  unint64_t *v50;
  unint64_t v51;
  const void *v52;
  void *v53;
  unint64_t *v54;
  unint64_t *v55;
  unint64_t v56;
  unsigned int v57;
  Ari *v58;
  AriMsg *v59;
  NSObject *v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  const void *v64;
  void *v65;
  AriMsg *v66;
  uint64_t EncodedBuf;
  _QWORD *v68;
  unint64_t *v69;
  unint64_t v70;
  std::__shared_weak_count *v71;
  unint64_t *v72;
  unint64_t v73;
  NSObject *v74;
  _BOOL4 v75;
  _BYTE *v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  unsigned int v80;
  int64_t v81;
  size_t *v82;
  size_t __sz[2];
  char v84;
  void *__p;
  _BYTE *v86;
  uint64_t v87;
  void *aBlock[3];
  _BYTE buf[18];
  __int16 v90;
  _BYTE v91[14];
  __int16 v92;
  unsigned int v93;
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v1 = *(AriMsg **)this;
  if (!*(_QWORD *)this)
    return;
  if (*((_DWORD *)this + 8) == -1)
  {
    v16 = *((_QWORD *)v1 + 5);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v68 = (_QWORD *)((char *)v1 + 48);
      if (*((char *)v1 + 71) < 0)
        v68 = (_QWORD *)*v68;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v68;
      _os_log_error_impl(&dword_211648000, v16, OS_LOG_TYPE_ERROR, "Client %s has not yet registered with ARI host runtime", buf, 0xCu);
    }
    Gmid = AriMsg::getGmid(*((AriMsg **)this + 2));
    v19 = *(AriMsg **)this;
    v18 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
    if (v18)
    {
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        v21 = __ldxr(p_shared_owners);
      while (__stxr(v21 + 1, p_shared_owners));
    }
    v22 = (const void *)*((_QWORD *)this + 3);
    if (v22)
    {
      v23 = _Block_copy(v22);
      if (v23)
        _Block_release(v23);
      if (!v18)
        return;
    }
    else
    {
      if (!v18)
        return;
    }
    v43 = (unint64_t *)&v18->__shared_owners_;
    do
      v42 = __ldaxr(v43);
    while (__stlxr(v42 - 1, v43));
    goto LABEL_69;
  }
  v3 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  v4 = (AriMsg *)*((_QWORD *)this + 2);
  aBlock[1] = *(void **)this;
  aBlock[2] = v3;
  if (v3)
  {
    v5 = (unint64_t *)&v3->__shared_owners_;
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  v7 = (Ari *)(AriMsg::getGmid(v4) >> 26);
  v8 = (AriMsg::getGmid(v4) >> 15) & 0x3FF;
  v9 = Ari::MsgDefById(v7);
  v10 = v9;
  if (v9)
  {
    v11 = *(_DWORD **)(v9 + 24);
    if (*v11)
    {
      v12 = (const char **)(v11 + 8);
      while (strcmp(*(v12 - 1), "nInstance_t1"))
      {
        v13 = *(_DWORD *)v12;
        v12 += 4;
        if (!v13)
          goto LABEL_11;
      }
      v45 = v44;
      v15 = 0;
      if (v44 != -77 && v44)
      {
        v46 = *((_QWORD *)v1 + 5);
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          v47 = *(_QWORD *)(v10 + 48);
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = v47;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = (_DWORD)v7;
          v90 = 1024;
          *(_DWORD *)v91 = v8;
          *(_WORD *)&v91[4] = 2080;
          *(_QWORD *)&v91[6] = asString();
          v92 = 1024;
          v93 = v45;
          _os_log_impl(&dword_211648000, v46, OS_LOG_TYPE_DEFAULT, "#N Could not pack SIM instance parameter in request %s (%u, 0x%x) result %s (%d)", buf, 0x28u);
        }
        v15 = v45;
      }
    }
    else
    {
LABEL_11:
      v14 = *((_QWORD *)v1 + 5);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = (_DWORD)v7;
        _os_log_debug_impl(&dword_211648000, v14, OS_LOG_TYPE_DEBUG, "#D Not packing SIM instance TLV for request 0x%x", buf, 8u);
      }
      v15 = 0;
    }
  }
  else
  {
    v24 = *((_QWORD *)v1 + 5);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = (_DWORD)v7;
      _os_log_impl(&dword_211648000, v24, OS_LOG_TYPE_DEFAULT, "#N Could not get message definition for packing SIM instance for gid 0x%x", buf, 8u);
    }
    v15 = -71;
  }
  if (v3)
  {
    v25 = (unint64_t *)&v3->__shared_owners_;
    do
      v26 = __ldaxr(v25);
    while (__stlxr(v26 - 1, v25));
    if (!v26)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  v27 = (AriMsg *)*((_QWORD *)this + 2);
  if (v15)
  {
    v28 = AriMsg::getGmid(v27);
    v29 = *(AriMsg **)this;
    v18 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
    if (v18)
    {
      v30 = (unint64_t *)&v18->__shared_owners_;
      do
        v31 = __ldxr(v30);
      while (__stxr(v31 + 1, v30));
    }
    v32 = (const void *)*((_QWORD *)this + 3);
    if (v32)
    {
      v33 = _Block_copy(v32);
      if (v33)
        _Block_release(v33);
      if (!v18)
        return;
    }
    else
    {
      if (!v18)
        return;
    }
    v41 = (unint64_t *)&v18->__shared_owners_;
    do
      v42 = __ldaxr(v41);
    while (__stlxr(v42 - 1, v41));
LABEL_69:
    if (!v42)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
    return;
  }
  v34 = *((_DWORD *)v27 + 17);
  if (!v34)
  {
    aBlock[0] = (void *)0xAAAAAAAAAAAAAAAALL;
    v49 = *(AriMsg **)this;
    v48 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
    if (v48)
    {
      v50 = (unint64_t *)&v48->__shared_owners_;
      do
        v51 = __ldxr(v50);
      while (__stxr(v51 + 1, v50));
    }
    v52 = (const void *)*((_QWORD *)this + 3);
    if (v52)
      v53 = _Block_copy(v52);
    else
      v53 = 0;
    *(_QWORD *)buf = v53;
    if (v53)
      _Block_release(v53);
    if (v48)
    {
      v55 = (unint64_t *)&v48->__shared_owners_;
      do
        v56 = __ldaxr(v55);
      while (__stlxr(v56 - 1, v55));
      if (!v56)
      {
        ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
        std::__shared_weak_count::__release_weak(v48);
      }
    }
    v57 = AriHost::Send();
    if (v57)
    {
      v58 = (Ari *)AriMsg::getGmid(*((AriMsg **)this + 2));
      v59 = *(AriMsg **)this;
      v60 = *(NSObject **)(*(_QWORD *)this + 40);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        v77 = Ari::MsgNameById(v58);
        v78 = *((_DWORD *)this + 8);
        v79 = asString();
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v77;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = (_DWORD)v58;
        v90 = 1024;
        *(_DWORD *)v91 = v78;
        *(_WORD *)&v91[4] = 2080;
        *(_QWORD *)&v91[6] = v79;
        v92 = 1024;
        v93 = v57;
        _os_log_error_impl(&dword_211648000, v60, OS_LOG_TYPE_ERROR, "Cannot send request %s (0x%x) for client %d: %s (%d)", buf, 0x28u);
        v59 = *(AriMsg **)this;
      }
      v61 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
      if (v61)
      {
        v62 = (unint64_t *)&v61->__shared_owners_;
        do
          v63 = __ldxr(v62);
        while (__stxr(v63 + 1, v62));
      }
      v64 = (const void *)*((_QWORD *)this + 3);
      if (v64)
      {
        v65 = _Block_copy(v64);
        if (v65)
          _Block_release(v65);
      }
      else
      {
      }
      if (v61)
      {
        v69 = (unint64_t *)&v61->__shared_owners_;
        do
          v70 = __ldaxr(v69);
        while (__stlxr(v70 - 1, v69));
        if (!v70)
        {
          ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
          std::__shared_weak_count::__release_weak(v61);
        }
      }
      goto LABEL_108;
    }
    v66 = (AriMsg *)*((_QWORD *)this + 2);
    LODWORD(__sz[0]) = 0;
    memset(buf, 170, 16);
    EncodedBuf = AriMsg::getEncodedBuf(v66, (unsigned int *)__sz);
    std::shared_ptr<unsigned char>::shared_ptr[abi:ne180100]<unsigned char,void (*)(unsigned char *),void>(buf, EncodedBuf);
    if (*(_QWORD *)buf)
    {
      v86 = 0;
      v87 = 0;
      __p = 0;
      std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, *(const void **)buf, *(_QWORD *)buf + LODWORD(__sz[0]), LODWORD(__sz[0]));
    }
    else
    {
      __p = 0;
      v86 = 0;
      v87 = 0;
    }
    v71 = *(std::__shared_weak_count **)&buf[8];
    if (*(_QWORD *)&buf[8])
    {
      v72 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
      do
        v73 = __ldaxr(v72);
      while (__stlxr(v73 - 1, v72));
      if (!v73)
      {
        ((void (*)(std::__shared_weak_count *))v71->__on_zero_shared)(v71);
        std::__shared_weak_count::__release_weak(v71);
      }
    }
    v74 = *(NSObject **)(*(_QWORD *)this + 40);
    v75 = os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG);
    v76 = __p;
    if (v75)
    {
      v80 = *((_DWORD *)this + 8);
      v81 = v86 - (_BYTE *)__p;
      ctu::to_rle((ctu *)__p, (const void *)(v86 - (_BYTE *)__p));
      if (v84 >= 0)
        v82 = __sz;
      else
        v82 = (size_t *)__sz[0];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = (v80 >> 8) & 0x7F;
      *(_WORD *)&buf[8] = 2048;
      *(_QWORD *)&buf[10] = v81;
      v90 = 2080;
      *(_QWORD *)v91 = v82;
      _os_log_debug_impl(&dword_211648000, v74, OS_LOG_TYPE_DEBUG, "#D send: ClientID:%d Length:%zu [%s]", buf, 0x1Cu);
      if (v84 < 0)
        operator delete((void *)__sz[0]);
      v76 = __p;
      if (!__p)
        goto LABEL_108;
    }
    else if (!__p)
    {
      goto LABEL_108;
    }
    v86 = v76;
    operator delete(v76);
LABEL_108:
    if (aBlock[0])
      _Block_release(aBlock[0]);
    return;
  }
  v35 = AriMsg::getGmid(v27);
  v36 = *(AriMsg **)this;
  v18 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (v18)
  {
    v37 = (unint64_t *)&v18->__shared_owners_;
    do
      v38 = __ldxr(v37);
    while (__stxr(v38 + 1, v37));
  }
  v39 = (const void *)*((_QWORD *)this + 3);
  if (v39)
  {
    v40 = _Block_copy(v39);
    if (v40)
      _Block_release(v40);
  }
  else
  {
  }
  if (v18)
  {
    v54 = (unint64_t *)&v18->__shared_owners_;
    do
      v42 = __ldaxr(v54);
    while (__stlxr(v42 - 1, v54));
    goto LABEL_69;
  }
}

void sub_21164EFB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, char a19)
{
  const void *v19;

  std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  if (v19)
    _Block_release(v19);
  _Unwind_Resume(a1);
}

uint64_t ice::SendProxy::transaction(uint64_t result, int a2)
{
  *(_DWORD *)(result + 32) = a2;
  return result;
}

{
  *(_DWORD *)(result + 32) = a2;
  return result;
}

uint64_t ice::SendProxy::callback(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  const void *v4;

  v3 = *a2;
  *a2 = 0;
  v4 = *(const void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v3;
  if (v4)
    _Block_release(v4);
  return a1;
}

{
  uint64_t v3;
  const void *v4;

  v3 = *a2;
  *a2 = 0;
  v4 = *(const void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v3;
  if (v4)
    _Block_release(v4);
  return a1;
}

uint64_t ice::SendProxy::ackRequired(uint64_t result, char a2)
{
  *(_BYTE *)(result + 36) = a2;
  return result;
}

{
  *(_BYTE *)(result + 36) = a2;
  return result;
}

uint64_t ice::SendProxy::getLogger(ice::SendProxy *this)
{
  return *(_QWORD *)this + 40;
}

uint64_t *`anonymous namespace'::callbackWithFailure(unsigned int a1, uint64_t a2, uint64_t a3, void *aBlock)
{
  void *v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;

  if (aBlock)
    v7 = _Block_copy(aBlock);
  else
    v7 = 0;
  v8 = *(NSObject **)(a3 + 24);
  v9 = (_QWORD *)operator new();
  *v9 = a1 | (unint64_t)(a2 << 32);
  v9[1] = v7;
  v11 = 0;
  v12 = 0;
}

uint64_t ice::SendMsgBaseProxy::SendMsgBaseProxy(uint64_t result, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = a2[1];
  *(_QWORD *)result = *a2;
  *(_QWORD *)(result + 8) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  *(_QWORD *)(result + 16) = a3;
  *(_QWORD *)(result + 24) = 0;
  *(_DWORD *)(result + 32) = *(_DWORD *)(*a2 + 72);
  return result;
}

{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = a2[1];
  *(_QWORD *)result = *a2;
  *(_QWORD *)(result + 8) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  *(_QWORD *)(result + 16) = a3;
  *(_QWORD *)(result + 24) = 0;
  *(_DWORD *)(result + 32) = *(_DWORD *)(*a2 + 72);
  return result;
}

__n128 ice::SendMsgBaseProxy::SendMsgBaseProxy(__n128 *a1, __n128 *a2)
{
  unint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  __n128 result;

  v2 = a2->n128_u64[1];
  a1->n128_u64[0] = a2->n128_u64[0];
  a1->n128_u64[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  result = a2[1];
  a1[1] = result;
  a2[1].n128_u64[1] = 0;
  a1[2].n128_u32[0] = a2[2].n128_u32[0];
  return result;
}

{
  unint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  __n128 result;

  v2 = a2->n128_u64[1];
  a1->n128_u64[0] = a2->n128_u64[0];
  a1->n128_u64[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  result = a2[1];
  a1[1] = result;
  a2[1].n128_u64[1] = 0;
  a1[2].n128_u32[0] = a2[2].n128_u32[0];
  return result;
}

void ice::SendMsgBaseProxy::~SendMsgBaseProxy(ice::SendMsgBaseProxy *this)
{
  const void *v2;

  ice::SendMsgBaseProxy::send(this);
  v2 = (const void *)*((_QWORD *)this + 3);
  if (v2)
    _Block_release(v2);
  std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100]((uint64_t)this);
}

void ice::SendMsgBaseProxy::send(ice::SendMsgBaseProxy *this)
{
  uint64_t v1;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  const void *v6;
  void *v7;
  NSObject *v8;
  unint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  const void *v15;
  void *v16;
  unint64_t *v17;
  unint64_t v18;
  unsigned int v19;
  unint64_t GMID;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  const void *v27;
  void *v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  NSObject *v32;
  _BOOL4 v33;
  _BYTE *v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  _QWORD *v42;
  unsigned int v43;
  int64_t v44;
  void *v45;
  void *v46;
  char v47;
  void *__p;
  _BYTE *v49;
  uint64_t v50;
  void *aBlock;
  _BYTE buf[18];
  __int16 v53;
  _BYTE v54[14];
  __int16 v55;
  unsigned int v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)this;
  if (!*(_QWORD *)this)
    return;
  if (*((_DWORD *)this + 8) != -1)
  {
    aBlock = (void *)0xAAAAAAAAAAAAAAAALL;
    v3 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
    if (v3)
    {
      p_shared_owners = (unint64_t *)&v3->__shared_owners_;
      do
        v5 = __ldxr(p_shared_owners);
      while (__stxr(v5 + 1, p_shared_owners));
    }
    v6 = (const void *)*((_QWORD *)this + 3);
    if (v6)
      v7 = _Block_copy(v6);
    else
      v7 = 0;
    *(_QWORD *)buf = v7;
    if (v7)
      _Block_release(v7);
    if (v3)
    {
      v17 = (unint64_t *)&v3->__shared_owners_;
      do
        v18 = __ldaxr(v17);
      while (__stlxr(v18 - 1, v17));
      if (!v18)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    v19 = AriSdk::MsgBase::send();
    if (v19)
    {
      GMID = AriSdk::MsgBase::getGMID(*((AriSdk::MsgBase **)this + 2));
      v21 = (GMID >> 17) & 0xFFFF8000 | ((_DWORD)GMID << 26);
      v22 = *(_QWORD *)this;
      v23 = *(NSObject **)(*(_QWORD *)this + 40);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v39 = Ari::MsgNameById((Ari *)v21);
        v40 = *((_DWORD *)this + 8);
        v41 = asString();
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = v39;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v21;
        v53 = 1024;
        *(_DWORD *)v54 = v40;
        *(_WORD *)&v54[4] = 2080;
        *(_QWORD *)&v54[6] = v41;
        v55 = 1024;
        v56 = v19;
        _os_log_error_impl(&dword_211648000, v23, OS_LOG_TYPE_ERROR, "Cannot send request %s (0x%x) for client %d: %s (%d)", buf, 0x28u);
        v22 = *(_QWORD *)this;
      }
      v24 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
      if (v24)
      {
        v25 = (unint64_t *)&v24->__shared_owners_;
        do
          v26 = __ldxr(v25);
        while (__stxr(v26 + 1, v25));
      }
      v27 = (const void *)*((_QWORD *)this + 3);
      if (v27)
      {
        v28 = _Block_copy(v27);
        if (v28)
          _Block_release(v28);
        if (!v24)
          goto LABEL_51;
        goto LABEL_47;
      }
      if (v24)
      {
LABEL_47:
        v35 = (unint64_t *)&v24->__shared_owners_;
        do
          v36 = __ldaxr(v35);
        while (__stlxr(v36 - 1, v35));
        if (!v36)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = 0;
      AriSdk::MsgBase::getRawBytes();
      v49 = 0;
      v50 = 0;
      __p = 0;
      if (*(_QWORD *)buf)
        std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&__p, **(const void ***)buf, *(_QWORD *)(*(_QWORD *)buf + 8), *(_QWORD *)(*(_QWORD *)buf + 8) - **(_QWORD **)buf);
      v29 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v30 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v31 = __ldaxr(v30);
        while (__stlxr(v31 - 1, v30));
        if (!v31)
        {
          ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
          std::__shared_weak_count::__release_weak(v29);
        }
      }
      v32 = *(NSObject **)(*(_QWORD *)this + 40);
      v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG);
      v34 = __p;
      if (v33)
      {
        v43 = *((_DWORD *)this + 8);
        v44 = v49 - (_BYTE *)__p;
        ctu::to_rle((ctu *)__p, (const void *)(v49 - (_BYTE *)__p));
        if (v47 >= 0)
          v45 = &v46;
        else
          v45 = v46;
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = (v43 >> 8) & 0x7F;
        *(_WORD *)&buf[8] = 2048;
        *(_QWORD *)&buf[10] = v44;
        v53 = 2080;
        *(_QWORD *)v54 = v45;
        _os_log_debug_impl(&dword_211648000, v32, OS_LOG_TYPE_DEBUG, "#D send: ClientID:%d Length:%zu [%s]", buf, 0x1Cu);
        if (v47 < 0)
          operator delete(v46);
        v34 = __p;
        if (!__p)
          goto LABEL_51;
      }
      else if (!__p)
      {
        goto LABEL_51;
      }
      v49 = v34;
      operator delete(v34);
    }
LABEL_51:
    if (aBlock)
      _Block_release(aBlock);
    return;
  }
  v8 = *(NSObject **)(v1 + 40);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v42 = (_QWORD *)(v1 + 48);
    if (*(char *)(v1 + 71) < 0)
      v42 = (_QWORD *)*v42;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v42;
    _os_log_error_impl(&dword_211648000, v8, OS_LOG_TYPE_ERROR, "Client %s has not yet registered with ARI host runtime", buf, 0xCu);
  }
  v9 = AriSdk::MsgBase::getGMID(*((AriSdk::MsgBase **)this + 2));
  v10 = (v9 >> 17) & 0xFFFF8000 | ((_DWORD)v9 << 26);
  v12 = *(_QWORD *)this;
  v11 = (std::__shared_weak_count *)*((_QWORD *)this + 1);
  if (v11)
  {
    v13 = (unint64_t *)&v11->__shared_owners_;
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  v15 = (const void *)*((_QWORD *)this + 3);
  if (!v15)
  {
    if (!v11)
      return;
    goto LABEL_54;
  }
  v16 = _Block_copy(v15);
  if (v16)
    _Block_release(v16);
  if (v11)
  {
LABEL_54:
    v37 = (unint64_t *)&v11->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

void sub_21164F780(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *aBlock, char a17)
{
  if (!a2)
    _Unwind_Resume(exception_object);
  __clang_call_terminate(exception_object);
}

uint64_t ice::SendMsgBaseProxy::transaction(uint64_t result, int a2)
{
  *(_DWORD *)(result + 32) = a2;
  return result;
}

{
  *(_DWORD *)(result + 32) = a2;
  return result;
}

uint64_t ice::SendMsgBaseProxy::callback(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  const void *v4;

  v3 = *a2;
  *a2 = 0;
  v4 = *(const void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v3;
  if (v4)
    _Block_release(v4);
  return a1;
}

{
  uint64_t v3;
  const void *v4;

  v3 = *a2;
  *a2 = 0;
  v4 = *(const void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v3;
  if (v4)
    _Block_release(v4);
  return a1;
}

uint64_t ice::SendMsgBaseProxy::getLogger(ice::SendMsgBaseProxy *this)
{
  return *(_QWORD *)this + 40;
}

uint64_t *std::unique_ptr<`anonymous namespace'::callbackWithFailure(unsigned int,unsigned int,std::shared_ptr<ice::Client>,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>)::$_0,std::default_delete<`anonymous namespace'::callbackWithFailure(unsigned int,unsigned int,std::shared_ptr<ice::Client>,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>)::$_0>>::~unique_ptr[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  const void *v3;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    v3 = *(const void **)(v2 + 8);
    if (v3)
      _Block_release(v3);
    MEMORY[0x212BDE70C](v2, 0x1080C4057E67DB5);
  }
  return a1;
}

uint64_t *dispatch::async<`anonymous namespace'::callbackWithFailure(unsigned int,unsigned int,std::shared_ptr<ice::Client>,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>)::$_0>(dispatch_queue_s *,std::unique_ptr<`anonymous namespace'::callbackWithFailure(unsigned int,unsigned int,std::shared_ptr<ice::Client>,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>)::$_0,std::default_delete<`anonymous namespace'::callbackWithFailure(unsigned int,unsigned int,std::shared_ptr<ice::Client>,dispatch::block<int({block_pointer})(unsigned char *,unsigned int)>)::$_0>>)::{lambda(void *)#1}::__invoke(int32x2_t *a1)
{
  __int128 v2;
  uint64_t EncodedBuf;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  int32x2_t *v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  _OWORD v12[4];
  unint64_t v13;
  int32x2_t v14;

  v8 = a1;
  v14 = vrev64_s32(*a1);
  v13 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[2] = v2;
  v12[3] = v2;
  v12[0] = v2;
  v12[1] = v2;
  MEMORY[0x212BDE520](v12, 67600384);
  AriMsg::packParam((AriMsg *)v12, 1, &v14);
  v11 = 0;
  v9 = 0xAAAAAAAAAAAAAAAALL;
  v10 = 0xAAAAAAAAAAAAAAAALL;
  EncodedBuf = AriMsg::getEncodedBuf((AriMsg *)v12, &v11);
  std::shared_ptr<unsigned char>::shared_ptr[abi:ne180100]<unsigned char,void (*)(unsigned char *),void>(&v9, EncodedBuf);
  (*(void (**)(void))(*(_QWORD *)&a1[1] + 16))();
  v4 = (std::__shared_weak_count *)v10;
  if (v10)
  {
    v5 = (unint64_t *)(v10 + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
  AriMsg::~AriMsg((AriMsg *)v12);
}

void sub_21164F9DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, uint64_t a12, char a13)
{
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;

  v14 = a11;
  if (a11)
  {
    p_shared_owners = (unint64_t *)&a11->__shared_owners_;
    do
      v16 = __ldaxr(p_shared_owners);
    while (__stlxr(v16 - 1, p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  AriMsg::~AriMsg((AriMsg *)&a13);
  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<unsigned char>::shared_ptr[abi:ne180100]<unsigned char,void (*)(unsigned char *),void>(_QWORD *a1, uint64_t a2)
{
  _QWORD *v4;

  *a1 = a2;
  v4 = (_QWORD *)operator new();
  *v4 = &off_24CC3E8D0;
  v4[1] = 0;
  v4[2] = 0;
  v4[3] = a2;
  v4[4] = MEMORY[0x24BECE870];
  a1[1] = v4;
  return a1;
}

void sub_21164FAA4(void *a1)
{
  AriMsg *v1;
  unsigned __int8 *v2;

  __cxa_begin_catch(a1);
  AriMsg::ReleaseEncodedMessage(v1, v2);
  __cxa_rethrow();
}

void sub_21164FAB8(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<unsigned char *,void (*)(unsigned char *),std::allocator<unsigned char>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x212BDE70CLL);
}

uint64_t std::__shared_ptr_pointer<unsigned char *,void (*)(unsigned char *),std::allocator<unsigned char>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 24));
}

uint64_t std::__shared_ptr_pointer<unsigned char *,void (*)(unsigned char *),std::allocator<unsigned char>>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 32;
  else
    return 0;
}

void `anonymous namespace'::wrapSendCallback(void **a1, uint64_t a2, std::__shared_weak_count *a3, void **a4, int a5)
{
  unint64_t *p_shared_weak_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  void *v11;
  _QWORD v12[5];
  std::__shared_weak_count *v13;
  void *aBlock;
  int v15;

  if (a3)
  {
    p_shared_weak_owners = (unint64_t *)&a3->__shared_weak_owners_;
    do
      v8 = __ldxr(p_shared_weak_owners);
    while (__stxr(v8 + 1, p_shared_weak_owners));
  }
  *a1 = (void *)0xAAAAAAAAAAAAAAAALL;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1174405120;
  v12[2] = ___ZN12_GLOBAL__N_116wrapSendCallbackENSt3__110shared_ptrIN3ice6ClientEEEN8dispatch5blockIU13block_pointerFiPhjEEEi_block_invoke;
  v12[3] = &__block_descriptor_tmp_1;
  v12[4] = a2;
  v13 = a3;
  if (a3)
  {
    v9 = (unint64_t *)&a3->__shared_weak_owners_;
    do
      v10 = __ldxr(v9);
    while (__stxr(v10 + 1, v9));
  }
  v15 = a5;
  v11 = *a4;
  if (*a4)
    v11 = _Block_copy(v11);
  aBlock = v11;
  *a1 = _Block_copy(v12);
  if (aBlock)
    _Block_release(aBlock);
  if (v13)
    std::__shared_weak_count::__release_weak(v13);
  if (a3)
    std::__shared_weak_count::__release_weak(a3);
}

uint64_t ___ZN12_GLOBAL__N_116wrapSendCallbackENSt3__110shared_ptrIN3ice6ClientEEEN8dispatch5blockIU13block_pointerFiPhjEEEi_block_invoke(uint64_t a1, ctu *a2, uint64_t a3)
{
  std::__shared_weak_count *v4;
  std::__shared_weak_count *v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  NSObject *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  const void *v13;
  void *v14;
  __int128 v15;
  unsigned int v16;
  uint64_t BufGmid;
  NSObject *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  NSObject *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  unint64_t v26;
  unsigned int v27;
  _BYTE *v28;
  Ari *v29;
  NSObject *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v39;
  std::__shared_weak_count *v40;
  unint64_t v41;
  _BYTE buf[14];
  _BYTE v43[6];
  _BYTE v44[10];
  __int16 v45;
  uint64_t v46;
  uint8_t v47[16];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  unint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v40 = 0;
  v4 = *(std::__shared_weak_count **)(a1 + 40);
  if (v4)
  {
    v7 = std::__shared_weak_count::lock(v4);
    v40 = v7;
    if (!v7)
      return 0;
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      v9 = v7;
      v10 = *(NSObject **)(v8 + 40);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v27 = *(_DWORD *)(a1 + 56);
        ctu::to_rle(a2, (const void *)a3);
        v28 = v44[3] >= 0 ? buf : *(_BYTE **)buf;
        *(_DWORD *)v47 = 67109634;
        *(_DWORD *)&v47[4] = (v27 >> 8) & 0x7F;
        *(_WORD *)&v47[8] = 1024;
        *(_DWORD *)&v47[10] = a3;
        *(_WORD *)&v47[14] = 2080;
        *(_QWORD *)&v48 = v28;
        _os_log_debug_impl(&dword_211648000, v10, OS_LOG_TYPE_DEBUG, "#D recv: ClientID:%d Length:%u [%s]", v47, 0x18u);
        if ((v44[3] & 0x80000000) != 0)
          operator delete(*(void **)buf);
      }
      v39 = v9;
      p_shared_owners = (unint64_t *)&v9->__shared_owners_;
      do
        v12 = __ldxr(p_shared_owners);
      while (__stxr(v12 + 1, p_shared_owners));
      v13 = *(const void **)(a1 + 48);
      if (v13)
        v14 = _Block_copy(v13);
      else
        v14 = 0;
      v51 = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v49 = v15;
      v50 = v15;
      *(_OWORD *)v47 = v15;
      v48 = v15;
      MEMORY[0x212BDE514](v47, a2, a3);
      v16 = HIDWORD(v51);
      if (HIDWORD(v51))
      {
        BufGmid = AriMsg::GetBufGmid(a2, (const unsigned __int8 *)a3);
        v18 = *(NSObject **)(v8 + 40);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = asString();
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)&buf[4] = BufGmid >> 26;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = (BufGmid >> 15) & 0x3FF;
          *(_WORD *)v43 = 1024;
          *(_DWORD *)&v43[2] = v16;
          *(_WORD *)v44 = 2080;
          *(_QWORD *)&v44[2] = v19;
          _os_log_impl(&dword_211648000, v18, OS_LOG_TYPE_DEFAULT, "#N Could not construct response (%u, 0x%x) error=%d (%s)", buf, 0x1Eu);
        }
        do
          v20 = __ldxr(p_shared_owners);
        while (__stxr(v20 + 1, p_shared_owners));
        if (v14)
        {
          v21 = _Block_copy(v14);
          if (v21)
            _Block_release(v21);
        }
        else
        {
        }
        do
          v26 = __ldaxr(p_shared_owners);
        while (__stlxr(v26 - 1, p_shared_owners));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
        AriMsg::~AriMsg((AriMsg *)v47);
        if (!v14)
          goto LABEL_37;
        goto LABEL_36;
      }
      if (!AriMsg::isValid((AriMsg *)v47))
      {
        v41 = 0xAAAAAAAAAAAAAAAALL;
        if (AriMsg::unparam((AriMsg *)v47, 1, &v41))
        {
          v22 = *(NSObject **)(v8 + 40);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v23 = "#N Got NACK from baseband without status TLV";
            v24 = v22;
            v25 = 2;
LABEL_34:
            _os_log_impl(&dword_211648000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
          }
        }
        else
        {
          v29 = (Ari *)v41;
          v30 = *(NSObject **)(v8 + 40);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            v31 = Ari::MsgNameById(v29);
            v32 = HIDWORD(v41);
            v33 = asString();
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = v31;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)v43 = v29 >> 26;
            *(_WORD *)&v43[4] = 1024;
            *(_DWORD *)v44 = (v29 >> 15) & 0x3FF;
            *(_WORD *)&v44[4] = 1024;
            *(_DWORD *)&v44[6] = v32;
            v45 = 2080;
            v46 = v33;
            v23 = "#N Got NACK for %s (%u, 0x%x) error=%d error description: %s";
            v24 = v30;
            v25 = 40;
            goto LABEL_34;
          }
        }
      }
      (*((void (**)(void *, ctu *, uint64_t))v14 + 2))(v14, a2, a3);
      AriMsg::~AriMsg((AriMsg *)v47);
LABEL_36:
      _Block_release(v14);
LABEL_37:
      v34 = (unint64_t *)&v39->__shared_owners_;
      do
        v35 = __ldaxr(v34);
      while (__stlxr(v35 - 1, v34));
      if (!v35)
      {
        ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
        std::__shared_weak_count::__release_weak(v39);
      }
    }
  }
  if (v40)
  {
    v36 = (unint64_t *)&v40->__shared_owners_;
    do
      v37 = __ldaxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (!v37)
    {
      ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
      std::__shared_weak_count::__release_weak(v40);
    }
  }
  return 0;
}

void sub_21165007C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  const void *v2;
  uint64_t v4;
  va_list va;
  uint64_t v6;
  uint64_t v7;
  va_list va1;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va2;

  va_start(va2, a2);
  va_start(va1, a2);
  va_start(va, a2);
  v4 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v7 = va_arg(va2, _QWORD);
  v9 = va_arg(va2, _QWORD);
  v10 = va_arg(va2, _QWORD);
  v11 = va_arg(va2, _QWORD);
  v12 = va_arg(va2, _QWORD);
  v13 = va_arg(va2, _QWORD);
  v14 = va_arg(va2, _QWORD);
  v15 = va_arg(va2, _QWORD);
  v16 = va_arg(va2, _QWORD);
  AriMsg::~AriMsg((AriMsg *)va2);
  if (v2)
    _Block_release(v2);
  std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100]((uint64_t)va);
  std::shared_ptr<ice::detail::SendState>::~shared_ptr[abi:ne180100]((uint64_t)va1);
  _Unwind_Resume(a1);
}

void *__copy_helper_block_e8_32c36_ZTSNSt3__18weak_ptrIN3ice6ClientEEE48c45_ZTSN8dispatch5blockIU13block_pointerFiPhjEEE(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  void *result;

  v3 = a2[5];
  a1[4] = a2[4];
  a1[5] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 16);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result = (void *)a2[6];
  if (result)
    result = _Block_copy(result);
  a1[6] = result;
  return result;
}

void __destroy_helper_block_e8_32c36_ZTSNSt3__18weak_ptrIN3ice6ClientEEE48c45_ZTSN8dispatch5blockIU13block_pointerFiPhjEEE(uint64_t a1)
{
  const void *v2;
  std::__shared_weak_count *v3;

  v2 = *(const void **)(a1 + 48);
  if (v2)
    _Block_release(v2);
  v3 = *(std::__shared_weak_count **)(a1 + 40);
  if (v3)
    std::__shared_weak_count::__release_weak(v3);
}

_QWORD *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (__sz)
  {
    v6 = result;
    result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_2116501DC(_Unwind_Exception *exception_object)
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

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t asString()
{
  return MEMORY[0x24BECE650]();
}

uint64_t Ari::MsgDefById(Ari *this)
{
  return MEMORY[0x24BECE7E8](this);
}

uint64_t Ari::MsgNameById(Ari *this)
{
  return MEMORY[0x24BECE7F0](this);
}

uint64_t ctu::OsLogLogger::OsLogLogger()
{
  return MEMORY[0x24BED9830]();
}

{
  return MEMORY[0x24BED9838]();
}

void ctu::OsLogLogger::~OsLogLogger(ctu::OsLogLogger *this)
{
  MEMORY[0x24BED9840](this);
}

uint64_t ctu::OsLogContext::OsLogContext(ctu::OsLogContext *this, const char *a2, const char *a3)
{
  return MEMORY[0x24BED9858](this, a2, a3);
}

void ctu::OsLogContext::~OsLogContext(ctu::OsLogContext *this)
{
  MEMORY[0x24BED9868](this);
}

uint64_t ctu::to_rle(ctu *this, const void *a2)
{
  return MEMORY[0x24BED9C70](this, a2);
}

uint64_t AriMsg::GetBufGmid(AriMsg *this, const unsigned __int8 *a2)
{
  return MEMORY[0x24BECE860](this, a2);
}

uint64_t AriMsg::ReleaseEncodedMessage(AriMsg *this, unsigned __int8 *a2)
{
  return MEMORY[0x24BECE870](this, a2);
}

uint64_t AriMsg::packParam(AriMsg *this, uint64_t a2, const void *a3)
{
  return MEMORY[0x24BECE8A0](this, a2, a3);
}

void AriMsg::AriMsg(AriMsg *this, const unsigned __int8 *a2)
{
  MEMORY[0x24BECE8A8](this, a2);
}

void AriMsg::AriMsg(AriMsg *this)
{
  MEMORY[0x24BECE8B0](this);
}

void AriMsg::~AriMsg(AriMsg *this)
{
  MEMORY[0x24BECE8B8](this);
}

uint64_t AriSdk::MsgBase::getRawBytes()
{
  return MEMORY[0x24BED1C50]();
}

uint64_t AriSdk::MsgBase::send()
{
  return MEMORY[0x24BED1C58]();
}

uint64_t AriHost::RegIndication()
{
  return MEMORY[0x24BED1C68]();
}

uint64_t AriHost::RegisterClient(AriHost *this, const char *a2, int *a3, dispatch_queue_s *a4)
{
  return MEMORY[0x24BED1C70](this, a2, a3, a4);
}

uint64_t AriHost::SetMsgWakeable()
{
  return MEMORY[0x24BED1C80]();
}

uint64_t AriHost::DeregIndication(AriHost *this)
{
  return MEMORY[0x24BED1C88](this);
}

uint64_t AriHost::DeregisterClient(AriHost *this)
{
  return MEMORY[0x24BED1C90](this);
}

uint64_t AriHost::ReRegisterClient()
{
  return MEMORY[0x24BED1C98]();
}

uint64_t AriHost::AbortTransactions(AriHost *this, uint64_t a2, dispatch_group_s *a3)
{
  return MEMORY[0x24BED1CA0](this, a2, a3);
}

uint64_t AriHost::SetRTEventHandler()
{
  return MEMORY[0x24BED1CA8]();
}

uint64_t AriHost::ContinueTransactions(AriHost *this)
{
  return MEMORY[0x24BED1CB0](this);
}

uint64_t AriHost::Send()
{
  return MEMORY[0x24BED1CC8]();
}

uint64_t AriMsg::getEncodedBuf(AriMsg *this, unsigned int *a2)
{
  return MEMORY[0x24BED1CE0](this, a2);
}

uint64_t AriMsg::getGmid(AriMsg *this)
{
  return MEMORY[0x24BED1CE8](this);
}

uint64_t AriMsg::isValid(AriMsg *this)
{
  return MEMORY[0x24BED1CF0](this);
}

uint64_t AriMsg::unparam(AriMsg *this, uint64_t a2, void *a3)
{
  return MEMORY[0x24BED1CF8](this, a2, a3);
}

uint64_t AriSdk::MsgBase::getGMID(AriSdk::MsgBase *this)
{
  return MEMORY[0x24BED1DF8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAB8](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
  MEMORY[0x24BEDAB20](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x24BEDAD78](this, *(_QWORD *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
  MEMORY[0x24BEDAD80](this);
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
  MEMORY[0x24BEDAFF8](this);
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB080]();
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
  MEMORY[0x24BEDB0C8](this, __p.__ptr_);
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x24BEDB0F8](this);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x24BEDB118](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x24BEDB188](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x24BEDB6A0]();
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24CC3E308(__p);
}

uint64_t operator delete()
{
  return off_24CC3E310();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24CC3E318(__sz);
}

uint64_t operator new()
{
  return off_24CC3E320();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x24BEDB958]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x24BDADCD8](queue, context, work);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

