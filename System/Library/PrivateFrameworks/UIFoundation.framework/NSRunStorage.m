@implementation NSRunStorage

- (unint64_t)count
{
  return self->_count;
}

- (void)replaceElementsInRange:(_NSRange)a3 withElement:(void *)a4 coalesceRuns:(BOOL)a5
{
  NSUInteger v5;
  NSUInteger v6;
  NSRange v7;

  if (a3.length)
  {
    v7.location = v5;
    v7.length = v6;
    _replaceElements((int64x2_t *)self, v7, v6, a4, a5);
  }
}

- (void)_moveGapToBlockIndex:(unint64_t)a3
{
  unint64_t maxBlocks;
  unint64_t numBlocks;
  unint64_t v7;
  unint64_t gapBlockIndex;
  _NSRunBlock *runs;
  unint64_t v10;
  char *v11;
  char *v12;
  size_t v13;
  _NSRunBlock *v14;
  unint64_t v15;

  numBlocks = self->_numBlocks;
  maxBlocks = self->_maxBlocks;
  v7 = maxBlocks - numBlocks;
  if (maxBlocks != numBlocks)
  {
    gapBlockIndex = self->_gapBlockIndex;
    if (gapBlockIndex < a3)
    {
      runs = self->_runs;
      v10 = self->_elementSize + 8;
      v11 = (char *)runs + v10 * (v7 + gapBlockIndex);
      v12 = (char *)runs + v10 * gapBlockIndex;
      v13 = v10 * (a3 - gapBlockIndex);
LABEL_6:
      memmove(v12, v11, v13);
      goto LABEL_7;
    }
    if (gapBlockIndex > a3)
    {
      v14 = self->_runs;
      v15 = self->_elementSize + 8;
      v11 = (char *)v14 + v15 * a3;
      v12 = (char *)v14 + v15 * (maxBlocks - (numBlocks - a3));
      v13 = v15 * (gapBlockIndex - a3);
      goto LABEL_6;
    }
  }
LABEL_7:
  self->_gapBlockIndex = a3;
}

- (void)_ensureCapacity:(unint64_t)a3
{
  unint64_t maxBlocks;
  unint64_t v5;
  unint64_t numBlocks;
  unint64_t gapBlockIndex;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;

  maxBlocks = self->_maxBlocks;
  if (maxBlocks < a3)
  {
    if (maxBlocks >> 16)
      v5 = ((5 * maxBlocks) >> 2) + 1;
    else
      v5 = ((3 * maxBlocks) >> 1) + 1;
    if (maxBlocks <= 0xFFF)
      v5 = (2 * maxBlocks) | 1;
    if (v5 <= a3)
      v5 = a3;
    self->_maxBlocks = v5;
    numBlocks = self->_numBlocks;
    -[NSRunStorage _reallocData:](self, "_reallocData:", (self->_elementSize + 8) * v5);
    gapBlockIndex = self->_gapBlockIndex;
    v8 = self->_numBlocks;
    v9 = v8 > gapBlockIndex;
    v10 = v8 - gapBlockIndex;
    if (v9)
      memmove((char *)self->_runs + (self->_maxBlocks - v10) * (self->_elementSize + 8), (char *)self->_runs + (self->_elementSize + 8) * (maxBlocks - numBlocks + gapBlockIndex), (self->_elementSize + 8) * v10);
  }
}

- (void)_moveGapAndMergeWithBlockRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger gapBlockIndex;

  length = a3.length;
  gapBlockIndex = self->_gapBlockIndex;
  if (gapBlockIndex < a3.location || gapBlockIndex > a3.location + a3.length)
    -[NSRunStorage _moveGapToBlockIndex:](self, "_moveGapToBlockIndex:");
  else
    self->_gapBlockIndex = a3.location;
  self->_numBlocks -= length;
}

- (void)insertElement:(void *)a3 range:(_NSRange)a4 coalesceRuns:(BOOL)a5
{
  NSRange v6;

  if (a4.length)
  {
    v6.location = a4.location;
    v6.length = 0;
    _replaceElements((int64x2_t *)self, v6, a4.length, a3, a5);
  }
}

