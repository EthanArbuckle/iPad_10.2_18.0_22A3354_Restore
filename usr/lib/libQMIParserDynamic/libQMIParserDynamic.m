uint64_t qmi::MutableMessageBase::MutableMessageBase(uint64_t this, __int16 a2)
{
  *(_WORD *)this = a2;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_QWORD *)(this + 8) = 0;
  return this;
}

{
  *(_WORD *)this = a2;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_QWORD *)(this + 8) = 0;
  return this;
}

void std::__shared_ptr_emplace<qmi::SerializedMessage>::__on_zero_shared(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(_QWORD *)(a1 + 32) = v2;
    operator delete(v2);
  }
}

unsigned __int8 *qmi::MessageBase::findTlvValue(qmi::MessageBase *this, int a2)
{
  uint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  unsigned __int8 *result;
  int v6;
  uint64_t v7;
  unsigned __int8 *v8;
  int v9;

  v2 = (uint64_t *)*((_QWORD *)this + 1);
  if (!v2)
    return 0;
  v4 = *v2;
  v3 = v2[1];
  result = (unsigned __int8 *)(v4 + 7);
  if (v4 + 7 > v3)
    return 0;
  v6 = *(unsigned __int8 *)(v4 + 4);
  v7 = *(unsigned __int16 *)(v4 + 5);
  if (v6 != a2)
  {
    while (1)
    {
      v8 = &result[v7];
      result = v8 + 3;
      if ((unint64_t)(v8 + 3) > v3)
        break;
      v9 = *v8;
      v7 = *(unsigned __int16 *)(v8 + 1);
      if (v9 == a2)
        return result;
    }
    return 0;
  }
  return result;
}

_QWORD **qmi::fixupHeader(_QWORD **result, int a2, char a3)
{
  _BYTE *v3;
  unint64_t v4;

  if (*result)
  {
    v3 = (_BYTE *)**result;
    v4 = 8;
    if (a2)
      v4 = 9;
    if ((*result)[1] - (_QWORD)v3 >= v4)
    {
      v3[5] = a3;
      v3[7] = *((_BYTE *)*result + 26);
      if (a2)
        v3[8] = *((_BYTE *)*result + 27);
    }
  }
  return result;
}

unint64_t tlv::throwIfNotEnoughBytes(unint64_t this, const unsigned __int8 *a2, unint64_t a3)
{
  std::logic_error *exception;
  unint64_t v4;

  if (this > (unint64_t)a2)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvParseException::TlvParseException(exception);
    goto LABEL_7;
  }
  if ((a3 & 0x8000000000000000) != 0 || this + a3 > (unint64_t)a2)
  {
    v4 = this;
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvParseException::TlvParseException((tlv::TlvParseException *)exception, a3, (unint64_t)&a2[-v4]);
LABEL_7:
  }
  return this;
}

void sub_20E6039F8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20E603A0C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

qmi::ResponseBase *qmi::ResponseBase::ResponseBase(std::__shared_weak_count **this, char *a2, unint64_t a3)
{
  std::__shared_weak_count *v5;
  unint64_t shared_owners;
  std::__shared_weak_count_vtbl *v7;
  _WORD *v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned __int8 *v12;
  int v13;
  std::__shared_weak_count *v14;
  unint64_t *p_shared_owners;
  unint64_t v16;

  if (*((_DWORD *)qmi::MessageBase::MessageBase((qmi::MessageBase *)this, a2, a3) + 1))
    return (qmi::ResponseBase *)this;
  v5 = this[1];
  if (!v5)
    goto LABEL_5;
  v7 = v5->__vftable;
  shared_owners = v5->__shared_owners_;
  v8 = (_WORD *)((char *)&v5->~__shared_weak_count + 7);
  if ((unint64_t)v8 > shared_owners)
    goto LABEL_5;
  v10 = BYTE4(v7->~__shared_weak_count);
  v11 = *(unsigned __int16 *)((char *)&v7->~__shared_weak_count + 5);
  if (v10 != 2)
  {
    while (1)
    {
      v12 = (unsigned __int8 *)v8 + v11;
      v8 = v12 + 3;
      if ((unint64_t)(v12 + 3) > shared_owners)
        break;
      v13 = *v12;
      v11 = *(unsigned __int16 *)(v12 + 1);
      if (v13 == 2)
        goto LABEL_10;
    }
LABEL_5:
    v9 = 65542;
LABEL_6:
    *((_DWORD *)this + 1) = v9;
    return (qmi::ResponseBase *)this;
  }
LABEL_10:
  if (v11 != 4)
  {
    *((_DWORD *)this + 1) = 65543;
    v14 = this[2];
    this[1] = 0;
    this[2] = 0;
    if (v14)
    {
      p_shared_owners = (unint64_t *)&v14->__shared_owners_;
      do
        v16 = __ldaxr(p_shared_owners);
      while (__stlxr(v16 - 1, p_shared_owners));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
        return (qmi::ResponseBase *)this;
      }
    }
    return (qmi::ResponseBase *)this;
  }
  if (!*v8)
    return (qmi::ResponseBase *)this;
  v9 = (unsigned __int16)v8[1];
  if (v9)
    goto LABEL_6;
  *((_DWORD *)this + 1) = 65552;
  return (qmi::ResponseBase *)this;
}

void qmi::MutableMessageBase::~MutableMessageBase(qmi::MutableMessageBase *this)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = (_QWORD *)*((_QWORD *)this + 1);
  v3 = (_QWORD *)*((_QWORD *)this + 2);
  if (v2 == v3)
  {
    if (!v2)
      return;
    goto LABEL_3;
  }
  do
  {
    if (*v2)
      (*(void (**)(_QWORD))(*(_QWORD *)*v2 + 8))(*v2);
    ++v2;
  }
  while (v2 != v3);
  v2 = (_QWORD *)*((_QWORD *)this + 1);
  if (v2)
  {
LABEL_3:
    *((_QWORD *)this + 2) = v2;
    operator delete(v2);
  }
}

{
  _QWORD *v2;
  _QWORD *v3;

  v2 = (_QWORD *)*((_QWORD *)this + 1);
  v3 = (_QWORD *)*((_QWORD *)this + 2);
  if (v2 == v3)
  {
    if (!v2)
      return;
    goto LABEL_3;
  }
  do
  {
    if (*v2)
      (*(void (**)(_QWORD))(*(_QWORD *)*v2 + 8))(*v2);
    ++v2;
  }
  while (v2 != v3);
  v2 = (_QWORD *)*((_QWORD *)this + 1);
  if (v2)
  {
LABEL_3:
    *((_QWORD *)this + 2) = v2;
    operator delete(v2);
  }
}

void qmi::MutableMessageBase::serialize(qmi::MutableMessageBase *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v4;
  uint64_t *v5;
  size_t v6;
  uint64_t v7;
  _WORD *v8;
  __int16 v9;
  _QWORD *v10;
  _QWORD *v11;
  _WORD *v12;

  memset(a2, 170, 24);
  v4 = (uint64_t *)*((_QWORD *)this + 1);
  v5 = (uint64_t *)*((_QWORD *)this + 2);
  if (v4 == v5)
  {
    *a2 = 0;
    a2[1] = 0;
    v6 = 4;
    a2[2] = 0;
LABEL_8:
    v8 = operator new(v6);
    *a2 = v8;
    v9 = (_WORD)v8 + v6;
    a2[2] = (char *)v8 + v6;
    bzero(v8, v6);
    a2[1] = (char *)v8 + v6;
    goto LABEL_10;
  }
  v6 = 4;
  do
  {
    v7 = *v4++;
    v6 += (*(uint64_t (**)(uint64_t))(*(_QWORD *)v7 + 16))(v7);
  }
  while (v4 != v5);
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (v6)
  {
    if ((v6 & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    goto LABEL_8;
  }
  v9 = 0;
  v8 = 0;
LABEL_10:
  *v8 = *(_WORD *)this;
  v8[1] = v9 - (_WORD)v8 - 4;
  v10 = (_QWORD *)*((_QWORD *)this + 1);
  v11 = (_QWORD *)*((_QWORD *)this + 2);
  if (v10 != v11)
  {
    v12 = v8 + 2;
    do
    {
      (*(void (**)(_QWORD, _WORD **))(*(_QWORD *)*v10 + 24))(*v10, &v12);
      ++v10;
    }
    while (v10 != v11);
    if (v12 != (_WORD *)a2[1])
      qmi::MutableMessageBase::sWriteErrorHandler();
  }
}

void sub_20E603D08(_Unwind_Exception *exception_object)
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

void qmi::MessageBase::~MessageBase(qmi::MessageBase *this)
{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  v1 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
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

{
  std::__shared_weak_count *v1;
  unint64_t *p_shared_owners;
  unint64_t v3;

  v1 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
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

void std::__shared_ptr_emplace<std::vector<unsigned char>>::__on_zero_shared(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(_QWORD *)(a1 + 32) = v2;
    operator delete(v2);
  }
}

qmi::MessageBase *qmi::MessageBase::MessageBase(qmi::MessageBase *this, char *a2, unint64_t a3)
{
  int *v4;
  _QWORD *v5;
  int v6;
  uint64_t v8;
  std::__shared_weak_count *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  char *v13;
  _QWORD *v14;
  unsigned __int16 *v15;
  int64_t v16;
  char *v17;
  unint64_t v18;
  _QWORD *v19;
  char *v20;
  unint64_t v21;
  char *v22;
  char *v23;

  *(_WORD *)this = 0;
  *(_QWORD *)((char *)this + 4) = 0;
  v4 = (int *)((char *)this + 4);
  v5 = (_QWORD *)((char *)this + 8);
  *(_QWORD *)((char *)this + 12) = 0;
  *((_DWORD *)this + 5) = 0;
  if (a3 <= 3)
  {
    v6 = 65540;
LABEL_5:
    *v4 = v6;
    *v5 = 0;
    *((_QWORD *)this + 2) = 0;
    return this;
  }
  *(_WORD *)this = *(_WORD *)a2;
  v8 = *((unsigned __int16 *)a2 + 1);
  if (v8 + 4 > a3)
  {
    v6 = 65541;
    goto LABEL_5;
  }
  v10 = (std::__shared_weak_count *)operator new(0x30uLL);
  v11 = v10;
  v10->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v10->__shared_owners_;
  v13 = &a2[v8];
  v10->__shared_weak_owners_ = 0;
  v10->__vftable = (std::__shared_weak_count_vtbl *)off_24C975138;
  v10[1].__vftable = 0;
  v14 = &v10[1].__vftable;
  v15 = (unsigned __int16 *)(v13 + 4);
  v10[1].__shared_owners_ = 0;
  v10[1].__shared_weak_owners_ = 0;
  v16 = (char *)v15 - a2;
  if (v15 == (unsigned __int16 *)a2)
  {
    *((_QWORD *)this + 2) = v10;
    v19 = (_QWORD *)((char *)this + 16);
    *((_QWORD *)this + 1) = v14;
LABEL_14:
    *v4 = 65543;
    *v5 = 0;
    *v19 = 0;
    do
      v21 = __ldaxr(p_shared_owners);
    while (__stlxr(v21 - 1, p_shared_owners));
    if (!v21)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
    return this;
  }
  if (v16 < 0)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v17 = (char *)operator new((char *)v15 - a2);
  v11[1].__vftable = (std::__shared_weak_count_vtbl *)v17;
  v18 = (unint64_t)&v17[v16];
  v11[1].__shared_weak_owners_ = (uint64_t)&v17[v16];
  memcpy(v17, a2, v16);
  v11[1].__shared_owners_ = (uint64_t)&v17[v16];
  *((_QWORD *)this + 2) = v11;
  v19 = (_QWORD *)((char *)this + 16);
  *((_QWORD *)this + 1) = v14;
  if (v16 >= 7)
  {
    v22 = &v17[*(unsigned __int16 *)(v17 + 5)];
    v20 = v22 + 7;
    if ((unint64_t)(v22 + 10) <= v18)
    {
      do
      {
        v23 = &v20[*(unsigned __int16 *)(v20 + 1)];
        v20 = v23 + 3;
      }
      while ((unint64_t)(v23 + 6) <= v18);
    }
  }
  else
  {
    v20 = v17 + 4;
  }
  if (v20 != (char *)v18)
    goto LABEL_14;
  return this;
}

void sub_20E603F70(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void sub_20E603F84(_Unwind_Exception *a1)
{
  uint64_t v1;
  std::__shared_weak_count *v2;
  void **v3;
  void *v5;
  void *v6;

  v5 = *v3;
  if (*v3)
  {
    v2[1].__shared_owners_ = (uint64_t)v5;
    operator delete(v5);
  }
  std::__shared_weak_count::~__shared_weak_count(v2);
  operator delete(v6);
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void *qmi::createRequest@<X0>(int a1@<W0>, __int16 *a2@<X1>, unsigned __int16 a3@<W2>, _QWORD *a4@<X8>)
{
  char *v8;
  uint64_t v9;
  size_t v10;
  size_t v11;
  _BYTE *v12;
  void *result;
  __int16 v14;

  *a4 = 0xAAAAAAAAAAAAAAAALL;
  a4[1] = 0xAAAAAAAAAAAAAAAALL;
  v8 = (char *)operator new(0x38uLL);
  *((_QWORD *)v8 + 1) = 0;
  *((_QWORD *)v8 + 2) = 0;
  *(_QWORD *)v8 = off_24C975840;
  *(_OWORD *)(v8 + 40) = 0u;
  *(_OWORD *)(v8 + 24) = 0u;
  *a4 = v8 + 24;
  a4[1] = v8;
  if (a1)
    v9 = 9;
  else
    v9 = 8;
  v10 = a3;
  v11 = a3 + v9;
  v12 = operator new(v11);
  bzero(v12, v11);
  *v12 = 1;
  *(_WORD *)(v12 + 1) = v11 - 1;
  v12[3] = 0;
  v12[4] = a1;
  *(_WORD *)(v12 + 5) = 0;
  v12[7] = 0;
  if (a1)
    v12[8] = 0;
  result = memcpy(&v12[v9], a2, v10);
  v14 = *a2;
  *((_QWORD *)v8 + 3) = v12;
  *((_QWORD *)v8 + 4) = &v12[v11];
  *((_QWORD *)v8 + 5) = &v12[v11];
  *((_WORD *)v8 + 24) = v14;
  return result;
}

void sub_20E6040AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t qmi::parse(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unsigned int v4;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v13;
  unint64_t v14;

  if ((a2 & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  if (a2 < 8)
    return 0;
  v13 = 0xAAAAAAAAAAAAAAAALL;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  LOBYTE(v13) = *(_BYTE *)a1;
  v4 = *(unsigned __int16 *)(a1 + 1);
  *(_DWORD *)((char *)&v13 + 2) = *(_DWORD *)(a1 + 1);
  BYTE6(v13) = *(_BYTE *)(a1 + 5);
  if (BYTE5(v13))
  {
    if (a2 < 9)
      return 0;
    v10 = *(char *)(a1 + 6);
    if (v10 > 4)
      v11 = 3;
    else
      v11 = dword_20E61EC50[v10];
    LODWORD(v14) = v11;
    v7 = 9;
    WORD2(v14) = *(_WORD *)(a1 + 7);
    v8 = v4 + 1;
    v9 = v4 - 8;
    if (v4 + 1 >= 9)
      goto LABEL_15;
LABEL_10:
    (*(void (**)(uint64_t, unint64_t *, _QWORD, uint64_t, _QWORD))(a3 + 16))(a3, &v13, 0, 0xFFFFFFFFLL, 0);
    return 0xFFFFFFFFLL;
  }
  v6 = *(unsigned __int8 *)(a1 + 6);
  if (v6 >= 3)
    v6 = 3;
  LODWORD(v14) = v6;
  v7 = 8;
  WORD2(v14) = *(unsigned __int8 *)(a1 + 7);
  v8 = v4 + 1;
  v9 = v4 - 7;
  if (v4 + 1 < 8)
    goto LABEL_10;
LABEL_15:
  (*(void (**)(uint64_t, unint64_t *, uint64_t, uint64_t, _QWORD))(a3 + 16))(a3, &v13, a1 + v7, v9, a2 - v7);
  if (v4 >= a2)
    return 0;
  else
    return v8;
}

{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 1107296256;
  v4[2] = ___ZN3qmi5parseEPKhiU13block_pointerFvRKNS_10QMuxHeaderES1_iE_block_invoke;
  v4[3] = &__block_descriptor_tmp;
  v4[4] = a3;
  return qmi::parse(a1, a2, (uint64_t)v4);
}

void qmi::MessageBase::validateMsgId(qmi::MessageBase *this, int a2)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  if (!*((_DWORD *)this + 1) && *(unsigned __int16 *)this != a2)
  {
    *((_DWORD *)this + 1) = 65544;
    v2 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
    *((_QWORD *)this + 1) = 0;
    *((_QWORD *)this + 2) = 0;
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
  }
}

__n128 qmi::MutableMessageBase::MutableMessageBase(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_WORD *)a1 = *(_WORD *)a2;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  result = *(__n128 *)(a2 + 8);
  *(__n128 *)(a1 + 8) = result;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  return result;
}

{
  __n128 result;

  *(_WORD *)a1 = *(_WORD *)a2;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  result = *(__n128 *)(a2 + 8);
  *(__n128 *)(a1 + 8) = result;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  return result;
}

const char *qmi::asString(unsigned int a1)
{
  const char *result;

  result = "QMI_ERROR_NONE";
  switch(a1)
  {
    case 0u:
      return result;
    case 1u:
      result = "QMI_ERR_MALFORMED_MSG";
      break;
    case 2u:
      result = "QMI_ERR_NO_MEMORY";
      break;
    case 3u:
      result = "QMI_ERR_INTERNAL";
      break;
    case 4u:
      result = "QMI_ERR_ABORTED";
      break;
    case 5u:
      result = "QMI_ERR_CLIENT_IDS_EXHAUSTED";
      break;
    case 6u:
      result = "QMI_ERR_UNABORTABLE_TRANSACTION";
      break;
    case 7u:
      result = "QMI_ERR_INVALID_CLIENT_ID";
      break;
    case 8u:
      result = "QMI_ERR_NO_THRESHOLDS";
      break;
    case 9u:
      result = "QMI_ERR_INVALID_HANDLE";
      break;
    case 0xAu:
      result = "QMI_ERR_INVALID_PROFILE";
      break;
    case 0xBu:
      result = "QMI_ERR_INVALID_PINID";
      break;
    case 0xCu:
      result = "QMI_ERR_INCORRECT_PIN";
      break;
    case 0xDu:
      result = "QMI_ERR_NO_NETWORK_FOUND";
      break;
    case 0xEu:
      result = "QMI_ERR_CALL_FAILED";
      break;
    case 0xFu:
      result = "QMI_ERR_OUT_OF_CALL";
      break;
    case 0x10u:
      result = "QMI_ERR_NOT_PROVISIONED";
      break;
    case 0x11u:
      result = "QMI_ERR_MISSING_ARG";
      break;
    case 0x12u:
      result = "QMI_ERR_GENERIC_0012";
      break;
    case 0x13u:
      result = "QMI_ERR_ARG_TOO_LONG";
      break;
    case 0x14u:
      result = "QMI_ERR_GENERIC_0014";
      break;
    case 0x15u:
      result = "QMI_ERR_GENERIC_0015";
      break;
    case 0x16u:
      result = "QMI_ERR_INVALID_TX_ID";
      break;
    case 0x17u:
      result = "QMI_ERR_DEVICE_IN_USE";
      break;
    case 0x18u:
      result = "QMI_ERR_OP_NETWORK_UNSUPPORTED";
      break;
    case 0x19u:
      result = "QMI_ERR_OP_DEVICE_UNSUPPORTED";
      break;
    case 0x1Au:
      result = "QMI_ERR_NO_EFFECT";
      break;
    case 0x1Bu:
      result = "QMI_ERR_NO_FREE_PROFILE";
      break;
    case 0x1Cu:
      result = "QMI_ERR_INVALID_PDP_TYPE";
      break;
    case 0x1Du:
      result = "QMI_ERR_INVALID_TECH_PREF";
      break;
    case 0x1Eu:
      result = "QMI_ERR_INVALID_PROFILE_TYPE";
      break;
    case 0x1Fu:
      result = "QMI_ERR_INVALID_SERVICE_TYPE";
      break;
    case 0x20u:
      result = "QMI_ERR_INVALID_REGISTER_ACTION";
      break;
    case 0x21u:
      result = "QMI_ERR_INVALID_PS_ATTACH_ACTION";
      break;
    case 0x22u:
      result = "QMI_ERR_AUTHENTICATION_FAILED";
      break;
    case 0x23u:
      result = "QMI_ERR_PIN_BLOCKED";
      break;
    case 0x24u:
      result = "QMI_ERR_PIN_PERM_BLOCKED";
      break;
    case 0x25u:
      result = "QMI_ERR_UIM_NOT_INITIALIZED";
      break;
    case 0x26u:
      result = "QMI_ERR_MAX_QOS_REQUESTS_IN_USE";
      break;
    case 0x27u:
      result = "QMI_ERR_INCORRECT_FLOW_FILTER";
      break;
    case 0x28u:
      result = "QMI_ERR_NETWORK_QOS_UNAWARE";
      break;
    case 0x29u:
      result = "QMI_ERR_INVALID_ID";
      break;
    case 0x2Au:
      result = "QMI_ERR_REQUESTED_NUM_UNSUPPORTED";
      break;
    case 0x2Bu:
      result = "QMI_ERR_INTERFACE_NOT_FOUND";
      break;
    case 0x2Cu:
      result = "QMI_ERR_FLOW_SUSPENDED";
      break;
    case 0x2Du:
      result = "QMI_ERR_INVALID_DATA_FORMAT";
      break;
    case 0x2Eu:
      result = "QMI_ERR_GENERAL";
      break;
    case 0x2Fu:
      result = "QMI_ERR_UNKNOWN";
      break;
    case 0x30u:
      result = "QMI_ERR_INVALID_ARG";
      break;
    case 0x31u:
      result = "QMI_ERR_INVALID_INDEX";
      break;
    case 0x32u:
      result = "QMI_ERR_NO_ENTRY";
      break;
    case 0x33u:
      result = "QMI_ERR_DEVICE_STORAGE_FULL";
      break;
    case 0x34u:
      result = "QMI_ERR_DEVICE_NOT_READY";
      break;
    case 0x35u:
      result = "QMI_ERR_NETWORK_NOT_READY";
      break;
    case 0x36u:
      result = "QMI_ERR_CAUSE_CODE";
      break;
    case 0x37u:
      result = "QMI_ERR_MESSAGE_NOT_SENT";
      break;
    case 0x38u:
      result = "QMI_ERR_MESSAGE_DELIVERY_FAILURE";
      break;
    case 0x39u:
      result = "QMI_ERR_INVALID_MESSAGE_ID";
      break;
    case 0x3Au:
      result = "QMI_ERR_ENCODING";
      break;
    case 0x3Bu:
      result = "QMI_ERR_AUTHENTICATION_LOCK";
      break;
    case 0x3Cu:
      result = "QMI_ERR_INVALID_TRANSITION";
      break;
    case 0x3Du:
      result = "QMI_ERR_NOT_A_MCAST_IFACE";
      break;
    case 0x3Eu:
      result = "QMI_ERR_MAX_MCAST_REQUESTS_IN_USE";
      break;
    case 0x3Fu:
      result = "QMI_ERR_INVALID_MCAST_HANDLE";
      break;
    case 0x40u:
      result = "QMI_ERR_INVALID_IP_FAMILY_PREF";
      break;
    case 0x41u:
      result = "QMI_ERR_SESSION_INACTIVE";
      break;
    case 0x42u:
      result = "QMI_ERR_SESSION_INVALID";
      break;
    case 0x43u:
      result = "QMI_ERR_SESSION_OWNERSHIP";
      break;
    case 0x44u:
      result = "QMI_ERR_INSUFFICIENT_RESOURCES";
      break;
    case 0x45u:
      result = "QMI_ERR_DISABLED";
      break;
    case 0x46u:
      result = "QMI_ERR_INVALID_OPERATION";
      break;
    case 0x47u:
      result = "QMI_ERR_INVALID_QMI_CMD";
      break;
    case 0x48u:
      result = "QMI_ERR_TPDU_TYPE";
      break;
    case 0x49u:
      result = "QMI_ERR_SMSC_ADDR";
      break;
    case 0x4Au:
      result = "QMI_ERR_INFO_UNAVAILABLE";
      break;
    case 0x4Bu:
      result = "QMI_ERR_SEGMENT_TOO_LONG";
      break;
    case 0x4Cu:
      result = "QMI_ERR_SEGMENT_ORDER";
      break;
    case 0x4Du:
      result = "QMI_ERR_BUNDLING_NOT_SUPPORTED";
      break;
    case 0x4Eu:
      result = "QMI_ERR_OP_PARTIAL_FAILURE";
      break;
    case 0x4Fu:
      result = "QMI_ERR_POLICY_MISMATCH";
      break;
    case 0x50u:
      result = "QMI_ERR_SIM_FILE_NOT_FOUND";
      break;
    case 0x51u:
      result = "QMI_ERR_EXTENDED_INTERNAL";
      break;
    case 0x52u:
      result = "QMI_ERR_ACCESS_DENIED";
      break;
    case 0x53u:
      result = "QMI_ERR_HARDWARE_RESTRICTED";
      break;
    case 0x54u:
      result = "QMI_ERR_ACK_NOT_SENT";
      break;
    case 0x55u:
      result = "QMI_ERR_INJECT_TIMEOUT";
      break;
    case 0x56u:
      result = "QMI_ERR_GENERIC_0056";
      break;
    case 0x57u:
      result = "QMI_ERR_GENERIC_0057";
      break;
    case 0x58u:
      result = "QMI_ERR_GENERIC_0058";
      break;
    case 0x59u:
      result = "QMI_ERR_GENERIC_0059";
      break;
    case 0x5Au:
      result = "QMI_ERR_INCOMPATIBLE_STATE";
      break;
    case 0x5Bu:
      result = "QMI_ERR_FDN_RESTRICT";
      break;
    case 0x5Cu:
      result = "QMI_ERR_SUPS_FAILURE_CAUSE";
      break;
    case 0x5Du:
      result = "QMI_ERR_NO_RADIO";
      break;
    case 0x5Eu:
      result = "QMI_ERR_NOT_SUPPORTED";
      break;
    case 0x5Fu:
      result = "QMI_ERR_NO_SUBSCRIPTION";
      break;
    case 0x60u:
      result = "QMI_ERR_CARD_CALL_CONTROL_FAILED";
      break;
    case 0x61u:
      result = "QMI_ERR_NETWORK_ABORTED";
      break;
    case 0x62u:
      result = "QMI_ERR_MSG_BLOCKED";
      break;
    case 0x63u:
      result = "QMI_ERR_GENERIC_0063";
      break;
    case 0x64u:
      result = "QMI_ERR_INVALID_SESSION_TYPE";
      break;
    case 0x65u:
      result = "QMI_ERR_INVALID_PB_TYPE";
      break;
    case 0x66u:
      result = "QMI_ERR_NO_SIM";
      break;
    case 0x67u:
      result = "QMI_ERR_PB_NOT_READY";
      break;
    case 0x68u:
      result = "QMI_ERR_PIN_RESTRICTION";
      break;
    case 0x69u:
      result = "QMI_ERR_PIN2_RESTRICTION";
      break;
    case 0x6Au:
      result = "QMI_ERR_PUK_RESTRICTION";
      break;
    case 0x6Bu:
      result = "QMI_ERR_PUK2_RESTRICTION";
      break;
    case 0x6Cu:
      result = "QMI_ERR_PB_ACCESS_RESTRICTED";
      break;
    case 0x6Du:
      result = "QMI_ERR_PB_DELETE_IN_PROG";
      break;
    case 0x6Eu:
      result = "QMI_ERR_PB_TEXT_TOO_LONG";
      break;
    case 0x6Fu:
      result = "QMI_ERR_PB_NUMBER_TOO_LONG";
      break;
    case 0x70u:
      result = "QMI_ERR_PB_HIDDEN_KEY_RESTRICTION";
      break;
    case 0x71u:
      result = "QMI_ERR_PB_NOT_AVAILABLE";
      break;
    case 0x72u:
      result = "QMI_ERR_DEVICE_MEMORY_ERROR";
      break;
    case 0x73u:
    case 0x74u:
    case 0x75u:
    case 0x76u:
    case 0x77u:
    case 0x78u:
    case 0x79u:
    case 0x7Au:
    case 0x7Bu:
    case 0x7Cu:
    case 0x7Du:
    case 0x7Eu:
    case 0x7Fu:
    case 0x80u:
    case 0x81u:
    case 0x82u:
    case 0x83u:
    case 0x84u:
    case 0x85u:
    case 0x86u:
    case 0x87u:
    case 0x88u:
    case 0x89u:
    case 0x8Au:
    case 0x8Bu:
    case 0x8Cu:
    case 0x8Du:
    case 0x8Eu:
    case 0x8Fu:
    case 0x90u:
    case 0x91u:
    case 0x92u:
    case 0x93u:
    case 0x94u:
    case 0x95u:
    case 0x96u:
    case 0x97u:
    case 0x98u:
    case 0x99u:
    case 0x9Au:
    case 0x9Bu:
    case 0x9Cu:
    case 0x9Du:
    case 0x9Eu:
    case 0x9Fu:
    case 0xA0u:
    case 0xA1u:
    case 0xA2u:
    case 0xA3u:
    case 0xA4u:
    case 0xA5u:
    case 0xA6u:
    case 0xA7u:
    case 0xA8u:
    case 0xA9u:
    case 0xAAu:
    case 0xABu:
    case 0xACu:
    case 0xADu:
    case 0xAEu:
    case 0xAFu:
    case 0xB0u:
    case 0xB1u:
    case 0xB2u:
    case 0xB3u:
    case 0xB4u:
    case 0xB5u:
    case 0xB6u:
    case 0xB7u:
    case 0xB8u:
    case 0xB9u:
    case 0xBAu:
    case 0xBBu:
    case 0xBCu:
    case 0xBDu:
    case 0xBEu:
    case 0xBFu:
    case 0xC0u:
    case 0xC1u:
    case 0xC2u:
    case 0xC3u:
    case 0xC4u:
    case 0xC5u:
    case 0xC6u:
    case 0xC7u:
    case 0xC8u:
    case 0x103u:
    case 0x104u:
    case 0x105u:
    case 0x106u:
    case 0x107u:
    case 0x108u:
    case 0x109u:
    case 0x10Au:
    case 0x10Bu:
    case 0x10Cu:
    case 0x10Du:
    case 0x10Eu:
    case 0x10Fu:
    case 0x110u:
    case 0x111u:
    case 0x112u:
    case 0x113u:
    case 0x114u:
    case 0x115u:
    case 0x116u:
    case 0x117u:
    case 0x118u:
    case 0x119u:
    case 0x11Au:
    case 0x11Bu:
    case 0x11Cu:
    case 0x11Du:
    case 0x11Eu:
    case 0x11Fu:
    case 0x120u:
    case 0x121u:
    case 0x122u:
    case 0x123u:
    case 0x124u:
    case 0x125u:
    case 0x126u:
    case 0x127u:
    case 0x128u:
    case 0x129u:
    case 0x12Au:
    case 0x12Bu:
    case 0x12Cu:
    case 0x12Du:
    case 0x12Eu:
    case 0x12Fu:
    case 0x130u:
    case 0x131u:
    case 0x132u:
    case 0x133u:
    case 0x134u:
    case 0x135u:
    case 0x136u:
    case 0x137u:
    case 0x138u:
    case 0x139u:
    case 0x13Au:
    case 0x13Bu:
    case 0x13Cu:
    case 0x13Du:
    case 0x13Eu:
    case 0x13Fu:
    case 0x140u:
    case 0x141u:
    case 0x142u:
    case 0x143u:
    case 0x144u:
    case 0x145u:
    case 0x146u:
    case 0x147u:
    case 0x148u:
    case 0x149u:
    case 0x14Au:
    case 0x14Bu:
    case 0x14Cu:
    case 0x14Du:
    case 0x14Eu:
    case 0x14Fu:
    case 0x150u:
    case 0x151u:
    case 0x152u:
    case 0x153u:
    case 0x154u:
    case 0x155u:
    case 0x156u:
    case 0x157u:
    case 0x158u:
    case 0x159u:
    case 0x15Au:
    case 0x15Bu:
    case 0x15Cu:
    case 0x15Du:
    case 0x15Eu:
    case 0x15Fu:
    case 0x160u:
    case 0x161u:
    case 0x162u:
    case 0x163u:
    case 0x164u:
    case 0x165u:
    case 0x166u:
    case 0x167u:
    case 0x168u:
    case 0x169u:
    case 0x16Au:
    case 0x16Bu:
    case 0x16Cu:
    case 0x16Du:
    case 0x16Eu:
    case 0x16Fu:
    case 0x170u:
    case 0x171u:
    case 0x172u:
    case 0x173u:
    case 0x174u:
    case 0x175u:
    case 0x176u:
    case 0x177u:
    case 0x178u:
    case 0x179u:
    case 0x17Au:
    case 0x17Bu:
    case 0x17Cu:
    case 0x17Du:
    case 0x17Eu:
    case 0x17Fu:
    case 0x180u:
    case 0x181u:
    case 0x182u:
    case 0x183u:
    case 0x184u:
    case 0x185u:
    case 0x186u:
    case 0x187u:
    case 0x188u:
    case 0x189u:
    case 0x18Au:
    case 0x18Bu:
    case 0x18Cu:
    case 0x18Du:
    case 0x18Eu:
    case 0x18Fu:
    case 0x190u:
    case 0x191u:
    case 0x192u:
    case 0x193u:
    case 0x194u:
    case 0x195u:
    case 0x196u:
    case 0x197u:
    case 0x198u:
    case 0x199u:
    case 0x19Au:
    case 0x19Bu:
    case 0x19Cu:
    case 0x19Du:
    case 0x19Eu:
    case 0x19Fu:
    case 0x1A0u:
    case 0x1A1u:
    case 0x1A2u:
    case 0x1A3u:
    case 0x1A4u:
    case 0x1A5u:
    case 0x1A6u:
    case 0x1A7u:
    case 0x1A8u:
    case 0x1A9u:
    case 0x1AAu:
    case 0x1ABu:
    case 0x1ACu:
    case 0x1ADu:
    case 0x1AEu:
    case 0x1AFu:
    case 0x1B0u:
    case 0x1B1u:
    case 0x1B2u:
    case 0x1B3u:
    case 0x1B4u:
    case 0x1B5u:
    case 0x1B6u:
    case 0x1B7u:
    case 0x1B8u:
    case 0x1B9u:
    case 0x1BAu:
    case 0x1BBu:
    case 0x1BCu:
    case 0x1BDu:
    case 0x1BEu:
    case 0x1BFu:
    case 0x1C0u:
    case 0x1C1u:
    case 0x1C2u:
    case 0x1C3u:
    case 0x1C4u:
    case 0x1C5u:
    case 0x1C6u:
    case 0x1C7u:
    case 0x1C8u:
    case 0x1C9u:
    case 0x1CAu:
    case 0x1CBu:
    case 0x1CCu:
    case 0x1CDu:
    case 0x1CEu:
    case 0x1CFu:
    case 0x1D0u:
    case 0x1D1u:
    case 0x1D2u:
    case 0x1D3u:
    case 0x1D4u:
    case 0x1D5u:
    case 0x1D6u:
    case 0x1D7u:
    case 0x1D8u:
    case 0x1D9u:
    case 0x1DAu:
    case 0x1DBu:
    case 0x1DCu:
    case 0x1DDu:
    case 0x1DEu:
    case 0x1DFu:
    case 0x1E0u:
    case 0x1E1u:
    case 0x1E2u:
    case 0x1E3u:
    case 0x1E4u:
    case 0x1E5u:
    case 0x1E6u:
    case 0x1E7u:
    case 0x1E8u:
    case 0x1E9u:
    case 0x1EAu:
    case 0x1EBu:
    case 0x1ECu:
    case 0x1EDu:
    case 0x1EEu:
    case 0x1EFu:
    case 0x1F0u:
    case 0x1F1u:
    case 0x1F2u:
    case 0x1F3u:
    case 0x207u:
LABEL_7:
      if (HIWORD(a1) == 57005)
        result = "ATCS_UNKNOWN_ERROR";
      else
        result = "UNKNOWN ERROR";
      break;
    case 0xC9u:
      result = "CM_CALL_CMD_ERR_CLIENT_ID_P";
      break;
    case 0xCAu:
      result = "CM_CALL_CMD_ERR_CALL_ID_P";
      break;
    case 0xCBu:
      result = "CM_CALL_CMD_ERR_NUM_CALL_IDS_P";
      break;
    case 0xCCu:
      result = "CM_CALL_CMD_ERR_CALL_TYPE_P";
      break;
    case 0xCDu:
      result = "CM_CALL_CMD_ERR_SRV_TYPE_P";
      break;
    case 0xCEu:
      result = "CM_CALL_CMD_ERR_SRV_OPT_P";
      break;
    case 0xCFu:
      result = "CM_CALL_CMD_ERR_MODE_PREF_P";
      break;
    case 0xD0u:
      result = "CM_CALL_CMD_ERR_NO_NUM_P";
      break;
    case 0xD1u:
      result = "CM_CALL_CMD_ERR_NULL_NUM_P";
      break;
    case 0xD2u:
      result = "CM_CALL_CMD_ERR_NUM_P";
      break;
    case 0xD3u:
      result = "CM_CALL_CMD_ERR_NUM_LEN_P";
      break;
    case 0xD4u:
      result = "CM_CALL_CMD_ERR_NULL_ALPHA_P";
      break;
    case 0xD5u:
      result = "CM_CALL_CMD_ERR_ALPHA_LEN_P";
      break;
    case 0xD6u:
      result = "CM_CALL_CMD_ERR_MISMATCH_P";
      break;
    case 0xD7u:
      result = "CM_CALL_CMD_ERR_NULL_PARAM_P";
      break;
    case 0xD8u:
      result = "CM_CALL_CMD_ERR_ACTIVATE_CODE_P";
      break;
    case 0xD9u:
      result = "CM_CALL_CMD_ERR_CALL_SUPS_P";
      break;
    case 0xDAu:
      result = "CM_CALL_CMD_ERR_QOS_LEN_P";
      break;
    case 0xDBu:
      result = "CM_CALL_CMD_ERR_LAST_ACT_DATA_NET_P";
      break;
    case 0xDCu:
      result = "CM_CALL_CMD_ERR_INVALID_PRIMARY_CALL_ID_P";
      break;
    case 0xDDu:
      result = "CM_CALL_CMD_ERR_INVALID_GROUP_ID_P";
      break;
    case 0xDEu:
      result = "CM_CALL_CMD_ERR_PROFILE_NUMBER_IN_USE_P";
      break;
    case 0xDFu:
      result = "CM_CALL_CMD_ERR_UMTS_CDMA_HANDOVER_REQ_P";
      break;
    case 0xE0u:
      result = "CM_CALL_CMD_ERR_UMTS_CDMA_HANDOVER_CNF_P";
      break;
    case 0xE1u:
      result = "CM_CALL_CMD_ERR_OFFLINE_S";
      break;
    case 0xE2u:
      result = "CM_CALL_CMD_ERR_CDMA_LOCK_S";
      break;
    case 0xE3u:
      result = "CM_CALL_CMD_ERR_FLASH_S";
      break;
    case 0xE4u:
      result = "CM_CALL_CMD_ERR_ORIG_RES_S";
      break;
    case 0xE5u:
      result = "CM_CALL_CMD_ERR_NO_FUNDS_S";
      break;
    case 0xE6u:
      result = "CM_CALL_CMD_ERR_EMERGENCY_MODE_S";
      break;
    case 0xE7u:
      result = "CM_CALL_CMD_ERR_IN_USE_S";
      break;
    case 0xE8u:
      result = "CM_CALL_CMD_ERR_SRV_TYPE_S";
      break;
    case 0xE9u:
      result = "CM_CALL_CMD_ERR_CALL_TYPE_S";
      break;
    case 0xEAu:
      result = "CM_CALL_CMD_ERR_CALL_STATE_S";
      break;
    case 0xEBu:
      result = "CM_CALL_CMD_ERR_SRV_STATE_S";
      break;
    case 0xECu:
      result = "CM_CALL_CMD_ERR_NO_SO_S";
      break;
    case 0xEDu:
      result = "CM_CALL_CMD_ERR_ALERT_ANS_BYPASS_S";
      break;
    case 0xEEu:
      result = "CM_CALL_CMD_ERR_UIM_NOT_PRESENT_S";
      break;
    case 0xEFu:
      result = "CM_CALL_CMD_ERR_BAD_PRIVACY_PREF_S";
      break;
    case 0xF0u:
      result = "CM_CALL_CMD_ERR_NO_CALL_ID_S";
      break;
    case 0xF1u:
      result = "CM_CALL_CMD_ERR_CALL_ORIG_FAIL_S";
      break;
    case 0xF2u:
      result = "CM_CALL_CMD_ERR_INVALID_MODE_S";
      break;
    case 0xF3u:
      result = "CM_CALL_CMD_ERR_INVALID_SIM_STATE_S";
      break;
    case 0xF4u:
      result = "CM_CALL_CMD_ERR_MAX_PRIMARY_PDP_CONTEXTS_S";
      break;
    case 0xF5u:
      result = "CM_CALL_CMD_ERR_MAX_SEC_PDP_CONTEXT_PER_PRI_S";
      break;
    case 0xF6u:
      result = "CM_CALL_CMD_ERR_NO_COLLOC_HDR";
      break;
    case 0xF7u:
      result = "CM_CALL_CMD_ERR_NO_BUF_L";
      break;
    case 0xF8u:
      result = "CM_CALL_CMD_ERR_MC_COM_L";
      break;
    case 0xF9u:
      result = "CM_CALL_CMD_ERR_OTHER";
      break;
    case 0xFAu:
      result = "CM_CALL_CMD_ERR_FUNCTION_UNAVAILABLE_DUE_TO_UNDEFINED_FEATURE";
      break;
    case 0xFBu:
      result = "CM_CALL_CMD_ERR_CALL_CONTROL_REJECTED";
      break;
    case 0xFCu:
      result = "CM_CALL_CMD_ERR_FAVORED_MODE_PREF_FOR_ORIGINATION";
      break;
    case 0xFDu:
      result = "CM_CALL_CMD_ERR_CONNECTION_ID_OUT_L";
      break;
    case 0xFEu:
      result = "CM_CALL_CMD_ERR_SUPS_SRV_ON_PROHIBITED_LINE_S";
      break;
    case 0xFFu:
      result = "CM_CALL_CMD_ERR_USER_DATA_LENGTH_P";
      break;
    case 0x100u:
      result = "CM_CALL_CMD_ERR_NON_NEGOT_BEARER_P";
      break;
    case 0x101u:
      result = "CM_CALL_CMD_ERR_INVALID_BC_P";
      break;
    case 0x102u:
      result = "CM_CALL_CMD_ERR_INVALID_ORIG_CLIENT_P";
      break;
    case 0x1F4u:
      result = "QMI_ERR_FILE_NOT_SUPPORTED";
      break;
    case 0x1F5u:
      result = "QMI_ERR_FILE_TRANSFER_BUSY";
      break;
    case 0x1F6u:
      result = "QMI_ERR_TOO_MANY_DUPLICATES";
      break;
    case 0x1F7u:
      result = "QMI_ERR_UNEXPECTED_SEG_NUMBER";
      break;
    case 0x1F8u:
      result = "QMI_ERR_UNSUPPORTED_QMI_CMD";
      break;
    case 0x1F9u:
      result = "QMI_ERR_PB_DESERIALIZE";
      break;
    case 0x1FAu:
      result = "QMI_ERR_PB_SERIALIZE";
      break;
    case 0x1FBu:
      result = "QMI_ERR_AWDC_CONFIG_SET";
      break;
    case 0x1FCu:
      result = "QMI_ERR_AWDC_CONFIG_DELETE";
      break;
    case 0x1FDu:
      result = "QMI_ERR_AWDC_SET_Q_METRICS";
      break;
    case 0x1FEu:
      result = "MAV_QMI_MEAS_ERROR_BAD_MEAS_ID";
      break;
    case 0x1FFu:
      result = "MAV_QMI_MEAS_ERROR_LISTENER_ERROR";
      break;
    case 0x200u:
      result = "MAV_QMI_MEAS_ERROR_BAD_MEAS_TYPE";
      break;
    case 0x201u:
      result = "MAV_QMI_ERR_DATA_IN_BUFFER";
      break;
    case 0x202u:
      result = "MAV_QMI_ERR_FAIL_ORIG_DURING_INCOMING";
      break;
    case 0x203u:
      result = "MAV_QMI_ERR_RTP_INITIALIZATION_FAILED";
      break;
    case 0x204u:
      result = "QMI_ERR_VINYL_NOCAPABLE_UICC";
      break;
    case 0x205u:
      result = "QMI_ERR_VINYL_NOT_READY";
      break;
    case 0x206u:
      result = "QMI_ERR_SECURITY_FAILURE";
      break;
    case 0x208u:
      result = "QMI_ERROR_ACTIVATION_NOT_READY";
      break;
    default:
      switch(a1)
      {
        case 0x10000u:
          result = "ATCS_MIN_ERROR_VALUE";
          break;
        case 0x10001u:
          result = "ATCS_TIMEOUT";
          break;
        case 0x10002u:
          result = "ATCS_CLIENT_NOT_READY";
          break;
        case 0x10003u:
          result = "ATCS_CANCELLED";
          break;
        case 0x10004u:
          result = "ATCS_BUF_NO_HEADER";
          break;
        case 0x10005u:
          result = "ATCS_BUF_TOO_SMALL";
          break;
        case 0x10006u:
          result = "ATCS_NO_RESULT_CODE";
          break;
        case 0x10007u:
          result = "ATCS_PARSING_ERROR";
          break;
        case 0x10008u:
          result = "ATCS_MSGID_MISMATCH";
          break;
        case 0x10009u:
          result = "ATCS_NULL_MESSAGE";
          break;
        case 0x1000Au:
        case 0x1000Bu:
        case 0x1000Cu:
        case 0x1000Du:
        case 0x1000Eu:
        case 0x1000Fu:
          goto LABEL_7;
        case 0x10010u:
          result = "ATCS_BAD_QMI_ERROR";
          break;
        case 0x10011u:
          result = "ATCS_SERVER_FAILURE";
          break;
        default:
          if (a1 != -559087616)
            goto LABEL_7;
          result = "ATCS_UNKNOWN_ERROR";
          break;
      }
      break;
  }
  return result;
}

{
  if (a1 > 2)
    return "UNKNOWN";
  else
    return off_24C975880[a1];
}

void defaultParsingHandler(unsigned __int16 a1, unsigned __int16 a2, const unsigned __int8 *a3)
{
  tlv_parsing_exception *exception;
  const unsigned __int8 *v6;

  exception = (tlv_parsing_exception *)__cxa_allocate_exception(0x20uLL);
  tlv_parsing_exception::tlv_parsing_exception(exception, a1, a2, v6);
}

void sub_20E604D40(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (*qmi::MessageBase::setParsingErrorHandler(void (*this)(unsigned __int16 a1, unsigned __int16 a2, const unsigned __int8 *a3), BOOL (*a2)(unsigned __int16, unsigned __int16, const unsigned __int8 *, unint64_t)))(unsigned __int16 a1, unsigned __int16 a2, const unsigned __int8 *a3)
{
  void (*v2)(unsigned __int16, unsigned __int16, const unsigned __int8 *);

  v2 = defaultParsingHandler;
  if (this)
    v2 = this;
  qmi::MessageBase::sParsingErrorHandler = (uint64_t)v2;
  return this;
}

uint64_t qmi::MessageBase::MessageBase(uint64_t result, __int16 a2, int a3)
{
  *(_WORD *)result = a2;
  *(_DWORD *)(result + 4) = a3;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0;
  return result;
}

{
  *(_WORD *)result = a2;
  *(_DWORD *)(result + 4) = a3;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0;
  return result;
}

uint64_t qmi::MessageBase::MessageBase(uint64_t result, int a2)
{
  *(_WORD *)result = 0;
  *(_DWORD *)(result + 4) = a2;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0;
  return result;
}

{
  *(_WORD *)result = 0;
  *(_DWORD *)(result + 4) = a2;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0;
  return result;
}

void qmi::MessageBase::setError(uint64_t a1, int a2, int a3)
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;

  *(_DWORD *)(a1 + 4) = a2;
  if (a3)
  {
    v3 = *(std::__shared_weak_count **)(a1 + 16);
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
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
}

void qmi::MessageBase::validateBuffer(qmi::MessageBase *this)
{
  uint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;

  v1 = (uint64_t *)*((_QWORD *)this + 1);
  if (v1)
  {
    v3 = *v1;
    v2 = v1[1];
    if (v3 + 7 <= v2)
    {
      v4 = v3 + 7 + *(unsigned __int16 *)(v3 + 5);
      if (v4 + 3 <= v2)
      {
        do
        {
          v8 = v4 + *(unsigned __int16 *)(v4 + 1);
          v4 = v8 + 3;
        }
        while (v8 + 6 <= v2);
      }
    }
    else
    {
      v4 = v3 + 4;
    }
    if (v4 != v2)
    {
      *((_DWORD *)this + 1) = 65543;
      v5 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
      *((_QWORD *)this + 1) = 0;
      *((_QWORD *)this + 2) = 0;
      if (v5)
      {
        p_shared_owners = (unint64_t *)&v5->__shared_owners_;
        do
          v7 = __ldaxr(p_shared_owners);
        while (__stlxr(v7 - 1, p_shared_owners));
        if (!v7)
        {
          ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
          std::__shared_weak_count::__release_weak(v5);
        }
      }
    }
  }
}

uint64_t std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](uint64_t result)
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

qmi::MessageBase *qmi::MessageBase::MessageBase(qmi::MessageBase *this, const qmi::MutableMessageBase *a2)
{
  uint64_t **v3;
  char *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v16;
  void *__p[2];
  uint64_t v18;

  *(_WORD *)this = *(_WORD *)a2;
  v3 = (uint64_t **)((char *)this + 8);
  *(_QWORD *)((char *)this + 12) = 0;
  *(_QWORD *)((char *)this + 4) = 0;
  *((_DWORD *)this + 5) = 0;
  qmi::MutableMessageBase::serialize(a2, __p);
  v4 = (char *)operator new(0x30uLL);
  *((_QWORD *)v4 + 1) = 0;
  *((_QWORD *)v4 + 2) = 0;
  *(_QWORD *)v4 = off_24C975138;
  *(_OWORD *)(v4 + 24) = *(_OWORD *)__p;
  *((_QWORD *)v4 + 5) = v18;
  __p[0] = 0;
  __p[1] = 0;
  v18 = 0;
  v5 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 1) = v4 + 24;
  *((_QWORD *)this + 2) = v4;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldaxr(p_shared_owners);
    while (__stlxr(v7 - 1, p_shared_owners));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v8 = *v3;
  if (!*v3)
    return this;
  v10 = *v8;
  v9 = v8[1];
  if (v10 + 7 <= v9)
  {
    v11 = v10 + 7 + *(unsigned __int16 *)(v10 + 5);
    if (v11 + 3 <= v9)
    {
      do
      {
        v16 = v11 + *(unsigned __int16 *)(v11 + 1);
        v11 = v16 + 3;
      }
      while (v16 + 6 <= v9);
    }
  }
  else
  {
    v11 = v10 + 4;
  }
  if (v11 == v9)
    return this;
  *((_DWORD *)this + 1) = 65543;
  v12 = (std::__shared_weak_count *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  if (!v12)
    return this;
  v13 = (unint64_t *)&v12->__shared_owners_;
  do
    v14 = __ldaxr(v13);
  while (__stlxr(v14 - 1, v13));
  if (v14)
    return this;
  ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
  std::__shared_weak_count::__release_weak(v12);
  return this;
}

void sub_20E6050C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  uint64_t v10;

  if (__p)
  {
    operator delete(__p);
    std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](v10);
    _Unwind_Resume(a1);
  }
  std::shared_ptr<std::vector<unsigned char> const>::~shared_ptr[abi:ne180100](v10);
  _Unwind_Resume(a1);
}

__int16 *qmi::MessageBase::swap(__int16 *this, qmi::MessageBase *a2)
{
  __int16 v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *this;
  *this = *(_WORD *)a2;
  *(_WORD *)a2 = v2;
  v3 = *((_DWORD *)this + 1);
  *((_DWORD *)this + 1) = *((_DWORD *)a2 + 1);
  *((_DWORD *)a2 + 1) = v3;
  v4 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v4;
  v5 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v5;
  return this;
}

unsigned __int8 *qmi::MessageBase::findNextTlv(uint64_t a1, int a2, uint64_t a3)
{
  unint64_t v3;
  BOOL v4;
  unsigned __int8 *result;
  unint64_t v6;
  unsigned __int8 *v7;
  int v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a3 + 8);
  if (*(_QWORD *)a3)
    v4 = *(_QWORD *)a3 + 3 > v3;
  else
    v4 = 1;
  if (v4)
    return 0;
  result = *(unsigned __int8 **)(a3 + 24);
  v6 = *(unsigned __int16 *)(a3 + 18);
  if (*(unsigned __int8 *)(a3 + 16) != a2)
  {
    do
    {
      v7 = &result[v6];
      *(_QWORD *)a3 = v7;
      if (!result)
        break;
      result = v7 + 3;
      if ((unint64_t)(v7 + 3) > v3)
        return 0;
      *(_QWORD *)(a3 + 24) = v7 + 1;
      v8 = *v7;
      *(_QWORD *)(a3 + 24) = v7 + 2;
      v9 = v7[1];
      *(_QWORD *)(a3 + 24) = result;
      v6 = v9 | ((unint64_t)v7[2] << 8);
      *(_BYTE *)(a3 + 16) = v8;
      *(_WORD *)(a3 + 18) = v6;
    }
    while (v8 != a2);
  }
  return result;
}

void tlv_parsing_exception::tlv_parsing_exception(tlv_parsing_exception *this, unsigned __int16 a2, unsigned __int16 a3, const unsigned __int8 *a4)
{
  char *v5;
  __int128 v6;
  _QWORD *v7;
  size_t v8;
  __int128 *p_dst;
  uint64_t v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 __dst;
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *__p[2];
  __int128 v23;
  __int128 v24;
  _OWORD v25[9];
  unint64_t v26;

  *((_QWORD *)this + 1) = 0;
  v5 = (char *)this + 8;
  *(_QWORD *)this = off_24C975110;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  v26 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v25[7] = v6;
  v25[8] = v6;
  v25[5] = v6;
  v25[6] = v6;
  v25[3] = v6;
  v25[4] = v6;
  v25[1] = v6;
  v25[2] = v6;
  v24 = v6;
  v25[0] = v6;
  *(_OWORD *)__p = v6;
  v23 = v6;
  v20 = v6;
  v21 = v6;
  v18 = v6;
  v19 = v6;
  v17 = v6;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v17);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v18, (uint64_t)"tlv_parsing_exception: msgId=", 29);
  v7 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)" tlvId=", 7);
  std::ostream::operator<<();
  if ((BYTE8(v24) & 0x10) != 0)
  {
    v10 = v24;
    if ((unint64_t)v24 < *((_QWORD *)&v21 + 1))
    {
      *(_QWORD *)&v24 = *((_QWORD *)&v21 + 1);
      v10 = *((_QWORD *)&v21 + 1);
    }
    v11 = (const void *)v21;
    v8 = v10 - v21;
    if ((unint64_t)(v10 - v21) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_20;
  }
  else
  {
    if ((BYTE8(v24) & 8) == 0)
    {
      v8 = 0;
      HIBYTE(v16) = 0;
      p_dst = &__dst;
      goto LABEL_14;
    }
    v11 = (const void *)*((_QWORD *)&v19 + 1);
    v8 = *((_QWORD *)&v20 + 1) - *((_QWORD *)&v19 + 1);
    if (*((_QWORD *)&v20 + 1) - *((_QWORD *)&v19 + 1) >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_20:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v8 >= 0x17)
  {
    v12 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17)
      v12 = v8 | 7;
    v13 = v12 + 1;
    p_dst = (__int128 *)operator new(v12 + 1);
    *((_QWORD *)&__dst + 1) = v8;
    v16 = v13 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_13;
  }
  HIBYTE(v16) = v8;
  p_dst = &__dst;
  if (v8)
LABEL_13:
    memmove(p_dst, v11, v8);
LABEL_14:
  *((_BYTE *)p_dst + v8) = 0;
  if (*((char *)this + 31) < 0)
    operator delete(*(void **)v5);
  *(_OWORD *)v5 = __dst;
  *((_QWORD *)v5 + 2) = v16;
  *(_QWORD *)&v17 = *MEMORY[0x24BEDB7F0];
  v14 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)&v17 + *(_QWORD *)(v17 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&v18 = v14;
  *((_QWORD *)&v18 + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v23) < 0)
    operator delete(__p[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x212BC1680](v25);
}

void sub_20E605464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  uint64_t v29;
  void **v30;

  if (*(char *)(v29 + 31) < 0)
    operator delete(*v30);
  std::exception::~exception((std::exception *)v29);
  _Unwind_Resume(a1);
}

void tlv_parsing_exception::~tlv_parsing_exception(std::exception *this)
{
  std::exception *v1;

  v1 = this;
  this->__vftable = (std::exception_vtbl *)off_24C975110;
  if (SHIBYTE(this[3].__vftable) < 0)
  {
    operator delete(this[1].__vftable);
    this = v1;
  }
  std::exception::~exception(this);
}

{
  void *v2;

  this->__vftable = (std::exception_vtbl *)off_24C975110;
  if (SHIBYTE(this[3].__vftable) < 0)
  {
    operator delete(this[1].__vftable);
    std::exception::~exception(this);
  }
  else
  {
    std::exception::~exception(this);
  }
  operator delete(v2);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x24BEDB858];
  v3 = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 128) = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  v4 = a1 + 16;
  v5 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v7 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + *(_QWORD *)(v6 - 24)) = v7;
  *(_QWORD *)(a1 + 8) = 0;
  v8 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v9 = v5[4];
  v10 = v5[5];
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(v4 + *(_QWORD *)(v9 - 24)) = v10;
  v11 = v5[1];
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + *(_QWORD *)(v11 - 24)) = v5[6];
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 128) = v3;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_20E605644(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x212BC1680](v1);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x24BEDB7F0];
  v3 = *MEMORY[0x24BEDB7F0];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F0];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x212BC1680](a1 + 128);
  return a1;
}

uint64_t tlv_parsing_exception::what(tlv_parsing_exception *this)
{
  uint64_t result;

  result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0)
    return *(_QWORD *)result;
  return result;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
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
  MEMORY[0x212BC1554](v13, a1);
  if (LOBYTE(v13[0]))
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x212BC1560](v13);
  return a1;
}

void sub_20E605890(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x212BC1560](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x20E605870);
}

void sub_20E6058D8(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
        std::string::__throw_length_error[abi:ne180100]();
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

void sub_20E605A80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
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
  __cxa_throw(exception, (struct type_info *)off_24C974ED8, MEMORY[0x24BEDAAF0]);
}

void sub_20E605AEC(_Unwind_Exception *a1)
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

void std::__shared_ptr_emplace<std::vector<unsigned char>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C975138;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::vector<unsigned char>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C975138;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

uint64_t qmi::RandomMessageContext::generateRandomChars(uint64_t this, char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;

  if (a3)
  {
    v3 = a3;
    v5 = this;
    do
    {
      this = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 16))(v5, 95);
      *a2++ = qmi::RandomMessageContext::generateRandomChars(char *,unsigned long)::PRINTABLE[this];
      --v3;
    }
    while (v3);
  }
  return this;
}

void qmi::sCreateRandomMessageContext(qmi *this@<X0>, const char *a2@<X1>, _QWORD *a3@<X8>)
{
  unsigned int v5;
  _DWORD *v7;
  size_t v8;
  size_t v9;
  void **p_dst;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  void **v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unsigned int v19;
  void **__dst;
  size_t v21;
  int64_t v22;

  v5 = this;
  v7 = operator new(0x10uLL);
  *(_QWORD *)v7 = &off_24C9751D8;
  v7[2] = 1;
  v8 = strlen(a2);
  if (v8 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v9 = v8;
  if (v8 >= 0x17)
  {
    v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17)
      v11 = v8 | 7;
    v12 = v11 + 1;
    p_dst = (void **)operator new(v11 + 1);
    v21 = v9;
    v22 = v12 | 0x8000000000000000;
    __dst = p_dst;
    goto LABEL_8;
  }
  HIBYTE(v22) = v8;
  p_dst = (void **)&__dst;
  if (v8)
LABEL_8:
    memcpy(p_dst, a2, v9);
  *((_BYTE *)p_dst + v9) = 0;
  v13 = HIBYTE(v22);
  v14 = (void **)&__dst;
  if (v22 < 0)
  {
    v14 = __dst;
    v13 = v21;
  }
  if (v13)
  {
    v15 = 0;
    do
    {
      v16 = *(char *)v14;
      v14 = (void **)((char *)v14 + 1);
      v15 = 0xC6A4A7935BD1E995
          * ((0xC6A4A7935BD1E995 * ((0xC6A4A7935BD1E995 * v16) ^ ((0xC6A4A7935BD1E995 * v16) >> 47))) ^ v15)
          + 3864292196u;
      --v13;
    }
    while (v13);
    v17 = 0xC6A4A7935BD1E995 * v15;
    if (SHIBYTE(v22) < 0)
      goto LABEL_15;
  }
  else
  {
    v17 = 0;
    if (SHIBYTE(v22) < 0)
LABEL_15:
      operator delete(__dst);
  }
  v18 = 1540483477
      * ((1540483477 * ((v17 >> 47) ^ v17)) ^ (678072505
                                                           * ((((0xC6A4A7935BD1E995 * v5) >> 32) >> 15) ^ (1540483477 * v5))
                                                           - 430675100))
      - 430675100;
  v19 = v18
      + (((((v18 + 2 * v18) >> 32)
                       + ((v18 - ((v18 + 2 * v18) >> 32)) >> 1)) >> 30) | ((((v18 + 2 * v18) >> 32) + ((v18 - ((v18 + 2 * v18) >> 32)) >> 1)) >> 30 << 31));
  if (v19 <= 1)
    v19 = 1;
  v7[2] = v19;
  *a3 = v7;
}

void sub_20E605D88(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *qmi::sCreateAlwaysZeroRandomMessageContext@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = operator new(8uLL);
  *result = &off_24C975230;
  *a1 = result;
  return result;
}

_QWORD *qmi::sCreateZeroButLen1RandomMessageContext@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *result;

  result = operator new(8uLL);
  *result = &off_24C975288;
  *a1 = result;
  return result;
}

uint64_t `anonymous namespace'::LinearRandomMessageContext::generateBytes(uint64_t this, char *a2, uint64_t a3)
{
  char *v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;
  int v9;

  if (a3)
  {
    v3 = &a2[a3];
    do
    {
      v4 = *(_DWORD *)(this + 8);
      do
      {
        v5 = v4 / 0xADC8;
        v6 = 48271 * (v4 % 0xADC8);
        v5 *= 3399;
        v7 = v6 >= v5;
        v8 = v6 - v5;
        if (v7)
          v9 = 0;
        else
          v9 = 0x7FFFFFFF;
        v4 = v9 + v8;
      }
      while (v4 - 1 > 0x7FFFFEFF);
      *(_DWORD *)(this + 8) = v4;
      *a2++ = v4 - 1;
    }
    while (a2 != v3);
  }
  return this;
}

uint64_t `anonymous namespace'::LinearRandomMessageContext::generateLength(_anonymous_namespace_::LinearRandomMessageContext *this, int a2)
{
  _DWORD v3[2];

  v3[0] = 0;
  v3[1] = a2;
  return std::uniform_int_distribution<unsigned int>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)this + 8, v3);
}

uint64_t `anonymous namespace'::LinearRandomMessageContext::generateUnsigned(_anonymous_namespace_::LinearRandomMessageContext *this, int a2)
{
  _DWORD v3[2];

  v3[0] = 0;
  v3[1] = a2;
  return std::uniform_int_distribution<unsigned int>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((uint64_t)this + 8, v3);
}

uint64_t std::__independent_bits_engine<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>,unsigned int>::__eval(uint64_t a1)
{
  unint64_t v2;
  unsigned int v3;
  unint64_t v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t result;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;
  unsigned int v12;
  int v13;
  unint64_t v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  unsigned int *v20;
  unsigned int v21;
  unint64_t v22;
  int v23;
  unsigned int v24;
  char v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  int v33;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    result = 0;
    v14 = *(_QWORD *)(a1 + 24);
    if (!v14)
      return result;
    goto LABEL_20;
  }
  v3 = *(_DWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_DWORD *)(a1 + 48);
  v6 = **(_DWORD **)a1;
  if (v4 >= 0x20)
  {
    v15 = 0;
    do
    {
      v16 = v6 / 0xADC8;
      v17 = 48271 * (v6 % 0xADC8);
      v16 *= 3399;
      v11 = v17 >= v16;
      v18 = v17 - v16;
      if (v11)
        v19 = 0;
      else
        v19 = 0x7FFFFFFF;
      v6 = v19 + v18;
    }
    while (v6 - 1 >= v3 || ++v15 != v2);
    result = (v6 - 1) & v5;
  }
  else
  {
    v7 = 0;
    LODWORD(result) = 0;
    while (1)
    {
      v9 = v6 / 0xADC8;
      v10 = 48271 * (v6 % 0xADC8);
      v9 *= 3399;
      v11 = v10 >= v9;
      v12 = v10 - v9;
      if (v11)
        v13 = 0;
      else
        v13 = 0x7FFFFFFF;
      v6 = v13 + v12;
      if (v6 - 1 < v3)
      {
        result = ((v6 - 1) & v5) + ((_DWORD)result << v4);
        if (++v7 == v2)
          break;
      }
    }
  }
  **(_DWORD **)a1 = v6;
  v14 = *(_QWORD *)(a1 + 24);
  if (v2 < v14)
  {
LABEL_20:
    v20 = *(unsigned int **)a1;
    v21 = *(_DWORD *)(a1 + 44);
    v22 = *(_QWORD *)(a1 + 16);
    v23 = *(_DWORD *)(a1 + 52);
    v24 = *v20;
    if (v22 >= 0x1F)
    {
      do
      {
        v30 = v24 / 0xADC8;
        v31 = 48271 * (v24 % 0xADC8);
        v30 *= 3399;
        v11 = v31 >= v30;
        v32 = v31 - v30;
        if (v11)
          v33 = 0;
        else
          v33 = 0x7FFFFFFF;
        v24 = v33 + v32;
      }
      while (v24 - 1 >= v21 || ++v2 != v14);
      result = (v24 - 1) & v23;
      *v20 = v24;
    }
    else
    {
      v25 = v22 + 1;
      while (1)
      {
        v26 = v24 / 0xADC8;
        v27 = 48271 * (v24 % 0xADC8);
        v26 *= 3399;
        v11 = v27 >= v26;
        v28 = v27 - v26;
        if (v11)
          v29 = 0;
        else
          v29 = 0x7FFFFFFF;
        v24 = v29 + v28;
        if (v24 - 1 < v21)
        {
          result = ((v24 - 1) & v23) + ((_DWORD)result << v25);
          if (++v2 == v14)
            break;
        }
      }
      *v20 = v24;
    }
  }
  return result;
}

uint64_t std::uniform_int_distribution<unsigned int>::operator()<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;
  int v3;
  unsigned int v4;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  int v15;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  __int128 v21;
  int64x2_t v22;
  __int128 v23;

  v2 = a2[1];
  v3 = v2 - *a2;
  if ((_DWORD)v2 == *a2)
    return v2;
  v4 = v3 + 1;
  if (v3 == -1)
  {
    v20 = a1;
    v21 = xmmword_20E61E1D0;
    v22 = vdupq_n_s64(2uLL);
    v23 = xmmword_20E61E1E0;
    return std::__independent_bits_engine<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>,unsigned int>::__eval((uint64_t)&v20);
  }
  v6 = __clz(v4);
  v7 = 31;
  if (((v4 << v6) & 0x7FFFFFFF) != 0)
    v7 = 32;
  v8 = v7 - v6;
  v22.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v23 = 0xAAAAAAAAAAAAAAAALL;
  v20 = a1;
  *(_QWORD *)&v21 = v7 - v6;
  v9 = (unint64_t)(v7 - v6) >= 0x1E;
  v10 = v7 - v6 - 30;
  if (!v9)
    v10 = v8;
  v11 = v10 != 0;
  if (v8 <= 0x1D)
    v12 = v11;
  else
    v12 = v11 + 1;
  v13 = v8 / v12;
  *((_QWORD *)&v21 + 1) = v13;
  v22.i64[0] = v12;
  v14 = (-1 << v13) & 0x7FFFFFFE;
  if (v13 >= 0x20)
    v14 = 0;
  LODWORD(v23) = v14;
  if (v14 / v12 < (v14 ^ 0x7FFFFFFE))
  {
    v13 = v8 / ++v12;
    *((_QWORD *)&v21 + 1) = v13;
    v22.i64[0] = v12;
    if (v13 > 0x1F)
    {
      LODWORD(v23) = 0;
      v22.i64[1] = v12 - (v8 % v12);
      v13 = 32;
      goto LABEL_20;
    }
    LODWORD(v23) = (-1 << (v8 / v12)) & 0x7FFFFFFE;
  }
  v22.i64[1] = v12 - v8 % v12;
  if (v13 > 0x1E)
  {
LABEL_20:
    v15 = 0;
    DWORD1(v23) = 0;
    goto LABEL_21;
  }
  DWORD1(v23) = (-2 << v13) & 0x7FFFFFFE;
  v15 = 1;
LABEL_21:
  v17 = 0xFFFFFFFF >> -(char)v13;
  if (!v13)
    v17 = 0;
  v18 = 0xFFFFFFFF >> ~(_BYTE)v13;
  if (!v15)
    v18 = -1;
  *((_QWORD *)&v23 + 1) = __PAIR64__(v18, v17);
  do
    v19 = std::__independent_bits_engine<std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>,unsigned int>::__eval((uint64_t)&v20);
  while (v19 >= v4);
  return *a2 + v19;
}

void `anonymous namespace'::AlwaysZeroRandomMessageContext::generateBytes(_anonymous_namespace_::AlwaysZeroRandomMessageContext *this, void *a2, size_t a3)
{
  bzero(a2, a3);
}

uint64_t `anonymous namespace'::AlwaysZeroRandomMessageContext::generateLength(_anonymous_namespace_::AlwaysZeroRandomMessageContext *this)
{
  return 0;
}

uint64_t `anonymous namespace'::AlwaysZeroRandomMessageContext::generateUnsigned(_anonymous_namespace_::AlwaysZeroRandomMessageContext *this)
{
  return 0;
}

uint64_t `anonymous namespace'::Len1RandomMessageContext::generateLength(_anonymous_namespace_::Len1RandomMessageContext *this)
{
  return 1;
}

BOOL qmi::isInternalError(int a1)
{
  return (a1 & 0xFFFF0000) != 0;
}

const char *qmi::asLongString(int a1)
{
  const char *result;

  result = "QMI Control Service";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = "QMI Wireless Data Service";
      break;
    case 2:
      result = "QMI Device Management Service";
      break;
    case 3:
      result = "QMI Network Access Service";
      break;
    case 4:
      result = "QMI Qos Service";
      break;
    case 5:
      result = "QMI Wireless Messaging Service";
      break;
    case 6:
      result = "QMI Position Determination Service";
      break;
    case 8:
      result = "QMI Access Terminal Service";
      break;
    case 9:
      result = "QMI Voice Service";
      break;
    case 10:
      result = "QMI Card App Toolkit";
      break;
    case 11:
      result = "QMI User Identity Module";
      break;
    case 12:
      result = "QMI Phonebook Manager Service";
      break;
    case 26:
      result = "QMI Wireless Data Administrative Service";
      break;
    case 34:
      result = "QMI Coexistence Service";
      break;
    case 36:
      result = "QMI Persistent Device Service";
      break;
    case 40:
      result = "QMI 5WI 787 Service";
      break;
    case 42:
      result = "QMI Data System Determination";
      break;
    case 43:
      result = "QMI Subsystem Control";
      break;
    case 44:
      result = "QMI Modem File System Extended Service";
      break;
    case 48:
      result = "QMI Data Filter Service";
      break;
    case 82:
      result = "QMI Media Service Extension";
      break;
    case 225:
      result = "QMI Audio Service";
      break;
    case 226:
      result = "QMI Board Support Package Service";
      break;
    case 227:
      result = "QMI Carrier IQ Service";
      break;
    case 228:
      result = "QMI Apple Wireless Diagnostics";
      break;
    case 229:
      result = "QMI Vinyl Service";
      break;
    case 230:
      result = "QMI Mav 5WI Service";
      break;
    case 231:
      result = "QMI Enhnaced Link Quality Metric Service";
      break;
    case 232:
      result = "QMI Mav P2P Service";
      break;
    case 233:
      result = "QMI BSP APPS Service";
      break;
    case 234:
      result = "QMI Stewie Service";
      break;
    default:
      result = "Unknown Service";
      break;
  }
  return result;
}

const char *qmi::asShortString(int a1)
{
  const char *result;

  result = "CTL";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = "WDS";
      break;
    case 2:
      result = "DMS";
      break;
    case 3:
      result = "NAS";
      break;
    case 4:
      result = "QOS";
      break;
    case 5:
      result = "WMS";
      break;
    case 6:
      result = "PDS";
      break;
    case 8:
      result = "AT";
      break;
    case 9:
      result = "VS";
      break;
    case 10:
      result = "CAT";
      break;
    case 11:
      result = "UIM";
      break;
    case 12:
      result = "PBM";
      break;
    case 26:
      result = "WDA";
      break;
    case 34:
      result = "COEX";
      break;
    case 36:
      result = "PDC";
      break;
    case 40:
      result = "787";
      break;
    case 42:
      result = "DSD";
      break;
    case 43:
      result = "SSCTL";
      break;
    case 44:
      result = "MFSE";
      break;
    case 48:
      result = "DFS";
      break;
    case 82:
      result = "MS";
      break;
    case 225:
      result = "AUDIO";
      break;
    case 226:
      result = "BSP";
      break;
    case 227:
      result = "CIQ";
      break;
    case 228:
      result = "AWD";
      break;
    case 229:
      result = "VINYL";
      break;
    case 230:
      result = "MAVIMS";
      break;
    case 231:
      result = "ELQM";
      break;
    case 232:
      result = "P2P";
      break;
    case 233:
      result = "APPS";
      break;
    case 234:
      result = "SFT";
      break;
    default:
      result = "???";
      break;
  }
  return result;
}

uint64_t qmi::serviceTypeFromString(uint64_t a1)
{
  int v2;
  uint64_t v3;
  _BYTE *v4;
  _WORD *v14;

  v2 = *(char *)(a1 + 23);
  if (v2 >= 0)
    v3 = *(unsigned __int8 *)(a1 + 23);
  else
    v3 = *(_QWORD *)(a1 + 8);
  if (v3 == 2)
  {
    if (v2 >= 0)
      v14 = (_WORD *)a1;
    else
      v14 = *(_WORD **)a1;
    if (!memcmp(v14, "AT", 2uLL))
      return 8;
    if (*v14 == 21334)
      return 9;
  }
  else if (v3 == 3)
  {
    if (v2 >= 0)
      v4 = (_BYTE *)a1;
    else
      v4 = *(_BYTE **)a1;
    if (*(_WORD *)v4 == 21571 && v4[2] == 76)
      return 0;
    if (*(_WORD *)v4 == 17495 && v4[2] == 83)
      return 1;
    if (*(_WORD *)v4 == 19780 && v4[2] == 83)
      return 2;
    if (*(_WORD *)v4 == 16718 && v4[2] == 83)
      return 3;
    if (*(_WORD *)v4 == 20305 && v4[2] == 83)
      return 4;
    if (*(_WORD *)v4 == 19799 && v4[2] == 83)
      return 5;
    if (*(_WORD *)v4 == 17488 && v4[2] == 83)
      return 6;
    if (!memcmp(v4, "CAT", 3uLL))
      return 10;
    if (*(_WORD *)v4 == 18773 && v4[2] == 77)
      return 11;
  }
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "PBM"))
    return 12;
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "AUDIO"))
    return 225;
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "BSP"))
    return 226;
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "CIQ"))
    return 227;
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "AWD"))
    return 228;
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "COEX"))
    return 34;
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "DSD"))
    return 42;
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "MFSE"))
    return 44;
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "VINYL"))
    return 229;
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "MAVIMS"))
    return 230;
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "ELQM"))
    return 231;
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "PDC"))
    return 36;
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "P2P"))
    return 232;
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "MS"))
    return 82;
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "WDA"))
    return 26;
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "APPS"))
    return 233;
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "DFS"))
    return 48;
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "SSCTL"))
    return 43;
  if (std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)a1, "SFT"))
    return -22;
  else
    return -1;
}

BOOL std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(const void **a1, char *__s)
{
  int v4;
  size_t v5;
  const void *v6;

  v4 = *((char *)a1 + 23);
  if (v4 >= 0)
    v5 = *((unsigned __int8 *)a1 + 23);
  else
    v5 = (size_t)a1[1];
  if (v5 != strlen(__s))
    return 0;
  if (v4 >= 0)
    v6 = a1;
  else
    v6 = *a1;
  return memcmp(v6, __s, v5) == 0;
}

void qmi::RandomMessageReporter::~RandomMessageReporter(qmi::RandomMessageReporter *this)
{
  void *v2;

  *(_QWORD *)this = off_24C9752E0;
  v2 = (void *)*((_QWORD *)this + 1);
  if (v2)
  {
    *((_QWORD *)this + 2) = v2;
    operator delete(v2);
  }
}

BOOL qmi::RandomMessageReporter::verifyMessageId(std::string **this, int a2, int a3)
{
  std::string *v6;
  std::string::size_type size;
  _BYTE *v8;
  unsigned __int16 v9;
  unsigned int v10;
  char v11;
  char v12;
  std::string *v13;
  __int128 v14;
  std::string *v15;
  __int128 v16;
  unsigned __int8 v17;
  std::string *p_p;
  std::string::size_type v19;
  _BYTE *v20;
  unsigned __int16 v21;
  unsigned int v22;
  char v23;
  char v24;
  std::string *v25;
  std::string::size_type v26;
  std::string *v27;
  __int128 v28;
  std::string __p;
  std::string v31;
  std::string v32;
  void *v33[2];
  std::string::size_type v34;
  std::string v35;

  if (a2 != a3)
  {
    memset(&v31, 0, sizeof(v31));
    std::string::append(&v31, 4uLL, 48);
    if (a2)
    {
      v6 = &v31;
      if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v6 = (std::string *)v31.__r_.__value_.__r.__words[0];
      size = HIBYTE(v31.__r_.__value_.__r.__words[2]);
      if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        size = v31.__r_.__value_.__l.__size_;
      v8 = (char *)v6 + size - 1;
      v9 = a2;
      do
      {
        v10 = v9;
        if ((v9 & 0xFu) >= 0xA)
          v11 = 87;
        else
          v11 = 48;
        *v8 = v11 + (v9 & 0xF);
        if (v9 >= 0xA0u)
          v12 = 87;
        else
          v12 = 48;
        *(v8 - 1) = v12 + (v9 >> 4);
        v9 = HIBYTE(v9);
        v8 -= 2;
      }
      while (v10 >= 0x100);
    }
    v13 = std::string::insert(&v31, 0, "QMI Message Id does not match: actual=0x", 0x28uLL);
    v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v32.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v32.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    v15 = std::string::append(&v32, ", expected=0x", 0xDuLL);
    v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    v35.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v35.__r_.__value_.__l.__data_ = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    memset(&__p, 0, sizeof(__p));
    std::string::append(&__p, 4uLL, 48);
    v17 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    v19 = __p.__r_.__value_.__l.__size_;
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if (a3)
    {
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        p_p = &__p;
        v19 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      v20 = (char *)p_p + v19 - 1;
      v21 = a3;
      do
      {
        v22 = v21;
        if ((v21 & 0xFu) >= 0xA)
          v23 = 87;
        else
          v23 = 48;
        *v20 = v23 + (v21 & 0xF);
        if (v21 >= 0xA0u)
          v24 = 87;
        else
          v24 = 48;
        *(v20 - 1) = v24 + (v21 >> 4);
        v21 = HIBYTE(v21);
        v20 -= 2;
      }
      while (v22 >= 0x100);
      v17 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      v19 = __p.__r_.__value_.__l.__size_;
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((v17 & 0x80u) == 0)
      v25 = &__p;
    else
      v25 = p_p;
    if ((v17 & 0x80u) == 0)
      v26 = v17;
    else
      v26 = v19;
    v27 = std::string::append(&v35, (const std::string::value_type *)v25, v26);
    v28 = *(_OWORD *)&v27->__r_.__value_.__l.__data_;
    v34 = v27->__r_.__value_.__r.__words[2];
    *(_OWORD *)v33 = v28;
    v27->__r_.__value_.__l.__size_ = 0;
    v27->__r_.__value_.__r.__words[2] = 0;
    v27->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v35.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_35:
        if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_36;
        goto LABEL_42;
      }
    }
    else if ((SHIBYTE(v35.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_35;
    }
    operator delete(v35.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v32.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_36:
      if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_37;
LABEL_43:
      operator delete(v31.__r_.__value_.__l.__data_);
LABEL_37:
      memset(&v35, 170, sizeof(v35));
      ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v35);
      ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v35, v33);
      if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v35.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v34) & 0x80000000) == 0)
          return a2 != a3;
      }
      else if ((SHIBYTE(v34) & 0x80000000) == 0)
      {
        return a2 != a3;
      }
      operator delete(v33[0]);
      return a2 != a3;
    }
LABEL_42:
    operator delete(v32.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_37;
    goto LABEL_43;
  }
  return a2 != a3;
}

void sub_20E606EA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;

  if (*(char *)(v33 - 41) < 0)
    operator delete(*(void **)(v33 - 64));
  if (a33 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void qmi::RandomMessageReporter::reportMismatch(std::string **a1, uint64_t a2)
{
  std::string __p;

  memset(&__p, 170, sizeof(__p));
  ctu::join<std::__wrap_iter<char const**>>(a1[1], a1[2], "::", 2uLL, &__p);
  ((void (*)(std::string **, std::string *, uint64_t))(*a1)->__r_.__value_.__r.__words[2])(a1, &__p, a2);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20E606FE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL qmi::RandomMessageReporter::verifyTlvId(std::string **this, unsigned int a2, unsigned int a3)
{
  std::string *v6;
  std::string::size_type size;
  char *v8;
  char v9;
  char v10;
  std::string *v11;
  __int128 v12;
  std::string *v13;
  __int128 v14;
  unsigned __int8 v15;
  std::string *p_p;
  std::string::size_type v17;
  char *v18;
  char v19;
  char v20;
  std::string *v21;
  std::string::size_type v22;
  std::string *v23;
  __int128 v24;
  std::string __p;
  std::string v27;
  std::string v28;
  void *v29[2];
  std::string::size_type v30;
  std::string v31;

  if (a2 != a3)
  {
    memset(&v27, 0, sizeof(v27));
    std::string::append(&v27, 2uLL, 48);
    if (a2)
    {
      v6 = &v27;
      if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v6 = (std::string *)v27.__r_.__value_.__r.__words[0];
      size = HIBYTE(v27.__r_.__value_.__r.__words[2]);
      if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        size = v27.__r_.__value_.__l.__size_;
      v8 = (char *)v6 + size;
      if ((a2 & 0xF) >= 0xA)
        v9 = 87;
      else
        v9 = 48;
      *(v8 - 1) = v9 + (a2 & 0xF);
      if (a2 >= 0xA0)
        v10 = 87;
      else
        v10 = 48;
      *(v8 - 2) = v10 + (a2 >> 4);
    }
    v11 = std::string::insert(&v27, 0, "TLV Id does not match: actual=0x", 0x20uLL);
    v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
    v28.__r_.__value_.__r.__words[2] = v11->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v12;
    v11->__r_.__value_.__l.__size_ = 0;
    v11->__r_.__value_.__r.__words[2] = 0;
    v11->__r_.__value_.__r.__words[0] = 0;
    v13 = std::string::append(&v28, ", expected=0x", 0xDuLL);
    v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v31.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    memset(&__p, 0, sizeof(__p));
    std::string::append(&__p, 2uLL, 48);
    v15 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    v17 = __p.__r_.__value_.__l.__size_;
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if (a3)
    {
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        p_p = &__p;
        v17 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      v18 = (char *)p_p + v17;
      if ((a3 & 0xF) >= 0xA)
        v19 = 87;
      else
        v19 = 48;
      *(v18 - 1) = v19 + (a3 & 0xF);
      if (a3 >= 0xA0)
        v20 = 87;
      else
        v20 = 48;
      *(v18 - 2) = v20 + (a3 >> 4);
      v15 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      v17 = __p.__r_.__value_.__l.__size_;
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((v15 & 0x80u) == 0)
      v21 = &__p;
    else
      v21 = p_p;
    if ((v15 & 0x80u) == 0)
      v22 = v15;
    else
      v22 = v17;
    v23 = std::string::append(&v31, (const std::string::value_type *)v21, v22);
    v24 = *(_OWORD *)&v23->__r_.__value_.__l.__data_;
    v30 = v23->__r_.__value_.__r.__words[2];
    *(_OWORD *)v29 = v24;
    v23->__r_.__value_.__l.__size_ = 0;
    v23->__r_.__value_.__r.__words[2] = 0;
    v23->__r_.__value_.__r.__words[0] = 0;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(__p.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_32:
        if ((SHIBYTE(v28.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_33;
        goto LABEL_39;
      }
    }
    else if ((SHIBYTE(v31.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_32;
    }
    operator delete(v31.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v28.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_33:
      if ((SHIBYTE(v27.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        goto LABEL_34;
LABEL_40:
      operator delete(v27.__r_.__value_.__l.__data_);
LABEL_34:
      memset(&v31, 170, sizeof(v31));
      ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v31);
      ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v31, v29);
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v31.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v30) & 0x80000000) == 0)
          return a2 != a3;
      }
      else if ((SHIBYTE(v30) & 0x80000000) == 0)
      {
        return a2 != a3;
      }
      operator delete(v29[0]);
      return a2 != a3;
    }
LABEL_39:
    operator delete(v28.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v27.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_34;
    goto LABEL_40;
  }
  return a2 != a3;
}

void sub_20E607274(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;

  if (*(char *)(v33 - 41) < 0)
    operator delete(*(void **)(v33 - 64));
  if (a33 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void qmi::RandomMessageReporter::reportTlvMissing(std::string **this, unsigned int a2)
{
  std::string *v4;
  std::string::size_type size;
  char *v6;
  char v7;
  char v8;
  std::string *v9;
  __int128 v10;
  std::string *v11;
  __int128 v12;
  std::string v13;
  void *__p[2];
  std::string::size_type v15;
  std::string v16;

  memset(&v13, 0, sizeof(v13));
  std::string::append(&v13, 2uLL, 48);
  if (a2)
  {
    v4 = &v13;
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v4 = (std::string *)v13.__r_.__value_.__r.__words[0];
    size = HIBYTE(v13.__r_.__value_.__r.__words[2]);
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = v13.__r_.__value_.__l.__size_;
    v6 = (char *)v4 + size;
    if ((a2 & 0xF) >= 0xA)
      v7 = 87;
    else
      v7 = 48;
    *(v6 - 1) = v7 + (a2 & 0xF);
    if (a2 >= 0xA0)
      v8 = 87;
    else
      v8 = 48;
    *(v6 - 2) = v8 + (a2 >> 4);
  }
  v9 = std::string::insert(&v13, 0, "TLV 0x", 6uLL);
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v16.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  v11 = std::string::append(&v16, " is not present but was expected", 0x20uLL);
  v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v15 = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v16.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_15;
  }
  else if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_15;
  }
  operator delete(v13.__r_.__value_.__l.__data_);
LABEL_15:
  memset(&v16, 170, sizeof(v16));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v16);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v16, __p);
  if ((SHIBYTE(v16.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v15) & 0x80000000) == 0)
      return;
LABEL_21:
    operator delete(__p[0]);
    return;
  }
  operator delete(v16.__r_.__value_.__l.__data_);
  if (SHIBYTE(v15) < 0)
    goto LABEL_21;
}

void sub_20E6074BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;

  if (*(char *)(v21 - 25) < 0)
    operator delete(*(void **)(v21 - 48));
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void qmi::RandomMessageReporter::reportParseUnderrun(std::string **this)
{
  void *v2;
  __int128 v3;
  std::string __p;

  v2 = operator new(0x48uLL);
  v3 = xmmword_20E61E8B0;
  strcpy((char *)v2, "Parse underrun; expected end of message but more bytes still remain");
  memset(&__p, 170, sizeof(__p));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &__p);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &__p, &v2);
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v3) & 0x80000000) == 0)
      return;
LABEL_5:
    operator delete(v2);
    return;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v3) < 0)
    goto LABEL_5;
}

void sub_20E6075FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
  {
    operator delete(__p);
    if ((a14 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a9);
  _Unwind_Resume(exception_object);
}

void sub_20E60763C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

void qmi::RandomMessageReporter::reportTlvParseFailure(std::string **this, unsigned int a2)
{
  std::string *v4;
  std::string::size_type size;
  char *v6;
  char v7;
  char v8;
  std::string *v9;
  __int128 v10;
  std::string *v11;
  __int128 v12;
  std::string v13;
  void *__p[2];
  std::string::size_type v15;
  std::string v16;

  memset(&v13, 0, sizeof(v13));
  std::string::append(&v13, 2uLL, 48);
  if (a2)
  {
    v4 = &v13;
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v4 = (std::string *)v13.__r_.__value_.__r.__words[0];
    size = HIBYTE(v13.__r_.__value_.__r.__words[2]);
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = v13.__r_.__value_.__l.__size_;
    v6 = (char *)v4 + size;
    if ((a2 & 0xF) >= 0xA)
      v7 = 87;
    else
      v7 = 48;
    *(v6 - 1) = v7 + (a2 & 0xF);
    if (a2 >= 0xA0)
      v8 = 87;
    else
      v8 = 48;
    *(v6 - 2) = v8 + (a2 >> 4);
  }
  v9 = std::string::insert(&v13, 0, "TLV 0x", 6uLL);
  v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  v16.__r_.__value_.__r.__words[2] = v9->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v10;
  v9->__r_.__value_.__l.__size_ = 0;
  v9->__r_.__value_.__r.__words[2] = 0;
  v9->__r_.__value_.__r.__words[0] = 0;
  v11 = std::string::append(&v16, " failed to parse", 0x10uLL);
  v12 = *(_OWORD *)&v11->__r_.__value_.__l.__data_;
  v15 = v11->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v12;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v16.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_15;
  }
  else if ((SHIBYTE(v13.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_15;
  }
  operator delete(v13.__r_.__value_.__l.__data_);
LABEL_15:
  memset(&v16, 170, sizeof(v16));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v16);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v16, __p);
  if ((SHIBYTE(v16.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((SHIBYTE(v15) & 0x80000000) == 0)
      return;
LABEL_21:
    operator delete(__p[0]);
    return;
  }
  operator delete(v16.__r_.__value_.__l.__data_);
  if (SHIBYTE(v15) < 0)
    goto LABEL_21;
}

void sub_20E6077DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;

  if (*(char *)(v21 - 25) < 0)
    operator delete(*(void **)(v21 - 48));
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
  std::__throw_out_of_range[abi:ne180100]("basic_string");
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24C974EE0, MEMORY[0x24BEDAB00]);
}

void sub_20E607890(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  return result;
}

std::string *ctu::join<std::__wrap_iter<char const**>>@<X0>(std::string *result@<X0>, std::string *a2@<X1>, const void *a3@<X2>, size_t a4@<X3>, std::string *a5@<X8>)
{
  std::string *v8;
  uint64_t v10;
  const char **m;
  const char *v12;
  size_t v13;
  const char **j;
  const char *v15;
  size_t v16;
  std::string::value_type *v17;
  std::string::size_type v18;
  size_t v19;
  unint64_t v20;
  const char **i;
  const char *v22;
  size_t v23;
  void *v24;
  const char **k;
  const char *v26;
  size_t v27;
  std::string::value_type __s[8];
  size_t v29;
  int64_t v30;

  a5->__r_.__value_.__r.__words[0] = 0;
  a5->__r_.__value_.__l.__size_ = 0;
  a5->__r_.__value_.__r.__words[2] = 0;
  if (result != a2)
  {
    v8 = result;
    result = std::string::__assign_external(a5, result->__r_.__value_.__l.__data_);
    v10 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17)
      v10 = a4 | 7;
    if (a3)
    {
      if (a4 < 0x7FFFFFFFFFFFFFF8)
      {
        if (a4 >= 0x17)
        {
          v19 = v10 + 1;
          v20 = (v10 + 1) | 0x8000000000000000;
          for (i = (const char **)&v8->__r_.__value_.__l.__size_; i != (const char **)a2; ++i)
          {
            v24 = operator new(v19);
            v29 = a4;
            v30 = v20;
            *(_QWORD *)__s = v24;
            memmove(v24, a3, a4);
            *((_BYTE *)v24 + a4) = 0;
            std::string::append(a5, (const std::string::value_type *)v24, a4);
            if (SHIBYTE(v30) < 0)
              operator delete(*(void **)__s);
            v22 = *i;
            v23 = strlen(v22);
            result = std::string::append(a5, v22, v23);
          }
        }
        else if (a4)
        {
          for (j = (const char **)&v8->__r_.__value_.__l.__size_; j != (const char **)a2; ++j)
          {
            HIBYTE(v30) = a4;
            memmove(__s, a3, a4);
            __s[a4] = 0;
            if (v30 >= 0)
              v17 = __s;
            else
              v17 = *(std::string::value_type **)__s;
            if (v30 >= 0)
              v18 = HIBYTE(v30);
            else
              v18 = v29;
            std::string::append(a5, v17, v18);
            if (SHIBYTE(v30) < 0)
              operator delete(*(void **)__s);
            v15 = *j;
            v16 = strlen(v15);
            result = std::string::append(a5, v15, v16);
          }
        }
        else
        {
          for (k = (const char **)&v8->__r_.__value_.__l.__size_; k != (const char **)a2; ++k)
          {
            HIBYTE(v30) = 0;
            __s[0] = 0;
            std::string::append(a5, __s, 0);
            if (SHIBYTE(v30) < 0)
              operator delete(*(void **)__s);
            v26 = *k;
            v27 = strlen(v26);
            result = std::string::append(a5, v26, v27);
          }
        }
      }
      else if (&v8->__r_.__value_.__r.__words[1] != (std::string::size_type *)a2)
      {
        std::string::__throw_length_error[abi:ne180100]();
      }
    }
    else
    {
      for (m = (const char **)&v8->__r_.__value_.__l.__size_; m != (const char **)a2; ++m)
      {
        *(_QWORD *)__s = 0;
        v29 = 0;
        v30 = 0;
        std::string::append(a5, __s, 0);
        if (SHIBYTE(v30) < 0)
          operator delete(*(void **)__s);
        v12 = *m;
        v13 = strlen(v12);
        result = std::string::append(a5, v12, v13);
      }
    }
  }
  return result;
}

void sub_20E607B34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (*(char *)(v15 + 23) < 0)
  {
    operator delete(*(void **)v15);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  unint64_t v6;
  void *v7;
  unint64_t v8;
  std::string *v9;
  unint64_t v10;
  size_t v11;
  std::string::size_type v12;
  uint64_t v13;

  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    v10 = this->__r_.__value_.__r.__words[2];
    v8 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (__n > v8)
    {
      v11 = 0x7FFFFFFFFFFFFFF7;
      if (0x7FFFFFFFFFFFFFF7 - (v10 & 0x7FFFFFFFFFFFFFFFLL) >= __n - v8)
      {
        v9 = (std::string *)this->__r_.__value_.__r.__words[0];
        if (v8 > 0x3FFFFFFFFFFFFFF2)
        {
LABEL_15:
          v7 = operator new(v11);
          memcpy(v7, __s, __n);
          if (v8 != 22)
            operator delete(v9);
          this->__r_.__value_.__r.__words[2] = v11 | 0x8000000000000000;
          this->__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
LABEL_23:
          this->__r_.__value_.__l.__size_ = __n;
          goto LABEL_24;
        }
LABEL_8:
        v12 = 2 * v8;
        if (__n > 2 * v8)
          v12 = __n;
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
      std::string::__throw_length_error[abi:ne180100]();
    }
    v6 = HIBYTE(v10);
    v7 = (void *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    v7 = this;
    if (__n > 0x16)
    {
      if (__n - 0x7FFFFFFFFFFFFFF7 >= 0x800000000000001FLL)
      {
        v8 = 22;
        v9 = this;
        goto LABEL_8;
      }
      goto LABEL_25;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0)
    goto LABEL_23;
  *((_BYTE *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
LABEL_24:
  *((_BYTE *)v7 + __n) = 0;
  return this;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return std::string::__assign_external(this, __s, v4);
}

_DWORD *sInitializeAtcsQmiMessageDefinitions(uint64_t **a1)
{
  unsigned __int8 v2;
  MessageCollection_QMI_CTL_Printers_h *v4;
  uint64_t *v5;
  char v6;
  char v7;
  __int16 v8;
  char v9;
  char v10;

  v2 = atomic_load((unsigned __int8 *)&_MergedGlobals);
  if ((v2 & 1) == 0)
  {
    v4 = (MessageCollection_QMI_CTL_Printers_h *)__cxa_guard_acquire(&_MergedGlobals);
    if ((_DWORD)v4)
    {
      MessageCollection_QMI_CTL_Printers_h::MessageCollection_QMI_CTL_Printers_h(v4);
      __cxa_atexit((void (*)(void *))MessageCollection_QMI_CTL_Printers_h::~MessageCollection_QMI_CTL_Printers_h, &qword_253D0B0A0, &dword_20E603000);
      __cxa_guard_release(&_MergedGlobals);
    }
  }
  v7 = -86;
  v10 = -86;
  v6 = byte_253D0B0B0;
  v8 = word_253D0B0B2;
  v9 = byte_253D0B0B4;
  v5 = &qword_253D0B0A0;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v6, &v5);
  v7 = -86;
  v10 = -86;
  v6 = byte_253D0B0E8;
  v8 = word_253D0B0EA;
  v9 = byte_253D0B0EC;
  v5 = &qword_253D0B0D8;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v6, &v5);
  v7 = -86;
  v10 = -86;
  v6 = byte_253D0B110;
  v8 = word_253D0B112;
  v9 = byte_253D0B114;
  v5 = &qword_253D0B100;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v6, &v5);
  v7 = -86;
  v10 = -86;
  v6 = byte_253D0B148;
  v8 = word_253D0B14A;
  v9 = byte_253D0B14C;
  v5 = &qword_253D0B138;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v6, &v5);
  v7 = -86;
  v10 = -86;
  v6 = byte_253D0B170;
  v8 = word_253D0B172;
  v9 = byte_253D0B174;
  v5 = &qword_253D0B160;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v6, &v5);
  v7 = -86;
  v10 = -86;
  v6 = byte_253D0B198;
  v8 = word_253D0B19A;
  v9 = byte_253D0B19C;
  v5 = &qword_253D0B188;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v6, &v5);
  v7 = -86;
  v10 = -86;
  v6 = byte_253D0B1D0;
  v8 = word_253D0B1D2;
  v9 = byte_253D0B1D4;
  v5 = &qword_253D0B1C0;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v6, &v5);
  v7 = -86;
  v10 = -86;
  v6 = byte_253D0B1F8;
  v8 = word_253D0B1FA;
  v9 = byte_253D0B1FC;
  v5 = &qword_253D0B1E8;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v6, &v5);
  v7 = -86;
  v10 = -86;
  v6 = byte_253D0B230;
  v8 = word_253D0B232;
  v9 = byte_253D0B234;
  v5 = &qword_253D0B220;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v6, &v5);
  v7 = -86;
  v10 = -86;
  v6 = byte_253D0B258;
  v8 = word_253D0B25A;
  v9 = byte_253D0B25C;
  v5 = &qword_253D0B248;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v6, &v5);
  v7 = -86;
  v10 = -86;
  v6 = byte_253D0B290;
  v8 = word_253D0B292;
  v9 = byte_253D0B294;
  v5 = &qword_253D0B280;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v6, &v5);
  v7 = -86;
  v10 = -86;
  v6 = byte_253D0B2C8;
  v8 = word_253D0B2CA;
  v9 = byte_253D0B2CC;
  v5 = &qword_253D0B2B8;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v6, &v5);
  v7 = -86;
  v10 = -86;
  v6 = byte_253D0B2F0;
  v8 = word_253D0B2F2;
  v9 = byte_253D0B2F4;
  v5 = &qword_253D0B2E0;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v6, &v5);
  v7 = -86;
  v10 = -86;
  v6 = byte_253D0B318;
  v8 = word_253D0B31A;
  v9 = byte_253D0B31C;
  v5 = &qword_253D0B308;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v6, &v5);
  v7 = -86;
  v10 = -86;
  v6 = byte_253D0B330;
  v8 = word_253D0B332;
  v9 = byte_253D0B334;
  v5 = &qword_253D0B320;
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v6, &v5);
  v7 = -86;
  v10 = -86;
  v6 = byte_253D0B348;
  v8 = word_253D0B34A;
  v9 = byte_253D0B34C;
  v5 = &qword_253D0B338;
  return std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(a1, (uint64_t)&v6, &v5);
}

void MessageCollection_QMI_CTL_Printers_h::~MessageCollection_QMI_CTL_Printers_h(MessageCollection_QMI_CTL_Printers_h *this)
{
  *((_QWORD *)this + 83) = &off_24C975B58;
  *((_QWORD *)this + 72) = &off_24C975B28;
  *((_QWORD *)this + 67) = &off_24C975AF8;
  *((_QWORD *)this + 60) = &off_24C975AC8;
  *((_QWORD *)this + 53) = &off_24C975A98;
  *((_QWORD *)this + 48) = &off_24C975A68;
  *((_QWORD *)this + 41) = &off_24C975A38;
  *((_QWORD *)this + 36) = &off_24C975A08;
  *((_QWORD *)this + 29) = &off_24C9759D8;
  *((_QWORD *)this + 24) = &off_24C9759A8;
  *((_QWORD *)this + 19) = &off_24C975978;
  *((_QWORD *)this + 12) = &off_24C975948;
  *((_QWORD *)this + 7) = &off_24C975918;
  *(_QWORD *)this = &off_24C9758E8;
}

void MessageCollection_QMI_CTL_Printers_h::MessageCollection_QMI_CTL_Printers_h(MessageCollection_QMI_CTL_Printers_h *this)
{
  byte_253D0B0B0 = 0;
  word_253D0B0B2 = 41;
  byte_253D0B0B4 = 0;
  qword_253D0B0A0 = (uint64_t)&off_24C9758E8;
  *(_QWORD *)algn_253D0B0A8 = "ctl::ConfigPowerSaveMode::Request";
  qword_253D0B0B8 = (uint64_t)off_24C975360;
  unk_253D0B0C0 = "ctl::tlv::PowerSaveDescriptor";
  qword_253D0B0C8 = (uint64_t)off_24C9753A8;
  unk_253D0B0D0 = "ctl::tlv::IndicationSet";
  byte_253D0B0E8 = 0;
  word_253D0B0EA = 41;
  byte_253D0B0EC = 1;
  qword_253D0B0D8 = (uint64_t)&off_24C975918;
  unk_253D0B0E0 = "ctl::ConfigPowerSaveMode::Response";
  qword_253D0B0F0 = (uint64_t)off_24C975620;
  unk_253D0B0F8 = "QMI Response Result";
  byte_253D0B110 = 0;
  word_253D0B112 = 50;
  byte_253D0B114 = 0;
  qword_253D0B100 = (uint64_t)&off_24C975948;
  unk_253D0B108 = "ctl::ConfigPowerSaveModeExt::Request";
  qword_253D0B118 = (uint64_t)off_24C975360;
  unk_253D0B120 = "ctl::tlv::PowerSaveDescriptor";
  qword_253D0B128 = (uint64_t)off_24C9753F0;
  unk_253D0B130 = "ctl::tlv::IndicationSetExt";
  byte_253D0B148 = 0;
  word_253D0B14A = 50;
  byte_253D0B14C = 1;
  qword_253D0B138 = (uint64_t)&off_24C975978;
  unk_253D0B140 = "ctl::ConfigPowerSaveModeExt::Response";
  qword_253D0B150 = (uint64_t)off_24C975620;
  unk_253D0B158 = "QMI Response Result";
  byte_253D0B170 = 0;
  word_253D0B172 = 34;
  byte_253D0B174 = 0;
  qword_253D0B160 = (uint64_t)&off_24C9759A8;
  unk_253D0B168 = "ctl::GetClientId::Request";
  qword_253D0B178 = (uint64_t)off_24C975438;
  unk_253D0B180 = "ctl::tlv::ServiceType";
  byte_253D0B198 = 0;
  word_253D0B19A = 34;
  byte_253D0B19C = 1;
  qword_253D0B188 = (uint64_t)&off_24C9759D8;
  unk_253D0B190 = "ctl::GetClientId::Response";
  qword_253D0B1A0 = (uint64_t)off_24C975620;
  unk_253D0B1A8 = "QMI Response Result";
  qword_253D0B1B0 = (uint64_t)off_24C975480;
  unk_253D0B1B8 = "ctl::tlv::AssignedId";
  byte_253D0B1D0 = 0;
  word_253D0B1D2 = 35;
  byte_253D0B1D4 = 0;
  qword_253D0B1C0 = (uint64_t)&off_24C975A08;
  unk_253D0B1C8 = "ctl::ReleaseClientId::Request";
  qword_253D0B1D8 = (uint64_t)off_24C975480;
  unk_253D0B1E0 = "ctl::tlv::AssignedId";
  byte_253D0B1F8 = 0;
  word_253D0B1FA = 35;
  byte_253D0B1FC = 1;
  qword_253D0B1E8 = (uint64_t)&off_24C975A38;
  unk_253D0B1F0 = "ctl::ReleaseClientId::Response";
  qword_253D0B200 = (uint64_t)off_24C975620;
  unk_253D0B208 = "QMI Response Result";
  qword_253D0B210 = (uint64_t)off_24C975480;
  unk_253D0B218 = "ctl::tlv::AssignedId";
  byte_253D0B230 = 0;
  word_253D0B232 = 36;
  byte_253D0B234 = 2;
  qword_253D0B220 = (uint64_t)&off_24C975A68;
  unk_253D0B228 = "ctl::RevokeClientId::Indication";
  qword_253D0B238 = (uint64_t)off_24C975480;
  unk_253D0B240 = "ctl::tlv::AssignedId";
  byte_253D0B258 = 0;
  word_253D0B25A = 38;
  byte_253D0B25C = 0;
  qword_253D0B248 = (uint64_t)&off_24C975A98;
  unk_253D0B250 = "ctl::SetDataFormat::Request";
  qword_253D0B260 = (uint64_t)off_24C9754C8;
  unk_253D0B268 = "ctl::tlv::DataFormat";
  qword_253D0B270 = (uint64_t)off_24C975510;
  unk_253D0B278 = "ctl::tlv::LinkLayerProtocol";
  byte_253D0B290 = 0;
  word_253D0B292 = 38;
  byte_253D0B294 = 1;
  qword_253D0B280 = (uint64_t)&off_24C975AC8;
  unk_253D0B288 = "ctl::SetDataFormat::Response";
  qword_253D0B298 = (uint64_t)off_24C975620;
  unk_253D0B2A0 = "QMI Response Result";
  qword_253D0B2B0 = (uint64_t)"ctl::tlv::LinkLayerProtocol";
  qword_253D0B2A8 = (uint64_t)off_24C975510;
  qword_253D0B2C0 = (uint64_t)"ctl::SetPowerSaveMode::Request";
  byte_253D0B2C8 = 0;
  word_253D0B2CA = 42;
  byte_253D0B2CC = 0;
  qword_253D0B2B8 = (uint64_t)&off_24C975AF8;
  qword_253D0B2D8 = (uint64_t)"ctl::tlv::PowerSaveState";
  qword_253D0B2D0 = (uint64_t)off_24C975558;
  qword_253D0B2E8 = (uint64_t)"ctl::SetPowerSaveMode::Response";
  byte_253D0B2F0 = 0;
  word_253D0B2F2 = 42;
  byte_253D0B2F4 = 1;
  qword_253D0B2E0 = (uint64_t)&off_24C975B28;
  qword_253D0B300 = (uint64_t)"QMI Response Result";
  qword_253D0B2F8 = (uint64_t)off_24C975620;
  qword_253D0B310 = (uint64_t)"ctl::Sync::Indication";
  byte_253D0B318 = 0;
  word_253D0B31A = 39;
  byte_253D0B31C = 2;
  qword_253D0B308 = (uint64_t)&unk_24C975CC0;
  qword_253D0B328 = (uint64_t)"ctl::Sync::Request";
  byte_253D0B330 = 0;
  word_253D0B332 = 39;
  byte_253D0B334 = 0;
  qword_253D0B320 = (uint64_t)&unk_24C975D08;
  qword_253D0B340 = (uint64_t)"ctl::Sync::Response";
  byte_253D0B348 = 0;
  word_253D0B34A = 39;
  byte_253D0B34C = 1;
  qword_253D0B338 = (uint64_t)&off_24C975B58;
  qword_253D0B358 = (uint64_t)"QMI Response Result";
  qword_253D0B350 = (uint64_t)off_24C975620;
}

void TlvDefinitionImpl<ctl::tlv::PowerSaveDescriptor,(unsigned char)1>::parse(uint64_t a1@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v6;
  const unsigned __int8 *v7;
  __int128 v8;
  std::string *v9;
  xpc_object_t v10;
  void *v11;
  xpc_object_t object;
  unint64_t v13;

  v6 = *a2;
  v7 = (const unsigned __int8 *)a2[1];
  v13 = 0xAAAAAA0000000000;
  tlv::throwIfNotEnoughBytes(v6, v7, 4uLL);
  LODWORD(v13) = *(_DWORD *)v6;
  tlv::throwIfNotEnoughBytes(v6 + 4, v7, 1uLL);
  BYTE4(v13) = *(_BYTE *)(v6 + 4);
  *(_QWORD *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v8;
  *(_OWORD *)(a3 + 16) = v8;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v9, *(const std::string::value_type **)(a1 + 8));
  if (v6 == -5)
  {
    TlvDefinition::sFillInParseFailure(a3, (uint64_t)a2);
  }
  else
  {
    ctl::tlv::print_tlv_field((uint64_t)&v13, &object);
    v10 = object;
    object = xpc_null_create();
    v11 = *(void **)(a3 + 32);
    *(_QWORD *)(a3 + 32) = v10;
    xpc_release(v11);
    xpc_release(object);
  }
}

void sub_20E608688(_Unwind_Exception *a1)
{
  xpc_object_t *v1;

  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

void sub_20E60869C(_Unwind_Exception *a1)
{
  xpc_object_t *v1;

  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

void sub_20E6086B0(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x20E608604);
}

char *TlvDefinitionImpl<ctl::tlv::PowerSaveDescriptor,(unsigned char)1>::build@<X0>(xpc_object_t *a1@<X1>, _QWORD *a2@<X8>)
{
  char *result;
  unint64_t v4;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v4 = 0xAAAAAA0000000000;
  ctl::tlv::build_tlv_field(a1, (uint64_t)&v4);
  result = (char *)operator new(5uLL);
  *a2 = result;
  a2[1] = result + 5;
  a2[2] = result + 5;
  *(_DWORD *)result = v4;
  result[4] = BYTE4(v4);
  return result;
}

void sub_20E608728(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x20E608718);
}

void sub_20E608734(_Unwind_Exception *exception_object)
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

void TlvAnnotation::~TlvAnnotation(xpc_object_t *this)
{
  xpc_release(this[4]);
  this[4] = 0;
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

void TlvAnnotation::TlvAnnotation(TlvAnnotation *this)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;

  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_BYTE *)this + 24) = 0;
  *((_QWORD *)this + 2) = 0;
  v2 = xpc_array_create(0, 0);
  v3 = v2;
  if (v2)
  {
    *((_QWORD *)this + 4) = v2;
  }
  else
  {
    v3 = xpc_null_create();
    *((_QWORD *)this + 4) = v3;
    if (!v3)
    {
      v4 = xpc_null_create();
      v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BC1854](v3) != MEMORY[0x24BDACF78])
  {
    v4 = xpc_null_create();
LABEL_8:
    *((_QWORD *)this + 4) = v4;
    goto LABEL_9;
  }
  xpc_retain(v3);
LABEL_9:
  xpc_release(v3);
}

void TlvDefinitionImpl<ctl::tlv::IndicationSet,(unsigned char)17>::parse(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  const unsigned __int8 *v6;
  _BYTE *v7;
  unint64_t v8;
  void *v9;
  __int128 v10;
  std::string *v11;
  xpc_object_t v12;
  void *v13;
  xpc_object_t object;
  void *__p;
  void *v16;
  uint64_t v17;

  v7 = *(_BYTE **)a2;
  v6 = *(const unsigned __int8 **)(a2 + 8);
  __p = 0;
  v16 = 0;
  v17 = 0;
  tlv::throwIfNotAligned((unint64_t)v7, v6, 2uLL);
  v8 = (unint64_t)(v6 - v7) >> 1;
  v9 = 0;
  if (v8)
  {
    std::vector<unsigned short>::__append((uint64_t)&__p, v8);
    v9 = __p;
  }
  memcpy(v9, v7, v6 - v7);
  *(_QWORD *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v10;
  *(_OWORD *)(a3 + 16) = v10;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v11, *(const std::string::value_type **)(a1 + 8));
  if (v6)
  {
    ctl::tlv::print_tlv_field((uint64_t *)&__p, &object);
    v12 = object;
    object = xpc_null_create();
    v13 = *(void **)(a3 + 32);
    *(_QWORD *)(a3 + 32) = v12;
    xpc_release(v13);
    xpc_release(object);
  }
  else
  {
    TlvDefinition::sFillInParseFailure(a3, a2);
  }
  if (__p)
  {
    v16 = __p;
    operator delete(__p);
  }
}

void sub_20E608968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  xpc_object_t *v11;

  TlvAnnotation::~TlvAnnotation(v11);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_20E6089A4(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x20E6088D4);
}

void sub_20E6089B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (!a10)
    JUMPOUT(0x20E60899CLL);
  JUMPOUT(0x20E608994);
}

void TlvDefinitionImpl<ctl::tlv::IndicationSet,(unsigned char)17>::build(xpc_object_t *a1@<X1>, _QWORD *a2@<X8>)
{
  void *v3;
  size_t v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  xpc_object_t object;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  extract_tlv_field(a1, "fEnabledIndSet", 0, &object);
  tlv::build_tlv_field<unsigned short>(&object, &v6);
  xpc_release(object);
  v3 = v6;
  v4 = v7 - v6;
  if (v7 == v6)
  {
    memcpy(0, v6, v7 - v6);
    a2[1] = 0;
    if (!v3)
      return;
    goto LABEL_6;
  }
  if ((v4 & 0x8000000000000000) != 0)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v5 = (char *)operator new(v7 - v6);
  *a2 = v5;
  a2[1] = &v5[v4];
  a2[2] = &v5[v4];
  memcpy(v5, v3, v4);
  if (v3)
  {
LABEL_6:
    v7 = v3;
    operator delete(v3);
  }
}

void sub_20E608A98(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  xpc_release(object);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  if (!a9)
    JUMPOUT(0x20E608A74);
  JUMPOUT(0x20E608A68);
}

void sub_20E608AC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  uint64_t v10;
  void *v12;

  if (__p)
  {
    operator delete(__p);
    v12 = *(void **)v10;
    if (!*(_QWORD *)v10)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else
  {
    v12 = *(void **)v10;
    if (!*(_QWORD *)v10)
      goto LABEL_3;
  }
  *(_QWORD *)(v10 + 8) = v12;
  operator delete(v12);
  _Unwind_Resume(exception_object);
}

void TlvDefinitionImpl<ctl::tlv::IndicationSetExt,(unsigned char)16>::parse(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unsigned __int8 *v6;
  const unsigned __int8 *v7;
  char *v8;
  unsigned int v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  __int128 v13;
  std::string *v14;
  xpc_object_t v15;
  void *v16;
  xpc_object_t object;
  void *__p;
  void *v19;
  uint64_t v20;

  v6 = *(unsigned __int8 **)a2;
  v7 = *(const unsigned __int8 **)(a2 + 8);
  __p = 0;
  v19 = 0;
  v20 = 0;
  tlv::throwIfNotEnoughBytes((unint64_t)v6, v7, 1uLL);
  v9 = *v6;
  v8 = (char *)(v6 + 1);
  v10 = 2 * v9;
  tlv::throwIfNotEnoughBytes((unint64_t)v8, v7, v10);
  v11 = 0;
  v12 = v9;
  if (v9)
  {
    std::vector<unsigned short>::__append((uint64_t)&__p, v12);
    v11 = __p;
  }
  memcpy(v11, v8, v10);
  *(_QWORD *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v13;
  *(_OWORD *)(a3 + 16) = v13;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v14, *(const std::string::value_type **)(a1 + 8));
  if (&v8[v10])
  {
    ctl::tlv::print_tlv_field((uint64_t *)&__p, &object);
    v15 = object;
    object = xpc_null_create();
    v16 = *(void **)(a3 + 32);
    *(_QWORD *)(a3 + 32) = v15;
    xpc_release(v16);
    xpc_release(object);
  }
  else
  {
    TlvDefinition::sFillInParseFailure(a3, a2);
  }
  if (__p)
  {
    v19 = __p;
    operator delete(__p);
  }
}

void sub_20E608C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  xpc_object_t *v11;

  TlvAnnotation::~TlvAnnotation(v11);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_20E608C80(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x20E608BACLL);
}

void sub_20E608C90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (!a10)
    JUMPOUT(0x20E608C78);
  JUMPOUT(0x20E608C70);
}

void TlvDefinitionImpl<ctl::tlv::IndicationSetExt,(unsigned char)16>::build(xpc_object_t *a1@<X1>, _QWORD *a2@<X8>)
{
  void *v3;
  size_t v4;
  int64_t v5;
  _BYTE *v6;
  void *v7;
  _BYTE *v8;
  uint64_t v9;
  xpc_object_t object;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  extract_tlv_field(a1, "fEnabledIndSet", 0, &object);
  tlv::build_tlv_field<unsigned short>(&object, &v7);
  xpc_release(object);
  v3 = v7;
  v4 = v8 - (_BYTE *)v7;
  v5 = v8 - (_BYTE *)v7 + 1;
  if (v5 < 0)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v6 = operator new(v8 - (_BYTE *)v7 + 1);
  bzero(v6, v5);
  *a2 = v6;
  a2[1] = &v6[v5];
  a2[2] = &v6[v5];
  *v6 = v4 >> 1;
  memcpy(v6 + 1, v3, v4);
  if (v3)
  {
    v8 = v3;
    operator delete(v3);
  }
}

void sub_20E608D78(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, xpc_object_t object)
{
  xpc_release(object);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  if (!a9)
    JUMPOUT(0x20E608D50);
  JUMPOUT(0x20E608D44);
}

void sub_20E608DA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10)
{
  uint64_t v10;
  void *v12;

  if (__p)
  {
    operator delete(__p);
    v12 = *(void **)v10;
    if (!*(_QWORD *)v10)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else
  {
    v12 = *(void **)v10;
    if (!*(_QWORD *)v10)
      goto LABEL_3;
  }
  *(_QWORD *)(v10 + 8) = v12;
  operator delete(v12);
  _Unwind_Resume(exception_object);
}

void TlvDefinitionImpl<ctl::tlv::ServiceType,(unsigned char)1>::parse(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  const unsigned __int8 *v6;
  unsigned __int8 *v7;
  __int128 v8;
  std::string *v9;
  xpc_object_t v10;
  void *v11;
  xpc_object_t object;
  unsigned __int8 v13;

  v7 = *(unsigned __int8 **)a2;
  v6 = *(const unsigned __int8 **)(a2 + 8);
  v13 = 0;
  tlv::throwIfNotEnoughBytes((unint64_t)v7, v6, 1uLL);
  v13 = *v7;
  *(_QWORD *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v8;
  *(_OWORD *)(a3 + 16) = v8;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v9, *(const std::string::value_type **)(a1 + 8));
  if (v7 == (unsigned __int8 *)-1)
  {
    TlvDefinition::sFillInParseFailure(a3, a2);
  }
  else
  {
    ctl::tlv::print_tlv_field(&v13, &object);
    v10 = object;
    object = xpc_null_create();
    v11 = *(void **)(a3 + 32);
    *(_QWORD *)(a3 + 32) = v10;
    xpc_release(v11);
    xpc_release(object);
  }
}

void sub_20E608EAC(_Unwind_Exception *a1)
{
  xpc_object_t *v1;

  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

void sub_20E608EC0(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x20E608E2CLL);
}

void sub_20E608ED0(_Unwind_Exception *a1)
{
  xpc_object_t *v1;

  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

_BYTE *TlvDefinitionImpl<ctl::tlv::ServiceType,(unsigned char)1>::build@<X0>(xpc_object_t *a1@<X1>, _QWORD *a2@<X8>)
{
  char v3;
  _BYTE *v4;
  _BYTE *result;
  xpc_object_t object;
  BOOL v7;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  extract_tlv_field(a1, "fSvcType", 0, &object);
  v3 = sAttemptDecodeNumber(&object, &v7);
  xpc_release(object);
  v4 = operator new(1uLL);
  *a2 = v4;
  *v4 = v3;
  result = v4 + 1;
  a2[1] = result;
  a2[2] = result;
  return result;
}

void sub_20E608F58(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  xpc_release(object);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x20E608F44);
}

void sub_20E608F80(_Unwind_Exception *exception_object)
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

void TlvDefinitionImpl<ctl::tlv::AssignedId,(unsigned char)1>::parse(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _BYTE *v6;
  const unsigned __int8 *v7;
  __int128 v8;
  std::string *v9;
  xpc_object_t v10;
  void *v11;
  xpc_object_t object;
  __int16 v13;

  v6 = *(_BYTE **)a2;
  v7 = *(const unsigned __int8 **)(a2 + 8);
  v13 = 0;
  tlv::throwIfNotEnoughBytes((unint64_t)v6, v7, 1uLL);
  LOBYTE(v13) = *v6;
  tlv::throwIfNotEnoughBytes((unint64_t)(v6 + 1), v7, 1uLL);
  HIBYTE(v13) = v6[1];
  *(_QWORD *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v8;
  *(_OWORD *)(a3 + 16) = v8;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v9, *(const std::string::value_type **)(a1 + 8));
  if (v6 == (_BYTE *)-2)
  {
    TlvDefinition::sFillInParseFailure(a3, a2);
  }
  else
  {
    ctl::tlv::print_tlv_field((unsigned __int8 *)&v13, &object);
    v10 = object;
    object = xpc_null_create();
    v11 = *(void **)(a3 + 32);
    *(_QWORD *)(a3 + 32) = v10;
    xpc_release(v11);
    xpc_release(object);
  }
}

void sub_20E609088(_Unwind_Exception *a1)
{
  xpc_object_t *v1;

  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

void sub_20E60909C(_Unwind_Exception *a1)
{
  xpc_object_t *v1;

  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

void sub_20E6090B0(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x20E609004);
}

_WORD *TlvDefinitionImpl<ctl::tlv::AssignedId,(unsigned char)1>::build@<X0>(xpc_object_t *a1@<X1>, _QWORD *a2@<X8>)
{
  _WORD *v3;
  _WORD *result;
  __int16 v5;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v5 = 0;
  ctl::tlv::build_tlv_field(a1, &v5);
  v3 = operator new(2uLL);
  *a2 = v3;
  *v3 = v5;
  result = v3 + 1;
  a2[1] = result;
  a2[2] = result;
  return result;
}

void sub_20E609114(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x20E609104);
}

void sub_20E609120(_Unwind_Exception *exception_object)
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

void TlvDefinitionImpl<ctl::tlv::DataFormat,(unsigned char)1>::parse(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  const unsigned __int8 *v6;
  unsigned __int8 *v7;
  __int128 v8;
  std::string *v9;
  xpc_object_t v10;
  void *v11;
  xpc_object_t object;
  int v13;

  v7 = *(unsigned __int8 **)a2;
  v6 = *(const unsigned __int8 **)(a2 + 8);
  v13 = 0;
  tlv::throwIfNotEnoughBytes((unint64_t)v7, v6, 1uLL);
  v13 = *v7;
  *(_QWORD *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v8;
  *(_OWORD *)(a3 + 16) = v8;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v9, *(const std::string::value_type **)(a1 + 8));
  if (v7 == (unsigned __int8 *)-1)
  {
    TlvDefinition::sFillInParseFailure(a3, a2);
  }
  else
  {
    ctl::tlv::print_tlv_field(&object);
    v10 = object;
    object = xpc_null_create();
    v11 = *(void **)(a3 + 32);
    *(_QWORD *)(a3 + 32) = v10;
    xpc_release(v11);
    xpc_release(object);
  }
}

void sub_20E609200(_Unwind_Exception *a1)
{
  xpc_object_t *v1;

  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

void sub_20E609214(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x20E609180);
}

void sub_20E609224(_Unwind_Exception *a1)
{
  xpc_object_t *v1;

  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

_BYTE *TlvDefinitionImpl<ctl::tlv::DataFormat,(unsigned char)1>::build@<X0>(xpc_object_t *a1@<X1>, _QWORD *a2@<X8>)
{
  char v3;
  _BYTE *v4;
  _BYTE *result;
  xpc_object_t object;
  BOOL v7;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  extract_tlv_field(a1, "fFormat", 0, &object);
  v3 = sAttemptDecodeNumber(&object, &v7);
  xpc_release(object);
  v4 = operator new(1uLL);
  *a2 = v4;
  *v4 = v3;
  result = v4 + 1;
  a2[1] = result;
  a2[2] = result;
  return result;
}

void sub_20E6092AC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  xpc_release(object);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x20E609298);
}

void sub_20E6092D4(_Unwind_Exception *exception_object)
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

void TlvDefinitionImpl<ctl::tlv::LinkLayerProtocol,(unsigned char)16>::parse(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  const unsigned __int8 *v6;
  unsigned __int16 *v7;
  __int128 v8;
  std::string *v9;
  xpc_object_t v10;
  void *v11;
  xpc_object_t object;
  int v13;

  v7 = *(unsigned __int16 **)a2;
  v6 = *(const unsigned __int8 **)(a2 + 8);
  v13 = 0;
  tlv::throwIfNotEnoughBytes((unint64_t)v7, v6, 2uLL);
  v13 = *v7;
  *(_QWORD *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v8;
  *(_OWORD *)(a3 + 16) = v8;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v9, *(const std::string::value_type **)(a1 + 8));
  if (v7 == (unsigned __int16 *)-2)
  {
    TlvDefinition::sFillInParseFailure(a3, a2);
  }
  else
  {
    ctl::tlv::print_tlv_field(&object);
    v10 = object;
    object = xpc_null_create();
    v11 = *(void **)(a3 + 32);
    *(_QWORD *)(a3 + 32) = v10;
    xpc_release(v11);
    xpc_release(object);
  }
}

void sub_20E6093B4(_Unwind_Exception *a1)
{
  xpc_object_t *v1;

  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

void sub_20E6093C8(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x20E609334);
}

void sub_20E6093D8(_Unwind_Exception *a1)
{
  xpc_object_t *v1;

  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

_WORD *TlvDefinitionImpl<ctl::tlv::LinkLayerProtocol,(unsigned char)16>::build@<X0>(xpc_object_t *a1@<X1>, _QWORD *a2@<X8>)
{
  __int16 v3;
  _WORD *v4;
  _WORD *result;
  xpc_object_t object;
  BOOL v7;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  extract_tlv_field(a1, "fProtocol", 0, &object);
  v3 = sAttemptDecodeNumber(&object, &v7);
  xpc_release(object);
  v4 = operator new(2uLL);
  *a2 = v4;
  *v4 = v3;
  result = v4 + 1;
  a2[1] = result;
  a2[2] = result;
  return result;
}

void sub_20E609460(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  xpc_release(object);
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x20E60944CLL);
}

void sub_20E609488(_Unwind_Exception *exception_object)
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

void TlvDefinitionImpl<ctl::tlv::PowerSaveState,(unsigned char)1>::parse(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  const unsigned __int8 *v6;
  int *v7;
  __int128 v8;
  std::string *v9;
  xpc_object_t v10;
  void *v11;
  xpc_object_t object;
  int v13;

  v7 = *(int **)a2;
  v6 = *(const unsigned __int8 **)(a2 + 8);
  v13 = 0;
  tlv::throwIfNotEnoughBytes((unint64_t)v7, v6, 4uLL);
  v13 = *v7;
  *(_QWORD *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v8;
  *(_OWORD *)(a3 + 16) = v8;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v9, *(const std::string::value_type **)(a1 + 8));
  if (v7 == (int *)-4)
  {
    TlvDefinition::sFillInParseFailure(a3, a2);
  }
  else
  {
    ctl::tlv::print_tlv_field(&object);
    v10 = object;
    object = xpc_null_create();
    v11 = *(void **)(a3 + 32);
    *(_QWORD *)(a3 + 32) = v10;
    xpc_release(v11);
    xpc_release(object);
  }
}

void sub_20E609568(_Unwind_Exception *a1)
{
  xpc_object_t *v1;

  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

void sub_20E60957C(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x20E6094E8);
}

void sub_20E60958C(_Unwind_Exception *a1)
{
  xpc_object_t *v1;

  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

_DWORD *TlvDefinitionImpl<ctl::tlv::PowerSaveState,(unsigned char)1>::build@<X0>(xpc_object_t *a1@<X1>, _QWORD *a2@<X8>)
{
  _DWORD *v3;
  _DWORD *result;
  int v5;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v5 = 0;
  ctl::tlv::build_tlv_field(a1, &v5);
  v3 = operator new(4uLL);
  *a2 = v3;
  *v3 = v5;
  result = v3 + 1;
  a2[1] = result;
  a2[2] = result;
  return result;
}

void sub_20E6095F4(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x20E6095E4);
}

void sub_20E609600(_Unwind_Exception *exception_object)
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

uint64_t print_tlv_field@<X0>(_BYTE *a1@<X8>)
{
  return print_tlv_field_as<unsigned short,ctl::LinkLayerProtocol>(a1);
}

{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  std::ios_base *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  const std::ios_base *v12;
  const std::locale::facet *v13;
  std::ios_base::fmtflags v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  void *__src[2];
  __int128 v27;
  void *__p[2];
  __int128 v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  std::locale v41;

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v40 = v2;
  v39 = v2;
  v38 = v2;
  v37 = v2;
  v36 = v2;
  v35 = v2;
  v34 = v2;
  v33 = v2;
  v32 = v2;
  v29 = v2;
  *(_OWORD *)__p = v2;
  v27 = v2;
  *(_OWORD *)__src = v2;
  v25 = v2;
  v24 = v2;
  v3 = MEMORY[0x24BEDB870];
  v4 = MEMORY[0x24BEDB870] + 64;
  v31 = MEMORY[0x24BEDB870] + 64;
  v5 = (uint64_t *)MEMORY[0x24BEDB800];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v23 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v6;
  v7 = (std::ios_base *)((char *)&v23 + *(_QWORD *)(v23 - 24));
  std::ios_base::init(v7, &v24);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  v23 = v3 + 24;
  v31 = v4;
  std::streambuf::basic_streambuf();
  v8 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v24 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v29 = 0u;
  LODWORD(v30) = 16;
  *(_DWORD *)((char *)&v23 + *(_QWORD *)(v23 - 24) + 8) = *(_DWORD *)((_BYTE *)&v23 + *(_QWORD *)(v23 - 24) + 8) & 0xFFFFFFB5 | 2;
  v9 = (_QWORD *)std::ostream::operator<<();
  v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)" (0x", 4);
  v11 = *v10;
  *(_DWORD *)((char *)v10 + *(_QWORD *)(*v10 - 24) + 8) = *(_DWORD *)((_BYTE *)v10 + *(_QWORD *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v10 + *(_QWORD *)(v11 - 24) + 24) = 2;
  v12 = (const std::ios_base *)((char *)v10 + *(_QWORD *)(v11 - 24));
  if (v12[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v12);
    v13 = std::locale::use_facet(&v41, MEMORY[0x24BEDB350]);
    v14 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 32);
    std::locale::~locale(&v41);
    v12[1].__fmtflags_ = v14;
  }
  v12[1].__fmtflags_ = 48;
  v15 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)")", 1);
  if ((v30 & 0x10) != 0)
  {
    v17 = *((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1) < (unint64_t)v27)
    {
      *((_QWORD *)&v29 + 1) = v27;
      v17 = v27;
    }
    v18 = __src[1];
    v16 = v17 - (unint64_t)__src[1];
    if (v17 - (unint64_t)__src[1] >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_20;
  }
  else
  {
    if ((v30 & 8) == 0)
    {
      v16 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    v18 = (const void *)v25;
    v16 = (size_t)__src[0] - v25;
    if ((char *)__src[0] - (unint64_t)v25 >= (void *)0x7FFFFFFFFFFFFFF8)
LABEL_20:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v16 >= 0x17)
  {
    v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v19 = v16 | 7;
    v20 = v19 + 1;
    v21 = operator new(v19 + 1);
    *((_QWORD *)a1 + 1) = v16;
    *((_QWORD *)a1 + 2) = v20 | 0x8000000000000000;
    *(_QWORD *)a1 = v21;
    a1 = v21;
    goto LABEL_15;
  }
  a1[23] = v16;
  if (v16)
LABEL_15:
    memmove(a1, v18, v16);
LABEL_16:
  a1[v16] = 0;
  v23 = *v5;
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v5[3];
  *(_QWORD *)&v24 = v8 + 16;
  if (SBYTE7(v29) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x212BC1680](&v31);
}

{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  std::ios_base *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  const std::ios_base *v12;
  const std::locale::facet *v13;
  std::ios_base::fmtflags v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  void *__src[2];
  __int128 v27;
  void *__p[2];
  __int128 v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  std::locale v41;

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v40 = v2;
  v39 = v2;
  v38 = v2;
  v37 = v2;
  v36 = v2;
  v35 = v2;
  v34 = v2;
  v33 = v2;
  v32 = v2;
  v29 = v2;
  *(_OWORD *)__p = v2;
  v27 = v2;
  *(_OWORD *)__src = v2;
  v25 = v2;
  v24 = v2;
  v3 = MEMORY[0x24BEDB870];
  v4 = MEMORY[0x24BEDB870] + 64;
  v31 = MEMORY[0x24BEDB870] + 64;
  v5 = (uint64_t *)MEMORY[0x24BEDB800];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v23 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v6;
  v7 = (std::ios_base *)((char *)&v23 + *(_QWORD *)(v23 - 24));
  std::ios_base::init(v7, &v24);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  v23 = v3 + 24;
  v31 = v4;
  std::streambuf::basic_streambuf();
  v8 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v24 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v29 = 0u;
  LODWORD(v30) = 16;
  *(_DWORD *)((char *)&v23 + *(_QWORD *)(v23 - 24) + 8) = *(_DWORD *)((_BYTE *)&v23 + *(_QWORD *)(v23 - 24) + 8) & 0xFFFFFFB5 | 2;
  v9 = (_QWORD *)std::ostream::operator<<();
  v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)" (0x", 4);
  v11 = *v10;
  *(_DWORD *)((char *)v10 + *(_QWORD *)(*v10 - 24) + 8) = *(_DWORD *)((_BYTE *)v10 + *(_QWORD *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v10 + *(_QWORD *)(v11 - 24) + 24) = 4;
  v12 = (const std::ios_base *)((char *)v10 + *(_QWORD *)(v11 - 24));
  if (v12[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v12);
    v13 = std::locale::use_facet(&v41, MEMORY[0x24BEDB350]);
    v14 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 32);
    std::locale::~locale(&v41);
    v12[1].__fmtflags_ = v14;
  }
  v12[1].__fmtflags_ = 48;
  v15 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)")", 1);
  if ((v30 & 0x10) != 0)
  {
    v17 = *((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1) < (unint64_t)v27)
    {
      *((_QWORD *)&v29 + 1) = v27;
      v17 = v27;
    }
    v18 = __src[1];
    v16 = v17 - (unint64_t)__src[1];
    if (v17 - (unint64_t)__src[1] >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_20;
  }
  else
  {
    if ((v30 & 8) == 0)
    {
      v16 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    v18 = (const void *)v25;
    v16 = (size_t)__src[0] - v25;
    if ((char *)__src[0] - (unint64_t)v25 >= (void *)0x7FFFFFFFFFFFFFF8)
LABEL_20:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v16 >= 0x17)
  {
    v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v19 = v16 | 7;
    v20 = v19 + 1;
    v21 = operator new(v19 + 1);
    *((_QWORD *)a1 + 1) = v16;
    *((_QWORD *)a1 + 2) = v20 | 0x8000000000000000;
    *(_QWORD *)a1 = v21;
    a1 = v21;
    goto LABEL_15;
  }
  a1[23] = v16;
  if (v16)
LABEL_15:
    memmove(a1, v18, v16);
LABEL_16:
  a1[v16] = 0;
  v23 = *v5;
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v5[3];
  *(_QWORD *)&v24 = v8 + 16;
  if (SBYTE7(v29) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x212BC1680](&v31);
}

{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  std::ios_base *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  const std::ios_base *v12;
  const std::locale::facet *v13;
  std::ios_base::fmtflags v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  void *__src[2];
  __int128 v27;
  void *__p[2];
  __int128 v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  std::locale v41;

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v40 = v2;
  v39 = v2;
  v38 = v2;
  v37 = v2;
  v36 = v2;
  v35 = v2;
  v34 = v2;
  v33 = v2;
  v32 = v2;
  v29 = v2;
  *(_OWORD *)__p = v2;
  v27 = v2;
  *(_OWORD *)__src = v2;
  v25 = v2;
  v24 = v2;
  v3 = MEMORY[0x24BEDB870];
  v4 = MEMORY[0x24BEDB870] + 64;
  v31 = MEMORY[0x24BEDB870] + 64;
  v5 = (uint64_t *)MEMORY[0x24BEDB800];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v23 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v6;
  v7 = (std::ios_base *)((char *)&v23 + *(_QWORD *)(v23 - 24));
  std::ios_base::init(v7, &v24);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  v23 = v3 + 24;
  v31 = v4;
  std::streambuf::basic_streambuf();
  v8 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v24 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v29 = 0u;
  LODWORD(v30) = 16;
  *(_DWORD *)((char *)&v23 + *(_QWORD *)(v23 - 24) + 8) = *(_DWORD *)((_BYTE *)&v23 + *(_QWORD *)(v23 - 24) + 8) & 0xFFFFFFB5 | 2;
  v9 = (_QWORD *)std::ostream::operator<<();
  v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)" (0x", 4);
  v11 = *v10;
  *(_DWORD *)((char *)v10 + *(_QWORD *)(*v10 - 24) + 8) = *(_DWORD *)((_BYTE *)v10 + *(_QWORD *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v10 + *(_QWORD *)(v11 - 24) + 24) = 8;
  v12 = (const std::ios_base *)((char *)v10 + *(_QWORD *)(v11 - 24));
  if (v12[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v12);
    v13 = std::locale::use_facet(&v41, MEMORY[0x24BEDB350]);
    v14 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 32);
    std::locale::~locale(&v41);
    v12[1].__fmtflags_ = v14;
  }
  v12[1].__fmtflags_ = 48;
  v15 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)")", 1);
  if ((v30 & 0x10) != 0)
  {
    v17 = *((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1) < (unint64_t)v27)
    {
      *((_QWORD *)&v29 + 1) = v27;
      v17 = v27;
    }
    v18 = __src[1];
    v16 = v17 - (unint64_t)__src[1];
    if (v17 - (unint64_t)__src[1] >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_20;
  }
  else
  {
    if ((v30 & 8) == 0)
    {
      v16 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    v18 = (const void *)v25;
    v16 = (size_t)__src[0] - v25;
    if ((char *)__src[0] - (unint64_t)v25 >= (void *)0x7FFFFFFFFFFFFFF8)
LABEL_20:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v16 >= 0x17)
  {
    v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v19 = v16 | 7;
    v20 = v19 + 1;
    v21 = operator new(v19 + 1);
    *((_QWORD *)a1 + 1) = v16;
    *((_QWORD *)a1 + 2) = v20 | 0x8000000000000000;
    *(_QWORD *)a1 = v21;
    a1 = v21;
    goto LABEL_15;
  }
  a1[23] = v16;
  if (v16)
LABEL_15:
    memmove(a1, v18, v16);
LABEL_16:
  a1[v16] = 0;
  v23 = *v5;
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v5[3];
  *(_QWORD *)&v24 = v8 + 16;
  if (SBYTE7(v29) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x212BC1680](&v31);
}

{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  std::ios_base *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  const std::ios_base *v12;
  const std::locale::facet *v13;
  std::ios_base::fmtflags v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  void *__src[2];
  __int128 v27;
  void *__p[2];
  __int128 v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  std::locale v41;

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v40 = v2;
  v39 = v2;
  v38 = v2;
  v37 = v2;
  v36 = v2;
  v35 = v2;
  v34 = v2;
  v33 = v2;
  v32 = v2;
  v29 = v2;
  *(_OWORD *)__p = v2;
  v27 = v2;
  *(_OWORD *)__src = v2;
  v25 = v2;
  v24 = v2;
  v3 = MEMORY[0x24BEDB870];
  v4 = MEMORY[0x24BEDB870] + 64;
  v31 = MEMORY[0x24BEDB870] + 64;
  v5 = (uint64_t *)MEMORY[0x24BEDB800];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v23 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v6;
  v7 = (std::ios_base *)((char *)&v23 + *(_QWORD *)(v23 - 24));
  std::ios_base::init(v7, &v24);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  v23 = v3 + 24;
  v31 = v4;
  std::streambuf::basic_streambuf();
  v8 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v24 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v29 = 0u;
  LODWORD(v30) = 16;
  *(_DWORD *)((char *)&v23 + *(_QWORD *)(v23 - 24) + 8) = *(_DWORD *)((_BYTE *)&v23 + *(_QWORD *)(v23 - 24) + 8) & 0xFFFFFFB5 | 2;
  v9 = (_QWORD *)std::ostream::operator<<();
  v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)" (0x", 4);
  v11 = *v10;
  *(_DWORD *)((char *)v10 + *(_QWORD *)(*v10 - 24) + 8) = *(_DWORD *)((_BYTE *)v10 + *(_QWORD *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v10 + *(_QWORD *)(v11 - 24) + 24) = 16;
  v12 = (const std::ios_base *)((char *)v10 + *(_QWORD *)(v11 - 24));
  if (v12[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v12);
    v13 = std::locale::use_facet(&v41, MEMORY[0x24BEDB350]);
    v14 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 32);
    std::locale::~locale(&v41);
    v12[1].__fmtflags_ = v14;
  }
  v12[1].__fmtflags_ = 48;
  v15 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)")", 1);
  if ((v30 & 0x10) != 0)
  {
    v17 = *((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1) < (unint64_t)v27)
    {
      *((_QWORD *)&v29 + 1) = v27;
      v17 = v27;
    }
    v18 = __src[1];
    v16 = v17 - (unint64_t)__src[1];
    if (v17 - (unint64_t)__src[1] >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_20;
  }
  else
  {
    if ((v30 & 8) == 0)
    {
      v16 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    v18 = (const void *)v25;
    v16 = (size_t)__src[0] - v25;
    if ((char *)__src[0] - (unint64_t)v25 >= (void *)0x7FFFFFFFFFFFFFF8)
LABEL_20:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v16 >= 0x17)
  {
    v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v19 = v16 | 7;
    v20 = v19 + 1;
    v21 = operator new(v19 + 1);
    *((_QWORD *)a1 + 1) = v16;
    *((_QWORD *)a1 + 2) = v20 | 0x8000000000000000;
    *(_QWORD *)a1 = v21;
    a1 = v21;
    goto LABEL_15;
  }
  a1[23] = v16;
  if (v16)
LABEL_15:
    memmove(a1, v18, v16);
LABEL_16:
  a1[v16] = 0;
  v23 = *v5;
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v5[3];
  *(_QWORD *)&v24 = v8 + 16;
  if (SBYTE7(v29) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x212BC1680](&v31);
}

{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  std::ios_base *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  const std::ios_base *v12;
  const std::locale::facet *v13;
  std::ios_base::fmtflags v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  void *__src[2];
  __int128 v27;
  void *__p[2];
  __int128 v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  std::locale v41;

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v40 = v2;
  v39 = v2;
  v38 = v2;
  v37 = v2;
  v36 = v2;
  v35 = v2;
  v34 = v2;
  v33 = v2;
  v32 = v2;
  v29 = v2;
  *(_OWORD *)__p = v2;
  v27 = v2;
  *(_OWORD *)__src = v2;
  v25 = v2;
  v24 = v2;
  v3 = MEMORY[0x24BEDB870];
  v4 = MEMORY[0x24BEDB870] + 64;
  v31 = MEMORY[0x24BEDB870] + 64;
  v5 = (uint64_t *)MEMORY[0x24BEDB800];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v23 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v6;
  v7 = (std::ios_base *)((char *)&v23 + *(_QWORD *)(v23 - 24));
  std::ios_base::init(v7, &v24);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  v23 = v3 + 24;
  v31 = v4;
  std::streambuf::basic_streambuf();
  v8 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v24 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v29 = 0u;
  LODWORD(v30) = 16;
  *(_DWORD *)((char *)&v23 + *(_QWORD *)(v23 - 24) + 8) = *(_DWORD *)((_BYTE *)&v23 + *(_QWORD *)(v23 - 24) + 8) & 0xFFFFFFB5 | 2;
  v9 = (_QWORD *)std::ostream::operator<<();
  v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)" (0x", 4);
  v11 = *v10;
  *(_DWORD *)((char *)v10 + *(_QWORD *)(*v10 - 24) + 8) = *(_DWORD *)((_BYTE *)v10 + *(_QWORD *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v10 + *(_QWORD *)(v11 - 24) + 24) = 16;
  v12 = (const std::ios_base *)((char *)v10 + *(_QWORD *)(v11 - 24));
  if (v12[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v12);
    v13 = std::locale::use_facet(&v41, MEMORY[0x24BEDB350]);
    v14 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 32);
    std::locale::~locale(&v41);
    v12[1].__fmtflags_ = v14;
  }
  v12[1].__fmtflags_ = 48;
  v15 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)")", 1);
  if ((v30 & 0x10) != 0)
  {
    v17 = *((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1) < (unint64_t)v27)
    {
      *((_QWORD *)&v29 + 1) = v27;
      v17 = v27;
    }
    v18 = __src[1];
    v16 = v17 - (unint64_t)__src[1];
    if (v17 - (unint64_t)__src[1] >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_20;
  }
  else
  {
    if ((v30 & 8) == 0)
    {
      v16 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    v18 = (const void *)v25;
    v16 = (size_t)__src[0] - v25;
    if ((char *)__src[0] - (unint64_t)v25 >= (void *)0x7FFFFFFFFFFFFFF8)
LABEL_20:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v16 >= 0x17)
  {
    v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v19 = v16 | 7;
    v20 = v19 + 1;
    v21 = operator new(v19 + 1);
    *((_QWORD *)a1 + 1) = v16;
    *((_QWORD *)a1 + 2) = v20 | 0x8000000000000000;
    *(_QWORD *)a1 = v21;
    a1 = v21;
    goto LABEL_15;
  }
  a1[23] = v16;
  if (v16)
LABEL_15:
    memmove(a1, v18, v16);
LABEL_16:
  a1[v16] = 0;
  v23 = *v5;
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v5[3];
  *(_QWORD *)&v24 = v8 + 16;
  if (SBYTE7(v29) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x212BC1680](&v31);
}

uint64_t print_tlv_field_as<unsigned short,ctl::LinkLayerProtocol>(_BYTE *a1)
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  std::ios_base *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  const std::ios_base *v12;
  const std::locale::facet *v13;
  std::ios_base::fmtflags v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  void *__src[2];
  __int128 v27;
  void *__p[2];
  __int128 v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  std::locale v41;

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v40 = v2;
  v39 = v2;
  v38 = v2;
  v37 = v2;
  v36 = v2;
  v35 = v2;
  v34 = v2;
  v33 = v2;
  v32 = v2;
  v29 = v2;
  *(_OWORD *)__p = v2;
  v27 = v2;
  *(_OWORD *)__src = v2;
  v25 = v2;
  v24 = v2;
  v3 = MEMORY[0x24BEDB870];
  v4 = MEMORY[0x24BEDB870] + 64;
  v31 = MEMORY[0x24BEDB870] + 64;
  v5 = (uint64_t *)MEMORY[0x24BEDB800];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v23 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v6;
  v7 = (std::ios_base *)((char *)&v23 + *(_QWORD *)(v23 - 24));
  std::ios_base::init(v7, &v24);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  v23 = v3 + 24;
  v31 = v4;
  std::streambuf::basic_streambuf();
  v8 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v24 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v29 = 0u;
  LODWORD(v30) = 16;
  *(_DWORD *)((char *)&v23 + *(_QWORD *)(v23 - 24) + 8) = *(_DWORD *)((_BYTE *)&v23 + *(_QWORD *)(v23 - 24) + 8) & 0xFFFFFFB5 | 2;
  v9 = (_QWORD *)std::ostream::operator<<();
  v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)" (0x", 4);
  v11 = *v10;
  *(_DWORD *)((char *)v10 + *(_QWORD *)(*v10 - 24) + 8) = *(_DWORD *)((_BYTE *)v10 + *(_QWORD *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v10 + *(_QWORD *)(v11 - 24) + 24) = 4;
  v12 = (const std::ios_base *)((char *)v10 + *(_QWORD *)(v11 - 24));
  if (v12[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v12);
    v13 = std::locale::use_facet(&v41, MEMORY[0x24BEDB350]);
    v14 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 32);
    std::locale::~locale(&v41);
    v12[1].__fmtflags_ = v14;
  }
  v12[1].__fmtflags_ = 48;
  v15 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)")", 1);
  if ((v30 & 0x10) != 0)
  {
    v17 = *((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1) < (unint64_t)v27)
    {
      *((_QWORD *)&v29 + 1) = v27;
      v17 = v27;
    }
    v18 = __src[1];
    v16 = v17 - (unint64_t)__src[1];
    if (v17 - (unint64_t)__src[1] >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_20;
  }
  else
  {
    if ((v30 & 8) == 0)
    {
      v16 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    v18 = (const void *)v25;
    v16 = (size_t)__src[0] - v25;
    if ((char *)__src[0] - (unint64_t)v25 >= (void *)0x7FFFFFFFFFFFFFF8)
LABEL_20:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v16 >= 0x17)
  {
    v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v19 = v16 | 7;
    v20 = v19 + 1;
    v21 = operator new(v19 + 1);
    *((_QWORD *)a1 + 1) = v16;
    *((_QWORD *)a1 + 2) = v20 | 0x8000000000000000;
    *(_QWORD *)a1 = v21;
    a1 = v21;
    goto LABEL_15;
  }
  a1[23] = v16;
  if (v16)
LABEL_15:
    memmove(a1, v18, v16);
LABEL_16:
  a1[v16] = 0;
  v23 = *v5;
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v5[3];
  *(_QWORD *)&v24 = v8 + 16;
  if (SBYTE7(v29) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x212BC1680](&v31);
}

void sub_20E609944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  std::locale::~locale((std::locale *)(v9 - 88));
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_20E609960(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x212BC1680](v1);
  _Unwind_Resume(a1);
}

void ctl::tlv::print_tlv_field(unsigned __int8 *a1@<X0>, xpc_object_t *a2@<X8>)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  void **v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  void **v11;
  xpc_object_t v12;
  xpc_object_t v13;
  void *__p[2];
  char v15;
  xpc_object_t v16;
  xpc_object_t value;

  *a2 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_array_create(0, 0);
  v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BC1854](v5) == MEMORY[0x24BDACF78])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  print_tlv_field_as<unsigned char,qmi::ServiceType>(__p, *a1);
  if (v15 >= 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  v8 = xpc_string_create((const char *)v7);
  v16 = v8;
  if (!v8)
  {
    v8 = xpc_null_create();
    v16 = v8;
  }
  print_tlv_field_pair("fSvcType", &v16, &value);
  v9 = *a2;
  v10 = value;
  xpc_array_append_value(*a2, value);
  xpc_release(v10);
  value = 0;
  xpc_release(v8);
  if (v15 < 0)
    operator delete(__p[0]);
  print_char_type(__p);
  if (v15 >= 0)
    v11 = __p;
  else
    v11 = (void **)__p[0];
  v12 = xpc_string_create((const char *)v11);
  v16 = v12;
  if (!v12)
  {
    v12 = xpc_null_create();
    v16 = v12;
  }
  print_tlv_field_pair("fClientId", &v16, &value);
  v13 = value;
  xpc_array_append_value(v9, value);
  xpc_release(v13);
  value = 0;
  xpc_release(v12);
  if (v15 < 0)
    operator delete(__p[0]);
}

{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  void **v7;
  xpc_object_t v8;
  xpc_object_t v9;
  void *__p[2];
  char v11;
  xpc_object_t v12;
  xpc_object_t value;

  *a2 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_array_create(0, 0);
  v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BC1854](v5) == MEMORY[0x24BDACF78])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  print_tlv_field_as<unsigned char,qmi::ServiceType>(__p, *a1);
  if (v11 >= 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  v8 = xpc_string_create((const char *)v7);
  v12 = v8;
  if (!v8)
  {
    v8 = xpc_null_create();
    v12 = v8;
  }
  print_tlv_field_pair("fSvcType", &v12, &value);
  v9 = value;
  xpc_array_append_value(*a2, value);
  xpc_release(v9);
  value = 0;
  xpc_release(v8);
  if (v11 < 0)
    operator delete(__p[0]);
}

void sub_20E609BA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  xpc_object_t *v17;
  void *v18;
  void *v19;

  xpc_release(v19);
  xpc_release(v18);
  if (a15 < 0)
  {
    operator delete(__p);
    xpc::array::~array(v17);
    _Unwind_Resume(a1);
  }
  xpc::array::~array(v17);
  _Unwind_Resume(a1);
}

void xpc::array::~array(xpc_object_t *this)
{
  xpc_release(*this);
  *this = 0;
}

uint64_t ctl::tlv::build_tlv_field(xpc_object_t *a1, _BYTE *a2)
{
  uint64_t v4;
  std::runtime_error *exception;
  xpc_object_t object;
  BOOL v8;

  extract_tlv_field(a1, "fSvcType", 0, &object);
  *a2 = sAttemptDecodeNumber(&object, &v8);
  xpc_release(object);
  extract_tlv_field(a1, "fClientId", 1uLL, &object);
  v8 = 0;
  v4 = sAttemptDecodeNumber(&object, &v8);
  if (!v8 || v4 >= 0x100)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "UInt8 field is a number but out of range");
    exception->__vftable = (std::runtime_error_vtbl *)off_24C9755C8;
  }
  a2[1] = v4;
  xpc_release(object);
  return 2;
}

{
  xpc_object_t object;
  BOOL v5;

  extract_tlv_field(a1, "fSvcType", 0, &object);
  *a2 = sAttemptDecodeNumber(&object, &v5);
  xpc_release(object);
  return 1;
}

void sub_20E609D68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  void *v9;

  __cxa_free_exception(v9);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void ctl::tlv::print_tlv_field(xpc_object_t *a1@<X8>)
{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  void **v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *__p[2];
  char v9;
  xpc_object_t v10;
  xpc_object_t value;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v2 = xpc_array_create(0, 0);
  v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      v4 = xpc_null_create();
      v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BC1854](v3) == MEMORY[0x24BDACF78])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  print_tlv_field_as<unsigned short,ctl::LinkLayerProtocol>(__p);
  if (v9 >= 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  v6 = xpc_string_create((const char *)v5);
  v10 = v6;
  if (!v6)
  {
    v6 = xpc_null_create();
    v10 = v6;
  }
  print_tlv_field_pair("fProtocol", &v10, &value);
  v7 = value;
  xpc_array_append_value(*a1, value);
  xpc_release(v7);
  value = 0;
  xpc_release(v6);
  if (v9 < 0)
    operator delete(__p[0]);
}

{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  std::ios_base *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  const std::ios_base *v15;
  const std::locale::facet *v16;
  std::ios_base::fmtflags v17;
  _QWORD *v18;
  size_t v19;
  void **v20;
  uint64_t v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  xpc_object_t v26;
  xpc_object_t v27;
  void *__dst[2];
  int64_t v29;
  xpc_object_t v30;
  xpc_object_t value;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  void *__p[2];
  __int128 v38;
  unint64_t v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  std::locale v50;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v2 = xpc_array_create(0, 0);
  v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      v4 = xpc_null_create();
      v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BC1854](v3) == MEMORY[0x24BDACF78])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v39 = 0xAAAAAAAAAAAAAAAALL;
  v49 = v5;
  v48 = v5;
  v47 = v5;
  v46 = v5;
  v45 = v5;
  v44 = v5;
  v43 = v5;
  v42 = v5;
  v41 = v5;
  v38 = v5;
  *(_OWORD *)__p = v5;
  v36 = v5;
  v35 = v5;
  v34 = v5;
  v33 = v5;
  v6 = MEMORY[0x24BEDB870];
  v7 = MEMORY[0x24BEDB870] + 64;
  v40 = MEMORY[0x24BEDB870] + 64;
  v8 = (uint64_t *)MEMORY[0x24BEDB800];
  v9 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v32 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v32 + *(_QWORD *)(v32 - 24)) = v9;
  v10 = (std::ios_base *)((char *)&v32 + *(_QWORD *)(v32 - 24));
  std::ios_base::init(v10, &v33);
  v10[1].__vftable = 0;
  v10[1].__fmtflags_ = -1;
  v32 = v6 + 24;
  v40 = v7;
  std::streambuf::basic_streambuf();
  v11 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v33 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v38 = 0u;
  LODWORD(v39) = 16;
  *(_DWORD *)((char *)&v32 + *(_QWORD *)(v32 - 24) + 8) = *(_DWORD *)((_BYTE *)&v32 + *(_QWORD *)(v32 - 24) + 8) & 0xFFFFFFB5 | 2;
  v12 = (_QWORD *)std::ostream::operator<<();
  v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" (0x", 4);
  v14 = *v13;
  *(_DWORD *)((char *)v13 + *(_QWORD *)(*v13 - 24) + 8) = *(_DWORD *)((_BYTE *)v13 + *(_QWORD *)(*v13 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v13 + *(_QWORD *)(v14 - 24) + 24) = 2;
  v15 = (const std::ios_base *)((char *)v13 + *(_QWORD *)(v14 - 24));
  if (v15[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v15);
    v16 = std::locale::use_facet(&v50, MEMORY[0x24BEDB350]);
    v17 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v16->__vftable[2].~facet_0)(v16, 32);
    std::locale::~locale(&v50);
    v15[1].__fmtflags_ = v17;
  }
  v15[1].__fmtflags_ = 48;
  v18 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)")", 1);
  if ((v39 & 0x10) != 0)
  {
    v21 = *((_QWORD *)&v38 + 1);
    if (*((_QWORD *)&v38 + 1) < (unint64_t)v36)
    {
      *((_QWORD *)&v38 + 1) = v36;
      v21 = v36;
    }
    v22 = (const void *)*((_QWORD *)&v35 + 1);
    v19 = v21 - *((_QWORD *)&v35 + 1);
    if ((unint64_t)(v21 - *((_QWORD *)&v35 + 1)) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_35;
  }
  else
  {
    if ((v39 & 8) == 0)
    {
      v19 = 0;
      HIBYTE(v29) = 0;
      v20 = __dst;
      goto LABEL_24;
    }
    v22 = (const void *)v34;
    v19 = v35 - v34;
    if ((_QWORD)v35 - (_QWORD)v34 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_35:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v19 >= 0x17)
  {
    v23 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17)
      v23 = v19 | 7;
    v24 = v23 + 1;
    v20 = (void **)operator new(v23 + 1);
    __dst[1] = (void *)v19;
    v29 = v24 | 0x8000000000000000;
    __dst[0] = v20;
    goto LABEL_23;
  }
  HIBYTE(v29) = v19;
  v20 = __dst;
  if (v19)
LABEL_23:
    memmove(v20, v22, v19);
LABEL_24:
  *((_BYTE *)v20 + v19) = 0;
  v32 = *v8;
  *(uint64_t *)((char *)&v32 + *(_QWORD *)(v32 - 24)) = v8[3];
  *(_QWORD *)&v33 = v11 + 16;
  if (SBYTE7(v38) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BC1680](&v40);
  if (v29 >= 0)
    v25 = (const char *)__dst;
  else
    v25 = (const char *)__dst[0];
  v26 = xpc_string_create(v25);
  v30 = v26;
  if (!v26)
  {
    v26 = xpc_null_create();
    v30 = v26;
  }
  print_tlv_field_pair("fFormat", &v30, &value);
  v27 = value;
  xpc_array_append_value(*a1, value);
  xpc_release(v27);
  value = 0;
  xpc_release(v26);
  if (SHIBYTE(v29) < 0)
    operator delete(__dst[0]);
}

{
  xpc_object_t v2;
  xpc_object_t v3;
  xpc_object_t v4;
  void **v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *__p[2];
  char v9;
  xpc_object_t v10;
  xpc_object_t value;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v2 = xpc_array_create(0, 0);
  v3 = v2;
  if (v2)
  {
    *a1 = v2;
  }
  else
  {
    v3 = xpc_null_create();
    *a1 = v3;
    if (!v3)
    {
      v4 = xpc_null_create();
      v3 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BC1854](v3) == MEMORY[0x24BDACF78])
  {
    xpc_retain(v3);
    goto LABEL_9;
  }
  v4 = xpc_null_create();
LABEL_8:
  *a1 = v4;
LABEL_9:
  xpc_release(v3);
  print_number_field<unsigned int>(__p);
  if (v9 >= 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  v6 = xpc_string_create((const char *)v5);
  v10 = v6;
  if (!v6)
  {
    v6 = xpc_null_create();
    v10 = v6;
  }
  print_tlv_field_pair("fHandle", &v10, &value);
  v7 = value;
  xpc_array_append_value(*a1, value);
  xpc_release(v7);
  value = 0;
  xpc_release(v6);
  if (v9 < 0)
    operator delete(__p[0]);
}

void sub_20E609EF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  xpc_object_t *v17;
  void *v18;
  void *v19;
  void *v20;

  v20 = v19;
  xpc_release(v20);
  xpc_release(v18);
  if (a15 < 0)
  {
    operator delete(__p);
    xpc::array::~array(v17);
    _Unwind_Resume(a1);
  }
  xpc::array::~array(v17);
  _Unwind_Resume(a1);
}

uint64_t ctl::tlv::build_tlv_field(xpc_object_t *a1, _DWORD *a2)
{
  xpc_object_t object;
  BOOL v5;

  extract_tlv_field(a1, "fProtocol", 0, &object);
  *a2 = sAttemptDecodeNumber(&object, &v5);
  xpc_release(object);
  return 1;
}

{
  xpc_object_t object;
  BOOL v5;

  extract_tlv_field(a1, "fFormat", 0, &object);
  *a2 = sAttemptDecodeNumber(&object, &v5);
  xpc_release(object);
  return 1;
}

{
  uint64_t v3;
  std::runtime_error *exception;
  xpc_object_t object;
  BOOL v8;

  extract_tlv_field(a1, "fHandle", 0, &object);
  v8 = 0;
  v3 = sAttemptDecodeNumber(&object, &v8);
  if (!v8 || HIDWORD(v3) != 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "UInt32 field is a number but out of range");
    exception->__vftable = (std::runtime_error_vtbl *)off_24C9755C8;
  }
  *a2 = v3;
  xpc_release(object);
  return 1;
}

void sub_20E609FC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void ctl::tlv::print_tlv_field(uint64_t a1@<X0>, xpc_object_t *a2@<X8>)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  void **v7;
  xpc_object_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  void **v11;
  xpc_object_t v12;
  xpc_object_t v13;
  void *__p[2];
  char v15;
  xpc_object_t v16;
  xpc_object_t value;

  *a2 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_array_create(0, 0);
  v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BC1854](v5) == MEMORY[0x24BDACF78])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  print_number_field<unsigned int>(__p);
  if (v15 >= 0)
    v7 = __p;
  else
    v7 = (void **)__p[0];
  v8 = xpc_string_create((const char *)v7);
  v16 = v8;
  if (!v8)
  {
    v8 = xpc_null_create();
    v16 = v8;
  }
  print_tlv_field_pair("fHandle", &v16, &value);
  v9 = *a2;
  v10 = value;
  xpc_array_append_value(*a2, value);
  xpc_release(v10);
  value = 0;
  xpc_release(v8);
  if (v15 < 0)
    operator delete(__p[0]);
  print_tlv_field_as<unsigned char,qmi::ServiceType>(__p, *(unsigned __int8 *)(a1 + 4));
  if (v15 >= 0)
    v11 = __p;
  else
    v11 = (void **)__p[0];
  v12 = xpc_string_create((const char *)v11);
  v16 = v12;
  if (!v12)
  {
    v12 = xpc_null_create();
    v16 = v12;
  }
  print_tlv_field_pair("fSvcType", &v16, &value);
  v13 = value;
  xpc_array_append_value(v9, value);
  xpc_release(v13);
  value = 0;
  xpc_release(v12);
  if (v15 < 0)
    operator delete(__p[0]);
}

void sub_20E60A1BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  xpc_object_t *v17;
  void *v18;
  void *v19;

  xpc_release(v19);
  xpc_release(v18);
  if (a15 < 0)
  {
    operator delete(__p);
    xpc::array::~array(v17);
    _Unwind_Resume(a1);
  }
  xpc::array::~array(v17);
  _Unwind_Resume(a1);
}

uint64_t ctl::tlv::build_tlv_field(xpc_object_t *a1, uint64_t a2)
{
  uint64_t v4;
  std::runtime_error *exception;
  xpc_object_t object;
  BOOL v9;

  extract_tlv_field(a1, "fHandle", 0, &object);
  v9 = 0;
  v4 = sAttemptDecodeNumber(&object, &v9);
  if (!v9 || HIDWORD(v4) != 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "UInt32 field is a number but out of range");
    exception->__vftable = (std::runtime_error_vtbl *)off_24C9755C8;
  }
  *(_DWORD *)a2 = v4;
  xpc_release(object);
  extract_tlv_field(a1, "fSvcType", 1uLL, &object);
  *(_BYTE *)(a2 + 4) = sAttemptDecodeNumber(&object, &v9);
  xpc_release(object);
  return 2;
}

void sub_20E60A358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  void *v9;

  __cxa_free_exception(v9);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void ctl::tlv::print_tlv_field(uint64_t *a1@<X0>, xpc_object_t *a2@<X8>)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t object;
  xpc_object_t v10;
  xpc_object_t value;

  *a2 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_array_create(0, 0);
  v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BC1854](v5) == MEMORY[0x24BDACF78])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  print_tlv_field<unsigned short>(&object, a1);
  v7 = object;
  v10 = object;
  if (object)
  {
    xpc_retain(object);
  }
  else
  {
    v7 = xpc_null_create();
    v10 = v7;
  }
  print_tlv_field_pair("fEnabledIndSet", &v10, &value);
  v8 = value;
  xpc_array_append_value(*a2, value);
  xpc_release(v8);
  value = 0;
  xpc_release(v7);
  v10 = 0;
  xpc_release(object);
}

{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t v7;
  xpc_object_t v8;
  xpc_object_t object;
  xpc_object_t v10;
  xpc_object_t value;

  *a2 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_array_create(0, 0);
  v5 = v4;
  if (v4)
  {
    *a2 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    *a2 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BC1854](v5) == MEMORY[0x24BDACF78])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  *a2 = v6;
LABEL_9:
  xpc_release(v5);
  print_tlv_field<unsigned short>(&object, a1);
  v7 = object;
  v10 = object;
  if (object)
  {
    xpc_retain(object);
  }
  else
  {
    v7 = xpc_null_create();
    v10 = v7;
  }
  print_tlv_field_pair("fEnabledIndSet", &v10, &value);
  v8 = value;
  xpc_array_append_value(*a2, value);
  xpc_release(v8);
  value = 0;
  xpc_release(v7);
  v10 = 0;
  xpc_release(object);
}

void sub_20E60A4C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, uint64_t a12)
{
  xpc_object_t *v12;
  void *v13;
  void *v14;
  void *v15;

  v15 = v14;
  xpc_release(v15);
  xpc_release(v13);
  xpc_release(object);
  xpc::array::~array(v12);
  _Unwind_Resume(a1);
}

void print_tlv_field<unsigned short>(xpc_object_t *a1, uint64_t *a2)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  uint64_t v7;
  uint64_t v8;
  void **v9;
  xpc_object_t v10;
  void *__p[2];
  char v12;

  *a1 = (xpc_object_t)0xAAAAAAAAAAAAAAAALL;
  v4 = xpc_array_create(0, 0);
  v5 = v4;
  if (v4)
  {
    *a1 = v4;
  }
  else
  {
    v5 = xpc_null_create();
    *a1 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BC1854](v5) == MEMORY[0x24BDACF78])
  {
    xpc_retain(v5);
    goto LABEL_9;
  }
  v6 = xpc_null_create();
LABEL_8:
  *a1 = v6;
LABEL_9:
  xpc_release(v5);
  v7 = *a2;
  v8 = a2[1];
  if (*a2 != v8)
  {
    do
    {
      print_number_field<unsigned short>(__p);
      if (v12 >= 0)
        v9 = __p;
      else
        v9 = (void **)__p[0];
      v10 = xpc_string_create((const char *)v9);
      if (!v10)
        v10 = xpc_null_create();
      xpc_array_append_value(*a1, v10);
      xpc_release(v10);
      if (v12 < 0)
        operator delete(__p[0]);
      v7 += 2;
    }
    while (v7 != v8);
  }
}

void sub_20E60A664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  xpc_object_t *v15;
  void *v16;

  xpc_release(v16);
  if (a15 < 0)
  {
    operator delete(__p);
    xpc::array::~array(v15);
    _Unwind_Resume(a1);
  }
  xpc::array::~array(v15);
  _Unwind_Resume(a1);
}

uint64_t ctl::tlv::build_tlv_field(xpc_object_t *a1, _QWORD *a2)
{
  xpc_object_t object;

  extract_tlv_field(a1, "fEnabledIndSet", 0, &object);
  tlv::build_tlv_field<unsigned short>(&object, a2);
  xpc_release(object);
  return 1;
}

{
  xpc_object_t object;

  extract_tlv_field(a1, "fEnabledIndSet", 0, &object);
  tlv::build_tlv_field<unsigned short>(&object, a2);
  xpc_release(object);
  return 1;
}

void sub_20E60A700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void tlv::build_tlv_field<unsigned short>(_QWORD *a1, _QWORD *a2)
{
  xpc_object_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  size_t count;
  unint64_t v9;
  char *v10;
  _BYTE *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  __int128 *v21;
  unint64_t v22;
  __int128 v23;
  __int16 v24;
  xpc_object_t v25;
  void *v26;
  xpc_object_t v27;
  size_t v28;
  size_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  _WORD *v40;
  int64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  _OWORD *v46;
  char *v47;
  unint64_t v48;
  __int128 v49;
  __int16 v50;
  xpc_object_t value;
  uint64_t v52;
  uint64_t v53;
  std::runtime_error *exception;
  xpc_object_t xarray;
  xpc_object_t v56;
  xpc_object_t object;
  BOOL v58;

  tlv::throwIfNotArray(a1);
  v4 = (xpc_object_t)*a1;
  v5 = MEMORY[0x24BDACF78];
  if (*a1 && MEMORY[0x212BC1854](*a1) == v5)
    xpc_retain(v4);
  else
    v4 = xpc_null_create();
  v7 = (char *)*a2;
  v6 = a2[1];
  xarray = v4;
  if (MEMORY[0x212BC1854](v4) == v5)
    count = xpc_array_get_count(v4);
  else
    count = 0;
  v9 = count + ((v6 - (uint64_t)v7) >> 1);
  v10 = (char *)*a2;
  if (v9 <= (uint64_t)(a2[2] - *a2) >> 1)
    goto LABEL_20;
  if ((v9 & 0x8000000000000000) != 0)
    std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
  v11 = (_BYTE *)a2[1];
  v12 = (char *)operator new(2 * v9);
  v13 = v11 - v10;
  v14 = &v12[(v11 - v10) & 0xFFFFFFFFFFFFFFFELL];
  v15 = v14;
  if (v11 != v10)
  {
    if ((unint64_t)(v13 - 2) < 0x1E)
    {
      v15 = &v12[(v11 - v10) & 0xFFFFFFFFFFFFFFFELL];
      do
      {
LABEL_17:
        v24 = *((_WORD *)v11 - 1);
        v11 -= 2;
        *((_WORD *)v15 - 1) = v24;
        v15 -= 2;
      }
      while (v11 != v10);
      goto LABEL_18;
    }
    v15 = &v12[(v11 - v10) & 0xFFFFFFFFFFFFFFFELL];
    if ((unint64_t)(v11 - &v12[v13 & 0xFFFFFFFFFFFFFFFELL]) < 0x20)
      goto LABEL_17;
    v16 = v13 >> 1;
    v17 = ((unint64_t)(v13 - 2) >> 1) + 1;
    v18 = 2 * (v17 & 0xFFFFFFFFFFFFFFF0);
    v19 = &v11[-v18];
    v15 = &v14[-v18];
    v20 = &v12[2 * v16 - 16];
    v21 = (__int128 *)(v11 - 16);
    v22 = v17 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      v23 = *v21;
      *((_OWORD *)v20 - 1) = *(v21 - 1);
      *(_OWORD *)v20 = v23;
      v20 -= 32;
      v21 -= 2;
      v22 -= 16;
    }
    while (v22);
    v11 = v19;
    if (v17 != (v17 & 0xFFFFFFFFFFFFFFF0))
      goto LABEL_17;
  }
LABEL_18:
  *a2 = v15;
  a2[1] = v14;
  a2[2] = &v12[2 * v9];
  if (v10)
    operator delete(v10);
LABEL_20:
  if (xarray)
  {
    xpc_retain(xarray);
    v25 = xarray;
LABEL_23:
    xpc_retain(v25);
    v26 = v25;
    goto LABEL_24;
  }
  v25 = xpc_null_create();
  if (v25)
    goto LABEL_23;
  v25 = xpc_null_create();
  v26 = 0;
LABEL_24:
  xpc_release(v26);
  if (xarray)
  {
    xpc_retain(xarray);
    v27 = xarray;
  }
  else
  {
    v27 = xpc_null_create();
  }
  if (MEMORY[0x212BC1854](xarray) == v5)
  {
    v28 = xpc_array_get_count(xarray);
    if (v27)
      goto LABEL_29;
LABEL_31:
    v56 = xpc_null_create();
    goto LABEL_32;
  }
  v28 = 0;
  if (!v27)
    goto LABEL_31;
LABEL_29:
  xpc_retain(v27);
  v56 = v27;
LABEL_32:
  xpc_release(v27);
  if (v28 || v25 != v56)
  {
    v29 = 0;
    while (1)
    {
      v31 = (char *)a2[1];
      v30 = a2[2];
      if ((unint64_t)v31 >= v30)
        break;
      *(_WORD *)v31 = 0;
      v32 = (uint64_t)(v31 + 2);
LABEL_57:
      a2[1] = v32;
      value = xpc_array_get_value(v25, v29);
      object = value;
      if (value)
        xpc_retain(value);
      else
        object = xpc_null_create();
      v52 = a2[1];
      v58 = 0;
      v53 = sAttemptDecodeNumber(&object, &v58);
      if (!v58 || v53 >= 0x10000)
      {
        exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
        std::runtime_error::runtime_error(exception, "UInt16 field is a number but out of range");
        exception->__vftable = (std::runtime_error_vtbl *)off_24C9755C8;
      }
      *(_WORD *)(v52 - 2) = v53;
      xpc_release(object);
      if (++v29 == v28 && v25 == v56)
        goto LABEL_64;
    }
    v33 = (char *)*a2;
    v34 = (uint64_t)&v31[-*a2];
    if (v34 <= -3)
      std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
    v35 = v34 >> 1;
    v36 = v30 - (_QWORD)v33;
    if (v36 <= (v34 >> 1) + 1)
      v37 = v35 + 1;
    else
      v37 = v36;
    if (v36 >= 0x7FFFFFFFFFFFFFFELL)
      v38 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v38 = v37;
    if (v38)
    {
      if (v38 < 0)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v39 = operator new(2 * v38);
      v40 = &v39[2 * v35];
      *v40 = 0;
      v32 = (uint64_t)(v40 + 1);
      v41 = v31 - v33;
      if (v31 == v33)
        goto LABEL_55;
    }
    else
    {
      v39 = 0;
      v40 = (_WORD *)(2 * v35);
      *(_WORD *)(2 * v35) = 0;
      v32 = 2 * v35 + 2;
      v41 = v31 - v33;
      if (v31 == v33)
      {
LABEL_55:
        *a2 = v40;
        a2[1] = v32;
        a2[2] = &v39[2 * v38];
        if (v33)
          operator delete(v33);
        goto LABEL_57;
      }
    }
    v42 = v41 - 2;
    if (v42 < 0x1E)
      goto LABEL_72;
    if (v31 - v39 - (v34 & 0xFFFFFFFFFFFFFFFELL) < 0x20)
      goto LABEL_72;
    v43 = (v42 >> 1) + 1;
    v44 = 2 * (v43 & 0xFFFFFFFFFFFFFFF0);
    v45 = &v31[-v44];
    v40 = (_WORD *)((char *)v40 - v44);
    v46 = &v39[2 * v35 - 16];
    v47 = v31 - 16;
    v48 = v43 & 0xFFFFFFFFFFFFFFF0;
    do
    {
      v49 = *(_OWORD *)v47;
      *(v46 - 1) = *((_OWORD *)v47 - 1);
      *v46 = v49;
      v46 -= 2;
      v47 -= 32;
      v48 -= 16;
    }
    while (v48);
    v31 = v45;
    if (v43 != (v43 & 0xFFFFFFFFFFFFFFF0))
    {
LABEL_72:
      do
      {
        v50 = *((_WORD *)v31 - 1);
        v31 -= 2;
        *--v40 = v50;
      }
      while (v31 != v33);
    }
    goto LABEL_55;
  }
LABEL_64:
  xpc_release(v56);
  xpc_release(v25);
  xpc_release(xarray);
}

void sub_20E60AB94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object, xpc_object_t a10, xpc_object_t a11)
{
  void *v11;
  void *v12;

  xpc_release(v12);
  xpc_release(v11);
  xpc_release(object);
  _Unwind_Resume(a1);
}

void sub_20E60AD44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object, uint64_t a11, uint64_t a12)
{
  xpc_object_t *v12;
  void *v13;
  void *v14;
  void *v15;

  v15 = v14;
  xpc_release(v15);
  xpc_release(v13);
  xpc_release(object);
  xpc::array::~array(v12);
  _Unwind_Resume(a1);
}

void sub_20E60ADFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void sub_20E60AF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  xpc_object_t *v17;
  void *v18;
  void *v19;
  void *v20;

  v20 = v19;
  xpc_release(v20);
  xpc_release(v18);
  if (a15 < 0)
  {
    operator delete(__p);
    xpc::array::~array(v17);
    _Unwind_Resume(a1);
  }
  xpc::array::~array(v17);
  _Unwind_Resume(a1);
}

void sub_20E60B028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void sub_20E60B460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, char a18)
{
  xpc_object_t *v18;
  uint64_t v19;

  std::locale::~locale((std::locale *)(v19 - 88));
  std::ostringstream::~ostringstream((uint64_t)&a18);
  xpc::array::~array(v18);
  _Unwind_Resume(a1);
}

void sub_20E60B578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void sub_20E60B6DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  xpc_object_t *v17;
  void *v18;
  void *v19;
  void *v20;

  v20 = v19;
  xpc_release(v20);
  xpc_release(v18);
  if (a15 < 0)
  {
    operator delete(__p);
    xpc::array::~array(v17);
    _Unwind_Resume(a1);
  }
  xpc::array::~array(v17);
  _Unwind_Resume(a1);
}

void sub_20E60B7FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  void *v9;

  __cxa_free_exception(v9);
  xpc_release(object);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB800];
  v3 = *MEMORY[0x24BEDB800];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB800];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 95) < 0)
    operator delete(*(void **)(a1 + 72));
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BC1680](a1 + 112);
  return a1;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

uint64_t print_tlv_field_as<unsigned char,qmi::ServiceType>(_BYTE *a1, int a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  std::ios_base *v9;
  uint64_t v10;
  const char *v11;
  size_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  const std::ios_base *v16;
  const std::locale::facet *v17;
  std::ios_base::fmtflags v18;
  _QWORD *v19;
  size_t v20;
  uint64_t v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  void *__src[2];
  __int128 v31;
  void *__p[2];
  __int128 v33;
  unint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  std::locale v45;

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v34 = 0xAAAAAAAAAAAAAAAALL;
  v44 = v4;
  v43 = v4;
  v42 = v4;
  v41 = v4;
  v40 = v4;
  v39 = v4;
  v38 = v4;
  v37 = v4;
  v36 = v4;
  v33 = v4;
  *(_OWORD *)__p = v4;
  v31 = v4;
  *(_OWORD *)__src = v4;
  v29 = v4;
  v28 = v4;
  v5 = MEMORY[0x24BEDB870];
  v6 = MEMORY[0x24BEDB870] + 64;
  v35 = MEMORY[0x24BEDB870] + 64;
  v7 = (uint64_t *)MEMORY[0x24BEDB800];
  v8 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v27 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v27 + *(_QWORD *)(v27 - 24)) = v8;
  v9 = (std::ios_base *)((char *)&v27 + *(_QWORD *)(v27 - 24));
  std::ios_base::init(v9, &v28);
  v9[1].__vftable = 0;
  v9[1].__fmtflags_ = -1;
  v27 = v5 + 24;
  v35 = v6;
  std::streambuf::basic_streambuf();
  v10 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v28 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v33 = 0u;
  LODWORD(v34) = 16;
  *(_DWORD *)((char *)&v27 + *(_QWORD *)(v27 - 24) + 8) = *(_DWORD *)((_BYTE *)&v27 + *(_QWORD *)(v27 - 24) + 8) & 0xFFFFFFB5 | 2;
  v11 = qmi::asShortString(a2);
  v12 = strlen(v11);
  v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v27, (uint64_t)v11, v12);
  v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)" (0x", 4);
  v15 = *v14;
  *(_DWORD *)((char *)v14 + *(_QWORD *)(*v14 - 24) + 8) = *(_DWORD *)((_BYTE *)v14 + *(_QWORD *)(*v14 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v14 + *(_QWORD *)(v15 - 24) + 24) = 2;
  v16 = (const std::ios_base *)((char *)v14 + *(_QWORD *)(v15 - 24));
  if (v16[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v16);
    v17 = std::locale::use_facet(&v45, MEMORY[0x24BEDB350]);
    v18 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v17->__vftable[2].~facet_0)(v17, 32);
    std::locale::~locale(&v45);
    v16[1].__fmtflags_ = v18;
  }
  v16[1].__fmtflags_ = 48;
  v19 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)")", 1);
  if ((v34 & 0x10) != 0)
  {
    v21 = *((_QWORD *)&v33 + 1);
    if (*((_QWORD *)&v33 + 1) < (unint64_t)v31)
    {
      *((_QWORD *)&v33 + 1) = v31;
      v21 = v31;
    }
    v22 = __src[1];
    v20 = v21 - (unint64_t)__src[1];
    if (v21 - (unint64_t)__src[1] >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_20;
  }
  else
  {
    if ((v34 & 8) == 0)
    {
      v20 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    v22 = (const void *)v29;
    v20 = (size_t)__src[0] - v29;
    if ((char *)__src[0] - (unint64_t)v29 >= (void *)0x7FFFFFFFFFFFFFF8)
LABEL_20:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v20 >= 0x17)
  {
    v23 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v20 | 7) != 0x17)
      v23 = v20 | 7;
    v24 = v23 + 1;
    v25 = operator new(v23 + 1);
    *((_QWORD *)a1 + 1) = v20;
    *((_QWORD *)a1 + 2) = v24 | 0x8000000000000000;
    *(_QWORD *)a1 = v25;
    a1 = v25;
    goto LABEL_15;
  }
  a1[23] = v20;
  if (v20)
LABEL_15:
    memmove(a1, v22, v20);
LABEL_16:
  a1[v20] = 0;
  v27 = *v7;
  *(uint64_t *)((char *)&v27 + *(_QWORD *)(v27 - 24)) = v7[3];
  *(_QWORD *)&v28 = v10 + 16;
  if (SBYTE7(v33) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x212BC1680](&v35);
}

void sub_20E60BC04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  std::locale::~locale((std::locale *)(v9 - 88));
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_20E60BC20(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x212BC1680](v1);
  _Unwind_Resume(a1);
}

void std::vector<unsigned short>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

std::runtime_error *tlv::TlvBuildException::TlvBuildException(std::runtime_error *a1, const std::string *a2)
{
  std::runtime_error *result;

  result = std::runtime_error::runtime_error(a1, a2);
  result->__vftable = (std::runtime_error_vtbl *)off_24C9755A0;
  return result;
}

{
  std::runtime_error *result;

  result = std::runtime_error::runtime_error(a1, a2);
  result->__vftable = (std::runtime_error_vtbl *)off_24C9755A0;
  return result;
}

std::runtime_error *tlv::TlvBuildException::TlvBuildException(std::runtime_error *this, const char *a2)
{
  std::runtime_error *result;

  result = std::runtime_error::runtime_error(this, a2);
  result->__vftable = (std::runtime_error_vtbl *)off_24C9755A0;
  return result;
}

{
  std::runtime_error *result;

  result = std::runtime_error::runtime_error(this, a2);
  result->__vftable = (std::runtime_error_vtbl *)off_24C9755A0;
  return result;
}

void tlv::TlvBuildException::~TlvBuildException(std::runtime_error *this)
{
  void *v1;

  std::runtime_error::~runtime_error(this);
  operator delete(v1);
}

std::runtime_error *tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(std::runtime_error *a1, const std::string *a2)
{
  std::runtime_error *result;

  result = std::runtime_error::runtime_error(a1, a2);
  result->__vftable = (std::runtime_error_vtbl *)off_24C9755C8;
  return result;
}

{
  std::runtime_error *result;

  result = std::runtime_error::runtime_error(a1, a2);
  result->__vftable = (std::runtime_error_vtbl *)off_24C9755C8;
  return result;
}

std::runtime_error *tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(std::runtime_error *this, const char *a2)
{
  std::runtime_error *result;

  result = std::runtime_error::runtime_error(this, a2);
  result->__vftable = (std::runtime_error_vtbl *)off_24C9755C8;
  return result;
}

{
  std::runtime_error *result;

  result = std::runtime_error::runtime_error(this, a2);
  result->__vftable = (std::runtime_error_vtbl *)off_24C9755C8;
  return result;
}

void tlv::TlvBuildUnexpectedField::~TlvBuildUnexpectedField(std::runtime_error *this)
{
  void *v1;

  std::runtime_error::~runtime_error(this);
  operator delete(v1);
}

size_t tlv::throwIfBinarySizeNotEqual(xpc_object_t *a1, uint64_t a2)
{
  size_t result;
  std::runtime_error *exception;

  if (MEMORY[0x212BC1854](*a1) == MEMORY[0x24BDACFE0])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Null object encountered");
    goto LABEL_8;
  }
  if (MEMORY[0x212BC1854](*a1) != MEMORY[0x24BDACF90])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Object encountered, but not a XPC_TYPE_DATA as expected");
    goto LABEL_8;
  }
  result = xpc_data_get_length(*a1);
  if (result != a2)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Object does not have exactly the right number of elements!");
LABEL_8:
  }
  return result;
}

void sub_20E60BE90(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20E60BEA4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20E60BEB8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t tlv::throwIfNotArray(_QWORD *a1)
{
  uint64_t result;
  std::runtime_error *exception;

  if (MEMORY[0x212BC1854](*a1) == MEMORY[0x24BDACFE0])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Null object encountered");
    goto LABEL_6;
  }
  result = MEMORY[0x212BC1854](*a1);
  if (result != MEMORY[0x24BDACF78])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Object encountered, but not a XPC_TYPE_ARRAY as expected");
LABEL_6:
  }
  return result;
}

void sub_20E60BF64(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20E60BF78(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t tlv::tryParseNumber(xpc_object_t *a1, unint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t value;
  char *string_ptr;
  size_t length;
  BOOL v10;
  BOOL v11;
  std::runtime_error *exception;
  char v13;
  void *__p[3];

  if (MEMORY[0x212BC1854](*a1) == MEMORY[0x24BDACFE0])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Null object encountered");
  }
  v4 = MEMORY[0x212BC1854](*a1);
  if (v4 == MEMORY[0x24BDACFD0])
  {
    value = xpc_int64_get_value(*a1);
    return value != 0;
  }
  if (v4 == MEMORY[0x24BDACFF8])
  {
    value = xpc_uint64_get_value(*a1);
    return value != 0;
  }
  if (v4 == MEMORY[0x24BDACF80])
    return xpc_BOOL_get_value(*a1);
  v5 = MEMORY[0x24BDACFF0];
  if (v4 != MEMORY[0x24BDACFF0])
    return 0;
  memset(__p, 170, sizeof(__p));
  if (MEMORY[0x212BC1854](*a1) == v5)
  {
    string_ptr = (char *)xpc_string_get_string_ptr(*a1);
    length = xpc_string_get_length(*a1);
    std::string::basic_string[abi:ne180100](__p, string_ptr, length);
  }
  else
  {
    memset(__p, 0, sizeof(__p));
  }
  v13 = 0;
  v10 = sAttemptDecodeNumber((uint64_t)__p, a2, &v13);
  if (v13)
    v11 = v10;
  else
    v11 = 0;
  if (v11)
  {
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
    return 1;
  }
  else
  {
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
    return 0;
  }
}

void sub_20E60C154(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

BOOL sAttemptDecodeNumber(uint64_t a1, unint64_t *a2, _BYTE *a3)
{
  uint64_t v5;
  size_t __idx;

  __idx = 0;
  *a2 = std::stoull((const std::string *)a1, &__idx, 0);
  *a3 = 1;
  v5 = *(unsigned __int8 *)(a1 + 23);
  if ((v5 & 0x80u) != 0)
    v5 = *(_QWORD *)(a1 + 8);
  return __idx == v5;
}

uint64_t tlv::tryParseNumber(xpc_object_t *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t value;
  char *string_ptr;
  size_t length;
  std::runtime_error *exception;
  unint64_t v11;
  char v12;
  void *__p[3];

  if (MEMORY[0x212BC1854](*a1) == MEMORY[0x24BDACFE0])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Null object encountered");
  }
  v4 = MEMORY[0x212BC1854](*a1);
  if (v4 == MEMORY[0x24BDACFD0])
  {
    value = xpc_int64_get_value(*a1);
    return value != 0;
  }
  if (v4 == MEMORY[0x24BDACFF8])
  {
    value = xpc_uint64_get_value(*a1);
    return value != 0;
  }
  if (v4 == MEMORY[0x24BDACF80])
    return xpc_BOOL_get_value(*a1);
  v5 = MEMORY[0x24BDACFF0];
  if (v4 != MEMORY[0x24BDACFF0])
    return 0;
  memset(__p, 170, sizeof(__p));
  if (MEMORY[0x212BC1854](*a1) == v5)
  {
    string_ptr = (char *)xpc_string_get_string_ptr(*a1);
    length = xpc_string_get_length(*a1);
    std::string::basic_string[abi:ne180100](__p, string_ptr, length);
  }
  else
  {
    memset(__p, 0, sizeof(__p));
  }
  v11 = 0;
  if (sAttemptDecodeNumber((uint64_t)__p, &v11, &v12))
  {
    *a2 = v11;
    if (SHIBYTE(__p[2]) < 0)
      operator delete(__p[0]);
    return 1;
  }
  else
  {
    if ((SHIBYTE(__p[2]) & 0x80000000) == 0)
      return 0;
    operator delete(__p[0]);
    return 0;
  }
}

void sub_20E60C43C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t tlv::parseEnumString(xpc_object_t *a1)
{
  BOOL v2;

  return sAttemptDecodeNumber(a1, &v2);
}

uint64_t sAttemptDecodeNumber(xpc_object_t *a1, BOOL *a2)
{
  uint64_t v4;
  uint64_t v5;
  int64_t value;
  char *string_ptr;
  size_t length;
  unint64_t v10;
  char *v11;
  size_t v12;
  void **v13;
  void **v14;
  _BYTE *v15;
  unint64_t v16;
  int v17;
  unint64_t v18;
  char *v19;
  size_t v20;
  void **v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  std::runtime_error *v25;
  std::runtime_error *exception;
  void *__dst[2];
  unint64_t v28;
  int64_t v29;
  void *__p[3];

  if (MEMORY[0x212BC1854](*a1) == MEMORY[0x24BDACFE0])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Null object encountered");
    goto LABEL_49;
  }
  v4 = MEMORY[0x212BC1854](*a1);
  if (v4 == MEMORY[0x24BDACFD0])
  {
    value = xpc_int64_get_value(*a1);
    *a2 = value >= 0;
  }
  else
  {
    if (v4 == MEMORY[0x24BDACFF8])
    {
      *a2 = 1;
      return xpc_uint64_get_value(*a1);
    }
    if (v4 != MEMORY[0x24BDACF80])
    {
      v5 = MEMORY[0x24BDACFF0];
      if (v4 == MEMORY[0x24BDACFF0])
      {
        memset(__p, 170, sizeof(__p));
        if (MEMORY[0x212BC1854](*a1) == v5)
        {
          string_ptr = (char *)xpc_string_get_string_ptr(*a1);
          length = xpc_string_get_length(*a1);
          std::string::basic_string[abi:ne180100](__p, string_ptr, length);
        }
        else
        {
          memset(__p, 0, sizeof(__p));
        }
        v29 = 0;
        if (sAttemptDecodeNumber((uint64_t)__p, (unint64_t *)&v29, a2))
        {
LABEL_44:
          value = v29;
          if (SHIBYTE(__p[2]) < 0)
            operator delete(__p[0]);
          return value;
        }
        v10 = HIBYTE(__p[2]);
        v11 = (char *)__p[1];
        if (SHIBYTE(__p[2]) >= 0)
          v12 = HIBYTE(__p[2]);
        else
          v12 = (size_t)__p[1];
        if (!v12)
          goto LABEL_47;
        v13 = (void **)__p[0];
        if (SHIBYTE(__p[2]) >= 0)
          v14 = __p;
        else
          v14 = (void **)__p[0];
        v15 = memchr(v14, 40, v12);
        v16 = v15 - (_BYTE *)v14;
        if (!v15)
          v16 = -1;
        do
        {
          if (!v12)
            goto LABEL_47;
          v17 = *((unsigned __int8 *)v14 + --v12);
        }
        while (v17 != 41);
        if (v16 >= v12 || v12 == -1)
        {
LABEL_47:
          v25 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
          std::runtime_error::runtime_error(v25, "String, but could not find a valid number");
          v25->__vftable = (std::runtime_error_vtbl *)off_24C9755C8;
        }
        if ((v10 & 0x80) != 0)
        {
          if ((unint64_t)v11 > v16)
          {
LABEL_30:
            v18 = v16 + 1;
            v19 = (char *)(~v16 + v12);
            if (&v11[-v18] >= v19)
              v20 = (size_t)v19;
            else
              v20 = (size_t)&v11[-v18];
            if (v20 >= 0x7FFFFFFFFFFFFFF8)
              std::string::__throw_length_error[abi:ne180100]();
            if (v20 >= 0x17)
            {
              v22 = (v20 & 0xFFFFFFFFFFFFFFF8) + 8;
              if ((v20 | 7) != 0x17)
                v22 = v20 | 7;
              v23 = v22 + 1;
              v21 = (void **)operator new(v22 + 1);
              __dst[1] = (void *)v20;
              v28 = v23 | 0x8000000000000000;
              __dst[0] = v21;
            }
            else
            {
              HIBYTE(v28) = v20;
              v21 = __dst;
              if (!v20)
              {
LABEL_41:
                *((_BYTE *)v21 + v20) = 0;
                v24 = sAttemptDecodeNumber((uint64_t)__dst, (unint64_t *)&v29, a2);
                if (SHIBYTE(v28) < 0)
                  operator delete(__dst[0]);
                if (v24)
                  goto LABEL_44;
                goto LABEL_47;
              }
            }
            memmove(v21, (char *)v13 + v18, v20);
            goto LABEL_41;
          }
        }
        else if (v16 < v10)
        {
          v13 = __p;
          v11 = (char *)v10;
          goto LABEL_30;
        }
        std::string::__throw_out_of_range[abi:ne180100]();
      }
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Non-number type encountered.");
LABEL_49:
    }
    *a2 = 1;
    return xpc_BOOL_get_value(*a1);
  }
  return value;
}

void sub_20E60C7D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((a22 & 0x80000000) == 0)
LABEL_3:
      _Unwind_Resume(exception_object);
  }
  else if ((a22 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a17);
  _Unwind_Resume(exception_object);
}

uint64_t tlv::build_tlv_field(xpc_object_t *a1, BOOL *a2)
{
  uint64_t result;
  std::runtime_error *exception;
  BOOL v6;

  v6 = 0;
  result = sAttemptDecodeNumber(a1, &v6);
  if (!v6 || result > 1)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Bool field is a number but out of range");
  }
  *a2 = result != 0;
  return result;
}

void sub_20E60C8E4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t tlv::build_tlv_field(xpc_object_t *a1, _BYTE *a2)
{
  uint64_t result;
  std::runtime_error *exception;
  BOOL v5;

  result = sAttemptDecodeNumber(a1, &v5);
  if (result != (char)result)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Int8 field is a number but out of range");
  }
  *a2 = result;
  return result;
}

{
  uint64_t result;
  std::runtime_error *exception;
  BOOL v5;

  v5 = 0;
  result = sAttemptDecodeNumber(a1, &v5);
  if (!v5 || result > 0xFF)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "UInt8 field is a number but out of range");
  }
  *a2 = result;
  return result;
}

void sub_20E60C960(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20E60C9E8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t tlv::build_tlv_field(xpc_object_t *a1, _WORD *a2)
{
  uint64_t result;
  std::runtime_error *exception;
  BOOL v5;

  result = sAttemptDecodeNumber(a1, &v5);
  if (result != (__int16)result)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Int16 field is a number but out of range");
  }
  *a2 = result;
  return result;
}

{
  uint64_t result;
  std::runtime_error *exception;
  BOOL v6;

  v6 = 0;
  result = sAttemptDecodeNumber(a1, &v6);
  if (!v6 || result >> 16 != 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "UInt16 field is a number but out of range");
  }
  *a2 = result;
  return result;
}

void sub_20E60CA64(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20E60CAF0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t tlv::build_tlv_field(xpc_object_t *a1, _DWORD *a2)
{
  uint64_t result;
  std::runtime_error *exception;
  BOOL v5;

  result = sAttemptDecodeNumber(a1, &v5);
  if (result != (int)result)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Bool field is a number but out of range");
  }
  *a2 = result;
  return result;
}

{
  uint64_t result;
  std::runtime_error *exception;
  BOOL v6;

  v6 = 0;
  result = sAttemptDecodeNumber(a1, &v6);
  if (!v6 || HIDWORD(result) != 0)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "UInt32 field is a number but out of range");
  }
  *a2 = result;
  return result;
}

void sub_20E60CB6C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20E60CBF8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t tlv::build_tlv_field(xpc_object_t *a1, uint64_t *a2)
{
  uint64_t result;
  std::runtime_error *exception;
  BOOL v5;

  v5 = 0;
  result = sAttemptDecodeNumber(a1, &v5);
  *a2 = result;
  if (!v5)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "UInt64 field is a number but is negative");
  }
  return result;
}

void sub_20E60CC78(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

float tlv::build_tlv_field(xpc_object_t *a1, float *a2)
{
  float result;
  double v4;

  v4 = NAN;
  tlv::build_tlv_field(a1, &v4);
  result = v4;
  *a2 = result;
  return result;
}

void tlv::build_tlv_field(xpc_object_t *a1, double *a2)
{
  uint64_t v4;
  uint64_t v5;
  double value;
  char *string_ptr;
  size_t length;
  std::runtime_error *exception;
  std::string __str;

  if (MEMORY[0x212BC1854](*a1) == MEMORY[0x24BDACFE0])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Null object encountered");
    goto LABEL_19;
  }
  v4 = MEMORY[0x212BC1854](*a1);
  if (v4 == MEMORY[0x24BDACFD0])
  {
    value = (double)xpc_int64_get_value(*a1);
LABEL_13:
    *a2 = value;
    return;
  }
  if (v4 == MEMORY[0x24BDACFF8])
  {
    value = (double)xpc_uint64_get_value(*a1);
    goto LABEL_13;
  }
  if (v4 == MEMORY[0x24BDACF80])
  {
    value = (double)xpc_BOOL_get_value(*a1);
    goto LABEL_13;
  }
  if (v4 == MEMORY[0x24BDACFA8])
  {
    value = xpc_double_get_value(*a1);
    goto LABEL_13;
  }
  v5 = MEMORY[0x24BDACFF0];
  if (v4 != MEMORY[0x24BDACFF0])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Non-number type encountered.");
LABEL_19:
  }
  memset(&__str, 170, sizeof(__str));
  if (MEMORY[0x212BC1854](*a1) == v5)
  {
    string_ptr = (char *)xpc_string_get_string_ptr(*a1);
    length = xpc_string_get_length(*a1);
    std::string::basic_string[abi:ne180100](&__str, string_ptr, length);
  }
  else
  {
    memset(&__str, 0, sizeof(__str));
  }
  *a2 = std::stod(&__str, 0);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
}

void sub_20E60CE74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  _Unwind_Resume(a1);
}

double tlv::build_tlv_field(xpc_object_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  double result;
  char v7;
  void **v8;
  _BYTE *v9;
  unint64_t v10;
  int v11;
  size_t v12;
  int v13;
  void **v14;
  char *v15;
  char *string_ptr;
  size_t length;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  size_t v21;
  __int128 *v22;
  uint64_t v23;
  uint64_t v24;
  std::runtime_error *exception;
  __int128 v26;
  unint64_t v27;
  void *__p[3];

  if (MEMORY[0x212BC1854](*a1) == MEMORY[0x24BDACFE0])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Null object encountered");
LABEL_46:
  }
  v4 = MEMORY[0x212BC1854](*a1);
  v5 = MEMORY[0x24BDACFF0];
  if (v4 != MEMORY[0x24BDACFF0])
  {
LABEL_44:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "String expected but got something else.");
    goto LABEL_46;
  }
  memset(__p, 170, sizeof(__p));
  if (MEMORY[0x212BC1854](*a1) != v5)
  {
    v7 = 0;
    memset(__p, 0, sizeof(__p));
    goto LABEL_21;
  }
  string_ptr = (char *)xpc_string_get_string_ptr(*a1);
  length = xpc_string_get_length(*a1);
  std::string::basic_string[abi:ne180100](__p, string_ptr, length);
  v7 = HIBYTE(__p[2]);
  v14 = (void **)__p[0];
  v15 = (char *)__p[1];
  v18 = HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0)
    v12 = HIBYTE(__p[2]);
  else
    v12 = (size_t)__p[1];
  if (!v12)
  {
LABEL_21:
    v13 = 1;
    if (v7 < 0)
      goto LABEL_25;
    goto LABEL_26;
  }
  if (SHIBYTE(__p[2]) >= 0)
    v8 = __p;
  else
    v8 = (void **)__p[0];
  v9 = memchr(v8, 34, v12);
  v10 = v9 - (_BYTE *)v8;
  if (!v9)
    v10 = -1;
  do
  {
    if (!v12)
    {
      v13 = 1;
      goto LABEL_24;
    }
    v11 = *((unsigned __int8 *)v8 + --v12);
  }
  while (v11 != 34);
  v13 = 1;
  if (v10 >= v12 || v12 == -1)
  {
LABEL_24:
    if ((v7 & 0x80) == 0)
      goto LABEL_26;
    goto LABEL_25;
  }
  if ((v7 & 0x80) == 0)
  {
    if (v10 < v18)
    {
      v14 = __p;
      v15 = (char *)v18;
      goto LABEL_29;
    }
LABEL_47:
    std::string::__throw_out_of_range[abi:ne180100]();
  }
  if ((unint64_t)v15 <= v10)
    goto LABEL_47;
LABEL_29:
  v19 = v10 + 1;
  v20 = (char *)(~v10 + v12);
  if (&v15[-v19] >= v20)
    v21 = (size_t)v20;
  else
    v21 = (size_t)&v15[-v19];
  if (v21 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v21 >= 0x17)
  {
    v23 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v21 | 7) != 0x17)
      v23 = v21 | 7;
    v24 = v23 + 1;
    v22 = (__int128 *)operator new(v23 + 1);
    *((_QWORD *)&v26 + 1) = v21;
    v27 = v24 | 0x8000000000000000;
    *(_QWORD *)&v26 = v22;
  }
  else
  {
    HIBYTE(v27) = v21;
    v22 = &v26;
    if (!v21)
      goto LABEL_40;
  }
  memmove(v22, (char *)v14 + v19, v21);
LABEL_40:
  *((_BYTE *)v22 + v21) = 0;
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
  v13 = 0;
  result = *(double *)&v26;
  *(_OWORD *)a2 = v26;
  *(_QWORD *)(a2 + 16) = v27;
  if ((HIBYTE(__p[2]) & 0x80) == 0)
    goto LABEL_26;
LABEL_25:
  operator delete(__p[0]);
LABEL_26:
  if (v13)
    goto LABEL_44;
  return result;
}

{
  void *v3;
  double result;
  __int128 v5;
  uint64_t v6;

  sAttemptToDecodeData((unint64_t *)&v5, a1);
  v3 = *(void **)a2;
  if (*(_QWORD *)a2)
  {
    *(_QWORD *)(a2 + 8) = v3;
    operator delete(v3);
  }
  result = *(double *)&v5;
  *(_OWORD *)a2 = v5;
  *(_QWORD *)(a2 + 16) = v6;
  return result;
}

void sub_20E60D1CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_20E60D1E8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20E60D1FC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sAttemptToDecodeData(unint64_t *a1, xpc_object_t *a2)
{
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  void **v9;
  unsigned int v10;
  const void *bytes_ptr;
  size_t length;
  size_t v13;
  char *v14;
  char *v15;
  char *string_ptr;
  size_t v17;
  void **v18;
  const char *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  void **v25;
  void **v26;
  void **v27;
  void **v28;
  void **i;
  int64_t v30;
  __int128 v31;
  unint64_t v32;
  void **v33;
  void **v34;
  std::runtime_error *exception;
  __int128 v37;
  void *__p[3];
  unint64_t v39;
  __int128 v40;

  if (MEMORY[0x212BC1854](*a2) == MEMORY[0x24BDACFE0])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Null object encountered");
LABEL_61:
  }
  v4 = MEMORY[0x212BC1854](*a2);
  v5 = *a2;
  if (v4 == MEMORY[0x24BDACF90])
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    length = xpc_data_get_length(*a2);
    a1[1] = 0;
    a1[2] = 0;
    *a1 = 0;
    if (length)
    {
      v13 = length;
      if ((length & 0x8000000000000000) != 0)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      v14 = (char *)operator new(length);
      *a1 = (unint64_t)v14;
      v15 = &v14[v13];
      a1[2] = (unint64_t)&v14[v13];
      memcpy(v14, bytes_ptr, v13);
      a1[1] = (unint64_t)v15;
    }
    return;
  }
  v6 = MEMORY[0x212BC1854](v5);
  v7 = MEMORY[0x24BDACFF0];
  if (v6 != MEMORY[0x24BDACFF0])
  {
LABEL_59:
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Non-data type encountered.");
    goto LABEL_61;
  }
  memset(__p, 170, sizeof(__p));
  if (MEMORY[0x212BC1854](*a2) == v7)
  {
    string_ptr = (char *)xpc_string_get_string_ptr(*a2);
    v17 = xpc_string_get_length(*a2);
    std::string::basic_string[abi:ne180100](__p, string_ptr, v17);
    v10 = HIBYTE(__p[2]);
    v9 = (void **)__p[0];
    v8 = (const char *)__p[1];
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    memset(__p, 0, sizeof(__p));
  }
  if ((v10 & 0x80u) == 0)
    v18 = __p;
  else
    v18 = v9;
  if ((v10 & 0x80u) == 0)
    v19 = (const char *)v10;
  else
    v19 = v8;
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  ctu::parse_hex_impl((ctu *)v18, v19, 1, 0, &v39);
  v20 = v39;
  *a1 = v39;
  v21 = (void *)v40;
  *(_OWORD *)(a1 + 1) = v40;
  v22 = v21;
  if ((void *)v20 != v21)
    goto LABEL_17;
  v24 = HIBYTE(__p[2]);
  if (SHIBYTE(__p[2]) >= 0)
    v25 = __p;
  else
    v25 = (void **)__p[0];
  if (SHIBYTE(__p[2]) < 0)
    v24 = (uint64_t)__p[1];
  if (!v24)
  {
LABEL_55:
    if (v22)
    {
      a1[1] = (unint64_t)v22;
      operator delete(v22);
    }
    v23 = 1;
    if (SHIBYTE(__p[2]) < 0)
      goto LABEL_18;
    goto LABEL_19;
  }
  v26 = (void **)((char *)v25 + v24);
  v27 = v25;
  v28 = (void **)((char *)v25 + v24);
  while (2)
  {
    for (i = (void **)((char *)v27 + 2); ; i = (void **)((char *)i + 1))
    {
      v27 = (void **)((char *)i - 1);
      if (*((_BYTE *)i - 2) != 93)
      {
        if (v27 == v26)
          goto LABEL_38;
        continue;
      }
      if (v27 == v26)
        goto LABEL_38;
      if (*(_BYTE *)v27 == 58)
        break;
    }
    if (i != v26)
    {
      if (*(_BYTE *)i == 32)
        v28 = (void **)((char *)i - 2);
      continue;
    }
    break;
  }
LABEL_38:
  if (v28 == v26 || (v30 = (char *)v28 - (char *)v25, v30 == -1))
  {
    if (v24 >= 9)
    {
      v33 = v25;
      while (1)
      {
        v34 = (void **)memchr(v33, 91, v24 - 8);
        if (!v34)
          break;
        if (*v34 == (void *)0x736574796220305BLL && *((_BYTE *)v34 + 8) == 93)
        {
          if (v34 != v26 && (char *)v34 - (char *)v25 != -1)
            goto LABEL_17;
          goto LABEL_55;
        }
        v33 = (void **)((char *)v34 + 1);
        v24 = (char *)v26 - (char *)v33;
        if ((char *)v26 - (char *)v33 < 9)
          goto LABEL_55;
      }
    }
    goto LABEL_55;
  }
  ctu::parse_hex_impl((ctu *)((char *)v25 + v30 + 3), (const char *)(v24 - v30 - 3), 1, 0, &v39);
  v31 = v40;
  v32 = v39;
  if (v22)
  {
    v37 = v40;
    operator delete(v22);
    v31 = v37;
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
  *a1 = v32;
  *(_OWORD *)(a1 + 1) = v31;
  v22 = (void *)v31;
  if (v32 == (_QWORD)v31)
    goto LABEL_55;
LABEL_17:
  v23 = 0;
  if (SHIBYTE(__p[2]) < 0)
LABEL_18:
    operator delete(__p[0]);
LABEL_19:
  if ((v23 & 1) != 0)
    goto LABEL_59;
}

void sub_20E60D5DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  uint64_t v16;
  void *v17;

  if (v17)
  {
    *(_QWORD *)(v16 + 8) = v17;
    operator delete(v17);
  }
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void tlv::build_tlv_field(xpc_object_t *a1, char **a2)
{
  char *v3;
  char *v4;
  size_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  size_t v9;
  char *v10;
  void *v11;
  char *v12;
  size_t v13;
  char *v14;
  char *v15;
  char *v16;
  unint64_t v17;
  _OWORD *v18;
  char *v19;
  unint64_t v20;
  __int128 v21;
  char v22;
  void *__p[3];

  memset(__p, 170, sizeof(__p));
  sAttemptToDecodeData((unint64_t *)__p, a1);
  v3 = (char *)__p[0];
  v4 = (char *)__p[1];
  v5 = (char *)__p[1] - (char *)__p[0];
  v6 = (unint64_t)a2[2];
  v7 = *a2;
  if (v6 - (unint64_t)*a2 < (char *)__p[1] - (char *)__p[0])
  {
    if (v7)
    {
      a2[1] = v7;
      operator delete(v7);
      v6 = 0;
      *a2 = 0;
      a2[1] = 0;
      a2[2] = 0;
    }
    if ((v5 & 0x8000000000000000) != 0)
      goto LABEL_32;
    v8 = 2 * v6;
    if (2 * v6 <= v5)
      v8 = v5;
    v9 = v6 >= 0x3FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v8;
    if ((v9 & 0x8000000000000000) != 0)
LABEL_32:
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v10 = (char *)operator new(v9);
    *a2 = v10;
    a2[1] = v10;
    a2[2] = &v10[v9];
    memcpy(v10, v3, v5);
    a2[1] = &v10[v5];
    v11 = __p[0];
    if (!__p[0])
      return;
LABEL_30:
    __p[1] = v11;
    operator delete(v11);
    return;
  }
  v12 = a2[1];
  v13 = v12 - v7;
  if (v12 - v7 < v5)
  {
    v14 = (char *)__p[0] + v13;
    if (v12 == v7)
    {
      v15 = *a2;
      v16 = *a2;
      if (v14 == __p[1])
        goto LABEL_29;
    }
    else
    {
      memmove(*a2, __p[0], v13);
      v15 = a2[1];
      v16 = v15;
      if (v14 == v4)
        goto LABEL_29;
    }
    v17 = &v4[(_QWORD)v7] - &v12[(_QWORD)v3];
    if (v17 >= 0x20)
    {
      v16 = v15;
      if (&v15[v7 - &v12[(_QWORD)v3]] >= (char *)0x20)
      {
        v14 += v17 & 0xFFFFFFFFFFFFFFE0;
        v16 = &v15[v17 & 0xFFFFFFFFFFFFFFE0];
        v18 = v15 + 16;
        v19 = &v3[v12 - v7 + 16];
        v20 = v17 & 0xFFFFFFFFFFFFFFE0;
        do
        {
          v21 = *(_OWORD *)v19;
          *(v18 - 1) = *((_OWORD *)v19 - 1);
          *v18 = v21;
          v18 += 2;
          v19 += 32;
          v20 -= 32;
        }
        while (v20);
        if (v17 == (v17 & 0xFFFFFFFFFFFFFFE0))
        {
LABEL_29:
          a2[1] = v16;
          v11 = __p[0];
          if (!__p[0])
            return;
          goto LABEL_30;
        }
      }
    }
    else
    {
      v16 = v15;
    }
    do
    {
      v22 = *v14++;
      *v16++ = v22;
    }
    while (v14 != v4);
    goto LABEL_29;
  }
  if (__p[1] != __p[0])
    memmove(*a2, __p[0], (char *)__p[1] - (char *)__p[0]);
  a2[1] = &v7[v5];
  v11 = __p[0];
  if (__p[0])
    goto LABEL_30;
}

void sub_20E60D84C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_20E60DB84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  std::locale::~locale((std::locale *)(v26 - 88));
  a9 = *v24;
  *(uint64_t *)((char *)&a9 + *(_QWORD *)(a9 - 24)) = v24[3];
  a10 = v25 + 16;
  if (a23 < 0)
    operator delete(__p);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BC1680](v23);
  _Unwind_Resume(a1);
}

uint64_t print_char_type@<X0>(_BYTE *a1@<X8>)
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  std::ios_base *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  const std::ios_base *v12;
  const std::locale::facet *v13;
  std::ios_base::fmtflags v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  void *__src[2];
  __int128 v27;
  void *__p[2];
  __int128 v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  std::locale v41;

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v40 = v2;
  v39 = v2;
  v38 = v2;
  v37 = v2;
  v36 = v2;
  v35 = v2;
  v34 = v2;
  v33 = v2;
  v32 = v2;
  v29 = v2;
  *(_OWORD *)__p = v2;
  v27 = v2;
  *(_OWORD *)__src = v2;
  v25 = v2;
  v24 = v2;
  v3 = MEMORY[0x24BEDB870];
  v4 = MEMORY[0x24BEDB870] + 64;
  v31 = MEMORY[0x24BEDB870] + 64;
  v5 = (uint64_t *)MEMORY[0x24BEDB800];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v23 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v6;
  v7 = (std::ios_base *)((char *)&v23 + *(_QWORD *)(v23 - 24));
  std::ios_base::init(v7, &v24);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  v23 = v3 + 24;
  v31 = v4;
  std::streambuf::basic_streambuf();
  v8 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v24 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v29 = 0u;
  LODWORD(v30) = 16;
  *(_DWORD *)((char *)&v23 + *(_QWORD *)(v23 - 24) + 8) = *(_DWORD *)((_BYTE *)&v23 + *(_QWORD *)(v23 - 24) + 8) & 0xFFFFFFB5 | 2;
  v9 = (_QWORD *)std::ostream::operator<<();
  v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)" (0x", 4);
  v11 = *v10;
  *(_DWORD *)((char *)v10 + *(_QWORD *)(*v10 - 24) + 8) = *(_DWORD *)((_BYTE *)v10 + *(_QWORD *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v10 + *(_QWORD *)(v11 - 24) + 24) = 2;
  v12 = (const std::ios_base *)((char *)v10 + *(_QWORD *)(v11 - 24));
  if (v12[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v12);
    v13 = std::locale::use_facet(&v41, MEMORY[0x24BEDB350]);
    v14 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 32);
    std::locale::~locale(&v41);
    v12[1].__fmtflags_ = v14;
  }
  v12[1].__fmtflags_ = 48;
  v15 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)")", 1);
  if ((v30 & 0x10) != 0)
  {
    v17 = *((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1) < (unint64_t)v27)
    {
      *((_QWORD *)&v29 + 1) = v27;
      v17 = v27;
    }
    v18 = __src[1];
    v16 = v17 - (unint64_t)__src[1];
    if (v17 - (unint64_t)__src[1] >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_20;
  }
  else
  {
    if ((v30 & 8) == 0)
    {
      v16 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    v18 = (const void *)v25;
    v16 = (size_t)__src[0] - v25;
    if ((char *)__src[0] - (unint64_t)v25 >= (void *)0x7FFFFFFFFFFFFFF8)
LABEL_20:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v16 >= 0x17)
  {
    v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v19 = v16 | 7;
    v20 = v19 + 1;
    v21 = operator new(v19 + 1);
    *((_QWORD *)a1 + 1) = v16;
    *((_QWORD *)a1 + 2) = v20 | 0x8000000000000000;
    *(_QWORD *)a1 = v21;
    a1 = v21;
    goto LABEL_15;
  }
  a1[23] = v16;
  if (v16)
LABEL_15:
    memmove(a1, v18, v16);
LABEL_16:
  a1[v16] = 0;
  v23 = *v5;
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v5[3];
  *(_QWORD *)&v24 = v8 + 16;
  if (SBYTE7(v29) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x212BC1680](&v31);
}

void sub_20E60DF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  std::locale::~locale((std::locale *)(v9 - 88));
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_20E60DF48(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x212BC1680](v1);
  _Unwind_Resume(a1);
}

void sub_20E60E2C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  std::locale::~locale((std::locale *)(v26 - 88));
  a9 = *v24;
  *(uint64_t *)((char *)&a9 + *(_QWORD *)(a9 - 24)) = v24[3];
  a10 = v25 + 16;
  if (a23 < 0)
    operator delete(__p);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BC1680](v23);
  _Unwind_Resume(a1);
}

uint64_t print_number_field<unsigned short>@<X0>(_BYTE *a1@<X8>)
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  std::ios_base *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  const std::ios_base *v12;
  const std::locale::facet *v13;
  std::ios_base::fmtflags v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  void *__src[2];
  __int128 v27;
  void *__p[2];
  __int128 v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  std::locale v41;

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v40 = v2;
  v39 = v2;
  v38 = v2;
  v37 = v2;
  v36 = v2;
  v35 = v2;
  v34 = v2;
  v33 = v2;
  v32 = v2;
  v29 = v2;
  *(_OWORD *)__p = v2;
  v27 = v2;
  *(_OWORD *)__src = v2;
  v25 = v2;
  v24 = v2;
  v3 = MEMORY[0x24BEDB870];
  v4 = MEMORY[0x24BEDB870] + 64;
  v31 = MEMORY[0x24BEDB870] + 64;
  v5 = (uint64_t *)MEMORY[0x24BEDB800];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v23 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v6;
  v7 = (std::ios_base *)((char *)&v23 + *(_QWORD *)(v23 - 24));
  std::ios_base::init(v7, &v24);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  v23 = v3 + 24;
  v31 = v4;
  std::streambuf::basic_streambuf();
  v8 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v24 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v29 = 0u;
  LODWORD(v30) = 16;
  *(_DWORD *)((char *)&v23 + *(_QWORD *)(v23 - 24) + 8) = *(_DWORD *)((_BYTE *)&v23 + *(_QWORD *)(v23 - 24) + 8) & 0xFFFFFFB5 | 2;
  v9 = (_QWORD *)std::ostream::operator<<();
  v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)" (0x", 4);
  v11 = *v10;
  *(_DWORD *)((char *)v10 + *(_QWORD *)(*v10 - 24) + 8) = *(_DWORD *)((_BYTE *)v10 + *(_QWORD *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v10 + *(_QWORD *)(v11 - 24) + 24) = 4;
  v12 = (const std::ios_base *)((char *)v10 + *(_QWORD *)(v11 - 24));
  if (v12[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v12);
    v13 = std::locale::use_facet(&v41, MEMORY[0x24BEDB350]);
    v14 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 32);
    std::locale::~locale(&v41);
    v12[1].__fmtflags_ = v14;
  }
  v12[1].__fmtflags_ = 48;
  v15 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)")", 1);
  if ((v30 & 0x10) != 0)
  {
    v17 = *((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1) < (unint64_t)v27)
    {
      *((_QWORD *)&v29 + 1) = v27;
      v17 = v27;
    }
    v18 = __src[1];
    v16 = v17 - (unint64_t)__src[1];
    if (v17 - (unint64_t)__src[1] >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_20;
  }
  else
  {
    if ((v30 & 8) == 0)
    {
      v16 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    v18 = (const void *)v25;
    v16 = (size_t)__src[0] - v25;
    if ((char *)__src[0] - (unint64_t)v25 >= (void *)0x7FFFFFFFFFFFFFF8)
LABEL_20:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v16 >= 0x17)
  {
    v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v19 = v16 | 7;
    v20 = v19 + 1;
    v21 = operator new(v19 + 1);
    *((_QWORD *)a1 + 1) = v16;
    *((_QWORD *)a1 + 2) = v20 | 0x8000000000000000;
    *(_QWORD *)a1 = v21;
    a1 = v21;
    goto LABEL_15;
  }
  a1[23] = v16;
  if (v16)
LABEL_15:
    memmove(a1, v18, v16);
LABEL_16:
  a1[v16] = 0;
  v23 = *v5;
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v5[3];
  *(_QWORD *)&v24 = v8 + 16;
  if (SBYTE7(v29) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x212BC1680](&v31);
}

void sub_20E60E670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  std::locale::~locale((std::locale *)(v9 - 88));
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_20E60E68C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x212BC1680](v1);
  _Unwind_Resume(a1);
}

void sub_20E60EA04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  std::locale::~locale((std::locale *)(v26 - 88));
  a9 = *v24;
  *(uint64_t *)((char *)&a9 + *(_QWORD *)(a9 - 24)) = v24[3];
  a10 = v25 + 16;
  if (a23 < 0)
    operator delete(__p);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BC1680](v23);
  _Unwind_Resume(a1);
}

uint64_t print_number_field<unsigned int>@<X0>(_BYTE *a1@<X8>)
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  std::ios_base *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  const std::ios_base *v12;
  const std::locale::facet *v13;
  std::ios_base::fmtflags v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v17;
  const void *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  void *__src[2];
  __int128 v27;
  void *__p[2];
  __int128 v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  std::locale v41;

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v40 = v2;
  v39 = v2;
  v38 = v2;
  v37 = v2;
  v36 = v2;
  v35 = v2;
  v34 = v2;
  v33 = v2;
  v32 = v2;
  v29 = v2;
  *(_OWORD *)__p = v2;
  v27 = v2;
  *(_OWORD *)__src = v2;
  v25 = v2;
  v24 = v2;
  v3 = MEMORY[0x24BEDB870];
  v4 = MEMORY[0x24BEDB870] + 64;
  v31 = MEMORY[0x24BEDB870] + 64;
  v5 = (uint64_t *)MEMORY[0x24BEDB800];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v23 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v6;
  v7 = (std::ios_base *)((char *)&v23 + *(_QWORD *)(v23 - 24));
  std::ios_base::init(v7, &v24);
  v7[1].__vftable = 0;
  v7[1].__fmtflags_ = -1;
  v23 = v3 + 24;
  v31 = v4;
  std::streambuf::basic_streambuf();
  v8 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v24 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v29 = 0u;
  LODWORD(v30) = 16;
  *(_DWORD *)((char *)&v23 + *(_QWORD *)(v23 - 24) + 8) = *(_DWORD *)((_BYTE *)&v23 + *(_QWORD *)(v23 - 24) + 8) & 0xFFFFFFB5 | 2;
  v9 = (_QWORD *)std::ostream::operator<<();
  v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)" (0x", 4);
  v11 = *v10;
  *(_DWORD *)((char *)v10 + *(_QWORD *)(*v10 - 24) + 8) = *(_DWORD *)((_BYTE *)v10 + *(_QWORD *)(*v10 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v10 + *(_QWORD *)(v11 - 24) + 24) = 8;
  v12 = (const std::ios_base *)((char *)v10 + *(_QWORD *)(v11 - 24));
  if (v12[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v12);
    v13 = std::locale::use_facet(&v41, MEMORY[0x24BEDB350]);
    v14 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v13->__vftable[2].~facet_0)(v13, 32);
    std::locale::~locale(&v41);
    v12[1].__fmtflags_ = v14;
  }
  v12[1].__fmtflags_ = 48;
  v15 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)")", 1);
  if ((v30 & 0x10) != 0)
  {
    v17 = *((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1) < (unint64_t)v27)
    {
      *((_QWORD *)&v29 + 1) = v27;
      v17 = v27;
    }
    v18 = __src[1];
    v16 = v17 - (unint64_t)__src[1];
    if (v17 - (unint64_t)__src[1] >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_20;
  }
  else
  {
    if ((v30 & 8) == 0)
    {
      v16 = 0;
      a1[23] = 0;
      goto LABEL_16;
    }
    v18 = (const void *)v25;
    v16 = (size_t)__src[0] - v25;
    if ((char *)__src[0] - (unint64_t)v25 >= (void *)0x7FFFFFFFFFFFFFF8)
LABEL_20:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v16 >= 0x17)
  {
    v19 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v16 | 7) != 0x17)
      v19 = v16 | 7;
    v20 = v19 + 1;
    v21 = operator new(v19 + 1);
    *((_QWORD *)a1 + 1) = v16;
    *((_QWORD *)a1 + 2) = v20 | 0x8000000000000000;
    *(_QWORD *)a1 = v21;
    a1 = v21;
    goto LABEL_15;
  }
  a1[23] = v16;
  if (v16)
LABEL_15:
    memmove(a1, v18, v16);
LABEL_16:
  a1[v16] = 0;
  v23 = *v5;
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v5[3];
  *(_QWORD *)&v24 = v8 + 16;
  if (SBYTE7(v29) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x212BC1680](&v31);
}

void sub_20E60EDAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  std::locale::~locale((std::locale *)(v9 - 88));
  std::ostringstream::~ostringstream((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_20E60EDC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x212BC1680](v1);
  _Unwind_Resume(a1);
}

void sub_20E60F140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  std::locale::~locale((std::locale *)(v26 - 88));
  a9 = *v24;
  *(uint64_t *)((char *)&a9 + *(_QWORD *)(a9 - 24)) = v24[3];
  a10 = v25 + 16;
  if (a23 < 0)
    operator delete(__p);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BC1680](v23);
  _Unwind_Resume(a1);
}

void sub_20E60F4E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  std::locale::~locale((std::locale *)(v26 - 88));
  a9 = *v24;
  *(uint64_t *)((char *)&a9 + *(_QWORD *)(a9 - 24)) = v24[3];
  a10 = v25 + 16;
  if (a23 < 0)
    operator delete(__p);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BC1680](v23);
  _Unwind_Resume(a1);
}

const char *asString(unsigned int a1)
{
  if (a1 > 5)
    return "unknown";
  else
    return off_24C9757B8[(char)a1];
}

std::string *print_tlv_field@<X0>(unint64_t a1@<X0>, unsigned int a2@<W1>, std::string *a3@<X8>)
{
  return string_with_quotes<std::string>(a3, a1, a2);
}

std::string *string_with_quotes<std::string>(std::string *a1, unint64_t a2, unsigned int a3)
{
  uint64_t v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  size_t size;
  std::string *v12;
  uint64_t v14;
  std::string::size_type v15;
  std::string *v16;
  const char *v17;
  size_t v18;
  std::string v20;

  memset(a1, 170, sizeof(std::string));
  *((_BYTE *)&a1->__r_.__value_.__s + 23) = 1;
  LOWORD(a1->__r_.__value_.__l.__data_) = 34;
  v6 = *(unsigned __int8 *)(a2 + 23);
  if ((v6 & 0x80u) != 0)
    v6 = *(_QWORD *)(a2 + 8);
  std::string::reserve(a1, v6 + 2);
  v7 = *(char *)(a2 + 23);
  if (v7 >= 0)
    v8 = a2;
  else
    v8 = *(_QWORD *)a2;
  if (v7 >= 0)
    v9 = *(unsigned __int8 *)(a2 + 23);
  else
    v9 = *(_QWORD *)(a2 + 8);
  if (v9)
  {
    v10 = HIBYTE(a1->__r_.__value_.__r.__words[2]);
    if (v10 >= 0)
      size = HIBYTE(a1->__r_.__value_.__r.__words[2]);
    else
      size = a1->__r_.__value_.__l.__size_;
    if (v10 >= 0)
      v12 = a1;
    else
      v12 = (std::string *)a1->__r_.__value_.__r.__words[0];
    if ((unint64_t)v12 <= v8 && (unint64_t)v12->__r_.__value_.__r.__words + size + 1 > v8)
    {
      v14 = 0;
      memset(&v20, 0, sizeof(v20));
      do
        std::string::push_back(&v20, *(_BYTE *)(v8 + v14++));
      while (v9 != v14);
      v15 = HIBYTE(v20.__r_.__value_.__r.__words[2]);
      if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v16 = &v20;
      else
        v16 = (std::string *)v20.__r_.__value_.__r.__words[0];
      if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v15 = v20.__r_.__value_.__l.__size_;
      std::string::__insert_from_safe_copy[abi:ne180100]<std::__wrap_iter<char const*>,std::__wrap_iter<char const*>>((char *)a1, v9, size, (uint64_t)v16, (char *)v16 + v15);
      if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v20.__r_.__value_.__l.__data_);
    }
    else
    {
      std::string::__insert_from_safe_copy[abi:ne180100]<std::__wrap_iter<char const*>,std::__wrap_iter<char const*>>((char *)a1, v9, size, v8, (char *)(v8 + v9));
    }
  }
  std::string::append(a1, "\" (", 3uLL);
  if (a3 > 5)
    v17 = "unknown";
  else
    v17 = off_24C9757B8[(char)a3];
  v18 = strlen(v17);
  std::string::append(a1, v17, v18);
  return std::string::append(a1, ")", 1uLL);
}

void sub_20E60F74C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v15 + 23) < 0)
    operator delete(*(void **)v15);
  _Unwind_Resume(exception_object);
}

std::string *print_tlv_field@<X0>(unint64_t a1@<X0>, std::string *a2@<X8>)
{
  return string_with_quotes<std::string>(a2, a1, 5u);
}

void print_tlv_field(_BYTE *a1@<X0>, int64_t a2@<X1>, unsigned int a3@<W2>, std::string *a4@<X8>)
{
  const char *v7;
  size_t v8;
  size_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  std::string *v13;
  __int128 v14;
  std::string *v15;
  __int128 v16;
  void **v17;
  std::string::size_type v18;
  std::string::size_type size;
  char v20;
  unsigned int v21;
  char v22;
  int64_t v23;
  _BYTE *v24;
  char v25;
  unsigned int v26;
  char v27;
  std::string v28;
  std::string v29;
  void *__p[2];
  int64_t v31;

  memset(a4, 170, sizeof(std::string));
  if (a3 > 5)
    v7 = "unknown";
  else
    v7 = off_24C9757B8[(char)a3];
  v8 = strlen(v7);
  if (v8 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v9 = v8;
  if (v8 >= 0x17)
  {
    v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v8 | 7) != 0x17)
      v11 = v8 | 7;
    v12 = v11 + 1;
    v10 = operator new(v11 + 1);
    a4->__r_.__value_.__l.__size_ = v9;
    a4->__r_.__value_.__r.__words[2] = v12 | 0x8000000000000000;
    a4->__r_.__value_.__r.__words[0] = (std::string::size_type)v10;
  }
  else
  {
    *((_BYTE *)&a4->__r_.__value_.__s + 23) = v8;
    v10 = a4;
    if (!v8)
    {
      a4->__r_.__value_.__s.__data_[0] = 0;
      if (a2 != 1)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  memcpy(v10, v7, v9);
  *((_BYTE *)v10 + v9) = 0;
  if (a2 != 1)
  {
LABEL_8:
    if (!a2)
    {
      std::string::append(a4, " [0 bytes]", 0xAuLL);
      return;
    }
    std::to_string(&v28, a2);
    v13 = std::string::insert(&v28, 0, " [", 2uLL);
    v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
    v29.__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v29.__r_.__value_.__l.__data_ = v14;
    v13->__r_.__value_.__l.__size_ = 0;
    v13->__r_.__value_.__r.__words[2] = 0;
    v13->__r_.__value_.__r.__words[0] = 0;
    v15 = std::string::append(&v29, " bytes]: ", 9uLL);
    v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    v31 = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)__p = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    if (v31 >= 0)
      v17 = __p;
    else
      v17 = (void **)__p[0];
    if (v31 >= 0)
      v18 = HIBYTE(v31);
    else
      v18 = (std::string::size_type)__p[1];
    std::string::append(a4, (const std::string::value_type *)v17, v18);
    if (SHIBYTE(v31) < 0)
    {
      operator delete(__p[0]);
      if ((SHIBYTE(v29.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_23:
        if ((SHIBYTE(v28.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_24;
        goto LABEL_28;
      }
    }
    else if ((SHIBYTE(v29.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_23;
    }
    operator delete(v29.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v28.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_24:
      if (a2 < 1)
        return;
      goto LABEL_29;
    }
LABEL_28:
    operator delete(v28.__r_.__value_.__l.__data_);
    if (a2 < 1)
      return;
    goto LABEL_29;
  }
LABEL_14:
  std::string::append(a4, " [1 byte]: ", 0xBuLL);
LABEL_29:
  size = HIBYTE(a4->__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0)
    size = a4->__r_.__value_.__l.__size_;
  std::string::reserve(a4, 3 * a2 + size - 1);
  if (*a1 >= 0xA0u)
    v20 = 87;
  else
    v20 = 48;
  std::string::push_back(a4, v20 + (*a1 >> 4));
  v21 = *a1 & 0xF;
  if (v21 >= 0xA)
    v22 = 87;
  else
    v22 = 48;
  std::string::push_back(a4, v22 + v21);
  v23 = a2 - 1;
  if (v23)
  {
    v24 = a1 + 1;
    do
    {
      std::string::push_back(a4, 32);
      if (*v24 >= 0xA0u)
        v25 = 87;
      else
        v25 = 48;
      std::string::push_back(a4, v25 + (*v24 >> 4));
      v26 = *v24 & 0xF;
      if (v26 >= 0xA)
        v27 = 87;
      else
        v27 = 48;
      std::string::push_back(a4, v27 + v26);
      ++v24;
      --v23;
    }
    while (v23);
  }
}

void sub_20E60FA90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  uint64_t v28;

  if (a28 < 0)
  {
    operator delete(__p);
    if ((a21 & 0x80000000) == 0)
    {
LABEL_3:
      if ((a15 & 0x80000000) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((a21 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(a16);
  if ((a15 & 0x80000000) == 0)
  {
LABEL_4:
    if ((*(char *)(v28 + 23) & 0x80000000) == 0)
      goto LABEL_5;
    goto LABEL_9;
  }
LABEL_8:
  operator delete(a10);
  if ((*(char *)(v28 + 23) & 0x80000000) == 0)
LABEL_5:
    _Unwind_Resume(exception_object);
LABEL_9:
  operator delete(*(void **)v28);
  _Unwind_Resume(exception_object);
}

void print_tlv_field(uint64_t a1@<X0>, unsigned int a2@<W1>, std::string *a3@<X8>)
{
  print_tlv_field(*(_BYTE **)a1, *(_QWORD *)(a1 + 8) - *(_QWORD *)a1, a2, a3);
}

{
  print_tlv_field(*(_BYTE **)a1, *(_QWORD *)(a1 + 8) - *(_QWORD *)a1, a2, a3);
}

void print_tlv_field(uint64_t a1@<X0>, std::string *a2@<X8>)
{
  print_tlv_field(*(_BYTE **)a1, *(_QWORD *)(a1 + 8) - *(_QWORD *)a1, 5u, a2);
}

void print_tlv_field_pair(char *a1@<X0>, xpc_object_t *a2@<X1>, _QWORD *a3@<X8>)
{
  xpc_object_t v4;
  xpc_object_t v5;
  xpc_object_t v6;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x24BDAC8D0];
  values = *a2;
  keys[0] = a1;
  v4 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
  v5 = v4;
  if (v4)
  {
    xpc_retain(v4);
    *a3 = v5;
  }
  else
  {
    v5 = xpc_null_create();
    *a3 = v5;
    if (!v5)
    {
      v6 = xpc_null_create();
      v5 = 0;
      goto LABEL_8;
    }
  }
  if (MEMORY[0x212BC1854](v5) != MEMORY[0x24BDACFA0])
  {
    v6 = xpc_null_create();
LABEL_8:
    *a3 = v6;
    goto LABEL_9;
  }
  xpc_retain(v5);
LABEL_9:
  xpc_release(v5);
}

{
  if (a1[23] < 0)
    a1 = *(char **)a1;
  print_tlv_field_pair(a1, a2, a3);
}

void sub_20E60FC44(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void extract_tlv_field(xpc_object_t *a1@<X0>, const char *a2@<X2>, size_t a3@<X1>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  xpc_object_t value;
  uint64_t v11;
  xpc_object_t v12;
  xpc_object_t v13;
  xpc_object_t v14;
  xpc_object_t v15;
  std::runtime_error *exception;
  std::runtime_error *v17;
  std::runtime_error *v18;

  v8 = MEMORY[0x212BC1854](*a1);
  v9 = MEMORY[0x24BDACF78];
  if (v8 != MEMORY[0x24BDACF78])
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Null object encountered");
LABEL_20:
  }
  if (MEMORY[0x212BC1854](*a1) != v9 || xpc_array_get_count(*a1) <= a3)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvBuildUnexpectedField::TlvBuildUnexpectedField(exception, "Object does not have enough elements!");
    goto LABEL_20;
  }
  value = xpc_array_get_value(*a1, a3);
  v11 = MEMORY[0x24BDACFA0];
  if (value)
  {
    v12 = value;
    xpc_retain(value);
  }
  else
  {
    v12 = xpc_null_create();
    if (!v12)
    {
      v13 = xpc_null_create();
      v12 = 0;
      goto LABEL_11;
    }
  }
  if (MEMORY[0x212BC1854](v12) == v11)
  {
    xpc_retain(v12);
    v13 = v12;
  }
  else
  {
    v13 = xpc_null_create();
  }
LABEL_11:
  xpc_release(v12);
  if (MEMORY[0x212BC1854](v13) != v11)
  {
    v17 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v17, "Object at index is not a dictionary type");
    goto LABEL_23;
  }
  if (xpc_dictionary_get_count(v13) != 1)
  {
    v17 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v17, "Object at index is a dictionary but does not have exactly one element");
LABEL_23:
    v17->__vftable = (std::runtime_error_vtbl *)off_24C9755C8;
  }
  *a4 = 0xAAAAAAAAAAAAAAAALL;
  v14 = xpc_dictionary_get_value(v13, a2);
  v15 = v14;
  *a4 = v14;
  if (v14)
  {
    xpc_retain(v14);
  }
  else
  {
    v15 = xpc_null_create();
    *a4 = v15;
  }
  if (MEMORY[0x212BC1854](v15) == MEMORY[0x24BDACFE0])
  {
    v18 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v18, "Object at index does not have the right name");
    v18->__vftable = (std::runtime_error_vtbl *)off_24C9755C8;
  }
  xpc_release(v13);
}

void sub_20E60FEC0(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  void *v4;

  __cxa_free_exception(v4);
  xpc_release(v3);
  *v1 = 0;
  xpc_release(v2);
  _Unwind_Resume(a1);
}

void extract_tlv_field(xpc_object_t *a1@<X0>, size_t a2@<X1>, const char *a3@<X2>, _QWORD *a4@<X8>)
{
  if (a3[23] < 0)
    a3 = *(const char **)a3;
  extract_tlv_field(a1, a3, a2, a4);
}

void TlvDefinition::sFillInParseFailure(uint64_t a1, uint64_t a2)
{
  xpc_object_t v4;
  void *v5;
  std::string *p_value;
  xpc_object_t v7;
  xpc_object_t v8;
  std::string value;
  xpc_object_t v10;
  xpc_object_t v11;

  *(_BYTE *)(a1 + 24) = 3;
  v4 = xpc_string_create("[ Unable to parse this TLV as defined ]");
  v11 = v4;
  if (!v4)
  {
    v4 = xpc_null_create();
    v11 = v4;
  }
  print_tlv_field_pair("parse_error", &v11, &value);
  v5 = (void *)value.__r_.__value_.__r.__words[0];
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), value.__r_.__value_.__l.__data_);
  xpc_release(v5);
  xpc_release(v4);
  print_tlv_field(*(_BYTE **)a2, *(_QWORD *)(a2 + 8) - *(_QWORD *)a2, 2u, &value);
  if ((value.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_value = &value;
  else
    p_value = (std::string *)value.__r_.__value_.__r.__words[0];
  v7 = xpc_string_create((const char *)p_value);
  v10 = v7;
  if (!v7)
  {
    v7 = xpc_null_create();
    v10 = v7;
  }
  print_tlv_field_pair("bytes", &v10, &v11);
  v8 = v11;
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v11);
  xpc_release(v8);
  v11 = 0;
  xpc_release(v7);
  if (SHIBYTE(value.__r_.__value_.__r.__words[2]) < 0)
    operator delete(value.__r_.__value_.__l.__data_);
}

void sub_20E6100B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  void *v17;
  void *v18;

  xpc_release(v18);
  xpc_release(v17);
  if (a15 < 0)
  {
    operator delete(__p);
    _Unwind_Resume(a1);
  }
  _Unwind_Resume(a1);
}

_QWORD *TlvDefinitionImpl<QmiResultCode,(unsigned char)2>::TlvDefinitionImpl(_QWORD *result)
{
  *result = off_24C975620;
  result[1] = "QMI Response Result";
  return result;
}

{
  *result = off_24C975620;
  result[1] = "QMI Response Result";
  return result;
}

size_t TlvDefinitionImpl<QmiResultCode,(unsigned char)2>::parse@<X0>(uint64_t a1@<X0>, char **a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v6;
  std::string *v7;
  char *v8;
  int v9;
  unsigned int v10;
  __int128 v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  const std::ios_base *v15;
  const std::locale::facet *v16;
  std::ios_base::fmtflags v17;
  _QWORD *v18;
  size_t v19;
  std::locale::__imp *v20;
  uint64_t v21;
  const void *v22;
  uint64_t v23;
  uint64_t v24;
  const char *locale;
  xpc_object_t v26;
  xpc_object_t v27;
  __int128 v28;
  _QWORD *v29;
  uint64_t *v30;
  uint64_t v31;
  const std::ios_base *v32;
  const std::locale::facet *v33;
  std::ios_base::fmtflags v34;
  _QWORD *v35;
  size_t v36;
  void *p_value;
  uint64_t v38;
  const void *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  xpc_object_t v43;
  xpc_object_t v44;
  const char *v45;
  size_t v46;
  size_t v47;
  void *v48;
  xpc_object_t v49;
  xpc_object_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  xpc_object_t v54;
  xpc_object_t v55;
  std::locale::__imp *v56;
  uint64_t v57;
  std::locale::__imp *v58;
  uint64_t v59;
  size_t result;
  xpc_object_t value;
  size_t v62;
  int64_t v63;
  xpc_object_t v64;
  std::locale __dst[2];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  void *__p[2];
  __int128 v71;
  __int128 v72;
  _OWORD v73[9];
  unint64_t v74;
  xpc_object_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  void *v81[2];
  __int128 v82;
  __int128 v83;
  _OWORD v84[9];
  unint64_t v85;

  *(_QWORD *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v6;
  *(_OWORD *)(a3 + 16) = v6;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v7, *(const std::string::value_type **)(a1 + 8));
  v8 = *a2;
  if (a2[1] - *a2 != 4)
    goto LABEL_71;
  v9 = *(unsigned __int16 *)v8;
  v10 = *((unsigned __int16 *)v8 + 1);
  v85 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v84[7] = v11;
  v84[8] = v11;
  v84[5] = v11;
  v84[6] = v11;
  v84[3] = v11;
  v84[4] = v11;
  v84[1] = v11;
  v84[2] = v11;
  v83 = v11;
  v84[0] = v11;
  *(_OWORD *)v81 = v11;
  v82 = v11;
  v79 = v11;
  v80 = v11;
  v77 = v11;
  v78 = v11;
  v76 = v11;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v76);
  v12 = (_QWORD *)std::ostream::operator<<();
  v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)" (0x", 4);
  v14 = *v13;
  *(_DWORD *)((char *)v13 + *(_QWORD *)(*v13 - 24) + 8) = *(_DWORD *)((_BYTE *)v13 + *(_QWORD *)(*v13 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v13 + *(_QWORD *)(v14 - 24) + 24) = 4;
  v15 = (const std::ios_base *)((char *)v13 + *(_QWORD *)(v14 - 24));
  if (v15[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v15);
    v16 = std::locale::use_facet(__dst, MEMORY[0x24BEDB350]);
    v17 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v16->__vftable[2].~facet_0)(v16, 32);
    std::locale::~locale(__dst);
    v15[1].__fmtflags_ = v17;
  }
  v15[1].__fmtflags_ = 48;
  v18 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)")", 1);
  if ((BYTE8(v83) & 0x10) != 0)
  {
    v21 = v83;
    if ((unint64_t)v83 < *((_QWORD *)&v80 + 1))
    {
      *(_QWORD *)&v83 = *((_QWORD *)&v80 + 1);
      v21 = *((_QWORD *)&v80 + 1);
    }
    v22 = (const void *)v80;
    v19 = v21 - v80;
    if ((unint64_t)(v21 - v80) > 0x7FFFFFFFFFFFFFF7)
      goto LABEL_76;
  }
  else
  {
    if ((BYTE8(v83) & 8) == 0)
    {
      v19 = 0;
      BYTE7(v66) = 0;
      v20 = (std::locale::__imp *)__dst;
      goto LABEL_17;
    }
    v22 = (const void *)*((_QWORD *)&v78 + 1);
    v19 = *((_QWORD *)&v79 + 1) - *((_QWORD *)&v78 + 1);
    if (*((_QWORD *)&v79 + 1) - *((_QWORD *)&v78 + 1) > 0x7FFFFFFFFFFFFFF7uLL)
LABEL_76:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v19 >= 0x17)
  {
    v23 = (v19 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v19 | 7) != 0x17)
      v23 = v19 | 7;
    v24 = v23 + 1;
    v20 = (std::locale::__imp *)operator new(v23 + 1);
    __dst[1].__locale_ = (std::locale::__imp *)v19;
    *(_QWORD *)&v66 = v24 | 0x8000000000000000;
    __dst[0].__locale_ = v20;
    goto LABEL_16;
  }
  BYTE7(v66) = v19;
  v20 = (std::locale::__imp *)__dst;
  if (v19)
LABEL_16:
    memmove(v20, v22, v19);
LABEL_17:
  *((_BYTE *)v20 + v19) = 0;
  if ((SBYTE7(v66) & 0x80u) == 0)
    locale = (const char *)__dst;
  else
    locale = (const char *)__dst[0].__locale_;
  v26 = xpc_string_create(locale);
  v75 = v26;
  if (!v26)
  {
    v26 = xpc_null_create();
    v75 = v26;
  }
  print_tlv_field_pair("fResult", &v75, &value);
  v27 = value;
  xpc_array_append_value(*(xpc_object_t *)(a3 + 32), value);
  xpc_release(v27);
  value = 0;
  xpc_release(v26);
  if (SBYTE7(v66) < 0)
    operator delete(__dst[0].__locale_);
  v74 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v28 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v73[7] = v28;
  v73[8] = v28;
  v73[5] = v28;
  v73[6] = v28;
  v73[3] = v28;
  v73[4] = v28;
  v73[1] = v28;
  v73[2] = v28;
  v72 = v28;
  v73[0] = v28;
  *(_OWORD *)__p = v28;
  v71 = v28;
  v68 = v28;
  v69 = v28;
  v66 = v28;
  v67 = v28;
  *(_OWORD *)&__dst[0].__locale_ = v28;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)__dst);
  v29 = (_QWORD *)std::ostream::operator<<();
  v30 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)" (0x", 4);
  v31 = *v30;
  *(_DWORD *)((char *)v30 + *(_QWORD *)(*v30 - 24) + 8) = *(_DWORD *)((_BYTE *)v30 + *(_QWORD *)(*v30 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(uint64_t *)((char *)v30 + *(_QWORD *)(v31 - 24) + 24) = 4;
  v32 = (const std::ios_base *)((char *)v30 + *(_QWORD *)(v31 - 24));
  if (v32[1].__fmtflags_ == -1)
  {
    std::ios_base::getloc(v32);
    v33 = std::locale::use_facet((const std::locale *)&value, MEMORY[0x24BEDB350]);
    v34 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v33->__vftable[2].~facet_0)(v33, 32);
    std::locale::~locale((std::locale *)&value);
    v32[1].__fmtflags_ = v34;
  }
  v32[1].__fmtflags_ = 48;
  v35 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v35, (uint64_t)")", 1);
  if ((BYTE8(v72) & 0x10) != 0)
  {
    v38 = v72;
    if ((unint64_t)v72 < *((_QWORD *)&v69 + 1))
    {
      *(_QWORD *)&v72 = *((_QWORD *)&v69 + 1);
      v38 = *((_QWORD *)&v69 + 1);
    }
    v39 = (const void *)v69;
    v36 = v38 - v69;
    if ((unint64_t)(v38 - v69) > 0x7FFFFFFFFFFFFFF7)
      goto LABEL_78;
  }
  else
  {
    if ((BYTE8(v72) & 8) == 0)
    {
      v36 = 0;
      HIBYTE(v63) = 0;
      p_value = &value;
      goto LABEL_39;
    }
    v39 = (const void *)*((_QWORD *)&v67 + 1);
    v36 = *((_QWORD *)&v68 + 1) - *((_QWORD *)&v67 + 1);
    if (*((_QWORD *)&v68 + 1) - *((_QWORD *)&v67 + 1) > 0x7FFFFFFFFFFFFFF7uLL)
LABEL_78:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v36 >= 0x17)
  {
    v40 = (v36 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v36 | 7) != 0x17)
      v40 = v36 | 7;
    v41 = v40 + 1;
    p_value = operator new(v40 + 1);
    v62 = v36;
    v63 = v41 | 0x8000000000000000;
    value = p_value;
    goto LABEL_38;
  }
  HIBYTE(v63) = v36;
  p_value = &value;
  if (v36)
LABEL_38:
    memmove(p_value, v39, v36);
LABEL_39:
  *((_BYTE *)p_value + v36) = 0;
  if (v63 >= 0)
    v42 = (const char *)&value;
  else
    v42 = (const char *)value;
  v43 = xpc_string_create(v42);
  v64 = v43;
  if (!v43)
  {
    v43 = xpc_null_create();
    v64 = v43;
  }
  print_tlv_field_pair("fResultCode", &v64, &v75);
  v44 = v75;
  xpc_array_append_value(*(xpc_object_t *)(a3 + 32), v75);
  xpc_release(v44);
  v75 = 0;
  xpc_release(v43);
  if ((SHIBYTE(v63) & 0x80000000) == 0)
  {
    if (v9)
      goto LABEL_46;
LABEL_51:
    if (!v10)
    {
      v49 = xpc_string_create("none");
      v75 = v49;
      if (!v49)
      {
        v49 = xpc_null_create();
        v75 = v49;
      }
      print_tlv_field_pair("fError", &v75, &value);
      v50 = value;
      xpc_array_append_value(*(xpc_object_t *)(a3 + 32), value);
      xpc_release(v50);
      value = 0;
      xpc_release(v49);
    }
    goto LABEL_66;
  }
  operator delete(value);
  if (!v9)
    goto LABEL_51;
LABEL_46:
  v45 = qmi::asString(v10);
  v46 = strlen(v45);
  if (v46 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  v47 = v46;
  if (v46 >= 0x17)
  {
    v51 = (v46 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v46 | 7) != 0x17)
      v51 = v46 | 7;
    v52 = v51 + 1;
    v48 = operator new(v51 + 1);
    v62 = v47;
    v63 = v52 | 0x8000000000000000;
    value = v48;
  }
  else
  {
    HIBYTE(v63) = v46;
    v48 = &value;
    if (!v46)
      goto LABEL_59;
  }
  memmove(v48, v45, v47);
LABEL_59:
  *((_BYTE *)v48 + v47) = 0;
  if (v63 >= 0)
    v53 = (const char *)&value;
  else
    v53 = (const char *)value;
  v54 = xpc_string_create(v53);
  v64 = v54;
  if (!v54)
  {
    v54 = xpc_null_create();
    v64 = v54;
  }
  print_tlv_field_pair("fError", &v64, &v75);
  v55 = v75;
  xpc_array_append_value(*(xpc_object_t *)(a3 + 32), v75);
  xpc_release(v55);
  v75 = 0;
  xpc_release(v54);
  if (SHIBYTE(v63) < 0)
    operator delete(value);
LABEL_66:
  v56 = (std::locale::__imp *)*MEMORY[0x24BEDB7F0];
  __dst[0].__locale_ = v56;
  v58 = *(std::locale::__imp **)(MEMORY[0x24BEDB7F0] + 64);
  v57 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(std::locale::__imp **)((char *)&__dst[0].__locale_ + *((_QWORD *)v56 - 3)) = v58;
  v59 = MEMORY[0x24BEDB848] + 16;
  *(_QWORD *)&v66 = v57;
  *((_QWORD *)&v66 + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v71) < 0)
    operator delete(__p[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x212BC1680](v73);
  *(_QWORD *)&v76 = v56;
  *(_QWORD *)((char *)&v76 + *((_QWORD *)v56 - 3)) = v58;
  *(_QWORD *)&v77 = v57;
  *((_QWORD *)&v77 + 1) = v59;
  if (SHIBYTE(v82) < 0)
    operator delete(v81[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x212BC1680](v84);
LABEL_71:
  result = MEMORY[0x212BC1854](*(_QWORD *)(a3 + 32));
  if (result != MEMORY[0x24BDACF78] || (result = xpc_array_get_count(*(xpc_object_t *)(a3 + 32))) == 0)
    *(_BYTE *)(a3 + 24) = 3;
  return result;
}

void sub_20E6108C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, std::locale a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  xpc_object_t *v55;
  void *v56;
  void *v57;

  xpc_release(v57);
  xpc_release(v56);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a16);
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a55);
  TlvAnnotation::~TlvAnnotation(v55);
  _Unwind_Resume(a1);
}

void sub_20E610A78(_Unwind_Exception *a1)
{
  xpc_object_t *v1;

  TlvAnnotation::~TlvAnnotation(v1);
  _Unwind_Resume(a1);
}

void TlvDefinitionImpl<QmiResultCode,(unsigned char)2>::build(xpc_object_t *a1@<X1>, _QWORD *a2@<X8>)
{
  _WORD *v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  std::runtime_error *exception;
  std::runtime_error *v10;
  xpc_object_t object;
  BOOL v12;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v4 = operator new(4uLL);
  *(_DWORD *)v4 = 0;
  *a2 = v4;
  a2[1] = v4 + 2;
  a2[2] = v4 + 2;
  extract_tlv_field(a1, "fResult", 0, &object);
  v12 = 0;
  v5 = sAttemptDecodeNumber(&object, &v12);
  if (!v12 || (v6 = v5, v5 >= 0x10000))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "UInt16 field is a number but out of range");
    exception->__vftable = (std::runtime_error_vtbl *)off_24C9755C8;
  }
  xpc_release(object);
  extract_tlv_field(a1, "fResultCode", 1uLL, &object);
  v12 = 0;
  v7 = sAttemptDecodeNumber(&object, &v12);
  if (!v12 || (v8 = v7, v7 >= 0x10000))
  {
    v10 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v10, "UInt16 field is a number but out of range");
    v10->__vftable = (std::runtime_error_vtbl *)off_24C9755C8;
  }
  xpc_release(object);
  *v4 = v6;
  v4[1] = v8;
}

void sub_20E610BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, xpc_object_t object)
{
  void *v9;
  uint64_t v10;
  void *v11;

  __cxa_free_exception(v11);
  xpc_release(object);
  *(_QWORD *)(v10 + 8) = v9;
  operator delete(v9);
  _Unwind_Resume(a1);
}

uint64_t std::multimap<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>::~multimap[abi:ne180100](uint64_t a1)
{
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::destroy(*(_QWORD **)(a1 + 8));
  return a1;
}

_QWORD *QmiMessageRegistry::create@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *result;

  v3 = operator new(0x30uLL);
  v3[1] = 0;
  v3[2] = 0;
  *v3 = off_24C975778;
  v3[5] = 0;
  v4 = v3;
  a1[1] = v3;
  v3[4] = 0;
  result = v3 + 4;
  v4[3] = result;
  *a1 = v4 + 3;
  return result;
}

_DWORD *QmiMessageRegistry::registerClass(uint64_t **this, const QmiMessageDefinition *a2)
{
  const QmiMessageDefinition *v3;
  int v4;
  __int16 v5;

  v4 = -1431655766;
  v5 = -21846;
  LOBYTE(v4) = *((_BYTE *)a2 + 16);
  HIWORD(v4) = *((_WORD *)a2 + 9);
  LOBYTE(v5) = *((_BYTE *)a2 + 20);
  v3 = a2;
  return std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(this, (uint64_t)&v4, &v3);
}

void QmiMessageRegistry::getAllQmiMessageDefinitions(QmiMessageRegistry **this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  QmiMessageRegistry **v3;
  QmiMessageRegistry *v4;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  const char *v11;
  size_t v12;
  size_t v13;
  char *v14;
  uint64_t v15;
  __int16 v16;
  char v17;
  const char *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  _BYTE *v26;
  size_t v27;
  size_t v28;
  char *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  __int128 v35;
  void **v36;
  uint64_t v37;
  uint64_t v38;
  QmiMessageRegistry *v39;
  QmiMessageRegistry **v40;
  BOOL v41;
  char *v42;

  a2[2] = 0;
  v2 = a2 + 2;
  *a2 = 0;
  a2[1] = 0;
  v3 = this + 1;
  v4 = *this;
  if (*this != (QmiMessageRegistry *)(this + 1))
  {
    v6 = 0;
    do
    {
      v7 = *((_QWORD *)v4 + 5);
      v8 = *v2;
      v9 = *(_BYTE *)(v7 + 16);
      if ((unint64_t)v6 >= *v2)
      {
        v14 = (char *)*a2;
        v15 = (uint64_t)&v6[-*a2] >> 5;
        if ((unint64_t)(v15 + 1) >> 59)
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        v16 = *(_WORD *)(v7 + 18);
        v17 = *(_BYTE *)(v7 + 20);
        v18 = *(const char **)(v7 + 8);
        v19 = v8 - (_QWORD)v14;
        v20 = (v8 - (uint64_t)v14) >> 4;
        if (v20 <= v15 + 1)
          v20 = v15 + 1;
        if (v19 >= 0x7FFFFFFFFFFFFFE0)
          v21 = 0x7FFFFFFFFFFFFFFLL;
        else
          v21 = v20;
        if (v21)
        {
          if (v21 >> 59)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v22 = (char *)operator new(32 * v21);
        }
        else
        {
          v22 = 0;
        }
        v25 = &v22[32 * v15];
        v42 = &v22[32 * v21];
        *v25 = v9;
        *((_WORD *)v25 + 1) = v16;
        v26 = v25 + 8;
        v25[4] = v17;
        v27 = strlen(v18);
        if (v27 > 0x7FFFFFFFFFFFFFF7)
          std::string::__throw_length_error[abi:ne180100]();
        v28 = v27;
        if (v27 >= 0x17)
        {
          v37 = (v27 & 0xFFFFFFFFFFFFFFF8) + 8;
          if ((v27 | 7) != 0x17)
            v37 = v27 | 7;
          v38 = v37 + 1;
          v26 = operator new(v37 + 1);
          *((_QWORD *)v25 + 2) = v28;
          *((_QWORD *)v25 + 3) = v38 | 0x8000000000000000;
          *((_QWORD *)v25 + 1) = v26;
        }
        else
        {
          v25[31] = v27;
          if (!v27)
          {
            *v26 = 0;
            v29 = v25;
            v6 = v25 + 32;
            v30 = (char *)*a2;
            v31 = (char *)a2[1];
            if (v31 != (char *)*a2)
              goto LABEL_28;
LABEL_39:
            *a2 = v29;
            a2[1] = v6;
            a2[2] = v42;
            goto LABEL_40;
          }
        }
        memmove(v26, v18, v28);
        v26[v28] = 0;
        v29 = v25;
        v6 = v25 + 32;
        v30 = (char *)*a2;
        v31 = (char *)a2[1];
        if (v31 == (char *)*a2)
          goto LABEL_39;
LABEL_28:
        v32 = 0;
        do
        {
          v33 = &v29[v32];
          v34 = &v31[v32];
          *(v33 - 32) = v31[v32 - 32];
          *((_WORD *)v33 - 15) = *(_WORD *)&v31[v32 - 30];
          *(v33 - 28) = v31[v32 - 28];
          v35 = *(_OWORD *)&v31[v32 - 24];
          *((_QWORD *)v33 - 1) = *(_QWORD *)&v31[v32 - 8];
          *(_OWORD *)(v33 - 24) = v35;
          *((_QWORD *)v34 - 2) = 0;
          *((_QWORD *)v34 - 1) = 0;
          *((_QWORD *)v34 - 3) = 0;
          v32 -= 32;
        }
        while (&v31[v32] != v30);
        v31 = (char *)*a2;
        v36 = (void **)a2[1];
        *a2 = &v29[v32];
        a2[1] = v6;
        a2[2] = v42;
        while (v36 != (void **)v31)
        {
          if (*((char *)v36 - 1) < 0)
            operator delete(*(v36 - 3));
          v36 -= 4;
        }
LABEL_40:
        if (v31)
          operator delete(v31);
        goto LABEL_42;
      }
      *v6 = v9;
      *((_WORD *)v6 + 1) = *(_WORD *)(v7 + 18);
      v6[4] = *(_BYTE *)(v7 + 20);
      v10 = v6 + 8;
      v11 = *(const char **)(v7 + 8);
      v12 = strlen(v11);
      if (v12 > 0x7FFFFFFFFFFFFFF7)
        std::string::__throw_length_error[abi:ne180100]();
      v13 = v12;
      if (v12 >= 0x17)
      {
        v23 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17)
          v23 = v12 | 7;
        v24 = v23 + 1;
        v10 = operator new(v23 + 1);
        *((_QWORD *)v6 + 2) = v13;
        *((_QWORD *)v6 + 3) = v24 | 0x8000000000000000;
        *((_QWORD *)v6 + 1) = v10;
      }
      else
      {
        v6[31] = v12;
        if (!v12)
          goto LABEL_22;
      }
      memmove(v10, v11, v13);
LABEL_22:
      *((_BYTE *)v10 + v13) = 0;
      v6 += 32;
      a2[1] = v6;
LABEL_42:
      a2[1] = v6;
      v39 = (QmiMessageRegistry *)*((_QWORD *)v4 + 1);
      if (v39)
      {
        do
        {
          v40 = (QmiMessageRegistry **)v39;
          v39 = *(QmiMessageRegistry **)v39;
        }
        while (v39);
      }
      else
      {
        do
        {
          v40 = (QmiMessageRegistry **)*((_QWORD *)v4 + 2);
          v41 = *v40 == v4;
          v4 = (QmiMessageRegistry *)v40;
        }
        while (!v41);
      }
      v4 = (QmiMessageRegistry *)v40;
    }
    while (v40 != v3);
  }
}

void sub_20E611074(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void **v2;
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType,std::string>>::~__split_buffer((uint64_t)va);
  std::vector<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType,std::string>>::~vector[abi:ne180100](v2);
  _Unwind_Resume(a1);
}

void sub_20E6110C4(_Unwind_Exception *a1)
{
  void **v1;

  std::vector<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType,std::string>>::~vector[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void **std::vector<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType,std::string>>::~vector[abi:ne180100](void **a1)
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
        v3 -= 4;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

void QmiMessageRegistry::getDefinitions(uint64_t a1@<X0>, unsigned int a2@<W1>, unsigned int a3@<W2>, unsigned int a4@<W3>, char **a5@<X8>)
{
  uint64_t v9;
  uint64_t *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  BOOL v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  BOOL v20;
  uint64_t *v21;
  unsigned int v22;
  BOOL v23;
  char v24;
  unsigned int v25;
  BOOL v26;
  unsigned int v27;
  BOOL v28;
  uint64_t v29;
  BOOL v30;
  uint64_t *v31;
  unsigned int v32;
  BOOL v33;
  char v34;
  unsigned int v35;
  BOOL v36;
  unsigned int v37;
  BOOL v38;
  uint64_t v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  BOOL v43;
  char v44;
  char v45;
  char v46;
  uint64_t v47;
  BOOL v48;
  uint64_t *v49;
  unsigned int v50;
  BOOL v51;
  char v52;
  unsigned int v53;
  BOOL v54;
  unsigned int v55;
  BOOL v56;
  uint64_t v57;
  BOOL v58;
  uint64_t *v59;
  unsigned int v60;
  BOOL v61;
  char v62;
  unsigned int v63;
  BOOL v64;
  unsigned int v65;
  BOOL v66;
  char *v67;
  void **v68;
  __int128 v69;
  _QWORD *v70;
  const char *v71;
  size_t v72;
  _QWORD *v73;
  _QWORD *v74;
  const char *v75;
  size_t v76;
  _QWORD *v77;
  size_t v78;
  __int128 *p_dst;
  uint64_t v80;
  const void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t *v88;
  unsigned int v89;
  BOOL v90;
  char v91;
  unsigned int v92;
  BOOL v93;
  unsigned int v94;
  BOOL v95;
  uint64_t *v96;
  uint64_t *v97;
  uint64_t *v98;
  char *v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t *v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t v108;
  _BYTE *v109;
  char *v110;
  uint64_t v111;
  char *v112;
  unint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t *v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  _OWORD *v120;
  char *v121;
  uint64_t v122;
  __int128 v123;
  __int128 __dst;
  unint64_t v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  void *__p[2];
  __int128 v132;
  __int128 v133;
  _OWORD v134[9];
  unint64_t v135;

  v10 = (uint64_t *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 8);
  if (!v9)
    goto LABEL_76;
  while (1)
  {
    while (1)
    {
      v11 = *(unsigned __int8 *)(v9 + 32);
      if (v11 == a2)
        break;
      if (v11 > a2)
        goto LABEL_3;
      if (v11 >= a2)
        v16 = 1;
      else
        v16 = -1;
      if ((v16 & 0x80) == 0)
        goto LABEL_27;
LABEL_25:
      v9 = *(_QWORD *)(v9 + 8);
      if (!v9)
        goto LABEL_76;
    }
    v12 = *(unsigned __int16 *)(v9 + 34);
    if (v12 != a3)
    {
      if (v12 > a3)
        goto LABEL_3;
      if (v12 >= a3)
        v17 = 1;
      else
        v17 = -1;
      if ((v17 & 0x80) == 0)
        goto LABEL_27;
      goto LABEL_25;
    }
    v13 = *(unsigned __int8 *)(v9 + 36);
    v14 = v13 == a4;
    if (v13 <= a4)
      break;
LABEL_3:
    v10 = (uint64_t *)v9;
    v9 = *(_QWORD *)v9;
    if (!v9)
      goto LABEL_76;
  }
  if (v13 >= a4)
    v15 = 1;
  else
    v15 = -1;
  if (v14)
    v15 = 0;
  if (v15 < 0)
    goto LABEL_25;
LABEL_27:
  v18 = *(_QWORD *)v9;
  v19 = (uint64_t *)v9;
  if (*(_QWORD *)v9)
  {
    v19 = (uint64_t *)v9;
    do
    {
      v22 = *(unsigned __int8 *)(v18 + 32);
      v23 = v22 == a2;
      if (v22 >= a2)
        v24 = 1;
      else
        v24 = -1;
      if (v23)
      {
        v25 = *(unsigned __int16 *)(v18 + 34);
        v26 = v25 == a3;
        v24 = v25 >= a3 ? 1 : -1;
        if (v26)
        {
          v27 = *(unsigned __int8 *)(v18 + 36);
          v28 = v27 == a4;
          v24 = v27 >= a4 ? 1 : -1;
          if (v28)
            v24 = 0;
        }
      }
      v20 = (v24 & 0x80) == 0;
      if (v24 < 0)
        v21 = (uint64_t *)(v18 + 8);
      else
        v21 = (uint64_t *)v18;
      if (v20)
        v19 = (uint64_t *)v18;
      v18 = *v21;
    }
    while (*v21);
  }
  v29 = *(_QWORD *)(v9 + 8);
  if (v29)
  {
    do
    {
      v32 = *(unsigned __int8 *)(v29 + 32);
      v33 = v32 == a2;
      if (v32 <= a2)
        v34 = 1;
      else
        v34 = -1;
      if (v33)
      {
        v35 = *(unsigned __int16 *)(v29 + 34);
        v36 = v35 == a3;
        v34 = v35 <= a3 ? 1 : -1;
        if (v36)
        {
          v37 = *(unsigned __int8 *)(v29 + 36);
          v38 = v37 == a4;
          v34 = v37 <= a4 ? 1 : -1;
          if (v38)
            v34 = 0;
        }
      }
      v30 = (v34 & 0x80) == 0;
      if (v34 < 0)
        v31 = (uint64_t *)v29;
      else
        v31 = (uint64_t *)(v29 + 8);
      if (!v30)
        v10 = (uint64_t *)v29;
      v29 = *v31;
    }
    while (*v31);
  }
  if (v19 != v10)
    goto LABEL_202;
LABEL_76:
  v39 = qword_253D0B378;
  if (!qword_253D0B378)
    goto LABEL_151;
  v10 = &qword_253D0B378;
  while (2)
  {
    while (2)
    {
      v40 = *(unsigned __int8 *)(v39 + 32);
      if (v40 != a2)
      {
        if (v40 > a2)
          goto LABEL_78;
        if (v40 >= a2)
          v45 = 1;
        else
          v45 = -1;
        if ((v45 & 0x80) == 0)
          goto LABEL_102;
        goto LABEL_100;
      }
      v41 = *(unsigned __int16 *)(v39 + 34);
      if (v41 != a3)
      {
        if (v41 > a3)
        {
LABEL_78:
          v10 = (uint64_t *)v39;
          v39 = *(_QWORD *)v39;
          if (!v39)
            goto LABEL_151;
          continue;
        }
        if (v41 >= a3)
          v46 = 1;
        else
          v46 = -1;
        if ((v46 & 0x80) == 0)
          goto LABEL_102;
        goto LABEL_100;
      }
      break;
    }
    v42 = *(unsigned __int8 *)(v39 + 36);
    v43 = v42 == a4;
    if (v42 > a4)
      goto LABEL_78;
    if (v42 >= a4)
      v44 = 1;
    else
      v44 = -1;
    if (v43)
      v44 = 0;
    if (v44 < 0)
    {
LABEL_100:
      v39 = *(_QWORD *)(v39 + 8);
      if (!v39)
        goto LABEL_151;
      continue;
    }
    break;
  }
LABEL_102:
  v47 = *(_QWORD *)v39;
  v19 = (uint64_t *)v39;
  if (*(_QWORD *)v39)
  {
    v19 = (uint64_t *)v39;
    do
    {
      v50 = *(unsigned __int8 *)(v47 + 32);
      v51 = v50 == a2;
      if (v50 >= a2)
        v52 = 1;
      else
        v52 = -1;
      if (v51)
      {
        v53 = *(unsigned __int16 *)(v47 + 34);
        v54 = v53 == a3;
        v52 = v53 >= a3 ? 1 : -1;
        if (v54)
        {
          v55 = *(unsigned __int8 *)(v47 + 36);
          v56 = v55 == a4;
          v52 = v55 >= a4 ? 1 : -1;
          if (v56)
            v52 = 0;
        }
      }
      v48 = (v52 & 0x80) == 0;
      if (v52 < 0)
        v49 = (uint64_t *)(v47 + 8);
      else
        v49 = (uint64_t *)v47;
      if (v48)
        v19 = (uint64_t *)v47;
      v47 = *v49;
    }
    while (*v49);
  }
  v57 = *(_QWORD *)(v39 + 8);
  if (v57)
  {
    do
    {
      v60 = *(unsigned __int8 *)(v57 + 32);
      v61 = v60 == a2;
      if (v60 <= a2)
        v62 = 1;
      else
        v62 = -1;
      if (v61)
      {
        v63 = *(unsigned __int16 *)(v57 + 34);
        v64 = v63 == a3;
        v62 = v63 <= a3 ? 1 : -1;
        if (v64)
        {
          v65 = *(unsigned __int8 *)(v57 + 36);
          v66 = v65 == a4;
          v62 = v65 <= a4 ? 1 : -1;
          if (v66)
            v62 = 0;
        }
      }
      v58 = (v62 & 0x80) == 0;
      if (v62 < 0)
        v59 = (uint64_t *)v57;
      else
        v59 = (uint64_t *)(v57 + 8);
      if (!v58)
        v10 = (uint64_t *)v57;
      v57 = *v59;
    }
    while (*v59);
  }
  if (v19 != v10)
    goto LABEL_202;
LABEL_151:
  v67 = (char *)operator new(0x30uLL);
  *((_QWORD *)v67 + 3) = 0;
  v68 = (void **)(v67 + 24);
  *((_QWORD *)v67 + 4) = 0;
  *((_QWORD *)v67 + 5) = 0;
  v135 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v69 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v69 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v134[7] = v69;
  v134[8] = v69;
  v134[5] = v69;
  v134[6] = v69;
  v134[3] = v69;
  v134[4] = v69;
  v134[1] = v69;
  v134[2] = v69;
  v133 = v69;
  v134[0] = v69;
  *(_OWORD *)__p = v69;
  v132 = v69;
  v129 = v69;
  v130 = v69;
  v127 = v69;
  v128 = v69;
  v126 = v69;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v126);
  v70 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v127, (uint64_t)"(unknown ", 9);
  v71 = qmi::asShortString(a2);
  v72 = strlen(v71);
  v73 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v70, (uint64_t)v71, v72);
  v74 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v73, (uint64_t)" ", 1);
  if (a4 > 2)
    v75 = (const char *)&unk_20E62122A;
  else
    v75 = off_24C9757E8[(char)a4];
  v76 = strlen(v75);
  v77 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v74, (uint64_t)v75, v76);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v77, (uint64_t)")", 1);
  if ((BYTE8(v133) & 0x10) != 0)
  {
    v80 = v133;
    if ((unint64_t)v133 < *((_QWORD *)&v130 + 1))
    {
      *(_QWORD *)&v133 = *((_QWORD *)&v130 + 1);
      v80 = *((_QWORD *)&v130 + 1);
    }
    v81 = (const void *)v130;
    v78 = v80 - v130;
    if ((unint64_t)(v80 - v130) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_243;
  }
  else
  {
    if ((BYTE8(v133) & 8) == 0)
    {
      v78 = 0;
      HIBYTE(v125) = 0;
      p_dst = &__dst;
      goto LABEL_167;
    }
    v81 = (const void *)*((_QWORD *)&v128 + 1);
    v78 = *((_QWORD *)&v129 + 1) - *((_QWORD *)&v128 + 1);
    if (*((_QWORD *)&v129 + 1) - *((_QWORD *)&v128 + 1) >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_243:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v78 >= 0x17)
  {
    v82 = (v78 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v78 | 7) != 0x17)
      v82 = v78 | 7;
    v83 = v82 + 1;
    p_dst = (__int128 *)operator new(v82 + 1);
    *((_QWORD *)&__dst + 1) = v78;
    v125 = v83 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_166;
  }
  HIBYTE(v125) = v78;
  p_dst = &__dst;
  if (v78)
LABEL_166:
    memmove(p_dst, v81, v78);
LABEL_167:
  *((_BYTE *)p_dst + v78) = 0;
  if (v67[47] < 0)
    operator delete(*v68);
  *(_OWORD *)v68 = __dst;
  *((_QWORD *)v67 + 5) = v125;
  *(_QWORD *)&v126 = *MEMORY[0x24BEDB7F0];
  v84 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)&v126 + *(_QWORD *)(v126 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&v127 = v84;
  *((_QWORD *)&v127 + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v132) < 0)
    operator delete(__p[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x212BC1680](v134);
  *(_QWORD *)v67 = &off_24C9756A8;
  if (v67[47] < 0)
    v68 = (void **)*v68;
  v67[16] = a2;
  *((_WORD *)v67 + 9) = a3;
  v67[20] = a4;
  *(_QWORD *)v67 = &off_24C9756A8;
  *((_QWORD *)v67 + 1) = v68;
  v85 = (uint64_t *)operator new(0x30uLL);
  v19 = v85;
  *((_BYTE *)v85 + 32) = a2;
  *((_BYTE *)v85 + 33) = -86;
  *((_WORD *)v85 + 17) = a3;
  *((_BYTE *)v85 + 36) = a4;
  *((_BYTE *)v85 + 37) = -86;
  v85[5] = (uint64_t)v67;
  v86 = qword_253D0B378;
  if (qword_253D0B378)
  {
    do
    {
      while (1)
      {
        v88 = (uint64_t *)v86;
        v89 = *(unsigned __int8 *)(v86 + 32);
        v90 = v89 == a2;
        if (v89 <= a2)
          v91 = 1;
        else
          v91 = -1;
        if (v90)
        {
          v92 = *(unsigned __int16 *)(v86 + 34);
          v93 = v92 == a3;
          v91 = v92 <= a3 ? 1 : -1;
          if (v93)
          {
            v94 = *(unsigned __int8 *)(v86 + 36);
            v95 = v94 == a4;
            v91 = v94 <= a4 ? 1 : -1;
            if (v95)
              v91 = 0;
          }
        }
        if ((v91 & 0x80) == 0)
          break;
        v86 = *(_QWORD *)v86;
        v87 = v88;
        if (!*v88)
          goto LABEL_195;
      }
      v86 = *(_QWORD *)(v86 + 8);
    }
    while (v86);
    v87 = v88 + 1;
  }
  else
  {
    v88 = &qword_253D0B378;
    v87 = &qword_253D0B378;
  }
LABEL_195:
  *v85 = 0;
  v85[1] = 0;
  v85[2] = (uint64_t)v88;
  *v87 = (uint64_t)v85;
  v96 = v85;
  if (*(_QWORD *)qword_253D0B370)
  {
    qword_253D0B370 = *(_QWORD *)qword_253D0B370;
    v96 = (uint64_t *)*v87;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)qword_253D0B378, v96);
  ++qword_253D0B380;
  v97 = (uint64_t *)v19[1];
  if (v97)
  {
    do
    {
      v10 = v97;
      v97 = (uint64_t *)*v97;
    }
    while (v97);
  }
  else
  {
    v10 = v19;
    do
    {
      v98 = v10;
      v10 = (uint64_t *)v10[2];
    }
    while ((uint64_t *)*v10 != v98);
  }
LABEL_202:
  *a5 = 0;
  a5[1] = 0;
  a5[2] = 0;
  if (v19 != v10)
  {
    v99 = 0;
    while (1)
    {
      v100 = v19[5];
      v101 = (unint64_t)a5[2];
      if ((unint64_t)v99 < v101)
      {
        *(_QWORD *)v99 = v100;
        v99 += 8;
        a5[1] = v99;
        v102 = (uint64_t *)v19[1];
        if (v102)
          goto LABEL_226;
        goto LABEL_228;
      }
      v103 = *a5;
      v104 = v99 - *a5;
      v105 = v104 >> 3;
      v106 = (v104 >> 3) + 1;
      if (v106 >> 61)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      v107 = v101 - (_QWORD)v103;
      if (v107 >> 2 > v106)
        v106 = v107 >> 2;
      if ((unint64_t)v107 >= 0x7FFFFFFFFFFFFFF8)
        v108 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v108 = v106;
      if (v108)
      {
        if (v108 >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v109 = operator new(8 * v108);
        v110 = &v109[8 * v105];
        *(_QWORD *)v110 = v100;
        v111 = (uint64_t)(v110 + 8);
        v112 = (char *)(v99 - v103);
        if (v99 == v103)
        {
LABEL_223:
          *a5 = v110;
          a5[1] = (char *)v111;
          a5[2] = &v109[8 * v108];
          if (!v99)
            goto LABEL_225;
LABEL_224:
          operator delete(v99);
          goto LABEL_225;
        }
      }
      else
      {
        v109 = 0;
        v110 = (char *)(8 * v105);
        *(_QWORD *)(8 * v105) = v100;
        v111 = 8 * v105 + 8;
        v112 = (char *)(v99 - v103);
        if (v99 == v103)
          goto LABEL_223;
      }
      v113 = (unint64_t)(v112 - 8);
      if (v113 < 0x168)
      {
        v114 = v99;
        goto LABEL_219;
      }
      v117 = (v99 - 8 - v103) & 0xFFFFFFFFFFFFFFF8;
      if (&v109[v104 - 8 - v117] > &v109[v104 - 8])
        break;
      if (&v99[-v117 - 8] > v99 - 8)
      {
        v114 = v99;
        goto LABEL_219;
      }
      if ((unint64_t)(v99 - v109 - v104) < 0x20)
      {
        v114 = v99;
        goto LABEL_219;
      }
      v118 = (v113 >> 3) + 1;
      v119 = 8 * (v118 & 0x3FFFFFFFFFFFFFFCLL);
      v114 = &v99[-v119];
      v110 -= v119;
      v120 = &v109[8 * v105 - 16];
      v121 = v99 - 16;
      v122 = v118 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v123 = *(_OWORD *)v121;
        *(v120 - 1) = *((_OWORD *)v121 - 1);
        *v120 = v123;
        v120 -= 2;
        v121 -= 32;
        v122 -= 4;
      }
      while (v122);
      if (v118 != (v118 & 0x3FFFFFFFFFFFFFFCLL))
        goto LABEL_219;
LABEL_220:
      v99 = *a5;
      *a5 = v110;
      a5[1] = (char *)v111;
      a5[2] = &v109[8 * v108];
      if (v99)
        goto LABEL_224;
LABEL_225:
      v99 = (char *)v111;
      a5[1] = (char *)v111;
      v102 = (uint64_t *)v19[1];
      if (v102)
      {
        do
        {
LABEL_226:
          v116 = v102;
          v102 = (uint64_t *)*v102;
        }
        while (v102);
        goto LABEL_204;
      }
      do
      {
LABEL_228:
        v116 = (uint64_t *)v19[2];
        v14 = *v116 == (_QWORD)v19;
        v19 = v116;
      }
      while (!v14);
LABEL_204:
      v19 = v116;
      if (v116 == v10)
        return;
    }
    v114 = v99;
    do
    {
LABEL_219:
      v115 = *((_QWORD *)v114 - 1);
      v114 -= 8;
      *((_QWORD *)v110 - 1) = v115;
      v110 -= 8;
    }
    while (v114 != v103);
    goto LABEL_220;
  }
}

void sub_20E6119AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  char *v29;
  void **v30;

  if (v29[47] < 0)
    operator delete(*v30);
  operator delete(v29);
  _Unwind_Resume(a1);
}

uint64_t *QmiMessageDefinition::getDefaultTlvDefinition(QmiMessageDefinition *this)
{
  unsigned __int8 v1;

  if ((v1 & 1) != 0
  {
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  }
  QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
  *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t std::__split_buffer<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType,std::string>>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      v5 = v2 - 32;
      *(_QWORD *)(a1 + 16) = v2 - 32;
      if (*(char *)(v2 - 1) < 0)
      {
        operator delete(*(void **)(v2 - 24));
        v5 = *(_QWORD *)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != v3);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t *`anonymous namespace'::UnknownQmiMessageDefinition::getTlvDefinition(_anonymous_namespace_::UnknownQmiMessageDefinition *this, int a2)
{
  unsigned __int8 v3;

  if (a2 == 2 && *((_BYTE *)this + 20) == 1)
    return &_MergedGlobals_0;
  if ((v3 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *`anonymous namespace'::UnknownQmiMessageDefinition::getTlvDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v8;

  if (*(_BYTE *)(a1 + 20) == 1)
  {
    v2 = *(unsigned __int8 *)(a2 + 23);
    v3 = (char)v2;
    if ((v2 & 0x80u) != 0)
      v2 = *(_QWORD *)(a2 + 8);
    if (v2 == 13)
    {
      v4 = v3 >= 0 ? (uint64_t *)a2 : *(uint64_t **)a2;
      v5 = *v4;
      v6 = *(uint64_t *)((char *)v4 + 5);
      if (v5 == 0x6C75736552696D51 && v6 == 0x65646F43746C7573)
        return &_MergedGlobals_0;
    }
  }
  if ((v8 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

void `anonymous namespace'::UnknownQmiMessageDefinition::~UnknownQmiMessageDefinition(void **this)
{
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
}

{
  _anonymous_namespace_::UnknownQmiMessageDefinition *v1;

  v1 = (_anonymous_namespace_::UnknownQmiMessageDefinition *)this;
  if (*((char *)this + 47) < 0)
  {
    operator delete(this[3]);
    this = (void **)v1;
  }
  operator delete(this);
}

void `anonymous namespace'::UnknownTlvType::parse(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v6;
  std::string *v7;
  std::string *p_p;
  xpc_object_t v9;
  xpc_object_t v10;
  std::string __p;
  xpc_object_t v12;
  xpc_object_t value;

  *(_QWORD *)(a3 + 32) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)a3 = v6;
  *(_OWORD *)(a3 + 16) = v6;
  TlvAnnotation::TlvAnnotation((TlvAnnotation *)a3);
  std::string::__assign_external(v7, *(const std::string::value_type **)(a1 + 8));
  *(_BYTE *)(a3 + 24) = 1;
  print_tlv_field(*(_BYTE **)a2, *(_QWORD *)(a2 + 8) - *(_QWORD *)a2, 2u, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  v9 = xpc_string_create((const char *)p_p);
  v12 = v9;
  if (!v9)
  {
    v9 = xpc_null_create();
    v12 = v9;
  }
  print_tlv_field_pair("bytes", &v12, &value);
  v10 = value;
  xpc_array_append_value(*(xpc_object_t *)(a3 + 32), value);
  xpc_release(v10);
  value = 0;
  xpc_release(v9);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_20E611E74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  xpc_object_t *v17;
  void *v18;
  void *v19;
  void *v20;

  v20 = v19;
  xpc_release(v20);
  xpc_release(v18);
  if (a15 < 0)
  {
    operator delete(__p);
    TlvAnnotation::~TlvAnnotation(v17);
    _Unwind_Resume(a1);
  }
  TlvAnnotation::~TlvAnnotation(v17);
  _Unwind_Resume(a1);
}

void `anonymous namespace'::UnknownTlvType::build(xpc_object_t *a1@<X1>, _QWORD *a2@<X8>)
{
  xpc_object_t v5;
  uint64_t v6;
  xpc_object_t object;
  __int128 v8;
  uint64_t v9;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  if (MEMORY[0x212BC1854](*a1) == MEMORY[0x24BDACF78])
  {
    extract_tlv_field(a1, "bytes", 0, &object);
    sAttemptToDecodeData((unint64_t *)&v8, &object);
    v5 = object;
    v6 = v9;
    *(_OWORD *)a2 = v8;
    a2[2] = v6;
    xpc_release(v5);
  }
}

void sub_20E611F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, xpc_object_t object)
{
  xpc_release(object);
  _Unwind_Resume(a1);
}

void std::string::__insert_from_safe_copy[abi:ne180100]<std::__wrap_iter<char const*>,std::__wrap_iter<char const*>>(char *a1, unint64_t a2, size_t a3, uint64_t a4, char *a5)
{
  unint64_t v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  char *v19;
  size_t v20;
  size_t v21;
  size_t v22;
  char *v23;
  unint64_t v24;
  char *v25;
  unint64_t v26;
  __int128 *v27;
  char *v28;
  unint64_t v29;
  __int128 v30;
  uint64_t *v31;
  char *v32;
  unint64_t v33;
  uint64_t v34;
  char v35;

  LODWORD(v10) = a1[23];
  if ((v10 & 0x80000000) != 0)
  {
    v11 = *((_QWORD *)a1 + 1);
    v15 = *((_QWORD *)a1 + 2);
    v16 = v15 & 0x7FFFFFFFFFFFFFFFLL;
    v13 = (v15 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v13 - v11 < a2)
    {
      v12 = v11 + a2;
      if (0x7FFFFFFFFFFFFFF8 - v16 >= v11 + a2 - v13)
      {
        v14 = *(char **)a1;
        if (v13 > 0x3FFFFFFFFFFFFFF2)
        {
          v18 = 0x7FFFFFFFFFFFFFF7;
          v19 = (char *)operator new(0x7FFFFFFFFFFFFFF7uLL);
          if (!a3)
            goto LABEL_17;
          goto LABEL_16;
        }
LABEL_8:
        if (v12 <= 2 * v13)
          v12 = 2 * v13;
        v17 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v12 | 7) != 0x17)
          v17 = v12 | 7;
        if (v12 >= 0x17)
          v18 = v17 + 1;
        else
          v18 = 23;
        v19 = (char *)operator new(v18);
        if (!a3)
          goto LABEL_17;
LABEL_16:
        memmove(v19, v14, a3);
LABEL_17:
        if (v11 != a3)
          memmove(&v19[a3 + a2], &v14[a3], v11 - a3);
        if (v13 != 22)
          operator delete(v14);
        *(_QWORD *)a1 = v19;
        *((_QWORD *)a1 + 2) = v18 | 0x8000000000000000;
        v20 = v11 + a2;
        goto LABEL_27;
      }
LABEL_48:
      std::string::__throw_length_error[abi:ne180100]();
    }
    v10 = HIBYTE(v15);
    v19 = *(char **)a1;
    v21 = a3;
    v22 = v11 - a3;
    if (v11 != a3)
      goto LABEL_23;
  }
  else
  {
    v11 = a1[23];
    if (22 - v11 < a2)
    {
      v12 = v11 + a2;
      if (v11 + a2 - 0x7FFFFFFFFFFFFFF8 >= 0x800000000000001ELL)
      {
        v13 = 22;
        v14 = a1;
        goto LABEL_8;
      }
      goto LABEL_48;
    }
    v19 = a1;
    v21 = a3;
    v22 = v11 - a3;
    if (v11 != a3)
    {
LABEL_23:
      memmove(&v19[a3 + a2], &v19[a3], v22);
      LOBYTE(v10) = a1[23];
      v21 = v11;
    }
  }
  v20 = v21 + a2;
  if ((v10 & 0x80) == 0)
  {
    a1[23] = v20 & 0x7F;
    v19[v20] = 0;
    if ((char *)a4 == a5)
      return;
    goto LABEL_28;
  }
LABEL_27:
  *((_QWORD *)a1 + 1) = v20;
  v19[v20] = 0;
  if ((char *)a4 == a5)
    return;
LABEL_28:
  v23 = &v19[a3];
  v24 = (unint64_t)&a5[-a4];
  if ((unint64_t)&a5[-a4] < 8)
  {
    v25 = (char *)a4;
    goto LABEL_46;
  }
  v25 = (char *)a4;
  if ((unint64_t)&v23[-a4] < 0x20)
  {
    do
    {
LABEL_46:
      v35 = *v25++;
      *v23++ = v35;
    }
    while (v25 != a5);
    return;
  }
  if (v24 < 0x20)
  {
    v26 = 0;
    goto LABEL_41;
  }
  v26 = v24 & 0xFFFFFFFFFFFFFFE0;
  v27 = (__int128 *)(a4 + 16);
  v28 = &v19[a3 + 16];
  v29 = v24 & 0xFFFFFFFFFFFFFFE0;
  do
  {
    v30 = *v27;
    *((_OWORD *)v28 - 1) = *(v27 - 1);
    *(_OWORD *)v28 = v30;
    v27 += 2;
    v28 += 32;
    v29 -= 32;
  }
  while (v29);
  if (v24 == v26)
    return;
  if ((v24 & 0x18) == 0)
  {
    v25 = (char *)(a4 + v26);
    v23 += v26;
    goto LABEL_46;
  }
LABEL_41:
  v23 += v24 & 0xFFFFFFFFFFFFFFF8;
  v25 = (char *)(a4 + (v24 & 0xFFFFFFFFFFFFFFF8));
  v31 = (uint64_t *)(a4 + v26);
  v32 = &v19[v26 + a3];
  v33 = v26 - (v24 & 0xFFFFFFFFFFFFFFF8);
  do
  {
    v34 = *v31++;
    *(_QWORD *)v32 = v34;
    v32 += 8;
    v33 += 8;
  }
  while (v33);
  if (v24 != (v24 & 0xFFFFFFFFFFFFFFF8))
    goto LABEL_46;
}

void std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::destroy(_QWORD *a1)
{
  if (a1)
  {
    std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::destroy(*a1);
    std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::destroy(a1[1]);
    operator delete(a1);
  }
}

void std::__shared_ptr_emplace<QmiMessageRegistryPrivate>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C975778;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<QmiMessageRegistryPrivate>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C975778;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<QmiMessageRegistryPrivate>::__on_zero_shared(uint64_t a1)
{
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::destroy(*(_QWORD **)(a1 + 32));
}

_DWORD *std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::__emplace_multi<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType> const&,QmiMessageDefinition const*>(uint64_t **a1, uint64_t a2, _QWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t **v8;
  uint64_t **v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t **v13;
  unsigned int v14;
  BOOL v15;
  char v16;
  unsigned int v17;
  BOOL v18;
  unsigned int v19;
  BOOL v20;
  uint64_t *v21;
  uint64_t *v22;

  v6 = operator new(0x30uLL);
  v7 = v6;
  v6[8] = *(_DWORD *)a2;
  *((_WORD *)v6 + 18) = *(_WORD *)(a2 + 4);
  *((_QWORD *)v6 + 5) = *a3;
  v8 = a1 + 1;
  v9 = (uint64_t **)a1[1];
  if (v9)
  {
    v10 = *((unsigned __int8 *)v6 + 32);
    v11 = *((unsigned __int16 *)v6 + 17);
    v12 = *((unsigned __int8 *)v6 + 36);
    do
    {
      while (1)
      {
        v8 = v9;
        v14 = *((unsigned __int8 *)v9 + 32);
        v15 = v10 == v14;
        if (v10 >= v14)
          v16 = 1;
        else
          v16 = -1;
        if (v15)
        {
          v17 = *((unsigned __int16 *)v9 + 17);
          v18 = v11 == v17;
          v16 = v11 >= v17 ? 1 : -1;
          if (v18)
          {
            v19 = *((unsigned __int8 *)v9 + 36);
            v20 = v12 == v19;
            v16 = v12 >= v19 ? 1 : -1;
            if (v20)
              v16 = 0;
          }
        }
        if ((v16 & 0x80) == 0)
          break;
        v9 = (uint64_t **)*v9;
        v13 = v8;
        if (!*v8)
          goto LABEL_23;
      }
      v9 = (uint64_t **)v9[1];
    }
    while (v9);
    v13 = v8 + 1;
  }
  else
  {
    v13 = a1 + 1;
  }
LABEL_23:
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  *((_QWORD *)v6 + 2) = v8;
  *v13 = (uint64_t *)v6;
  v21 = (uint64_t *)**a1;
  v22 = (uint64_t *)v6;
  if (v21)
  {
    *a1 = v21;
    v22 = *v13;
  }
  std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], v22);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return v7;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
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

uint64_t _GLOBAL__sub_I_QMIMessageRegistry_cpp()
{
  _MergedGlobals_0 = (uint64_t)off_24C975620;
  *(_QWORD *)algn_253D0B368 = "QMI Response Result";
  qword_253D0B380 = 0;
  qword_253D0B378 = 0;
  qword_253D0B370 = (uint64_t)&qword_253D0B378;
  return __cxa_atexit((void (*)(void *))std::multimap<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>::~multimap[abi:ne180100], &qword_253D0B370, &dword_20E603000);
}

uint64_t ___ZN3qmi5parseEPKhiU13block_pointerFvRKNS_10QMuxHeaderES1_iE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;

  v5 = *(_QWORD *)(a1 + 32);
  if (a5 < (int)a4)
  {
    a3 = 0;
    a4 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 16))(v5, a2, a3, a4);
}

void __copy_helper_block_e8_32b(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 32), *(const void **)(a2 + 32), 7);
}

void __destroy_helper_block_e8_32b(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 32), 7);
}

uint64_t qmi::createRequest@<X0>(int a1@<W0>, char a2@<W1>, __int16 a3@<W2>, unsigned int a4@<W3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  _BYTE *v14;

  if (a1)
    v11 = 9;
  else
    v11 = 8;
  v12 = a4;
  v13 = v11 + a4;
  *a6 = 0;
  a6[1] = 0;
  a6[2] = 0;
  v14 = operator new(v13);
  *a6 = v14;
  a6[2] = &v14[v13];
  bzero(v14, v13);
  a6[1] = &v14[v13];
  *v14 = 1;
  *(_WORD *)(v14 + 1) = v13 - 1;
  v14[3] = 0;
  v14[4] = a1;
  v14[5] = a2;
  v14[6] = 0;
  v14[7] = a3;
  if (a1)
    v14[8] = HIBYTE(a3);
  return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(a5 + 16))(a5, &v14[v11], v12);
}

void sub_20E612734(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;

  *(_QWORD *)(v1 + 8) = v2;
  operator delete(v2);
  _Unwind_Resume(a1);
}

uint64_t qmi::stripRequestHeader(int a1, uint64_t **a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v2 = **a2;
  v3 = (*a2)[1] - v2;
  v4 = 8;
  if (a1)
    v4 = 9;
  v5 = v2 + v4;
  if (v3 >= v4)
    return v5;
  else
    return 0;
}

void std::__shared_ptr_emplace<qmi::SerializedMessage>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24C975840;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<qmi::SerializedMessage>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24C975840;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void defaultWriteHandler()
{
  void *exception;

  exception = __cxa_allocate_exception(0x20uLL);
  tlv_write_exception::tlv_write_exception((uint64_t)exception);
}

void sub_20E6127F8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void (*qmi::MutableMessageBase::setWriteErrorHandler(void (*result)()))()
{
  qmi::MutableMessageBase::sWriteErrorHandler = result;
  return result;
}

uint64_t qmi::MutableMessageBase::MutableMessageBase(uint64_t this)
{
  *(_WORD *)this = 0;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_QWORD *)(this + 8) = 0;
  return this;
}

{
  *(_WORD *)this = 0;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_QWORD *)(this + 8) = 0;
  return this;
}

qmi::MutableMessageBase *qmi::MutableMessageBase::MutableMessageBase(qmi::MutableMessageBase *this, const qmi::MutableMessageBase *a2)
{
  __int16 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _BYTE *v22;
  uint64_t *v23;
  char *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  _OWORD *v29;
  char *v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  char **v35;

  v3 = *(_WORD *)a2;
  *((_QWORD *)this + 1) = 0;
  v35 = (char **)((char *)this + 8);
  *(_WORD *)this = v3;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  v5 = *((_QWORD *)a2 + 1);
  v4 = *((_QWORD *)a2 + 2);
  v6 = v4 - v5;
  if (v4 != v5)
  {
    if (v6 < 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v8 = (char *)operator new(v4 - v5);
    *((_QWORD *)this + 1) = v8;
    *((_QWORD *)this + 2) = v8;
    *((_QWORD *)this + 3) = &v8[8 * (v6 >> 3)];
    v9 = (_QWORD *)*((_QWORD *)a2 + 1);
    v10 = (_QWORD *)*((_QWORD *)a2 + 2);
    while (1)
    {
      if (v9 == v10)
        return this;
      v12 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)*v9 + 32))(*v9);
      v13 = v12;
      v15 = (char *)*((_QWORD *)this + 2);
      v14 = *((_QWORD *)this + 3);
      if ((unint64_t)v15 < v14)
      {
        *(_QWORD *)v15 = v12;
        v11 = (uint64_t)(v15 + 8);
        goto LABEL_5;
      }
      v16 = *v35;
      v17 = v15 - *v35;
      v18 = v17 >> 3;
      v19 = (v17 >> 3) + 1;
      if (v19 >> 61)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      v20 = v14 - (_QWORD)v16;
      if (v20 >> 2 > v19)
        v19 = v20 >> 2;
      if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8)
        v21 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v21 = v19;
      if (v21)
      {
        if (v21 >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v22 = operator new(8 * v21);
        v23 = (uint64_t *)&v22[8 * v18];
        *v23 = v13;
        v11 = (uint64_t)(v23 + 1);
        v24 = (char *)(v15 - v16);
        if (v15 == v16)
        {
LABEL_17:
          *((_QWORD *)this + 1) = v23;
          *((_QWORD *)this + 2) = v11;
          *((_QWORD *)this + 3) = &v22[8 * v21];
          if (v15)
            goto LABEL_27;
          goto LABEL_5;
        }
      }
      else
      {
        v22 = 0;
        v23 = (uint64_t *)(8 * v18);
        *(_QWORD *)(8 * v18) = v13;
        v11 = 8 * v18 + 8;
        v24 = (char *)(v15 - v16);
        if (v15 == v16)
          goto LABEL_17;
      }
      v25 = (unint64_t)(v24 - 8);
      if (v25 < 0x58)
        goto LABEL_34;
      if ((unint64_t)(v15 - v22 - v17) < 0x20)
        goto LABEL_34;
      v26 = (v25 >> 3) + 1;
      v27 = 8 * (v26 & 0x3FFFFFFFFFFFFFFCLL);
      v28 = &v15[-v27];
      v23 = (uint64_t *)((char *)v23 - v27);
      v29 = &v22[8 * v18 - 16];
      v30 = v15 - 16;
      v31 = v26 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        v32 = *(_OWORD *)v30;
        *(v29 - 1) = *((_OWORD *)v30 - 1);
        *v29 = v32;
        v29 -= 2;
        v30 -= 32;
        v31 -= 4;
      }
      while (v31);
      v15 = v28;
      if (v26 != (v26 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_34:
        do
        {
          v33 = *((_QWORD *)v15 - 1);
          v15 -= 8;
          *--v23 = v33;
        }
        while (v15 != v16);
      }
      v15 = *v35;
      *((_QWORD *)this + 1) = v23;
      *((_QWORD *)this + 2) = v11;
      *((_QWORD *)this + 3) = &v22[8 * v21];
      if (v15)
LABEL_27:
        operator delete(v15);
LABEL_5:
      *((_QWORD *)this + 2) = v11;
      ++v9;
    }
  }
  return this;
}

void sub_20E612A58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **a10)
{
  uint64_t v10;
  void *v12;

  v12 = *a10;
  if (*a10)
  {
    *(_QWORD *)(v10 + 16) = v12;
    operator delete(v12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t qmi::MutableMessageBase::MutableMessageBase(uint64_t this, const qmi::MessageBase *a2)
{
  *(_WORD *)this = *(_WORD *)a2;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_QWORD *)(this + 8) = 0;
  return this;
}

{
  *(_WORD *)this = *(_WORD *)a2;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_QWORD *)(this + 8) = 0;
  return this;
}

const qmi::MutableMessageBase *qmi::MutableMessageBase::operator=(const qmi::MutableMessageBase *a1, const qmi::MutableMessageBase *a2)
{
  __int128 v3;
  __int16 v4;
  _QWORD *v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  _QWORD *v9;
  _BYTE v11[32];

  if (a1 != a2)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v11 = v3;
    *(_OWORD *)&v11[16] = v3;
    qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v11, a2);
    v4 = *(_WORD *)a1;
    *(_WORD *)a1 = *(_WORD *)v11;
    *(_WORD *)v11 = v4;
    v6 = *(_OWORD *)&v11[8];
    *(_QWORD *)&v11[8] = *((_QWORD *)a1 + 1);
    v5 = *(_QWORD **)&v11[8];
    v7 = *(_QWORD *)&v11[24];
    v8 = *((_OWORD *)a1 + 1);
    *(_OWORD *)((char *)a1 + 8) = v6;
    *((_QWORD *)a1 + 3) = v7;
    *(_OWORD *)&v11[16] = v8;
    v9 = (_QWORD *)v8;
    if (v5 == (_QWORD *)v8)
    {
      if (v5)
      {
LABEL_4:
        *(_QWORD *)&v11[16] = v5;
        operator delete(v5);
      }
    }
    else
    {
      do
      {
        if (*v5)
          (*(void (**)(_QWORD))(*(_QWORD *)*v5 + 8))(*v5);
        ++v5;
      }
      while (v5 != v9);
      v5 = *(_QWORD **)&v11[8];
      if (*(_QWORD *)&v11[8])
        goto LABEL_4;
    }
  }
  return a1;
}

__int16 *qmi::MutableMessageBase::swap(__int16 *this, qmi::MutableMessageBase *a2)
{
  __int16 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *this;
  *this = *(_WORD *)a2;
  *(_WORD *)a2 = v2;
  v3 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = *((_QWORD *)a2 + 1);
  *((_QWORD *)a2 + 1) = v3;
  v4 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a2 + 2) = v4;
  v5 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = *((_QWORD *)a2 + 3);
  *((_QWORD *)a2 + 3) = v5;
  return this;
}

uint64_t qmi::MutableMessageBase::operator=(uint64_t a1, __int16 *a2)
{
  __int16 v3;
  uint64_t v4;
  __int128 v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;

  if ((__int16 *)a1 != a2)
  {
    v3 = *a2;
    v4 = *((_QWORD *)a2 + 3);
    v5 = *(_OWORD *)(a2 + 4);
    *((_QWORD *)a2 + 2) = 0;
    *((_QWORD *)a2 + 3) = 0;
    *((_QWORD *)a2 + 1) = 0;
    *(_WORD *)a1 = v3;
    v6 = *(_QWORD **)(a1 + 8);
    v7 = *(_QWORD **)(a1 + 16);
    *(_OWORD *)(a1 + 8) = v5;
    *(_QWORD *)(a1 + 24) = v4;
    if (v6 != v7)
    {
      v8 = v6;
      do
      {
        if (*v8)
          (*(void (**)(_QWORD))(*(_QWORD *)*v8 + 8))(*v8);
        ++v8;
      }
      while (v8 != v7);
    }
    if (v6)
      operator delete(v6);
  }
  return a1;
}

uint64_t qmi::MutableMessageBase::getSize(qmi::MutableMessageBase *this)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t i;
  uint64_t v4;

  v1 = (uint64_t *)*((_QWORD *)this + 1);
  v2 = (uint64_t *)*((_QWORD *)this + 2);
  for (i = 4; v1 != v2; i += (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4))
    v4 = *v1++;
  return i;
}

uint64_t tlv_write_exception::tlv_write_exception(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  size_t v7;
  __int128 *p_dst;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 __dst;
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *__p[2];
  __int128 v23;
  __int128 v24;
  _OWORD v25[9];
  unint64_t v26;

  *(_QWORD *)(a1 + 8) = 0;
  v2 = a1 + 8;
  *(_QWORD *)a1 = off_24C9758C0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  v26 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v25[7] = v3;
  v25[8] = v3;
  v25[5] = v3;
  v25[6] = v3;
  v25[3] = v3;
  v25[4] = v3;
  v25[1] = v3;
  v25[2] = v3;
  v24 = v3;
  v25[0] = v3;
  *(_OWORD *)__p = v3;
  v23 = v3;
  v20 = v3;
  v21 = v3;
  v18 = v3;
  v19 = v3;
  v17 = v3;
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v17);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v18, (uint64_t)"tlv_write_exception: msgId=", 27);
  v4 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)" wrote ", 7);
  v5 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)" of ", 4);
  v6 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)" expected bytes", 15);
  if ((BYTE8(v24) & 0x10) != 0)
  {
    v9 = v24;
    if ((unint64_t)v24 < *((_QWORD *)&v21 + 1))
    {
      *(_QWORD *)&v24 = *((_QWORD *)&v21 + 1);
      v9 = *((_QWORD *)&v21 + 1);
    }
    v10 = (const void *)v21;
    v7 = v9 - v21;
    if ((unint64_t)(v9 - v21) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_20;
  }
  else
  {
    if ((BYTE8(v24) & 8) == 0)
    {
      v7 = 0;
      HIBYTE(v16) = 0;
      p_dst = &__dst;
      goto LABEL_14;
    }
    v10 = (const void *)*((_QWORD *)&v19 + 1);
    v7 = *((_QWORD *)&v20 + 1) - *((_QWORD *)&v19 + 1);
    if (*((_QWORD *)&v20 + 1) - *((_QWORD *)&v19 + 1) >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_20:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v7 >= 0x17)
  {
    v11 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v7 | 7) != 0x17)
      v11 = v7 | 7;
    v12 = v11 + 1;
    p_dst = (__int128 *)operator new(v11 + 1);
    *((_QWORD *)&__dst + 1) = v7;
    v16 = v12 | 0x8000000000000000;
    *(_QWORD *)&__dst = p_dst;
    goto LABEL_13;
  }
  HIBYTE(v16) = v7;
  p_dst = &__dst;
  if (v7)
LABEL_13:
    memmove(p_dst, v10, v7);
LABEL_14:
  *((_BYTE *)p_dst + v7) = 0;
  if (*(char *)(a1 + 31) < 0)
    operator delete(*(void **)v2);
  *(_OWORD *)v2 = __dst;
  *(_QWORD *)(v2 + 16) = v16;
  *(_QWORD *)&v17 = *MEMORY[0x24BEDB7F0];
  v13 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)&v17 + *(_QWORD *)(v17 - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  *(_QWORD *)&v18 = v13;
  *((_QWORD *)&v18 + 1) = MEMORY[0x24BEDB848] + 16;
  if (SHIBYTE(v23) < 0)
    operator delete(__p[1]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x212BC1680](v25);
  return a1;
}

void sub_20E612F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  uint64_t v29;
  void **v30;

  if (*(char *)(v29 + 31) < 0)
    operator delete(*v30);
  std::exception::~exception((std::exception *)v29);
  _Unwind_Resume(a1);
}

void tlv_write_exception::~tlv_write_exception(std::exception *this)
{
  std::exception *v1;

  v1 = this;
  this->__vftable = (std::exception_vtbl *)off_24C9758C0;
  if (SHIBYTE(this[3].__vftable) < 0)
  {
    operator delete(this[1].__vftable);
    this = v1;
  }
  std::exception::~exception(this);
}

{
  void *v2;

  this->__vftable = (std::exception_vtbl *)off_24C9758C0;
  if (SHIBYTE(this[3].__vftable) < 0)
  {
    operator delete(this[1].__vftable);
    std::exception::~exception(this);
  }
  else
  {
    std::exception::~exception(this);
  }
  operator delete(v2);
}

uint64_t tlv_write_exception::what(tlv_write_exception *this)
{
  uint64_t result;

  result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t qmi::generateRandomField(qmi *this, qmi::RandomMessageContext *a2, BOOL *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(qmi *, uint64_t, BOOL *))(*(_QWORD *)this + 16))(this, 1, a3);
  *(_BYTE *)a2 = (_DWORD)result != 0;
  return result;
}

uint64_t qmi::generateRandomField(qmi *this, qmi::RandomMessageContext *a2, signed __int8 *a3)
{
  return (**(uint64_t (***)(qmi *, qmi::RandomMessageContext *, uint64_t))this)(this, a2, 1);
}

uint64_t qmi::generateRandomField(qmi *this, qmi::RandomMessageContext *a2, unsigned __int8 *a3)
{
  return (**(uint64_t (***)(qmi *, qmi::RandomMessageContext *, uint64_t))this)(this, a2, 1);
}

uint64_t qmi::generateRandomField(qmi *this, qmi::RandomMessageContext *a2, __int16 *a3)
{
  return (**(uint64_t (***)(qmi *, qmi::RandomMessageContext *, uint64_t))this)(this, a2, 2);
}

uint64_t qmi::generateRandomField(qmi *this, qmi::RandomMessageContext *a2, unsigned __int16 *a3)
{
  return (**(uint64_t (***)(qmi *, qmi::RandomMessageContext *, uint64_t))this)(this, a2, 2);
}

uint64_t qmi::generateRandomField(qmi *this, qmi::RandomMessageContext *a2, int *a3)
{
  return (**(uint64_t (***)(qmi *, qmi::RandomMessageContext *, uint64_t))this)(this, a2, 4);
}

uint64_t qmi::generateRandomField(qmi *this, qmi::RandomMessageContext *a2, unsigned int *a3)
{
  return (**(uint64_t (***)(qmi *, qmi::RandomMessageContext *, uint64_t))this)(this, a2, 4);
}

uint64_t qmi::generateRandomField(qmi *this, qmi::RandomMessageContext *a2, unint64_t *a3)
{
  return (**(uint64_t (***)(qmi *, qmi::RandomMessageContext *, uint64_t))this)(this, a2, 8);
}

uint64_t qmi::generateRandomField(uint64_t a1, std::string *a2)
{
  unint64_t v4;
  unint64_t size;
  std::string *v6;
  int v7;
  uint64_t *v8;
  std::string::size_type v9;

  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 8))(a1, 20);
  if (SHIBYTE(a2->__r_.__value_.__r.__words[2]) < 0)
  {
    size = a2->__r_.__value_.__l.__size_;
    if (size >= v4)
    {
      v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
      a2->__r_.__value_.__l.__size_ = v4;
      goto LABEL_7;
    }
LABEL_5:
    std::string::append(a2, v4 - size, 0);
    goto LABEL_8;
  }
  size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
  if (v4 > size)
    goto LABEL_5;
  *((_BYTE *)&a2->__r_.__value_.__s + 23) = v4 & 0x7F;
  v6 = a2;
LABEL_7:
  v6->__r_.__value_.__s.__data_[v4] = 0;
LABEL_8:
  v7 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
  if (v7 >= 0)
    v8 = (uint64_t *)a2;
  else
    v8 = (uint64_t *)a2->__r_.__value_.__r.__words[0];
  if (v7 >= 0)
    v9 = HIBYTE(a2->__r_.__value_.__r.__words[2]);
  else
    v9 = a2->__r_.__value_.__l.__size_;
  return (*(uint64_t (**)(uint64_t, uint64_t *, std::string::size_type))(*(_QWORD *)a1 + 24))(a1, v8, v9);
}

uint64_t qmi::validateTlvFields(std::string **this, qmi::RandomMessageReporter *a2, int a3)
{
  uint64_t v3;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  std::ios_base *v10;
  uint64_t v11;
  _QWORD *v12;
  size_t v13;
  void *v14;
  uint64_t v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v20[2];
  unint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *__p[2];
  __int128 v28;
  unint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  std::string v40;

  v3 = a2 ^ a3;
  if ((_DWORD)v3 != 1)
    return v3;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  v39 = v5;
  v38 = v5;
  v37 = v5;
  v36 = v5;
  v35 = v5;
  v34 = v5;
  v33 = v5;
  v32 = v5;
  v31 = v5;
  *(_OWORD *)__p = v5;
  v28 = v5;
  v25 = v5;
  v26 = v5;
  v23 = v5;
  v24 = v5;
  v6 = MEMORY[0x24BEDB870];
  v7 = MEMORY[0x24BEDB870] + 64;
  v30 = MEMORY[0x24BEDB870] + 64;
  v8 = (uint64_t *)MEMORY[0x24BEDB800];
  v9 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v22 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v22 + *(_QWORD *)(v22 - 24)) = v9;
  v10 = (std::ios_base *)((char *)&v22 + *(_QWORD *)(v22 - 24));
  std::ios_base::init(v10, &v23);
  v10[1].__vftable = 0;
  v10[1].__fmtflags_ = -1;
  v22 = v6 + 24;
  v30 = v7;
  std::streambuf::basic_streambuf();
  v11 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v23 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v28 = 0u;
  LODWORD(v29) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v22, (uint64_t)"Mismatch in BOOL field: actual=", 31);
  v12 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)", expected=", 11);
  std::ostream::operator<<();
  if ((v29 & 0x10) != 0)
  {
    v15 = *((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v28 + 1) < (unint64_t)v26)
    {
      *((_QWORD *)&v28 + 1) = v26;
      v15 = v26;
    }
    v16 = (const void *)*((_QWORD *)&v25 + 1);
    v13 = v15 - *((_QWORD *)&v25 + 1);
    if ((unint64_t)(v15 - *((_QWORD *)&v25 + 1)) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_24;
  }
  else
  {
    if ((v29 & 8) == 0)
    {
      v13 = 0;
      HIBYTE(v21) = 0;
      v14 = v20;
      goto LABEL_15;
    }
    v16 = (const void *)v24;
    v13 = v25 - v24;
    if ((_QWORD)v25 - (_QWORD)v24 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_24:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v13 >= 0x17)
  {
    v17 = (v13 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v13 | 7) != 0x17)
      v17 = v13 | 7;
    v18 = v17 + 1;
    v14 = operator new(v17 + 1);
    v20[1] = (void *)v13;
    v21 = v18 | 0x8000000000000000;
    v20[0] = v14;
    goto LABEL_14;
  }
  HIBYTE(v21) = v13;
  v14 = v20;
  if (v13)
LABEL_14:
    memmove(v14, v16, v13);
LABEL_15:
  *((_BYTE *)v14 + v13) = 0;
  memset(&v40, 170, sizeof(v40));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v40);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v40, v20);
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v40.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v21) & 0x80000000) == 0)
      goto LABEL_17;
LABEL_22:
    operator delete(v20[0]);
    goto LABEL_17;
  }
  if (SHIBYTE(v21) < 0)
    goto LABEL_22;
LABEL_17:
  v22 = *v8;
  *(uint64_t *)((char *)&v22 + *(_QWORD *)(v22 - 24)) = v8[3];
  *(_QWORD *)&v23 = v11 + 16;
  if (SBYTE7(v28) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BC1680](&v30);
  return v3;
}

void sub_20E613504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  if (*(char *)(v15 - 89) < 0)
  {
    operator delete(*(void **)(v15 - 112));
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      std::ostringstream::~ostringstream((uint64_t)&a15);
      _Unwind_Resume(a1);
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void sub_20E613560(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x212BC1680](v1);
  _Unwind_Resume(a1);
}

BOOL qmi::validateTlvFields(std::string **this, qmi::RandomMessageReporter *a2, int a3)
{
  int v4;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  std::ios_base *v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  void *v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v21[2];
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *__p[2];
  __int128 v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  std::string v41;

  v4 = (int)a2;
  if ((_DWORD)a2 == a3)
    return v4 != a3;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v40 = v6;
  v39 = v6;
  v38 = v6;
  v37 = v6;
  v36 = v6;
  v35 = v6;
  v34 = v6;
  v33 = v6;
  v32 = v6;
  *(_OWORD *)__p = v6;
  v29 = v6;
  v26 = v6;
  v27 = v6;
  v24 = v6;
  v25 = v6;
  v7 = MEMORY[0x24BEDB870];
  v8 = MEMORY[0x24BEDB870] + 64;
  v31 = MEMORY[0x24BEDB870] + 64;
  v9 = (uint64_t *)MEMORY[0x24BEDB800];
  v10 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v23 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v10;
  v11 = (std::ios_base *)((char *)&v23 + *(_QWORD *)(v23 - 24));
  std::ios_base::init(v11, &v24);
  v11[1].__vftable = 0;
  v11[1].__fmtflags_ = -1;
  v23 = v7 + 24;
  v31 = v8;
  std::streambuf::basic_streambuf();
  v12 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v24 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v29 = 0u;
  LODWORD(v30) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v23, (uint64_t)"Mismatch in int8_t field: actual=", 33);
  v13 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)", expected=", 11);
  std::ostream::operator<<();
  if ((v30 & 0x10) != 0)
  {
    v16 = *((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1) < (unint64_t)v27)
    {
      *((_QWORD *)&v29 + 1) = v27;
      v16 = v27;
    }
    v17 = (const void *)*((_QWORD *)&v26 + 1);
    v14 = v16 - *((_QWORD *)&v26 + 1);
    if ((unint64_t)(v16 - *((_QWORD *)&v26 + 1)) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_24;
  }
  else
  {
    if ((v30 & 8) == 0)
    {
      v14 = 0;
      HIBYTE(v22) = 0;
      v15 = v21;
      goto LABEL_15;
    }
    v17 = (const void *)v25;
    v14 = v26 - v25;
    if ((_QWORD)v26 - (_QWORD)v25 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_24:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v14 >= 0x17)
  {
    v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v18 = v14 | 7;
    v19 = v18 + 1;
    v15 = operator new(v18 + 1);
    v21[1] = (void *)v14;
    v22 = v19 | 0x8000000000000000;
    v21[0] = v15;
    v12 = MEMORY[0x24BEDB848];
    goto LABEL_14;
  }
  HIBYTE(v22) = v14;
  v15 = v21;
  if (v14)
LABEL_14:
    memmove(v15, v17, v14);
LABEL_15:
  *((_BYTE *)v15 + v14) = 0;
  memset(&v41, 170, sizeof(v41));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v41);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v41, v21);
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v41.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v22) & 0x80000000) == 0)
      goto LABEL_17;
LABEL_22:
    operator delete(v21[0]);
    goto LABEL_17;
  }
  if (SHIBYTE(v22) < 0)
    goto LABEL_22;
LABEL_17:
  v23 = *v9;
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v9[3];
  *(_QWORD *)&v24 = v12 + 16;
  if (SBYTE7(v29) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BC1680](&v31);
  return v4 != a3;
}

{
  int v4;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  std::ios_base *v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  void *v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v21[2];
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *__p[2];
  __int128 v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  std::string v41;

  v4 = (int)a2;
  if ((_DWORD)a2 == a3)
    return v4 != a3;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v40 = v6;
  v39 = v6;
  v38 = v6;
  v37 = v6;
  v36 = v6;
  v35 = v6;
  v34 = v6;
  v33 = v6;
  v32 = v6;
  *(_OWORD *)__p = v6;
  v29 = v6;
  v26 = v6;
  v27 = v6;
  v24 = v6;
  v25 = v6;
  v7 = MEMORY[0x24BEDB870];
  v8 = MEMORY[0x24BEDB870] + 64;
  v31 = MEMORY[0x24BEDB870] + 64;
  v9 = (uint64_t *)MEMORY[0x24BEDB800];
  v10 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v23 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v10;
  v11 = (std::ios_base *)((char *)&v23 + *(_QWORD *)(v23 - 24));
  std::ios_base::init(v11, &v24);
  v11[1].__vftable = 0;
  v11[1].__fmtflags_ = -1;
  v23 = v7 + 24;
  v31 = v8;
  std::streambuf::basic_streambuf();
  v12 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v24 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v29 = 0u;
  LODWORD(v30) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v23, (uint64_t)"Mismatch in uint8_t field: actual=", 34);
  v13 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)", expected=", 11);
  std::ostream::operator<<();
  if ((v30 & 0x10) != 0)
  {
    v16 = *((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1) < (unint64_t)v27)
    {
      *((_QWORD *)&v29 + 1) = v27;
      v16 = v27;
    }
    v17 = (const void *)*((_QWORD *)&v26 + 1);
    v14 = v16 - *((_QWORD *)&v26 + 1);
    if ((unint64_t)(v16 - *((_QWORD *)&v26 + 1)) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_24;
  }
  else
  {
    if ((v30 & 8) == 0)
    {
      v14 = 0;
      HIBYTE(v22) = 0;
      v15 = v21;
      goto LABEL_15;
    }
    v17 = (const void *)v25;
    v14 = v26 - v25;
    if ((_QWORD)v26 - (_QWORD)v25 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_24:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v14 >= 0x17)
  {
    v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v18 = v14 | 7;
    v19 = v18 + 1;
    v15 = operator new(v18 + 1);
    v21[1] = (void *)v14;
    v22 = v19 | 0x8000000000000000;
    v21[0] = v15;
    v12 = MEMORY[0x24BEDB848];
    goto LABEL_14;
  }
  HIBYTE(v22) = v14;
  v15 = v21;
  if (v14)
LABEL_14:
    memmove(v15, v17, v14);
LABEL_15:
  *((_BYTE *)v15 + v14) = 0;
  memset(&v41, 170, sizeof(v41));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v41);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v41, v21);
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v41.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v22) & 0x80000000) == 0)
      goto LABEL_17;
LABEL_22:
    operator delete(v21[0]);
    goto LABEL_17;
  }
  if (SHIBYTE(v22) < 0)
    goto LABEL_22;
LABEL_17:
  v23 = *v9;
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v9[3];
  *(_QWORD *)&v24 = v12 + 16;
  if (SBYTE7(v29) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BC1680](&v31);
  return v4 != a3;
}

{
  int v4;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  std::ios_base *v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  void *v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v21[2];
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *__p[2];
  __int128 v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  std::string v41;

  v4 = (int)a2;
  if ((_DWORD)a2 == a3)
    return v4 != a3;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v40 = v6;
  v39 = v6;
  v38 = v6;
  v37 = v6;
  v36 = v6;
  v35 = v6;
  v34 = v6;
  v33 = v6;
  v32 = v6;
  *(_OWORD *)__p = v6;
  v29 = v6;
  v26 = v6;
  v27 = v6;
  v24 = v6;
  v25 = v6;
  v7 = MEMORY[0x24BEDB870];
  v8 = MEMORY[0x24BEDB870] + 64;
  v31 = MEMORY[0x24BEDB870] + 64;
  v9 = (uint64_t *)MEMORY[0x24BEDB800];
  v10 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v23 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v10;
  v11 = (std::ios_base *)((char *)&v23 + *(_QWORD *)(v23 - 24));
  std::ios_base::init(v11, &v24);
  v11[1].__vftable = 0;
  v11[1].__fmtflags_ = -1;
  v23 = v7 + 24;
  v31 = v8;
  std::streambuf::basic_streambuf();
  v12 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v24 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v29 = 0u;
  LODWORD(v30) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v23, (uint64_t)"Mismatch in int16_t field: actual=", 34);
  v13 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)", expected=", 11);
  std::ostream::operator<<();
  if ((v30 & 0x10) != 0)
  {
    v16 = *((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1) < (unint64_t)v27)
    {
      *((_QWORD *)&v29 + 1) = v27;
      v16 = v27;
    }
    v17 = (const void *)*((_QWORD *)&v26 + 1);
    v14 = v16 - *((_QWORD *)&v26 + 1);
    if ((unint64_t)(v16 - *((_QWORD *)&v26 + 1)) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_24;
  }
  else
  {
    if ((v30 & 8) == 0)
    {
      v14 = 0;
      HIBYTE(v22) = 0;
      v15 = v21;
      goto LABEL_15;
    }
    v17 = (const void *)v25;
    v14 = v26 - v25;
    if ((_QWORD)v26 - (_QWORD)v25 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_24:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v14 >= 0x17)
  {
    v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v18 = v14 | 7;
    v19 = v18 + 1;
    v15 = operator new(v18 + 1);
    v21[1] = (void *)v14;
    v22 = v19 | 0x8000000000000000;
    v21[0] = v15;
    v12 = MEMORY[0x24BEDB848];
    goto LABEL_14;
  }
  HIBYTE(v22) = v14;
  v15 = v21;
  if (v14)
LABEL_14:
    memmove(v15, v17, v14);
LABEL_15:
  *((_BYTE *)v15 + v14) = 0;
  memset(&v41, 170, sizeof(v41));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v41);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v41, v21);
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v41.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v22) & 0x80000000) == 0)
      goto LABEL_17;
LABEL_22:
    operator delete(v21[0]);
    goto LABEL_17;
  }
  if (SHIBYTE(v22) < 0)
    goto LABEL_22;
LABEL_17:
  v23 = *v9;
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v9[3];
  *(_QWORD *)&v24 = v12 + 16;
  if (SBYTE7(v29) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BC1680](&v31);
  return v4 != a3;
}

{
  int v4;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  std::ios_base *v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  void *v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v21[2];
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *__p[2];
  __int128 v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  std::string v41;

  v4 = (int)a2;
  if ((_DWORD)a2 == a3)
    return v4 != a3;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v40 = v6;
  v39 = v6;
  v38 = v6;
  v37 = v6;
  v36 = v6;
  v35 = v6;
  v34 = v6;
  v33 = v6;
  v32 = v6;
  *(_OWORD *)__p = v6;
  v29 = v6;
  v26 = v6;
  v27 = v6;
  v24 = v6;
  v25 = v6;
  v7 = MEMORY[0x24BEDB870];
  v8 = MEMORY[0x24BEDB870] + 64;
  v31 = MEMORY[0x24BEDB870] + 64;
  v9 = (uint64_t *)MEMORY[0x24BEDB800];
  v10 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v23 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v10;
  v11 = (std::ios_base *)((char *)&v23 + *(_QWORD *)(v23 - 24));
  std::ios_base::init(v11, &v24);
  v11[1].__vftable = 0;
  v11[1].__fmtflags_ = -1;
  v23 = v7 + 24;
  v31 = v8;
  std::streambuf::basic_streambuf();
  v12 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v24 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v29 = 0u;
  LODWORD(v30) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v23, (uint64_t)"Mismatch in uint16_t field: actual=", 35);
  v13 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)", expected=", 11);
  std::ostream::operator<<();
  if ((v30 & 0x10) != 0)
  {
    v16 = *((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1) < (unint64_t)v27)
    {
      *((_QWORD *)&v29 + 1) = v27;
      v16 = v27;
    }
    v17 = (const void *)*((_QWORD *)&v26 + 1);
    v14 = v16 - *((_QWORD *)&v26 + 1);
    if ((unint64_t)(v16 - *((_QWORD *)&v26 + 1)) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_24;
  }
  else
  {
    if ((v30 & 8) == 0)
    {
      v14 = 0;
      HIBYTE(v22) = 0;
      v15 = v21;
      goto LABEL_15;
    }
    v17 = (const void *)v25;
    v14 = v26 - v25;
    if ((_QWORD)v26 - (_QWORD)v25 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_24:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v14 >= 0x17)
  {
    v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v18 = v14 | 7;
    v19 = v18 + 1;
    v15 = operator new(v18 + 1);
    v21[1] = (void *)v14;
    v22 = v19 | 0x8000000000000000;
    v21[0] = v15;
    v12 = MEMORY[0x24BEDB848];
    goto LABEL_14;
  }
  HIBYTE(v22) = v14;
  v15 = v21;
  if (v14)
LABEL_14:
    memmove(v15, v17, v14);
LABEL_15:
  *((_BYTE *)v15 + v14) = 0;
  memset(&v41, 170, sizeof(v41));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v41);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v41, v21);
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v41.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v22) & 0x80000000) == 0)
      goto LABEL_17;
LABEL_22:
    operator delete(v21[0]);
    goto LABEL_17;
  }
  if (SHIBYTE(v22) < 0)
    goto LABEL_22;
LABEL_17:
  v23 = *v9;
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v9[3];
  *(_QWORD *)&v24 = v12 + 16;
  if (SBYTE7(v29) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BC1680](&v31);
  return v4 != a3;
}

{
  int v4;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  std::ios_base *v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  void *v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v21[2];
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *__p[2];
  __int128 v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  std::string v41;

  v4 = (int)a2;
  if ((_DWORD)a2 == a3)
    return v4 != a3;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v40 = v6;
  v39 = v6;
  v38 = v6;
  v37 = v6;
  v36 = v6;
  v35 = v6;
  v34 = v6;
  v33 = v6;
  v32 = v6;
  *(_OWORD *)__p = v6;
  v29 = v6;
  v26 = v6;
  v27 = v6;
  v24 = v6;
  v25 = v6;
  v7 = MEMORY[0x24BEDB870];
  v8 = MEMORY[0x24BEDB870] + 64;
  v31 = MEMORY[0x24BEDB870] + 64;
  v9 = (uint64_t *)MEMORY[0x24BEDB800];
  v10 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v23 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v10;
  v11 = (std::ios_base *)((char *)&v23 + *(_QWORD *)(v23 - 24));
  std::ios_base::init(v11, &v24);
  v11[1].__vftable = 0;
  v11[1].__fmtflags_ = -1;
  v23 = v7 + 24;
  v31 = v8;
  std::streambuf::basic_streambuf();
  v12 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v24 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v29 = 0u;
  LODWORD(v30) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v23, (uint64_t)"Mismatch in int32_t field: actual=", 34);
  v13 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)", expected=", 11);
  std::ostream::operator<<();
  if ((v30 & 0x10) != 0)
  {
    v16 = *((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1) < (unint64_t)v27)
    {
      *((_QWORD *)&v29 + 1) = v27;
      v16 = v27;
    }
    v17 = (const void *)*((_QWORD *)&v26 + 1);
    v14 = v16 - *((_QWORD *)&v26 + 1);
    if ((unint64_t)(v16 - *((_QWORD *)&v26 + 1)) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_24;
  }
  else
  {
    if ((v30 & 8) == 0)
    {
      v14 = 0;
      HIBYTE(v22) = 0;
      v15 = v21;
      goto LABEL_15;
    }
    v17 = (const void *)v25;
    v14 = v26 - v25;
    if ((_QWORD)v26 - (_QWORD)v25 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_24:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v14 >= 0x17)
  {
    v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v18 = v14 | 7;
    v19 = v18 + 1;
    v15 = operator new(v18 + 1);
    v21[1] = (void *)v14;
    v22 = v19 | 0x8000000000000000;
    v21[0] = v15;
    v12 = MEMORY[0x24BEDB848];
    goto LABEL_14;
  }
  HIBYTE(v22) = v14;
  v15 = v21;
  if (v14)
LABEL_14:
    memmove(v15, v17, v14);
LABEL_15:
  *((_BYTE *)v15 + v14) = 0;
  memset(&v41, 170, sizeof(v41));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v41);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v41, v21);
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v41.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v22) & 0x80000000) == 0)
      goto LABEL_17;
LABEL_22:
    operator delete(v21[0]);
    goto LABEL_17;
  }
  if (SHIBYTE(v22) < 0)
    goto LABEL_22;
LABEL_17:
  v23 = *v9;
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v9[3];
  *(_QWORD *)&v24 = v12 + 16;
  if (SBYTE7(v29) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BC1680](&v31);
  return v4 != a3;
}

{
  int v4;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  std::ios_base *v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  void *v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v21[2];
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *__p[2];
  __int128 v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  std::string v41;

  v4 = (int)a2;
  if ((_DWORD)a2 == a3)
    return v4 != a3;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v40 = v6;
  v39 = v6;
  v38 = v6;
  v37 = v6;
  v36 = v6;
  v35 = v6;
  v34 = v6;
  v33 = v6;
  v32 = v6;
  *(_OWORD *)__p = v6;
  v29 = v6;
  v26 = v6;
  v27 = v6;
  v24 = v6;
  v25 = v6;
  v7 = MEMORY[0x24BEDB870];
  v8 = MEMORY[0x24BEDB870] + 64;
  v31 = MEMORY[0x24BEDB870] + 64;
  v9 = (uint64_t *)MEMORY[0x24BEDB800];
  v10 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v23 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v10;
  v11 = (std::ios_base *)((char *)&v23 + *(_QWORD *)(v23 - 24));
  std::ios_base::init(v11, &v24);
  v11[1].__vftable = 0;
  v11[1].__fmtflags_ = -1;
  v23 = v7 + 24;
  v31 = v8;
  std::streambuf::basic_streambuf();
  v12 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v24 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v29 = 0u;
  LODWORD(v30) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v23, (uint64_t)"Mismatch in uint32_t field: actual=", 35);
  v13 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)", expected=", 11);
  std::ostream::operator<<();
  if ((v30 & 0x10) != 0)
  {
    v16 = *((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1) < (unint64_t)v27)
    {
      *((_QWORD *)&v29 + 1) = v27;
      v16 = v27;
    }
    v17 = (const void *)*((_QWORD *)&v26 + 1);
    v14 = v16 - *((_QWORD *)&v26 + 1);
    if ((unint64_t)(v16 - *((_QWORD *)&v26 + 1)) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_24;
  }
  else
  {
    if ((v30 & 8) == 0)
    {
      v14 = 0;
      HIBYTE(v22) = 0;
      v15 = v21;
      goto LABEL_15;
    }
    v17 = (const void *)v25;
    v14 = v26 - v25;
    if ((_QWORD)v26 - (_QWORD)v25 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_24:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v14 >= 0x17)
  {
    v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v18 = v14 | 7;
    v19 = v18 + 1;
    v15 = operator new(v18 + 1);
    v21[1] = (void *)v14;
    v22 = v19 | 0x8000000000000000;
    v21[0] = v15;
    v12 = MEMORY[0x24BEDB848];
    goto LABEL_14;
  }
  HIBYTE(v22) = v14;
  v15 = v21;
  if (v14)
LABEL_14:
    memmove(v15, v17, v14);
LABEL_15:
  *((_BYTE *)v15 + v14) = 0;
  memset(&v41, 170, sizeof(v41));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v41);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v41, v21);
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v41.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v22) & 0x80000000) == 0)
      goto LABEL_17;
LABEL_22:
    operator delete(v21[0]);
    goto LABEL_17;
  }
  if (SHIBYTE(v22) < 0)
    goto LABEL_22;
LABEL_17:
  v23 = *v9;
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v9[3];
  *(_QWORD *)&v24 = v12 + 16;
  if (SBYTE7(v29) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BC1680](&v31);
  return v4 != a3;
}

void sub_20E6138A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  if (*(char *)(v15 - 89) < 0)
  {
    operator delete(*(void **)(v15 - 112));
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      std::ostringstream::~ostringstream((uint64_t)&a15);
      _Unwind_Resume(a1);
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void sub_20E6138FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x212BC1680](v1);
  _Unwind_Resume(a1);
}

void sub_20E613C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  if (*(char *)(v15 - 89) < 0)
  {
    operator delete(*(void **)(v15 - 112));
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      std::ostringstream::~ostringstream((uint64_t)&a15);
      _Unwind_Resume(a1);
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void sub_20E613C98(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x212BC1680](v1);
  _Unwind_Resume(a1);
}

void sub_20E613FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  if (*(char *)(v15 - 89) < 0)
  {
    operator delete(*(void **)(v15 - 112));
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      std::ostringstream::~ostringstream((uint64_t)&a15);
      _Unwind_Resume(a1);
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void sub_20E614034(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x212BC1680](v1);
  _Unwind_Resume(a1);
}

void sub_20E614374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  if (*(char *)(v15 - 89) < 0)
  {
    operator delete(*(void **)(v15 - 112));
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      std::ostringstream::~ostringstream((uint64_t)&a15);
      _Unwind_Resume(a1);
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void sub_20E6143D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x212BC1680](v1);
  _Unwind_Resume(a1);
}

void sub_20E614710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  if (*(char *)(v15 - 89) < 0)
  {
    operator delete(*(void **)(v15 - 112));
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      std::ostringstream::~ostringstream((uint64_t)&a15);
      _Unwind_Resume(a1);
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void sub_20E61476C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x212BC1680](v1);
  _Unwind_Resume(a1);
}

void sub_20E614AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  if (*(char *)(v15 - 89) < 0)
  {
    operator delete(*(void **)(v15 - 112));
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      std::ostringstream::~ostringstream((uint64_t)&a15);
      _Unwind_Resume(a1);
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void sub_20E614B08(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x212BC1680](v1);
  _Unwind_Resume(a1);
}

BOOL qmi::validateTlvFields(std::string **this, qmi::RandomMessageReporter *a2, qmi::RandomMessageReporter *a3)
{
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  std::ios_base *v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  void *v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v21[2];
  unint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  void *__p[2];
  __int128 v29;
  unint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  std::string v41;

  if (a2 == a3)
    return a2 != a3;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0xAAAAAAAAAAAAAAAALL;
  v40 = v6;
  v39 = v6;
  v38 = v6;
  v37 = v6;
  v36 = v6;
  v35 = v6;
  v34 = v6;
  v33 = v6;
  v32 = v6;
  *(_OWORD *)__p = v6;
  v29 = v6;
  v26 = v6;
  v27 = v6;
  v24 = v6;
  v25 = v6;
  v7 = MEMORY[0x24BEDB870];
  v8 = MEMORY[0x24BEDB870] + 64;
  v31 = MEMORY[0x24BEDB870] + 64;
  v9 = (uint64_t *)MEMORY[0x24BEDB800];
  v10 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v23 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v10;
  v11 = (std::ios_base *)((char *)&v23 + *(_QWORD *)(v23 - 24));
  std::ios_base::init(v11, &v24);
  v11[1].__vftable = 0;
  v11[1].__fmtflags_ = -1;
  v23 = v7 + 24;
  v31 = v8;
  std::streambuf::basic_streambuf();
  v12 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v24 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)__p = 0u;
  v29 = 0u;
  LODWORD(v30) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v23, (uint64_t)"Mismatch in uint64_t field: actual=", 35);
  v13 = (_QWORD *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)", expected=", 11);
  std::ostream::operator<<();
  if ((v30 & 0x10) != 0)
  {
    v16 = *((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1) < (unint64_t)v27)
    {
      *((_QWORD *)&v29 + 1) = v27;
      v16 = v27;
    }
    v17 = (const void *)*((_QWORD *)&v26 + 1);
    v14 = v16 - *((_QWORD *)&v26 + 1);
    if ((unint64_t)(v16 - *((_QWORD *)&v26 + 1)) >= 0x7FFFFFFFFFFFFFF8)
      goto LABEL_24;
  }
  else
  {
    if ((v30 & 8) == 0)
    {
      v14 = 0;
      HIBYTE(v22) = 0;
      v15 = v21;
      goto LABEL_15;
    }
    v17 = (const void *)v25;
    v14 = v26 - v25;
    if ((_QWORD)v26 - (_QWORD)v25 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_24:
      std::string::__throw_length_error[abi:ne180100]();
  }
  if (v14 >= 0x17)
  {
    v18 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v18 = v14 | 7;
    v19 = v18 + 1;
    v15 = operator new(v18 + 1);
    v21[1] = (void *)v14;
    v22 = v19 | 0x8000000000000000;
    v21[0] = v15;
    v12 = MEMORY[0x24BEDB848];
    goto LABEL_14;
  }
  HIBYTE(v22) = v14;
  v15 = v21;
  if (v14)
LABEL_14:
    memmove(v15, v17, v14);
LABEL_15:
  *((_BYTE *)v15 + v14) = 0;
  memset(&v41, 170, sizeof(v41));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v41);
  ((void (*)(std::string **, std::string *, void **))(*this)->__r_.__value_.__r.__words[2])(this, &v41, v21);
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v41.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v22) & 0x80000000) == 0)
      goto LABEL_17;
LABEL_22:
    operator delete(v21[0]);
    goto LABEL_17;
  }
  if (SHIBYTE(v22) < 0)
    goto LABEL_22;
LABEL_17:
  v23 = *v9;
  *(uint64_t *)((char *)&v23 + *(_QWORD *)(v23 - 24)) = v9[3];
  *(_QWORD *)&v24 = v12 + 16;
  if (SBYTE7(v29) < 0)
    operator delete(__p[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BC1680](&v31);
  return a2 != a3;
}

void sub_20E614E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  uint64_t v15;

  if (*(char *)(v15 - 89) < 0)
  {
    operator delete(*(void **)(v15 - 112));
    if ((a14 & 0x80000000) == 0)
    {
LABEL_3:
      std::ostringstream::~ostringstream((uint64_t)&a15);
      _Unwind_Resume(a1);
    }
  }
  else if ((a14 & 0x80000000) == 0)
  {
    goto LABEL_3;
  }
  operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a15);
  _Unwind_Resume(a1);
}

void sub_20E614EA4(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x212BC1680](v1);
  _Unwind_Resume(a1);
}

uint64_t qmi::validateTlvFields(std::string **a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned __int8 *v11;
  unsigned __int8 *i;
  uint64_t result;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  std::ios_base *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  std::string *v24;
  std::string::size_type size;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  std::string *p_p;
  std::string::size_type v30;
  char v31;
  std::string::size_type v32;
  std::string *v33;
  uint64_t v34;
  const void *v35;
  uint64_t v36;
  uint64_t v37;
  std::string __p;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  void *v44[2];
  __int128 v45;
  unint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  std::string v57;

  v6 = a2[23];
  v7 = *((_QWORD *)a2 + 1);
  if ((v6 & 0x80u) == 0)
    v8 = a2[23];
  else
    v8 = *((_QWORD *)a2 + 1);
  v9 = a3[23];
  v10 = (char)v9;
  if ((v9 & 0x80u) != 0)
    v9 = *((_QWORD *)a3 + 1);
  if (v8 == v9)
  {
    if (v10 >= 0)
      v11 = a3;
    else
      v11 = *(unsigned __int8 **)a3;
    if ((v6 & 0x80) != 0)
    {
      result = memcmp(*(const void **)a2, v11, v7);
      if (!(_DWORD)result)
        return result;
    }
    else
    {
      if (!(_DWORD)v6)
        return 0;
      for (i = a2; *i == *v11; ++i)
      {
        ++v11;
        if (!--v6)
          return 0;
      }
    }
  }
  *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v46 = 0xAAAAAAAAAAAAAAAALL;
  v56 = v14;
  v55 = v14;
  v54 = v14;
  v53 = v14;
  v52 = v14;
  v51 = v14;
  v50 = v14;
  v49 = v14;
  v48 = v14;
  v45 = v14;
  *(_OWORD *)v44 = v14;
  v43 = v14;
  v42 = v14;
  v41 = v14;
  v40 = v14;
  v15 = MEMORY[0x24BEDB870];
  v16 = MEMORY[0x24BEDB870] + 64;
  v47 = MEMORY[0x24BEDB870] + 64;
  v17 = (uint64_t *)MEMORY[0x24BEDB800];
  v18 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v39 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v39 + *(_QWORD *)(v39 - 24)) = v18;
  v19 = (std::ios_base *)((char *)&v39 + *(_QWORD *)(v39 - 24));
  std::ios_base::init(v19, &v40);
  v19[1].__vftable = 0;
  v19[1].__fmtflags_ = -1;
  v39 = v15 + 24;
  v47 = v16;
  std::streambuf::basic_streambuf();
  v20 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v40 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)v44 = 0u;
  v45 = 0u;
  LODWORD(v46) = 16;
  v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v39, (uint64_t)"Mismatch in string field: ", 26);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)"actual=[", 8);
  v22 = (_QWORD *)std::ostream::operator<<();
  v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)" bytes]:", 8);
  ctu::py_escape((char *)a2, 1, &v57);
  if ((v57.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v24 = &v57;
  else
    v24 = (std::string *)v57.__r_.__value_.__r.__words[0];
  if ((v57.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v57.__r_.__value_.__r.__words[2]);
  else
    size = v57.__r_.__value_.__l.__size_;
  v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)v24, size);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)", expected=[", 12);
  v27 = (_QWORD *)std::ostream::operator<<();
  v28 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)" bytes]:", 8);
  ctu::py_escape((char *)a3, 1, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v30 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v30 = __p.__r_.__value_.__l.__size_;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28, (uint64_t)p_p, v30);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v57.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_31:
      v31 = v46;
      if ((v46 & 0x10) == 0)
        goto LABEL_32;
LABEL_36:
      v34 = *((_QWORD *)&v45 + 1);
      if (*((_QWORD *)&v45 + 1) < (unint64_t)v43)
      {
        *((_QWORD *)&v45 + 1) = v43;
        v34 = v43;
      }
      v35 = (const void *)*((_QWORD *)&v42 + 1);
      v32 = v34 - *((_QWORD *)&v42 + 1);
      if ((unint64_t)(v34 - *((_QWORD *)&v42 + 1)) >= 0x7FFFFFFFFFFFFFF8)
        goto LABEL_55;
      goto LABEL_39;
    }
  }
  else if ((SHIBYTE(v57.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_31;
  }
  operator delete(v57.__r_.__value_.__l.__data_);
  v31 = v46;
  if ((v46 & 0x10) != 0)
    goto LABEL_36;
LABEL_32:
  if ((v31 & 8) == 0)
  {
    v32 = 0;
    *((_BYTE *)&__p.__r_.__value_.__s + 23) = 0;
    v33 = &__p;
    goto LABEL_46;
  }
  v35 = (const void *)v41;
  v32 = v42 - v41;
  if ((_QWORD)v42 - (_QWORD)v41 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_55:
    std::string::__throw_length_error[abi:ne180100]();
LABEL_39:
  if (v32 >= 0x17)
  {
    v36 = (v32 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v32 | 7) != 0x17)
      v36 = v32 | 7;
    v37 = v36 + 1;
    v33 = (std::string *)operator new(v36 + 1);
    __p.__r_.__value_.__l.__size_ = v32;
    __p.__r_.__value_.__r.__words[2] = v37 | 0x8000000000000000;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v33;
    goto LABEL_45;
  }
  *((_BYTE *)&__p.__r_.__value_.__s + 23) = v32;
  v33 = &__p;
  if (v32)
LABEL_45:
    memmove(v33, v35, v32);
LABEL_46:
  v33->__r_.__value_.__s.__data_[v32] = 0;
  memset(&v57, 170, sizeof(v57));
  ctu::join<std::__wrap_iter<char const**>>(a1[1], a1[2], "::", 2uLL, &v57);
  ((void (*)(std::string **, std::string *, std::string *))(*a1)->__r_.__value_.__r.__words[2])(a1, &v57, &__p);
  if (SHIBYTE(v57.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v57.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_48;
LABEL_53:
    operator delete(__p.__r_.__value_.__l.__data_);
    goto LABEL_48;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_53;
LABEL_48:
  v39 = *v17;
  *(uint64_t *)((char *)&v39 + *(_QWORD *)(v39 - 24)) = v17[3];
  *(_QWORD *)&v40 = v20 + 16;
  if (SBYTE7(v45) < 0)
    operator delete(v44[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BC1680](&v47);
  return 1;
}

void sub_20E61534C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  uint64_t v16;

  if (*(char *)(v16 - 81) < 0)
    operator delete(*(void **)(v16 - 104));
  if (a15 < 0)
  {
    operator delete(__p);
    std::ostringstream::~ostringstream((uint64_t)&a16);
    _Unwind_Resume(a1);
  }
  std::ostringstream::~ostringstream((uint64_t)&a16);
  _Unwind_Resume(a1);
}

uint64_t qmi::validateTlvFields(std::string **this, qmi::RandomMessageReporter *__s1, size_t __n, void *__s2, const void *a5)
{
  uint64_t result;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  std::ios_base *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  std::string *v20;
  std::string::size_type size;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  std::string *p_p;
  std::string::size_type v26;
  char v27;
  std::string::size_type v28;
  std::string *v29;
  uint64_t v30;
  const void *v31;
  uint64_t v32;
  uint64_t v33;
  std::string __p;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  void *v40[2];
  __int128 v41;
  unint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  std::string v53;

  if ((const void *)__n == a5)
  {
    result = memcmp(__s1, __s2, __n);
    if (!(_DWORD)result)
      return result;
  }
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v42 = 0xAAAAAAAAAAAAAAAALL;
  v52 = v11;
  v51 = v11;
  v50 = v11;
  v49 = v11;
  v48 = v11;
  v47 = v11;
  v46 = v11;
  v45 = v11;
  v44 = v11;
  *(_OWORD *)v40 = v11;
  v41 = v11;
  v38 = v11;
  v39 = v11;
  v36 = v11;
  v37 = v11;
  v12 = MEMORY[0x24BEDB870];
  v13 = MEMORY[0x24BEDB870] + 64;
  v43 = MEMORY[0x24BEDB870] + 64;
  v14 = (uint64_t *)MEMORY[0x24BEDB800];
  v15 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  v35 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  *(uint64_t *)((char *)&v35 + *(_QWORD *)(v35 - 24)) = v15;
  v16 = (std::ios_base *)((char *)&v35 + *(_QWORD *)(v35 - 24));
  std::ios_base::init(v16, &v36);
  v16[1].__vftable = 0;
  v16[1].__fmtflags_ = -1;
  v35 = v12 + 24;
  v43 = v13;
  std::streambuf::basic_streambuf();
  v17 = MEMORY[0x24BEDB848];
  *(_QWORD *)&v36 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)v40 = 0u;
  v41 = 0u;
  LODWORD(v42) = 16;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v35, (uint64_t)"Mismatch in binary blob field: actual=[", 39);
  v18 = (_QWORD *)std::ostream::operator<<();
  v19 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)" bytes]:", 8);
  ctu::hex_sp(__s1, __n, &v53);
  if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v20 = &v53;
  else
    v20 = (std::string *)v53.__r_.__value_.__r.__words[0];
  if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v53.__r_.__value_.__r.__words[2]);
  else
    size = v53.__r_.__value_.__l.__size_;
  v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)v20, size);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)", expected=[", 12);
  v23 = (_QWORD *)std::ostream::operator<<();
  v24 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v23, (uint64_t)" bytes]:", 8);
  ctu::hex_sp((ctu *)__s2, (uint64_t)a5, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v26 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v26 = __p.__r_.__value_.__l.__size_;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)p_p, v26);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((SHIBYTE(v53.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_17:
      v27 = v42;
      if ((v42 & 0x10) == 0)
        goto LABEL_18;
LABEL_22:
      v30 = *((_QWORD *)&v41 + 1);
      if (*((_QWORD *)&v41 + 1) < (unint64_t)v39)
      {
        *((_QWORD *)&v41 + 1) = v39;
        v30 = v39;
      }
      v31 = (const void *)*((_QWORD *)&v38 + 1);
      v28 = v30 - *((_QWORD *)&v38 + 1);
      if ((unint64_t)(v30 - *((_QWORD *)&v38 + 1)) >= 0x7FFFFFFFFFFFFFF8)
        goto LABEL_41;
      goto LABEL_25;
    }
  }
  else if ((SHIBYTE(v53.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    goto LABEL_17;
  }
  operator delete(v53.__r_.__value_.__l.__data_);
  v27 = v42;
  if ((v42 & 0x10) != 0)
    goto LABEL_22;
LABEL_18:
  if ((v27 & 8) == 0)
  {
    v28 = 0;
    *((_BYTE *)&__p.__r_.__value_.__s + 23) = 0;
    v29 = &__p;
    goto LABEL_32;
  }
  v31 = (const void *)v37;
  v28 = v38 - v37;
  if ((_QWORD)v38 - (_QWORD)v37 >= 0x7FFFFFFFFFFFFFF8uLL)
LABEL_41:
    std::string::__throw_length_error[abi:ne180100]();
LABEL_25:
  if (v28 >= 0x17)
  {
    v32 = (v28 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v28 | 7) != 0x17)
      v32 = v28 | 7;
    v33 = v32 + 1;
    v29 = (std::string *)operator new(v32 + 1);
    __p.__r_.__value_.__l.__size_ = v28;
    __p.__r_.__value_.__r.__words[2] = v33 | 0x8000000000000000;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v29;
    goto LABEL_31;
  }
  *((_BYTE *)&__p.__r_.__value_.__s + 23) = v28;
  v29 = &__p;
  if (v28)
LABEL_31:
    memmove(v29, v31, v28);
LABEL_32:
  v29->__r_.__value_.__s.__data_[v28] = 0;
  memset(&v53, 170, sizeof(v53));
  ctu::join<std::__wrap_iter<char const**>>(this[1], this[2], "::", 2uLL, &v53);
  ((void (*)(std::string **, std::string *, std::string *))(*this)->__r_.__value_.__r.__words[2])(this, &v53, &__p);
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v53.__r_.__value_.__l.__data_);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      goto LABEL_34;
LABEL_39:
    operator delete(__p.__r_.__value_.__l.__data_);
    goto LABEL_34;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    goto LABEL_39;
LABEL_34:
  v35 = *v14;
  *(uint64_t *)((char *)&v35 + *(_QWORD *)(v35 - 24)) = v14[3];
  *(_QWORD *)&v36 = v17 + 16;
  if (SBYTE7(v41) < 0)
    operator delete(v40[0]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x212BC1680](&v43);
  return 1;
}

void sub_20E6157F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  uint64_t v17;

  if (*(char *)(v17 - 89) < 0)
    operator delete(*(void **)(v17 - 112));
  if (a16 < 0)
    operator delete(__p);
  std::ostringstream::~ostringstream((uint64_t)&a17);
  _Unwind_Resume(a1);
}

uint64_t qmi::validateTlvFields(std::string **a1, uint64_t a2, uint64_t a3)
{
  return qmi::validateTlvFields(a1, *(qmi::RandomMessageReporter **)a2, *(_QWORD *)(a2 + 8) - *(_QWORD *)a2, *(void **)a3, (const void *)(*(_QWORD *)(a3 + 8) - *(_QWORD *)a3));
}

void QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Request::~QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Request(QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Request *this)
{
  *(_QWORD *)this = &off_24C9758E8;
}

{
  *(_QWORD *)this = &off_24C9758E8;
}

uint64_t *QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Request::getTlvDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v15;

  v2 = *(unsigned __int8 *)(a2 + 23);
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = *(_QWORD *)(a2 + 8);
  if (v2 == 13)
  {
    if (v3 >= 0)
      v11 = (uint64_t *)a2;
    else
      v11 = *(uint64_t **)a2;
    v12 = *v11;
    v13 = *(uint64_t *)((char *)v11 + 5);
    if (v12 == 0x6974616369646E49 && v13 == 0x7465536E6F697461)
      return (uint64_t *)(a1 + 40);
  }
  else if (v2 == 19)
  {
    v4 = v3 >= 0 ? (uint64_t *)a2 : *(uint64_t **)a2;
    v5 = *v4;
    v6 = v4[1];
    v7 = *(uint64_t *)((char *)v4 + 11);
    v8 = v5 == 0x7661537265776F50 && v6 == 0x7069726373654465;
    if (v8 && v7 == 0x726F747069726373)
      return (uint64_t *)(a1 + 24);
  }
  if ((v15 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

void QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Response::~QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Response(QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Response *this)
{
  *(_QWORD *)this = &off_24C975918;
}

{
  *(_QWORD *)this = &off_24C975918;
}

uint64_t *QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Response::getTlvDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v8;

  v2 = *(unsigned __int8 *)(a2 + 23);
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = *(_QWORD *)(a2 + 8);
  if (v2 == 13)
  {
    v4 = v3 >= 0 ? (uint64_t *)a2 : *(uint64_t **)a2;
    v5 = *v4;
    v6 = *(uint64_t *)((char *)v4 + 5);
    if (v5 == 0x6C75736552696D51 && v6 == 0x65646F43746C7573)
      return (uint64_t *)(a1 + 24);
  }
  if ((v8 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

void QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Request::~QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Request(QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Request *this)
{
  *(_QWORD *)this = &off_24C975948;
}

{
  *(_QWORD *)this = &off_24C975948;
}

uint64_t *QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Request::getTlvDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v15;

  v2 = *(unsigned __int8 *)(a2 + 23);
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = *(_QWORD *)(a2 + 8);
  if (v2 == 16)
  {
    if (v3 >= 0)
      v11 = (uint64_t *)a2;
    else
      v11 = *(uint64_t **)a2;
    v13 = *v11;
    v12 = v11[1];
    if (v13 == 0x6974616369646E49 && v12 == 0x7478457465536E6FLL)
      return (uint64_t *)(a1 + 40);
  }
  else if (v2 == 19)
  {
    v4 = v3 >= 0 ? (uint64_t *)a2 : *(uint64_t **)a2;
    v5 = *v4;
    v6 = v4[1];
    v7 = *(uint64_t *)((char *)v4 + 11);
    v8 = v5 == 0x7661537265776F50 && v6 == 0x7069726373654465;
    if (v8 && v7 == 0x726F747069726373)
      return (uint64_t *)(a1 + 24);
  }
  if ((v15 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

void QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Response::~QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Response(QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Response *this)
{
  *(_QWORD *)this = &off_24C975978;
}

{
  *(_QWORD *)this = &off_24C975978;
}

uint64_t *QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Response::getTlvDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v8;

  v2 = *(unsigned __int8 *)(a2 + 23);
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = *(_QWORD *)(a2 + 8);
  if (v2 == 13)
  {
    v4 = v3 >= 0 ? (uint64_t *)a2 : *(uint64_t **)a2;
    v5 = *v4;
    v6 = *(uint64_t *)((char *)v4 + 5);
    if (v5 == 0x6C75736552696D51 && v6 == 0x65646F43746C7573)
      return (uint64_t *)(a1 + 24);
  }
  if ((v8 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

void QmiMessageDefinitionImpl_ctl_GetClientId_Request::~QmiMessageDefinitionImpl_ctl_GetClientId_Request(QmiMessageDefinitionImpl_ctl_GetClientId_Request *this)
{
  *(_QWORD *)this = &off_24C9759A8;
}

{
  *(_QWORD *)this = &off_24C9759A8;
}

uint64_t *QmiMessageDefinitionImpl_ctl_GetClientId_Request::getTlvDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v8;

  v2 = *(unsigned __int8 *)(a2 + 23);
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = *(_QWORD *)(a2 + 8);
  if (v2 == 11)
  {
    v4 = v3 >= 0 ? (uint64_t *)a2 : *(uint64_t **)a2;
    v5 = *v4;
    v6 = *(uint64_t *)((char *)v4 + 3);
    if (v5 == 0x5465636976726553 && v6 == 0x6570795465636976)
      return (uint64_t *)(a1 + 24);
  }
  if ((v8 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

void QmiMessageDefinitionImpl_ctl_GetClientId_Response::~QmiMessageDefinitionImpl_ctl_GetClientId_Response(QmiMessageDefinitionImpl_ctl_GetClientId_Response *this)
{
  *(_QWORD *)this = &off_24C9759D8;
}

{
  *(_QWORD *)this = &off_24C9759D8;
}

uint64_t *QmiMessageDefinitionImpl_ctl_GetClientId_Response::getTlvDefinition(uint64_t a1, uint64_t **a2)
{
  uint64_t *v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  unsigned __int8 v13;

  v2 = (uint64_t *)*((unsigned __int8 *)a2 + 23);
  v3 = (char)v2;
  if ((char)v2 < 0)
    v2 = a2[1];
  if (v2 == (uint64_t *)10)
  {
    if (v3 >= 0)
      v9 = (uint64_t *)a2;
    else
      v9 = *a2;
    v10 = *v9;
    v11 = *((unsigned __int16 *)v9 + 4);
    if (v10 == 0x64656E6769737341 && v11 == 25673)
      return (uint64_t *)(a1 + 40);
  }
  else if (v2 == (uint64_t *)13)
  {
    v4 = v3 >= 0 ? (uint64_t *)a2 : *a2;
    v5 = *v4;
    v6 = *(uint64_t *)((char *)v4 + 5);
    if (v5 == 0x6C75736552696D51 && v6 == 0x65646F43746C7573)
      return (uint64_t *)(a1 + 24);
  }
  if ((v13 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

void QmiMessageDefinitionImpl_ctl_ReleaseClientId_Request::~QmiMessageDefinitionImpl_ctl_ReleaseClientId_Request(QmiMessageDefinitionImpl_ctl_ReleaseClientId_Request *this)
{
  *(_QWORD *)this = &off_24C975A08;
}

{
  *(_QWORD *)this = &off_24C975A08;
}

uint64_t *QmiMessageDefinitionImpl_ctl_ReleaseClientId_Request::getTlvDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  int v6;
  unsigned __int8 v8;

  v2 = *(unsigned __int8 *)(a2 + 23);
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = *(_QWORD *)(a2 + 8);
  if (v2 == 10)
  {
    v4 = v3 >= 0 ? (uint64_t *)a2 : *(uint64_t **)a2;
    v5 = *v4;
    v6 = *((unsigned __int16 *)v4 + 4);
    if (v5 == 0x64656E6769737341 && v6 == 25673)
      return (uint64_t *)(a1 + 24);
  }
  if ((v8 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

void QmiMessageDefinitionImpl_ctl_ReleaseClientId_Response::~QmiMessageDefinitionImpl_ctl_ReleaseClientId_Response(QmiMessageDefinitionImpl_ctl_ReleaseClientId_Response *this)
{
  *(_QWORD *)this = &off_24C975A38;
}

{
  *(_QWORD *)this = &off_24C975A38;
}

uint64_t *QmiMessageDefinitionImpl_ctl_ReleaseClientId_Response::getTlvDefinition(uint64_t a1, uint64_t **a2)
{
  uint64_t *v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  unsigned __int8 v13;

  v2 = (uint64_t *)*((unsigned __int8 *)a2 + 23);
  v3 = (char)v2;
  if ((char)v2 < 0)
    v2 = a2[1];
  if (v2 == (uint64_t *)10)
  {
    if (v3 >= 0)
      v9 = (uint64_t *)a2;
    else
      v9 = *a2;
    v10 = *v9;
    v11 = *((unsigned __int16 *)v9 + 4);
    if (v10 == 0x64656E6769737341 && v11 == 25673)
      return (uint64_t *)(a1 + 40);
  }
  else if (v2 == (uint64_t *)13)
  {
    v4 = v3 >= 0 ? (uint64_t *)a2 : *a2;
    v5 = *v4;
    v6 = *(uint64_t *)((char *)v4 + 5);
    if (v5 == 0x6C75736552696D51 && v6 == 0x65646F43746C7573)
      return (uint64_t *)(a1 + 24);
  }
  if ((v13 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

void QmiMessageDefinitionImpl_ctl_RevokeClientId_Indication::~QmiMessageDefinitionImpl_ctl_RevokeClientId_Indication(QmiMessageDefinitionImpl_ctl_RevokeClientId_Indication *this)
{
  *(_QWORD *)this = &off_24C975A68;
}

{
  *(_QWORD *)this = &off_24C975A68;
}

uint64_t *QmiMessageDefinitionImpl_ctl_RevokeClientId_Indication::getTlvDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  int v6;
  unsigned __int8 v8;

  v2 = *(unsigned __int8 *)(a2 + 23);
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = *(_QWORD *)(a2 + 8);
  if (v2 == 10)
  {
    v4 = v3 >= 0 ? (uint64_t *)a2 : *(uint64_t **)a2;
    v5 = *v4;
    v6 = *((unsigned __int16 *)v4 + 4);
    if (v5 == 0x64656E6769737341 && v6 == 25673)
      return (uint64_t *)(a1 + 24);
  }
  if ((v8 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

void QmiMessageDefinitionImpl_ctl_SetDataFormat_Request::~QmiMessageDefinitionImpl_ctl_SetDataFormat_Request(QmiMessageDefinitionImpl_ctl_SetDataFormat_Request *this)
{
  *(_QWORD *)this = &off_24C975A98;
}

{
  *(_QWORD *)this = &off_24C975A98;
}

uint64_t *QmiMessageDefinitionImpl_ctl_SetDataFormat_Request::getTlvDefinition(uint64_t a1, uint64_t **a2)
{
  uint64_t *v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  int v6;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned __int8 v15;

  v2 = (uint64_t *)*((unsigned __int8 *)a2 + 23);
  v3 = (char)v2;
  if ((char)v2 < 0)
    v2 = a2[1];
  if (v2 == (uint64_t *)17)
  {
    if (v3 >= 0)
      v9 = (uint64_t *)a2;
    else
      v9 = *a2;
    v10 = *v9;
    v11 = v9[1];
    v12 = *((unsigned __int8 *)v9 + 16);
    if (v10 == 0x6579614C6B6E694CLL && v11 == 0x6F636F746F725072 && v12 == 108)
      return (uint64_t *)(a1 + 40);
  }
  else if (v2 == (uint64_t *)10)
  {
    v4 = v3 >= 0 ? (uint64_t *)a2 : *a2;
    v5 = *v4;
    v6 = *((unsigned __int16 *)v4 + 4);
    if (v5 == 0x6D726F4661746144 && v6 == 29793)
      return (uint64_t *)(a1 + 24);
  }
  if ((v15 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

void QmiMessageDefinitionImpl_ctl_SetDataFormat_Response::~QmiMessageDefinitionImpl_ctl_SetDataFormat_Response(QmiMessageDefinitionImpl_ctl_SetDataFormat_Response *this)
{
  *(_QWORD *)this = &off_24C975AC8;
}

{
  *(_QWORD *)this = &off_24C975AC8;
}

uint64_t *QmiMessageDefinitionImpl_ctl_SetDataFormat_Response::getTlvDefinition(uint64_t a1, uint64_t **a2)
{
  uint64_t *v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned __int8 v15;

  v2 = (uint64_t *)*((unsigned __int8 *)a2 + 23);
  v3 = (char)v2;
  if ((char)v2 < 0)
    v2 = a2[1];
  if (v2 == (uint64_t *)17)
  {
    if (v3 >= 0)
      v9 = (uint64_t *)a2;
    else
      v9 = *a2;
    v10 = *v9;
    v11 = v9[1];
    v12 = *((unsigned __int8 *)v9 + 16);
    if (v10 == 0x6579614C6B6E694CLL && v11 == 0x6F636F746F725072 && v12 == 108)
      return (uint64_t *)(a1 + 40);
  }
  else if (v2 == (uint64_t *)13)
  {
    v4 = v3 >= 0 ? (uint64_t *)a2 : *a2;
    v5 = *v4;
    v6 = *(uint64_t *)((char *)v4 + 5);
    if (v5 == 0x6C75736552696D51 && v6 == 0x65646F43746C7573)
      return (uint64_t *)(a1 + 24);
  }
  if ((v15 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

void QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Request::~QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Request(QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Request *this)
{
  *(_QWORD *)this = &off_24C975AF8;
}

{
  *(_QWORD *)this = &off_24C975AF8;
}

uint64_t *QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Request::getTlvDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v8;

  v2 = *(unsigned __int8 *)(a2 + 23);
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = *(_QWORD *)(a2 + 8);
  if (v2 == 14)
  {
    v4 = v3 >= 0 ? (uint64_t *)a2 : *(uint64_t **)a2;
    v5 = *v4;
    v6 = *(uint64_t *)((char *)v4 + 6);
    if (v5 == 0x7661537265776F50 && v6 == 0x6574617453657661)
      return (uint64_t *)(a1 + 24);
  }
  if ((v8 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

void QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Response::~QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Response(QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Response *this)
{
  *(_QWORD *)this = &off_24C975B28;
}

{
  *(_QWORD *)this = &off_24C975B28;
}

uint64_t *QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Response::getTlvDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v8;

  v2 = *(unsigned __int8 *)(a2 + 23);
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = *(_QWORD *)(a2 + 8);
  if (v2 == 13)
  {
    v4 = v3 >= 0 ? (uint64_t *)a2 : *(uint64_t **)a2;
    v5 = *v4;
    v6 = *(uint64_t *)((char *)v4 + 5);
    if (v5 == 0x6C75736552696D51 && v6 == 0x65646F43746C7573)
      return (uint64_t *)(a1 + 24);
  }
  if ((v8 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *QmiMessageDefinitionImpl_ctl_Sync_Indication::getTlvDefinition()
{
  unsigned __int8 v0;

  if ((v0 & 1) != 0
  {
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  }
  QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
  *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *QmiMessageDefinitionImpl_ctl_Sync_Request::getTlvDefinition()
{
  unsigned __int8 v0;

  if ((v0 & 1) != 0
  {
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  }
  QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
  *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

void QmiMessageDefinitionImpl_ctl_Sync_Response::~QmiMessageDefinitionImpl_ctl_Sync_Response(QmiMessageDefinitionImpl_ctl_Sync_Response *this)
{
  *(_QWORD *)this = &off_24C975B58;
}

{
  *(_QWORD *)this = &off_24C975B58;
}

uint64_t *QmiMessageDefinitionImpl_ctl_Sync_Response::getTlvDefinition(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v8;

  v2 = *(unsigned __int8 *)(a2 + 23);
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = *(_QWORD *)(a2 + 8);
  if (v2 == 13)
  {
    v4 = v3 >= 0 ? (uint64_t *)a2 : *(uint64_t **)a2;
    v5 = *v4;
    v6 = *(uint64_t *)((char *)v4 + 5);
    if (v5 == 0x6C75736552696D51 && v6 == 0x65646F43746C7573)
      return (uint64_t *)(a1 + 24);
  }
  if ((v8 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Request::getTlvDefinition(QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Request *this, int a2)
{
  unsigned __int8 v3;

  if (a2 == 17)
    return (uint64_t *)((char *)this + 40);
  if (a2 == 1)
    return (uint64_t *)((char *)this + 24);
  if ((v3 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Response::getTlvDefinition(QmiMessageDefinitionImpl_ctl_ConfigPowerSaveMode_Response *this, int a2)
{
  unsigned __int8 v3;

  if (a2 == 2)
    return (uint64_t *)((char *)this + 24);
  if ((v3 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Request::getTlvDefinition(QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Request *this, int a2)
{
  unsigned __int8 v3;

  if (a2 == 16)
    return (uint64_t *)((char *)this + 40);
  if (a2 == 1)
    return (uint64_t *)((char *)this + 24);
  if ((v3 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Response::getTlvDefinition(QmiMessageDefinitionImpl_ctl_ConfigPowerSaveModeExt_Response *this, int a2)
{
  unsigned __int8 v3;

  if (a2 == 2)
    return (uint64_t *)((char *)this + 24);
  if ((v3 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *QmiMessageDefinitionImpl_ctl_GetClientId_Request::getTlvDefinition(QmiMessageDefinitionImpl_ctl_GetClientId_Request *this, int a2)
{
  unsigned __int8 v3;

  if (a2 == 1)
    return (uint64_t *)((char *)this + 24);
  if ((v3 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *QmiMessageDefinitionImpl_ctl_GetClientId_Response::getTlvDefinition(QmiMessageDefinitionImpl_ctl_GetClientId_Response *this, int a2)
{
  unsigned __int8 v3;

  if (a2 == 1)
    return (uint64_t *)((char *)this + 40);
  if (a2 == 2)
    return (uint64_t *)((char *)this + 24);
  if ((v3 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *QmiMessageDefinitionImpl_ctl_ReleaseClientId_Request::getTlvDefinition(QmiMessageDefinitionImpl_ctl_ReleaseClientId_Request *this, int a2)
{
  unsigned __int8 v3;

  if (a2 == 1)
    return (uint64_t *)((char *)this + 24);
  if ((v3 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *QmiMessageDefinitionImpl_ctl_ReleaseClientId_Response::getTlvDefinition(QmiMessageDefinitionImpl_ctl_ReleaseClientId_Response *this, int a2)
{
  unsigned __int8 v3;

  if (a2 == 1)
    return (uint64_t *)((char *)this + 40);
  if (a2 == 2)
    return (uint64_t *)((char *)this + 24);
  if ((v3 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *QmiMessageDefinitionImpl_ctl_RevokeClientId_Indication::getTlvDefinition(QmiMessageDefinitionImpl_ctl_RevokeClientId_Indication *this, int a2)
{
  unsigned __int8 v3;

  if (a2 == 1)
    return (uint64_t *)((char *)this + 24);
  if ((v3 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *QmiMessageDefinitionImpl_ctl_SetDataFormat_Request::getTlvDefinition(QmiMessageDefinitionImpl_ctl_SetDataFormat_Request *this, int a2)
{
  unsigned __int8 v3;

  if (a2 == 16)
    return (uint64_t *)((char *)this + 40);
  if (a2 == 1)
    return (uint64_t *)((char *)this + 24);
  if ((v3 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *QmiMessageDefinitionImpl_ctl_SetDataFormat_Response::getTlvDefinition(QmiMessageDefinitionImpl_ctl_SetDataFormat_Response *this, int a2)
{
  unsigned __int8 v3;

  if (a2 == 16)
    return (uint64_t *)((char *)this + 40);
  if (a2 == 2)
    return (uint64_t *)((char *)this + 24);
  if ((v3 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Request::getTlvDefinition(QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Request *this, int a2)
{
  unsigned __int8 v3;

  if (a2 == 1)
    return (uint64_t *)((char *)this + 24);
  if ((v3 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Response::getTlvDefinition(QmiMessageDefinitionImpl_ctl_SetPowerSaveMode_Response *this, int a2)
{
  unsigned __int8 v3;

  if (a2 == 2)
    return (uint64_t *)((char *)this + 24);
  if ((v3 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *QmiMessageDefinitionImpl_ctl_Sync_Indication::getTlvDefinition(QmiMessageDefinitionImpl_ctl_Sync_Indication *this)
{
  unsigned __int8 v1;

  if ((v1 & 1) != 0
  {
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  }
  QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
  *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *QmiMessageDefinitionImpl_ctl_Sync_Request::getTlvDefinition(QmiMessageDefinitionImpl_ctl_Sync_Request *this)
{
  unsigned __int8 v1;

  if ((v1 & 1) != 0
  {
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  }
  QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
  *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t *QmiMessageDefinitionImpl_ctl_Sync_Response::getTlvDefinition(QmiMessageDefinitionImpl_ctl_Sync_Response *this, int a2)
{
  unsigned __int8 v3;

  if (a2 == 2)
    return (uint64_t *)((char *)this + 24);
  if ((v3 & 1) != 0)
    return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
  {
    QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef = (uint64_t)off_24C975730;
    *(_QWORD *)algn_254A2C318 = "(unknown tlv type)";
  }
  return &QmiMessageDefinition::getDefaultTlvDefinition(void)::defaultTlvDef;
}

uint64_t ctu::llvm::StringRef::compare_lower(uint64_t a1, const char *a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  unsigned int v6;

  v3 = a3;
  v4 = *(_QWORD *)(a1 + 8);
  if (v4 < a3)
    a3 = *(_QWORD *)(a1 + 8);
  LODWORD(result) = ascii_strncasecmp(*(const char **)a1, a2, a3);
  if (v4 < v3)
    v6 = -1;
  else
    v6 = 1;
  if (v4 == v3)
    v6 = 0;
  if ((_DWORD)result)
    return result;
  else
    return v6;
}

uint64_t ascii_strncasecmp(const char *a1, const char *a2, uint64_t a3)
{
  unsigned __int8 v3;
  int v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  int v7;
  unsigned __int8 v8;

  if (!a3)
    return 0;
  while (1)
  {
    v4 = *(unsigned __int8 *)a1++;
    v3 = v4;
    v5 = v4 + 32;
    if ((v4 - 65) < 0x1A)
      v3 = v5;
    v7 = *(unsigned __int8 *)a2++;
    v6 = v7;
    v8 = v7 + 32;
    if ((v7 - 65) < 0x1A)
      v6 = v8;
    if (v3 != v6)
      break;
    if (!--a3)
      return 0;
  }
  if (v3 < v6)
    return 0xFFFFFFFFLL;
  else
    return 1;
}

BOOL ctu::llvm::StringRef::startswith_lower(uint64_t a1, const char *a2, unint64_t a3)
{
  return *(_QWORD *)(a1 + 8) >= a3 && ascii_strncasecmp(*(const char **)a1, a2, a3) == 0;
}

BOOL ctu::llvm::StringRef::endswith_lower(_QWORD *a1, const char *a2, unint64_t a3)
{
  unint64_t v3;

  v3 = a1[1];
  return v3 >= a3 && ascii_strncasecmp((const char *)(*a1 + v3 - a3), a2, a3) == 0;
}

uint64_t ctu::llvm::StringRef::compare_numeric(uint64_t *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  int v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  unsigned int v31;
  unint64_t v33;

  v5 = a1[1];
  if (v5 >= a3)
    v6 = a3;
  else
    v6 = a1[1];
  if (v6)
  {
    v7 = a2;
    v8 = 0;
    v9 = v6 + 1;
    v10 = *a1;
    v11 = -(uint64_t)v6;
    v12 = a2 + 1;
    v13 = *a1 + 1;
    do
    {
      v14 = *(unsigned __int8 *)(v10 + v8);
      v15 = *(unsigned __int8 *)(v7 + v8);
      if (v14 - 48 > 9 || v15 - 48 > 9)
      {
        v17 = v8;
        if (v14 != v15)
        {
          if (v14 < v15)
            return 0xFFFFFFFFLL;
          else
            return 1;
        }
      }
      else
      {
        v18 = 0;
        v19 = v13;
        v20 = v12;
        do
        {
          if (!(v11 + v8 + v18))
          {
            v17 = v6;
            v27 = v9;
            goto LABEL_33;
          }
          v21 = v8 + v18 + 1;
          v22 = v21 < v5 && *(unsigned __int8 *)(v19 + v8) - 48 < 0xA;
          if (v21 >= a3)
          {
            v25 = 5;
            v24 = 1;
          }
          else
          {
            v23 = (*(_BYTE *)(v20 + v8) - 48);
            v22 ^= v23 < 0xA;
            if (v23 < 0xA)
              v24 = -1;
            else
              v24 = 1;
            v25 = 0;
          }
          if (v22)
            v3 = v24;
          else
            v3 = v3;
          if (v22)
            v26 = 1;
          else
            v26 = v25;
          ++v18;
          ++v20;
          ++v19;
        }
        while (!v26);
        if (v26 != 5)
          return v3;
        v27 = v8 + v18;
        v17 = v27 - 1;
LABEL_33:
        if (v27 != v8)
        {
          v28 = v10;
          v29 = v7;
          v33 = v6;
          v30 = memcmp((const void *)(v10 + v8), (const void *)(v7 + v8), v27 - v8);
          v6 = v33;
          v7 = v29;
          v10 = v28;
          if (v30)
            return (v30 >> 31) | 1u;
        }
      }
      v8 = v17 + 1;
    }
    while (v17 + 1 != v6);
  }
  if (v5 < a3)
    v31 = -1;
  else
    v31 = 1;
  if (v5 == a3)
    return 0;
  else
    return v31;
}

_QWORD *ctu::llvm::StringRef::lower@<X0>(ctu::llvm::StringRef *this@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *result;
  uint64_t v4;
  uint64_t i;
  int v6;
  _QWORD *v7;

  memset(a2, 170, 24);
  result = std::string::basic_string[abi:ne180100](a2, *((_QWORD *)this + 1), 0);
  v4 = *((_QWORD *)this + 1);
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      v6 = *(unsigned __int8 *)(*(_QWORD *)this + i);
      if ((v6 - 65) < 0x1A)
        LOBYTE(v6) = v6 + 32;
      if (*((char *)result + 23) >= 0)
        v7 = result;
      else
        v7 = (_QWORD *)*result;
      *((_BYTE *)v7 + i) = v6;
    }
  }
  return result;
}

_QWORD *ctu::llvm::StringRef::upper@<X0>(ctu::llvm::StringRef *this@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *result;
  uint64_t v4;
  uint64_t i;
  int v6;
  _QWORD *v7;

  memset(a2, 170, 24);
  result = std::string::basic_string[abi:ne180100](a2, *((_QWORD *)this + 1), 0);
  v4 = *((_QWORD *)this + 1);
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      v6 = *(unsigned __int8 *)(*(_QWORD *)this + i);
      if ((v6 - 97) < 0x1A)
        LOBYTE(v6) = v6 - 32;
      if (*((char *)result + 23) >= 0)
        v7 = result;
      else
        v7 = (_QWORD *)*result;
      *((_BYTE *)v7 + i) = v6;
    }
  }
  return result;
}

uint64_t ctu::llvm::StringRef::find(uint64_t *a1, unsigned __int8 *a2, size_t a3, unint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  size_t v9;
  size_t v10;
  uint64_t v11;
  size_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _OWORD v20[14];
  int8x16_t v21;
  int8x16_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a1[1];
  v5 = v4 - a3;
  if (v4 < a3)
    return -1;
  v6 = a4;
  if (a3 - 256 >= 0xFFFFFFFFFFFFFF01 && v4 > 0xF)
  {
    v9 = v4 - a4;
    if (v4 > a4)
    {
      v21 = vdupq_n_s8(a3);
      v22 = v21;
      v20[12] = v21;
      v20[13] = v21;
      v20[10] = v21;
      v20[11] = v21;
      v20[8] = v21;
      v20[9] = v21;
      v20[6] = v21;
      v20[7] = v21;
      v20[4] = v21;
      v20[5] = v21;
      v20[2] = v21;
      v20[3] = v21;
      v20[0] = v21;
      v20[1] = v21;
      v10 = a3 - 1;
      if (a3 != 1)
      {
        v11 = 0;
        v12 = a3 - 1;
        do
          *((_BYTE *)v20 + a2[v11++]) = v12--;
        while (v10 != v11);
      }
      if (v9 >= a3)
      {
        v13 = *a1;
        while (1)
        {
          v14 = v6 >= v4 ? v4 : v6;
          if (a3 <= v4 - v14 && (!a3 || !memcmp((const void *)(v13 + v14), a2, a3)))
            break;
          v15 = *((unsigned __int8 *)v20 + *(unsigned __int8 *)(v13 + v6 + v10));
          v9 -= v15;
          v6 += v15;
          if (v9 < a3)
            return -1;
        }
        return v6;
      }
    }
    return -1;
  }
  v16 = v5 + 1;
  if (v5 + 1 <= a4)
    return -1;
  v17 = *a1;
  while (1)
  {
    v18 = v6 >= v4 ? v4 : v6;
    if (a3 <= v4 - v18 && (!a3 || !memcmp((const void *)(v17 + v18), a2, a3)))
      break;
    if (v16 == ++v6)
      return -1;
  }
  return v6;
}

size_t ctu::llvm::StringRef::rfind(uint64_t *a1, void *__s2, size_t __n)
{
  size_t v3;
  size_t v4;
  size_t v5;
  uint64_t v9;
  size_t v10;

  v3 = a1[1];
  v4 = v3 - __n;
  if (v3 < __n)
    return -1;
  v5 = v4 + 1;
  if (v4 == -1)
    return -1;
  v9 = *a1;
  while (1)
  {
    --v5;
    v10 = v4 >= v3 ? v3 : v4;
    if (__n <= v3 - v10)
    {
      if (!__n)
        return v4;
      if (!memcmp((const void *)(v9 + v10), __s2, __n))
        break;
    }
    if (--v4 == -1)
      return v4;
  }
  return v5;
}

uint64_t ctu::llvm::StringRef::find_first_of(_QWORD *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  unsigned int v4;
  unint64_t v5;
  __int128 v7;

  for (; a3; --a3)
  {
    v4 = *a2++;
    *(_QWORD *)((char *)&v7 + (((unint64_t)v4 >> 3) & 0x18)) |= 1 << v4;
  }
  v5 = a1[1];
  if (v5 <= a4)
    return -1;
  while (((*(_QWORD *)((char *)&v7 + (((unint64_t)*(unsigned __int8 *)(*a1 + a4) >> 3) & 0x18)) >> *(_BYTE *)(*a1 + a4)) & 1) == 0)
  {
    if (v5 == ++a4)
      return -1;
  }
  return a4;
}

unint64_t ctu::llvm::StringRef::find_first_not_of(ctu::llvm::StringRef *this, unsigned __int8 a2, unint64_t a3)
{
  unint64_t v3;

  v3 = *((_QWORD *)this + 1);
  if (v3 <= a3)
    return -1;
  while (*(unsigned __int8 *)(*(_QWORD *)this + a3) == a2)
  {
    if (v3 == ++a3)
      return -1;
  }
  return a3;
}

uint64_t ctu::llvm::StringRef::find_first_not_of(_QWORD *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  unsigned int v4;
  unint64_t v5;
  __int128 v7;

  for (; a3; --a3)
  {
    v4 = *a2++;
    *(_QWORD *)((char *)&v7 + (((unint64_t)v4 >> 3) & 0x18)) |= 1 << v4;
  }
  v5 = a1[1];
  if (v5 <= a4)
    return -1;
  while (((*(_QWORD *)((char *)&v7 + (((unint64_t)*(unsigned __int8 *)(*a1 + a4) >> 3) & 0x18)) >> *(_BYTE *)(*a1 + a4)) & 1) != 0)
  {
    if (v5 == ++a4)
      return -1;
  }
  return a4;
}

uint64_t ctu::llvm::StringRef::find_last_of(_QWORD *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  unsigned int v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  __int128 v10;

  for (; a3; --a3)
  {
    v4 = *a2++;
    *(_QWORD *)((char *)&v10 + (((unint64_t)v4 >> 3) & 0x18)) |= 1 << v4;
  }
  if (a4 >= a1[1])
    v5 = a1[1];
  else
    v5 = a4;
  while (v5)
  {
    v6 = v5 - 1;
    v7 = *(unsigned __int8 *)(*a1 + v5 - 1);
    v8 = *(_QWORD *)((char *)&v10 + ((v7 >> 3) & 0x18)) >> v7;
    v5 = v6;
    if ((v8 & 1) != 0)
      return v6;
  }
  return -1;
}

unint64_t ctu::llvm::StringRef::find_last_not_of(ctu::llvm::StringRef *this, unsigned __int8 a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  int v5;

  if (a3 >= *((_QWORD *)this + 1))
    v3 = *((_QWORD *)this + 1);
  else
    v3 = a3;
  while (v3)
  {
    v4 = v3 - 1;
    v5 = *(unsigned __int8 *)(*(_QWORD *)this + v3-- - 1);
    if (v5 != a2)
      return v4;
  }
  return -1;
}

uint64_t ctu::llvm::StringRef::find_last_not_of(_QWORD *a1, unsigned __int8 *a2, uint64_t a3, unint64_t a4)
{
  unsigned int v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  __int128 v10;

  for (; a3; --a3)
  {
    v4 = *a2++;
    *(_QWORD *)((char *)&v10 + (((unint64_t)v4 >> 3) & 0x18)) |= 1 << v4;
  }
  if (a4 >= a1[1])
    v5 = a1[1];
  else
    v5 = a4;
  while (v5)
  {
    v6 = v5 - 1;
    v7 = *(unsigned __int8 *)(*a1 + v5 - 1);
    v8 = *(_QWORD *)((char *)&v10 + ((v7 >> 3) & 0x18)) >> v7;
    v5 = v6;
    if ((v8 & 1) == 0)
      return v6;
  }
  return -1;
}

void ctu::llvm::StringRef::split(__int128 *a1, void **a2, unsigned __int8 *a3, size_t a4, int a5, uint64_t a6)
{
  uint64_t v6;
  int v8;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  unsigned __int8 *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  char *v34;
  unint64_t v35;
  _OWORD *v36;
  _OWORD *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  __int128 v49;

  v49 = *a1;
  v6 = v49;
  if ((_QWORD)v49)
  {
    v8 = a5;
    v12 = 0;
    v47 = (uint64_t)(a2 + 2);
    v13 = *((_QWORD *)&v49 + 1);
    while (v8 < 0 || v12 < v8)
    {
      v14 = ctu::llvm::StringRef::find((uint64_t *)&v49, a3, a4, 0);
      if (v14 >= v13)
        v15 = v13;
      else
        v15 = v14;
      v16 = v14 + a4;
      if (v14 + a4 >= v13)
        v16 = v13;
      v17 = v6 + v16;
      v18 = v13 - v16;
      v19 = v6;
      if (v14 == -1)
        v20 = v13;
      else
        v20 = v15;
      if (v14 == -1)
        v6 = 0;
      else
        v6 = v17;
      if (v14 == -1)
        v13 = 0;
      else
        v13 = v18;
      if ((a6 & 1) != 0 || v20)
      {
        v22 = a2[1];
        v21 = (unint64_t)a2[2];
        if ((unint64_t)v22 >= v21)
        {
          v24 = a3;
          v25 = a6;
          v26 = ((char *)v22 - (_BYTE *)*a2) >> 4;
          v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 60)
            goto LABEL_60;
          v28 = v21 - (_QWORD)*a2;
          if (v28 >> 3 > v27)
            v27 = v28 >> 3;
          if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF0)
            v29 = 0xFFFFFFFFFFFFFFFLL;
          else
            v29 = v27;
          if (v29)
            v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::llvm::StringRef>>(v47, v29);
          else
            v30 = 0;
          v31 = &v30[16 * v26];
          *(_QWORD *)v31 = v19;
          *((_QWORD *)v31 + 1) = v20;
          v33 = (char *)*a2;
          v32 = (char *)a2[1];
          v34 = v31;
          a6 = v25;
          if (v32 != *a2)
          {
            do
            {
              *((_OWORD *)v34 - 1) = *((_OWORD *)v32 - 1);
              v34 -= 16;
              v32 -= 16;
            }
            while (v32 != v33);
            v32 = (char *)*a2;
          }
          a3 = v24;
          v23 = v31 + 16;
          *a2 = v34;
          a2[1] = v31 + 16;
          a2[2] = &v30[16 * v29];
          v8 = a5;
          if (v32)
            operator delete(v32);
        }
        else
        {
          *v22 = v19;
          v22[1] = v20;
          v23 = v22 + 2;
        }
        a2[1] = v23;
      }
      *(_QWORD *)&v49 = v6;
      *((_QWORD *)&v49 + 1) = v13;
      ++v12;
      if (!v6)
        return;
    }
    if (v13 || (_DWORD)a6)
    {
      v36 = a2[1];
      v35 = (unint64_t)a2[2];
      if ((unint64_t)v36 >= v35)
      {
        v38 = ((char *)v36 - (_BYTE *)*a2) >> 4;
        v39 = v38 + 1;
        if ((unint64_t)(v38 + 1) >> 60)
LABEL_60:
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        v40 = v35 - (_QWORD)*a2;
        if (v40 >> 3 > v39)
          v39 = v40 >> 3;
        if ((unint64_t)v40 >= 0x7FFFFFFFFFFFFFF0)
          v41 = 0xFFFFFFFFFFFFFFFLL;
        else
          v41 = v39;
        if (v41)
          v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::llvm::StringRef>>(v47, v41);
        else
          v42 = 0;
        v43 = &v42[16 * v38];
        v44 = &v42[16 * v41];
        *(_OWORD *)v43 = v49;
        v37 = v43 + 16;
        v46 = (char *)*a2;
        v45 = (char *)a2[1];
        if (v45 != *a2)
        {
          do
          {
            *((_OWORD *)v43 - 1) = *((_OWORD *)v45 - 1);
            v43 -= 16;
            v45 -= 16;
          }
          while (v45 != v46);
          v45 = (char *)*a2;
        }
        *a2 = v43;
        a2[1] = v37;
        a2[2] = v44;
        if (v45)
          operator delete(v45);
      }
      else
      {
        *v36 = v49;
        v37 = v36 + 1;
      }
      a2[1] = v37;
    }
  }
}

uint64_t ctu::llvm::StringRef::count(uint64_t *a1, const void *a2, size_t a3)
{
  unint64_t v3;
  size_t v4;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  size_t v10;
  unint64_t v11;

  v3 = a1[1];
  v4 = v3 - a3;
  if (v3 < a3 || v4 == -1)
    return 0;
  v7 = 0;
  v8 = 0;
  v9 = *a1;
  v10 = v4 + 1;
  do
  {
    if (v8 >= v3)
      v11 = v3;
    else
      v11 = v8;
    if (a3 <= v3 - v11 && (!a3 || !memcmp((const void *)(v9 + v11), a2, a3)))
      ++v7;
    ++v8;
  }
  while (v10 != v8);
  return v7;
}

uint64_t ctu::llvm::getAsUnsignedInteger(_WORD *a1, unint64_t a2, unsigned int a3, unint64_t *a4)
{
  unint64_t v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  unint64_t v9;

  if (a3)
  {
LABEL_2:
    if (!a2)
      return 1;
    goto LABEL_13;
  }
  if (a2 < 2)
  {
    if (!a2)
      return 1;
    goto LABEL_10;
  }
  switch(*a1)
  {
    case 0x7830:
      ++a1;
      a3 = 16;
LABEL_29:
      a2 -= 2;
      goto LABEL_2;
    case 0x6230:
      ++a1;
      a3 = 2;
      goto LABEL_29;
    case 0x6F30:
      ++a1;
      a3 = 8;
      goto LABEL_29;
  }
LABEL_10:
  if (*(_BYTE *)a1 == 48)
    a3 = 8;
  else
    a3 = 10;
LABEL_13:
  v5 = 0;
  *a4 = 0;
  while (*(char *)a1 >= 48)
  {
    v6 = *(unsigned __int8 *)a1;
    if (v6 >= 0x3A)
    {
      if (v6 < 0x61)
      {
        if (v6 - 65 > 0x19)
          return 1;
        v7 = -55;
      }
      else
      {
        if (v6 >= 0x7B)
          return 1;
        v7 = -87;
      }
    }
    else
    {
      v7 = -48;
    }
    v8 = v7 + v6;
    if (v8 >= a3)
      break;
    v9 = v5 * a3 + v8;
    *a4 = v9;
    if (v9 / a3 < v5)
      break;
    a1 = (_WORD *)((char *)a1 + 1);
    v5 = v9;
    if (!--a2)
      return 0;
  }
  return 1;
}

uint64_t ctu::llvm::getAsSignedInteger(_WORD *a1, unint64_t a2, unsigned int a3, uint64_t *a4)
{
  uint64_t v5;
  uint64_t result;
  char AsUnsignedInteger;
  uint64_t v8;

  v8 = 0xAAAAAAAAAAAAAAAALL;
  if (a2 && *(_BYTE *)a1 == 45)
  {
    if ((ctu::llvm::getAsUnsignedInteger((_WORD *)((char *)a1 + 1), a2 - 1, a3, (unint64_t *)&v8) & 1) != 0)
      return 1;
    v5 = -v8;
    if (-v8 >= 0 && v8 != 0)
      return 1;
    goto LABEL_8;
  }
  AsUnsignedInteger = ctu::llvm::getAsUnsignedInteger(a1, a2, a3, (unint64_t *)&v8);
  result = 1;
  if ((AsUnsignedInteger & 1) == 0)
  {
    v5 = v8;
    if ((v8 & 0x8000000000000000) == 0)
    {
LABEL_8:
      result = 0;
      *a4 = v5;
    }
  }
  return result;
}

_QWORD *ctu::llvm::operator<<(_QWORD *a1, uint64_t a2)
{
  void *v4;
  unsigned int v5;
  void **v6;
  uint64_t v7;
  void **p_p;
  uint64_t v9;
  _QWORD *v10;
  void *__p;
  uint64_t v13;
  uint64_t v14;

  v4 = *(void **)a2;
  if (v4)
  {
    std::string::basic_string[abi:ne180100](&__p, v4, *(_QWORD *)(a2 + 8));
    v5 = HIBYTE(v14);
    v6 = (void **)__p;
    v7 = v13;
  }
  else
  {
    v7 = 0;
    v6 = 0;
    v5 = 0;
    __p = 0;
    v13 = 0;
    v14 = 0;
  }
  if ((v5 & 0x80u) == 0)
    p_p = &__p;
  else
    p_p = v6;
  if ((v5 & 0x80u) == 0)
    v9 = v5;
  else
    v9 = v7;
  v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)p_p, v9);
  if (SHIBYTE(v14) < 0)
    operator delete(__p);
  return v10;
}

void sub_20E61831C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::llvm::StringRef>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
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

BOOL ctu::starts_with(const void *a1, size_t a2, const void *a3, size_t a4)
{
  if (a2 < a4)
    return 0;
  if (a4)
    return memcmp(a1, a3, a4) == 0;
  return 1;
}

BOOL ctu::ends_with(uint64_t a1, size_t a2, const void *a3, size_t a4)
{
  if (a2 < a4)
    return 0;
  if (a4)
    return memcmp((const void *)(a1 + a2 - a4), a3, a4) == 0;
  return 1;
}

double ctu::partition@<D0>(char *a1@<X0>, size_t a2@<X1>, unsigned __int8 *a3@<X2>, size_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  size_t v13;
  double result;
  __int128 __dst;
  uint64_t v16;
  uint64_t v17[2];

  v17[0] = (uint64_t)a1;
  v17[1] = a2;
  *(_OWORD *)a5 = 0u;
  *(_OWORD *)(a5 + 16) = 0u;
  *(_OWORD *)(a5 + 32) = 0u;
  *(_OWORD *)(a5 + 48) = 0u;
  *(_QWORD *)(a5 + 64) = 0;
  v10 = ctu::llvm::StringRef::find(v17, a3, a4, 0);
  if (v10 == -1)
  {
    if (a1)
    {
      std::string::basic_string[abi:ne180100](&__dst, a1, a2);
    }
    else
    {
      __dst = 0uLL;
      v16 = 0;
    }
    result = *(double *)&__dst;
    *(_OWORD *)a5 = __dst;
    *(_QWORD *)(a5 + 16) = v16;
  }
  else
  {
    v11 = v10;
    if (a1)
    {
      if (v10 >= a2)
        v12 = a2;
      else
        v12 = v10;
      std::string::basic_string[abi:ne180100](&__dst, a1, v12);
    }
    else
    {
      __dst = 0uLL;
      v16 = 0;
    }
    *(_OWORD *)a5 = __dst;
    *(_QWORD *)(a5 + 16) = v16;
    if (a3)
    {
      std::string::basic_string[abi:ne180100](&__dst, a3, a4);
    }
    else
    {
      __dst = 0uLL;
      v16 = 0;
    }
    *(_OWORD *)(a5 + 24) = __dst;
    *(_QWORD *)(a5 + 40) = v16;
    if (a1)
    {
      v13 = v11 + a4;
      if (v11 + a4 >= a2)
        v13 = a2;
      std::string::basic_string[abi:ne180100](&__dst, &a1[v13], a2 - v13);
    }
    else
    {
      __dst = 0uLL;
      v16 = 0;
    }
    result = *(double *)&__dst;
    *(_OWORD *)(a5 + 48) = __dst;
    *(_QWORD *)(a5 + 64) = v16;
  }
  return result;
}

void sub_20E618690(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::tuple<std::string,std::string,std::string>::~tuple(v1);
  _Unwind_Resume(a1);
}

uint64_t std::tuple<std::string,std::string,std::string>::~tuple(uint64_t a1)
{
  if (*(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t ctu::split_any@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X3>, char **a5@<X8>)
{
  _QWORD *v10;
  unint64_t first_not_of;
  uint64_t result;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  _QWORD v28[2];

  v28[0] = a1;
  v28[1] = a2;
  a5[2] = 0;
  v10 = a5 + 2;
  *a5 = 0;
  a5[1] = 0;
  first_not_of = ctu::llvm::StringRef::find_first_not_of(v28, a3, a4, 0);
  result = ctu::llvm::StringRef::find_first_of(v28, a3, a4, first_not_of);
  if ((first_not_of & result) != 0xFFFFFFFFFFFFFFFFLL)
  {
    v13 = result;
    v14 = 0;
    do
    {
      if (v13 == -1)
        v15 = a2;
      else
        v15 = v13;
      v16 = v15 - first_not_of;
      v17 = a1 + first_not_of;
      if ((unint64_t)v14 >= *v10)
      {
        v18 = (v14 - *a5) >> 4;
        if ((unint64_t)(v18 + 1) >> 60)
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        v19 = *v10 - (_QWORD)*a5;
        v20 = v19 >> 3;
        if (v19 >> 3 <= (unint64_t)(v18 + 1))
          v20 = v18 + 1;
        if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0)
          v21 = 0xFFFFFFFFFFFFFFFLL;
        else
          v21 = v20;
        v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ctu::llvm::StringRef>>((uint64_t)v10, v21);
        v24 = &v22[16 * v18];
        *(_QWORD *)v24 = v17;
        *((_QWORD *)v24 + 1) = v16;
        v26 = *a5;
        v25 = a5[1];
        v27 = v24;
        if (v25 != *a5)
        {
          do
          {
            *((_OWORD *)v27 - 1) = *((_OWORD *)v25 - 1);
            v27 -= 16;
            v25 -= 16;
          }
          while (v25 != v26);
          v25 = *a5;
        }
        v14 = v24 + 16;
        *a5 = v27;
        a5[1] = v24 + 16;
        a5[2] = &v22[16 * v23];
        if (v25)
          operator delete(v25);
      }
      else
      {
        *(_QWORD *)v14 = v17;
        *((_QWORD *)v14 + 1) = v16;
        v14 += 16;
      }
      a5[1] = v14;
      first_not_of = ctu::llvm::StringRef::find_first_not_of(v28, a3, a4, v13);
      result = ctu::llvm::StringRef::find_first_of(v28, a3, a4, first_not_of);
      v13 = result;
    }
    while ((first_not_of & result) != 0xFFFFFFFFFFFFFFFFLL);
  }
  return result;
}

void sub_20E6188A8(_Unwind_Exception *exception_object)
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

uint64_t ctu::split_any_copy@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X3>, std::__split_buffer<std::string>::pointer *a5@<X8>)
{
  uint64_t v5;
  unsigned __int8 *v6;
  unint64_t first_not_of;
  uint64_t result;
  unint64_t v10;
  std::string::__raw *v11;
  size_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  size_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  std::string *v22;
  std::__split_buffer<std::string>::pointer begin;
  std::__split_buffer<std::string>::pointer end;
  __int128 v25;
  int64x2_t v26;
  std::string *v27;
  unsigned __int8 *v28;
  std::allocator<std::string> *v29;
  uint64_t v30;
  unint64_t v31;
  std::__split_buffer<std::string> v32;

  v5 = a4;
  v6 = a3;
  v30 = a1;
  v31 = a2;
  a5[2] = 0;
  v29 = (std::allocator<std::string> *)(a5 + 2);
  *a5 = 0;
  a5[1] = 0;
  first_not_of = ctu::llvm::StringRef::find_first_not_of(&v30, a3, a4, 0);
  result = ctu::llvm::StringRef::find_first_of(&v30, v6, v5, first_not_of);
  if ((first_not_of & result) != 0xFFFFFFFFFFFFFFFFLL)
  {
    v10 = result;
    v11 = 0;
    v28 = v6;
    do
    {
      v12 = v10 - first_not_of;
      v13 = v30;
      if (first_not_of >= v31)
        v14 = v31;
      else
        v14 = first_not_of;
      v15 = (void *)(v30 + v14);
      if (v12 >= v31 - v14)
        v16 = v31 - v14;
      else
        v16 = v12;
      if ((unint64_t)v11 >= *(_QWORD *)v29)
      {
        v17 = (unint64_t)*a5;
        v18 = 0xAAAAAAAAAAAAAAABLL * (((char *)v11 - (char *)*a5) >> 3);
        v19 = v18 + 1;
        if (v18 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        v20 = v5;
        if (0x5555555555555556 * ((uint64_t)(*(_QWORD *)v29 - v17) >> 3) > v19)
          v19 = 0x5555555555555556 * ((uint64_t)(*(_QWORD *)v29 - v17) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)v29 - v17) >> 3) >= 0x555555555555555)
          v21 = 0xAAAAAAAAAAAAAAALL;
        else
          v21 = v19;
        v32.__end_cap_.__value_ = v29;
        if (v21)
        {
          if (v21 > 0xAAAAAAAAAAAAAAALL)
            std::__throw_bad_array_new_length[abi:ne180100]();
          v22 = (std::string *)operator new(24 * v21);
        }
        else
        {
          v22 = 0;
        }
        begin = v22 + v18;
        v32.__first_ = v22;
        v32.__begin_ = begin;
        v32.__end_ = begin;
        v32.__end_cap_.__value_ = &v22[v21];
        if (v13)
        {
          std::string::basic_string[abi:ne180100](begin, v15, v16);
          v17 = (unint64_t)*a5;
          v11 = (std::string::__raw *)a5[1];
          begin = v32.__begin_;
          end = v32.__end_;
        }
        else
        {
          begin->__r_.__value_.__r.__words[0] = 0;
          begin->__r_.__value_.__l.__size_ = 0;
          end = v22 + v18;
          begin->__r_.__value_.__r.__words[2] = 0;
        }
        if (v11 == (std::string::__raw *)v17)
        {
          v26 = vdupq_n_s64(v17);
        }
        else
        {
          do
          {
            v25 = *(_OWORD *)v11[-1].__words;
            begin[-1].__r_.__value_.__r.__words[2] = v11[-1].__words[2];
            *(_OWORD *)&begin[-1].__r_.__value_.__l.__data_ = v25;
            --begin;
            v11[-1].__words[1] = 0;
            v11[-1].__words[2] = 0;
            v11[-1].__words[0] = 0;
            --v11;
          }
          while (v11 != (std::string::__raw *)v17);
          v26 = *(int64x2_t *)a5;
        }
        v11 = (std::string::__raw *)&end[1];
        *a5 = begin;
        a5[1] = end + 1;
        *(int64x2_t *)&v32.__begin_ = v26;
        v27 = a5[2];
        a5[2] = v32.__end_cap_.__value_;
        v32.__end_cap_.__value_ = v27;
        v32.__first_ = (std::__split_buffer<std::string>::pointer)v26.i64[0];
        std::__split_buffer<std::string>::~__split_buffer(&v32);
        v5 = v20;
        v6 = v28;
      }
      else
      {
        if (v30)
        {
          std::string::basic_string[abi:ne180100](v11, (void *)(v30 + v14), v16);
        }
        else
        {
          v11->__words[0] = 0;
          v11->__words[1] = 0;
          v11->__words[2] = 0;
        }
        a5[1] = (std::__split_buffer<std::string>::pointer)++v11;
      }
      a5[1] = (std::__split_buffer<std::string>::pointer)v11;
      first_not_of = ctu::llvm::StringRef::find_first_not_of(&v30, v6, v5, v10);
      result = ctu::llvm::StringRef::find_first_of(&v30, v6, v5, first_not_of);
      v10 = result;
    }
    while ((first_not_of & result) != 0xFFFFFFFFFFFFFFFFLL);
  }
  return result;
}

void sub_20E618B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, std::__split_buffer<std::string> *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void **a13, uint64_t a14)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a14);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a13);
  _Unwind_Resume(a1);
}

void ctu::py_escape(char *a1@<X0>, int a2@<W1>, std::string *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  ctu *v12;
  int v13;
  std::string *p_p;
  std::string::size_type size;
  std::string __p;

  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  v6 = a1[23];
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a1 + 1);
  v7 = 2;
  if (!a2)
    v7 = 0;
  std::string::reserve(a3, v6 + v7);
  if (a2)
    std::string::push_back(a3, 34);
  v8 = a1[23];
  if (v8 >= 0)
    v9 = a1;
  else
    v9 = *(char **)a1;
  if (v8 >= 0)
    v10 = a1[23];
  else
    v10 = *((_QWORD *)a1 + 1);
  if (v10)
  {
    v11 = MEMORY[0x24BDAC740];
    do
    {
      v12 = (ctu *)*v9;
      if ((int)v12 > 33)
      {
        switch((_DWORD)v12)
        {
          case '"':
            std::string::push_back(a3, 92);
            LOBYTE(v12) = 34;
            goto LABEL_32;
          case '\'':
            std::string::push_back(a3, 92);
            LOBYTE(v12) = 39;
            goto LABEL_32;
          case '\\':
            std::string::push_back(a3, 92);
            goto LABEL_32;
        }
      }
      else
      {
        switch((_DWORD)v12)
        {
          case 9:
            std::string::push_back(a3, 92);
            LOBYTE(v12) = 116;
            goto LABEL_32;
          case 0xA:
            std::string::push_back(a3, 92);
            LOBYTE(v12) = 110;
            goto LABEL_32;
          case 0xD:
            std::string::push_back(a3, 92);
            LOBYTE(v12) = 114;
            goto LABEL_32;
        }
      }
      if ((v12 & 0x80000000) != 0)
        v13 = __maskrune(*v9, 0x40000uLL);
      else
        v13 = *(_DWORD *)(v11 + 4 * v12 + 60) & 0x40000;
      if (!v13)
      {
        std::string::push_back(a3, 92);
        std::string::push_back(a3, 120);
        ctu::hex0(v12, &__p);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_p = &__p;
        else
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        else
          size = __p.__r_.__value_.__l.__size_;
        std::string::append(a3, (const std::string::value_type *)p_p, size);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        goto LABEL_33;
      }
LABEL_32:
      std::string::push_back(a3, (std::string::value_type)v12);
LABEL_33:
      ++v9;
      --v10;
    }
    while (v10);
  }
  if ((a2 & 1) != 0)
    std::string::push_back(a3, 34);
}

void sub_20E618D8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v15 + 23) < 0)
    operator delete(*(void **)v15);
  _Unwind_Resume(exception_object);
}

void ctu::replace_copy(char *__s@<X1>, uint64_t a2@<X0>, size_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, std::string *a6@<X8>)
{
  std::string *v10;
  std::string::size_type size;
  std::string::size_type v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v10 = a6;
  memset(a6, 170, sizeof(std::string));
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(a6, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&a6->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a6->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 16);
  }
  size = v10->__r_.__value_.__l.__size_;
  if ((v10->__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
  {
    v12 = HIBYTE(v10->__r_.__value_.__r.__words[2]);
  }
  else
  {
    v10 = (std::string *)v10->__r_.__value_.__r.__words[0];
    v12 = size;
  }
  for (; v12; --v12)
  {
    v13 = (char *)memchr(__s, v10->__r_.__value_.__s.__data_[0], a3);
    if (v13)
      v14 = v13;
    else
      v14 = &__s[a3];
    v15 = v14 - __s;
    if (v15 < a5 && v15 != a3)
      v10->__r_.__value_.__s.__data_[0] = *(_BYTE *)(a4 + v15);
    v10 = (std::string *)((char *)v10 + 1);
  }
}

_BYTE *ctu::replace(_BYTE *result, char *__s, size_t a3, uint64_t a4, uint64_t a5)
{
  int v5;
  _BYTE *v6;
  uint64_t v7;
  char *v12;
  char *v14;
  uint64_t v15;

  v5 = (char)result[23];
  if (v5 >= 0)
    v6 = result;
  else
    v6 = *(_BYTE **)result;
  if (v5 >= 0)
    v7 = result[23];
  else
    v7 = *((_QWORD *)result + 1);
  if (v7)
  {
    v12 = &__s[a3];
    do
    {
      result = memchr(__s, (char)*v6, a3);
      if (result)
        v14 = result;
      else
        v14 = v12;
      v15 = v14 - __s;
      if (v15 < a5 && v15 != a3)
        *v6 = *(_BYTE *)(a4 + v15);
      ++v6;
      --v7;
    }
    while (v7);
  }
  return result;
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::pointer end;
  std::__split_buffer<std::string>::pointer begin;
  std::__split_buffer<std::string>::pointer v4;

  begin = this->__begin_;
  end = this->__end_;
  if (end != begin)
  {
    do
    {
      v4 = end - 1;
      this->__end_ = end - 1;
      if (SHIBYTE(end[-1].__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v4->__r_.__value_.__l.__data_);
        v4 = this->__end_;
      }
      end = v4;
    }
    while (v4 != begin);
  }
  if (this->__first_)
    operator delete(this->__first_);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
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

uint64_t xpc::dyn_cast_or_default(xpc_object_t *a1, uint64_t a2)
{
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  xpc_object_t v7;

  v4 = MEMORY[0x212BC1854](*a1);
  v5 = *a1;
  if (v4 == MEMORY[0x24BDACFD0])
    return xpc_int64_get_value(v5);
  v6 = MEMORY[0x212BC1854](v5);
  v7 = *a1;
  if (v6 == MEMORY[0x24BDACFF8])
    return xpc_uint64_get_value(v7);
  if (MEMORY[0x212BC1854](v7) == MEMORY[0x24BDACF80])
    return xpc::dyn_cast_or_default(a1, 0);
  return a2;
}

BOOL xpc::dyn_cast_or_default(xpc_object_t *a1, uint64_t a2)
{
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t value;

  v4 = MEMORY[0x212BC1854](*a1);
  v5 = *a1;
  if (v4 == MEMORY[0x24BDACF80])
    return v5 == (xpc_object_t)MEMORY[0x24BDACF20];
  v6 = MEMORY[0x212BC1854](v5);
  v7 = *a1;
  if (v6 == MEMORY[0x24BDACFD0])
  {
    value = xpc_int64_get_value(v7);
    return value != 0;
  }
  if (MEMORY[0x212BC1854](v7) == MEMORY[0x24BDACFF8])
  {
    value = xpc_uint64_get_value(*a1);
    return value != 0;
  }
  return a2;
}

uint64_t xpc::dyn_cast_or_default(xpc_object_t *a1, int64_t value)
{
  uint64_t v4;
  xpc_object_t v5;
  std::logic_error *exception;

  v4 = MEMORY[0x212BC1854](*a1);
  v5 = *a1;
  if (v4 == MEMORY[0x24BDACFD0])
  {
    value = xpc_int64_get_value(v5);
    if (value < 0)
    {
      exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
      std::out_of_range::out_of_range[abi:ne180100](exception, "dyn_cast to uint64_t requires nonnegative values");
      __cxa_throw(exception, (struct type_info *)off_24C974EE0, MEMORY[0x24BEDAB00]);
    }
  }
  else if (MEMORY[0x212BC1854](v5) == MEMORY[0x24BDACFF8])
  {
    return xpc_uint64_get_value(*a1);
  }
  return value;
}

void sub_20E61928C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t xpc::dyn_cast_or_default(xpc_object_t *a1, int a2)
{
  return xpc::dyn_cast_or_default(a1, a2);
}

uint64_t xpc::dyn_cast_or_default(xpc_object_t *a1, unsigned int a2)
{
  return xpc::dyn_cast_or_default(a1, a2);
}

uint64_t xpc::dyn_cast_or_default@<X0>(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t result;
  const void *bytes_ptr;
  const void *v8;
  size_t v9;
  char *v10;
  char *v11;

  if (MEMORY[0x212BC1854](*a1) == MEMORY[0x24BDACF90] && (bytes_ptr = xpc_data_get_bytes_ptr(*a1)) != 0)
  {
    v8 = bytes_ptr;
    result = xpc_data_get_length(*a1);
    if (result < 1)
    {
      v11 = 0;
      v10 = 0;
    }
    else
    {
      v9 = result;
      v10 = (char *)operator new(result);
      v11 = &v10[v9];
      result = (uint64_t)memcpy(v10, v8, v9);
    }
    *a3 = v10;
    a3[1] = v11;
    a3[2] = v11;
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
    a3[2] = 0;
    return (uint64_t)std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a3, *(const void **)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 8) - *(_QWORD *)a2);
  }
  return result;
}

void xpc::dyn_cast_or_default(xpc_object_t *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  unsigned __int8 *bytes_ptr;
  size_t i;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;

  if (MEMORY[0x212BC1854](*a1) == MEMORY[0x24BDACF90])
  {
    v12 = 0;
    v13 = 0;
    v11 = (uint64_t *)&v12;
    bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(*a1);
    if (bytes_ptr)
    {
      for (i = xpc_data_get_length(*a1); i; --i)
      {
        std::__tree<unsigned char>::__emplace_hint_unique_key_args<unsigned char,unsigned char const&>((uint64_t *)&v11, (uint64_t *)&v12, *bytes_ptr, *bytes_ptr);
        ++bytes_ptr;
      }
      v8 = v12;
      *a3 = (uint64_t)v11;
      a3[1] = (uint64_t)v8;
      v9 = a3 + 1;
      v10 = v13;
      a3[2] = v13;
      if (v10)
      {
        v8[2] = v9;
        v11 = (uint64_t *)&v12;
        v12 = 0;
        v13 = 0;
        v8 = 0;
      }
      else
      {
        *a3 = (uint64_t)v9;
      }
    }
    else
    {
      std::set<unsigned char>::set[abi:ne180100](a3, a2);
      v8 = v12;
    }
    std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::destroy(v8);
  }
  else
  {
    std::set<unsigned char>::set[abi:ne180100](a3, a2);
  }
}

void sub_20E6194AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _QWORD *a11)
{
  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::destroy(a11);
  _Unwind_Resume(a1);
}

void xpc::dyn_cast_or_default(xpc_object_t *a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  char *string_ptr;
  size_t length;

  if (MEMORY[0x212BC1854](*a1) == MEMORY[0x24BDACFF0])
  {
    string_ptr = (char *)xpc_string_get_string_ptr(*a1);
    length = xpc_string_get_length(*a1);
    std::string::basic_string[abi:ne180100](a3, string_ptr, length);
  }
  else if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(a3, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a3->__r_.__value_.__r.__words[2] = *(_QWORD *)(a2 + 16);
  }
}

size_t xpc::dyn_cast_or_default@<X0>(xpc_object_t *a1@<X0>, const char *a2@<X1>, _QWORD *a3@<X8>)
{
  size_t result;
  size_t v7;
  char *string_ptr;
  size_t length;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  if (MEMORY[0x212BC1854](*a1) == MEMORY[0x24BDACFF0])
  {
    string_ptr = (char *)xpc_string_get_string_ptr(*a1);
    length = xpc_string_get_length(*a1);
    return (size_t)std::string::basic_string[abi:ne180100](a3, string_ptr, length);
  }
  result = strlen(a2);
  if (result >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v7 = result;
  if (result >= 0x17)
  {
    v10 = (result & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((result | 7) != 0x17)
      v10 = result | 7;
    v11 = v10 + 1;
    v12 = operator new(v10 + 1);
    a3[1] = v7;
    a3[2] = v11 | 0x8000000000000000;
    *a3 = v12;
    a3 = v12;
  }
  else
  {
    *((_BYTE *)a3 + 23) = result;
    if (!result)
      goto LABEL_11;
  }
  result = (size_t)memcpy(a3, a2, v7);
LABEL_11:
  *((_BYTE *)a3 + v7) = 0;
  return result;
}

double xpc::dyn_cast_or_default(xpc_object_t *a1, double a2)
{
  if (MEMORY[0x212BC1854](*a1) == MEMORY[0x24BDACFA8])
    return xpc_double_get_value(*a1);
  else
    return a2;
}

uint64_t xpc::is_logically_false(xpc_object_t *a1)
{
  uint64_t v2;
  xpc_object_t v3;
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  xpc_object_t v7;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;
  xpc_object_t v11;
  uint64_t v12;
  xpc_object_t v13;
  uint64_t value;

  if (MEMORY[0x212BC1854](*a1) == MEMORY[0x24BDACFE0])
    return 1;
  v2 = MEMORY[0x212BC1854](*a1);
  v3 = *a1;
  if (v2 == MEMORY[0x24BDACFD0])
  {
    value = xpc_int64_get_value(v3);
  }
  else
  {
    v4 = MEMORY[0x212BC1854](v3);
    v5 = *a1;
    if (v4 == MEMORY[0x24BDACFF8])
    {
      value = xpc_uint64_get_value(v5);
    }
    else
    {
      v6 = MEMORY[0x212BC1854](v5);
      v7 = *a1;
      if (v6 == MEMORY[0x24BDACF80])
        return !xpc_BOOL_get_value(v7);
      v8 = MEMORY[0x212BC1854](v7);
      v9 = *a1;
      if (v8 == MEMORY[0x24BDACF90])
      {
        value = xpc_data_get_length(v9);
      }
      else
      {
        v10 = MEMORY[0x212BC1854](v9);
        v11 = *a1;
        if (v10 == MEMORY[0x24BDACFF0])
        {
          value = xpc_string_get_length(v11);
        }
        else
        {
          v12 = MEMORY[0x212BC1854](v11);
          v13 = *a1;
          if (v12 == MEMORY[0x24BDACF78])
          {
            value = xpc_array_get_count(v13);
          }
          else
          {
            if (MEMORY[0x212BC1854](v13) != MEMORY[0x24BDACFA0])
              return 0;
            value = xpc_dictionary_get_count(*a1);
          }
        }
      }
    }
  }
  return value == 0;
}

BOOL xpc::is_logically_false(xpc_object_t *a1)
{
  return MEMORY[0x212BC1854](*a1) != MEMORY[0x24BDACFA0] || xpc_dictionary_get_count(*a1) == 0;
}

BOOL xpc::is_logically_false(xpc_object_t *this, const xpc::array *a2)
{
  return MEMORY[0x212BC1854](*this, a2) != MEMORY[0x24BDACF78] || xpc_array_get_count(*this) == 0;
}

void xpc::auto_reply::deleter(xpc_object_t *a1)
{
  _xpc_connection_s *remote_connection;

  if (a1)
  {
    if (MEMORY[0x212BC1854](*a1) == MEMORY[0x24BDACFA0])
    {
      remote_connection = xpc_dictionary_get_remote_connection(*a1);
      if (remote_connection)
        xpc_connection_send_message(remote_connection, *a1);
    }
    xpc_release(*a1);
    operator delete(a1);
  }
}

void xpc::auto_reply::deleter_with_conn(xpc_object_t *a1, xpc_connection_t *a2)
{
  if (a1)
  {
    if (MEMORY[0x212BC1854](*a1) == MEMORY[0x24BDACFA0] && MEMORY[0x212BC1854](*a2) == MEMORY[0x24BDACF88])
      xpc_connection_send_message(*a2, *a1);
    xpc_release(*a1);
    operator delete(a1);
  }
}

void xpc::auto_reply::connect(void ***a1, xpc_object_t *a2)
{
  void **v2;
  xpc_object_t v4;
  void *v5;
  xpc_object_t v6;
  xpc_object_t v7;

  v2 = *a1;
  if (*a1)
  {
    v4 = *a2;
    if (*a2)
      xpc_retain(*a2);
    else
      v4 = xpc_null_create();
    v5 = *v2;
    *v2 = v4;
    xpc_release(v5);
    v6 = xpc_null_create();
    v7 = *a2;
    *a2 = v6;
    xpc_release(v7);
  }
}

_QWORD *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(_QWORD *result, const void *a2, uint64_t a3, size_t __sz)
{
  _QWORD *v5;
  char *v8;
  size_t v9;

  if (__sz)
  {
    v5 = result;
    if ((__sz & 0x8000000000000000) != 0)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    result = operator new(__sz);
    v8 = (char *)result;
    *v5 = result;
    v5[1] = result;
    v5[2] = (char *)result + __sz;
    v9 = a3 - (_QWORD)a2;
    if (v9)
      result = memcpy(result, a2, v9);
    v5[1] = &v8[v9];
  }
  return result;
}

void sub_20E619A70(_Unwind_Exception *exception_object)
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

uint64_t *std::set<unsigned char>::set[abi:ne180100](uint64_t *a1, _QWORD *a2)
{
  uint64_t *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  BOOL v8;

  a1[1] = 0;
  v3 = a1 + 1;
  a1[2] = 0;
  *a1 = (uint64_t)(a1 + 1);
  v4 = a2 + 1;
  v5 = (_QWORD *)*a2;
  if ((_QWORD *)*a2 != a2 + 1)
  {
    do
    {
      std::__tree<unsigned char>::__emplace_hint_unique_key_args<unsigned char,unsigned char const&>(a1, v3, *((_BYTE *)v5 + 25), *((_BYTE *)v5 + 25));
      v6 = (_QWORD *)v5[1];
      if (v6)
      {
        do
        {
          v7 = v6;
          v6 = (_QWORD *)*v6;
        }
        while (v6);
      }
      else
      {
        do
        {
          v7 = (_QWORD *)v5[2];
          v8 = *v7 == (_QWORD)v5;
          v5 = v7;
        }
        while (!v8);
      }
      v5 = v7;
    }
    while (v7 != v4);
  }
  return a1;
}

void sub_20E619B20(_Unwind_Exception *a1)
{
  _QWORD **v1;

  std::__tree<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::__map_value_compare<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>,std::less<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>>,true>,std::allocator<std::__value_type<std::tuple<qmi::ServiceType,unsigned short,qmi::MessageType>,QmiMessageDefinition const*>>>::destroy(*v1);
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<unsigned char>::__emplace_hint_unique_key_args<unsigned char,unsigned char const&>(uint64_t *result, uint64_t *a2, unsigned __int8 a3, char a4)
{
  uint64_t *v5;
  uint64_t *v6;
  uint64_t **v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  BOOL v16;
  uint64_t *v17;
  uint64_t *v18;
  unsigned int v19;
  uint64_t *v20;
  uint64_t *v21;
  unsigned int v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t *v25;

  v5 = a2;
  v6 = result;
  v7 = (uint64_t **)(result + 1);
  if (result + 1 != a2)
  {
    v8 = *((unsigned __int8 *)a2 + 25);
    if (v8 <= a3)
    {
      if (v8 >= a3)
        return result;
      v13 = a2 + 1;
      v12 = (uint64_t *)a2[1];
      if (v12)
      {
        do
        {
          v13 = v12;
          v12 = (uint64_t *)*v12;
          v5 = v13;
          v14 = v13;
        }
        while (v12);
      }
      else
      {
        v14 = a2;
        do
        {
          v20 = v14;
          v14 = (uint64_t *)v14[2];
        }
        while ((uint64_t *)*v14 != v20);
      }
      if (v14 == (uint64_t *)v7)
        goto LABEL_42;
      if (*((unsigned __int8 *)v14 + 25) > a3)
        goto LABEL_42;
      v21 = *v7;
      v13 = result + 1;
      v5 = result + 1;
      if (!*v7)
        goto LABEL_42;
      while (1)
      {
        while (1)
        {
          v5 = v21;
          v22 = *((unsigned __int8 *)v21 + 25);
          if (v22 <= a3)
            break;
          v21 = (uint64_t *)*v21;
          v13 = v5;
          if (!*v5)
            goto LABEL_42;
        }
        if (v22 >= a3)
          return result;
        v21 = (uint64_t *)v21[1];
        if (!v21)
        {
LABEL_30:
          v13 = v5 + 1;
          goto LABEL_42;
        }
      }
    }
  }
  v9 = *a2;
  if ((uint64_t *)*result == a2)
  {
    v11 = a2;
  }
  else
  {
    if (v9)
    {
      v10 = (uint64_t *)*a2;
      do
      {
        v11 = v10;
        v10 = (uint64_t *)v10[1];
      }
      while (v10);
    }
    else
    {
      v15 = a2;
      do
      {
        v11 = (uint64_t *)v15[2];
        v16 = *v11 == (_QWORD)v15;
        v15 = v11;
      }
      while (v16);
    }
    if (*((unsigned __int8 *)v11 + 25) >= a3)
    {
      v18 = *v7;
      v13 = result + 1;
      v5 = result + 1;
      if (!*v7)
        goto LABEL_42;
      while (1)
      {
        while (1)
        {
          v5 = v18;
          v19 = *((unsigned __int8 *)v18 + 25);
          if (v19 <= a3)
            break;
          v18 = (uint64_t *)*v18;
          v13 = v5;
          if (!*v5)
            goto LABEL_42;
        }
        if (v19 >= a3)
          return result;
        v18 = (uint64_t *)v18[1];
        if (!v18)
          goto LABEL_30;
      }
    }
  }
  if (v9)
    v17 = v11;
  else
    v17 = a2;
  if (v9)
    v13 = v11 + 1;
  else
    v13 = a2;
  if (!*v13)
  {
    v5 = v17;
LABEL_42:
    v23 = operator new(0x20uLL);
    v23[25] = a4;
    *(_QWORD *)v23 = 0;
    *((_QWORD *)v23 + 1) = 0;
    *((_QWORD *)v23 + 2) = v5;
    *v13 = (uint64_t)v23;
    v24 = *(_QWORD *)*v6;
    if (v24)
    {
      *v6 = v24;
      v25 = (uint64_t *)*v13;
    }
    else
    {
      v25 = (uint64_t *)v23;
    }
    result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v6[1], v25);
    ++v6[2];
  }
  return result;
}

void ctu::hex(ctu *this@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  ctu *v3;
  ctu *v5;
  char v6;
  unsigned int v7;
  char v8;

  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  if (a2 >= 1)
  {
    v3 = this;
    v5 = (ctu *)((char *)this + a2);
    do
    {
      if (*(unsigned __int8 *)v3 >= 0xA0u)
        v6 = 87;
      else
        v6 = 48;
      std::string::push_back(a3, v6 + (*(_BYTE *)v3 >> 4));
      v7 = *(_BYTE *)v3 & 0xF;
      if (v7 >= 0xA)
        v8 = 87;
      else
        v8 = 48;
      std::string::push_back(a3, v8 + v7);
      v3 = (ctu *)((char *)v3 + 1);
    }
    while (v3 < v5);
  }
}

void sub_20E619D9C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void ctu::hex_sp(ctu *this@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  ctu *v3;
  ctu *v5;
  char v6;
  unsigned int v7;
  char v8;
  std::string::size_type v9;
  std::string::size_type v10;
  std::string::size_type size;

  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  if (a2 >= 1)
  {
    v3 = this;
    v5 = (ctu *)((char *)this + a2);
    do
    {
      if (*(unsigned __int8 *)v3 >= 0xA0u)
        v6 = 87;
      else
        v6 = 48;
      std::string::push_back(a3, v6 + (*(_BYTE *)v3 >> 4));
      v7 = *(_BYTE *)v3 & 0xF;
      if (v7 >= 0xA)
        v8 = 87;
      else
        v8 = 48;
      std::string::push_back(a3, v8 + v7);
      std::string::push_back(a3, 32);
      v3 = (ctu *)((char *)v3 + 1);
    }
    while (v3 < v5);
    if (SHIBYTE(a3->__r_.__value_.__r.__words[2]) < 0)
    {
      size = a3->__r_.__value_.__l.__size_;
      if (!size)
        return;
      v10 = a3->__r_.__value_.__r.__words[0];
      v9 = a3->__r_.__value_.__r.__words[0] + size;
    }
    else
    {
      if (!*((_BYTE *)&a3->__r_.__value_.__s + 23))
        return;
      v9 = (std::string::size_type)a3 + HIBYTE(a3->__r_.__value_.__r.__words[2]);
      v10 = (std::string::size_type)a3;
    }
    std::string::erase(a3, ~v10 + v9, 1uLL);
  }
}

void sub_20E619E90(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void ctu::hex(ctu **a1@<X0>, std::string *a2@<X8>)
{
  ctu *v2;
  uint64_t v3;
  ctu *v4;

  v2 = a1[1];
  v3 = v2 - *a1;
  if (v2 == *a1)
    v4 = 0;
  else
    v4 = *a1;
  ctu::hex(v4, v3, a2);
}

void ctu::hex_sp(ctu **a1@<X0>, std::string *a2@<X8>)
{
  ctu *v2;
  uint64_t v3;
  ctu *v4;

  v2 = a1[1];
  v3 = v2 - *a1;
  if (v2 == *a1)
    v4 = 0;
  else
    v4 = *a1;
  ctu::hex_sp(v4, v3, a2);
}

void ctu::hex(ctu *this@<X0>, unint64_t a2@<X8>)
{
  unsigned __int8 v2;
  char v4;
  unsigned int v5;
  int v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  BOOL v11;
  unint64_t v12;
  char v13;

  v2 = this;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  do
  {
    if ((v2 & 0xFu) >= 0xA)
      v4 = 87;
    else
      v4 = 48;
    std::string::push_back((std::string *)a2, v4 + (v2 & 0xF));
    v5 = v2;
    v2 >>= 4;
  }
  while (v5 > 0xF);
  v6 = *(char *)(a2 + 23);
  v7 = v6 < 0;
  if (v6 >= 0)
    v8 = a2;
  else
    v8 = *(_QWORD *)a2;
  if (v7)
    v9 = *(_QWORD *)(a2 + 8);
  else
    v9 = *(unsigned __int8 *)(a2 + 23);
  v10 = (_BYTE *)(v8 + v9 - 1);
  if (v9)
    v11 = (unint64_t)v10 > v8;
  else
    v11 = 0;
  if (v11)
  {
    v12 = v8 + 1;
    do
    {
      v13 = *(_BYTE *)(v12 - 1);
      *(_BYTE *)(v12 - 1) = *v10;
      *v10-- = v13;
    }
    while (v12++ < (unint64_t)v10);
  }
}

{
  unsigned __int16 v2;
  char v4;
  unsigned int v5;
  int v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  BOOL v11;
  unint64_t v12;
  char v13;

  v2 = (unsigned __int16)this;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  do
  {
    if ((v2 & 0xFu) >= 0xA)
      v4 = 87;
    else
      v4 = 48;
    std::string::push_back((std::string *)a2, v4 + (v2 & 0xF));
    v5 = v2;
    v2 >>= 4;
  }
  while (v5 > 0xF);
  v6 = *(char *)(a2 + 23);
  v7 = v6 < 0;
  if (v6 >= 0)
    v8 = a2;
  else
    v8 = *(_QWORD *)a2;
  if (v7)
    v9 = *(_QWORD *)(a2 + 8);
  else
    v9 = *(unsigned __int8 *)(a2 + 23);
  v10 = (_BYTE *)(v8 + v9 - 1);
  if (v9)
    v11 = (unint64_t)v10 > v8;
  else
    v11 = 0;
  if (v11)
  {
    v12 = v8 + 1;
    do
    {
      v13 = *(_BYTE *)(v12 - 1);
      *(_BYTE *)(v12 - 1) = *v10;
      *v10-- = v13;
    }
    while (v12++ < (unint64_t)v10);
  }
}

{
  unsigned int v2;
  char v4;
  int v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  BOOL v10;
  unint64_t v11;
  char v12;

  v2 = this;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  do
  {
    if ((v2 & 0xF) >= 0xA)
      v4 = 87;
    else
      v4 = 48;
    std::string::push_back((std::string *)a2, v4 + (v2 & 0xF));
    v10 = v2 > 0xF;
    v2 >>= 4;
  }
  while (v10);
  v5 = *(char *)(a2 + 23);
  v6 = v5 < 0;
  if (v5 >= 0)
    v7 = a2;
  else
    v7 = *(_QWORD *)a2;
  if (v6)
    v8 = *(_QWORD *)(a2 + 8);
  else
    v8 = *(unsigned __int8 *)(a2 + 23);
  v9 = (_BYTE *)(v7 + v8 - 1);
  if (v8)
    v10 = (unint64_t)v9 > v7;
  else
    v10 = 0;
  if (v10)
  {
    v11 = v7 + 1;
    do
    {
      v12 = *(_BYTE *)(v11 - 1);
      *(_BYTE *)(v11 - 1) = *v9;
      *v9-- = v12;
    }
    while (v11++ < (unint64_t)v9);
  }
}

{
  unsigned __int8 v2;
  char v4;
  unsigned int v5;
  int v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  BOOL v11;
  unint64_t v12;
  char v13;

  v2 = this;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  do
  {
    if ((v2 & 0xFu) >= 0xA)
      v4 = 87;
    else
      v4 = 48;
    std::string::push_back((std::string *)a2, v4 + (v2 & 0xF));
    v5 = v2;
    v2 >>= 4;
  }
  while (v5 > 0xF);
  v6 = *(char *)(a2 + 23);
  v7 = v6 < 0;
  if (v6 >= 0)
    v8 = a2;
  else
    v8 = *(_QWORD *)a2;
  if (v7)
    v9 = *(_QWORD *)(a2 + 8);
  else
    v9 = *(unsigned __int8 *)(a2 + 23);
  v10 = (_BYTE *)(v8 + v9 - 1);
  if (v9)
    v11 = (unint64_t)v10 > v8;
  else
    v11 = 0;
  if (v11)
  {
    v12 = v8 + 1;
    do
    {
      v13 = *(_BYTE *)(v12 - 1);
      *(_BYTE *)(v12 - 1) = *v10;
      *v10-- = v13;
    }
    while (v12++ < (unint64_t)v10);
  }
}

{
  unsigned __int8 v2;
  char v4;
  unsigned int v5;
  int v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  BOOL v11;
  unint64_t v12;
  char v13;

  v2 = this;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  do
  {
    if ((v2 & 0xFu) >= 0xA)
      v4 = 87;
    else
      v4 = 48;
    std::string::push_back((std::string *)a2, v4 + (v2 & 0xF));
    v5 = v2;
    v2 >>= 4;
  }
  while (v5 > 0xF);
  v6 = *(char *)(a2 + 23);
  v7 = v6 < 0;
  if (v6 >= 0)
    v8 = a2;
  else
    v8 = *(_QWORD *)a2;
  if (v7)
    v9 = *(_QWORD *)(a2 + 8);
  else
    v9 = *(unsigned __int8 *)(a2 + 23);
  v10 = (_BYTE *)(v8 + v9 - 1);
  if (v9)
    v11 = (unint64_t)v10 > v8;
  else
    v11 = 0;
  if (v11)
  {
    v12 = v8 + 1;
    do
    {
      v13 = *(_BYTE *)(v12 - 1);
      *(_BYTE *)(v12 - 1) = *v10;
      *v10-- = v13;
    }
    while (v12++ < (unint64_t)v10);
  }
}

{
  unsigned __int16 v2;
  char v4;
  unsigned int v5;
  int v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  BOOL v11;
  unint64_t v12;
  char v13;

  v2 = (unsigned __int16)this;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  do
  {
    if ((v2 & 0xFu) >= 0xA)
      v4 = 87;
    else
      v4 = 48;
    std::string::push_back((std::string *)a2, v4 + (v2 & 0xF));
    v5 = v2;
    v2 >>= 4;
  }
  while (v5 > 0xF);
  v6 = *(char *)(a2 + 23);
  v7 = v6 < 0;
  if (v6 >= 0)
    v8 = a2;
  else
    v8 = *(_QWORD *)a2;
  if (v7)
    v9 = *(_QWORD *)(a2 + 8);
  else
    v9 = *(unsigned __int8 *)(a2 + 23);
  v10 = (_BYTE *)(v8 + v9 - 1);
  if (v9)
    v11 = (unint64_t)v10 > v8;
  else
    v11 = 0;
  if (v11)
  {
    v12 = v8 + 1;
    do
    {
      v13 = *(_BYTE *)(v12 - 1);
      *(_BYTE *)(v12 - 1) = *v10;
      *v10-- = v13;
    }
    while (v12++ < (unint64_t)v10);
  }
}

{
  unsigned int v2;
  char v4;
  int v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  BOOL v10;
  unint64_t v11;
  char v12;

  v2 = this;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  do
  {
    if ((v2 & 0xF) >= 0xA)
      v4 = 87;
    else
      v4 = 48;
    std::string::push_back((std::string *)a2, v4 + (v2 & 0xF));
    v10 = v2 > 0xF;
    v2 >>= 4;
  }
  while (v10);
  v5 = *(char *)(a2 + 23);
  v6 = v5 < 0;
  if (v5 >= 0)
    v7 = a2;
  else
    v7 = *(_QWORD *)a2;
  if (v6)
    v8 = *(_QWORD *)(a2 + 8);
  else
    v8 = *(unsigned __int8 *)(a2 + 23);
  v9 = (_BYTE *)(v7 + v8 - 1);
  if (v8)
    v10 = (unint64_t)v9 > v7;
  else
    v10 = 0;
  if (v10)
  {
    v11 = v7 + 1;
    do
    {
      v12 = *(_BYTE *)(v11 - 1);
      *(_BYTE *)(v11 - 1) = *v9;
      *v9-- = v12;
    }
    while (v11++ < (unint64_t)v9);
  }
}

void sub_20E619F80(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E61A04C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E61A118(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void ctu::hex(unint64_t this@<X0>, unint64_t a2@<X8>)
{
  char v4;
  int v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  BOOL v10;
  unint64_t v11;
  char v12;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  do
  {
    if ((this & 0xF) >= 0xA)
      v4 = 87;
    else
      v4 = 48;
    std::string::push_back((std::string *)a2, v4 + (this & 0xF));
    v10 = this > 0xF;
    this >>= 4;
  }
  while (v10);
  v5 = *(char *)(a2 + 23);
  v6 = v5 < 0;
  if (v5 >= 0)
    v7 = a2;
  else
    v7 = *(_QWORD *)a2;
  if (v6)
    v8 = *(_QWORD *)(a2 + 8);
  else
    v8 = *(unsigned __int8 *)(a2 + 23);
  v9 = (_BYTE *)(v7 + v8 - 1);
  if (v8)
    v10 = (unint64_t)v9 > v7;
  else
    v10 = 0;
  if (v10)
  {
    v11 = v7 + 1;
    do
    {
      v12 = *(_BYTE *)(v11 - 1);
      *(_BYTE *)(v11 - 1) = *v9;
      *v9-- = v12;
    }
    while (v11++ < (unint64_t)v9);
  }
}

{
  char v4;
  int v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  BOOL v10;
  unint64_t v11;
  char v12;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  do
  {
    if ((this & 0xF) >= 0xA)
      v4 = 87;
    else
      v4 = 48;
    std::string::push_back((std::string *)a2, v4 + (this & 0xF));
    v10 = this > 0xF;
    this >>= 4;
  }
  while (v10);
  v5 = *(char *)(a2 + 23);
  v6 = v5 < 0;
  if (v5 >= 0)
    v7 = a2;
  else
    v7 = *(_QWORD *)a2;
  if (v6)
    v8 = *(_QWORD *)(a2 + 8);
  else
    v8 = *(unsigned __int8 *)(a2 + 23);
  v9 = (_BYTE *)(v7 + v8 - 1);
  if (v8)
    v10 = (unint64_t)v9 > v7;
  else
    v10 = 0;
  if (v10)
  {
    v11 = v7 + 1;
    do
    {
      v12 = *(_BYTE *)(v11 - 1);
      *(_BYTE *)(v11 - 1) = *v9;
      *v9-- = v12;
    }
    while (v11++ < (unint64_t)v9);
  }
}

{
  char v4;
  int v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  BOOL v10;
  unint64_t v11;
  char v12;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  do
  {
    if ((this & 0xF) >= 0xA)
      v4 = 87;
    else
      v4 = 48;
    std::string::push_back((std::string *)a2, v4 + (this & 0xF));
    v10 = this > 0xF;
    this >>= 4;
  }
  while (v10);
  v5 = *(char *)(a2 + 23);
  v6 = v5 < 0;
  if (v5 >= 0)
    v7 = a2;
  else
    v7 = *(_QWORD *)a2;
  if (v6)
    v8 = *(_QWORD *)(a2 + 8);
  else
    v8 = *(unsigned __int8 *)(a2 + 23);
  v9 = (_BYTE *)(v7 + v8 - 1);
  if (v8)
    v10 = (unint64_t)v9 > v7;
  else
    v10 = 0;
  if (v10)
  {
    v11 = v7 + 1;
    do
    {
      v12 = *(_BYTE *)(v11 - 1);
      *(_BYTE *)(v11 - 1) = *v9;
      *v9-- = v12;
    }
    while (v11++ < (unint64_t)v9);
  }
}

{
  char v4;
  int v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  BOOL v10;
  unint64_t v11;
  char v12;

  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  do
  {
    if ((this & 0xF) >= 0xA)
      v4 = 87;
    else
      v4 = 48;
    std::string::push_back((std::string *)a2, v4 + (this & 0xF));
    v10 = this > 0xF;
    this >>= 4;
  }
  while (v10);
  v5 = *(char *)(a2 + 23);
  v6 = v5 < 0;
  if (v5 >= 0)
    v7 = a2;
  else
    v7 = *(_QWORD *)a2;
  if (v6)
    v8 = *(_QWORD *)(a2 + 8);
  else
    v8 = *(unsigned __int8 *)(a2 + 23);
  v9 = (_BYTE *)(v7 + v8 - 1);
  if (v8)
    v10 = (unint64_t)v9 > v7;
  else
    v10 = 0;
  if (v10)
  {
    v11 = v7 + 1;
    do
    {
      v12 = *(_BYTE *)(v11 - 1);
      *(_BYTE *)(v11 - 1) = *v9;
      *v9-- = v12;
    }
    while (v11++ < (unint64_t)v9);
  }
}

void sub_20E61A1E4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E61A2B0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E61A37C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E61A448(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E61A514(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E61A5E0(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E61A6AC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E61A778(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void ctu::hex0(ctu *this@<X0>, std::string *a2@<X8>)
{
  unsigned int v2;
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  uint64_t v8;
  char v9;
  char v10;

  v2 = this;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 2uLL, 48);
  if (v2)
  {
    v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    v5 = v4 < 0;
    v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0)
      v6 = a2;
    size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5)
      size = a2->__r_.__value_.__l.__size_;
    v8 = (uint64_t)v6 + size;
    if ((v2 & 0xF) >= 0xA)
      v9 = 87;
    else
      v9 = 48;
    *(_BYTE *)(v8 - 1) = v9 + (v2 & 0xF);
    if (v2 >= 0xA0)
      v10 = 87;
    else
      v10 = 48;
    *(_BYTE *)(v8 - 2) = v10 + (v2 >> 4);
  }
}

{
  int v2;
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  _BYTE *v8;
  unsigned int v9;
  char v10;
  char v11;

  v2 = (int)this;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 4uLL, 48);
  if (v2)
  {
    v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    v5 = v4 < 0;
    v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0)
      v6 = a2;
    size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5)
      size = a2->__r_.__value_.__l.__size_;
    v8 = (char *)v6 + size - 1;
    do
    {
      v9 = (unsigned __int16)v2;
      if ((v2 & 0xFu) >= 0xA)
        v10 = 87;
      else
        v10 = 48;
      *v8 = v10 + (v2 & 0xF);
      if (v2 >= 0xA0u)
        v11 = 87;
      else
        v11 = 48;
      *(v8 - 1) = v11 + (v2 >> 4);
      LOWORD(v2) = BYTE1(v2);
      v8 -= 2;
    }
    while (v9 >= 0x100);
  }
}

{
  unsigned int v2;
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  _BYTE *v8;
  char v9;
  char v10;
  BOOL v11;

  v2 = this;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 8uLL, 48);
  if (v2)
  {
    v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    v5 = v4 < 0;
    v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0)
      v6 = a2;
    size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5)
      size = a2->__r_.__value_.__l.__size_;
    v8 = (char *)v6 + size - 1;
    do
    {
      if ((v2 & 0xF) >= 0xA)
        v9 = 87;
      else
        v9 = 48;
      *v8 = v9 + (v2 & 0xF);
      if (v2 >= 0xA0u)
        v10 = 87;
      else
        v10 = 48;
      *(v8 - 1) = v10 + (v2 >> 4);
      v8 -= 2;
      v11 = v2 >= 0x100;
      v2 >>= 8;
    }
    while (v11);
  }
}

{
  unsigned __int8 v2;
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  uint64_t v8;
  char v9;
  char v10;

  v2 = this;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 2uLL, 48);
  if (v2)
  {
    v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    v5 = v4 < 0;
    v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0)
      v6 = a2;
    size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5)
      size = a2->__r_.__value_.__l.__size_;
    v8 = (uint64_t)v6 + size;
    if ((v2 & 0xFu) >= 0xA)
      v9 = 87;
    else
      v9 = 48;
    *(_BYTE *)(v8 - 1) = v9 + (v2 & 0xF);
    if (v2 >= 0xA0u)
      v10 = 87;
    else
      v10 = 48;
    *(_BYTE *)(v8 - 2) = v10 + (v2 >> 4);
  }
}

{
  unsigned __int8 v2;
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  uint64_t v8;
  char v9;
  char v10;

  v2 = this;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 2uLL, 48);
  if (v2)
  {
    v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    v5 = v4 < 0;
    v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0)
      v6 = a2;
    size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5)
      size = a2->__r_.__value_.__l.__size_;
    v8 = (uint64_t)v6 + size;
    if ((v2 & 0xFu) >= 0xA)
      v9 = 87;
    else
      v9 = 48;
    *(_BYTE *)(v8 - 1) = v9 + (v2 & 0xF);
    if (v2 >= 0xA0u)
      v10 = 87;
    else
      v10 = 48;
    *(_BYTE *)(v8 - 2) = v10 + (v2 >> 4);
  }
}

{
  int v2;
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  _BYTE *v8;
  unsigned int v9;
  char v10;
  char v11;

  v2 = (int)this;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 4uLL, 48);
  if (v2)
  {
    v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    v5 = v4 < 0;
    v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0)
      v6 = a2;
    size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5)
      size = a2->__r_.__value_.__l.__size_;
    v8 = (char *)v6 + size - 1;
    do
    {
      v9 = (unsigned __int16)v2;
      if ((v2 & 0xFu) >= 0xA)
        v10 = 87;
      else
        v10 = 48;
      *v8 = v10 + (v2 & 0xF);
      if (v2 >= 0xA0u)
        v11 = 87;
      else
        v11 = 48;
      *(v8 - 1) = v11 + (v2 >> 4);
      LOWORD(v2) = BYTE1(v2);
      v8 -= 2;
    }
    while (v9 >= 0x100);
  }
}

{
  unsigned int v2;
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  _BYTE *v8;
  char v9;
  char v10;
  BOOL v11;

  v2 = this;
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 8uLL, 48);
  if (v2)
  {
    v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    v5 = v4 < 0;
    v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0)
      v6 = a2;
    size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5)
      size = a2->__r_.__value_.__l.__size_;
    v8 = (char *)v6 + size - 1;
    do
    {
      if ((v2 & 0xF) >= 0xA)
        v9 = 87;
      else
        v9 = 48;
      *v8 = v9 + (v2 & 0xF);
      if (v2 >= 0xA0u)
        v10 = 87;
      else
        v10 = 48;
      *(v8 - 1) = v10 + (v2 >> 4);
      v8 -= 2;
      v11 = v2 >= 0x100;
      v2 >>= 8;
    }
    while (v11);
  }
}

void sub_20E61A818(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E61A8D4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E61A990(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void ctu::hex0(unint64_t this@<X0>, std::string *a2@<X8>)
{
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  _BYTE *v8;
  char v9;
  char v10;
  BOOL v11;

  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 0x10uLL, 48);
  if (this)
  {
    v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    v5 = v4 < 0;
    v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0)
      v6 = a2;
    size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5)
      size = a2->__r_.__value_.__l.__size_;
    v8 = (char *)v6 + size - 1;
    do
    {
      if ((this & 0xF) >= 0xA)
        v9 = 87;
      else
        v9 = 48;
      *v8 = v9 + (this & 0xF);
      if (this >= 0xA0u)
        v10 = 87;
      else
        v10 = 48;
      *(v8 - 1) = v10 + (this >> 4);
      v8 -= 2;
      v11 = this >= 0x100;
      this >>= 8;
    }
    while (v11);
  }
}

{
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  _BYTE *v8;
  char v9;
  char v10;
  BOOL v11;

  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 0x10uLL, 48);
  if (this)
  {
    v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    v5 = v4 < 0;
    v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0)
      v6 = a2;
    size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5)
      size = a2->__r_.__value_.__l.__size_;
    v8 = (char *)v6 + size - 1;
    do
    {
      if ((this & 0xF) >= 0xA)
        v9 = 87;
      else
        v9 = 48;
      *v8 = v9 + (this & 0xF);
      if (this >= 0xA0u)
        v10 = 87;
      else
        v10 = 48;
      *(v8 - 1) = v10 + (this >> 4);
      v8 -= 2;
      v11 = this >= 0x100;
      this >>= 8;
    }
    while (v11);
  }
}

{
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  _BYTE *v8;
  char v9;
  char v10;
  BOOL v11;

  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 0x10uLL, 48);
  if (this)
  {
    v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    v5 = v4 < 0;
    v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0)
      v6 = a2;
    size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5)
      size = a2->__r_.__value_.__l.__size_;
    v8 = (char *)v6 + size - 1;
    do
    {
      if ((this & 0xF) >= 0xA)
        v9 = 87;
      else
        v9 = 48;
      *v8 = v9 + (this & 0xF);
      if (this >= 0xA0u)
        v10 = 87;
      else
        v10 = 48;
      *(v8 - 1) = v10 + (this >> 4);
      v8 -= 2;
      v11 = this >= 0x100;
      this >>= 8;
    }
    while (v11);
  }
}

{
  int v4;
  BOOL v5;
  std::string *v6;
  std::string::size_type size;
  _BYTE *v8;
  char v9;
  char v10;
  BOOL v11;

  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::resize(a2, 0x10uLL, 48);
  if (this)
  {
    v4 = SHIBYTE(a2->__r_.__value_.__r.__words[2]);
    v5 = v4 < 0;
    v6 = (std::string *)a2->__r_.__value_.__r.__words[0];
    if (v4 >= 0)
      v6 = a2;
    size = HIBYTE(a2->__r_.__value_.__r.__words[2]);
    if (v5)
      size = a2->__r_.__value_.__l.__size_;
    v8 = (char *)v6 + size - 1;
    do
    {
      if ((this & 0xF) >= 0xA)
        v9 = 87;
      else
        v9 = 48;
      *v8 = v9 + (this & 0xF);
      if (this >= 0xA0u)
        v10 = 87;
      else
        v10 = 48;
      *(v8 - 1) = v10 + (this >> 4);
      v8 -= 2;
      v11 = this >= 0x100;
      this >>= 8;
    }
    while (v11);
  }
}

void sub_20E61AA4C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E61AB08(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E61ABAC(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E61AC50(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E61AD0C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E61ADC8(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E61AE84(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void sub_20E61AF40(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

double ctu::parse_hex@<D0>(ctu *a1@<X0>, int a2@<W1>, _QWORD *a3@<X8>)
{
  const char *v4;
  const char *v5;

  v4 = (const char *)*((_QWORD *)a1 + 1);
  if (*((char *)a1 + 23) >= 0)
  {
    v5 = (const char *)*((unsigned __int8 *)a1 + 23);
  }
  else
  {
    a1 = *(ctu **)a1;
    v5 = v4;
  }
  return ctu::parse_hex(a1, v5, a2, a3);
}

double ctu::parse_hex@<D0>(ctu *a1@<X0>, const char *a2@<X1>, int a3@<W2>, _QWORD *a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double result;
  __int128 v9;
  uint64_t v10;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  if (a3 == 2)
  {
    v5 = 0;
  }
  else
  {
    if (a3 == 1)
    {
      v5 = 0;
      v6 = 1;
      goto LABEL_8;
    }
    if (a3)
      return result;
    v5 = 1;
  }
  v6 = 0;
LABEL_8:
  ctu::parse_hex_impl(a1, a2, v5, v6, (unint64_t *)&v9);
  v7 = v10;
  result = *(double *)&v9;
  *(_OWORD *)a4 = v9;
  a4[2] = v7;
  return result;
}

void ctu::parse_hex_impl(ctu *this@<X0>, const char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, unint64_t *a5@<X8>)
{
  uint64_t v6;
  ctu *v7;
  _BYTE *v9;
  const char *v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  char v17;
  char v18;
  char *v19;
  int v20;
  unsigned int v21;
  unsigned int v22;
  char v23;
  char v24;
  char v25;
  unint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _BYTE *v31;
  unint64_t v32;
  unint64_t v33;
  size_t v34;
  char *v35;
  char *v36;
  _BYTE *v37;
  _BYTE *v38;
  char v39;

  v6 = a3;
  v7 = this;
  v9 = 0;
  *a5 = 0;
  a5[1] = 0;
  a5[2] = 0;
  v10 = &a2[(_QWORD)this];
  v11 = MEMORY[0x24BDAC740];
  if (!(_DWORD)a3)
    goto LABEL_9;
LABEL_2:
  if (v7 == (ctu *)v10)
  {
LABEL_9:
    while (v7 != (ctu *)v10)
    {
LABEL_10:
      v14 = *(unsigned __int8 *)v7;
      v15 = v14 - 48;
      v16 = v14 - 97;
      if ((v14 - 65) >= 6)
        v17 = -1;
      else
        v17 = v14 - 55;
      v18 = v14 - 87;
      if (v16 > 5)
        v18 = v17;
      if (v15 < 0xA)
        v18 = v15;
      if ((char *)v7 + 1 == v10)
        goto LABEL_51;
      v19 = (char *)v7 + 2;
      v20 = *((unsigned __int8 *)v7 + 1);
      v21 = v20 - 48;
      v22 = v20 - 97;
      if ((v20 - 65) >= 6)
        v23 = -1;
      else
        v23 = v20 - 55;
      v24 = v20 - 87;
      if (v22 > 5)
        v24 = v23;
      if (v21 < 0xA)
        v24 = v21;
      if ((_DWORD)a4 && v19 != v10 && (*((_BYTE *)v7 + 2) != 32 || (v19 = (char *)v7 + 3, (char *)v7 + 3 == v10))
        || v18 == -1
        || v24 == -1)
      {
LABEL_51:
        a5[1] = *a5;
        return;
      }
      v25 = v24 | (16 * v18);
      v26 = a5[2];
      if ((unint64_t)v9 >= v26)
      {
        v28 = v6;
        v29 = a4;
        v30 = *a5;
        v31 = &v9[-*a5];
        v32 = (unint64_t)(v31 + 1);
        if ((uint64_t)(v31 + 1) < 0)
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        v33 = v26 - v30;
        if (2 * v33 > v32)
          v32 = 2 * v33;
        if (v33 >= 0x3FFFFFFFFFFFFFFFLL)
          v34 = 0x7FFFFFFFFFFFFFFFLL;
        else
          v34 = v32;
        if (v34)
          v35 = (char *)operator new(v34);
        else
          v35 = 0;
        v36 = &v31[(_QWORD)v35];
        v37 = &v31[(_QWORD)v35];
        *v37 = v25;
        v27 = v37 + 1;
        if (v9 != (_BYTE *)v30)
        {
          v38 = &v9[~v30];
          do
          {
            v39 = *--v9;
            (v38--)[(_QWORD)v35] = v39;
          }
          while (v9 != (_BYTE *)v30);
          v9 = (_BYTE *)*a5;
          v36 = v35;
        }
        *a5 = (unint64_t)v36;
        a5[1] = (unint64_t)v27;
        a5[2] = (unint64_t)&v35[v34];
        a4 = v29;
        if (v9)
          operator delete(v9);
        v6 = v28;
        v11 = MEMORY[0x24BDAC740];
      }
      else
      {
        *v9 = v25;
        v27 = v9 + 1;
      }
      a5[1] = (unint64_t)v27;
      v9 = v27;
      v7 = (ctu *)v19;
      if ((_DWORD)v6)
        goto LABEL_2;
    }
  }
  else
  {
    do
    {
      v12 = *(char *)v7;
      if ((v12 & 0x80000000) != 0)
        v13 = __maskrune(v12, 0x4000uLL);
      else
        v13 = *(_DWORD *)(v11 + 4 * v12 + 60) & 0x4000;
      if (!v13)
        goto LABEL_10;
      v7 = (ctu *)((char *)v7 + 1);
    }
    while (v7 != (ctu *)v10);
  }
}

void sub_20E61B248(_Unwind_Exception *exception_object)
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

unsigned __int16 *ctl::parseField(unsigned __int16 *a1, const unsigned __int8 *a2, _DWORD *a3)
{
  tlv::throwIfNotEnoughBytes((unint64_t)a1, a2, 2uLL);
  *a3 = *a1;
  return a1 + 1;
}

_WORD *ctl::writeField(_WORD *a1, __int16 a2)
{
  *a1 = a2;
  return a1 + 1;
}

uint64_t ctl::getFieldSize()
{
  return 2;
}

_BYTE *ctl::tlv::parseField(_BYTE *a1, const unsigned __int8 *a2, _BYTE *a3)
{
  tlv::throwIfNotEnoughBytes((unint64_t)a1, a2, 1uLL);
  *a3 = *a1;
  tlv::throwIfNotEnoughBytes((unint64_t)(a1 + 1), a2, 1uLL);
  a3[1] = a1[1];
  return a1 + 2;
}

{
  tlv::throwIfNotEnoughBytes((unint64_t)a1, a2, 1uLL);
  *a3 = *a1;
  return a1 + 1;
}

_BYTE *ctl::tlv::writeField(_BYTE *a1, _BYTE *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  return a1 + 2;
}

{
  *a1 = *a2;
  return a1 + 1;
}

uint64_t ctl::tlv::getFieldSize()
{
  return 2;
}

{
  return 2;
}

{
  return 5;
}

{
  return 1;
}

{
  return 1;
}

{
  return 4;
}

uint64_t tlv::parseV<ctl::tlv::AssignedId>(unint64_t *a1, int a2)
{
  unsigned __int8 *v3;
  const unsigned __int8 *v4;
  int v5;
  int v6;

  v3 = (unsigned __int8 *)*a1;
  v4 = (const unsigned __int8 *)(*a1 + a2);
  tlv::throwIfNotEnoughBytes(*a1, v4, 1uLL);
  v5 = *v3;
  tlv::throwIfNotEnoughBytes((unint64_t)(v3 + 1), v4, 1uLL);
  v6 = v3[1];
  *a1 = (unint64_t)(v3 + 2);
  return v5 | (v6 << 8);
}

uint64_t sub_20E61B390(void *a1)
{
  _QWORD *v1;
  unsigned int v2;

  __cxa_begin_catch(a1);
  *v1 = 0;
  __cxa_end_catch();
  return v2;
}

uint64_t tlv::size<ctl::tlv::AssignedId>()
{
  return 5;
}

_BYTE **tlv::writeV<ctl::tlv::AssignedId>(_BYTE **result, _BYTE *a2)
{
  _BYTE *v2;

  v2 = *result;
  *v2 = *a2;
  v2[1] = a2[1];
  *result = v2 + 2;
  return result;
}

unsigned __int16 *ctl::tlv::parseField(unsigned __int16 *a1, const unsigned __int8 *a2, _DWORD *a3)
{
  tlv::throwIfNotEnoughBytes((unint64_t)a1, a2, 2uLL);
  *a3 = *a1;
  return a1 + 1;
}

_WORD *ctl::tlv::writeField(_WORD *a1, _DWORD *a2)
{
  *a1 = *a2;
  return a1 + 1;
}

uint64_t tlv::parseV<ctl::tlv::LinkLayerProtocol>(unint64_t *a1, int a2)
{
  unsigned __int16 *v3;
  uint64_t result;

  v3 = (unsigned __int16 *)*a1;
  tlv::throwIfNotEnoughBytes(*a1, (const unsigned __int8 *)(*a1 + a2), 2uLL);
  result = *v3;
  *a1 = (unint64_t)(v3 + 1);
  return result;
}

uint64_t sub_20E61B45C(void *a1)
{
  _QWORD *v1;

  __cxa_begin_catch(a1);
  *v1 = 0;
  __cxa_end_catch();
  return 0;
}

uint64_t tlv::size<ctl::tlv::LinkLayerProtocol>()
{
  return 5;
}

_WORD **tlv::writeV<ctl::tlv::LinkLayerProtocol>(_WORD **result, _DWORD *a2)
{
  _WORD *v2;

  v2 = *result;
  *v2 = *a2;
  *result = v2 + 1;
  return result;
}

unint64_t ctl::tlv::parseField(unint64_t a1, const unsigned __int8 *a2, uint64_t a3)
{
  unint64_t result;

  tlv::throwIfNotEnoughBytes(a1, a2, 4uLL);
  *(_DWORD *)a3 = *(_DWORD *)a1;
  tlv::throwIfNotEnoughBytes(a1 + 4, a2, 1uLL);
  result = a1 + 5;
  *(_BYTE *)(a3 + 4) = *(_BYTE *)(a1 + 4);
  return result;
}

uint64_t ctl::tlv::writeField(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_BYTE *)(a1 + 4) = *(_BYTE *)(a2 + 4);
  return a1 + 5;
}

unint64_t tlv::parseV<ctl::tlv::PowerSaveDescriptor>(unint64_t *a1, int a2)
{
  unint64_t v3;
  const unsigned __int8 *v4;
  unsigned int v5;
  uint64_t v6;

  v3 = *a1;
  v4 = (const unsigned __int8 *)(*a1 + a2);
  tlv::throwIfNotEnoughBytes(*a1, v4, 4uLL);
  v5 = *(_DWORD *)v3;
  tlv::throwIfNotEnoughBytes(v3 + 4, v4, 1uLL);
  v6 = *(unsigned __int8 *)(v3 + 4);
  *a1 = v3 + 5;
  return (v6 << 32) | 0xAAAAAA0000000000 | v5;
}

void sub_20E61B58C(void *a1)
{
  _QWORD *v1;

  __cxa_begin_catch(a1);
  *v1 = 0;
  __cxa_end_catch();
  JUMPOUT(0x20E61B570);
}

uint64_t tlv::size<ctl::tlv::PowerSaveDescriptor>()
{
  return 8;
}

uint64_t *tlv::writeV<ctl::tlv::PowerSaveDescriptor>(uint64_t *result, uint64_t a2)
{
  uint64_t v2;

  v2 = *result;
  *(_DWORD *)v2 = *(_DWORD *)a2;
  *(_BYTE *)(v2 + 4) = *(_BYTE *)(a2 + 4);
  *result = v2 + 5;
  return result;
}

const unsigned __int8 *ctl::tlv::parseField(_BYTE *a1, const unsigned __int8 *a2, char **a3)
{
  unint64_t v6;
  char *v7;
  unint64_t v8;

  tlv::throwIfNotAligned((unint64_t)a1, a2, 2uLL);
  v6 = (unint64_t)(a2 - a1) >> 1;
  v7 = *a3;
  v8 = (a3[1] - *a3) >> 1;
  if (v6 <= v8)
  {
    if (v6 < v8)
      a3[1] = &v7[2 * v6];
  }
  else
  {
    std::vector<unsigned short>::__append((uint64_t)a3, v6 - v8);
    v7 = *a3;
  }
  memcpy(v7, a1, a2 - a1);
  return a2;
}

char *ctl::tlv::writeField(char *a1, uint64_t a2)
{
  const void *v3;
  size_t v5;

  v3 = *(const void **)a2;
  v5 = *(_QWORD *)(a2 + 8) - (_QWORD)v3;
  memcpy(a1, v3, v5);
  return &a1[v5];
}

uint64_t ctl::tlv::getFieldSize(_QWORD *a1)
{
  return a1[1] - *a1;
}

{
  return a1[1] - *a1 + 1;
}

void *tlv::parseV<ctl::tlv::IndicationSet>@<X0>(unint64_t *a1@<X0>, signed int a2@<W1>, void **a3@<X8>)
{
  const void *v6;
  size_t v7;
  const unsigned __int8 *v8;
  void *v9;
  void *result;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v6 = (const void *)*a1;
  v7 = a2;
  v8 = (const unsigned __int8 *)(*a1 + a2);
  tlv::throwIfNotAligned(*a1, v8, 2uLL);
  if (a2 >= 2)
  {
    std::vector<unsigned short>::__append((uint64_t)a3, v7 >> 1);
    v9 = *a3;
  }
  else
  {
    v9 = 0;
  }
  result = memcpy(v9, v6, v7);
  *a1 = (unint64_t)v8;
  return result;
}

void sub_20E61B704(void *a1)
{
  _QWORD *v1;

  __cxa_begin_catch(a1);
  *v1 = 0;
  __cxa_end_catch();
  JUMPOUT(0x20E61B6F0);
}

void sub_20E61B714(_Unwind_Exception *exception_object)
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

uint64_t tlv::size<ctl::tlv::IndicationSet>(_QWORD *a1)
{
  return a1[1] - *a1 + 3;
}

void *tlv::writeV<ctl::tlv::IndicationSet>(void **a1, uint64_t a2)
{
  char *v3;
  const void *v4;
  size_t v6;
  void *result;

  v3 = (char *)*a1;
  v4 = *(const void **)a2;
  v6 = *(_QWORD *)(a2 + 8) - (_QWORD)v4;
  result = memcpy(*a1, v4, v6);
  *a1 = &v3[v6];
  return result;
}

char *ctl::tlv::parseField(unsigned __int8 *a1, const unsigned __int8 *a2, char **a3)
{
  char *v6;
  unint64_t v7;
  unsigned int v8;
  unint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;

  tlv::throwIfNotEnoughBytes((unint64_t)a1, a2, 1uLL);
  v8 = *a1;
  v6 = (char *)(a1 + 1);
  v7 = v8;
  v9 = 2 * v8;
  tlv::throwIfNotEnoughBytes((unint64_t)v6, a2, v9);
  v10 = *a3;
  v11 = (a3[1] - *a3) >> 1;
  v12 = v8 - v11;
  if (v8 <= v11)
  {
    if (v7 < v11)
      a3[1] = &v10[2 * v7];
  }
  else
  {
    std::vector<unsigned short>::__append((uint64_t)a3, v12);
    v10 = *a3;
  }
  memcpy(v10, v6, v9);
  return &v6[v9];
}

_BYTE *ctl::tlv::writeField(_BYTE *a1, _DWORD *a2)
{
  _BYTE *v2;
  const void *v3;
  size_t v5;

  *a1 = (a2[2] - *a2) >> 1;
  v2 = a1 + 1;
  v3 = *(const void **)a2;
  v5 = *((_QWORD *)a2 + 1) - (_QWORD)v3;
  memcpy(a1 + 1, v3, v5);
  return &v2[v5];
}

{
  *a1 = *a2;
  return a1 + 1;
}

void *tlv::parseV<ctl::tlv::IndicationSetExt>@<X0>(unint64_t *a1@<X0>, int a2@<W1>, void **a3@<X8>)
{
  unsigned __int8 *v5;
  const unsigned __int8 *v6;
  const void *v7;
  unint64_t v8;
  unsigned int v9;
  unint64_t v10;
  void *v11;
  void *result;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  v5 = (unsigned __int8 *)*a1;
  v6 = (const unsigned __int8 *)(*a1 + a2);
  tlv::throwIfNotEnoughBytes(*a1, v6, 1uLL);
  v9 = *v5;
  v7 = v5 + 1;
  v8 = v9;
  v10 = 2 * v9;
  tlv::throwIfNotEnoughBytes((unint64_t)v7, v6, v10);
  if (v9)
  {
    std::vector<unsigned short>::__append((uint64_t)a3, v8);
    v11 = *a3;
  }
  else
  {
    v11 = 0;
  }
  result = memcpy(v11, v7, v10);
  *a1 = (unint64_t)v7 + v10;
  return result;
}

void sub_20E61B908(void *a1)
{
  _QWORD *v1;

  __cxa_begin_catch(a1);
  *v1 = 0;
  __cxa_end_catch();
  JUMPOUT(0x20E61B8F4);
}

void sub_20E61B918(_Unwind_Exception *exception_object)
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

uint64_t tlv::size<ctl::tlv::IndicationSetExt>(_QWORD *a1)
{
  return a1[1] - *a1 + 4;
}

void *tlv::writeV<ctl::tlv::IndicationSetExt>(_BYTE **a1, _DWORD *a2)
{
  _BYTE *v3;
  const void *v4;
  size_t v6;
  void *result;

  v3 = *a1;
  *v3++ = (a2[2] - *a2) >> 1;
  v4 = *(const void **)a2;
  v6 = *((_QWORD *)a2 + 1) - (_QWORD)v4;
  result = memcpy(v3, v4, v6);
  *a1 = &v3[v6];
  return result;
}

uint64_t tlv::parseV<ctl::tlv::ServiceType>(unint64_t *a1, int a2)
{
  unsigned __int8 *v3;
  uint64_t result;

  v3 = (unsigned __int8 *)*a1;
  tlv::throwIfNotEnoughBytes(*a1, (const unsigned __int8 *)(*a1 + a2), 1uLL);
  result = *v3;
  *a1 = (unint64_t)(v3 + 1);
  return result;
}

uint64_t sub_20E61BA1C(void *a1)
{
  _QWORD *v1;

  __cxa_begin_catch(a1);
  *v1 = 0;
  __cxa_end_catch();
  return 0;
}

uint64_t tlv::size<ctl::tlv::ServiceType>()
{
  return 4;
}

_BYTE **tlv::writeV<ctl::tlv::ServiceType>(_BYTE **result, _BYTE *a2)
{
  _BYTE *v2;

  v2 = *result;
  *v2 = *a2;
  *result = v2 + 1;
  return result;
}

unsigned __int8 *ctl::tlv::parseField(unsigned __int8 *a1, const unsigned __int8 *a2, _DWORD *a3)
{
  tlv::throwIfNotEnoughBytes((unint64_t)a1, a2, 1uLL);
  *a3 = *a1;
  return a1 + 1;
}

uint64_t tlv::parseV<ctl::tlv::DataFormat>(unint64_t *a1, int a2)
{
  unsigned __int8 *v3;
  uint64_t result;

  v3 = (unsigned __int8 *)*a1;
  tlv::throwIfNotEnoughBytes(*a1, (const unsigned __int8 *)(*a1 + a2), 1uLL);
  result = *v3;
  *a1 = (unint64_t)(v3 + 1);
  return result;
}

uint64_t sub_20E61BAD4(void *a1)
{
  _QWORD *v1;

  __cxa_begin_catch(a1);
  *v1 = 0;
  __cxa_end_catch();
  return 0;
}

uint64_t tlv::size<ctl::tlv::DataFormat>()
{
  return 4;
}

_BYTE **tlv::writeV<ctl::tlv::DataFormat>(_BYTE **result, _DWORD *a2)
{
  _BYTE *v2;

  v2 = *result;
  *v2 = *a2;
  *result = v2 + 1;
  return result;
}

_DWORD *ctl::tlv::parseField(_DWORD *a1, const unsigned __int8 *a2, _DWORD *a3)
{
  tlv::throwIfNotEnoughBytes((unint64_t)a1, a2, 4uLL);
  *a3 = *a1;
  return a1 + 1;
}

_DWORD *ctl::tlv::writeField(_DWORD *a1, _DWORD *a2)
{
  *a1 = *a2;
  return a1 + 1;
}

uint64_t tlv::parseV<ctl::tlv::PowerSaveState>(unint64_t *a1, int a2)
{
  unsigned int *v3;
  uint64_t result;

  v3 = (unsigned int *)*a1;
  tlv::throwIfNotEnoughBytes(*a1, (const unsigned __int8 *)(*a1 + a2), 4uLL);
  result = *v3;
  *a1 = (unint64_t)(v3 + 1);
  return result;
}

uint64_t sub_20E61BB8C(void *a1)
{
  _QWORD *v1;

  __cxa_begin_catch(a1);
  *v1 = 0;
  __cxa_end_catch();
  return 0;
}

uint64_t tlv::size<ctl::tlv::PowerSaveState>()
{
  return 7;
}

_DWORD **tlv::writeV<ctl::tlv::PowerSaveState>(_DWORD **result, _DWORD *a2)
{
  _DWORD *v2;

  v2 = *result;
  *v2 = *a2;
  *result = v2 + 1;
  return result;
}

void std::vector<unsigned short>::__append(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  char *v14;
  size_t v15;
  char *v16;
  char *v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _OWORD *v21;
  char *v22;
  unint64_t v23;
  __int128 v24;
  __int16 v25;

  v5 = *(char **)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v6 = v5;
  if (a2 <= (v4 - (uint64_t)v5) >> 1)
  {
    if (a2)
    {
      bzero(v5, 2 * a2);
      v6 = &v5[2 * a2];
    }
    *(_QWORD *)(a1 + 8) = v6;
  }
  else
  {
    v7 = *(char **)a1;
    v8 = (uint64_t)&v5[-*(_QWORD *)a1];
    v9 = v8 >> 1;
    v10 = (v8 >> 1) + a2;
    if (v10 < 0)
      std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
    v11 = v4 - (_QWORD)v7;
    if (v11 > v10)
      v10 = v11;
    if (v11 >= 0x7FFFFFFFFFFFFFFELL)
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      if (v12 < 0)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v13 = operator new(2 * v12);
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[2 * v9];
    v15 = 2 * a2;
    v16 = &v13[2 * v12];
    bzero(v14, v15);
    v17 = &v14[v15];
    if (v5 != v7)
    {
      v18 = v5 - v7 - 2;
      if (v18 < 0x1E)
        goto LABEL_29;
      if ((unint64_t)(v5 - v13 - v8) < 0x20)
        goto LABEL_29;
      v19 = (v18 >> 1) + 1;
      v20 = 2 * (v19 & 0xFFFFFFFFFFFFFFF0);
      v6 = &v5[-v20];
      v14 -= v20;
      v21 = &v13[2 * v9 - 16];
      v22 = v5 - 16;
      v23 = v19 & 0xFFFFFFFFFFFFFFF0;
      do
      {
        v24 = *(_OWORD *)v22;
        *(v21 - 1) = *((_OWORD *)v22 - 1);
        *v21 = v24;
        v21 -= 2;
        v22 -= 32;
        v23 -= 16;
      }
      while (v23);
      if (v19 != (v19 & 0xFFFFFFFFFFFFFFF0))
      {
LABEL_29:
        do
        {
          v25 = *((_WORD *)v6 - 1);
          v6 -= 2;
          *((_WORD *)v14 - 1) = v25;
          v14 -= 2;
        }
        while (v6 != v7);
      }
    }
    *(_QWORD *)a1 = v14;
    *(_QWORD *)(a1 + 8) = v17;
    *(_QWORD *)(a1 + 16) = v16;
    if (v7)
      operator delete(v7);
  }
}

std::logic_error *tlv::TlvParseException::TlvParseException(std::logic_error *this, unint64_t a2, unint64_t a3)
{
  std::string *v6;
  std::string::size_type size;
  std::string *v8;
  std::string::size_type v9;
  std::string __p;
  std::string v12;

  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)operator new(0x20uLL);
  *(_OWORD *)&__p.__r_.__value_.__r.__words[1] = xmmword_20E61EFF0;
  strcpy(__p.__r_.__value_.__l.__data_, "TLV parsing failed; expected ");
  std::to_string(&v12, a2);
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v6 = &v12;
  else
    v6 = (std::string *)v12.__r_.__value_.__r.__words[0];
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v12.__r_.__value_.__r.__words[2]);
  else
    size = v12.__r_.__value_.__l.__size_;
  std::string::append(&__p, (const std::string::value_type *)v6, size);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  std::string::append(&__p, " bytes; got ", 0xCuLL);
  std::to_string(&v12, a3);
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v8 = &v12;
  else
    v8 = (std::string *)v12.__r_.__value_.__r.__words[0];
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v9 = HIBYTE(v12.__r_.__value_.__r.__words[2]);
  else
    v9 = v12.__r_.__value_.__l.__size_;
  std::string::append(&__p, (const std::string::value_type *)v8, v9);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  std::string::append(&__p, " bytes.", 7uLL);
  std::logic_error::logic_error(this, &__p);
  this->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8C0] + 16);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  this->__vftable = (std::logic_error_vtbl *)&off_24C975D68;
  return this;
}

void sub_20E61BEA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if ((a14 & 0x80000000) == 0)
    _Unwind_Resume(exception_object);
  operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::logic_error *tlv::TlvParseException::TlvParseException(std::logic_error *this)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(this, "TLV parsing failed; endpoint preceded beginning of buffer.");
  result->__vftable = (std::logic_error_vtbl *)&off_24C975D68;
  return result;
}

{
  std::logic_error *result;

  result = std::logic_error::logic_error(this, "TLV parsing failed; endpoint preceded beginning of buffer.");
  result->__vftable = (std::logic_error_vtbl *)&off_24C975D68;
  return result;
}

unint64_t tlv::throwIfNotAligned(unint64_t this, const unsigned __int8 *a2, unint64_t a3)
{
  const unsigned __int8 *v3;
  std::logic_error *exception;
  unint64_t v5;

  if (this > (unint64_t)a2)
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvParseException::TlvParseException(exception);
    goto LABEL_6;
  }
  v3 = &a2[-this];
  if ((unint64_t)&a2[-this] % a3)
  {
    v5 = (unint64_t)&v3[a3 - 1] / a3 * a3;
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    tlv::TlvParseException::TlvParseException((tlv::TlvParseException *)exception, v5, (unint64_t)v3);
LABEL_6:
  }
  return this;
}

void sub_20E61C004(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void sub_20E61C018(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void tlv::TlvParseException::~TlvParseException(tlv::TlvParseException *this)
{
  void *v1;

  v1 = (void *)MEMORY[0x212BC14C4](this);
  operator delete(v1);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::string *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAB0](this, a2);
}

void std::out_of_range::~out_of_range(std::out_of_range *this)
{
  MEMORY[0x24BEDAB08](this);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB48](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x24BEDAB50](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x24BEDAB68](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC20](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x24BEDAC50](this, __n, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x24BEDACB8](this, __requested_capacity);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF18]();
}

{
  return MEMORY[0x24BEDAF28]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF58]();
}

{
  return MEMORY[0x24BEDAF60]();
}

{
  return MEMORY[0x24BEDAF68]();
}

{
  return MEMORY[0x24BEDAF70]();
}

{
  return MEMORY[0x24BEDAF78]();
}

{
  return MEMORY[0x24BEDAF80]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB180](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x24BEDB190](this);
}

double std::stod(const std::string *__str, size_t *__idx)
{
  double result;

  MEMORY[0x24BEDB320](__str, __idx);
  return result;
}

uint64_t std::stoll(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x24BEDB388](__str, __idx, *(_QWORD *)&__base);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

unint64_t std::stoull(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x24BEDB458](__str, __idx, *(_QWORD *)&__base);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, double __val)
{
  return (std::string *)MEMORY[0x24BEDB5F8](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return (std::string *)MEMORY[0x24BEDB600](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x24BEDB620](retstr, __val);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24C974F30(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C974F38(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
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

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x24BDB0910](xdict);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x24BDB0948](xdict);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x24BDB09F0](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x24BDB0A88](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x24BDB0BA0](xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

