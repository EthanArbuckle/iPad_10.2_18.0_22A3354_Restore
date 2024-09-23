@implementation CRLWPRangeArray

+ (id)rangeArray
{
  return objc_alloc_init((Class)objc_opt_class(a1, a2));
}

+ (CRLWPRangeArray)rangeArrayWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  Class v5;

  length = a3.length;
  location = a3.location;
  objc_opt_class(a1, a2);
  return (CRLWPRangeArray *)objc_msgSend([v5 alloc], "initWithRange:", location, length);
}

- (CRLWPRangeArray)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLWPRangeArray;
  return -[CRLWPRangeArray init](&v3, "init");
}

- (CRLWPRangeArray)initWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  CRLWPRangeArray *v5;
  CRLWPRangeArray *v6;
  _NSRange *value;
  _NSRange *end;
  _NSRange *v9;
  void **p_begin;
  _NSRange *begin;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  NSUInteger *v17;
  _NSRange *v18;

  length = a3.length;
  location = a3.location;
  v5 = -[CRLWPRangeArray init](self, "init");
  v6 = v5;
  if (v5)
  {
    value = v5->_rangeVector.__end_cap_.__value_;
    end = v5->_rangeVector.__end_;
    if (end >= value)
    {
      p_begin = (void **)&v5->_rangeVector.__begin_;
      begin = v5->_rangeVector.__begin_;
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
        v16 = (char *)sub_10001FB2C((uint64_t)&v6->_rangeVector.__end_cap_, v15);
        begin = v6->_rangeVector.__begin_;
        end = v6->_rangeVector.__end_;
      }
      else
      {
        v16 = 0;
      }
      v17 = (NSUInteger *)&v16[16 * v12];
      v18 = (_NSRange *)&v16[16 * v15];
      *v17 = location;
      v17[1] = length;
      v9 = (_NSRange *)(v17 + 2);
      if (end != begin)
      {
        do
        {
          *((_NSRange *)v17 - 1) = end[-1];
          v17 -= 2;
          --end;
        }
        while (end != begin);
        begin = (_NSRange *)*p_begin;
      }
      v6->_rangeVector.__begin_ = (_NSRange *)v17;
      v6->_rangeVector.__end_ = v9;
      v6->_rangeVector.__end_cap_.__value_ = v18;
      if (begin)
        operator delete(begin);
    }
    else
    {
      end->location = location;
      end->length = length;
      v9 = end + 1;
    }
    v6->_rangeVector.__end_ = v9;
  }
  return v6;
}

- (CRLWPRangeArray)initWithRangeVector:(const void *)a3
{
  CRLWPRangeArray *v4;
  CRLWPRangeArray *v5;
  char *p_rangeVector;

  v4 = -[CRLWPRangeArray init](self, "init");
  v5 = v4;
  if (v4)
  {
    p_rangeVector = (char *)&v4->_rangeVector;
    if (&v5->_rangeVector != a3)
      sub_10001FB60(p_rangeVector, *(char **)a3, *((_QWORD *)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4);
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CRLWPRangeArray initWithRangeVector:]([CRLWPRangeArray alloc], "initWithRangeVector:", &self->_rangeVector);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CRLWPRangeArray initWithRangeVector:]([CRLWPMutableRangeArray alloc], "initWithRangeVector:", &self->_rangeVector);
}

