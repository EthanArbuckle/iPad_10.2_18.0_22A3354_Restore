uint64_t gcl::ArithmeticEncoder::start(uint64_t this)
{
  uint64_t v1;
  __int128 v2;
  uint64_t v3;

  v1 = 0;
  *(_QWORD *)&v2 = 0xFFFF00000000;
  *((_QWORD *)&v2 + 1) = 0xFFFF00000000;
  *(_OWORD *)(this + 24) = v2;
  *(_QWORD *)(this + 16) = 0;
  *(_QWORD *)(this + 40) = 0;
  v3 = 0x217u;
  do
  {
    *(_WORD *)(this + v1 * 2 + 48) = gcl::ArithmeticEncoder::probUpdateLut[v1];
    *(_WORD *)(this + v3 * 2) = gcl::ArithmeticEncoder::probUpdateLut[v3 - 280];
    --v3;
    ++v1;
  }
  while (v1 != 256);
  return this;
}

void *gcl::ArithmeticDecoder::start(gcl::ArithmeticDecoder *this)
{
  __int128 v1;
  unsigned int v2;
  unsigned __int8 *v3;
  int v4;
  int v5;
  int v6;
  int v7;

  *(_QWORD *)&v1 = 0xFFFF000000000000;
  *((_QWORD *)&v1 + 1) = 0xFFFF000000000000;
  *(_OWORD *)((char *)this + 24) = v1;
  *((_QWORD *)this + 5) = 16;
  v2 = *(_DWORD *)this;
  if (!*(_DWORD *)this)
  {
    v4 = -16777216;
    goto LABEL_7;
  }
  v3 = (unsigned __int8 *)*((_QWORD *)this + 1);
  v4 = *v3 << 24;
  *((_DWORD *)this + 8) = v4;
  if (v2 == 1)
  {
LABEL_7:
    v5 = v4 | 0xFF0000;
    goto LABEL_8;
  }
  v5 = v4 | (v3[1] << 16);
  *((_DWORD *)this + 8) = v5;
  if (v2 <= 2)
  {
LABEL_8:
    v6 = v5 | 0xFF00;
    goto LABEL_9;
  }
  v6 = v5 | (v3[2] << 8);
  *((_DWORD *)this + 8) = v6;
  if (v2 == 3)
  {
LABEL_9:
    v7 = 255;
    goto LABEL_10;
  }
  v7 = v3[3];
LABEL_10:
  *((_DWORD *)this + 8) = v7 | v6;
  *((_QWORD *)this + 2) = 3;
  return memcpy((char *)this + 48, &gcl::ArithmeticDecoder::probUpdateLutInterleaved, 0x400uLL);
}

unsigned int *gcl::motion::EncoderImpl::encodeResidual(unsigned int *result, uint64_t a2, uint64_t a3, uint64_t a4, int a5, _BYTE *a6, _QWORD *a7)
{
  uint64_t v11;
  unsigned int *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  unsigned int v16;
  int v17;
  unsigned int v18;
  int v20;
  uint64_t v21;
  unsigned int *v22;
  uint64_t v23;
  int v24;
  int v25;
  _WORD *v26;
  unsigned int *v27;
  unsigned int v28;
  _WORD *v29;
  int v30;
  unsigned int v31;
  uint64_t v32;
  _WORD *v33;
  uint64_t v34;
  int v35;
  unsigned int v36;
  int v37;

  if (!*a6)
  {
    if (a5 < 1)
      return result;
    v21 = 0;
    v22 = result + 4;
    v23 = a5;
    while (1)
    {
      v24 = *(_DWORD *)(a3 + 4 * v21);
      v25 = *(_DWORD *)(a4 + 4 * v21);
      v26 = (_WORD *)(*a7 + 2 * v21);
      v27 = v22;
      v28 = v24 - v25;
      if (v24 == v25)
        break;
      gcl::ArithmeticEncoder::encode(v22, 1, v26);
      v29 = (_WORD *)(a7[3] + 2 * v21);
      if ((v28 & 0x80000000) != 0)
      {
        gcl::ArithmeticEncoder::encode(v22, 0, v29);
        v28 = -v28;
      }
      else
      {
        gcl::ArithmeticEncoder::encode(v22, 1, v29);
      }
      v31 = v28 - 1;
      v32 = a7[6];
      v33 = (_WORD *)(v32 + 2 * (int)((_DWORD)v21 << 6));
      if (v28 <= 0x3F)
      {
        gcl::ArithmeticEncoder::encode(v22, (v31 >> 5) & 1, (_WORD *)(v32 + 2 * (int)((_DWORD)v21 << 6)));
        gcl::ArithmeticEncoder::encode(v22, (v31 >> 4) & 1, &v33[(v31 >> 5) + 1]);
        gcl::ArithmeticEncoder::encode(v22, (v31 >> 3) & 1, &v33[(v31 >> 4) + 3]);
        gcl::ArithmeticEncoder::encode(v22, (v31 >> 2) & 1, &v33[(v31 >> 3) + 7]);
        gcl::ArithmeticEncoder::encode(v22, (v31 >> 1) & 1, &v33[(v31 >> 2) + 15]);
        v30 = v31 & 1;
        v26 = &v33[(v31 >> 1) + 31];
        v27 = v22;
        goto LABEL_29;
      }
      gcl::ArithmeticEncoder::encode(v22, 1, (_WORD *)(v32 + 2 * (int)((_DWORD)v21 << 6)));
      gcl::ArithmeticEncoder::encode(v22, 1, v33 + 2);
      gcl::ArithmeticEncoder::encode(v22, 1, v33 + 6);
      gcl::ArithmeticEncoder::encode(v22, 1, v33 + 14);
      gcl::ArithmeticEncoder::encode(v22, 1, v33 + 30);
      gcl::ArithmeticEncoder::encode(v22, 1, v33 + 62);
      v34 = a7[12];
      result = gcl::ArithmeticEncoder::encodeExpGolomb(v22, v28 - 64, *(_DWORD *)(v34 + 4 * v21), (_WORD *)(a7[9] + 2 * v21));
      v35 = *(_DWORD *)(v34 + 4 * v21);
      v36 = v31 >> v35;
      if (v35 && !v36)
      {
        v37 = v35 - 1;
LABEL_35:
        *(_DWORD *)(v34 + 4 * v21) = v37;
        goto LABEL_36;
      }
      if (v36 >= 2)
      {
        v37 = v35 + 1;
        goto LABEL_35;
      }
LABEL_36:
      if (++v21 == v23)
        return result;
    }
    v30 = 0;
LABEL_29:
    result = gcl::ArithmeticEncoder::encode(v27, v30, v26);
    goto LABEL_36;
  }
  if (*a6 == 1 && a5 >= 1)
  {
    v11 = 0;
    v12 = result + 4;
    v13 = a5;
    while (1)
    {
      v14 = *(_DWORD *)(a3 + 4 * v11) - *(_DWORD *)(a4 + 4 * v11);
      v15 = a7[12];
      result = gcl::ArithmeticEncoder::encodeSignedExpGolomb(v12, v14, *(_DWORD *)(v15 + 4 * v11), (_WORD *)(a7[3] + 2 * v11), (_WORD *)(a7[9] + 2 * v11));
      v16 = v14 >= 0 ? v14 : -v14;
      v17 = *(_DWORD *)(v15 + 4 * v11);
      v18 = v16 >> v17;
      if (v17 && v18 == 0)
        break;
      if (v18 >= 2)
      {
        v20 = 1;
LABEL_17:
        *(_DWORD *)(v15 + 4 * v11) = v17 + v20;
      }
      if (++v11 == v13)
        return result;
    }
    v20 = -1;
    goto LABEL_17;
  }
  return result;
}

unsigned int *gcl::ArithmeticEncoder::encode(unsigned int *result, int a2, _WORD *a3)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;
  __int16 v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;

  v3 = (unsigned __int16)*a3;
  v4 = result[7];
  v5 = (v4 * v3) >> 16;
  if (a2)
  {
    result[6] += v5;
    v5 = v4 - v5;
    v6 = v3 - *(_WORD *)((char *)result + ((v3 >> 7) & 0x1FE) + 48);
  }
  else
  {
    v6 = *(_WORD *)((char *)result + (~(*a3 >> 7) & 0x1FE) + 48) + *a3;
  }
  result[7] = v5;
  *a3 = v6;
  if (v5 <= 0x4000)
  {
    v7 = result[6];
    v8 = result[10];
    while (1)
    {
      v7 *= 2;
      v5 *= 2;
      result[6] = v7;
      result[7] = v5;
      result[10] = ++v8;
      if (v8 == 8)
        break;
LABEL_18:
      if (v5 > 0x4000)
        return result;
    }
    v9 = *((_QWORD *)result + 2);
    v10 = (int)result[11];
    if (v9 + v10 + 1 > (unint64_t)*result)
      return result;
    if (HIBYTE(v7))
    {
      ++*(_BYTE *)(v9 + *((_QWORD *)result + 1) - 1);
      v9 = *((_QWORD *)result + 2);
      if (result[11])
      {
        do
        {
          *(_BYTE *)(*((_QWORD *)result + 1) + v9) = 0;
          v11 = result[11];
          v9 = *((_QWORD *)result + 2) + 1;
          *((_QWORD *)result + 2) = v9;
          result[11] = --v11;
        }
        while (v11);
      }
    }
    else
    {
      if ((v7 + v5) >> 24)
      {
        result[11] = v10 + 1;
LABEL_17:
        v8 = 0;
        v7 = (unsigned __int16)v7;
        result[6] = (unsigned __int16)v7;
        result[10] = 0;
        goto LABEL_18;
      }
      if ((_DWORD)v10)
      {
        do
        {
          *(_BYTE *)(*((_QWORD *)result + 1) + v9) = -1;
          v12 = result[11];
          v9 = *((_QWORD *)result + 2) + 1;
          *((_QWORD *)result + 2) = v9;
          result[11] = --v12;
        }
        while (v12);
      }
    }
    *(_BYTE *)(*((_QWORD *)result + 1) + v9) = *((_WORD *)result + 13);
    ++*((_QWORD *)result + 2);
    LOWORD(v7) = *((_WORD *)result + 12);
    v5 = result[7];
    goto LABEL_17;
  }
  return result;
}

unsigned int *gcl::ArithmeticEncoder::encodeExpGolomb(unsigned int *a1, int a2, int a3, _WORD *a4)
{
  int v5;
  int v6;
  int i;
  unsigned int *result;
  int v10;
  __int16 v11;

  if ((a3 | a2) < 0)
    gcl::ArithmeticEncoder::encodeExpGolomb();
  v5 = a3;
  v6 = a2;
  for (i = 1 << a3; v6 >= 1 << v5; i = 1 << v5)
  {
    gcl::ArithmeticEncoder::encode(a1, 1, a4);
    ++v5;
    v6 -= i;
  }
  result = gcl::ArithmeticEncoder::encode(a1, 0, a4);
  if (v5)
  {
    v10 = v5 - 1;
    do
    {
      v11 = 0x8000;
      result = gcl::ArithmeticEncoder::encode(a1, (v6 >> v10--) & 1, &v11);
    }
    while (v10 != -1);
  }
  return result;
}

unsigned int *gcl::ArithmeticEncoder::encodeSignedExpGolomb(unsigned int *a1, int a2, int a3, _WORD *a4, _WORD *a5)
{
  int v6;
  unsigned int *result;

  if (a3 < 0)
    gcl::ArithmeticEncoder::encodeSignedExpGolomb();
  v6 = a2;
  if (a2 < 0)
    a2 = -a2;
  result = gcl::ArithmeticEncoder::encodeExpGolomb(a1, a2, a3, a5);
  if (v6)
    return gcl::ArithmeticEncoder::encode(a1, v6 >= 0, a4);
  return result;
}

uint64_t gcl::motion::EncoderImpl::encodeSequenceParameterSet(gcl::motion::EncoderImpl *this, int a2, unint64_t a3, unsigned __int8 *a4, unint64_t a5, unint64_t *a6)
{
  uint64_t result;
  std::vector<int>::size_type v8;
  void *v9;
  uint64_t v10;

  result = 5;
  if (a3 <= 0xFF && a4 && a5 >= 8)
  {
    *(_DWORD *)a4 = 196611;
    a4[4] = 0;
    *(_WORD *)(a4 + 5) = a2;
    a4[7] = a3;
    *a6 = 8;
    *((_DWORD *)this + 1) = a3;
    *((_DWORD *)this + 2) = 0;
    *(_DWORD *)this = a2;
    v8 = a2 * (int)a3;
    std::vector<int>::resize((std::vector<int> *)((char *)this + 1112), v8);
    std::vector<int>::resize((std::vector<int> *)((char *)this + 1088), v8);
    v9 = (void *)*((_QWORD *)this + 136);
    v10 = *((_QWORD *)this + 137) - (_QWORD)v9;
    if (v10 >= 1)
      bzero(v9, 4 * (((unint64_t)v10 >> 2) - ((unint64_t)v10 > 3)) + 4);
    return 0;
  }
  return result;
}

void std::vector<int>::resize(std::vector<int> *this, std::vector<int>::size_type __sz)
{
  std::vector<int>::size_type v2;

  v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2)
      this->__end_ = &this->__begin_[__sz];
  }
  else
  {
    std::vector<int>::__append(this, __sz - v2);
  }
}

