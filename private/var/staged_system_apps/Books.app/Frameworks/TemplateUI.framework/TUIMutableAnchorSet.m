@implementation TUIMutableAnchorSet

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TUIAnchorSet initWithAnchorSet:]([TUIAnchorSet alloc], "initWithAnchorSet:", self);
}

- (void)finalizeWithContentsScale:(double)a3
{
  uint64_t *begin;
  uint64_t *end;
  unint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  double *v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  char v17;

  begin = (uint64_t *)self->super._verticalTriggerAnchors.__begin_;
  end = (uint64_t *)self->super._verticalTriggerAnchors.__end_;
  v7 = 126 - 2 * __clz(((char *)end - (char *)begin) >> 4);
  if (end == begin)
    v8 = 0;
  else
    v8 = v7;
  sub_132B10(begin, end, v8, 1);
  v9 = (uint64_t *)self->super._horizontalTriggerAnchors.__begin_;
  v10 = (uint64_t *)self->super._horizontalTriggerAnchors.__end_;
  v11 = 126 - 2 * __clz(((char *)v10 - (char *)v9) >> 4);
  if (v10 == v9)
    v12 = 0;
  else
    v12 = v11;
  sub_1336A4(v9, v10, v12, 1);
  v13 = (double *)self->super._logicalScrollAnchors.__begin_;
  if (v13 == self->super._logicalScrollAnchors.__end_)
  {
    v14 = (uint64_t *)self->super._logicalScrollAnchors.__begin_;
  }
  else
  {
    do
    {
      *v13 = TUIFloatRoundedForScale(*v13, a3);
      v13 += 2;
    }
    while (v13 != self->super._logicalScrollAnchors.__end_);
    v14 = (uint64_t *)self->super._logicalScrollAnchors.__begin_;
  }
  v15 = 126 - 2 * __clz(((char *)v13 - (char *)v14) >> 4);
  if (v13 == (double *)v14)
    v16 = 0;
  else
    v16 = v15;
  sub_1340A8(v14, (uint64_t *)v13, v16, 1);
  std::__sort<std::__less<double,double> &,double *>(self->super._scrollAnchors.__begin_, self->super._scrollAnchors.__end_, &v17);
}

