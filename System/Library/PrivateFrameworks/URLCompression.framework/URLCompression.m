void UC::appClipCodeVersion0Bytes(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *__p;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v3 = a2;
  v6 = vcvtpd_u64_f64((double)(unint64_t)(a2 + 1) * 0.125);
  v13 = 0;
  if (v6 <= 0x10)
    v6 = 16;
  v10 = 0;
  v11 = 0;
  __p = 0;
  v12 = 0;
  v7 = 8 * v6 - (a2 + 1);
  if (v7)
  {
    if (v7 <= 1)
      v8 = 1;
    else
      v8 = 8 * v6 - (a2 + 1);
    do
    {
      UC::UCBitVector::append((UC::UCBitVector *)&__p, 0);
      --v8;
    }
    while (v8);
  }
  UC::UCBitVector::append((UC::UCBitVector *)&__p, 1);
  for (; v3; --v3)
    UC::UCBitVector::append((UC::UCBitVector *)&__p, *a1++ != 48);
  UC::UCBitVector::getBytesCopy((UC::UCBitVector *)&__p, a3);
  if (__p)
  {
    v10 = __p;
    operator delete(__p);
  }
}

void sub_220DD5C10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void UC::appClipCodeVersion1Bytes(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v4;
  void *__p;
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = 0;
  v7 = 0;
  v8 = 0;
  __p = 0;
  v9 = 0;
  if (a2)
  {
    v4 = a2;
    do
    {
      UC::UCBitVector::append((UC::UCBitVector *)&__p, *a1++ != 48);
      --v4;
    }
    while (v4);
  }
  UC::UCBitVector::getBytesCopy((UC::UCBitVector *)&__p, a3);
  if (__p)
  {
    v7 = __p;
    operator delete(__p);
  }
}

void sub_220DD5CB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void UC::bitVectorFromAppClipCodeEncodingData(UC *this@<X0>, const unsigned __int8 *a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  UC::UCBitVector *v7;
  const unsigned __int8 *v8;
  unsigned int v9;
  uint64_t v10;

  v6 = operator new(0x28uLL);
  v6[4] = 0;
  v6[1] = 0;
  v6[2] = 0;
  *v6 = 0;
  *((_BYTE *)v6 + 24) = 0;
  *a3 = v6;
  if (a2)
  {
    v7 = (UC::UCBitVector *)v6;
    v8 = 0;
    do
    {
      v9 = v8[(_QWORD)this];
      v10 = 8;
      do
        UC::UCBitVector::append(v7, (v9 >> --v10) & 1);
      while (v10);
      ++v8;
    }
    while (v8 != a2);
  }
}

void sub_220DD5D6C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;

  *v1 = 0;
  std::default_delete<UC::UCBitVector>::operator()[abi:ne180100]((int)v1, v2);
  _Unwind_Resume(a1);
}

BOOL UC::readUntilBeginMarkerFound(UC *this, UC::UCBitStream *a2)
{
  _BOOL8 hasMore;

  do
    hasMore = UC::UCBitStream::hasMore(this);
  while (hasMore && UC::UCBitStream::readNextBit(this) != 1);
  return hasMore;
}

void std::default_delete<UC::UCBitVector>::operator()[abi:ne180100](int a1, void **__p)
{
  void *v3;

  if (__p)
  {
    v3 = *__p;
    if (*__p)
    {
      __p[1] = v3;
      operator delete(v3);
    }
    operator delete(__p);
  }
}

std::string *UC::UCURLComponents::UCURLComponents(std::string *this, __int128 *a2, __int128 *a3, __int128 *a4, __int128 *a5, __int128 *a6, __int128 *a7, std::string::size_type a8, __int128 *a9, __int128 *a10)
{
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  std::string *v24;
  __int128 v25;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v17 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v17;
  }
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this + 1, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v18 = *a3;
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = v18;
  }
  if (*((char *)a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this + 2, *(const std::string::value_type **)a4, *((_QWORD *)a4 + 1));
  }
  else
  {
    v19 = *a4;
    this[2].__r_.__value_.__r.__words[2] = *((_QWORD *)a4 + 2);
    *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = v19;
  }
  if (*((char *)a5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this + 3, *(const std::string::value_type **)a5, *((_QWORD *)a5 + 1));
  }
  else
  {
    v20 = *a5;
    this[3].__r_.__value_.__r.__words[2] = *((_QWORD *)a5 + 2);
    *(_OWORD *)&this[3].__r_.__value_.__l.__data_ = v20;
  }
  if (*((char *)a6 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this + 4, *(const std::string::value_type **)a6, *((_QWORD *)a6 + 1));
  }
  else
  {
    v21 = *a6;
    this[4].__r_.__value_.__r.__words[2] = *((_QWORD *)a6 + 2);
    *(_OWORD *)&this[4].__r_.__value_.__l.__data_ = v21;
  }
  if (*((char *)a7 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this + 5, *(const std::string::value_type **)a7, *((_QWORD *)a7 + 1));
  }
  else
  {
    v22 = *a7;
    this[5].__r_.__value_.__r.__words[2] = *((_QWORD *)a7 + 2);
    *(_OWORD *)&this[5].__r_.__value_.__l.__data_ = v22;
  }
  this[6].__r_.__value_.__r.__words[0] = a8;
  if (*((char *)a9 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 152), *(const std::string::value_type **)a9, *((_QWORD *)a9 + 1));
  }
  else
  {
    v23 = *a9;
    this[7].__r_.__value_.__r.__words[0] = *((_QWORD *)a9 + 2);
    *(_OWORD *)&this[6].__r_.__value_.__r.__words[1] = v23;
  }
  v24 = (std::string *)((char *)this + 176);
  if (*((char *)a10 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v24, *(const std::string::value_type **)a10, *((_QWORD *)a10 + 1));
  }
  else
  {
    v25 = *a10;
    this[8].__r_.__value_.__r.__words[0] = *((_QWORD *)a10 + 2);
    *(_OWORD *)&v24->__r_.__value_.__l.__data_ = v25;
  }
  return this;
}

{
  return UC::UCURLComponents::UCURLComponents(this, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

void sub_220DD6300(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void **v4;
  void **v5;
  void **v6;
  void **v7;

  if (*(char *)(v1 + 175) < 0)
    operator delete(*v6);
  if (*(char *)(v1 + 143) < 0)
    operator delete(*v7);
  if (*(char *)(v1 + 119) < 0)
    operator delete(*v5);
  if (*(char *)(v1 + 95) < 0)
    operator delete(*v4);
  if (*(char *)(v1 + 71) < 0)
    operator delete(*v3);
  if (*(char *)(v1 + 47) < 0)
    operator delete(*v2);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
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
}

void sub_220DD6494(_Unwind_Exception *a1)
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

void UC::UCBitVector::append(UC::UCBitVector *this, int a2)
{
  uint64_t v2;
  char v3;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  _BYTE *v13;
  char *v14;
  _BYTE *v15;
  char v16;

  v2 = *((_QWORD *)this + 4);
  v3 = *((_BYTE *)this + 24) | (a2 << (~(_BYTE)v2 & 7));
  *((_BYTE *)this + 24) = v3;
  *((_QWORD *)this + 4) = ++v2;
  if ((v2 & 7) == 0)
  {
    v6 = (_BYTE *)*((_QWORD *)this + 1);
    v5 = *((_QWORD *)this + 2);
    if ((unint64_t)v6 >= v5)
    {
      v8 = *(_QWORD *)this;
      v9 = &v6[-*(_QWORD *)this];
      v10 = (unint64_t)(v9 + 1);
      if ((uint64_t)(v9 + 1) < 0)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      v11 = v5 - v8;
      if (2 * v11 > v10)
        v10 = 2 * v11;
      if (v11 >= 0x3FFFFFFFFFFFFFFFLL)
        v12 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v12 = v10;
      if (v12)
        v13 = operator new(v12);
      else
        v13 = 0;
      v14 = &v13[v12];
      v9[(_QWORD)v13] = v3;
      v7 = (uint64_t)&v9[(_QWORD)v13 + 1];
      if (v6 == (_BYTE *)v8)
      {
        v13 = &v9[(_QWORD)v13];
      }
      else
      {
        v15 = &v6[~v8];
        do
        {
          v16 = *--v6;
          (v15--)[(_QWORD)v13] = v16;
        }
        while (v6 != (_BYTE *)v8);
        v6 = *(_BYTE **)this;
      }
      *(_QWORD *)this = v13;
      *((_QWORD *)this + 1) = v7;
      *((_QWORD *)this + 2) = v14;
      if (v6)
        operator delete(v6);
    }
    else
    {
      *v6 = v3;
      v7 = (uint64_t)(v6 + 1);
    }
    *((_QWORD *)this + 1) = v7;
    *((_BYTE *)this + 24) = 0;
  }
}

void UC::UCBitVector::getBytesCopy(UC::UCBitVector *this@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  unint64_t v11;
  size_t v12;
  unint64_t v13;
  char *v14;
  _BYTE *v15;
  char v16;

  v4 = *((_QWORD *)this + 4) & 7;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a2, *(const void **)this, *((_QWORD *)this + 1), *((_QWORD *)this + 1) - *(_QWORD *)this);
  if (v4)
  {
    v6 = (_BYTE *)a2[1];
    v5 = a2[2];
    if ((unint64_t)v6 >= v5)
    {
      v8 = *a2;
      v9 = &v6[-*a2];
      v10 = (unint64_t)(v9 + 1);
      if ((uint64_t)(v9 + 1) < 0)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      v11 = v5 - v8;
      if (2 * v11 > v10)
        v10 = 2 * v11;
      if (v11 >= 0x3FFFFFFFFFFFFFFFLL)
        v12 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v12 = v10;
      if (v12)
        v13 = (unint64_t)operator new(v12);
      else
        v13 = 0;
      v14 = (char *)(v13 + v12);
      v9[v13] = *((_BYTE *)this + 24);
      v7 = (uint64_t)&v9[v13 + 1];
      if (v6 == (_BYTE *)v8)
      {
        v13 += (unint64_t)v9;
      }
      else
      {
        v15 = &v6[~v8];
        do
        {
          v16 = *--v6;
          (v15--)[v13] = v16;
        }
        while (v6 != (_BYTE *)v8);
        v6 = (_BYTE *)*a2;
      }
      *a2 = v13;
      a2[1] = v7;
      a2[2] = (unint64_t)v14;
      if (v6)
        operator delete(v6);
    }
    else
    {
      *v6 = *((_BYTE *)this + 24);
      v7 = (uint64_t)(v6 + 1);
    }
    a2[1] = v7;
  }
}

void sub_220DD6700(_Unwind_Exception *exception_object)
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

UC::UCBitStream *UC::UCBitStream::UCBitStream(UC::UCBitStream *this, const UC::UCBitVector *a2)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(this, *(const void **)a2, *((_QWORD *)a2 + 1), *((_QWORD *)a2 + 1) - *(_QWORD *)a2);
  *(_OWORD *)((char *)this + 24) = *(_OWORD *)((char *)a2 + 24);
  *((_QWORD *)this + 5) = 0;
  return this;
}

BOOL UC::UCBitStream::hasMore(UC::UCBitStream *this)
{
  return *((_QWORD *)this + 5) < *((_QWORD *)this + 4);
}

uint64_t UC::UCBitStream::readNextBit(UC::UCBitStream *this)
{
  unint64_t v1;
  unsigned __int8 *v2;
  uint64_t v3;
  std::logic_error *exception;

  v1 = *((_QWORD *)this + 5);
  if (v1 >= *((_QWORD *)this + 4))
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::out_of_range::out_of_range[abi:ne180100](exception, "Out of bounds access when reading next bit from bit stream");
  }
  if (v1 >= 8 * (*((_QWORD *)this + 1) - *(_QWORD *)this))
    v2 = (unsigned __int8 *)this + 24;
  else
    v2 = (unsigned __int8 *)(*(_QWORD *)this + (v1 >> 3));
  v3 = (*v2 >> (~(_BYTE)v1 & 7)) & 1;
  *((_QWORD *)this + 5) = v1 + 1;
  return v3;
}

void sub_220DD6800(_Unwind_Exception *a1)
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

void sub_220DD6894(_Unwind_Exception *exception_object)
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

_QWORD *UC::SUE::SegmentedURLEncoderImpl::SegmentedURLEncoderImpl(_QWORD *result, _QWORD *a2)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = a2[1];
  *result = *a2;
  result[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  result[2] = 0;
  return result;
}

void UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols(std::string::value_type *a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  std::string::value_type v6;
  unint64_t v7;
  __int128 v8;
  uint64_t v9;
  std::string v10;

  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (a2)
  {
    v3 = a2;
    do
    {
      v6 = *a1;
      memset(&v10, 0, sizeof(v10));
      std::string::push_back(&v10, v6);
      v7 = a3[1];
      if (v7 >= a3[2])
      {
        v9 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a3, (__int128 *)&v10);
      }
      else
      {
        if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)a3[1], v10.__r_.__value_.__l.__data_, v10.__r_.__value_.__l.__size_);
        }
        else
        {
          v8 = *(_OWORD *)&v10.__r_.__value_.__l.__data_;
          *(_QWORD *)(v7 + 16) = *((_QWORD *)&v10.__r_.__value_.__l + 2);
          *(_OWORD *)v7 = v8;
        }
        v9 = v7 + 24;
        a3[1] = v7 + 24;
      }
      a3[1] = v9;
      if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v10.__r_.__value_.__l.__data_);
      ++a1;
      --v3;
    }
    while (v3);
  }
}

void sub_220DD69EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _QWORD *v15;
  uint64_t v16;

  v15[1] = v16;
  if (a15 < 0)
    operator delete(__p);
  __p = v15;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

void UC::SUE::SegmentedURLEncoderImpl::_encodeHost(std::string *this@<X1>, UC::SUE::UCSegmentedURLCoderProvider **a2@<X0>, int a3@<W2>, int *a4@<X8>)
{
  std::string *v5;
  std::string::size_type v8;
  std::string::size_type v9;
  std::string::value_type *v10;
  std::string::size_type size;
  unsigned int v12;
  uint64_t v13;
  std::string *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  std::string *v19;
  std::string::size_type v20;
  std::__shared_weak_count *v21;
  unint64_t *p_size;
  unint64_t v23;
  unsigned int v24;
  unsigned int v25;
  std::string::size_type v26;
  int v27;
  int v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  const std::string::value_type *v32;
  std::string::size_type v33;
  std::string *v34;
  void *v35;
  char v36;
  std::__shared_weak_count *v37;
  unint64_t *p_shared_owners;
  unint64_t v39;
  int v40;
  int v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  const std::string::value_type *v45;
  std::string::size_type v46;
  std::string *v47;
  void *v48;
  char v49;
  unint64_t *v50;
  int v51;
  void *v52;
  void *v53;
  unint64_t v54;
  unint64_t v55;
  _BOOL4 v56;
  void **v57;
  int v58;
  char v59;
  _BOOL4 v60;
  void **v61;
  std::string *v62;
  char v63;
  std::string::size_type v64;
  std::string *v65;
  std::string *v66;
  std::string *v67;
  void *v68;
  std::string::size_type v69;
  unsigned __int8 v70;
  uint64_t v71[3];
  void *v72;
  __int128 v73;
  void *__p[3];
  void *v75[2];
  void *v76;
  std::string v77;
  _DWORD v78[2];
  std::string v79;
  std::string **v80;
  std::__shared_weak_count *v81;
  _QWORD v82[2];
  std::string v83;
  __int128 v84;

  v5 = this;
  *(_QWORD *)&v84 = *MEMORY[0x24BDAC8D0];
  memset(&v79, 0, sizeof(v79));
  *(_DWORD *)((char *)v78 + 3) = 0;
  v78[0] = 0;
  v8 = std::string::rfind(this, 46, 0xFFFFFFFFFFFFFFFFLL);
  if (v8 == -1)
  {
    v12 = 0;
    v10 = 0;
    std::string::operator=(&v79, v5);
    size = 0;
  }
  else
  {
    v9 = v8;
    std::string::basic_string(&v77, v5, v8, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)v75);
    size = v77.__r_.__value_.__l.__size_;
    v10 = (std::string::value_type *)v77.__r_.__value_.__r.__words[0];
    v78[0] = v77.__r_.__value_.__r.__words[2];
    *(_DWORD *)((char *)v78 + 3) = *(_DWORD *)((char *)&v77.__r_.__value_.__r.__words[2] + 3);
    v12 = HIBYTE(v77.__r_.__value_.__r.__words[2]);
    std::string::basic_string(&v77, v5, 0, v9, (std::allocator<char> *)v75);
    if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v79.__r_.__value_.__l.__data_);
    v79 = v77;
  }
  if (a3)
  {
    std::string::push_back(v5, 124);
    std::string::push_back(&v79, 124);
  }
  if (SHIBYTE(v5->__r_.__value_.__r.__words[2]) < 0)
  {
    v14 = v5;
    v5 = (std::string *)v5->__r_.__value_.__r.__words[0];
    v13 = v14->__r_.__value_.__l.__size_;
  }
  else
  {
    v13 = HIBYTE(v5->__r_.__value_.__r.__words[2]);
  }
  UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols((std::string::value_type *)v5, v13, (uint64_t *)&v77);
  v75[0] = 0;
  v75[1] = 0;
  v76 = 0;
  UC::SUE::UCSegmentedURLCoderProvider::getHostCoder(*a2, &v72);
  (*(void (**)(void **__return_ptr, void *, std::string *))(*(_QWORD *)v72 + 40))(__p, v72, &v77);
  v15 = (std::__shared_weak_count *)v73;
  *(_OWORD *)v75 = *(_OWORD *)__p;
  v76 = __p[2];
  HIBYTE(__p[2]) = 0;
  LOBYTE(__p[0]) = 0;
  if ((_QWORD)v73)
  {
    v16 = (unint64_t *)(v73 + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  memset(__p, 0, sizeof(__p));
  v72 = 0;
  v73 = 0uLL;
  if ((v12 & 0x80u) == 0)
    v18 = v12;
  else
    v18 = size;
  if (!v18)
  {
    v24 = 0;
    v25 = 0;
    v26 = 0;
    goto LABEL_81;
  }
  if ((v79.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v19 = &v79;
  else
    v19 = (std::string *)v79.__r_.__value_.__r.__words[0];
  if ((v79.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v20 = HIBYTE(v79.__r_.__value_.__r.__words[2]);
  else
    v20 = v79.__r_.__value_.__l.__size_;
  UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols((std::string::value_type *)v19, v20, v71);
  UC::SUE::UCSegmentedURLCoderProvider::getHostCoder(*a2, &v65);
  (*(void (**)(void **__return_ptr, std::string *, uint64_t *))(v65->__r_.__value_.__r.__words[0] + 40))(&v68, v65, v71);
  v21 = (std::__shared_weak_count *)v66;
  if (!v66)
    goto LABEL_30;
  p_size = &v66->__r_.__value_.__l.__size_;
  do
    v23 = __ldaxr(p_size);
  while (__stlxr(v23 - 1, p_size));
  if (!v23)
  {
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
    if ((v12 & 0x80) == 0)
      goto LABEL_31;
  }
  else
  {
LABEL_30:
    if ((v12 & 0x80) == 0)
    {
LABEL_31:
      v83.__r_.__value_.__r.__words[0] = (std::string::size_type)v10;
      v83.__r_.__value_.__l.__size_ = size;
      LODWORD(v83.__r_.__value_.__r.__words[2]) = v78[0];
      *(_DWORD *)((char *)&v83.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v78 + 3);
      *((_BYTE *)&v83.__r_.__value_.__s + 23) = v12;
      goto LABEL_35;
    }
  }
  std::string::__init_copy_ctor_external(&v83, v10, size);
LABEL_35:
  v65 = 0;
  v66 = 0;
  v67 = 0;
  v80 = &v65;
  LOBYTE(v81) = 0;
  v65 = (std::string *)operator new(0x18uLL);
  v66 = v65;
  v67 = v65 + 1;
  v66 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v67, (__int128 *)&v83, &v84, v65);
  if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v83.__r_.__value_.__l.__data_);
  UC::SUE::UCSegmentedURLCoderProvider::getTLDCoder((uint64_t)*a2, &v83);
  v27 = (*(uint64_t (**)(std::string::size_type, std::string **))(*(_QWORD *)v83.__r_.__value_.__l.__data_
                                                                          + 16))(v83.__r_.__value_.__r.__words[0], &v65);
  v28 = v27;
  v29 = (std::__shared_weak_count *)v83.__r_.__value_.__l.__size_;
  if (!v83.__r_.__value_.__l.__size_)
    goto LABEL_41;
  v30 = (unint64_t *)(v83.__r_.__value_.__l.__size_ + 8);
  do
    v31 = __ldaxr(v30);
  while (__stlxr(v31 - 1, v30));
  if (!v31)
  {
    ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
    std::__shared_weak_count::__release_weak(v29);
    if (v28)
      goto LABEL_42;
  }
  else
  {
LABEL_41:
    if (v27)
    {
LABEL_42:
      UC::SUE::UCSegmentedURLCoderProvider::getTLDCoder((uint64_t)*a2, &v80);
      ((void (*)(std::string *__return_ptr, std::string **, std::string **))(*v80)[1].__r_.__value_.__r.__words[2])(&v83, v80, &v65);
      if ((v70 & 0x80u) == 0)
        v32 = (const std::string::value_type *)&v68;
      else
        v32 = (const std::string::value_type *)v68;
      if ((v70 & 0x80u) == 0)
        v33 = v70;
      else
        v33 = v69;
      v34 = std::string::append(&v83, v32, v33);
      v35 = (void *)v34->__r_.__value_.__r.__words[0];
      v82[0] = v34->__r_.__value_.__l.__size_;
      *(_QWORD *)((char *)v82 + 7) = *(std::string::size_type *)((char *)&v34->__r_.__value_.__r.__words[1] + 7);
      v36 = HIBYTE(v34->__r_.__value_.__r.__words[2]);
      v34->__r_.__value_.__l.__size_ = 0;
      v34->__r_.__value_.__r.__words[2] = 0;
      v34->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(__p[2]) < 0)
        operator delete(__p[0]);
      __p[0] = v35;
      __p[1] = (void *)v82[0];
      *(void **)((char *)&__p[1] + 7) = *(void **)((char *)v82 + 7);
      HIBYTE(__p[2]) = v36;
      if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v83.__r_.__value_.__l.__data_);
      v37 = v81;
      if (!v81)
        goto LABEL_78;
      p_shared_owners = (unint64_t *)&v81->__shared_owners_;
      do
        v39 = __ldaxr(p_shared_owners);
      while (__stlxr(v39 - 1, p_shared_owners));
      goto LABEL_75;
    }
  }
  UC::SUE::UCSegmentedURLCoderProvider::getTLDFixedLengthCoder(*a2, &v83);
  v40 = (*(uint64_t (**)(std::string::size_type, std::string **))(*(_QWORD *)v83.__r_.__value_.__l.__data_
                                                                          + 16))(v83.__r_.__value_.__r.__words[0], &v65);
  v41 = v40;
  v42 = (std::__shared_weak_count *)v83.__r_.__value_.__l.__size_;
  if (!v83.__r_.__value_.__l.__size_)
    goto LABEL_61;
  v43 = (unint64_t *)(v83.__r_.__value_.__l.__size_ + 8);
  do
    v44 = __ldaxr(v43);
  while (__stlxr(v44 - 1, v43));
  if (!v44)
  {
    ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
    std::__shared_weak_count::__release_weak(v42);
    if (v41)
      goto LABEL_62;
  }
  else
  {
LABEL_61:
    if (v40)
    {
LABEL_62:
      UC::SUE::UCSegmentedURLCoderProvider::getTLDFixedLengthCoder(*a2, &v80);
      ((void (*)(std::string *__return_ptr, std::string **, std::string **))(*v80)[1].__r_.__value_.__r.__words[2])(&v83, v80, &v65);
      if ((v70 & 0x80u) == 0)
        v45 = (const std::string::value_type *)&v68;
      else
        v45 = (const std::string::value_type *)v68;
      if ((v70 & 0x80u) == 0)
        v46 = v70;
      else
        v46 = v69;
      v47 = std::string::append(&v83, v45, v46);
      v48 = (void *)v47->__r_.__value_.__r.__words[0];
      v82[0] = v47->__r_.__value_.__l.__size_;
      *(_QWORD *)((char *)v82 + 7) = *(std::string::size_type *)((char *)&v47->__r_.__value_.__r.__words[1] + 7);
      v49 = HIBYTE(v47->__r_.__value_.__r.__words[2]);
      v47->__r_.__value_.__l.__size_ = 0;
      v47->__r_.__value_.__r.__words[2] = 0;
      v47->__r_.__value_.__r.__words[0] = 0;
      if (SHIBYTE(v73) < 0)
        operator delete(v72);
      v72 = v48;
      *(_QWORD *)&v73 = v82[0];
      *(_QWORD *)((char *)&v73 + 7) = *(_QWORD *)((char *)v82 + 7);
      HIBYTE(v73) = v49;
      if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v83.__r_.__value_.__l.__data_);
      v37 = v81;
      if (!v81)
        goto LABEL_78;
      v50 = (unint64_t *)&v81->__shared_owners_;
      do
        v39 = __ldaxr(v50);
      while (__stlxr(v39 - 1, v50));
LABEL_75:
      if (!v39)
      {
        ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
        std::__shared_weak_count::__release_weak(v37);
      }
    }
  }
LABEL_78:
  v83.__r_.__value_.__r.__words[0] = (std::string::size_type)&v65;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v83);
  if ((char)v70 < 0)
    operator delete(v68);
  v68 = v71;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v68);
  v24 = HIBYTE(__p[2]);
  v18 = (unint64_t)__p[1];
  v25 = HIBYTE(v73);
  v26 = v73;
LABEL_81:
  v51 = SHIBYTE(v76);
  v52 = v75[1];
  if (SHIBYTE(v76) >= 0)
    v53 = (void *)HIBYTE(v76);
  else
    v53 = v75[1];
  v54 = v24;
  if ((v24 & 0x80u) != 0)
    v54 = v18;
  if ((v25 & 0x80u) == 0)
    v55 = v25;
  else
    v55 = v26;
  v56 = v54 != 0 && v54 < (unint64_t)v53;
  v57 = v75;
  if (v54 != 0 && v54 < (unint64_t)v53)
  {
    v57 = __p;
    v53 = (void *)v54;
    v58 = 0;
  }
  else
  {
    v58 = 2;
  }
  if (v56)
    v59 = v24;
  else
    v59 = HIBYTE(v76);
  v60 = v55 != 0 && v55 < (unint64_t)v53;
  v61 = &v72;
  if (v60)
    v58 = 1;
  else
    v61 = v57;
  *a4 = v58;
  v62 = (std::string *)(a4 + 2);
  if (v60)
    v63 = v25;
  else
    v63 = v59;
  if (v63 < 0)
  {
    if (!v56)
      v18 = (unint64_t)v52;
    if (v60)
      v64 = v26;
    else
      v64 = v18;
    std::string::__init_copy_ctor_external(v62, (const std::string::value_type *)*v61, v64);
  }
  else
  {
    *(_OWORD *)&v62->__r_.__value_.__l.__data_ = *(_OWORD *)v61;
    v62->__r_.__value_.__r.__words[2] = (std::string::size_type)v61[2];
  }
  if ((v25 & 0x80) == 0)
  {
    if ((v24 & 0x80) == 0)
      goto LABEL_111;
LABEL_118:
    operator delete(__p[0]);
    if ((v51 & 0x80000000) == 0)
      goto LABEL_112;
    goto LABEL_119;
  }
  operator delete(v72);
  if ((v24 & 0x80) != 0)
    goto LABEL_118;
LABEL_111:
  if ((v51 & 0x80000000) == 0)
    goto LABEL_112;
LABEL_119:
  operator delete(v75[0]);
LABEL_112:
  v75[0] = &v77;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v75);
  if ((v12 & 0x80) != 0)
    operator delete(v10);
  if (SHIBYTE(v79.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v79.__r_.__value_.__l.__data_);
}

void sub_220DD70F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,char *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,uint64_t a40,char a41)
{
  void *v41;
  char v42;
  uint64_t v43;

  if (*(char *)(v43 - 89) < 0)
    operator delete(*(void **)(v43 - 112));
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](v43 - 144);
  *(_QWORD *)(v43 - 112) = &a10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v43 - 112));
  if (a18 < 0)
    operator delete(__p);
  __p = &a19;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  if (a27 < 0)
    operator delete(a22);
  if (a33 < 0)
    operator delete(a28);
  if (a39 < 0)
    operator delete(a34);
  a34 = &a41;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a34);
  if (v42 < 0)
    operator delete(v41);
  if (*(char *)(v43 - 153) < 0)
    operator delete(*(void **)(v43 - 176));
  _Unwind_Resume(a1);
}

void UC::Exception::CoderError::~CoderError(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)off_24E6B2520;
  if (SHIBYTE(this[10].__vftable) < 0)
    operator delete(this[8].__vftable);
  if (SHIBYTE(this[7].__vftable) < 0)
    operator delete(this[5].__vftable);
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
}

{
  void *v2;

  this->__vftable = (std::exception_vtbl *)off_24E6B2520;
  if (SHIBYTE(this[10].__vftable) < 0)
    operator delete(this[8].__vftable);
  if (SHIBYTE(this[7].__vftable) < 0)
    operator delete(this[5].__vftable);
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
  operator delete(v2);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void UC::SUE::SegmentedURLEncoderImpl::clearCaches(UC::SUE::UCSegmentedURLCoderProvider **this)
{
  UC::SUE::UCSegmentedURLCoderProvider::clearCaches(*this);
}

void UC::SUE::SegmentedURLEncoderImpl::encodeURL(UC::SUE::SegmentedURLEncoderImpl *this@<X0>, const UC::UCURLComponents *a2@<X1>, std::string *a3@<X8>)
{
  _QWORD *v6;
  char *v7;
  int v8;
  int v9;
  int v10;
  uint64_t v12;
  uint64_t v13;
  std::string::size_type size;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  std::string::size_type v18;
  char *v19;
  std::string::size_type v20;
  unsigned __int8 *v21;
  std::string *p_str;
  std::vector<std::string>::pointer v23;
  __int128 v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  std::string *v28;
  std::vector<std::string>::pointer end;
  __int128 v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  std::string *v34;
  std::string *v35;
  __int128 v36;
  std::string *v37;
  int v38;
  std::string *v39;
  __int128 v40;
  std::string *v41;
  uint64_t v42;
  uint64_t v43;
  const std::string::value_type *v44;
  std::string::size_type v45;
  std::string *v46;
  __int128 v47;
  std::vector<std::string>::pointer v48;
  __int128 v49;
  std::string *v50;
  int v51;
  std::string *v52;
  void **v53;
  uint64_t v54;
  int value_low;
  uint64_t v56;
  const std::string::value_type *v57;
  std::__split_buffer<std::string>::pointer v58;
  uint64_t v59;
  const std::string::value_type *v60;
  std::__split_buffer<std::string>::pointer v61;
  char end_high;
  std::string::size_type v63;
  std::string *v64;
  std::string *v65;
  std::string *v66;
  std::string::size_type v67;
  std::__shared_weak_count *v68;
  unint64_t *p_shared_owners;
  unint64_t v70;
  std::string::size_type v71;
  std::__split_buffer<std::string>::pointer v72;
  uint64_t v73;
  unint64_t v74;
  _BOOL4 v75;
  std::string::size_type v76;
  std::__split_buffer<std::string>::pointer v77;
  char *v78;
  int v79;
  BOOL v80;
  BOOL v81;
  _BOOL4 v82;
  int v83;
  std::string::size_type v84;
  BOOL v85;
  int v86;
  int v87;
  const std::string *v88;
  std::vector<std::string>::const_iterator v89;
  std::vector<std::string>::pointer v90;
  __int128 v91;
  std::string::size_type v92;
  std::vector<std::string>::pointer v93;
  __int128 v94;
  std::string *p_p;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  std::string *v99;
  std::string *v100;
  __int128 v101;
  std::string *v102;
  std::string *v103;
  void **v104;
  void *exception;
  _QWORD *v106;
  _QWORD *v107;
  const void *p_x;
  size_t begin;
  uint64_t v110;
  std::__shared_weak_count *v111;
  std::string v112;
  std::string v113;
  std::string v114;
  char v115;
  std::string v116;
  std::string __p;
  void *v118;
  void *v119;
  __int128 v120;
  std::string::size_type v121;
  std::string v122;
  __int128 v123;
  std::string::size_type v124;
  unsigned __int8 v125;
  char *v126;
  std::string::size_type v127;
  unsigned __int8 v128;
  std::vector<std::string> v129;
  std::string __str;
  std::__split_buffer<std::string> __x;

  if (!*((_QWORD *)this + 2))
  {
    v6 = operator new(8uLL);
    *v6 = &unk_24E6B2630;
    *((_QWORD *)this + 2) = v6;
  }
  v7 = (char *)a2 + 24;
  v8 = *((char *)a2 + 47);
  if (v8 < 0)
  {
    if (*((_QWORD *)a2 + 4) != 5)
    {
LABEL_287:
      exception = __cxa_allocate_exception(0x58uLL);
      UC::Exception::CoderError::CoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 1, "", 0, "Only encoding of the scheme https is supported", 46);
      goto LABEL_291;
    }
    v7 = *(char **)v7;
  }
  else if (v8 != 5)
  {
    goto LABEL_287;
  }
  v9 = *(_DWORD *)v7;
  v10 = v7[4];
  if (v9 != 1886680168 || v10 != 115)
    goto LABEL_287;
  if (*((_QWORD *)a2 + 18))
  {
    exception = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 2, "", 0, "Encoding of URLs with port is not supported", 43);
    goto LABEL_291;
  }
  v12 = *((unsigned __int8 *)a2 + 175);
  if ((v12 & 0x80u) != 0)
    v12 = *((_QWORD *)a2 + 20);
  if (v12)
  {
    exception = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 3, "", 0, "Encoding of URLs with user is not supported", 43);
    goto LABEL_291;
  }
  v13 = *((unsigned __int8 *)a2 + 199);
  if ((v13 & 0x80u) != 0)
    v13 = *((_QWORD *)a2 + 23);
  if (v13)
  {
    exception = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 4, "", 0, "Encoding of URLs with password is not supported", 47);
LABEL_291:
  }
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  a3[1].__r_.__value_.__r.__words[2] = 0;
  if (*((char *)a2 + 71) < 0)
    std::string::__init_copy_ctor_external(&__str, *((const std::string::value_type **)a2 + 6), *((_QWORD *)a2 + 7));
  else
    __str = *(std::string *)((_BYTE *)a2 + 2);
  size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = __str.__r_.__value_.__l.__size_;
  if (!size)
  {
    v106 = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(v106, "UCSegmentedURLCoderErrorDomain", 0x1EuLL, 5, "", 0, "The URL must have a host component", 0x22uLL);
  }
  memset(&v129, 0, sizeof(v129));
  if (*((char *)a2 + 95) >= 0)
    v15 = *((unsigned __int8 *)a2 + 95);
  else
    v15 = *((_QWORD *)a2 + 10);
  if (*((char *)a2 + 119) >= 0)
    v16 = *((unsigned __int8 *)a2 + 119);
  else
    v16 = *((_QWORD *)a2 + 13);
  if (*((char *)a2 + 143) >= 0)
    v17 = *((unsigned __int8 *)a2 + 143);
  else
    v17 = *((_QWORD *)a2 + 16);
  std::string::basic_string[abi:ne180100]<0>(&v126, "appclip.");
  v18 = v128;
  if ((v128 & 0x80u) == 0)
    v19 = (char *)&v126;
  else
    v19 = v126;
  if ((v128 & 0x80u) == 0)
    v20 = v128;
  else
    v20 = v127;
  if (v20)
  {
    v21 = (unsigned __int8 *)&v19[v20];
    p_str = &__str;
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    while (*v19 == p_str->__r_.__value_.__s.__data_[0])
    {
      ++v19;
      p_str = (std::string *)((char *)p_str + 1);
      if (!--v20)
      {
        v19 = (char *)v21;
        break;
      }
    }
  }
  if ((v128 & 0x80) != 0)
  {
    if (v19 == &v126[v127])
    {
      v18 = v127;
LABEL_62:
      std::string::basic_string((std::string *)&__x, &__str, v18, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v114);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      *(_OWORD *)&__str.__r_.__value_.__l.__data_ = *(_OWORD *)&__x.__first_;
      __str.__r_.__value_.__r.__words[2] = (std::string::size_type)__x.__end_;
      std::string::basic_string[abi:ne180100]<0>(&v123, "1");
      end = v129.__end_;
      if (v129.__end_ >= v129.__end_cap_.__value_)
      {
        v31 = 0xAAAAAAAAAAAAAAABLL * (((char *)v129.__end_ - (char *)v129.__begin_) >> 3);
        v32 = v31 + 1;
        if (v31 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * (((char *)v129.__end_cap_.__value_ - (char *)v129.__begin_) >> 3) > v32)
          v32 = 0x5555555555555556 * (((char *)v129.__end_cap_.__value_ - (char *)v129.__begin_) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v129.__end_cap_.__value_ - (char *)v129.__begin_) >> 3) >= 0x555555555555555)
          v33 = 0xAAAAAAAAAAAAAAALL;
        else
          v33 = v32;
        __x.__end_cap_.__value_ = (std::allocator<std::string> *)&v129.__end_cap_;
        if (v33)
          v34 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v129.__end_cap_, v33);
        else
          v34 = 0;
        v39 = v34 + v31;
        __x.__first_ = v34;
        __x.__begin_ = v39;
        __x.__end_cap_.__value_ = &v34[v33];
        v40 = v123;
        v39->__r_.__value_.__r.__words[2] = v124;
        *(_OWORD *)&v39->__r_.__value_.__l.__data_ = v40;
        v124 = 0;
        v123 = 0uLL;
        __x.__end_ = v39 + 1;
        std::vector<std::string>::__swap_out_circular_buffer(&v129, &__x);
        v41 = v129.__end_;
        std::__split_buffer<std::string>::~__split_buffer(&__x);
        v129.__end_ = v41;
        if (SHIBYTE(v124) < 0)
          operator delete((void *)v123);
      }
      else
      {
        v30 = v123;
        v129.__end_->__r_.__value_.__r.__words[2] = v124;
        *(_OWORD *)&end->__r_.__value_.__l.__data_ = v30;
        v129.__end_ = end + 1;
      }
      v38 = 1;
      goto LABEL_82;
    }
  }
  else if (v19 == (char *)&v126 + v128)
  {
    goto LABEL_62;
  }
  std::string::basic_string[abi:ne180100]<0>(&v123, "0");
  v23 = v129.__end_;
  if (v129.__end_ >= v129.__end_cap_.__value_)
  {
    v25 = 0xAAAAAAAAAAAAAAABLL * (((char *)v129.__end_ - (char *)v129.__begin_) >> 3);
    v26 = v25 + 1;
    if (v25 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    if (0x5555555555555556 * (((char *)v129.__end_cap_.__value_ - (char *)v129.__begin_) >> 3) > v26)
      v26 = 0x5555555555555556 * (((char *)v129.__end_cap_.__value_ - (char *)v129.__begin_) >> 3);
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v129.__end_cap_.__value_ - (char *)v129.__begin_) >> 3) >= 0x555555555555555)
      v27 = 0xAAAAAAAAAAAAAAALL;
    else
      v27 = v26;
    __x.__end_cap_.__value_ = (std::allocator<std::string> *)&v129.__end_cap_;
    if (v27)
      v28 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v129.__end_cap_, v27);
    else
      v28 = 0;
    v35 = v28 + v25;
    __x.__first_ = v28;
    __x.__begin_ = v35;
    __x.__end_cap_.__value_ = &v28[v27];
    v36 = v123;
    v35->__r_.__value_.__r.__words[2] = v124;
    *(_OWORD *)&v35->__r_.__value_.__l.__data_ = v36;
    v124 = 0;
    v123 = 0uLL;
    __x.__end_ = v35 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(&v129, &__x);
    v37 = v129.__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__x);
    v129.__end_ = v37;
    if (SHIBYTE(v124) < 0)
      operator delete((void *)v123);
  }
  else
  {
    v24 = v123;
    v129.__end_->__r_.__value_.__r.__words[2] = v124;
    *(_OWORD *)&v23->__r_.__value_.__l.__data_ = v24;
    v129.__end_ = v23 + 1;
  }
  v38 = 0;
LABEL_82:
  UC::SUE::UCSegmentedURLEncodingResult::setSpecialSubdomainType((uint64_t)a3, v38);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v122, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
  else
    v122 = __str;
  v42 = v16 + v15;
  v43 = -v17;
  UC::SUE::SegmentedURLEncoderImpl::_encodeHost(&v122, (UC::SUE::UCSegmentedURLCoderProvider **)this, v16 + v15 != -v17, (int *)&v123);
  if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v122.__r_.__value_.__l.__data_);
  UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForHostFormatType(v123, &__x);
  if ((v125 & 0x80u) == 0)
    v44 = (char *)&v123 + 8;
  else
    v44 = (const std::string::value_type *)*((_QWORD *)&v123 + 1);
  if ((v125 & 0x80u) == 0)
    v45 = v125;
  else
    v45 = v124;
  v46 = std::string::append((std::string *)&__x, v44, v45);
  v47 = *(_OWORD *)&v46->__r_.__value_.__l.__data_;
  v121 = v46->__r_.__value_.__r.__words[2];
  v120 = v47;
  v46->__r_.__value_.__l.__size_ = 0;
  v46->__r_.__value_.__r.__words[2] = 0;
  v46->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__x.__end_) < 0)
    operator delete(__x.__first_);
  v48 = v129.__end_;
  if (v129.__end_ >= v129.__end_cap_.__value_)
  {
    v50 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v129, &v120);
  }
  else
  {
    if (SHIBYTE(v121) < 0)
    {
      std::string::__init_copy_ctor_external(v129.__end_, (const std::string::value_type *)v120, *((std::string::size_type *)&v120 + 1));
    }
    else
    {
      v49 = v120;
      v129.__end_->__r_.__value_.__r.__words[2] = v121;
      *(_OWORD *)&v48->__r_.__value_.__l.__data_ = v49;
    }
    v50 = v48 + 1;
  }
  v129.__end_ = v50;
  v51 = v123;
  v52 = (std::string *)operator new(0x20uLL);
  UC::SUE::UCSegmentedURLEncodingResult::HostResult::HostResult(v52, (__int128 *)((char *)&v123 + 8), v42 != v43, v51);
  v118 = v52;
  v119 = 0;
  UC::SUE::UCSegmentedURLEncodingResult::setHostEncodingResult((uint64_t)a3, (uint64_t *)&v118);
  v53 = (void **)v118;
  v118 = 0;
  if (v53)
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&v118, v53);
  memset(&__p, 0, sizeof(__p));
  memset(&v116, 0, sizeof(v116));
  v54 = *((unsigned __int8 *)a2 + 143);
  if ((v54 & 0x80u) != 0)
    v54 = *((_QWORD *)a2 + 16);
  if (!v54)
  {
    UC::SUE::SegmentedURLEncoderImpl::_tryEncodingSegmentedPathAndQuery((UC::SUE::UCSegmentedURLCoderProvider **)this, (uint64_t *)a2 + 9, (uint64_t *)a2 + 12, &__x);
    value_low = LOBYTE(__x.__end_cap_.__value_);
    if (LOBYTE(__x.__end_cap_.__value_))
    {
      if (SHIBYTE(__x.__end_) < 0)
      {
        std::string::__init_copy_ctor_external(&v114, (const std::string::value_type *)__x.__first_, (std::string::size_type)__x.__begin_);
      }
      else
      {
        *(_OWORD *)&v114.__r_.__value_.__l.__data_ = *(_OWORD *)&__x.__first_;
        v114.__r_.__value_.__r.__words[2] = (std::string::size_type)__x.__end_;
      }
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(&v114, "");
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    __p = v114;
    UC::SUE::SegmentedURLEncoderImpl::_tryEncodingWithPathWordBookAndAutoQueryTemplateFormat((UC::SUE::UCSegmentedURLCoderProvider **)this, (uint64_t)a2 + 72, (uint64_t)a2 + 96, &v114);
    if (v115)
    {
      if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v113, v114.__r_.__value_.__l.__data_, v114.__r_.__value_.__l.__size_);
      else
        v113 = v114;
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(&v113, "");
    }
    if (SHIBYTE(v116.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v116.__r_.__value_.__l.__data_);
    v116 = v113;
    if (v115 && SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v114.__r_.__value_.__l.__data_);
    if (value_low && SHIBYTE(__x.__end_) < 0)
      operator delete(__x.__first_);
  }
  if (*((char *)a2 + 95) < 0)
    std::string::__init_copy_ctor_external(&v114, *((const std::string::value_type **)a2 + 9), *((_QWORD *)a2 + 10));
  else
    v114 = *(std::string *)((_BYTE *)a2 + 3);
  v56 = *((unsigned __int8 *)a2 + 119);
  if ((v56 & 0x80u) != 0)
    v56 = *((_QWORD *)a2 + 13);
  if (v56)
  {
    std::operator+<char>();
    v57 = SHIBYTE(__x.__end_) >= 0
        ? (const std::string::value_type *)&__x
        : (const std::string::value_type *)__x.__first_;
    v58 = SHIBYTE(__x.__end_) >= 0 ? (std::__split_buffer<std::string>::pointer)HIBYTE(__x.__end_) : __x.__begin_;
    std::string::append(&v114, v57, (std::string::size_type)v58);
    if (SHIBYTE(__x.__end_) < 0)
      operator delete(__x.__first_);
  }
  v59 = *((unsigned __int8 *)a2 + 143);
  if ((v59 & 0x80u) != 0)
    v59 = *((_QWORD *)a2 + 16);
  if (v59)
  {
    std::operator+<char>();
    v60 = SHIBYTE(__x.__end_) >= 0
        ? (const std::string::value_type *)&__x
        : (const std::string::value_type *)__x.__first_;
    v61 = SHIBYTE(__x.__end_) >= 0 ? (std::__split_buffer<std::string>::pointer)HIBYTE(__x.__end_) : __x.__begin_;
    std::string::append(&v114, v60, (std::string::size_type)v61);
    if (SHIBYTE(__x.__end_) < 0)
      operator delete(__x.__first_);
  }
  end_high = HIBYTE(v114.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0)
  {
    v63 = v114.__r_.__value_.__l.__size_;
    if (!v114.__r_.__value_.__l.__size_)
    {
      memset(&v113, 0, sizeof(v113));
      goto LABEL_186;
    }
    v64 = (std::string *)v114.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((_BYTE *)&v114.__r_.__value_.__s + 23))
    {
      memset(&v113, 0, sizeof(v113));
      goto LABEL_167;
    }
    v63 = HIBYTE(v114.__r_.__value_.__r.__words[2]);
    v64 = &v114;
  }
  if (v64->__r_.__value_.__s.__data_[0] == 47)
  {
    if (v63 == 1)
      goto LABEL_161;
    v65 = (std::string *)v114.__r_.__value_.__r.__words[0];
    if ((v114.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v65 = &v114;
    if (v65->__r_.__value_.__s.__data_[1] != 35)
    {
LABEL_161:
      std::string::basic_string((std::string *)&__x, &v114, 1uLL, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v113);
      if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v114.__r_.__value_.__l.__data_);
      v114.__r_.__value_.__r.__words[2] = (std::string::size_type)__x.__end_;
      *(_OWORD *)&v114.__r_.__value_.__l.__data_ = *(_OWORD *)&__x.__first_;
      end_high = HIBYTE(__x.__end_);
    }
  }
  memset(&v113, 0, sizeof(v113));
  if (end_high < 0)
  {
LABEL_186:
    if (!v114.__r_.__value_.__l.__size_)
      goto LABEL_187;
    goto LABEL_168;
  }
LABEL_167:
  if (!end_high)
  {
LABEL_187:
    v71 = 0;
    goto LABEL_188;
  }
LABEL_168:
  if (std::string::find(&v114, 124, 0) != -1)
  {
    v107 = __cxa_allocate_exception(0x58uLL);
    std::string::basic_string[abi:ne180100]<0>(&__x, "|");
    if (SHIBYTE(__x.__end_) >= 0)
      p_x = &__x;
    else
      p_x = __x.__first_;
    if (SHIBYTE(__x.__end_) >= 0)
      begin = HIBYTE(__x.__end_);
    else
      begin = (size_t)__x.__begin_;
    UC::Exception::CoderError::CoderError(v107, "UCSegmentedURLCoderErrorDomain", 0x1EuLL, 6, p_x, begin, "Encountered an unsupported symbol while encoding URL's path or query", 0x44uLL);
  }
  if ((v114.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v66 = &v114;
  else
    v66 = (std::string *)v114.__r_.__value_.__r.__words[0];
  if ((v114.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v67 = HIBYTE(v114.__r_.__value_.__r.__words[2]);
  else
    v67 = v114.__r_.__value_.__l.__size_;
  UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols((std::string::value_type *)v66, v67, (uint64_t *)&__x);
  UC::SUE::UCSegmentedURLCoderProvider::getCombinedPathAndQueryCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)this, &v110);
  (*(void (**)(std::string *__return_ptr, uint64_t, std::__split_buffer<std::string> *))(*(_QWORD *)v110 + 40))(&v112, v110, &__x);
  if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v113.__r_.__value_.__l.__data_);
  v113 = v112;
  *((_BYTE *)&v112.__r_.__value_.__s + 23) = 0;
  v112.__r_.__value_.__s.__data_[0] = 0;
  v68 = v111;
  if (v111)
  {
    p_shared_owners = (unint64_t *)&v111->__shared_owners_;
    do
      v70 = __ldaxr(p_shared_owners);
    while (__stlxr(v70 - 1, p_shared_owners));
    if (!v70)
    {
      ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
      std::__shared_weak_count::__release_weak(v68);
    }
  }
  v112.__r_.__value_.__r.__words[0] = (std::string::size_type)&__x;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v112);
  if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v71 = HIBYTE(v113.__r_.__value_.__r.__words[2]);
  else
    v71 = v113.__r_.__value_.__l.__size_;
LABEL_188:
  std::string::basic_string[abi:ne180100]<0>(&__x, "0");
  if (SHIBYTE(__x.__end_) < 0)
  {
    v72 = __x.__begin_;
    operator delete(__x.__first_);
  }
  else
  {
    v72 = (std::__split_buffer<std::string>::pointer)HIBYTE(__x.__end_);
  }
  if ((unint64_t)v72 + v71 >= 0xFFFFFFFF)
    v73 = 0xFFFFFFFFLL;
  else
    v73 = (uint64_t)v72 + v71;
  if (v71)
    v74 = v73;
  else
    v74 = 0xFFFFFFFFLL;
  v75 = (unint64_t)v72 + v71 < 0xFFFFFFFF && v71 != 0;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v76 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v76 = __p.__r_.__value_.__l.__size_;
  std::string::basic_string[abi:ne180100]<0>(&__x, "1");
  if (SHIBYTE(__x.__end_) < 0)
  {
    v77 = __x.__begin_;
    operator delete(__x.__first_);
  }
  else
  {
    v77 = (std::__split_buffer<std::string>::pointer)HIBYTE(__x.__end_);
  }
  v78 = (char *)v77 + v76;
  if ((unint64_t)v77 + v76 < v74)
  {
    v79 = 1;
  }
  else
  {
    v78 = (char *)v74;
    v79 = v75;
  }
  v80 = v76 == 0;
  if (v76)
    v81 = (unint64_t)v77 + v76 < v74;
  else
    v81 = 0;
  if (v76)
    v82 = (unint64_t)v77 + v76 >= v74;
  else
    v82 = 1;
  if (v80)
  {
    v78 = (char *)v74;
    v83 = v75;
  }
  else
  {
    v83 = v79;
  }
  v84 = HIBYTE(v116.__r_.__value_.__r.__words[2]);
  if ((v116.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v84 = v116.__r_.__value_.__l.__size_;
  if (v84)
    v85 = v84 >= (unint64_t)v78;
  else
    v85 = 1;
  v86 = !v85;
  if (v85)
    v87 = v83;
  else
    v87 = 1;
  v88 = v129.__begin_;
  UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForTemplateType(v86, &__x);
  v89.__i_ = v88;
  std::vector<std::string>::insert(&v129, v89, (std::vector<std::string>::value_type *)&__x);
  if (SHIBYTE(__x.__end_) < 0)
    operator delete(__x.__first_);
  UC::SUE::UCSegmentedURLEncodingResult::setTemplateType((uint64_t)a3, v86);
  UC::SUE::UCSegmentedURLEncodingResult::setHasPathOrQuery((uint64_t)a3, v87);
  if (v87)
  {
    if ((v86 & 1) != 0)
    {
      v90 = v129.__end_;
      if (v129.__end_ < v129.__end_cap_.__value_)
      {
        if (SHIBYTE(v116.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external(v129.__end_, v116.__r_.__value_.__l.__data_, v116.__r_.__value_.__l.__size_);
LABEL_259:
          v103 = v90 + 1;
LABEL_263:
          v129.__end_ = v103;
          goto LABEL_264;
        }
        v91 = *(_OWORD *)&v116.__r_.__value_.__l.__data_;
        v92 = v116.__r_.__value_.__r.__words[2];
LABEL_258:
        v90->__r_.__value_.__r.__words[2] = v92;
        *(_OWORD *)&v90->__r_.__value_.__l.__data_ = v91;
        goto LABEL_259;
      }
      p_p = &v116;
    }
    else
    {
      UC::SUE::UCSegmentedURLEncodingResult::setNonTemplatePathAndQueryEncodeType((uint64_t)a3, v82);
      UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForNonTemplatePathAndQueryEncodeType(v82, &v112);
      v93 = v129.__end_;
      if (v129.__end_ >= v129.__end_cap_.__value_)
      {
        v96 = 0xAAAAAAAAAAAAAAABLL * (((char *)v129.__end_ - (char *)v129.__begin_) >> 3);
        v97 = v96 + 1;
        if (v96 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * (((char *)v129.__end_cap_.__value_ - (char *)v129.__begin_) >> 3) > v97)
          v97 = 0x5555555555555556 * (((char *)v129.__end_cap_.__value_ - (char *)v129.__begin_) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v129.__end_cap_.__value_ - (char *)v129.__begin_) >> 3) >= 0x555555555555555)
          v98 = 0xAAAAAAAAAAAAAAALL;
        else
          v98 = v97;
        __x.__end_cap_.__value_ = (std::allocator<std::string> *)&v129.__end_cap_;
        if (v98)
          v99 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v129.__end_cap_, v98);
        else
          v99 = 0;
        v100 = v99 + v96;
        __x.__first_ = v99;
        __x.__begin_ = v100;
        __x.__end_cap_.__value_ = &v99[v98];
        v101 = *(_OWORD *)&v112.__r_.__value_.__l.__data_;
        v100->__r_.__value_.__r.__words[2] = v112.__r_.__value_.__r.__words[2];
        *(_OWORD *)&v100->__r_.__value_.__l.__data_ = v101;
        memset(&v112, 0, sizeof(v112));
        __x.__end_ = v100 + 1;
        std::vector<std::string>::__swap_out_circular_buffer(&v129, &__x);
        v102 = v129.__end_;
        std::__split_buffer<std::string>::~__split_buffer(&__x);
        v129.__end_ = v102;
        if (SHIBYTE(v112.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v112.__r_.__value_.__l.__data_);
      }
      else
      {
        v94 = *(_OWORD *)&v112.__r_.__value_.__l.__data_;
        v129.__end_->__r_.__value_.__r.__words[2] = v112.__r_.__value_.__r.__words[2];
        *(_OWORD *)&v93->__r_.__value_.__l.__data_ = v94;
        v129.__end_ = v93 + 1;
      }
      v90 = v129.__end_;
      if (v81)
      {
        if (v129.__end_ < v129.__end_cap_.__value_)
        {
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external(v129.__end_, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
            goto LABEL_259;
          }
          v91 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          v92 = __p.__r_.__value_.__r.__words[2];
          goto LABEL_258;
        }
        p_p = &__p;
      }
      else
      {
        if (v129.__end_ < v129.__end_cap_.__value_)
        {
          if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external(v129.__end_, v113.__r_.__value_.__l.__data_, v113.__r_.__value_.__l.__size_);
            goto LABEL_259;
          }
          v91 = *(_OWORD *)&v113.__r_.__value_.__l.__data_;
          v92 = v113.__r_.__value_.__r.__words[2];
          goto LABEL_258;
        }
        p_p = &v113;
      }
    }
    v103 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v129, (__int128 *)p_p);
    goto LABEL_263;
  }
LABEL_264:
  UC::JoinString((std::string *)&v129, (std::string *)&__x);
  UC::SUE::UCSegmentedURLEncodingResult::setEncodingBits(a3, (const std::string *)&__x);
  if (SHIBYTE(__x.__end_) < 0)
    operator delete(__x.__first_);
  if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v113.__r_.__value_.__l.__data_);
  if (SHIBYTE(v114.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v114.__r_.__value_.__l.__data_);
  if (SHIBYTE(v116.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v116.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v104 = (void **)v119;
  v119 = 0;
  if (v104)
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&v119, v104);
  if (SHIBYTE(v121) < 0)
    operator delete((void *)v120);
  if ((char)v125 < 0)
    operator delete(*((void **)&v123 + 1));
  if ((char)v128 < 0)
    operator delete(v126);
  __x.__first_ = (std::__split_buffer<std::string>::pointer)&v129;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__x);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
}

void sub_220DD8324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,uint64_t a43,void **a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50)
{
  UC::SUE::UCSegmentedURLEncodingResult *v50;
  uint64_t v51;
  uint64_t v52;
  void **v54;

  *(_QWORD *)(v52 - 160) = v51;
  if (a20 < 0)
    operator delete(__p);
  if (a27 < 0)
    operator delete(a22);
  if (a34 < 0)
    operator delete(a29);
  if (a41 < 0)
    operator delete(a36);
  v54 = a44;
  a44 = 0;
  if (v54)
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&a44, v54);
  if (a50 < 0)
    operator delete(a45);
  if (*(char *)(v52 - 193) < 0)
    operator delete(*(void **)(v52 - 216));
  if (*(char *)(v52 - 169) < 0)
    operator delete(*(void **)(v52 - 192));
  *(_QWORD *)(v52 - 224) = v52 - 168;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v52 - 224));
  if (*(char *)(v52 - 121) < 0)
    operator delete(*(void **)(v52 - 144));
  UC::SUE::UCSegmentedURLEncodingResult::~UCSegmentedURLEncodingResult(v50);
  _Unwind_Resume(a1);
}

void sub_220DD8338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,uint64_t a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,uint64_t a45,uint64_t a46,void **a47,void *a48,uint64_t a49,int a50,__int16 a51,char a52,char a53)
{
  UC::SUE::UCSegmentedURLEncodingResult *v53;
  uint64_t v54;
  void **v56;

  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)(v54 - 120));
  if (a17 < 0)
    operator delete(__p);
  if (a23 < 0)
    operator delete(a18);
  if (a30 < 0)
    operator delete(a25);
  if (a37 < 0)
    operator delete(a32);
  if (a44 < 0)
    operator delete(a39);
  v56 = a47;
  a47 = 0;
  if (v56)
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&a47, v56);
  if (a53 < 0)
    operator delete(a48);
  if (*(char *)(v54 - 193) < 0)
    operator delete(*(void **)(v54 - 216));
  if (*(char *)(v54 - 169) < 0)
    operator delete(*(void **)(v54 - 192));
  *(_QWORD *)(v54 - 224) = v54 - 168;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v54 - 224));
  if (*(char *)(v54 - 121) < 0)
    operator delete(*(void **)(v54 - 144));
  UC::SUE::UCSegmentedURLEncodingResult::~UCSegmentedURLEncodingResult(v53);
  _Unwind_Resume(a1);
}

void sub_220DD836C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,char a25)
{
  int v25;
  uint64_t v26;

  if (a25 && a24 < 0)
    operator delete(__p);
  if (v25)
  {
    if (*(char *)(v26 - 97) < 0)
      JUMPOUT(0x220DD8614);
  }
  JUMPOUT(0x220DD8618);
}

void sub_220DD839C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,uint64_t a43,void **a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50)
{
  UC::SUE::UCSegmentedURLEncodingResult *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void **v55;

  if (*(char *)(v53 - 97) < 0)
  {
    operator delete(*(void **)(v53 - 120));
    if ((v52 & 1) == 0)
    {
LABEL_6:
      if (a20 < 0)
        operator delete(a15);
      if (a27 < 0)
        operator delete(a22);
      if (a34 < 0)
        operator delete(a29);
      if (a41 < 0)
        operator delete(a36);
      v55 = a44;
      a44 = 0;
      if (v55)
        std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&a44, v55);
      if (a50 < 0)
        operator delete(a45);
      if (*(char *)(v53 - 193) < 0)
        operator delete(*(void **)(v53 - 216));
      if (*(char *)(v53 - 169) < 0)
        operator delete(*(void **)(v53 - 192));
      *(_QWORD *)(v53 - 224) = v53 - 168;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v53 - 224));
      if (*(char *)(v53 - 121) < 0)
        operator delete(*(void **)(v53 - 144));
      UC::SUE::UCSegmentedURLEncodingResult::~UCSegmentedURLEncodingResult(v50);
      _Unwind_Resume(a1);
    }
  }
  else if (!v52)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v51);
  goto LABEL_6;
}

void sub_220DD83F8()
{
  JUMPOUT(0x220DD8618);
}

void sub_220DD8410()
{
  JUMPOUT(0x220DD869CLL);
}

void sub_220DD841C()
{
  JUMPOUT(0x220DD868CLL);
}

void sub_220DD8424()
{
  void *v0;

  __cxa_free_exception(v0);
  JUMPOUT(0x220DD868CLL);
}

void sub_220DD8454(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, void **a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,uint64_t a43,void **a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50)
{
  UC::SUE::UCSegmentedURLEncodingResult *v50;
  uint64_t v51;
  _QWORD *v54;
  _QWORD *exception;
  void *v56;
  const void *v57;
  size_t v58;
  void **v59;

  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  if (a2 == 1)
  {
    v54 = __cxa_begin_catch(a1);
    exception = __cxa_allocate_exception(0x58uLL);
    v56 = exception;
    if (*((char *)v54 + 55) < 0)
    {
      v57 = (const void *)v54[4];
      v58 = v54[5];
    }
    else
    {
      v57 = v54 + 4;
      v58 = *((unsigned __int8 *)v54 + 55);
    }
    UC::Exception::CoderError::CoderError(exception, "UCSegmentedURLCoderErrorDomain", 0x1EuLL, 6, v57, v58, "Encountered an unsupported symbol while encoding URL's path or query", 0x44uLL);
  }
  a12 = (void **)(v51 - 120);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a12);
  if (a20 < 0)
    operator delete(a15);
  if (a27 < 0)
    operator delete(a22);
  if (a34 < 0)
    operator delete(a29);
  if (a41 < 0)
    operator delete(a36);
  v59 = a44;
  a44 = 0;
  if (v59)
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&a44, v59);
  if (a50 < 0)
    operator delete(a45);
  if (*(char *)(v51 - 193) < 0)
    operator delete(*(void **)(v51 - 216));
  if (*(char *)(v51 - 169) < 0)
    operator delete(*(void **)(v51 - 192));
  *(_QWORD *)(v51 - 224) = v51 - 168;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v51 - 224));
  if (*(char *)(v51 - 121) < 0)
    operator delete(*(void **)(v51 - 144));
  UC::SUE::UCSegmentedURLEncodingResult::~UCSegmentedURLEncodingResult(v50);
  _Unwind_Resume(a1);
}

void sub_220DD84E8()
{
  __cxa_end_catch();
  JUMPOUT(0x220DD8500);
}

void sub_220DD851C()
{
  uint64_t v0;

  if (*(char *)(v0 - 97) < 0)
    JUMPOUT(0x220DD8604);
  JUMPOUT(0x220DD8608);
}

void sub_220DD8538()
{
  JUMPOUT(0x220DD8608);
}

void sub_220DD8544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,uint64_t a43,void *a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50)
{
  UC::SUE::UCSegmentedURLEncodingResult *v50;
  uint64_t v51;
  void *v53;

  if (*(char *)(v51 - 97) < 0)
    JUMPOUT(0x220DD855CLL);
  if (a20 < 0)
    operator delete(a15);
  if (a27 < 0)
    operator delete(a22);
  if (a34 < 0)
    operator delete(a29);
  if (a41 < 0)
    operator delete(a36);
  v53 = a44;
  a44 = 0;
  if (v53)
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&a44, v53);
  if (a50 < 0)
    operator delete(a45);
  if (*(char *)(v51 - 193) < 0)
    operator delete(*(void **)(v51 - 216));
  if (*(char *)(v51 - 169) < 0)
    operator delete(*(void **)(v51 - 192));
  *(_QWORD *)(v51 - 224) = v51 - 168;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v51 - 224);
  if (*(char *)(v51 - 121) < 0)
    operator delete(*(void **)(v51 - 144));
  UC::SUE::UCSegmentedURLEncodingResult::~UCSegmentedURLEncodingResult(v50);
  _Unwind_Resume(a1);
}

void sub_220DD8570(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void **__p)
{
  void **v31;

  v31 = __p;
  __p = 0;
  if (v31)
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&__p, v31);
  JUMPOUT(0x220DD8638);
}

void sub_220DD858C()
{
  void *v0;

  operator delete(v0);
  JUMPOUT(0x220DD864CLL);
}

void sub_220DD859C()
{
  JUMPOUT(0x220DD864CLL);
}

void sub_220DD85A4()
{
  uint64_t v0;

  if (*(char *)(v0 - 97) < 0)
    JUMPOUT(0x220DD8658);
  JUMPOUT(0x220DD865CLL);
}

void sub_220DD85B8()
{
  JUMPOUT(0x220DD865CLL);
}

void sub_220DD85C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,int a39,__int16 a40,char a41,char a42)
{
  if (a42 < 0)
    JUMPOUT(0x220DD8668);
  JUMPOUT(0x220DD866CLL);
}

void sub_220DD85D4()
{
  JUMPOUT(0x220DD866CLL);
}

void sub_220DD85DC()
{
  JUMPOUT(0x220DD867CLL);
}

void sub_220DD85E4()
{
  void *v0;

  __cxa_free_exception(v0);
  JUMPOUT(0x220DD86A4);
}

_QWORD *UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForHostFormatType@<X0>(unsigned int a1@<W1>, _QWORD *a2@<X8>)
{
  void *exception;

  if (a1 >= 3)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    UC::Exception::InternalCoderError::InternalCoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 0, "Unknown host format type", 24);
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, off_24E6B25F0[a1]);
}

void sub_220DD8720(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void UC::SUE::SegmentedURLEncoderImpl::_tryEncodingSegmentedPathAndQuery(UC::SUE::UCSegmentedURLCoderProvider **a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, _BYTE *a4@<X8>)
{
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  _BOOL4 v12;
  uint64_t *v13;
  uint64_t v14;
  std::vector<std::string>::pointer end;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  std::string *v21;
  std::string *v22;
  __int128 v23;
  std::string *v24;
  uint64_t v25;
  uint64_t i;
  int v27;
  unsigned __int8 *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  _BYTE *v32;
  std::vector<std::string>::pointer begin;
  int v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  int64_t v38;
  _BOOL4 v40;
  std::string *v41;
  uint64_t size;
  std::string *v43;
  std::string *v44;
  __int128 v45;
  std::string *v46;
  std::string::size_type v47;
  std::vector<std::string>::pointer v48;
  __int128 v49;
  BOOL v50;
  BOOL v51;
  BOOL v52;
  char v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  std::string *v57;
  std::string *v58;
  void **v59;
  std::string::size_type v60;
  std::string *v61;
  __int128 v62;
  std::vector<std::string>::pointer v63;
  __int128 v64;
  std::string *v65;
  std::__split_buffer<std::string>::pointer first;
  std::string *v67;
  __int128 v68;
  std::string *v69;
  int64_t v70;
  std::vector<std::string>::pointer v71;
  __int128 v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  std::string *v76;
  std::string *v77;
  __int128 v78;
  std::string *v79;
  uint64_t v80;
  uint64_t v81;
  BOOL v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  std::vector<std::string>::pointer v86;
  __int128 v87;
  std::string *v88;
  _BYTE *v89;
  void *v90[2];
  unsigned __int8 v91;
  std::string v92;
  std::string v93;
  void *v94[2];
  std::string::size_type v95;
  std::vector<std::string> v96;
  void *__p[2];
  std::string::size_type v98;
  std::vector<std::string> v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  std::__split_buffer<std::string> __v;

  if (*((char *)a3 + 23) < 0)
  {
    v7 = a3[1];
    if (!v7)
      goto LABEL_10;
  }
  else
  {
    if (!*((_BYTE *)a3 + 23))
      goto LABEL_10;
    v7 = *((unsigned __int8 *)a3 + 23);
  }
  if (*((char *)a3 + 23) >= 0)
    v8 = a3;
  else
    v8 = (uint64_t *)*a3;
  if (*((_BYTE *)v8 + v7 - 1) == 38)
  {
    *a4 = 0;
    a4[24] = 0;
    return;
  }
LABEL_10:
  v9 = *((unsigned __int8 *)a2 + 23);
  if (*((char *)a2 + 23) < 0)
  {
    v10 = a2[1];
    if (!v10)
    {
      v12 = 0;
      v100 = 0;
      v101 = 0;
      v102 = 0;
LABEL_21:
      v13 = a2;
      a2 = (uint64_t *)*a2;
      v9 = v13[1];
      goto LABEL_22;
    }
  }
  else
  {
    if (!*((_BYTE *)a2 + 23))
    {
      v12 = 0;
      v100 = 0;
      v101 = 0;
      v102 = 0;
      goto LABEL_22;
    }
    v10 = *((unsigned __int8 *)a2 + 23);
  }
  if ((v9 & 0x80u) == 0)
    v11 = a2;
  else
    v11 = (uint64_t *)*a2;
  v12 = *((unsigned __int8 *)v11 + v10 - 1) == 47;
  v100 = 0;
  v101 = 0;
  v102 = 0;
  if ((v9 & 0x80) != 0)
    goto LABEL_21;
LABEL_22:
  UC::SplitString((unsigned __int8 *)a2, v9, 0x2Fu, &v100);
  memset(&v99, 0, sizeof(v99));
  UC::SUE::SegmentedURLEncoderImpl::_filterByComponentsToKeep(v14, &v100, (uint64_t *)&v99);
  if (v99.__end_ == v99.__begin_ && v12)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "/");
    end = v99.__end_;
    if (v99.__end_ >= v99.__end_cap_.__value_)
    {
      v18 = 0xAAAAAAAAAAAAAAABLL * (((char *)v99.__end_ - (char *)v99.__begin_) >> 3);
      v19 = v18 + 1;
      if (v18 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)v99.__end_cap_.__value_ - (char *)v99.__begin_) >> 3) > v19)
        v19 = 0x5555555555555556 * (((char *)v99.__end_cap_.__value_ - (char *)v99.__begin_) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v99.__end_cap_.__value_ - (char *)v99.__begin_) >> 3) >= 0x555555555555555)
        v20 = 0xAAAAAAAAAAAAAAALL;
      else
        v20 = v19;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v99.__end_cap_;
      if (v20)
        v21 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v99.__end_cap_, v20);
      else
        v21 = 0;
      v22 = v21 + v18;
      __v.__first_ = v21;
      __v.__begin_ = v22;
      __v.__end_cap_.__value_ = &v21[v20];
      v23 = *(_OWORD *)__p;
      v22->__r_.__value_.__r.__words[2] = v98;
      *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
      __p[1] = 0;
      v98 = 0;
      __p[0] = 0;
      __v.__end_ = v22 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v99, &__v);
      v24 = v99.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v99.__end_ = v24;
      if (SHIBYTE(v98) < 0)
        operator delete(__p[0]);
    }
    else
    {
      v17 = *(_OWORD *)__p;
      v99.__end_->__r_.__value_.__r.__words[2] = v98;
      *(_OWORD *)&end->__r_.__value_.__l.__data_ = v17;
      v99.__end_ = end + 1;
    }
  }
  v25 = v100;
  for (i = v101; i != v25; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  v101 = v25;
  v27 = *((char *)a3 + 23);
  if (v27 >= 0)
    v28 = (unsigned __int8 *)a3;
  else
    v28 = (unsigned __int8 *)*a3;
  if (v27 >= 0)
    v29 = *((unsigned __int8 *)a3 + 23);
  else
    v29 = a3[1];
  UC::SplitString(v28, v29, 0x26u, &v100);
  __p[0] = 0;
  __p[1] = 0;
  v98 = 0;
  UC::SUE::SegmentedURLEncoderImpl::_filterByComponentsToKeep(v30, &v100, (uint64_t *)__p);
  memset(&v96, 0, sizeof(v96));
  v31 = __p[0];
  v32 = __p[1];
  begin = v99.__begin_;
  if ((std::vector<std::string>::pointer)((char *)v99.__end_ - (char *)v99.__begin_) == (std::vector<std::string>::pointer)24)
  {
    v34 = SHIBYTE(v99.__begin_->__r_.__value_.__r.__words[2]);
    if (v34 < 0)
    {
      if (v99.__begin_->__r_.__value_.__l.__size_ != 1)
        goto LABEL_59;
      begin = (std::vector<std::string>::pointer)v99.__begin_->__r_.__value_.__l.__data_;
    }
    else if (v34 != 1)
    {
      goto LABEL_59;
    }
    if (begin->__r_.__value_.__s.__data_[0] != 47 || __p[1] == __p[0])
      goto LABEL_60;
    goto LABEL_139;
  }
LABEL_59:
  if (v99.__end_ != v99.__begin_)
  {
LABEL_60:
    v35 = 0;
    v36 = v99.__end_ - v99.__begin_;
    v37 = v36 - 1;
    v89 = a4;
    if (v36 <= 1)
      v38 = 1;
    else
      v38 = v99.__end_ - v99.__begin_;
    while (1)
    {
      v40 = v32 != v31 || v37 != 0;
      v41 = &v99.__begin_[v35];
      if (SHIBYTE(v99.__begin_[v35].__r_.__value_.__r.__words[2]) < 0)
      {
        v43 = (std::string *)v41->__r_.__value_.__r.__words[0];
        size = v41->__r_.__value_.__l.__size_;
      }
      else
      {
        size = HIBYTE(v99.__begin_[v35].__r_.__value_.__r.__words[2]);
        v43 = &v99.__begin_[v35];
      }
      UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols((std::string::value_type *)v43, size, (uint64_t *)v94);
      if ((UC::SUE::SegmentedURLEncoderImpl::_canEncodeSegmentedPathComponentOrQueryValue(a1, (uint64_t)v94) & 1) == 0)
      {
        *v89 = 0;
        v89[24] = 0;
        __v.__first_ = (std::__split_buffer<std::string>::pointer)v94;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
        goto LABEL_171;
      }
      v44 = &v99.__begin_[v35];
      if (SHIBYTE(v99.__begin_[v35].__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(&v93, v44->__r_.__value_.__l.__data_, v44->__r_.__value_.__l.__size_);
      }
      else
      {
        v45 = *(_OWORD *)&v44->__r_.__value_.__l.__data_;
        v93.__r_.__value_.__r.__words[2] = v44->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v93.__r_.__value_.__l.__data_ = v45;
      }
      if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
      {
        v47 = v93.__r_.__value_.__l.__size_;
        if (v93.__r_.__value_.__l.__size_ != 1)
        {
          if (v37)
            v52 = 0;
          else
            v52 = v12;
          if (v52)
            goto LABEL_109;
          goto LABEL_99;
        }
        v46 = (std::string *)v93.__r_.__value_.__r.__words[0];
      }
      else
      {
        if (HIBYTE(v93.__r_.__value_.__r.__words[2]) != 1)
        {
          if (v37)
            v50 = 0;
          else
            v50 = v12;
          if (v50)
          {
LABEL_94:
            v47 = HIBYTE(v93.__r_.__value_.__r.__words[2]);
            goto LABEL_109;
          }
          goto LABEL_99;
        }
        v46 = &v93;
      }
      if (v46->__r_.__value_.__s.__data_[0] != 47)
      {
        if (v37)
          v51 = 0;
        else
          v51 = v12;
        if (v51)
        {
          if ((*((_BYTE *)&v93.__r_.__value_.__s + 23) & 0x80) == 0)
            goto LABEL_94;
          v47 = v93.__r_.__value_.__l.__size_;
LABEL_109:
          v58 = &v93;
          if ((v93.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
            v58 = (std::string *)v93.__r_.__value_.__r.__words[0];
          v53 = v58->__r_.__value_.__s.__data_[v47 - 1] != 47;
LABEL_112:
          std::string::basic_string[abi:ne180100]<0>(&v92, "0");
          UC::SUE::SegmentedURLEncoderImpl::_encodeURLPathComponent((uint64_t)a1, (uint64_t)&v99.__begin_[v35], v53, v40, (uint64_t)v90);
          if ((v91 & 0x80u) == 0)
            v59 = v90;
          else
            v59 = (void **)v90[0];
          if ((v91 & 0x80u) == 0)
            v60 = v91;
          else
            v60 = (std::string::size_type)v90[1];
          v61 = std::string::append(&v92, (const std::string::value_type *)v59, v60);
          v62 = *(_OWORD *)&v61->__r_.__value_.__l.__data_;
          __v.__end_ = (std::__split_buffer<std::string>::pointer)v61->__r_.__value_.__r.__words[2];
          *(_OWORD *)&__v.__first_ = v62;
          v61->__r_.__value_.__l.__size_ = 0;
          v61->__r_.__value_.__r.__words[2] = 0;
          v61->__r_.__value_.__r.__words[0] = 0;
          if ((char)v91 < 0)
            operator delete(v90[0]);
          if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v92.__r_.__value_.__l.__data_);
          v63 = v96.__end_;
          if (v96.__end_ >= v96.__end_cap_.__value_)
          {
            v65 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v96, (__int128 *)&__v);
          }
          else
          {
            if (SHIBYTE(__v.__end_) < 0)
            {
              std::string::__init_copy_ctor_external(v96.__end_, (const std::string::value_type *)__v.__first_, (std::string::size_type)__v.__begin_);
            }
            else
            {
              v64 = *(_OWORD *)&__v.__first_;
              v96.__end_->__r_.__value_.__r.__words[2] = (std::string::size_type)__v.__end_;
              *(_OWORD *)&v63->__r_.__value_.__l.__data_ = v64;
            }
            v65 = v63 + 1;
          }
          v96.__end_ = v65;
          if ((SHIBYTE(__v.__end_) & 0x80000000) == 0)
            goto LABEL_131;
          first = __v.__first_;
LABEL_130:
          operator delete(first);
          goto LABEL_131;
        }
LABEL_99:
        v53 = 0;
        goto LABEL_112;
      }
      std::string::basic_string[abi:ne180100]<0>(&v92, "10");
      v48 = v96.__end_;
      if (v96.__end_ >= v96.__end_cap_.__value_)
      {
        v54 = 0xAAAAAAAAAAAAAAABLL * (((char *)v96.__end_ - (char *)v96.__begin_) >> 3);
        v55 = v54 + 1;
        if (v54 + 1 > 0xAAAAAAAAAAAAAAALL)
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        if (0x5555555555555556 * (((char *)v96.__end_cap_.__value_ - (char *)v96.__begin_) >> 3) > v55)
          v55 = 0x5555555555555556 * (((char *)v96.__end_cap_.__value_ - (char *)v96.__begin_) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v96.__end_cap_.__value_ - (char *)v96.__begin_) >> 3) >= 0x555555555555555)
          v56 = 0xAAAAAAAAAAAAAAALL;
        else
          v56 = v55;
        __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v96.__end_cap_;
        if (v56)
          v57 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v96.__end_cap_, v56);
        else
          v57 = 0;
        v67 = v57 + v54;
        __v.__first_ = v57;
        __v.__begin_ = v67;
        __v.__end_cap_.__value_ = &v57[v56];
        v68 = *(_OWORD *)&v92.__r_.__value_.__l.__data_;
        v67->__r_.__value_.__r.__words[2] = v92.__r_.__value_.__r.__words[2];
        *(_OWORD *)&v67->__r_.__value_.__l.__data_ = v68;
        memset(&v92, 0, sizeof(v92));
        __v.__end_ = v67 + 1;
        std::vector<std::string>::__swap_out_circular_buffer(&v96, &__v);
        v69 = v96.__end_;
        std::__split_buffer<std::string>::~__split_buffer(&__v);
        v96.__end_ = v69;
        if ((SHIBYTE(v92.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
          goto LABEL_131;
        first = (std::__split_buffer<std::string>::pointer)v92.__r_.__value_.__r.__words[0];
        goto LABEL_130;
      }
      v49 = *(_OWORD *)&v92.__r_.__value_.__l.__data_;
      v96.__end_->__r_.__value_.__r.__words[2] = v92.__r_.__value_.__r.__words[2];
      *(_OWORD *)&v48->__r_.__value_.__l.__data_ = v49;
      v96.__end_ = v48 + 1;
LABEL_131:
      if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v93.__r_.__value_.__l.__data_);
      __v.__first_ = (std::__split_buffer<std::string>::pointer)v94;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
      --v37;
      ++v35;
      if (!--v38)
      {
        v31 = __p[0];
        v32 = __p[1];
        a4 = v89;
        break;
      }
    }
  }
LABEL_139:
  v70 = v32 - v31;
  if (v32 == v31)
  {
LABEL_169:
    UC::JoinString((std::string *)&v96, (std::string *)&__v);
    *(_OWORD *)a4 = *(_OWORD *)&__v.__first_;
    *((_QWORD *)a4 + 2) = __v.__end_;
    a4[24] = 1;
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v94, "11");
    v71 = v96.__end_;
    if (v96.__end_ >= v96.__end_cap_.__value_)
    {
      v73 = 0xAAAAAAAAAAAAAAABLL * (((char *)v96.__end_ - (char *)v96.__begin_) >> 3);
      v74 = v73 + 1;
      if (v73 + 1 > 0xAAAAAAAAAAAAAAALL)
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      if (0x5555555555555556 * (((char *)v96.__end_cap_.__value_ - (char *)v96.__begin_) >> 3) > v74)
        v74 = 0x5555555555555556 * (((char *)v96.__end_cap_.__value_ - (char *)v96.__begin_) >> 3);
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v96.__end_cap_.__value_ - (char *)v96.__begin_) >> 3) >= 0x555555555555555)
        v75 = 0xAAAAAAAAAAAAAAALL;
      else
        v75 = v74;
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v96.__end_cap_;
      if (v75)
        v76 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v96.__end_cap_, v75);
      else
        v76 = 0;
      v77 = v76 + v73;
      __v.__first_ = v76;
      __v.__begin_ = v77;
      __v.__end_cap_.__value_ = &v76[v75];
      v78 = *(_OWORD *)v94;
      v77->__r_.__value_.__r.__words[2] = v95;
      *(_OWORD *)&v77->__r_.__value_.__l.__data_ = v78;
      v94[1] = 0;
      v95 = 0;
      v94[0] = 0;
      __v.__end_ = v77 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v96, &__v);
      v79 = v96.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v96.__end_ = v79;
      if (SHIBYTE(v95) < 0)
        operator delete(v94[0]);
    }
    else
    {
      v72 = *(_OWORD *)v94;
      v96.__end_->__r_.__value_.__r.__words[2] = v95;
      *(_OWORD *)&v71->__r_.__value_.__l.__data_ = v72;
      v96.__end_ = v71 + 1;
    }
    v80 = 0;
    v81 = v70 / 24;
    v82 = v70 / 24 != 0;
    v83 = v70 / 24 - 1;
    if (v83 != 0 && v82)
      v84 = v81;
    else
      v84 = 1;
    while ((UC::SUE::SegmentedURLEncoderImpl::_canEncodeSegmentedQureyParameter(a1, (std::string *)((char *)__p[0] + v80)) & 1) != 0)
    {
      v82 = v83-- != 0;
      v85 = v82;
      UC::SUE::SegmentedURLEncoderImpl::_encodeSegmentedQueryComponent((std::string *)((char *)__p[0] + v80), a1, v85, (uint64_t)&__v);
      v86 = v96.__end_;
      if (v96.__end_ >= v96.__end_cap_.__value_)
      {
        v88 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v96, (__int128 *)&__v);
      }
      else
      {
        if (SHIBYTE(__v.__end_) < 0)
        {
          std::string::__init_copy_ctor_external(v96.__end_, (const std::string::value_type *)__v.__first_, (std::string::size_type)__v.__begin_);
        }
        else
        {
          v87 = *(_OWORD *)&__v.__first_;
          v96.__end_->__r_.__value_.__r.__words[2] = (std::string::size_type)__v.__end_;
          *(_OWORD *)&v86->__r_.__value_.__l.__data_ = v87;
        }
        v88 = v86 + 1;
      }
      v96.__end_ = v88;
      if (SHIBYTE(__v.__end_) < 0)
        operator delete(__v.__first_);
      v80 += 24;
      if (!--v84)
        goto LABEL_169;
    }
    *a4 = 0;
    a4[24] = 0;
  }
LABEL_171:
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v96;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)__p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v99;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v100;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
}

void sub_220DD9028(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,void ***__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,void **a35,uint64_t a36,uint64_t a37,uint64_t *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,uint64_t a44)
{
  uint64_t v44;

  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)(v44 - 128));
  if (a34 < 0)
    operator delete(__p);
  __p = &a35;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  a35 = (void **)&a38;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a35);
  a38 = &a44;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a38);
  a44 = v44 - 152;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a44);
  _Unwind_Resume(a1);
}

void UC::SUE::SegmentedURLEncoderImpl::_tryEncodingWithPathWordBookAndAutoQueryTemplateFormat(UC::SUE::UCSegmentedURLCoderProvider **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  int v8;
  unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned __int8 *v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  std::string::size_type v17;
  std::string *v18;
  __int128 v19;
  std::string *p_p;
  std::string::size_type size;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  std::string *v25;
  std::string::size_type v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _BOOL4 v32;
  std::string *v33;
  std::string::size_type v34;
  char v35;
  uint64_t v36;
  std::__shared_weak_count *v37;
  void *v38[2];
  unsigned __int8 v39;
  std::string v40;
  std::string __p;
  std::string v42;
  void **v43;
  void **v44;
  uint64_t v45;
  void **v46[3];
  void **v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50[3];

  if ((UC::SUE::SegmentedURLEncoderImpl::_pathAndQueryMatchPathWordBookAndAutoQueryTemplateFormat(a1, (uint64_t *)a2, (uint64_t *)a3) & 1) != 0)
  {
    memset(v50, 0, sizeof(v50));
    v8 = *(char *)(a2 + 23);
    if (v8 >= 0)
      v9 = (unsigned __int8 *)a2;
    else
      v9 = *(unsigned __int8 **)a2;
    if (v8 >= 0)
      v10 = *(unsigned __int8 *)(a2 + 23);
    else
      v10 = *(_QWORD *)(a2 + 8);
    UC::SplitString(v9, v10, 0x2Fu, v50);
    v47 = 0;
    v48 = 0;
    v49 = 0;
    UC::SUE::SegmentedURLEncoderImpl::_filterByComponentsToKeep(v11, v50, (uint64_t *)&v47);
    memset(v46, 0, sizeof(v46));
    v12 = *(char *)(a3 + 23);
    if (v12 >= 0)
      v13 = (unsigned __int8 *)a3;
    else
      v13 = *(unsigned __int8 **)a3;
    if (v12 >= 0)
      v14 = *(unsigned __int8 *)(a3 + 23);
    else
      v14 = *(_QWORD *)(a3 + 8);
    UC::SplitString(v13, v14, 0x26u, (uint64_t *)v46);
    v43 = 0;
    v44 = 0;
    v45 = 0;
    UC::SUE::SegmentedURLEncoderImpl::_filterByComponentsToKeep(v15, v46, (uint64_t *)&v43);
    memset(&v42, 0, sizeof(v42));
    if (v48 - (_QWORD)v47 == 24)
    {
      std::string::basic_string[abi:ne180100]<0>(&v40, "0");
      UC::SUE::UCSegmentedURLCoderProvider::getKnownWordFixedLengthCoder(*a1, &v36);
      (*(void (**)(void **__return_ptr, uint64_t, void **))(*(_QWORD *)v36 + 32))(v38, v36, v47);
      if ((v39 & 0x80u) == 0)
        v16 = v38;
      else
        v16 = (void **)v38[0];
      if ((v39 & 0x80u) == 0)
        v17 = v39;
      else
        v17 = (std::string::size_type)v38[1];
      v18 = std::string::append(&v40, (const std::string::value_type *)v16, v17);
      v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v19;
      v18->__r_.__value_.__l.__size_ = 0;
      v18->__r_.__value_.__r.__words[2] = 0;
      v18->__r_.__value_.__r.__words[0] = 0;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        size = __p.__r_.__value_.__l.__size_;
      std::string::append(&v42, (const std::string::value_type *)p_p, size);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if ((char)v39 < 0)
        operator delete(v38[0]);
      v22 = v37;
      if (v37)
      {
        p_shared_owners = (unint64_t *)&v37->__shared_owners_;
        do
          v24 = __ldaxr(p_shared_owners);
        while (__stlxr(v24 - 1, p_shared_owners));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
      if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v40.__r_.__value_.__l.__data_);
    }
    if (v44 == v43)
      goto LABEL_64;
    std::string::basic_string[abi:ne180100]<0>(&__p, "1");
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v25 = &__p;
    else
      v25 = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v26 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v26 = __p.__r_.__value_.__l.__size_;
    std::string::append(&v42, (const std::string::value_type *)v25, v26);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v44 == v43)
    {
LABEL_64:
      if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(a4, v42.__r_.__value_.__l.__data_, v42.__r_.__value_.__l.__size_);
      else
        *a4 = v42;
      v35 = 1;
    }
    else
    {
      v27 = 0;
      v28 = ((char *)v44 - (char *)v43) / 24;
      v29 = v28 - 1;
      if (v28 <= 1)
        v30 = 1;
      else
        v30 = ((char *)v44 - (char *)v43) / 24;
      while ((UC::SUE::SegmentedURLEncoderImpl::_canEncodeSegmentedQureyParameter(a1, (std::string *)&v43[v27]) & 1) != 0)
      {
        v32 = v29-- != 0;
        UC::SUE::SegmentedURLEncoderImpl::_encodePathWordBookAndAutoQueryTemplateQueryComponent((std::string *)&v43[v27], (uint64_t)a1, v32, &__p);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v33 = &__p;
        else
          v33 = (std::string *)__p.__r_.__value_.__r.__words[0];
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v34 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        else
          v34 = __p.__r_.__value_.__l.__size_;
        std::string::append(&v42, (const std::string::value_type *)v33, v34);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        v27 += 3;
        if (!--v30)
          goto LABEL_64;
      }
      v35 = 0;
      a4->__r_.__value_.__s.__data_[0] = 0;
    }
    a4[1].__r_.__value_.__s.__data_[0] = v35;
    if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v42.__r_.__value_.__l.__data_);
    v42.__r_.__value_.__r.__words[0] = (std::string::size_type)&v43;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v42);
    v43 = (void **)v46;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v43);
    v46[0] = (void **)&v47;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v46);
    v47 = (void **)v50;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v47);
  }
  else
  {
    a4->__r_.__value_.__s.__data_[0] = 0;
    a4[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_220DD951C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t **__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t *a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  uint64_t v38;

  if (a34 < 0)
    operator delete(__p);
  __p = &a35;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  a35 = &a38;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a35);
  a38 = v38 - 112;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a38);
  *(_QWORD *)(v38 - 112) = v38 - 88;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v38 - 112));
  _Unwind_Resume(a1);
}

_QWORD *UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForNonTemplatePathAndQueryEncodeType@<X0>(int a1@<W1>, _QWORD *a2@<X8>)
{
  char *v2;
  void *exception;

  if (a1 == 1)
  {
    v2 = "0";
  }
  else
  {
    if (a1)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      UC::Exception::InternalCoderError::InternalCoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 0, "Unknown non-template path and query encode type type", 52);
    }
    v2 = "1";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void sub_220DD9698(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::vector<std::string>::iterator std::vector<std::string>::insert(std::vector<std::string> *this, std::vector<std::string>::const_iterator __position, std::vector<std::string>::value_type *__x)
{
  std::string *i;
  std::vector<std::string>::pointer end;
  std::allocator<std::string> *p_end_cap;
  std::string *v8;
  std::string *value;
  __int128 v10;
  std::vector<std::string>::pointer begin;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  std::string *v17;
  __int128 v18;
  std::__split_buffer<std::string> __v;

  i = (std::string *)__position.__i_;
  end = this->__end_;
  value = this->__end_cap_.__value_;
  p_end_cap = (std::allocator<std::string> *)&this->__end_cap_;
  v8 = value;
  if (end >= value)
  {
    begin = this->__begin_;
    v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3) + 1;
    if (v12 > 0xAAAAAAAAAAAAAAALL)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v13 = 0xAAAAAAAAAAAAAAABLL * (((char *)__position.__i_ - (char *)begin) >> 3);
    v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)v8 - (char *)begin) >> 3);
    v15 = 2 * v14;
    if (2 * v14 <= v12)
      v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3) + 1;
    if (v14 >= 0x555555555555555)
      v16 = 0xAAAAAAAAAAAAAAALL;
    else
      v16 = v15;
    __v.__end_cap_.__value_ = p_end_cap;
    if (v16)
      v17 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)p_end_cap, v16);
    else
      v17 = 0;
    __v.__first_ = v17;
    __v.__begin_ = v17 + v13;
    __v.__end_ = __v.__begin_;
    __v.__end_cap_.__value_ = &v17[v16];
    std::__split_buffer<std::string>::push_back(&__v, __x);
    i = std::vector<std::string>::__swap_out_circular_buffer(this, &__v, i);
    std::__split_buffer<std::string>::~__split_buffer(&__v);
  }
  else if (__position.__i_ == end)
  {
    v18 = *(_OWORD *)&__x->__r_.__value_.__l.__data_;
    __position.__i_->__r_.__value_.__r.__words[2] = __x->__r_.__value_.__r.__words[2];
    *(_OWORD *)&__position.__i_->__r_.__value_.__l.__data_ = v18;
    __x->__r_.__value_.__l.__size_ = 0;
    __x->__r_.__value_.__r.__words[2] = 0;
    __x->__r_.__value_.__r.__words[0] = 0;
    this->__end_ = (std::vector<std::string>::pointer)&__position.__i_[1];
  }
  else
  {
    std::vector<std::string>::__move_range(this, (std::vector<std::string>::pointer)__position.__i_, end, (std::vector<std::string>::pointer)&__position.__i_[1]);
    if (SHIBYTE(i->__r_.__value_.__r.__words[2]) < 0)
      operator delete(i->__r_.__value_.__l.__data_);
    v10 = *(_OWORD *)&__x->__r_.__value_.__l.__data_;
    i->__r_.__value_.__r.__words[2] = __x->__r_.__value_.__r.__words[2];
    *(_OWORD *)&i->__r_.__value_.__l.__data_ = v10;
    *((_BYTE *)&__x->__r_.__value_.__s + 23) = 0;
    __x->__r_.__value_.__s.__data_[0] = 0;
  }
  return (std::vector<std::string>::iterator)i;
}

void sub_220DD981C(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a10);
  _Unwind_Resume(a1);
}

_QWORD *UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForTemplateType@<X0>(int a1@<W1>, _QWORD *a2@<X8>)
{
  char *v2;
  void *exception;

  if (a1)
  {
    if (a1 != 1)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      UC::Exception::InternalCoderError::InternalCoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 0, "Unknown template type", 21);
    }
    v2 = "1";
  }
  else
  {
    v2 = "0";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void sub_220DD98B0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void UC::SUE::UCSegmentedURLEncodingResult::~UCSegmentedURLEncodingResult(UC::SUE::UCSegmentedURLEncodingResult *this)
{
  _QWORD *v2;
  void **v3;
  void **v4;

  v4 = (void **)*((_QWORD *)this + 5);
  v2 = (_QWORD *)((char *)this + 40);
  v3 = v4;
  *v2 = 0;
  if (v4)
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)v2, v3);
  if (*((char *)this + 23) < 0)
    operator delete(*(void **)this);
}

uint64_t UC::SUE::SegmentedURLEncoderImpl::_canEncodeSegmentedPathComponentOrQueryValue(UC::SUE::UCSegmentedURLCoderProvider **a1, uint64_t a2)
{
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;

  UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*a1, &v14);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v14 + 16))(v14, a2) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQuery6BitAlphabetCoder(*a1, &v12);
    v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v12 + 16))(v12, a2);
    v5 = v13;
    if (v13)
    {
      p_shared_owners = (unint64_t *)&v13->__shared_owners_;
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
  v8 = v15;
  if (v15)
  {
    v9 = (unint64_t *)&v15->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  return v4;
}

void sub_220DD99F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

uint64_t UC::SUE::SegmentedURLEncoderImpl::_canEncodeSegmentedQureyParameter(UC::SUE::UCSegmentedURLCoderProvider **a1, std::string *this)
{
  std::string::size_type v4;
  std::string::size_type v5;
  std::string *v6;
  std::string::size_type size;
  char v8;
  char v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::string *v13;
  std::string::size_type v14;
  uint64_t canEncodeSegmentedPathComponentOrQueryValue;
  uint64_t (***v17)(void **, uint64_t *);
  std::__shared_weak_count *v18;
  uint64_t v19[3];
  std::string v20;
  std::string v21;
  void ***v22;

  v4 = std::string::find(this, 61, 0);
  if (v4 == -1)
    return 0;
  v5 = v4;
  std::string::basic_string(&v21, this, 0, v4, (std::allocator<char> *)&v20);
  std::string::basic_string(&v20, this, v5 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)v19);
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v6 = &v21;
  else
    v6 = (std::string *)v21.__r_.__value_.__r.__words[0];
  if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v21.__r_.__value_.__r.__words[2]);
  else
    size = v21.__r_.__value_.__l.__size_;
  UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols((std::string::value_type *)v6, size, v19);
  UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*a1, &v17);
  v8 = (*v17)[2]((void **)v17, v19);
  v9 = v8;
  v10 = v18;
  if (!v18)
    goto LABEL_12;
  p_shared_owners = (unint64_t *)&v18->__shared_owners_;
  do
    v12 = __ldaxr(p_shared_owners);
  while (__stlxr(v12 - 1, p_shared_owners));
  if (!v12)
  {
    ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
    std::__shared_weak_count::__release_weak(v10);
    if ((v9 & 1) != 0)
      goto LABEL_13;
  }
  else
  {
LABEL_12:
    if ((v8 & 1) != 0)
    {
LABEL_13:
      if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v13 = &v20;
      else
        v13 = (std::string *)v20.__r_.__value_.__r.__words[0];
      if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v14 = HIBYTE(v20.__r_.__value_.__r.__words[2]);
      else
        v14 = v20.__r_.__value_.__l.__size_;
      UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols((std::string::value_type *)v13, v14, (uint64_t *)&v17);
      canEncodeSegmentedPathComponentOrQueryValue = UC::SUE::SegmentedURLEncoderImpl::_canEncodeSegmentedPathComponentOrQueryValue(a1, (uint64_t)&v17);
      v22 = (void ***)&v17;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v22);
      goto LABEL_23;
    }
  }
  canEncodeSegmentedPathComponentOrQueryValue = 0;
LABEL_23:
  v17 = (uint64_t (***)(void **, uint64_t *))v19;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v17);
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v20.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
  return canEncodeSegmentedPathComponentOrQueryValue;
}

void sub_220DD9BA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char *a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;
  uint64_t v22;

  *(_QWORD *)(v22 - 40) = v21;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v22 - 40));
  a10 = &a13;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  if (a21 < 0)
    operator delete(__p);
  if (*(char *)(v22 - 41) < 0)
    operator delete(*(void **)(v22 - 64));
  _Unwind_Resume(a1);
}

void UC::SUE::SegmentedURLEncoderImpl::_encodeSegmentedPathOrQueryValueComponent(uint64_t a1@<X0>, int a2@<W1>, const void **a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  char *v13;
  std::string::value_type *v14;
  uint64_t v15;
  int v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  void *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  int v24;
  int v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::__shared_weak_count *v29;
  unint64_t *v30;
  unint64_t v31;
  int v32;
  int v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *p_shared_owners;
  unint64_t v39;
  uint64_t v40;
  int v41;
  unint64_t v42;
  __int128 *p_p;
  uint64_t v44;
  int v45;
  int v47;
  BOOL v48;
  unsigned int v49;
  _BOOL4 v50;
  _BOOL4 v51;
  __int128 *v52;
  uint64_t v53;
  uint64_t v54;
  std::__shared_weak_count *v55;
  __int128 v56;
  uint64_t v57;
  void *v58[2];
  uint64_t v59;
  void *v60[2];
  uint64_t v61;
  std::string v62;
  __int128 v63;
  uint64_t v64;
  __int128 __p;
  uint64_t v66;
  uint64_t v67[3];
  void *v68[2];
  unsigned __int8 v69;
  const void *v70[2];
  char v71;

  if (a5)
    v13 = "|";
  else
    v13 = "";
  std::string::basic_string[abi:ne180100]<0>(v70, v13);
  std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a3, v70, (uint64_t)v68);
  if ((v69 & 0x80u) == 0)
    v14 = (std::string::value_type *)v68;
  else
    v14 = (std::string::value_type *)v68[0];
  if ((v69 & 0x80u) == 0)
    v15 = v69;
  else
    v15 = (uint64_t)v68[1];
  UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols(v14, v15, v67);
  __p = 0uLL;
  v66 = 0;
  UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, &v63);
  v16 = (*(uint64_t (**)(_QWORD, uint64_t *))(*(_QWORD *)v63 + 16))(v63, v67);
  v17 = (std::__shared_weak_count *)*((_QWORD *)&v63 + 1);
  if (*((_QWORD *)&v63 + 1))
  {
    v18 = (unint64_t *)(*((_QWORD *)&v63 + 1) + 8);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (v16)
  {
    UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, v60);
    v20 = v60[0];
    if (*(char *)(a4 + 23) < 0)
      std::string::__init_copy_ctor_external(&v62, *(const std::string::value_type **)a4, *(_QWORD *)(a4 + 8));
    else
      v62 = *(std::string *)a4;
    (*(void (**)(__int128 *__return_ptr, void *, uint64_t *, std::string *))(*(_QWORD *)v20 + 56))(&v63, v20, v67, &v62);
    if (SHIBYTE(v66) < 0)
      operator delete((void *)__p);
    __p = v63;
    v66 = v64;
    HIBYTE(v64) = 0;
    LOBYTE(v63) = 0;
    if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v62.__r_.__value_.__l.__data_);
    v21 = (std::__shared_weak_count *)v60[1];
    if (v60[1])
    {
      v22 = (unint64_t *)((char *)v60[1] + 8);
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
  }
  v63 = 0uLL;
  v64 = 0;
  UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQuery6BitAlphabetCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, v60);
  v24 = (*(uint64_t (**)(void *, uint64_t *))(*(_QWORD *)v60[0] + 16))(v60[0], v67);
  v25 = v24;
  v26 = (std::__shared_weak_count *)v60[1];
  if (!v60[1])
    goto LABEL_32;
  v27 = (unint64_t *)((char *)v60[1] + 8);
  do
    v28 = __ldaxr(v27);
  while (__stlxr(v28 - 1, v27));
  if (!v28)
  {
    ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
    std::__shared_weak_count::__release_weak(v26);
    if (!v25)
      goto LABEL_41;
  }
  else
  {
LABEL_32:
    if (!v24)
      goto LABEL_41;
  }
  UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQuery6BitAlphabetCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, v58);
  (*(void (**)(void **__return_ptr, void *, uint64_t *))(*(_QWORD *)v58[0] + 40))(v60, v58[0], v67);
  if (SHIBYTE(v64) < 0)
    operator delete((void *)v63);
  v63 = *(_OWORD *)v60;
  v64 = v61;
  HIBYTE(v61) = 0;
  LOBYTE(v60[0]) = 0;
  v29 = (std::__shared_weak_count *)v58[1];
  if (v58[1])
  {
    v30 = (unint64_t *)((char *)v58[1] + 8);
    do
      v31 = __ldaxr(v30);
    while (__stlxr(v31 - 1, v30));
    if (!v31)
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
LABEL_41:
  v60[0] = 0;
  v60[1] = 0;
  v61 = 0;
  if ((*(unsigned int (**)(_QWORD, const void **))(**(_QWORD **)(a1 + 16) + 24))(*(_QWORD *)(a1 + 16), a3))
  {
    (*(void (**)(void **__return_ptr, _QWORD, const void **))(**(_QWORD **)(a1 + 16) + 32))(v58, *(_QWORD *)(a1 + 16), a3);
    if (SHIBYTE(v61) < 0)
      operator delete(v60[0]);
    *(_OWORD *)v60 = *(_OWORD *)v58;
    v61 = v59;
  }
  v58[0] = 0;
  v58[1] = 0;
  v59 = 0;
  if (!a2)
  {
    LODWORD(v40) = 1;
    goto LABEL_61;
  }
  UC::SUE::UCSegmentedURLCoderProvider::getKnownWordFixedLengthCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, &v56);
  v32 = (*(uint64_t (**)(_QWORD, const void **))(*(_QWORD *)v56 + 24))(v56, a3);
  v33 = v32;
  v34 = (std::__shared_weak_count *)*((_QWORD *)&v56 + 1);
  if (!*((_QWORD *)&v56 + 1))
    goto LABEL_50;
  v35 = (unint64_t *)(*((_QWORD *)&v56 + 1) + 8);
  do
    v36 = __ldaxr(v35);
  while (__stlxr(v36 - 1, v35));
  if (!v36)
  {
    ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
    std::__shared_weak_count::__release_weak(v34);
    if (v33)
      goto LABEL_51;
  }
  else
  {
LABEL_50:
    if (v32)
    {
LABEL_51:
      UC::SUE::UCSegmentedURLCoderProvider::getKnownWordFixedLengthCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, &v54);
      (*(void (**)(__int128 *__return_ptr, uint64_t, const void **))(*(_QWORD *)v54 + 32))(&v56, v54, a3);
      if (SHIBYTE(v59) < 0)
        operator delete(v58[0]);
      *(_OWORD *)v58 = v56;
      v59 = v57;
      HIBYTE(v57) = 0;
      LOBYTE(v56) = 0;
      v37 = v55;
      if (v55)
      {
        p_shared_owners = (unint64_t *)&v55->__shared_owners_;
        do
          v39 = __ldaxr(p_shared_owners);
        while (__stlxr(v39 - 1, p_shared_owners));
        if (!v39)
        {
          ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
          std::__shared_weak_count::__release_weak(v37);
        }
      }
    }
  }
  LODWORD(v40) = 0;
LABEL_61:
  v41 = HIBYTE(v61);
  if (v61 < 0)
    v41 = (int)v60[1];
  if (v41 < 1 || (v42 = (v41 - a6), v41 - a6 < 0))
  {
    LODWORD(v44) = 0;
    p_p = &__p;
    v42 = 0xFFFFFFFFLL;
    if (!a2)
      goto LABEL_76;
  }
  else
  {
    p_p = (__int128 *)v60;
    LODWORD(v44) = 1;
    if ((a2 & 1) == 0)
    {
      LODWORD(v40) = 1;
      goto LABEL_76;
    }
    LODWORD(v40) = 0;
  }
  v45 = HIBYTE(v59);
  if (v59 < 0)
    v45 = (int)v58[1];
  if (v45 >= 1 && v45 < v42)
  {
    LODWORD(v40) = 0;
    p_p = (__int128 *)v58;
    LODWORD(v44) = 3;
    v42 = v45;
  }
LABEL_76:
  v47 = HIBYTE(v66);
  if (v66 < 0)
    v47 = DWORD2(__p);
  v48 = v47 < 1 || v47 >= v42;
  if (v48)
    v44 = v44;
  else
    v44 = 0;
  if (!v48)
  {
    LODWORD(v40) = a2 ^ 1;
    p_p = &__p;
    v42 = v47;
  }
  v49 = HIBYTE(v64);
  if (v64 < 0)
    v49 = DWORD2(v63);
  v50 = (int)v49 > 0;
  v51 = v42 > v49;
  if (v50 && v51)
    v40 = a2 ^ 1u;
  else
    v40 = v40;
  if (v50 && v51)
    v52 = &v63;
  else
    v52 = p_p;
  v53 = 2;
  if (!v50 || !v51)
    v53 = v44;
  UC::SUE::SegmentedURLEncoderImpl::SegmentedPathOrQueryValueEncodingResult::SegmentedPathOrQueryValueEncodingResult(a7, v53 | (v40 << 32), v52);
  if (SHIBYTE(v59) < 0)
    operator delete(v58[0]);
  if (SHIBYTE(v61) < 0)
    operator delete(v60[0]);
  if (SHIBYTE(v64) < 0)
    operator delete((void *)v63);
  if (SHIBYTE(v66) < 0)
    operator delete((void *)__p);
  *(_QWORD *)&__p = v67;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  if ((char)v69 < 0)
    operator delete(v68[0]);
  if (v71 < 0)
    operator delete((void *)v70[0]);
}

void sub_220DDA1B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  uint64_t v48;

  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a22);
  if (a48 < 0)
    operator delete(__p);
  __p = (void *)(v48 - 152);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  if (*(char *)(v48 - 105) < 0)
    operator delete(*(void **)(v48 - 128));
  if (*(char *)(v48 - 81) < 0)
    operator delete(*(void **)(v48 - 104));
  _Unwind_Resume(a1);
}

void sub_220DDA2CC()
{
  JUMPOUT(0x220DDA2A4);
}

void sub_220DDA2D4()
{
  JUMPOUT(0x220DDA2B4);
}

uint64_t std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>@<X0>(const void **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  size_t v5;
  size_t v6;
  uint64_t result;
  char *v8;
  const void *v9;
  char *v10;
  const void *v11;

  if (*((char *)a1 + 23) >= 0)
    v5 = *((unsigned __int8 *)a1 + 23);
  else
    v5 = (size_t)a1[1];
  if (*((char *)a2 + 23) >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  result = std::string::basic_string[abi:ne180100](a3, v6 + v5);
  if (*(char *)(result + 23) >= 0)
    v8 = (char *)result;
  else
    v8 = *(char **)result;
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0)
      v9 = a1;
    else
      v9 = *a1;
    result = (uint64_t)memmove(v8, v9, v5);
  }
  v10 = &v8[v5];
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0)
      v11 = a2;
    else
      v11 = *a2;
    result = (uint64_t)memmove(v10, v11, v6);
  }
  v10[v6] = 0;
  return result;
}

void UC::SUE::SegmentedURLEncoderImpl::_encodeURLPathComponent(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, int a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  const std::string::value_type *v11;
  std::string::size_type v12;
  std::string *v13;
  void *v14;
  int v15;
  const std::string::value_type *v16;
  std::string::size_type v17;
  std::string *v18;
  __int128 v19;
  void **v20;
  std::string::size_type v21;
  std::string *v22;
  std::string::size_type size;
  std::string::size_type v24;
  int v25;
  size_t v26;
  void **v27;
  const void *v28;
  const std::string::value_type *v29;
  std::string::size_type v30;
  std::string *v31;
  void *v32;
  std::string::size_type v33;
  std::string::size_type v34;
  char v35;
  std::string::size_type v36;
  std::string::size_type v37;
  _DWORD *v38;
  void *v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *exception;
  void *v44;
  void *v45;
  int v46;
  void *v47[2];
  char v48;
  void *v49[2];
  char v50;
  _DWORD v51[2];
  void *v52[2];
  int64_t v53;
  std::string __p;
  uint64_t v55;
  char v56;
  std::string::size_type v57;
  __int128 v58;
  uint64_t v59;
  char v60;
  _QWORD v61[5];

  v61[2] = *MEMORY[0x24BDAC8D0];
  v6 = *(unsigned __int8 *)(a2 + 23);
  if ((v6 & 0x80u) != 0)
    v6 = *(_QWORD *)(a2 + 8);
  if (!v6)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    UC::Exception::InternalCoderError::InternalCoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 0, "Cannot encode empty path", 24);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  UC::SUE::SegmentedURLEncoderImpl::_encodeSegmentedPathOrQueryValueComponent(a1, 1, (const void **)a2, (uint64_t)&__p, a4, 0, (uint64_t)&v57);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (HIDWORD(v57))
    std::__throw_bad_variant_access[abi:ne180100]();
  UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForPathComponentEncodingType(v57, &__p);
  if (v59 >= 0)
    v11 = (const std::string::value_type *)&v58;
  else
    v11 = (const std::string::value_type *)v58;
  if (v59 >= 0)
    v12 = HIBYTE(v59);
  else
    v12 = *((_QWORD *)&v58 + 1);
  v13 = std::string::append(&__p, v11, v12);
  v14 = (void *)v13->__r_.__value_.__r.__words[0];
  v61[0] = v13->__r_.__value_.__l.__size_;
  *(_QWORD *)((char *)v61 + 7) = *(std::string::size_type *)((char *)&v13->__r_.__value_.__r.__words[1] + 7);
  v15 = SHIBYTE(v13->__r_.__value_.__r.__words[2]);
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((a3 & 1) != 0)
      goto LABEL_15;
LABEL_70:
    v42 = v61[0];
    *(_QWORD *)a5 = v14;
    *(_QWORD *)(a5 + 8) = v42;
    *(_QWORD *)(a5 + 15) = *(_QWORD *)((char *)v61 + 7);
    *(_BYTE *)(a5 + 23) = v15;
    goto LABEL_76;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if ((a3 & 1) == 0)
    goto LABEL_70;
LABEL_15:
  v45 = v14;
  v46 = v15;
  std::string::basic_string[abi:ne180100]<0>(v52, "");
  UC::SUE::SegmentedURLEncoderImpl::_encodeSegmentedPathOrQueryValueComponent(a1, 1, (const void **)a2, (uint64_t)v52, 1, 0, (uint64_t)&__p);
  v57 = __p.__r_.__value_.__r.__words[0];
  if (SHIBYTE(v59) < 0)
    operator delete((void *)v58);
  v58 = *(_OWORD *)&__p.__r_.__value_.__r.__words[1];
  v59 = v55;
  HIBYTE(v55) = 0;
  __p.__r_.__value_.__s.__data_[8] = 0;
  v60 = v56;
  if (SHIBYTE(v53) < 0)
    operator delete(v52[0]);
  if (HIDWORD(v57))
    std::__throw_bad_variant_access[abi:ne180100]();
  UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForPathComponentEncodingType(v57, &__p);
  if (v59 >= 0)
    v16 = (const std::string::value_type *)&v58;
  else
    v16 = (const std::string::value_type *)v58;
  if (v59 >= 0)
    v17 = HIBYTE(v59);
  else
    v17 = *((_QWORD *)&v58 + 1);
  v18 = std::string::append(&__p, v16, v17);
  v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  v53 = v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)v52 = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  std::string::basic_string[abi:ne180100]<0>(&__p, "10");
  if (v53 >= 0)
    v20 = v52;
  else
    v20 = (void **)v52[0];
  if (v53 >= 0)
    v21 = HIBYTE(v53);
  else
    v21 = (std::string::size_type)v52[1];
  v22 = std::string::insert(&__p, 0, (const std::string::value_type *)v20, v21);
  size = v22->__r_.__value_.__l.__size_;
  v44 = (void *)v22->__r_.__value_.__r.__words[0];
  v51[0] = v22->__r_.__value_.__r.__words[2];
  *(_DWORD *)((char *)v51 + 3) = *(_DWORD *)((char *)&v22->__r_.__value_.__r.__words[2] + 3);
  v24 = HIBYTE(v22->__r_.__value_.__r.__words[2]);
  v25 = (char)v24;
  v22->__r_.__value_.__r.__words[0] = 0;
  v22->__r_.__value_.__l.__size_ = 0;
  v22->__r_.__value_.__r.__words[2] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (*(char *)(a2 + 23) >= 0)
    v26 = *(unsigned __int8 *)(a2 + 23);
  else
    v26 = *(_QWORD *)(a2 + 8);
  v27 = v49;
  std::string::basic_string[abi:ne180100]((uint64_t)v49, v26 + 1);
  if (v50 < 0)
    v27 = (void **)v49[0];
  if (v26)
  {
    if (*(char *)(a2 + 23) >= 0)
      v28 = (const void *)a2;
    else
      v28 = *(const void **)a2;
    memmove(v27, v28, v26);
  }
  *(_WORD *)((char *)v27 + v26) = 47;
  std::string::basic_string[abi:ne180100]<0>(v47, "");
  UC::SUE::SegmentedURLEncoderImpl::_encodeSegmentedPathOrQueryValueComponent(a1, 1, (const void **)v49, (uint64_t)v47, a4, 0, (uint64_t)&__p);
  v57 = __p.__r_.__value_.__r.__words[0];
  if (SHIBYTE(v59) < 0)
    operator delete((void *)v58);
  v58 = *(_OWORD *)&__p.__r_.__value_.__r.__words[1];
  v59 = v55;
  HIBYTE(v55) = 0;
  __p.__r_.__value_.__s.__data_[8] = 0;
  v60 = v56;
  if (v48 < 0)
    operator delete(v47[0]);
  if (HIDWORD(v57))
    std::__throw_bad_variant_access[abi:ne180100]();
  UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForPathComponentEncodingType(v57, &__p);
  if (v59 >= 0)
    v29 = (const std::string::value_type *)&v58;
  else
    v29 = (const std::string::value_type *)v58;
  if (v59 >= 0)
    v30 = HIBYTE(v59);
  else
    v30 = *((_QWORD *)&v58 + 1);
  v31 = std::string::append(&__p, v29, v30);
  v32 = (void *)v31->__r_.__value_.__r.__words[0];
  v33 = v31->__r_.__value_.__l.__size_;
  LODWORD(v47[0]) = v31->__r_.__value_.__r.__words[2];
  *(_DWORD *)((char *)v47 + 3) = *(_DWORD *)((char *)&v31->__r_.__value_.__r.__words[2] + 3);
  v34 = HIBYTE(v31->__r_.__value_.__r.__words[2]);
  v35 = HIBYTE(v31->__r_.__value_.__r.__words[2]);
  v31->__r_.__value_.__r.__words[0] = 0;
  v31->__r_.__value_.__l.__size_ = 0;
  v31->__r_.__value_.__r.__words[2] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if ((v24 & 0x80u) == 0)
    v36 = v24;
  else
    v36 = size;
  if ((v34 & 0x80u) == 0)
    v37 = v34;
  else
    v37 = v33;
  v38 = (_DWORD *)(a5 + 16);
  if (v36 >= v37)
  {
    *(_QWORD *)a5 = v32;
    *(_QWORD *)(a5 + 8) = v33;
    v41 = v46;
    *v38 = v47[0];
    *(_DWORD *)(a5 + 19) = *(_DWORD *)((char *)v47 + 3);
    *(_BYTE *)(a5 + 23) = v35;
    v40 = v44;
    v39 = v45;
  }
  else
  {
    *(_QWORD *)a5 = v44;
    *(_QWORD *)(a5 + 8) = size;
    *v38 = v51[0];
    *(_DWORD *)(a5 + 19) = *(_DWORD *)((char *)v51 + 3);
    *(_BYTE *)(a5 + 23) = v24;
    v39 = v45;
    if ((char)v34 < 0)
      operator delete(v32);
    v25 = 0;
    v40 = 0;
    v41 = v46;
  }
  if (v50 < 0)
  {
    operator delete(v49[0]);
    if ((v25 & 0x80000000) == 0)
      goto LABEL_74;
  }
  else if ((v25 & 0x80000000) == 0)
  {
    goto LABEL_74;
  }
  operator delete(v40);
LABEL_74:
  if (SHIBYTE(v53) < 0)
  {
    operator delete(v52[0]);
    if ((v41 & 0x80000000) == 0)
      goto LABEL_76;
  }
  else if ((v41 & 0x80000000) == 0)
  {
    goto LABEL_76;
  }
  operator delete(v39);
LABEL_76:
  if (SHIBYTE(v59) < 0)
    operator delete((void *)v58);
}

void sub_220DDA8BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, int a11, int a12, uint64_t a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46)
{
  int v46;

  if (a37 < 0)
    operator delete(__p);
  if (a24 < 0)
    operator delete(a19);
  if (v46 < 0)
    operator delete(a9);
  if (a31 < 0)
    operator delete(a26);
  if (a12 < 0)
    operator delete(a10);
  if (a46 < 0)
    operator delete(a41);
  _Unwind_Resume(exception_object);
}

void UC::Exception::InternalCoderError::~InternalCoderError(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)off_24E6B2578;
  if (SHIBYTE(this[7].__vftable) < 0)
    operator delete(this[5].__vftable);
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
}

{
  void *v2;

  this->__vftable = (std::exception_vtbl *)off_24E6B2578;
  if (SHIBYTE(this[7].__vftable) < 0)
    operator delete(this[5].__vftable);
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
  operator delete(v2);
}

_QWORD *UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForPathComponentEncodingType@<X0>(unsigned int a1@<W1>, _QWORD *a2@<X8>)
{
  void *exception;

  if (a1 >= 4)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    UC::Exception::InternalCoderError::InternalCoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 0, "Unknown path component type", 27);
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, off_24E6B25D0[a1]);
}

void sub_220DDAA98(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void UC::SUE::SegmentedURLEncoderImpl::_encodeSegmentedQueryComponent(std::string *this@<X1>, UC::SUE::UCSegmentedURLCoderProvider **a2@<X0>, int a3@<W2>, uint64_t a4@<X8>)
{
  std::string::size_type v8;
  char *v9;
  std::string *v10;
  std::string::size_type size;
  std::string *v12;
  __int128 v13;
  std::string::value_type *v14;
  uint64_t v15;
  std::string::size_type v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::string::value_type *v20;
  uint64_t v21;
  std::string::size_type v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  const std::string::value_type *v32;
  std::string::size_type v33;
  std::string *v34;
  __int128 v35;
  const std::string::value_type *v36;
  std::string::size_type v37;
  const std::string::value_type *v38;
  std::string::size_type v39;
  std::string *v40;
  __int128 v41;
  std::string *v42;
  std::string::size_type v43;
  int v44;
  std::string v45;
  std::string v46;
  std::string v47;
  unsigned __int8 v48;
  void *v49[2];
  char v50;
  void *v51;
  std::string::size_type v52;
  unsigned __int8 v53;
  void *__p[2];
  char v55;
  void *v56;
  std::string::size_type v57;
  unsigned __int8 v58;
  std::vector<std::string> v59;
  __int128 v60;
  int64_t v61;
  void *v62[2];
  unsigned __int8 v63;
  const void *v64[2];
  char v65;
  std::string v66;
  std::string v67;

  v8 = std::string::find(this, 61, 0);
  std::string::basic_string(&v67, this, 0, v8, (std::allocator<char> *)&v47);
  std::string::basic_string(&v66, this, v8 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v47);
  if (a3)
    v9 = "|";
  else
    v9 = "";
  std::string::basic_string[abi:ne180100]<0>(v64, v9);
  std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)&v67.__r_.__value_.__l.__data_, v64, (uint64_t)v62);
  std::string::basic_string[abi:ne180100]<0>(&v47, "|");
  if ((v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v10 = &v67;
  else
    v10 = (std::string *)v67.__r_.__value_.__r.__words[0];
  if ((v67.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v67.__r_.__value_.__r.__words[2]);
  else
    size = v67.__r_.__value_.__l.__size_;
  v12 = std::string::insert(&v47, 0, (const std::string::value_type *)v10, size);
  v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  v61 = v12->__r_.__value_.__r.__words[2];
  v60 = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v47.__r_.__value_.__l.__data_);
  if ((v63 & 0x80u) == 0)
    v14 = (std::string::value_type *)v62;
  else
    v14 = (std::string::value_type *)v62[0];
  if ((v63 & 0x80u) == 0)
    v15 = v63;
  else
    v15 = (uint64_t)v62[1];
  UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols(v14, v15, (uint64_t *)&v59);
  UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*a2, &v47);
  v16 = v47.__r_.__value_.__r.__words[0];
  std::string::basic_string[abi:ne180100]<0>(__p, "?");
  (*(void (**)(void **__return_ptr, std::string::size_type, std::vector<std::string> *, void **))(*(_QWORD *)v16 + 56))(&v56, v16, &v59, __p);
  if (v55 < 0)
    operator delete(__p[0]);
  v17 = (std::__shared_weak_count *)v47.__r_.__value_.__l.__size_;
  if (v47.__r_.__value_.__l.__size_)
  {
    v18 = (unint64_t *)(v47.__r_.__value_.__l.__size_ + 8);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (v61 >= 0)
    v20 = (std::string::value_type *)&v60;
  else
    v20 = (std::string::value_type *)v60;
  if (v61 >= 0)
    v21 = HIBYTE(v61);
  else
    v21 = *((_QWORD *)&v60 + 1);
  UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols(v20, v21, (uint64_t *)&v47);
  std::vector<std::string>::__vdeallocate(&v59);
  v59 = (std::vector<std::string>)v47;
  memset(&v47, 0, sizeof(v47));
  v51 = &v47;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v51);
  UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*a2, &v47);
  v22 = v47.__r_.__value_.__r.__words[0];
  std::string::basic_string[abi:ne180100]<0>(v49, "?");
  (*(void (**)(void **__return_ptr, std::string::size_type, std::vector<std::string> *, void **))(*(_QWORD *)v22 + 56))(&v51, v22, &v59, v49);
  if (v50 < 0)
    operator delete(v49[0]);
  v23 = (std::__shared_weak_count *)v47.__r_.__value_.__l.__size_;
  if (v47.__r_.__value_.__l.__size_)
  {
    v24 = (unint64_t *)(v47.__r_.__value_.__l.__size_ + 8);
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v26 = v53;
  v27 = v52;
  v28 = v58;
  v29 = v57;
  std::string::basic_string[abi:ne180100]<0>(&v46, "=");
  if ((v26 & 0x80u) == 0)
    v30 = v26;
  else
    v30 = v27;
  if ((v28 & 0x80u) == 0)
    v31 = v28;
  else
    v31 = v29;
  UC::SUE::SegmentedURLEncoderImpl::_encodeSegmentedPathOrQueryValueComponent((uint64_t)a2, 0, (const void **)&v66.__r_.__value_.__l.__data_, (uint64_t)&v46, a3, v30 - v31, (uint64_t)&v47);
  if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v46.__r_.__value_.__l.__data_);
  *(_QWORD *)a4 = 0;
  *(_QWORD *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = 0;
  if (HIDWORD(v47.__r_.__value_.__r.__words[0]) != 1)
    std::__throw_bad_variant_access[abi:ne180100]();
  if (LODWORD(v47.__r_.__value_.__l.__data_) == 1)
  {
    std::string::basic_string[abi:ne180100]<0>(&v45, "01");
    if ((v48 & 0x80u) == 0)
      v32 = &v47.__r_.__value_.__s.__data_[8];
    else
      v32 = (const std::string::value_type *)v47.__r_.__value_.__l.__size_;
    if ((v48 & 0x80u) == 0)
      v33 = v48;
    else
      v33 = v47.__r_.__value_.__r.__words[2];
    v34 = std::string::append(&v45, v32, v33);
    v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
    v46.__r_.__value_.__r.__words[2] = v34->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v46.__r_.__value_.__l.__data_ = v35;
    v34->__r_.__value_.__l.__size_ = 0;
    v34->__r_.__value_.__r.__words[2] = 0;
    v34->__r_.__value_.__r.__words[0] = 0;
    if ((v58 & 0x80u) == 0)
      v36 = (const std::string::value_type *)&v56;
    else
      v36 = (const std::string::value_type *)v56;
    if ((v58 & 0x80u) == 0)
      v37 = v58;
    else
      v37 = v57;
  }
  else
  {
    UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForQueryComponentEncodingType(v47.__r_.__value_.__l.__data_, &v45);
    if ((v53 & 0x80u) == 0)
      v38 = (const std::string::value_type *)&v51;
    else
      v38 = (const std::string::value_type *)v51;
    if ((v53 & 0x80u) == 0)
      v39 = v53;
    else
      v39 = v52;
    v40 = std::string::append(&v45, v38, v39);
    v41 = *(_OWORD *)&v40->__r_.__value_.__l.__data_;
    v46.__r_.__value_.__r.__words[2] = v40->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v46.__r_.__value_.__l.__data_ = v41;
    v40->__r_.__value_.__l.__size_ = 0;
    v40->__r_.__value_.__r.__words[2] = 0;
    v40->__r_.__value_.__r.__words[0] = 0;
    if ((v48 & 0x80u) == 0)
      v36 = &v47.__r_.__value_.__s.__data_[8];
    else
      v36 = (const std::string::value_type *)v47.__r_.__value_.__l.__size_;
    if ((v48 & 0x80u) == 0)
      v37 = v48;
    else
      v37 = v47.__r_.__value_.__r.__words[2];
  }
  v42 = std::string::append(&v46, v36, v37);
  v43 = v42->__r_.__value_.__l.__size_;
  *(_QWORD *)a4 = v42->__r_.__value_.__r.__words[0];
  *(_QWORD *)(a4 + 8) = v43;
  *(_QWORD *)(a4 + 15) = *(std::string::size_type *)((char *)&v42->__r_.__value_.__r.__words[1] + 7);
  LOBYTE(v43) = *((_BYTE *)&v42->__r_.__value_.__s + 23);
  v42->__r_.__value_.__l.__size_ = 0;
  v42->__r_.__value_.__r.__words[2] = 0;
  v42->__r_.__value_.__r.__words[0] = 0;
  v44 = SHIBYTE(v46.__r_.__value_.__r.__words[2]);
  *(_BYTE *)(a4 + 23) = v43;
  if (v44 < 0)
    operator delete(v46.__r_.__value_.__l.__data_);
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);
  if ((char)v48 < 0)
    operator delete((void *)v47.__r_.__value_.__l.__size_);
  if ((char)v53 < 0)
    operator delete(v51);
  if ((char)v58 < 0)
    operator delete(v56);
  v47.__r_.__value_.__r.__words[0] = (std::string::size_type)&v59;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
  if (SHIBYTE(v61) < 0)
    operator delete((void *)v60);
  if ((char)v63 < 0)
    operator delete(v62[0]);
  if (v65 < 0)
    operator delete((void *)v64[0]);
  if (SHIBYTE(v66.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v66.__r_.__value_.__l.__data_);
  if (SHIBYTE(v67.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v67.__r_.__value_.__l.__data_);
}

void sub_220DDAF90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char *a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,void *a44,uint64_t a45,int a46,__int16 a47,char a48,char a49,void *a50,uint64_t a51,int a52,__int16 a53,char a54,char a55,char a56)
{
  uint64_t v56;

  if (a21 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  if (a29 < 0)
    operator delete(a24);
  if (a43 < 0)
    operator delete(a38);
  if (a55 < 0)
    operator delete(a50);
  a23 = &a56;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a23);
  if (*(char *)(v56 - 169) < 0)
    operator delete(*(void **)(v56 - 192));
  if (*(char *)(v56 - 137) < 0)
    operator delete(*(void **)(v56 - 160));
  if (*(char *)(v56 - 113) < 0)
    operator delete(*(void **)(v56 - 136));
  if (*(char *)(v56 - 89) < 0)
    operator delete(*(void **)(v56 - 112));
  if (*(char *)(v56 - 65) < 0)
    operator delete(*(void **)(v56 - 88));
  _Unwind_Resume(a1);
}

void sub_220DDB0EC()
{
  JUMPOUT(0x220DDB094);
}

void sub_220DDB0F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0)
    JUMPOUT(0x220DDB0A0);
  JUMPOUT(0x220DDB0A4);
}

void sub_220DDB108()
{
  JUMPOUT(0x220DDB0A4);
}

void sub_220DDB110()
{
  JUMPOUT(0x220DDB0B4);
}

void sub_220DDB118()
{
  JUMPOUT(0x220DDB0C4);
}

void sub_220DDB120()
{
  JUMPOUT(0x220DDB0D4);
}

_QWORD *UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForQueryComponentEncodingType@<X0>(unsigned int a1@<W1>, _QWORD *a2@<X8>)
{
  void *exception;

  if (a1 >= 3)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    UC::Exception::InternalCoderError::InternalCoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 0, "Unknown query component type", 28);
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, off_24E6B2608[a1]);
}

void sub_220DDB19C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void UC::SUE::SegmentedURLEncoderImpl::_filterByComponentsToKeep(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  __int128 *v9;
  __int128 v10;
  std::string::size_type size;
  char v12;
  unint64_t v13;
  __int128 v14;
  uint64_t v15;
  std::string __s;

  v3 = a2[1] - *a2;
  if (v3)
  {
    v6 = 0;
    v7 = v3 / 24;
    if (v7 <= 1)
      v8 = 1;
    else
      v8 = v7;
    do
    {
      v9 = (__int128 *)(*a2 + v6);
      if (*((char *)v9 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&__s, *(const std::string::value_type **)v9, *((_QWORD *)v9 + 1));
      }
      else
      {
        v10 = *v9;
        __s.__r_.__value_.__r.__words[2] = *((_QWORD *)v9 + 2);
        *(_OWORD *)&__s.__r_.__value_.__l.__data_ = v10;
      }
      size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
      v12 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
      if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        size = __s.__r_.__value_.__l.__size_;
      if (size)
      {
        v13 = a3[1];
        if (v13 >= a3[2])
        {
          v15 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a3, (__int128 *)&__s);
        }
        else
        {
          if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)a3[1], __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
          }
          else
          {
            v14 = *(_OWORD *)&__s.__r_.__value_.__l.__data_;
            *(_QWORD *)(v13 + 16) = *((_QWORD *)&__s.__r_.__value_.__l + 2);
            *(_OWORD *)v13 = v14;
          }
          v15 = v13 + 24;
          a3[1] = v13 + 24;
        }
        a3[1] = v15;
        v12 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
      }
      if (v12 < 0)
        operator delete(__s.__r_.__value_.__l.__data_);
      v6 += 24;
      --v8;
    }
    while (v8);
  }
}

void sub_220DDB2C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(v14 + 8) = v15;
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t UC::SUE::SegmentedURLEncoderImpl::_pathAndQueryMatchPathWordBookAndAutoQueryTemplateFormat(UC::SUE::UCSegmentedURLCoderProvider **a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  const std::string *v23;
  const std::string *v24;
  uint64_t v25;
  std::string::size_type v26;
  std::string::size_type v27;
  std::string *p_str;
  std::string::size_type size;
  std::string *p_p;
  std::string *v31;
  std::string *v32;
  int v33;
  int v34;
  std::string __p;
  std::string v36;
  std::string __str;
  const std::string *v38;
  void **v39;
  uint64_t v40;
  void ***v41;
  std::__shared_weak_count *v42;
  uint64_t v43;
  void **v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;

  v3 = a3;
  v5 = *((unsigned __int8 *)a2 + 23);
  v6 = a2[1];
  if ((v5 & 0x80u) == 0)
    v7 = *((unsigned __int8 *)a2 + 23);
  else
    v7 = a2[1];
  if (v7 >= 2)
  {
    v8 = (v5 & 0x80u) == 0 ? (uint64_t)a2 : *a2;
    if (*(_BYTE *)(v7 + v8 - 1) == 47)
      return 0;
  }
  if ((v5 & 0x80) != 0)
  {
    if (v6 != 1)
    {
      v47 = 0;
      v48 = 0;
      v49 = 0;
      goto LABEL_22;
    }
    v9 = (_BYTE *)*a2;
    goto LABEL_14;
  }
  v9 = a2;
  if ((_DWORD)v5 == 1)
  {
LABEL_14:
    if (*v9 != 47)
      goto LABEL_18;
    v10 = *((unsigned __int8 *)a3 + 23);
    if ((v10 & 0x80u) != 0)
      v10 = a3[1];
    if (v10)
    {
LABEL_18:
      v47 = 0;
      v48 = 0;
      v49 = 0;
      if ((v5 & 0x80) == 0)
        goto LABEL_23;
LABEL_22:
      a2 = (uint64_t *)*a2;
      v5 = v6;
      goto LABEL_23;
    }
    return 0;
  }
  v47 = 0;
  v48 = 0;
  v49 = 0;
LABEL_23:
  UC::SplitString((unsigned __int8 *)a2, v5, 0x2Fu, &v47);
  v44 = 0;
  v45 = 0;
  v46 = 0;
  UC::SUE::SegmentedURLEncoderImpl::_filterByComponentsToKeep(v12, &v47, (uint64_t *)&v44);
  if (0xAAAAAAAAAAAAAAABLL * ((v45 - (uint64_t)v44) >> 3) > 1)
    goto LABEL_24;
  if (v45 - (_QWORD)v44 == 24)
  {
    UC::SUE::UCSegmentedURLCoderProvider::getKnownWordFixedLengthCoder(*a1, &v41);
    v14 = ((uint64_t (*)(void ***, void **))(*v41)[3])(v41, v44);
    v15 = v42;
    if (v42)
    {
      p_shared_owners = (unint64_t *)&v42->__shared_owners_;
      do
        v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    if ((v14 & 1) == 0)
      goto LABEL_24;
  }
  v18 = *((unsigned __int8 *)v3 + 23);
  if ((*((char *)v3 + 23) & 0x80000000) == 0)
  {
    if (*((_BYTE *)v3 + 23))
    {
      v19 = *((unsigned __int8 *)v3 + 23);
      goto LABEL_38;
    }
LABEL_41:
    v11 = 1;
    goto LABEL_25;
  }
  v19 = v3[1];
  if (!v19)
    goto LABEL_41;
LABEL_38:
  v20 = v19 - 1;
  if ((v18 & 0x80) != 0)
  {
    v21 = (uint64_t *)*v3;
    if (*(_BYTE *)(*v3 + v20) != 38)
    {
      v41 = 0;
      v42 = 0;
      v18 = v3[1];
      v3 = v21;
      goto LABEL_44;
    }
LABEL_24:
    v11 = 0;
    goto LABEL_25;
  }
  if (*((_BYTE *)v3 + v20) == 38)
    goto LABEL_24;
  v41 = 0;
  v42 = 0;
LABEL_44:
  v43 = 0;
  UC::SplitString((unsigned __int8 *)v3, v18, 0x26u, (uint64_t *)&v41);
  v38 = 0;
  v39 = 0;
  v40 = 0;
  UC::SUE::SegmentedURLEncoderImpl::_filterByComponentsToKeep(v22, &v41, (uint64_t *)&v38);
  v23 = v38;
  v24 = (const std::string *)v39;
  if (v38 == (const std::string *)v39)
  {
LABEL_88:
    v11 = 1;
    goto LABEL_90;
  }
  v25 = 0;
  while (1)
  {
    v26 = std::string::find(v23, 61, 0);
    if (v26 == -1)
      break;
    v27 = v26;
    std::string::basic_string(&__str, v23, 0, v26, (std::allocator<char> *)&v36);
    std::string::basic_string(&v36, v23, v27 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&__p);
    if ((*((_BYTE *)&__str.__r_.__value_.__s + 23) & 0x80) != 0)
    {
      if (!__str.__r_.__value_.__l.__size_)
        goto LABEL_73;
      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    else
    {
      if (!*((_BYTE *)&__str.__r_.__value_.__s + 23))
        goto LABEL_73;
      p_str = &__str;
    }
    if (p_str->__r_.__value_.__s.__data_[0] != 112)
      goto LABEL_73;
    if (!v25)
    {
      if ((*((_BYTE *)&__str.__r_.__value_.__s + 23) & 0x80) != 0)
      {
        if (__str.__r_.__value_.__l.__size_ == 1)
        {
          v31 = (std::string *)__str.__r_.__value_.__r.__words[0];
          goto LABEL_70;
        }
      }
      else if (HIBYTE(__str.__r_.__value_.__r.__words[2]) == 1)
      {
        v31 = &__str;
LABEL_70:
        if (v31->__r_.__value_.__s.__data_[0] == 112)
        {
          v33 = 3;
          v25 = 1;
          goto LABEL_74;
        }
      }
      v25 = 0;
LABEL_73:
      v33 = 1;
      goto LABEL_74;
    }
    std::string::basic_string(&__p, &__str, 1uLL, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v50);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      size = __p.__r_.__value_.__l.__size_;
      if (!__p.__r_.__value_.__l.__size_)
      {
        v33 = 1;
LABEL_87:
        operator delete(__p.__r_.__value_.__l.__data_);
        goto LABEL_74;
      }
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    else
    {
      size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      if (!*((_BYTE *)&__p.__r_.__value_.__s + 23))
        goto LABEL_73;
      p_p = &__p;
    }
    if ((UC::IsAllDigits((unsigned __int8 *)p_p, size) & 1) == 0)
      goto LABEL_66;
    v32 = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v32 = &__p;
    if (v32->__r_.__value_.__s.__data_[0] == 48)
    {
LABEL_66:
      v33 = 1;
      if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) == 0)
        goto LABEL_74;
      goto LABEL_87;
    }
    v34 = std::stoi(&__p, 0, 10);
    v33 = v25 != v34;
    if (v25 == v34)
      ++v25;
    if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) != 0)
      goto LABEL_87;
LABEL_74:
    if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v36.__r_.__value_.__l.__data_);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__str.__r_.__value_.__l.__data_);
    if (v33 != 3 && v33)
      break;
    if (++v23 == v24)
      goto LABEL_88;
  }
  v11 = 0;
LABEL_90:
  __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&v38;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__str);
  v38 = (const std::string *)&v41;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v38);
LABEL_25:
  v41 = &v44;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v41);
  v44 = (void **)&v47;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v44);
  return v11;
}

void sub_220DDB71C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t **a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t *a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v30;

  if (a14 < 0)
    operator delete(__p);
  if (a20 < 0)
    operator delete(a15);
  if (a26 < 0)
    operator delete(a21);
  a21 = &a27;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a21);
  a27 = &a30;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a27);
  a30 = v30 - 104;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a30);
  *(_QWORD *)(v30 - 104) = v30 - 80;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v30 - 104));
  _Unwind_Resume(a1);
}

void UC::SUE::SegmentedURLEncoderImpl::_encodePathWordBookAndAutoQueryTemplateQueryComponent(std::string *this@<X1>, uint64_t a2@<X0>, int a3@<W2>, std::string *a4@<X8>)
{
  std::string::size_type v8;
  void **v9;
  std::string::size_type v10;
  std::string *v11;
  std::string __p;
  unsigned int v13[2];
  void *v14[2];
  unsigned __int8 v15;
  std::string v16;

  v8 = std::string::find(this, 61, 0);
  std::string::basic_string(&v16, this, v8 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)v13);
  std::string::basic_string[abi:ne180100]<0>(&__p, "=");
  UC::SUE::SegmentedURLEncoderImpl::_encodeSegmentedPathOrQueryValueComponent(a2, 0, (const void **)&v16.__r_.__value_.__l.__data_, (uint64_t)&__p, a3, 0, (uint64_t)v13);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v13[1] != 1)
    std::__throw_bad_variant_access[abi:ne180100]();
  UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForQueryComponentEncodingType(v13[0], &__p);
  if ((v15 & 0x80u) == 0)
    v9 = v14;
  else
    v9 = (void **)v14[0];
  if ((v15 & 0x80u) == 0)
    v10 = v15;
  else
    v10 = (std::string::size_type)v14[1];
  v11 = std::string::append(&__p, (const std::string::value_type *)v9, v10);
  *a4 = *v11;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if ((char)v15 < 0)
    operator delete(v14[0]);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v16.__r_.__value_.__l.__data_);
}

void sub_220DDB914(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  uint64_t v22;

  if (a15 < 0)
    operator delete(__p);
  if (a22 < 0)
    operator delete(a17);
  if (*(char *)(v22 - 33) < 0)
    operator delete(*(void **)(v22 - 56));
  _Unwind_Resume(exception_object);
}

_QWORD *UC::SUE::SegmentedURLDecoderImpl::SegmentedURLDecoderImpl(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  _QWORD *v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  a1[2] = 0;
  v6 = operator new(8uLL);
  *v6 = &unk_24E6B2630;
  a1[2] = v6;
  return a1;
}

void sub_220DDB9D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = 0;
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t UC::SUE::SegmentedURLDecoderImpl::_decodeHostFormatType(UC::SUE::SegmentedURLDecoderImpl *this, UC::UCBitStream *a2)
{
  uint64_t result;

  result = UC::UCBitStream::readNextBit(a2);
  if ((_DWORD)result)
  {
    if (UC::UCBitStream::readNextBit(a2))
      return 2;
    else
      return 1;
  }
  return result;
}

uint64_t UC::SUE::SegmentedURLDecoderImpl::_decodeQueryComponentEncodingType(UC::SUE::SegmentedURLDecoderImpl *this, UC::UCBitStream *a2)
{
  int NextBit;
  int v4;
  void *exception;

  NextBit = UC::UCBitStream::readNextBit(a2);
  v4 = UC::UCBitStream::readNextBit(a2);
  if (!NextBit)
    return v4 != 0;
  if (v4)
  {
    exception = __cxa_allocate_exception(0x38uLL);
    UC::Exception::InvalidDecodingInstruction::InvalidDecodingInstruction(exception, "11", 2, "Encountered an invalid instruction (11) for query component decoding.", 69);
  }
  return 2;
}

void sub_220DDBAB4(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void UC::Exception::InvalidDecodingInstruction::~InvalidDecodingInstruction(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)off_24E6B25B8;
  if (SHIBYTE(this[6].__vftable) < 0)
    operator delete(this[4].__vftable);
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
}

{
  void *v2;

  this->__vftable = (std::exception_vtbl *)off_24E6B25B8;
  if (SHIBYTE(this[6].__vftable) < 0)
    operator delete(this[4].__vftable);
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
  operator delete(v2);
}

void UC::SUE::SegmentedURLDecoderImpl::decodeURL(UC::SUE::UCSegmentedURLCoderProvider **this@<X0>, UC::UCBitStream *a2@<X1>, std::string *a3@<X8>)
{
  int NextBit;
  UC::SUE::SegmentedURLDecoderImpl *v7;
  int v8;
  int v9;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v14;
  const std::string::value_type *p_p;
  std::string::size_type v16;
  std::__shared_weak_count *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  unint64_t *v20;
  uint64_t v21;
  const std::string::value_type *v22;
  std::string::size_type v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  const std::string::value_type *v27;
  std::string::size_type v28;
  std::string *v29;
  std::string::size_type size;
  const std::string::value_type *v31;
  std::string::size_type v32;
  void *v33[2];
  char v34;
  void *v35[2];
  char v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  void *v39;
  std::__shared_weak_count *v40;
  unsigned __int8 v41;
  void *__p;
  std::__shared_weak_count *v43;
  unsigned __int8 v44;
  std::string v45;

  if (!UC::UCBitStream::hasMore(a2))
  {
    std::string::basic_string[abi:ne180100]<0>(a3, "");
    return;
  }
  NextBit = UC::UCBitStream::readNextBit(a2);
  v7 = (UC::SUE::SegmentedURLDecoderImpl *)UC::UCBitStream::readNextBit(a2);
  v8 = (int)v7;
  v9 = UC::SUE::SegmentedURLDecoderImpl::_decodeHostFormatType(v7, a2);
  std::string::basic_string[abi:ne180100]<0>(a3, "https://");
  memset(&v45, 0, sizeof(v45));
  if (v8)
    std::string::append(&v45, "appclip.");
  switch(v9)
  {
    case 2:
      UC::SUE::UCSegmentedURLCoderProvider::getHostCoder(*this, &v39);
      v14 = v39;
      std::string::basic_string[abi:ne180100]<0>(v33, "|");
      (*(void (**)(void **__return_ptr, void *, UC::UCBitStream *, void **))(*(_QWORD *)v14 + 48))(&__p, v14, a2, v33);
      if ((v44 & 0x80u) == 0)
        p_p = (const std::string::value_type *)&__p;
      else
        p_p = (const std::string::value_type *)__p;
      if ((v44 & 0x80u) == 0)
        v16 = v44;
      else
        v16 = (std::string::size_type)v43;
      std::string::append(&v45, p_p, v16);
      if ((char)v44 < 0)
        operator delete(__p);
      if (v34 < 0)
        operator delete(v33[0]);
      v17 = v40;
      if (v40)
      {
        p_shared_owners = (unint64_t *)&v40->__shared_owners_;
        do
          v19 = __ldaxr(p_shared_owners);
        while (__stlxr(v19 - 1, p_shared_owners));
        if (!v19)
        {
          ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
          std::__shared_weak_count::__release_weak(v17);
        }
      }
      break;
    case 1:
      UC::SUE::UCSegmentedURLCoderProvider::getTLDFixedLengthCoder(*this, &__p);
      v10 = __p;
      v11 = v43;
      if (v43)
      {
        v20 = (unint64_t *)&v43->__shared_owners_;
        do
          v13 = __ldaxr(v20);
        while (__stlxr(v13 - 1, v20));
LABEL_30:
        if (!v13)
        {
          ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
          std::__shared_weak_count::__release_weak(v11);
        }
      }
LABEL_32:
      (*(void (**)(void **__return_ptr, void *, UC::UCBitStream *))(*(_QWORD *)v10 + 56))(&__p, v10, a2);
      UC::SUE::UCSegmentedURLCoderProvider::getHostCoder(*this, &v37);
      v21 = v37;
      std::string::basic_string[abi:ne180100]<0>(v35, "|");
      (*(void (**)(void **__return_ptr, uint64_t, UC::UCBitStream *, void **))(*(_QWORD *)v21 + 48))(&v39, v21, a2, v35);
      if ((v41 & 0x80u) == 0)
        v22 = (const std::string::value_type *)&v39;
      else
        v22 = (const std::string::value_type *)v39;
      if ((v41 & 0x80u) == 0)
        v23 = v41;
      else
        v23 = (std::string::size_type)v40;
      std::string::append(&v45, v22, v23);
      if ((char)v41 < 0)
        operator delete(v39);
      if (v36 < 0)
        operator delete(v35[0]);
      v24 = v38;
      if (v38)
      {
        v25 = (unint64_t *)&v38->__shared_owners_;
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }
      if ((v44 & 0x80u) == 0)
        v27 = (const std::string::value_type *)&__p;
      else
        v27 = (const std::string::value_type *)__p;
      if ((v44 & 0x80u) == 0)
        v28 = v44;
      else
        v28 = (std::string::size_type)v43;
      std::string::append(&v45, v27, v28);
      if ((char)v44 < 0)
        operator delete(__p);
      break;
    case 0:
      UC::SUE::UCSegmentedURLCoderProvider::getTLDCoder((uint64_t)*this, &__p);
      v10 = __p;
      v11 = v43;
      if (v43)
      {
        v12 = (unint64_t *)&v43->__shared_owners_;
        do
          v13 = __ldaxr(v12);
        while (__stlxr(v13 - 1, v12));
        goto LABEL_30;
      }
      goto LABEL_32;
  }
  if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v29 = &v45;
  else
    v29 = (std::string *)v45.__r_.__value_.__r.__words[0];
  if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v45.__r_.__value_.__r.__words[2]);
  else
    size = v45.__r_.__value_.__l.__size_;
  std::string::append(a3, (const std::string::value_type *)v29, size);
  if (UC::UCBitStream::hasMore(a2))
  {
    if (NextBit)
    {
      UC::SUE::SegmentedURLDecoderImpl::_decodeRestOfURLWithPathWordBookAndAutoQueryTemplateFormat((uint64_t *)&__p, (UC::SUE::SegmentedURLDecoderImpl *)this, a2);
      if ((v44 & 0x80u) == 0)
        v31 = (const std::string::value_type *)&__p;
      else
        v31 = (const std::string::value_type *)__p;
      if ((v44 & 0x80u) == 0)
        v32 = v44;
      else
        v32 = (std::string::size_type)v43;
    }
    else
    {
      UC::SUE::SegmentedURLDecoderImpl::_decodeRestOfURLWithNonTemplateFormat((UC::SUE::SegmentedURLDecoderImpl *)this, a2, (uint64_t)&__p);
      if ((v44 & 0x80u) == 0)
        v31 = (const std::string::value_type *)&__p;
      else
        v31 = (const std::string::value_type *)__p;
      if ((v44 & 0x80u) == 0)
        v32 = v44;
      else
        v32 = (std::string::size_type)v43;
    }
    std::string::append(a3, v31, v32);
    if ((char)v44 < 0)
      operator delete(__p);
  }
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v45.__r_.__value_.__l.__data_);
}

void sub_220DDBED8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  uint64_t v35;
  uint64_t v36;

  if (a35 < 0)
    operator delete(__p);
  if (*(char *)(v36 - 49) < 0)
    operator delete(*(void **)(v36 - 72));
  if (*(char *)(v35 + 23) < 0)
    operator delete(*(void **)v35);
  _Unwind_Resume(exception_object);
}

uint64_t UC::SUE::SegmentedURLDecoderImpl::_decodeRestOfURLWithPathWordBookAndAutoQueryTemplateFormat(UC::SUE::SegmentedURLDecoderImpl *this, UC::UCBitStream *a2)
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  _QWORD *v10;
  void *p_p;
  uint64_t v12;
  void *exception;
  uint64_t v15;
  std::__shared_weak_count *v16;
  void *__p;
  uint64_t v18;
  unsigned __int8 v19;
  _QWORD v20[11];
  char v21;
  uint64_t v22;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v20);
  if (UC::UCBitStream::readNextBit(a2))
  {
    LOBYTE(__p) = 47;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)&__p, 1);
LABEL_18:
    LOBYTE(__p) = 63;
    v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)&__p, 1);
    UC::SUE::SegmentedURLDecoderImpl::_decodeQueryStringComponentsForPathWordBookAndAutoQueryTemplate((uint64_t *)&__p, this, a2);
    if ((v19 & 0x80u) == 0)
      p_p = &__p;
    else
      p_p = __p;
    if ((v19 & 0x80u) == 0)
      v12 = v19;
    else
      v12 = v18;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)p_p, v12);
    if ((char)v19 < 0)
      operator delete(__p);
    std::ostream::flush();
    goto LABEL_27;
  }
  LOBYTE(__p) = 47;
  v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)&__p, 1);
  UC::SUE::UCSegmentedURLCoderProvider::getKnownWordFixedLengthCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)this, &v15);
  (*(void (**)(void **__return_ptr, uint64_t, UC::UCBitStream *))(*(_QWORD *)v15 + 56))(&__p, v15, a2);
  if ((v19 & 0x80u) == 0)
    v5 = &__p;
  else
    v5 = __p;
  if ((v19 & 0x80u) == 0)
    v6 = v19;
  else
    v6 = v18;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)v5, v6);
  if ((char)v19 < 0)
    operator delete(__p);
  v7 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (UC::UCBitStream::hasMore(a2))
  {
    if (!UC::UCBitStream::readNextBit(a2))
    {
      exception = __cxa_allocate_exception(0x38uLL);
      UC::Exception::InvalidDecodingInstruction::InvalidDecodingInstruction((uint64_t)exception, "Encountered path indicator", 0x1AuLL, "Decoder encountered invalid instruction while decoding template query", 0x45uLL);
    }
    goto LABEL_18;
  }
LABEL_27:
  std::stringbuf::str();
  v20[0] = *MEMORY[0x24BEDB800];
  *(_QWORD *)((char *)v20 + *(_QWORD *)(v20[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v20[1] = MEMORY[0x24BEDB848] + 16;
  if (v21 < 0)
    operator delete((void *)v20[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x2276664A4](&v22);
}

void sub_220DDC208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  void *v17;

  __cxa_free_exception(v17);
  std::ostringstream::~ostringstream((uint64_t)&a17);
  _Unwind_Resume(a1);
}

void UC::SUE::SegmentedURLDecoderImpl::_decodeRestOfURLWithNonTemplateFormat(UC::SUE::SegmentedURLDecoderImpl *this@<X0>, UC::UCBitStream *a2@<X1>, uint64_t a3@<X8>)
{
  if (UC::UCBitStream::readNextBit(a2))
    UC::SUE::SegmentedURLDecoderImpl::_decodeSegmentedPathAndQuery(this, a2, a3);
  else
    UC::SUE::SegmentedURLDecoderImpl::_decodeCombinedPathAndQuery((UC::SUE::UCSegmentedURLCoderProvider **)this, a2, a3);
}

void UC::SUE::SegmentedURLDecoderImpl::_decodeCombinedPathAndQuery(UC::SUE::UCSegmentedURLCoderProvider **this@<X0>, UC::UCBitStream *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  int v9;
  void *__p[2];
  char v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  void *v14[2];
  uint64_t v15;

  UC::SUE::UCSegmentedURLCoderProvider::getCombinedPathAndQueryCoder(*this, &v12);
  v5 = v12;
  std::string::basic_string[abi:ne180100]<0>(__p, "|");
  (*(void (**)(void **__return_ptr, uint64_t, UC::UCBitStream *, void **))(*(_QWORD *)v5 + 48))(v14, v5, a2, __p);
  if (v11 < 0)
    operator delete(__p[0]);
  v6 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  if (SHIBYTE(v15) < 0)
  {
    if (!v14[1])
      goto LABEL_16;
    v9 = *(unsigned __int8 *)v14[0];
  }
  else
  {
    if (!HIBYTE(v15))
      goto LABEL_16;
    v9 = LOBYTE(v14[0]);
  }
  if (v9 == 47 || v9 == 35)
  {
    *(_OWORD *)a3 = *(_OWORD *)v14;
    *(_QWORD *)(a3 + 16) = v15;
    return;
  }
LABEL_16:
  std::operator+<char>();
  if (SHIBYTE(v15) < 0)
    operator delete(v14[0]);
}

void sub_220DDC3F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void UC::SUE::SegmentedURLDecoderImpl::_decodeSegmentedPathAndQuery(UC::SUE::SegmentedURLDecoderImpl *this@<X0>, UC::UCBitStream *a2@<X1>, uint64_t a3@<X8>)
{
  unsigned int v6;
  void **v7;
  void **v8;
  std::string::size_type v9;
  void **v10;
  std::string::size_type v11;
  _BOOL8 hasMore;
  BOOL v13;
  uint64_t v14;
  void **v15;
  std::string::size_type v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20[2];
  uint64_t v21;
  void *__p[2];
  uint64_t v23;

  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  v6 = UC::SUE::SegmentedURLDecoderImpl::_decodeHostFormatType(this, a2);
  while (v6 <= 1)
  {
    __p[0] = 0;
    __p[1] = 0;
    v23 = 0;
    if (v6)
    {
      MEMORY[0x227666324](__p, "/");
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(&v18, "");
      UC::SUE::SegmentedURLDecoderImpl::_decodePathValueDecodeEncodingType((uint64_t)this, a2);
      if (SHIBYTE(v23) < 0)
        operator delete(__p[0]);
      *(_OWORD *)__p = *(_OWORD *)v20;
      v23 = v21;
      HIBYTE(v21) = 0;
      LOBYTE(v20[0]) = 0;
      if (v19 < 0)
        operator delete(v18);
    }
    if (SHIBYTE(v23) < 0)
    {
      if (__p[1] != (void *)1)
        goto LABEL_22;
      v7 = (void **)__p[0];
    }
    else
    {
      if (HIBYTE(v23) != 1)
        goto LABEL_22;
      v7 = __p;
    }
    if (*(_BYTE *)v7 != 47)
    {
LABEL_22:
      std::operator+<char>();
      if (v21 >= 0)
        v10 = v20;
      else
        v10 = (void **)v20[0];
      if (v21 >= 0)
        v11 = HIBYTE(v21);
      else
        v11 = (std::string::size_type)v20[1];
      std::string::append((std::string *)a3, (const std::string::value_type *)v10, v11);
      if (SHIBYTE(v21) < 0)
        operator delete(v20[0]);
      goto LABEL_30;
    }
    if (v23 >= 0)
      v8 = __p;
    else
      v8 = (void **)__p[0];
    if (v23 >= 0)
      v9 = HIBYTE(v23);
    else
      v9 = (std::string::size_type)__p[1];
    std::string::append((std::string *)a3, (const std::string::value_type *)v8, v9);
LABEL_30:
    hasMore = UC::UCBitStream::hasMore(a2);
    v13 = hasMore;
    if (hasMore)
      v6 = UC::SUE::SegmentedURLDecoderImpl::_decodeHostFormatType((UC::SUE::SegmentedURLDecoderImpl *)hasMore, a2);
    if (SHIBYTE(v23) < 0)
    {
      operator delete(__p[0]);
      if (!v13)
        break;
    }
    else if (!v13)
    {
      break;
    }
  }
  if (v6 == 2)
  {
    v14 = 0;
    while (UC::UCBitStream::hasMore(a2))
    {
      UC::SUE::SegmentedURLDecoderImpl::_decodeSegmentedQueryStringComponent(this, a2, (uint64_t)__p);
      if (v14)
      {
        std::operator+<char>();
        if (v21 >= 0)
          v15 = v20;
        else
          v15 = (void **)v20[0];
        if (v21 >= 0)
          v16 = HIBYTE(v21);
        else
          v16 = (std::string::size_type)v20[1];
      }
      else
      {
        v17 = *(unsigned __int8 *)(a3 + 23);
        if ((v17 & 0x80u) != 0)
          v17 = *(_QWORD *)(a3 + 8);
        if (v17)
        {
          std::operator+<char>();
          if (v21 >= 0)
            v15 = v20;
          else
            v15 = (void **)v20[0];
          if (v21 >= 0)
            v16 = HIBYTE(v21);
          else
            v16 = (std::string::size_type)v20[1];
        }
        else
        {
          std::operator+<char>();
          if (v21 >= 0)
            v15 = v20;
          else
            v15 = (void **)v20[0];
          if (v21 >= 0)
            v16 = HIBYTE(v21);
          else
            v16 = (std::string::size_type)v20[1];
        }
      }
      std::string::append((std::string *)a3, (const std::string::value_type *)v15, v16);
      if (SHIBYTE(v21) < 0)
        operator delete(v20[0]);
      if (SHIBYTE(v23) < 0)
        operator delete(__p[0]);
      --v14;
    }
  }
}

void sub_220DDC718(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  uint64_t v26;

  if (*(char *)(v26 + 23) < 0)
    operator delete(*(void **)v26);
  _Unwind_Resume(exception_object);
}

void UC::SUE::SegmentedURLDecoderImpl::_decodeSegmentedQueryStringComponent(UC::SUE::SegmentedURLDecoderImpl *this@<X0>, UC::UCBitStream *a2@<X1>, uint64_t a3@<X8>)
{
  int ComponentEncodingType;
  std::string::size_type v7;
  std::__shared_weak_count *size;
  unint64_t *v9;
  unint64_t v10;
  size_t v11;
  std::string *v12;
  void **v13;
  const std::string::value_type *v14;
  std::string::size_type v15;
  std::string *v16;
  int v17;
  void *v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  size_t v22;
  std::string *v23;
  void **v24;
  const std::string::value_type *v25;
  std::string::size_type v26;
  void *v27[2];
  char v28;
  void *v29[2];
  char v30;
  std::string v31;
  void *__p[2];
  char v33;
  void *v34[2];
  char v35;
  void *v36;
  std::__shared_weak_count *v37;
  unsigned __int8 v38;
  std::string::value_type *v39;
  std::string::size_type v40;
  unsigned __int8 v41;

  ComponentEncodingType = UC::SUE::SegmentedURLDecoderImpl::_decodeQueryComponentEncodingType(this, a2);
  if (ComponentEncodingType == 1)
  {
    std::string::basic_string[abi:ne180100]<0>(&v36, "=");
    UC::SUE::SegmentedURLDecoderImpl::_decodeQueryValueWithEncodingType((uint64_t)this, (uint64_t)a2, 1, (uint64_t)&v36);
    if ((char)v38 < 0)
      operator delete(v36);
    UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)this, &v31);
    v7 = v31.__r_.__value_.__r.__words[0];
    std::string::basic_string[abi:ne180100]<0>(v34, "?");
    std::string::basic_string[abi:ne180100]<0>(__p, "|");
    (*(void (**)(void **__return_ptr, std::string::size_type, UC::UCBitStream *, void **, void **))(*(_QWORD *)v7 + 64))(&v36, v7, a2, v34, __p);
    if (v33 < 0)
      operator delete(__p[0]);
    if (v35 < 0)
      operator delete(v34[0]);
    size = (std::__shared_weak_count *)v31.__r_.__value_.__l.__size_;
    if (v31.__r_.__value_.__l.__size_)
    {
      v9 = (unint64_t *)(v31.__r_.__value_.__l.__size_ + 8);
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
        std::__shared_weak_count::__release_weak(size);
      }
    }
    if ((v38 & 0x80u) == 0)
      v11 = v38;
    else
      v11 = (size_t)v37;
    v12 = &v31;
    std::string::basic_string[abi:ne180100]((uint64_t)&v31, v11 + 1);
    if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v12 = (std::string *)v31.__r_.__value_.__r.__words[0];
    if (v11)
    {
      if ((v38 & 0x80u) == 0)
        v13 = &v36;
      else
        v13 = (void **)v36;
      memmove(v12, v13, v11);
    }
    *(_WORD *)((char *)&v12->__r_.__value_.__l.__data_ + v11) = 61;
    if ((v41 & 0x80u) == 0)
      v14 = (const std::string::value_type *)&v39;
    else
      v14 = v39;
    if ((v41 & 0x80u) == 0)
      v15 = v41;
    else
      v15 = v40;
    v16 = std::string::append(&v31, v14, v15);
  }
  else
  {
    v17 = ComponentEncodingType;
    UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)this, &v36);
    v18 = v36;
    std::string::basic_string[abi:ne180100]<0>(v29, "?");
    std::string::basic_string[abi:ne180100]<0>(v27, "|");
    (*(void (**)(std::string::value_type **__return_ptr, void *, UC::UCBitStream *, void **, void **))(*(_QWORD *)v18 + 64))(&v39, v18, a2, v29, v27);
    if (v28 < 0)
      operator delete(v27[0]);
    if (v30 < 0)
      operator delete(v29[0]);
    v19 = v37;
    if (v37)
    {
      p_shared_owners = (unint64_t *)&v37->__shared_owners_;
      do
        v21 = __ldaxr(p_shared_owners);
      while (__stlxr(v21 - 1, p_shared_owners));
      if (!v21)
      {
        ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
        std::__shared_weak_count::__release_weak(v19);
      }
    }
    std::string::basic_string[abi:ne180100]<0>(&v31, "=");
    UC::SUE::SegmentedURLDecoderImpl::_decodeQueryValueWithEncodingType((uint64_t)this, (uint64_t)a2, v17, (uint64_t)&v31);
    if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v31.__r_.__value_.__l.__data_);
    if ((v41 & 0x80u) == 0)
      v22 = v41;
    else
      v22 = v40;
    v23 = &v31;
    std::string::basic_string[abi:ne180100]((uint64_t)&v31, v22 + 1);
    if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v23 = (std::string *)v31.__r_.__value_.__r.__words[0];
    if (v22)
    {
      if ((v41 & 0x80u) == 0)
        v24 = (void **)&v39;
      else
        v24 = (void **)v39;
      memmove(v23, v24, v22);
    }
    *(_WORD *)((char *)&v23->__r_.__value_.__l.__data_ + v22) = 61;
    if ((v38 & 0x80u) == 0)
      v25 = (const std::string::value_type *)&v36;
    else
      v25 = (const std::string::value_type *)v36;
    if ((v38 & 0x80u) == 0)
      v26 = v38;
    else
      v26 = (std::string::size_type)v37;
    v16 = std::string::append(&v31, v25, v26);
  }
  *(_OWORD *)a3 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  *(_QWORD *)(a3 + 16) = *((_QWORD *)&v16->__r_.__value_.__l + 2);
  v16->__r_.__value_.__l.__size_ = 0;
  v16->__r_.__value_.__r.__words[2] = 0;
  v16->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v31.__r_.__value_.__l.__data_);
  if ((char)v38 < 0)
    operator delete(v36);
  if ((char)v41 < 0)
    operator delete(v39);
}

void sub_220DDCB08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  uint64_t v38;

  if (a26 < 0)
    operator delete(__p);
  if (*(char *)(v38 - 81) < 0)
    operator delete(*(void **)(v38 - 104));
  if (*(char *)(v38 - 57) < 0)
    operator delete(*(void **)(v38 - 80));
  _Unwind_Resume(exception_object);
}

void sub_220DDCBF4()
{
  uint64_t v0;

  if (*(char *)(v0 - 81) < 0)
    JUMPOUT(0x220DDCBE8);
  JUMPOUT(0x220DDCBECLL);
}

void UC::SUE::SegmentedURLDecoderImpl::_decodeQueryValueWithEncodingType(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  uint64_t v11;
  unint64_t *v12;
  void *v13[2];
  char v14;
  void *__p[2];
  char v16;
  void *v17[2];
  char v18;
  std::string v19;
  uint64_t v20;
  std::__shared_weak_count *v21;

  if (a3 == 2)
  {
    UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQuery6BitAlphabetCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, &v20);
    v6 = v20;
    std::string::basic_string[abi:ne180100]<0>(v13, "|");
    (*(void (**)(uint64_t, uint64_t, void **))(*(_QWORD *)v6 + 48))(v6, a2, v13);
    if (v14 < 0)
      operator delete(v13[0]);
    v7 = v21;
    if (v21)
    {
      p_shared_owners = (unint64_t *)&v21->__shared_owners_;
      do
        v9 = __ldaxr(p_shared_owners);
      while (__stlxr(v9 - 1, p_shared_owners));
LABEL_21:
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
  }
  else
  {
    if (a3 == 1)
    {
      v5 = *(_QWORD *)(a1 + 16);
      std::string::basic_string[abi:ne180100]<0>(__p, "|");
      (*(void (**)(uint64_t, uint64_t, void **))(*(_QWORD *)v5 + 48))(v5, a2, __p);
      if (v16 < 0)
        operator delete(__p[0]);
      return;
    }
    UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, &v20);
    v11 = v20;
    if (*(char *)(a4 + 23) < 0)
      std::string::__init_copy_ctor_external(&v19, *(const std::string::value_type **)a4, *(_QWORD *)(a4 + 8));
    else
      v19 = *(std::string *)a4;
    std::string::basic_string[abi:ne180100]<0>(v17, "|");
    (*(void (**)(uint64_t, uint64_t, std::string *, void **))(*(_QWORD *)v11 + 64))(v11, a2, &v19, v17);
    if (v18 < 0)
      operator delete(v17[0]);
    if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v19.__r_.__value_.__l.__data_);
    v7 = v21;
    if (v21)
    {
      v12 = (unint64_t *)&v21->__shared_owners_;
      do
        v9 = __ldaxr(v12);
      while (__stlxr(v9 - 1, v12));
      goto LABEL_21;
    }
  }
}

void sub_220DDCDBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  uint64_t v30;

  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](v30 - 48);
  _Unwind_Resume(a1);
}

void sub_220DDCE28(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  JUMPOUT(0x220DDCE20);
}

void UC::SUE::SegmentedURLDecoderImpl::_decodePathValueDecodeEncodingType(uint64_t a1, UC::UCBitStream *this)
{
  int NextBit;
  int v5;
  int v6;
  _BOOL4 v7;

  NextBit = UC::UCBitStream::readNextBit(this);
  v5 = UC::UCBitStream::readNextBit(this);
  if (v5)
    v6 = 3;
  else
    v6 = 2;
  if (NextBit)
    v7 = v6;
  else
    v7 = v5 != 0;
  UC::SUE::SegmentedURLDecoderImpl::_decodePathValueWithEncodingType(a1, (uint64_t)this, v7);
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  std::ios_base *v6;

  v2 = MEMORY[0x24BEDB870];
  v3 = MEMORY[0x24BEDB870] + 64;
  *(_QWORD *)(a1 + 112) = MEMORY[0x24BEDB870] + 64;
  v4 = *(_QWORD *)(MEMORY[0x24BEDB800] + 8);
  v5 = *(_QWORD *)(MEMORY[0x24BEDB800] + 16);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + *(_QWORD *)(v4 - 24)) = v5;
  v6 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v6, (void *)(a1 + 8));
  v6[1].__vftable = 0;
  v6[1].__fmtflags_ = -1;
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 112) = v3;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 8) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_220DDCF78(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::ostream::~ostream();
  MEMORY[0x2276664A4](v1);
  _Unwind_Resume(a1);
}

uint64_t UC::SUE::SegmentedURLDecoderImpl::_decodeQueryStringComponentsForPathWordBookAndAutoQueryTemplate(UC::SUE::SegmentedURLDecoderImpl *this, UC::UCBitStream *a2)
{
  uint64_t v4;
  _QWORD *v5;
  UC::SUE::SegmentedURLDecoderImpl *v6;
  int ComponentEncodingType;
  void **v8;
  uint64_t v9;
  void *v11[2];
  char v12;
  void *__p[2];
  unsigned __int8 v14;
  _QWORD v15[11];
  char v16;
  uint64_t v17;

  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v15);
  v4 = 0;
  while (UC::UCBitStream::hasMore(a2))
  {
    if (v4)
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"&", 1);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"p", 1);
    if (v4)
      std::ostream::operator<<();
    v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"=", 1);
    v6 = (UC::SUE::SegmentedURLDecoderImpl *)std::string::basic_string[abi:ne180100]<0>(v11, "=");
    ComponentEncodingType = UC::SUE::SegmentedURLDecoderImpl::_decodeQueryComponentEncodingType(v6, a2);
    UC::SUE::SegmentedURLDecoderImpl::_decodeQueryValueWithEncodingType((uint64_t)this, (uint64_t)a2, ComponentEncodingType, (uint64_t)v11);
    if ((v14 & 0x80u) == 0)
      v8 = __p;
    else
      v8 = (void **)__p[0];
    if ((v14 & 0x80u) == 0)
      v9 = v14;
    else
      v9 = (uint64_t)__p[1];
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)v8, v9);
    if ((char)v14 < 0)
      operator delete(__p[0]);
    if (v12 < 0)
      operator delete(v11[0]);
    ++v4;
  }
  std::ostream::flush();
  std::stringbuf::str();
  v15[0] = *MEMORY[0x24BEDB800];
  *(_QWORD *)((char *)v15 + *(_QWORD *)(v15[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v15[1] = MEMORY[0x24BEDB848] + 16;
  if (v16 < 0)
    operator delete((void *)v15[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x2276664A4](&v17);
}

void sub_220DDD154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
  std::ostringstream::~ostringstream((uint64_t)&a22);
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
  MEMORY[0x2276664A4](a1 + 112);
  return a1;
}

void UC::SUE::SegmentedURLDecoderImpl::_decodePathValueWithEncodingType(uint64_t a1, uint64_t a2, int a3)
{
  __asm { BR              X10 }
}

void sub_220DDD25C(UC::SUE::UCSegmentedURLCoderProvider **a1, void *a2, uint64_t a3, uint64_t a4, __int16 a5, char a6, char a7, void *a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, std::string *a20,uint64_t a21,void *__pa,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  std::__shared_weak_count *v33;
  unint64_t *p_shared_owners;
  unint64_t v35;
  void *v36[2];
  char v37;
  std::string v38[4];

  UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*a1, (_QWORD *)(v30 - 48));
  v32 = *(_QWORD *)(v30 - 48);
  if (*(char *)(a4 + 23) < 0)
    std::string::__init_copy_ctor_external(v38, *(const std::string::value_type **)a4, *(_QWORD *)(a4 + 8));
  else
    v38[0] = *(std::string *)a4;
  std::string::basic_string[abi:ne180100]<0>(v36, "|");
  (*(void (**)(uint64_t, uint64_t, std::string *, void **))(*(_QWORD *)v32 + 64))(v32, v29, v38, v36);
  if (v37 < 0)
    operator delete(v36[0]);
  if (SHIBYTE(v38[0].__r_.__value_.__r.__words[2]) < 0)
    operator delete(v38[0].__r_.__value_.__l.__data_);
  v33 = *(std::__shared_weak_count **)(v30 - 40);
  if (v33)
  {
    p_shared_owners = (unint64_t *)&v33->__shared_owners_;
    do
      v35 = __ldaxr(p_shared_owners);
    while (__stlxr(v35 - 1, p_shared_owners));
    if (!v35)
    {
      ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
      std::__shared_weak_count::__release_weak(v33);
    }
  }
}

void sub_220DDD428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  uint64_t v30;

  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](v30 - 48);
  _Unwind_Resume(a1);
}

void sub_220DDD498(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  JUMPOUT(0x220DDD490);
}

_QWORD *UC::Exception::CoderError::CoderError(_QWORD *a1, void *__src, size_t __len, int a4, const void *a5, size_t a6, const void *a7, size_t a8)
{
  void *v14;
  size_t v15;
  size_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;

  *a1 = off_24E6B2520;
  if (__len > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v15 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v15 = __len | 7;
    v16 = v15 + 1;
    v14 = operator new(v15 + 1);
    a1[2] = __len;
    a1[3] = v16 | 0x8000000000000000;
    a1[1] = v14;
    goto LABEL_8;
  }
  *((_BYTE *)a1 + 31) = __len;
  v14 = a1 + 1;
  if (__len)
LABEL_8:
    memmove(v14, __src, __len);
  *((_BYTE *)v14 + __len) = 0;
  *((_DWORD *)a1 + 8) = a4;
  if (a6 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (a6 >= 0x17)
  {
    v18 = (a6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a6 | 7) != 0x17)
      v18 = a6 | 7;
    v19 = v18 + 1;
    v17 = operator new(v18 + 1);
    a1[6] = a6;
    a1[7] = v19 | 0x8000000000000000;
    a1[5] = v17;
    goto LABEL_16;
  }
  *((_BYTE *)a1 + 63) = a6;
  v17 = a1 + 5;
  if (a6)
LABEL_16:
    memmove(v17, a5, a6);
  *((_BYTE *)v17 + a6) = 0;
  v20 = a1 + 8;
  if (a8 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (a8 >= 0x17)
  {
    v21 = (a8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a8 | 7) != 0x17)
      v21 = a8 | 7;
    v22 = v21 + 1;
    v20 = operator new(v21 + 1);
    a1[9] = a8;
    a1[10] = v22 | 0x8000000000000000;
    a1[8] = v20;
  }
  else
  {
    *((_BYTE *)a1 + 87) = a8;
    if (!a8)
      goto LABEL_25;
  }
  memmove(v20, a7, a8);
LABEL_25:
  *((_BYTE *)v20 + a8) = 0;
  return a1;
}

void sub_220DDD680(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void **v3;

  if (*(char *)(v1 + 63) < 0)
    operator delete(*v3);
  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  std::exception::~exception((std::exception *)v1);
  _Unwind_Resume(a1);
}

uint64_t UC::Exception::CoderError::what(UC::Exception::CoderError *this)
{
  uint64_t result;

  result = (uint64_t)this + 64;
  if (*((char *)this + 87) < 0)
    return *(_QWORD *)result;
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t UC::SUE::SegmentedURLEncoderImpl::SegmentedPathOrQueryValueEncodingResult::SegmentedPathOrQueryValueEncodingResult(uint64_t a1, unint64_t a2, __int128 *a3)
{
  std::string *v4;
  unint64_t v5;
  __int128 v6;

  *(_QWORD *)a1 = a2;
  v4 = (std::string *)(a1 + 8);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
    LODWORD(v5) = *(_DWORD *)(a1 + 4);
  }
  else
  {
    v5 = HIDWORD(a2);
    v6 = *a3;
    v4->__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v6;
  }
  *(_BYTE *)(a1 + 32) = (_DWORD)v5 == 0;
  return a1;
}

uint64_t UC::Exception::InternalCoderError::InternalCoderError(uint64_t a1, void *__src, size_t __len, int a4, void *a5, size_t a6)
{
  void *v12;
  size_t v13;
  size_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  *(_QWORD *)a1 = off_24E6B2578;
  if (__len > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v13 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v13 = __len | 7;
    v14 = v13 + 1;
    v12 = operator new(v13 + 1);
    *(_QWORD *)(a1 + 16) = __len;
    *(_QWORD *)(a1 + 24) = v14 | 0x8000000000000000;
    *(_QWORD *)(a1 + 8) = v12;
    goto LABEL_8;
  }
  *(_BYTE *)(a1 + 31) = __len;
  v12 = (void *)(a1 + 8);
  if (__len)
LABEL_8:
    memmove(v12, __src, __len);
  *((_BYTE *)v12 + __len) = 0;
  *(_DWORD *)(a1 + 32) = a4;
  v15 = (void *)(a1 + 40);
  if (a6 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (a6 >= 0x17)
  {
    v16 = (a6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a6 | 7) != 0x17)
      v16 = a6 | 7;
    v17 = v16 + 1;
    v15 = operator new(v16 + 1);
    *(_QWORD *)(a1 + 48) = a6;
    *(_QWORD *)(a1 + 56) = v17 | 0x8000000000000000;
    *(_QWORD *)(a1 + 40) = v15;
  }
  else
  {
    *(_BYTE *)(a1 + 63) = a6;
    if (!a6)
      goto LABEL_17;
  }
  memmove(v15, a5, a6);
LABEL_17:
  *((_BYTE *)v15 + a6) = 0;
  return a1;
}

void sub_220DDD914(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  std::exception::~exception((std::exception *)v1);
  _Unwind_Resume(a1);
}

uint64_t UC::Exception::InternalCoderError::what(UC::Exception::InternalCoderError *this)
{
  uint64_t result;

  result = (uint64_t)this + 40;
  if (*((char *)this + 63) < 0)
    return *(_QWORD *)result;
  return result;
}

void std::__throw_bad_variant_access[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8D8] + 16;
}

uint64_t UC::Exception::InvalidDecodingInstruction::InvalidDecodingInstruction(uint64_t a1, void *__src, size_t __len, void *a4, size_t a5)
{
  void *v10;
  size_t v11;
  size_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)a1 = off_24E6B25B8;
  if (__len > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v11 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v11 = __len | 7;
    v12 = v11 + 1;
    v10 = operator new(v11 + 1);
    *(_QWORD *)(a1 + 16) = __len;
    *(_QWORD *)(a1 + 24) = v12 | 0x8000000000000000;
    *(_QWORD *)(a1 + 8) = v10;
    goto LABEL_8;
  }
  *(_BYTE *)(a1 + 31) = __len;
  v10 = (void *)(a1 + 8);
  if (__len)
LABEL_8:
    memmove(v10, __src, __len);
  *((_BYTE *)v10 + __len) = 0;
  v13 = (void *)(a1 + 32);
  if (a5 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (a5 >= 0x17)
  {
    v14 = (a5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a5 | 7) != 0x17)
      v14 = a5 | 7;
    v15 = v14 + 1;
    v13 = operator new(v14 + 1);
    *(_QWORD *)(a1 + 40) = a5;
    *(_QWORD *)(a1 + 48) = v15 | 0x8000000000000000;
    *(_QWORD *)(a1 + 32) = v13;
  }
  else
  {
    *(_BYTE *)(a1 + 55) = a5;
    if (!a5)
      goto LABEL_17;
  }
  memmove(v13, a4, a5);
LABEL_17:
  *((_BYTE *)v13 + a5) = 0;
  return a1;
}

void sub_220DDDB2C(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  std::exception::~exception((std::exception *)v1);
  _Unwind_Resume(a1);
}

uint64_t UC::Exception::InvalidDecodingInstruction::what(UC::Exception::InvalidDecodingInstruction *this)
{
  uint64_t result;

  result = (uint64_t)this + 32;
  if (*((char *)this + 55) < 0)
    return *(_QWORD *)result;
  return result;
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

uint64_t std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](uint64_t a1)
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

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  std::string *v10;
  std::__split_buffer<std::string>::pointer end;
  __int128 v12;
  uint64_t v13;
  std::__split_buffer<std::string> __v;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9)
    v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  else
    v10 = 0;
  end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    end = __v.__end_;
  }
  else
  {
    v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_220DDDE64(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a10);
  _Unwind_Resume(a1);
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

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>(uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
{
  std::string *v4;
  __int128 *v6;
  __int128 v7;
  _QWORD v9[3];
  char v10;
  std::string *v11;
  std::string *v12;

  v4 = this;
  v11 = this;
  v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  v10 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
        v4 = v12;
      }
      else
      {
        v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      v6 = (__int128 *)((char *)v6 + 24);
      v12 = ++v4;
    }
    while (v6 != a3);
  }
  v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_220DDE174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0)
      operator delete(*(void **)(v1 - 24));
    v1 -= 24;
  }
}

void std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100](int a1, void **__p)
{
  if (__p)
  {
    if (*((char *)__p + 23) < 0)
      operator delete(*__p);
    operator delete(__p);
  }
}

void std::vector<std::string>::__move_range(std::vector<std::string> *this, std::vector<std::string>::pointer __from_s, std::vector<std::string>::pointer __from_e, std::vector<std::string>::pointer __to)
{
  std::vector<std::string>::pointer end;
  char *v7;
  std::vector<std::string>::pointer v8;
  unint64_t v9;
  __int128 v10;
  char v11;

  end = this->__end_;
  v7 = (char *)__from_s + (char *)end - (char *)__to;
  v8 = end;
  if (v7 < (char *)__from_e)
  {
    v9 = (unint64_t)v7;
    v8 = this->__end_;
    do
    {
      v10 = *(_OWORD *)v9;
      v8->__r_.__value_.__r.__words[2] = *(_QWORD *)(v9 + 16);
      *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v10;
      ++v8;
      *(_QWORD *)(v9 + 8) = 0;
      *(_QWORD *)(v9 + 16) = 0;
      *(_QWORD *)v9 = 0;
      v9 += 24;
    }
    while (v9 < (unint64_t)__from_e);
  }
  this->__end_ = v8;
  std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::string *,std::string *,std::string *>((uint64_t)&v11, (uint64_t)__from_s, (uint64_t)v7, (uint64_t)end);
}

void std::__split_buffer<std::string>::push_back(std::__split_buffer<std::string> *this, std::__split_buffer<std::string>::value_type *__x)
{
  std::__split_buffer<std::string>::pointer end;
  __int128 *begin;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  std::string *v9;
  unint64_t v10;
  unint64_t v11;
  std::allocator<std::string> *value;
  std::string *v13;
  uint64_t v14;
  std::string *v15;
  std::__split_buffer<std::string>::pointer v16;
  int64_t v17;
  uint64_t v18;
  std::string *v19;
  uint64_t v20;
  std::string *v21;
  __int128 v22;
  int64x2_t v23;
  std::string *v24;
  __int128 v25;
  std::__split_buffer<std::string> v26;

  end = this->__end_;
  if (end == this->__end_cap_.__value_)
  {
    begin = (__int128 *)this->__begin_;
    if ((std::__split_buffer<std::string>::pointer)begin <= this->__first_)
    {
      if (end == this->__first_)
        v10 = 1;
      else
        v10 = 0x5555555555555556 * (((char *)end - (char *)this->__first_) >> 3);
      v11 = v10 >> 2;
      value = this->__end_cap_.__value_;
      v26.__end_cap_.__value_ = this->__end_cap_.__value_;
      v13 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)value, v10);
      v15 = &v13[v11];
      v16 = this->__begin_;
      v17 = (char *)this->__end_ - (char *)v16;
      if (v17)
      {
        v18 = v17 / 24;
        v19 = &v15[v18];
        v20 = 24 * v18;
        v21 = &v13[v11];
        do
        {
          v22 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
          v21->__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v21->__r_.__value_.__l.__data_ = v22;
          ++v21;
          v16->__r_.__value_.__l.__size_ = 0;
          v16->__r_.__value_.__r.__words[2] = 0;
          v16->__r_.__value_.__r.__words[0] = 0;
          ++v16;
          v20 -= 24;
        }
        while (v20);
        v23 = *(int64x2_t *)&this->__begin_;
      }
      else
      {
        v23 = vdupq_n_s64((unint64_t)v16);
        v19 = &v13[v11];
      }
      v26.__first_ = this->__first_;
      this->__first_ = v13;
      this->__begin_ = v15;
      *(int64x2_t *)&v26.__begin_ = v23;
      v24 = this->__end_cap_.__value_;
      this->__end_ = v19;
      this->__end_cap_.__value_ = &v13[v14];
      v26.__end_cap_.__value_ = v24;
      std::__split_buffer<std::string>::~__split_buffer(&v26);
      end = this->__end_;
    }
    else
    {
      v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)begin - (char *)this->__first_) >> 3);
      if (v6 >= -1)
        v7 = v6 + 1;
      else
        v7 = v6 + 2;
      v8 = -3 * (v7 >> 1);
      std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::string *,std::string *,std::string *>((uint64_t)&v26, begin, (__int128 *)end, (uint64_t)begin - 24 * (v7 >> 1));
      end = v9;
      this->__begin_ = (std::__split_buffer<std::string>::pointer)((char *)this->__begin_ + 8 * v8);
      this->__end_ = v9;
    }
  }
  v25 = *(_OWORD *)&__x->__r_.__value_.__l.__data_;
  end->__r_.__value_.__r.__words[2] = __x->__r_.__value_.__r.__words[2];
  *(_OWORD *)&end->__r_.__value_.__l.__data_ = v25;
  __x->__r_.__value_.__l.__size_ = 0;
  __x->__r_.__value_.__r.__words[2] = 0;
  __x->__r_.__value_.__r.__words[0] = 0;
  ++this->__end_;
}

std::vector<std::string>::pointer std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v, std::vector<std::string>::pointer __p)
{
  std::string *begin;
  std::__compressed_pair<std::string *> *p_end_cap;
  std::string *v8;
  std::string *v9;
  std::string *end;
  std::string *value;

  begin = __v->__begin_;
  p_end_cap = &this->__end_cap_;
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)__p, (uint64_t)__p, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)begin, (uint64_t)begin);
  __v->__begin_ = v8;
  __v->__end_ = (std::__split_buffer<std::string>::pointer)std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)p_end_cap, (__int128 *)__p, (__int128 *)this->__end_, (uint64_t)__v->__end_);
  v9 = this->__begin_;
  this->__begin_ = __v->__begin_;
  __v->__begin_ = v9;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
  return begin;
}

uint64_t std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::string *,std::string *,std::string *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  if (a3 != a2)
  {
    v6 = a3;
    do
    {
      v7 = a4 - 24;
      if (*(char *)(a4 - 1) < 0)
        operator delete(*(void **)v7);
      v8 = *(_OWORD *)(v6 - 24);
      *(_QWORD *)(v7 + 16) = *(_QWORD *)(v6 - 8);
      *(_OWORD *)v7 = v8;
      *(_BYTE *)(v6 - 1) = 0;
      *(_BYTE *)(v6 - 24) = 0;
      a4 = v7;
      v6 -= 24;
    }
    while (v6 != a2);
  }
  return a3;
}

__int128 *std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::string *,std::string *,std::string *>(uint64_t a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  __int128 *v5;
  __int128 v7;

  v5 = a2;
  if (a2 != a3)
  {
    do
    {
      if (*(char *)(a4 + 23) < 0)
        operator delete(*(void **)a4);
      v7 = *v5;
      *(_QWORD *)(a4 + 16) = *((_QWORD *)v5 + 2);
      *(_OWORD *)a4 = v7;
      a4 += 24;
      *((_BYTE *)v5 + 23) = 0;
      *(_BYTE *)v5 = 0;
      v5 = (__int128 *)((char *)v5 + 24);
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  uint64_t v4;
  __int128 v5;
  _QWORD v7[3];
  char v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a4;
  v10 = a4;
  v9 = a4;
  v7[0] = a1;
  v7[1] = &v9;
  v7[2] = &v10;
  if (a2 != a3)
  {
    do
    {
      v5 = *a2;
      *(_QWORD *)(v4 + 16) = *((_QWORD *)a2 + 2);
      *(_OWORD *)v4 = v5;
      v4 += 24;
      *((_QWORD *)a2 + 1) = 0;
      *((_QWORD *)a2 + 2) = 0;
      *(_QWORD *)a2 = 0;
      a2 = (__int128 *)((char *)a2 + 24);
    }
    while (a2 != a3);
    v10 = v4;
  }
  v8 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v7);
  return v4;
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a2 > 0x16)
  {
    v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17)
      v4 = a2 | 7;
    v5 = v4 + 1;
    v6 = operator new(v4 + 1);
    *(_QWORD *)(a1 + 8) = a2;
    *(_QWORD *)(a1 + 16) = v5 | 0x8000000000000000;
    *(_QWORD *)a1 = v6;
  }
  else
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 0;
    *(_BYTE *)(a1 + 23) = a2;
  }
  return a1;
}

void std::vector<std::string>::__vdeallocate(std::vector<std::string> *this)
{
  if (this->__begin_)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this);
    operator delete(this->__begin_);
    this->__begin_ = 0;
    this->__end_ = 0;
    this->__end_cap_.__value_ = 0;
  }
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x2276663F0](v13, a1);
  if (v13[0])
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
  MEMORY[0x2276663FC](v13);
  return a1;
}

void sub_220DDE7FC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x2276663FC](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x220DDE7DCLL);
}

void sub_220DDE844(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
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
      std::string::basic_string[abi:ne180100](__p, v12, __c);
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

void sub_220DDE978(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

uint64_t UC::UCLEB128Coder::canEncode(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  BOOL v6;

  v2 = *a2;
  v3 = a2[1];
  if (*a2 == v3)
    return 1;
  do
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, v2);
    v2 += 24;
    if ((_DWORD)result)
      v6 = v2 == v3;
    else
      v6 = 1;
  }
  while (!v6);
  return result;
}

uint64_t UC::UCLEB128Coder::canEncode(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  unsigned __int8 *v4;
  uint64_t result;
  unsigned __int8 *v6;
  uint64_t v7;
  int v8;
  int v9;

  if (*(char *)(a2 + 23) < 0)
  {
    v3 = *(_QWORD *)(a2 + 8);
    if (v3)
    {
      v4 = *(unsigned __int8 **)a2;
      goto LABEL_6;
    }
    return 0;
  }
  v3 = *(unsigned __int8 *)(a2 + 23);
  if (!*(_BYTE *)(a2 + 23))
    return 0;
  v4 = (unsigned __int8 *)a2;
LABEL_6:
  result = UC::IsAllDigits(v4, v3);
  if (!(_DWORD)result)
    return result;
  if (v3 < 2)
    return 1;
  result = 0;
  if (*(char *)(a2 + 23) >= 0)
    v6 = (unsigned __int8 *)a2;
  else
    v6 = *(unsigned __int8 **)a2;
  if (v3 > 0x14 || *v6 == 48)
    return result;
  if (v3 != 20)
    return 1;
  v7 = 0;
  do
  {
    v8 = (char)v6[v7];
    v9 = UC::UCLEB128Coder::canEncode(std::string const&)::maxNumber[v7];
    result = v8 <= v9;
  }
  while (v8 <= v9 && v7++ != 19);
  return result;
}

uint64_t UC::UCLEB128Coder::encode(uint64_t a1, const std::string *a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void **v6;
  void **v7;
  uint64_t v8;
  uint64_t v9;
  void *exception;
  _QWORD *v12;
  size_t v13;
  void *__p[2];
  char v15;
  _QWORD v16[11];
  char v17;
  uint64_t v18;
  _QWORD v19[2];
  uint64_t v20;
  void *v21;
  char v22;
  uint64_t v23;
  unint64_t v24;

  if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1) & 1) == 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::operator+<char>();
    if (v20 >= 0)
      v12 = v19;
    else
      v12 = (_QWORD *)v19[0];
    if (v20 >= 0)
      v13 = HIBYTE(v20);
    else
      v13 = v19[1];
    UC::Exception::InvalidEncodingInput::InvalidEncodingInput((uint64_t)exception, v12, v13);
  }
  v24 = 0;
  std::istringstream::basic_istringstream[abi:ne180100](v19, a2, 8);
  MEMORY[0x2276663D8](v19, &v24);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v16);
  v3 = v24;
  do
  {
    v24 = v3 >> 7;
    if (v3 > 0x7F)
      LOBYTE(__p[0]) = 49;
    else
      LOBYTE(__p[0]) = 48;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)__p, 1);
    v4 = 0;
    v15 = 7;
    strcpy((char *)__p, "0000000");
    v5 = 6;
    do
    {
      if ((((v3 & 0x7F) >> v4) & 1) != 0)
      {
        if (v15 >= 0)
          v6 = __p;
        else
          v6 = (void **)__p[0];
        *((_BYTE *)v6 + v5) = 49;
      }
      ++v4;
      --v5;
    }
    while (v4 != 7);
    if (v15 >= 0)
      v7 = __p;
    else
      v7 = (void **)__p[0];
    if (v15 >= 0)
      v8 = v15;
    else
      v8 = (uint64_t)__p[1];
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)v7, v8);
    if (v15 < 0)
      operator delete(__p[0]);
    v3 = v24;
  }
  while (v24);
  std::ostream::flush();
  std::stringbuf::str();
  v16[0] = *MEMORY[0x24BEDB800];
  *(_QWORD *)((char *)v16 + *(_QWORD *)(v16[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v9 = MEMORY[0x24BEDB848] + 16;
  v16[1] = MEMORY[0x24BEDB848] + 16;
  if (v17 < 0)
    operator delete((void *)v16[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x2276664A4](&v18);
  v19[0] = *MEMORY[0x24BEDB7F8];
  *(_QWORD *)((char *)v19 + *(_QWORD *)(v19[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F8] + 24);
  v20 = v9;
  if (v22 < 0)
    operator delete(v21);
  std::streambuf::~streambuf();
  std::istream::~istream();
  return MEMORY[0x2276664A4](&v23);
}

void sub_220DDEDD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *__p,uint64_t a50,int a51,__int16 a52,char a53,char a54)
{
  void *v54;
  int v55;

  if (a54 < 0)
  {
    operator delete(__p);
    if ((v55 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v55)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v54);
  goto LABEL_6;
}

void UC::Exception::InvalidEncodingInput::~InvalidEncodingInput(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)off_24E6B2678;
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
}

{
  void *v2;

  this->__vftable = (std::exception_vtbl *)off_24E6B2678;
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
  operator delete(v2);
}

{
  this->__vftable = (std::exception_vtbl *)off_24E6B2678;
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
}

_QWORD *std::istringstream::basic_istringstream[abi:ne180100](_QWORD *a1, const std::string *a2, int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  std::ios_base *v11;

  v6 = MEMORY[0x24BEDB868];
  v7 = MEMORY[0x24BEDB868] + 64;
  a1[15] = MEMORY[0x24BEDB868] + 64;
  v8 = (uint64_t)(a1 + 2);
  v9 = *(_QWORD *)(MEMORY[0x24BEDB7F8] + 8);
  v10 = *(_QWORD *)(MEMORY[0x24BEDB7F8] + 16);
  *a1 = v9;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v9 - 24)) = v10;
  a1[1] = 0;
  v11 = (std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  std::ios_base::init(v11, a1 + 2);
  v11[1].__vftable = 0;
  v11[1].__fmtflags_ = -1;
  *a1 = v6 + 24;
  a1[15] = v7;
  std::stringbuf::basic_stringbuf[abi:ne180100](v8, a2, a3 | 8);
  return a1;
}

void sub_220DDEF44(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::istream::~istream();
  MEMORY[0x2276664A4](v1);
  _Unwind_Resume(a1);
}

uint64_t std::istringstream::~istringstream(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7F8];
  v3 = *MEMORY[0x24BEDB7F8];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F8];
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(a1 + 16) = MEMORY[0x24BEDB848] + 16;
  if (*(char *)(a1 + 103) < 0)
    operator delete(*(void **)(a1 + 80));
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x2276664A4](a1 + 120);
  return a1;
}

void UC::UCLEB128Coder::encode(uint64_t a1@<X0>, uint64_t *a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  void **v7;
  std::string::size_type v8;
  void *__p[2];
  unsigned __int8 v10;

  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  v3 = *a2;
  v4 = a2[1];
  if (*a2 != v4)
  {
    do
    {
      (*(void (**)(void **__return_ptr, uint64_t, uint64_t))(*(_QWORD *)a1 + 32))(__p, a1, v3);
      if ((v10 & 0x80u) == 0)
        v7 = __p;
      else
        v7 = (void **)__p[0];
      if ((v10 & 0x80u) == 0)
        v8 = v10;
      else
        v8 = (std::string::size_type)__p[1];
      std::string::append(a3, (const std::string::value_type *)v7, v8);
      if ((char)v10 < 0)
        operator delete(__p[0]);
      v3 += 24;
    }
    while (v3 != v4);
  }
}

void sub_220DDF094(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v15 + 23) < 0)
    operator delete(*(void **)v15);
  _Unwind_Resume(exception_object);
}

uint64_t UC::UCLEB128Coder::decode(int a1, UC::UCBitStream *this)
{
  int v3;
  uint64_t v4;
  int NextBit;
  unsigned int v6;
  unint64_t v7;
  _QWORD v10[11];
  char v11;
  uint64_t v12;

  v3 = 0;
  v4 = 0;
  do
  {
    NextBit = UC::UCBitStream::readNextBit(this);
    v6 = 0;
    v7 = 0;
    do
      v7 = (int)UC::UCBitStream::readNextBit(this) | (2 * v7);
    while (v6++ < 6);
    v4 |= v7 << (7 * v3++);
  }
  while (NextBit);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v10);
  std::ostream::operator<<();
  std::stringbuf::str();
  v10[0] = *MEMORY[0x24BEDB800];
  *(_QWORD *)((char *)v10 + *(_QWORD *)(v10[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB800] + 24);
  v10[1] = MEMORY[0x24BEDB848] + 16;
  if (v11 < 0)
    operator delete((void *)v10[9]);
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x2276664A4](&v12);
}

void sub_220DDF1E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t UC::Exception::InvalidEncodingInput::InvalidEncodingInput(uint64_t a1, void *__src, size_t __len)
{
  void *v4;
  size_t v7;
  size_t v8;

  *(_QWORD *)a1 = off_24E6B2678;
  v4 = (void *)(a1 + 8);
  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v4 = operator new(v7 + 1);
    *(_QWORD *)(a1 + 16) = __len;
    *(_QWORD *)(a1 + 24) = v8 | 0x8000000000000000;
    *(_QWORD *)(a1 + 8) = v4;
  }
  else
  {
    *(_BYTE *)(a1 + 31) = __len;
    if (!__len)
      goto LABEL_9;
  }
  memmove(v4, __src, __len);
LABEL_9:
  *((_BYTE *)v4 + __len) = 0;
  return a1;
}

void sub_220DDF2B8(_Unwind_Exception *a1)
{
  std::exception *v1;

  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

uint64_t UC::Exception::InvalidEncodingInput::what(UC::Exception::InvalidEncodingInput *this)
{
  uint64_t result;

  result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0)
    return *(_QWORD *)result;
  return result;
}

uint64_t std::stringbuf::basic_stringbuf[abi:ne180100](uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6;

  v6 = std::streambuf::basic_streambuf();
  *(_QWORD *)v6 = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  std::stringbuf::__init_buf_ptrs[abi:ne180100](a1);
  return a1;
}

void sub_220DDF394(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 87) < 0)
    operator delete(*v2);
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

void std::stringbuf::__init_buf_ptrs[abi:ne180100](uint64_t a1)
{
  std::string *v2;
  char v3;
  std::string *v4;
  unint64_t v5;
  int v6;
  std::string::size_type v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  *(_QWORD *)(a1 + 88) = 0;
  v2 = (std::string *)(a1 + 64);
  v3 = *(_BYTE *)(a1 + 87);
  if (v3 < 0)
  {
    v4 = *(std::string **)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 72);
  }
  else
  {
    v4 = v2;
    v5 = *(unsigned __int8 *)(a1 + 87);
  }
  v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(_QWORD *)(a1 + 88) = (char *)v4 + v5;
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v4;
    *(_QWORD *)(a1 + 32) = (char *)v4 + v5;
  }
  if ((v6 & 0x10) != 0)
  {
    *(_QWORD *)(a1 + 88) = (char *)v4 + v5;
    v7 = v3 < 0 ? (*(_QWORD *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize(v2, v7, 0);
    v8 = *(char *)(a1 + 87) < 0 ? *(_QWORD *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(_QWORD *)(a1 + 40) = v4;
    *(_QWORD *)(a1 + 48) = v4;
    *(_QWORD *)(a1 + 56) = (char *)v4 + v8;
    if ((*(_BYTE *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        v5 = v5 - v10 - 0x7FFFFFFF;
        *(_QWORD *)(a1 + 48) = v4;
      }
      if (v5)
        *(_QWORD *)(a1 + 48) = (char *)v4 + v5;
    }
  }
}

uint64_t UC::UCHuffmanTreeNode::UCHuffmanTreeNode(uint64_t a1, __int128 *a2, int a3)
{
  std::string *v5;
  __int128 v6;

  v5 = (std::string *)(a1 + 16);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v6 = *a2;
    v5->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  *(_DWORD *)(a1 + 40) = a3;
  return a1;
}

void sub_220DDF520(_Unwind_Exception *a1)
{
  uint64_t *v1;

  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v1 + 1, 0);
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

uint64_t UC::UCHuffmanTreeNode::UCHuffmanTreeNode(uint64_t a1, uint64_t *a2, uint64_t *a3, int a4, __int128 *a5)
{
  uint64_t v7;
  uint64_t v8;
  std::string *v9;
  __int128 v10;

  v7 = *a2;
  *a2 = 0;
  *(_QWORD *)a1 = v7;
  v8 = *a3;
  *a3 = 0;
  *(_QWORD *)(a1 + 8) = v8;
  v9 = (std::string *)(a1 + 16);
  if (*((char *)a5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a5, *((_QWORD *)a5 + 1));
  }
  else
  {
    v10 = *a5;
    v9->__r_.__value_.__r.__words[2] = *((_QWORD *)a5 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v10;
  }
  *(_DWORD *)(a1 + 40) = a4;
  return a1;
}

void sub_220DDF5B8(_Unwind_Exception *a1)
{
  uint64_t *v1;
  uint64_t *v2;

  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v2, 0);
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

_QWORD *UC::UCHuffmanCoder::UCHuffmanCoder(_QWORD *a1, _QWORD **a2)
{
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int FrequencyForSymbol;
  _DWORD *v8;
  __int128 v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t ***v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  _DWORD *v31;
  uint64_t *v32;
  std::__shared_weak_count *v33;
  uint64_t ***v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char v38;
  std::string v39;

  *a1 = off_24E6B26A0;
  a1[1] = 0;
  a1[2] = 0;
  v3 = a1 + 2;
  v4 = *a2;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  v37 = &v38;
  UC::UCMultiContextSymbolFrequencyTrie::getOrderedSymbols(v4, &v32);
  v5 = *v32;
  v6 = v32[1];
  while (v5 != v6)
  {
    FrequencyForSymbol = UC::UCSymbolFrequencyTable::getFrequencyForSymbol((uint64_t)v4, v5);
    v8 = operator new(0x30uLL);
    if (*(char *)(v5 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v39, *(const std::string::value_type **)v5, *(_QWORD *)(v5 + 8));
    }
    else
    {
      v9 = *(_OWORD *)v5;
      v39.__r_.__value_.__r.__words[2] = *(_QWORD *)(v5 + 16);
      *(_OWORD *)&v39.__r_.__value_.__l.__data_ = v9;
    }
    UC::UCHuffmanTreeNode::UCHuffmanTreeNode((uint64_t)v8, (__int128 *)&v39, FrequencyForSymbol);
    v31 = v8;
    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v39.__r_.__value_.__l.__data_);
    v10 = (uint64_t *)operator new(8uLL);
    v11 = (uint64_t)v31;
    v30 = v10;
    v31 = 0;
    v39.__r_.__value_.__r.__words[0] = 0;
    *v10 = v11;
    std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100]((uint64_t *)&v39, 0);
    std::priority_queue<std::unique_ptr<UCHuffmanNodeWrapper>,std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0>::push((uint64_t *)&v34, (uint64_t *)&v30);
    v12 = v30;
    if (v30)
    {
      std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v30, 0);
      operator delete(v12);
    }
    std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100]((uint64_t *)&v31, 0);
    v5 += 24;
  }
  v13 = v34;
  if ((unint64_t)(v35 - (_QWORD)v34) >= 9)
  {
    do
    {
      v14 = (uint64_t *)*v13;
      v15 = *v14;
      *v14 = 0;
      v31 = (_DWORD *)v15;
      std::priority_queue<std::unique_ptr<UCHuffmanNodeWrapper>,std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0>::pop((uint64_t)&v34);
      v16 = **v34;
      **v34 = 0;
      v30 = v16;
      std::priority_queue<std::unique_ptr<UCHuffmanNodeWrapper>,std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0>::pop((uint64_t)&v34);
      LODWORD(v39.__r_.__value_.__l.__data_) = *((_DWORD *)v30 + 10) + v31[10];
      std::make_unique[abi:ne180100]<UC::UCHuffmanTreeNode,std::unique_ptr<UC::UCHuffmanTreeNode>,std::unique_ptr<UC::UCHuffmanTreeNode>,unsigned int,char const(&)[1]>((uint64_t *)&v31, (uint64_t *)&v30, &v39, "", &v29);
      v17 = (uint64_t *)operator new(8uLL);
      v18 = v29;
      v28 = v17;
      v29 = 0;
      v39.__r_.__value_.__r.__words[0] = 0;
      *v17 = v18;
      std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100]((uint64_t *)&v39, 0);
      std::priority_queue<std::unique_ptr<UCHuffmanNodeWrapper>,std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0>::push((uint64_t *)&v34, (uint64_t *)&v28);
      v19 = v28;
      if (v28)
      {
        std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v28, 0);
        operator delete(v19);
      }
      std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](&v29, 0);
      std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100]((uint64_t *)&v30, 0);
      std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100]((uint64_t *)&v31, 0);
      v13 = v34;
    }
    while ((unint64_t)(v35 - (_QWORD)v34) > 8);
  }
  v20 = (uint64_t *)*v13;
  v21 = *v20;
  *v20 = 0;
  v27 = v21;
  v22 = v33;
  if (v33)
  {
    p_shared_owners = (unint64_t *)&v33->__shared_owners_;
    do
      v24 = __ldaxr(p_shared_owners);
    while (__stlxr(v24 - 1, p_shared_owners));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v39.__r_.__value_.__r.__words[0] = (std::string::size_type)&v34;
  std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v39);
  v25 = v27;
  v27 = 0;
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v3, v25);
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](&v27, 0);
  return a1;
}

void sub_220DDF898(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, int a19, __int16 a20,char a21,char a22,char *a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  uint64_t *v35;
  uint64_t *v36;

  a23 = &a25;
  std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a23);
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v35, 0);
  std::unique_ptr<std::unordered_map<std::string,std::string>>::reset[abi:ne180100](v36, 0);
  _Unwind_Resume(a1);
}

void UC::UCHuffmanCoder::_initilizeSymbolToCodeMap(uint64_t **this)
{
  uint64_t *v1;
  _OWORD *v3;
  std::string __p;

  v1 = (uint64_t *)(this + 1);
  if (!this[1])
  {
    v3 = operator new(0x28uLL);
    *v3 = 0u;
    v3[1] = 0u;
    *((_DWORD *)v3 + 8) = 1065353216;
    std::string::basic_string[abi:ne180100]<0>(&__p, "");
    _generateSymbolToCodeMapHelper((uint64_t)v3, &__p, this[2]);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    std::unique_ptr<std::unordered_map<std::string,std::string>>::reset[abi:ne180100](v1, (uint64_t)v3);
  }
}

void sub_220DDFA04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;
  void *v17;

  if (a15 < 0)
    operator delete(__p);
  v17 = (void *)std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table(v15);
  operator delete(v17);
  _Unwind_Resume(a1);
}

void _generateSymbolToCodeMapHelper(uint64_t a1, std::string *a2, uint64_t *a3)
{
  std::string *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  std::string *v9;
  uint64_t v10;
  unsigned __int8 *v11;
  std::string __p;
  std::string v13;
  std::string v14;
  std::string *v15;

  v4 = a2;
  v6 = *a3;
  if (*a3)
  {
    std::string::push_back(a2, 48);
    if (SHIBYTE(v4->__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v13, v4->__r_.__value_.__l.__data_, v4->__r_.__value_.__l.__size_);
    else
      v13 = *v4;
    _generateSymbolToCodeMapHelper(a1, &v13, v6);
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v13.__r_.__value_.__l.__data_);
    if (SHIBYTE(v4->__r_.__value_.__r.__words[2]) < 0)
    {
      v9 = (std::string *)v4->__r_.__value_.__r.__words[0];
      v8 = v4->__r_.__value_.__l.__size_ - 1;
      v4->__r_.__value_.__l.__size_ = v8;
    }
    else
    {
      v8 = HIBYTE(v4->__r_.__value_.__r.__words[2]) - 1;
      *((_BYTE *)&v4->__r_.__value_.__s + 23) = v8 & 0x7F;
      v9 = v4;
    }
    v9->__r_.__value_.__s.__data_[v8] = 0;
    v7 = a3[1];
    if (v7)
      goto LABEL_14;
  }
  else
  {
    v7 = a3[1];
    if (v7)
    {
LABEL_14:
      std::string::push_back(v4, 49);
      if (SHIBYTE(v4->__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&__p, v4->__r_.__value_.__l.__data_, v4->__r_.__value_.__l.__size_);
      else
        __p = *v4;
      _generateSymbolToCodeMapHelper(a1, &__p, v7);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v4->__r_.__value_.__r.__words[2]) < 0)
      {
        v10 = v4->__r_.__value_.__l.__size_ - 1;
        v4->__r_.__value_.__l.__size_ = v10;
        v4 = (std::string *)v4->__r_.__value_.__r.__words[0];
      }
      else
      {
        v10 = HIBYTE(v4->__r_.__value_.__r.__words[2]) - 1;
        *((_BYTE *)&v4->__r_.__value_.__s + 23) = v10 & 0x7F;
      }
      v4->__r_.__value_.__s.__data_[v10] = 0;
      return;
    }
    if (*((char *)a3 + 39) < 0)
      std::string::__init_copy_ctor_external(&v14, (const std::string::value_type *)a3[2], a3[3]);
    else
      v14 = *(std::string *)(a3 + 2);
    v15 = &v14;
    v11 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, (unsigned __int8 *)&v14, (uint64_t)&std::piecewise_construct, (__int128 **)&v15);
    std::string::operator=((std::string *)(v11 + 40), v4);
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v14.__r_.__value_.__l.__data_);
  }
}

void sub_220DDFBF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void UC::UCHuffmanCoder::encode(uint64_t **a1@<X0>, unsigned __int8 *a2@<X1>, std::string *a3@<X8>)
{
  unsigned __int8 *v6;
  __int128 v7;
  void *exception;
  void *v9;
  int v10;
  unsigned __int8 *v11;
  uint64_t v12;

  UC::UCHuffmanCoder::_initilizeSymbolToCodeMap(a1);
  v6 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::find<std::string>(a1[1], a2);
  if (!v6)
  {
    exception = __cxa_allocate_exception(0x38uLL);
    v9 = exception;
    v10 = (char)a2[23];
    if (v10 >= 0)
      v11 = a2;
    else
      v11 = *(unsigned __int8 **)a2;
    if (v10 >= 0)
      v12 = a2[23];
    else
      v12 = *((_QWORD *)a2 + 1);
    UC::Exception::UnsupportedEncodingSymbol::UnsupportedEncodingSymbol(exception, v11, v12, "Huffman coder encountered an unsupported symbol", 47);
  }
  if ((char)v6[63] < 0)
  {
    std::string::__init_copy_ctor_external(a3, *((const std::string::value_type **)v6 + 5), *((_QWORD *)v6 + 6));
  }
  else
  {
    v7 = *(_OWORD *)(v6 + 40);
    a3->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 7);
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v7;
  }
}

void sub_220DDFCFC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void UC::Exception::UnsupportedEncodingSymbol::~UnsupportedEncodingSymbol(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)off_24E6B2708;
  if (SHIBYTE(this[6].__vftable) < 0)
    operator delete(this[4].__vftable);
  this->__vftable = (std::exception_vtbl *)off_24E6B2678;
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
}

{
  void *v2;

  this->__vftable = (std::exception_vtbl *)off_24E6B2708;
  if (SHIBYTE(this[6].__vftable) < 0)
    operator delete(this[4].__vftable);
  this->__vftable = (std::exception_vtbl *)off_24E6B2678;
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
  operator delete(v2);
}

void UC::UCHuffmanCoder::encode(uint64_t a1@<X0>, uint64_t *a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  void **v7;
  std::string::size_type v8;
  void *__p[2];
  unsigned __int8 v10;

  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  v3 = *a2;
  v4 = a2[1];
  if (*a2 != v4)
  {
    do
    {
      (*(void (**)(void **__return_ptr, uint64_t, uint64_t))(*(_QWORD *)a1 + 32))(__p, a1, v3);
      if ((v10 & 0x80u) == 0)
        v7 = __p;
      else
        v7 = (void **)__p[0];
      if ((v10 & 0x80u) == 0)
        v8 = v10;
      else
        v8 = (std::string::size_type)__p[1];
      std::string::append(a3, (const std::string::value_type *)v7, v8);
      if ((char)v10 < 0)
        operator delete(__p[0]);
      v3 += 24;
    }
    while (v3 != v4);
  }
}

void sub_220DDFE10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v15 + 23) < 0)
    operator delete(*(void **)v15);
  _Unwind_Resume(exception_object);
}

void UC::UCHuffmanCoder::decode(UC::UCBitStream *this@<X1>, uint64_t a2@<X0>, unsigned __int8 *a3@<X2>, std::string *a4@<X8>)
{
  uint64_t v8;
  int v9;
  std::string::size_type v10;
  uint64_t v11;
  int v12;
  unsigned __int8 *v13;
  void **p_s1;
  char v15;
  void *v16;
  const std::string::value_type *v17;
  void *__s1;
  size_t __n;
  unsigned __int8 v20;

  a4->__r_.__value_.__r.__words[0] = 0;
  a4->__r_.__value_.__l.__size_ = 0;
  a4->__r_.__value_.__r.__words[2] = 0;
  while (UC::UCBitStream::hasMore(this))
  {
    (*(void (**)(void **__return_ptr, uint64_t, UC::UCBitStream *))(*(_QWORD *)a2 + 56))(&__s1, a2, this);
    v8 = v20;
    v9 = (char)v20;
    if ((v20 & 0x80u) == 0)
      v10 = v20;
    else
      v10 = __n;
    v11 = a3[23];
    v12 = (char)v11;
    if ((v11 & 0x80u) != 0)
      v11 = *((_QWORD *)a3 + 1);
    if (v10 == v11)
    {
      if (v12 >= 0)
        v13 = a3;
      else
        v13 = *(unsigned __int8 **)a3;
      if ((char)v20 < 0)
      {
        v16 = __s1;
        if (!memcmp(__s1, v13, __n))
        {
          operator delete(v16);
          return;
        }
      }
      else
      {
        if (!v20)
          return;
        p_s1 = &__s1;
        while (*(unsigned __int8 *)p_s1 == *v13)
        {
          p_s1 = (void **)((char *)p_s1 + 1);
          ++v13;
          if (!--v8)
          {
            v15 = 0;
            if ((v20 & 0x80) == 0)
              goto LABEL_24;
            goto LABEL_26;
          }
        }
      }
    }
    if (v9 >= 0)
      v17 = (const std::string::value_type *)&__s1;
    else
      v17 = (const std::string::value_type *)__s1;
    std::string::append(a4, v17, v10);
    v15 = 1;
    if ((v20 & 0x80) != 0)
    {
LABEL_26:
      operator delete(__s1);
      if ((v15 & 1) == 0)
        return;
    }
    else
    {
LABEL_24:
      if ((v15 & 1) == 0)
        return;
    }
  }
}

void sub_220DDFF84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v15 + 23) < 0)
    operator delete(*(void **)v15);
  _Unwind_Resume(exception_object);
}

uint64_t UC::UCHuffmanCoder::canEncode(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  BOOL v6;

  v2 = *a2;
  v3 = a2[1];
  if (*a2 == v3)
    return 1;
  do
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, v2);
    v2 += 24;
    if ((_DWORD)result)
      v6 = v2 == v3;
    else
      v6 = 1;
  }
  while (!v6);
  return result;
}

BOOL UC::UCHuffmanCoder::canEncode(uint64_t **a1, unsigned __int8 *a2)
{
  UC::UCHuffmanCoder::_initilizeSymbolToCodeMap(a1);
  return std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::find<std::string>(a1[1], a2) != 0;
}

void UC::UCHuffmanCoder::decodeNextSymbol(UC::UCHuffmanCoder *this@<X0>, UC::UCBitStream *a2@<X1>, std::string *a3@<X8>)
{
  _QWORD *v5;
  int NextBit;
  _QWORD *v7;
  void *exception;
  __int128 v9;

  v5 = (_QWORD *)*((_QWORD *)this + 2);
  if (!UC::UCBitStream::hasMore(a2))
  {
LABEL_7:
    exception = __cxa_allocate_exception(0x38uLL);
    UC::Exception::InvalidDecodingSymbolInstruction::InvalidDecodingSymbolInstruction(exception, "", 0, "Huffman decoder encountered an invalid symbol instruction. The encoding bit stream is invalid", 93);
  }
  while (1)
  {
    NextBit = UC::UCBitStream::readNextBit(a2);
    v7 = v5 + 1;
    if (!NextBit)
      v7 = v5;
    v5 = (_QWORD *)*v7;
    if (!*(_QWORD *)*v7 && !v5[1])
      break;
    if (!UC::UCBitStream::hasMore(a2))
      goto LABEL_7;
  }
  if (*((char *)v5 + 39) < 0)
  {
    std::string::__init_copy_ctor_external(a3, (const std::string::value_type *)v5[2], v5[3]);
  }
  else
  {
    v9 = *((_OWORD *)v5 + 1);
    a3->__r_.__value_.__r.__words[2] = v5[4];
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v9;
  }
}

void sub_220DE0130(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void UC::Exception::InvalidDecodingSymbolInstruction::~InvalidDecodingSymbolInstruction(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)off_24E6B2730;
  if (SHIBYTE(this[6].__vftable) < 0)
    operator delete(this[4].__vftable);
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
}

{
  void *v2;

  this->__vftable = (std::exception_vtbl *)off_24E6B2730;
  if (SHIBYTE(this[6].__vftable) < 0)
    operator delete(this[4].__vftable);
  if (SHIBYTE(this[3].__vftable) < 0)
    operator delete(this[1].__vftable);
  std::exception::~exception(this);
  operator delete(v2);
}

void UC::UCHuffmanCoder::~UCHuffmanCoder(UC::UCHuffmanCoder *this)
{
  uint64_t *v1;

  *(_QWORD *)this = off_24E6B26A0;
  v1 = (uint64_t *)((char *)this + 8);
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100]((uint64_t *)this + 2, 0);
  std::unique_ptr<std::unordered_map<std::string,std::string>>::reset[abi:ne180100](v1, 0);
}

{
  uint64_t *v2;

  *(_QWORD *)this = off_24E6B26A0;
  v2 = (uint64_t *)((char *)this + 8);
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100]((uint64_t *)this + 2, 0);
  std::unique_ptr<std::unordered_map<std::string,std::string>>::reset[abi:ne180100](v2, 0);
  operator delete(this);
}

void std::priority_queue<std::unique_ptr<UCHuffmanNodeWrapper>,std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0>::push(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  int64x2_t v21;
  uint64_t v22;
  uint64_t v23;
  int64x2_t v24;
  char *v25;
  uint64_t v26;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(_QWORD **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    v10 = ((uint64_t)v7 - *a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61)
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    v11 = v5 - *a1;
    v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1))
      v12 = v10 + 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v12;
    v26 = v4;
    if (v13)
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<UCHuffmanNodeWrapper>>>(v4, v13);
    else
      v14 = 0;
    v15 = &v14[8 * v10];
    v16 = &v14[8 * v13];
    v25 = v16;
    v17 = *a2;
    *a2 = 0;
    *(_QWORD *)v15 = v17;
    v9 = (uint64_t)(v15 + 8);
    v24.i64[1] = (uint64_t)(v15 + 8);
    v19 = (_QWORD *)*a1;
    v18 = (_QWORD *)a1[1];
    if (v18 == (_QWORD *)*a1)
    {
      v21 = vdupq_n_s64((unint64_t)v18);
    }
    else
    {
      do
      {
        v20 = *--v18;
        *v18 = 0;
        *((_QWORD *)v15 - 1) = v20;
        v15 -= 8;
      }
      while (v18 != v19);
      v21 = *(int64x2_t *)a1;
      v9 = v24.i64[1];
      v16 = v25;
    }
    *a1 = (uint64_t)v15;
    a1[1] = v9;
    v24 = v21;
    v22 = a1[2];
    a1[2] = (uint64_t)v16;
    v25 = (char *)v22;
    v23 = v21.i64[0];
    std::__split_buffer<std::unique_ptr<UCHuffmanNodeWrapper>>::~__split_buffer((uint64_t)&v23);
  }
  else
  {
    v8 = *a2;
    *a2 = 0;
    *v7 = v8;
    v9 = (uint64_t)(v7 + 1);
  }
  a1[1] = v9;
  std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0 &,std::__wrap_iter<std::unique_ptr<UCHuffmanNodeWrapper> *>>(*a1, v9, (v9 - *a1) >> 3);
}

void std::priority_queue<std::unique_ptr<UCHuffmanNodeWrapper>,std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0>::pop(uint64_t a1)
{
  uint64_t **v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t **v8;
  uint64_t **v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t **v13;
  uint64_t *v14;
  uint64_t **v15;
  uint64_t *v16;

  v2 = *(uint64_t ***)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = v3 - *(_QWORD *)a1;
  if (v4 >= 9)
  {
    v5 = 0;
    v6 = v4 >> 3;
    v16 = *v2;
    *v2 = 0;
    v7 = (unint64_t)((v4 >> 3) - 2) >> 1;
    v8 = v2;
    do
    {
      v9 = &v8[v5 + 1];
      v10 = (2 * v5) | 1;
      v11 = 2 * v5 + 2;
      if (v11 < v6
        && createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0::operator()((uint64_t ***)&v8[v5 + 1], (uint64_t ***)&v8[v5 + 2]))
      {
        ++v9;
        v10 = v11;
      }
      v12 = *v9;
      *v9 = 0;
      std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100](v8, v12);
      v8 = v9;
      v5 = v10;
    }
    while (v10 <= v7);
    v13 = (uint64_t **)(v3 - 8);
    if (v9 == (uint64_t **)(v3 - 8))
    {
      std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100](v9, v16);
    }
    else
    {
      v14 = *v13;
      *v13 = 0;
      std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100](v9, v14);
      std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100]((uint64_t **)(v3 - 8), v16);
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0 &,std::__wrap_iter<std::unique_ptr<UCHuffmanNodeWrapper> *>>((uint64_t)v2, (uint64_t)(v9 + 1), v9 + 1 - v2);
    }
  }
  v15 = (uint64_t **)(*(_QWORD *)(a1 + 8) - 8);
  std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100](v15, 0);
  *(_QWORD *)(a1 + 8) = v15;
}

void sub_220DE0488(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t *a10)
{
  if (a10)
    std::priority_queue<std::unique_ptr<UCHuffmanNodeWrapper>,std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0>::pop(a10);
  _Unwind_Resume(exception_object);
}

void std::make_unique[abi:ne180100]<UC::UCHuffmanTreeNode,std::unique_ptr<UC::UCHuffmanTreeNode>,std::unique_ptr<UC::UCHuffmanTreeNode>,unsigned int,char const(&)[1]>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, _QWORD *a5@<X8>)
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *__p[2];
  char v14;
  uint64_t v15;
  uint64_t v16;

  v10 = operator new(0x30uLL);
  v11 = *a1;
  *a1 = 0;
  v12 = *a2;
  *a2 = 0;
  v15 = v12;
  v16 = v11;
  LODWORD(a3) = *a3;
  std::string::basic_string[abi:ne180100]<0>(__p, a4);
  UC::UCHuffmanTreeNode::UCHuffmanTreeNode((uint64_t)v10, &v16, &v15, (int)a3, (__int128 *)__p);
  *a5 = v10;
  if (v14 < 0)
    operator delete(__p[0]);
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](&v15, 0);
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](&v16, 0);
}

void sub_220DE055C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  void *v17;

  if (a15 < 0)
    operator delete(__p);
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](&a16, 0);
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](&a17, 0);
  operator delete(v17);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<UCHuffmanNodeWrapper>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

uint64_t std::__split_buffer<std::unique_ptr<UCHuffmanNodeWrapper>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100]((uint64_t **)(i - 8), 0);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0 &,std::__wrap_iter<std::unique_ptr<UCHuffmanNodeWrapper> *>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v5;
  uint64_t ***v6;
  uint64_t **v7;
  uint64_t *v8;
  uint64_t **v9;
  uint64_t **v10;
  uint64_t **v11;

  v3 = a3 - 2;
  if (a3 >= 2)
  {
    v5 = v3 >> 1;
    v6 = (uint64_t ***)(a1 + 8 * (v3 >> 1));
    v7 = (uint64_t **)(a2 - 8);
    if (createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0::operator()(v6, (uint64_t ***)(a2 - 8)))
    {
      v8 = *v7;
      *v7 = 0;
      v11 = (uint64_t **)v8;
      do
      {
        v9 = (uint64_t **)v6;
        v10 = *v6;
        *v6 = 0;
        std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100](v7, (uint64_t *)v10);
        if (!v5)
          break;
        v5 = (v5 - 1) >> 1;
        v6 = (uint64_t ***)(a1 + 8 * v5);
        v7 = v9;
      }
      while (createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0::operator()(v6, &v11));
      std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100](v9, v8);
    }
  }
}

void sub_220DE06CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100]((uint64_t **)va, 0);
  _Unwind_Resume(a1);
}

BOOL createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0::operator()(uint64_t ***a1, uint64_t ***a2)
{
  uint64_t *v2;
  unsigned int v3;
  uint64_t *v4;
  unsigned int v5;
  uint64_t *v7;
  _BOOL8 v8;
  uint64_t *v9;
  int v10;
  void *v11;
  char v12;
  std::string::size_type size;
  std::string *v14;
  std::string::size_type v15;
  std::string *v16;
  size_t v17;
  int v18;
  int v19;
  std::string v21;
  std::string v22;

  v2 = **a1;
  v3 = *((_DWORD *)v2 + 10);
  v4 = **a2;
  v5 = *((_DWORD *)v4 + 10);
  if (v3 == v5)
  {
    do
    {
      do
      {
        v7 = v2;
        v2 = (uint64_t *)*v2;
      }
      while (v2);
    }
    while (v7[1]);
    if (*((char *)v7 + 39) < 0)
    {
      std::string::__init_copy_ctor_external(&v22, (const std::string::value_type *)v7[2], v7[3]);
      v4 = **a2;
    }
    else
    {
      v22 = *(std::string *)(v7 + 2);
    }
    do
    {
      do
      {
        v9 = v4;
        v4 = (uint64_t *)*v4;
      }
      while (v4);
    }
    while (v9[1]);
    if (*((char *)v9 + 39) < 0)
      std::string::__init_copy_ctor_external(&v21, (const std::string::value_type *)v9[2], v9[3]);
    else
      v21 = *(std::string *)(v9 + 2);
    v10 = SHIBYTE(v21.__r_.__value_.__r.__words[2]);
    v11 = (void *)v21.__r_.__value_.__r.__words[0];
    v12 = HIBYTE(v22.__r_.__value_.__r.__words[2]);
    if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v22.__r_.__value_.__r.__words[2]);
    else
      size = v22.__r_.__value_.__l.__size_;
    if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v14 = &v22;
    else
      v14 = (std::string *)v22.__r_.__value_.__r.__words[0];
    if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v15 = HIBYTE(v21.__r_.__value_.__r.__words[2]);
    else
      v15 = v21.__r_.__value_.__l.__size_;
    if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v16 = &v21;
    else
      v16 = (std::string *)v21.__r_.__value_.__r.__words[0];
    if (v15 >= size)
      v17 = size;
    else
      v17 = v15;
    v18 = memcmp(v14, v16, v17);
    if (size < v15)
      v19 = -1;
    else
      v19 = v15 < size;
    if (v18)
      v19 = v18;
    v8 = v19 > 0;
    if (v10 < 0)
    {
      operator delete(v11);
      if ((*((_BYTE *)&v22.__r_.__value_.__s + 23) & 0x80) == 0)
        return v8;
    }
    else if ((v12 & 0x80) == 0)
    {
      return v8;
    }
    operator delete(v22.__r_.__value_.__l.__data_);
    return v8;
  }
  return v3 > v5;
}

void sub_220DE0850(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100](uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;

  v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v2, 0);
    operator delete(v2);
  }
}

void std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  uint64_t **v2;
  uint64_t **v4;
  void *v5;

  v1 = *a1;
  v2 = (uint64_t **)**a1;
  if (v2)
  {
    v4 = (uint64_t **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
        std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100](--v4, 0);
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v26[3];

  v8 = (_QWORD *)(a1 + 24);
  v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    v19 = 1;
    if (v11 >= 3)
      v19 = (v11 & (v11 - 1)) != 0;
    v20 = v19 | (2 * v11);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(a1, v22);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    *(_QWORD *)v26[0] = *v23;
    *v23 = v26[0];
  }
  else
  {
    *(_QWORD *)v26[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v26[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v26[0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11)
          v24 %= v11;
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  v26[0] = 0;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)v26, 0);
  return i;
}

void sub_220DE0BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  std::string *v9;
  __int128 *v10;
  __int128 v11;

  v7 = a1 + 16;
  v8 = operator new(0x40uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *v8 = 0;
  v8[1] = a2;
  v9 = (std::string *)(v8 + 2);
  v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((_QWORD *)v10 + 1));
  }
  else
  {
    v11 = *v10;
    v8[4] = *((_QWORD *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  v8[5] = 0;
  v8[6] = 0;
  v8[7] = 0;
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_220DE0C40(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](v1, 0);
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

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
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

void std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
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

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t UC::Exception::UnsupportedEncodingSymbol::UnsupportedEncodingSymbol(uint64_t a1, const void *a2, size_t a3, void *__src, size_t __len)
{
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = (_QWORD *)UC::Exception::InvalidEncodingInput::InvalidEncodingInput(a1, __src, __len);
  *v8 = off_24E6B2708;
  v9 = v8 + 4;
  if (a3 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a3 >= 0x17)
  {
    v10 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17)
      v10 = a3 | 7;
    v11 = v10 + 1;
    v9 = operator new(v10 + 1);
    *(_QWORD *)(a1 + 40) = a3;
    *(_QWORD *)(a1 + 48) = v11 | 0x8000000000000000;
    *(_QWORD *)(a1 + 32) = v9;
  }
  else
  {
    *(_BYTE *)(a1 + 55) = a3;
    if (!a3)
      goto LABEL_9;
  }
  memmove(v9, a2, a3);
LABEL_9:
  *((_BYTE *)v9 + a3) = 0;
  return a1;
}

void sub_220DE1524(_Unwind_Exception *a1)
{
  std::exception *v1;

  UC::Exception::InvalidEncodingInput::~InvalidEncodingInput(v1);
  _Unwind_Resume(a1);
}

uint64_t UC::Exception::InvalidDecodingSymbolInstruction::InvalidDecodingSymbolInstruction(uint64_t a1, void *__src, size_t __len, void *a4, size_t a5)
{
  void *v10;
  size_t v11;
  size_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)a1 = off_24E6B2730;
  if (__len > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v11 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v11 = __len | 7;
    v12 = v11 + 1;
    v10 = operator new(v11 + 1);
    *(_QWORD *)(a1 + 16) = __len;
    *(_QWORD *)(a1 + 24) = v12 | 0x8000000000000000;
    *(_QWORD *)(a1 + 8) = v10;
    goto LABEL_8;
  }
  *(_BYTE *)(a1 + 31) = __len;
  v10 = (void *)(a1 + 8);
  if (__len)
LABEL_8:
    memmove(v10, __src, __len);
  *((_BYTE *)v10 + __len) = 0;
  v13 = (void *)(a1 + 32);
  if (a5 > 0x7FFFFFFFFFFFFFF7)
    std::string::__throw_length_error[abi:ne180100]();
  if (a5 >= 0x17)
  {
    v14 = (a5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a5 | 7) != 0x17)
      v14 = a5 | 7;
    v15 = v14 + 1;
    v13 = operator new(v14 + 1);
    *(_QWORD *)(a1 + 40) = a5;
    *(_QWORD *)(a1 + 48) = v15 | 0x8000000000000000;
    *(_QWORD *)(a1 + 32) = v13;
  }
  else
  {
    *(_BYTE *)(a1 + 55) = a5;
    if (!a5)
      goto LABEL_17;
  }
  memmove(v13, a4, a5);
LABEL_17:
  *((_BYTE *)v13 + a5) = 0;
  return a1;
}

void sub_220DE1718(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 31) < 0)
    operator delete(*v2);
  std::exception::~exception((std::exception *)v1);
  _Unwind_Resume(a1);
}

uint64_t UC::Exception::InvalidDecodingSymbolInstruction::what(UC::Exception::InvalidDecodingSymbolInstruction *this)
{
  uint64_t result;

  result = (uint64_t)this + 32;
  if (*((char *)this + 55) < 0)
    return *(_QWORD *)result;
  return result;
}

void std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    if (*(char *)(v2 + 39) < 0)
      operator delete(*(void **)(v2 + 16));
    std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v2 + 8, 0);
    std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v2, 0);
    operator delete((void *)v2);
  }
}

void std::unique_ptr<std::unordered_map<std::string,std::string>>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    v4 = (void *)std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table(v3);
    operator delete(v4);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::find<std::string>(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v13 == v6)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

std::string *UC::SUE::UCSegmentedURLCoderProvider::UCSegmentedURLCoderProvider(std::string *this, __int128 *a2, __int128 *a3, __int128 *a4)
{
  __int128 v7;
  __int128 v8;
  std::string *v9;
  __int128 v10;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v7 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v7;
  }
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this + 1, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v8 = *a3;
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = v8;
  }
  v9 = this + 2;
  if (*((char *)a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a4, *((_QWORD *)a4 + 1));
  }
  else
  {
    v10 = *a4;
    this[2].__r_.__value_.__r.__words[2] = *((_QWORD *)a4 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v10;
  }
  *(_OWORD *)&this[7].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&this[6].__r_.__value_.__r.__words[1] = 0u;
  *(_OWORD *)&this[5].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&this[5].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&this[4].__r_.__value_.__r.__words[1] = 0u;
  *(_OWORD *)&this[3].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&this[3].__r_.__value_.__l.__data_ = 0u;
  return this;
}

void sub_220DE1A7C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;

  if (*(char *)(v1 + 47) < 0)
    operator delete(*v2);
  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void UC::SUE::UCSegmentedURLCoderProvider::clearCaches(UC::SUE::UCSegmentedURLCoderProvider *this)
{
  UC::UCMultiContextHuffmanCoder *v2;
  UC::UCMultiContextHuffmanCoder *v3;
  UC::UCMultiContextHuffmanCoder *v4;

  v2 = (UC::UCMultiContextHuffmanCoder *)*((_QWORD *)this + 13);
  if (v2)
    UC::UCMultiContextHuffmanCoder::clearCaches(v2);
  v3 = (UC::UCMultiContextHuffmanCoder *)*((_QWORD *)this + 17);
  if (v3)
    UC::UCMultiContextHuffmanCoder::clearCaches(v3);
  v4 = (UC::UCMultiContextHuffmanCoder *)*((_QWORD *)this + 15);
  if (v4)
    UC::UCMultiContextHuffmanCoder::clearCaches(v4);
}

uint64_t UC::SUE::UCSegmentedURLCoderProvider::getTLDCoder@<X0>(uint64_t this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t *v18;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *p_shared_owners;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  __int128 v26;
  std::string *v27;
  std::string *v28;
  __int128 *v29;
  _BYTE v30[40];
  std::string **v31;
  std::__shared_weak_count *v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;
  __int16 v40;
  _QWORD v41[3];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;
  __int16 v48;
  _QWORD v49[3];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;
  __int16 v56;
  _QWORD v57[3];
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;
  __int16 v64;
  _QWORD v65[3];
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  uint64_t v71;
  __int16 v72;
  __int128 v73;
  __int16 v74;
  _QWORD v75[3];
  __int16 v76;
  _QWORD v77[3];
  __int16 v78;
  _QWORD v79[3];
  __int16 v80;
  _QWORD v81[3];
  __int16 v82;
  uint64_t v83;

  v2 = this;
  v83 = *MEMORY[0x24BDAC8D0];
  v5 = this + 72;
  v4 = *(_QWORD *)(this + 72);
  if (v4)
  {
    v6 = *(_QWORD *)(this + 80);
    *a2 = v4;
    a2[1] = v6;
    if (v6)
    {
      v7 = (unint64_t *)(v6 + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v33, ".com");
    LOWORD(v34) = -2;
    std::string::basic_string[abi:ne180100]<0>(&v35, ".org");
    v37 = 9974;
    std::string::basic_string[abi:ne180100]<0>(&v38, ".net");
    v40 = 5990;
    std::string::basic_string[abi:ne180100]<0>(v41, ".de");
    LOWORD(v42) = 4451;
    std::string::basic_string[abi:ne180100]<0>(&v43, ".ru");
    v45 = 4077;
    std::string::basic_string[abi:ne180100]<0>(&v46, ".cn");
    v48 = 3255;
    std::string::basic_string[abi:ne180100]<0>(v49, ".uk");
    LOWORD(v50) = 3206;
    std::string::basic_string[abi:ne180100]<0>(&v51, ".jp");
    v53 = 2274;
    std::string::basic_string[abi:ne180100]<0>(&v54, ".it");
    v56 = 1580;
    std::string::basic_string[abi:ne180100]<0>(v57, ".fr");
    LOWORD(v58) = 1437;
    std::string::basic_string[abi:ne180100]<0>(&v59, ".nl");
    v61 = 1432;
    std::string::basic_string[abi:ne180100]<0>(&v62, ".au");
    v64 = 1299;
    std::string::basic_string[abi:ne180100]<0>(v65, ".br");
    LOWORD(v66) = 1197;
    std::string::basic_string[abi:ne180100]<0>(&v67, ".ca");
    v69 = 1154;
    std::string::basic_string[abi:ne180100]<0>(&v70, ".info");
    v72 = 1097;
    std::string::basic_string[abi:ne180100]<0>(&v73, ".in");
    v74 = 981;
    std::string::basic_string[abi:ne180100]<0>(v75, ".edu");
    v76 = 961;
    std::string::basic_string[abi:ne180100]<0>(v77, ".us");
    v78 = 865;
    std::string::basic_string[abi:ne180100]<0>(v79, ".pl");
    v80 = 850;
    std::string::basic_string[abi:ne180100]<0>(v81, ".ga");
    v82 = 838;
    std::unordered_map<std::string,unsigned short>::unordered_map((uint64_t)v30, (unsigned __int8 *)&v33, 20);
    v9 = 640;
    do
    {
      if (*((char *)&v32 + v9 + 7) < 0)
        operator delete(*(void **)&v30[v9 + 32]);
      v9 -= 32;
    }
    while (v9);
    std::string::basic_string[abi:ne180100]<0>(&v33, ".com");
    std::string::basic_string[abi:ne180100]<0>(&v34, ".org");
    std::string::basic_string[abi:ne180100]<0>(&v36, ".net");
    std::string::basic_string[abi:ne180100]<0>(&v39, ".de");
    std::string::basic_string[abi:ne180100]<0>(v41, ".ru");
    std::string::basic_string[abi:ne180100]<0>(&v42, ".cn");
    std::string::basic_string[abi:ne180100]<0>(&v44, ".uk");
    std::string::basic_string[abi:ne180100]<0>(&v47, ".jp");
    std::string::basic_string[abi:ne180100]<0>(v49, ".it");
    std::string::basic_string[abi:ne180100]<0>(&v50, ".fr");
    std::string::basic_string[abi:ne180100]<0>(&v52, ".nl");
    std::string::basic_string[abi:ne180100]<0>(&v55, ".au");
    std::string::basic_string[abi:ne180100]<0>(v57, ".br");
    std::string::basic_string[abi:ne180100]<0>(&v58, ".ca");
    std::string::basic_string[abi:ne180100]<0>(&v60, ".info");
    std::string::basic_string[abi:ne180100]<0>(&v63, ".in");
    std::string::basic_string[abi:ne180100]<0>(v65, ".edu");
    std::string::basic_string[abi:ne180100]<0>(&v66, ".us");
    std::string::basic_string[abi:ne180100]<0>(&v68, ".pl");
    std::string::basic_string[abi:ne180100]<0>(&v71, ".ga");
    v27 = 0;
    v28 = 0;
    v29 = 0;
    v31 = &v27;
    LOBYTE(v32) = 0;
    v27 = (std::string *)operator new(0x1E0uLL);
    v28 = v27;
    v29 = (__int128 *)&v27[20];
    v28 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v29, &v33, &v73, v27);
    v10 = 60;
    do
    {
      if (*((char *)&v33 + v10 * 8 - 1) < 0)
        operator delete((&v31)[v10]);
      v10 -= 3;
    }
    while (v10 * 8);
    std::allocate_shared[abi:ne180100]<std::unordered_map<std::string,unsigned short>,std::allocator<std::unordered_map<std::string,unsigned short>>,std::unordered_map<std::string,unsigned short>&,void>((uint64_t)v30, &v33);
    std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string>&,void>((__int128 **)&v27, &v26);
    std::allocate_shared[abi:ne180100]<UC::UCSymbolFrequencyTable,std::allocator<UC::UCSymbolFrequencyTable>,std::shared_ptr<std::unordered_map<std::string,unsigned short>> &,std::shared_ptr<std::vector<std::string>>,void>((uint64_t *)&v33, &v26, &v31);
    v11 = (std::__shared_weak_count *)*((_QWORD *)&v26 + 1);
    if (*((_QWORD *)&v26 + 1))
    {
      v12 = (unint64_t *)(*((_QWORD *)&v26 + 1) + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    std::allocate_shared[abi:ne180100]<UC::UCHuffmanCoder,std::allocator<UC::UCHuffmanCoder>,std::shared_ptr<UC::UCSymbolFrequencyTable> &,void>((uint64_t *)&v31, &v26);
    std::shared_ptr<UC::UCHuffmanCoder>::operator=[abi:ne180100](v5, &v26);
    v14 = (std::__shared_weak_count *)*((_QWORD *)&v26 + 1);
    if (*((_QWORD *)&v26 + 1))
    {
      v15 = (unint64_t *)(*((_QWORD *)&v26 + 1) + 8);
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
    v17 = *(_QWORD *)(v2 + 80);
    *a2 = *(_QWORD *)(v2 + 72);
    a2[1] = v17;
    if (v17)
    {
      v18 = (unint64_t *)(v17 + 8);
      do
        v19 = __ldxr(v18);
      while (__stxr(v19 + 1, v18));
    }
    v20 = v32;
    if (v32)
    {
      p_shared_owners = (unint64_t *)&v32->__shared_owners_;
      do
        v22 = __ldaxr(p_shared_owners);
      while (__stlxr(v22 - 1, p_shared_owners));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    v23 = (std::__shared_weak_count *)*((_QWORD *)&v33 + 1);
    if (*((_QWORD *)&v33 + 1))
    {
      v24 = (unint64_t *)(*((_QWORD *)&v33 + 1) + 8);
      do
        v25 = __ldaxr(v24);
      while (__stlxr(v25 - 1, v24));
      if (!v25)
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
    }
    *(_QWORD *)&v33 = &v27;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
    return std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table((uint64_t)v30);
  }
  return this;
}

void sub_220DE219C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,void **a22)
{
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a22);
  a22 = (void **)&a11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a22);
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table((uint64_t)&a14);
  _Unwind_Resume(a1);
}

uint64_t std::shared_ptr<UC::UCHuffmanCoder>::operator=[abi:ne180100](uint64_t a1, __int128 *a2)
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

void UC::SUE::UCSegmentedURLCoderProvider::getTLDFixedLengthCoder(UC::SUE::UCSegmentedURLCoderProvider *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  int v19;
  std::string *v20;
  std::string *v21;
  __int128 *v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[3];
  _QWORD v68[3];
  _QWORD v69[3];
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[3];
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[3];
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[3];
  _QWORD v84[3];
  _QWORD v85[3];
  _QWORD v86[3];
  _QWORD v87[3];
  _QWORD v88[3];
  _QWORD v89[3];
  _QWORD v90[3];
  _QWORD v91[3];
  _QWORD v92[3];
  _QWORD v93[3];
  _QWORD v94[3];
  _QWORD v95[3];
  _QWORD v96[3];
  _QWORD v97[3];
  _QWORD v98[3];
  _QWORD v99[3];
  _QWORD v100[3];
  _QWORD v101[3];
  _QWORD v102[3];
  _QWORD v103[3];
  _QWORD v104[3];
  _QWORD v105[3];
  _QWORD v106[3];
  _QWORD v107[3];
  _QWORD v108[3];
  _QWORD v109[3];
  _QWORD v110[3];
  _QWORD v111[3];
  _QWORD v112[3];
  _QWORD v113[3];
  _QWORD v114[3];
  _QWORD v115[3];
  _QWORD v116[3];
  _QWORD v117[3];
  _QWORD v118[3];
  _QWORD v119[3];
  _QWORD v120[3];
  _QWORD v121[3];
  _QWORD v122[3];
  _QWORD v123[3];
  _QWORD v124[3];
  _QWORD v125[3];
  _QWORD v126[3];
  _QWORD v127[3];
  _QWORD v128[3];
  _QWORD v129[3];
  _QWORD v130[3];
  _QWORD v131[3];
  _QWORD v132[3];
  _QWORD v133[3];
  _QWORD v134[3];
  _QWORD v135[3];
  _QWORD v136[3];
  _QWORD v137[3];
  __int128 v138;

  *(_QWORD *)&v138 = *MEMORY[0x24BDAC8D0];
  v5 = (char *)this + 88;
  v4 = *((_QWORD *)this + 11);
  if (v4)
  {
    v6 = *((_QWORD *)this + 12);
    *a2 = v4;
    a2[1] = v6;
    if (v6)
    {
      v7 = (unint64_t *)(v6 + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v24, ".co");
    std::string::basic_string[abi:ne180100]<0>(v25, ".es");
    std::string::basic_string[abi:ne180100]<0>(v26, ".ch");
    std::string::basic_string[abi:ne180100]<0>(v27, ".eu");
    std::string::basic_string[abi:ne180100]<0>(v28, ".io");
    std::string::basic_string[abi:ne180100]<0>(v29, ".vn");
    std::string::basic_string[abi:ne180100]<0>(v30, ".be");
    std::string::basic_string[abi:ne180100]<0>(v31, ".at");
    std::string::basic_string[abi:ne180100]<0>(v32, ".ua");
    std::string::basic_string[abi:ne180100]<0>(v33, ".cz");
    std::string::basic_string[abi:ne180100]<0>(v34, ".gov");
    std::string::basic_string[abi:ne180100]<0>(v35, ".tv");
    std::string::basic_string[abi:ne180100]<0>(v36, ".gr");
    std::string::basic_string[abi:ne180100]<0>(v37, ".cf");
    std::string::basic_string[abi:ne180100]<0>(v38, ".kr");
    std::string::basic_string[abi:ne180100]<0>(v39, ".tw");
    std::string::basic_string[abi:ne180100]<0>(v40, ".me");
    std::string::basic_string[abi:ne180100]<0>(v41, ".biz");
    std::string::basic_string[abi:ne180100]<0>(v42, ".site");
    std::string::basic_string[abi:ne180100]<0>(v43, ".se");
    std::string::basic_string[abi:ne180100]<0>(v44, ".tr");
    std::string::basic_string[abi:ne180100]<0>(v45, ".id");
    std::string::basic_string[abi:ne180100]<0>(v46, ".mx");
    std::string::basic_string[abi:ne180100]<0>(v47, ".wang");
    std::string::basic_string[abi:ne180100]<0>(v48, ".hu");
    std::string::basic_string[abi:ne180100]<0>(v49, ".nz");
    std::string::basic_string[abi:ne180100]<0>(v50, ".ro");
    std::string::basic_string[abi:ne180100]<0>(v51, ".cc");
    std::string::basic_string[abi:ne180100]<0>(v52, ".top");
    std::string::basic_string[abi:ne180100]<0>(v53, ".club");
    std::string::basic_string[abi:ne180100]<0>(v54, ".dk");
    std::string::basic_string[abi:ne180100]<0>(v55, ".ie");
    std::string::basic_string[abi:ne180100]<0>(v56, ".za");
    std::string::basic_string[abi:ne180100]<0>(v57, ".ar");
    std::string::basic_string[abi:ne180100]<0>(v58, ".no");
    std::string::basic_string[abi:ne180100]<0>(v59, ".online");
    std::string::basic_string[abi:ne180100]<0>(v60, ".cl");
    std::string::basic_string[abi:ne180100]<0>(v61, ".tk");
    std::string::basic_string[abi:ne180100]<0>(v62, ".fi");
    std::string::basic_string[abi:ne180100]<0>(v63, ".my");
    std::string::basic_string[abi:ne180100]<0>(v64, ".hk");
    std::string::basic_string[abi:ne180100]<0>(v65, ".sk");
    std::string::basic_string[abi:ne180100]<0>(v66, ".il");
    std::string::basic_string[abi:ne180100]<0>(v67, ".pt");
    std::string::basic_string[abi:ne180100]<0>(v68, ".th");
    std::string::basic_string[abi:ne180100]<0>(v69, ".nu");
    std::string::basic_string[abi:ne180100]<0>(v70, ".sg");
    std::string::basic_string[abi:ne180100]<0>(v71, ".kz");
    std::string::basic_string[abi:ne180100]<0>(v72, ".by");
    std::string::basic_string[abi:ne180100]<0>(v73, ".pk");
    std::string::basic_string[abi:ne180100]<0>(v74, ".su");
    std::string::basic_string[abi:ne180100]<0>(v75, ".to");
    std::string::basic_string[abi:ne180100]<0>(v76, ".ph");
    std::string::basic_string[abi:ne180100]<0>(v77, ".live");
    std::string::basic_string[abi:ne180100]<0>(v78, ".ae");
    std::string::basic_string[abi:ne180100]<0>(v79, ".space");
    std::string::basic_string[abi:ne180100]<0>(v80, ".mobi");
    std::string::basic_string[abi:ne180100]<0>(v81, ".ai");
    std::string::basic_string[abi:ne180100]<0>(v82, ".app");
    std::string::basic_string[abi:ne180100]<0>(v83, ".is");
    std::string::basic_string[abi:ne180100]<0>(v84, ".news");
    std::string::basic_string[abi:ne180100]<0>(v85, ".name");
    std::string::basic_string[abi:ne180100]<0>(v86, ".tech");
    std::string::basic_string[abi:ne180100]<0>(v87, ".vip");
    std::string::basic_string[abi:ne180100]<0>(v88, ".fun");
    std::string::basic_string[abi:ne180100]<0>(v89, ".network");
    std::string::basic_string[abi:ne180100]<0>(v90, ".cloud");
    std::string::basic_string[abi:ne180100]<0>(v91, ".lu");
    std::string::basic_string[abi:ne180100]<0>(v92, ".am");
    std::string::basic_string[abi:ne180100]<0>(v93, ".website");
    std::string::basic_string[abi:ne180100]<0>(v94, ".jobs");
    std::string::basic_string[abi:ne180100]<0>(v95, ".life");
    std::string::basic_string[abi:ne180100]<0>(v96, ".win");
    std::string::basic_string[abi:ne180100]<0>(v97, ".ly");
    std::string::basic_string[abi:ne180100]<0>(v98, ".do");
    std::string::basic_string[abi:ne180100]<0>(v99, ".tn");
    std::string::basic_string[abi:ne180100]<0>(v100, ".md");
    std::string::basic_string[abi:ne180100]<0>(v101, ".shop");
    std::string::basic_string[abi:ne180100]<0>(v102, ".store");
    std::string::basic_string[abi:ne180100]<0>(v103, ".media");
    std::string::basic_string[abi:ne180100]<0>(v104, ".world");
    std::string::basic_string[abi:ne180100]<0>(v105, ".travel");
    std::string::basic_string[abi:ne180100]<0>(v106, ".work");
    std::string::basic_string[abi:ne180100]<0>(v107, ".int");
    std::string::basic_string[abi:ne180100]<0>(v108, ".qa");
    std::string::basic_string[abi:ne180100]<0>(v109, ".global");
    std::string::basic_string[abi:ne180100]<0>(v110, ".company");
    std::string::basic_string[abi:ne180100]<0>(v111, ".host");
    std::string::basic_string[abi:ne180100]<0>(v112, ".wiki");
    std::string::basic_string[abi:ne180100]<0>(v113, ".stream");
    std::string::basic_string[abi:ne180100]<0>(v114, ".gt");
    std::string::basic_string[abi:ne180100]<0>(v115, ".py");
    std::string::basic_string[abi:ne180100]<0>(v116, ".video");
    std::string::basic_string[abi:ne180100]<0>(v117, ".bid");
    std::string::basic_string[abi:ne180100]<0>(v118, ".cm");
    std::string::basic_string[abi:ne180100]<0>(v119, ".mo");
    std::string::basic_string[abi:ne180100]<0>(v120, ".tel");
    std::string::basic_string[abi:ne180100]<0>(v121, ".digital");
    std::string::basic_string[abi:ne180100]<0>(v122, ".center");
    std::string::basic_string[abi:ne180100]<0>(v123, ".plus");
    std::string::basic_string[abi:ne180100]<0>(v124, ".ltd");
    std::string::basic_string[abi:ne180100]<0>(v125, ".services");
    std::string::basic_string[abi:ne180100]<0>(v126, ".so");
    std::string::basic_string[abi:ne180100]<0>(v127, ".tt");
    std::string::basic_string[abi:ne180100]<0>(v128, ".support");
    std::string::basic_string[abi:ne180100]<0>(v129, ".pub");
    std::string::basic_string[abi:ne180100]<0>(v130, ".help");
    std::string::basic_string[abi:ne180100]<0>(v131, ".gl");
    std::string::basic_string[abi:ne180100]<0>(v132, ".museum");
    std::string::basic_string[abi:ne180100]<0>(v133, ".pm");
    std::string::basic_string[abi:ne180100]<0>(v134, ".business");
    std::string::basic_string[abi:ne180100]<0>(v135, ".bike");
    std::string::basic_string[abi:ne180100]<0>(v136, ".loan");
    std::string::basic_string[abi:ne180100]<0>(v137, ".estate");
    v20 = 0;
    v21 = 0;
    v22 = 0;
    *(_QWORD *)&v23 = &v20;
    BYTE8(v23) = 0;
    v20 = (std::string *)operator new(0xAB0uLL);
    v21 = v20;
    v22 = (__int128 *)&v20[114];
    v21 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v22, &v24, &v138, v20);
    v9 = 342;
    do
    {
      if (*((char *)&v25[v9 - 1] - 1) < 0)
        operator delete(*(void **)((char *)&v23 + v9 * 8));
      v9 -= 3;
    }
    while (v9 * 8);
    v19 = 8;
    std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string>&,void>((__int128 **)&v20, &v23);
    std::allocate_shared[abi:ne180100]<UC::UCFixedLengthCoder,std::allocator<UC::UCFixedLengthCoder>,int,std::shared_ptr<std::vector<std::string>>,void>((char *)&v19, &v23, &v24);
    std::shared_ptr<UC::UCHuffmanCoder>::operator=[abi:ne180100]((uint64_t)v5, &v24);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v24 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v23 + 1);
    if (*((_QWORD *)&v23 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v23 + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v16 = *((_QWORD *)this + 12);
    *a2 = *((_QWORD *)this + 11);
    a2[1] = v16;
    if (v16)
    {
      v17 = (unint64_t *)(v16 + 8);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    *(_QWORD *)&v24 = &v20;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v24);
  }
}

void sub_220DE2EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void **a16)
{
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  a16 = (void **)&a10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

void UC::SUE::UCSegmentedURLCoderProvider::getHostCoder(UC::SUE::UCSegmentedURLCoderProvider *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  UC::UCMultiContextHuffmanSymbolFrequencyReader *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  int v23;
  __int128 v24;
  UC::UCMultiContextHuffmanSymbolFrequencyReader *v25;
  std::string *v26;
  std::string *v27;
  std::string *v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[3];
  _QWORD v68[3];
  __int128 v69;

  *(_QWORD *)&v69 = *MEMORY[0x24BDAC8D0];
  v5 = (char *)this + 104;
  v4 = *((_QWORD *)this + 13);
  if (v4)
  {
    v6 = *((_QWORD *)this + 14);
    *a2 = v4;
    a2[1] = v6;
    if (v6)
    {
      v7 = (unint64_t *)(v6 + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v30, "-");
    std::string::basic_string[abi:ne180100]<0>(v31, ".");
    std::string::basic_string[abi:ne180100]<0>(v32, "0");
    std::string::basic_string[abi:ne180100]<0>(v33, "1");
    std::string::basic_string[abi:ne180100]<0>(v34, "2");
    std::string::basic_string[abi:ne180100]<0>(v35, "3");
    std::string::basic_string[abi:ne180100]<0>(v36, "4");
    std::string::basic_string[abi:ne180100]<0>(v37, "5");
    std::string::basic_string[abi:ne180100]<0>(v38, "6");
    std::string::basic_string[abi:ne180100]<0>(v39, "7");
    std::string::basic_string[abi:ne180100]<0>(v40, "8");
    std::string::basic_string[abi:ne180100]<0>(v41, "9");
    std::string::basic_string[abi:ne180100]<0>(v42, "a");
    std::string::basic_string[abi:ne180100]<0>(v43, "b");
    std::string::basic_string[abi:ne180100]<0>(v44, "c");
    std::string::basic_string[abi:ne180100]<0>(v45, "d");
    std::string::basic_string[abi:ne180100]<0>(v46, "e");
    std::string::basic_string[abi:ne180100]<0>(v47, "f");
    std::string::basic_string[abi:ne180100]<0>(v48, "g");
    std::string::basic_string[abi:ne180100]<0>(v49, "h");
    std::string::basic_string[abi:ne180100]<0>(v50, "i");
    std::string::basic_string[abi:ne180100]<0>(v51, "j");
    std::string::basic_string[abi:ne180100]<0>(v52, "k");
    std::string::basic_string[abi:ne180100]<0>(v53, "l");
    std::string::basic_string[abi:ne180100]<0>(v54, "m");
    std::string::basic_string[abi:ne180100]<0>(v55, "n");
    std::string::basic_string[abi:ne180100]<0>(v56, "o");
    std::string::basic_string[abi:ne180100]<0>(v57, "p");
    std::string::basic_string[abi:ne180100]<0>(v58, "q");
    std::string::basic_string[abi:ne180100]<0>(v59, "r");
    std::string::basic_string[abi:ne180100]<0>(v60, "s");
    std::string::basic_string[abi:ne180100]<0>(v61, "t");
    std::string::basic_string[abi:ne180100]<0>(v62, "u");
    std::string::basic_string[abi:ne180100]<0>(v63, "v");
    std::string::basic_string[abi:ne180100]<0>(v64, "w");
    std::string::basic_string[abi:ne180100]<0>(v65, "x");
    std::string::basic_string[abi:ne180100]<0>(v66, "y");
    std::string::basic_string[abi:ne180100]<0>(v67, "z");
    std::string::basic_string[abi:ne180100]<0>(v68, "|");
    v26 = 0;
    v27 = 0;
    v28 = 0;
    *(_QWORD *)&v29 = &v26;
    BYTE8(v29) = 0;
    v26 = (std::string *)operator new(0x3A8uLL);
    v27 = v26;
    v28 = v26 + 39;
    v27 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v28, &v30, &v69, v26);
    v9 = 117;
    do
    {
      if (*((char *)&v31[v9 - 1] - 1) < 0)
        operator delete(*(void **)((char *)&v29 + v9 * 8));
      v9 -= 3;
    }
    while (v9 * 8);
    std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string>&,void>((__int128 **)&v26, &v30);
    LODWORD(v29) = 2;
    std::make_unique[abi:ne180100]<UC::UCMultiContextHuffmanSymbolFrequencyReader,int,std::shared_ptr<std::vector<std::string>> &,std::string const&>((int *)&v29, (uint64_t *)&v30, (uint64_t)this, &v25);
    UC::UCMultiContextHuffmanSymbolFrequencyReader::readData((std::string *)v25);
    UC::UCMultiContextHuffmanSymbolFrequencyReader::getContextSymbolFrequency((uint64_t)v25, &v24);
    v23 = 2;
    std::allocate_shared[abi:ne180100]<UC::UCMultiContextHuffmanCoder,std::allocator<UC::UCMultiContextHuffmanCoder>,std::shared_ptr<UC::UCMultiContextSymbolFrequencyTrie>,int,void>(&v24, &v23, &v29);
    std::shared_ptr<UC::UCHuffmanCoder>::operator=[abi:ne180100]((uint64_t)v5, &v29);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v24 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v16 = *((_QWORD *)this + 14);
    *a2 = *((_QWORD *)this + 13);
    a2[1] = v16;
    if (v16)
    {
      v17 = (unint64_t *)(v16 + 8);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    v19 = v25;
    v25 = 0;
    if (v19)
      std::default_delete<UC::UCMultiContextHuffmanSymbolFrequencyReader>::operator()[abi:ne180100]((uint64_t)&v25, (uint64_t)v19);
    v20 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1))
    {
      v21 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    *(_QWORD *)&v30 = &v26;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v30);
  }
}

void sub_220DE353C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void **a19)
{
  uint64_t v20;

  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  v20 = a12;
  a12 = 0;
  if (v20)
    std::default_delete<UC::UCMultiContextHuffmanSymbolFrequencyReader>::operator()[abi:ne180100]((uint64_t)&a12, v20);
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  a19 = (void **)&a13;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a19);
  _Unwind_Resume(a1);
}

void std::make_unique[abi:ne180100]<UC::UCMultiContextHuffmanSymbolFrequencyReader,int,std::shared_ptr<std::vector<std::string>> &,std::string const&>(int *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  void *v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  std::string __p;
  uint64_t v17;
  std::__shared_weak_count *v18;

  v8 = operator new(0x40uLL);
  v9 = *a1;
  v10 = (std::__shared_weak_count *)a2[1];
  v17 = *a2;
  v18 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v12 = __ldxr(p_shared_owners);
    while (__stxr(v12 + 1, p_shared_owners));
  }
  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    __p = *(std::string *)a3;
  UC::UCMultiContextHuffmanSymbolFrequencyReader::UCMultiContextHuffmanSymbolFrequencyReader(v8, v9, &v17, &__p);
  *a4 = v8;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v13 = v18;
  if (v18)
  {
    v14 = (unint64_t *)&v18->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

void sub_220DE3700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
{
  void *v16;

  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  operator delete(v16);
  _Unwind_Resume(a1);
}

void UC::SUE::UCSegmentedURLCoderProvider::getCombinedPathAndQueryCoder(UC::SUE::UCSegmentedURLCoderProvider *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  UC::UCMultiContextHuffmanSymbolFrequencyReader *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  int v23;
  __int128 v24;
  UC::UCMultiContextHuffmanSymbolFrequencyReader *v25;
  std::string *v26;
  std::string *v27;
  std::string *v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[3];
  _QWORD v68[3];
  _QWORD v69[3];
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[3];
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[3];
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[3];
  _QWORD v84[3];
  _QWORD v85[3];
  _QWORD v86[3];
  _QWORD v87[3];
  _QWORD v88[3];
  _QWORD v89[3];
  _QWORD v90[3];
  _QWORD v91[3];
  _QWORD v92[3];
  _QWORD v93[3];
  _QWORD v94[3];
  _QWORD v95[3];
  _QWORD v96[3];
  _QWORD v97[3];
  _QWORD v98[3];
  _QWORD v99[3];
  _QWORD v100[3];
  _QWORD v101[3];
  _QWORD v102[3];
  _QWORD v103[3];
  _QWORD v104[3];
  __int128 v105;

  *(_QWORD *)&v105 = *MEMORY[0x24BDAC8D0];
  v5 = (char *)this + 120;
  v4 = *((_QWORD *)this + 15);
  if (v4)
  {
    v6 = *((_QWORD *)this + 16);
    *a2 = v4;
    a2[1] = v6;
    if (v6)
    {
      v7 = (unint64_t *)(v6 + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v30, "#");
    std::string::basic_string[abi:ne180100]<0>(v31, "%");
    std::string::basic_string[abi:ne180100]<0>(v32, "&");
    std::string::basic_string[abi:ne180100]<0>(v33, "+");
    std::string::basic_string[abi:ne180100]<0>(v34, ",");
    std::string::basic_string[abi:ne180100]<0>(v35, "-");
    std::string::basic_string[abi:ne180100]<0>(v36, ".");
    std::string::basic_string[abi:ne180100]<0>(v37, "/");
    std::string::basic_string[abi:ne180100]<0>(v38, "0");
    std::string::basic_string[abi:ne180100]<0>(v39, "1");
    std::string::basic_string[abi:ne180100]<0>(v40, "2");
    std::string::basic_string[abi:ne180100]<0>(v41, "3");
    std::string::basic_string[abi:ne180100]<0>(v42, "4");
    std::string::basic_string[abi:ne180100]<0>(v43, "5");
    std::string::basic_string[abi:ne180100]<0>(v44, "6");
    std::string::basic_string[abi:ne180100]<0>(v45, "7");
    std::string::basic_string[abi:ne180100]<0>(v46, "8");
    std::string::basic_string[abi:ne180100]<0>(v47, "9");
    std::string::basic_string[abi:ne180100]<0>(v48, ":");
    std::string::basic_string[abi:ne180100]<0>(v49, ";");
    std::string::basic_string[abi:ne180100]<0>(v50, "=");
    std::string::basic_string[abi:ne180100]<0>(v51, "?");
    std::string::basic_string[abi:ne180100]<0>(v52, "A");
    std::string::basic_string[abi:ne180100]<0>(v53, "B");
    std::string::basic_string[abi:ne180100]<0>(v54, "C");
    std::string::basic_string[abi:ne180100]<0>(v55, "D");
    std::string::basic_string[abi:ne180100]<0>(v56, "E");
    std::string::basic_string[abi:ne180100]<0>(v57, "F");
    std::string::basic_string[abi:ne180100]<0>(v58, "G");
    std::string::basic_string[abi:ne180100]<0>(v59, "H");
    std::string::basic_string[abi:ne180100]<0>(v60, "I");
    std::string::basic_string[abi:ne180100]<0>(v61, "J");
    std::string::basic_string[abi:ne180100]<0>(v62, "K");
    std::string::basic_string[abi:ne180100]<0>(v63, "L");
    std::string::basic_string[abi:ne180100]<0>(v64, "M");
    std::string::basic_string[abi:ne180100]<0>(v65, "N");
    std::string::basic_string[abi:ne180100]<0>(v66, "O");
    std::string::basic_string[abi:ne180100]<0>(v67, "P");
    std::string::basic_string[abi:ne180100]<0>(v68, "Q");
    std::string::basic_string[abi:ne180100]<0>(v69, "R");
    std::string::basic_string[abi:ne180100]<0>(v70, "S");
    std::string::basic_string[abi:ne180100]<0>(v71, "T");
    std::string::basic_string[abi:ne180100]<0>(v72, "U");
    std::string::basic_string[abi:ne180100]<0>(v73, "V");
    std::string::basic_string[abi:ne180100]<0>(v74, "W");
    std::string::basic_string[abi:ne180100]<0>(v75, "X");
    std::string::basic_string[abi:ne180100]<0>(v76, "Y");
    std::string::basic_string[abi:ne180100]<0>(v77, "Z");
    std::string::basic_string[abi:ne180100]<0>(v78, "_");
    std::string::basic_string[abi:ne180100]<0>(v79, "a");
    std::string::basic_string[abi:ne180100]<0>(v80, "b");
    std::string::basic_string[abi:ne180100]<0>(v81, "c");
    std::string::basic_string[abi:ne180100]<0>(v82, "d");
    std::string::basic_string[abi:ne180100]<0>(v83, "e");
    std::string::basic_string[abi:ne180100]<0>(v84, "f");
    std::string::basic_string[abi:ne180100]<0>(v85, "g");
    std::string::basic_string[abi:ne180100]<0>(v86, "h");
    std::string::basic_string[abi:ne180100]<0>(v87, "i");
    std::string::basic_string[abi:ne180100]<0>(v88, "j");
    std::string::basic_string[abi:ne180100]<0>(v89, "k");
    std::string::basic_string[abi:ne180100]<0>(v90, "l");
    std::string::basic_string[abi:ne180100]<0>(v91, "m");
    std::string::basic_string[abi:ne180100]<0>(v92, "n");
    std::string::basic_string[abi:ne180100]<0>(v93, "o");
    std::string::basic_string[abi:ne180100]<0>(v94, "p");
    std::string::basic_string[abi:ne180100]<0>(v95, "q");
    std::string::basic_string[abi:ne180100]<0>(v96, "r");
    std::string::basic_string[abi:ne180100]<0>(v97, "s");
    std::string::basic_string[abi:ne180100]<0>(v98, "t");
    std::string::basic_string[abi:ne180100]<0>(v99, "u");
    std::string::basic_string[abi:ne180100]<0>(v100, "v");
    std::string::basic_string[abi:ne180100]<0>(v101, "w");
    std::string::basic_string[abi:ne180100]<0>(v102, "x");
    std::string::basic_string[abi:ne180100]<0>(v103, "y");
    std::string::basic_string[abi:ne180100]<0>(v104, "z");
    v26 = 0;
    v27 = 0;
    v28 = 0;
    *(_QWORD *)&v29 = &v26;
    BYTE8(v29) = 0;
    v26 = (std::string *)operator new(0x708uLL);
    v27 = v26;
    v28 = v26 + 75;
    v27 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v28, &v30, &v105, v26);
    v9 = 225;
    do
    {
      if (*((char *)&v31[v9 - 1] - 1) < 0)
        operator delete(*(void **)((char *)&v29 + v9 * 8));
      v9 -= 3;
    }
    while (v9 * 8);
    std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string>&,void>((__int128 **)&v26, &v30);
    LODWORD(v29) = 2;
    std::make_unique[abi:ne180100]<UC::UCMultiContextHuffmanSymbolFrequencyReader,int,std::shared_ptr<std::vector<std::string>> &,std::string const&>((int *)&v29, (uint64_t *)&v30, (uint64_t)this + 24, &v25);
    UC::UCMultiContextHuffmanSymbolFrequencyReader::readData((std::string *)v25);
    UC::UCMultiContextHuffmanSymbolFrequencyReader::getContextSymbolFrequency((uint64_t)v25, &v24);
    v23 = 2;
    std::allocate_shared[abi:ne180100]<UC::UCMultiContextHuffmanCoder,std::allocator<UC::UCMultiContextHuffmanCoder>,std::shared_ptr<UC::UCMultiContextSymbolFrequencyTrie>,int,void>(&v24, &v23, &v29);
    std::shared_ptr<UC::UCHuffmanCoder>::operator=[abi:ne180100]((uint64_t)v5, &v29);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v24 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v16 = *((_QWORD *)this + 16);
    *a2 = *((_QWORD *)this + 15);
    a2[1] = v16;
    if (v16)
    {
      v17 = (unint64_t *)(v16 + 8);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    v19 = v25;
    v25 = 0;
    if (v19)
      std::default_delete<UC::UCMultiContextHuffmanSymbolFrequencyReader>::operator()[abi:ne180100]((uint64_t)&v25, (uint64_t)v19);
    v20 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1))
    {
      v21 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    *(_QWORD *)&v30 = &v26;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v30);
  }
}

void sub_220DE3FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void **a19)
{
  uint64_t v20;

  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  v20 = a12;
  a12 = 0;
  if (v20)
    std::default_delete<UC::UCMultiContextHuffmanSymbolFrequencyReader>::operator()[abi:ne180100]((uint64_t)&a12, v20);
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  a19 = (void **)&a13;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a19);
  _Unwind_Resume(a1);
}

void UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(UC::SUE::UCSegmentedURLCoderProvider *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  UC::UCMultiContextHuffmanSymbolFrequencyReader *v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  int v23;
  __int128 v24;
  UC::UCMultiContextHuffmanSymbolFrequencyReader *v25;
  std::string *v26;
  std::string *v27;
  std::string *v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[3];
  _QWORD v68[3];
  _QWORD v69[3];
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[3];
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[3];
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[3];
  _QWORD v84[3];
  _QWORD v85[3];
  _QWORD v86[3];
  _QWORD v87[3];
  _QWORD v88[3];
  _QWORD v89[3];
  _QWORD v90[3];
  _QWORD v91[3];
  _QWORD v92[3];
  _QWORD v93[3];
  _QWORD v94[3];
  _QWORD v95[3];
  _QWORD v96[3];
  _QWORD v97[3];
  _QWORD v98[3];
  _QWORD v99[3];
  _QWORD v100[3];
  __int128 v101;

  *(_QWORD *)&v101 = *MEMORY[0x24BDAC8D0];
  v5 = (char *)this + 136;
  v4 = *((_QWORD *)this + 17);
  if (v4)
  {
    v6 = *((_QWORD *)this + 18);
    *a2 = v4;
    a2[1] = v6;
    if (v6)
    {
      v7 = (unint64_t *)(v6 + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v30, "&");
    std::string::basic_string[abi:ne180100]<0>(v31, "+");
    std::string::basic_string[abi:ne180100]<0>(v32, "-");
    std::string::basic_string[abi:ne180100]<0>(v33, ".");
    std::string::basic_string[abi:ne180100]<0>(v34, "/");
    std::string::basic_string[abi:ne180100]<0>(v35, "0");
    std::string::basic_string[abi:ne180100]<0>(v36, "1");
    std::string::basic_string[abi:ne180100]<0>(v37, "2");
    std::string::basic_string[abi:ne180100]<0>(v38, "3");
    std::string::basic_string[abi:ne180100]<0>(v39, "4");
    std::string::basic_string[abi:ne180100]<0>(v40, "5");
    std::string::basic_string[abi:ne180100]<0>(v41, "6");
    std::string::basic_string[abi:ne180100]<0>(v42, "7");
    std::string::basic_string[abi:ne180100]<0>(v43, "8");
    std::string::basic_string[abi:ne180100]<0>(v44, "9");
    std::string::basic_string[abi:ne180100]<0>(v45, "=");
    std::string::basic_string[abi:ne180100]<0>(v46, "?");
    std::string::basic_string[abi:ne180100]<0>(v47, "A");
    std::string::basic_string[abi:ne180100]<0>(v48, "B");
    std::string::basic_string[abi:ne180100]<0>(v49, "C");
    std::string::basic_string[abi:ne180100]<0>(v50, "D");
    std::string::basic_string[abi:ne180100]<0>(v51, "E");
    std::string::basic_string[abi:ne180100]<0>(v52, "F");
    std::string::basic_string[abi:ne180100]<0>(v53, "G");
    std::string::basic_string[abi:ne180100]<0>(v54, "H");
    std::string::basic_string[abi:ne180100]<0>(v55, "I");
    std::string::basic_string[abi:ne180100]<0>(v56, "J");
    std::string::basic_string[abi:ne180100]<0>(v57, "K");
    std::string::basic_string[abi:ne180100]<0>(v58, "L");
    std::string::basic_string[abi:ne180100]<0>(v59, "M");
    std::string::basic_string[abi:ne180100]<0>(v60, "N");
    std::string::basic_string[abi:ne180100]<0>(v61, "O");
    std::string::basic_string[abi:ne180100]<0>(v62, "P");
    std::string::basic_string[abi:ne180100]<0>(v63, "Q");
    std::string::basic_string[abi:ne180100]<0>(v64, "R");
    std::string::basic_string[abi:ne180100]<0>(v65, "S");
    std::string::basic_string[abi:ne180100]<0>(v66, "T");
    std::string::basic_string[abi:ne180100]<0>(v67, "U");
    std::string::basic_string[abi:ne180100]<0>(v68, "V");
    std::string::basic_string[abi:ne180100]<0>(v69, "W");
    std::string::basic_string[abi:ne180100]<0>(v70, "X");
    std::string::basic_string[abi:ne180100]<0>(v71, "Y");
    std::string::basic_string[abi:ne180100]<0>(v72, "Z");
    std::string::basic_string[abi:ne180100]<0>(v73, "_");
    std::string::basic_string[abi:ne180100]<0>(v74, "a");
    std::string::basic_string[abi:ne180100]<0>(v75, "b");
    std::string::basic_string[abi:ne180100]<0>(v76, "c");
    std::string::basic_string[abi:ne180100]<0>(v77, "d");
    std::string::basic_string[abi:ne180100]<0>(v78, "e");
    std::string::basic_string[abi:ne180100]<0>(v79, "f");
    std::string::basic_string[abi:ne180100]<0>(v80, "g");
    std::string::basic_string[abi:ne180100]<0>(v81, "h");
    std::string::basic_string[abi:ne180100]<0>(v82, "i");
    std::string::basic_string[abi:ne180100]<0>(v83, "j");
    std::string::basic_string[abi:ne180100]<0>(v84, "k");
    std::string::basic_string[abi:ne180100]<0>(v85, "l");
    std::string::basic_string[abi:ne180100]<0>(v86, "m");
    std::string::basic_string[abi:ne180100]<0>(v87, "n");
    std::string::basic_string[abi:ne180100]<0>(v88, "o");
    std::string::basic_string[abi:ne180100]<0>(v89, "p");
    std::string::basic_string[abi:ne180100]<0>(v90, "q");
    std::string::basic_string[abi:ne180100]<0>(v91, "r");
    std::string::basic_string[abi:ne180100]<0>(v92, "s");
    std::string::basic_string[abi:ne180100]<0>(v93, "t");
    std::string::basic_string[abi:ne180100]<0>(v94, "u");
    std::string::basic_string[abi:ne180100]<0>(v95, "v");
    std::string::basic_string[abi:ne180100]<0>(v96, "w");
    std::string::basic_string[abi:ne180100]<0>(v97, "x");
    std::string::basic_string[abi:ne180100]<0>(v98, "y");
    std::string::basic_string[abi:ne180100]<0>(v99, "z");
    std::string::basic_string[abi:ne180100]<0>(v100, "|");
    v26 = 0;
    v27 = 0;
    v28 = 0;
    *(_QWORD *)&v29 = &v26;
    BYTE8(v29) = 0;
    v26 = (std::string *)operator new(0x6A8uLL);
    v27 = v26;
    v28 = v26 + 71;
    v27 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v28, &v30, &v101, v26);
    v9 = 213;
    do
    {
      if (*((char *)&v31[v9 - 1] - 1) < 0)
        operator delete(*(void **)((char *)&v29 + v9 * 8));
      v9 -= 3;
    }
    while (v9 * 8);
    std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string>&,void>((__int128 **)&v26, &v30);
    LODWORD(v29) = 2;
    std::make_unique[abi:ne180100]<UC::UCMultiContextHuffmanSymbolFrequencyReader,int,std::shared_ptr<std::vector<std::string>> &,std::string const&>((int *)&v29, (uint64_t *)&v30, (uint64_t)this + 48, &v25);
    UC::UCMultiContextHuffmanSymbolFrequencyReader::readData((std::string *)v25);
    UC::UCMultiContextHuffmanSymbolFrequencyReader::getContextSymbolFrequency((uint64_t)v25, &v24);
    v23 = 2;
    std::allocate_shared[abi:ne180100]<UC::UCMultiContextHuffmanCoder,std::allocator<UC::UCMultiContextHuffmanCoder>,std::shared_ptr<UC::UCMultiContextSymbolFrequencyTrie>,int,void>(&v24, &v23, &v29);
    std::shared_ptr<UC::UCHuffmanCoder>::operator=[abi:ne180100]((uint64_t)v5, &v29);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v29 + 1);
    if (*((_QWORD *)&v29 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v29 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v24 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v16 = *((_QWORD *)this + 18);
    *a2 = *((_QWORD *)this + 17);
    a2[1] = v16;
    if (v16)
    {
      v17 = (unint64_t *)(v16 + 8);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    v19 = v25;
    v25 = 0;
    if (v19)
      std::default_delete<UC::UCMultiContextHuffmanSymbolFrequencyReader>::operator()[abi:ne180100]((uint64_t)&v25, (uint64_t)v19);
    v20 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
    if (*((_QWORD *)&v30 + 1))
    {
      v21 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
      do
        v22 = __ldaxr(v21);
      while (__stlxr(v22 - 1, v21));
      if (!v22)
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
      }
    }
    *(_QWORD *)&v30 = &v26;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v30);
  }
}

void sub_220DE4920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void **a19)
{
  uint64_t v20;

  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a10);
  v20 = a12;
  a12 = 0;
  if (v20)
    std::default_delete<UC::UCMultiContextHuffmanSymbolFrequencyReader>::operator()[abi:ne180100]((uint64_t)&a12, v20);
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a19);
  a19 = (void **)&a13;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a19);
  _Unwind_Resume(a1);
}

void UC::SUE::UCSegmentedURLCoderProvider::getKnownWordFixedLengthCoder(UC::SUE::UCSegmentedURLCoderProvider *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  int v19;
  std::string *v20;
  std::string *v21;
  __int128 *v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[3];
  _QWORD v68[3];
  _QWORD v69[3];
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[3];
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[3];
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[3];
  _QWORD v84[3];
  _QWORD v85[3];
  _QWORD v86[3];
  _QWORD v87[3];
  _QWORD v88[3];
  _QWORD v89[3];
  _QWORD v90[3];
  _QWORD v91[3];
  _QWORD v92[3];
  _QWORD v93[3];
  _QWORD v94[3];
  _QWORD v95[3];
  _QWORD v96[3];
  _QWORD v97[3];
  _QWORD v98[3];
  _QWORD v99[3];
  _QWORD v100[3];
  _QWORD v101[3];
  _QWORD v102[3];
  _QWORD v103[3];
  _QWORD v104[3];
  _QWORD v105[3];
  _QWORD v106[3];
  _QWORD v107[3];
  _QWORD v108[3];
  _QWORD v109[3];
  _QWORD v110[3];
  _QWORD v111[3];
  _QWORD v112[3];
  _QWORD v113[3];
  _QWORD v114[3];
  _QWORD v115[3];
  _QWORD v116[3];
  _QWORD v117[3];
  _QWORD v118[3];
  _QWORD v119[3];
  _QWORD v120[3];
  _QWORD v121[3];
  _QWORD v122[3];
  _QWORD v123[3];
  _QWORD v124[3];
  _QWORD v125[3];
  _QWORD v126[3];
  _QWORD v127[3];
  _QWORD v128[3];
  _QWORD v129[3];
  _QWORD v130[3];
  _QWORD v131[3];
  _QWORD v132[3];
  _QWORD v133[3];
  _QWORD v134[3];
  _QWORD v135[3];
  _QWORD v136[3];
  _QWORD v137[3];
  _QWORD v138[3];
  _QWORD v139[3];
  _QWORD v140[3];
  _QWORD v141[3];
  _QWORD v142[3];
  _QWORD v143[3];
  _QWORD v144[3];
  _QWORD v145[3];
  _QWORD v146[3];
  _QWORD v147[3];
  _QWORD v148[3];
  _QWORD v149[3];
  _QWORD v150[3];
  _QWORD v151[3];
  _QWORD v152[3];
  _QWORD v153[3];
  _QWORD v154[3];
  _QWORD v155[3];
  _QWORD v156[3];
  _QWORD v157[3];
  _QWORD v158[3];
  _QWORD v159[3];
  _QWORD v160[3];
  _QWORD v161[3];
  _QWORD v162[3];
  _QWORD v163[3];
  _QWORD v164[3];
  _QWORD v165[3];
  _QWORD v166[3];
  _QWORD v167[3];
  _QWORD v168[3];
  _QWORD v169[3];
  _QWORD v170[3];
  _QWORD v171[3];
  _QWORD v172[3];
  _QWORD v173[3];
  _QWORD v174[3];
  _QWORD v175[3];
  _QWORD v176[3];
  _QWORD v177[3];
  _QWORD v178[3];
  _QWORD v179[3];
  __int128 v180;

  *(_QWORD *)&v180 = *MEMORY[0x24BDAC8D0];
  v5 = (char *)this + 152;
  v4 = *((_QWORD *)this + 19);
  if (v4)
  {
    v6 = *((_QWORD *)this + 20);
    *a2 = v4;
    a2[1] = v6;
    if (v6)
    {
      v7 = (unint64_t *)(v6 + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v24, "about");
    std::string::basic_string[abi:ne180100]<0>(v25, "access");
    std::string::basic_string[abi:ne180100]<0>(v26, "account");
    std::string::basic_string[abi:ne180100]<0>(v27, "add");
    std::string::basic_string[abi:ne180100]<0>(v28, "app");
    std::string::basic_string[abi:ne180100]<0>(v29, "archives");
    std::string::basic_string[abi:ne180100]<0>(v30, "article");
    std::string::basic_string[abi:ne180100]<0>(v31, "attraction");
    std::string::basic_string[abi:ne180100]<0>(v32, "author");
    std::string::basic_string[abi:ne180100]<0>(v33, "bag");
    std::string::basic_string[abi:ne180100]<0>(v34, "biz");
    std::string::basic_string[abi:ne180100]<0>(v35, "book");
    std::string::basic_string[abi:ne180100]<0>(v36, "brand");
    std::string::basic_string[abi:ne180100]<0>(v37, "brands");
    std::string::basic_string[abi:ne180100]<0>(v38, "browse");
    std::string::basic_string[abi:ne180100]<0>(v39, "buy");
    std::string::basic_string[abi:ne180100]<0>(v40, "cancel");
    std::string::basic_string[abi:ne180100]<0>(v41, "cart");
    std::string::basic_string[abi:ne180100]<0>(v42, "cat");
    std::string::basic_string[abi:ne180100]<0>(v43, "catalog");
    std::string::basic_string[abi:ne180100]<0>(v44, "category");
    std::string::basic_string[abi:ne180100]<0>(v45, "categories");
    std::string::basic_string[abi:ne180100]<0>(v46, "channel");
    std::string::basic_string[abi:ne180100]<0>(v47, "charts");
    std::string::basic_string[abi:ne180100]<0>(v48, "checkin");
    std::string::basic_string[abi:ne180100]<0>(v49, "checkout");
    std::string::basic_string[abi:ne180100]<0>(v50, "collection");
    std::string::basic_string[abi:ne180100]<0>(v51, "collections");
    std::string::basic_string[abi:ne180100]<0>(v52, "company");
    std::string::basic_string[abi:ne180100]<0>(v53, "compare");
    std::string::basic_string[abi:ne180100]<0>(v54, "connect");
    std::string::basic_string[abi:ne180100]<0>(v55, "contact");
    std::string::basic_string[abi:ne180100]<0>(v56, "content");
    std::string::basic_string[abi:ne180100]<0>(v57, "contents");
    std::string::basic_string[abi:ne180100]<0>(v58, "cost");
    std::string::basic_string[abi:ne180100]<0>(v59, "coupons");
    std::string::basic_string[abi:ne180100]<0>(v60, "create");
    std::string::basic_string[abi:ne180100]<0>(v61, "data");
    std::string::basic_string[abi:ne180100]<0>(v62, "demo");
    std::string::basic_string[abi:ne180100]<0>(v63, "destinations");
    std::string::basic_string[abi:ne180100]<0>(v64, "detail");
    std::string::basic_string[abi:ne180100]<0>(v65, "discover");
    std::string::basic_string[abi:ne180100]<0>(v66, "download");
    std::string::basic_string[abi:ne180100]<0>(v67, "entry");
    std::string::basic_string[abi:ne180100]<0>(v68, "event");
    std::string::basic_string[abi:ne180100]<0>(v69, "events");
    std::string::basic_string[abi:ne180100]<0>(v70, "explore");
    std::string::basic_string[abi:ne180100]<0>(v71, "faq");
    std::string::basic_string[abi:ne180100]<0>(v72, "fetch");
    std::string::basic_string[abi:ne180100]<0>(v73, "finance");
    std::string::basic_string[abi:ne180100]<0>(v74, "find");
    std::string::basic_string[abi:ne180100]<0>(v75, "food");
    std::string::basic_string[abi:ne180100]<0>(v76, "fund");
    std::string::basic_string[abi:ne180100]<0>(v77, "game");
    std::string::basic_string[abi:ne180100]<0>(v78, "gift");
    std::string::basic_string[abi:ne180100]<0>(v79, "goods");
    std::string::basic_string[abi:ne180100]<0>(v80, "guide");
    std::string::basic_string[abi:ne180100]<0>(v81, "health");
    std::string::basic_string[abi:ne180100]<0>(v82, "help");
    std::string::basic_string[abi:ne180100]<0>(v83, "home");
    std::string::basic_string[abi:ne180100]<0>(v84, "hotel");
    std::string::basic_string[abi:ne180100]<0>(v85, "hotels");
    std::string::basic_string[abi:ne180100]<0>(v86, "id");
    std::string::basic_string[abi:ne180100]<0>(v87, "index");
    std::string::basic_string[abi:ne180100]<0>(v88, "info");
    std::string::basic_string[abi:ne180100]<0>(v89, "item");
    std::string::basic_string[abi:ne180100]<0>(v90, "item_id");
    std::string::basic_string[abi:ne180100]<0>(v91, "join");
    std::string::basic_string[abi:ne180100]<0>(v92, "lifestyle");
    std::string::basic_string[abi:ne180100]<0>(v93, "list");
    std::string::basic_string[abi:ne180100]<0>(v94, "listen");
    std::string::basic_string[abi:ne180100]<0>(v95, "live");
    std::string::basic_string[abi:ne180100]<0>(v96, "local");
    std::string::basic_string[abi:ne180100]<0>(v97, "location");
    std::string::basic_string[abi:ne180100]<0>(v98, "locations");
    std::string::basic_string[abi:ne180100]<0>(v99, "locator");
    std::string::basic_string[abi:ne180100]<0>(v100, "login");
    std::string::basic_string[abi:ne180100]<0>(v101, "manage");
    std::string::basic_string[abi:ne180100]<0>(v102, "menu");
    std::string::basic_string[abi:ne180100]<0>(v103, "more");
    std::string::basic_string[abi:ne180100]<0>(v104, "music");
    std::string::basic_string[abi:ne180100]<0>(v105, "name");
    std::string::basic_string[abi:ne180100]<0>(v106, "news");
    std::string::basic_string[abi:ne180100]<0>(v107, "note");
    std::string::basic_string[abi:ne180100]<0>(v108, "open");
    std::string::basic_string[abi:ne180100]<0>(v109, "order");
    std::string::basic_string[abi:ne180100]<0>(v110, "overview");
    std::string::basic_string[abi:ne180100]<0>(v111, "park");
    std::string::basic_string[abi:ne180100]<0>(v112, "part");
    std::string::basic_string[abi:ne180100]<0>(v113, "pay");
    std::string::basic_string[abi:ne180100]<0>(v114, "payment");
    std::string::basic_string[abi:ne180100]<0>(v115, "payments");
    std::string::basic_string[abi:ne180100]<0>(v116, "play");
    std::string::basic_string[abi:ne180100]<0>(v117, "post");
    std::string::basic_string[abi:ne180100]<0>(v118, "posts");
    std::string::basic_string[abi:ne180100]<0>(v119, "preview");
    std::string::basic_string[abi:ne180100]<0>(v120, "product");
    std::string::basic_string[abi:ne180100]<0>(v121, "product_id");
    std::string::basic_string[abi:ne180100]<0>(v122, "products");
    std::string::basic_string[abi:ne180100]<0>(v123, "profile");
    std::string::basic_string[abi:ne180100]<0>(v124, "promotion");
    std::string::basic_string[abi:ne180100]<0>(v125, "purchase");
    std::string::basic_string[abi:ne180100]<0>(v126, "rate");
    std::string::basic_string[abi:ne180100]<0>(v127, "recipe");
    std::string::basic_string[abi:ne180100]<0>(v128, "recipes");
    std::string::basic_string[abi:ne180100]<0>(v129, "reservation");
    std::string::basic_string[abi:ne180100]<0>(v130, "reservations");
    std::string::basic_string[abi:ne180100]<0>(v131, "reserve");
    std::string::basic_string[abi:ne180100]<0>(v132, "retail");
    std::string::basic_string[abi:ne180100]<0>(v133, "review");
    std::string::basic_string[abi:ne180100]<0>(v134, "rewards");
    std::string::basic_string[abi:ne180100]<0>(v135, "sale");
    std::string::basic_string[abi:ne180100]<0>(v136, "scan");
    std::string::basic_string[abi:ne180100]<0>(v137, "schedule");
    std::string::basic_string[abi:ne180100]<0>(v138, "search");
    std::string::basic_string[abi:ne180100]<0>(v139, "sell");
    std::string::basic_string[abi:ne180100]<0>(v140, "send");
    std::string::basic_string[abi:ne180100]<0>(v141, "service");
    std::string::basic_string[abi:ne180100]<0>(v142, "share");
    std::string::basic_string[abi:ne180100]<0>(v143, "shop");
    std::string::basic_string[abi:ne180100]<0>(v144, "show");
    std::string::basic_string[abi:ne180100]<0>(v145, "showtime");
    std::string::basic_string[abi:ne180100]<0>(v146, "site");
    std::string::basic_string[abi:ne180100]<0>(v147, "song");
    std::string::basic_string[abi:ne180100]<0>(v148, "special");
    std::string::basic_string[abi:ne180100]<0>(v149, "stations");
    std::string::basic_string[abi:ne180100]<0>(v150, "status");
    std::string::basic_string[abi:ne180100]<0>(v151, "store");
    std::string::basic_string[abi:ne180100]<0>(v152, "store-locator");
    std::string::basic_string[abi:ne180100]<0>(v153, "stores");
    std::string::basic_string[abi:ne180100]<0>(v154, "stories");
    std::string::basic_string[abi:ne180100]<0>(v155, "story");
    std::string::basic_string[abi:ne180100]<0>(v156, "tag");
    std::string::basic_string[abi:ne180100]<0>(v157, "tags");
    std::string::basic_string[abi:ne180100]<0>(v158, "terms");
    std::string::basic_string[abi:ne180100]<0>(v159, "tickets");
    std::string::basic_string[abi:ne180100]<0>(v160, "tips");
    std::string::basic_string[abi:ne180100]<0>(v161, "title");
    std::string::basic_string[abi:ne180100]<0>(v162, "today");
    std::string::basic_string[abi:ne180100]<0>(v163, "top");
    std::string::basic_string[abi:ne180100]<0>(v164, "topic");
    std::string::basic_string[abi:ne180100]<0>(v165, "tours");
    std::string::basic_string[abi:ne180100]<0>(v166, "track");
    std::string::basic_string[abi:ne180100]<0>(v167, "transaction");
    std::string::basic_string[abi:ne180100]<0>(v168, "travel");
    std::string::basic_string[abi:ne180100]<0>(v169, "try");
    std::string::basic_string[abi:ne180100]<0>(v170, "update");
    std::string::basic_string[abi:ne180100]<0>(v171, "upload");
    std::string::basic_string[abi:ne180100]<0>(v172, "use");
    std::string::basic_string[abi:ne180100]<0>(v173, "user");
    std::string::basic_string[abi:ne180100]<0>(v174, "vehicles");
    std::string::basic_string[abi:ne180100]<0>(v175, "video");
    std::string::basic_string[abi:ne180100]<0>(v176, "view");
    std::string::basic_string[abi:ne180100]<0>(v177, "visit");
    std::string::basic_string[abi:ne180100]<0>(v178, "watch");
    std::string::basic_string[abi:ne180100]<0>(v179, "wiki");
    v20 = 0;
    v21 = 0;
    v22 = 0;
    *(_QWORD *)&v23 = &v20;
    BYTE8(v23) = 0;
    v20 = (std::string *)operator new(0xEA0uLL);
    v21 = v20;
    v22 = (__int128 *)&v20[156];
    v21 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v22, &v24, &v180, v20);
    v9 = 468;
    do
    {
      if (*((char *)&v25[v9 - 1] - 1) < 0)
        operator delete(*(void **)((char *)&v23 + v9 * 8));
      v9 -= 3;
    }
    while (v9 * 8);
    v19 = 8;
    std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string>&,void>((__int128 **)&v20, &v23);
    std::allocate_shared[abi:ne180100]<UC::UCFixedLengthCoder,std::allocator<UC::UCFixedLengthCoder>,int,std::shared_ptr<std::vector<std::string>>,void>((char *)&v19, &v23, &v24);
    std::shared_ptr<UC::UCHuffmanCoder>::operator=[abi:ne180100]((uint64_t)v5, &v24);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v24 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v23 + 1);
    if (*((_QWORD *)&v23 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v23 + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v16 = *((_QWORD *)this + 20);
    *a2 = *((_QWORD *)this + 19);
    a2[1] = v16;
    if (v16)
    {
      v17 = (unint64_t *)(v16 + 8);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    *(_QWORD *)&v24 = &v20;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v24);
  }
}

void sub_220DE5920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void **a16)
{
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  a16 = (void **)&a10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

void UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQuery6BitAlphabetCoder(UC::SUE::UCSegmentedURLCoderProvider *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  int v19;
  std::string *v20;
  std::string *v21;
  __int128 *v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  _QWORD v43[3];
  _QWORD v44[3];
  _QWORD v45[3];
  _QWORD v46[3];
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[3];
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[3];
  _QWORD v58[3];
  _QWORD v59[3];
  _QWORD v60[3];
  _QWORD v61[3];
  _QWORD v62[3];
  _QWORD v63[3];
  _QWORD v64[3];
  _QWORD v65[3];
  _QWORD v66[3];
  _QWORD v67[3];
  _QWORD v68[3];
  _QWORD v69[3];
  _QWORD v70[3];
  _QWORD v71[3];
  _QWORD v72[3];
  _QWORD v73[3];
  _QWORD v74[3];
  _QWORD v75[3];
  _QWORD v76[3];
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[3];
  _QWORD v84[3];
  _QWORD v85[3];
  _QWORD v86[3];
  _QWORD v87[3];
  __int128 v88;

  *(_QWORD *)&v88 = *MEMORY[0x24BDAC8D0];
  v5 = (char *)this + 168;
  v4 = *((_QWORD *)this + 21);
  if (v4)
  {
    v6 = *((_QWORD *)this + 22);
    *a2 = v4;
    a2[1] = v6;
    if (v6)
    {
      v7 = (unint64_t *)(v6 + 8);
      do
        v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v24, ".");
    std::string::basic_string[abi:ne180100]<0>(v25, "0");
    std::string::basic_string[abi:ne180100]<0>(v26, "1");
    std::string::basic_string[abi:ne180100]<0>(v27, "2");
    std::string::basic_string[abi:ne180100]<0>(v28, "3");
    std::string::basic_string[abi:ne180100]<0>(v29, "4");
    std::string::basic_string[abi:ne180100]<0>(v30, "5");
    std::string::basic_string[abi:ne180100]<0>(v31, "6");
    std::string::basic_string[abi:ne180100]<0>(v32, "7");
    std::string::basic_string[abi:ne180100]<0>(v33, "8");
    std::string::basic_string[abi:ne180100]<0>(v34, "9");
    std::string::basic_string[abi:ne180100]<0>(v35, "A");
    std::string::basic_string[abi:ne180100]<0>(v36, "B");
    std::string::basic_string[abi:ne180100]<0>(v37, "C");
    std::string::basic_string[abi:ne180100]<0>(v38, "D");
    std::string::basic_string[abi:ne180100]<0>(v39, "E");
    std::string::basic_string[abi:ne180100]<0>(v40, "F");
    std::string::basic_string[abi:ne180100]<0>(v41, "G");
    std::string::basic_string[abi:ne180100]<0>(v42, "H");
    std::string::basic_string[abi:ne180100]<0>(v43, "I");
    std::string::basic_string[abi:ne180100]<0>(v44, "J");
    std::string::basic_string[abi:ne180100]<0>(v45, "K");
    std::string::basic_string[abi:ne180100]<0>(v46, "L");
    std::string::basic_string[abi:ne180100]<0>(v47, "M");
    std::string::basic_string[abi:ne180100]<0>(v48, "N");
    std::string::basic_string[abi:ne180100]<0>(v49, "O");
    std::string::basic_string[abi:ne180100]<0>(v50, "P");
    std::string::basic_string[abi:ne180100]<0>(v51, "Q");
    std::string::basic_string[abi:ne180100]<0>(v52, "R");
    std::string::basic_string[abi:ne180100]<0>(v53, "S");
    std::string::basic_string[abi:ne180100]<0>(v54, "T");
    std::string::basic_string[abi:ne180100]<0>(v55, "U");
    std::string::basic_string[abi:ne180100]<0>(v56, "V");
    std::string::basic_string[abi:ne180100]<0>(v57, "W");
    std::string::basic_string[abi:ne180100]<0>(v58, "X");
    std::string::basic_string[abi:ne180100]<0>(v59, "Y");
    std::string::basic_string[abi:ne180100]<0>(v60, "Z");
    std::string::basic_string[abi:ne180100]<0>(v61, "a");
    std::string::basic_string[abi:ne180100]<0>(v62, "b");
    std::string::basic_string[abi:ne180100]<0>(v63, "c");
    std::string::basic_string[abi:ne180100]<0>(v64, "d");
    std::string::basic_string[abi:ne180100]<0>(v65, "e");
    std::string::basic_string[abi:ne180100]<0>(v66, "f");
    std::string::basic_string[abi:ne180100]<0>(v67, "g");
    std::string::basic_string[abi:ne180100]<0>(v68, "h");
    std::string::basic_string[abi:ne180100]<0>(v69, "i");
    std::string::basic_string[abi:ne180100]<0>(v70, "j");
    std::string::basic_string[abi:ne180100]<0>(v71, "k");
    std::string::basic_string[abi:ne180100]<0>(v72, "l");
    std::string::basic_string[abi:ne180100]<0>(v73, "m");
    std::string::basic_string[abi:ne180100]<0>(v74, "n");
    std::string::basic_string[abi:ne180100]<0>(v75, "o");
    std::string::basic_string[abi:ne180100]<0>(v76, "p");
    std::string::basic_string[abi:ne180100]<0>(v77, "q");
    std::string::basic_string[abi:ne180100]<0>(v78, "r");
    std::string::basic_string[abi:ne180100]<0>(v79, "s");
    std::string::basic_string[abi:ne180100]<0>(v80, "t");
    std::string::basic_string[abi:ne180100]<0>(v81, "u");
    std::string::basic_string[abi:ne180100]<0>(v82, "v");
    std::string::basic_string[abi:ne180100]<0>(v83, "w");
    std::string::basic_string[abi:ne180100]<0>(v84, "x");
    std::string::basic_string[abi:ne180100]<0>(v85, "y");
    std::string::basic_string[abi:ne180100]<0>(v86, "z");
    std::string::basic_string[abi:ne180100]<0>(v87, "|");
    v20 = 0;
    v21 = 0;
    v22 = 0;
    *(_QWORD *)&v23 = &v20;
    BYTE8(v23) = 0;
    v20 = (std::string *)operator new(0x600uLL);
    v21 = v20;
    v22 = (__int128 *)&v20[64];
    v21 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v22, &v24, &v88, v20);
    v9 = 192;
    do
    {
      if (*((char *)&v25[v9 - 1] - 1) < 0)
        operator delete(*(void **)((char *)&v23 + v9 * 8));
      v9 -= 3;
    }
    while (v9 * 8);
    v19 = 6;
    std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string>&,void>((__int128 **)&v20, &v23);
    std::allocate_shared[abi:ne180100]<UC::UCFixedLengthCoder,std::allocator<UC::UCFixedLengthCoder>,int,std::shared_ptr<std::vector<std::string>>,void>((char *)&v19, &v23, &v24);
    std::shared_ptr<UC::UCHuffmanCoder>::operator=[abi:ne180100]((uint64_t)v5, &v24);
    v10 = (std::__shared_weak_count *)*((_QWORD *)&v24 + 1);
    if (*((_QWORD *)&v24 + 1))
    {
      v11 = (unint64_t *)(*((_QWORD *)&v24 + 1) + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = (std::__shared_weak_count *)*((_QWORD *)&v23 + 1);
    if (*((_QWORD *)&v23 + 1))
    {
      v14 = (unint64_t *)(*((_QWORD *)&v23 + 1) + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 - 1, v14));
      if (!v15)
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    v16 = *((_QWORD *)this + 22);
    *a2 = *((_QWORD *)this + 21);
    a2[1] = v16;
    if (v16)
    {
      v17 = (unint64_t *)(v16 + 8);
      do
        v18 = __ldxr(v17);
      while (__stxr(v18 + 1, v17));
    }
    *(_QWORD *)&v24 = &v20;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v24);
  }
}

void sub_220DE6108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void **a16)
{
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a13);
  a16 = (void **)&a10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<std::string,unsigned short>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    v5 = 32 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,unsigned short> const&>(a1, a2, (uint64_t)a2);
      a2 += 32;
      v5 -= 32;
    }
    while (v5);
  }
  return a1;
}

void sub_220DE6204(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,unsigned short> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unsigned __int8 **v13;
  unsigned __int8 *i;
  unint64_t v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD v25[3];

  v7 = (_QWORD *)(a1 + 24);
  v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v10)
        v3 = v8 % v10;
    }
    else
    {
      v3 = (v10 - 1) & v8;
    }
    v13 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(unsigned __int8 **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v15 == v9)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__construct_node_hash<std::pair<std::string const,unsigned short> const&>(a1, v9, a3, (uint64_t)v25);
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    v18 = 1;
    if (v10 >= 3)
      v18 = (v10 & (v10 - 1)) != 0;
    v19 = v18 | (2 * v10);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(a1, v21);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v3 = v9 % v10;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v10 - 1) & v9;
    }
  }
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v22)
  {
    *(_QWORD *)v25[0] = *v22;
    *v22 = v25[0];
  }
  else
  {
    *(_QWORD *)v25[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v25[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v25[0])
    {
      v23 = *(_QWORD *)(*(_QWORD *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10)
          v23 %= v10;
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = v25[0];
    }
  }
  i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_220DE6470(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__construct_node_hash<std::pair<std::string const,unsigned short> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *v9;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x30uLL);
  *(_QWORD *)(a4 + 8) = v7;
  *(_QWORD *)a4 = v8;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  v9 = (std::string *)(v8 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((_QWORD *)v8 + 4) = *(_QWORD *)(a3 + 16);
  }
  *((_WORD *)v8 + 20) = *(_WORD *)(a3 + 24);
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_220DE6520(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
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

uint64_t std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__deallocate_node(int a1, void **__p)
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

char *std::vector<std::string>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

_QWORD *std::allocate_shared[abi:ne180100]<std::unordered_map<std::string,unsigned short>,std::allocator<std::unordered_map<std::string,unsigned short>>,std::unordered_map<std::string,unsigned short>&,void>@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *result;

  v4 = operator new(0x40uLL);
  result = std::__shared_ptr_emplace<std::unordered_map<std::string,unsigned short>>::__shared_ptr_emplace[abi:ne180100]<std::unordered_map<std::string,unsigned short>&,std::allocator<std::unordered_map<std::string,unsigned short>>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_220DE6698(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<std::unordered_map<std::string,unsigned short>>::__shared_ptr_emplace[abi:ne180100]<std::unordered_map<std::string,unsigned short>&,std::allocator<std::unordered_map<std::string,unsigned short>>,0>(_QWORD *a1, uint64_t a2)
{
  a1[2] = 0;
  *a1 = &unk_24E6B2758;
  a1[1] = 0;
  std::unordered_map<std::string,unsigned short>::unordered_map((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_220DE66E4(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<std::unordered_map<std::string,unsigned short>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24E6B2758;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::unordered_map<std::string,unsigned short>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24E6B2758;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<std::unordered_map<std::string,unsigned short>>::__on_zero_shared(uint64_t a1)
{
  return std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table(a1 + 24);
}

uint64_t std::unordered_map<std::string,unsigned short>::unordered_map(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(unsigned __int8 **)(a2 + 16); i; i = *(unsigned __int8 **)i)
    std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,unsigned short> const&>(a1, i + 16, (uint64_t)(i + 16));
  return a1;
}

void sub_220DE6798(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string>&,void>@<X0>(__int128 **a1@<X1>, _QWORD *a2@<X8>)
{
  char *v4;
  uint64_t result;

  v4 = (char *)operator new(0x30uLL);
  result = std::__shared_ptr_emplace<std::vector<std::string>>::__shared_ptr_emplace[abi:ne180100]<std::vector<std::string>&,std::allocator<std::vector<std::string>>,0>((uint64_t)v4, a1);
  *a2 = v4 + 24;
  a2[1] = v4;
  return result;
}

void sub_220DE67F4(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<std::vector<std::string>>::__shared_ptr_emplace[abi:ne180100]<std::vector<std::string>&,std::allocator<std::vector<std::string>>,0>(uint64_t a1, __int128 **a2)
{
  *(_OWORD *)(a1 + 8) = 0u;
  *(_QWORD *)a1 = &unk_24E6B2790;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 24) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a1 + 24), *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3));
  return a1;
}

void sub_220DE6868(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<std::vector<std::string>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24E6B2790;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::vector<std::string>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24E6B2790;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<std::vector<std::string>>::__on_zero_shared(uint64_t a1)
{
  void **v1;

  v1 = (void **)(a1 + 24);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v1);
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  std::string *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_220DE6944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
{
  std::string *v4;
  __int128 *v6;
  __int128 v7;
  _QWORD v9[3];
  char v10;
  std::string *v11;
  std::string *v12;

  v4 = this;
  v11 = this;
  v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  v10 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
        v4 = v12;
      }
      else
      {
        v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      v6 = (__int128 *)((char *)v6 + 24);
      v12 = ++v4;
    }
    while (v6 != a3);
  }
  v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_220DE6A0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::allocate_shared[abi:ne180100]<UC::UCSymbolFrequencyTable,std::allocator<UC::UCSymbolFrequencyTable>,std::shared_ptr<std::unordered_map<std::string,unsigned short>> &,std::shared_ptr<std::vector<std::string>>,void>@<X0>(uint64_t *a1@<X1>, __int128 *a2@<X2>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  _QWORD *result;

  v6 = operator new(0x40uLL);
  result = std::__shared_ptr_emplace<UC::UCSymbolFrequencyTable>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<std::unordered_map<std::string,unsigned short>> &,std::shared_ptr<std::vector<std::string>>,std::allocator<UC::UCSymbolFrequencyTable>,0>(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_220DE6A6C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<UC::UCSymbolFrequencyTable>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<std::unordered_map<std::string,unsigned short>> &,std::shared_ptr<std::vector<std::string>>,std::allocator<UC::UCSymbolFrequencyTable>,0>(_QWORD *a1, uint64_t *a2, __int128 *a3)
{
  char v5;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_24E6B27C8;
  std::allocator<UC::UCSymbolFrequencyTable>::construct[abi:ne180100]<UC::UCSymbolFrequencyTable,std::shared_ptr<std::unordered_map<std::string,unsigned short>> &,std::shared_ptr<std::vector<std::string>>>((uint64_t)&v5, a1 + 3, a2, a3);
  return a1;
}

void sub_220DE6ACC(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<UC::UCSymbolFrequencyTable>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24E6B27C8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<UC::UCSymbolFrequencyTable>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24E6B27C8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<UC::UCSymbolFrequencyTable>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 24;
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](a1 + 40);
  return std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](v1);
}

void std::allocator<UC::UCSymbolFrequencyTable>::construct[abi:ne180100]<UC::UCSymbolFrequencyTable,std::shared_ptr<std::unordered_map<std::string,unsigned short>> &,std::shared_ptr<std::vector<std::string>>>(uint64_t a1, _QWORD *a2, uint64_t *a3, __int128 *a4)
{
  std::__shared_weak_count *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  __int128 v13;
  uint64_t v14;
  std::__shared_weak_count *v15;

  v4 = (std::__shared_weak_count *)a3[1];
  v14 = *a3;
  v15 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  v13 = *a4;
  *(_QWORD *)a4 = 0;
  *((_QWORD *)a4 + 1) = 0;
  UC::UCSymbolFrequencyTable::UCSymbolFrequencyTable(a2, &v14, &v13);
  v7 = (std::__shared_weak_count *)*((_QWORD *)&v13 + 1);
  if (*((_QWORD *)&v13 + 1))
  {
    v8 = (unint64_t *)(*((_QWORD *)&v13 + 1) + 8);
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v10 = v15;
  if (v15)
  {
    v11 = (unint64_t *)&v15->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

void sub_220DE6C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

_QWORD *std::allocate_shared[abi:ne180100]<UC::UCHuffmanCoder,std::allocator<UC::UCHuffmanCoder>,std::shared_ptr<UC::UCSymbolFrequencyTable> &,void>@<X0>(uint64_t *a1@<X1>, _QWORD *a2@<X8>)
{
  _QWORD *v4;
  _QWORD *result;

  v4 = operator new(0x30uLL);
  result = std::__shared_ptr_emplace<UC::UCHuffmanCoder>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<UC::UCSymbolFrequencyTable> &,std::allocator<UC::UCHuffmanCoder>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_220DE6C68(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<UC::UCHuffmanCoder>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<UC::UCSymbolFrequencyTable> &,std::allocator<UC::UCHuffmanCoder>,0>(_QWORD *a1, uint64_t *a2)
{
  char v4;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_24E6B2800;
  std::allocator<UC::UCHuffmanCoder>::construct[abi:ne180100]<UC::UCHuffmanCoder,std::shared_ptr<UC::UCSymbolFrequencyTable> &>((uint64_t)&v4, (uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_220DE6CC4(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<UC::UCHuffmanCoder>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24E6B2800;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<UC::UCHuffmanCoder>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24E6B2800;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<UC::UCHuffmanCoder>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::allocator<UC::UCHuffmanCoder>::construct[abi:ne180100]<UC::UCHuffmanCoder,std::shared_ptr<UC::UCSymbolFrequencyTable> &>(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  std::__shared_weak_count *v10;

  v3 = (std::__shared_weak_count *)a3[1];
  v9 = *a3;
  v10 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  UC::UCHuffmanCoder::UCHuffmanCoder(a2, &v9);
  v6 = v10;
  if (v10)
  {
    v7 = (unint64_t *)&v10->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_220DE6D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

_QWORD *std::allocate_shared[abi:ne180100]<UC::UCFixedLengthCoder,std::allocator<UC::UCFixedLengthCoder>,int,std::shared_ptr<std::vector<std::string>>,void>@<X0>(char *a1@<X1>, __int128 *a2@<X2>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  _QWORD *result;

  v6 = operator new(0x40uLL);
  result = std::__shared_ptr_emplace<UC::UCFixedLengthCoder>::__shared_ptr_emplace[abi:ne180100]<int,std::shared_ptr<std::vector<std::string>>,std::allocator<UC::UCFixedLengthCoder>,0>(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_220DE6DFC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<UC::UCFixedLengthCoder>::__shared_ptr_emplace[abi:ne180100]<int,std::shared_ptr<std::vector<std::string>>,std::allocator<UC::UCFixedLengthCoder>,0>(_QWORD *a1, char *a2, __int128 *a3)
{
  char v5;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_24E6B2838;
  std::allocator<UC::UCFixedLengthCoder>::construct[abi:ne180100]<UC::UCFixedLengthCoder,int,std::shared_ptr<std::vector<std::string>>>((uint64_t)&v5, (uint64_t)(a1 + 3), a2, a3);
  return a1;
}

void sub_220DE6E5C(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<UC::UCFixedLengthCoder>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24E6B2838;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<UC::UCFixedLengthCoder>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24E6B2838;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<UC::UCFixedLengthCoder>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::allocator<UC::UCFixedLengthCoder>::construct[abi:ne180100]<UC::UCFixedLengthCoder,int,std::shared_ptr<std::vector<std::string>>>(uint64_t a1, uint64_t a2, char *a3, __int128 *a4)
{
  char v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __int128 v9;

  v5 = *a3;
  v9 = *a4;
  *(_QWORD *)a4 = 0;
  *((_QWORD *)a4 + 1) = 0;
  UC::UCFixedLengthCoder::UCFixedLengthCoder(a2, v5, &v9);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
  if (*((_QWORD *)&v9 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_220DE6F24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void std::default_delete<UC::UCMultiContextHuffmanSymbolFrequencyReader>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](a2 + 48);
    if (*(char *)(a2 + 47) < 0)
      operator delete(*(void **)(a2 + 24));
    std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](a2 + 8);
    operator delete((void *)a2);
  }
}

_QWORD *std::allocate_shared[abi:ne180100]<UC::UCMultiContextHuffmanCoder,std::allocator<UC::UCMultiContextHuffmanCoder>,std::shared_ptr<UC::UCMultiContextSymbolFrequencyTrie>,int,void>@<X0>(__int128 *a1@<X1>, int *a2@<X2>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  _QWORD *result;

  v6 = operator new(0x68uLL);
  result = std::__shared_ptr_emplace<UC::UCMultiContextHuffmanCoder>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<UC::UCMultiContextSymbolFrequencyTrie>,int,std::allocator<UC::UCMultiContextHuffmanCoder>,0>(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_220DE6FCC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<UC::UCMultiContextHuffmanCoder>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<UC::UCMultiContextSymbolFrequencyTrie>,int,std::allocator<UC::UCMultiContextHuffmanCoder>,0>(_QWORD *a1, __int128 *a2, int *a3)
{
  char v5;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_24E6B2870;
  std::allocator<UC::UCMultiContextHuffmanCoder>::construct[abi:ne180100]<UC::UCMultiContextHuffmanCoder,std::shared_ptr<UC::UCMultiContextSymbolFrequencyTrie>,int>((uint64_t)&v5, (uint64_t)(a1 + 3), a2, a3);
  return a1;
}

void sub_220DE702C(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<UC::UCMultiContextHuffmanCoder>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24E6B2870;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<UC::UCMultiContextHuffmanCoder>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24E6B2870;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<UC::UCMultiContextHuffmanCoder>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void std::allocator<UC::UCMultiContextHuffmanCoder>::construct[abi:ne180100]<UC::UCMultiContextHuffmanCoder,std::shared_ptr<UC::UCMultiContextSymbolFrequencyTrie>,int>(uint64_t a1, uint64_t a2, __int128 *a3, int *a4)
{
  __n128 v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 v8;

  v8 = *a3;
  *(_QWORD *)a3 = 0;
  *((_QWORD *)a3 + 1) = 0;
  v4.n128_f64[0] = UC::UCMultiContextHuffmanCoder::UCMultiContextHuffmanCoder(a2, &v8, *a4);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v8 + 1);
  if (*((_QWORD *)&v8 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v8 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *, __n128))v5->__on_zero_shared)(v5, v4);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

void sub_220DE70F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

const UC::UCMultiContextSymbolFrequencyTrie *UC::UCMultiContextSymbolFrequencyTrie::UCMultiContextSymbolFrequencyTrie(const UC::UCMultiContextSymbolFrequencyTrie *a1, _QWORD *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t *v10;
  _OWORD *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  int v21;
  uint64_t v22;
  __int128 v23;

  *(_QWORD *)a1 = *a2;
  v5 = a2[1];
  *((_QWORD *)a1 + 1) = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = -1431655765 * ((*(_DWORD *)(*a2 + 8) - *(_DWORD *)*a2) >> 3);
  v9 = *a3;
  *a3 = 0;
  *((_QWORD *)a1 + 4) = 0;
  v10 = (uint64_t *)((char *)a1 + 32);
  *((_BYTE *)a1 + 16) = v8;
  *((_QWORD *)a1 + 3) = v9;
  *((_QWORD *)a1 + 5) = a4;
  *((_QWORD *)a1 + 6) = 0;
  *((_QWORD *)a1 + 7) = 0;
  v11 = operator new(0x28uLL);
  *v11 = 0u;
  v11[1] = 0u;
  *((_DWORD *)v11 + 8) = 1065353216;
  std::unique_ptr<std::unordered_map<std::string,unsigned char>>::reset[abi:ne180100]((uint64_t *)a1 + 4, (uint64_t)v11);
  v12 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  if (-85 * ((v12 - **(_QWORD **)a1) >> 3))
  {
    v13 = 0;
    v14 = (-85 * ((v12 - **(_QWORD **)a1) >> 3));
    do
    {
      v15 = **(_QWORD **)a1;
      if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(*(_QWORD *)a1 + 8) - v15) >> 3) <= v13)
        std::vector<std::string>::__throw_out_of_range[abi:ne180100]();
      v16 = *v10;
      *(_QWORD *)&v23 = v15 + 24 * v13;
      std::__hash_table<std::__hash_value_type<std::string,unsigned char>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned char>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned char>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned char>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v16, (unsigned __int8 *)v23, (uint64_t)&std::piecewise_construct, (__int128 **)&v23)[40] = v13++;
    }
    while (v13 < v14);
  }
  v22 = 0;
  v21 = 0;
  std::allocate_shared[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie::Node,std::allocator<UC::UCMultiContextSymbolFrequencyTrie::Node>,UC::UCMultiContextSymbolFrequencyTrie&,int,int,int,void>(a1, (char *)&v22 + 4, (char *)&v22, &v21, &v23);
  std::shared_ptr<UC::UCHuffmanCoder>::operator=[abi:ne180100]((uint64_t)a1 + 48, &v23);
  v17 = (std::__shared_weak_count *)*((_QWORD *)&v23 + 1);
  if (*((_QWORD *)&v23 + 1))
  {
    v18 = (unint64_t *)(*((_QWORD *)&v23 + 1) + 8);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  return a1;
}

void sub_220DE72CC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  void *v5;

  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](v3);
  std::unique_ptr<std::unordered_map<std::string,unsigned char>>::reset[abi:ne180100](v2, 0);
  v5 = *(void **)(v1 + 24);
  *(_QWORD *)(v1 + 24) = 0;
  if (v5)
    operator delete[](v5);
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

_QWORD *UC::UCMultiContextSymbolFrequencyTrie::getOrderedSymbols@<X0>(_QWORD *this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = this[1];
  *a2 = *this;
  a2[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return this;
}

UC::UCMultiContextSymbolFrequencyTrie::Node *UC::UCMultiContextSymbolFrequencyTrie::Node::childNodeForSymbol(unsigned __int8 *a1, unsigned __int8 *a2)
{
  UC::UCMultiContextSymbolFrequencyTrie::Node *v2;
  unsigned __int8 *v4;
  uint64_t **v5;
  unsigned int v6;
  unsigned __int8 *v7;
  int v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  int v14;
  char v15;
  int v16;
  char v17;
  uint64_t v18;
  void **v19;
  char v21;
  unsigned __int8 *v22;

  if (*(_QWORD *)(*(_QWORD *)a1 + 40) == a1[8])
    return 0;
  v4 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::find<std::string>(*(_QWORD **)(*(_QWORD *)a1 + 32), a2);
  if (!v4)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  v21 = v4[40];
  v5 = std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::find<unsigned char>(*((_QWORD **)a1 + 2), (unsigned __int8 *)&v21);
  if (v5)
    return (UC::UCMultiContextSymbolFrequencyTrie::Node *)v5[3];
  v6 = a1[8];
  v7 = *(unsigned __int8 **)a1;
  if (a1[8])
  {
    v8 = *((_DWORD *)a1 + 3);
    v9 = v7[16];
    v10 = a1[9];
    v11 = v7[40];
    if (v6 >= v11)
    {
      v12 = 0;
    }
    else
    {
      v12 = 0;
      v13 = a1[8];
      do
        v12 += pow((double)v9, (double)v13++);
      while (v11 > v13);
    }
    v14 = v8 + v9 - v10 + v12 * v10;
  }
  else
  {
    v14 = 1;
  }
  v15 = v21;
  v16 = v14 + v21;
  v17 = v6 + 1;
  v2 = (UC::UCMultiContextSymbolFrequencyTrie::Node *)operator new(0x18uLL);
  UC::UCMultiContextSymbolFrequencyTrie::Node::Node(v2, (const UC::UCMultiContextSymbolFrequencyTrie *)v7, v17, v15, v16);
  v18 = *((_QWORD *)a1 + 2);
  v22 = (unsigned __int8 *)&v21;
  v19 = (void **)std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char const&>,std::tuple<>>(v18, (unsigned __int8 *)&v21, (uint64_t)&std::piecewise_construct, &v22);
  std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>::reset[abi:ne180100](v19 + 3, v2);
  return v2;
}

void sub_220DE74AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>::reset[abi:ne180100]((void **)va, 0);
  _Unwind_Resume(a1);
}

uint64_t UC::UCMultiContextSymbolFrequencyTrie::getRootNode(UC::UCMultiContextSymbolFrequencyTrie *this)
{
  return *((_QWORD *)this + 6);
}

void UC::UCMultiContextSymbolFrequencyTrie::clearCaches(UC::UCMultiContextSymbolFrequencyTrie *this)
{
  std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::clear(*(_QWORD *)(*((_QWORD *)this + 6) + 16));
}

UC::UCMultiContextSymbolFrequencyTrie::Node *UC::UCMultiContextSymbolFrequencyTrie::Node::Node(UC::UCMultiContextSymbolFrequencyTrie::Node *this, const UC::UCMultiContextSymbolFrequencyTrie *a2, char a3, char a4, int a5)
{
  uint64_t *v6;
  _OWORD *v7;

  *(_QWORD *)this = a2;
  *((_BYTE *)this + 8) = a3;
  *((_BYTE *)this + 9) = a4;
  *((_DWORD *)this + 3) = a5;
  *((_QWORD *)this + 2) = 0;
  v6 = (uint64_t *)((char *)this + 16);
  v7 = operator new(0x28uLL);
  *v7 = 0u;
  v7[1] = 0u;
  *((_DWORD *)v7 + 8) = 1065353216;
  std::unique_ptr<std::unordered_map<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>::reset[abi:ne180100](v6, (uint64_t)v7);
  return this;
}

void sub_220DE7544(_Unwind_Exception *a1)
{
  uint64_t *v1;

  std::unique_ptr<std::unordered_map<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

uint64_t UC::UCMultiContextSymbolFrequencyTrie::Node::getFrequencyForSymbol(_DWORD *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  int v3;
  unsigned __int8 *v4;

  v2 = *(_QWORD *)a1;
  v3 = a1[3];
  v4 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::find<std::string>(*(_QWORD **)(*(_QWORD *)a1 + 32), a2);
  if (!v4)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  return _byteswap_ushort(*(_WORD *)(*(_QWORD *)(v2 + 24)
                                   + 2 * (v4[40] + v3 * *(unsigned __int8 *)(v2 + 16))));
}

void std::unique_ptr<std::unordered_map<std::string,unsigned char>>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    v4 = (void *)std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table(v3);
    operator delete(v4);
  }
}

void std::vector<std::string>::__throw_out_of_range[abi:ne180100]()
{
  std::__throw_out_of_range[abi:ne180100]("vector");
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
}

void sub_220DE7638(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,unsigned char>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned char>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned char>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned char>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v26[3];

  v8 = (_QWORD *)(a1 + 24);
  v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,unsigned char>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned char>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned char>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned char>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    v19 = 1;
    if (v11 >= 3)
      v19 = (v11 & (v11 - 1)) != 0;
    v20 = v19 | (2 * v11);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(a1, v22);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    *(_QWORD *)v26[0] = *v23;
    *v23 = v26[0];
  }
  else
  {
    *(_QWORD *)v26[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v26[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v26[0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11)
          v24 %= v11;
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  ++*v8;
  return i;
}

void sub_220DE78BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100]((uint64_t)&a13, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned char>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned char>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned char>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned char>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *v9;
  __int128 *v10;
  __int128 v11;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x30uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  v9 = (std::string *)(v8 + 16);
  v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((_QWORD *)v10 + 1));
  }
  else
  {
    v11 = *v10;
    *((_QWORD *)v8 + 4) = *((_QWORD *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  v8[40] = 0;
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_220DE796C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

_QWORD *std::allocate_shared[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie::Node,std::allocator<UC::UCMultiContextSymbolFrequencyTrie::Node>,UC::UCMultiContextSymbolFrequencyTrie&,int,int,int,void>@<X0>(const UC::UCMultiContextSymbolFrequencyTrie *a1@<X1>, char *a2@<X2>, char *a3@<X3>, int *a4@<X4>, _QWORD *a5@<X8>)
{
  _QWORD *v10;
  _QWORD *result;

  v10 = operator new(0x30uLL);
  result = std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie::Node>::__shared_ptr_emplace[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie&,int,int,int,std::allocator<UC::UCMultiContextSymbolFrequencyTrie::Node>,0>(v10, a1, a2, a3, a4);
  *a5 = v10 + 3;
  a5[1] = v10;
  return result;
}

void sub_220DE79EC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie::Node>::__shared_ptr_emplace[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie&,int,int,int,std::allocator<UC::UCMultiContextSymbolFrequencyTrie::Node>,0>(_QWORD *a1, const UC::UCMultiContextSymbolFrequencyTrie *a2, char *a3, char *a4, int *a5)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_24E6B28A8;
  UC::UCMultiContextSymbolFrequencyTrie::Node::Node((UC::UCMultiContextSymbolFrequencyTrie::Node *)(a1 + 3), a2, *a3, *a4, *a5);
  return a1;
}

void sub_220DE7A40(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie::Node>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24E6B28A8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie::Node>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24E6B28A8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie::Node>::__on_zero_shared(uint64_t a1)
{
  std::unique_ptr<std::unordered_map<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>::reset[abi:ne180100]((uint64_t *)(a1 + 40), 0);
}

void std::unique_ptr<std::unordered_map<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    v4 = (void *)std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::~__hash_table(v3);
    operator delete(v4);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::__deallocate_node(uint64_t a1, void **a2)
{
  void **v2;
  void **v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (void **)*v2;
      std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>::reset[abi:ne180100](v2 + 3, 0);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

uint64_t **std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::find<unsigned char>(_QWORD *a1, unsigned __int8 *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t ***v6;
  uint64_t **result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (*(_QWORD *)&v2 <= v3)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (v2.i32[0] - 1) & v3;
  }
  v6 = *(uint64_t ****)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  for (result = *v6; result; result = (uint64_t **)*result)
  {
    v8 = (unint64_t)result[1];
    if (v8 == v3)
    {
      if (*((unsigned __int8 *)result + 16) == (_DWORD)v3)
        return result;
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(_QWORD *)&v2)
          v8 %= *(_QWORD *)&v2;
      }
      else
      {
        v8 &= *(_QWORD *)&v2 - 1;
      }
      if (v8 != v5)
        return 0;
    }
  }
  return result;
}

void std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>::reset[abi:ne180100](void **a1, void *a2)
{
  char *v2;

  v2 = (char *)*a1;
  *a1 = a2;
  if (v2)
  {
    std::unique_ptr<std::unordered_map<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>::reset[abi:ne180100](v2 + 16, 0);
    operator delete(v2);
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _BYTE **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  _QWORD *v13;
  float v14;
  float v15;
  _BOOL8 v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v8 <= v7)
        v4 = v7 % v8;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (*((unsigned __int8 *)v11 + 16) == (_DWORD)v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v13 = (_QWORD *)(a1 + 16);
  v11 = operator new(0x20uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_BYTE *)v11 + 16) = **a4;
  v11[3] = 0;
  v14 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    v16 = 1;
    if (v8 >= 3)
      v16 = (v8 & (v8 - 1)) != 0;
    v17 = v16 | (2 * v8);
    v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18)
      v19 = v18;
    else
      v19 = v17;
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(a1, v19);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
  }
  v20 = *(_QWORD *)a1;
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    *v11 = *v21;
LABEL_38:
    *v21 = v11;
    goto LABEL_39;
  }
  *v11 = *v13;
  *v13 = v11;
  *(_QWORD *)(v20 + 8 * v4) = v13;
  if (*v11)
  {
    v22 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8)
        v22 %= v8;
    }
    else
    {
      v22 &= v8 - 1;
    }
    v21 = (_QWORD *)(*(_QWORD *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_220DE7EB4(_Unwind_Exception *a1)
{
  void **v1;
  uint64_t v2;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
    std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>::reset[abi:ne180100](__p + 3, 0);
  if (__p)
    operator delete(__p);
}

void sub_220DE7FC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220DE80D0(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void sub_220DE81BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_220DE8320(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  operator delete(v1);

  _Unwind_Resume(a1);
}

void sub_220DE8380()
{
  JUMPOUT(0x220DE8388);
}

void sub_220DE8528()
{
  void *v0;

  __cxa_end_catch();
  JUMPOUT(0x220DE8370);
}

void sub_220DE8544()
{
  __cxa_end_catch();
  JUMPOUT(0x220DE8370);
}

void sub_220DE8550()
{
  JUMPOUT(0x220DE8370);
}

id nsStringFromString(uint64_t a1, uint64_t a2)
{
  if (a2)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
  else
    return 0;
}

void sub_220DE8664(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220DE888C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  void *v11;
  void *v12;
  void *v13;

  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

void sub_220DE89C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220DE8AC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220DE8DD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_220DE9164(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](v2);

  _Unwind_Resume(a1);
}

void sub_220DE9180(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void **__p, uint64_t a10, int a11, __int16 a12, char a13, unsigned __int8 a14)
{
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v21;
  void *v22;
  const std::string::value_type *v23;
  void **p_p;
  uint64_t v25;
  id v26;

  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](v18 - 184);
  operator delete(v17);
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](v18 - 128);
  if (a2 == 1)
  {
    v21 = __cxa_begin_catch(a1);
    if (v15)
    {
      v22 = v21;
      std::string::basic_string[abi:ne180100]<0>(&__p, "Encountered an internal error while initializing the URL encoder. ");
      v23 = (const std::string::value_type *)(*(uint64_t (**)(void *))(*(_QWORD *)v22 + 16))(v22);
      std::string::append((std::string *)&__p, v23);
      if ((a14 & 0x80u) == 0)
        p_p = (void **)&__p;
      else
        p_p = __p;
      if ((a14 & 0x80u) == 0)
        v25 = a14;
      else
        v25 = a10;
      v26 = nsStringFromString((uint64_t)p_p, v25);
      *v15 = (id)objc_msgSend(v16, "_errorWithCoderErrorCode:codingErrorSymbol:message:", -1, 0, v26);

      if ((char)a14 < 0)
        operator delete(__p);
    }
    *v14 = 0;
    v14[1] = 0;
    __cxa_end_catch();
    JUMPOUT(0x220DE913CLL);
  }
  JUMPOUT(0x220DE9170);
}

void sub_220DE9514(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  void *v14;

  if (a14 < 0)
    operator delete(__p);
  __cxa_end_catch();
  JUMPOUT(0x220DE9170);
}

void UC::UCURLComponents::~UCURLComponents(void **this)
{
  if (*((char *)this + 199) < 0)
    operator delete(this[22]);
  if (*((char *)this + 175) < 0)
    operator delete(this[19]);
  if (*((char *)this + 143) < 0)
    operator delete(this[15]);
  if (*((char *)this + 119) < 0)
    operator delete(this[12]);
  if (*((char *)this + 95) < 0)
    operator delete(this[9]);
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

_QWORD *std::allocate_shared[abi:ne180100]<UC::SUE::UCSegmentedURLCoderProvider,std::allocator<UC::SUE::UCSegmentedURLCoderProvider>,std::string &,std::string &,std::string &,void>@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  _QWORD *v8;
  _QWORD *result;

  v8 = operator new(0xD0uLL);
  result = std::__shared_ptr_emplace<UC::SUE::UCSegmentedURLCoderProvider>::__shared_ptr_emplace[abi:ne180100]<std::string &,std::string &,std::string &,std::allocator<UC::SUE::UCSegmentedURLCoderProvider>,0>(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;
  return result;
}

void sub_220DE96AC(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<UC::SUE::UCSegmentedURLCoderProvider>::__shared_ptr_emplace[abi:ne180100]<std::string &,std::string &,std::string &,std::allocator<UC::SUE::UCSegmentedURLCoderProvider>,0>(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v6;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_24E6B28E0;
  std::allocator<UC::SUE::UCSegmentedURLCoderProvider>::construct[abi:ne180100]<UC::SUE::UCSegmentedURLCoderProvider,std::string &,std::string &,std::string &>((uint64_t)&v6, (uint64_t)(a1 + 3), a2, a3, a4);
  return a1;
}

void sub_220DE9710(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<UC::SUE::UCSegmentedURLCoderProvider>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24E6B28E0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<UC::SUE::UCSegmentedURLCoderProvider>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24E6B28E0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<UC::SUE::UCSegmentedURLCoderProvider>::__on_zero_shared(uint64_t a1)
{
  UC::SUE::UCSegmentedURLCoderProvider::~UCSegmentedURLCoderProvider((void **)(a1 + 24));
}

void std::allocator<UC::SUE::UCSegmentedURLCoderProvider>::construct[abi:ne180100]<UC::SUE::UCSegmentedURLCoderProvider,std::string &,std::string &,std::string &>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  std::string __p;
  std::string v9;
  std::string v10;

  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    v10 = *(std::string *)a3;
  if (*(char *)(a4 + 23) < 0)
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)a4, *(_QWORD *)(a4 + 8));
  else
    v9 = *(std::string *)a4;
  if (*(char *)(a5 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a5, *(_QWORD *)(a5 + 8));
  else
    __p = *(std::string *)a5;
  UC::SUE::UCSegmentedURLCoderProvider::UCSegmentedURLCoderProvider(a2, &v10, &v9, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v9.__r_.__value_.__l.__data_);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v10.__r_.__value_.__l.__data_);
}

void sub_220DE9850(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a21 < 0)
    operator delete(__p);
  if (a28 < 0)
    operator delete(a23);
  _Unwind_Resume(exception_object);
}

void UC::SUE::UCSegmentedURLCoderProvider::~UCSegmentedURLCoderProvider(void **this)
{
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)(this + 21));
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)(this + 19));
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)(this + 17));
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)(this + 15));
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)(this + 13));
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)(this + 11));
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)(this + 9));
  if (*((char *)this + 71) < 0)
    operator delete(this[6]);
  if (*((char *)this + 47) < 0)
    operator delete(this[3]);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

void std::default_delete<UC::SUE::SegmentedURLEncoderImpl>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  if (a2)
  {
    v3 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a2 + 16) = 0;
    if (v3)
      (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
    v4 = (void *)std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](a2);
    operator delete(v4);
  }
}

void std::unique_ptr<UC::SUE::PrefixedURLEncoderImpl>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](v2 + 16);
    v3 = (void *)std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](v2);
    operator delete(v3);
  }
}

void std::__shared_ptr_emplace<UC::SUE::UCSegmentedURLEncodingResult>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24E6B2918;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<UC::SUE::UCSegmentedURLEncodingResult>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24E6B2918;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<UC::SUE::UCSegmentedURLEncodingResult>::__on_zero_shared(uint64_t a1)
{
  char v1;

  std::allocator<UC::SUE::UCSegmentedURLEncodingResult>::destroy[abi:ne180100]((uint64_t)&v1, a1 + 24);
}

void std::allocator<UC::SUE::UCSegmentedURLEncodingResult>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  void **v4;

  v3 = (_QWORD *)(a2 + 40);
  v4 = *(void ***)(a2 + 40);
  *v3 = 0;
  if (v4)
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)v3, v4);
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
}

void UCURLComponentsFromNSURL(NSURL *a1@<X0>, std::string *a2@<X8>)
{
  NSURL *v3;
  id v4;
  NSString *v5;
  uint64_t v6;
  NSString *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  std::string::size_type v17;
  id v18;
  id v19;
  std::string v20;
  std::string v21;
  std::string v22;
  std::string v23;
  std::string v24;
  std::string v25;
  std::string v26;
  std::string v27;
  std::string v28;
  std::string v29;
  std::string v30;
  std::string v31;
  std::string v32;
  std::string v33;
  std::string v34;
  std::string v35;

  v3 = a1;
  v4 = (id)objc_msgSend(MEMORY[0x24BDD1808], "componentsWithURL:resolvingAgainstBaseURL:", v3, 0);
  memset(&v35, 0, sizeof(v35));
  v5 = -[NSURL absoluteString](v3, "absoluteString");
  v6 = -[NSString length](v5, "length");

  if (v6)
  {
    v7 = objc_retainAutorelease(-[NSURL absoluteString](v3, "absoluteString"));
    std::string::append(&v35, -[NSString UTF8String](v7, "UTF8String"));

  }
  memset(&v34, 0, sizeof(v34));
  v8 = (id)objc_msgSend(v4, "scheme");
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v10 = objc_retainAutorelease((id)objc_msgSend(v4, "scheme"));
    std::string::append(&v34, (const std::string::value_type *)objc_msgSend(v10, "UTF8String"));

  }
  memset(&v33, 0, sizeof(v33));
  v11 = (id)objc_msgSend(v4, "percentEncodedHost");
  if (objc_msgSend(v11, "length"))
    std::string::append(&v33, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
  memset(&v32, 0, sizeof(v32));
  v12 = (id)objc_msgSend(v4, "percentEncodedPath");
  if (objc_msgSend(v12, "length"))
    std::string::append(&v32, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
  memset(&v31, 0, sizeof(v31));
  v13 = (id)objc_msgSend(v4, "percentEncodedQuery");
  if (objc_msgSend(v13, "length"))
    std::string::append(&v31, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
  memset(&v30, 0, sizeof(v30));
  v14 = (id)objc_msgSend(v4, "percentEncodedFragment");
  if (objc_msgSend(v14, "length"))
    std::string::append(&v30, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
  v15 = (id)objc_msgSend(v4, "port");

  if (v15)
  {
    v16 = (id)objc_msgSend(v4, "port");
    v17 = objc_msgSend(v16, "unsignedLongLongValue");

  }
  else
  {
    v17 = 0;
  }
  memset(&v29, 0, sizeof(v29));
  v18 = (id)objc_msgSend(v4, "percentEncodedUser");
  if (objc_msgSend(v18, "length"))
    std::string::append(&v29, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"));
  memset(&v28, 0, sizeof(v28));
  v19 = (id)objc_msgSend(v4, "percentEncodedPassword");
  if (objc_msgSend(v19, "length"))
    std::string::append(&v28, (const std::string::value_type *)objc_msgSend(objc_retainAutorelease(v19), "UTF8String"));
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v27, v35.__r_.__value_.__l.__data_, v35.__r_.__value_.__l.__size_);
  else
    v27 = v35;
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v26, v34.__r_.__value_.__l.__data_, v34.__r_.__value_.__l.__size_);
  else
    v26 = v34;
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v25, v33.__r_.__value_.__l.__data_, v33.__r_.__value_.__l.__size_);
  else
    v25 = v33;
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v24, v32.__r_.__value_.__l.__data_, v32.__r_.__value_.__l.__size_);
  else
    v24 = v32;
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v23, v31.__r_.__value_.__l.__data_, v31.__r_.__value_.__l.__size_);
  else
    v23 = v31;
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v22, v30.__r_.__value_.__l.__data_, v30.__r_.__value_.__l.__size_);
  else
    v22 = v30;
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v21, v29.__r_.__value_.__l.__data_, v29.__r_.__value_.__l.__size_);
  else
    v21 = v29;
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v20, v28.__r_.__value_.__l.__data_, v28.__r_.__value_.__l.__size_);
  else
    v20 = v28;
  UC::UCURLComponents::UCURLComponents(a2, (__int128 *)&v27, (__int128 *)&v26, (__int128 *)&v25, (__int128 *)&v24, (__int128 *)&v23, (__int128 *)&v22, v17, (__int128 *)&v21, (__int128 *)&v20);
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v20.__r_.__value_.__l.__data_);
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v21.__r_.__value_.__l.__data_);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v22.__r_.__value_.__l.__data_);
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v23.__r_.__value_.__l.__data_);
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v24.__r_.__value_.__l.__data_);
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v25.__r_.__value_.__l.__data_);
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v26.__r_.__value_.__l.__data_);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v27.__r_.__value_.__l.__data_);

  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v28.__r_.__value_.__l.__data_);

  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v29.__r_.__value_.__l.__data_);

  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v30.__r_.__value_.__l.__data_);

  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v31.__r_.__value_.__l.__data_);

  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v32.__r_.__value_.__l.__data_);

  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v33.__r_.__value_.__l.__data_);
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v34.__r_.__value_.__l.__data_);
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v35.__r_.__value_.__l.__data_);

}

void sub_220DE9FE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,uint64_t a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50,uint64_t a51,void *a52,uint64_t a53,int a54,__int16 a55,char a56,char a57,uint64_t a58,void *a59,uint64_t a60,int a61,__int16 a62,char a63)
{
  char a64;
  void *a66;
  char a71;
  void *a72;
  char a73;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;

  if (a22 < 0)
    operator delete(__p);
  if (a29 < 0)
    operator delete(a24);
  if (a36 < 0)
    operator delete(a31);
  if (a43 < 0)
    operator delete(a38);
  if (a50 < 0)
    operator delete(a45);
  if (a57 < 0)
    operator delete(a52);
  if (a64 < 0)
    operator delete(a59);

  if (a71 < 0)
    operator delete(a66);

  if (a73 < 0)
    operator delete(a72);

  if (*(char *)(v80 - 217) < 0)
    operator delete(*(void **)(v80 - 240));

  if (*(char *)(v80 - 193) < 0)
    operator delete(*(void **)(v80 - 216));

  if (*(char *)(v80 - 169) < 0)
    operator delete(*(void **)(v80 - 192));

  if (*(char *)(v80 - 145) < 0)
    operator delete(*(void **)(v80 - 168));
  if (*(char *)(v80 - 121) < 0)
    operator delete(*(void **)(v80 - 144));
  if (*(char *)(v80 - 97) < 0)
    operator delete(*(void **)(v80 - 120));

  _Unwind_Resume(a1);
}

std::string *UC::UCMultiContextHuffmanSymbolFrequencyReader::UCMultiContextHuffmanSymbolFrequencyReader(std::string *a1, std::string::size_type a2, std::string::size_type *a3, __int128 *a4)
{
  std::string::size_type v5;
  unint64_t *v6;
  unint64_t v7;
  std::string *v8;
  __int128 v9;

  a1->__r_.__value_.__r.__words[0] = a2;
  v5 = a3[1];
  a1->__r_.__value_.__l.__size_ = *a3;
  a1->__r_.__value_.__r.__words[2] = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  v8 = a1 + 1;
  if (*((char *)a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v8, *(const std::string::value_type **)a4, *((_QWORD *)a4 + 1));
  }
  else
  {
    v9 = *a4;
    a1[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a4 + 2);
    *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v9;
  }
  a1[2].__r_.__value_.__r.__words[0] = 0;
  a1[2].__r_.__value_.__l.__size_ = 0;
  return a1;
}

void sub_220DEA294(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t UC::UCMultiContextHuffmanSymbolFrequencyReader::readData(std::string *this)
{
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  void *v6;
  void *__p;
  __int128 v9[8];
  size_t v10;
  std::fstream v11;
  _QWORD v12[20];

  v12[19] = *MEMORY[0x24BDAC8D0];
  std::fstream::basic_fstream(&v11, this + 1, 0xEu);
  if (*(&v11.__sb_.__st_._mbstateL + 9))
  {
    std::istream::tellg();
    std::istream::seekg();
    v2 = operator new[](v10);
    bzero(v2, v10);
    __p = v2;
    std::istream::read();
    if (!std::filebuf::close())
      std::ios_base::clear((std::ios_base *)((char *)&v11 + *((_QWORD *)v11.__sb_.__extbuf_ - 3)), *(_DWORD *)&v11.__sb_.__extbuf_min_[*((_QWORD *)v11.__sb_.__extbuf_ - 3) + 8] | 4);
    std::allocate_shared[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie,std::allocator<UC::UCMultiContextSymbolFrequencyTrie>,std::shared_ptr<std::vector<std::string>> &,std::unique_ptr<unsigned char []>,unsigned long const&,void>((uint64_t *)&this->__r_.__value_.__l.__size_, &__p, this, v9);
    std::shared_ptr<UC::UCHuffmanCoder>::operator=[abi:ne180100]((uint64_t)&this[2], v9);
    v3 = (std::__shared_weak_count *)*((_QWORD *)&v9[0] + 1);
    if (*((_QWORD *)&v9[0] + 1))
    {
      v4 = (unint64_t *)(*((_QWORD *)&v9[0] + 1) + 8);
      do
        v5 = __ldaxr(v4);
      while (__stlxr(v5 - 1, v4));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
    v6 = __p;
    __p = 0;
    if (v6)
      operator delete[](v6);
  }
  MEMORY[0x227666390](v11.__sb_.__extbuf_min_);
  std::iostream::~basic_iostream();
  return MEMORY[0x2276664A4](v12);
}

void sub_220DEA450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void (__cdecl **a29)(std::fstream *__hidden this))
{
  if (__p)
    operator delete[](__p);
  std::fstream::~fstream(&a29);
  _Unwind_Resume(a1);
}

std::fstream *__cdecl std::fstream::basic_fstream(std::fstream *this, const std::string *__s, std::ios_base::openmode __mode)
{
  char *extbuf_min;

  extbuf_min = this->__sb_.__extbuf_min_;
  *(&this[1].__sb_.__st_._mbstateL + 2) = (uint64_t)&unk_24E6B2AC0;
  this->__sb_.__extbuf_ = (char *)&unk_24E6B2A98;
  this->__sb_.__extbufnext_ = 0;
  std::ios_base::init((std::ios_base *)(&this[1].__sb_.__st_._mbstateL + 2), this->__sb_.__extbuf_min_);
  *(&this[1].__sb_.__st_last_._mbstateL + 3) = 0;
  *((_DWORD *)&this[1].__sb_.__st_last_._mbstateL + 8) = -1;
  MEMORY[0x227666384](extbuf_min);
  if (!std::filebuf::open())
    std::ios_base::clear((std::ios_base *)((char *)this + *((_QWORD *)this->__sb_.__extbuf_ - 3)), *(_DWORD *)&this->__sb_.__extbuf_min_[*((_QWORD *)this->__sb_.__extbuf_ - 3) + 8] | 4);
  return this;
}

void sub_220DEA578(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x2276664A4](v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::fstream::~fstream(void (__cdecl ***a1)(std::fstream *__hidden this)))(std::fstream *__hidden this)
{
  _QWORD *v2;

  v2 = a1 + 54;
  MEMORY[0x227666390](a1 + 3);
  std::iostream::~basic_iostream();
  MEMORY[0x2276664A4](v2);
  return a1;
}

uint64_t UC::UCMultiContextHuffmanSymbolFrequencyReader::getContextSymbolFrequency@<X0>(uint64_t this@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;

  v2 = *(_QWORD *)(this + 56);
  *a2 = *(_QWORD *)(this + 48);
  a2[1] = v2;
  if (v2)
  {
    v3 = (unint64_t *)(v2 + 8);
    do
      v4 = __ldxr(v3);
    while (__stxr(v4 + 1, v3));
  }
  return this;
}

void `non-virtual thunk to'std::fstream::~fstream(void (__cdecl ***a1)(std::fstream *__hidden this))
{
  MEMORY[0x227666390](a1 + 1);
  std::iostream::~basic_iostream();
  JUMPOUT(0x2276664A4);
}

{
  _QWORD *v1;
  void (__cdecl ***v2)(std::fstream *__hidden);

  v1 = a1 + 52;
  v2 = a1 - 2;
  MEMORY[0x227666390](a1 + 1);
  std::iostream::~basic_iostream();
  MEMORY[0x2276664A4](v1);
  operator delete(v2);
}

void `virtual thunk to'std::fstream::~fstream(_QWORD *a1)
{
  void (__cdecl ***v1)(std::fstream *__hidden);

  v1 = (void (__cdecl ***)(std::fstream *__hidden))((char *)a1 + *(_QWORD *)(*a1 - 24));
  MEMORY[0x227666390](v1 + 3);
  std::iostream::~basic_iostream();
  JUMPOUT(0x2276664A4);
}

{
  void (__cdecl ***v1)(std::fstream *__hidden);

  v1 = (void (__cdecl ***)(std::fstream *__hidden))((char *)a1 + *(_QWORD *)(*a1 - 24));
  MEMORY[0x227666390](v1 + 3);
  std::iostream::~basic_iostream();
  MEMORY[0x2276664A4](v1 + 54);
  operator delete(v1);
}

void std::fstream::~fstream(void (__cdecl ***a1)(std::fstream *__hidden this))
{
  _QWORD *v2;

  v2 = a1 + 54;
  MEMORY[0x227666390](a1 + 3);
  std::iostream::~basic_iostream();
  MEMORY[0x2276664A4](v2);
  operator delete(a1);
}

_QWORD *std::allocate_shared[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie,std::allocator<UC::UCMultiContextSymbolFrequencyTrie>,std::shared_ptr<std::vector<std::string>> &,std::unique_ptr<unsigned char []>,unsigned long const&,void>@<X0>(uint64_t *a1@<X1>, void **a2@<X2>, _QWORD *a3@<X3>, _QWORD *a4@<X8>)
{
  _QWORD *v8;
  _QWORD *result;

  v8 = operator new(0x58uLL);
  result = std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<std::vector<std::string>> &,std::unique_ptr<unsigned char []>,unsigned long const&,std::allocator<UC::UCMultiContextSymbolFrequencyTrie>,0>(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;
  return result;
}

void sub_220DEA8A0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<std::vector<std::string>> &,std::unique_ptr<unsigned char []>,unsigned long const&,std::allocator<UC::UCMultiContextSymbolFrequencyTrie>,0>(_QWORD *a1, uint64_t *a2, void **a3, _QWORD *a4)
{
  char v6;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_24E6B2B30;
  std::allocator<UC::UCMultiContextSymbolFrequencyTrie>::construct[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie,std::shared_ptr<std::vector<std::string>> &,std::unique_ptr<unsigned char []>,unsigned long const&>((uint64_t)&v6, (uint64_t)(a1 + 3), a2, a3, a4);
  return a1;
}

void sub_220DEA904(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_24E6B2B30;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)off_24E6B2B30;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie>::__on_zero_shared(uint64_t a1)
{
  char v2;

  return std::allocator<UC::UCMultiContextSymbolFrequencyTrie>::destroy[abi:ne180100]((uint64_t)&v2, a1 + 24);
}

void std::allocator<UC::UCMultiContextSymbolFrequencyTrie>::construct[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie,std::shared_ptr<std::vector<std::string>> &,std::unique_ptr<unsigned char []>,unsigned long const&>(uint64_t a1, uint64_t a2, uint64_t *a3, void **a4, _QWORD *a5)
{
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  void *v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  void *__p;
  uint64_t v14;
  std::__shared_weak_count *v15;

  v5 = (std::__shared_weak_count *)a3[1];
  v14 = *a3;
  v15 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v8 = *a4;
  *a4 = 0;
  __p = v8;
  UC::UCMultiContextSymbolFrequencyTrie::UCMultiContextSymbolFrequencyTrie(a2, &v14, &__p, *a5);
  v9 = __p;
  __p = 0;
  if (v9)
    operator delete[](v9);
  v10 = v15;
  if (v15)
  {
    v11 = (unint64_t *)&v15->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
}

void sub_220DEAA18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, char a11)
{
  if (__p)
    operator delete[](__p);
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a11);
  _Unwind_Resume(a1);
}

uint64_t std::allocator<UC::UCMultiContextSymbolFrequencyTrie>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v3;

  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](a2 + 48);
  std::unique_ptr<std::unordered_map<std::string,unsigned char>>::reset[abi:ne180100]((uint64_t *)(a2 + 32), 0);
  v3 = *(void **)(a2 + 24);
  *(_QWORD *)(a2 + 24) = 0;
  if (v3)
    operator delete[](v3);
  return std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](a2);
}

double UC::UCMultiContextHuffmanCoder::UCMultiContextHuffmanCoder(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  double result;

  *(_QWORD *)a1 = off_24E6B2B68;
  *(_QWORD *)(a1 + 8) = a3;
  v3 = a2[1];
  *(_QWORD *)(a1 + 16) = *a2;
  *(_QWORD *)(a1 + 24) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_DWORD *)(a1 + 64) = 1065353216;
  *(_QWORD *)(a1 + 72) = 0;
  return result;
}

uint64_t UC::UCMultiContextHuffmanCoder::encode(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *__p[2];
  char v7;

  std::string::basic_string[abi:ne180100]<0>(__p, "");
  v4 = UC::UCMultiContextHuffmanCoder::_huffmanCoderForContext(a1, (std::string::size_type)__p);
  if (v7 < 0)
    operator delete(__p[0]);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v4 + 32))(v4, a2);
}

void sub_220DEAB40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t UC::UCMultiContextHuffmanCoder::_huffmanCoderForContext(uint64_t a1, std::string::size_type a2)
{
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t result;
  uint64_t RootNode;
  uint64_t v8;
  int v9;
  unsigned __int8 *v10;
  std::string::value_type *v11;
  uint64_t v12;
  std::string::value_type *v13;
  void *v14;
  std::__shared_weak_count *size;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 *v26;
  uint64_t v27;
  unsigned __int8 *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  std::string v33;
  std::string v34;
  uint64_t v35;

  v4 = *(unsigned __int8 *)(a2 + 23);
  if ((v4 & 0x80u) != 0)
    v4 = *(_QWORD *)(a2 + 8);
  if (v4)
  {
    v5 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::find<std::string>((_QWORD *)(a1 + 32), (unsigned __int8 *)a2);
    if (v5)
      return *((_QWORD *)v5 + 5);
  }
  else
  {
    result = *(_QWORD *)(a1 + 72);
    if (result)
      return result;
  }
  RootNode = UC::UCMultiContextSymbolFrequencyTrie::getRootNode(*(UC::UCMultiContextSymbolFrequencyTrie **)(a1 + 16));
  v35 = RootNode;
  v8 = *(unsigned __int8 *)(a2 + 23);
  v9 = (char)v8;
  if ((v8 & 0x80u) != 0)
    v8 = *(_QWORD *)(a2 + 8);
  if (v8)
  {
    v10 = (unsigned __int8 *)RootNode;
    if (v9 >= 0)
      v11 = (std::string::value_type *)a2;
    else
      v11 = *(std::string::value_type **)a2;
    do
    {
      memset(&v34, 0, sizeof(v34));
      std::string::push_back(&v34, *v11);
      if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v33, v34.__r_.__value_.__l.__data_, v34.__r_.__value_.__l.__size_);
      else
        v33 = v34;
      v10 = (unsigned __int8 *)UC::UCMultiContextSymbolFrequencyTrie::Node::childNodeForSymbol(v10, (unsigned __int8 *)&v33);
      v35 = (uint64_t)v10;
      if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v33.__r_.__value_.__l.__data_);
      if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v34.__r_.__value_.__l.__data_);
      ++v11;
      v12 = *(unsigned __int8 *)(a2 + 23);
      if ((v12 & 0x80u) == 0)
        v13 = (std::string::value_type *)a2;
      else
        v13 = *(std::string::value_type **)a2;
      if ((v12 & 0x80u) != 0)
        v12 = *(_QWORD *)(a2 + 8);
    }
    while (v11 != &v13[v12]);
  }
  UC::UCMultiContextSymbolFrequencyTrie::getOrderedSymbols(*(_QWORD **)(a1 + 16), &v31);
  std::allocate_shared[abi:ne180100]<UC::UCSymbolFrequencyTable,std::allocator<UC::UCSymbolFrequencyTable>,UC::UCMultiContextSymbolFrequencyTrie::Node *&,std::shared_ptr<std::vector<std::string>>,void>(&v35, &v31, &v32);
  v14 = operator new(0x18uLL);
  *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v32;
  v32 = 0uLL;
  UC::UCHuffmanCoder::UCHuffmanCoder(v14, &v34);
  size = (std::__shared_weak_count *)v34.__r_.__value_.__l.__size_;
  if (v34.__r_.__value_.__l.__size_)
  {
    v16 = (unint64_t *)(v34.__r_.__value_.__l.__size_ + 8);
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
    }
  }
  v18 = (std::__shared_weak_count *)*((_QWORD *)&v32 + 1);
  if (*((_QWORD *)&v32 + 1))
  {
    v19 = (unint64_t *)(*((_QWORD *)&v32 + 1) + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v21 = (std::__shared_weak_count *)*((_QWORD *)&v31 + 1);
  if (*((_QWORD *)&v31 + 1))
  {
    v22 = (unint64_t *)(*((_QWORD *)&v31 + 1) + 8);
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  v24 = *(unsigned __int8 *)(a2 + 23);
  if ((v24 & 0x80u) != 0)
    v24 = *(_QWORD *)(a2 + 8);
  if (v24)
  {
    v25 = a1 + 32;
    v34.__r_.__value_.__r.__words[0] = a2;
    v26 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v25, (unsigned __int8 *)a2, (uint64_t)&std::piecewise_construct, (__int128 **)&v34);
    v27 = *((_QWORD *)v26 + 5);
    *((_QWORD *)v26 + 5) = v14;
    if (v27)
      (*(void (**)(uint64_t))(*(_QWORD *)v27 + 8))(v27);
    v34.__r_.__value_.__r.__words[0] = a2;
    v28 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v25, (unsigned __int8 *)a2, (uint64_t)&std::piecewise_construct, (__int128 **)&v34)+ 40;
  }
  else
  {
    v30 = *(_QWORD *)(a1 + 72);
    v28 = (unsigned __int8 *)(a1 + 72);
    v29 = v30;
    *(_QWORD *)v28 = v14;
    if (v30)
      (*(void (**)(uint64_t))(*(_QWORD *)v29 + 8))(v29);
  }
  return *(_QWORD *)v28;
}

void sub_220DEAE10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  uint64_t v25;

  (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
  _Unwind_Resume(a1);
}

void UC::UCMultiContextHuffmanCoder::encode(uint64_t a1, uint64_t a2)
{
  void *__p[2];
  char v5;

  std::string::basic_string[abi:ne180100]<0>(__p, "");
  (*(void (**)(uint64_t, uint64_t, void **))(*(_QWORD *)a1 + 56))(a1, a2, __p);
  if (v5 < 0)
    operator delete(__p[0]);
}

void sub_220DEAF04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void UC::UCMultiContextHuffmanCoder::encodeWithStartContext(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  unint64_t v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  const std::string::value_type *v15;
  std::string::size_type v16;
  uint64_t v17;
  void **v18;
  std::string::size_type v19;
  void *__p[2];
  unsigned __int8 v21;
  std::string v22;

  a4->__r_.__value_.__r.__words[0] = 0;
  a4->__r_.__value_.__l.__size_ = 0;
  a4->__r_.__value_.__r.__words[2] = 0;
  if ((int)(-1431655765 * ((uint64_t)(a2[1] - *a2) >> 3)) >= 1)
  {
    v8 = 0;
    v9 = -1431655765 * ((uint64_t)(a2[1] - *a2) >> 3);
    do
    {
      if (*(_QWORD *)(a1 + 8) <= v8)
      {
        std::string::basic_string[abi:ne180100]<0>(&v22, "");
      }
      else if (*(char *)(a3 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v22, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
      }
      else
      {
        v22 = *(std::string *)a3;
      }
      v10 = *(_DWORD *)(a1 + 8);
      v11 = ((_DWORD)v8 - v10) & ~(((int)v8 - v10) >> 31);
      if (v8 > v11)
      {
        v12 = 24 * (((_DWORD)v8 - v10) & ~(((int)v8 - v10) >> 31));
        do
        {
          v13 = *a2 + v12;
          v14 = *(char *)(v13 + 23);
          if (v14 >= 0)
            v15 = (const std::string::value_type *)(*a2 + v12);
          else
            v15 = *(const std::string::value_type **)v13;
          if (v14 >= 0)
            v16 = *(unsigned __int8 *)(v13 + 23);
          else
            v16 = *(_QWORD *)(v13 + 8);
          std::string::append(&v22, v15, v16);
          ++v11;
          v12 += 24;
        }
        while (v11 < v8);
      }
      v17 = UC::UCMultiContextHuffmanCoder::_huffmanCoderForContext(a1, (std::string::size_type)&v22);
      (*(void (**)(void **__return_ptr, uint64_t, unint64_t))(*(_QWORD *)v17 + 32))(__p, v17, *a2 + 24 * v8);
      if ((v21 & 0x80u) == 0)
        v18 = __p;
      else
        v18 = (void **)__p[0];
      if ((v21 & 0x80u) == 0)
        v19 = v21;
      else
        v19 = (std::string::size_type)__p[1];
      std::string::append(a4, (const std::string::value_type *)v18, v19);
      if ((char)v21 < 0)
        operator delete(__p[0]);
      if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v22.__r_.__value_.__l.__data_);
      ++v8;
    }
    while (v8 != v9);
  }
}

void sub_220DEB0B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v21;

  if (*(char *)(v21 + 23) < 0)
    operator delete(*(void **)v21);
  _Unwind_Resume(exception_object);
}

void UC::UCMultiContextHuffmanCoder::decode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  std::string __p;
  void *v7[2];
  char v8;

  std::string::basic_string[abi:ne180100]<0>(v7, "");
  if (*(char *)(a3 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  else
    __p = *(std::string *)a3;
  (*(void (**)(uint64_t, uint64_t, void **, std::string *))(*(_QWORD *)a1 + 64))(a1, a2, v7, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v8 < 0)
    operator delete(v7[0]);
}

void sub_220DEB1BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void UC::UCMultiContextHuffmanCoder::decodeWithStartContext(UC::UCBitStream *this@<X1>, uint64_t a2@<X0>, uint64_t a3@<X2>, unsigned __int8 *a4@<X3>, std::string *a5@<X8>)
{
  signed int v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  int v14;
  const std::string::value_type *v15;
  std::string::size_type v16;
  uint64_t v17;
  uint64_t v18;
  std::string::size_type v19;
  size_t v20;
  uint64_t v21;
  int v22;
  unsigned __int8 *v23;
  size_t *v24;
  char v25;
  std::string *v26;
  __int128 v27;
  const std::string::value_type *v28;
  uint64_t v29;
  uint64_t v30;
  std::string *i;
  __int128 v32;
  std::string *v33;
  std::string::size_type size;
  size_t __n[2];
  int64_t v36;
  std::string v37;
  uint64_t v38;
  std::string *v39;
  unint64_t v40;

  v10 = 0;
  v38 = 0;
  v39 = 0;
  v40 = 0;
  while (UC::UCBitStream::hasMore(this))
  {
    if (*(_QWORD *)(a2 + 8) <= (unint64_t)v10)
    {
      std::string::basic_string[abi:ne180100]<0>(&v37, "");
    }
    else if (*(char *)(a3 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v37, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
    }
    else
    {
      v37 = *(std::string *)a3;
    }
    v11 = (v10 - *(_DWORD *)(a2 + 8)) & ~((v10 - *(_DWORD *)(a2 + 8)) >> 31);
    if (v11 < v10)
    {
      v12 = v10 - (unint64_t)v11;
      v13 = 24 * v11;
      do
      {
        v14 = *(char *)(v38 + v13 + 23);
        if (v14 >= 0)
          v15 = (const std::string::value_type *)(v38 + v13);
        else
          v15 = *(const std::string::value_type **)(v38 + v13);
        if (v14 >= 0)
          v16 = *(unsigned __int8 *)(v38 + v13 + 23);
        else
          v16 = *(_QWORD *)(v38 + v13 + 8);
        std::string::append(&v37, v15, v16);
        v13 += 24;
        --v12;
      }
      while (v12);
    }
    v17 = UC::UCMultiContextHuffmanCoder::_huffmanCoderForContext(a2, (std::string::size_type)&v37);
    (*(void (**)(size_t *__return_ptr, uint64_t, UC::UCBitStream *))(*(_QWORD *)v17 + 56))(__n, v17, this);
    v18 = HIBYTE(v36);
    v19 = __n[1];
    if (v36 >= 0)
      v20 = HIBYTE(v36);
    else
      v20 = __n[1];
    v21 = a4[23];
    v22 = (char)v21;
    if ((v21 & 0x80u) != 0)
      v21 = *((_QWORD *)a4 + 1);
    if (v20 == v21)
    {
      if (v22 >= 0)
        v23 = a4;
      else
        v23 = *(unsigned __int8 **)a4;
      if (SHIBYTE(v36) < 0)
      {
        v28 = (const std::string::value_type *)__n[0];
        if (!memcmp((const void *)__n[0], v23, __n[1]))
        {
          v25 = 0;
LABEL_46:
          operator delete((void *)__n[0]);
          goto LABEL_47;
        }
        v26 = v39;
        if ((unint64_t)v39 >= v40)
        {
LABEL_38:
          v29 = std::vector<std::string>::__push_back_slow_path<std::string const&>(&v38, (__int128 *)__n);
          goto LABEL_43;
        }
        goto LABEL_41;
      }
      if (!HIBYTE(v36))
      {
        v25 = 0;
        goto LABEL_47;
      }
      v24 = __n;
      while (*(unsigned __int8 *)v24 == *v23)
      {
        v24 = (size_t *)((char *)v24 + 1);
        ++v23;
        if (!--v18)
        {
          v25 = 0;
          if ((v36 & 0x8000000000000000) == 0)
            goto LABEL_47;
          goto LABEL_46;
        }
      }
    }
    v26 = v39;
    if ((unint64_t)v39 >= v40)
      goto LABEL_38;
    if (SHIBYTE(v36) < 0)
    {
      v28 = (const std::string::value_type *)__n[0];
LABEL_41:
      std::string::__init_copy_ctor_external(v26, v28, v19);
      goto LABEL_42;
    }
    v27 = *(_OWORD *)__n;
    v39->__r_.__value_.__r.__words[2] = v36;
    *(_OWORD *)&v26->__r_.__value_.__l.__data_ = v27;
LABEL_42:
    v29 = (uint64_t)&v26[1];
LABEL_43:
    v39 = (std::string *)v29;
    ++v10;
    v25 = 1;
    if (v36 < 0)
      goto LABEL_46;
LABEL_47:
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v37.__r_.__value_.__l.__data_);
      if ((v25 & 1) == 0)
        break;
    }
    else if ((v25 & 1) == 0)
    {
      break;
    }
  }
  a5->__r_.__value_.__r.__words[0] = 0;
  a5->__r_.__value_.__l.__size_ = 0;
  a5->__r_.__value_.__r.__words[2] = 0;
  v30 = v38;
  for (i = v39; (std::string *)v30 != i; v30 += 24)
  {
    if (*(char *)(v30 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v37, *(const std::string::value_type **)v30, *(_QWORD *)(v30 + 8));
    }
    else
    {
      v32 = *(_OWORD *)v30;
      v37.__r_.__value_.__r.__words[2] = *(_QWORD *)(v30 + 16);
      *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v32;
    }
    if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v33 = &v37;
    else
      v33 = (std::string *)v37.__r_.__value_.__r.__words[0];
    if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v37.__r_.__value_.__r.__words[2]);
    else
      size = v37.__r_.__value_.__l.__size_;
    std::string::append(a5, (const std::string::value_type *)v33, size);
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v37.__r_.__value_.__l.__data_);
  }
  v37.__r_.__value_.__r.__words[0] = (std::string::size_type)&v38;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
}

void sub_220DEB4D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23)
{
  if (a15 < 0)
    operator delete(__p);
  if (a21 < 0)
    operator delete(a16);
  a16 = &a22;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a16);
  _Unwind_Resume(a1);
}

uint64_t UC::UCMultiContextHuffmanCoder::canEncode(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *__p[2];
  char v7;

  std::string::basic_string[abi:ne180100]<0>(__p, "");
  v4 = UC::UCMultiContextHuffmanCoder::_huffmanCoderForContext(a1, (std::string::size_type)__p);
  if (v7 < 0)
    operator delete(__p[0]);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v4 + 16))(v4, a2);
}

{
  uint64_t v4;
  void *__p[2];
  char v7;

  std::string::basic_string[abi:ne180100]<0>(__p, "");
  v4 = UC::UCMultiContextHuffmanCoder::_huffmanCoderForContext(a1, (std::string::size_type)__p);
  if (v7 < 0)
    operator delete(__p[0]);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v4 + 24))(v4, a2);
}

void sub_220DEB5D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_220DEB65C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void UC::UCMultiContextHuffmanCoder::clearCaches(UC::UCMultiContextHuffmanCoder *this)
{
  uint64_t v2;

  std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::clear((uint64_t)this + 32);
  v2 = *((_QWORD *)this + 9);
  *((_QWORD *)this + 9) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  UC::UCMultiContextSymbolFrequencyTrie::clearCaches(*((UC::UCMultiContextSymbolFrequencyTrie **)this + 2));
}

void UC::UCMultiContextHuffmanCoder::~UCMultiContextHuffmanCoder(UC::UCMultiContextHuffmanCoder *this)
{
  uint64_t v2;

  *(_QWORD *)this = off_24E6B2B68;
  v2 = *((_QWORD *)this + 9);
  *((_QWORD *)this + 9) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::~__hash_table((uint64_t)this + 32);
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)this + 16);
}

{
  uint64_t v2;

  *(_QWORD *)this = off_24E6B2B68;
  v2 = *((_QWORD *)this + 9);
  *((_QWORD *)this + 9) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::~__hash_table((uint64_t)this + 32);
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)this + 16);
  operator delete(this);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<UC::UCHuffmanCoder>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<UC::UCHuffmanCoder>>,0>(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

_QWORD *std::allocate_shared[abi:ne180100]<UC::UCSymbolFrequencyTable,std::allocator<UC::UCSymbolFrequencyTable>,UC::UCMultiContextSymbolFrequencyTrie::Node *&,std::shared_ptr<std::vector<std::string>>,void>@<X0>(uint64_t *a1@<X1>, __int128 *a2@<X2>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  _QWORD *result;

  v6 = operator new(0x40uLL);
  result = std::__shared_ptr_emplace<UC::UCSymbolFrequencyTable>::__shared_ptr_emplace[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie::Node *&,std::shared_ptr<std::vector<std::string>>,std::allocator<UC::UCSymbolFrequencyTable>,0>(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_220DEB86C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__shared_ptr_emplace<UC::UCSymbolFrequencyTable>::__shared_ptr_emplace[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie::Node *&,std::shared_ptr<std::vector<std::string>>,std::allocator<UC::UCSymbolFrequencyTable>,0>(_QWORD *a1, uint64_t *a2, __int128 *a3)
{
  char v5;

  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_24E6B27C8;
  std::allocator<UC::UCSymbolFrequencyTable>::construct[abi:ne180100]<UC::UCSymbolFrequencyTable,UC::UCMultiContextSymbolFrequencyTrie::Node *&,std::shared_ptr<std::vector<std::string>>>((uint64_t)&v5, a1 + 3, a2, a3);
  return a1;
}

void sub_220DEB8CC(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::allocator<UC::UCSymbolFrequencyTable>::construct[abi:ne180100]<UC::UCSymbolFrequencyTable,UC::UCMultiContextSymbolFrequencyTrie::Node *&,std::shared_ptr<std::vector<std::string>>>(uint64_t a1, _QWORD *a2, uint64_t *a3, __int128 *a4)
{
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  __int128 v9;

  v5 = *a3;
  v9 = *a4;
  *(_QWORD *)a4 = 0;
  *((_QWORD *)a4 + 1) = 0;
  UC::UCSymbolFrequencyTable::UCSymbolFrequencyTable(a2, v5, &v9);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&v9 + 1);
  if (*((_QWORD *)&v9 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v9 + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
}

void sub_220DEB954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v26[3];

  v8 = (_QWORD *)(a1 + 24);
  v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    v19 = 1;
    if (v11 >= 3)
      v19 = (v11 & (v11 - 1)) != 0;
    v20 = v19 | (2 * v11);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(a1, v22);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    *(_QWORD *)v26[0] = *v23;
    *v23 = v26[0];
  }
  else
  {
    *(_QWORD *)v26[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v26[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v26[0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11)
          v24 %= v11;
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  v26[0] = 0;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,void *>>>>::reset[abi:ne180100]((uint64_t)v26, 0);
  return i;
}

void sub_220DEBBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  std::string *v9;
  __int128 *v10;
  __int128 v11;

  v7 = a1 + 16;
  v8 = operator new(0x30uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *v8 = 0;
  v8[1] = a2;
  v9 = (std::string *)(v8 + 2);
  v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((_QWORD *)v10 + 1));
  }
  else
  {
    v11 = *v10;
    v8[4] = *((_QWORD *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  v8[5] = 0;
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_220DEBC84(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<UC::UCHuffmanCoder>>,0>((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

_QWORD *UC::UCSymbolFrequencyTable::UCSymbolFrequencyTable(_QWORD *result, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  v3 = a3[1];
  *result = *a3;
  result[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  v6 = a2[1];
  result[2] = *a2;
  result[3] = v6;
  if (v6)
  {
    v7 = (unint64_t *)(v6 + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  return result;
}

_QWORD *UC::UCSymbolFrequencyTable::UCSymbolFrequencyTable(_QWORD *result, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  v3 = a3[1];
  *result = *a3;
  result[1] = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result[2] = 0;
  result[3] = 0;
  result[4] = a2;
  return result;
}

uint64_t UC::UCSymbolFrequencyTable::getFrequencyForSymbol(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  unsigned __int8 *v4;
  uint64_t FrequencyForSymbol;
  _DWORD *v6;
  std::string __p;

  v3 = *(_QWORD **)(a1 + 16);
  if (v3)
  {
    v4 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::find<std::string>(v3, (unsigned __int8 *)a2);
    if (!v4)
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    return *((unsigned __int16 *)v4 + 20);
  }
  else
  {
    v6 = *(_DWORD **)(a1 + 32);
    if (*(char *)(a2 + 23) < 0)
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
    else
      __p = *(std::string *)a2;
    FrequencyForSymbol = UC::UCMultiContextSymbolFrequencyTrie::Node::getFrequencyForSymbol(v6, (unsigned __int8 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  return FrequencyForSymbol;
}

void sub_220DEBE40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::string *UC::SUE::UCSegmentedURLEncodingResult::HostResult::HostResult(std::string *this, __int128 *a2, std::string::value_type a3, int a4)
{
  __int128 v7;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v7 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v7;
  }
  this[1].__r_.__value_.__s.__data_[0] = a3;
  HIDWORD(this[1].__r_.__value_.__r.__words[0]) = a4;
  return this;
}

uint64_t UC::SUE::UCSegmentedURLEncodingResult::HostResult::getFormatType(UC::SUE::UCSegmentedURLEncodingResult::HostResult *this)
{
  return *((unsigned int *)this + 7);
}

uint64_t UC::SUE::UCSegmentedURLEncodingResult::getHostEncodingResult(UC::SUE::UCSegmentedURLEncodingResult *this)
{
  return *((_QWORD *)this + 5);
}

void UC::SUE::UCSegmentedURLEncodingResult::setHostEncodingResult(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v3;
  void **v4;
  void **v5;

  v2 = *a2;
  *a2 = 0;
  v5 = *(void ***)(a1 + 40);
  v3 = (_QWORD *)(a1 + 40);
  v4 = v5;
  *v3 = v2;
  if (v5)
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)v3, v4);
}

uint64_t UC::SUE::UCSegmentedURLEncodingResult::setTemplateType(uint64_t result, int a2)
{
  *(_DWORD *)(result + 24) = a2;
  return result;
}

uint64_t UC::SUE::UCSegmentedURLEncodingResult::getTemplateType(UC::SUE::UCSegmentedURLEncodingResult *this)
{
  return *((unsigned int *)this + 6);
}

uint64_t UC::SUE::UCSegmentedURLEncodingResult::setSpecialSubdomainType(uint64_t result, int a2)
{
  *(_DWORD *)(result + 28) = a2;
  return result;
}

uint64_t UC::SUE::UCSegmentedURLEncodingResult::setNonTemplatePathAndQueryEncodeType(uint64_t result, int a2)
{
  *(_DWORD *)(result + 32) = a2;
  return result;
}

uint64_t UC::SUE::UCSegmentedURLEncodingResult::getNonTemplatePathAndQueryEncodeType(UC::SUE::UCSegmentedURLEncodingResult *this)
{
  return *((unsigned int *)this + 8);
}

uint64_t UC::SUE::UCSegmentedURLEncodingResult::setHasPathOrQuery(uint64_t this, char a2)
{
  *(_BYTE *)(this + 48) = a2;
  return this;
}

uint64_t UC::SUE::UCSegmentedURLEncodingResult::getHasPathOrQuery(UC::SUE::UCSegmentedURLEncodingResult *this)
{
  return *((unsigned __int8 *)this + 48);
}

void sub_220DEC004(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220DEC0CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220DEC188(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220DEC284(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_220DEC5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void **a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  void *v30;
  _QWORD *v31;
  void *v32;
  void *v33;
  void **v36;
  void **v37;

  if (a30 < 0)
    operator delete(__p);
  v36 = a12;
  a12 = 0;
  if (v36)
    std::default_delete<UC::UCBitVector>::operator()[abi:ne180100]((int)&a12, v36);
  v37 = a18;
  a18 = 0;
  if (v37)
    std::default_delete<UC::UCBitVector>::operator()[abi:ne180100]((int)&a18, v37);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    if (v31)
      *v31 = (id)objc_msgSend(v32, "_errorWithCoderErrorCode:message:", 1002, CFSTR("Decoding of the data failed. The data is malformed"));
    __cxa_end_catch();
    JUMPOUT(0x220DEC59CLL);
  }

  _Unwind_Resume(a1);
}

void sub_220DECA84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void **__p, void **a17)
{
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void **v23;
  void **v24;

  operator delete(v20);
  v23 = __p;
  __p = 0;
  if (v23)
    std::default_delete<UC::UCBitVector>::operator()[abi:ne180100]((int)&__p, v23);
  v24 = a17;
  a17 = 0;
  if (v24)
    std::default_delete<UC::UCBitVector>::operator()[abi:ne180100]((int)&a17, v24);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    if (v18)
      *v18 = (id)objc_msgSend(v19, "_errorWithCoderErrorCode:message:", 1002, CFSTR("Decoding of the data failed. The data is malformed"));
    __cxa_end_catch();
    JUMPOUT(0x220DECA24);
  }

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

UC::SUE::PrefixedURLDecoderImpl *UC::SUE::PrefixedURLDecoderImpl::PrefixedURLDecoderImpl(UC::SUE::PrefixedURLDecoderImpl *this, uint64_t a2)
{
  char *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  __int128 v12;

  *((_OWORD *)this + 1) = 0u;
  v4 = (char *)this + 16;
  *(_OWORD *)this = 0u;
  createHexDecimalCoder(&v12);
  std::shared_ptr<UC::UCHuffmanCoder>::operator=[abi:ne180100]((uint64_t)this, &v12);
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
  createAllowedPrefixes(a2, &v12);
  std::shared_ptr<UC::UCHuffmanCoder>::operator=[abi:ne180100]((uint64_t)v4, &v12);
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
  return this;
}

void sub_220DECD30(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](v2);
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void createHexDecimalCoder(_QWORD *a1@<X8>)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  std::string *v6;
  std::string *v7;
  __int128 *v8;
  std::string **v9;
  char v10;
  __int128 v11;
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  __int128 v27;

  *(_QWORD *)&v27 = *MEMORY[0x24BDAC8D0];
  std::string::basic_string[abi:ne180100]<0>(&v11, "0");
  std::string::basic_string[abi:ne180100]<0>(v12, "1");
  std::string::basic_string[abi:ne180100]<0>(v13, "2");
  std::string::basic_string[abi:ne180100]<0>(v14, "3");
  std::string::basic_string[abi:ne180100]<0>(v15, "4");
  std::string::basic_string[abi:ne180100]<0>(v16, "5");
  std::string::basic_string[abi:ne180100]<0>(v17, "6");
  std::string::basic_string[abi:ne180100]<0>(v18, "7");
  std::string::basic_string[abi:ne180100]<0>(v19, "8");
  std::string::basic_string[abi:ne180100]<0>(v20, "9");
  std::string::basic_string[abi:ne180100]<0>(v21, "a");
  std::string::basic_string[abi:ne180100]<0>(v22, "b");
  std::string::basic_string[abi:ne180100]<0>(v23, "c");
  std::string::basic_string[abi:ne180100]<0>(v24, "d");
  std::string::basic_string[abi:ne180100]<0>(v25, "e");
  std::string::basic_string[abi:ne180100]<0>(v26, "f");
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = &v6;
  v10 = 0;
  v6 = (std::string *)operator new(0x180uLL);
  v7 = v6;
  v8 = (__int128 *)&v6[16];
  v7 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v8, &v11, &v27, v6);
  v2 = 48;
  do
  {
    if (*((char *)&v12[v2 - 1] - 1) < 0)
      operator delete((&v9)[v2]);
    v2 -= 3;
  }
  while (v2 * 8);
  LODWORD(v9) = 4;
  std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string> const&,void>((__int128 **)&v6, &v11);
  std::allocate_shared[abi:ne180100]<UC::UCFixedLengthCoder,std::allocator<UC::UCFixedLengthCoder>,int,std::shared_ptr<std::vector<std::string>>,void>((char *)&v9, &v11, a1);
  v3 = (std::__shared_weak_count *)*((_QWORD *)&v11 + 1);
  if (*((_QWORD *)&v11 + 1))
  {
    v4 = (unint64_t *)(*((_QWORD *)&v11 + 1) + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  *(_QWORD *)&v11 = &v6;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v11);
}

void sub_220DECFDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16)
{
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)&a16);
  a16 = (void **)&a10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

void createAllowedPrefixes(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  char *v4;
  uint64_t v5;
  int v6;
  void *__p[2];
  char v8;

  v4 = (char *)operator new(0x40uLL);
  *((_QWORD *)v4 + 2) = 0;
  *(_QWORD *)v4 = &unk_24E6B2BE0;
  *((_QWORD *)v4 + 1) = 0;
  *(_OWORD *)(v4 + 40) = 0u;
  *((_DWORD *)v4 + 14) = 1065353216;
  *(_OWORD *)(v4 + 24) = 0u;
  v5 = (uint64_t)(v4 + 24);
  *a2 = v4 + 24;
  a2[1] = v4;
  switch(a1)
  {
    case 3:
      v6 = 0;
      std::string::basic_string[abi:ne180100]<0>(__p, "https://appclip.apple.com/rx?p=");
      std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,std::pair<int const,std::string>>(v5, &v6, (uint64_t)&v6);
      break;
    case 2:
      v6 = 0;
      std::string::basic_string[abi:ne180100]<0>(__p, "https://appclip.apple.com/pair?p=");
      std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,std::pair<int const,std::string>>(v5, &v6, (uint64_t)&v6);
      break;
    case 1:
      v6 = 0;
      std::string::basic_string[abi:ne180100]<0>(__p, "https://appclip.apple.com/rx?p=");
      std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,std::pair<int const,std::string>>(v5, &v6, (uint64_t)&v6);
      if (v8 < 0)
        operator delete(__p[0]);
      v6 = 1;
      std::string::basic_string[abi:ne180100]<0>(__p, "https://apple.com/shop/mnf?s=");
      std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,std::pair<int const,std::string>>(v5, &v6, (uint64_t)&v6);
      if (v8 < 0)
        operator delete(__p[0]);
      v6 = 2;
      std::string::basic_string[abi:ne180100]<0>(__p, "https://wallet.apple.com/remoteRequest/?t=");
      std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,std::pair<int const,std::string>>(v5, &v6, (uint64_t)&v6);
      break;
    default:
      return;
  }
  if (v8 < 0)
    operator delete(__p[0]);
}

void sub_220DED200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](v15);
  _Unwind_Resume(a1);
}

void UC::SUE::PrefixedURLDecoderImpl::decodeURL(UC::SUE::PrefixedURLDecoderImpl *this@<X0>, UC::UCBitStream *a2@<X1>, uint64_t a3@<X8>)
{
  int v6;
  int v7;
  uint64_t *v8;
  uint64_t *v9;
  int v10;
  _QWORD *v11;
  void *exception;
  void *__p[2];
  char v14;
  void *v15[2];
  char v16;
  int v17;

  v6 = 0;
  v7 = 10;
  do
  {
    v6 = UC::UCBitStream::readNextBit(a2) & 1 | (2 * v6);
    --v7;
  }
  while (v7);
  v17 = v6;
  v8 = std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::find<int>(*((_QWORD **)this + 2), &v17);
  if (!v8)
  {
    exception = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(exception, "UCPrefixedURLCoderErrorDomain", 29, 7, "", 0, "Unsupported header format in encoded data", 41);
  }
  v9 = v8;
  v10 = 6;
  do
  {
    UC::UCBitStream::readNextBit(a2);
    --v10;
  }
  while (v10);
  v11 = *(_QWORD **)this;
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  (*(void (**)(void **__return_ptr, _QWORD *, UC::UCBitStream *, void **))(*v11 + 48))(v15, v11, a2, __p);
  if (v14 < 0)
    operator delete(__p[0]);
  std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)v9 + 3, (const void **)v15, a3);
  if (v16 < 0)
    operator delete(v15[0]);
}

void sub_220DED388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;

  __cxa_free_exception(v21);
  _Unwind_Resume(a1);
}

UC::SUE::PrefixedURLEncoderImpl *UC::SUE::PrefixedURLEncoderImpl::PrefixedURLEncoderImpl(UC::SUE::PrefixedURLEncoderImpl *this, uint64_t a2)
{
  char *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  __int128 v12;

  *((_OWORD *)this + 1) = 0u;
  v4 = (char *)this + 16;
  *(_OWORD *)this = 0u;
  createHexDecimalCoder(&v12);
  std::shared_ptr<UC::UCHuffmanCoder>::operator=[abi:ne180100]((uint64_t)this, &v12);
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
  createAllowedPrefixes(a2, &v12);
  std::shared_ptr<UC::UCHuffmanCoder>::operator=[abi:ne180100]((uint64_t)v4, &v12);
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
  return this;
}

void sub_220DED4AC(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](v2);
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void UC::SUE::PrefixedURLEncoderImpl::encodeURL(UC::SUE::PrefixedURLEncoderImpl *this@<X0>, const UC::UCURLComponents *a2@<X1>, std::string *a3@<X8>)
{
  char *v6;
  int v7;
  int v8;
  int v9;
  uint64_t v11;
  uint64_t v12;
  std::string::size_type size;
  uint64_t v14;
  int v15;
  const std::string::value_type *v16;
  std::string::size_type v17;
  std::string *v18;
  __int128 v19;
  std::string *v20;
  __int128 v21;
  int v22;
  const std::string::value_type *v23;
  std::string::size_type v24;
  std::string *v25;
  __int128 v26;
  std::string *v27;
  uint64_t *v28;
  std::string::size_type v29;
  std::string *p_p;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  const void **v34;
  std::string *v35;
  unsigned int v36;
  char *v37;
  const void **v38;
  uint64_t v40;
  std::string::size_type v41;
  std::string *v42;
  std::string *v43;
  std::string *v44;
  std::string::size_type v45;
  std::string *v46;
  __int128 v47;
  void **v48;
  void *exception;
  _QWORD *v50;
  _QWORD *v51;
  std::string v52;
  std::string v53;
  std::string __p;
  uint64_t v55[3];
  std::string v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  std::string __str;
  std::string v62;

  v6 = (char *)a2 + 24;
  v7 = *((char *)a2 + 47);
  if (v7 < 0)
  {
    if (*((_QWORD *)a2 + 4) != 5)
    {
LABEL_113:
      exception = __cxa_allocate_exception(0x58uLL);
      UC::Exception::CoderError::CoderError(exception, "UCPrefixedURLCoderErrorDomain", 29, 1, "", 0, "Only encoding of the scheme https is supported", 46);
      goto LABEL_118;
    }
    v6 = *(char **)v6;
  }
  else if (v7 != 5)
  {
    goto LABEL_113;
  }
  v8 = *(_DWORD *)v6;
  v9 = v6[4];
  if (v8 != 1886680168 || v9 != 115)
    goto LABEL_113;
  if (*((_QWORD *)a2 + 18))
  {
    exception = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(exception, "UCPrefixedURLCoderErrorDomain", 29, 2, "", 0, "Encoding of URLs with port is not supported", 43);
    goto LABEL_118;
  }
  v11 = *((unsigned __int8 *)a2 + 175);
  if ((v11 & 0x80u) != 0)
    v11 = *((_QWORD *)a2 + 20);
  if (v11)
  {
    exception = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(exception, "UCPrefixedURLCoderErrorDomain", 29, 3, "", 0, "Encoding of URLs with user is not supported", 43);
    goto LABEL_118;
  }
  v12 = *((unsigned __int8 *)a2 + 199);
  if ((v12 & 0x80u) != 0)
    v12 = *((_QWORD *)a2 + 23);
  if (v12)
  {
    exception = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(exception, "UCPrefixedURLCoderErrorDomain", 29, 4, "", 0, "Encoding of URLs with password is not supported", 47);
LABEL_118:
  }
  v57 = 0;
  v58 = 0;
  v59 = 0;
  v60 = 0;
  if (*((char *)a2 + 71) < 0)
    std::string::__init_copy_ctor_external(&v56, *((const std::string::value_type **)a2 + 6), *((_QWORD *)a2 + 7));
  else
    v56 = *(std::string *)((_BYTE *)a2 + 2);
  tokenizeString((uint64_t)a2 + 96, 61, v55);
  size = HIBYTE(v56.__r_.__value_.__r.__words[2]);
  if ((v56.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v56.__r_.__value_.__l.__size_;
  if (!size)
  {
    v51 = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(v51, "UCPrefixedURLCoderErrorDomain", 0x1DuLL, 5, "", 0, "The URL must have a host component", 0x22uLL);
    goto LABEL_122;
  }
  v14 = *((unsigned __int8 *)a2 + 143);
  if ((v14 & 0x80u) != 0)
    v14 = *((_QWORD *)a2 + 16);
  if (v14)
  {
    v51 = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(v51, "UCPrefixedURLCoderErrorDomain", 0x1DuLL, 8, "", 0, "Prefixed URL must not have fragment", 0x23uLL);
    goto LABEL_122;
  }
  if (v55[1] - v55[0] != 48)
  {
    v51 = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(v51, "UCPrefixedURLCoderErrorDomain", 0x1DuLL, 8, "", 0, "Prefixed URL must have exactly one query parameter", 0x32uLL);
LABEL_122:
  }
  std::operator+<char>();
  v15 = *((char *)a2 + 95);
  if (v15 >= 0)
    v16 = (char *)a2 + 72;
  else
    v16 = (const std::string::value_type *)*((_QWORD *)a2 + 9);
  if (v15 >= 0)
    v17 = *((unsigned __int8 *)a2 + 95);
  else
    v17 = *((_QWORD *)a2 + 10);
  v18 = std::string::append(&v52, v16, v17);
  v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  v53.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v53.__r_.__value_.__l.__data_ = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  v20 = std::string::append(&v53, "?");
  v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
  __str.__r_.__value_.__r.__words[2] = v20->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v21;
  v20->__r_.__value_.__l.__size_ = 0;
  v20->__r_.__value_.__r.__words[2] = 0;
  v20->__r_.__value_.__r.__words[0] = 0;
  v22 = *(char *)(v55[0] + 23);
  if (v22 >= 0)
    v23 = (const std::string::value_type *)v55[0];
  else
    v23 = *(const std::string::value_type **)v55[0];
  if (v22 >= 0)
    v24 = *(unsigned __int8 *)(v55[0] + 23);
  else
    v24 = *(_QWORD *)(v55[0] + 8);
  v25 = std::string::append(&__str, v23, v24);
  v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  v62.__r_.__value_.__r.__words[2] = v25->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v62.__r_.__value_.__l.__data_ = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  v27 = std::string::append(&v62, "=");
  __p = *v27;
  v27->__r_.__value_.__l.__size_ = 0;
  v27->__r_.__value_.__r.__words[2] = 0;
  v27->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v62.__r_.__value_.__l.__data_);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v53.__r_.__value_.__l.__data_);
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v52.__r_.__value_.__l.__data_);
  v28 = *(uint64_t **)(*((_QWORD *)this + 2) + 16);
  if (!v28)
  {
LABEL_114:
    v50 = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(v50, "UCPrefixedURLCoderErrorDomain", 0x1DuLL, 8, "", 0, "Encoding of URL with unsupported URL prefix", 0x2BuLL);
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v29 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v29 = __p.__r_.__value_.__l.__size_;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  v31 = -1;
  do
  {
    v32 = *((unsigned __int8 *)v28 + 47);
    if ((v32 & 0x80u) == 0)
      v33 = *((unsigned __int8 *)v28 + 47);
    else
      v33 = v28[4];
    if (v33 == v29)
    {
      v34 = (const void **)(v28 + 3);
      if ((v32 & 0x80) != 0)
      {
        if (memcmp(*v34, p_p, v28[4]))
          goto LABEL_68;
LABEL_67:
        v31 = *((_DWORD *)v28 + 4);
        goto LABEL_68;
      }
      if (!*((_BYTE *)v28 + 47))
        goto LABEL_67;
      v35 = p_p;
      while (*(unsigned __int8 *)v34 == v35->__r_.__value_.__s.__data_[0])
      {
        v34 = (const void **)((char *)v34 + 1);
        v35 = (std::string *)((char *)v35 + 1);
        if (!--v32)
          goto LABEL_67;
      }
    }
LABEL_68:
    v28 = (uint64_t *)*v28;
  }
  while (v28);
  if (v31 == -1)
    goto LABEL_114;
  v36 = 0;
  memset(&v53, 0, sizeof(v53));
  do
  {
    if ((v31 & 1) != 0)
      v37 = "1";
    else
      v37 = "0";
    v38 = (const void **)std::string::basic_string[abi:ne180100]<0>(&v62, v37);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v38, (const void **)&v53.__r_.__value_.__l.__data_, (uint64_t)&__str);
    if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v53.__r_.__value_.__l.__data_);
    v53 = __str;
    if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v62.__r_.__value_.__l.__data_);
    v31 >>= 1;
  }
  while (v36++ < 9);
  v40 = *(_QWORD *)this;
  tokenizeString(v55[0] + 24, 0, (uint64_t *)&__str);
  (*(void (**)(std::string *__return_ptr, uint64_t, std::string *))(*(_QWORD *)v40 + 40))(&v62, v40, &__str);
  v52.__r_.__value_.__r.__words[0] = (std::string::size_type)&__str;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v52);
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  a3[1].__r_.__value_.__r.__words[2] = 0;
  if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v41 = HIBYTE(v53.__r_.__value_.__r.__words[2]);
  else
    v41 = v53.__r_.__value_.__l.__size_;
  v42 = &v52;
  std::string::basic_string[abi:ne180100]((uint64_t)&v52, v41 + 6);
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    v42 = (std::string *)v52.__r_.__value_.__r.__words[0];
  if (v41)
  {
    if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v43 = &v53;
    else
      v43 = (std::string *)v53.__r_.__value_.__r.__words[0];
    memmove(v42, v43, v41);
  }
  memset((char *)v42 + v41, 48, 6);
  if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v44 = &v62;
  else
    v44 = (std::string *)v62.__r_.__value_.__r.__words[0];
  if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v45 = HIBYTE(v62.__r_.__value_.__r.__words[2]);
  else
    v45 = v62.__r_.__value_.__l.__size_;
  v46 = std::string::append(&v52, (const std::string::value_type *)v44, v45);
  v47 = *(_OWORD *)&v46->__r_.__value_.__l.__data_;
  __str.__r_.__value_.__r.__words[2] = v46->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v47;
  v46->__r_.__value_.__l.__size_ = 0;
  v46->__r_.__value_.__r.__words[2] = 0;
  v46->__r_.__value_.__r.__words[0] = 0;
  UC::SUE::UCSegmentedURLEncodingResult::setEncodingBits(a3, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v52.__r_.__value_.__l.__data_);
  if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v62.__r_.__value_.__l.__data_);
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v53.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v62.__r_.__value_.__r.__words[0] = (std::string::size_type)v55;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v62);
  if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v56.__r_.__value_.__l.__data_);
  v48 = (void **)v60;
  v60 = 0;
  if (v48)
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&v60, v48);
  if (SHIBYTE(v59) < 0)
    operator delete(v57);
}

void sub_220DEDC28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,char a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37,char a38)
{
  UC::SUE::UCSegmentedURLEncodingResult::~UCSegmentedURLEncodingResult((UC::SUE::UCSegmentedURLEncodingResult *)&a38);
  _Unwind_Resume(a1);
}

void tokenizeString(uint64_t a1@<X0>, int a2@<W1>, uint64_t *a3@<X8>)
{
  unsigned __int8 v3;
  _QWORD *v5;
  unint64_t v6;
  __int128 v7;
  uint64_t v8;
  std::string::size_type v9;
  int v10;
  std::string::value_type *v11;
  uint64_t v12;
  std::string::value_type v13;
  unint64_t v14;
  __int128 v15;
  uint64_t v16;
  void *__p[2];
  uint64_t v18;
  std::string v19;
  uint64_t v20;
  void *v21;
  char v22;
  uint64_t v23;

  v3 = a2;
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (a2)
  {
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](&v19, (const std::string *)a1, 24);
    __p[0] = 0;
    __p[1] = 0;
    v18 = 0;
    while (1)
    {
      v5 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v19, (uint64_t)__p, v3);
      if ((*((_BYTE *)v5 + *(_QWORD *)(*v5 - 24) + 32) & 5) != 0)
        break;
      v6 = a3[1];
      if (v6 >= a3[2])
      {
        v8 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a3, (__int128 *)__p);
      }
      else
      {
        if (SHIBYTE(v18) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)a3[1], (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
        }
        else
        {
          v7 = *(_OWORD *)__p;
          *(_QWORD *)(v6 + 16) = v18;
          *(_OWORD *)v6 = v7;
        }
        v8 = v6 + 24;
        a3[1] = v6 + 24;
      }
      a3[1] = v8;
    }
    if (SHIBYTE(v18) < 0)
      operator delete(__p[0]);
    v19.__r_.__value_.__r.__words[0] = *MEMORY[0x24BEDB7F0];
    v9 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
    *(std::string::size_type *)((char *)v19.__r_.__value_.__r.__words
                              + *(_QWORD *)(v19.__r_.__value_.__r.__words[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0]
                                                                                                + 64);
    v19.__r_.__value_.__r.__words[2] = v9;
    v20 = MEMORY[0x24BEDB848] + 16;
    if (v22 < 0)
      operator delete(v21);
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x2276664A4](&v23);
  }
  else
  {
    v10 = *(char *)(a1 + 23);
    if (v10 >= 0)
      v11 = (std::string::value_type *)a1;
    else
      v11 = *(std::string::value_type **)a1;
    if (v10 >= 0)
      v12 = *(unsigned __int8 *)(a1 + 23);
    else
      v12 = *(_QWORD *)(a1 + 8);
    for (; v12; --v12)
    {
      v13 = *v11;
      memset(&v19, 0, sizeof(v19));
      std::string::push_back(&v19, v13);
      v14 = a3[1];
      if (v14 >= a3[2])
      {
        v16 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a3, (__int128 *)&v19);
      }
      else
      {
        if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)a3[1], v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
        }
        else
        {
          v15 = *(_OWORD *)&v19.__r_.__value_.__l.__data_;
          *(_QWORD *)(v14 + 16) = *((_QWORD *)&v19.__r_.__value_.__l + 2);
          *(_OWORD *)v14 = v15;
        }
        v16 = v14 + 24;
        a3[1] = v14 + 24;
      }
      a3[1] = v16;
      if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v19.__r_.__value_.__l.__data_);
      ++v11;
    }
  }
}

void sub_220DEDF9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

uint64_t std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string> const&,void>@<X0>(__int128 **a1@<X1>, _QWORD *a2@<X8>)
{
  char *v4;
  uint64_t result;

  v4 = (char *)operator new(0x30uLL);
  result = std::__shared_ptr_emplace<std::vector<std::string>>::__shared_ptr_emplace[abi:ne180100]<std::vector<std::string> const&,std::allocator<std::vector<std::string>>,0>((uint64_t)v4, a1);
  *a2 = v4 + 24;
  a2[1] = v4;
  return result;
}

void sub_220DEE04C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<std::vector<std::string>>::__shared_ptr_emplace[abi:ne180100]<std::vector<std::string> const&,std::allocator<std::vector<std::string>>,0>(uint64_t a1, __int128 **a2)
{
  *(_OWORD *)(a1 + 8) = 0u;
  *(_QWORD *)a1 = &unk_24E6B2790;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_QWORD *)(a1 + 24) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a1 + 24), *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3));
  return a1;
}

void sub_220DEE0C0(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<std::unordered_map<int,std::string>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_24E6B2BE0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::unordered_map<int,std::string>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  void *v1;

  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_24E6B2BE0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<std::unordered_map<int,std::string>>::__on_zero_shared(uint64_t a1)
{
  return std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::~__hash_table(a1 + 24);
}

uint64_t std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__deallocate_node(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 47) < 0)
        operator delete(v2[3]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

char *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,std::pair<int const,std::string>>(uint64_t a1, int *a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  char *v10;
  unint64_t v11;
  _QWORD *v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

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
      v3 = (v7 - 1) & v6;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = (char *)*v9;
      if (*v9)
      {
        do
        {
          v11 = *((_QWORD *)v10 + 1);
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
          v10 = *(char **)v10;
        }
        while (v10);
      }
    }
  }
  v12 = (_QWORD *)(a1 + 16);
  v10 = (char *)operator new(0x30uLL);
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = v6;
  *((_DWORD *)v10 + 4) = *(_DWORD *)a3;
  *(_OWORD *)(v10 + 24) = *(_OWORD *)(a3 + 8);
  *((_QWORD *)v10 + 5) = *(_QWORD *)(a3 + 24);
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_QWORD *)(a3 + 24) = 0;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v7 || (float)(v14 * (float)v7) < v13)
  {
    v15 = 1;
    if (v7 >= 3)
      v15 = (v7 & (v7 - 1)) != 0;
    v16 = v15 | (2 * v7);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(a1, v18);
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
      v3 = (v7 - 1) & v6;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v20)
  {
    *(_QWORD *)v10 = *v20;
LABEL_38:
    *v20 = v10;
    goto LABEL_39;
  }
  *(_QWORD *)v10 = *v12;
  *v12 = v10;
  *(_QWORD *)(v19 + 8 * v3) = v12;
  if (*(_QWORD *)v10)
  {
    v21 = *(_QWORD *)(*(_QWORD *)v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v21 >= v7)
        v21 %= v7;
    }
    else
    {
      v21 &= v7 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v10;
}

void sub_220DEE3D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  void **v10;
  uint64_t v11;

  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 47) < 0)
      operator delete(__p[3]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

_QWORD *std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](_QWORD *a1, const std::string *a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  std::ios_base *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = MEMORY[0x24BEDB858];
  v6 = MEMORY[0x24BEDB858] + 104;
  a1[16] = MEMORY[0x24BEDB858] + 104;
  a1[2] = v5 + 64;
  v7 = a1 + 2;
  v8 = (uint64_t)(a1 + 3);
  v9 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v10 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v11 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  *a1 = v10;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v10 - 24)) = v11;
  a1[1] = 0;
  v12 = (std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  std::ios_base::init(v12, a1 + 3);
  v12[1].__vftable = 0;
  v12[1].__fmtflags_ = -1;
  v13 = v9[4];
  v14 = v9[5];
  a1[2] = v13;
  *(_QWORD *)((char *)v7 + *(_QWORD *)(v13 - 24)) = v14;
  v15 = v9[1];
  *a1 = v15;
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v15 - 24)) = v9[6];
  *a1 = v5 + 24;
  a1[16] = v6;
  a1[2] = v5 + 64;
  std::stringbuf::basic_stringbuf[abi:ne180100](v8, a2, a3);
  return a1;
}

void sub_220DEE534(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x2276664A4](v1);
  _Unwind_Resume(a1);
}

_QWORD *std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v6;
  _QWORD *v7;
  _BYTE *v8;
  int v9;
  char v11;

  MEMORY[0x2276663C0](&v11, a1, 1);
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

void sub_220DEE688(void *a1)
{
  _QWORD *v1;
  uint64_t v2;

  __cxa_begin_catch(a1);
  v2 = *v1;
  *(_DWORD *)((char *)v1 + *(_QWORD *)(*v1 - 24) + 32) |= 1u;
  if ((*((_BYTE *)v1 + *(_QWORD *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x220DEE654);
  }
  __cxa_rethrow();
}

void sub_220DEE6CC(_Unwind_Exception *a1)
{
  __cxa_end_catch();
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
  MEMORY[0x2276664A4](a1 + 128);
  return a1;
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::find<int>(_QWORD *a1, int *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t **v6;
  uint64_t *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (*(_QWORD *)&v2 <= v3)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  for (result = *v6; result; result = (uint64_t *)*result)
  {
    v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == (_DWORD)v3)
        return result;
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(_QWORD *)&v2)
          v8 %= *(_QWORD *)&v2;
      }
      else
      {
        v8 &= *(_QWORD *)&v2 - 1;
      }
      if (v8 != v5)
        return 0;
    }
  }
  return result;
}

void UC::SplitString(unsigned __int8 *a1, uint64_t a2, unsigned __int8 a3, uint64_t *a4)
{
  uint64_t v6;
  int v8;
  unint64_t v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  uint64_t v14;
  std::string v15;

  memset(&v15, 0, sizeof(v15));
  if (!a2)
    goto LABEL_23;
  v6 = a2;
  do
  {
    v8 = *a1;
    if (v8 == a3)
    {
      v9 = a4[1];
      if (v9 >= a4[2])
      {
        v11 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a4, (__int128 *)&v15);
      }
      else
      {
        if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)a4[1], v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
        }
        else
        {
          v10 = *(_OWORD *)&v15.__r_.__value_.__l.__data_;
          *(_QWORD *)(v9 + 16) = *((_QWORD *)&v15.__r_.__value_.__l + 2);
          *(_OWORD *)v9 = v10;
        }
        v11 = v9 + 24;
        a4[1] = v9 + 24;
      }
      a4[1] = v11;
      MEMORY[0x227666324](&v15, "");
    }
    else
    {
      std::string::push_back(&v15, v8);
    }
    ++a1;
    --v6;
  }
  while (v6);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!v15.__r_.__value_.__l.__size_)
      goto LABEL_23;
    v12 = a4[1];
    if (v12 < a4[2])
    {
      std::string::__init_copy_ctor_external((std::string *)a4[1], v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
      goto LABEL_20;
    }
LABEL_21:
    v14 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a4, (__int128 *)&v15);
    goto LABEL_22;
  }
  if (!*((_BYTE *)&v15.__r_.__value_.__s + 23))
    goto LABEL_23;
  v12 = a4[1];
  if (v12 >= a4[2])
    goto LABEL_21;
  v13 = *(_OWORD *)&v15.__r_.__value_.__l.__data_;
  *(_QWORD *)(v12 + 16) = *((_QWORD *)&v15.__r_.__value_.__l + 2);
  *(_OWORD *)v12 = v13;
LABEL_20:
  v14 = v12 + 24;
  a4[1] = v12 + 24;
LABEL_22:
  a4[1] = v14;
LABEL_23:
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v15.__r_.__value_.__l.__data_);
}

void sub_220DEEE38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v15 + 8) = v16;
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::string *UC::JoinString@<X0>(std::string *result@<X0>, std::string *a2@<X8>)
{
  std::string::size_type v2;
  std::string::size_type size;
  int v5;
  const std::string::value_type *v6;
  std::string::size_type v7;

  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  v2 = result->__r_.__value_.__r.__words[0];
  size = result->__r_.__value_.__l.__size_;
  if (result->__r_.__value_.__r.__words[0] != size)
  {
    do
    {
      v5 = *(char *)(v2 + 23);
      if (v5 >= 0)
        v6 = (const std::string::value_type *)v2;
      else
        v6 = *(const std::string::value_type **)v2;
      if (v5 >= 0)
        v7 = *(unsigned __int8 *)(v2 + 23);
      else
        v7 = *(_QWORD *)(v2 + 8);
      result = std::string::append(a2, v6, v7);
      v2 += 24;
    }
    while (v2 != size);
  }
  return result;
}

void sub_220DEEED4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t UC::IsAllDigits(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  _BOOL8 v4;

  if (!a2)
    return 1;
  v2 = a2 - 1;
  do
  {
    v3 = *a1++;
    v4 = (v3 - 48) < 0xA;
  }
  while ((v3 - 48) <= 9 && v2-- != 0);
  return v4;
}

uint64_t UC::UCFixedLengthCoder::UCFixedLengthCoder(uint64_t result, char a2, _QWORD *a3)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;

  *(_QWORD *)result = off_24E6B2C78;
  *(_BYTE *)(result + 8) = a2;
  v3 = a3[1];
  *(_QWORD *)(result + 16) = *a3;
  *(_QWORD *)(result + 24) = v3;
  if (v3)
  {
    v4 = (unint64_t *)(v3 + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  *(_QWORD *)(result + 32) = 0;
  return result;
}

void UC::UCFixedLengthCoder::_initializeForEncoding(UC::UCFixedLengthCoder *this)
{
  uint64_t *v1;
  _OWORD *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  char *v12;
  void *__p[2];
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  void *v17[2];
  char v18;

  v1 = (uint64_t *)((char *)this + 32);
  if (!*((_QWORD *)this + 4))
  {
    v3 = operator new(0x28uLL);
    *v3 = 0u;
    v3[1] = 0u;
    *((_DWORD *)v3 + 8) = 1065353216;
    std::unique_ptr<std::unordered_map<std::string,std::string>>::reset[abi:ne180100](v1, (uint64_t)v3);
    if (-1431655765
       * ((uint64_t)(*(_QWORD *)(*((_QWORD *)this + 2) + 8) - **((_QWORD **)this + 2)) >> 3))
    {
      v4 = 0;
      v5 = -1431655765
         * ((uint64_t)(*(_QWORD *)(*((_QWORD *)this + 2) + 8) - **((_QWORD **)this + 2)) >> 3);
      do
      {
        v6 = (uint64_t *)*((_QWORD *)this + 2);
        v7 = *v6;
        if (0xAAAAAAAAAAAAAAABLL * ((v6[1] - *v6) >> 3) <= v4)
          std::vector<std::string>::__throw_out_of_range[abi:ne180100]();
        v8 = *((_QWORD *)this + 4);
        v9 = *((unsigned __int8 *)this + 8);
        __p[1] = 0;
        v14 = 0;
        __p[0] = 0;
        if (v9)
        {
          v10 = 0;
          v11 = v4;
          do
          {
            if ((v11 & 1) != 0)
              v12 = "1";
            else
              v12 = "0";
            std::string::basic_string[abi:ne180100]<0>(v17, v12);
            std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)v17, (const void **)__p, (uint64_t)&v15);
            if (SHIBYTE(v14) < 0)
              operator delete(__p[0]);
            *(_OWORD *)__p = v15;
            v14 = v16;
            if (v18 < 0)
              operator delete(v17[0]);
            v11 >>= 1;
            ++v10;
          }
          while (v10 < v9);
        }
        std::unordered_map<std::string,std::string>::insert_or_assign[abi:ne180100]<std::string>(v8, (unsigned __int8 *)(v7 + 24 * v4), (__n128 *)__p);
        if (SHIBYTE(v14) < 0)
          operator delete(__p[0]);
        ++v4;
      }
      while (v4 != v5);
    }
  }
}

void sub_220DEF0E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

unsigned __int8 *std::unordered_map<std::string,std::string>::insert_or_assign[abi:ne180100]<std::string>(uint64_t a1, unsigned __int8 *a2, __n128 *a3)
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  char v6;
  void **v7;
  __n128 v8;

  v4 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::string const&,std::string>(a1, a2, (uint64_t)a2, a3);
  v5 = v4;
  if (!v6)
  {
    v7 = (void **)(v4 + 40);
    if ((char)v4[63] < 0)
      operator delete(*v7);
    v8 = *a3;
    *((_QWORD *)v5 + 7) = a3[1].n128_u64[0];
    *(__n128 *)v7 = v8;
    a3[1].n128_u8[7] = 0;
    a3->n128_u8[0] = 0;
  }
  return v5;
}

void UC::UCFixedLengthCoder::encode(UC::UCFixedLengthCoder *a1@<X0>, unsigned __int8 *a2@<X1>, std::string *a3@<X8>)
{
  unsigned __int8 *v6;
  __int128 v7;

  UC::UCFixedLengthCoder::_initializeForEncoding(a1);
  v6 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::find<std::string>(*((_QWORD **)a1 + 4), a2);
  if (!v6)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  if ((char)v6[63] < 0)
  {
    std::string::__init_copy_ctor_external(a3, *((const std::string::value_type **)v6 + 5), *((_QWORD *)v6 + 6));
  }
  else
  {
    v7 = *(_OWORD *)(v6 + 40);
    a3->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 7);
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v7;
  }
}

void UC::UCFixedLengthCoder::encode(uint64_t a1@<X0>, uint64_t *a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  void **v7;
  std::string::size_type v8;
  void *__p[2];
  unsigned __int8 v10;

  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  v3 = *a2;
  v4 = a2[1];
  if (*a2 != v4)
  {
    do
    {
      (*(void (**)(void **__return_ptr, uint64_t, uint64_t))(*(_QWORD *)a1 + 32))(__p, a1, v3);
      if ((v10 & 0x80u) == 0)
        v7 = __p;
      else
        v7 = (void **)__p[0];
      if ((v10 & 0x80u) == 0)
        v8 = v10;
      else
        v8 = (std::string::size_type)__p[1];
      std::string::append(a3, (const std::string::value_type *)v7, v8);
      if ((char)v10 < 0)
        operator delete(__p[0]);
      v3 += 24;
    }
    while (v3 != v4);
  }
}

void sub_220DEF2AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v15 + 23) < 0)
    operator delete(*(void **)v15);
  _Unwind_Resume(exception_object);
}

void UC::UCFixedLengthCoder::decode(UC::UCBitStream *this@<X1>, uint64_t a2@<X0>, unsigned __int8 *a3@<X2>, std::string *a4@<X8>)
{
  uint64_t v8;
  int v9;
  std::string::size_type v10;
  uint64_t v11;
  int v12;
  unsigned __int8 *v13;
  void **p_s1;
  char v15;
  void *v16;
  const std::string::value_type *v17;
  void *__s1;
  size_t __n;
  unsigned __int8 v20;

  a4->__r_.__value_.__r.__words[0] = 0;
  a4->__r_.__value_.__l.__size_ = 0;
  a4->__r_.__value_.__r.__words[2] = 0;
  while (UC::UCBitStream::hasMore(this))
  {
    (*(void (**)(void **__return_ptr, uint64_t, UC::UCBitStream *))(*(_QWORD *)a2 + 56))(&__s1, a2, this);
    v8 = v20;
    v9 = (char)v20;
    if ((v20 & 0x80u) == 0)
      v10 = v20;
    else
      v10 = __n;
    v11 = a3[23];
    v12 = (char)v11;
    if ((v11 & 0x80u) != 0)
      v11 = *((_QWORD *)a3 + 1);
    if (v10 == v11)
    {
      if (v12 >= 0)
        v13 = a3;
      else
        v13 = *(unsigned __int8 **)a3;
      if ((char)v20 < 0)
      {
        v16 = __s1;
        if (!memcmp(__s1, v13, __n))
        {
          operator delete(v16);
          return;
        }
      }
      else
      {
        if (!v20)
          return;
        p_s1 = &__s1;
        while (*(unsigned __int8 *)p_s1 == *v13)
        {
          p_s1 = (void **)((char *)p_s1 + 1);
          ++v13;
          if (!--v8)
          {
            v15 = 0;
            if ((v20 & 0x80) == 0)
              goto LABEL_24;
            goto LABEL_26;
          }
        }
      }
    }
    if (v9 >= 0)
      v17 = (const std::string::value_type *)&__s1;
    else
      v17 = (const std::string::value_type *)__s1;
    std::string::append(a4, v17, v10);
    v15 = 1;
    if ((v20 & 0x80) != 0)
    {
LABEL_26:
      operator delete(__s1);
      if ((v15 & 1) == 0)
        return;
    }
    else
    {
LABEL_24:
      if ((v15 & 1) == 0)
        return;
    }
  }
}

void sub_220DEF420(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;

  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v15 + 23) < 0)
    operator delete(*(void **)v15);
  _Unwind_Resume(exception_object);
}

void UC::UCFixedLengthCoder::decodeNextSymbol(UC::UCFixedLengthCoder *this@<X0>, UC::UCBitStream *a2@<X1>, std::string *a3@<X8>)
{
  int v6;
  unint64_t v7;
  uint64_t v8;
  __int128 *v9;
  __int128 v10;
  void *exception;

  if (*((_BYTE *)this + 8))
  {
    v6 = 0;
    LODWORD(v7) = 0;
    while (UC::UCBitStream::hasMore(a2))
    {
      v7 = UC::UCBitStream::readNextBit(a2) | (2 * (_DWORD)v7);
      if (++v6 >= *((unsigned __int8 *)this + 8))
        goto LABEL_7;
    }
    goto LABEL_11;
  }
  v7 = 0;
LABEL_7:
  v8 = **((_QWORD **)this + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((*(_QWORD *)(*((_QWORD *)this + 2) + 8) - v8) >> 3) <= v7)
  {
LABEL_11:
    exception = __cxa_allocate_exception(0x38uLL);
    UC::Exception::InvalidDecodingSymbolInstruction::InvalidDecodingSymbolInstruction(exception, "", 0, "Decoder encountered an invalid symbol instruction. The encoding bit stream is invalid", 85);
  }
  v9 = (__int128 *)(v8 + 24 * v7);
  if (*((char *)v9 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(a3, *(const std::string::value_type **)v9, *((_QWORD *)v9 + 1));
  }
  else
  {
    v10 = *v9;
    a3->__r_.__value_.__r.__words[2] = *((_QWORD *)v9 + 2);
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v10;
  }
}

void sub_220DEF598(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t UC::UCFixedLengthCoder::canEncode(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  BOOL v6;

  v2 = *a2;
  v3 = a2[1];
  if (*a2 == v3)
    return 1;
  do
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, v2);
    v2 += 24;
    if ((_DWORD)result)
      v6 = v2 == v3;
    else
      v6 = 1;
  }
  while (!v6);
  return result;
}

BOOL UC::UCFixedLengthCoder::canEncode(UC::UCFixedLengthCoder *a1, unsigned __int8 *a2)
{
  UC::UCFixedLengthCoder::_initializeForEncoding(a1);
  return std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::find<std::string>(*((_QWORD **)a1 + 4), a2) != 0;
}

void UC::UCFixedLengthCoder::~UCFixedLengthCoder(UC::UCFixedLengthCoder *this)
{
  char *v1;

  *(_QWORD *)this = off_24E6B2C78;
  v1 = (char *)this + 16;
  std::unique_ptr<std::unordered_map<std::string,std::string>>::reset[abi:ne180100]((uint64_t *)this + 4, 0);
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)v1);
}

{
  char *v2;

  *(_QWORD *)this = off_24E6B2C78;
  v2 = (char *)this + 16;
  std::unique_ptr<std::unordered_map<std::string,std::string>>::reset[abi:ne180100]((uint64_t *)this + 4, 0);
  std::shared_ptr<UC::SUE::UCSegmentedURLCoderProvider>::~shared_ptr[abi:ne180100]((uint64_t)v2);
  operator delete(this);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::string const&,std::string>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __n128 *a4)
{
  unint64_t v4;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  unsigned __int8 **v15;
  unsigned __int8 *i;
  unint64_t v17;
  float v18;
  float v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  size_t v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD v27[3];

  v9 = (_QWORD *)(a1 + 24);
  v10 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      v4 = v10;
      if (v10 >= v12)
        v4 = v10 % v12;
    }
    else
    {
      v4 = (v12 - 1) & v10;
    }
    v15 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v15)
    {
      for (i = *v15; i; i = *(unsigned __int8 **)i)
      {
        v17 = *((_QWORD *)i + 1);
        if (v17 == v11)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
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
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__construct_node_hash<std::string const&,std::string>(a1, v11, a3, a4, (uint64_t)v27);
  v18 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v19 = *(float *)(a1 + 32);
  if (!v12 || (float)(v19 * (float)v12) < v18)
  {
    v20 = 1;
    if (v12 >= 3)
      v20 = (v12 & (v12 - 1)) != 0;
    v21 = v20 | (2 * v12);
    v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22)
      v23 = v22;
    else
      v23 = v21;
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(a1, v23);
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
  v24 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v24)
  {
    *(_QWORD *)v27[0] = *v24;
    *v24 = v27[0];
  }
  else
  {
    *(_QWORD *)v27[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v27[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v27[0])
    {
      v25 = *(_QWORD *)(*(_QWORD *)v27[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v25 >= v12)
          v25 %= v12;
      }
      else
      {
        v25 &= v12 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v25) = v27[0];
    }
  }
  i = (unsigned __int8 *)v27[0];
  v27[0] = 0;
  ++*v9;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)v27, 0);
  return i;
}

void sub_220DEF93C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

__n128 std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__construct_node_hash<std::string const&,std::string>@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __n128 *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  char *v10;
  std::string *v11;
  __n128 result;

  v9 = a1 + 16;
  v10 = (char *)operator new(0x40uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = a2;
  v11 = (std::string *)(v10 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((_QWORD *)v10 + 4) = *(_QWORD *)(a3 + 16);
  }
  result = *a4;
  *(__n128 *)(v10 + 40) = *a4;
  *((_QWORD *)v10 + 7) = a4[1].n128_u64[0];
  a4->n128_u64[1] = 0;
  a4[1].n128_u64[0] = 0;
  a4->n128_u64[0] = 0;
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_220DEF9EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void std::priority_queue<std::unique_ptr<UCHuffmanNodeWrapper>,std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0>::pop(uint64_t *a1)
{
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](a1, 0);
  operator delete(a1);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x24BEDA9B0](this, __c, __pos);
}

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x24BEDA9B8](this, __c, __pos);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x24BEDAC98](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x24BEDAD00](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x24BEDADD8]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x24BEDADE0]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x24BEDAE18]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x24BEDAE30]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x24BEDAE38]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x24BEDAE50]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x24BEDAE70]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x24BEDAEC8]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
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
  return MEMORY[0x24BEDAF60]();
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

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x24BEDB330](__str, __idx, *(_QWORD *)&__base);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
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

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x24BEDB688](this);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete[](void *__p)
{
  off_24E6B2330(__p);
}

void operator delete(void *__p)
{
  off_24E6B2338(__p);
}

void *__cdecl operator new[](size_t __sz)
{
  return (void *)off_24E6B2340(__sz);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24E6B2348(__sz);
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

