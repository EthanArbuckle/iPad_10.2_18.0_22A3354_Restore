@implementation TSWPRangeArray

- (TSWPRangeArray)init
{
  TSWPRangeArray *v2;
  _QWORD *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPRangeArray;
  v2 = -[TSWPRangeArray init](&v5, sel_init);
  if (v2)
  {
    v3 = (_QWORD *)operator new();
    v3[1] = 0;
    v3[2] = 0;
    *v3 = 0;
    v2->_rangeVectorOpaque = v3;
  }
  return v2;
}

- (TSWPRangeArray)initWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  TSWPRangeArray *v5;
  TSWPRangeArray *v6;
  void *rangeVectorOpaque;
  NSUInteger *v8;
  unint64_t v9;
  _QWORD *v10;
  NSUInteger *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  NSUInteger *v17;
  char *v18;

  length = a3.length;
  location = a3.location;
  v5 = -[TSWPRangeArray init](self, "init");
  v6 = v5;
  if (v5)
  {
    rangeVectorOpaque = v5->_rangeVectorOpaque;
    v8 = (NSUInteger *)*((_QWORD *)rangeVectorOpaque + 1);
    v9 = *((_QWORD *)rangeVectorOpaque + 2);
    if ((unint64_t)v8 >= v9)
    {
      v11 = *(NSUInteger **)rangeVectorOpaque;
      v12 = ((uint64_t)v8 - *(_QWORD *)rangeVectorOpaque) >> 4;
      v13 = v12 + 1;
      if ((unint64_t)(v12 + 1) >> 60)
        abort();
      v14 = v9 - (_QWORD)v11;
      if (v14 >> 3 > v13)
        v13 = v14 >> 3;
      if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0)
        v15 = 0xFFFFFFFFFFFFFFFLL;
      else
        v15 = v13;
      if (v15)
      {
        v16 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)rangeVectorOpaque + 16, v15);
        v11 = *(NSUInteger **)rangeVectorOpaque;
        v8 = (NSUInteger *)*((_QWORD *)rangeVectorOpaque + 1);
      }
      else
      {
        v16 = 0;
      }
      v17 = (NSUInteger *)&v16[16 * v12];
      v18 = &v16[16 * v15];
      *v17 = location;
      v17[1] = length;
      v10 = v17 + 2;
      if (v8 != v11)
      {
        do
        {
          *((_OWORD *)v17 - 1) = *((_OWORD *)v8 - 1);
          v17 -= 2;
          v8 -= 2;
        }
        while (v8 != v11);
        v11 = *(NSUInteger **)rangeVectorOpaque;
      }
      *(_QWORD *)rangeVectorOpaque = v17;
      *((_QWORD *)rangeVectorOpaque + 1) = v10;
      *((_QWORD *)rangeVectorOpaque + 2) = v18;
      if (v11)
        operator delete(v11);
    }
    else
    {
      *v8 = location;
      v8[1] = length;
      v10 = v8 + 2;
    }
    *((_QWORD *)rangeVectorOpaque + 1) = v10;
  }
  return v6;
}

- (TSWPRangeArray)initWithRangeVector:(const void *)a3
{
  TSWPRangeArray *v4;
  _QWORD *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWPRangeArray;
  v4 = -[TSWPRangeArray init](&v7, sel_init);
  if (v4)
  {
    v5 = (_QWORD *)operator new();
    std::vector<CGPoint>::vector(v5, (uint64_t)a3);
    v4->_rangeVectorOpaque = v5;
  }
  return v4;
}

- (void)dealloc
{
  void **rangeVectorOpaque;
  void *v4;
  objc_super v5;

  rangeVectorOpaque = (void **)self->_rangeVectorOpaque;
  if (rangeVectorOpaque)
  {
    v4 = *rangeVectorOpaque;
    if (*rangeVectorOpaque)
    {
      rangeVectorOpaque[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x219A153B8](rangeVectorOpaque, 0x20C40960023A9);
  }
  v5.receiver = self;
  v5.super_class = (Class)TSWPRangeArray;
  -[TSWPRangeArray dealloc](&v5, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TSWPRangeArray initWithRangeVector:](+[TSWPRangeArray allocWithZone:](TSWPRangeArray, "allocWithZone:", a3), "initWithRangeVector:", self->_rangeVectorOpaque);
}

- (unint64_t)rangeCount
{
  return (uint64_t)(*((_QWORD *)self->_rangeVectorOpaque + 1) - *(_QWORD *)self->_rangeVectorOpaque) >> 4;
}

- (_NSRange)rangeAtIndex:(unint64_t)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v7;
  uint64_t v8;
  NSUInteger *v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  v4 = *(_QWORD *)self->_rangeVectorOpaque;
  v5 = (*((_QWORD *)self->_rangeVectorOpaque + 1) - v4) >> 4;
  if (v5 <= a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRangeArray rangeAtIndex:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRangeArray.mm"), 83, CFSTR("Bogus range index"));
    v4 = *(_QWORD *)self->_rangeVectorOpaque;
    v5 = (*((_QWORD *)self->_rangeVectorOpaque + 1) - v4) >> 4;
  }
  if (v5 <= a3)
  {
    v11 = 0;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = (NSUInteger *)(v4 + 16 * a3);
    v10 = *v9;
    v11 = v9[1];
  }
  result.length = v11;
  result.location = v10;
  return result;
}

