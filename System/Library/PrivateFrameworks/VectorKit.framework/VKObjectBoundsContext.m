@implementation VKObjectBoundsContext

- (void)addPoints:(const void *)a3
{
  __int128 *v3;
  __int128 *v4;
  uint64_t v5;
  uint64_t v7;
  _BYTE *begin;
  __int128 *end;
  unint64_t v10;
  uint64_t v11;
  __int128 *v12;
  _BYTE *value;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  __int128 *v19;
  __int128 *v20;
  _OWORD *v21;
  __int128 v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  __int128 v27;
  uint64_t v28;
  char *i;
  __int128 v30;
  void *v31;
  char *v32;
  __int128 *v33;
  _OWORD *v34;
  __int128 *v35;
  __int128 v36;
  int64_t v37;
  unint64_t v38;
  _OWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 *v45;
  _OWORD *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  const double *v53;
  double *v54;
  uint64_t v55;
  const double *v56;
  double *v57;
  float64x2x2_t v58;
  float64x2x2_t v59;

  v4 = *(__int128 **)a3;
  v3 = (__int128 *)*((_QWORD *)a3 + 1);
  v5 = (uint64_t)v3 - *(_QWORD *)a3;
  if (v5 < 1)
    return;
  v7 = v5 >> 4;
  begin = self->_points.__begin_;
  end = (__int128 *)self->_points.__end_;
  v10 = (char *)end - begin;
  v11 = ((char *)end - begin) >> 4;
  v12 = (__int128 *)&begin[((char *)end - begin) & 0xFFFFFFFFFFFFFFF0];
  value = self->_points.__end_cap_.__value_;
  if (v7 <= (value - (_BYTE *)end) >> 4)
  {
    v18 = end - v12;
    if (v18 >= v7)
    {
      v19 = &v4[v7];
      v21 = self->_points.__end_;
    }
    else
    {
      v19 = &v4[v18];
      if (v19 == v3)
      {
        v21 = self->_points.__end_;
      }
      else
      {
        v20 = v19;
        v21 = self->_points.__end_;
        do
        {
          v22 = *v20++;
          *v21++ = v22;
        }
        while (v20 != v3);
      }
      self->_points.__end_ = v21;
      if ((char *)end - (char *)v12 < 1)
        return;
    }
    v32 = (char *)&v12[v7];
    v33 = &v21[-v7];
    v34 = v21;
    if (v33 < end)
    {
      v35 = &v21[-v7];
      v34 = v21;
      do
      {
        v36 = *v35++;
        *v34++ = v36;
      }
      while (v35 < end);
    }
    self->_points.__end_ = v34;
    if (v21 != (_OWORD *)v32)
    {
      v37 = (char *)v21 - v32;
      v38 = (char *)v21 - v32 - 16;
      if (v38 < 0xD0
        || (_OWORD *)((char *)v21 - (v37 & 0xFFFFFFFFFFFFFFF0)) < v33
        && &begin[v37 + (v10 & 0xFFFFFFFFFFFFFFF0) - (v37 & 0xFFFFFFFFFFFFFFF0)] < (_BYTE *)v21)
      {
        v39 = v21;
        goto LABEL_39;
      }
      v52 = (v38 >> 4) + 1;
      v39 = &v21[-(v52 & 0x1FFFFFFFFFFFFFFCLL)];
      v53 = (const double *)(v33 - 2);
      v54 = (double *)(v21 - 2);
      v55 = v52 & 0x1FFFFFFFFFFFFFFCLL;
      do
      {
        v58 = vld2q_f64(v53);
        v56 = v53 - 4;
        v59 = vld2q_f64(v56);
        vst2q_f64(v54, v58);
        v57 = v54 - 4;
        vst2q_f64(v57, v59);
        v54 -= 8;
        v53 -= 8;
        v55 -= 4;
      }
      while (v55);
      if (v52 != (v52 & 0x1FFFFFFFFFFFFFFCLL))
      {
        v33 -= v52 & 0x1FFFFFFFFFFFFFFCLL;
LABEL_39:
        v40 = (_QWORD *)v39 - 1;
        do
        {
          v41 = *((_QWORD *)v33-- - 2);
          *(v40 - 1) = v41;
          *v40 = *((_QWORD *)v33 + 1);
          v40 -= 2;
        }
        while (v33 != v12);
      }
    }
    if (v19 == v4)
      return;
    v42 = (char *)v19 - (char *)v4 - 16;
    if (v42 >= 0xD0
      && (v12 >= (__int128 *)((char *)v4 + (v42 & 0xFFFFFFFFFFFFFFF0) + 16)
       || &begin[(v10 & 0xFFFFFFFFFFFFFFF0) + 16 + (v42 & 0xFFFFFFFFFFFFFFF0)] <= (_BYTE *)v4))
    {
      v43 = (v42 >> 4) + 1;
      v44 = 16 * (v43 & 0x1FFFFFFFFFFFFFFCLL);
      v12 = (__int128 *)((char *)v12 + v44);
      v45 = v4 + 2;
      v46 = &begin[16 * v11 + 32];
      v47 = v43 & 0x1FFFFFFFFFFFFFFCLL;
      do
      {
        v49 = *(v45 - 2);
        v48 = *(v45 - 1);
        v51 = *v45;
        v50 = v45[1];
        v45 += 4;
        *(v46 - 2) = v49;
        *(v46 - 1) = v48;
        *v46 = v51;
        v46[1] = v50;
        v46 += 4;
        v47 -= 4;
      }
      while (v47);
      if (v43 == (v43 & 0x1FFFFFFFFFFFFFFCLL))
        return;
      v4 = (__int128 *)((char *)v4 + v44);
    }
    do
    {
      *(_QWORD *)v12 = *(_QWORD *)v4;
      *((_QWORD *)v12++ + 1) = *((_QWORD *)v4++ + 1);
    }
    while (v4 != v19);
    return;
  }
  v14 = v11 + v7;
  if ((unint64_t)(v11 + v7) >> 60)
    abort();
  v15 = value - begin;
  if (v15 >> 3 > v14)
    v14 = v15 >> 3;
  if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0)
    v16 = 0xFFFFFFFFFFFFFFFLL;
  else
    v16 = v14;
  if (v16)
  {
    if (v16 >> 60)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v17 = (char *)operator new(16 * v16);
  }
  else
  {
    v17 = 0;
  }
  v23 = &v17[16 * v11];
  v24 = 16 * v7;
  v25 = &v23[16 * v7];
  v26 = v23;
  do
  {
    v27 = *v4++;
    *(_OWORD *)v26 = v27;
    v26 += 16;
    v24 -= 16;
  }
  while (v24);
  if (v10 >= 0x10)
  {
    v28 = 16 * v11;
    do
    {
      *(_OWORD *)&v17[v28 - 16] = *(_OWORD *)&begin[v28 - 16];
      v28 -= 16;
    }
    while (v28);
    v23 = v17;
    end = (__int128 *)self->_points.__end_;
  }
  for (i = &v17[16 * v16]; v12 != end; v25 += 16)
  {
    v30 = *v12++;
    *(_OWORD *)v25 = v30;
  }
  v31 = self->_points.__begin_;
  self->_points.__begin_ = v23;
  self->_points.__end_ = v25;
  self->_points.__end_cap_.__value_ = i;
  if (v31)
    operator delete(v31);
}

