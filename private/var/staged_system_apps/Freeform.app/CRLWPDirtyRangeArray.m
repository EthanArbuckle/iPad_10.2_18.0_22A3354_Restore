@implementation CRLWPDirtyRangeArray

- (CRLWPDirtyRangeArray)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLWPDirtyRangeArray;
  return -[CRLWPDirtyRangeArray init](&v3, "init");
}

- (CRLWPDirtyRangeArray)initWithDirtyRange:(id *)a3
{
  CRLWPDirtyRangeArray *v4;
  CRLWPDirtyRangeArray *v5;
  uint64_t p_end_cap;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *value;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  _NSRange v9;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v10;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v18;
  _NSRange var0;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v20;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v21;
  __int128 v22;

  v4 = -[CRLWPDirtyRangeArray init](self, "init");
  v5 = v4;
  if (v4)
  {
    p_end_cap = (uint64_t)&v4->_rangeVector.__end_cap_;
    value = v5->_rangeVector.__end_cap_.__value_;
    end = v5->_rangeVector.__end_;
    if (end >= value)
    {
      begin = v5->_rangeVector.__begin_;
      v12 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
      v13 = v12 + 1;
      if (v12 + 1 > 0xAAAAAAAAAAAAAAALL)
        sub_100007810();
      v14 = 0xAAAAAAAAAAAAAAABLL * ((value - begin) >> 3);
      if (2 * v14 > v13)
        v13 = 2 * v14;
      if (v14 >= 0x555555555555555)
        v15 = 0xAAAAAAAAAAAAAAALL;
      else
        v15 = v13;
      if (v15)
        v16 = (char *)sub_100045008(p_end_cap, v15);
      else
        v16 = 0;
      v17 = &v16[24 * v12];
      v18 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v16[24 * v15];
      var0 = a3->var0;
      *((_QWORD *)v17 + 2) = a3->var1;
      *(_NSRange *)v17 = var0;
      v10 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v17 + 24);
      v21 = v5->_rangeVector.__begin_;
      v20 = v5->_rangeVector.__end_;
      if (v20 != v21)
      {
        do
        {
          v22 = *(_OWORD *)((char *)v20 - 24);
          *((_QWORD *)v17 - 1) = *((_QWORD *)v20 - 1);
          *(_OWORD *)(v17 - 24) = v22;
          v17 -= 24;
          v20 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v20 - 24);
        }
        while (v20 != v21);
        v20 = v5->_rangeVector.__begin_;
      }
      v5->_rangeVector.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v17;
      v5->_rangeVector.__end_ = v10;
      v5->_rangeVector.__end_cap_.__value_ = v18;
      if (v20)
        operator delete(v20);
    }
    else
    {
      v9 = a3->var0;
      *((_QWORD *)end + 2) = a3->var1;
      *(_NSRange *)end = v9;
      v10 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 24);
    }
    v5->_rangeVector.__end_ = v10;
  }
  return v5;
}

- (CRLWPDirtyRangeArray)initWithRangeVector:(const void *)a3
{
  CRLWPDirtyRangeArray *v4;
  CRLWPDirtyRangeArray *v5;
  char *p_rangeVector;

  v4 = -[CRLWPDirtyRangeArray init](self, "init");
  v5 = v4;
  if (v4)
  {
    p_rangeVector = (char *)&v4->_rangeVector;
    if (&v5->_rangeVector != a3)
      sub_10007D6B8(p_rangeVector, *(char **)a3, *((_QWORD *)a3 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3));
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CRLWPDirtyRangeArray initWithRangeVector:]([CRLWPDirtyRangeArray alloc], "initWithRangeVector:", &self->_rangeVector);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[CRLWPDirtyRangeArray initWithRangeVector:]([CRLWPMutableDirtyRangeArray alloc], "initWithRangeVector:", &self->_rangeVector);
}

- (BOOL)isEmpty
{
  return self->_rangeVector.__begin_ == self->_rangeVector.__end_;
}

- (unint64_t)count
{
  return 0xAAAAAAAAAAAAAAABLL * ((self->_rangeVector.__end_ - self->_rangeVector.__begin_) >> 3);
}

- ($B04355509C8947C2F6D748FEAD01E047)dirtyRangeAtIndex:(SEL)a3
{
  *retstr = *($B04355509C8947C2F6D748FEAD01E047 *)(self->var0.length + 24 * a4);
  return self;
}

