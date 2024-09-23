@implementation OITSURangeList

- (OITSURangeList)initWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  OITSURangeList *v5;
  OITSURangeList *v6;
  _NSRange *begin;

  length = a3.length;
  location = a3.location;
  v5 = -[OITSURangeList init](self, "init");
  v6 = v5;
  if (v5)
  {
    std::vector<_NSRange>::resize((uint64_t)&v5->mRangeList, 1uLL);
    begin = v6->mRangeList.__begin_;
    begin->location = location;
    begin->length = length;
  }
  return v6;
}

- (OITSURangeList)initWithRangeList:(id)a3
{
  OITSURangeList *v4;
  OITSURangeList *v5;
  vector<_NSRange, std::allocator<_NSRange>> *p_mRangeList;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;

  v4 = -[OITSURangeList init](self, "init");
  v5 = v4;
  if (v4)
  {
    p_mRangeList = &v4->mRangeList;
    std::vector<_NSRange>::resize((uint64_t)&v4->mRangeList, objc_msgSend(a3, "count"));
    if (objc_msgSend(a3, "count"))
    {
      v7 = 0;
      v8 = 0;
      do
      {
        v9 = objc_msgSend(a3, "rangeAtIndex:", v8);
        v10 = (uint64_t *)&p_mRangeList->__begin_[v7];
        *v10 = v9;
        v10[1] = v11;
        ++v8;
        ++v7;
      }
      while (v8 < objc_msgSend(a3, "count"));
    }
  }
  return v5;
}