uint64_t gcl::motion::EncoderImpl::encodeFrame(uint64_t a1, int *a2, int a3, unint64_t *a4, unint64_t a5, unint64_t *a6, _BYTE *a7)
{
  int v8;
  uint64_t result;
  int v12;
  int *v15;
  int v16;
  int v17;
  int *v18;
  int v19;
  int v20;
  uint64_t v21;
  _BYTE *v22;
  int v23;
  uint64_t v24;
  int *v25;
  _DWORD *v26;
  uint64_t v27;
  int *v28;
  int v29;
  int v30;
  int v31;
  _DWORD *v32;
  uint64_t v33;
  int *v34;
  int v35;
  std::vector<int>::size_type v36;
  uint64_t v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  std::vector<int>::pointer begin;
  unsigned int v44;
  unint64_t v45;
  _DWORD *v46;
  int v47;
  int v48;
  uint64_t v49;
  char v50;
  char v51;
  uint64_t v52;
  std::vector<int>::value_type __x;
  std::vector<int> v54;
  void *v55[2];
  void *v56[2];
  __int128 v57;
  void *v58[2];
  void *v59[2];
  __int128 v60;
  void *__p[2];
  uint64_t v62;

  if (!a2)
    return 5;
  v8 = *(_DWORD *)a1;
  if (!*(_DWORD *)a1)
    return 5;
  result = 5;
  if (a5 < 6)
    return result;
  if (!a4)
    return result;
  v12 = *(_DWORD *)(a1 + 4);
  if (!v12)
    return result;
  v15 = a2;
  if (v8 >= 2)
  {
    v16 = 1;
    v17 = *(_DWORD *)(a1 + 4);
    while (v12 < 1)
    {
LABEL_12:
      ++v16;
      v17 += v12 & ~(v12 >> 31);
      if (v16 == v8)
        goto LABEL_13;
    }
    v18 = &a2[v17];
    v19 = *(_DWORD *)(a1 + 4);
    while (1)
    {
      v20 = *v18++;
      if ((v20 - 0x10000000) < 0xE0000001)
        return 5;
      if (!--v19)
        goto LABEL_12;
    }
  }
LABEL_13:
  if (a3)
  {
    if (a3 == 1)
    {
      v21 = 1;
      goto LABEL_17;
    }
    return 5;
  }
  v21 = 0;
LABEL_17:
  v22 = a7 + 4;
  v50 = a7[5];
  v51 = a7[4];
  v23 = *(_DWORD *)(a1 + 8);
  v52 = a7[6];
  v24 = (v12 * v8);
  if (a3)
  {
    if ((int)v24 >= 1)
    {
      v25 = *(int **)(a1 + 1088);
      v26 = *(_DWORD **)(a1 + 1112);
      v27 = v24;
      v28 = a2;
      do
      {
        v30 = *v28++;
        v29 = v30;
        v31 = *v25++;
        *v26++ = v29 - v31;
        --v27;
      }
      while (v27);
    }
  }
  else if ((int)v24 >= 1)
  {
    v32 = *(_DWORD **)(a1 + 1112);
    v33 = v24;
    v34 = a2;
    do
    {
      v35 = *v34++;
      *v32++ = v35;
      --v33;
    }
    while (v33);
  }
  *(_DWORD *)(a1 + 16) = a5 - 8;
  *(_QWORD *)(a1 + 24) = a4 + 1;
  gcl::ArithmeticEncoder::start(a1 + 16);
  if (a7[5] > 1u)
    return 5;
  v62 = 0;
  v60 = 0u;
  *(_OWORD *)__p = 0u;
  *(_OWORD *)v58 = 0u;
  *(_OWORD *)v59 = 0u;
  *(_OWORD *)v56 = 0u;
  v57 = 0u;
  *(_OWORD *)v55 = 0u;
  gcl::motion::ACContext::init((std::vector<int> *)v55, *(_DWORD *)(a1 + 4));
  v48 = v23;
  v49 = v21;
  v36 = *(int *)(a1 + 4);
  __x = 0;
  std::vector<int>::vector(&v54, v36, &__x);
  if (*(int *)a1 >= 1)
  {
    v38 = 0;
    v39 = a7[5];
    v40 = *(_QWORD *)(a1 + 1112);
    LODWORD(v41) = *(_DWORD *)(a1 + 4);
    do
    {
      gcl::motion::EncoderImpl::encodeResidual((unsigned int *)a1, v37, v40, (uint64_t)v54.__begin_, v41, v22, v55);
      if (v39 && *(int *)(a1 + 4) >= 1)
      {
        v42 = 0;
        begin = v54.__begin_;
        do
        {
          begin[v42] = *(_DWORD *)(v40 + 4 * v42);
          ++v42;
        }
        while (v42 < *(int *)(a1 + 4));
      }
      ++v38;
      v41 = *(int *)(a1 + 4);
      v40 += 4 * v41;
    }
    while (v38 < *(_DWORD *)a1);
  }
  if (v54.__begin_)
  {
    v54.__end_ = v54.__begin_;
    operator delete(v54.__begin_);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v59[1])
  {
    *(void **)&v60 = v59[1];
    operator delete(v59[1]);
  }
  if (v58[0])
  {
    v58[1] = v58[0];
    operator delete(v58[0]);
  }
  if (v56[1])
  {
    *(void **)&v57 = v56[1];
    operator delete(v56[1]);
  }
  if (v55[0])
  {
    v55[1] = v55[0];
    operator delete(v55[0]);
  }
  v44 = gcl::ArithmeticEncoder::stop((gcl::ArithmeticEncoder *)(a1 + 16));
  if (v44 >= 0xFFFFFF)
    return 10;
  v45 = v44 + 8;
  *a4 = (v49 | (v48 << 16)) & 0xFFFFFFFFFFFF00FFLL | ((unint64_t)(v51 | (16 * v50)) << 8) | bswap64(v44) | (v52 << 32);
  if ((int)v24 >= 1)
  {
    v46 = *(_DWORD **)(a1 + 1088);
    do
    {
      v47 = *v15++;
      *v46++ = v47;
      --v24;
    }
    while (v24);
  }
  *a6 = v45;
  if (v45 > a5)
    return 1;
  result = 0;
  ++*(_DWORD *)(a1 + 8);
  return result;
}

void sub_2460953E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, char a19)
{
  gcl::motion::ACContext::~ACContext((gcl::motion::ACContext *)&a19);
  _Unwind_Resume(a1);
}

void gcl::motion::ACContext::init(std::vector<int> *this, int a2)
{
  unint64_t v4;
  char *begin;
  uint64_t v6;
  int *end;
  std::vector<int>::pointer v8;
  std::vector<int>::pointer v9;
  std::vector<int>::pointer v10;
  std::vector<int>::pointer v11;
  std::vector<int>::pointer v12;
  std::vector<int>::pointer v13;

  v4 = a2;
  std::vector<gcl::ArithmeticContext>::resize((uint64_t)this, a2);
  std::vector<gcl::ArithmeticContext>::resize((uint64_t)&this[1], v4);
  std::vector<gcl::ArithmeticContext>::resize((uint64_t)&this[2], a2 << 6);
  std::vector<gcl::ArithmeticContext>::resize((uint64_t)&this[3], v4);
  std::vector<int>::resize(this + 4, v4);
  begin = (char *)this[4].__begin_;
  v6 = (char *)this[4].__end_ - begin;
  if (v6 >= 1)
    memset_pattern16(begin, &unk_24609DD70, 4 * (((unint64_t)v6 >> 2) - ((unint64_t)v6 > 3)) + 4);
  end = this->__end_;
  if (this->__begin_ != end)
    memset_pattern16(this->__begin_, &unk_24609DD80, (((char *)end - (char *)this->__begin_ - 2) & 0xFFFFFFFFFFFFFFFELL) + 2);
  v8 = this[1].__begin_;
  v9 = this[1].__end_;
  if (v8 != v9)
    memset_pattern16(v8, &unk_24609DD80, (((char *)v9 - (char *)v8 - 2) & 0xFFFFFFFFFFFFFFFELL) + 2);
  v10 = this[2].__begin_;
  v11 = this[2].__end_;
  if (v10 != v11)
    memset_pattern16(v10, &unk_24609DD80, (((char *)v11 - (char *)v10 - 2) & 0xFFFFFFFFFFFFFFFELL) + 2);
  v12 = this[3].__begin_;
  v13 = this[3].__end_;
  if (v12 != v13)
    memset_pattern16(v12, &unk_24609DD80, (((char *)v13 - (char *)v12 - 2) & 0xFFFFFFFFFFFFFFFELL) + 2);
}

void gcl::motion::ACContext::~ACContext(gcl::motion::ACContext *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)*((_QWORD *)this + 12);
  if (v2)
  {
    *((_QWORD *)this + 13) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 9);
  if (v3)
  {
    *((_QWORD *)this + 10) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 6);
  if (v4)
  {
    *((_QWORD *)this + 7) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 3);
  if (v5)
  {
    *((_QWORD *)this + 4) = v5;
    operator delete(v5);
  }
  v6 = *(void **)this;
  if (*(_QWORD *)this)
  {
    *((_QWORD *)this + 1) = v6;
    operator delete(v6);
  }
}

unint64_t gcl::ArithmeticEncoder::stop(gcl::ArithmeticEncoder *this)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v1 = *((_QWORD *)this + 2);
  v2 = *((int *)this + 11);
  if (v1 + v2 + 3 > (unint64_t)*(unsigned int *)this)
    return 0;
  v4 = 0;
  v5 = *((_DWORD *)this + 10);
  v6 = *((_DWORD *)this + 6);
  do
  {
    if ((v6 | ((2 << v4) - 1)) > *((_DWORD *)this + 7) - 1)
      break;
    ++v4;
  }
  while (v4 != 16);
  v7 = v6 | ~(-1 << v4);
  *((_DWORD *)this + 6) = v7;
  if (v5 <= 7)
  {
    v8 = v5 - 8;
    do
      v7 = (2 * v7) | 1;
    while (!__CFADD__(v8++, 1));
    *((_DWORD *)this + 6) = v7;
    *((_DWORD *)this + 10) = 8;
  }
  if (HIBYTE(v7))
  {
    ++*(_BYTE *)(v1 + *((_QWORD *)this + 1) - 1);
    v1 = *((_QWORD *)this + 2);
    if (*((_DWORD *)this + 11))
    {
      do
      {
        *(_BYTE *)(*((_QWORD *)this + 1) + v1) = 0;
        v10 = *((_DWORD *)this + 11);
        v1 = *((_QWORD *)this + 2) + 1;
        *((_QWORD *)this + 2) = v1;
        *((_DWORD *)this + 11) = --v10;
      }
      while (v10);
    }
  }
  else if ((_DWORD)v2)
  {
    do
    {
      *(_BYTE *)(*((_QWORD *)this + 1) + v1) = -1;
      v11 = *((_DWORD *)this + 11);
      v1 = *((_QWORD *)this + 2) + 1;
      *((_QWORD *)this + 2) = v1;
      *((_DWORD *)this + 11) = --v11;
    }
    while (v11);
  }
  *(_BYTE *)(*((_QWORD *)this + 1) + v1) = *((_WORD *)this + 13);
  v12 = *((_QWORD *)this + 1);
  v13 = *((_QWORD *)this + 2) + 1;
  *((_QWORD *)this + 2) = v13;
  *(_BYTE *)(v12 + v13) = BYTE1(*((_DWORD *)this + 6));
  v3 = *((_QWORD *)this + 2) + 1;
  *((_QWORD *)this + 2) = v3;
  if (v5 >= 1)
  {
    *(_BYTE *)(*((_QWORD *)this + 1) + v3) = *((_DWORD *)this + 6);
    v3 = *((_QWORD *)this + 2) + 1;
    *((_QWORD *)this + 2) = v3;
  }
  if (v3 >= 2)
  {
    v14 = *((_QWORD *)this + 1) - 1;
    while (*(unsigned __int8 *)(v14 + v3) == 255)
    {
      *((_QWORD *)this + 2) = --v3;
      if (v3 <= 1)
        return 1;
    }
  }
  return v3;
}

gcl::motion::Encoder *gcl::motion::Encoder::Encoder(gcl::motion::Encoder *this)
{
  _DWORD *v2;

  v2 = operator new(0x470uLL);
  *(_QWORD *)v2 = 0;
  v2[2] = 0;
  *((_QWORD *)v2 + 3) = 0;
  *((_OWORD *)v2 + 68) = 0u;
  *((_OWORD *)v2 + 69) = 0u;
  *((_OWORD *)v2 + 70) = 0u;
  *(_QWORD *)this = v2;
  return this;
}

{
  _DWORD *v2;

  v2 = operator new(0x470uLL);
  *(_QWORD *)v2 = 0;
  v2[2] = 0;
  *((_QWORD *)v2 + 3) = 0;
  *((_OWORD *)v2 + 68) = 0u;
  *((_OWORD *)v2 + 69) = 0u;
  *((_OWORD *)v2 + 70) = 0u;
  *(_QWORD *)this = v2;
  return this;
}

void gcl::motion::Encoder::~Encoder(gcl::motion::EncoderImpl **this)
{
  std::unique_ptr<gcl::motion::EncoderImpl>::reset[abi:ne180100](this, 0);
}

{
  std::unique_ptr<gcl::motion::EncoderImpl>::reset[abi:ne180100](this, 0);
}

