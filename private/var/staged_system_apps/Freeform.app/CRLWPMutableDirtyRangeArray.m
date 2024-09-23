@implementation CRLWPMutableDirtyRangeArray

- (void)clear
{
  self->super._rangeVector.__end_ = self->super._rangeVector.__begin_;
}

- (void)addRange:(id *)a3 allowEmpty:(BOOL)a4
{
  char *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  NSUInteger location;
  NSUInteger length;
  unint64_t v10;
  NSRange *v11;
  unint64_t v12;
  NSUInteger *v13;
  NSRange *v14;
  NSUInteger v15;
  unint64_t v16;
  char *v17;
  unint64_t v18;
  NSUInteger *v19;
  char *v20;
  NSUInteger v21;
  int v22;
  __compressed_pair<CRLWPDirtyRange *, std::allocator<CRLWPDirtyRange>> *p_end_cap;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  _NSRange v25;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v26;
  NSRange v27;
  int64_t v28;
  NSRange v29;
  int64_t v30;
  uint64_t v32;
  uint64_t v33;
  NSRange *v34;
  BOOL v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v41;
  _NSRange var0;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v43;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v44;
  __int128 v45;
  NSRange v46;
  int64_t v47;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v48;
  size_t v49;
  NSRange *v50;
  NSRange *v51;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v52;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v53;
  $B04355509C8947C2F6D748FEAD01E047 v54;
  NSRange v55;
  NSRange v56;
  NSRange v57;
  NSRange v58;
  NSRange v59;

  if (a3->var0.location != 0x7FFFFFFFFFFFFFFFLL && (a4 || a3->var0.length || a3->var1))
  {
    begin = self->super._rangeVector.__begin_;
    end = (char *)self->super._rangeVector.__end_;
    if (begin != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)end)
    {
      v54 = *a3;
      length = v54.var0.length;
      location = v54.var0.location;
      v10 = 0xAAAAAAAAAAAAAAABLL * ((end - (char *)begin) >> 3);
      v11 = (NSRange *)begin;
      do
      {
        v12 = v10 >> 1;
        v13 = &v11->location + 3 * (v10 >> 1);
        v15 = *v13;
        v14 = (NSRange *)(v13 + 3);
        v10 += ~(v10 >> 1);
        if (v15 < v54.var0.location)
          v11 = v14;
        else
          v10 = v12;
      }
      while (v10);
      if (end == (char *)v11)
      {
        v22 = 0;
        v17 = end;
      }
      else
      {
        v16 = 0xAAAAAAAAAAAAAAABLL * ((end - (char *)v11) >> 3);
        v17 = (char *)v11;
        do
        {
          v18 = v16 >> 1;
          v19 = (NSUInteger *)&v17[24 * (v16 >> 1)];
          v21 = *v19;
          v20 = (char *)(v19 + 3);
          v16 += ~(v16 >> 1);
          if (v21 < v54.var0.length + v54.var0.location)
            v17 = v20;
          else
            v16 = v18;
        }
        while (v16);
        if (sub_1001E966C(v54.var0, *v11, 1) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v22 = 0;
        }
        else
        {
          v27 = NSUnionRange(v54.var0, *v11);
          location = v27.location;
          length = v27.length;
          v28 = v11[1].location + v54.var1;
          v54.var0 = v27;
          v54.var1 = v28;
          v22 = 1;
        }
      }
      if (v11 == (NSRange *)begin)
      {
        v11 = (NSRange *)begin;
      }
      else
      {
        v55.location = location;
        v55.length = length;
        if (sub_1001E966C(v55, *(NSRange *)((char *)v11 - 24), 1) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v56.location = location;
          v56.length = length;
          v29 = NSUnionRange(v56, *(NSRange *)((char *)v11 - 24));
          location = v29.location;
          length = v29.length;
          v30 = v11[-1].length + v54.var1;
          v54.var0 = v29;
          v54.var1 = v30;
          v22 = 1;
          v11 = (NSRange *)((char *)v11 - 24);
        }
      }
      v32 = v17 == end && v17 != (char *)begin;
      v33 = v32 << 63 >> 63;
      v34 = (NSRange *)&v17[24 * ((int)((_DWORD)v32 << 31) >> 31)];
      v35 = v34 == (NSRange *)end || v34 == v11;
      if (v35 || (v57.location = location, v57.length = length, sub_1001E966C(v57, *v34, 1) == 0x7FFFFFFFFFFFFFFFLL))
      {
        if (!v22)
          goto LABEL_64;
      }
      else
      {
        v59 = *v34;
        v34 = (NSRange *)((char *)v34 + 24);
        v58.location = location;
        v58.length = length;
        v46 = NSUnionRange(v58, v59);
        v47 = *(_QWORD *)&v17[24 * (int)v33 + 16] + v54.var1;
        v54.var0 = v46;
        v54.var1 = v47;
      }
      if (v11 >= v34)
      {
        if (v34 < v11)
        {
          v52 = self->super._rangeVector.__end_;
          v49 = v52 - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v11;
          if (v52 != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v11)
            memmove(v34, v11, v52 - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v11);
          v11 = v34;
          goto LABEL_63;
        }
        if (v11 == (NSRange *)end)
        {
LABEL_65:
          sub_10007CE1C((uint64_t)&self->super._rangeVector, end, (unint64_t)&v54);
          return;
        }
        v51 = (NSRange *)((char *)v11 + 24);
        v53 = self->super._rangeVector.__end_;
        v49 = v53 - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v11[1].length;
        if (v53 == ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v11[1].length)
          goto LABEL_63;
        v50 = v11;
      }
      else
      {
        v48 = self->super._rangeVector.__end_;
        v49 = v48 - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v34;
        if (v48 == ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v34)
        {
LABEL_63:
          self->super._rangeVector.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v11 + v49);
LABEL_64:
          end = (char *)v11;
          goto LABEL_65;
        }
        v50 = v11;
        v51 = v34;
      }
      memmove(v50, v51, v49);
      goto LABEL_63;
    }
    p_end_cap = &self->super._rangeVector.__end_cap_;
    value = self->super._rangeVector.__end_cap_.__value_;
    if (begin >= value)
    {
      v36 = 0xAAAAAAAAAAAAAAABLL * ((value - begin) >> 3);
      v37 = 2 * v36;
      if (2 * v36 <= 1)
        v37 = 1;
      if (v36 >= 0x555555555555555)
        v38 = 0xAAAAAAAAAAAAAAALL;
      else
        v38 = v37;
      v39 = (char *)sub_100045008((uint64_t)p_end_cap, v38);
      v41 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v39[24 * v40];
      var0 = a3->var0;
      *((_QWORD *)v39 + 2) = a3->var1;
      *(_NSRange *)v39 = var0;
      v26 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v39 + 24);
      v44 = self->super._rangeVector.__begin_;
      v43 = self->super._rangeVector.__end_;
      if (v43 != v44)
      {
        do
        {
          v45 = *(_OWORD *)((char *)v43 - 24);
          *((_QWORD *)v39 - 1) = *((_QWORD *)v43 - 1);
          *(_OWORD *)(v39 - 24) = v45;
          v39 -= 24;
          v43 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v43 - 24);
        }
        while (v43 != v44);
        v43 = self->super._rangeVector.__begin_;
      }
      self->super._rangeVector.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v39;
      self->super._rangeVector.__end_ = v26;
      self->super._rangeVector.__end_cap_.__value_ = v41;
      if (v43)
        operator delete(v43);
    }
    else
    {
      v25 = a3->var0;
      *((_QWORD *)begin + 2) = a3->var1;
      *(_NSRange *)begin = v25;
      v26 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24);
    }
    self->super._rangeVector.__end_ = v26;
  }
}