- (BOOL)isEqualToDirtyRangeArray:(id)a3
{
  _QWORD *v4;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  _QWORD *v7;
  _BOOL4 v10;

  v4 = a3;
  begin = self->_rangeVector.__begin_;
  end = self->_rangeVector.__end_;
  v7 = (_QWORD *)v4[1];
  if (end - begin == v4[2] - (_QWORD)v7)
  {
    if (begin == end)
    {
      LOBYTE(v10) = 1;
    }
    else
    {
      do
      {
        v10 = *(_QWORD *)begin == *v7 && *((_QWORD *)begin + 1) == v7[1] && *((_QWORD *)begin + 2) == v7[2];
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24);
        v7 += 3;
      }
      while (v10 && begin != end);
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (_NSRange)superRange
{
  NSUInteger v3;
  NSUInteger v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _NSRange result;

  if (-[CRLWPDirtyRangeArray isEmpty](self, "isEmpty"))
  {
    v3 = 0x7FFFFFFFFFFFFFFFLL;
    v4 = 0;
  }
  else
  {
    v5 = *(_QWORD *)self->_rangeVector.__begin_;
    v6 = *((_QWORD *)self->_rangeVector.__end_ - 2) + *((_QWORD *)self->_rangeVector.__end_ - 3);
    if (v5 <= v6)
      v7 = *((_QWORD *)self->_rangeVector.__end_ - 2) + *((_QWORD *)self->_rangeVector.__end_ - 3);
    else
      v7 = *(_QWORD *)self->_rangeVector.__begin_;
    if (v5 >= v6)
      v3 = *((_QWORD *)self->_rangeVector.__end_ - 2) + *((_QWORD *)self->_rangeVector.__end_ - 3);
    else
      v3 = *(_QWORD *)self->_rangeVector.__begin_;
    v4 = v7 - v3;
  }
  result.length = v4;
  result.location = v3;
  return result;
}

- (int64_t)delta
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  int64_t result;

  begin = self->_rangeVector.__begin_;
  end = self->_rangeVector.__end_;
  if (begin == end)
    return 0;
  result = 0;
  do
  {
    result += *((_QWORD *)begin + 2);
    begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24);
  }
  while (begin != end);
  return result;
}

- (unint64_t)indexForRange:(_NSRange)a3
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  unint64_t v5;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v6;
  unint64_t v7;
  NSUInteger *v8;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v9;
  NSUInteger v10;

  begin = self->_rangeVector.__begin_;
  end = self->_rangeVector.__end_;
  if (end == begin)
  {
    v6 = self->_rangeVector.__begin_;
  }
  else
  {
    v5 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 3);
    v6 = self->_rangeVector.__begin_;
    do
    {
      v7 = v5 >> 1;
      v8 = (NSUInteger *)((char *)v6 + 24 * (v5 >> 1));
      v10 = *v8;
      v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v8 + 3);
      v5 += ~(v5 >> 1);
      if (v10 < a3.location)
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
  else if (*(_QWORD *)v6 == a3.location)
  {
    v6 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v6 + 24 * (a3.length < *((_QWORD *)v6 + 1)));
  }
  return 0xAAAAAAAAAAAAAAABLL * ((v6 - begin) >> 3);
}

- (id)dirtyRangesIntersecting:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  CRLWPMutableDirtyRangeArray *v6;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *end;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v9;
  __int128 v10;
  NSUInteger v11;
  uint64_t v12;
  BOOL v14;
  id v15;
  __int128 v17;
  uint64_t v18;
  NSRange v19;

  length = a3.length;
  location = a3.location;
  v6 = objc_opt_new(CRLWPMutableDirtyRangeArray);
  begin = self->_rangeVector.__begin_;
  end = self->_rangeVector.__end_;
  if (begin != end)
  {
    v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24);
    do
    {
      v19.location = location;
      v19.length = length;
      if (!NSIntersectionRange(v19, *(NSRange *)(v9 - 24)).length)
      {
        v11 = *((_QWORD *)v9 - 3);
        v12 = *((_QWORD *)v9 - 2);
        if (v12)
          goto LABEL_12;
        if (v11 < location || v11 - location >= length)
        {
          v12 = 0;
          goto LABEL_12;
        }
      }
      v10 = *(_OWORD *)((char *)v9 - 24);
      v18 = *((_QWORD *)v9 - 1);
      v17 = v10;
      -[CRLWPMutableDirtyRangeArray addRange:allowEmpty:](v6, "addRange:allowEmpty:", &v17, 1);
      v11 = *((_QWORD *)v9 - 3);
      v12 = *((_QWORD *)v9 - 2);
LABEL_12:
      v14 = location + length < v12 + v11 || v9 == end;
      v9 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v9 + 24);
    }
    while (!v14);
  }
  v15 = -[CRLWPMutableDirtyRangeArray copy](v6, "copy");

  return v15;
}

- (void).cxx_destruct
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *begin;

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
