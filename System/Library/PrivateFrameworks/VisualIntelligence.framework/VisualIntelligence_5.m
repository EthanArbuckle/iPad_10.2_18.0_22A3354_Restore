void faiss::IndexIVFPQR::reconstruct_from_offset(faiss::IndexIVFPQR *this, uint64_t a2, uint64_t a3, float *a4)
{
  float *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  float *v12;
  float v13;
  void *__p[3];

  v4 = a4;
  faiss::IndexIVFPQ::reconstruct_from_offset(this, a2, a3, a4);
  v8 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**((_QWORD **)this + 14) + 40))(*((_QWORD *)this + 14), a2, a3);
  if (v8 < 0 || (v9 = v8, v8 >= *((_QWORD *)this + 2)))
    faiss::IndexIVFPQR::reconstruct_from_offset();
  std::vector<float>::vector(__p, *((int *)this + 2));
  faiss::ProductQuantizer::decode((_DWORD *)this + 112, *((_QWORD *)this + 75) + *((_QWORD *)this + 60) * v9, (uint64_t)__p[0]);
  v10 = *((unsigned int *)this + 2);
  v11 = __p[0];
  if ((int)v10 < 1)
  {
    if (!__p[0])
      return;
  }
  else
  {
    v12 = (float *)__p[0];
    do
    {
      v13 = *v12++;
      *v4 = v13 + *v4;
      ++v4;
      --v10;
    }
    while (v10);
  }
  __p[1] = v11;
  operator delete(v11);
}

void sub_1D4904AD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *faiss::IndexIVFPQR::merge_from(char **this, faiss::IndexIVF *lpsrc, uint64_t a3)
{
  char **v6;
  char **v7;
  char *result;
  int v9;
  std::string *v10;
  size_t size;
  void *exception;
  std::string v13;

  if (!v6)
  {
    memset(&v13, 0, sizeof(v13));
    v9 = snprintf(0, 0, "Error: '%s' failed", "other");
    std::string::resize(&v13, v9 + 1, 0);
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v10 = &v13;
    else
      v10 = (std::string *)v13.__r_.__value_.__r.__words[0];
    if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v13.__r_.__value_.__r.__words[2]);
    else
      size = v13.__r_.__value_.__l.__size_;
    snprintf((char *)v10, size, "Error: '%s' failed", "other");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v13, "virtual void faiss::IndexIVFPQR::merge_from(IndexIVF &, idx_t)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVFPQR.cpp", 206);
  }
  v7 = v6;
  faiss::IndexIVF::merge_from((faiss::IndexIVF *)this, (faiss::InvertedLists **)lpsrc, a3);
  result = std::vector<unsigned char>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>((uint64_t)(this + 75), this[76], v7[75], v7[76], v7[76] - v7[75]);
  v7[76] = v7[75];
  return result;
}

void sub_1D4904C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void faiss::IndexIVFPQR::remove_ids()
{
  void *exception;
  _QWORD v1[3];

  exception = __cxa_allocate_exception(0x20uLL);
  std::string::basic_string[abi:ne180100]<0>(v1, "not implemented");
  faiss::FaissException::FaissException(exception, v1, "virtual size_t faiss::IndexIVFPQR::remove_ids(const IDSelector &)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVFPQR.cpp", 218);
}

void sub_1D4904CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

void faiss::IndexIVFPQR::~IndexIVFPQR(faiss::IndexIVFPQR *this)
{
  faiss::IndexIVFPQR::~IndexIVFPQR(this);
  JUMPOUT(0x1D82628A4);
}

{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  *(_QWORD *)this = &off_1E98055F0;
  v2 = (void *)*((_QWORD *)this + 75);
  if (v2)
  {
    *((_QWORD *)this + 76) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 72);
  if (v3)
  {
    *((_QWORD *)this + 73) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 69);
  if (v4)
  {
    *((_QWORD *)this + 70) = v4;
    operator delete(v4);
  }
  *(_QWORD *)this = &off_1E9805298;
  free(*((void **)this + 53));
  v5 = (void *)*((_QWORD *)this + 46);
  if (v5)
  {
    *((_QWORD *)this + 47) = v5;
    operator delete(v5);
  }
  v6 = (void *)*((_QWORD *)this + 43);
  if (v6)
  {
    *((_QWORD *)this + 44) = v6;
    operator delete(v6);
  }
  faiss::IndexIVF::~IndexIVF(this);
}

char *std::vector<unsigned char>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned char *>,std::__wrap_iter<unsigned char *>>(uint64_t a1, char *__dst, char *__src, char *a4, uint64_t a5)
{
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  char *v18;
  int64_t v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  int64_t v24;
  char v25;
  char *v26;
  char *v27;
  char *v28;
  char v29;
  char *v30;
  char *v31;
  char *v32;
  char v33;
  char *v34;
  char *v35;

  v5 = __dst;
  if (a5 < 1)
    return v5;
  v6 = a5;
  v7 = __src;
  v10 = *(char **)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    v11 = *(char **)a1;
    v12 = (uint64_t)&v10[a5 - *(_QWORD *)a1];
    if (v12 < 0)
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    v13 = (char *)(__dst - v11);
    v14 = v9 - (_QWORD)v11;
    if (2 * v14 > v12)
      v12 = 2 * v14;
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL)
      v15 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v15 = v12;
    if (v15)
      v16 = operator new(v15);
    else
      v16 = 0;
    v26 = &v13[(_QWORD)v16];
    v27 = &v13[(_QWORD)v16 + v6];
    v28 = v26;
    do
    {
      v29 = *v7++;
      *v28++ = v29;
      --v6;
    }
    while (v6);
    v30 = *(char **)a1;
    if (*(char **)a1 == v5)
    {
      v32 = v26;
    }
    else
    {
      v31 = v5;
      v32 = v26;
      do
      {
        v33 = *--v31;
        *--v32 = v33;
      }
      while (v31 != v30);
      v10 = *(char **)(a1 + 8);
    }
    v34 = (char *)v16 + v15;
    if (v10 != v5)
      memmove(v27, v5, v10 - v5);
    v35 = *(char **)a1;
    *(_QWORD *)a1 = v32;
    *(_QWORD *)(a1 + 8) = &v27[v10 - v5];
    *(_QWORD *)(a1 + 16) = v34;
    if (v35)
      operator delete(v35);
    return v26;
  }
  v17 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    v18 = &__src[a5];
    v20 = *(char **)(a1 + 8);
LABEL_17:
    v21 = &v5[v6];
    v22 = &v20[-v6];
    v23 = v20;
    if (&v20[-v6] < v10)
    {
      v24 = &v10[v6] - v20;
      v23 = v20;
      do
      {
        v25 = *v22++;
        *v23++ = v25;
        --v24;
      }
      while (v24);
    }
    *(_QWORD *)(a1 + 8) = v23;
    if (v20 != v21)
      memmove(&v5[v6], v5, v20 - v21);
    if (v18 != v7)
      memmove(v5, v7, v18 - v7);
    return v5;
  }
  v18 = &__src[v17];
  v19 = a4 - &__src[v17];
  if (a4 != &__src[v17])
    memmove(*(void **)(a1 + 8), &__src[v17], a4 - &__src[v17]);
  v20 = &v10[v19];
  *(_QWORD *)(a1 + 8) = &v10[v19];
  if (v17 >= 1)
    goto LABEL_17;
  return v5;
}

void faiss::IndexIVFPQR::reconstruct_from_offset()
{
  __assert_rtn("reconstruct_from_offset", "IndexIVFPQR.cpp", 195, "0 <= id && id < ntotal");
}

uint64_t faiss::IndexFlat::IndexFlat(uint64_t result, int a2, int a3)
{
  *(_DWORD *)(result + 8) = a2;
  *(_QWORD *)(result + 16) = 0;
  *(_WORD *)(result + 24) = 256;
  *(_DWORD *)(result + 28) = a3;
  *(_DWORD *)(result + 32) = 0;
  *(_QWORD *)result = &off_1E9806E90;
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 40) = 0;
  return result;
}

{
  *(_DWORD *)(result + 8) = a2;
  *(_QWORD *)(result + 16) = 0;
  *(_WORD *)(result + 24) = 256;
  *(_DWORD *)(result + 28) = a3;
  *(_DWORD *)(result + 32) = 0;
  *(_QWORD *)result = &off_1E9806E90;
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 40) = 0;
  return result;
}

char *faiss::IndexFlat::add(faiss::IndexFlat *this, uint64_t a2, float *a3)
{
  char *result;

  result = std::vector<float>::__insert_with_size[abi:ne180100]<float const*,float const*>((uint64_t)this + 40, *((_QWORD *)this + 6), (char *)a3, (char *)&a3[*((int *)this + 2) * a2], *((int *)this + 2) * a2);
  *((_QWORD *)this + 2) += a2;
  return result;
}

_QWORD *faiss::IndexFlat::reset(_QWORD *this)
{
  this[6] = this[5];
  this[2] = 0;
  return this;
}

void faiss::IndexFlat::search(faiss::IndexFlat *this, unint64_t a2, faiss *a3, int64_t a4, float *a5, uint64_t *a6)
{
  int v7;
  int v8;
  std::string *v9;
  size_t size;
  void *exception;
  std::string v12;
  float *v13;

  if (a4 <= 0)
  {
    memset(&v12, 0, sizeof(v12));
    v8 = snprintf(0, 0, "Error: '%s' failed", "k > 0");
    std::string::resize(&v12, v8 + 1, 0);
    if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v9 = &v12;
    else
      v9 = (std::string *)v12.__r_.__value_.__r.__words[0];
    if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v12.__r_.__value_.__r.__words[2]);
    else
      size = v12.__r_.__value_.__l.__size_;
    snprintf((char *)v9, size, "Error: '%s' failed", "k > 0");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v12, "virtual void faiss::IndexFlat::search(idx_t, const float *, idx_t, float *, idx_t *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexFlat.cpp", 40);
  }
  v7 = *((_DWORD *)this + 7);
  if (v7 == 1)
  {
    v12.__r_.__value_.__r.__words[0] = a2;
    v12.__r_.__value_.__l.__size_ = a4;
    v12.__r_.__value_.__r.__words[2] = (std::string::size_type)a6;
    v13 = a5;
    faiss::knn_L2sqr(a3, *((faiss **)this + 5), *((int *)this + 2), a2, *((_QWORD *)this + 2), (int8x16_t *)&v12, 0);
  }
  else
  {
    v12.__r_.__value_.__r.__words[0] = a2;
    v12.__r_.__value_.__l.__size_ = a4;
    v12.__r_.__value_.__r.__words[2] = (std::string::size_type)a6;
    v13 = a5;
    if (v7)
      faiss::knn_extra_metrics((uint64_t)a3, *((float **)this + 5), *((int *)this + 2), a2, *((_QWORD *)this + 2), v7, &v12, *((float *)this + 8));
    else
      faiss::knn_inner_product((uint64_t)a3, *((float **)this + 5), *((int *)this + 2), a2, *((_QWORD *)this + 2), (int8x16_t *)&v12);
  }
}

void sub_1D49051DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void *v16;

  __cxa_free_exception(v16);
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t faiss::IndexFlat::range_search(faiss::IndexFlat *this, unint64_t a2, faiss *a3, float a4, faiss::RangeSearchResult *a5, uint64_t a6, uint64_t a7, faiss::RangeSearchResult *a8)
{
  int v8;
  void *exception;
  _QWORD v11[3];

  v8 = *((_DWORD *)this + 7);
  if (v8 == 1)
    return faiss::range_search_L2sqr(a3, *((faiss **)this + 5), *((int *)this + 2), a2, *((_QWORD *)this + 2), a5, a4, a8);
  if (v8)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v11, "metric type not supported");
    faiss::FaissException::FaissException(exception, v11, "virtual void faiss::IndexFlat::range_search(idx_t, const float *, float, RangeSearchResult *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexFlat.cpp", 71);
  }
  return faiss::range_search_inner_product(a3, *((float **)this + 5), *((int *)this + 2), a2, *((_QWORD *)this + 2), a5, a4, a8);
}

void sub_1D49052E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

void faiss::IndexFlat::compute_distance_subset(faiss::IndexFlat *this, uint64_t a2, float *a3, uint64_t a4, faiss *a5, const float *a6)
{
  int v6;
  void *exception;
  _QWORD v8[3];

  v6 = *((_DWORD *)this + 7);
  if (v6 == 1)
  {
    faiss::fvec_L2sqr_by_idx(a5, a3, *((const float **)this + 5), a6, *((int *)this + 2), a2, a4);
  }
  else
  {
    if (v6)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(v8, "metric type not supported");
      faiss::FaissException::FaissException(exception, v8, "void faiss::IndexFlat::compute_distance_subset(idx_t, const float *, idx_t, float *, const idx_t *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexFlat.cpp", 90);
    }
    faiss::fvec_inner_products_by_idx(a5, a3, *((const float **)this + 5), a6, *((int *)this + 2), a2, a4);
  }
}

void sub_1D4905410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

uint64_t faiss::IndexFlat::remove_ids(uint64_t a1, uint64_t (***a2)(_QWORD, uint64_t))
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3 < 1)
  {
    v6 = 0;
  }
  else
  {
    v5 = 0;
    v6 = 0;
    do
    {
      if (((**a2)(a2, v5) & 1) == 0)
      {
        if (v5 > v6)
          memmove((void *)(*(_QWORD *)(a1 + 40) + 4 * v6 * *(int *)(a1 + 8)), (const void *)(*(_QWORD *)(a1 + 40) + 4 * v5 * *(int *)(a1 + 8)), 4 * *(int *)(a1 + 8));
        ++v6;
      }
      ++v5;
      v3 = *(_QWORD *)(a1 + 16);
    }
    while (v5 < v3);
  }
  v7 = v3 - v6;
  if (v3 != v6)
  {
    *(_QWORD *)(a1 + 16) = v6;
    std::vector<float>::resize(a1 + 40, v6 * *(int *)(a1 + 8));
  }
  return v7;
}

_QWORD *faiss::IndexFlat::get_distance_computer(faiss::IndexFlat *this)
{
  int v2;
  _QWORD *result;
  uint64_t (**v4)(faiss::_anonymous_namespace_::FlatL2Dis *__hidden, const float *);
  uint64_t v5;

  v2 = *((_DWORD *)this + 7);
  if (!v2)
  {
    result = (_QWORD *)operator new();
    v4 = &off_1E9805D68;
    goto LABEL_5;
  }
  if (v2 == 1)
  {
    result = (_QWORD *)operator new();
    v4 = &off_1E9805DA0;
LABEL_5:
    v5 = *((int *)this + 2);
    *result = v4;
    result[1] = v5;
    result[2] = *((_QWORD *)this + 2);
    result[3] = 0;
    result[4] = *((_QWORD *)this + 5);
    result[5] = 0;
    return result;
  }
  return (_QWORD *)faiss::get_extra_distance_computer(*((int *)this + 2), v2, *((_QWORD *)this + 2), *((_QWORD *)this + 5), *((float *)this + 8));
}

void *faiss::IndexFlat::reconstruct(faiss::IndexFlat *this, uint64_t a2, float *__dst)
{
  return memcpy(__dst, (const void *)(*((_QWORD *)this + 5) + 4 * *((int *)this + 2) * a2), 4 * *((int *)this + 2));
}

uint64_t faiss::IndexFlat::sa_code_size(faiss::IndexFlat *this)
{
  return 4 * *((int *)this + 2);
}

void *faiss::IndexFlat::sa_encode(faiss::IndexFlat *this, uint64_t a2, const float *__src, unsigned __int8 *__dst)
{
  return memcpy(__dst, __src, 4 * a2 * *((int *)this + 2));
}

void *faiss::IndexFlat::sa_decode(faiss::IndexFlat *this, uint64_t a2, const unsigned __int8 *__src, float *__dst)
{
  return memcpy(__dst, __src, 4 * a2 * *((int *)this + 2));
}

uint64_t faiss::IndexFlat1D::IndexFlat1D(uint64_t this, char a2)
{
  *(_DWORD *)(this + 8) = 1;
  *(_QWORD *)(this + 16) = 0;
  *(_WORD *)(this + 24) = 256;
  *(_QWORD *)(this + 28) = 1;
  *(_QWORD *)(this + 48) = 0;
  *(_QWORD *)(this + 56) = 0;
  *(_QWORD *)(this + 40) = 0;
  *(_QWORD *)this = &off_1E98053F8;
  *(_BYTE *)(this + 64) = a2;
  *(_QWORD *)(this + 80) = 0;
  *(_QWORD *)(this + 88) = 0;
  *(_QWORD *)(this + 72) = 0;
  return this;
}

{
  *(_DWORD *)(this + 8) = 1;
  *(_QWORD *)(this + 16) = 0;
  *(_WORD *)(this + 24) = 256;
  *(_QWORD *)(this + 28) = 1;
  *(_QWORD *)(this + 48) = 0;
  *(_QWORD *)(this + 56) = 0;
  *(_QWORD *)(this + 40) = 0;
  *(_QWORD *)this = &off_1E98053F8;
  *(_BYTE *)(this + 64) = a2;
  *(_QWORD *)(this + 80) = 0;
  *(_QWORD *)(this + 88) = 0;
  *(_QWORD *)(this + 72) = 0;
  return this;
}

uint64_t faiss::IndexFlat1D::update_permutation(faiss::IndexFlat1D *this)
{
  unint64_t *v2;
  int64_t v3;
  uint64_t v4;
  const float *v5;

  std::vector<long long>::resize((uint64_t)this + 72, *((_QWORD *)this + 2));
  v3 = *((_QWORD *)this + 2);
  v4 = *((_QWORD *)this + 5);
  v5 = (const float *)*((_QWORD *)this + 9);
  if (v3 > 999999)
    faiss::fvec_argsort_parallel(v3, v4, v5, v2);
  return faiss::fvec_argsort(v3, v4, v5, v2);
}

char *faiss::IndexFlat1D::add(faiss::IndexFlat1D *this, uint64_t a2, float *a3)
{
  char *result;

  result = std::vector<float>::__insert_with_size[abi:ne180100]<float const*,float const*>((uint64_t)this + 40, *((_QWORD *)this + 6), (char *)a3, (char *)&a3[*((int *)this + 2) * a2], *((int *)this + 2) * a2);
  *((_QWORD *)this + 2) += a2;
  if (*((_BYTE *)this + 64))
    return (char *)faiss::IndexFlat1D::update_permutation(this);
  return result;
}

_QWORD *faiss::IndexFlat1D::reset(_QWORD *this)
{
  this[6] = this[5];
  this[2] = 0;
  this[10] = this[9];
  return this;
}

_QWORD *faiss::IndexFlat1D::search(_QWORD *this, uint64_t a2, const float *a3, uint64_t a4, float *a5, uint64_t *a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  float v22;
  uint64_t v24;
  float v25;
  int v26;
  std::string *v27;
  size_t size;
  void *exception;
  int v30;
  std::string *v31;
  size_t v32;
  void *v33;
  std::string v34;

  if (a4 <= 0)
  {
    memset(&v34, 0, sizeof(v34));
    v26 = snprintf(0, 0, "Error: '%s' failed", "k > 0");
    std::string::resize(&v34, v26 + 1, 0);
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v27 = &v34;
    else
      v27 = (std::string *)v34.__r_.__value_.__r.__words[0];
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v34.__r_.__value_.__r.__words[2]);
    else
      size = v34.__r_.__value_.__l.__size_;
    snprintf((char *)v27, size, "Error: '%s' failed", "k > 0");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v34, "virtual void faiss::IndexFlat1D::search(idx_t, const float *, idx_t, float *, idx_t *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexFlat.cpp", 237);
  }
  v6 = (_QWORD *)this[9];
  if (this[2] != (uint64_t)(this[10] - (_QWORD)v6) >> 3)
  {
    memset(&v34, 0, sizeof(v34));
    v30 = snprintf(0, 0, "Error: '%s' failed: Call update_permutation before search", "perm.size() == ntotal");
    std::string::resize(&v34, v30 + 1, 0);
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v31 = &v34;
    else
      v31 = (std::string *)v34.__r_.__value_.__r.__words[0];
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v32 = HIBYTE(v34.__r_.__value_.__r.__words[2]);
    else
      v32 = v34.__r_.__value_.__l.__size_;
    snprintf((char *)v31, v32, "Error: '%s' failed: Call update_permutation before search", "perm.size() == ntotal");
    v33 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v33, &v34, "virtual void faiss::IndexFlat1D::search(idx_t, const float *, idx_t, float *, idx_t *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexFlat.cpp", 240);
  }
  if (a2 >= 1)
  {
    v7 = 0;
    v8 = this[5];
    do
    {
      v9 = a3[v7];
      if (*(float *)(v8 + 4 * *v6) <= v9)
      {
        v10 = this[2];
        v14 = v10 - 1;
        if (*(float *)(v8 + 4 * v6[v10 - 1]) > v9)
        {
          if (v10 < 2)
          {
            v14 = 0;
          }
          else
          {
            v14 = 0;
            do
            {
              v15 = v10 + v14;
              if (v10 + v14 < 0 != __OFADD__(v10, v14))
                ++v15;
              v16 = v15 >> 1;
              if (*(float *)(v8 + 4 * v6[v16]) > v9)
                v10 = v16;
              else
                v14 = v16;
            }
            while (v14 + 1 < v10);
          }
          v18 = 0;
          while (1)
          {
            v19 = v6[v14];
            v20 = v6[v10];
            v21 = v9 - *(float *)(v8 + 4 * v19);
            v22 = *(float *)(v8 + 4 * v20) - v9;
            if (v21 >= v22)
            {
              a5[v18] = v22;
              a6[v18] = v20;
              if (++v10 >= this[2])
              {
                v17 = v18 + 1;
                goto LABEL_34;
              }
            }
            else
            {
              a5[v18] = v21;
              a6[v18] = v19;
              if (v14-- < 1)
              {
                v11 = v18 + 1;
                goto LABEL_7;
              }
            }
            if (++v18 >= a4)
              goto LABEL_39;
          }
        }
        v17 = 0;
LABEL_34:
        if (v17 < a4)
        {
          do
          {
            if (v14 < 0)
            {
              v24 = -1;
              v25 = INFINITY;
            }
            else
            {
              v24 = v6[v14];
              v25 = v9 - *(float *)(v8 + 4 * v24);
              --v14;
            }
            a5[v17] = v25;
            a6[v17++] = v24;
          }
          while (a4 != v17);
        }
      }
      else
      {
        v10 = 0;
        v11 = 0;
LABEL_7:
        if (v11 < a4)
        {
          do
          {
            if (v10 >= this[2])
            {
              v12 = -1;
              v13 = INFINITY;
            }
            else
            {
              v12 = v6[v10];
              v13 = *(float *)(v8 + 4 * v12) - v9;
              ++v10;
            }
            a5[v11] = v13;
            a6[v11++] = v12;
          }
          while (a4 != v11);
        }
      }
LABEL_39:
      ++v7;
      a6 += a4;
      a5 += a4;
    }
    while (v7 != a2);
  }
  return this;
}

void sub_1D4905A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void faiss::IndexFlat::~IndexFlat(faiss::IndexFlat *this)
{
  void *v2;

  *(_QWORD *)this = &off_1E9806E90;
  v2 = (void *)*((_QWORD *)this + 5);
  if (v2)
  {
    *((_QWORD *)this + 6) = v2;
    operator delete(v2);
  }
  faiss::Index::~Index(this);
}

{
  void *v2;

  *(_QWORD *)this = &off_1E9806E90;
  v2 = (void *)*((_QWORD *)this + 5);
  if (v2)
  {
    *((_QWORD *)this + 6) = v2;
    operator delete(v2);
  }
  faiss::Index::~Index(this);
  JUMPOUT(0x1D82628A4);
}

void faiss::IndexFlat1D::~IndexFlat1D(faiss::IndexFlat1D *this)
{
  void *v2;
  void *v3;

  *(_QWORD *)this = &off_1E98053F8;
  v2 = (void *)*((_QWORD *)this + 9);
  if (v2)
  {
    *((_QWORD *)this + 10) = v2;
    operator delete(v2);
  }
  *(_QWORD *)this = &off_1E9806E90;
  v3 = (void *)*((_QWORD *)this + 5);
  if (v3)
  {
    *((_QWORD *)this + 6) = v3;
    operator delete(v3);
  }
  faiss::Index::~Index(this);
}

{
  void *v2;
  void *v3;

  *(_QWORD *)this = &off_1E98053F8;
  v2 = (void *)*((_QWORD *)this + 9);
  if (v2)
  {
    *((_QWORD *)this + 10) = v2;
    operator delete(v2);
  }
  *(_QWORD *)this = &off_1E9806E90;
  v3 = (void *)*((_QWORD *)this + 5);
  if (v3)
  {
    *((_QWORD *)this + 6) = v3;
    operator delete(v3);
  }
  faiss::Index::~Index(this);
  JUMPOUT(0x1D82628A4);
}

uint64_t faiss::`anonymous namespace'::FlatL2Dis::set_query(uint64_t this, const float *a2)
{
  *(_QWORD *)(this + 24) = a2;
  return this;
}

float faiss::`anonymous namespace'::FlatL2Dis::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  ++*(_QWORD *)(a1 + 40);
  return faiss::fvec_L2sqr(*(faiss **)(a1 + 24), (const float *)(v2 + 4 * *(_QWORD *)(a1 + 8) * a2), *(_QWORD *)(a1 + 8));
}

float faiss::`anonymous namespace'::FlatL2Dis::symmetric_dis(faiss::_anonymous_namespace_::FlatL2Dis *this, uint64_t a2, uint64_t a3)
{
  return faiss::fvec_L2sqr((faiss *)(*((_QWORD *)this + 4) + 4 * *((_QWORD *)this + 1) * a3), (const float *)(*((_QWORD *)this + 4) + 4 * *((_QWORD *)this + 1) * a2), *((_QWORD *)this + 1));
}

void faiss::`anonymous namespace'::FlatL2Dis::~FlatL2Dis(faiss::_anonymous_namespace_::FlatL2Dis *this)
{
  JUMPOUT(0x1D82628A4);
}

uint64_t faiss::`anonymous namespace'::FlatIPDis::set_query(uint64_t this, const float *a2)
{
  *(_QWORD *)(this + 24) = a2;
  return this;
}

float faiss::`anonymous namespace'::FlatIPDis::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  ++*(_QWORD *)(a1 + 40);
  return faiss::fvec_inner_product(*(faiss **)(a1 + 24), (const float *)(v2 + 4 * *(_QWORD *)(a1 + 8) * a2), *(_QWORD *)(a1 + 8));
}

float faiss::`anonymous namespace'::FlatIPDis::symmetric_dis(faiss::_anonymous_namespace_::FlatIPDis *this, uint64_t a2, uint64_t a3)
{
  return faiss::fvec_inner_product((faiss *)(*((_QWORD *)this + 4) + 4 * *((_QWORD *)this + 1) * a3), (const float *)(*((_QWORD *)this + 4) + 4 * *((_QWORD *)this + 1) * a2), *((_QWORD *)this + 1));
}

void faiss::`anonymous namespace'::FlatIPDis::~FlatIPDis(faiss::_anonymous_namespace_::FlatIPDis *this)
{
  JUMPOUT(0x1D82628A4);
}

char *std::vector<float>::__insert_with_size[abi:ne180100]<float const*,float const*>(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  char *v5;
  char *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int64_t v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  int v27;
  char *v28;
  uint64_t v29;
  char *v30;
  int v31;
  void *__p;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;

  v5 = (char *)__dst;
  if (a5 < 1)
    return v5;
  v7 = __src;
  v11 = *(_QWORD *)(a1 + 16);
  v9 = a1 + 16;
  v10 = v11;
  v12 = *(_QWORD *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 2)
  {
    v13 = *(void **)a1;
    v14 = a5 + ((uint64_t)(v12 - *(_QWORD *)a1) >> 2);
    if (v14 >> 62)
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    v15 = (__dst - (uint64_t)v13) >> 2;
    v16 = v10 - (_QWORD)v13;
    if (v16 >> 1 > v14)
      v14 = v16 >> 1;
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL)
      v17 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v17 = v14;
    v37 = v9;
    if (v17)
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v9, v17);
    else
      v18 = 0;
    v28 = &v18[4 * v15];
    __p = v18;
    v34 = v28;
    v36 = &v18[4 * v17];
    v29 = 4 * a5;
    v30 = &v28[4 * a5];
    do
    {
      v31 = *(_DWORD *)v7;
      v7 += 4;
      *(_DWORD *)v28 = v31;
      v28 += 4;
      v29 -= 4;
    }
    while (v29);
    v35 = v30;
    v5 = std::vector<float>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34)
      v35 += (v34 - v35 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    if (__p)
      operator delete(__p);
    return v5;
  }
  v19 = v12 - __dst;
  v20 = (uint64_t)(v12 - __dst) >> 2;
  if (v20 >= a5)
  {
    v21 = &__src[4 * a5];
    v23 = *(char **)(v9 - 8);
LABEL_17:
    v24 = &v5[4 * a5];
    v25 = &v23[-4 * a5];
    v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      v26 = v23;
      do
      {
        v27 = *(_DWORD *)v25;
        v25 += 4;
        *(_DWORD *)v26 = v27;
        v26 += 4;
      }
      while ((unint64_t)v25 < v12);
    }
    *(_QWORD *)(a1 + 8) = v26;
    if (v23 != v24)
      memmove(&v23[-4 * ((v23 - v24) >> 2)], v5, v23 - v24);
    if (v21 != v7)
      memmove(v5, v7, v21 - v7);
    return v5;
  }
  v21 = &__src[4 * v20];
  v22 = a4 - v21;
  if (a4 != v21)
    memmove(*(void **)(v9 - 8), &__src[4 * v20], a4 - v21);
  v23 = (char *)(v12 + v22);
  *(_QWORD *)(a1 + 8) = v12 + v22;
  if (v19 >= 1)
    goto LABEL_17;
  return v5;
}

void sub_1D4905E9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  int v9;
  _BYTE *v10;
  uint64_t v11;
  int64_t v12;
  char *v13;
  void *v14;
  void *v15;

  v5 = *(char **)(a2 + 8);
  v6 = (char *)*a1;
  v7 = v5;
  if (*a1 != __src)
  {
    v8 = __src;
    v7 = *(char **)(a2 + 8);
    do
    {
      v9 = *((_DWORD *)v8 - 1);
      v8 -= 4;
      *((_DWORD *)v7 - 1) = v9;
      v7 -= 4;
    }
    while (v8 != v6);
  }
  *(_QWORD *)(a2 + 8) = v7;
  v10 = a1[1];
  v11 = *(_QWORD *)(a2 + 16);
  v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    v7 = *(char **)(a2 + 8);
  }
  *(_QWORD *)(a2 + 16) = v11 + v12;
  v13 = (char *)*a1;
  *a1 = v7;
  *(_QWORD *)(a2 + 8) = v13;
  v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = v14;
  v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(_QWORD *)(a2 + 24) = v15;
  *(_QWORD *)a2 = *(_QWORD *)(a2 + 8);
  return v5;
}

uint64_t faiss::read_VectorTransform(faiss *this, faiss::IOReader *a2)
{
  uint64_t v3;
  const char *v4;
  int v5;
  const char *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  const char *v12;
  uint64_t v13;
  __n128 v14;
  int v15;
  const char *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  const char *v31;
  const char *v32;
  int *v33;
  char *v34;
  int v35;
  std::string *v36;
  size_t size;
  int *v38;
  char *v39;
  void *exception;
  uint64_t v41;
  const char *v42;
  const char *v43;
  int *v44;
  char *v45;
  int v46;
  std::string *v47;
  size_t v48;
  int *v49;
  char *v50;
  void *v51;
  uint64_t v52;
  const char *v53;
  const char *v54;
  int *v55;
  char *v56;
  int v57;
  std::string *v58;
  size_t v59;
  int *v60;
  char *v61;
  void *v62;
  uint64_t v63;
  const char *v64;
  const char *v65;
  int *v66;
  char *v67;
  int v68;
  std::string *v69;
  size_t v70;
  int *v71;
  char *v72;
  void *v73;
  uint64_t v74;
  const char *v75;
  const char *v76;
  int *v77;
  char *v78;
  int v79;
  std::string *v80;
  size_t v81;
  int *v82;
  char *v83;
  void *v84;
  uint64_t v85;
  const char *v86;
  const char *v87;
  int *v88;
  char *v89;
  int v90;
  std::string *v91;
  size_t v92;
  int *v93;
  char *v94;
  void *v95;
  int v96;
  std::string *v97;
  size_t v98;
  void *v99;
  uint64_t v100;
  const char *v101;
  const char *v102;
  int *v103;
  char *v104;
  int v105;
  std::string *v106;
  size_t v107;
  unint64_t v108;
  int *v109;
  char *v110;
  void *v111;
  uint64_t v112;
  const char *v113;
  const char *v114;
  int *v115;
  char *v116;
  int v117;
  std::string *v118;
  size_t v119;
  int *v120;
  char *v121;
  void *v122;
  int v123;
  std::string *v124;
  size_t v125;
  void *v126;
  uint64_t v127;
  const char *v128;
  const char *v129;
  int *v130;
  char *v131;
  int v132;
  std::string *v133;
  size_t v134;
  unint64_t v135;
  int *v136;
  char *v137;
  void *v138;
  int v139;
  std::string *v140;
  size_t v141;
  void *v142;
  int v143;
  std::string *v144;
  size_t v145;
  void *v146;
  unint64_t v147;
  std::string v148;
  int v149;

  v149 = 0;
  v3 = (**(uint64_t (***)(faiss *, int *, uint64_t, uint64_t))this)(this, &v149, 4, 1);
  if (v3 != 1)
  {
    v30 = v3;
    memset(&v148, 0, sizeof(v148));
    v31 = (char *)this + 8;
    v32 = (char *)this + 8;
    if (*((char *)this + 31) < 0)
      v32 = *(const char **)v31;
    v33 = __error();
    v34 = strerror(*v33);
    v35 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v32, v30, 1uLL, v34);
    v36 = &v148;
    std::string::resize(&v148, v35 + 1, 0);
    if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      size = HIBYTE(v148.__r_.__value_.__r.__words[2]);
    }
    else
    {
      size = v148.__r_.__value_.__l.__size_;
      v36 = (std::string *)v148.__r_.__value_.__r.__words[0];
    }
    if (*((char *)this + 31) < 0)
      v31 = *(const char **)v31;
    v38 = __error();
    v39 = strerror(*v38);
    snprintf((char *)v36, size, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v31, v30, 1uLL, v39);
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v148, "VectorTransform *faiss::read_VectorTransform(IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 77);
  }
  v5 = v149;
  if (v5 == faiss::fourcc((faiss *)"rrot", v4)
    || (v7 = v149, v7 == faiss::fourcc((faiss *)"PCAm", v6))
    || (v8 = v149, v8 == faiss::fourcc((faiss *)"LTra", v6))
    || (v9 = v149, v9 == faiss::fourcc((faiss *)"PcAm", v6))
    || (v10 = v149, v10 == faiss::fourcc((faiss *)"Viqm", v6)))
  {
    v11 = v149;
    if (v11 == faiss::fourcc((faiss *)"rrot", v6))
    {
      v13 = operator new();
      v14.n128_f64[0] = faiss::LinearTransform::LinearTransform((faiss::LinearTransform *)v13, 0, 0, 0);
      *(_QWORD *)v13 = &off_1E9806958;
    }
    else
    {
      v15 = v149;
      if (v15 == faiss::fourcc((faiss *)"PCAm", v12)
        || (v17 = v149, v17 == faiss::fourcc((faiss *)"PcAm", v16)))
      {
        v13 = operator new();
        faiss::PCAMatrix::PCAMatrix(v13, 0, 0, 0.0, 0);
      }
      else
      {
        v13 = 0;
      }
    }
    v18 = (**(uint64_t (***)(faiss *, uint64_t, uint64_t, uint64_t, __n128))this)(this, v13 + 17, 1, 1, v14);
    if (v18 != 1)
    {
      v74 = v18;
      memset(&v148, 0, sizeof(v148));
      v75 = (char *)this + 8;
      v76 = (char *)this + 8;
      if (*((char *)this + 31) < 0)
        v76 = *(const char **)v75;
      v77 = __error();
      v78 = strerror(*v77);
      v79 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v76, v74, 1uLL, v78);
      v80 = &v148;
      std::string::resize(&v148, v79 + 1, 0);
      if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v81 = HIBYTE(v148.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v81 = v148.__r_.__value_.__l.__size_;
        v80 = (std::string *)v148.__r_.__value_.__r.__words[0];
      }
      if (*((char *)this + 31) < 0)
        v75 = *(const char **)v75;
      v82 = __error();
      v83 = strerror(*v82);
      snprintf((char *)v80, v81, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v75, v74, 1uLL, v83);
      v84 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v84, &v148, "VectorTransform *faiss::read_VectorTransform(IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 97);
    }
    v147 = 0;
    v19 = (**(uint64_t (***)(faiss *, unint64_t *, uint64_t, uint64_t))this)(this, &v147, 8, 1);
    if (v19 != 1)
    {
      v85 = v19;
      memset(&v148, 0, sizeof(v148));
      v86 = (char *)this + 8;
      v87 = (char *)this + 8;
      if (*((char *)this + 31) < 0)
        v87 = *(const char **)v86;
      v88 = __error();
      v89 = strerror(*v88);
      v90 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v87, v85, 1uLL, v89);
      v91 = &v148;
      std::string::resize(&v148, v90 + 1, 0);
      if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v92 = HIBYTE(v148.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v92 = v148.__r_.__value_.__l.__size_;
        v91 = (std::string *)v148.__r_.__value_.__r.__words[0];
      }
      if (*((char *)this + 31) < 0)
        v86 = *(const char **)v86;
      v93 = __error();
      v94 = strerror(*v93);
      snprintf((char *)v91, v92, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v86, v85, 1uLL, v94);
      v95 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v95, &v148, "VectorTransform *faiss::read_VectorTransform(IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 98);
    }
    if (v147 >> 40)
    {
      memset(&v148, 0, sizeof(v148));
      v96 = snprintf(0, 0, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
      std::string::resize(&v148, v96 + 1, 0);
      if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v97 = &v148;
      else
        v97 = (std::string *)v148.__r_.__value_.__r.__words[0];
      if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v98 = HIBYTE(v148.__r_.__value_.__r.__words[2]);
      else
        v98 = v148.__r_.__value_.__l.__size_;
      snprintf((char *)v97, v98, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
      v99 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v99, &v148, "VectorTransform *faiss::read_VectorTransform(IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 98);
    }
    std::vector<float>::resize(v13 + 24, v147);
    v20 = (**(uint64_t (***)(faiss *, _QWORD, uint64_t, unint64_t))this)(this, *(_QWORD *)(v13 + 24), 4, v147);
    v21 = v147;
    if (v20 != v147)
    {
      v100 = v20;
      memset(&v148, 0, sizeof(v148));
      v101 = (char *)this + 8;
      v102 = (char *)this + 8;
      if (*((char *)this + 31) < 0)
        v102 = *(const char **)v101;
      v103 = __error();
      v104 = strerror(*v103);
      v105 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v102, v100, v21, v104);
      v106 = &v148;
      std::string::resize(&v148, v105 + 1, 0);
      if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v107 = HIBYTE(v148.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v107 = v148.__r_.__value_.__l.__size_;
        v106 = (std::string *)v148.__r_.__value_.__r.__words[0];
      }
      if (*((char *)this + 31) < 0)
        v101 = *(const char **)v101;
      v108 = v147;
      v109 = __error();
      v110 = strerror(*v109);
      snprintf((char *)v106, v107, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v101, v100, v108, v110);
      v111 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v111, &v148, "VectorTransform *faiss::read_VectorTransform(IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 98);
    }
    v147 = 0;
    v22 = (**(uint64_t (***)(faiss *, unint64_t *, uint64_t, uint64_t))this)(this, &v147, 8, 1);
    if (v22 != 1)
    {
      v112 = v22;
      memset(&v148, 0, sizeof(v148));
      v113 = (char *)this + 8;
      v114 = (char *)this + 8;
      if (*((char *)this + 31) < 0)
        v114 = *(const char **)v113;
      v115 = __error();
      v116 = strerror(*v115);
      v117 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v114, v112, 1uLL, v116);
      v118 = &v148;
      std::string::resize(&v148, v117 + 1, 0);
      if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v119 = HIBYTE(v148.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v119 = v148.__r_.__value_.__l.__size_;
        v118 = (std::string *)v148.__r_.__value_.__r.__words[0];
      }
      if (*((char *)this + 31) < 0)
        v113 = *(const char **)v113;
      v120 = __error();
      v121 = strerror(*v120);
      snprintf((char *)v118, v119, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v113, v112, 1uLL, v121);
      v122 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v122, &v148, "VectorTransform *faiss::read_VectorTransform(IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 99);
    }
    if (v147 >> 40)
    {
      memset(&v148, 0, sizeof(v148));
      v123 = snprintf(0, 0, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
      std::string::resize(&v148, v123 + 1, 0);
      if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v124 = &v148;
      else
        v124 = (std::string *)v148.__r_.__value_.__r.__words[0];
      if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v125 = HIBYTE(v148.__r_.__value_.__r.__words[2]);
      else
        v125 = v148.__r_.__value_.__l.__size_;
      snprintf((char *)v124, v125, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
      v126 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v126, &v148, "VectorTransform *faiss::read_VectorTransform(IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 99);
    }
    std::vector<float>::resize(v13 + 48, v147);
    v23 = (**(uint64_t (***)(faiss *, _QWORD, uint64_t, unint64_t))this)(this, *(_QWORD *)(v13 + 48), 4, v147);
    v24 = v147;
    if (v23 != v147)
    {
      v127 = v23;
      memset(&v148, 0, sizeof(v148));
      v128 = (char *)this + 8;
      v129 = (char *)this + 8;
      if (*((char *)this + 31) < 0)
        v129 = *(const char **)v128;
      v130 = __error();
      v131 = strerror(*v130);
      v132 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v129, v127, v24, v131);
      v133 = &v148;
      std::string::resize(&v148, v132 + 1, 0);
      if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v134 = HIBYTE(v148.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v134 = v148.__r_.__value_.__l.__size_;
        v133 = (std::string *)v148.__r_.__value_.__r.__words[0];
      }
      if (*((char *)this + 31) < 0)
        v128 = *(const char **)v128;
      v135 = v147;
      v136 = __error();
      v137 = strerror(*v136);
      snprintf((char *)v133, v134, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v128, v127, v135, v137);
      v138 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v138, &v148, "VectorTransform *faiss::read_VectorTransform(IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 99);
    }
    v25 = *(int *)(v13 + 12);
    if ((int)v25 * (uint64_t)*(int *)(v13 + 8) > (unint64_t)((uint64_t)(*(_QWORD *)(v13 + 32)
                                                                            - *(_QWORD *)(v13 + 24)) >> 2))
    {
      memset(&v148, 0, sizeof(v148));
      v139 = snprintf(0, 0, "Error: '%s' failed", "lt->A.size() >= lt->d_in * lt->d_out");
      std::string::resize(&v148, v139 + 1, 0);
      if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v140 = &v148;
      else
        v140 = (std::string *)v148.__r_.__value_.__r.__words[0];
      if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v141 = HIBYTE(v148.__r_.__value_.__r.__words[2]);
      else
        v141 = v148.__r_.__value_.__l.__size_;
      snprintf((char *)v140, v141, "Error: '%s' failed", "lt->A.size() >= lt->d_in * lt->d_out");
      v142 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v142, &v148, "VectorTransform *faiss::read_VectorTransform(IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 100);
    }
    if (*(_BYTE *)(v13 + 17) && v25 > (uint64_t)(*(_QWORD *)(v13 + 56) - *(_QWORD *)(v13 + 48)) >> 2)
    {
      memset(&v148, 0, sizeof(v148));
      v143 = snprintf(0, 0, "Error: '%s' failed", "!lt->have_bias || lt->b.size() >= lt->d_out");
      std::string::resize(&v148, v143 + 1, 0);
      if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v144 = &v148;
      else
        v144 = (std::string *)v148.__r_.__value_.__r.__words[0];
      if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v145 = HIBYTE(v148.__r_.__value_.__r.__words[2]);
      else
        v145 = v148.__r_.__value_.__l.__size_;
      snprintf((char *)v144, v145, "Error: '%s' failed", "!lt->have_bias || lt->b.size() >= lt->d_out");
      v146 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v146, &v148, "VectorTransform *faiss::read_VectorTransform(IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 101);
    }
    faiss::LinearTransform::set_is_orthonormal((faiss::LinearTransform *)v13);
  }
  else
  {
    v13 = 0;
  }
  v26 = (**(uint64_t (***)(faiss *, uint64_t, uint64_t, uint64_t))this)(this, v13 + 8, 4, 1);
  if (v26 != 1)
  {
    v41 = v26;
    memset(&v148, 0, sizeof(v148));
    v42 = (char *)this + 8;
    v43 = (char *)this + 8;
    if (*((char *)this + 31) < 0)
      v43 = *(const char **)v42;
    v44 = __error();
    v45 = strerror(*v44);
    v46 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v43, v41, 1uLL, v45);
    v47 = &v148;
    std::string::resize(&v148, v46 + 1, 0);
    if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      v48 = HIBYTE(v148.__r_.__value_.__r.__words[2]);
    }
    else
    {
      v48 = v148.__r_.__value_.__l.__size_;
      v47 = (std::string *)v148.__r_.__value_.__r.__words[0];
    }
    if (*((char *)this + 31) < 0)
      v42 = *(const char **)v42;
    v49 = __error();
    v50 = strerror(*v49);
    snprintf((char *)v47, v48, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v42, v41, 1uLL, v50);
    v51 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v51, &v148, "VectorTransform *faiss::read_VectorTransform(IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 105);
  }
  v27 = (**(uint64_t (***)(faiss *, uint64_t, uint64_t, uint64_t))this)(this, v13 + 12, 4, 1);
  if (v27 != 1)
  {
    v52 = v27;
    memset(&v148, 0, sizeof(v148));
    v53 = (char *)this + 8;
    v54 = (char *)this + 8;
    if (*((char *)this + 31) < 0)
      v54 = *(const char **)v53;
    v55 = __error();
    v56 = strerror(*v55);
    v57 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v54, v52, 1uLL, v56);
    v58 = &v148;
    std::string::resize(&v148, v57 + 1, 0);
    if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      v59 = HIBYTE(v148.__r_.__value_.__r.__words[2]);
    }
    else
    {
      v59 = v148.__r_.__value_.__l.__size_;
      v58 = (std::string *)v148.__r_.__value_.__r.__words[0];
    }
    if (*((char *)this + 31) < 0)
      v53 = *(const char **)v53;
    v60 = __error();
    v61 = strerror(*v60);
    snprintf((char *)v58, v59, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v53, v52, 1uLL, v61);
    v62 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v62, &v148, "VectorTransform *faiss::read_VectorTransform(IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 106);
  }
  v28 = (**(uint64_t (***)(faiss *, uint64_t, uint64_t, uint64_t))this)(this, v13 + 16, 1, 1);
  if (v28 != 1)
  {
    v63 = v28;
    memset(&v148, 0, sizeof(v148));
    v64 = (char *)this + 8;
    v65 = (char *)this + 8;
    if (*((char *)this + 31) < 0)
      v65 = *(const char **)v64;
    v66 = __error();
    v67 = strerror(*v66);
    v68 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v65, v63, 1uLL, v67);
    v69 = &v148;
    std::string::resize(&v148, v68 + 1, 0);
    if ((v148.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      v70 = HIBYTE(v148.__r_.__value_.__r.__words[2]);
    }
    else
    {
      v70 = v148.__r_.__value_.__l.__size_;
      v69 = (std::string *)v148.__r_.__value_.__r.__words[0];
    }
    if (*((char *)this + 31) < 0)
      v64 = *(const char **)v64;
    v71 = __error();
    v72 = strerror(*v71);
    snprintf((char *)v69, v70, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v64, v63, 1uLL, v72);
    v73 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v73, &v148, "VectorTransform *faiss::read_VectorTransform(IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 107);
  }
  return v13;
}

void sub_1D4906EB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  void *v20;

  __cxa_free_exception(v20);
  if (a20 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

faiss::ArrayInvertedLists *faiss::read_InvertedLists(faiss *this, faiss::IOReader *a2)
{
  char v2;
  uint64_t v4;
  const char *v5;
  int v6;
  const char *v7;
  faiss::ArrayInvertedLists *v8;
  int v9;
  int v10;
  unint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  const char *v17;
  uint64_t v18;
  unsigned int v19;
  const char *v20;
  _BYTE *v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  std::string *v26;
  size_t v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t i;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int v52;
  std::string *v53;
  size_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  int *v60;
  char *v61;
  int v62;
  std::string *v63;
  size_t v64;
  uint64_t v65;
  int *v66;
  char *v67;
  void *v68;
  uint64_t v69;
  const char *v70;
  const char *v71;
  int *v72;
  char *v73;
  int v74;
  std::string *v75;
  size_t v76;
  int *v77;
  char *v78;
  void *v79;
  uint64_t v80;
  const char *v81;
  const char *v82;
  int *v83;
  char *v84;
  int v85;
  std::string *v86;
  size_t size;
  int *v88;
  char *v89;
  void *exception;
  uint64_t v91;
  const char *v92;
  const char *v93;
  int *v94;
  char *v95;
  int v96;
  std::string *v97;
  size_t v98;
  int *v99;
  char *v100;
  void *v101;
  uint64_t v102;
  const char *v103;
  const char *v104;
  int *v105;
  char *v106;
  int v107;
  std::string *v108;
  size_t v109;
  int *v110;
  char *v111;
  void *v112;
  const char *v113;
  const char *v114;
  int *v115;
  char *v116;
  int v117;
  std::string *v118;
  size_t v119;
  int *v120;
  char *v121;
  void *v122;
  const char *v123;
  const char *v124;
  int *v125;
  char *v126;
  int v127;
  std::string *v128;
  size_t v129;
  int *v130;
  char *v131;
  void *v132;
  int v133;
  std::string *v134;
  int v135;
  size_t v136;
  __int128 v137;
  int v138;
  size_t v139;
  std::string *v140;
  std::string *v141;
  void *v142;
  int v143;
  std::string *v144;
  size_t v145;
  void *v146;
  const char *v147;
  const char *v148;
  int *v149;
  char *v150;
  int v151;
  std::string *v152;
  size_t v153;
  int *v154;
  char *v155;
  void *v156;
  int v157;
  std::string *v158;
  size_t v159;
  void *v160;
  std::string::size_type v161;
  const char *v162;
  const char *v163;
  int *v164;
  char *v165;
  int v166;
  std::string *v167;
  size_t v168;
  std::string::size_type v169;
  int *v170;
  char *v171;
  void *v172;
  const char *v173;
  const char *v174;
  int *v175;
  char *v176;
  int v177;
  std::string *v178;
  size_t v179;
  unint64_t v180;
  int *v181;
  char *v182;
  void *v183;
  void *__p;
  _BYTE *v185;
  int v186;
  std::string v187;
  unint64_t v188;
  std::string v189;
  unsigned int v190;

  v2 = (char)a2;
  v186 = 0;
  v4 = (**(uint64_t (***)(faiss *, int *, uint64_t, uint64_t))this)(this, &v186, 4, 1);
  if (v4 != 1)
  {
    v80 = v4;
    memset(&v189, 0, sizeof(v189));
    v81 = (char *)this + 8;
    v82 = (char *)this + 8;
    if (*((char *)this + 31) < 0)
      v82 = *(const char **)v81;
    v83 = __error();
    v84 = strerror(*v83);
    v85 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v82, v80, 1uLL, v84);
    v86 = &v189;
    std::string::resize(&v189, v85 + 1, 0);
    if ((v189.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      size = HIBYTE(v189.__r_.__value_.__r.__words[2]);
    }
    else
    {
      size = v189.__r_.__value_.__l.__size_;
      v86 = (std::string *)v189.__r_.__value_.__r.__words[0];
    }
    if (*((char *)this + 31) < 0)
      v81 = *(const char **)v81;
    v88 = __error();
    v89 = strerror(*v88);
    snprintf((char *)v86, size, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v81, v80, 1uLL, v89);
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v189, "InvertedLists *faiss::read_InvertedLists(IOReader *, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 215);
  }
  v6 = v186;
  if (v6 == faiss::fourcc((faiss *)"il00", v5))
  {
    fwrite("read_InvertedLists: WARN! inverted lists not stored with IVF object\n", 0x44uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
    return 0;
  }
  v9 = v186;
  v10 = faiss::fourcc((faiss *)"ilar", v7);
  v8 = 0;
  if ((v2 & 8) == 0 && v9 == v10)
  {
    v8 = (faiss::ArrayInvertedLists *)operator new();
    faiss::ArrayInvertedLists::ArrayInvertedLists(v8, 0, 0);
    v11 = (unint64_t *)((char *)v8 + 8);
    v12 = (**(uint64_t (***)(faiss *, uint64_t, uint64_t, uint64_t))this)(this, (uint64_t)v8 + 8, 8, 1);
    if (v12 != 1)
    {
      v91 = v12;
      memset(&v189, 0, sizeof(v189));
      v92 = (char *)this + 8;
      v93 = (char *)this + 8;
      if (*((char *)this + 31) < 0)
        v93 = *(const char **)v92;
      v94 = __error();
      v95 = strerror(*v94);
      v96 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v93, v91, 1uLL, v95);
      v97 = &v189;
      std::string::resize(&v189, v96 + 1, 0);
      if ((v189.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v98 = HIBYTE(v189.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v98 = v189.__r_.__value_.__l.__size_;
        v97 = (std::string *)v189.__r_.__value_.__r.__words[0];
      }
      if (*((char *)this + 31) < 0)
        v92 = *(const char **)v92;
      v99 = __error();
      v100 = strerror(*v99);
      snprintf((char *)v97, v98, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v92, v91, 1uLL, v100);
      v101 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v101, &v189, "InvertedLists *faiss::read_InvertedLists(IOReader *, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 223);
    }
    v13 = (uint64_t *)((char *)v8 + 16);
    v14 = (**(uint64_t (***)(faiss *, uint64_t, uint64_t, uint64_t))this)(this, (uint64_t)v8 + 16, 8, 1);
    if (v14 != 1)
    {
      v102 = v14;
      memset(&v189, 0, sizeof(v189));
      v103 = (char *)this + 8;
      v104 = (char *)this + 8;
      if (*((char *)this + 31) < 0)
        v104 = *(const char **)v103;
      v105 = __error();
      v106 = strerror(*v105);
      v107 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v104, v102, 1uLL, v106);
      v108 = &v189;
      std::string::resize(&v189, v107 + 1, 0);
      if ((v189.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v109 = HIBYTE(v189.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v109 = v189.__r_.__value_.__l.__size_;
        v108 = (std::string *)v189.__r_.__value_.__r.__words[0];
      }
      if (*((char *)this + 31) < 0)
        v103 = *(const char **)v103;
      v110 = __error();
      v111 = strerror(*v110);
      snprintf((char *)v108, v109, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v103, v102, 1uLL, v111);
      v112 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v112, &v189, "InvertedLists *faiss::read_InvertedLists(IOReader *, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 224);
    }
    v15 = (_QWORD *)((char *)v8 + 48);
    std::vector<std::vector<long long>>::resize((uint64_t *)v8 + 6, *((_QWORD *)v8 + 1));
    v16 = (_QWORD *)((char *)v8 + 24);
    std::vector<std::vector<unsigned char>>::resize((uint64_t *)v8 + 3, *((_QWORD *)v8 + 1));
    std::vector<unsigned long>::vector(&__p, *((_QWORD *)v8 + 1));
    v190 = 0;
    v18 = (**(uint64_t (***)(faiss *, unsigned int *, uint64_t, uint64_t))this)(this, &v190, 4, 1);
    if (v18 != 1)
    {
      memset(&v189, 0, sizeof(v189));
      v113 = (char *)this + 8;
      v114 = (char *)this + 8;
      if (*((char *)this + 31) < 0)
        v114 = *(const char **)v113;
      v115 = __error();
      v116 = strerror(*v115);
      v117 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v114, v18, 1uLL, v116);
      v118 = &v189;
      std::string::resize(&v189, v117 + 1, 0);
      if ((v189.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v119 = HIBYTE(v189.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v119 = v189.__r_.__value_.__l.__size_;
        v118 = (std::string *)v189.__r_.__value_.__r.__words[0];
      }
      if (*((char *)this + 31) < 0)
        v113 = *(const char **)v113;
      v120 = __error();
      v121 = strerror(*v120);
      snprintf((char *)v118, v119, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v113, v18, 1uLL, v121);
      v122 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v122, &v189, "void faiss::read_ArrayInvertedLists_sizes(IOReader *, std::vector<size_t> &)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 193);
    }
    v19 = v190;
    if (v19 == faiss::fourcc((faiss *)"full", v17))
    {
      v22 = __p;
      v21 = v185;
      v187.__r_.__value_.__r.__words[0] = 0;
      v23 = (**(uint64_t (***)(faiss *, std::string *, uint64_t, uint64_t))this)(this, &v187, 8, 1);
      if (v23 != 1)
      {
        memset(&v189, 0, sizeof(v189));
        v123 = (char *)this + 8;
        v124 = (char *)this + 8;
        if (*((char *)this + 31) < 0)
          v124 = *(const char **)v123;
        v125 = __error();
        v126 = strerror(*v125);
        v127 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v124, v23, 1uLL, v126);
        v128 = &v189;
        std::string::resize(&v189, v127 + 1, 0);
        if ((v189.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        {
          v129 = HIBYTE(v189.__r_.__value_.__r.__words[2]);
        }
        else
        {
          v129 = v189.__r_.__value_.__l.__size_;
          v128 = (std::string *)v189.__r_.__value_.__r.__words[0];
        }
        if (*((char *)this + 31) < 0)
          v123 = *(const char **)v123;
        v130 = __error();
        v131 = strerror(*v130);
        snprintf((char *)v128, v129, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v123, v23, 1uLL, v131);
        v132 = __cxa_allocate_exception(0x20uLL);
        faiss::FaissException::FaissException(v132, &v189, "void faiss::read_ArrayInvertedLists_sizes(IOReader *, std::vector<size_t> &)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 196);
      }
      if (v187.__r_.__value_.__r.__words[0] >> 40)
      {
        memset(&v189, 0, sizeof(v189));
        v143 = snprintf(0, 0, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
        std::string::resize(&v189, v143 + 1, 0);
        if ((v189.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v144 = &v189;
        else
          v144 = (std::string *)v189.__r_.__value_.__r.__words[0];
        if ((v189.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v145 = HIBYTE(v189.__r_.__value_.__r.__words[2]);
        else
          v145 = v189.__r_.__value_.__l.__size_;
        snprintf((char *)v144, v145, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
        v146 = __cxa_allocate_exception(0x20uLL);
        faiss::FaissException::FaissException(v146, &v189, "void faiss::read_ArrayInvertedLists_sizes(IOReader *, std::vector<size_t> &)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 196);
      }
      std::vector<long long>::resize((uint64_t)&__p, v187.__r_.__value_.__r.__words[0]);
      v24 = (**(uint64_t (***)(faiss *, void *, uint64_t, std::string::size_type))this)(this, __p, 8, v187.__r_.__value_.__r.__words[0]);
      if (v24 != v187.__r_.__value_.__r.__words[0])
      {
        v161 = v187.__r_.__value_.__r.__words[0];
        memset(&v189, 0, sizeof(v189));
        v162 = (char *)this + 8;
        v163 = (char *)this + 8;
        if (*((char *)this + 31) < 0)
          v163 = *(const char **)v162;
        v164 = __error();
        v165 = strerror(*v164);
        v166 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v163, v24, v161, v165);
        v167 = &v189;
        std::string::resize(&v189, v166 + 1, 0);
        if ((v189.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        {
          v168 = HIBYTE(v189.__r_.__value_.__r.__words[2]);
        }
        else
        {
          v168 = v189.__r_.__value_.__l.__size_;
          v167 = (std::string *)v189.__r_.__value_.__r.__words[0];
        }
        if (*((char *)this + 31) < 0)
          v162 = *(const char **)v162;
        v169 = v187.__r_.__value_.__r.__words[0];
        v170 = __error();
        v171 = strerror(*v170);
        snprintf((char *)v167, v168, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v162, v24, v169, v171);
        v172 = __cxa_allocate_exception(0x20uLL);
        faiss::FaissException::FaissException(v172, &v189, "void faiss::read_ArrayInvertedLists_sizes(IOReader *, std::vector<size_t> &)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 196);
      }
      if (v21 - v22 != v185 - (_BYTE *)__p)
      {
        memset(&v189, 0, sizeof(v189));
        v25 = snprintf(0, 0, "Error: '%s' failed", "os == sizes.size()");
        std::string::resize(&v189, v25 + 1, 0);
        if ((v189.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v26 = &v189;
        else
          v26 = (std::string *)v189.__r_.__value_.__r.__words[0];
        if ((v189.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v27 = HIBYTE(v189.__r_.__value_.__r.__words[2]);
        else
          v27 = v189.__r_.__value_.__l.__size_;
        snprintf((char *)v26, v27, "Error: '%s' failed", "os == sizes.size()");
        v28 = __cxa_allocate_exception(0x20uLL);
        faiss::FaissException::FaissException(v28, &v189, "void faiss::read_ArrayInvertedLists_sizes(IOReader *, std::vector<size_t> &)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 197);
      }
      goto LABEL_32;
    }
    v29 = v190;
    if (v29 != faiss::fourcc((faiss *)"sprs", v20))
    {
      memset(&v189, 0, sizeof(v189));
      v133 = v190;
      faiss::fourcc_inv_printable((faiss *)v190, &v187);
      if ((v187.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v134 = &v187;
      else
        v134 = (std::string *)v187.__r_.__value_.__r.__words[0];
      v135 = snprintf(0, 0, "list_type %ud (\"%s\") not recognized", v133, (const char *)v134);
      if (SHIBYTE(v187.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v187.__r_.__value_.__l.__data_);
      std::string::resize(&v189, v135 + 1, 0);
      v136 = HIBYTE(v189.__r_.__value_.__r.__words[2]);
      v137 = *(_OWORD *)&v189.__r_.__value_.__l.__data_;
      v138 = v190;
      faiss::fourcc_inv_printable((faiss *)v190, &v187);
      if ((v136 & 0x80u) == 0)
        v139 = v136;
      else
        v139 = *((_QWORD *)&v137 + 1);
      if ((v136 & 0x80u) == 0)
        v140 = &v189;
      else
        v140 = (std::string *)v137;
      if ((v187.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v141 = &v187;
      else
        v141 = (std::string *)v187.__r_.__value_.__r.__words[0];
      snprintf((char *)v140, v139, "list_type %ud (\"%s\") not recognized", v138, (const char *)v141);
      if (SHIBYTE(v187.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v187.__r_.__value_.__l.__data_);
      v142 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v142, &v189, "void faiss::read_ArrayInvertedLists_sizes(IOReader *, std::vector<size_t> &)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 209);
    }
    memset(&v189, 0, sizeof(v189));
    v188 = 0;
    v30 = (**(uint64_t (***)(faiss *, unint64_t *, uint64_t, uint64_t))this)(this, &v188, 8, 1);
    if (v30 != 1)
    {
      memset(&v187, 0, sizeof(v187));
      v147 = (char *)this + 8;
      v148 = (char *)this + 8;
      if (*((char *)this + 31) < 0)
        v148 = *(const char **)v147;
      v149 = __error();
      v150 = strerror(*v149);
      v151 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v148, v30, 1uLL, v150);
      v152 = &v187;
      std::string::resize(&v187, v151 + 1, 0);
      if ((v187.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v153 = HIBYTE(v187.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v153 = v187.__r_.__value_.__l.__size_;
        v152 = (std::string *)v187.__r_.__value_.__r.__words[0];
      }
      if (*((char *)this + 31) < 0)
        v147 = *(const char **)v147;
      v154 = __error();
      v155 = strerror(*v154);
      snprintf((char *)v152, v153, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v147, v30, 1uLL, v155);
      v156 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v156, &v187, "void faiss::read_ArrayInvertedLists_sizes(IOReader *, std::vector<size_t> &)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 200);
    }
    if (v188 >> 40)
    {
      memset(&v187, 0, sizeof(v187));
      v157 = snprintf(0, 0, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
      std::string::resize(&v187, v157 + 1, 0);
      if ((v187.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v158 = &v187;
      else
        v158 = (std::string *)v187.__r_.__value_.__r.__words[0];
      if ((v187.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v159 = HIBYTE(v187.__r_.__value_.__r.__words[2]);
      else
        v159 = v187.__r_.__value_.__l.__size_;
      snprintf((char *)v158, v159, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
      v160 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v160, &v187, "void faiss::read_ArrayInvertedLists_sizes(IOReader *, std::vector<size_t> &)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 200);
    }
    std::vector<long long>::resize((uint64_t)&v189, v188);
    v31 = (**(uint64_t (***)(faiss *, std::string::size_type, uint64_t, unint64_t))this)(this, v189.__r_.__value_.__r.__words[0], 8, v188);
    v32 = v188;
    if (v31 != v188)
    {
      memset(&v187, 0, sizeof(v187));
      v173 = (char *)this + 8;
      v174 = (char *)this + 8;
      if (*((char *)this + 31) < 0)
        v174 = *(const char **)v173;
      v175 = __error();
      v176 = strerror(*v175);
      v177 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v174, v31, v32, v176);
      v178 = &v187;
      std::string::resize(&v187, v177 + 1, 0);
      if ((v187.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v179 = HIBYTE(v187.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v179 = v187.__r_.__value_.__l.__size_;
        v178 = (std::string *)v187.__r_.__value_.__r.__words[0];
      }
      if (*((char *)this + 31) < 0)
        v173 = *(const char **)v173;
      v180 = v188;
      v181 = __error();
      v182 = strerror(*v181);
      snprintf((char *)v178, v179, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v173, v31, v180, v182);
      v183 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v183, &v187, "void faiss::read_ArrayInvertedLists_sizes(IOReader *, std::vector<size_t> &)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 200);
    }
    v33 = (_QWORD *)v189.__r_.__value_.__r.__words[0];
    if (v189.__r_.__value_.__l.__size_ == v189.__r_.__value_.__r.__words[0])
    {
      if (!v189.__r_.__value_.__l.__size_)
      {
LABEL_32:
        if (*v11)
        {
          v39 = 0;
          v40 = 0;
          do
          {
            std::vector<long long>::resize(*v15 + v39, *((_QWORD *)__p + v40));
            v41 = (unint64_t *)(*v16 + v39);
            v42 = *v13 * *((_QWORD *)__p + v40);
            v43 = v41[1] - *v41;
            if (v42 <= v43)
            {
              if (v42 < v43)
                v41[1] = *v41 + v42;
            }
            else
            {
              std::vector<unsigned char>::__append(v41, v42 - v43);
            }
            ++v40;
            v44 = *v11;
            v39 += 24;
          }
          while (v40 < *v11);
          if (v44)
          {
            v45 = 0;
            for (i = 0; i < v44; ++i)
            {
              v47 = *(_QWORD *)(*v15 + v45 + 8) - *(_QWORD *)(*v15 + v45);
              if (v47)
              {
                v48 = v47 >> 3;
                v49 = (**(uint64_t (***)(faiss *, _QWORD, uint64_t, uint64_t))this)(this, *(_QWORD *)(*v16 + v45), 1, *v13 * (v47 >> 3));
                if (v49 != *v13 * v48)
                {
                  v56 = *v13 * v48;
                  v57 = v49;
                  memset(&v189, 0, sizeof(v189));
                  v58 = (char *)this + 8;
                  v59 = (char *)this + 8;
                  if (*((char *)this + 31) < 0)
                    v59 = *(const char **)v58;
                  v60 = __error();
                  v61 = strerror(*v60);
                  v62 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (n * ails->code_size)", v59, v57, v56, v61);
                  v63 = &v189;
                  std::string::resize(&v189, v62 + 1, 0);
                  if ((v189.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  {
                    v64 = HIBYTE(v189.__r_.__value_.__r.__words[2]);
                  }
                  else
                  {
                    v64 = v189.__r_.__value_.__l.__size_;
                    v63 = (std::string *)v189.__r_.__value_.__r.__words[0];
                  }
                  if (*((char *)this + 31) < 0)
                    v58 = *(const char **)v58;
                  v65 = *v13;
                  v66 = __error();
                  v67 = strerror(*v66);
                  snprintf((char *)v63, v64, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (n * ails->code_size)", v58, v57, v65 * v48, v67);
                  v68 = __cxa_allocate_exception(0x20uLL);
                  faiss::FaissException::FaissException(v68, &v189, "InvertedLists *faiss::read_InvertedLists(IOReader *, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 236);
                }
                v50 = (**(uint64_t (***)(faiss *, _QWORD, uint64_t, uint64_t))this)(this, *(_QWORD *)(*v15 + v45), 8, v48);
                if (v50 != v48)
                {
                  v69 = v50;
                  memset(&v189, 0, sizeof(v189));
                  v70 = (char *)this + 8;
                  v71 = (char *)this + 8;
                  if (*((char *)this + 31) < 0)
                    v71 = *(const char **)v70;
                  v72 = __error();
                  v73 = strerror(*v72);
                  v74 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (n)", v71, v69, v48, v73);
                  v75 = &v189;
                  std::string::resize(&v189, v74 + 1, 0);
                  if ((v189.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  {
                    v76 = HIBYTE(v189.__r_.__value_.__r.__words[2]);
                  }
                  else
                  {
                    v76 = v189.__r_.__value_.__l.__size_;
                    v75 = (std::string *)v189.__r_.__value_.__r.__words[0];
                  }
                  if (*((char *)this + 31) < 0)
                    v70 = *(const char **)v70;
                  v77 = __error();
                  v78 = strerror(*v77);
                  snprintf((char *)v75, v76, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (n)", v70, v69, v48, v78);
                  v79 = __cxa_allocate_exception(0x20uLL);
                  faiss::FaissException::FaissException(v79, &v189, "InvertedLists *faiss::read_InvertedLists(IOReader *, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 237);
                }
                v44 = *v11;
              }
              v45 += 24;
            }
          }
        }
        if (__p)
        {
          v185 = __p;
          operator delete(__p);
        }
        return v8;
      }
    }
    else
    {
      v34 = 0;
      v35 = (uint64_t)(v189.__r_.__value_.__l.__size_ - v189.__r_.__value_.__r.__words[0]) >> 3;
      v36 = __p;
      v37 = (v185 - (_BYTE *)__p) >> 3;
      do
      {
        v38 = v33[v34];
        if (v38 >= v37)
        {
          memset(&v187, 0, sizeof(v187));
          v52 = snprintf(0, 0, "Error: '%s' failed", "idsizes[j] < sizes.size()");
          std::string::resize(&v187, v52 + 1, 0);
          if ((v187.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v53 = &v187;
          else
            v53 = (std::string *)v187.__r_.__value_.__r.__words[0];
          if ((v187.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v54 = HIBYTE(v187.__r_.__value_.__r.__words[2]);
          else
            v54 = v187.__r_.__value_.__l.__size_;
          snprintf((char *)v53, v54, "Error: '%s' failed", "idsizes[j] < sizes.size()");
          v55 = __cxa_allocate_exception(0x20uLL);
          faiss::FaissException::FaissException(v55, &v187, "void faiss::read_ArrayInvertedLists_sizes(IOReader *, std::vector<size_t> &)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 202);
        }
        v36[v38] = v33[v34 + 1];
        v34 += 2;
      }
      while (v34 < v35);
    }
    v189.__r_.__value_.__l.__size_ = (std::string::size_type)v33;
    operator delete(v33);
    goto LABEL_32;
  }
  return v8;
}

void sub_1D490819C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  void *v31;

  __cxa_free_exception(v31);
  if (a24 < 0)
    operator delete(__p);
  if (a26)
    operator delete(a26);
  if (a15)
    operator delete(a15);
  _Unwind_Resume(a1);
}

faiss::ProductQuantizer *faiss::read_ProductQuantizer(faiss *this, const char *a2)
{
  faiss::IOReader *v2;
  faiss::ProductQuantizer *ProductQuantizer;
  _BYTE v5[48];

  faiss::FileIOReader::FileIOReader((faiss::FileIOReader *)v5, (const char *)this);
  ProductQuantizer = faiss::read_ProductQuantizer((faiss *)v5, v2);
  faiss::FileIOReader::~FileIOReader((faiss::FileIOReader *)v5);
  return ProductQuantizer;
}

void sub_1D4908320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  faiss::FileIOReader::~FileIOReader((faiss::FileIOReader *)&a9);
  _Unwind_Resume(a1);
}

faiss::ProductQuantizer *faiss::read_ProductQuantizer(faiss *this, faiss::IOReader *a2)
{
  faiss::ProductQuantizer *v3;
  faiss::IOReader *v4;
  uint64_t v6;

  v3 = (faiss::ProductQuantizer *)operator new();
  faiss::ProductQuantizer::ProductQuantizer(v3);
  faiss::read_ProductQuantizer(v3, this, v4);
  v6 = 0;
  faiss::ScopeDeleter1<faiss::ProductQuantizer>::~ScopeDeleter1(&v6);
  return v3;
}

void sub_1D4908398(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  faiss::ScopeDeleter1<faiss::ProductQuantizer>::~ScopeDeleter1((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t faiss::read_ProductQuantizer(faiss *this, faiss::ProductQuantizer *a2, faiss::IOReader *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  int *v14;
  char *v15;
  int v16;
  std::string *v17;
  size_t size;
  int *v19;
  char *v20;
  void *exception;
  uint64_t v22;
  const char *v23;
  const char *v24;
  int *v25;
  char *v26;
  int v27;
  std::string *v28;
  size_t v29;
  int *v30;
  char *v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  int *v36;
  char *v37;
  int v38;
  std::string *v39;
  size_t v40;
  int *v41;
  char *v42;
  void *v43;
  uint64_t v44;
  const char *v45;
  const char *v46;
  int *v47;
  char *v48;
  int v49;
  std::string *v50;
  size_t v51;
  int *v52;
  char *v53;
  void *v54;
  int v55;
  std::string *v56;
  size_t v57;
  void *v58;
  uint64_t v59;
  const char *v60;
  const char *v61;
  int *v62;
  char *v63;
  int v64;
  std::string *v65;
  size_t v66;
  unint64_t v67;
  int *v68;
  char *v69;
  void *v70;
  unint64_t v71;
  std::string v72;

  v5 = (**(uint64_t (***)(faiss::ProductQuantizer *, faiss *, uint64_t, uint64_t))a2)(a2, this, 8, 1);
  if (v5 != 1)
  {
    v11 = v5;
    memset(&v72, 0, sizeof(v72));
    v12 = (char *)a2 + 8;
    v13 = (char *)a2 + 8;
    if (*((char *)a2 + 31) < 0)
      v13 = *(const char **)v12;
    v14 = __error();
    v15 = strerror(*v14);
    v16 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v13, v11, 1uLL, v15);
    std::string::resize(&v72, v16 + 1, 0);
    if ((v72.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v17 = &v72;
    else
      v17 = (std::string *)v72.__r_.__value_.__r.__words[0];
    if ((v72.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v72.__r_.__value_.__r.__words[2]);
    else
      size = v72.__r_.__value_.__l.__size_;
    if (*((char *)a2 + 31) < 0)
      v12 = *(const char **)v12;
    v19 = __error();
    v20 = strerror(*v19);
    snprintf((char *)v17, size, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v12, v11, 1uLL, v20);
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v72, "void faiss::read_ProductQuantizer(ProductQuantizer *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 276);
  }
  v6 = (**(uint64_t (***)(faiss::ProductQuantizer *, char *, uint64_t, uint64_t))a2)(a2, (char *)this + 8, 8, 1);
  if (v6 != 1)
  {
    v22 = v6;
    memset(&v72, 0, sizeof(v72));
    v23 = (char *)a2 + 8;
    v24 = (char *)a2 + 8;
    if (*((char *)a2 + 31) < 0)
      v24 = *(const char **)v23;
    v25 = __error();
    v26 = strerror(*v25);
    v27 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v24, v22, 1uLL, v26);
    v28 = &v72;
    std::string::resize(&v72, v27 + 1, 0);
    if ((v72.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      v29 = HIBYTE(v72.__r_.__value_.__r.__words[2]);
    }
    else
    {
      v29 = v72.__r_.__value_.__l.__size_;
      v28 = (std::string *)v72.__r_.__value_.__r.__words[0];
    }
    if (*((char *)a2 + 31) < 0)
      v23 = *(const char **)v23;
    v30 = __error();
    v31 = strerror(*v30);
    snprintf((char *)v28, v29, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v23, v22, 1uLL, v31);
    v32 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v32, &v72, "void faiss::read_ProductQuantizer(ProductQuantizer *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 277);
  }
  v7 = (**(uint64_t (***)(faiss::ProductQuantizer *, char *, uint64_t, uint64_t))a2)(a2, (char *)this + 16, 8, 1);
  if (v7 != 1)
  {
    v33 = v7;
    memset(&v72, 0, sizeof(v72));
    v34 = (char *)a2 + 8;
    v35 = (char *)a2 + 8;
    if (*((char *)a2 + 31) < 0)
      v35 = *(const char **)v34;
    v36 = __error();
    v37 = strerror(*v36);
    v38 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v35, v33, 1uLL, v37);
    v39 = &v72;
    std::string::resize(&v72, v38 + 1, 0);
    if ((v72.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      v40 = HIBYTE(v72.__r_.__value_.__r.__words[2]);
    }
    else
    {
      v40 = v72.__r_.__value_.__l.__size_;
      v39 = (std::string *)v72.__r_.__value_.__r.__words[0];
    }
    if (*((char *)a2 + 31) < 0)
      v34 = *(const char **)v34;
    v41 = __error();
    v42 = strerror(*v41);
    snprintf((char *)v39, v40, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v34, v33, 1uLL, v42);
    v43 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v43, &v72, "void faiss::read_ProductQuantizer(ProductQuantizer *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 278);
  }
  faiss::ProductQuantizer::set_derived_values(this);
  v71 = 0;
  v8 = (**(uint64_t (***)(faiss::ProductQuantizer *, unint64_t *, uint64_t, uint64_t))a2)(a2, &v71, 8, 1);
  if (v8 != 1)
  {
    v44 = v8;
    memset(&v72, 0, sizeof(v72));
    v45 = (char *)a2 + 8;
    v46 = (char *)a2 + 8;
    if (*((char *)a2 + 31) < 0)
      v46 = *(const char **)v45;
    v47 = __error();
    v48 = strerror(*v47);
    v49 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v46, v44, 1uLL, v48);
    v50 = &v72;
    std::string::resize(&v72, v49 + 1, 0);
    if ((v72.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      v51 = HIBYTE(v72.__r_.__value_.__r.__words[2]);
    }
    else
    {
      v51 = v72.__r_.__value_.__l.__size_;
      v50 = (std::string *)v72.__r_.__value_.__r.__words[0];
    }
    if (*((char *)a2 + 31) < 0)
      v45 = *(const char **)v45;
    v52 = __error();
    v53 = strerror(*v52);
    snprintf((char *)v50, v51, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v45, v44, 1uLL, v53);
    v54 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v54, &v72, "void faiss::read_ProductQuantizer(ProductQuantizer *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 280);
  }
  if (v71 >> 40)
  {
    memset(&v72, 0, sizeof(v72));
    v55 = snprintf(0, 0, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
    std::string::resize(&v72, v55 + 1, 0);
    if ((v72.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v56 = &v72;
    else
      v56 = (std::string *)v72.__r_.__value_.__r.__words[0];
    if ((v72.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v57 = HIBYTE(v72.__r_.__value_.__r.__words[2]);
    else
      v57 = v72.__r_.__value_.__l.__size_;
    snprintf((char *)v56, v57, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
    v58 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v58, &v72, "void faiss::read_ProductQuantizer(ProductQuantizer *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 280);
  }
  std::vector<float>::resize((uint64_t)this + 104, v71);
  result = (**(uint64_t (***)(faiss::ProductQuantizer *, _QWORD, uint64_t, unint64_t))a2)(a2, *((_QWORD *)this + 13), 4, v71);
  v10 = v71;
  if (result != v71)
  {
    v59 = result;
    memset(&v72, 0, sizeof(v72));
    v60 = (char *)a2 + 8;
    v61 = (char *)a2 + 8;
    if (*((char *)a2 + 31) < 0)
      v61 = *(const char **)v60;
    v62 = __error();
    v63 = strerror(*v62);
    v64 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v61, v59, v10, v63);
    v65 = &v72;
    std::string::resize(&v72, v64 + 1, 0);
    if ((v72.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      v66 = HIBYTE(v72.__r_.__value_.__r.__words[2]);
    }
    else
    {
      v66 = v72.__r_.__value_.__l.__size_;
      v65 = (std::string *)v72.__r_.__value_.__r.__words[0];
    }
    if (*((char *)a2 + 31) < 0)
      v60 = *(const char **)v60;
    v67 = v71;
    v68 = __error();
    v69 = strerror(*v68);
    snprintf((char *)v65, v66, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v60, v59, v67, v69);
    v70 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v70, &v72, "void faiss::read_ProductQuantizer(ProductQuantizer *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 280);
  }
  return result;
}

void sub_1D4908AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;

  __cxa_free_exception(v21);
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t faiss::read_index(faiss *this, faiss::IOReader *a2)
{
  uint64_t v4;
  const char *v5;
  int v6;
  const char *v7;
  int v8;
  int v9;
  int v10;
  const char *v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  std::string::size_type v18;
  int v20;
  const char *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  const char *v26;
  _BOOL4 v27;
  const char *v28;
  unint64_t *v29;
  char v30;
  std::string *v31;
  uint64_t v32;
  uint64_t v33;
  faiss::IOReader *v34;
  uint64_t v35;
  faiss::IOReader *v36;
  __int128 v37;
  std::string::size_type v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t *v42;
  unint64_t v43;
  unint64_t v44;
  BOOL v45;
  size_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  BOOL v52;
  size_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  int v57;
  const char *v58;
  int v59;
  int v60;
  int v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  std::string::size_type v65;
  int v66;
  const char *v67;
  faiss::IOReader *v68;
  int v69;
  unint64_t v70;
  uint64_t v71;
  const char *v72;
  const char *v73;
  int *v74;
  char *v75;
  int v76;
  std::string *v77;
  size_t v78;
  unint64_t v79;
  int *v80;
  char *v81;
  void *v82;
  int v83;
  std::string *v84;
  size_t v85;
  void *v86;
  uint64_t v87;
  const char *v88;
  const char *v89;
  int *v90;
  char *v91;
  int v92;
  std::string *v93;
  size_t v94;
  int *v95;
  char *v96;
  void *v97;
  uint64_t v98;
  const char *v99;
  const char *v100;
  int *v101;
  char *v102;
  int v103;
  std::string *v104;
  size_t size;
  int *v106;
  char *v107;
  void *exception;
  uint64_t v109;
  const char *v110;
  const char *v111;
  int *v112;
  char *v113;
  int v114;
  std::string *v115;
  size_t v116;
  int *v117;
  char *v118;
  void *v119;
  int v120;
  std::string *v121;
  size_t v122;
  void *v123;
  uint64_t v124;
  const char *v125;
  const char *v126;
  int *v127;
  char *v128;
  int v129;
  std::string *v130;
  size_t v131;
  std::string::size_type v132;
  int *v133;
  char *v134;
  void *v135;
  int v136;
  std::string *v137;
  size_t v138;
  void *v139;
  uint64_t v140;
  const char *v141;
  const char *v142;
  int *v143;
  char *v144;
  int v145;
  std::string *v146;
  size_t v147;
  int *v148;
  char *v149;
  void *v150;
  uint64_t v151;
  const char *v152;
  const char *v153;
  int *v154;
  char *v155;
  int v156;
  std::string *v157;
  size_t v158;
  int *v159;
  char *v160;
  void *v161;
  const char *v162;
  const char *v163;
  int *v164;
  char *v165;
  int v166;
  std::string *v167;
  size_t v168;
  int *v169;
  char *v170;
  void *v171;
  int v172;
  std::string *v173;
  size_t v174;
  void *v175;
  const char *v176;
  const char *v177;
  int *v178;
  char *v179;
  int v180;
  std::string *v181;
  size_t v182;
  unint64_t v183;
  int *v184;
  char *v185;
  void *v186;
  const char *v187;
  const char *v188;
  int *v189;
  char *v190;
  int v191;
  std::string *v192;
  size_t v193;
  int *v194;
  char *v195;
  void *v196;
  uint64_t v197;
  const char *v198;
  const char *v199;
  int *v200;
  char *v201;
  int v202;
  std::string *v203;
  size_t v204;
  int *v205;
  char *v206;
  void *v207;
  int v208;
  std::string *v209;
  size_t v210;
  void *v211;
  uint64_t v212;
  const char *v213;
  const char *v214;
  int *v215;
  char *v216;
  int v217;
  std::string *v218;
  size_t v219;
  std::string::size_type v220;
  int *v221;
  char *v222;
  void *v223;
  int v224;
  unint64_t v225;
  std::string v226;
  std::string v227;

  v224 = 0;
  v4 = (**(uint64_t (***)(faiss *, int *, uint64_t, uint64_t))this)(this, &v224, 4, 1);
  if (v4 != 1)
  {
    v98 = v4;
    memset(&v227, 0, sizeof(v227));
    v99 = (char *)this + 8;
    v100 = (char *)this + 8;
    if (*((char *)this + 31) < 0)
      v100 = *(const char **)v99;
    v101 = __error();
    v102 = strerror(*v101);
    v103 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v100, v98, 1uLL, v102);
    v104 = &v227;
    std::string::resize(&v227, v103 + 1, 0);
    if ((v227.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      size = HIBYTE(v227.__r_.__value_.__r.__words[2]);
    }
    else
    {
      size = v227.__r_.__value_.__l.__size_;
      v104 = (std::string *)v227.__r_.__value_.__r.__words[0];
    }
    if (*((char *)this + 31) < 0)
      v99 = *(const char **)v99;
    v106 = __error();
    v107 = strerror(*v106);
    snprintf((char *)v104, size, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v99, v98, 1uLL, v107);
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v227, "Index *faiss::read_index(IOReader *, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 453);
  }
  v6 = v224;
  if (v6 == faiss::fourcc((faiss *)"IxFI", v5)
    || (v8 = v224, v8 == faiss::fourcc((faiss *)"IxF2", v7))
    || (v9 = v224, v9 == faiss::fourcc((faiss *)"IxFl", v7)))
  {
    v10 = v224;
    if (v10 == faiss::fourcc((faiss *)"IxFI", v7))
    {
      v12 = operator new();
      *(_DWORD *)(v12 + 8) = 0;
      *(_QWORD *)(v12 + 16) = 0;
      *(_WORD *)(v12 + 24) = 256;
      *(_QWORD *)(v12 + 28) = 1;
      *(_QWORD *)(v12 + 48) = 0;
      *(_QWORD *)(v12 + 56) = 0;
      *(_QWORD *)(v12 + 40) = 0;
      *(_QWORD *)v12 = &unk_1E98054A0;
    }
    else
    {
      v13 = v224;
      v14 = faiss::fourcc((faiss *)"IxF2", v11);
      v15 = operator new();
      v12 = v15;
      *(_DWORD *)(v15 + 8) = 0;
      *(_QWORD *)(v15 + 16) = 0;
      *(_WORD *)(v15 + 24) = 256;
      *(_QWORD *)(v15 + 28) = 1;
      if (v13 == v14)
      {
        *(_QWORD *)(v15 + 40) = 0;
        *(_QWORD *)(v15 + 48) = 0;
        *(_QWORD *)(v15 + 56) = 0;
        *(_QWORD *)v15 = &unk_1E9805548;
      }
      else
      {
        *(_QWORD *)v15 = &off_1E9806E90;
        *(_QWORD *)(v15 + 48) = 0;
        *(_QWORD *)(v15 + 56) = 0;
        *(_QWORD *)(v15 + 40) = 0;
      }
    }
    faiss::read_index_header(v12, (uint64_t)this);
    v226.__r_.__value_.__r.__words[0] = 0;
    v16 = (**(uint64_t (***)(faiss *, std::string *, uint64_t, uint64_t))this)(this, &v226, 8, 1);
    if (v16 != 1)
    {
      v109 = v16;
      memset(&v227, 0, sizeof(v227));
      v110 = (char *)this + 8;
      v111 = (char *)this + 8;
      if (*((char *)this + 31) < 0)
        v111 = *(const char **)v110;
      v112 = __error();
      v113 = strerror(*v112);
      v114 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v111, v109, 1uLL, v113);
      v115 = &v227;
      std::string::resize(&v227, v114 + 1, 0);
      if ((v227.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v116 = HIBYTE(v227.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v116 = v227.__r_.__value_.__l.__size_;
        v115 = (std::string *)v227.__r_.__value_.__r.__words[0];
      }
      if (*((char *)this + 31) < 0)
        v110 = *(const char **)v110;
      v117 = __error();
      v118 = strerror(*v117);
      snprintf((char *)v115, v116, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v110, v109, 1uLL, v118);
      v119 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v119, &v227, "Index *faiss::read_index(IOReader *, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 464);
    }
    if (v226.__r_.__value_.__r.__words[0] >> 40)
    {
      memset(&v227, 0, sizeof(v227));
      v120 = snprintf(0, 0, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
      std::string::resize(&v227, v120 + 1, 0);
      if ((v227.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v121 = &v227;
      else
        v121 = (std::string *)v227.__r_.__value_.__r.__words[0];
      if ((v227.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v122 = HIBYTE(v227.__r_.__value_.__r.__words[2]);
      else
        v122 = v227.__r_.__value_.__l.__size_;
      snprintf((char *)v121, v122, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
      v123 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v123, &v227, "Index *faiss::read_index(IOReader *, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 464);
    }
    std::vector<float>::resize(v12 + 40, v226.__r_.__value_.__r.__words[0]);
    v17 = (**(uint64_t (***)(faiss *, _QWORD, uint64_t, std::string::size_type))this)(this, *(_QWORD *)(v12 + 40), 4, v226.__r_.__value_.__r.__words[0]);
    v18 = v226.__r_.__value_.__r.__words[0];
    if (v17 != v226.__r_.__value_.__r.__words[0])
    {
      v124 = v17;
      memset(&v227, 0, sizeof(v227));
      v125 = (char *)this + 8;
      v126 = (char *)this + 8;
      if (*((char *)this + 31) < 0)
        v126 = *(const char **)v125;
      v127 = __error();
      v128 = strerror(*v127);
      v129 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v126, v124, v18, v128);
      v130 = &v227;
      std::string::resize(&v227, v129 + 1, 0);
      if ((v227.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v131 = HIBYTE(v227.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v131 = v227.__r_.__value_.__l.__size_;
        v130 = (std::string *)v227.__r_.__value_.__r.__words[0];
      }
      if (*((char *)this + 31) < 0)
        v125 = *(const char **)v125;
      v132 = v226.__r_.__value_.__r.__words[0];
      v133 = __error();
      v134 = strerror(*v133);
      snprintf((char *)v130, v131, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v125, v124, v132, v134);
      v135 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v135, &v227, "Index *faiss::read_index(IOReader *, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 464);
    }
    if (*(_QWORD *)(v12 + 16) * *(int *)(v12 + 8) != (uint64_t)(*(_QWORD *)(v12 + 48) - *(_QWORD *)(v12 + 40)) >> 2)
    {
      memset(&v227, 0, sizeof(v227));
      v136 = snprintf(0, 0, "Error: '%s' failed", "idxf->xb.size() == idxf->ntotal * idxf->d");
      std::string::resize(&v227, v136 + 1, 0);
      if ((v227.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v137 = &v227;
      else
        v137 = (std::string *)v227.__r_.__value_.__r.__words[0];
      if ((v227.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v138 = HIBYTE(v227.__r_.__value_.__r.__words[2]);
      else
        v138 = v227.__r_.__value_.__l.__size_;
      snprintf((char *)v137, v138, "Error: '%s' failed", "idxf->xb.size() == idxf->ntotal * idxf->d");
      v139 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v139, &v227, "Index *faiss::read_index(IOReader *, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 465);
    }
  }
  else
  {
    v20 = v224;
    if (v20 == faiss::fourcc((faiss *)"IvPQ", v7)
      || (v22 = v224, v22 == faiss::fourcc((faiss *)"IvQR", v21))
      || (v23 = v224, v23 == faiss::fourcc((faiss *)"IwPQ", v21))
      || (v24 = v224, v24 == faiss::fourcc((faiss *)"IwQR", v21)))
    {
      v25 = v224;
      v27 = faiss::fourcc((faiss *)"IvQR", v21) == v25 || faiss::fourcc((faiss *)"IvPQ", v26) == v25;
      if (faiss::fourcc((faiss *)"IvQR", v26) == v25
        || faiss::fourcc((faiss *)"IwQR", v28) == v25)
      {
        v29 = (unint64_t *)operator new();
        faiss::IndexIVFPQR::IndexIVFPQR((faiss::IndexIVFPQR *)v29);
        v30 = 0;
        v12 = (uint64_t)v29;
      }
      else
      {
        v12 = operator new();
        faiss::IndexIVFPQ::IndexIVFPQ((faiss::IndexIVFPQ *)v12);
        v29 = 0;
        v30 = 1;
      }
      memset(&v227, 0, sizeof(v227));
      if (v27)
        v31 = &v227;
      else
        v31 = 0;
      faiss::read_ivf_header(v12, (char *)this, (uint64_t *)v31);
      v32 = (**(uint64_t (***)(faiss *, uint64_t, uint64_t, uint64_t))this)(this, v12 + 232, 1, 1);
      if (v32 != 1)
      {
        v140 = v32;
        memset(&v226, 0, sizeof(v226));
        v141 = (char *)this + 8;
        v142 = (char *)this + 8;
        if (*((char *)this + 31) < 0)
          v142 = *(const char **)v141;
        v143 = __error();
        v144 = strerror(*v143);
        v145 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v142, v140, 1uLL, v144);
        v146 = &v226;
        std::string::resize(&v226, v145 + 1, 0);
        if ((v226.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        {
          v147 = HIBYTE(v226.__r_.__value_.__r.__words[2]);
        }
        else
        {
          v147 = v226.__r_.__value_.__l.__size_;
          v146 = (std::string *)v226.__r_.__value_.__r.__words[0];
        }
        if (*((char *)this + 31) < 0)
          v141 = *(const char **)v141;
        v148 = __error();
        v149 = strerror(*v148);
        snprintf((char *)v146, v147, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v141, v140, 1uLL, v149);
        v150 = __cxa_allocate_exception(0x20uLL);
        faiss::FaissException::FaissException(v150, &v226, "IndexIVFPQ *faiss::read_ivfpq(IOReader *, uint32_t, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 424);
      }
      v33 = (**(uint64_t (***)(faiss *, uint64_t, uint64_t, uint64_t))this)(this, v12 + 128, 8, 1);
      if (v33 != 1)
      {
        v151 = v33;
        memset(&v226, 0, sizeof(v226));
        v152 = (char *)this + 8;
        v153 = (char *)this + 8;
        if (*((char *)this + 31) < 0)
          v153 = *(const char **)v152;
        v154 = __error();
        v155 = strerror(*v154);
        v156 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v153, v151, 1uLL, v155);
        v157 = &v226;
        std::string::resize(&v226, v156 + 1, 0);
        if ((v226.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        {
          v158 = HIBYTE(v226.__r_.__value_.__r.__words[2]);
        }
        else
        {
          v158 = v226.__r_.__value_.__l.__size_;
          v157 = (std::string *)v226.__r_.__value_.__r.__words[0];
        }
        if (*((char *)this + 31) < 0)
          v152 = *(const char **)v152;
        v159 = __error();
        v160 = strerror(*v159);
        snprintf((char *)v157, v158, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v152, v151, 1uLL, v160);
        v161 = __cxa_allocate_exception(0x20uLL);
        faiss::FaissException::FaissException(v161, &v226, "IndexIVFPQ *faiss::read_ivfpq(IOReader *, uint32_t, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 425);
      }
      faiss::read_ProductQuantizer((faiss *)(v12 + 240), this, v34);
      if (v27)
      {
        v35 = operator new();
        faiss::ArrayInvertedLists::ArrayInvertedLists((faiss::ArrayInvertedLists *)v35, *(_QWORD *)(v12 + 48), *(_QWORD *)(v12 + 128));
        v37 = *(_OWORD *)(v35 + 48);
        *(_OWORD *)(v35 + 48) = *(_OWORD *)&v227.__r_.__value_.__l.__data_;
        *(_OWORD *)&v227.__r_.__value_.__l.__data_ = v37;
        v38 = *(_QWORD *)(v35 + 64);
        *(_QWORD *)(v35 + 64) = *((_QWORD *)&v227.__r_.__value_.__l + 2);
        v227.__r_.__value_.__r.__words[2] = v38;
        *(_QWORD *)(v12 + 112) = v35;
        *(_BYTE *)(v12 + 120) = 1;
        if (*(_QWORD *)(v35 + 8))
        {
          v39 = 0;
          v40 = 0;
          do
          {
            v225 = 0;
            v41 = (**(uint64_t (***)(faiss *, unint64_t *, uint64_t, uint64_t))this)(this, &v225, 8, 1);
            if (v41 != 1)
            {
              v87 = v41;
              memset(&v226, 0, sizeof(v226));
              v88 = (char *)this + 8;
              v89 = (char *)this + 8;
              if (*((char *)this + 31) < 0)
                v89 = *(const char **)v88;
              v90 = __error();
              v91 = strerror(*v90);
              v92 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v89, v87, 1uLL, v91);
              v93 = &v226;
              std::string::resize(&v226, v92 + 1, 0);
              if ((v226.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              {
                v94 = HIBYTE(v226.__r_.__value_.__r.__words[2]);
              }
              else
              {
                v94 = v226.__r_.__value_.__l.__size_;
                v93 = (std::string *)v226.__r_.__value_.__r.__words[0];
              }
              if (*((char *)this + 31) < 0)
                v88 = *(const char **)v88;
              v95 = __error();
              v96 = strerror(*v95);
              snprintf((char *)v93, v94, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v88, v87, 1uLL, v96);
              v97 = __cxa_allocate_exception(0x20uLL);
              faiss::FaissException::FaissException(v97, &v226, "IndexIVFPQ *faiss::read_ivfpq(IOReader *, uint32_t, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 431);
            }
            if (v225 >> 40)
            {
              memset(&v226, 0, sizeof(v226));
              v83 = snprintf(0, 0, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
              std::string::resize(&v226, v83 + 1, 0);
              if ((v226.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v84 = &v226;
              else
                v84 = (std::string *)v226.__r_.__value_.__r.__words[0];
              if ((v226.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v85 = HIBYTE(v226.__r_.__value_.__r.__words[2]);
              else
                v85 = v226.__r_.__value_.__l.__size_;
              snprintf((char *)v84, v85, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
              v86 = __cxa_allocate_exception(0x20uLL);
              faiss::FaissException::FaissException(v86, &v226, "IndexIVFPQ *faiss::read_ivfpq(IOReader *, uint32_t, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 431);
            }
            v42 = (unint64_t *)(*(_QWORD *)(v35 + 24) + v39);
            v43 = *v42;
            v44 = v42[1] - *v42;
            v45 = v225 >= v44;
            v46 = v225 - v44;
            if (v46 != 0 && v45)
            {
              std::vector<unsigned char>::__append(v42, v46);
              v43 = *(_QWORD *)(*(_QWORD *)(v35 + 24) + v39);
            }
            else if (!v45)
            {
              v42[1] = v43 + v225;
            }
            v47 = (**(uint64_t (***)(faiss *, unint64_t, uint64_t, unint64_t))this)(this, v43, 1, v225);
            if (v47 != v225)
            {
              v70 = v225;
              v71 = v47;
              memset(&v226, 0, sizeof(v226));
              v72 = (char *)this + 8;
              v73 = (char *)this + 8;
              if (*((char *)this + 31) < 0)
                v73 = *(const char **)v72;
              v74 = __error();
              v75 = strerror(*v74);
              v76 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v73, v71, v70, v75);
              v77 = &v226;
              std::string::resize(&v226, v76 + 1, 0);
              if ((v226.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              {
                v78 = HIBYTE(v226.__r_.__value_.__r.__words[2]);
              }
              else
              {
                v78 = v226.__r_.__value_.__l.__size_;
                v77 = (std::string *)v226.__r_.__value_.__r.__words[0];
              }
              if (*((char *)this + 31) < 0)
                v72 = *(const char **)v72;
              v79 = v225;
              v80 = __error();
              v81 = strerror(*v80);
              snprintf((char *)v77, v78, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v72, v71, v79, v81);
              v82 = __cxa_allocate_exception(0x20uLL);
              faiss::FaissException::FaissException(v82, &v226, "IndexIVFPQ *faiss::read_ivfpq(IOReader *, uint32_t, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 431);
            }
            ++v40;
            v39 += 24;
          }
          while (v40 < *(_QWORD *)(v35 + 8));
        }
      }
      else
      {
        faiss::read_InvertedLists((faiss *)v12, this, a2);
      }
      if (*(_BYTE *)(v12 + 25))
      {
        *(_DWORD *)(v12 + 420) = 0;
        if (*(_BYTE *)(v12 + 232))
          faiss::IndexIVFPQ::precompute_table((void **)v12);
        if ((v30 & 1) == 0)
        {
          faiss::read_ProductQuantizer((faiss *)(v29 + 56), this, v36);
          v225 = 0;
          v48 = (**(uint64_t (***)(faiss *, unint64_t *, uint64_t, uint64_t))this)(this, &v225, 8, 1);
          if (v48 != 1)
          {
            memset(&v226, 0, sizeof(v226));
            v162 = (char *)this + 8;
            v163 = (char *)this + 8;
            if (*((char *)this + 31) < 0)
              v163 = *(const char **)v162;
            v164 = __error();
            v165 = strerror(*v164);
            v166 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v163, v48, 1uLL, v165);
            v167 = &v226;
            std::string::resize(&v226, v166 + 1, 0);
            if ((v226.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            {
              v168 = HIBYTE(v226.__r_.__value_.__r.__words[2]);
            }
            else
            {
              v168 = v226.__r_.__value_.__l.__size_;
              v167 = (std::string *)v226.__r_.__value_.__r.__words[0];
            }
            if (*((char *)this + 31) < 0)
              v162 = *(const char **)v162;
            v169 = __error();
            v170 = strerror(*v169);
            snprintf((char *)v167, v168, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v162, v48, 1uLL, v170);
            v171 = __cxa_allocate_exception(0x20uLL);
            faiss::FaissException::FaissException(v171, &v226, "IndexIVFPQ *faiss::read_ivfpq(IOReader *, uint32_t, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 443);
          }
          v49 = v225;
          if (v225 >> 40)
          {
            memset(&v226, 0, sizeof(v226));
            v172 = snprintf(0, 0, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
            std::string::resize(&v226, v172 + 1, 0);
            if ((v226.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v173 = &v226;
            else
              v173 = (std::string *)v226.__r_.__value_.__r.__words[0];
            if ((v226.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
              v174 = HIBYTE(v226.__r_.__value_.__r.__words[2]);
            else
              v174 = v226.__r_.__value_.__l.__size_;
            snprintf((char *)v173, v174, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
            v175 = __cxa_allocate_exception(0x20uLL);
            faiss::FaissException::FaissException(v175, &v226, "IndexIVFPQ *faiss::read_ivfpq(IOReader *, uint32_t, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 443);
          }
          v50 = v29[75];
          v51 = v29[76] - v50;
          v52 = v225 >= v51;
          v53 = v225 - v51;
          if (v53 != 0 && v52)
          {
            std::vector<unsigned char>::__append(v29 + 75, v53);
            v50 = v29[75];
            v49 = v225;
          }
          else if (!v52)
          {
            v29[76] = v50 + v225;
          }
          v54 = (**(uint64_t (***)(faiss *, unint64_t, uint64_t, unint64_t))this)(this, v50, 1, v49);
          v55 = v225;
          if (v54 != v225)
          {
            memset(&v226, 0, sizeof(v226));
            v176 = (char *)this + 8;
            v177 = (char *)this + 8;
            if (*((char *)this + 31) < 0)
              v177 = *(const char **)v176;
            v178 = __error();
            v179 = strerror(*v178);
            v180 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v177, v54, v55, v179);
            v181 = &v226;
            std::string::resize(&v226, v180 + 1, 0);
            if ((v226.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            {
              v182 = HIBYTE(v226.__r_.__value_.__r.__words[2]);
            }
            else
            {
              v182 = v226.__r_.__value_.__l.__size_;
              v181 = (std::string *)v226.__r_.__value_.__r.__words[0];
            }
            if (*((char *)this + 31) < 0)
              v176 = *(const char **)v176;
            v183 = v225;
            v184 = __error();
            v185 = strerror(*v184);
            snprintf((char *)v181, v182, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v176, v54, v183, v185);
            v186 = __cxa_allocate_exception(0x20uLL);
            faiss::FaissException::FaissException(v186, &v226, "IndexIVFPQ *faiss::read_ivfpq(IOReader *, uint32_t, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 443);
          }
          v56 = (**(uint64_t (***)(faiss *, uint64_t, uint64_t, uint64_t))this)(this, (uint64_t)(v29 + 78), 4, 1);
          if (v56 != 1)
          {
            memset(&v226, 0, sizeof(v226));
            v187 = (char *)this + 8;
            v188 = (char *)this + 8;
            if (*((char *)this + 31) < 0)
              v188 = *(const char **)v187;
            v189 = __error();
            v190 = strerror(*v189);
            v191 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v188, v56, 1uLL, v190);
            v192 = &v226;
            std::string::resize(&v226, v191 + 1, 0);
            if ((v226.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            {
              v193 = HIBYTE(v226.__r_.__value_.__r.__words[2]);
            }
            else
            {
              v193 = v226.__r_.__value_.__l.__size_;
              v192 = (std::string *)v226.__r_.__value_.__r.__words[0];
            }
            if (*((char *)this + 31) < 0)
              v187 = *(const char **)v187;
            v194 = __error();
            v195 = strerror(*v194);
            snprintf((char *)v192, v193, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v187, v56, 1uLL, v195);
            v196 = __cxa_allocate_exception(0x20uLL);
            faiss::FaissException::FaissException(v196, &v226, "IndexIVFPQ *faiss::read_ivfpq(IOReader *, uint32_t, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 444);
          }
        }
      }
      v226.__r_.__value_.__r.__words[0] = (std::string::size_type)&v227;
      std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v226);
    }
    else
    {
      v57 = v224;
      if (v57 == faiss::fourcc((faiss *)"IxMp", v21)
        || (v59 = v224, v59 == faiss::fourcc((faiss *)"IxM2", v58)))
      {
        v60 = v224;
        v61 = faiss::fourcc((faiss *)"IxM2", v58);
        v12 = operator new();
        *(_DWORD *)(v12 + 8) = 0;
        *(_QWORD *)(v12 + 16) = 0;
        *(_WORD *)(v12 + 24) = 256;
        *(_QWORD *)(v12 + 28) = 1;
        if (v60 == v61)
        {
          *(_QWORD *)(v12 + 64) = 0;
          *(_QWORD *)(v12 + 72) = 0;
          *(_QWORD *)(v12 + 56) = 0;
          *(_BYTE *)(v12 + 48) = 0;
          *(_QWORD *)(v12 + 40) = 0;
          *(_QWORD *)v12 = &unk_1E98065C8;
          *(_OWORD *)(v12 + 80) = 0u;
          *(_OWORD *)(v12 + 96) = 0u;
          *(_DWORD *)(v12 + 112) = 1065353216;
        }
        else
        {
          *(_QWORD *)v12 = &unk_1E9806390;
          *(_QWORD *)(v12 + 64) = 0;
          *(_QWORD *)(v12 + 72) = 0;
          *(_QWORD *)(v12 + 56) = 0;
          *(_BYTE *)(v12 + 48) = 0;
          *(_QWORD *)(v12 + 40) = 0;
        }
        faiss::read_index_header(v12, (uint64_t)this);
        *(_QWORD *)(v12 + 40) = faiss::read_index(this, a2, v62);
        *(_BYTE *)(v12 + 48) = 1;
        v226.__r_.__value_.__r.__words[0] = 0;
        v63 = (**(uint64_t (***)(faiss *, std::string *, uint64_t, uint64_t))this)(this, &v226, 8, 1);
        if (v63 != 1)
        {
          v197 = v63;
          memset(&v227, 0, sizeof(v227));
          v198 = (char *)this + 8;
          v199 = (char *)this + 8;
          if (*((char *)this + 31) < 0)
            v199 = *(const char **)v198;
          v200 = __error();
          v201 = strerror(*v200);
          v202 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v199, v197, 1uLL, v201);
          v203 = &v227;
          std::string::resize(&v227, v202 + 1, 0);
          if ((v227.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          {
            v204 = HIBYTE(v227.__r_.__value_.__r.__words[2]);
          }
          else
          {
            v204 = v227.__r_.__value_.__l.__size_;
            v203 = (std::string *)v227.__r_.__value_.__r.__words[0];
          }
          if (*((char *)this + 31) < 0)
            v198 = *(const char **)v198;
          v205 = __error();
          v206 = strerror(*v205);
          snprintf((char *)v203, v204, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v198, v197, 1uLL, v206);
          v207 = __cxa_allocate_exception(0x20uLL);
          faiss::FaissException::FaissException(v207, &v227, "Index *faiss::read_index(IOReader *, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 479);
        }
        if (v226.__r_.__value_.__r.__words[0] >> 40)
        {
          memset(&v227, 0, sizeof(v227));
          v208 = snprintf(0, 0, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
          std::string::resize(&v227, v208 + 1, 0);
          if ((v227.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v209 = &v227;
          else
            v209 = (std::string *)v227.__r_.__value_.__r.__words[0];
          if ((v227.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v210 = HIBYTE(v227.__r_.__value_.__r.__words[2]);
          else
            v210 = v227.__r_.__value_.__l.__size_;
          snprintf((char *)v209, v210, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
          v211 = __cxa_allocate_exception(0x20uLL);
          faiss::FaissException::FaissException(v211, &v227, "Index *faiss::read_index(IOReader *, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 479);
        }
        std::vector<long long>::resize(v12 + 56, v226.__r_.__value_.__r.__words[0]);
        v64 = (**(uint64_t (***)(faiss *, _QWORD, uint64_t, std::string::size_type))this)(this, *(_QWORD *)(v12 + 56), 8, v226.__r_.__value_.__r.__words[0]);
        v65 = v226.__r_.__value_.__r.__words[0];
        if (v64 != v226.__r_.__value_.__r.__words[0])
        {
          v212 = v64;
          memset(&v227, 0, sizeof(v227));
          v213 = (char *)this + 8;
          v214 = (char *)this + 8;
          if (*((char *)this + 31) < 0)
            v214 = *(const char **)v213;
          v215 = __error();
          v216 = strerror(*v215);
          v217 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v214, v212, v65, v216);
          v218 = &v227;
          std::string::resize(&v227, v217 + 1, 0);
          if ((v227.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          {
            v219 = HIBYTE(v227.__r_.__value_.__r.__words[2]);
          }
          else
          {
            v219 = v227.__r_.__value_.__l.__size_;
            v218 = (std::string *)v227.__r_.__value_.__r.__words[0];
          }
          if (*((char *)this + 31) < 0)
            v213 = *(const char **)v213;
          v220 = v226.__r_.__value_.__r.__words[0];
          v221 = __error();
          v222 = strerror(*v221);
          snprintf((char *)v218, v219, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v213, v212, v220, v222);
          v223 = __cxa_allocate_exception(0x20uLL);
          faiss::FaissException::FaissException(v223, &v227, "Index *faiss::read_index(IOReader *, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 479);
        }
        if (v60 == v61)
          faiss::IndexIDMap2Template<faiss::Index>::construct_rev_map((_QWORD *)v12);
      }
      else
      {
        v66 = v224;
        if (v66 == faiss::fourcc((faiss *)"Imiq", v58))
        {
          v12 = operator new();
          faiss::MultiIndexQuantizer::MultiIndexQuantizer((faiss::MultiIndexQuantizer *)v12);
          faiss::read_index_header(v12, (uint64_t)this);
          faiss::read_ProductQuantizer((faiss *)(v12 + 40), this, v68);
        }
        else
        {
          v69 = v224;
          if (v69 == faiss::fourcc((faiss *)"IwFl", v67))
          {
            v12 = operator new();
            faiss::IndexIVF::IndexIVF((faiss::IndexIVF *)v12);
            *(_QWORD *)v12 = &off_1E9805778;
            faiss::read_ivf_header(v12, (char *)this, 0);
            *(_QWORD *)(v12 + 128) = 4 * *(int *)(v12 + 8);
            faiss::read_InvertedLists((faiss *)v12, this, a2);
          }
          else
          {
            return 0;
          }
        }
      }
    }
  }
  return v12;
}

{
  uint64_t index;
  _BYTE v5[48];

  faiss::FileIOReader::FileIOReader((faiss::FileIOReader *)v5, (const char *)this);
  index = faiss::read_index((faiss *)v5, a2);
  faiss::FileIOReader::~FileIOReader((faiss::FileIOReader *)v5);
  return index;
}

void sub_1D490A2E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  void *v27;

  __cxa_free_exception(v27);
  if (a27 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t faiss::read_index_header(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  const char *v11;
  const char *v12;
  int *v13;
  char *v14;
  int v15;
  std::string *v16;
  size_t size;
  int *v18;
  char *v19;
  void *exception;
  uint64_t v21;
  const char *v22;
  const char *v23;
  int *v24;
  char *v25;
  int v26;
  std::string *v27;
  size_t v28;
  int *v29;
  char *v30;
  void *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  int *v35;
  char *v36;
  int v37;
  std::string *v38;
  size_t v39;
  int *v40;
  char *v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  int *v46;
  char *v47;
  int v48;
  std::string *v49;
  size_t v50;
  int *v51;
  char *v52;
  void *v53;
  uint64_t v54;
  const char *v55;
  const char *v56;
  int *v57;
  char *v58;
  int v59;
  std::string *v60;
  size_t v61;
  int *v62;
  char *v63;
  void *v64;
  uint64_t v65;
  const char *v66;
  const char *v67;
  int *v68;
  char *v69;
  int v70;
  std::string *v71;
  size_t v72;
  int *v73;
  char *v74;
  void *v75;
  uint64_t v76;
  const char *v77;
  const char *v78;
  int *v79;
  char *v80;
  int v81;
  std::string *v82;
  size_t v83;
  int *v84;
  char *v85;
  void *v86;
  uint64_t v87;
  std::string v88;

  v4 = (**(uint64_t (***)(uint64_t, uint64_t, uint64_t, uint64_t))a2)(a2, a1 + 8, 4, 1);
  if (v4 != 1)
  {
    v10 = v4;
    memset(&v88, 0, sizeof(v88));
    v11 = (const char *)(a2 + 8);
    v12 = (const char *)(a2 + 8);
    if (*(char *)(a2 + 31) < 0)
      v12 = *(const char **)v11;
    v13 = __error();
    v14 = strerror(*v13);
    v15 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v12, v10, 1uLL, v14);
    std::string::resize(&v88, v15 + 1, 0);
    if ((v88.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v16 = &v88;
    else
      v16 = (std::string *)v88.__r_.__value_.__r.__words[0];
    if ((v88.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v88.__r_.__value_.__r.__words[2]);
    else
      size = v88.__r_.__value_.__l.__size_;
    if (*(char *)(a2 + 31) < 0)
      v11 = *(const char **)v11;
    v18 = __error();
    v19 = strerror(*v18);
    snprintf((char *)v16, size, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v11, v10, 1uLL, v19);
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v88, "void faiss::read_index_header(Index *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 62);
  }
  v5 = (**(uint64_t (***)(uint64_t, uint64_t, uint64_t, uint64_t))a2)(a2, a1 + 16, 8, 1);
  if (v5 != 1)
  {
    v21 = v5;
    memset(&v88, 0, sizeof(v88));
    v22 = (const char *)(a2 + 8);
    v23 = (const char *)(a2 + 8);
    if (*(char *)(a2 + 31) < 0)
      v23 = *(const char **)v22;
    v24 = __error();
    v25 = strerror(*v24);
    v26 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v23, v21, 1uLL, v25);
    v27 = &v88;
    std::string::resize(&v88, v26 + 1, 0);
    if ((v88.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      v28 = HIBYTE(v88.__r_.__value_.__r.__words[2]);
    }
    else
    {
      v28 = v88.__r_.__value_.__l.__size_;
      v27 = (std::string *)v88.__r_.__value_.__r.__words[0];
    }
    if (*(char *)(a2 + 31) < 0)
      v22 = *(const char **)v22;
    v29 = __error();
    v30 = strerror(*v29);
    snprintf((char *)v27, v28, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v22, v21, 1uLL, v30);
    v31 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v31, &v88, "void faiss::read_index_header(Index *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 63);
  }
  v87 = 0;
  v6 = (**(uint64_t (***)(uint64_t, uint64_t *, uint64_t, uint64_t))a2)(a2, &v87, 8, 1);
  if (v6 != 1)
  {
    v32 = v6;
    memset(&v88, 0, sizeof(v88));
    v33 = (const char *)(a2 + 8);
    v34 = (const char *)(a2 + 8);
    if (*(char *)(a2 + 31) < 0)
      v34 = *(const char **)v33;
    v35 = __error();
    v36 = strerror(*v35);
    v37 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v34, v32, 1uLL, v36);
    v38 = &v88;
    std::string::resize(&v88, v37 + 1, 0);
    if ((v88.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      v39 = HIBYTE(v88.__r_.__value_.__r.__words[2]);
    }
    else
    {
      v39 = v88.__r_.__value_.__l.__size_;
      v38 = (std::string *)v88.__r_.__value_.__r.__words[0];
    }
    if (*(char *)(a2 + 31) < 0)
      v33 = *(const char **)v33;
    v40 = __error();
    v41 = strerror(*v40);
    snprintf((char *)v38, v39, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v33, v32, 1uLL, v41);
    v42 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v42, &v88, "void faiss::read_index_header(Index *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 65);
  }
  v7 = (**(uint64_t (***)(uint64_t, uint64_t *, uint64_t, uint64_t))a2)(a2, &v87, 8, 1);
  if (v7 != 1)
  {
    v43 = v7;
    memset(&v88, 0, sizeof(v88));
    v44 = (const char *)(a2 + 8);
    v45 = (const char *)(a2 + 8);
    if (*(char *)(a2 + 31) < 0)
      v45 = *(const char **)v44;
    v46 = __error();
    v47 = strerror(*v46);
    v48 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v45, v43, 1uLL, v47);
    v49 = &v88;
    std::string::resize(&v88, v48 + 1, 0);
    if ((v88.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      v50 = HIBYTE(v88.__r_.__value_.__r.__words[2]);
    }
    else
    {
      v50 = v88.__r_.__value_.__l.__size_;
      v49 = (std::string *)v88.__r_.__value_.__r.__words[0];
    }
    if (*(char *)(a2 + 31) < 0)
      v44 = *(const char **)v44;
    v51 = __error();
    v52 = strerror(*v51);
    snprintf((char *)v49, v50, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v44, v43, 1uLL, v52);
    v53 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v53, &v88, "void faiss::read_index_header(Index *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 66);
  }
  v8 = (**(uint64_t (***)(uint64_t, uint64_t, uint64_t, uint64_t))a2)(a2, a1 + 25, 1, 1);
  if (v8 != 1)
  {
    v54 = v8;
    memset(&v88, 0, sizeof(v88));
    v55 = (const char *)(a2 + 8);
    v56 = (const char *)(a2 + 8);
    if (*(char *)(a2 + 31) < 0)
      v56 = *(const char **)v55;
    v57 = __error();
    v58 = strerror(*v57);
    v59 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v56, v54, 1uLL, v58);
    v60 = &v88;
    std::string::resize(&v88, v59 + 1, 0);
    if ((v88.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      v61 = HIBYTE(v88.__r_.__value_.__r.__words[2]);
    }
    else
    {
      v61 = v88.__r_.__value_.__l.__size_;
      v60 = (std::string *)v88.__r_.__value_.__r.__words[0];
    }
    if (*(char *)(a2 + 31) < 0)
      v55 = *(const char **)v55;
    v62 = __error();
    v63 = strerror(*v62);
    snprintf((char *)v60, v61, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v55, v54, 1uLL, v63);
    v64 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v64, &v88, "void faiss::read_index_header(Index *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 67);
  }
  result = (**(uint64_t (***)(uint64_t, uint64_t, uint64_t, uint64_t))a2)(a2, a1 + 28, 4, 1);
  if (result != 1)
  {
    v65 = result;
    memset(&v88, 0, sizeof(v88));
    v66 = (const char *)(a2 + 8);
    v67 = (const char *)(a2 + 8);
    if (*(char *)(a2 + 31) < 0)
      v67 = *(const char **)v66;
    v68 = __error();
    v69 = strerror(*v68);
    v70 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v67, v65, 1uLL, v69);
    v71 = &v88;
    std::string::resize(&v88, v70 + 1, 0);
    if ((v88.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      v72 = HIBYTE(v88.__r_.__value_.__r.__words[2]);
    }
    else
    {
      v72 = v88.__r_.__value_.__l.__size_;
      v71 = (std::string *)v88.__r_.__value_.__r.__words[0];
    }
    if (*(char *)(a2 + 31) < 0)
      v66 = *(const char **)v66;
    v73 = __error();
    v74 = strerror(*v73);
    snprintf((char *)v71, v72, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v66, v65, 1uLL, v74);
    v75 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v75, &v88, "void faiss::read_index_header(Index *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 68);
  }
  if (*(int *)(a1 + 28) >= 2)
  {
    result = (**(uint64_t (***)(uint64_t, uint64_t, uint64_t, uint64_t))a2)(a2, a1 + 32, 4, 1);
    if (result != 1)
    {
      v76 = result;
      memset(&v88, 0, sizeof(v88));
      v77 = (const char *)(a2 + 8);
      v78 = (const char *)(a2 + 8);
      if (*(char *)(a2 + 31) < 0)
        v78 = *(const char **)v77;
      v79 = __error();
      v80 = strerror(*v79);
      v81 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v78, v76, 1uLL, v80);
      v82 = &v88;
      std::string::resize(&v88, v81 + 1, 0);
      if ((v88.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v83 = HIBYTE(v88.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v83 = v88.__r_.__value_.__l.__size_;
        v82 = (std::string *)v88.__r_.__value_.__r.__words[0];
      }
      if (*(char *)(a2 + 31) < 0)
        v77 = *(const char **)v77;
      v84 = __error();
      v85 = strerror(*v84);
      snprintf((char *)v82, v83, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v77, v76, 1uLL, v85);
      v86 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v86, &v88, "void faiss::read_index_header(Index *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 70);
    }
  }
  *(_BYTE *)(a1 + 24) = 0;
  return result;
}

void sub_1D490ACFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;

  __cxa_free_exception(v21);
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void faiss::read_ivf_header(uint64_t a1, char *a2, uint64_t *a3)
{
  unint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  std::string::size_type v17;
  uint64_t v18;
  std::string *v19;
  std::string *v20;
  uint64_t v21;
  _OWORD *v22;
  std::string::size_type v23;
  std::string::size_type v24;
  std::string::size_type v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  int *v29;
  char *v30;
  int v31;
  std::string *v32;
  size_t v33;
  std::string::size_type v34;
  int *v35;
  char *v36;
  void *v37;
  int v38;
  std::string *v39;
  size_t v40;
  void *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  int *v45;
  char *v46;
  int v47;
  std::string *v48;
  size_t v49;
  int *v50;
  char *v51;
  void *v52;
  uint64_t v53;
  const char *v54;
  const char *v55;
  int *v56;
  char *v57;
  int v58;
  std::string *v59;
  size_t size;
  int *v61;
  char *v62;
  void *exception;
  uint64_t v64;
  const char *v65;
  const char *v66;
  int *v67;
  char *v68;
  int v69;
  std::string *v70;
  size_t v71;
  int *v72;
  char *v73;
  void *v74;
  uint64_t v75;
  const char *v76;
  const char *v77;
  int *v78;
  char *v79;
  int v80;
  std::string *v81;
  size_t v82;
  int *v83;
  char *v84;
  void *v85;
  uint64_t v86;
  const char *v87;
  const char *v88;
  int *v89;
  char *v90;
  int v91;
  std::string *v92;
  size_t v93;
  int *v94;
  char *v95;
  void *v96;
  int v97;
  std::string *v98;
  size_t v99;
  void *v100;
  uint64_t v101;
  const char *v102;
  const char *v103;
  int *v104;
  char *v105;
  int v106;
  std::string *v107;
  size_t v108;
  std::string::size_type v109;
  int *v110;
  char *v111;
  void *v112;
  const char *v113;
  const char *v114;
  int *v115;
  char *v116;
  int v117;
  std::string *v118;
  size_t v119;
  int *v120;
  char *v121;
  void *v122;
  int v123;
  std::string *v124;
  size_t v125;
  void *v126;
  const char *v127;
  const char *v128;
  int *v129;
  char *v130;
  int v131;
  std::string *v132;
  size_t v133;
  std::string *v134;
  int *v135;
  char *v136;
  void *v137;
  std::string v138;
  std::string v139;
  char v140;
  std::string *v141;

  faiss::read_index_header(a1, (uint64_t)a2);
  v6 = (unint64_t *)(a1 + 48);
  v7 = (**(uint64_t (***)(char *, uint64_t, uint64_t, uint64_t))a2)(a2, a1 + 48, 8, 1);
  if (v7 != 1)
  {
    v53 = v7;
    memset(&v139, 0, sizeof(v139));
    v54 = a2 + 8;
    v55 = a2 + 8;
    if (a2[31] < 0)
      v55 = *(const char **)v54;
    v56 = __error();
    v57 = strerror(*v56);
    v58 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v55, v53, 1uLL, v57);
    v59 = &v139;
    std::string::resize(&v139, v58 + 1, 0);
    if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      size = HIBYTE(v139.__r_.__value_.__r.__words[2]);
    }
    else
    {
      size = v139.__r_.__value_.__l.__size_;
      v59 = (std::string *)v139.__r_.__value_.__r.__words[0];
    }
    if (a2[31] < 0)
      v54 = *(const char **)v54;
    v61 = __error();
    v62 = strerror(*v61);
    snprintf((char *)v59, size, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v54, v53, 1uLL, v62);
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v139, "void faiss::read_ivf_header(IndexIVF *, IOReader *, std::vector<std::vector<Index::idx_t>> *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 390);
  }
  v8 = (**(uint64_t (***)(char *, uint64_t, uint64_t, uint64_t))a2)(a2, a1 + 136, 8, 1);
  if (v8 != 1)
  {
    v64 = v8;
    memset(&v139, 0, sizeof(v139));
    v65 = a2 + 8;
    v66 = a2 + 8;
    if (a2[31] < 0)
      v66 = *(const char **)v65;
    v67 = __error();
    v68 = strerror(*v67);
    v69 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v66, v64, 1uLL, v68);
    v70 = &v139;
    std::string::resize(&v139, v69 + 1, 0);
    if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      v71 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
    }
    else
    {
      v71 = v139.__r_.__value_.__l.__size_;
      v70 = (std::string *)v139.__r_.__value_.__r.__words[0];
    }
    if (a2[31] < 0)
      v65 = *(const char **)v65;
    v72 = __error();
    v73 = strerror(*v72);
    snprintf((char *)v70, v71, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v65, v64, 1uLL, v73);
    v74 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v74, &v139, "void faiss::read_ivf_header(IndexIVF *, IOReader *, std::vector<std::vector<Index::idx_t>> *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 391);
  }
  *(_QWORD *)(a1 + 40) = faiss::read_index((faiss *)a2, 0, v9);
  *(_BYTE *)(a1 + 57) = 1;
  if (a3)
  {
    std::vector<std::vector<long long>>::resize(a3, *v6);
    if (*v6)
    {
      v10 = 0;
      v11 = 0;
      do
      {
        v138.__r_.__value_.__r.__words[0] = 0;
        v12 = (**(uint64_t (***)(char *, std::string *, uint64_t, uint64_t))a2)(a2, &v138, 8, 1);
        if (v12 != 1)
        {
          v42 = v12;
          memset(&v139, 0, sizeof(v139));
          v43 = a2 + 8;
          v44 = a2 + 8;
          if (a2[31] < 0)
            v44 = *(const char **)v43;
          v45 = __error();
          v46 = strerror(*v45);
          v47 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v44, v42, 1uLL, v46);
          v48 = &v139;
          std::string::resize(&v139, v47 + 1, 0);
          if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          {
            v49 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
          }
          else
          {
            v49 = v139.__r_.__value_.__l.__size_;
            v48 = (std::string *)v139.__r_.__value_.__r.__words[0];
          }
          if (a2[31] < 0)
            v43 = *(const char **)v43;
          v50 = __error();
          v51 = strerror(*v50);
          snprintf((char *)v48, v49, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v43, v42, 1uLL, v51);
          v52 = __cxa_allocate_exception(0x20uLL);
          faiss::FaissException::FaissException(v52, &v139, "void faiss::read_ivf_header(IndexIVF *, IOReader *, std::vector<std::vector<Index::idx_t>> *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 397);
        }
        if (v138.__r_.__value_.__r.__words[0] >> 40)
        {
          memset(&v139, 0, sizeof(v139));
          v38 = snprintf(0, 0, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
          std::string::resize(&v139, v38 + 1, 0);
          if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v39 = &v139;
          else
            v39 = (std::string *)v139.__r_.__value_.__r.__words[0];
          if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v40 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
          else
            v40 = v139.__r_.__value_.__l.__size_;
          snprintf((char *)v39, v40, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
          v41 = __cxa_allocate_exception(0x20uLL);
          faiss::FaissException::FaissException(v41, &v139, "void faiss::read_ivf_header(IndexIVF *, IOReader *, std::vector<std::vector<Index::idx_t>> *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 397);
        }
        std::vector<long long>::resize(*a3 + v10, v138.__r_.__value_.__r.__words[0]);
        v13 = (**(uint64_t (***)(char *, _QWORD, uint64_t, std::string::size_type))a2)(a2, *(_QWORD *)(*a3 + v10), 8, v138.__r_.__value_.__r.__words[0]);
        if (v13 != v138.__r_.__value_.__r.__words[0])
        {
          v25 = v138.__r_.__value_.__r.__words[0];
          v26 = v13;
          memset(&v139, 0, sizeof(v139));
          v27 = a2 + 8;
          v28 = a2 + 8;
          if (a2[31] < 0)
            v28 = *(const char **)v27;
          v29 = __error();
          v30 = strerror(*v29);
          v31 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v28, v26, v25, v30);
          v32 = &v139;
          std::string::resize(&v139, v31 + 1, 0);
          if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          {
            v33 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
          }
          else
          {
            v33 = v139.__r_.__value_.__l.__size_;
            v32 = (std::string *)v139.__r_.__value_.__r.__words[0];
          }
          if (a2[31] < 0)
            v27 = *(const char **)v27;
          v34 = v138.__r_.__value_.__r.__words[0];
          v35 = __error();
          v36 = strerror(*v35);
          snprintf((char *)v32, v33, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v27, v26, v34, v36);
          v37 = __cxa_allocate_exception(0x20uLL);
          faiss::FaissException::FaissException(v37, &v139, "void faiss::read_ivf_header(IndexIVF *, IOReader *, std::vector<std::vector<Index::idx_t>> *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 397);
        }
        ++v11;
        v10 += 24;
      }
      while (v11 < *v6);
    }
  }
  v140 = 0;
  v14 = (**(uint64_t (***)(char *, char *, uint64_t, uint64_t))a2)(a2, &v140, 1, 1);
  if (v14 != 1)
  {
    v75 = v14;
    memset(&v139, 0, sizeof(v139));
    v76 = a2 + 8;
    v77 = a2 + 8;
    if (a2[31] < 0)
      v77 = *(const char **)v76;
    v78 = __error();
    v79 = strerror(*v78);
    v80 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v77, v75, 1uLL, v79);
    v81 = &v139;
    std::string::resize(&v139, v80 + 1, 0);
    if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      v82 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
    }
    else
    {
      v82 = v139.__r_.__value_.__l.__size_;
      v81 = (std::string *)v139.__r_.__value_.__r.__words[0];
    }
    if (a2[31] < 0)
      v76 = *(const char **)v76;
    v83 = __error();
    v84 = strerror(*v83);
    snprintf((char *)v81, v82, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v76, v75, 1uLL, v84);
    v85 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v85, &v139, "void faiss::read_direct_map(DirectMap *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 370);
  }
  *(_DWORD *)(a1 + 160) = v140;
  v138.__r_.__value_.__r.__words[0] = 0;
  v15 = (**(uint64_t (***)(char *, std::string *, uint64_t, uint64_t))a2)(a2, &v138, 8, 1);
  if (v15 != 1)
  {
    v86 = v15;
    memset(&v139, 0, sizeof(v139));
    v87 = a2 + 8;
    v88 = a2 + 8;
    if (a2[31] < 0)
      v88 = *(const char **)v87;
    v89 = __error();
    v90 = strerror(*v89);
    v91 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v88, v86, 1uLL, v90);
    v92 = &v139;
    std::string::resize(&v139, v91 + 1, 0);
    if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      v93 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
    }
    else
    {
      v93 = v139.__r_.__value_.__l.__size_;
      v92 = (std::string *)v139.__r_.__value_.__r.__words[0];
    }
    if (a2[31] < 0)
      v87 = *(const char **)v87;
    v94 = __error();
    v95 = strerror(*v94);
    snprintf((char *)v92, v93, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v87, v86, 1uLL, v95);
    v96 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v96, &v139, "void faiss::read_direct_map(DirectMap *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 372);
  }
  if (v138.__r_.__value_.__r.__words[0] >> 40)
  {
    memset(&v139, 0, sizeof(v139));
    v97 = snprintf(0, 0, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
    std::string::resize(&v139, v97 + 1, 0);
    if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v98 = &v139;
    else
      v98 = (std::string *)v139.__r_.__value_.__r.__words[0];
    if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v99 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
    else
      v99 = v139.__r_.__value_.__l.__size_;
    snprintf((char *)v98, v99, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
    v100 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v100, &v139, "void faiss::read_direct_map(DirectMap *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 372);
  }
  std::vector<long long>::resize(a1 + 168, v138.__r_.__value_.__r.__words[0]);
  v16 = (**(uint64_t (***)(char *, _QWORD, uint64_t, std::string::size_type))a2)(a2, *(_QWORD *)(a1 + 168), 8, v138.__r_.__value_.__r.__words[0]);
  v17 = v138.__r_.__value_.__r.__words[0];
  if (v16 != v138.__r_.__value_.__r.__words[0])
  {
    v101 = v16;
    memset(&v139, 0, sizeof(v139));
    v102 = a2 + 8;
    v103 = a2 + 8;
    if (a2[31] < 0)
      v103 = *(const char **)v102;
    v104 = __error();
    v105 = strerror(*v104);
    v106 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v103, v101, v17, v105);
    v107 = &v139;
    std::string::resize(&v139, v106 + 1, 0);
    if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    {
      v108 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
    }
    else
    {
      v108 = v139.__r_.__value_.__l.__size_;
      v107 = (std::string *)v139.__r_.__value_.__r.__words[0];
    }
    if (a2[31] < 0)
      v102 = *(const char **)v102;
    v109 = v138.__r_.__value_.__r.__words[0];
    v110 = __error();
    v111 = strerror(*v110);
    snprintf((char *)v107, v108, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v102, v101, v109, v111);
    v112 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v112, &v139, "void faiss::read_direct_map(DirectMap *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 372);
  }
  if (*(_DWORD *)(a1 + 160) == 2)
  {
    memset(&v139, 0, sizeof(v139));
    v141 = 0;
    v18 = (**(uint64_t (***)(char *, std::string **, uint64_t, uint64_t))a2)(a2, &v141, 8, 1);
    if (v18 != 1)
    {
      memset(&v138, 0, sizeof(v138));
      v113 = a2 + 8;
      v114 = a2 + 8;
      if (a2[31] < 0)
        v114 = *(const char **)v113;
      v115 = __error();
      v116 = strerror(*v115);
      v117 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v114, v18, 1uLL, v116);
      v118 = &v138;
      std::string::resize(&v138, v117 + 1, 0);
      if ((v138.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v119 = HIBYTE(v138.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v119 = v138.__r_.__value_.__l.__size_;
        v118 = (std::string *)v138.__r_.__value_.__r.__words[0];
      }
      if (a2[31] < 0)
        v113 = *(const char **)v113;
      v120 = __error();
      v121 = strerror(*v120);
      snprintf((char *)v118, v119, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (1)", v113, v18, 1uLL, v121);
      v122 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v122, &v138, "void faiss::read_direct_map(DirectMap *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 376);
    }
    if ((unint64_t)v141 >> 40)
    {
      memset(&v138, 0, sizeof(v138));
      v123 = snprintf(0, 0, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
      std::string::resize(&v138, v123 + 1, 0);
      if ((v138.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v124 = &v138;
      else
        v124 = (std::string *)v138.__r_.__value_.__r.__words[0];
      if ((v138.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v125 = HIBYTE(v138.__r_.__value_.__r.__words[2]);
      else
        v125 = v138.__r_.__value_.__l.__size_;
      snprintf((char *)v124, v125, "Error: '%s' failed", "size >= 0 && size < (uint64_t{1} << 40)");
      v126 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v126, &v138, "void faiss::read_direct_map(DirectMap *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 376);
    }
    std::vector<std::pair<long long,long long>>::resize((uint64_t)&v139, (unint64_t)v141);
    v19 = (std::string *)(**(uint64_t (***)(char *, std::string::size_type, uint64_t, std::string *))a2)(a2, v139.__r_.__value_.__r.__words[0], 16, v141);
    v20 = v141;
    if (v19 != v141)
    {
      memset(&v138, 0, sizeof(v138));
      v127 = a2 + 8;
      v128 = a2 + 8;
      if (a2[31] < 0)
        v128 = *(const char **)v127;
      v129 = __error();
      v130 = strerror(*v129);
      v131 = snprintf(0, 0, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v128, (size_t)v19, (size_t)v20, v130);
      v132 = &v138;
      std::string::resize(&v138, v131 + 1, 0);
      if ((v138.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      {
        v133 = HIBYTE(v138.__r_.__value_.__r.__words[2]);
      }
      else
      {
        v133 = v138.__r_.__value_.__l.__size_;
        v132 = (std::string *)v138.__r_.__value_.__r.__words[0];
      }
      if (a2[31] < 0)
        v127 = *(const char **)v127;
      v134 = v141;
      v135 = __error();
      v136 = strerror(*v135);
      snprintf((char *)v132, v133, "Error: '%s' failed: read error in %s: %zd != %zd (%s)", "ret == (size)", v127, (size_t)v19, (size_t)v134, v136);
      v137 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v137, &v138, "void faiss::read_direct_map(DirectMap *, IOReader *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 376);
    }
    v21 = a1 + 192;
    std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__rehash<true>(a1 + 192, vcvtps_u32_f32((float)(unint64_t)((uint64_t)(v139.__r_.__value_.__l.__size_ - v139.__r_.__value_.__r.__words[0]) >> 4)/ *(float *)(a1 + 224)));
    v23 = v139.__r_.__value_.__l.__size_;
    v22 = (_OWORD *)v139.__r_.__value_.__r.__words[0];
    if (v139.__r_.__value_.__r.__words[0] != v139.__r_.__value_.__l.__size_)
    {
      do
      {
        *(_OWORD *)&v138.__r_.__value_.__l.__data_ = *v22;
        v24 = v138.__r_.__value_.__l.__size_;
        v141 = &v138;
        std::__hash_table<std::__hash_value_type<unsigned long long,long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v21, (unint64_t *)&v138, (uint64_t)&std::piecewise_construct, (_QWORD **)&v141)[3] = v24;
        ++v22;
      }
      while (v22 != (_OWORD *)v23);
      v22 = (_OWORD *)v139.__r_.__value_.__r.__words[0];
    }
    if (v22)
    {
      v139.__r_.__value_.__l.__size_ = (std::string::size_type)v22;
      operator delete(v22);
    }
  }
}

void sub_1D490BB78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  void *v26;

  __cxa_free_exception(v26);
  if (a20 < 0)
    operator delete(__p);
  if (a21)
    operator delete(a21);
  _Unwind_Resume(a1);
}

faiss::ArrayInvertedLists *faiss::read_InvertedLists(faiss *this, faiss::IndexIVF *a2, faiss::IOReader *a3)
{
  faiss::ArrayInvertedLists *result;
  uint64_t v5;
  int v6;
  std::string *v7;
  size_t size;
  void *exception;
  int v10;
  std::string *v11;
  size_t v12;
  void *v13;
  std::string v14;

  result = faiss::read_InvertedLists(a2, a3);
  if (result)
  {
    if (*((_QWORD *)result + 1) != *((_QWORD *)this + 6))
    {
      memset(&v14, 0, sizeof(v14));
      v6 = snprintf(0, 0, "Error: '%s' failed", "ils->nlist == ivf->nlist");
      std::string::resize(&v14, v6 + 1, 0);
      if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v7 = &v14;
      else
        v7 = (std::string *)v14.__r_.__value_.__r.__words[0];
      if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v14.__r_.__value_.__r.__words[2]);
      else
        size = v14.__r_.__value_.__l.__size_;
      snprintf((char *)v7, size, "Error: '%s' failed", "ils->nlist == ivf->nlist");
      exception = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(exception, &v14, "void faiss::read_InvertedLists(IndexIVF *, IOReader *, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 266);
    }
    v5 = *((_QWORD *)result + 2);
    if (v5 != -1 && v5 != *((_QWORD *)this + 16))
    {
      memset(&v14, 0, sizeof(v14));
      v10 = snprintf(0, 0, "Error: '%s' failed", "ils->code_size == InvertedLists::INVALID_CODE_SIZE || ils->code_size == ivf->code_size");
      std::string::resize(&v14, v10 + 1, 0);
      if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v11 = &v14;
      else
        v11 = (std::string *)v14.__r_.__value_.__r.__words[0];
      if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v12 = HIBYTE(v14.__r_.__value_.__r.__words[2]);
      else
        v12 = v14.__r_.__value_.__l.__size_;
      snprintf((char *)v11, v12, "Error: '%s' failed", "ils->code_size == InvertedLists::INVALID_CODE_SIZE || ils->code_size == ivf->code_size");
      v13 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v13, &v14, "void faiss::read_InvertedLists(IndexIVF *, IOReader *, int)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/impl/index_read.cpp", 269);
    }
  }
  *((_QWORD *)this + 14) = result;
  *((_BYTE *)this + 120) = 1;
  return result;
}

void sub_1D490BE00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t faiss::read_index(__sFILE *this, __sFILE *a2)
{
  uint64_t index;
  _BYTE v5[48];

  faiss::FileIOReader::FileIOReader((uint64_t)v5, this);
  index = faiss::read_index((faiss *)v5, (faiss::IOReader *)a2);
  faiss::FileIOReader::~FileIOReader((faiss::FileIOReader *)v5);
  return index;
}

void sub_1D490BE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  faiss::FileIOReader::~FileIOReader((faiss::FileIOReader *)&a9);
  _Unwind_Resume(a1);
}

void sub_1D490BEE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  faiss::FileIOReader::~FileIOReader((faiss::FileIOReader *)&a9);
  _Unwind_Resume(a1);
}

uint64_t faiss::read_VectorTransform(faiss *this, const char *a2)
{
  faiss::IOReader *v2;
  uint64_t VectorTransform;
  _BYTE v5[48];

  faiss::FileIOReader::FileIOReader((faiss::FileIOReader *)v5, (const char *)this);
  VectorTransform = faiss::read_VectorTransform((faiss *)v5, v2);
  faiss::FileIOReader::~FileIOReader((faiss::FileIOReader *)v5);
  return VectorTransform;
}

void sub_1D490BF38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  faiss::FileIOReader::~FileIOReader((faiss::FileIOReader *)&a9);
  _Unwind_Resume(a1);
}

faiss::MultiIndexQuantizer *faiss::MultiIndexQuantizer::MultiIndexQuantizer(faiss::MultiIndexQuantizer *this)
{
  *((_DWORD *)this + 2) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_WORD *)this + 12) = 256;
  *(_QWORD *)((char *)this + 28) = 1;
  *(_QWORD *)this = &off_1E9806748;
  faiss::ProductQuantizer::ProductQuantizer((faiss::MultiIndexQuantizer *)((char *)this + 40));
  return this;
}

void sub_1D490BF98(_Unwind_Exception *a1)
{
  faiss::Index *v1;

  faiss::Index::~Index(v1);
  _Unwind_Resume(a1);
}

void std::vector<std::pair<long long,long long>>::resize(uint64_t a1, unint64_t a2)
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
    std::vector<std::pair<long long,long long>>::__append((void **)a1, a2 - v2);
  }
}

void std::vector<std::pair<long long,long long>>::__append(void **a1, unint64_t a2)
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
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 4;
    v11 = v5 - (_BYTE *)*a1;
    if (v11 >> 3 > v9)
      v9 = v11 >> 3;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0)
      v12 = 0xFFFFFFFFFFFFFFFLL;
    else
      v12 = v9;
    if (v12)
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<faiss::BufferList::Buffer>>(v4, v12);
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

_QWORD *std::vector<unsigned long>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<long long>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_1D490C140(_Unwind_Exception *exception_object)
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

_QWORD *faiss::ScopeDeleter1<faiss::ProductQuantizer>::~ScopeDeleter1(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;

  v2 = (_QWORD *)*a1;
  if (*a1)
  {
    v3 = (void *)v2[16];
    if (v3)
    {
      v2[17] = v3;
      operator delete(v3);
    }
    v4 = (void *)v2[13];
    if (v4)
    {
      v2[14] = v4;
      operator delete(v4);
    }
    MEMORY[0x1D82628A4](v2, 0x10A0C40B82B9555);
  }
  return a1;
}

uint64_t faiss::IndexPQ::IndexPQ(uint64_t a1, int a2, unint64_t a3, unint64_t a4, int a5)
{
  int v5;
  int v6;

  v5 = a4;
  v6 = a3;
  *(_DWORD *)(a1 + 8) = a2;
  *(_QWORD *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 24) = 256;
  *(_DWORD *)(a1 + 28) = a5;
  *(_DWORD *)(a1 + 32) = 0;
  *(_QWORD *)a1 = off_1E9806C60;
  faiss::ProductQuantizer::ProductQuantizer((faiss::ProductQuantizer *)(a1 + 40), a2, a3, a4);
  *(_QWORD *)(a1 + 192) = 0;
  *(_QWORD *)(a1 + 200) = 0;
  *(_QWORD *)(a1 + 208) = 0;
  faiss::PolysemousTraining::PolysemousTraining((faiss::PolysemousTraining *)(a1 + 224));
  *(_BYTE *)(a1 + 25) = 0;
  *(_BYTE *)(a1 + 216) = 0;
  *(_DWORD *)(a1 + 320) = v5 * v6 + 1;
  *(_DWORD *)(a1 + 312) = 0;
  *(_BYTE *)(a1 + 316) = 0;
  return a1;
}

void sub_1D490C258(_Unwind_Exception *a1)
{
  faiss::Index *v1;
  faiss::ProductQuantizer *v2;
  void **v3;
  void *v5;

  v5 = *v3;
  if (*v3)
  {
    *((_QWORD *)v1 + 25) = v5;
    operator delete(v5);
  }
  faiss::ProductQuantizer::~ProductQuantizer(v2);
  faiss::Index::~Index(v1);
  _Unwind_Resume(a1);
}

faiss::IndexPQ *faiss::IndexPQ::IndexPQ(faiss::IndexPQ *this)
{
  *((_DWORD *)this + 2) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_WORD *)this + 12) = 256;
  *(_QWORD *)((char *)this + 28) = 1;
  *(_QWORD *)this = off_1E9806C60;
  faiss::ProductQuantizer::ProductQuantizer((faiss::IndexPQ *)((char *)this + 40));
  *((_QWORD *)this + 24) = 0;
  *((_QWORD *)this + 25) = 0;
  *((_QWORD *)this + 26) = 0;
  faiss::PolysemousTraining::PolysemousTraining((faiss::IndexPQ *)((char *)this + 224));
  *((_DWORD *)this + 7) = 1;
  *((_BYTE *)this + 25) = 0;
  *((_BYTE *)this + 216) = 0;
  *((_DWORD *)this + 80) = *((_DWORD *)this + 12) * *((_DWORD *)this + 14) + 1;
  *((_DWORD *)this + 78) = 0;
  *((_BYTE *)this + 316) = 0;
  return this;
}

void sub_1D490C328(_Unwind_Exception *a1)
{
  faiss::Index *v1;
  faiss::ProductQuantizer *v2;
  void **v3;
  void **v4;
  void *v6;

  v4 = v3;
  v6 = *v4;
  if (*v4)
  {
    *((_QWORD *)v1 + 25) = v6;
    operator delete(v6);
  }
  faiss::ProductQuantizer::~ProductQuantizer(v2);
  faiss::Index::~Index(v1);
  _Unwind_Resume(a1);
}

void faiss::IndexPQ::train(faiss::IndexPQ *this, uint64_t a2, const float *a3)
{
  unint64_t v5;
  uint64_t v6;
  const char *v7;

  if (*((_BYTE *)this + 216))
  {
    if (a2 / 4 >= *((int *)this + 66))
      v5 = *((int *)this + 66);
    else
      v5 = a2 / 4;
    v6 = a2 - v5;
    if (*((_BYTE *)this + 24))
    {
      v7 = "these";
      if (!v5)
        v7 = "centroids";
      printf("PQ training on %lld points, remains %lld points: training polysemous on %s\n", a2 - v5, v5, v7);
    }
    faiss::ProductQuantizer::train((faiss::IndexPQ *)((char *)this + 40), v6, a3);
    faiss::PolysemousTraining::optimize_pq_for_hamming((faiss::IndexPQ *)((char *)this + 224), (faiss::IndexPQ *)((char *)this + 40), v5, &a3[v6 * *((int *)this + 2)]);
  }
  else
  {
    faiss::ProductQuantizer::train((faiss::IndexPQ *)((char *)this + 40), a2, a3);
  }
  *((_BYTE *)this + 25) = 1;
}

uint64_t faiss::IndexPQ::add(faiss::IndexPQ *this, unint64_t a2, const float *a3)
{
  unint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t result;
  int v14;
  std::string *v15;
  size_t size;
  void *exception;
  std::string v18;

  if (!*((_BYTE *)this + 25))
  {
    memset(&v18, 0, sizeof(v18));
    v14 = snprintf(0, 0, "Error: '%s' failed", "is_trained");
    std::string::resize(&v18, v14 + 1, 0);
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v15 = &v18;
    else
      v15 = (std::string *)v18.__r_.__value_.__r.__words[0];
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v18.__r_.__value_.__r.__words[2]);
    else
      size = v18.__r_.__value_.__l.__size_;
    snprintf((char *)v15, size, "Error: '%s' failed", "is_trained");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v18, "virtual void faiss::IndexPQ::add(idx_t, const float *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 73);
  }
  v8 = *((_QWORD *)this + 24);
  v6 = (unint64_t *)((char *)this + 192);
  v7 = v8;
  v9 = *(v6 - 22);
  v10 = *(v6 - 15);
  v11 = (v9 + a2) * v10;
  v12 = v6[1] - v8;
  if (v11 <= v12)
  {
    if (v11 < v12)
      *((_QWORD *)this + 25) = v7 + v11;
  }
  else
  {
    std::vector<unsigned char>::__append(v6, v11 - v12);
    v9 = *((_QWORD *)this + 2);
    v10 = *((_QWORD *)this + 9);
    v7 = *((_QWORD *)this + 24);
  }
  result = faiss::ProductQuantizer::compute_codes((faiss::IndexPQ *)((char *)this + 40), a3, (unsigned __int8 *)(v7 + v10 * v9), a2);
  *((_QWORD *)this + 2) += a2;
  return result;
}

void sub_1D490C590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void *faiss::IndexPQ::add_encoded(faiss::IndexPQ *this, uint64_t a2, const unsigned __int8 *a3)
{
  unint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *result;
  int v14;
  std::string *v15;
  size_t size;
  void *exception;
  std::string v18;

  if (!*((_BYTE *)this + 25))
  {
    memset(&v18, 0, sizeof(v18));
    v14 = snprintf(0, 0, "Error: '%s' failed", "is_trained");
    std::string::resize(&v18, v14 + 1, 0);
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v15 = &v18;
    else
      v15 = (std::string *)v18.__r_.__value_.__r.__words[0];
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v18.__r_.__value_.__r.__words[2]);
    else
      size = v18.__r_.__value_.__l.__size_;
    snprintf((char *)v15, size, "Error: '%s' failed", "is_trained");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v18, "void faiss::IndexPQ::add_encoded(idx_t, const uint8_t *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 80);
  }
  v8 = *((_QWORD *)this + 24);
  v6 = (unint64_t *)((char *)this + 192);
  v7 = v8;
  v9 = *(v6 - 22);
  v10 = *(v6 - 15);
  v11 = (v9 + a2) * v10;
  v12 = v6[1] - v8;
  if (v11 <= v12)
  {
    if (v11 < v12)
      *((_QWORD *)this + 25) = v7 + v11;
  }
  else
  {
    std::vector<unsigned char>::__append(v6, v11 - v12);
    v9 = *((_QWORD *)this + 2);
    v10 = *((_QWORD *)this + 9);
    v7 = *((_QWORD *)this + 24);
  }
  result = memcpy((void *)(v7 + v10 * v9), a3, v10 * a2);
  *((_QWORD *)this + 2) += a2;
  return result;
}

void sub_1D490C704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t faiss::IndexPQ::remove_ids(_QWORD *a1, uint64_t (***a2)(_QWORD, uint64_t))
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v3 = a1[2];
  if (v3 < 1)
  {
    v6 = 0;
  }
  else
  {
    v5 = 0;
    v6 = 0;
    do
    {
      if (((**a2)(a2, v5) & 1) == 0)
      {
        if (v5 > v6)
          memmove((void *)(a1[24] + a1[9] * v6), (const void *)(a1[24] + a1[9] * v5), a1[9]);
        ++v6;
      }
      ++v5;
      v3 = a1[2];
    }
    while (v5 < v3);
  }
  v7 = v3 - v6;
  if (v3 != v6)
  {
    v8 = a1[24];
    a1[2] = v6;
    v9 = a1[9] * v6;
    v10 = a1[25] - v8;
    if (v9 <= v10)
    {
      if (v9 < v10)
        a1[25] = v8 + v9;
    }
    else
    {
      std::vector<unsigned char>::__append(a1 + 24, v9 - v10);
    }
  }
  return v7;
}

_QWORD *faiss::IndexPQ::reset(_QWORD *this)
{
  this[25] = this[24];
  this[2] = 0;
  return this;
}

_DWORD *faiss::IndexPQ::reconstruct_n(_DWORD *this, uint64_t a2, uint64_t a3, float *a4)
{
  uint64_t v6;
  uint64_t i;
  int v9;
  std::string *v10;
  size_t size;
  void *exception;
  std::string v13;

  if (a3)
  {
    if (a2 < 0 || (v6 = (uint64_t)this, a3 + a2 > *((_QWORD *)this + 2)))
    {
      memset(&v13, 0, sizeof(v13));
      v9 = snprintf(0, 0, "Error: '%s' failed", "ni == 0 || (i0 >= 0 && i0 + ni <= ntotal)");
      std::string::resize(&v13, v9 + 1, 0);
      if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v10 = &v13;
      else
        v10 = (std::string *)v13.__r_.__value_.__r.__words[0];
      if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v13.__r_.__value_.__r.__words[2]);
      else
        size = v13.__r_.__value_.__l.__size_;
      snprintf((char *)v10, size, "Error: '%s' failed", "ni == 0 || (i0 >= 0 && i0 + ni <= ntotal)");
      exception = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(exception, &v13, "virtual void faiss::IndexPQ::reconstruct_n(idx_t, idx_t, float *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 114);
    }
    if (a3 >= 1)
    {
      for (i = 0; i != a3; ++i)
        this = faiss::ProductQuantizer::decode((_DWORD *)(v6 + 40), *(_QWORD *)(v6 + 192) + *(_QWORD *)(v6 + 72) * (a2 + i), (uint64_t)&a4[i * *(int *)(v6 + 8)]);
    }
  }
  return this;
}

void sub_1D490C954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

_DWORD *faiss::IndexPQ::reconstruct(faiss::IndexPQ *this, uint64_t a2, float *a3)
{
  int v4;
  std::string *v5;
  size_t size;
  void *exception;
  std::string v8;

  if (a2 < 0 || *((_QWORD *)this + 2) <= a2)
  {
    memset(&v8, 0, sizeof(v8));
    v4 = snprintf(0, 0, "Error: '%s' failed", "key >= 0 && key < ntotal");
    std::string::resize(&v8, v4 + 1, 0);
    if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v5 = &v8;
    else
      v5 = (std::string *)v8.__r_.__value_.__r.__words[0];
    if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v8.__r_.__value_.__r.__words[2]);
    else
      size = v8.__r_.__value_.__l.__size_;
    snprintf((char *)v5, size, "Error: '%s' failed", "key >= 0 && key < ntotal");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v8, "virtual void faiss::IndexPQ::reconstruct(idx_t, float *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 122);
  }
  return faiss::ProductQuantizer::decode((_DWORD *)this + 10, *((_QWORD *)this + 24) + *((_QWORD *)this + 9) * a2, (uint64_t)a3);
}

void sub_1D490CA70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t faiss::IndexPQ::get_distance_computer(faiss::IndexPQ *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *((_QWORD *)this + 7);
  if (v2 == 16)
  {
    v3 = operator new();
    *(_QWORD *)v3 = off_1E9805AE0;
    *(_QWORD *)(v3 + 64) = 0;
    *(_QWORD *)(v3 + 48) = (char *)this + 40;
    *(_QWORD *)(v3 + 72) = 0;
    *(_QWORD *)(v3 + 80) = 0;
    std::vector<float>::resize(v3 + 64, *((_QWORD *)this + 10) * *((_QWORD *)this + 6));
  }
  else
  {
    if (v2 == 8)
    {
      v3 = operator new();
      *(_QWORD *)v3 = off_1E9805AA8;
    }
    else
    {
      v3 = operator new();
      *(_QWORD *)v3 = off_1E9805B18;
    }
    *(_QWORD *)(v3 + 64) = 0;
    *(_QWORD *)(v3 + 48) = (char *)this + 40;
    *(_QWORD *)(v3 + 72) = 0;
    *(_QWORD *)(v3 + 80) = 0;
    std::vector<float>::resize(v3 + 64, *((_QWORD *)this + 10) * *((_QWORD *)this + 6));
  }
  v4 = *((_QWORD *)this + 2);
  *(_QWORD *)(v3 + 8) = *((int *)this + 2);
  *(_DWORD *)(v3 + 16) = *((_DWORD *)this + 7);
  v5 = *((_QWORD *)this + 24);
  *(_QWORD *)(v3 + 24) = v4;
  *(_QWORD *)(v3 + 32) = v5;
  v6 = *(_QWORD **)(v3 + 48);
  v7 = v6[5];
  *(_QWORD *)(v3 + 40) = v6[4];
  if (v7 * v7 * v6[1] == (uint64_t)(v6[17] - v6[16]) >> 2)
    v8 = v6[16];
  else
    v8 = 0;
  *(_QWORD *)(v3 + 56) = v8;
  *(_QWORD *)(v3 + 88) = 0;
  return v3;
}

void sub_1D490CBF4(_Unwind_Exception *a1)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 72) = v4;
    operator delete(v4);
  }
  MEMORY[0x1D82628A4](v1, 0x10F1C40E4390973);
  _Unwind_Resume(a1);
}

uint64_t faiss::IndexPQ::search(faiss::IndexPQ *this, std::string::size_type a2, const float *a3, uint64_t a4, float *a5, uint64_t *a6)
{
  float *v8;
  const float *v10;
  int v12;
  int v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  faiss::IndexPQStats *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int *v26;
  int v27;
  uint64_t *indexPQ_stats;
  uint64_t v29;
  int v30;
  std::string *v31;
  size_t size;
  void *exception;
  int v34;
  std::string *v35;
  size_t v36;
  void *v37;
  int v38;
  std::string *v39;
  size_t v40;
  void *v41;
  int v42;
  std::string *v43;
  size_t v44;
  void *v45;
  std::string v46;
  float *v47;

  if (a4 <= 0)
  {
    memset(&v46, 0, sizeof(v46));
    v30 = snprintf(0, 0, "Error: '%s' failed", "k > 0");
    std::string::resize(&v46, v30 + 1, 0);
    if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v31 = &v46;
    else
      v31 = (std::string *)v46.__r_.__value_.__r.__words[0];
    if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v46.__r_.__value_.__r.__words[2]);
    else
      size = v46.__r_.__value_.__l.__size_;
    snprintf((char *)v31, size, "Error: '%s' failed", "k > 0");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v46, "virtual void faiss::IndexPQ::search(idx_t, const float *, idx_t, float *, idx_t *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 214);
  }
  if (!*((_BYTE *)this + 25))
  {
    memset(&v46, 0, sizeof(v46));
    v34 = snprintf(0, 0, "Error: '%s' failed", "is_trained");
    std::string::resize(&v46, v34 + 1, 0);
    if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v35 = &v46;
    else
      v35 = (std::string *)v46.__r_.__value_.__r.__words[0];
    if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v36 = HIBYTE(v46.__r_.__value_.__r.__words[2]);
    else
      v36 = v46.__r_.__value_.__l.__size_;
    snprintf((char *)v35, v36, "Error: '%s' failed", "is_trained");
    v37 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v37, &v46, "virtual void faiss::IndexPQ::search(idx_t, const float *, idx_t, float *, idx_t *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 216);
  }
  v8 = a5;
  v10 = a3;
  v12 = *((_DWORD *)this + 78);
  if ((v12 - 4) >= 2)
  {
    if (!v12)
    {
      v14 = *((_DWORD *)this + 7);
      v15 = (char *)this + 40;
      if (v14 == 1)
      {
        v46.__r_.__value_.__r.__words[0] = a2;
        v46.__r_.__value_.__l.__size_ = a4;
        v46.__r_.__value_.__r.__words[2] = (std::string::size_type)a6;
        v47 = a5;
        faiss::ProductQuantizer::search(v15, a3, a2, *((_QWORD *)this + 24), *((_QWORD *)this + 2), &v46, 1);
      }
      v46.__r_.__value_.__r.__words[0] = a2;
      v46.__r_.__value_.__l.__size_ = a4;
      v46.__r_.__value_.__r.__words[2] = (std::string::size_type)a6;
      v47 = a5;
      faiss::ProductQuantizer::search_ip(v15, a3, a2, *((_QWORD *)this + 24), *((_QWORD *)this + 2), &v46, 1);
    }
    v16 = (void *)operator new[]();
    v17 = (uint64_t)v16;
    if (*((_BYTE *)this + 316))
    {
      v18 = *((int *)this + 2);
      if (*((_QWORD *)this + 6) * *((_QWORD *)this + 7) != v18)
      {
        memset(&v46, 0, sizeof(v46));
        v42 = snprintf(0, 0, "Error: '%s' failed", "d == pq.nbits * pq.M");
        std::string::resize(&v46, v42 + 1, 0);
        if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v43 = &v46;
        else
          v43 = (std::string *)v46.__r_.__value_.__r.__words[0];
        if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v44 = HIBYTE(v46.__r_.__value_.__r.__words[2]);
        else
          v44 = v46.__r_.__value_.__l.__size_;
        snprintf((char *)v43, v44, "Error: '%s' failed", "d == pq.nbits * pq.M");
        v45 = __cxa_allocate_exception(0x20uLL);
        faiss::FaissException::FaissException(v45, &v46, "virtual void faiss::IndexPQ::search(idx_t, const float *, idx_t, float *, idx_t *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 246);
      }
      v19 = *((_QWORD *)this + 9);
      bzero(v16, v19 * a2);
      if (a2)
      {
        v20 = 0;
        do
        {
          if ((int)v18 >= 1)
          {
            v21 = 0;
            do
            {
              if (v10[v21] > 0.0)
                *(_BYTE *)(v17 + v20 * v19 + (v21 >> 3)) |= 1 << (v21 & 7);
              ++v21;
            }
            while (v18 != v21);
          }
          ++v20;
          v10 += v18;
        }
        while (v20 != a2);
      }
    }
    else
    {
      faiss::ProductQuantizer::compute_codes((faiss::IndexPQ *)((char *)this + 40), v10, (unsigned __int8 *)v16, a2);
    }
    if (*((_DWORD *)this + 78) == 3)
    {
      v46.__r_.__value_.__r.__words[0] = a2;
      v46.__r_.__value_.__l.__size_ = a4;
      v46.__r_.__value_.__r.__words[2] = (std::string::size_type)a6;
      v47 = v8;
      v22 = (faiss::IndexPQStats *)faiss::ProductQuantizer::search_sdc((_QWORD *)this + 5, v17, a2, *((_QWORD *)this + 24), *((_QWORD *)this + 2), &v46, 1);
    }
    else
    {
      v23 = a4 * a2;
      v24 = operator new[]();
      v46.__r_.__value_.__r.__words[0] = a2;
      v46.__r_.__value_.__l.__size_ = a4;
      v46.__r_.__value_.__r.__words[2] = (std::string::size_type)a6;
      v47 = (float *)v24;
      v25 = *((_DWORD *)this + 78);
      if (v25 == 2)
      {
        faiss::generalized_hammings_knn_hc((uint64_t *)&v46, v17, *((int8x16_t **)this + 24), *((_QWORD *)this + 2), *((_QWORD *)this + 9), 1);
      }
      else if (v25 == 1)
      {
        faiss::hammings_knn_hc((uint64_t *)&v46, v17, *((unint64_t **)this + 24), *((_QWORD *)this + 2), *((_QWORD *)this + 9), 1);
      }
      if (v23 >= 1)
      {
        v26 = (int *)v24;
        do
        {
          v27 = *v26++;
          *v8++ = (float)v27;
          --v23;
        }
        while (v23);
      }
      v22 = (faiss::IndexPQStats *)MEMORY[0x1D826288C](v24, 0x1000C8052888210);
    }
    indexPQ_stats = faiss::IndexPQStats::get_indexPQ_stats(v22);
    faiss::IndexPQStats::get_indexPQ_stats(void)::_stats += a2;
    v29 = *((_QWORD *)this + 2);
    faiss::IndexPQStats::get_indexPQ_stats((faiss::IndexPQStats *)indexPQ_stats);
    qword_1EFEC2C90 += v29 * a2;
    return MEMORY[0x1D826288C](v17, 0x1000C8077774924);
  }
  else
  {
    if (*((_DWORD *)this + 7) != 1)
    {
      memset(&v46, 0, sizeof(v46));
      v38 = snprintf(0, 0, "Error: '%s' failed", "metric_type == METRIC_L2");
      std::string::resize(&v46, v38 + 1, 0);
      if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v39 = &v46;
      else
        v39 = (std::string *)v46.__r_.__value_.__r.__words[0];
      if ((v46.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v40 = HIBYTE(v46.__r_.__value_.__r.__words[2]);
      else
        v40 = v46.__r_.__value_.__l.__size_;
      snprintf((char *)v39, v40, "Error: '%s' failed", "metric_type == METRIC_L2");
      v41 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v41, &v46, "virtual void faiss::IndexPQ::search(idx_t, const float *, idx_t, float *, idx_t *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 234);
    }
    return faiss::IndexPQ::search_core_polysemous(this, a2, a3, a4, a5, a6);
  }
}

void sub_1D490D230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  uint64_t v16;
  void *v17;

  __cxa_free_exception(v17);
  if (a16 < 0)
    operator delete(__p);
  MEMORY[0x1D826288C](v16, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

uint64_t *faiss::IndexPQStats::get_indexPQ_stats(faiss::IndexPQStats *this)
{
  unsigned __int8 v1;

  {
    faiss::IndexPQStats::get_indexPQ_stats(void)::_stats = 0;
    qword_1EFEC2C90 = 0;
    qword_1EFEC2C98 = 0;
  }
  return &faiss::IndexPQStats::get_indexPQ_stats(void)::_stats;
}

#error "1D490D3C8: call analysis failed (funcsize=1344)"

void sub_1D490E910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  void *v13;
  uint64_t v14;

  __cxa_free_exception(v13);
  if (*(char *)(v14 - 89) < 0)
    operator delete(*(void **)(v14 - 112));
  _Unwind_Resume(a1);
}

_QWORD *faiss::IndexPQStats::reset(_QWORD *this)
{
  *this = 0;
  this[1] = 0;
  this[2] = 0;
  return this;
}

uint64_t faiss::IndexPQ::sa_code_size(faiss::IndexPQ *this)
{
  return *((_QWORD *)this + 9);
}

uint64_t faiss::IndexPQ::sa_encode(faiss::IndexPQ *this, unint64_t a2, const float *a3, unsigned __int8 *a4)
{
  return faiss::ProductQuantizer::compute_codes((faiss::IndexPQ *)((char *)this + 40), a3, a4, a2);
}

_DWORD *faiss::IndexPQ::sa_decode(faiss::IndexPQ *this, uint64_t a2, const unsigned __int8 *a3, float *a4)
{
  return faiss::ProductQuantizer::decode((_DWORD *)this + 10, a3, a4, a2);
}

void faiss::IndexPQ::hamming_distance_table(faiss::IndexPQ *this, const unsigned __int8 *a2, const float *a3, int *a4)
{
  faiss::ProductQuantizer *v8;
  unsigned __int8 *v9;
  int *v10;

  v8 = (faiss::IndexPQ *)((char *)this + 40);
  v9 = (unsigned __int8 *)operator new[]();
  faiss::ProductQuantizer::compute_codes(v8, a3, v9, (unint64_t)a2);
  faiss::hammings((uint64_t *)v9, *((int8x16_t **)this + 24), a2, *((_QWORD *)this + 2), *((_QWORD *)this + 9), a4, v10);
  JUMPOUT(0x1D826288CLL);
}

void sub_1D490EAC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D826288C](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

uint64_t faiss::IndexPQ::hamming_distance_histogram(faiss::IndexPQ *this, int64_t a2, const float *a3, unint64_t a4, const float *a5, uint64_t *a6)
{
  faiss::IndexPQ *v6;
  unsigned __int8 *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int *v16;
  int *v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  faiss::IndexPQ *v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  std::string::size_type v28;
  int *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  int v35;
  std::string *p_p;
  size_t size;
  void *exception;
  int v39;
  std::string *v40;
  size_t v41;
  void *v42;
  int v43;
  std::string *v44;
  size_t v45;
  void *v46;
  int v47;
  unsigned __int8 *v48;
  int8x16_t *v49;
  unsigned __int8 *v50;
  std::string __p;

  if (*((_DWORD *)this + 7) != 1)
  {
    memset(&__p, 0, sizeof(__p));
    v35 = snprintf(0, 0, "Error: '%s' failed", "metric_type == METRIC_L2");
    std::string::resize(&__p, v35 + 1, 0);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      size = __p.__r_.__value_.__l.__size_;
    snprintf((char *)p_p, size, "Error: '%s' failed", "metric_type == METRIC_L2");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &__p, "void faiss::IndexPQ::hamming_distance_histogram(idx_t, const float *, idx_t, const float *, int64_t *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 498);
  }
  v6 = this;
  if ((*((_QWORD *)this + 9) & 7) != 0)
  {
    memset(&__p, 0, sizeof(__p));
    v39 = snprintf(0, 0, "Error: '%s' failed", "pq.code_size % 8 == 0");
    std::string::resize(&__p, v39 + 1, 0);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v40 = &__p;
    else
      v40 = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v41 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v41 = __p.__r_.__value_.__l.__size_;
    snprintf((char *)v40, v41, "Error: '%s' failed", "pq.code_size % 8 == 0");
    v42 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v42, &__p, "void faiss::IndexPQ::hamming_distance_histogram(idx_t, const float *, idx_t, const float *, int64_t *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 499);
  }
  if (*((_QWORD *)this + 7) != 8)
  {
    memset(&__p, 0, sizeof(__p));
    v43 = snprintf(0, 0, "Error: '%s' failed", "pq.nbits == 8");
    std::string::resize(&__p, v43 + 1, 0);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v44 = &__p;
    else
      v44 = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v45 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v45 = __p.__r_.__value_.__l.__size_;
    snprintf((char *)v44, v45, "Error: '%s' failed", "pq.nbits == 8");
    v46 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v46, &__p, "void faiss::IndexPQ::hamming_distance_histogram(idx_t, const float *, idx_t, const float *, int64_t *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 500);
  }
  v50 = (unsigned __int8 *)operator new[]();
  faiss::ProductQuantizer::compute_codes((faiss::IndexPQ *)((char *)v6 + 40), a3, v50, a2);
  if (a5)
  {
    v12 = (unsigned __int8 *)operator new[]();
    faiss::ProductQuantizer::compute_codes((faiss::IndexPQ *)((char *)v6 + 40), a5, v12, a4);
    v49 = (int8x16_t *)v12;
  }
  else
  {
    v12 = 0;
    a4 = *((_QWORD *)v6 + 2);
    v49 = (int8x16_t *)*((_QWORD *)v6 + 24);
  }
  v13 = *((_QWORD *)v6 + 7) * *((_QWORD *)v6 + 6);
  v14 = (v13 << 32) + 0x100000000;
  v15 = v14 >> 32;
  bzero(a6, v14 >> 29);
  v48 = v12;
  std::vector<long long>::vector(&__p, v15);
  v47 = v13;
  v17 = (int *)operator new[]();
  if (a2 >= 1)
  {
    v18 = 0;
    v19 = 0;
    v20 = 256;
    do
    {
      v21 = v19;
      if (a2 >= v20)
        v22 = v20;
      else
        v22 = a2;
      v19 += 256;
      if (v19 >= (unint64_t)a2)
        v23 = a2;
      else
        v23 = v19;
      v24 = v6;
      v25 = *((_QWORD *)v6 + 9);
      v26 = v23 - v21;
      faiss::hammings((uint64_t *)&v50[v25 * v21], v49, (const unsigned __int8 *)(v23 - v21), a4, v25, v17, v16);
      if (v26 * a4)
      {
        v27 = a4 * (v22 + v18);
        v28 = __p.__r_.__value_.__r.__words[0];
        v29 = v17;
        do
        {
          v30 = *v29++;
          ++*(_QWORD *)(v28 + 8 * v30);
          --v27;
        }
        while (v27);
      }
      v20 += 256;
      v18 -= 256;
      v6 = v24;
    }
    while (v19 < a2);
  }
  if ((v47 & 0x80000000) == 0)
  {
    v31 = (uint64_t *)__p.__r_.__value_.__r.__words[0];
    v32 = (v47 + 1);
    do
    {
      v33 = *v31++;
      *a6++ += v33;
      --v32;
    }
    while (v32);
  }
  MEMORY[0x1D826288C](v17, 0x1000C8052888210);
  if (__p.__r_.__value_.__r.__words[0])
  {
    __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v48)
    MEMORY[0x1D826288C](v48, 0x1000C8077774924);
  return MEMORY[0x1D826288C](v50, 0x1000C8077774924);
}

void sub_1D490EF6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  void *v19;

  __cxa_free_exception(v19);
  if (a19 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

faiss::MultiIndexQuantizer *faiss::MultiIndexQuantizer::MultiIndexQuantizer(faiss::MultiIndexQuantizer *this, int a2, unint64_t a3, unint64_t a4)
{
  *((_DWORD *)this + 2) = a2;
  *((_QWORD *)this + 2) = 0;
  *((_WORD *)this + 12) = 256;
  *(_QWORD *)((char *)this + 28) = 1;
  *(_QWORD *)this = &off_1E9806748;
  faiss::ProductQuantizer::ProductQuantizer((faiss::MultiIndexQuantizer *)((char *)this + 40), a2, a3, a4);
  *((_BYTE *)this + 25) = 0;
  *((_BYTE *)this + 88) = *((_BYTE *)this + 24);
  return this;
}

void sub_1D490F090(_Unwind_Exception *a1)
{
  faiss::Index *v1;

  faiss::Index::~Index(v1);
  _Unwind_Resume(a1);
}

void faiss::MultiIndexQuantizer::train(faiss::MultiIndexQuantizer *this, int a2, const float *a3)
{
  uint64_t v4;
  uint64_t v5;

  *((_BYTE *)this + 88) = *((_BYTE *)this + 24);
  faiss::ProductQuantizer::train((faiss::MultiIndexQuantizer *)((char *)this + 40), a2, a3);
  *((_BYTE *)this + 25) = 1;
  *((_QWORD *)this + 2) = 1;
  v4 = *((_QWORD *)this + 6);
  if (v4)
  {
    v5 = 1;
    do
    {
      v5 *= *((_QWORD *)this + 10);
      --v4;
    }
    while (v4);
    *((_QWORD *)this + 2) = v5;
  }
}

#error "1D490F230: call analysis failed (funcsize=630)"

void sub_1D490FB8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34)
{
  void *v34;

  __cxa_free_exception(v34);
  if (a26 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t faiss::`anonymous namespace'::MinSumK<float,faiss::`anonymous namespace'::SemiSortedArray<float>,false>::~MinSumK(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    MEMORY[0x1D826288C](v2, 0x1000C8000313F17);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    MEMORY[0x1D826288C](v3, 0x1000C8052888210);
  v4 = *(void **)(a1 + 72);
  if (v4)
  {
    *(_QWORD *)(a1 + 80) = v4;
    operator delete(v4);
  }
  return a1;
}

_QWORD *faiss::MultiIndexQuantizer::reconstruct(_QWORD *this, uint64_t a2, float *__dst)
{
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (this[6])
  {
    v5 = this;
    v6 = 0;
    v7 = this[8];
    do
    {
      v8 = v5[7];
      v9 = a2 & ~(-1 << v8);
      a2 >>= v8;
      this = memcpy(__dst, (const void *)(v5[18] + 4 * (v9 + v5[10] * v6) * v7), 4 * v7);
      v7 = v5[8];
      __dst += v7;
      ++v6;
    }
    while (v5[6] > v6);
  }
  return this;
}

void faiss::MultiIndexQuantizer::add(faiss::MultiIndexQuantizer *this, uint64_t a2, const float *a3)
{
  void *exception;
  _QWORD v4[3];

  exception = __cxa_allocate_exception(0x20uLL);
  std::string::basic_string[abi:ne180100]<0>(v4, "This index has virtual elements, it does not support add");
  faiss::FaissException::FaissException(exception, v4, "virtual void faiss::MultiIndexQuantizer::add(idx_t, const float *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 1013);
}

void sub_1D490FDA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

void faiss::MultiIndexQuantizer::reset(faiss::MultiIndexQuantizer *this)
{
  void *exception;
  _QWORD v2[3];

  exception = __cxa_allocate_exception(0x20uLL);
  std::string::basic_string[abi:ne180100]<0>(v2, "This index has virtual elements, it does not support reset");
  faiss::FaissException::FaissException(exception, v2, "virtual void faiss::MultiIndexQuantizer::reset()", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 1019);
}

void sub_1D490FE54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

faiss::MultiIndexQuantizer2 *faiss::MultiIndexQuantizer2::MultiIndexQuantizer2(faiss::MultiIndexQuantizer2 *this, int a2, unint64_t a3, unint64_t a4, faiss::Index **a5)
{
  faiss::MultiIndexQuantizer *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  faiss::Index *v12;
  int v14;
  std::string *v15;
  size_t size;
  void *exception;
  std::string v18;

  v8 = faiss::MultiIndexQuantizer::MultiIndexQuantizer(this, a2, a3, a4);
  *(_QWORD *)v8 = &off_1E9806880;
  *((_QWORD *)v8 + 24) = 0;
  v9 = (_QWORD *)((char *)v8 + 192);
  *((_QWORD *)v8 + 25) = 0;
  *((_QWORD *)v8 + 26) = 0;
  std::vector<float const*>::resize((uint64_t)v8 + 192, a3);
  if (a3)
  {
    v10 = 0;
    v11 = *((_QWORD *)this + 8);
    do
    {
      v12 = a5[v10];
      if (v11 != *((_DWORD *)v12 + 2))
      {
        memset(&v18, 0, sizeof(v18));
        v14 = snprintf(0, 0, "Error: '%s' failed: Provided sub-index has incorrect size", "indexes[i]->d == pq.dsub");
        std::string::resize(&v18, v14 + 1, 0);
        if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v15 = &v18;
        else
          v15 = (std::string *)v18.__r_.__value_.__r.__words[0];
        if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          size = HIBYTE(v18.__r_.__value_.__r.__words[2]);
        else
          size = v18.__r_.__value_.__l.__size_;
        snprintf((char *)v15, size, "Error: '%s' failed: Provided sub-index has incorrect size", "indexes[i]->d == pq.dsub");
        exception = __cxa_allocate_exception(0x20uLL);
        faiss::FaissException::FaissException(exception, &v18, "faiss::MultiIndexQuantizer2::MultiIndexQuantizer2(int, size_t, size_t, Index **)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 1036);
      }
      *(_QWORD *)(*v9 + 8 * v10++) = v12;
    }
    while (a3 != v10);
  }
  *((_BYTE *)this + 216) = 0;
  return this;
}

void sub_1D490FFCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  faiss::MultiIndexQuantizer *v15;
  void **v16;
  void *v18;

  v18 = *v16;
  if (*v16)
  {
    *((_QWORD *)v15 + 25) = v18;
    operator delete(v18);
  }
  faiss::MultiIndexQuantizer::~MultiIndexQuantizer(v15);
  _Unwind_Resume(a1);
}

void faiss::MultiIndexQuantizer::~MultiIndexQuantizer(faiss::MultiIndexQuantizer *this)
{
  void *v2;
  void *v3;

  *(_QWORD *)this = &off_1E9806748;
  v2 = (void *)*((_QWORD *)this + 21);
  if (v2)
  {
    *((_QWORD *)this + 22) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 18);
  if (v3)
  {
    *((_QWORD *)this + 19) = v3;
    operator delete(v3);
  }
  faiss::Index::~Index(this);
}

{
  void *v2;
  void *v3;

  *(_QWORD *)this = &off_1E9806748;
  v2 = (void *)*((_QWORD *)this + 21);
  if (v2)
  {
    *((_QWORD *)this + 22) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 18);
  if (v3)
  {
    *((_QWORD *)this + 19) = v3;
    operator delete(v3);
  }
  faiss::Index::~Index(this);
  JUMPOUT(0x1D82628A4);
}

faiss::MultiIndexQuantizer2 *faiss::MultiIndexQuantizer2::MultiIndexQuantizer2(faiss::MultiIndexQuantizer2 *this, int a2, unint64_t a3, faiss::Index *a4, faiss::Index *a5)
{
  faiss::MultiIndexQuantizer *v8;
  uint64_t v9;
  int v11;
  std::string *v12;
  size_t size;
  void *exception;
  std::string v15;

  v8 = faiss::MultiIndexQuantizer::MultiIndexQuantizer(this, a2, 2uLL, a3);
  *((_QWORD *)v8 + 24) = 0;
  *(_QWORD *)v8 = &off_1E9806880;
  *((_QWORD *)v8 + 25) = 0;
  *((_QWORD *)v8 + 26) = 0;
  v9 = *((int *)a4 + 2);
  if (*((_QWORD *)v8 + 8) != v9 || (_DWORD)v9 != *((_DWORD *)a5 + 2))
  {
    memset(&v15, 0, sizeof(v15));
    v11 = snprintf(0, 0, "Error: '%s' failed: Provided sub-index has incorrect size", "assign_index_0->d == pq.dsub && assign_index_1->d == pq.dsub");
    std::string::resize(&v15, v11 + 1, 0);
    if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v12 = &v15;
    else
      v12 = (std::string *)v15.__r_.__value_.__r.__words[0];
    if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v15.__r_.__value_.__r.__words[2]);
    else
      size = v15.__r_.__value_.__l.__size_;
    snprintf((char *)v12, size, "Error: '%s' failed: Provided sub-index has incorrect size", "assign_index_0->d == pq.dsub && assign_index_1->d == pq.dsub");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v15, "faiss::MultiIndexQuantizer2::MultiIndexQuantizer2(int, size_t, Index *, Index *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 1050);
  }
  std::vector<float const*>::resize((uint64_t)v8 + 192, 2uLL);
  **((_QWORD **)this + 24) = a4;
  *(_QWORD *)(*((_QWORD *)this + 24) + 8) = a5;
  *((_BYTE *)this + 216) = 0;
  return this;
}

void sub_1D49101AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  faiss::MultiIndexQuantizer *v15;
  void **v16;
  void *v17;
  void *v19;

  __cxa_free_exception(v17);
  if (a15 < 0)
    operator delete(__p);
  v19 = *v16;
  if (*v16)
  {
    *((_QWORD *)v15 + 25) = v19;
    operator delete(v19);
  }
  faiss::MultiIndexQuantizer::~MultiIndexQuantizer(v15);
  _Unwind_Resume(a1);
}

void faiss::MultiIndexQuantizer2::train(faiss::MultiIndexQuantizer2 *this, int a2, const float *a3)
{
  unint64_t v4;
  uint64_t v5;

  faiss::MultiIndexQuantizer::train(this, a2, a3);
  if (*((_QWORD *)this + 6))
  {
    v4 = 0;
    do
    {
      v5 = *(_QWORD *)(*((_QWORD *)this + 24) + 8 * v4);
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 24))(v5);
      ++v4;
    }
    while (*((_QWORD *)this + 6) > v4);
  }
}

void faiss::MultiIndexQuantizer2::search(faiss::MultiIndexQuantizer2 *this, uint64_t a2, const float *a3, uint64_t a4, float *a5, uint64_t *a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  char *v16;
  const float *v17;
  uint64_t v18;
  uint64_t v19;
  float *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  float v24;
  uint64_t v25;
  float *v26;
  _QWORD *v27;
  int v28;
  unsigned int v29;
  int v30;
  _DWORD *v31;
  _DWORD *v32;
  _DWORD *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  char *v44;
  _QWORD *v45;
  uint64_t *v46;
  std::string::value_type v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t data_low;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  float *v58;
  char *v59;
  _QWORD *v60;
  unint64_t v61;
  float v62;
  float **v63;
  unint64_t v64;
  float *v65;
  unint64_t v66;
  float v67;
  unint64_t v68;
  uint64_t v69;
  float v70;
  BOOL v71;
  unint64_t v72;
  std::string::value_type v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  float v77;
  uint64_t v78;
  unint64_t v79;
  float v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  float v84;
  float v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  float v90;
  unint64_t v91;
  unint64_t v92;
  float v93;
  uint64_t v94;
  int v95;
  uint64_t v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t j;
  int v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  int v109;
  std::string *v110;
  size_t size;
  void *exception;
  uint64_t v113;
  uint64_t v114;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  int v123;
  float *v124;
  std::string v125;
  unint64_t v126;
  uint64_t v127;
  uint64_t v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  void *v132[3];
  void *v133[3];
  void *v134[4];

  if (a2)
  {
    v8 = *((_QWORD *)this + 10);
    if (v8 >= a4)
      LODWORD(v9) = a4;
    else
      v9 = *((_QWORD *)this + 10);
    if (!(_DWORD)v9)
    {
      memset(&v125, 0, sizeof(v125));
      v109 = snprintf(0, 0, "Error: '%s' failed", "k2");
      std::string::resize(&v125, v109 + 1, 0);
      if ((v125.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v110 = &v125;
      else
        v110 = (std::string *)v125.__r_.__value_.__r.__words[0];
      if ((v125.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v125.__r_.__value_.__r.__words[2]);
      else
        size = v125.__r_.__value_.__l.__size_;
      snprintf((char *)v110, size, "Error: '%s' failed", "k2");
      exception = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(exception, &v125, "virtual void faiss::MultiIndexQuantizer2::search(idx_t, const float *, idx_t, float *, idx_t *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 1075);
    }
    v11 = a2;
    v12 = *((_QWORD *)this + 6);
    v13 = *((_QWORD *)this + 8);
    v123 = v9;
    v120 = (int)v9;
    v14 = (int)v9 * a2;
    std::vector<long long>::vector(v134, v14 * v12);
    std::vector<float>::vector(v133, v14 * v12);
    v117 = a4;
    v118 = v8;
    std::vector<float>::vector(v132, v13 * v11);
    v122 = v11;
    if (v12 >= 1)
    {
      for (i = 0; i != v12; ++i)
      {
        v16 = (char *)v132[0];
        if (v11 >= 1)
        {
          v17 = &a3[i * v13];
          do
          {
            memcpy(v16, v17, 4 * v13);
            v17 += *((int *)this + 2);
            v16 += 4 * v13;
            --v11;
          }
          while (v11);
          v16 = (char *)v132[0];
          v11 = v122;
        }
        v18 = *(_QWORD *)(*((_QWORD *)this + 24) + 8 * i);
        (*(void (**)(uint64_t, uint64_t, char *, uint64_t, char *, char *))(*(_QWORD *)v18 + 40))(v18, v11, v16, v120, (char *)v133[0] + 4 * v14 * i, (char *)v134[0] + 8 * v14 * i);
      }
    }
    if (v117 == 1)
    {
      if (v123 != 1)
        __assert_rtn("search", "IndexPQ.cpp", 1100, "k2 == 1");
      if (v11 >= 1)
      {
        v19 = 0;
        v20 = (float *)v133[0];
        v21 = v134[0];
        do
        {
          if (v12 < 1)
          {
            v23 = 0;
            v24 = 0.0;
          }
          else
          {
            v22 = 0;
            v23 = 0;
            v24 = 0.0;
            v25 = v12;
            v26 = v20;
            v27 = v21;
            do
            {
              v23 |= *v27 << v22;
              v24 = v24 + *v26;
              v22 += *((_QWORD *)this + 7);
              v27 += v11;
              v26 += v11;
              --v25;
            }
            while (v25);
          }
          a5[v19] = v24;
          a6[v19++] = v23;
          ++v21;
          ++v20;
        }
        while (v19 != v11);
      }
    }
    else
    {
      v28 = *((_DWORD *)this + 12);
      v29 = *((_DWORD *)this + 14);
      v125.__r_.__value_.__r.__words[0] = __PAIR64__(v28, v117);
      v125.__r_.__value_.__l.__size_ = __PAIR64__(v123, v29);
      v129 = 0u;
      v130 = 0u;
      v131 = 0u;
      v125.__r_.__value_.__r.__words[2] = v28 * (int)v117;
      if (1 << v29 < v123)
        __assert_rtn("MinSumK", "IndexPQ.cpp", 782, "N <= (1 << nbit)");
      v127 = operator new[]();
      v128 = operator new[]();
      if (v28 >= 1)
      {
        v30 = 0;
        v31 = (_DWORD *)*((_QWORD *)&v129 + 1);
        do
        {
          if ((unint64_t)v31 >= (unint64_t)v130)
          {
            v33 = (_DWORD *)v129;
            v34 = (uint64_t)((uint64_t)v31 - v129) >> 4;
            v35 = v34 + 1;
            if ((unint64_t)(v34 + 1) >> 60)
              std::vector<long long>::__throw_length_error[abi:ne180100]();
            v36 = v130 - v129;
            if ((uint64_t)(v130 - v129) >> 3 > v35)
              v35 = v36 >> 3;
            if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0)
              v37 = 0xFFFFFFFFFFFFFFFLL;
            else
              v37 = v35;
            if (v37)
            {
              if (v37 >> 60)
                std::__throw_bad_array_new_length[abi:ne180100]();
              v38 = (char *)operator new(16 * v37);
            }
            else
            {
              v38 = 0;
            }
            v39 = &v38[16 * v34];
            *((_DWORD *)v39 + 2) = v123;
            v40 = v39;
            if (v31 != v33)
            {
              do
              {
                v41 = *((_QWORD *)v31 - 2);
                v31 -= 4;
                v42 = v31[2];
                *((_QWORD *)v40 - 2) = v41;
                v40 -= 16;
                *((_DWORD *)v40 + 2) = v42;
              }
              while (v31 != v33);
              v31 = (_DWORD *)v129;
            }
            v32 = v39 + 16;
            *(_QWORD *)&v129 = v40;
            *((_QWORD *)&v129 + 1) = v39 + 16;
            *(_QWORD *)&v130 = &v38[16 * v37];
            if (v31)
              operator delete(v31);
          }
          else
          {
            v31[2] = v123;
            v32 = v31 + 4;
          }
          *((_QWORD *)&v129 + 1) = v32;
          ++v30;
          v31 = v32;
        }
        while (v30 != v28);
      }
      if (v122 >= 1)
      {
        v43 = 0;
        v44 = (char *)v133[0];
        v46 = (uint64_t *)v128;
        v45 = (_QWORD *)v129;
        v48 = HIDWORD(v125.__r_.__value_.__r.__words[0]);
        v47 = v125.__r_.__value_.__s.__data_[8];
        v124 = (float *)v127;
        v49 = v127 - 4;
        v50 = v128 - 8;
        data_low = LODWORD(v125.__r_.__value_.__l.__data_);
        v52 = v118 - 1;
        v114 = 4 * v120;
        v53 = 4 * v122 * v120;
        v113 = 8 * v120;
        v54 = (char *)v134[0];
        v55 = 8 * v122 * v120;
        v56 = v117;
LABEL_47:
        v119 = v44;
        v121 = v43;
        v57 = &a6[v43 * v56];
        v58 = &a5[v43 * v56];
        v59 = v44;
        v60 = v45;
        v61 = v48;
        if ((int)v48 < 1)
        {
          v72 = 0;
          *v57 = 0;
          *v58 = 0.0;
          if ((int)data_low > 1)
            goto LABEL_126;
          goto LABEL_89;
        }
        do
        {
          *v60 = v59;
          v60 += 2;
          v59 += v53;
          --v61;
        }
        while (v61);
        *v57 = 0;
        v62 = 0.0;
        v63 = (float **)v45;
        v64 = v48;
        do
        {
          v65 = *v63;
          v63 += 2;
          v62 = v62 + *v65;
          --v64;
        }
        while (v64);
        *v58 = v62;
        do
        {
          v66 = v64++;
          v67 = v62 + (float)(*(float *)(v45[2 * v66] + 4) - *(float *)v45[2 * v66]);
          if (v66)
          {
            v68 = v64;
            while (1)
            {
              v69 = v68 >> 1;
              v70 = *(float *)(v49 + 4 * (v68 >> 1));
              if (v70 <= v67)
                break;
              *(float *)(v49 + 4 * v68) = v70;
              *(_QWORD *)(v50 + 8 * v68) = *(_QWORD *)(v50 + 8 * v69);
              v71 = v68 > 3;
              v68 >>= 1;
              if (!v71)
                goto LABEL_59;
            }
            v69 = v68;
          }
          else
          {
            v69 = 1;
          }
LABEL_59:
          *(float *)(v49 + 4 * v69) = v67;
          *(_QWORD *)(v50 + 8 * v69) = 1 << (v47 * v66);
        }
        while (v64 != v48);
        v72 = v48;
        if ((int)data_low <= 1)
          goto LABEL_89;
        v73 = v125.__r_.__value_.__s.__data_[8];
        v74 = ~(-1 << v125.__r_.__value_.__s.__data_[8]);
        v75 = SHIDWORD(v125.__r_.__value_.__r.__words[1]) - 1;
        v72 = v48;
        v76 = 1;
LABEL_62:
        v77 = *v124;
        v58[v76] = *v124;
        v78 = *v46;
        v57[v76] = *v46;
LABEL_63:
        v79 = v72;
        v80 = *(float *)(v49 + 4 * v72);
        v71 = v72-- > 1;
        if (!v71)
        {
          *v124 = v80;
          *v46 = *(_QWORD *)(v50 + 8 * v79);
          goto LABEL_75;
        }
        v81 = 3;
        v82 = 2;
        v83 = 1;
        while (1)
        {
          v84 = *(float *)(v49 + 4 * v82);
          if (v81 == v79 + 1 || (v85 = *(float *)(v49 + 4 * v81), v84 < v85))
          {
            if (v80 < v84)
              goto LABEL_73;
          }
          else
          {
            v84 = *(float *)(v49 + 4 * v81);
            v82 = v81;
            if (v80 < v85)
            {
LABEL_73:
              v86 = v83;
LABEL_74:
              *(_DWORD *)(v49 + 4 * v86) = *(_DWORD *)(v49 + 4 * v79);
              *(_QWORD *)(v50 + 8 * v86) = *(_QWORD *)(v50 + 8 * v79);
              if (*v46 != v78)
              {
LABEL_75:
                v87 = 0;
                v88 = v129;
                v89 = v78;
                do
                {
                  if ((v89 & v74) < v75)
                  {
                    v90 = v77
                        + (float)(*(float *)(*(_QWORD *)(v88 + 16 * v87) + ((((v89 & v74) << 32) + 0x100000000) >> 30))
                                - *(float *)(*(_QWORD *)(v88 + 16 * v87) + 4 * (int)(v89 & v74)));
                    v91 = ++v72;
                    if (v72 >= 2)
                    {
                      v92 = v72;
                      while (1)
                      {
                        v91 = v92 >> 1;
                        v93 = *(float *)(v49 + 4 * (v92 >> 1));
                        if (v93 <= v90)
                          break;
                        *(float *)(v49 + 4 * v92) = v93;
                        *(_QWORD *)(v50 + 8 * v92) = *(_QWORD *)(v50 + 8 * v91);
                        v71 = v92 > 3;
                        v92 >>= 1;
                        if (!v71)
                          goto LABEL_83;
                      }
                      v91 = v92;
                    }
LABEL_83:
                    *(float *)(v49 + 4 * v91) = v90;
                    *(_QWORD *)(v50 + 8 * v91) = v78 + (1 << (v73 * v87));
                  }
                  v89 >>= v73;
                  ++v87;
                }
                while (v87 != v48);
                if (++v76 != data_low)
                {
                  if (!v72)
                  {
LABEL_126:
                    v126 = 0;
                    __assert_rtn("run", "IndexPQ.cpp", 844, "heap_size > 0");
                  }
                  goto LABEL_62;
                }
LABEL_89:
                v56 = v117;
                if ((int)data_low >= 1)
                {
                  v94 = 0;
                  v95 = v125.__r_.__value_.__r.__words[1];
                  v96 = ~(-1 << v125.__r_.__value_.__s.__data_[8]);
                  do
                  {
                    if ((int)v48 < 1)
                    {
                      v98 = 0;
                    }
                    else
                    {
                      v97 = 0;
                      v98 = 0;
                      v99 = v57[v94];
                      v100 = v48;
                      do
                      {
                        v98 += (uint64_t)(int)(v99 & v96) << v97;
                        v99 >>= v95;
                        v97 += v95;
                        --v100;
                      }
                      while (v100);
                    }
                    v57[v94++] = v98;
                  }
                  while (v94 != data_low);
                }
                if (v117 >= 1)
                {
                  for (j = 0; j != v117; ++j)
                  {
                    if (v12 < 1)
                    {
                      v103 = 0;
                    }
                    else
                    {
                      v102 = 0;
                      v103 = 0;
                      v104 = v57[j];
                      v105 = *((_QWORD *)this + 7);
                      v106 = v54;
                      v107 = v12;
                      do
                      {
                        v108 = *(_QWORD *)&v106[8 * (v104 & v52)];
                        v104 >>= v105;
                        v103 |= v108 << v102;
                        v102 += v105;
                        v106 += v55;
                        --v107;
                      }
                      while (v107);
                    }
                    v57[j] = v103;
                  }
                }
                v43 = v121 + 1;
                v44 = &v119[v114];
                v54 += v113;
                if (v121 + 1 == v122)
                {
                  v126 = v72;
                  break;
                }
                goto LABEL_47;
              }
              goto LABEL_63;
            }
          }
          v86 = v82;
          *(float *)(v49 + 4 * v83) = v84;
          *(_QWORD *)(v50 + 8 * v83) = *(_QWORD *)(v50 + 8 * v82);
          v82 *= 2;
          v81 = (2 * v86) | 1;
          v83 = v86;
          if (v82 > v79)
            goto LABEL_74;
        }
      }
    }
    if (v132[0])
    {
      v132[1] = v132[0];
      operator delete(v132[0]);
    }
    if (v133[0])
    {
      v133[1] = v133[0];
      operator delete(v133[0]);
    }
    if (v134[0])
    {
      v134[1] = v134[0];
      operator delete(v134[0]);
    }
  }
}

void sub_1D4910B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,void *a31)
{
  void *v31;

  __cxa_free_exception(v31);
  if (a24 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

_QWORD *faiss::`anonymous namespace'::MinSumK<float,faiss::`anonymous namespace'::PreSortedArray<float>,false>::~MinSumK(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = a1[5];
  if (v2)
    MEMORY[0x1D826288C](v2, 0x1000C8000313F17);
  v3 = a1[4];
  if (v3)
    MEMORY[0x1D826288C](v3, 0x1000C8052888210);
  v4 = (void *)a1[9];
  if (v4)
  {
    a1[10] = v4;
    operator delete(v4);
  }
  v5 = (void *)a1[6];
  if (v5)
  {
    a1[7] = v5;
    operator delete(v5);
  }
  return a1;
}

void faiss::IndexPQ::~IndexPQ(void **this)
{
  void *v2;
  void *v3;
  void *v4;

  *this = off_1E9806C60;
  if (*((char *)this + 311) < 0)
    operator delete(this[36]);
  v2 = this[24];
  if (v2)
  {
    this[25] = v2;
    operator delete(v2);
  }
  v3 = this[21];
  if (v3)
  {
    this[22] = v3;
    operator delete(v3);
  }
  v4 = this[18];
  if (v4)
  {
    this[19] = v4;
    operator delete(v4);
  }
  faiss::Index::~Index((faiss::Index *)this);
}

{
  void *v2;
  void *v3;
  void *v4;

  *this = off_1E9806C60;
  if (*((char *)this + 311) < 0)
    operator delete(this[36]);
  v2 = this[24];
  if (v2)
  {
    this[25] = v2;
    operator delete(v2);
  }
  v3 = this[21];
  if (v3)
  {
    this[22] = v3;
    operator delete(v3);
  }
  v4 = this[18];
  if (v4)
  {
    this[19] = v4;
    operator delete(v4);
  }
  faiss::Index::~Index((faiss::Index *)this);
  JUMPOUT(0x1D82628A4);
}

void faiss::MultiIndexQuantizer2::~MultiIndexQuantizer2(faiss::MultiIndexQuantizer2 *this)
{
  void *v2;
  void *v3;
  void *v4;

  *(_QWORD *)this = &off_1E9806880;
  v2 = (void *)*((_QWORD *)this + 24);
  if (v2)
  {
    *((_QWORD *)this + 25) = v2;
    operator delete(v2);
  }
  *(_QWORD *)this = &off_1E9806748;
  v3 = (void *)*((_QWORD *)this + 21);
  if (v3)
  {
    *((_QWORD *)this + 22) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 18);
  if (v4)
  {
    *((_QWORD *)this + 19) = v4;
    operator delete(v4);
  }
  faiss::Index::~Index(this);
}

{
  void *v2;
  void *v3;
  void *v4;

  *(_QWORD *)this = &off_1E9806880;
  v2 = (void *)*((_QWORD *)this + 24);
  if (v2)
  {
    *((_QWORD *)this + 25) = v2;
    operator delete(v2);
  }
  *(_QWORD *)this = &off_1E9806748;
  v3 = (void *)*((_QWORD *)this + 21);
  if (v3)
  {
    *((_QWORD *)this + 22) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 18);
  if (v4)
  {
    *((_QWORD *)this + 19) = v4;
    operator delete(v4);
  }
  faiss::Index::~Index(this);
  JUMPOUT(0x1D82628A4);
}

void faiss::`anonymous namespace'::PQDistanceComputer<faiss::PQDecoder8>::set_query(uint64_t a1, const float *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  int v7;
  faiss::ProductQuantizer *v8;
  float *v9;

  v7 = *(_DWORD *)(a1 + 16);
  v8 = *(faiss::ProductQuantizer **)(a1 + 48);
  v9 = *(float **)(a1 + 64);
  if (v7 == 1)
    faiss::ProductQuantizer::compute_distance_table(v8, a2, v9);
  else
    faiss::ProductQuantizer::compute_inner_prod_table((uint64_t)v8, a2, v9, a4, a5, a6);
}

_QWORD *faiss::`anonymous namespace'::PQDistanceComputer<faiss::PQDecoder8>::operator()(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 *v4;
  uint64_t v5;
  float v6;
  unsigned int v7;

  v2 = result[6];
  if (*(_DWORD *)(v2 + 16) != 8)
    faiss::decode<faiss::PQDecoder8>();
  v3 = *(_QWORD *)(v2 + 8);
  if (v3)
  {
    v4 = (unsigned __int8 *)(result[4] + result[5] * a2);
    v5 = result[8];
    v6 = 0.0;
    do
    {
      v7 = *v4++;
      v6 = v6 + *(float *)(v5 + 4 * v7);
      v5 += 1024;
      --v3;
    }
    while (v3);
  }
  ++result[11];
  return result;
}

_QWORD *faiss::`anonymous namespace'::PQDistanceComputer<faiss::PQDecoder8>::symmetric_dis(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  float v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  std::string *v15;
  size_t size;
  void *exception;
  std::string v18;

  v3 = result[7];
  if (!v3)
  {
    memset(&v18, 0, sizeof(v18));
    v14 = snprintf(0, 0, "Error: '%s' failed", "sdc");
    std::string::resize(&v18, v14 + 1, 0);
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v15 = &v18;
    else
      v15 = (std::string *)v18.__r_.__value_.__r.__words[0];
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v18.__r_.__value_.__r.__words[2]);
    else
      size = v18.__r_.__value_.__l.__size_;
    snprintf((char *)v15, size, "Error: '%s' failed", "sdc");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v18, "virtual float faiss::(anonymous namespace)::PQDistanceComputer<faiss::PQDecoder8>::symmetric_dis(idx_t, idx_t) [PQDecoder = faiss::PQDecoder8]", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 154);
  }
  v4 = result[6];
  if (*(_DWORD *)(v4 + 16) != 8)
    faiss::decode<faiss::PQDecoder8>();
  v5 = *(_QWORD *)(v4 + 8);
  if (v5)
  {
    v6 = result[4];
    v7 = result[5];
    v8 = (unsigned __int8 *)(v6 + v7 * a3);
    v9 = (unsigned __int8 *)(v6 + v7 * a2);
    v10 = 0.0;
    do
    {
      v12 = *v9++;
      v11 = v12;
      v13 = *v8++;
      v10 = v10 + *(float *)(v3 + ((4 * v11) | ((unint64_t)v13 << 10)));
      v3 += 0x40000;
      --v5;
    }
    while (v5);
  }
  ++result[11];
  return result;
}

void sub_1D491103C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

_QWORD *faiss::`anonymous namespace'::PQDistanceComputer<faiss::PQDecoder8>::~PQDistanceComputer(_QWORD *a1)
{
  void *v2;

  *a1 = off_1E9805AA8;
  v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  return a1;
}

void faiss::`anonymous namespace'::PQDistanceComputer<faiss::PQDecoder8>::~PQDistanceComputer(_QWORD *a1)
{
  void *v2;

  *a1 = off_1E9805AA8;
  v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  JUMPOUT(0x1D82628A4);
}

void faiss::`anonymous namespace'::PQDistanceComputer<faiss::PQDecoder16>::set_query(uint64_t a1, const float *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  int v7;
  faiss::ProductQuantizer *v8;
  float *v9;

  v7 = *(_DWORD *)(a1 + 16);
  v8 = *(faiss::ProductQuantizer **)(a1 + 48);
  v9 = *(float **)(a1 + 64);
  if (v7 == 1)
    faiss::ProductQuantizer::compute_distance_table(v8, a2, v9);
  else
    faiss::ProductQuantizer::compute_inner_prod_table((uint64_t)v8, a2, v9, a4, a5, a6);
}

_QWORD *faiss::`anonymous namespace'::PQDistanceComputer<faiss::PQDecoder16>::operator()(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned __int16 *v4;
  uint64_t v5;
  float v6;
  unsigned int v7;

  v2 = result[6];
  if (*(_DWORD *)(v2 + 16) != 16)
    faiss::decode<faiss::PQDecoder16>();
  v3 = *(_QWORD *)(v2 + 8);
  if (v3)
  {
    v4 = (unsigned __int16 *)(result[4] + result[5] * a2);
    v5 = result[8];
    v6 = 0.0;
    do
    {
      v7 = *v4++;
      v6 = v6 + *(float *)(v5 + 4 * v7);
      v5 += 0x40000;
      --v3;
    }
    while (v3);
  }
  ++result[11];
  return result;
}

_QWORD *faiss::`anonymous namespace'::PQDistanceComputer<faiss::PQDecoder16>::symmetric_dis(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int16 *v8;
  unsigned __int16 *v9;
  float v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  std::string *v15;
  size_t size;
  void *exception;
  std::string v18;

  v3 = result[7];
  if (!v3)
  {
    memset(&v18, 0, sizeof(v18));
    v14 = snprintf(0, 0, "Error: '%s' failed", "sdc");
    std::string::resize(&v18, v14 + 1, 0);
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v15 = &v18;
    else
      v15 = (std::string *)v18.__r_.__value_.__r.__words[0];
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v18.__r_.__value_.__r.__words[2]);
    else
      size = v18.__r_.__value_.__l.__size_;
    snprintf((char *)v15, size, "Error: '%s' failed", "sdc");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v18, "virtual float faiss::(anonymous namespace)::PQDistanceComputer<faiss::PQDecoder16>::symmetric_dis(idx_t, idx_t) [PQDecoder = faiss::PQDecoder16]", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 154);
  }
  v4 = result[6];
  if (*(_DWORD *)(v4 + 16) != 16)
    faiss::decode<faiss::PQDecoder16>();
  v5 = *(_QWORD *)(v4 + 8);
  if (v5)
  {
    v6 = result[4];
    v7 = result[5];
    v8 = (unsigned __int16 *)(v6 + v7 * a3);
    v9 = (unsigned __int16 *)(v6 + v7 * a2);
    v10 = 0.0;
    do
    {
      v12 = *v9++;
      v11 = v12;
      v13 = *v8++;
      v10 = v10 + *(float *)(v3 + ((4 * v11) | ((unint64_t)v13 << 18)));
      v3 += 0x400000000;
      --v5;
    }
    while (v5);
  }
  ++result[11];
  return result;
}

void sub_1D49112B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

_QWORD *faiss::`anonymous namespace'::PQDistanceComputer<faiss::PQDecoder16>::~PQDistanceComputer(_QWORD *a1)
{
  void *v2;

  *a1 = off_1E9805AE0;
  v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  return a1;
}

void faiss::`anonymous namespace'::PQDistanceComputer<faiss::PQDecoder16>::~PQDistanceComputer(_QWORD *a1)
{
  void *v2;

  *a1 = off_1E9805AE0;
  v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  JUMPOUT(0x1D82628A4);
}

void faiss::`anonymous namespace'::PQDistanceComputer<faiss::PQDecoderGeneric>::set_query(uint64_t a1, const float *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  int v7;
  faiss::ProductQuantizer *v8;
  float *v9;

  v7 = *(_DWORD *)(a1 + 16);
  v8 = *(faiss::ProductQuantizer **)(a1 + 48);
  v9 = *(float **)(a1 + 64);
  if (v7 == 1)
    faiss::ProductQuantizer::compute_distance_table(v8, a2, v9);
  else
    faiss::ProductQuantizer::compute_inner_prod_table((uint64_t)v8, a2, v9, a4, a5, a6);
}

_QWORD *faiss::`anonymous namespace'::PQDistanceComputer<faiss::PQDecoderGeneric>::operator()(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  float v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  char v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;

  v2 = result[6];
  v3 = *(_QWORD *)(v2 + 16);
  if ((int)v3 > 64)
    faiss::decode<faiss::PQDecoderGeneric>();
  v4 = *(_QWORD *)(v2 + 8);
  if (v4)
  {
    v5 = 0;
    LOBYTE(v6) = 0;
    LODWORD(v7) = 0;
    v8 = (unsigned __int8 *)(result[4] + result[5] * a2);
    v9 = result[8];
    v10 = 0.0;
    do
    {
      if (!(_BYTE)v6)
        LODWORD(v7) = *v8;
      v11 = v7 >> v6;
      v12 = v3 + v6;
      v13 = v12 - 8;
      if (v12 < 8)
      {
        LOBYTE(v6) = v3 + v6;
      }
      else
      {
        v14 = 8 - v6;
        v15 = v8 + 1;
        if (v13 < 8)
        {
          ++v8;
        }
        else
        {
          v16 = v13 >> 3;
          v17 = v16 - 1;
          do
          {
            v18 = *v15++;
            v11 |= (unint64_t)v18 << v14;
            v14 += 8;
            --v16;
          }
          while (v16);
          v8 += v17 + 2;
        }
        v6 = ((_BYTE)v6 + (_BYTE)v3) & 7;
        if (v6)
        {
          v7 = *v8;
          v11 |= v7 << v14;
        }
      }
      v10 = v10 + *(float *)(v9 + 4 * (v11 & ~(-1 << v3)));
      v9 += 4 * (1 << v3);
      ++v5;
    }
    while (v5 != v4);
  }
  ++result[11];
  return result;
}

_QWORD *faiss::`anonymous namespace'::PQDistanceComputer<faiss::PQDecoderGeneric>::symmetric_dis(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  float v16;
  uint64_t v17;
  int v18;
  unsigned int v19;
  char v20;
  unsigned __int8 *v21;
  unsigned int v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  int v26;
  unsigned int v27;
  char v28;
  unsigned __int8 *v29;
  unsigned int v30;
  uint64_t v31;
  unsigned int v32;
  int v33;
  std::string *v34;
  size_t size;
  void *exception;
  std::string v37;

  v3 = result[7];
  if (!v3)
  {
    memset(&v37, 0, sizeof(v37));
    v33 = snprintf(0, 0, "Error: '%s' failed", "sdc");
    std::string::resize(&v37, v33 + 1, 0);
    if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v34 = &v37;
    else
      v34 = (std::string *)v37.__r_.__value_.__r.__words[0];
    if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v37.__r_.__value_.__r.__words[2]);
    else
      size = v37.__r_.__value_.__l.__size_;
    snprintf((char *)v34, size, "Error: '%s' failed", "sdc");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v37, "virtual float faiss::(anonymous namespace)::PQDistanceComputer<faiss::PQDecoderGeneric>::symmetric_dis(idx_t, idx_t) [PQDecoder = faiss::PQDecoderGeneric]", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexPQ.cpp", 154);
  }
  v4 = result[6];
  v5 = *(_QWORD *)(v4 + 16);
  if ((int)v5 >= 65)
    faiss::decode<faiss::PQDecoderGeneric>();
  v6 = *(_QWORD *)(v4 + 8);
  if (v6)
  {
    v7 = 0;
    LOBYTE(v8) = 0;
    LODWORD(v9) = 0;
    LOBYTE(v10) = 0;
    LODWORD(v11) = 0;
    v12 = result[4];
    v13 = result[5];
    v14 = (unsigned __int8 *)(v12 + v13 * a3);
    v15 = (unsigned __int8 *)(v12 + v13 * a2);
    v16 = 0.0;
    do
    {
      if (!(_BYTE)v10)
        LODWORD(v9) = *v15;
      v17 = v9 >> v10;
      v18 = v5 + v10;
      v19 = v18 - 8;
      if (v18 < 8)
      {
        LOBYTE(v10) = v5 + v10;
      }
      else
      {
        v20 = 8 - v10;
        v21 = v15 + 1;
        if (v19 < 8)
        {
          ++v15;
        }
        else
        {
          v22 = v19 >> 3;
          v23 = v22 - 1;
          do
          {
            v24 = *v21++;
            v17 |= (unint64_t)v24 << v20;
            v20 += 8;
            --v22;
          }
          while (v22);
          v15 += v23 + 2;
        }
        v10 = ((_BYTE)v10 + (_BYTE)v5) & 7;
        if (v10)
        {
          v9 = *v15;
          v17 |= v9 << v20;
        }
      }
      if (!(_BYTE)v8)
        LODWORD(v11) = *v14;
      v25 = v11 >> v8;
      v26 = v5 + v8;
      v27 = v26 - 8;
      if (v26 < 8)
      {
        LOBYTE(v8) = v5 + v8;
      }
      else
      {
        v28 = 8 - v8;
        v29 = v14 + 1;
        if (v27 < 8)
        {
          ++v14;
        }
        else
        {
          v30 = v27 >> 3;
          v31 = v30 - 1;
          do
          {
            v32 = *v29++;
            v25 |= (unint64_t)v32 << v28;
            v28 += 8;
            --v30;
          }
          while (v30);
          v14 += v31 + 2;
        }
        v8 = ((_BYTE)v8 + (_BYTE)v5) & 7;
        if (v8)
        {
          v11 = *v14;
          v25 |= v11 << v28;
        }
      }
      v16 = v16 + *(float *)(v3 + 4 * (((v25 & ~(-1 << v5)) << v5) + (v17 & ~(-1 << v5))));
      v3 += 4 * (1 << (2 * v5));
      ++v7;
    }
    while (v7 != v6);
  }
  ++result[11];
  return result;
}

void sub_1D4911724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

_QWORD *faiss::`anonymous namespace'::PQDistanceComputer<faiss::PQDecoderGeneric>::~PQDistanceComputer(_QWORD *a1)
{
  void *v2;

  *a1 = off_1E9805B18;
  v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  return a1;
}

void faiss::`anonymous namespace'::PQDistanceComputer<faiss::PQDecoderGeneric>::~PQDistanceComputer(_QWORD *a1)
{
  void *v2;

  *a1 = off_1E9805B18;
  v2 = (void *)a1[8];
  if (v2)
  {
    a1[9] = v2;
    operator delete(v2);
  }
  JUMPOUT(0x1D82628A4);
}

void **std::vector<faiss::`anonymous namespace'::SemiSortedArray<float>>::~vector[abi:ne180100](void **a1)
{
  char *v2;
  char *v3;
  void *v4;
  void *v5;

  v2 = (char *)*a1;
  if (*a1)
  {
    v3 = (char *)a1[1];
    v4 = *a1;
    if (v3 != v2)
    {
      do
      {
        v5 = (void *)*((_QWORD *)v3 - 5);
        if (v5)
        {
          *((_QWORD *)v3 - 4) = v5;
          operator delete(v5);
        }
        v3 -= 56;
      }
      while (v3 != v2);
      v4 = *a1;
    }
    a1[1] = v2;
    operator delete(v4);
  }
  return a1;
}

float faiss::`anonymous namespace'::SemiSortedArray<float>::get_diff(uint64_t a1, int a2)
{
  int v4;

  v4 = *(_DWORD *)(a1 + 40);
  if (v4 <= a2)
  return *(float *)(*(_QWORD *)a1 + 4 * *(int *)(*(_QWORD *)(a1 + 16) + 4 * a2))
       - *(float *)(*(_QWORD *)a1 + 4 * *(int *)(*(_QWORD *)(a1 + 16) + 4 * a2 - 4));
}

uint64_t faiss::`anonymous namespace'::SemiSortedArray<float>::grow(uint64_t result, int a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  int *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  BOOL v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  float v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  float v28;
  float v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  int v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  float v40;
  float v41;
  int *v42;
  int *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v2 = result;
  v3 = *(_DWORD *)(result + 8);
  if (v3 > a2)
  {
    v4 = *(int *)(result + 40);
    v5 = (a2 - v4);
    v6 = v3 - v4;
    v7 = *(_QWORD *)result;
    v8 = (int *)(*(_QWORD *)(result + 16) + 4 * v4);
    if ((int)v5 >= 2)
    {
      v9 = v8 - 1;
      v10 = 1;
      do
      {
        v11 = v8[v10++];
        v12 = *(float *)(v7 + 4 * v11);
        v13 = v10;
        while (1)
        {
          v14 = v13 >> 1;
          v15 = v9[v13 >> 1];
          if (v12 <= *(float *)(v7 + 4 * v15))
            break;
          v9[v13] = v15;
          v16 = v13 > 3;
          v13 >>= 1;
          if (!v16)
            goto LABEL_9;
        }
        v14 = v13;
LABEL_9:
        v9[v14] = v11;
      }
      while (v10 != v5);
    }
    v17 = v8 - 1;
    v18 = (int)v5;
    do
    {
      v19 = v8[v18];
      v20 = *v8;
      v21 = *(float *)(v7 + 4 * v19);
      if (*(float *)(v7 + 4 * v20) <= v21)
        goto LABEL_29;
      v22 = v17[(int)v5];
      if (v5 < 2)
      {
        *v8 = v22;
        result = (int)v5;
        goto LABEL_28;
      }
      v23 = *(float *)(v7 + 4 * v22);
      v24 = 3;
      v25 = 2;
      v26 = 1;
      while (1)
      {
        v27 = v17[v25];
        v28 = *(float *)(v7 + 4 * v27);
        if (v24 == (int)v5 + 1 || (v29 = *(float *)(v7 + 4 * v17[v24]), v28 > v29))
        {
          if (v23 > v28)
            break;
          goto LABEL_20;
        }
        LODWORD(v27) = v17[v24];
        v25 = v24;
        if (v23 > v29)
          break;
LABEL_20:
        v17[v26] = v27;
        v30 = v25;
        v25 *= 2;
        v24 = (2 * v30) | 1;
        v26 = v30;
        if (v25 > (int)v5)
          goto LABEL_23;
      }
      v30 = v26;
LABEL_23:
      v17[v30] = v17[(int)v5];
      v31 = (int)v5;
      while (1)
      {
        result = v31 >> 1;
        v32 = v17[v31 >> 1];
        if (v21 <= *(float *)(v7 + 4 * v32))
          break;
        v17[v31] = v32;
        v16 = v31 > 3;
        v31 >>= 1;
        if (!v16)
          goto LABEL_28;
      }
      result = v31;
LABEL_28:
      v17[result] = v19;
      v8[v18] = v20;
LABEL_29:
      ++v18;
    }
    while (v18 != v6);
    if ((int)v5 < 2)
      goto LABEL_41;
LABEL_31:
    v33 = v5;
    v34 = *(float *)(v7 + 4 * v17[v5--]);
    v35 = *v8;
    v36 = 3;
    v37 = 2;
    v38 = 1;
    while (1)
    {
      v39 = v17[v37];
      v40 = *(float *)(v7 + 4 * v39);
      if (v36 == v33 + 1 || (v41 = *(float *)(v7 + 4 * v17[v36]), v40 > v41))
      {
        if (v34 > v40)
          goto LABEL_39;
      }
      else
      {
        LODWORD(v39) = v17[v36];
        v37 = v36;
        if (v34 > v41)
        {
LABEL_39:
          result = v38;
LABEL_40:
          v17[result] = v17[v33];
          v8[v5] = v35;
          if (v33 <= 2)
          {
LABEL_41:
            *(_DWORD *)(v2 + 40) = a2;
            return result;
          }
          goto LABEL_31;
        }
      }
      v17[v38] = v39;
      result = v37;
      v37 *= 2;
      v36 = (2 * result) | 1;
      v38 = result;
      if (v37 > v33)
        goto LABEL_40;
    }
  }
  v42 = *(int **)(result + 24);
  v43 = (int *)(*(_QWORD *)(result + 16) + 4 * *(int *)(result + 40));
  v44 = 126 - 2 * __clz(v42 - v43);
  v46 = *(_QWORD *)v2;
  if (v42 == v43)
    v45 = 0;
  else
    v45 = v44;
  *(_DWORD *)(v2 + 40) = *(_DWORD *)(v2 + 8);
  return result;
}

int *std::__introsort<std::_ClassicAlgPolicy,faiss::`anonymous namespace'::ArgSort<float> &,int *,false>(int *result, int *a2, uint64_t *a3, uint64_t a4, char a5)
{
  int *v9;
  int *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int *v14;
  int v15;
  int v16;
  uint64_t v17;
  float v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  int v26;
  int *v27;
  int *v28;
  uint64_t v29;
  uint64_t v30;
  int *v31;
  BOOL v32;
  uint64_t v33;
  int *v34;
  int *v35;
  uint64_t v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  int *v41;
  uint64_t v42;
  uint64_t v43;
  int *v44;
  int *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  float v51;
  uint64_t v52;
  uint64_t v53;
  int *v54;
  uint64_t v55;
  uint64_t v56;
  int *v57;
  uint64_t v58;
  uint64_t v59;
  float v60;
  uint64_t v61;
  int *v62;
  int64_t v63;
  uint64_t v64;
  int64_t v65;
  int64_t v66;
  uint64_t v67;
  int *v68;
  int *v69;
  uint64_t v70;
  float v71;
  int *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  int *v79;
  int *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  int *v85;
  uint64_t v86;
  uint64_t v87;
  float v88;
  int *v89;
  int *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  float v95;

  v9 = result;
LABEL_2:
  v10 = v9;
  while (2)
  {
    v9 = v10;
    v11 = (char *)a2 - (char *)v10;
    v12 = a2 - v10;
    switch(v12)
    {
      case 0uLL:
      case 1uLL:
        return result;
      case 2uLL:
        v42 = *(a2 - 1);
        v43 = *v10;
        if (*(float *)(*a3 + 4 * v42) < *(float *)(*a3 + 4 * v43))
        {
          *v10 = v42;
          *(a2 - 1) = v43;
        }
        return result;
      case 3uLL:
      case 4uLL:
      case 5uLL:
        v44 = v10 + 2;
        v45 = v10 + 3;
        v46 = *(a2 - 1);
        v47 = v10[3];
        v48 = *a3;
        if (*(float *)(*a3 + 4 * v46) < *(float *)(*a3 + 4 * v47))
        {
          *v45 = v46;
          *(a2 - 1) = v47;
          v49 = *v45;
          v50 = *v44;
          v51 = *(float *)(v48 + 4 * v49);
          if (v51 < *(float *)(v48 + 4 * v50))
          {
            *v44 = v49;
            *v45 = v50;
            v52 = v10[1];
            if (v51 < *(float *)(v48 + 4 * v52))
            {
              v10[1] = v49;
              v10[2] = v52;
              v53 = *v10;
              if (v51 < *(float *)(v48 + 4 * v53))
              {
                *v10 = v49;
                v10[1] = v53;
              }
            }
          }
        }
        return result;
      default:
        if (v11 <= 95)
        {
          if ((a5 & 1) != 0)
          {
            if (v10 != a2)
            {
              v54 = v10 + 1;
              if (v10 + 1 != a2)
              {
                v55 = 0;
                v56 = *a3;
                v57 = v10;
                do
                {
                  v59 = *v57;
                  v58 = v57[1];
                  v57 = v54;
                  v60 = *(float *)(v56 + 4 * v58);
                  if (v60 < *(float *)(v56 + 4 * v59))
                  {
                    v61 = v55;
                    while (1)
                    {
                      *(int *)((char *)v10 + v61 + 4) = v59;
                      if (!v61)
                        break;
                      v59 = *(int *)((char *)v10 + v61 - 4);
                      v61 -= 4;
                      if (v60 >= *(float *)(v56 + 4 * v59))
                      {
                        v62 = (int *)((char *)v10 + v61 + 4);
                        goto LABEL_75;
                      }
                    }
                    v62 = v10;
LABEL_75:
                    *v62 = v58;
                  }
                  v54 = v57 + 1;
                  v55 += 4;
                }
                while (v57 + 1 != a2);
              }
            }
          }
          else if (v10 != a2)
          {
            v91 = v10 + 1;
            if (v10 + 1 != a2)
            {
              v92 = *a3;
              do
              {
                v94 = *v9;
                v93 = v9[1];
                v9 = v91;
                v95 = *(float *)(v92 + 4 * v93);
                if (v95 < *(float *)(v92 + 4 * v94))
                {
                  do
                  {
                    *v91 = v94;
                    v94 = *(v91 - 2);
                    --v91;
                  }
                  while (v95 < *(float *)(v92 + 4 * v94));
                  *v91 = v93;
                }
                v91 = v9 + 1;
              }
              while (v9 + 1 != a2);
            }
          }
          return result;
        }
        if (!a4)
        {
          if (v10 != a2)
          {
            v63 = (v12 - 2) >> 1;
            v64 = *a3;
            v65 = v63;
            do
            {
              v66 = v65;
              if (v63 >= v65)
              {
                v67 = (2 * v65) | 1;
                v68 = &v10[v67];
                if (2 * v66 + 2 < (uint64_t)v12 && *(float *)(v64 + 4 * *v68) < *(float *)(v64 + 4 * v68[1]))
                {
                  ++v68;
                  v67 = 2 * v66 + 2;
                }
                v69 = &v10[v66];
                result = (int *)*v68;
                v70 = *v69;
                v71 = *(float *)(v64 + 4 * v70);
                if (*(float *)(v64 + 4 * (_QWORD)result) >= v71)
                {
                  do
                  {
                    v72 = v68;
                    *v69 = (int)result;
                    if (v63 < v67)
                      break;
                    v73 = 2 * v67;
                    v67 = (2 * v67) | 1;
                    v68 = &v10[v67];
                    v74 = v73 + 2;
                    if (v74 < (uint64_t)v12 && *(float *)(v64 + 4 * *v68) < *(float *)(v64 + 4 * v68[1]))
                    {
                      ++v68;
                      v67 = v74;
                    }
                    result = (int *)*v68;
                    v69 = v72;
                  }
                  while (*(float *)(v64 + 4 * (_QWORD)result) >= v71);
                  *v72 = v70;
                }
              }
              v65 = v66 - 1;
            }
            while (v66);
            v75 = (unint64_t)v11 >> 2;
            do
            {
              v76 = 0;
              v77 = *v10;
              v78 = *a3;
              v79 = v10;
              do
              {
                v80 = v79;
                v79 += v76 + 1;
                v81 = 2 * v76;
                v76 = (2 * v76) | 1;
                v82 = v81 + 2;
                if (v82 < v75)
                {
                  result = (int *)*v79;
                  if (*(float *)(v78 + 4 * (_QWORD)result) < *(float *)(v78 + 4 * v79[1]))
                  {
                    ++v79;
                    v76 = v82;
                  }
                }
                *v80 = *v79;
              }
              while (v76 <= (uint64_t)((unint64_t)(v75 - 2) >> 1));
              if (v79 == --a2)
              {
                *v79 = v77;
              }
              else
              {
                *v79 = *a2;
                *a2 = v77;
                v83 = (char *)v79 - (char *)v10 + 4;
                if (v83 >= 5)
                {
                  v84 = (((unint64_t)v83 >> 2) - 2) >> 1;
                  v85 = &v10[v84];
                  v86 = *v85;
                  v87 = *v79;
                  v88 = *(float *)(v78 + 4 * v87);
                  if (*(float *)(v78 + 4 * v86) < v88)
                  {
                    do
                    {
                      v89 = v85;
                      *v79 = v86;
                      if (!v84)
                        break;
                      v84 = (v84 - 1) >> 1;
                      v85 = &v10[v84];
                      v86 = *v85;
                      v79 = v89;
                    }
                    while (*(float *)(v78 + 4 * v86) < v88);
                    *v89 = v87;
                  }
                }
              }
            }
            while (v75-- > 2);
          }
          return result;
        }
        v13 = v12 >> 1;
        v14 = &v10[v12 >> 1];
        if ((unint64_t)v11 < 0x201)
        {
        }
        else
        {
          v15 = *v9;
          *v9 = *v14;
          *v14 = v15;
        }
        --a4;
        v16 = *v9;
        v17 = *a3;
        if ((a5 & 1) == 0)
        {
          v18 = *(float *)(v17 + 4 * v16);
          if (*(float *)(v17 + 4 * *(v9 - 1)) < v18)
            goto LABEL_12;
          if (v18 >= *(float *)(v17 + 4 * *(a2 - 1)))
          {
            v34 = v9 + 1;
            do
            {
              v10 = v34;
              if (v34 >= a2)
                break;
              ++v34;
            }
            while (v18 >= *(float *)(v17 + 4 * *v10));
          }
          else
          {
            v10 = v9;
            do
            {
              v33 = v10[1];
              ++v10;
            }
            while (v18 >= *(float *)(v17 + 4 * v33));
          }
          v35 = a2;
          if (v10 < a2)
          {
            v35 = a2;
            do
              v36 = *--v35;
            while (v18 < *(float *)(v17 + 4 * v36));
          }
          if (v10 < v35)
          {
            v37 = *v10;
            v38 = *v35;
            do
            {
              *v10 = v38;
              *v35 = v37;
              do
              {
                v39 = v10[1];
                ++v10;
                v37 = v39;
              }
              while (v18 >= *(float *)(v17 + 4 * v39));
              do
              {
                v40 = *--v35;
                v38 = v40;
              }
              while (v18 < *(float *)(v17 + 4 * v40));
            }
            while (v10 < v35);
          }
          v41 = v10 - 1;
          if (v10 - 1 != v9)
            *v9 = *v41;
          a5 = 0;
          *v41 = v16;
          continue;
        }
        v18 = *(float *)(v17 + 4 * v16);
LABEL_12:
        v19 = 0;
        do
          v20 = v9[++v19];
        while (*(float *)(v17 + 4 * v20) < v18);
        v21 = &v9[v19];
        v22 = a2;
        if (v19 == 1)
        {
          v22 = a2;
          do
          {
            if (v21 >= v22)
              break;
            v24 = *--v22;
          }
          while (*(float *)(v17 + 4 * v24) >= v18);
        }
        else
        {
          do
            v23 = *--v22;
          while (*(float *)(v17 + 4 * v23) >= v18);
        }
        if (v21 >= v22)
        {
          v31 = v21 - 1;
        }
        else
        {
          v25 = *v22;
          v26 = v20;
          v27 = &v9[v19];
          v28 = v22;
          do
          {
            *v27 = v25;
            *v28 = v26;
            do
            {
              v29 = v27[1];
              ++v27;
              v26 = v29;
            }
            while (*(float *)(v17 + 4 * v29) < v18);
            do
            {
              v30 = *--v28;
              v25 = v30;
            }
            while (*(float *)(v17 + 4 * v30) >= v18);
          }
          while (v27 < v28);
          v31 = v27 - 1;
        }
        if (v31 != v9)
          *v9 = *v31;
        *v31 = v16;
        if (v21 < v22)
        {
LABEL_33:
          a5 = 0;
          v10 = v31 + 1;
          continue;
        }
        v10 = v31 + 1;
        if (!(_DWORD)result)
        {
          if (v32)
            continue;
          goto LABEL_33;
        }
        a2 = v31;
        if (!v32)
          goto LABEL_2;
        return result;
    }
  }
}

int *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,faiss::`anonymous namespace'::ArgSort<float> &,int *>(int *result, int *a2, int *a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  float v8;
  uint64_t v9;
  float v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = *a2;
  v5 = *result;
  v6 = *a4;
  v7 = *(float *)(*a4 + 4 * v4);
  v8 = *(float *)(*a4 + 4 * v5);
  v9 = *a3;
  v10 = *(float *)(*a4 + 4 * v9);
  if (v7 >= v8)
  {
    if (v10 < v7)
    {
      *a2 = v9;
      *a3 = v4;
      v11 = *a2;
      v12 = *result;
      if (*(float *)(v6 + 4 * v11) < *(float *)(v6 + 4 * v12))
      {
        *result = v11;
        *a2 = v12;
      }
    }
  }
  else
  {
    if (v10 >= v7)
    {
      *result = v4;
      *a2 = v5;
      v13 = *a3;
      if (*(float *)(v6 + 4 * v13) >= v8)
        return result;
      *a2 = v13;
    }
    else
    {
      *result = v9;
    }
    *a3 = v5;
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,faiss::`anonymous namespace'::ArgSort<float> &,int *>(int *a1, int *a2, uint64_t *a3)
{
  uint64_t v6;
  _BOOL8 result;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  int *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  int *v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  float v28;
  uint64_t v29;
  uint64_t v30;

  v6 = a2 - a1;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v8 = *(a2 - 1);
      v9 = *a1;
      if (*(float *)(*a3 + 4 * v8) < *(float *)(*a3 + 4 * v9))
      {
        *a1 = v8;
        *(a2 - 1) = v9;
      }
      return result;
    case 3:
      return 1;
    case 4:
      return 1;
    case 5:
      v21 = a1 + 2;
      v22 = a1 + 3;
      v23 = *(a2 - 1);
      v24 = a1[3];
      v25 = *a3;
      if (*(float *)(*a3 + 4 * v23) < *(float *)(*a3 + 4 * v24))
      {
        *v22 = v23;
        *(a2 - 1) = v24;
        v26 = *v22;
        v27 = *v21;
        v28 = *(float *)(v25 + 4 * v26);
        if (v28 < *(float *)(v25 + 4 * v27))
        {
          *v21 = v26;
          *v22 = v27;
          v29 = a1[1];
          if (v28 < *(float *)(v25 + 4 * v29))
          {
            a1[1] = v26;
            a1[2] = v29;
            v30 = *a1;
            if (v28 < *(float *)(v25 + 4 * v30))
            {
              *a1 = v26;
              a1[1] = v30;
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
      v13 = *a3;
      v14 = 12;
      break;
  }
  while (1)
  {
    v15 = *v11;
    v16 = *v10;
    v17 = *(float *)(v13 + 4 * v15);
    if (v17 < *(float *)(v13 + 4 * v16))
    {
      v18 = v14;
      while (1)
      {
        *(int *)((char *)a1 + v18) = v16;
        v19 = v18 - 4;
        if (v18 == 4)
          break;
        v16 = *(int *)((char *)a1 + v18 - 8);
        v18 -= 4;
        if (v17 >= *(float *)(v13 + 4 * v16))
        {
          v20 = (int *)((char *)a1 + v19);
          goto LABEL_13;
        }
      }
      v20 = a1;
LABEL_13:
      *v20 = v15;
      if (++v12 == 8)
        return v11 + 1 == a2;
    }
    v10 = v11;
    v14 += 4;
    if (++v11 == a2)
      return 1;
  }
}

int *std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,faiss::`anonymous namespace'::ArgSort<float> &,int *>(int *a1, int *a2, int *a3, int *a4, uint64_t *a5)
{
  int *result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v11 = *a4;
  v12 = *a3;
  v13 = *a5;
  if (*(float *)(*a5 + 4 * v11) < *(float *)(*a5 + 4 * v12))
  {
    *a3 = v11;
    *a4 = v12;
    v14 = *a3;
    v15 = *a2;
    if (*(float *)(v13 + 4 * v14) < *(float *)(v13 + 4 * v15))
    {
      *a2 = v14;
      *a3 = v15;
      v16 = *a2;
      v17 = *a1;
      if (*(float *)(v13 + 4 * v16) < *(float *)(v13 + 4 * v17))
      {
        *a1 = v16;
        *a2 = v17;
      }
    }
  }
  return result;
}

uint64_t faiss::IndexIDMapTemplate<faiss::Index>::IndexIDMapTemplate(uint64_t result, uint64_t a2)
{
  int v2;
  std::string *v3;
  size_t size;
  void *exception;
  std::string v6;

  *(_DWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0;
  *(_WORD *)(result + 24) = 256;
  *(_QWORD *)(result + 28) = 1;
  *(_QWORD *)result = &unk_1E9806390;
  *(_QWORD *)(result + 40) = a2;
  *(_BYTE *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 72) = 0;
  if (*(_QWORD *)(a2 + 16))
  {
    memset(&v6, 0, sizeof(v6));
    v2 = snprintf(0, 0, "Error: '%s' failed: index must be empty on input", "index->ntotal == 0");
    std::string::resize(&v6, v2 + 1, 0);
    if ((v6.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v3 = &v6;
    else
      v3 = (std::string *)v6.__r_.__value_.__r.__words[0];
    if ((v6.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v6.__r_.__value_.__r.__words[2]);
    else
      size = v6.__r_.__value_.__l.__size_;
    snprintf((char *)v3, size, "Error: '%s' failed: index must be empty on input", "index->ntotal == 0");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v6, "faiss::IndexIDMapTemplate<faiss::Index>::IndexIDMapTemplate(IndexT *) [IndexT = faiss::Index]", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/MetaIndexes.cpp", 33);
  }
  *(_WORD *)(result + 24) = *(_WORD *)(a2 + 24);
  *(_DWORD *)(result + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(result + 8) = *(_DWORD *)(a2 + 8);
  return result;
}

{
  return __ZN5faiss18IndexIDMapTemplateINS_5IndexEEC2EPS1_(result, a2);
}

void sub_1D4912704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **a10, faiss::Index *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;
  void *v19;

  __cxa_free_exception(v17);
  if (a17 < 0)
    operator delete(__p);
  v19 = *a10;
  if (*a10)
  {
    *((_QWORD *)a11 + 8) = v19;
    operator delete(v19);
  }
  faiss::Index::~Index(a11);
  _Unwind_Resume(a1);
}

void faiss::IndexIDMapTemplate<faiss::Index>::add_with_ids(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void **v8;
  _QWORD *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 24))(*(_QWORD *)(a1 + 40));
  if (a2 >= 1)
  {
    v7 = 0;
    v8 = (void **)(a1 + 56);
    v9 = (_QWORD *)(a1 + 72);
    v10 = *(char **)(a1 + 64);
    do
    {
      if ((unint64_t)v10 >= *v9)
      {
        v12 = (char *)*v8;
        v13 = (v10 - (_BYTE *)*v8) >> 3;
        v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) >> 61)
          std::vector<long long>::__throw_length_error[abi:ne180100]();
        v15 = *v9 - (_QWORD)v12;
        if (v15 >> 2 > v14)
          v14 = v15 >> 2;
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
          v16 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v16 = v14;
        if (v16)
        {
          v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(a1 + 72, v16);
          v12 = *(char **)(a1 + 56);
          v10 = *(char **)(a1 + 64);
        }
        else
        {
          v17 = 0;
        }
        v18 = &v17[8 * v13];
        *(_QWORD *)v18 = *(_QWORD *)(a4 + 8 * v7);
        v11 = v18 + 8;
        while (v10 != v12)
        {
          v19 = *((_QWORD *)v10 - 1);
          v10 -= 8;
          *((_QWORD *)v18 - 1) = v19;
          v18 -= 8;
        }
        *(_QWORD *)(a1 + 56) = v18;
        *(_QWORD *)(a1 + 64) = v11;
        *(_QWORD *)(a1 + 72) = &v17[8 * v16];
        if (v12)
          operator delete(v12);
      }
      else
      {
        *(_QWORD *)v10 = *(_QWORD *)(a4 + 8 * v7);
        v11 = v10 + 8;
      }
      *(_QWORD *)(a1 + 64) = v11;
      ++v7;
      v10 = v11;
    }
    while (v7 != a2);
  }
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
}

{
  __ZN5faiss18IndexIDMapTemplateINS_5IndexEE12add_with_idsExPKfPKx(a1, a2, a3, a4);
}

void faiss::IndexIDMapTemplate<faiss::Index>::add()
{
  void *exception;
  _QWORD v1[3];

  exception = __cxa_allocate_exception(0x20uLL);
  std::string::basic_string[abi:ne180100]<0>(v1, "add does not make sense with IndexIDMap, use add_with_ids");
  faiss::FaissException::FaissException(exception, v1, "virtual void faiss::IndexIDMapTemplate<faiss::Index>::add(idx_t, const typename IndexT::component_t *) [IndexT = faiss::Index]", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/MetaIndexes.cpp", 46);
}

void sub_1D4912904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

uint64_t faiss::IndexIDMapTemplate<faiss::Index>::search(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;

  result = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 40))(*(_QWORD *)(a1 + 40));
  v11 = a4 * a2;
  if (a4 * a2 >= 1)
  {
    do
    {
      v12 = *a6;
      if ((*a6 & 0x8000000000000000) == 0)
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v12);
      *a6++ = v12;
      --v11;
    }
    while (v11);
  }
  return result;
}

uint64_t faiss::IndexIDMapTemplate<faiss::Index>::train(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(*(_QWORD *)(a1 + 40) + 25);
  return result;
}

uint64_t faiss::IndexIDMapTemplate<faiss::Index>::reset(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 64))(*(_QWORD *)(a1 + 40));
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 16) = 0;
  return result;
}

uint64_t faiss::IndexIDMapTemplate<faiss::Index>::remove_ids(uint64_t a1, uint64_t (***a2)(_QWORD, _QWORD))
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[3];

  v4 = (_QWORD *)(a1 + 56);
  v9[0] = &off_1E9805B50;
  v9[1] = a1 + 56;
  v9[2] = a2;
  v5 = (*(uint64_t (**)(_QWORD, _QWORD *))(**(_QWORD **)(a1 + 40) + 72))(*(_QWORD *)(a1 + 40), v9);
  if (*(uint64_t *)(a1 + 16) < 1)
  {
    v7 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    do
    {
      if (((**a2)(a2, *(_QWORD *)(*v4 + 8 * v6)) & 1) == 0)
        *(_QWORD *)(*v4 + 8 * v7++) = *(_QWORD *)(*v4 + 8 * v6);
      ++v6;
    }
    while (v6 < *(_QWORD *)(a1 + 16));
  }
  if (v7 != *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16))
    faiss::IndexIDMapTemplate<faiss::Index>::remove_ids();
  *(_QWORD *)(a1 + 16) = v7;
  std::vector<long long>::resize((uint64_t)v4, v7);
  return v5;
}

{
  return __ZN5faiss18IndexIDMapTemplateINS_5IndexEE10remove_idsERKNS_10IDSelectorE(a1, a2);
}

uint64_t faiss::IndexIDMapTemplate<faiss::Index>::range_search(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  result = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 48))(*(_QWORD *)(a1 + 40));
  v7 = *(_QWORD *)(a4[2] + 8 * a4[1]);
  if (v7)
  {
    v8 = (uint64_t *)a4[3];
    do
    {
      v9 = *v8;
      if ((*v8 & 0x8000000000000000) == 0)
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v9);
      *v8++ = v9;
      --v7;
    }
    while (v7);
  }
  return result;
}

void faiss::IndexIDMapTemplate<faiss::Index>::~IndexIDMapTemplate(faiss::Index *this)
{
  uint64_t v2;
  void *v3;

  *(_QWORD *)this = &unk_1E9806390;
  if (*((_BYTE *)this + 48))
  {
    v2 = *((_QWORD *)this + 5);
    if (v2)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  }
  v3 = (void *)*((_QWORD *)this + 7);
  if (v3)
  {
    *((_QWORD *)this + 8) = v3;
    operator delete(v3);
  }
  faiss::Index::~Index(this);
}

{
  __ZN5faiss18IndexIDMapTemplateINS_5IndexEED2Ev(this);
}

void faiss::IndexIDMapTemplate<faiss::Index>::~IndexIDMapTemplate(faiss::Index *a1)
{
  faiss::IndexIDMapTemplate<faiss::Index>::~IndexIDMapTemplate(a1);
  JUMPOUT(0x1D82628A4);
}

uint64_t faiss::IndexIDMapTemplate<faiss::Index>::IndexIDMapTemplate(uint64_t result)
{
  *(_DWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0;
  *(_WORD *)(result + 24) = 256;
  *(_QWORD *)(result + 28) = 1;
  *(_QWORD *)result = &unk_1E9806390;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 72) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_BYTE *)(result + 48) = 0;
  *(_QWORD *)(result + 40) = 0;
  return result;
}

{
  *(_DWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0;
  *(_WORD *)(result + 24) = 256;
  *(_QWORD *)(result + 28) = 1;
  *(_QWORD *)result = &unk_1E9806390;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 72) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_BYTE *)(result + 48) = 0;
  *(_QWORD *)(result + 40) = 0;
  return result;
}

uint64_t faiss::IndexIDMapTemplate<faiss::IndexBinary>::IndexIDMapTemplate(uint64_t result, uint64_t a2)
{
  int v2;
  std::string *v3;
  size_t size;
  void *exception;
  std::string v6;

  *(_WORD *)(result + 24) = 256;
  *(_QWORD *)(result + 16) = 0;
  *(_DWORD *)(result + 28) = 1;
  *(_QWORD *)result = &unk_1E9806320;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 32) = a2;
  *(_BYTE *)(result + 40) = 0;
  *(_QWORD *)(result + 48) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0;
  if (*(_QWORD *)(a2 + 16))
  {
    memset(&v6, 0, sizeof(v6));
    v2 = snprintf(0, 0, "Error: '%s' failed: index must be empty on input", "index->ntotal == 0");
    std::string::resize(&v6, v2 + 1, 0);
    if ((v6.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v3 = &v6;
    else
      v3 = (std::string *)v6.__r_.__value_.__r.__words[0];
    if ((v6.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v6.__r_.__value_.__r.__words[2]);
    else
      size = v6.__r_.__value_.__l.__size_;
    snprintf((char *)v3, size, "Error: '%s' failed: index must be empty on input", "index->ntotal == 0");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v6, "faiss::IndexIDMapTemplate<faiss::IndexBinary>::IndexIDMapTemplate(IndexT *) [IndexT = faiss::IndexBinary]", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/MetaIndexes.cpp", 33);
  }
  *(_WORD *)(result + 24) = *(_WORD *)(a2 + 24);
  *(_DWORD *)(result + 28) = *(_DWORD *)(a2 + 28);
  *(_DWORD *)(result + 8) = *(_DWORD *)(a2 + 8);
  return result;
}

{
  return __ZN5faiss18IndexIDMapTemplateINS_11IndexBinaryEEC2EPS1_(result, a2);
}

void sub_1D4912D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **a10, faiss::IndexBinary *a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;
  void *v19;

  __cxa_free_exception(v17);
  if (a17 < 0)
    operator delete(__p);
  v19 = *a10;
  if (*a10)
  {
    *((_QWORD *)a11 + 7) = v19;
    operator delete(v19);
  }
  faiss::IndexBinary::~IndexBinary(a11);
  _Unwind_Resume(a1);
}

void faiss::IndexIDMapTemplate<faiss::IndexBinary>::add_with_ids(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void **v8;
  _QWORD *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 24))(*(_QWORD *)(a1 + 32));
  if (a2 >= 1)
  {
    v7 = 0;
    v8 = (void **)(a1 + 48);
    v9 = (_QWORD *)(a1 + 64);
    v10 = *(char **)(a1 + 56);
    do
    {
      if ((unint64_t)v10 >= *v9)
      {
        v12 = (char *)*v8;
        v13 = (v10 - (_BYTE *)*v8) >> 3;
        v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) >> 61)
          std::vector<long long>::__throw_length_error[abi:ne180100]();
        v15 = *v9 - (_QWORD)v12;
        if (v15 >> 2 > v14)
          v14 = v15 >> 2;
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
          v16 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v16 = v14;
        if (v16)
        {
          v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(a1 + 64, v16);
          v12 = *(char **)(a1 + 48);
          v10 = *(char **)(a1 + 56);
        }
        else
        {
          v17 = 0;
        }
        v18 = &v17[8 * v13];
        *(_QWORD *)v18 = *(_QWORD *)(a4 + 8 * v7);
        v11 = v18 + 8;
        while (v10 != v12)
        {
          v19 = *((_QWORD *)v10 - 1);
          v10 -= 8;
          *((_QWORD *)v18 - 1) = v19;
          v18 -= 8;
        }
        *(_QWORD *)(a1 + 48) = v18;
        *(_QWORD *)(a1 + 56) = v11;
        *(_QWORD *)(a1 + 64) = &v17[8 * v16];
        if (v12)
          operator delete(v12);
      }
      else
      {
        *(_QWORD *)v10 = *(_QWORD *)(a4 + 8 * v7);
        v11 = v10 + 8;
      }
      *(_QWORD *)(a1 + 56) = v11;
      ++v7;
      v10 = v11;
    }
    while (v7 != a2);
  }
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
}

{
  __ZN5faiss18IndexIDMapTemplateINS_11IndexBinaryEE12add_with_idsExPKhPKx(a1, a2, a3, a4);
}

void faiss::IndexIDMapTemplate<faiss::IndexBinary>::add()
{
  void *exception;
  _QWORD v1[3];

  exception = __cxa_allocate_exception(0x20uLL);
  std::string::basic_string[abi:ne180100]<0>(v1, "add does not make sense with IndexIDMap, use add_with_ids");
  faiss::FaissException::FaissException(exception, v1, "virtual void faiss::IndexIDMapTemplate<faiss::IndexBinary>::add(idx_t, const typename IndexT::component_t *) [IndexT = faiss::IndexBinary]", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/MetaIndexes.cpp", 46);
}

void sub_1D4912F7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

uint64_t faiss::IndexIDMapTemplate<faiss::IndexBinary>::search(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;

  result = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 40))(*(_QWORD *)(a1 + 32));
  v11 = a4 * a2;
  if (a4 * a2 >= 1)
  {
    do
    {
      v12 = *a6;
      if ((*a6 & 0x8000000000000000) == 0)
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v12);
      *a6++ = v12;
      --v11;
    }
    while (v11);
  }
  return result;
}

uint64_t faiss::IndexIDMapTemplate<faiss::IndexBinary>::train(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  *(_BYTE *)(a1 + 25) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25);
  return result;
}

uint64_t faiss::IndexIDMapTemplate<faiss::IndexBinary>::reset(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 56))(*(_QWORD *)(a1 + 32));
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 16) = 0;
  return result;
}

uint64_t faiss::IndexIDMapTemplate<faiss::IndexBinary>::remove_ids(uint64_t a1, uint64_t (***a2)(_QWORD, _QWORD))
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[3];

  v4 = (_QWORD *)(a1 + 48);
  v9[0] = &off_1E9805B50;
  v9[1] = a1 + 48;
  v9[2] = a2;
  v5 = (*(uint64_t (**)(_QWORD, _QWORD *))(**(_QWORD **)(a1 + 32) + 64))(*(_QWORD *)(a1 + 32), v9);
  if (*(uint64_t *)(a1 + 16) < 1)
  {
    v7 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    do
    {
      if (((**a2)(a2, *(_QWORD *)(*v4 + 8 * v6)) & 1) == 0)
        *(_QWORD *)(*v4 + 8 * v7++) = *(_QWORD *)(*v4 + 8 * v6);
      ++v6;
    }
    while (v6 < *(_QWORD *)(a1 + 16));
  }
  if (v7 != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    faiss::IndexIDMapTemplate<faiss::IndexBinary>::remove_ids();
  *(_QWORD *)(a1 + 16) = v7;
  std::vector<long long>::resize((uint64_t)v4, v7);
  return v5;
}

{
  return __ZN5faiss18IndexIDMapTemplateINS_11IndexBinaryEE10remove_idsERKNS_10IDSelectorE(a1, a2);
}

uint64_t faiss::IndexIDMapTemplate<faiss::IndexBinary>::range_search(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t result;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;

  result = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 48))(*(_QWORD *)(a1 + 32));
  v8 = *(_QWORD *)(a5[2] + 8 * a5[1]);
  if (v8)
  {
    v9 = (uint64_t *)a5[3];
    do
    {
      v10 = *v9;
      if ((*v9 & 0x8000000000000000) == 0)
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8 * v10);
      *v9++ = v10;
      --v8;
    }
    while (v8);
  }
  return result;
}

void faiss::IndexIDMapTemplate<faiss::IndexBinary>::~IndexIDMapTemplate(faiss::IndexBinary *this)
{
  uint64_t v2;
  void *v3;

  *(_QWORD *)this = &unk_1E9806320;
  if (*((_BYTE *)this + 40))
  {
    v2 = *((_QWORD *)this + 4);
    if (v2)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  }
  v3 = (void *)*((_QWORD *)this + 6);
  if (v3)
  {
    *((_QWORD *)this + 7) = v3;
    operator delete(v3);
  }
  faiss::IndexBinary::~IndexBinary(this);
}

{
  __ZN5faiss18IndexIDMapTemplateINS_11IndexBinaryEED2Ev(this);
}

void faiss::IndexIDMapTemplate<faiss::IndexBinary>::~IndexIDMapTemplate(faiss::IndexBinary *a1)
{
  faiss::IndexIDMapTemplate<faiss::IndexBinary>::~IndexIDMapTemplate(a1);
  JUMPOUT(0x1D82628A4);
}

uint64_t faiss::IndexIDMapTemplate<faiss::IndexBinary>::IndexIDMapTemplate(uint64_t result)
{
  *(_QWORD *)(result + 16) = 0;
  *(_WORD *)(result + 24) = 256;
  *(_DWORD *)(result + 28) = 1;
  *(_QWORD *)result = &unk_1E9806320;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 48) = 0;
  *(_BYTE *)(result + 40) = 0;
  *(_QWORD *)(result + 32) = 0;
  return result;
}

{
  *(_QWORD *)(result + 16) = 0;
  *(_WORD *)(result + 24) = 256;
  *(_DWORD *)(result + 28) = 1;
  *(_QWORD *)result = &unk_1E9806320;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 56) = 0;
  *(_QWORD *)(result + 64) = 0;
  *(_QWORD *)(result + 48) = 0;
  *(_BYTE *)(result + 40) = 0;
  *(_QWORD *)(result + 32) = 0;
  return result;
}

double faiss::IndexIDMap2Template<faiss::Index>::IndexIDMap2Template(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  v2 = faiss::IndexIDMapTemplate<faiss::Index>::IndexIDMapTemplate(a1, a2);
  *(_QWORD *)v2 = &unk_1E98065C8;
  result = 0.0;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 96) = 0u;
  *(_DWORD *)(v2 + 112) = 1065353216;
  return result;
}

{
  uint64_t v2;
  double result;

  v2 = faiss::IndexIDMapTemplate<faiss::Index>::IndexIDMapTemplate(a1, a2);
  *(_QWORD *)v2 = &unk_1E98065C8;
  result = 0.0;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 96) = 0u;
  *(_DWORD *)(v2 + 112) = 1065353216;
  return result;
}

_QWORD *faiss::IndexIDMap2Template<faiss::Index>::construct_rev_map(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;
  unint64_t v5;
  unint64_t *v6;

  v2 = (uint64_t)(a1 + 10);
  result = std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::clear(a1 + 10);
  if (a1[2])
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = (unint64_t *)(a1[7] + v4);
      result = std::__hash_table<std::__hash_value_type<unsigned long long,long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v2, v6, (uint64_t)&std::piecewise_construct, &v6);
      result[3] = v5++;
      v4 += 8;
    }
    while (v5 < a1[2]);
  }
  return result;
}

{
  return __ZN5faiss19IndexIDMap2TemplateINS_5IndexEE17construct_rev_mapEv(a1);
}

void faiss::IndexIDMap2Template<faiss::Index>::add_with_ids(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;

  v5 = *(_QWORD *)(a1 + 16);
  faiss::IndexIDMapTemplate<faiss::Index>::add_with_ids(a1, a2, a3, a4);
  if (v5 < *(_QWORD *)(a1 + 16))
  {
    v6 = 8 * v5;
    do
    {
      v7 = (unint64_t *)(*(_QWORD *)(a1 + 56) + v6);
      std::__hash_table<std::__hash_value_type<unsigned long long,long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 80, v7, (uint64_t)&std::piecewise_construct, &v7)[3] = v5++;
      v6 += 8;
    }
    while (v5 < *(_QWORD *)(a1 + 16));
  }
}

uint64_t faiss::IndexIDMap2Template<faiss::Index>::remove_ids(_QWORD *a1, uint64_t (***a2)(_QWORD, _QWORD))
{
  uint64_t v3;

  v3 = faiss::IndexIDMapTemplate<faiss::Index>::remove_ids((uint64_t)a1, a2);
  faiss::IndexIDMap2Template<faiss::Index>::construct_rev_map(a1);
  return v3;
}

uint64_t faiss::IndexIDMap2Template<faiss::Index>::reconstruct(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  unint64_t v7;

  v7 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::find<long long>((_QWORD *)(a1 + 80), &v7);
  if (!v5)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v4 + 80))(v4, v5[3], a3);
}

void sub_1D49134D8(uint64_t a1, uint64_t a2, std::string *a3)
{
  __break(1u);
}

void sub_1D491359C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void *v16;

  __cxa_free_exception(v16);
  if (a16 < 0)
    operator delete(__p);
  __cxa_end_catch();
  JUMPOUT(0x1D49135C4);
}

void faiss::IndexIDMap2Template<faiss::Index>::~IndexIDMap2Template(faiss::Index *a1)
{
  *(_QWORD *)a1 = &unk_1E98065C8;
  std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::~__hash_table((uint64_t)a1 + 80);
  faiss::IndexIDMapTemplate<faiss::Index>::~IndexIDMapTemplate(a1);
}

{
  *(_QWORD *)a1 = &unk_1E98065C8;
  std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::~__hash_table((uint64_t)a1 + 80);
  faiss::IndexIDMapTemplate<faiss::Index>::~IndexIDMapTemplate(a1);
}

{
  *(_QWORD *)a1 = &unk_1E98065C8;
  std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::~__hash_table((uint64_t)a1 + 80);
  faiss::IndexIDMapTemplate<faiss::Index>::~IndexIDMapTemplate(a1);
  JUMPOUT(0x1D82628A4);
}

double faiss::IndexIDMap2Template<faiss::Index>::IndexIDMap2Template(uint64_t a1)
{
  double result;

  *(_DWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 24) = 256;
  *(_QWORD *)(a1 + 28) = 1;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)a1 = &unk_1E98065C8;
  result = 0.0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 112) = 1065353216;
  return result;
}

{
  double result;

  *(_DWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 24) = 256;
  *(_QWORD *)(a1 + 28) = 1;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_BYTE *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)a1 = &unk_1E98065C8;
  result = 0.0;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 112) = 1065353216;
  return result;
}

double faiss::IndexIDMap2Template<faiss::IndexBinary>::IndexIDMap2Template(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  v2 = faiss::IndexIDMapTemplate<faiss::IndexBinary>::IndexIDMapTemplate(a1, a2);
  *(_QWORD *)v2 = &unk_1E9806558;
  result = 0.0;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_DWORD *)(v2 + 104) = 1065353216;
  return result;
}

{
  uint64_t v2;
  double result;

  v2 = faiss::IndexIDMapTemplate<faiss::IndexBinary>::IndexIDMapTemplate(a1, a2);
  *(_QWORD *)v2 = &unk_1E9806558;
  result = 0.0;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_DWORD *)(v2 + 104) = 1065353216;
  return result;
}

_QWORD *faiss::IndexIDMap2Template<faiss::IndexBinary>::construct_rev_map(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;
  unint64_t v5;
  unint64_t *v6;

  v2 = (uint64_t)(a1 + 9);
  result = std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::clear(a1 + 9);
  if (a1[2])
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = (unint64_t *)(a1[6] + v4);
      result = std::__hash_table<std::__hash_value_type<unsigned long long,long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v2, v6, (uint64_t)&std::piecewise_construct, &v6);
      result[3] = v5++;
      v4 += 8;
    }
    while (v5 < a1[2]);
  }
  return result;
}

{
  return __ZN5faiss19IndexIDMap2TemplateINS_11IndexBinaryEE17construct_rev_mapEv(a1);
}

void faiss::IndexIDMap2Template<faiss::IndexBinary>::add_with_ids(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v5;
  uint64_t v6;
  unint64_t *v7;

  v5 = *(_QWORD *)(a1 + 16);
  faiss::IndexIDMapTemplate<faiss::IndexBinary>::add_with_ids(a1, a2, a3, a4);
  if (v5 < *(_QWORD *)(a1 + 16))
  {
    v6 = 8 * v5;
    do
    {
      v7 = (unint64_t *)(*(_QWORD *)(a1 + 48) + v6);
      std::__hash_table<std::__hash_value_type<unsigned long long,long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 72, v7, (uint64_t)&std::piecewise_construct, &v7)[3] = v5++;
      v6 += 8;
    }
    while (v5 < *(_QWORD *)(a1 + 16));
  }
}

uint64_t faiss::IndexIDMap2Template<faiss::IndexBinary>::remove_ids(_QWORD *a1, uint64_t (***a2)(_QWORD, _QWORD))
{
  uint64_t v3;

  v3 = faiss::IndexIDMapTemplate<faiss::IndexBinary>::remove_ids((uint64_t)a1, a2);
  faiss::IndexIDMap2Template<faiss::IndexBinary>::construct_rev_map(a1);
  return v3;
}

uint64_t faiss::IndexIDMap2Template<faiss::IndexBinary>::reconstruct(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  unint64_t v7;

  v7 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::find<long long>((_QWORD *)(a1 + 72), &v7);
  if (!v5)
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)v4 + 72))(v4, v5[3], a3);
}

void sub_1D4913938(uint64_t a1, uint64_t a2, std::string *a3)
{
  __break(1u);
}

void sub_1D49139FC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void *v16;

  __cxa_free_exception(v16);
  if (a16 < 0)
    operator delete(__p);
  __cxa_end_catch();
  JUMPOUT(0x1D4913A24);
}

void faiss::IndexIDMap2Template<faiss::IndexBinary>::~IndexIDMap2Template(faiss::IndexBinary *a1)
{
  *(_QWORD *)a1 = &unk_1E9806558;
  std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::~__hash_table((uint64_t)a1 + 72);
  faiss::IndexIDMapTemplate<faiss::IndexBinary>::~IndexIDMapTemplate(a1);
}

{
  *(_QWORD *)a1 = &unk_1E9806558;
  std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::~__hash_table((uint64_t)a1 + 72);
  faiss::IndexIDMapTemplate<faiss::IndexBinary>::~IndexIDMapTemplate(a1);
}

{
  *(_QWORD *)a1 = &unk_1E9806558;
  std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::~__hash_table((uint64_t)a1 + 72);
  faiss::IndexIDMapTemplate<faiss::IndexBinary>::~IndexIDMapTemplate(a1);
  JUMPOUT(0x1D82628A4);
}

double faiss::IndexIDMap2Template<faiss::IndexBinary>::IndexIDMap2Template(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 24) = 256;
  *(_DWORD *)(a1 + 28) = 1;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)a1 = &unk_1E9806558;
  *(_QWORD *)(a1 + 8) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 1065353216;
  return result;
}

{
  double result;

  *(_QWORD *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 24) = 256;
  *(_DWORD *)(a1 + 28) = 1;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)a1 = &unk_1E9806558;
  *(_QWORD *)(a1 + 8) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 1065353216;
  return result;
}

double faiss::IndexSplitVectors::IndexSplitVectors(faiss::IndexSplitVectors *this, int a2, char a3)
{
  double result;

  *((_DWORD *)this + 2) = a2;
  *((_QWORD *)this + 2) = 0;
  *((_WORD *)this + 12) = 256;
  *(_QWORD *)((char *)this + 28) = 1;
  *(_QWORD *)this = &off_1E9806188;
  *((_BYTE *)this + 36) = 0;
  *((_BYTE *)this + 37) = a3;
  result = 0.0;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  return result;
}

{
  double result;

  *((_DWORD *)this + 2) = a2;
  *((_QWORD *)this + 2) = 0;
  *((_WORD *)this + 12) = 256;
  *(_QWORD *)((char *)this + 28) = 1;
  *(_QWORD *)this = &off_1E9806188;
  *((_BYTE *)this + 36) = 0;
  *((_BYTE *)this + 37) = a3;
  result = 0.0;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  return result;
}

uint64_t faiss::IndexSplitVectors::add_sub_index(faiss::IndexSplitVectors *this, faiss::Index *a2)
{
  char *v4;
  unint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  void **v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;

  v6 = *((_QWORD *)this + 7);
  v4 = (char *)this + 56;
  v5 = v6;
  v7 = (_QWORD *)*((_QWORD *)v4 - 1);
  if ((unint64_t)v7 >= v6)
  {
    v9 = (void **)(v4 - 16);
    v10 = *((_QWORD *)v4 - 2);
    v11 = ((uint64_t)v7 - v10) >> 3;
    if ((unint64_t)(v11 + 1) >> 61)
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    v12 = v5 - v10;
    v13 = v12 >> 2;
    if (v12 >> 2 <= (unint64_t)(v11 + 1))
      v13 = v11 + 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>((uint64_t)v4, v14);
    else
      v15 = 0;
    v16 = &v15[8 * v11];
    v17 = &v15[8 * v14];
    *(_QWORD *)v16 = a2;
    v8 = v16 + 8;
    v19 = (char *)*((_QWORD *)this + 5);
    v18 = (char *)*((_QWORD *)this + 6);
    if (v18 != v19)
    {
      do
      {
        v20 = *((_QWORD *)v18 - 1);
        v18 -= 8;
        *((_QWORD *)v16 - 1) = v20;
        v16 -= 8;
      }
      while (v18 != v19);
      v18 = (char *)*v9;
    }
    *((_QWORD *)this + 5) = v16;
    *((_QWORD *)this + 6) = v8;
    *((_QWORD *)this + 7) = v17;
    if (v18)
      operator delete(v18);
  }
  else
  {
    *v7 = a2;
    v8 = v7 + 1;
  }
  *((_QWORD *)this + 6) = v8;
  return faiss::IndexSplitVectors::sync_with_sub_indexes((uint64_t)this);
}

uint64_t faiss::IndexSplitVectors::sync_with_sub_indexes(uint64_t this)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  std::string *v13;
  size_t v14;
  void *v15;
  int v16;
  std::string *v17;
  size_t size;
  void *exception;
  std::string v20;

  v1 = *(uint64_t **)(this + 40);
  v2 = *(uint64_t **)(this + 48);
  if (v1 != v2)
  {
    v3 = *v1;
    v4 = *(int *)(*v1 + 8);
    *(_QWORD *)(this + 64) = v4;
    v5 = *(_DWORD *)(v3 + 28);
    *(_DWORD *)(this + 28) = v5;
    *(_BYTE *)(this + 25) = *(_BYTE *)(v3 + 25);
    v6 = *(_QWORD *)(v3 + 16);
    *(_QWORD *)(this + 16) = v6;
    v7 = (char *)v2 - (char *)v1;
    if ((unint64_t)v7 >= 9)
    {
      v8 = v7 >> 3;
      if (v8 <= 2)
        v8 = 2;
      v9 = v1 + 1;
      v10 = v8 - 1;
      do
      {
        v11 = *v9;
        if (v5 != *(_DWORD *)(*v9 + 28))
        {
          memset(&v20, 0, sizeof(v20));
          v16 = snprintf(0, 0, "Error: '%s' failed", "metric_type == index->metric_type");
          std::string::resize(&v20, v16 + 1, 0);
          if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v17 = &v20;
          else
            v17 = (std::string *)v20.__r_.__value_.__r.__words[0];
          if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            size = HIBYTE(v20.__r_.__value_.__r.__words[2]);
          else
            size = v20.__r_.__value_.__l.__size_;
          snprintf((char *)v17, size, "Error: '%s' failed", "metric_type == index->metric_type");
          exception = __cxa_allocate_exception(0x20uLL);
          faiss::FaissException::FaissException(exception, &v20, "void faiss::IndexSplitVectors::sync_with_sub_indexes()", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/MetaIndexes.cpp", 223);
        }
        if (v6 != *(_QWORD *)(v11 + 16))
        {
          memset(&v20, 0, sizeof(v20));
          v12 = snprintf(0, 0, "Error: '%s' failed", "ntotal == index->ntotal");
          std::string::resize(&v20, v12 + 1, 0);
          if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v13 = &v20;
          else
            v13 = (std::string *)v20.__r_.__value_.__r.__words[0];
          if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v14 = HIBYTE(v20.__r_.__value_.__r.__words[2]);
          else
            v14 = v20.__r_.__value_.__l.__size_;
          snprintf((char *)v13, v14, "Error: '%s' failed", "ntotal == index->ntotal");
          v15 = __cxa_allocate_exception(0x20uLL);
          faiss::FaissException::FaissException(v15, &v20, "void faiss::IndexSplitVectors::sync_with_sub_indexes()", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/MetaIndexes.cpp", 224);
        }
        v4 += *(int *)(v11 + 8);
        *(_QWORD *)(this + 64) = v4;
        ++v9;
        --v10;
      }
      while (v10);
    }
  }
  return this;
}

void sub_1D4913ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void faiss::IndexSplitVectors::add(faiss::IndexSplitVectors *this, uint64_t a2, const float *a3)
{
  void *exception;
  _QWORD v4[3];

  exception = __cxa_allocate_exception(0x20uLL);
  std::string::basic_string[abi:ne180100]<0>(v4, "not implemented");
  faiss::FaissException::FaissException(exception, v4, "virtual void faiss::IndexSplitVectors::add(idx_t, const float *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/MetaIndexes.cpp", 230);
}

void sub_1D4913F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

uint64_t faiss::IndexSplitVectors::search(faiss::IndexSplitVectors *this, uint64_t a2, const float *a3, uint64_t a4, float *a5, uint64_t *a6)
{
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  faiss::WorkerThread *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  faiss::WorkerThread **v27;
  void **v28;
  faiss::WorkerThread *v29;
  __int128 v30;
  void **v31;
  uint64_t v32;
  char *v33;
  std::__assoc_sub_state **v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void **v39;
  void **v40;
  std::__assoc_sub_state **v41;
  uint64_t v42;
  unint64_t *v43;
  unint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  std::__assoc_sub_state **v47;
  std::__assoc_sub_state **v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  float *v54;
  uint64_t *v55;
  _QWORD *v56;
  float *v57;
  float *v58;
  uint64_t v59;
  int v61;
  char *v62;
  size_t v63;
  void *exception;
  int v65;
  char *v66;
  size_t v67;
  void *v68;
  float *v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  std::__assoc_sub_state **v73;
  std::__assoc_sub_state **v74;
  unint64_t v75;
  __int128 v76;
  _QWORD v77[2];
  _BYTE v78[32];
  __int128 v79;
  __int128 v80;
  void **v81;
  __int128 v82;
  void **v83;
  unint64_t *v84;
  unint64_t *v85;
  _BYTE v86[68];
  _BYTE v87[24];
  _BYTE *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  if (a4 != 1)
  {
    memset(v78, 0, 24);
    v61 = snprintf(0, 0, "Error: '%s' failed: search implemented only for k=1", "k == 1");
    std::string::resize((std::string *)v78, v61 + 1, 0);
    if (v78[23] >= 0)
      v62 = v78;
    else
      v62 = *(char **)v78;
    if (v78[23] >= 0)
      v63 = v78[23];
    else
      v63 = *(_QWORD *)&v78[8];
    snprintf(v62, v63, "Error: '%s' failed: search implemented only for k=1", "k == 1");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, v78, "virtual void faiss::IndexSplitVectors::search(idx_t, const float *, idx_t, float *, idx_t *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/MetaIndexes.cpp", 239);
  }
  if (*((_QWORD *)this + 8) != *((_DWORD *)this + 2))
  {
    memset(v78, 0, 24);
    v65 = snprintf(0, 0, "Error: '%s' failed: not enough indexes compared to # dimensions", "sum_d == d");
    std::string::resize((std::string *)v78, v65 + 1, 0);
    if (v78[23] >= 0)
      v66 = v78;
    else
      v66 = *(char **)v78;
    if (v78[23] >= 0)
      v67 = v78[23];
    else
      v67 = *(_QWORD *)&v78[8];
    snprintf(v66, v67, "Error: '%s' failed: not enough indexes compared to # dimensions", "sum_d == d");
    v68 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v68, v78, "virtual void faiss::IndexSplitVectors::search(idx_t, const float *, idx_t, float *, idx_t *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/MetaIndexes.cpp", 241);
  }
  v11 = *((_QWORD *)this + 6) - *((_QWORD *)this + 5);
  i = v11 >> 3;
  v13 = operator new[]();
  v14 = operator new[]();
  v15 = v14;
  *(_QWORD *)v78 = a2;
  *(_QWORD *)&v78[8] = a3;
  *(_QWORD *)&v78[16] = 1;
  *(_QWORD *)&v78[24] = a5;
  *(_QWORD *)&v79 = a6;
  *((_QWORD *)&v79 + 1) = v13;
  *(_QWORD *)&v80 = v14;
  *((_QWORD *)&v80 + 1) = this;
  if (!*((_BYTE *)this + 37))
  {
    if (v11 >= 1)
      faiss::IndexSplitVectors::search(long long,float const*,long long,float *,long long *)const::$_0::operator()(v78, 0);
    goto LABEL_65;
  }
  v76 = 0uLL;
  v77[0] = 0;
  v73 = 0;
  v74 = 0;
  v75 = 0;
  if (v11 < 1)
    goto LABEL_48;
  v69 = a5;
  v70 = a6;
  v71 = v14;
  v72 = v13;
  v16 = 0;
  if (i <= 1)
    v17 = 1;
  else
    v17 = v11 >> 3;
  do
  {
    v18 = (faiss::WorkerThread *)operator new();
    faiss::WorkerThread::WorkerThread(v18);
    v19 = (_QWORD *)*((_QWORD *)&v76 + 1);
    if (*((_QWORD *)&v76 + 1) >= v77[0])
    {
      v21 = (_QWORD *)v76;
      v22 = (uint64_t)(*((_QWORD *)&v76 + 1) - v76) >> 3;
      v23 = v22 + 1;
      if ((unint64_t)(v22 + 1) >> 61)
        std::vector<long long>::__throw_length_error[abi:ne180100]();
      v24 = v77[0] - v76;
      if ((uint64_t)(v77[0] - v76) >> 2 > v23)
        v23 = v24 >> 2;
      if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
        v25 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v25 = v23;
      v84 = v77;
      if (v25)
      {
        v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>((uint64_t)v77, v25);
        v19 = (_QWORD *)*((_QWORD *)&v76 + 1);
        v21 = (_QWORD *)v76;
      }
      else
      {
        v26 = 0;
      }
      v27 = (faiss::WorkerThread **)&v26[8 * v22];
      v28 = (void **)&v26[8 * v25];
      v83 = v28;
      *v27 = v18;
      *((_QWORD *)&v82 + 1) = v27 + 1;
      if (v19 == v21)
      {
        v20 = v27 + 1;
      }
      else
      {
        do
        {
          v29 = (faiss::WorkerThread *)*--v19;
          *v19 = 0;
          *--v27 = v29;
        }
        while (v19 != v21);
        v20 = (_QWORD *)*((_QWORD *)&v82 + 1);
        v28 = v83;
      }
      v30 = v76;
      *(_QWORD *)&v76 = v27;
      *((_QWORD *)&v76 + 1) = v20;
      v82 = v30;
      v31 = (void **)v77[0];
      v77[0] = v28;
      v83 = v31;
      v81 = (void **)v30;
      std::__split_buffer<std::unique_ptr<faiss::WorkerThread>>::~__split_buffer((uint64_t)&v81);
    }
    else
    {
      **((_QWORD **)&v76 + 1) = v18;
      v20 = v19 + 1;
    }
    *((_QWORD *)&v76 + 1) = v20;
    v32 = *(v20 - 1);
    *(_OWORD *)&v86[4] = *(_OWORD *)v78;
    *(_OWORD *)&v86[20] = *(_OWORD *)&v78[16];
    *(_OWORD *)&v86[36] = v79;
    *(_OWORD *)&v86[52] = v80;
    v88 = 0;
    v33 = (char *)operator new(0x50uLL);
    *(_QWORD *)v33 = &off_1E9807000;
    *((_DWORD *)v33 + 2) = v16;
    *(_OWORD *)(v33 + 28) = *(_OWORD *)&v86[16];
    *(_OWORD *)(v33 + 44) = *(_OWORD *)&v86[32];
    *(_OWORD *)(v33 + 60) = *(_OWORD *)&v86[48];
    *((_DWORD *)v33 + 19) = *(_DWORD *)&v86[64];
    *(_OWORD *)(v33 + 12) = *(_OWORD *)v86;
    v88 = v33;
    faiss::WorkerThread::add(v32, (uint64_t)v87, (uint64_t *)&v85);
    v34 = v74;
    if ((unint64_t)v74 >= v75)
    {
      v35 = v74 - v73;
      v36 = v35 + 1;
      if ((unint64_t)(v35 + 1) >> 61)
        std::vector<long long>::__throw_length_error[abi:ne180100]();
      v37 = v75 - (_QWORD)v73;
      if ((uint64_t)(v75 - (_QWORD)v73) >> 2 > v36)
        v36 = v37 >> 2;
      if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF8)
        v38 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v38 = v36;
      v84 = &v75;
      if (v38)
        v39 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>((uint64_t)&v75, v38);
      else
        v39 = 0;
      v40 = &v39[v35];
      v81 = v39;
      *(_QWORD *)&v82 = v40;
      v83 = &v39[v38];
      *v40 = v85;
      v85 = 0;
      *((_QWORD *)&v82 + 1) = v40 + 1;
      std::vector<std::future<BOOL>>::__swap_out_circular_buffer((uint64_t *)&v73, &v81);
      v41 = v74;
      std::__split_buffer<std::future<BOOL>>::~__split_buffer((unint64_t *)&v81);
      v42 = (uint64_t)v85;
      v74 = v41;
      if (v85)
      {
        v43 = v85 + 1;
        do
          v44 = __ldaxr(v43);
        while (__stlxr(v44 - 1, v43));
        if (!v44)
          (*(void (**)(uint64_t))(*(_QWORD *)v42 + 16))(v42);
      }
    }
    else
    {
      *v74 = (std::__assoc_sub_state *)v85;
      v85 = 0;
      v74 = v34 + 1;
    }
    v45 = v88;
    if (v88 == v87)
    {
      v45 = v87;
      v46 = 4;
    }
    else
    {
      if (!v88)
        goto LABEL_45;
      v46 = 5;
    }
    (*(void (**)(void))(*v45 + 8 * v46))();
LABEL_45:
    ++v16;
  }
  while (v16 != v17);
  v48 = v73;
  v47 = v74;
  v15 = v71;
  v13 = v72;
  a5 = v69;
  a6 = v70;
  for (i = v11 >> 3; v48 != v47; ++v48)
    std::future<BOOL>::get(v48);
LABEL_48:
  v81 = (void **)&v73;
  std::vector<std::future<BOOL>>::__destroy_vector::operator()[abi:ne180100](&v81);
  v81 = (void **)&v76;
  std::vector<std::unique_ptr<faiss::WorkerThread>>::__destroy_vector::operator()[abi:ne180100](&v81);
  if (v11 >= 1)
  {
    v49 = 0;
    v50 = *((_QWORD *)this + 5);
    if (i <= 1)
      v51 = 1;
    else
      v51 = i;
    v52 = 1;
    v53 = (_QWORD *)v15;
    v54 = (float *)v13;
    do
    {
      if (v49 && a2 >= 1)
      {
        v55 = a6;
        v56 = v53;
        v57 = v54;
        v58 = a5;
        v59 = a2;
        do
        {
          if (*v55 < 0 || (*v56 & 0x8000000000000000) != 0)
          {
            *v55 = -1;
            *v58 = NAN;
          }
          else
          {
            *v55 += *v56 * v52;
            *v58 = *v57 + *v58;
          }
          ++v58;
          ++v57;
          ++v56;
          ++v55;
          --v59;
        }
        while (v59);
      }
      v52 *= *(_QWORD *)(*(_QWORD *)(v50 + 8 * v49++) + 16);
      v54 += a2;
      v53 += a2;
    }
    while (v49 != v51);
  }
LABEL_65:
  MEMORY[0x1D826288C](v15, 0x1000C8000313F17);
  return MEMORY[0x1D826288C](v13, 0x1000C8052888210);
}

void sub_1D4914660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  void *v36;

  __cxa_free_exception(v36);
  if (a30 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void faiss::IndexSplitVectors::search(long long,float const*,long long,float *,long long *)const::$_0::operator()(_QWORD *a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  size_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;

  v4 = a1[7];
  if (a2)
  {
    v5 = a1[2] * a2 * *a1;
    v25 = a1[5] + 4 * v5;
    v6 = a1[6] + 8 * v5;
  }
  else
  {
    v25 = a1[3];
    v6 = a1[4];
  }
  v24 = v6;
  if (*(_BYTE *)(v4 + 24))
    printf("begin query shard %d on %lld points\n", a2, *a1);
  v7 = *(uint64_t **)(v4 + 40);
  v23 = (int *)v7[a2];
  v8 = v23[2];
  if (a2 < 1)
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    v10 = a2;
    do
    {
      v11 = *v7++;
      v9 += *(int *)(v11 + 8);
      --v10;
    }
    while (v10);
  }
  v22 = v4;
  v12 = *(int *)(v4 + 8);
  v13 = operator new[]();
  v14 = v13;
  v15 = *a1;
  if ((uint64_t)*a1 >= 1)
  {
    v16 = (char *)(a1[1] + 4 * v9);
    v17 = 8 * v8;
    v18 = 4 * v12;
    v19 = 4 * v8;
    v20 = (char *)v13;
    v21 = *a1;
    do
    {
      memcpy(v20, v16, v17);
      v16 += v18;
      v20 += v19;
      --v21;
    }
    while (v21);
  }
  (*(void (**)(int *, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)v23 + 40))(v23, v15, v14, a1[2], v25, v24);
  if (*(_BYTE *)(v22 + 24))
    printf("end query shard %d\n", a2);
  JUMPOUT(0x1D826288CLL);
}

void sub_1D4914958(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D826288C](v1, 0x1000C8052888210);
  _Unwind_Resume(a1);
}

void faiss::IndexSplitVectors::train(faiss::IndexSplitVectors *this, uint64_t a2, const float *a3)
{
  void *exception;
  _QWORD v4[3];

  exception = __cxa_allocate_exception(0x20uLL);
  std::string::basic_string[abi:ne180100]<0>(v4, "not implemented");
  faiss::FaissException::FaissException(exception, v4, "virtual void faiss::IndexSplitVectors::train(idx_t, const float *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/MetaIndexes.cpp", 316);
}

void sub_1D49149F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

void faiss::IndexSplitVectors::reset(faiss::IndexSplitVectors *this)
{
  void *exception;
  _QWORD v2[3];

  exception = __cxa_allocate_exception(0x20uLL);
  std::string::basic_string[abi:ne180100]<0>(v2, "not implemented");
  faiss::FaissException::FaissException(exception, v2, "virtual void faiss::IndexSplitVectors::reset()", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/MetaIndexes.cpp", 320);
}

void sub_1D4914A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

void faiss::IndexSplitVectors::~IndexSplitVectors(faiss::IndexSplitVectors *this)
{
  _QWORD *v2;
  _BYTE *v3;
  unint64_t v4;
  uint64_t v5;

  *(_QWORD *)this = &off_1E9806188;
  if (*((_BYTE *)this + 36))
  {
    v2 = (_QWORD *)*((_QWORD *)this + 5);
    v3 = (_BYTE *)*((_QWORD *)this + 6);
    if (v3 == (_BYTE *)v2)
    {
      v2 = (_QWORD *)*((_QWORD *)this + 6);
      if (!v3)
        goto LABEL_11;
      goto LABEL_10;
    }
    v4 = 0;
    do
    {
      v5 = v2[v4];
      if (v5)
      {
        (*(void (**)(_QWORD))(*(_QWORD *)v5 + 8))(v2[v4]);
        v2 = (_QWORD *)*((_QWORD *)this + 5);
        v3 = (_BYTE *)*((_QWORD *)this + 6);
      }
      ++v4;
    }
    while (v4 < (v3 - (_BYTE *)v2) >> 3);
  }
  else
  {
    v2 = (_QWORD *)*((_QWORD *)this + 5);
  }
  if (v2)
  {
LABEL_10:
    *((_QWORD *)this + 6) = v2;
    operator delete(v2);
  }
LABEL_11:
  faiss::Index::~Index(this);
}

{
  faiss::IndexSplitVectors::~IndexSplitVectors(this);
  JUMPOUT(0x1D82628A4);
}

uint64_t faiss::`anonymous namespace'::IDTranslatedSelector::is_member(faiss::_anonymous_namespace_::IDTranslatedSelector *this, uint64_t a2)
{
  return (***((uint64_t (****)(_QWORD, _QWORD))this + 2))(*((_QWORD *)this + 2), *(_QWORD *)(**((_QWORD **)this + 1) + 8 * a2));
}

void faiss::`anonymous namespace'::IDTranslatedSelector::~IDTranslatedSelector(faiss::_anonymous_namespace_::IDTranslatedSelector *this)
{
  JUMPOUT(0x1D82628A4);
}

_QWORD *std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::clear(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  if (result[3])
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      do
      {
        v2 = (_QWORD *)*result;
        operator delete(result);
        result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    v3 = v1[1];
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        *(_QWORD *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E97FA3C8, MEMORY[0x1E0DE42E0]);
}

void sub_1D4914C5C(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5028] + 16);
  return result;
}

void std::vector<std::unique_ptr<faiss::WorkerThread>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  faiss::WorkerThread **v2;
  faiss::WorkerThread **v4;
  void *v5;

  v1 = *a1;
  v2 = (faiss::WorkerThread **)**a1;
  if (v2)
  {
    v4 = (faiss::WorkerThread **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
        std::unique_ptr<faiss::WorkerThread>::reset[abi:ne180100](--v4, 0);
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

faiss::WorkerThread *std::unique_ptr<faiss::WorkerThread>::reset[abi:ne180100](faiss::WorkerThread **a1, faiss::WorkerThread *a2)
{
  faiss::WorkerThread *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    faiss::WorkerThread::~WorkerThread(result);
    JUMPOUT(0x1D82628A4);
  }
  return result;
}

void std::vector<std::future<BOOL>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::future<BOOL>>::__clear[abi:ne180100]((unint64_t *)v2);
    operator delete(**a1);
  }
}

unint64_t *std::vector<std::future<BOOL>>::__clear[abi:ne180100](unint64_t *result)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t i;
  unint64_t *v4;
  unint64_t *v5;
  unint64_t v6;

  v1 = result;
  v2 = *result;
  for (i = result[1]; i != v2; i -= 8)
  {
    v4 = *(unint64_t **)(i - 8);
    result = v4;
    if (v4)
    {
      v5 = result + 1;
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
        result = (unint64_t *)(*(uint64_t (**)(unint64_t *))(*result + 16))(result);
    }
  }
  v1[1] = v2;
  return result;
}

uint64_t std::__split_buffer<std::unique_ptr<faiss::WorkerThread>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    std::unique_ptr<faiss::WorkerThread>::reset[abi:ne180100]((faiss::WorkerThread **)(i - 8), 0);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__function::__func<faiss::IndexSplitVectors::search(long long,float const*,long long,float *,long long *)::$_1,std::allocator<faiss::IndexSplitVectors::search(long long,float const*,long long,float *,long long *)::$_1>,void ()(void)>::~__func()
{
  JUMPOUT(0x1D82628A4);
}

__n128 std::__function::__func<faiss::IndexSplitVectors::search(long long,float const*,long long,float *,long long *)::$_1,std::allocator<faiss::IndexSplitVectors::search(long long,float const*,long long,float *,long long *)::$_1>,void ()(void)>::__clone(uint64_t a1)
{
  char *v2;
  __n128 result;

  v2 = (char *)operator new(0x50uLL);
  *(_QWORD *)v2 = &off_1E9807000;
  *(_OWORD *)(v2 + 24) = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(v2 + 40) = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(v2 + 56) = *(_OWORD *)(a1 + 56);
  *((_QWORD *)v2 + 9) = *(_QWORD *)(a1 + 72);
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<faiss::IndexSplitVectors::search(long long,float const*,long long,float *,long long *)::$_1,std::allocator<faiss::IndexSplitVectors::search(long long,float const*,long long,float *,long long *)::$_1>,void ()(void)>::__clone(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_QWORD *)a2 = &off_1E9807000;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(a1 + 8);
  result = *(__n128 *)(a1 + 24);
  v3 = *(_OWORD *)(a1 + 40);
  v4 = *(_OWORD *)(a1 + 56);
  *(_QWORD *)(a2 + 72) = *(_QWORD *)(a1 + 72);
  *(_OWORD *)(a2 + 56) = v4;
  *(_OWORD *)(a2 + 40) = v3;
  *(__n128 *)(a2 + 24) = result;
  return result;
}

void std::__function::__func<faiss::IndexSplitVectors::search(long long,float const*,long long,float *,long long *)::$_1,std::allocator<faiss::IndexSplitVectors::search(long long,float const*,long long,float *,long long *)::$_1>,void ()(void)>::operator()(uint64_t a1)
{
  faiss::IndexSplitVectors::search(long long,float const*,long long,float *,long long *)const::$_0::operator()((_QWORD *)(a1 + 16), *(_DWORD *)(a1 + 8));
}

uint64_t std::__function::__func<faiss::IndexSplitVectors::search(long long,float const*,long long,float *,long long *)::$_1,std::allocator<faiss::IndexSplitVectors::search(long long,float const*,long long,float *,long long *)::$_1>,void ()(void)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<faiss::IndexSplitVectors::search(long long,float const*,long long,float *,long long *)::$_1,std::allocator<faiss::IndexSplitVectors::search(long long,float const*,long long,float *,long long *)::$_1>,void ()(void)>::target_type()
{
}

uint64_t std::vector<std::future<BOOL>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::future<BOOL>>,std::reverse_iterator<std::future<BOOL>*>,std::reverse_iterator<std::future<BOOL>*>,std::reverse_iterator<std::future<BOOL>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
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

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::future<BOOL>>,std::reverse_iterator<std::future<BOOL>*>,std::reverse_iterator<std::future<BOOL>*>,std::reverse_iterator<std::future<BOOL>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
      v9 = *--a3;
      *(_QWORD *)(v8 - 8) = v9;
      v8 -= 8;
      *a3 = 0;
      v7 -= 8;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v8;
    v10 = v15;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::future<BOOL>>,std::reverse_iterator<std::future<BOOL>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::future<BOOL>>,std::reverse_iterator<std::future<BOOL>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::future<BOOL>>,std::reverse_iterator<std::future<BOOL>*>>::operator()[abi:ne180100]((unint64_t *)a1);
  return a1;
}

unint64_t *std::_AllocatorDestroyRangeReverse<std::allocator<std::future<BOOL>>,std::reverse_iterator<std::future<BOOL>*>>::operator()[abi:ne180100](unint64_t *result)
{
  unint64_t **v1;
  unint64_t **v2;
  unint64_t *v3;
  unint64_t v4;

  v1 = *(unint64_t ***)(result[2] + 8);
  v2 = *(unint64_t ***)(result[1] + 8);
  while (v1 != v2)
  {
    result = *v1;
    if (*v1)
    {
      v3 = result + 1;
      do
        v4 = __ldaxr(v3);
      while (__stlxr(v4 - 1, v3));
      if (!v4)
        result = (unint64_t *)(*(uint64_t (**)(unint64_t *))(*result + 16))(result);
    }
    ++v1;
  }
  return result;
}

unint64_t *std::__split_buffer<std::future<BOOL>>::~__split_buffer(unint64_t *a1)
{
  std::__split_buffer<std::future<BOOL>>::clear[abi:ne180100](a1);
  if (*a1)
    operator delete((void *)*a1);
  return a1;
}

unint64_t *std::__split_buffer<std::future<BOOL>>::clear[abi:ne180100](unint64_t *result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t *v3;
  unint64_t *v4;
  unint64_t v5;

  v2 = result[1];
  v1 = result[2];
  if (v1 != v2)
  {
    v3 = result;
    do
    {
      result = *(unint64_t **)(v1 - 8);
      v3[2] = v1 - 8;
      if (result)
      {
        v4 = result + 1;
        do
          v5 = __ldaxr(v4);
        while (__stlxr(v5 - 1, v4));
        if (!v5)
          result = (unint64_t *)(*(uint64_t (**)(unint64_t *))(*result + 16))(result);
      }
      v1 = v3[2];
    }
    while (v1 != v2);
  }
  return result;
}

void faiss::IndexIDMapTemplate<faiss::Index>::remove_ids()
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "Faiss assertion '%s' failed in %s at %s:%d\n", "j == index->ntotal", "virtual size_t faiss::IndexIDMapTemplate<faiss::Index>::remove_ids(const IDSelector &) [IndexT = faiss::Index]", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/MetaIndexes.cpp", 135);
  abort();
}

void faiss::IndexIDMapTemplate<faiss::IndexBinary>::remove_ids()
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "Faiss assertion '%s' failed in %s at %s:%d\n", "j == index->ntotal", "virtual size_t faiss::IndexIDMapTemplate<faiss::IndexBinary>::remove_ids(const IDSelector &) [IndexT = faiss::IndexBinary]", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/MetaIndexes.cpp", 135);
  abort();
}

double faiss::DirectMap::DirectMap(faiss::DirectMap *this)
{
  double result;

  *(_DWORD *)this = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_QWORD *)this + 7) = 0;
  *((_DWORD *)this + 16) = 1065353216;
  return result;
}

{
  double result;

  *(_DWORD *)this = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_QWORD *)this + 7) = 0;
  *((_DWORD *)this + 16) = 1065353216;
  return result;
}

void faiss::DirectMap::set_type(uint64_t a1, unsigned int a2, _QWORD *a3, unint64_t a4)
{
  unsigned int v4;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  unint64_t v15;
  uint64_t j;
  int v17;
  std::string *v18;
  size_t v19;
  void *v20;
  int v21;
  std::string *v22;
  size_t size;
  void *exception;
  unsigned int v25;
  _QWORD *v26;
  unint64_t v27;
  std::string v28;

  if (a2 >= 3)
  {
    memset(&v28, 0, sizeof(v28));
    v21 = snprintf(0, 0, "Error: '%s' failed", "new_type == NoMap || new_type == Array || new_type == Hashtable");
    std::string::resize(&v28, v21 + 1, 0);
    if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v22 = &v28;
    else
      v22 = (std::string *)v28.__r_.__value_.__r.__words[0];
    if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v28.__r_.__value_.__r.__words[2]);
    else
      size = v28.__r_.__value_.__l.__size_;
    snprintf((char *)v22, size, "Error: '%s' failed", "new_type == NoMap || new_type == Array || new_type == Hashtable");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v28, "void faiss::DirectMap::set_type(Type, const InvertedLists *, size_t)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/invlists/DirectMap.cpp", 27);
  }
  v4 = a2;
  if (*(_DWORD *)a1 != a2)
  {
    v8 = (_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a1 + 8);
    v9 = a1 + 32;
    std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::clear((_QWORD *)(a1 + 32));
    *(_DWORD *)a1 = v4;
    if (v4)
    {
      if (v4 == 1)
      {
        v28.__r_.__value_.__r.__words[0] = -1;
        std::vector<long long>::resize(a1 + 8, a4, &v28);
      }
      else
      {
        std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::__rehash<true>(a1 + 32, vcvtps_u32_f32((float)a4 / *(float *)(a1 + 64)));
      }
      if (a3[1])
      {
        v10 = 0;
        v25 = v4;
        v26 = a3;
        do
        {
          v11 = (*(uint64_t (**)(_QWORD *, unint64_t))*a3)(a3, v10);
          v12 = (*(uint64_t (**)(_QWORD *, unint64_t))(*a3 + 16))(a3, v10);
          v13 = v12;
          if (v4 == 1)
          {
            if (v11)
            {
              for (i = 0; i != v11; ++i)
              {
                v15 = *(_QWORD *)(v12 + 8 * i);
                if ((v15 & 0x8000000000000000) != 0 || v15 >= a4)
                {
                  memset(&v28, 0, sizeof(v28));
                  v17 = snprintf(0, 0, "Error: '%s' failed: direct map supported only for seuquential ids", "0 <= idlist[ofs] && idlist[ofs] < ntotal");
                  std::string::resize(&v28, v17 + 1, 0);
                  if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                    v18 = &v28;
                  else
                    v18 = (std::string *)v28.__r_.__value_.__r.__words[0];
                  if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                    v19 = HIBYTE(v28.__r_.__value_.__r.__words[2]);
                  else
                    v19 = v28.__r_.__value_.__l.__size_;
                  snprintf((char *)v18, v19, "Error: '%s' failed: direct map supported only for seuquential ids", "0 <= idlist[ofs] && idlist[ofs] < ntotal");
                  v20 = __cxa_allocate_exception(0x20uLL);
                  faiss::FaissException::FaissException(v20, &v28, "void faiss::DirectMap::set_type(Type, const InvertedLists *, size_t)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/invlists/DirectMap.cpp", 54);
                }
                *(_QWORD *)(*v8 + 8 * v15) = i | (v10 << 32);
              }
            }
          }
          else if (v11)
          {
            for (j = 0; j != v11; ++j)
            {
              v27 = *(_QWORD *)(v13 + 8 * j);
              v28.__r_.__value_.__r.__words[0] = (std::string::size_type)&v27;
              std::__hash_table<std::__hash_value_type<unsigned long long,long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v9, &v27, (uint64_t)&std::piecewise_construct, &v28)[3] = j | (v10 << 32);
            }
          }
          a3 = v26;
          (*(void (**)(_QWORD *, unint64_t, uint64_t))(*v26 + 32))(v26, v10++, v13);
          v4 = v25;
        }
        while (v10 < v26[1]);
      }
    }
  }
}

void sub_1D4915568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  void *v18;

  __cxa_free_exception(v18);
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void std::vector<long long>::resize(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;

  v3 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v3)
  {
    if (a2 < v3)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    std::vector<long long>::__append((void **)a1, a2 - v3, a3);
  }
}

_QWORD *faiss::DirectMap::clear(faiss::DirectMap *this)
{
  *((_QWORD *)this + 2) = *((_QWORD *)this + 1);
  return std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::clear((_QWORD *)this + 4);
}

uint64_t faiss::DirectMap::get(faiss::DirectMap *this, unint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  int v4;
  std::string *v5;
  size_t v6;
  void *v7;
  _QWORD *v8;
  int v9;
  std::string *v10;
  size_t v11;
  void *v12;
  void *v13;
  int v14;
  std::string *v15;
  size_t size;
  void *exception;
  std::string v18;
  unint64_t v19;

  v19 = a2;
  if (*(_DWORD *)this == 2)
  {
    v8 = std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::find<long long>((_QWORD *)this + 4, &v19);
    if (!v8)
    {
      memset(&v18, 0, sizeof(v18));
      v14 = snprintf(0, 0, "Error: '%s' failed: key not found", "res != hashtable.end()");
      std::string::resize(&v18, v14 + 1, 0);
      if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v15 = &v18;
      else
        v15 = (std::string *)v18.__r_.__value_.__r.__words[0];
      if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v18.__r_.__value_.__r.__words[2]);
      else
        size = v18.__r_.__value_.__l.__size_;
      snprintf((char *)v15, size, "Error: '%s' failed: key not found", "res != hashtable.end()");
      exception = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(exception, &v18, "DirectMap::idx_t faiss::DirectMap::get(idx_t) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/invlists/DirectMap.cpp", 78);
    }
    return v8[3];
  }
  else
  {
    if (*(_DWORD *)this != 1)
    {
      v13 = __cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(&v18, "direct map not initialized");
      faiss::FaissException::FaissException(v13, &v18, "DirectMap::idx_t faiss::DirectMap::get(idx_t) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/invlists/DirectMap.cpp", 81);
    }
    if ((a2 & 0x8000000000000000) != 0 || (v2 = *((_QWORD *)this + 1), a2 >= (*((_QWORD *)this + 2) - v2) >> 3))
    {
      memset(&v18, 0, sizeof(v18));
      v9 = snprintf(0, 0, "Error: '%s' failed: invalid key", "key >= 0 && key < array.size()");
      std::string::resize(&v18, v9 + 1, 0);
      if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v10 = &v18;
      else
        v10 = (std::string *)v18.__r_.__value_.__r.__words[0];
      if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v11 = HIBYTE(v18.__r_.__value_.__r.__words[2]);
      else
        v11 = v18.__r_.__value_.__l.__size_;
      snprintf((char *)v10, v11, "Error: '%s' failed: invalid key", "key >= 0 && key < array.size()");
      v12 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v12, &v18, "DirectMap::idx_t faiss::DirectMap::get(idx_t) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/invlists/DirectMap.cpp", 72);
    }
    result = *(_QWORD *)(v2 + 8 * a2);
    if (result < 0)
    {
      memset(&v18, 0, sizeof(v18));
      v4 = snprintf(0, 0, "Error: '%s' failed: -1 entry in direct_map", "lo >= 0");
      std::string::resize(&v18, v4 + 1, 0);
      if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v5 = &v18;
      else
        v5 = (std::string *)v18.__r_.__value_.__r.__words[0];
      if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v6 = HIBYTE(v18.__r_.__value_.__r.__words[2]);
      else
        v6 = v18.__r_.__value_.__l.__size_;
      snprintf((char *)v5, v6, "Error: '%s' failed: -1 entry in direct_map", "lo >= 0");
      v7 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v7, &v18, "DirectMap::idx_t faiss::DirectMap::get(idx_t) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/invlists/DirectMap.cpp", 74);
    }
  }
  return result;
}

void sub_1D49158F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void *v16;

  __cxa_free_exception(v16);
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void faiss::DirectMap::add_single_id(faiss::DirectMap *this, unint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t *v27;

  v26 = a2;
  v4 = *(_DWORD *)this;
  if (*(_DWORD *)this)
  {
    if (v4 == 1)
    {
      v7 = (char *)*((_QWORD *)this + 1);
      v8 = (char *)*((_QWORD *)this + 2);
      if (a2 != (v8 - v7) >> 3)
        faiss::DirectMap::add_single_id();
      if (a3 < 0)
      {
        v12 = *((_QWORD *)this + 3);
        if ((unint64_t)v8 < v12)
        {
          *(_QWORD *)v8 = -1;
          v11 = v8 + 8;
          goto LABEL_12;
        }
        if (!((a2 + 1) >> 61))
        {
          v18 = v12 - (_QWORD)v7;
          v19 = (uint64_t)(v12 - (_QWORD)v7) >> 2;
          if (v19 <= a2 + 1)
            v19 = a2 + 1;
          if (v18 >= 0x7FFFFFFFFFFFFFF8)
            v20 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v20 = v19;
          if (v20)
          {
            v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>((uint64_t)this + 24, v20);
            v7 = (char *)*((_QWORD *)this + 1);
            v8 = (char *)*((_QWORD *)this + 2);
          }
          else
          {
            v21 = 0;
          }
          v22 = &v21[8 * a2];
          v23 = &v21[8 * v20];
          *(_QWORD *)v22 = -1;
          v13 = v22 + 8;
          while (v8 != v7)
          {
            v25 = *((_QWORD *)v8 - 1);
            v8 -= 8;
            *((_QWORD *)v22 - 1) = v25;
            v22 -= 8;
          }
          goto LABEL_37;
        }
      }
      else
      {
        v9 = a4 | (a3 << 32);
        v10 = *((_QWORD *)this + 3);
        if ((unint64_t)v8 < v10)
        {
          *(_QWORD *)v8 = v9;
          v11 = v8 + 8;
LABEL_12:
          v13 = v11;
LABEL_39:
          *((_QWORD *)this + 2) = v13;
          return;
        }
        if (!((a2 + 1) >> 61))
        {
          v14 = v10 - (_QWORD)v7;
          v15 = (uint64_t)(v10 - (_QWORD)v7) >> 2;
          if (v15 <= a2 + 1)
            v15 = a2 + 1;
          if (v14 >= 0x7FFFFFFFFFFFFFF8)
            v16 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v16 = v15;
          if (v16)
          {
            v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>((uint64_t)this + 24, v16);
            v7 = (char *)*((_QWORD *)this + 1);
            v8 = (char *)*((_QWORD *)this + 2);
          }
          else
          {
            v17 = 0;
          }
          v22 = &v17[8 * a2];
          v23 = &v17[8 * v16];
          *(_QWORD *)v22 = v9;
          v13 = v22 + 8;
          while (v8 != v7)
          {
            v24 = *((_QWORD *)v8 - 1);
            v8 -= 8;
            *((_QWORD *)v22 - 1) = v24;
            v22 -= 8;
          }
LABEL_37:
          *((_QWORD *)this + 1) = v22;
          *((_QWORD *)this + 2) = v13;
          *((_QWORD *)this + 3) = v23;
          if (v7)
            operator delete(v7);
          goto LABEL_39;
        }
      }
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    if ((a3 & 0x8000000000000000) == 0 && v4 == 2)
    {
      v27 = &v26;
      std::__hash_table<std::__hash_value_type<unsigned long long,long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)this + 32, &v26, (uint64_t)&std::piecewise_construct, &v27)[3] = a4 | (a3 << 32);
    }
  }
}

_DWORD *faiss::DirectMap::check_can_add(_DWORD *this, const uint64_t *a2)
{
  void *exception;
  _QWORD v3[3];

  if (a2)
  {
    if (*this == 1)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(v3, "cannot have array direct map and add with ids");
      faiss::FaissException::FaissException(exception, v3, "void faiss::DirectMap::check_can_add(const idx_t *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/invlists/DirectMap.cpp", 105);
    }
  }
  return this;
}

void sub_1D4915BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

faiss::DirectMapAdd *faiss::DirectMapAdd::DirectMapAdd(faiss::DirectMapAdd *this, faiss::DirectMap *a2, unint64_t a3, const uint64_t *a4)
{
  int v5;
  uint64_t v6;
  int v8;
  std::string *v9;
  size_t size;
  void *exception;
  std::string v12;

  *(_QWORD *)this = a2;
  v5 = *(_DWORD *)a2;
  *((_DWORD *)this + 2) = *(_DWORD *)a2;
  *((_QWORD *)this + 3) = a3;
  *((_QWORD *)this + 4) = a4;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  if (v5 == 2)
  {
    v12.__r_.__value_.__r.__words[0] = -1;
    std::vector<long long>::resize((uint64_t)this + 40, a3, &v12);
  }
  else if (v5 == 1)
  {
    if (a4)
    {
      memset(&v12, 0, sizeof(v12));
      v8 = snprintf(0, 0, "Error: '%s' failed", "xids == nullptr");
      std::string::resize(&v12, v8 + 1, 0);
      if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v9 = &v12;
      else
        v9 = (std::string *)v12.__r_.__value_.__r.__words[0];
      if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v12.__r_.__value_.__r.__words[2]);
      else
        size = v12.__r_.__value_.__l.__size_;
      snprintf((char *)v9, size, "Error: '%s' failed", "xids == nullptr");
      exception = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(exception, &v12, "faiss::DirectMapAdd::DirectMapAdd(DirectMap &, size_t, const idx_t *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/invlists/DirectMap.cpp", 114);
    }
    v6 = (uint64_t)(*((_QWORD *)a2 + 2) - *((_QWORD *)a2 + 1)) >> 3;
    *((_QWORD *)this + 2) = v6;
    v12.__r_.__value_.__r.__words[0] = -1;
    std::vector<long long>::resize((uint64_t)a2 + 8, a3 + v6, &v12);
  }
  return this;
}

void sub_1D4915D5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;
  void **v16;
  void *v17;
  void *v19;

  __cxa_free_exception(v17);
  if (a15 < 0)
    operator delete(__p);
  v19 = *v16;
  if (*v16)
  {
    *(_QWORD *)(v15 + 48) = v19;
    operator delete(v19);
  }
  _Unwind_Resume(a1);
}

uint64_t faiss::DirectMapAdd::add(uint64_t this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  _QWORD *v5;

  v4 = *(_DWORD *)(this + 8);
  if (v4 == 2)
  {
    v5 = (_QWORD *)(this + 40);
  }
  else
  {
    if (v4 != 1)
      return this;
    v5 = (_QWORD *)(*(_QWORD *)this + 8);
    a2 += *(_QWORD *)(this + 16);
  }
  *(_QWORD *)(*v5 + 8 * a2) = a4 | (a3 << 32);
  return this;
}

void faiss::DirectMapAdd::~DirectMapAdd(faiss::DirectMapAdd *this)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t *v9;

  if (*((_DWORD *)this + 2) == 2 && *((_QWORD *)this + 3))
  {
    v2 = 0;
    do
    {
      v8 = 0;
      v3 = *((_QWORD *)this + 4);
      if (v3)
        v4 = *(_QWORD *)(v3 + 8 * v2);
      else
        v4 = v2 + *((_QWORD *)this + 2);
      v8 = v4;
      v5 = *(_QWORD *)(*((_QWORD *)this + 5) + 8 * v2);
      v6 = *(_QWORD *)this + 32;
      v9 = &v8;
      std::__hash_table<std::__hash_value_type<unsigned long long,long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(v6, &v8, (uint64_t)&std::piecewise_construct, &v9)[3] = v5;
      ++v2;
    }
    while (*((_QWORD *)this + 3) > v2);
  }
  v7 = (void *)*((_QWORD *)this + 5);
  if (v7)
  {
    *((_QWORD *)this + 6) = v7;
    operator delete(v7);
  }
}

uint64_t faiss::DirectMap::remove_ids(_DWORD *a1, unsigned int (***a2)(const void *, _QWORD), _QWORD *a3)
{
  unint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *exception;
  int v32;
  std::string *v33;
  size_t size;
  void *v35;
  _QWORD *v36;
  uint64_t v37;
  unint64_t v38;
  std::string v39;
  void *__p[3];

  v6 = a3[1];
  std::vector<long long>::vector(__p, v6);
  if (*a1 != 2)
  {
    if (*a1)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(&v39, "remove not supported with this direct_map format");
      faiss::FaissException::FaissException(exception, &v39, "size_t faiss::DirectMap::remove_ids(const IDSelector &, InvertedLists *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/invlists/DirectMap.cpp", 209);
    }
    if (v6)
    {
      for (i = 0; i != v6; ++i)
      {
        v8 = (*(uint64_t (**)(_QWORD *, uint64_t))*a3)(a3, i);
        v9 = (*(uint64_t (**)(_QWORD *, uint64_t))(*a3 + 16))(a3, i);
        if (v8 < 1)
        {
          v11 = v8;
        }
        else
        {
          v10 = 0;
          v11 = v8;
          do
          {
            if ((**a2)(a2, *(_QWORD *)(v9 + 8 * v10)))
            {
              v12 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(*a3 + 40))(a3, i, --v11);
              v13 = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(*a3 + 48))(a3, i, v11);
              (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t, uint64_t))(*a3 + 80))(a3, i, v10, v12, v13);
              (*(void (**)(_QWORD *, uint64_t, uint64_t))(*a3 + 24))(a3, i, v13);
            }
            else
            {
              ++v10;
            }
          }
          while (v10 < v11);
        }
        *((_QWORD *)__p[0] + i) = v8 - v11;
        (*(void (**)(_QWORD *, uint64_t, uint64_t))(*a3 + 32))(a3, i, v9);
      }
      v14 = 0;
      for (j = 0; j != v6; ++j)
      {
        v16 = *((_QWORD *)__p[0] + j);
        if (v16 >= 1)
        {
          v17 = (*(uint64_t (**)(_QWORD *, uint64_t))*a3)(a3, j);
          (*(void (**)(_QWORD *, uint64_t, uint64_t))(*a3 + 96))(a3, j, v17 - *((_QWORD *)__p[0] + j));
          v14 += v16;
        }
      }
      goto LABEL_29;
    }
LABEL_28:
    v14 = 0;
    goto LABEL_29;
  }
  if (!v18)
  {
    memset(&v39, 0, sizeof(v39));
    v32 = snprintf(0, 0, "Error: '%s' failed: remove with hashtable works only with IDSelectorArray", "sela");
    std::string::resize(&v39, v32 + 1, 0);
    if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v33 = &v39;
    else
      v33 = (std::string *)v39.__r_.__value_.__r.__words[0];
    if ((v39.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v39.__r_.__value_.__r.__words[2]);
    else
      size = v39.__r_.__value_.__l.__size_;
    snprintf((char *)v33, size, "Error: '%s' failed: remove with hashtable works only with IDSelectorArray", "sela");
    v35 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v35, &v39, "size_t faiss::DirectMap::remove_ids(const IDSelector &, InvertedLists *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/invlists/DirectMap.cpp", 183);
  }
  v19 = v18;
  if (!v18[1])
    goto LABEL_28;
  v14 = 0;
  v20 = 0;
  v21 = a1 + 8;
  v36 = v18;
  do
  {
    v38 = 0;
    v38 = *(_QWORD *)(v19[2] + 8 * v20);
    v22 = std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::find<long long>(v21, &v38);
    v23 = v22;
    if (v22)
    {
      v24 = v22[3];
      v25 = (*(uint64_t (**)(_QWORD *, unint64_t))*a3)(a3, HIDWORD(v24));
      std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::erase(v21, v23);
      v26 = v25 - 1;
      if (v24 < (unint64_t)(v25 - 1))
      {
        v27 = v14;
        v37 = 0;
        v28 = (*(uint64_t (**)(_QWORD *, unint64_t, uint64_t))(*a3 + 40))(a3, HIDWORD(v24), v25 - 1);
        v37 = v28;
        v29 = (*(uint64_t (**)(_QWORD *, unint64_t, uint64_t))(*a3 + 48))(a3, HIDWORD(v24), v25 - 1);
        (*(void (**)(_QWORD *, unint64_t, _QWORD, uint64_t, uint64_t))(*a3 + 80))(a3, HIDWORD(v24), v24, v28, v29);
        (*(void (**)(_QWORD *, unint64_t, uint64_t))(*a3 + 24))(a3, HIDWORD(v24), v29);
        v39.__r_.__value_.__r.__words[0] = (std::string::size_type)&v37;
        std::__hash_table<std::__hash_value_type<unsigned long long,long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)v21, (unint64_t *)&v37, (uint64_t)&std::piecewise_construct, &v39)[3] = v24;
        v14 = v27;
        v19 = v36;
      }
      (*(void (**)(_QWORD *, unint64_t, uint64_t))(*a3 + 96))(a3, HIDWORD(v24), v26);
      ++v14;
    }
    ++v20;
  }
  while (v20 < v19[1]);
LABEL_29:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v14;
}

void sub_1D4916338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21)
{
  void *v21;

  __cxa_free_exception(v21);
  if (a19 < 0)
    operator delete(__p);
  if (a20)
    operator delete(a20);
  _Unwind_Resume(a1);
}

_DWORD *faiss::DirectMap::update_codes(_DWORD *this, faiss::InvertedLists *a2, int a3, unint64_t *a4, uint64_t *a5, const unsigned __int8 *a6)
{
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  std::string *v23;
  size_t v24;
  void *v25;
  int v26;
  std::string *v27;
  size_t size;
  void *exception;
  uint64_t v30;
  _DWORD *v31;
  std::string v32;

  v31 = this;
  if (*this != 1)
  {
    memset(&v32, 0, sizeof(v32));
    v26 = snprintf(0, 0, "Error: '%s' failed", "type == Array");
    std::string::resize(&v32, v26 + 1, 0);
    if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v27 = &v32;
    else
      v27 = (std::string *)v32.__r_.__value_.__r.__words[0];
    if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v32.__r_.__value_.__r.__words[2]);
    else
      size = v32.__r_.__value_.__l.__size_;
    snprintf((char *)v27, size, "Error: '%s' failed", "type == Array");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v32, "void faiss::DirectMap::update_codes(InvertedLists *, int, const idx_t *, const idx_t *, const uint8_t *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/invlists/DirectMap.cpp", 220);
  }
  if (a3)
  {
    v30 = *((_QWORD *)a2 + 2);
    v10 = a3;
    do
    {
      v12 = *a4++;
      v11 = v12;
      if ((v12 & 0x8000000000000000) != 0 || (v13 = *((_QWORD *)v31 + 1), v11 >= (*((_QWORD *)v31 + 2) - v13) >> 3))
      {
        memset(&v32, 0, sizeof(v32));
        v22 = snprintf(0, 0, "Error: '%s' failed: id to update out of range", "0 <= id && id < array.size()");
        std::string::resize(&v32, v22 + 1, 0);
        if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v23 = &v32;
        else
          v23 = (std::string *)v32.__r_.__value_.__r.__words[0];
        if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v24 = HIBYTE(v32.__r_.__value_.__r.__words[2]);
        else
          v24 = v32.__r_.__value_.__l.__size_;
        snprintf((char *)v23, v24, "Error: '%s' failed: id to update out of range", "0 <= id && id < array.size()");
        v25 = __cxa_allocate_exception(0x20uLL);
        faiss::FaissException::FaissException(v25, &v32, "void faiss::DirectMap::update_codes(InvertedLists *, int, const idx_t *, const idx_t *, const uint8_t *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/invlists/DirectMap.cpp", 227);
      }
      v14 = *(_QWORD *)(v13 + 8 * v11);
      v15 = v14;
      v16 = HIDWORD(v14);
      v17 = (**(uint64_t (***)(faiss::InvertedLists *, unint64_t))a2)(a2, HIDWORD(v14)) - 1;
      if (v14 != v17)
      {
        v18 = (*(uint64_t (**)(faiss::InvertedLists *, unint64_t, uint64_t))(*(_QWORD *)a2 + 40))(a2, HIDWORD(v14), v17);
        *(_QWORD *)(*((_QWORD *)v31 + 1) + 8 * v18) = v14;
        v19 = v18;
        v20 = (*(uint64_t (**)(faiss::InvertedLists *, unint64_t, uint64_t))(*(_QWORD *)a2 + 48))(a2, v16, v17);
        (*(void (**)(faiss::InvertedLists *, unint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)a2 + 80))(a2, v16, v15, v19, v20);
      }
      (*(void (**)(faiss::InvertedLists *, unint64_t, uint64_t))(*(_QWORD *)a2 + 96))(a2, v16, v17);
      v21 = *a5++;
      *(_QWORD *)(*((_QWORD *)v31 + 1) + 8 * v11) = (**(uint64_t (***)(faiss::InvertedLists *, uint64_t))a2)(a2, v21) | (v21 << 32);
      this = (_DWORD *)(*(uint64_t (**)(faiss::InvertedLists *, uint64_t, unint64_t, const unsigned __int8 *))(*(_QWORD *)a2 + 64))(a2, v21, v11, a6);
      a6 += v30;
      --v10;
    }
    while (v10);
  }
  return this;
}

void sub_1D4916720(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;

  __cxa_free_exception(v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void std::vector<long long>::__append(void **a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *i;
  uint64_t v25;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_QWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 3)
  {
    if (a2)
    {
      v16 = 8 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 8;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = (char *)v9 - (_BYTE *)*a1;
    v11 = a2 + (v10 >> 3);
    if (v11 >> 61)
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    v12 = v10 >> 3;
    v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 2 > v11)
      v11 = v13 >> 2;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<long long>>(v6, v14);
    else
      v15 = 0;
    v18 = &v15[8 * v12];
    v19 = &v18[8 * a2];
    v20 = 8 * a2;
    v21 = v18;
    do
    {
      *(_QWORD *)v21 = *a3;
      v21 += 8;
      v20 -= 8;
    }
    while (v20);
    v22 = &v15[8 * v14];
    v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 8)
    {
      v25 = *((_QWORD *)i - 1);
      *((_QWORD *)v18 - 1) = v25;
      v18 -= 8;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
      operator delete(v23);
  }
}

_QWORD *std::__hash_table<std::__hash_value_type<long long,long long>,std::__unordered_map_hasher<long long,std::__hash_value_type<long long,long long>,std::hash<long long>,std::equal_to<long long>,true>,std::__unordered_map_equal<long long,std::__hash_value_type<long long,long long>,std::equal_to<long long>,std::hash<long long>,true>,std::allocator<std::__hash_value_type<long long,long long>>>::find<long long>(_QWORD *a1, unint64_t *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *result;
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
    if (v3 >= *(_QWORD *)&v2)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(_QWORD **)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  result = (_QWORD *)*v6;
  if (*v6)
  {
    do
    {
      v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3)
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
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

void faiss::DirectMap::add_single_id()
{
  __assert_rtn("add_single_id", "DirectMap.cpp", 90, "id == array.size()");
}

faiss::Level1Quantizer *faiss::Level1Quantizer::Level1Quantizer(faiss::Level1Quantizer *this, faiss::Index *a2, uint64_t a3)
{
  *(_QWORD *)this = a2;
  *((_QWORD *)this + 1) = a3;
  *((_WORD *)this + 8) = 0;
  faiss::ClusteringParameters::ClusteringParameters((faiss::Level1Quantizer *)((char *)this + 24));
  *((_QWORD *)this + 8) = 0;
  *((_DWORD *)this + 6) = 10;
  return this;
}

{
  *(_QWORD *)this = a2;
  *((_QWORD *)this + 1) = a3;
  *((_WORD *)this + 8) = 0;
  faiss::ClusteringParameters::ClusteringParameters((faiss::Level1Quantizer *)((char *)this + 24));
  *((_QWORD *)this + 8) = 0;
  *((_DWORD *)this + 6) = 10;
  return this;
}

faiss::Level1Quantizer *faiss::Level1Quantizer::Level1Quantizer(faiss::Level1Quantizer *this)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_WORD *)this + 8) = 0;
  faiss::ClusteringParameters::ClusteringParameters((faiss::Level1Quantizer *)((char *)this + 24));
  *((_QWORD *)this + 8) = 0;
  return this;
}

{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_WORD *)this + 8) = 0;
  faiss::ClusteringParameters::ClusteringParameters((faiss::Level1Quantizer *)((char *)this + 24));
  *((_QWORD *)this + 8) = 0;
  return this;
}

void faiss::Level1Quantizer::~Level1Quantizer(faiss::Level1Quantizer *this)
{
  uint64_t v2;

  if (*((_BYTE *)this + 17))
  {
    v2 = *(_QWORD *)this;
    if (*(_QWORD *)this)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  }
}

{
  uint64_t v2;

  if (*((_BYTE *)this + 17))
  {
    v2 = *(_QWORD *)this;
    if (*(_QWORD *)this)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  }
}

void faiss::Level1Quantizer::train_q1(_QWORD *a1, unint64_t a2, const float *a3, int a4, int a5)
{
  faiss::Index *v10;
  uint64_t v11;
  int v12;
  faiss::Index *v13;
  int v14;
  std::string *v15;
  size_t v16;
  void *v17;
  const char *v18;
  faiss::Index *v19;
  double v20;
  faiss::Index *v21;
  int v22;
  std::string *v23;
  size_t size;
  void *exception;
  _QWORD v26[5];
  void *__p;
  void *v28;
  std::string v29;
  uint64_t v30;

  v10 = (faiss::Index *)*a1;
  v11 = *((int *)v10 + 2);
  if (*((_BYTE *)v10 + 25) && *((_QWORD *)v10 + 2) == a1[1])
  {
    if (a4)
      puts("IVF quantizer does not need training.");
    return;
  }
  v12 = *((unsigned __int8 *)a1 + 16);
  if (!*((_BYTE *)a1 + 16))
  {
    if (a4)
      printf("Training level-1 quantizer on %zd vectors in %zdD\n", a2, v11);
    v20 = faiss::Clustering::Clustering((faiss::Clustering *)&v29, v11, *((_DWORD *)a1 + 2), (const faiss::ClusteringParameters *)(a1 + 3));
    (*(void (**)(_QWORD, double))(*(_QWORD *)*a1 + 64))(*a1, v20);
    v21 = (faiss::Index *)a1[8];
    if (v21)
    {
      faiss::Clustering::train((faiss::Clustering *)&v29, a2, a3, v21, 0);
      (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)*a1 + 24))(*a1, a1[1], v30);
    }
    else
    {
      faiss::Clustering::train((faiss::Clustering *)&v29, a2, a3, (faiss::Index *)*a1, 0);
    }
    *(_BYTE *)(*a1 + 25) = 1;
    goto LABEL_40;
  }
  if (v12 == 2)
  {
    if (a4)
    {
      if (a1[8])
        v18 = "(user provided index)";
      else
        v18 = "";
      printf("Training L2 quantizer on %zd vectors in %zdD%s\n", a2, *((int *)v10 + 2), v18);
    }
    if (a5 != 1 && (a5 || !*((_BYTE *)a1 + 33)))
    {
      memset(&v29, 0, sizeof(v29));
      v22 = snprintf(0, 0, "Error: '%s' failed", "metric_type == METRIC_L2 || (metric_type == METRIC_INNER_PRODUCT && cp.spherical)");
      std::string::resize(&v29, v22 + 1, 0);
      if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v23 = &v29;
      else
        v23 = (std::string *)v29.__r_.__value_.__r.__words[0];
      if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v29.__r_.__value_.__r.__words[2]);
      else
        size = v29.__r_.__value_.__l.__size_;
      snprintf((char *)v23, size, "Error: '%s' failed", "metric_type == METRIC_L2 || (metric_type == METRIC_INNER_PRODUCT && cp.spherical)");
      exception = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(exception, &v29, "void faiss::Level1Quantizer::train_q1(size_t, const float *, BOOL, MetricType)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 104);
    }
    faiss::Clustering::Clustering((faiss::Clustering *)&v29, v11, *((_DWORD *)a1 + 2), (const faiss::ClusteringParameters *)(a1 + 3));
    v19 = (faiss::Index *)a1[8];
    if (v19)
    {
      faiss::Clustering::train((faiss::Clustering *)&v29, a2, a3, v19, 0);
      if (!a4)
      {
LABEL_29:
        (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)*a1 + 24))(*a1, a1[1], v30);
LABEL_40:
        faiss::Clustering::~Clustering((faiss::Clustering *)&v29);
        return;
      }
    }
    else
    {
      faiss::IndexFlat::IndexFlat((uint64_t)v26, v11, 1);
      v26[0] = &unk_1E9805548;
      faiss::Clustering::train((faiss::Clustering *)&v29, a2, a3, (faiss::Index *)v26, 0);
      v26[0] = &off_1E9806E90;
      if (__p)
      {
        v28 = __p;
        operator delete(__p);
      }
      faiss::Index::~Index((faiss::Index *)v26);
      if (!a4)
        goto LABEL_29;
    }
    puts("Adding centroids to quantizer");
    goto LABEL_29;
  }
  if (v12 == 1)
  {
    if (a4)
    {
      puts("IVF quantizer trains alone...");
      v10 = (faiss::Index *)*a1;
    }
    (*(void (**)(faiss::Index *, unint64_t, const float *))(*(_QWORD *)v10 + 16))(v10, a2, a3);
    v13 = (faiss::Index *)*a1;
    *((_BYTE *)v13 + 24) = a4;
    if (*((_QWORD *)v13 + 2) != a1[1])
    {
      memset(&v29, 0, sizeof(v29));
      v14 = snprintf(0, 0, "Error: '%s' failed: nlist not consistent with quantizer size", "quantizer->ntotal == nlist");
      std::string::resize(&v29, v14 + 1, 0);
      if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v15 = &v29;
      else
        v15 = (std::string *)v29.__r_.__value_.__r.__words[0];
      if ((v29.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v16 = HIBYTE(v29.__r_.__value_.__r.__words[2]);
      else
        v16 = v29.__r_.__value_.__l.__size_;
      snprintf((char *)v15, v16, "Error: '%s' failed: nlist not consistent with quantizer size", "quantizer->ntotal == nlist");
      v17 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v17, &v29, "void faiss::Level1Quantizer::train_q1(size_t, const float *, BOOL, MetricType)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 79);
    }
  }
}

void sub_1D4916E7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  void *v26;

  __cxa_free_exception(v26);
  if (a26 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t faiss::Level1Quantizer::coarse_code_size(faiss::Level1Quantizer *this)
{
  uint64_t v1;
  uint64_t result;
  unint64_t v3;
  BOOL v4;

  v1 = *((_QWORD *)this + 1);
  result = 0;
  v3 = v1 - 1;
  if (v3)
  {
    do
    {
      ++result;
      v4 = v3 > 0xFF;
      v3 >>= 8;
    }
    while (v4);
  }
  return result;
}

uint64_t faiss::Level1Quantizer::encode_listno(uint64_t this, uint64_t a2, unsigned __int8 *a3)
{
  unint64_t v3;
  BOOL v4;

  v3 = *(_QWORD *)(this + 8) - 1;
  if (*(_QWORD *)(this + 8) != 1)
  {
    do
    {
      *a3++ = a2;
      a2 >>= 8;
      v4 = v3 > 0xFF;
      v3 >>= 8;
    }
    while (v4);
  }
  return this;
}

unint64_t faiss::Level1Quantizer::decode_listno(faiss::Level1Quantizer *this, const unsigned __int8 *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t result;
  unsigned int v6;
  BOOL v7;
  int v8;
  std::string *v9;
  size_t size;
  void *exception;
  std::string v12;

  v2 = *((_QWORD *)this + 1);
  v3 = v2 - 1;
  if (v2 == 1)
  {
    result = 0;
  }
  else
  {
    v4 = 0;
    result = 0;
    do
    {
      v6 = *a2++;
      result |= (unint64_t)v6 << v4;
      v4 += 8;
      v7 = v3 > 0xFF;
      v3 >>= 8;
    }
    while (v7);
    if ((result & 0x8000000000000000) != 0)
      goto LABEL_8;
  }
  if (result >= v2)
  {
LABEL_8:
    memset(&v12, 0, sizeof(v12));
    v8 = snprintf(0, 0, "Error: '%s' failed", "list_no >= 0 && list_no < nlist");
    std::string::resize(&v12, v8 + 1, 0);
    if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v9 = &v12;
    else
      v9 = (std::string *)v12.__r_.__value_.__r.__words[0];
    if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v12.__r_.__value_.__r.__words[2]);
    else
      size = v12.__r_.__value_.__l.__size_;
    snprintf((char *)v9, size, "Error: '%s' failed", "list_no >= 0 && list_no < nlist");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v12, "Index::idx_t faiss::Level1Quantizer::decode_listno(const uint8_t *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 148);
  }
  return result;
}

void sub_1D4917040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t faiss::IndexIVF::IndexIVF(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, int a6)
{
  faiss::ArrayInvertedLists *v11;
  char v12;
  int v14;
  std::string *v15;
  size_t size;
  void *exception;
  std::string v18;

  *(_QWORD *)a1 = &unk_1E9806BB8;
  *(_DWORD *)(a1 + 8) = a3;
  *(_QWORD *)(a1 + 16) = 0;
  *(_WORD *)(a1 + 24) = 256;
  *(_DWORD *)(a1 + 28) = a6;
  *(_DWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = a2;
  *(_QWORD *)(a1 + 48) = a4;
  *(_WORD *)(a1 + 56) = 0;
  faiss::ClusteringParameters::ClusteringParameters((faiss::ClusteringParameters *)(a1 + 64));
  *(_QWORD *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 64) = 10;
  *(_QWORD *)a1 = off_1E9806D68;
  v11 = (faiss::ArrayInvertedLists *)operator new();
  faiss::ArrayInvertedLists::ArrayInvertedLists(v11, a4, a5);
  *(_QWORD *)(a1 + 112) = v11;
  *(_BYTE *)(a1 + 120) = 1;
  *(_QWORD *)(a1 + 128) = a5;
  *(_OWORD *)(a1 + 136) = xmmword_1D49324E0;
  *(_QWORD *)(a1 + 152) = 0x40000000000;
  faiss::DirectMap::DirectMap((faiss::DirectMap *)(a1 + 160));
  if (*(_DWORD *)(a2 + 8) != a3)
  {
    memset(&v18, 0, sizeof(v18));
    v14 = snprintf(0, 0, "Error: '%s' failed", "d == quantizer->d");
    std::string::resize(&v18, v14 + 1, 0);
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v15 = &v18;
    else
      v15 = (std::string *)v18.__r_.__value_.__r.__words[0];
    if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v18.__r_.__value_.__r.__words[2]);
    else
      size = v18.__r_.__value_.__l.__size_;
    snprintf((char *)v15, size, "Error: '%s' failed", "d == quantizer->d");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v18, "faiss::IndexIVF::IndexIVF(Index *, size_t, size_t, size_t, MetricType)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 170);
  }
  v12 = *(_BYTE *)(a2 + 25);
  if (v12)
    v12 = *(_QWORD *)(a2 + 16) == a4;
  *(_BYTE *)(a1 + 25) = v12;
  if (!*(_DWORD *)(a1 + 28))
    *(_BYTE *)(a1 + 73) = 1;
  return a1;
}

void sub_1D491723C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;
  faiss::DirectMap *v16;
  void *v17;
  uint64_t v19;

  __cxa_free_exception(v17);
  if (a15 < 0)
    operator delete(__p);
  faiss::DirectMap::~DirectMap(v16);
  if (*(_BYTE *)(v15 + 57))
  {
    v19 = *(_QWORD *)(v15 + 40);
    if (v19)
      (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
  }
  faiss::Index::~Index((faiss::Index *)v15);
  _Unwind_Resume(a1);
}

void faiss::DirectMap::~DirectMap(faiss::DirectMap *this)
{
  void *v2;

  std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::~__hash_table((uint64_t)this + 32);
  v2 = (void *)*((_QWORD *)this + 1);
  if (v2)
  {
    *((_QWORD *)this + 2) = v2;
    operator delete(v2);
  }
}

faiss::IndexIVF *faiss::IndexIVF::IndexIVF(faiss::IndexIVF *this)
{
  *(_QWORD *)this = &unk_1E9806BB8;
  *((_DWORD *)this + 2) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_WORD *)this + 12) = 256;
  *(_QWORD *)((char *)this + 28) = 1;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_WORD *)this + 28) = 0;
  faiss::ClusteringParameters::ClusteringParameters((faiss::IndexIVF *)((char *)this + 64));
  *(_QWORD *)this = off_1E9806D68;
  *((_QWORD *)this + 13) = 0;
  *((_QWORD *)this + 14) = 0;
  *((_BYTE *)this + 120) = 0;
  *((_OWORD *)this + 8) = xmmword_1D4927AB0;
  *((_QWORD *)this + 18) = 0;
  *((_QWORD *)this + 19) = 0x40000000000;
  faiss::DirectMap::DirectMap((faiss::IndexIVF *)((char *)this + 160));
  return this;
}

void sub_1D491739C(_Unwind_Exception *a1)
{
  faiss::Index *v1;
  _QWORD *v2;

  if (*((_BYTE *)v1 + 57))
  {
    if (*v2)
      (*(void (**)(_QWORD))(*(_QWORD *)*v2 + 8))(*v2);
  }
  faiss::Index::~Index(v1);
  _Unwind_Resume(a1);
}

uint64_t faiss::IndexIVF::add(faiss::IndexIVF *this, uint64_t a2, const float *a3)
{
  return (*(uint64_t (**)(faiss::IndexIVF *, uint64_t, const float *, _QWORD))(*(_QWORD *)this + 32))(this, a2, a3, 0);
}

void faiss::IndexIVF::add_with_ids(faiss::IndexIVF *this, uint64_t a2, const float *a3, const uint64_t *a4)
{
  uint64_t v8;

  v8 = operator new[]();
  (*(void (**)(_QWORD, uint64_t, const float *, uint64_t, uint64_t))(**((_QWORD **)this + 5) + 56))(*((_QWORD *)this + 5), a2, a3, v8, 1);
  (*(void (**)(faiss::IndexIVF *, uint64_t, const float *, const uint64_t *, uint64_t))(*(_QWORD *)this + 152))(this, a2, a3, a4, v8);
  JUMPOUT(0x1D826288CLL);
}

void sub_1D4917498(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D826288C](v1, 0x1000C8000313F17);
  _Unwind_Resume(a1);
}

uint64_t faiss::IndexIVF::add_core(faiss::IndexIVF *this, int64_t a2, const float *a3, const uint64_t *a4, const uint64_t *a5)
{
  const uint64_t *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const uint64_t *v12;
  int64_t v13;
  uint64_t v14;
  int64_t v15;
  const uint64_t *v16;
  uint64_t result;
  uint64_t v18;
  const uint64_t *v19;
  int64_t v20;
  unint64_t v21;
  uint64_t v22;
  int v23;
  std::string *v24;
  size_t size;
  void *exception;
  int v27;
  std::string *v28;
  size_t v29;
  void *v30;
  std::string v32;

  v5 = a5;
  if (a2 <= 0x10000)
  {
    if (!a5)
    {
      memset(&v32, 0, sizeof(v32));
      v23 = snprintf(0, 0, "Error: '%s' failed", "coarse_idx");
      std::string::resize(&v32, v23 + 1, 0);
      if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v24 = &v32;
      else
        v24 = (std::string *)v32.__r_.__value_.__r.__words[0];
      if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v32.__r_.__value_.__r.__words[2]);
      else
        size = v32.__r_.__value_.__l.__size_;
      snprintf((char *)v24, size, "Error: '%s' failed", "coarse_idx");
      exception = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(exception, &v32, "virtual void faiss::IndexIVF::add_core(idx_t, const float *, const idx_t *, const idx_t *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 224);
    }
    if (!*((_BYTE *)this + 25))
    {
      memset(&v32, 0, sizeof(v32));
      v27 = snprintf(0, 0, "Error: '%s' failed", "is_trained");
      std::string::resize(&v32, v27 + 1, 0);
      if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v28 = &v32;
      else
        v28 = (std::string *)v32.__r_.__value_.__r.__words[0];
      if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v29 = HIBYTE(v32.__r_.__value_.__r.__words[2]);
      else
        v29 = v32.__r_.__value_.__l.__size_;
      snprintf((char *)v28, v29, "Error: '%s' failed", "is_trained");
      v30 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v30, &v32, "virtual void faiss::IndexIVF::add_core(idx_t, const float *, const idx_t *, const idx_t *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 225);
    }
    faiss::DirectMap::check_can_add((_DWORD *)this + 40, a4);
    v18 = 0;
    if (a2)
    {
      v19 = v5;
      v20 = a2;
      do
      {
        v21 = *v19++;
        v18 += v21 >> 63;
        --v20;
      }
      while (v20);
    }
    v22 = operator new[]();
    (*(void (**)(faiss::IndexIVF *, int64_t, const float *, const uint64_t *, uint64_t, _QWORD))(*(_QWORD *)this + 160))(this, a2, a3, v5, v22, 0);
    faiss::DirectMapAdd::DirectMapAdd((faiss::DirectMapAdd *)&v32, (faiss::IndexIVF *)((char *)this + 160), a2, a4);
    if (*((_BYTE *)this + 24))
      printf("    added %zd / %lld vectors (%zd -1s)\n", 0, a2, v18);
    *((_QWORD *)this + 2) += a2;
    faiss::DirectMapAdd::~DirectMapAdd((faiss::DirectMapAdd *)&v32);
    return MEMORY[0x1D826288C](v22, 0x1000C8077774924);
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = 0x10000;
    v12 = a4;
    do
    {
      v13 = v10 + 0x10000;
      if (a2 >= v11)
        v14 = v11;
      else
        v14 = a2;
      if (v13 >= a2)
        v15 = a2;
      else
        v15 = v10 + 0x10000;
      if (*((_BYTE *)this + 24))
        printf("   IndexIVF::add_with_ids %lld:%lld\n", v10, v15);
      if (a4)
        v16 = v12;
      else
        v16 = 0;
      result = (*(uint64_t (**)(faiss::IndexIVF *, uint64_t, const float *, const uint64_t *, const uint64_t *))(*(_QWORD *)this + 152))(this, v14 + v9, &a3[v10 * *((int *)this + 2)], v16, v5);
      v5 += 0x10000;
      v12 += 0x10000;
      v11 += 0x10000;
      v9 -= 0x10000;
      v10 += 0x10000;
    }
    while (v13 < a2);
  }
  return result;
}

void sub_1D49177D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  void *v18;

  __cxa_free_exception(v18);
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void faiss::IndexIVF::make_direct_map(faiss::IndexIVF *this, unsigned int a2)
{
  faiss::DirectMap::set_type((uint64_t)this + 160, a2, *((_QWORD **)this + 14), *((_QWORD *)this + 2));
}

void faiss::IndexIVF::set_direct_map_type(uint64_t a1, unsigned int a2)
{
  faiss::DirectMap::set_type(a1 + 160, a2, *(_QWORD **)(a1 + 112), *(_QWORD *)(a1 + 16));
}

void faiss::IndexIVF::search(faiss::IndexIVF *this, uint64_t a2, const float *a3, uint64_t a4, float *a5, uint64_t *a6)
{
  unint64_t v7;
  faiss::IndexIVFStats *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  char *sig;
  size_t v21;
  void *exception;
  int v23;
  char *v24;
  size_t v25;
  void *v26;
  uint64_t v27;
  void *__p;
  uint64_t v29;
  uint64_t v30;
  void *v31[3];
  _QWORD v32[3];
  std::mutex v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (a4 <= 0)
  {
    memset(&v33, 0, 24);
    v19 = snprintf(0, 0, "Error: '%s' failed", "k > 0");
    std::string::resize((std::string *)&v33, v19 + 1, 0);
    if (v33.__m_.__opaque[15] >= 0)
      sig = (char *)&v33;
    else
      sig = (char *)v33.__m_.__sig;
    if (v33.__m_.__opaque[15] >= 0)
      v21 = v33.__m_.__opaque[15];
    else
      v21 = *(_QWORD *)v33.__m_.__opaque;
    snprintf(sig, v21, "Error: '%s' failed", "k > 0");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v33, "virtual void faiss::IndexIVF::search(idx_t, const float *, idx_t, float *, idx_t *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 298);
  }
  v7 = *((_QWORD *)this + 17);
  if (v7 >= *((_QWORD *)this + 6))
    v7 = *((_QWORD *)this + 6);
  if (!v7)
  {
    memset(&v33, 0, 24);
    v23 = snprintf(0, 0, "Error: '%s' failed", "nprobe > 0");
    std::string::resize((std::string *)&v33, v23 + 1, 0);
    if (v33.__m_.__opaque[15] >= 0)
      v24 = (char *)&v33;
    else
      v24 = (char *)v33.__m_.__sig;
    if (v33.__m_.__opaque[15] >= 0)
      v25 = v33.__m_.__opaque[15];
    else
      v25 = *(_QWORD *)v33.__m_.__opaque;
    snprintf(v24, v25, "Error: '%s' failed", "nprobe > 0");
    v26 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v26, &v33, "virtual void faiss::IndexIVF::search(idx_t, const float *, idx_t, float *, idx_t *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 301);
  }
  v32[0] = this;
  v32[1] = a4;
  v32[2] = v7;
  if ((*((_DWORD *)this + 38) & ~*((_DWORD *)this + 39)) != 0)
  {
    faiss::IndexIVFStats::get_indexIVF_stats(this);
    faiss::IndexIVF::search(long long,float const*,long long,float *,long long *)const::$_0::operator()((uint64_t)v32, a2, (uint64_t)a3, (uint64_t)a5, (uint64_t)a6, (uint64_t)&faiss::IndexIVFStats::get_indexIVF_stats(void)::_stats);
  }
  v13 = (faiss::IndexIVFStats *)std::vector<faiss::IndexIVFStats>::vector(v31, (int)a2);
  v33.__m_.__sig = 850045863;
  memset(v33.__m_.__opaque, 0, sizeof(v33.__m_.__opaque));
  __p = 0;
  v29 = 0;
  v30 = 0;
  if (a2 << 32 > 0)
  {
    v14 = 0;
    v15 = 0;
    if ((int)a2 <= 1)
      v16 = 1;
    else
      v16 = (int)a2;
    v27 = v16;
    do
    {
      v17 = (a2 + v14) / (int)a2;
      if (v17 > v14 / (int)a2)
        faiss::IndexIVF::search(long long,float const*,long long,float *,long long *)const::$_0::operator()((uint64_t)v32, v17 - v14 / (int)a2, (uint64_t)&a3[v14 / (int)a2 * *((int *)this + 2)], (uint64_t)&a5[v14 / (int)a2 * a4], (uint64_t)&a6[v14 / (int)a2 * a4], (uint64_t)v31[0] + v15);
      v15 += 48;
      v14 += a2;
    }
    while (48 * v16 != v15);
    v18 = 0;
    do
    {
      faiss::IndexIVFStats::get_indexIVF_stats(v13);
      faiss::IndexIVFStats::add((faiss::IndexIVFStats *)&faiss::IndexIVFStats::get_indexIVF_stats(void)::_stats, (const faiss::IndexIVFStats *)((char *)v31[0] + v18));
      v18 += 48;
    }
    while (48 * v27 != v18);
  }
  if (SHIBYTE(v30) < 0)
    operator delete(__p);
  std::mutex::~mutex(&v33);
  if (v31[0])
  {
    v31[1] = v31[0];
    operator delete(v31[0]);
  }
}

void sub_1D4917C70()
{
  void *v0;
  char v1;
  uint64_t v2;
  std::mutex v3;

  if (v1 < 0)
    operator delete(v0);
  std::mutex::~mutex(&v3);
  if (v2)
    JUMPOUT(0x1D4917D24);
  JUMPOUT(0x1D4917D30);
}

void sub_1D4917C78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::mutex *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  void *v25;
  char v26;
  uint64_t v27;
  std::mutex v28;

  std::mutex::unlock((std::mutex *)&a25);
  __cxa_end_catch();
  if (v26 < 0)
    operator delete(v25);
  std::mutex::~mutex(&v28);
  if (v27)
    JUMPOUT(0x1D4917D24);
  JUMPOUT(0x1D4917D30);
}

void sub_1D4917C94(void *a1, int a2)
{
  _Unwind_Exception *v2;

  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(v2);
}

void sub_1D4917CA4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  void *v18;
  int v19;
  void *v20;
  char v21;
  uint64_t v22;
  std::mutex v23;

  if (a18 < 0)
  {
    operator delete(__p);
    if ((v19 & 1) == 0)
    {
LABEL_6:
      if (v21 < 0)
        operator delete(v20);
      std::mutex::~mutex(&v23);
      if (v22)
        JUMPOUT(0x1D4917D24);
      JUMPOUT(0x1D4917D30);
    }
  }
  else if (!v19)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v18);
  goto LABEL_6;
}

void sub_1D4917CFC(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  void *v30;
  _Unwind_Exception *v31;

  __cxa_free_exception(v30);
  if (a30 < 0)
    JUMPOUT(0x1D4917D24);
  _Unwind_Resume(v31);
}

void faiss::IndexIVF::search(long long,float const*,long long,float *,long long *)const::$_0::operator()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD **v12;
  uint64_t v13;
  faiss *v14;
  double v15;
  faiss *v16;
  double v17;
  faiss *v18;
  double v19;
  char v20;

  v12 = *(_QWORD ***)a1;
  v13 = operator new[]();
  v14 = (faiss *)operator new[]();
  v15 = faiss::getmillisecs(v14);
  v16 = (faiss *)(*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, _QWORD, faiss *, uint64_t))(*v12[5] + 40))(v12[5], a2, a3, *(_QWORD *)(a1 + 16), v14, v13);
  v17 = faiss::getmillisecs(v16);
  (*(void (**)(_QWORD *, uint64_t, _QWORD))(*v12[14] + 56))(v12[14], v13, (*(_DWORD *)(a1 + 16) * a2));
  v20 = 0;
  v18 = (faiss *)((uint64_t (*)(_QWORD **, uint64_t, uint64_t, _QWORD, uint64_t, faiss *, uint64_t, uint64_t, char, _QWORD, uint64_t))(*v12)[22])(v12, a2, a3, *(_QWORD *)(a1 + 8), v13, v14, a4, a5, v20, 0, a6);
  v19 = faiss::getmillisecs(v18) - v15 + *(double *)(a6 + 40);
  *(double *)(a6 + 32) = v17 - v15 + *(double *)(a6 + 32);
  *(double *)(a6 + 40) = v19;
  MEMORY[0x1D826288C](v14, 0x1000C8052888210);
  JUMPOUT(0x1D826288CLL);
}

void sub_1D4917EC8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  MEMORY[0x1D826288C](v2, 0x1000C8052888210);
  MEMORY[0x1D826288C](v1, 0x1000C8000313F17);
  _Unwind_Resume(a1);
}

__int128 *faiss::IndexIVFStats::get_indexIVF_stats(faiss::IndexIVFStats *this)
{
  unsigned __int8 v1;

  {
    xmmword_1EFEC2CB8 = 0u;
    *(_OWORD *)&qword_1EFEC2CC8 = 0u;
    faiss::IndexIVFStats::get_indexIVF_stats(void)::_stats = 0u;
  }
  return &faiss::IndexIVFStats::get_indexIVF_stats(void)::_stats;
}

int64x2_t faiss::IndexIVFStats::add(faiss::IndexIVFStats *this, const faiss::IndexIVFStats *a2)
{
  int64x2_t v2;
  int64x2_t result;
  float64x2_t v4;

  v2 = *((int64x2_t *)this + 1);
  *(int64x2_t *)this = vaddq_s64(*(int64x2_t *)this, *(int64x2_t *)a2);
  result = vaddq_s64(v2, *((int64x2_t *)a2 + 1));
  v4 = vaddq_f64(*((float64x2_t *)a2 + 2), *((float64x2_t *)this + 2));
  *((int64x2_t *)this + 1) = result;
  *((float64x2_t *)this + 2) = v4;
  return result;
}

void faiss::IndexIVF::search_preassigned(std::string::size_type a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, float *a6, float *a7, uint64_t *a8, char a9, uint64_t a10, _QWORD *a11)
{
  std::string::size_type v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  _DWORD *v32;
  _QWORD *v33;
  unint64_t v34;
  _DWORD *v35;
  unint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  unint64_t v39;
  int *v40;
  uint64_t *v41;
  BOOL v42;
  faiss::InterruptCallback *v44;
  uint64_t v45;
  uint64_t v46;
  _DWORD *v47;
  _QWORD *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  float *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  unint64_t v58;
  _DWORD *v59;
  _QWORD *v60;
  unint64_t v61;
  _DWORD *v62;
  unint64_t v63;
  float *v64;
  uint64_t *v65;
  void *v66;
  int *v67;
  uint64_t v68;
  unint64_t v69;
  int v70;
  uint64_t *v71;
  float *v72;
  uint64_t *v73;
  unint64_t v74;
  uint64_t i;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  unint64_t v79;
  _DWORD *v80;
  _QWORD *v81;
  _DWORD *v82;
  _QWORD *v83;
  uint64_t v84;
  void *v85;
  int *v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  std::string *v93;
  size_t size;
  void *exception;
  int v96;
  std::string *v97;
  size_t v98;
  void *v99;
  const char *v100;
  void *v101;
  int v102;
  std::string *v103;
  size_t v104;
  void *v105;
  int v106;
  std::string *v107;
  size_t v108;
  const char *v109;
  void *v110;
  void (***v111)(_QWORD, uint64_t);
  uint64_t v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  float *__dst;
  std::string::size_type v118;
  uint64_t v119;
  void *__p;
  void *v122;
  std::string v123;
  std::string v124;
  char *v125;
  uint64_t *v126;
  unint64_t *v127;
  std::mutex *v128;
  _BYTE *v129;
  char *v130;
  _QWORD *v131[3];
  _QWORD *v132[2];
  void (***v133)(_QWORD, uint64_t);
  _BYTE v134[9];
  uint64_t v135;
  uint64_t v136;
  char v137;
  uint64_t v138;
  uint64_t v139;
  char v140;
  unint64_t v141;
  std::mutex v142;
  uint64_t v143;

  v143 = *MEMORY[0x1E0C80C00];
  v141 = a4;
  v140 = a9;
  if (a4 <= 0)
  {
    memset(&v124, 0, sizeof(v124));
    v92 = snprintf(0, 0, "Error: '%s' failed", "k > 0");
    std::string::resize(&v124, v92 + 1, 0);
    if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v93 = &v124;
    else
      v93 = (std::string *)v124.__r_.__value_.__r.__words[0];
    if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v124.__r_.__value_.__r.__words[2]);
    else
      size = v124.__r_.__value_.__l.__size_;
    snprintf((char *)v93, size, "Error: '%s' failed", "k > 0");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v124, "virtual void faiss::IndexIVF::search_preassigned(idx_t, const float *, idx_t, const idx_t *, const float *, float *, idx_t *, BOOL, const IVFSearchParameters *, IndexIVFStats *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 393);
  }
  v12 = a1;
  v13 = (uint64_t *)(a10 + 8);
  if (!a10)
    v13 = (uint64_t *)(a1 + 136);
  v14 = *v13;
  if (v14 >= *(_QWORD *)(a1 + 48))
    v14 = *(_QWORD *)(a1 + 48);
  v119 = v14;
  if (v14 <= 0)
  {
    memset(&v124, 0, sizeof(v124));
    v96 = snprintf(0, 0, "Error: '%s' failed", "nprobe > 0");
    std::string::resize(&v124, v96 + 1, 0);
    if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v97 = &v124;
    else
      v97 = (std::string *)v124.__r_.__value_.__r.__words[0];
    if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v98 = HIBYTE(v124.__r_.__value_.__r.__words[2]);
    else
      v98 = v124.__r_.__value_.__l.__size_;
    snprintf((char *)v97, v98, "Error: '%s' failed", "nprobe > 0");
    v99 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v99, &v124, "virtual void faiss::IndexIVF::search_preassigned(idx_t, const float *, idx_t, const idx_t *, const float *, float *, idx_t *, BOOL, const IVFSearchParameters *, IndexIVFStats *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 397);
  }
  if (a10)
    v18 = (uint64_t *)(a10 + 16);
  else
    v18 = (uint64_t *)(a1 + 144);
  v19 = *v18;
  v138 = 0;
  v139 = 0;
  v137 = 0;
  memset(v142.__m_.__opaque, 0, sizeof(v142.__m_.__opaque));
  v142.__m_.__sig = 850045863;
  *(_QWORD *)&v134[1] = 0;
  v135 = 0;
  v136 = 0;
  v20 = *(_DWORD *)(a1 + 152);
  v21 = *(_DWORD *)(a1 + 156);
  *(_QWORD *)v134 = (v21 & v20) == 0;
  v133 = 0;
  v22 = v20 & ~v21;
  v133 = (void (***)(_QWORD, uint64_t))(*(uint64_t (**)(std::string::size_type))(*(_QWORD *)a1 + 184))(a1);
  v132[0] = (_QWORD *)v12;
  v132[1] = &v141;
  v131[0] = v134;
  v131[1] = (_QWORD *)v12;
  v131[2] = &v141;
  v124.__r_.__value_.__r.__words[0] = v12;
  v124.__r_.__value_.__l.__size_ = (std::string::size_type)&v133;
  v124.__r_.__value_.__r.__words[2] = (std::string::size_type)&v139;
  v125 = &v140;
  v126 = &v138;
  v127 = &v141;
  v128 = &v142;
  v129 = &v134[1];
  v130 = &v137;
  v114 = a8;
  __dst = a7;
  v118 = v12;
  v111 = v133;
  switch(v22)
  {
    case 0:
    case 3:
      if (a2 < 1)
      {
        v26 = 0;
      }
      else
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        v26 = 0;
        v27 = 4 * v119;
        v28 = 8 * v119;
        v112 = a2;
        do
        {
          if (!v137)
          {
            (**v133)(v133, a3 + 4 * v25 * *(int *)(v12 + 8));
            v29 = v141;
            if (v134[0])
            {
              if (*(_DWORD *)(v12 + 28))
              {
                if (v141)
                {
                  v30 = (uint64_t *)((char *)a8 + v141 * v24);
                  v31 = v141;
                  v32 = (_DWORD *)((char *)a7 + v141 * v23);
                  do
                  {
                    *v32++ = 2139095039;
                    *v30++ = -1;
                    --v31;
                  }
                  while (v31);
                }
              }
              else if (v141)
              {
                v33 = (uint64_t *)((char *)a8 + v141 * v24);
                v34 = v141;
                v35 = (_DWORD *)((char *)a7 + v141 * v23);
                do
                {
                  *v35++ = -8388609;
                  *v33++ = -1;
                  --v34;
                }
                while (v34);
              }
            }
            v36 = 0;
            v37 = a8;
            v38 = 0;
            v39 = v29 * v25;
            v40 = (int *)&a7[v39];
            v41 = &v37[v39];
            do
            {
              v38 += faiss::IndexIVF::search_preassigned(long long,float const*,long long,long long const*,float const*,float *,long long *,BOOL,faiss::IVFSearchParameters const*,faiss::IndexIVFStats *)const::$_3::operator()((uint64_t *)&v124, a5[v36], (uint64_t)v40, (uint64_t)v41, a6[v36]);
              v42 = v38 < v19 || v19 == 0;
              ++v36;
            }
            while (v42 && v36 < v119);
            v44 = (faiss::InterruptCallback *)faiss::IndexIVF::search_preassigned(long long,float const*,long long,long long const*,float const*,float *,long long *,BOOL,faiss::IVFSearchParameters const*,faiss::IndexIVFStats *)const::$_2::operator()(v131, v40, v41);
            v26 += v38;
            a2 = v112;
            a7 = __dst;
            v12 = v118;
            if (faiss::InterruptCallback::is_interrupted(v44))
              v137 = 1;
            a8 = v114;
            v27 = 4 * v119;
            v28 = 8 * v119;
          }
          ++v25;
          v24 += 8;
          v23 += 4;
          a6 = (float *)((char *)a6 + v27);
          a5 = (uint64_t *)((char *)a5 + v28);
        }
        while (v25 != a2);
      }
      goto LABEL_101;
    case 1:
      std::vector<long long>::vector(&v123, v141);
      std::vector<float>::vector(&__p, v141);
      if (a2)
      {
        v45 = 0;
        v115 = 0;
        v46 = 0;
        v26 = 0;
        v113 = a2;
        while (1)
        {
          (**v133)(v133, a3 + 4 * v46 * *(int *)(v12 + 8));
          if (v134[0])
          {
            v47 = __p;
            v48 = (_QWORD *)v123.__r_.__value_.__r.__words[0];
            v49 = v141;
            if (*(_DWORD *)(v12 + 28))
            {
              if (v141)
              {
                v50 = v45;
                do
                {
                  *v47++ = 2139095039;
                  *v48++ = -1;
                  --v49;
                }
                while (v49);
                goto LABEL_50;
              }
            }
            else if (v141)
            {
              v50 = v45;
              do
              {
                *v47++ = -8388609;
                *v48++ = -1;
                --v49;
              }
              while (v49);
              goto LABEL_50;
            }
          }
          v50 = v45;
LABEL_50:
          v51 = a5;
          v52 = v119;
          v53 = a6;
          do
          {
            v54 = *v51++;
            v26 += faiss::IndexIVF::search_preassigned(long long,float const*,long long,long long const*,float const*,float *,long long *,BOOL,faiss::IVFSearchParameters const*,faiss::IndexIVFStats *)const::$_3::operator()((uint64_t *)&v124, v54, (uint64_t)__p, (uint64_t)v123.__r_.__value_.__l.__data_, *v53++);
            --v52;
          }
          while (v52);
          v55 = v141;
          v56 = v50;
          a2 = v113;
          if (v134[0])
          {
            if (*(_DWORD *)(v12 + 28))
            {
              if (v141)
              {
                v57 = (uint64_t *)((char *)v114 + v141 * v115);
                v58 = v141;
                v59 = (_DWORD *)((char *)__dst + v141 * v56);
                do
                {
                  *v59++ = 2139095039;
                  *v57++ = -1;
                  --v58;
                }
                while (v58);
              }
            }
            else if (v141)
            {
              v60 = (uint64_t *)((char *)v114 + v141 * v115);
              v61 = v141;
              v62 = (_DWORD *)((char *)__dst + v141 * v56);
              do
              {
                *v62++ = -8388609;
                *v60++ = -1;
                --v61;
              }
              while (v61);
            }
          }
          v63 = v55 * v46;
          v64 = &__dst[v63];
          v65 = &v114[v63];
          v66 = __p;
          faiss::IndexIVF::search_preassigned(long long,float const*,long long,long long const*,float const*,float *,long long *,BOOL,faiss::IVFSearchParameters const*,faiss::IndexIVFStats *)const::$_1::operator()(v132, (uint64_t)__p, (uint64_t)v123.__r_.__value_.__l.__data_, v64, (uint64_t)v65);
          v67 = (int *)v64;
          v12 = v118;
          faiss::IndexIVF::search_preassigned(long long,float const*,long long,long long const*,float const*,float *,long long *,BOOL,faiss::IVFSearchParameters const*,faiss::IndexIVFStats *)const::$_2::operator()(v131, v67, v65);
          ++v46;
          a6 += v119;
          a5 += v119;
          v115 += 8;
          v45 = v56 + 4;
          if (v46 == v113)
          {
            if (!v66)
              goto LABEL_99;
            goto LABEL_91;
          }
        }
      }
      v26 = 0;
      v66 = __p;
      if (!__p)
        goto LABEL_99;
LABEL_91:
      v122 = v66;
      v85 = v66;
LABEL_98:
      operator delete(v85);
LABEL_99:
      if (v123.__r_.__value_.__r.__words[0])
      {
        v123.__r_.__value_.__l.__size_ = v123.__r_.__value_.__r.__words[0];
        operator delete(v123.__r_.__value_.__l.__data_);
      }
LABEL_101:
      if (v111)
        ((void (*)(void (***)(_QWORD, uint64_t)))(*v111)[6])(v111);
      if (v137)
      {
        if (SHIBYTE(v136) < 0)
        {
          if (v135)
          {
            memset(&v124, 0, sizeof(v124));
            v100 = *(const char **)&v134[1];
            goto LABEL_136;
          }
        }
        else if (HIBYTE(v136))
        {
          memset(&v124, 0, sizeof(v124));
          v100 = &v134[1];
LABEL_136:
          v106 = snprintf(0, 0, "search interrupted with: %s", v100);
          std::string::resize(&v124, v106 + 1, 0);
          if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v107 = &v124;
          else
            v107 = (std::string *)v124.__r_.__value_.__r.__words[0];
          if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v108 = HIBYTE(v124.__r_.__value_.__r.__words[2]);
          else
            v108 = v124.__r_.__value_.__l.__size_;
          v109 = &v134[1];
          if (v136 < 0)
            v109 = *(const char **)&v134[1];
          snprintf((char *)v107, v108, "search interrupted with: %s", v109);
          v110 = __cxa_allocate_exception(0x20uLL);
          faiss::FaissException::FaissException(v110, &v124, "virtual void faiss::IndexIVF::search_preassigned(idx_t, const float *, idx_t, const idx_t *, const float *, float *, idx_t *, BOOL, const IVFSearchParameters *, IndexIVFStats *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 636);
        }
        v101 = __cxa_allocate_exception(0x20uLL);
        std::string::basic_string[abi:ne180100]<0>(&v124, "computation interrupted");
        faiss::FaissException::FaissException(v101, &v124, "virtual void faiss::IndexIVF::search_preassigned(idx_t, const float *, idx_t, const idx_t *, const float *, float *, idx_t *, BOOL, const IVFSearchParameters *, IndexIVFStats *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 638);
      }
      if (a11)
      {
        v90 = a11[1] + v139;
        *a11 += a2;
        a11[1] = v90;
        v91 = a11[3] + v138;
        a11[2] += v26;
        a11[3] = v91;
      }
      if (SHIBYTE(v136) < 0)
        operator delete(*(void **)&v134[1]);
      std::mutex::~mutex(&v142);
      return;
    case 2:
      std::vector<long long>::vector(&v123, v141);
      std::vector<float>::vector(&__p, v141);
      if (a2 >= 1)
      {
        v68 = 0;
        v69 = v141;
        v70 = v134[0];
        v71 = a8;
        do
        {
          if (v70)
          {
            if (*(_DWORD *)(v12 + 28))
            {
              if (v69)
              {
                v72 = a7;
                v73 = v71;
                v74 = v69;
                do
                {
                  *v72++ = 3.4028e38;
                  *v73++ = -1;
                  --v74;
                }
                while (v74);
              }
            }
            else if (v69)
            {
              for (i = 0; i != v69; ++i)
              {
                a7[i] = -3.4028e38;
                v71[i] = -1;
              }
            }
          }
          ++v68;
          v71 += v69;
          a7 += v69;
        }
        while (v68 != a2);
      }
      if (v119 * a2 < 1)
      {
        v26 = 0;
      }
      else
      {
        v76 = 0;
        v26 = 0;
        do
        {
          (**v133)(v133, a3 + 4 * v76 / v119 * *(int *)(v12 + 8));
          v77 = __p;
          v78 = v123.__r_.__value_.__r.__words[0];
          if (v134[0])
          {
            v79 = v141;
            if (*(_DWORD *)(v12 + 28))
            {
              if (v141)
              {
                v80 = __p;
                v81 = (_QWORD *)v123.__r_.__value_.__r.__words[0];
                do
                {
                  *v80++ = 2139095039;
                  *v81++ = -1;
                  --v79;
                }
                while (v79);
              }
            }
            else if (v141)
            {
              v82 = __p;
              v83 = (_QWORD *)v123.__r_.__value_.__r.__words[0];
              do
              {
                *v82++ = -8388609;
                *v83++ = -1;
                --v79;
              }
              while (v79);
            }
          }
          v84 = faiss::IndexIVF::search_preassigned(long long,float const*,long long,long long const*,float const*,float *,long long *,BOOL,faiss::IVFSearchParameters const*,faiss::IndexIVFStats *)const::$_3::operator()((uint64_t *)&v124, a5[v76], (uint64_t)v77, v78, a6[v76]);
          faiss::IndexIVF::search_preassigned(long long,float const*,long long,long long const*,float const*,float *,long long *,BOOL,faiss::IVFSearchParameters const*,faiss::IndexIVFStats *)const::$_1::operator()(v132, (uint64_t)__p, (uint64_t)v123.__r_.__value_.__l.__data_, &__dst[v141 * (v76 / v119)], (uint64_t)&a8[v141 * (v76 / v119)]);
          v26 += v84;
          ++v76;
        }
        while (v76 != v119 * a2);
      }
      v86 = (int *)__dst;
      if (a2 >= 1)
      {
        v87 = 8 * v141;
        v88 = 4 * v141;
        v89 = a2;
        do
        {
          faiss::IndexIVF::search_preassigned(long long,float const*,long long,long long const*,float const*,float *,long long *,BOOL,faiss::IVFSearchParameters const*,faiss::IndexIVFStats *)const::$_2::operator()(v131, v86, a8);
          a8 = (uint64_t *)((char *)a8 + v87);
          v86 = (int *)((char *)v86 + v88);
          --v89;
        }
        while (v89);
      }
      v85 = __p;
      if (!__p)
        goto LABEL_99;
      v122 = __p;
      goto LABEL_98;
    default:
      memset(&v123, 0, sizeof(v123));
      v102 = snprintf(0, 0, "parallel_mode %d not supported\n", v22);
      std::string::resize(&v123, v102 + 1, 0);
      if ((v123.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v103 = &v123;
      else
        v103 = (std::string *)v123.__r_.__value_.__r.__words[0];
      if ((v123.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v104 = HIBYTE(v123.__r_.__value_.__r.__words[2]);
      else
        v104 = v123.__r_.__value_.__l.__size_;
      snprintf((char *)v103, v104, "parallel_mode %d not supported\n", v22);
      v105 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v105, &v123, "virtual void faiss::IndexIVF::search_preassigned(idx_t, const float *, idx_t, const idx_t *, const float *, float *, idx_t *, BOOL, const IVFSearchParameters *, IndexIVFStats *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 629);
  }
}

void sub_1D4918A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  void *v35;
  uint64_t v36;
  uint64_t v37;

  __cxa_free_exception(v35);
  if (a29 < 0)
    operator delete(__p);
  if (v36)
    (*(void (**)(uint64_t))(*(_QWORD *)v36 + 48))(v36);
  if (*(char *)(v37 - 201) < 0)
    operator delete(*(void **)(v37 - 224));
  std::mutex::~mutex((std::mutex *)(v37 - 160));
  _Unwind_Resume(a1);
}

uint64_t faiss::IndexIVF::search_preassigned(long long,float const*,long long,long long const*,float const*,float *,long long *,BOOL,faiss::IVFSearchParameters const*,faiss::IndexIVFStats *)const::$_3::operator()(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, float a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  faiss::InvertedLists::ScopedIds *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  std::string *v19;
  size_t size;
  void *exception;
  std::string v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a2 < 0)
    return 0;
  v7 = *a1;
  v8 = *(_QWORD *)(*a1 + 48);
  if (v8 <= a2)
  {
    memset(&v23, 0, sizeof(v23));
    v18 = snprintf(0, 0, "Error: '%s' failed: Invalid key=%lld nlist=%zd\n", "key < (idx_t)nlist", a2, v8);
    std::string::resize(&v23, v18 + 1, 0);
    if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v19 = &v23;
    else
      v19 = (std::string *)v23.__r_.__value_.__r.__words[0];
    if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v23.__r_.__value_.__r.__words[2]);
    else
      size = v23.__r_.__value_.__l.__size_;
    snprintf((char *)v19, size, "Error: '%s' failed: Invalid key=%lld nlist=%zd\n", "key < (idx_t)nlist", a2, *(_QWORD *)(v7 + 48));
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v23, "auto faiss::IndexIVF::search_preassigned(idx_t, const float *, idx_t, const idx_t *, const float *, float *, idx_t *, BOOL, const IVFSearchParameters *, IndexIVFStats *)::(anonymous class)::operator()(idx_t, float, float *, idx_t *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 480);
  }
  v12 = (***(uint64_t (****)(_QWORD, uint64_t))(v7 + 112))(*(_QWORD *)(v7 + 112), a2);
  if (v12)
  {
    (*(void (**)(_QWORD, uint64_t, float))(**(_QWORD **)a1[1] + 8))(*(_QWORD *)a1[1], a2, a5);
    ++*(_QWORD *)a1[2];
    v13 = *(_QWORD *)(v7 + 112);
    v14 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v13 + 8))(v13, a2);
    v15 = 0;
    v16 = 0;
    v23.__r_.__value_.__r.__words[0] = 0;
    if (!*(_BYTE *)a1[3])
    {
      v15 = (faiss::InvertedLists::ScopedIds *)operator new();
      v17 = *(_QWORD *)(v7 + 112);
      *(_QWORD *)v15 = v17;
      v16 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v17 + 16))(v17, a2);
      *((_QWORD *)v15 + 1) = v16;
      *((_QWORD *)v15 + 2) = a2;
      v23.__r_.__value_.__r.__words[0] = (std::string::size_type)v15;
    }
    *(_QWORD *)a1[4] += (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(**(_QWORD **)a1[1] + 24))(*(_QWORD *)a1[1], v12, v14, v16, a3, a4, *(_QWORD *)a1[5]);
    if (v15)
    {
      faiss::InvertedLists::ScopedIds::~ScopedIds(v15);
      MEMORY[0x1D82628A4]();
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v13 + 24))(v13, a2, v14);
  }
  return v12;
}

void sub_1D4918FE8()
{
  JUMPOUT(0x1D4918E70);
}

void sub_1D4918FF0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  std::mutex *v23;

  if (a23 < 0)
    operator delete(__p);
  if (a17 < 0)
    operator delete(a12);
  std::mutex::unlock(v23);
  __cxa_end_catch();
  JUMPOUT(0x1D4918E70);
}

_QWORD **faiss::IndexIVF::search_preassigned(long long,float const*,long long,long long const*,float const*,float *,long long *,BOOL,faiss::IVFSearchParameters const*,faiss::IndexIVFStats *)const::$_2::operator()(_QWORD **result, int *__dst, uint64_t *a3)
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char *v8;
  uint64_t *v9;
  int v10;
  uint64_t v11;
  unint64_t v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  float v18;
  float v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t *v24;
  int v25;
  uint64_t v26;
  unint64_t v27;
  float v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  float v33;
  float v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t *v37;
  int *v38;
  unint64_t v39;
  uint64_t *v40;
  int *v41;

  if (!*(_BYTE *)*result)
    return result;
  v5 = *result[2];
  if (*((_DWORD *)result[1] + 7))
  {
    if (!v5)
    {
      v7 = 0;
      goto LABEL_40;
    }
    v6 = 0;
    v7 = 0;
    v8 = (char *)(__dst - 1);
    v9 = a3 - 1;
    while (1)
    {
      v10 = *__dst;
      v11 = *a3;
      v12 = v5 - v6;
      v13 = *(float *)&v8[4 * (v5 - v6)];
      if (v5 - v6 < 2)
      {
        v14 = 1;
        goto LABEL_17;
      }
      v15 = 3;
      v16 = 2;
      v17 = 1;
      while (1)
      {
        v18 = *(float *)&v8[4 * v16];
        if (v15 != v12 + 1)
        {
          v19 = *(float *)&v8[4 * v15];
          if (v18 <= v19)
            break;
        }
        if (v13 > v18)
          goto LABEL_15;
LABEL_13:
        v14 = v16;
        *(float *)&v8[4 * v17] = v18;
        v9[v17] = v9[v16];
        v16 *= 2;
        v15 = (2 * v14) | 1;
        v17 = v14;
        if (v16 > v12)
          goto LABEL_16;
      }
      v18 = *(float *)&v8[4 * v15];
      v16 = v15;
      if (v13 <= v19)
        goto LABEL_13;
LABEL_15:
      v14 = v17;
LABEL_16:
      v13 = *(float *)&v8[4 * v12];
LABEL_17:
      *(float *)&v8[4 * v14] = v13;
      v9[v14] = v9[v12];
      v20 = v5 + ~v7;
      __dst[v20] = v10;
      a3[v20] = v11;
      if (v11 != -1)
        ++v7;
      if (++v6 == v5)
      {
LABEL_40:
        memmove(__dst, &__dst[v5 - v7], 4 * v7);
        result = (_QWORD **)memmove(a3, &a3[v5 - v7], 8 * v7);
        v36 = v5 - v7;
        if (v5 > v7)
        {
          v37 = &a3[v7];
          v38 = &__dst[v7];
          do
          {
            *v38++ = 2139095039;
            *v37++ = -1;
            --v36;
          }
          while (v36);
        }
        return result;
      }
    }
  }
  if (!v5)
  {
    v22 = 0;
    goto LABEL_45;
  }
  v21 = 0;
  v22 = 0;
  v23 = (char *)(__dst - 1);
  v24 = a3 - 1;
  do
  {
    v25 = *__dst;
    v26 = *a3;
    v27 = v5 - v21;
    v28 = *(float *)&v23[4 * (v5 - v21)];
    if (v5 - v21 < 2)
    {
      v29 = 1;
      goto LABEL_35;
    }
    v30 = 3;
    v31 = 2;
    v32 = 1;
    while (1)
    {
      v33 = *(float *)&v23[4 * v31];
      if (v30 != v27 + 1)
      {
        v34 = *(float *)&v23[4 * v30];
        if (v33 >= v34)
          break;
      }
      if (v28 < v33)
        goto LABEL_33;
LABEL_31:
      v29 = v31;
      *(float *)&v23[4 * v32] = v33;
      v24[v32] = v24[v31];
      v31 *= 2;
      v30 = (2 * v29) | 1;
      v32 = v29;
      if (v31 > v27)
        goto LABEL_34;
    }
    v33 = *(float *)&v23[4 * v30];
    v31 = v30;
    if (v28 >= v34)
      goto LABEL_31;
LABEL_33:
    v29 = v32;
LABEL_34:
    v28 = *(float *)&v23[4 * v27];
LABEL_35:
    *(float *)&v23[4 * v29] = v28;
    v24[v29] = v24[v27];
    v35 = v5 + ~v22;
    __dst[v35] = v25;
    a3[v35] = v26;
    if (v26 != -1)
      ++v22;
    ++v21;
  }
  while (v21 != v5);
LABEL_45:
  memmove(__dst, &__dst[v5 - v22], 4 * v22);
  result = (_QWORD **)memmove(a3, &a3[v5 - v22], 8 * v22);
  v39 = v5 - v22;
  if (v5 > v22)
  {
    v40 = &a3[v22];
    v41 = &__dst[v22];
    do
    {
      *v41++ = -8388609;
      *v40++ = -1;
      --v39;
    }
    while (v39);
  }
  return result;
}

_QWORD **faiss::IndexIVF::search_preassigned(long long,float const*,long long,long long const*,float const*,float *,long long *,BOOL,faiss::IVFSearchParameters const*,faiss::IndexIVFStats *)const::$_1::operator()(_QWORD **result, uint64_t a2, uint64_t a3, float *a4, uint64_t a5)
{
  unint64_t v5;
  uint64_t v6;
  float *v7;
  uint64_t v8;
  float v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  float v15;
  float v16;
  uint64_t v17;
  float *v18;
  uint64_t v19;
  float v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  float v26;
  float v27;
  uint64_t v28;
  float *v29;
  uint64_t v30;
  float v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  float v36;
  float v37;
  uint64_t v38;
  float *v39;
  uint64_t v40;
  float v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  float v46;
  float v47;

  v5 = *result[1];
  if (!*((_DWORD *)*result + 7))
  {
    if (a3)
    {
      if (!v5)
        return result;
      v17 = 0;
      v18 = a4 - 1;
      v19 = a5 - 8;
LABEL_23:
      v20 = *(float *)(a2 + 4 * v17);
      if (*a4 >= v20)
        goto LABEL_36;
      v21 = *(_QWORD *)(a3 + 8 * v17);
      if (v5 == 1)
      {
        v22 = 1;
        goto LABEL_35;
      }
      v23 = 3;
      v24 = 2;
      v25 = 1;
      while (1)
      {
        v26 = v18[v24];
        if (v23 == v5 + 1 || (v27 = v18[v23], v26 < v27))
        {
          if (v26 > v20)
            goto LABEL_34;
        }
        else
        {
          v26 = v18[v23];
          v24 = v23;
          if (v27 > v20)
          {
LABEL_34:
            v22 = v25;
LABEL_35:
            v18[v22] = v20;
            *(_QWORD *)(v19 + 8 * v22) = v21;
LABEL_36:
            if (++v17 == v5)
              return result;
            goto LABEL_23;
          }
        }
        v22 = v24;
        v18[v25] = v26;
        *(_QWORD *)(v19 + 8 * v25) = *(_QWORD *)(v19 + 8 * v24);
        v24 *= 2;
        v23 = (2 * v22) | 1;
        v25 = v22;
        if (v24 > v5)
          goto LABEL_35;
      }
    }
    if (!v5)
      return result;
    v38 = 0;
    v39 = a4 - 1;
    v40 = a5 - 8;
LABEL_57:
    v41 = *(float *)(a2 + 4 * v38);
    if (*a4 >= v41)
      goto LABEL_70;
    if (v5 == 1)
    {
      v42 = 1;
      goto LABEL_69;
    }
    v43 = 3;
    v44 = 2;
    v45 = 1;
    while (1)
    {
      v46 = v39[v44];
      if (v43 == v5 + 1 || (v47 = v39[v43], v46 < v47))
      {
        if (v46 > v41)
          goto LABEL_68;
      }
      else
      {
        v46 = v39[v43];
        v44 = v43;
        if (v47 > v41)
        {
LABEL_68:
          v42 = v45;
LABEL_69:
          v39[v42] = v41;
          *(_QWORD *)(v40 + 8 * v42) = v38;
LABEL_70:
          if (++v38 == v5)
            return result;
          goto LABEL_57;
        }
      }
      v42 = v44;
      v39[v45] = v46;
      *(_QWORD *)(v40 + 8 * v45) = *(_QWORD *)(v40 + 8 * v44);
      v44 *= 2;
      v43 = (2 * v42) | 1;
      v45 = v42;
      if (v44 > v5)
        goto LABEL_69;
    }
  }
  if (!a3)
  {
    if (!v5)
      return result;
    v28 = 0;
    v29 = a4 - 1;
    v30 = a5 - 8;
LABEL_40:
    v31 = *(float *)(a2 + 4 * v28);
    if (*a4 <= v31)
      goto LABEL_53;
    if (v5 == 1)
    {
      v32 = 1;
      goto LABEL_52;
    }
    v33 = 3;
    v34 = 2;
    v35 = 1;
    while (1)
    {
      v36 = v29[v34];
      if (v33 == v5 + 1 || (v37 = v29[v33], v36 > v37))
      {
        if (v36 < v31)
          goto LABEL_51;
      }
      else
      {
        v36 = v29[v33];
        v34 = v33;
        if (v37 < v31)
        {
LABEL_51:
          v32 = v35;
LABEL_52:
          v29[v32] = v31;
          *(_QWORD *)(v30 + 8 * v32) = v28;
LABEL_53:
          if (++v28 == v5)
            return result;
          goto LABEL_40;
        }
      }
      v32 = v34;
      v29[v35] = v36;
      *(_QWORD *)(v30 + 8 * v35) = *(_QWORD *)(v30 + 8 * v34);
      v34 *= 2;
      v33 = (2 * v32) | 1;
      v35 = v32;
      if (v34 > v5)
        goto LABEL_52;
    }
  }
  if (!v5)
    return result;
  v6 = 0;
  v7 = a4 - 1;
  v8 = a5 - 8;
  do
  {
    v9 = *(float *)(a2 + 4 * v6);
    if (*a4 <= v9)
      goto LABEL_18;
    v10 = *(_QWORD *)(a3 + 8 * v6);
    if (v5 == 1)
    {
      v11 = 1;
      goto LABEL_17;
    }
    v12 = 3;
    v13 = 2;
    v14 = 1;
    while (1)
    {
      v15 = v7[v13];
      if (v12 != v5 + 1)
      {
        v16 = v7[v12];
        if (v15 <= v16)
          break;
      }
      if (v15 < v9)
        goto LABEL_16;
LABEL_14:
      v11 = v13;
      v7[v14] = v15;
      *(_QWORD *)(v8 + 8 * v14) = *(_QWORD *)(v8 + 8 * v13);
      v13 *= 2;
      v12 = (2 * v11) | 1;
      v14 = v11;
      if (v13 > v5)
        goto LABEL_17;
    }
    v15 = v7[v12];
    v13 = v12;
    if (v16 >= v9)
      goto LABEL_14;
LABEL_16:
    v11 = v14;
LABEL_17:
    v7[v11] = v9;
    *(_QWORD *)(v8 + 8 * v11) = v10;
LABEL_18:
    ++v6;
  }
  while (v6 != v5);
  return result;
}

void faiss::IndexIVF::range_search(faiss::IndexIVF *this, int64_t a2, const float *a3, float a4, faiss::RangeSearchResult *a5)
{
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  faiss *v13;
  double v14;
  faiss *v15;
  double v16;
  faiss::IndexIVFStats *v17;
  __int128 *indexIVF_stats;
  double v19;
  faiss::IndexIVFStats *v20;
  faiss *v21;
  double v22;
  faiss::IndexIVFStats *v23;

  if (*((_QWORD *)this + 17) >= *((_QWORD *)this + 6))
    v10 = *((_QWORD *)this + 6);
  else
    v10 = *((_QWORD *)this + 17);
  v11 = v10 * a2;
  v12 = operator new[]();
  v13 = (faiss *)operator new[]();
  v14 = faiss::getmillisecs(v13);
  v15 = (faiss *)(*(uint64_t (**)(_QWORD, int64_t, const float *, uint64_t, faiss *, uint64_t))(**((_QWORD **)this + 5) + 40))(*((_QWORD *)this + 5), a2, a3, v10, v13, v12);
  v16 = faiss::getmillisecs(v15);
  indexIVF_stats = faiss::IndexIVFStats::get_indexIVF_stats(v17);
  *(double *)&qword_1EFEC2CC8 = v16 - v14 + *(double *)&qword_1EFEC2CC8;
  v19 = faiss::getmillisecs((faiss *)indexIVF_stats);
  v20 = (faiss::IndexIVFStats *)(*(uint64_t (**)(_QWORD, uint64_t, int64_t))(**((_QWORD **)this + 14)
                                                                                           + 56))(*((_QWORD *)this + 14), v12, v11);
  faiss::IndexIVFStats::get_indexIVF_stats(v20);
  faiss::IndexIVF::range_search_preassigned((std::string::size_type)this, a2, (uint64_t)a3, v12, (uint64_t)v13, a5, 0, 0, a4, &faiss::IndexIVFStats::get_indexIVF_stats(void)::_stats);
  v22 = faiss::getmillisecs(v21);
  faiss::IndexIVFStats::get_indexIVF_stats(v23);
  *(double *)&qword_1EFEC2CD0 = v22 - v19 + *(double *)&qword_1EFEC2CD0;
  MEMORY[0x1D826288C](v13, 0x1000C8052888210);
  JUMPOUT(0x1D826288CLL);
}

void sub_1D49197B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1D826288C](v1, 0x1000C8000313F17);
  _Unwind_Resume(a1);
}

void faiss::IndexIVF::range_search_preassigned(std::string::size_type a1, int64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, faiss::RangeSearchResult *a6, uint64_t a7, uint64_t a8, float a9, _QWORD *a10)
{
  uint64_t *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  unint64_t j;
  void (***v30)(_QWORD, _QWORD);
  uint64_t v31;
  int v32;
  std::string *v33;
  size_t size;
  void *exception;
  const char *v36;
  void *v37;
  int v38;
  std::string *p_p;
  size_t v40;
  void *v41;
  int v42;
  std::string *v43;
  size_t v44;
  const char *v45;
  void *v46;
  std::string __p;
  std::string v48;
  void (****v49)(_QWORD, uint64_t);
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  float *v53;
  std::mutex *v54;
  void **v55;
  char *v56;
  void (***v57)(_QWORD, uint64_t);
  _QWORD v58[6];
  void *v59;
  void *v60;
  void *v61[3];
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  float v71;
  std::mutex v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v71 = a9;
  v69 = a5;
  v70 = a4;
  v15 = (uint64_t *)(a8 + 8);
  if (!a8)
    v15 = (uint64_t *)(a1 + 136);
  v16 = *v15;
  if (v16 >= *(_QWORD *)(a1 + 48))
    v16 = *(_QWORD *)(a1 + 48);
  v67 = 0;
  v68 = v16;
  v66 = 0;
  v65 = 0;
  memset(v72.__m_.__opaque, 0, sizeof(v72.__m_.__opaque));
  v72.__m_.__sig = 850045863;
  v62 = 0;
  v63 = 0;
  v64 = 0;
  std::vector<faiss::RangeSearchPartialResult *>::vector(v61, 1uLL);
  faiss::RangeSearchPartialResult::RangeSearchPartialResult(v58, a6);
  v57 = (void (***)(_QWORD, uint64_t))(*(uint64_t (**)(std::string::size_type, uint64_t))(*(_QWORD *)a1 + 184))(a1, a7);
  if (!v57)
  {
    memset(&v48, 0, sizeof(v48));
    v32 = snprintf(0, 0, "Error: '%s' failed", "scanner.get()");
    std::string::resize(&v48, v32 + 1, 0);
    if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v33 = &v48;
    else
      v33 = (std::string *)v48.__r_.__value_.__r.__words[0];
    if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v48.__r_.__value_.__r.__words[2]);
    else
      size = v48.__r_.__value_.__l.__size_;
    snprintf((char *)v33, size, "Error: '%s' failed", "scanner.get()");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v48, "void faiss::IndexIVF::range_search_preassigned(idx_t, const float *, float, const idx_t *, const float *, RangeSearchResult *, BOOL, const IVFSearchParameters *, IndexIVFStats *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 721);
  }
  *(_QWORD *)v61[0] = v58;
  v48.__r_.__value_.__r.__words[0] = (std::string::size_type)&v70;
  v48.__r_.__value_.__l.__size_ = (std::string::size_type)&v68;
  v48.__r_.__value_.__r.__words[2] = a1;
  v49 = &v57;
  v50 = &v69;
  v51 = &v67;
  v52 = &v66;
  v53 = &v71;
  v54 = &v72;
  v55 = (void **)&v62;
  v56 = &v65;
  v17 = *(_DWORD *)(a1 + 152);
  if (v17)
  {
    if (v17 != 2)
    {
      if (v17 != 1)
      {
        memset(&__p, 0, sizeof(__p));
        v38 = snprintf(0, 0, "parallel_mode %d not supported\n", v17);
        std::string::resize(&__p, v38 + 1, 0);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_p = &__p;
        else
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v40 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        else
          v40 = __p.__r_.__value_.__l.__size_;
        snprintf((char *)p_p, v40, "parallel_mode %d not supported\n", *(_DWORD *)(a1 + 152));
        v41 = __cxa_allocate_exception(0x20uLL);
        faiss::FaissException::FaissException(v41, &__p, "void faiss::IndexIVF::range_search_preassigned(idx_t, const float *, float, const idx_t *, const float *, RangeSearchResult *, BOOL, const IVFSearchParameters *, IndexIVFStats *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 802);
      }
      if (!a2)
        goto LABEL_32;
      v18 = 0;
      do
      {
        (**v57)(v57, a3 + 4 * v18 * *(int *)(a1 + 8));
        v19 = faiss::RangeSearchPartialResult::new_result((faiss::RangeSearchPartialResult *)v58, v18);
        if (v68 >= 1)
        {
          v20 = (uint64_t)v19;
          for (i = 0; i < v68; ++i)
            faiss::IndexIVF::range_search_preassigned(long long,float const*,float,long long const*,float const*,faiss::RangeSearchResult *,BOOL,faiss::IVFSearchParameters const*,faiss::IndexIVFStats *)const::$_0::operator()((uint64_t)&v48, v18, i, v20);
        }
        ++v18;
      }
      while (v18 != a2);
      goto LABEL_31;
    }
    std::vector<faiss::RangeQueryResult *>::vector(&__p, a2);
    v22 = v68;
    if (v68 * a2 < 1)
    {
LABEL_23:
      if (__p.__r_.__value_.__r.__words[0])
      {
        __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      goto LABEL_31;
    }
    v23 = 0;
    v24 = 0;
    while (1)
    {
      v25 = v23 / v22;
      if (!v24)
        goto LABEL_21;
      if (*v24 != v25)
        break;
LABEL_22:
      faiss::IndexIVF::range_search_preassigned(long long,float const*,float,long long const*,float const*,faiss::RangeSearchResult *,BOOL,faiss::IVFSearchParameters const*,faiss::IndexIVFStats *)const::$_0::operator()((uint64_t)&v48, v23 / v22, v23 % v22, (uint64_t)v24);
      ++v23;
      v22 = v68;
      if (v23 >= v68 * a2)
        goto LABEL_23;
    }
    if (v25 <= *v24)
    {
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "Faiss assertion '%s' failed in %s at %s:%d\n", "!qres || i > qres->qno", "void faiss::IndexIVF::range_search_preassigned(idx_t, const float *, float, const idx_t *, const float *, RangeSearchResult *, BOOL, const IVFSearchParameters *, IndexIVFStats *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 795);
      abort();
    }
LABEL_21:
    v24 = faiss::RangeSearchPartialResult::new_result((faiss::RangeSearchPartialResult *)v58, v23 / v22);
    (**v57)(v57, a3 + 4 * v25 * *(int *)(a1 + 8));
    goto LABEL_22;
  }
  if (a2 < 1)
    goto LABEL_33;
  v26 = 0;
  do
  {
    (**v57)(v57, a3 + 4 * v26 * *(int *)(a1 + 8));
    v27 = faiss::RangeSearchPartialResult::new_result((faiss::RangeSearchPartialResult *)v58, v26);
    if (v68)
    {
      v28 = (uint64_t)v27;
      for (j = 0; j < v68; ++j)
        faiss::IndexIVF::range_search_preassigned(long long,float const*,float,long long const*,float const*,faiss::RangeSearchResult *,BOOL,faiss::IVFSearchParameters const*,faiss::IndexIVFStats *)const::$_0::operator()((uint64_t)&v48, v26, j, v28);
    }
    ++v26;
  }
  while (v26 != a2);
LABEL_31:
  if (*(_DWORD *)(a1 + 152))
  {
LABEL_32:
    faiss::RangeSearchPartialResult::merge((uint64_t **)v61, 0);
    goto LABEL_34;
  }
LABEL_33:
  faiss::RangeSearchPartialResult::finalize((faiss::RangeSearchPartialResult *)v58);
LABEL_34:
  v30 = v57;
  v57 = 0;
  if (v30)
    ((void (*)(void (***)(_QWORD, _QWORD)))(*v30)[6])(v30);
  if (v59)
  {
    v60 = v59;
    operator delete(v59);
  }
  faiss::BufferList::~BufferList((faiss::BufferList *)v58);
  if (v65)
  {
    if (SHIBYTE(v64) < 0)
    {
      if (v63)
      {
        memset(&v48, 0, sizeof(v48));
        v36 = v62;
        goto LABEL_67;
      }
    }
    else if (HIBYTE(v64))
    {
      memset(&v48, 0, sizeof(v48));
      v36 = (const char *)&v62;
LABEL_67:
      v42 = snprintf(0, 0, "search interrupted with: %s", v36);
      std::string::resize(&v48, v42 + 1, 0);
      if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v43 = &v48;
      else
        v43 = (std::string *)v48.__r_.__value_.__r.__words[0];
      if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v44 = HIBYTE(v48.__r_.__value_.__r.__words[2]);
      else
        v44 = v48.__r_.__value_.__l.__size_;
      v45 = (const char *)&v62;
      if (v64 < 0)
        v45 = v62;
      snprintf((char *)v43, v44, "search interrupted with: %s", v45);
      v46 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v46, &v48, "void faiss::IndexIVF::range_search_preassigned(idx_t, const float *, float, const idx_t *, const float *, RangeSearchResult *, BOOL, const IVFSearchParameters *, IndexIVFStats *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 817);
    }
    v37 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v48, "computation interrupted");
    faiss::FaissException::FaissException(v37, &v48, "void faiss::IndexIVF::range_search_preassigned(idx_t, const float *, float, const idx_t *, const float *, RangeSearchResult *, BOOL, const IVFSearchParameters *, IndexIVFStats *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 819);
  }
  if (a10)
  {
    v31 = a10[1] + v67;
    *a10 += a2;
    a10[1] = v31;
    a10[2] += v66;
  }
  if (v61[0])
  {
    v61[1] = v61[0];
    operator delete(v61[0]);
  }
  if (SHIBYTE(v64) < 0)
    operator delete(v62);
  std::mutex::~mutex(&v72);
}

void sub_1D4919E78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,void *a43,uint64_t a44)
{
  void *v44;
  uint64_t v45;

  __cxa_free_exception(v44);
  if (a18 < 0)
    operator delete(__p);
  if (a33)
    (*(void (**)(uint64_t))(*(_QWORD *)a33 + 48))(a33);
  faiss::RangeSearchPartialResult::~RangeSearchPartialResult((faiss::RangeSearchPartialResult *)&a34);
  if (a43)
  {
    a44 = (uint64_t)a43;
    operator delete(a43);
  }
  if (*(char *)(v45 - 193) < 0)
    operator delete(*(void **)(v45 - 216));
  std::mutex::~mutex((std::mutex *)(v45 - 136));
  _Unwind_Resume(a1);
}

uint64_t faiss::IndexIVF::range_search_preassigned(long long,float const*,float,long long const*,float const*,faiss::RangeSearchResult *,BOOL,faiss::IVFSearchParameters const*,faiss::IndexIVFStats *)const::$_0::operator()(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  std::string *v17;
  size_t size;
  void *exception;
  std::string v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(**(_QWORD **)result + 8 * (a3 + **(_QWORD **)(result + 8) * a2));
  if ((v4 & 0x8000000000000000) == 0)
  {
    v6 = result;
    v7 = *(_QWORD *)(result + 16);
    v8 = *(_QWORD *)(v7 + 48);
    if (v4 >= v8)
    {
      memset(&v20, 0, sizeof(v20));
      v16 = snprintf(0, 0, "Error: '%s' failed: Invalid key=%lld at ik=%zd nlist=%zd\n", "key < (idx_t)nlist", v4, a3, v8);
      std::string::resize(&v20, v16 + 1, 0);
      if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v17 = &v20;
      else
        v17 = (std::string *)v20.__r_.__value_.__r.__words[0];
      if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v20.__r_.__value_.__r.__words[2]);
      else
        size = v20.__r_.__value_.__l.__size_;
      snprintf((char *)v17, size, "Error: '%s' failed: Invalid key=%lld at ik=%zd nlist=%zd\n", "key < (idx_t)nlist", v4, a3, *(_QWORD *)(v7 + 48));
      exception = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(exception, &v20, "auto faiss::IndexIVF::range_search_preassigned(idx_t, const float *, float, const idx_t *, const float *, RangeSearchResult *, BOOL, const IVFSearchParameters *, IndexIVFStats *)::(anonymous class)::operator()(size_t, size_t, RangeQueryResult &) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 739);
    }
    result = (***(uint64_t (****)(_QWORD, uint64_t))(v7 + 112))(*(_QWORD *)(v7 + 112), v4);
    if (result)
    {
      v11 = result;
      v12 = *(_QWORD *)(v7 + 112);
      v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v12 + 8))(v12, v4);
      v14 = *(_QWORD *)(v7 + 112);
      v15 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v14 + 16))(v14, v4);
      (*(void (**)(_QWORD, uint64_t, float))(***(_QWORD ***)(v6 + 24) + 8))(**(_QWORD **)(v6 + 24), v4, *(float *)(**(_QWORD **)(v6 + 32) + 4 * (a3 + **(_QWORD **)(v6 + 8) * a2)));
      ++**(_QWORD **)(v6 + 40);
      **(_QWORD **)(v6 + 48) += v11;
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, float))(***(_QWORD ***)(v6 + 24) + 32))(**(_QWORD **)(v6 + 24), v11, v13, v15, a4, **(float **)(v6 + 56));
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v14 + 32))(v14, v4, v15);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v12 + 24))(v12, v4, v13);
    }
  }
  return result;
}

void sub_1D491A218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, std::string *a14, __int128 __p, void *__pa, uint64_t __p_8, int a18, __int16 a19, char a20,char a21)
{
  void *v21;

  __cxa_free_exception(v21);
  if (a21 < 0)
    operator delete(__pa);
  _Unwind_Resume(a1);
}

void sub_1D491A270()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v1 + 32))(v1, v0, v2);
  JUMPOUT(0x1D491A290);
}

void sub_1D491A3AC()
{
  JUMPOUT(0x1D491A268);
}

void sub_1D491A3B4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  std::mutex *v25;

  if (a25 < 0)
    operator delete(__p);
  if (a19 < 0)
    operator delete(a14);
  std::mutex::unlock(v25);
  __cxa_end_catch();
  JUMPOUT(0x1D491A268);
}

void faiss::RangeSearchPartialResult::~RangeSearchPartialResult(faiss::RangeSearchPartialResult *this)
{
  void *v2;

  v2 = (void *)*((_QWORD *)this + 6);
  if (v2)
  {
    *((_QWORD *)this + 7) = v2;
    operator delete(v2);
  }
  faiss::BufferList::~BufferList(this);
}

uint64_t faiss::IndexIVF::get_InvertedListScanner(faiss::IndexIVF *this)
{
  return 0;
}

uint64_t faiss::IndexIVF::reconstruct(faiss::IndexIVF *this, unint64_t a2, float *a3)
{
  unint64_t v5;

  v5 = faiss::DirectMap::get((faiss::IndexIVF *)((char *)this + 160), a2);
  return (*(uint64_t (**)(faiss::IndexIVF *, unint64_t, _QWORD, float *))(*(_QWORD *)this + 200))(this, HIDWORD(v5), v5, a3);
}

uint64_t faiss::IndexIVF::reconstruct_n(uint64_t this, uint64_t a2, uint64_t a3, float *a4)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  int v15;
  std::string *v16;
  size_t size;
  void *exception;
  std::string v19;

  v6 = this;
  if (a3 && (a2 < 0 || a3 + a2 > *(_QWORD *)(this + 16)))
  {
    memset(&v19, 0, sizeof(v19));
    v15 = snprintf(0, 0, "Error: '%s' failed", "ni == 0 || (i0 >= 0 && i0 + ni <= ntotal)");
    std::string::resize(&v19, v15 + 1, 0);
    if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v16 = &v19;
    else
      v16 = (std::string *)v19.__r_.__value_.__r.__words[0];
    if ((v19.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v19.__r_.__value_.__r.__words[2]);
    else
      size = v19.__r_.__value_.__l.__size_;
    snprintf((char *)v16, size, "Error: '%s' failed", "ni == 0 || (i0 >= 0 && i0 + ni <= ntotal)");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v19, "virtual void faiss::IndexIVF::reconstruct_n(idx_t, idx_t, float *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 841);
  }
  if (*(_QWORD *)(this + 48))
  {
    v7 = 0;
    v8 = a3 + a2;
    do
    {
      v9 = (***(uint64_t (****)(_QWORD, unint64_t))(v6 + 112))(*(_QWORD *)(v6 + 112), v7);
      v10 = *(_QWORD *)(v6 + 112);
      v11 = (*(uint64_t (**)(uint64_t, unint64_t))(*(_QWORD *)v10 + 16))(v10, v7);
      if (v9)
      {
        for (i = 0; i != v9; ++i)
        {
          v13 = *(_QWORD *)(v11 + 8 * i);
          if (v13 >= a2 && v13 < v8)
            (*(void (**)(uint64_t, unint64_t, uint64_t, float *))(*(_QWORD *)v6 + 200))(v6, v7, i, &a4[(v13 - a2) * *(int *)(v6 + 8)]);
        }
      }
      this = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)v10 + 32))(v10, v7++, v11);
    }
    while (v7 < *(_QWORD *)(v6 + 48));
  }
  return this;
}

void sub_1D491A640(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t faiss::IndexIVF::sa_code_size(faiss::IndexIVF *this)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  BOOL v4;

  v1 = *((_QWORD *)this + 6);
  v2 = v1 - 1;
  if (v1 == 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = 0;
    do
    {
      ++v3;
      v4 = v2 > 0xFF;
      v2 >>= 8;
    }
    while (v4);
  }
  return *((_QWORD *)this + 16) + v3;
}

void faiss::IndexIVF::sa_encode(faiss::IndexIVF *this, uint64_t a2, const float *a3, unsigned __int8 *a4)
{
  uint64_t v8;
  int v9;
  std::string *v10;
  size_t size;
  void *exception;
  std::string v13;

  if (*((_BYTE *)this + 25))
  {
    v8 = operator new[]();
    (*(void (**)(_QWORD, uint64_t, const float *, uint64_t, uint64_t))(**((_QWORD **)this + 5) + 56))(*((_QWORD *)this + 5), a2, a3, v8, 1);
    (*(void (**)(faiss::IndexIVF *, uint64_t, const float *, uint64_t, unsigned __int8 *, uint64_t))(*(_QWORD *)this + 160))(this, a2, a3, v8, a4, 1);
    JUMPOUT(0x1D826288CLL);
  }
  memset(&v13, 0, sizeof(v13));
  v9 = snprintf(0, 0, "Error: '%s' failed", "is_trained");
  std::string::resize(&v13, v9 + 1, 0);
  if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v10 = &v13;
  else
    v10 = (std::string *)v13.__r_.__value_.__r.__words[0];
  if ((v13.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v13.__r_.__value_.__r.__words[2]);
  else
    size = v13.__r_.__value_.__l.__size_;
  snprintf((char *)v10, size, "Error: '%s' failed", "is_trained");
  exception = __cxa_allocate_exception(0x20uLL);
  faiss::FaissException::FaissException(exception, &v13, "virtual void faiss::IndexIVF::sa_encode(idx_t, const float *, uint8_t *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 866);
}

void sub_1D491A840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void faiss::IndexIVF::search_and_reconstruct(faiss::IndexIVF *this, uint64_t a2, const float *a3, uint64_t a4, float *a5, uint64_t *a6, float *a7)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  float *v21;
  unint64_t v22;
  uint64_t v23;
  int v24;
  std::string *v25;
  size_t v26;
  void *v27;
  int v28;
  std::string *v29;
  size_t size;
  void *exception;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  std::string v36;

  if (a4 > 0)
  {
    if (*((_QWORD *)this + 17) >= *((_QWORD *)this + 6))
      v8 = *((_QWORD *)this + 6);
    else
      v8 = *((_QWORD *)this + 17);
    if (v8)
    {
      v11 = a4;
      v14 = v8 * a2;
      v15 = operator new[]();
      v33 = operator new[]();
      (*(void (**)(_QWORD, uint64_t, const float *, uint64_t, uint64_t, uint64_t))(**((_QWORD **)this + 5) + 40))(*((_QWORD *)this + 5), a2, a3, v8, v33, v15);
      (*(void (**)(_QWORD, uint64_t, uint64_t))(**((_QWORD **)this + 14) + 56))(*((_QWORD *)this + 14), v15, v14);
      (*(void (**)(faiss::IndexIVF *, _QWORD, const float *, _QWORD, uint64_t, uint64_t, float *, uint64_t *, char, _QWORD, _QWORD))(*(_QWORD *)this + 176))(this, (int)a2, a3, (int)v11, v15, v33, a5, a6, 1, 0, 0);
      if (a2 >= 1)
      {
        v16 = 0;
        v17 = 0;
        v34 = a2;
        v35 = v11;
        do
        {
          v18 = v16;
          do
          {
            v19 = a6[v18];
            v20 = *((int *)this + 2);
            v21 = &a7[v18 * v20];
            if ((v19 & 0x8000000000000000) != 0)
            {
              memset(&a7[v18 * v20], 255, 4 * v20);
            }
            else
            {
              v22 = HIDWORD(v19);
              v23 = (int)v19;
              a6[v18] = (*(uint64_t (**)(_QWORD, unint64_t, _QWORD))(**((_QWORD **)this + 14) + 40))(*((_QWORD *)this + 14), HIDWORD(v19), (int)v19);
              (*(void (**)(faiss::IndexIVF *, unint64_t, uint64_t, float *))(*(_QWORD *)this + 200))(this, v22, v23, v21);
            }
            ++v18;
            --v11;
          }
          while (v11);
          ++v17;
          v11 = v35;
          v16 += v35;
        }
        while (v17 != v34);
      }
      MEMORY[0x1D826288C](v33, 0x1000C8052888210);
      JUMPOUT(0x1D826288CLL);
    }
    memset(&v36, 0, sizeof(v36));
    v28 = snprintf(0, 0, "Error: '%s' failed", "nprobe > 0");
    std::string::resize(&v36, v28 + 1, 0);
    if ((v36.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v29 = &v36;
    else
      v29 = (std::string *)v36.__r_.__value_.__r.__words[0];
    if ((v36.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v36.__r_.__value_.__r.__words[2]);
    else
      size = v36.__r_.__value_.__l.__size_;
    snprintf((char *)v29, size, "Error: '%s' failed", "nprobe > 0");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v36, "virtual void faiss::IndexIVF::search_and_reconstruct(idx_t, const float *, idx_t, float *, idx_t *, float *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 882);
  }
  memset(&v36, 0, sizeof(v36));
  v24 = snprintf(0, 0, "Error: '%s' failed", "k > 0");
  std::string::resize(&v36, v24 + 1, 0);
  if ((v36.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v25 = &v36;
  else
    v25 = (std::string *)v36.__r_.__value_.__r.__words[0];
  if ((v36.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v26 = HIBYTE(v36.__r_.__value_.__r.__words[2]);
  else
    v26 = v36.__r_.__value_.__l.__size_;
  snprintf((char *)v25, v26, "Error: '%s' failed", "k > 0");
  v27 = __cxa_allocate_exception(0x20uLL);
  faiss::FaissException::FaissException(v27, &v36, "virtual void faiss::IndexIVF::search_and_reconstruct(idx_t, const float *, idx_t, float *, idx_t *, float *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 879);
}

void sub_1D491ABF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  void *v23;

  __cxa_free_exception(v23);
  if (a23 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void faiss::IndexIVF::reconstruct_from_offset(faiss::IndexIVF *this, uint64_t a2, uint64_t a3, float *a4)
{
  void *exception;
  _QWORD v5[3];

  exception = __cxa_allocate_exception(0x20uLL);
  std::string::basic_string[abi:ne180100]<0>(v5, "reconstruct_from_offset not implemented");
  faiss::FaissException::FaissException(exception, v5, "virtual void faiss::IndexIVF::reconstruct_from_offset(int64_t, int64_t, float *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 929);
}

void sub_1D491ACE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

uint64_t faiss::IndexIVF::reset(faiss::IndexIVF *this)
{
  uint64_t result;

  faiss::DirectMap::clear((faiss::IndexIVF *)((char *)this + 160));
  result = (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 14) + 104))(*((_QWORD *)this + 14));
  *((_QWORD *)this + 2) = 0;
  return result;
}

uint64_t faiss::IndexIVF::remove_ids(uint64_t a1, unsigned int (***a2)(const void *, _QWORD))
{
  uint64_t result;

  result = faiss::DirectMap::remove_ids((_DWORD *)(a1 + 160), a2, *(_QWORD **)(a1 + 112));
  *(_QWORD *)(a1 + 16) -= result;
  return result;
}

void faiss::IndexIVF::update_vectors(faiss::IndexIVF *this, int a2, unint64_t *a3, const float *a4)
{
  int v8;
  _DWORD *v9;
  int v11;
  std::string *v12;
  size_t v13;
  void *v14;
  int v15;
  std::string *v16;
  size_t size;
  void *exception;
  int v19;
  std::string *p_p;
  size_t v21;
  void *v22;
  std::string __p;
  std::string v24;

  v9 = (_DWORD *)((char *)this + 160);
  v8 = *((_DWORD *)this + 40);
  if (v8 == 1)
  {
    if (!*((_BYTE *)this + 25))
    {
      memset(&v24, 0, sizeof(v24));
      v15 = snprintf(0, 0, "Error: '%s' failed", "is_trained");
      std::string::resize(&v24, v15 + 1, 0);
      if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v16 = &v24;
      else
        v16 = (std::string *)v24.__r_.__value_.__r.__words[0];
      if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v24.__r_.__value_.__r.__words[2]);
      else
        size = v24.__r_.__value_.__l.__size_;
      snprintf((char *)v16, size, "Error: '%s' failed", "is_trained");
      exception = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(exception, &v24, "virtual void faiss::IndexIVF::update_vectors(int, const idx_t *, const float *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 959);
    }
    std::vector<long long>::vector(&v24, a2);
    (*(void (**)(_QWORD, _QWORD, const float *, std::string::size_type, uint64_t))(**((_QWORD **)this + 5)
                                                                                           + 56))(*((_QWORD *)this + 5), a2, a4, v24.__r_.__value_.__r.__words[0], 1);
    std::vector<unsigned char>::vector(&__p, *((_QWORD *)this + 16) * a2);
    (*(void (**)(faiss::IndexIVF *, _QWORD, const float *, std::string::size_type, std::string::size_type, _QWORD))(*(_QWORD *)this + 160))(this, a2, a4, v24.__r_.__value_.__r.__words[0], __p.__r_.__value_.__r.__words[0], 0);
    faiss::DirectMap::update_codes(v9, *((faiss::InvertedLists **)this + 14), a2, a3, (uint64_t *)v24.__r_.__value_.__l.__data_, (const unsigned __int8 *)__p.__r_.__value_.__l.__data_);
    if (__p.__r_.__value_.__r.__words[0])
    {
      __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v24.__r_.__value_.__r.__words[0])
    {
      v24.__r_.__value_.__l.__size_ = v24.__r_.__value_.__r.__words[0];
      operator delete(v24.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    if (v8 != 2)
    {
      memset(&v24, 0, sizeof(v24));
      v11 = snprintf(0, 0, "Error: '%s' failed", "direct_map.type == DirectMap::Array");
      std::string::resize(&v24, v11 + 1, 0);
      if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v12 = &v24;
      else
        v12 = (std::string *)v24.__r_.__value_.__r.__words[0];
      if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v13 = HIBYTE(v24.__r_.__value_.__r.__words[2]);
      else
        v13 = v24.__r_.__value_.__l.__size_;
      snprintf((char *)v12, v13, "Error: '%s' failed", "direct_map.type == DirectMap::Array");
      v14 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v14, &v24, "virtual void faiss::IndexIVF::update_vectors(int, const idx_t *, const float *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 955);
    }
    faiss::IDSelectorArray::IDSelectorArray(&v24, a2, (const uint64_t *)a3);
    if ((*(uint64_t (**)(faiss::IndexIVF *, std::string *))(*(_QWORD *)this + 72))(this, &v24) != a2)
    {
      memset(&__p, 0, sizeof(__p));
      v19 = snprintf(0, 0, "Error: '%s' failed: did not find all entries to remove", "nremove == n");
      std::string::resize(&__p, v19 + 1, 0);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v21 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        v21 = __p.__r_.__value_.__l.__size_;
      snprintf((char *)p_p, v21, "Error: '%s' failed: did not find all entries to remove", "nremove == n");
      v22 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v22, &__p, "virtual void faiss::IndexIVF::update_vectors(int, const idx_t *, const float *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 950);
    }
    (*(void (**)(faiss::IndexIVF *, _QWORD, const float *, unint64_t *))(*(_QWORD *)this + 32))(this, a2, a4, a3);
  }
}

void sub_1D491B0E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  void *v22;

  __cxa_free_exception(v22);
  if (a16 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t faiss::IndexIVF::train(faiss::IndexIVF *this, unint64_t a2, const float *a3)
{
  _BOOL4 v6;
  uint64_t result;

  if (*((_BYTE *)this + 24))
  {
    puts("Training level-1 quantizer");
    v6 = *((_BYTE *)this + 24) != 0;
  }
  else
  {
    v6 = 0;
  }
  faiss::Level1Quantizer::train_q1((_QWORD *)this + 5, a2, a3, v6, *((_DWORD *)this + 7));
  if (*((_BYTE *)this + 24))
    puts("Training IVF residual");
  result = (*(uint64_t (**)(faiss::IndexIVF *, unint64_t, const float *))(*(_QWORD *)this + 168))(this, a2, a3);
  *((_BYTE *)this + 25) = 1;
  return result;
}

uint64_t faiss::IndexIVF::train_residual(uint64_t this, uint64_t a2, const float *a3)
{
  if (*(_BYTE *)(this + 24))
    return puts("IndexIVF: no residual training");
  return this;
}

BOOL faiss::IndexIVF::check_compatible_for_merge(faiss::IndexIVF *this, const faiss::IndexIVF *a2)
{
  _BOOL8 result;
  int v5;
  std::string *v6;
  size_t size;
  void *exception;
  int v9;
  std::string *v10;
  size_t v11;
  void *v12;
  int v13;
  std::string *v14;
  size_t v15;
  void *v16;
  int v17;
  std::string *v18;
  size_t v19;
  void *v20;
  int v21;
  std::string *v22;
  size_t v23;
  void *v24;
  std::string v25;

  if (*((_DWORD *)a2 + 2) != *((_DWORD *)this + 2))
  {
    memset(&v25, 0, sizeof(v25));
    v5 = snprintf(0, 0, "Error: '%s' failed", "other.d == d");
    std::string::resize(&v25, v5 + 1, 0);
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v6 = &v25;
    else
      v6 = (std::string *)v25.__r_.__value_.__r.__words[0];
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v25.__r_.__value_.__r.__words[2]);
    else
      size = v25.__r_.__value_.__l.__size_;
    snprintf((char *)v6, size, "Error: '%s' failed", "other.d == d");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v25, "void faiss::IndexIVF::check_compatible_for_merge(const IndexIVF &) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 991);
  }
  if (*((_QWORD *)a2 + 6) != *((_QWORD *)this + 6))
  {
    memset(&v25, 0, sizeof(v25));
    v9 = snprintf(0, 0, "Error: '%s' failed", "other.nlist == nlist");
    std::string::resize(&v25, v9 + 1, 0);
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v10 = &v25;
    else
      v10 = (std::string *)v25.__r_.__value_.__r.__words[0];
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v11 = HIBYTE(v25.__r_.__value_.__r.__words[2]);
    else
      v11 = v25.__r_.__value_.__l.__size_;
    snprintf((char *)v10, v11, "Error: '%s' failed", "other.nlist == nlist");
    v12 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v12, &v25, "void faiss::IndexIVF::check_compatible_for_merge(const IndexIVF &) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 992);
  }
  if (*((_QWORD *)a2 + 16) != *((_QWORD *)this + 16))
  {
    memset(&v25, 0, sizeof(v25));
    v13 = snprintf(0, 0, "Error: '%s' failed", "other.code_size == code_size");
    std::string::resize(&v25, v13 + 1, 0);
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v14 = &v25;
    else
      v14 = (std::string *)v25.__r_.__value_.__r.__words[0];
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v15 = HIBYTE(v25.__r_.__value_.__r.__words[2]);
    else
      v15 = v25.__r_.__value_.__l.__size_;
    snprintf((char *)v14, v15, "Error: '%s' failed", "other.code_size == code_size");
    v16 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v16, &v25, "void faiss::IndexIVF::check_compatible_for_merge(const IndexIVF &) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 993);
  }
  result = std::type_info::operator==[abi:ne180100](*(_QWORD *)(*(_QWORD *)this - 8), *(_QWORD *)(*(_QWORD *)a2 - 8));
  if (!result)
  {
    memset(&v25, 0, sizeof(v25));
    v17 = snprintf(0, 0, "Error: '%s' failed: can only merge indexes of the same type", "typeid(*this) == typeid(other)");
    std::string::resize(&v25, v17 + 1, 0);
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v18 = &v25;
    else
      v18 = (std::string *)v25.__r_.__value_.__r.__words[0];
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v19 = HIBYTE(v25.__r_.__value_.__r.__words[2]);
    else
      v19 = v25.__r_.__value_.__l.__size_;
    snprintf((char *)v18, v19, "Error: '%s' failed: can only merge indexes of the same type", "typeid(*this) == typeid(other)");
    v20 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v20, &v25, "void faiss::IndexIVF::check_compatible_for_merge(const IndexIVF &) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 996);
  }
  if (*((_DWORD *)this + 40) | *((_DWORD *)a2 + 40))
  {
    memset(&v25, 0, sizeof(v25));
    v21 = snprintf(0, 0, "Error: '%s' failed: merge direct_map not implemented", "this->direct_map.no() && other.direct_map.no()");
    std::string::resize(&v25, v21 + 1, 0);
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v22 = &v25;
    else
      v22 = (std::string *)v25.__r_.__value_.__r.__words[0];
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v23 = HIBYTE(v25.__r_.__value_.__r.__words[2]);
    else
      v23 = v25.__r_.__value_.__l.__size_;
    snprintf((char *)v22, v23, "Error: '%s' failed: merge direct_map not implemented", "this->direct_map.no() && other.direct_map.no()");
    v24 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v24, &v25, "void faiss::IndexIVF::check_compatible_for_merge(const IndexIVF &) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 999);
  }
  return result;
}

void sub_1D491B600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

_QWORD *faiss::IndexIVF::merge_from(faiss::IndexIVF *this, faiss::InvertedLists **a2, uint64_t a3)
{
  _QWORD *result;

  faiss::IndexIVF::check_compatible_for_merge(this, (const faiss::IndexIVF *)a2);
  result = faiss::InvertedLists::merge_from(*((_QWORD **)this + 14), a2[14], a3);
  *((_QWORD *)this + 2) += a2[2];
  a2[2] = 0;
  return result;
}

uint64_t faiss::IndexIVF::replace_invlists(uint64_t this, faiss::InvertedLists *a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  int v8;
  std::string *v9;
  size_t size;
  void *exception;
  int v12;
  std::string *v13;
  size_t v14;
  void *v15;
  std::string v16;

  v5 = this;
  if (*(_BYTE *)(this + 120))
  {
    this = *(_QWORD *)(this + 112);
    if (this)
      this = (*(uint64_t (**)(uint64_t))(*(_QWORD *)this + 120))(this);
    *(_QWORD *)(v5 + 112) = 0;
  }
  if (a2)
  {
    if (*((_QWORD *)a2 + 1) != *(_QWORD *)(v5 + 48))
    {
      memset(&v16, 0, sizeof(v16));
      v8 = snprintf(0, 0, "Error: '%s' failed", "il->nlist == nlist");
      std::string::resize(&v16, v8 + 1, 0);
      if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v9 = &v16;
      else
        v9 = (std::string *)v16.__r_.__value_.__r.__words[0];
      if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v16.__r_.__value_.__r.__words[2]);
      else
        size = v16.__r_.__value_.__l.__size_;
      snprintf((char *)v9, size, "Error: '%s' failed", "il->nlist == nlist");
      exception = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(exception, &v16, "void faiss::IndexIVF::replace_invlists(InvertedLists *, BOOL)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 1018);
    }
    v6 = *((_QWORD *)a2 + 2);
    if (v6 != -1 && v6 != *(_QWORD *)(v5 + 128))
    {
      memset(&v16, 0, sizeof(v16));
      v12 = snprintf(0, 0, "Error: '%s' failed", "il->code_size == code_size || il->code_size == InvertedLists::INVALID_CODE_SIZE");
      std::string::resize(&v16, v12 + 1, 0);
      if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v13 = &v16;
      else
        v13 = (std::string *)v16.__r_.__value_.__r.__words[0];
      if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v14 = HIBYTE(v16.__r_.__value_.__r.__words[2]);
      else
        v14 = v16.__r_.__value_.__l.__size_;
      snprintf((char *)v13, v14, "Error: '%s' failed", "il->code_size == code_size || il->code_size == InvertedLists::INVALID_CODE_SIZE");
      v15 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v15, &v16, "void faiss::IndexIVF::replace_invlists(InvertedLists *, BOOL)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 1021);
    }
  }
  *(_QWORD *)(v5 + 112) = a2;
  *(_BYTE *)(v5 + 120) = a3;
  return this;
}

void sub_1D491B87C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t faiss::IndexIVF::copy_subset_to(uint64_t this, faiss::IndexIVF *a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  std::string *v31;
  size_t size;
  void *exception;
  int v34;
  std::string *v35;
  size_t v36;
  void *v37;
  int v38;
  std::string *v39;
  size_t v40;
  void *v41;
  int v42;
  std::string *v43;
  size_t v44;
  void *v45;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  std::string v58;

  v5 = *(_QWORD *)(this + 48);
  if (v5 != *((_QWORD *)a2 + 6))
  {
    memset(&v58, 0, sizeof(v58));
    v30 = snprintf(0, 0, "Error: '%s' failed", "nlist == other.nlist");
    std::string::resize(&v58, v30 + 1, 0);
    if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v31 = &v58;
    else
      v31 = (std::string *)v58.__r_.__value_.__r.__words[0];
    if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v58.__r_.__value_.__r.__words[2]);
    else
      size = v58.__r_.__value_.__l.__size_;
    snprintf((char *)v31, size, "Error: '%s' failed", "nlist == other.nlist");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v58, "virtual void faiss::IndexIVF::copy_subset_to(IndexIVF &, int, idx_t, idx_t) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 1032);
  }
  v6 = this;
  if (*(_QWORD *)(this + 128) != *((_QWORD *)a2 + 16))
  {
    memset(&v58, 0, sizeof(v58));
    v34 = snprintf(0, 0, "Error: '%s' failed", "code_size == other.code_size");
    std::string::resize(&v58, v34 + 1, 0);
    if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v35 = &v58;
    else
      v35 = (std::string *)v58.__r_.__value_.__r.__words[0];
    if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v36 = HIBYTE(v58.__r_.__value_.__r.__words[2]);
    else
      v36 = v58.__r_.__value_.__l.__size_;
    snprintf((char *)v35, v36, "Error: '%s' failed", "code_size == other.code_size");
    v37 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v37, &v58, "virtual void faiss::IndexIVF::copy_subset_to(IndexIVF &, int, idx_t, idx_t) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 1033);
  }
  if (*((_DWORD *)a2 + 40))
  {
    memset(&v58, 0, sizeof(v58));
    v38 = snprintf(0, 0, "Error: '%s' failed", "other.direct_map.no()");
    std::string::resize(&v58, v38 + 1, 0);
    if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v39 = &v58;
    else
      v39 = (std::string *)v58.__r_.__value_.__r.__words[0];
    if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v40 = HIBYTE(v58.__r_.__value_.__r.__words[2]);
    else
      v40 = v58.__r_.__value_.__l.__size_;
    snprintf((char *)v39, v40, "Error: '%s' failed", "other.direct_map.no()");
    v41 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v41, &v58, "virtual void faiss::IndexIVF::copy_subset_to(IndexIVF &, int, idx_t, idx_t) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 1034);
  }
  v7 = a3;
  if (a3 >= 3)
  {
    memset(&v58, 0, sizeof(v58));
    v42 = snprintf(0, 0, "Error: '%s' failed: subset type %d not implemented", "subset_type == 0 || subset_type == 1 || subset_type == 2", a3);
    std::string::resize(&v58, v42 + 1, 0);
    if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v43 = &v58;
    else
      v43 = (std::string *)v58.__r_.__value_.__r.__words[0];
    if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v44 = HIBYTE(v58.__r_.__value_.__r.__words[2]);
    else
      v44 = v58.__r_.__value_.__l.__size_;
    snprintf((char *)v43, v44, "Error: '%s' failed: subset type %d not implemented", "subset_type == 0 || subset_type == 1 || subset_type == 2", a3);
    v45 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v45, &v58, "virtual void faiss::IndexIVF::copy_subset_to(IndexIVF &, int, idx_t, idx_t) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 1038);
  }
  if (v5)
  {
    v9 = 0;
    v49 = 0;
    v50 = 0;
    v54 = 0;
    v10 = *((_QWORD *)a2 + 14);
    while (1)
    {
      v11 = (***(uint64_t (****)(_QWORD, uint64_t))(v6 + 112))(*(_QWORD *)(v6 + 112), v9);
      v12 = *(_QWORD *)(v6 + 112);
      v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v12 + 16))(v12, v9);
      v56 = v13;
      if (v7)
      {
        if (v7 == 2)
        {
          v53 = v12;
          v18 = *(_QWORD *)(v6 + 16);
          v19 = (v11 + v54) * a4 / v18 - v49;
          v47 = (v11 + v54) * a5 / v18;
          v48 = (v11 + v54) * a4 / v18;
          v20 = v47 - v50;
          v26 = v47 - v50 > v19;
          v51 = v47 - v50 - v19;
          if (v26)
          {
            do
            {
              v21 = (*(uint64_t (**)(_QWORD, uint64_t, unint64_t))(**(_QWORD **)(v6 + 112) + 40))(*(_QWORD *)(v6 + 112), v9, v19);
              v22 = *(_QWORD *)(v6 + 112);
              v23 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(*(_QWORD *)v22 + 48))(v22, v9, v19);
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v10 + 64))(v10, v9, v21, v23);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v22 + 24))(v22, v9, v23);
              ++v19;
            }
            while (v19 < v20);
          }
          v13 = v56;
          v12 = v53;
          *((_QWORD *)a2 + 2) += v51;
          v7 = a3;
          v49 = v48;
          v50 = v47;
          goto LABEL_30;
        }
        if (v7 == 1 && v11)
        {
          v52 = v12;
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)(v13 + 8 * i) % a4 == a5)
            {
              v15 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(v6 + 112) + 40))(*(_QWORD *)(v6 + 112), v9, i);
              v16 = *(_QWORD *)(v6 + 112);
              v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v16 + 48))(v16, v9, i);
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v10 + 64))(v10, v9, v15, v17);
              (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v16 + 24))(v16, v9, v17);
              v13 = v56;
              ++*((_QWORD *)a2 + 2);
            }
          }
LABEL_29:
          v12 = v52;
        }
      }
      else if (v11)
      {
        v52 = v12;
        for (j = 0; j != v11; ++j)
        {
          v25 = *(_QWORD *)(v13 + 8 * j);
          v26 = v25 >= a4 && v25 < a5;
          if (v26)
          {
            v27 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(v6 + 112) + 40))(*(_QWORD *)(v6 + 112), v9, j);
            v28 = *(_QWORD *)(v6 + 112);
            v29 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v28 + 48))(v28, v9, j);
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v10 + 64))(v10, v9, v27, v29);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v28 + 24))(v28, v9, v29);
            v13 = v56;
            ++*((_QWORD *)a2 + 2);
          }
        }
        goto LABEL_29;
      }
LABEL_30:
      this = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v12 + 32))(v12, v9, v13);
      v54 += v11;
      if ((unint64_t)++v9 >= *(_QWORD *)(v6 + 48))
        goto LABEL_33;
    }
  }
  v54 = 0;
LABEL_33:
  if (v54 != *(_QWORD *)(v6 + 16))
    faiss::IndexIVF::copy_subset_to();
  return this;
}

void sub_1D491BEDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  void *v27;

  __cxa_free_exception(v27);
  if (a27 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void sub_1D491BFA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v1 + 24))(v1, v0, v2);
  JUMPOUT(0x1D491BF88);
}

void faiss::IndexIVF::~IndexIVF(faiss::IndexIVF *this)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  *(_QWORD *)this = off_1E9806D68;
  if (*((_BYTE *)this + 120))
  {
    v2 = *((_QWORD *)this + 14);
    if (v2)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 120))(v2);
  }
  std::__hash_table<long long,std::hash<long long>,std::equal_to<long long>,std::allocator<long long>>::~__hash_table((uint64_t)this + 192);
  v3 = (void *)*((_QWORD *)this + 21);
  if (v3)
  {
    *((_QWORD *)this + 22) = v3;
    operator delete(v3);
  }
  if (*((_BYTE *)this + 57))
  {
    v4 = *((_QWORD *)this + 5);
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  }
  faiss::Index::~Index(this);
}

double faiss::IndexIVFStats::reset(faiss::IndexIVFStats *this)
{
  double result;

  result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  return result;
}

void faiss::InvertedListScanner::scan_codes_range()
{
  void *exception;
  _QWORD v1[3];

  exception = __cxa_allocate_exception(0x20uLL);
  std::string::basic_string[abi:ne180100]<0>(v1, "scan_codes_range not implemented");
  faiss::FaissException::FaissException(exception, v1, "virtual void faiss::InvertedListScanner::scan_codes_range(size_t, const uint8_t *, const idx_t *, float, RangeQueryResult &) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 1126);
}

void sub_1D491C0DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

faiss::InvertedLists::ScopedIds *std::unique_ptr<faiss::InvertedLists::ScopedIds>::reset[abi:ne180100](faiss::InvertedLists::ScopedIds **a1, faiss::InvertedLists::ScopedIds *a2)
{
  faiss::InvertedLists::ScopedIds *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    faiss::InvertedLists::ScopedIds::~ScopedIds(result);
    JUMPOUT(0x1D82628A4);
  }
  return result;
}

void faiss::InvertedLists::ScopedIds::~ScopedIds(faiss::InvertedLists::ScopedIds *this)
{
  (*(void (**)(_QWORD, _QWORD, _QWORD))(**(_QWORD **)this + 32))(*(_QWORD *)this, *((_QWORD *)this + 2), *((_QWORD *)this + 1));
}

_QWORD *std::vector<faiss::IndexIVFStats>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;
  size_t v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<faiss::IndexIVFStats>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    v5 = 48 * ((48 * a2 - 48) / 0x30) + 48;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_1D491C208(_Unwind_Exception *exception_object)
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

char *std::vector<faiss::IndexIVFStats>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x555555555555556)
    std::vector<long long>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<faiss::ReservoirTopN<faiss::CMin<float,long long>>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[48 * v4];
  return result;
}

_QWORD *std::vector<faiss::RangeSearchPartialResult *>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<long long>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_1D491C2CC(_Unwind_Exception *exception_object)
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

_QWORD *std::vector<faiss::RangeQueryResult *>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<long long>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_1D491C340(_Unwind_Exception *exception_object)
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

void faiss::IndexIVF::copy_subset_to()
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "Faiss assertion '%s' failed in %s at %s:%d\n", "accu_n == ntotal", "virtual void faiss::IndexIVF::copy_subset_to(IndexIVF &, int, idx_t, idx_t) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/IndexIVF.cpp", 1093);
  abort();
}

uint64_t faiss::VectorTransform::apply(faiss::VectorTransform *this, uint64_t a2, const float *a3)
{
  uint64_t v6;

  v6 = operator new[]();
  (*(void (**)(faiss::VectorTransform *, uint64_t, const float *, uint64_t))(*(_QWORD *)this + 8))(this, a2, a3, v6);
  return v6;
}

void faiss::VectorTransform::reverse_transform(faiss::VectorTransform *this, uint64_t a2, const float *a3, float *a4)
{
  void *exception;
  _QWORD v5[3];

  exception = __cxa_allocate_exception(0x20uLL);
  std::string::basic_string[abi:ne180100]<0>(v5, "reverse transform not implemented");
  faiss::FaissException::FaissException(exception, v5, "virtual void faiss::VectorTransform::reverse_transform(idx_t, const float *, float *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 149);
}

void sub_1D491C49C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

double faiss::LinearTransform::LinearTransform(faiss::LinearTransform *this, int a2, int a3, char a4)
{
  double result;

  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = a3;
  *(_QWORD *)this = &off_1E9805FC8;
  *((_BYTE *)this + 17) = a4;
  *((_BYTE *)this + 18) = 0;
  *((_BYTE *)this + 16) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_BYTE *)this + 72) = 0;
  return result;
}

{
  double result;

  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = a3;
  *(_QWORD *)this = &off_1E9805FC8;
  *((_BYTE *)this + 17) = a4;
  *((_BYTE *)this + 18) = 0;
  *((_BYTE *)this + 16) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_BYTE *)this + 72) = 0;
  return result;
}

uint64_t faiss::LinearTransform::apply_noalloc(faiss::LinearTransform *this, uint64_t a2, float *b, float *c__)
{
  int *v4;
  uint64_t v5;
  float v6;
  uint64_t v7;
  float *v8;
  uint64_t v9;
  int *v10;
  int v11;
  float *v12;
  int v13;
  int v15;
  std::string *p_alpha;
  size_t size;
  void *exception;
  int v19;
  std::string *v20;
  size_t v21;
  void *v22;
  int v23;
  std::string *v24;
  size_t v25;
  void *v26;
  int lda;
  int n;
  int m;
  float beta;
  std::string alpha;

  if (!*((_BYTE *)this + 16))
  {
    memset(&alpha, 0, sizeof(alpha));
    v15 = snprintf(0, 0, "Error: '%s' failed: Transformation not trained yet", "is_trained");
    std::string::resize(&alpha, v15 + 1, 0);
    if ((alpha.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_alpha = &alpha;
    else
      p_alpha = (std::string *)alpha.__r_.__value_.__r.__words[0];
    if ((alpha.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(alpha.__r_.__value_.__r.__words[2]);
    else
      size = alpha.__r_.__value_.__l.__size_;
    snprintf((char *)p_alpha, size, "Error: '%s' failed: Transformation not trained yet", "is_trained");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &alpha, "virtual void faiss::LinearTransform::apply_noalloc(Index::idx_t, const float *, float *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 167);
  }
  if (*((_BYTE *)this + 17))
  {
    v4 = (int *)*((_QWORD *)this + 6);
    v5 = *((int *)this + 3);
    if (v5 != (uint64_t)(*((_QWORD *)this + 7) - (_QWORD)v4) >> 2)
    {
      memset(&alpha, 0, sizeof(alpha));
      v23 = snprintf(0, 0, "Error: '%s' failed: Bias not initialized", "b.size() == d_out");
      std::string::resize(&alpha, v23 + 1, 0);
      if ((alpha.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v24 = &alpha;
      else
        v24 = (std::string *)alpha.__r_.__value_.__r.__words[0];
      if ((alpha.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v25 = HIBYTE(alpha.__r_.__value_.__r.__words[2]);
      else
        v25 = alpha.__r_.__value_.__l.__size_;
      snprintf((char *)v24, v25, "Error: '%s' failed: Bias not initialized", "b.size() == d_out");
      v26 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v26, &alpha, "virtual void faiss::LinearTransform::apply_noalloc(Index::idx_t, const float *, float *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 171);
    }
    v6 = 1.0;
    if (a2 >= 1)
    {
      v7 = 0;
      v8 = c__;
      do
      {
        v9 = v5;
        v10 = v4;
        if ((int)v5 >= 1)
        {
          do
          {
            v11 = *v10++;
            *(_DWORD *)v8++ = v11;
            --v9;
          }
          while (v9);
        }
        ++v7;
      }
      while (v7 != a2);
    }
  }
  else
  {
    LODWORD(v5) = *((_DWORD *)this + 3);
    v6 = 0.0;
  }
  beta = v6;
  v12 = (float *)*((_QWORD *)this + 3);
  v13 = *((_DWORD *)this + 2);
  if (v13 * (_DWORD)v5 != (uint64_t)(*((_QWORD *)this + 4) - (_QWORD)v12) >> 2)
  {
    memset(&alpha, 0, sizeof(alpha));
    v19 = snprintf(0, 0, "Error: '%s' failed: Transformation matrix not initialized", "A.size() == d_out * d_in");
    std::string::resize(&alpha, v19 + 1, 0);
    if ((alpha.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v20 = &alpha;
    else
      v20 = (std::string *)alpha.__r_.__value_.__r.__words[0];
    if ((alpha.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v21 = HIBYTE(alpha.__r_.__value_.__r.__words[2]);
    else
      v21 = alpha.__r_.__value_.__l.__size_;
    snprintf((char *)v20, v21, "Error: '%s' failed: Transformation matrix not initialized", "A.size() == d_out * d_in");
    v22 = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(v22, &alpha, "virtual void faiss::LinearTransform::apply_noalloc(Index::idx_t, const float *, float *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 182);
  }
  LODWORD(alpha.__r_.__value_.__l.__data_) = 1065353216;
  n = a2;
  m = v5;
  lda = v13;
  return sgemm_("Transposed", "Not transposed", &m, &n, &lda, (float *)&alpha, v12, &lda, b, &lda, &beta, c__, &m);
}

void sub_1D491C848(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  __cxa_free_exception(v1);
  if (*(char *)(v2 - 17) < 0)
    operator delete(*(void **)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t faiss::LinearTransform::transform_transpose(faiss::LinearTransform *this, uint64_t a2, float *b, float *c__)
{
  const float *v8;
  uint64_t v9;
  uint64_t v10;
  float *v11;
  float *v12;
  uint64_t v13;
  float v14;
  float v15;
  float v16;
  int v17;
  uint64_t result;
  float beta;
  float alpha;
  int n;
  int k;
  int lda;

  if (*((_BYTE *)this + 17))
  {
    v8 = (const float *)operator new[]();
    if (a2 >= 1)
    {
      v9 = 0;
      v10 = *((unsigned int *)this + 3);
      v11 = (float *)v8;
      do
      {
        if ((int)v10 >= 1)
        {
          v12 = (float *)*((_QWORD *)this + 6);
          v13 = v10;
          do
          {
            v14 = *b++;
            v15 = v14;
            v16 = *v12++;
            *v11++ = v15 - v16;
            --v13;
          }
          while (v13);
        }
        ++v9;
      }
      while (v9 != a2);
    }
    b = (float *)v8;
  }
  v17 = *((_DWORD *)this + 2);
  k = *((_DWORD *)this + 3);
  lda = v17;
  n = a2;
  beta = 0.0;
  alpha = 1.0;
  result = sgemm_("Not", "Not", &lda, &n, &k, &alpha, *((float **)this + 3), &lda, b, &k, &beta, c__, &lda);
  if (b)
  {
    if (*((_BYTE *)this + 17))
      return MEMORY[0x1D826288C](b, 0x1000C8052888210);
  }
  return result;
}

void faiss::LinearTransform::set_is_orthonormal(faiss::LinearTransform *this)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  float *v6;
  uint64_t v7;
  float *v8;
  uint64_t v9;
  float *v10;
  float v11;
  int v12;
  float alpha;
  int n;
  int lda;
  float *c__[3];

  v3 = *((_DWORD *)this + 2);
  v2 = *((_DWORD *)this + 3);
  if (v2 > v3)
  {
    *((_BYTE *)this + 18) = 0;
    return;
  }
  if (!v2)
  {
    *((_BYTE *)this + 18) = 1;
    return;
  }
  if (v3 * v2 > (unint64_t)((uint64_t)(*((_QWORD *)this + 4) - *((_QWORD *)this + 3)) >> 2))
    faiss::LinearTransform::set_is_orthonormal();
  std::vector<float>::vector(c__, (v2 * v2));
  v4 = *((_DWORD *)this + 3);
  lda = *((_DWORD *)this + 2);
  alpha = 1.0;
  n = v4;
  v12 = 0;
  sgemm_("Transposed", "Not", &n, &n, &lda, &alpha, *((float **)this + 3), &lda, *((float **)this + 3), &lda, (float *)&v12, c__[0], &n);
  *((_BYTE *)this + 18) = 1;
  v5 = *((int *)this + 3);
  v6 = c__[0];
  if ((int)v5 < 1)
  {
    if (!c__[0])
      return;
  }
  else
  {
    v7 = 0;
    v8 = c__[0];
    do
    {
      v9 = 0;
      v10 = v8;
      do
      {
        v11 = *v10;
        if (v7 == v9)
          v11 = *v10 + -1.0;
        if (fabsf(v11) > 0.00004)
          *((_BYTE *)this + 18) = 0;
        ++v9;
        v10 += v5;
      }
      while (v5 != v9);
      ++v7;
      ++v8;
    }
    while (v7 != v5);
  }
  c__[1] = v6;
  operator delete(v6);
}

void sub_1D491CB0C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 - 40);
  if (v3)
  {
    *(_QWORD *)(v1 - 32) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t faiss::LinearTransform::reverse_transform(faiss::LinearTransform *this, uint64_t a2, float *a3, float *a4)
{
  void *exception;
  _QWORD v6[3];

  if (!*((_BYTE *)this + 18))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v6, "reverse transform not implemented for non-orthonormal matrices");
    faiss::FaissException::FaissException(exception, v6, "virtual void faiss::LinearTransform::reverse_transform(idx_t, const float *, float *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 289);
  }
  return faiss::LinearTransform::transform_transpose(this, a2, a3, a4);
}

void sub_1D491CBB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

uint64_t faiss::LinearTransform::print_if_verbose(uint64_t result, const char *a2, _QWORD *a3, int a4, int a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  std::string *v13;
  size_t size;
  void *exception;
  std::string v16;

  if (*(_BYTE *)(result + 72))
  {
    printf("matrix %s: %d*%d [\n", a2, a4, a5);
    if (a5 * a4 > (unint64_t)((uint64_t)(a3[1] - *a3) >> 3))
    {
      memset(&v16, 0, sizeof(v16));
      v12 = snprintf(0, 0, "Error: '%s' failed", "mat.size() >= n * d");
      std::string::resize(&v16, v12 + 1, 0);
      if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v13 = &v16;
      else
        v13 = (std::string *)v16.__r_.__value_.__r.__words[0];
      if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v16.__r_.__value_.__r.__words[2]);
      else
        size = v16.__r_.__value_.__l.__size_;
      snprintf((char *)v13, size, "Error: '%s' failed", "mat.size() >= n * d");
      exception = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(exception, &v16, "void faiss::LinearTransform::print_if_verbose(const char *, const std::vector<double> &, int, int) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 301);
    }
    if (a4 >= 1)
    {
      v8 = 0;
      v9 = 0;
      do
      {
        v10 = a5;
        v11 = v8;
        if (a5 >= 1)
        {
          do
          {
            printf("%10.5g ", *(double *)(*a3 + v11));
            v11 += 8;
            --v10;
          }
          while (v10);
        }
        putchar(10);
        ++v9;
        v8 += 8 * a5;
      }
      while (v9 != a4);
    }
    return puts("]");
  }
  return result;
}

void sub_1D491CDB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  void *v17;

  __cxa_free_exception(v17);
  if (a17 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void faiss::RandomRotationMatrix::init(faiss::RandomRotationMatrix *this)
{
  int v2;
  int v3;
  char *v4;
  faiss *v5;
  float *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  faiss *v11;
  uint64_t v12;
  faiss *v13;
  faiss *v14;
  int v15;
  faiss *v16;
  float *v17;

  v3 = *((_DWORD *)this + 2);
  v2 = *((_DWORD *)this + 3);
  v4 = (char *)this + 24;
  if (v2 <= v3)
  {
    std::vector<float>::resize((uint64_t)this + 24, v3 * v2);
    v16 = (faiss *)*((_QWORD *)this + 3);
    faiss::float_randn(v16, (float *)(*((int *)this + 2) * (uint64_t)*((int *)this + 3)));
    faiss::matrix_qr((faiss *)*((unsigned int *)this + 2), *((_DWORD *)this + 3), (__CLPK_real *)v16, v17);
  }
  else
  {
    std::vector<float>::resize((uint64_t)this + 24, (v2 * v2));
    v5 = (faiss *)*((_QWORD *)this + 3);
    faiss::float_randn(v5, (float *)(*((_DWORD *)this + 3) * *((_DWORD *)this + 3)));
    faiss::matrix_qr((faiss *)*((unsigned int *)this + 3), *((_DWORD *)this + 3), (__CLPK_real *)v5, v6);
    v7 = *((unsigned int *)this + 3);
    v8 = *((int *)this + 2);
    v9 = *((unsigned int *)this + 2);
    if ((int)v7 >= 1)
    {
      v10 = 0;
      v11 = v5;
      do
      {
        if ((int)v8 >= 1)
        {
          v12 = v9;
          v13 = v5;
          v14 = v11;
          do
          {
            v15 = *(_DWORD *)v13;
            v13 = (faiss *)((char *)v13 + 4);
            *(_DWORD *)v14 = v15;
            v14 = (faiss *)((char *)v14 + 4);
            --v12;
          }
          while (v12);
        }
        ++v10;
        v11 = (faiss *)((char *)v11 + 4 * v8);
        v5 = (faiss *)((char *)v5 + 4 * v7);
      }
      while (v10 != v7);
    }
    std::vector<float>::resize((uint64_t)v4, (int)v9 * (int)v7);
  }
  *((_BYTE *)this + 18) = 1;
  *((_BYTE *)this + 16) = 1;
}

void faiss::RandomRotationMatrix::train(faiss::RandomRotationMatrix *this, uint64_t a2, const float *a3)
{
  faiss::RandomRotationMatrix::init(this);
}

uint64_t faiss::PCAMatrix::PCAMatrix(uint64_t this, int a2, int a3, float a4, char a5)
{
  *(_DWORD *)(this + 8) = a2;
  *(_DWORD *)(this + 12) = a3;
  *(_BYTE *)(this + 18) = 0;
  *(_OWORD *)(this + 24) = 0u;
  *(_OWORD *)(this + 40) = 0u;
  *(_OWORD *)(this + 56) = 0u;
  *(_BYTE *)(this + 72) = 0;
  *(_QWORD *)this = &off_1E9806F70;
  *(float *)(this + 76) = a4;
  *(_BYTE *)(this + 80) = a5;
  *(_WORD *)(this + 16) = 256;
  *(_OWORD *)(this + 104) = 0u;
  *(_OWORD *)(this + 120) = 0u;
  *(_OWORD *)(this + 136) = 0u;
  *(_OWORD *)(this + 152) = 0u;
  *(_QWORD *)(this + 168) = 0;
  *(_QWORD *)(this + 88) = 1000;
  *(_DWORD *)(this + 96) = 0;
  return this;
}

{
  *(_DWORD *)(this + 8) = a2;
  *(_DWORD *)(this + 12) = a3;
  *(_BYTE *)(this + 18) = 0;
  *(_OWORD *)(this + 24) = 0u;
  *(_OWORD *)(this + 40) = 0u;
  *(_OWORD *)(this + 56) = 0u;
  *(_BYTE *)(this + 72) = 0;
  *(_QWORD *)this = &off_1E9806F70;
  *(float *)(this + 76) = a4;
  *(_BYTE *)(this + 80) = a5;
  *(_WORD *)(this + 16) = 256;
  *(_OWORD *)(this + 104) = 0u;
  *(_OWORD *)(this + 120) = 0u;
  *(_OWORD *)(this + 136) = 0u;
  *(_OWORD *)(this + 152) = 0u;
  *(_QWORD *)(this + 168) = 0;
  *(_QWORD *)(this + 88) = 1000;
  *(_DWORD *)(this + 96) = 0;
  return this;
}

void faiss::PCAMatrix::train(faiss::PCAMatrix *this, int *a2, const float *a3)
{
  const float *v5;
  float *v6;
  const float *v7;
  float **v8;
  unint64_t v9;
  _anonymous_namespace_ *v10;
  uint64_t v11;
  _anonymous_namespace_ *v12;
  float *v13;
  float *v14;
  uint64_t v15;
  float v16;
  float v17;
  float *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _anonymous_namespace_ *v22;
  unint64_t v23;
  float *v24;
  uint64_t v25;
  uint64_t v26;
  float *v27;
  float *v28;
  float *v29;
  uint64_t v30;
  float v31;
  float v32;
  float v33;
  float *v34;
  uint64_t v35;
  uint64_t i;
  uint64_t v37;
  float v38;
  int *v39;
  uint64_t v40;
  float *v41;
  double *v42;
  float v43;
  uint64_t v44;
  double *v45;
  float *v46;
  double v47;
  float v48;
  int v49;
  double *v50;
  float *v51;
  _anonymous_namespace_ *v52;
  double v53;
  float v54;
  int v55;
  float *v56;
  float *v57;
  uint64_t j;
  int v59;
  float v60;
  float *v61;
  float *c__;
  uint64_t v63;
  int v64;
  uint64_t v65;
  float v66;
  float *v67;
  float *v68;
  uint64_t v69;
  float *v70;
  float v71;
  int v72;
  int v73;
  float *v74;
  int v75;
  float v76;
  unint64_t v77;
  uint64_t v78;
  float *v79;
  float v80;
  unint64_t v81;
  uint64_t v82;
  float *v83;
  float *v84;
  double v85;
  float v86;
  uint64_t v87;
  float *v88;
  double *v89;
  double v90;
  float v91;
  float v92;
  int n[2];
  __CLPK_doublereal *v94;
  int lda[2];
  __CLPK_doublereal *v96;
  int beta;
  int alpha;
  float *b[3];
  int v100[2];
  float *v101;
  uint64_t v102;

  v102 = (uint64_t)a2;
  v5 = (const float *)faiss::fvecs_maybe_subsample((faiss *)*((int *)this + 2), (int **)&v102, (unint64_t *)(*((_QWORD *)this + 11) * *((int *)this + 2)), (uint64_t)a3, (const float *)*((unsigned __int8 *)this + 72), 0x4D2u);
  v6 = (float *)v5;
  if (v5 == a3)
    v7 = 0;
  else
    v7 = v5;
  v8 = (float **)((char *)this + 104);
  *((_QWORD *)this + 14) = *((_QWORD *)this + 13);
  v9 = *((int *)this + 2);
  v100[0] = 0;
  std::vector<float>::resize((uint64_t)this + 104, v9, v100);
  if (*((_BYTE *)this + 17))
  {
    v10 = (_anonymous_namespace_ *)v102;
    v11 = *((unsigned int *)this + 2);
    if (v102 >= 1)
    {
      v12 = 0;
      v13 = v6;
      do
      {
        if ((int)v11 >= 1)
        {
          v14 = *v8;
          v15 = v11;
          do
          {
            v16 = *v13++;
            *v14 = v16 + *v14;
            ++v14;
            --v15;
          }
          while (v15);
        }
        v12 = (_anonymous_namespace_ *)((char *)v12 + 1);
      }
      while (v12 != v10);
    }
    if ((int)v11 >= 1)
    {
      v17 = (float)(uint64_t)v10;
      v18 = *v8;
      do
      {
        *v18 = *v18 / v17;
        ++v18;
        --v11;
      }
      while (v11);
    }
  }
  if (*((_BYTE *)this + 72))
  {
    printf("mean=[");
    if (*((int *)this + 2) >= 1)
    {
      v19 = 0;
      do
        printf("%g ", *(float *)(*((_QWORD *)this + 13) + 4 * v19++));
      while (v19 < *((int *)this + 2));
    }
    puts("]");
  }
  v20 = *((int *)this + 2);
  if (v102 < v20)
  {
    std::vector<float>::vector(v100, v102 * v20);
    v21 = v102;
    if (v102)
    {
      v22 = 0;
      v23 = *((int *)this + 2);
      v24 = *(float **)v100;
      if (v23 <= 1)
        v25 = 1;
      else
        v25 = *((int *)this + 2);
      v26 = 4 * v23;
      do
      {
        if ((_DWORD)v23)
        {
          v27 = *v8;
          v28 = v6;
          v29 = v24;
          v30 = v25;
          do
          {
            v31 = *v28++;
            v32 = v31;
            v33 = *v27++;
            *v29++ = v32 - v33;
            --v30;
          }
          while (v30);
        }
        v22 = (_anonymous_namespace_ *)((char *)v22 + 1);
        v24 = (float *)((char *)v24 + v26);
        v6 = (float *)((char *)v6 + v26);
      }
      while (v22 != (_anonymous_namespace_ *)v21);
    }
    std::vector<float>::vector(b, v21 * v21);
    lda[0] = *((_DWORD *)this + 2);
    n[0] = v102;
    beta = 0;
    alpha = 1065353216;
    ssyrk_("Up", "Transposed", n, lda, (float *)&alpha, *(float **)v100, lda, (float *)&beta, b[0], n);
    if (*((_BYTE *)this + 72))
    {
      if (*((int *)this + 2) <= 10)
      {
        v34 = b[0];
        puts("gram=");
        v35 = v102;
        if (v102 >= 1)
        {
          for (i = 0; i < v102; ++i)
          {
            if (v35 >= 1)
            {
              v37 = 0;
              do
              {
                v38 = *v34++;
                printf("%10g ", v38);
                ++v37;
              }
              while (v102 > v37);
            }
            putchar(10);
            v35 = v102;
          }
        }
      }
    }
    std::vector<double>::vector(lda, v102 * v102);
    v39 = (int *)v102;
    if (v102)
    {
      v40 = v102 * v102;
      v41 = b[0];
      v42 = *(double **)lda;
      if ((unint64_t)(v102 * v102) <= 1)
        v40 = 1;
      do
      {
        v43 = *v41++;
        *v42++ = v43;
        --v40;
      }
      while (v40);
    }
    std::vector<double>::vector(n, (unint64_t)v39);
    std::vector<float>::resize((uint64_t)this + 152, v102 * *((int *)this + 2));
    if (v102)
    {
      v44 = v102 * v102;
      v45 = *(double **)lda;
      v46 = b[0];
      if ((unint64_t)(v102 * v102) <= 1)
        v44 = 1;
      do
      {
        v47 = *v45++;
        v48 = v47;
        *v46++ = v48;
        --v44;
      }
      while (v44);
    }
    std::vector<float>::resize((uint64_t)this + 128, *((int *)this + 2));
    v49 = v102;
    if (v102)
    {
      v50 = *(double **)n;
      v51 = (float *)*((_QWORD *)this + 16);
      v52 = (_anonymous_namespace_ *)v102;
      do
      {
        v53 = *v50++;
        v54 = v53;
        *v51++ = v54;
        v52 = (_anonymous_namespace_ *)((char *)v52 - 1);
      }
      while (v52);
    }
    v55 = *((_DWORD *)this + 2);
    beta = v49;
    alpha = v55;
    v92 = 1.0;
    sgemm_("Non", "Non Trans", &alpha, &beta, &beta, &v92, *(float **)v100, &alpha, b[0], &beta, &v92, *((float **)this + 19), &alpha);
    if (*((_BYTE *)this + 72))
    {
      if (*((int *)this + 2) <= 10)
      {
        v57 = (float *)*((_QWORD *)this + 19);
        puts("PCAMat=");
        if (v102 >= 1)
        {
          for (j = 0; j < v102; ++j)
          {
            if (*((int *)this + 2) >= 1)
            {
              v59 = 0;
              do
              {
                v60 = *v57++;
                printf("%10g ", v60);
                ++v59;
              }
              while (v59 < *((_DWORD *)this + 2));
            }
            putchar(10);
          }
        }
      }
    }
    faiss::fvec_renorm_L2(*((int *)this + 2), v102, *((float **)this + 19), v56);
    if (*(_QWORD *)n)
    {
      v94 = *(__CLPK_doublereal **)n;
      operator delete(*(void **)n);
    }
    if (*(_QWORD *)lda)
    {
      v96 = *(__CLPK_doublereal **)lda;
      operator delete(*(void **)lda);
    }
    v61 = b[0];
    goto LABEL_89;
  }
  std::vector<float>::resize((uint64_t)this + 152, (v20 * v20));
  c__ = (float *)*((_QWORD *)this + 19);
  v63 = *((unsigned int *)this + 2);
  v64 = v102;
  if ((int)v63 >= 1)
  {
    v65 = 0;
    v66 = (float)-v102;
    v67 = *v8;
    v68 = (float *)*((_QWORD *)this + 19);
    do
    {
      v69 = v63;
      v70 = v67;
      do
      {
        v71 = *v70++;
        *v68++ = (float)(v67[v65] * v66) * v71;
        --v69;
      }
      while (v69);
      ++v65;
    }
    while (v65 != v63);
    v64 = v102;
  }
  v100[0] = v63;
  LODWORD(b[0]) = v64;
  lda[0] = 1065353216;
  ssyrk_("Up", "Non transposed", v100, (int *)b, (float *)lda, v6, v100, (float *)lda, c__, v100);
  v72 = *((_DWORD *)this + 2);
  if (*((_BYTE *)this + 72))
  {
    if (v72 <= 10)
    {
      puts("cov=");
      v72 = *((_DWORD *)this + 2);
      if (v72 >= 1)
      {
        v73 = 0;
        v74 = c__;
        do
        {
          if (v72 >= 1)
          {
            v75 = 0;
            do
            {
              v76 = *v74++;
              printf("%10g ", v76);
              ++v75;
            }
            while (v75 < *((_DWORD *)this + 2));
          }
          putchar(10);
          ++v73;
          v72 = *((_DWORD *)this + 2);
        }
        while (v73 < v72);
      }
    }
  }
  std::vector<double>::vector(v100, (v72 * v72));
  v77 = *((int *)this + 2);
  if ((_DWORD)v77)
  {
    LODWORD(v78) = v77 * v77;
    v79 = *(float **)v100;
    if ((v77 * v77) <= 1)
      v78 = 1;
    else
      v78 = v78;
    do
    {
      v80 = *c__++;
      *(double *)v79 = v80;
      v79 += 2;
      --v78;
    }
    while (v78);
  }
  std::vector<double>::vector(b, v77);
  v81 = *((int *)this + 2);
  if ((_DWORD)v81)
  {
    LODWORD(v82) = v81 * v81;
    v83 = *(float **)v100;
    v84 = (float *)*((_QWORD *)this + 19);
    if ((v81 * v81) <= 1)
      v82 = 1;
    else
      v82 = v82;
    do
    {
      v85 = *(double *)v83;
      v83 += 2;
      v86 = v85;
      *v84++ = v86;
      --v82;
    }
    while (v82);
  }
  std::vector<float>::resize((uint64_t)this + 128, v81);
  v87 = *((int *)this + 2);
  v61 = b[0];
  if (!(_DWORD)v87)
  {
LABEL_89:
    if (!v61)
      goto LABEL_91;
    goto LABEL_90;
  }
  v88 = (float *)*((_QWORD *)this + 16);
  v89 = (double *)b[0];
  do
  {
    v90 = *v89++;
    v91 = v90;
    *v88++ = v91;
    --v87;
  }
  while (v87);
LABEL_90:
  b[1] = v61;
  operator delete(v61);
LABEL_91:
  if (*(_QWORD *)v100)
  {
    v101 = *(float **)v100;
    operator delete(*(void **)v100);
  }
  faiss::PCAMatrix::prepare_Ab(this);
  *((_BYTE *)this + 16) = 1;
  if (v7)
    MEMORY[0x1D826288C](v7, 0x1000C8052888210);
}

void sub_1D491D6B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23)
{
  uint64_t v23;
  uint64_t v24;
  void *v26;

  v26 = *(void **)(v24 - 96);
  if (v26)
  {
    *(_QWORD *)(v24 - 88) = v26;
    operator delete(v26);
  }
  if (v23)
    MEMORY[0x1D826288C](v23, 0x1000C8052888210);
  _Unwind_Resume(exception_object);
}

void std::vector<float>::resize(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3;

  v3 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 4 * a2;
  }
  else
  {
    std::vector<float>::__append((void **)a1, a2 - v3, a3);
  }
}

uint64_t `anonymous namespace'::eig(_anonymous_namespace_ *this, __CLPK_doublereal *__a, __CLPK_doublereal *__w, double *a4)
{
  int v4;
  __CLPK_doublereal *v6;
  __CLPK_doublereal *v8;
  uint64_t result;
  _anonymous_namespace_ *v10;
  _anonymous_namespace_ *v11;
  __CLPK_doublereal *v12;
  _anonymous_namespace_ *v13;
  double v14;
  uint64_t v15;
  __CLPK_doublereal *v16;
  char *v17;
  __CLPK_doublereal v18;
  _anonymous_namespace_ *v19;
  __CLPK_doublereal *v20;
  __CLPK_doublereal *v21;
  uint64_t v22;
  __CLPK_doublereal __work;
  __CLPK_integer __lda;
  __CLPK_integer __lwork;
  __CLPK_integer __info;

  v4 = (int)a4;
  v6 = __a;
  __lwork = -1;
  __info = 0;
  __lda = (int)this;
  __work = 0.0;
  dsyev_("Vectors as well", "Upper", &__lda, __a, &__lda, __w, &__work, &__lwork, &__info);
  __lwork = (int)__work;
  v8 = (__CLPK_doublereal *)operator new[]();
  dsyev_("Vectors as well", "Upper", &__lda, v6, &__lda, __w, v8, &__lwork, &__info);
  result = MEMORY[0x1D826288C](v8, 0x1000C8000313F17);
  if (__info)
    result = fprintf((FILE *)*MEMORY[0x1E0C80C10], "WARN ssyev info returns %d, a very bad PCA matrix is learnt\n", __info);
  if ((unint64_t)this <= 0xA && v4)
  {
    printf("info=%ld new eigvals=[", __info);
    if (!this)
    {
      puts("]");
      return puts("eigenvecs=");
    }
    v10 = 0;
    do
    {
      printf("%g ", __w[(_QWORD)v10]);
      v10 = (_anonymous_namespace_ *)((char *)v10 + 1);
    }
    while (this != v10);
    puts("]");
    puts("eigenvecs=");
    v11 = 0;
    v12 = v6;
    do
    {
      v13 = this;
      do
      {
        v14 = *v12++;
        printf("%10.4g ", v14);
        v13 = (_anonymous_namespace_ *)((char *)v13 - 1);
      }
      while (v13);
      result = putchar(10);
      v11 = (_anonymous_namespace_ *)((char *)v11 + 1);
    }
    while (v11 != this);
  }
  if ((unint64_t)this >= 2)
  {
    v15 = 0;
    v16 = &v6[(_QWORD)this * ((_QWORD)this - 1)];
    do
    {
      v17 = (char *)this + ~v15;
      v18 = __w[v15];
      __w[v15] = __w[(_QWORD)v17];
      __w[(_QWORD)v17] = v18;
      v19 = this;
      v20 = v6;
      v21 = v16;
      do
      {
        v22 = *(_QWORD *)v20;
        *v20++ = *v21;
        *(_QWORD *)v21++ = v22;
        v19 = (_anonymous_namespace_ *)((char *)v19 - 1);
      }
      while (v19);
      ++v15;
      v16 -= (uint64_t)this;
      v6 += (uint64_t)this;
    }
    while (v15 != (unint64_t)this >> 1);
  }
  return result;
}

void faiss::PCAMatrix::prepare_Ab(faiss::PCAMatrix *this)
{
  int v2;
  int v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float *v10;
  float v11;
  uint64_t v12;
  float *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  float *v20;
  float *v21;
  float v22;
  uint64_t v23;
  float v24;
  float v25;
  float v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  float *v30;
  uint64_t v31;
  int v32;
  float v33;
  int v34;
  int v35;
  uint64_t v36;
  int v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  std::vector<int>::pointer begin;
  uint64_t v42;
  int v43;
  float v44;
  int v45;
  uint64_t v46;
  int v47;
  std::string *p_p;
  size_t size;
  void *exception;
  int v51;
  std::string *v52;
  size_t v53;
  void *v54;
  int v55;
  std::string *v56;
  size_t v57;
  void *v58;
  int v59;
  float alpha;
  int k;
  std::string __p;
  float *b[2];
  __int128 v64;
  __int128 v65;
  char v66;
  std::vector<int> lda;

  v3 = *((_DWORD *)this + 2);
  v2 = *((_DWORD *)this + 3);
  v4 = (char *)*((_QWORD *)this + 19);
  v5 = *((_QWORD *)this + 20);
  v6 = (v5 - (uint64_t)v4) >> 2;
  if (v6 < v3 * v2)
  {
    memset(&__p, 0, sizeof(__p));
    v47 = snprintf(0, 0, "Error: '%s' failed: PCA matrix cannot output %d dimensions from %d ", "d_out * d_in <= PCAMat.size()", v2, v3);
    std::string::resize(&__p, v47 + 1, 0);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      size = __p.__r_.__value_.__l.__size_;
    snprintf((char *)p_p, size, "Error: '%s' failed: PCA matrix cannot output %d dimensions from %d ", "d_out * d_in <= PCAMat.size()", *((_DWORD *)this + 3), *((_DWORD *)this + 2));
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &__p, "void faiss::PCAMatrix::prepare_Ab()", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 613);
  }
  if (*((_BYTE *)this + 80))
  {
    if (*((_DWORD *)this + 24))
    {
      memset(&__p, 0, sizeof(__p));
      v51 = snprintf(0, 0, "Error: '%s' failed: both balancing bins and applying a random rotation does not make sense", "balanced_bins == 0");
      std::string::resize(&__p, v51 + 1, 0);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v52 = &__p;
      else
        v52 = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v53 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        v53 = __p.__r_.__value_.__l.__size_;
      snprintf((char *)v52, v53, "Error: '%s' failed: both balancing bins and applying a random rotation does not make sense", "balanced_bins == 0");
      v54 = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(v54, &__p, "void faiss::PCAMatrix::prepare_Ab()", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 668);
    }
    LODWORD(__p.__r_.__value_.__r.__words[1]) = *((_DWORD *)this + 3);
    HIDWORD(__p.__r_.__value_.__r.__words[1]) = v2;
    __p.__r_.__value_.__s.__data_[18] = 0;
    LOWORD(__p.__r_.__value_.__r.__words[2]) = 0;
    *(_OWORD *)b = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0;
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E9806958;
    faiss::RandomRotationMatrix::init((faiss::RandomRotationMatrix *)&__p);
    v7 = *((unsigned int *)this + 3);
    if (*((float *)this + 19) != 0.0 && (int)v7 >= 1)
    {
      v8 = 0;
      v9 = *((_QWORD *)this + 16);
      v10 = b[0];
      do
      {
        v11 = powf(*(float *)(v9 + 4 * v8), *((float *)this + 19));
        v12 = v7;
        v13 = v10;
        do
        {
          *v13 = v11 * *v13;
          v13 += v7;
          --v12;
        }
        while (v12);
        ++v8;
        ++v10;
      }
      while (v8 != v7);
    }
    std::vector<float>::resize((uint64_t)this + 24, (int)v7 * (uint64_t)*((int *)this + 2));
    v14 = *((_DWORD *)this + 3);
    LODWORD(lda.__begin_) = *((_DWORD *)this + 2);
    alpha = 1.0;
    k = v14;
    v59 = 0;
    sgemm_("Not", "Not", (int *)&lda, &k, &k, &alpha, *((float **)this + 19), (int *)&lda, b[0], &k, (float *)&v59, *((float **)this + 3), (int *)&lda);
    faiss::LinearTransform::~LinearTransform((faiss::LinearTransform *)&__p);
  }
  else
  {
    v27 = (_QWORD *)((char *)this + 24);
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)this + 24, v4, v5, v6);
    std::vector<float>::resize((uint64_t)this + 24, *((int *)this + 2) * (uint64_t)*((int *)this + 3));
    if (*((float *)this + 19) != 0.0)
    {
      v28 = *((unsigned int *)this + 3);
      if ((int)v28 >= 1)
      {
        v29 = 0;
        v30 = (float *)*((_QWORD *)this + 3);
        v31 = *((_QWORD *)this + 16);
        v32 = *((_DWORD *)this + 2);
        do
        {
          v33 = powf(*(float *)(v31 + 4 * v29), *((float *)this + 19));
          v34 = v32;
          if (v32 >= 1)
          {
            do
            {
              *v30 = v33 * *v30;
              ++v30;
              --v34;
            }
            while (v34);
          }
          ++v29;
        }
        while (v29 != v28);
      }
    }
    v35 = *((_DWORD *)this + 24);
    if (v35)
    {
      v36 = *((int *)this + 3);
      v37 = (int)v36 / v35;
      if ((int)v36 % v35)
      {
        memset(&__p, 0, sizeof(__p));
        v55 = snprintf(0, 0, "Error: '%s' failed", "d_out % balanced_bins == 0");
        std::string::resize(&__p, v55 + 1, 0);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v56 = &__p;
        else
          v56 = (std::string *)__p.__r_.__value_.__r.__words[0];
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v57 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        else
          v57 = __p.__r_.__value_.__l.__size_;
        snprintf((char *)v56, v57, "Error: '%s' failed", "d_out % balanced_bins == 0");
        v58 = __cxa_allocate_exception(0x20uLL);
        faiss::FaissException::FaissException(v58, &__p, "void faiss::PCAMatrix::prepare_Ab()", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 630);
      }
      v38 = (char *)*((_QWORD *)this + 3);
      *v27 = 0;
      *((_QWORD *)this + 4) = 0;
      *((_QWORD *)this + 5) = 0;
      std::vector<float>::resize((uint64_t)this + 24, *((int *)this + 2) * v36);
      std::vector<float>::vector(&__p, *((int *)this + 24));
      std::vector<int>::vector(&lda, *((int *)this + 24));
      if (*((int *)this + 3) >= 1)
      {
        v39 = 0;
        do
        {
          v40 = *((unsigned int *)this + 24);
          begin = lda.__begin_;
          if ((int)v40 < 1)
          {
            v43 = -1;
          }
          else
          {
            v42 = 0;
            v43 = -1;
            v44 = 1.0e30;
            do
            {
              if (lda.__begin_[v42] < v37 && *(float *)(__p.__r_.__value_.__r.__words[0] + 4 * v42) < v44)
              {
                v43 = v42;
                v44 = *(float *)(__p.__r_.__value_.__r.__words[0] + 4 * v42);
              }
              ++v42;
            }
            while (v40 != v42);
          }
          v45 = lda.__begin_[v43];
          *(float *)(__p.__r_.__value_.__r.__words[0] + 4 * v43) = *(float *)(*((_QWORD *)this + 16) + 4 * v39)
                                                                   + *(float *)(__p.__r_.__value_.__r.__words[0]
                                                                              + 4 * v43);
          begin[v43] = v45 + 1;
          memcpy((void *)(*((_QWORD *)this + 3) + 4 * *((_DWORD *)this + 2) * (v45 + v43 * v37)), &v38[4 * *((_DWORD *)this + 2) * (int)v39++], 4 * *((int *)this + 2));
        }
        while (v39 < *((int *)this + 3));
      }
      if (*((_BYTE *)this + 72))
      {
        printf("  bin accu=[");
        if (*((int *)this + 24) >= 1)
        {
          v46 = 0;
          do
            printf("%g ", *(float *)(__p.__r_.__value_.__r.__words[0] + 4 * v46++));
          while (v46 < *((int *)this + 24));
        }
        puts("]");
      }
      if (lda.__begin_)
      {
        lda.__end_ = lda.__begin_;
        operator delete(lda.__begin_);
      }
      if (__p.__r_.__value_.__r.__words[0])
      {
        __p.__r_.__value_.__l.__size_ = __p.__r_.__value_.__r.__words[0];
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v38)
        operator delete(v38);
    }
  }
  *((_QWORD *)this + 7) = *((_QWORD *)this + 6);
  std::vector<float>::resize((uint64_t)this + 48, *((int *)this + 3));
  v15 = *((unsigned int *)this + 3);
  if ((int)v15 >= 1)
  {
    v16 = 0;
    v17 = 0;
    v18 = *((unsigned int *)this + 2);
    v19 = *((_QWORD *)this + 6);
    do
    {
      if ((int)v18 < 1)
      {
        v22 = 0.0;
      }
      else
      {
        v20 = (float *)*((_QWORD *)this + 13);
        v21 = (float *)(*((_QWORD *)this + 3) + v16);
        v22 = 0.0;
        v23 = v18;
        do
        {
          v24 = *v20++;
          v25 = v24;
          v26 = *v21++;
          v22 = v22 - (float)(v25 * v26);
          --v23;
        }
        while (v23);
      }
      *(float *)(v19 + 4 * v17++) = v22;
      v16 += 4 * (int)v18;
    }
    while (v17 != v15);
  }
  *((_BYTE *)this + 18) = *((float *)this + 19) == 0.0;
}

void sub_1D491E024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;

  __cxa_free_exception(v21);
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void faiss::PCAMatrix::copy_from(faiss::PCAMatrix *this, const faiss::PCAMatrix *a2)
{
  int v4;
  std::string *v5;
  size_t size;
  void *exception;
  std::string v8;

  if (!*((_BYTE *)a2 + 16))
  {
    memset(&v8, 0, sizeof(v8));
    v4 = snprintf(0, 0, "Error: '%s' failed", "other.is_trained");
    std::string::resize(&v8, v4 + 1, 0);
    if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v5 = &v8;
    else
      v5 = (std::string *)v8.__r_.__value_.__r.__words[0];
    if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v8.__r_.__value_.__r.__words[2]);
    else
      size = v8.__r_.__value_.__l.__size_;
    snprintf((char *)v5, size, "Error: '%s' failed", "other.is_trained");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v8, "void faiss::PCAMatrix::copy_from(const PCAMatrix &)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 600);
  }
  if (this != a2)
  {
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)this + 104, *((char **)a2 + 13), *((_QWORD *)a2 + 14), (uint64_t)(*((_QWORD *)a2 + 14) - *((_QWORD *)a2 + 13)) >> 2);
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)this + 128, *((char **)a2 + 16), *((_QWORD *)a2 + 17), (uint64_t)(*((_QWORD *)a2 + 17) - *((_QWORD *)a2 + 16)) >> 2);
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)this + 152, *((char **)a2 + 19), *((_QWORD *)a2 + 20), (uint64_t)(*((_QWORD *)a2 + 20) - *((_QWORD *)a2 + 19)) >> 2);
  }
  faiss::PCAMatrix::prepare_Ab(this);
  *((_BYTE *)this + 16) = 1;
}

void sub_1D491E1D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

double faiss::ITQMatrix::ITQMatrix(faiss::ITQMatrix *this, int a2)
{
  double result;

  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = a2;
  *((_BYTE *)this + 18) = 0;
  *((_WORD *)this + 8) = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_BYTE *)this + 72) = 0;
  *(_QWORD *)this = &off_1E9806E58;
  *(_QWORD *)&result = 0x7B00000032;
  *(_QWORD *)((char *)this + 76) = 0x7B00000032;
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 13) = 0;
  *((_QWORD *)this + 11) = 0;
  return result;
}

{
  double result;

  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = a2;
  *((_BYTE *)this + 18) = 0;
  *((_WORD *)this + 8) = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_BYTE *)this + 72) = 0;
  *(_QWORD *)this = &off_1E9806E58;
  *(_QWORD *)&result = 0x7B00000032;
  *(_QWORD *)((char *)this + 76) = 0x7B00000032;
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 13) = 0;
  *((_QWORD *)this + 11) = 0;
  return result;
}

void faiss::ITQMatrix::train(faiss::ITQMatrix *this, uint64_t a2, float *a3)
{
  int v6;
  unint64_t v7;
  const void *v8;
  uint64_t v9;
  float *v10;
  double *v11;
  float v12;
  unint64_t v13;
  double *v14;
  uint64_t v15;
  float v16;
  int v17;
  double *v18;
  double *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  double *v23;
  float *v24;
  double *v25;
  float *v26;
  uint64_t v27;
  double v28;
  float v29;
  int v30;
  std::string *v31;
  size_t v32;
  void *v33;
  int v34;
  std::string *p_alpha;
  size_t size;
  void *exception;
  std::string v38;
  std::string alpha;
  int lda[2];
  __CLPK_integer __info;
  __CLPK_integer v42;
  int n;
  __CLPK_doublereal *__s[3];
  __CLPK_doublereal *__vt[3];
  __CLPK_doublereal *__u[3];
  __CLPK_doublereal *__a[3];
  double *a[3];
  double *b;
  double *v50;
  __int16 v51;
  char v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  char v56;
  void *c__[4];

  v6 = *((_DWORD *)this + 2);
  v7 = v6 * (uint64_t)v6;
  std::vector<double>::vector(c__, v7);
  v8 = (const void *)*((_QWORD *)this + 11);
  if (v7 == (uint64_t)(*((_QWORD *)this + 12) - (_QWORD)v8) >> 3)
  {
    memcpy(c__[0], v8, 8 * v7);
  }
  else
  {
    LODWORD(v50) = v6;
    HIDWORD(v50) = v6;
    v52 = 0;
    v51 = 0;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0;
    b = (double *)&off_1E9806958;
    faiss::RandomRotationMatrix::init((faiss::RandomRotationMatrix *)&b);
    v9 = v6 * (uint64_t)v6;
    if (v6)
    {
      v10 = (float *)v53;
      v11 = (double *)c__[0];
      if (v7 <= 1)
        v9 = 1;
      do
      {
        v12 = *v10++;
        *v11++ = v12;
        --v9;
      }
      while (v9);
    }
    faiss::LinearTransform::~LinearTransform((faiss::LinearTransform *)&b);
  }
  v13 = v6 * a2;
  std::vector<double>::vector(&b, v13);
  if (v13)
  {
    v14 = b;
    v15 = v6 * a2;
    do
    {
      v16 = *a3++;
      *v14++ = v16;
      --v15;
    }
    while (v15);
  }
  std::vector<double>::vector(a, v6 * a2);
  std::vector<double>::vector(__a, v7);
  std::vector<double>::vector(__u, v7);
  std::vector<double>::vector(__vt, v7);
  std::vector<double>::vector(__s, v6);
  if (*((int *)this + 19) >= 1)
  {
    v17 = 0;
    do
    {
      faiss::LinearTransform::print_if_verbose((uint64_t)this, "rotation", c__, v6, v6);
      lda[0] = v6;
      n = a2;
      alpha.__r_.__value_.__r.__words[0] = 0x3FF0000000000000;
      v38.__r_.__value_.__r.__words[0] = 0;
      dgemm_("N", "N", lda, &n, lda, (double *)&alpha, (double *)c__[0], lda, b, lda, (double *)&v38, a[0], lda);
      faiss::LinearTransform::print_if_verbose((uint64_t)this, "rotated_x", a, a2, v6);
      v18 = a[0];
      v19 = a[0];
      v20 = v6 * a2;
      if (v13)
      {
        do
        {
          if (*v19 >= 0.0)
            v21 = 1.0;
          else
            v21 = -1.0;
          *v19++ = v21;
          --v20;
        }
        while (v20);
      }
      lda[0] = v6;
      n = a2;
      alpha.__r_.__value_.__r.__words[0] = 0x3FF0000000000000;
      v38.__r_.__value_.__r.__words[0] = 0;
      dgemm_("N", "T", lda, lda, &n, (double *)&alpha, v18, lda, b, lda, (double *)&v38, __a[0], lda);
      faiss::LinearTransform::print_if_verbose((uint64_t)this, "cov_mat", __a, v6, v6);
      v42 = -1;
      n = v6;
      __info = 0;
      *(double *)lda = 0.0;
      dgesvd_("A", "A", &n, &n, __a[0], &n, __s[0], __u[0], &n, __vt[0], &n, (__CLPK_doublereal *)lda, &v42, &__info);
      if (__info)
      {
        memset(&alpha, 0, sizeof(alpha));
        v34 = snprintf(0, 0, "Error: '%s' failed", "info == 0");
        std::string::resize(&alpha, v34 + 1, 0);
        if ((alpha.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_alpha = &alpha;
        else
          p_alpha = (std::string *)alpha.__r_.__value_.__r.__words[0];
        if ((alpha.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          size = HIBYTE(alpha.__r_.__value_.__r.__words[2]);
        else
          size = alpha.__r_.__value_.__l.__size_;
        snprintf((char *)p_alpha, size, "Error: '%s' failed", "info == 0");
        exception = __cxa_allocate_exception(0x20uLL);
        faiss::FaissException::FaissException(exception, &alpha, "virtual void faiss::ITQMatrix::train(Index::idx_t, const float *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 814);
      }
      v42 = (int)*(double *)lda;
      std::vector<double>::vector(&alpha, (int)*(double *)lda);
      dgesvd_("A", "A", &n, &n, __a[0], &n, __s[0], __u[0], &n, __vt[0], &n, (__CLPK_doublereal *)alpha.__r_.__value_.__l.__data_, &v42, &__info);
      if (__info)
      {
        memset(&v38, 0, sizeof(v38));
        v30 = snprintf(0, 0, "Error: '%s' failed: sgesvd returned info=%d", "info == 0", __info);
        std::string::resize(&v38, v30 + 1, 0);
        if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v31 = &v38;
        else
          v31 = (std::string *)v38.__r_.__value_.__r.__words[0];
        if ((v38.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v32 = HIBYTE(v38.__r_.__value_.__r.__words[2]);
        else
          v32 = v38.__r_.__value_.__l.__size_;
        snprintf((char *)v31, v32, "Error: '%s' failed: sgesvd returned info=%d", "info == 0", __info);
        v33 = __cxa_allocate_exception(0x20uLL);
        faiss::FaissException::FaissException(v33, &v38, "virtual void faiss::ITQMatrix::train(Index::idx_t, const float *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 831);
      }
      if (alpha.__r_.__value_.__r.__words[0])
      {
        alpha.__r_.__value_.__l.__size_ = alpha.__r_.__value_.__r.__words[0];
        operator delete(alpha.__r_.__value_.__l.__data_);
      }
      faiss::LinearTransform::print_if_verbose((uint64_t)this, "u", __u, v6, v6);
      faiss::LinearTransform::print_if_verbose((uint64_t)this, "vt", __vt, v6, v6);
      lda[0] = v6;
      alpha.__r_.__value_.__r.__words[0] = 0x3FF0000000000000;
      v38.__r_.__value_.__r.__words[0] = 0;
      dgemm_("N", "T", lda, lda, lda, (double *)&alpha, __u[0], lda, __vt[0], lda, (double *)&v38, (double *)c__[0], lda);
      faiss::LinearTransform::print_if_verbose((uint64_t)this, "final rot", c__, v6, v6);
      ++v17;
    }
    while (v17 < *((_DWORD *)this + 19));
  }
  std::vector<float>::resize((uint64_t)this + 24, v7);
  if (v6)
  {
    v22 = 0;
    v23 = (double *)c__[0];
    v24 = (float *)*((_QWORD *)this + 3);
    do
    {
      v25 = v23;
      v26 = v24;
      v27 = v6;
      do
      {
        v28 = *v25++;
        v29 = v28;
        *v26 = v29;
        v26 += v6;
        --v27;
      }
      while (v27);
      ++v22;
      ++v24;
      v23 += v6;
    }
    while (v22 != v6);
  }
  *((_BYTE *)this + 16) = 1;
  if (__s[0])
  {
    __s[1] = __s[0];
    operator delete(__s[0]);
  }
  if (__vt[0])
  {
    __vt[1] = __vt[0];
    operator delete(__vt[0]);
  }
  if (__u[0])
  {
    __u[1] = __u[0];
    operator delete(__u[0]);
  }
  if (__a[0])
  {
    __a[1] = __a[0];
    operator delete(__a[0]);
  }
  if (a[0])
  {
    a[1] = a[0];
    operator delete(a[0]);
  }
  if (b)
  {
    v50 = b;
    operator delete(b);
  }
  if (c__[0])
  {
    c__[1] = c__[0];
    operator delete(c__[0]);
  }
}

void sub_1D491E8F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,uint64_t a37,void *a38,uint64_t a39,uint64_t a40,void *a41,uint64_t a42,uint64_t a43,void *a44,uint64_t a45)
{
  uint64_t v45;
  void *v47;

  faiss::LinearTransform::~LinearTransform((faiss::LinearTransform *)(v45 - 208));
  v47 = *(void **)(v45 - 128);
  if (v47)
  {
    *(_QWORD *)(v45 - 120) = v47;
    operator delete(v47);
  }
  _Unwind_Resume(a1);
}

uint64_t faiss::ITQTransform::ITQTransform(uint64_t this, int a2, int a3, char a4)
{
  int v4;
  std::string *v5;
  size_t size;
  void *exception;
  std::string v8;

  *(_DWORD *)(this + 8) = a2;
  *(_DWORD *)(this + 12) = a3;
  *(_BYTE *)(this + 16) = 1;
  *(_QWORD *)this = &off_1E9805740;
  *(_QWORD *)(this + 24) = 0;
  *(_QWORD *)(this + 32) = 0;
  *(_QWORD *)(this + 40) = 0;
  *(_QWORD *)(this + 56) = &off_1E9806E58;
  *(_BYTE *)(this + 48) = a4;
  *(_DWORD *)(this + 64) = a3;
  *(_DWORD *)(this + 68) = a3;
  *(_BYTE *)(this + 74) = 0;
  *(_WORD *)(this + 72) = 0;
  *(_OWORD *)(this + 80) = 0u;
  *(_OWORD *)(this + 96) = 0u;
  *(_OWORD *)(this + 112) = 0u;
  *(_BYTE *)(this + 128) = 0;
  *(_QWORD *)(this + 132) = 0x7B00000032;
  *(_QWORD *)(this + 176) = &off_1E9805FC8;
  *(_QWORD *)(this + 144) = 0;
  *(_QWORD *)(this + 152) = 0;
  *(_QWORD *)(this + 160) = 0;
  *(_DWORD *)(this + 184) = a2;
  *(_DWORD *)(this + 188) = a3;
  *(_WORD *)(this + 193) = 0;
  *(_BYTE *)(this + 192) = 0;
  *(_OWORD *)(this + 200) = 0u;
  *(_OWORD *)(this + 216) = 0u;
  *(_OWORD *)(this + 232) = 0u;
  *(_BYTE *)(this + 248) = 0;
  if (a2 != a3 && (a4 & 1) == 0)
  {
    memset(&v8, 0, sizeof(v8));
    v4 = snprintf(0, 0, "Error: '%s' failed", "d_in == d_out");
    std::string::resize(&v8, v4 + 1, 0);
    if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v5 = &v8;
    else
      v5 = (std::string *)v8.__r_.__value_.__r.__words[0];
    if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v8.__r_.__value_.__r.__words[2]);
    else
      size = v8.__r_.__value_.__l.__size_;
    snprintf((char *)v5, size, "Error: '%s' failed", "d_in == d_out");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v8, "faiss::ITQTransform::ITQTransform(int, int, BOOL)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 870);
  }
  *(_DWORD *)(this + 168) = 10;
  *(_BYTE *)(this + 16) = 0;
  return this;
}

void sub_1D491EBAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void **a11, faiss::LinearTransform *a12, faiss::ITQMatrix *a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  void *v19;
  void *v21;

  __cxa_free_exception(v19);
  if (a19 < 0)
    operator delete(__p);
  faiss::LinearTransform::~LinearTransform(a12);
  faiss::ITQMatrix::~ITQMatrix(a13);
  v21 = *a11;
  if (*a11)
  {
    *(_QWORD *)(a10 + 32) = v21;
    operator delete(v21);
  }
  _Unwind_Resume(a1);
}

void faiss::ITQMatrix::~ITQMatrix(faiss::ITQMatrix *this)
{
  void *v2;

  *(_QWORD *)this = &off_1E9806E58;
  v2 = (void *)*((_QWORD *)this + 11);
  if (v2)
  {
    *((_QWORD *)this + 12) = v2;
    operator delete(v2);
  }
  faiss::LinearTransform::~LinearTransform(this);
}

{
  void *v2;

  *(_QWORD *)this = &off_1E9806E58;
  v2 = (void *)*((_QWORD *)this + 11);
  if (v2)
  {
    *((_QWORD *)this + 12) = v2;
    operator delete(v2);
  }
  faiss::LinearTransform::~LinearTransform(this);
  JUMPOUT(0x1D82628A4);
}

uint64_t faiss::ITQTransform::train(faiss::ITQTransform *this, int *a2, const float *a3)
{
  faiss *v5;
  int v6;
  uint64_t v7;
  const float *v8;
  const float *v9;
  const float *v10;
  float *v11;
  unint64_t v12;
  float **v13;
  float *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float *v18;
  float *v19;
  float *v20;
  unint64_t v21;
  float v22;
  float *v23;
  unint64_t v24;
  uint64_t v25;
  float *v26;
  float *v27;
  float *v28;
  float *v29;
  unint64_t v30;
  float v31;
  float v32;
  float v33;
  int *v34;
  float *v35;
  float *v36;
  int v37;
  uint64_t result;
  int v39;
  std::string *v40;
  size_t size;
  void *exception;
  int v43;
  float alpha;
  int lda;
  int k;
  std::string v47;
  float *a[2];
  __int128 v49;
  __int128 v50;
  char v51;
  int v52;
  char v53;
  uint64_t v54;
  int v55;
  void *v56[2];
  __int128 v57;
  __int128 v58;
  __int128 __p;
  uint64_t v60;
  uint64_t v61;

  v61 = (uint64_t)a2;
  if (*((_BYTE *)this + 16))
  {
    memset(&v47, 0, sizeof(v47));
    v39 = snprintf(0, 0, "Error: '%s' failed", "!is_trained");
    std::string::resize(&v47, v39 + 1, 0);
    if ((v47.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v40 = &v47;
    else
      v40 = (std::string *)v47.__r_.__value_.__r.__words[0];
    if ((v47.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v47.__r_.__value_.__r.__words[2]);
    else
      size = v47.__r_.__value_.__l.__size_;
    snprintf((char *)v40, size, "Error: '%s' failed", "!is_trained");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v47, "virtual void faiss::ITQTransform::train(idx_t, const float *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 877);
  }
  v5 = (faiss *)*((int *)this + 2);
  v6 = *((_DWORD *)this + 42) * (_DWORD)v5;
  if (v6 <= 0x8000)
    v7 = 0x8000;
  else
    v7 = v6;
  v8 = (const float *)faiss::fvecs_maybe_subsample(v5, (int **)&v61, (unint64_t *)v7, (uint64_t)a3, 0, 0x4D2u);
  v9 = v8;
  if (v8 == a3)
    v10 = 0;
  else
    v10 = v8;
  v11 = (float *)operator new[]();
  v12 = *((int *)this + 2);
  v13 = (float **)((char *)this + 24);
  LODWORD(v47.__r_.__value_.__l.__data_) = 0;
  std::vector<float>::resize((uint64_t)this + 24, v12, &v47);
  v15 = v61;
  v16 = 4 * v12;
  if (v61 >= 1)
  {
    v17 = 0;
    v18 = (float *)v9;
    do
    {
      if ((int)v12 >= 1)
      {
        v19 = *v13;
        v20 = v18;
        v21 = v12;
        do
        {
          v22 = *v20++;
          *v19 = v22 + *v19;
          ++v19;
          --v21;
        }
        while (v21);
      }
      ++v17;
      v18 = (float *)((char *)v18 + v16);
    }
    while (v17 != v15);
  }
  if ((int)v12 >= 1)
  {
    v23 = *v13;
    v24 = v12;
    do
    {
      *v23 = *v23 / (float)v15;
      ++v23;
      --v24;
    }
    while (v24);
  }
  if (v15 >= 1)
  {
    v25 = 0;
    v26 = v11;
    do
    {
      if ((int)v12 >= 1)
      {
        v27 = *v13;
        v28 = (float *)v9;
        v29 = v26;
        v30 = v12;
        do
        {
          v31 = *v28++;
          v32 = v31;
          v33 = *v27++;
          *v29++ = v32 - v33;
          --v30;
        }
        while (v30);
      }
      ++v25;
      v26 = (float *)((char *)v26 + v16);
      v9 = (const float *)((char *)v9 + v16);
    }
    while (v25 != v15);
  }
  faiss::fvec_renorm_L2(*((int *)this + 2), v15, v11, v14);
  v47.__r_.__value_.__l.__size_ = *((_QWORD *)this + 1);
  v47.__r_.__value_.__s.__data_[18] = 0;
  *(_OWORD *)a = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0;
  v47.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E9806F70;
  v52 = 0;
  v53 = 0;
  LOWORD(v47.__r_.__value_.__r.__words[2]) = 256;
  *(_OWORD *)v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  __p = 0u;
  v60 = 0;
  v54 = 1000;
  v55 = 0;
  if (*((_BYTE *)this + 48))
  {
    v47.__r_.__value_.__s.__data_[17] = 0;
    faiss::PCAMatrix::train((faiss::PCAMatrix *)&v47, (int *)v61, v11);
    v34 = (int *)v61;
    v35 = (float *)operator new[]();
    (*(void (**)(faiss::LinearTransform *, uint64_t, float *, float *))(v47.__r_.__value_.__r.__words[0] + 8))((faiss::LinearTransform *)&v47, (uint64_t)v34, v11, v35);
    v36 = v35;
  }
  else
  {
    v35 = 0;
    v36 = v11;
  }
  faiss::ITQMatrix::train((faiss::ITQTransform *)((char *)this + 56), v61, v36);
  if (*((_BYTE *)this + 48))
  {
    v37 = *((_DWORD *)this + 3);
    lda = *((_DWORD *)this + 2);
    k = v37;
    v43 = 0;
    alpha = 1.0;
    std::vector<float>::resize((uint64_t)this + 200, lda * v37);
    sgemm_("N", "N", &lda, &k, &k, &alpha, a[0], &lda, *((float **)this + 10), &k, (float *)&v43, *((float **)this + 25), &lda);
  }
  else
  {
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)this + 200, *((char **)this + 10), *((_QWORD *)this + 11), (uint64_t)(*((_QWORD *)this + 11) - *((_QWORD *)this + 10)) >> 2);
  }
  *((_BYTE *)this + 192) = 1;
  *((_BYTE *)this + 16) = 1;
  if (v35)
    MEMORY[0x1D826288C](v35, 0x1000C8052888210);
  v47.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E9806F70;
  if ((_QWORD)__p)
  {
    *((_QWORD *)&__p + 1) = __p;
    operator delete((void *)__p);
  }
  if (*((_QWORD *)&v57 + 1))
  {
    *(_QWORD *)&v58 = *((_QWORD *)&v57 + 1);
    operator delete(*((void **)&v57 + 1));
  }
  if (v56[0])
  {
    v56[1] = v56[0];
    operator delete(v56[0]);
  }
  faiss::LinearTransform::~LinearTransform((faiss::LinearTransform *)&v47);
  result = MEMORY[0x1D826288C](v11, 0x1000C8052888210);
  if (v10)
    return MEMORY[0x1D826288C](v10, 0x1000C8052888210);
  return result;
}

void sub_1D491F0B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;

  __cxa_free_exception(v21);
  if (a21 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void faiss::ITQTransform::apply_noalloc(faiss::ITQTransform *this, uint64_t a2, const float *a3, float *a4)
{
  float *v8;
  float *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float *v13;
  float *v14;
  const float *v15;
  float *v16;
  unint64_t v17;
  float v18;
  float v19;
  float v20;
  int v21;
  std::string *v22;
  size_t size;
  void *exception;
  std::string v25;

  if (*((_BYTE *)this + 16))
  {
    v9 = (float *)operator new[]();
    v10 = *((int *)this + 2);
    if (a2 >= 1)
    {
      v11 = 0;
      v12 = 4 * v10;
      v13 = v9;
      do
      {
        if ((int)v10 >= 1)
        {
          v14 = (float *)*((_QWORD *)this + 3);
          v15 = a3;
          v16 = v13;
          v17 = v10;
          do
          {
            v18 = *v15++;
            v19 = v18;
            v20 = *v14++;
            *v16++ = v19 - v20;
            --v17;
          }
          while (v17);
        }
        ++v11;
        v13 = (float *)((char *)v13 + v12);
        a3 = (const float *)((char *)a3 + v12);
      }
      while (v11 != a2);
    }
    faiss::fvec_renorm_L2(v10, a2, v9, v8);
    faiss::LinearTransform::apply_noalloc((faiss::ITQTransform *)((char *)this + 176), a2, v9, a4);
    JUMPOUT(0x1D826288CLL);
  }
  memset(&v25, 0, sizeof(v25));
  v21 = snprintf(0, 0, "Error: '%s' failed: Transformation not trained yet", "is_trained");
  std::string::resize(&v25, v21 + 1, 0);
  if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v22 = &v25;
  else
    v22 = (std::string *)v25.__r_.__value_.__r.__words[0];
  if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v25.__r_.__value_.__r.__words[2]);
  else
    size = v25.__r_.__value_.__l.__size_;
  snprintf((char *)v22, size, "Error: '%s' failed: Transformation not trained yet", "is_trained");
  exception = __cxa_allocate_exception(0x20uLL);
  faiss::FaissException::FaissException(exception, &v25, "virtual void faiss::ITQTransform::apply_noalloc(Index::idx_t, const float *, float *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 950);
}

void sub_1D491F314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

double faiss::OPQMatrix::OPQMatrix(faiss::OPQMatrix *this, int a2, int a3, int a4)
{
  int v4;
  double result;

  if (a4 == -1)
    v4 = a2;
  else
    v4 = a4;
  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = v4;
  *((_BYTE *)this + 18) = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_BYTE *)this + 72) = 0;
  *(_QWORD *)this = &off_1E9806F38;
  *((_DWORD *)this + 19) = a3;
  *(_QWORD *)&result = 0x400000032;
  *((_QWORD *)this + 10) = 0x400000032;
  *((_DWORD *)this + 22) = 40;
  *((_BYTE *)this + 104) = 0;
  *((_WORD *)this + 8) = 0;
  *((_QWORD *)this + 12) = 0x10000;
  *((_QWORD *)this + 14) = 0;
  return result;
}

{
  int v4;
  double result;

  if (a4 == -1)
    v4 = a2;
  else
    v4 = a4;
  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = v4;
  *((_BYTE *)this + 18) = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((_BYTE *)this + 72) = 0;
  *(_QWORD *)this = &off_1E9806F38;
  *((_DWORD *)this + 19) = a3;
  *(_QWORD *)&result = 0x400000032;
  *((_QWORD *)this + 10) = 0x400000032;
  *((_DWORD *)this + 22) = 40;
  *((_BYTE *)this + 104) = 0;
  *((_WORD *)this + 8) = 0;
  *((_QWORD *)this + 12) = 0x10000;
  *((_QWORD *)this + 14) = 0;
  return result;
}

void faiss::OPQMatrix::train(unint64_t **this, int *a2, const float *a3)
{
  const float *v5;
  float *v6;
  const float *v7;
  int v8;
  int v9;
  unint64_t v10;
  int *v11;
  float *v12;
  int *v13;
  uint64_t v14;
  float *v15;
  uint64_t v16;
  float *v17;
  float v18;
  unint64_t v19;
  int *v20;
  float *v21;
  uint64_t v22;
  uint64_t v23;
  float *v24;
  float v25;
  float v26;
  float v27;
  uint64_t v28;
  int v29;
  std::string *v30;
  size_t size;
  void *exception;
  float *v33;
  std::string *v34;
  std::string *v35;
  faiss *v36;
  double v37;
  double v38;
  int v39;
  std::string *v40;
  uint64_t v41;
  faiss *v42;
  float v43;
  int *v44;
  int v45;
  float v46;
  int v47;
  double v48;
  __CLPK_real *v49;
  __CLPK_real *v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  float *a;
  int lda[2];
  __CLPK_real *v61;
  float v62;
  __CLPK_integer v63;
  __CLPK_integer ldc;
  int beta;
  float alpha;
  int k;
  int n;
  int m;
  unsigned __int8 *v70[3];
  std::string __p[4];
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76[3];
  void *v77[3];
  void *v78[3];
  void *c__[3];
  void *b[3];
  uint64_t v81;

  v81 = (uint64_t)a2;
  v5 = (const float *)faiss::fvecs_maybe_subsample((faiss *)*((int *)this + 2), (int **)&v81, this[12], (uint64_t)a3, (const float *)*((unsigned __int8 *)this + 104), 0x4D2u);
  v6 = (float *)v5;
  if (v5 == a3)
    v7 = 0;
  else
    v7 = v5;
  v8 = *((_DWORD *)this + 2);
  v9 = *((_DWORD *)this + 3);
  if (v9 <= v8)
    v10 = v8;
  else
    v10 = v9;
  if (*((_BYTE *)this + 104))
    printf("OPQMatrix::train: training an OPQ rotation matrix for M=%d from %lld vectors in %dD -> %dD\n", *((_DWORD *)this + 19), v81, *((_DWORD *)this + 2), v9);
  std::vector<float>::vector(b, v81 * (int)v10);
  std::vector<float>::vector(__p, (int)v10);
  v11 = (int *)v81;
  v12 = (float *)__p[0].__r_.__value_.__r.__words[0];
  if (v81)
  {
    v13 = 0;
    v14 = *((unsigned int *)this + 2);
    v15 = v6;
    do
    {
      v16 = v14;
      v17 = v12;
      if ((int)v14 >= 1)
      {
        do
        {
          v18 = *v15++;
          *v17 = v18 + *v17;
          ++v17;
          --v16;
        }
        while (v16);
      }
      v13 = (int *)((char *)v13 + 1);
    }
    while (v13 != v11);
    v12 = (float *)__p[0].__r_.__value_.__r.__words[0];
  }
  if ((_DWORD)v10)
  {
    v19 = v10;
    do
    {
      *v12 = *v12 / (float)(uint64_t)v11;
      ++v12;
      --v19;
    }
    while (v19);
    v12 = (float *)__p[0].__r_.__value_.__r.__words[0];
  }
  if (v11)
  {
    v20 = 0;
    v21 = (float *)b[0];
    v22 = *((unsigned int *)this + 2);
    do
    {
      v23 = v22;
      v24 = v12;
      if ((int)v22 >= 1)
      {
        do
        {
          v25 = *v6++;
          v26 = v25;
          v27 = *v24++;
          *v21++ = v26 - v27;
          --v23;
        }
        while (v23);
      }
      v21 += (int)v10 - (uint64_t)(int)v22;
      v20 = (int *)((char *)v20 + 1);
    }
    while (v20 != v11);
  }
  if (v12)
  {
    __p[0].__r_.__value_.__l.__size_ = (std::string::size_type)v12;
    operator delete(v12);
  }
  a = (float *)this[3];
  v28 = (char *)this[4] - (char *)a;
  if (v28)
  {
    if ((int)v10 * (uint64_t)v9 != v28 >> 2)
    {
      memset(__p, 0, 24);
      v29 = snprintf(0, 0, "Error: '%s' failed", "A.size() == d * d2");
      std::string::resize(__p, v29 + 1, 0);
      if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v30 = __p;
      else
        v30 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
      if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(__p[0].__r_.__value_.__r.__words[2]);
      else
        size = __p[0].__r_.__value_.__l.__size_;
      snprintf((char *)v30, size, "Error: '%s' failed", "A.size() == d * d2");
      exception = __cxa_allocate_exception(0x20uLL);
      faiss::FaissException::FaissException(exception, __p, "virtual void faiss::OPQMatrix::train(Index::idx_t, const float *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 1056);
    }
  }
  else
  {
    std::vector<float>::resize((uint64_t)(this + 3), (int)v10 * (uint64_t)(int)v10);
    a = (float *)this[3];
    if (*((_BYTE *)this + 104))
      printf("  OPQMatrix::train: making random %zd*%zd rotation\n", (int)v10, (int)v10);
    faiss::float_randn((faiss *)a, (float *)((int)v10 * (uint64_t)(int)v10));
    faiss::matrix_qr((faiss *)v10, v10, a, v33);
    std::vector<float>::resize((uint64_t)(this + 3), (int)v10 * (uint64_t)v9);
  }
  std::vector<float>::vector(c__, v81 * v9);
  std::vector<float>::vector(v78, v81 * v9);
  std::vector<float>::vector(v77, v81 * (int)v10);
  v57 = (int)v10 * (uint64_t)(int)v10;
  std::vector<float>::vector(v76, 4 * v57);
  faiss::ProductQuantizer::ProductQuantizer((faiss::ProductQuantizer *)__p, v9, *((int *)this + 19), 8uLL);
  v34 = (std::string *)this[14];
  if (v34)
    v35 = (std::string *)this[14];
  else
    v35 = __p;
  v36 = (faiss *)std::vector<unsigned char>::vector(v70, v81 * v35[1].__r_.__value_.__l.__size_);
  v56 = v9;
  v58 = v9;
  v37 = faiss::getmillisecs(v36);
  if (*((int *)this + 20) >= 1)
  {
    v38 = v37;
    v39 = 0;
    if (v34)
      v40 = v34;
    else
      v40 = __p;
    do
    {
      lda[0] = v10;
      n = v81;
      m = v58;
      alpha = 1.0;
      k = 0;
      sgemm_("Transposed", "Not transposed", &m, &n, lda, &alpha, a, lda, (float *)b[0], lda, (float *)&k, (float *)c__[0], &m);
      HIDWORD(v40[3].__r_.__value_.__r.__words[0]) = 1000;
      v41 = 84;
      if (!v39)
        v41 = 88;
      LODWORD(v40[2].__r_.__value_.__r.__words[1]) = *(_DWORD *)((char *)this + v41);
      v40[2].__r_.__value_.__s.__data_[0] = *((_BYTE *)this + 104);
      faiss::ProductQuantizer::train((faiss::ProductQuantizer *)v35, v81, (const float *)c__[0]);
      if (*((_BYTE *)this + 104))
        puts("    encode / decode");
      if (v40[4].__r_.__value_.__r.__words[0])
        faiss::ProductQuantizer::compute_codes_with_assign_index(v35, (const float *)c__[0], v70[0], v81);
      else
        faiss::ProductQuantizer::compute_codes((faiss::ProductQuantizer *)v35, (const float *)c__[0], v70[0], v81);
      faiss::ProductQuantizer::decode(v35, v70[0], (float *)v78[0], v81);
      v43 = faiss::fvec_L2sqr((faiss *)v78[0], (const float *)c__[0], v81 * v56);
      v44 = (int *)v81;
      v45 = *((unsigned __int8 *)this + 104);
      if (*((_BYTE *)this + 104))
      {
        v46 = v43;
        v47 = v40[2].__r_.__value_.__r.__words[1];
        v48 = faiss::getmillisecs(v42);
        printf("    Iteration %d (%d PQ iterations):%.3f s, obj=%g\n", v39, v47, (v48 - v38) / 1000.0, (float)(v46 / (float)(uint64_t)v44));
        LODWORD(v44) = v81;
        v45 = *((unsigned __int8 *)this + 104);
      }
      v49 = (__CLPK_real *)v76[0];
      n = v58;
      m = v10;
      alpha = 1.0;
      k = (int)v44;
      beta = 0;
      if (v45)
        puts("    X * recons");
      sgemm_("Not", "Transposed", &n, &m, &k, &alpha, (float *)v78[0], &n, (float *)b[0], &m, (float *)&beta, (float *)v77[0], &n);
      v50 = &v49[v57];
      v63 = -1;
      ldc = -1;
      v62 = 0.0;
      sgesvd_("All", "All", &n, &m, (__CLPK_real *)v77[0], &n, &v49[2 * v57], v50, &n, v49, &m, &v62, &ldc, &v63);
      ldc = (int)v62;
      std::vector<float>::vector(lda, (int)v62);
      sgesvd_("All", "All", &n, &m, (__CLPK_real *)v77[0], &n, &v49[2 * v57], v50, &n, v49, &m, *(__CLPK_real **)lda, &ldc, &v63);
      sgemm_("Transposed", "Transposed", &m, &n, &n, &alpha, v49, &m, v50, &n, (float *)&beta, a, &m);
      if (*(_QWORD *)lda)
      {
        v61 = *(__CLPK_real **)lda;
        operator delete(*(void **)lda);
      }
      HIDWORD(v40[2].__r_.__value_.__r.__words[0]) = 1;
      ++v39;
    }
    while (v39 < *((_DWORD *)this + 20));
  }
  v51 = *((_DWORD *)this + 2);
  if (v10 > v51)
  {
    LODWORD(v52) = *((_DWORD *)this + 3);
    if ((int)v52 < 1)
    {
      v55 = (char *)(this + 3);
    }
    else
    {
      v53 = 0;
      v54 = 0;
      v55 = (char *)(this + 3);
      do
      {
        memmove((char *)this[3] + 4 * v54 * *((int *)this + 2), (char *)this[3] + v53, 4 * *((int *)this + 2));
        ++v54;
        v52 = *((int *)this + 3);
        v53 += 4 * (int)v10;
      }
      while (v54 < v52);
      v51 = *((_DWORD *)this + 2);
    }
    std::vector<float>::resize((uint64_t)v55, (int)(v51 * v52));
  }
  *((_BYTE *)this + 16) = 1;
  *((_BYTE *)this + 18) = 1;
  if (v70[0])
  {
    v70[1] = v70[0];
    operator delete(v70[0]);
  }
  if (v74)
  {
    v75 = v74;
    operator delete(v74);
  }
  if (v72)
  {
    v73 = v72;
    operator delete(v72);
  }
  if (v76[0])
  {
    v76[1] = v76[0];
    operator delete(v76[0]);
  }
  if (v77[0])
  {
    v77[1] = v77[0];
    operator delete(v77[0]);
  }
  if (v78[0])
  {
    v78[1] = v78[0];
    operator delete(v78[0]);
  }
  if (c__[0])
  {
    c__[1] = c__[0];
    operator delete(c__[0]);
  }
  if (b[0])
  {
    b[1] = b[0];
    operator delete(b[0]);
  }
  if (v7)
    MEMORY[0x1D826288C](v7, 0x1000C8052888210);
}

void sub_1D491FBC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v44;

  __cxa_free_exception(v40);
  if (a40 < 0)
    operator delete(__p);
  v44 = *(void **)(v42 - 152);
  if (v44)
  {
    *(_QWORD *)(v42 - 144) = v44;
    operator delete(v44);
  }
  if (v41)
    MEMORY[0x1D826288C](v41, 0x1000C8052888210);
  _Unwind_Resume(a1);
}

uint64_t faiss::NormalizationTransform::NormalizationTransform(uint64_t this, int a2, float a3)
{
  *(_DWORD *)(this + 8) = a2;
  *(_DWORD *)(this + 12) = a2;
  *(_BYTE *)(this + 16) = 1;
  *(_QWORD *)this = &off_1E9806A20;
  *(float *)(this + 20) = a3;
  return this;
}

{
  *(_DWORD *)(this + 8) = a2;
  *(_DWORD *)(this + 12) = a2;
  *(_BYTE *)(this + 16) = 1;
  *(_QWORD *)this = &off_1E9806A20;
  *(float *)(this + 20) = a3;
  return this;
}

double faiss::NormalizationTransform::NormalizationTransform(faiss::NormalizationTransform *this)
{
  double result;

  result = NAN;
  *((_QWORD *)this + 1) = -1;
  *((_BYTE *)this + 16) = 1;
  *(_QWORD *)this = &off_1E9806A20;
  *((_DWORD *)this + 5) = -1082130432;
  return result;
}

{
  double result;

  result = NAN;
  *((_QWORD *)this + 1) = -1;
  *((_BYTE *)this + 16) = 1;
  *(_QWORD *)this = &off_1E9806A20;
  *((_DWORD *)this + 5) = -1082130432;
  return result;
}

void faiss::NormalizationTransform::apply_noalloc(faiss::NormalizationTransform *this, uint64_t a2, const float *__src, float *__dst)
{
  float *v7;
  void *exception;
  _QWORD v9[3];

  if (*((float *)this + 5) != 2.0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(v9, "not implemented");
    faiss::FaissException::FaissException(exception, v9, "virtual void faiss::NormalizationTransform::apply_noalloc(idx_t, const float *, float *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 1217);
  }
  memcpy(__dst, __src, 4 * a2 * *((int *)this + 2));
  faiss::fvec_renorm_L2(*((int *)this + 2), a2, __dst, v7);
}

void sub_1D491FE48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  int v16;

  if (a15 < 0)
  {
    operator delete(__p);
    if ((v16 & 1) == 0)
LABEL_6:
      _Unwind_Resume(a1);
  }
  else if (!v16)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v15);
  goto LABEL_6;
}

void *faiss::NormalizationTransform::reverse_transform(faiss::NormalizationTransform *this, uint64_t a2, const float *__src, float *__dst)
{
  return memcpy(__dst, __src, 4 * a2 * *((int *)this + 2));
}

uint64_t faiss::CenteringTransform::CenteringTransform(uint64_t this, int a2)
{
  *(_DWORD *)(this + 8) = a2;
  *(_DWORD *)(this + 12) = a2;
  *(_QWORD *)this = &off_1E98062E8;
  *(_QWORD *)(this + 32) = 0;
  *(_QWORD *)(this + 40) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_BYTE *)(this + 16) = 0;
  return this;
}

{
  *(_DWORD *)(this + 8) = a2;
  *(_DWORD *)(this + 12) = a2;
  *(_QWORD *)this = &off_1E98062E8;
  *(_QWORD *)(this + 32) = 0;
  *(_QWORD *)(this + 40) = 0;
  *(_QWORD *)(this + 24) = 0;
  *(_BYTE *)(this + 16) = 0;
  return this;
}

void faiss::CenteringTransform::train(faiss::CenteringTransform *this, uint64_t a2, float *a3)
{
  float **v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  float *v11;
  uint64_t v12;
  float v13;
  float *v15;
  int v16;
  std::string *v17;
  size_t size;
  void *exception;
  std::string v20;

  if (a2 <= 0)
  {
    memset(&v20, 0, sizeof(v20));
    v16 = snprintf(0, 0, "Error: '%s' failed: need at least one training vector", "n > 0");
    std::string::resize(&v20, v16 + 1, 0);
    if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v17 = &v20;
    else
      v17 = (std::string *)v20.__r_.__value_.__r.__words[0];
    if ((v20.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v20.__r_.__value_.__r.__words[2]);
    else
      size = v20.__r_.__value_.__l.__size_;
    snprintf((char *)v17, size, "Error: '%s' failed: need at least one training vector", "n > 0");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v20, "virtual void faiss::CenteringTransform::train(Index::idx_t, const float *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 1237);
  }
  v6 = (float **)((char *)this + 24);
  v7 = *((int *)this + 2);
  LODWORD(v20.__r_.__value_.__l.__data_) = 0;
  std::vector<float>::resize((uint64_t)this + 24, v7, &v20);
  v8 = 0;
  v9 = *((int *)this + 2);
  if (v9 <= 1)
    v10 = 1;
  else
    v10 = *((int *)this + 2);
  do
  {
    while (!(_DWORD)v9)
    {
      if (a2 == ++v8)
        goto LABEL_14;
    }
    v11 = *v6;
    v12 = v10;
    do
    {
      v13 = *a3++;
      *v11 = v13 + *v11;
      ++v11;
      --v12;
    }
    while (v12);
  }
  while (a2 - 1 != v8++);
  v15 = *v6;
  do
  {
    *v15 = *v15 / (float)a2;
    ++v15;
    --v9;
  }
  while (v9);
LABEL_14:
  *((_BYTE *)this + 16) = 1;
}

void sub_1D4920058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t faiss::CenteringTransform::apply_noalloc(uint64_t this, uint64_t a2, float *a3, float *a4)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  float *v7;
  uint64_t v8;
  float v9;
  float v10;
  float v11;
  int v12;
  std::string *v13;
  size_t size;
  void *exception;
  std::string v16;

  if (!*(_BYTE *)(this + 16))
  {
    memset(&v16, 0, sizeof(v16));
    v12 = snprintf(0, 0, "Error: '%s' failed", "is_trained");
    std::string::resize(&v16, v12 + 1, 0);
    if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v13 = &v16;
    else
      v13 = (std::string *)v16.__r_.__value_.__r.__words[0];
    if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v16.__r_.__value_.__r.__words[2]);
    else
      size = v16.__r_.__value_.__l.__size_;
    snprintf((char *)v13, size, "Error: '%s' failed", "is_trained");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v16, "virtual void faiss::CenteringTransform::apply_noalloc(idx_t, const float *, float *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 1253);
  }
  if (a2 >= 1)
  {
    v4 = 0;
    v5 = *(_DWORD *)(this + 8);
    if (v5 <= 1)
      v6 = 1;
    else
      v6 = *(_DWORD *)(this + 8);
    do
    {
      if (v5)
      {
        v7 = *(float **)(this + 24);
        v8 = v6;
        do
        {
          v9 = *a3++;
          v10 = v9;
          v11 = *v7++;
          *a4++ = v10 - v11;
          --v8;
        }
        while (v8);
      }
      ++v4;
    }
    while (v4 != a2);
  }
  return this;
}

void sub_1D49201A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t faiss::CenteringTransform::reverse_transform(uint64_t this, uint64_t a2, float *a3, float *a4)
{
  uint64_t v4;
  unsigned int v5;
  int v6;
  float *v7;
  uint64_t v8;
  float v9;
  float v10;
  float v11;
  int v12;
  std::string *v13;
  size_t size;
  void *exception;
  std::string v16;

  if (!*(_BYTE *)(this + 16))
  {
    memset(&v16, 0, sizeof(v16));
    v12 = snprintf(0, 0, "Error: '%s' failed", "is_trained");
    std::string::resize(&v16, v12 + 1, 0);
    if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v13 = &v16;
    else
      v13 = (std::string *)v16.__r_.__value_.__r.__words[0];
    if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v16.__r_.__value_.__r.__words[2]);
    else
      size = v16.__r_.__value_.__l.__size_;
    snprintf((char *)v13, size, "Error: '%s' failed", "is_trained");
    exception = __cxa_allocate_exception(0x20uLL);
    faiss::FaissException::FaissException(exception, &v16, "virtual void faiss::CenteringTransform::reverse_transform(idx_t, const float *, float *) const", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 1264);
  }
  if (a2 >= 1)
  {
    v4 = 0;
    v5 = *(_DWORD *)(this + 8);
    if (v5 <= 1)
      v6 = 1;
    else
      v6 = *(_DWORD *)(this + 8);
    do
    {
      if (v5)
      {
        v7 = *(float **)(this + 24);
        v8 = v6;
        do
        {
          v9 = *a3++;
          v10 = v9;
          v11 = *v7++;
          *a4++ = v10 + v11;
          --v8;
        }
        while (v8);
      }
      ++v4;
    }
    while (v4 != a2);
  }
  return this;
}

void sub_1D49202F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;

  __cxa_free_exception(v15);
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

faiss::RemapDimensionsTransform *faiss::RemapDimensionsTransform::RemapDimensionsTransform(faiss::RemapDimensionsTransform *this, int a2, int a3, int *a4)
{
  _DWORD **v8;
  _DWORD *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v14;
  std::string *v15;
  size_t size;
  void *exception;
  std::string v18;

  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = a3;
  *((_BYTE *)this + 16) = 1;
  *(_QWORD *)this = &off_1E9806B08;
  *((_QWORD *)this + 3) = 0;
  v8 = (_DWORD **)((char *)this + 24);
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  std::vector<unsigned int>::resize((std::vector<int> *)this + 1, a3);
  if (a3 >= 1)
  {
    v9 = *v8;
    v10 = a3;
    do
    {
      v12 = *a4++;
      v11 = v12;
      *v9 = v12;
      if (v12 != -1 && (v11 < 0 || v11 >= a2))
      {
        memset(&v18, 0, sizeof(v18));
        v14 = snprintf(0, 0, "Error: '%s' failed", "map[i] == -1 || (map[i] >= 0 && map[i] < d_in)");
        std::string::resize(&v18, v14 + 1, 0);
        if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v15 = &v18;
        else
          v15 = (std::string *)v18.__r_.__value_.__r.__words[0];
        if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          size = HIBYTE(v18.__r_.__value_.__r.__words[2]);
        else
          size = v18.__r_.__value_.__l.__size_;
        snprintf((char *)v15, size, "Error: '%s' failed", "map[i] == -1 || (map[i] >= 0 && map[i] < d_in)");
        exception = __cxa_allocate_exception(0x20uLL);
        faiss::FaissException::FaissException(exception, &v18, "faiss::RemapDimensionsTransform::RemapDimensionsTransform(int, int, const int *)", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 1285);
      }
      ++v9;
      --v10;
    }
    while (v10);
  }
  return this;
}

void sub_1D4920474(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;
  void **v16;
  void *v18;

  v18 = *v16;
  if (*v16)
  {
    *(_QWORD *)(v15 + 32) = v18;
    operator delete(v18);
  }
  _Unwind_Resume(exception_object);
}

faiss::RemapDimensionsTransform *faiss::RemapDimensionsTransform::RemapDimensionsTransform(faiss::RemapDimensionsTransform *this, int a2, int a3, char a4)
{
  uint64_t *v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  std::vector<int>::value_type __x;

  *((_DWORD *)this + 2) = a2;
  *((_DWORD *)this + 3) = a3;
  *((_BYTE *)this + 16) = 1;
  *((_QWORD *)this + 3) = 0;
  v8 = (uint64_t *)((char *)this + 24);
  *(_QWORD *)this = &off_1E9806B08;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  __x = -1;
  std::vector<int>::resize((std::vector<int> *)this + 1, a3, &__x);
  if ((a4 & 1) != 0)
  {
    if (a2 >= a3)
    {
      if (a3 >= 1)
      {
        v15 = 0;
        v16 = 0;
        v17 = *v8;
        do
        {
          *(_DWORD *)(v17 + 4 * v16++) = v15 / a3;
          v15 += a2;
        }
        while (a3 != v16);
      }
    }
    else if (a2 >= 1)
    {
      v9 = 0;
      v10 = 0;
      v11 = *v8;
      do
      {
        *(_DWORD *)(v11 + 4 * (v9 / a2)) = v10++;
        v9 += a3;
      }
      while (a2 != v10);
    }
  }
  else
  {
    if (a2 >= a3)
      v12 = a3;
    else
      v12 = a2;
    if ((int)v12 >= 1)
    {
      v13 = 0;
      v14 = *v8;
      do
      {
        *(_DWORD *)(v14 + 4 * v13) = v13;
        ++v13;
      }
      while (v12 != v13);
    }
  }
  return this;
}

void sub_1D49205D0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void *v4;

  v4 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 32) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<int>::resize(std::vector<int> *this, std::vector<int>::size_type __sz, std::vector<int>::const_reference __x)
{
  std::vector<int>::size_type v3;

  v3 = this->__end_ - this->__begin_;
  if (__sz <= v3)
  {
    if (__sz < v3)
      this->__end_ = &this->__begin_[__sz];
  }
  else
  {
    std::vector<int>::__append(this, __sz - v3, __x);
  }
}

uint64_t faiss::RemapDimensionsTransform::apply_noalloc(uint64_t this, uint64_t a2, const float *a3, float *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  float v10;

  if (a2 >= 1)
  {
    v4 = 0;
    v5 = *(unsigned int *)(this + 12);
    v6 = *(int *)(this + 8);
    do
    {
      if ((int)v5 >= 1)
      {
        v7 = 0;
        v8 = *(_QWORD *)(this + 24);
        do
        {
          v9 = *(unsigned int *)(v8 + v7 * 4);
          if ((v9 & 0x80000000) != 0)
            v10 = 0.0;
          else
            v10 = a3[v9];
          a4[v7++] = v10;
        }
        while (v5 != v7);
      }
      a3 += v6;
      ++v4;
      a4 += (int)v5;
    }
    while (v4 != a2);
  }
  return this;
}

void faiss::RemapDimensionsTransform::reverse_transform(faiss::RemapDimensionsTransform *this, uint64_t a2, const float *a3, float *a4)
{
  float *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a4;
  bzero(a4, 4 * a2 * *((int *)this + 2));
  if (a2 >= 1)
  {
    v8 = 0;
    v9 = *((unsigned int *)this + 3);
    v10 = *((int *)this + 2);
    do
    {
      if ((int)v9 >= 1)
      {
        v11 = 0;
        v12 = *((_QWORD *)this + 3);
        do
        {
          v13 = *(unsigned int *)(v12 + v11 * 4);
          if ((v13 & 0x80000000) == 0)
            v4[v13] = a3[v11];
          ++v11;
        }
        while (v9 != v11);
      }
      v4 += v10;
      ++v8;
      a3 += (int)v9;
    }
    while (v8 != a2);
  }
}

void faiss::RemapDimensionsTransform::~RemapDimensionsTransform(faiss::RemapDimensionsTransform *this)
{
  void *v2;

  *(_QWORD *)this = &off_1E9806B08;
  v2 = (void *)*((_QWORD *)this + 3);
  if (v2)
  {
    *((_QWORD *)this + 4) = v2;
    operator delete(v2);
  }
}

{
  void *v2;

  *(_QWORD *)this = &off_1E9806B08;
  v2 = (void *)*((_QWORD *)this + 3);
  if (v2)
  {
    *((_QWORD *)this + 4) = v2;
    operator delete(v2);
  }
  JUMPOUT(0x1D82628A4);
}

void faiss::ITQTransform::~ITQTransform(faiss::ITQTransform *this)
{
  void *v2;
  void *v3;

  *(_QWORD *)this = &off_1E9805740;
  faiss::LinearTransform::~LinearTransform((faiss::ITQTransform *)((char *)this + 176));
  *((_QWORD *)this + 7) = &off_1E9806E58;
  v2 = (void *)*((_QWORD *)this + 18);
  if (v2)
  {
    *((_QWORD *)this + 19) = v2;
    operator delete(v2);
  }
  faiss::LinearTransform::~LinearTransform((faiss::ITQTransform *)((char *)this + 56));
  v3 = (void *)*((_QWORD *)this + 3);
  if (v3)
  {
    *((_QWORD *)this + 4) = v3;
    operator delete(v3);
  }
}

{
  void *v2;
  void *v3;

  *(_QWORD *)this = &off_1E9805740;
  faiss::LinearTransform::~LinearTransform((faiss::ITQTransform *)((char *)this + 176));
  *((_QWORD *)this + 7) = &off_1E9806E58;
  v2 = (void *)*((_QWORD *)this + 18);
  if (v2)
  {
    *((_QWORD *)this + 19) = v2;
    operator delete(v2);
  }
  faiss::LinearTransform::~LinearTransform((faiss::ITQTransform *)((char *)this + 56));
  v3 = (void *)*((_QWORD *)this + 3);
  if (v3)
  {
    *((_QWORD *)this + 4) = v3;
    operator delete(v3);
  }
  JUMPOUT(0x1D82628A4);
}

void faiss::OPQMatrix::~OPQMatrix(faiss::OPQMatrix *this)
{
  faiss::LinearTransform::~LinearTransform(this);
  JUMPOUT(0x1D82628A4);
}

void faiss::NormalizationTransform::~NormalizationTransform(faiss::NormalizationTransform *this)
{
  JUMPOUT(0x1D82628A4);
}

void faiss::CenteringTransform::~CenteringTransform(faiss::CenteringTransform *this)
{
  void *v2;

  *(_QWORD *)this = &off_1E98062E8;
  v2 = (void *)*((_QWORD *)this + 3);
  if (v2)
  {
    *((_QWORD *)this + 4) = v2;
    operator delete(v2);
  }
}

{
  void *v2;

  *(_QWORD *)this = &off_1E98062E8;
  v2 = (void *)*((_QWORD *)this + 3);
  if (v2)
  {
    *((_QWORD *)this + 4) = v2;
    operator delete(v2);
  }
  JUMPOUT(0x1D82628A4);
}

void std::vector<float>::__append(void **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _DWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  _DWORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *i;
  int v25;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 2)
  {
    if (a2)
    {
      v16 = 4 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = (char *)v9 - (_BYTE *)*a1;
    v11 = a2 + (v10 >> 2);
    if (v11 >> 62)
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    v12 = v10 >> 2;
    v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 1 > v11)
      v11 = v13 >> 1;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL)
      v14 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v6, v14);
    else
      v15 = 0;
    v18 = &v15[4 * v12];
    v19 = &v18[4 * a2];
    v20 = 4 * a2;
    v21 = v18;
    do
    {
      *(_DWORD *)v21 = *a3;
      v21 += 4;
      v20 -= 4;
    }
    while (v20);
    v22 = &v15[4 * v14];
    v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 4)
    {
      v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
      operator delete(v23);
  }
}

_QWORD *std::vector<double>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<long long>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_1D4920BA4(_Unwind_Exception *exception_object)
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

void std::vector<int>::__append(std::vector<int> *this, std::vector<int>::size_type __n, std::vector<int>::const_reference __x)
{
  std::__compressed_pair<int *> *p_end_cap;
  int *v7;
  int *value;
  int *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  std::vector<int>::size_type v16;
  int *v17;
  int *v18;
  int *v19;
  std::vector<int>::size_type v20;
  int *v21;
  int *v22;
  std::vector<int>::pointer begin;
  std::vector<int>::pointer i;
  int v25;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  v7 = value;
  v9 = p_end_cap[-1].__value_;
  if (__n <= value - v9)
  {
    if (__n)
    {
      v16 = 4 * __n;
      v17 = &v9[__n];
      do
      {
        *v9++ = *__x;
        v16 -= 4;
      }
      while (v16);
      v9 = v17;
    }
    this->__end_ = v9;
  }
  else
  {
    v10 = (char *)v9 - (char *)this->__begin_;
    v11 = __n + (v10 >> 2);
    if (v11 >> 62)
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    v12 = v10 >> 2;
    v13 = (char *)v7 - (char *)this->__begin_;
    if (v13 >> 1 > v11)
      v11 = v13 >> 1;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFFCLL)
      v14 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)p_end_cap, v14);
    else
      v15 = 0;
    v18 = (int *)&v15[4 * v12];
    v19 = &v18[__n];
    v20 = 4 * __n;
    v21 = v18;
    do
    {
      *v21++ = *__x;
      v20 -= 4;
    }
    while (v20);
    v22 = (int *)&v15[4 * v14];
    begin = this->__begin_;
    for (i = this->__end_; i != begin; --i)
    {
      v25 = *(i - 1);
      *--v18 = v25;
    }
    this->__begin_ = v18;
    this->__end_ = v19;
    this->__end_cap_.__value_ = v22;
    if (begin)
      operator delete(begin);
  }
}

void faiss::LinearTransform::set_is_orthonormal()
{
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "Faiss assertion '%s' failed in %s at %s:%d\n", "A.size() >= d_out * d_in", "void faiss::LinearTransform::set_is_orthonormal()", "/Library/Caches/com.apple.xbs/Sources/VisualSearch/VisualIntelligence/VisualIntelligence/Vendor/faiss_search/faiss/faiss/VectorTransform.cpp", 249);
  abort();
}

uint64_t sub_1D4920D20()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1D4920D2C()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1D4920D38()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1D4920D44()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1D4920D50()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1D4920D5C()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1D4920D68()
{
  return MEMORY[0x1E0CAE3B0]();
}

uint64_t sub_1D4920D74()
{
  return MEMORY[0x1E0CAE3D8]();
}

uint64_t sub_1D4920D80()
{
  return MEMORY[0x1E0CAE488]();
}

uint64_t sub_1D4920D8C()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1D4920D98()
{
  return MEMORY[0x1E0CAE618]();
}

uint64_t sub_1D4920DA4()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_1D4920DB0()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1D4920DBC()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_1D4920DC8()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1D4920DD4()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1D4920DE0()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1D4920DEC()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1D4920DF8()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t sub_1D4920E04()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t sub_1D4920E10()
{
  return MEMORY[0x1E0CAEB40]();
}

uint64_t sub_1D4920E1C()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t sub_1D4920E28()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1D4920E34()
{
  return MEMORY[0x1E0CAF5C8]();
}

uint64_t sub_1D4920E40()
{
  return MEMORY[0x1E0CAF5F8]();
}

uint64_t sub_1D4920E4C()
{
  return MEMORY[0x1E0CAF608]();
}

uint64_t sub_1D4920E58()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1D4920E64()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1D4920E70()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_1D4920E7C()
{
  return MEMORY[0x1E0CAFD98]();
}

uint64_t sub_1D4920E88()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1D4920E94()
{
  return MEMORY[0x1E0CAFDB8]();
}

uint64_t sub_1D4920EA0()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1D4920EAC()
{
  return MEMORY[0x1E0CAFE08]();
}

uint64_t sub_1D4920EB8()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1D4920EC4()
{
  return MEMORY[0x1E0CAFE68]();
}

uint64_t sub_1D4920ED0()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_1D4920EDC()
{
  return MEMORY[0x1E0CAFE90]();
}

uint64_t sub_1D4920EE8()
{
  return MEMORY[0x1E0CAFED8]();
}

uint64_t sub_1D4920EF4()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1D4920F00()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1D4920F0C()
{
  return MEMORY[0x1E0CAFF98]();
}

uint64_t sub_1D4920F18()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1D4920F24()
{
  return MEMORY[0x1E0CB00A0]();
}

uint64_t sub_1D4920F30()
{
  return MEMORY[0x1E0CB0110]();
}

uint64_t sub_1D4920F3C()
{
  return MEMORY[0x1E0CB0118]();
}

uint64_t sub_1D4920F48()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_1D4920F54()
{
  return MEMORY[0x1E0CB01B0]();
}

uint64_t sub_1D4920F60()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1D4920F6C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1D4920F78()
{
  return MEMORY[0x1E0CB03D0]();
}

uint64_t sub_1D4920F84()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1D4920F90()
{
  return MEMORY[0x1E0CB0708]();
}

uint64_t sub_1D4920F9C()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1D4920FA8()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1D4920FB4()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1D4920FC0()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1D4920FCC()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1D4920FD8()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1D4920FE4()
{
  return MEMORY[0x1E0CB0A80]();
}

uint64_t sub_1D4920FF0()
{
  return MEMORY[0x1E0CB0A90]();
}

uint64_t sub_1D4920FFC()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1D4921008()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1D4921014()
{
  return MEMORY[0x1E0D6CA30]();
}

uint64_t sub_1D4921020()
{
  return MEMORY[0x1E0D6CA40]();
}

uint64_t sub_1D492102C()
{
  return MEMORY[0x1E0D6CA48]();
}

uint64_t sub_1D4921038()
{
  return MEMORY[0x1E0D6CA50]();
}

uint64_t sub_1D4921044()
{
  return MEMORY[0x1E0D6CAF0]();
}

uint64_t sub_1D4921050()
{
  return MEMORY[0x1E0D6CB00]();
}

uint64_t sub_1D492105C()
{
  return MEMORY[0x1E0D6CB08]();
}

uint64_t sub_1D4921068()
{
  return MEMORY[0x1E0D6CB20]();
}

uint64_t sub_1D4921074()
{
  return MEMORY[0x1E0D6CB48]();
}

uint64_t sub_1D4921080()
{
  return MEMORY[0x1E0D6CB50]();
}

uint64_t sub_1D492108C()
{
  return MEMORY[0x1E0D6CB58]();
}

uint64_t sub_1D4921098()
{
  return MEMORY[0x1E0D6CB68]();
}

uint64_t sub_1D49210A4()
{
  return MEMORY[0x1E0D6CC40]();
}

uint64_t sub_1D49210B0()
{
  return MEMORY[0x1E0D6CC48]();
}

uint64_t sub_1D49210BC()
{
  return MEMORY[0x1E0D6CC50]();
}

uint64_t sub_1D49210C8()
{
  return MEMORY[0x1E0D6D200]();
}

uint64_t sub_1D49210D4()
{
  return MEMORY[0x1E0D6D208]();
}

uint64_t sub_1D49210E0()
{
  return MEMORY[0x1E0D6D210]();
}

uint64_t sub_1D49210EC()
{
  return MEMORY[0x1E0D6D230]();
}

uint64_t sub_1D49210F8()
{
  return MEMORY[0x1E0D6D238]();
}

uint64_t sub_1D4921104()
{
  return MEMORY[0x1E0D6D258]();
}

uint64_t sub_1D4921110()
{
  return MEMORY[0x1E0D6D270]();
}

uint64_t sub_1D492111C()
{
  return MEMORY[0x1E0D6D6C0]();
}

uint64_t sub_1D4921128()
{
  return MEMORY[0x1E0D6D6C8]();
}

uint64_t sub_1D4921134()
{
  return MEMORY[0x1E0D6D700]();
}

uint64_t sub_1D4921140()
{
  return MEMORY[0x1E0D6D718]();
}

uint64_t sub_1D492114C()
{
  return MEMORY[0x1E0D6D720]();
}

uint64_t sub_1D4921158()
{
  return MEMORY[0x1E0D6D728]();
}

uint64_t sub_1D4921164()
{
  return MEMORY[0x1E0D6D730]();
}

uint64_t sub_1D4921170()
{
  return MEMORY[0x1E0D6D738]();
}

uint64_t sub_1D492117C()
{
  return MEMORY[0x1E0D6D740]();
}

uint64_t sub_1D4921188()
{
  return MEMORY[0x1E0D6D748]();
}

uint64_t sub_1D4921194()
{
  return MEMORY[0x1E0D6D750]();
}

uint64_t sub_1D49211A0()
{
  return MEMORY[0x1E0D6D758]();
}

uint64_t sub_1D49211AC()
{
  return MEMORY[0x1E0D6D760]();
}

uint64_t sub_1D49211B8()
{
  return MEMORY[0x1E0D6D768]();
}

uint64_t sub_1D49211C4()
{
  return MEMORY[0x1E0D6D770]();
}

uint64_t sub_1D49211D0()
{
  return MEMORY[0x1E0D6D778]();
}

uint64_t sub_1D49211DC()
{
  return MEMORY[0x1E0D6D780]();
}

uint64_t sub_1D49211E8()
{
  return MEMORY[0x1E0D6D7B0]();
}

uint64_t sub_1D49211F4()
{
  return MEMORY[0x1E0D6D7B8]();
}

uint64_t sub_1D4921200()
{
  return MEMORY[0x1E0D6D7C0]();
}

uint64_t sub_1D492120C()
{
  return MEMORY[0x1E0D6D7C8]();
}

uint64_t sub_1D4921218()
{
  return MEMORY[0x1E0D6D7D0]();
}

uint64_t sub_1D4921224()
{
  return MEMORY[0x1E0D6D7D8]();
}

uint64_t sub_1D4921230()
{
  return MEMORY[0x1E0D6D7E0]();
}

uint64_t sub_1D492123C()
{
  return MEMORY[0x1E0D6D820]();
}

uint64_t sub_1D4921248()
{
  return MEMORY[0x1E0D6D828]();
}

uint64_t sub_1D4921254()
{
  return MEMORY[0x1E0D6D840]();
}

uint64_t sub_1D4921260()
{
  return MEMORY[0x1E0D6D848]();
}

uint64_t sub_1D492126C()
{
  return MEMORY[0x1E0D6D850]();
}

uint64_t sub_1D4921278()
{
  return MEMORY[0x1E0D6D858]();
}

uint64_t sub_1D4921284()
{
  return MEMORY[0x1E0D6D860]();
}

uint64_t sub_1D4921290()
{
  return MEMORY[0x1E0D6D868]();
}

uint64_t sub_1D492129C()
{
  return MEMORY[0x1E0D6D890]();
}

uint64_t sub_1D49212A8()
{
  return MEMORY[0x1E0D6D898]();
}

uint64_t sub_1D49212B4()
{
  return MEMORY[0x1E0D6D8A0]();
}

uint64_t sub_1D49212C0()
{
  return MEMORY[0x1E0D6D8D0]();
}

uint64_t sub_1D49212CC()
{
  return MEMORY[0x1E0D6D8D8]();
}

uint64_t sub_1D49212D8()
{
  return MEMORY[0x1E0D6D8E0]();
}

uint64_t sub_1D49212E4()
{
  return MEMORY[0x1E0D6D8E8]();
}

uint64_t sub_1D49212F0()
{
  return MEMORY[0x1E0D6D8F0]();
}

uint64_t sub_1D49212FC()
{
  return MEMORY[0x1E0D6DD08]();
}

uint64_t sub_1D4921308()
{
  return MEMORY[0x1E0D6DFA8]();
}

uint64_t sub_1D4921314()
{
  return MEMORY[0x1E0D6DFB0]();
}

uint64_t sub_1D4921320()
{
  return MEMORY[0x1E0D6E190]();
}

uint64_t sub_1D492132C()
{
  return MEMORY[0x1E0D6E198]();
}

uint64_t sub_1D4921338()
{
  return MEMORY[0x1E0D6E1A0]();
}

uint64_t sub_1D4921344()
{
  return MEMORY[0x1E0D6E1A8]();
}

uint64_t sub_1D4921350()
{
  return MEMORY[0x1E0D6E320]();
}

uint64_t sub_1D492135C()
{
  return MEMORY[0x1E0D6E328]();
}

uint64_t sub_1D4921368()
{
  return MEMORY[0x1E0D6E330]();
}

uint64_t sub_1D4921374()
{
  return MEMORY[0x1E0D6E350]();
}

uint64_t sub_1D4921380()
{
  return MEMORY[0x1E0D6E358]();
}

uint64_t sub_1D492138C()
{
  return MEMORY[0x1E0D6E368]();
}

uint64_t sub_1D4921398()
{
  return MEMORY[0x1E0D6E378]();
}

uint64_t sub_1D49213A4()
{
  return MEMORY[0x1E0D6E390]();
}

uint64_t sub_1D49213B0()
{
  return MEMORY[0x1E0D6E398]();
}

uint64_t sub_1D49213BC()
{
  return MEMORY[0x1E0D6E3A8]();
}

uint64_t sub_1D49213C8()
{
  return MEMORY[0x1E0D6E5C8]();
}

uint64_t sub_1D49213D4()
{
  return MEMORY[0x1E0D6E5D0]();
}

uint64_t sub_1D49213E0()
{
  return MEMORY[0x1E0D6E5D8]();
}

uint64_t sub_1D49213EC()
{
  return MEMORY[0x1E0D6E5E0]();
}

uint64_t sub_1D49213F8()
{
  return MEMORY[0x1E0D6E5E8]();
}

uint64_t sub_1D4921404()
{
  return MEMORY[0x1E0D6E5F0]();
}

uint64_t sub_1D4921410()
{
  return MEMORY[0x1E0D6E600]();
}

uint64_t sub_1D492141C()
{
  return MEMORY[0x1E0D6E608]();
}

uint64_t sub_1D4921428()
{
  return MEMORY[0x1E0D6E618]();
}

uint64_t sub_1D4921434()
{
  return MEMORY[0x1E0D6E620]();
}

uint64_t sub_1D4921440()
{
  return MEMORY[0x1E0D6E630]();
}

uint64_t sub_1D492144C()
{
  return MEMORY[0x1E0D6E638]();
}

uint64_t sub_1D4921458()
{
  return MEMORY[0x1E0D6E640]();
}

uint64_t sub_1D4921464()
{
  return MEMORY[0x1E0D6E8C0]();
}

uint64_t sub_1D4921470()
{
  return MEMORY[0x1E0D6E8D0]();
}

uint64_t sub_1D492147C()
{
  return MEMORY[0x1E0D6EA50]();
}

uint64_t sub_1D4921488()
{
  return MEMORY[0x1E0D6EA58]();
}

uint64_t sub_1D4921494()
{
  return MEMORY[0x1E0D6EA60]();
}

uint64_t sub_1D49214A0()
{
  return MEMORY[0x1E0D6EA68]();
}

uint64_t sub_1D49214AC()
{
  return MEMORY[0x1E0D6EA70]();
}

uint64_t sub_1D49214B8()
{
  return MEMORY[0x1E0D6EA78]();
}

uint64_t sub_1D49214C4()
{
  return MEMORY[0x1E0D6EA80]();
}

uint64_t sub_1D49214D0()
{
  return MEMORY[0x1E0D6EA88]();
}

uint64_t sub_1D49214DC()
{
  return MEMORY[0x1E0D6EA98]();
}

uint64_t sub_1D49214E8()
{
  return MEMORY[0x1E0D6EAA0]();
}

uint64_t sub_1D49214F4()
{
  return MEMORY[0x1E0D6EAA8]();
}

uint64_t sub_1D4921500()
{
  return MEMORY[0x1E0D6EAB8]();
}

uint64_t sub_1D492150C()
{
  return MEMORY[0x1E0D6EAC0]();
}

uint64_t sub_1D4921518()
{
  return MEMORY[0x1E0D6EAC8]();
}

uint64_t sub_1D4921524()
{
  return MEMORY[0x1E0D6EAD8]();
}

uint64_t sub_1D4921530()
{
  return MEMORY[0x1E0D6EAE0]();
}

uint64_t sub_1D492153C()
{
  return MEMORY[0x1E0D6EAE8]();
}

uint64_t sub_1D4921548()
{
  return MEMORY[0x1E0D6EB20]();
}

uint64_t sub_1D4921554()
{
  return MEMORY[0x1E0D6EB28]();
}

uint64_t sub_1D4921560()
{
  return MEMORY[0x1E0D6EB30]();
}

uint64_t sub_1D492156C()
{
  return MEMORY[0x1E0D6EB38]();
}

uint64_t sub_1D4921578()
{
  return MEMORY[0x1E0D6EB48]();
}

uint64_t sub_1D4921584()
{
  return MEMORY[0x1E0D6EB50]();
}

uint64_t sub_1D4921590()
{
  return MEMORY[0x1E0D6EB58]();
}

uint64_t sub_1D492159C()
{
  return MEMORY[0x1E0D6EB60]();
}

uint64_t sub_1D49215A8()
{
  return MEMORY[0x1E0D6EB70]();
}

uint64_t sub_1D49215B4()
{
  return MEMORY[0x1E0D6EB78]();
}

uint64_t sub_1D49215C0()
{
  return MEMORY[0x1E0D6EB80]();
}

uint64_t sub_1D49215CC()
{
  return MEMORY[0x1E0D6ED38]();
}

uint64_t sub_1D49215D8()
{
  return MEMORY[0x1E0D6ED40]();
}

uint64_t sub_1D49215E4()
{
  return MEMORY[0x1E0D6ED48]();
}

uint64_t sub_1D49215F0()
{
  return MEMORY[0x1E0D6ED50]();
}

uint64_t sub_1D49215FC()
{
  return MEMORY[0x1E0D6ED58]();
}

uint64_t sub_1D4921608()
{
  return MEMORY[0x1E0D6ED60]();
}

uint64_t sub_1D4921614()
{
  return MEMORY[0x1E0D6ED68]();
}

uint64_t sub_1D4921620()
{
  return MEMORY[0x1E0D6ED70]();
}

uint64_t sub_1D492162C()
{
  return MEMORY[0x1E0D6ED78]();
}

uint64_t sub_1D4921638()
{
  return MEMORY[0x1E0D6ED80]();
}

uint64_t sub_1D4921644()
{
  return MEMORY[0x1E0D6EEC8]();
}

uint64_t sub_1D4921650()
{
  return MEMORY[0x1E0D6EED8]();
}

uint64_t sub_1D492165C()
{
  return MEMORY[0x1E0D6EEE0]();
}

uint64_t sub_1D4921668()
{
  return MEMORY[0x1E0D6EEF0]();
}

uint64_t sub_1D4921674()
{
  return MEMORY[0x1E0D6EF00]();
}

uint64_t sub_1D4921680()
{
  return MEMORY[0x1E0D6EF08]();
}

uint64_t sub_1D492168C()
{
  return MEMORY[0x1E0D6EF20]();
}

uint64_t sub_1D4921698()
{
  return MEMORY[0x1E0D6EFD0]();
}

uint64_t sub_1D49216A4()
{
  return MEMORY[0x1E0D6EFE0]();
}

uint64_t sub_1D49216B0()
{
  return MEMORY[0x1E0D6EFE8]();
}

uint64_t sub_1D49216BC()
{
  return MEMORY[0x1E0D6EFF0]();
}

uint64_t sub_1D49216C8()
{
  return MEMORY[0x1E0D6EFF8]();
}

uint64_t sub_1D49216D4()
{
  return MEMORY[0x1E0D6F000]();
}

uint64_t sub_1D49216E0()
{
  return MEMORY[0x1E0D6F008]();
}

uint64_t sub_1D49216EC()
{
  return MEMORY[0x1E0D6F010]();
}

uint64_t sub_1D49216F8()
{
  return MEMORY[0x1E0D6F018]();
}

uint64_t sub_1D4921704()
{
  return MEMORY[0x1E0D6F020]();
}

uint64_t sub_1D4921710()
{
  return MEMORY[0x1E0D6F028]();
}

uint64_t sub_1D492171C()
{
  return MEMORY[0x1E0D6F030]();
}

uint64_t sub_1D4921728()
{
  return MEMORY[0x1E0D6F038]();
}

uint64_t sub_1D4921734()
{
  return MEMORY[0x1E0D6F040]();
}

uint64_t sub_1D4921740()
{
  return MEMORY[0x1E0D6F048]();
}

uint64_t sub_1D492174C()
{
  return MEMORY[0x1E0D6F050]();
}

uint64_t sub_1D4921758()
{
  return MEMORY[0x1E0D6F058]();
}

uint64_t sub_1D4921764()
{
  return MEMORY[0x1E0D6F060]();
}

uint64_t sub_1D4921770()
{
  return MEMORY[0x1E0D6F068]();
}

uint64_t sub_1D492177C()
{
  return MEMORY[0x1E0D6F070]();
}

uint64_t sub_1D4921788()
{
  return MEMORY[0x1E0D6F080]();
}

uint64_t sub_1D4921794()
{
  return MEMORY[0x1E0D6F088]();
}

uint64_t sub_1D49217A0()
{
  return MEMORY[0x1E0D6F090]();
}

uint64_t sub_1D49217AC()
{
  return MEMORY[0x1E0D6F098]();
}

uint64_t sub_1D49217B8()
{
  return MEMORY[0x1E0D6F0A0]();
}

uint64_t sub_1D49217C4()
{
  return MEMORY[0x1E0D6F0A8]();
}

uint64_t sub_1D49217D0()
{
  return MEMORY[0x1E0D6F0B0]();
}

uint64_t sub_1D49217DC()
{
  return MEMORY[0x1E0D6F0B8]();
}

uint64_t sub_1D49217E8()
{
  return MEMORY[0x1E0D6F0C0]();
}

uint64_t sub_1D49217F4()
{
  return MEMORY[0x1E0D6F0C8]();
}

uint64_t sub_1D4921800()
{
  return MEMORY[0x1E0D6F0D0]();
}

uint64_t sub_1D492180C()
{
  return MEMORY[0x1E0D6F0D8]();
}

uint64_t sub_1D4921818()
{
  return MEMORY[0x1E0D6F2B0]();
}

uint64_t sub_1D4921824()
{
  return MEMORY[0x1E0D6F2B8]();
}

uint64_t sub_1D4921830()
{
  return MEMORY[0x1E0D6F2C0]();
}

uint64_t sub_1D492183C()
{
  return MEMORY[0x1E0D6F2C8]();
}

uint64_t sub_1D4921848()
{
  return MEMORY[0x1E0D6F2D0]();
}

uint64_t sub_1D4921854()
{
  return MEMORY[0x1E0D6F2E0]();
}

uint64_t sub_1D4921860()
{
  return MEMORY[0x1E0D6F2E8]();
}

uint64_t sub_1D492186C()
{
  return MEMORY[0x1E0D6F2F0]();
}

uint64_t sub_1D4921878()
{
  return MEMORY[0x1E0D6F2F8]();
}

uint64_t sub_1D4921884()
{
  return MEMORY[0x1E0D6F308]();
}

uint64_t sub_1D4921890()
{
  return MEMORY[0x1E0D6F310]();
}

uint64_t sub_1D492189C()
{
  return MEMORY[0x1E0D6F320]();
}

uint64_t sub_1D49218A8()
{
  return MEMORY[0x1E0D6F328]();
}

uint64_t sub_1D49218B4()
{
  return MEMORY[0x1E0D6F330]();
}

uint64_t sub_1D49218C0()
{
  return MEMORY[0x1E0D6F600]();
}

uint64_t sub_1D49218CC()
{
  return MEMORY[0x1E0D6F610]();
}

uint64_t sub_1D49218D8()
{
  return MEMORY[0x1E0D6F618]();
}

uint64_t sub_1D49218E4()
{
  return MEMORY[0x1E0D6F628]();
}

uint64_t sub_1D49218F0()
{
  return MEMORY[0x1E0D6F638]();
}

uint64_t sub_1D49218FC()
{
  return MEMORY[0x1E0D6F640]();
}

uint64_t sub_1D4921908()
{
  return MEMORY[0x1E0D6F650]();
}

uint64_t sub_1D4921914()
{
  return MEMORY[0x1E0D6F658]();
}

uint64_t sub_1D4921920()
{
  return MEMORY[0x1E0D6F660]();
}

uint64_t sub_1D492192C()
{
  return MEMORY[0x1E0D6F668]();
}

uint64_t sub_1D4921938()
{
  return MEMORY[0x1E0D6F670]();
}

uint64_t sub_1D4921944()
{
  return MEMORY[0x1E0D6F678]();
}

uint64_t sub_1D4921950()
{
  return MEMORY[0x1E0D6F688]();
}

uint64_t sub_1D492195C()
{
  return MEMORY[0x1E0D6F888]();
}

uint64_t sub_1D4921968()
{
  return MEMORY[0x1E0D6F890]();
}

uint64_t sub_1D4921974()
{
  return MEMORY[0x1E0D6F898]();
}

uint64_t sub_1D4921980()
{
  return MEMORY[0x1E0D6F8A0]();
}

uint64_t sub_1D492198C()
{
  return MEMORY[0x1E0D6F8A8]();
}

uint64_t sub_1D4921998()
{
  return MEMORY[0x1E0D6F8B8]();
}

uint64_t sub_1D49219A4()
{
  return MEMORY[0x1E0D6F8C0]();
}

uint64_t sub_1D49219B0()
{
  return MEMORY[0x1E0D6F8C8]();
}

uint64_t sub_1D49219BC()
{
  return MEMORY[0x1E0D6F8D0]();
}

uint64_t sub_1D49219C8()
{
  return MEMORY[0x1E0D6F8D8]();
}

uint64_t sub_1D49219D4()
{
  return MEMORY[0x1E0D6F990]();
}

uint64_t sub_1D49219E0()
{
  return MEMORY[0x1E0D6F998]();
}

uint64_t sub_1D49219EC()
{
  return MEMORY[0x1E0D6F9A0]();
}

uint64_t sub_1D49219F8()
{
  return MEMORY[0x1E0D6FBB0]();
}

uint64_t sub_1D4921A04()
{
  return MEMORY[0x1E0D6FBB8]();
}

uint64_t sub_1D4921A10()
{
  return MEMORY[0x1E0D6FBD0]();
}

uint64_t sub_1D4921A1C()
{
  return MEMORY[0x1E0D6FD40]();
}

uint64_t sub_1D4921A28()
{
  return MEMORY[0x1E0D6FD48]();
}

uint64_t sub_1D4921A34()
{
  return MEMORY[0x1E0D6FD58]();
}

uint64_t sub_1D4921A40()
{
  return MEMORY[0x1E0D6FD60]();
}

uint64_t sub_1D4921A4C()
{
  return MEMORY[0x1E0D6FD70]();
}

uint64_t sub_1D4921A58()
{
  return MEMORY[0x1E0D6FD78]();
}

uint64_t sub_1D4921A64()
{
  return MEMORY[0x1E0D6FD80]();
}

uint64_t sub_1D4921A70()
{
  return MEMORY[0x1E0D6FD88]();
}

uint64_t sub_1D4921A7C()
{
  return MEMORY[0x1E0D6FD90]();
}

uint64_t sub_1D4921A88()
{
  return MEMORY[0x1E0D6FDB0]();
}

uint64_t sub_1D4921A94()
{
  return MEMORY[0x1E0D6FDB8]();
}

uint64_t sub_1D4921AA0()
{
  return MEMORY[0x1E0D6FDC0]();
}

uint64_t sub_1D4921AAC()
{
  return MEMORY[0x1E0D6FE98]();
}

uint64_t sub_1D4921AB8()
{
  return MEMORY[0x1E0D6FEA8]();
}

uint64_t sub_1D4921AC4()
{
  return MEMORY[0x1E0D6FEC0]();
}

uint64_t sub_1D4921AD0()
{
  return MEMORY[0x1E0D6FEC8]();
}

uint64_t sub_1D4921ADC()
{
  return MEMORY[0x1E0D6FED0]();
}

uint64_t sub_1D4921AE8()
{
  return MEMORY[0x1E0D6FF28]();
}

uint64_t sub_1D4921AF4()
{
  return MEMORY[0x1E0D6FF30]();
}

uint64_t sub_1D4921B00()
{
  return MEMORY[0x1E0D6FF38]();
}

uint64_t sub_1D4921B0C()
{
  return MEMORY[0x1E0D70060]();
}

uint64_t sub_1D4921B18()
{
  return MEMORY[0x1E0D70068]();
}

uint64_t sub_1D4921B24()
{
  return MEMORY[0x1E0D70070]();
}

uint64_t sub_1D4921B30()
{
  return MEMORY[0x1E0D70078]();
}

uint64_t sub_1D4921B3C()
{
  return MEMORY[0x1E0D70080]();
}

uint64_t sub_1D4921B48()
{
  return MEMORY[0x1E0D70088]();
}

uint64_t sub_1D4921B54()
{
  return MEMORY[0x1E0D70090]();
}

uint64_t sub_1D4921B60()
{
  return MEMORY[0x1E0D70098]();
}

uint64_t sub_1D4921B6C()
{
  return MEMORY[0x1E0D700A0]();
}

uint64_t sub_1D4921B78()
{
  return MEMORY[0x1E0D700A8]();
}

uint64_t sub_1D4921B84()
{
  return MEMORY[0x1E0D700B0]();
}

uint64_t sub_1D4921B90()
{
  return MEMORY[0x1E0D700C0]();
}

uint64_t sub_1D4921B9C()
{
  return MEMORY[0x1E0D700D0]();
}

uint64_t sub_1D4921BA8()
{
  return MEMORY[0x1E0D700D8]();
}

uint64_t sub_1D4921BB4()
{
  return MEMORY[0x1E0D700E8]();
}

uint64_t sub_1D4921BC0()
{
  return MEMORY[0x1E0D700F0]();
}

uint64_t sub_1D4921BCC()
{
  return MEMORY[0x1E0D700F8]();
}

uint64_t sub_1D4921BD8()
{
  return MEMORY[0x1E0D70100]();
}

uint64_t sub_1D4921BE4()
{
  return MEMORY[0x1E0D70108]();
}

uint64_t sub_1D4921BF0()
{
  return MEMORY[0x1E0D70118]();
}

uint64_t sub_1D4921BFC()
{
  return MEMORY[0x1E0D70120]();
}

uint64_t sub_1D4921C08()
{
  return MEMORY[0x1E0D70130]();
}

uint64_t sub_1D4921C14()
{
  return MEMORY[0x1E0D70138]();
}

uint64_t sub_1D4921C20()
{
  return MEMORY[0x1E0D70140]();
}

uint64_t sub_1D4921C2C()
{
  return MEMORY[0x1E0D70228]();
}

uint64_t sub_1D4921C38()
{
  return MEMORY[0x1E0D70230]();
}

uint64_t sub_1D4921C44()
{
  return MEMORY[0x1E0D70238]();
}

uint64_t sub_1D4921C50()
{
  return MEMORY[0x1E0D70248]();
}

uint64_t sub_1D4921C5C()
{
  return MEMORY[0x1E0D70250]();
}

uint64_t sub_1D4921C68()
{
  return MEMORY[0x1E0D70258]();
}

uint64_t sub_1D4921C74()
{
  return MEMORY[0x1E0D70260]();
}

uint64_t sub_1D4921C80()
{
  return MEMORY[0x1E0D70268]();
}

uint64_t sub_1D4921C8C()
{
  return MEMORY[0x1E0D70270]();
}

uint64_t sub_1D4921C98()
{
  return MEMORY[0x1E0D70280]();
}

uint64_t sub_1D4921CA4()
{
  return MEMORY[0x1E0D70288]();
}

uint64_t sub_1D4921CB0()
{
  return MEMORY[0x1E0D70290]();
}

uint64_t sub_1D4921CBC()
{
  return MEMORY[0x1E0D702A0]();
}

uint64_t sub_1D4921CC8()
{
  return MEMORY[0x1E0D702A8]();
}

uint64_t sub_1D4921CD4()
{
  return MEMORY[0x1E0D702B0]();
}

uint64_t sub_1D4921CE0()
{
  return MEMORY[0x1E0D70368]();
}

uint64_t sub_1D4921CEC()
{
  return MEMORY[0x1E0D70378]();
}

uint64_t sub_1D4921CF8()
{
  return MEMORY[0x1E0D70380]();
}

uint64_t sub_1D4921D04()
{
  return MEMORY[0x1E0D70388]();
}

uint64_t sub_1D4921D10()
{
  return MEMORY[0x1E0D70398]();
}

uint64_t sub_1D4921D1C()
{
  return MEMORY[0x1E0D703A0]();
}

uint64_t sub_1D4921D28()
{
  return MEMORY[0x1E0D70428]();
}

uint64_t sub_1D4921D34()
{
  return MEMORY[0x1E0D70440]();
}

uint64_t sub_1D4921D40()
{
  return MEMORY[0x1E0D70490]();
}

uint64_t sub_1D4921D4C()
{
  return MEMORY[0x1E0D70498]();
}

uint64_t sub_1D4921D58()
{
  return MEMORY[0x1E0D704A0]();
}

uint64_t sub_1D4921D64()
{
  return MEMORY[0x1E0D704A8]();
}

uint64_t sub_1D4921D70()
{
  return MEMORY[0x1E0D70528]();
}

uint64_t sub_1D4921D7C()
{
  return MEMORY[0x1E0D70530]();
}

uint64_t sub_1D4921D88()
{
  return MEMORY[0x1E0D70538]();
}

uint64_t sub_1D4921D94()
{
  return MEMORY[0x1E0D70540]();
}

uint64_t sub_1D4921DA0()
{
  return MEMORY[0x1E0D70580]();
}

uint64_t sub_1D4921DAC()
{
  return MEMORY[0x1E0D70588]();
}

uint64_t sub_1D4921DB8()
{
  return MEMORY[0x1E0D705C8]();
}

uint64_t sub_1D4921DC4()
{
  return MEMORY[0x1E0D705D0]();
}

uint64_t sub_1D4921DD0()
{
  return MEMORY[0x1E0D705D8]();
}

uint64_t sub_1D4921DDC()
{
  return MEMORY[0x1E0D705F8]();
}

uint64_t sub_1D4921DE8()
{
  return MEMORY[0x1E0D70608]();
}

uint64_t sub_1D4921DF4()
{
  return MEMORY[0x1E0D70760]();
}

uint64_t sub_1D4921E00()
{
  return MEMORY[0x1E0D70770]();
}

uint64_t sub_1D4921E0C()
{
  return MEMORY[0x1E0D70778]();
}

uint64_t sub_1D4921E18()
{
  return MEMORY[0x1E0D70780]();
}

uint64_t sub_1D4921E24()
{
  return MEMORY[0x1E0D70790]();
}

uint64_t sub_1D4921E30()
{
  return MEMORY[0x1E0D707A0]();
}

uint64_t sub_1D4921E3C()
{
  return MEMORY[0x1E0D707D0]();
}

uint64_t sub_1D4921E48()
{
  return MEMORY[0x1E0D707D8]();
}

uint64_t sub_1D4921E54()
{
  return MEMORY[0x1E0D707F0]();
}

uint64_t sub_1D4921E60()
{
  return MEMORY[0x1E0D707F8]();
}

uint64_t sub_1D4921E6C()
{
  return MEMORY[0x1E0D70850]();
}

uint64_t sub_1D4921E78()
{
  return MEMORY[0x1E0D70858]();
}

uint64_t sub_1D4921E84()
{
  return MEMORY[0x1E0D70860]();
}

uint64_t sub_1D4921E90()
{
  return MEMORY[0x1E0D70878]();
}

uint64_t sub_1D4921E9C()
{
  return MEMORY[0x1E0D70880]();
}

uint64_t sub_1D4921EA8()
{
  return MEMORY[0x1E0D70888]();
}

uint64_t sub_1D4921EB4()
{
  return MEMORY[0x1E0D70928]();
}

uint64_t sub_1D4921EC0()
{
  return MEMORY[0x1E0D70930]();
}

uint64_t sub_1D4921ECC()
{
  return MEMORY[0x1E0D70938]();
}

uint64_t sub_1D4921ED8()
{
  return MEMORY[0x1E0CB1718]();
}

uint64_t sub_1D4921EE4()
{
  return MEMORY[0x1E0DEFDD0]();
}

uint64_t sub_1D4921EF0()
{
  return MEMORY[0x1E0DEFDD8]();
}

uint64_t sub_1D4921EFC()
{
  return MEMORY[0x1E0DEFE00]();
}

uint64_t sub_1D4921F08()
{
  return MEMORY[0x1E0DEFE28]();
}

uint64_t sub_1D4921F14()
{
  return MEMORY[0x1E0DEFE40]();
}

uint64_t sub_1D4921F20()
{
  return MEMORY[0x1E0DEFEE0]();
}

uint64_t sub_1D4921F2C()
{
  return MEMORY[0x1E0DEFEF0]();
}

uint64_t sub_1D4921F38()
{
  return MEMORY[0x1E0DEFF00]();
}

uint64_t sub_1D4921F44()
{
  return MEMORY[0x1E0DF1DE0]();
}

uint64_t sub_1D4921F50()
{
  return MEMORY[0x1E0DF1DF0]();
}

uint64_t sub_1D4921F5C()
{
  return MEMORY[0x1E0DF1E00]();
}

uint64_t sub_1D4921F68()
{
  return MEMORY[0x1E0DF1E18]();
}

uint64_t sub_1D4921F74()
{
  return MEMORY[0x1E0DF1E30]();
}

uint64_t sub_1D4921F80()
{
  return MEMORY[0x1E0DEFF28]();
}

uint64_t sub_1D4921F8C()
{
  return MEMORY[0x1E0DF1EA0]();
}

uint64_t sub_1D4921F98()
{
  return MEMORY[0x1E0DEFF38]();
}

uint64_t sub_1D4921FA4()
{
  return MEMORY[0x1E0DEFF40]();
}

uint64_t sub_1D4921FB0()
{
  return MEMORY[0x1E0D3E640]();
}

uint64_t sub_1D4921FBC()
{
  return MEMORY[0x1E0D3E7F8]();
}

uint64_t sub_1D4921FC8()
{
  return MEMORY[0x1E0D3E800]();
}

uint64_t sub_1D4921FD4()
{
  return MEMORY[0x1E0D3E828]();
}

uint64_t sub_1D4921FE0()
{
  return MEMORY[0x1E0D3E900]();
}

uint64_t sub_1D4921FEC()
{
  return MEMORY[0x1E0D3E918]();
}

uint64_t sub_1D4921FF8()
{
  return MEMORY[0x1E0D3E958]();
}

uint64_t sub_1D4922004()
{
  return MEMORY[0x1E0D3E988]();
}

uint64_t sub_1D4922010()
{
  return MEMORY[0x1E0D3E990]();
}

uint64_t sub_1D492201C()
{
  return MEMORY[0x1E0D3E998]();
}

uint64_t sub_1D4922028()
{
  return MEMORY[0x1E0D3EA28]();
}

uint64_t sub_1D4922034()
{
  return MEMORY[0x1E0D3EA30]();
}

uint64_t sub_1D4922040()
{
  return MEMORY[0x1E0D3EA60]();
}

uint64_t sub_1D492204C()
{
  return MEMORY[0x1E0D3EA68]();
}

uint64_t sub_1D4922058()
{
  return MEMORY[0x1E0D3EA78]();
}

uint64_t sub_1D4922064()
{
  return MEMORY[0x1E0D3EA80]();
}

uint64_t sub_1D4922070()
{
  return MEMORY[0x1E0D3EA90]();
}

uint64_t sub_1D492207C()
{
  return MEMORY[0x1E0D3EA98]();
}

uint64_t sub_1D4922088()
{
  return MEMORY[0x1E0D3EAA0]();
}

uint64_t sub_1D4922094()
{
  return MEMORY[0x1E0D3EAA8]();
}

uint64_t sub_1D49220A0()
{
  return MEMORY[0x1E0D3EAB0]();
}

uint64_t sub_1D49220AC()
{
  return MEMORY[0x1E0D3EAB8]();
}

uint64_t sub_1D49220B8()
{
  return MEMORY[0x1E0D3EAC0]();
}

uint64_t sub_1D49220C4()
{
  return MEMORY[0x1E0D3EAD8]();
}

uint64_t sub_1D49220D0()
{
  return MEMORY[0x1E0D3EAE8]();
}

uint64_t sub_1D49220DC()
{
  return MEMORY[0x1E0D3EAF8]();
}

uint64_t sub_1D49220E8()
{
  return MEMORY[0x1E0D3EB00]();
}

uint64_t sub_1D49220F4()
{
  return MEMORY[0x1E0D3EB08]();
}

uint64_t sub_1D4922100()
{
  return MEMORY[0x1E0D3EB18]();
}

uint64_t sub_1D492210C()
{
  return MEMORY[0x1E0D3EB28]();
}

uint64_t sub_1D4922118()
{
  return MEMORY[0x1E0D3EB38]();
}

uint64_t sub_1D4922124()
{
  return MEMORY[0x1E0D3EB48]();
}

uint64_t sub_1D4922130()
{
  return MEMORY[0x1E0D3EB58]();
}

uint64_t sub_1D492213C()
{
  return MEMORY[0x1E0D3EB60]();
}

uint64_t sub_1D4922148()
{
  return MEMORY[0x1E0D3EB68]();
}

uint64_t sub_1D4922154()
{
  return MEMORY[0x1E0D3EB70]();
}

uint64_t sub_1D4922160()
{
  return MEMORY[0x1E0D3EB78]();
}

uint64_t sub_1D492216C()
{
  return MEMORY[0x1E0D3EB90]();
}

uint64_t sub_1D4922178()
{
  return MEMORY[0x1E0D3EBA0]();
}

uint64_t sub_1D4922184()
{
  return MEMORY[0x1E0D3EBB0]();
}

uint64_t sub_1D4922190()
{
  return MEMORY[0x1E0D3EBC0]();
}

uint64_t sub_1D492219C()
{
  return MEMORY[0x1E0D3EBD8]();
}

uint64_t sub_1D49221A8()
{
  return MEMORY[0x1E0D3EC10]();
}

uint64_t sub_1D49221B4()
{
  return MEMORY[0x1E0D3EC48]();
}

uint64_t sub_1D49221C0()
{
  return MEMORY[0x1E0D3EC50]();
}

uint64_t sub_1D49221CC()
{
  return MEMORY[0x1E0D3EC58]();
}

uint64_t sub_1D49221D8()
{
  return MEMORY[0x1E0D3EC68]();
}

uint64_t sub_1D49221E4()
{
  return MEMORY[0x1E0D3EC70]();
}

uint64_t sub_1D49221F0()
{
  return MEMORY[0x1E0D3EC80]();
}

uint64_t sub_1D49221FC()
{
  return MEMORY[0x1E0D3EC88]();
}

uint64_t sub_1D4922208()
{
  return MEMORY[0x1E0D3ECA0]();
}

uint64_t sub_1D4922214()
{
  return MEMORY[0x1E0D3ECA8]();
}

uint64_t sub_1D4922220()
{
  return MEMORY[0x1E0D3ECB0]();
}

uint64_t sub_1D492222C()
{
  return MEMORY[0x1E0D3ECC0]();
}

uint64_t sub_1D4922238()
{
  return MEMORY[0x1E0D3ECC8]();
}

uint64_t sub_1D4922244()
{
  return MEMORY[0x1E0D3ECD0]();
}

uint64_t sub_1D4922250()
{
  return MEMORY[0x1E0D3ECE0]();
}

uint64_t sub_1D492225C()
{
  return MEMORY[0x1E0D3ECE8]();
}

uint64_t sub_1D4922268()
{
  return MEMORY[0x1E0D3ECF8]();
}

uint64_t sub_1D4922274()
{
  return MEMORY[0x1E0D3ED00]();
}

uint64_t sub_1D4922280()
{
  return MEMORY[0x1E0D3ED28]();
}

uint64_t sub_1D492228C()
{
  return MEMORY[0x1E0D3ED30]();
}

uint64_t sub_1D4922298()
{
  return MEMORY[0x1E0D3ED38]();
}

uint64_t sub_1D49222A4()
{
  return MEMORY[0x1E0D3ED40]();
}

uint64_t sub_1D49222B0()
{
  return MEMORY[0x1E0D3ED48]();
}

uint64_t sub_1D49222BC()
{
  return MEMORY[0x1E0D3ED58]();
}

uint64_t sub_1D49222C8()
{
  return MEMORY[0x1E0D3ED68]();
}

uint64_t sub_1D49222D4()
{
  return MEMORY[0x1E0D3ED70]();
}

uint64_t sub_1D49222E0()
{
  return MEMORY[0x1E0D3ED78]();
}

uint64_t sub_1D49222EC()
{
  return MEMORY[0x1E0D3ED80]();
}

uint64_t sub_1D49222F8()
{
  return MEMORY[0x1E0D3ED98]();
}

uint64_t sub_1D4922304()
{
  return MEMORY[0x1E0D3EF28]();
}

uint64_t sub_1D4922310()
{
  return MEMORY[0x1E0D3EF38]();
}

uint64_t sub_1D492231C()
{
  return MEMORY[0x1E0D3EF40]();
}

uint64_t sub_1D4922328()
{
  return MEMORY[0x1E0D3EF48]();
}

uint64_t sub_1D4922334()
{
  return MEMORY[0x1E0DF2090]();
}

uint64_t sub_1D4922340()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t sub_1D492234C()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1D4922358()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1D4922364()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1D4922370()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1D492237C()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1D4922388()
{
  return MEMORY[0x1E0C9E698]();
}

uint64_t sub_1D4922394()
{
  return MEMORY[0x1E0C9E6E8]();
}

uint64_t sub_1D49223A0()
{
  return MEMORY[0x1E0C9E708]();
}

uint64_t sub_1D49223AC()
{
  return MEMORY[0x1E0DEF3B8]();
}

uint64_t sub_1D49223B8()
{
  return MEMORY[0x1E0C95DE8]();
}

uint64_t sub_1D49223C4()
{
  return MEMORY[0x1E0C96290]();
}

uint64_t sub_1D49223D0()
{
  return MEMORY[0x1E0C96378]();
}

uint64_t sub_1D49223DC()
{
  return MEMORY[0x1E0C96410]();
}

uint64_t sub_1D49223E8()
{
  return MEMORY[0x1E0D10660]();
}

uint64_t sub_1D49223F4()
{
  return MEMORY[0x1E0D10670]();
}

uint64_t sub_1D4922400()
{
  return MEMORY[0x1E0D10678]();
}

uint64_t sub_1D492240C()
{
  return MEMORY[0x1E0D10680]();
}

uint64_t sub_1D4922418()
{
  return MEMORY[0x1E0D10690]();
}

uint64_t sub_1D4922424()
{
  return MEMORY[0x1E0D10698]();
}

uint64_t sub_1D4922430()
{
  return MEMORY[0x1E0D106A0]();
}

uint64_t sub_1D492243C()
{
  return MEMORY[0x1E0D106A8]();
}

uint64_t sub_1D4922448()
{
  return MEMORY[0x1E0D106B0]();
}

uint64_t sub_1D4922454()
{
  return MEMORY[0x1E0D106B8]();
}

uint64_t sub_1D4922460()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1D492246C()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1D4922478()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1D4922484()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1D4922490()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1D492249C()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1D49224A8()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1D49224B4()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1D49224C0()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1D49224CC()
{
  return MEMORY[0x1E0CA91C8]();
}

uint64_t sub_1D49224D8()
{
  return MEMORY[0x1E0CA91E8]();
}

uint64_t sub_1D49224E4()
{
  return MEMORY[0x1E0CA92A8]();
}

uint64_t sub_1D49224F0()
{
  return MEMORY[0x1E0CA92B0]();
}

uint64_t sub_1D49224FC()
{
  return MEMORY[0x1E0CA92C8]();
}

uint64_t sub_1D4922508()
{
  return MEMORY[0x1E0CA92F8]();
}

uint64_t sub_1D4922514()
{
  return MEMORY[0x1E0CA93B0]();
}

uint64_t sub_1D4922520()
{
  return MEMORY[0x1E0CA93C8]();
}

uint64_t sub_1D492252C()
{
  return MEMORY[0x1E0CA9940]();
}

uint64_t sub_1D4922538()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1D4922544()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1D4922550()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1D492255C()
{
  return MEMORY[0x1E0DE9E90]();
}

uint64_t sub_1D4922568()
{
  return MEMORY[0x1E0DE9F38]();
}

uint64_t sub_1D4922574()
{
  return MEMORY[0x1E0DE9F58]();
}

uint64_t sub_1D4922580()
{
  return MEMORY[0x1E0DEA040]();
}

uint64_t sub_1D492258C()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1D4922598()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1D49225A4()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1D49225B0()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1D49225BC()
{
  return MEMORY[0x1E0DEA2B8]();
}

uint64_t sub_1D49225C8()
{
  return MEMORY[0x1E0DF1FA8]();
}

uint64_t sub_1D49225D4()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1D49225E0()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1D49225EC()
{
  return MEMORY[0x1E0C9E798]();
}

uint64_t sub_1D49225F8()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1D4922604()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1D4922610()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1D492261C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1D4922628()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t sub_1D4922634()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_1D4922640()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1D492264C()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1D4922658()
{
  return MEMORY[0x1E0CB19F0]();
}

uint64_t sub_1D4922664()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1D4922670()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1D492267C()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1D4922688()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_1D4922694()
{
  return MEMORY[0x1E0DEA628]();
}

uint64_t sub_1D49226A0()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1D49226AC()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1D49226B8()
{
  return MEMORY[0x1E0DEA6C0]();
}

uint64_t sub_1D49226C4()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1D49226D0()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1D49226DC()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1D49226E8()
{
  return MEMORY[0x1E0DEA7C8]();
}

uint64_t sub_1D49226F4()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_1D4922700()
{
  return MEMORY[0x1E0DEA7F8]();
}

uint64_t sub_1D492270C()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1D4922718()
{
  return MEMORY[0x1E0DEA818]();
}

uint64_t sub_1D4922724()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_1D4922730()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1D492273C()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1D4922748()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1D4922754()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1D4922760()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1D492276C()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1D4922778()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1D4922784()
{
  return MEMORY[0x1E0DEA950]();
}

uint64_t sub_1D4922790()
{
  return MEMORY[0x1E0DEA9C0]();
}

uint64_t sub_1D492279C()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_1D49227A8()
{
  return MEMORY[0x1E0DEAA38]();
}

uint64_t sub_1D49227B4()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1D49227C0()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1D49227CC()
{
  return MEMORY[0x1E0DEAAD8]();
}

uint64_t sub_1D49227D8()
{
  return MEMORY[0x1E0DEABB0]();
}

uint64_t sub_1D49227E4()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1D49227F0()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1D49227FC()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1D4922808()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1D4922814()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1D4922820()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1D492282C()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1D4922838()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1D4922844()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1D4922850()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1D492285C()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1D4922868()
{
  return MEMORY[0x1E0DEAEB8]();
}

uint64_t sub_1D4922874()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1D4922880()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1D492288C()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1D4922898()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1D49228A4()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1D49228B0()
{
  return MEMORY[0x1E0DEB160]();
}

uint64_t sub_1D49228BC()
{
  return MEMORY[0x1E0DEB1F8]();
}

uint64_t sub_1D49228C8()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1D49228D4()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1D49228E0()
{
  return MEMORY[0x1E0DEB220]();
}

uint64_t sub_1D49228EC()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1D49228F8()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1D4922904()
{
  return MEMORY[0x1E0C9E7E0]();
}

uint64_t sub_1D4922910()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1D492291C()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1D4922928()
{
  return MEMORY[0x1E0CB1E50]();
}

uint64_t sub_1D4922934()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1D4922940()
{
  return MEMORY[0x1E0DEF868]();
}

uint64_t sub_1D492294C()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1D4922958()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1D4922964()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1D4922970()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1D492297C()
{
  return MEMORY[0x1E0DEF938]();
}

uint64_t sub_1D4922988()
{
  return MEMORY[0x1E0DEF978]();
}

uint64_t sub_1D4922994()
{
  return MEMORY[0x1E0DEF990]();
}

uint64_t sub_1D49229A0()
{
  return MEMORY[0x1E0DEF9A0]();
}

uint64_t sub_1D49229AC()
{
  return MEMORY[0x1E0DEF9A8]();
}

uint64_t sub_1D49229B8()
{
  return MEMORY[0x1E0DEF9B0]();
}

uint64_t sub_1D49229C4()
{
  return MEMORY[0x1E0DEF9D8]();
}

uint64_t sub_1D49229D0()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_1D49229DC()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_1D49229E8()
{
  return MEMORY[0x1E0DEFA20]();
}

uint64_t sub_1D49229F4()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1D4922A00()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1D4922A0C()
{
  return MEMORY[0x1E0DEFAA8]();
}

uint64_t sub_1D4922A18()
{
  return MEMORY[0x1E0DEFAC0]();
}

uint64_t sub_1D4922A24()
{
  return MEMORY[0x1E0CB20E0]();
}

uint64_t sub_1D4922A30()
{
  return MEMORY[0x1E0CB2190]();
}

uint64_t sub_1D4922A3C()
{
  return MEMORY[0x1E0DF22D0]();
}

uint64_t sub_1D4922A48()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1D4922A54()
{
  return MEMORY[0x1E0CEDD70]();
}

uint64_t sub_1D4922A60()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1D4922A6C()
{
  return MEMORY[0x1E0C9E828]();
}

uint64_t sub_1D4922A78()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1D4922A84()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1D4922A90()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_1D4922A9C()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1D4922AA8()
{
  return MEMORY[0x1E0CB24B0]();
}

uint64_t sub_1D4922AB4()
{
  return MEMORY[0x1E0CB2540]();
}

uint64_t sub_1D4922AC0()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1D4922ACC()
{
  return MEMORY[0x1E0DEFF58]();
}

uint64_t sub_1D4922AD8()
{
  return MEMORY[0x1E0DEBE30]();
}

uint64_t sub_1D4922AE4()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1D4922AF0()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1D4922AFC()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1D4922B08()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1D4922B14()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1D4922B20()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1D4922B2C()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1D4922B38()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1D4922B44()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1D4922B50()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1D4922B5C()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1D4922B68()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t sub_1D4922B74()
{
  return MEMORY[0x1E0DEC2A0]();
}

uint64_t sub_1D4922B80()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1D4922B8C()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1D4922B98()
{
  return MEMORY[0x1E0DEC338]();
}

uint64_t sub_1D4922BA4()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_1D4922BB0()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1D4922BBC()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1D4922BC8()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1D4922BD4()
{
  return MEMORY[0x1E0DEC590]();
}

uint64_t sub_1D4922BE0()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1D4922BEC()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1D4922BF8()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1D4922C04()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1D4922C10()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1D4922C1C()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1D4922C28()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1D4922C34()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1D4922C40()
{
  return MEMORY[0x1E0DECBF8]();
}

uint64_t sub_1D4922C4C()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1D4922C58()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_1D4922C64()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1D4922C70()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1D4922C7C()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1D4922C88()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1D4922C94()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1D4922CA0()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1D4922CAC()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1D4922CB8()
{
  return MEMORY[0x1E0DECF70]();
}

uint64_t sub_1D4922CC4()
{
  return MEMORY[0x1E0DECF78]();
}

uint64_t sub_1D4922CD0()
{
  return MEMORY[0x1E0DECF80]();
}

uint64_t sub_1D4922CDC()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1D4922CE8()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1D4922CF4()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1D4922D00()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1D4922D0C()
{
  return MEMORY[0x1E0DECFD8]();
}

uint64_t sub_1D4922D18()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1D4922D24()
{
  return MEMORY[0x1E0DECFE8]();
}

uint64_t sub_1D4922D30()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1D4922D3C()
{
  return MEMORY[0x1E0DED000]();
}

uint64_t sub_1D4922D48()
{
  return MEMORY[0x1E0DED008]();
}

uint64_t sub_1D4922D54()
{
  return MEMORY[0x1E0DED030]();
}

uint64_t sub_1D4922D60()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1D4922D6C()
{
  return MEMORY[0x1E0DED0B0]();
}

uint64_t sub_1D4922D78()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1D4922D84()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1D4922D90()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1D4922D9C()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1D4922DA8()
{
  return MEMORY[0x1E0DED108]();
}

uint64_t sub_1D4922DB4()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1D4922DC0()
{
  return MEMORY[0x1E0DED118]();
}

uint64_t sub_1D4922DCC()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1D4922DD8()
{
  return MEMORY[0x1E0DED130]();
}

uint64_t sub_1D4922DE4()
{
  return MEMORY[0x1E0DED138]();
}

uint64_t sub_1D4922DF0()
{
  return MEMORY[0x1E0DED160]();
}

uint64_t sub_1D4922DFC()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_1D4922E08()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1D4922E14()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1D4922E20()
{
  return MEMORY[0x1E0DED4A0]();
}

uint64_t sub_1D4922E2C()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1D4922E38()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1D4922E44()
{
  return MEMORY[0x1E0DED610]();
}

uint64_t sub_1D4922E50()
{
  return MEMORY[0x1E0DED768]();
}

uint64_t sub_1D4922E5C()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1D4922E68()
{
  return MEMORY[0x1E0DED998]();
}

uint64_t sub_1D4922E74()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1D4922E80()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1D4922E8C()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1D4922E98()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1D4922EA4()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1D4922EB0()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1D4922EBC()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1D4922EC8()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1D4922ED4()
{
  return MEMORY[0x1E0DEDB30]();
}

uint64_t sub_1D4922EE0()
{
  return MEMORY[0x1E0DEDEE0]();
}

uint64_t sub_1D4922EEC()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1D4922EF8()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1D4922F04()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1D4922F10()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1D4922F1C()
{
  return MEMORY[0x1E0DEDF28]();
}

uint64_t sub_1D4922F28()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1D4922F34()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1D4922F40()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t sub_1D4922F4C()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1D4922F58()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1D4922F64()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1D4922F70()
{
  return MEMORY[0x1E0DEE8E8]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D560]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CKContainerEnvironmentString()
{
  return MEMORY[0x1E0C946F0]();
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8A98](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1E0CA8AE0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8AF8](pixelBuffer);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1E0CA8B30](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

Boolean CVPixelBufferIsPlanar(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B68](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1E0CA8B70](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x1E0CA8BF8](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1E0CA8C00](pixelBuffer, unlockFlags);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

CGRect VNImageRectForNormalizedRect(CGRect normalizedRect, size_t imageWidth, size_t imageHeight)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0CEE380](imageWidth, imageHeight, (__n128)normalizedRect.origin, *(__n128 *)&normalizedRect.origin.y, (__n128)normalizedRect.size, *(__n128 *)&normalizedRect.size.height);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t VTPixelRotationSessionCreateWithRotationAndFlip()
{
  return MEMORY[0x1E0CECCE0]();
}

OSStatus VTPixelRotationSessionRotateImage(VTPixelRotationSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECCF0](session, sourceBuffer, destinationBuffer);
}

OSStatus VTPixelTransferSessionCreate(CFAllocatorRef allocator, VTPixelTransferSessionRef *pixelTransferSessionOut)
{
  return MEMORY[0x1E0CECD18](allocator, pixelTransferSessionOut);
}

void VTPixelTransferSessionInvalidate(VTPixelTransferSessionRef session)
{
  MEMORY[0x1E0CECD28](session);
}

OSStatus VTPixelTransferSessionTransferImage(VTPixelTransferSessionRef session, CVPixelBufferRef sourceBuffer, CVPixelBufferRef destinationBuffer)
{
  return MEMORY[0x1E0CECD38](session, sourceBuffer, destinationBuffer);
}

OSStatus VTSessionSetProperty(VTSessionRef session, CFStringRef propertyKey, CFTypeRef propertyValue)
{
  return MEMORY[0x1E0CECD80](session, propertyKey, propertyValue);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t faiss::partition_fuzzy<faiss::CMax<float,long long>>()
{
  return __ZN5faiss15partition_fuzzyINS_4CMaxIfxEEEENT_1TEPS4_PNS3_2TIEmmmPm();
}

uint64_t faiss::partition_fuzzy<faiss::CMin<float,long long>>()
{
  return __ZN5faiss15partition_fuzzyINS_4CMinIfxEEEENT_1TEPS4_PNS3_2TIEmmmPm();
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x1E0DE41F0]();
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

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4298](this, a2);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x1E0DE42F0](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
  MEMORY[0x1E0DE42F8](this);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4420](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1E0DE4440](this, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  MEMORY[0x1E0DE4480](this, __n, __c);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x1E0DE44B8](this, __c);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x1E0DE4538](this, *(_QWORD *)&__ec.__val_, __ec.__cat_);
}

void std::future_error::~future_error(std::future_error *this)
{
  MEMORY[0x1E0DE4540](this);
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
  return MEMORY[0x1E0DE4700]();
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
  MEMORY[0x1E0DE4790](this);
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x1E0DE47A8]();
}

std::__thread_struct *__cdecl std::__thread_struct::__thread_struct(std::__thread_struct *this)
{
  return (std::__thread_struct *)MEMORY[0x1E0DE47D0](this);
}

void std::__thread_struct::~__thread_struct(std::__thread_struct *this)
{
  MEMORY[0x1E0DE47D8](this);
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x1E0DE47E0]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x1E0DE47E8]();
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x1E0DE4818]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x1E0DE4860](this, __lk);
}

void std::__assoc_sub_state::set_exception(std::__assoc_sub_state *this, std::exception_ptr __p)
{
  MEMORY[0x1E0DE4868](this, __p.__ptr_);
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x1E0DE4890](this);
}

void std::condition_variable::notify_one(std::condition_variable *this)
{
  MEMORY[0x1E0DE4898](this);
}

void std::condition_variable::wait(std::condition_variable *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x1E0DE48A8](this, __lk);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x1E0DE48B0](this);
}

std::__thread_specific_ptr<std::__thread_struct> *std::__thread_local_data(void)
{
  return (std::__thread_specific_ptr<std::__thread_struct> *)MEMORY[0x1E0DE4908]();
}

void std::__throw_system_error(int __ev, const char *__what_arg)
{
  MEMORY[0x1E0DE4920](*(_QWORD *)&__ev, __what_arg);
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

uint64_t std::__sort<std::__less<long long,long long> &,long long *>()
{
  return MEMORY[0x1E0DE4B28]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::thread::join(std::thread *this)
{
  MEMORY[0x1E0DE4BB8](this);
}

void std::thread::~thread(std::thread *this)
{
  MEMORY[0x1E0DE4BC8](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x1E0DE4C68](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x1E0DE4D28]();
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1E0DE4DB0](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD8](this);
}

std::exception_ptr std::current_exception(void)
{
  return (std::exception_ptr)MEMORY[0x1E0DE4DF0]();
}

void std::rethrow_exception(std::exception_ptr a1)
{
  MEMORY[0x1E0DE4DF8](a1.__ptr_);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E97FA440();
}

void operator delete(void *__p)
{
  off_1E97FA448(__p);
}

uint64_t operator delete()
{
  return off_1E97FA450();
}

uint64_t operator new[]()
{
  return off_1E97FA458();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E97FA460(__sz);
}

uint64_t operator new()
{
  return off_1E97FA468();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x1E0C80A98](lpfunc, obj, lpdso_handle);
}

void __cxa_bad_typeid(void)
{
  MEMORY[0x1E0DE5078]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

char *__cxa_demangle(const char *lpmangled, char *lpout, size_t *lpoutlen, int *lpstatus)
{
  return (char *)MEMORY[0x1E0DE5090](lpmangled, lpout, lpoutlen, lpstatus);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1E0DE50E0](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x1E0DEEA50]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x1E0C81500](__x);
  return result;
}

long double asin(long double __x)
{
  long double result;

  MEMORY[0x1E0C81598](__x);
  return result;
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x1E0C81618](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

int dgemm_(char *transa, char *transb, int *m, int *n, int *k, double *alpha, double *a, int *lda, double *b, int *ldb, double *beta, double *c__, int *ldc)
{
  return MEMORY[0x1E0C8BCC8](transa, transb, m, n, k, alpha, a, lda);
}

int dgesvd_(char *__jobu, char *__jobvt, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__s, __CLPK_doublereal *__u, __CLPK_integer *__ldu, __CLPK_doublereal *__vt, __CLPK_integer *__ldvt, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x1E0C8BD10](__jobu, __jobvt, __m, __n, __a, __lda, __s, __u);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

int dsyev_(char *__jobz, char *__uplo, __CLPK_integer *__n, __CLPK_doublereal *__a, __CLPK_integer *__lda, __CLPK_doublereal *__w, __CLPK_doublereal *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x1E0C8BD78](__jobz, __uplo, __n, __a, __lda, __w, __work, __lwork);
}

uint64_t e5rt_buffer_object_get_data_ptr()
{
  return MEMORY[0x1E0D1F918]();
}

uint64_t e5rt_buffer_object_release()
{
  return MEMORY[0x1E0D1F938]();
}

uint64_t e5rt_e5_compiler_compile()
{
  return MEMORY[0x1E0D1F960]();
}

uint64_t e5rt_e5_compiler_create()
{
  return MEMORY[0x1E0D1F978]();
}

uint64_t e5rt_e5_compiler_options_create()
{
  return MEMORY[0x1E0D1F990]();
}

uint64_t e5rt_e5_compiler_options_release()
{
  return MEMORY[0x1E0D1F9B0]();
}

uint64_t e5rt_e5_compiler_options_set_compute_device_types_mask()
{
  return MEMORY[0x1E0D1F9C0]();
}

uint64_t e5rt_e5_compiler_options_set_force_recompilation()
{
  return MEMORY[0x1E0D1FA18]();
}

uint64_t e5rt_e5_compiler_release()
{
  return MEMORY[0x1E0D1FA50]();
}

uint64_t e5rt_execution_stream_create()
{
  return MEMORY[0x1E0D1FA80]();
}

uint64_t e5rt_execution_stream_encode_operation()
{
  return MEMORY[0x1E0D1FA98]();
}

uint64_t e5rt_execution_stream_execute_sync()
{
  return MEMORY[0x1E0D1FAA0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation()
{
  return MEMORY[0x1E0D1FAE0]();
}

uint64_t e5rt_execution_stream_operation_create_precompiled_compute_operation_with_options()
{
  return MEMORY[0x1E0D1FAE8]();
}

uint64_t e5rt_execution_stream_operation_get_input_names()
{
  return MEMORY[0x1E0D1FB08]();
}

uint64_t e5rt_execution_stream_operation_get_num_inputs()
{
  return MEMORY[0x1E0D1FB28]();
}

uint64_t e5rt_execution_stream_operation_get_num_outputs()
{
  return MEMORY[0x1E0D1FB30]();
}

uint64_t e5rt_execution_stream_operation_get_output_names()
{
  return MEMORY[0x1E0D1FB48]();
}

uint64_t e5rt_execution_stream_operation_release()
{
  return MEMORY[0x1E0D1FB60]();
}

uint64_t e5rt_execution_stream_operation_retain_input_port()
{
  return MEMORY[0x1E0D1FB98]();
}

uint64_t e5rt_execution_stream_operation_retain_output_port()
{
  return MEMORY[0x1E0D1FBA8]();
}

uint64_t e5rt_execution_stream_release()
{
  return MEMORY[0x1E0D1FBB8]();
}

uint64_t e5rt_get_last_error_message()
{
  return MEMORY[0x1E0D1FBF8]();
}

uint64_t e5rt_io_port_bind_buffer_object()
{
  return MEMORY[0x1E0D1FC08]();
}

uint64_t e5rt_io_port_bind_surface_object()
{
  return MEMORY[0x1E0D1FC18]();
}

uint64_t e5rt_io_port_is_surface()
{
  return MEMORY[0x1E0D1FC30]();
}

uint64_t e5rt_io_port_is_tensor()
{
  return MEMORY[0x1E0D1FC38]();
}

uint64_t e5rt_io_port_release()
{
  return MEMORY[0x1E0D1FC48]();
}

uint64_t e5rt_io_port_retain_surface_desc()
{
  return MEMORY[0x1E0D1FC58]();
}

uint64_t e5rt_io_port_retain_tensor_desc()
{
  return MEMORY[0x1E0D1FC68]();
}

uint64_t e5rt_precompiled_compute_op_create_options_create_with_program_function()
{
  return MEMORY[0x1E0D1FC90]();
}

uint64_t e5rt_precompiled_compute_op_create_options_release()
{
  return MEMORY[0x1E0D1FCA0]();
}

uint64_t e5rt_program_function_release()
{
  return MEMORY[0x1E0D1FCE8]();
}

uint64_t e5rt_program_library_release()
{
  return MEMORY[0x1E0D1FD60]();
}

uint64_t e5rt_program_library_retain_program_function()
{
  return MEMORY[0x1E0D1FD68]();
}

uint64_t e5rt_surface_desc_get_format()
{
  return MEMORY[0x1E0D1FD80]();
}

uint64_t e5rt_surface_desc_get_height()
{
  return MEMORY[0x1E0D1FD88]();
}

uint64_t e5rt_surface_desc_get_plane_count()
{
  return MEMORY[0x1E0D1FD90]();
}

uint64_t e5rt_surface_desc_get_width()
{
  return MEMORY[0x1E0D1FD98]();
}

uint64_t e5rt_surface_desc_release()
{
  return MEMORY[0x1E0D1FDA0]();
}

uint64_t e5rt_surface_object_create_from_iosurface()
{
  return MEMORY[0x1E0D1FDB0]();
}

uint64_t e5rt_surface_object_release()
{
  return MEMORY[0x1E0D1FDC0]();
}

uint64_t e5rt_tensor_desc_alloc_buffer_object()
{
  return MEMORY[0x1E0D1FDC8]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_dtype()
{
  return MEMORY[0x1E0D1FDF8]();
}

uint64_t e5rt_tensor_desc_dtype_get_component_size()
{
  return MEMORY[0x1E0D1FE18]();
}

uint64_t e5rt_tensor_desc_dtype_release()
{
  return MEMORY[0x1E0D1FE38]();
}

uint64_t e5rt_tensor_desc_get_shape()
{
  return MEMORY[0x1E0D1FE50]();
}

uint64_t e5rt_tensor_desc_get_strides()
{
  return MEMORY[0x1E0D1FE68]();
}

uint64_t e5rt_tensor_desc_release()
{
  return MEMORY[0x1E0D1FE70]();
}

uint64_t e5rt_tensor_desc_retain_dtype()
{
  return MEMORY[0x1E0D1FE80]();
}

uint64_t espresso_buffer_get_rank()
{
  return MEMORY[0x1E0D1FEE0]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x1E0D1FF10]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1E0D1FF38]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1E0D1FF40]();
}

uint64_t espresso_device_id_for_metal_device()
{
  return MEMORY[0x1E0D1FF60]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1E0D1FFB8]();
}

uint64_t espresso_network_bind_cvpixelbuffer()
{
  return MEMORY[0x1E0D1FFD0]();
}

uint64_t espresso_network_declare_input()
{
  return MEMORY[0x1E0D20038]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x1E0D20040]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1E0D200B0]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1E0D200C8]();
}

uint64_t espresso_plan_build_clean()
{
  return MEMORY[0x1E0D200D8]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1E0D200E8]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1E0D20100]();
}

uint64_t espresso_plan_get_phase()
{
  return MEMORY[0x1E0D20120]();
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

float expf(float a1)
{
  float result;

  MEMORY[0x1E0C83298](a1);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1E0C833B0](a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

float logf(float a1)
{
  float result;

  MEMORY[0x1E0C83C00](a1);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1E0C83F08](memptr, alignment, size, type_id);
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

float nextafterf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C843B0](a1, a2);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1E0C849A8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

int putchar(int a1)
{
  return MEMORY[0x1E0C84F50](*(_QWORD *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

long double remainder(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C850A8](__x, __y);
  return result;
}

double scalb(double a1, double a2)
{
  double result;

  MEMORY[0x1E0C85238](a1, a2);
  return result;
}

int sgemm_(char *transa, char *transb, int *m, int *n, int *k, float *alpha, float *a, int *lda, float *b, int *ldb, float *beta, float *c__, int *ldc)
{
  return MEMORY[0x1E0C8BDD8](transa, transb, m, n, k, alpha, a, lda);
}

int sgeqrf_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__tau, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x1E0C8BDE0](__m, __n, __a, __lda, __tau, __work, __lwork, __info);
}

int sgesvd_(char *__jobu, char *__jobvt, __CLPK_integer *__m, __CLPK_integer *__n, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__s, __CLPK_real *__u, __CLPK_integer *__ldu, __CLPK_real *__vt, __CLPK_integer *__ldvt, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x1E0C8BE00](__jobu, __jobvt, __m, __n, __a, __lda, __s, __u);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sorgqr_(__CLPK_integer *__m, __CLPK_integer *__n, __CLPK_integer *__k, __CLPK_real *__a, __CLPK_integer *__lda, __CLPK_real *__tau, __CLPK_real *__work, __CLPK_integer *__lwork, __CLPK_integer *__info)
{
  return MEMORY[0x1E0C8BE18](__m, __n, __k, __a, __lda, __tau, __work, __lwork);
}

int ssyrk_(char *uplo, char *trans, int *n, int *k, float *alpha, float *a, int *lda, float *beta, float *c__, int *ldc)
{
  return MEMORY[0x1E0C8BF38](uplo, trans, n, k, alpha, a, lda, beta);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x1E0DEEB70]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastMetatype()
{
  return MEMORY[0x1E0DEEB98]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

long double tan(long double __x)
{
  long double result;

  MEMORY[0x1E0C857E8](__x);
  return result;
}

void vDSP_maxvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
  MEMORY[0x1E0C8C1C0](__A, __IA, __C, __I, __N);
}

void vDSP_vmin(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C6D8](__A, __IA, __B, __IB, __C, __IC, __N);
}