- (void)addRange:(id *)a3
{
  $B04355509C8947C2F6D748FEAD01E047 v3;

  v3 = *a3;
  -[CRLWPMutableDirtyRangeArray addRange:allowEmpty:](self, "addRange:allowEmpty:", &v3, 0);
}

- (void)removeRange:(_NSRange)a3
{
  vector<CRLWPDirtyRange, std::allocator<CRLWPDirtyRange>> *p_rangeVector;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  NSUInteger *v11;
  char *v12;
  NSUInteger v13;
  NSUInteger v14;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v15;
  unint64_t v16;
  NSUInteger *v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v18;
  NSUInteger v19;
  unint64_t v20;
  NSUInteger v21;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  char *v27;
  NSUInteger v28;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v33;
  NSUInteger v35;
  NSUInteger v36;
  int64_t v37;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v38;
  int64_t v39;
  _QWORD v40[3];

  begin = self->super._rangeVector.__begin_;
  end = self->super._rangeVector.__end_;
  p_rangeVector = &self->super._rangeVector;
  if (end == begin)
  {
    v14 = a3.location + a3.length;
    v15 = begin;
LABEL_27:
    v22 = begin;
    goto LABEL_37;
  }
  v7 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
  v8 = v7;
  v9 = (char *)begin;
  do
  {
    v10 = v8 >> 1;
    v11 = (NSUInteger *)&v9[24 * (v8 >> 1)];
    v13 = *v11;
    v12 = (char *)(v11 + 3);
    v8 += ~(v8 >> 1);
    if (v13 > a3.location)
      v8 = v10;
    else
      v9 = v12;
  }
  while (v8);
  v14 = a3.location + a3.length;
  v15 = begin;
  do
  {
    v16 = v7 >> 1;
    v17 = (NSUInteger *)((char *)v15 + 24 * (v7 >> 1));
    v19 = *v17;
    v18 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v17 + 3);
    v7 += ~(v7 >> 1);
    if (v19 < v14)
      v15 = v18;
    else
      v7 = v16;
  }
  while (v7);
  if (v9 == (char *)begin)
    goto LABEL_27;
  v20 = *((_QWORD *)v9 - 3);
  v21 = *((_QWORD *)v9 - 2);
  v22 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v9 - 24);
  v23 = a3.location - v20;
  if (a3.location < v20 || v23 >= v21)
  {
    if (v20 - a3.location < a3.length && v20 >= a3.location)
      v27 = v9 - 24;
    else
      v27 = v9;
    if (v21)
      v22 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v9;
    else
      v22 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v27;
  }
  else
  {
    if (a3.location != v20)
    {
      *((_QWORD *)v9 - 2) = v23;
      v22 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v9;
    }
    if (v14 >= v20 && v14 - v20 < v21)
    {
      v24 = v21 + v20;
      if (v14 <= v21 + v20)
        v25 = v21 + v20;
      else
        v25 = a3.location + a3.length;
      if (v14 < v21 + v20)
        v24 = a3.location + a3.length;
      v40[0] = v24;
      v40[1] = v25 - v24;
      v40[2] = 0;
      if (a3.location == v20)
      {
        *(_QWORD *)v22 = v24;
        *((_QWORD *)v22 + 1) = v25 - v24;
      }
      else
      {
        sub_10007CE1C((uint64_t)p_rangeVector, v9, (unint64_t)v40);
      }
      return;
    }
  }
