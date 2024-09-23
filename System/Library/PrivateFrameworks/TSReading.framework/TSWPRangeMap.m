@implementation TSWPRangeMap

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

- (TSWPRangeMap)initWithSubRange:(_NSRange)a3 unmappedPairIndexes:(const void *)a4
{
  NSUInteger length;
  NSUInteger location;
  TSWPRangeMap *v7;
  TSWPRangeMap *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _TSWPCharIndexAndAffinity *end;
  _TSWPCharIndexAndAffinity *begin;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  BOOL v22;
  NSUInteger v23;
  void *v25;
  uint64_t v26;
  char *v27;
  char *v28;

  length = a3.length;
  location = a3.location;
  v7 = -[TSWPRangeMap initWithSubRange:unmappedIndexes:affinity:](self, "initWithSubRange:unmappedIndexes:affinity:", a3.location, a3.length, a4, 0);
  v8 = v7;
  if (v7)
  {
    v7->_subRange.location = location;
    v7->_subRange.length = length;
    v9 = *((_QWORD *)a4 + 1) - *(_QWORD *)a4;
    v10 = v9 >> 3;
    if ((v9 & 8) != 0)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRangeMap initWithSubRange:unmappedPairIndexes:]");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRangeMap.mm"), 43, CFSTR("expected an even number of indexes"));
    }
    begin = v8->_unmappedIndexes.__begin_;
    end = v8->_unmappedIndexes.__end_;
    if (v10 != (end - begin) >> 4 || v10 != (v8->_mappedIndexes.__end_ - v8->_mappedIndexes.__begin_) >> 4)
    {
      v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRangeMap initWithSubRange:unmappedPairIndexes:]");
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRangeMap.mm"), 45, CFSTR("index vector size is wrong"));
      begin = v8->_unmappedIndexes.__begin_;
      end = v8->_unmappedIndexes.__end_;
    }
    if (end != begin)
    {
      v17 = 0;
      v18 = 0;
      do
      {
        v19 = *(_QWORD *)(*(_QWORD *)a4 + 8 * v18);
        v20 = v8->_subRange.location;
        v21 = v8->_subRange.length;
        v22 = v19 - v20 < v21 && v19 >= v20;
        v23 = v21 + v20;
        if (!v22 && v19 != v23)
        {
          v25 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRangeMap initWithSubRange:unmappedPairIndexes:]");
          objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRangeMap.mm"), 50, CFSTR("index is out of bounds"));
          begin = v8->_unmappedIndexes.__begin_;
          end = v8->_unmappedIndexes.__end_;
        }
        v27 = (char *)begin + v17;
        *((_DWORD *)v27 + 2) = 2;
        *((_DWORD *)v27 + 6) = 1;
        v28 = (char *)v8->_mappedIndexes.__begin_ + v17;
        *((_DWORD *)v28 + 2) = 2;
        *((_DWORD *)v28 + 6) = 1;
        v18 += 2;
        v17 += 32;
      }
      while (v18 < (end - begin) >> 4);
    }
  }
  return v8;
}

