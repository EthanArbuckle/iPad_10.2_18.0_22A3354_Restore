@implementation CRLRangeList

- (CRLRangeList)initWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  CRLRangeList *v5;
  CRLRangeList *v6;
  _NSRange *begin;

  length = a3.length;
  location = a3.location;
  v5 = -[CRLRangeList init](self, "init");
  v6 = v5;
  if (v5)
  {
    sub_10001EFCC((uint64_t)&v5->mRangeList, 1uLL);
    begin = v6->mRangeList.__begin_;
    begin->location = location;
    begin->length = length;
  }
  return v6;
}

- (CRLRangeList)initWithRangeList:(id)a3
{
  id v4;
  CRLRangeList *v5;
  uint64_t v6;
  unint64_t i;
  id v8;
  _NSRange *v9;
  NSUInteger v10;

  v4 = a3;
  v5 = -[CRLRangeList init](self, "init");
  if (v5)
  {
    sub_10001EFCC((uint64_t)&v5->mRangeList, (unint64_t)objc_msgSend(v4, "count"));
    v6 = 0;
    for (i = 0; i < (unint64_t)objc_msgSend(v4, "count"); ++i)
    {
      v8 = objc_msgSend(v4, "rangeAtIndex:", i);
      v9 = &v5->mRangeList.__begin_[v6];
      v9->location = (NSUInteger)v8;
      v9->length = v10;
      ++v6;
    }
  }

  return v5;
}

- (CRLRangeList)initWithString:(id)a3
{
  id v4;
  CRLRangeList *v5;
  CRLRangeList *v6;
  unint64_t v7;
  unint64_t v8;
  void **p_begin;
  unsigned int v10;
  unint64_t v11;
  NSString *v12;
  NSRange v13;
  _NSRange *value;
  NSRange *end;
  _NSRange *v16;
  NSRange *begin;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  NSRange *v23;
  _NSRange *v24;

  v4 = a3;
  v5 = -[CRLRangeList init](self, "init");
  v6 = v5;
  if (v4 && v5 && (unint64_t)objc_msgSend(v4, "length") >= 3)
  {
    v7 = 0;
    v8 = 0;
    p_begin = (void **)&v6->mRangeList.__begin_;
    while (v8 < (unint64_t)objc_msgSend(v4, "length"))
    {
      v10 = objc_msgSend(v4, "characterAtIndex:", v8);
      v11 = v8;
      if (v10 != 123)
      {
        if (objc_msgSend(v4, "characterAtIndex:", v8) == 125)
        {
          v12 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", v7, v8 - v7 + 1));
          v13 = NSRangeFromString(v12);
          end = v6->mRangeList.__end_;
          value = v6->mRangeList.__end_cap_.__value_;
          if (end >= value)
          {
            begin = (NSRange *)*p_begin;
            v18 = ((char *)end - (_BYTE *)*p_begin) >> 4;
            v19 = v18 + 1;
            if ((unint64_t)(v18 + 1) >> 60)
              sub_100007810();
            v20 = (char *)value - (char *)begin;
            if (v20 >> 3 > v19)
              v19 = v20 >> 3;
            if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0)
              v21 = 0xFFFFFFFFFFFFFFFLL;
            else
              v21 = v19;
            if (v21)
            {
              v22 = (char *)sub_10001FB2C((uint64_t)&v6->mRangeList.__end_cap_, v21);
              begin = v6->mRangeList.__begin_;
              end = v6->mRangeList.__end_;
            }
            else
            {
              v22 = 0;
            }
            v23 = (NSRange *)&v22[16 * v18];
            *v23 = v13;
            v24 = v23;
            if (end != begin)
            {
              do
              {
                v24[-1] = end[-1];
                --v24;
                --end;
              }
              while (end != begin);
              begin = (NSRange *)*p_begin;
            }
            v16 = v23 + 1;
            v6->mRangeList.__begin_ = v24;
            v6->mRangeList.__end_ = v23 + 1;
            v6->mRangeList.__end_cap_.__value_ = (_NSRange *)&v22[16 * v21];
            if (begin)
              operator delete(begin);
          }
          else
          {
            *end = v13;
            v16 = end + 1;
          }
          v6->mRangeList.__end_ = v16;

        }
        v11 = v7;
      }
      ++v8;
      v7 = v11;
    }
  }

  return v6;
}

