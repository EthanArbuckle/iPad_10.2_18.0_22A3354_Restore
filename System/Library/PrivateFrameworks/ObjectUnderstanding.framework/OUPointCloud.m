@implementation OUPointCloud

- (unint64_t)count
{
  return (uint64_t)(*(_QWORD *)&self->_anon_8[8] - *(_QWORD *)self->_anon_8) >> 4;
}

- (uint64_t)points
{
  return *(_QWORD *)(a1 + 32);
}

- (uint64_t)semanticLabels
{
  return *(_QWORD *)(a1 + 56);
}

- (uint64_t)semanticVotes
{
  return *(_QWORD *)(a1 + 80);
}

- (uint64_t)colors
{
  return *(_QWORD *)(a1 + 8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  OUPointCloud *v4;
  char *v5;

  v4 = objc_alloc_init(OUPointCloud);
  v5 = (char *)v4;
  if (v4 != self)
  {
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l((char *)v4->_anon_8, *(char **)self->_anon_8, *(_QWORD *)&self->_anon_8[8], (uint64_t)(*(_QWORD *)&self->_anon_8[8] - *(_QWORD *)self->_anon_8) >> 4);
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(v5 + 32, *(char **)&self->_anon_8[24], *(_QWORD *)&self->_anon_8[32], (uint64_t)(*(_QWORD *)&self->_anon_8[32] - *(_QWORD *)&self->_anon_8[24]) >> 4);
    std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>(v5 + 56, *(char **)&self->_anon_8[48], *(_QWORD *)&self->_anon_8[56], (uint64_t)(*(_QWORD *)&self->_anon_8[56] - *(_QWORD *)&self->_anon_8[48]) >> 2);
    _ZNSt3__16vectorIDv4_tNS_9allocatorIS1_EEE18__assign_with_sizeB8ne180100IPS1_S6_EEvT_T0_l(v5 + 80, *(char **)&self->_anon_8[72], *(_QWORD *)&self->_anon_8[80], (uint64_t)(*(_QWORD *)&self->_anon_8[80] - *(_QWORD *)&self->_anon_8[72]) >> 3);
  }
  return v5;
}

- (OUPointCloud)initWithDictionary:(id)a3
{
  id v4;
  OUPointCloud *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  char *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  void *v51;
  OUPointCloud *v52;
  void *__p;
  _BYTE *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v4 = a3;
  v5 = -[OUPointCloud init](self, "init");
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("colors"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;

  v10 = objc_retainAutorelease(v9);
  v11 = (char *)objc_msgSend(v10, "bytes");
  v12 = objc_msgSend(v10, "length");
  __p = 0;
  v55 = 0;
  v56 = 0;
  std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&__p, v11, (uint64_t)&v11[v12 & 0xFFFFFFFFFFFFFFFCLL], v12 >> 2);

  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&v57, ((v55 - (_BYTE *)__p) >> 2) / 3uLL);
  v13 = v57;
  v14 = v58;
  if (v58 == v57)
  {
    v13 = v58;
  }
  else
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    do
    {
      v18 = v13 + v15;
      v19 = *(_QWORD *)((char *)__p + v16);
      *(_DWORD *)(v18 + 8) = *(_DWORD *)((char *)__p + v16 + 8);
      *(_QWORD *)v18 = v19;
      ++v17;
      v13 = v57;
      v14 = v58;
      v16 += 12;
      v15 += 16;
    }
    while (v17 < (v58 - v57) >> 4);
  }
  v20 = *(void **)v5->_anon_8;
  if (v20)
  {
    *(_QWORD *)&v5->_anon_8[8] = v20;
    operator delete(v20);
    *(_QWORD *)v5->_anon_8 = 0;
    *(_QWORD *)&v5->_anon_8[8] = 0;
    *(_QWORD *)&v5->_anon_8[16] = 0;
    v13 = v57;
    v14 = v58;
  }
  *(_QWORD *)v5->_anon_8 = v13;
  *(_QWORD *)&v5->_anon_8[8] = v14;
  *(_QWORD *)&v5->_anon_8[16] = v59;
  v57 = 0;
  v58 = 0;
  v59 = 0;
  if (__p)
  {
    v55 = __p;
    operator delete(__p);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("points"));
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;

  v23 = objc_retainAutorelease(v22);
  v24 = (char *)objc_msgSend(v23, "bytes");
  v25 = objc_msgSend(v23, "length");
  __p = 0;
  v55 = 0;
  v56 = 0;
  std::vector<float>::__assign_with_size[abi:ne180100]<float *,float *>((char *)&__p, v24, (uint64_t)&v24[v25 & 0xFFFFFFFFFFFFFFFCLL], v25 >> 2);

  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEEC2Em(&v57, ((v55 - (_BYTE *)__p) >> 2) / 3uLL);
  v26 = v57;
  v27 = v58;
  if (v58 == v57)
  {
    v26 = v58;
  }
  else
  {
    v28 = 0;
    v29 = 0;
    v30 = 0;
    do
    {
      v31 = v26 + v28;
      v32 = *(_QWORD *)((char *)__p + v29);
      *(_DWORD *)(v31 + 8) = *(_DWORD *)((char *)__p + v29 + 8);
      *(_QWORD *)v31 = v32;
      ++v30;
      v26 = v57;
      v27 = v58;
      v29 += 12;
      v28 += 16;
    }
    while (v30 < (v58 - v57) >> 4);
  }
  v33 = *(void **)&v5->_anon_8[24];
  if (v33)
  {
    *(_QWORD *)&v5->_anon_8[32] = v33;
    operator delete(v33);
    *(_QWORD *)&v5->_anon_8[24] = 0;
    *(_QWORD *)&v5->_anon_8[32] = 0;
    *(_QWORD *)&v5->_anon_8[40] = 0;
    v26 = v57;
    v27 = v58;
  }
  *(_QWORD *)&v5->_anon_8[24] = v26;
  *(_QWORD *)&v5->_anon_8[32] = v27;
  *(_QWORD *)&v5->_anon_8[40] = v59;
  v58 = 0;
  v59 = 0;
  v57 = 0;
  if (__p)
  {
    v55 = __p;
    operator delete(__p);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticLabels"));
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v35 = v34;
  else
    v35 = 0;

  v36 = objc_retainAutorelease(v35);
  v37 = (char *)objc_msgSend(v36, "bytes");
  v38 = objc_msgSend(v36, "length");
  __p = 0;
  v55 = 0;
  v56 = 0;
  std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(&__p, v37, &v37[v38], v38);

  _ZNSt3__16vectorIDv4_hNS_9allocatorIS1_EEEC2Em(&v57, (unint64_t)(v55 - (_BYTE *)__p) >> 2);
  v39 = v57;
  v40 = v58;
  if (v58 == v57)
  {
    v39 = v58;
  }
  else
  {
    v41 = 0;
    do
    {
      *(_DWORD *)(v39 + 4 * v41) = *((_DWORD *)__p + v41);
      ++v41;
      v39 = v57;
      v40 = v58;
    }
    while (v41 < (v58 - v57) >> 2);
  }
  v42 = *(void **)&v5->_anon_8[48];
  if (v42)
  {
    *(_QWORD *)&v5->_anon_8[56] = v42;
    operator delete(v42);
    *(_QWORD *)&v5->_anon_8[48] = 0;
    *(_QWORD *)&v5->_anon_8[56] = 0;
    *(_QWORD *)&v5->_anon_8[64] = 0;
    v39 = v57;
    v40 = v58;
  }
  *(_QWORD *)&v5->_anon_8[48] = v39;
  *(_QWORD *)&v5->_anon_8[56] = v40;
  *(_QWORD *)&v5->_anon_8[64] = v59;
  v58 = 0;
  v59 = 0;
  v57 = 0;
  if (__p)
  {
    v55 = __p;
    operator delete(__p);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("semanticVotes"));
  v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v44 = v43;
  else
    v44 = 0;

  v45 = objc_retainAutorelease(v44);
  v46 = (char *)objc_msgSend(v45, "bytes");
  v47 = objc_msgSend(v45, "length");
  __p = 0;
  v55 = 0;
  v56 = 0;
  std::vector<unsigned short>::__assign_with_size[abi:ne180100]<unsigned short const*,unsigned short const*>((char *)&__p, v46, (uint64_t)&v46[v47 & 0xFFFFFFFFFFFFFFFELL], v47 >> 1);

  _ZNSt3__16vectorIDv4_tNS_9allocatorIS1_EEEC2Em(&v57, (unint64_t)((v55 - (_BYTE *)__p) >> 1) >> 2);
  v48 = v57;
  v49 = v58;
  if (v58 == v57)
  {
    v48 = v58;
  }
  else
  {
    v50 = 0;
    do
    {
      *(_QWORD *)(v48 + 8 * v50) = *((_QWORD *)__p + v50);
      ++v50;
      v48 = v57;
      v49 = v58;
    }
    while (v50 < (v58 - v57) >> 3);
  }
  v51 = *(void **)&v5->_anon_8[72];
  if (v51)
  {
    *(_QWORD *)&v5->_anon_8[80] = v51;
    operator delete(v51);
    *(_QWORD *)&v5->_anon_8[72] = 0;
    *(_QWORD *)&v5->_anon_8[80] = 0;
    *(_QWORD *)&v5->_anon_8[88] = 0;
    v48 = v57;
    v49 = v58;
  }
  *(_QWORD *)&v5->_anon_8[72] = v48;
  *(_QWORD *)&v5->_anon_8[80] = v49;
  *(_QWORD *)&v5->_anon_8[88] = v59;
  v58 = 0;
  v59 = 0;
  v57 = 0;
  if (__p)
  {
    v55 = __p;
    operator delete(__p);
  }
  if (OUPointCloudCpp::IsValid((OUPointCloudCpp *)v5->_anon_8)
    && v7 == (uint64_t)(*(_QWORD *)&v5->_anon_8[8] - *(_QWORD *)v5->_anon_8) >> 4)
  {
    v52 = v5;
  }
  else
  {
    v52 = 0;
  }

  return v52;
}

