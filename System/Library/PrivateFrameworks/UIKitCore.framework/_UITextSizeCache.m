@implementation _UITextSizeCache

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (void)removeAllSizes
{
  self->_cache.__end_ = self->_cache.__begin_;
}

- (BOOL)getSize:(CGSize *)a3 baselineInfo:(id *)a4 forTargetSize:(CGSize)a5 isMultiline:(BOOL)a6
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  $00731F7035C2E13BA23DAA730FFC2B6B v14;

  if (fabs(a5.width) < 0.001)
    a5.width = 3.40282347e38;
  if (fabs(a5.height) < 0.001)
    a5.height = 3.40282347e38;
  begin = self->_cache.__begin_;
  end = self->_cache.__end_;
  if (begin == end)
    return 0;
  while (1)
  {
    v8 = *(double *)begin;
    if (vabdd_f64(*(double *)begin, a5.width) < 0.001
      || (v8 - a5.width < -0.001 ? (v9 = a6) : (v9 = 0),
          !v9 && (v10 = *((double *)begin + 2), v10 - v8 < -0.001) && v10 - a5.width < 0.001))
    {
      v11 = *((double *)begin + 1);
      if (vabdd_f64(v11, a5.height) < 0.001)
        break;
      v12 = *((double *)begin + 3);
      if (v12 - v11 < -0.001 && v12 - a5.height < 0.001)
        break;
    }
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 120);
    if (begin == end)
      return 0;
  }
  v14.var2.size = (CGSize)*((_OWORD *)begin + 4);
  *(_OWORD *)&v14.var3 = *((_OWORD *)begin + 5);
  *(_OWORD *)&v14.var4.origin.y = *((_OWORD *)begin + 6);
  v14.var4.size.height = *((CGFloat *)begin + 14);
  *(_OWORD *)&v14.var0 = *((_OWORD *)begin + 2);
  v14.var2.origin = (CGPoint)*((_OWORD *)begin + 3);
  *a3 = *((CGSize *)begin + 1);
  if (a4)
    *a4 = v14;
  return 1;
}