- (NSRunStorage)initWithElementSize:(unint64_t)a3 capacity:(unint64_t)a4
{
  char *v6;
  NSRunStorage *v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSRunStorage;
  v6 = -[NSRunStorage init](&v10, sel_init);
  v7 = (NSRunStorage *)v6;
  if (v6)
  {
    v8 = 5;
    if (a4 > 5)
      v8 = a4;
    *((_QWORD *)v6 + 3) = 0;
    *((_QWORD *)v6 + 4) = v8;
    *(_OWORD *)(v6 + 40) = xmmword_18D6CBB80;
    *((_QWORD *)v6 + 1) = 0;
    *((_QWORD *)v6 + 2) = a3;
    *((int64x2_t *)v6 + 4) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *((_QWORD *)v6 + 10) = 0;
    *((_QWORD *)v6 + 11) = 0;
    objc_msgSend(v6, "_allocData:", v8 * (a3 + 8));
    if (!v7->_runs)
    {
      -[NSRunStorage dealloc](v7, "dealloc");
      return 0;
    }
  }
  return v7;
}

- (void)_allocData:(unint64_t)a3
{
  self->_runs = (_NSRunBlock *)NSAllocateCollectable(a3, 0);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_runs)
    -[NSRunStorage _deallocData](self, "_deallocData");
  v3.receiver = self;
  v3.super_class = (Class)NSRunStorage;
  -[NSRunStorage dealloc](&v3, sel_dealloc);
}

- (void)_deallocData
{
  free(self->_runs);
  self->_runs = 0;
}

- (void)removeElementsInRange:(_NSRange)a3 coalesceRuns:(BOOL)a4
{
  _replaceElements((int64x2_t *)self, a3, 0, 0, a4);
}

- (void)_reallocData:(unint64_t)a3
{
  self->_runs = (_NSRunBlock *)NSReallocateCollectable(self->_runs, a3, 0);
}

- (NSRunStorage)init
{
  return -[NSRunStorage initWithElementSize:capacity:](self, "initWithElementSize:capacity:", 8, 0);
}

- (NSRunStorage)initWithRunStorage:(id)a3
{
  NSRunStorage *v4;
  NSRunStorage *v5;

  v4 = -[NSRunStorage initWithElementSize:capacity:](self, "initWithElementSize:capacity:", *((_QWORD *)a3 + 2), *((_QWORD *)a3 + 4));
  v5 = v4;
  if (v4)
  {
    v4->_count = *((_QWORD *)a3 + 1);
    v4->_numBlocks = *((_QWORD *)a3 + 3);
    memmove(v4->_runs, *((const void **)a3 + 7), (v4->_elementSize + 8) * v4->_maxBlocks);
    *((_QWORD *)a3 + 11) = v5->_gapBlockIndex;
    *((_QWORD *)a3 + 5) = v5->_indexDeltaStartBlock;
    *((_QWORD *)a3 + 6) = v5->_indexDelta;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithRunStorage:", self);
}

- (unint64_t)elementSize
{
  return self->_elementSize;
}

- (void)elementAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  unint64_t v5;
  unint64_t v6;

  _NSBlockNumberForIndex(self, a3, (__n128 *)a4);
  if (self->_gapBlockIndex <= v5)
    v6 = self->_maxBlocks - self->_numBlocks;
  else
    v6 = 0;
  return &self->_runs->var1[(self->_elementSize + 8) * (v6 + v5)];
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  unint64_t numBlocks;
  uint64_t v6;
  unint64_t i;
  unint64_t v8;
  uint64_t v9;
  int64_t indexDelta;
  unint64_t indexDeltaStartBlock;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NSRunStorage;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@\n"), -[NSRunStorage description](&v13, sel_description));
  objc_msgSend(v3, "appendFormat:", CFSTR("    %lu %lu-byte element(s) in %lu block(s).  Capacity %lu blocks.\n"), self->_count, self->_elementSize, self->_numBlocks, self->_maxBlocks);
  if (self->_indexDeltaStartBlock == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = CFSTR("    Index delta not currently in use.\n");
  }
  else
  {
    indexDelta = self->_indexDelta;
    indexDeltaStartBlock = self->_indexDeltaStartBlock;
    v4 = CFSTR("    Index delta of %ld, starting at block %lu.\n");
  }
  objc_msgSend(v3, "appendFormat:", v4, indexDelta, indexDeltaStartBlock);
  objc_msgSend(v3, "appendFormat:", CFSTR("    Gap at block index %lu.\n"), self->_gapBlockIndex);
  if (self->_numBlocks)
  {
    objc_msgSend(v3, "appendString:", CFSTR("    Block ranges: "));
    numBlocks = self->_numBlocks;
    if (numBlocks)
    {
      v6 = 0;
      for (i = 0; i < numBlocks; ++i)
      {
        if (self->_gapBlockIndex <= i)
          v8 = self->_maxBlocks - numBlocks;
        else
          v8 = 0;
        v9 = *(unint64_t *)((char *)&self->_runs->var0 + (self->_elementSize + 8) * (v8 + i));
        if (i >= self->_indexDeltaStartBlock)
          v9 += self->_indexDelta;
        if (i)
        {
          objc_msgSend(v3, "appendFormat:", CFSTR("%lu: {%lu, %lu}, "), i - 1, v6, v9 - v6);
          numBlocks = self->_numBlocks;
        }
        v6 = v9;
      }
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v3, "appendFormat:", CFSTR("%lu: {%lu, %lu}\n"), numBlocks - 1, v9, self->_count - v9);
  }
  return v3;
}