- (OUPointCloud)initWithCount:(unint64_t)a3 points:semanticLabels:semanticVotes:
{
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  id v10;
  objc_super v12;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  v12.receiver = self;
  v12.super_class = (Class)OUPointCloud;
  v10 = -[OUPointCloud init](&v12, sel_init);
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v10 + 8, a3);
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v10 + 32, a3);
  _ZNSt3__16vectorIDv4_hNS_9allocatorIS1_EEE6resizeEm((uint64_t)v10 + 56, a3);
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v10 + 80, a3);
  memcpy(*((void **)v10 + 4), v8, 16 * a3);
  memcpy(*((void **)v10 + 7), v7, 4 * a3);
  memcpy(*((void **)v10 + 10), v6, 8 * a3);
  return (OUPointCloud *)v10;
}

- (OUPointCloud)initWithCount:(unint64_t)a3 points:semanticLabels:semanticVotes:colors:
{
  const void *v3;
  const void *v4;
  OUPointCloud *v6;

  v4 = v3;
  v6 = -[OUPointCloud initWithCount:points:semanticLabels:semanticVotes:](self, "initWithCount:points:semanticLabels:semanticVotes:");
  memcpy(*(void **)v6->_anon_8, v4, 16 * a3);
  return v6;
}

- (void)append:(unint64_t)a3 points:semanticLabels:semanticVotes:
{
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  unint64_t v11;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  v11 = -[OUPointCloud count](self, "count");
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)self->_anon_8, v11 + a3);
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)&self->_anon_8[24], v11 + a3);
  _ZNSt3__16vectorIDv4_hNS_9allocatorIS1_EEE6resizeEm((uint64_t)&self->_anon_8[48], v11 + a3);
  _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)&self->_anon_8[72], v11 + a3);
  memcpy((void *)(*(_QWORD *)&self->_anon_8[24] + 16 * v11), v8, 16 * a3);
  memcpy((void *)(*(_QWORD *)&self->_anon_8[48] + 4 * v11), v7, 4 * a3);
  memcpy((void *)(*(_QWORD *)&self->_anon_8[72] + 8 * v11), v6, 8 * a3);
}