- (OITSURangeList)initWithString:(id)a3
{
  OITSURangeList *v4;
  OITSURangeList *v5;
  unint64_t v6;
  unint64_t v7;
  void **p_begin;
  unint64_t v9;
  NSRange v10;
  _NSRange *value;
  NSRange *end;
  _NSRange *v13;
  NSRange *begin;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  NSRange *v20;
  NSRange *v21;

  v4 = -[OITSURangeList init](self, "init");
  v5 = v4;
  if (a3 && v4 && (unint64_t)objc_msgSend(a3, "length") >= 3 && objc_msgSend(a3, "length"))
  {
    v6 = 0;
    v7 = 0;
    p_begin = (void **)&v5->mRangeList.__begin_;
    do
    {
      v9 = v7;
      if (objc_msgSend(a3, "characterAtIndex:", v7) != 123)
      {
        if (objc_msgSend(a3, "characterAtIndex:", v7) == 125)
        {
          v10 = NSRangeFromString((NSString *)objc_msgSend(a3, "substringWithRange:", v6, v7 - v6 + 1));
          end = v5->mRangeList.__end_;
          value = v5->mRangeList.__end_cap_.__value_;
          if (end >= value)
          {
            begin = (NSRange *)*p_begin;
            v15 = ((char *)end - (_BYTE *)*p_begin) >> 4;
            v16 = v15 + 1;
            if ((unint64_t)(v15 + 1) >> 60)
              std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
            v17 = (char *)value - (char *)begin;
            if (v17 >> 3 > v16)
              v16 = v17 >> 3;
            if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0)
              v18 = 0xFFFFFFFFFFFFFFFLL;
            else
              v18 = v16;
            if (v18)
            {
              v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>((uint64_t)&v5->mRangeList.__end_cap_, v18);
              begin = v5->mRangeList.__begin_;
              end = v5->mRangeList.__end_;
            }
            else
            {
              v19 = 0;
            }
            v20 = (NSRange *)&v19[16 * v15];
            *v20 = v10;
            v21 = v20;
            if (end != begin)
            {
              do
              {
                v21[-1] = end[-1];
                --v21;
                --end;
              }
              while (end != begin);
              begin = (NSRange *)*p_begin;
            }
            v13 = v20 + 1;
            v5->mRangeList.__begin_ = v21;
            v5->mRangeList.__end_ = v20 + 1;
            v5->mRangeList.__end_cap_.__value_ = (_NSRange *)&v19[16 * v18];
            if (begin)
              operator delete(begin);
          }
          else
          {
            *end = v10;
            v13 = end + 1;
          }
          v5->mRangeList.__end_ = v13;
        }
        v9 = v6;
      }
      ++v7;
      v6 = v9;
    }
    while (v7 < objc_msgSend(a3, "length"));
  }
  return v5;
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
      std::vector<std::shared_ptr<TSUStringChunk>>::__throw_length_error[abi:ne180100]();
    v14 = (char *)value - (char *)begin;
    if (v14 >> 3 > v13)
      v13 = v14 >> 3;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
      v15 = 0xFFFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    if (v15)
    {
      v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<TSUStringChunk>>>((uint64_t)p_end_cap, v15);
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
  std::vector<_NSRange>::insert((uint64_t)&self->mRangeList, (char *)&self->mRangeList.__begin_[a4], (char *)&v4);
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

  begin = self->mRangeList.__begin_;
  v5 = self->mRangeList.__end_ - begin;
  if (v5 <= a4)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("IndexOutOfBound"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Getting object at %lu from an array with size %lu"), a3.length, a4, v5), 0));
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
  _NSRange result;

  begin = self->mRangeList.__begin_;
  v4 = self->mRangeList.__end_ - begin;
  if (v4 <= a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("IndexOutOfBound"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Getting object at %lu from an array with size %lu"), a3, v4), 0));
  p_location = &begin[a3].location;
  v6 = *p_location;
  v7 = p_location[1];
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)consolidate
{
  char *begin;
  char *end;
  vector<_NSRange, std::allocator<_NSRange>> *p_mRangeList;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _NSRange *v9;
  _NSRange *v10;
  _BOOL4 v11;
  unint64_t v12;
  NSUInteger location;
  unint64_t v14;
  uint64_t v15;
  NSUInteger *p_length;
  NSUInteger v17;
  _NSRange *v18;
  NSUInteger length;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v22;
  _NSRange *v23;
  BOOL (*v24)(_NSRange, _NSRange);

  p_mRangeList = &self->mRangeList;
  begin = (char *)self->mRangeList.__begin_;
  end = (char *)p_mRangeList->__end_;
  if ((unint64_t)(end - begin) < 0x11)
    return;
  v24 = p_sortFunction;
  v6 = 126 - 2 * __clz((end - begin) >> 4);
  if (end == begin)
    v7 = 0;
  else
    v7 = v6;
  std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(_NSRange,_NSRange),_NSRange*,false>(begin, end, (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))&v24, v7, 1);
  v8 = 0;
  v10 = self->mRangeList.__begin_;
  v9 = self->mRangeList.__end_;
  v11 = v9 != v10;
  if ((unint64_t)((char *)v9 - (char *)v10) >= 0x11 && v9 != v10)
  {
    v8 = 0;
    v12 = v9 - v10;
    location = v10->location;
    v14 = 1;
    while (2)
    {
      if (v12 <= v14 + 1)
        v15 = v14 + 1;
      else
        v15 = v9 - v10;
      p_length = &v10[v14].length;
      while (1)
      {
        v17 = *(p_length - 1);
        if (location != v17)
          break;
        ++v14;
        p_length += 2;
        if (v15 == v14)
        {
          if (v8 >= v12)
            return;
          goto LABEL_25;
        }
      }
      v18 = &v10[v8];
      v20 = v18->location;
      length = v18->length;
      v21 = *p_length;
      if (length + v20 >= v17)
      {
        v22 = v21 + v17;
        if (length + v20 >= v22)
        {
LABEL_20:
          ++v14;
          v11 = v8 < v12;
          if (v14 < v12)
          {
            location = v17;
            if (v8 < v12)
              continue;
          }
          goto LABEL_22;
        }
        v21 = v22 - v20;
      }
      else
      {
        v10[++v8].location = v17;
      }
      break;
    }
    v10[v8].length = v21;
    goto LABEL_20;
  }
LABEL_22:
  if (v11)
  {
LABEL_25:
    v23 = &v10[v8 + 1];
    if (v23 != v9)
      self->mRangeList.__end_ = v23;
  }
}

- (id)stringValue
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  NSRange v8;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("["));
  if (-[OITSURangeList count](self, "count"))
  {
    v4 = 0;
    v5 = 1;
    do
    {
      if (v5 != 1)
        objc_msgSend(v3, "appendString:", CFSTR(","));
      v8.location = -[OITSURangeList rangeAtIndex:](self, "rangeAtIndex:", v4);
      objc_msgSend(v3, "appendString:", NSStringFromRange(v8));
      v4 = v5;
    }
    while (-[OITSURangeList count](self, "count") > v5++);
  }
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return v3;
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