uint64_t gcl::motion::Encoder::estimateMaxEncodedFrameSize(gcl::motion::Encoder *this, uint64_t a2)
{
  return 4 * (_QWORD)this * a2 + 1024;
}

uint64_t gcl::motion::Encoder::estimateEncodingParameters()
{
  return 0x10000000000;
}

uint64_t gcl::motion::Encoder::encodeSequenceParameterSet(gcl::motion::EncoderImpl **this, int a2, unint64_t a3, unsigned __int8 *a4, unint64_t a5, unint64_t *a6)
{
  return gcl::motion::EncoderImpl::encodeSequenceParameterSet(*this, a2, a3, a4, a5, a6);
}

uint64_t gcl::motion::Encoder::encodeFrame(uint64_t *a1, int *a2, int a3, unint64_t *a4, unint64_t a5, unint64_t *a6, _BYTE *a7)
{
  return gcl::motion::EncoderImpl::encodeFrame(*a1, a2, a3, a4, a5, a6, a7);
}

void std::vector<gcl::ArithmeticContext>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 1;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 2 * a2;
  }
  else
  {
    std::vector<gcl::ArithmeticContext>::__append((char **)a1, a2 - v2);
  }
}

void std::vector<gcl::ArithmeticContext>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  __int16 v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 1)
  {
    if (a2)
    {
      memset_pattern16(*(void **)(v4 - 8), &unk_24609DD80, 2 * a2);
      v7 += 2 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 1);
    if (v10 < 0)
      std::vector<gcl::ArithmeticContext>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 1;
    v12 = v5 - v8;
    if (v12 > v10)
      v10 = v12;
    if (v12 >= 0x7FFFFFFFFFFFFFFELL)
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<gcl::ArithmeticContext>>(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[2 * v11];
    v16 = &v14[2 * v13];
    memset_pattern16(v15, &unk_24609DD80, 2 * a2);
    v17 = &v15[2 * a2];
    while (v7 != v8)
    {
      v18 = *((_WORD *)v7 - 1);
      v7 -= 2;
      *((_WORD *)v15 - 1) = v18;
      v15 -= 2;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
      operator delete(v8);
  }
}

void std::vector<gcl::ArithmeticContext>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2517325E0, MEMORY[0x24BEDAAF0]);
}

void sub_2460959F4(_Unwind_Exception *a1)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<gcl::ArithmeticContext>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(2 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void std::vector<int>::__append(std::vector<int> *this, std::vector<int>::size_type __n)
{
  std::__compressed_pair<int *> *p_end_cap;
  int *v5;
  int *value;
  int *end;
  std::vector<int>::pointer begin;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  int *v16;
  int *v17;
  int v18;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  v5 = value;
  end = p_end_cap[-1].__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 4 * __n);
      end += __n;
    }
    this->__end_ = end;
  }
  else
  {
    begin = this->__begin_;
    v9 = (char *)end - (char *)this->__begin_;
    v10 = __n + (v9 >> 2);
    if (v10 >> 62)
      std::vector<gcl::ArithmeticContext>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 2;
    v12 = (char *)v5 - (char *)begin;
    if (v12 >> 1 > v10)
      v10 = v12 >> 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)p_end_cap, v13);
      begin = this->__begin_;
      end = this->__end_;
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[4 * v11];
    v16 = (int *)&v14[4 * v13];
    bzero(v15, 4 * __n);
    v17 = (int *)&v15[4 * __n];
    while (end != begin)
    {
      v18 = *--end;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    this->__begin_ = (std::vector<int>::pointer)v15;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
      operator delete(begin);
  }
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n, const std::vector<int>::value_type *__x)
{
  std::vector<int>::pointer end;
  int *v7;
  std::vector<int>::size_type v8;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<int>::__vallocate[abi:ne180100](this, __n);
    end = this->__end_;
    v7 = &end[__n];
    v8 = 4 * __n;
    do
    {
      *end++ = *__x;
      v8 -= 4;
    }
    while (v8);
    this->__end_ = v7;
  }
  return this;
}

void sub_246095C24(_Unwind_Exception *exception_object)
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

char *std::vector<int>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<gcl::ArithmeticContext>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::unique_ptr<gcl::motion::EncoderImpl>::reset[abi:ne180100](gcl::motion::EncoderImpl **a1, gcl::motion::EncoderImpl *a2)
{
  gcl::motion::EncoderImpl *v3;
  void *v4;

  v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    gcl::motion::EncoderImpl::~EncoderImpl(v3);
    operator delete(v4);
  }
}

void gcl::motion::EncoderImpl::~EncoderImpl(gcl::motion::EncoderImpl *this)
{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)this + 139);
  if (v2)
  {
    *((_QWORD *)this + 140) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 136);
  if (v3)
  {
    *((_QWORD *)this + 137) = v3;
    operator delete(v3);
  }
}

void sub_246096070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_2460962BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<unsigned char>::vector(_QWORD *a1, size_t a2)
{
  char *v4;
  char *v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_246096374(_Unwind_Exception *exception_object)
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
    std::vector<gcl::ArithmeticContext>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<unsigned char>::__append(unint64_t *a1, size_t a2)
{
  char *v4;
  char *v5;
  unint64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t v9;
  size_t v10;
  unint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char v15;

  v5 = (char *)a1[1];
  v4 = (char *)a1[2];
  if (v4 - v5 >= a2)
  {
    if (a2)
    {
      bzero((void *)a1[1], a2);
      v5 += a2;
    }
    a1[1] = (unint64_t)v5;
  }
  else
  {
    v6 = *a1;
    v7 = &v5[-*a1];
    v8 = (unint64_t)&v7[a2];
    if ((uint64_t)&v7[a2] < 0)
      std::vector<gcl::ArithmeticContext>::__throw_length_error[abi:ne180100]();
    v9 = (unint64_t)&v4[-v6];
    if (2 * v9 > v8)
      v8 = 2 * v9;
    if (v9 >= 0x3FFFFFFFFFFFFFFFLL)
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v10 = v8;
    if (v10)
      v11 = (unint64_t)operator new(v10);
    else
      v11 = 0;
    v12 = &v7[v11];
    v13 = (char *)(v11 + v10);
    bzero(v12, a2);
    if (v5 == (char *)v6)
    {
      v11 = (unint64_t)v12;
    }
    else
    {
      v14 = &v5[~v6];
      do
      {
        v15 = *--v5;
        (v14--)[v11] = v15;
      }
      while (v5 != (char *)v6);
      v5 = (char *)*a1;
    }
    *a1 = v11;
    a1[1] = (unint64_t)&v12[a2];
    a1[2] = (unint64_t)v13;
    if (v5)
      operator delete(v5);
  }
}

_QWORD *std::vector<int>::__init_with_size[abi:ne180100]<int const*,int const*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<int>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_246096554(_Unwind_Exception *exception_object)
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_2460967D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  void *v11;
  void *v12;

  if (__p)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_246096B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, void *a13, uint64_t a14)
{
  void *v14;

  if (__p)
    operator delete(__p);
  if (a13)
    operator delete(a13);

  _Unwind_Resume(a1);
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

void sub_246096BD8(_Unwind_Exception *exception_object)
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

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n)
{
  std::vector<int>::pointer end;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<int>::__vallocate[abi:ne180100](this, __n);
    end = this->__end_;
    bzero(end, 4 * __n);
    this->__end_ = &end[__n];
  }
  return this;
}

void sub_246096C4C(_Unwind_Exception *exception_object)
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

uint64_t gcl::computeCRC32(uint64_t this, const unsigned __int8 *a2)
{
  unsigned __int8 *v2;
  int v3;

  if (!a2)
    return 0xFFFFFFFFLL;
  v2 = (unsigned __int8 *)this;
  LODWORD(this) = -1;
  do
  {
    v3 = *v2++;
    this = (dword_24609E9B0[v3 ^ BYTE3(this)] ^ ((_DWORD)this << 8));
    --a2;
  }
  while (a2);
  return this;
}

uint64_t gcl::motion::DecoderImpl::setSequenceParameterSet(gcl::motion::DecoderImpl *this, const AttributeInfo *a2)
{
  uint64_t result;
  unsigned __int8 quatizationBits;
  uint64_t v5;
  std::vector<int>::size_type v6;
  void *v7;
  uint64_t v8;

  *(_DWORD *)this = 0;
  result = 1;
  *((_BYTE *)this + 24) = 1;
  quatizationBits = a2->quatizationBits;
  *(_OWORD *)((char *)this + 28) = *(_OWORD *)&a2->apiVersion;
  *((_BYTE *)this + 44) = quatizationBits;
  v5 = *((int *)this + 9) * (uint64_t)*((int *)this + 10);
  if (v5 == (int)v5)
  {
    v6 = (int)v5;
    std::vector<int>::resize((std::vector<int> *)((char *)this + 1144), (int)v5);
    std::vector<int>::resize((std::vector<int> *)((char *)this + 1120), v6);
    v7 = (void *)*((_QWORD *)this + 140);
    v8 = *((_QWORD *)this + 141) - (_QWORD)v7;
    if (v8 >= 1)
      bzero(v7, 4 * (((unint64_t)v8 >> 2) - ((unint64_t)v8 > 3)) + 4);
    return 0;
  }
  return result;
}

uint64_t gcl::motion::DecoderImpl::decodeSequenceParameterSet(gcl::motion::DecoderImpl *this, const unsigned __int8 *a2, unint64_t a3, unint64_t *a4, AttributeInfo *a5)
{
  if (!a2 || a3 < 8 || *a2 != 3)
    return 3;
  a5->version = *(Version *)(a2 + 1);
  a5->attributeCount = *(unsigned __int16 *)(a2 + 5);
  a5->componentsPerAttribute = a2[7];
  *a4 = 8;
  return gcl::motion::DecoderImpl::setSequenceParameterSet(this, a5);
}

uint64_t gcl::motion::DecoderImpl::decodeResidual(uint64_t result, uint64_t a2, int *a3, int a4, _BYTE *a5, _QWORD *a6, _DWORD *a7)
{
  uint64_t v10;
  unsigned int *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  int v18;
  uint64_t v19;
  unsigned int *v20;
  uint64_t v21;
  _BOOL4 v22;
  _WORD *v23;
  unsigned int v24;
  int v25;
  unsigned int v26;
  int v27;
  unsigned int v28;
  int v29;
  unsigned int v30;
  int v31;
  unsigned int v32;
  int v33;
  uint64_t v34;
  int v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  int v40;
  unsigned int v41;

  if (!*a5)
  {
    if (a4 < 1)
      return result;
    v19 = 0;
    v20 = (unsigned int *)(result + 48);
    v41 = a4;
    v21 = a4;
    while (1)
    {
      result = gcl::ArithmeticDecoder::decode(v20, (_WORD *)(*a6 + 2 * v19));
      if ((_DWORD)result)
        break;
      v38 = 0;
LABEL_47:
      a7[v19++] = v38;
      if (v19 == v21)
      {
LABEL_48:
        v39 = v41;
        do
        {
          v40 = *a3++;
          *a7++ += v40;
          --v39;
        }
        while (v39);
        return result;
      }
    }
    v22 = gcl::ArithmeticDecoder::decode(v20, (_WORD *)(a6[3] + 2 * v19));
    v23 = (_WORD *)(a6[6] + 2 * (int)((_DWORD)v19 << 6));
    if (gcl::ArithmeticDecoder::decode(v20, v23))
      v24 = 32;
    else
      v24 = 0;
    if (gcl::ArithmeticDecoder::decode(v20, &v23[(v24 >> 5) + 1]))
      v25 = 16;
    else
      v25 = 0;
    v26 = v25 | v24;
    if (gcl::ArithmeticDecoder::decode(v20, &v23[(v26 >> 4) + 3]))
      v27 = 8;
    else
      v27 = 0;
    v28 = v26 | v27;
    if (gcl::ArithmeticDecoder::decode(v20, &v23[(v28 >> 3) + 7]))
      v29 = 4;
    else
      v29 = 0;
    v30 = v28 | v29;
    if (gcl::ArithmeticDecoder::decode(v20, &v23[(v30 >> 2) + 15]))
      v31 = 2;
    else
      v31 = 0;
    v32 = v30 | v31;
    result = gcl::ArithmeticDecoder::decode(v20, &v23[(v32 >> 1) + 31]);
    v33 = v32 | result;
    if ((v32 | result) == 0x3F)
    {
      v34 = a6[12];
      result = gcl::ArithmeticDecoder::decodeExpGolomb(v20, *(_DWORD *)(v34 + 4 * v19), (_WORD *)(a6[9] + 2 * v19));
      v33 = result + 63;
      v35 = *(_DWORD *)(v34 + 4 * v19);
      v36 = ((int)result + 63) >> v35;
      if (!v35 || v36)
      {
        if (v36 < 2)
          goto LABEL_44;
        v37 = 1;
      }
      else
      {
        v37 = -1;
      }
      *(_DWORD *)(v34 + 4 * v19) = v35 + v37;
    }
LABEL_44:
    if (v22)
      v38 = v33 + 1;
    else
      v38 = ~v33;
    goto LABEL_47;
  }
  if (*a5 != 1)
    gcl::motion::DecoderImpl::decodeResidual();
  if (a4 >= 1)
  {
    v10 = 0;
    v11 = (unsigned int *)(result + 48);
    v41 = a4;
    v12 = a4;
    while (1)
    {
      v13 = a6[12];
      result = gcl::ArithmeticDecoder::decodeSignedExpGolomb(v11, *(_DWORD *)(v13 + 4 * v10), (_WORD *)(a6[3] + 2 * v10), (_WORD *)(a6[9] + 2 * v10));
      v14 = (int)result >= 0 ? result : -(int)result;
      v15 = *(_DWORD *)(v13 + 4 * v10);
      v16 = v14 >> v15;
      if (v15 && v16 == 0)
        break;
      if (v16 >= 2)
      {
        v18 = 1;
LABEL_15:
        *(_DWORD *)(v13 + 4 * v10) = v15 + v18;
      }
      a7[v10++] = result;
      if (v10 == v12)
        goto LABEL_48;
    }
    v18 = -1;
    goto LABEL_15;
  }
  return result;
}