- (TSWPRangeMap)initWithSubRange:(_NSRange)a3 unmappedIndexes:(const void *)a4 affinity:(int)a5
{
  NSUInteger length;
  NSUInteger location;
  TSWPRangeMap *v9;
  TSWPRangeMap *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  vector<_TSWPCharIndexAndAffinity, std::allocator<_TSWPCharIndexAndAffinity>> *p_mappedIndexes;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  BOOL v20;
  NSUInteger v21;
  void *v23;
  uint64_t v24;
  _TSWPCharIndexAndAffinity *end;
  _TSWPCharIndexAndAffinity *value;
  _TSWPCharIndexAndAffinity *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  char *v33;
  _TSWPCharIndexAndAffinity *v34;
  _TSWPCharIndexAndAffinity *begin;
  _TSWPCharIndexAndAffinity *v36;
  NSUInteger v37;
  _TSWPCharIndexAndAffinity *v38;
  _TSWPCharIndexAndAffinity *v39;
  _TSWPCharIndexAndAffinity *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  char *v46;
  _TSWPCharIndexAndAffinity *v47;
  _TSWPCharIndexAndAffinity *v48;
  _TSWPCharIndexAndAffinity *v49;
  vector<_TSWPCharIndexAndAffinity, std::allocator<_TSWPCharIndexAndAffinity>> *p_unmappedIndexes;
  objc_super v52;

  length = a3.length;
  location = a3.location;
  v52.receiver = self;
  v52.super_class = (Class)TSWPRangeMap;
  v9 = -[TSWPRangeMap init](&v52, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_subRange.location = location;
    v9->_subRange.length = length;
    v12 = *(_QWORD *)a4;
    v11 = *((_QWORD *)a4 + 1);
    v13 = (v11 - *(_QWORD *)a4) >> 3;
    p_unmappedIndexes = &v9->_unmappedIndexes;
    std::vector<_TSWPCharIndexAndAffinity>::reserve((void **)&v9->_unmappedIndexes.__begin_, v13);
    p_mappedIndexes = &v10->_mappedIndexes;
    std::vector<_TSWPCharIndexAndAffinity>::reserve((void **)&v10->_mappedIndexes.__begin_, v13);
    if (v11 != v12)
    {
      v15 = 0;
      if (v13 <= 1)
        v16 = 1;
      else
        v16 = v13;
      do
      {
        v17 = *(_QWORD *)(*(_QWORD *)a4 + 8 * v15);
        v18 = v10->_subRange.location;
        v19 = v10->_subRange.length;
        v20 = v17 - v18 < v19 && v17 >= v18;
        v21 = v19 + v18;
        if (!v20 && v17 != v21)
        {
          v23 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRangeMap initWithSubRange:unmappedIndexes:affinity:]");
          objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRangeMap.mm"), 81, CFSTR("index is out of bounds"));
        }
        end = v10->_unmappedIndexes.__end_;
        value = v10->_unmappedIndexes.__end_cap_.__value_;
        if (end >= value)
        {
          v28 = (end - p_unmappedIndexes->__begin_) >> 4;
          v29 = v28 + 1;
          if ((unint64_t)(v28 + 1) >> 60)
            goto LABEL_48;
          v30 = value - p_unmappedIndexes->__begin_;
          if (v30 >> 3 > v29)
            v29 = v30 >> 3;
          if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF0)
            v31 = 0xFFFFFFFFFFFFFFFLL;
          else
            v31 = v29;
          if (v31)
            v32 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)&v10->_unmappedIndexes.__end_cap_, v31);
          else
            v32 = 0;
          v33 = &v32[16 * v28];
          *(_QWORD *)v33 = v17;
          *((_DWORD *)v33 + 2) = a5;
          *((_DWORD *)v33 + 3) = 0;
          begin = v10->_unmappedIndexes.__begin_;
          v34 = v10->_unmappedIndexes.__end_;
          v36 = (_TSWPCharIndexAndAffinity *)v33;
          if (v34 != begin)
          {
            do
            {
              *((_OWORD *)v36 - 1) = *((_OWORD *)v34 - 1);
              v36 = (_TSWPCharIndexAndAffinity *)((char *)v36 - 16);
              v34 = (_TSWPCharIndexAndAffinity *)((char *)v34 - 16);
            }
            while (v34 != begin);
            v34 = p_unmappedIndexes->__begin_;
          }
          v27 = (_TSWPCharIndexAndAffinity *)(v33 + 16);
          v10->_unmappedIndexes.__begin_ = v36;
          v10->_unmappedIndexes.__end_ = (_TSWPCharIndexAndAffinity *)(v33 + 16);
          v10->_unmappedIndexes.__end_cap_.__value_ = (_TSWPCharIndexAndAffinity *)&v32[16 * v31];
          if (v34)
            operator delete(v34);
        }
        else
        {
          *(_QWORD *)end = v17;
          v27 = (_TSWPCharIndexAndAffinity *)((char *)end + 16);
          *((_DWORD *)end + 2) = a5;
          *((_DWORD *)end + 3) = 0;
        }
        v10->_unmappedIndexes.__end_ = v27;
        v37 = v17 - v10->_subRange.location + v15;
        v38 = v10->_mappedIndexes.__end_;
        v39 = v10->_mappedIndexes.__end_cap_.__value_;
        if (v38 >= v39)
        {
          v41 = (v38 - p_mappedIndexes->__begin_) >> 4;
          v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 60)
