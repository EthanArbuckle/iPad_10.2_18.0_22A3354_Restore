@implementation TSTHiddenDimensionCache

- (TSTHiddenDimensionCache)initWithUserHiddenInformation:(BOOL)a3
{
  _BOOL4 v3;
  TSTHiddenDimensionCache *v4;
  TSTHiddenDimensionCache *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TSTHiddenDimensionCache;
  v4 = -[TSTHiddenDimensionCache init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->mCount = 0;
    v4->mCachedVisible = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
    if (v3)
      v5->mCachedUserVisible = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
    v5->mInvalidRanges = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
    v5->mMarkIndex = 0;
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  self->mCachedVisible = 0;
  self->mCachedUserVisible = 0;

  self->mInvalidRanges = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTHiddenDimensionCache;
  -[TSTHiddenDimensionCache dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  TSTHiddenDimensionCache *v4;

  v4 = -[TSTHiddenDimensionCache init](+[TSTHiddenDimensionCache allocWithZone:](TSTHiddenDimensionCache, "allocWithZone:", a3), "init");
  v4->mCount = self->mCount;
  v4->mCachedVisible = (NSMutableIndexSet *)-[NSMutableIndexSet mutableCopy](self->mCachedVisible, "mutableCopy");
  v4->mCachedUserVisible = (NSMutableIndexSet *)-[NSMutableIndexSet mutableCopy](self->mCachedUserVisible, "mutableCopy");
  v4->mInvalidRanges = (NSMutableIndexSet *)-[NSMutableIndexSet mutableCopy](self->mInvalidRanges, "mutableCopy");
  v4->mMarkIndex = self->mMarkIndex;
  return v4;
}

- (void)setCount:(unint64_t)a3
{
  if (a3 != self->mCount)
  {
    -[TSTHiddenDimensionCache invalidate:](self, "invalidate:");
    self->mCount = a3;
    -[NSMutableIndexSet removeIndexesInRange:](self->mInvalidRanges, "removeIndexesInRange:", a3, ~a3);
    -[NSMutableIndexSet removeIndexesInRange:](self->mCachedVisible, "removeIndexesInRange:", a3, ~a3);
    -[NSMutableIndexSet removeIndexesInRange:](self->mCachedUserVisible, "removeIndexesInRange:", a3, ~a3);
  }
}

- (void)invalidate:(_NSRange)a3
{
  -[NSMutableIndexSet addIndexesInRange:](self->mInvalidRanges, "addIndexesInRange:", a3.location, a3.length);
}

- (BOOL)isIndexHidden:(unint64_t)a3
{
  return -[NSMutableIndexSet containsIndex:](self->mCachedVisible, "containsIndex:", a3) ^ 1;
}

- (BOOL)isIndexUserHidden:(unint64_t)a3
{
  return -[NSMutableIndexSet containsIndex:](self->mCachedUserVisible, "containsIndex:", a3) ^ 1;
}

- (unint64_t)numberHiddenIndicesInRange:(_NSRange)a3
{
  return a3.length
       - -[NSMutableIndexSet countOfIndexesInRange:](self->mCachedVisible, "countOfIndexesInRange:", a3.location);
}

- (unint64_t)numberUserHiddenIndicesInRange:(_NSRange)a3
{
  return a3.length
       - -[NSMutableIndexSet countOfIndexesInRange:](self->mCachedUserVisible, "countOfIndexesInRange:", a3.location);
}

- (BOOL)anyHiddenIndicesInRange:(_NSRange)a3
{
  return -[NSMutableIndexSet containsIndexesInRange:](self->mCachedVisible, "containsIndexesInRange:", a3.location, a3.length) ^ 1;
}

- (BOOL)anyUserHiddenIndicesInRange:(_NSRange)a3
{
  return -[NSMutableIndexSet containsIndexesInRange:](self->mCachedUserVisible, "containsIndexesInRange:", a3.location, a3.length) ^ 1;
}

- (unint64_t)findPreviousVisibleIndex:(unint64_t)a3
{
  return -[NSMutableIndexSet indexLessThanOrEqualToIndex:](self->mCachedVisible, "indexLessThanOrEqualToIndex:", a3);
}

- (unint64_t)findNextVisibleIndex:(unint64_t)a3
{
  return -[NSMutableIndexSet indexGreaterThanOrEqualToIndex:](self->mCachedVisible, "indexGreaterThanOrEqualToIndex:", a3);
}

- (unint64_t)findNthPreviousVisibleIndex:(unint64_t)a3 fromIndex:(unint64_t)a4
{
  NSMutableIndexSet *mCachedVisible;
  unint64_t v5;
  _QWORD v7[6];
  _QWORD v8[4];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = a4;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = a3;
  mCachedVisible = self->mCachedVisible;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__TSTHiddenDimensionCache_findNthPreviousVisibleIndex_fromIndex___block_invoke;
  v7[3] = &unk_24D82F610;
  v7[4] = v8;
  v7[5] = &v9;
  -[NSMutableIndexSet enumerateRangesInRange:options:usingBlock:](mCachedVisible, "enumerateRangesInRange:options:usingBlock:", 0, a4, 2, v7);
  v5 = v10[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __65__TSTHiddenDimensionCache_findNthPreviousVisibleIndex_fromIndex___block_invoke(uint64_t result, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  unint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  if (v4 >= a3)
    v4 = a3;
  if (v4)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
    if (*(_QWORD *)(v5 + 24) >= v4)
    {
      *(_QWORD *)(v5 + 24) = a2 + a3 - v4;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) -= v4;
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
        return result;
    }
    else
    {
      *(_QWORD *)(v5 + 24) = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  *a4 = 1;
  return result;
}

- (unint64_t)findNthNextVisibleIndex:(unint64_t)a3 fromIndex:(unint64_t)a4
{
  uint64_t v7;
  NSMutableIndexSet *mCachedVisible;
  unint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;

  v7 = -[NSMutableIndexSet lastIndex](self->mCachedVisible, "lastIndex") + 1;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = a3;
  mCachedVisible = self->mCachedVisible;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__TSTHiddenDimensionCache_findNthNextVisibleIndex_fromIndex___block_invoke;
  v11[3] = &unk_24D82F610;
  v11[4] = &v12;
  v11[5] = &v16;
  -[NSMutableIndexSet enumerateRangesInRange:options:usingBlock:](mCachedVisible, "enumerateRangesInRange:options:usingBlock:", a4, v7, 0, v11);
  if (v13[3])
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    v17[3] = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = v17[3];
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __61__TSTHiddenDimensionCache_findNthNextVisibleIndex_fromIndex___block_invoke(uint64_t result, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (v5 >= a3)
    v6 = a3;
  else
    v6 = *(_QWORD *)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v5 - v6;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2 + v6 - 1;
    *a4 = 1;
  }
  return result;
}

- (void)setMarkIndex:(unint64_t)a3
{
  self->mMarkIndex = a3;
}

- (unsigned)numberOfVisibleIndicesToMarkIndexFrom:(unint64_t)a3
{
  if (self->mMarkIndex <= a3)
    return -[NSMutableIndexSet countOfIndexesInRange:](self->mCachedVisible, "countOfIndexesInRange:");
  else
    return 0;
}

- (void)setAllValuesToZero
{
  -[NSMutableIndexSet addIndexesInRange:](self->mCachedVisible, "addIndexesInRange:", 0, self->mCount);
  -[NSMutableIndexSet addIndexesInRange:](self->mCachedUserVisible, "addIndexesInRange:", 0, self->mCount);
  -[NSMutableIndexSet removeAllIndexes](self->mInvalidRanges, "removeAllIndexes");
}

- (void)setAllInvalidValuesUsingBlock:(id)a3
{
  NSMutableIndexSet *mInvalidRanges;
  _QWORD v5[6];

  mInvalidRanges = self->mInvalidRanges;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__TSTHiddenDimensionCache_setAllInvalidValuesUsingBlock___block_invoke;
  v5[3] = &unk_24D82F638;
  v5[4] = self;
  v5[5] = a3;
  -[NSMutableIndexSet enumerateIndexesWithOptions:usingBlock:](mInvalidRanges, "enumerateIndexesWithOptions:usingBlock:", 0, v5);
  -[NSMutableIndexSet removeAllIndexes](self->mInvalidRanges, "removeAllIndexes");
}

_QWORD *__57__TSTHiddenDimensionCache_setAllInvalidValuesUsingBlock___block_invoke(_QWORD *result, unint64_t a2)
{
  _QWORD *v3;
  int v4;
  void *v5;

  if (*(_QWORD *)(result[4] + 8) > a2)
  {
    v3 = result;
    v4 = (*(uint64_t (**)(void))(result[5] + 16))();
    v5 = *(void **)(v3[4] + 16);
    if (v4)
    {
      objc_msgSend(v5, "removeIndex:", a2);
      result = *(_QWORD **)(v3[4] + 24);
      if (!result)
        return result;
      if (v4 == 1)
        return (_QWORD *)objc_msgSend(result, "removeIndex:", a2);
    }
    else
    {
      objc_msgSend(v5, "addIndex:", a2);
      result = *(_QWORD **)(v3[4] + 24);
      if (!result)
        return result;
    }
    return (_QWORD *)objc_msgSend(result, "addIndex:", a2);
  }
  return result;
}

- (void)moveRangeFrom:(_NSRange)a3 toIndex:(unint64_t)a4
{
  NSUInteger length;
  NSUInteger location;

  length = a3.length;
  location = a3.location;
  -[NSMutableIndexSet tsu_moveIndexesInRange:toOffset:](self->mCachedVisible, "tsu_moveIndexesInRange:toOffset:");
  -[NSMutableIndexSet tsu_moveIndexesInRange:toOffset:](self->mCachedUserVisible, "tsu_moveIndexesInRange:toOffset:", location, length, a4);
}

- (void)deleteRange:(_NSRange)a3
{
  NSUInteger v4;
  NSUInteger v5;

  v4 = a3.location + a3.length;
  v5 = -a3.length;
  -[NSMutableIndexSet shiftIndexesStartingAtIndex:by:](self->mCachedVisible, "shiftIndexesStartingAtIndex:by:", a3.location + a3.length, -a3.length);
  -[NSMutableIndexSet shiftIndexesStartingAtIndex:by:](self->mCachedUserVisible, "shiftIndexesStartingAtIndex:by:", v4, v5);
  -[NSMutableIndexSet shiftIndexesStartingAtIndex:by:](self->mInvalidRanges, "shiftIndexesStartingAtIndex:by:", v4, v5);
}

- (void)insertRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;

  length = a3.length;
  location = a3.location;
  -[NSMutableIndexSet shiftIndexesStartingAtIndex:by:](self->mCachedVisible, "shiftIndexesStartingAtIndex:by:");
  -[NSMutableIndexSet shiftIndexesStartingAtIndex:by:](self->mCachedUserVisible, "shiftIndexesStartingAtIndex:by:", location, length);
  -[NSMutableIndexSet shiftIndexesStartingAtIndex:by:](self->mInvalidRanges, "shiftIndexesStartingAtIndex:by:", location, length);
  -[TSTHiddenDimensionCache invalidate:](self, "invalidate:", location, length);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  NSMutableIndexSet *mCachedVisible;
  NSMutableIndexSet *mCachedUserVisible;
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  v5 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p count=%d mark=%d"), NSStringFromClass(v4), self, self->mCount, self->mMarkIndex);
  objc_msgSend(v5, "appendString:", CFSTR(" visibleRanges={"));
  v6 = MEMORY[0x24BDAC760];
  mCachedVisible = self->mCachedVisible;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __38__TSTHiddenDimensionCache_description__block_invoke;
  v11[3] = &unk_24D82F138;
  v11[4] = v5;
  -[NSMutableIndexSet enumerateRangesUsingBlock:](mCachedVisible, "enumerateRangesUsingBlock:", v11);
  objc_msgSend(v5, "appendString:", CFSTR("}"));
  if (self->mCachedUserVisible)
  {
    objc_msgSend(v5, "appendString:", CFSTR(" userVisibleRanges={"));
    mCachedUserVisible = self->mCachedUserVisible;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __38__TSTHiddenDimensionCache_description__block_invoke_2;
    v10[3] = &unk_24D82F138;
    v10[4] = v5;
    -[NSMutableIndexSet enumerateRangesUsingBlock:](mCachedUserVisible, "enumerateRangesUsingBlock:", v10);
    objc_msgSend(v5, "appendString:", CFSTR("}"));
  }
  objc_msgSend(v5, "appendString:", CFSTR("}>"));
  return v5;
}

uint64_t __38__TSTHiddenDimensionCache_description__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("{%d-%d},"), a2, (a2 + a3 - 1));
}

uint64_t __38__TSTHiddenDimensionCache_description__block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("{%d-%d},"), a2, (a2 + a3 - 1));
}

- (NSIndexSet)visibleIndices
{
  return &self->mCachedVisible->super;
}

@end
