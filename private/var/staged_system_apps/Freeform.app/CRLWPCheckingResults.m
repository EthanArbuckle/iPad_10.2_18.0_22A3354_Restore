@implementation CRLWPCheckingResults

- (CRLWPCheckingResults)init
{
  CRLWPCheckingResults *v2;
  CRLWPMutableRangeArray *v3;
  CRLWPMutableRangeArray *ranges;
  NSMutableArray *v5;
  NSMutableArray *results;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLWPCheckingResults;
  v2 = -[CRLWPCheckingResults init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(CRLWPMutableRangeArray);
    ranges = v2->_ranges;
    v2->_ranges = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    results = v2->_results;
    v2->_results = v5;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  Class v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  objc_opt_class(self, a2);
  v6 = objc_alloc_init(v5);
  v7 = -[CRLWPRangeArray mutableCopyWithZone:](self->_ranges, "mutableCopyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[NSMutableArray mutableCopyWithZone:](self->_results, "mutableCopyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  CRLWPMutableRangeArray **v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class(CRLWPCheckingResults, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (CRLWPMutableRangeArray **)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
    v9 = self->_ranges == v8[1];
  else
    v9 = 0;

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  id v7;
  uint64_t v8;

  v3 = 0xCBF29CE484222325;
  if (-[CRLWPRangeArray rangeCount](self->_ranges, "rangeCount"))
  {
    v4 = 0;
    do
    {
      v7 = 0;
      v8 = 0;
      v7 = -[CRLWPRangeArray rangeAtIndex:](self->_ranges, "rangeAtIndex:", v4, 0, 0);
      v8 = v5;
      v3 = sub_1000BC018((char *)&v7, 16, v3);
      ++v4;
    }
    while (v4 < -[CRLWPRangeArray rangeCount](self->_ranges, "rangeCount"));
  }
  return v3;
}

- (id)results
{
  return self->_results;
}

- (void)clear
{
  -[NSMutableArray removeAllObjects](self->_results, "removeAllObjects");
  -[CRLWPMutableRangeArray clear](self->_ranges, "clear");
}

- (void)removeResultsForRanges:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;

  v16 = a3;
  v4 = -[CRLWPRangeArray rangeCount](self->_ranges, "rangeCount");
  if (v4)
  {
    v5 = v4;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      while (1)
      {
        v8 = v5--;
        v9 = -[CRLWPRangeArray rangeAtIndex:](self->_ranges, "rangeAtIndex:", v5);
        if (!objc_msgSend(v16, "intersectsRange:", v9, v10))
          break;
        if (v7 == 0x7FFFFFFFFFFFFFFFLL)
          v7 = v8;
        v6 = v5;
        if (!v5)
          goto LABEL_16;
      }
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v6 <= v7)
          v11 = v7;
        else
          v11 = v6;
        if (v6 < v7)
          v7 = v6;
        v12 = v11 - v7;
        -[NSMutableArray removeObjectsInRange:](self->_results, "removeObjectsInRange:", v7, v11 - v7);
        -[CRLWPMutableRangeArray removeRangesInRange:](self->_ranges, "removeRangesInRange:", v7, v12);
        v7 = 0x7FFFFFFFFFFFFFFFLL;
      }
      v6 = 0x7FFFFFFFFFFFFFFFLL;
    }
    while (v5);
LABEL_16:
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v6 <= v7)
        v13 = v7;
      else
        v13 = v6;
      if (v6 >= v7)
        v14 = v7;
      else
        v14 = v6;
      v15 = v13 - v14;
      -[NSMutableArray removeObjectsInRange:](self->_results, "removeObjectsInRange:", v14, v13 - v14);
      -[CRLWPMutableRangeArray removeRangesInRange:](self->_ranges, "removeRangesInRange:", v14, v15);
    }
  }

}

- (void)replacedTextAtRange:(_NSRange)a3 amount:(int64_t)a4
{
  id v5;
  uint64_t v6;

  v5 = -[CRLWPMutableRangeArray replacedTextAtRange:delta:](self->_ranges, "replacedTextAtRange:delta:", a3.location, a3.length, a4);
  if (v6)
    -[NSMutableArray removeObjectsInRange:](self->_results, "removeObjectsInRange:", v5, v6);
}

- (void)addResult:(id)a3 forRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  CRLWPMutableRangeArray *ranges;
  id v8;
  id v9;

  length = a4.length;
  location = a4.location;
  ranges = self->_ranges;
  v9 = a3;
  v8 = -[CRLWPRangeArray indexForRange:](ranges, "indexForRange:", location, length);
  -[CRLWPMutableRangeArray insertRange:atIndex:](self->_ranges, "insertRange:atIndex:", location, length, v8);
  -[NSMutableArray insertObject:atIndex:](self->_results, "insertObject:atIndex:", v9, v8);

}

- (CRLWPRangeArray)ranges
{
  return &self->_ranges->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_ranges, 0);
}

@end
