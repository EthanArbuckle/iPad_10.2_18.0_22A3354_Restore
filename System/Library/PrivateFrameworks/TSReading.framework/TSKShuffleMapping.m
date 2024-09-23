@implementation TSKShuffleMapping

- (TSKShuffleMapping)initWithStartIndex:(unsigned __int16)a3 endIndex:(unsigned __int16)a4 mapping:(unsigned __int16 *)a5
{
  TSKShuffleMapping *v8;
  TSKShuffleMapping *v9;
  uint64_t v10;
  unsigned __int16 *v11;
  uint64_t i;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSKShuffleMapping;
  v8 = -[TSKShuffleMapping init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->mStartIndex = a3;
    v8->mEndIndex = a4;
    *(_WORD *)&v8->mIsVertical = 1;
    v10 = (unsigned __int16)(a4 - a3 + 1);
    v11 = (unsigned __int16 *)malloc_type_malloc(2 * v10, 0x1000040BDFB0063uLL);
    v9->mMapping = v11;
    if (a5)
    {
      memcpy(v11, a5, 2 * v10);
    }
    else if ((_DWORD)v10)
    {
      for (i = 0; i != v10; ++i)
        v11[i] = i;
    }
  }
  return v9;
}

- (TSKShuffleMapping)initWithStartIndex:(unsigned __int16)a3 endIndex:(unsigned __int16)a4
{
  return -[TSKShuffleMapping initWithStartIndex:endIndex:mapping:](self, "initWithStartIndex:endIndex:mapping:", a3, a4, 0);
}

- (id)initForMovedIndicesStartingAtIndex:(unsigned __int16)a3 destinationIndex:(unsigned __int16)a4 numberOfIndices:(unsigned __int16)a5 vertical:(BOOL)a6
{
  int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v11;
  unsigned __int16 v12;
  void *v13;
  void *v14;
  __int16 v15;
  __int16 v16;
  unsigned int v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t j;
  TSKShuffleMapping *v22;
  TSKShuffleMapping *v23;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v11 = a5 + a3;
  if (a4 <= a3)
    v12 = a5 + a3;
  else
    v12 = a4;
  v13 = malloc_type_malloc(2 * v12, 0x1000040BDFB0063uLL);
  v14 = v13;
  if (v7)
  {
    if (v8 <= v9)
      v15 = 0;
    else
      v15 = v7;
    v16 = v8 - v9 - v15;
    v17 = v9;
    do
    {
      *((_WORD *)v13 + (unsigned __int16)v17) = v16 + v17;
      ++v17;
    }
    while (v11 > (unsigned __int16)v17);
  }
  if (v8 <= v9)
  {
    if (v8 >= v9)
      goto LABEL_23;
    v19 = v8;
    do
    {
      *((_WORD *)v13 + v19) = v19 + v7;
      ++v19;
    }
    while (v9 != v19);
  }
  else
  {
    if (v8 <= (unsigned __int16)v11)
      goto LABEL_19;
    v18 = (unsigned __int16)v11;
    do
    {
      *((_WORD *)v13 + v18) = v18 - v7;
      ++v18;
    }
    while (v18 < v8);
  }
  if (v8 > v9)
  {
LABEL_19:
    if (v9)
    {
      for (i = 0; i != v9; ++i)
        *((_WORD *)v13 + i) = i;
    }
    goto LABEL_26;
  }
LABEL_23:
  if (v8)
  {
    for (j = 0; j != v8; ++j)
      *((_WORD *)v13 + j) = j;
  }
LABEL_26:
  v22 = -[TSKShuffleMapping initWithStartIndex:endIndex:mapping:](self, "initWithStartIndex:endIndex:mapping:", 0, (unsigned __int16)(v12 - 1), v13);
  v23 = v22;
  if (v22)
  {
    v22->mIsVertical = a6;
    v22->mIsMoveOperation = 1;
    v22->mFirstMovedIndex = v9;
    v22->mDestinationIndexForMove = v8;
    v22->mNumberOfIndicesMoved = v7;
  }
  free(v14);
  return v23;
}

- (void)dealloc
{
  objc_super v3;

  free(self->mMapping);
  v3.receiver = self;
  v3.super_class = (Class)TSKShuffleMapping;
  -[TSKShuffleMapping dealloc](&v3, sel_dealloc);
}

- (unsigned)mappingSize
{
  return self->mEndIndex - self->mStartIndex + 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[TSKShuffleMapping initWithStartIndex:endIndex:mapping:](+[TSKShuffleMapping allocWithZone:](TSKShuffleMapping, "allocWithZone:", a3), "initWithStartIndex:endIndex:mapping:", self->mStartIndex, self->mEndIndex, self->mMapping);
  if (result)
  {
    *((_BYTE *)result + 24) = self->mIsVertical;
    *((_BYTE *)result + 25) = self->mIsMoveOperation;
    *((_WORD *)result + 13) = self->mFirstMovedIndex;
    *((_WORD *)result + 14) = self->mDestinationIndexForMove;
    *((_WORD *)result + 15) = self->mNumberOfIndicesMoved;
  }
  return result;
}

