@implementation TSWPDeletionRangeMap

- (TSWPDeletionRangeMap)initWithSubRange:(_NSRange)a3 removeRanges:(id)a4
{
  NSUInteger location;
  TSWPDeletionRangeMap *v6;
  TSWPDeletionRangeMap *v7;
  objc_super v9;

  location = a3.location;
  v9.receiver = self;
  v9.super_class = (Class)TSWPDeletionRangeMap;
  v6 = -[TSWPDeletionRangeMap init](&v9, sel_init, a3.location, a3.length);
  v7 = v6;
  if (v6)
  {
    v6->_subRangeStart = location;
    v6->_removedRanges = (TSWPRangeArray *)objc_msgSend(a4, "copy");
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPDeletionRangeMap;
  -[TSWPDeletionRangeMap dealloc](&v3, sel_dealloc);
}

- (unint64_t)mappedCharIndex:(unint64_t)a3
{
  unint64_t v3;
  TSWPRangeArray *removedRanges;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  if (self->_subRangeStart > a3)
    return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  removedRanges = self->_removedRanges;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __40__TSWPDeletionRangeMap_mappedCharIndex___block_invoke;
  v8[3] = &unk_24D82D650;
  v8[4] = &v9;
  v8[5] = a3;
  -[TSWPRangeArray enumerateRangesUsingBlock:](removedRanges, "enumerateRangesUsingBlock:", v8);
  v3 = a3 - self->_subRangeStart - *((unsigned int *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v3;
}

uint64_t __40__TSWPDeletionRangeMap_mappedCharIndex___block_invoke(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  unint64_t v5;

  v5 = *(_QWORD *)(result + 40);
  if (v5 <= a2)
  {
    *a5 = 1;
  }
  else if (a2 + a3 <= v5)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a3;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v5 - a2;
  }
  return result;
}

- (unint64_t)unmappedCharIndex:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  int v9;

  v4 = self->_subRangeStart + a3;
  v5 = -[TSWPRangeArray rangeCount](self->_removedRanges, "rangeCount");
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    do
    {
      if (-[TSWPRangeArray rangeAtIndex:](self->_removedRanges, "rangeAtIndex:", v7) - (unint64_t)v8 > v4)
        break;
      v8 += v9;
      ++v7;
    }
    while (v6 != v7);
  }
  else
  {
    v8 = 0;
  }
  return v4 + v8;
}

- (_NSRange)mappedCharRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v6 = -[TSWPDeletionRangeMap mappedCharIndex:](self, "mappedCharIndex:");
  v7 = -[TSWPDeletionRangeMap mappedCharIndex:](self, "mappedCharIndex:", location + length);
  if (v6 <= v7)
    v8 = v7;
  else
    v8 = v6;
  if (v6 < v7)
    v7 = v6;
  v9 = v8 - v7;
  result.length = v9;
  result.location = v7;
  return result;
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
  v6 = -[TSWPDeletionRangeMap unmappedCharIndex:](self, "unmappedCharIndex:");
  v7 = v6;
  if (length)
    v8 = -[TSWPDeletionRangeMap unmappedCharIndex:](self, "unmappedCharIndex:", length + location - 1) + 1;
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

- (void)adjustByDelta:(int64_t)a3
{
  TSWPRangeArray *removedRanges;
  unint64_t subRangeStart;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _NSRange *v10;

  subRangeStart = self->_subRangeStart;
  removedRanges = self->_removedRanges;
  self->_subRangeStart = subRangeStart + a3;
  v7 = -[TSWPRangeArray rangeCount](removedRanges, "rangeCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      v10 = -[TSWPRangeArray rangeReferenceAtIndex:](self->_removedRanges, "rangeReferenceAtIndex:", i);
      v10->location += a3;
    }
  }
}

- (id)inverseRangesInStorageRange:(_NSRange)a3
{
  TSWPRangeArray *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  _NSRange *v8;

  v4 = -[TSWPRangeArray initWithRange:]([TSWPRangeArray alloc], "initWithRange:", a3.location, a3.length);
  v5 = -[TSWPRangeArray rangeCount](self->_removedRanges, "rangeCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      v8 = -[TSWPRangeArray rangeReferenceAtIndex:](self->_removedRanges, "rangeReferenceAtIndex:", i);
      -[TSWPRangeArray removeRange:](v4, "removeRange:", v8->location, v8->length);
    }
  }
  return v4;
}

- (BOOL)containsCharIndex:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;

  if (self->_subRangeStart <= a3)
  {
    v3 = -[TSWPRangeArray rangeCount](self->_removedRanges, "rangeCount");
    if (v3)
    {
      v6 = 0;
      v7 = v3 - 1;
      do
      {
        v9 = -[TSWPRangeArray rangeAtIndex:](self->_removedRanges, "rangeAtIndex:", v6);
        v10 = a3 < v9 || a3 - v9 >= v8;
        LOBYTE(v3) = !v10;
        if (!v10)
          break;
      }
      while (a3 > v9 && v7 != v6++);
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

@end