+ (void)_setConsistencyCheckingEnabled:(BOOL)a3 superCheckEnabled:(BOOL)a4
{
  void *v4;
  unint64_t v5;

  _NSConsistencyCheckEnabled = a3;
  _NSSuperConsistencyCheckEnabled = a4;
  v4 = (void *)_NSPreviousValidDescription;
  while (1)
  {
    v5 = __ldaxr((unint64_t *)&_NSPreviousValidDescription);
    if ((void *)v5 != v4)
      break;
    if (!__stlxr(0, (unint64_t *)&_NSPreviousValidDescription))
    {

      return;
    }
  }
  __clrex();
}

- (void)_consistencyCheck:(int64_t)a3
{
  void *v5;
  id v6;
  unint64_t v7;
  id v8;
  unint64_t numBlocks;
  unint64_t v10;
  char v11;
  char v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t count;
  unint64_t v17;
  char v18;
  int v19;

  if (!a3 && _NSSuperConsistencyCheckEnabled)
  {
    v5 = (void *)_NSPreviousValidDescription;
    v6 = -[NSRunStorage description](self, "description");
    while (1)
    {
      v7 = __ldaxr((unint64_t *)&_NSPreviousValidDescription);
      if ((void *)v7 != v5)
        break;
      if (!__stlxr((unint64_t)v6, (unint64_t *)&_NSPreviousValidDescription))
      {
        v8 = v6;

        goto LABEL_8;
      }
    }
    __clrex();
  }
LABEL_8:
  numBlocks = self->_numBlocks;
  if (numBlocks)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 1;
    if (numBlocks + 1 > 1)
      v15 = numBlocks + 1;
    do
    {
      if (numBlocks == v14)
      {
        count = self->_count;
      }
      else
      {
        if (self->_gapBlockIndex <= v14)
          v17 = self->_maxBlocks - numBlocks;
        else
          v17 = 0;
        count = *(unint64_t *)((char *)&self->_runs->var0 + (self->_elementSize + 8) * (v17 + v14));
        if (self->_indexDeltaStartBlock <= v14)
          count += self->_indexDelta;
      }
      if (v14)
      {
        if (v14 - 1 == self->_cachedBlock
          && (self->_cachedBlockRange.location != v10 || self->_cachedBlockRange.length != count - v10))
        {
          v12 = 1;
        }
        if (count <= v10)
          v11 = 1;
      }
      else if (count)
      {
        v13 = 1;
      }
      ++v14;
      v10 = count;
    }
    while (v15 != v14);
    v18 = v12;
    v19 = v11 & 1;
    if ((v13 & 1) != 0)
      goto LABEL_33;
  }
  else
  {
    v18 = 0;
    v19 = 0;
  }
  if ((v18 & 1) != 0 || v19)
LABEL_33:
    -[NSRunStorage _consistencyError:startAtZeroError:cacheError:inconsistentBlockError:](self, "_consistencyError:startAtZeroError:cacheError:inconsistentBlockError:", a3);
}

- (void)_consistencyError:(int64_t)a3 startAtZeroError:(BOOL)a4 cacheError:(BOOL)a5 inconsistentBlockError:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v10;
  void *v11;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("NSRunStorage inconsistent (outData = %ld):\n"), a3);
  v11 = v10;
  if (v8)
  {
    objc_msgSend(v10, "appendFormat:", CFSTR("    Error: First block's index is not zero.\n"));
    if (!v7)
    {
LABEL_3:
      if (!v6)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if (!v7)
  {
    goto LABEL_3;
  }
  objc_msgSend(v11, "appendFormat:", CFSTR("    Error: Access cache range is invalid.\n"));
  if (v6)
LABEL_4:
    objc_msgSend(v11, "appendFormat:", CFSTR("    Error: A block's index is less than or equal to its preceding block's index.\n"));
LABEL_5:
  if (_NSSuperConsistencyCheckEnabled)
    objc_msgSend(v11, "appendFormat:", CFSTR("    Previous state: %@\n"), _NSPreviousValidDescription);
  objc_msgSend(v11, "appendFormat:", CFSTR("    Current state: %@\n"), -[NSRunStorage description](self, "description"));
  NSLog((NSString *)CFSTR("%@"), v11);
}

@end