- (CRLRangeList)initWithRangeVector:(const void *)a3
{
  CRLRangeList *v4;
  CRLRangeList *v5;
  char *p_mRangeList;

  v4 = -[CRLRangeList init](self, "init");
  v5 = v4;
  if (v4)
  {
    p_mRangeList = (char *)&v4->mRangeList;
    if (&v5->mRangeList != a3)
      sub_10001FB60(p_mRangeList, *(char **)a3, *((_QWORD *)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4);
  }
  return v5;
}

- (CRLRangeList)initWithRangeVectorMove:(void *)a3
{
  CRLRangeList *v4;
  CRLRangeList *v5;
  char *p_mRangeList;

  v4 = -[CRLRangeList init](self, "init");
  v5 = v4;
  if (v4)
  {
    p_mRangeList = (char *)&v4->mRangeList;
    if (&v5->mRangeList != a3)
      sub_10001FB60(p_mRangeList, *(char **)a3, *((_QWORD *)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4);
  }
  return v5;
}

- (const)rangeVector
{
  return &self->mRangeList;
}

- (unint64_t)count
{
  return self->mRangeList.__end_ - self->mRangeList.__begin_;
}

- (void)addRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  __compressed_pair<_NSRange *, std::allocator<_NSRange>> *p_end_cap;
  _NSRange *value;
  _NSRange *end;
  _NSRange *v9;
  vector<_NSRange, std::allocator<_NSRange>> *p_mRangeList;
  _NSRange *begin;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  _NSRange *v17;
  _NSRange *v18;

  length = a3.length;
  location = a3.location;
  p_end_cap = &self->mRangeList.__end_cap_;
  value = self->mRangeList.__end_cap_.__value_;
  end = self->mRangeList.__end_;
  if (end >= value)
  {
    p_mRangeList = &self->mRangeList;
    begin = self->mRangeList.__begin_;
    v12 = end - begin;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 60)
      sub_100007810();
    v14 = (char *)value - (char *)begin;
    if (v14 >> 3 > v13)
      v13 = v14 >> 3;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
      v15 = 0xFFFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    if (v15)
    {
      v16 = (char *)sub_10001FB2C((uint64_t)p_end_cap, v15);
      begin = self->mRangeList.__begin_;
      end = self->mRangeList.__end_;
    }
    else
    {
      v16 = 0;
    }
    v17 = (_NSRange *)&v16[16 * v12];
    v18 = (_NSRange *)&v16[16 * v15];
    v17->location = location;
    v17->length = length;
    v9 = v17 + 1;
    if (end != begin)
    {
      do
      {
        v17[-1] = end[-1];
        --v17;
        --end;
      }
      while (end != begin);
      begin = p_mRangeList->__begin_;
    }
    self->mRangeList.__begin_ = v17;
    self->mRangeList.__end_ = v9;
    self->mRangeList.__end_cap_.__value_ = v18;
    if (begin)
      operator delete(begin);
  }
  else
  {
    *end = a3;
    v9 = end + 1;
  }
  self->mRangeList.__end_ = v9;
}

- (void)insertRange:(_NSRange)a3 atIndex:(unint64_t)a4
{
  _NSRange v4;

  v4 = a3;
  sub_10001F4DC((uint64_t)&self->mRangeList, (char *)&self->mRangeList.__begin_[a4], (char *)&v4);
}

- (void)removeRangeAtIndex:(unint64_t)a3
{
  _NSRange *begin;
  _NSRange *end;
  _NSRange *v6;
  char *v7;

  begin = self->mRangeList.__begin_;
  end = self->mRangeList.__end_;
  v6 = &begin[a3];
  v7 = (char *)((char *)end - (char *)&v6[1]);
  if (end != &v6[1])
    memmove(&begin[a3], &v6[1], (char *)end - (char *)&v6[1]);
  self->mRangeList.__end_ = (_NSRange *)&v7[(_QWORD)v6];
}

- (void)replaceWithRange:(_NSRange)a3 atIndex:(unint64_t)a4
{
  _NSRange *begin;
  unint64_t v5;
  void *v6;
  id v7;

  begin = self->mRangeList.__begin_;
  v5 = self->mRangeList.__end_ - begin;
  if (v5 <= a4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Getting object at %lu from an array with size %lu"), a3.length, a4, v5));
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("IndexOutOfBound"), v6, 0));

    objc_exception_throw(v7);
  }
  begin[a4] = a3;
}

- (void)reverse
{
  _NSRange *begin;
  _NSRange *end;
  _NSRange *v4;
  _NSRange *v6;
  _NSRange v7;

  begin = self->mRangeList.__begin_;
  end = self->mRangeList.__end_;
  v4 = end - 1;
  if (begin != end && v4 > begin)
  {
    v6 = begin + 1;
    do
    {
      v7 = v6[-1];
      v6[-1] = *v4;
      *v4-- = v7;
    }
    while (v6++ < v4);
  }
}

- (_NSRange)rangeAtIndex:(unint64_t)a3
{
  _NSRange *begin;
  unint64_t v4;
  NSUInteger *p_location;
  NSUInteger v6;
  NSUInteger v7;
  void *v8;
  id v9;
  _NSRange result;

  begin = self->mRangeList.__begin_;
  v4 = self->mRangeList.__end_ - begin;
  if (v4 <= a3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Getting object at %lu from an array with size %lu"), a3, v4));
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("IndexOutOfBound"), v8, 0));

    objc_exception_throw(v9);
  }
  p_location = &begin[a3].location;
  v6 = *p_location;
  v7 = p_location[1];
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)consolidate
{
  sub_1001AC988((char **)&self->mRangeList);
}

- (id)stringValue
{
  return +[CRLRangeList stringValueForRangeVector:](CRLRangeList, "stringValueForRangeVector:", &self->mRangeList);
}

+ (id)stringValueForRangeVector:(const void *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  NSString *v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("[")));
  v5 = *(_QWORD *)a3;
  if (*((_QWORD *)a3 + 1) != *(_QWORD *)a3)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      if (v7)
      {
        objc_msgSend(v4, "appendString:", CFSTR(","));
        v5 = *(_QWORD *)a3;
      }
      v8 = NSStringFromRange(*(NSRange *)(v5 + v6));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      objc_msgSend(v4, "appendString:", v9);

      ++v7;
      v5 = *(_QWORD *)a3;
      v6 += 16;
    }
    while (v7 < (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4);
  }
  objc_msgSend(v4, "appendString:", CFSTR("]"));
  return v4;
}

- (void).cxx_destruct
{
  _NSRange *begin;

  begin = self->mRangeList.__begin_;
  if (begin)
  {
    self->mRangeList.__end_ = begin;
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
