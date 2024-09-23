@implementation VKTextRange

- (VKTextRange)initWithStart:(id)a3 end:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;

  v6 = a4;
  v7 = objc_msgSend(a3, "offset");
  v8 = objc_msgSend(v6, "offset");

  return -[VKTextRange initWithStartOffset:endOffset:](self, "initWithStartOffset:endOffset:", v7, v8);
}

- (VKTextRange)initWithStartOffset:(unint64_t)a3 endOffset:(unint64_t)a4
{
  VKTextRange *v6;
  VKTextRange *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSIndexSet *indexSet;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VKTextRange;
  v6 = -[VKTextRange init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a3 >= a4)
      v8 = a4;
    else
      v8 = a3;
    if (a3 <= a4)
      v9 = a4;
    else
      v9 = a3;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL || v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9 == v8)
      {
        v6->_emptyIndex = v8;
        return v7;
      }
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    indexSet = v7->_indexSet;
    v7->_indexSet = (NSIndexSet *)v10;

  }
  return v7;
}

- (VKTextRange)initWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  VKTextRange *v5;
  uint64_t v6;
  NSIndexSet *indexSet;
  objc_super v9;

  length = a3.length;
  location = a3.location;
  v9.receiver = self;
  v9.super_class = (Class)VKTextRange;
  v5 = -[VKTextRange init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", location, length);
    v6 = objc_claimAutoreleasedReturnValue();
    indexSet = v5->_indexSet;
    v5->_indexSet = (NSIndexSet *)v6;

    if (!length)
      -[VKTextRange setEmptyIndex:](v5, "setEmptyIndex:", location);
  }
  return v5;
}

- (VKTextRange)initWithIndexSet:(id)a3
{
  id v4;
  VKTextRange *v5;
  uint64_t v6;
  NSIndexSet *indexSet;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKTextRange;
  v5 = -[VKTextRange init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    indexSet = v5->_indexSet;
    v5->_indexSet = (NSIndexSet *)v6;

  }
  return v5;
}

+ (VKTextRange)rangeWithStart:(id)a3 end:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStart:end:", v7, v6);

  return (VKTextRange *)v8;
}

+ (VKTextRange)rangeWithStartOffset:(unint64_t)a3 endOffset:(unint64_t)a4
{
  return (VKTextRange *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithStartOffset:endOffset:", a3, a4);
}

+ (id)emptyRangeWithPosition:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStart:end:", v4, v4);

  return v5;
}

+ (id)emptyRangeWithOffset:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRange:", a3, 0);
}

+ (VKTextRange)rangeWithNSRange:(_NSRange)a3
{
  return (VKTextRange *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithRange:", a3.location, a3.length);
}

+ (VKTextRange)rangeWithNSRanges:(id)a3
{
  id v3;
  VKTextRange *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  VKTextRange *v8;
  id v9;
  _QWORD v11[4];
  id v12;

  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    v4 = [VKTextRange alloc];
    objc_msgSend(v3, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "rangeValue");
    v8 = -[VKTextRange initWithRange:](v4, "initWithRange:", v6, v7);
  }
  else
  {
    if ((unint64_t)objc_msgSend(v3, "count") < 2)
    {
      +[VKTextRange emptyRange](VKTextRange, "emptyRange");
      v8 = (VKTextRange *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v9 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __33__VKTextRange_rangeWithNSRanges___block_invoke;
    v11[3] = &unk_1E94632B8;
    v12 = v9;
    v5 = v9;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v11);
    v8 = -[VKTextRange initWithIndexSet:]([VKTextRange alloc], "initWithIndexSet:", v5);

  }
LABEL_7:

  return v8;
}

uint64_t __33__VKTextRange_rangeWithNSRanges___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(a2, "rangeValue");
  return objc_msgSend(v2, "addIndexesInRange:", v3, v4);
}

+ (VKTextRange)rangeWithVKRanges:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  VKTextRange *v8;
  VKTextRange *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4 == 1)
  {
    objc_msgSend(v3, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v9 = (VKTextRange *)v5;
    goto LABEL_9;
  }
  if (v4 < 2)
  {
    +[VKTextRange emptyRange](VKTextRange, "emptyRange");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0x7FFFFFFFFFFFFFFFLL;
  v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __33__VKTextRange_rangeWithVKRanges___block_invoke;
  v14 = &unk_1E94632E0;
  v7 = v6;
  v15 = v7;
  v16 = &v17;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v11);
  v8 = [VKTextRange alloc];
  v9 = -[VKTextRange initWithIndexSet:](v8, "initWithIndexSet:", v7, v11, v12, v13, v14);
  if (-[VKTextRange isEmpty](v9, "isEmpty"))
    -[VKTextRange setEmptyIndex:](v9, "setEmptyIndex:", v18[3]);

  _Block_object_dispose(&v17, 8);
LABEL_9:

  return v9;
}

void __33__VKTextRange_rangeWithVKRanges___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v4, "nsRange");
  objc_msgSend(v3, "addIndexesInRange:", v5, v6);
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v8 = objc_msgSend(v4, "startOffset");

  if (v7 >= v8)
    v9 = v8;
  else
    v9 = v7;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
}