- (void)append:(unint64_t)a3 points:semanticLabels:semanticVotes:colors:
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v13;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  v13 = -[OUPointCloud count](self, "count");
  -[OUPointCloud append:points:semanticLabels:semanticVotes:](self, "append:points:semanticLabels:semanticVotes:", a3, v10, v9, v8);
  memcpy((void *)(*(_QWORD *)self->_anon_8 + 16 * v13), v7, 16 * a3);
}

- (void)resample:(unint64_t)a3
{
  utils *v5;
  unsigned __int8 *anon_8;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  uint64_t v16;
  uint64_t v17;
  void *__p;
  _BYTE *v19;

  v5 = -[OUPointCloud count](self, "count");
  if (a3 && (unint64_t)v5 > a3)
  {
    utils::Resample(v5, a3, &__p);
    anon_8 = self->_anon_8;
    v7 = v19 - (_BYTE *)__p;
    if ((int)((unint64_t)(v19 - (_BYTE *)__p) >> 3) >= 1)
    {
      v8 = 0;
      do
      {
        *(_OWORD *)(*(_QWORD *)anon_8 + 16 * v8) = *(_OWORD *)(*(_QWORD *)anon_8 + 16 * *((_QWORD *)__p + v8));
        ++v8;
      }
      while (((unint64_t)v7 >> 3) != v8);
    }
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)anon_8, (int)(v7 >> 3));
    v9 = &self->_anon_8[24];
    v10 = v19 - (_BYTE *)__p;
    if ((int)((unint64_t)(v19 - (_BYTE *)__p) >> 3) >= 1)
    {
      v11 = 0;
      do
      {
        *(_OWORD *)(*(_QWORD *)v9 + 16 * v11) = *(_OWORD *)(*(_QWORD *)v9 + 16 * *((_QWORD *)__p + v11));
        ++v11;
      }
      while (((unint64_t)v10 >> 3) != v11);
    }
    _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v9, (int)(v10 >> 3));
    v12 = &self->_anon_8[48];
    v13 = v19 - (_BYTE *)__p;
    if ((int)((unint64_t)(v19 - (_BYTE *)__p) >> 3) >= 1)
    {
      v14 = 0;
      do
      {
        *(_DWORD *)(*(_QWORD *)v12 + 4 * v14) = *(_DWORD *)(*(_QWORD *)v12 + 4 * *((_QWORD *)__p + v14));
        ++v14;
      }
      while (((unint64_t)v13 >> 3) != v14);
    }
    _ZNSt3__16vectorIDv4_hNS_9allocatorIS1_EEE6resizeEm((uint64_t)v12, (int)(v13 >> 3));
    v15 = &self->_anon_8[72];
    v16 = v19 - (_BYTE *)__p;
    if ((int)((unint64_t)(v19 - (_BYTE *)__p) >> 3) >= 1)
    {
      v17 = 0;
      do
      {
        *(_QWORD *)(*(_QWORD *)v15 + v17) = *(_QWORD *)(*(_QWORD *)v15 + 8 * *(_QWORD *)((char *)__p + v17));
        v17 += 8;
      }
      while ((v16 & 0x7FFFFFFF8) != v17);
    }
    _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)v15, (int)(v16 >> 3));
    if (__p)
    {
      v19 = __p;
      operator delete(__p);
    }
  }
}