- (BOOL)isEmpty
{
  return self->_points.__begin_ == self->_points.__end_;
}

- ($47F18235E17FF75F5C17F39635350F8F)boundingRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD *begin;
  _BYTE *end;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  float64x2_t v15;
  float64x2_t v16;
  const double *v17;
  uint64_t v18;
  float64x2_t v19;
  float64x2_t v20;
  float64x2_t v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  const double *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  float64x2x2_t v30;
  float64x2x2_t v31;
  $47F18235E17FF75F5C17F39635350F8F result;

  if (!-[VKObjectBoundsContext isEmpty](self, "isEmpty"))
  {
    begin = self->_points.__begin_;
    end = self->_points.__end_;
    if (begin == (_QWORD *)end)
    {
      v12 = 1.79769313e308;
      v13 = -1.79769313e308;
      v10 = 1.79769313e308;
      v11 = -1.79769313e308;
    }
    else
    {
      v9 = end - (_BYTE *)begin - 16;
      if (v9 > 0x2F)
      {
        v14 = (v9 >> 4) + 1;
        v15 = (float64x2_t)vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
        v16 = (float64x2_t)vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
        v17 = (const double *)(begin + 4);
        v18 = v14 & 0x1FFFFFFFFFFFFFFCLL;
        v19 = v16;
        v20 = v15;
        v21 = v15;
        v22 = v15;
        v23 = v16;
        v24 = v16;
        do
        {
          v25 = v17 - 4;
          v30 = vld2q_f64(v25);
          v31 = vld2q_f64(v17);
          v15 = vminnmq_f64(v30.val[0], v15);
          v20 = vminnmq_f64(v31.val[0], v20);
          v23 = vmaxnmq_f64(v23, v30.val[0]);
          v24 = vmaxnmq_f64(v24, v31.val[0]);
          v21 = vminnmq_f64(v30.val[1], v21);
          v22 = vminnmq_f64(v31.val[1], v22);
          v16 = vmaxnmq_f64(v16, v30.val[1]);
          v19 = vmaxnmq_f64(v19, v31.val[1]);
          v17 += 8;
          v18 -= 4;
        }
        while (v18);
        v13 = vmaxnmvq_f64(vmaxnmq_f64(v23, v24));
        v12 = vminnmvq_f64(vminnmq_f64(v21, v22));
        v10 = vminnmvq_f64(vminnmq_f64(v15, v20));
        v11 = vmaxnmvq_f64(vmaxnmq_f64(v16, v19));
        if (v14 == (v14 & 0x1FFFFFFFFFFFFFFCLL))
          goto LABEL_12;
        begin += 2 * (v14 & 0x1FFFFFFFFFFFFFFCLL);
      }
      else
      {
        v10 = 1.79769313e308;
        v11 = -1.79769313e308;
        v12 = 1.79769313e308;
        v13 = -1.79769313e308;
      }
      do
      {
        v26 = *(double *)begin;
        v27 = *((double *)begin + 1);
        begin += 2;
        v10 = fmin(v26, v10);
        v13 = fmax(v13, v26);
        v12 = fmin(v27, v12);
        v11 = fmax(v11, v27);
      }
      while (begin != (_QWORD *)end);
    }
LABEL_12:
    v28 = *(double *)(MEMORY[0x1E0D266E8] + 16);
    v29 = *(double *)(MEMORY[0x1E0D266E8] + 24);
    v3 = v28 * v10;
    v4 = v29 - v11 * v29;
    v5 = v28 * (v13 - v10);
    v6 = v29 * (v11 - v12);
    goto LABEL_13;
  }
  v3 = *MEMORY[0x1E0D266D8];
  v4 = *(double *)(MEMORY[0x1E0D266D8] + 8);
  v5 = *(double *)(MEMORY[0x1E0D266D8] + 16);
  v6 = *(double *)(MEMORY[0x1E0D266D8] + 24);
LABEL_13:
  result.var1.var1 = v6;
  result.var1.var0 = v5;
  result.var0.var1 = v4;
  result.var0.var0 = v3;
  return result;
}

- (VKEdgeInsets)edgePadding
{
  float top;
  float left;
  float bottom;
  float right;
  VKEdgeInsets result;

  top = self->_edgePadding.top;
  left = self->_edgePadding.left;
  bottom = self->_edgePadding.bottom;
  right = self->_edgePadding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEdgePadding:(VKEdgeInsets)a3
{
  self->_edgePadding = a3;
}

- (void).cxx_destruct
{
  void *begin;

  begin = self->_points.__begin_;
  if (begin)
  {
    self->_points.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
