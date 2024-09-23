@implementation VMUNonOverlappingRangeArray

- (void)addOrExtendRange:(_VMURange)a3
{
  unint64_t length;
  unint64_t location;
  unsigned int count;
  _VMURange *v7;
  unint64_t v8;
  uint64_t v9;
  _VMURange *v10;
  unint64_t v11;
  objc_super v12;

  length = a3.length;
  location = a3.location;
  count = self->super._count;
  if (!count)
    goto LABEL_5;
  v7 = &self->super._ranges[count - 1];
  v8 = v7->location;
  v9 = v7->length;
  if (VMURangeContainsRange(v7->location, v9, a3.location, a3.length))
    return;
  if (VMURangeIntersectsOrAbutsRange(location, length, v8, v9))
  {
    v10 = &self->super._ranges[self->super._count - 1];
    v10->location = VMUUnionRange(location, length, v8);
    v10->length = v11;
  }
  else
  {
LABEL_5:
    v12.receiver = self;
    v12.super_class = (Class)VMUNonOverlappingRangeArray;
    -[VMURangeArray addRange:](&v12, sel_addRange_, location, length);
  }
}

- (void)sortAndMergeRanges
{
  _VMURange *ranges;
  uint64_t count;
  unint64_t *p_length;
  objc_super v6;

  if (!self->super._sorted)
  {
    v6.receiver = self;
    v6.super_class = (Class)VMUNonOverlappingRangeArray;
    -[VMURangeArray sort](&v6, sel_sort);
  }
  ranges = self->super._ranges;
  count = self->super._count;
  self->super._count = 0;
  self->super._max = 8;
  self->super._ranges = (_VMURange *)malloc_type_malloc(0x80uLL, 0x1000040451B5BE8uLL);
  if ((_DWORD)count)
  {
    p_length = &ranges->length;
    do
    {
      -[VMUNonOverlappingRangeArray addOrExtendRange:](self, "addOrExtendRange:", *(p_length - 1), *p_length);
      p_length += 2;
      --count;
    }
    while (count);
  }
  free(ranges);
}

- (void)mergeRange:(_VMURange)a3
{
  unint64_t length;
  unint64_t location;
  unsigned int count;
  unsigned int v7;
  unsigned int v8;
  _VMURange *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  length = a3.length;
  location = a3.location;
  if (!self->super._sorted)
    -[VMURangeArray sort](self, "sort");
  count = self->super._count;
  if (count)
  {
    v7 = 0;
    while (1)
    {
      v8 = v7 + (count >> 1);
      v9 = &self->super._ranges[v8];
      v10 = v9->location;
      v11 = v9->length;
      if (v9->location == location && v11 == length)
        break;
      if (VMURangeIntersectsRange(location, length + 1, v9->location, v11 + 1))
      {
        v13 = VMUUnionRange(v10, v11, location);
        v15 = v14;
        RangeArrayRemoveRangeAtIndex(self, v7 + (count >> 1));
        -[VMUNonOverlappingRangeArray mergeRange:](self, "mergeRange:", v13, v15);
        return;
      }
      if (location >= v10)
        count += ~(count >> 1);
      else
        count >>= 1;
      if (location >= v10)
        v7 = v8 + 1;
      if (!count)
        goto LABEL_18;
    }
  }
  else
  {
    v7 = 0;
LABEL_18:
    RangeArrayInsertRangeAtIndex(self, location, length, v7);
  }
}

- (void)mergeRanges:(id)a3
{
  int v3;
  unsigned int v6;
  uint64_t v7;
  _QWORD *v8;

  v3 = *((_DWORD *)a3 + 2);
  if (v3)
  {
    v6 = v3 - 1;
    do
    {
      v7 = v6;
      v8 = (_QWORD *)(*((_QWORD *)a3 + 2) + 16 * v6);
      -[VMUNonOverlappingRangeArray mergeRange:](self, "mergeRange:", *v8, v8[1]);
      --v6;
    }
    while (v7);
  }
}

- (void)mergeRange:(_VMURange)a3 excludingRanges:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend(a4, "subrangeNotExcludedBySelfForRange:", a3.location, a3.length);
  if (v6)
    -[VMUNonOverlappingRangeArray mergeRange:](self, "mergeRange:", v5, v6);
}

- (void)mergeRanges:(id)a3 excludingRanges:(id)a4
{
  int v4;
  unsigned int v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *((_DWORD *)a3 + 2);
  if (v4)
  {
    v8 = v4 - 1;
    do
    {
      v9 = v8;
      v10 = (_QWORD *)(*((_QWORD *)a3 + 2) + 16 * v8);
      -[VMUNonOverlappingRangeArray mergeRange:excludingRanges:](self, "mergeRange:excludingRanges:", *v10, v10[1], a4);
      --v8;
    }
    while (v9);
  }
}

- (void)_mergeAllBitsOfRange:(_VMURange)a3 excludingRanges:(id)a4 mergeRanges:(BOOL)a5
{
  _BOOL8 v5;
  unint64_t length;
  unint64_t location;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unsigned int *v16;

  v5 = a5;
  length = a3.length;
  location = a3.location;
  v9 = (unsigned int *)a4;
  if (length)
  {
    v16 = v9;
    v10 = 16 * v9[2];
    while (1)
    {
      v11 = v10 - 16;
      if (!v10)
        break;
      v12 = VMUIntersectionRange(location, length, *(_QWORD *)(*((_QWORD *)v16 + 2) + v10 - 16), *(_QWORD *)(*((_QWORD *)v16 + 2) + v10 - 8));
      v10 = v11;
      if (v13)
      {
        v14 = v12;
        v15 = v13;
        -[VMUNonOverlappingRangeArray _mergeAllBitsOfRange:excludingRanges:mergeRanges:](self, "_mergeAllBitsOfRange:excludingRanges:mergeRanges:", location, v12 - location, v16, v5);
        -[VMUNonOverlappingRangeArray _mergeAllBitsOfRange:excludingRanges:mergeRanges:](self, "_mergeAllBitsOfRange:excludingRanges:mergeRanges:", v14 + v15, location + length - (v14 + v15), v16, v5);
        goto LABEL_9;
      }
    }
    if (v5)
      -[VMUNonOverlappingRangeArray mergeRange:](self, "mergeRange:", location, length);
    else
      -[VMURangeArray addRange:](self, "addRange:", location, length);
LABEL_9:
    v9 = v16;
  }

}

- (id)subtract:(id)a3 mergeRanges:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  if (self->super._count)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      ++v9;
      objc_msgSend(v7, "_mergeAllBitsOfRange:excludingRanges:mergeRanges:", self->super._ranges[v8].location, self->super._ranges[v8].length, v6, v4);
      ++v8;
    }
    while (v9 < self->super._count);
  }

  return v7;
}

@end