- (id)copyInverse
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int16 *mMapping;

  v3 = (void *)-[TSKShuffleMapping copy](self, "copy");
  v4 = -[TSKShuffleMapping mappingSize](self, "mappingSize");
  v5 = objc_msgSend(v3, "mapping");
  if (v4)
  {
    v6 = 0;
    mMapping = self->mMapping;
    do
    {
      *(_WORD *)(v5 + 2 * mMapping[v6]) = v6;
      ++v6;
    }
    while (v4 != v6);
  }
  return v3;
}

- (unsigned)mapIndex:(unsigned __int16)a3
{
  uint64_t mStartIndex;

  mStartIndex = self->mStartIndex;
  if (mStartIndex <= a3 && self->mEndIndex >= a3)
    return self->mMapping[a3 - mStartIndex] + mStartIndex;
  return a3;
}

- (unsigned)reverseMapIndex:(unsigned __int16)a3
{
  unsigned int v3;
  unsigned int v5;
  unsigned int mStartIndex;
  unsigned __int16 v8;

  v3 = a3;
  v5 = -[TSKShuffleMapping mappingSize](self, "mappingSize");
  mStartIndex = self->mStartIndex;
  if (mStartIndex <= v3 && self->mEndIndex >= v3 && v5 != 0)
  {
    v8 = 0;
    while (v3 - mStartIndex != self->mMapping[v8])
    {
      if (v5 <= ++v8)
        return v3;
    }
    LOWORD(v3) = v8 + mStartIndex;
  }
  return v3;
}

- (BOOL)isVertical
{
  return self->mIsVertical;
}

- (BOOL)isMove
{
  return self->mNumberOfIndicesMoved != 0;
}

- (void)enumerateMappingRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length;
  unint64_t location;
  NSRange v8;
  int v9;
  NSUInteger v10;
  unint64_t v11;
  NSRange v12;
  NSRange v13;

  length = a3.length;
  location = a3.location;
  v13.location = self->mStartIndex;
  v13.length = self->mEndIndex - v13.location;
  v12.location = location;
  v12.length = length;
  v8 = NSIntersectionRange(v12, v13);
  if (location < 0x10000)
  {
    v10 = location;
    v9 = location;
  }
  else
  {
    v9 = location;
    do
    {
      (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, (unsigned __int16)v9, (unsigned __int16)v9);
      ++v9;
    }
    while (location > (unsigned __int16)v9);
    v10 = (unsigned __int16)v9;
  }
  if (v8.location + v8.length > v10)
  {
    do
    {
      (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, (unsigned __int16)v9++, self->mMapping[v10]);
      v10 = (unsigned __int16)v9;
    }
    while (v8.location + v8.length > (unsigned __int16)v9);
  }
  v11 = location + length;
  if (v11 > v10)
  {
    do
    {
      (*((void (**)(id, _QWORD, _QWORD))a4 + 2))(a4, (unsigned __int16)v9, (unsigned __int16)v9);
      ++v9;
    }
    while (v11 > (unsigned __int16)v9);
  }
}

- (void)insert:(unsigned __int16)a3 indicesAtIndex:(unsigned __int16)a4 insertingBefore:(BOOL)a5
{
  unsigned int mStartIndex;
  BOOL v6;
  unsigned __int16 v7;
  unsigned int v9;
  unsigned __int16 v10;
  unsigned __int16 v11;
  unsigned int v12;
  unsigned __int16 *mMapping;
  uint64_t v14;
  unsigned __int16 *v15;
  unsigned int v16;
  unsigned __int16 v17;
  unsigned __int16 *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64x2_t v22;
  unsigned __int16 *v23;
  int64x2_t v24;
  int64x2_t v25;
  int32x2_t v26;

  mStartIndex = self->mStartIndex;
  v6 = a4 >= mStartIndex;
  v7 = a4 - mStartIndex;
  if (v6 && self->mEndIndex >= a4)
  {
    v9 = a3;
    if (a5)
    {
      v10 = self->mMapping[v7];
      v11 = v7;
    }
    else
    {
      v11 = v7 + 1;
      v10 = self->mMapping[v7] + 1;
    }
    v12 = -[TSKShuffleMapping mappingSize](self, "mappingSize");
    mMapping = self->mMapping;
    if (v12)
    {
      v14 = v12;
      v15 = self->mMapping;
      do
      {
        v16 = *v15;
        if (v16 >= v10)
          *v15 = v16 + v9;
        ++v15;
        --v14;
      }
      while (v14);
    }
    v17 = v12 + v9;
    self->mEndIndex += v9;
    v18 = (unsigned __int16 *)malloc_type_realloc(mMapping, 2 * (unsigned __int16)(v12 + v9), 0x1000040BDFB0063uLL);
    self->mMapping = v18;
    if (!v18)
    {
      v19 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v20 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKShuffleMapping insert:indicesAtIndex:insertingBefore:]");
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKShuffleMapping.mm"), 327, CFSTR("shuffle mapping couldn't grow mapping table!"));
      v18 = self->mMapping;
    }
    memmove(&v18[v9 + v11], &v18[v11], 2 * (int)(v17 - (v9 + v11)));
    if (v9)
    {
      v21 = 0;
      v22 = (uint64x2_t)vdupq_n_s64((unint64_t)v9 - 1);
      v23 = &self->mMapping[v11];
      v24 = (int64x2_t)xmmword_217C27AF0;
      v25 = vdupq_n_s64(2uLL);
      do
      {
        v26 = vmovn_s64((int64x2_t)vcgeq_u64(v22, (uint64x2_t)v24));
        if ((v26.i8[0] & 1) != 0)
          v23[v21] = v10 + v21;
        if ((v26.i8[4] & 1) != 0)
          v23[v21 + 1] = v10 + (v21 | 1);
        v21 += 2;
        v24 = vaddq_s64(v24, v25);
      }
      while (((v9 + 1) & 0x1FFFE) != v21);
    }
  }
}