BOOL gcl::ArithmeticDecoder::decode(unsigned int *a1, _WORD *a2)
{
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  int v10;
  unsigned int v11;
  BOOL v12;
  unsigned int v13;
  unsigned int v14;
  _BOOL8 v15;
  unsigned int v16;

  v2 = (unsigned __int16)*a2;
  v3 = a1[7];
  v4 = a1[8];
  if (v3 > 0x40000000)
  {
    v11 = a1[7];
  }
  else
  {
    v5 = a1[10];
    do
    {
      v4 *= 2;
      a1[10] = --v5;
      if (!v5)
      {
        v6 = *((_QWORD *)a1 + 2);
        *((_QWORD *)a1 + 2) = v6 + 1;
        v7 = *a1;
        if (v6 + 1 >= v7)
          v8 = 65280;
        else
          v8 = *(unsigned __int8 *)(*((_QWORD *)a1 + 1) + v6 + 1) << 8;
        v9 = v6 + 2;
        *((_QWORD *)a1 + 2) = v9;
        if (v9 >= v7)
          v10 = 255;
        else
          v10 = *(unsigned __int8 *)(*((_QWORD *)a1 + 1) + v9);
        v4 |= v8 | v10;
        v5 = 16;
        a1[10] = 16;
      }
      v11 = 2 * v3;
      v12 = v3 >= 0x20000001;
      v3 *= 2;
    }
    while (!v12);
  }
  v13 = (HIWORD(v11) * v2) & 0xFFFF0000;
  v14 = v11 - v13;
  v15 = v4 >= v13;
  *a2 = *((_WORD *)a1 + ((v2 >> 7) & 0x1FE | v15) + 24) + v2;
  if (v4 < v13)
    v16 = v13;
  else
    v16 = v14;
  if (v4 < v13)
    v13 = 0;
  a1[7] = v16;
  a1[8] = v4 - v13;
  return v15;
}

uint64_t gcl::ArithmeticDecoder::decodeExpGolomb(unsigned int *a1, int a2, _WORD *a3)
{
  int v4;
  int v6;
  int v7;
  int v9;
  int v10;
  __int16 v12;

  if (a2 < 0)
    gcl::ArithmeticDecoder::decodeExpGolomb();
  v4 = a2;
  v6 = 0;
  if (gcl::ArithmeticDecoder::decode(a1, a3) && v4 <= 0x1E)
  {
    v6 = 0;
    do
    {
      v7 = v4 + 1;
      v6 |= 1 << v4;
      if (!gcl::ArithmeticDecoder::decode(a1, a3))
        break;
    }
    while (v4++ < 30);
  }
  else
  {
    v7 = v4;
  }
  v9 = 0;
  if (v7)
  {
    v10 = v7 - 1;
    do
    {
      v12 = 0x8000;
      v9 |= gcl::ArithmeticDecoder::decode(a1, &v12) << v10--;
    }
    while (v10 != -1);
  }
  return (v9 + v6);
}

uint64_t gcl::ArithmeticDecoder::decodeSignedExpGolomb(unsigned int *a1, int a2, _WORD *a3, _WORD *a4)
{
  uint64_t result;
  unsigned int v7;

  if (a2 < 0)
    gcl::ArithmeticDecoder::decodeSignedExpGolomb();
  result = gcl::ArithmeticDecoder::decodeExpGolomb(a1, a2, a4);
  if ((_DWORD)result)
  {
    v7 = result;
    if (gcl::ArithmeticDecoder::decode(a1, a3))
      return v7;
    else
      return -v7;
  }
  return result;
}

uint64_t gcl::motion::DecoderImpl::decodeFrame(gcl::motion::DecoderImpl *this, const unsigned __int8 *a2, unint64_t a3, unint64_t *a4, int *a5)
{
  uint64_t result;
  int *v7;
  unsigned int v9;
  unint64_t v10;
  __int16 v11;
  unsigned int v12;
  int v13;
  unsigned __int8 v14;
  char v15;
  uint64_t v16;
  std::vector<int>::size_type v17;
  uint64_t v18;
  int v19;
  _DWORD *v20;
  uint64_t v21;
  uint64_t v22;
  std::vector<int>::pointer v23;
  uint64_t v24;
  int *v25;
  int *v26;
  uint64_t v27;
  int *v28;
  int v29;
  int v30;
  int v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  std::vector<int>::size_type v35;
  uint64_t v36;
  int v37;
  _DWORD *v38;
  uint64_t v39;
  uint64_t v40;
  std::vector<int>::pointer begin;
  uint64_t v42;
  unsigned int v43;
  uint64_t v44;
  int *v46;
  uint64_t v47;
  int *v48;
  int v49;
  int *v50;
  int *v51;
  uint64_t v52;
  int *v53;
  int v54;
  int v55;
  int v56;
  _DWORD *v57;
  int v58;
  int *v59;
  uint64_t v60;
  int *v61;
  int v62;
  _DWORD *v63;
  int v64;
  char v65;
  std::vector<int>::value_type __x;
  std::vector<int> v67;
  void *v68[2];
  void *v69[2];
  __int128 v70;
  void *v71[2];
  void *v72[2];
  __int128 v73;
  void *__p[2];
  uint64_t v75;
  _BYTE v76[17];

  result = 5;
  if (a3 >= 6)
  {
    if (a2)
    {
      v7 = a5;
      if (a5)
      {
        if (*((_BYTE *)this + 32))
          return 11;
        v9 = *((unsigned __int8 *)this + 33);
        if (v9 >= 3)
        {
          if (a3 < 8)
            return 3;
          v10 = *(_QWORD *)a2;
          *((_QWORD *)this + 1) = *(_QWORD *)a2;
          v11 = WORD1(v10);
          *((_WORD *)this + 3) = WORD1(v10);
          if (*((_BYTE *)this + 24) || v10 != 1)
          {
            if (!(_BYTE)v10)
            {
              *((_BYTE *)this + 4) = 0;
              v15 = 1;
LABEL_44:
              v32 = BYTE1(v10);
              v76[0] = BYTE1(v10) & 1;
              if ((v10 & 0x800) == 0)
              {
                v33 = 8;
LABEL_46:
                v65 = v15;
                v34 = (v10 >> 40) & 0xFF00 | (v10 >> 24) & 0xFF0000 | HIBYTE(v10);
                *((_DWORD *)this + 12) = v34;
                *((_QWORD *)this + 7) = &a2[v33];
                gcl::ArithmeticDecoder::start((gcl::motion::DecoderImpl *)((char *)this + 48));
                v75 = 0;
                v73 = 0u;
                *(_OWORD *)__p = 0u;
                *(_OWORD *)v71 = 0u;
                *(_OWORD *)v72 = 0u;
                *(_OWORD *)v69 = 0u;
                v70 = 0u;
                *(_OWORD *)v68 = 0u;
                gcl::motion::ACContext::init((std::vector<int> *)v68, *((_DWORD *)this + 10));
                v35 = *((int *)this + 10);
                __x = 0;
                std::vector<int>::vector(&v67, v35, &__x);
                if (*((int *)this + 9) >= 1)
                {
                  v37 = 0;
                  v38 = (_DWORD *)*((_QWORD *)this + 143);
                  LODWORD(v39) = *((_DWORD *)this + 10);
                  do
                  {
                    gcl::motion::DecoderImpl::decodeResidual((uint64_t)this, v36, v67.__begin_, v39, v76, v68, v38);
                    if ((v32 & 0x10) != 0 && *((int *)this + 10) >= 1)
                    {
                      v40 = 0;
                      begin = v67.__begin_;
                      do
                      {
                        begin[v40] = v38[v40];
                        ++v40;
                      }
                      while (v40 < *((int *)this + 10));
                    }
                    ++v37;
                    v39 = *((int *)this + 10);
                    v38 += v39;
                  }
                  while (v37 < *((_DWORD *)this + 9));
                }
                if (v67.__begin_)
                {
                  v67.__end_ = v67.__begin_;
                  operator delete(v67.__begin_);
                }
                if (__p[0])
                {
                  __p[1] = __p[0];
                  operator delete(__p[0]);
                }
                if (v72[1])
                {
                  *(void **)&v73 = v72[1];
                  operator delete(v72[1]);
                }
                if (v71[0])
                {
                  v71[1] = v71[0];
                  operator delete(v71[0]);
                }
                if (v69[1])
                {
                  *(void **)&v70 = v69[1];
                  operator delete(v69[1]);
                }
                if (v68[0])
                {
                  v68[1] = v68[0];
                  operator delete(v68[0]);
                }
                v42 = *((int *)this + 9) * (uint64_t)*((int *)this + 10);
                if (v42 != (int)v42)
                  return 1;
                if ((v65 & 1) != 0)
                {
                  if ((int)v42 >= 1)
                  {
                    v46 = (int *)*((_QWORD *)this + 143);
                    v47 = v42;
                    v48 = v7;
                    do
                    {
                      v49 = *v46++;
                      *v48++ = v49;
                      --v47;
                    }
                    while (v47);
LABEL_82:
                    v57 = (_DWORD *)*((_QWORD *)this + 140);
                    v42 = v42;
                    do
                    {
                      v58 = *v7++;
                      *v57++ = v58;
                      --v42;
                    }
                    while (v42);
                  }
                }
                else if ((int)v42 >= 1)
                {
                  v50 = (int *)*((_QWORD *)this + 143);
                  v51 = (int *)*((_QWORD *)this + 140);
                  v52 = v42;
                  v53 = v7;
                  do
                  {
                    v55 = *v50++;
                    v54 = v55;
                    v56 = *v51++;
                    *v53++ = v56 + v54;
                    --v52;
                  }
                  while (v52);
                  goto LABEL_82;
                }
                *a4 = v33 + v34;
                *((_WORD *)this + 8) = v11;
                goto LABEL_91;
              }
              v43 = 0;
              v44 = 8;
              while (1)
              {
                v33 = v44 + 4;
                if (v44 + 4 > a3)
                  return 3;
                if ((a2[v44] & 0x80) != 0)
                {
                  v44 += 4;
                  if (v43++ < 0xF)
                    continue;
                }
                goto LABEL_46;
              }
            }
            if (v10 != 1)
              return result;
          }
          else
          {
            v12 = *((unsigned __int16 *)this + 8);
            if (v12 > WORD1(v10) && (int)(v12 - WORD1(v10)) < 0x8000
              || v12 < WORD1(v10) && (int)(WORD1(v10) - v12) > 0x8000)
            {
              return 8;
            }
          }
          *((_BYTE *)this + 4) = 1;
          if (!WORD1(v10) || *((unsigned __int16 *)this + 8) + 1 == WORD1(v10))
          {
            if (*((_DWORD *)this + 5))
              return 10;
            v15 = 0;
            goto LABEL_44;
          }
          return 7;
        }
        if (v9 != 1)
          return 11;
        v13 = *a2;
        v14 = a2[1];
        if (*a2)
        {
          if (v13 != 1)
            return result;
          if (*((_BYTE *)this + 4))
            return 7;
          *((_BYTE *)this + 4) = 1;
        }
        else
        {
          *((_BYTE *)this + 4) = 0;
        }
        v76[0] = v14 & 1;
        v16 = *(unsigned int *)(a2 + 2);
        *((_DWORD *)this + 12) = v16;
        *((_QWORD *)this + 7) = a2 + 6;
        gcl::ArithmeticDecoder::start((gcl::motion::DecoderImpl *)((char *)this + 48));
        v75 = 0;
        v73 = 0u;
        *(_OWORD *)__p = 0u;
        *(_OWORD *)v71 = 0u;
        *(_OWORD *)v72 = 0u;
        *(_OWORD *)v69 = 0u;
        v70 = 0u;
        *(_OWORD *)v68 = 0u;
        gcl::motion::ACContext::init((std::vector<int> *)v68, *((_DWORD *)this + 10));
        v17 = *((int *)this + 10);
        __x = 0;
        std::vector<int>::vector(&v67, v17, &__x);
        if (*((int *)this + 9) >= 1)
        {
          v19 = 0;
          v20 = (_DWORD *)*((_QWORD *)this + 143);
          LODWORD(v21) = *((_DWORD *)this + 10);
          do
          {
            gcl::motion::DecoderImpl::decodeResidual((uint64_t)this, v18, v67.__begin_, v21, v76, v68, v20);
            if ((v14 & 0x10) != 0 && *((int *)this + 10) >= 1)
            {
              v22 = 0;
              v23 = v67.__begin_;
              do
              {
                v23[v22] = v20[v22];
                ++v22;
              }
              while (v22 < *((int *)this + 10));
            }
            ++v19;
            v21 = *((int *)this + 10);
            v20 += v21;
          }
          while (v19 < *((_DWORD *)this + 9));
        }
        if (v67.__begin_)
        {
          v67.__end_ = v67.__begin_;
          operator delete(v67.__begin_);
        }
        gcl::motion::ACContext::~ACContext((gcl::motion::ACContext *)v68);
        v24 = *((int *)this + 9) * (uint64_t)*((int *)this + 10);
        if (v24 != (int)v24)
          return 1;
        if (v13)
        {
          if ((int)v24 >= 1)
          {
            v25 = (int *)*((_QWORD *)this + 143);
            v26 = (int *)*((_QWORD *)this + 140);
            v27 = v24;
            v28 = v7;
            do
            {
              v30 = *v25++;
              v29 = v30;
              v31 = *v26++;
              *v28++ = v31 + v29;
              --v27;
            }
            while (v27);
LABEL_88:
            v63 = (_DWORD *)*((_QWORD *)this + 140);
            v24 = v24;
            do
            {
              v64 = *v7++;
              *v63++ = v64;
              --v24;
            }
            while (v24);
          }
        }
        else if ((int)v24 >= 1)
        {
          v59 = (int *)*((_QWORD *)this + 143);
          v60 = v24;
          v61 = v7;
          do
          {
            v62 = *v59++;
            *v61++ = v62;
            --v60;
          }
          while (v60);
          goto LABEL_88;
        }
        *a4 = v16 + 6;
LABEL_91:
        ++*(_DWORD *)this;
        result = 0;
        if (*((_BYTE *)this + 24))
          *((_BYTE *)this + 24) = 0;
      }
    }
  }
  return result;
}