- (void)appendScrollAnchor:(double)a3
{
  double v5;
  double v6;
  double *end;
  double *value;
  double *v9;
  double *begin;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  double *v16;
  double *v17;
  uint64_t v18;

  -[TUIAnchorSet offset](self, "offset");
  v6 = a3 - v5 + self->_translationOffset;
  end = self->super._scrollAnchors.__end_;
  value = self->super._scrollAnchors.__end_cap_.__value_;
  if (end >= value)
  {
    begin = self->super._scrollAnchors.__begin_;
    v11 = end - begin;
    if ((unint64_t)(v11 + 1) >> 61)
      sub_6F9C();
    v12 = (char *)value - (char *)begin;
    v13 = ((char *)value - (char *)begin) >> 2;
    if (v13 <= v11 + 1)
      v13 = v11 + 1;
    if (v12 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v13;
    if (v14)
    {
      v15 = (char *)sub_39CC4((uint64_t)&self->super._scrollAnchors.__end_cap_, v14);
      begin = self->super._scrollAnchors.__begin_;
      end = self->super._scrollAnchors.__end_;
    }
    else
    {
      v15 = 0;
    }
    v16 = (double *)&v15[8 * v11];
    v17 = (double *)&v15[8 * v14];
    *v16 = v6;
    v9 = v16 + 1;
    while (end != begin)
    {
      v18 = *((_QWORD *)end-- - 1);
      *((_QWORD *)v16-- - 1) = v18;
    }
    self->super._scrollAnchors.__begin_ = v16;
    self->super._scrollAnchors.__end_ = v9;
    self->super._scrollAnchors.__end_cap_.__value_ = v17;
    if (begin)
      operator delete(begin);
  }
  else
  {
    *end = v6;
    v9 = end + 1;
  }
  self->super._scrollAnchors.__end_ = v9;
}

- (void)appendTriggerAnchorWithOffset:(double)a3 trigger:(id)a4 axis:(unint64_t)a5
{
  id v8;
  double v9;
  id v10;
  char *value;
  char *end;
  void *v13;
  char *v14;
  char *v15;
  void *v16;
  _BYTE *begin;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _BYTE *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __compressed_pair<std::pair<double, TUITrigger *> *, std::allocator<std::pair<double, TUITrigger *>>> *p_end_cap;

  v8 = a4;
  v9 = self->_translationOffset + a3;
  v10 = v8;
  if (a5 == 2)
  {
    value = (char *)self->super._verticalTriggerAnchors.__end_cap_.__value_;
    end = (char *)self->super._verticalTriggerAnchors.__end_;
    if (end >= value)
    {
      begin = self->super._verticalTriggerAnchors.__begin_;
      v18 = (end - begin) >> 4;
      if ((unint64_t)(v18 + 1) >> 60)
        sub_6F9C();
      v19 = value - begin;
      v20 = (value - begin) >> 3;
      if (v20 <= v18 + 1)
        v20 = v18 + 1;
      if (v19 >= 0x7FFFFFFFFFFFFFF0)
        v21 = 0xFFFFFFFFFFFFFFFLL;
      else
        v21 = v20;
      p_end_cap = &self->super._verticalTriggerAnchors.__end_cap_;
      v22 = (char *)sub_22FD4((uint64_t)&self->super._verticalTriggerAnchors.__end_cap_, v21);
      v24 = &v22[16 * v18];
      *(double *)v24 = v9;
      *((_QWORD *)v24 + 1) = v10;
      v26 = (char *)self->super._verticalTriggerAnchors.__begin_;
      v25 = (char *)self->super._verticalTriggerAnchors.__end_;
      v27 = v24;
      if (v25 != v26)
      {
        v28 = (char *)self->super._verticalTriggerAnchors.__end_;
        do
        {
          v29 = *((_QWORD *)v28 - 2);
          v28 -= 16;
          *((_QWORD *)v27 - 2) = v29;
          v27 -= 16;
          v30 = *((_QWORD *)v28 + 1);
          *((_QWORD *)v28 + 1) = 0;
          *((_QWORD *)v27 + 1) = v30;
        }
        while (v28 != v26);
      }
      v13 = v24 + 16;
      self->super._verticalTriggerAnchors.__begin_ = v27;
      self->super._verticalTriggerAnchors.__end_ = v24 + 16;
      v31 = self->super._verticalTriggerAnchors.__end_cap_.__value_;
      self->super._verticalTriggerAnchors.__end_cap_.__value_ = &v22[16 * v23];
      v49 = v25;
      v50 = v31;
      v47 = v26;
      v48 = v26;
      sub_134AAC((uint64_t)&v47);
    }
    else
    {
      *(double *)end = v9;
      *((_QWORD *)end + 1) = v10;
      v13 = end + 16;
    }
    self->super._verticalTriggerAnchors.__end_ = v13;
  }
  else
  {
    v14 = (char *)self->super._horizontalTriggerAnchors.__end_cap_.__value_;
    v15 = (char *)self->super._horizontalTriggerAnchors.__end_;
    if (v15 >= v14)
    {
      v32 = self->super._horizontalTriggerAnchors.__begin_;
      v33 = (v15 - v32) >> 4;
      if ((unint64_t)(v33 + 1) >> 60)
        sub_6F9C();
      v34 = v14 - v32;
      v35 = (v14 - v32) >> 3;
      if (v35 <= v33 + 1)
        v35 = v33 + 1;
      if (v34 >= 0x7FFFFFFFFFFFFFF0)
        v36 = 0xFFFFFFFFFFFFFFFLL;
      else
        v36 = v35;
      p_end_cap = &self->super._horizontalTriggerAnchors.__end_cap_;
      v37 = (char *)sub_22FD4((uint64_t)&self->super._horizontalTriggerAnchors.__end_cap_, v36);
      v39 = &v37[16 * v33];
      *(double *)v39 = v9;
      *((_QWORD *)v39 + 1) = v10;
      v41 = (char *)self->super._horizontalTriggerAnchors.__begin_;
      v40 = (char *)self->super._horizontalTriggerAnchors.__end_;
      v42 = v39;
      if (v40 != v41)
      {
        v43 = (char *)self->super._horizontalTriggerAnchors.__end_;
        do
        {
          v44 = *((_QWORD *)v43 - 2);
          v43 -= 16;
          *((_QWORD *)v42 - 2) = v44;
          v42 -= 16;
          v45 = *((_QWORD *)v43 + 1);
          *((_QWORD *)v43 + 1) = 0;
          *((_QWORD *)v42 + 1) = v45;
        }
        while (v43 != v41);
      }
      v16 = v39 + 16;
      self->super._horizontalTriggerAnchors.__begin_ = v42;
      self->super._horizontalTriggerAnchors.__end_ = v39 + 16;
      v46 = self->super._horizontalTriggerAnchors.__end_cap_.__value_;
      self->super._horizontalTriggerAnchors.__end_cap_.__value_ = &v37[16 * v38];
      v49 = v40;
      v50 = v46;
      v47 = v41;
      v48 = v41;
      sub_134AAC((uint64_t)&v47);
    }
    else
    {
      *(double *)v15 = v9;
      *((_QWORD *)v15 + 1) = v10;
      v16 = v15 + 16;
    }
    self->super._horizontalTriggerAnchors.__end_ = v16;
  }

}

- (void)appendLogicalScrollAnchor:(id)a3 withOffset:(double)a4
{
  id v6;
  double v7;
  id v8;
  char *value;
  char *end;
  void *v11;
  _BYTE *begin;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[5];

  v6 = a3;
  v7 = self->_translationOffset + a4;
  v8 = v6;
  value = (char *)self->super._logicalScrollAnchors.__end_cap_.__value_;
  end = (char *)self->super._logicalScrollAnchors.__end_;
  if (end >= value)
  {
    begin = self->super._logicalScrollAnchors.__begin_;
    v13 = (end - begin) >> 4;
    if ((unint64_t)(v13 + 1) >> 60)
      sub_6F9C();
    v14 = value - begin;
    v15 = (value - begin) >> 3;
    if (v15 <= v13 + 1)
      v15 = v13 + 1;
    if (v14 >= 0x7FFFFFFFFFFFFFF0)
      v16 = 0xFFFFFFFFFFFFFFFLL;
    else
      v16 = v15;
    v27[4] = &self->super._logicalScrollAnchors.__end_cap_;
    v17 = (char *)sub_22FD4((uint64_t)&self->super._logicalScrollAnchors.__end_cap_, v16);
    v19 = &v17[16 * v13];
    *(double *)v19 = v7;
    *((_QWORD *)v19 + 1) = v8;
    v21 = (char *)self->super._logicalScrollAnchors.__begin_;
    v20 = (char *)self->super._logicalScrollAnchors.__end_;
    v22 = v19;
    if (v20 != v21)
    {
      v23 = (char *)self->super._logicalScrollAnchors.__end_;
      do
      {
        v24 = *((_QWORD *)v23 - 2);
        v23 -= 16;
        *((_QWORD *)v22 - 2) = v24;
        v22 -= 16;
        v25 = *((_QWORD *)v23 + 1);
        *((_QWORD *)v23 + 1) = 0;
        *((_QWORD *)v22 + 1) = v25;
      }
      while (v23 != v21);
    }
    v11 = v19 + 16;
    self->super._logicalScrollAnchors.__begin_ = v22;
    self->super._logicalScrollAnchors.__end_ = v19 + 16;
    v26 = self->super._logicalScrollAnchors.__end_cap_.__value_;
    self->super._logicalScrollAnchors.__end_cap_.__value_ = &v17[16 * v18];
    v27[2] = v20;
    v27[3] = v26;
    v27[0] = v21;
    v27[1] = v21;
    sub_134AAC((uint64_t)v27);
  }
  else
  {
    *(double *)end = v7;
    *((_QWORD *)end + 1) = v8;
    v11 = end + 16;
  }
  self->super._logicalScrollAnchors.__end_ = v11;

}

- (double)translationOffset
{
  return self->_translationOffset;
}

- (void)setTranslationOffset:(double)a3
{
  self->_translationOffset = a3;
}

@end