- (void)remove:(unsigned __int16)a3 indicesAtIndex:(unsigned __int16)a4
{
  unsigned int mStartIndex;
  unsigned __int16 v5;
  unsigned int mEndIndex;
  BOOL v8;
  unsigned int v9;
  unsigned __int16 v10;
  unsigned int v11;
  __int16 v12;
  unsigned int v13;
  unsigned __int16 *mMapping;
  unsigned __int16 v15;
  uint64_t v16;
  unsigned __int16 *v17;
  unsigned int v18;
  unsigned __int16 *v19;
  void *v20;
  uint64_t v21;

  mStartIndex = self->mStartIndex;
  v5 = a4 - mStartIndex;
  if (a4 >= mStartIndex)
  {
    mEndIndex = self->mEndIndex;
    v8 = mEndIndex >= a4;
    v9 = mEndIndex - a4;
    if (v8)
    {
      if ((int)(v9 + 1) < a3)
        v10 = v9 + 1;
      else
        v10 = a3;
      v11 = -[TSKShuffleMapping mappingSize](self, "mappingSize");
      v12 = v11;
      v13 = v10 + v5;
      if (v10)
      {
        mMapping = self->mMapping;
        v15 = v5;
        do
        {
          v16 = v11;
          v17 = mMapping;
          if (v11)
          {
            do
            {
              v18 = *v17;
              if (v18 > mMapping[v15])
                *v17 = v18 - 1;
              ++v17;
              --v16;
            }
            while (v16);
          }
          mMapping[v15++] = 0;
        }
        while (v13 > v15);
      }
      else
      {
        mMapping = self->mMapping;
      }
      memmove(&mMapping[v5], &mMapping[v13], 2 * (int)(v11 - v13));
      self->mEndIndex -= v10;
      v19 = (unsigned __int16 *)malloc_type_realloc(self->mMapping, 2 * (unsigned __int16)(v12 - v10), 0x1000040BDFB0063uLL);
      self->mMapping = v19;
      if (!v19)
      {
        v20 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKShuffleMapping remove:indicesAtIndex:]");
        objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKShuffleMapping.mm"), 384, CFSTR("shuffle mapping couldn't shrink translation table!"));
      }
    }
  }
}

- (void)swapIndex:(unsigned __int16)a3 withIndex:(unsigned __int16)a4
{
  unsigned int mStartIndex;
  unsigned int mEndIndex;
  BOOL v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  unsigned __int16 *mMapping;
  uint64_t v14;
  unsigned __int16 v15;
  uint64_t v16;

  mStartIndex = self->mStartIndex;
  if (mStartIndex > a3
    || ((mEndIndex = self->mEndIndex, mEndIndex >= a4) ? (v9 = mStartIndex > a4) : (v9 = 1),
        !v9 ? (v10 = mEndIndex >= a3) : (v10 = 0),
        !v10))
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKShuffleMapping swapIndex:withIndex:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKShuffleMapping.mm"), 395, CFSTR("Can't swap indices outside of mapping range!"));
    LOWORD(mStartIndex) = self->mStartIndex;
  }
  mMapping = self->mMapping;
  v14 = (unsigned __int16)(a3 - mStartIndex);
  v15 = mMapping[v14];
  v16 = (unsigned __int16)(a4 - mStartIndex);
  mMapping[v14] = mMapping[v16];
  mMapping[v16] = v15;
}

- (unsigned)startIndex
{
  return self->mStartIndex;
}

- (unsigned)endIndex
{
  return self->mEndIndex;
}

- (unsigned)mapping
{
  return self->mMapping;
}

@end