- (BOOL)isEqualToRangeArray:(id)a3
{
  _QWORD *v4;
  _NSRange *begin;
  _NSRange *end;
  int64x2_t *v7;
  unint64_t v8;
  unint64_t v9;
  int64x2_t v10;
  int64x2_t v11;
  int64x2_t v12;
  int32x2_t v13;
  char v14;
  BOOL v16;

  v4 = a3;
  if (v4
    && (begin = self->_rangeVector.__begin_,
        end = self->_rangeVector.__end_,
        v7 = (int64x2_t *)v4[1],
        (char *)end - (char *)begin == v4[2] - (_QWORD)v7))
  {
    if (end == begin)
    {
      v14 = 1;
    }
    else
    {
      v8 = end - begin;
      if (v8 <= 1)
        v8 = 1;
      v9 = v8 - 1;
      do
      {
        v10 = *(int64x2_t *)begin++;
        v11 = v10;
        v12 = *v7++;
        v13 = vmovn_s64(vceqq_s64(v11, v12));
        v14 = v13.i8[0] & v13.i8[4];
        v16 = v9-- != 0;
      }
      while ((v13.i8[0] & v13.i8[4] & 1) != 0 && v16);
    }
  }
  else
  {
    v14 = 0;
  }

  return v14 & 1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  CRLWPRangeArray *v5;
  uint64_t v6;
  id v7;
  void *v8;
  BOOL v9;

  v5 = (CRLWPRangeArray *)a3;
  if (self == v5)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class(CRLWPRangeArray, v4);
    v7 = sub_100221D0C(v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
      v9 = -[CRLWPRangeArray isEqualToRangeArray:](self, "isEqualToRangeArray:", v8);
    else
      v9 = 0;

  }
  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  _NSRange *begin;
  uint64_t v5;
  unint64_t v6;

  v3 = sub_1000BBFE0(0, 0);
  begin = self->_rangeVector.__begin_;
  if (self->_rangeVector.__end_ != begin)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v3 = sub_1000BC018((char *)&begin[v5], 16, v3);
      ++v6;
      begin = self->_rangeVector.__begin_;
      ++v5;
    }
    while (v6 < self->_rangeVector.__end_ - begin);
  }
  return v3;
}

- (unint64_t)rangeCount
{
  return self->_rangeVector.__end_ - self->_rangeVector.__begin_;
}

- (_NSRange)superRange
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  v3 = -[CRLWPRangeArray p_start](self, "p_start");
  v4 = -[CRLWPRangeArray p_finish](self, "p_finish");
  if (v3 <= v4)
    v5 = v4;
  else
    v5 = v3;
  if (v3 < v4)
    v4 = v3;
  v6 = v5 - v4;
  result.length = v6;
  result.location = v4;
  return result;
}

