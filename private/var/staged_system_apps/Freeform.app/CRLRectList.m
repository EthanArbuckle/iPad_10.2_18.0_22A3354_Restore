@implementation CRLRectList

- (CRLRectList)initWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CRLRectList *v7;
  CRLRectList *v8;
  CGFloat *p_x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[CRLRectList init](self, "init");
  v8 = v7;
  if (v7)
  {
    sub_100134274((uint64_t)&v7->mRectList, 1uLL);
    p_x = &v8->mRectList.__begin_->origin.x;
    *p_x = x;
    p_x[1] = y;
    p_x[2] = width;
    p_x[3] = height;
  }
  return v8;
}

- (CRLRectList)initWithRectList:(id)a3
{
  id v4;
  CRLRectList *v5;
  uint64_t v6;
  unint64_t i;
  _QWORD *p_x;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = -[CRLRectList init](self, "init");
  if (v5)
  {
    sub_100134274((uint64_t)&v5->mRectList, (unint64_t)objc_msgSend(v4, "count"));
    v6 = 0;
    for (i = 0; i < (unint64_t)objc_msgSend(v4, "count"); ++i)
    {
      objc_msgSend(v4, "rectAtIndex:", i);
      p_x = (_QWORD *)&v5->mRectList.__begin_[v6].origin.x;
      *p_x = v9;
      p_x[1] = v10;
      p_x[2] = v11;
      p_x[3] = v12;
      ++v6;
    }
  }

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CRLRectList initWithRectList:]([CRLMutableRectList alloc], "initWithRectList:", self);
}

- (unint64_t)count
{
  return self->mRectList.__end_ - self->mRectList.__begin_;
}

- (CGRect)rectAtIndex:(unint64_t)a3
{
  CGRect *begin;
  unint64_t v4;
  double *p_x;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  CGRect result;

  begin = self->mRectList.__begin_;
  v4 = self->mRectList.__end_ - begin;
  if (v4 <= a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Getting object at %lu from an array with size %lu"), a3, v4));
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("IndexOutOfBound"), v10, 0));

    objc_exception_throw(v11);
  }
  p_x = &begin[a3].origin.x;
  v6 = *p_x;
  v7 = p_x[1];
  v8 = p_x[2];
  v9 = p_x[3];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  BOOL v13;
  BOOL v14;
  BOOL v16;

  v4 = a3;
  v6 = objc_opt_class(CRLRectList, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue(v7);
  v9 = -[CRLRectList count](self, "count");
  if (v8 && (v10 = v9, objc_msgSend(v8, "count") == v9))
  {
    if (v10)
    {
      v11 = 0;
      v12 = v10 - 1;
      do
      {
        v13 = CGRectEqualToRect(self->mRectList.__begin_[v11], *(CGRect *)(v8[1] + v11 * 32));
        v14 = v13;
        v16 = v12-- != 0 && v13;
        ++v11;
      }
      while (v16);
    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  uint64_t v2;
  CGRect *begin;
  CGRect *end;
  CGPoint origin;
  CGSize size;
  _OWORD v8[2];

  v2 = 0xCBF29CE484222325;
  begin = self->mRectList.__begin_;
  end = self->mRectList.__end_;
  while (begin != end)
  {
    origin = begin->origin;
    size = begin->size;
    ++begin;
    v8[0] = origin;
    v8[1] = size;
    v2 = sub_1000BC018((char *)v8, 32, v2);
  }
  return v2;
}

+ (id)rectListWithRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CRLRectList *v7;
  CRLRectList *v8;
  char *end;
  uint64_t p_end_cap;
  CGRect *value;
  CGRect *v12;
  void **p_begin;
  char *begin;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  CGFloat *v20;
  CGRect *v21;
  __int128 v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = objc_opt_new(CRLRectList);
  v8 = v7;
  end = (char *)v7->mRectList.__end_;
  p_end_cap = (uint64_t)&v7->mRectList.__end_cap_;
  value = v7->mRectList.__end_cap_.__value_;
  if (end >= (char *)value)
  {
    p_begin = (void **)&v7->mRectList.__begin_;
    begin = (char *)v7->mRectList.__begin_;
    v15 = (end - begin) >> 5;
    v16 = v15 + 1;
    if ((unint64_t)(v15 + 1) >> 59)
      sub_100007810();
    v17 = (char *)value - begin;
    if (v17 >> 4 > v16)
      v16 = v17 >> 4;
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFE0)
      v18 = 0x7FFFFFFFFFFFFFFLL;
    else
      v18 = v16;
    if (v18)
    {
      v19 = (char *)sub_100134CDC(p_end_cap, v18);
      begin = (char *)v8->mRectList.__begin_;
      end = (char *)v8->mRectList.__end_;
    }
    else
    {
      v19 = 0;
    }
    v20 = (CGFloat *)&v19[32 * v15];
    *v20 = x;
    v20[1] = y;
    v21 = (CGRect *)&v19[32 * v18];
    v20[2] = width;
    v20[3] = height;
    v12 = (CGRect *)(v20 + 4);
    if (end != begin)
    {
      do
      {
        v22 = *((_OWORD *)end - 1);
        *((_OWORD *)v20 - 2) = *((_OWORD *)end - 2);
        *((_OWORD *)v20 - 1) = v22;
        v20 -= 4;
        end -= 32;
      }
      while (end != begin);
      begin = (char *)*p_begin;
    }
    v8->mRectList.__begin_ = (CGRect *)v20;
    v8->mRectList.__end_ = v12;
    v8->mRectList.__end_cap_.__value_ = v21;
    if (begin)
      operator delete(begin);
  }
  else
  {
    *(CGFloat *)end = x;
    *((CGFloat *)end + 1) = y;
    v12 = (CGRect *)(end + 32);
    *((CGFloat *)end + 2) = width;
    *((CGFloat *)end + 3) = height;
  }
  v8->mRectList.__end_ = v12;
  return v8;
}

- (void).cxx_destruct
{
  CGRect *begin;

  begin = self->mRectList.__begin_;
  if (begin)
  {
    self->mRectList.__end_ = begin;
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
