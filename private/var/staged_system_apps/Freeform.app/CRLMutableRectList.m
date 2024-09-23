@implementation CRLMutableRectList

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CRLRectList initWithRectList:]([CRLRectList alloc], "initWithRectList:", self);
}

- (void)addRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  __compressed_pair<CGRect *, std::allocator<CGRect>> *p_end_cap;
  CGRect *value;
  CGRect *end;
  CGRect *v11;
  vector<CGRect, std::allocator<CGRect>> *p_mRectList;
  CGRect *begin;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  CGRect *v19;
  CGRect *v20;
  CGSize size;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_end_cap = &self->super.mRectList.__end_cap_;
  value = self->super.mRectList.__end_cap_.__value_;
  end = self->super.mRectList.__end_;
  if (end >= value)
  {
    p_mRectList = &self->super.mRectList;
    begin = self->super.mRectList.__begin_;
    v14 = end - begin;
    v15 = v14 + 1;
    if ((unint64_t)(v14 + 1) >> 59)
      sub_100007810();
    v16 = (char *)value - (char *)begin;
    if (v16 >> 4 > v15)
      v15 = v16 >> 4;
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFE0)
      v17 = 0x7FFFFFFFFFFFFFFLL;
    else
      v17 = v15;
    if (v17)
    {
      v18 = (char *)sub_100134CDC((uint64_t)p_end_cap, v17);
      begin = self->super.mRectList.__begin_;
      end = self->super.mRectList.__end_;
    }
    else
    {
      v18 = 0;
    }
    v19 = (CGRect *)&v18[32 * v14];
    v19->origin.x = x;
    v19->origin.y = y;
    v20 = (CGRect *)&v18[32 * v17];
    v19->size.width = width;
    v19->size.height = height;
    v11 = v19 + 1;
    if (end != begin)
    {
      do
      {
        size = end[-1].size;
        v19[-1].origin = end[-1].origin;
        v19[-1].size = size;
        --v19;
        --end;
      }
      while (end != begin);
      begin = p_mRectList->__begin_;
    }
    self->super.mRectList.__begin_ = v19;
    self->super.mRectList.__end_ = v11;
    self->super.mRectList.__end_cap_.__value_ = v20;
    if (begin)
      operator delete(begin);
  }
  else
  {
    *end = a3;
    v11 = end + 1;
  }
  self->super.mRectList.__end_ = v11;
}

- (void)addRectList:(id)a3
{
  sub_100134D10((uint64_t)&self->super.mRectList, (uint64_t)self->super.mRectList.__end_, *((char **)a3 + 1), *((char **)a3 + 2), (uint64_t)(*((_QWORD *)a3 + 2) - *((_QWORD *)a3 + 1)) >> 5);
}

- (void)insertRect:(CGRect)a3 atIndex:(unint64_t)a4
{
  CGRect v4;

  v4 = a3;
  sub_100134894((uint64_t)&self->super.mRectList, (char *)&self->super.mRectList.__begin_[a4], (char *)&v4);
}

- (void)replaceRect:(CGRect)a3 atIndex:(unint64_t)a4
{
  self->super.mRectList.__begin_[a4] = a3;
}

- (void)makeEmpty
{
  self->super.mRectList.__end_ = self->super.mRectList.__begin_;
}

- (void)setList:(id)a3
{
  CRLMutableRectList *v4;

  v4 = (CRLMutableRectList *)a3;
  if (self != v4)
    sub_100134FF0((char *)&self->super.mRectList, (char *)v4->super.mRectList.__begin_, (uint64_t)v4->super.mRectList.__end_, v4->super.mRectList.__end_ - v4->super.mRectList.__begin_);

}

- (void)applyTransform:(CGAffineTransform *)a3
{
  CGRect *begin;
  uint64_t v4;
  unint64_t v6;
  uint64_t v7;
  CGSize *p_size;
  __int128 v9;
  CGAffineTransform v10;
  CGRect v11;

  begin = self->super.mRectList.__begin_;
  v4 = (char *)self->super.mRectList.__end_ - (char *)begin;
  if (v4)
  {
    v6 = v4 >> 5;
    if (v6 <= 1)
      v7 = 1;
    else
      v7 = v6;
    p_size = &begin->size;
    do
    {
      v11 = *(CGRect *)&p_size[-1].width;
      v9 = *(_OWORD *)&a3->c;
      *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
      *(_OWORD *)&v10.c = v9;
      *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
      *(CGRect *)&p_size[-1].width = CGRectApplyAffineTransform(v11, &v10);
      p_size += 2;
      --v7;
    }
    while (v7);
  }
}

@end