void sub_246097778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, char a13)
{
  gcl::motion::ACContext::~ACContext((gcl::motion::ACContext *)&a13);
  _Unwind_Resume(a1);
}

gcl::motion::Decoder *gcl::motion::Decoder::Decoder(gcl::motion::Decoder *this)
{
  char *v2;

  v2 = (char *)operator new(0x490uLL);
  *(_DWORD *)v2 = 0;
  v2[4] = -1;
  *((_WORD *)v2 + 3) = 0;
  *((_WORD *)v2 + 8) = 0;
  *((_DWORD *)v2 + 5) = 9;
  v2[24] = 1;
  *(_QWORD *)(v2 + 36) = 0;
  *(_QWORD *)(v2 + 28) = 0;
  v2[44] = 0;
  *((_QWORD *)v2 + 7) = 0;
  *((_OWORD *)v2 + 70) = 0u;
  *((_OWORD *)v2 + 71) = 0u;
  *((_OWORD *)v2 + 72) = 0u;
  *(_QWORD *)this = v2;
  return this;
}

{
  char *v2;

  v2 = (char *)operator new(0x490uLL);
  *(_DWORD *)v2 = 0;
  v2[4] = -1;
  *((_WORD *)v2 + 3) = 0;
  *((_WORD *)v2 + 8) = 0;
  *((_DWORD *)v2 + 5) = 9;
  v2[24] = 1;
  *(_QWORD *)(v2 + 36) = 0;
  *(_QWORD *)(v2 + 28) = 0;
  v2[44] = 0;
  *((_QWORD *)v2 + 7) = 0;
  *((_OWORD *)v2 + 70) = 0u;
  *((_OWORD *)v2 + 71) = 0u;
  *((_OWORD *)v2 + 72) = 0u;
  *(_QWORD *)this = v2;
  return this;
}

void gcl::motion::Decoder::~Decoder(gcl::motion::DecoderImpl **this)
{
  std::unique_ptr<gcl::motion::DecoderImpl>::reset[abi:ne180100](this, 0);
}

{
  std::unique_ptr<gcl::motion::DecoderImpl>::reset[abi:ne180100](this, 0);
}

uint64_t gcl::motion::Decoder::setSequenceParameterSet(gcl::motion::DecoderImpl **this, const AttributeInfo *a2)
{
  return gcl::motion::DecoderImpl::setSequenceParameterSet(*this, a2);
}

uint64_t gcl::motion::Decoder::decodeSequenceParameterSet(gcl::motion::DecoderImpl **this, const unsigned __int8 *a2, unint64_t a3, unint64_t *a4, AttributeInfo *a5)
{
  return gcl::motion::DecoderImpl::decodeSequenceParameterSet(*this, a2, a3, a4, a5);
}

uint64_t gcl::motion::Decoder::decodeFrame(gcl::motion::DecoderImpl **this, const unsigned __int8 *a2, unint64_t a3, unint64_t *a4, int *a5)
{
  uint64_t result;

  result = gcl::motion::DecoderImpl::decodeFrame(*this, a2, a3, a4, a5);
  *((_DWORD *)*this + 5) = result;
  return result;
}

uint64_t gcl::motion::Decoder::getCurrentFrameNumber(gcl::motion::Decoder *this)
{
  return *(unsigned __int16 *)(*(_QWORD *)this + 10);
}

uint64_t gcl::motion::Decoder::getCurrentFrameQP(gcl::motion::Decoder *this)
{
  return *(unsigned __int8 *)(*(_QWORD *)this + 12);
}

uint64_t gcl::motion::Decoder::getCurrentFrameFlags(gcl::motion::Decoder *this)
{
  return *(unsigned __int8 *)(*(_QWORD *)this + 9);
}

uint64_t gcl::motion::Decoder::getCurrentFramePayloadLength(gcl::motion::Decoder *this)
{
  return (*(unsigned __int8 *)(*(_QWORD *)this + 13) << 16) | (*(unsigned __int8 *)(*(_QWORD *)this + 14) << 8) | *(unsigned __int8 *)(*(_QWORD *)this + 15);
}

uint64_t gcl::motion::Decoder::getlastDecodedFrameNumber(gcl::motion::Decoder *this)
{
  return *(unsigned __int16 *)(*(_QWORD *)this + 16);
}

void std::unique_ptr<gcl::motion::DecoderImpl>::reset[abi:ne180100](gcl::motion::DecoderImpl **a1, gcl::motion::DecoderImpl *a2)
{
  gcl::motion::DecoderImpl *v3;
  void *v4;

  v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    gcl::motion::DecoderImpl::~DecoderImpl(v3);
    operator delete(v4);
  }
}

void gcl::motion::DecoderImpl::~DecoderImpl(gcl::motion::DecoderImpl *this)
{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)this + 143);
  if (v2)
  {
    *((_QWORD *)this + 144) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 140);
  if (v3)
  {
    *((_QWORD *)this + 141) = v3;
    operator delete(v3);
  }
}

void type metadata accessor for SCEncodedFrameType(uint64_t a1)
{
  sub_246097A04(a1, &qword_25753EE58);
}

void type metadata accessor for SCError(uint64_t a1)
{
  sub_246097A04(a1, &qword_25753EE60);
}