- (_NSRange)rangeAtIndex:(unint64_t)a3
{
  _NSRange *v3;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  v3 = &self->_rangeVector.__begin_[a3];
  location = v3->location;
  length = v3->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)enumerateRanges:(id)a3
{
  void (**v4)(id, NSUInteger, NSUInteger, uint64_t, _BYTE *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  char v9;

  v4 = (void (**)(id, NSUInteger, NSUInteger, uint64_t, _BYTE *))a3;
  v9 = 0;
  v5 = -[CRLWPRangeArray rangeCount](self, "rangeCount");
  if (v5 >= 1)
  {
    v6 = 0;
    v7 = 1;
    do
    {
      v4[2](v4, self->_rangeVector.__begin_[v6].location, self->_rangeVector.__begin_[v6].length, v7 - 1, &v9);
      if (v9)
        v8 = 0;
      else
        v8 = v7 < v5;
      ++v7;
      ++v6;
    }
    while (v8);
  }

}

- (void)reverseEnumerateRanges:(id)a3
{
  void (**v4)(id, NSUInteger, NSUInteger);
  unint64_t v5;
  unint64_t v6;
  unint64_t i;
  _NSRange *v8;
  unint64_t v9;

  v4 = (void (**)(id, NSUInteger, NSUInteger))a3;
  v5 = -[CRLWPRangeArray rangeCount](self, "rangeCount");
  v6 = v5;
  for (i = v5 - 1; (i & 0x8000000000000000) == 0; i = v9)
  {
    v8 = &self->_rangeVector.__begin_[v6--];
    v9 = i - 1;
    v4[2](v4, v8[-1].location, v8[-1].length);
  }

}

- (void)enumerateRangesInRange:(_NSRange)a3 usingBlock:(id)a4
{
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _NSRange v9;
  _QWORD v10[3];
  char v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10043A698;
  v6[3] = &unk_10125E008;
  v9 = a3;
  v7 = a4;
  v8 = v10;
  v5 = v7;
  -[CRLWPRangeArray enumerateRanges:](self, "enumerateRanges:", v6);

  _Block_object_dispose(v10, 8);
}

- (unint64_t)indexCount
{
  _NSRange *begin;
  _NSRange *end;
  unint64_t result;

  begin = self->_rangeVector.__begin_;
  end = self->_rangeVector.__end_;
  if (begin == end)
    return 0;
  result = 0;
  do
  {
    result += begin->length;
    ++begin;
  }
  while (begin != end);
  return result;
}

- (BOOL)containsCharacterAtIndex:(unint64_t)a3
{
  return -[CRLWPRangeArray containsCharacterAtIndex:inclusive:](self, "containsCharacterAtIndex:inclusive:", a3, 0);
}

- (BOOL)containsCharacterAtIndex:(unint64_t)a3 inclusive:(BOOL)a4
{
  _NSRange *begin;
  uint64_t v5;
  unint64_t v6;
  _NSRange *v7;
  unint64_t v8;
  _NSRange *v9;
  _NSRange *v10;
  unint64_t location;
  unint64_t v12;
  NSUInteger length;
  BOOL result;

  begin = self->_rangeVector.__begin_;
  v5 = (char *)self->_rangeVector.__end_ - (char *)begin;
  if (!v5)
    return 0;
  v6 = v5 >> 4;
  v7 = self->_rangeVector.__begin_;
  do
  {
    v8 = v6 >> 1;
    v9 = &v7[v6 >> 1];
    location = v9->location;
    v10 = v9 + 1;
    v6 += ~(v6 >> 1);
    if (location > a3)
      v6 = v8;
    else
      v7 = v10;
  }
  while (v6);
  if (v7 == begin)
    return 0;
  v12 = v7[-1].location;
  length = v7[-1].length;
  if (a3 >= v12 && a3 - v12 < length)
    return 1;
  result = 0;
  if (a4 && length + v12 == a3)
    return 1;
  return result;
}

- (BOOL)containsRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;
  uint64_t v6;
  BOOL v7;

  length = a3.length;
  location = a3.location;
  v5 = -[CRLWPRangeArray rangeContainingPosition:](self, "rangeContainingPosition:");
  v7 = (unint64_t)v5 + v6 >= location + length;
  if ((unint64_t)v5 > location)
    v7 = 0;
  return v5 != (id)0x7FFFFFFFFFFFFFFFLL && v7;
}

- (_NSRange)rangeContainingPosition:(unint64_t)a3
{
  NSUInteger v4;
  NSUInteger v5;
  _NSRange *begin;
  uint64_t v7;
  unint64_t v8;
  _NSRange *v9;
  unint64_t v10;
  unint64_t *p_location;
  _NSRange *v12;
  unint64_t v13;
  NSUInteger length;
  unint64_t location;
  _NSRange result;

  v4 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = 0;
  begin = self->_rangeVector.__begin_;
  v7 = (char *)self->_rangeVector.__end_ - (char *)begin;
  if (v7)
  {
    v8 = v7 >> 4;
    v9 = begin;
    do
    {
      v10 = v8 >> 1;
      p_location = &v9[v8 >> 1].location;
      v13 = *p_location;
      v12 = (_NSRange *)(p_location + 2);
      v8 += ~(v8 >> 1);
      if (v13 > a3)
        v8 = v10;
      else
        v9 = v12;
    }
    while (v8);
    if (v9 != begin)
    {
      location = v9[-1].location;
      length = v9[-1].length;
      if (a3 >= location && a3 - location < length)
      {
        v4 = location;
        v5 = length;
      }
    }
  }
  result.length = v5;
  result.location = v4;
  return result;
}

- (BOOL)intersectsRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _NSRange *end;
  _NSRange *begin;
  unint64_t v7;
  _NSRange *v8;
  unint64_t v9;
  NSUInteger *p_location;
  _NSRange *v11;
  NSUInteger v12;
  NSRange v14;

  length = a3.length;
  location = a3.location;
  begin = self->_rangeVector.__begin_;
  end = self->_rangeVector.__end_;
  if (end == begin)
  {
    v8 = self->_rangeVector.__begin_;
  }
  else
  {
    v7 = end - begin;
    v8 = self->_rangeVector.__begin_;
    do
    {
      v9 = v7 >> 1;
      p_location = &v8[v7 >> 1].location;
      v12 = *p_location;
      v11 = (_NSRange *)(p_location + 2);
      v7 += ~(v7 >> 1);
      if (a3.location < v12)
        v7 = v9;
      else
        v8 = v11;
    }
    while (v7);
  }
  if (v8 != end && NSIntersectionRange(a3, *v8).length)
    return 1;
  if (v8 == begin)
    return 0;
  v14.location = location;
  v14.length = length;
  return NSIntersectionRange(v14, *(v8 - 16)).length != 0;
}