- (void)addSize:(CGSize)a3 baselineInfo:(id *)a4 forTargetSize:(CGSize)a5
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  __int128 v8;
  CGPoint origin;
  uint64_t v10;
  unint64_t v11;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v12;
  unint64_t v13;
  double *v14;
  double v15;
  uint64_t v16;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v19;
  char *v20;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  CGSize *v28;
  CGSize v29;
  CGSize v30;
  CGSize v31;
  CGSize v32;
  CGSize v33;
  CGSize v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  CGSize v40;
  CGSize v41;
  CGPoint v42;
  CGSize v43;
  __int128 v44;
  __int128 v45;
  char *v46;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  CGSize v52;
  CGSize v53;
  CGPoint v54;
  CGSize v55;
  __int128 v56;
  __int128 v57;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v58;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v59;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v60;
  char *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v68;
  int64_t v69;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v70;
  CGSize v71;
  CGSize v72;
  __int128 v73;
  CGPoint v74;
  CGSize size;
  __int128 v76;
  __int128 v77;
  CGFloat height;

  begin = self->_cache.__begin_;
  end = self->_cache.__end_;
  if (0xEEEEEEEEEEEEEEEFLL * ((end - begin) >> 3) >= 7)
  {
    self->_cache.__end_ = begin;
    end = begin;
  }
  if (fabs(a5.width) < 0.001)
    a5.width = 3.40282347e38;
  if (fabs(a5.height) < 0.001)
    a5.height = 3.40282347e38;
  v71 = a5;
  v72 = a3;
  if (a4)
  {
    v8 = *(_OWORD *)&a4->var3;
    size = a4->var2.size;
    v76 = v8;
    v77 = *(_OWORD *)&a4->var4.origin.y;
    height = a4->var4.size.height;
    origin = a4->var2.origin;
    v73 = *(_OWORD *)&a4->var0;
    v74 = origin;
  }
  else
  {
    height = 0.0;
    v76 = 0u;
    v77 = 0u;
    v74 = (CGPoint)0;
    size = (CGSize)0;
    v73 = 0u;
  }
  v10 = end - begin;
  if (end == begin)
  {
    v12 = begin;
  }
  else
  {
    v11 = 0xEEEEEEEEEEEEEEEFLL * (v10 >> 3);
    v12 = begin;
    do
    {
      v13 = v11 >> 1;
      v14 = (double *)((char *)v12 + 120 * (v11 >> 1));
      v15 = *v14 - a5.width;
      if (v15 < -0.001 || fabs(v15) < 0.001 && v14[1] - a5.height < -0.001)
      {
        v12 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v14 + 15);
        v13 = v11 + ~v13;
      }
      v11 = v13;
    }
    while (v13);
  }
  v16 = (v12 - begin) / 120;
  v17 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 120 * v16);
  value = self->_cache.__end_cap_.__value_;
  if (end >= value)
  {
    v35 = 0xEEEEEEEEEEEEEEEFLL * (v10 >> 3) + 1;
    if (v35 > 0x222222222222222)
      abort();
    v36 = 0xEEEEEEEEEEEEEEEFLL * ((value - begin) >> 3);
    if (2 * v36 > v35)
      v35 = 2 * v36;
    if (v36 >= 0x111111111111111)
      v37 = 0x222222222222222;
    else
      v37 = v35;
    if (v37)
    {
      v39 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<ui_size_cache_value>>(v37);
    }
    else
    {
      v39 = 0;
      v38 = 0;
    }
    v46 = &v39[120 * v16];
    v47 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v39[120 * v38];
    if (v16 == v38)
    {
      if (v12 - begin < 1)
      {
        if (begin == v12)
          v49 = 1;
        else
          v49 = 2 * v16;
        v50 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<ui_size_cache_value>>(v49);
        v46 = &v50[120 * (v49 >> 2)];
        v47 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v50[120 * v51];
        if (v39)
          operator delete(v39);
      }
      else
      {
        v48 = v16 + 2;
        if (v16 >= -1)
          v48 = v16 + 1;
        v46 -= 120 * (v48 >> 1);
      }
    }
    v52 = v71;
    v53 = v72;
    v54 = v74;
    *((_OWORD *)v46 + 2) = v73;
    *((CGPoint *)v46 + 3) = v54;
    *(CGSize *)v46 = v52;
    *((CGSize *)v46 + 1) = v53;
    v55 = size;
    v56 = v76;
    v57 = v77;
    *((CGFloat *)v46 + 14) = height;
    *((_OWORD *)v46 + 5) = v56;
    *((_OWORD *)v46 + 6) = v57;
    *((CGSize *)v46 + 4) = v55;
    v58 = self->_cache.__begin_;
    v59 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v46;
    if (v58 != v17)
    {
      v60 = v17;
      v61 = v46;
      do
      {
        v62 = *(_OWORD *)((char *)v60 - 120);
        v63 = *(_OWORD *)((char *)v60 - 104);
        v64 = *(_OWORD *)((char *)v60 - 88);
        *(_OWORD *)(v61 - 72) = *(_OWORD *)((char *)v60 - 72);
        *(_OWORD *)(v61 - 88) = v64;
        *(_OWORD *)(v61 - 104) = v63;
        *(_OWORD *)(v61 - 120) = v62;
        v65 = *(_OWORD *)((char *)v60 - 56);
        v66 = *(_OWORD *)((char *)v60 - 40);
        v67 = *(_OWORD *)((char *)v60 - 24);
        v59 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v61 - 120);
        *((_QWORD *)v61 - 1) = *((_QWORD *)v60 - 1);
        *(_OWORD *)(v61 - 24) = v67;
        *(_OWORD *)(v61 - 40) = v66;
        *(_OWORD *)(v61 - 56) = v65;
        v60 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v60 - 120);
        v61 -= 120;
      }
      while (v60 != v58);
    }
    v68 = self->_cache.__end_;
    v69 = v68 - v17;
    if (v68 != v17)
      memmove(v46 + 120, v17, v68 - v17);
    v70 = self->_cache.__begin_;
    self->_cache.__begin_ = v59;
    self->_cache.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v46[v69 + 120];
    self->_cache.__end_cap_.__value_ = v47;
    if (v70)
      operator delete(v70);
  }
  else if (v17 == end)
  {
    v40 = v71;
    v41 = v72;
    v42 = v74;
    *((_OWORD *)end + 2) = v73;
    *((CGPoint *)end + 3) = v42;
    *(CGSize *)end = v40;
    *((CGSize *)end + 1) = v41;
    v43 = size;
    v44 = v76;
    v45 = v77;
    *((CGFloat *)end + 14) = height;
    *((_OWORD *)end + 5) = v44;
    *((_OWORD *)end + 6) = v45;
    *((CGSize *)end + 4) = v43;
    self->_cache.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 120);
  }
  else
  {
    v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v17 + 120);
    v20 = (char *)end - 120;
    v21 = end;
    if ((unint64_t)end >= 0x78)
    {
      v21 = end;
      do
      {
        v22 = *(_OWORD *)v20;
        v23 = *((_OWORD *)v20 + 1);
        v24 = *((_OWORD *)v20 + 3);
        *((_OWORD *)v21 + 2) = *((_OWORD *)v20 + 2);
        *((_OWORD *)v21 + 3) = v24;
        *(_OWORD *)v21 = v22;
        *((_OWORD *)v21 + 1) = v23;
        v25 = *((_OWORD *)v20 + 4);
        v26 = *((_OWORD *)v20 + 5);
        v27 = *((_OWORD *)v20 + 6);
        *((_QWORD *)v21 + 14) = *((_QWORD *)v20 + 14);
        *((_OWORD *)v21 + 5) = v26;
        *((_OWORD *)v21 + 6) = v27;
        *((_OWORD *)v21 + 4) = v25;
        v20 += 120;
        v21 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v21 + 120);
      }
      while (v20 < (char *)end);
    }
    self->_cache.__end_ = v21;
    if (end != v19)
      memmove((char *)v17 + 120, (char *)begin + 120 * v16, end - v19);
    v28 = &v71;
    if (v17 <= ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v71)
      v28 = (CGSize *)((char *)&v71 + 120 * (self->_cache.__end_ > ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v71));
    v29 = *v28;
    v30 = v28[1];
    v31 = v28[3];
    *((CGSize *)v17 + 2) = v28[2];
    *((CGSize *)v17 + 3) = v31;
    *(CGSize *)v17 = v29;
    *((CGSize *)v17 + 1) = v30;
    v32 = v28[4];
    v33 = v28[5];
    v34 = v28[6];
    *((_QWORD *)v17 + 14) = *(_QWORD *)&v28[7].width;
    *((CGSize *)v17 + 5) = v33;
    *((CGSize *)v17 + 6) = v34;
    *((CGSize *)v17 + 4) = v32;
  }
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

  begin = self->_cache.__begin_;
  if (begin)
  {
    self->_cache.__end_ = begin;
    operator delete(begin);
  }
}

- (id)description
{
  void *v3;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0xEEEEEEEEEEEEEEEFLL * ((self->_cache.__end_ - self->_cache.__begin_) >> 3));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  begin = self->_cache.__begin_;
  for (i = self->_cache.__end_; begin != i; begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 120))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromCGSize(*(CGSize *)begin);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromCGSize(*((CGSize *)begin + 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ : %@"), v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  v10 = (void *)MEMORY[0x1E0CB37A0];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = self->_cache.__begin_;
  end = self->_cache.__end_;
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@ %p: [%lu] { %@ }>"), v12, self, 0xEEEEEEEEEEEEEEEFLL * ((end - v14) >> 3), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