void sub_246097A04(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_246097A4C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t destroy for SignalSessionParameters(uint64_t a1)
{
  return sub_246097A9C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t sub_246097A9C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t _s17SignalCompression23SignalSessionParametersVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_246097A4C(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t assignWithCopy for SignalSessionParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_246097A4C(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  sub_246097A9C(v6, v7);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy20_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for SignalSessionParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_246097A9C(v4, v5);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SignalSessionParameters(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 20))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for SignalSessionParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_DWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 13;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 20) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 20) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SignalSessionParameters()
{
  return &type metadata for SignalSessionParameters;
}

BOOL sub_246097C80(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_246097C98()
{
  sub_24609D8F8();
  sub_24609D904();
  return sub_24609D910();
}

uint64_t sub_246097CDC()
{
  return sub_24609D904();
}

uint64_t sub_246097D04()
{
  sub_24609D8F8();
  sub_24609D904();
  return sub_24609D910();
}

uint64_t sub_246097D44()
{
  _BYTE *v0;

  if (*v0)
    return 28785;
  else
    return 0x6172615065726F63;
}

uint64_t sub_246097D78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2460980DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_246097D9C()
{
  return 0;
}

void sub_246097DA8(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_246097DB4()
{
  sub_2460983C8();
  return sub_24609D934();
}

uint64_t sub_246097DDC()
{
  sub_2460983C8();
  return sub_24609D940();
}

uint64_t sub_246097E04(_QWORD *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD v13[2];
  int v14;
  char v15;

  v14 = a4;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753EE88);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2460983C8();
  sub_24609D928();
  v13[0] = a2;
  v13[1] = a3;
  v15 = 0;
  sub_246098470();
  sub_24609D8B0();
  if (!v4)
  {
    LOBYTE(v13[0]) = 1;
    sub_24609D8BC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_246097F3C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  int v6;

  result = sub_2460981C0(a1);
  if (!v2)
  {
    *(_QWORD *)a2 = result;
    *(_QWORD *)(a2 + 8) = v5;
    *(_DWORD *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_246097F68(_QWORD *a1)
{
  uint64_t v1;

  return sub_246097E04(a1, *(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_DWORD *)(v1 + 16));
}

_QWORD *sub_246097F84@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_246097F94(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_246097FA0()
{
  sub_24609D8F8();
  sub_24609D7CC();
  return sub_24609D910();
}

uint64_t sub_246098000()
{
  sub_2460984B4(&qword_25753EE98, (uint64_t)&protocol conformance descriptor for SCError);
  return sub_24609D73C();
}

uint64_t sub_246098048()
{
  sub_24609D8F8();
  sub_24609D7CC();
  return sub_24609D910();
}

BOOL sub_2460980A4(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2460980B8()
{
  return sub_2460984B4(&qword_25753EE68, (uint64_t)&unk_24609EE18);
}

uint64_t sub_2460980DC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6172615065726F63 && a2 == 0xEA0000000000736DLL;
  if (v2 || (sub_24609D8D4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 28785 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_24609D8D4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2460981C0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  unint64_t v9;
  _BYTE v10[16];
  uint64_t v11;
  unint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753EE70);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_2460983C8();
  sub_24609D91C();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v10[15] = 0;
    sub_24609842C();
    sub_24609D898();
    v7 = v11;
    v9 = v12;
    LOBYTE(v11) = 1;
    sub_246097A4C(v7, v12);
    sub_24609D8A4();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    sub_246097A9C(v7, v9);
  }
  return v7;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24954E874]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2460983C8()
{
  unint64_t result;

  result = qword_25753EE78;
  if (!qword_25753EE78)
  {
    result = MEMORY[0x24954E88C](&unk_24609EFD8, &type metadata for SignalSessionParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25753EE78);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

unint64_t sub_24609842C()
{
  unint64_t result;

  result = qword_25753EE80;
  if (!qword_25753EE80)
  {
    result = MEMORY[0x24954E88C](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_25753EE80);
  }
  return result;
}

unint64_t sub_246098470()
{
  unint64_t result;

  result = qword_25753EE90;
  if (!qword_25753EE90)
  {
    result = MEMORY[0x24954E88C](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_25753EE90);
  }
  return result;
}

uint64_t sub_2460984B4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for SCError(255);
    result = MEMORY[0x24954E88C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SignalSessionParameters.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SignalSessionParameters.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_2460985E0 + 4 * byte_24609EDB5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_246098614 + 4 * byte_24609EDB0[v4]))();
}

uint64_t sub_246098614(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24609861C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246098624);
  return result;
}

uint64_t sub_246098630(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246098638);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24609863C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246098644(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246098650(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24609865C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SignalSessionParameters.CodingKeys()
{
  return &type metadata for SignalSessionParameters.CodingKeys;
}

unint64_t sub_24609867C()
{
  unint64_t result;

  result = qword_25753EEA0;
  if (!qword_25753EEA0)
  {
    result = MEMORY[0x24954E88C](&unk_24609EFB0, &type metadata for SignalSessionParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25753EEA0);
  }
  return result;
}

unint64_t sub_2460986C4()
{
  unint64_t result;

  result = qword_25753EEA8;
  if (!qword_25753EEA8)
  {
    result = MEMORY[0x24954E88C](&unk_24609EF20, &type metadata for SignalSessionParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25753EEA8);
  }
  return result;
}

unint64_t sub_24609870C()
{
  unint64_t result;

  result = qword_25753EEB0;
  if (!qword_25753EEB0)
  {
    result = MEMORY[0x24954E88C](&unk_24609EF48, &type metadata for SignalSessionParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25753EEB0);
  }
  return result;
}

void sub_246098750(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_2460987AC()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int16 v30;
  char v31;
  char v32;
  char v33;
  char v34;
  unsigned __int8 v35;

  v4 = v35;
  if (v35)
  {
    *(_QWORD *)(v3 - 104) = v2;
    v5 = v35;
    sub_24609CD58(0, v35, 0);
    v2 = *(_QWORD *)(v3 - 104);
    v29 = (int)v0;
    if ((_DWORD)v1)
    {
      if ((_DWORD)v1 == 1)
        v6 = (int)v0;
      else
        v6 = *(_QWORD *)(v0 + 16);
    }
    else
    {
      v6 = 0;
    }
    v28 = (uint64_t)v0 >> 32;
    v26 = v0 >> 16;
    v27 = v0 >> 8;
    v24 = HIDWORD(v0);
    v25 = v0 >> 24;
    v22 = HIWORD(v0);
    v23 = v0 >> 40;
    v21 = HIBYTE(v0);
    *(_QWORD *)(v3 - 136) = v1;
    *(_QWORD *)(v3 - 128) = v0;
    while (v5)
    {
      if ((_DWORD)v1)
      {
        if ((_DWORD)v1 == 1)
        {
          if (v6 < v29 || v6 >= v28)
            goto LABEL_29;
          v7 = sub_24609D700();
          if (!v7)
          {
            __break(1u);
LABEL_36:
            __break(1u);
          }
          v8 = v7;
          v9 = sub_24609D718();
          v10 = v6 - v9;
          if (__OFSUB__(v6, v9))
            goto LABEL_32;
        }
        else
        {
          if (v6 < *(_QWORD *)(v0 + 16))
            goto LABEL_31;
          if (v6 >= *(_QWORD *)(v0 + 24))
            goto LABEL_33;
          v12 = sub_24609D700();
          if (!v12)
            goto LABEL_36;
          v8 = v12;
          v13 = sub_24609D718();
          v10 = v6 - v13;
          if (__OFSUB__(v6, v13))
            goto LABEL_34;
        }
        v11 = *(_BYTE *)(v8 + v10);
      }
      else
      {
        if (v6 >= v35)
          goto LABEL_30;
        *(_BYTE *)(v3 - 118) = v0;
        *(_BYTE *)(v3 - 117) = v27;
        *(_BYTE *)(v3 - 116) = v26;
        *(_BYTE *)(v3 - 115) = v25;
        *(_BYTE *)(v3 - 114) = v24;
        *(_BYTE *)(v3 - 113) = v23;
        *(_BYTE *)(v3 - 112) = v22;
        *(_BYTE *)(v3 - 111) = v21;
        *(_WORD *)(v3 - 110) = v30;
        *(_BYTE *)(v3 - 108) = v31;
        *(_BYTE *)(v3 - 107) = v32;
        *(_BYTE *)(v3 - 106) = v33;
        *(_BYTE *)(v3 - 105) = v34;
        v11 = *(_BYTE *)(v3 - 118 + v6);
      }
      *(_BYTE *)(v3 - 118) = v11;
      v14 = sub_24609D8C8();
      v16 = v15;
      *(_QWORD *)(v3 - 104) = v2;
      v18 = *(_QWORD *)(v2 + 16);
      v17 = *(_QWORD *)(v2 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_24609CD58(v17 > 1, v18 + 1, 1);
        v2 = *(_QWORD *)(v3 - 104);
      }
      *(_QWORD *)(v2 + 16) = v18 + 1;
      v19 = v2 + 16 * v18;
      *(_QWORD *)(v19 + 32) = v14;
      *(_QWORD *)(v19 + 40) = v16;
      ++v6;
      --v5;
      --v4;
      v1 = *(_QWORD *)(v3 - 136);
      v0 = *(_QWORD *)(v3 - 128);
      if (!v4)
        return v2;
    }
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    __break(1u);
    JUMPOUT(0x246098A74);
  }
  return v2;
}

void sub_246098A9C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_246098AF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v4 = BYTE6(v22);
  if (BYTE6(v22))
  {
    *(_QWORD *)(v3 - 104) = v2;
    v5 = BYTE6(v22);
    sub_24609CD58(0, BYTE6(v22), 0);
    v2 = *(_QWORD *)(v3 - 104);
    if ((_DWORD)v1)
    {
      if ((_DWORD)v1 == 1)
        v6 = (int)a1;
      else
        v6 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v6 = 0;
    }
    *(_QWORD *)(v3 - 136) = v22 & 0x3FFFFFFFFFFFFFFFLL;
    *(_QWORD *)(v3 - 128) = v1;
    while (v5)
    {
      if ((_DWORD)v1)
      {
        if ((_DWORD)v1 == 1)
        {
          if (v6 < (int)a1 || v6 >= a1 >> 32)
            goto LABEL_29;
          v7 = sub_24609D700();
          if (!v7)
          {
            __break(1u);
LABEL_36:
            __break(1u);
          }
          v8 = v7;
          v9 = sub_24609D718();
          v10 = v6 - v9;
          if (__OFSUB__(v6, v9))
            goto LABEL_32;
        }
        else
        {
          if (v6 < *(_QWORD *)(a1 + 16))
            goto LABEL_31;
          if (v6 >= *(_QWORD *)(a1 + 24))
            goto LABEL_33;
          v12 = sub_24609D700();
          if (!v12)
            goto LABEL_36;
          v8 = v12;
          v13 = sub_24609D718();
          v10 = v6 - v13;
          if (__OFSUB__(v6, v13))
            goto LABEL_34;
        }
        v11 = *(_BYTE *)(v8 + v10);
      }
      else
      {
        if (v6 >= BYTE6(v22))
          goto LABEL_30;
        *(_QWORD *)(v3 - 118) = a1;
        *(_WORD *)(v3 - 110) = v22;
        *(_BYTE *)(v3 - 108) = BYTE2(v22);
        *(_BYTE *)(v3 - 107) = BYTE3(v22);
        *(_BYTE *)(v3 - 106) = BYTE4(v22);
        *(_BYTE *)(v3 - 105) = BYTE5(v22);
        v11 = *(_BYTE *)(v3 - 118 + v6);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_25753F010);
      v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_24609F030;
      *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE4260];
      *(_QWORD *)(v14 + 64) = MEMORY[0x24BEE42B0];
      *(_BYTE *)(v14 + 32) = v11;
      v15 = sub_24609D7E4();
      v17 = v16;
      *(_QWORD *)(v3 - 104) = v2;
      v19 = *(_QWORD *)(v2 + 16);
      v18 = *(_QWORD *)(v2 + 24);
      if (v19 >= v18 >> 1)
      {
        sub_24609CD58(v18 > 1, v19 + 1, 1);
        v2 = *(_QWORD *)(v3 - 104);
      }
      *(_QWORD *)(v2 + 16) = v19 + 1;
      v20 = v2 + 16 * v19;
      *(_QWORD *)(v20 + 32) = v15;
      *(_QWORD *)(v20 + 40) = v17;
      ++v6;
      --v5;
      --v4;
      v1 = *(_QWORD *)(v3 - 128);
      if (!v4)
        return v2;
    }
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    __break(1u);
    JUMPOUT(0x246098E08);
  }
  return v2;
}

uint64_t SignalDecoder.__allocating_init(encoderParams:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  SignalDecoder.init(encoderParams:)(a1, a2);
  return v4;
}

uint64_t SignalDecoder.init(encoderParams:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  unsigned int v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  float v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  void *v21;
  signed int v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31[2];
  unsigned int v32;

  v3 = v2;
  sub_24609D6C4();
  swift_allocObject();
  *(_QWORD *)(v2 + 48) = sub_24609D6B8();
  sub_24609D7B4();
  sub_246099590();
  swift_retain();
  sub_24609D6AC();
  swift_release();
  v6 = v31[0];
  v7 = v31[1];
  v8 = v32;
  sub_246097A4C(v31[0], v31[1]);
  sub_246097A4C(v31[0], v31[1]);
  v9 = sub_24609D7A8();
  v10 = sub_24609D820();
  v28 = a1;
  v29 = a2;
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v27 = swift_slowAlloc();
    *(_DWORD *)v11 = 136315138;
    v30 = v27;
    sub_24609D85C();
    swift_bridgeObjectRelease();
    strcpy((char *)v31, "(coreParams: ");
    HIWORD(v31[1]) = -4864;
    sub_246097A4C(v6, v7);
    sub_246098750(v6, v7);
    sub_246097A9C(v6, v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25753EEC0);
    sub_24609B3A4((unint64_t *)&qword_25753EEC8, &qword_25753EEC0, MEMORY[0x24BEE12B0]);
    sub_24609D7D8();
    swift_bridgeObjectRelease();
    sub_24609D7FC();
    swift_bridgeObjectRelease();
    sub_24609D7FC();
    sub_24609D8C8();
    sub_24609D7FC();
    swift_bridgeObjectRelease();
    sub_24609D7FC();
    v31[0] = sub_24609A19C(v31[0], v31[1], &v30);
    sub_24609D844();
    swift_bridgeObjectRelease();
    sub_246097A9C(v6, v7);
    sub_246097A9C(v6, v7);
    _os_log_impl(&dword_246093000, v9, v10, "Decoder Params: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954E8EC](v27, -1, -1);
    MEMORY[0x24954E8EC](v11, -1, -1);
  }
  else
  {
    sub_246097A9C(v31[0], v31[1]);
    sub_246097A9C(v31[0], v31[1]);
  }

  v12 = (float)(1 << v8);
  if (v8 >= 0x40)
    v12 = 0.0;
  *(float *)(v3 + 40) = v12;
  v31[0] = v6;
  v31[1] = v7;
  sub_246097A4C(v6, v7);
  sub_2460995D4();
  v13 = v31[0];
  v14 = v31[1];
  v15 = objc_allocWithZone((Class)MotionDecoderWrapper);
  sub_246097A4C(v13, v14);
  v16 = (void *)sub_24609D790();
  v17 = objc_msgSend(v15, sel_initWithEncoderSeqParams_, v16);
  sub_246097A9C(v13, v14);

  *(_QWORD *)(v3 + 16) = v17;
  v18 = sub_24609D7A8();
  v19 = sub_24609D820();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_246093000, v18, v19, "SC Decoder Session Init", v20, 2u);
    MEMORY[0x24954E8EC](v20, -1, -1);
  }

  v21 = *(void **)(v3 + 16);
  v22 = objc_msgSend(v21, sel_getAttributeCount);
  v23 = (int)objc_msgSend(v21, sel_getComponentPerAttributeCount);
  v24 = v23 * v22;
  result = sub_2460996A0(0, v24);
  *(_QWORD *)(v3 + 56) = result;
  *(_QWORD *)(v3 + 24) = v22;
  *(_QWORD *)(v3 + 32) = v23;
  if ((v24 - 0x2000000000000000) >> 62 == 3)
  {
    v26 = sub_246099788(0, 4 * v24);
    sub_246097A9C(v28, v29);
    sub_246097A9C(v6, v7);
    sub_246097A9C(v13, v14);
    *(_QWORD *)(v3 + 64) = v26;
    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_246099590()
{
  unint64_t result;

  result = qword_25753EEB8;
  if (!qword_25753EEB8)
  {
    result = MEMORY[0x24954E88C](&unk_24609EEEC, &type metadata for SignalSessionParameters);
    atomic_store(result, (unint64_t *)&qword_25753EEB8);
  }
  return result;
}

void sub_2460995D4()
{
  __asm { BR              X12 }
}

void sub_2460995FC()
{
  uint64_t v0;
  __int16 v2;

  if (!BYTE6(v0))
  {
    __break(1u);
    JUMPOUT(0x246099680);
  }
  sub_24609AB78();
  if ((v2 & 0x100) != 0)
    __asm { BR              X13 }
}

uint64_t sub_2460996A0(unsigned int a1, unint64_t a2)
{
  uint64_t result;
  unsigned int *v5;
  unint64_t v6;
  int32x4_t v7;
  int32x4_t *v8;
  unint64_t v9;
  unint64_t v10;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = sub_24609D880();
    __break(1u);
    return result;
  }
  if (!a2)
    return MEMORY[0x24BEE4AF8];
  result = sub_24609D814();
  *(_QWORD *)(result + 16) = a2;
  v5 = (unsigned int *)(result + 32);
  if (a2 < 8)
  {
    v6 = 0;
LABEL_9:
    v10 = a2 - v6;
    do
    {
      *v5++ = a1;
      --v10;
    }
    while (v10);
    return result;
  }
  v6 = a2 & 0xFFFFFFFFFFFFFFF8;
  v5 += a2 & 0xFFFFFFFFFFFFFFF8;
  v7 = vdupq_n_s32(a1);
  v8 = (int32x4_t *)(result + 48);
  v9 = a2 & 0xFFFFFFFFFFFFFFF8;
  do
  {
    v8[-1] = v7;
    *v8 = v7;
    v8 += 2;
    v9 -= 8;
  }
  while (v9);
  if (v6 != a2)
    goto LABEL_9;
  return result;
}

uint64_t sub_246099788(int a1, size_t a2)
{
  uint64_t v4;
  uint64_t result;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = sub_24609D880();
    __break(1u);
  }
  else
  {
    if (!a2)
      return MEMORY[0x24BEE4AF8];
    v4 = sub_24609D814();
    *(_QWORD *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1, a2);
    return v4;
  }
  return result;
}

uint64_t sub_246099840(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void *v5;
  void *v6;
  char *v7;
  char isUniquelyReferenced_nonNull_native;
  int v9;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char **v20;
  char *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  float v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t *v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44[4];

  v44[3] = *MEMORY[0x24BDAC8D0];
  v42 = 0;
  v5 = *(void **)(v2 + 16);
  v6 = (void *)sub_24609D790();
  swift_beginAccess();
  v7 = *(char **)(v2 + 56);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v2 + 56) = v7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    v7 = sub_24609A000(0, *((_QWORD *)v7 + 2), 0, v7);
  *(_QWORD *)(v2 + 56) = v7;
  swift_bridgeObjectRetain();
  v9 = objc_msgSend(v5, sel_decodeFrameInternal_decodedFrame_decodeError_, v6, v7 + 32, &v42);
  swift_endAccess();
  swift_bridgeObjectRelease();

  if (v9 >= 1 && v42 == 0)
  {
    v18 = *(_QWORD *)(v2 + 24);
    v19 = *(_QWORD *)(v2 + 32);
    v20 = (char **)(v2 + 64);
    swift_beginAccess();
    v21 = *(char **)(v2 + 64);
    v22 = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v2 + 64) = v21;
    if ((v22 & 1) == 0)
      goto LABEL_33;
    if (v18 < 0)
    {
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
    }
    while (v18)
    {
      if (v19 < 0)
        goto LABEL_35;
      v23 = 0;
      v24 = 0;
      v25 = v21 + 32;
      v26 = 4 * v19;
      v27 = 32;
      while (v24 != v18)
      {
        if ((unsigned __int128)(v24 * (__int128)v19) >> 64 != (v24 * v19) >> 63)
          goto LABEL_32;
        if (v19)
        {
          v28 = 0;
          v29 = *(float *)(v2 + 40);
          v30 = *(_QWORD *)(v2 + 56);
          while ((v23 & 0x8000000000000000) == 0)
          {
            if ((unint64_t)(v23 + v28) >= *(_QWORD *)(v30 + 16))
              goto LABEL_30;
            *(float *)&v25[4 * v28] = (float)*(int *)(v30 + v27 + 4 * v28) / v29;
            if (v19 == ++v28)
              goto LABEL_14;
          }
          __break(1u);
LABEL_30:
          __break(1u);
          break;
        }
LABEL_14:
        ++v24;
        v23 += v19;
        v25 += v26;
        v27 += v26;
        if (v24 == v18)
          goto LABEL_23;
      }
      __break(1u);
LABEL_32:
      __break(1u);
LABEL_33:
      v21 = sub_24609A980((uint64_t)v21);
      *v20 = v21;
      if (v18 < 0)
        goto LABEL_34;
    }
LABEL_23:
    *v20 = v21;
    swift_endAccess();
    v31 = swift_bridgeObjectRetain();
    v32 = sub_24609B1C8(v31);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_246097A4C(a1, a2);
    sub_246097A4C(a1, a2);
    v11 = sub_24609D7A8();
    v12 = sub_24609D82C();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v41 = swift_slowAlloc();
      v44[0] = v41;
      *(_DWORD *)v13 = 136315138;
      sub_246098A9C(a1, a2);
      v43 = v14;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25753EEC0);
      sub_24609B3A4((unint64_t *)&qword_25753EEC8, &qword_25753EEC0, MEMORY[0x24BEE12B0]);
      v15 = sub_24609D7D8();
      v17 = v16;
      swift_bridgeObjectRelease();
      v43 = sub_24609A19C(v15, v17, v44);
      sub_24609D844();
      swift_bridgeObjectRelease();
      sub_246097A9C(a1, a2);
      sub_246097A9C(a1, a2);
      _os_log_impl(&dword_246093000, v11, v12, "Cannot decode input frame %s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24954E8EC](v41, -1, -1);
      MEMORY[0x24954E8EC](v13, -1, -1);

    }
    else
    {

      sub_246097A9C(a1, a2);
      sub_246097A9C(a1, a2);
    }
    v33 = sub_24609D7A8();
    v34 = sub_24609D838();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = swift_slowAlloc();
      v36 = swift_slowAlloc();
      v44[0] = v36;
      *(_DWORD *)v35 = 136315394;
      swift_beginAccess();
      type metadata accessor for SCError(0);
      v37 = sub_24609D7F0();
      sub_24609A19C(v37, v38, v44);
      sub_24609D844();
      swift_bridgeObjectRelease();
      *(_WORD *)(v35 + 12) = 1024;
      sub_24609D844();
      _os_log_impl(&dword_246093000, v33, v34, "Cannot decode inputs: %s len %d", (uint8_t *)v35, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x24954E8EC](v36, -1, -1);
      MEMORY[0x24954E8EC](v35, -1, -1);
    }

    swift_beginAccess();
    v32 = v42;
    type metadata accessor for SCError(0);
    sub_24609A830();
    swift_allocError();
    *v39 = v32;
    swift_willThrow();
  }
  return v32;
}

