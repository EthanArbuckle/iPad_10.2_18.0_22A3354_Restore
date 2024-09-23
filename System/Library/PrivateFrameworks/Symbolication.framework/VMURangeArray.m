@implementation VMURangeArray

- (VMURangeArray)init
{
  VMURangeArray *v2;
  VMURangeArray *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VMURangeArray;
  v2 = -[VMURangeArray init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_max = 8;
    v2->_count = 0;
    v2->_ranges = (_VMURange *)malloc_type_malloc(0x80uLL, 0x1000040451B5BE8uLL);
    v3->_sorted = 1;
  }
  return v3;
}

- (VMURangeArray)initWithRanges:(const _VMURange *)a3 count:(unsigned int)a4
{
  VMURangeArray *v6;
  VMURangeArray *v7;
  unsigned int v8;
  _VMURange *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VMURangeArray;
  v6 = -[VMURangeArray init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a4 <= 8)
      v8 = 8;
    else
      v8 = a4;
    v6->_max = v8;
    v6->_count = a4;
    v9 = (_VMURange *)malloc_type_malloc(16 * v8, 0x1000040451B5BE8uLL);
    v7->_ranges = v9;
    memmove(v9, a3, 16 * a4);
    v7->_sorted = 0;
  }
  return v7;
}

- (void)dealloc
{
  _VMURange *ranges;
  objc_super v4;

  ranges = self->_ranges;
  if (ranges)
    free(ranges);
  v4.receiver = self;
  v4.super_class = (Class)VMURangeArray;
  -[VMURangeArray dealloc](&v4, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = -[VMURangeArray initWithRanges:count:](+[VMURangeArray allocWithZone:](VMURangeArray, "allocWithZone:", a3), "initWithRanges:count:", self->_ranges, self->_count);
  if (result)
    *((_BYTE *)result + 28) = self->_sorted;
  return result;
}

- (void)setCapacity:(unsigned int)a3
{
  if (self->_max < a3)
  {
    self->_max = a3;
    self->_ranges = (_VMURange *)malloc_type_realloc(self->_ranges, 16 * a3, 0x1000040451B5BE8uLL);
  }
}

- (void)sort
{
  if (!self->_sorted)
  {
    mergesort(self->_ranges, self->_count, 0x10uLL, (int (__cdecl *)(const void *, const void *))compareRange);
    self->_sorted = 1;
  }
}

- (void)addRange:(_VMURange)a3
{
  unint64_t length;
  unint64_t location;
  unsigned int count;
  _VMURange *v6;
  VMURangeArray *v7;
  VMURangeArray *v8;
  unsigned int v9;
  _VMURange *ranges;
  unsigned int v11;
  unint64_t *p_location;
  VMURangeArray *v13;

  length = a3.length;
  location = a3.location;
  if (self->_sorted)
  {
    count = self->_count;
    if (count)
    {
      v6 = &self->_ranges[count - 1];
      if (v6->length + v6->location > a3.location)
        self->_sorted = 0;
    }
  }
  v7 = self;
  v8 = v7;
  v9 = v7->_count;
  if (v9 >= v7->_max)
  {
    v11 = (3 * v9 + 3) >> 1;
    v7->_max = v11;
    v13 = v7;
    ranges = (_VMURange *)malloc_type_realloc(v7->_ranges, 16 * v11, 0x1000040451B5BE8uLL);
    v8 = v13;
    v13->_ranges = ranges;
    v9 = v13->_count;
  }
  else
  {
    ranges = v7->_ranges;
  }
  v8->_count = v9 + 1;
  p_location = &ranges[v9].location;
  *p_location = location;
  p_location[1] = length;

}

- (void)addRanges:(id)a3
{
  uint64_t v3;
  _QWORD *v5;

  if (a3)
  {
    v3 = *((unsigned int *)a3 + 2);
    if ((_DWORD)v3)
    {
      v5 = (_QWORD *)(*((_QWORD *)a3 + 2) + 8);
      do
      {
        -[VMURangeArray addRange:](self, "addRange:", *(v5 - 1), *v5);
        v5 += 2;
        --v3;
      }
      while (v3);
    }
  }
}

- (_VMURange)rangeAtIndex:(unsigned int)a3
{
  _VMURange *v3;
  unint64_t location;
  unint64_t length;
  _VMURange result;

  if (self->_count <= a3)
  {
    location = 0;
    length = 0;
  }
  else
  {
    v3 = &self->_ranges[a3];
    location = v3->location;
    length = v3->length;
  }
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)indexForLocation:(unint64_t)a3
{
  _BOOL4 sorted;
  unint64_t result;
  uint64_t v6;
  _VMURange *ranges;
  uint64_t v8;
  _VMURange *v9;
  unint64_t i;
  _VMURange *v11;

  sorted = self->_sorted;
  result = self->_count;
  if (!sorted)
  {
    for (i = result; i * 16; --i)
    {
      --result;
      v11 = &self->_ranges[i];
      if (a3 - v11[-1].location < v11[-1].length)
        return result;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (!(_DWORD)result)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = 0;
  ranges = self->_ranges;
  while (1)
  {
    v8 = v6 + (result >> 1);
    v9 = &ranges[v8];
    if (a3 - v9->location < v9->length)
      break;
    if (a3 < v9->location)
    {
      result >>= 1;
    }
    else
    {
      v6 = v8 + 1;
      result += ~(result >> 1);
    }
    if (!result)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v6 + (result >> 1);
}

- (_VMURange)rangeForLocation:(unint64_t)a3
{
  unint64_t v3;
  unint64_t v4;
  _VMURange result;

  v3 = -[VMURangeArray rangeAtIndex:](self, "rangeAtIndex:", -[VMURangeArray indexForLocation:](self, "indexForLocation:", a3));
  result.length = v4;
  result.location = v3;
  return result;
}

- (void)insertRange:(_VMURange)a3 atIndex:(unsigned int)a4
{
  RangeArrayInsertRangeAtIndex(self, a3.location, a3.length, a4);
}

- (void)removeRangeAtIndex:(unsigned int)a3
{
  RangeArrayRemoveRangeAtIndex(self, a3);
}

- (void)removeAllRanges
{
  self->_count = 0;
}

- (BOOL)containsLocation:(unint64_t)a3
{
  return -[VMURangeArray indexForLocation:](self, "indexForLocation:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)containsRange:(_VMURange)a3
{
  unint64_t length;
  unint64_t location;
  unint64_t count;
  uint64_t v7;
  uint64_t v8;
  _VMURange *v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  length = a3.length;
  location = a3.location;
  count = self->_count;
  if (self->_sorted)
  {
    if ((_DWORD)count)
    {
      v7 = 0;
      do
      {
        v8 = v7 + (count >> 1);
        v9 = &self->_ranges[v8];
        v10 = v9->location;
        v11 = VMURangeContainsRange(v9->location, v9->length, location, length);
        if (v11)
          break;
        if (location < v10)
        {
          count >>= 1;
        }
        else
        {
          v7 = v8 + 1;
          count += ~(count >> 1);
        }
      }
      while (count);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v12 = 16 * count;
    do
    {
      v13 = v12 - 16;
      v11 = v12 != 0;
      if (!v12)
        break;
      v14 = VMURangeContainsRange(*(unint64_t *)((char *)&self->_ranges[-1].location + v12), *(_QWORD *)((char *)self->_ranges + v12 - 8), location, length);
      v12 = v13;
    }
    while (!v14);
  }
  return v11;
}

- (BOOL)intersectsRange:(_VMURange)a3
{
  unint64_t length;
  unint64_t location;
  unint64_t count;
  uint64_t v7;
  uint64_t v8;
  _VMURange *v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  length = a3.length;
  location = a3.location;
  count = self->_count;
  if (self->_sorted)
  {
    if ((_DWORD)count)
    {
      v7 = 0;
      do
      {
        v8 = v7 + (count >> 1);
        v9 = &self->_ranges[v8];
        v10 = v9->location;
        v11 = VMURangeIntersectsRange(v9->location, v9->length, location, length);
        if (v11)
          break;
        if (location < v10)
        {
          count >>= 1;
        }
        else
        {
          v7 = v8 + 1;
          count += ~(count >> 1);
        }
      }
      while (count);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v12 = 16 * count;
    do
    {
      v13 = v12 - 16;
      v11 = v12 != 0;
      if (!v12)
        break;
      v14 = VMURangeIntersectsRange(*(unint64_t *)((char *)&self->_ranges[-1].location + v12), *(_QWORD *)((char *)self->_ranges + v12 - 8), location, length);
      v12 = v13;
    }
    while (!v14);
  }
  return v11;
}

- (_VMURange)subrangeNotExcludedBySelfForRange:(_VMURange)a3
{
  unint64_t length;
  unint64_t location;
  unsigned int count;
  unsigned int v7;
  _VMURange *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v13;
  unint64_t v14;
  _VMURange result;

  length = a3.length;
  location = a3.location;
  if (a3.length)
  {
    count = self->_count;
    if (count)
    {
      v7 = count - 1;
      while (1)
      {
        v8 = &self->_ranges[v7];
        v9 = VMUIntersectionRange(location, length, v8->location, v8->length);
        if (v9 == location && length == v10)
          break;
        if (v10)
        {
          if (v9 == location)
          {
            location += v10;
            length -= v10;
          }
          else
          {
            length = v9 - location;
          }
        }
        if (!(unint64_t)v7--)
          goto LABEL_15;
      }
      location = 0;
      length = 0;
    }
  }
LABEL_15:
  v13 = location;
  v14 = length;
  result.length = v14;
  result.location = v13;
  return result;
}

- (_VMURange)range
{
  uint64_t count;
  _VMURange *ranges;
  unint64_t location;
  unint64_t v5;
  unint64_t *p_length;
  unint64_t v7;
  unint64_t v8;
  _VMURange result;

  count = self->_count;
  if (self->_sorted)
  {
    if ((_DWORD)count)
    {
      ranges = self->_ranges;
      location = ranges->location;
      v5 = ranges[(count - 1)].length + ranges[(count - 1)].location;
      goto LABEL_13;
    }
LABEL_12:
    v5 = 0;
    location = -1;
    goto LABEL_13;
  }
  if (!(_DWORD)count)
    goto LABEL_12;
  v5 = 0;
  p_length = &self->_ranges->length;
  location = -1;
  do
  {
    v7 = *(p_length - 1);
    if (v7 < location)
      location = *(p_length - 1);
    if (*p_length + v7 > v5)
      v5 = *p_length + v7;
    p_length += 2;
    --count;
  }
  while (count);
LABEL_13:
  v8 = v5 - location;
  result.length = v8;
  result.location = location;
  return result;
}

- (_VMURange)largestRange
{
  unsigned int count;
  unint64_t location;
  unint64_t length;
  _VMURange *ranges;
  unsigned int v7;
  uint64_t v8;
  _VMURange result;

  count = self->_count;
  if (count)
  {
    location = 0;
    length = 0;
    ranges = self->_ranges;
    v7 = count - 1;
    do
    {
      v8 = v7;
      if (ranges[v7].length >= length)
      {
        location = ranges[v7].location;
        length = ranges[v7].length;
      }
      --v7;
    }
    while (v8);
  }
  else
  {
    length = 0;
    location = 0;
  }
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)sumLengths
{
  uint64_t count;
  unint64_t result;
  unint64_t *p_length;
  unint64_t v6;

  count = self->_count;
  if (!(_DWORD)count)
    return 0;
  result = 0;
  p_length = &self->_ranges->length;
  do
  {
    v6 = *p_length;
    p_length += 2;
    result += v6;
    --count;
  }
  while (count);
  return result;
}

- (_VMURange)ranges
{
  return self->_ranges;
}

- (unsigned)count
{
  return self->_count;
}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_sorted)
    v5 = "YES";
  else
    v5 = "NO";
  objc_msgSend(v3, "appendFormat:", CFSTR("_sorted?  %s\n"), v5);
  if (self->_count)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      objc_msgSend(v4, "appendFormat:", CFSTR("[%#qx to %#qx] (length: %qd)\n"), self->_ranges[v6].location, self->_ranges[v6].length + self->_ranges[v6].location, self->_ranges[v6].length);
      ++v7;
      ++v6;
    }
    while (v7 < self->_count);
  }
  return v4;
}

@end