- (void)reset
{
  *(_QWORD *)&self->_anon_8[8] = *(_QWORD *)self->_anon_8;
  *(_QWORD *)&self->_anon_8[32] = *(_QWORD *)&self->_anon_8[24];
  *(_QWORD *)&self->_anon_8[56] = *(_QWORD *)&self->_anon_8[48];
  *(_QWORD *)&self->_anon_8[80] = *(_QWORD *)&self->_anon_8[72];
}

- (const)getCpp
{
  return self->_anon_8;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&self->pointRangeOfKeyframes);
  v3 = *(void **)&self->_anon_8[72];
  if (v3)
  {
    *(_QWORD *)&self->_anon_8[80] = v3;
    operator delete(v3);
  }
  v4 = *(void **)&self->_anon_8[48];
  if (v4)
  {
    *(_QWORD *)&self->_anon_8[56] = v4;
    operator delete(v4);
  }
  v5 = *(void **)&self->_anon_8[24];
  if (v5)
  {
    *(_QWORD *)&self->_anon_8[32] = v5;
    operator delete(v5);
  }
  v6 = *(void **)self->_anon_8;
  if (v6)
  {
    *(_QWORD *)&self->_anon_8[8] = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_DWORD *)self + 34) = 1065353216;
  return self;
}

@end