uint64_t SignalDecoder.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC17SignalCompression13SignalDecoder_logger;
  v2 = sub_24609D7C0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SignalDecoder.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC17SignalCompression13SignalDecoder_logger;
  v2 = sub_24609D7C0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_246099EC4(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_246099ED4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

char *sub_246099F08(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25753F008);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * v11 - 64;
      v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32])
          memmove(v12, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v12 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_24609AF2C(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_24609A000(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25753F018);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 29;
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
      v13 = v10 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v13 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32])
          memmove(v13, a4 + 32, 4 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_24609AE44(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24609A10C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24609A12C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_24609A19C(v6, v7, a3);
  v8 = *a1 + 8;
  sub_24609D844();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_24609A19C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_24609A26C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24609B3E8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_24609B3E8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24609A26C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_24609D850();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_24609A424(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_24609D874();
  if (!v8)
  {
    sub_24609D880();
    __break(1u);
LABEL_17:
    result = sub_24609D88C();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_24609A424(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_24609A4B8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_24609A690(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_24609A690(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24609A4B8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_24609A62C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_24609D868();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_24609D880();
      __break(1u);
LABEL_10:
      v2 = sub_24609D808();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_24609D88C();
    __break(1u);
LABEL_14:
    result = sub_24609D880();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_24609A62C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25753F008);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24609A690(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25753F008);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_24609D88C();
  __break(1u);
  return result;
}

_BYTE **sub_24609A7DC(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24954E880](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_24609A830()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25753EED0;
  if (!qword_25753EED0)
  {
    type metadata accessor for SCError(255);
    result = MEMORY[0x24954E88C]("5<i\v\b3i\v", v1);
    atomic_store(result, (unint64_t *)&qword_25753EED0);
  }
  return result;
}

void *sub_24609A878(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_24609D88C();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

_BYTE *sub_24609A90C@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_24609B010(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_24609B0D0((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_24609B148((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

char *sub_24609A980(uint64_t a1)
{
  return sub_246099F08(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_24609A994(uint64_t a1)
{
  return sub_24609A000(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void sub_24609A9A8()
{
  __asm { BR              X12 }
}

uint64_t sub_24609A9F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  __int16 v6;
  char v7;
  char v8;
  char v9;
  char v10;

  if (!BYTE6(a1))
  {
    __break(1u);
    JUMPOUT(0x24609AB3CLL);
  }
  if (BYTE6(a1) <= v2)
  {
    __break(1u);
    JUMPOUT(0x24609AB48);
  }
  v5 = v1;
  v6 = a1;
  v7 = BYTE2(a1);
  v8 = BYTE3(a1);
  v9 = BYTE4(a1);
  v10 = BYTE5(a1);
  v3 = *((unsigned __int8 *)&v5 + v2);
  sub_24609D778();
  return v3;
}

void sub_24609AB78()
{
  uint64_t *v0;
  uint64_t v1;
  __int16 v2;

  v1 = v0[1];
  sub_24609AC70(*v0, v1);
  if ((v2 & 0x100) == 0)
    __asm { BR              X10 }
  __break(1u);
  JUMPOUT(0x24609AC60);
}

void sub_24609AC70(uint64_t a1, uint64_t a2)
{
  __asm { BR              X12 }
}

char *sub_24609AE44(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 4 * a1 + 32);
    v6 = 4 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_24609D88C();
  __break(1u);
  return result;
}

char *sub_24609AF2C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  result = (char *)sub_24609D88C();
  __break(1u);
  return result;
}

uint64_t sub_24609B010(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_24609B0D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_24609D724();
  swift_allocObject();
  result = sub_24609D6F4();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_24609D76C();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_24609B148(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_24609D724();
  swift_allocObject();
  result = sub_24609D6F4();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_24609B1C8(uint64_t a1)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  uint64_t v10;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25753EFF8);
  v10 = sub_24609B3A4(&qword_25753F000, &qword_25753EFF8, MEMORY[0x24BDCFBE0]);
  v8[0] = a1;
  v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  v3 = (_BYTE *)(*v2 + 32);
  v4 = &v3[*(_QWORD *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_24609A90C(v3, v4, &v7);
  v5 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

uint64_t sub_24609B278()
{
  return type metadata accessor for SignalDecoder();
}

uint64_t type metadata accessor for SignalDecoder()
{
  uint64_t result;

  result = qword_25753EF00;
  if (!qword_25753EF00)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24609B2BC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24609D7C0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SignalDecoder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SignalDecoder.__allocating_init(encoderParams:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of SignalDecoder.decode(frame:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t sub_24609B3A4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24954E88C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24609B3E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_24609B424(uint64_t a1, uint64_t a2)
{
  __asm { BR              X9 }
}

uint64_t sub_24609B480()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int16 v30;
  char v31;
  char v32;
  char v33;
  char v34;
  unsigned __int8 v35;

  v4 = v35;
  if (v35)
  {
    *(_QWORD *)(v3 - 104) = v2;
    v5 = v35;
    sub_24609CD58(0, v35, 0);
    v2 = *(_QWORD *)(v3 - 104);
    v29 = (int)v0;
    if ((_DWORD)v1)
    {
      if ((_DWORD)v1 == 1)
        v6 = (int)v0;
      else
        v6 = *(_QWORD *)(v0 + 16);
    }
    else
    {
      v6 = 0;
    }
    v28 = (uint64_t)v0 >> 32;
    v26 = v0 >> 16;
    v27 = v0 >> 8;
    v24 = HIDWORD(v0);
    v25 = v0 >> 24;
    v22 = HIWORD(v0);
    v23 = v0 >> 40;
    v21 = HIBYTE(v0);
    *(_QWORD *)(v3 - 136) = v1;
    *(_QWORD *)(v3 - 128) = v0;
    while (v5)
    {
      if ((_DWORD)v1)
      {
        if ((_DWORD)v1 == 1)
        {
          if (v6 < v29 || v6 >= v28)
            goto LABEL_29;
          v7 = sub_24609D700();
          if (!v7)
          {
            __break(1u);
LABEL_36:
            __break(1u);
          }
          v8 = v7;
          v9 = sub_24609D718();
          v10 = v6 - v9;
          if (__OFSUB__(v6, v9))
            goto LABEL_32;
        }
        else
        {
          if (v6 < *(_QWORD *)(v0 + 16))
            goto LABEL_31;
          if (v6 >= *(_QWORD *)(v0 + 24))
            goto LABEL_33;
          v12 = sub_24609D700();
          if (!v12)
            goto LABEL_36;
          v8 = v12;
          v13 = sub_24609D718();
          v10 = v6 - v13;
          if (__OFSUB__(v6, v13))
            goto LABEL_34;
        }
        v11 = *(_BYTE *)(v8 + v10);
      }
      else
      {
        if (v6 >= v35)
          goto LABEL_30;
        *(_BYTE *)(v3 - 118) = v0;
        *(_BYTE *)(v3 - 117) = v27;
        *(_BYTE *)(v3 - 116) = v26;
        *(_BYTE *)(v3 - 115) = v25;
        *(_BYTE *)(v3 - 114) = v24;
        *(_BYTE *)(v3 - 113) = v23;
        *(_BYTE *)(v3 - 112) = v22;
        *(_BYTE *)(v3 - 111) = v21;
        *(_WORD *)(v3 - 110) = v30;
        *(_BYTE *)(v3 - 108) = v31;
        *(_BYTE *)(v3 - 107) = v32;
        *(_BYTE *)(v3 - 106) = v33;
        *(_BYTE *)(v3 - 105) = v34;
        v11 = *(_BYTE *)(v3 - 118 + v6);
      }
      *(_BYTE *)(v3 - 118) = v11;
      v14 = sub_24609D8C8();
      v16 = v15;
      *(_QWORD *)(v3 - 104) = v2;
      v18 = *(_QWORD *)(v2 + 16);
      v17 = *(_QWORD *)(v2 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_24609CD58(v17 > 1, v18 + 1, 1);
        v2 = *(_QWORD *)(v3 - 104);
      }
      *(_QWORD *)(v2 + 16) = v18 + 1;
      v19 = v2 + 16 * v18;
      *(_QWORD *)(v19 + 32) = v14;
      *(_QWORD *)(v19 + 40) = v16;
      ++v6;
      --v5;
      --v4;
      v1 = *(_QWORD *)(v3 - 136);
      v0 = *(_QWORD *)(v3 - 128);
      if (!v4)
        return v2;
    }
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    __break(1u);
    JUMPOUT(0x24609B748);
  }
  return v2;
}

uint64_t SignalEncoder.encoderParams.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  sub_246097A4C(v1, *(_QWORD *)(v0 + 72));
  return v1;
}

BOOL static SignalEncoder.FormatDescriptor.Semantic.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t SignalEncoder.FormatDescriptor.Semantic.hash(into:)()
{
  return sub_24609D904();
}

uint64_t SignalEncoder.FormatDescriptor.Semantic.hashValue.getter()
{
  sub_24609D8F8();
  sub_24609D904();
  return sub_24609D910();
}

SignalCompression::SignalEncoder::FormatDescriptor __swiftcall SignalEncoder.FormatDescriptor.init(attributeCount:componentsPerAttribute:semantic:)(Swift::Int attributeCount, Swift::Int componentsPerAttribute, SignalCompression::SignalEncoder::FormatDescriptor::Semantic semantic)
{
  uint64_t v3;
  char v4;
  SignalCompression::SignalEncoder::FormatDescriptor result;

  v4 = *(_BYTE *)semantic;
  *(_QWORD *)v3 = attributeCount;
  *(_QWORD *)(v3 + 8) = componentsPerAttribute;
  *(_BYTE *)(v3 + 16) = v4;
  result.componentsPerAttribute = componentsPerAttribute;
  result.attributeCount = attributeCount;
  result.semantic = semantic;
  return result;
}

SignalCompression::SignalEncoder::Options __swiftcall SignalEncoder.Options.init(quantizationBits:)(SignalCompression::SignalEncoder::Options quantizationBits)
{
  SignalCompression::SignalEncoder::Options *v1;

  v1->quantizationBits = quantizationBits.quantizationBits;
  return quantizationBits;
}

uint64_t SignalEncoder.FrameOptions.init(requestedType:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t SignalEncoder.EncodedFrame.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_246097A4C(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t SignalEncoder.EncodedFrame.type.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t SignalEncoder.__allocating_init(formatDescriptor:options:)(unint64_t *a1, unint64_t *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  SignalEncoder.init(formatDescriptor:options:)(a1, a2);
  return v4;
}

_QWORD *SignalEncoder.init(formatDescriptor:options:)(unint64_t *a1, unint64_t *a2)
{
  uint64_t v2;
  _QWORD *v3;
  unint64_t v4;
  unint64_t v5;
  char v6;
  unint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32[2];
  int v33;

  v3 = (_QWORD *)v2;
  v5 = *a1;
  v4 = a1[1];
  v6 = *((_BYTE *)a1 + 16);
  v7 = *a2;
  *(_QWORD *)(v2 + 24) = 0;
  sub_24609D7B4();
  if ((v5 & 0x8000000000000000) != 0
    || HIDWORD(v5)
    || (v4 & 0x8000000000000000) != 0
    || HIDWORD(v4)
    || (v7 & 0x8000000000000000) != 0
    || HIDWORD(v7))
  {
    sub_24609D880();
    __break(1u);
    JUMPOUT(0x24609BFACLL);
  }
  *(_QWORD *)(v2 + 16) = objc_msgSend(objc_allocWithZone((Class)MotionEncoderWrapper), sel_initWithAttributeCount_componentCount_quantization_, v5, v4, v7);
  v8 = sub_24609D7A8();
  v9 = sub_24609D820();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_246093000, v8, v9, "SC Encoder Session Init", v10, 2u);
    MEMORY[0x24954E8EC](v10, -1, -1);
  }

  *(_QWORD *)(v2 + 32) = v5;
  *(_QWORD *)(v2 + 40) = v4;
  v30 = v4;
  *(_BYTE *)(v2 + 48) = v6;
  v11 = 1 << v7;
  if (v7 >= 0x40)
    v11 = 0;
  *(float *)(v2 + 52) = (float)v11;
  v12 = objc_msgSend(*(id *)(v2 + 16), sel_getEncoderParams);
  v13 = sub_24609D79C();
  v15 = v14;

  sub_246097A4C(v13, v15);
  v16 = sub_24609D7A8();
  v17 = sub_24609D820();
  v31 = v5;
  if (os_log_type_enabled(v16, v17))
  {
    *(_DWORD *)swift_slowAlloc() = 134217984;
    __asm { BR              X10 }
  }
  sub_246097A9C(v13, v15);

  sub_24609D6E8();
  swift_allocObject();
  sub_24609D6DC();
  v32[0] = v13;
  v32[1] = v15;
  v33 = v7;
  sub_246097A4C(v13, v15);
  sub_24609CCB4();
  v3[8] = sub_24609D6D0();
  v3[9] = v18;
  swift_retain_n();
  v19 = sub_24609D7A8();
  v20 = sub_24609D82C();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v29 = swift_slowAlloc();
    v32[0] = v29;
    *(_DWORD *)v21 = 136315138;
    v22 = v3[8];
    v23 = v3[9];
    sub_246097A4C(v22, v23);
    sub_24609B424(v22, v23);
    sub_246097A9C(v22, v23);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25753EEC0);
    sub_24609CCF8();
    v24 = sub_24609D7D8();
    v26 = v25;
    swift_bridgeObjectRelease();
    sub_24609A19C(v24, v26, v32);
    sub_24609D844();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_246093000, v19, v20, "Encoder Params encoded: %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24954E8EC](v29, -1, -1);
    MEMORY[0x24954E8EC](v21, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  if ((unsigned __int128)((uint64_t)v31 * (__int128)(uint64_t)v30) >> 64 != (uint64_t)(v31 * v30) >> 63)
  {
    __break(1u);
    JUMPOUT(0x24609BF20);
  }
  v27 = sub_2460996A0(0, v31 * v30);
  sub_246097A9C(v13, v15);
  sub_246097A9C(v13, v15);
  swift_release();
  v3[7] = v27;
  return v3;
}

void sub_24609BFBC(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_24609C02C@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v7;

  v2 = *(_QWORD *)(v7 + 32);
  v3 = *(_QWORD *)(v7 + 40);
  v4 = v2 * v3;
  if ((unsigned __int128)(v2 * (__int128)v3) >> 64 != (v2 * v3) >> 63)
  {
    __break(1u);
    goto LABEL_7;
  }
  if ((unint64_t)(v4 - 0x2000000000000000) >> 62 != 3)
  {
LABEL_7:
    __break(1u);
    JUMPOUT(0x24609CA7CLL);
  }
  if (BYTE6(v1) == 4 * v4)
    __asm { BR              X10 }
  type metadata accessor for SCError(0);
  sub_2460984B4((unint64_t *)&qword_25753EED0, (uint64_t)"5<i\v\b3i\v");
  swift_allocError();
  *v5 = 1;
  return swift_willThrow();
}

uint64_t SignalEncoder.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  sub_246097A9C(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  v1 = v0 + OBJC_IVAR____TtC17SignalCompression13SignalEncoder_logger;
  v2 = sub_24609D7C0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SignalEncoder.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  sub_246097A9C(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  v1 = v0 + OBJC_IVAR____TtC17SignalCompression13SignalEncoder_logger;
  v2 = sub_24609D7C0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

unint64_t static SCError._nsErrorDomain.getter()
{
  return 0xD000000000000019;
}

uint64_t sub_24609CBD0()
{
  sub_2460984B4(&qword_25753EE98, (uint64_t)&protocol conformance descriptor for SCError);
  return sub_24609D754();
}

uint64_t sub_24609CC08()
{
  sub_2460984B4(&qword_25753EE98, (uint64_t)&protocol conformance descriptor for SCError);
  return sub_24609D748();
}

unint64_t sub_24609CC48()
{
  return 0xD000000000000019;
}

uint64_t sub_24609CC64()
{
  sub_2460984B4(&qword_25753EE98, (uint64_t)&protocol conformance descriptor for SCError);
  return sub_24609D730();
}

unint64_t sub_24609CCB4()
{
  unint64_t result;

  result = qword_25753F020;
  if (!qword_25753F020)
  {
    result = MEMORY[0x24954E88C](&unk_24609EEC4, &type metadata for SignalSessionParameters);
    atomic_store(result, (unint64_t *)&qword_25753F020);
  }
  return result;
}

unint64_t sub_24609CCF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25753EEC8;
  if (!qword_25753EEC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25753EEC0);
    result = MEMORY[0x24954E88C](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_25753EEC8);
  }
  return result;
}

uint64_t sub_24609CD44(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_246097A9C(a1, a2);
  return a1;
}

uint64_t sub_24609CD58(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_24609CD74(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_24609CD74(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25753F150);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_24609D88C();
  __break(1u);
  return result;
}

unint64_t sub_24609CEE0()
{
  unint64_t result;

  result = qword_25753F028;
  if (!qword_25753F028)
  {
    result = MEMORY[0x24954E88C](&protocol conformance descriptor for SignalEncoder.FormatDescriptor.Semantic, &type metadata for SignalEncoder.FormatDescriptor.Semantic);
    atomic_store(result, (unint64_t *)&qword_25753F028);
  }
  return result;
}

uint64_t sub_24609CF24()
{
  return sub_2460984B4(&qword_25753F030, (uint64_t)&protocol conformance descriptor for SCError);
}

uint64_t sub_24609CF48()
{
  return sub_2460984B4(&qword_25753F038, (uint64_t)&unk_24609EE80);
}

uint64_t sub_24609CF6C()
{
  return sub_2460984B4(&qword_25753F040, (uint64_t)&unk_24609EE44);
}

unint64_t sub_24609CF94()
{
  unint64_t result;

  result = qword_25753F048;
  if (!qword_25753F048)
  {
    result = MEMORY[0x24954E88C](MEMORY[0x24BEE1EC8], MEMORY[0x24BEE1E88]);
    atomic_store(result, (unint64_t *)&qword_25753F048);
  }
  return result;
}

uint64_t sub_24609CFD8()
{
  return sub_2460984B4((unint64_t *)&qword_25753EED0, (uint64_t)"5<i\v\b3i\v");
}

uint64_t sub_24609CFFC()
{
  return type metadata accessor for SignalEncoder();
}

uint64_t type metadata accessor for SignalEncoder()
{
  uint64_t result;

  result = qword_25753F078;
  if (!qword_25753F078)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24609D040()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24609D7C0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SignalEncoder()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SignalEncoder.__allocating_init(formatDescriptor:options:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of SignalEncoder.encode(frame:options:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for SignalEncoder.FormatDescriptor(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for SignalEncoder.FormatDescriptor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for SignalEncoder.FormatDescriptor()
{
  return &type metadata for SignalEncoder.FormatDescriptor;
}

uint64_t storeEnumTagSinglePayload for SignalEncoder.FormatDescriptor.Semantic(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_24609D220 + 4 * byte_24609F0E5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24609D254 + 4 * byte_24609F0E0[v4]))();
}

uint64_t sub_24609D254(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24609D25C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24609D264);
  return result;
}

uint64_t sub_24609D270(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24609D278);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24609D27C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24609D284(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SignalEncoder.FormatDescriptor.Semantic()
{
  return &type metadata for SignalEncoder.FormatDescriptor.Semantic;
}

ValueMetadata *type metadata accessor for SignalEncoder.Options()
{
  return &type metadata for SignalEncoder.Options;
}

ValueMetadata *type metadata accessor for SignalEncoder.FrameOptions()
{
  return &type metadata for SignalEncoder.FrameOptions;
}

uint64_t *sub_24609D2C4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *a2;
  v5 = a2[1];
  sub_246097A4C(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = a2[2];
  return a1;
}

uint64_t *assignWithCopy for SignalEncoder.EncodedFrame(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  sub_246097A4C(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_246097A9C(v6, v7);
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t *assignWithTake for SignalEncoder.EncodedFrame(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *a1;
  v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_246097A9C(v4, v5);
  a1[2] = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for SignalEncoder.EncodedFrame(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for SignalEncoder.EncodedFrame(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 13;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SignalEncoder.EncodedFrame()
{
  return &type metadata for SignalEncoder.EncodedFrame;
}

void gcl::ArithmeticEncoder::encodeExpGolomb()
{
  __assert_rtn("encodeExpGolomb", "ArithmeticCodec.hpp", 190, "symbol >= 0 && k >= 0");
}

void gcl::ArithmeticEncoder::encodeSignedExpGolomb()
{
  __assert_rtn("encodeSignedExpGolomb", "ArithmeticCodec.hpp", 202, "k >= 0");
}

void gcl::motion::DecoderImpl::decodeResidual()
{
  __assert_rtn("decodeResidual", "MotionDecoder.cpp", 181, "0");
}

void gcl::ArithmeticDecoder::decodeExpGolomb()
{
  __assert_rtn("decodeExpGolomb", "ArithmeticCodec.hpp", 329, "k >= 0");
}

void gcl::ArithmeticDecoder::decodeSignedExpGolomb()
{
  __assert_rtn("decodeSignedExpGolomb", "ArithmeticCodec.hpp", 344, "k >= 0");
}

uint64_t sub_24609D6AC()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_24609D6B8()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_24609D6C4()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_24609D6D0()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_24609D6DC()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_24609D6E8()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_24609D6F4()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_24609D700()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_24609D70C()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_24609D718()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_24609D724()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_24609D730()
{
  return MEMORY[0x24BDCC240]();
}

uint64_t sub_24609D73C()
{
  return MEMORY[0x24BDCC248]();
}

uint64_t sub_24609D748()
{
  return MEMORY[0x24BDCC250]();
}

uint64_t sub_24609D754()
{
  return MEMORY[0x24BDCC258]();
}

uint64_t sub_24609D760()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_24609D76C()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_24609D778()
{
  return MEMORY[0x24BDCDC28]();
}

uint64_t sub_24609D784()
{
  return MEMORY[0x24BDCDC58]();
}

uint64_t sub_24609D790()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_24609D79C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_24609D7A8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24609D7B4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24609D7C0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24609D7CC()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_24609D7D8()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_24609D7E4()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_24609D7F0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_24609D7FC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24609D808()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24609D814()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_24609D820()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_24609D82C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_24609D838()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24609D844()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24609D850()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24609D85C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_24609D868()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24609D874()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24609D880()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24609D88C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24609D898()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_24609D8A4()
{
  return MEMORY[0x24BEE33B8]();
}

uint64_t sub_24609D8B0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_24609D8BC()
{
  return MEMORY[0x24BEE3508]();
}

uint64_t sub_24609D8C8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_24609D8D4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24609D8E0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24609D8EC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_24609D8F8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24609D904()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24609D910()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_24609D91C()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_24609D928()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_24609D934()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_24609D940()
{
  return MEMORY[0x24BEE4A10]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

void operator delete(void *__p)
{
  off_2517325F8(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_251732600(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
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

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