LABEL_48:
            abort();
          v43 = v39 - p_mappedIndexes->__begin_;
          if (v43 >> 3 > v42)
            v42 = v43 >> 3;
          if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0)
            v44 = 0xFFFFFFFFFFFFFFFLL;
          else
            v44 = v42;
          if (v44)
            v45 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)&v10->_mappedIndexes.__end_cap_, v44);
          else
            v45 = 0;
          v46 = &v45[16 * v41];
          *(_QWORD *)v46 = v37;
          *((_DWORD *)v46 + 2) = a5;
          *((_DWORD *)v46 + 3) = 0;
          v48 = v10->_mappedIndexes.__begin_;
          v47 = v10->_mappedIndexes.__end_;
          v49 = (_TSWPCharIndexAndAffinity *)v46;
          if (v47 != v48)
          {
            do
            {
              *((_OWORD *)v49 - 1) = *((_OWORD *)v47 - 1);
              v49 = (_TSWPCharIndexAndAffinity *)((char *)v49 - 16);
              v47 = (_TSWPCharIndexAndAffinity *)((char *)v47 - 16);
            }
            while (v47 != v48);
            v47 = p_mappedIndexes->__begin_;
          }
          v40 = (_TSWPCharIndexAndAffinity *)(v46 + 16);
          v10->_mappedIndexes.__begin_ = v49;
          v10->_mappedIndexes.__end_ = (_TSWPCharIndexAndAffinity *)(v46 + 16);
          v10->_mappedIndexes.__end_cap_.__value_ = (_TSWPCharIndexAndAffinity *)&v45[16 * v44];
          if (v47)
            operator delete(v47);
        }
        else
        {
          *(_QWORD *)v38 = v37;
          v40 = (_TSWPCharIndexAndAffinity *)((char *)v38 + 16);
          *((_DWORD *)v38 + 2) = a5;
          *((_DWORD *)v38 + 3) = 0;
        }
        v10->_mappedIndexes.__end_ = v40;
        ++v15;
      }
      while (v15 != v16);
    }
  }
  return v10;
}

- (void).cxx_destruct
{
  _TSWPCharIndexAndAffinity *begin;
  _TSWPCharIndexAndAffinity *v4;

  begin = self->_mappedIndexes.__begin_;
  if (begin)
  {
    self->_mappedIndexes.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_unmappedIndexes.__begin_;
  if (v4)
  {
    self->_unmappedIndexes.__end_ = v4;
    operator delete(v4);
  }
}

- (_NSRange)unmappedCharRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;
  NSUInteger v7;
  unint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v6 = -[TSWPRangeMap unmappedCharIndex:](self, "unmappedCharIndex:");
  v7 = v6;
  if (length)
    v8 = -[TSWPRangeMap unmappedCharIndex:](self, "unmappedCharIndex:", length + location - 1) + 1;
  else
    v8 = v6;
  if (v7 <= v8)
    v9 = v8;
  else
    v9 = v7;
  if (v7 >= v8)
    v10 = v8;
  else
    v10 = v7;
  v11 = v9 - v10;
  result.length = v11;
  result.location = v10;
  return result;
}

- (unint64_t)unmappedCharIndex:(unint64_t)a3
{
  unint64_t v3;
  void *v5;
  uint64_t v6;
  _TSWPCharIndexAndAffinity *begin;
  _TSWPCharIndexAndAffinity *end;
  unint64_t v9;
  _TSWPCharIndexAndAffinity *v10;
  unint64_t v11;
  _QWORD *v12;
  _TSWPCharIndexAndAffinity *v13;
  unint64_t v14;
  int v15;
  void *v17;
  uint64_t v18;

  v3 = a3;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRangeMap unmappedCharIndex:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRangeMap.mm"), 121, CFSTR("shouldn't be trying to map NSNotFound"));
  }
  begin = self->_mappedIndexes.__begin_;
  end = self->_mappedIndexes.__end_;
  if (end == begin)
  {
    v10 = self->_mappedIndexes.__end_;
  }
  else
  {
    v9 = (end - begin) >> 4;
    v10 = self->_mappedIndexes.__begin_;
    do
    {
      v11 = v9 >> 1;
      v12 = (_QWORD *)((char *)v10 + 16 * (v9 >> 1));
      v14 = *v12;
      v13 = (_TSWPCharIndexAndAffinity *)(v12 + 2);
      v9 += ~(v9 >> 1);
      if (v14 < v3)
        v10 = v13;
      else
        v9 = v11;
    }
    while (v9);
  }
  if (end == v10 || *(_QWORD *)v10 != v3)
    return v3 - ((v10 - begin) >> 4) + self->_subRange.location;
  v15 = *((_DWORD *)v10 + 2);
  if (v15 == 2)
  {
    ++v3;
  }
  else if (v15 == 1)
  {
    --v3;
  }
  else
  {
    v17 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRangeMap unmappedCharIndex:]");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRangeMap.mm"), 140, CFSTR("bad affinity"));
  }
  return -[TSWPRangeMap unmappedCharIndex:](self, "unmappedCharIndex:", v3);
}