- (unint64_t)indexForRange:(_NSRange)a3
{
  _NSRange *begin;
  _NSRange *end;
  unint64_t v5;
  _NSRange *v6;
  unint64_t v7;
  _NSRange *v8;
  _NSRange *v9;
  NSUInteger location;

  begin = self->_rangeVector.__begin_;
  end = self->_rangeVector.__end_;
  if (end == begin)
  {
    v6 = self->_rangeVector.__begin_;
  }
  else
  {
    v5 = end - begin;
    v6 = self->_rangeVector.__begin_;
    do
    {
      v7 = v5 >> 1;
      v8 = &v6[v5 >> 1];
      location = v8->location;
      v9 = v8 + 1;
      v5 += ~(v5 >> 1);
      if (location < a3.location)
        v6 = v9;
      else
        v5 = v7;
    }
    while (v5);
  }
  if (v6 == end)
  {
    v6 = self->_rangeVector.__end_;
  }
  else if (v6->location == a3.location)
  {
    v6 += a3.length < v6->length;
  }
  return v6 - begin;
}

- (id)intersection:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  CRLWPMutableRangeArray *v6;
  _NSRange *begin;
  _NSRange *end;
  NSUInteger v9;
  NSUInteger v10;
  NSRange v11;
  NSRange v14;
  NSRange v15;

  length = a3.length;
  location = a3.location;
  v6 = objc_opt_new(CRLWPMutableRangeArray);
  begin = self->_rangeVector.__begin_;
  end = self->_rangeVector.__end_;
  if (begin != end)
  {
    do
    {
      v9 = begin->location;
      v10 = begin->length;
      v14.location = location;
      v14.length = length;
      v15.location = begin->location;
      v15.length = v10;
      v11 = NSIntersectionRange(v14, v15);
      if (v11.length)
        -[CRLWPMutableRangeArray addRange:](v6, "addRange:", v11.location, v11.length);
      ++begin;
    }
    while (location + length >= v10 + v9 && begin != end);
  }
  return v6;
}

- (id)rangesIntersecting:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  CRLWPMutableRangeArray *v6;
  _NSRange *begin;
  _NSRange *end;
  NSUInteger v9;
  NSUInteger v10;
  NSRange v13;
  NSRange v14;

  length = a3.length;
  location = a3.location;
  v6 = objc_opt_new(CRLWPMutableRangeArray);
  begin = self->_rangeVector.__begin_;
  end = self->_rangeVector.__end_;
  if (begin != end)
  {
    do
    {
      v9 = begin->location;
      v10 = begin->length;
      v13.location = location;
      v13.length = length;
      v14.location = begin->location;
      v14.length = v10;
      if (NSIntersectionRange(v13, v14).length)
        -[CRLWPMutableRangeArray addRange:](v6, "addRange:", v9, v10);
      ++begin;
    }
    while (location + length >= v10 + v9 && begin != end);
  }
  return v6;
}

- (unint64_t)p_start
{
  unint64_t result;

  result = -[CRLWPRangeArray rangeCount](self, "rangeCount");
  if (result)
    return self->_rangeVector.__begin_->location;
  return result;
}

- (unint64_t)p_finish
{
  unint64_t result;

  result = -[CRLWPRangeArray rangeCount](self, "rangeCount");
  if (result)
    return self->_rangeVector.__end_[-1].length + self->_rangeVector.__end_[-1].location;
  return result;
}

- (void).cxx_destruct
{
  _NSRange *begin;

  begin = self->_rangeVector.__begin_;
  if (begin)
  {
    self->_rangeVector.__end_ = begin;
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