- (BOOL)isEmpty
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)self->_rangeVectorOpaque;
  v3 = (*((_QWORD *)self->_rangeVectorOpaque + 1) - v2) >> 4;
  if (!v3)
    return 1;
  if (v3 == 1)
    return *(_QWORD *)(v2 + 8) == 0;
  return 0;
}

- (unint64_t)finish
{
  unint64_t **rangeVectorOpaque;

  rangeVectorOpaque = (unint64_t **)self->_rangeVectorOpaque;
  if (*rangeVectorOpaque == rangeVectorOpaque[1])
    return 0;
  else
    return **rangeVectorOpaque;
}

- (unint64_t)start
{
  uint64_t *rangeVectorOpaque;
  uint64_t v3;
  uint64_t v4;

  rangeVectorOpaque = (uint64_t *)self->_rangeVectorOpaque;
  v4 = *rangeVectorOpaque;
  v3 = rangeVectorOpaque[1];
  if (v4 == v3)
    return 0;
  else
    return *(_QWORD *)(v3 - 8) + *(_QWORD *)(v3 - 16);
}

- (void)addRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  TSWPRangeVector::addRange((TSWPRangeVector *)self->_rangeVectorOpaque, &v3);
}

- (_NSRange)rangeReferenceAtIndex:(unint64_t)a3
{
  return (_NSRange *)(*(_QWORD *)self->_rangeVectorOpaque + 16 * a3);
}

- (void)removeRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  TSWPRangeVector::removeRange((TSWPRangeVector *)self->_rangeVectorOpaque, &v3);
}

- (void)enumerateRangesUsingBlock:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  char v11;

  v11 = 0;
  v5 = -[TSWPRangeArray rangeCount](self, "rangeCount");
  if (v5)
  {
    v6 = v5;
    v7 = 1;
    do
    {
      v8 = -[TSWPRangeArray rangeAtIndex:](self, "rangeAtIndex:", v7 - 1);
      (*((void (**)(id, uint64_t, uint64_t, unint64_t, char *))a3 + 2))(a3, v8, v9, v7 - 1, &v11);
      if (v11)
        v10 = 1;
      else
        v10 = v7 >= v6;
      ++v7;
    }
    while (!v10);
  }
}

- (void)enumerateRangesInRange:(_NSRange)a3 usingBlock:(id)a4
{
  _QWORD v4[6];
  _NSRange v5;
  _QWORD v6[3];
  char v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v7 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __52__TSWPRangeArray_enumerateRangesInRange_usingBlock___block_invoke;
  v4[3] = &unk_24D82D1B0;
  v5 = a3;
  v4[4] = a4;
  v4[5] = v6;
  -[TSWPRangeArray enumerateRangesUsingBlock:](self, "enumerateRangesUsingBlock:", v4);
  _Block_object_dispose(v6, 8);
}

NSUInteger __52__TSWPRangeArray_enumerateRangesInRange_usingBlock___block_invoke(NSRange *a1, NSRange range2, uint64_t a3, _BYTE *a4)
{
  NSUInteger result;
  NSRange v7;
  uint64_t v8;

  v7 = NSIntersectionRange(a1[3], range2);
  result = v7.location;
  v8 = *(_QWORD *)(a1[2].length + 8);
  if (v7.length)
  {
    *(_BYTE *)(v8 + 24) = 1;
    return (*(uint64_t (**)(void))(a1[2].location + 16))();
  }
  else
  {
    *a4 = *(_BYTE *)(v8 + 24);
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<(TSWPRangeArray*) %p> , %@"), self, TSWPRangeVector::description((TSWPRangeVector *)self->_rangeVectorOpaque));
}

@end