LABEL_37:
  if (v15 != end)
  {
    v28 = *((_QWORD *)v15 + 1);
    if (v14 > *(_QWORD *)v15 && v14 - *(_QWORD *)v15 < v28)
    {
      v30 = v28 + *(_QWORD *)v15;
      if (v14 <= v30)
        v31 = v28 + *(_QWORD *)v15;
      else
        v31 = v14;
      if (v14 < v30)
        v30 = v14;
      *(_QWORD *)v15 = v30;
      *((_QWORD *)v15 + 1) = v31 - v30;
    }
  }
  if (v22 != v15)
  {
    if (v15 != begin)
    {
      v32 = *((_QWORD *)v15 - 3);
      v33 = *((_QWORD *)v15 - 2);
      begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v15 - 24);
      if (v14 < v32 || v14 - v32 >= v33)
      {
        begin = v15;
      }
      else
      {
        v35 = v33 + v32;
        if (v14 <= v35)
          v36 = v35;
        else
          v36 = v14;
        if (v14 >= v35)
          v14 = v35;
        *((_QWORD *)v15 - 3) = v14;
        *((_QWORD *)v15 - 2) = v36 - v14;
      }
    }
    if (v22 != begin)
    {
      if (v22 >= begin)
      {
        v39 = end - v22;
        if (end != v22)
          memmove(begin, v22, end - v22);
        v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v39);
      }
      else
      {
        v37 = end - begin;
        if (end != begin)
          memmove(v22, begin, end - begin);
        v38 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v22 + v37);
      }
      self->super._rangeVector.__end_ = v38;
    }
  }
}