- (_NSRange)mappedCharRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSRange v12;
  _NSRange result;
  NSRange subRange;

  length = a3.length;
  location = a3.location;
  subRange = self->_subRange;
  v12.location = location;
  v12.length = length;
  if (NSIntersectionRange(v12, subRange).length)
  {
    if (location <= self->_subRange.location)
      v6 = self->_subRange.location;
    else
      v6 = location;
    v7 = -[TSWPRangeMap p_extendLeftMappedIndex:](self, "p_extendLeftMappedIndex:", -[TSWPRangeMap mappedCharIndex:](self, "mappedCharIndex:", v6));
    v8 = location + length;
    v9 = self->_subRange.length;
    if (v9 + self->_subRange.location < location + length)
      v8 = v9 + self->_subRange.location;
    v10 = -[TSWPRangeMap p_extendRightMappedIndex:](self, "p_extendRightMappedIndex:", -[TSWPRangeMap mappedCharIndex:](self, "mappedCharIndex:", v8 - 1))- v7+ 1;
  }
  else if (location >= self->_subRange.location)
  {
    v10 = 0;
    v7 = self->_subRange.length + ((self->_mappedIndexes.__end_ - self->_mappedIndexes.__begin_) >> 4);
  }
  else
  {
    v7 = 0;
    v10 = 0;
  }
  v11 = v7;
  result.length = v10;
  result.location = v11;
  return result;
}

- (unint64_t)mappedCharIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  NSUInteger v7;
  _TSWPCharIndexAndAffinity *begin;
  _TSWPCharIndexAndAffinity *end;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  _TSWPCharIndexAndAffinity *v14;
  unint64_t v15;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRangeMap mappedCharIndex:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRangeMap.mm"), 102, CFSTR("shouldn't be trying to map NSNotFound"));
  }
  v7 = a3 - self->_subRange.location;
  if (v7 > self->_subRange.length)
    return 0x7FFFFFFFFFFFFFFFLL;
  begin = self->_unmappedIndexes.__begin_;
  end = self->_unmappedIndexes.__end_;
  if (end != begin)
  {
    v11 = (end - begin) >> 4;
    end = self->_unmappedIndexes.__begin_;
    do
    {
      v12 = v11 >> 1;
      v13 = (unint64_t *)((char *)end + 16 * (v11 >> 1));
      v15 = *v13;
      v14 = (_TSWPCharIndexAndAffinity *)(v13 + 2);
      v11 += ~(v11 >> 1);
      if (v15 > a3)
        v11 = v12;
      else
        end = v14;
    }
    while (v11);
  }
  return v7 + ((end - begin) >> 4);
}

- (unint64_t)p_extendRightMappedIndex:(unint64_t)a3
{
  _TSWPCharIndexAndAffinity *begin;
  _TSWPCharIndexAndAffinity *end;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  _TSWPCharIndexAndAffinity *v9;
  unint64_t v10;

  begin = self->_mappedIndexes.__begin_;
  end = self->_mappedIndexes.__end_;
  v5 = a3 + 1;
  if (end != begin)
  {
    v6 = (end - begin) >> 4;
    do
    {
      v7 = v6 >> 1;
      v8 = (_QWORD *)((char *)begin + 16 * (v6 >> 1));
      v10 = *v8;
      v9 = (_TSWPCharIndexAndAffinity *)(v8 + 2);
      v6 += ~(v6 >> 1);
      if (v10 < v5)
        begin = v9;
      else
        v6 = v7;
    }
    while (v6);
  }
  if (begin != end && *(_QWORD *)begin == v5 && *((_DWORD *)begin + 2) == 1)
    ++a3;
  return a3;
}

- (unint64_t)p_extendLeftMappedIndex:(unint64_t)a3
{
  _TSWPCharIndexAndAffinity *begin;
  _TSWPCharIndexAndAffinity *end;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  _TSWPCharIndexAndAffinity *v9;
  unint64_t v10;

  if (a3)
  {
    begin = self->_mappedIndexes.__begin_;
    end = self->_mappedIndexes.__end_;
    v5 = a3 - 1;
    if (end != begin)
    {
      v6 = (end - begin) >> 4;
      do
      {
        v7 = v6 >> 1;
        v8 = (_QWORD *)((char *)begin + 16 * (v6 >> 1));
        v10 = *v8;
        v9 = (_TSWPCharIndexAndAffinity *)(v8 + 2);
        v6 += ~(v6 >> 1);
        if (v10 < v5)
          begin = v9;
        else
          v6 = v7;
      }
      while (v6);
    }
    if (begin != end && *(_QWORD *)begin == v5 && *((_DWORD *)begin + 2) == 2)
      --a3;
  }
  return a3;
}

- (void)adjustByDelta:(int64_t)a3
{
  _TSWPCharIndexAndAffinity *begin;
  _TSWPCharIndexAndAffinity *end;

  self->_subRange.location += a3;
  begin = self->_unmappedIndexes.__begin_;
  end = self->_unmappedIndexes.__end_;
  while (begin != end)
  {
    *(_QWORD *)begin += a3;
    begin = (_TSWPCharIndexAndAffinity *)((char *)begin + 16);
  }
}

@end