- (BOOL)containsTextPosition:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  if (!a3)
    return 0;
  v4 = a3;
  -[VKTextRange indexSet](self, "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "offset");

  LOBYTE(v4) = objc_msgSend(v5, "containsIndex:", v6);
  return (char)v4;
}

+ (VKTextRange)emptyRange
{
  return objc_alloc_init(VKTextRange);
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[VKTextRange indexSet](self, "indexSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (BOOL)containsMultipleRanges
{
  return -[VKTextRange rangeCount](self, "rangeCount") > 1;
}

- (_NSRange)nsRange
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  -[VKTextRange nsRangeArray](self, "nsRangeArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "rangeValue");

    objc_msgSend(v3, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "rangeValue");
    v9 = v8;

    v10 = v9 - v5 + v7;
  }
  else
  {
    v5 = -[VKTextRange emptyIndex](self, "emptyIndex");
    v10 = 0;
  }

  v11 = v5;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

- (NSArray)nsRangeArray
{
  void *v3;
  NSArray *v4;
  NSArray *nsRangeArray;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (!self->_nsRangeArray)
  {
    if (-[VKTextRange isEmpty](self, "isEmpty"))
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", -[VKTextRange emptyIndex](self, "emptyIndex"), 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[VKTextRange indexSet](self, "indexSet");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "vk_rangeArray");
      v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    nsRangeArray = self->_nsRangeArray;
    self->_nsRangeArray = v4;

  }
  return self->_nsRangeArray;
}

- (NSArray)rangeArray
{
  NSArray *rangeArray;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  rangeArray = self->_rangeArray;
  if (!rangeArray)
  {
    -[VKTextRange nsRangeArray](self, "nsRangeArray");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vk_map:", &__block_literal_global_6);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_rangeArray;
    self->_rangeArray = v5;

    rangeArray = self->_rangeArray;
  }
  return rangeArray;
}

VKTextRange *__25__VKTextRange_rangeArray__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(a2, "rangeValue");
  return +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v2, v3);
}

- (VKTextPosition)start
{
  return +[VKTextPosition positionWithOffset:](VKTextPosition, "positionWithOffset:", -[VKTextRange nsRange](self, "nsRange"));
}

- (VKTextPosition)end
{
  uint64_t v2;
  uint64_t v3;

  v2 = -[VKTextRange nsRange](self, "nsRange");
  return +[VKTextPosition positionWithOffset:](VKTextPosition, "positionWithOffset:", v2 + v3);
}

- (BOOL)isNSNotFound
{
  void *v3;
  BOOL v4;

  -[VKTextRange indexSet](self, "indexSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "firstIndex") == 0x7FFFFFFFFFFFFFFFLL
    || -[NSIndexSet lastIndex](self->_indexSet, "lastIndex") == 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (unint64_t)endOffset
{
  uint64_t v2;
  uint64_t v3;

  v2 = -[VKTextRange nsRange](self, "nsRange");
  return v2 + v3;
}

- (unint64_t)totalLength
{
  unint64_t v2;

  -[VKTextRange nsRange](self, "nsRange");
  return v2;
}

- (unint64_t)rangeCount
{
  void *v2;
  unint64_t v3;

  -[VKTextRange indexSet](self, "indexSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeCount");

  return v3;
}

- (unint64_t)length
{
  void *v2;
  unint64_t v3;

  -[VKTextRange indexSet](self, "indexSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)intersectsNSRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;

  length = a3.length;
  location = a3.location;
  -[VKTextRange indexSet](self, "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(length) = objc_msgSend(v5, "intersectsIndexesInRange:", location, length);

  return length;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (objc_msgSend(v4, "isEmpty") && -[VKTextRange isEmpty](self, "isEmpty"))
    {
      v5 = -[VKTextRange emptyIndex](self, "emptyIndex");
      v6 = v5 == objc_msgSend(v4, "emptyIndex");
    }
    else
    {
      -[VKTextRange indexSet](self, "indexSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "indexSet");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isEqualToIndexSet:", v8);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VKTextRange indexSet](self, "indexSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)summaryDescription
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  NSRange v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[VKTextRange startOffset](self, "startOffset");
  v5 = -[VKTextRange endOffset](self, "endOffset");
  v9.location = -[VKTextRange nsRange](self, "nsRange");
  NSStringFromRange(v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Start: %ld End:%ld Range: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setNsRangeArray:(id)a3
{
  objc_storeStrong((id *)&self->_nsRangeArray, a3);
}

- (void)setRangeArray:(id)a3
{
  objc_storeStrong((id *)&self->_rangeArray, a3);
}

- (NSIndexSet)indexSet
{
  return self->_indexSet;
}

- (void)setIndexSet:(id)a3
{
  objc_storeStrong((id *)&self->_indexSet, a3);
}

- (int64_t)emptyIndex
{
  return self->_emptyIndex;
}

- (void)setEmptyIndex:(int64_t)a3
{
  self->_emptyIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexSet, 0);
  objc_storeStrong((id *)&self->_rangeArray, 0);
  objc_storeStrong((id *)&self->_nsRangeArray, 0);
}

@end