- (void)addChangedRange:(_NSRange)a3 delta:(int64_t)a4 allowEmpty:(BOOL)a5
{
  _BOOL8 v5;
  NSUInteger length;
  NSUInteger location;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  int64_t v12;
  uint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v16;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v17;
  unint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v22;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v23;
  uint64_t v24;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v25;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v26;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v27;
  uint64_t v28;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v29;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *i;
  __int128 v31;
  char v32;
  NSUInteger range2;
  NSUInteger v34;
  CRLWPMutableDirtyRangeArray *v35;
  _QWORD v36[3];
  __int128 v37;
  uint64_t v38;
  NSRange v39;
  uint64_t v40;
  NSRange v41;
  NSRange v42;

  v5 = a5;
  length = a3.length;
  location = a3.location;
  begin = self->super._rangeVector.__begin_;
  end = self->super._rangeVector.__end_;
  v35 = objc_opt_new(CRLWPMutableDirtyRangeArray);
  v12 = end - begin;
  range2 = length;
  if (end == begin)
  {
    v32 = 0;
  }
  else
  {
    v32 = 0;
    v13 = v12 / 24;
    v14 = location + length;
    v15 = 24 * (v12 / 24) - 8;
    v16 = -24 * (v12 / 24);
    v34 = location + length;
    do
    {
      v17 = self->super._rangeVector.__begin_;
      v18 = (unint64_t *)((char *)v17 + v15 - 16);
      v19 = *v18;
      v20 = *(_QWORD *)((char *)v17 + v15 - 8);
      if (v20 + *v18 < location)
        break;
      v21 = *(_QWORD *)((char *)v17 + v15);
      if (v19 <= v14 - a4)
      {
        if (a4 < 0 && v20 <= -a4)
        {
          v22 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v17 + v15 + 8);
          v23 = self->super._rangeVector.__end_;
          v24 = v16 + v23 - v17;
          if (v22 != v23)
          {
            memmove(v18, v22, v16 + v23 - v17);
            v14 = v34;
          }
          self->super._rangeVector.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v17
                                                                                + 24 * (v24 / 24)
                                                                                + v15
                                                                                - 16);
          a4 += v21;
        }
        else
        {
          v41.length = v20 + a4;
          v41.location = *(_QWORD *)((char *)v17 + v15 - 16);
          v42.location = location;
          v42.length = range2;
          v39 = NSUnionRange(v41, v42);
          v40 = v21 + a4;
          -[CRLWPMutableDirtyRangeArray addRange:allowEmpty:](v35, "addRange:allowEmpty:", &v39, v5);
          v26 = self->super._rangeVector.__begin_;
          v25 = self->super._rangeVector.__end_;
          v27 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v26 + v15 + 8);
          v28 = v16 + v25 - v26;
          if (v27 != v25)
            memmove((char *)v26 + v15 - 16, v27, v16 + v25 - v26);
          a4 = 0;
          self->super._rangeVector.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v26
                                                                                + 24 * (v28 / 24)
                                                                                + v15
                                                                                - 16);
          v32 = 1;
          v14 = v34;
        }
      }
      else
      {
        *v18 = v19 + a4;
        *(_QWORD *)((char *)v17 + v15) = v21;
      }
      v16 += 24;
      v15 -= 24;
      --v13;
    }
    while (v13);
  }
  v29 = v35->super._rangeVector.__begin_;
  for (i = v35->super._rangeVector.__end_; v29 != i; v29 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v29 + 24))
  {
    v31 = *(_OWORD *)v29;
    v38 = *((_QWORD *)v29 + 2);
    v37 = v31;
    -[CRLWPMutableDirtyRangeArray addRange:allowEmpty:](self, "addRange:allowEmpty:", &v37, v5);
  }
  if ((v32 & 1) == 0)
  {
    v36[0] = location;
    v36[1] = range2;
    v36[2] = a4;
    -[CRLWPMutableDirtyRangeArray addRange:allowEmpty:](self, "addRange:allowEmpty:", v36, v5);
  }

}

- (void)addChangedRange:(_NSRange)a3 delta:(int64_t)a4
{
  -[CRLWPMutableDirtyRangeArray addChangedRange:delta:allowEmpty:](self, "addChangedRange:delta:allowEmpty:", a3.location, a3.length, a4, 0);
}

- (void)subtract:(id)a3
{
  char *v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  int64_t v14;
  _QWORD *v15;

  v15 = a3;
  if (self->super._rangeVector.__end_ != self->super._rangeVector.__begin_)
  {
    v4 = (char *)objc_msgSend(v15, "count");
    if (v4)
    {
      v5 = 0;
      do
      {
        v6 = (uint64_t *)(v15[1] + v5);
        v7 = -[CRLWPDirtyRangeArray indexForRange:](self, "indexForRange:", *v6, v6[1]);
        v8 = -[CRLWPDirtyRangeArray count](self, "count");
        v9 = *v6;
        v10 = v6[1];
        if (v7 < v8
          && ((v11 = (_QWORD *)((char *)self->super._rangeVector.__begin_ + 24 * v7), v9 == *v11)
            ? (v12 = v10 == v11[1])
            : (v12 = 0),
              v12))
        {
          end = self->super._rangeVector.__end_;
          v14 = end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v11 + 3);
          if (end != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v11 + 3))
            memmove(v11, v11 + 3, end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v11 + 3));
          self->super._rangeVector.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v11 + v14);
        }
        else
        {
          -[CRLWPMutableDirtyRangeArray removeRange:](self, "removeRange:", v9, v10);
        }
        v5 += 24;
        --v4;
      }
      while (v4);
    }
  }

}

@end
